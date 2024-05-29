Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 008F58D2EEE
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 09:50:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731566.1137130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCE4l-000662-73; Wed, 29 May 2024 07:50:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731566.1137130; Wed, 29 May 2024 07:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCE4l-00063z-3m; Wed, 29 May 2024 07:50:23 +0000
Received: by outflank-mailman (input) for mailman id 731566;
 Wed, 29 May 2024 07:50:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DI5e=NA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sCE4i-00063t-Vn
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 07:50:20 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18350c66-1d90-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 09:50:19 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52ab11ecdbaso603300e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 00:50:19 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-529a50b1d85sm979602e87.113.2024.05.29.00.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 00:50:18 -0700 (PDT)
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
X-Inumbo-ID: 18350c66-1d90-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716969018; x=1717573818; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o9wnVc5y1gCAGWJdhNxeWyVR0sVx4jE96Kr/TvXDqTI=;
        b=feWdlt7V8905xYwDwRuxWXWW7vzCV5xG68rLwbHfvAZTsChNFoIL3VgNNh/+Fp1s5s
         2rxORrnBARk3cGGFk2ANb6DasgSQZwcw5aB4fAmLgBshgVEQyiBHTp8dL81Dus/bd6oH
         pD6ojL3o9jRhOxhXOXfChnaKW5s5OLEQn39M2/BA/g/FRfKygTsjq/r0paTLouHR7n6k
         Gokq9/TsAJoTXzoUFkk+6qgwSpakK0pLy6eIDT6LaHhoBb61cUIHzlLXLcBA0Q/CaBDU
         S9q0PprZFZd82vIVmBi17s+3k8tYSDdD0o8D32lERo+fqvQoFF8JN2bpb2xdggojj6yT
         yG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716969018; x=1717573818;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o9wnVc5y1gCAGWJdhNxeWyVR0sVx4jE96Kr/TvXDqTI=;
        b=A5eM3V+Qsg+noi81ytLMnwUklZzIPODUBysDUPPCxop8VeQHMC8CisoqdLZyvSMXMQ
         HPSa0yUCygy8uxNgHrQAjtVeEH8q6O7FDTZtPpv61XZVg4+pKBHdeF85ediId+luI/EY
         wh9pg3gwHWi+3kbx4V6gWYcT7sqlBjZ2XGIg6FHMG8bmvQSWBAj0rfDeBpKXaYttZfT/
         qVRIKJZY+Z6m5M7Z33QVWaLDKkTryXdJeQ6GjI25/4wyTywlrXlSc6PHFGBEt8hc/1T9
         22UBAJ8XhsYgfHoduPxLkypwVXreASwZp/FgCdVu5af01rjIGgnIO0Zso4RF/fd/ebt5
         Ec8A==
X-Forwarded-Encrypted: i=1; AJvYcCXmJf1ouu9HpYFx6hyhLHTcGlPDWJRNJEQw+nDrlADYjOIsSSj6LQ8Qvy6AF9wYzL8ittCOw7ZTTE8CoAQGCkV17e2QXnNvqUC2LdefI+w=
X-Gm-Message-State: AOJu0Yw6KKtMFdoFKwr3uEwqmVY5977SmlRL6gesmYjI5MdtSv0AiAXb
	PSJpPS95TJ9YpSrwo7bNb0G/4AJbq0hM9BT8sIz538QXmqwY5AHB
X-Google-Smtp-Source: AGHT+IHOcN9akvGQv2+Y8rbx+k4RAethkWJMRPxEfXmd3H7IhSf1VzlA0o+lbcA+p+VX1mJFpoNDHQ==
X-Received: by 2002:ac2:4db6:0:b0:529:ac38:a160 with SMTP id 2adb3069b0e04-529ac38a434mr5405257e87.34.1716969018501;
        Wed, 29 May 2024 00:50:18 -0700 (PDT)
Message-ID: <56b97916d1c36040a0be547759d5d10d311c9ed3.camel@gmail.com>
Subject: Re: [PATCH v11 2/9] xen: introduce generic non-atomic test_*bit()
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,  Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Date: Wed, 29 May 2024 09:50:17 +0200
In-Reply-To: <a39c3c03-ef54-4329-833d-03b60f162234@xen.org>
References: <cover.1716547693.git.oleksii.kurochko@gmail.com>
	 <79c3c31f0032a79c25d0a458b6091904457c8939.1716547693.git.oleksii.kurochko@gmail.com>
	 <ab275ed4-29c3-4473-b1ee-2a9cda63eeaf@suse.com>
	 <d8fd70469a1ac8d8cc291dddd0496f6bfabf6720.camel@gmail.com>
	 <a39c3c03-ef54-4329-833d-03b60f162234@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Tue, 2024-05-28 at 09:53 +0100, Julien Grall wrote:
> > > > +/**
> > > > + * generic_test_bit - Determine whether a bit is set
> > > > + * @nr: bit number to test
> > > > + * @addr: Address to start counting from
> > > > + *
> > > > + * This operation is non-atomic and can be reordered.
> > > > + * If two examples of this operation race, one can appear to
> > > > succeed
> > > > + * but actually fail.=C2=A0 You must protect multiple accesses wit=
h
> > > > a
> > > > lock.
> > > > + */
> > >=20
> > > You got carried away updating comments - there's no raciness for
> > > simple test_bit(). As is also expressed by its name not having
> > > those
> > > double underscores that the others have.
> > Then it is true for every function in this header. Based on the
> > naming
> > the conclusion can be done if it is atomic/npn-atomic and can/can't
> > be
> > reordered.=20
>=20
> So let me start with that my only request is to keep the existing=20
> comments as you move it. It looks like there were none of test_bit()
> before.
Just to clarify that I understand correctly.

Do we need any comment above functions generic_*()? Based on that they
are implemented in generic way they will be always "non-atomic and can
be reordered.".

Do you find the following comment useful?

" * If two examples of this operation race, one can appear to succeed
 * but actually fail.  You must protect multiple accesses with a lock."

It seems to me that it can dropped as basically "non-atomic and can be
reordered." means that.

~ Oleksii

