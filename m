Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 452E49085D2
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 10:13:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740489.1147576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI23D-0007Yb-Hs; Fri, 14 Jun 2024 08:12:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740489.1147576; Fri, 14 Jun 2024 08:12:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI23D-0007WT-FA; Fri, 14 Jun 2024 08:12:47 +0000
Received: by outflank-mailman (input) for mailman id 740489;
 Fri, 14 Jun 2024 08:12:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5IQt=NQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sI23C-0007WN-4R
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 08:12:46 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfada994-2a25-11ef-b4bb-af5377834399;
 Fri, 14 Jun 2024 10:12:43 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-57c83100c5fso1946673a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jun 2024 01:12:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72cdffcsm1947325a12.6.2024.06.14.01.12.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 01:12:41 -0700 (PDT)
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
X-Inumbo-ID: dfada994-2a25-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718352762; x=1718957562; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=de4i5K8rRLFBrvE5Dl/eCQ0mxMUURyt44lvMGtKgvls=;
        b=MI0JAyajzMvuU6FUB9hyj2kcf2ZmKLq1yu7SsF6b2OILO71ae/PQqgTCPKVAChoT0r
         L1g1yMj/a5R3QNEqMSTQBr/+mIWDCRwBIpof1Eo6ZzlY+3pPIvUGLOdTdI/1PxMIUNIi
         A9GGA6jcw+94YvpzeCe8FS08Fva5wleofU8IvxyWS9NY/pbAmCiJfMkQQw9qcdM5Myrk
         WtSikSobqqwrR23k0+6arKPoqM9LVWHRaImujGuIXW3O1f/xliCbol/AuJdlKCimExoo
         wcamvidRa6awr42jBTzGmeF4E0DE8ScDc2jwHIPez+MBCk9Q/HEvvoVoDQDnXfwtxcXK
         9yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718352762; x=1718957562;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=de4i5K8rRLFBrvE5Dl/eCQ0mxMUURyt44lvMGtKgvls=;
        b=gS8LjROMrivVX2hPLYqz7NoqtL1cW63O5ah8UQtB47d7iO9iGv1JXOZn5zZiLEkM88
         MshdAhnAMGZ4irdnjfKrrON+Jt5KSlYWILihQ7J20Xm3VJt1Ttm9xjeqH4IWx+07dhUW
         arIgf2XgEnPPFXNfNY6ksHxyQzS7mNPSd8FjDJ7tfBZ5cofat8EpgeEbIrYrF14XV0Sb
         tg5S0I6ssXLHrqEZPNi6G4q/TAWDDBmPM7HtnEep0rbXRQxf4C3Gw728uMVY0xijaXEU
         Jg2+ivNv55nXjeMONEygeJ9QsPrOHn+DmM2W7kDL9as+YndsA76zRH5bogu81Rg+Df/0
         5Fgg==
X-Forwarded-Encrypted: i=1; AJvYcCUSMOVuq7Zj9vjO0/s//zXLCvK69vKTOhjZAn2w2V/5+OlHzBTexegJrjleyNmMSF05fGWzeQsbghLyR2IcY1T721EMWjGrVO6U+vcBYlY=
X-Gm-Message-State: AOJu0Yyul0id0roZvCT6kKnVZVzO9x8LXE/Q/jkYsZ9pQldB+1aXwcDp
	WidRIBXRtAAITt2oxBky/WDTZ8g5G45ez3N9YPFADZ+KXGBVhsue62/C8m7fcQ==
X-Google-Smtp-Source: AGHT+IG4ypwXYWti4VpFUt5WlzvdS4pKcygUt3xXM3lvF61LJZ2VjRyjAZOyhLBYk9dQcuL2o9VyAw==
X-Received: by 2002:a50:d75a:0:b0:57c:6f1d:1926 with SMTP id 4fb4d7f45d1cf-57cbd68f814mr1374768a12.22.1718352762086;
        Fri, 14 Jun 2024 01:12:42 -0700 (PDT)
Message-ID: <af1f966b-b28f-4a14-b932-3f1523adeff0@suse.com>
Date: Fri, 14 Jun 2024 10:12:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Design session notes: GPU acceleration in Xen
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Ray Huang <ray.huang@amd.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>
References: <Zms9tjtg06kKtI_8@itl-email>
 <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com> <ZmvvlF0gpqFB7UC9@macbook>
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
In-Reply-To: <ZmvvlF0gpqFB7UC9@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.06.2024 09:21, Roger Pau Monné wrote:
> On Fri, Jun 14, 2024 at 08:38:51AM +0200, Jan Beulich wrote:
>> On 13.06.2024 20:43, Demi Marie Obenour wrote:
>>> GPU acceleration requires that pageable host memory be able to be mapped
>>> into a guest.
>>
>> I'm sure it was explained in the session, which sadly I couldn't attend.
>> I've been asking Ray and Xenia the same before, but I'm afraid it still
>> hasn't become clear to me why this is a _requirement_. After all that's
>> against what we're doing elsewhere (i.e. so far it has always been
>> guest memory that's mapped in the host). I can appreciate that it might
>> be more difficult to implement, but avoiding to violate this fundamental
>> (kind of) rule might be worth the price (and would avoid other
>> complexities, of which there may be lurking more than what you enumerate
>> below).
> 
> My limited understanding (please someone correct me if wrong) is that
> the GPU buffer (or context I think it's also called?) is always
> allocated from dom0 (the owner of the GPU).  The underling memory
> addresses of such buffer needs to be mapped into the guest.  The
> buffer backing memory might be GPU MMIO from the device BAR(s) or
> system RAM, and such buffer can be paged by the dom0 kernel at any
> time (iow: changing the backing memory from MMIO to RAM or vice
> versa).  Also, the buffer must be contiguous in physical address
> space.

This last one in particular would of course be a severe restriction.
Yet: There's an IOMMU involved, isn't there?

> I'm not sure it's possible to ensure that when using system RAM such
> memory comes from the guest rather than the host, as it would likely
> require some very intrusive hooks into the kernel logic, and
> negotiation with the guest to allocate the requested amount of
> memory and hand it over to dom0.  If the maximum size of the buffer is
> known in advance maybe dom0 can negotiate with the guest to allocate
> such a region and grant it access to dom0 at driver attachment time.

Besides the thought of transiently converting RAM to kind-of-MMIO, this
makes me think of another possible option: Could Dom0 transfer ownership
of the RAM that wants mapping in the guest (remotely resembling
grant-transfer)? Would require the guest to have ballooned down enough
first, of course. (In both cases it would certainly need working out how
the conversion / transfer back could be made work safely and reasonably
cleanly.)

Jan

> One aspect that I'm lacking clarity is better understanding of how the
> process of allocating and assigning a GPU buffer to a guest is
> performed (I think this is the key to how GPU VirtIO native contexts
> work?).
> 
> Another question I have, are guest expected to have a single GPU
> buffer, or they can have multiple GPU buffers simultaneously
> allocated?
> 
> Regards, Roger.


