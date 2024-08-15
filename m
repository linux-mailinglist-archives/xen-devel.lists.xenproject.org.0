Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B5F952EE9
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 15:17:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778089.1188148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seaM1-0003Sc-Te; Thu, 15 Aug 2024 13:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778089.1188148; Thu, 15 Aug 2024 13:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seaM1-0003QZ-Qn; Thu, 15 Aug 2024 13:17:25 +0000
Received: by outflank-mailman (input) for mailman id 778089;
 Thu, 15 Aug 2024 13:17:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZnf=PO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1seaM0-0003QN-G8
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 13:17:24 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b498346a-5b08-11ef-8776-851b0ebba9a2;
 Thu, 15 Aug 2024 15:17:22 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-7a501dd544eso29197685a.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2024 06:17:22 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a4ff02aefbsm62639085a.6.2024.08.15.06.17.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2024 06:17:19 -0700 (PDT)
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
X-Inumbo-ID: b498346a-5b08-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1723727840; x=1724332640; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tMJFIt8HmP7fZbDGOO5bUf+hxHbPK2mz3KIdTfPwmA4=;
        b=sGYRco9jyBMEWhFkCyh1f/G/f3f05nxpGsL5kHyBEbwcNXLJFTeAc+9hHNEFXYAKrh
         GGJeJbcBCh5eUIh65wC59aEiL1DjOIe98Rtzyf0js/09INXjRAv2Kl0ZLa26hr6vDM/0
         qJSUIMmB33DWz6Ri3mv55g2Ah1IO7yJxvXzjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723727840; x=1724332640;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMJFIt8HmP7fZbDGOO5bUf+hxHbPK2mz3KIdTfPwmA4=;
        b=Y/IPsJGNrGdtRDiC+WW2R47CxZ9aqTq6UQ5R4ehPrubY4A9B4VkU13eFRVCr6P7qRD
         nQqL2nZk2ON5TUggg33cyuS0TJr2Mrv60SREHdkqakxTnkFI0CEUYfz5gpspGtxhZV6S
         Jx1HyZoVDltZH87oriEX4g+Y4Sq10ZdTXTpMI64A2LAD4NR0XKKfF9d2tvWa3Qi/RQba
         waoKm3Uwun/mtUioNE7yNaVZeg89cINjzGNGq0nl3v61HbvukKqzcdHSH7baOvkzLiRp
         56GpWUWtNw7sXpL/CDfwJ9MuGMf7tgYededAQFb/ferT52eQTEV3R9veE6CpTfQLUAAp
         Palg==
X-Gm-Message-State: AOJu0YxZVFQGzq5z29z4fjIzfOt3XuqgDWBvVPTd047I0WyzHu4U0ay1
	EIZZPlztKLaSHrnTG0jRPeS2w+u5tuiF0uWjBF75Dom5bVCwkl09JtPfGbaigMqPgw3uKAjsltT
	z
X-Google-Smtp-Source: AGHT+IHk0QzWnGe0Z/Nvsmoz/jBkSYJTsLwTU52glOmspkWl8RL1saEdz3WpjYsgwQ2Q0phlLMt/Vg==
X-Received: by 2002:a05:620a:404b:b0:79f:515:e211 with SMTP id af79cd13be357-7a4ee3abf8emr762831185a.46.1723727840519;
        Thu, 15 Aug 2024 06:17:20 -0700 (PDT)
Message-ID: <5030e672-c9fe-40cb-ac9d-68aaf311745d@citrix.com>
Date: Thu, 15 Aug 2024 14:17:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/pv: Address Coverity complaint in
 check_guest_io_breakpoint()
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Matthew Barnes <matthew.barnes@cloud.com>
References: <20240815131600.4037415-1-andrew.cooper3@citrix.com>
 <20240815131600.4037415-4-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240815131600.4037415-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/08/2024 2:16 pm, Andrew Cooper wrote:
> Commit 08aacc392d86 ("x86/emul: Fix misaligned IO breakpoint behaviour in PV
> guests") caused a Coverity INTEGER_OVERFLOW complaint based on the reasoning
> that width could be 0.
>
> It can't, but digging into the code generation, GCC 8 and later (bisected on
> gotbolt) choose to emit a CSWITCH lookup table, and because the range (bottom
> 2 bits clear), it's a 16-entry lookup table.
>
> So Coverity is correct, given that GCC did emit a (dead) logic path where
> width stayed 0.
>
> Rewrite the logic.  Introduce x86_bp_width() which compiles to a single basic
> block, which replaces the switch() statement.  Take the opportunity to also
> make start and width be loop-scope variables.
>
> No practical change, but it should compile better and placate Coverity.
>
> Fixes: 08aacc392d86 ("x86/emul: Fix misaligned IO breakpoint behaviour in PV guests")

I forgot Coverity-ID: 1616152, fixed locally.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>

