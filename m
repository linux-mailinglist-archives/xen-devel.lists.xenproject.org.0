Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BEC9100E1
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 11:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744364.1151392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKEW6-000454-8C; Thu, 20 Jun 2024 09:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744364.1151392; Thu, 20 Jun 2024 09:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKEW6-00042J-5V; Thu, 20 Jun 2024 09:55:42 +0000
Received: by outflank-mailman (input) for mailman id 744364;
 Thu, 20 Jun 2024 09:55:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TjK6=NW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sKEW4-00042D-LV
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 09:55:40 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fec0094-2eeb-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 11:55:39 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a6f09b457fdso68171566b.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 02:55:39 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56db5c3dsm751289866b.55.2024.06.20.02.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 02:55:38 -0700 (PDT)
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
X-Inumbo-ID: 3fec0094-2eeb-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718877339; x=1719482139; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/Wp4kjnDRYcqsWBVpwT0Uxh7oOecFrkJm7uLP4XBRmk=;
        b=YoAxv1yGuFk7THVL5gljNIj70dQWJNSN2L4orbmPQvgqrJN8N0t12ZzdhVUPx6R8Ep
         52x4h8rioNc2XyHwEYMTTTmZLV75MAcm+me0xy/5R8+U3BPw4YPG2HngCmUHLJBQPcm9
         ay9rJonbzKGqWVY4siVU8pvtu66tIT34nCP1YiC5kEK94lDisOwNcBmFTnRsq4fxCo+E
         s2C4hW/0wHgtobvqJ1YpM5kTjeqr5Eb2GqdHeqjZmMwUZ/fFP1EJJSR+uZCwDIC82Kgx
         348S52NAjBJo4fmcFerkHwZsl0enbYZhnizPO+2J8nkJg01FDLnttYdavl2jW9gJ47cL
         dPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718877339; x=1719482139;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Wp4kjnDRYcqsWBVpwT0Uxh7oOecFrkJm7uLP4XBRmk=;
        b=U/DDf5+TVIvCG3TgarObOEBDvUz7k+sVy433GDCZ7tt2mGmV+Ab4RP6sQfItoNU+0W
         7ZimScUl1zGhv+zwTdX9CXIl3hxV9OYV4p0V1X5BghtbO5Ve+vTeebaSi4XDcQimM0/u
         FK/ZoG4r0PfdeUg7+nNtnwINvT97hEE32QYd+L8khRubIihtT0IZIRVaLYQL2yp4Wu+R
         DZSa3ziztqP8t3sWiBAQi1RdfI5nh3SBZ5y188QZVpIdylxS6Xbe4QWNCiG38cf0xgNS
         9VD8+GK7+m5D4TbeF0/ckQ4SK2+61Mc5doCW9YD79i1/IJjKnIodd+YPmm3sJLlafLdm
         wuQg==
X-Forwarded-Encrypted: i=1; AJvYcCVPXXSmSJlsE89pOS6KGvCxL8o7A23bkTdPt7u4st9l6RYzCywZTkXFTIFQATi7WYZPYFs9XJgrHVR/+pZt0o4GkAxw8cC+EVi0aFTy928=
X-Gm-Message-State: AOJu0YzTwoX67l5KssHmUHA3K2WbDYk5DyH34HLk6KykfQEdygLCKl8F
	xUq2NokLZ+PCQ2h0+vD9UJrZ7lzyS+R0QDoipKBde6jU3l0fdK/A4YHMAQ==
X-Google-Smtp-Source: AGHT+IFBjOvRXMiCaHQhHN5fYmlm9v1h2WC/eUP/667F2pi5Q9ihWG0QiLsPc3YfvnB8NFIXJofr1g==
X-Received: by 2002:a17:906:2a18:b0:a6f:4de8:f490 with SMTP id a640c23a62f3a-a6fab6184d9mr305731066b.24.1718877339021;
        Thu, 20 Jun 2024 02:55:39 -0700 (PDT)
Message-ID: <9bd68869a560cd405cbcce481b5721637671a996.camel@gmail.com>
Subject: Re: [PATCH for-4.19?] tools/libs/light: Fix nic->vlan memory
 allocation
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Leigh Brown <leigh@solinno.co.uk>, 
 Anthony Perard <anthony@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk
	 <jandryuk@gmail.com>, Jason Andryuk <jason.andryuk@amd.com>, Xen Devel
	 <xen-devel@lists.xenproject.org>
Date: Thu, 20 Jun 2024 11:55:37 +0200
In-Reply-To: <a8fd0504-23b7-473a-9056-6b51c20e6468@suse.com>
References: <20240520164400.15740-1-leigh@solinno.co.uk>
	 <c600e5e8-d169-417c-bc02-d33e84dca0fb@amd.com>
	 <a8fd0504-23b7-473a-9056-6b51c20e6468@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Wed, 2024-06-19 at 13:57 +0200, Jan Beulich wrote:
> On 20.05.2024 19:08, Jason Andryuk wrote:
> > On 2024-05-20 12:44, Leigh Brown wrote:
> > > After the following commit:
> > > 3bc14e4fa4b9 ("tools/libs/light: Add vlan field to
> > > libxl_device_nic")
> > > xl list -l aborts with a double free error if a domain has at
> > > least
> > > one vif defined:
> > >=20
> > > =C2=A0=C2=A0 $ sudo xl list -l
> > > =C2=A0=C2=A0 free(): double free detected in tcache 2
> > > =C2=A0=C2=A0 Aborted
> > >=20
> > > Orginally, the vlan field was called vid and was defined as an
> > > integer.
> > > It was appropriate to call libxl__xs_read_checked() with gc
> > > passed as
> > > the string data was copied to a different variable.=C2=A0 However, th=
e
> > > final
> > > version uses a string data type and the call should have been
> > > changed
> > > to use NOGC instead of gc to allow that data to live past the gc
> > > controlled lifetime, in line with the other string fields.
> > >=20
> > > This patch makes the change to pass NOGC instead of gc and moves
> > > the
> > > new code to be next to the other string fields (fixing a couple
> > > of
> > > errant tabs along the way), as recommended by Jason.
> > >=20
> > > Fixes: 3bc14e4fa4b9 ("tools/libs/light: Add vlan field to
> > > libxl_device_nic")
> > > Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
> >=20
> > Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
>=20
> I notice this wasn't Cc-ed to the maintainer, which likely is the
> reason
> for there not having been an ack yet. Anthony, any thoughts?
>=20
> Further at this point, bug fix or not, it would likely also need a
> release
> ack. Oleksii, thoughts?
It seems to me it is bug fix, so it should be in release:
Release-acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

