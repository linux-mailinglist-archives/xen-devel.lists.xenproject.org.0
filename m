Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F0BD129C8
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 13:49:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200202.1516193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfHMO-0001kU-IW; Mon, 12 Jan 2026 12:49:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200202.1516193; Mon, 12 Jan 2026 12:49:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfHMO-0001iG-Fm; Mon, 12 Jan 2026 12:49:28 +0000
Received: by outflank-mailman (input) for mailman id 1200202;
 Mon, 12 Jan 2026 12:49:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pQDI=7R=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1vfHMM-0001i6-NB
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 12:49:26 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c780a4a-efb5-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 13:49:20 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1768222156672430.2579407866401;
 Mon, 12 Jan 2026 04:49:16 -0800 (PST)
Received: by mail-oi1-f176.google.com with SMTP id
 5614622812f47-459a258561cso3304680b6e.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 04:49:16 -0800 (PST)
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
X-Inumbo-ID: 1c780a4a-efb5-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1768222157; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hXk2cYuCAVD7S3fOsXKJ6SUcL0t0JHcjy/xvIM0piGzS7Ro8DeKCkWO5LdHyYBl0pSo6iI3UxOci3IxOFQneXebqi/Y3IFGe4bAmlCC+bVeOvaCUhOzsBR6wBNGRQnJwDqO0sL2fSZbQyZccudWG7dAVOpEKOwCOhRY6GJ7ESJ4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768222157; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=u1kWYzkrU0/j8va/sM5e2F77znTAOuhK0E5ZWCTNux4=; 
	b=Q81VOyiC0Q4rTl4cIRpWs4i4GJvGCfHHYHsU0WGBxm3yHBIO0QeoHVvd2feijlbIzd3j5KAX1lhR/zaOB4YpN+0FSjNSlVu/OruW9Ur6XCM+dx3ddS9XS/SHwXdjmEWg+ORjWHUDoFpfwquSKhBTVt0NTjkUs8EHjXDOlEHBMJM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768222157;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Message-Id:Reply-To;
	bh=u1kWYzkrU0/j8va/sM5e2F77znTAOuhK0E5ZWCTNux4=;
	b=KMUokDXNApLWuLd8Vw4iez4mNxn8OFJu9yqjDNKUPff0RD2udHN7qYCAjshlshrJ
	0wKpU6P16uR9DOlB/48cjt2qKlepm3vSYqRnRGvENMo8nRmycbVTabwKcGf23rjOoJc
	uuIN5G+7beIcJmpucJ4lcVmTBL/2jpsCFw4vF0OY=
X-Forwarded-Encrypted: i=1; AJvYcCXcg0u28iQ0tskpHywRcPg3CDxX74A9ZDavqXCStfHsQ/9geyPJjFb4eO7Vf5VOuZryCyVkTVrCPcE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHBGR+tOg8NCE1h+qD9xT8V2Xw4qB49kSIamsPOPzKSAR3By4p
	4Hu57JEMhYT0YPkAkE9kBQoYt2s2ladx1XkJsiAfMgoAljkVOetwow5mFTY/3V8HKCQopRFAFsx
	KJD3xvpbk99RhlRAOLjnIB/MXe+tlXjQ=
X-Google-Smtp-Source: AGHT+IE98rGreMUq3ALEK9FZHHogEn1el6PAbKJCG4SZ9qhsPFatThPDU5uihdL6qVpmHO0eNKJP0btqha1LKtCBVIE=
X-Received: by 2002:a05:6808:c165:b0:450:826e:5df1 with SMTP id
 5614622812f47-45a6b82101bmr8606193b6e.19.1768222155807; Mon, 12 Jan 2026
 04:49:15 -0800 (PST)
MIME-Version: 1.0
References: <dbab519006501b3971fa913310a06755a14c4548.1767982955.git.w1benny@gmail.com>
 <ec57461b-dde6-413d-a825-3538f46a1209@suse.com> <1916d0a7-ff9a-49f1-8564-2767226fca9c@citrix.com>
 <f0dcc4e7-3053-4386-a162-579ecf68240f@suse.com> <CAKBKdXg-KRMOf3T+gAiPiRvtjnFJ0sn8aZ-6L+dQvmZsKmRibA@mail.gmail.com>
 <f822a6d7-09cc-4107-9e08-25063595fa02@suse.com>
In-Reply-To: <f822a6d7-09cc-4107-9e08-25063595fa02@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 12 Jan 2026 07:48:39 -0500
X-Gmail-Original-Message-ID: <CABfawhmYVrZ5t8NBJUpNzAbsEp9djQSDAgD8197-N_fnnO6JTw@mail.gmail.com>
X-Gm-Features: AZwV_QiiwpTU35XuNFWwR1rCbzj4AhNNdad04B2U7AnJbgtn_YJPmfoCsxgdifY
Message-ID: <CABfawhmYVrZ5t8NBJUpNzAbsEp9djQSDAgD8197-N_fnnO6JTw@mail.gmail.com>
Subject: Re: [PATCH] x86/altp2m: altp2m_get_effective_entry() should honor ap2m->default_access
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000007b247d0648304d98"

--0000000000007b247d0648304d98
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 7:12=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 12.01.2026 13:09, Petr Bene=C5=A1 wrote:
> > On Mon, Jan 12, 2026 at 12:24=E2=80=AFPM Jan Beulich <jbeulich@suse.com=
> wrote:
> >> On 12.01.2026 12:18, Andrew Cooper wrote:
> >>> On 12/01/2026 11:09 am, Jan Beulich wrote:
> >>>> We relatively recently introduced Amends:, which
> >>>> may be a suitable fit here.
> >
> > So, what should be my next steps? Should I re-send the patch where I
> > Cc Tamas, use 12-char hashes and replace Fixes with Amends?
>
> I'd give Tamas a little bit of time to possibly comment, which might then
> save one round of re-submission.


Thanks for waiting for my review, appreciated!

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

--0000000000007b247d0648304d98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 12,=
 2026 at 7:12=E2=80=AFAM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.co=
m">jbeulich@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On 12.01.2026 13:09, Petr Bene=C5=A1 wrote:<br>
&gt; On Mon, Jan 12, 2026 at 12:24=E2=80=AFPM Jan Beulich &lt;<a href=3D"ma=
ilto:jbeulich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt; wrote:<=
br>
&gt;&gt; On 12.01.2026 12:18, Andrew Cooper wrote:<br>
&gt;&gt;&gt; On 12/01/2026 11:09 am, Jan Beulich wrote:<br>
&gt;&gt;&gt;&gt; We relatively recently introduced Amends:, which<br>
&gt;&gt;&gt;&gt; may be a suitable fit here.<br>
&gt; <br>
&gt; So, what should be my next steps? Should I re-send the patch where I<b=
r>
&gt; Cc Tamas, use 12-char hashes and replace Fixes with Amends?<br>
<br>
I&#39;d give Tamas a little bit of time to possibly comment, which might th=
en<br>
save one round of re-submission.</blockquote><div><br></div><div>Thanks for=
 waiting for my review, appreciated!</div><div><br></div><div>Acked-by: Tam=
as K Lengyel &lt;<a href=3D"mailto:tamas@tklengyel.com">tamas@tklengyel.com=
</a>&gt;=C2=A0</div></div></div>

--0000000000007b247d0648304d98--

