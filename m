Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA1463B77B
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 02:56:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449181.705810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozpqV-0007mR-Vf; Tue, 29 Nov 2022 01:55:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449181.705810; Tue, 29 Nov 2022 01:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozpqV-0007j1-Sg; Tue, 29 Nov 2022 01:55:39 +0000
Received: by outflank-mailman (input) for mailman id 449181;
 Tue, 29 Nov 2022 01:55:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CMqW=35=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ozpqU-0007is-1C
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 01:55:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea4fa95e-6f88-11ed-91b6-6bf2151ebd3b;
 Tue, 29 Nov 2022 02:55:36 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2C3476152A;
 Tue, 29 Nov 2022 01:55:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0368C433C1;
 Tue, 29 Nov 2022 01:55:32 +0000 (UTC)
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
X-Inumbo-ID: ea4fa95e-6f88-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669686934;
	bh=MNnASlWjTtEwJtaW9e2PM9nFxBupfJtU/G26N3CYWfY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oYaA3edtkgnlSX4Jg78TRGJc1UOuK2BFteSQRsutglDzaEmoRcjeKMsPxKprMNeDt
	 fY667ar8W2IRQ/lsPftt3fWg9KM97f+PNRWTLjpnYJCJHq985i2k8q9MBEQvS/mjgo
	 ExDOAswtw8o+IWPPV8n6YjDtoYoJ3JsGJJI8Nve6dwAok6OgqFCRuetBP5YVFzQELk
	 IHbSeDBmC0wId3ur+eFPb3GLIaMt7/WkGirjIf0ahrpDnSSMZQ8GbSeva/MkgP4Rb4
	 yArCnBWq3jXgnIHzynYZuWGbmKnmrnWiB1cKmc1fdzDbL75K9PiDkTtgICfUvhVYzE
	 KqSIqYPLQrnZw==
Date: Mon, 28 Nov 2022 17:55:31 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 4/4] xen: Justify linker script defined symbols in
 include/xen/kernel.h
In-Reply-To: <20221128141006.8719-5-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2211281755210.1049131@ubuntu-linux-20-04-desktop>
References: <20221128141006.8719-1-luca.fancellu@arm.com> <20221128141006.8719-5-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Nov 2022, Luca Fancellu wrote:
> Eclair and Coverity found violation of the MISRA rule 8.6 for the
> symbols _start, _end, start, _stext, _etext, _srodata, _erodata,
> _sinittext, _einittext which are declared in
> xen/include/xen/kernel.h.
> All those symbols are defined by the liker script so we can deviate
> from the rule 8.6 for these cases.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  docs/misra/safe.json     | 9 +++++++++
>  xen/include/xen/kernel.h | 4 ++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
> index e079d3038120..e3c8a1d8eb36 100644
> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -3,6 +3,15 @@
>      "content": [
>          {
>              "id": "SAF-0-safe",
> +            "analyser": {
> +                "eclair": "MC3R1.R8.6",
> +                "coverity": "misra_c_2012_rule_8_6_violation"
> +            },
> +            "name": "Rule 8.6: linker script defined symbols",
> +            "text": "It is safe to declare this symbol because it is defined in the linker script."
> +        },
> +        {
> +            "id": "SAF-1-safe",
>              "analyser": {},
>              "name": "Sentinel",
>              "text": "Next ID to be used"
> diff --git a/xen/include/xen/kernel.h b/xen/include/xen/kernel.h
> index 8cd142032d3b..f1a7713784fc 100644
> --- a/xen/include/xen/kernel.h
> +++ b/xen/include/xen/kernel.h
> @@ -65,24 +65,28 @@
>  	1;                                      \
>  })
>  
> +/* SAF-0-safe */
>  extern char _start[], _end[], start[];
>  #define is_kernel(p) ({                         \
>      char *__p = (char *)(unsigned long)(p);     \
>      (__p >= _start) && (__p < _end);            \
>  })
>  
> +/* SAF-0-safe */
>  extern char _stext[], _etext[];
>  #define is_kernel_text(p) ({                    \
>      char *__p = (char *)(unsigned long)(p);     \
>      (__p >= _stext) && (__p < _etext);          \
>  })
>  
> +/* SAF-0-safe */
>  extern const char _srodata[], _erodata[];
>  #define is_kernel_rodata(p) ({                  \
>      const char *__p = (const char *)(unsigned long)(p);     \
>      (__p >= _srodata) && (__p < _erodata);      \
>  })
>  
> +/* SAF-0-safe */
>  extern char _sinittext[], _einittext[];
>  #define is_kernel_inittext(p) ({                \
>      char *__p = (char *)(unsigned long)(p);     \
> -- 
> 2.17.1
> 

