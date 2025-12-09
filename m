Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00924CB0C05
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 18:39:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182093.1505027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT1fJ-0002sn-CY; Tue, 09 Dec 2025 17:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182093.1505027; Tue, 09 Dec 2025 17:38:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT1fJ-0002q9-9H; Tue, 09 Dec 2025 17:38:21 +0000
Received: by outflank-mailman (input) for mailman id 1182093;
 Tue, 09 Dec 2025 17:38:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nu2q=6P=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vT1fI-0002q2-4K
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 17:38:20 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d835452a-d525-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 18:38:17 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB5779.namprd03.prod.outlook.com (2603:10b6:303:97::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 17:38:13 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 17:38:13 +0000
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
X-Inumbo-ID: d835452a-d525-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k1JchBy4oI/ONZ6lpzhFqh1vOJuJL8rN4QonRuFq6SQdgm81i3dwN38gURpqwa4SbsuOHP9Nhrc6TjyVIk/d2Unn0kGPfMZm9HYKKuYr2YwK589X8wo2+4XL4Vd5ck0z5qb3u6hE7BCERa/TX8YvLlg3olS0nZvygtKRNEJEzmak9kQeyfGz7pzPAv92mnC6lGaGj3EUgTmuJ2TgcHkx2E55Dc8RsQADeuswGAQfYfuYR5fkFHyidow+bwQNow0FJ1oh4JiOUSuMNEEmggMqPz8TreYKLEwy3fXnQONfNydlp1viexUAzfllWXrChmrUWyBbsSxhxaXkFVfbWC7pSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkh1pdtp1x4e61u7RWbb61F2fvGqnoEAivM7WAwuyT8=;
 b=G9aRRBHkRe+Gb9f875nAgo8buwpIZ0tDFFLJ6q+OiO7SutFWk+9gRRnfsPp4odIYwbSEnsgm9iPIP6zuZceNQdGGh1aYwQLtYzYbw0zKKqoq1dROoXgmrMv2JdLq4kwxxIH64lDkADdFdCNDT89XmBL1CxkKt4L5UhqBlzIDtUqhhwx1ccf7DqFN7XMZObM+bh2HrXkqgCb8Ov6oQNLlVwWYgC16Pr9Eku7ItUOeqG/s9+49MdYVLQkSZmuyTOzPr/GDvoicOqNcUNY/YgWT3KWJDeLvDJEot2ejjecee3xT2DUPniOPBnIlHe6y0RVUA05tNdMOc7Bgj41mfIDuUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkh1pdtp1x4e61u7RWbb61F2fvGqnoEAivM7WAwuyT8=;
 b=OgmIxcj72MT7J/1Hx/Of84rTlCfG7eNuFX5AJ6c5UtywE5Pp2dfVQhp54W9g7GRxApk1okAc1eSVf98S8W2K2gl4CxsWnEgT+FjVL0R5CWdydjFEZLOsM/crzjW2eFVnUIpajp0azPHMh3vqZ7r5aR+fYBGvIGdfeVxtLUb4CLY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e46f9569-fd41-4724-bcd2-71b803ac1eb0@citrix.com>
Date: Tue, 9 Dec 2025 17:38:10 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/pv: Unhide writes to d->arch.hv_compat_vstart
To: Jan Beulich <jbeulich@suse.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <20251209155719.2098440-1-andrew.cooper3@citrix.com>
 <147c917d-5ec4-4134-b531-3483d445283a@epam.com>
 <e15dd08a-cdf0-4a3c-ac98-d0652eaebd90@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <e15dd08a-cdf0-4a3c-ac98-d0652eaebd90@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0485.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: 37947675-ed58-4c2a-7ded-08de3749ba8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UjdkN08xdUtaVEJlQlIzcjF4ZzhuVThBbnRGWFdvZENNajdxa3NaaGlWYlBI?=
 =?utf-8?B?UmtyYzdwZWo1clNzdC9RQlgyT0I3M0NqSmZjMWVYdHRXZ1h3OHBYOFA2cjFB?=
 =?utf-8?B?YUtjeU5razBIeXZtdCt3NmZlQ0tkWkhYU2Y2dGFxMzhzS0FNdWRmZUhWOENN?=
 =?utf-8?B?V1N4WTIwMldSOS8wNW4zTHZRT0FQNVhUNG9jcitsa1RveXZhdGtjNi9qcXVu?=
 =?utf-8?B?ZURnK2I1d2xkT0ZQZmlWY3kxUnR2dDNUSlREZUZyd3hXRWI0aWtmeElRQ1RZ?=
 =?utf-8?B?U0xnbEVwSllGSzZEYVhZR0laSURlSVp4N21qM0NSbUdGTWIyYi9odmNjRXI3?=
 =?utf-8?B?NUE3Y1JWcXhCeVpGRnBDQllWMFpoSGt0a0lMK0ZoeDEwSXNBL3p6c0psaERa?=
 =?utf-8?B?RlhyR0dpYWdMeHRDUTFDV0pPaEhtWnBOekpRZFJWQkFpZkxOYzdMWlBXNDFO?=
 =?utf-8?B?by8xd2h0ZW41cEZ4RFByR204N09SZVJYZTNndFpXWUk4NnFaYW9MYVVOalg3?=
 =?utf-8?B?ZFJEeDVrcDBDNHljcHN3VUNidDdRRzFVNi9vUXpzY01WNUEyaCtrMlBuY1k3?=
 =?utf-8?B?L0lFaTVJZHVINVJBYTNqS0FmcURzMWdDbzdSa2tMT2Y0TnVUc2dXNmwvMzhz?=
 =?utf-8?B?amE5S0dGY21IcHVUSjFBN1FxM3A1WDVoQS9Ka0E1N2MvbElPQkE2T0JqQitX?=
 =?utf-8?B?OHlOVDFHNmZSUklEQU5EZEQzenV2WS9iWGxUUTNJdkY5SE1vcXJsV2hwOStn?=
 =?utf-8?B?a2xmcG5wMWxtQ3dNSlRVYVlBQnhDZE5WcHJ6bjJXeHpWeHBseEl4ZGl6RWJX?=
 =?utf-8?B?SEhXaEh1dTE3bGY5TGtocGhJQ0VqRmNnUXJZNm5ZcHRqZ256aUVrTkhiZHJq?=
 =?utf-8?B?UU5PaDd0RERoUWZUcXdIWVFnVFpkVlFRMHNBSWd6bTlOSWZYMmRGUzJraUpE?=
 =?utf-8?B?V09NV1ZsM24vSjhEK0J5VzM0OXkvRWJ2UnRidjN5K2xFamFQSHYxYzMvZkJz?=
 =?utf-8?B?M2tyYU1zK0FJK3JScm1tN2FLT3RFSHVRRGJzSXZwb1NrUHR1Rk1EVDY5cmZh?=
 =?utf-8?B?ak9aRHpMbVdLSlBzcHViMENRdVFJODlzRTVXWUdpWnNveGFtaDJOTVlyNCtF?=
 =?utf-8?B?b1JyeUR3bmExdzhFTVZKM2FYTSs0VDMvbHhic3NuNDdKSjU2dUFtblNFUXIr?=
 =?utf-8?B?Mk1FSUJuK0dQQ3hJbmRJbVV1ZXRlUG9oNGJFU2hYUVlMOUgrbjRad2RvNmc3?=
 =?utf-8?B?K01LblVaYmpxSnV2d2pzOWNHQmI3OUI1cU5UYXErZWdPTy9Ebkw0anF3Q3hj?=
 =?utf-8?B?TEhsdko0VXFURmxFU1VrSGJzbjMrQWZkVVV6WHd2TWQ3NmphQWRucVU0cGpx?=
 =?utf-8?B?ZVUxZ091S2d0YTBUZVJuNFBOV2lCNEF1YjJaK2o2YTdiMDdMbEtpZjdxemJE?=
 =?utf-8?B?cmY0a2VvOVVSb1pSWnpJN0ZSYUIvTDZHNVEyNitTY25OUk5oU0c0aFNMK25p?=
 =?utf-8?B?K1lEbHY5VXU5NDNaT3djU2hFSUxOTVI4VnV2RWx1UllLeDhUckYwN0YwcHEz?=
 =?utf-8?B?TXoxT1JteXNCT3NRbVB3SWxTR3ZwVFlIREs2bHJQa1gyWE8velEzQ0pnNU1v?=
 =?utf-8?B?Nko5WEMxVVA5UmFmWGhyYU9KeXZMY1hvUFdENXlTU3l2UC93ZENnVXVpN1VO?=
 =?utf-8?B?RU8vTjZxcHlrUEp3MjJUOG55TzNseGhJM3J6T3U4WjBTaElYQmJ6bjJNQUJp?=
 =?utf-8?B?UEk0dytOY1E0WW9JZG5JSlZVcnFwTWwrcVI5Ykx1ZWo1SnFCQm9XT3NMRkQr?=
 =?utf-8?B?V3NGZTdzZDk3TjZSd3ZNK0lLaTg4OEZTSmJHWHZwN3g0eWZ3amtONGpGTnhI?=
 =?utf-8?B?cnNSOGN6OGR0NmFjcmViTmtmNVhpZlpMSktibExia0c0eDlWNkdBZUtNWHJI?=
 =?utf-8?Q?u9XeBsYX3diHy+b19CJ7VUhdzwQ7gRie?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzllM3l4Mk1qdHd2QzdHb3ZvVnQ0cHVndUt4MlZCSUs1OVFYUlRweE1peXBw?=
 =?utf-8?B?bzNkZDNLNFlTb210Nkk2dGpKWXo4MTlIQUcxbkNRY2FYQlVuMGlGUERrRndY?=
 =?utf-8?B?VUZOV1UyMjl5ZEhrMmptUitUU2dIOVkwUjRnb2owTjlLUkxjckpqeXpobVg3?=
 =?utf-8?B?dE9zS0lNSnc0dFJTRFhZMXBac0p6MStHcGRhN3dzTTRXbFBkZk82RlZSWUVh?=
 =?utf-8?B?YXd5K0VuWUJzcXlmL09UQ3A4N0N4dmEvY1ZpNjlmb2o1cGdLdytZMGhKYVA0?=
 =?utf-8?B?WjhxK1dQdWJDNHQrQW9yc1cydFBGWGFaZ2xraVBSQXlOZDVtRmZtbEJRUHM2?=
 =?utf-8?B?S3dJSU0xSDlkTTduQy9WWjRwNDBQNU5pbWpDQkU5M0ZkbE9WUWxXK3pWYXNQ?=
 =?utf-8?B?TmxwSjQ5NUxPdXVaaWJWMkJXbXBvUTJoalA5eksvczEySDgrREw5WGk4K0Q2?=
 =?utf-8?B?cE8rZDNoRm1KSW5PN21USFZ2MXVMb203cnUyK2xlMldTcnBJTWtWelVxd1dF?=
 =?utf-8?B?bVYrMUJPb2p4OTJRQS9GM1hKNGFqRUlzbGgrWC83V3dTQ2laeThLZXlUOEQx?=
 =?utf-8?B?dWJLL1AvVm5wYTFTUGpPcEhjSExiQ1hoM1lVMFVkRGZaRTN6bllZdEtSZVFF?=
 =?utf-8?B?aTZRWW9JRFlkcnRDZkdnaDlQNXpGdEJNT2JKL2R3ZnJWdnRzRmNlSW43UUw2?=
 =?utf-8?B?OFBGQ0lzbDNIY0krYmJ5RGpQRWNtNmZKLzNleVFaeDZIa0RHYTVDTmVicnBT?=
 =?utf-8?B?azVXajBnQkZ0TnN0T1ErMitWWTZ1VHhMS0h3MUNkeDl5ZFF6WXFMSS83UkUv?=
 =?utf-8?B?RVpRK2Y2VXhYWlZIdjNnR3FRNmY5WTZBbGRRcU15S3VIaTdTYXdJaDhwZGZu?=
 =?utf-8?B?TnVwZFREOE9VbXptV01tbWo1UVV4UHljL3BGWWY1dU1WSXBZMDZQWkNUQmRQ?=
 =?utf-8?B?MTc5LzlkY29LcWh3UldCZ2VBYkpWQzhCYjQ3RjlmZk4xQTNRcndPWFNJMWpY?=
 =?utf-8?B?SlBCQVhUelRuZml5SFJ3TlFjakM5Z3Q2MjZqczUzd051LzZhaWpaUWltOTE4?=
 =?utf-8?B?OE5xLytHWUpnNFBSVzkwMEt0bXdIYTlJdkRXWGU0UkZnMDJFaTI4VlZOU09a?=
 =?utf-8?B?RU1ZNnpMMU1GaVdJRnQ1UEtVZ1VpZlR4WlBBS1lWN0JkMFQ1a2VXanpXVDBn?=
 =?utf-8?B?emVOOUNWUEk4Y1R0SEVPQ1BsZVlvWWErYzJoM1c1MnRyMkJCQXFIMVNtRXp4?=
 =?utf-8?B?cXM4T3FldGJKWEp2WUZCZCtNYkVDZkZWKzlIeDJ2akFPNGZPeE1kRnRaSFRa?=
 =?utf-8?B?d0wzUzNkR3hic0MyM2VmcUNXcC9JZE9ncEJSeWxYdlVnSFdTOTJNeHgzTjda?=
 =?utf-8?B?SEhYVzRvWXE3ZENvc2F6YnkzS1hrWFN3eXdEM0tmYWZobGdrZEhoSEhTZGN4?=
 =?utf-8?B?RCtYTmI1bUpQTytSNFcwbjNtSHFjRmpWRWQ3OXE2dUVobWpyS1I4ZEI1ZmtT?=
 =?utf-8?B?WXIvNitTUHIyKy92bEp6eE1oa1dsaDdhYkNTM1NaQTJXZmw4bS9CdDhMb3lh?=
 =?utf-8?B?ekhNOUIzWDRwTTJCaUhQQ2pjZ1VhdWVQT0xndm9BS3JvNlJKZXdRNUJvVCta?=
 =?utf-8?B?Y2FNMGVxelg1Z3QySmFWTE1KMjNiZmU3eStNeUUyV3k1UmFkcUwxOWNXRzRU?=
 =?utf-8?B?bkZuYzFvczB6Z2I3TEIyK0pXWTZOemhZU0QwMFdxK1lab0RlR0UxckZuWjhK?=
 =?utf-8?B?OE1xTmxhWUlxTXNUQTRGeHRaS3VUbkNXa0N3d0N2N1kreWpiWkVXTlpubTFq?=
 =?utf-8?B?bHMrUEZQQVltTWJ2YVRwQWdDblJMekdYM0ZSSnlxcU9RL0pYOFNaY3lYSS9U?=
 =?utf-8?B?cFdYTE0wTGpWTWZzL0g1bkhNNWJBSHAwOHZXT1VEUy9wTzYxaVpqeWp6bWtu?=
 =?utf-8?B?WkVxTVR3UDlXMVhiTVlDM1oxV21HSGZ0WHRRSjZKQnFBT1BZSFAyOS81V2Qw?=
 =?utf-8?B?UW1nQ3RaVlNFSkNta3RPY2NCd2FldUd0N1N0UVJiK3BzR1VCdG9CVzJEbHho?=
 =?utf-8?B?WUlOTXFpQ0RsZEJDWUsvc05sb2tIU0UyblppNDVCUzJWRnFvVXBXZWRJNGho?=
 =?utf-8?B?YS91WjMzS1Z4K24xR1JPNWJKYVNvTHRkUEtISlE4b1hwTTR2Q29vOHRqcFBM?=
 =?utf-8?B?VGc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37947675-ed58-4c2a-7ded-08de3749ba8a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 17:38:13.6428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EeoTybRKesGioqP4xQob0Jq2MmUkCsDGx1m8jiCTqFz7IOukSeX8abbeFSb7QJjbxMFA+uikaxmmG3xPdWlrPpkFl1x5+bvapOK/bwYtkWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5779

On 09/12/2025 4:42 pm, Jan Beulich wrote:
> On 09.12.2025 17:06, Grygorii Strashko wrote:
>> On 09.12.25 17:57, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/domain.c
>>> +++ b/xen/arch/x86/domain.c
>>> @@ -891,7 +891,7 @@ int arch_domain_create(struct domain *d,
>>>       d->arch.emulation_flags = emflags;
>>>   
>>>   #ifdef CONFIG_PV32
>>> -    HYPERVISOR_COMPAT_VIRT_START(d) =
>>> +    d->arch.hv_compat_vstart =
>>>           is_pv_domain(d) ? __HYPERVISOR_COMPAT_VIRT_START : ~0u;
>>>   #endif
>> Any chances it can be moved in pv_domain_initialise()?
> Probably, but one thing at a time? The field itself would also want to move
> from struct arch_domain to struct pv_domain, I think.

Agreed to one thing at a time.

The value itself is a total mess.  Storage exists based on CONFIG_PV32,
with 0 yielded in !PV32 builds.

Yet, in CONFIG_PV32 builds, it has the value 0xF5800000 for PV domains,
and 0xFFFFFFFF for HVM domains. 

This is nonsense, causing e.g. COMPAT_L2_PAGETABLE_FIRST_XEN_SLOT() to
return answers at opposite ends of the pagetable for non-PV32 VMs
depending on CONFIG_PV32.  I think this all works because the logic is
behind suitable is_pv32_$FOO() checks, but it's far from clear.

It is only a PV32 dom0 which can have this set to anything besides
0xF5800000, so the "correct" thing to do would be to leave it 0 in
domain create, and set it to 0xF5800000 in switch_compat(), along with
the custom setup in dom0_construct().

But, lets get the d->arch.physaddr_bitsize adjustments sorted first
before conflicting those with this change.

~Andrew

