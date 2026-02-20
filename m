Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aVRDI94JmGkK/gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 08:14:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE87165342
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 08:14:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236883.1539375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtKiC-0006MJ-1Y; Fri, 20 Feb 2026 07:14:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236883.1539375; Fri, 20 Feb 2026 07:14:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtKiB-0006JD-Ua; Fri, 20 Feb 2026 07:14:03 +0000
Received: by outflank-mailman (input) for mailman id 1236883;
 Fri, 20 Feb 2026 07:14:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vtKiB-0006J7-4Z
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 07:14:03 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bab719b9-0e2b-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 08:14:00 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-437711e9195so1159514f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 23:14:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a5b07fsm55126664f8f.2.2026.02.19.23.13.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 23:13:59 -0800 (PST)
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
X-Inumbo-ID: bab719b9-0e2b-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771571640; x=1772176440; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HKiM1va7UmERrYVTlfZSGxLgMulxu7Dcg6PNmYiIlIs=;
        b=c+n79s/qvuzwJh2vgpy+Mf6zA/gQhDT5EZJzvdF0jr9LBty3BV5wi48rl+Czj8DQOY
         K9DWFe2P9rH2JnIGd6BjTAq3hDZhOIZhBVvYt+caS46Faq7FDbqR+YY7Rt5ZOjx1lVyp
         2dXdWbLvWedAiI5xvAYgf+3rCNN+Qy/0spgf81b2yk5GyeAeICPDU09lSc2uFhLE8zb7
         zPH+7leS5r8x0I29VK1ZFLFyn/Jmj4oTUj1YkVPuygrjJ350Awti8E3UkJXEhhQOxF3d
         Cnjp3noiBx8SOYn4f6QVk3xCib+QrsV1/o1d4vQku0NpYIMEpvLOhzVwmyPX/g4tWtj+
         2QWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771571640; x=1772176440;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKiM1va7UmERrYVTlfZSGxLgMulxu7Dcg6PNmYiIlIs=;
        b=IaRLtPmRlI2i9eGby1bcE72VRoAy0zZ4rSCIrZI+3TsA+cmMbWfTKujXP68rWtl107
         Y8mW9H5om4wegxeCxkey0skdLfQvaoBCn0d9lO0Gd08EJf5bi+g2ozHOJK4O3MhHsujF
         KbJA6H8u027vMlwodNJOd8fi8Q+CtPFeJfP9G38rDsoncnAqNbWy+RpvnLS52Y/3ZkRe
         ly7h2f+q9kre2+QikTMwnj2j8RXwyMVmi5AYCU5i6g3JU/XiS2SXPVHkoJRtU87sJgXg
         ZTT4VPNKZP3Lv7LkRX5C7TqTuCkWLbL5AuH+YwpBHaZRkd3s6hzumKEC45Qq/VqCphYW
         0V1g==
X-Forwarded-Encrypted: i=1; AJvYcCUbKDdaDoYyzRD8GzfUakueIM7tXFyentQLp2629DVKwYO+CpdhFCkiSGtZ/NSKsZalwUQTSxR94g8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy3hPAQP47KoiVzteroNHjzws9cD5r2pQshYmWxdqYDTI242BZd
	VOpB+CzsHDxnKP07A/D7QxDt5CKT4SNcKyMqAlmeBb5Ba2p/VEvTzn6CrcKLodbzeA==
X-Gm-Gg: AZuq6aIWoPB2T1DvuKIWnOYuAI0nUnMC/ibWMKyGqq13o6iFwPcwuxLKacuON7yvg8b
	dEG+c7hpZ9ENncvX3Q+qVAJWdnMsitWTWrmtlIbv4v/U8sBWphtQRGy9SPFBFc11C6+DylhFs4Z
	NH+gcKxdUO+KlaiGYplUQ7OKhQuzS3AoaIUIQMiOSDVEavbXbDr3kr98Ei3ZQ7dOUzkug+s0j2D
	YoxLWjTttiCeXWxpiVzM50Q9LYUpHPy2DY4iCvZhctpkYDN0eOIRrMYKqfsL/axyipoPPDKDTrp
	Bcr7vwKF/JdFuudD8DCLDMXQuWKmpEtNi+TtmlVGOpnvKqEPB9LM37Etnz8TyB8iliddnOh9XKs
	1odyFz1NX0AV3JSviW+M0RxSyr4BVZMNtX+ur4/an4yt10vNmFNV1INxRzsN6UeU5z6keHiAj2y
	ZcVHIRUrzhxd4q0/pw+WlKcfkyRqFRydqEdN6P2/EKmx/GL7t4TN+yTCBrBliTPc6fau5NGkV4F
	8/WatMGPcjaVhc=
X-Received: by 2002:a05:6000:2c05:b0:435:98c6:7f06 with SMTP id ffacd0b85a97d-4396b0384dcmr1169336f8f.6.1771571639822;
        Thu, 19 Feb 2026 23:13:59 -0800 (PST)
Message-ID: <d082d619-8675-4ae4-bd25-f7f99209c615@suse.com>
Date: Fri, 20 Feb 2026 08:13:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] vPCI: re-init extended-capabilities when MMCFG
 availability changed
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <25c65557-c97c-499c-a698-571e40cde563@suse.com>
 <67b1f190-a7a8-4cf2-89ca-7186204f0b56@suse.com>
 <d0be8579-fca3-4b55-9c7b-37368231a41a@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <d0be8579-fca3-4b55-9c7b-37368231a41a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stewart.hildebrand@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: DDE87165342
X-Rspamd-Action: no action

On 19.02.2026 23:21, Stewart Hildebrand wrote:
> On 2/10/26 05:55, Jan Beulich wrote:
>> --- a/xen/drivers/vpci/cap.c
>> +++ b/xen/drivers/vpci/cap.c
>> @@ -376,6 +379,20 @@ void vpci_cleanup_capabilities(struct pc
>>      }
>>  }
>>  
>> +int vpci_reinit_ext_capabilities(struct pci_dev *pdev)
>> +{
>> +    if ( !pdev->vpci )
>> +        return 0;
>> +
>> +    vpci_cleanup_capabilities(pdev, true);
> In the case where pdev->ext_cfg transitions from true to false, it doesn't look
> like this would actually result in the respective capability->cleanup() hook
> being called, due to reliance on pci_find_ext_capability().

Hmm, indeed. Yet that's a problem with vpci_cleanup_capabilities(), not
with the call here. It may have been merely latent until no later than
b1543cf5751b ("PCI: don't look for ext-caps when there's no extended cfg
space"). The cleanup hooks themselves (it's only one right now) then
also may not access their respective capabilities anymore (nor even just
try to locate them).

Jan

