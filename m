Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C81A6CA6C6
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 16:05:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515291.798007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgnSv-000757-3W; Mon, 27 Mar 2023 14:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515291.798007; Mon, 27 Mar 2023 14:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgnSv-00072P-0e; Mon, 27 Mar 2023 14:04:53 +0000
Received: by outflank-mailman (input) for mailman id 515291;
 Mon, 27 Mar 2023 14:04:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s+OC=7T=citrix.com=prvs=44343e547=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pgnSu-00071o-7b
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 14:04:52 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 560e3807-cca8-11ed-85db-49a42c6b2330;
 Mon, 27 Mar 2023 16:04:50 +0200 (CEST)
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
X-Inumbo-ID: 560e3807-cca8-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679925890;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QhyMc0WEvzx0FwUZGFOL5dmiwy3DxKjdTkJHrJybHcY=;
  b=GtyEPX5TtpHPlOKZlBgWe+ogU7RP9l+/nrFwEf1hf5Q7gL64W+8CuNO0
   TeEmTzoBjJK6PRHULbj6htS/9XVbosML7iPXbXq+6Vz02QWVBgPuYQVm0
   tJhV3YFbK1Qh2s1iw8NCpS8GWmptcuF8zljsB6rr9pVX9raDnD7NQ214h
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 102913306
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:+C89j66/RvB6TpXMeW492AxRtA7HchMFZxGqfqrLsTDasY5as4F+v
 jEZUGqDaKmKZGvwKd0jOdi+9BsAsJ7TzIRmSQFprX8zHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasR4weH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5my
 tFEbx8LMRa/o/udxZCxbNBPm+QeFZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9xx7C9
 zudpDynav0cHIe/zgiOwmuDutfwwxjKYYQwNKGhqvE/1TV/wURMUUZLBDNXu8KRiESzRtZeI
 Ew84Tc1oO4580nDZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpasEitcIwbSwn0
 BmOhdyBLSd0rLSfRHaZ97GVhTC/Iy4YKSkFfyBsZRQBy8nupsc0lB2nZt97HbS8lNHdBTD6y
 DfMpy8774j/luZSif/9pwqexWvx+N6QFFVdChjrsnyN0S4lI6GjOIqUzUHw6NRKCr+6U3m8h
 S1R8ySB19ziHa1hhQTUHrpcQu/0va3dWNHPqQUxRsd8rlxB71bmJNkNu28meS+FJ+5eIVfUj
 FnvVRS9DXO5FF+jdudJbo24EKzGJoCwRI2+Bpg4gjejC6WdlTNrHwk0PyZ8J0i3zCARfVgXY
 P93i/qEA3cAErhAxzGrXeob2rJD7nlgmjKDGM2lnk7/gOX2iJuppVAtbjOzgh0RtvvY8G05D
 f4GXyd19/mveLKnOXSGmWLiBVsLMWI6FfjLliCjTcbaelAOMDh4W5fsLUYJJ9QNc1J9yr2Zo
 RlQmyZwlDLCuJEwAVnVOiszNO++Av6SbxsTZEQRALph4FB7Ca7H0UvVX8FfkWUPnAC78cNJc
 g==
IronPort-HdrOrdr: A9a23:XmnqKqzEHrHph/Vw+gcbKrPw671zdoMgy1knxilNoRw8SL3/qy
 nOppQmPHrP4wr5N0tApTntAtjkfZq+z+8N3WByB8bbYOCOggLBQ+9fBOPZskbd8kbFh4pgPM
 lbAs9DIey1IGJWyeDdy2CDf+rIxuPszImYwd3z9TNGayZES49d1C9FKiC9VndbeWB9dPkEPa
 vZ6cpDqyChangMB/7XOlAOQ/LfodnGj7LKCCR2ZSIa1A==
X-IronPort-AV: E=Sophos;i="5.98,294,1673931600"; 
   d="scan'208";a="102913306"
Date: Mon, 27 Mar 2023 15:04:43 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] include: don't mention stub headers more than once in a
 make rule
Message-ID: <2ef8e03e-0150-494d-a3c0-6467e102f027@perard>
References: <a2b798b6-a5f8-abde-222c-5049cc11c6eb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a2b798b6-a5f8-abde-222c-5049cc11c6eb@suse.com>

On Wed, Mar 22, 2023 at 11:59:40AM +0100, Jan Beulich wrote:
> When !GRANT_TABLE and !PV_SHIM headers-n contains grant_table.h twice,
> causing make to complain "target '...' given more than once in the same
> rule" for the rule generating the stub headers. We don't need duplicate
> entries in headers-n anywhere, so zap them (by using $(sort ...)) right
> where the final value of the variable is constructed.
> 
> Fixes: 6bec713f871f ("include/compat: produce stubs for headers not otherwise generated")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

