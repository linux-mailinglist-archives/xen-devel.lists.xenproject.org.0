Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id l/P4DQXEwWlUWQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C500F2FE8D8
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259643.1553032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7L-0000OG-PZ; Mon, 23 Mar 2026 22:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259643.1553032; Mon, 23 Mar 2026 22:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7L-0000K8-Kn; Mon, 23 Mar 2026 22:51:27 +0000
Received: by outflank-mailman (input) for mailman id 1259643;
 Mon, 23 Mar 2026 22:51:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w4o7J-00087U-BU
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 22:51:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4o7I-00As5i-Nm
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 23:51:24 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69c1c39c-e002-0a2a0a5209dd-0a2a4508b60e-10
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 23:51:24 +0100
Received: from [52.101.70.122]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69c1c3ec-1950-0a2a45080019-3465467af2ba-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 23:51:24 +0100
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by AS8PR03MB7653.eurprd03.prod.outlook.com (2603:10a6:20b:34b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 22:51:23 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 22:51:23 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVgrz7wbISlrpebU/bCX+S9GstWY5hFMUHW5QOBDin4/tgInSpsPbe5iFs58PdcJIXfX136D8YOn12PA3qFgCjjDBtsdUfSjJvl4B/PIiIiX7kEKvTOOLik2tkNm8BPyBTkcbPovqm6lxi1Lg1HQdmO6OUZE9yHI4IriJXmMEPGdf646aA/lRRi6GGATbHqumKjn2IDsfHQqdaQk5QG6woUYR4QChx4fc5RKH0MzezzsQqKykBc5j8zYbZwQ5krUJnPxjQsAMS7Yx3dh18c6yGBVqp93+2NMWFPP7nk2mMEtEGySCFgNoQ8sFIWbEtRYRg67RDvLaNGVBUJsGGNnxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSkdc8Q1mbwBeVdo4Zby08ryEVkC3pfgX4ru+ElFWTU=;
 b=kzpyjRyOGnRaVgZ7f61hM7dJ8UamXLEdLEB8I04FFdXU1OX5cFL9vCKrWxz0DOzT/fx7PspIfiF9Lh3ttrrv+TgiEhO2Z0l0EmLDfa4khrCunR74HNc41onZLZpoOkaPL9l1fHCrFAZ6g29+2+F/vsn1RBX2KHm9se8pd5HuTqzC1tWFXcCbYKaI3CjdrE5Ff0D8OR3AoEsVGEHC+KqJ0YjTESWAb5iNLbnOJSLDxhUbREzMyLL6aNbcw1R5a/kwmovn8pOuIYd6458sK2RSOo0ZtLQd/onZgl8zuO9+b/u7nrDWOkQDLsTAZ0v7lJeajXg7AyFVxkUmqrdp8g7TLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSkdc8Q1mbwBeVdo4Zby08ryEVkC3pfgX4ru+ElFWTU=;
 b=LwDz0F4YvXZo8evBfE4wFI4aBaAyFx1JPum7Rt8I96hlcOPDkFD4aoBEdzMaDilI+eZ9zZkBPxilOprIC/+hXsZ2KT5ZRs/X0ux//FmP4Gl0F1Ibbg8KLTLUSMvTzNjJzjqViRgY0gyCDQ2F1DFzXNybtj+Xsedz6x/5agZJYWpgBPR39CDL3N23k1u5sE48Da4Emv6kMRMLOocIvIVuBlBpjMfNiIrEi68rt7hD28nwkXoDDErWs3u9hsFTtRTSF0reAKiwucJucL2lE3UxbgGKrTFwQ48bkBkQ1WsAVUTSla+MUu+QhKzX6jTGiejgnnJFFRtC21WB3UAZNtz5qw==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Nick Rosbrook <enr0n@ubuntu.com>, George Dunlap
	<gwd@xenproject.org>, Juergen Gross <jgross@suse.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH v2 06/23] xen/domctl: Add XEN_DOMCTL_CONFIG_VIOMMU_* and
 viommu config param
Thread-Topic: [PATCH v2 06/23] xen/domctl: Add XEN_DOMCTL_CONFIG_VIOMMU_* and
 viommu config param
Thread-Index: AQHcuxeSK6excSmuKEuyXATKeh0DbQ==
Date: Mon, 23 Mar 2026 22:51:23 +0000
Message-ID:
 <f04d9186eb3b83a4f5fb27db412bf10fb6fb092c.1774305918.git.milan_djokic@epam.com>
References: <cover.1774305918.git.milan_djokic@epam.com>
In-Reply-To: <cover.1774305918.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB5088:EE_|AS8PR03MB7653:EE_
x-ms-office365-filtering-correlation-id: 48d1e7f5-9e70-4e38-d1e3-08de892eb50d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 366dmPq2bCPDrVEGapTJoVx2VdXisEMP0FR5jdKbacLQuHEr58bQjlCGsBf4ce8frG8VdmIWxalBZ/b35e70sjs8YKqTeM9IYoNXkcph9HuC/vQ6vbqk29i/HxWwuKKoQFXmxIh4oOyfBJF1KGI58AXLWXPM6FkPIGMenGdh9WYA1tZ3XSXAjA1gXC/BhdV1BJO6r68Zr9WJPGKWOxQXgFyTFMAyscaE+IMNeR4TMK1dmQGwZU7mdTOMi1Gxyt+8Zye9s1Xmy269jfbZ4YBDWdUcgC3iDjJn2vhNZ7VHGDArUUq1hbKYqTcXtv+ozp6LP/yMWDNi72QPN9aqG+rxuJTiPYCnmrhnaikX81POLkZ4v13KcIIQXBY7fZDuylk9QgjR+E67jb0KxYvDPVHDOj+OPfJMQsrJXxK/XAbdQMKMA0cP7bkNRm+9PnpuLpIPWwqkUDfgtC/j0+BqXKx9/d60mzcwK4UvWZt7L1OgeTbNYprfPG0P+XCHVNSB8gwDEhh6J1v9n7OcnMYcenBilChhBmkOlFsI4KWZ/wqBpRf06W3jz9e8kgXqD3SXrdC0+dathXH4S4+ys3oHokRKkQT1mRDwc4m1FintbQtXqt+sCV9xW/ftufxMU+wFi9iQ833kk/pVUGHSNGSYJr2MLtm3muGsKg6an92CzugMUPg0HTzoZ01j4yHJxqekC6Nkid3ogEXfPsl4nd4BA0WpgJmjh6kJozs9LBeXVW9r67UtLmRrm67NtZPTsjtClKmh8QLkqlw1nPshMZARnvnTGGOPahFyXECLbaLcO9uxIZM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?dr5SxvQb/9UgKxOTdfiTjKkV3s8ENbSSVwArIbolR+GiaNLh8d+3WERYju?=
 =?iso-8859-1?Q?Sf4Q2263M1ifHZfsXX/2hJuDy6t63YzzPb5i84wJ6jC6HHPJmlYgOetYQm?=
 =?iso-8859-1?Q?46E5XtuCvQXtv1JQzzrimiN+WoYrwEB/N8qIapwqtkS9AinhsmEWIXLr2V?=
 =?iso-8859-1?Q?/j6kk+s9UBnJAXB3V3W65g8JK1UWRgZy+3Qs0+gcaQEV8SO1UGELrnG7RU?=
 =?iso-8859-1?Q?SMa1WQSkSi8FYACMjO+GbizTRRHF6thYUXXDu2gEnC6kZWWQNzOqX9NXoT?=
 =?iso-8859-1?Q?vj3Ci95VIEu8WqnSLDXcBLPbaQFXcw8HWisPJ6NRvT2YBcx7GpufTwGvqh?=
 =?iso-8859-1?Q?GgNhhP86Ap1MANZ1mVnDQfAnYOQqPpTKLGPPTKog7cp/SNKVcO3hICmYJ1?=
 =?iso-8859-1?Q?qp9TfXrl4PszTvB3ijLBn5zM3CMzXvk9O5pQqMFR+VAdDCl/zTn6ngFJkK?=
 =?iso-8859-1?Q?hmMrfGdljai/znLgfY7eV+Odus1ky3YnTlfflmb30alsEtBOC4/nlNmAyB?=
 =?iso-8859-1?Q?qODcfCSWBz6KsavXMeAl3lHMV+BtpbqHmm7CdFfxBC/tGTHxS6MFWxn8rE?=
 =?iso-8859-1?Q?kuNws98baSocW9YiNFJPF7v0FZdudNoJ3dxWyalD/CvUEIy2E+sifIG7V2?=
 =?iso-8859-1?Q?7V+xQV4g/+Jt9/tL35zV7WxUaoC8kgh2q/XPFYS9j9ayEI/H3Nyz0Zo0OJ?=
 =?iso-8859-1?Q?Pz/cRKm1XCPJ9gee1VFrVTBa8nV53B580E88BBEgTnHy4qxj9QE+Sh7R8Z?=
 =?iso-8859-1?Q?IMZaSms5jau3WsVmz44ePgxzTMEgkFMC1MbfyDBH9lLn2otpszt6Q7JgXp?=
 =?iso-8859-1?Q?jrPg0frSAh8B9ijwrnqNa43C1ufvnl5oVGzpUxoUBN7xcMczmtQlP2EeLA?=
 =?iso-8859-1?Q?U6Kqm8JC+GYXZvw8Dlk8aRZxyM5zOgFjYwjGwGIHJNdUrQCuR9BgVDvDW8?=
 =?iso-8859-1?Q?HYbBzodzd+tFmt/tjS7LJZE1izWWBqrG2igwknpSLJE5M5+2C5fwl4lrJA?=
 =?iso-8859-1?Q?HEBOLpS/1UvasKX01yhxFAa96UkQ/k7vgXWMO1tGnWj7tXADlqtk2yV5Cl?=
 =?iso-8859-1?Q?LJ+LpHAViAFxnjpYJ4AfqQOEfx35nRabP6j8Vw9qyKcXGwiiMkcT5rLEbK?=
 =?iso-8859-1?Q?3Lzp6WkKkDcQfMnnulRHWodGMbT9B1Q2STintdkBY7q8POUn8Wme0k/6zW?=
 =?iso-8859-1?Q?hLXht6ZZkz8BJflqddYqfYU8AGUXHquHMJfnIBljJAaYfEnVoC6w/zvDQ6?=
 =?iso-8859-1?Q?vQRefI5rZUFbGdNB84P3TbvhiG8rpY3VxXY9wt2xK6aXVXI/c9j7ytsfsu?=
 =?iso-8859-1?Q?1OBMQyHKwvBasO99Z1g59oe2pJaljWxjDp+6EvLwcWnGmPGcgj7y4eLq9v?=
 =?iso-8859-1?Q?EC+4v4a7yYGC2EdHfU4nPJSFkwlA43U8NZKH+6PnObZ7gRrZSkSsdFoF8c?=
 =?iso-8859-1?Q?kk8wUPj0XZbIUN5cfhUyYE4sTMsqpuvoffnJSqX6tPYgN6JrPlNJtnjrYG?=
 =?iso-8859-1?Q?9iLMAtBlUtNyP+IamX5nEkG8jgthUniF2YTQxBrPoryETslVKFiJUlXy3X?=
 =?iso-8859-1?Q?E6GkPwLRq70khg7ve6wwKuj9L6Wk24NQX/6rIV/2EBrT5QrXW1zzooXpxg?=
 =?iso-8859-1?Q?hAq3iA4qpj9JkLgi8wMhE4NXUHJix21rMOAKHgkHbXK4yqes4F6f5iORZp?=
 =?iso-8859-1?Q?LOVxUsTbysjSRlf8AK4MAeXW6t3WXdagFtSQvix+TGFJF6eWMk3gPW9TuW?=
 =?iso-8859-1?Q?1T4FGcnpi6/ybkUw2rae/XwvjdP/nhGmaT6MOS1ab2cmkTUXtTXb6/4tcO?=
 =?iso-8859-1?Q?f9WSpuGvTqNOh9HQJVZFUn+5vPFmxKI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48d1e7f5-9e70-4e38-d1e3-08de892eb50d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 22:51:23.2009
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3aiE0k0UTNmrGcV8CWod3uBnZJbqVD3A/2BVfS1hD5QJsV2dNWExPtlO6mDmMunXPUMmhwTVMw6+YmkhA77hLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7653
X-purgate-ID: tlsNG-c1860d/1774306284-EB096726-1C5C9DFA/0/0
X-purgate-type: clean
X-purgate-size: 5868
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:email,epam.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:anthony.perard@vates.tech,m:enr0n@ubuntu.com,m:gwd@xenproject.org,m:jgross@suse.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C500F2FE8D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

Add new viommu_type field and field values XEN_DOMCTL_CONFIG_VIOMMU_NONE
XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3 in xen_arch_domainconfig to
enable/disable vIOMMU support for domains.

Also add viommu=3D"N" parameter to xl domain configuration to enable the
vIOMMU for the domains. Currently, only the "smmuv3" type is supported
for ARM.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 docs/man/xl.cfg.5.pod.in             | 13 +++++++++++++
 tools/golang/xenlight/helpers.gen.go |  2 ++
 tools/golang/xenlight/types.gen.go   |  1 +
 tools/include/libxl.h                |  5 +++++
 tools/libs/light/libxl_arm.c         | 13 +++++++++++++
 tools/libs/light/libxl_types.idl     |  6 ++++++
 tools/xl/xl_parse.c                  |  9 +++++++++
 7 files changed, 49 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 27c455210b..f69cdee55c 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3162,6 +3162,19 @@ option.
=20
 =3Dback
=20
+=3Dover 4
+
+=3Ditem B<viommu=3D"N">
+
+To enable viommu, user must specify the following option in the VM
+config file:
+
+viommu =3D "smmuv3"
+
+Currently, only the "smmuv3" type is supported for ARM.
+
+=3Dback
+
 =3Dhead3 x86
=20
 =3Dover 4
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/h=
elpers.gen.go
index 8909fe8a1b..4f0997f02f 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1195,6 +1195,7 @@ x.ArchArm.NrSpis =3D uint32(xc.arch_arm.nr_spis)
 if err :=3D x.ArchArm.ArmSci.fromC(&xc.arch_arm.arm_sci);err !=3D nil {
 return fmt.Errorf("converting field ArchArm.ArmSci: %v", err)
 }
+x.ArchArm.Viommu =3D ViommuType(xc.arch_arm.viommu)
 if err :=3D x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err !=3D =
nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
@@ -1734,6 +1735,7 @@ xc.arch_arm.nr_spis =3D C.uint32_t(x.ArchArm.NrSpis)
 if err :=3D x.ArchArm.ArmSci.toC(&xc.arch_arm.arm_sci); err !=3D nil {
 return fmt.Errorf("converting field ArchArm.ArmSci: %v", err)
 }
+xc.arch_arm.viommu =3D C.libxl_viommu_type(x.ArchArm.Viommu)
 if err :=3D x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err !=3D n=
il {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/typ=
es.gen.go
index ab9d4ca7b4..8a37b52a82 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -610,6 +610,7 @@ Vuart VuartType
 SveVl SveType
 NrSpis uint32
 ArmSci ArmSci
+Viommu ViommuType
 }
 ArchX86 struct {
 MsrRelaxed Defbool
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index bc35e412da..f7d5c77e23 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -318,6 +318,11 @@
  */
 #define LIBXL_HAVE_BUILDINFO_ARCH_ARM_SCI 1
=20
+/*
+ * libxl_domain_build_info has the arch_arm.viommu_type field.
+ */
+#define LIBXL_HAVE_BUILDINFO_ARM_VIOMMU 1
+
 /*
  * LIBXL_HAVE_SOFT_RESET indicates that libxl supports performing
  * 'soft reset' for domains and there is 'soft_reset' shutdown reason
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 7e9f8a1bc3..a248793588 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -247,6 +247,19 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     }
     LOG(DEBUG, " - SCI type=3D%u", config->arch.arm_sci_type);
=20
+    switch (d_config->b_info.arch_arm.viommu_type) {
+    case LIBXL_VIOMMU_TYPE_NONE:
+        config->arch.viommu_type =3D XEN_DOMCTL_CONFIG_VIOMMU_NONE;
+        break;
+    case LIBXL_VIOMMU_TYPE_SMMUV3:
+        config->arch.viommu_type =3D XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3;
+        break;
+    default:
+        LOG(ERROR, "Unknown vIOMMU type %d",
+            d_config->b_info.arch_arm.viommu_type);
+        return ERROR_FAIL;
+    }
+
     return 0;
 }
=20
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_type=
s.idl
index d64a573ff3..c7ad0e77b2 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -561,6 +561,11 @@ libxl_arm_sci =3D Struct("arm_sci", [
     ("type", libxl_arm_sci_type),
     ])
=20
+libxl_viommu_type =3D Enumeration("viommu_type", [
+    (0, "none"),
+    (1, "smmuv3")
+    ], init_val =3D "LIBXL_VIOMMU_TYPE_NONE")
+
 libxl_rdm_reserve =3D Struct("rdm_reserve", [
     ("strategy",    libxl_rdm_reserve_strategy),
     ("policy",      libxl_rdm_reserve_policy),
@@ -736,6 +741,7 @@ libxl_domain_build_info =3D Struct("domain_build_info",=
[
                                ("sve_vl", libxl_sve_type),
                                ("nr_spis", uint32, {'init_val': 'LIBXL_NR_=
SPIS_DEFAULT'}),
                                ("arm_sci", libxl_arm_sci),
+                               ("viommu_type", libxl_viommu_type),
                               ])),
     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
                               ])),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 1a2ea8b5d5..dcae8314fe 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -3033,6 +3033,15 @@ skip_usbdev:
         }
     }
=20
+    if (!xlu_cfg_get_string (config, "viommu", &buf, 1)) {
+        e =3D libxl_viommu_type_from_string(buf, &b_info->arch_arm.viommu_=
type);
+        if (e) {
+            fprintf(stderr,
+                    "Unknown vIOMMU type \"%s\" specified\n", buf);
+            exit(-ERROR_FAIL);
+        }
+    }
+
     parse_vkb_list(config, d_config);
=20
     d_config->virtios =3D NULL;
--=20
2.43.0

