Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B7D9DACAF
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 18:46:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845025.1260520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGM6e-00044t-Eh; Wed, 27 Nov 2024 17:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845025.1260520; Wed, 27 Nov 2024 17:45:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGM6e-00042l-Bk; Wed, 27 Nov 2024 17:45:40 +0000
Received: by outflank-mailman (input) for mailman id 845025;
 Wed, 27 Nov 2024 17:45:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k0uU=SW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tGM6c-00042f-8u
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 17:45:38 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65e99e26-ace7-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 18:45:32 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ff976ab0edso76812071fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2024 09:45:32 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa53299ff77sm590619966b.73.2024.11.27.09.45.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2024 09:45:30 -0800 (PST)
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
X-Inumbo-ID: 65e99e26-ace7-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzEiLCJoZWxvIjoibWFpbC1sajEteDIzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjY1ZTk5ZTI2LWFjZTctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNzI5NTMyLjA1Mzk4Mywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732729531; x=1733334331; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ncIHqWrPV6/2UhkUyYKUe1wcSIL6GbhDBV/cprgzeTU=;
        b=PezLahInnpVQtqR/dCeGwZmB5z5xQokXwxcE+SDB7PkOpXNmlOotq6F4/28rFIIKBz
         28eo/bg8Au3T3vNRh7hem+Nbu9PPpnpoqq/wSmQNyy2nEFqufZALeRE33lqVWKZ2go88
         lD04gFEQziEUIYYyOAs71KeOyHNpL9wtx3PgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732729531; x=1733334331;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncIHqWrPV6/2UhkUyYKUe1wcSIL6GbhDBV/cprgzeTU=;
        b=pkbaaA4v0oC+RklmBPQR6eXRGzAeVfgg7HljwNoSAAU9RCwvLjANV/Qfoa96VyNQ3h
         SBBKdkimxvEQ9oy38hdizBCzXgTIkTuq3Dx5b9H9/nhQkJeMAheRlxcAhz09p/pp9Ho3
         ZWDrpoxOQnmCkUPEqWlecGcSieo22t4MMXAr3ATITLC5wr+xb/CW3XZxCEBBefYIqWuu
         nf+A89sMR7LuHrbMogYCArFghVGmxjsAuNtuihX6Ksp3k1Mk7k80zinSF/ibFrRizyal
         OemS+83ckYysFhDV2kNO/Te8WHFi+Tl9Jm3hsrBa7Sh2f4io5Wbj+K/0T8EsmssI05Dt
         GfoA==
X-Gm-Message-State: AOJu0YxopKOHOwlo5G4ZsvEvRmjcRWu324CPx8Z7cF6xr3EjK/Hr3LAI
	XE4lLPb69CdMtAQbAevu5zCkHTVejnlrVVdM8kqFBzfEvSfUsiLgIFH88Gw6+Wk=
X-Gm-Gg: ASbGncuTG7WBvyj0YSMofH6iAwurpBl7XCjKdLTeA9ICJ3ttLmOxFjKXhZQqkONJHMa
	/U+BNpGoItkV6UU7KZJ1CoGVqcEsv7chUgC1Rfna+TQ+WtqohDbNWFA56tNjbgwVopJH2huujYq
	0ZivMKXyvRDuYhElo/P9RAPzVo6UmJ0J9Z0ZQlO1VqFW0TXZHfs8lpUKWA6NX0GLUybbzyymDlJ
	bR32/DG6TGvkl9pK4+xGYT+Agn2LqhUlyoLWU1b6RhgyRXFU7ixobQK2yLOx8w=
X-Google-Smtp-Source: AGHT+IHTc3oOy82JnTOcEnxJCSx8it9VR8P0lCoy/M0/SsDcHMZenZNCq07RY10ekeOm24nqrfklwA==
X-Received: by 2002:a05:6512:3f1f:b0:53d:d3ff:77f6 with SMTP id 2adb3069b0e04-53df010900cmr2725325e87.46.1732729531393;
        Wed, 27 Nov 2024 09:45:31 -0800 (PST)
Message-ID: <63cf9731-61ff-472b-94fe-06b3a4fa5763@citrix.com>
Date: Wed, 27 Nov 2024 17:45:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/APIC: Remove workaround Pentium 3AP APIC_ESR erratum
To: Javi Merino <javi.merino@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <3270b77c005745dcf56cc833bdf3e4c703190b05.1732639041.git.javi.merino@cloud.com>
 <20241126205859.23090-1-andrew.cooper3@citrix.com>
 <j743is6qrolxcblkz7q5ta46l2y6vad3e4vetcrgtziqpdpo6y@q7tsoe45ltdf>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <j743is6qrolxcblkz7q5ta46l2y6vad3e4vetcrgtziqpdpo6y@q7tsoe45ltdf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/11/2024 10:03 am, Javi Merino wrote:
> On Tue, Nov 26, 2024 at 08:58:59PM +0000, Andrew Cooper wrote:
>> The SDM instructs software to write 0 to ESR prior to reading it.  However,
>> due to an original Pentium erratum, most logic skips the write based on there
>> being more than 3 LVTs; a stand-in to identify the Pentium.
>>
>> Xen, being 64bit, doesn't need compatibility for i586 processors.
>>
>> Introduce a new apic_read_esr() helper, quoting the SDM to explain why a
>> function named apic_read_esr() has a write in it too.
>>
>> Use the new helper throughout apic.c and smpboot.c, which allows us to remove
>> some useless reads of APIC_LVR.  This in turn removes the external callers of
>> get_maxlvt(), so make it local to apic.c
>>
>> No practical change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Javi Merino <javi.merino@cloud.com>
>>
>> Based on Javi's patch correcting error_interrupt()
> Fair enough.  I was only looking at error_interrupt() and missed the
> bigger picture. This patch is more comprehensive and this is very nice:
>
>> Bloat-o-meter reports:
>>
>>   add/remove: 0/1 grow/shrink: 0/3 up/down: 0/-269 (-269)
>>   Function                                     old     new   delta
>>   get_maxlvt                                    48       -     -48
>>   __cpu_up                                    1465    1417     -48
>>   clear_local_APIC                            1109    1050     -59
>>   setup_local_APIC                             942     828    -114
>> ---
>>  xen/arch/x86/apic.c             | 29 ++++++++++-------------------
>>  xen/arch/x86/include/asm/apic.h | 24 +++++++++++++++++++++++-
>>  xen/arch/x86/smpboot.c          | 17 ++++-------------
>>  3 files changed, 37 insertions(+), 33 deletions(-)
> Reviewed-by: Javi Merino <javi.merino@cloud.com>

Thanks.  Are you happy for me to merge the two patches?

~Andrew

