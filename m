Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3D5C82708
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 21:45:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171525.1496542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNdPy-00028C-44; Mon, 24 Nov 2025 20:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171525.1496542; Mon, 24 Nov 2025 20:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNdPy-00026Q-0O; Mon, 24 Nov 2025 20:44:14 +0000
Received: by outflank-mailman (input) for mailman id 1171525;
 Mon, 24 Nov 2025 20:44:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h9jE=6A=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vNdPw-00026K-AU
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 20:44:12 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52f632da-c976-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 21:44:10 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BL1PR03MB6053.namprd03.prod.outlook.com (2603:10b6:208:309::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 20:44:05 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 20:44:05 +0000
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
X-Inumbo-ID: 52f632da-c976-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ffF8gBg/5EbVxIEC+AoLrzYNgZTuAhVEpGnY0zdoZIkz+VUubJZIWVBpcdsYtdsgyfgvN9W+wqhk2YyTWK/LYKeZQybrAvw/Vyj+6LDzOWM96UyEyZDpbKTG9EzfN1eU1ayRy9vFOg3N/+SaE46r3lCoO0FJyVnI+nhqeBt1OIcTpgmqwqmQNhIjWPtbvMTxSWeIrc7Xu4Yw8GjdaeG/ZiZg9GMyjL+ShsAg9v768n5PdIU9On41W9n+Ouv44li0JhWjMEZkiCiQajKPNHIayh4EGsFmPfFwk5FepsyMYdfLAkuyZaYjqHjLRQ7DGqBmldKurCvLDuAyEOgkLvhejQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzcoVwgnZHVhjRuw2SgDzrJGa5Oy6E6rYAMtF9EwL8g=;
 b=zPmePsKvwVCkh2tDDwjeomkUatXzaSB52SmyUuxXnZV49MGZ4DB2hNUrtSgSXp/oUSS+RsnurIXaNR/Ve8Xmqo4B12uJK7cuNBlcBJL0sf/CaLLhOeuObel7aEtTMasKBIgVBDZDaYOVfTkd2zM6YFjmDU2yPFL2dhmQNTImjCGlPCqoqU/gyWHEB9WXlRAsJkXIZu5TFyStcWvGeOu1Ym4dt6sv2t2ZF3RrQ4xgwGfxJi5uOnW9BfIOK42zsKx7tdUApuXXHP5Nbnm8M1jOtzj8Yuu4hdgXGxq4fz/KmgJMDpgqVI3txk/bEcvfww5nnadgYemEYjFhSxxZEZGifg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzcoVwgnZHVhjRuw2SgDzrJGa5Oy6E6rYAMtF9EwL8g=;
 b=sEknRW9bs8XK+uKUcaNa0UMyieV7Qvm3pLu08Xdje+c+ANeGQhPzlnh6waO6aa00cgVHHeb8W3LVCCpDVQ9tWN7EHXi+ix9divVONBQ92Hcy6dU87L1MbAj+G6ir4XjpNA0mzNnsSTqXA7Dt/xGo8+gP219nj37/9WauItNYN6c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2a881cec-879b-478f-b067-06e1868b2770@citrix.com>
Date: Mon, 24 Nov 2025 20:44:02 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Remove x86 prefixed names from cpuinfo for intel.c
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, roger.pau@citrix.com
References: <20251124111942.1325635-1-kevin.lampis@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251124111942.1325635-1-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0312.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BL1PR03MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: 5737e0d1-9166-4a29-fb28-08de2b9a354a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TkVzSTZVRTFuMklEenJxWmcyQm9YakNwTXZ1NkdvbDBVUUJRU1k1SmdKaVYv?=
 =?utf-8?B?dW9KTHdMdTBRc0xRZXhleTlteFNCUHhPZisrNTQzMG5yY2oyeXIzMENnanFP?=
 =?utf-8?B?cjVnZmFqblo1VmhlbVNHcHRsbU5KLzhpd1ltNEY2L1RjZUw5UVlXbGVKZnow?=
 =?utf-8?B?U1BIK3RRVjBzZkdCNVBwbzZibVVKd3RpM1F4WFFxMU0waCtlWnRtVlpSQW1a?=
 =?utf-8?B?QmJ5ZnRkOHFmd0hERnJoSDhEZi9yNUdpbFZQaHVzU3lEUEpZTVNCOHhybmNo?=
 =?utf-8?B?Q3JrVlptMXdjKytTOWw2RXpnYXY4dkY1UFlXSVloTWljRGlnWjk4ZFVDTmZY?=
 =?utf-8?B?dzdneTdQUWR1V21wb0lHYU9UYTQzUlhTR1NBcUpJTG1teVhOS2hDQ1FqNVdG?=
 =?utf-8?B?UHNHVDV5VkYxRTFRQzI0Z20zUkpiTlI2WTVyTEs4OHpGSFIwNjRCNldzRENv?=
 =?utf-8?B?Z3hTSEc3U0NXazIrbytuZTQ0djFNZHU5ei9CMkNuanUyamlzV1dSS3FZNDg2?=
 =?utf-8?B?Rzcrb3FCTzlrcWE5NGxzeGdYVnpXNW1MQUlNeHpFQXRsTFh2MnNoVHkyWGhV?=
 =?utf-8?B?RVRjZFgxMUQ1YlcwcjJuc1RpMXZqdko2bEhtOVJZUkY1SnJna25yb1RSQ201?=
 =?utf-8?B?cmxUMER1V2RZZEt6ekhGTzJTdVFBTkNKRVUzTG9ZOGRFTEplaHR6TC82RUZ1?=
 =?utf-8?B?aVJjTnpxUVZ2WkpvcWRlVlhWMGlLeDJ3Rjk2YVBYRCtKRUZ3eTZMTkZMWkdm?=
 =?utf-8?B?SHA0MDc0Ris1QkF0OVBMMUE5aVp3dDBUeVN1UEpxbmgzQnFaUHdiMmZMYWJ5?=
 =?utf-8?B?ZVllZlUyUEltelRqWnBzdGNZbThxSlpBMlZlUzJQQzFHc3FyT2NQQ0szWFc4?=
 =?utf-8?B?VHAxRzFmZ1FydU1iSU5SYnM3ajZmZ0dGbU85RDVraHNzRFQwNnE4eVU1bXJJ?=
 =?utf-8?B?TFl0d0kyaWk0SWFsUlpFRW5iUnovQW5oQjRndnVYb1RnNEE0Y2dTNVZJQzNK?=
 =?utf-8?B?SDFaVVlFOVY2ZmMwRXp1RTRUYThMOHBFaEl1WWhXK1RIWGVITk9Jdnc5NEx4?=
 =?utf-8?B?T1YxWm81Sko4T3F3MDdmK1REQXNPODRBNTRQeGxWMW9vcjRBOEpnYXQwQWtG?=
 =?utf-8?B?NU9uTUUzNzE2Vm8zakpQYjlPeU5kMVB6Y1A2bzdHRDZMTEFjcThwS1ZwakZF?=
 =?utf-8?B?N2FuNkNoMGZpV1RSOHR2Z1hRTlVVOWNEV3BsbVVPMGdIalBmR2YvSzFxNjFk?=
 =?utf-8?B?Qms1d2xsd1krQ0FTNFErTklPR2FqaWs4Um9Kb0d3ZGNKNnVHM0s3SFY3MUVZ?=
 =?utf-8?B?YnlhenFSQ3Y0V0g2ZkVodVVRSlN1QlowTGJsT093UGVLcmtDSjJqems3ODFr?=
 =?utf-8?B?VEpmdVlKbU9Zb2Z3NTlMTzB4OE4vQmZFd1lRdWc3RkJENjBnOXU0NXh3V2VW?=
 =?utf-8?B?Wm5xWmp0ZzcxOU5wQmkvejUvUmIxa3M2bk1SdG9PRldMWDBDMS9aYm95VHRV?=
 =?utf-8?B?TDgvTnQ0dmxHaVhVZ2JyMndxeEtUYjViUkw3RVhTRWxEdmlqZ2VSUHI5QWNm?=
 =?utf-8?B?WHJuMU1kam1PN1A0NlozYjF2WlJ2QUJKUTFqZ0V0WG5HUXV1bGMzUDZPTXlx?=
 =?utf-8?B?amU1YTVXU1VVdmdtRE9xbzhhU2FuMkJIN3ZRVXRxbGF6V0JxVDRSbjNjZGox?=
 =?utf-8?B?UVNoUXJhUjlzTDBWa21GcFJrWXJ5SUNYOUhJd2g4bUJYRFRmWjhYNjkyc29S?=
 =?utf-8?B?aVhzNzJlN2tZcVNCYUViaEd4c055bVFqNGtCNWpmcGloNExYQkRlSDdCZVlt?=
 =?utf-8?B?YzVZK3RuOVh1QUptQjhEM1hpdldYMzVaNXdjSmd3SjlUZ1dEMFZBcGNwV3Bs?=
 =?utf-8?B?WVM0M1dlb1RiQ1lIWmh3alZrbkVRbUM4QTdva01leWFCTE5yVitTSEJjOVQ5?=
 =?utf-8?Q?NNtwNHNhgJf+OzZkb+E33XapU0QSf7iH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnlrUUIzZUlCSzV6ZU1QZnY4M29LM1RSWVVnYXR5MlRlUWhJd0Z3VHR6WmpG?=
 =?utf-8?B?YzVsOENPazFWYWhOa1NwcG1jQS9pa1hRaFlUampPNWp3WmJ0YXV3b0I2TlBt?=
 =?utf-8?B?clp4WERtbk8zOXo1Si91cmZnZU14cnozNy9VYTNpWTZXcDY3SGdjd0MvRXd4?=
 =?utf-8?B?amRwOTZ0SUNaNFZBRi9GSUh5OEN3djdJaThOcU85SnJWMjAwcUgzZTNEbW8w?=
 =?utf-8?B?STExNndkOG80TTNzNGJmZUhMVTUvb2RNQTY4YXJDOGtqMGprWFh5MHBmTGFz?=
 =?utf-8?B?aGl6U2R4cXlSQVd6Vzd5T0dJVGpSazhCc09pNnRjaUJMSXU4MThzMEFLNmor?=
 =?utf-8?B?R1ZmcnZZcHQ0R0plbk9vMTd1YUZIMGR3Szl0OXV0bUtsZVZZYU9SblNHdFJx?=
 =?utf-8?B?UUh4R0RjTXV2SGltUGYwMnNWejB2UENmRU1Fb2EzU2N3MnV2OE1TSnBNYjRK?=
 =?utf-8?B?bnFNeloyZW41bDRSV25ZL2RBV2dhRlp2Z21CVEhtL0FMOFpac0JuY0R3ODNk?=
 =?utf-8?B?d2xaOGFDNWNlMFRtMjJESVJsNTlJL2VzZGtTVk5lYXRUNmtFZUVMOGEvM0oy?=
 =?utf-8?B?WGs3am0zdHl3cHRLU0ZHajZ4YzY5MUlpSVFZSVA0SzRCVjJ1bEJzajBHOVdU?=
 =?utf-8?B?Y2RaSGdlZGM4WnA0bXpsRU9Sc0J3dm9udkxsR3RDUVJRNW56QUR2TGs0YTdm?=
 =?utf-8?B?V0cyMWZVRjhUSmhzTlMzMzZFK3c5N0NQOHdIR1p3TFFRYzBUTFBKMHlRTkwy?=
 =?utf-8?B?VXVTQVg2NG5KM1ZVVm9NM1dZQ29VU0l3TlNxbW5pUGdqZ1Y4QzJtMVoxaERU?=
 =?utf-8?B?ZUdZbTkzb0YyYjRGbC85M2F3RTlETUZ5UFY5Snh3aU9ZTFBlYngveUJNSXY3?=
 =?utf-8?B?QkhIRGJGRmFYakZNbExiZy9vOWF4Vlp1Ykl3LzROZ0hQNFhVM2dIS2lYV2VB?=
 =?utf-8?B?bUVNZTJYTDBmUnhKY1RMMWcwUmNrWjJsVHMxUDBGc1g3ZkQwNFJLQW5vdXFu?=
 =?utf-8?B?R0tWRGpSRG4wRHp0blc4SnkxVG5SUE9LTXhXQ3RxczdGSzRSUCtxcWRacC9Q?=
 =?utf-8?B?UFRTd2FEb093c25xUi9jVEpPaHNCSk4xcDZERTJHdHM2dFhqVTVJNXdYQTBx?=
 =?utf-8?B?a1JTYXpXSjNJaFhGM2VDSFozMFBtazdHNStTS0dBT2pzUjJwTXgvb2VZai8z?=
 =?utf-8?B?bWtneXJ5SlI1QmtObzNxTHY5Q1kvM1UvbFBwQVphUmRtditFMnRuTzB5RHdY?=
 =?utf-8?B?Y1U5aGxoenIzU2dDLzE4MndCZWtMTkI2U2JvSGYyMnUyTGMzbmNnZ29RUDU1?=
 =?utf-8?B?ZDI2VTdCaXRTZFFLK3lsM3N6ZUxhbkpaTkErZUxtVVExenpkODVMeFRWN1c5?=
 =?utf-8?B?LzAyNVlzRWpDQUZSSm9mU0tnZ3k5blZCTDZWL1FyeFo4TkpvaGJTaTA1VWkz?=
 =?utf-8?B?Q0FBMzZJM2VNWmZMMyt1MG9JYkVNaVhMeXVPbjV5WXNPcEg0V0VRVUFDSXIz?=
 =?utf-8?B?ZHl0ejU5cDF3dVllQ0xSNVdmYVpRWmtqaXBMa2hCYkhoZm1BY3pTaUVWQUVN?=
 =?utf-8?B?UHBnL2FoVWJKVi9TSnk1NEYwUUhYSjRISE9uUm92cmlGZWtYbnNvZ0g0Q0Y3?=
 =?utf-8?B?MFJTeitZMVgxVlRFdWlXMiszQkxkdU12dVpPWlFPY0o3OWpTQUdFK3I2bnZm?=
 =?utf-8?B?Q0JDdlFoWkh2cWg2NHl3R2duSnJVUzZPci9qbWhQNVlvMjF6c1Yxb3BuQjdK?=
 =?utf-8?B?ZEk5S3grOTVyNWRaTk9TaXhtN1ZZRzRNSTVOZ2libEFCNmVTZU04V084WnVw?=
 =?utf-8?B?aVZhWFhNb3E5STBMTEpyUWNYaHRSYkNhZEVjeHRXNjZFRitldkZVUHpJK0Nl?=
 =?utf-8?B?ZHdkWDlDaUx0U1BDMXJQVzZ2M3VZa04rNnB1QXExbVFPSDBCK3dHUndHN3RN?=
 =?utf-8?B?RFhRc3Ftek5zN3RONTNPd0x4RHNIc2UwNGpNeEJtRmtQcVRoVklRa0VMdlNv?=
 =?utf-8?B?N1NveWgySzRmUERzREtqRzdTYnMyRVhLbFQ1ckh3WlAzZ0pQZmRWNWd4czR1?=
 =?utf-8?B?TlRmNW9HcnNPcFk3VFIwdUVXYWU3Z0ZiWEdTalhQS1FRS0NvVS85Qk9yeWVq?=
 =?utf-8?B?ODliQi85SU16RHpKS2RSMHdwL3BUL2U2b2ZzUDZIWVMzeU5URUM3WkZQTzZI?=
 =?utf-8?B?T0E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5737e0d1-9166-4a29-fb28-08de2b9a354a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 20:44:05.2916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q8vU5vJMU62cNCgdG5LlYfPQJECSLWCftGH8HUgXQYwoLiKgiwK5lKhAfVhiwS4ZzgcC8ltQ04rh0HXAXc9dD+N4PKdp3f8clw9g4ekRDQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6053

On 24/11/2025 11:19 am, Kevin Lampis wrote:
> diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
> index 6f71365b7e..5f780fe1aa 100644
> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -86,7 +86,7 @@ static void __init check_memory_type_self_snoop_errata(void)
>  	if (!boot_cpu_has(X86_FEATURE_SS))
>  		return;
>  
> -	switch (boot_cpu_data.x86_model) {
> +	switch (boot_cpu_data.model) {
>  	case 0x0f: /* Merom */
>  	case 0x16: /* Merom L */
>  	case 0x17: /* Penryn */

One of the reasons of making these changes is identify the places
needing converting to VFM.  This is one, and...
> @@ -137,10 +137,10 @@ static void __init probe_masking_msrs(void)
>  	unsigned int exp_msr_basic, exp_msr_ext, exp_msr_xsave;
>  
>  	/* Only family 6 supports this feature. */
> -	if (c->x86 != 6)
> +	if (c->family != 6)
>  		return;
>  
> -	switch (c->x86_model) {
> +	switch (c->model) {

... so is this.

~Andrew

