Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 133451F18E4
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 14:38:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiH2V-0008K3-TT; Mon, 08 Jun 2020 12:38:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9p0X=7V=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jiH2U-0008IR-6U
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 12:38:06 +0000
X-Inumbo-ID: e61c169a-a984-11ea-9b55-bc764e2007e4
Received: from mail-wm1-x329.google.com (unknown [2a00:1450:4864:20::329])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e61c169a-a984-11ea-9b55-bc764e2007e4;
 Mon, 08 Jun 2020 12:38:05 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id q25so16371116wmj.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 05:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=zCgU3fmaIy0D8xnCIG/NmFK7Ce5D0Tpz/4j3owSjbyk=;
 b=sIBykx6S4modYxFOsMMKHUIhkpK9rtkZswSa9CBeJslKhK9HhKgzqVtT/s5vJdR/oH
 JSmANFx/GYFypZVq1aEHkGdLlBMLo322kD2xSwygdm1x6nzjk3W/44fPFmh70Y+hY/U/
 SQ65RbfeUFS5DIeWYdaj2o3+fX7ihFnYfgARuTsbHxvepwnYbOU0L8jYgFqjC8ePYoLw
 kpSb747vR1EJOxqZG0l9N422Ekbk0bR99OhhwEXmcbMuq3cmjtia6da8Wk2sJxWYbRTL
 8Mm2hQdFlUpyaW8V9dWRTBp9Q0CPrsTCrp52XQrkZ0Elmak/y9TEzOMdzXhGesfO/bEu
 96Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=zCgU3fmaIy0D8xnCIG/NmFK7Ce5D0Tpz/4j3owSjbyk=;
 b=t2SgLbXun+SGI8o0PF+XcL9HHzaEQdEQqgp+aUF3LHnDbgiXBYrHRB7++ylHa4B5R+
 IkNbGayM4EjYRIluU367dN/4SkcvJVQhJiG16FC9CCbAHNmyeg+TjUnFHLo0ebPd+sB/
 +Go62ClKnz43oocyuXXPJJAuL9plo35BuUBJF8/DiUjvSew9vnmEM8uCXtSViE2Is5/M
 WMH1De79VDZQAPdglg1Ce5Bd/xb3DylrcMEIEAVO9Qj/XINdpAp+/6KMnK4z/dM7b7Ay
 SXTdSEwlb2jT9YjimawQGAOvSJ7Nh++2I9wUEXdxtYRUvlLugYgBR2oQS3s866ldVqIR
 OAlw==
X-Gm-Message-State: AOAM532ne7Vv1evjh4HMikBWWGWhNOR4a9XCLggNTGRbcquwwXDiLqUg
 RCvAxGSqA55yicEoux28VS8=
X-Google-Smtp-Source: ABdhPJx4RCujE+nx9NPL3mVh8+Rz6bRXeyvpYdrwCBWmBlfIjWyXDus+NNULhHvIM6GH8dDEFDNIeQ==
X-Received: by 2002:a1c:451:: with SMTP id 78mr17231300wme.83.1591619884563;
 Mon, 08 Jun 2020 05:38:04 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id o6sm23317896wrp.3.2020.06.08.05.38.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jun 2020 05:38:03 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>,
 "'Jan Beulich'" <jbeulich@suse.com>,
 =?utf-8?Q?'Marek_Marczykowski-G=C3=B3recki'?=
 <marmarek@invisiblethingslab.com>, 
 "'Ian Jackson'" <ian.jackson@eu.citrix.com>
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
In-Reply-To: <3811b700-7bd7-859a-2c84-a9885acf64a1@suse.com>
Subject: RE: handle_pio looping during domain shutdown,
 with qemu 4.2.0 in stubdom
Date: Mon, 8 Jun 2020 13:38:02 +0100
Message-ID: <002e01d63d91$a701e5c0$f505b140$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQCJ30jDNcpaWIG0GDXmJ4sF0URUNgF7hKHXArBYEOQB4r0ScAFGccUAApWxmk4BPtBDbAHi/U0vAkOVa4cCoqFkNAIjoGbrAeOG1z8COvfc/AHOrDeGqpdGj/A=
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
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'xen-devel' <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>
> Sent: 08 June 2020 10:25
> To: paul@xen.org; 'Jan Beulich' <jbeulich@suse.com>; 'Marek =
Marczykowski-G=C3=B3recki'
> <marmarek@invisiblethingslab.com>; 'Ian Jackson' =
<ian.jackson@eu.citrix.com>
> Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'xen-devel' =
<xen-devel@lists.xenproject.org>
> Subject: Re: handle_pio looping during domain shutdown, with qemu =
4.2.0 in stubdom
>=20
> On 08.06.20 11:15, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 08 June 2020 09:14
> >> To: 'Marek Marczykowski-G=C3=B3recki' =
<marmarek@invisiblethingslab.com>; paul@xen.org
> >> Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'xen-devel' =
<xen-devel@lists.xenproject.org>
> >> Subject: Re: handle_pio looping during domain shutdown, with qemu =
4.2.0 in stubdom
> >>
> >> On 05.06.2020 18:18, 'Marek Marczykowski-G=C3=B3recki' wrote:
> >>> On Fri, Jun 05, 2020 at 04:39:56PM +0100, Paul Durrant wrote:
> >>>>> From: Jan Beulich <jbeulich@suse.com>
> >>>>> Sent: 05 June 2020 14:57
> >>>>>
> >>>>> On 05.06.2020 15:37, Paul Durrant wrote:
> >>>>>>> From: Jan Beulich <jbeulich@suse.com>
> >>>>>>> Sent: 05 June 2020 14:32
> >>>>>>>
> >>>>>>> On 05.06.2020 13:05, Paul Durrant wrote:
> >>>>>>>> That would mean we wouldn't be seeing the "Unexpected PIO" =
message. From that message this
> >> clearly
> >>>>>>> X86EMUL_UNHANDLEABLE which suggests a race with ioreq server =
teardown, possibly due to
> selecting
> >> a
> >>>>>>> server but then not finding a vcpu match in ioreq_vcpu_list.
> >>>>>>>
> >>>>>>> I was suspecting such, but at least the tearing down of all =
servers
> >>>>>>> happens only from relinquish-resources, which gets started =
only
> >>>>>>> after ->is_shut_down got set (unless the tool stack invoked
> >>>>>>> XEN_DOMCTL_destroydomain without having observed =
XEN_DOMINF_shutdown
> >>>>>>> set for the domain).
> >>>>>>>
> >>>>>>> For individually unregistered servers - yes, if qemu did so, =
this
> >>>>>>> would be a problem. They need to remain registered until all =
vCPU-s
> >>>>>>> in the domain got paused.
> >>>>>>
> >>>>>> It shouldn't be a problem should it? Destroying an individual =
server is only done with the
> domain
> >>>>> paused, so no vcpus can be running at the time.
> >>>>>
> >>>>> Consider the case of one getting destroyed after it has already
> >>>>> returned data, but the originating vCPU didn't consume that data
> >>>>> yet. Once that vCPU gets unpaused, handle_hvm_io_completion()
> >>>>> won't find the matching server anymore, and hence the chain
> >>>>> hvm_wait_for_io() -> hvm_io_assist() ->
> >>>>> vcpu_end_shutdown_deferral() would be skipped. handle_pio()
> >>>>> would then still correctly consume the result.
> >>>>
> >>>> True, and skipping hvm_io_assist() means the vcpu internal ioreq =
state will be left set to
> >> IOREQ_READY and *that* explains why we would then exit =
hvmemul_do_io() with X86EMUL_UNHANDLEABLE
> (from
> >> the first switch).
> >>>
> >>> I can confirm X86EMUL_UNHANDLEABLE indeed comes from the first =
switch in
> >>> hvmemul_do_io(). And it happens shortly after ioreq server is =
destroyed:
> >>>
> >>> (XEN) d12v0 XEN_DMOP_remote_shutdown domain 11 reason 0
> >>> (XEN) d12v0 domain 11 domain_shutdown vcpu_id 0 defer_shutdown 1
> >>> (XEN) d12v0 XEN_DMOP_remote_shutdown domain 11 done
> >>> (XEN) d12v0 hvm_destroy_ioreq_server called for 11, id 0
> >>
> >> Can either of you tell why this is? As said before, qemu shouldn't
> >> start tearing down ioreq servers until the domain has made it out
> >> of all shutdown deferrals, and all its vCPU-s have been paused.
> >> For the moment I think the proposed changes, while necessary, will
> >> mask another issue elsewhere. The @releaseDomain xenstore watch,
> >> being the trigger I would consider relevant here, will trigger
> >> only once XEN_DOMINF_shutdown is reported set for a domain, which
> >> gets derived from d->is_shut_down (i.e. not mistakenly
> >> d->is_shutting_down).
> >
> > I can't find anything that actually calls xendevicemodel_shutdown(). =
It was added by:
>=20
> destroy_hvm_domain() in qemu does.
>=20

Ah ok, thanks. So it looks like this should only normally be called when =
the guest has written to the PIIX to request shutdown. Presumably the =
hvm_destroy_ioreq_server call we see afterwards is QEMU then exiting.
There is one other circumstance when destroy_hvmdomain() would be called =
and that is if the ioreq state is not STATE_IOREQ_INPROCESS... in which =
case there should be an accompanying error message in the qemu log.

  Paul

>=20
> Juergen


