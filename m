Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 76swBnVtT2oxggIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 11:44:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E9372F14C
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 11:44:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=EhMjxiSH;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357763.1612106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlIh-0004np-0K; Thu, 09 Jul 2026 09:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357763.1612106; Thu, 09 Jul 2026 09:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlIg-0004m6-TG; Thu, 09 Jul 2026 09:44:10 +0000
Received: by outflank-mailman (input) for mailman id 1357763;
 Thu, 09 Jul 2026 09:44:09 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1whlIf-0004ll-82
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 09:44:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whlIe-002Gah-77
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 11:44:08 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a4f6d61-5cb7-0a2a0a5109dd-0a2a4507cdd4-18
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 11:44:08 +0200
Received: from [40.107.162.85]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a4f6d67-9c8e-0a2a45070019-286ba255240f-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 11:44:08 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by DB5PR03MB10050.eurprd03.prod.outlook.com (2603:10a6:10:48b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 9 Jul 2026
 09:44:05 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 09:44:05 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q8iJy2DJ8fnE3XhYZAPPm7TCEQiQhkbv66m39nURi60tWchybQu8GcHhODvmdmal5mt+VYYItLjll4ZxY0opt6Xx2eWezqbmql+/mWAP/7vOjVgsGzdq+bKktIGitwhRLU5JtGL4fjWpJ3LVe3rERacCL0+b92II1myTp/3BnTAlP1VrNhgnMxEJdTJKzw/v1BiNrHuNapAJSNsyBxEBlUME/MOi303QDexQrjtdkEkP9JLT1FS0yZicp/9XPMwrxT/7vxfpNyq+P9c/3tm6MUNrbdpeDlLM8gLfVFsv3IyS5N5Thac7R2/mkM4EgGnyPSZkscnRegbU56Gfwvk55A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrDKhGbtoiB7h2F4T4KrnW2M6c8Fox/+Ij5itpX9U/0=;
 b=C4pMh1vNlynn0Dhltpq/lm9Ptew4OpsfMpqh7KiLeDm16U4YMzqy0EU+HRajhRMA5f2p99XRTWloS4tCyRsL/DbJ21g1l5KFAANOcYwJw49gKPO4pYVFml6kXAAuyoUpTqCZFdZDOQ8/tg07f8KUm0g9Ejlu733T6z2S3QoR5SlLgRPaZr17FJZFVXYWczi0aVt+F4vqnU2xqB5DcGetvpe8ay94b8M71uE99TXTnq+OQOsCXLqNx+fUkdxtgF8kwG97nSKJNEJ/rmvImICilml+E6irkAJ9pStWfGIsjwlEj/GUn4HwyEehw1RCF2vEGTHzCaWtOWBfPVSrGbXurA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrDKhGbtoiB7h2F4T4KrnW2M6c8Fox/+Ij5itpX9U/0=;
 b=EhMjxiSHhaS92EmvOh8XqptfatzDZJGdpz91fS4YQt87hmzNuA88MgR2z8W3mT8uXV850cfvMrz8cmEnsM4p/7jejuBXj1AkGeF/N41V+KL1IVFkknngkzQlFj2wBcvmR3SEdyWeEnZBWtXVTba5bIDFuYOxKecLXjDZ69dd4eTt6kyIZ/OwvSuw3LWQNT/ZXoD5ukT0Lm2MOy27Qx1iTjqP8iEFaZujM/NWplxZnp/m4oyo1S8PQKkyn0aw6C2V2IRjNFNrVzyG13HghTqnuopODggTS2MOEj2IhL3gq2N7XeYgl8cKVvBX137+cRs0JnUHPenPHTkqd7a8NFU7IA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH for-4.22 v3] dom0less: Prevent division by zero in
 handle_passthrough_prop()
Thread-Topic: [PATCH for-4.22 v3] dom0less: Prevent division by zero in
 handle_passthrough_prop()
Thread-Index: AQHdD4d7qU530mHLc0yhuTdjB7BCxQ==
Date: Thu, 9 Jul 2026 09:44:05 +0000
Message-ID:
 <500cc80a172570f7fdde3287185398dc49460b2b.1783590032.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|DB5PR03MB10050:EE_
x-ms-office365-filtering-correlation-id: 75b665a2-c835-4c91-4379-08dedd9e9d99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|42112799006|366016|3023799007|56012099006|11063799006|38070700021|18002099003;
x-microsoft-antispam-message-info:
 5dJXDJ1oyYtStfzPXTsaVenF3nWR29pdJ6QmD6X5MkdsssuvirEJXD7qozdZUnqAodNnwSYeVhU20Ue1T/gExgk+SomNLhULNu2tkAjDaDnDgUcwKxOlEmA8QPugVtQVRRNJGBwW1SBXNQPYjfsv9bpk24lNhHCPdDDyGr4e2lfGbqiRd/MgeeAZicxxD1RjB6E5/I7n3eLgnmPsT4BUzFvXxpF6oMsd9cX5dEzAV/zGI48vqOakjtqqx1n98hZ5R3ajtzqrT2FSzVbE0Uk/wqLxmMcCvk1RKeXTkTspEi6by0/IytKQgfroD04ZCLOYc1KWztDP7pGONpWZGosC3hEnzGh695rMLXIJo/rvY0uvJFyMTne4GWIwyuMyDQOmIo60F8+Tt4pg/56fMGvhrnCLZQsKDTGMh5Fl2oMZTBAnI/w7MpMg09rfsjqlZjclFwKsIYiWjSII04eFGu9hdig0wt/ndfPmH8lbTO4O+7vb4TtOxpVK82QOQ9vJeQNCzuW8/OZKjpPCxTpl0cDZQeWZ+qXirQq+7b8PpBjL8U3MJFwI3N9qRm+F0Za5eIdGCV0/gOghV5qy5PxLRk9sVho9YBDwuwDPazQ8/ohNSeQWfcnZl/LAKcXcrPjbCYo3TksgmDDqTykdxTULiJntNM0Hed2dPMz8TQJFrzG9o/TT7XhCxt4spIdL2X56ZWbMSH5uaH9VxB6hIkcL3uZ+/+E1gwq200olz5JYwGU6whI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(42112799006)(366016)(3023799007)(56012099006)(11063799006)(38070700021)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?oWyZijchk7J94AgX8KjZkZViy8IcDTVJ1OZSAHXb9ndBqO0GmrHSvUNafc?=
 =?iso-8859-1?Q?RaFmz9Rs/CPa2YBJbwQEV1ttXhrQCaRTtQZNB6UG9mDHR2FHrOQX62/ijV?=
 =?iso-8859-1?Q?XaYffgpecE5oAZKFtJIHvlvrZRICYrsl1vS+8twlbfSPUViPTxFrlNBnOG?=
 =?iso-8859-1?Q?m9TfvURXUlXxDupeN6Z7Ja9DV0xkhn3i9nT5+SkhLJpB/AdLPZjHy5lnKX?=
 =?iso-8859-1?Q?fV4G96qDn1UchRW2m5GuuPDXMeECcGQSL8Vjx80HW54BQwOj/coa3Wae9z?=
 =?iso-8859-1?Q?8rXylnuWF1snWopV+vk3Fmc+RmTSqYIKjfMISkgIruHwxZZlprBfOxLOsr?=
 =?iso-8859-1?Q?t7KW3a2DnUtCjl5QjeLP91gnd+4z6PLOD7gOwPjcEWGxq6fziDtVJh/Z4a?=
 =?iso-8859-1?Q?FvINt0hZaEk5Ka83kPb61JpLc1fODZ4RpCQcUpYjXiPSQZ2rZpqM3sx3A0?=
 =?iso-8859-1?Q?HY9K6Pda+w6SulSzLbyqtMKlZ5eiTPi4d3SR0TnHLgb4DT8+lxhf6YEeHx?=
 =?iso-8859-1?Q?nUgaqP8Vr230uGOjQ5ZMtOdmlDXqx2N/g6Kag9MqLlktVX7zRMdlDuMSoW?=
 =?iso-8859-1?Q?ZE18HliFrPV9+eXwCBSmsXQ0p0N1mkPVS0W9CyVKmL5IFkAxdUKD7LHQcy?=
 =?iso-8859-1?Q?vy794yYnwRgPwTTf5Ly9qE+tERZM+beAYGpB4ywG5jAQ6idl8bwa5xv6wH?=
 =?iso-8859-1?Q?35b4OJEsOc4sTRdZe/JJOp4ukj0wxsOPpjM+t2rSodEtixbLEfJ9JwfScS?=
 =?iso-8859-1?Q?cW110nI8oUbgZI03ywJAHRQYmZwYD8TP5Ati7ZHyN8KVsPOAwnuV/F0pqD?=
 =?iso-8859-1?Q?gtyeng1zzhjCXp2zH5QXmiNEKDsW9smE7EKycBM4ktrvtu5MNbiotN3vOJ?=
 =?iso-8859-1?Q?rcw251y4Rukn8t4RlyR6Jc3FJf7vnRU0892AqCiSApZekKwAQHKKq5qCog?=
 =?iso-8859-1?Q?MEj371DZpCvpikmqioLGRrZSWZAT7WjvwXwAbI9d4Vg4t6qfP75Nk5FMI4?=
 =?iso-8859-1?Q?GyvEMUKMPfDOl7QgUSe8cPMEvzkX9bW6cChRYACabwZIt/f8vtXbLk0R3f?=
 =?iso-8859-1?Q?8u006wi0u8QCz5svdzZVcgM17fjf6QuyjiiSBDkocvqMmOlAu2/+7ss5Yj?=
 =?iso-8859-1?Q?acGq6iuOSLhHna+MGdjBlMNkJyrQkB2S6wvjsBZJUei6cuZa2vWZuw0RSN?=
 =?iso-8859-1?Q?a0ovdpOl8viZlZf4gA2Tlz39QJVH7hhumkFMsbTZOW8GyCoGEXh9P8SiMa?=
 =?iso-8859-1?Q?bDBIP1xZTPNBTv9V2z0XnXF+wOyMfodPIkqZHJxuX9xiIPlp5PPR1Te4N/?=
 =?iso-8859-1?Q?XWKg3oMIhExAZYiDADCng4idbQd4cNlE2K7nMJCWJPVxnZZeAqK7K5ZXuy?=
 =?iso-8859-1?Q?fF+k2IkNM7C0mY4ThaIe/hV+3O1b1JGvrlXNoErce8XjEl5NDGyQVLVWTJ?=
 =?iso-8859-1?Q?Lz1+wRWoizsCKrMoIikG1seW3jCNaTAv6luDTMe6zrB1CUqxxEPm/JaESS?=
 =?iso-8859-1?Q?i6PzxUycprZFf6rD26OS6SPddo8yrD8KzPKROn2QMFRVvUXKTPYDuUe2fJ?=
 =?iso-8859-1?Q?0PtEq1E6wWCmin/m2B/Ty8a+hsbdTMfTomsO9Kie4RaaOMZFaeDlnV8uqn?=
 =?iso-8859-1?Q?7/urap6oAUtnF/2D+7C0jKebC8WPfqdWz1EusXSBZT07KnWrNHh9eppSsn?=
 =?iso-8859-1?Q?PahehqdxUCjwGHqBR02NrSzxL4QZXIh6GtelxYzBSl6zsojA6o9MW7BmfE?=
 =?iso-8859-1?Q?npmacl1f0m0yRWgNsx56N0+5sSFzkkQK7h95/mJevTvlheRHzroieZesvM?=
 =?iso-8859-1?Q?IuQGazXMR7/2/E/B53cx5mcMLGfDtDg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b665a2-c835-4c91-4379-08dedd9e9d99
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 09:44:05.1513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tMJibz6eFyvzod4hDox5RGm6Cs2U45jygsM4uxW8ul9lO5qyaWr64SfuKEK+4BzWsiJkwMpxfHFgRXqPo3s13Xsdc7uIfFCjdv1Z9t4rBu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR03MB10050
X-purgate-ID: tlsNG-ef75cf/1783590248-FC11625E-7C13CCE9/0/0
X-purgate-type: clean
X-purgate-size: 1981
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:from_mime,epam.com:email,epam.com:mid,epam.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71E9372F14C

A malformed partial DTB specifying both '#address-cells =3D <0>' and
'#size-cells =3D <0>' causes '(address_cells * 2 + size_cells)' to
evaluate to 0. This sum is subsequently used as a divisor when
calculating the number of regions in the 'xen,reg' property inside
handle_passthrough_prop():

    len =3D fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) =
*
                                        sizeof(uint32_t));

This leads to a division by zero exception in the Xen hypervisor during
boot, causing a hypervisor panic/crash.

Fix this by validating that both 'address_cells' and 'size_cells'
are within the valid range of [1, 2] at the read side in scan_pfdt_node()
immediately after they are parsed. Any invalid cell size combination is
safely rejected early with an error message and return -EINVAL.

Fixes: 9ce974c47588 ("xen/arm: assign devices to boot domains")
Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes in v3:
 - use Michal's idea for placing that check into other place
 - reword commit message
---
 xen/common/device-tree/dom0less-build.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tr=
ee/dom0less-build.c
index eacfd93087..179a2b88aa 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -341,6 +341,13 @@ static int __init scan_pfdt_node(struct kernel_info *k=
info, const void *pfdt,
     size_cells =3D device_tree_get_u32(pfdt, nodeoff, "#size-cells",
                                      DT_ROOT_NODE_SIZE_CELLS_DEFAULT);
=20
+    if ( address_cells < 1 || address_cells > 2 ||
+         size_cells < 1 || size_cells > 2 )
+    {
+        dprintk(XENLOG_ERR "Invalid address/size cells combination\n");
+        return -EINVAL;
+    }
+
     node_next =3D fdt_first_subnode(pfdt, nodeoff);
     while ( node_next > 0 )
     {
--=20
2.43.0

