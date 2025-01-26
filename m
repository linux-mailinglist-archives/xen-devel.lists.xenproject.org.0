Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7659A1C5F1
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jan 2025 01:25:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877126.1287302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbqRy-0001R4-VH; Sun, 26 Jan 2025 00:24:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877126.1287302; Sun, 26 Jan 2025 00:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbqRy-0001Pf-SM; Sun, 26 Jan 2025 00:24:30 +0000
Received: by outflank-mailman (input) for mailman id 877126;
 Sun, 26 Jan 2025 00:24:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qu6a=US=bounce.vates.tech=bounce-md_30504962.679580b9.v1-4ae9820069564f3f88597e3d4791d2d6@srs-se1.protection.inumbo.net>)
 id 1tbqRy-0001PX-2C
 for xen-devel@lists.xenproject.org; Sun, 26 Jan 2025 00:24:30 +0000
Received: from mail180-4.suw31.mandrillapp.com
 (mail180-4.suw31.mandrillapp.com [198.2.180.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e67d0062-db7b-11ef-a0e5-8be0dac302b0;
 Sun, 26 Jan 2025 01:24:27 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-4.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4YgXNn62V4zlfq7b
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jan 2025 00:24:25 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4ae9820069564f3f88597e3d4791d2d6; Sun, 26 Jan 2025 00:24:25 +0000
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
X-Inumbo-ID: e67d0062-db7b-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1737851065; x=1738121065;
	bh=Fso/TxpSFQtDqap0uHljRirvoodY3kMgWJHR5PV+Qh4=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=OuVYEfthjELm6svqERMJs8FOaA/EnqgpF+V3cnrZbEHxwOOIukM6su0JRm/kW9cWE
	 YwyLg9BsMNU+GSMUpfcV2ZVUjw6iS8sunamWvFVfuCvWSOyeD38ZElqm6DYSPXqs4t
	 hxmdlNY3MckIIKKMSEUT3HPiWsmK1bGaoiqOK0dO+9NgJzl2C1dZgkd4L2Ufya0rq2
	 hFcRQ5QMlaXKPOZn+JVXBqKNgzaSR7Z/pTv4yrnXE8qL4c4qp2yHirh+aRJ4w+KQlA
	 wAIvNQVc8SUBlFXZqY7+5nVZDA8EVXnpvLMQr9lTvHWYrCvFAVXqZwR5eKXnEiO6wF
	 AoZQLhj2bCBrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1737851065; x=1738111565; i=teddy.astie@vates.tech;
	bh=Fso/TxpSFQtDqap0uHljRirvoodY3kMgWJHR5PV+Qh4=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=bPJl708d5gdza1MPwftgKD3Z1rf8oNZBlF72lcdnJ6gjn09989ww7IUkLN9NNpzJD
	 w2IJqokIZ7l1Zi0KZlywoKGCElb8tXt6R5i/LHQVPolTZlB0hkWOTb6uWfwkLi0xE3
	 AC26Cd6ykyT2no7mtlSD4dsaUUndHQJENUtN0qE49FE2Wlm7AWjN1lrPjUAsFxkccz
	 g3iqjj7OV75eIVd30/SwM7IziaJOAT4oScb1++1rjRh5e9mAnXqYZmpLa5O3XC/We4
	 wMIJZ3E7ITOiLITxA5/igRGvihmOwas3ZedVXX2q0UctT2npyolYoVKE8LcUdGikJB
	 Jq22H8/IgDUjw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20Serious=20AMD-Vi=20issue?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1737851063932
Message-Id: <79ebd460-8e05-4c54-a553-78149b1b751a@vates.tech>
To: "Elliott Mitchell" <ehem+xen@m5p.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <ZbLDlRi0vctlhsNp@mattapan.m5p.com> <Z5OkQgjd4Lt_rtr0@macbook.local> <Z5QFf5Ipk3GHd27H@mattapan.m5p.com>
In-Reply-To: <Z5QFf5Ipk3GHd27H@mattapan.m5p.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4ae9820069564f3f88597e3d4791d2d6?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250126:md
Date: Sun, 26 Jan 2025 00:24:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Elliott,

Le 24/01/2025 =C3=A0 22:31, Elliott Mitchell a =C3=A9crit=C2=A0:
> On Fri, Jan 24, 2025 at 03:31:30PM +0100, Roger Pau Monn=C3=A9 wrote:
>> On Thu, Jan 25, 2024 at 12:24:53PM -0800, Elliott Mitchell wrote:
>>> Apparently this was first noticed with 4.14, but more recently I've bee=
n
>>> able to reproduce the issue:
>>>
>>> https://bugs.debian.org/988477
>>>
>>> The original observation features MD-RAID1 using a pair of Samsung
>>> SATA-attached flash devices.  The main line shows up in `xl dmesg`:
>>>
>>> (XEN) AMD-Vi: IO_PAGE_FAULT: DDDD:bb:dd.f d0 addr ffffff???????000 flag=
s 0x8 I
>>
>> I think I've figured out the cause for those faults, and posted a fix
>> here:
>>
>> https://lore.kernel.org/xen-devel/20250124120112.56678-1-roger.pau@citri=
x.com/
>>
>> Fix is patch 5/5, but you likely want to take them all to avoid
>> context conflicts.
> 
> I haven't tested yet, but some analysis from looking at the series.

> 
> This seems a plausible explanation for the interrupt IOMMU messages.  As
> such I think there is a good chance the reported messages will disappear.
> 
> Nothing in here looks plausible for solving the real problem, that of
> RAID1 mirrors diverging (almost certainly getting zeroes during DMA, but
> there is a chance stale data is being read).
> 

The message is showing shows that something is going wrong, presumably a 
lost interrupt. This can lead to data loss, as it breaks the 
expectations of the Dom0's drivers.

If you still observe data loss after these patches, and these messages 
have disappeared, it may be due to something else, but these patches are 
not looking to hide the fault.

According to AMD-Vi specification, there appears to be a specific case 
where interrupt remapping faults are reported as IO_PAGE_FAULT (which 
appears to be what's happening).

IG bit (133) of DTE appears to provide an explanation (SupIOPF can set 
this behavior globally).

 > IG: ignore unmapped interrupts. 1=3DSuppress event logging for interrupt
 > messages causing IO_PAGE_FAULT events. 0=3Dcreation of event log entries
 > for IO_PAGE_FAULT events is controlled by SupIOPF in the interrupt
 > remapping table entry (see Section 2.2.5 [Interrupt Remapping
 > Tables]).

Note that Xen (and this patch doesn't change this behavior) does set 
this bit to 0, which means that faults are reported as IO_PAGE_FAULT events=
.

> Worse, since it removes the observed messages, the next person will
> almost certainly have severe data loss by the time they realize there is
> a problem.  Notably those messages lead me to Debian #988477, so I was
> able to take action before things got too bad.
> 
> 
> 
> I'm not absolutely certain this is a pure Xen bug.  There is a
> possibility the RAID1 driver is reusing DMA buffers in a fashion which
> violates the DMA interface.  Yet there is also a good chance Xen isn't
> implementing its layer properly either.
> 
> 
> 
> There is one pattern emerging at this point.  Samsung hardware is badly
> effected, other vendors are either uneffected or mildly effected.
> Notably the estimated age of the devices meant to be handed off to
> someone able to diagnose the issue is >10 years.  The uneffected
> Crucial/Micron SATA device *should* drastically outperform these, yet
> instead it is uneffected.  The Crucial/Micron NVMe is very mildly
> effected, yet should be more than an order of magnitude faster.
> 
> The simplest explanation is the flash controller on the Samsung devices
> is lower latency than the one used by Micron.
> 
> 
> Both present reproductions feature AMD processors and ASUS motherboards.
> I'm doubtful of this being an ASUS issue.  This seems more likely a case
> of people who use RAID with flash tending to go with a motherboard vendor
> who reliably support ECC on all their motherboards.
> 
> I don't know whether this is confined to AMD processors, or not.  The
> small number of reproductions suggests few people are doing RAID with
> flash storage.  In which case no one may have tried RAID1 with flash on
> Intel processors.  On Intel hardware the referenced message would be
> absent and people might think their problem was distinct from Debian
> #988477.
> 
> In fact what seems a likely reproduction on Intel hardware is the Intel
> sound card issue.  I notice that issue occurs when sound *starts*
> playing.  When a sound device starts, its buffers would be empty and the
> first DMA request would be turned around with minimal latency.  In such
> case this matches the Samsung SATA devices handling DMA with low
> latency.
> 
> 
>> Can you give it a try and see if it fixes the fault messages, plus
>> your issues with the disk devices?
> 
> Ick.  I was hoping to avoid reinstalling the known problematic devices
> and simply send them to someone better setup for analyzing x86 problems.
> 
> Looking at the series, it seems likely to remove the fault messages and
> turn this into silent data loss.  I doubt any AMD processors have an
> IOMMU, yet omit cmpxchg16b (older system lacked full IOMMU, yet did have
> cmpxchg16b, newer system has both).  Even guests have cmpxchg16b
> available.
> 
> If you really want this tested, it will be a while before the next
> potential downtime window.
> 
> Come to think of it, I wonder whether this might fix a particular device
> which was having an interrupt problem.  Problem there being it was being
> uncooperative with motherboard firmware...
> 
> 

As it seems to be a specific corner case, I would not be surprised that 
it only shows up in very specific hardware setups.

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


