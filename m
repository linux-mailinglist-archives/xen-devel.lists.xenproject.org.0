Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E13C20CD04
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 09:42:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpoQp-0000uW-PH; Mon, 29 Jun 2020 07:42:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xxse=AK=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jpoQo-0000uR-5V
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 07:42:22 +0000
X-Inumbo-ID: 10797e02-b9dc-11ea-bca7-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10797e02-b9dc-11ea-bca7-bc764e2007e4;
 Mon, 29 Jun 2020 07:42:21 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id a6so15479106wrm.4
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2020 00:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=G8h4srgt/O2LGLuQVDIDxdaXLHaIRe/uLhzvy6b+R8Q=;
 b=glQkoH9IppBkTxvjGWREd6jau8JYPOReycuVYck6AMb71Dc6VQjbSn+2b2eo498kj7
 56IF2BqbZHODZnqV9BVJk2C9uH1DT2mhAFB2KlW9UUitaooX5jwexng6C/cp4Fe7YQC8
 TGcpwZzAwsHr+eNrAtQV2Km9wbCitO5Bp/3RExPgVmB0qp2kfEiQn8EcdK1UWXRFpCKV
 Sn976oVI8fOkfbtGvwSFcqqw7kudfRSypbhMhFcEPP9RIuXcNZ36gVNSXfhj+Khj78aE
 QNzMxNoffMS6YuIA9cYEfLaWZjvk6JbdoTPQ4KBm/2wy2BObfMTLJJ6ACJQaZXZXcMe7
 Jz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=G8h4srgt/O2LGLuQVDIDxdaXLHaIRe/uLhzvy6b+R8Q=;
 b=jEnOGrFxaSIgk5d/ZP7VtUe2/CZpxP4VaSjrrXURuC1gB3sJzuvCRyviZ7cHV2Iszu
 q8/0Bk48Tx/dgJixa7LdASyo3H627CzJp6jjFwNKevSQo0XWIzFRampooNfHUYv+jta+
 zmVzexEE3UPZBXJcSxETgRQnvQYI3hqJoP40qWG8JfXx1GYHVck7UfMQMe1bEhHb9fbO
 qO2iI9ahm6Lt1Nx8rmTCjooENXfSK0+J7w4sLvdoPbBTrvCzEoiC+MIqQkazqHIafZiy
 Z+uA7MBHAtTv5WFJx2/qoSFoyzyb34evbNzse683kD4JL4yThSuDTtWw325CbSsxBSiM
 O4Lg==
X-Gm-Message-State: AOAM533R4ScnmzxYRAMlJH2sPDgIiypuBl3wCP4437ji1VRU9alcMKdj
 TXOG1kWSoG04r3LFemhu2Lo=
X-Google-Smtp-Source: ABdhPJzyAp8n8/vzQI1N7/ffyGNbLDtVc0xx6JoIvG8U/ODKw5lwTtdj5CusiITL1oL9x6hN5vcYZg==
X-Received: by 2002:adf:dd4a:: with SMTP id u10mr15636976wrm.169.1593416540478; 
 Mon, 29 Jun 2020 00:42:20 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id 33sm41252858wri.16.2020.06.29.00.42.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jun 2020 00:42:19 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>
References: <20200619223332.438344-1-volodymyr_babchuk@epam.com>
 <20200619223332.438344-3-volodymyr_babchuk@epam.com>
 <alpine.DEB.2.21.2006221809380.8121@sstabellini-ThinkPad-T480s>
 <87ftampkd7.fsf@epam.com> <2df789f3-e881-36a3-51f4-010b499990f5@xen.org>
 <alpine.DEB.2.21.2006231403220.8121@sstabellini-ThinkPad-T480s>
 <b1891206-b883-46b9-70a3-3027a931d2ed@xen.org>
In-Reply-To: <b1891206-b883-46b9-70a3-3027a931d2ed@xen.org>
Subject: RE: [PATCH v2 2/2] optee: allow plain TMEM buffers with NULL address
Date: Mon, 29 Jun 2020 08:42:18 +0100
Message-ID: <000301d64de8$d1811f20$74835d60$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQF8aMotKGFAAmO8nEfAR6Jir94dVQJSzqciAe2X8UkCbENBnAId7rd6AcYXkBoCj8igFKk5/Aqw
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, op-tee@lists.trustedfirmware.org,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 26 June 2020 18:54
> To: Stefano Stabellini <sstabellini@kernel.org>; paul@xen.org
> Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; xen-devel@lists.xenproject.org; op-
> tee@lists.trustedfirmware.org
> Subject: Re: [PATCH v2 2/2] optee: allow plain TMEM buffers with NULL address
> 
> (using paul xen.org's email)
> 

Thanks. Avoids annoying warning banners :-)

> Hi,
> 
> Apologies for the late answer.
> 
> On 23/06/2020 22:09, Stefano Stabellini wrote:
> > On Tue, 23 Jun 2020, Julien Grall wrote:
> >> On 23/06/2020 03:49, Volodymyr Babchuk wrote:
> >>>
> >>> Hi Stefano,
> >>>
> >>> Stefano Stabellini writes:
> >>>
> >>>> On Fri, 19 Jun 2020, Volodymyr Babchuk wrote:
> >>>>> Trusted Applications use popular approach to determine required size
> >>>>> of buffer: client provides a memory reference with the NULL pointer to
> >>>>> a buffer. This is so called "Null memory reference". TA updates the
> >>>>> reference with the required size and returns it back to the
> >>>>> client. Then client allocates buffer of needed size and repeats the
> >>>>> operation.
> >>>>>
> >>>>> This behavior is described in TEE Client API Specification, paragraph
> >>>>> 3.2.5. Memory References.
> >>>>>
> >>>>> OP-TEE represents this null memory reference as a TMEM parameter with
> >>>>> buf_ptr = 0x0. This is the only case when we should allow TMEM
> >>>>> buffer without the OPTEE_MSG_ATTR_NONCONTIG flag. This also the
> >>>>> special case for a buffer with OPTEE_MSG_ATTR_NONCONTIG flag.
> >>>>>
> >>>>> This could lead to a potential issue, because IPA 0x0 is a valid
> >>>>> address, but OP-TEE will treat it as a special case. So, care should
> >>>>> be taken when construction OP-TEE enabled guest to make sure that such
> >>>>> guest have no memory at IPA 0x0 and none of its memory is mapped at PA
> >>>>> 0x0.
> >>>>>
> >>>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> >>>>> ---
> >>>>>
> >>>>> Changes from v1:
> >>>>>    - Added comment with TODO about possible PA/IPA 0x0 issue
> >>>>>    - The same is described in the commit message
> >>>>>    - Added check in translate_noncontig() for the NULL ptr buffer
> >>>>>
> >>>>> ---
> >>>>>    xen/arch/arm/tee/optee.c | 27 ++++++++++++++++++++++++---
> >>>>>    1 file changed, 24 insertions(+), 3 deletions(-)
> >>>>>
> >>>>> diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
> >>>>> index 6963238056..70bfef7e5f 100644
> >>>>> --- a/xen/arch/arm/tee/optee.c
> >>>>> +++ b/xen/arch/arm/tee/optee.c
> >>>>> @@ -215,6 +215,15 @@ static bool optee_probe(void)
> >>>>>        return true;
> >>>>>    }
> >>>>>    +/*
> >>>>> + * TODO: There is a potential issue with guests that either have RAM
> >>>>> + * at IPA of 0x0 or some of theirs memory is mapped at PA 0x0. This is
> >>>>                                  ^ their
> >>>>
> >>>>> + * because PA of 0x0 is considered as NULL pointer by OP-TEE. It will
> >>>>> + * not be able to map buffer with such pointer to TA address space, or
> >>>>> + * use such buffer for communication with the guest. We either need to
> >>>>> + * check that guest have no such mappings or ensure that OP-TEE
> >>>>> + * enabled guest will not be created with such mappings.
> >>>>> + */
> >>>>>    static int optee_domain_init(struct domain *d)
> >>>>>    {
> >>>>>        struct arm_smccc_res resp;
> >>>>> @@ -725,6 +734,15 @@ static int translate_noncontig(struct optee_domain
> >>>>> *ctx,
> >>>>>            uint64_t next_page_data;
> >>>>>        } *guest_data, *xen_data;
> >>>>>    +    /*
> >>>>> +     * Special case: buffer with buf_ptr == 0x0 is considered as NULL
> >>>>> +     * pointer by OP-TEE. No translation is needed. This can lead to
> >>>>> +     * an issue as IPA 0x0 is a valid address for Xen. See the comment
> >>>>> +     * near optee_domain_init()
> >>>>> +     */
> >>>>> +    if ( !param->u.tmem.buf_ptr )
> >>>>> +        return 0;
> >>>>
> >>>> Given that today it is not possible for this to happen, it could even be
> >>>> an ASSERT. But I think I would just return an error, maybe -EINVAL?
> >>>
> >>> Hmm, looks like my comment is somewhat misleading :(
> >>
> >> How about the following comment:
> >>
> >> We don't want to translate NULL (0) as it can be used by the guest to fetch
> >> the size of the buffer to allocate. This behavior depends on TA, but there is
> >> a guarantee that OP-TEE will not try to map it (see more details on top of
> >> optee_domain_init()).
> >>
> >>>
> >>> What I mean, is that param->u.tmem.buf_ptr == 0 is the normal situation.
> >>> This is the special case, when OP-TEE treats this buffer as a NULL. So
> >>> we are doing nothing there. Thus, "return 0".
> >>>
> >>> But, as Julien pointed out, we can have machine where 0x0 is the valid
> >>> memory address and there is a chance, that some guest will use it as a
> >>> pointer to buffer.
> >>>
> >>>> Aside from this, and the small grammar issue, everything else looks fine
> >>>> to me.
> >>>>
> >>>> Let's wait for Julien's reply, but if this is the only thing I could fix
> >>>> on commit.
> >>
> >> I agree with Volodymyr, this is the normal case here. There are more work to
> >> prevent MFN 0 to be mapped in the guest but this shouldn't be an issue today.
> >
> > Let's put the MFN 0 issue aside for a moment.
> >
> >  From the commit message I thought that if the guest wanted to pass a
> > NULL buffer ("Null memory reference") then it would also *not* set
> > OPTEE_MSG_ATTR_NONCONTIG, which would be handled by the "else" statement
> > also modified by this patch. Thus, I thought that reaching
> > translate_noncontig with buf_ptr == NULL would always be an error.
> >
> > But re-reading the commit message and from both your answers it is not
> > the case: a "Null memory reference" is allowed with
> > OPTEE_MSG_ATTR_NONCONTIG set too.
> >
> > Thus, I have no further comments and the improvements on the in-code
> > comment could be done on commit.
> 
> Good :). IIRC Paul gave a provisional RaB for this series. @Paul, now
> that we are settled, could we get a formal one?

Sure.

Release-acked-by: Paul Durrant <paul@xen.org>

> 
> Cheers,
> 
> --
> Julien Grall


