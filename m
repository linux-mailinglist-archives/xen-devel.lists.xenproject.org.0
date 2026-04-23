Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKNkGucw6mkCwwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 16:47:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE95453DA1
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 16:47:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1292188.1570717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFvK4-0003By-Hz; Thu, 23 Apr 2026 14:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292188.1570717; Thu, 23 Apr 2026 14:46:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFvK4-0003A1-FF; Thu, 23 Apr 2026 14:46:32 +0000
Received: by outflank-mailman (input) for mailman id 1292188;
 Thu, 23 Apr 2026 14:46:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbace7684000f373@swg.vates.tech>)
 id 1wFvK2-00039v-Nx
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 14:46:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFvK2-00BDbY-0G
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 16:46:30 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbace7684000f373@swg.vates.tech>)
 id 69ea30bd-bab6-0a2a0a5309dd-0a2a4502d716-28
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 16:46:29 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbace7684000f373@swg.vates.tech>)
 id 69ea30c5-af86-0a2a45020019-b9ff1c229b7f-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 16:46:29 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dbace7684000f373.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 23 Apr 2026 14:46:26 +0000
Received: from xps13-debian.gpn.vates.fr
 (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr [90.48.233.120])
 (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8E74B86015;
 Thu, 23 Apr 2026 16:46:25 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=lowfzwAIaXv7twmBRREDL/AXqU/wdqNpjErglxPSL1w=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=jay++uS1v9fLVAWBVAOzSJPHFlEjkw3LVHwEjVe9U3EfdH1KR5t9CAisfdsFodJpqgyq6c1D+
 Mjq/q6tQYwSaMfDES+oCj4BkZoLRGPVp2bHojKsq4MqJDhvhgEaPlMvbUW9eDvyE/IyVTd17bUX
 e4ko1+16CZFy8vh4AuREvdbJCMlCYge2VQmg2fe+nkaekf4wbBG3FpT4hn0e+F53rg5W0swXOPQ
 trJkxq20eQ4hVqLVwGbTWE/kgI1nq6BRoblBp+iCtP2X3fpfQA5gzFrUFaY3qPlah9Zh/IZGq5H
 5iRaTzkEIY/GU0oojCvbjOdzqaiEa3fb55OJlQozoUFg==
X-Zone-Loop: 5c73c3e7902362cf8a4029f853949f07dbff3d460e1a
x-campaign-type: default
x-transaction-id: 09e24afa-8bc8-4642-bf4c-eb19ce9ac08f
x-swg-uid: 01-ac788c85-1e37-464a-8870-3cc7c4ac7cce
X-Mailer: Sweego
Message-ID:
 <1776955586.8631fc262581453bbf619ec5b2062170.19dbace7684000f373@vates.tech>
x-swg-bid: 1776955586.8631fc262581453bbf619ec5b2062170.19dbace7684000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Thierry Escande <thierry.escande@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Thierry Escande <thierry.escande@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [RFC PATCH v4 0/6] xl: Allow PCI devices to be passthrough'd via Qemu command line
Date: Thu, 23 Apr 2026 16:46:10 +0200
MIME-Version: 1.0
Content-Transfert-Encoding: 8bit
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2738.9a73b4bc15a7d56d.19dbace74b2.a262829cedf10721=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776955585714
X-purgate-ID: tlsNG-720697/1776955589-81971161-4D35BBA0/0/0
X-purgate-type: clean
X-purgate-size: 3394
X-Spamd-Result: default: False [-0.18 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:thierry.escande@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:berrange@redhat.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7EE95453DA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.2738.9a73b4bc15a7d56d.19dbace74b2.a262829cedf10721=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This series adds new 'hotplug' option for PCI device passthrough=2E

The current mechanism for device passthrough uses QMP device_add command
to hot-plug PCI devices to the guest Qemu instance=2E This is an issue for
guests running on Q35 chipset (preliminary support posted at [1]) since th=
e
Q35 PCI root bus does not support hotplug=2E Devices could be hotplugged t=
o
a secondary PCI bus but Xen only support 1 PCI bus for now=2E

The 'hotplug' option allows to control how devices are attached to the
guest, either by using the legacy QMP mechanism (this is the default) or b=
y
passing them directly to the Qemu command line using xen-pci-passthrough
device=2E

Example usage in cfg file:
 pci =3D [ "00:03=2E0,seize=3D1,hotplug=3D0" ]

Since Qemu -device option accepts parameters in json format, this
patchset adds a new internal function libxl__device_pci_get_qapi_json() th=
at
generates the device json object used for both QMP hotplug and command lin=
e
passing=2E

Also, to handle the assignable PCI device list, the function
libxl_pci_assignable() is renamed as libxl_device_pci_assignable() and is
made available from libxl=2Eh for access in libxl_dm=2Ec=2E 2 other functi=
ons are
also exported internally: libxl__pciback_dev_is_assigned() and
libxl__device_pci_assignable_add()=2E

This has been successfully tested on Xen 4=2E22-dev and Qemu 10=2E0 runnin=
g
Debian VMs in both Bios and UEFI mode with a passthrough'd nvme disk=2E
Disabling the hotplug mechanism might be made mandatory for Q35 machines
later, once Q35 support is merged upstream=2E

[1] https://lore=2Ekernel=2Eorg/xen-devel/20260313163455=2E790692-1-thierr=
y=2Eescande@vates=2Etech/

Changes in v2:
 - Add support for YAJL json parser

Changes in v3:
 - Move code block of device command line parameters creation
 - Better handling of pci device assignation

Changes in v4:
 - Split the refactoring parts of the 2nd patch
 - Extend libxl__json_object_to_json() and use it to generate the qapi jso=
n
   string

Thierry Escande (6):
  xl: Add an hotplug option for PCI device passthrough
  libxl: Refactor some PCI device handling functions
  libxl: Add libxl__device_pci_get_qapi_json() internal API
  libxl: Extend libxl__json_object_to_json() prototype
  libxl: Allow PCI device passthrough using -device Qemu command line
  docs: provide description for pci hotplug option

 docs/man/xl-pci-configuration=2E5=2Epod | 17 +++++++++
 docs/man/xl=2Ecfg=2E5=2Epod=2Ein            |  6 +++
 tools/include/libxl=2Eh               |  1 +
 tools/libs/light/libxl_dm=2Ec         | 33 +++++++++++++++++
 tools/libs/light/libxl_internal=2Eh   | 12 +++++-
 tools/libs/light/libxl_json=2Ec       | 11 +++++-
 tools/libs/light/libxl_pci=2Ec        | 57 ++++++++++++++++++++---------
 tools/libs/light/libxl_types=2Eidl    |  1 +
 tools/libs/util/libxlu_pci=2Ec        |  2 +
 tools/xl/xl_parse=2Ec                 |  5 +++
 10 files changed, 123 insertions(+), 22 deletions(-)

--=20
2=2E53=2E0



-- 
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.2738.9a73b4bc15a7d56d.19dbace74b2.a262829cedf10721=---

