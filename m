Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B31F49EC1EC
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 03:05:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853577.1267013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLC5g-0005Cj-28; Wed, 11 Dec 2024 02:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853577.1267013; Wed, 11 Dec 2024 02:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLC5f-00057Z-V6; Wed, 11 Dec 2024 02:04:39 +0000
Received: by outflank-mailman (input) for mailman id 853577;
 Wed, 11 Dec 2024 02:04:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tZaY=TE=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tLC5f-0004a4-9a
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 02:04:39 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2607::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 460fbfa0-b764-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 03:04:37 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB9365.eurprd03.prod.outlook.com
 (2603:10a6:20b:57d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 02:04:32 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 02:04:32 +0000
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
X-Inumbo-ID: 460fbfa0-b764-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OT78h65K4E9xQWiZ7n65iJPNFV5XhFzfqBj/3omUeJ1E7tD5XIX/iESfZPfJgAhdPz3mNc3oD93nH+xpI4dsAWYjXZX826XXTRbrKTd0iqUDrLLuGKHpzFeljWh15O1yUIsD8PUKwhhMHzmlf0Dhx/yntGuiEEg+V1cKnI9avH9t6RiiBGo6tARkFEqaWwKBmruCaQ0vLeZxhV7XE9tAkSCATU5txi0EfEbso+YgpXMg6Jb762k8YOMd2+ar5ycPdPC17GyvnNJfmlzAK38T60J0krsOXvL8KnMTPdwlXndtWXqZ1t0z5rmJ5bHUC1mWPJbvc0YJKBuAXaBlqVbV6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pj/nhgXuxO2BrnIrOHAoc56dHIEuF1g5kUOJqX9YgsA=;
 b=jj/Yg9F6HmwqkQUL7de8jIcL0uvlOvloUL5Iwi55RDBK//mWk84i2NoTfEe+DWCG3Fto+E0O78Qy5aiHo215vd+R+Lxsu2QLSYBblOCy1xHaeRtAMJNxr4u9Vn5uW6KpJ+OoIzbzKU03jXm7dOJ7mBK/wOs/s8GDdDk0tTuceYUwBEpJK8h2iidsgloy5y7I5JIegWv+O6llB1pqXV+UYjVs3cpJPldGaCYxTXfCt/gTa7q1q/0PbUk+Ax+YUhCsboNSSQdInLkqGlQt1okTbFjqx+p4QqIx4rbxTnksL6DaL//aZLllwqUa4BFSyWXDHqdBON0vLKcCtuCpzQEePQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pj/nhgXuxO2BrnIrOHAoc56dHIEuF1g5kUOJqX9YgsA=;
 b=voZhMb8qzCJ/xuIwjPXo29EdKK3USyXGlLVRvi4HbLfS76lDjLS6pube1vTzaqyiRm2sCtVdx5p3E3JrW8KkQEXUCcGGJryKQziGxo0djoO27X+omimlfRBXiKZvtqxofwSxNN2k0O+4XFywx8sbERuW1gSx5COv6J+Cq/JPJX3O3It0UEb3C9wkqzFKyAPvKrx3Tjt+0l6lXSDNDFPCO3LO5i6Vt9sgTd0O65Bl1IwI6C8oEcOd1k2kmQ1LjgCaFxBrMA530BN5MJfTxsHYNBIucnqHIc9KXK786tD8pEXOrwjOOH/qsYUzQ1onNfTRT+ZnmYglk8ROOs+iOmqdgQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 2/3] xen: common: add ability to enable stack protector
Thread-Topic: [PATCH v3 2/3] xen: common: add ability to enable stack
 protector
Thread-Index: AQHbS3ED5ZENsqu4Z0+AIfWfHmGdmQ==
Date: Wed, 11 Dec 2024 02:04:30 +0000
Message-ID: <20241211020424.401614-3-volodymyr_babchuk@epam.com>
References: <20241211020424.401614-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20241211020424.401614-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB9365:EE_
x-ms-office365-filtering-correlation-id: 52bfae58-3baa-4e48-f333-08dd19882730
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MnpDMnVWZElTYXFlclgzN3hVQ3B1WjhTQWMvMDE3NW56bW9tZWhjb0xPbytu?=
 =?utf-8?B?dXpnRTFqUWN5U1pvN1ZQeVVOT21sSnBuVXFUWEFoUWFUa2hkSDJ3dCtnc1hJ?=
 =?utf-8?B?am9kTzJmRG50NXhvb3M5ZTFBRHN5V2FBVVdSZjN3N25iSm93aTlwK2xLN1ls?=
 =?utf-8?B?RGdRaHdOZC83QVZzYnlKaVVFRXFYNThkYStKcmF1QktmemR3dy9tU1NpajBw?=
 =?utf-8?B?ZWZFcG4vVGthVzRhekV4N2xtYzRYM3ZXbGFvS0lCdFY4VThhUTl6UC9OSC9m?=
 =?utf-8?B?b3lpUnF6OXhqK1Uvby9TNmQ4N0FnWkdxbkIyeEdNV0tVQkM4emVkbk9oYWg4?=
 =?utf-8?B?L0VkV25mYTdmQnhlcTQ2amtNVmRSZXMzSUZTNXdhZkxFSzI5azFPdmJMelNM?=
 =?utf-8?B?aTU0TExxcjUrU2FDODhrdDA5bm5JZ1l6QXZRSSt6MFgxQjRSQmpSOGQrV21w?=
 =?utf-8?B?RlEyekhVN1lRbEFjODR1SXJIL0JjNytXd25mNmVqTFp5S1Zhb3RhbTRnOU9q?=
 =?utf-8?B?cUFLRXZwNXhIczJJQlVUZTdXK3JlYlBXeWNxTm5TZm40ckdodi9XN3VDYnNq?=
 =?utf-8?B?ckxmcDFLQmlWQTFZVGNnbmZURUNGcURXdEdvQURjVk1WNDUyc3RTK29mZ1Vw?=
 =?utf-8?B?a1Vhb1BuU092K1YvYm9aRW5DN0RoeFJjVWlPR0lxeWxiUVZ2N1I0b1RveXBQ?=
 =?utf-8?B?MFplT2dJUHkzUWRDRnhXSGNYV1JqNG5sVUhxMVJyRE5nd3FGZHJZZEpKNlJa?=
 =?utf-8?B?VnZtcko0OHNGTGdPenJOT1NSTWF4ekM1NGl1L0JFY0hLNThJRXh6aXB5Z2tw?=
 =?utf-8?B?dGRpZXEvaVdOR0RxMVFRK1o2S2IwUjIyQmRNczhXdW5EUFJQR0tyWG1EWGtW?=
 =?utf-8?B?ZFplUWlnT1l4dXUyQ1M5V3FDRFBFVGJ5dEJKeHN6WEFPRW5tdG5qT2pDbW5u?=
 =?utf-8?B?ZTJZM2NpKzJqOVF0MSt6SVYyaFc0bEtCWlE0ZFh3UEpjM09Vei94N3JLK0tD?=
 =?utf-8?B?V1E5RzMrbk41WVVPcjZyK2haSFN3K3pOeU9abFJNalU5U2k5VlF6SWQ1cnBa?=
 =?utf-8?B?UFZXa29McHloSm5FUktEUkV3U2U3TWVNU2dOQ3pDaElLSC8vVWljWmIwRzhC?=
 =?utf-8?B?dU5URG5CRmNla2xqUjMyS0FyWGxGNUlQUFlTRktVaVJGK1MzMDI5bWJPcEtX?=
 =?utf-8?B?aURmWVp3b2NJZkw3OGI4Z09uTnpxbHpQSWkrTkU0Y3llVG5EN1FHcDJETzVa?=
 =?utf-8?B?K21qS1h0QVZNcktuZHNLV0l4S2hMZFE1TVRnMTRnWGYreGpKVmZzby9aMFFG?=
 =?utf-8?B?bmg0akdhWStxUm9IVWlKSXhVdkxBZjhTMmM4elFkampkZVg0emNDRGJ6aGov?=
 =?utf-8?B?eUdacHBDcC83MHI3Ujh6V2JvSnZ3Vy9ZaERXTXY0K2FNUjRsL0lsMFdkU3RX?=
 =?utf-8?B?azE0b2l0NEpZanFqeGh4WDhEVEtHVWF6eFZhai9wR2pxQndYTktvRHRkeHNU?=
 =?utf-8?B?QUU1Ly9ac0tGWGljMXNCajBYTDMxUnIyMCs4TEFwaDBkWVR4dTk4ZERpTGVD?=
 =?utf-8?B?VW5KV3BaVVdvOWtnalcvcTg3V2NOelNuWlMybjJvZjlvREM2TUQ2NDZZWDBp?=
 =?utf-8?B?U3Bibm1uVXJqNlc2S3dVdkdxKzJJTWkvV09pT0VmN2tEL0lhTVFnUCtzQjNh?=
 =?utf-8?B?RE5XQ1YyelRkTExpMGcydUpybE5PUnE2V08zZHEvMmlXNEJGMVpROVBiM0kr?=
 =?utf-8?B?VzhKNkx2ZERRZVdqcVJlTlhhOWdSdFk4eFZ0NE92aks4T09wcGFPaEF4Ly9n?=
 =?utf-8?B?MzFmS1JwRWdLV05TL1E5ejNqamN5THpKN3FDVlNOWFpuZTJ1UDBWckNQUEt6?=
 =?utf-8?B?ZE1peWpFQXZlUWlkVUJjRmU1dDViMkk4VG5JYnhqaHYyQ0E9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bk1CWHIxM1NZMnNyZzE2b3dYUUw2MFZDMUpGOE1CclY0aHkvMHJBVnJlclNi?=
 =?utf-8?B?YlpGMGRkZDVPY3pxSnFRWVZlR3JyMkhDNFpHUVlVVkFITjdwV0R3NHZxbzds?=
 =?utf-8?B?TWNiajRrczNkY21TUTA5M0ZMbmpPMkhsa2l0M2J1RmdUSnVFaFNuT1B5dWNH?=
 =?utf-8?B?WU45YVdSaDM2NC8rLzR0cHNPc25HblY3TCtCWUdxWkwvbHFIaXcrWUlEb3dn?=
 =?utf-8?B?S1VzNzdGUUtDWWVwbUJja2hkSnlxRE1iNFlaNkZOY1IvaGVkbEFkZy9WV2hu?=
 =?utf-8?B?QitXZ1F1NHZmaVZqbTM1d3ZGVExLVnB2bG9rUHFzNG9CYWV0L25weTVEem9W?=
 =?utf-8?B?amIwWW4wM1VDb1pvWmwxMkVTYWlROElsZExJeTNqYTd1YmxwZ2tWbnU2RmxP?=
 =?utf-8?B?ekRyVk9vSGdEcVJzOHpZVzFCalF0aVJLbjFqVmtKYzJWd2JjR0RxSm92Q29S?=
 =?utf-8?B?bjllWUF6MldPKzhyaWV0N05jR0k3d01TRGx1TG1UM1dOVGJHSlJ4eUowT2Fw?=
 =?utf-8?B?QnIyeFMvTkVBYXE4OFI4aktkNEFrQVhTOHpLa3FqS2crZzB3eTNjMjRacXp1?=
 =?utf-8?B?b203TXhYcDQ5UURESE1OSFVwTVNTVkF1MStFSVQ3aTBuMzZpUXo2VHdOckRn?=
 =?utf-8?B?ZXFNMC9selQ4UlpqQVN0ZlFNNDlvV3piazB5Y0xCQVBHVEhkeU5BNGdRVnEv?=
 =?utf-8?B?cDlQbkpxNEd3Q0xjK1lqNmZ1TzhjYnhjWWlZRTVZTTNRRjZpUVoxR05OWlEw?=
 =?utf-8?B?azc0RlpxVXlsVXgvcGdFemlMc2RZY0poQzRra0J2emwxU0tyS2h0WnpJUnRW?=
 =?utf-8?B?dEJ2TnB3MHhOdVAvZTBoaDQ5blFQZk14WjY3QzhDd0Zxa3NPb2JwaThXeXRr?=
 =?utf-8?B?bXJ4RUFNQm5Ca1c0QkFmVzJhUWd4ODV3MkM0RDN0YXhrMjlEMXh3L3VVWUN4?=
 =?utf-8?B?VTlHMEJGL05haFhuam1WdXYzc0s2N0ZsZlhOOFFqRGJ2UDcwdEpBY2RJeHVT?=
 =?utf-8?B?aEViWlR1c2lTNXJ5SnBJS3IxUDhtTGpsUzVGZElWM0JKNytXZ3Z1ZGI1NG15?=
 =?utf-8?B?WUt0SW1WQVE3RTZlSE9rREV0TXREckFMZVhpUGZsbkRvVVo3ZG9PODFhRG5M?=
 =?utf-8?B?QkloL2k0dThHOWJYRHZGVkk0QjJyeG4zNFVwUUVWZmRHM2RZeFFieTAyS1NM?=
 =?utf-8?B?ZThFWmFzbXFFVzdMVHZnQWR6NXV6ZnN5RWZLWXJPZG1ZNkhvVjc5d1J5c0FN?=
 =?utf-8?B?L1B0RGN1cTIwa3R2VzlHZ0VGQmdSWW9qc1JrRWhjQVNEZkwzTWJ0VVRQZzJH?=
 =?utf-8?B?VFVtcmFFUFhMY29xK1p3MmwzYnBMVG9iNmxWbmR3TE84T2pwSHc0S3k4MXRK?=
 =?utf-8?B?RG00all5ZXowQXE5blVIUjJWWW02cnExZU04d2hxUUR3VE5TMFpVY1M5cVVQ?=
 =?utf-8?B?SVhlOU1GTGI3RVRWUkl2R3k3WW02ZEg1UzBXV1I1eHF0b214VVBGZlBQKzN1?=
 =?utf-8?B?eDVhdmJycXVGbWNIc1FLeGlPaTBvN0dWNVo5aER4Z2pTeklLZ29XQWJCL2tt?=
 =?utf-8?B?dXRybW1TZVJOUTFHckIzRlRpakI0K3FPSlB4NWl0ZzVjRlhITHUyQzlhZmhU?=
 =?utf-8?B?SUtWbHh4MG1sdmtucWphMUFBYkpjMWEyczQvOHl3UnFSamVTNFVBSHNmdElQ?=
 =?utf-8?B?UmRGclU3T29CbzU4OEwyRWxjVDg0N3JRaXM5bTkrc1pwdm9hakduenl0OS9w?=
 =?utf-8?B?N2Nza1pyeTRjS0lBS3FoaW41TERmZ1JEaWpSaVRlRnFHajM2N0FkTjE2YVpr?=
 =?utf-8?B?akd0MnJqcTRXWVJBN2ZMTUw2V1dlQURVZ3dJcjBRdmxZRVNLWFhybnVDZFBx?=
 =?utf-8?B?V3l0ZXltT0FYRlp6aytQNVVUb3BtNms1VTFnMm1VemhLZ0h4bVc5UkdOYXJY?=
 =?utf-8?B?bEtRYjRoVll5dGN4VS9lMXhaKzdFUnR3L0J6cmJMMjJ5dDNxMkJTTlhHSFVN?=
 =?utf-8?B?Zm03L0IvQUVsMmMraXNZakhuVHdMdTU0M2tVRkEzSEJweE5TMDVuZkNmUGNi?=
 =?utf-8?B?bG92QmtKRTFPMUZHSEk1WFIrd3dzSFMzeEYzbzd5UEFZN3R5VXh6ZDZxcWdZ?=
 =?utf-8?B?WFUzUVJjc1NrWmpNVFZOMFUzd2RPblYxcE85RXlRZkdFeHpydUZCcm1JalB2?=
 =?utf-8?B?R2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <549BB8EE78CD0E44856ABAF33634CF3D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52bfae58-3baa-4e48-f333-08dd19882730
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 02:04:30.6083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: und5uM0Y6qfmy3kFhAOaLA9gHjBVUXlMDrlOS+vGfshN3Oq4ZaX+4xv7sbS8L4ooynsDL9zxC7aB33VeiLtD7EqLE87kLpWA7qV0Pg0r9/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9365

Qm90aCBHQ0MgYW5kIENsYW5nIHN1cHBvcnQgLWZzdGFjay1wcm90ZWN0b3IgZmVhdHVyZSwgd2hp
Y2ggYWRkIHN0YWNrDQpjYW5hcmllcyB0byBmdW5jdGlvbnMgd2hlcmUgc3RhY2sgY29ycnVwdGlv
biBpcyBwb3NzaWJsZS4gVGhpcyBwYXRjaA0KbWFrZXMgZ2VuZXJhbCBwcmVwYXJhdGlvbnMgdG8g
ZW5hYmxlIHRoaXMgZmVhdHVyZSBvbiBkaWZmZXJlbnQNCnN1cHBvcnRlZCBhcmNoaXRlY3R1cmVz
Og0KDQogLSBBZGRlZCBDT05GSUdfSEFTX1NUQUNLX1BST1RFQ1RPUiBvcHRpb24gc28gZWFjaCBh
cmNoaXRlY3R1cmUNCiAgIGNhbiBlbmFibGUgdGhpcyBmZWF0dXJlIGluZGl2aWR1YWxseQ0KIC0g
QWRkZWQgdXNlci1zZWxlY3RhYmxlIENPTkZJR19TVEFDS19QUk9URUNUT1Igb3B0aW9uDQogLSBJ
bXBsZW1lbnRlZCBjb2RlIHRoYXQgc2V0cyB1cCByYW5kb20gc3RhY2sgY2FuYXJ5IGFuZCBhIGJh
c2ljDQogICBoYW5kbGVyIGZvciBzdGFjayBwcm90ZWN0b3IgZmFpbHVyZXMNCg0KU3RhY2sgZ3Vh
cmQgdmFsdWUgaXMgaW5pdGlhbGl6ZWQgaW4gdGhyZWUgcGhhc2VzOg0KDQoxLiBQcmUtZGVmaW5l
ZCByYW5kb21seS1zZWxlY3RlZCB2YWx1ZS4NCg0KMi4gRWFybHkgdXNlIG9mIGxpbmVhciBjb25n
cnVlbnQgcmFuZG9tIG51bWJlciBnZW5lcmF0b3IuIEl0IHJlbGllcyBvbg0KZ2V0X2N5Y2xlcygp
IGJlaW5nIGF2YWlsYWJsZSB2ZXJ5IGVhcmx5LiBJZiBnZXRfY3ljbGVzKCkgcmV0dXJucyB6ZXJv
LA0KaXQgd291bGQgbGVhdmUgcHJlLWRlZmluZWQgdmFsdWUgZnJvbSB0aGUgcHJldmlvdXMgc3Rl
cC4gRXZlbiB3aGVuDQpnZXRfY3ljbGVzKCkgaXMgYXZhaWxhYmxlLCBpdCdzIHJldHVybiB2YWx1
ZSBtYXkgYmUgZWFzaWx5IHByZWRpY3RlZCwNCmVzcGVjaWFsbHkgb24gZW1iZWRkZWQgc3lzdGVt
cywgd2hlcmUgYm9vdCB0aW1lIGlzIHF1aXRlIGNvbnNpc3RlbnQuDQoNCjMuIEFmdGVyIGh5cGVy
dmlzb3IgaXMgc3VmZmljaWVudGx5IGluaXRpYWxpemVkLCBzdGFjayBndWFyZCBjYW4gYmUNCnNl
dC11cCB3aXRoIGdldF9yYW5kb20oKSBmdW5jdGlvbiwgd2hpY2ggaXMgZXhwZWN0ZWQgdG8gcHJv
dmlkZSBiZXR0ZXINCnJhbmRvbW5lc3MuDQoNCkFsc28gdGhpcyBwYXRjaCBhZGRzIGNvbW1lbnQg
dG8gYXNtLWdlbmVyaWMvcmFuZG9tLmggYWJvdXQgc3RhY2sNCnByb3RlY3RvciBkZXBlbmRlbmN5
IG9uIGl0Lg0KDQpTaWduZWQtb2ZmLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2Jh
YmNodWtAZXBhbS5jb20+DQoNCi0tLQ0KDQpDaGFuZ2VzIGluIHYzOg0KIC0gRml4ZWQgY29kaW5n
IHN0eWxlIGluIHN0YWNrLXByb3RlY3Rvci5oDQogLSBFeHRlbmRlZCBwYW5pYygpIG1lc3NhZ2UN
CiAtIEluY2x1ZGVkIG1pc3NlZCByYW5kb20uaA0KIC0gUmVuYW1lZCBLY29uZmlnIG9wdGlvbg0K
IC0gVXNlZCBBbmRyZXcncyBzdWdnZXN0aW9uIGZvciB0aGUgS2NvbmZpZyBoZWxwIHRleHQNCiAt
IEFkZGVkICJhc21saW5rYWdlIiBhdHRyaWJ1dGUgdG8gX19zdGFja19jaGtfZmFpbCgpIHRvIG1h
a2UgRWNsYWlyDQogaGFwcHkNCiAtIEluaXRpYWwgc3RhY2sgZ3VhcmQgdmFsdWUgaXMgcmFuZG9t
DQogLSBBZGRlZCBMQ0cgdG8gZ2VuZXJhdGUgc3RhY2sgZ3VhcmQgdmFsdWUgYXQgZWFybHkgYm9v
dCBzdGFnZXMNCiAtIEFkZGVkIGNvbW1lbnQgdG8gYXNtLWdlbmVyaWMvcmFuZG9tLmggYWJvdXQg
ZGVwZW5kZW5jaWVzDQogLSBFeHRlbmRlZCB0aGUgY29tbWl0IG1lc3NhZ2UNCg0KQ2hhbmdlcyBp
biB2MjoNCiAtIE1vdmVkIGNoYW5nZXMgdG8gRU1CRURERURfRVhUUkFfQ0ZMQUdTIGludG8gc2Vw
YXJhdGUgcGF0Y2gNCiAtIFJlbmFtZWQgc3RhY2tfcHJvdGVjdG9yLmMgdG8gc3RhY2stcHJvdGVj
dG9yLmMNCiAtIFJlbmFtZWQgc3RhY2tfcHJvdGVjdG9yLmggdG8gc3RhY2stcHJvdGVjdG9yLmgN
CiAtIFJlbW92ZWQgI2lmZGVmIENPTkZJR19YODYgaW4gc3RhY2stcHJvdGVjdG9yLmgNCiAtIFVw
ZGF0ZWQgY29tbWVudCBpbiBzdGFjay1wcm90ZWN0b3IuaA0KICAgKGFsc28sIHdlIGNhbid0IGNh
bGwgYm9vdF9zdGFja19jaGtfZ3VhcmRfc2V0dXAoKSBmcm9tIGFzbSBjb2RlIGluDQogICBnZW5l
cmFsIGNhc2UsIGJlY2F1c2UgaXQgY2FsbHMgZ2V0X3JhbmRvbSgpIGFuZCBnZXRfcmFuZG9tKCkg
bWF5DQogICBkZXBlbmQgaW4gcGVyX2NwdSBpbmZyYXN0cnVjdHVyZSwgd2hpY2ggaXMgaW5pdGlh
bGl6ZWQgbGF0ZXIpDQogLSBGaXhlZCBjb2Rpbmcgc3R5bGUNCiAtIE1vdmVkIENPTkZJR19TVEFD
S19QUk9URUNUT1IgaW50byBuZXdseSBhZGRlZCAiQ29tcGlsZXIgb3B0aW9ucyINCiBzdWJtZW51
DQogLSBNYXJrZWQgX19zdGFja19jaGtfZ3VhcmQgYXMgX19yb19hZnRlcl9pbml0DQotLS0NCiB4
ZW4vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgfCAgNCArKysNCiB4ZW4vY29tbW9uL0tj
b25maWcgICAgICAgICAgICAgICAgfCAxNSArKysrKysrKysrDQogeGVuL2NvbW1vbi9NYWtlZmls
ZSAgICAgICAgICAgICAgIHwgIDEgKw0KIHhlbi9jb21tb24vc3RhY2stcHJvdGVjdG9yLmMgICAg
ICB8IDQ3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCiB4ZW4vaW5jbHVkZS9hc20t
Z2VuZXJpYy9yYW5kb20uaCAgfCAgNSArKysrDQogeGVuL2luY2x1ZGUveGVuL3N0YWNrLXByb3Rl
Y3Rvci5oIHwgMzAgKysrKysrKysrKysrKysrKysrKysNCiA2IGZpbGVzIGNoYW5nZWQsIDEwMiBp
bnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9jb21tb24vc3RhY2stcHJvdGVj
dG9yLmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2luY2x1ZGUveGVuL3N0YWNrLXByb3RlY3Rv
ci5oDQoNCmRpZmYgLS1naXQgYS94ZW4vTWFrZWZpbGUgYi94ZW4vTWFrZWZpbGUNCmluZGV4IDM0
ZWQ4YzBmYzcuLjBkZTAxMDFmZDAgMTAwNjQ0DQotLS0gYS94ZW4vTWFrZWZpbGUNCisrKyBiL3hl
bi9NYWtlZmlsZQ0KQEAgLTQzMiw3ICs0MzIsMTEgQEAgZWxzZQ0KIENGTEFHU19VQlNBTiA6PQ0K
IGVuZGlmDQogDQoraWZlcSAoJChDT05GSUdfU1RBQ0tfUFJPVEVDVE9SKSx5KQ0KK0NGTEFHUyAr
PSAtZnN0YWNrLXByb3RlY3Rvcg0KK2Vsc2UNCiBDRkxBR1MgKz0gLWZuby1zdGFjay1wcm90ZWN0
b3INCitlbmRpZg0KIA0KIGlmZXEgKCQoQ09ORklHX0xUTykseSkNCiBDRkxBR1MgKz0gLWZsdG8N
CmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL0tjb25maWcgYi94ZW4vY29tbW9uL0tjb25maWcNCmlu
ZGV4IDkwMjY4ZDkyNDkuLjU2NzYzMzlhNjYgMTAwNjQ0DQotLS0gYS94ZW4vY29tbW9uL0tjb25m
aWcNCisrKyBiL3hlbi9jb21tb24vS2NvbmZpZw0KQEAgLTg2LDYgKzg2LDkgQEAgY29uZmlnIEhB
U19VQlNBTg0KIGNvbmZpZyBIQVNfVk1BUA0KIAlib29sDQogDQorY29uZmlnIEhBU19TVEFDS19Q
Uk9URUNUT1INCisJYm9vbA0KKw0KIGNvbmZpZyBNRU1fQUNDRVNTX0FMV0FZU19PTg0KIAlib29s
DQogDQpAQCAtMjEzLDYgKzIxNiwxOCBAQCBjb25maWcgU1BFQ1VMQVRJVkVfSEFSREVOX0xPQ0sN
CiANCiBlbmRtZW51DQogDQorbWVudSAiQ29tcGlsZXIgb3B0aW9ucyINCisNCitjb25maWcgU1RB
Q0tfUFJPVEVDVE9SDQorCWJvb2wgIlN0YWNrIHByb3RlY3RvciINCisJZGVwZW5kcyBvbiBIQVNf
U1RBQ0tfUFJPVEVDVE9SDQorCWhlbHANCisJICBFbmFibGUgdGhlIFN0YWNrIFByb3RlY3RvciBj
b21waWxlciBoYXJkZW5pbmcgb3B0aW9uLiBUaGlzIGluc2VydHMgYQ0KKwkgIGNhbmFyeSB2YWx1
ZSBpbiB0aGUgc3RhY2sgZnJhbWUgb2YgZnVuY3Rpb25zLCBhbmQgcGVyZm9ybXMgYW4gaW50ZWdy
aXR5DQorCSAgY2hlY2sgb24gZXhpdC4NCisNCitlbmRtZW51DQorDQogY29uZmlnIERJVF9ERUZB
VUxUDQogCWJvb2wgIkRhdGEgSW5kZXBlbmRlbnQgVGltaW5nIGRlZmF1bHQiDQogCWRlcGVuZHMg
b24gSEFTX0RJVA0KZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vTWFrZWZpbGUgYi94ZW4vY29tbW9u
L01ha2VmaWxlDQppbmRleCBiMjc5YjA5YmZiLi5jZWI1YjJmMzJiIDEwMDY0NA0KLS0tIGEveGVu
L2NvbW1vbi9NYWtlZmlsZQ0KKysrIGIveGVuL2NvbW1vbi9NYWtlZmlsZQ0KQEAgLTQ1LDYgKzQ1
LDcgQEAgb2JqLXkgKz0gc2h1dGRvd24ubw0KIG9iai15ICs9IHNvZnRpcnEubw0KIG9iai15ICs9
IHNtcC5vDQogb2JqLXkgKz0gc3BpbmxvY2subw0KK29iai0kKENPTkZJR19TVEFDS19QUk9URUNU
T1IpICs9IHN0YWNrLXByb3RlY3Rvci5vDQogb2JqLXkgKz0gc3RvcF9tYWNoaW5lLm8NCiBvYmot
eSArPSBzeW1ib2xzLm8NCiBvYmoteSArPSB0YXNrbGV0Lm8NCmRpZmYgLS1naXQgYS94ZW4vY29t
bW9uL3N0YWNrLXByb3RlY3Rvci5jIGIveGVuL2NvbW1vbi9zdGFjay1wcm90ZWN0b3IuYw0KbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAwMDAuLjkyMjUxMTU1NWYNCi0tLSAvZGV2
L251bGwNCisrKyBiL3hlbi9jb21tb24vc3RhY2stcHJvdGVjdG9yLmMNCkBAIC0wLDAgKzEsNDcg
QEANCisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5DQorI2luY2x1ZGUg
PHhlbi9pbml0Lmg+DQorI2luY2x1ZGUgPHhlbi9saWIuaD4NCisjaW5jbHVkZSA8eGVuL3JhbmRv
bS5oPg0KKyNpbmNsdWRlIDx4ZW4vdGltZS5oPg0KKw0KKy8qDQorICogSW5pdGlhbCB2YWx1ZSBp
cyBjaG9zZW4gYnkgYSBmYWlyIGRpY2Ugcm9sbC4NCisgKiBJdCB3aWxsIGJlIHVwZGF0ZWQgZHVy
aW5nIGJvb3QgcHJvY2Vzcy4NCisgKi8NCisjaWYgQklUU19QRVJfTE9ORyA9PSAzMg0KK3Vuc2ln
bmVkIGxvbmcgX19yb19hZnRlcl9pbml0IF9fc3RhY2tfY2hrX2d1YXJkID0gMHhkZDJjYzkyN1VM
Ow0KKyNlbHNlDQordW5zaWduZWQgbG9uZyBfX3JvX2FmdGVyX2luaXQgX19zdGFja19jaGtfZ3Vh
cmQgPSAweDJkODUzNjA1YTRkOWEwOWNVTDsNCisjZW5kaWYNCisNCisvKiBUaGlzIGZ1bmN0aW9u
IHNob3VsZCBiZSBjYWxsZWQgZnJvbSBBU00gb25seSAqLw0KK3ZvaWQgX19pbml0IGFzbWxpbmth
Z2UgYm9vdF9zdGFja19jaGtfZ3VhcmRfc2V0dXBfZWFybHkodm9pZCkNCit7DQorICAgIC8qDQor
ICAgICAqIExpbmVhciBjb25ncnVlbnQgZ2VuZXJhdG9yIChYX24rMSA9IFhfbiAqIGEgKyBjKS4N
CisgICAgICoNCisgICAgICogQ29uc3RhbnQgaXMgdGFrZW4gZnJvbSAiVGFibGVzIE9mIExpbmVh
ciBDb25ncnVlbnRpYWwNCisgICAgICogR2VuZXJhdG9ycyBPZiBEaWZmZXJlbnQgU2l6ZXMgQW5k
IEdvb2QgTGF0dGljZSBTdHJ1Y3R1cmUiIGJ5DQorICAgICAqIFBpZXJyZSBM4oCZRWN1eWVyLg0K
KyAgICAgKi8NCisjaWYgQklUU19QRVJfTE9ORyA9PSAzMg0KKyAgICBjb25zdCB1bnNpZ25lZCBs
b25nIGEgPSAyODkxMzM2NDUzVUw7DQorI2Vsc2UNCisgICAgY29uc3QgdW5zaWduZWQgbG9uZyBh
ID0gMjg2MjkzMzU1NTc3Nzk0MTc1N1VMOw0KKyNlbmRpZg0KKyAgICBjb25zdCB1bnNpZ25lZCBs
b25nIGMgPSAxOw0KKw0KKyAgICB1bnNpZ25lZCBsb25nIGN5Y2xlcyA9IGdldF9jeWNsZXMoKTsN
CisNCisgICAgLyogVXNlIHRoZSBpbml0aWFsIHZhbHVlIGlmIHdlIGNhbid0IGdlbmVyYXRlIHJh
bmRvbSBvbmUgKi8NCisgICAgaWYgKCAhY3ljbGVzICkNCisJICAgIHJldHVybjsNCisNCisgICAg
X19zdGFja19jaGtfZ3VhcmQgPSBjeWNsZXMgKiBhICsgYzsNCit9DQorDQordm9pZCBhc21saW5r
YWdlIF9fc3RhY2tfY2hrX2ZhaWwodm9pZCkNCit7DQorICAgIHBhbmljKCJTdGFjayBQcm90ZWN0
b3IgaW50ZWdyaXR5IHZpb2xhdGlvbiBpZGVudGlmaWVkIGluICVwc1xuIiwNCisJICBfX2J1aWx0
aW5fcmV0dXJuX2FkZHJlc3MoMCkpOw0KK30NCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20t
Z2VuZXJpYy9yYW5kb20uaCBiL3hlbi9pbmNsdWRlL2FzbS1nZW5lcmljL3JhbmRvbS5oDQppbmRl
eCBkMGQzNWRkMjE3Li43ZjZkODc5MGM0IDEwMDY0NA0KLS0tIGEveGVuL2luY2x1ZGUvYXNtLWdl
bmVyaWMvcmFuZG9tLmgNCisrKyBiL3hlbi9pbmNsdWRlL2FzbS1nZW5lcmljL3JhbmRvbS5oDQpA
QCAtMiw2ICsyLDExIEBADQogI2lmbmRlZiBfX0FTTV9HRU5FUklDX1JBTkRPTV9IX18NCiAjZGVm
aW5lIF9fQVNNX0dFTkVSSUNfUkFORE9NX0hfXw0KIA0KKy8qDQorICogV2hlbiBpbXBsZW1lbnRp
bmcgYXJjaF9nZXRfcmFuZG9tKCksIHBsZWFzZSBtYWtlIHN1cmUgdGhhdA0KKyAqIGl0IGNhbiBw
cm92aWRlIHJhbmRvbSBkYXRhIGJlZm9yZSBzdGFjayBwcm90ZWN0b3IgaXMgaW5pdGlhbGl6ZWQN
CisgKiAoaS5lLiBiZWZvcmUgYm9vdF9zdGFja19jaGtfZ3VhcmRfc2V0dXAoKSBpcyBjYWxsZWQp
Lg0KKyAqLw0KIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IGFyY2hfZ2V0X3JhbmRvbSh2b2lk
KQ0KIHsNCiAgICAgcmV0dXJuIDA7DQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3N0YWNr
LXByb3RlY3Rvci5oIGIveGVuL2luY2x1ZGUveGVuL3N0YWNrLXByb3RlY3Rvci5oDQpuZXcgZmls
ZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMC4uYmQzMjRkOTAwMw0KLS0tIC9kZXYvbnVs
bA0KKysrIGIveGVuL2luY2x1ZGUveGVuL3N0YWNrLXByb3RlY3Rvci5oDQpAQCAtMCwwICsxLDMw
IEBADQorLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSAqLw0KKw0KKyNp
Zm5kZWYgWEVOX19TVEFDS19QUk9URUNUT1JfSA0KKyNkZWZpbmUgWEVOX19TVEFDS19QUk9URUNU
T1JfSA0KKw0KKyNpZmRlZiBDT05GSUdfU1RBQ0tfUFJPVEVDVE9SDQorDQorI2luY2x1ZGUgPHhl
bi9yYW5kb20uaD4NCisNCitleHRlcm4gdW5zaWduZWQgbG9uZyBfX3N0YWNrX2Noa19ndWFyZDsN
CisNCisvKg0KKyAqIFRoaXMgZnVuY3Rpb24gc2hvdWxkIGJlIGFsd2F5cyBpbmxpbmVkLiBBbHNv
IGl0IHNob3VsZCBiZSBjYWxsZWQNCisgKiBmcm9tIGEgZnVuY3Rpb24gdGhhdCBuZXZlciByZXR1
cm5zIG9yIGEgZnVuY3Rpb24gdGhhdCBoYXMNCisgKiBzdGFjay1wcm90ZWN0b3IgZGlzYWJsZWQu
DQorICovDQorc3RhdGljIGFsd2F5c19pbmxpbmUgdm9pZCBib290X3N0YWNrX2Noa19ndWFyZF9z
ZXR1cCh2b2lkKQ0KK3sNCisgICAgX19zdGFja19jaGtfZ3VhcmQgPSBnZXRfcmFuZG9tKCk7DQor
ICAgIGlmIChCSVRTX1BFUl9MT05HID09IDY0KQ0KKyAgICAgICAgX19zdGFja19jaGtfZ3VhcmQg
fD0gKCh1bnNpZ25lZCBsb25nKWdldF9yYW5kb20oKSkgPDwgMzI7DQorfQ0KKw0KKyNlbHNlDQor
DQorc3RhdGljIGlubGluZSB2b2lkIGJvb3Rfc3RhY2tfY2hrX2d1YXJkX3NldHVwKHZvaWQpIHt9
DQorDQorI2VuZGlmIC8qIENPTkZJR19TVEFDS19QUk9URUNUT1IgICovDQorDQorI2VuZGlmIC8q
IFhFTl9fU1RBQ0tfUFJPVEVDVE9SX0ggKi8NCi0tIA0KMi40Ny4xDQo=

