Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B1CB0A530
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 15:29:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048767.1418947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucl9b-0007uY-Pt; Fri, 18 Jul 2025 13:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048767.1418947; Fri, 18 Jul 2025 13:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucl9b-0007t7-NB; Fri, 18 Jul 2025 13:29:35 +0000
Received: by outflank-mailman (input) for mailman id 1048767;
 Fri, 18 Jul 2025 13:29:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucl9a-0007Yt-NC
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 13:29:34 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e178294-63db-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 15:29:34 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ae0d758c3a2so327608266b.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 06:29:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6c79f139sm122151666b.29.2025.07.18.06.29.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 06:29:33 -0700 (PDT)
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
X-Inumbo-ID: 3e178294-63db-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752845373; x=1753450173; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ECqmc89meQ5UQZLTxnlBEmL8IR67TsRrnBopChPU6/A=;
        b=W+YowYDtu4eMUUhwKsP6nIFpxRKPPcbrs4f5LjNwaAVfBF/ny+9lL5t2KaHgJP9Nr7
         Ao5lMO9dMJiac0OqiGFF12JYKD/agKLBGNKwyZfciDf9hLwOKj9W0q0Gv63o5wg1Ifu9
         ilOGUdGbHkFttZvieuZcF3JpSJ/0hoh1Ao/K1jPzHAVPNtEr2xCqjUtbuSXwRp7CeVnc
         jK3Qw7wb0fLBO6uYVrj5Aa/xwRDRtTot25YkoUC+BsFcfUFBxGaruKY+hDuZbjqsG271
         bCetYaOjkwv+yKTf3bLvhs7Xhhm5fEq2tFR6k5StzWxhRrBy5cHDrZ5uQYVnn3a3Rhfk
         fefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752845373; x=1753450173;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECqmc89meQ5UQZLTxnlBEmL8IR67TsRrnBopChPU6/A=;
        b=r4OkxIWzyNRTrDkKsbZnATVMhqdbGXnOx5s7mGAT0KahNgEIXSxv7cC+KDZkB7z0vJ
         KQTVCPpsp3R4m/bzhuc58OJmgjOnhz4IYL7lzRrRIvzUefHq8Mje661IWq70qTXKqBrQ
         SFiZAGVTepuP9fOAJqSmxBb+3lxwx3a6jS2dHElOzNtfyM6S7vtH3+pNPtYyCxd8/rj0
         Cpr1JYpHKIGqYLaFYrw81VZekzwxa9ZCuj4nxsMmH6TVgLRhhrkQBeCGH/yiCOMhDwia
         2Qd90QrKNsYoYkR+oz8Gzfr6tKsbW8WDPnkIl7Z7d2RQGCCsKOgumfy2lHRqo2D3DVkF
         QBcg==
X-Forwarded-Encrypted: i=1; AJvYcCUfbO1UYaM5CqeZFOLA7MFoxu28io0WDItXyF/rvrrj/AIw18ueF7FTDrEzVqVq8wrEuFRk036Xv/g=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxc17bIyTJfU/OeFhEDaYpKY+3/dBav9zb5tisBW+Zee4KoYWGF
	scfoF3/MyKzWmp4AEAU/vVvzufDums3GjxAu8prTj5YbGlWvGTGT5zmUkiX1xD2/jQ==
X-Gm-Gg: ASbGncsLEgRWGb3n+HhrrwmZKAUmxx0jHtdMvanDzmiq1C7Shj0ywUTTcFYu/2mwfxh
	sQ7tA3ASwWGzaM7cRRB7QuxGi89JuG+IY7Jq/+xaixUTfQwKud8oWUSoxVdMBJH1HPnysOsZRhI
	DOB1cnrkA2NZX2EneGAD9ACOtSvltvyWOVPKl561bULkZE3sYWC5wEZqi1jXe7Yl4CbqoguXfow
	TUPMPEEkmGmxbN3fuvIwm4ALqwNbSmQEv8wnAiif5UhOzxcnLtSNo8CB5mLifrUcnl3XzDNAVi+
	Yae68OxMPhtAHBcrg6pVvbDIp+L1j/W7/o5HfQ4WkMl2E6w2d2Kuib/Hy9UJvyiC7pSTE3Nt0R2
	GLksgI7W+Hk2X44MHsaTZOTwlbAEOon2Ks/OTpAUBv8bwt64ZDi2AqUWapJj2+C0dwo2aQ2olpb
	NK8Mq8/O8=
X-Google-Smtp-Source: AGHT+IGCiG6eYDV/+8hq6SEbXykEypXMte+qFVcJx0fCR0kGtegn3pv84rs0oRQ4nMIvGPTEanznIw==
X-Received: by 2002:a17:907:3d0f:b0:ae3:7082:a7dd with SMTP id a640c23a62f3a-ae9c9ba9c96mr1087484166b.50.1752845373419;
        Fri, 18 Jul 2025 06:29:33 -0700 (PDT)
Message-ID: <68bfcc27-9b7e-4218-8241-293d41ae0689@suse.com>
Date: Fri, 18 Jul 2025 15:29:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/2] arm/pci: add pci_passhtrough_enabled check to
 pci_device_reset
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1752649797.git.mykyta_poturai@epam.com>
 <daa6b4a6f1e0d90ddf5fd4c25cd941e3fb0d4774.1752649797.git.mykyta_poturai@epam.com>
 <82575b1a-970a-4d70-8fdd-5615cd3f3195@suse.com>
 <65673df2-3219-4e7d-8e9d-51fa977ae3e7@epam.com>
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
In-Reply-To: <65673df2-3219-4e7d-8e9d-51fa977ae3e7@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.07.2025 13:52, Mykyta Poturai wrote:
> On 16.07.25 11:36, Jan Beulich wrote:
>> On 16.07.2025 09:43, Mykyta Poturai wrote:
>>> Without pci-passthrough=on Xen does not know anything about present PCI
>>> devices due to PHYSDEVOP_pci_device_add not executing.
>>
>> While the latter half of the sentence is true, Xen may know of PCI devices
>> be other means. It scans the bus itself after all on x86, under certain
>> conditions. Furthermore "pci-passthrough" is an Arm-only option, when the
>> change here affects x86 as much. The description therefore will need some
>> improvement; the code change itself is okay (on the assumption that it can
>> be justified properly).
> 
> Will adding an additional note that all of this only relates to Arm and 
> will not change x86 functionality be sufficient?

Probably.

Jan

> As far as I understand, 
> this sentence is completely true for Arm, even the yet-to-be-upstreamed 
> bus scanning routines in Xen are guarded by is_pci_passthroug_enabled in 
> the latest patches I've seen them in.
> 


