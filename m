Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F424B9A130
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 15:41:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129417.1469386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1Pk9-0002p8-JX; Wed, 24 Sep 2025 13:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129417.1469386; Wed, 24 Sep 2025 13:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1Pk9-0002nA-Fm; Wed, 24 Sep 2025 13:41:13 +0000
Received: by outflank-mailman (input) for mailman id 1129417;
 Wed, 24 Sep 2025 13:41:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uPfF=4D=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v1Pk7-0002n4-Sh
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 13:41:11 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1eefcde3-994c-11f0-9809-7dc792cee155;
 Wed, 24 Sep 2025 15:41:08 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by DS7PR03MB8242.namprd03.prod.outlook.com (2603:10b6:8:258::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 13:41:04 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 13:41:04 +0000
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
X-Inumbo-ID: 1eefcde3-994c-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGp5xRP8rdErWWHznv5cdD3/cMjv4eMhT1XOWRHb4KSgeGe+f0ZHTDyvcy5dyPIFJICdjNk997Qo62mA/gky8Ln7CZ5B1aTZ6qimRkg1MDXLMmwIo44xvZ6RvMBbMiaD8t+JWTBMyxs35VudUnPeax0kNml+1Nikspv61zxNTzkDnK/vGFw8ulvET5acOfONz9lNHwntNsefqMyLZgneUnGnufLJq1Sog7rHf4Gr7UeLdadAVAE+Wv2tkzOYxJY0DHKGiJMo1oW79dMfNSLeo0qxj8MU3azQpavNaW/TrRsRtowqI6RlJwihDHzPNNuvFsVUY11g/4odlotDNYvPpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+xFrjZukHVrNFRXboPB7i891m4nPCVndE4tYppH4iU=;
 b=v8ngqyJOc2Doe+k+B8f5jYl54vfOnWBcueLMLtcYsRUNxjM8utykdk0SL8fEk9KGt4AjTuWcQSChcexj7semYnD7alU38FBsUd4bubNvOj4u0wHkNnVSpmGd9ebT9UTg0JvGsrWAB6BkDaaj+y751yjJ45Wr9Mx4L5WuEdTNwl7I0AHFvrB+Bpi2chc1dVTqeVyYUINWWsbfUdkjij/nZzJEojAEb0XgmDU/YjADJMAH8w37vPo8W/yexa3pfOWpaJeqnN5wz3+DQ2KyQhULu4vsiuppoN6GDYNOnvRjIRjig+A/EeE89Sy+8n06lU6PIYN9HOj5evZxD8dTjVyVoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+xFrjZukHVrNFRXboPB7i891m4nPCVndE4tYppH4iU=;
 b=MlL9afuxROLswXAdELu2hlTZue/d7l4US+5gdFdYAKtuLECDx6yLPx1RJDiXkjoG1sQ5H+Y8gChUhKU1DXfEwhUWwBIiMlXp1EzNlakyZxG/bVE/O47bleXQNy2vfydp7NAvkDn513/SEAsgUM61CaRVfHdrYzRH01dMw3e8PW8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 24 Sep 2025 15:40:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"oleksii.kurochko@gmail.com" <oleksii.kurochko@gmail.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH for-4.21] x86/cpu: populate CPUID 0x1.edx features early
 for self-snoop detection
Message-ID: <aNP0iNtp2q3342G9@Mac.lan>
References: <20250924110051.2160-1-roger.pau@citrix.com>
 <2d17d2d502df489f97b51e43a2d86535@DM6PR03MB5227.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d17d2d502df489f97b51e43a2d86535@DM6PR03MB5227.namprd03.prod.outlook.com>
X-ClientProxiedBy: PAZP264CA0071.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fd::6) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|DS7PR03MB8242:EE_
X-MS-Office365-Filtering-Correlation-Id: a1c8af9f-afb7-48b1-9efc-08ddfb700175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZDBZWHZ6RTh0Nm5uL2NDUVlORHd5SWlHaEQ3RHhjSzhRTzgvSitHUDI0YzdT?=
 =?utf-8?B?VWpqRFVkbDBVYzFZWEJUZVpobmJvZ1pqWDFBVUgycUI4VElJYmUya2JPUkRj?=
 =?utf-8?B?WHZlYWg1WlFQQWJudDRaa2x3QWtTYnc3OTJwUnpXenE0Myt2TkRKSFpjQ3U4?=
 =?utf-8?B?eUVpa2M3R0c0RzVZbEpzemJBaEhUY0dGYnV3UUd6ZEU2Z3o0a3ZxeGs4T2pw?=
 =?utf-8?B?ek01eXRaZncwajYvY2Nmc3ZVNmlJVGdEdGQ2RDVSc0I5ayt4ZmdSN2pwUnRo?=
 =?utf-8?B?NVlRM1Fsci9RSVRuZlRuWm5xc0Jza1AyODlxdUFQcUVMSzVjdTlhS3B6QTRS?=
 =?utf-8?B?TW9sVFJNMVhQYVpTbTYxT1Qvak1qRk1BZFdHVEZiWGpwOVlWcm1hUzgrMlBB?=
 =?utf-8?B?WlZGM2c2Ly9MUXQzdXhjQm8rMXlCaVpmeHk5UUVVM3V3eURlaXRyNkExOVE4?=
 =?utf-8?B?enRScXd3ZEJ6SHVhR3NYUUlma3M2VHZ4VVVSVms0VkdCdlhLWjB0MU05UnZi?=
 =?utf-8?B?Z290N1Q2bDdLVHdVbUFVRG95ZjJ3c1R6aWNBSnVMOGJHeDB3eDBibmxJRzRG?=
 =?utf-8?B?U0ZqeFpjSmVEam5GTENibm1hcTRtbGhxZ3BtN3ZDSWJQRzZFdUdEK0pJb2tr?=
 =?utf-8?B?SzNjWG1aVjRtV0tQaW5TdzNwSzJxWVpITTBrZndDSTloLzByTXc0NDYrbzJT?=
 =?utf-8?B?S3dvTEFKa0FXM3F5QllVejg4dEFUYWtjUHN4WEhxWnR4N3VRMno3K1NCUFVP?=
 =?utf-8?B?YTRDN0RNc1BSSnFmWEMwK2VCOFRXczBlWW5QazMxMlJsQ050VXRSMDRxTThJ?=
 =?utf-8?B?dnd5dWZkZkRJRnZTdjlhRzlTOFR1S093elpwY3BuRnBkc1d1S0lGRW1KbzB4?=
 =?utf-8?B?MlpwcUJhZVZKT2tvM0FiQTFZMkQ1b0lGNW9SVWtxU2Jsd203b0IrTnR0M0NI?=
 =?utf-8?B?VGpwQk42K1FMa0J3R2hHSDdQSUhzRk9NRFV0bkF2T05DZHpSVkJ0Umk0elAy?=
 =?utf-8?B?b2VUNER4TDZ0U0t3ejdRaUxZajFhVkZNTXIybkorVjdmOFNpRHdORUdvUnZP?=
 =?utf-8?B?OHpxZ29lQlhPZTBTMFNHNFdiVjFReFBuM3AzdXZWY1RiSEZLdmltZWNBY0RC?=
 =?utf-8?B?dWxUS1dMcTA5SlA0OWJaaWhlZDZnUWMyTHBwY3NVSkk3Z2gwK3c1RGJJakxF?=
 =?utf-8?B?dHZtcUllOFRpTzdpcE9vTFV1L1dSdXZTS2tIMEdpMTljVGJ3dW9VZzduUWpE?=
 =?utf-8?B?MGF2TE1ocHpraEw5em5IckZDKytUd3I5cU1mRGxhQTh2ZzUvdURHV1pYRnJy?=
 =?utf-8?B?WG9Vb3NRYVd1S2pKMEw4QkRoeWZUd1FSM0VKbyt4b2JTNHhmTmpQaHVCTFEv?=
 =?utf-8?B?WnVGd0ExTVdQdXQ4dkZTZzhtS1NEd05QWW1CbzRtOHlnMG0rZjUyOHBhVCtO?=
 =?utf-8?B?S3JhR1ZWQTBtMnVSdWlveXZEUE4zV1hFSnBoL0ZmeHFmWCttekxoMDd3clZa?=
 =?utf-8?B?U2pwOXNmWWsxM2ZaUitpRno5dmFoY0VhbHY3Y0RjUWxSdCsrRG0vZnY3dlYz?=
 =?utf-8?B?YzRQWk05dnhWQjh1RGhpOGVueVQzTW5rUnNMOEo2YzY0NzJTK3ozcXpncU03?=
 =?utf-8?B?eFJQNXdaWmVzUVhrVDVOUFVCeUExL1o2RlNFVDkxMXNYZ1NEWlU4UVNIejlk?=
 =?utf-8?B?MVAvbUEvRFhzbW9sWW9IdE1FblFjMldMRVZZRTRKMzkyUlptTmd2K3hjQkpt?=
 =?utf-8?B?Y0grVDlhbTlrd1dlaTJrN1NyOUtvbjNtMzBmN2oxRTYwNmpzcGZ6NVBBOGRP?=
 =?utf-8?B?d1hkZWwvTWFnaCt3SHlXWkxIVEZGOG1WcklwZllldDZuOFloNkpaRUxTUWVx?=
 =?utf-8?B?c1Z6MEtqU0IyZzFMdEJheUZlWnIvWFhSQWdJWENKMGJVWXhuR1RnUjNBUmVY?=
 =?utf-8?Q?brqUQ0QEX5I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUR5eW80UVc3bnpMTExLYUdBdE11cmh6SGZ2eWdpNE9vbFIxUkpzOGdGQ1F6?=
 =?utf-8?B?ek5lSkpST1dNREg3MWNIaHdWVHhtcFE5MFF4OW5OWFFFTGlUV1JVYjJXNlJW?=
 =?utf-8?B?MSthNUE0NE5HZDFZeFQ4ZlZaMDF6ZVNaYVBpY1RzTzcxMVlJMFh0cytYYUtq?=
 =?utf-8?B?Q0hoMGQ3dTNCNFZsL1llSmFoaU03VG03QTFqUWMvTHBTeGpzQkZ6R2l0ZEYr?=
 =?utf-8?B?WVZFWmQwejVTZWdaaHlQUlo1VFV4R25zUis0SDl4bXA1TEhHU2c5V2I2eVNK?=
 =?utf-8?B?Qy8vNzExZ1VVcDZhclBnaHZobFdaNWU0aGFRYzA3RFZNOE9BcmR2U08zcm1K?=
 =?utf-8?B?bHJ4RFErd3RZcGFxTFpKNnpjTDM4OXhYWXRlOXN5K3lVcGZ5d1R0YksrYlQy?=
 =?utf-8?B?aGd6QWQ0QVlMV0Y0S3JGb3UyK3Rxd1JpdXdTQjBWeWZMTUM1Q0FTK2drYWtG?=
 =?utf-8?B?SndrVjNkUWVRZ0V1WGJTcWxuRi8vd0xnblNWMk14aE8rZitybTA3U0hXc0ky?=
 =?utf-8?B?eWRIc2luMmxYSDR4VE1lMEVodjFoWUl6aTFJWGlWU1lVRDJleXFCbFc2dFNK?=
 =?utf-8?B?Nlp0YlZzdG42cURFQ2hLdHBPVk4vclBRbXVTRmJTQ1JjWHNCSGxvSU5VVFVl?=
 =?utf-8?B?UVhsWSs3TWhhTHJCZWJUWStHTEcwNWxxUEhIZGkvWENyb2VtNFdLVUZyNVRw?=
 =?utf-8?B?RmJOL2Z2YmZvOEtZWlAvSW0rNFRUT2o2OWt6OEhIdVZtdlRFa2ZnM0ZEN3Zu?=
 =?utf-8?B?YWNiYTZ1V2xFRkRuQVVFUk9INmdLclpoK2xXZ1RMemY4Y2phMGMrWjltdDRO?=
 =?utf-8?B?TGpVT29OY3BPZldoTEZ2WkZYSW8yaTVxZXArdENva1A1amFwY0oxRktQcGdU?=
 =?utf-8?B?UXdSb0tJcmhETjR5QnR0UWM3L1VyMzNOa0xjYVJYbTJqTDh2aiszekRDTFJI?=
 =?utf-8?B?WXJidU0yRFE3REhsRGx5c0srWDJMNTBnN2xkZ2NiR1lHUDV0d0NjRE5wTS9x?=
 =?utf-8?B?eFZIajJJQkdPN0piM3ZKNW15NFdFMUlBcHkxSC9BK3dITi9rRWhCeUdRRVpL?=
 =?utf-8?B?YzdWdmw5cDE4eEMyL0ZIak9DUDNpYVVYZzA2M2NPZXZkWVBaY2xGS0owTHU1?=
 =?utf-8?B?elVaUWFpYWRuZnVTM2dLMDlYaWliVUMrcDMzZk9lUXNNVkxKQkZHVnNsOGs3?=
 =?utf-8?B?NjFsWmpWbnIrZlJpeDZpdVM0Y1R3bEhtRDhlR3NBTjF1b1dxbGZndFNsdThy?=
 =?utf-8?B?T2FQL0xzOXNzQW04SkFSSk1pWFUzQ2Qzdk84ZkdXSGF0Y0YzVzdlSmN2MzhT?=
 =?utf-8?B?bUtCUDVoQkpSWUFjTDBqVUFYdmdaTnlLeHh4WXByZFlOdnh6WUNGKzBYdHhs?=
 =?utf-8?B?UE5vVEZQUDZIc3VUY1ZEM2F0bmhaZlB1amZIZkNTbEZHUWlJaENZa0RzVU1l?=
 =?utf-8?B?R0hjRTM5dWhKRUJxeTJYRCtEdU5ESUxnMkR5OTRjUThQb2hzYWg3SWo1N3Zt?=
 =?utf-8?B?Znh2OTJOUlcrT3pob21CenZiTEVtZ3hoY1NBd2VvWEprOEtuN2Z1ZjViMHBx?=
 =?utf-8?B?aTdORTFFSkl2UEVwNk9PbFlNY1VQVHdHVC8zYjladnJlMGZOUU5LK1FjYkxE?=
 =?utf-8?B?N2NpMXY3M0UxZEZzd0VaTi81RVZxamRFdHVRLzgxT01pR0FUUkpFaEp0b1Q0?=
 =?utf-8?B?bVpCby9EQ3k1dDkvSGxONVBSTElaUUthZ1BaWTNvUHZzY1BDNHFJRWFuSzhn?=
 =?utf-8?B?N21lUlZHOU94Mk12cm42R2lpQXNUTThmRGJCWmQwdG9sejQ5dVh6VVVIMnFw?=
 =?utf-8?B?TVg5ZVg4ZTNTUHNWSzc1SnlJSU9QR1dERklQYW9iOHgwZExkOVdlMjQyTis1?=
 =?utf-8?B?UmhldzBNN2o3NEdiamE1NGcxZEtvbUl5WC9rY0JSSUoxSGd1Z0YrSXZNQUJ6?=
 =?utf-8?B?WGVGSDZhZm0wN1E2cVpmVlptVExnTFF5RXFFVnM4aENjenZkTTV4Y2MwMWlU?=
 =?utf-8?B?Uy9tdFZVYllSMmdMdEM4UkdZSjhvRjB3dmh1WXpGUEplM0lQaEpUSkhmSVRn?=
 =?utf-8?B?UFk3ZW1QQk42b2ZwdnJLdHg5SldxdStyOHAyWTY4Q0pSTXNRcFI2UE1qdHVr?=
 =?utf-8?Q?daQQinxPnDnt1ecfgwuPV5sX6?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c8af9f-afb7-48b1-9efc-08ddfb700175
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 13:41:04.3541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9rowoA/eOtmraM2nSgKpyXTuyzEySk1S58lHfESJoKXo9+HGnKGKB2CrKmIFQ8bF6eJwfRmDwzlo4tGhlO3cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8242

On Wed, Sep 24, 2025 at 11:50:02AM +0000, Andrew Cooper wrote:
> On 24/09/2025 4:00 am, Roger Pau Monne wrote:
> > Otherwise the check for the SS feature in
> > check_memory_type_self_snoop_errata() fails unconditionally, which leads to
> > X86_FEATURE_XEN_SELFSNOOP never being set.
> >
> > We could also avoid this by not doing the reset_cpuinfo() for the BSP in
> > identify_cpu(), because SS detection uses boot_cpu_data.
> 
> Doesn't this, mean ...

Well, that's the reason for the rant here.  The reset at the top of
identify_cpu() has been there since 2005.  It's arguably to make sure
the BSP and the APs have the same empty state in the passed
cpuinfo_x86 struct, as for the BSP this would be already partially
initialized due to what's done in early_cpu_init().

The underlying question is whether we would rather prefer to not do
the reset for the BSP, but that would lead to differences in the
contents of cpuinfo_x86 struct between the BSP and the APs.  In the
past we have arranged for leaves needed early to be populated in
generic_identify(), like FEATURESET_e21a, hence the proposed patch
does that for FEATURESET_1d.

> >   However that
> > creates an imbalance on the state of the BSP versus the APs in the
> > identify_cpu() code.
> >
> > I've opted for the less controversial solution of populating FEATURESET_1d
> > in generic_identify(), as the value is already there.  The same is done for
> > the AMD faulting probe code.
> >
> > Fixes: f2663ca2e520 ("x86/cpu/intel: Clear cache self-snoop capability in CPUs with known errata")
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> ... this Fixes tag is incorrect?

I think the Fixes tag is accurate; the code was OK before that change.
Nothing in c_early_init hooks depended on (some of) the x86_capability
fields being populated, which is required after the change.

Thanks, Roger.

