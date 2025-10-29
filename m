Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4096EC1B93A
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 16:14:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152835.1483338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE7sN-0005fY-NW; Wed, 29 Oct 2025 15:14:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152835.1483338; Wed, 29 Oct 2025 15:14:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE7sN-0005dv-Kw; Wed, 29 Oct 2025 15:14:15 +0000
Received: by outflank-mailman (input) for mailman id 1152835;
 Wed, 29 Oct 2025 15:14:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=brwG=5G=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vE7sM-0005dp-JZ
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 15:14:14 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e444936c-b4d9-11f0-980a-7dc792cee155;
 Wed, 29 Oct 2025 16:14:00 +0100 (CET)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 SJ0PR03MB6629.namprd03.prod.outlook.com (2603:10b6:a03:393::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 15:13:55 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 15:13:55 +0000
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
X-Inumbo-ID: e444936c-b4d9-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFCBCyrLKXrqXFbRcIxBAvo0hcmPMFK/OVicwwIJgVQ+JitaHJxSFKX2axV92kn6zLZkIp+pax6FUBylVZcddYMezKdZ71qVPx+xrkeFVXo1n3GjxigDK4IbWK4/Jk3e+1K7Pdh/+KV3XQ5J2VYzGNvWM7MKMrn5Dl0XVkWk4ArIO+wIG+JRjnDg4qcrNSqArA4dx69KZSJ5rmuExHleg9ojYr3oXWiKqalFJ1cLWe19oCMUclrW38knfKjqiMFIlmv/uvdFSoEsVkpBpyhl954ftwwggP7AkukKIeGRrzfymIcdBCHIBno3ED3BIv89CoBnLuTDSFBye74GY7gu8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z36N2mcgqN3bxF5mL+CWYHY7pIrD+GcGYUkwuIHCSDk=;
 b=WZ/eCWmIJmgRmlXkykiUYKxt+pV+l8d4wGWqCTGsaA4upnPKGW2beP1vRgW7rgesc1dzNFQBmx8i3NiokCmT2pnOBnp24l+66fe/wWigxkTvdten63L1nU6QlsBcf/9apI77/e3BDP/fYHtd0I9cKeXuw3W4/gLHRwyRN2F9ooDYyZPcmdwQBQe6309LnJukNzY2FZhrnxTkQui/kgWXbQu9xBKf2OnPp57/sl/JDOziNIjGXkanxY4M33o4ogUcebIka5OukEe2axRHfcqgAP8OGNhPqDR9QX85pMzgEhwfPlYfbU3Eek3rwn+xRr4Jyd1gS1hV0b8jzkz3UyUUnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z36N2mcgqN3bxF5mL+CWYHY7pIrD+GcGYUkwuIHCSDk=;
 b=hnJ7j8gtyedWupVngnQ329yf2CFBWeyTqXvrLznuFNRELYwSxvRIWs7+NnIiVPW4xQ7mRpNtqQeuBLBBWzOREleOafDID9Vosfi5H4CIxwNbFV4IWdiOwo4+0LSSTJtvbw1uBeVZc0R9tguCUnWnYtt1L8tpB6pXAuVFrpQ6yww=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <398385e1-c21a-41a3-a76c-be820ff4341d@citrix.com>
Date: Wed, 29 Oct 2025 15:13:50 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] symbols: avoid emitting "end" symbols for data
 items
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <6fdfd369-6c1e-48a5-8189-4999d566788a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <6fdfd369-6c1e-48a5-8189-4999d566788a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0556.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::6) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|SJ0PR03MB6629:EE_
X-MS-Office365-Filtering-Correlation-Id: 83cb6895-5743-48b4-e6a2-08de16fdc694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0NvNFhTc1Q4R1lwOG9VRmZFQ1JRT1BMbjRSZFMvVTkxWE5KNE5ocU5jR01i?=
 =?utf-8?B?U29IanlHVU5kMS8xbmZWUW1idVNtSE1qQmZ1cEk3dTExUXI5MlZDZ3pKWjZj?=
 =?utf-8?B?UmZyZVU4Zm1ZTk1UeGt3Zm0vanZtYzRmeEttYm95NmlwQkdpOHpqQldHRGJ2?=
 =?utf-8?B?d045cG1vd2QrN2hIVm0xbDk4Q0dTekNIaDZBamFzUG5rL0tGSVRXM05meVJv?=
 =?utf-8?B?aDVIbGlUQjNicUEra3Zqbkc4SEN6VFVnWmVzWXdDYW52eFRYV2JodEo2dzBD?=
 =?utf-8?B?UFYwc094VXFTZ084VmtPME9uM2V6Mm95VWgyU3o1T24yR0h2czd0aTNoanpP?=
 =?utf-8?B?bktNQ1JWWlJaSFZZL01yMHh4SS9CUXVvaXNIdndZMCtJK1VpK1JQY25ycGNN?=
 =?utf-8?B?VjNIeWNjdFBxaHA1REIyN3U0VnVIYVhIbWwwWElMUFlXQTdnT2FMK2FJUHE4?=
 =?utf-8?B?ZU9HaHFrMDZjWnNTY1BJN0ovTUJMTURleU1qYU9xYVFEZ2dwNEVwczJ0Mjhm?=
 =?utf-8?B?T2U0b2hoenZBNllJMWZFUENybklWaFBZS2RpMGgxV2lRN0lmcmJxSEZjT3NI?=
 =?utf-8?B?VjJORnJnWlU5Q0lZbHAvMWpxYkRLZDYyWGcyeEFRM3JMWXRzZnozb2FtczlC?=
 =?utf-8?B?UU1OR2txeGtneXVYazRPLzg3Mk9QRTFXWkg0ekFaanoyVFRzZmpmRXh1emlK?=
 =?utf-8?B?UXNqOXFPMGZmSU1DQjdDcEN4d051UTNxc2lQdndrWXNGZ2tscjloMFBhZ2dO?=
 =?utf-8?B?NVZ0eFdadFQ2SXVSeVkxc09XazRhdkNTaWJrbXJNa2Y4eTVsOU94bWlOQXdU?=
 =?utf-8?B?djhDQlZwc2V2NmdkcXRZNEM3bDNMV1lGZUJBdTRzUUZqWGFqYUJYaUdNcXhK?=
 =?utf-8?B?MkZSRmRkWVJUOXNOeFNXL0RHNmJpVW1zK1g0dFdycEdIUllnTE8xRjBrSG5P?=
 =?utf-8?B?ZlJZZno2MVRDUDR6RjI5b01PeUZZaURwYnRnMWRkU1NnN3NveEd1MU5YYzFR?=
 =?utf-8?B?ZUxyNUJKQVRpYVRLWnQwVmlrNU1ibG9zYW5yUmM5QTBvV25XaldWRTFLU0Ri?=
 =?utf-8?B?UXVwdVd3Vm9UVWw2YVZuUGJpcVhqTTliUzQ1U0t6K28yVDRGL0NqOEVVMlYv?=
 =?utf-8?B?NExleGszei8vSDk4eUkwTHBEamQzWXFwbXF0RTUwdnoxU0FpcUZoWnRaZnkz?=
 =?utf-8?B?ZjdvQncvS08zR1E4b1hVOE9aSllCbE9xN2xTQ3h6akhVV2J1bEVMMGEvUWRC?=
 =?utf-8?B?OEdRTVFMU0hEOWtxOGtJalI1c3FVclhuS1JnRG5EWjFOc3VDc3pjU2I4bWk2?=
 =?utf-8?B?cFMvUmNITnhOamtRM2dmbTRsYnk0SytZS1gxMkY1dTBWeHpnWGdHem5jOUtJ?=
 =?utf-8?B?U2cxVHRjM3dDOE5kVVZzNkRjcTZtNDMyQUsvYUxuQ2l1MDV2Q3EreU9NVnFy?=
 =?utf-8?B?RTFkY2lyZ3MwVFpJKy9QRitvcTQvTWZyenIyVUJkSllpRkRTendYOHpSUENx?=
 =?utf-8?B?cVVoTXVOWWpvNldCTVd5ZzBCWXBOdUNqWjBsUXJTakF0Y2FMbWlYTTV6YnNO?=
 =?utf-8?B?Vm9VQWt6SWx0b2ozWGltY1NjS3dVcGlUMCtMempyRGM0ZENubkNDUjRxazJi?=
 =?utf-8?B?YnhxSWJ1SkZiTFRHNDdQeFhxUG1GUDZGcEhieFIrK2JGK2hJcVl2K1ZUbit3?=
 =?utf-8?B?MFIzNWZydGtFaHlZQnVoTzkwMXlxbEpvOTZleTl6MVFrN3FyQm1NcTYvb2Fu?=
 =?utf-8?B?VUtQY3g2OEZLRzRFUEYvNXRLcDMydWZVZlNWdUI2VXlpaW5qWDVFb1NkU1BM?=
 =?utf-8?B?bWs4Ni9YYWJJdXFnVllGdml0d3RSY3UxRi90RGdCVUNmUTVVaU9vZmJBZ0pB?=
 =?utf-8?B?YWR4eEhCcTl1OXlyUXRkcjVkSXRnNEszN2drMjYxN0hxZWF4WGRxUDZLUnRw?=
 =?utf-8?Q?bmC9kh75BU+ixvqZO/3Enm8LZAKLflnX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0pmTDBuOU1KU2xmRlQvMHFtdm42TlZoSEkwRGptdkM5T3VFTHFCRTZ4SmRy?=
 =?utf-8?B?OFRIcmd2SVROM05RUnZSSXFTcnVYRklDV21uYXNwY3Iyd2hiQ2hmUHJjNm1k?=
 =?utf-8?B?M2FSVlFsOFl0OFhMbFBZb204RlFsUlgyVGpZd0N6MHhEZmJYeURiV0ZTdGg4?=
 =?utf-8?B?YzJwOWFuWG83eUgrbW9oM1Q5akxwM2s2UkJNVHplLzlxVXpPM2E1V2cvN1du?=
 =?utf-8?B?L1pCbWNJL1pROWJYekxEYnR5L2w0S01GQkk5N3dlWWZlb2ZOS2hqbWVmZmRZ?=
 =?utf-8?B?dFJYNWsrd0xBd0IrZ0tzeGU2RDc2SkJ0dDB6RVdVOUphckh4NWVVOVo4eWhy?=
 =?utf-8?B?YkxjYjN4eXF6ZUZqUTBtZHIyUnhjNzVvSXdkUDA0RzVWNVQ3dTAxenJxS3Jh?=
 =?utf-8?B?bG01RWhEOVV1WklUU2N4TVY5U0F4a0ZmbUw1SzdJYjBHSzRHVmJMVDFQc2d5?=
 =?utf-8?B?cG1vTVFCUWJ6YWxBS0hweER4WWZqUFBJdXZyYXNrR1BmV1d4blRRUVIxWENV?=
 =?utf-8?B?bWRvVTJQdHNvM1dKdFdZRXhzNi91UUI2ZVhZcVQ2c0dubUdDMUxoakJqUWdU?=
 =?utf-8?B?M2JQam9QRmkrTXFrYWNpVERXNnIza0k2UE9xWUpLMDFKUE9WN1UrcVlIOHFQ?=
 =?utf-8?B?dmNiR2dUbTJzOUhWd0FJV2RFWXFMTE1sYkh0RjYwNFdzK0wveUVLRDBwMTNT?=
 =?utf-8?B?eFlzb1ZFQUE0UmNzVnVBSS9LbnZmRTAyTStwVnNlMlRISm5GMHVHamZLQTdp?=
 =?utf-8?B?QUpDY2ZhVk5Lc1pnemdiRnJzQXV1Vi9aWktzaU1HcENmSWZxaFc3KzZ1R0FU?=
 =?utf-8?B?ZnZ1MFYwK2FIc3ZpUjVrdllPdnpzUnJyNVRXRmlYbFNtWkNjdS9vS0d0S2xW?=
 =?utf-8?B?NWhVTXplV3RuaWpad1JZb25LWWdNdnVmUlZCMm1rbGh0NmxybUVuY21XRGJT?=
 =?utf-8?B?MGxrS0xFUWJvKzhOMTBqQ1REdmNFRmkyYlRibkJXcTVlQmhyM1FqUkdWaUtK?=
 =?utf-8?B?YXR5elFaa0dROXdrcE0ybithbmRhaWNmMFk2dzdGTzZQMnhlR1hGbjRoUEN0?=
 =?utf-8?B?Ly93dnVTaThFNFpvdUhXWVpoUGl6ZUVVQW9RZGthaDAyOVhvWjdyZkJBL205?=
 =?utf-8?B?cmRqQVZUSE52TW5BSk1JaXFPUmwzMjFJejlHV0lYNDlrRG5GSDFGOXdDT2xD?=
 =?utf-8?B?R3loVjBCOGlscDI5dWM3bkNhWnpNTi9qUFNOYjd4bStETXBKQy85R1BOU2lP?=
 =?utf-8?B?WjUrczFsZ25KN3NGblFJcjBBbWR5SFM0QVhweUtGU0RXZW1hYkQ0RUJMcTFm?=
 =?utf-8?B?bW1PMTNFNDRSUXU2cDRURVVuUDNLZ2NRVW1PU0pqRTFwS3hjOFhJRmxES1Vq?=
 =?utf-8?B?RFduTERuZjVXRVhGN01yMTE3bDY4Z3AwS1JrUkRrQUpKdzIrY3ZJRjA4TVZO?=
 =?utf-8?B?ZHFTV0RXQVovaEYvTlkxMnRGUkE1Y1RTWlZtVk1vS0R2eDNuM1BBZnA4T2Jw?=
 =?utf-8?B?cUlRTVN1ZWd5cVdDd254YlNjNUM2S0s2RnNmVTE2ZWc4WUpGQ1lydEdPWnJH?=
 =?utf-8?B?aWpJUkpnWmk5WjRmUWQ1N3p4UVpMTmlUOXhjSStVMlZ5ZVQ5VGtqRDlxV05H?=
 =?utf-8?B?cmtIZ05TRDROR1g3RVFnRVhqY05LWWhVMXNJb0tnVUZYTldkRHg5RnNuUXFy?=
 =?utf-8?B?aVpFdEFUbExsemdnOGp3NG53RnFYSDFTKzlHWVdkcTFuTE1YMzJEWFYvT2xZ?=
 =?utf-8?B?ZlNraVVIcTBPQkw0M2g1Tm5BTnk4MEl3bzhLMDVkMEtpbHY0OGdyRHVYMW0w?=
 =?utf-8?B?L0Fwdlc5Y00wZzNPR0RoZ01CTEZ5VlVSUG5YTmIzS3FsTTBORlNCbnp0MGtV?=
 =?utf-8?B?dmpwMHd4S29KMlJGTm1GRnp5aVpLOS9wTTY3VlVVcmFXK01aNVNYdTNGMkNv?=
 =?utf-8?B?Y2syOS80b0lVM2pXcVlaeDdyTlZsRTBVTDM0MXA4eDdYZm9uQ3FBeVlpZVRu?=
 =?utf-8?B?eWNXWkhYMUxlYzNEaHgyZ0w5SFJMVStWNVF1SUVJMUZ6SUlQanRObjc1U1Az?=
 =?utf-8?B?RHVseGFEbjNCYU9WdkJhME5iWkoyMGFEQmtyTVRPWkFmZlFYdjExckJUc0dZ?=
 =?utf-8?B?ek1yMElrMjEzY2JRdG03djRMc25YWXFLalQrbm9QQUhZUitDN0FMUlR0eUZr?=
 =?utf-8?B?RFE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83cb6895-5743-48b4-e6a2-08de16fdc694
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 15:13:55.3028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9MuxdMvZ64T+UhlzK5IfE6LUTRtbwu/9t405JaNMnVoylvJn7pffFk+nPPL684RNPGjJwmMcK2BjJvv4Mr8lz+lLTXN4VzzBfs/5jrFh8Vg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6629

On 29/10/2025 1:34 pm, Jan Beulich wrote:
> symbols-dummy.c and the generated .xen-syms.?.S may place their symbols in
> different sections: Like for all C files, -fdata-sections may be in effect
> there. As a result, besides moving these symbols may then also have
> different amounts of "end" symbols inserted between them.

Sorry, I can't parse this sentence.  Do you mean "these symbols, there
may also be" ?

>  While the
> movement is likely not problematic, the change in table size is - linking
> passes 2 and 3 want no address (and hence no size) changes between them.
>
> As, at least right now, the "end" symbols are useful only for code, limit
> their emission accordingly. When data symbols are emitted (i.e. when
> LIVEPATCH=y), this obviously also has a positive effect on overall table
> size (I'm seeing almost 600 entries going away in the build I'm looking
> at).

Xen-crashdump-analyser needs end in System.map, and I expect so does
`crash`.

As this patch only adjusts the embedded symbol table, I think that's all
fine?

~Andrew

