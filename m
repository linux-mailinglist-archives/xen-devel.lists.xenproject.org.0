Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ED7B348D6
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 19:35:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093626.1449111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqb52-0006tf-2z; Mon, 25 Aug 2025 17:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093626.1449111; Mon, 25 Aug 2025 17:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqb52-0006ql-0C; Mon, 25 Aug 2025 17:34:04 +0000
Received: by outflank-mailman (input) for mailman id 1093626;
 Mon, 25 Aug 2025 17:34:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/bS3=3F=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uqb50-0006qf-R1
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 17:34:02 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad65806a-81d9-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 19:33:57 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DBAPR03MB6503.eurprd03.prod.outlook.com (2603:10a6:10:17f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 17:33:53 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 17:33:52 +0000
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
X-Inumbo-ID: ad65806a-81d9-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pyysQZwK5ay6XZXHp79P0cqt3Jr3ZpBoDeMektSPMRqIe8EBcN2Dpr0cX8MbLxQdvhZ/GhArgGeyYIIriFdCUrdgBx0bU43KRSLzqNQYOpJNTDQv2IV5a/MRtoG5YqY6jouGhqzIUHcWYdARuLEkCN+1f8UYFixmdmPjiSgXFHMuDxqCJmsaBdglbwvqbTL+jUqXGjSz+0R8N2g46jqoqNvQOVby/a4/JAZl1bli+TSdq9pmI+k5w7G1Fv0vZoyelv80r3QfuAydCrpHrt3Qk/0hlH0Mh+vLMXfKGHZqENd424+bVZngAWR0jO2NRR81/0I14PAD/1d0gYQ8MQ+FEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fm0xlYOpyRLwtuEFwHUpE4BUXCwejIqICQvfJJcZws=;
 b=v2Qqosdgnl25hGX9Jt42Fc/vyckifM9OKl0GKaodjh0n8rElKAJEJVCwPGwBaxOIeV1l4Hgw43nH82nKJbZcVjQyFZSS8/Z7ufidsshFT+I2T+pktu3AMh8c/uXHEhSuwDTXUF2puZkGnJhDfndbebMbwxiXY6FY6nBsPW74+3rOPZLU5IruCt3nFy8m6irsRLIbXcCx0AWRsdmu3qTBrkA0NV+cnw5UIpMYKFFzfMkYlH0tXpQMuCes8/KX9aPu2ZL3QsD+dyEtBfcgjwijomA/pGbc574NAvnKzuoBE0tJykncLNwz94pH+FKjF3BTKaZ1hSItWFBhV0dLHBzSOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fm0xlYOpyRLwtuEFwHUpE4BUXCwejIqICQvfJJcZws=;
 b=kbGt7GvohKo980CPfX33X8lg0EQuvSBBeDllfWCyuIgOeGIh7DnlnaQbXtjEjPRaZrizz53B3wV93ypZpF48EMfh1Z13M1rvoyHzLYPfgoifeE/20ZsTgMKoDBQr0Q43rYZ/4k4dwrk6AeUQYOqO4LmtePRt1HuyZIy/Wz7b8uOnzcDmv1+56NC9IhKvcTl6MRnFM876lZNBP24t/L57fwuMi9pkh+mxLSpE7icEiBwXZvtEektFUZ2Q5W72I9qC6fxF9CB2g3/pOUTyzlUA93tjeoh0B+kIKudiKPYtiipvNN8qptEIcMFdUsHT4JA0tOuvxpMgWh+1uV9GREd1Xw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] misra: add deviation of Rule 17.7
Thread-Topic: [PATCH] misra: add deviation of Rule 17.7
Thread-Index:
 AQHcFZ9zsboRH18vd0iLUvum4pfwBbRzK0qAgAAH1ACAAAJ8AIAAJzmAgAAMhACAADhBgA==
Date: Mon, 25 Aug 2025 17:33:52 +0000
Message-ID: <7729c3cd-c1d6-4abf-8e44-293702f47545@epam.com>
References:
 <ad15582787e675fadf92502f85041c3232749a99.1756112701.git.dmytro_prokopchuk1@epam.com>
 <53d5cee3-9001-49a2-9da2-e56950a77683@suse.com>
 <83267937-938d-43d8-ba2c-a07d6adb93a9@epam.com>
 <330f8ee8-9fcd-40e4-96c0-ac126b047070@suse.com>
 <37bb8530-c9e4-4ad4-8959-d1f13316a0fd@epam.com>
 <bd88b7d0-92aa-45c9-8b8e-730bc7edc7b3@suse.com>
In-Reply-To: <bd88b7d0-92aa-45c9-8b8e-730bc7edc7b3@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DBAPR03MB6503:EE_
x-ms-office365-filtering-correlation-id: 19df7174-b38e-4c51-8491-08dde3fd8f67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SktvdUpKSnMrSEoyd3RqS2ZlQlZpVXo5enEvanhndFJxbG9Ya3hzb1RiUVEy?=
 =?utf-8?B?alF1MmwwL3B2VHprLzF0T1R4cnNuSzdDdU52NzZvYmRQTGpOUHdmNmRHV1pL?=
 =?utf-8?B?OFFqT0JKUHo5WDk4dkhRR0xKT0lyMlR5ZXQ3SDVuVVZBU2p2enhzWk5CdW1I?=
 =?utf-8?B?ZmNhaTVKR0lweTk1WWk0VlFOSS9IeC9RZlRJRkYyanpGRzBvMnljY3B0YXRo?=
 =?utf-8?B?V21VM2dmWmxLNjljTDBQTUM0QkpyeU01RVh5T0hIVmVJVitOZFRDMUNETXI5?=
 =?utf-8?B?MXEyWVBjTFcyRjl5d1FSL3NTSm5xUFgxc2s5Yk5xRW5lY2pRQkJRb0gwYnBH?=
 =?utf-8?B?SDRsTTVUem1SSmM0L1M5NlNYOXJuV21DT1FmZ3hFT09xUnJDa1d2TFRxNnZ4?=
 =?utf-8?B?aFpXajl0cGdEazB2aS9jeVRnV3dFY0RMZVQxY01BakxpVlBqQlRFM3ptN09h?=
 =?utf-8?B?eldWSUIzaUM0bVQ0OWdId1F5dHhkN0h1WkdOeDJuNmlLZy9rMWkwTisvTEtq?=
 =?utf-8?B?R0N0ME1oNzRGY1JlNlYwYjU3ajdGd2F1a0lFRXFsalNYbGE3cWtHT3hkZ2d1?=
 =?utf-8?B?a3BkbFFsQjZvcjFDeE4vcHlaczdFZ01CMzZQL0hrMGxTSUZDSXFJdHZUNmhx?=
 =?utf-8?B?Sm5OT0ZlWUdBU0dmTDExeFZhbnJpNm1qZGFCSUpBOVJ5YVEwMDBqamJzeVZ0?=
 =?utf-8?B?a0hMY0dmb0k1Wjc1a3l4d2lHS2pmU0RISUNBU20zYWs1Wk1JSEdqdVZUM2JU?=
 =?utf-8?B?Zy9keTlwTUpmSHNtQVI5MUdZVnNybUhwdEN6TURZdGUraU1GNHRGc3NTVnBQ?=
 =?utf-8?B?aktHMFk0ZFN2MlBaVW5VTmQxZEtWYlc1NFNoVkhFckYzWk5IWWRtWHBmWWY2?=
 =?utf-8?B?QWdUNm9vZkt2MC9PeTkyWHhSdnV0SFZMU1p3UWFFbVNSMnlBUXphaUN4SlpY?=
 =?utf-8?B?M0RiUVFibGZETVlOd0tPb1Z3RjRUanB3bXdUOXZBVDJOUkRZZE5Oemt5Mk5u?=
 =?utf-8?B?d1R3TTlKYzhQMldyczFvQ0tBODROSGZKMWduWXlxcFU2c01ienU0S1BkSDU4?=
 =?utf-8?B?N2lOeGxnK2xzVWNkaExxZUcxa0hRaFFuYW15UjBlYTVxa0lZZ2kvaUNHeUhO?=
 =?utf-8?B?YnNvZ0sybUFaTnZ3ZEVUU0J6WnpTK2tSWWlHVmNzY0tGa1FKVW5BYXg5VXEz?=
 =?utf-8?B?dnVpT2FDdjl6RmFkaWhKRXVTRlFPZXAvaXB4UnpQV3pBQjJqQy9ENVlibG1Z?=
 =?utf-8?B?UXprUnp1VWJOTW1lVmZyZVB0aGUwckpncHNINW5HbCthNFBCRWdETDNhdkM3?=
 =?utf-8?B?eW0zWjY0RzJJdUZuc3hJaGtBTkg4WWR0K2F3eGpSR1V0cHQ1TWY5NnhLNDZp?=
 =?utf-8?B?aFFRU2c2Vk9HTlhjWFUrOVJJOGNPRHdJSVE4dmZMSk5pQVJKNHAxd1Z4ak9I?=
 =?utf-8?B?alRWRmhaTDJ4M1ZMaFBBVGh3V3VIaVBzbUNzNWNaemdaVm10L092Nm1aaXhG?=
 =?utf-8?B?bnVyTWNGUzg1WW9ab3JLM0hXOWt4VHNZeVJHTzQxd3ltSVNsVFFiVnNGTTFW?=
 =?utf-8?B?RlI1bGRISDFBb3N4bVdVUEQrVjY1QlZWTnlXK1dTTFhOcVh4NWlrY3VmUTFw?=
 =?utf-8?B?c2w1VnZCL1ZSQm8yaFIzeXZJYThrNWZSRC8xYk9QTDRVTTd1ZEs3MFBJbklF?=
 =?utf-8?B?cVkvcEdwd2lWdWs5SmxQeElZVEt2U1dXSmdUM2ZjTTluSXM2aHord3JNK041?=
 =?utf-8?B?L3FwV0ttMDBjNkRnQ2J4cExnVnVRb0lOdzA2Y2NlbzJZRUt5VGhJYXpRUEc0?=
 =?utf-8?B?SUIxVGhVeHMxYkRWYVdwblRMZ0hFUjJDU3JUR0NHRmdDbHdTazFXK1JtR1Yr?=
 =?utf-8?B?OEorKzlVeTMyR0pROTJjSmwwUm9iTEN0TXhQZUVPRGdwcmFZc0xyUVBkc1N2?=
 =?utf-8?B?NjRDLzNHS0R6anVFSldJSW5FRXAvd3hZM2RLNFdISW5QTHhtS2d3Z0NFN0lz?=
 =?utf-8?B?aTJoK1Y1eG1BPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dG9kNW9xMEcrblg3aDRZSlpOL0FNWEpVM0MxbENOYVlDMHNob1VxWXE1ZENR?=
 =?utf-8?B?ckswa1QrS0FueHVQUE80VG41SDAwMkdlL2hSYkZWbENHT2VLcFRYWkRjdkxk?=
 =?utf-8?B?eFVNZlh1OGM0d0RLSnBOMTQwV0FWSno3cnk5N0JkK0VYZ2NKZkZPdjVSc2hw?=
 =?utf-8?B?WFlqc0lFbGVEVVVoR3ZlL242dm5kdk9wN00wVkZkazVWVFl5VExwTkNWRktv?=
 =?utf-8?B?b0U3cGdUaGI2STduZEZIZEQ3R3dGMkloTXdnb3ZSV0kremJrOHZQVXFaUGQ4?=
 =?utf-8?B?UnhGS1VaVzF5RXM5Sm85OU4yRXRuWi9OSkxDWGlYYWFjVVFPVW9qUmZSaTJM?=
 =?utf-8?B?NlNqdkRrUm5tWFBZMS9WNk5vTFVsRys4eXJxaDJtbldlTjBHcTRhSVV3SmtE?=
 =?utf-8?B?S1VjY25VbS9oY1lwZG93QmxZN09BR0Z0QW44dzJxVDhnTW5BMUJaM1dkMkdK?=
 =?utf-8?B?TnRRWTVrK0RQNnhqRjZYdTZKRW50QmI3NUNrZTc4K0s0bHdGTUpwc3poQ3VL?=
 =?utf-8?B?VmJZSmZzTXB5RXkyZ08rZzBQaUtJbGxhcUpkN2hTVWNtYUIrckp1cG5hdWt6?=
 =?utf-8?B?SXV4MnFtTEdTSzFtcEV1WEtIOGt6NTRDUWd0YWtWN29ac2l0UDlMRUN1cXVL?=
 =?utf-8?B?Z3FjMHpCQWFJTmw3Q2dMMmUxU2daZlhIUHk5bUVkZklmMHVYbFNhL0VFR1Rr?=
 =?utf-8?B?YVBNSUtCWDdoakh0UFJIdnlEYkZDWEZIU04rSXBpK2FFWEJPOTdOd3diWnlW?=
 =?utf-8?B?SHMvR01LbGkweThmTWNHM0ZnMVlmRVFzY05hODFsMzNIeFA5NjFRc1Q1RGti?=
 =?utf-8?B?L04zcXYwVEhEdittd0l3NkVZSnI1WGFZTWg0bUpFdElXRWdFR1dPRUJzWnZy?=
 =?utf-8?B?QXNCQ0tzV0xGUHpMV1IvS21KNytWcFl6Tlk1cXRJZnVTOW4vemF5TFdvQmRE?=
 =?utf-8?B?emgxQW9Ya2haVnFHZjY5dTVFa0NPQ1F2NnZzejdneFBSOUlZVXlmZjhxcWVJ?=
 =?utf-8?B?OTBPMWJPTW9RWm1ZOEZEVkFFRUVlek1qS1FnM1FYQmpRS3hHaE1kYVZNNUtz?=
 =?utf-8?B?SDAwZGhwS0E1R1ZtazVkYnBNbGNjVWRsYjFrV1l3cDY5ZGhUM0pmdzc5SFVB?=
 =?utf-8?B?TGNlWEQwYmRZUzd5Mk02NzBjcndWdHE0WEZRdEhQZUNnQnRhbEJqcEVlSit2?=
 =?utf-8?B?U1VrV21DQlp5c3Eva005emtpaUpSUDc2aVQ5SHNzMXZhUkRXQ1llZm9QaXBj?=
 =?utf-8?B?SnFYSjNuZG5nZUllcXRSTEIrSnY2aW5tUWUzNXRUQUkvNE5EaFFIa2t3SThy?=
 =?utf-8?B?LzFnYTNRczNGNFJ2WkhIQ2lEdk1uV05aQUNVVlFXc1FUdE93OEZCU1FxbHQ2?=
 =?utf-8?B?c2FTN1M3TCtkb0FvZGJHdjNQczlkOGZzUFMxNmtxZHJVeko5OTlZcVdiR0Nz?=
 =?utf-8?B?Ull3QWc4QzBBaVB5NkdDbnJjQjc3TnNsRzRONUZKUUJiaWV3a3AyWTBNVzJi?=
 =?utf-8?B?K0dFNS8rTEFNc1dNeGtrMVdWSS9mekdKdUhyMlVxVVR5Zm1pQmRGQWtHZ2lq?=
 =?utf-8?B?TytaUVZIcVI0VzNCUCs5d25zZndjT1M3bkZCdEhmZDBic2FZVTdleFhuUkZq?=
 =?utf-8?B?QXlmanVtL01KTm5SVld2cjIwYm5zTGFzVm9Sc1k0dEJTUUJrNTEvRWdyWHVQ?=
 =?utf-8?B?a2VZYmVLUXRGcVBUclBsTkpFeVd2T1JkTFo3bXZNZVp1UFlkcVpGY2hraGJT?=
 =?utf-8?B?OHRCUG9mWWorZUs5Njk4S2lMQUlzbHBtSnltMk9zTFdCYk11Z1RiOFM4ZzM4?=
 =?utf-8?B?bHpxR0NVSUhSUWpaazd1bEJJN3hra3BmUmdsRjR1RDl3UitxRVl4dkNDY1pz?=
 =?utf-8?B?NDNqRU5jVVEzci9wSzhrSGZmNHMzNjBCaUdpOHY1TmFmK21SN01oSjlkaUUv?=
 =?utf-8?B?bW41c2wzWUVjcUdYbk9jN0JiaGJ2RmFra3Z3cUx5czV3UU9VZFlqd1JNQnRo?=
 =?utf-8?B?VzdFMGMxODF1Yy9UU3p5QkdvZ0QyNFdHVEVUSkFtN3hkS0F6MzRwL1dCK3ps?=
 =?utf-8?B?L2lKQ1laOEQ4ZnlQb0dWWDBMVWJLbzJkK1NLczNTdUlnT09GUnlJQ0p5OVFO?=
 =?utf-8?B?K0ppMWVEUnNWZFFha0owMFZseHozbFh2QjFiT1lOV3cvUzQwaklnUTZpK0hF?=
 =?utf-8?B?eEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <65FEEE68C8534C49A4B0065A9E18504F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19df7174-b38e-4c51-8491-08dde3fd8f67
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 17:33:52.8496
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oeoqka5UfYrxWzWicj6v981lXMcMq5LW8DZlTDOdaMbTuCCHWWtRNcTNMVQMMCF+el5KXdWNi1GOLx5B7Zly1MKaxZg/V6w5HcpCIXVapMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6503

DQoNCk9uIDgvMjUvMjUgMTc6MTIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNS4wOC4yMDI1
IDE1OjI3LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+Pg0KPj4NCj4+IE9uIDgvMjUvMjUg
MTQ6MDcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDI1LjA4LjIwMjUgMTI6NTgsIERteXRy
byBQcm9rb3BjaHVrMSB3cm90ZToNCj4+Pj4gT24gOC8yNS8yNSAxMzozMCwgSmFuIEJldWxpY2gg
d3JvdGU6DQo+Pj4+PiBPbiAyNS4wOC4yMDI1IDExOjA1LCBEbXl0cm8gUHJva29wY2h1azEgd3Jv
dGU6DQo+Pj4+Pj4gTUlTUkEgQyBSdWxlIDE3Ljcgc3RhdGVzOiAiVGhlIHZhbHVlIHJldHVybmVk
IGJ5IGEgZnVuY3Rpb24gaGF2aW5nDQo+Pj4+Pj4gbm9uLXZvaWQgcmV0dXJuIHR5cGUgc2hhbGwg
YmUgdXNlZC4iDQo+Pj4+Pj4NCj4+Pj4+PiBEZXZpYXRlIGZ1bmN0aW9ucyBsaWtlICdtZW1jcHko
KScsICdtZW1zZXQoKScsICdtZW1tb3ZlKCknLCAnc25wcmludGYoKScsDQo+Pj4+Pj4gJ3N0cmxj
cHkoKScsICdzdHJsY2F0KCknLCBhcyB0aGV5IHJldHVybiBhIHZhbHVlIHB1cmVseSBmb3IgY29u
dmVuaWVuY2UsDQo+Pj4+Pj4gdGhlaXIgcHJpbWFyeSBmdW5jdGlvbmFsaXR5IChlLmcuLCBtZW1v
cnkgb3Igc3RyaW5nIG9wZXJhdGlvbnMpIHJlbWFpbnMNCj4+Pj4+PiB1bmFmZmVjdGVkLCBhbmQg
dGhlaXIgcmV0dXJuIHZhbHVlcyBhcmUgZ2VuZXJhbGx5IG5vbi1jcml0aWNhbCBhbmQgc2VsZG9t
DQo+Pj4+Pj4gcmVsaWVkIHVwb24uIFVwZGF0ZSAnZGV2aWF0aW9ucy5yc3QnIGZpbGUgYWNjb3Jk
aW5nbHkuDQo+Pj4+Pg0KPj4+Pj4gSG93IGNvbWUgc25wcmludGYoKSBpcyBhbW9uZyB0aGlzIHNl
dD8gSXRzIHJldHVybiB2YWx1ZSBpc24ndCBxdWl0ZSBqdXN0DQo+Pj4+PiBmb3IgY29udmVuaWVu
Y2UsIGltby4NCj4+Pj4NCj4+Pj4gWWVzLCBzbnByaW50ZigpJ3MgcmV0dXJuIHZhbHVlIGlzbid0
IGp1c3QgZm9yIGNvbnZlbmllbmNlLiBUaGUgZGV2aWF0aW9uDQo+Pj4+IGp1c3RpZmljYXRpb24g
aXMgcHJpbWFyaWx5IGJhc2VkIG9uIHRoZSBmYWN0IHRoYXQgaXRzIHJldHVybiB2YWx1ZSBpcw0K
Pj4+PiByYXJlbHkgdXNlZCBpbiB0aGUgWGVuIHNvdXJjZSBiYXNlLiBNb3N0IGNhbGxlcnMgb2Yg
c25wcmludGYoKSBkb24ndA0KPj4+PiBjYXJlIGFib3V0IHJldHVybiB2YWx1ZS4gU28sIHNucHJp
bnRmKCkgaXMgaW4gdGhpcyBsaXN0Lg0KPj4+Pg0KPj4+PiBNYXliZSBzZXBhcmF0ZSB3b3JkaW5n
IGlzIHJlcXVpcmVkIGZvciB0aGUgc25wcmludGYoKSA/DQo+Pj4NCj4+PiBNaW5pbWFsbHkuIFBl
cnNvbmFsbHkgSSBkb24ndCB0aGluayBpdCBzaG91bGQgYmUgZGV2aWF0ZWQgZ2xvYmFsbHkuDQo+
Pg0KPj4gVGhlcmUgYXJlIGFwcHJveGltYXRlbHkgMjMwIGluc3RhbmNlcyBvZiBzbnByaW50Zigp
IGJlaW5nIHVzZWQgd2l0aG91dA0KPj4gY2hlY2tpbmcgaXRzIHJldHVybiB2YWx1ZSAoYWNyb3Nz
IEFSTSBhbmQgeDg2KSBpbiBhcm91bmQgMjAgZGlmZmVyZW50DQo+PiBzb3VyY2UgZmlsZXMuIERl
dmlhdGlvbiBlYWNoIG9mIHRoZW0gY291bGQgYmUgY29tcGxpY2F0ZWQuDQo+IA0KPiBNeSBncmVw
IHlpZWxkcyBzb21ld2hlcmUgYmV0d2VlbiA1MCBhbmQgNjAgaGl0cyBpbiB4ZW4vLCBhbW9uZyB0
aGVtIGFib3V0IDE1DQo+IGluIHhlbi90b29scy9rY29uZmlnLywgd2hpY2ggSSBleHBlY3Qgd2Ug
Y2FuIGlnbm9yZS4gSSBhbHNvIGRpZG4ndCBtZWFuIHRvDQo+IHN1Z2dlc3QgdG8gZGV2aWF0ZSB0
aGVtIGFsbCBpbmRpdmlkdWFsbHkuIFNvbWUgbWF5IGFjdHVhbGx5IHdhbnQgdG8gdXNlIHRoZQ0K
PiByZXR1cm4gdmFsdWUsIGFuZCBJIHdvdWxkbid0IGJlIHN1cnByaXNlZCBpZiB0aGlzIGVuZGVk
IHVwIGZpeGluZyBhIGJ1ZyBvcg0KPiB0d28uDQo+IA0KPiBKYW4NCg0KRm9yIG1lbW9yeS1yZWxh
dGVkIGZ1bmN0aW9ucyAobWVtY3B5LCBtZW1zZXQsIG1lbW1vdmUpLCBpZ25vcmluZyB0aGUgDQpy
ZXR1cm4gdmFsdWUgaXMgYWxtb3N0IGFsd2F5cyBzYWZlLCBzbyBJIHByb3Bvc2UgdG8gbGVhdmUg
dGhlc2UgDQpmdW5jdGlvbnMgaW4gdGhlIHBhdGNoLCByZW1vdmUgc25wcmludGYsIHN0cmxjcHks
IHN0cmxjYXQgc28gZmFyLCBhbmQNCnByZWNpc2VseSBjaGVjayB1c2FnZSBvZiB0aGUgbGFzdCBm
dW5jdGlvbnMuDQoNCklzIGl0IE9LPw==

