Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E849D27440D
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 16:20:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKj9K-0004CG-1b; Tue, 22 Sep 2020 14:20:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wZys=C7=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kKj9J-00044D-2A
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 14:20:05 +0000
X-Inumbo-ID: 878c22f3-c6a0-4a52-aaa1-5bd256a32647
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 878c22f3-c6a0-4a52-aaa1-5bd256a32647;
 Tue, 22 Sep 2020 14:20:03 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id j2so17290847wrx.7;
 Tue, 22 Sep 2020 07:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=wkHCv8F92nzhMr1RHQy8ugQFBMe6EAXcxhpmVIgirJg=;
 b=bZEz5ZSOdtlw1hbrTRbCt4TQleWCOIrQqCh+zziBxHWn/Y0rHwCD2DqETsuIw6SC/Z
 Nwx527eMnUlgT1UQhKhP7Sre1nwVc/H/uCCyARnpnduUEqFXuW8PZcmnvSMwgA25VnyZ
 50jTfjbzXWOJ0kKCJsHUcNk4wddyijduXNdhp+NkzXvKUiIh+t2UxFhyu2Kl66/LvPFx
 mwS4SYVojCXTeXgiXOIbcir5lJ40mdIEsCBSs8yQsnThld9PtSwQJOurgPO5tisUdBZu
 PiTsU/a53PBRrQ/ssZIXIhVd+JmsfG+8g4X+C/WoxY+ndYQLiAWr4CnhAbXajGjoXumo
 8C0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=wkHCv8F92nzhMr1RHQy8ugQFBMe6EAXcxhpmVIgirJg=;
 b=krItZQtTWudcYD1bjwR1a46hK54qZ+Jb6i8qLco1cJcaENBRRPcmViCwToCygT/aI7
 tZZiM2C2smM2l5vcKXo0MVKY8AEeI3cu+lQuvNpvG2fVUJ8y+D9/KInVRoEcAmRBUqS9
 0spHTKwV5YN+OXcAt7noC3EhQIR5hGdJcmMqvVAsSJxje32rYvsTU7KztpFzyFG0SWDu
 obsb9mYhJYPcRd9ue3no8PeYpgrAcK2igJN2rV6YnlhGLQuxnMNcKeRkx0u09ZyRwxG0
 Q4S6VScY9XNMBb/ZAH871ONUTxpyOzp8L3S3VEdH5fvHtSgAZg7wjIg/6SjjipDDLUe9
 ewdw==
X-Gm-Message-State: AOAM533ra1+uDL05d64CeXebEovbExEqjmorJLaPLj6LGUDOeSeiz5/q
 BJD8/eKBEVT0hvBEb/eMhDM=
X-Google-Smtp-Source: ABdhPJzMVopL2etqqrOMerK9YUMg+ERAPjQyT1St+WmgTl8JcD5ZXnV+iVmMkZ8BpOR61tk5KR8wuA==
X-Received: by 2002:adf:fd90:: with SMTP id d16mr5777892wrr.52.1600784402720; 
 Tue, 22 Sep 2020 07:20:02 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id h8sm26758632wrw.68.2020.09.22.07.20.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Sep 2020 07:20:01 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>,
 "'Edwin Torok'" <edvin.torok@citrix.com>, <sstabellini@kernel.org>,
 "'Anthony Perard'" <anthony.perard@citrix.com>,
 <xen-devel@lists.xenproject.org>
Cc: <xen-users@lists.xenproject.org>, <jerome.leseinne@gmail.com>,
 <julien@xen.org>
References: <CAAMaOzi5d7S0qAhBkPTFzNfAWXMuK-JbxtQuyk4hdPcVDUwxQg@mail.gmail.com>
 <c84155eb-429d-7143-9eb1-3b5a50c6bde5@xen.org>
 <46f1f50dc02c53391958d9d4bb5fc57d23ba6ede.camel@citrix.com>
 <CAAMaOzj3eYo=bQgth51f+psR2ZBj+c-2boZy57x2qV2aq0fShQ@mail.gmail.com>
 <ba74b8225223ba800c38b34ac950283b7b6cb0fe.camel@citrix.com>
 <00a101d690e6$33a88bd0$9af9a370$@xen.org>
 <816d5bd8-6794-7fcd-bd08-6eb5a2248328@suse.com>
In-Reply-To: <816d5bd8-6794-7fcd-bd08-6eb5a2248328@suse.com>
Subject: RE: oxenstored performance issue when starting VMs in parallel
Date: Tue, 22 Sep 2020 15:20:00 +0100
Message-ID: <00e901d690eb$759ff5a0$60dfe0e0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIMrhWN1wQeREaSEc+MmVb+KxeEJQB0POE8AQkglPkA0UpCvgG7bFMSAn0bfWsCYHSeyqjBPSiw
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>
> Sent: 22 September 2020 15:18
> To: paul@xen.org; 'Edwin Torok' <edvin.torok@citrix.com>; =
sstabellini@kernel.org; 'Anthony Perard'
> <anthony.perard@citrix.com>; xen-devel@lists.xenproject.org
> Cc: xen-users@lists.xenproject.org; jerome.leseinne@gmail.com; =
julien@xen.org
> Subject: Re: oxenstored performance issue when starting VMs in =
parallel
>=20
> On 22.09.20 15:42, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Edwin Torok <edvin.torok@citrix.com>
> >> Sent: 22 September 2020 14:29
> >> To: sstabellini@kernel.org; Anthony Perard =
<anthony.perard@citrix.com>; xen-
> >> devel@lists.xenproject.org; paul@xen.org
> >> Cc: xen-users@lists.xenproject.org; jerome.leseinne@gmail.com; =
julien@xen.org
> >> Subject: Re: oxenstored performance issue when starting VMs in =
parallel
> >>
> >> On Tue, 2020-09-22 at 15:17 +0200, jerome leseinne wrote:
> >>> Hi,
> >>>
> >>> Edwin you rock ! This call in qemu is effectively the culprit !
> >>> I have disabled this xen_bus_add_watch call and re-run test on our
> >>> big server:
> >>>
> >>> - oxenstored is now  between 10% to 20%  CPU usage (previously was
> >>> 100% all the time)
> >>> - All our VMs are responsive
> >>> - All our VM start in less than 10 seconds (before the fix some =
VMs
> >>> could take more than one minute to be fully up
> >>> - Dom0 is more responsive
> >>>
> >>> Disabling the watch may not be the ideal solution ( I let the qemu
> >>> experts answer this and the possible side effects),
> >>
> >> Hi,
> >>
> >> CC-ed Qemu maintainer of Xen code, please see this discussion about
> >> scalability issues with the backend watching code in qemu 4.1+.
> >>
> >> I think the scalability issue is due to this code in qemu, which =
causes
> >> an instance of qemu to see watches from all devices (even those
> >> belonging to other qemu instances), such that adding a single =
device
> >> causes N watches to be fired on each N instances of qemu:
> >>        xenbus->backend_watch =3D
> >>             xen_bus_add_watch(xenbus, "", /* domain root node */
> >>                               "backend", xen_bus_backend_changed,
> >>   &local_err);
> >>
> >> I can understand that for backwards compatibility you might need =
this
> >> code, but is there a way that an up-to-date (xl) toolstack could =
tell
> >> qemu what it needs to look at (e.g. via QMP, or other keys in =
xenstore)
> >> instead of relying on an overly broad watch?
> >
> > I think this could be made more efficient. The call to =
"module_call_init(MODULE_INIT_XEN_BACKEND)"
> just prior to this watch will register backends that do auto-creation =
so we could register individual
> watches for the various backend types instead of this single one.
>=20
> The watch should be on guest domain level, e.g. for:
>=20
> /local/domain/0/backend/vbd/5
>=20
> We have one qemu process per guest, after all.
>=20

I'll see if I can spin a patch this afternoon.

  Paul

>=20
> Juergen


