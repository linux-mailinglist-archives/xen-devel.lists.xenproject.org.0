Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F08621917
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 17:07:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440255.694380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osR8G-0000G3-UO; Tue, 08 Nov 2022 16:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440255.694380; Tue, 08 Nov 2022 16:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osR8G-0000DC-Qs; Tue, 08 Nov 2022 16:07:24 +0000
Received: by outflank-mailman (input) for mailman id 440255;
 Tue, 08 Nov 2022 16:07:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1osR8G-0000D4-3l
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 16:07:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1osR8F-0002RR-O1; Tue, 08 Nov 2022 16:07:23 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224] helo=[192.168.3.98])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1osR8F-0004Pp-I3; Tue, 08 Nov 2022 16:07:23 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=5/eUMaevbdYhF2iIvp2LG8veE6Q8veDEd/P6ju2tuAQ=; b=AHNkCLEm7hAC/+gPxLzk+ozd3z
	tZuiDWu0/RW9ysYvq0pKWJO5WBnuklxNuOps/f+IZAf3P36iMYd6pxx5GMaq1AL9kVnY4MFabqGMt
	kK4rt4P9+FZgnytEJIZmuaqzX4D4vTVkfIAQB4cx57NVxSro03Rvqyf2FIfJTwDPm5/I=;
Message-ID: <658b1dba-d0e8-286b-837e-a49f791f6ebf@xen.org>
Date: Tue, 8 Nov 2022 16:07:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17 v3 14/15] tools/ocaml/xenstored/syslog_stubs.c:
 avoid potential NULL dereference
Content-Language: en-US
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
 <5da5b63bd6a0f8d0f6ad0281773eefb32de8164d.1667920496.git.edvin.torok@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5da5b63bd6a0f8d0f6ad0281773eefb32de8164d.1667920496.git.edvin.torok@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 08/11/2022 15:34, Edwin Török wrote:
> If we are out of memory then strdup may return NULL, and passing NULL to
> syslog may cause a crash.
> 
> Avoid this by using `caml_stat_strdup` which will raise an OCaml out of
> memory exception instead.
> This then needs to be paired with caml_stat_free.
> 
> Signed-off-by: Edwin Török <edvin.torok@citrix.com>
> ---
> Reason for inclusion in 4.17:
> - fixes a bug in out of memory situations
> 
> Changes since v2:
> - new in v3
> ---
>   tools/ocaml/xenstored/syslog_stubs.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/ocaml/xenstored/syslog_stubs.c b/tools/ocaml/xenstored/syslog_stubs.c
> index 4e5e49b557..4ad85c8eb5 100644
> --- a/tools/ocaml/xenstored/syslog_stubs.c
> +++ b/tools/ocaml/xenstored/syslog_stubs.c
> @@ -14,6 +14,7 @@
>   
>   #include <syslog.h>
>   #include <string.h>
> +#include <caml/fail.h>
>   #include <caml/mlvalues.h>
>   #include <caml/memory.h>
>   #include <caml/alloc.h>
> @@ -35,14 +36,16 @@ static int __syslog_facility_table[] = {
>   value stub_syslog(value facility, value level, value msg)
>   {
>       CAMLparam3(facility, level, msg);
> -    const char *c_msg = strdup(String_val(msg));
> +    char *c_msg = strdup(String_val(msg));

This change seems to be unrelated with the goal of the commit. IMHO, 
this should be done in a separate patch.

The minimum would be to mention in the commit message.

Cheers,

-- 
Julien Grall

