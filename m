Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LkbLnCkhGmI3wMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 15:08:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D85C2F3C9F
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 15:08:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222002.1530076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo01x-000495-08; Thu, 05 Feb 2026 14:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222002.1530076; Thu, 05 Feb 2026 14:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo01w-00046e-TD; Thu, 05 Feb 2026 14:08:24 +0000
Received: by outflank-mailman (input) for mailman id 1222002;
 Thu, 05 Feb 2026 14:08:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BdQL=AJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vo01v-00046Y-Kj
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 14:08:23 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d3287b7-029c-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 15:08:15 +0100 (CET)
Received: from DUZPR01CA0090.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::8) by VE1PR08MB5823.eurprd08.prod.outlook.com
 (2603:10a6:800:1a5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 14:08:07 +0000
Received: from DB1PEPF00039230.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::74) by DUZPR01CA0090.outlook.office365.com
 (2603:10a6:10:46a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 14:08:04 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00039230.mail.protection.outlook.com (10.167.8.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Thu, 5 Feb 2026 14:08:06 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by VE1PR08MB5774.eurprd08.prod.outlook.com (2603:10a6:800:1a1::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 14:07:03 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 14:07:02 +0000
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
X-Inumbo-ID: 1d3287b7-029c-11f1-b161-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=KEsc/pk5mvXKxACFlbCOw4FU/JM/Y8BasYuRXJeeAe2gFVLQGGUrD9Q8Lw90XJ5iM0/qz8V8UCKZh4/1wEJyebnNZyrZFIByyS4Wk7mNkhf5g5cOQnM7BZvgNr6tVgqr/nC3/bguqCCa/OB0++SN8fhRyktZAqA0ZGv/LYjQAd5L9YJpvY5UF9h8idqs8ze+hSG5yMjvrRJ3CcQUhA0kX2+O9Km4xAJyOBy9mYBBeP9T9JAoAGa9GGonveB5f1nykN4QQcjwKxmPCAZGakgNmj3z7okdVpPp865HqR7nOGfsShA+krnk+r5NUenMt+JFTV0HM+aeNP2L0UFNYUVTjg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6oOM/no9Hpzb1JgOlBielFeUA61pJW69yO25S8iU/s=;
 b=R75j+NfipzVHTDATPwpdPpEWeK285MrGh2M4PeflelPC/qqQ0cbjw+nyOxywDYtUAhtqpJgGImmkFvxqP6eyscY0ol4pqWPkJODDEEJDnzg12sSobru97M0tILvR1M0eHJisxlFvukZ7QijvMZAulgaW2PL7+n1pyNdmINgR3g+wCMyMHxmr3dl0Jk+zG+qrqGYGd3Z0Bc+AjrzygT70yYvVbhze+JYzU6N3a9OiBimePU4/0VGhyLxq3tKK5zEzs7VxtTUc9I+zGm9NtWWDGN/msdCMN3sWLWjTTm+Z5Q9F33OJRbxTHTVEel+UWV3GUf59tK05jus6Td3VfpFLfg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6oOM/no9Hpzb1JgOlBielFeUA61pJW69yO25S8iU/s=;
 b=fbAe2ORPuo5XrY25kyrsywI8BONIWHZxYOuA3B666AvEK/l5t7bl2t1uYl2A8svEh8LFUcVBrWJLJ3XZaniXAhtr8ifA2GkKZWzuoR0Sbc3r5kjDzFLL64MdlrobQbr2CXGkVi/Efv1FCDfjdazBu8w9/CFitGmBJr7BVXPO0Uw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OOSrbkBnpoCEWOWGWjTVdBvNxBXAvzKBGL7nqinol/LaWs3JfGYV5Anv9SHT7poHgGUvM3Lyf9L4FqdPEOO/10GyLlLhpX7AivREotIRE+CWvopsd883KzeGy0zQipwKjUwebNZVBWT59HDIlv09l9eXPyJ/rHeT1tFSacFqI7wOZcuCJSKQyPJtRbns6dMJZgMjDT+gPBodnwpN6aUY/A3cmwVSzNGQfZz1WE+AXZn2zG94FV7L4Vd9HzD/QXbloN+HCfw6glbySxoQA4u2LZqZ2a2NJ9VN9Uii6pehz//eC8e2xEmFACfjVnInG5FD8U3E7nphP2A5Vk7+VzNplw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6oOM/no9Hpzb1JgOlBielFeUA61pJW69yO25S8iU/s=;
 b=eB5QvtUVt7jmvGj8WWRAGBW1VTGGhyp8WMJX9OpFbZiSXf/zEaH0ADCfyYlcaCuzoRo3jAf2LoFTSqgUZD4ww7ImEqCBhcm18Umj/oscen3nuuFS7PBNnWmGR2/uKC2ZFSdkPc7v30bhS6fOPvqpN/FtLgzSBFul5Xnb6QuFz5NI2b/Tvdd5QeqHGv5rLL9Ke5tlyQatEeo2LJ4AgrxBJe+r+YBC7i3C7iEAAQ+t38epg2JIfWLzij9bcreziFMoLkRUeYoUGHMGq/VVGl7O9G1zgkG+U6PE706TDihdwwB6/LgczVGRwo7Wpw6utXnWIcfQkkSfk9PArTxh5Ylt0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6oOM/no9Hpzb1JgOlBielFeUA61pJW69yO25S8iU/s=;
 b=fbAe2ORPuo5XrY25kyrsywI8BONIWHZxYOuA3B666AvEK/l5t7bl2t1uYl2A8svEh8LFUcVBrWJLJ3XZaniXAhtr8ifA2GkKZWzuoR0Sbc3r5kjDzFLL64MdlrobQbr2CXGkVi/Efv1FCDfjdazBu8w9/CFitGmBJr7BVXPO0Uw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 2/5] arm/irq: Migrate IRQs during CPU up/down
 operations
Thread-Topic: [PATCH v5 2/5] arm/irq: Migrate IRQs during CPU up/down
 operations
Thread-Index: AQHchGj73A4kTs3O/EWyR3N/eFmlXrVyue0AgAGCbQCAAAwtgA==
Date: Thu, 5 Feb 2026 14:07:02 +0000
Message-ID: <CE531E44-2AD4-4164-8A86-1D6084A6EAE1@arm.com>
References: <cover.1768293759.git.mykyta_poturai@epam.com>
 <63892f56f227fae75d78e2ef2ee63887e74c523a.1768293759.git.mykyta_poturai@epam.com>
 <6080438F-DB60-4A50-8264-1CD04761B196@arm.com>
 <48a84d44-def9-4181-ac67-5aeb31ffb529@epam.com>
In-Reply-To: <48a84d44-def9-4181-ac67-5aeb31ffb529@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|VE1PR08MB5774:EE_|DB1PEPF00039230:EE_|VE1PR08MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: bdb52e7b-0d39-46a4-fa6a-08de64bffc4e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TE54S25vcE45QTA0ZVVMK2ZlZitsNEFMbE9pSE1FZE1wSTNiTmY0RWlJbEdj?=
 =?utf-8?B?NnF6UWdNQWlOb3hnU2pxVlY3UDQ2bVY1aWl0ZTZjSWFVeWhPaTVKT0duN3Qw?=
 =?utf-8?B?Q242QVVhbEQ2TWhJMERzaElEcFZ6WjhQeXA3c0FoK0k3RnByQjNReVd6YlJn?=
 =?utf-8?B?cFBzZHlvdHQxc290QStKeFpNRCswMXBjZjNLQXExTnFMTDM2RU1YemJrYnI2?=
 =?utf-8?B?akJWT0Y3b0NsVmxNVzRpQUxaZloyWWp2OGhtREpHNThXSWdueDBpaUVRdnR5?=
 =?utf-8?B?MnhFRjlkZ0owcVJjUmFraDdXaDZDK3ZvdXVRenNEeStuNkNOdFNJOC8zaWQ0?=
 =?utf-8?B?alNYcitBMmRwNUJzTTVxYkpoMGRsTW5RbFVLb1FOUWRmUUhjYnVSc1BDeEJz?=
 =?utf-8?B?SUwzM3hMWDl6UmYzeTlXQUtSSkpwNGZidGZvOFMySkcyYWYyNWFVckpWN1Jr?=
 =?utf-8?B?U1lLeldLKzVkcGs3cjErd2xzZ2VPNzJFalh5dkNDc29Dd1d5TmZ6Z1d3ZUN5?=
 =?utf-8?B?Z3pvZElzSUE4VHprUXdpcU5Wb0dqem1YdXU3MEsxTEpNYUZQZVZtcmFlMlc2?=
 =?utf-8?B?M2VUUFVoY2dLSTRhQnM3b0o5OUpjMHBYRFZNNkMzZER3L2s1ZlFEWVpFU3Nt?=
 =?utf-8?B?SmIwY1VLOVVxa09oQmwzczE5U2k3ZXhGazMvcmg5ZUZCYnd1Rm50WVpTcnl4?=
 =?utf-8?B?ajVqMGMxRFFENjE0UzdXcmFOUWpXNndaeCt3QUhOQ2x5YXdiVC9yekZ4UHVZ?=
 =?utf-8?B?ZXFQTUo0eWF5aHVYWHowcFpRNi9mQ3E5RTBMY3pucXBFZys3RGxMU2NidWp4?=
 =?utf-8?B?TklDWURWNVJxM1JSaG9PN2dNT2pGN29WajV4bUpYNlRKUkpUbndjYUo0RVJt?=
 =?utf-8?B?ZTZSY3JYSmZNdkFVbitUNVBlNTUyNGhxSDdrRkNXazR3L2tQQ3MxdncwTFg1?=
 =?utf-8?B?NzdmSjZYWWFoOUVUMEg2UGF4alpsVXJ1YmYxMm0zMkVxbnpTaWNRQWREQm4r?=
 =?utf-8?B?dFlwU21uWUx4SVZQNU8zMENTWkdhQmxsZUIwZDlOVHI3QldJcWlrYVJ5Q2lP?=
 =?utf-8?B?cmdObGUzaDh3ajlvMlIxd1dZSzFHQXFSb1d6MlFPc1h4MXV5U21RZlUrUWpx?=
 =?utf-8?B?WE1MVkJxY0RaYWh0azdVR0RDRnZudUpsTlFpVk9ZZFBwQ2k1czVkak8vMTJv?=
 =?utf-8?B?ejFEZ3pmWktxMVdiSmpZek4zUXQ4SjAxaUt6MmtFcnNHb2NKa3JvbWxYekJE?=
 =?utf-8?B?OWJYS0NnemFnNysyV2FCcDNxS2dCQno4RHZBUk81SUwyOEF5R3ExZ2J4bm5V?=
 =?utf-8?B?M0M4b2JmYUl1WUg5SDNQK2JLaTlFTjBIdERSOFJkenh1d0xSMnYwajhuVjNi?=
 =?utf-8?B?c0JMR0R4aTd1eDU5M0U0VlRpaHVtK3FuNkwvbktkYmd3L2Y2SGFZYnd1OXMy?=
 =?utf-8?B?RHVVSVd2OTVLZ252QlVTRzVUL1lsVUJtbG1YSjdCQncyQ2JsUVkzQ1B4dFo4?=
 =?utf-8?B?TDIxVEFTZitTemdoRlJ4aGkvYk1OcWc2cXpaQVMvU0hxR1NoMTh4OGpMTUN1?=
 =?utf-8?B?OG01YzJZQjlidytjSUhTbjhySWg5b0FkSTRYQ05yaXhnbHhrVVY0TWQ5U3lr?=
 =?utf-8?B?RzMzdytCVm5UanN4QmxkQzdMS3JROURzamxPOElNeHZhbDRNNzQ4ZFphalBi?=
 =?utf-8?B?VTkrVDJZMklqRUt5RDR6SDNMWHhTdWl4MmkrVURMdXJDYk9TUk9pbnIyM1F6?=
 =?utf-8?B?by9PYVA0bWViU2dlY2RBeGV4TXNFZ0xaY3JnMWdrbC9RVEQrOXQrMGJMa1RV?=
 =?utf-8?B?TDNxVDNyOGxacnpHYVlyTDNyd2hwVThrQjdvRWdQUFNoUjNuNGxDa3hLMjhx?=
 =?utf-8?B?NkREeW41cXhXNStSVUgxMHV5WVhVbWE4aFJsbmdEVXc0UVBUTTArTHQxRmhp?=
 =?utf-8?B?TXNsd0JxM2FnRVVUd1cvNSt1aEljZVNBNy9RMVdCSDVtdDhXQ2MzZlBXZ0Ja?=
 =?utf-8?B?L0l2SGtWZ0pxSnhZdXAyRm9VVW5PRDRhYW9FTkJZMExxQThRM0FFaTJ6WWcr?=
 =?utf-8?B?bzhHL2J5aG82NjM0TVVvVVNnYWNUd2VvOEt3MFk2cEcyYVEzcVIyelBPTzdO?=
 =?utf-8?B?bFQzWmxlU1dicHZRVzhTdWtYdHMyeVFOWld3cEJ3SVkrQnpyeFJUZW92WmFi?=
 =?utf-8?Q?jWt8MOM56BJKITUooNpBHJ0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <10F3D9F95408C14FADF9AA860D512CE2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5774
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039230.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e28280c5-9a5d-4899-f3b0-08de64bfd5e6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|14060799003|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2hLSmhWMGlGTWt1ZWpmNFlldStNbkNwZzJKNUd0S3ZBTlN1RUVRclJzRG4z?=
 =?utf-8?B?L3RnZVIwWlhXSzBGWXNpL3BnYkEwdmhVbXhTWkZGQmxWdEx6OUYwVjIwSTMw?=
 =?utf-8?B?aTBFbXpXWWtkMGNyRFExUy8rd0lrRU16cCtKdnU5U3Z2bXlQaGNTVTRhUnY2?=
 =?utf-8?B?dktwcmtXSjNQSG5PWGlxNC94RzVoNzY0MFJSdEh5SUtZQTNRSHovT3lURld0?=
 =?utf-8?B?dXgzUHNJdDcwcVFObXRxMEFXNnRzR2ljY1poSnZlK0RFSTJmS0FmaXkra2F6?=
 =?utf-8?B?SVlSOGtsNG42NE9UTFU0VzR2KzBXMnhtVWtPY2dHTzFkU1hNeEJYSDRJVjRl?=
 =?utf-8?B?RDhhMnFoVTJyYVZVNEFnZ3hRWlhVZGhXUkxQREhjQlJrQUQ0Ui81SVV0Tk1F?=
 =?utf-8?B?eUxHMkZEMENiUVM2elBJMGlBNTBJcEdZSUtnOFRKU21GSy9taWViYkFRaUFF?=
 =?utf-8?B?RGlIVTkvTjNibjQrT3dzeUYyTTJXVC9Ja3VCYkZOYS9XK1lLOW5UTGwvSWh2?=
 =?utf-8?B?V3o0UjZOZ1BFanRyZ0hKQlNtaWVvK3ZnYmVEVDFMR0xsREREb2gwUUlONU1j?=
 =?utf-8?B?eXpGbVJvYjhNa3VmNnUyUTA2cjN2ZWZWZStWRnliWllUWGNKSDFhOVh3SFp1?=
 =?utf-8?B?TzNVbndXTDVIYVVzK2M4RmR4MGdaQXlHTng5OUpLTlM2b0s0VTNGanBVZUUv?=
 =?utf-8?B?ZUNEZGpJdTlvSHRiMVB2cUx3Vmw3QVEvMW9xa1hjVlFHdFhnTmNHeDdFQ0VW?=
 =?utf-8?B?MkNtZFptSVBRVW43RVJ6WGhEemZJV0tvQ1NHWU80c2pwWWZoMVJFaGdmT3Zl?=
 =?utf-8?B?Q0tkZXpzSDlLSkErQ2RaK2MyZGsyN1VkWHZIMk0yRXA2bWRtYWJMTTJBREhS?=
 =?utf-8?B?bWhReFdLTE44OXh2V3QyOFZrY0VjTnN3UGhoSWwrM1cyZ2xzaHY2TExPczE0?=
 =?utf-8?B?eTRpVEw1UWVWTjVWNHVxM2V2VGxGcUtSdFFMa1JwNG8xbXZKUlFZVkVwVm16?=
 =?utf-8?B?RWZpN1hDVjVWck9OMGd1S2dNWm85VkQrVFhBcE5rK2ZNWDUrbXIyODFpK2lS?=
 =?utf-8?B?UVJRN3Y5MUk0ME1Fc3U1M3k1WnVMNjJ6QS9kNFovaW9yUmp0OWVPTnVWRnM5?=
 =?utf-8?B?QjNkVkhUV0NTaDJDSzJ0UTNYQjBYK1BsVmpPY2hxOWdaaFJjcmo3ZUkrbUF0?=
 =?utf-8?B?MmpKOGFEM0M4NlZ5V1ROeE5mcUFYVklwRmhFY0U0VmEza3lmeGw5WXczMmkw?=
 =?utf-8?B?U3g5MHoxK25CbS9TaEhhbVFOVHAyQ21JZThSak5naWduRFR4OTB2d1RiYUl3?=
 =?utf-8?B?cS8zdytRWEFmbWlqZUZkaTBvRGoxUUxMMUJWeXJueVpxSUNJMWYxM013bU8y?=
 =?utf-8?B?WFFaclF6cFIxZUZiVkd4blhqbzd1bXRPOHQ3R1lXQmEzWGZyQndwSFhmSDhH?=
 =?utf-8?B?dFhvaGVpOUROSGIrZkRDUHMrdDBXU2NuS0RSbEZxZ05TMHRpNTJxTTEzZWNm?=
 =?utf-8?B?UXRDbklQekd5K1NYcDdDb1I5MDhGYjV2YXFzVitSVkJYcks3NTh4L0RkaW9Z?=
 =?utf-8?B?aGZFQnoxTDROb1F3YUg2eXFCSkpQSHMzemYxTFBuclF2NnIrMldBQ2ZEMlNQ?=
 =?utf-8?B?dU90d0hnQUwyRkxGRGkvV3hycXN1TXl3TnlkRTRGeEhEU3R5MHR6ZTRIRjZm?=
 =?utf-8?B?UE5tYlQvdVBZa0dCeXhJc1dtU3k0UG5sSHJIc25MbTJPbWRLR0N1c3lVUXI4?=
 =?utf-8?B?OVc4MDNRdWZZYmtZQjVKLzU0aWs3czRDVjh1ME9pOW1hVm5Md09CMUUwZ3p4?=
 =?utf-8?B?cjMzOW4yTTlESlRaZVYzY002T3B2MGwrMW9xVy9YZ0tpRThieURzUDlHV1Fo?=
 =?utf-8?B?VDhUdUZpcG9jRTRrbVRuTmpOdEcxSVhjblJVaEFJd3lQWE9wV3dxaXAvdi9o?=
 =?utf-8?B?aFlDMG5Ha3YrYWxqMUphS0hTYXhuU1B1eWQ3SEJnbFdlREJVenFhTXpYYnNz?=
 =?utf-8?B?V1p5MEtJOWlwTFFBYkR6aVI2LzVKZTBLKzZtSXFmVEZlaFZRb0RneFk3cExy?=
 =?utf-8?B?U1RaTVQ0L0s3UVQxb0NmTEh0QzQxUyt6RXJSSWdGeVg1OXh4OHpKc1ZjOCtU?=
 =?utf-8?B?cEh5cU10MU02L0RDUjl4UktlMVQvZEtNNGRVWGwvbEFDQ3hiZ2s5UzhEWkJW?=
 =?utf-8?B?a2phZnNFcGJNMEpMZDJCcnZDTHR3TWRZaUF4TWs1UVQyZXdZcVhNQzRDRjVo?=
 =?utf-8?B?dGhZK3hnc3ZINDlJSW1PRVE3aTZRPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(14060799003)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Cz5RdZftipUjPv+z+F5br8NmRmdG1PJJRNBsYMCQRnBUKxiXJ1WOkSpe5dQZkYc8ZgfxznT8eWUOFajWUE1iTW6vwODIghKE0d29nPOcAny8BSl5cIJYPD+VrohzDftQLaGUKnS+vBDXlAdSRkl98oqX/URAzwUSYn5nhjfHd3rIACee1vwhns039glrYOaoN4N3mQzepWcGDPCE0qKXIEO5sG8hI0qVtUdytZ27v0rzx94OfxCdg7U8iMrOwP/x679huzgaRB7UJsTpHBo0067iNQRt48it4C3+Nwa/ELwEE1bBvPAZBLs/SOPTgTqJinErhVUhfR1LJLEZHG1skcOnbX8WzBG6Xe2IrgeC+3MAqJXGUPf9dpSrgdDXycXMYOBY593yUvzRNe/ewjuiOqfottaju2SGiOs/i6xcsAriv1y2jaONMr60IzydcQO+
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 14:08:06.6628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdb52e7b-0d39-46a4-fa6a-08de64bffc4e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039230.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5823
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:mid,arm.com:dkim,epam.com:email];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: D85C2F3C9F
X-Rspamd-Action: no action

SGkgTXlreXRhLA0KDQo+IE9uIDUgRmViIDIwMjYsIGF0IDE0OjIzLCBNeWt5dGEgUG90dXJhaSA8
TXlreXRhX1BvdHVyYWlAZXBhbS5jb20+IHdyb3RlOg0KPiANCj4gT24gMDQuMDIuMjYgMTY6MjAs
IEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBNeWt5dGEuDQo+PiANCj4+PiBPbiAxMyBK
YW4gMjAyNiwgYXQgMDk6NDUsIE15a3l0YSBQb3R1cmFpIDxNeWt5dGFfUG90dXJhaUBlcGFtLmNv
bT4gd3JvdGU6DQo+Pj4gDQo+Pj4gTW92ZSBJUlFzIGZyb20gZHlpbmcgQ1BVIHRvIHRoZSBvbmxp
bmUgb25lcyB3aGVuIGEgQ1BVIGlzIGdldHRpbmcNCj4+PiBvZmZsaW5lZC4gV2hlbiBvbmxpbmlu
ZywgcmViYWxhbmNlIGFsbCBJUlFzIGluIGEgcm91bmQtcm9iaW4gZmFzaGlvbi4NCj4+PiBHdWVz
dC1ib3VuZCBJUlFzIGFyZSBhbHJlYWR5IGhhbmRsZWQgYnkgc2NoZWR1bGVyIGluIHRoZSBwcm9j
ZXNzIG9mDQo+Pj4gbW92aW5nIHZDUFVzIHRvIGFjdGl2ZSBwQ1BVcywgc28gd2Ugb25seSBuZWVk
IHRvIGhhbmRsZSBJUlFzIHVzZWQgYnkgWGVuDQo+Pj4gaXRzZWxmLg0KPj4+IA0KPj4+IFNpZ25l
ZC1vZmYtYnk6IE15a3l0YSBQb3R1cmFpIDxteWt5dGFfcG90dXJhaUBlcGFtLmNvbT4NCj4+PiAt
LS0NCj4+PiB2NC0+djU6DQo+Pj4gKiBoYW5kbGUgQ1BVIG9ubGluaW5nIGFzIHdlbGwNCj4+PiAq
IG1vcmUgY29tbWVudHMNCj4+PiAqIGZpeCBjcmFzaCB3aGVuIEVTUEkgaXMgZGlzYWJsZWQNCj4+
PiAqIGRvbid0IGFzc3VtZSBDUFUgMCBpcyBhIGJvb3QgQ1BVDQo+Pj4gKiB1c2UgaW5zaWduZWQg
aW50IGZvciBpcnEgbnVtYmVyDQo+Pj4gKiByZW1vdmUgYXNzdW1wdGlvbiB0aGF0IGFsbCBpcnFz
IGEgYm91bmQgdG8gQ1BVIDAgYnkgZGVmYXVsdCBmcm9tIHRoZQ0KPj4+ICBjb21taXQgbWVzc2Fn
ZQ0KPj4+IA0KPj4+IHYzLT52NDoNCj4+PiAqIHBhdGNoIGludHJvZHVjZWQNCj4+PiAtLS0NCj4+
PiB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vaXJxLmggfCAgMiArKw0KPj4+IHhlbi9hcmNoL2Fy
bS9pcnEuYyAgICAgICAgICAgICB8IDU0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysNCj4+PiB4ZW4vYXJjaC9hcm0vc21wYm9vdC5jICAgICAgICAgfCAgNiArKysrDQo+Pj4gMyBm
aWxlcyBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspDQo+Pj4gDQo+Pj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9pbmNsdWRlL2FzbS9pcnEuaCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9p
cnEuaA0KPj4+IGluZGV4IDA5Nzg4ZGJmZWIuLmEwMjUwYmFjODUgMTAwNjQ0DQo+Pj4gLS0tIGEv
eGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2lycS5oDQo+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2lu
Y2x1ZGUvYXNtL2lycS5oDQo+Pj4gQEAgLTEyNiw2ICsxMjYsOCBAQCBib29sIGlycV90eXBlX3Nl
dF9ieV9kb21haW4oY29uc3Qgc3RydWN0IGRvbWFpbiAqZCk7DQo+Pj4gdm9pZCBpcnFfZW5kX25v
bmUoc3RydWN0IGlycV9kZXNjICppcnEpOw0KPj4+ICNkZWZpbmUgaXJxX2VuZF9ub25lIGlycV9l
bmRfbm9uZQ0KPj4+IA0KPj4+ICt2b2lkIHJlYmFsYW5jZV9pcnFzKHVuc2lnbmVkIGludCBmcm9t
LCBib29sIHVwKTsNCj4+PiArDQo+Pj4gI2VuZGlmIC8qIF9BU01fSFdfSVJRX0ggKi8NCj4+PiAv
Kg0KPj4+ICAqIExvY2FsIHZhcmlhYmxlczoNCj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L2lycS5jIGIveGVuL2FyY2gvYXJtL2lycS5jDQo+Pj4gaW5kZXggNzIwNGJjMmI2OC4uYTMyZGM3
MjlmOCAxMDA2NDQNCj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vaXJxLmMNCj4+PiArKysgYi94ZW4v
YXJjaC9hcm0vaXJxLmMNCj4+PiBAQCAtMTU4LDYgKzE1OCw1OCBAQCBzdGF0aWMgaW50IGluaXRf
bG9jYWxfaXJxX2RhdGEodW5zaWduZWQgaW50IGNwdSkNCj4+PiAgICAgcmV0dXJuIDA7DQo+Pj4g
fQ0KPj4+IA0KPj4+ICtzdGF0aWMgaW50IGNwdV9uZXh0Ow0KPj4+ICsNCj4+PiArc3RhdGljIHZv
aWQgYmFsYW5jZV9pcnEoaW50IGlycSwgdW5zaWduZWQgaW50IGZyb20sIGJvb2wgdXApDQo+Pj4g
K3sNCj4+PiArICAgIHN0cnVjdCBpcnFfZGVzYyAqZGVzYyA9IGlycV90b19kZXNjKGlycSk7DQo+
Pj4gKyAgICB1bnNpZ25lZCBsb25nIGZsYWdzOw0KPj4+ICsNCj4+PiArICAgIEFTU0VSVCghY3B1
bWFza19lbXB0eSgmY3B1X29ubGluZV9tYXApKTsNCj4+PiArDQo+Pj4gKyAgICBzcGluX2xvY2tf
aXJxc2F2ZSgmZGVzYy0+bG9jaywgZmxhZ3MpOw0KPj4+ICsgICAgaWYgKCBsaWtlbHkoIWRlc2Mt
PmFjdGlvbikgKQ0KPj4+ICsgICAgICAgIGdvdG8gb3V0Ow0KPj4+ICsNCj4+PiArICAgIGlmICgg
bGlrZWx5KHRlc3RfYml0KF9JUlFfR1VFU1QsICZkZXNjLT5zdGF0dXMpIHx8DQo+Pj4gKyAgICAg
ICAgICAgICAgICB0ZXN0X2JpdChfSVJRX01PVkVfUEVORElORywgJmRlc2MtPnN0YXR1cykpICkN
Cj4+PiArICAgICAgICBnb3RvIG91dDsNCj4+PiArDQo+Pj4gKyAgICAvKg0KPj4+ICsgICAgICog
U2V0dGluZyBhZmZpbml0eSB0byBhIG1hc2sgb2YgbXVsdGlwbGUgQ1BVcyBjYXVzZXMgdGhlIEdJ
QyBkcml2ZXJzIHRvDQo+Pj4gKyAgICAgKiBzZWxlY3Qgb25lIENQVSBmcm9tIHRoYXQgbWFzay4g
SWYgdGhlIGR5aW5nIENQVSB3YXMgaW5jbHVkZWQgaW4gdGhlIElSUSdzDQo+Pj4gKyAgICAgKiBh
ZmZpbml0eSBtYXNrLCB3ZSBjYW5ub3QgZGV0ZXJtaW5lIGV4YWN0bHkgd2hpY2ggQ1BVIHRoZSBp
bnRlcnJ1cHQgaXMNCj4+PiArICAgICAqIGN1cnJlbnRseSByb3V0ZWQgdG8sIGFzIEdJQyBkcml2
ZXJzIGxhY2sgYSBjb25jcmV0ZSBnZXRfYWZmaW5pdHkgQVBJLiBTbw0KPj4+ICsgICAgICogdG8g
YmUgc2FmZSB3ZSBtdXN0IHJlcm91dGUgaXQgdG8gYSBuZXcsIGRlZmluaXRlbHkgb25saW5lLCBD
UFUuIEluIHRoZQ0KPj4+ICsgICAgICogY2FzZSBvZiBDUFUgZ29pbmcgZG93biwgd2UgbW92ZSBv
bmx5IHRoZSBpbnRlcnJ1cHQgdGhhdCBjb3VsZCByZXNpZGUgb24NCj4+PiArICAgICAqIGl0LiBP
dGhlcndpc2UsIHdlIHJlYXJyYW5nZSBhbGwgaW50ZXJydXB0cyBpbiBhIHJvdW5kLXJvYmluIGZh
c2hpb24uDQo+Pj4gKyAgICAgKi8NCj4+PiArICAgIGlmICggIXVwICYmICFjcHVtYXNrX3Rlc3Rf
Y3B1KGZyb20sIGRlc2MtPmFmZmluaXR5KSApDQo+Pj4gKyAgICAgICAgZ290byBvdXQ7DQo+PiAN
Cj4+IEkgYW0gYSBiaXQgbG9zdCBoZXJlIG9uIHdoYXQgeW91IGFyZSB0cnlpbmcgdG8gZG8gaW4g
dGhlIGNhc2Ugd2hlcmUNCj4+IGEgY3B1IGlzIGNvbWluZyB1cCBoZXJlLCBpdCBmZWVscyBsaWtl
IHlvdSBhcmUgdHJ5aW5nIHRvIGNoYW5nZSB0aGUNCj4+IGFmZmluaXR5IG9mIGFsbCBpbnRlcnJ1
cHRzIGluIHRoaXMgY2FzZSB0byBjeWNsZSBldmVyeXRoaW5nLg0KPj4gSXMgaXQgcmVhbGx5IHdo
YXQgaXMgZXhwZWN0ZWQgPw0KPj4gSWYgYWZmaW5pdHkgd2FzIHNldCBieSBhIFZNIG9uIGl0cyBp
bnRlcnJ1cHRzLCBJIHdvdWxkIG5vdCBleHBlY3QNCj4+IFhlbiB0byByb3VuZC1yb2JpbiBldmVy
eXRoaW5nIGVhY2ggdGltZSBhIGNwdSBjb21lcyB1cC4NCj4+IA0KPiANCj4gVGhlIGlkZWEgaXMg
dG8gZXZlbmx5IHNwcmVhZCBpbnRlcnJ1cHRzIGJldHdlZW4gQ1BVcyB3aGVuIHRoZSBuZXcgb25l
cyANCj4gYXJlIGJlaW5nIGJyb3VnaHQgb25saW5lLiBUaGlzIGlzIG5lZWRlZCB0byBwcmV2ZW50
IFhlbi1ib3VuZCBJUlFzIGZyb20gDQo+IHBpbGluZyB1cCBvbiBDUFUgMCB3aGVuIG90aGVyIGNv
cmVzIGFyZSBiZWluZyBvZmZsaW5lZCBhbmQgdGhlbiBvbmxpbmVkIA0KPiBiYWNrLiBJdCBzaG91
bGRu4oCZdCBtZXNzIHdpdGggZ3Vlc3QgYWZmaW5pdGllcywgYXMgdGhlIGNvZGUgc2tpcHMgDQo+
IGV2ZXJ5dGhpbmcgdGhhdCBpcyBhc3NpZ25lZCB0byBndWVzdHMgYW5kIGxlYXZlcyBpdCB0byBi
ZSBoYW5kbGVkIGJ5IHRoZSANCj4gc2NoZWR1bGVyL3ZnaWMuIFBlcmZvcm1hbmNlLXdpc2UsIGl0
IHNob3VsZCBhbHNvIGJlIG9rYXksIGFzIGZyb20gd2hhdCANCj4gSeKAmXZlIHNlZW4sIHRoZXJl
IGFyZSBub3QgbWFueSBpbnRlcnJ1cHRzIHVzZWQgYnkgWGVuLCBhbmQgSSBleHBlY3QgQ1BVIA0K
PiBob3RwbHVnIG9wZXJhdGlvbnMgdG8gYmUgZmFpcmx5IGluZnJlcXVlbnQuDQoNCk15IGZlYXIg
aGVyZSBpcyBhIGJpdCB0aGF0IGJ5IHJlbW92aW5nIGFuZCBhZGRpbmcgYSBjcHUgd2Ugd2lsbCBj
b21wbGV0ZWx5DQpjaGFuZ2UgaXJxIGFmZmluaXRpZXMuIEkgYW0gbm90IHNvIHN1cmUgdGhhdCB0
aG9zZSBraW5kIG9mIHJhbmRvbSBhc3NpZ25tZW50cw0KYXJlIGNvbXBhdGlibGUgd2l0aCBlbWJl
ZGRlZCBvciBzYWZldHkgdXNlIGNhc2VzIGFuZCBoZXJlIHRoZXJlIGlzIG5vIHdheQ0KdG8gY29u
ZmlndXJlIHRoaXMuDQoNCkBKdWxpZW4sIFN0ZWZhbm8gYW5kIE1pY2hhbDogV2hhdCBkbyB5b3Ug
dGhpbmsgaGVyZSA/DQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4+PiArDQo+Pj4gKyAgICBj
cHVfbmV4dCA9IGNwdW1hc2tfY3ljbGUoY3B1X25leHQsICZjcHVfb25saW5lX21hcCk7DQo+Pj4g
KyAgICBpcnFfc2V0X2FmZmluaXR5KGRlc2MsIGNwdW1hc2tfb2YoY3B1X25leHQpKTsNCj4+PiAr
DQo+Pj4gK291dDoNCj4+PiArICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmRlc2MtPmxvY2ss
IGZsYWdzKTsNCj4+PiArfQ0KPj4+ICsNCj4+PiArdm9pZCByZWJhbGFuY2VfaXJxcyh1bnNpZ25l
ZCBpbnQgZnJvbSwgYm9vbCB1cCkNCj4+PiArew0KPj4+ICsgICAgaW50IGlycTsNCj4+PiArDQo+
Pj4gKyAgICBpZiAoIGNwdW1hc2tfZW1wdHkoJmNwdV9vbmxpbmVfbWFwKSApDQo+Pj4gKyAgICAg
ICAgcmV0dXJuOw0KPj4+ICsNCj4+PiArICAgIGZvciAoIGlycSA9IE5SX0xPQ0FMX0lSUVM7IGly
cSA8IE5SX0lSUVM7IGlycSsrICkNCj4+PiArICAgICAgICBiYWxhbmNlX2lycShpcnEsIGZyb20s
IHVwKTsNCj4+PiArDQo+Pj4gKyNpZmRlZiBDT05GSUdfR0lDVjNfRVNQSQ0KPj4+ICsgICAgZm9y
ICggaXJxID0gRVNQSV9CQVNFX0lOVElEOyBpcnEgPCBFU1BJX01BWF9JTlRJRDsgaXJxKysgKQ0K
Pj4+ICsgICAgICAgIGJhbGFuY2VfaXJxKGlycSwgZnJvbSwgdXApOw0KPj4+ICsjZW5kaWYNCj4+
PiArfQ0KPj4+ICsNCj4+PiBzdGF0aWMgaW50IGNwdV9jYWxsYmFjayhzdHJ1Y3Qgbm90aWZpZXJf
YmxvY2sgKm5mYiwgdW5zaWduZWQgbG9uZyBhY3Rpb24sDQo+Pj4gICAgICAgICAgICAgICAgICAg
ICAgICAgdm9pZCAqaGNwdSkNCj4+PiB7DQo+Pj4gQEAgLTE3Miw2ICsyMjQsOCBAQCBzdGF0aWMg
aW50IGNwdV9jYWxsYmFjayhzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5mYiwgdW5zaWduZWQgbG9u
ZyBhY3Rpb24sDQo+Pj4gICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgIlVuYWJsZSB0byBh
bGxvY2F0ZSBsb2NhbCBJUlEgZm9yIENQVSV1XG4iLA0KPj4+ICAgICAgICAgICAgICAgICAgICBj
cHUpOw0KPj4+ICAgICAgICAgYnJlYWs7DQo+Pj4gKyAgICBjYXNlIENQVV9PTkxJTkU6DQo+Pj4g
KyAgICAgICAgcmViYWxhbmNlX2lycXMoY3B1LCB0cnVlKTsNCj4+PiAgICAgfQ0KPj4+IA0KPj4+
ICAgICByZXR1cm4gbm90aWZpZXJfZnJvbV9lcnJubyhyYyk7DQo+Pj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9zbXBib290LmMgYi94ZW4vYXJjaC9hcm0vc21wYm9vdC5jDQo+Pj4gaW5kZXgg
N2YzY2ZhODEyZS4uZTFiOWY5NDQ1OCAxMDA2NDQNCj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vc21w
Ym9vdC5jDQo+Pj4gKysrIGIveGVuL2FyY2gvYXJtL3NtcGJvb3QuYw0KPj4+IEBAIC00MjUsNiAr
NDI1LDEyIEBAIHZvaWQgX19jcHVfZGlzYWJsZSh2b2lkKQ0KPj4+IA0KPj4+ICAgICBzbXBfbWIo
KTsNCj4+PiANCj4+PiArICAgIC8qDQo+Pj4gKyAgICAgKiBOb3cgdGhhdCB0aGUgaW50ZXJydXB0
cyBhcmUgY2xlYXJlZCBhbmQgdGhlIENQVSBtYXJrZWQgYXMgb2ZmbGluZSwNCj4+PiArICAgICAq
IG1vdmUgaW50ZXJydXB0cyBvdXQgb2YgaXQNCj4+PiArICAgICAqLw0KPj4+ICsgICAgcmViYWxh
bmNlX2lycXMoY3B1LCBmYWxzZSk7DQo+Pj4gKw0KPj4gDQo+PiBJIHdvdWxkIGV4cGVjdCB0aGlz
IHRvIG9ubHkgYmUgdXNlZnVsIHdoZW4gSE9UUExVRyBpcyBlbmFibGVkLCBtYXliZQ0KPj4gd2Ug
Y291bGQgaGF2ZSBhIHN0YXRpYyBpbmxpbmUgZG9pbmcgbm90aGluZyB3aGVuIEhPVFBMVUcgaXMg
bm90IG9uDQo+PiBhbmQgb25seSBkbyBzb21ldGhpbmcgaWYgSE9UUExVRyBpcyBlbmFibGVkIGhl
cmUgPw0KPj4gDQo+IA0KPiBZZXMgSSB3aWxsIGFkZCB0aGlzIGluIHRoZSBuZXh0IHZlcnNpb24u
DQo+IA0KPj4gQ2hlZXJzDQo+PiBCZXJ0cmFuZA0KPj4gDQo+Pj4gICAgIC8qIFJldHVybiB0byBj
YWxsZXI7IGV2ZW50dWFsbHkgdGhlIElQSSBtZWNoYW5pc20gd2lsbCB1bndpbmQgYW5kIHRoZQ0K
Pj4+ICAgICAgKiBzY2hlZHVsZXIgd2lsbCBkcm9wIHRvIHRoZSBpZGxlIGxvb3AsIHdoaWNoIHdp
bGwgY2FsbCBzdG9wX2NwdSgpLiAqLw0KPj4+IH0NCj4+PiAtLSANCj4+PiAyLjUxLjINCj4+IA0K
PiANCj4gLS0gDQo+IE15a3l0YQ0KDQoNCg==

