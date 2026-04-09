Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBaeIxLS12mrTAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 18:21:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3794B3CD997
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 18:21:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277968.1563021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAs7r-0006BW-5P; Thu, 09 Apr 2026 16:21:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277968.1563021; Thu, 09 Apr 2026 16:21:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAs7r-00068d-2O; Thu, 09 Apr 2026 16:21:03 +0000
Received: by outflank-mailman (input) for mailman id 1277968;
 Thu, 09 Apr 2026 16:21:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69d7d1e9.v1-f49911ee17314b0195681d17125076d7@bounce.vates.tech>)
 id 1wAs7o-00068X-TL
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 16:21:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAs7n-00BrtN-Ko
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 18:20:59 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69d7d1e9.v1-f49911ee17314b0195681d17125076d7@bounce.vates.tech>)
 id 69d7d1c8-e002-0a2a0a5209dd-0a2a450ca1ae-38
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 18:20:59 +0200
Received: from [198.2.187.14] (helo=mail187-14.suw11.mandrillapp.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69d7d1e9.v1-f49911ee17314b0195681d17125076d7@bounce.vates.tech>)
 id 69d7d1ea-f40c-0a2a450c0019-c602bb0ebbe0-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 18:20:59 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-14.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fs4tK5CfXz8XRsB5
 for <xen-devel@lists.xenproject.org>; Thu,  9 Apr 2026 16:20:57 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f49911ee17314b0195681d17125076d7; Thu, 09 Apr 2026 16:20:57 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="thierry.escande@vates.tech" header.h="From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1775751657; x=1776021657;
	bh=Qjx6OsI44qGGL/jcmYHV+NmV+OqiXfQQzBrw/BNMPf4=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=HofsryFQHdR+feHc5iaw9Zxa19cuNLhWrnJX31KeOiC0qXOV446YG5+Icjd0Po9dM
	 Z/wAvlqhyXmNtO7zE7ILdIivK7YbJKKNvSg6dYP5xYgekjCiaDGSDbYun6k/n7fYz2
	 +834G6QEA6oCRkh226IbtZhK5CAr0SLLgjbf5VngNMcgU3bGjArB5qKi22NKWu+Tc+
	 J10fWO46UQHmLx0690MbRYKBg9PVNmarJMq7A3CoWSfgp3rpsIJb5bK4umfgJCXncL
	 nfLR3om7+OU/xzyUuTyf1A+WcBFwwK0v2abj3oGOWQIijYWjE2UNr3PlmcQ5OJ9Fsc
	 OmODCgkk8Qw4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1775751657; x=1776012157; i=thierry.escande@vates.tech;
	bh=Qjx6OsI44qGGL/jcmYHV+NmV+OqiXfQQzBrw/BNMPf4=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=urnu/pF++2Gd1Ga/OhMH0WCTMQZLOHoFATGfVsEWDefu5LfPHY26HWdwwAkW2ZfTk
	 geYXYbXcUJcBZzFkZIBKpex/+UkNjTkOA3jlZTZG1X1lgTJbN/9RdvB3YRiEUjyavs
	 LHqwgkGTrlTyKuc+1uDBvFdqkcx+GtApGXOzSoDz2f7+nV3WXL227Blaex6dGB6gRQ
	 oY7p8vgebHaXDALmB79NDVQPpcF2WU7BoT9fxbcc0E7YOxd/z6pZwTRkK9U4QmTueP
	 Kjptqrd7eOgwrq+6WcEwqW42l/Dhe4DtMuLW6LImpOV1krbkxOncC5cBtqVk3XKCfl
	 p6nsnHA2T5wEQ==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v2=200/3]=20xl:=20Allow=20PCI=20devices=20to=20be=20passthrough'd=20via=20Qemu=20command=20line?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1775751656801
To: xen-devel@lists.xenproject.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "=?utf-8?Q?Daniel=20P=20.=20Berrang=C3=A9?=" <berrange@redhat.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Message-Id: <20260409162000.1102680-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f49911ee17314b0195681d17125076d7?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260409:md
Date: Thu, 09 Apr 2026 16:20:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1775751659-81756A3D-CD9AFF73/0/0
X-purgate-type: clean
X-purgate-size: 2517
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:thierry.escande@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:berrange@redhat.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	NEURAL_HAM(-0.00)[-0.940];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3794B3CD997
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds support for a new 'hotplug' option for PCI devices to be
passthrough'd to guests.

The current mechanism for device passthrough uses QMP device_add command
to hot-plug PCI devices to the guest Qemu instance. This is an issue for
guests running on Q35 chipset (preliminary support posted at [1]) since the
Q35 PCI root bus does not support hotplug. Devices could be hotplugged to
a secondary PCI bus but Xen only support 1 PCI bus for now.

The 'hotplug' option allows to control how devices are attached to the
guest, either by using the legacy QMP mechanism (this is the default) or by
passing it directly to the Qemu command line using xen-pci-passthrough
device.

Example usage in cfg file:
 pci = [ "00:03.0,seize=1,hotplug=0" ]

Since Qemu -device option accepts parameters in json format, this
patchset adds a new internal function libxl__device_pci_get_qmp_json() that
generates the device json object used for both QMP hotplug and command line
passing.
Also, the function libxl_pci_assignable() is made available from libxl.h
for access in libxl_dm.c. I don't know if it's ok to make it public or if
it should stay private. Maybe it should be renamed as
libxl_device_pci_assignable() to match the other PCI device APIs.

This has been successfully tested on Xen 4.22-dev and Qemu 10.0 running
Debian VMs in both Bios and UEFI mode with a passthrough'd nvme disk.
Disabling the hotplug mechanism might be made mandatory for Q35 machines
later, once Q35 support is merged upstream.

[1] https://lore.kernel.org/xen-devel/20260313163455.790692-1-thierry.escande@vates.tech/

Changes in v2:
- Add support for YAJL json parser

Thierry Escande (3):
  xl: Add pci device hotplug option
  libxl: Allow PCI device passthrough using -device Qemu command line
  docs: provide description for pci hotplug option

 docs/man/xl-pci-configuration.5.pod | 17 ++++++
 docs/man/xl.cfg.5.pod.in            |  6 +++
 tools/include/libxl.h               |  1 +
 tools/libs/light/libxl_dm.c         | 80 +++++++++++++++++++++++++++++
 tools/libs/light/libxl_internal.h   |  2 +
 tools/libs/light/libxl_pci.c        | 41 +++++++++++----
 tools/libs/light/libxl_types.idl    |  1 +
 tools/libs/util/libxlu_pci.c        |  2 +
 tools/xl/xl_parse.c                 |  5 ++
 9 files changed, 145 insertions(+), 10 deletions(-)

-- 
2.53.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


