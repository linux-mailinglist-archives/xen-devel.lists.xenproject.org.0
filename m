Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F4D88FBC4
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 10:38:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698849.1091027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpmCt-0005ko-Jx; Thu, 28 Mar 2024 09:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698849.1091027; Thu, 28 Mar 2024 09:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpmCt-0005hn-GF; Thu, 28 Mar 2024 09:37:59 +0000
Received: by outflank-mailman (input) for mailman id 698849;
 Thu, 28 Mar 2024 09:37:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JFXD=LC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rpmCr-0005hg-Vd
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 09:37:57 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbab707d-ece6-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 10:37:56 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a47385a4379so327688366b.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 02:37:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bu6-20020a170907930600b00a4e26aec839sm175913ejc.197.2024.03.28.02.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Mar 2024 02:37:56 -0700 (PDT)
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
X-Inumbo-ID: dbab707d-ece6-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711618676; x=1712223476; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EsPXaaPvNui/Hla/IOxxrif4btj9zIbXB9wYdj0XRII=;
        b=eWNCWEhP8s6sUwX9W0RwdvwPILrAMHeZadgMT215MPnJ22L/1X4VcGlbmbhaOBHiRw
         COofkJt30If5yJ/A6tJOeww3CBMmV0YYsDejXY/A22/gsS/rATpSze5nJKL91zcnYhOC
         9gwum1Cec1ImTAR6Ee0phdVr+zg+/Op9pbkNh7iSN5FIUZrFro2Qu6DwWqDPZeIU9hbT
         9J9Cnm5t+98REMFpbPlSdUD7NI0ZZASOFdDl315bVrkxrZTSna1k806t0tA4SnreyR43
         MnAOhs6S3y2MO+BbEE3ps4Ltu+Hcq0dfibPexGu+hNSG7S14UnJQvToegNWWAgcJ+xD1
         a6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711618676; x=1712223476;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EsPXaaPvNui/Hla/IOxxrif4btj9zIbXB9wYdj0XRII=;
        b=VrqRGf+hvKOjt7obRBH57GnfjWCDPCaGwGz09paO7kdDXopgY5YiJIsQIhNc4N3P+H
         rw/XHOWPmOiCyJ84L4inP775uAz93TASlV7mWNZKDLRF3fPBYDa5DlZooXxAQstOs/e+
         dddsLJSHH6eyx7a2NFb9T05Zt+MoGApk0Fj0bYDStHFsyW6SfgVhDMdTa/Nevtmcm2fz
         pDEQZ+T+ZWStRFPC/w/ohMKZZkVUgJHdbcJ/PiMqN6eUHXayN4CVVBQpK8xQGRLMInFi
         OOa9bu8J5MXBzonMUTQrS0mTXVoShOQExYUgsqu2OJp28iEznBlbPpXvKgoXLrOv0K0r
         lQ8A==
X-Forwarded-Encrypted: i=1; AJvYcCVJhSOJtbsSjhLwWu23lfRLk1X7satu+HWUWiXTb4O7a4bjFfnvnzxDqsYQOaRnoUOJ0wgshgX228OxxKmY85XY2m1JewU4u1qFH/9O2AY=
X-Gm-Message-State: AOJu0Yx33n+S+Yzu5fgqM+H1f0GT4u+FINIY7idov1Fkyayso9fdKgkk
	KVikwl6KD/67MDo2RWzo9ssuzBRropyUsCOZpSBYOoekiVGpXNQqqbJyISgUWA==
X-Google-Smtp-Source: AGHT+IEyPiwZx5RdgDpOBoz1n4GWuuiw6Wx0omoRtVyJy6wghOVAOSyIfjVA/oJjCTEyw57OO62B9g==
X-Received: by 2002:a17:906:b1ce:b0:a4d:f681:c964 with SMTP id bv14-20020a170906b1ce00b00a4df681c964mr1557206ejb.28.1711618676485;
        Thu, 28 Mar 2024 02:37:56 -0700 (PDT)
Message-ID: <c5e4c6b5-c7bc-42e1-899f-9aedf6851890@suse.com>
Date: Thu, 28 Mar 2024 10:37:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] tools/misc: xenwatchdogd: make functions static
Content-Language: en-US
To: leigh@solinno.co.uk
Cc: andrew.cooper3@citrix.com, anthony.perard@citrix.com, slack@rabbit.lu,
 xen-devel@lists.xenproject.org
References: <55416d60-cae7-4e79-8bde-bc07ee9e3830@suse.com>
 <20240327181353.10951-1-leigh@solinno.co.uk>
 <20240327181353.10951-4-leigh@solinno.co.uk>
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
In-Reply-To: <20240327181353.10951-4-leigh@solinno.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2024 19:13, leigh@solinno.co.uk wrote:
> From: Leigh Brown <leigh@solinno.co.uk>
> 
> Make all functions except main() static in xenwatchdogd.c.

And once at it data then too, please.

Jan

