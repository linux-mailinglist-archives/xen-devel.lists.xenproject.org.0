Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BFB976B83
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 16:05:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797525.1207503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sokRZ-0002wY-TL; Thu, 12 Sep 2024 14:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797525.1207503; Thu, 12 Sep 2024 14:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sokRZ-0002uL-Qc; Thu, 12 Sep 2024 14:05:09 +0000
Received: by outflank-mailman (input) for mailman id 797525;
 Thu, 12 Sep 2024 14:05:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lDyH=QK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sokRY-0002uF-Co
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 14:05:08 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02ba91a4-7110-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 16:05:06 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-53659867cbdso1511719e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 07:05:05 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a901292f81esm198479666b.1.2024.09.12.07.05.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 07:05:03 -0700 (PDT)
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
X-Inumbo-ID: 02ba91a4-7110-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726149905; x=1726754705; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b/22D8rha8S1h7FKOosQkTt2t7d6H8HLC+SiNd7f+4k=;
        b=Ssf7p/gldl+93Rs1uOT6LbuepTthbu4nBFiatPWFCXzl4GAbYTI0PhxJLgwgn1qb7z
         7Ap8it5wQNHRN3lXXTx4+V6CsjFFwHnbqbwNjq1hHDT6YUmdBpgfKAReOd5uVWYgHr32
         I4QXcAjfjLOtdOrlC1pUIAdk07PQlB3O/M4Us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726149905; x=1726754705;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/22D8rha8S1h7FKOosQkTt2t7d6H8HLC+SiNd7f+4k=;
        b=jatXNRwWCLDG2TaqJM+gVEz311LqCe+aQgJk8m3YGpHzw93rdbM5kzUcJ3u/xdD9M6
         N+zhgdkJUayU/qqTff8sXiSZfhUt2B4dZSei1R/O8C0SnlIA5hbxYK7xbVcaWcSjZY2g
         KuRmfl9InTvXIjwLnRARgJxCcUEpVe76iHEE0U91f1E08+EIiT1YMPJQkc+FK7fP15cw
         6h3cS7qkW1/2OknadWlqRuUvj/quD4B5s5i/cUOjmStumNdcXabhtr4wcBmco/SIv4X9
         jtFcQG9GL+doFrGOtsk5wvgoNg2mDr5030QHRdX7r4Hh+7+zwpsvNRT376Htotl9t/IF
         RMng==
X-Gm-Message-State: AOJu0Yyt3tIX/lnnyvmJwA/1UiNoSndDgGrl9344wkDl7/3E4XDaLc0o
	WzOtgpDm7DLc9zqxhP8iKswCSU8B6r3s3/DmcxkkPKy/Cgpm2HFct8wbqwpj8KU=
X-Google-Smtp-Source: AGHT+IFda4RR2AIl66Xk3uH4U/zktqOwIgW+SSPQkF3IkdlaZRBi7eCVrlVb7N91x1i3nTIAqAxE4g==
X-Received: by 2002:a05:6512:3d92:b0:52c:e10b:cb33 with SMTP id 2adb3069b0e04-53678fec405mr2370253e87.50.1726149903908;
        Thu, 12 Sep 2024 07:05:03 -0700 (PDT)
Message-ID: <2d4c2234-c688-4e76-8d60-a08558eed7df@citrix.com>
Date: Thu, 12 Sep 2024 15:05:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/keyhandler: Move key_table[] into __ro_after_init
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Daniel Smith
 <dpsmith@apertussolutions.com>, Jason Andryuk <jandryuk@gmail.com>
References: <20240912125154.1708025-1-andrew.cooper3@citrix.com>
 <ZuLuk-Y3RKGZIi0d@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZuLuk-Y3RKGZIi0d@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/09/2024 2:37 pm, Roger Pau Monné wrote:
> On Thu, Sep 12, 2024 at 01:51:54PM +0100, Andrew Cooper wrote:
>> All registration is done at boot.  Almost...
>>
>> iommu_dump_page_tables() is registered in iommu_hwdom_init(), which is called
>> twice when LATE_HWDOM is in use.
>>
>> register_irq_keyhandler() has an ASSERT() guarding againt multiple
>> registration attempts, and the absence of bug reports hints at how many
>> configurations use LATE_HWDOM in practice.
>>
>> Move the registration into iommu_setup() just after printing the overall
>> status of the IOMMU.  For starters, the hardware domain is specifically
>> excluded by iommu_dump_page_tables().
>>
>> ept_dump_p2m_table is registered in setup_ept_dump() which is non-__init, but
>> whose sole caller, start_vmx(), is __init.  Move setup_ept_dump() to match.
>>
>> With these two tweeks, all keyhandler reigstration is from __init functions,
>> so register_{,irq_}keyhandler() can move, and key_table[] can become
>> __ro_after_init.
>>
>> No practical change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Daniel Smith <dpsmith@apertussolutions.com>
>> CC: Jason Andryuk <jandryuk@gmail.com>
>>
>> CC'ing some OpenXT folks just FYI.
>> ---
>>  xen/arch/x86/mm/p2m-ept.c       |  2 +-
>>  xen/common/keyhandler.c         | 10 +++++-----
>>  xen/drivers/passthrough/iommu.c |  4 ++--
>>  3 files changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
>> index 2ea574ca6aef..21728397f9ac 100644
>> --- a/xen/arch/x86/mm/p2m-ept.c
>> +++ b/xen/arch/x86/mm/p2m-ept.c
>> @@ -1497,7 +1497,7 @@ static void cf_check ept_dump_p2m_table(unsigned char key)
>>      rcu_read_unlock(&domlist_read_lock);
>>  }
>>  
>> -void setup_ept_dump(void)
>> +void __init setup_ept_dump(void)
> I would be tempted to just drop this function altogether and open-code
> the call to register_keyhandler().

That would involve exporting ept_dump_p2m_table(), and quickly started
detracting from the main purpose of the patch.

There are a whole bunch of keyhandler registration which are
unconditional out of an initcall.  I'd like to do something better, but
there's nothing completely obvious.

~Andrew

