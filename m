Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF3BB3107D
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 09:31:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089603.1447129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upMEW-0007ek-Cc; Fri, 22 Aug 2025 07:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089603.1447129; Fri, 22 Aug 2025 07:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upMEW-0007cr-9q; Fri, 22 Aug 2025 07:30:44 +0000
Received: by outflank-mailman (input) for mailman id 1089603;
 Fri, 22 Aug 2025 07:30:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jNg=3C=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1upMEV-0007cl-Kd
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 07:30:43 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7ede8f3-7f29-11f0-b898-0df219b8e170;
 Fri, 22 Aug 2025 09:30:41 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by VI2PR03MB10858.eurprd03.prod.outlook.com (2603:10a6:800:27c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 22 Aug
 2025 07:30:37 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 07:30:37 +0000
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
X-Inumbo-ID: e7ede8f3-7f29-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6Dck9uH4SY9ldD5fe8kHplIeg58OJPFqs9kU6sbWEKTl9QC8NYB5NU4HHDi6vH8Z3LvMV2r7mcWMm4sLC0ypnZCdCJzneNmwjYWgK2jaiiWVxzJtK9o1T46JcGQMNfYiBbuiFMQjOSNv1OnJQ++6F/GK2HBOc4aOMaX0dvZMe8pW+GOpXHG7W49v8utSrsIaMXXFgdBGPvI3g7qs/niAxnVnWca+E7+tx5N6c2kM0A2l+7gehJjWvrg4uZD+sd8HdqMdUbBWn/GeuhGM/fEJk34/zAF427k94Nm6Jmrcj0XB1pIkmURfyFh7nmg61Xjtq5e1YLhD5BiW9XuDIabaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IhlJKhx/lzWqMjST45ZAuxbty6q6lVa4pjL30h4xLI=;
 b=IktEJCh+LHyuuPJWR2x1RaHq7M3SIvlxU7nKZGcGv1axWDO1/t5DWAbpPo63AOJraeVYopvtIzqIL3tXUhnBkDenfzb1FQhxvmiUbgjPUrGOli3mVpv+o2xRvc+ZV72hebWTFSdEfrU4kCPC1tDwJNaiR1zZk2/lpX2nfHSOHOys8YeLu/fgaWmKLc2SeDMAInIPfl7A2UXZGxh05PKB8Gk6sSfAzQNq0nzHLxZNs5KfPoXKJIQDk0wm4Xpo4DuAFgy10m4nsa20r3ArHAzySy1El1AzhmNLY/FVEvdcTyLHEXLXqmY3Ssr68aFWtYhUrT1uJ9YfDy1DeUl9TS1sBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5IhlJKhx/lzWqMjST45ZAuxbty6q6lVa4pjL30h4xLI=;
 b=jYrcuCV/XGQQEuiDnKluhGZr05bwTM7Sdp8RTLMyBnVZlWINT0XdXYe27B39Qxmm8KAGQM0bERc3C7Sk6G/uGqPVtw2EtMP/RZ0/3EdzGkR65hEDHrnYzSN3Z2AgCkVYw53EFwqG9OBX8yqZfcrSNl8dE8KC0CvNK0Hf0bpV9Qa7L0u1885VTpa7pHzfUQJeydB7SS/dW2OuzZmWawr/32OSu07hQ3JQ3uFSmMrBm326umbZRempbvH1UT1GJrTWJh5HWbkFSNjihLwbaJ5/Ts61pr5HPPSH06pDBX0upvabUWXRD+zksOKxN9X193/+MfELgRGaBb9Wq0m/Ew4bjQ==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 02/10] xen/arm: gic: implement helper functions for
 INTID checks
Thread-Topic: [PATCH v2 02/10] xen/arm: gic: implement helper functions for
 INTID checks
Thread-Index: AQHcB5d7oc7jtkgiGki3l7l8xwTnbrRtYNMAgAD9SwA=
Date: Fri, 22 Aug 2025 07:30:37 +0000
Message-ID: <b962a6d6-fc68-49a2-a868-058adb98a6a2@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
 <51a017aeab39af14ba40ab76b56f317270c7afaa.1754568795.git.leonid_komarianskyi@epam.com>
 <877bywfzvj.fsf@epam.com> <3beba113-1f6a-4360-bf18-92bdef6ac8f8@xen.org>
In-Reply-To: <3beba113-1f6a-4360-bf18-92bdef6ac8f8@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|VI2PR03MB10858:EE_
x-ms-office365-filtering-correlation-id: f4612e10-5ee5-49c0-c6bb-08dde14dc9da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RU8zUVhMTGVHZGNnNERaZG94SWloNjEyLzhTMTREUlhaa0JVc1IrcjdlYm0z?=
 =?utf-8?B?d0dlanZJR0JDaytQZnRBdnVxbXEwS2NpR0l0a0l6QXZmbmdEWjFsV2ZVWFgx?=
 =?utf-8?B?K0lNenpLUjJKQlpBOXNmQUE4VUtGZ0pUbExvRHVSTXgyUVVEK0RmNjFpTUI4?=
 =?utf-8?B?NEJhVHdrbnFYUHduNDUrUzFMUDhMNDd4OVpzczBzNktFWWFzQVFYZER4dTBF?=
 =?utf-8?B?Q1pBaHBtbkI4cEtTT2RkeTZvWSthOHozdTI2YndBdnltZkg3TnF5NWdab2Rv?=
 =?utf-8?B?Y2hESktKOGU5ZzZUV2VKWVV3ZUQ0bHZWUUtYd2Z6TkdjaERDcGI2eUVYSzFV?=
 =?utf-8?B?MmdVWm1UT2FKNHRpeVUvaUdDSXpFRmkyZ0QvU1kvNUw2enNNUDFTTllMZ3l6?=
 =?utf-8?B?Qm1NaS9oUko3YUtyeUVHT2EvdUM5V2lzc2g0MTczeVYrcktDM0MzQUlPVHg2?=
 =?utf-8?B?c2dpWmFGVzJ0ZmpNd0pZV0VjSkNJZVQxMEVzOUNVWXVZSlI4elJLd1BnRHZr?=
 =?utf-8?B?TTcxSHRLR2hJY3NlbGdiTkhEei9XTzdDako3L0k1MGlwbXdPYm44ZmNyTHp5?=
 =?utf-8?B?R0tNcGV3bXpXNk9sRkV5blNNL1pyeE1RWDgwWnc4b0cwUi91UUJITEw3SUN5?=
 =?utf-8?B?V2lrdmZjZ2lDeFZVSXY3ZFJOWTA3N2FYcEVCY3FRUjRFTnFEV1NsTjRVMjMv?=
 =?utf-8?B?eVRLdlVlN1FENWp3T1piZGczc1VLZ21hWnpXaUdJa1d5bmFzT1RCODdneDla?=
 =?utf-8?B?eGZ4OXd6TStabkV0ZFN0RkpsQUl2NlRWR3htVHNuQ2hnbEdGMU5SVDVJaTZK?=
 =?utf-8?B?RitZdS95emFGWDVnZDY1YmM1bG5RemdYbTNLSjhXRHBRWE9VUXVNY0k4NzFO?=
 =?utf-8?B?ckxBbHk1blh1WEN4cWZ1Qk1icGVzOE9TUHFHUzVNVFZsSTU3a2RvbXpxOHhp?=
 =?utf-8?B?R3RHQitiTm5ONnloTkRJZzI0RWxTN1c5VVNZc0pnSnlQM3ZuWHllWGdpcjIw?=
 =?utf-8?B?RkJDYk1OcmdsR2xCbXBzV285ZklQODBUTEJyZ2VSZWdCYkFqWFFGZm1LbWI0?=
 =?utf-8?B?UEMxYTBrZ3h6Q0Fidzg3ZGhmVzU4NUE0OGZ3bW1CallXdW16S2RSMmdRMXRW?=
 =?utf-8?B?Tm1LUnJISmh4cllyRTRENVdFRTZIU2hmWXFnQVNTaTRibDN4TzMyREczbUVr?=
 =?utf-8?B?QWNlZkdQWStBQ2x0TnZjQjhna2FVU01xZXRlM3BOTzQzNmM4aG5GWGc0dUR2?=
 =?utf-8?B?TEpXeHQxY2xWNnFzNzFBZERaTURkWGxweWorQ0x4NlVib25NYTVzTnVGVlpD?=
 =?utf-8?B?NWZnVTVoY2VOdTN5VTM5UmlhWGJvK201U1NKYWFDaXdHV0pycjBNTzUra2hv?=
 =?utf-8?B?Z1hTQ3kyRGM2TzBHY21renJXcFErb2dZaGhlRGZGVUhHN1M5bjFhNHNEbjFm?=
 =?utf-8?B?dXFHdnhBN1FVN05QVHFsM0NUeW1pU0s1bHUxb1d2WWp5T2NlSmZnaGNQcHE4?=
 =?utf-8?B?Q0VveTl0cFIvSzlYRnpvdVdNSTk1NmU5ZEhpWFRFQzRGdVVXbzhCempqTEtq?=
 =?utf-8?B?aW4rcWV1b3RGd1lCQ2VkZ2RSTTdYUys3ZjFJbk9tNU5PeWZiUEJhK09wM2ln?=
 =?utf-8?B?eHJTakI4c0xhMWJpeTROUFVRb2lUVW9OQmltbXRLa0RUaUN3L1pMV0tWMnZp?=
 =?utf-8?B?RVA5S2hmSzZnUE9wcFRSTFQ2ZU1OM0E4cUVrN3E4VkMwakJrYkEzUEVsUkYv?=
 =?utf-8?B?R3o4djRadkx2WWhhZWxSaS9qSWVLUStjb2pESmg4N0xsbjNXeVE5RHZrbG1w?=
 =?utf-8?B?Y2tpZHc4WlRjbDV6cnVTL3F3ZmtkbkhFM2FaWmw1dk1Sb3BhNE91V2V6Z3Jw?=
 =?utf-8?B?cDRGb0xGR1JNQytTOHJzWDlUaVlCTDZsbGdaRkl5eEN0YnlGelpqMmp6Q2Rn?=
 =?utf-8?B?Rjk0UTI0Y3ZoQXUvMit1OWFjU0VjRzZUY0pzalFUMDZhcUs3TTY3alJJdGRO?=
 =?utf-8?B?TTJnWW9pVlhRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RG9IdWFQdlBhN29qbFpIQ2FmSE9xdlZnWkMrdllZNFQwN3FBamx0ZDhMSGNk?=
 =?utf-8?B?Y1cxL0Rnd0Uvd3dvK015djllSVdIMHFNQy9sdGhjZHJiaXgrNVZzaXk4STdz?=
 =?utf-8?B?OVVmRDVtRlNRY05wUnFKV3VCeGEyUVhMY2lwaElGeDQyTklYcExMbERhSm0v?=
 =?utf-8?B?MzdtWWpUTnBYZ0xxSWU4TWFOT3p3b0VvWHBWL0dkc1cvQzB5TXNUTThSRmYz?=
 =?utf-8?B?SS9SM0tnYVJwdHRqMDNGVmZ1MGNtS3VmeGxaQUZUUkhvMGQ4VnNkejhjaUlG?=
 =?utf-8?B?Kzg3NXJvc2JENjYvOXJiemZ1SUNZVlNTZm5JOFZubytZME9NWXdGYUpGZ2pW?=
 =?utf-8?B?dE85eTNOMzJtaFN3TmZTZ2lxb21wMXoyMm1RbG5hQ1pWdUhmTHh2RmZ0Wk5X?=
 =?utf-8?B?UEpUbTNYZlZNc2I2b0FJOHhaSzFid3A3bW1kY1pIUnFDMXE2K0xabGI3Qld4?=
 =?utf-8?B?dG5lRmNyTzAyMHpZQjRmYmhxcnNTQzNqcHVVU1lvR1ozd2JpKzJ4T1RqRVRW?=
 =?utf-8?B?dU9vWm9pbG1EcUFOZHBlTXRHM3U4elMrUFVGR0c3T0pXSXN5NU5QbTVYVDd5?=
 =?utf-8?B?YWl5QVRoU3M1WmxQOW9mbS9HdWhlYmxDR2pRdis1b2c0c2pkN0NzRytoTjUw?=
 =?utf-8?B?NUo5cjRmRkNDQzkyaTlyaml0OGNZU2xQZ3JmTWdpV1FZM2hKdFVYRlZMVjdT?=
 =?utf-8?B?MCtpWE1obERYY1IyQy94NzlMUEgyd0hRZ3dSSXIrd2M3bGJwbXVkZHV1azBl?=
 =?utf-8?B?SnZldTEzZkZpWGNCTEJHZ1RWbmZEMVpjSm12NFNTMFc3Nlp4N3pnUnNJTS9T?=
 =?utf-8?B?UzFSNHU3RitITEtyb3FkK21wbnFCT2M4ZndqckR3Z2NhMUdHZ0piNnF6Q2ts?=
 =?utf-8?B?NTlvUkp1V3dxeC9VNStMdWZCZEtBWGlIaXZyNFFCUTBIUFhsczk0NEtJZ2x1?=
 =?utf-8?B?WnZUSmh2SzdaWHVtd2lGUWsvZnJ0VHRsV3dIRjZERU5ZVy9yYjR3QTRDTk16?=
 =?utf-8?B?MXZ1ZHA2bmZOb0NZWUt5TWpEYVkxSm1oUHJ1T2s3VTZOVWIvRTJmU25odDUx?=
 =?utf-8?B?R3lnOTYyZm1TdGhYSUo4THdRUFNDQUM0VVN3b3pWdTBqeXhMNkdSNm5zOW1W?=
 =?utf-8?B?VE9YVGZCRWhPaVlxQldrNFFTVER2enhQSUovRndJZHcrL1J3TVRHZ3Jtd2I2?=
 =?utf-8?B?ZU4wTEMrOEQzdit6RmFwQXYrQnZ2OEdXOUNPM1pJVVNxSmlyZVp5M1RUU1o1?=
 =?utf-8?B?UUF3OU16a1pOS2Z6K2ZIeE9vOEFDV2lVbjNtYmtzQWNxcXMvdDhnTHNPL1gy?=
 =?utf-8?B?N3ZmTTErT0hEbUV3L2w2bTFDWWJqUVlaL2E2bTFueXp2UmdldmpIT1hKdkF6?=
 =?utf-8?B?dTFzV3UxUERZRTJITkdzY3lWdUdUTDl1M1VnRmkrdmxsa0JEd0dFT05DT3A4?=
 =?utf-8?B?aWV1WVZ0aEI2Zk05QzI1WDkza2JZTzZuRmVLcmdWZzN2T2lCK2dWMEJxTE1a?=
 =?utf-8?B?eW8veXFyek40N05sckVNYk1nSXI0b0RDS2d3SGh3akhTbXRUaUJ6YTJ2U2Ev?=
 =?utf-8?B?QXVqQnd3Ujl4eSswRG51NG9TSkhqbmFtaGZLZVRMMHZ0VUxEN0FVVFpWNVJG?=
 =?utf-8?B?MElEUzFLVG55ek5IcUs0VGpBWWpFNFVkRjFocXZEN3pGUTU1ZnhFQ2dqOUJM?=
 =?utf-8?B?UlVSbmwzMGpGR3htbUZ0SXRDbER4UlRWSzhCWGduemJ4UjlFWGtYVmpyeVpy?=
 =?utf-8?B?b1N6a1UwVHNiaUQ2TzY3eExBKytTdXlJYmFRNk1RV2QwdjBETnRYM0hxM3E1?=
 =?utf-8?B?bU95NjFpejZUbGhmYjE5Zy9HQUFxKzROY2VieU00ckF0L0hiRE1MTFEvZVJz?=
 =?utf-8?B?bFpWTjJIbURMb1RCV2h0NGQvR3cyVmRYanJwV3BGSHVrcjlwcWdIMktuYjR3?=
 =?utf-8?B?WHF4dW9TV3ZqdEp4cU5aYXhnU2tTS2tEUXpHZjVRT2lPZVczSlVSV1YxOWdw?=
 =?utf-8?B?TEJXVFJ4dGR2OS8rd1BxSEpKU2VkTkpNTm9FcGdiSDRxZzZFZFRQcE9pSjNF?=
 =?utf-8?B?ZzZiQUFQYjBBQitPd0tGNGJjZW14K2I0YUpoTWVQWTdQMTBwc2t4c0QzZHE2?=
 =?utf-8?B?eWVWTW80WFNURkloUEx2TDNSTTlxSHU2YmYxd053bjR0S0ZCdHhDNDV5dXRi?=
 =?utf-8?Q?EcTN05QO3uuee9J/6gBI2nc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4370CA032CF7043952879E06B17B3F4@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4612e10-5ee5-49c0-c6bb-08dde14dc9da
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 07:30:37.1339
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wIn4bMuF2a1aM9+Zv4hqTw5bc3Z0jbVigbnDHV5E8o6x+7YLJm93Du97Lb9lkYbMZSczVJsCdqJ3IhhbeBn2mlE4RjJsBhaxH7ikJaMEs0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10858

SGkgVm9sb2R5bXlyIGFuZCBKdWxpZW4sDQoNClRoYW5rIHlvdSBmb3IgeW91ciBjb21tZW50cyBh
bmQgZm9yIHlvdXIgdGltZS4NCg0KT24gMjEuMDguMjUgMTk6MjQsIEp1bGllbiBHcmFsbCB3cm90
ZToNCj4gSGksDQo+IA0KPiBPbiAyMS8wOC8yMDI1IDE2OjM5LCBWb2xvZHlteXIgQmFiY2h1ayB3
cm90ZToNCj4+IExlb25pZCBLb21hcmlhbnNreWkgPExlb25pZF9Lb21hcmlhbnNreWlAZXBhbS5j
b20+IHdyaXRlczoNCj4+DQo+Pj4gSW50cm9kdWNlZCB0d28gbmV3IGhlbHBlciBmdW5jdGlvbnM6
IGdpY19pc192YWxpZF9pcnEgYW5kDQo+Pj4gZ2ljX2lzX3NoYXJlZF9pcnEuIFRoZSBmaXJzdCBm
dW5jdGlvbiBoZWxwcyBkZXRlcm1pbmUgd2hldGhlciBhbiBJUlENCj4+PiBudW1iZXIgaXMgbGVz
cyB0aGFuIHRoZSBudW1iZXIgb2YgbGluZXMgc3VwcG9ydGVkIGJ5IGhhcmR3YXJlLiBUaGUNCj4+
PiBzZWNvbmQgZnVuY3Rpb24gYWRkaXRpb25hbGx5IGNoZWNrcyBpZiB0aGUgSVJRIG51bWJlciBm
YWxscyB3aXRoaW4gdGhlDQo+Pj4gU1BJIHJhbmdlLiBBbHNvLCB1cGRhdGVkIHRoZSBhcHByb3By
aWF0ZSBjaGVja3MgdG8gdXNlIHRoZXNlIG5ldyBoZWxwZXINCj4+PiBmdW5jdGlvbnMuDQo+Pj4N
Cj4+PiBUaGUgY3VycmVudCBjaGVja3MgZm9yIHRoZSByZWFsIEdJQyBhcmUgdmVyeSBzaW1pbGFy
IHRvIHRob3NlIGZvciB0aGUNCj4+PiB2R0lDIGJ1dCBzZXJ2ZSBhIGRpZmZlcmVudCBwdXJwb3Nl
LiBGb3IgR0lDLXJlbGF0ZWQgY29kZSwgdGhlIGludGVycnVwdA0KPj4+IG51bWJlcnMgc2hvdWxk
IGJlIHZhbGlkYXRlZCBiYXNlZCBvbiB3aGV0aGVyIHRoZSBoYXJkd2FyZSBjYW4gb3BlcmF0ZQ0K
Pj4+IHdpdGggc3VjaCBpbnRlcnJ1cHRzLiBPbiB0aGUgb3RoZXIgaGFuZCwgZm9yIHRoZSB2R0lD
LCB0aGUgaW5kZXhlcyBtdXN0DQo+Pj4gYWxzbyBiZSB2ZXJpZmllZCB0byBlbnN1cmUgdGhleSBh
cmUgYXZhaWxhYmxlIGZvciBhIHNwZWNpZmljIGRvbWFpbi4gVGhlDQo+Pj4gZmlyc3QgcmVhc29u
IGZvciBpbnRyb2R1Y2luZyB0aGVzZSBoZWxwZXIgZnVuY3Rpb25zIGlzIHRvIGF2b2lkDQo+Pj4g
cG90ZW50aWFsIGNvbmZ1c2lvbiB3aXRoIHZHSUMtcmVsYXRlZCBjaGVja3MuIFRoZSBzZWNvbmQg
cmVhc29uIGlzIHRvDQo+Pj4gY29uc29saWRhdGUgc2ltaWxhciBjb2RlIGludG8gc2VwYXJhdGUg
ZnVuY3Rpb25zLCB3aGljaCBjYW4gYmUgbW9yZQ0KPj4+IGVhc2lseSBleHRlbmRlZCBieSBhZGRp
dGlvbmFsIGNvbmRpdGlvbnMsIGUuZy4sIHdoZW4gaW1wbGVtZW50aW5nDQo+Pj4gZXh0ZW5kZWQg
U1BJIGludGVycnVwdHMuDQo+Pj4NCj4+PiBUaGUgY2hhbmdlcywgd2hpY2ggcmVwbGFjZSBvcGVu
LWNvZGVkIGNoZWNrcyB3aXRoIHRoZSB1c2Ugb2YgdGhlIG5ldw0KPj4+IGhlbHBlciBmdW5jdGlv
bnMsIGRvIG5vdCBpbnRyb2R1Y2UgYW55IGZ1bmN0aW9uYWwgY2hhbmdlcywgYXMgdGhlIGhlbHBl
cg0KPj4+IGZ1bmN0aW9ucyBmb2xsb3cgdGhlIGN1cnJlbnQgSVJRIGluZGV4IHZlcmlmaWNhdGlv
biBsb2dpYy4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IExlb25pZCBLb21hcmlhbnNreWkgPGxl
b25pZF9rb21hcmlhbnNreWlAZXBhbS5jb20+DQo+Pj4NCj4+PiAtLS0NCj4+PiBDaGFuZ2VzIGlu
IFYyOg0KPj4+IC0gaW50cm9kdWNlZCB0aGlzIHBhdGNoDQo+Pj4gLS0tDQo+Pj4gwqAgeGVuL2Fy
Y2gvYXJtL2dpYy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMiArLQ0KPj4+IMKgIHhlbi9h
cmNoL2FybS9pbmNsdWRlL2FzbS9naWMuaCB8IDkgKysrKysrKysrDQo+Pj4gwqAgeGVuL2FyY2gv
YXJtL2lycS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMiArLQ0KPj4+IMKgIDMgZmlsZXMg
Y2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vZ2ljLmMgYi94ZW4vYXJjaC9hcm0vZ2ljLmMNCj4+PiBpbmRl
eCBlODBmZTBjYTI0Li5lYjAzNDZhODk4IDEwMDY0NA0KPj4+IC0tLSBhL3hlbi9hcmNoL2FybS9n
aWMuYw0KPj4+ICsrKyBiL3hlbi9hcmNoL2FybS9naWMuYw0KPj4+IEBAIC0xMTEsNyArMTExLDcg
QEAgc3RhdGljIHZvaWQgZ2ljX3NldF9pcnFfcHJpb3JpdHkoc3RydWN0IGlycV9kZXNjIA0KPj4+
ICpkZXNjLCB1bnNpZ25lZCBpbnQgcHJpb3JpdHkpDQo+Pj4gwqAgdm9pZCBnaWNfcm91dGVfaXJx
X3RvX3hlbihzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MsIHVuc2lnbmVkIGludCANCj4+PiBwcmlvcml0
eSkNCj4+PiDCoCB7DQo+Pj4gwqDCoMKgwqDCoCBBU1NFUlQocHJpb3JpdHkgPD0gMHhmZik7wqDC
oMKgwqAgLyogT25seSA4IGJpdHMgb2YgcHJpb3JpdHkgKi8NCj4+PiAtwqDCoMKgIEFTU0VSVChk
ZXNjLT5pcnEgPCBnaWNfbnVtYmVyX2xpbmVzKCkpOy8qIENhbid0IHJvdXRlIGludGVycnVwdHMg
DQo+Pj4gdGhhdCBkb24ndCBleGlzdCAqLw0KPj4+ICvCoMKgwqAgQVNTRVJUKGdpY19pc192YWxp
ZF9pcnEoZGVzYy0+aXJxKSk7LyogQ2FuJ3Qgcm91dGUgaW50ZXJydXB0cyANCj4+PiB0aGF0IGRv
bid0IGV4aXN0ICovDQo+Pj4gwqDCoMKgwqDCoCBBU1NFUlQodGVzdF9iaXQoX0lSUV9ESVNBQkxF
RCwgJmRlc2MtPnN0YXR1cykpOw0KPj4+IMKgwqDCoMKgwqAgQVNTRVJUKHNwaW5faXNfbG9ja2Vk
KCZkZXNjLT5sb2NrKSk7DQo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2Fz
bS9naWMuaCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlLyANCj4+PiBhc20vZ2ljLmgNCj4+PiBpbmRl
eCA1NDFmMGVlYjgwLi5hYzBiN2I3ODNlIDEwMDY0NA0KPj4+IC0tLSBhL3hlbi9hcmNoL2FybS9p
bmNsdWRlL2FzbS9naWMuaA0KPj4+ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9naWMu
aA0KPj4+IEBAIC0zMDYsNiArMzA2LDE1IEBAIGV4dGVybiB2b2lkIGdpY19kdW1wX3ZnaWNfaW5m
byhzdHJ1Y3QgdmNwdSAqdik7DQo+Pj4gwqAgLyogTnVtYmVyIG9mIGludGVycnVwdCBsaW5lcyAq
Lw0KPj4+IMKgIGV4dGVybiB1bnNpZ25lZCBpbnQgZ2ljX251bWJlcl9saW5lcyh2b2lkKTsNCj4+
PiArc3RhdGljIGlubGluZSBib29sIGdpY19pc192YWxpZF9pcnEodW5zaWduZWQgaW50IGlycSkN
Cj4+DQo+PiBXZSBuZWVkIHRvIGRvIHNvbWV0aGluZyBhYm91dCBuYW1pbmcsIGJlY2F1c2UgdGhp
cyBmdW5jdGlvbiBjb21wbGV0ZWx5DQo+PiBpZ25vcmVzIHByZXNlbmNlIG9mIExQSXMuIFdoYXQg
SSBtZWFuLCB0aGF0IGl0IHdpbGwgcmV0dXJuICJmYWxzZSIgZm9yDQo+PiBhbnkgTFBJLCB3aGls
ZSB5b3UgY2FuJ3QgYXJndWUgdGhhdCBMUEkgaXMgYSB2YWxpZCBpbnRlcnJ1cHQgOikNCj4+IEkg
dW5kZXJzdGFuZCB0aGF0IHRoaXMgaXMgZXhwZWN0ZWQgYmVoYXZpb3IgYnkgY3VycmVudCBjYWxs
ZXJzLCBidXQgdGhlDQo+PiBmdW5jdGlvbiBuYW1lIGlzIG1pc2xlYWRpbmcuDQo+Pg0KPj4gTmFt
ZSBsaWtlICJnaWNfaXNfdmFsaWRfbm9uX2xwaSgpIiBzZWVtcyB0byBtb3V0aGZ1bCwgYnV0IGl0
IGlzIHRoZSBiZXN0DQo+PiBJIGNhbiBjb21lIHVwIHdpdGguDQo+IA0KPiBBRkFJVSwgdGhlcmUg
aXMgbm8gaW50ZXJydXB0IGxpbmVzIGZvciBMUElzLiBTbyB3aGF0IGFib3V0IA0KPiBnaWNfaXNf
dmFsaWRfbGluZSgpPw0KDQpPaCwgdGhhbmsgeW91LiBJdCB3b3VsZCBiZSBtdWNoIGJldHRlciB0
byBuYW1lIHRoZSBmdW5jdGlvbiANCmdpY19pc192YWxpZF9saW5lKCksIHNvIEkgd2lsbCByZW5h
bWUgaXQgaW4gVjMuDQoNCj4+DQo+Pj4gK3sNCj4+PiArwqDCoMKgIHJldHVybiBpcnEgPCBnaWNf
bnVtYmVyX2xpbmVzKCk7DQo+Pj4gK30NCj4+PiArDQo+Pj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBn
aWNfaXNfc2hhcmVkX2lycSh1bnNpZ25lZCBpbnQgaXJxKQ0KPj4+ICt7DQo+Pj4gK8KgwqDCoCBy
ZXR1cm4gKGlycSA+PSBOUl9MT0NBTF9JUlFTICYmIGdpY19pc192YWxpZF9pcnEoaXJxKSk7DQo+
Pg0KPj4gQWdhaW4sIGJlY2F1c2Ugb2YgbWlzbGVhZGluZyBuYW1lIG9mIGdpY19pc192YWxpZF9p
cnEoKSBpdCBtYXkgc2VlbSB0aGF0DQo+PiB0aGlzIGZ1bmN0aW9uIHdpbGwgcmV0dXJuICJ0cnVl
IiBmb3IgTFBJcyBhcyB3ZWxsLi4uDQo+IA0KPiBFdmVuIGlmIHdlIHJlbmFtZSBnaWNfaXNfdmFs
aWRfaXJxKCksIHRoZSBmdW5jdGlvbiBuYW1lIHdvdWxkIGJlIA0KPiBtaXNsZWFkaW5nIGJlY2F1
c2UgTFBJcyBhcmUgc2hhcmVkLiBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciBuYW1lZA0KPiBn
aWNfaXNfc3BpKC4uLik7DQo+IA0KPiBDaGVlcnMsDQo+IA0KDQpPa2F5LCBJIHdpbGwgcmVuYW1l
IGdpY19pc19zaGFyZWRfaXJxIHRvIGdpY19pc19zcGkgaW4gVjMuDQoNCkJlc3QgcmVnYXJkcywN
Ckxlb25pZA0KDQoNCg0K

