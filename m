Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2255BD196E2
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 15:27:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201807.1517380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vffMN-0002lH-Nf; Tue, 13 Jan 2026 14:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201807.1517380; Tue, 13 Jan 2026 14:27:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vffMN-0002iP-Kn; Tue, 13 Jan 2026 14:27:03 +0000
Received: by outflank-mailman (input) for mailman id 1201807;
 Tue, 13 Jan 2026 14:27:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lb65=7S=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vffML-0002iJ-NV
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 14:27:01 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb24ce1a-f08b-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 15:26:59 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BL1PR03MB6072.namprd03.prod.outlook.com (2603:10b6:208:316::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 14:26:56 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:26:56 +0000
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
X-Inumbo-ID: eb24ce1a-f08b-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JeMcRH3O24QAUalZVeT6phgIa0BaeKTpd96FNZOq+fDxhEK+EXjHNYqE1m9FLoLivcHGGpcXgiPK4tWquuYXe5iUFbM+SC9nF1bl8LLrM0mQKC5fEy5KtntTRq9HoTNAkddcfJUidAFFoSfQXYWBZjG3i5xN+ojx2mPVxXQeg7tYrJlW5dotnl/T3nC3cBs/d5NTncbS4G2nwg2zgvA6GXekDh4QC2KiykJm5k9j7OZ6XE7igO+BGOBuK6MmASN2SzzDPndKe7x2g89KHIYavpt2O0ZYCoYguVheeLtSAHpw2dDEdRo+anrLnb/3lM+rufyMfAw5s64Kto0xDg1K0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nb3v8a6zrTjpwBjifYFB/lDV0uVk6Krj+AlTm40hQ7Y=;
 b=n330NjwdSfFZDPSsJIUt8fcXk47/ZjNKKjwmxiqyh1ieZ2jEQvj8N35ejVpKMoHzeGQEuMaWueWojOFg++OtavhMKbYHpY5j4FgPc7IH+dPkVkzRwDG+jiQtlVCKboZ4Z82s+7k440TUeIzlvDAKT4aOeSYDqWGGlZ/3eJ5OpG9aE842qksH2Z27bP+jR9UJjcaggOSC1O9NZgOP2FXciYK9d5lxwjnm67m77BFJ9HkjjbCgEEzmJDM+72lb4kOgyjJZcDU7mDmfEWFT3WbHYDEOW7ew/tOSX/0z/1lNrkgQmnD8LdIjo0H0BBW4tFMWRY4s7vlWAN/BPwEtpachpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nb3v8a6zrTjpwBjifYFB/lDV0uVk6Krj+AlTm40hQ7Y=;
 b=tMZ69Twll9HCBRWI0L9x8PJyxj/wCmYQYay7kXAgqIxC9wMY8Q4uM1EKHVm4Ki9W88EkSQsgYAo8cYeuLweFUzHj9eGal0PLcI6lmrz5JfJz8H6JfqDD9E9A7BYr/2U5mSCL4xlhmz4dpzip9DbTJCXYnsw/32uJsoyHypTnGsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 13 Jan 2026 15:26:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] x86: Use 32-bit counter for TLB clock on debug builds
Message-ID: <aWZWK7SERn5sdZZ9@Mac.lan>
References: <20260113120959.55156-1-alejandro.garciavallejo@amd.com>
 <aWZT-fGptBd58cAD@Mac.lan>
 <e8760b05-75a9-4697-86d0-3026798e32ed@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8760b05-75a9-4697-86d0-3026798e32ed@citrix.com>
X-ClientProxiedBy: PR3P251CA0002.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::28) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BL1PR03MB6072:EE_
X-MS-Office365-Filtering-Correlation-Id: 2922341c-389e-4610-7533-08de52afcdce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDBac3NUMjlFRGVXQmY1M2hQWUV3Y3ptNEJsa1BNcnZHVEdueE92ZGo2REVx?=
 =?utf-8?B?U3BXQmM1dXRWcUd4Wml5WEo2dVcwVXRJc21zOFF3Z2JhUUV6NDl2ZnphQzhS?=
 =?utf-8?B?UktWMkNqUzh3TW9XbDFKVlJLbnlGaG1Bb2pFSkZBOS9oNjhxUFVBYmdWRTN1?=
 =?utf-8?B?VzEvckdqQmdia2JLZ3ZvaHVjUFJsaXJmTnZabzZyQXoyNlZ2R2dyeVhnSTBI?=
 =?utf-8?B?NG9DeTBoSU9PZUhNakFpcVpVenlBRHJIbERSekU0bW9COUlSMVlvUDVGcDMy?=
 =?utf-8?B?aDJNK2xZMDF1Yitjc3JUYXJlcmh3b1Z3V3liSGtSMGdWU1NmOEg3YjR3YXZI?=
 =?utf-8?B?YUp3cVRZWCszTTJTQlpOQU8zMzJPRXlqY0Q5U1c4Z21TZHdrRVBjU3ZydGpO?=
 =?utf-8?B?VC94ZWhXRWE5NURqQVFIcFZCeGxEWFIrby9zTjh2Zlo3M3BBTW9lK054eVlr?=
 =?utf-8?B?blZGNExDMmlvaFRacllNcjRvQ2VLMldrcFI1Q2FWVWIxczREbnpvTXNPa1lr?=
 =?utf-8?B?UGxUczd5SE9xYTNWZ0tBS1dDbzlLUEt3TS9zYXRVNmVSUlQ2STMxOUJWMkx1?=
 =?utf-8?B?a2JEckJvekQzWERPb0pRU3RIWm9ZN2dYNk1LZzZOZVNINjZyM3VlRkN5RjRj?=
 =?utf-8?B?TTNRYm9scVkzdFRTcXFjbHNEVVY5WDZaTmpvTWFwNXVudmt3d0oycXg0dkRG?=
 =?utf-8?B?VGNMQ0ZSK2t4Z3ZBbStsNHMzUVplUlNyTC9xZ0owR1drT0lma3BMQWZJcHFx?=
 =?utf-8?B?Um41VXZXRCtTQXhMR0UycEwwYjYrU2hkWGZDNmpOS2lzbTRTSXBXUlB1SnVJ?=
 =?utf-8?B?cllnZmVJbGEyK1o1VVdGS2FsMGgzMjVvZnh5TkdVdWxqWWtTUFFVNHhYNGVI?=
 =?utf-8?B?T3lVVlBQZHVES3c5VzlONk1KUG04MFFhc1BGNlV2OGNaZGxlZlZKMEQrQnpX?=
 =?utf-8?B?MlExSUVLSDRiUVN4S0dJUG9tMlBBTi9NdWtkcVVSWHQvQ1NycnhLa1ZkM2Ey?=
 =?utf-8?B?NDYrblNvazRrZ2xCOEZIOFBCSXFZUUdyblBxc3FBSUxVNTZqaG85TDh6UWlk?=
 =?utf-8?B?eCtwVG5MSWtpdG5RTkQvdU4zVldobkU5ZEw3QnJyQzlxQnNqV2JyakcrMDJu?=
 =?utf-8?B?ZVpUVzEwNkFzbitBeHJvdDRvM25CL0VZU1MxYnZhREtaR0FXQzE0dmpEZlFt?=
 =?utf-8?B?dTNYMDB0RldEVVRteUJ2Tk96YkFtZEpmZHdjOTMzRHdyQTZ1MS9GREVYbHcz?=
 =?utf-8?B?VFdnYXlIaDlGYVg4eS9zQWtsdzQvaldiK0xkUzVZbENQOWdKZmc4dHp6Wmsy?=
 =?utf-8?B?SE5Tb2lJRjVkaXJKZnppQzFmRFFtU0RGdFdRcng4SDdITkswcklZaU4ydnZl?=
 =?utf-8?B?Yi96N0NqdXlxWmFEaDYrNUhlaXNFcmpTNloyUkRaaExyOHR3cWJycUp1L01F?=
 =?utf-8?B?aG9tWGNwVkJqT0pQbWh5K3NRWFhtYk1BMldzQnVDdklEZ0poU2lHaTBJRUxP?=
 =?utf-8?B?MGlKKyswUlhwVjJ2eUN4WXFRc2U1RFYzQ2M2MEtaMjc3MXd0RW1PdmF6ZnhK?=
 =?utf-8?B?SlA4ME9nQUtiNUFFL3ZrUlc2Vlp1cTU5dktMekxQRlU5VTBHR082SUhSSFV5?=
 =?utf-8?B?NVpHUlhvWWtFNXJIZm1QeWIrZm84QWNLRXVnc05tNjhWSnZTbXZRUmFsOU96?=
 =?utf-8?B?Ukg1MjBvcmZiN042bmMzaTAxS04rWHJXcCtyS0hodG81cUpIY1VERHA1MW1R?=
 =?utf-8?B?eEpOZ2dEMkRUUVVlcmRpZktEWVZQQU5IUmo2eHpGY1hDRGFwcjFneW4xRnM4?=
 =?utf-8?B?K0IrZXJtNHpyaWNoZGdNRFJBcEI4aFlRaTNqaTZvSHRHdVB5djRpWkVJdGVM?=
 =?utf-8?B?LzdCNVNCWjUxWEZCUk5oeDBtemVNTTVHYmVKSFk3S1YzbStDWXFSelIyNFFC?=
 =?utf-8?Q?2dZOHOaP8d6+H4wH+Lbur8TGiMzWBcCl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDlPNjRGTEMzRWs4cVNNWU1RaDdZSnE0Rm9PRFR3dWlCSFNLWDErMVYxSkpO?=
 =?utf-8?B?NTFLb0QrMlpNWUQ2L2dMSHJQeC9NOHF3cFVudjF4bjBlYUYxZ2dLaUEvSkR5?=
 =?utf-8?B?MFpTV0phalJmMjM5YS9PQWloZFNHT3BEVUd1b1hZbEowZzVrajF1cVZHVyt4?=
 =?utf-8?B?dEhReEZJYTFtNGlOVlVGUjIrUm9IMXdEeTJib3NXNEJXSWFDSXU3L2QxbGV1?=
 =?utf-8?B?dmhXb1I0bEgrYlM2ditHOGdBa2JJK01scDd4eGVEc2NQS1BnMG1MT1Jxd2Mw?=
 =?utf-8?B?TmV6cjFrOUN3ZjlsV3drTmQrWTN5UHNhWms4c0txZ0d2ZUl5OWdsbjBsYW5Z?=
 =?utf-8?B?RE1ZbjFxOXFId2NnWndpelljdlcwWnc4MkV6RlBkbkozaFV0S0kyVy9JSFRU?=
 =?utf-8?B?TDlyb3VnRDM0VUZWQVFlMDBvK1J6RXlYZG9KRnlaSzJKRU1oNEZnYnpXNjhq?=
 =?utf-8?B?Tk1YWTFCTnE1c3pkMDdLZW11aWVmNWdIRXVGNzhKQ045Q3RrYjIrTDNZZCtJ?=
 =?utf-8?B?VFE1a0FHT0FRZ1BTOWRuVnJrU3RBYlZ2UXp0bkxKUUVtbkZXZFNBWEhld0dL?=
 =?utf-8?B?WkIvWGlPT0ZXMERwbVhzWlp0L2IvOFNUL3MzWEhpVm93UVQwZThEKzI3eEJv?=
 =?utf-8?B?S0NTSEgwTiszWGFhU25pelR6WW01SERvWW5wWmFaL3k0UmpDRTYrYk4vbDNr?=
 =?utf-8?B?b3hCSFlxVVhQM2J5T0U2ZTZVUmdOUHVCZkZGYWlpWWxvS0F4SWlIdkRDNFJZ?=
 =?utf-8?B?eGtjVHBSMkRXY05IeUZ1djhTNXExTDJPQUFRL1B2anhjL0lzelJhRmxNcHR4?=
 =?utf-8?B?YVo5QzlEQTNZVmJtRmFTN1BMUnFLME5ORFNLcDI5dTVObzBCNkxIcjBMTlFR?=
 =?utf-8?B?RnNUV0RFaXhsRUhHRmxwWnRMKzJBeUkwWURTSUpoSmpCcWFkRzBCeHNqc1lZ?=
 =?utf-8?B?NW5jY2RJVFluSVRVZXJIVjQ2Nm03cnBuVjgxVHk5cTNWd0tJZlU4N2VyWERN?=
 =?utf-8?B?dU1IOGc1K1BWY0tGVUtUTzlUSXlPcnBCL3ZlblI1Z2hwYUNoNTFsM2xYMjNC?=
 =?utf-8?B?ZUhURnBVSitkQUFnT3JBaGh6TlcrL0tFdi8yQUtaR0dnSFFOdVRjM3VXTHY4?=
 =?utf-8?B?Zll6ajA4T2N1ZEtPQ0hrdXVOQ1ZFY1A4Q2NYTEwyUmhGRi80cUdheWdwNTlG?=
 =?utf-8?B?alhoU1dUdXpHKytFaEhNeXBPb3hNSzQ5UGxHdnQ2M0NWa09rb2U5OXFsUzc2?=
 =?utf-8?B?azVoZ2hjU0ZuanBEUVhmL0NRZyswMFJuNlJkUlNScDRiVnB4aVJyU1BsOHpu?=
 =?utf-8?B?cmY1L0hoTkovVlUwNHpXTjNHMkdKWEpDaGJ4TTZYYnR5cW5tZENQNWREaXBu?=
 =?utf-8?B?MXVVbWFpRll4dVpXY05ZYzlVbFgzUjRRL2xIQWdpOVY4YWM0RzNDYm03U0N1?=
 =?utf-8?B?ZjcvamNBQzdQeFBydDYvaVB6WTFpR3FZNFFhSWtaZlZPNkFEbi9TU1k3K0Ez?=
 =?utf-8?B?NUN1K05EVlI5YkhQeThXYkVqZHpqajV1NU5yajlTRCs0Tldpc0ZoWHZBSCtZ?=
 =?utf-8?B?aURrL3pmb0dkS2tkWFpJSkpVZjErbjA4TnZiNWp5MXF0Z2djY0NOYUdmRlVR?=
 =?utf-8?B?aDMzbEgzUlFuM3F4MVVDdC9veXczVllxQVhGQVlzRkdHNlZBTTAyNmhQdjVq?=
 =?utf-8?B?UFJ5eEI5WHJqWnRDUVdCS1ZyMWU2U1Vramo2NVg4M0FNUDA0bzNhZ0doS0pQ?=
 =?utf-8?B?ZFF2ZkZtMWQ3cm1uS0JZOHV0bVF4SjAwZHFCSnJPbDEwKzRUanB1NnJpV1dR?=
 =?utf-8?B?Y3lNZVY4VWxUSlk3dG5VK3JuQVdjRHBLelBQUkYyRzBzTkNIRzRPb0VjNUF6?=
 =?utf-8?B?MUVzc1VyTjJ5RXlEbW1hUitwMTM1cTBwQjRGenM1U21UUk4ybkQvSGl5akt5?=
 =?utf-8?B?MXpXVWU1SjVDc1JzbjNreXpuTGJMUjJoaDE5a1p3d1lCMVZCdFNBOWdDNkdP?=
 =?utf-8?B?ZTgwYjBuOGxYV0NtQ1JEYUJ2RW5VaW95YWtjOTEyMTc3eFBEMUNnQTRsMk96?=
 =?utf-8?B?TUdrbWtRUGxlbnhlUzRkRnZqeWpDSmlQaWpuSE5CMGlHaHZnVHJHcXRwMHhs?=
 =?utf-8?B?WDJlRmZuc3RMeXM0a25EeGlLMkpaU2NpTzJsanQrWWhoaWhudFNEZnlYeWtJ?=
 =?utf-8?B?N1RKS1VjdGpVcmFpWGVTbHNCZVVmZlQvcXgzdW5TL2lvN0MwVFpmSEpvU1pN?=
 =?utf-8?B?Ry9aSWNleWFVaEo4dVpVZ3J2RjI3ZUNRa3FCT2dkdlhJQnRqRDh2VkYwejhr?=
 =?utf-8?B?Nk82aHRZKzE4RkhGMUdLak81d0lOUkFiRnhtSFlkK01CZEZheDlRZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2922341c-389e-4610-7533-08de52afcdce
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:26:56.1140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WoC7LP9a5+ePZZ33EreZ+WUdt2TQgwO2aP4OZG9N1K4TD9ALNRFRTxspNahxEYyP9bcmSmGegX4Z3xYait0kUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6072

On Tue, Jan 13, 2026 at 02:18:22PM +0000, Andrew Cooper wrote:
> On 13/01/2026 2:17 pm, Roger Pau Monné wrote:
> > On Tue, Jan 13, 2026 at 01:09:58PM +0100, Alejandro Vallejo wrote:
> >> Debug builds traditionally ship with a 10-bit counter for the TLB
> >> clock. This forces global TLB shootdowns with high frequency, making
> >> debug builds unsuitable for any form of real time testing.
> >>
> >> Remove this quirk, unifying release and debug under a wide counter.
> > I wonder if it makes any sense to provide this as a Kconfig tunable,
> > set to 32bit width for both debug and release builds?
> 
> That was v1, and both Jan and myself said "prefer not".

We already have this fixed to 32-bit width in XenServer patch queue for
both release and debug builds.  Certainly no strong opinion, I never
had the need to tweak this, and anyone that has to will likely be
perfectly fine with adjusting the code.

Thanks, Roger.

