Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLM5Ok1Qn2n+ZwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 20:41:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B6219CCB0
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 20:41:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241043.1542288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvKka-00050D-NN; Wed, 25 Feb 2026 19:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241043.1542288; Wed, 25 Feb 2026 19:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvKka-0004yG-Jg; Wed, 25 Feb 2026 19:40:48 +0000
Received: by outflank-mailman (input) for mailman id 1241043;
 Wed, 25 Feb 2026 19:40:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2gY1=A5=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1vvKkY-0004ia-JP
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 19:40:46 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd36e72e-1281-11f1-9ccf-f158ae23cfc8;
 Wed, 25 Feb 2026 20:40:41 +0100 (CET)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2adec255754so3023265ad.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Feb 2026 11:40:40 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb5c9f79sm338045ad.33.2026.02.25.11.40.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 11:40:38 -0800 (PST)
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
X-Inumbo-ID: dd36e72e-1281-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772048439; x=1772653239; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UUj1S673p3detSktifXeGb28LBC3jFbCrEafskFBIyo=;
        b=CjWUq0vml4BEEtmXjWYofq5yqDm8QqX23tu08rdSmGEhmRTo4hwm5p64ix+MrtKFux
         +h/0NS+Uf07ivTZ7wtUclds0/8+3ixV9G97ZhGsVRreEzc5WZC2LbCuWKvGEXBcIW2XO
         DyzAPPxBlXhyjjvSEdq70SREnJHeN/TFJKS/NuqeyG3YiLRcF5TMqr5cFFRe48jJBXzj
         TvfZD3pdjb9eZkUYOqyvFsiBrboqnbaf430If+i9Bcx65N1ho+FTgd65HhxfuyNMDVo+
         D1wvIyj5Nh5HZGs0hEzVXfVjuVm2hJ6OrW8JM6lh0xglX/HeANjajsG/fkH5kkUfWYNe
         ugwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772048439; x=1772653239;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UUj1S673p3detSktifXeGb28LBC3jFbCrEafskFBIyo=;
        b=ccBb3WeO+bg+T8W2rIqqty6mriXi2D2BCKko9i8HK4ivZUEC3csW12gpf1vM3V0+GC
         a7i96jNhhLvvYlyg+/+RqW/G8AuapA5UeROaMf2VAU7/lSiss9zPEXb04zRmuRuiHy1y
         J5JOZf1ZGi4FDiZs6rcJ+MXiX75cFLZK983vg1QdZCiRTGBlFb7dRJPrSLuCIxzzuNnx
         XnplYNY+z6VNK1Uw1jSwkn//MaB5GRjzYXbV7obuHW+6gbU1TYo3ELUKOnnL7JugBXqw
         3UJOQwR20z05V0THncMTtagduOEAALP/1Qx2Jnkya2dgvHDObxRq1r16KW3/3IBOwM6m
         6v6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXur2Uj2W3t6mOLcAL0FQyvKrWwRsBC3XQeCTC3Vt3paVe4ZGIaAWiX4zVoeBkv1YdsTtyN6JimD+I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEOJBDHbHpPy0QgBS0qe0imBurCkTLvIcaIX4IZ1R1uwdbM//E
	EeFWq3aLge8XmQWTxsCF8ZHOl63gY3xBwutdnku86l4WTImQTImsTkt2SVGu7cEwhN8=
X-Gm-Gg: ATEYQzy9xMgXsPNgLcF8l5Vb2ettVE/CMrl4hSeV2eCjAamYDfpMnbsaxFQtOpXche4
	s6CGxgNcQbfsmvh7oDapD3E40y4j2xD3Tf6ZfpWRhPNFZQId7HwGarNpLGBCrm96K1COMZme9d9
	DmXffvj7N3Fe4PrHQLlhOSiNzuZyHgiN/6FYNsrgnzhpP1XED2MROez6xzT41LK/Z5ex0eS7JYc
	L/uKhRE2urCp9s7Q3KazHbkfiu22v3kF3URnT9srFhyHClYied168WYZR8GwtR3HwRIGVa5G56F
	VvIqCsSQQXdVT8OTyjUMh9wTrCvFTD/e3TIx1OEmZgKTwWdOrF/dlt2RnWYEHNW2/q1CaJdCoB1
	ZI2gTUz2SAiVzl2K+aIAR5JvQgheJ/Awm/tjY1KJN4IOup2pladEbq2HXEmt6APU2YgEU82WqUp
	WAMnw/oMR3nesTCytBIpbD8SRd0RgktEZ9L/ZXb9lVELgB9fTmufdHcRMeff2naCqPMJfK
X-Received: by 2002:a17:902:db10:b0:2a9:4870:9606 with SMTP id d9443c01a7336-2ad7453b5f2mr164846735ad.42.1772048439231;
        Wed, 25 Feb 2026 11:40:39 -0800 (PST)
Message-ID: <2a0b5bb2-f29a-49f5-9840-cc1385e1ada1@linaro.org>
Date: Wed, 25 Feb 2026 11:40:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] accel/mshv: Build without target-specific knowledge
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 xen-devel@lists.xenproject.org,
 Magnus Kulke <magnus.kulke@linux.microsoft.com>, Wei Liu <wei.liu@kernel.org>
References: <20260225051303.91614-1-philmd@linaro.org>
 <20260225051303.91614-4-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260225051303.91614-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:philmd@linaro.org,m:qemu-devel@nongnu.org,m:kvm@vger.kernel.org,m:pbonzini@redhat.com,m:xen-devel@lists.xenproject.org,m:magnus.kulke@linux.microsoft.com,m:wei.liu@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[pierrick.bouvier@linaro.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pierrick.bouvier@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 56B6219CCB0
X-Rspamd-Action: no action

On 2/24/26 9:13 PM, Philippe Mathieu-Daudé wrote:
> Code in accel/ aims to be target-agnostic. Enforce that
> by moving the MSHV file units to system_ss[], which is
> target-agnostic.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/mshv/meson.build | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

