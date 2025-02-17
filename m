Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE1BA389D4
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 17:44:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890702.1299842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk4E6-0002G5-Jd; Mon, 17 Feb 2025 16:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890702.1299842; Mon, 17 Feb 2025 16:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk4E6-0002DL-Gw; Mon, 17 Feb 2025 16:44:10 +0000
Received: by outflank-mailman (input) for mailman id 890702;
 Mon, 17 Feb 2025 16:44:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xGAw=VI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tk4E5-0002DF-18
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 16:44:09 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6755ca97-ed4e-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 17:44:07 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4395dddb07dso47640925e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 08:44:07 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f7987sm12485097f8f.87.2025.02.17.08.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 08:44:06 -0800 (PST)
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
X-Inumbo-ID: 6755ca97-ed4e-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739810646; x=1740415446; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GPJqLOu5KbYYslMQ33efaP5d7XCe5jJqnJJdsqqNBSo=;
        b=bOqHKShtZ7FWKplOGP56QN2djvgDUB2YVHqkpb+k8ZlhnMcsFWTrjQcHycTnLjSiE1
         t4/9FVKS7Q7+UKHXXD7tW8QneosBtgPHBGtPLjS07frtC+WtnUWY5ilkIcCQOsR87YnE
         TXntmnOEiN2f4ks7qbxdWcPbcuXwS8SFwxxmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810646; x=1740415446;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPJqLOu5KbYYslMQ33efaP5d7XCe5jJqnJJdsqqNBSo=;
        b=TAlNLl+BwCWwiiJK1UlE3/X/nsmZF+EKHBOZLYngc5kffFLMf22gJlhg2Tg6pB8xpH
         NKXfGj1wlEPFxDrbsqD1o9qI5n0dYxnqWGw3y4HdmFHK1dI6OcPQdoL81e05mUNq1cx9
         r0xCnBorqRTOVJDjaRwpigkIexQXWveGymtltI75KZa4MZ3t99wK5agJsFEp8Dq4fAfK
         8ENxHzJaiMcLrKNGpMfLzaFGTffJTuLJd/lJdhCKP97kd7TjsQAKEQRMz8oRHJL4vrei
         y4LvOaW3TRO0eOT9baln3rMsmT/VzHUnZtGmIABsPb6AazE9KQT/8WYvSMDCtMTGbLzD
         clOw==
X-Gm-Message-State: AOJu0YzERVHAkVfadocc9TcgsWxF6UMepCEVqnwkr54/iPgBQGYRrpKb
	B7rGzocNYvvokpWArCdmrNdoVoNx3cuXafdhBGTYDS83WfsuKazzcgaiuhT/LeQ=
X-Gm-Gg: ASbGncu0DX1NMbagZXyqGnyiViPmJtxB2YlOjy3LaeWAsHzwN6pymiZdq4Pg2UvFHg5
	IhHhZ55mEnnSFwgftm/eensa6TqymR6SQIf7czplf37bZQovEYRCl7VIq/mvC5b+KM3uanzRCQJ
	BtsoDkSS1pYXuVdx6NJ99XfWoiVgOMZY1mt9sVznKQuDT5A8XiK2emiUJa6HoSsVfHHoWIcQIao
	+r2wcrAFkSMmivr2EiMLWKoURBTWVklRPxyw6UVOgJxOF1Xs4Hz1dfaBHYPc2iJQwU9tdY3N5Y2
	F0rXAZH538I/5XpM6BeqxhskJ43lUWw+1+k0oL6Uisy4tVcIuIWprAU=
X-Google-Smtp-Source: AGHT+IG+5PBgUtAaZtx7T1jSJqi5cLpd1DWnPewt/IVQEbL/IkYsI1bhiyfIsjYj50NITc0U7TxE9A==
X-Received: by 2002:a05:600c:4f51:b0:439:66ae:ed0c with SMTP id 5b1f17b1804b1-4396e6d7b5dmr80606765e9.1.1739810646401;
        Mon, 17 Feb 2025 08:44:06 -0800 (PST)
Message-ID: <42687b94-22ff-40a0-ba91-de6251d4b420@citrix.com>
Date: Mon, 17 Feb 2025 16:44:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ucode: Add option to scan microcode by default
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20250217160844.3164003-1-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250217160844.3164003-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/02/2025 4:08 pm, Ross Lagerwall wrote:
> A lot of systems automatically add microcode to the initrd so it can be
> useful as a vendor policy to always scan for microcode. Add a Kconfig
> option to allow setting the default behaviour.
>
> The default behaviour is unchanged since the new option defaults to
> "no".
>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

I'm pretty sure this is safe on 4.20.

Prior versions of Xen need the fix to make idx/scan be mutually
exclusive, which hasn't been backported yet IIRC.

> ---
>  xen/arch/x86/Kconfig              | 11 +++++++++++
>  xen/arch/x86/cpu/microcode/core.c |  2 +-
>  2 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 9cdd04721afa..b806d8bc3319 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -383,6 +383,17 @@ config ALTP2M
>  
>  	  If unsure, stay with defaults.
>  
> +config UCODE_SCAN_DEFAULT
> +	def_bool n
> +	prompt "Scan for microcode by default"
> +	help
> +	  During boot, Xen can scan the multiboot images for a CPIO archive
> +	  containing CPU microcode to be loaded.

", which is Linux's mechanism for early microcode loading."

This is quite an important point to cover.

> +
> +	  Enabling this option will cause Xen to scan for it by default.
> +
> +	  If unsure, say N.

Personally I don't like this "If unsure", because it's almost always
redundant with the default.

In this case, it really ought to be "set if you have a Linux dom0",
which in turn begs the question as to whether it ought to be bool y.

~Andrew

