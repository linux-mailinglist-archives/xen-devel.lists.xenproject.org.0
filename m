Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNlfJ3MR2WlClwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:04:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB88C3D8E42
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:04:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279247.1563755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBDOf-0003kX-UZ; Fri, 10 Apr 2026 15:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279247.1563755; Fri, 10 Apr 2026 15:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBDOf-0003i6-R7; Fri, 10 Apr 2026 15:03:49 +0000
Received: by outflank-mailman (input) for mailman id 1279247;
 Fri, 10 Apr 2026 15:03:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69d91151.v1-e76f9c812507451585636239d8b3ff11@bounce.vates.tech>)
 id 1wBDOe-0003i0-02
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 15:03:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBDOd-00EvpU-Br
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 17:03:47 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69d91151.v1-e76f9c812507451585636239d8b3ff11@bounce.vates.tech>)
 id 69d91146-5cb7-0a2a0a5109dd-0a2a4502aab2-36
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:03:47 +0200
Received: from [198.2.187.14] (helo=mail187-14.suw11.mandrillapp.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69d91151.v1-e76f9c812507451585636239d8b3ff11@bounce.vates.tech>)
 id 69d91152-42fa-0a2a45020019-c602bb0e169f-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:03:47 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-14.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fsg6n5hwMz8XS6mc
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 15:03:45 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e76f9c812507451585636239d8b3ff11; Fri, 10 Apr 2026 15:03:45 +0000
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
	s=mte1; t=1775833425; x=1776103425;
	bh=9OW/2hjgr5no2WPwd7Dtyhno1ODNPbzpH/8YCAXQ9Vk=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=s3lqZrO17OfxWadpOXgQ4gFi0VDvGEu+MUrgn9B8zRWkQKcQ2kD904g3qGpoladxe
	 xFlJRn8BT/f4VU7RLv8wj/+cnVRTPosN5bC5xXe2RwXaLGXQn/99JJ+VJDHeBnx8oH
	 rD5lUsapNbxTjXpy8XGjevA8wU9SILn6FJpw/qtO9YCDC0hVWdfaY+wgKkLNJ6STq5
	 AFLmE+rw8ZnqfzFSHwo4kLXwBDD++ohYsfl61Zq3KSImJoWiziaRdg3QX3TlEqoPXi
	 A6zYsxndfQoj49iNh04UMV29H5Np+xgF7QfOhgQ1ab3SHbjiHqdNiX4T+BfMXlImN8
	 CbvzAr5mLwNSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1775833425; x=1776093925; i=thierry.escande@vates.tech;
	bh=9OW/2hjgr5no2WPwd7Dtyhno1ODNPbzpH/8YCAXQ9Vk=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=1Nim0Iqpd25JmKGUpuarsrJJiWCzr0aGAti7V45jbykMUP6fQKi7CPcACfp6uxyYx
	 qvZseWXVi4yomQe4aJAVmi1u0SuycfPAxByqXuDUjZlV1mQDzU5MCp5rPzrK95ofdp
	 +ZLH4HESBbp1wM3W8BQ1n16CPbiWnmkHQZLvi/sJvymgOWeKP3TcYu42Uf0UvmFAtt
	 qi1kfIPhSGppd4Qh3mWwRIwARueUkp58THypAQCHKZ6VOajdm7HdlUeCFowF4GdDwR
	 PKYD5ZT9XH0MJ86E/pqVKjL/TFmyKYekIu34s89GXzWq1uTf3iWxek+Egyuok6JrIO
	 +gjwbmz9zX52w==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v3=200/3]=20xl:=20Allow=20PCI=20devices=20to=20be=20passthrough'd=20via=20Qemu=20command=20line?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1775833424967
To: xen-devel@lists.xenproject.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "=?utf-8?Q?Daniel=20P=20.=20Berrang=C3=A9?=" <berrange@redhat.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Message-Id: <20260410150333.1533568-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e76f9c812507451585636239d8b3ff11?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260410:md
Date: Fri, 10 Apr 2026 15:03:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1775833427-ADB3FCD1-BE51F373/0/0
X-purgate-type: clean
X-purgate-size: 2693
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
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
	NEURAL_HAM(-0.00)[-0.950];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EB88C3D8E42
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

Also, to handle the assignable PCI device list, the function
libxl_pci_assignable() is renamed as libxl_device_pci_assignable() and is
made available from libxl.h for access in libxl_dm.c. 2 other functions are
also exported internally: libxl__pciback_dev_is_assigned() and
libxl__device_pci_assignable_add().

This has been successfully tested on Xen 4.22-dev and Qemu 10.0 running
Debian VMs in both Bios and UEFI mode with a passthrough'd nvme disk.
Disabling the hotplug mechanism might be made mandatory for Q35 machines
later, once Q35 support is merged upstream.

[1] https://lore.kernel.org/xen-devel/20260313163455.790692-1-thierry.escande@vates.tech/

Changes in v2:
- Add support for YAJL json parser

Changes in v3:
- Move code block of device command line parameters creation
- Better handling of pci device assignation

Thierry Escande (3):
  xl: Add pci device hotplug option
  libxl: Allow PCI device passthrough using -device Qemu command line
  docs: provide description for pci hotplug option

 docs/man/xl-pci-configuration.5.pod | 17 ++++++
 docs/man/xl.cfg.5.pod.in            |  6 ++
 tools/include/libxl.h               |  1 +
 tools/libs/light/libxl_dm.c         | 85 +++++++++++++++++++++++++++++
 tools/libs/light/libxl_internal.h   |  7 +++
 tools/libs/light/libxl_pci.c        | 57 +++++++++++++------
 tools/libs/light/libxl_types.idl    |  1 +
 tools/libs/util/libxlu_pci.c        |  2 +
 tools/xl/xl_parse.c                 |  5 ++
 9 files changed, 163 insertions(+), 18 deletions(-)

-- 
2.53.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


