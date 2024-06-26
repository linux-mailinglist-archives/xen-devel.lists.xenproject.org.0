Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB070918776
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 18:33:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749329.1157407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVaL-0005Lj-5s; Wed, 26 Jun 2024 16:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749329.1157407; Wed, 26 Jun 2024 16:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVaL-0005Jb-36; Wed, 26 Jun 2024 16:33:29 +0000
Received: by outflank-mailman (input) for mailman id 749329;
 Wed, 26 Jun 2024 16:33:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m54e=N4=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sMVaJ-0005JV-St
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 16:33:27 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfb3d437-33d9-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 18:33:25 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a6fbe639a76so140368166b.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 09:33:25 -0700 (PDT)
Received: from localhost ([160.101.139.1]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7291af7912sm43112866b.128.2024.06.26.09.33.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 09:33:24 -0700 (PDT)
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
X-Inumbo-ID: cfb3d437-33d9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719419605; x=1720024405; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IK4Sks/gRyZHvoMo5UKRJrAZk736gUoPmC0/JkEO3rE=;
        b=FgRc1H1GSVcV/ozwYcjDnXNAQpqBD2bhCkf7Xg2IKKkrNhps9LUJ/dHKcUUKkUb8t2
         5MEkdaUw70DDeTTwXxhmU8b51jMhsRLbiC+VNng9sEslBtGW+c81JXrVXu/q+ZGWiYbo
         XwKhEeeNKeA1mVwXe4zNKaewTjny691BHKgh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719419605; x=1720024405;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IK4Sks/gRyZHvoMo5UKRJrAZk736gUoPmC0/JkEO3rE=;
        b=Vjb0MjeipzV3ydYjMf7lJOSUBqY8q9Cl+nItRfqkJOlQuPYNryVrl8Lu4F3q5cfymq
         VvMCDne6Dq4UMPpD3TnFnDAKgdoRRK5KoNbapYsNS1ciXTkNg5YhTqsDYTJ/EaojOku2
         +MYoaOMwpanr9lfd0BxVQommUT6OZDHjhiFOj4Y2uvnelKxSkqh8ivSh2HvLMXA6yNeF
         x6ehhKV3JCVgPLQ2C2D2CS909t0dT6tx0dcF2iK3qL8dv515Xl+0tWbFAoenfpiwpfJd
         Tn2gFfK0uMicB08yawaCBzICXARwVJ7OANtINH5ZURRM2wV8MVRSe6qhbdyv2egTpuX5
         v4BQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0Sfq2WKBUXPd8UMyfK6UPe6QtxdDbzOsOCqCSw9TeOeLRM2W2NxZd6p/rEvsKyFZV13ptQoTeXQ418xMvahB9D8wiQAySj14zIWRcahM=
X-Gm-Message-State: AOJu0YwDa5epK2wBbI4nKH6aPURuEaOmC6VGo3S6buR0aHISqqcu8y31
	n5+J2S/zc6n511L+gd4dHlEEUluuxPncQnexFpeDyj/pKWAUEXcwY/v2Fva+Yhk=
X-Google-Smtp-Source: AGHT+IGZ5bpJDmnbPmPn/C5hIk9qm1oDg8DwYWjBY0ilbMCCqVt2cmHcojCbCXLlP74Eo5FqKm8Upw==
X-Received: by 2002:a17:906:2405:b0:a6f:e3e4:e0b6 with SMTP id a640c23a62f3a-a729701b9camr9483366b.27.1719419605297;
        Wed, 26 Jun 2024 09:33:25 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Jun 2024 17:33:23 +0100
Message-Id: <D2A3DPAFY4XJ.1HJA60OBU915H@cloud.com>
Subject: Re: [PATCH v2 (resend) 04/27] acpi: vmap pages in
 acpi_os_alloc_memory
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, "Hongyan
 Xia" <hongyxia@amazon.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "George Dunlap" <george.dunlap@citrix.com>, "Stefano Stabellini"
 <sstabellini@kernel.org>, "Wei Liu" <wl@xen.org>, "Julien Grall"
 <jgrall@amazon.com>, "Elias El Yandouzi" <eliasely@amazon.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <20240116192611.41112-1-eliasely@amazon.com>
 <20240116192611.41112-5-eliasely@amazon.com>
 <D29ZZSXN0QPV.2627WUC2J3NUK@cloud.com>
 <55717cd6-4819-4935-82df-c04453b9676a@suse.com>
In-Reply-To: <55717cd6-4819-4935-82df-c04453b9676a@suse.com>

On Wed Jun 26, 2024 at 4:17 PM BST, Jan Beulich wrote:
> On 26.06.2024 15:54, Alejandro Vallejo wrote:
> > I'm late to the party but there's something bothering me a little.
> >=20
> > On Tue Jan 16, 2024 at 7:25 PM GMT, Elias El Yandouzi wrote:
> >> diff --git a/xen/common/vmap.c b/xen/common/vmap.c
> >> index 171271fae3..966a7e763f 100644
> >> --- a/xen/common/vmap.c
> >> +++ b/xen/common/vmap.c
> >> @@ -245,6 +245,11 @@ void *vmap(const mfn_t *mfn, unsigned int nr)
> >>      return __vmap(mfn, 1, nr, 1, PAGE_HYPERVISOR, VMAP_DEFAULT);
> >>  }
> >> =20
> >> +void *vmap_contig(mfn_t mfn, unsigned int nr)
> >> +{
> >> +    return __vmap(&mfn, nr, 1, 1, PAGE_HYPERVISOR, VMAP_DEFAULT);
> >> +}
> >> +
> >>  unsigned int vmap_size(const void *va)
> >>  {
> >>      unsigned int pages =3D vm_size(va, VMAP_DEFAULT);
> >=20
> > How is vmap_contig() different from regular vmap()?
> >=20
> > vmap() calls map_pages_to_xen() `nr` times, while vmap_contig() calls i=
t just
> > once. I'd expect both cases to work fine as they are. What am I missing=
? What
> > would make...
> >=20
> >> diff --git a/xen/drivers/acpi/osl.c b/xen/drivers/acpi/osl.c
> >> index 389505f786..ab80d6b2a9 100644
> >> --- a/xen/drivers/acpi/osl.c
> >> +++ b/xen/drivers/acpi/osl.c
> >> @@ -221,7 +221,11 @@ void *__init acpi_os_alloc_memory(size_t sz)
> >>  	void *ptr;
> >> =20
> >>  	if (system_state =3D=3D SYS_STATE_early_boot)
> >> -		return mfn_to_virt(mfn_x(alloc_boot_pages(PFN_UP(sz), 1)));
> >> +	{
> >> +		mfn_t mfn =3D alloc_boot_pages(PFN_UP(sz), 1);
> >> +
> >> +		return vmap_contig(mfn, PFN_UP(sz));
> > ... this statement not operate identically with regular vmap()? Or
> > probably more interestingly, what would preclude existing calls to vmap=
() not
> > operate under vmap_contig() instead?
>
> Note how vmap()'s first parameter is "const mfn_t *mfn". This needs to po=
int
> to an array of "nr" MFNs. In order to use plain vmap() here, you'd first =
need
> to set up a suitably large array, populate if with increasing MFN values,=
 and
> then make the call. Possible, but more complicated.
>
> Jan

I knew I must've been missing something. That pesky pointer... No wonder th=
e
loop looked wonky. It was doing something completely different from what I
expected it to.

That clarifies it. Thanks a bunch, Jan.

Cheers,
Alejandro

