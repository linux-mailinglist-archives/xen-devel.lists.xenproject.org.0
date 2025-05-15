Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC69AB83AC
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 12:20:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985168.1371108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFVgW-0001b0-E7; Thu, 15 May 2025 10:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985168.1371108; Thu, 15 May 2025 10:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFVgW-0001ZS-BG; Thu, 15 May 2025 10:19:28 +0000
Received: by outflank-mailman (input) for mailman id 985168;
 Thu, 15 May 2025 10:19:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CT6j=X7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFVgU-0001ZM-N5
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 10:19:26 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 113e1e26-3176-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 12:19:21 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ad4d03700e6so119924266b.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 03:19:21 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ad521ab59d2sm31639166b.67.2025.05.15.03.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 03:19:20 -0700 (PDT)
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
X-Inumbo-ID: 113e1e26-3176-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747304361; x=1747909161; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0G2qg8u54S5JI1oEeq9DQJ3lFKLCjHo68wGdPMvKetk=;
        b=rcnWj1k+avKakFY347c6UU/MApr1yK2kxHyOfaALRUENQSL8nSs9kHYamfdUae2nwb
         85VO2mMdZ2PgGOyBGaZ5KmxbdIufB4jE6tFJOmh725mB0YWSmYaTEb0nloESzj7FUwYL
         vCOm8PZPO0WCygEpqbgCOSB067uLV4OcL8owY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747304361; x=1747909161;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0G2qg8u54S5JI1oEeq9DQJ3lFKLCjHo68wGdPMvKetk=;
        b=UDGEH9KpjTAexkR17BIC87eHztYUUkLMdRkrlgn8txEXuFibNLJgP544nRD9XieKOz
         gMRrT5cXyqh2YtMEwxOfA9bafjcn7WYsyaD3IJkjF/QJRkWXByLBpGJY8dubTaTns6Kk
         uyuWsQE3ZszTf5uGk4mX0oySDmwUEShSfxk8g68njnKCuSaHvfqncQntxeCiZKFBj5ma
         7bx75IKio3dBAQmjZSiZJzKolSL5vqG4p+bvTnc//W4y/wL5iqit3zeFMaoboI9vsHZA
         cEnwBwjVqWAJmaETVFwi+ehKED/n4uUriUE2+fjq8sspmmFrWluCmWS+AMJ9K5uHD0Bp
         w02w==
X-Forwarded-Encrypted: i=1; AJvYcCWBnXtpqmPB5HJnwOd8E+CODGFZNTGZ3suAed6rMhYVTcrFzD5vQZDQcjCnNvu49VF8h+JH/173vYE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4vkRser2SbCIEiGPHGi3+A6W64xk1zB3SX2ZOJUdrKh2yXXZ9
	XKNPp3ZZU4p6NFwShoiMkrbZv++sPxLRTlL57i6qusu4HWEobVNzTmrhOmnbBnA=
X-Gm-Gg: ASbGncsW8zEGrrcvSEARo/1gnG3RAy4b3wOK0I/D4+d9cFpDwSUi4DoS4rW178No7Ln
	Ai2juFKVk6U6m3/3faBxWuGNcY6fSFLRBj5rbTFR4Fa6TclO9OIAHZfZpUgMOv6edrC3jtdKoP5
	6uvG5Xq868/tMWFAF26CrlHDVNdUZQtLZVwSYwg7I2LEYhBsHX/ern2cGS+IcGbc9xWqx/N+0Yi
	y31+gg+hgtoltEmQLNmE+q9Nn5mDXpZT1C21eFOeHwLKDsCDkhX6PyHAyHwd6fLf1dfGiEiQaf6
	rx2Heza2mJEmjrcLXMOLJ6bbQTJhawelrJi7dT1bb3Czg70DKXeAl+1m
X-Google-Smtp-Source: AGHT+IHvevzTlzQgsde2WTdQAYRroAXo5QhdwEokbHLbtisW1qP8keKH0i6KQNZdkcuDeaBzuTrAAg==
X-Received: by 2002:a17:907:9625:b0:ad2:4785:c4ac with SMTP id a640c23a62f3a-ad4f751b693mr720205266b.40.1747304360799;
        Thu, 15 May 2025 03:19:20 -0700 (PDT)
Date: Thu, 15 May 2025 12:19:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Lira, Victor M" <victorm.lira@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>, Xenia.Ragiadakou@amd.com,
	Alejandro.GarciaVallejo@amd.com
Subject: Re: [RFC] xen/x86: allow overlaps with non-RAM regions
Message-ID: <aCW_p_ucNFaFFLeo@macbook.lan>
References: <aAoPNTsLjMMfsHvJ@mail-itl>
 <aAoW-kvpsWuPJwrC@macbook.lan>
 <775d3ac0-8f43-415a-a32d-14377092b96b@amd.com>
 <554026de-bbb4-488f-95c4-8e2f034d6d0e@amd.com>
 <aAtPpOq2Kc_N6hBy@macbook.lan>
 <2acad9ba-564a-4d18-9b09-dcabe8f7b025@suse.com>
 <aAttUBx57tds8WJJ@macbook.lan>
 <e5d464f3-6675-4fd6-a834-7f743fee668a@amd.com>
 <aCIe60al7G7pfeUJ@macbook.lan>
 <02b6f10a-119e-499c-a51f-8deac6fa6a93@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02b6f10a-119e-499c-a51f-8deac6fa6a93@amd.com>

On Mon, May 12, 2025 at 10:55:18AM -0700, Lira, Victor M wrote:
> On 5/12/2025 9:16 AM, Roger Pau Monné wrote:
> > Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> > 
> > 
> > On Fri, Apr 25, 2025 at 09:47:57AM -0700, Lira, Victor M wrote:
> > > I can confirm with the patch the NVME drive can be accessed despite the "not
> > > mapping BAR" warning from Xen.
> > > Output log attached.
> > Thanks a lot for the test, and sorry for the delay in getting back.  I
> > was busy with other stuff and needed some time to figure out the best
> > way to deal with this.  Can you give a try to the patch below?  I hope
> > it will still fix the issue.
> No worries,  I applied this patch to the latest staging c45e57f59d69, and
> the result is also successful NVME drive access.
> Output log attached and I see no "failed to sanitize" warnings.

Thanks for the testing.

I've formally submitted this as:

https://lore.kernel.org/xen-devel/20250515084123.43289-1-roger.pau@citrix.com/

Functionality wise I think it should be the same as the last patch you
tried.  Could you give it a spin and maybe provide a Tested-by if
suitable?

Thanks, Roger.

