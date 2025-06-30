Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C265EAED2CF
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 05:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028815.1402500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uW4tX-0006xY-Iw; Mon, 30 Jun 2025 03:09:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028815.1402500; Mon, 30 Jun 2025 03:09:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uW4tX-0006wA-C4; Mon, 30 Jun 2025 03:09:23 +0000
Received: by outflank-mailman (input) for mailman id 1028815;
 Mon, 30 Jun 2025 03:09:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zolI=ZN=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uW4tV-0006vH-Cf
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 03:09:21 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c77e34b-555f-11f0-a312-13f23c93f187;
 Mon, 30 Jun 2025 05:09:19 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SA1PR12MB6894.namprd12.prod.outlook.com (2603:10b6:806:24d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Mon, 30 Jun
 2025 03:09:15 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8880.030; Mon, 30 Jun 2025
 03:09:15 +0000
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
X-Inumbo-ID: 9c77e34b-555f-11f0-a312-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U5uaPrT0C6oLiDedfc/vhHfJbmINuzz+eksGe2QEQ8n4ji34dLi+4uSV26uZapgfY7NVi5JBXw5z7oC7Pf2Y9UfCRHLPCwlNKTQsyWwlSgiI1CP2rVwbEfgNqwuWISi2TO9VjbjGhYXzDWoTN15RmQP8IozM0r3Sof5ZqtUER6tZbW2nujr7/4abdclCguAU6ruK3zwu+Wyg7oX3YW/NBLbjvFNy4EIFBpjqqM/ACN8IkVM8jq7b/4oBqdAyP5KRoQwq5Pzdw5iMWF7JpqONeNfGb9yBpLngJ2QdZIFW5vgEBtr0XFQS69WDG6ARDKndzPdwf6OQteYsVoLqwipWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyxTUt46OegQF9TSMWc5zsM2ga42KdNWQo/TuuOPKgw=;
 b=gXLfUVptOwWtUBda4GBz84w/5dTGhPLBxv0zc9YVk5suSa/WpWN+hGYDnsENuOTY8V5N6ROPvnVEOmUgUuuU9ryjgEl3rHq/5m0Kkcir+fTrl24zTcSngNRQL8jtfU+Gp6a+94oBodEaj4jwYAeggSQ+Vv3Jw52PkRYk2efhcxClPA6mQjiTKlzSnhGRiSBmoboE4Bhos4K1Hs70DghooVukRuVliithrUzdbPNoqgQUIl62nvdLR3mRNMuHQmykJJ2B+8M/hNYOsgho8OiEvPOfUi2aq4xRKQPx5oHg3mUsCqRVkK7QchiV0cFgunq6UUD0it0rjBYJtEDoHtkQ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyxTUt46OegQF9TSMWc5zsM2ga42KdNWQo/TuuOPKgw=;
 b=IFAQbJwRK1LKv3dNz9AWKlCy0PkPSspTbcueQ7JUpb11jIaDLBv888x/36MyNUSE5B2Bm6f4RL2qrJ04FFBLEiEZIN6jufPPKc49PHHQKj4lsyOoxvehd/lCI1BAFuasEmJhYJmyz/qazRXAZESkFd9LivY8IQfR6n6fEPI/vUM=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Orzel,
 Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Dario Faggioli <dfaggioli@suse.com>, Juergen
 Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, Nathan Studer
	<nathan.studer@dornerworks.com>, Stewart Hildebrand <stewart@stew.dk>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"xen-devel@dornerworks.com" <xen-devel@dornerworks.com>
Subject: RE: [PATCH v5 00/18] xen: introduce CONFIG_SYSCTL
Thread-Topic: [PATCH v5 00/18] xen: introduce CONFIG_SYSCTL
Thread-Index: AQHb3onFdnXviGLMzkyWb5d6+OoXc7QVpzqAgAV0OGA=
Date: Mon, 30 Jun 2025 03:09:15 +0000
Message-ID:
 <DM4PR12MB8451B314C7DAAC617CBF4BA8E146A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250616064128.581164-1-Penny.Zheng@amd.com>
 <2e35ed6d-f9a5-48c7-8e81-6f5daa5c16d7@suse.com>
In-Reply-To: <2e35ed6d-f9a5-48c7-8e81-6f5daa5c16d7@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-06-30T03:08:43.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SA1PR12MB6894:EE_
x-ms-office365-filtering-correlation-id: f561c940-eb19-46a6-1d16-08ddb7837ef2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dWd4Y2VkbThxNVRRL1VIRXRRK29jajE1SitIN0dSS0ZFK2FCQUltcWZTVE5q?=
 =?utf-8?B?aEEzNUNiMlRKUWdrS2o3VGZOSGFCczFUMER2emRaMlV3SWxCTXRHYnkzSEZ4?=
 =?utf-8?B?c0pTVXEzdE5MZG1rL0VSV2NReGI5M0VuSUsxNHY1MWxiRHpKYUUreTVHRW0w?=
 =?utf-8?B?RW5zZVFRUXJyOEhZbXUzUTZJWWpuOXVuK3ZXRE1TNE1rdjRpQzJZeWZGcFRV?=
 =?utf-8?B?Y3d4TUptejU4UXkvMnMxMXZiajNGZGNQcnhiT0ZrcGpSVkM0NFZWSUZUY2RL?=
 =?utf-8?B?K3poTHhvNEFrZndiUTZQRGJPRiszNWlFU2VBc1E5UFJXSXZlRGRWdTNZNnA5?=
 =?utf-8?B?VDBnMlJ0MExNQi9LOUNuM0J0NVo4dURrV0hMQnlRelV5ekRDZmZnRXdrbWVK?=
 =?utf-8?B?bUhQeG1KMU5mR3pNMGV5VmcwWHNzN0lUajNwN0FhQXNNRWtRUGFoZ2RkV21D?=
 =?utf-8?B?MTB1OEkzWUVoQWlHcU9QREJ5NTdyQm5YYWRUd1Bxc0oveHJJbkJFdkdjZGd4?=
 =?utf-8?B?RzE5ekJNbXVPemVvUVpuUkwwZSttV3Jac01BbTJ1Yk14azQ2V2VWWkFlbTg4?=
 =?utf-8?B?RDUrKzNRSzRuR1h3Q0JMLzkyQ3F3a2NNamFPMGxNaXRIWFlmckdjdXljRFZO?=
 =?utf-8?B?NWV3RjJIRE9uVzRaVnJ2UFR0ZVlvaGhOS0RNOTJmaVFqWXY2cFZ0Zmtmdm0r?=
 =?utf-8?B?Y3NTblR1ZjBxQ0ZBaDMrR1VEVmxQaGtRRGtmbVRYOVlzdkhaVUhQNTJ0d0hy?=
 =?utf-8?B?ckNLUWVoaE5XOEJIUkxMR1liSmcxdVZ0RkpEWWdRNE1HZlBrR1NDRE5uUUdz?=
 =?utf-8?B?UEgwZFR3WW5uR2R3Sm9wVitGZHd4UzlBT0RQN2R5M2hrbHJzVkc4eWFFbEtR?=
 =?utf-8?B?OXNia0FlT29zU3NOUlBqNlk1MDloaE9KNmRTT29ZN3YvTGpKTktoVTcydVlv?=
 =?utf-8?B?NEVPRVFiSkw3K081bWd6YldFSlZEQWpudnFvVS9TUlRaeHR0ZDhFZ21LWnky?=
 =?utf-8?B?TDhmcWRIMHhkMUZRY1hZU0xES1MwMXFhSytiM282eXpjVEZLeHFMemcvUzF5?=
 =?utf-8?B?cGNadE9veVViNWxMekhieDg4SXVHQ2tNWE5rS05pTWdxYnpFZDArTmZjamIz?=
 =?utf-8?B?ZHBYUDdjcTJocS9KZEF0bm1wUndZWHJPZUNDSU54N3lOZDc0dzdGYzFzL3N5?=
 =?utf-8?B?WE0vVlYxNGVEc3Y3SXBtZDNIY3V2ODF6SXNCSjV0QXZ6c1grN0xkUm81MmRP?=
 =?utf-8?B?QVVNaFp0YTlWQjVhMlhueldhOUEvNXZCYWFOaW91STczWFZFU0x0aG5BV0VU?=
 =?utf-8?B?elJ2N3hUeFJzRXNpYmkrdGVWSGVYdUd3Qm5QTVJLTEs4cEJvNjQ1TnhKNVdw?=
 =?utf-8?B?K2U5QURLSzFhTmlzRU5IWlVNSkVhTmorOGxaelpyVlBmVE9KaEVGdlVwWHhw?=
 =?utf-8?B?UFRxcGNJcm1MVTYzTzRjSmFXY3IyQWNCTnF2a2tjbGdzNHExZjRVRnZ4UmRu?=
 =?utf-8?B?QUV5YVRoMTJXaTZBSkR3RW1TN2xNRG0zWlRyZ2pKOEJVd2hLcGVVS09vNDRr?=
 =?utf-8?B?clo3eGhCUXlaZ29yTXZPOGxkb0sydDI3M3RKblFaL0gydDM5aTFTb29yTXgw?=
 =?utf-8?B?SlFuWmxvVW9Uc3A4Rmhzak95ZXFpWVlDbTNsN0pMV0pXc1pzWnlSL2g0UnNM?=
 =?utf-8?B?REpqQWFBN1RGbW1Qb3Q5K2E4K3g1bklHejdvbXZCUzJQMUpHelNDNkQyUEJy?=
 =?utf-8?B?S2dJQjlXVzVoU3Z6TGVjOUdhS1ZNeWxMZGQxRkJjSnhUdXFBUXk2NkhoQ29r?=
 =?utf-8?B?eDk2YkJZSUdlQWlEU2p5a2ZKcW1QSjlEOTNoV29LNVdIVDNvV0tjUXoyeTZD?=
 =?utf-8?B?WXhzM0hoMDhMaW96d3BPd05tN2dhVENtQmdoRGdUU3dPcTZXQ2FwWjlVRnFY?=
 =?utf-8?B?RE1RK3VIcHZJZDhDUjdGc2lQSFI2TU1lZEFYNkh1ajNCY3FuRXVxMzlBVWdK?=
 =?utf-8?Q?r4ojxQY8iSpL4xpnTEumheSOOY3APk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c2p4MXdNdjR2S014dmRkb1BkTmkzMFVuajJnMDk4MzMweWYzZ1YvMlZxYzF5?=
 =?utf-8?B?SEN6ZDhldXgyTWlCUTRxckdLSnh3VlR1clJQSnU0ZUdEaVFEc3dod0JUZ3A2?=
 =?utf-8?B?Mi9JR1RXczEvb1ZuNEFqV2xaQTZXdFpwaTl0N2U0RkkvMlhha1pZTzN2MEta?=
 =?utf-8?B?UXRzdkI5c3ZCb1hndXA2ZXErTERsUEN5U2dielVqMDUyWVJUQXRhbjBLbkgx?=
 =?utf-8?B?ZS9uUzBiWHpDbC9KVm5YUklzMkUza2Fta3A4K2RRdFQrZzloNmpOa0dObm5v?=
 =?utf-8?B?ZmlGSWZoZGlpOXBnZjB4eDVlcUhiVk9kY2JWVy92Sk16aDVRVWVFNk4xTUlz?=
 =?utf-8?B?OEpZZjQ1aXZxRkxXejV5MVQ0Z3BFRE9odEdLandpdExremQyM0VsdDcwNndU?=
 =?utf-8?B?UVpLeFFyZFVaUytIZ1VKVzh0VXdLTmtKUjBTRS9LckwranJrang3Z2J6Q2s0?=
 =?utf-8?B?WlVyZ3dlcTRGREFQMys1N3JGQ3QwTkVZOGczZzBYcGEwZjNuQWFXRHlpSjVl?=
 =?utf-8?B?bkZneHZ2WE5oQ09DNE9WQW9CTGp1cWtwMFZMbEZIenBVN3ZWRU9SMHVhK21M?=
 =?utf-8?B?UEcxMTFqcUZSMHowd1ZyOTZxdFA5d2FkK2plQmViUktvZ1VBOVF3eTl4Q0hE?=
 =?utf-8?B?djFvdVk5bGZndFBabjdaQ0o3TXIzY3FwSkcyNTExSUZDcE90TldBMEFHbEFO?=
 =?utf-8?B?aE12dlNrbExPb016cEFjN2J3V29DTGxZY0xKU1RiZkt0WlZWUWgwMWRMbkk5?=
 =?utf-8?B?UHhQRThZdkhGQnZobCtNeDZXNk9qaFk1OTlnTUtibTdUUGJxMnpPZnJqb0hJ?=
 =?utf-8?B?eWlQWU9WYlBJanNUQlEvWGIxZkV0TUczZzFOVTR6aGFCMTl3RlRhWjM5UWJq?=
 =?utf-8?B?VmoyT1NiV2F0UVJHOWIzZDhRMWZTUzhTY0JYYVN3ZUNQMndKVndMQ3A1bTd2?=
 =?utf-8?B?T3FOSGxPbTlyOUNEVW56RXAvYjhodm1ldEdET3ViWnpORDlxRHN1dFA3S1g1?=
 =?utf-8?B?MmVtY3VtbnJNODFhUWE5RlR3ekxKUlc4a0lBRDlPUWkvaDJCQVJjYTZPNGFR?=
 =?utf-8?B?bjFyTXZhSk1RT0tPWXFkMzV4Nys5TlNOeDYwY0Z3eTZtTUNYOFFlREJzLzRB?=
 =?utf-8?B?d0IzYkF2dDBmUmxtRWw4TGdnckVYcEwvb3F1V1BPb0RIQ2daWkk3MThtQ1Mz?=
 =?utf-8?B?RnlLQVc0UXdlQ1JueWZlWFF1QjlNSjQwM001bEt4STVjbENNbk9sQ0MweWlo?=
 =?utf-8?B?ZE5wSkQwL21oTkR4ak9WbHBUMzREbXNvVzNPVWhPd0tXNkhEMTZtUWcvRXdV?=
 =?utf-8?B?RDBHblBvTU51d1UvREhHRnMzSU9Cc0c3NkNOMHdwL0lWRGtRNy9WVHhEVVNy?=
 =?utf-8?B?ekF0M1lmUnd4ZXRXclN4RWxQa0pWSFNFM2NmQlBmU2Z0MmhVOFRIVmlMeDdt?=
 =?utf-8?B?L2QxUjgyU3Z5TlU2dU5JUzhCVHBHcjNkTDJJY0RCWmw5RkN5dGdUYWkzK0FQ?=
 =?utf-8?B?TzJ1Q1lKTEVjbkR2WFIwSExQdGxIWFU4cVpseFJTSjl3NEJjUXBlL3FKWDlu?=
 =?utf-8?B?VXVreW5PVWg1YmpSN1cwY0kvLzl4aDNKTmZYRXk0NWNtczBtVzBzV3JzNzlZ?=
 =?utf-8?B?UkRlVmwxSEN1L1FSaHpmT1JSQXpTMEZyTFhUTmM1aUpGYTFJcjBXVk1MdVpp?=
 =?utf-8?B?eisxMDdPTlRPQ0ZEUnlWNlU0SUxZUVVpdytVSTQyVytwb1hDb3pmd0JRQVJD?=
 =?utf-8?B?QjRLcFlhU0llZ2RDbzRLeW1aeDhFalFZZ1FzY2dpNWNLWUoweStNUE13UjZJ?=
 =?utf-8?B?U0xmclZBanJ5aU5hdlE2MkcrTjVGRURPa2YweEFFWTJWVHBCR05zQTZSbkxI?=
 =?utf-8?B?Q1dRd1BKZk5OS1NvR0VlWlhaS3hrdTgwVVgrN2ZPNHlIR0w3cHJzcEovTjhT?=
 =?utf-8?B?elJXTmtFTGJzenI5aDR2Wk5oUFZpTFc1NEN6VXZLRmQ0YXlqS2xYdi9udFlE?=
 =?utf-8?B?SS94YVdxUUxOTXZkbFJvK0IvK0FZY0tkaW9xRE1SdXdnTEw3ZkpJSnJxeVc3?=
 =?utf-8?B?OGw3OUZmd1Flbkp6TUNKdjU2MDBKYitHdTRqSWIrL0NlTHJhVHNSVGFZRjBw?=
 =?utf-8?Q?A27o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f561c940-eb19-46a6-1d16-08ddb7837ef2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 03:09:15.4843
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KjQDS11aSNRFM4DGlumfx77yIFhzERIqvxsXMz30XT2MtcJbA2N6CQhxCsvIpzzljebNb49v9B25q9XdyE5TkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6894

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDI2LCAyMDI1
IDExOjUxIFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+IENj
OiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT47DQo+IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEB2YXRlcy50ZWNoPjsgT3J6
ZWwsIE1pY2hhbA0KPiA8TWljaGFsLk9yemVsQGFtZC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PjsgRGFuaWVsIFAuIFNtaXRoIDxkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29tPjsgRGFyaW8N
Cj4gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT47IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT47IEdlb3JnZQ0KPiBEdW5sYXAgPGd3ZEB4ZW5wcm9qZWN0Lm9yZz47IE5hdGhhbiBT
dHVkZXIgPG5hdGhhbi5zdHVkZXJAZG9ybmVyd29ya3MuY29tPjsNCj4gU3Rld2FydCBIaWxkZWJy
YW5kIDxzdGV3YXJ0QHN0ZXcuZGs+OyBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxiZXJ0cmFuZC5tYXJx
dWlzQGFybS5jb20+OyBWb2xvZHlteXIgQmFiY2h1aw0KPiA8Vm9sb2R5bXlyX0JhYmNodWtAZXBh
bS5jb20+OyBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpci5mcmFuY2lzQHdkYy5jb20+Ow0KPiBC
b2IgRXNobGVtYW4gPGJvYmJ5ZXNobGVtYW5AZ21haWwuY29tPjsgQ29ubm9yIERhdmlzDQo+IDxj
b25ub2pkYXZpc0BnbWFpbC5jb20+OyBPbGVrc2lpIEt1cm9jaGtvIDxvbGVrc2lpLmt1cm9jaGtv
QGdtYWlsLmNvbT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IHhlbi1kZXZl
bEBkb3JuZXJ3b3Jrcy5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAwMC8xOF0geGVuOiBp
bnRyb2R1Y2UgQ09ORklHX1NZU0NUTA0KPg0KPiBPbiAxNi4wNi4yMDI1IDA4OjQxLCBQZW5ueSBa
aGVuZyB3cm90ZToNCj4gPiBJdCBjYW4gYmUgYmVuZWZpY2lhbCBmb3Igc29tZSBkb20wbGVzcyBz
eXN0ZW1zIHRvIGZ1cnRoZXIgcmVkdWNlIFhlbg0KPiA+IGZvb3RwcmludCB2aWEgZGlzYWJsaW5n
IHNvbWUgaHlwZXJjYWxscyBoYW5kbGluZyBjb2RlLCB3aGljaCBtYXkgbm90DQo+ID4gdG8gYmUg
dXNlZCAmIHJlcXVpcmVkIGluIHN1Y2ggc3lzdGVtcy4gRWFjaCBoeXBlcmNhbGwgaGFzIGEgc2Vw
YXJhdGUNCj4gPiBvcHRpb24gdG8ga2VlcCBjb25maWd1cmF0aW9uIGZsZXhpYmxlLg0KPiA+DQo+
ID4gT3B0aW9ucyB0byBkaXNhYmxlIGh5cGVyY2FsbHM6DQo+ID4gLSBzeXNjdGwNCj4gPiAtIGRv
bWN0bA0KPiA+IC0gaHZtDQo+ID4gLSBwaHlzZGV2DQo+ID4gLSBwbGF0Zm9ybQ0KPiA+DQo+ID4g
VGhpcyBwYXRjaCBzZXJpZSBpcyBvbmx5IGZvY3VzaW5nIG9uIGludHJvZHVjaW5nIENPTkZJR19T
WVNDVEwuDQo+ID4gRGlmZmVyZW50IG9wdGlvbnMgd2lsbCBiZSBjb3ZlcmVkIGluIGRpZmZlcmVu
dCBwYXRjaCBzZXJpZS4NCj4gPg0KPiA+IEZlYXR1cmVzLCBsaWtlIExJVkVQQVRDSCwgT3Zlcmxh
eSBEVEIsIHdoaWNoIGZ1bGx5IHJlbHkgb24gc3lzY3RsIG9wLA0KPiA+IHdpbGwgYmUgd3JhcHBl
ZCB3aXRoIENPTkZJR19TWVNDVEwsIHRvIHJlZHVjZSBYZW4gZm9vdHByaW50IGFzIG11Y2ggYXMN
Cj4gcG9zc2libGUuDQo+ID4NCj4gPiBJdCBpcyBkZXJpdmVkIGZyb20gU3RlZmFubyBTdGFiZWxs
aW5pJ3MgY29tbWl0ICJ4ZW46IGludHJvZHVjZSBrY29uZmlnDQo+ID4gb3B0aW9ucyB0byBkaXNh
YmxlIGh5cGVyY2FsbHMiKA0KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC8y
MDI0MTIxOTA5MjkxNy4zMDA2MTc0LTEtU2VyZ2l5X0tpYnINCj4gPiBpa0BlcGFtLmNvbSkNCj4g
Pg0KPiA+IFBlbm55IFpoZW5nICgxNik6DQo+ID4gICB4ZW4veDg2OiByZW1vdmUgImRlcGVuZHMg
b24gIVBWX1NISU1fRVhDTFVTSVZFIg0KPiA+ICAgeGVuL3hzbTogd3JhcCBhcm91bmQgeHNtX3N5
c2N0bCB3aXRoIENPTkZJR19TWVNDVEwNCj4gPiAgIHhlbi9zeXNjdGw6IHdyYXAgYXJvdW5kIFhF
Tl9TWVNDVExfcmVhZGNvbnNvbGUNCj4gPiAgIHhlbi9zeXNjdGw6IG1ha2UgQ09ORklHX1RSQUNF
QlVGRkVSIGRlcGVuZCBvbiBDT05GSUdfU1lTQ1RMDQo+ID4gICB4ZW4vc3lzY3RsOiB3cmFwIGFy
b3VuZCBYRU5fU1lTQ1RMX3NjaGVkX2lkDQo+ID4gICB4ZW4vc3lzY3RsOiB3cmFwIGFyb3VuZCBY
RU5fU1lTQ1RMX3BlcmZjX29wDQo+ID4gICB4ZW4vc3lzY3RsOiB3cmFwIGFyb3VuZCBYRU5fU1lT
Q1RMX2xvY2twcm9mX29wDQo+ID4gICB4ZW4vcG1zdGF0OiBpbnRyb2R1Y2UgQ09ORklHX1BNX09Q
DQo+ID4gICB4ZW4vc3lzY3RsOiBpbnRyb2R1Y2UgQ09ORklHX1BNX1NUQVRTDQo+ID4gICB4ZW4v
c3lzY3RsOiB3cmFwIGFyb3VuZCBYRU5fU1lTQ1RMX3BhZ2Vfb2ZmbGluZV9vcA0KPiA+ICAgeGVu
L3N5c2N0bDogd3JhcCBhcm91bmQgWEVOX1NZU0NUTF9jcHVwb29sX29wDQo+ID4gICB4ZW4vc3lz
Y3RsOiB3cmFwIGFyb3VuZCBYRU5fU1lTQ1RMX3NjaGVkdWxlcl9vcA0KPiA+ICAgeGVuL3N5c2N0
bDogd3JhcCBhcm91bmQgWEVOX1NZU0NUTF9waHlzaW5mbw0KPiA+ICAgeGVuL3N5c2N0bDogbWFr
ZSBDT05GSUdfQ09WRVJBR0UgZGVwZW5kIG9uIENPTkZJR19TWVNDVEwNCj4gPiAgIHhlbi9zeXNj
dGw6IG1ha2UgQ09ORklHX0xJVkVQQVRDSCBkZXBlbmQgb24gQ09ORklHX1NZU0NUTA0KPiA+ICAg
eGVuL3N5c2N0bDogd3JhcCBhcm91bmQgYXJjaC1zcGVjaWZpYyBhcmNoX2RvX3N5c2N0bA0KPg0K
PiBXaGVuIHRoaW5raW5nIGFib3V0IHdoZXRoZXIgdG8gY29tbWl0IHBhcnQgb2YgdGhlIHNlcmll
cywgaXQgb2NjdXJyZWQgdG8gbWUgdGhhdCB0bw0KPiBhdm9pZCB0cmFuc2llbnRseSByZWdyZXNz
aW5nIHNoaW0gKGluIHNpemUpLCBzaG91bGRuJ3QgdGhlIGN1cnJlbnRseSAxc3QgcGF0Y2ggYmUN
Cj4gbW92ZWQgdG8gYmUgMm5kIHRvIGxhc3QsIGFuZCB0aGVuIGJlIGNvbW1pdHRlZCB0b2dldGhl
ciB3aXRoIHRoZSBsYXN0IG9uZT8gSW4gYW55DQo+IGV2ZW50IHRoZSBwbGFuIHJpZ2h0IG5vdyBp
cyB0byBjb21taXQgc29tZSBwYXRjaGVzIGZyb20gdGhlIGJlZ2lubmluZyBvZiB0aGlzDQo+IHNl
cmllcywgYnV0IHNwZWNpZmljYWxseSB3aXRob3V0IHBhdGNoIDEuIFBsZWFzZSBzaG91dCBpZiB5
b3Ugc2VlIGFueSBwcm9ibGVtIHdpdGgNCj4gdGhpcy4NCg0KVW5kZXJzdG9vZCwgZmluZSB3aXRo
IG1lDQoNCj4NCj4gSmFuDQo=

