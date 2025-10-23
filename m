Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BFEBFEEF2
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 04:26:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148621.1480548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBl1G-0000u5-VV; Thu, 23 Oct 2025 02:25:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148621.1480548; Thu, 23 Oct 2025 02:25:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBl1G-0000rM-Pv; Thu, 23 Oct 2025 02:25:38 +0000
Received: by outflank-mailman (input) for mailman id 1148621;
 Thu, 23 Oct 2025 02:25:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yEuJ=5A=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1vBl1F-0000qx-9S
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 02:25:37 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d74c2d0-afb7-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 04:25:35 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by LV2PR12MB5773.namprd12.prod.outlook.com (2603:10b6:408:17b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 02:25:30 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::53da:e77e:261e:5a29]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::53da:e77e:261e:5a29%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 02:25:30 +0000
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
X-Inumbo-ID: 8d74c2d0-afb7-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xb55xaJy05uRO5uGPdBbDgHxsjj00Id94I/ByHaqS0vnzxF/CaUW51O2gxSGmIsYnkH/wn5Ryc4V3tmF0lwMPQiu4vjo8y5QjChsKIpAJdh3kyQeVf+CWhg8d/Jt23oLDQidR0SQ0J0mXyLMXN22Xqd27kFNDOYtsXauhWNIo6/WFVoW+HDVdUNBQfZozuomAu78WvWovsc1/I2X1Tg8pk1Rvya73yDz9SLDBpnp1pdQp17Bh8uy8bWJ68YgLeezND/+gsVUUmAzH/iRHLtrGzhjnfm7WDQeVI+QTxlrZgfugzpIYrKxDgYkHsCKMbZODJZOzpt81/X4HfXb+886qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwI8Jl+ChhvKoKQaMS6NJrodNHxjYspB7aG2ObOZ+OQ=;
 b=NYhxY7dGq/RLvdkAPjKh9O2aJmxK9mhJ0AnPmkguNMhXI5KVuAEsj/NbDOebHwAo9HfQR0ivhDMK3npoFi7UsGHkuSt0zonGFZ3tfqla1pBc12uQhSBcBosfX36JU5NiKv9lT6B06osk72T+lns79mdZ/lt+Uknik8bzuLJpcyshl7YL9WsEo9HXSwmbUvhrCiKMTrVGgd0spxc+nUXwAFVo45WKJ46qS6OVhVgkOm+cODpuKINl9LoioLK+Y0pzIMKoXwYYf0gbGByv0Nl9fQIClSdxVFwpjQ29fcowLlSELl5JFJpQJ9GB+5cO3zlir1UroLfrl5w4UwbFYPOpZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwI8Jl+ChhvKoKQaMS6NJrodNHxjYspB7aG2ObOZ+OQ=;
 b=d2yET/ptm5DwPQqTC4Ub//2nIH5PWa3v2B7np5YXSTcLmM8UaBacxnFyayG5+16GDiRtjYfasM4wdylOSaUJpDnLvyUjAhY/OgYEy1dnlG4Nks0vVzHtMmj9BkEp3/aHqlJ4bksCxhLgZ9172ozpAMdW8z6kBHhzN6OgbU7dDc8=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Anthony PERARD <anthony@xenproject.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, "Chen, Jiqian"
	<Jiqian.Chen@amd.com>
Subject: Re: [PATCH v2 1/1] tools/libs/light: fix BAR memory address
 truncation
Thread-Topic: [PATCH v2 1/1] tools/libs/light: fix BAR memory address
 truncation
Thread-Index: AQHcPBVojxVVZQBbcUyvi85wGyhb8bTOXUEAgAE5GYA=
Date: Thu, 23 Oct 2025 02:25:29 +0000
Message-ID:
 <BL1PR12MB584995CDDDB34F3CA6A03B50E7F0A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20251013074533.67478-1-Jiqian.Chen@amd.com>
 <aPj7zIQ0b0wYFQ6w@l14>
In-Reply-To: <aPj7zIQ0b0wYFQ6w@l14>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.9253.009)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|LV2PR12MB5773:EE_
x-ms-office365-filtering-correlation-id: a3f19bb8-1d8e-4bac-387c-08de11db6f93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?MG85RWt4Ly9WOFdMdGZIQWdwcTAvMnE0MHpjaEZkUDNsbjhldjhSVVVieEtR?=
 =?utf-8?B?clE2WFdGWkQ5emQwUU9yazBJUHNxbjNLSTNoVmNLZGxvaDlWa1VGcW5CS2ZF?=
 =?utf-8?B?OEpSc0krQzluRkpGbEVvKzRmdlNOUlVDZVZaVkR2ZlQvanNRMEdNd3ZtMVhS?=
 =?utf-8?B?ZzgzY2haWHhRSkMrMzNReDZSbkREbXlJTk9IMmNuaCtaR2NIbEVEcFpyL1Fq?=
 =?utf-8?B?NlZiRkY2TC9mRHdzaEtUYVpKb05LOFluakVQTU9rdm00SzI2R3hmMHovRHFT?=
 =?utf-8?B?ajlwa2tKdmlFYlpGblI2a0p4SlpkOGRldDFEaDd5R2RkNzVvR1NmU3oyYkhu?=
 =?utf-8?B?VzN5c3c1dzlIRjFuS3pIVU5PQmlURm1yVnFJKzI3RTMwOXB1YS9MdTlTK0pq?=
 =?utf-8?B?WDlCVG9SYmV2WXl6Z2RsZW9UK28xK3pBT2lZSENGK1Z1OGFORE54bzVhR3pz?=
 =?utf-8?B?WkxEMHRWWVpTV2tuN3dNS3I0S1UzSmJiUy9QT3pjVFlpR2ZPUlZ4VXZOOXha?=
 =?utf-8?B?V1Z5RnBuRWlZbU9pcmhETW5lS1VHaU1XOVB0eHFQV3JlU0crWTdvZ1NqUUV4?=
 =?utf-8?B?SUZNUXpBa3BaR1puLzB1M2ZVbU9LSTFvVWV4cWUyL1NzV09RRXZJMGlXQjdu?=
 =?utf-8?B?TEZtS2ZISHVoMDd1OUFtQ0NDb2ZJUkJTTEJPRThCTEVCa1oyUmRFM2kvT2RE?=
 =?utf-8?B?OGpJQU1WY2FzVXh5ZE0rYnlWbng4VENqeWJaYndjTWp0dHdsZjZGQ1ZtZFhK?=
 =?utf-8?B?QXVadHBoTFhydWRmQXIxYm5LQk9lQ3pNTWtaN1FYRkdBYjhWRU9tZG05SlVY?=
 =?utf-8?B?OGFaZFhHZndHZnJ3ZHFXdTVVMTFHcS90Yjk4N29FamZJYXAvUlFYcHZTUE5J?=
 =?utf-8?B?RFFwK0szd1FQY1FqRTZaWENva3BVeEhveVpXWnIxSE8rWENwZk1pbnA1cHRT?=
 =?utf-8?B?djF2OUpPMmNNSm9uSGxmNXVJOU1TbGFwWktDSXJ4KytNZGlKcGxndjBMY3VY?=
 =?utf-8?B?b3h5QWJZNXVZT1VhQVhMQU40djlpVTYweW9RUDlCbDhUalhPamRtdWNjeDVo?=
 =?utf-8?B?M3lXWnB6WjlNeWRFMXZKbUxFY0RCOEhnWk9sTDZlWld3WEJSREVOaTZCQ1Zm?=
 =?utf-8?B?WnpnRFI4RksrZUtNMzJGaFRGcTVxcUR0ZXJBSmpCc3UzV3VLN0pVVWRTdWFl?=
 =?utf-8?B?cC9GZHVHWnVRbkRxZjVBZDZndm1wMFFPc2hXbVk3b0Ewd2ZpTVBGY3RYOXJu?=
 =?utf-8?B?bmkvUjZRNlRaVy94MHN0KzVnZXZTZEJYV0NJdmRleWU3azFiRkV2RkpqSzNv?=
 =?utf-8?B?azNiZmRlYllwbGtWWCt3a1ZmSHhhNUMvaG1NQ0FlTTJVSG5RMFFLenpvN0Ev?=
 =?utf-8?B?M3ZsTFV1MC9YY3ptQ1dpYTBBekNWRDZhQmN4Tm1GZS8vU0paWnJkc1ZwRXc2?=
 =?utf-8?B?SDR0ZzZXQUE4M0FyT3puM3Iyb2dOYndHRlFiblZlVHpuZlBNMDRTWHRSUGp2?=
 =?utf-8?B?S2hkVStvOWRqMExUdmhLNTE2T3VRYmpWbU12d2xaMitHUyt6eGFhNTFsOFI1?=
 =?utf-8?B?aUhtMWI5REtaRXVSUEpZVEpTVEVtcFpGQkZHZ3ZNdElDR1JmZkFxZS9ZQTNK?=
 =?utf-8?B?VWNack5WZlNnWGdPbEUvMmlmbUNYZzRxeEkydDBndk51T00ySUlOdG43cUtJ?=
 =?utf-8?B?ZmdIK2Q2ZU56WThrcXdwM3hTN25Ed0dUTEdOUm15N0NMT0xhM1VOaTBEM0lT?=
 =?utf-8?B?RjFKVXE3K1VRbzUzNzZVN0JKU01vaWhjN2NQRThsV1VnbDNaRVBGM3cwcGNZ?=
 =?utf-8?B?bU5LZ29KRzhBZTMwU3F1bm1uL1h5MlAzMy9Pc0R6a09CYmd1MkcxK1R2UCtD?=
 =?utf-8?B?Sjh1citneWllcWZSc3lESlZRaXV1Mm8xZGVZYWx2aThJM21hQnhIU2s5Ritw?=
 =?utf-8?B?UG1BdW5HN3E5clRFRjVlaDNDODhNMHNubmZWZHplQjh3L1g2VDZVMlZqdlBs?=
 =?utf-8?B?cFdRc1l5QVpKWjc4cThSS2RaR1FYL0wxRUZ2dTZ6dHFkRCtFOWsxaFNsc2g1?=
 =?utf-8?Q?OTaiC7?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L0tJL3Z2WXp3aTVuRlpwM3JMWDRyc1NJOERDNCtkYUJFcEI1amM4WmYwRnFW?=
 =?utf-8?B?UHJtbVY4azJaQ0lrZGpoWHk5NHBuZEltaW93dXA2UjBBUUZPeGdDVTUwWWNF?=
 =?utf-8?B?aGV4eHBQNmJobU9rMURvMG5reWxpMjY2Q0VkeVZQSElldkpjM1lmbWxxUHFm?=
 =?utf-8?B?cStKVnY5R0RLUXFiaEd2MzFEdHZ3UUhXQWtMRUVTeWhKUFJnRElqbzlWOXRE?=
 =?utf-8?B?ZzlXQjh2U0xHSjZCWHE3dFRPMVplQlljUFRYbzd0eU5rQ2RSWHhhbC9oN2hO?=
 =?utf-8?B?cUhKOEMrQkVtRWxESFI2ck9zVWdCZkp0Y0V4QmpCMjA0MVFTQnV5QzNDblpM?=
 =?utf-8?B?UWxpVXRYWitXSmJXU0dzdk9Pc2ZlcmVXMFhmNEc3SzdnSHY1eFN4SFFXNjdN?=
 =?utf-8?B?c1k4Zmhya3hGWVdjeDZpM29lV0NESHdZRDVPNlM5U1RJay9qZVlLSFhJM1Fm?=
 =?utf-8?B?TGxqd051V0tZZ1lzY1NtcGdaQWRhelB3OWNZS2hXbG5kT0c2TDdyeFkzeVlz?=
 =?utf-8?B?dWtBS1pJcnF2WEV3R1ljaXVEeDIrVHM1enZDOVVrYlMzTHFiYzd6NFBLNUs4?=
 =?utf-8?B?ajV0d3BmOTAvY2hpUEFocHFNWmViMHl3SXZranIzeW90QkJ6elMwNk9IVjVl?=
 =?utf-8?B?ZnI2NXExRWltS2ZxRzdzcWFueE9TL0VjbEtPVDQ1aVRqZVRncno1Y1N0VzZw?=
 =?utf-8?B?elk2Zy9uZFV2RXczd0pNSGRCREFnbEsvSkM2N1FYNWY5K3k3Z0lubkp1eVZZ?=
 =?utf-8?B?d2g3NDJhdWJURmZtM0xtb1hhZmJtc1p5dmVMZzQrVzZWUjhyY0pKUzJFeFEw?=
 =?utf-8?B?RVRPUXJVdkFuNENmN1NPRlY2dDZCalRsR2kxaTk0NEdHTlROckVrSUpGZGEv?=
 =?utf-8?B?SDNBMkR4NnFyWWF3QVdmVmJqNllqMFI3UkNIUUpQUWNLVmdhNUFJaHdVT1Ft?=
 =?utf-8?B?M2xwUjYzUEg2Uk43ZnI2UkczZWhzYmVHVGRoekxSQkVBOElLZG0rZVpTUCtv?=
 =?utf-8?B?eUVnSmlIeXdsa2RmcW5vNlV1NXFxSTI0aUVhTWNqOG1KZXBEWWF5ZnZWNkh1?=
 =?utf-8?B?RnVzT1k1VDFpN1BRcFk3N0FiNEkweSszUlRGdFZzSGl6V3ZwbjFzZFpoK3pJ?=
 =?utf-8?B?UEg1Y2d1cC9hc3FMVW8rcmhHUlFTVVlPT2pENVBaQThlQ0dUVE80VWdjWldi?=
 =?utf-8?B?TVlMM3pNaCtKOE9WczdJb2ZCRFMzMGJCYlhWS2NwOVhPVzJDVlcvOFZyMGRv?=
 =?utf-8?B?SFRrdXRvUmNISTVqczFzS3ZjUGxLNjRjUUZYT2I1dFlHUy9ISmVqT2V5NHZB?=
 =?utf-8?B?T0MvSWlHN0RBVUJrd3djcXR6ZlZ4MTJ4bmFUK3Y0SUJnOGovSWJCbXR4YzNE?=
 =?utf-8?B?MlMxdGgwSWl3Z2hNV29oaHJrdXFJcHIzb2t1b2hvUkVUUnZOUjNTSXpjQjFk?=
 =?utf-8?B?TEpiZklNdnVVVXppSCs3amEyajRLRGVuWk9rMjVvenpwMHNrTHVOUWd1b2tP?=
 =?utf-8?B?U1htdTEvTUdoWkNUMG9pZWpTbzRZbGNGcTFqRy9nVWlVMHNDc3htS21aYzFG?=
 =?utf-8?B?RTZST3N0Z21ITk9KOEV4S1BERTRnUExzZ1lxc0hRSVV3bWp0QlBudG8rQkVI?=
 =?utf-8?B?ZjFMVWdhYWZMQUVLREtWeVNQbTVoN0sxR3NXU3hkQmI0SmR1aVpLQkswR2dL?=
 =?utf-8?B?bU9Vams0Y1g4YzFkaTN6dTQxalBOVUg0dHFwR0pqR1hmMnFvYnJ6SG01SUZr?=
 =?utf-8?B?ei9MblU1RGNPNHM5RXh3aEJadGRubEtWQ1lSQ3dYSk82YUEvaTJHSzR2OStK?=
 =?utf-8?B?QXp3RDRJdU92WTJ6alNUMXlEdUtPQzVrODQzdWNWa2NNdmRxMGVqcXQwSi9Z?=
 =?utf-8?B?TGluRVV1czNSajRJZXlVelNodEtvTGVwR1NSVzN5SHp6QmltUTFTRDNsZFBF?=
 =?utf-8?B?TlVXQ0gvWmU5ZUx1V2dQL2I3MVg3azE0cXBVVEFDai9DR1AzZXprc2lFK015?=
 =?utf-8?B?Nm9ZTm13MDk0Q0FveFAyVWpIODJickNhb1diUXd5bEZQTmZTc1VzalVLblNC?=
 =?utf-8?B?ektqbWRqb0ZveGdNSE1xMkZaSFp3SGQ2T2dUNlNGOGs1MG13Q0tLM0NPZUY2?=
 =?utf-8?Q?ZH9E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF96A154400C4844A840EF71AB04305E@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f19bb8-1d8e-4bac-387c-08de11db6f93
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 02:25:30.0241
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m3etiTSDOn6tl0RyNmuMzmJE3S41bbFnq9WCa4vO1vL163XkVGt1XNleV6hS5xwq6uQnlWq/wL9avSbizssKAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5773

T24gMjAyNS8xMC8yMiAyMzo0NCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IE9uIE1vbiwgT2N0
IDEzLCAyMDI1IGF0IDAzOjQ1OjMzUE0gKzA4MDAsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMgYi90b29scy9saWJzL2xpZ2h0
L2xpYnhsX3BjaS5jDQo+PiBpbmRleCAyZWEyY2FlYjY2MjQuLmFlNDE2YTE2MjM2MCAxMDA2NDQN
Cj4+IC0tLSBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMNCj4+ICsrKyBiL3Rvb2xzL2xp
YnMvbGlnaHQvbGlieGxfcGNpLmMNCj4+IEBAIC0yMDQwLDcgKzIwNDEsNyBAQCBzdGF0aWMgdm9p
ZCBwY2lfcmVtb3ZlX2RldGFjaGVkKGxpYnhsX19lZ2MgKmVnYywNCj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZSwgMCk7DQo+PiAgICAgICAg
ICAgICAgICAgIGlmIChyYyA8IDApDQo+PiAgICAgICAgICAgICAgICAgICAgICBMT0dFRChFUlJP
UiwgZG9taWQsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAieGNfZG9tYWluX2lvcG9y
dF9wZXJtaXNzaW9uIGVycm9yIDB4JXgvMHgleCIsDQo+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAieGNfZG9tYWluX2lvcG9ydF9wZXJtaXNzaW9uIGVycm9yICUjIlBSSXg2NCIvJSMiUFJJ
eDY0LA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhcnQsDQo+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzaXplKTsNCj4+ICAgICAgICAgICAgICB9IGVsc2Ugew0KPj4gQEAg
LTIwNTAsNyArMjA1MSw3IEBAIHN0YXRpYyB2b2lkIHBjaV9yZW1vdmVfZGV0YWNoZWQobGlieGxf
X2VnYyAqZWdjLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDApOw0KPj4gICAgICAgICAgICAgICAgICBpZiAocmMgPCAwKQ0KPj4gICAgICAgICAg
ICAgICAgICAgICAgTE9HRUQoRVJST1IsIGRvbWlkLA0KPj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgInhjX2RvbWFpbl9pb21lbV9wZXJtaXNzaW9uIGVycm9yIDB4JXgvMHgleCIsDQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAieGNfZG9tYWluX2lvcG9ydF9wZXJtaXNzaW9uIGVy
cm9yICUjIlBSSXg2NCIvJSMiUFJJeDY0LA0KPiANCj4gV2h5IGRvZXMgdGhpcyBtZXNzYWdlIHJl
ZmVyIHRvICJ4Y19kb21haW5faW9wb3J0X3Blcm1pc3Npb24iIG5vdyBpbnN0ZWFkDQo+IG9mICJ4
Y19kb21haW5faW9tZW1fcGVybWlzc2lvbiIgPyAoSSdtIGd1ZXNzaW5nIG92ZXJ6ZWFsb3VzIGNv
cHkvcGFzdA0KPiA7LSkgZnJvbSB0aGUgcHJldmlvdXMgZXJyb3IgbWVzc2FnZSkNClNvcnJ5LCB3
aWxsIGNoYW5nZS4NCg0KPiANCj4gQ2hlZXJzLA0KPiANCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpK
aXFpYW4gQ2hlbi4NCg0K

