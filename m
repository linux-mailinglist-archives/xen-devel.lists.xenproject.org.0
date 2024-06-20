Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AB59100CA
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 11:50:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744356.1151383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKEQL-0002bW-Lp; Thu, 20 Jun 2024 09:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744356.1151383; Thu, 20 Jun 2024 09:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKEQL-0002Zh-Ht; Thu, 20 Jun 2024 09:49:45 +0000
Received: by outflank-mailman (input) for mailman id 744356;
 Thu, 20 Jun 2024 09:49:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TjK6=NW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sKEQJ-0002ZZ-II
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 09:49:43 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b0c861b-2eea-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 11:49:42 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52c84a21b8cso622591e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 02:49:42 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2872305sm1993975e87.168.2024.06.20.02.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 02:49:41 -0700 (PDT)
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
X-Inumbo-ID: 6b0c861b-2eea-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718876982; x=1719481782; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jpwNq3EKrDRG+VWcZwBrJhjWEVq3entQLxkRUn3IUj8=;
        b=B6OOttWEt9Z6tnvhVHE3gM8+6zKMrYxjZJPwT6Aip2PTpm/rYu4zG902yk7xvZ88qy
         YkG8WqSpGIN+ytj/rIbWtWDaAgQDaMwyBQhunaqtXk0HexWnfE5x8eWbYlA6Mh0aX18b
         xgQBJbFeLgobwIfO2G5in/seX0sw0tHuEIOXN6sGZXRiEwpKQ7bN+C8Wd291rBFi4lJp
         dnL977+tua2Z/tVzD0Q6wvbfnT/EWuVG3TTMNGx2wHrqqv9tqmidjyHNMswdcNCAPZIz
         XF51wyhBrbw2uf4G/Fsd9e2RRYwxjgDqgRwEFz3DCUcRuTUWlPWv5H9vSQA8wJpjPbuU
         stVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718876982; x=1719481782;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jpwNq3EKrDRG+VWcZwBrJhjWEVq3entQLxkRUn3IUj8=;
        b=uuvWTEdqi/Gtf06ySU6YZ/nN9Bdd3f0hgJq4BtWE0QQispWqD2vhyBHwffMKsALvlZ
         /bH78WgOGj55UTwfbBxzqLGPFBBmj47dTFBV5VLS67wXt3GFrFwBryA4kTuacN/sJKIS
         9Neza+TvbQRp+Xs5K4Cqj3i1UCrUSx8Y4mQz9Mn1CK1X05M1yJZMW5Z/OdljxaZ7k9G7
         7fErQ0FynbLQQl/b7FoGJv8OXhsmT2VCgeJqgKvyHqfqYHBHazQ13qrqu+jqlFseCZYd
         w+BDb970Yryk6+uU6oi/JtHAWXwtmhTMZaEPGdzmoT1o2LnRZNqIbV/roR2YmfjPus9h
         bAGg==
X-Forwarded-Encrypted: i=1; AJvYcCUkWqlbAFHb7aenvtn/pTMIk57LKJG9ceJr66uXLRXXflgJgE1ZIheRWRcRE5dlY9oqd3Mazc2g1AYPtbjh5f58OIatfQcKeLEkLtCtdjM=
X-Gm-Message-State: AOJu0Yx/YFRtJo7872LUDRWkeuU0R8S7j7/ushiSO3q3FBzseDCEzMlC
	JddJlBCtWqHEhXUQVGFTzgX04Nf4bYJFBixEpHYAmIxQildvkD0K
X-Google-Smtp-Source: AGHT+IFVQGy75AgyQKRu+PPqCwD+heHmRJnRnFg8jVCLYmN6muhQ9vZDwxO527BuprsGNF0GdK2cVg==
X-Received: by 2002:a19:7418:0:b0:52b:c29e:704d with SMTP id 2adb3069b0e04-52cc47ed3f9mr1458619e87.17.1718876981888;
        Thu, 20 Jun 2024 02:49:41 -0700 (PDT)
Message-ID: <6f93c9a4e661013ae00581959cdc7445a7c6025a.camel@gmail.com>
Subject: Re: [PATCH for-4.19] hotplug: Restore block-tap phy compatibility
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich
 <jbeulich@suse.com>
Cc: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org,
  Jason Andryuk <jason.andryuk@amd.com>, Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 20 Jun 2024 11:49:41 +0200
In-Reply-To: <ZnLsMOQ3zt4W855q@l14>
References: <20240516022212.5034-1-jandryuk@gmail.com>
	 <64083e01-edf1-4395-a9d7-82e82d220de7@suse.com>
	 <9678073f-82d5-4402-b5a0-e24985c1446b@amd.com>
	 <7de20763-b9bc-4dfc-b250-8f83c42e9e16@suse.com> <ZnLsMOQ3zt4W855q@l14>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Wed, 2024-06-19 at 14:33 +0000, Anthony PERARD wrote:
> On Wed, Jun 19, 2024 at 02:07:04PM +0200, Jan Beulich wrote:
> > On 16.05.2024 15:52, Jason Andryuk wrote:
> > > On 2024-05-16 03:41, Jan Beulich wrote:
> > > > On 16.05.2024 04:22, Jason Andryuk wrote:
> > > > > From: Jason Andryuk <jason.andryuk@amd.com>
> > > > >=20
> > > > > From: Jason Andryuk <jason.andryuk@amd.com>
> > > >=20
> > > > Two identical From: (also in another patch of yours, while in
> > > > yet another one
> > > > you have two _different_ ones, when only one will survive into
> > > > the eventual
> > > > commit anyway)?
> > >=20
> > > Sorry about that.=C2=A0 Since I was sending from my gmail account, I
> > > thought=20
> > > I needed explicit From: lines to ensure the authorship was listed
> > > w/=20
> > > amd.com.=C2=A0 I generated the patches with `git format-patch --from`=
,
> > > to get=20
> > > the explicit From: lines, and then sent with `git send-email`.=C2=A0
> > > The=20
> > > send-email step then inserted the additional lines.=C2=A0 I guess it
> > > added=20
> > > =C2=A0From amd.com since I had changed to that address in .gitconfig.
> > >=20
> > > > > backendtype=3Dphy using the blktap kernel module needs to use
> > > > > write_dev,
> > > > > but tapback can't support that.=C2=A0 tapback should perform
> > > > > better, but make
> > > > > the script compatible with the old kernel module again.
> > > > >=20
> > > > > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> > > >=20
> > > > Should there be a Fixes: tag here?
> > >=20
> > > That makes sense.
> > >=20
> > > Fixes: 76a484193d ("hotplug: Update block-tap")
> >=20
> > Surely this wants going into 4.19? Thus - Anthony, Oleksii?
>=20
> Yes, I think so.
>=20
> Acked-by: Anthony PERARD <anthony.perard@vates.tech>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

