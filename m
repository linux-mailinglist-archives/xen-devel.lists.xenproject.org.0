Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D203890518B
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 13:46:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739235.1146221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHMQB-0005Na-OX; Wed, 12 Jun 2024 11:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739235.1146221; Wed, 12 Jun 2024 11:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHMQB-0005Ky-LO; Wed, 12 Jun 2024 11:45:43 +0000
Received: by outflank-mailman (input) for mailman id 739235;
 Wed, 12 Jun 2024 11:45:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h1N0=NO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHMQA-0005Kq-Lk
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 11:45:42 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b03eb47-28b1-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 13:45:40 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-579fa270e53so3459255a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 04:45:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57c75ab6297sm6475289a12.14.2024.06.12.04.45.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 04:45:39 -0700 (PDT)
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
X-Inumbo-ID: 4b03eb47-28b1-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718192740; x=1718797540; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ODzRth6Dmpaw3RHDhtgAUYcVH8M5z4K/UWksi07P3n8=;
        b=gdYN81b20D7Q8gA3tcN95wK9yu/MNeT0wZjgeCz/AKThMoMgXAbFx5tkb8D7uytMvX
         2vOPcUckM2LATjrtpR/Jx3p03btFlAvIlL3TDRYU7CZ8Ko0Zl/nbeawWneBiZpeT52cO
         vRdUmhBYayR+xVtcIc3iLG8CZ/iHcgbfD32EadCFhANDUmxHuLuTfQXdzKY9ann9BgZs
         X3dfDHbaxUdcYrFOjYp9dFLwd6UN2SYrM0eR9KaCLbTVbvcVzvWZkCkPUCcdVgENbzZk
         altDYicIPybBaoGrsXOHc04C8NGssrfWuMhF/fTEzQYxEhCJlV37IWGABKisEIbn84cy
         MtTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718192740; x=1718797540;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODzRth6Dmpaw3RHDhtgAUYcVH8M5z4K/UWksi07P3n8=;
        b=dQg83mTnXd7pzDDkrksMtaAulW/6pSj1yi2z1lEiCQbeV0RSRXHcrTDgwYjuDAuhPO
         dZKtyMn/dgZ0nSIvGbflL09h7ji3BkiIKKgAqpdzfilJs2UMCGZzqtF5mHTqQuSUhfIc
         xGfp03lA+rLK98mGn9/p44UExdz1P0QTaoSWrfb77yGPg2emFJSw2nFu+iyYD6ksQsbT
         VRwm+iC1R0xbViozPFclOkMMRGTe9eSlHdhMzzIUwYImyQ1LUuwSalpSLoiTAFouclgh
         jIIARue0ekvXQTyH1I9X6Uw+pfRYBVAe7uMPRa8b7GE4BgLYQyl+w3F5pYlS4XDJj/Ik
         t62Q==
X-Forwarded-Encrypted: i=1; AJvYcCXsWZDC4W0ip9VolNpeN+0WUU0oQdXj3MQIMdUOYSVnsS3y5hYGi2VX64Q+nBFMRKV3hqcUugNi3yL3cUZ4uGhaBPZgVDUw48DLoSRmAig=
X-Gm-Message-State: AOJu0YxJk0CKgFwdgKEjPyjTulbl8hJfnbqHqA6wVkX8cX2tM49/HWi9
	w41rc8hseX2cBX85c9KYvRzpDtH0wczKPuOzwNN2qRl6URB2m1GZtCizTviRiQ==
X-Google-Smtp-Source: AGHT+IFu5IndTRoDxRrrnaGWGrUuyO081/1KDUK9FrUPC2Po3TmzySz5TCbd41b7OBIARXpGjZzcbg==
X-Received: by 2002:a50:8e5d:0:b0:57c:6ae2:abda with SMTP id 4fb4d7f45d1cf-57ca9743b46mr1460555a12.5.1718192740109;
        Wed, 12 Jun 2024 04:45:40 -0700 (PDT)
Message-ID: <5f568372-5114-4cd7-92e1-aae5028c923c@suse.com>
Date: Wed, 12 Jun 2024 13:45:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19???] x86/physdev: replace physdev_{,un}map_pirq()
 checking against DOMID_SELF
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c7d12669-7851-4701-9b2d-0b22f9d32c1d@suse.com>
 <37ccb940-dfcd-419d-8cea-93800fd2c865@citrix.com>
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
In-Reply-To: <37ccb940-dfcd-419d-8cea-93800fd2c865@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.06.2024 13:05, Andrew Cooper wrote:
> On 12/06/2024 9:44 am, Jan Beulich wrote:
>> It's hardly ever correct to check for just DOMID_SELF, as guests have
>> ways to figure out their domain IDs and hence could instead use those as
>> inputs to respective hypercalls. Note, however, that for ordinary DomU-s
>> the adjustment is relaxing things rather than tightening them, since
>> - as a result of XSA-237 - the respective XSM checks would have rejected
>> self (un)mapping attempts for other than the control domain.
>>
>> Since in physdev_map_pirq() handling overall is a little easier this
>> way, move obtaining of the domain pointer into the caller. Doing the
>> same for physdev_unmap_pirq() is just to keep both consistent in this
>> regard. For both this has the advantage that it is now provable (by the
>> build not failing) that there are no DOMID_SELF checks left (and none
>> could easily be re-added).
>>
>> Fixes: 0b469cd68708 ("Interrupt remapping to PIRQs in HVM guests")
>> Fixes: 9e1a3415b773 ("x86: fixes after emuirq changes")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I think it is right to perform the domid lookup in do_physdev_op() and
> pass d down into physdev_{un,}map_pirq().
> 
> But I don't see what this has to do with the build failing.  You're not
> undef-ing DOMID_SELF, so I don't see what kind of provability you've added.

I'm talking of provability for the two functions in question. Not
globally of course.

>> --- a/xen/arch/x86/physdev.c
>> +++ b/xen/arch/x86/physdev.c
>> @@ -184,6 +170,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
>>  
>>      switch ( cmd )
>>      {
>> +        struct domain *d;
>> +
> 
> Please don't introduce any more of these.
> 
> We've discussed several times about wanting to start using trivial
> autovar init support, and every one of these additions is going to need
> reverting.
> 
> In this case, there's literally no difference having it at function scope.

Will do; sorry, habits.

Jan

