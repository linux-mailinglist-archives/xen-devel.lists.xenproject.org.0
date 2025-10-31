Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FC2C24775
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 11:30:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154159.1484268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEmOF-0004I8-Cx; Fri, 31 Oct 2025 10:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154159.1484268; Fri, 31 Oct 2025 10:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEmOF-0004FW-9u; Fri, 31 Oct 2025 10:29:51 +0000
Received: by outflank-mailman (input) for mailman id 1154159;
 Fri, 31 Oct 2025 10:29:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UMm=5I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vEmOE-0004FQ-KO
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 10:29:50 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8617bcb8-b644-11f0-980a-7dc792cee155;
 Fri, 31 Oct 2025 11:29:47 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-42421b1514fso1280323f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 31 Oct 2025 03:29:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c13e1c9esm2944872f8f.22.2025.10.31.03.29.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 03:29:46 -0700 (PDT)
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
X-Inumbo-ID: 8617bcb8-b644-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761906587; x=1762511387; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yJFiHgEMpQ2j3Ru3LbZJsRfi+UCnSseiTAseDUujbfA=;
        b=Y/lfYzOvA4iaHGbBfDgAYt+w5aW8G23STRtLgqqNGQB8o1LEPHKgSFz36jhJBdF9hN
         QMhdoGnqaleugEtmGqgf3MNGMZIg0TlcESvPA9xdXl8AX3nDw727QIubPb6O4ylMfdVU
         HW6D7W+/odcouIzlKdSNMP7z4UPE/6Trg7F+/1IdXz/FOxpIONSuC9ffq5Doz6KKlPYh
         2dXYirudWodouqf8ELrkVTUfkvbEJHhHsqpLaF5tcn4EPwzjtb8Czf1frNIr4EKLUj3+
         OapRb2syFpZNMjqCCIoYW/ccDTFd813ALCPq+MeI567Wm/5AEinP0DNHEpc4klEm5LcG
         DlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761906587; x=1762511387;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJFiHgEMpQ2j3Ru3LbZJsRfi+UCnSseiTAseDUujbfA=;
        b=pvhM4YIF91aRVl1MT9mH5A/KAjm2BwflqOTp0ZrAcDPgniZpiiBZS6Y794u5/ehfth
         mzwHoFrmrtIewZB4UAWpsQQIE+fXbxD0GwsKmwctviSoiMdFusuBHvuktqfB80TpoHEi
         jG9ML4lCY1PtxogofVuegiVsRL7WBYBJwXTkuFSzGdREWw9fsbM9nS7H2cZTyEwajq6K
         rvaPBlySqqeTAjoDMg3I4jwB9yBoGustJ+yd9IuwXItL1bCpB09u1IH7XxBz0WQWb50f
         UPVleXUfv1TAv5JvIqS1VDFPfs3dMlmfrZq/imLzy9T3seiN0xkBABMqu8Gxy6K/PhVn
         AMHg==
X-Gm-Message-State: AOJu0YyegwmyBYyVAod2iLXRnAmD//NWQXSuuEkk0YQy6e2MX9M9JLJO
	q+fld2ca26vmWeAmmpoKeeEvdS3Oiei1zduCK37S/K49AirTtM0SY4Dd5yYajSjfyg==
X-Gm-Gg: ASbGncv9SwtntVSxpNx3i+gdQvONzgrze0ku8Rydw3ELLj+zuV+EpiZXnmCOo/WOb22
	G3XWxEy2EAy3X0bV6p7Q9FOi7XJJUIrIkvSSwS0J1AJjovOAOYBPgYbc3iggyqxGBSnLb/ThHv5
	TznNu9UrH/bloKIP9blgnP5oGdf/JX9C0gsK8UOUY1GeU0XAWf/NsCbPYsvLuH6KkP8JBRjB8yD
	uE7GU68OMDQxyRwB6VGsPsdk5s2Re03vtJYZu5Ty6W697Y/fJxpaFG03TvxEEfyMUCIiW7AaosM
	n6gAsIc/i3LJy+6J8WcWyCdaYbFWDpirqjCwaNBNMd3+xJo1P/2BPIIoGN8x7fAIP6ZItvsK5cG
	ZD0jMJaBql6y0RsjUy6dBN1a58PBy5iLStY5ZC6FEIXZRrMPCzoq7CWGpVPlPunEKmExaW6n5/s
	e5DqBRzza3S8oOlykkuxg+UyMPuMmx7ELkqdFTd9w+LKaQx/aPcc0sDpCTF4Z8wmExdl5NTrE=
X-Google-Smtp-Source: AGHT+IHXEK7M0ZW8dxmv6rNkrEuwWkRb5V8oz9YLdy7ezj20qQw2n2/W3pzxEFqore/gR6IrCBUUww==
X-Received: by 2002:a05:6000:2288:b0:429:a894:a327 with SMTP id ffacd0b85a97d-429bd6add12mr2422499f8f.39.1761906586699;
        Fri, 31 Oct 2025 03:29:46 -0700 (PDT)
Message-ID: <68e28e41-e835-4985-80a3-6a99b3d7dc3e@suse.com>
Date: Fri, 31 Oct 2025 11:29:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.21 0/2] x86/AMD: deal with RDSEED issues
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <272093dc-c97c-434a-9977-ad1c26e7e229@suse.com>
 <aQSN3MKxAa_cltld@Mac.lan>
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
In-Reply-To: <aQSN3MKxAa_cltld@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.10.2025 11:22, Roger Pau Monné wrote:
> On Tue, Oct 28, 2025 at 04:32:17PM +0100, Jan Beulich wrote:
>> Both patches also want 'x86/CPU: extend is_forced_cpu_cap()'s "reach"' in
>> place.
>>
>> 1: disable RDSEED on Fam17 model 47 stepping 0
>> 2: disable RDSEED on most of Zen5
> 
> For both patches: don't we need to set the feature in the max policy
> to allow for incoming migrations of guests that have already seen the
> feature?

No, such guests should not run on affected hosts (unless overrides are in place),
or else they'd face sudden malfunction of RDSEED. If an override was in place on
the source host, an override will also need to be put in place on the destination
one.

Jan

