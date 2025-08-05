Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2091FB1AE69
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 08:32:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070015.1433679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujBD3-0000JN-Tb; Tue, 05 Aug 2025 06:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070015.1433679; Tue, 05 Aug 2025 06:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujBD3-0000Gj-QQ; Tue, 05 Aug 2025 06:31:41 +0000
Received: by outflank-mailman (input) for mailman id 1070015;
 Tue, 05 Aug 2025 06:31:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KS29=2R=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ujBD2-0000Gc-1f
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 06:31:40 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2414::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d48136a5-71c5-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 08:31:34 +0200 (CEST)
Received: from IA1PR12MB8467.namprd12.prod.outlook.com (2603:10b6:208:448::9)
 by SA1PR12MB8697.namprd12.prod.outlook.com (2603:10b6:806:385::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 06:31:28 +0000
Received: from IA1PR12MB8467.namprd12.prod.outlook.com
 ([fe80::1633:cc45:8177:a91e]) by IA1PR12MB8467.namprd12.prod.outlook.com
 ([fe80::1633:cc45:8177:a91e%6]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 06:31:28 +0000
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
X-Inumbo-ID: d48136a5-71c5-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tlqWktoYBvjdQysExzHkJ2g6fRAq/0IXwNcwM098H6qD1ETmpmzY9ixbT/KOMGB+xm6tw6zB4Z2kT6WVF77JWk0n9mKPAL4rsUoYoYAfcL0NJSC3Bv/cQkmM/77S6rnnLA3+YyVgImd6LX3BYWVpjAuLPGr6gUMuRQQL8H8g+Q02Bh8zGK8tM0pqYVy1azY0eFR6k0piDWy7ztx+2Khna6kckryfBkdgKnTLbkygcLOLrujljdZV2PtnRJnkj1HzY3s7RVyW4/Vb4ksYNHGU/RUZai91OA12ZN3ovSGfD/4vup8ace2V3b3ntCamrspvrHJ5dg683YBgCre9lqtsNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRgPA7HXRRlMuHH7JUnOUjultWSweNdh4n/y+q4WFFM=;
 b=GxvcsBrWPAcy59B4L6B474XLat5qvypydb6gXbw1WU2FKN6SQKulpTnng4ioTdpcjjaxPW00vThZ/iMJogHoBt/htNRq+Q7HqQ3yl9YUdvZLQ/Dj9uV6sT348R/F4BuxRQH+MbpXIQgVx+kSC/srF9py/oHhLrgqYG5EG5lb5tm/rQk+c8r66u1jHjgA4FFMb4ODvqbbZktr/hegytUZ7a3N6HX7AkWdexHKA5UxLMt3a5ATapdrhjZCRkBBdQg+4gyDTDvdOhoJ7Q4LRN6PCIjwk+ur+VSJ7lu0rUILX7lqylmjhBTQlR1shtzco1yE2Ip6k34HpViEOzzFhDhKpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRgPA7HXRRlMuHH7JUnOUjultWSweNdh4n/y+q4WFFM=;
 b=3RJEq98/Fi8r/VLjVsiXhTrwhwrkPIFiobSEbkE15U83b0r5rM6N3TJr5pCbTyK3NIApiiUFxOIrayxBSGBHXFs6rR1YA1bYGrpGKQIVZsZ0NdVI50AZ0HISFfY3EO4f5vzc+T1VspGQZ6JsMLpNroefdS4Cv4oXLvptfcnstV0=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 11/19] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline and amd-cppc driver
Thread-Topic: [PATCH v6 11/19] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline and amd-cppc driver
Thread-Index: AQHb8hcjpcuBQZ3yA0mXIz4rkVtX0bQ08RmAgB1Oq3CAABUmgIABTe0g
Date: Tue, 5 Aug 2025 06:31:28 +0000
Message-ID:
 <IA1PR12MB84672B4C51012E35C09A981EE122A@IA1PR12MB8467.namprd12.prod.outlook.com>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-12-Penny.Zheng@amd.com>
 <a11aa19e-a151-469b-a58d-bc31fc4d7e01@suse.com>
 <DM4PR12MB8451FD535917A84B3054C93CE123A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <a2411fcd-d6b1-4912-b00a-b331ab472f50@suse.com>
In-Reply-To: <a2411fcd-d6b1-4912-b00a-b331ab472f50@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-08-05T06:31:22.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB8467:EE_|SA1PR12MB8697:EE_
x-ms-office365-filtering-correlation-id: ec033c0f-292f-45ff-66f7-08ddd3e9b595
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bXhwS2EvMGx5K0JsclZkWUplbXdGb2NEQUpGOVpYWmtWdk9ock15QTJWL3Ax?=
 =?utf-8?B?UUFBWmF2M1FCQ0x1bzhIZnk2T1p4NDRLekxEWC9sbXdsUVpsdGluYmdPWTEz?=
 =?utf-8?B?UkxpTWtNLzMrc3l6dnFKMEpRc3Z0MURQdzZsckxXaUo3RzZCWWdNVFgvWXpN?=
 =?utf-8?B?cEtGVHVzKzNVUkFIV0x6OW5zUjJqOSttRXRhblM4Qk5zdWt1Q3IzaVJRSXV3?=
 =?utf-8?B?a0phUlQ2WG1HWHlqYVNhMmhrMzNzYjhodFRUT3Q0dzN6SmpRS3VGYVBIQTBh?=
 =?utf-8?B?eTU5aE83N1l0YUFwMTNKMHJISVR1ZmtmWHYraU9iQVdLc0J1QTVsU3F3M0RO?=
 =?utf-8?B?Z2h1enNvVGQ3K0xOdzlWRkEvS1VpdDY3L0hRREpsOGZyWTV1V1V3MUhJL3dJ?=
 =?utf-8?B?MVBDZGg5MVlEc2NhQnZPUHJJeFJUbTcrWGhVL2syYW12UTdIVXNQeFZ1Rm9z?=
 =?utf-8?B?SnhSVU9xbVhYUmo0aVhVM3VRSUxtbk5mb0xXaW03NmthUTk0SU04NFJ2UE0z?=
 =?utf-8?B?OFZGcjEzZVAyMGh1eGRtczJ4anZ1Y3o4SkxuczloU2JLcTFNY1JTR093V2R0?=
 =?utf-8?B?WkQvMGdjWTlVN0lEQTZkNUhSNGxlN09JRmo3cFIrOHZ1bktJdEF1aVRUMVZB?=
 =?utf-8?B?anVsenhvcCtPZTRzTDVMV0VWTU1HQUptM3grcGFvTU04eS9pa2V6YU9zcG9M?=
 =?utf-8?B?L2cwOU5VM25uemxqUHJTRENtR0hGWVNmYlVoRExmNXZhS1BNRVpmMEdqaktP?=
 =?utf-8?B?RzYyOEE5RlpkQ0FyOTl1QWRva2dQc2dGY2FEOU9rbWFWU2Y4YWtYQitQZ05S?=
 =?utf-8?B?TlBnejFSdThGS3laOUI2NUJMRnlVZmJ1VXp4YmhVS3hHY3NhWnF6RUVvemVV?=
 =?utf-8?B?QlYxK0RXdFJBS2pVc2hXS2NKMGEyQ0p3YUVRSTJLL2FRNGswTy9rRUhId0hk?=
 =?utf-8?B?OFE2ekI4dk05WGxWUU1uM0RXWW5MQUNGMnBxNlVsTVUxN1drb05wSTBTSkt3?=
 =?utf-8?B?SG5wTFNRZG5jVHU3RTRaMjMzeTJSU0MrbzJHd09rTUFPbDE4Yy9PQjNSbko1?=
 =?utf-8?B?NUltY1Q3MVFhZkx6RCtVVFRyS1A1U0YweHpmMzNrbFArMFhaOTRKWVV2cGpD?=
 =?utf-8?B?NUdhckZkZHljV2lOS2xUb254NGh2MkxRS05HRis5NzVVL0NUUks0clVKdGVo?=
 =?utf-8?B?Vy9UTTZGQVNxNXNpM2NsZmpTanNVc08yN1VOY0o0OUxtM01jT20zc2U4bkcy?=
 =?utf-8?B?bVQ3anI2bmxpb3IzQVppTWgxcm4wQTVxUm10RHdtV3RpWnZ5cHRBdFVRR0FX?=
 =?utf-8?B?ZXJvcW1ncmNtZDNNb1I4cmtPV1d2TXhpa0J1eTlmSHZ2SXhqbkh3NHBDRFBQ?=
 =?utf-8?B?RDZWQ0xOSjNiNG9GNDlHVVJqRVcwd25NWklTekJneUxsTkQ4VXNFeEx2RGps?=
 =?utf-8?B?T2paV2dXdWJEWSszbHFZK3lwRk5tVVNJRjlLaFMwbGpjTTVEeUJ0UVV4cVJp?=
 =?utf-8?B?YmNRREIwT3A0K29Ga2JBamw0S2daMnoveERmZkRjY2lkakdrREJuWnRFZVBI?=
 =?utf-8?B?Q1ZjYXlraXppeFdqbDErNE52eXhVSDVBTEhQaXlRa2dCVVdXQW1CUnNCWHFw?=
 =?utf-8?B?UmpjaVVkQVkyb2ZrL09YSFNBOW9vOGdmb0tOam9JelowZ3MzclZQU0JQalpo?=
 =?utf-8?B?RzBKRFpka1lYTEJsdUV2Tk5EY1dmeHExYTNCNmlkZmdmMElISlQ1Nzk2aXow?=
 =?utf-8?B?RnJlbW4zZFRGU2h1MnhwK0pWSWMyaEhuM1U2YVU4V3N6MjJ0a1o1bDRqakVF?=
 =?utf-8?B?VElNMkc5VjJKb0I4cXVIY1p2dUQ1UjdybWowMlM3ZGxwWGtEUjVuWDZWRk9i?=
 =?utf-8?B?di94K2MxcXFaazk5RVExRzY3QkhOY2ZrUDZDR05yMUlVZXFOR012WHJMNVdM?=
 =?utf-8?B?cWlNUHBCT1QxcnQyZkE5ZTlQdUdNYW9CS1ZnNVJ4a3d5YlU4dHhxWHkvTkw0?=
 =?utf-8?B?RE93ekdpYXhBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8467.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SWMxYmtNOG5rS1c0RGNVTnY3eTZqdTVCQXozaEtsOFBlUGM2TWFDREljSE9T?=
 =?utf-8?B?UDFBNnlHOG5MQ3p4TUorT1RVMVZ5eWEvRzNIak5MOGZxTWdnbVNRMHFHSjUv?=
 =?utf-8?B?eHBrVzAwMXBnWVQ4S3NoRDFrMVZ5SzR4WGwzMTBWUUpVMUM4NDFqR25lZkJn?=
 =?utf-8?B?eFIvOHlZbEt1cVNoK3NDYXRJMXVoQktBVkttRHFSaUZVTkp4Vi9OMGl5YXFz?=
 =?utf-8?B?VGRPZlVNYU1QS2dyYkVxb0w2Q3JsYWFmc2tTT2V5T1h1dTNta1NLdTUwcXNG?=
 =?utf-8?B?N1M1T2ZTcklIaExMVHlzMm5IRXRQWTZUamk4MXBtVjA2MFJhbkt6d0tiM1Rv?=
 =?utf-8?B?MjB6TXFlak1WN1ZoOGhWWmtkSStMUVdyZjROY2c1bzBaVnRUTVRNaHRvVEVR?=
 =?utf-8?B?ckVTaktDK2lFNVdIMVVKeVMwT1JaTEJRc3BidG00UGY0eVNGdzhQWjBQMGwz?=
 =?utf-8?B?QVI4V1gwU0RUYVczYUZGK0VaV0FHeVZ1Z2RWdUh4Y0s0bE9jeEFhR1hlVHJI?=
 =?utf-8?B?OUNUeUxEUmNxcm5FbFM1QXo1K3htS3FlNVluWHlONDh0UTR2UGUxQ0xISmJB?=
 =?utf-8?B?bFRLRnEyblJTYnpxbVcySk1BWGlPWGErMjhWMU1JaWhPZk8vN0VvMzl3eTdp?=
 =?utf-8?B?TWt3djB6WWJxbUxYTCt6ZFlSYUNjckllbVVxc1pFK1YvbFltak1BN21TVUJE?=
 =?utf-8?B?WmxKZXR1c1pjMkp4MVJ6cHVvc3BpNkNPRU1Cb2tRdTM0SVJ2TnBzZzBwMHZt?=
 =?utf-8?B?YkZUZFB6YmVZbTZGY0o1ZXd5cTdqVzZ1WDV1YlBSdmNZamhwNU0zbmJaNldu?=
 =?utf-8?B?TlhBMGtKTUdlRFd3bUZHYXNGQXM0YkdSTDlQUWpTNjN2Y25zWDNXOXZqYXVE?=
 =?utf-8?B?NWtPOFA5OUQ5WVlTYkhsK2RIcm1McFU5bXdiUE5CNW4zb3NMbE5FbnozSCtS?=
 =?utf-8?B?b21LTnIyamJXQTdFa0pQUlVSV3NjbjhQWnBOQWVMSE9wVVR4eUwydEQ4aFBX?=
 =?utf-8?B?eXMzN3lkMklpTy9nZGNTZHhQdGZ2OXo3NkJkUGd5MllNRzJ0UTdLeENpNjNC?=
 =?utf-8?B?c3VhK05uT0JUNUYwcXBTNzR2eDJ1OGxaNjJHbzcyRFB6OEJyZVdOVVNhbm5i?=
 =?utf-8?B?NUxwZGU2MjZlY012eEcxeHYrNXlid1RraUpPcndmYUUxeGRtNENScnBvbytu?=
 =?utf-8?B?M0Nicjc4NEtyNDNoemNoRWdkamZnR0JhcUZHQVBVYnpWcVdXRG1PdnRHWDhH?=
 =?utf-8?B?NndOUVNaUUxMMm55anhTYzU1Yk41cDhRZHVFVnpwanlOR3VXNDhLcWN2V3VS?=
 =?utf-8?B?YVJvOVJaN0ZYWnc1NHBtMW9zbVNweEwwd2pvV01EUHZtL2FuRzk4ek1JOFlv?=
 =?utf-8?B?ekg0UDNlT3pwWUxQdjgwZ3RSNjJmSENBdEpIRTZlaDYzQ2xicWF1WXdrSDVt?=
 =?utf-8?B?VGE4eWtsM05sQTJ0S0dNUUszWFVYbFlTYU9ma3U0T2owOGRjK24zcmErVHhr?=
 =?utf-8?B?SFFrSEpEV2QxZlFVYXdVRE5YNy9qWFNaQmwrN0JVZktMVEh6Z1g1a1R4Z0xL?=
 =?utf-8?B?UFN3ZlVnWDdmVUZRVnFzLy83bGdmTkFHdDRyZmhXTnVUQXFTaUVFTVdXdXNW?=
 =?utf-8?B?YVpSa0xVVCtOTjVIa2lHaThERnhMYzREdi9YTTJZSnpzQy9ybWlsL21SUVFV?=
 =?utf-8?B?VUhPRUVqMzc4aTVzSVBKN2dNQnpEOEJ5MTMxYXFQTVB6Ry9kTFlzb3cycGtW?=
 =?utf-8?B?YU9CclNzNG1XLzV6U0Mvbnc1TVZ6L2FoTmVLbTUxV0daNzJCSCtkd3MyUWVY?=
 =?utf-8?B?Z2lCc3VxMC9vUERaZjVwNndBNk1WU0ZQT290N0d3TWxpdUtqMnZNelpubjdU?=
 =?utf-8?B?U0xCeFJPOVlleEdvMDEzZ0xDcUptZW5aTVgxbG5XdjB5RG5Xd3FsSC9IQTlj?=
 =?utf-8?B?RW5zSDNFSVcwd1E2MTc0UFpxR3ZUMUllcFk4bURGUjRPZkc2c2FYNWx2Zy9W?=
 =?utf-8?B?Ui82N3VKb3ZLMFdBVjRaQ0k5OU9aYmpsQ2ZKRkxxY00vNGl5ZFlpeDd3MDRH?=
 =?utf-8?B?bE9EeFB0VFhPQkRsMzkvVnFsWExVZkxhRFNvUDBaem5kRk02SDRnTjJyRU9i?=
 =?utf-8?Q?VJcM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8467.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec033c0f-292f-45ff-66f7-08ddd3e9b595
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2025 06:31:28.3601
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QoiAKuyNhoYKJE5aHVnd7WdeCU+MgsnvTH4W56f6yQCWtFAr1j2UCSmMdFkzhKNWsS+giHX4df3u3vfN7F/Mng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8697

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDQsIDIwMjUg
NDo0OCBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBDYzog
SHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPjsgQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQHZhdGVz
LnRlY2g+Ow0KPiBPcnplbCwgTWljaGFsIDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47IEp1bGllbiBH
cmFsbCA8anVsaWVuQHhlbi5vcmc+OyBSb2dlciBQYXUNCj4gTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IHhl
bi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
NiAxMS8xOV0geGVuL3g4NjogaW50cm9kdWNlICJjcHVmcmVxPWFtZC1jcHBjIiB4ZW4gY21kbGlu
ZQ0KPiBhbmQgYW1kLWNwcGMgZHJpdmVyDQo+DQo+IE9uIDA0LjA4LjIwMjUgMTA6MDksIFBlbm55
LCBaaGVuZyB3cm90ZToNCj4gPiBbUHVibGljXQ0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+ID4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4g
Pj4gU2VudDogVGh1cnNkYXksIEp1bHkgMTcsIDIwMjUgMTI6MDAgQU0NCj4gPj4gVG86IFBlbm55
LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gPj4gQ2M6IEh1YW5nLCBSYXkgPFJheS5I
dWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA+PiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT47IEFudGhvbnkgUEVSQVJEDQo+ID4+IDxhbnRob255LnBlcmFyZEB2YXRlcy50ZWNoPjsg
T3J6ZWwsIE1pY2hhbCA8TWljaGFsLk9yemVsQGFtZC5jb20+Ow0KPiA+PiBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1vbm7DqQ0KPiA+PiA8cm9nZXIucGF1QGNpdHJp
eC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Ow0KPiA+
PiB4ZW4tIGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjYgMTEvMTldIHhlbi94ODY6IGludHJvZHVjZSAiY3B1ZnJlcT1hbWQtY3BwYyINCj4gPj4g
eGVuIGNtZGxpbmUgYW5kIGFtZC1jcHBjIGRyaXZlcg0KPiA+Pg0KPiA+PiBPbiAxMS4wNy4yMDI1
IDA1OjUwLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9hY3Bp
L2NwdWZyZXEvY3B1ZnJlcS5jDQo+ID4+PiArKysgYi94ZW4vYXJjaC94ODYvYWNwaS9jcHVmcmVx
L2NwdWZyZXEuYw0KPiA+Pj4gQEAgLTEyOCwxMiArMTI4LDE0IEBAIHN0YXRpYyBpbnQgX19pbml0
IGNmX2NoZWNrDQo+ID4+PiBjcHVmcmVxX2RyaXZlcl9pbml0KHZvaWQpDQo+ID4+Pg0KPiA+Pj4g
ICAgICBpZiAoIGNwdWZyZXFfY29udHJvbGxlciA9PSBGUkVRQ1RMX3hlbiApDQo+ID4+PiAgICAg
IHsNCj4gPj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBpID0gMDsNCj4gPj4NCj4gPj4gUG9pbnRs
ZXNzIGluaXRpYWxpemVyOyBib3RoIGZvcigpIGxvb3BzIHNldCBpIHRvIDAuIEJ1dCBhbHNvIHNl
ZSBmdXJ0aGVyIGRvd24uDQo+ID4+DQo+ID4+PiBAQCAtMTU3LDkgKzE2NCw3MCBAQCBzdGF0aWMg
aW50IF9faW5pdCBjZl9jaGVjaw0KPiA+Pj4gY3B1ZnJlcV9kcml2ZXJfaW5pdCh2b2lkKQ0KPiA+
Pj4NCj4gPj4+ICAgICAgICAgIGNhc2UgWDg2X1ZFTkRPUl9BTUQ6DQo+ID4+PiAgICAgICAgICBj
YXNlIFg4Nl9WRU5ET1JfSFlHT046DQo+ID4+PiAtICAgICAgICAgICAgcmV0ID0gSVNfRU5BQkxF
RChDT05GSUdfQU1EKSA/IHBvd2Vybm93X3JlZ2lzdGVyX2RyaXZlcigpIDogLQ0KPiA+PiBFTk9E
RVY7DQo+ID4+PiArICAgICAgICAgICAgaWYgKCAhSVNfRU5BQkxFRChDT05GSUdfQU1EKSApDQo+
ID4+PiArICAgICAgICAgICAgew0KPiA+Pj4gKyAgICAgICAgICAgICAgICByZXQgPSAtRU5PREVW
Ow0KPiA+Pj4gKyAgICAgICAgICAgICAgICBicmVhazsNCj4gPj4+ICsgICAgICAgICAgICB9DQo+
ID4+PiArICAgICAgICAgICAgcmV0ID0gLUVOT0VOVDsNCj4gPj4NCj4gPj4gVGhlIGNvZGUgc3Ry
dWN0dXJlIGlzIHN1ZmZpY2llbnRseSBkaWZmZXJlbnQgZnJvbSB0aGUgSW50ZWwNCj4gPj4gY291
bnRlcnBhcnQgZm9yIHRoaXMgdG8gcGVyaGFwcyBiZXR0ZXIgbW92ZSAuLi4NCj4gPj4NCj4gPj4+
ICsgICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8IGNwdWZyZXFfeGVuX2NudDsgaSsrICkNCj4g
Pj4+ICsgICAgICAgICAgICB7DQo+ID4+PiArICAgICAgICAgICAgICAgIHN3aXRjaCAoIGNwdWZy
ZXFfeGVuX29wdHNbaV0gKQ0KPiA+Pj4gKyAgICAgICAgICAgICAgICB7DQo+ID4+PiArICAgICAg
ICAgICAgICAgIGNhc2UgQ1BVRlJFUV94ZW46DQo+ID4+PiArICAgICAgICAgICAgICAgICAgICBy
ZXQgPSBwb3dlcm5vd19yZWdpc3Rlcl9kcml2ZXIoKTsNCj4gPj4+ICsgICAgICAgICAgICAgICAg
ICAgIGJyZWFrOw0KPiA+Pj4gKw0KPiA+Pj4gKyAgICAgICAgICAgICAgICBjYXNlIENQVUZSRVFf
YW1kX2NwcGM6DQo+ID4+PiArICAgICAgICAgICAgICAgICAgICByZXQgPSBhbWRfY3BwY19yZWdp
c3Rlcl9kcml2ZXIoKTsNCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+Pj4g
Kw0KPiA+Pj4gKyAgICAgICAgICAgICAgICBjYXNlIENQVUZSRVFfbm9uZToNCj4gPj4+ICsgICAg
ICAgICAgICAgICAgICAgIHJldCA9IDA7DQo+ID4+PiArICAgICAgICAgICAgICAgICAgICBicmVh
azsNCj4gPj4+ICsNCj4gPj4+ICsgICAgICAgICAgICAgICAgZGVmYXVsdDoNCj4gPj4+ICsgICAg
ICAgICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORw0KPiA+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICJVbnN1cHBvcnRlZCBjcHVmcmVxIGRyaXZlciBmb3IgdmVuZG9yIEFN
RCBvciBIeWdvblxuIik7DQo+ID4+PiArICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4gPj4N
Cj4gPj4gLi4uIGhlcmUuDQo+ID4+DQo+ID4NCj4gPiBBcmUgd2Ugc3VnZ2VzdGluZyBtb3ZpbmcN
Cj4gPiAiDQo+ID4gICAgICAgICBpZiAoICFJU19FTkFCTEVEKENPTkZJR19BTUQpICkNCj4gPiAg
ICAgICAgIHsNCj4gPiAgICAgICAgICAgICAgICAgcmV0ID0gLUVOT0RFVjsNCj4gPiAgICAgICAg
ICAgICAgICAgYnJlYWs7DQo+ID4gICAgICAgICB9DQo+ID4gIiBoZXJlPyBJbiB3aGljaCBjYXNl
LCBXaGVuIENPTkZJR19BTUQ9biBhbmQgdXNlcnMgZG9lc24ndCBwcm92aWRlDQo+ID4gImNwdWZy
ZXE9eHh4Iiwgd2Ugd2lsbCBoYXZlIGNwdWZyZXFfeGVuX2NudCBpbml0aWFsaXplZCBhcyAxIGFu
ZA0KPiA+IGNwdWZyZXFfeGVuX29wdHNbMF0gPSBDUFVGUkVRX3hlbi4gcG93ZXJub3dfcmVnaXN0
ZXJfZHJpdmVyKCkgaGVuY2UNCj4gPiBnZXRzIGludm9rZWQuIFRoZSB0aGluZyBpcyB0aGF0IHdl
IGRvbid0IGhhdmUgc3R1YiBmb3IgaXQgYW5kIGl0IGlzDQo+ID4gY29tcGlsZWQgdW5kZXIgQ09O
RklHX0FNRCBJIHN1Z2dlc3QgdG8gY2hhbmdlIHRvIHVzZSAjaWZkZWYgQ09ORklHX0FNRA0KPiA+
IGNvZGUgd3JhcHBpbmcNCj4gPg0KPiA+Pj4gKyAgICAgICAgICAgICAgICB9DQo+ID4+PiArDQo+
ID4+PiArICAgICAgICAgICAgICAgIGlmICggIXJldCB8fCByZXQgPT0gLUVCVVNZICkNCj4gPj4+
ICsgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+Pj4gKyAgICAgICAgICAgIH0NCj4gPj4+
ICsNCj4gPj4+ICAgICAgICAgICAgICBicmVhazsNCj4gPj4+ICAgICAgICAgIH0NCj4gPj4+ICsN
Cj4gPj4+ICsgICAgICAgIC8qDQo+ID4+PiArICAgICAgICAgKiBBZnRlciBzdWNjZXNzZnVsIGNw
dWZyZXEgZHJpdmVyIHJlZ2lzdGVyYXRpb24sDQo+ID4+IFhFTl9QUk9DRVNTT1JfUE1fQ1BQQw0K
PiA+Pj4gKyAgICAgICAgICogYW5kIFhFTl9QUk9DRVNTT1JfUE1fUFggc2hhbGwgYmVjb21lIGV4
Y2x1c2l2ZSBmbGFncy4NCj4gPj4+ICsgICAgICAgICAqLw0KPiA+Pj4gKyAgICAgICAgaWYgKCAh
cmV0ICkNCj4gPj4+ICsgICAgICAgIHsNCj4gPj4+ICsgICAgICAgICAgICBBU1NFUlQoaSA8IGNw
dWZyZXFfeGVuX2NudCk7DQo+ID4+PiArICAgICAgICAgICAgc3dpdGNoICggY3B1ZnJlcV94ZW5f
b3B0c1tpXSApDQo+ID4+DQo+ID4+IEhtbSwgdGhpcyBpcyB1c2luZyB0aGUgdGhlIGluaXRpYWxp
emVyIG9mIGkgdGhhdCBJIGNvbW1lbnRlZCBvbi4gSQ0KPiA+PiB0aGluayB0aGVyZSdzIGFub3Ro
ZXIgZGVmYXVsdDogY2FzZSBtaXNzaW5nLCB3aGVyZSB5b3Ugc2ltcGx5ICJyZXR1cm4gMCIgKHRv
DQo+IHJldGFpbiBwcmlvciBiZWhhdmlvcikuDQo+ID4+IEJ1dCBhZ2FpbiBzZWUgYWxzbyB5ZXQg
ZnVydGhlciBkb3duLg0KPiA+Pg0KPiA+Pg0KPiA+Pj4gKyAgICAgICAgICAgIC8qDQo+ID4+PiAr
ICAgICAgICAgICAgICogTm8gY3B1ZnJlcSBkcml2ZXIgZ2V0cyByZWdpc3RlcmVkLCBjbGVhciBi
b3RoDQo+ID4+PiArICAgICAgICAgICAgICogWEVOX1BST0NFU1NPUl9QTV9DUFBDIGFuZCBYRU5f
UFJPQ0VTU09SX1BNX1BYDQo+ID4+PiArICAgICAgICAgICAgICovDQo+ID4+PiArICAgICAgICAg
ICAgIHhlbl9wcm9jZXNzb3JfcG1iaXRzICY9IH4oWEVOX1BST0NFU1NPUl9QTV9DUFBDIHwNCj4g
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBYRU5fUFJPQ0VTU09S
X1BNX1BYKTsNCj4gPj4NCj4gPj4gWWV0IG1vcmUgaG1tIC0gdGhpcyBwYXRoIHlvdSB3YW50IHRv
IGdldCB0aHJvdWdoIGZvciB0aGUgY2FzZSBtZW50aW9uZWQgYWJvdmUuDQo+ID4+IEJ1dCBvbmx5
IHRoaXMgY29kZTsgc3BlY2lmaWNhbGx5IG5vdCB0aGUgInN3aXRjaCAoDQo+ID4+IGNwdWZyZXFf
eGVuX29wdHNbaV0gKSIsIHdoaWNoIHJlYWxseSBpcyAic3dpdGNoICggY3B1ZnJlcV94ZW5fb3B0
c1swXQ0KPiA+PiApIiBpbiB0aGF0IGNhc2UsIGFuZCB0aGF0J3MgcHJldHR5IGNsZWFybHkgd3Jv
bmcgdG8gZXZhbHVhdGUgaW4gdGhlbi4NCj4gPg0KPiA+IENvcnJlY3QgbWUgaWYgSSB1bmRlcnN0
YW5kIHlvdSB3cm9uZ2x5Og0KPiA+IFRoZSBhYm92ZSAiY2FzZSBtaXNzaW5nIiAsIGFyZSB3ZSB0
YWxraW5nIGFib3V0IGlzIGVudGVyaW5nICJjYXNlDQo+IENQVUZSRVFfbm9uZSIgPw0KPiA+IElN
TywgaXQgbWF5IG5ldmVyIGJlIGVudGVyZWQuIElmIHVzZXJzIGRvZXNuJ3QgcHJvdmlkZSAiY3B1
ZnJlcT14eHgiLCB3ZSB3aWxsDQo+IGhhdmUgY3B1ZnJlcV94ZW5fY250IGluaXRpYWxpemVkIGFz
IDEgYW5kIGNwdWZyZXFfeGVuX29wdHNbMF0gPSBDUFVGUkVRX3hlbi4NCj4gVGhhdCBpcywgd2Ug
d2lsbCBoYXZlIHB4IHN0YXRlcyBhcyBkZWZhdWx0IGRyaXZlci4gRXZlbiBpZiB3ZSBoYXZlIGZh
aWxlZCBweC1kcml2ZXINCj4gaW5pdGlhbGl6YXRpb24sIHdpdGggY3B1ZnJlcV94ZW5fY250IGxp
bWl0ZWQgdG8gMSwgd2Ugd2lsbCBub3QgZW50ZXIgQ1BVRlJFUV9ub25lLg0KPiA+IENQVUZSRVFf
bm9uZSBvbmx5IGNvdWxkIGJlIHNldCB3aGVuIHVzZXJzIGV4cGxpY2l0bHkgc2V0DQo+ID4gImNw
dWZyZXE9ZGlzYWJsZWQvbm9uZS8wIiwgYnV0IGluIHdoaWNoIGNhc2UsIGNwdWZyZXFfY29udHJv
bGxlciB3aWxsDQo+ID4gYmUgc2V0IHdpdGggRlJFUUNUTF9ub25lLiBBbmQgdGhlIHdob2xlIGNw
dWZyZXFfZHJpdmVyX2luaXQoKSBpcyB1bmRlcg0KPiA+ICIgY3B1ZnJlcV9jb250cm9sbGVyID09
IEZSRVFDVExfeGVuICIgY29uZGl0aW9uIE9yICJjYXNlIG1pc3NpbmciIGlzDQo+ID4gcmVmZXJy
aW5nIGVudGVyaW5nIGRlZmF1bHQgY2FzZT8gSW4gd2hpY2ggY2FzZSwgd2Ugd2lsbCBoYXZlIC1F
Tk9FTlQNCj4gPiBlcnJuby4gQXMgd2UgaGF2ZSByZXQ9LUVOT0VOVCBpbiB0aGUgdmVyeSBiZWdp
bm5pbmcNCj4NCj4gU29ycnksIHRoaXMgaXMgaGFyZCB0byBmb2xsb3cuIFBsdXMgSSB0aGluayBJ
IG1hZGUgdGhlIG1haW4gcmVxdWlyZW1lbnQgcXVpdGUNCj4gY2xlYXI6IFlvdSB3YW50IHRvICJy
ZXRhaW4gcHJpb3IgYmVoYXZpb3IiIGZvciBhbGwgY2FzZXMgeW91IGRvbid0IGRlbGliZXJhdGVs
eSBjaGFuZ2UNCj4gdG8gYWNjb21tb2RhdGUgdGhlIG5ldyBkcml2ZXIuIFBsdXMgeW91IHdhbnQg
dG8gd2F0Y2ggb3V0IGZvciBwcmUtIGV4aXN0aW5nDQo+IGluY29ycmVjdCBiZWhhdmlvcjogUmF0
aGVyIHRoYW4gcHJvbGlmZXJhdGluZyBhbnksIHN1Y2ggd291bGQgd2FudCBhZGp1c3RpbmcuDQo+
DQoNCkkgd2FzIHRyeWluZyB0byBmb2xsb3cgInRoZXJlJ3MgYW5vdGhlciBkZWZhdWx0OiBjYXNl
IG1pc3NpbmcsIHdoZXJlIHlvdSBzaW1wbHkgInJldHVybiAwIiAodG8gcmV0YWluIHByaW9yIGJl
aGF2aW9yICkgIiwNClRoZSBtaXNzaW5nICJkZWZhdWx0IDoiIGlzIHJlZmVycmluZyB0aGUgb25l
IGZvciAic3dpdGNoICggYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yICkiPyAoSSB0aG91Z2h0IGl0
IHJlZmVycmVkICIgc3dpdGNoICggY3B1ZnJlcV94ZW5fb3B0c1tpXSApICIgLi4uLikNCkl0IGlz
IGEgcHJlLSBleGlzdGluZyBpbmNvcnJlY3QgYmVoYXZpb3Igd2hpY2ggSSBzaGFsbCBjcmVhdGUg
YSBuZXcgY29tbWl0IHRvIGZpeCBpdCBmaXJzdGx5DQpJJ2xsIGFkZCBhbiAtRU5PRU5UUlkgaW5p
dGlhbGl6ZXIgZm9yIHJldCBhdCB0aGUgdmVyeSBiZWdpbm5pbmcgLCBhbmQgY29tcGxlbWVudCB0
aGUgbWlzc2luZyBkZWZhdWx0OiBlbnRyeSB3aXRoICJVbnN1cHBvcnRlZCB2ZW5kb3IuLi4iIGVy
cm9yIGxvZw0KDQo+IEphbg0K

