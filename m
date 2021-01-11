Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 190EB2F0E70
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 09:46:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64658.114248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyspT-0006Ru-Vb; Mon, 11 Jan 2021 08:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64658.114248; Mon, 11 Jan 2021 08:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyspT-0006RV-SN; Mon, 11 Jan 2021 08:45:35 +0000
Received: by outflank-mailman (input) for mailman id 64658;
 Mon, 11 Jan 2021 08:45:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+Cs=GO=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kyspS-0006RQ-Jh
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 08:45:34 +0000
Received: from mail-wr1-x42e.google.com (unknown [2a00:1450:4864:20::42e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ceac966d-b79b-433e-b0d1-0184f74fd4da;
 Mon, 11 Jan 2021 08:45:33 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id 91so15485057wrj.7
 for <xen-devel@lists.xenproject.org>; Mon, 11 Jan 2021 00:45:33 -0800 (PST)
Received: from CBGR90WXYV0 (host86-165-42-133.range86-165.btcentralplus.com.
 [86.165.42.133])
 by smtp.gmail.com with ESMTPSA id x18sm25955825wrg.55.2021.01.11.00.45.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Jan 2021 00:45:31 -0800 (PST)
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
X-Inumbo-ID: ceac966d-b79b-433e-b0d1-0184f74fd4da
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=dtrVRMRMrvhoE+3+78F06JZvdTXIzf5CAl1nxt/MWCs=;
        b=mC6kzmQZZT6tKw61p3C+RU8JnHaArDyVvBploz5ldsEkiwydkB7NUwMCN5oC5F8Lzi
         2O3xawvuWpP5ARkf8U4hz8wicaBpz2nLxHtLeZ0+/1FdoliX1a4WjYrngqv/bGIrxzz7
         gGyDuGFTj1zZZagsFT/L0c699riqLDaboM2pfDp1DB4v8fCG33iKmFTadjl8yD51ByX1
         G5rrLhoQBiW9xYEuKhdwazTrPz7aCREXMhIpuB/Kz6TxV6GWCnEZ8NV7o9uW+itmcGNY
         nJrVrJY7yKdk3iQ8r0Sxv24GehqgHknXtmBtpM8njOwXGl+ZCff+MyeaZM2Fyo7LNosF
         OLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=dtrVRMRMrvhoE+3+78F06JZvdTXIzf5CAl1nxt/MWCs=;
        b=IkfJ6RA0d2hshV0rb99Q8V+W4lV1OG0pDc7UCpeIUonf1QSIC2dpPJthzLN+cqNMv7
         iivnbMONzTd/54b8pumaTKBpTWjaf41ko3yzM7p1TecbK5+xE+/3CqWGpl1H7vG7JI+N
         CR7VQ6Lp7WMhjTfJWs5DGWuAhe2/Q82O1XaPwV0+tiSt36qjZm/hhPxmXO+vu8b/rF+q
         D1LZm72yCWNeG8EYghSYMDyP/FNckXiXgTIRzxRPpudD7mjrOr4/7GBbw7+nQn/tlv+q
         mqOd9DGth6NX/ptY97W5sdTwG9NETThbGeiUGIaoo6QufctuK0sDMPj8N2AvLnmmLebZ
         kyjA==
X-Gm-Message-State: AOAM530qIr1rMqz40egzwEX4CWSxtuoYsX1jqwyFyjyCbltmPGjrEP8y
	mmseQclTsMDR4f4ahUpqsBg=
X-Google-Smtp-Source: ABdhPJybvppJpGtIv8PQJaNqrHsr2gPbQ2tySDBMyS6U/X7NgnEeeBdGRB5eAdK0qE/r6eM8np8e9g==
X-Received: by 2002:a5d:4ece:: with SMTP id s14mr14808600wrv.427.1610354732397;
        Mon, 11 Jan 2021 00:45:32 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Igor Druzhinin'" <igor.druzhinin@citrix.com>,
	<xen-devel@lists.xenproject.org>
Cc: <wl@xen.org>,
	<iwj@xenproject.org>,
	<anthony.perard@citrix.com>,
	<andrew.cooper3@citrix.com>,
	<george.dunlap@citrix.com>,
	<jbeulich@suse.com>,
	<julien@xen.org>,
	<sstabellini@kernel.org>,
	<roger.pau@citrix.com>
References: <1610066796-17266-1-git-send-email-igor.druzhinin@citrix.com> <009d01d6e598$bfdd0110$3f970330$@xen.org> <ce4814a8-4f18-c17c-c3e2-99a0ad18e4f1@citrix.com>
In-Reply-To: <ce4814a8-4f18-c17c-c3e2-99a0ad18e4f1@citrix.com>
Subject: RE: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per partition
Date: Mon, 11 Jan 2021 08:45:30 -0000
Message-ID: <00ad01d6e7f6$1ebbe610$5c33b230$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIZObzvX1fStk6d0If1Grmzp4ChNQKH77KyAjM4vxqpd5uSIA==

> -----Original Message-----
> From: Igor Druzhinin <igor.druzhinin@citrix.com>
> Sent: 09 January 2021 00:56
> To: paul@xen.org; xen-devel@lists.xenproject.org
> Cc: wl@xen.org; iwj@xenproject.org; anthony.perard@citrix.com; =
andrew.cooper3@citrix.com;
> george.dunlap@citrix.com; jbeulich@suse.com; julien@xen.org; =
sstabellini@kernel.org;
> roger.pau@citrix.com
> Subject: Re: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per =
partition
>=20
> On 08/01/2021 08:32, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Igor Druzhinin <igor.druzhinin@citrix.com>
> >> Sent: 08 January 2021 00:47
> >> To: xen-devel@lists.xenproject.org
> >> Cc: paul@xen.org; wl@xen.org; iwj@xenproject.org; =
anthony.perard@citrix.com;
> >> andrew.cooper3@citrix.com; george.dunlap@citrix.com; =
jbeulich@suse.com; julien@xen.org;
> >> sstabellini@kernel.org; roger.pau@citrix.com; Igor Druzhinin =
<igor.druzhinin@citrix.com>
> >> Subject: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per =
partition
> >>
> >> TLFS 7.8.1 stipulates that "a virtual processor index must be less =
than
> >> the maximum number of virtual processors per partition" that "can =
be obtained
> >> through CPUID leaf 0x40000005". Furthermore, "Requirements for =
Implementing
> >> the Microsoft Hypervisor Interface" defines that starting from =
Windows Server
> >> 2012, which allowed more than 64 CPUs to be brought up, this leaf =
can now
> >> contain a value -1 basically assuming the hypervisor has no =
restriction while
> >> 0 (that we currently expose) means the default restriction is still =
present.
> >>
> >> Along with previous changes exposing ExProcessorMasks this allows a =
recent
> >> Windows VM with Viridian extension enabled to have more than 64 =
vCPUs without
> >> going into immediate BSOD.
> >>
> >
> > This is very odd as I was happily testing with a 128 vCPU VM once =
ExProcessorMasks was
> implemented... no need for the extra leaf.
> > The documentation for 0x40000005 states " Describes the scale limits =
supported in the current
> hypervisor implementation. If any
> > value is zero, the hypervisor does not expose the corresponding =
information". It does not say (in
> section 7.8.1 or elsewhere AFAICT)
> > what implications that has for VP_INDEX.
> >
> > In " Requirements for Implementing the Microsoft Hypervisor =
Interface" I don't see anything saying
> what the semantics of not
> > implementing leaf 0x40000005 are, only that if implementing it then =
-1 must be used to break the 64
> VP limit. It also says that
> > reporting -1 in 0x40000005 means that 40000004.EAX bits 1 and 2 =
*must* be clear, which is clearly
> not true if ExProcessorMasks is
> > enabled. That document is dated June 13th 2012 so I think it should =
be taken with a pinch of salt.
> >
> > Have you actually observed a BSOD with >64 vCPUs when =
ExProcessorMasks is enabled? If so, which
> version of Windows? I'd like to get
> > a repro myself.
>=20
> I return with more testing that confirm both my and your results.
>=20
> 1) with ExProcessorMask and 66 vCPUs assigned both current WS19 build =
and
> pre-release 20270 of vNext boot correctly with no changes
>=20
> and that would be fine but the existing documentation for =
ex_processor_masks
> states that:
> "Hence this enlightenment must be specified for guests with more
> than 64 vCPUs if B<hcall_remote_tlb_flush> and/or B<hcall_ipi> are =
also
> specified."
>=20
> You then would expect 64+ vCPU VM to boot without ex_processors_mask,
> hcall_remote_tlb_flush and hcall_ipi.

Indeed.

>=20
> So,
> 2) without ExProcessorMaks and 66 vCPUs assigned and with =
hcall_remote_tlb_flush
> and hcall_ipi disabled: WS19 BSODs and vNext fails to initialize =
secondary CPUs
>=20

This is not what I recall from testing but I can confirm I see the same =
now.

> After applying my change,
> 3) without ExProcessorMaks and 66 vCPUs assigned and with =
hcall_remote_tlb_flush
> and hcall_ipi disabled WS19 and vNext boot correctly
>=20
> So we either need to change documentation and require ExProcessorMasks =
for all
> VMs with 64+ vCPUs or go with my change.
>=20

I think we go with your change. I guess we can conclude then that the =
separate viridian flag as part of the base set is the right way to go =
(to stop the leaf magically appearing on migrate of existing guests) and =
leave ex_processor_masks (and the documentation) as-is.

You can add my R-b to the patch.

  Paul

> Igor


