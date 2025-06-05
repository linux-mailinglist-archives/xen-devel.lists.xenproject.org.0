Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAF3ACEDE7
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 12:41:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006597.1385819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN829-0002nq-Bh; Thu, 05 Jun 2025 10:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006597.1385819; Thu, 05 Jun 2025 10:41:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN829-0002mA-9C; Thu, 05 Jun 2025 10:41:17 +0000
Received: by outflank-mailman (input) for mailman id 1006597;
 Thu, 05 Jun 2025 10:41:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uN827-0002kg-FK
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 10:41:15 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a3e3848-41f9-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 12:41:14 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a4fb9c2436so408453f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 03:41:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506bc85a0sm116829995ad.46.2025.06.05.03.41.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 03:41:12 -0700 (PDT)
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
X-Inumbo-ID: 9a3e3848-41f9-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749120073; x=1749724873; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5D6Cv0KNFWbLjXHjhf1vgO+AnuhxWstKmfRJQupoU/g=;
        b=BOIDkMN6I9B0dx4uDvv7b/jmFXkx7JWVZ7AMv9i2oIEn0xjatdgGWaSHDoxd/ir9+F
         c1DfkuAUp+n4I9txV2g3rzmJt5I4isVCumSkFCTPzZGJotyv/nxdvgAoCqKb1r5vTmqn
         UtCLY43xaCkjnUTFmoyQRJJYWrAiUkgYZGLK0SeJm+rVIX/b/ubzOpvvoW99DMWUJqvr
         9/mi2A3Fd19fkMsHF0EKaIGW0j9z7c5Z0G6XRTDBhgTBnHUPWBWUd6dTUF6Wa4Lpif6M
         WfbHuDXkOlcDopETZVoJATApSM0EYahSiKgSYqqlqc27D37oF0WT+XZSydHeMYXa/E6n
         DMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749120073; x=1749724873;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5D6Cv0KNFWbLjXHjhf1vgO+AnuhxWstKmfRJQupoU/g=;
        b=po7+rEv5mJfmVjCT/9EES8dwSm2AK7BeHJqHCCPsQSadtwPYNbjK+JHDbUOm8qK8W0
         BcLIh0MKjj5Hr+FJLxMLlJfj5NFM05HRqBof/T4F4I0LcPgwHu3qvC3InJripu/7WEPZ
         83PRcrf+UYeTVkIcyd1w6Zc06oMyXToBFq40wy+SevWI1q9OoXhb6clo1IIah5dbf2uX
         w6mkl03fU7ZpZ8fmkBjkA2LI92NboIJ+Tgyzd9fU331p9wX2qlr4sZ9wwiaRCW+uDHDo
         XubzX0cbGq576YXr8L+/kWiLBnpdJeqsg16C048Kgt4McvPjOrK58Lkj2o0Yvo1A+San
         7ydg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ7tDcodrg+Mm9+ba500MrFQOK+TFiPDpN45mNJrHT424SnXagFsJ7cQyLiSazgrIQM4zPR7DcNUg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwzgOIUXA+f4wVwDvLGn5ERkIjmOC1X0TilW6Wlgwg16wfQ/HHs
	CHdpSSc0xrDqIdxKUuMzIUVHNVQ0as7S+1q1SDtl2xhVxxzaQKA3Sh09LrCN9x5LyA==
X-Gm-Gg: ASbGnctzwOM4M9RoIv5oOU1zI5T87WRlZLnoKuR73EKNAAAlZX9nvi9+GTiIc9s8VO/
	/76h1u/kB9zZB8KSzn25yFIqSvZ4fcKxye6jeugdnyPLrU7/6Mea/F2AnvIv/agIeZCCuJG2BL4
	yoGd5oRPrzlGt6pKPm1Axutiww8oldlBuKEiLzmAgPEVvM8e2iHibJWvsfa0cjRH1lvcS0EHl9H
	vd4L7kpufwEH35+k0ochthxZAJriTQomT4P9VdjRSPqJDcBTY/tz9iw6C4TEHQSRSC9bcprRGha
	dmP+Gup2grLWarbEL2ipN8cM1afSx+AR5ZhmF4bqOCMkrw13NFYdKpUsFJxm1MN1dYr4pH6KFIh
	X0uKTXSmFZgjZQUVfnvokMA9xke6RBtYtunQu
X-Google-Smtp-Source: AGHT+IH/vjJlysWM/1C8EaKWZM2AXOlkgQZzB177cBdI3PPaWqYvsDaH6dyy5C6C0lzVtlQDHtNbpA==
X-Received: by 2002:a5d:4085:0:b0:3a5:2848:2e78 with SMTP id ffacd0b85a97d-3a528482f65mr1663136f8f.28.1749120073366;
        Thu, 05 Jun 2025 03:41:13 -0700 (PDT)
Message-ID: <9ec5079f-9bc1-4843-a266-d74bf0556619@suse.com>
Date: Thu, 5 Jun 2025 12:41:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] vpci: allow 32-bit BAR writes with memory decoding
 enabled
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250531125405.268984-1-stewart.hildebrand@amd.com>
 <20250531125405.268984-6-stewart.hildebrand@amd.com>
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
In-Reply-To: <20250531125405.268984-6-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.05.2025 14:54, Stewart Hildebrand wrote:
> Currently, Xen vPCI refuses BAR writes if the BAR is mapped in p2m. If
> firmware initializes a 32-bit BAR to a bad address, Linux may try to
> write a new address to the BAR without disabling memory decoding. Since
> Xen refuses such writes, the BAR (and thus PCI device) will be
> non-functional.

Doing this for 32-bit BARs only, with not even an outline what to do about
the same issue with 64-bit ones, seems like it won't buy us very much.

Jan

