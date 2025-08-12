Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C82A6B21F57
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 09:20:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078303.1439289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uljIm-0007bZ-TN; Tue, 12 Aug 2025 07:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078303.1439289; Tue, 12 Aug 2025 07:20:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uljIm-0007Yz-PK; Tue, 12 Aug 2025 07:20:08 +0000
Received: by outflank-mailman (input) for mailman id 1078303;
 Tue, 12 Aug 2025 07:20:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3OTH=2Y=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uljIk-0007TH-Lx
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 07:20:06 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be0ffbea-774c-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 09:19:54 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AM9PR03MB7741.eurprd03.prod.outlook.com (2603:10a6:20b:41f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Tue, 12 Aug
 2025 07:19:51 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 07:19:51 +0000
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
X-Inumbo-ID: be0ffbea-774c-11f0-a327-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GOYGe8E3VkAfL+6wku4m3/UlryG37XyF46EDEwwVS3XGQTrZlFOeDSMrg3FfhIZLDDK7ePQDPrmJkPpw2yGspkBtIGUM61EXbG4xuzD5x/6uSGVEy85qvmDI6WUbWjGQ1kccHOfLn62vhIQOqOdFbM7CqmgKZPuL+ESpI+8PEw9Jw+r2+wyvzNS4DtRcX9hQV1EXjkNayY0yxATLHTEAq0bUl3IK17qfWheTPNe68SXwD+t2B4MmVpcp7AXGq67C5xSBMz2zpWzP0ZB8yNmjDaEO6MD5U34P90cEjxbOP+vS674j7Tkjv7zzJNOgTPNRb7XOQb+pFZrNQVLhSCO2fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S//gZqCtvvPAwwzI3qetOncGCnCD5p0diN9NwjXOHQU=;
 b=FbsIndthq08Lbbvea8he4cJdkW8ZmRC83SNMhGizE/MKKd6+Oqkbi5Efc/XXDbshDHcqEiVm+O7KJVaqivROrwz+iITsr6kcErcI8KYICepjGJX/PSSdr4U3uLBTJ2m4BqG0WCUj2CTEq/p1366Q/TGVAMQrYIw4HOFW1ZF37KCF3Tz8nJFPS2iEVqn8UZYfNGS6O4aruDitxnt9KeWntYz7kf90qw5l+NNAWdiEsjEkgI6eAKIYmeA9eLqQKw34jMmshgXmAksjGZcjVQecLuRMBNyKuxOLBTyUC19Ai0NYKmfJ85O9x36cYvGAiC/OIwH0KdcWe3X5imG0E0T4VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S//gZqCtvvPAwwzI3qetOncGCnCD5p0diN9NwjXOHQU=;
 b=vvHBQqgHEUpcfKkgdACrrLvOZXk/p/IDBkYa8f5u84joHMmvWLopcowm90dGNFythQdyov7MpZ6OcLLEIaWYdr8D6VZdKkHm4QOgQLjXWbqCKaCmJExKzz4ADLMUIjz7jQ31YVwF2pytYgyJXDlXPL4MyvknOLAU9mo52XNCLzDM+TzyILHOmidl6xHli5sQHy4nyVeo7DlWPnFsHKoVPUbjOEpIfIplgtJqrZY22Hjj0IU9OVlLFCmr0m9PJbfmpzP73Vfe7tgXrkd2XO1mJ2b0kZ6ce4Xymofzv/v2uUmvCq5XlCgfSoS8q0hI80Et2vIha8ZWDlc5+qkxMsmrTQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: Re: [PATCH] misra: comment default case in single-clause switch
Thread-Topic: [PATCH] misra: comment default case in single-clause switch
Thread-Index: AQHcCuaGmRofUvvSEEWe+78HEkEpW7Rd9A6AgACpHwA=
Date: Tue, 12 Aug 2025 07:19:51 +0000
Message-ID: <110fc2a9-2f48-4718-995b-3295b9c7e9aa@epam.com>
References:
 <1d3c5364b726e42a8c38c396f2e20efc52790f62.1754933752.git.dmytro_prokopchuk1@epam.com>
 <d82cc723a17ec65f12fd60182fd6fe20@bugseng.com>
In-Reply-To: <d82cc723a17ec65f12fd60182fd6fe20@bugseng.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AM9PR03MB7741:EE_
x-ms-office365-filtering-correlation-id: fe1945b6-6fdf-4970-d9da-08ddd970a0be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|42112799006|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MWYyQURoVjc3bzQzSDlvb08zVEl1Y05XSVphakx1Nk5Ea1BHLzNkNHppajJx?=
 =?utf-8?B?d0tBeXNIYjVPWEhBc2E0ZjFIRjZtK1Vra2FzM2RrSU45clpEUlNpaXoxa1VK?=
 =?utf-8?B?VVJ3WnorVjVNbGxWeUVlenJQc0R2NWludTdMR0psQWtYUnJCVFlIaHJSM3JF?=
 =?utf-8?B?a290dE8zWHlNVmxrQWZMbUk3eko0VGN5VGUzVDhuQlhDMm5Cd0dDUGFidmRG?=
 =?utf-8?B?ajZrdVlIVGVlWjlOQkp2K29sL2FEZmxuT3RpTDd1T1lscVJhMlcxUVlmQ0lC?=
 =?utf-8?B?K0RhbGZZVlF0cGplRnIwbWFUMDdUSWp3QnU2eGtjNGRDNm1DSmhYSVRlMHlG?=
 =?utf-8?B?d3Z1STdHcWp1ZllWb2ZyL3laUHppdHNwUERKckZtamFtZ3Q2UHcrZGlubnpl?=
 =?utf-8?B?WWhGaEtISFAzYUJ4aWR4RlBZS0M1ZURVR0RtVHg0UmRPQzZrOVNxM01qYnJD?=
 =?utf-8?B?S3QrS3cvbkZqM2FSRnRXNGhGM1JmcVgvakVBaTRUb0tNWE5zbDNYQ0N1TkM1?=
 =?utf-8?B?Um5MRjdzUnlrN0pyK3E3Mkl5NU5UUXhkMHFnMnVHVVREMVZxZzhlZWxSdW9v?=
 =?utf-8?B?Skd1TWdXcHFLR1RwLys4eXVJeExMY2s1Y2w1am01emh0aGpjcmo4U1pnZjB3?=
 =?utf-8?B?dlRVUVFxNHc0TGdrTFphZXNoZ2QxNElqZ2VCbGpIb0ZoTEdMTmFiYkhrWk1T?=
 =?utf-8?B?QTRWd3d2K3BhblRwU1Q2R0d0T3VCakRoZ2hZR1Z4V2JITkFTNk1pTDRIZ2Vz?=
 =?utf-8?B?Z3VnTCtPVlpuMGNkdlpVclJMb0hwTENLaWRFK2o5U2I3bEZPV0diUUs2dlRF?=
 =?utf-8?B?TUdnUEJ5OEZ3YkllR3ZFNm1HeTlEOWlKenNIRU1vRjRJcUtvMlI4UkJvMiti?=
 =?utf-8?B?OFBGQ2hrRXRDMW9Fdjd3VmhSV3FnTFR5ZkJpVzNNN3FsbG1WWGVwV1hWdDB6?=
 =?utf-8?B?dzRpTC9WT3pZY25ua3lBbHJkWTQ5STdRblRpRXJJSzF1VWNvN0ZIZUZxNnRu?=
 =?utf-8?B?bCtDS1BjbjFSbExOMVdmRTBlQzk2VzlWUTc1YndNTFVaRHl5dURmZUgxc3RD?=
 =?utf-8?B?YVI4L3VyUkRWYzFIbmY0azd0SmhNSjdXekVLcnFRU05jaU5hekxUUDltVWtJ?=
 =?utf-8?B?cW8xcWhOZENxSGh4TmlwM0ZQSnpnV2tjNEN4RmNhNitjOGM4V3hFcG1rMGdP?=
 =?utf-8?B?THcrU0pxZW5jckhjeUp3M09SZUk3djVmVVZEbnZVU2R5a2RxQWdIeWVrNytO?=
 =?utf-8?B?MnlYQWtiK0NpdSthaGZ1MFk1ZnRLYkFqNkRuTFpFZi9pVXdnVzJmRkdXVWZu?=
 =?utf-8?B?SExXSHdESmZUU2hCWVM4ZG1ZZnhHSVMwc05oQkRWY2hMQkE0eWFUT1NJb1k0?=
 =?utf-8?B?WjBhbWhlVzI4NXlCVEl5UTBWME5MVTRtK1duY2o1TjROUG5DUjVnN0JzNDNG?=
 =?utf-8?B?dmFxdWZRNlJVakIwaUwzeE1hbkhBK2p2Y0k1cVpLelRQYm1YLy91dzJPQW9P?=
 =?utf-8?B?WUdiL01DN1ZvcHdqSkxoZm1qM2Y0OG1Jb204dHRROStROHF1cGtXSFFVVXNW?=
 =?utf-8?B?aUFpTnk1ZHJGcW9oVEhSek5xbUpkb1BRT2RvM2JnYjRaZTV1akVrNWlWcjIr?=
 =?utf-8?B?bE1ITVdQWVgzTEhKRjFCRkY4eE5xS3MxemhMTDA1OEZXdC9wSmtNckExdS9s?=
 =?utf-8?B?a2M0YUlFeFVpTDkyVjhYOG9mMDVCc2lseXE2YmFJZVFkc3BWK0V0N3YveEtW?=
 =?utf-8?B?OWhkWk1nUEJhTUx6a1hCaytaZ3hpSytLZmJOd0RLQnRvZjV3N3U4V1lqOUxl?=
 =?utf-8?B?ZWdPbkNkZUtVdDcxMkxIUTdQd2ttNXRWbmcwZVdUamg2THpJbTVDMnVMaU5B?=
 =?utf-8?B?WEFhNHhNK3B5Zk5sVXY2RXpnZUZJUkxsWGVVblNDZUxHYzgzOGZ5Uks5NkZ2?=
 =?utf-8?Q?6HB9rv/wi7Y=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dndyVW5RSkp0RDdNTG1oT3JMblVHdCt1K0lZUFQxekJyMVEzSVUzZ1k3M1RF?=
 =?utf-8?B?OXIveXpid2lNdDlRZXhuMVd1YzRWTWhISHlwcjVHc0s4eWxoTVdVVmJNYTBP?=
 =?utf-8?B?SjNxL0c2MGovVlRMenNHc1REK09FWHc4Q212VllzMVdyS1J3NFF0bi90SWUz?=
 =?utf-8?B?MFc5dWNZNmozVkMySndxZjRiTDhxcDZTNGtWSkNLSnNNa0FGaWtFZ1RDRys3?=
 =?utf-8?B?N1drdU9HN3ltZWFRSjJMeGZVTDltTjUwcGlYVGxoSVlGRndBWmV2MHpmRjlm?=
 =?utf-8?B?N3Z0aklObExXUm1qNUhkU2hFNGluT1hLTXNaUUhvZnJFRHluSGZtS2hMZzVU?=
 =?utf-8?B?b2dKU0lGMHNmM0xvdndua0IrYVpkVWI2MXBaVloySDRHeXF1ajB2RzFZYkZj?=
 =?utf-8?B?bkpJcGo2VFE5VWc1UE9STitjRnBKT09rOVZrMmZjME00VlJCR3ZWenFDejlV?=
 =?utf-8?B?dFVHUE1iTjJ5SmVDbHRCLzZnWEUrNUxZR29LSEVnZ0RRaWpkSzlSZFFiRWgw?=
 =?utf-8?B?WHFucVlFZnNhQ2RvVXBER3FjSGlzUXN3bm5xZ2hOZkdHdjI4bDM1alIzWHFn?=
 =?utf-8?B?aFFjb0ZqYVFqN1hHYU1xVWVzYzhzeXpDWk1TUDRvcFRINGxqN2FCaDAxdG9s?=
 =?utf-8?B?dUIrTURnMXVEZnNTSGdrMWlHOURPSUNuRmNZOGJvL2g2ajg5WDJqajNUbmxS?=
 =?utf-8?B?U3A0N1E4Ym0vZzQ3czFqcUN5aldPR2ttVk9XczNpYzRWM205SVpQYklSU1d4?=
 =?utf-8?B?RGxMeXlPL29jOFZNcHRhNTl4ODVFc2llYXN0NFhsbXdXbi84S2NpaW5BZWxw?=
 =?utf-8?B?clVGVUJEU3RlcGlJbUMvQlhxQUg5RnJLL0kzdEE5NkU5bVdLS0o2UHo5VDJZ?=
 =?utf-8?B?bjZJN0VYcmQrakVsZ3pEN211amhFZ01UTDI0VjR2dUtLM3N5cnNmbWlxVzJG?=
 =?utf-8?B?T0FlcjJnK0RvOWZZK3BLc3FleUtTc2JxY1ExcUNCdzJXS3AvQytrczNXLytw?=
 =?utf-8?B?UUpnYXZWV0xYMW5NVml5cUxHTnNybnp1RDNTc0tXUUxOOU93dnJkS1YzZTZa?=
 =?utf-8?B?R3NMYkZDMkE3bnlUcnArWUtjV2hjSHp6RkVHYUJvZ0ZKU25WeWhua3lTK0wr?=
 =?utf-8?B?RldCRGNPN3R6YU1CZzdzOStwQVlUMVhuZkp4NGg3L0ludXNHTE9Xa2d2VDNE?=
 =?utf-8?B?SnVBYU5LVTFwOW51clVHSllLYmlid205OWcya3hpcENvSXZzaEZOKzNuemtN?=
 =?utf-8?B?a3lMZkJ2THUzdUlWVFM1NTRpQm5jNFJremt2NmRNZHlyZm14ejg1NHN5RVdD?=
 =?utf-8?B?ckM1V1h4L2VrMG8waEJIOHlFWGF0Y0ZseGR2bml0SWlVbXA1aFZjNWZtQWt2?=
 =?utf-8?B?SjlFQ25uYUhLTDVLM3YwaWVadjMyd3NyV2hzdEVYWHROc0xnSFFnQTN4YUpK?=
 =?utf-8?B?dUdUS1lneEdVSkJha0dXNXNNT2Zhck1Qa2xXTDV3WXVneXkxRlRXV2kzb053?=
 =?utf-8?B?ZEdPajArWi95U01rcHJtM2cxWG1IaGFFYjM5TEVkN1hVSVBWdHNCMXdPOG1M?=
 =?utf-8?B?cUNjd2JzeFRSeVoxb2ZHbWVoMnZCTjVBQlA0QWtiM2RlTEQ0Qy90WXdocGZa?=
 =?utf-8?B?TUhRYTArWFhHM0sxV1llWmd4Njh6VElkT2FVN0FuSVJ0YmRiWVJTRlVpMjla?=
 =?utf-8?B?VUNYL2ZtNE9WOENsTHVxYXlDcHFKeGptbE1QVUJoTGtFY25kRWNYQjhSVjN5?=
 =?utf-8?B?Q1hHN3gyOVFsR2M3QWg5YXVUTHhmc2cyOXF0WFArUTJLNGlNU3BFeVRoSUhI?=
 =?utf-8?B?U3k4UitQeDNhcVVGSG9zcndCSFhvRmE5V1RoNlVwVXBGWUt5U3hmckNJTVI3?=
 =?utf-8?B?dUUxQ25IOXhEeE56SjArRkEyS20rSE5IWVJKaytDUUZrWEZJODMzS0tvbk9k?=
 =?utf-8?B?dExLUlZXU3I0L25xQjlQU0JMRlZQWlBVUmVYbHVUbmVRKy9iT0s3UjdkejVj?=
 =?utf-8?B?ZitQeWtxRHQxVnJOU3hVd2oxSDhmVXBHdHRZKzFHRytxbVpkMG5QaERKNGR2?=
 =?utf-8?B?akwvTHpRR09NcEhpTFZ6RlJQNWY3TTduVjdETzlzcTNJNDJhOWcrUTVkbEFE?=
 =?utf-8?B?eFArMGxqSEhTVmhyRGphbUxncnNwYi94b2dzSnAzN3BETllQTzFYcWdlTzBm?=
 =?utf-8?B?RFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF37E4B34291534AA72C3030594876C1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe1945b6-6fdf-4970-d9da-08ddd970a0be
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 07:19:51.2350
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wgrYvJp+qK6LkED1tc9J8cmPMz+zQbdTtqvTMok+0ALhEi+r6oGIs6SHdecRmcoAblXDJktO0kUi7hxjOTU+DAjuFoSZeZckmFBOcC8UGG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7741

DQoNCk9uIDgvMTIvMjUgMDA6MTQsIE5pY29sYSBWZXRyaW5pIHdyb3RlOg0KPiBPbiAyMDI1LTA4
LTExIDE5OjM2LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBNSVNSQSBSdWxlIDE2LjQ6
IEV2ZXJ5IHN3aXRjaCBzdGF0ZW1lbnQgc2hhbGwgaGF2ZSBhIGRlZmF1bHQgbGFiZWwuIFRoZQ0K
Pj4gZGVmYXVsdCBjbGF1c2UgbXVzdCBjb250YWluIGVpdGhlciBhIHN0YXRlbWVudCBvciBhIGNv
bW1lbnQgcHJpb3IgdG8gaXRzDQo+PiB0ZXJtaW5hdGluZyBicmVhayBzdGF0ZW1lbnQuDQo+Pg0K
Pj4gVGhpcyBjaGFuZ2UgYWRkcyBjb21tZW50cyBpbiBkZWZhdWx0IGNhc2VzIGluIHNpbmdsZS1j
bGF1c2Ugc3dpdGNoZXMgdG8NCj4+IGF2b2lkIHZpb2xhdGlvbnMgb2YgdGhlIHJ1bGUgd2hlcmUg
dGhlIGBkZWZhdWx0YCBjbGF1c2UgbGFja3MgYSBzdWl0YWJsZQ0KPj4gY29tbWVudCBvciBzdGF0
ZW1lbnQuDQo+Pg0KPiANCj4gSWYgeW91IHdhbnQgdG8gZ28gdGhpcyB3YXkgdGhlbiBhdCBsZWFz
dCB0aGlzIGNvbmZpZyB3YW50cyBkcm9wcGluZzoNCj4gDQo+IC1kb2NfYmVnaW49IkEgc3dpdGNo
IHN0YXRlbWVudCB3aXRoIGEgc2luZ2xlIHN3aXRjaCBjbGF1c2UgYW5kIG5vIA0KPiBkZWZhdWx0
IGxhYmVsIG1heSBiZSB1c2VkIGluIHBsYWNlIG9mIGFuIGVxdWl2YWxlbnQgaWYgc3RhdGVtZW50
IGlmIGl0IA0KPiBpcyBjb25zaWRlcmVkIHRvIGltcHJvdmUgcmVhZGFiaWxpdHkuIg0KPiAtY29u
ZmlnPU1DM0EyLlIxNi40LHN3aXRjaF9jbGF1c2VzKz17ZGVsaWJlcmF0ZSwic3dpdGNoKDEpJiZk
ZWZhdWx0KDApIn0NCj4gLWRvY19lbmQNCj4gDQo+IGFuZCBwcm9iYWJseSB0aGlzIG9uZSB0b28g
KGhhdmVuJ3QgY2hlY2tlZCk6DQo+IA0KPiAtZG9jX2JlZ2luPSJBIHN3aXRjaCBzdGF0ZW1lbnQg
d2l0aCBhIHNpbmdsZSBzd2l0Y2ggY2xhdXNlIGFuZCBubyANCj4gZGVmYXVsdCBsYWJlbCBtYXkg
YmUgdXNlZCBpbiBwbGFjZSBvZiBhbiBlcXVpdmFsZW50IGlmIHN0YXRlbWVudCBpZiBpdCANCj4g
aXMgY29uc2lkZXJlZCB0byBpbXByb3ZlIHJlYWRhYmlsaXR5LiINCj4gLWNvbmZpZz1NQzNBMi5S
MTYuNixzd2l0Y2hfY2xhdXNlcys9e2RlbGliZXJhdGUsICJkZWZhdWx0KDApIn0NCj4gLWRvY19l
bmQNCj4gDQo+IEluIHRoZSBlbmQgaXQncyBhIHRyYWRlb2ZmOyBwbGFjaW5nIGEgY29tbWVudCB3
aXRoIGEgc3VpdGFibGUgDQo+IGFyZ3VtZW50YXRpb24gbWlnaHQgYmUgc3RyaWN0bHkgYmV0dGVy
IHRoYW4gc2ltcGx5IHRhZ2dpbmcgdGhlIHRvb2wgDQo+IHJlcG9ydCwgYXQgbGVhc3QgZnJvbSBh
IGRldmVsb3BlcidzIHBlcnNwZWN0aXZlLiBGcm9tIGEgTUlTUkEgY29tcGxpYW5jZSANCj4gc3Rh
bmRwb2ludCBpbiBteSBvcGluaW9uIGJvdGggYXJlIGZpbmUuIExldCdzIHNlZSB3aGF0IHRoZSBt
YWludGFpbmVycyANCj4gdGhpbmsuDQo+IA0KDQpBY2NvcmRpbmcgdG8gSmFuJ3MgY29tbWVudCBo
ZXJlDQpodHRwczovL3BhdGNoZXcub3JnL1hlbi83MjVlYzg2YWMxYWE4ODNjMzVmYjMwYjhmMjI2
Yzk1Y2JlMDkzNGU5LjE3NTQzMjIyOTkuZ2l0LmRteXRyby5fNUZwcm9rb3BjaHVrMUBlcGFtLmNv
bS8NCnRoZXJlIHdlcmUgZGlzY3Vzc2lvbnMgYWJvdXQgcGxhY2luZyBjb21tZW50cyBpbnNpZGUg
J2RlZmF1bHQnIGNhc2UuDQoNCkFjdHVhbGx5LCBteSBmaXJzdCBwYXRjaCByZW1vdmVkICdkZWZh
dWx0JyBjYXNlIGluIHNpbmdsZS1jbGF1c2Ugc3dpdGNoZXMuDQoNCkRteXRybw0KDQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBEbXl0cm8gUHJva29wY2h1ayA8ZG15dHJvX3Byb2tvcGNodWsxQGVwYW0uY29t
Pg0KPj4gLS0tDQo+PiDCoHhlbi9hcmNoL2FybS9jcHVlcnJhdGEuYyB8IDUgKysrKysNCj4+IMKg
eGVuL2FyY2gvYXJtL2dpYy5jwqDCoMKgwqDCoMKgIHwgNiArKysrKysNCj4+IMKgeGVuL2FyY2gv
YXJtL21tdS9wMm0uY8KgwqAgfCA2ICsrKysrKw0KPj4gwqB4ZW4vYXJjaC9hcm0vdGltZS5jwqDC
oMKgwqDCoCB8IDYgKysrKysrDQo+PiDCoHhlbi9jb21tb24va2V4ZWMuY8KgwqDCoMKgwqDCoCB8
IDYgKysrKysrDQo+PiDCoDUgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMgYi94ZW4vYXJjaC9hcm0vY3B1
ZXJyYXRhLmMNCj4+IGluZGV4IDE3Y2YxMzRmMWIuLmUzMWM3MjY5NGIgMTAwNjQ0DQo+PiAtLS0g
YS94ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9jcHVlcnJh
dGEuYw0KPj4gQEAgLTczNSw2ICs3MzUsMTEgQEAgc3RhdGljIGludCBjcHVfZXJyYXRhX2NhbGxi
YWNrKHN0cnVjdCANCj4+IG5vdGlmaWVyX2Jsb2NrICpuZmIsDQo+PiDCoMKgwqDCoMKgwqDCoMKg
IHJjID0gZW5hYmxlX25vbmJvb3RfY3B1X2NhcHMoYXJtX2VycmF0YSk7DQo+PiDCoMKgwqDCoMKg
wqDCoMKgIGJyZWFrOw0KPj4gwqDCoMKgwqAgZGVmYXVsdDoNCj4+ICvCoMKgwqDCoMKgwqDCoCAv
Kg0KPj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBEZWZhdWx0IGNhc2UgbGVmdCBlbXB0eSBhcyBvdGhl
ciBub3RpZmllciBhY3Rpb25zIGRvIG5vdCANCj4+IHJlcXVpcmUgaGFuZGxpbmcgaGVyZS4NCj4+
ICvCoMKgwqDCoMKgwqDCoMKgICogVGhlIHNpbmdsZSBDUFVfU1RBUlRJTkcgYWN0aW9uIGluIHRo
ZSBzd2l0Y2ggaXMgc3VmZmljaWVudCANCj4+IGJlY2F1c2UgdGhpcyBmdW5jdGlvbg0KPj4gK8Kg
wqDCoMKgwqDCoMKgwqAgKiBzcGVjaWZpY2FsbHkgaGFuZGxlcyBlbmFibGluZyBlcnJhdGEgd29y
a2Fyb3VuZHMgZHVyaW5nIA0KPj4gQ1BVIHN0YXJ0dXAuDQo+PiArwqDCoMKgwqDCoMKgwqDCoCAq
Lw0KPj4gwqDCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+IMKgwqDCoMKgIH0NCj4+DQo+PiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dpYy5jIGIveGVuL2FyY2gvYXJtL2dpYy5jDQo+PiBpbmRl
eCBlODBmZTBjYTI0Li5kZmJiMGRmZTA4IDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL2dp
Yy5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vZ2ljLmMNCj4+IEBAIC00MzYsNiArNDM2LDEyIEBA
IHN0YXRpYyBpbnQgY3B1X2dpY19jYWxsYmFjayhzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgDQo+PiAq
bmZiLA0KPj4gwqDCoMKgwqDCoMKgwqDCoCByZWxlYXNlX2lycShnaWNfaHdfb3BzLT5pbmZvLT5t
YWludGVuYW5jZV9pcnEsIE5VTEwpOw0KPj4gwqDCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+IMKg
wqDCoMKgIGRlZmF1bHQ6DQo+PiArwqDCoMKgwqDCoMKgwqAgLyoNCj4+ICvCoMKgwqDCoMKgwqDC
oMKgICogRGVmYXVsdCBjYXNlIGxlZnQgZW1wdHkgYXMgb3RoZXIgbm90aWZpZXIgYWN0aW9ucyBk
byBub3QgDQo+PiByZXF1aXJlIGhhbmRsaW5nIGhlcmUuDQo+PiArwqDCoMKgwqDCoMKgwqDCoCAq
IFRoZSBDUFVfRFlJTkcgYWN0aW9uIHNwZWNpZmljYWxseSBoYW5kbGVzIHJlbGVhc2luZyANCj4+
IHJlc291cmNlcyBhY3F1aXJlZCBieQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBpbml0X21haW50
ZW5hbmNlX2ludGVycnVwdCgpLCB3aGVuIHRoZSBDUFUgaXMgYmVpbmcgdGFrZW4gDQo+PiBvZmZs
aW5lLiBPdGhlciBDUFUNCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogYWN0aW9ucyBkbyBub3QgcmVx
dWlyZSBHSUMtc3BlY2lmaWMgaGFuZGxpbmcuDQo+PiArwqDCoMKgwqDCoMKgwqDCoCAqLw0KPj4g
wqDCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+IMKgwqDCoMKgIH0NCj4+DQo+PiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL21tdS9wMm0uYyBiL3hlbi9hcmNoL2FybS9tbXUvcDJtLmMNCj4+IGlu
ZGV4IDUxYWJmMzUwNGYuLmQxZjBhZTAyMjYgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0v
bW11L3AybS5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vbW11L3AybS5jDQo+PiBAQCAtMTgyOCw2
ICsxODI4LDEyIEBAIHN0YXRpYyBpbnQgY3B1X3ZpcnRfcGFnaW5nX2NhbGxiYWNrKHN0cnVjdCAN
Cj4+IG5vdGlmaWVyX2Jsb2NrICpuZmIsDQo+PiDCoMKgwqDCoMKgwqDCoMKgIHNldHVwX3ZpcnRf
cGFnaW5nX29uZShOVUxMKTsNCj4+IMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+PiDCoMKgwqDC
oCBkZWZhdWx0Og0KPj4gK8KgwqDCoMKgwqDCoMKgIC8qDQo+PiArwqDCoMKgwqDCoMKgwqDCoCAq
IERlZmF1bHQgY2FzZSBsZWZ0IGVtcHR5IGFzIG90aGVyIG5vdGlmaWVyIGFjdGlvbnMgZG8gbm90
IA0KPj4gcmVxdWlyZSBoYW5kbGluZyBoZXJlLg0KPj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBUaGUg
Q1BVX1NUQVJUSU5HIGFjdGlvbiBpcyBzcGVjaWZpY2FsbHkgaGFuZGxlZCBiZWNhdXNlIA0KPj4g
dGhpcyBmdW5jdGlvbiBzZXRzIHVwDQo+PiArwqDCoMKgwqDCoMKgwqDCoCAqIHZpcnR1YWwgcGFn
aW5nIGZvciBDUFVzLCBwYXJ0aWN1bGFybHkgZm9yIG5vbi1ib290IENQVXMgDQo+PiBkdXJpbmcg
aG90cGx1Zy4gT3RoZXINCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogYWN0aW9ucyBkbyBub3QgaW52
b2x2ZSB2aXJ0dWFsIHBhZ2luZyBzZXR1cC4NCj4+ICvCoMKgwqDCoMKgwqDCoMKgICovDQo+PiDC
oMKgwqDCoMKgwqDCoMKgIGJyZWFrOw0KPj4gwqDCoMKgwqAgfQ0KPj4NCj4+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vdGltZS5jIGIveGVuL2FyY2gvYXJtL3RpbWUuYw0KPj4gaW5kZXggZTc0
ZDMwZDI1OC4uNDc3NjExMGQ5NyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS90aW1lLmMN
Cj4+ICsrKyBiL3hlbi9hcmNoL2FybS90aW1lLmMNCj4+IEBAIC0zODIsNiArMzgyLDEyIEBAIHN0
YXRpYyBpbnQgY3B1X3RpbWVfY2FsbGJhY2soc3RydWN0IA0KPj4gbm90aWZpZXJfYmxvY2sgKm5m
YiwNCj4+IMKgwqDCoMKgwqDCoMKgwqAgZGVpbml0X3RpbWVyX2ludGVycnVwdCgpOw0KPj4gwqDC
oMKgwqDCoMKgwqDCoCBicmVhazsNCj4+IMKgwqDCoMKgIGRlZmF1bHQ6DQo+PiArwqDCoMKgwqDC
oMKgwqAgLyoNCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogRGVmYXVsdCBjYXNlIGxlZnQgZW1wdHkg
YXMgb3RoZXIgbm90aWZpZXIgYWN0aW9ucyBkbyBub3QgDQo+PiByZXF1aXJlIGhhbmRsaW5nIGhl
cmUuDQo+PiArwqDCoMKgwqDCoMKgwqDCoCAqIFRoZSBDUFVfRFlJTkcgYWN0aW9uIGlzIHNwZWNp
ZmljYWxseSBoYW5kbGVkIHRvIHJldmVydCANCj4+IGFjdGlvbnMgZG9uZSBpbg0KPj4gK8KgwqDC
oMKgwqDCoMKgwqAgKiBpbml0X3RpbWVyX2ludGVycnVwdCgpIGFuZCBwcm9wZXJseSBkaXNhYmxl
IHRpbWVyIA0KPj4gaW50ZXJydXB0cyBvbiB0aGUgQ1BVIGJlaW5nDQo+PiArwqDCoMKgwqDCoMKg
wqDCoCAqIHRha2VuIG9mZmxpbmUuIE90aGVyIGFjdGlvbnMgZG8gbm90IGludm9sdmUgdGltZXIg
DQo+PiBkZWluaXRpYWxpemF0aW9uLg0KPj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8NCj4+IMKgwqDC
oMKgwqDCoMKgwqAgYnJlYWs7DQo+PiDCoMKgwqDCoCB9DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hl
bi9jb21tb24va2V4ZWMuYyBiL3hlbi9jb21tb24va2V4ZWMuYw0KPj4gaW5kZXggODRmZThjMzU5
Ny4uMGY3ODA4N2E0YSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9jb21tb24va2V4ZWMuYw0KPj4gKysr
IGIveGVuL2NvbW1vbi9rZXhlYy5jDQo+PiBAQCAtNTQ5LDYgKzU0OSwxMiBAQCBzdGF0aWMgaW50
IGNmX2NoZWNrIGNwdV9jYWxsYmFjaygNCj4+IMKgwqDCoMKgwqDCoMKgwqAga2V4ZWNfaW5pdF9j
cHVfbm90ZXMoY3B1KTsNCj4+IMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+PiDCoMKgwqDCoCBk
ZWZhdWx0Og0KPj4gK8KgwqDCoMKgwqDCoMKgIC8qDQo+PiArwqDCoMKgwqDCoMKgwqDCoCAqIERl
ZmF1bHQgY2FzZSBsZWZ0IGVtcHR5IGFzIG90aGVyIG5vdGlmaWVyIGFjdGlvbnMgZG8gbm90IA0K
Pj4gcmVxdWlyZSBoYW5kbGluZyBoZXJlLg0KPj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBUaGUgQ1BV
X1VQX1BSRVBBUkUgYWN0aW9uIGlzIHNwZWNpZmljYWxseSBoYW5kbGVkIHRvIA0KPj4gYWxsb2Nh
dGUgY3Jhc2ggbm90ZSBidWZmZXJzDQo+PiArwqDCoMKgwqDCoMKgwqDCoCAqIGZvciBhIG5ld2x5
IG9ubGluZWQgQ1BVLiBPdGhlciBhY3Rpb25zIGRvIG5vdCBwZXJ0YWluIHRvIA0KPj4gY3Jhc2gg
bm90ZSBhbGxvY2F0aW9uDQo+PiArwqDCoMKgwqDCoMKgwqDCoCAqIG9yIG1lbW9yeSBwcmVzZXJ2
YXRpb24gZm9yIGtleGVjLg0KPj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8NCj4+IMKgwqDCoMKgwqDC
oMKgwqAgYnJlYWs7DQo+PiDCoMKgwqDCoCB9DQo+PiDCoMKgwqDCoCByZXR1cm4gTk9USUZZX0RP
TkU7DQo+IA0K

