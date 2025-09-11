Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB3CB52AA5
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 09:55:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119544.1464856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwc90-0005F5-B7; Thu, 11 Sep 2025 07:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119544.1464856; Thu, 11 Sep 2025 07:55:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwc90-0005D1-7p; Thu, 11 Sep 2025 07:55:02 +0000
Received: by outflank-mailman (input) for mailman id 1119544;
 Thu, 11 Sep 2025 07:55:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GVGj=3W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwc8y-0005Cv-UG
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 07:55:01 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20623.outbound.protection.outlook.com
 [2a01:111:f403:2009::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c461cc9-8ee4-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 09:54:58 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DM4PR12MB5817.namprd12.prod.outlook.com (2603:10b6:8:60::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Thu, 11 Sep 2025 07:54:55 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 07:54:54 +0000
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
X-Inumbo-ID: 9c461cc9-8ee4-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vmvaiaOP3E8XfOtCefa0mZXnULGUzo5mjG/4H2Cl7PECofTQdKLJejzvvx/T4bKHJv8OhLpOrdzJlkkIkDgQ7HyPVPNqXkch96PmMVJphcFAUHmBdqdw8IljD2ASz1J4WvQZj9MnbJfm/RBAdHzYanPKtNHH6xyuvKOVHVh2r6mmZEEOJHfkBdpD2gJ3nI4ecQT8qhkVOWpS+RNzdo3OuhexIIsr8a3KVmgHckf7b7zNGmTKciSZr2g0rGUy+1jFipOZspEbs1u+GoUX4xvMdFBs+MkamZ+j08rixAjj4T+Tiy0A9s5Vg+UCA2cRrQsSDoorDwVuFLquOYbdO9X+/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDzPS/Z2uaPUG4een3NzAEtR6RDB+qL4qcB85Dcl/So=;
 b=FuwqKiQbRocREBy2NSWFhV7iWC8s/q1jqpTP/QJ4/v94uyI1Nu+hm69zOl+c0KDI1NHrBkY8s93TB94/AQlkmE1l8czwWuI+KnYEdzYqFJ4HmKAHdgyYd+fMb3kyc5lrjjD8BqWG1mNvgRc81dofqtJHQn9CRTT3PqgkjwRDQRny4RDI1Vy/o8DglTmnuei3agdYAhC0EyB+IPvnTO0BUWjjIJKywOnuuYQgKClJXgyz3k32Un8CJjpZdgUvxBLDv50jubncNiBxcEZ2HuxkwxkaANqSZzFD7drWnIfKPh+rZeraNEf1vJyAUjAQvH5xIGLJv4s9ALWgVtaWMnvx7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDzPS/Z2uaPUG4een3NzAEtR6RDB+qL4qcB85Dcl/So=;
 b=eBiusMkuCXmMr9YF/CyAB3J5+j9MwLYYwcr6uy01+rhXtlmnI4fjKVXg/xguKetIKNl8xLPUI6fjAWvYFZ9mGetFUJPenq4oQ1T24AN05u8Lg5S96rpztc6/gRpN4zkgW2GFprvXXM7NdqD8xgALv9u4dtRG13b/eXgBPdS4fUU=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 03/26] xen/x86: consolidate vram tracking support
Thread-Topic: [PATCH v2 03/26] xen/x86: consolidate vram tracking support
Thread-Index: AQHcIiYBT2pZeRIoyka2sfY1lhJyobSMdHkAgAEcX0CAAAljMA==
Date: Thu, 11 Sep 2025 07:54:54 +0000
Message-ID:
 <DM4PR12MB8451413D745BC2EE9FF5FCD4E109A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-4-Penny.Zheng@amd.com>
 <e4a0f7d6-6c8c-41b2-9bb4-19f2403c7d3d@suse.com>
 <DM4PR12MB845197AF26CCC286C1EB1F19E109A@DM4PR12MB8451.namprd12.prod.outlook.com>
In-Reply-To:
 <DM4PR12MB845197AF26CCC286C1EB1F19E109A@DM4PR12MB8451.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-11T07:06:27.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DM4PR12MB5817:EE_
x-ms-office365-filtering-correlation-id: 18cbeb89-61c1-4fe3-e330-08ddf1087efd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?b0RNRjdseTNwTWIxYlBDdmxxYTJxV0cwYVpvaUxURlJpKzhPWjN4eVFUeWlp?=
 =?utf-8?B?NWNuQ3QzM2JMY25RQXRUdHNOQnBuL2J1aG92czYvdS9McHR0Qk83eWVCMWc3?=
 =?utf-8?B?ZVUzZlZpRTVuQmd3T2pka3BlUzh1ZVZvOW9aK2syeUFvaC9lMGRzRXdDVG5D?=
 =?utf-8?B?STRZUVcrTko0cEpYTEpORGJJcUt3a1EwQlV1QURsL3ByUFNLUDVhTzd1aThr?=
 =?utf-8?B?dHluZmdqdStleUU5KzNRRUFQRVJyYm1nU2NSU0dVSklIbDlHT2pXQ090K3FM?=
 =?utf-8?B?c0Rybmo2TFVlcU1YaXZBRUVHSitYZDRJTFBacXlCV0F4NFlDUkJqYmI3OHN2?=
 =?utf-8?B?eTVVNXphaXF1aVlGVTZEKysvaE5QcHltQVQwYi9HSHFlWGR2K2tnbks3cFpH?=
 =?utf-8?B?cytpNTBYV2RmYjlBZHMwajNzQ05DNTk1V0wvcWNuTG9BMmpYNHRTczkwRTZl?=
 =?utf-8?B?TEoyaXBLaUJBZDRWN29sbXZZTENQRm8zY2xiVWw5ZDdOUGJYeHBrOUVNUjY4?=
 =?utf-8?B?SzVZUUo2WmZlc3hycy9YVVp2aTZSei9XWG1SL2NoaGdNQVhSU3ZaVzJKUFdV?=
 =?utf-8?B?VnlKNVRGL0pwRFJPeGE4OHM4NlBxOXoyV25GUGFXckVOU2dGaEp1MTh0R1pa?=
 =?utf-8?B?ai9BcXNndkpRcDV1NmhSUU1EQUUrdXd6bUx1N3RqdDVBUDl6cWo0SUJ4amtC?=
 =?utf-8?B?WnpNeG9YdW1UMFFudUx1cWFXU2ZSNVkxYlVrT2tHTnJvZ0g5bzkzSEk2SmZQ?=
 =?utf-8?B?Y1FyZXVuRlhMdVEwZ3Q1dzNMMjlUWDV5TUVYU3NBQ042T2tJeFlRRGRGeTRJ?=
 =?utf-8?B?c2FNWk9uUUhlS3ZoTWp3dlZyRlRjY2ttaXZEZkdZZHNCT0M3MlVlQTZmMjlN?=
 =?utf-8?B?TlVxL3QxcGI4bjY2VUdiZmNHMmEzemhOMVg1TVRRay9paEN2SERMZDJwZ0Vz?=
 =?utf-8?B?MGZ5VlplbDZPdzVoQzZIaWZ2Z0VLQmprNGYzV3BpSHNqSS9kUFVJZ1M3c3ds?=
 =?utf-8?B?VHFySkU2ZHN1WWswdng1OUZRS1pVOUs4TWhxRjZRRGx0RG9TRkRpemNBQ3FF?=
 =?utf-8?B?TXozMmsxNVQreERTYnZFOXJWdzV6TzNpUHVvQWp2WE84Y2YwVHdCcGJVYkVW?=
 =?utf-8?B?U2k3ekxCT3dkbFU3QTdhTEhQZkZrWDA4M1puZyt1bElDSzgySWE2eFdZRDV3?=
 =?utf-8?B?ZFE0ZHYxU2JkUks5M1hGalVIbjc3WHNYM2loMDV2TXVsYU8wVi9kQnpiaFRU?=
 =?utf-8?B?STVXZFg4RklweWlGa3U3cDNXZXV4eVpRWDVraFk5T0F1aFhRVFpyelVJRW16?=
 =?utf-8?B?WjVjR29HaUxDSTRJUzdvTitaWGE0dWRiM3ZiT0xSbDBPTW9ITTQ2ckluOHQz?=
 =?utf-8?B?TDRNb0g1WHlpUzUyclFZaEZKZ2p4eTlHV0xKeXBpWjVleXJZNU45WlM0aVVS?=
 =?utf-8?B?WVExU3Y5M3lkZm0zbWFNelZ1ZzR3cjBEcUhiNW1jdnFQQlNQMU9XeFQ4c0tk?=
 =?utf-8?B?b0E3eDU3bTlSZE5tT3ZoNStUZjg3c3NvSTRRTW5CVm00SWtIbWlPTk1BMmRR?=
 =?utf-8?B?VzRicWJTcE1wT1ZiZTQ0LzkzTTAwYUN3YjIza2w5eXV3NEFnSlQrN25mbE82?=
 =?utf-8?B?QjBRYlo5Mm13Vy9VeWFGRDdwMzFHVDJUTmo5WlRIaHRXNjRIUWViUFozWktO?=
 =?utf-8?B?VjlZREpDbFVEb3NkY1g0bFZDL0VMQjdvaWtoWWF3VWFIR29QaUcyRDBLaFlz?=
 =?utf-8?B?YjA1bGdrZkZxa3NRSHVEMXhoN0xseEQ0dkRVc0sxK1VnYTd5QytjbkxHUWJO?=
 =?utf-8?B?ZlBobUN6bWloQ3ZoM3ozZUVNbUpNOGdueWczYkRYSitiQ1VtRFBCbW9nZGRr?=
 =?utf-8?B?NlQ2SGNsaDJORUY1V3Y0RjloSDEvZmt3RUFTSDdlOFBsc3RkZjVUb1Z6LzE5?=
 =?utf-8?B?UzRWVEhzLzZWK2dhWW9jUStUeGFQSFVOSUFIU2lYMDZodFZYNnA4OTYwYnhq?=
 =?utf-8?Q?J3Bo4fttah0rD6mZhbDC6sGbByrkFM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TzQzQ1l6NGJjekhVZEc2THlKVmV3NnlRMnU4ckhhOVNJYTBTeEE3VUJBUllw?=
 =?utf-8?B?aHZYRytkaEc4SXdNYTZVejhJbzlZL3prTkUrOXVzbXhjUTNwRXA5YVU2NEsy?=
 =?utf-8?B?YXRsVjJWdmJSem4wSGpLQldjSGdsRU13UTIzTVhvZDNEYnNvcE5XQzlyRlAz?=
 =?utf-8?B?ZGlLR2JkN0djNlhVUjcyazZQaTc5WjA3L2pFZkpYMzNtbzNtVHFHMk5wd1FD?=
 =?utf-8?B?YWJPNDg1V25qRUFwREZEWnRHVm9mNWp1R1VDaVZUYUtKVU9JRUs3V0hNaW9I?=
 =?utf-8?B?eVY4bHZ6a3BxVXVsTkFNM29DMWw1cWVUUU5DcHQ2UmdPaDRCV0FBVmJZdTlN?=
 =?utf-8?B?ekkzMm43cWw5MmhWSi9ydVZITE1pODRUTDZCRytiNTdLbGFpUVZINE41QnIr?=
 =?utf-8?B?UjFtU1lGT3ZDTTVvclg0enhqZkpERjZGbEo3MENjV3RLOElBcWVjNXN5MmlQ?=
 =?utf-8?B?Qm1oTVlYUmlXVFdNRTlHRFdRZTVqVGtBbUNTMFd6NzlQOVR2aGFzd1dqUWRw?=
 =?utf-8?B?S1A5Rm44ODNpQ20ra09Gbm5UdUxpUURNbnJRaC9aay91S2c5RmpySlNMWGNH?=
 =?utf-8?B?N0YzYlQzNWRNcWtuZmNJQUlhdzBUelFOSm1EYlJhQmZSZXhURUtRRFdmdVV6?=
 =?utf-8?B?VmpDZU5iWFZoSzA2RW9aRGNVaGw3Uk5yY2NkbnhwZ1dwY2VpWHhEeGZRUnVM?=
 =?utf-8?B?c21MYndXNnNhYk8xSlNGUndDYUZPcnZWdXE4RjhwNkRNTHVOUUtycmw4d2Nw?=
 =?utf-8?B?c3FNZThNRkM1aHByMjlQelpLQTFXazhDL201V0FjTjFIL1hZdHd4UzVnS1d2?=
 =?utf-8?B?dzQ3VUhmei9rWDhHaXEzV3lRYW9EOWt1aWJPalJZd2ltaUdXcllMNjRmekVs?=
 =?utf-8?B?RGh0KzlKYTY3dGhSTlArcEFPaTVHVU00UWQ2Z0tPVlRmK1pnWXJxUklJWWZY?=
 =?utf-8?B?UGduZ0V1VHZNMGNCT0RIY1hhYmlLSVQ3K1lqY01acmwzWGJEOS8yVUlpQU50?=
 =?utf-8?B?dnU0TDlnem4vcDBPd3dvMFcxN1F5ZHVGT0NTUFVOTW9yNGEzNjRmWjJWd00r?=
 =?utf-8?B?d1dOVk0rMytBcTltYktYdTNTT0lraXdKUXJSRmJ1cEt1Y3Ywb3hMWGNMcEV0?=
 =?utf-8?B?YTNwUFg2eVNaMm1EKzhXdFhTb0dTdEhWenR5bEhvR2lGTitraitlcm04RUtt?=
 =?utf-8?B?UXdIOUptcHlFNkJtV2xFUkE3RUtyQlRpaHB1QjNBaXhTblRNQUVyZjNYRUlB?=
 =?utf-8?B?WU82M2llRlRoY2RaMTZEcHJ2R0xZRW41SGJIcVFnOWp1cWFUUXIzQzJ6MmRH?=
 =?utf-8?B?VVpFZ2xHRXRQVVpBZW13bm1jWjZkY3BleTFrMjVONnJYQ2pQeFl5ZGZwOWRC?=
 =?utf-8?B?cU1PUy81cDM2RGlxaGI4dmxFMTduTHoxR3ZFOWRrYlZNdnMrRjVDRWhyVG9Q?=
 =?utf-8?B?OTNhZjA3OHlFUWhFcUlXVE9mWUJ4ZyszRitwS0dPS3NKWHBuRVhOdFp5Q2JW?=
 =?utf-8?B?TWNTME5XVElSbjJ6RXpwWVBsRUEzOXJEekxiNk11ZFFWMFdud2h4Zmw5aDN1?=
 =?utf-8?B?YVFLWUd0RCt1S2ZGajNJZ1FUbm5tSjIxNWMxOWtxbXliS0xOYUQ1REdEbnox?=
 =?utf-8?B?ajNtdWFKSlk1aWN6VS9sT2laWEtMUUM2ajd6SU5vaWlOMWZIOElJMUhXNTN2?=
 =?utf-8?B?dm5DMmdHd0VMeUN1SmZKZXp6RTFmeVZ1SFN4cDZYNjZ4bmwzKzJQc2QwRUpr?=
 =?utf-8?B?ZWlQaE95TlNVb1FYVHU5WktDZXB3aFM4aGdvMUZjS3lmYVNvQVpFMDdWOFpT?=
 =?utf-8?B?MEZrSFdabVZFQWgySzVtdDdWWUxwRkhDbDRsd0k2aU02V01nOWxYcFh1c2JH?=
 =?utf-8?B?U2VYZDB0OXZOMTh6ZC94MEJxUzJGZmpkV3NWTW9nNGFHV1kvWHBWNG1UeFNK?=
 =?utf-8?B?R2tPRDZvUGIxc0wxbm1HeE5jUTIwQ3o0OUR4MFVxeUNOa0NNSG9FQTB6L0la?=
 =?utf-8?B?NnVWcFM2clZ5NHEwYmNZUkRBVHJZdlhJS3g4dkxVelhJckJLRzQzSm1oNktM?=
 =?utf-8?B?TW5qL0p3c2VSbWJvN0VMdnJUWHRhSmFjbDBURzJpd0ZTMEJQQnoxZGJIaU1z?=
 =?utf-8?Q?9/WY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18cbeb89-61c1-4fe3-e330-08ddf1087efd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 07:54:54.9055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y7fnukdU/1uctRW8gEklgIjxQiQU7ZAlWqAY2M9AswitQ9+DkYLLHZJziui+N0KP6COqjROWV8mhixMB4wo3ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5817

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQZW5ueSwg
WmhlbmcNCj4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAxMSwgMjAyNSAzOjE2IFBNDQo+IFRv
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IENjOiBIdWFuZywgUmF5IDxSYXku
SHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IHhlbi0NCj4gZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUkU6IFtQQVRDSCB2MiAwMy8yNl0g
eGVuL3g4NjogY29uc29saWRhdGUgdnJhbSB0cmFja2luZyBzdXBwb3J0DQo+DQo+DQo+DQo+ID4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+ID4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMTAsIDIwMjUgMTA6
MDkgUE0NCj4gPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiA+IENj
OiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4gPiA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPjsNCj4gPiB4ZW4tIGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+ID4gU3ViamVj
dDogUmU6IFtQQVRDSCB2MiAwMy8yNl0geGVuL3g4NjogY29uc29saWRhdGUgdnJhbSB0cmFja2lu
Zw0KPiA+IHN1cHBvcnQNCj4gPg0KPiA+IE9uIDEwLjA5LjIwMjUgMDk6MzgsIFBlbm55IFpoZW5n
IHdyb3RlOg0KPiA+ID4gRmxhZyBQR19sb2dfZGlydHkgaXMgZm9yIHBhZ2luZyBsb2cgZGlydHkg
c3VwcG9ydCwgbm90IHZyYW0gdHJhY2tpbmcgc3VwcG9ydC4NCj4gPiA+IEhvd2V2ZXIgZGF0YSBz
dHJ1Y3R1cmUgc2hfZGlydHlfdnJhbXt9IGFuZCBmdW5jdGlvbg0KPiA+ID4gcGFnaW5nX2xvZ19k
aXJ0eV9yYW5nZSgpIGRlc2lnbmVkIGZvciB2cmFtIHRyYWNraW5nIHN1cHBvcnQsIGFyZQ0KPiA+
ID4gZ3VhcmRlZCB3aXRoDQo+ID4gUEdfbG9nX2RpcnR5Lg0KPiA+ID4gV2UgcmVsZWFzZSBib3Ro
IGZyb20gUEdfbG9nX2RpcnR5LCBhbmQgYWxzbyBtb3ZlDQo+ID4gPiBwYWdpbmdfbG9nX2RpcnR5
X3JhbmdlKCksIHJlbWFtZWQgd2l0aCBwMm1fbG9nX2RpcnR5X3JhbmdlKCksIGludG8NCj4gPiA+
IHAybS5jLCB3aGVyZQ0KPiA+IGl0IGxvZ2ljYWxseSBiZWxvbmdzLg0KPiA+DQo+ID4gQXJlbid0
IHRoZXNlIHR3byBpbmRlcGVuZGVudCBjaGFuZ2VzPyBPbmUgdG8gZGVhbCB3aXRoIHN0cnVjdA0K
PiA+IHNoX2RpcnR5X3ZyYW0sIHRoZSBvdGhlciB0byBtb3ZlIGFuZCByZW5hbWUgcGFnaW5nX2xv
Z19kaXJ0eV9yYW5nZSgpPw0KPiA+IElycmVzcGVjdGl2ZSwgaW4gdGhlIGludGVyZXN0IG9mIG1h
a2luZyBwcm9ncmVzczoNCj4gPiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPiB3aXRoIC4uLg0KPiA+DQo+ID4gPiAtLS0gYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20v
cDJtLmgNCj4gPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wMm0uaA0KPiA+ID4g
QEAgLTExMTAsNiArMTExMCwxMCBAQCBzdGF0aWMgaW5saW5lIGludCBwMm1fZW50cnlfbW9kaWZ5
KHN0cnVjdA0KPiA+ID4gcDJtX2RvbWFpbiAqcDJtLCBwMm1fdHlwZV90IG50LA0KPiA+ID4NCj4g
PiA+ICAjZW5kaWYgLyogQ09ORklHX0hWTSAqLw0KPiA+ID4NCj4gPiA+ICsvKiBnZXQgdGhlIGRp
cnR5IGJpdG1hcCBmb3IgYSBzcGVjaWZpYyByYW5nZSBvZiBwZm5zICovDQo+ID4NCj4gPiAuLi4g
Y29tbWVudCBzdHlsZSBjb3JyZWN0ZWQgaGVyZSAoaGFwcHkgdG8gZG8gc28gd2hpbGUgY29tbWl0
dGluZykuDQo+ID4NCj4gPiBBaXVpIHRoZSBwYXRjaCBpcyBpbmRlcGVuZGVudCBvZiB0aGUgZWFy
bGllciB0d28sIGFuZCBoZW5jZSBjb3VsZCBnbw0KPiA+IGluIGFoZWFkIG9mIHRoZW0uIFNhZGx5
IG9uY2UgYWdhaW4gbm90aGluZyBsaWtlIHRoaXMgaXMgc3RhdGVkIGFueXdoZXJlLCBzbw0KPiBw
bGVhc2UgY29uZmlybS4NCj4gPg0KPg0KPiBZZXMsIGl0IGNvdWxkIGdvIGluIGFoZWFkIG9mIHRo
ZW0uIEknbGwgc3BsaXQgaXQgaW50byB0d28gY29tbWl0cywgYW5kIEkgd2lsbCBkbyB0aGlzDQo+
IGltbWVkaWF0ZWx5IHRvIHNlbmQgcmVnYXJkbGVzcyBvZiB0aGlzIHBhdGNoIHNlcmllLg0KPg0K
PiA+ID4gLS0tIGEveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BhZ2luZy5oDQo+ID4gPiArKysg
Yi94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vcGFnaW5nLmgNCj4gPiA+IEBAIC0xMzMsMTMgKzEz
MywyMCBAQCBzdHJ1Y3QgcGFnaW5nX21vZGUgew0KPiA+ID4gICAgICAoRElWX1JPVU5EX1VQKFBB
RERSX0JJVFMgLSBQQUdFX1NISUZUIC0gKFBBR0VfU0hJRlQgKyAzKSwgXA0KPiA+ID4gICAgICAg
ICAgICAgICAgICAgIFBBR0VfU0hJRlQgLSBpbG9nMihzaXplb2YobWZuX3QpKSkgKyAxKQ0KPiA+
ID4NCj4gPiA+IC0jaWYgUEdfbG9nX2RpcnR5DQo+ID4gPiArI2lmZGVmIENPTkZJR19IVk0NCj4g
PiA+ICsvKiBWUkFNIGRpcnR5IHRyYWNraW5nIHN1cHBvcnQgKi8NCj4gPiA+ICtzdHJ1Y3Qgc2hf
ZGlydHlfdnJhbSB7DQo+ID4gPiArICAgIHVuc2lnbmVkIGxvbmcgYmVnaW5fcGZuOw0KPiA+ID4g
KyAgICB1bnNpZ25lZCBsb25nIGVuZF9wZm47DQo+ID4gPiArI2lmZGVmIENPTkZJR19TSEFET1df
UEFHSU5HDQo+ID4gPiArICAgIHBhZGRyX3QgKnNsMW1hOw0KPiA+ID4gKyAgICB1aW50OF90ICpk
aXJ0eV9iaXRtYXA7DQo+ID4gPiArICAgIHNfdGltZV90IGxhc3RfZGlydHk7DQo+ID4gPiArI2Vu
ZGlmDQo+ID4gPiArfTsNCj4gPiA+ICsjZW5kaWYNCj4gPg0KPiA+IFN1YnNlcXVlbnRseSBJIHRo
aW5rIHdlIHdpbGwgd2FudCB0byBkbyBtb3JlIGNsZWFudXAgaGVyZS4gVXMgdXNpbmcgYQ0KPiA+
IHNoYWRvdyBtb2RlIHN0cnVjdCBhbHNvIGluIEhBUCBjb2RlIGlzIGJvZ3VzIGFuZCwgYWZhaWNz
LCB3YXN0ZWZ1bC4NCj4gPiBUaGUgdGhyZWUgbGF0dGVyIG1lbWJlcnMgYXJlIHVzZWQgb25seSBi
eSBzaGFkb3cgY29kZSwgc28gSEFQIGNvdWxkDQo+ID4gaGF2ZSBpdHMgb3duLCBzbWFsbGVyIHZh
cmlhbnQgb2YgdGhlIHR5cGUuIEFuZCBlYWNoIHR5cGUgY291bGQgYmUNCj4gPiBwcml2YXRlIHRv
IHRoZSBoYXAvIGFuZCBzaGFkb3cvIHN1YnRyZWVzIHJlc3BlY3RpdmVseS4NCj4gPg0KPg0KPiBV
bmRlcnN0b29kLg0KDQpSZWFkaW5nIHJlbGF0aXZlIGNvZGVzLCBmb3VuZCB0aGF0IHdlIGhhdmUg
YSAic3RydWN0IHNoX2RpcnR5X3ZyYW0gKmRpcnR5X3ZyYW0iIGluICJzdHJ1Y3QgaHZtX2RvbWFp
biIsDQpJZiB3ZSBkZWZpbmVkIGRpZmZlcmVudCB0eXBlICJzdHJ1Y3QgaGFwX2RpcnR5X3ZyYW0i
IGFuZCAic3RydWN0IHNoX2RpcnR5X3ZyYW0iIHByaXZhdGUgdG8gdGhlIGhhcC8gYW5kIHNoYWRv
dy8gc3VidHJlZXMgcmVzcGVjdGl2ZWx5LCBlaXRoZXIgd2UgYWRkIGRpZmZlcmVudCB0eXBlIGlu
ICJzdHJ1Y3QgaHZtX2RvbWFpbiIsIG9yIHdlIGNoYW5nZSBpdCB0byB0aGUgInZvaWQgKiIgdGhl
cmUgYW5kIGRvIHRoZSB0eXBlIGNhc3Rpbmcgb24gcmVmZXJyaW5nLi4uIG1heWJlIHRoZSBmb3Jt
ZXIgaXMgc2FmZXIgb3IgYW55IGJldHRlciBzdWdnZXN0aW9uPw0KDQo+DQo+ID4gSmFuDQo=

