Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CknC49c6mksygIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 19:53:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB31455C7B
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 19:53:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1292523.1570950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFyDs-0002ad-Nz; Thu, 23 Apr 2026 17:52:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292523.1570950; Thu, 23 Apr 2026 17:52:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFyDs-0002YE-LJ; Thu, 23 Apr 2026 17:52:20 +0000
Received: by outflank-mailman (input) for mailman id 1292523;
 Thu, 23 Apr 2026 17:52:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbb7885c7000f373@swg.vates.tech>)
 id 1wFyDq-0002Y8-1J
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 17:52:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFyDn-0026Y1-SU
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 19:52:17 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbb7885c7000f373@swg.vates.tech>)
 id 69ea5c1f-5cb7-0a2a0a5109dd-0a2a4504c55c-36
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 19:52:16 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbb7885c7000f373@swg.vates.tech>)
 id 69ea5c4f-1dec-0a2a45040019-b9ff1c22b0b3-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 19:52:16 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dbb7885c7000f373.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 23 Apr 2026 17:52:11 +0000
Received: from [192.168.1.200] (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr
 [90.48.233.120]) (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5D9BC86AED;
 Thu, 23 Apr 2026 19:52:10 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=svyh7iABzxNWCIFS+Y8B4puT50eckbDbd1zj5xN4dF4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=LwB4qYqTBBllwaefrBVZqywImaNvR1duENNhbyE8McNl1gsBG3CUCU061ClChwBf3d0IqQcAh
 u4AWR6waK2fN5ACx/ArOFfxKqsm+WP5TCrdMHqA3Rdlac2DFBrf8nTKdvlyCvZSQ0KlFf34GZCF
 5mOd1E9Thr3VotCH/VkHXnprHZ/0qPDzgcf10ZoIKokumiIzjtv5TTqFWNpdoz5t2vxdsSbCbcK
 +kUAHvLlDfuCkvSblLltUSSGNa/odRBrXjZuHITT8LPwvN+MGOAvyj3z0Jtn4PEf+mSg4aEeOkp
 Cu+Kukrga1YYDStxk/Q0Uo5Wyv+KHG5nvPiPDhLFjvPA==
X-Zone-Loop: 32f2c00c9b7d3cf44e56917fcd66f2df1a35843bb680
x-campaign-type: default
x-transaction-id: bf7e314c-f043-4937-a57c-e22cac454199
x-swg-uid: 01-2e9171f1-d310-4d4e-abe9-06a1025971dc
X-Mailer: Sweego
Message-ID:
 <1776966731.8631fc262581453bbf619ec5b2062170.19dbb7885c7000f373@vates.tech>
x-swg-bid: 1776966731.8631fc262581453bbf619ec5b2062170.19dbb7885c7000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 23 Apr 2026 19:52:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 0/6] xl: Allow PCI devices to be passthrough'd via
 Qemu command line
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <1776955586.8631fc262581453bbf619ec5b2062170.19dbace7684000f373@vates.tech>
 <317cac0b-854f-433b-8242-d498cdba6d63@gmail.com>
Content-Language: en-US
From: Thierry Escande <thierry.escande@vates.tech>
In-Reply-To: <317cac0b-854f-433b-8242-d498cdba6d63@gmail.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.27a4.39131a8643359abe.19dbb788311.650115a9ec2631f4=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776966730513
X-purgate-ID: tlsNG-ebf023/1776966736-4B3673FF-38DAFA4B/0/0
X-purgate-type: clean
X-purgate-size: 4499
X-Spamd-Result: default: False [2.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	URI_COUNT_ODD(1.00)[3];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:berrange@redhat.com,m:marmarek@invisiblethingslab.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:mid,vates.tech:email,vates.tech:dkim,vates.tech:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,changelog.md:url];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_MUA_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4DB31455C7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.27a4.39131a8643359abe.19dbb788311.650115a9ec2631f4=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 4/23/26 17:20, Oleksii Kurochko wrote:
>=20
> On 4/23/26 4:46 PM, Thierry Escande wrote:
>> This series adds new 'hotplug' option for PCI device passthrough=2E
>>
>> The current mechanism for device passthrough uses QMP device_add comman=
d
>> to hot-plug PCI devices to the guest Qemu instance=2E This is an issue =
for
>> guests running on Q35 chipset (preliminary support posted at [1])
>> since the
>> Q35 PCI root bus does not support hotplug=2E Devices could be hotplugge=
d to
>> a secondary PCI bus but Xen only support 1 PCI bus for now=2E
>>
>> The 'hotplug' option allows to control how devices are attached to the
>> guest, either by using the legacy QMP mechanism (this is the default)
>> or by
>> passing them directly to the Qemu command line using xen-pci-passthroug=
h
>> device=2E
>>
>> Example usage in cfg file:
>> =C2=A0 pci =3D [ "00:03=2E0,seize=3D1,hotplug=3D0" ]
>>
>> Since Qemu -device option accepts parameters in json format, this
>> patchset adds a new internal function
>> libxl__device_pci_get_qapi_json() that
>> generates the device json object used for both QMP hotplug and command
>> line
>> passing=2E
>>
>> Also, to handle the assignable PCI device list, the function
>> libxl_pci_assignable() is renamed as libxl_device_pci_assignable() and =
is
>> made available from libxl=2Eh for access in libxl_dm=2Ec=2E 2 other
>> functions are
>> also exported internally: libxl__pciback_dev_is_assigned() and
>> libxl__device_pci_assignable_add()=2E
>>
>> This has been successfully tested on Xen 4=2E22-dev and Qemu 10=2E0 run=
ning
>> Debian VMs in both Bios and UEFI mode with a passthrough'd nvme disk=2E
>> Disabling the hotplug mechanism might be made mandatory for Q35 machine=
s
>> later, once Q35 support is merged upstream=2E
>>
>> [1] https://lore=2Ekernel=2Eorg/xen-devel/20260313163455=2E790692-1-
>> thierry=2Eescande@vates=2Etech/
>>
>> Changes in v2:
>> =C2=A0 - Add support for YAJL json parser
>>
>> Changes in v3:
>> =C2=A0 - Move code block of device command line parameters creation
>> =C2=A0 - Better handling of pci device assignation
>>
>> Changes in v4:
>> =C2=A0 - Split the refactoring parts of the 2nd patch
>> =C2=A0 - Extend libxl__json_object_to_json() and use it to generate the
>> qapi json
>> =C2=A0=C2=A0=C2=A0 string
>>
>> Thierry Escande (6):
>> =C2=A0=C2=A0 xl: Add an hotplug option for PCI device passthrough
>> =C2=A0=C2=A0 libxl: Refactor some PCI device handling functions
>> =C2=A0=C2=A0 libxl: Add libxl__device_pci_get_qapi_json() internal API
>> =C2=A0=C2=A0 libxl: Extend libxl__json_object_to_json() prototype
>> =C2=A0=C2=A0 libxl: Allow PCI device passthrough using -device Qemu com=
mand line
>> =C2=A0=C2=A0 docs: provide description for pci hotplug option
>>
>> =C2=A0 docs/man/xl-pci-configuration=2E5=2Epod | 17 +++++++++
>> =C2=A0 docs/man/xl=2Ecfg=2E5=2Epod=2Ein=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++
>> =C2=A0 tools/include/libxl=2Eh=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 tools/libs/light/libxl_dm=2Ec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 33 +++++++++++++++++
>> =C2=A0 tools/libs/light/libxl_internal=2Eh=C2=A0=C2=A0 | 12 +++++-
>> =C2=A0 tools/libs/light/libxl_json=2Ec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 11 +++++-
>> =C2=A0 tools/libs/light/libxl_pci=2Ec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 57 ++++++++++++++++++++---------
>> =C2=A0 tools/libs/light/libxl_types=2Eidl=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 tools/libs/util/libxlu_pci=2Ec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +
>> =C2=A0 tools/xl/xl_parse=2Ec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +++
>> =C2=A0 10 files changed, 123 insertions(+), 22 deletions(-)
>>
>=20
> I think we also want to add an item to CHANGELOG=2Emd that it is possibl=
e
> to passthrough PCI device via QEMU command line=2E

Sure, will do=2E

Thanks,
Thierry

> Thanks=2E
>=20
> ~ Oleksii



-- 
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.27a4.39131a8643359abe.19dbb788311.650115a9ec2631f4=---

