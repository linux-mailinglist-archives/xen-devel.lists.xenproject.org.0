Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FD2953852
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 18:35:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778201.1188238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sedQs-0007Qe-7Y; Thu, 15 Aug 2024 16:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778201.1188238; Thu, 15 Aug 2024 16:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sedQs-0007PC-4w; Thu, 15 Aug 2024 16:34:38 +0000
Received: by outflank-mailman (input) for mailman id 778201;
 Thu, 15 Aug 2024 16:34:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZnf=PO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sedQr-0007P6-9J
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 16:34:37 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41a216c4-5b24-11ef-a505-bb4a2ccca743;
 Thu, 15 Aug 2024 18:34:35 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52efd855adbso1414578e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2024 09:34:35 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5330d41ebcfsm249614e87.210.2024.08.15.09.34.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2024 09:34:33 -0700 (PDT)
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
X-Inumbo-ID: 41a216c4-5b24-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1723739674; x=1724344474; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+iEOz9MicmZ03FK4UPErL66CN7WBu644q2pc4XhEk+A=;
        b=TOOrzV76B+hKG+vASymg7dzhELhjaQbhDdUBhb0nR+7cwkVD5apoHimkNlKHujVamY
         SLj2/Fr4T82oNbXphCXXnAmhZfHBkneANm0ZEAsqMa0X7PzHfmDHKb5f7jAzUwJ1Kn3s
         URGzcY2Jnp7d7vOnXePuVSqUuuG0CZcovy0D0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723739674; x=1724344474;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+iEOz9MicmZ03FK4UPErL66CN7WBu644q2pc4XhEk+A=;
        b=jS5uGKLdJ92WM9idpTsenrqtCf5gfv+A9nk32w218BU7TE3vk98qHbIUZiqpEIEa9H
         rAqdQj5Skaj8//eV1D8hyZpFCTuhbiOAGCcCG98sAGNuQCk1F+nua1iJF8XObuKoU+2D
         sLH8jAMIsGyvvcEbzWpB2VrLwhPgaAJnf21ONyvKlcdH+2el5ZjCBtWLk5lmP8sUtraf
         tJVHRY9VCq6NXzyiSqYvanhM3oSqHcI9vAFbtF12zeUnq8/lCtbd2LQcUX5vnptnmT+7
         00HFK6Fde0gouZmn3wlfy9RbSqd1lI1LtMOzfluwVy3y89jztwVjNs7+15rcvAAX3QaS
         QrPg==
X-Forwarded-Encrypted: i=1; AJvYcCU4QSnZDIW3eB25OTfeEo5T6DPIjwCzW5nqDmlkbRScGKaGFL/4YMvdsaiPW3euGlcSh7p+9qz+krfhC8WATplKCaQx0ezq8UgLX/jlmAo=
X-Gm-Message-State: AOJu0YznDl+MV3H4yA65pMg6TRXUul3giQbVvId+EZ/vbtVkS1PTy7O1
	R5rtJNcqZ4upR0fFhtXjughntFUtxXGvd6JzUtkzzppOorq1mp6F/z87VKRoyBY=
X-Google-Smtp-Source: AGHT+IHJ3/3nukS+NoXJmG54wXF5NODRBmR84fNJJ450h1zGbdraLNaWqkGqJllUBQwXneYmDhzhqA==
X-Received: by 2002:a05:6512:224e:b0:533:c9d:a01b with SMTP id 2adb3069b0e04-5331c6b0b39mr8984e87.29.1723739674339;
        Thu, 15 Aug 2024 09:34:34 -0700 (PDT)
Message-ID: <c02c15d6-9f59-41ff-aaf5-499bfffe4b8e@citrix.com>
Date: Thu, 15 Aug 2024 17:34:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86/pv: Introduce x86_merge_dr6() and fix
 do_debug()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240815131600.4037415-1-andrew.cooper3@citrix.com>
 <20240815131600.4037415-2-andrew.cooper3@citrix.com>
 <82f78de2-3d93-4e51-a845-5bb96559a4cf@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <82f78de2-3d93-4e51-a845-5bb96559a4cf@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/08/2024 4:41 pm, Jan Beulich wrote:
> On 15.08.2024 15:15, Andrew Cooper wrote:
>> Pretty much everywhere in Xen the logic to update %dr6 when injecting #DB is
>> buggy.  The architectural behaviour is to overwrite B{0..3} (rather than
>> accumulate) and accumulate all other bits.
> Just to double check (after 6 years I clearly don't recall anything that isn't
> written down in the description): The SDM pretty vaguely says "Certain debug
> exceptions may clear bits 0-3." What other information sources are there to
> make this less uncertain? (Picking an old hardcopy from the shelf, that
> confirms that long ago DR6 was indeed documented as all sticky.)

Well, "talking with the architects", but as always "it's complicated".

The debug infrastructure has had several breaking changes in it over the
years (e.g. the reserved bits didn't use to be f's), and this one
probably changed with the introduction of superscalar pipelines.  That
said, I don't think I've ever found a Spec Update / Revision Guide that
doesn't have one "oops we don't do breakpoints properly in this case"
erratum listed.

I'm informed it's "most going on all exceptions" these days, and the
behaviour here did come mostly from my discussions about XSA-308 (or
rather, the pre-security angle where it was just a bugfix) with Intel.

A guest that does clear the status bits every #DB won't notice, and one
that doesn't will have problems on real hardware.

But I can reword if if you'd prefer?

~Andrew

