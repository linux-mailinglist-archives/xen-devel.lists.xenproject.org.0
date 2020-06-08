Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D01E91F194C
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 14:54:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiHI4-0001iq-Nq; Mon, 08 Jun 2020 12:54:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9p0X=7V=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jiHI2-0001il-CT
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 12:54:10 +0000
X-Inumbo-ID: 24d83452-a987-11ea-9ad7-bc764e2007e4
Received: from mail-wr1-x42e.google.com (unknown [2a00:1450:4864:20::42e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24d83452-a987-11ea-9ad7-bc764e2007e4;
 Mon, 08 Jun 2020 12:54:09 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id j10so17276251wrw.8
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 05:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=+0xqlqXt4RPTjZ0zvstONOq/N0CA6NCxcbWOsPt8x5g=;
 b=HCd191AV5KaijMF5mroSKr6jvuSoGadgs0bKIDHoLNN+LKrjpzjWhdoMFmXGI5BDMQ
 4bHe1F9IYCR0KsXD8Ow3UJX5XSbYqqJAW8JD9rgSFDFOVoxbTasKS5f81AsWRupYfeMe
 GOza3WG2q51IqG59EBGy5LvkRiRVVtSOY6wYHXQcZ0MSBOZ/pVlQYbLM8Y5hXO128fRi
 9PcIhxl3cYNkXLlO0OxKytga/l23VCz26vLwDzNnGJTru3IFcZKrzcivrBBC1hdcRjKY
 2QBF5F/yiI1JXRWchoskqXBo1/Mtaez7n+CLgBRMws0SBCCbBScTHbDfIucybS7uOQ1e
 7RlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=+0xqlqXt4RPTjZ0zvstONOq/N0CA6NCxcbWOsPt8x5g=;
 b=Dvu7lbQ1F/swtFNszFwQTdkaxK1fUcTmKTrhx4q1mHb2AFGDvOJXL5Nu+BEuJEZ5TK
 rcsQYMOL6fIJznCd26zmgemVPzNwQQ8l5d1NbWhy17GLdHZIb0D3qJ+BeJg8vCgFC5A5
 pBSNb24X+gamRMau6kX5QUsG0qDoc/kh6IBrSJ1w5K5aYa9qYmqVe7CB5E83hVE7xjUO
 GOnJ8HdX3+3KEyRjF6D4MNh9BUGyP6v0IcMz95K8Z862vRC3n2SOJLrp9Jd1464zUX7+
 fQFQVwSlI1YNMTOSZouGQ9i5iFJxNv+v5s3XyH2UGYvFny5jO0l2pdIpIyiHGRCzRx/1
 DaAg==
X-Gm-Message-State: AOAM532zC0asmgh+zMUiDwFU2joRMyWyjVzr5mSdfRJnofbSV3Uj2PBN
 9icj/jUdZrBJ4E+TeuiUhZA=
X-Google-Smtp-Source: ABdhPJz/hYPvQdqrIWfggufEYw1obuZRI/PrCNh02iOqVN4oFUUssbZ2HVsACRHJs8p0BkY2z0vhUA==
X-Received: by 2002:a5d:4446:: with SMTP id x6mr22589881wrr.119.1591620848868; 
 Mon, 08 Jun 2020 05:54:08 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id j4sm23413003wma.7.2020.06.08.05.54.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jun 2020 05:54:08 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <4dcc0092-6f6d-5d63-06cb-15b2fec244db@suse.com>
 <ecca6d68-9b86-0549-1e1a-308704e11aad@citrix.com>
 <c58d7d90-94cb-fa3e-a5ad-c3fb85b921a9@suse.com>
 <20200604142542.GC98582@mail-itl>
 <3b4dbb2f-7a0a-29a8-cca7-0cb641e8338d@suse.com>
 <000501d63b29$496ce6e0$dc46b4a0$@xen.org>
 <fe275c12-9bea-8733-dbdc-b225bf15fea3@suse.com>
 <002001d63b3e$7c268a40$74739ec0$@xen.org>
 <a418a2ea-f4ff-2b8e-eabf-2622099561f6@suse.com>
 <002e01d63b4f$914b3a90$b3e1afb0$@xen.org> <20200605161804.GJ98582@mail-itl>
 <d1bc0e70-c5a1-438a-e430-76b3d561564c@suse.com>
 <002701d63d75$6363a130$2a2ae390$@xen.org>
 <3811b700-7bd7-859a-2c84-a9885acf64a1@suse.com>
 <002e01d63d91$a701e5c0$f505b140$@xen.org>
 <49232c15-513b-0ff3-040e-8f5287a84379@suse.com>
In-Reply-To: <49232c15-513b-0ff3-040e-8f5287a84379@suse.com>
Subject: RE: handle_pio looping during domain shutdown,
 with qemu 4.2.0 in stubdom
Date: Mon, 8 Jun 2020 13:54:06 +0100
Message-ID: <003101d63d93$e5e64a90$b1b2dfb0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQCJ30jDNcpaWIG0GDXmJ4sF0URUNgF7hKHXArBYEOQB4r0ScAFGccUAApWxmk4BPtBDbAHi/U0vAkOVa4cCoqFkNAIjoGbrAeOG1z8COvfc/AHOrDeGAlXxdEUCXuBn/qpxpdJA
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
Cc: =?utf-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 =?utf-8?Q?'Marek_Marczykowski-G=C3=B3recki'?=
 <marmarek@invisiblethingslab.com>,
 'xen-devel' <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 08 June 2020 13:47
> To: paul@xen.org
> Cc: 'J=C3=BCrgen Gro=C3=9F' <jgross@suse.com>; 'Marek =
Marczykowski-G=C3=B3recki' <marmarek@invisiblethingslab.com>;
> 'Ian Jackson' <ian.jackson@eu.citrix.com>; 'Andrew Cooper' =
<andrew.cooper3@citrix.com>; 'xen-devel'
> <xen-devel@lists.xenproject.org>
> Subject: Re: handle_pio looping during domain shutdown, with qemu =
4.2.0 in stubdom
>=20
> On 08.06.2020 14:38, Paul Durrant wrote:
> >> From: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>
> >> Sent: 08 June 2020 10:25
> >>
> >> On 08.06.20 11:15, Paul Durrant wrote:
> >>>> From: Jan Beulich <jbeulich@suse.com>
> >>>> Sent: 08 June 2020 09:14
> >>>>
> >>>> On 05.06.2020 18:18, 'Marek Marczykowski-G=C3=B3recki' wrote:
> >>>>> (XEN) d12v0 XEN_DMOP_remote_shutdown domain 11 reason 0
> >>>>> (XEN) d12v0 domain 11 domain_shutdown vcpu_id 0 defer_shutdown 1
> >>>>> (XEN) d12v0 XEN_DMOP_remote_shutdown domain 11 done
> >>>>> (XEN) d12v0 hvm_destroy_ioreq_server called for 11, id 0
> >>>>
> >>>> Can either of you tell why this is? As said before, qemu =
shouldn't
> >>>> start tearing down ioreq servers until the domain has made it out
> >>>> of all shutdown deferrals, and all its vCPU-s have been paused.
> >>>> For the moment I think the proposed changes, while necessary, =
will
> >>>> mask another issue elsewhere. The @releaseDomain xenstore watch,
> >>>> being the trigger I would consider relevant here, will trigger
> >>>> only once XEN_DOMINF_shutdown is reported set for a domain, which
> >>>> gets derived from d->is_shut_down (i.e. not mistakenly
> >>>> d->is_shutting_down).
> >>>
> >>> I can't find anything that actually calls =
xendevicemodel_shutdown(). It was added by:
> >>
> >> destroy_hvm_domain() in qemu does.
> >>
> >
> > Ah ok, thanks. So it looks like this should only normally be called =
when the guest has written to
> the PIIX to request shutdown. Presumably the hvm_destroy_ioreq_server =
call we see afterwards is QEMU
> then exiting.
>=20
> If a shutdown request was received, qemu should still not exit as long
> as there's in-flight I/O, or as long as there are CPUs running in the
> guest. It would seem legitimate to "cancel" in-flight I/O (and perhaps
> "reject" further requests arriving), but the device model needs to
> remain there as long as there's at least one running CPU. That's no
> different on "real" hardware - the machine doesn't "disappear" just
> because shutdown was requested.

Yes, I would not expect QEMU to exit straight away... or at all, until =
killed by the toolstack. So that's the next thing to investigate.

  Paul

>=20
> Jan


