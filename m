Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0622E34668A
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 18:40:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100770.192215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOl0j-0000m3-2o; Tue, 23 Mar 2021 17:40:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100770.192215; Tue, 23 Mar 2021 17:40:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOl0i-0000le-Vj; Tue, 23 Mar 2021 17:40:08 +0000
Received: by outflank-mailman (input) for mailman id 100770;
 Tue, 23 Mar 2021 17:40:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QwVt=IV=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1lOl0h-0000lZ-K3
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 17:40:07 +0000
Received: from mail-ot1-x333.google.com (unknown [2607:f8b0:4864:20::333])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea385f8a-6f9b-4b14-8532-b3d071fac583;
 Tue, 23 Mar 2021 17:40:06 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 h6-20020a0568300346b02901b71a850ab4so20270126ote.6
 for <xen-devel@lists.xenproject.org>; Tue, 23 Mar 2021 10:40:06 -0700 (PDT)
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
X-Inumbo-ID: ea385f8a-6f9b-4b14-8532-b3d071fac583
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6/GVoKCpWxnqFm864SDF05q7kHeQOw7BOMEGkyvvqbY=;
        b=de8nbgoP5df7TO9XQZIC3svnyphH122fIkpvrOWAQQUcE3Z3yKvu33wT2rsZDYj48U
         CkoMjBFhSbX2UmmUXrRzMWl7JYgV0U6ddLFWArgbzBPLjNJziosJeGCxu3vJrpA4msXt
         Utem+DDWLgjY2TaQKvzpWZsla0Gp+pEwQF4mVWIffxqpY54pATzsH1y7F/8jFC5tnb2b
         ObNR/CmO9myy41ZUh343v0+8/lV/Ud+gCqddo8XaHr0u6dSYY85H3WwC5AHitE73zSXa
         o2AL+u3ewhCrvMFZc8qPlN8d9Mxgq/7EP+tDadSofNR520LFCKxFF9y4NM7BVJBV90up
         HYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6/GVoKCpWxnqFm864SDF05q7kHeQOw7BOMEGkyvvqbY=;
        b=WorPV+o2Cyyt/MqFCHwTt5lrlmlXJ5KKIt6OXWmv+HbuTKRg5YeUzARKK4Fyam1Mhf
         7q+Z04UtVZ4b8Yqtjdk42mtIG2MKosrgXSW5++bzJgsZj/tTzZS/1oIxzrZ6fvLOC9qb
         m7OKf0Amit71o2fsHAyvxqXyL5uExnW/3TSPR/AyGF/V7VdT05MIwc5mAsjVaQVMMavb
         31oIVyUMPfvPpAEPkWCcu15xnzBrN9bTTApD7GSXMBh3Cwq/7nCG7DBmLS5+OU620WXh
         5j6JBEmf7rx6Lz+dUjrnzexwR/Y5fdBhUo4pMewif1M6/+K9bdl01rD5zaF6YI3dxDiM
         EYow==
X-Gm-Message-State: AOAM53390Z3wQ65H/4/ZYUdkucOq0VOLPac/VIxP+SWQcqEVmowvlU45
	BpZUqLa4R28q0HqKqN6SalvC0e8SgjdcJ2rPxfQ=
X-Google-Smtp-Source: ABdhPJw0/XMEJ8uDz5h5tRTD95XGq8/VfUYIVmgdxxKapSWYyh4cvq55OhkJY5pjIiSNI0UJ088BUhQPu6e25SZP2EI=
X-Received: by 2002:a9d:70ce:: with SMTP id w14mr5255632otj.183.1616521206117;
 Tue, 23 Mar 2021 10:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210316031814.10311-1-dpsmith@apertussolutions.com>
 <20210316031814.10311-2-dpsmith@apertussolutions.com> <YFODOnQRAntdETY7@Air-de-Roger>
In-Reply-To: <YFODOnQRAntdETY7@Air-de-Roger>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 23 Mar 2021 10:39:53 -0700
Message-ID: <CACMJ4GaWtSWAyqbgqDa-DuLy1bYCBx8E6PucxtGfVeiraAy5cA@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs/designs/launch: hyperlaunch design document
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <stefano.stabellini@xilinx.com>, Julien Grall <jgrall@amazon.com>, 
	Julien Grall <Julien.grall.oss@gmail.com>, iwj@xenproject.org, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Rich Persaud <persaur@gmail.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, luca.fancellu@arm.com, 
	paul@xen.org, Adam Schwalm <adam.schwalm@starlab.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 18, 2021 at 9:43 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> Just took a quick look at it.
>
> On Mon, Mar 15, 2021 at 11:18:13PM -0400, Daniel P. Smith wrote:
> > + +---------------+-----------+------------+-----------+-------------+-=
--------------------+
> > + | **Xen Dom0**  | **Linux** | **Late**   | **Jail**  | **Xen**     | =
**Xen Hyperlaunch** |
> > + | **(Classic)** | **KVM**   | **HW Dom** | **house** | **dom0less**+-=
--------+-----------+
> > + |               |           |            |           |             | =
Static  | Dynamic   |
> > + +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=
=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> > + | Hypervisor able to launch multiple VMs during host boot            =
                    |
> > + +---------------+-----------+------------+-----------+-------------+-=
--------+-----------+
> > + |               |           |            |     Y     |       Y     | =
   Y    |     Y     |
> > + +---------------+-----------+------------+-----------+-------------+-=
--------+-----------+
> > + | Hypervisor supports Static Partitioning                            =
                    |
> > + +---------------+-----------+------------+-----------+-------------+-=
--------+-----------+
> > + |               |           |            |     Y     |       Y     | =
   Y    |           |
> > + +---------------+-----------+------------+-----------+-------------+-=
--------+-----------+
> > + | Able to launch VMs dynamically after host boot                     =
                    |
> > + +---------------+-----------+------------+-----------+-------------+-=
--------+-----------+
> > + |       Y       |     Y     |      Y*    |     Y     |       Y*    | =
        |     Y     |
> > + +---------------+-----------+------------+-----------+-------------+-=
--------+-----------+
> > + | Supports strong isolation between all VMs started at host boot     =
                    |
> > + +---------------+-----------+------------+-----------+-------------+-=
--------+-----------+
> > + |               |           |            |     Y     |       Y     | =
   Y    |     Y     |
> > + +---------------+-----------+------------+-----------+-------------+-=
--------+-----------+
> > + | Enables flexible sequencing of VM start during host boot           =
                    |
> > + +---------------+-----------+------------+-----------+-------------+-=
--------+-----------+
> > + |               |           |            |           |             | =
   Y    |     Y     |
> > + +---------------+-----------+------------+-----------+-------------+-=
--------+-----------+
> > + | Prevent all-powerful static root domain being launched at boot     =
                    |
> > + +---------------+-----------+------------+-----------+-------------+-=
--------+-----------+
> > + |               |           |            |           |       Y*    | =
   Y    |     Y     |
> > + +---------------+-----------+------------+-----------+-------------+-=
--------+-----------+
> > + | Operates without a Highly-privileged management VM (eg. Dom0)      =
                    |
> > + +---------------+-----------+------------+-----------+-------------+-=
--------+-----------+
> > + |               |           |      Y*    |           |       Y*    | =
   Y    |     Y     |
> > + +---------------+-----------+------------+-----------+-------------+-=
--------+-----------+
> > + | Operates without a privileged toolstack VM (Control Domain)        =
                    |
> > + +---------------+-----------+------------+-----------+-------------+-=
--------+-----------+
> > + |               |           |            |           |       Y*    | =
   Y    |           |
> > + +---------------+-----------+------------+-----------+-------------+-=
--------+-----------+
> > + | Extensible VM configuration applied before launch of VMs at host bo=
ot                  |
> > + +---------------+-----------+------------+-----------+-------------+-=
--------+-----------+
> > + |               |           |            |           |             | =
   Y    |     Y     |
> > + +---------------+-----------+------------+-----------+-------------+-=
--------+-----------+
> > + | Flexible granular assignment of permissions and functions to VMs   =
                    |
> > + +---------------+-----------+------------+-----------+-------------+-=
--------+-----------+
> > + |               |           |            |           |             | =
   Y    |     Y     |
> > + +---------------+-----------+------------+-----------+-------------+-=
--------+-----------+
> > + | Supports extensible VM measurement architecture for DRTM and attest=
ation               |
> > + +---------------+-----------+------------+-----------+-------------+-=
--------+-----------+
> > + |               |           |            |           |             | =
   Y    |     Y     |
> > + +---------------+-----------+------------+-----------+-------------+-=
--------+-----------+
> > + | PCI passthrough configured at host boot                            =
                    |
> > + +---------------+-----------+------------+-----------+-------------+-=
--------+-----------+
> > + |               |           |            |           |             | =
   Y    |     Y     |
> > + +---------------+-----------+------------+-----------+-------------+-=
--------+-----------+
>
> I'm curious about this, I assume this is done using vPCI so that
> there's no hardware domain (and user-space device model) involved for
> PCI passthrough?

That would be an incorrect assumption. See below for why.

> I'm also not sure how you are going to handle things like SR-IOV
> devices. Right now SR-IOV capability is setup and initialized by the
> hardware domain, and the new virtual devices are notified to Xen once
> setup is done. Do you plan to move those bits into Xen, so that it can
> setup and initialize the SR-IOV capability?

While you could do it with the vPCI, as you point out this will not work
for SR-IOV. With hyperlaunch, these cases will require the use of a boot
domain, which is for all intents and purposes, a lightweight/restricted
toolstack domain.

The boot domain will have to do the necessary operations to ensure that
when startup is finished, PCI passthrough will be successfully setup.
Note, this may have to include the boot domain unpausing the hardware
domain to help complete the setup before the boot domain can exit and
allow the remaining domains to come online.

Both of these cases are in scope for our customer funding the work,
so we will be giving these use cases extra scrutiny, though it is
not like we intend to leave anything that works today unusable.

thanks

Christopher

>
> Thanks, Roger.

