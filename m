Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F377C870E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 15:41:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616574.958689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrIPU-0000bA-F2; Fri, 13 Oct 2023 13:41:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616574.958689; Fri, 13 Oct 2023 13:41:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrIPU-0000Yp-Bq; Fri, 13 Oct 2023 13:41:00 +0000
Received: by outflank-mailman (input) for mailman id 616574;
 Fri, 13 Oct 2023 13:40:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pfqf=F3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qrIPS-0000Yi-Qs
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 13:40:58 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23a3df60-69ce-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 15:40:57 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5041bb9ce51so2675049e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Oct 2023 06:40:57 -0700 (PDT)
Received: from [172.31.7.9] (pdaddca5b.chibnt01.ap.so-net.ne.jp.
 [218.221.202.91]) by smtp.gmail.com with ESMTPSA id
 y3-20020a62b503000000b0068fd653321esm13534654pfe.58.2023.10.13.06.40.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Oct 2023 06:40:56 -0700 (PDT)
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
X-Inumbo-ID: 23a3df60-69ce-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697204457; x=1697809257; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=59iK16ERZY8Qnot9jaf1f8Q6bpx+HgU58/9jt0fKX4A=;
        b=QlR86ug503PvmKzEi9Un7HN2Bre2ZSnjzNaTzHGJadWEbB/78tQgMlDEihvRACtd/9
         VeCZpux4VDiXVYNHmyu2jicyC/BUA9oHfbQ8h15ZY7DlTeLvQ3u5RULwD5G5XgL7Ab8p
         Y/AzUU6sK3/iHGJHqC2M+ULWIiYpTGFB5WnsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697204457; x=1697809257;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=59iK16ERZY8Qnot9jaf1f8Q6bpx+HgU58/9jt0fKX4A=;
        b=CZJRrzIUivSmryoJKCQZPSE/t/HU8iwtq/FUTCiQ092BJridCoNsHSuTm1fz+U6lEe
         2gQV7UbPw4f2Kp7X4X7giInMj01/fG81X8JBQNf3m26ma/ZwB3isIIB/w4bgcMPx1EHP
         qpToRwMsivb1NEAztMW2pT9dBxpCNEhovpLrPUdjWNcJJOzYCxRO4GDwvqNKzsvdhRM2
         zIeTijjhcMX1bBeKJBijxbZfjyUEFkslzWlkzcyFz1XwRNCJG8s2XZMXLsPUAXTU0JVs
         QyhvcvqQ/Fu1yyyWNvN5GsvejNpslENoO5IjIL5tSJ/1OoudjYeI4hPdLp9JddHm6lkn
         OAnA==
X-Gm-Message-State: AOJu0YxgVG7895UEEvhBnhMOrtTcAVYHQ1J/130d+xSD3y4fgLZ5TksK
	hdDfjcz1RIiML8evu/yraHPPCA==
X-Google-Smtp-Source: AGHT+IGKO6oxN7zg8oVrEFTJWaQtTNWQwL9Raq09FSICitU5xf4hhLcwlcnxCIRGIUgonkYcMSuGEA==
X-Received: by 2002:ac2:4290:0:b0:503:38fe:4590 with SMTP id m16-20020ac24290000000b0050338fe4590mr19760521lfh.60.1697204457309;
        Fri, 13 Oct 2023 06:40:57 -0700 (PDT)
Message-ID: <42d8ac8d-522e-424a-b002-9a0508f318da@citrix.com>
Date: Fri, 13 Oct 2023 21:40:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [for-4.18][PATCH v2] x86/amd: Address AMD erratum #1485
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>
References: <20231013131846.175702-1-alejandro.vallejo@cloud.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20231013131846.175702-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/10/2023 9:18 pm, Alejandro Vallejo wrote:
> diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
> index 4f27187f92..085c4772d7 100644
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -1167,6 +1167,14 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
>  	if (c->x86 == 0x10)
>  		__clear_bit(X86_FEATURE_MONITOR, c->x86_capability);
>  
> +	/* Fix for AMD erratum #1485 */
> +	if (!cpu_has_hypervisor && c->x86 == 0x19 && is_zen4_uarch()) {
> +		rdmsrl(MSR_AMD64_BP_CFG, value);
> +		#define ZEN4_BP_CFG_SHARED_BTB_FIX (1ull << 5)
> +		wrmsrl(MSR_AMD64_BP_CFG,
> +		       value | ZEN4_BP_CFG_SHARED_BTB_FIX);

A #define indented like that is weird.  I tend to either opencode it
directly in the "value |" expression, or have a local variable called
chickenbit.

This will surely be a core scope MSR rather than thread scope, at which
point it the write ought to be conditional on seeing the chickenbit
clear (hence needing to refer to the value at least twice, so use a
local variable).

It probably also wants a note about non-atomic RMW, and how it's safe in
practice.  (See the Zenbleed comment).

Otherwise, LGTM.

As this is just cribbing from an existing example, I'm happy to adjust
on commit, but it's probably better to double check in the PPR and retest.

~Andrew

