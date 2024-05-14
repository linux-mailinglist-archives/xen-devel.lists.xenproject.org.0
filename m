Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB408C4DA5
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 10:22:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721230.1124495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6nQt-0008PJ-Ou; Tue, 14 May 2024 08:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721230.1124495; Tue, 14 May 2024 08:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6nQt-0008NN-Kt; Tue, 14 May 2024 08:22:47 +0000
Received: by outflank-mailman (input) for mailman id 721230;
 Tue, 14 May 2024 08:22:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6nQs-00085M-Dz
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 08:22:46 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 228be3f5-11cb-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 10:22:42 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a5a89787ea4so49610166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 01:22:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a60eabd3csm302014266b.108.2024.05.14.01.22.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 01:22:44 -0700 (PDT)
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
X-Inumbo-ID: 228be3f5-11cb-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715674964; x=1716279764; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ghA2R+lU03Q6G/NuBzkmc5Rce/7J7EYxK/x13WwjxI=;
        b=GnXdAx2Yj7UXW5LNCByLGJj92VDMHiEj8Gy65jflATcqiNgETyxy044wOMvC8aCUI6
         CDBsn0Cia1yIY9NTXnRF+Nwl+wCquFNkZ+TMowVBWaLliKROQ97RCeOo4DysZdSfEOwa
         uupl65NCEH9TO6lK3+j5hgLPT4GsJw2W7u82houT6WF0E8I/v2Oq6g51M7JPQhoJzIOB
         JHHYkMQ8J3xQw1I3vAL8GFNMOjxDXYb+3mTSKpMmAxGsOoa8En3FWdQzerCYp4rSMMtE
         aRAegKq8gg6AUnjYx2crkfml0zrDET7mmxuShOXREtWsnCJrDSr1JVLjPsPX7PzGr+UI
         ZDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715674964; x=1716279764;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ghA2R+lU03Q6G/NuBzkmc5Rce/7J7EYxK/x13WwjxI=;
        b=WdTej+9jBDlAc6ISHXyMfTIrGv70jkKunK/P/3oMLnADMQ5Q/o6KChiWLqROM4HPwI
         fLmXSxa8NT8T/xbwROqW67bEk0YcSBZ3ohyfFiLVkZuZiw2NE0yWgqhAfTMKVZ3fyD8m
         4ixP1R3F9JiMZyPERz/GEsdSWax3biI5uksnTAiY9qJf3/FCzlVzxmhPNI4TQoqByyX7
         Dz3/0MvtOYoLTnEQQxfAR1A/w4IYPOeOeM2p2ke1f18d7Xm8eHyjFPm2xmDLYxE6c6ox
         t0trjv4/y5gSjPlJudkUQoS/I8Hu5sMQynwU5oYworhE689mUZe6Spl1l8J4kI+SESMM
         aHvw==
X-Gm-Message-State: AOJu0YxY9KY1hpAVryYITY/9fVD0CD/Q2a7o+TTcMapzMQb2eOn9VjXX
	lOVPiXR2Rgl8qZoAtFfAemX+rOcT3/XPjBs/hb8Qj/rb5aCVJZDGSRLWyhG1NA==
X-Google-Smtp-Source: AGHT+IGsxV3iQ+uyEOLYKcZoewiKqXDRnuwJVl01OOdOF83YbKFALYxkJUP5uvD9DyCibK6skmIJSA==
X-Received: by 2002:a17:906:da8b:b0:a59:bdb7:73f8 with SMTP id a640c23a62f3a-a5a2d66a3b4mr1040337666b.47.1715674964315;
        Tue, 14 May 2024 01:22:44 -0700 (PDT)
Message-ID: <08503965-4ba9-4fe3-a176-895623f4ad92@suse.com>
Date: Tue, 14 May 2024 10:22:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Serious AMD-Vi(?) issue
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Kelly Choi <kelly.choi@cloud.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <ZgHwEGCsCLHiYU5J@mattapan.m5p.com>
 <ZgRXHQpamLIdu7dk@mattapan.m5p.com>
 <c2ce4002-58d5-48a3-949c-3c361c78c0ac@suse.com>
 <ZhdNxWNpM0KCzz8E@mattapan.m5p.com>
 <2aa4d1f4-ff37-4f12-bfbb-3ef5ad3f6fdd@suse.com>
 <ZiDBc3ye2wqmBAfq@mattapan.m5p.com>
 <f0bdb386-0870-4468-846c-6c8a91eaf806@suse.com>
 <ZiH0G5kN6m+wlNjn@mattapan.m5p.com> <Zj7vkp4r0EY9rxT4@mattapan.m5p.com>
 <ZkHTC4RpUSpKj4wf@macbook> <ZkJz9U2A/mVKnkjA@mattapan.m5p.com>
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
In-Reply-To: <ZkJz9U2A/mVKnkjA@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.05.2024 22:11, Elliott Mitchell wrote:
> On Mon, May 13, 2024 at 10:44:59AM +0200, Roger Pau Monné wrote:
>> Why do you mask the device SBDF in the above snippet?  I would really
>> like to understand what's so privacy relevant in a PCI SBDF number.
> 
> I doubt it reveals much.  Simply seems unlikely to help debugging and
> therefore I prefer to mask it.

SBDF in one place may be matchable against a memory address in another
place. _Any_ hiding of information is hindering analysis. Please can
you finally accept that it needs to be the person doing the analysis
to judge what is or is not relevant to them?

Jan

