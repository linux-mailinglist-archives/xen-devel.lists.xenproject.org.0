Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA286A32173
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 09:51:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886199.1295874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ti8So-0005X7-KK; Wed, 12 Feb 2025 08:51:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886199.1295874; Wed, 12 Feb 2025 08:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ti8So-0005Vi-Hk; Wed, 12 Feb 2025 08:51:22 +0000
Received: by outflank-mailman (input) for mailman id 886199;
 Wed, 12 Feb 2025 08:51:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ti8Sn-0005Vc-7X
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 08:51:21 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86287392-e91e-11ef-a075-877d107080fb;
 Wed, 12 Feb 2025 09:51:18 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5deb956aa5eso109239a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 00:51:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7b2adcd58sm715576566b.112.2025.02.12.00.51.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 00:51:17 -0800 (PST)
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
X-Inumbo-ID: 86287392-e91e-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739350278; x=1739955078; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WZyPZiy52blQiUWerixz1xN2c0ibru6BENCPV44GBzc=;
        b=eXA/i53IDUoxf0sKW1lIQqOlcv8HOwPAj/a7hnaPhYYhOtcHY1HfDjlLyfs8dJTaBO
         N1Fv0++6Cy86I3mMiYYMNaeIZ6S/xeohvGWnmWO8wmsqCq3ctajVF6iMvyVNK5NtVUw7
         Vfx8udPSh6bzhcNlx7XNsfpba9zLtubNxy/qiHPgVx5kvC2DbNVW7njdkbqj1e1aep7E
         bet7FBgqNFXvlBt7wonvF90pJnUXZKBkpKPrJkDtYECp1uSc+eVg4ZaZQ0sA5kSY847N
         wQ2FLJbhQqUFX2ZKndk7eZOoTOcWlL8hVuLr9Pwxa2nLsFVH7GLnCqs8p3cb5zeRmZHq
         HCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739350278; x=1739955078;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZyPZiy52blQiUWerixz1xN2c0ibru6BENCPV44GBzc=;
        b=WDPsVbRAZwfECtv5uQeF5I0w/FclC23heRPS8n5KUFlCqjIvqAftEPy4zUkDkycaZt
         nghtatNDs/mJvpCCnESHKxJPH6+Lv/rlvbbGk+Du5kGRM1XmGslMzH0iBuMa2XfVH09p
         uMbP7X84tDArnJhhJUhuGFtq2uLw6QodyEo74eZ9F5MLAdwWHe9w0Wk353adzHRuipoS
         yXLM9oykjXBnk2Iy7TOkIqE4gLV9s5JfQ124cy7jjsLNzpkh/fH4FJX+voZ4LTuPeJjG
         yD7SMMS2OoxlYEwz/P2XxZuwzhNahyvXyGaBX7kkUP/lgJ8p3Mh7bYY+gjAyje/VMoFP
         FZ9w==
X-Gm-Message-State: AOJu0Yyi/9yCZXH/LQFA1a2NNuJDkCI79YpBThoCDbvn5XFluOgQ934G
	fsNnJ+zajIKPXyaaQkBnrHqqSsFUzZhP7ybQCpph/ZJYnRXrPXvpYSOuWyBEoQ==
X-Gm-Gg: ASbGnctmgeCt5iNgLYcDLkWh684979nBcr6Q5hPsdC3Tgj2q/J9xl7ziLDyw+OkLwlV
	TmoEyPyzVsfeb1gpx6UGDH+DAcV4j1YykBn0SAPMOVQzMScwqd+oqDfSriAFYF5daUU6VEORaem
	C5nYvOcqOLy0YKdBO5ObkNMTR+C/vdIAW2zvqbYTxNZIJnlyvTdb1BzQKypoAy6OCblc/crojyY
	eSsDmz3YY6za75nZFdTjjVP6U5agYptrl9ktQh5BTHrahS1Fh3s48C0vz/BH/YMdldw5eLHHPQO
	u6ZjwcjMT5PzfgxNpMfUufoIrcTWx4XueTV+Qb423ZfPjWmhjmOVTJOEE9/ORSFyPT6ajm+A8tI
	V
X-Google-Smtp-Source: AGHT+IFJvEA21fC9RV4KYO0DnDX4x5ysFSfsGEtrWJ0YBWnI9pkDos1VE1+UDGcx2cOqbYtr+XL3jg==
X-Received: by 2002:a05:6402:26d3:b0:5dc:80ba:dda1 with SMTP id 4fb4d7f45d1cf-5deadd7d3e1mr4662364a12.9.1739350277649;
        Wed, 12 Feb 2025 00:51:17 -0800 (PST)
Message-ID: <6191ed5b-ec66-4054-a6bc-173ab578aa54@suse.com>
Date: Wed, 12 Feb 2025 09:51:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 v3 0/5] xen/x86: prevent local APIC errors at
 shutdown
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250211110209.86974-1-roger.pau@citrix.com>
 <Z6uZZrR9XvTFjtO9@macbook.local>
 <30b4c319-64fc-4a8f-bc8d-a60e10831357@gmail.com>
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
In-Reply-To: <30b4c319-64fc-4a8f-bc8d-a60e10831357@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.02.2025 09:33, Oleksii Kurochko wrote:
> 
> On 2/11/25 7:39 PM, Roger Pau Monné wrote:
>> On Tue, Feb 11, 2025 at 12:02:04PM +0100, Roger Pau Monne wrote:
>>> Hello,
>>>
>>> The following series aims to prevent local APIC errors from stalling the
>>> shtudown process.  On XenServer testing we have seen reports of AMD
>>> boxes sporadically getting stuck in a spam of:
>>>
>>> APIC error on CPU0: 00(08), Receive accept error
>>>
>>> Messages during shutdown, as a result of device interrupts targeting
>>> CPUs that are offline (and have the local APIC disabled).
>>>
>>> First patch strictly solves the issue of shutdown getting stuck, further
>>> patches aim to quiesce interrupts from all devices (known by Xen) as an
>>> attempt to prevent a spurious "APIC error on CPU0: 00(00)" plus also
>>> make kexec more reliable.
>>>
>>> Thanks, Roger.
>>>
>>> Roger Pau Monne (5):
>>>    x86/shutdown: offline APs with interrupts disabled on all CPUs
>>>    x86/irq: drop fixup_irqs() parameters
>>>    x86/smp: perform disabling on interrupts ahead of AP shutdown
>>>    x86/pci: disable MSI(-X) on all devices at shutdown
>>>    x86/iommu: disable interrupts at shutdown
>> This is now fully reviewed, can I get your opinion (and
>> release-acked-by) on which patches we should take for 4.20?
> 
> If my understanding is correct to unblock shutdown process, it is enough just
> to have only first patch merged, correct? So the first patch should be merged.
> 
> As second patch doesn't have functional changes, IMO, it could be merged to
> despite of the fact we have Hard code freeze period.
> 
> All other patches, I would like to ask additional opinion (as I am an expert in x86),
> at first glance it looks like an absence of these patches in staging branch will
> lead only to triggering "Receive accept error" which I believe won't block shutdown
> process, so these patches could be postponed until 4.21. On other side, if it is
> low-risk fixes then we could consider to merge them now.

I'm not Roger, but as a data point: While I'm uncertain about patch 2, all
others in this series will very likely be backported anyway.

Jan

