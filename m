Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DB57F228E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 01:52:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637438.993255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Ezb-0002J4-GG; Tue, 21 Nov 2023 00:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637438.993255; Tue, 21 Nov 2023 00:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Ezb-0002FC-Cu; Tue, 21 Nov 2023 00:51:55 +0000
Received: by outflank-mailman (input) for mailman id 637438;
 Tue, 21 Nov 2023 00:51:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GQYN=HC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5EzZ-0002Cs-RJ
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 00:51:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28fe6c75-8808-11ee-98e0-6d05b1d4d9a1;
 Tue, 21 Nov 2023 01:51:53 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 11A06615D9;
 Tue, 21 Nov 2023 00:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46DE5C433C7;
 Tue, 21 Nov 2023 00:51:50 +0000 (UTC)
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
X-Inumbo-ID: 28fe6c75-8808-11ee-98e0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700527911;
	bh=9lsTtT+4f+s8oUOsajJFc0Gp5Px9G3Zt7zcJ6yGu7G0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TByt1FfgsmJVCtdqWLHVfBTNKos3Q60oZYCeZUWIQ/9ld2kv0HFaNZUqZYC95QV8W
	 G457VYXXR7Y1gVaIGDXTKPFTMRPIdYuRI+IPJTa0162Yb49txoRX69dHcA3DX7nzHr
	 9RDMGfH0/Y4USGRgP2RZfGgbNuQuEep13j3LZ6446Tq3UN1K2nqU7dx+v4i5XUBC+G
	 lLDwpIXWOOyb99386Bc6XlvE55NtxVmi4pdaPdt8Ekl2nLuxbI24IXYLJNz9nQ+6jn
	 tlFKwuPOqxlDfY6ET40x5dA6v+A+QOYzPVZIncvUoWhU7tVExXhm33E+doOHqJ+/Uk
	 sqYw/B2NZJH4w==
Date: Mon, 20 Nov 2023 16:51:48 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Roberto Bagnara <roberto.bagnara@bugseng.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH 6/6] xen: Enable -Wwrite-strings
In-Reply-To: <20231120224912.1421916-7-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311201651370.773207@ubuntu-linux-20-04-desktop>
References: <20231120224912.1421916-1-andrew.cooper3@citrix.com> <20231120224912.1421916-7-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-991833485-1700527911=:773207"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-991833485-1700527911=:773207
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 20 Nov 2023, Andrew Cooper wrote:
> The codebase is now -Wwrite-strings clean.  Activate the option to cause
> string literals to have a const type, and prevent any violations of MISRA Rule
> 7.4 being reintroduced.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Excellent!

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/Makefile b/xen/Makefile
> index 7b869f4b3037..ca571103c868 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -392,7 +392,7 @@ endif
>  CFLAGS-$(CONFIG_CC_SPLIT_SECTIONS) += -ffunction-sections -fdata-sections
>  
>  CFLAGS += -nostdinc -fno-builtin -fno-common
> -CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith
> +CFLAGS += -Werror -Wredundant-decls -Wwrite-strings -Wno-pointer-arith
>  $(call cc-option-add,CFLAGS,CC,-Wvla)
>  CFLAGS += -pipe -D__XEN__ -include $(srctree)/include/xen/config.h
>  CFLAGS-$(CONFIG_DEBUG_INFO) += -g
> -- 
> 2.30.2
> 
> 
--8323329-991833485-1700527911=:773207--

