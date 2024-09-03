Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6BC969ADC
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 12:54:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788952.1198468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slRAk-0003Z4-8Y; Tue, 03 Sep 2024 10:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788952.1198468; Tue, 03 Sep 2024 10:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slRAk-0003Vt-4A; Tue, 03 Sep 2024 10:54:06 +0000
Received: by outflank-mailman (input) for mailman id 788952;
 Tue, 03 Sep 2024 10:54:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eqql=QB=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1slRAi-0003Vm-Nk
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 10:54:04 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20625.outbound.protection.outlook.com
 [2a01:111:f403:2416::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4597680-69e2-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 12:54:03 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DM4PR12MB6445.namprd12.prod.outlook.com (2603:10b6:8:bd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 3 Sep
 2024 10:53:55 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 10:53:55 +0000
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
X-Inumbo-ID: d4597680-69e2-11ef-a0b2-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dq9UN15AaTRi1wzN+bzLk+i5PRq6lrfZOaR3kkElR7jKt/KQKq6gATz6Jomjr/188Y7H5BAMvSYVetjnqtHGaeitcKwCYb4u9GCvBj/IbE5ZbpCv7TAYzWfHuDVGRvFrQSIlXhEoz1y45xfmvtt2Ffx1I6RTDLbS6Mj4KIU8hh4xA0r/H2CYf2gWg7Q6v06MyT76Rvx+p1Sbo67WSBBUdDtzFGiloaau82gqsxyORBZIeJcKa/Iz3uSf66GxE4uxKvNjN+ALvr3TK6l+INkYy5jiB47iB103DXoiQC8AJBDwiHBm+Lj6iyMK79EaLPXWHv3VUnHh+wd45YABg12xeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPKl0a/JFfYnx7plOjt635JYYAG/NnaXGCHGIR912HI=;
 b=masVaOp2zTqp5X81AN7/6gdURUh2YK5+5k2j9TyzYEHVwfskpderRoLTb8qH9+p3nVBbF/YR0/L1TyG54YKrtR3HxTqEevgAJjdLIJJtAdE2HuQL5D9y4pJmwBTo9w8E8xBHxxi5q6jHPDDQPSPaetX0Xy00BXynNu5k7/SU7PNftJtDgGhmpe4p2z1xM01MStItCiux+wGxAmaoXOfBWbsTXMiDZx8PKTYY5WKtK4Vl7Dk9XAkrimza+JULipBZ1zYXKPXdW/LsLYw8I02dMaR3z/XOn+btx7q8BM2etlle4K+41yTHXKZ5XeWBUTqfxvC2NSRdRGXbu8vSW919gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPKl0a/JFfYnx7plOjt635JYYAG/NnaXGCHGIR912HI=;
 b=b3xk/O17YsT0hKFzyhxkWWomfzJ+Y/7eoDcGzsSOuK1VlG4GOsXja465GZggZa3uEzWtTE20qNVqAMdc858kCtFJwqTJUO3Bj+P6S28oqzc/cW5SLNOI1YEu66K8gFlZzNvVWrTYze/O4s8Vh4ShaQ97KwHDCmt1LxzSbo2PsJs=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <gwd@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v14 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Topic: [XEN PATCH v14 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Index: AQHa/c+T1Q4Qq6O9skmV9EceghcgI7JFrg2AgACIPoD//5R3AIAAnXgA
Date: Tue, 3 Sep 2024 10:53:55 +0000
Message-ID:
 <BL1PR12MB58492EE11D404B2E09DA0210E7932@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240903070424.982218-1-Jiqian.Chen@amd.com>
 <20240903070424.982218-3-Jiqian.Chen@amd.com>
 <e8db9a54-fcbf-4f4c-803e-7b11838e22a4@suse.com>
 <BL1PR12MB5849C65CAC35890158F6A32FE7932@BL1PR12MB5849.namprd12.prod.outlook.com>
 <905fe9ef-d311-4956-b862-49f2f588afcd@suse.com>
In-Reply-To: <905fe9ef-d311-4956-b862-49f2f588afcd@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7918.023)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DM4PR12MB6445:EE_
x-ms-office365-filtering-correlation-id: d50c8df0-9e37-4c09-576d-08dccc06b4c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZDdlZXBXanUvWmxCMVhzbXhyL1h1bGRnd3FwLzd5cFJPRkJ1dHkyUTFSNmpQ?=
 =?utf-8?B?SWlJcEpWVW8yejhXdTBPUXdQL1QzVkNJM2ZSYTZlMENrU3dyWDMyQms5Q2Ix?=
 =?utf-8?B?ZlZaRUxHQmI1cGtWRkpMU05qSVppWkJOQUs4RGY1LzFSc3pyZi9JUTNOQldM?=
 =?utf-8?B?NjBoTHdRaStkaVFaUUVlY01wWENoVHdyQUhxMVBhdS8rRDArZXZDRnJ3SVZm?=
 =?utf-8?B?NWFVandCUUh3TFFxK0pMYVJyVzh0eVdqR25FSHV0SG05RGI4RkhkQ2tIUEJU?=
 =?utf-8?B?NDlzME8wem1JaC9uZjQwUzE4UEdjRHhxdFhuWVpFbkpydEZsNXZlTHlGK2Ft?=
 =?utf-8?B?UWVncnpQaE0wU29XR0toVzdNQXg4MFRPek9qeTRobzRoY2NEVWRMc2pwWXcw?=
 =?utf-8?B?ZWplWlh0eTZHZkRLRWMzMU1CUENwYmhCMHRZWFhZU1o0YnVOMWtzelZKM0JD?=
 =?utf-8?B?dngwaFZxcGlkSFUyMU1Wc3BPN0FCY04yWXZJSDN5Z2N0OFZXN2xpaE5iakZ6?=
 =?utf-8?B?ejVDM3JqM1NWNTNXblNYTFVuT0xLOGNINE9IM0hUdE9wTFhxVENhVVdmeWdz?=
 =?utf-8?B?OFBpVUJ5WGJtNk9rNlg3NGJ2YlJoaGJ2UXlFTXRwNG1iWnNKUm5iQlVEUUh1?=
 =?utf-8?B?R1Z1S3o4UlJ1RDZFQUszeE5jVnpIVXhYb0pqZHlnTURQNTk3M0twenZYSDJ0?=
 =?utf-8?B?bXhNZFpSK0FGZ2Z1VzlXN05IUndiUGxxUTY5VDRqNFZwYW9xZjAySmU1dnNF?=
 =?utf-8?B?YlIzM0doUmJOR0RsdnAzVmRCTDJkVmtsbEJlUklmK0R2YnhNM3lQYzNzLzYr?=
 =?utf-8?B?T1ZLZGlleVlsT1lNNUFzN0NvS09PMXlpWXJVbzBWK0htZkRObC9aL21PQ3Vr?=
 =?utf-8?B?QUtkYmNnSVBmb2hHd3RPZFQxTnJhZU1JSjd4ajR0STNrY0JJZUtORHVWR2lh?=
 =?utf-8?B?aE5HaUtkcGU0aWlrT1JQYW9tUElvdlFtMkxUa1NnS1V0V1VUQUh0dnVhemdo?=
 =?utf-8?B?RjZRdU4rRjdaTi9adU5EZ1Mya3R0TXJUNVRlaHgwQXhvR2tZaWlDbEZhL1VU?=
 =?utf-8?B?UlRnNVlYcFlCMjlkUmRqang1U2tsaUdiNGQyYVM1ZlptTG4wOGpqL0ZMdmM3?=
 =?utf-8?B?QnUzOTVwV2NnZHpoelAydXZ3UmxNTnI3MGlDZG1BNXhmdnNZdndZR21pc3FS?=
 =?utf-8?B?cTFPRE54cUREZHlQc2p3QjRhb0tHNUhwRHgxL3ZjVXlnd1lNMWJEZGV4U1Nt?=
 =?utf-8?B?d1lwN0tyNzcxQ3NXSTBGMjFibCtzdEN1bzBrSnZpWkVYZXRhVHVVRFVRT1p2?=
 =?utf-8?B?L0VxTm02empYbFFZYVNsMjY4a01VeU1SQmx0RGVKRVJ5RzZ6TEdQVTJDTGVk?=
 =?utf-8?B?aUxiZjYybVp2TEt1NG1qQXp4MnQ2QnBHOTN5SmNjcjh4dzNRQWExUGo1akt4?=
 =?utf-8?B?YzFORjEyU2JTY0FNL0JnQm5Gb0VkSlJFelNGbjBKVDVadkZJd20vSE92aytj?=
 =?utf-8?B?RDgzUWVxcFB4T3k4ZXFqTnZZUy9tRDRJZldjaHo4OWNEOWd5akRYSHNSNVV5?=
 =?utf-8?B?KzBnTzhVdzBzaXY2RDdyZ3lzTW9lVWdZSG80ZVovSlJ1T1R5Um1WMHF5aUNt?=
 =?utf-8?B?MlNlc28wM1ovTjV0UC9yQUxrT2FVNGVsRFZpL0x4RVlMOGRBTm41MjNJMld6?=
 =?utf-8?B?UGFkelNVREI4WXpPU0V5TTZ4VDQxOW9QeG11RTJ4OEFaRGhId0FTR0xaSlc4?=
 =?utf-8?B?aHdXQnBOamZrUndPZHZlakZ2TFNncExKdVNsQzdqTHF1dTBQaVFQUGN3Q0JC?=
 =?utf-8?B?aUdPOVU0OE1weFpVK2RWdXRoZ3V6clhac2k2ZWNqbHdXUjZwYVFzVWR4QkVL?=
 =?utf-8?B?RU9oZXJla3d0aVNWRy9lb3FvQithdnZlYy9maFl4eDJLeWc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RDlGVHhOWm5HQjZBZ3lyZUx5MlRCMFNMczRiNDdTc01lZUlkdnhkSlU3R2ky?=
 =?utf-8?B?OXRERk9ucG5ySVNQdlZ2eFY4WnVUOC9mTmNoS1RUQzRRLy9VMVFwVnlGdGJz?=
 =?utf-8?B?cVNudWtJWHV6Mi9sY3AzOG13VFdTZUtzVFhSbHNiMXE1d0xQM0xmQ004akZn?=
 =?utf-8?B?blduNWRHYytZR1ZVeXZRRXRJaXc0dUZRUk81OFpPSktNMDBVSTF3UlZmdjBk?=
 =?utf-8?B?enRLNzFXZVF6bUNleFdLRzA4NWdYUDNJSjBDbktKTVEycFVMdEg1M1BHeDRo?=
 =?utf-8?B?OTVaYU5rT0xSUjlMcHJqVGJkM0ozbG5QblhhVTBEamthT29PUUJOVTNja0FC?=
 =?utf-8?B?ZkFBTnVOdXZuaGdZejFVcktOVTBydG9jTlR2UlNNSC9wSWI5aDF6OXQwNlBp?=
 =?utf-8?B?bmUza2hJUWJoeWVqYm9mOGZoWDBsQllzOEtuUk9IbUJnWFZDcC9kVDlvbVhN?=
 =?utf-8?B?RUg3b0dEYXFlUUZGTGFMUW5GMFcvUlQvNW01U1BkYjNMMVRoYWZJVkpLVHlC?=
 =?utf-8?B?SjVLNm8waWJkb3dwckZDTWJSaktLTkRtUjd0VzdlSzFHM0Y5emJXN2VtVDZS?=
 =?utf-8?B?WGJXTHlCRytyMklYcE1TNDN4V0pwaW4zcHRpaTQzNW9pMVJmYXA0RXJablY2?=
 =?utf-8?B?ZWlGVUwyUWp1Qm1hY25jUHEzMzhub096WGFqNWFzNTdKbVhKZllnNy8vTXFu?=
 =?utf-8?B?ZnBZRUdXMFhJRnpzQjB4VDlQUUJVVVU3VlJRVUJKVmJLalFwN2E3T0w2enhl?=
 =?utf-8?B?RGZuY04yWm5WckJRbTk4Ri9ITmZPWTd1WkFQUVVvcVh2SnV1WDh2UUZxclRs?=
 =?utf-8?B?UVdVRVFyU1d5WXZuRW9rempBQmhuV0UzSnI3MGV4c1FhY1ZJVFQ3TFQ0eC96?=
 =?utf-8?B?S2hRMWtWUVVNWGZsazJJN3hZQVJEZTAyMGFDRVVqSWxRM0UrM0Fjd3N5aWtB?=
 =?utf-8?B?OW1ER2pyVFpTWUhSdzRFa09oQ0d1cnlYdzRZeHp6SU54UEdPb2Nud2JtZ1Y2?=
 =?utf-8?B?V0MyQWdwTTlaSlpyWmpVekxZa3d4RDRHVGxKWnRCODQ4Ujdka3daaXk3eHA4?=
 =?utf-8?B?REFUeHVMRGN1ZnhQc0puRFhkWTRNQ3JNM0UwNkFYS2RHUXZxVDZTdThOR3NG?=
 =?utf-8?B?S0Z1VXorUzNpVjhSb3NYdGpFdjJWTXRHVXVUWnBoVmFiVkw0RlpzKzBzcmxm?=
 =?utf-8?B?S2tWL0FBMVFDL1RWZVRpNERTTTZoSDV6c2dHZlNRaFh4MWhZZHBBOVg0OEV1?=
 =?utf-8?B?MjhCSndMbW43b1c0Rks2Z2owbk1BdE9vRVB6UmtZTGRkZExuZ2NFZE05YWlj?=
 =?utf-8?B?RFNFZkw4dC8yMzB6ZUhrb2xoSGtiL3pLayt1TC9LcjJ3L3l0cklRLzhFeDZY?=
 =?utf-8?B?ZVg0WVBHUUg2U1ozaUNRQ0thT20vUU0vNDJtNHpUSkRjRjQ5REZMd1NoS0xJ?=
 =?utf-8?B?MUQ2S2VvZjd0Tk9vV3ZPK3JhOE95MTJkT21iWFpPMmhNZ3pveU1HeXdVdjZK?=
 =?utf-8?B?SHErZ1FNZFpiNTl1REpEVkxXZUt1TStJOUlYQTdSazEwNmdLZTk4Z2pNayti?=
 =?utf-8?B?K1ZocUxnc3d3QVJrUjNaZ0ZQdkVONHJJQ3plc1EvRlRteHRva2FTUjVHQjNp?=
 =?utf-8?B?ZFZlREYydVFod1JLU2paZGlBRUNqeXRHUDRSeGdMVXYzaUh4VzNES0FPcXJX?=
 =?utf-8?B?NVVGNklaOHpQdjQ3RnhCQlFtMnNrQklrdUpadzcxU3lhVTd2VEdDeEp1NHQw?=
 =?utf-8?B?RzhuVUVwT0pJYk5yMGRTUTg3dXFYclZTYlFOdkZzRWoycDUrWk5mMTZLeWpq?=
 =?utf-8?B?MXNUSkdjejlsdTg4WnY1eGJ6Rk1CZEcxQ3h1TloxRjFpT2cwdi9mTEpmclM0?=
 =?utf-8?B?UmV4YzB4UnNMTTViREg4RjFLSkhIWWNTY094Vkt3NUVDYVFmcGp3djdwVEVo?=
 =?utf-8?B?UGJ0cmNXaHBOL0N6dkRveTQwaUVXbHBBR1FNckJwTWhMdnQyVE5mOE9BS3cx?=
 =?utf-8?B?YldOZVdCdUZOUEF6MWpKMFdtZXI0SVBMRUwrUGcraHUzb1pEL2ozQkVpVG91?=
 =?utf-8?B?dlhKSG1LaTVsbUpNSE84SzhJU3NFTHBvcWIwVlE0MFZLbW5zRVF2NFU0di9K?=
 =?utf-8?Q?5UMI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E06B49AA726AE4CAB03306810547AF7@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d50c8df0-9e37-4c09-576d-08dccc06b4c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 10:53:55.4363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P9qQVi+58aF5/BjJ6mDrz//h+6o8RVTUdHm1Zyhhb3Fm4p/EvqjMMJYNcJzS9UOpiweOXannuaTF5AgjcaZOhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6445

T24gMjAyNC85LzMgMTc6MjUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMy4wOS4yMDI0IDA5
OjU4LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+PiBPbiAyMDI0LzkvMyAxNTo0MiwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4gT24gMDMuMDkuMjAyNCAwOTowNCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+
Pj4+IFdoZW4gZG9tMCBpcyBQVkggdHlwZSBhbmQgcGFzc3Rocm91Z2ggYSBkZXZpY2UgdG8gSFZN
IGRvbVUsIFFlbXUgY29kZQ0KPj4+PiB4ZW5fcHRfcmVhbGl6ZS0+eGNfcGh5c2Rldl9tYXBfcGly
cSBhbmQgbGlieGwgY29kZSBwY2lfYWRkX2RtX2RvbmUtPg0KPj4+PiB4Y19waHlzZGV2X21hcF9w
aXJxIG1hcCBhIHBpcnEgZm9yIHBhc3N0aHJvdWdoIGRldmljZXMuDQo+Pj4+IEluIHhjX3BoeXNk
ZXZfbWFwX3BpcnEgY2FsbCBzdGFjaywgZnVuY3Rpb24gaHZtX3BoeXNkZXZfb3AgaGFzIGEgY2hl
Y2sNCj4+Pj4gaGFzX3BpcnEoY3VycmQpLCBidXQgY3VycmQgaXMgUFZIIGRvbTAsIFBWSCBoYXMg
bm8gWDg2X0VNVV9VU0VfUElSUSBmbGFnLA0KPj4+PiBzbyBpdCBmYWlscywgUEhZU0RFVk9QX21h
cF9waXJxIGlzIG5vdCBhbGxvd2VkIGZvciBQVkggZG9tMCBpbiBjdXJyZW50DQo+Pj4+IGNvZGVz
Lg0KPj4+Pg0KPj4+PiBCdXQgaXQgaXMgZmluZSB0byBtYXAgaW50ZXJydXB0cyB0aHJvdWdoIHBp
cnEgdG8gYSBIVk0gZG9tYWluIHdob3NlDQo+Pj4+IFhFTkZFQVRfaHZtX3BpcnFzIGlzIG5vdCBl
bmFibGVkLiBCZWNhdXNlIHBpcnEgZmllbGQgaXMgdXNlZCBhcyBhIHdheSB0bw0KPj4+PiByZWZl
cmVuY2UgaW50ZXJydXB0cyBhbmQgaXQgaXMganVzdCB0aGUgd2F5IGZvciB0aGUgZGV2aWNlIG1v
ZGVsIHRvDQo+Pj4+IGlkZW50aWZ5IHdoaWNoIGludGVycnVwdCBzaG91bGQgYmUgbWFwcGVkIHRv
IHdoaWNoIGRvbWFpbiwgaG93ZXZlcg0KPj4+PiBoYXNfcGlycSgpIGlzIGp1c3QgdG8gY2hlY2sg
aWYgSFZNIGRvbWFpbnMgcm91dGUgaW50ZXJydXB0cyBmcm9tDQo+Pj4+IGRldmljZXMoZW11bGF0
ZWQgb3IgcGFzc3Rocm91Z2gpIHRocm91Z2ggZXZlbnQgY2hhbm5lbCwgc28sIHRoZSBoYXNfcGly
cSgpDQo+Pj4+IGNoZWNrIHNob3VsZCBub3QgYmUgYXBwbGllZCB0byB0aGUgUEhZU0RFVk9QX21h
cF9waXJxIGlzc3VlZCBieSBkb20wLg0KPj4+Pg0KPj4+PiBTbywgYWxsb3cgUEhZU0RFVk9QX21h
cF9waXJxIHdoZW4gZG9tMCBpcyBQVkggYW5kIGFsc28gYWxsb3cNCj4+Pj4gUEhZU0RFVk9QX3Vu
bWFwX3BpcnEgZm9yIHRoZSByZW1vdmFsIGRldmljZSBwYXRoIHRvIHVubWFwIHBpcnEuIFRoZW4g
dGhlDQo+Pj4+IGludGVycnVwdCBvZiBhIHBhc3N0aHJvdWdoIGRldmljZSBjYW4gYmUgc3VjY2Vz
c2Z1bGx5IG1hcHBlZCB0byBwaXJxIGZvciBkb21VLg0KPj4+DQo+Pj4gQXMgYmVmb3JlOiBXaGVu
IHlvdSB0YWxrIGFib3V0IGp1c3QgRG9tMCwgLi4uDQo+Pj4NCj4+Pj4gLS0tIGEveGVuL2FyY2gv
eDg2L2h2bS9oeXBlcmNhbGwuYw0KPj4+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h5cGVyY2Fs
bC5jDQo+Pj4+IEBAIC03Myw2ICs3Myw4IEBAIGxvbmcgaHZtX3BoeXNkZXZfb3AoaW50IGNtZCwg
WEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+Pj4+ICAgICAgew0KPj4+PiAgICAg
IGNhc2UgUEhZU0RFVk9QX21hcF9waXJxOg0KPj4+PiAgICAgIGNhc2UgUEhZU0RFVk9QX3VubWFw
X3BpcnE6DQo+Pj4+ICsgICAgICAgIGJyZWFrOw0KPj4+PiArDQo+Pj4+ICAgICAgY2FzZSBQSFlT
REVWT1BfZW9pOg0KPj4+PiAgICAgIGNhc2UgUEhZU0RFVk9QX2lycV9zdGF0dXNfcXVlcnk6DQo+
Pj4+ICAgICAgY2FzZSBQSFlTREVWT1BfZ2V0X2ZyZWVfcGlycToNCj4+Pg0KPj4+IC4uLiB0aGF0
IG91Z2h0IHRvIG1hdGNoIHRoZSBjb2RlLiBJT1cgeW91J3ZlIGFnYWluIGxvc3Qgd2h5IGl0IGlz
IG9rYXkoaXNoKQ0KPj4+IChvciBldmVuIG5lY2Vzc2FyeSkgdG8gYWxzbyBwZXJtaXQgdGhlIG9w
IGZvciBub24tRG9tMCAoZS5nLiBhIFBWSCBzdHViZG9tKS4NCj4+PiBTaW1pbGFybHkgaW1vIERv
bTAgdXNpbmcgdGhpcyBvbiBpdHNlbGYgd2FudHMgZGlzY3Vzc2luZy4NCj4+IERvIHlvdSBtZWFu
IEkgbmVlZCB0byB0YWxrIGFib3V0IHdoeSBwZXJtaXQgdGhpcyBvcCBmb3IgYWxsIEhWTQ0KPiAN
Cj4gWW91IGRvbid0IG5lZWQgdG8gaW52ZW50IHJlYXNvbnMsIGJ1dCBpdCBuZWVkcyBtYWtpbmcg
Y2xlYXIgdGhhdCB3aWRlciB0aGFuDQo+IG5lY2Vzc2FyeSAoZm9yIHlvdXIgcHVycG9zZSkgZXhw
b3N1cmUgaXMgYXQgbGVhc3Qgbm90IGdvaW5nIHRvIGJlIGEgcHJvYmxlbS4NCj4gDQo+PiBhbmQg
IHdoZXJlIGNhbiBwcmV2ZW50IFBWSCBkb21haW4gY2FsbGluZyB0aGlzIGZvciBzZWxmLW1hcHBp
bmcsIG5vdCBvbmx5IGRvbTA/DQo+IA0KPiBBaXVpIHVzZSBvbiBpdHNlbGYgaXMgbGltaXRlZCB0
byBEb20wLCBzbyBvbmx5IHRoYXQgd291bGQgbmVlZCBjbGFyaWZ5aW5nDQo+IChhbG9uZyB0aGUg
bGluZXMgb2YgdGhlIGFib3ZlLCBpLmUuIHRoYXQvd2h5IGl0IGlzIG5vdCBhIHByb2JsZW0pLiBG
b3INCj4gaGFzX3BpcnEoKSBkb21haW5zIHVzZSBvbiBvbmVzZWxmIHdhcyBhbHJlYWR5IHBlcm1p
dHRlZCBiZWZvcmUuDQoNCkNoYW5nZWQgY29tbWl0IG1lc3NhZ2UgdG8gYmVsb3cuIFBsZWFzZSBj
aGVjayBhbmQgdGhhdCB3aWxsIGJlIGdyZWF0IGhlbHBmdWwgaWYgeW91IHdvdWxkIHNob3cgbWUg
aG93IHRvIG1vZGlmeSBpdC4NCnsNCng4Ni9wdmg6IEFsbG93ICh1biltYXBfcGlycSB3aGVuIGRv
bTAgaXMgUFZIDQoNClByb2JsZW06IHdoZW4gZG9tMCBpcyBQVkggdHlwZSBhbmQgcGFzc3Rocm91
Z2ggYSBkZXZpY2UgdG8gSFZNIGRvbVUsIFFlbXUNCmNvZGUgeGVuX3B0X3JlYWxpemUtPnhjX3Bo
eXNkZXZfbWFwX3BpcnEgYW5kIGxpYnhsIGNvZGUgcGNpX2FkZF9kbV9kb25lLT4NCnhjX3BoeXNk
ZXZfbWFwX3BpcnEgbWFwIGEgcGlycSBmb3IgcGFzc3Rocm91Z2ggZGV2aWNlcy4NCkluIHhjX3Bo
eXNkZXZfbWFwX3BpcnEgY2FsbCBzdGFjaywgZnVuY3Rpb24gaHZtX3BoeXNkZXZfb3AgaGFzIGEg
Y2hlY2sNCmhhc19waXJxKGN1cnJkKSwgYnV0IGN1cnJkIGlzIFBWSCBkb20wLCBQVkggaGFzIG5v
IFg4Nl9FTVVfVVNFX1BJUlEgZmxhZywNCnNvIGl0IGZhaWxzLCBQSFlTREVWT1BfbWFwX3BpcnEg
aXMgbm90IGFsbG93ZWQgZm9yIFBWSCBkb20wIGluIGN1cnJlbnQNCmNvZGVzLg0KDQpUbyBzb2x2
ZSBhYm92ZSBwcm9ibGVtLCBuZWVkIHRvIHJlbW92ZSB0aGUgY2hhY2sgaGFzX3BpcnEoKSBmb3Ig
dGhhdA0Kc2l0dWF0aW9uKFBIWVNERVZPUF9tYXBfcGlycSBpcyBpc3N1ZWQgYnkgZG9tMCBmb3Ig
ZG9tVXMpLiBCdXQgd2l0aG91dA0KYWRkaW5nIG90aGVyIHJlc3RyaWN0aW9ucywgUEhZU0RFVk9Q
X21hcF9waXJxIHdpbGwgYmUgYWxsb3dlZCB3aWRlciB0aGFuDQp3aGF0IHRoZSBwcm9ibGVtIG5l
ZWQuDQpTbywgY2xhcmlmeSBiZWxvdzoNCg0KRm9yIEhWTSBkb21VcyB3aG9zZSBYRU5GRUFUX2h2
bV9waXJxcyBpcyBub3QgZW5hYmxlZCxpdCBpcyBmaW5lIHRvIG1hcA0KaW50ZXJydXB0cyB0aHJv
dWdoIHBpcnEgZm9yIHRoZW0uIEJlY2F1c2UgcGlycSBmaWVsZCBpcyB1c2VkIGFzIGEgd2F5IHRv
DQpyZWZlcmVuY2UgaW50ZXJydXB0cyBhbmQgaXQgaXMganVzdCB0aGUgd2F5IGZvciB0aGUgZGV2
aWNlIG1vZGVsIHRvDQppZGVudGlmeSB3aGljaCBpbnRlcnJ1cHQgc2hvdWxkIGJlIG1hcHBlZCB0
byB3aGljaCBkb21haW4sIGhvd2V2ZXINCmhhc19waXJxKCkgaXMganVzdCB0byBjaGVjayBpZiBI
Vk0gZG9tYWlucyByb3V0ZSBpbnRlcnJ1cHRzIGZyb20NCmRldmljZXMoZW11bGF0ZWQgb3IgcGFz
c3Rocm91Z2gpIHRocm91Z2ggZXZlbnQgY2hhbm5lbCwgc28sIHJlbW92ZQ0KaGFzX3BpcnEoKSBj
aGVjayBoYXMgbm8gaW1wYWN0IG9uIEhWTSBkb21Vcy4NCg0KRm9yIFBWSCBkb21VcyB0aGF0IHBl
cmZvcm1zIHN1Y2ggYW4gb3BlcmF0aW9uIHdpbGwgZmFpbCBhdCB0aGUgY2hlY2sNCnhzbV9tYXBf
ZGVkb21haW5fcGlycSgpIGluIHBoeXNkZXZfbWFwLW5pcnEoKS4NCg0KRm9yIFBWSCBkb20wLCBp
dCB1c2VzIHZwY2kgYW5kIGRvZXNuJ3QgdXNlIGV2ZW50IGNoYW5uZWwsIGFzIGFib3ZlIHRhbGtz
LA0KaXQgYWxzbyBoYXMgbm8gaW1wYWN0Lg0KfQ0KDQo+IA0KPiBKYW4NCg0KLS0gDQpCZXN0IHJl
Z2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

