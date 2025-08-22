Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC4AB31D34
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 17:03:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090285.1447616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upTIi-0004wi-92; Fri, 22 Aug 2025 15:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090285.1447616; Fri, 22 Aug 2025 15:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upTIi-0004uF-5F; Fri, 22 Aug 2025 15:03:32 +0000
Received: by outflank-mailman (input) for mailman id 1090285;
 Fri, 22 Aug 2025 15:03:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jNg=3C=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1upTIg-0004u9-Ae
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 15:03:30 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 295a57a8-7f69-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 17:03:29 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by PA6PR03MB10363.eurprd03.prod.outlook.com (2603:10a6:102:3ce::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 15:03:25 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 15:03:25 +0000
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
X-Inumbo-ID: 295a57a8-7f69-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKGqGOOOa1l2QSDbQh2n+DtbLylmv+bM9fp/J4xkWkVUG/itQ7a2JUYdQp7tdgEbxuC4YERgPl3hpxCmuJvpwA4V9mJ4pvkonEvPVHE6iGwYCDcul0fhdwDfl/XrMOdnjTg63x2LUJQCwxgLZ7pGs/LgxtcxgicofK7jHYiQaqTVbs3AB+nzd/+FAOnPubBEOJZRiXplEJnXhDeHDRHLAis3zuYUiArwiFJxineehn9dOOfDoc77ndxDheJBvfqF8nNhedVpeXtdTHpz3KkRXZFAeseu9Ls/zmWbHiuDrZ1SOzgsW/jmK/ubsSQJQo03QGrWw5Z08bj+FBa0DowrRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQvBzg3KaseQzRTl5bbcFE8j1E3oa6vkrog6gLboq3A=;
 b=l6roW/6y8EyvOMU5HO6rkxw9++XOJy7ntugVTgn6aZkSIcQ2Q1bfVdF21ajzwllm1KKIMmn0Xnm3ie5Vnno+yaT0ASyOZ7zH7okh3t4Oyi+Q2193SKCilfL9ByYTAl9YqFCVHHci9wz6SeQFBtomqALaAg6O1qyVz4kxgZHksw1mfE+aVMVa28h8DzQBYPq9s2gZPSlqL5a+FWenEt78H81q6qZfp4ROksuG5GY0jg8gEWHwxXfugj7iygMp0zc/AoEs2EtLLyhG+DNzTvHrs4Ursb9K9BXqQ7Z2hwgOCydA0I+L8ywoddkfGJS2Qsj48U6KE0TT+LzYSMLzBN1Jkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQvBzg3KaseQzRTl5bbcFE8j1E3oa6vkrog6gLboq3A=;
 b=XZvx2iAZJvt7OUjvLvS+3tcEUfmrvfY/3FFaHEDLGVgVb/zPSVgqJLpmUxQKzsmUVhB5K7DfsU/3AnumyjG1jT72juyrWe2aaOYNwiESzk5lh6XLpMu7+WNNUnUPpz+46g03wYbsGA5EI3KZzk9wqGkE+0nAYT9WN6AP6NdxVgoLsoucUkMMAbFCIUCT2LYCohG3Wxo8SMgSDcMIwsTAjwP6nb5ewpa7mYqJ7jLNrpFRKKa+Kp/IDfCz1Idqkln2MdKL0NrQaxEsrifRf+ZlVKueIrgDyDkCKXV2RaaCbJ66VRWOMdWX/F2BMIYtNY6liy18cjgKrNXK9pTH+56stA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 09/10] xen/arm: domain_build: adjust Dom0 IRQ handling
 to support eSPIs
Thread-Topic: [PATCH v2 09/10] xen/arm: domain_build: adjust Dom0 IRQ handling
 to support eSPIs
Thread-Index: AQHcB5d9D2bB2ytT+0KvuTkMlpIiH7Ru3KEA
Date: Fri, 22 Aug 2025 15:03:25 +0000
Message-ID: <f7e1abab-f493-4eda-b119-7be561ef7421@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
 <abba685916e6637eedbd831352bed2e968eeb7dc.1754568795.git.leonid_komarianskyi@epam.com>
 <87o6s8d3m1.fsf@epam.com> <93cd9406-030c-4915-b180-1cc90109b7d3@epam.com>
 <87y0rbbl0a.fsf@epam.com>
In-Reply-To: <87y0rbbl0a.fsf@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|PA6PR03MB10363:EE_
x-ms-office365-filtering-correlation-id: d06f5d5c-e803-4203-25a6-08dde18d0b5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dysyWXlMMkFOa01wT0cySVVxcXpmWXJ6alpKSVJoWktjNFFudkNPVkNjdlFQ?=
 =?utf-8?B?MDBVcmxKcFN1T3IyMU5VNjVpb2Y0anNFam5DUkQxaHduenZSSnRjYUhYa3k1?=
 =?utf-8?B?bEhEWjEyWTducUZDeVN5OWt6WDZTRVoybTRHOXhuL0hqSnJkWVdkLzhyWEVW?=
 =?utf-8?B?Vk5XVXptMkdKU1loY2w0ZHBOb0xOdFZGTC8yQU5wZkNBVEFiaktXRjBNbVRW?=
 =?utf-8?B?aE9OTGlUYkEwck5SMlJuUGlCSkZpK0xDNXBEbStIdE9HV0dFRTZ4ZC8vVDMr?=
 =?utf-8?B?OTcrWXNtd3NmQlNrSlpCN094RFVHNFBlVlZVR2RpT3lmMWFnQnFkMFB6cGEx?=
 =?utf-8?B?MitDOHdqQkhLTzI2ZTJkV2tFQ0tlVnZnQ0o5cGg5NGJWTkZWWERCNnU2SmhT?=
 =?utf-8?B?TEsvS1dzY21OQ1VCVEQ5TS9GcU1mSEp0T3ZsUTFoK2I0a0NUQ1lWM2xET2Y2?=
 =?utf-8?B?MlJ2UXh3eHk1dlJRUXVHcHJjMmpkRkIySFhSMm1ZMCtTbXBrYVZhT0tTS0I2?=
 =?utf-8?B?cXJmVG4rdDhZdlpIcVZQZnlqZUtBaHNrRWNhZnNjWjdHekpsWmdabDMvUGJU?=
 =?utf-8?B?ZnhxUzV2S2VSbmxES1AzTkpTTDBXOFhPdWh2K0pZL2lpbTVkaUhlbGdSSERH?=
 =?utf-8?B?U0JhQjg5VEYyaVRHRktoemEvd0tNT2tqZW45V1l2dG44MUExMldKY1pYUSs0?=
 =?utf-8?B?RDVycnN2bHRtRkdrZUFQc3NpSEg2L0tnNDFSTlVWYTVtZkI5aVg2a1FQTU1N?=
 =?utf-8?B?TDh5ZEFObzVnc2lTenpWNFJEaFBWc3RLWStBbGltNkhuc2IzUW5Vdm0yaGJh?=
 =?utf-8?B?Q05aV1BtVVoyTUU2YW9ldjdoMzVWeElFSEdaNW9raHBCR2RMSEFCN1dBVGNz?=
 =?utf-8?B?ejdmWGJsMlNPSnJJb2hCOFlwdVM0aStGZnhQcFhQNjU3K3pIejRSRU9QSjBW?=
 =?utf-8?B?WFRxcGRjSnM1TFZpRGxpcUZNT0xLN1NnVkR6ZkMzU0JGZG9KWk5weFlrWWph?=
 =?utf-8?B?SVovaGM2N3dUNVhzUjMrdnlSeVNybGI5SHY5M0Q0NVFuSXcvQmlkcEhWVm1j?=
 =?utf-8?B?M0VMYUN3MFZLN3doa3dJenhWcy9EaTNiTFJ3ZGYyL3RNdUp4WFlyemE4bExo?=
 =?utf-8?B?cHlqVDJlSDFjU1JEaU54MGkxbFhsNm92cDVwZXpaQUlvT3JwS1hINnpkc1RF?=
 =?utf-8?B?Y0RucUlwVEFIZ1B5U1VBZmlTTm1EQkFUY2JLOGtaTTUvRW9leWF3VmYwOUxn?=
 =?utf-8?B?Yno3U0xucCsxVWVWdlVTQnovUWZPYmxpbmpmNEk2bXl5Rmh2WmRDalVCVWdW?=
 =?utf-8?B?R1Fud0t1YnN2ZmZOdkpmOEh5Y3JkZ0dUUW0yS2F0T2dGMjRsQU5DQkFpV1lp?=
 =?utf-8?B?YWVTTTBCTEtzNjdBRXVaOFlqRy9sWDRlNmYvMUIvZGI0QmVNd3NPdmRLVlBG?=
 =?utf-8?B?bS8rY1d2NTdFTDBDUWg2V1BwZHk2VnYxUmw3ekdLT0trS3FIaWkzbGFBNUx3?=
 =?utf-8?B?U3Q5Z2dBNlZLYnR0dy9qendKZHMvc2g2ckh3TnlkRThRN3lsZXFCVTQzTHhx?=
 =?utf-8?B?cGdyY2RCSVplTW9RZ3dGWVN1aE1QbFRQNjk1OUNsS0NhNXB6YzdyUlp3VG53?=
 =?utf-8?B?M3ZCK3lYdW5nekpjaStSMEdkOWpiZzduKzI0dE9UMHN5bzZoWmdVMHRWaU5h?=
 =?utf-8?B?eC8vTTcxME5rUklPRTRBQ0ZZSm9NM1ZEeHZ6dkM3eFVEcmtkb3N5QStid3lS?=
 =?utf-8?B?ZjRBb045Q1lHZTh4bGtxYU1nNDhJYVo2bHBpWGE2RjFsNUpYQndIRFRMZlMv?=
 =?utf-8?B?aGhSQ3lqa3dVTTlhOEpFVTZRU3ZHSWE4emVBUFVuVnUwYVBnZ0xRVDFCeXJF?=
 =?utf-8?B?UFV3MWdEVGZDZi9uWDlleUpjbEpqSmN1QlZialFCQXl6TTRiVmx0MnI0amx5?=
 =?utf-8?B?TDM0Wno2c3NKMzc5b1NOKytyU25xNjJtelF4cDJWNkFjZjZiaFZ1QjE4K0Q1?=
 =?utf-8?B?ZVVZek5XU3FRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ME8vdkNkbGd3UXpkTnZWdGNrVU0wTHJ1NHVDVVZ3eGtFR2d4QUsrV0hnZ1lG?=
 =?utf-8?B?VXVzajg5QlZvWTExQm0zWUFMQmZtNXhLYnZTNk1mYzk2WkkrenQyaWpYbnhZ?=
 =?utf-8?B?OUNzSlRLckxyMk4wTjVzL3lLSGF6RkJOR0xOL1RiK25EUXJ1dk85amxUejBM?=
 =?utf-8?B?RWFEdFlZOEtqMEs4MEVLNzh0Z3YydER4UjExeG9nN1JBS0hQRURvbkZ6VkxW?=
 =?utf-8?B?cko1SUFkWGNPUjVqMDdGelBnRGVmeG5KWEl0Q1lsMGNhN21sd1BYNzJvSUtZ?=
 =?utf-8?B?b2FMdGhzYXgwVFRYRVZqWnJxWkl5eXZrdnlSVFpwMEtldjg2LzFmWU51RitQ?=
 =?utf-8?B?emtCL0tYYnF0TUdGODFmVm9pQ091WnVlZWovQUIzK2V2Y2VjaXdDMHQ2L0Zl?=
 =?utf-8?B?SkxhanpkUUtqMkdlWW90cE9Ba1VXOHNhS0tVREZLTnZndnJnMkJQOVpwdUZW?=
 =?utf-8?B?UDBoM2ZCU3RLWkJQOTllcGIyY1hMbldtMFU5aDIxakxYQUNKRVk0WmtZRkxi?=
 =?utf-8?B?dkFnMWdOS1V2YTBpcHJNL3EzR2srRGFoVUY4cno3VHlEd1pubGdQdzF0eTVB?=
 =?utf-8?B?RVFzMUticW1ySEVWOGsrbW40OHo4bWNmMWo2UGlBK0Z3cFJpakdQVFhCb1Qx?=
 =?utf-8?B?Vmw2SXNKcEZJSHpzVzdrK2l3eVZVZlJTSitVRktObWV3djhhQnF6NzFqNTFH?=
 =?utf-8?B?TlVuLzZYOWptNE9oMGx4QVB1NjV5OXN4VU1YNGYwUHd2bCszQzFMd25CZjJ1?=
 =?utf-8?B?U2NsY3EwZFdqdjB0Vnp3V3pnTmd2Q0RNZGZXSGt1TGRJUkZIQ1BmUkZsaEgy?=
 =?utf-8?B?cDZyWDZkaWJBdkNIVndWVmZxQ0RaTDV4T1laTE1CRUlLM0ZjMlNhdGwvV0gw?=
 =?utf-8?B?YW5RbmVyS2JiNjJhVzkva3Q4dElKdGszWU9iQzZwS05HWUd4R2xNUHh4L1c4?=
 =?utf-8?B?S0NtVFhsaHFkQTd5WDRYSjQyTTZHN2JwL0g3bURhc2x1YVpMM1JkQ0krQVpi?=
 =?utf-8?B?ajZvQm5KckhXOHNXVUx6VVVrWFFYalVxeUxhMkdKdjhFTVhydFl3NmhiY3Fo?=
 =?utf-8?B?WUpoc29jelRxa1Eza1lwOWVnaVkvV2tGVDdpSGRJRDRMdVRpS2M3WXdKL1ZV?=
 =?utf-8?B?TERCTmFRdUwrSk5IVjN5NDFWcmN3OFFHdnpPdEx0MlF4cjgzeDdSaVpKZmV3?=
 =?utf-8?B?TnNGSlRoMVNFTzB6RlFaTGNXRU1BcXVOQ0lqTDdGZ3RObkFrODhnQ2hzZVpE?=
 =?utf-8?B?N1FDQ3A4bVYzWnorWThYNXFJb3ErQk9LbkliWVhvZE9SamZzemtzTWpKcVZh?=
 =?utf-8?B?TmRVb1pKMXBBbkxRRkF3SXE2Y1pyVmtiREF5N1BDVWlzVUNOVi9rU01vVk95?=
 =?utf-8?B?YmFlb0kvcGYreHFEdm5EdGkyazZ5UDRQVi9Kd2hGOVJrbm9KSERrenBob3hr?=
 =?utf-8?B?OXVZS2xBZThUTllsR2dPT2s5aXFhVXpIMUJ4ZWVmdXdQdUZFM0ozeGEwZkli?=
 =?utf-8?B?YzN3c0xsQ1NVemhHeWp2LzBZbTlnZm02U0ovb2kzSUpPeHNGRElpbjRTK0d1?=
 =?utf-8?B?eDdyUHNXUWtlditlc1VpQjQxTXV2TFM3Rzl2SXdsM1plOG1SNGowREJyKzB2?=
 =?utf-8?B?SytLZWQ2MWJSeDhNTUtBcFFwTklRT0NnS0MxRC9ZekQ3L2FSMUFYb21Vay9B?=
 =?utf-8?B?SzVla1BiTDBKRFFGOTRlU0EweDBVZ3c5b1BlenU0bzFJK3pFT0JxRUhxakpm?=
 =?utf-8?B?Y2ZOVTQrOTcrQjVicTJMbzhHZ2NsRGRKVXlqcTFGaWptVXZ3eSt2QW9xc3J4?=
 =?utf-8?B?bnJqZjJIbjNlYTdoazRCZW5SeUVtZ0VnMVNKd3dJVG0yQjdBeC93aGlWVGJ3?=
 =?utf-8?B?cUp5UWsvTWhJNnlTT2M3Znp2RElBZUR4a2VKVE5hNmc5ekxYQWRpK2F1ZEVY?=
 =?utf-8?B?OWV2Um5iRGpLaWl5TGJ0eVRSYTJnRkV0eDUzdzFUMGJKb3E2R2tFZUIxakJ5?=
 =?utf-8?B?REhGWHQwaDgrc0M0L09rTWZMUjgyMjIyMEdCcVY0WFNZdFAyL2JLcGZoNGl1?=
 =?utf-8?B?UVJ6TVJ0a0tTTnZvenk3NlZzNW1Kc3JOL0E0Z25ObVRmbUJ2WVhHVTUvUTNw?=
 =?utf-8?B?VmYzakVYTUNVekN5QnM0akR3dm5uQmNEblBLQThRY2FXTnpzdjB1M0Z3eGo2?=
 =?utf-8?Q?Dc29ww2mpWKoniEm4LI1v7c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E406B4218D6644D9CC2A5534AC42FF9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d06f5d5c-e803-4203-25a6-08dde18d0b5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 15:03:25.3807
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QKIHdaJ1DVX/vfl7f/kTUNnjRONU14cPbO56vKk/VLWELMw06up9pYx6pkIgKx2jKfCIoytoqhKl5qjabneqN+/Z4N3OrdBrGT9Uqe6PEJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR03MB10363

SGkgVm9sb2R5bXlyLA0KDQpPbiAyMi4wOC4yNSAxNToyNiwgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6DQo+IA0KPiBIaSBMZW9uaWQsDQo+IA0KPiBMZW9uaWQgS29tYXJpYW5za3lpIDxMZW9uaWRf
S29tYXJpYW5za3lpQGVwYW0uY29tPiB3cml0ZXM6DQo+IA0KPj4gSGkgVm9sb2R5bXlyLA0KPj4N
Cj4+IE9uIDIxLjA4LjI1IDE5OjQ2LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToNCj4+Pg0KPj4+
DQo+Pj4NCj4+PiBMZW9uaWQgS29tYXJpYW5za3lpIDxMZW9uaWRfS29tYXJpYW5za3lpQGVwYW0u
Y29tPiB3cml0ZXM6DQo+Pj4NCj4+Pj4gVGhlIERvbTAgY29uZmlndXJhdGlvbiBsb2dpYyBpbiBj
cmVhdGVfZG9tMCgpIGhhcyBiZWVuIHVwZGF0ZWQNCj4+Pj4gdG8gYWNjb3VudCBmb3IgZXh0ZW5k
ZWQgU1BJcyB3aGVuIHN1cHBvcnRlZCBieSB0aGUgaGFyZHdhcmUgYW5kDQo+Pj4+IGVuYWJsZWQg
d2l0aCBDT05GSUdfR0lDVjNfRVNQSS4gVGhlc2UgY2hhbmdlcyBlbnN1cmUgdGhlIHByb3Blcg0K
Pj4+PiBjYWxjdWxhdGlvbiBvZiB0aGUgbWF4aW11bSBudW1iZXIgb2YgU1BJcyBhbmQgZVNQSXMg
YXZhaWxhYmxlIGZvciBEb20wLg0KPj4+Pg0KPj4+PiBXaGVuIGVTUElzIGFyZSBzdXBwb3J0ZWQg
YnkgdGhlIGhhcmR3YXJlIGFuZCBDT05GSUdfR0lDVjNfRVNQSSBpcw0KPj4+PiBlbmFibGVkLCB0
aGUgbWF4aW11bSBudW1iZXIgb2YgZVNQSSBpbnRlcnJ1cHRzIGlzIGNhbGN1bGF0ZWQgdXNpbmcN
Cj4+Pj4gdGhlIEVTUElfQkFTRV9JTlRJRCBvZmZzZXQgKDQwOTYpIGFuZCBsaW1pdGVkIGF0IDEw
MjQsIHdpdGggMzIgSVJRcw0KPj4+PiBzdWJ0cmFjdGVkLiBUbyBlbnN1cmUgY29tcGF0aWJpbGl0
eSB3aXRoIG5vbi1Eb20wIGRvbWFpbnMsIHRoaXMNCj4+Pj4gYWRqdXN0bWVudCBpcyBhcHBsaWVk
IGJ5IHRoZSB0b29sc3RhY2sgZHVyaW5nIGRvbWFpbiBjcmVhdGlvbiwgd2hpbGUNCj4+Pj4gZm9y
IERvbTAgaXQgaXMgaGFuZGxlZCBkaXJlY3RseSBkdXJpbmcgVkdJQyBpbml0aWFsaXphdGlvbi4g
SWYgZVNQSXMNCj4+Pj4gYXJlIG5vdCBzdXBwb3J0ZWQsIHRoZSBjYWxjdWxhdGlvbiBkZWZhdWx0
cyB0byB1c2luZyB0aGUgc3RhbmRhcmQgU1BJDQo+Pj4+IHJhbmdlLCB3aXRoIGEgbWF4aW11bSB2
YWx1ZSBvZiA5OTIgaW50ZXJydXB0IGxpbmVzIGFzIGl0IHdvcmtzIG5vdy4NCj4+Pj4NCj4+Pj4g
U2lnbmVkLW9mZi1ieTogTGVvbmlkIEtvbWFyaWFuc2t5aSA8bGVvbmlkX2tvbWFyaWFuc2t5aUBl
cGFtLmNvbT4NCj4+Pj4NCj4+Pj4gLS0tDQo+Pj4+IENoYW5nZXMgaW4gVjI6DQo+Pj4+IC0gbm8g
Y2hhbmdlcw0KPj4+PiAtLS0NCj4+Pj4gICAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jICAg
ICB8IDEwICsrKysrKysrKysNCj4+Pj4gICAgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3ZnaWMu
aCB8IDExICsrKysrKysrKysrDQo+Pj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9u
cygrKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5j
IGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+Pj4+IGluZGV4IGQ5MWE3MWFjZmQuLmZh
NWFiZjJkZmIgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0K
Pj4+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+Pj4gQEAgLTIwNTUsNiAr
MjA1NSwxNiBAQCB2b2lkIF9faW5pdCBjcmVhdGVfZG9tMCh2b2lkKQ0KPj4+PiAgICAgICAgLyog
VGhlIHZHSUMgZm9yIERPTTAgaXMgZXhhY3RseSBlbXVsYXRpbmcgdGhlIGhhcmR3YXJlIEdJQyAq
Lw0KPj4+PiAgICAgICAgZG9tMF9jZmcuYXJjaC5naWNfdmVyc2lvbiA9IFhFTl9ET01DVExfQ09O
RklHX0dJQ19OQVRJVkU7DQo+Pj4+ICAgICAgICBkb20wX2NmZy5hcmNoLm5yX3NwaXMgPSBWR0lD
X0RFRl9OUl9TUElTOw0KPj4+PiArI2lmZGVmIENPTkZJR19HSUNWM19FU1BJDQo+Pj4+ICsgICAg
LyoNCj4+Pj4gKyAgICAgKiBDaGVjayBpZiB0aGUgaGFyZHdhcmUgc3VwcG9ydHMgZXh0ZW5kZWQg
U1BJcyAoZXZlbiBpZiB0aGUgYXBwcm9wcmlhdGUgY29uZmlnIGlzIHNldCkuDQo+Pj4+ICsgICAg
ICogSWYgbm90LCB0aGUgY29tbW9uIFNQSSByYW5nZSB3aWxsIGJlIHVzZWQuIE90aGVyd2lzZSBv
dmVyd3JpdGUgdGhlIG5yX3NwaXMgd2l0aCB0aGUNCj4+Pj4gKyAgICAgKiBtYXhpbXVtIGF2YWls
YWJsZSBJTlRJRCBmcm9tIGVTUEkgcmFuZ2UuIEluIHRoYXQgY2FzZSwgdGhlIG51bWJlciBvZiBy
ZWd1bGFyIFNQSXMgd2lsbA0KPj4+PiArICAgICAqIGJlIGFkanVzdGVkIHRvIHRoZSBtYXhpbXVt
IHZhbHVlIGR1cmluZyB2R0lDIGluaXRpYWxpemF0aW9uLg0KPj4+PiArICAgICAqLw0KPj4+PiAr
ICAgIGlmICggZ2ljX251bWJlcl9lc3BpcygpID4gMCApDQo+Pj4+ICsgICAgICAgIGRvbTBfY2Zn
LmFyY2gubnJfc3BpcyA9IFZHSUNfREVGX05SX0VTUElTOw0KPj4+PiArI2VuZGlmDQo+Pj4+ICAg
ICAgICBkb20wX2NmZy5hcmNoLnRlZV90eXBlID0gdGVlX2dldF90eXBlKCk7DQo+Pj4+ICAgICAg
ICBkb20wX2NmZy5tYXhfdmNwdXMgPSBkb20wX21heF92Y3B1cygpOw0KPj4+PiAgICANCj4+Pj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS92Z2ljLmggYi94ZW4vYXJjaC9h
cm0vaW5jbHVkZS9hc20vdmdpYy5oDQo+Pj4+IGluZGV4IDlmYTQ1MjMwMTguLjExN2IzYWE5MmMg
MTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS92Z2ljLmgNCj4+Pj4g
KysrIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3ZnaWMuaA0KPj4+PiBAQCAtMzUzLDYgKzM1
MywxNyBAQCBleHRlcm4gdm9pZCB2Z2ljX2NoZWNrX2luZmxpZ2h0X2lycXNfcGVuZGluZyhzdHJ1
Y3QgdmNwdSAqdiwNCj4+Pj4gICAgLyogRGVmYXVsdCBudW1iZXIgb2YgdkdJQyBTUElzLiAzMiBh
cmUgc3Vic3RyYWN0ZWQgdG8gY292ZXIgbG9jYWwgSVJRcy4gKi8NCj4+Pj4gICAgI2RlZmluZSBW
R0lDX0RFRl9OUl9TUElTIChtaW4oZ2ljX251bWJlcl9saW5lcygpLCBWR0lDX01BWF9JUlFTKSAt
IDMyKQ0KPj4+PiAgICANCj4+Pj4gKyNpZmRlZiBDT05GSUdfR0lDVjNfRVNQSQ0KPj4+PiArLyoN
Cj4+Pj4gKyAqIFJldHVybnMgdGhlIG1heGltdW0gZVNQSSBJTlRJRCBzdWJ0cmFjdGVkIGJ5IDMy
LiBGb3Igbm9uLURvbTAgZG9tYWlucywgdGhlDQo+Pj4+ICsgKiB0b29sc3RhY2sgYXBwbGllcyB0
aGUgc2FtZSBhZGp1c3RtZW50IHRvIGNvdmVyIGxvY2FsIElSUXMuIFdlIHdpbGwgYWRkIGJhY2sN
Cj4+Pj4gKyAqIHRoaXMgdmFsdWUgZHVyaW5nIFZHSUMgaW5pdGlhbGl6YXRpb24uIFRoaXMgZW5z
dXJlcyBjb25zaXN0ZW50IGhhbmRsaW5nIGZvciBEb20wDQo+Pj4+ICsgKiBhbmQgb3RoZXIgZG9t
YWlucy4gRm9yIHRoZSByZWd1bGFyIFNQSSByYW5nZSBpbnRlcnJ1cHRzIGluIHRoaXMgY2FzZSwg
dGhlIG1heGltdW0NCj4+Pj4gKyAqIHZhbHVlIG9mIFZHSUNfREVGX05SX1NQSVMgd2lsbCBiZSB1
c2VkLg0KPj4+PiArICovDQo+Pj4+ICsjZGVmaW5lIFZHSUNfREVGX05SX0VTUElTIChFU1BJX0JB
U0VfSU5USUQgKyBtaW4oZ2ljX251bWJlcl9lc3BpcygpLCAxMDI0VSkgLSAzMikNCj4+PiBOYW1l
IG9mIHRoZSBkZWZpbmUgaXMgd3JvbmcsIGFzIGl0IGlzIG5vdCBudW1iZXIgb2YgZVNQSXMuIEFj
dHVhbGx5LCB0aGlzIGlzDQo+Pj4gbWF4aW11bSBTUEkgKGluY2x1ZGluZyBlU1BJcykgbnVtYmVy
Lg0KPj4NCj4+DQo+PiBUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3Lg0KPj4gV291bGQgaXQgYmUg
b2theSBpZiBJIHJlbmFtZSB0aGlzIG1hY3JvIHRvIFZHSUNfREVGX01BWF9TUEk/DQo+IA0KPiBZ
ZXMsIEkgdGhpbmsgdGhpcyBpcyBiZXR0ZXIgbmFtZS4NCj4gDQoNClRoYW5rIHlvdSBmb3IgeW91
ciBjb25maXJtYXRpb24uIEkgd2lsbCByZW5hbWUgdGhpcyBtYWNybyB0byANClZHSUNfREVGX01B
WF9TUEkgaW4gVjMuDQoNCkJlc3QgcmVnYXJkcywNCkxlb25pZA0K

