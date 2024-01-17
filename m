Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3843830639
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 13:55:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668451.1040673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ5RT-0002uT-RA; Wed, 17 Jan 2024 12:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668451.1040673; Wed, 17 Jan 2024 12:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ5RT-0002sK-OZ; Wed, 17 Jan 2024 12:54:51 +0000
Received: by outflank-mailman (input) for mailman id 668451;
 Wed, 17 Jan 2024 12:54:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nKNn=I3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rQ5RS-0002sE-WA
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 12:54:51 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9943bc3e-b537-11ee-98f2-6d05b1d4d9a1;
 Wed, 17 Jan 2024 13:54:49 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40e60e137aaso60826255e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 04:54:49 -0800 (PST)
Received: from localhost ([213.195.127.68]) by smtp.gmail.com with ESMTPSA id
 jb13-20020a05600c54ed00b0040e418494absm21929628wmb.46.2024.01.17.04.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 04:54:48 -0800 (PST)
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
X-Inumbo-ID: 9943bc3e-b537-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705496089; x=1706100889; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dXCFiU0YaL1AnK8tUu+koqeYBAV6Ng2H3kVkXKaw4+U=;
        b=lohJHMZkA/0exCnBbhTDmRZI9tsXzmjm4Gr2XSMBeoMmXLyuD/6/TPamxJL288xvsE
         Qg1rn6LhrUxo8ZZitS6rDmu7Wy0tbizOiTgJaqEy21rCtJ6qBLlv050E9HibrghQP2kB
         CJ1JbJYa7UgZbseIX7bBnahfwRftlKt67TTZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705496089; x=1706100889;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dXCFiU0YaL1AnK8tUu+koqeYBAV6Ng2H3kVkXKaw4+U=;
        b=uCsoKEqK8AlfZa+oUkmEAnLv64nwmh/PEh3E0LKRpmn9LBqOu+T/LVcaokHq5zG5Yh
         oqzOMMgPGJ39XtC8eKFglh/czvC1ygXCX1NlhBmt8Ib/HbgWjOAH/ZPPSakT/U3wAIAq
         VOuQXz9vzaARmDO3JL9o8UpY40ZC5rVbXcTF+roHLMUPRWO6ORFt7J69+fT+rMLERDGU
         ZHZGZQ+izi6heqVVSDGe4Gvl9FWE964iNCNqDZ2Tj4o06q3vNDw9IS6TwUHYVH7aAjg2
         GChrFBS5ewwv2uJCnYkeWfL86Wlr8WMOvvjVEX1lho1BRyqscWkOgTOT1HgWxFcypD8Y
         c5MA==
X-Gm-Message-State: AOJu0YymhGwBOpf6iksOwtraxKqSFhYK/TGQbHaPoJdm72B66jhq84Zk
	VFTDoD+1FXC+Y9CZjShAfhqtvXSX4gldAg==
X-Google-Smtp-Source: AGHT+IHEUeT5dJOasaA7AvqgXg4MUZWWMdY8nnH7Sm/9aPRAYLA/igWvkyOJcaMnmMPKTXxklf4DTg==
X-Received: by 2002:a05:600c:a08:b0:40e:5303:6d22 with SMTP id z8-20020a05600c0a0800b0040e53036d22mr4708916wmp.96.1705496089061;
        Wed, 17 Jan 2024 04:54:49 -0800 (PST)
Date: Wed, 17 Jan 2024 13:54:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Patrick Plenefisch <simonpatp@gmail.com>,
	xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Subject: Re: E820 memory allocation issue on Threadripper platforms
Message-ID: <ZafOGEwms01OFaVJ@macbook>
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
 <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
 <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
 <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>
 <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
 <fa23a590-5869-4e11-8998-1d03742c5919@suse.com>
 <ZaeoWBV8IEZap2mr@macbook>
 <15dcef46-aaa8-4f71-bd5c-355001dd9188@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15dcef46-aaa8-4f71-bd5c-355001dd9188@suse.com>

On Wed, Jan 17, 2024 at 11:40:20AM +0100, Jan Beulich wrote:
> On 17.01.2024 11:13, Roger Pau Monné wrote:
> > On Wed, Jan 17, 2024 at 09:46:27AM +0100, Jan Beulich wrote:
> >> Whereas I assume the native kernel can deal with that as long as
> >> it's built with CONFIG_RELOCATABLE=y. I don't think we want to
> >> get into the business of interpreting the kernel's internal
> >> representation of the relocations needed, so it's not really
> >> clear to me what we might do in such a case. Perhaps the only way
> >> is to signal to the kernel that it needs to apply relocations
> >> itself (which in turn would require the kernel to signal to us
> >> that it's capable of doing so). Cc-ing Roger in case he has any
> >> neat idea.
> > 
> > Hm, no, not really.
> > 
> > We could do like multiboot2: the kernel provides us with some
> > placement data (min/max addresses, alignment), and Xen let's the
> > kernel deal with relocations itself.
> 
> Requiring the kernel's entry point to take a sufficiently different
> flow then compared to how it's today, I expect.

Indeed, I would expect that.

> > Additionally we could support the kernel providing a section with the
> > relocations and apply them from Xen, but that's likely hm, complicated
> > at best, as I don't even know which kinds of relocations we would have
> > to support.
> 
> If the kernel was properly linked to a PIE, there'd generally be only
> one kind of relocation (per arch) that ought to need dealing with -
> for x86-64 that's R_X86_64_RELATIVE iirc. Hence why (I suppose) they
> don't use ELF relocation structures (for being wastefully large), but
> rather a more compact custom representation. Even without building PIE
> (presumably in part not possible because of how per-CPU data needs
> dealing with), they get away with handling just very few relocs (and
> from looking at the reloc processing code I'm getting the impression
> they mistreat R_X86_64_32 as being the same as R_X86_64_32S, when it
> isn't; needing to get such quirks right is one more aspect of why I
> think we should leave relocation handling to the kernel).

Would have to look into more detail, but I think leaving any relocs
for the OS to perform would be my initial approach.

> > I'm not sure how Linux deals with this in the bare metal case, are
> > relocations done after decompressing and before jumping into the entry
> > point?
> 
> That's how it was last time I looked, yes.

I've created a gitlab ticket for it:

https://gitlab.com/xen-project/xen/-/issues/180

So that we don't forget, as I don't have time to work into this right
now, but I think it's important enough that we don't forget.

For PV it's a bit more unclear how we want to deal with it, as it's
IMO a specific Linux behavior that makes it fail to boot.

Roger.

