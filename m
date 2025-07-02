Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B87AF1081
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 11:49:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030811.1404481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWu5k-00036t-BU; Wed, 02 Jul 2025 09:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030811.1404481; Wed, 02 Jul 2025 09:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWu5k-00035Z-7K; Wed, 02 Jul 2025 09:49:24 +0000
Received: by outflank-mailman (input) for mailman id 1030811;
 Wed, 02 Jul 2025 09:49:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HY8L=ZP=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uWu5i-0002u5-L6
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 09:49:22 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20611.outbound.protection.outlook.com
 [2a01:111:f403:2009::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3a8168a-5729-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 11:49:21 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SN7PR12MB6984.namprd12.prod.outlook.com (2603:10b6:806:260::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.23; Wed, 2 Jul 2025 09:49:15 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8880.030; Wed, 2 Jul 2025
 09:49:15 +0000
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
X-Inumbo-ID: d3a8168a-5729-11f0-a313-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oU5bSG2tDwTLQpLjHpmpNikF1rYFjOgXhLnjQQOtxSazQ4jJfeNoTull4d9OnQXxb3nbQWWP4zoHaIqdZUmXwcMJv3PmOlQfjNSNUgY5H2pVoM7HKg3exozYCCGeO1Ie8ON5GfFYJ+mhUruBWj9IaIXHhHXSpzgw5GlIe1DicDqLnA2EuUzUr39EJi2+SQ0N2up9tnKXXQLFNHV9vkX4KFefJHJl+3fWvKFNmMhZYMG/QU6jIAsNUYqYysTKPO+2RZnRVPrkDM7dkq/y9yKYgt7TzPLTka74nGKjAoXwTgLNPzF1UTf1QxPXCkj+7xDACYEDwS1aZ/b2yob4Rqb5Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzEJRhehm/z3LJvdVMH0Nmp4JL5zzZ4HbQBK9oZZyzU=;
 b=aT+81slwC6IimnVXhgM5zV6GjfGp8LgsKUCVujOzHNJDFx56/z4WScGR7HlOvkAL+Ezza/5jNdesbVkYRwkH/ve1RcdDSdxWbGyBrXIlnGfWpwK/aKZczvs+2pujyrlCoqI/bPgnQHQnlS1f7bi7/TY1G6G4ydEL++8sNcmHR7M07j4htZ2yviBNB8opiF1TBlst+Yx3d6UkUDB1D+n9oQe7/bEzpma1o/pC2U9iMHH4sHcZjWvx1lvovNvfIpVDzP8rtnyx4yWmw55a2Nv3etHiwQndPdoB3k3Gtftarr1l2EryCRJqXeE5Fri3ggXLpNXD0e0H3OqrUym0D32YuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzEJRhehm/z3LJvdVMH0Nmp4JL5zzZ4HbQBK9oZZyzU=;
 b=SomX7jSYPKlTheb3+3kSHayCNpdhjVyASvWNYtVakRl5Ngw1hPIxyIh5mCuO8qSzJePgzTh2QGbGLo2MsXIP6zPjS2FfrvN5NbiAXz4INkQ+vtT61TYuXKJUU/V587AHH4cNXql5mUQEw/0o3TIrFh+ojOeIEtRcdltRuCRMk+c=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 10/18] xen/cpufreq: introduce a new amd cppc driver for
 cpufreq scaling
Thread-Topic: [PATCH v5 10/18] xen/cpufreq: introduce a new amd cppc driver
 for cpufreq scaling
Thread-Index: AQHbzuRFzooSbGuOOkWtJb1ZJ/MIx7QGEZYAgBiv97A=
Date: Wed, 2 Jul 2025 09:49:15 +0000
Message-ID:
 <DM4PR12MB8451D32EC45867F91C37F702E140A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-11-Penny.Zheng@amd.com>
 <964dcd5e-6a7d-41f2-94b4-c07672ffdc89@suse.com>
In-Reply-To: <964dcd5e-6a7d-41f2-94b4-c07672ffdc89@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-07-02T09:00:04.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SN7PR12MB6984:EE_
x-ms-office365-filtering-correlation-id: ae5ee176-c0c9-4bcd-b869-08ddb94db4fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VFI2bnVlZ1ZQaXBmZ1VoditJeERjamhpSkRXSmVkQ1Frei9jRDV3OVZxUXZT?=
 =?utf-8?B?N2NrMHV6V04xSXFvSHFJa1lUQWlLTGNWR1h4YlNUR011MVRpR3ZTblJHejJP?=
 =?utf-8?B?NzNtd2RiaktwWVVvYXpxWk1aeTEzMlpod2hjMjc1UjYycSsvNkVNaWZORk5n?=
 =?utf-8?B?ekc0b3FZOEE3ZjdrOHJPZ2Q2dDUvc2pZVW1VVU1zbHhFWGx6Z1JlSzBoVVE2?=
 =?utf-8?B?RUNKczRtUEoyRG5rSlByZmNxN1JGUWZzYlJFand5WUFNdGtBclhINktWZEhZ?=
 =?utf-8?B?VVQ1SkszaVFoYk5tRDh1dmNRWjQyUmppT20xc08wcURWYkxJYUtiWnNWdmlO?=
 =?utf-8?B?UkNtc3pqdFV4S0FzajJBN1hyUWt6Z0lJWlJ6d2x3WE00OCtBOFQvWVhIS3ZV?=
 =?utf-8?B?RlFmTlZnSkp0M0h2QUZnMHJDRnloT2o4NXJCeVJ0SmdBdGMxdFNzWHBvdHEw?=
 =?utf-8?B?MTZQelpPbitNVFFCc2RSZHVvMGZCUUVqbkUydVZQVU9XTlJ2SGRudjRLajJl?=
 =?utf-8?B?SkpaaHhkQ1dIbS9yZVY5aEgrSXRUVEdNRXU5QXNrd2pYL2JjUStuS3FRY0RI?=
 =?utf-8?B?VzRWVlJUSG01cTZjanJBa1VtNjlmK3Fvb2V3V2Y1eEVZK3U1bExZaE1sZkZZ?=
 =?utf-8?B?M2dtdzlkZTlqdlpIbThQUVBzSjRZSXhSSnhuRUtKUDVvaFJtOW53aWhNNzE3?=
 =?utf-8?B?UWMwY2pwRlFETTRvU0QxNG1yaWV0RENHZGQ0OUVVNndrM0haeHhPV1F5UkhB?=
 =?utf-8?B?TEpVQ1laVzMxc2czSlpBS3JPUUFRTW1Da2F3cG0zcnhSUkdvaDhVeEt3ekwv?=
 =?utf-8?B?RWMyc0xKQzFFUWF6am45YmRZS2p0cmIrVWRob1JCYmJuYzZROU9Sa2Y2WGF6?=
 =?utf-8?B?OFJob1RYV3Vwek56a0ZPeTZmUHUwZG84SitqSTlLeUtOSWdLbFBrVW0zMkFu?=
 =?utf-8?B?QmFUK3VCMVVXR2tnZHRxVU5zeTcwOHJqdXl3QWV5SnBPaTkxclZwSGl1ajR3?=
 =?utf-8?B?RGpHSXROUjh4Q2dJdW9RZVY1ZGMrL0NLYzN3VDNiVEF2Uit3WmMxSFRFc2NK?=
 =?utf-8?B?WjIvbnJ5SUpkTng2L2RlcCt2TDREQ3E1QWw4WnEzelI0cFk1WVFRbTJMVTh3?=
 =?utf-8?B?MHBqSGNkRkErTmtqQXZISlJucUJzRTBBdUZqVTNoYVhlWktSbWIxNHFZY0dx?=
 =?utf-8?B?K3hRNWZ1VEFxZHFadURPL0F6d1Zkc29ZaXBZYUxJS001YWdTWW1YN2h1K2I0?=
 =?utf-8?B?dFBkdGZCaHFhdWw0cmdTdmorYTB1NktJNWFlNmRxME9mVlQzVkZOQlJXdzdh?=
 =?utf-8?B?WVVtUU1CbTRCM0ZIcVRieldmaEI5dVhLWHUzWWozQUFrM0VQSFRpRjZzSGs2?=
 =?utf-8?B?eVpxSnNaZUZlUE5kUDcxaEtBQ1VYU0tkQ0ZEYU9LWTNVZ3E5RUMzV1NYTm1r?=
 =?utf-8?B?RUU1NGZZdEtib0tsYnJtRklOZFFhZW5PbldSUFRDNXpNU0hpRkQ3SmlMNmc5?=
 =?utf-8?B?bkVCL3U2dG1zVEtDVmcvVU9KV2NhRXN3MjJhN0NBYjN4aHVjYWNIOXNNVnlH?=
 =?utf-8?B?dHM4RWdqaHRqOS9DMWc1enBnWEZiVU9ZbitvbXd0Nkhxdks2Q3VwUlJTc1Fa?=
 =?utf-8?B?OWpRWitzT1c4UHYxUVhEeEU2cWVERUxVbGtHTFNYL1lJaWU3WmZla2JXTUJV?=
 =?utf-8?B?dElFSFcrNTVEdzdnUHc2eTVXdjVSU0xGU0IycTVkMWtaR1YxeTZFQ0x6a25I?=
 =?utf-8?B?YlNnTzRCUU5ma3Y0VGVpdHhTY1VWd3pyM1lSVmlMc0kyZlZUSU4rMnl5UFNL?=
 =?utf-8?B?VEp0U1BVallscVN6L0sxVnNwdTBPNmhuNW9FdzhXYlZ5d0E4TWxGRk41L0l0?=
 =?utf-8?B?bWdKbjIvam53dGVVdG1ZbVUzRXZPRExOOVZaR0ovTFJ4NWlPUTN4ZkloY2tr?=
 =?utf-8?B?UG5QdE9XbEl4aHFNWEtoOTZjekIxa1hiZU10SmR6bElhOS9TM0g5cXM0V3h1?=
 =?utf-8?B?YTVkak1lN05nPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?LzhnSUt1TDEzYlZBaGcrMWI5M3c4Q3VyZkp2dGU4bTlPV1dDL1RacStKamg0?=
 =?utf-8?B?QnZkNXowK3c5NWMyV29jakNlL2UwL1FETzhKQUpBTEhINkk3RU9TRU1abW1R?=
 =?utf-8?B?dkFnZTNUYi9TaDlxNy8xblh5dGlQZUd6aTNkTDVpelh1cHBFYjlIUWdoZjlH?=
 =?utf-8?B?eEZMdnZSbWRHMUZFU1pLQTh2S253RkRMOHBNazUwYjRmNFdlUEQzRHBzTEZI?=
 =?utf-8?B?MmtmUkxMR3NscERwKzh3QU5QbjhNSUpkRDdONjJrQTBjZWFYYkhnVmUxeTA2?=
 =?utf-8?B?NVVLUVVKNlk0OUQwa2oydEUyTTVhSEFFWEE2b1RqelZVeSt4VDdrZU45WEhN?=
 =?utf-8?B?OUdCQWIxTzd4T1lBb3ZNcHpMelNPQ1J5UGxlTTcyWmpQZEJaQ1Z6ZG5SelJZ?=
 =?utf-8?B?cVdMNXhYWGxXNlVNc2YxajVJaWVlRC9zOXl4Si9DWEYwclYxUHIxZnAwQWUy?=
 =?utf-8?B?LzI2bFUzKzg3b2FhRncwcVlvakFKaHIzRXBDS2dIZDB1VW9EekM5MzBHKzlE?=
 =?utf-8?B?MG85SGZXOVdrUkxya1hSVmIvYWJDNjZrLzhjSkwzRWNEbmZtN0ZGcnhRa1Nz?=
 =?utf-8?B?L3A3K2h0b25XVHJCQ2poSlNITkRNYjZBSkwzQXAxL1RBNWtmOUR1Ym1WTXhM?=
 =?utf-8?B?dVJrUE9RY3lpMEprRW9kaURRYWJjbU0xcHpRV1hsVjRSakhtVDdOcnF2OTZT?=
 =?utf-8?B?NTdGbjNtTjFIWFVnS0VKczFDbjdvQW1YZVVEWllOOG1wWGJnK0hxVThCeXRX?=
 =?utf-8?B?eHRycGZibHV2aUNtQ3ZkKzBseCtBYkN5cnJ1bm1acnlMUWExMzdNWk9oMnZy?=
 =?utf-8?B?azhQOFlXTy82Tk16SUVlbm1qS3dCUXpIblUvV28rd0NKU2VMODUxU1hJUjF1?=
 =?utf-8?B?NDNFWEE1L3JHOWdsN0xuYjdUZXU3T05RMUFlTkQvalhmeUx3bHFXelB3c05O?=
 =?utf-8?B?c2V3cFBnTHVqSjY0dzdFdXJGMEhDRDVrWkQwZUkwb2xjY25qQXYranc3T2Nk?=
 =?utf-8?B?RnNkYm9TK1MyUGg1aEEveXRnZTdaMHQ0S2FGVUlyMmxrcnpBUTFSRDlaU21w?=
 =?utf-8?B?MUxFNncrMTZoZFcyWmRjYnI5WlIzbHpUTXk4SkpMK1ZUN0NDN2NzcTB6NWdX?=
 =?utf-8?B?MU1nOElrZnRuSnhxbnZvbEZqbDZtZkN1MGtHc0JCMlBVV29tQmtzanVIWGxI?=
 =?utf-8?B?ZlVPNDd6Wjg1ZTlWN1laY2dxS0JnZGcwZEFNN3V2UDFpR0g5VUFmemNTZzRJ?=
 =?utf-8?B?WVFiQTRqakxkQTZDVzN6NHRBQTYyZTllcmJnczJQZWFXWGNYZXo3cXFpL3VU?=
 =?utf-8?B?dXQxWktIUURCcm1NcTFSQnJycDVVTWRsSFNPVExXQS9tMlFITklRRW1BUHZx?=
 =?utf-8?B?VzRIbTRwOEJ3MCtucFZaSVlSTzAvRXRGeXFmbVlUTDJFZk5KemxHeDEzcUVn?=
 =?utf-8?B?N3RtNUFKSzh6R0ZmNkhta1dQSzlEQWFnZ2VaVzJpZmU3NnJsOEdGVG56clVM?=
 =?utf-8?B?am9kb1M1dU9KZGJDWjE2YStwVWp5TUNxSG1NZU1jV1lFM0dMeWRXTDlqV0l2?=
 =?utf-8?B?aDRwclF1a1hqRHdweW5zQXo0eERyVjQ1ZlF0U0QwN1BoVmpVQ0RCL3BRMTFx?=
 =?utf-8?B?YWVlRXl1QjMvdVVHS0dHNVNCZm1BWFl4Z1oxRldxaU1uVkZ4THJRbFZhZ2xx?=
 =?utf-8?B?bmc3aXc1NldrUUNBMk13YlRWcmpMT2lLZmQxUGMrUlljb1prdThuYkZmTHg2?=
 =?utf-8?B?R2dtMVJYb1hvSWRBSXh3bXJsNVN1SjdRM1I5V2JjaVNOQ2VRQ2ZhbG1HWkha?=
 =?utf-8?B?L0R0QSt0VWI4ODd2ODIyOHFKK2VxRDc1bnlIOTdJV0VtdTNkc0lDanVzSnRx?=
 =?utf-8?B?dFY2ZXBoQkhoME81M1NLb2hRTjFtdm43N1RheUJhcW5UNzVHWW5MNFFiVXQ3?=
 =?utf-8?B?eXBldVVqVVRmUlkrSlpEYmE1MURuVjA0NVgxcitkaCtPNHJFcXd1cnZTRXgz?=
 =?utf-8?B?dVdUT0xKWERLUzRjTFNkQ1B4SDNlaEtmQ1V2ZlAvNm1EaDdrSHoxaTBlS1hJ?=
 =?utf-8?B?UzcrZ2M5SEoreVJNb0xvQUd5akZEOGc1WnphUUFzTVZUYitFUDVGWlZtcTJ0?=
 =?utf-8?Q?viHc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae5ee176-c0c9-4bcd-b869-08ddb94db4fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 09:49:15.6042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3L6LEnRsHCPYi8ziZFHmawz5QxvK+28vTw2vx/cPvRY6OrG6K2JG5BKWF7GgTzUoQq1UIy/WaiwQalvlHCpE1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6984

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgMTcsIDIwMjUg
MTI6MDAgQU0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gQ2M6
IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIHY1IDEwLzE4XSB4ZW4vY3B1ZnJlcTogaW50cm9kdWNlIGEgbmV3IGFtZCBjcHBjIGRy
aXZlciBmb3INCj4gY3B1ZnJlcSBzY2FsaW5nDQo+DQo+IE9uIDI3LjA1LjIwMjUgMTA6NDgsIFBl
bm55IFpoZW5nIHdyb3RlOg0KPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdWZyZXEvYW1k
LWNwcGMuYw0KPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdWZyZXEvYW1kLWNwcGMuYw0K
PiA+ICsgICAgICAgIC8qDQo+ID4gKyAgICAgICAgICogV2UgZG9uJ3QgbmVlZCB0byBjb252ZXJ0
IHRvIGtIeiBmb3IgY29tcHV0aW5nIG9mZnNldCBhbmQgY2FuDQo+ID4gKyAgICAgICAgICogZGly
ZWN0bHkgdXNlIG5vbWluYWxfbWh6IGFuZCBsb3dlc3RfbWh6IGFzIHRoZSBkaXZpc2lvbg0KPiA+
ICsgICAgICAgICAqIHdpbGwgcmVtb3ZlIHRoZSBmcmVxdWVuY3kgdW5pdC4NCj4gPiArICAgICAg
ICAgKi8NCj4gPiArICAgICAgICBvZmZzZXQgPSBkYXRhLT5jYXBzLm5vbWluYWxfcGVyZiAtDQo+
ID4gKyAgICAgICAgICAgICAgICAgKG11bCAqIGNwcGNfZGF0YS0+Y3BjLm5vbWluYWxfbWh6KSAv
IGRpdjsNCj4gPiArICAgIH0NCj4gPiArICAgIGVsc2UNCj4gPiArICAgIHsNCj4gPiArICAgICAg
ICAvKiBSZWFkIFByb2Nlc3NvciBNYXggU3BlZWQoTUh6KSBhcyBhbmNob3IgcG9pbnQgKi8NCj4g
PiArICAgICAgICBtdWwgPSBkYXRhLT5jYXBzLmhpZ2hlc3RfcGVyZjsNCj4gPiArICAgICAgICBk
aXYgPSB0aGlzX2NwdShweGZyZXFfbWh6KTsNCj4gPiArICAgICAgICBpZiAoICFkaXYgKQ0KPiA+
ICsgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4NCj4gV2hhdCdzIHdyb25nIGFib3V0IHRo
ZSBmdW5jdGlvbiBhcmd1bWVudHMgaW4gdGhpcyBjYXNlPyAoU2FtZSBxdWVzdGlvbiBhZ2FpbiBv
bg0KPiBmdXJ0aGVyIHVzZXMgb2YgRUlOVkFMIGJlbG93LikNCj4NCg0KSWYgd2UgY291bGQgbm90
IGdldCBwcm9jZXNzb3IgbWF4IGZyZXF1ZW5jeSwgdGhlIHdob2xlIGZ1bmN0aW9uIGlzIHVzZWxl
c3MuLi4NCk1heWJlIC1FT1BOT1RTVVBQIGlzIG1vcmUgc3VpdGFibGUgdGhhbiAtRUlOVkFMOw0K
DQo+ID4gK3N0YXRpYyBpbnQgY2ZfY2hlY2sgYW1kX2NwcGNfY3B1ZnJlcV90YXJnZXQoc3RydWN0
IGNwdWZyZXFfcG9saWN5ICpwb2xpY3ksDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHRhcmdldF9mcmVxLA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCByZWxhdGlv
bikgew0KPiA+ICsgICAgdW5zaWduZWQgaW50IGNwdSA9IHBvbGljeS0+Y3B1Ow0KPiA+ICsgICAg
Y29uc3Qgc3RydWN0IGFtZF9jcHBjX2Rydl9kYXRhICpkYXRhID0gcGVyX2NwdShhbWRfY3BwY19k
cnZfZGF0YSwgY3B1KTsNCj4gPiArICAgIHVpbnQ4X3QgZGVzX3BlcmY7DQo+ID4gKyAgICBpbnQg
cmVzOw0KPiA+ICsNCj4gPiArICAgIGlmICggdW5saWtlbHkoIXRhcmdldF9mcmVxKSApDQo+ID4g
KyAgICAgICAgcmV0dXJuIDA7DQo+ID4gKw0KPiA+ICsgICAgcmVzID0gYW1kX2NwcGNfa2h6X3Rv
X3BlcmYoZGF0YSwgdGFyZ2V0X2ZyZXEsICZkZXNfcGVyZik7DQo+ID4gKyAgICBpZiAoIHJlcyAp
DQo+ID4gKyAgICAgICAgcmV0dXJuIHJlczsNCj4gPiArDQo+ID4gKyAgICAvKg0KPiA+ICsgICAg
ICogU2V0dGluZyB3aXRoICJsb3dlc3Rfbm9ubGluZWFyX3BlcmYiIHRvIGVuc3VyZSBnb3Zlcm5v
cmluZw0KPiA+ICsgICAgICogcGVyZm9ybWFuY2UgaW4gUC1zdGF0ZSByYW5nZS4NCj4gPiArICAg
ICAqLw0KPiA+ICsgICAgYW1kX2NwcGNfd3JpdGVfcmVxdWVzdChwb2xpY3ktPmNwdSwgZGF0YS0+
Y2Fwcy5sb3dlc3Rfbm9ubGluZWFyX3BlcmYsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGRlc19wZXJmLCBkYXRhLT5jYXBzLmhpZ2hlc3RfcGVyZik7DQo+DQo+IEkgZmVhciBJIGRv
bid0IHVuZGVyc3RhbmQgdGhlIGNvbW1lbnQsIGFuZCBoZW5jZSBpdCByZW1haW5zIHVuY2xlYXIg
dG8gbWUgd2h5DQo+IGxvd2VzdF9ub25saW5lYXJfcGVyZiBpcyBiZWluZyB1c2VkIGhlcmUuDQo+
DQoNCkhvdyBhYm91dA0KYGBgDQpDaG9vc2UgbG93ZXN0IG5vbmxpbmVhciBwZXJmb3JtYW5jZSBh
cyB0aGUgbWluaW11bSBwZXJmb3JtYW5jZSBsZXZlbCBhdCB3aGljaCB0aGUgcGxhdGZvcm0gbWF5
IHJ1bi4NCkxvd2VzdCBub25saW5lYXIgcGVyZm9ybWFuY2UgaXMgdGhlIGxvd2VzdCBwZXJmb3Jt
YW5jZSBsZXZlbCBhdCB3aGljaCBub25saW5lYXIgcG93ZXIgc2F2aW5ncyBhcmUgYWNoaWV2ZWQs
DQpBYm92ZSB0aGlzIHRocmVzaG9sZCwgbG93ZXIgcGVyZm9ybWFuY2UgbGV2ZWxzIHNob3VsZCBi
ZSBnZW5lcmFsbHkgbW9yZSBlbmVyZ3kgZWZmaWNpZW50IHRoYW4gaGlnaGVyIHBlcmZvcm1hbmNl
IGxldmVscy4NCmBgYA0KPg0KPiBKYW4NCg==

