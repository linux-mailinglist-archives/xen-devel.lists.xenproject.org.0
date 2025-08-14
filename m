Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB84B26F36
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 20:46:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082389.1442245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umcxR-0001AR-Po; Thu, 14 Aug 2025 18:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082389.1442245; Thu, 14 Aug 2025 18:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umcxR-00017K-Ms; Thu, 14 Aug 2025 18:45:49 +0000
Received: by outflank-mailman (input) for mailman id 1082389;
 Thu, 14 Aug 2025 18:45:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mOIo=22=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umcxQ-00017E-Kt
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 18:45:48 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e45c96a3-793e-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 20:45:47 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3b9e414ef53so1121491f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 11:45:47 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ba54b6c93fsm2059399f8f.12.2025.08.14.11.45.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 11:45:46 -0700 (PDT)
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
X-Inumbo-ID: e45c96a3-793e-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755197147; x=1755801947; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9/Zko+2yKa3WJ85zsniF0G9v8Wzy5uyGbRRZ97TxGmw=;
        b=fxZjxouKloWZe3y98oZ4yBf/j9MFNwHb1s8vpEbVs/udz+usx8PUs6IJuvUJAd2atL
         ujTDW4h5pvDPoVhYwgQl425bZrNiCO7n/957Wwrzqyh6PdNKGRFulDlHwWXzFskg59bZ
         8yyrXjdNIO4Jq6Up5nNC/uIM9C6BZA+NuEeuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755197147; x=1755801947;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/Zko+2yKa3WJ85zsniF0G9v8Wzy5uyGbRRZ97TxGmw=;
        b=wtzOd2ClO0QL1KYonH5hcTL8g47vOnLHV/men7UHC38g8gNxnxS9XeSg7/vduYApV2
         adH8gtH3SLjwNoD86RulKKb217+kR3+n1mmYEh0KCgPln1aTmjlMh/HqOgWlUEFrqvka
         Slb840Apr3e9sYSbqtfMWbYjPHu6h/KmFrbB1NKV83Rt89DuZF6M50xjwjysNIVXbkVS
         lLOhFZeqomhxyXa2wYM+KhurABnboa/G6TW1IFbEsO0A6KyiO5HaK2kw4JHbdtJbjj9D
         coWp6kfBQ28wQJaySOYAYJMS4qe1+xjNs0lmYJVlb7oKI3h4OPqo2hc0edJym4MAnkbl
         Khpg==
X-Forwarded-Encrypted: i=1; AJvYcCUzeJPb1nhjBowrNwwFszzEIvs2I/Z7WwXcBd91JcxnHBFu2LTdu47JHY0ul4UE/n6UZpEJCTv8rsA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxc2ddgNI/YZOmvODtpXWoX+1pDcmQg+KqCj8Sv5G1kwVIYBcUR
	GuOo/brN1v2Q9EITXjgRFTwuWGuhPdHmL3nc5pC2tY1U6cyJd8FZjFue8EfydopzBtY=
X-Gm-Gg: ASbGnctTIszrU/GjPvMSi6RSPkap54fhdAf5PYW87rgLGuS5WNjc9r7LLHG3i6UUrC+
	kyw0RMAvU4LsnZ2s4jyiFCtir7MXp3ANeL0ao0nJ1EGtQmacsU0tIuq5IGwWwGuwyix5//0WCIE
	1QgoGvQ3BhPn7mnh40VZUWnJRQ+HclWLkgjr+FzIHrmFKFQdy+p0N3cRDkh3d/17NenF3Ywkp7a
	T2xVhYluWvjHUZ7AaoiNOsvZFgcEg5lfy8sAATC2rWqkG3fBsaQwxJ7YKIl/66dAcgZ3ucnJ2M5
	EbmCm3ZzjP11YxtEb00/ulYcLEWATy/1tOwfrFy/n3+t9j78sqPVCNQwBnSN9I8i28c4661SCK2
	F5VkuCrXu9NZcq87iSl12N4j/gUUmCxR8nE9uY3GW0dT9HGilcmq1Bp7cBI8zhc45UFgq
X-Google-Smtp-Source: AGHT+IGiQAVO4siwkHMT3ShwKyY6J8zzZ1zOrRwUS8GBBSX52VjgW7eXlwJ8QKhZ008/OPcbcUNrDA==
X-Received: by 2002:a05:6000:40ce:b0:3b8:f8d0:f75c with SMTP id ffacd0b85a97d-3b9edf2d867mr4085817f8f.35.1755197146970;
        Thu, 14 Aug 2025 11:45:46 -0700 (PDT)
Message-ID: <79521edc-34d9-4364-922d-158e93fcbc04@citrix.com>
Date: Thu, 14 Aug 2025 19:45:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/22] x86: FRED enumerations
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-14-andrew.cooper3@citrix.com>
 <9b4da5b3-dd68-4052-92cc-fe322164eaa5@suse.com>
 <737eab59-f016-426a-ba6e-e6c7a58a9e61@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <737eab59-f016-426a-ba6e-e6c7a58a9e61@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/08/2025 2:19 pm, Jan Beulich wrote:
> On 14.08.2025 13:20, Jan Beulich wrote:
>> On 08.08.2025 22:23, Andrew Cooper wrote:
>>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>>> @@ -310,7 +310,10 @@ XEN_CPUFEATURE(ARCH_PERF_MON, 10*32+8) /*   Architectural Perfmon */
>>>  XEN_CPUFEATURE(FZRM,         10*32+10) /*A  Fast Zero-length REP MOVSB */
>>>  XEN_CPUFEATURE(FSRS,         10*32+11) /*A  Fast Short REP STOSB */
>>>  XEN_CPUFEATURE(FSRCS,        10*32+12) /*A  Fast Short REP CMPSB/SCASB */
>>> +XEN_CPUFEATURE(FRED,         10*32+17) /*   Fast Return and Event Delivery */
>>> +XEN_CPUFEATURE(LKGS,         10*32+18) /*   Load Kernel GS instruction */
>>>  XEN_CPUFEATURE(WRMSRNS,      10*32+19) /*S  WRMSR Non-Serialising */
>>> +XEN_CPUFEATURE(NMI_SRC,      10*32+20) /*   NMI-Source Reporting */
>>>  XEN_CPUFEATURE(AMX_FP16,     10*32+21) /*   AMX FP16 instruction */
>>>  XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
>>>  XEN_CPUFEATURE(LAM,          10*32+26) /*   Linear Address Masking */
>> I'd like to note that we could long have had this if my long-pending emulator
>> patch had gone in at some point.
> Actually what I further have there, and what in the context of patch 15 I
> notice you should have here is
>
> --- a/xen/tools/gen-cpuid.py
> +++ b/xen/tools/gen-cpuid.py
> @@ -278,7 +278,8 @@ def crunch_numbers(state):
>          # superpages, PCID and PKU are only available in 4 level paging.
>          # NO_LMSL indicates the absense of Long Mode Segment Limits, which
>          # have been dropped in hardware.
> -        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, AMX_TILE, CMPCCXADD],
> +        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, AMX_TILE, CMPCCXADD,
> +             LKGS],
>  
>          # AMD K6-2+ and K6-III processors shipped with 3DNow+, beyond the
>          # standard 3DNow in the earlier K6 processors.
> @@ -347,6 +348,9 @@ def crunch_numbers(state):
>          # computational instructions.  All further AMX features are built on top
>          # of AMX-TILE.
>          AMX_TILE: [AMX_BF16, AMX_INT8, AMX_FP16, AMX_COMPLEX],
> +
> +        # FRED builds on the LKGS instruction.
> +        LKGS: [FRED],
>      }
>  
>      deep_features = tuple(sorted(deps.keys()))

Hmm.  Yes, but normally this is part of guest enablement.

Having now done the Xen work and concluded that we don't actually need
LKGS, I'm rethinking the linkage here.  It's probably the right thing to
do in practice, but probably needs a bit more in the way of
justification.  "built on" doesn't quite cut it IMO.

~Andrew

