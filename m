Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1E8AF0BB3
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 08:33:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030205.1403820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWr1R-0000xN-HW; Wed, 02 Jul 2025 06:32:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030205.1403820; Wed, 02 Jul 2025 06:32:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWr1R-0000vP-EY; Wed, 02 Jul 2025 06:32:45 +0000
Received: by outflank-mailman (input) for mailman id 1030205;
 Wed, 02 Jul 2025 06:32:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWr1P-0000vJ-JN
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 06:32:43 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ac8261e-570e-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 08:32:41 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a522224582so3353632f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 23:32:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb39b900sm128316685ad.93.2025.07.01.23.32.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 23:32:40 -0700 (PDT)
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
X-Inumbo-ID: 5ac8261e-570e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751437961; x=1752042761; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PL4hYq+wBOgNLnUs3BaPdKT/vv7p218vvRzRbnfnEoU=;
        b=QL4P3NbFOf3iouYFxLRAEr5E4Q5n3iITuQSECPPe2mzv9qLkDhCn8gPYXnsc+AhGKM
         FEu2DhYd47d//y0CGa7UcyNwZcBNjwqr5YAZXyHj/BSXU+hAyKB+ul488Be8HXrC/bvk
         PvtTrxy1lzmwJq2yYozN3Rey4jfyzUMYiqm1WnQ9T5/395UOQbJadNvWVpuSWyLVntmi
         hJtEX2TlYWVbsL01B6JB96kV6fQWjjmG8YkEDrFbCWZSr+1owuvw7h36w92lYbmolG7z
         cF/yiagrJTuOn2OX4YMDQnKTWGUOEFKFPrkNLWes64hN9Bbl7d9MotyDJH/h/iUYuITf
         tyyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751437961; x=1752042761;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PL4hYq+wBOgNLnUs3BaPdKT/vv7p218vvRzRbnfnEoU=;
        b=dtTO1W9nEiHEWrMOhnXWXCfmQPqO2gz/QFOCitHWCS4OdRsEfPb1UXgYMhuXOE21F9
         j865e8NPzIFV9jylj6GwIElZMam8YmGHqEfyD9zLwQR3gNtGwZzUABZnQ2xS6eOcunvs
         AZxJTDC+0JdlhYdMeyuXkO6somL/HtaNpVgeLEGRyYI0VU02a99sv25KrH+vKq5i/h5S
         VIXU9WplUMEB55bGWuQgsluRMXO4A9vZ+hUo2KY4SHgyCCFkpmgS25PumCwaPlG1Fw8p
         k7O0GLZ4La8+EDazg40qaaxd2rniBlGB58nUORJ4+11lUkibUZSw26MG7JajtHtmdzQs
         mh0A==
X-Gm-Message-State: AOJu0YyVwm+Tlrdy9H09AKjNp1VDOtdUTnySlilhh5NyuSSwRQ4PvcrN
	u/QSplPMKiH9Fj5tV5kco94aizcM5nwaziVTx5sk8y/VxvTTp0XkPKniG6Cx/jOEEw==
X-Gm-Gg: ASbGncuIvnftGvVY9RrNa5l/3preR54OS55l3qdj9ukVY9IWnwD1nzbmT79RdyC8En1
	/2/YWevP8fQSiMQa793ctN++u0ksgJXaL1jIkOVr5OK+28x1nRRd0ee1ESg6YO1sMFujGRKO5aG
	T7rlvFhDp5Sw3p7oZdgMTzcRLDzIqwDUGonSB2XrE/jH6pSp/oW9W71Km3JVkToF1Xn99jTlYTY
	s5724uP0nLrbcFQN3WYecO2nmqWxXT40EfLvSufjYEgtOye68VWNcgHK4Cg0+oXL8YzHdnW1xto
	IakT2j8Db1xYoBL/jXsIvBmWUput8IQVjoh7xbPtHdPNJnljqwGp2lgZjyjmMUQ5ydaGG5ZNqXM
	ACJcsR/IjnoTgjw+GaJjrTJpuwJbvkLSDPXLsPYLvNL+GmaYTj0rvqC9DWA==
X-Google-Smtp-Source: AGHT+IECC+SSarKoX1YXCKTtAUQYr5/OgczUt+kasILSBiRsglVPMrbcgwjiIF2QlwQ8kdNivhrl5g==
X-Received: by 2002:a05:6000:250c:b0:3a6:f2c1:5191 with SMTP id ffacd0b85a97d-3b1fdc2222emr1045689f8f.4.1751437960619;
        Tue, 01 Jul 2025 23:32:40 -0700 (PDT)
Message-ID: <ed896b87-1d21-4315-917e-343e3f0b519e@suse.com>
Date: Wed, 2 Jul 2025 08:32:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] pdx: introduce a new compression algorithm
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2506271905350.862517@ubuntu-linux-20-04-desktop>
 <aGKnDHtRD5OLGaYj@macbook.local>
 <alpine.DEB.2.22.394.2506301726500.862517@ubuntu-linux-20-04-desktop>
 <1507b441-dd3c-4a24-beda-0d1d3143faf9@suse.com>
 <alpine.DEB.2.22.394.2507011338360.862517@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2507011338360.862517@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.07.2025 22:46, Stefano Stabellini wrote:
> On Tue, 1 Jul 2025, Jan Beulich wrote:
>> Sadly from this you omitted the output from the setup of the offsets
>> arrays. Considering also your later reply, I'd be curious to know what
>> mfn_to_pdx(0x50000000) is.
>  
> Full logs here, and debug patch in attachment.
> 
> (XEN) Checking for initrd in /chosen
> (XEN) RAM: 0000000000000000 - 000000007fffffff
> (XEN) RAM: 0000000800000000 - 000000087fffffff
> (XEN) RAM: 0000050000000000 - 000005007fffffff
> (XEN) RAM: 0000060000000000 - 000006007fffffff
> (XEN) RAM: 0000070000000000 - 000007007fffffff
> (XEN) 
> (XEN) MODULE[0]: 0000000022000000 - 0000000022172fff Xen         
> (XEN) MODULE[1]: 0000000022200000 - 000000002220efff Device Tree 
> (XEN) MODULE[2]: 0000000020400000 - 0000000021e2ffff Kernel      
> (XEN)  RESVD[0]: 0000000000000000 - 0000000000ffffff
> (XEN)  RESVD[1]: 0000000001000000 - 00000000015fffff
> (XEN)  RESVD[2]: 0000000001600000 - 00000000017fffff
> (XEN)  RESVD[3]: 0000000001800000 - 00000000097fffff
> (XEN)  RESVD[4]: 0000000009800000 - 000000000bffffff
> (XEN)  RESVD[5]: 0000000011126000 - 000000001114dfff
> (XEN)  RESVD[6]: 000000001114e000 - 000000001214efff
> (XEN)  RESVD[7]: 0000000017275000 - 000000001729cfff
> (XEN)  RESVD[8]: 000000001729d000 - 000000001829dfff
> (XEN)  RESVD[9]: 000000001a7df000 - 000000001a806fff
> (XEN)  RESVD[10]: 000000001a807000 - 000000001b807fff
> (XEN)  RESVD[11]: 000000001d908000 - 000000001d92ffff
> (XEN)  RESVD[12]: 000000001d930000 - 000000001e930fff
> (XEN)  RESVD[13]: 000000001829e000 - 000000001869dfff
> (XEN)  RESVD[14]: 000000001869e000 - 00000000186ddfff
> (XEN)  RESVD[15]: 0000000800000000 - 000000083fffffff
> (XEN) 
> (XEN) 
> (XEN) Command line: console=dtuart dom0_mem=2048M console_timestamps=boot debug bootscrub=0 vwfi=native sched=null
> (XEN) [00000006bfc302ec] parameter "debug" unknown!
> (XEN) [00000006bfcc0476] DEBUG init_pdx 294 start=0 end=80000000
> (XEN) [00000006bfcd2400] DEBUG init_pdx 294 start=800000000 end=880000000
> (XEN) [00000006bfce29ec] DEBUG init_pdx 294 start=50000000000 end=50080000000
> (XEN) [00000006bfcf1768] DEBUG init_pdx 294 start=60000000000 end=60080000000
> (XEN) [00000006bfd015a4] DEBUG init_pdx 294 start=70000000000 end=70080000000
> (XEN) [00000006bfd1444f] DEBUG setup_mm 252

This one is immediately after init_pdx(), i.e. by here the log messages from
Roger's patch (out of pfn_pdx_compression_setup()) should have appeared.
Which at least falsifies my earlier suspicion about there being an ordering
issue. You do have PDX_OFFSET_COMPRESSION=y in your .config, don't you? Are
we perhaps taking the only "return false" path in pfn_offset_sanitize_ranges()
that doesn't issue a log message? I can't see how we could plausibly take the
"Avoid compression if there's no gain" path in pfn_pdx_compression_setup()
itself.

Jan

