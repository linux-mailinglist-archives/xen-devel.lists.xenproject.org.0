Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMRnMQKjlWmaSwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 12:31:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A06A155E85
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 12:31:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235469.1538444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsflo-0004Me-LU; Wed, 18 Feb 2026 11:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235469.1538444; Wed, 18 Feb 2026 11:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsflo-0004K8-IO; Wed, 18 Feb 2026 11:31:04 +0000
Received: by outflank-mailman (input) for mailman id 1235469;
 Wed, 18 Feb 2026 11:31:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=po7z=AW=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vsfln-0003bf-5d
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 11:31:03 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d84b78b-0cbd-11f1-b164-2bf370ae4941;
 Wed, 18 Feb 2026 12:31:02 +0100 (CET)
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by DS0PR03MB8296.namprd03.prod.outlook.com (2603:10b6:8:292::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Wed, 18 Feb
 2026 11:30:59 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%5]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 11:30:59 +0000
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
X-Inumbo-ID: 4d84b78b-0cbd-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PiGNmNjvQ4fZYPGITcJ5DvITN7tte0u5H1gZWGuNKh5xSLFv38K4tF7Yuy12Lb6eoSMYP+McDmFMdUe79ptG/JAj9Ta76BeySfNYtjYeIm1z5s/DMi7by/VUa8lVZW9hP9Zr3yKKeCY/xqMCTRC5kk+etmw5isRsVLucU2bxBzYWWl0bUKljd+9A2rnlzcPL8hFqGkfMJNcxmjiXHwzfCziNlP3veFum14fm0nE6rOmVPCjlfhZ8BQc/dCPc2pkzolW1/WFeehY3f3/IBOsa3pUPUwdiPpoDDmJn3VzYkesMHBkmclhYHX0Bl4Jd3MzbZw5WCiGVaA7itENJ+0F8xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pSP71I02lZ3dBJ2hweIUNxrlqQCPeubufzb4yO1LvA=;
 b=MEmRisKUywZOV5+3Rr/lzhZ0geUvZ54TG2NkpqWeDMO59/4j6IHPlx/u3yWgQNZ8EhMyo51OvoLnRiF3WGMJVGgkhoSlKRdGxEzserm9vYjzvTjJZ5k0o3GoCvnxkKMtOp8AJbykD+ggOOMkwOuqJaF80TKy8W8xeJm4Lw8NdgcbNDb2RryWhIYMtzK93CuRJ3C3UQVyNp048NDOBZlOvYQ9w0PyzdmY+nDHT6/qZ9M6SXzsZhGlfO4sfcVFzff4t+i/KDkpxylNiNUqmkZiTpOXxcdFFP4ilwGCQdk0wtrTwvP45Jy9dxifP47QJPO70HjQSsMfVy6NpFR/sI9OFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pSP71I02lZ3dBJ2hweIUNxrlqQCPeubufzb4yO1LvA=;
 b=H/83DNa8Ms+Cpab929brw9A13I1i0YKlycUUaA11vwn36xKtkFEGdjFeczHisKF398WIuFZCpLO/7p46HcXcrc1cO0Kdq9IPMEyjzUK+0RrT/DF5FANa3bKjmHamoSNLW3iii9dB5pNBOnjB65Jsy0hbuKNGI9rrKp2mbJLD38A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <60a1bc11-f9a6-48c3-b7d8-d007799fbe91@citrix.com>
Date: Wed, 18 Feb 2026 11:30:56 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/shadow: don't use #if in macro invocations
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <23951625-939c-4658-8146-84c1f12381d0@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <23951625-939c-4658-8146-84c1f12381d0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::24) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|DS0PR03MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: e93e1358-c032-45b7-fc44-08de6ee1307c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SUE3b2ZUN0kwNEF3Sm1CUmNJYUlnZVh0SDlLS25EOXJsdHQ1RXEyWm1zZW5r?=
 =?utf-8?B?UjNuYjNPUVh6eDFLK0M0cWxIZlJWK3ZBYXFvd1lQQXhraE93K1o0WjZxakpY?=
 =?utf-8?B?bi9ieE1HVzhYaGhneWZYbmNQejR3alpDVDljNjBKbVJXNzl2U2p5SnFLK3Fk?=
 =?utf-8?B?Mkl6ejBoUU4zaUp5b2htaCs4TWRjNG1lZCthSEpreDZOMU9NelpvVWJWUFRY?=
 =?utf-8?B?NVBvVWhYdEFQei9YcW9DaXVtRzdwWCtsaHFQOXh5U0UrNlpGeURneVBxNnRq?=
 =?utf-8?B?WmZuMUY5c2FvSTNxYXR2eDVLT1hWUGQ5Qld1enVmVjd3Tng4K2J5bzFrK0Vi?=
 =?utf-8?B?dWVJVVh2OXdUcFFQVzN4aFhuRGZsWlp6KzJlTkZsUk5QWU9Fdm5JUDEwc2VW?=
 =?utf-8?B?dklGRVc4aFVhUDU5U1lQTkE1R2ZZUXJUdzRZN3NzTkYwK29lMDlyNElWM3hX?=
 =?utf-8?B?S3A0V3htbVY2RWlYclRPemFXVTVNN2dZcTEya1dhdi9DdGd0YWRTbjNoanZC?=
 =?utf-8?B?NUY3TWhRR3FrQ1FIeGs4MVpjMXlZWFpZZGk2SDlQanNaU0JMRmVXK3Y0VXpI?=
 =?utf-8?B?NnNIT2VQVW1aWWdyNFRmSlUxM3ZLSFFldzdFeVF4RHZ1azlVSnNIT3pyZXV2?=
 =?utf-8?B?cXJEUjFNaGZia0Q0cDNlbGlRQ3o4RXZpVCtMbnlOYTYvQUNaUVB0MTNTMmVB?=
 =?utf-8?B?WGhGeUtuREtlQTZFbnRvUFk0RjltRUxleFJFeXVpNmI4cTBRMVlZN0Yvbm9N?=
 =?utf-8?B?VmR2aHdaNlhrS0laMFowdWxVUld3QmM2YmU1VUtaSHpSbVI3R2ZIdnQ0ckJG?=
 =?utf-8?B?QXpmRDhWd1IxMzhhamZ2WHI5V2NDM1doUTJPTitWQ0tQWGw2Q0ZHemJUclkw?=
 =?utf-8?B?MkpmaEduR2F1cmZseXdyeGVFRndjamlaam5LWG9JYWYrZERDd3NtQmJjb2pD?=
 =?utf-8?B?WEI0MTR5Wi9JSGJRKzc0Z29QVEFBMjl5cUl0ellkaXZzblZsQWZ1cWwyRmMv?=
 =?utf-8?B?aTFLMGMwaGZaR1ZrMVZCTDJCVGJqT0hXZi9iUHN0VUEzdTVBZTBXZ05LK0xF?=
 =?utf-8?B?Ykcxc1paV29oazdueElnaUdmU3JWS3hEeEVWQzVwSkV3OW9tdm9xMWZEWGRE?=
 =?utf-8?B?S1FPVDNlc210RHBQWWlOS29vZ3QreUJxYVEzN2h1NW9KU0lEVzhVclFsR3FV?=
 =?utf-8?B?MGR5ZmFZK0dvYWtJQUl1ZU5IT0UyUVBXVWZ0WWswTXdXRXJsM1YrTDJWOTBN?=
 =?utf-8?B?QW1DSXJPcGY5RzVkanRxVXlhNXg4aFpCNEk2S0FGajJvR210aVRDaTd6K2xy?=
 =?utf-8?B?R3FQY2RJRGZ2N3ZiaFR5SWt3OTRTSjM5UEhBWTNwZmZaODBRNVBRM3I0LzRH?=
 =?utf-8?B?aDQyL2c4STRnVEhQYUdMdDlwVzUzZFVweUVCL3NwcG93NmpRYVNUQzB3cm91?=
 =?utf-8?B?ZGROVVhDRVhKelMrNEVHdEl6SngzMTJPM0RIZ0NobEZsdVpqcUpWajJzNWJr?=
 =?utf-8?B?L0FCOW1DNDZuejNmVTBlTzdPZDBrdWttM1BXc0NDbTZtSVRIT1N2SzFsMHRI?=
 =?utf-8?B?ZnpaMHJOTWJWcXVJd2toa04zM1lHZFdMRHZsWjRLYnVsY2hzOGg0UTdvemN6?=
 =?utf-8?B?ekJteGdBK1IraXJzdFJkZVVQR3BLN0FWM0lUdWJyTUR3ZkhLU2RNb2YycTZ6?=
 =?utf-8?B?YmRTeVREZ3lSZlVWZ0dsSWFtOXUvbGdnSkJibDFPQnRCejN1aFhnZnlRdlMw?=
 =?utf-8?B?MGFBcFF5blYzKzdMS0tRWXlheStvOU5yNnk2QnV6WmgxenppM1NNL0tvaTZn?=
 =?utf-8?B?VHBFS1hUL1ZWZHBzWnA1WmhwcVdwTWVyYXltOTFqbGZBNkQ3Z2M1SFoxTUkw?=
 =?utf-8?B?dWNsVDZZdkhvVmt3dWhlakZKRDl4dmpXK25WelBYMVRRV2xGV2tETDlCM2VK?=
 =?utf-8?B?aS9ZSUFWTU82S2x6VUhqVUVycnNGTncxYTVyeVNvaWdUbFl3QVNldG5nY1E2?=
 =?utf-8?B?ZHpteDJtV0o5UzdRN0ZzQmUwN1lwTSt4MDh6aUZVMjg0V1ErUFNnMy9yblVW?=
 =?utf-8?B?R2xIeEdtdFJOWlVrRHRGei9PRmFsOURWWkFuQkdlT3IwYzJNWU9UTUNjVi9n?=
 =?utf-8?Q?r3gs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjY5Z3k0NVFBQ3V3Z01Jellzd09ENmRoSEJtNTFHci9KcnpoMmpYVi9xc256?=
 =?utf-8?B?emo0K0tiVnhoRkQxSVh5Q1VuRTV6WE45dVRFaUxKd1YvWndXRktmMHoxUnZj?=
 =?utf-8?B?eDB4dkRldjZEVzhzTlBhYjNsVE9mU0Ric0dTOEgva2tva0dmeG9wbDhJaDZp?=
 =?utf-8?B?djNDVERTT2V6U3RHWE5ORG5ZNjd4S0JGcWVwS0k3ZUxteHhmTlpaaDNEL01C?=
 =?utf-8?B?bGdPQVZldTlqUnNoZG1QUXhvUXpxWGpiQW9iWGhoMDYxTUlVdEpJZEVTb0sv?=
 =?utf-8?B?aDZ1N3FrcmdaNGgwa282YUwxY1lraGJNMExzODJhZmwreXVVdUdaVmZ0YXRk?=
 =?utf-8?B?eE5sNllaaHQvMUc3U0JaaUVnWTZrNXlqTVF3S05IUmYvMjFDZnp5QXBBTG5x?=
 =?utf-8?B?YUdtTFdhdzhxUkphSWRWVXFYek03Q2J5OWNKak5PTFBpVERsV01aNHZMUjVq?=
 =?utf-8?B?bVAwYnhVNms0ZHJmdStCZDhWeVJLTS9CTEhxL3BGdG1NWUZSM251U05tTDF4?=
 =?utf-8?B?RjdxU0xPVDhDbnVUSDFEOW9FNTJUeTR5aTJlR2VLZ21nUzhGR3d5TFYwUERY?=
 =?utf-8?B?MUhiWHI0eTRlM2FGSnlHZFIvb1JVQ3A1NmJpME9COVdSMXpvZUJGdlhtNUow?=
 =?utf-8?B?Nlg4WnlpQzU2d3N0Mmc2djhhZzVwMnpLTXg0RzNWeHdodFVhYXQycEI4Rkwy?=
 =?utf-8?B?RkVsYkxXaUlHa0FOeUpWZzFTNExDZ05qYzQ2dHhJNWhSYWJIYjFHWE1SWjc3?=
 =?utf-8?B?U2NHZFRGNi90a08rVEtNZldPMTVIQmVONmZPZlJ6Tk4zNlJ0SXo2SGxEa1F0?=
 =?utf-8?B?VlVGVHloWUVOb2JPa0oyT2NSbmRuT29UMStlSVplcy91a0Y0R0Q4dFhPNEkv?=
 =?utf-8?B?OXVCVGp0TWFvOTJGajgyL1BxLzc0c2p1VEdldlhoRjJ2L0t5V2RpRk5aVHFr?=
 =?utf-8?B?dDZ2TnhudDR2cHpEWHlEQStacndvMm15MGFzSTdCM3VQbUlrTmRoc3BxdXN4?=
 =?utf-8?B?QjVncncrc2grbUlOZGtmamE0ekFaVHluSkdWZXdiZUNhM2U5aGJSRFZ0dUZ2?=
 =?utf-8?B?OWNqVk5SZGFaaE40QXI5T2RVSUhjaVBDRjdNV2RNVXBNSzhjZUw1T1JyWnJE?=
 =?utf-8?B?NzJmaU41VUtueFNZVDhVL3FqYlZCYTNwZlZWSHdMNGh5TlpBWGdjSUJadWtK?=
 =?utf-8?B?UmEwemFhQWN1YlFxak9sMUkzNGt4Q05ZdzF2ZjVWVm5wYXZ3THhYMjk0cmc1?=
 =?utf-8?B?eTg3dU9jSkRiS0hzcXJ6WDUzMUozSDgwajMzNTNhU0s0OFF2UUdTU1hITDlT?=
 =?utf-8?B?TDRsKzVTRFVGU20zL2dITEg0VmlIU1pNZjBNNUI1U2JPcHVpVlJEbjc3Zllt?=
 =?utf-8?B?M0RzZlE5Nzl6MkZZSW9SemEwWHNxMGoydWFwUFFoOXppQVlDbmRHMUxVVndC?=
 =?utf-8?B?Y1dPelZFbmVQM0k3NCt0ZXJLY2lkUVFKQndPejZldmxRU1Rtb0pBd1lyQkk0?=
 =?utf-8?B?YjZrbUZGMHJvdlgxVWdlYnVHTWdlRjhEZ0ZiODBlNXpBWnF2NmlJNXNrSzU3?=
 =?utf-8?B?bjBWUnBLYmY0cDdTUm04bE82S09VTVVEbzZpR1Vwb3RFOFN4WkFHR3VTNHpn?=
 =?utf-8?B?bmY2aXVlU1BjaE1FWnlFdVFKcDlneGxPZHNqZ25NNVRHUXprRE1zUnpBazZC?=
 =?utf-8?B?RTBPOTNNa0R2Y0l0TUkxa1VIZTBhTDRrTXR2SUVPaE9IeldTUDBaN3Z3THJy?=
 =?utf-8?B?TGErbG9zeXQzcHkzTlhwMnhLN3dydjY3aEZNZmJNWXNybWxFeTBBRlpCRzhH?=
 =?utf-8?B?djlmNlJZWlFPbzVIb1paOVZLMDlKRDQwazFxMjUxZ1pFUkJCNitHRVZoTW1r?=
 =?utf-8?B?QkZOR0gxT2s5TG05ZVlOWkNiTkoyQlMzYU1EcG03anl4am5JYU95QkhCeDRS?=
 =?utf-8?B?T2NiUHA3eVRXZHVXUjh3cFVFQTVLT2pGS3RDWk5ScStTb05BQ0NsWmpjMDR5?=
 =?utf-8?B?QUw5cDF3MXhIbXRpazZLamtTak5uOHVnK1dqV2N4WExEK1BPcHI3bWRaRVZZ?=
 =?utf-8?B?NFVxSlhsSzRUcEcwcmg0empqckdZeDdVV2lHcmZMVk5qTXptK3JIUTU4clEw?=
 =?utf-8?B?ZWtDRDdOdnVCUi9WWUp4UFVFOTRreWxKNVMwZFB0bnN0dUhqS0M5YTk5MkI1?=
 =?utf-8?B?MWQ3emdFQS8vUjduR0VIOGpOSXZ4UVFROXRQWDRSNnd2eTFqbWFoeUlPSVha?=
 =?utf-8?B?NVhxdDlnOXRQQTg3MEtTM1hGZDR2aElHV0NtZzV5OWFMT0RBME5zQjdhZHVR?=
 =?utf-8?B?WEtuMytDbE9OcjJNOHNVaEFnZlZSNlFGbXY1YkNuN2FDVENyZUNldz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e93e1358-c032-45b7-fc44-08de6ee1307c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 11:30:59.4065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QK27b38ZC7dMXmAvntycbt1bXkL99ig5Bfxsq0l8K8zCoBxrnXSzW5K8Fs7ofqv/0Qo1AFqlILdnQTRfFUT65YZYBxma4QFIRrqc1S4vit4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8296
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,xen.org:url];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3A06A155E85
X-Rspamd-Action: no action

On 18/02/2026 9:03 am, Jan Beulich wrote:
> As per the standard this is UB, i.e. we're building on a defacto extension
> in the compilers we use.

Is it a real extension, or just something that happens to work?

>  Misra C:2012 rule 20.6 disallows this altogether,
> though. Use helper always-inline functions instead.
>
> In sh_audit_l1_table(), along with reducing the scope of "gfn", which now
> isn't used anymore by the if() side of the conditional, also reduce the
> scope of two other adjacent variables.
>
> For audit_magic() note that both which parameters are needed and what
> their types are is attributed to AUDIT_FAIL() accessing variables which
> aren't passed as arguments to it.

This is grammatically awkward.  IMO it would be clearer to say "For
audit_magic() note that there are more parameters than might seem
necessary, caused by the expectations of AUDIT_FAIL()." 

>
> No functional change intended. Of course codegen does change with this,
> first and foremost in register allocation.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Definitely a more surgical fix than my approach.

I was attempting to turn FOREACH_*() into real for() loops behind the
scenes, so we don't have the {code} as a parameter, and get real break's
rather than magic behaviour with the _done variable.  The problem is
that ever helper is different, and there's rather more hidden under the
covers than appear at first glance.

I'd still like to make this approach work in due course, for the ease of
following the logic if nothing else, but its hard enough to not be a
couple of hours work, and not high enough on my priority list right now.

> ---
> Leaving even the fetching of current to the helper in
> sh_rm_write_access_from_l1() looks tidier to me overall, albeit this means
> the fetch will now occur once per present L1E.

This will not make a dent in the performance of the shadow code.

> Converting the #if to if() and #ifdef to if(IS_ENABLED()) wouldn't work
> here, as identifiers are used which aren't available when the respective
> conditions are false.

Personally, I'd have put this in the main commit message, because it's
the justification for why out-of-line static inline's need to be used.

>
> Note that I tested this only on top of
> https://lists.xen.org/archives/html/xen-devel/2023-05/msg01140.html, but I
> have no reason to assume that there is a problematic interaction. Of
> course it would be really nice if the rest of that series finally could go
> in.
>
> --- a/xen/arch/x86/mm/shadow/multi.c
> +++ b/xen/arch/x86/mm/shadow/multi.c
> @@ -395,7 +395,7 @@ static inline mfn_t cf_check sh_next_pag
>      shadow_set_l2e(d, sl2e, new_sl2e, sl2mfn, SH_type_fl1_shadow, sh_next_page)
>  
>  static inline u32
> -guest_index(void *ptr)
> +guest_index(const void *ptr)
>  {
>      return (u32)((unsigned long)ptr & ~PAGE_MASK) / sizeof(guest_l1e_t);
>  }

While fine per say, this doesn't appear to be related to the patch?

Everything else looks fine.

~Andrew

