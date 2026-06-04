Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q5JgBXHWIWrGPQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 21:48:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F15764301A
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 21:48:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="l/im9feE";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1328461.1592932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVE1s-0005SL-ST; Thu, 04 Jun 2026 19:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328461.1592932; Thu, 04 Jun 2026 19:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVE1s-0005Pr-PS; Thu, 04 Jun 2026 19:47:00 +0000
Received: by outflank-mailman (input) for mailman id 1328461;
 Thu, 04 Jun 2026 19:46:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1wVE1q-0005Pl-DQ
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 19:46:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVE1p-007VnM-QP
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 21:46:57 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a21d623-2eae-0a2a0a5409dd-0a2a450a8e9a-8
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 21:46:57 +0200
Received: from [52.101.62.7]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a21d630-56b3-0a2a450a0019-34653e07ecda-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 21:46:57 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by DS1PR03MB7942.namprd03.prod.outlook.com (2603:10b6:8:222::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 19:46:51 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0092.007; Thu, 4 Jun 2026
 19:46:51 +0000
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
 b=YdyoZ7cDAe2aebr2LK3ayzoso6e9Yk8/yPzIfxWEEGRGUicraaOWAlNlMmHBqvNRHZydGQLdeIdg3jAznx7vsBUc2JgNUXjV9zsnuAOW5BEjlvGX1SMGHbsqBW+aA09RabaoLyXQz4eck2dy2WbNNJLz3PW2U2vykNtnZ2xtTawFjdvPAlJyk/EvQCzVvYbBJOpQT0dMruzrF/Ahb6u+JDojXz5o7ZQoLeGWq/MUQMC6YPObu2lWonkMog+UJSwpj2ZlmS56UOMI4MB7XjMtHxf+/QaY6t67EbQMPoAi1ZLso3dhkYv6Gq+8e/WVYlNH4L1W5dJ4YEXNZPUCpwcMKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58Rwls3Zbpy0A1Dlb1Ok3I/PGVzGJzrN/n2HeoWFT+0=;
 b=R1on5QuuA63MWQqG1azZ/T/mfQWbt0NcVcEmdgEUBbA4YK9G1YUUDfwMEBykUkKzgEUwDc9Mki+4CBG6a3vsTr3Yb6s8rJaRazZolbpjeVbiDdnkDOgaPlUgxpoBR7WsotVO/Hb3C2ihssXFJdylQAp2rNJNDiQWHc5jaPsaFyv0nGEZjfpmL98agQXq6PSiI+Rc6DkQ5FoNtO+zVcGgMxmoCPib6KYqXA4VfM/7FSyL8B44omoxVtnEIuDkQ9X9HPq9Xc4lkFA4LSksctGwo+AwUE/tnvQPZqDy0SS6PzTZq+BT5UcsEeA0lgUPEM4SP3bfJmqSd0Q2eKLUrpBN9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58Rwls3Zbpy0A1Dlb1Ok3I/PGVzGJzrN/n2HeoWFT+0=;
 b=l/im9feE4w1Dp7UOlQ/CSGJHTmbPuGs6fqaaQiFnW24f0ntxARfSdxcdiEvT1atIZKzisXriCAWgRY0T5zjvCYZj1j3v7pf298i7dkoDHrEOtC91tNnqMdM1h5KRmcsPaB27Lb5irmjQOF4cHxei2RFIBnT5BLc9T+eE5HV5aTo=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: Re: [PATCH 0/2] x86/kexec: Implement crash kexec for Secure Boot
Thread-Topic: [PATCH 0/2] x86/kexec: Implement crash kexec for Secure Boot
Thread-Index: AQHc8q+VtM9vdfdFGkSSgX8o+ahXxbYtEQcAgAG9z6k=
Date: Thu, 4 Jun 2026 19:46:51 +0000
Message-ID:
 <BY1PR03MB799686D01FC998376FDB3B9FF3102@BY1PR03MB7996.namprd03.prod.outlook.com>
References: <20260602164911.2684471-1-kevin.lampis@citrix.com>
 <0ec4527f-ca97-477c-94ef-81f430e1e98c@citrix.com>
In-Reply-To: <0ec4527f-ca97-477c-94ef-81f430e1e98c@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY1PR03MB7996:EE_|DS1PR03MB7942:EE_
x-ms-office365-filtering-correlation-id: 0879fe1d-d0ba-4204-84ce-08dec272061e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|18002099003|4143699003|56012099006|11063799006;
x-microsoft-antispam-message-info:
 S2s4SiDL4IT4I/asuVRJaWSp/9X0CXSqvXtmRd+WSi9iylJrMu1NiwTeGPNtS2lfCvOzX4CS4ydTvC1ANZw/xe/ty+cd9EoNklv7+xxQoP1QrrDG0ajQgqEZZ01aqzotgIP/Mwu6E9KgEdI6onIEAMwFoFS1UIiaGlaCoaBq08WeyJV+AdaaOg8+r5S7ScHpTJwyQrsjhrmRwpucAhy8RmVvSJ2l8GRMHJuzN1Fl+Nbz930FXYcGhOYR6QMyzNrXK8l3zVEgh6L4RWRq2KDWoTj6vTusoERteq/jRkAgzfbCd2el2P++9p4oH6hmqn9Q4/FBwopCLwYCRvIjxdANmgIZ6+4OrbyP0txvjQlaQ5NwaQQGAxEDo2bVBjoZCTA10Hj60STyjpUMnLGhfMQjHBKnjG7CmrTgthogq8ytGgAlukg4I8v2osjsaYTbTLIK+V27X0L681xF5cfJXUFwKDiNq9A5DacTSV4td0cruG/cnjgw+jWFn2HH7e26trUmFSZ7RUowUl1VQ0lrOV1weioUt82qWwI3B95+7EegwmDYgREfb5Qaoy8sSo0C2bnLqEwOCXHOSwt0AdpzvhkJaVrf3UOzUqYEDp1+/1+tTgxwee59GmsqDlv/oWd6059SLVI8eFS6rilKYDXJ0fiv2RDvfIHqwoemUf7wIefIJso6pVO9aj+YDkTyZ6YL/6tu4j8T5/gpDxjyxYDhMEu2C1SD6Cy33Qz/Vk01DKUaqvrxXoCkjJRdk5BWw3Fu+X5V
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3Lg1jhePjrgbQbrhQuaBpcqfJ1mwMhJwhT0tmtMnOJnst1eQ+ZIZeY3FyF?=
 =?iso-8859-1?Q?4YoWyTCVt7k5sdjeuPH4D30nbfbzDLfoY3j3lmcci526Xg1SgnfCMqv1yz?=
 =?iso-8859-1?Q?aS1aSEJSxmD9iANIVTkdAtA+QTUxcWR9hrCHZWYje1uoR8aRJLBOY3GfSF?=
 =?iso-8859-1?Q?EHHhw6bNws936IvUREl2X8y7uiCd7CiTxM4FQntN2FEPlDenPrZt6umv6k?=
 =?iso-8859-1?Q?2GzxyM7OEUg76SvKWQj3htUkVTxoE1Q+k2bph/fDPBevjo1ghrRFwV7VvX?=
 =?iso-8859-1?Q?fmF1gC0pynauXNeVaDoQCn19N3JevWc8oyKoAeVdwZBW1wLjBWh3UMyFRl?=
 =?iso-8859-1?Q?rw+C1/aq6KhpPK/6twgOo7coGc74oDlV0VDZoaWk91riho82DVL8Eq5Ml7?=
 =?iso-8859-1?Q?AU2qcrl4s4bmHoNlWwft2t5WgfJciVcMSF1sqt7fONQqq4tr1YD7Iur3tg?=
 =?iso-8859-1?Q?eNC6i3xAEmALri2ulDPAYga9wU8Az7pTjf4xBZ8zcf9d4zzE7EDwzPw7aH?=
 =?iso-8859-1?Q?eOQqmhI12/ZSJrjj7WTbxMcq66Qfp8xeszrVUOweGCl04xtsOiYQMeSV80?=
 =?iso-8859-1?Q?hXOc03mndDlmP192eLNpbhehpdUK/Q/AWRKSooQPJsRVYzvCwZlb52c+ZA?=
 =?iso-8859-1?Q?V5vyzfb9gVSVxF4kSxP7rZke2tUj+LX/lptGpxIi4L56O8l9IelnwkfkAF?=
 =?iso-8859-1?Q?s5tviZHwiwPpNqyroUlubwkwHG3hi7WHlxfZ4pgVxFIHzmCgg6vEFsqfLY?=
 =?iso-8859-1?Q?uHPAfBcMtGSx5JuZ7HxjKZjCbY9qSk1wZmcibBSrNhgdxJMT3Q+h0Kr6ZC?=
 =?iso-8859-1?Q?FUm4UZ9/Wxsymd0skrhjYZl57zzfN3I5QkavUDvTBTSvWiL19eVDMK6T/H?=
 =?iso-8859-1?Q?TJWqLzlNpOpQ4Ycbt98EWnvl4SHZ+WruxPo8tI1HBO5wGz/PNYre92zujQ?=
 =?iso-8859-1?Q?a1WQBM5n3/WR/MasamXoG6PQlR2laeCkVCxNJZCtjhLVGAygQKOgYjnYrF?=
 =?iso-8859-1?Q?kdkuCOsgAGUKwZu8MGj98Y1c95WfChXijh7uacsAKd2HbxAe9U6I8QVwqY?=
 =?iso-8859-1?Q?RY53Xd1DNwGWFYhLJgrSZ1VmZu+bTb/5I6QwFoajvN2lyBDQQY5Cj/FSbw?=
 =?iso-8859-1?Q?QddsLKUQlexRRN6fgPLpCwMIDLwgGQShItvBj5JiXi4gg9vExNvPGgjOsm?=
 =?iso-8859-1?Q?EmjYVxw+01OhAXU1Xy4VyNjge4qIEkYU/ftHh/HPwPa9J8br90GFRUhOaq?=
 =?iso-8859-1?Q?JhUSFTvXLTRF7NWrPktRJD9Smon0i5nfMSGC9nSrwr5ni2ltoV47HPgLK1?=
 =?iso-8859-1?Q?s+4vRFxZG1h0AG8cTrVB/yN9meHCAb04Wt8NVdOm4bjCkwT/oUgJ2K73KT?=
 =?iso-8859-1?Q?wGcsQppImE+Shp9/YEb86joobILqpVwmyGp7ZvircrjcJIV6TpXwNIN6Ma?=
 =?iso-8859-1?Q?a4CLkUx1+AWRgvyOdzsnAyusQMTtEJAfqNqxbXQQ4/e/EswkgBhcEkAgSe?=
 =?iso-8859-1?Q?oLvnWV6Y5LqGrBuIo+gJ7j7haKSdiB9Z+R40mXDAmXjHrOpKAf0hv4c1f2?=
 =?iso-8859-1?Q?ZbWj8Yy1T1rK4u3SB4K3Sapw9ON2whkRUWyw7WmfTw+el8pSU/rMTdx0M1?=
 =?iso-8859-1?Q?w8FJyc+YIeZPNxcKnVyQNBkIoEFfbW4RDUzjEx2kM13Z8xlzRbFy1s1Djp?=
 =?iso-8859-1?Q?amewuyYdmbU+iVof+RzEIjAW8rakS4MrqgpnF93N9Pd4iBDxio+d//1D7P?=
 =?iso-8859-1?Q?mmqEs9NOetf1xi+QRMtzqFoLInR5z0JJ6AW6r7ayx1I2M5?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0879fe1d-d0ba-4204-84ce-08dec272061e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2026 19:46:51.7356
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OLLjvBK5Ss1DUg/7jxUBnr3a+FLd0Uko4rMKXuPYdt2VD9bbFKDTz+LWIAOOLFa+a1CjcFJj7zR5rdXbxJELyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR03MB7942
X-purgate-ID: tlsNG-4011c0/1780602417-705648B7-069191D4/0/0
X-purgate-type: clean
X-purgate-size: 1715
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:from_mime,citrix.com:dkim,BY1PR03MB7996.namprd03.prod.outlook.com:mid];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5F15764301A

>You have identified that bzimage is x86 specific, and for that reason it=
=0A=
>should not be included in common/kexec.c.=0A=
=0A=
I believe Ross moved the definition of setup_header out of kexec.c because=
=0A=
kimage.c also needs to use it now.=0A=
=0A=
>We are going to need an=0A=
>architecture specific way of figuring out the alignment, but looking at=0A=
>kimage_find_kernel_entry_maddr(), why can't we just use the EFI header?=0A=
=0A=
"Going to need" like "it would be nice" or "we absolutely can't merge this"=
? :)=0A=
I feel like I might get bludgeoned to death by a set of bagpipes if I have =
to=0A=
tell a certain someone that there's more kexec work to do...=0A=
=0A=
>Why is it [digest checks] tied to=0A=
>KEXEC_TYPE_CRASH_EFI?  It's applicable to all kexec types.  This ought=0A=
>to be first first in the series so it's not tied to EFI.=0A=
=0A=
I can do KEXEC_TYPE_CRASH_EFI and KEXEC_TYPE_CRASH but there's an extra lay=
er=0A=
of complexity with normal kexec.=0A=
=0A=
kimage_load_normal_segment() copies the segments data into temporary,=0A=
non-contiguous buffers and then sets up a relocation table which kexec_relo=
c.S=0A=
uses to copy the segments data into the correct place before jumping to the=
 new=0A=
kernel. Calculating and verifying the digest for normal kexec would mean ne=
w=0A=
code to walk the relocation table to find every temporary buffer.=0A=
=0A=
As we discussed internally I'd rather not touch the normal kexec code=0A=
unless I'm fixing all the existing issues and can actually test the changes=
.=0A=
=0A=
I've sorted out all the other things you mentioned but still in the process=
 of=0A=
splitting the patches up.=0A=

