Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 620C8859F21
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 10:05:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682724.1061851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbza6-0005gv-Dw; Mon, 19 Feb 2024 09:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682724.1061851; Mon, 19 Feb 2024 09:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbza6-0005f6-Am; Mon, 19 Feb 2024 09:04:58 +0000
Received: by outflank-mailman (input) for mailman id 682724;
 Mon, 19 Feb 2024 09:04:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SL20=J4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rbza4-0005f0-EQ
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 09:04:56 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2e3d09a-cf05-11ee-8a52-1f161083a0e0;
 Mon, 19 Feb 2024 10:04:55 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-512b13bf764so862010e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 01:04:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m8-20020a05600c4f4800b00411fb769583sm10793802wmq.27.2024.02.19.01.04.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 01:04:54 -0800 (PST)
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
X-Inumbo-ID: f2e3d09a-cf05-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708333495; x=1708938295; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QHf+Vm3ybdBP7o7l3iGkjjLO2k//up9DJktTuwI94xM=;
        b=aqo/w9QD+SJBKpw2Jkh/yLZgf0kETT89XVoUDvUvWo1XNVVsujYpX8WOmTyAHXD3pN
         uS53Tp40xRcbFsnTxIheWqo0aa7rPfrOF/1sWHLhP1jaXof/4OiJNo8TUuCX42fcIkH+
         Esbvg2+tLG+vFARFM0gV46IC0ED8A+E3iG2mHxi8p2Konl6hhDEAYLQPOUGFcoeNKvC4
         t0QilX5qZ6mh4Ij6W8Wmtvp5/o5l4RlMowakFq+XKYpBhSd482Ttsndd+qT+yfWXKfan
         BQkLkMq89hYmXu5rvDXvsmf3u3Tb3UnwNCxjY0aD2Q5o8gz4OlFYTQq61QdXp4DsMgyF
         LUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708333495; x=1708938295;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QHf+Vm3ybdBP7o7l3iGkjjLO2k//up9DJktTuwI94xM=;
        b=QvIYKZ8IRx1d2J/P7mtMUyGFM1rli7LIaHDRGsP6i4+395YOSkAPREDDbzzMKoWLLZ
         P4d49VlH1BLzFPJrTyuT6sSO72O5sIf+BwrF5QZrqpOSRq5TQTcY+l/4k+wW8+pk90Db
         Kj4AtK5n4J2pXpus5493RZvCo5Hhk3+APvXxTn0BlZ5KufperTp3WCbL2SFYPl8oxJz2
         Lt2zJc6TT5Qtk0gG++nC52KQ5NeswA6PUA9GJCysyIbDX6joWlYTinclbkxcutPd1f6I
         MTivqQ00q5/zU9f0ngWPqzgGSlX0D2uwvM4iyEUlsX7K1EN/ybsqd1Jvuz3e5KrgQ3bj
         tOHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWd2r0lP9syPgLNjLjZlu/eKonQDEL1Qu35wQqPPH/G2l8dGCwWWiShKmGqD0NYXBdnzmPkS/UDmze18sfOaNM6mRjzi8D6jWDR8S8BgDc=
X-Gm-Message-State: AOJu0YzFPo+7Gw3OCjPfPMrXK1O3MQoBmTuqQoTOTrzqjx2SHzmCg1OE
	8ANA0YDXO+AKkpeK/nX3yROA3gH8eA8qZ+F/NSnVHopZMexbdr5PnNMge0glGg==
X-Google-Smtp-Source: AGHT+IGV0Xc8478b3yoQVK5bYdF55An23GHPjzwZgLvbJP1ZCll3fDS81HijftNJ3+/VnwaErbudtg==
X-Received: by 2002:a05:6512:200e:b0:512:8dad:2918 with SMTP id a14-20020a056512200e00b005128dad2918mr6849934lfb.53.1708333494820;
        Mon, 19 Feb 2024 01:04:54 -0800 (PST)
Message-ID: <d6b6ed42-312b-4b74-9b8e-5e7a04627eee@suse.com>
Date: Mon, 19 Feb 2024 10:04:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/vmx: add support for virtualize SPEC_CTRL
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240215164653.27210-1-roger.pau@citrix.com>
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
In-Reply-To: <20240215164653.27210-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.02.2024 17:46, Roger Pau Monne wrote:
> The feature is defined in the tertiary exec control, and is available starting
> from Sapphire Rapids and Alder Lake CPUs.
> 
> When enabled, two extra VMCS fields are used: SPEC_CTRL mask and shadow.  Bits
> set in mask are not allowed to be toggled by the guest (either set or clear)
> and the value in the shadow field is the value the guest expects to be in the
> SPEC_CTRL register.
> 
> By using it the hypervisor can force the value of SPEC_CTRL bits behind the
> guest back without having to trap all accesses to SPEC_CTRL, note that no bits
> are forced into the guest as part of this patch.  It also allows getting rid of
> SPEC_CTRL in the guest MSR load list, since the value in the shadow field will
> be loaded by the hardware on vmentry.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



