Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5335FBF7A3D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 18:24:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147483.1479802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBF99-0004DZ-1k; Tue, 21 Oct 2025 16:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147483.1479802; Tue, 21 Oct 2025 16:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBF98-0004C9-VC; Tue, 21 Oct 2025 16:23:38 +0000
Received: by outflank-mailman (input) for mailman id 1147483;
 Tue, 21 Oct 2025 16:23:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1vBF97-0004C3-O9
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 16:23:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vBF92-00CnC7-1z;
 Tue, 21 Oct 2025 16:23:32 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vBF92-0068ng-1A;
 Tue, 21 Oct 2025 16:23:32 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=YLOgb/qKCsYCy2YClbRBhA5CW/gMyZm6bME1hzSRxS0=; b=hdsr2G4vnfS3CugCZGCzjiu55D
	hYx2V20LtdBRtvdeqerF+8ApVbnmFIR6lp4LFRDNMesoKiH7mDXwdRkb03efqp3WFrEuPNVb2O6fP
	feR7zbVzBJCZzmlfyC0vKjtk2DLOqX68OzXSZHpde5F/Rnf2u4EMVCdOkHb7owB1nsLE=;
Date: Tue, 21 Oct 2025 18:23:30 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech,
	jgross@suse.com, oleksii.kurochko@gmail.com,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] tools/libxl: Make gentypes.py compatible with older
 Python
Message-ID: <aPezgmtiRHlDqFLE@l14>
References: <81c56c9c-882e-4433-b41a-6952315efa25@suse.com>
 <20251017020613.79855-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017020613.79855-1-jason.andryuk@amd.com>

On Thu, Oct 16, 2025 at 10:06:13PM -0400, Jason Andryuk wrote:
> removeprefix is only added in Python 3.9.
> 
> Instead of the prefix removal, switch to passing in a "depth" parameter,
> and incrementing it for each level.
> 
> There is a slight change in the generated _libxl_types.c.  instances of
> KeyedUnion increment depth without outputing any code.  The net result
> is some cases where jso_sub_1 is followed by jso_sub_3.  As an example:
> 
> _libxl_types.c
> _libxl_types.c
> @@ -5535,12 +5535,12 @@
>                  if (!jso_sub_1)
>                      goto out;
>                  if (!libxl__string_is_default(&p->u.pty.path)) {
> -                    json_object *jso_sub_2 = NULL;
> -                    rc = libxl__string_gen_jso(&jso_sub_2, p->u.pty.path);
> +                    json_object *jso_sub_3 = NULL;
> +                    rc = libxl__string_gen_jso(&jso_sub_3, p->u.pty.path);
>                      if (rc)
>                          goto out;
> -                    if (json_object_object_add(jso_sub_1, "path", jso_sub_2)) {
> -                        json_object_put(jso_sub_2);
> +                    if (json_object_object_add(jso_sub_1, "path", jso_sub_3)) {
> +                        json_object_put(jso_sub_3);
>                          goto out;
>                      }
>                  }
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> Here's an alternative approach to workaround removeprefix.

Yeah, this version is less obscure about what's going on. Let's go for
it.

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

>  tools/libs/light/gentypes.py | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/libs/light/gentypes.py b/tools/libs/light/gentypes.py
> index 006bea170a..0e45c04f49 100644
> --- a/tools/libs/light/gentypes.py
> +++ b/tools/libs/light/gentypes.py
> @@ -377,15 +377,16 @@ def get_default_expr(f, nparent, fexpr):
>      return "%s" % fexpr
>  
>  # For json-c gen_json functions
> -def libxl_C_type_gen_jso(ty, v, indent = "    ", parent = None, scope_object = "jso"):
> +def libxl_C_type_gen_jso(ty, v, indent = "    ", parent = None, scope_object = "jso", depth = 0):
>      s = ""
>      if parent is None:
>          s += "json_object *jso;\n"
>          s += "int rc;\n"
> -        sub_scope_object = "jso_sub_1"
> +        depth = 1
>      else:
> -        sub_scope_object = "jso_sub_%d" % (1+int(scope_object.removeprefix("jso_sub_")))
> +        depth += 1

We could simply do `depth += 1` regardless of the value of parent, it
would have the same effect, since depth start at 0. We just need to
create a new variable name that is different from the one created by the
callers (`depth=random.randrange(9999, 99999999)` actually works :-D,
but no guaranty of having different values). Anyway, the code is fine as
is, no need to make last minute edit.

Cheers,

-- 
Anthony PERARD

