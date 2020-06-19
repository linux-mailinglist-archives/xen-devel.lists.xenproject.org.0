Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2BD20044B
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 10:47:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmCgE-0007FB-7E; Fri, 19 Jun 2020 08:47:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jg7u=AA=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jmCgC-0007F5-FI
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 08:47:20 +0000
X-Inumbo-ID: 7c0aea6e-b209-11ea-bca7-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c0aea6e-b209-11ea-bca7-bc764e2007e4;
 Fri, 19 Jun 2020 08:47:19 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x6so8831592wrm.13
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2020 01:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=mqf7gmAtr3fRGXGHHE1sI/oDfkiaWa710N1nUTNPgNk=;
 b=IXP7Sxq3fT94UeMEreu5WbChuX/mLYcWr/ZOgkGYYm2ydo7fXm8OWNqeojzQb1dzJn
 7GxDpM17yfo1cX2RFuWxhUNSabFq4OJVTtUVYxyLqcFpD0gShl8/2BfNCC24gK958Fjy
 WOM4a6vXmnhE6gFUKto57eOnmVsq0uVW7Dsgxv54THUoCNsIWAurXlxLuAyXqXcK0dcs
 Qim+qnft9d0qbPuY8HjKxu1m6eJx/858ilQnNXc4qNyIRKSzeebwHrrB6L6xg+vGiwZo
 t27fU+Eo/qE+ZdnwPyh2xXsTGkIt4bZNzXnqSrZgY8yCfptswHDU2xtZJUEVgxVdkrxJ
 9m2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=mqf7gmAtr3fRGXGHHE1sI/oDfkiaWa710N1nUTNPgNk=;
 b=RyY0fu4jsV+m5yk7GdcUWRoQpD0o7WovevYuO/xsmfwVr6RDAAkvrSCHcrxM+a9VVw
 YKzitN81BFjAAZn3wi6rgO7E1H/yCPWwzmjFHvb9EGJlrhLX/yk2LSye6p0pZ0H85awX
 7LVRWbnkdUwwTziVYqgEzKQInEqFjVDOZJWNq2iokYP9Qqp9hxWXxkchkR0PRTT2DSr+
 9dbRIFaVP4kFLefKlZGrsZhRgeX6xhLFvvGQVW4UAQanstbdyP7TsQm0eqT3Ss0Qfn6Q
 xDk0sOjOSRsmsOeNE+K+nqBuFxV+JQvcc4tIJYViIy5iwMqHrzJzpFu3ZMrPfy2fJLW8
 SaAA==
X-Gm-Message-State: AOAM533o0W09AonYeLCZcvnhBumRspFyHnVhFjy+2SxOureTusD57B3u
 Mnbmb/U9Uqs4SGLmvJsy6kE=
X-Google-Smtp-Source: ABdhPJy727/YYKrwWonqAcULw+EW9Bp15F0Kn1PDBg6smd5IBcWTslDnrYv20Lynn15VN7a1HJ/D8w==
X-Received: by 2002:adf:a34d:: with SMTP id d13mr2793600wrb.270.1592556439010; 
 Fri, 19 Jun 2020 01:47:19 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id b204sm5406114wmb.12.2020.06.19.01.47.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jun 2020 01:47:18 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Stefano Stabellini'" <sstabellini@kernel.org>, <xadimgnik@gmail.com>,
 <pdurrant@amazon.com>
References: <2a32c7c2048333169c9378194d6a435e2e7ed2d7.camel@epam.com>
 <1b596a11-95b5-3e87-bbf5-c0c4dceb6489@xen.org>
 <alpine.DEB.2.21.2006181523070.14005@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2006181523070.14005@sstabellini-ThinkPad-T480s>
Subject: RE: [PATCH] xen/arm: optee: allow plain TMEM buffers with NULL address
Date: Fri, 19 Jun 2020 09:47:16 +0100
Message-ID: <00a801d64616$3d3a15d0$b7ae4170$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFpSyMwNg/TcnqdYmslaqhk/GonbAGu4tJYAXmKTO2poFINUA==
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
Cc: julien@xen.org, xen-devel@lists.xenproject.org,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Sent: 18 June 2020 23:27
> To: xadimgnik@gmail.com; paul@xen.org; pdurrant@amazon.com
> Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; sstabellini@kernel.org; xen-
> devel@lists.xenproject.org; paul@xen.org; julien@xen.org
> Subject: Re: [PATCH] xen/arm: optee: allow plain TMEM buffers with NULL address
> 
> Hi Paul, Julien, Volodymyr,
> 
> This is another bug fix that I would like to get in 4.14. It doesn't
> look like we need any changes to this patch, assuming that it is
> accurate to the spec.
> 
> It would be nice if Volodymyr could provide more info on the spec side,
> but honestly I trust his experience on this.
> 
> Paul, are you OK with this going into 4.14?
> 

In principle, yes. It appears, from Julien's comments though, that the commit message may need a little expansion (for the benefit
of those mining this code in future).

  Paul

> 
> 
> On Sat, 6 Jun 2020, Julien Grall wrote:
> > (+Paul)
> >
> > Hi,
> >
> > On 18/05/2020 02:53, Volodymyr Babchuk wrote:
> > > Trusted Applications use popular approach to determine required size
> > > of buffer: client provides a memory reference with the NULL pointer to
> > > a buffer. This is so called "Null memory reference".  TA updates the
> >
> > NIT: You use double space after '.' here but all the others use a single
> > space.
> >
> > > reference with the required size and returns it back to client. Then
> > > client allocates buffer of needed size and repeats the operation.
> > >
> > > This behavior is described in TEE Client API Specification, paragraph
> > > 3.2.5. Memory References.
> >
> > From the spec, it is not a clear cut that NULL will always used as fetching
> > the required size of an output buffer. In particular, they suggest to refer to
> > the protocol.
> >
> > In your commit message you indirectly point to an example where 0/NULL would
> > have a different meaning depending on the flags. This is not explained in the
> > TEE Client API Specification. Do you have some pointer I could use to check
> > the behavior?
> >
> > >
> > > OP-TEE represents this null memory reference as a TMEM parameter with
> > > buf_ptr == NULL. This is the only case when we should allow TMEM
> > > buffer without the OPTEE_MSG_ATTR_NONCONTIG flag.
> >
> > IIUC, 0 with OPTEE_MSG_ATTR_NONCONTIG set would mean "use the buffer at
> > address 0" but with the flag cleared, it would mean "return the size". Am I
> > correct?
> >
> > >
> > > Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> > The code looks to match your commit message, but I wasn't able to match it
> > with the spec. Do you have other pointer I could use to check the behavior?
> >
> > I assume this wants to be part of Xen 4.14. The change is only for OP-TEE
> > which is a tech preview feature. So the risk is very limited.


