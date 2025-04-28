Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F48A9F36B
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 16:29:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970774.1359367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9PTo-0005Al-Po; Mon, 28 Apr 2025 14:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970774.1359367; Mon, 28 Apr 2025 14:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9PTo-00058A-MV; Mon, 28 Apr 2025 14:29:08 +0000
Received: by outflank-mailman (input) for mailman id 970774;
 Mon, 28 Apr 2025 14:29:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MVu+=XO=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1u9PTn-000584-IN
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 14:29:07 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060b.outbound.protection.outlook.com
 [2a01:111:f403:260e::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1adb9a23-243d-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 16:28:51 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB9PR03MB7499.eurprd03.prod.outlook.com
 (2603:10a6:10:22e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Mon, 28 Apr
 2025 14:28:48 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%4]) with mapi id 15.20.8678.027; Mon, 28 Apr 2025
 14:28:48 +0000
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
X-Inumbo-ID: 1adb9a23-243d-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mVjwlBX69q0RCqOF52AYmHlIeaGZuLF8K7EdXVHWjNtT8oUmSiAtEFS7VzMZiifbinPEEvLl2u4+qbTUH9Ar5fNFlIfJv6g7/rEYHcunjRD4s8NQ/vOHtI4BLnCCIU1NAngionIuQcg/pvIj4SrK69rWeCm3ww4jpYCdcX/Kz2PleoSiWvW2FeNKgtDIWL1xKrgfem2swlOz7jfxEnAgKHWnFyPVbbl1W2gzrpyhLIHV+pdN4S7Uy4nZ0CBQvuKc2iP7Haz6HcQDuFxYg95g1JhBynvEJZQReTzmjNHdsxBOrEBhLV9B/KFRBgW5dV190i98bzmkNg5DIeKVbaP9yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unOwEfd28qiN6Jt4Zc1O3QUcdvMaQ7KLkAs5W77BYJk=;
 b=Br4lyyC2A7FTic9T0qsLwLQVWdh9Lj20RR6RN8Bq3LJX7zT1tLU4OXMXscV2okHyqwQza4KPJDaxBK3WqRWx1pyVHLWvl1+7ZmFK7qBdmruknjEyTbfuToPVPyt1mC7eswSVQFO7elKCo2qegXdYLMev18kJsrqmjn6w6cuggoSxAo1tZeKCrlZRJDwumXGYI6hVZ42Ul78sWVhuwLHvcuTL7wQSb+mfj2Sj3WLAPbdHLTtwDfTsUP5Bz0Nmp3sgXHb8ao0tzOci+CkwLhelh0mggV40OuVTSODteukdfpeIjsxJOEXXLiPn2uy3eXzVEWQdNatriMk3YriilKlOhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unOwEfd28qiN6Jt4Zc1O3QUcdvMaQ7KLkAs5W77BYJk=;
 b=pRN2+pcdktc7kufMrpqTIsu1w/pzbGaIH52qbp5VXnbrViaESWzZ4ckWxj1OGq/q0kAqKo7xdx1w3LKrCJUEoIkMyg28JtYcziMHhePziuBtqk8ek0L9D4nxW4qaG1zMpQ+CulXGKUj7P3OklBkfQ5UpXYlDi71aBCqTHBgSyS5Tmwmv2+fBoo8q91xR4Z8klfjJnFOB/aC9iRVzzS7AohoDB2v/WcIUgn4OHQ+25I1AFDGefsBVeNVWRS5CH9/8lnmY8SxLNvi2tMAwhAEvThlvNeLlbjhR8Mt6OlyySN1NdimSqZFuLoTwhddVl28LDgB7Uz6ED3enEy3AekjxDg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v9 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Topic: [PATCH v9 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Index: AQHblOXdxbIbbkNtn0WSg/9tW2OJ47O5DGKAgAA8u4CAAAbVAIAAGfaA
Date: Mon, 28 Apr 2025 14:28:48 +0000
Message-ID: <c61acb06-4770-434d-8158-d7e0b4b32f04@epam.com>
References: <cover.1741958647.git.mykyta_poturai@epam.com>
 <132afbca390edd6e9fd7b1ffacf6c5aff0d29aa7.1741958647.git.mykyta_poturai@epam.com>
 <7d376741-ff23-4618-83bd-415c8d8fa24e@xen.org>
 <ae2c8d37-e350-4125-921f-3d320c28d6cd@epam.com>
 <a1715315-f4c8-4062-89db-e2df7b22865b@xen.org>
In-Reply-To: <a1715315-f4c8-4062-89db-e2df7b22865b@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB9PR03MB7499:EE_
x-ms-office365-filtering-correlation-id: 31f7146d-6a27-4081-2f2a-08dd8660fd4c
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UHhFYmg2UUM3RUZyNG5rcEJtZGhTaEFXc3JFWmtPbEEzSEJ1anFFdTBibzFU?=
 =?utf-8?B?ZnB2MlVhcUg2VndqZ2VrYk9yYm10UVZYRDRmWmhCamxIUXhpRTQ3TzgwZnB5?=
 =?utf-8?B?SXBOaEIvUU9XUExxRWJad1FPTlQ2T1MvNW9xbUVudW95Szg3aHR6VWdoZU9x?=
 =?utf-8?B?TFh3dE5qWVZzbFV0WU8rZXp1a2lmVXBOaFlSVExoUmtseWpVUEdsNTJta0hY?=
 =?utf-8?B?dWFIVE1ZR29MOW9WbWtyTUhXS0dyUkFTbnBVVTQzVFRGVHZtMUZDaUtqQjdv?=
 =?utf-8?B?NzBCdUJLSHNISGc4UWl4d2pmdG1NYmlwSHNVYVFSb3JGQUJzNXJ4RURETjU2?=
 =?utf-8?B?aSs0SmNINmNJZkxhRXBjTXhHdGtrQUxzb1VYUXF1UHFDOVV4ZjlVeEV2R21p?=
 =?utf-8?B?aGpvQk90WUcvbUttVDFPaG1zZThpS1pXT3BJL2FwNGROQjhqckZzTzhUSncw?=
 =?utf-8?B?K2tSRnZjakNDSGZjbzQzaU9UelZMQVczUE5RODRHVUpqRjhLcnpONStaN1cx?=
 =?utf-8?B?UDF4MEFvaWc3WGhWRjg1bkFET2ZnUlhwakhnYzA4TU5CbG5WQlkyS2VNNXB6?=
 =?utf-8?B?UVpNVjBRM2hIN2toS0lRQU13cU55N0VJSWdlNnJCVHNNWllQeWh6enN5eVRC?=
 =?utf-8?B?VWErTi9RYTBvZWVrRjN6SWRBcXA4SFlOOXBFZWplR2lkNWVsYWlXZXNYdmt1?=
 =?utf-8?B?TUxTSGQrTmExOHVtbEpLMW1QbEZjZThQOUZqMzNNcnZCZDRKQmxicjZYVjZ1?=
 =?utf-8?B?ZWJDOCt3dG5lTGtsOHMvRWN6dERYNm8vUXMzKzl2M2M1OHJROFliOEFnRXp4?=
 =?utf-8?B?RlRKNTE4L0xVSE1kV2cyTUFabnZrUHZleEZIS3hROGI4WUZpRVk3My82czhy?=
 =?utf-8?B?bUYvU0xtYWdRRFVVNjBPQi92RFdoRVdMNGJtZTFWMjV3eVdPNnJrUVlSeFhC?=
 =?utf-8?B?VHRlUVlsUE0rMkgvYnhIcDlIUkVWU2l0OW1rNnFnSlNJd3pTb0krZEYrc1RF?=
 =?utf-8?B?K3FEdmc1NU52RWt4M1RNVU5OYUhQbkQrOWFLekZlOEo0bHlJOE5aY09sMzY4?=
 =?utf-8?B?RnZ6Z2ZLS01pN2NMNEo3NTRiVmNmem5hRzBrQzZKWENSazA1aUYyVkxteVlx?=
 =?utf-8?B?Ukp4QmtTQ21JRTFraitxbTlMelRSK1ZhdUI0UVhsdVJHY1pkM2NmSS9NN2tO?=
 =?utf-8?B?TzN6TEwvQVpiQ3NmNEM0aVdJbmhwNGtpcnBBcVpvK1pZRzllT3hDdURiWlUr?=
 =?utf-8?B?UEJFN0RRSEhzMjQ0RmdHM1V1eWVxUnlyVVZLYllPV0dyTUJkblpkTE9sekx5?=
 =?utf-8?B?M2NZSEVFNDA1OWp5a2V2QTZrT0RMcUw3TDV0SUJLdW5Fc2c5bGwxOXhsb0JI?=
 =?utf-8?B?dlVheXFxOS9oKzhxTnRjUEk4TlduZnB2NTNDYmlDajR6YlNuTFJrV2ZlRFNW?=
 =?utf-8?B?OXpYdXllZGppSnBTRk1qRG9wS3MxQWRmVG1PWHlMaHJrcjNHVUYwU25QSTdH?=
 =?utf-8?B?eUcxZVdCS3NsM3BpRmtpQkFLRCtYNUNjTUlmM291VVBWM3hPdm9BM3UwTllY?=
 =?utf-8?B?V0FGV0c0bTBSTmRDamJ4Z3RuZXFrU0lLTEtIK0R4YTJNSG5pQTdqcmwzdmFN?=
 =?utf-8?B?bE1jVDdEUjBYczIrd2M5b2Z0STRrdE9oTVp3MTI0T0FNNENVTDFaZHJIeVlR?=
 =?utf-8?B?em1TWmovZXlQeWpXcEFzaEM4ZThNZXlsQWRDbURYQUpEeWVZTjRIeEtmc3Nw?=
 =?utf-8?B?Nk5WQXlkSzQrbDk3bWdXV3gxbG9NT1p0SzhyWVhZOUo2cU4zN0J0QXFTNm43?=
 =?utf-8?B?RUZGaXlUbWlIWGc4RXpoTGs2RWZleUhvaC9mMFBHV0YrVnc4REVWYVFvYUhJ?=
 =?utf-8?B?TlNZZjd1ZktUTnBiWmUxYXlacUNaTWkvWVhCZXJZaXFQN1RoVVpyM2l1Vy9R?=
 =?utf-8?B?cWdaRklzYXdkOHhRYW5lRmFmY1lxWGx1TVhKZEluRlV0UWYzN3J3MWM1RWk5?=
 =?utf-8?Q?+TNQtl9Zl4AFfJ60gh9gHqqc37j7Fg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V1pJenBNSnF4VGRYQzBOZTk4N1VGbkh0WXpNZlBKSUJKWVNIbmNycXU2QXBS?=
 =?utf-8?B?dTI0SkdLWUo2SE9CSjRHMXpqNjlCbll5aGFldWErc1h6UExlRGlzb0p3NXlF?=
 =?utf-8?B?bm9jWFRMQThqVUU5VmwwYjZWNEpSd2FEby9QU1dDUkhDUFFUUGZhTmwvUU5P?=
 =?utf-8?B?Q0d1REVISGU1ZkZob2p1YkJoU3c4TGJYNW9vTnh1aW13YXRRVG5rSWNvVjNi?=
 =?utf-8?B?alRTa1B2bXE2OU1COGFTdUlydUEybHJ6b282c2szZkFib0FjWGt0YXRlcUVm?=
 =?utf-8?B?Q1RYSUwwNU9CeDVUTGRkT2UxcldqZDAwL1dOUFo1dFFBNHVBbTB3Qk8xY0tN?=
 =?utf-8?B?aGNpc2RZWDhEcHRkaTAvZ3pVcy9Oc1B5T01SNWs1dVVESmN2NTZKczRsZ0lo?=
 =?utf-8?B?TGFnd0VqbFVGY21hMXFUcVB4czNHVE8relVtcmw1VEJTWmx2L2tnSUdqOEVB?=
 =?utf-8?B?T01CU2tESE1tQTB2aDlDMWJleERMV1Q5MkpuSGRyNGZBWXZVczZENWgrSWx6?=
 =?utf-8?B?VTNjbGNHbUM5SnhRU2JiNWlBYWpwczB0NXh4UHlNRy81RGZDNFcxNTl3Qytr?=
 =?utf-8?B?TXJ4b2dqcGpqRlhQanBpNUtuTTlhK1h5eGNnakEvUFNxNWh0NlY4RWxHOTFC?=
 =?utf-8?B?MnhkZUxNbXJjbUtNckU5czl4MXlYOWZxcTNPY0I2c1o1cmdzYkVOLzFlZXpQ?=
 =?utf-8?B?S0V5TmYxZlM1aXhjdEgySXpBOGx4OWFocUpOckhSbTBOQ2tScXZOeVlvZElz?=
 =?utf-8?B?WEhOdktoNUgzdU92dHQ0aDQ5Nnh5bEFrNmwvT3ZhT05RdWxwR21qNlNRckVh?=
 =?utf-8?B?V28rK2w1V1FaclZNUk1vdXhNSWRWcmNzcXVrQ0tXK1pib1p6NThzREVGY0JL?=
 =?utf-8?B?WXhtV0Fkc080aWFiVk1maGdHN2t4aFhMMXcyNlliK0F3UHRXM0hXcXY3bW9r?=
 =?utf-8?B?c29PMEZoWjFDV3c5WlpiMnJ5WFlZeTNWK09MNDNLOHRxaHpmbVN4TTFHZ1N1?=
 =?utf-8?B?ZWR2dFJuUzhQdXJ6QjNXY0prVWJpQmtKY1AvTzREOG9STUo0cDE0OVU4S2pD?=
 =?utf-8?B?Y3Z1Nkx5SWU0cHhVdE51QVQxcXFpYnI5VjFOcUhiRit4TW5ydE9NbVcvZ05U?=
 =?utf-8?B?Y3B5WHNaelFIMHU3TjAyWDQ0YUFEci90ZUF0cElKWTNtayt2RHNUMHdZVC85?=
 =?utf-8?B?Nk5SMUhnbFUya1Bnb25OeHZNRXJ4QVpPQ3RpdWQxb3ZnOGtlZk1pemlUMVFj?=
 =?utf-8?B?Z1BXM1VJeEZFdGFZS0h5NWJHUlVzTFFoOG9sVWhDemwvZ2pmejE1eTEwWExB?=
 =?utf-8?B?Y0hzMGNpYTBsa3FEeFV0REQvb25KUTBuZndDVEdvRHVqNFRwTUhoTGNObUtZ?=
 =?utf-8?B?a05xQ1ZmQ1ZqY2J4VDJuMW5KWWlGRTN1WDJpU1h5UVhENU90VW9SWHB6OHU0?=
 =?utf-8?B?a3dtVDhZeTJEQU9YSnhjNmp2bS9zeDBNam1HQUtKYkRXMzQ4UlRPNWFrNFFI?=
 =?utf-8?B?dXhyNEJ4VGxFVEUrTzhvZGFQaEMvdVVyYVJaeTZ1L1Y4U0NGTGdjbytmcGZS?=
 =?utf-8?B?ZXN2YjNtelZGaHAzeWVTRko0eFExL3lmZUhaRmRIK1I3NFExOG9BSHFzYzRS?=
 =?utf-8?B?b3NMUVNTcWg0MHI0R245dm1tejg5UzNGc3luL1VOUjlqcHkyUm9xYXVnWFZk?=
 =?utf-8?B?Rit6MXBRaUtJSE9IUzJFcHZlK2pVV2F6ekxTamJkMmtjemZSUkNIMUx3NmFz?=
 =?utf-8?B?WWdlbU1BcmlrQVMyOHJ3bWVDTWl1Q1JwYllpWGRaWnFqc0dlTk5KR00rN3FF?=
 =?utf-8?B?VlZadWJQMThsTzRrNWx2emZ6YVE2aE4vWEJTeURBZzdycHVFSERsZmRyTWlk?=
 =?utf-8?B?S3hZbzJUTWFiTTFNSmVXMUM4Qm9YVGVDdnZiSjFUTlpoZ3p6VnR2SGxIUXJS?=
 =?utf-8?B?NjhqZ3Y4V3hiRTVSc1gwa1NyVXIya1pCZGxtK1Y2Zk9uOTlML2xQQ1pqMGxN?=
 =?utf-8?B?Zm0vcHgzR0lhc1FvbGE4NmFTQjRZQXNoekljY29RMFlyQk9EZ25WVkJ2NnY0?=
 =?utf-8?B?SlJmOG9ZZC9KcVhuczVFaVJOR3BJMkJMSEpuQjNNU3k0My9jQVZOTW1sdkpV?=
 =?utf-8?B?ajhvZVNjVmtEaHQ4V1k3dDBrYktoRTM3cU9wUks1Q2JFL0Y5ZkhlVkVsTzMy?=
 =?utf-8?B?T0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CEDB39782BFBD84D91A2F35D0C2230EF@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f7146d-6a27-4081-2f2a-08dd8660fd4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 14:28:48.0585
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: arIxoXGUStXS7G1n7rRyzaGkVvYwce1kO/o9MqD9bx9YWVi6ovs27NLd0n50A5b3HPNaC5y/wljC3xI6KGWCDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7499

T24gMjguMDQuMjUgMTU6NTUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBPbiAy
OC8wNC8yMDI1IDEzOjMxLCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IE9uIDI4LjA0LjI1IDEx
OjU0LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4gSGkgTXlreXRhLA0KPj4+DQo+Pj4gT24gMTQv
MDMvMjAyNSAxMzozNCwgTXlreXRhIFBvdHVyYWkgd3JvdGU6DQo+Pj4+IEZyb206IFN0ZXdhcnQg
SGlsZGVicmFuZCA8c3Rld2FydC5oaWxkZWJyYW5kQGFtZC5jb20+DQo+Pj4+DQo+Pj4+IEVuYWJs
ZSB0aGUgdXNlIG9mIElPTU1VICsgUENJIGluIGRvbTAgd2l0aG91dCBoYXZpbmcgdG8gc3BlY2lm
eQ0KPj4+PiAicGNpLXBhc3N0aHJvdWdoPXllcyIuIFdlIHJlbHkgb24gZG9tMCB0byBpbml0aWFs
aXplIHRoZSBQQ0kgY29udHJvbGxlcg0KPj4+PiBhbmQgcGVyZm9ybSBhIFBIWVNERVZPUF9wY2lf
ZGV2aWNlX2FkZCBjYWxsIHRvIGFkZCBlYWNoIGRldmljZSB0byBTTU1VLg0KPj4+DQo+Pj4gSXQg
d291bGQgYmUgZ29vZCB0byBleHBsYWluIHdoeSBYZW4gY2Fubm90IGluaXRpYWxpemUgdGhlIFBD
SQ0KPj4+IGNvbnRyb2xsZXIuIEFza2luZywgYmVjYXVzZSB0aGUgcmVhc29uIGlzIHRoZSBQQ0kg
Y29udHJvbGxlciBpcyB0b28NCj4+PiBjb21wbGV4LCB0aGVuIHlvdSB3aWxsIGxpa2VseSBuZWVk
IHRoZSBzYW1lIGFwcHJvYWNoIGZvciBQQ0kgDQo+Pj4gcGFzc3Rocm91Z2guLi4NCj4+DQo+PiBJ
IHRoaW5rIHRoZSBtYWluIHJlYXNvbiBmb3IgdGhpcyBpcyBjb21wbGV4aXR5IGFuZCB0aGUgcG9z
c2liaWxpdHkgb2YNCj4+IGFkZGl0aW9uYWwgZGVwZW5kZW5jaWVzOiB0aGVyZSBjb3VsZCBiZSBl
eHRlcm5hbCBjbG9ja3Mgb3IgcmVzZXQgcGlucw0KPj4gdGhhdCB0aGUgUENJIGhvc3QgZGVwZW5k
cyBvbiBmb3Igd29ya2luZyBjb3JyZWN0bHkuIEkgd2lsbCBhZGQgdGhpcyB0bw0KPj4gdGhlIGNv
bW1pdCBtZXNzYWdlLiBSZWdhcmRpbmcgUENJIHBhc3N0aHJvdWdoLCBpdCBpcyBhbHJlYWR5IHVz
aW5nIHRoZQ0KPj4gc2FtZSBhcHByb2FjaCAoYXQgbGVhc3Qgb24gQXJtKS4gVGhlcmUgYXJlIHBh
dGNoZXMgZm9yIGVuYWJsaW5nIFhlbiBvbg0KPj4gQXJtIHRvIHBlcmZvcm0gYnVzIGVudW1lcmF0
aW9uIGJ5IGl0c2VsZiBieSBMdWNhIEZhbmNlbGx1LCBidXQgSSBoYXZlbid0DQo+PiB5ZXQgZ290
IHRvIHRlc3QgdGhlbSBpbiBhIG1lYW5pbmdmdWwgd2F5Lg0KPiANCj4gQ2FuIHlvdSBwcm92aWRl
IGEgbGluayB0byB0aGUgc2VyaWVzPyBJIHdvdWxkIGxpa2UgdG8gbWFrZSBzdXJlIHdlIGhhdmUg
DQo+IGEgY29oZXJlbnQgYXBwcm9hY2guIEluIHBhcnRpY3VsYXIsIGl0IGlzIG5vdCBjbGVhciB0
byBtZSBob3cgRG9tMCBhbmQgDQo+IFhlbiB3aWxsIGJlIGFibGUgdG8gY29vcmRpbmF0ZSB0aGUg
YWNjZXNzIHRvIHRoZSBQQ0kgY29udHJvbGxlci4gQXJlIHdlIA0KPiBnb2luZyB0byBoYXZlIGEg
bWVkaWF0b3I/DQo+IA0KDQpIZXJlIGlzIGEgbGluayB0byBteSBXSVAgYnJhbmNoDQpodHRwczov
L2dpdGh1Yi5jb20vRGVlZG9uZS94ZW4vdHJlZS9wY2lfcGFzc3Rocm91Z2hfd2lwDQpBbHRob3Vn
aCBpdCBpcyBzbGlnaHRseSBvdXRkYXRlZCBkdWUgdG8gcmVjZW50IHJldmlldyBhY3Rpdml0eSwg
SSB3aWxsIA0KdXBkYXRlZCBpdCBzb29uIHdpdGggYWxsIG9mIHRoZSByZWNlbnQgY2hhbmdlcy4N
Cg0KTHVjYSdzIGNvbW1pdHMgYmVnaW4gZnJvbSBjNjhhNWNiYjFhN2QxNzkwNzU1MTE1OWM5OWFi
NWM4N2NlMGRlZGY5DQoNCkkgd2Fzbid0IGFibGUgdG8gZmluZCB0aGVtIHNlbnQgdG8gYW55IG1h
aWxpbmcgbGlzdHMsIGJ1dCBJIHBsYW4gdG8gYWxzbyANCnNlbmQgdGhlbSBhZnRlciB0aGUgYmFz
ZSBjYXNlIHdpdGggRG9tMCBlbnVtZXJhdGlvbiBzdGFiaWxpemVzLg0KDQpUaGVyZSBpcyBubyBt
ZWRpYXRvciwgRG9tMCBjb25maWd1cmVzIHRoZSBob3N0IGNvbnRyb2xsZXIsIGVudW1lcmF0ZXMg
DQpjaGlsZCBkZXZpY2VzLCBhbmQgdGhlbiBnaXZlcyBjb21wbGV0ZSBhY2Nlc3MgdG8gc29tZSBv
ZiB0aGVtIHRvIFhlbi4gDQpYZW4gb25seSBkb2VzICJsb2dpY2FsIiBvcGVyYXRpb25zIHdpdGgg
Y2hpbGQgZGV2aWNlcyBhbmQgZG9lcyBub3QgDQpjaGFuZ2UgYW55IG9mIHRoZSBob3N0IGNvbnRy
b2xsZXIgYmFzZSBzZXR0aW5ncy4gVG8gZW5zdXJlIHRoYXQgRG9tMCANCndpbGwgbm90IG1lc3Mg
d2l0aCB0aGUgY2hpbGQgZGV2aWNlcywgdG9vbHMgYmluZCB0aGVtIHRvIHRoZSBzdHViIA0KZHJp
dmVyLiBUaGVvcmV0aWNhbGx5LCBEb20wIGNhbiBiaW5kIHRvIHRob3NlIGRldmljZXMgYWdhaW4g
YW5kIGJyZWFrIA0Kc29tZXRoaW5nLCBidXQgaXQgY2FuIGFsc28gZG8gYSBsb3Qgb2Ygb3RoZXIg
YnJlYWtpbmcgc3R1ZmYgc28gSSBkb24ndCANCnRoaW5rIHRoZXJlIGlzIGEgZ29vZCByZWFzb24g
dG8gaW52ZW50IHNvbWUgZm9ybXMgb2YgcHJvdGVjdGlvbiBmcm9tIGl0Lg0KDQpBZnRlciBzb21l
IHRpbWUgd2l0aCBwY2ktc2NhbiBjaGFuZ2VzIG1lcmdlZCBpdCBzaG91bGQgYmVjb21lIHBvc3Np
YmxlIA0KdG8gbWFrZSBYZW4gZG8gdGhlIGVudW1lcmF0aW9uLCBhbmQgb25seSBnaXZlIERvbTAg
dGhlIHZpcnR1YWwgUENJIGJ1cywgDQp3aGljaCB3b3VsZCBwcmV2ZW50IGl0IGZyb20gYWNjZXNz
aW5nIG5vbi1vd25lZCBkZXZpY2VzLg0KDQotLSANCk15a3l0YQ==

