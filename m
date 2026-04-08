Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHqsAgd51mm9FggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 17:49:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB913BE7B2
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 17:49:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276308.1561829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAV9S-0004dj-8P; Wed, 08 Apr 2026 15:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276308.1561829; Wed, 08 Apr 2026 15:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAV9S-0004bz-4i; Wed, 08 Apr 2026 15:49:10 +0000
Received: by outflank-mailman (input) for mailman id 1276308;
 Wed, 08 Apr 2026 15:49:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wAV9Q-0004br-Ho
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 15:49:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAV9P-002VBE-PQ
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 17:49:07 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69d678f3-2eae-0a2a0a5409dd-0a2a4501eb08-2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 17:49:07 +0200
Received: from [40.107.208.43]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69d678f1-6fc9-0a2a45010019-286bd02b8f13-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 17:49:07 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by BY5PR03MB5220.namprd03.prod.outlook.com (2603:10b6:a03:22b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 15:49:03 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 15:49:03 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXNe0meH2L8M08dQ1SkHDuXWo4ui8yHYbS22SCJtxw8wmEbFl3MRvCIju7cGu9u6cU/i0liudGumLpEnjOR4B5QozrB/VQ/C7ROqERiebLSYY/VDz3ON0IVe48S7lt76PVROnCQ4PR7IppFEmtwge27OMpxuVLJDMKHmAKdeSXWneIypnXsqEXusW5cGKoGejVdU1xwAgLATl9wFvpaDp4fIE+9szFmARxmSbAhu52YI8XV4uqatQVzKA2YdwJRR7iSzbU5iT1i5HgW19IhD3G2m9/L7v7pEbVVdhHZCJS+X8U5KglXYzi0fDgrDLZao9ocN+NgoI3t7px9aEbfoCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ifIojBZRiaopT06TQJuudILChDEvA/PjmNK3dFnlbfE=;
 b=DB1TZuegpAYvkQ2tjNuE/rRQiqgmWgw+Juc58VcIb7CpP5uyDNqsZAeYq9PzLN9rbItuRnLdI65wXdxl946OJKNNhkmXEeHUQa/6UKGFBbgNU9zT16ryfPuPS9BVnNms2V8gUfwL5n3MuSpRr/Je9sQot35ha6oKkYr9VCo6ZZPaWpdXklgdHNwciuNaeaEXd3CrhwObhssbtv6uYHsmixjPBglCONPvNjlarUxJjVv3V2J/JBkBOpq0N8D+opHdIq9U4BWdKsdsV/hSqb/jMUkm1wyzVFRTtoniaHbuYnV5OugjRa+NsfHVdrpi0wpkufMU6d5PuQUHJuQG1vaR7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ifIojBZRiaopT06TQJuudILChDEvA/PjmNK3dFnlbfE=;
 b=EhyR3VzhBM0tdrrWbWLx2EG5t50hPqOf+J7kJzxWmDtrNZZgVVmk1p+T2oQkU8YdIGR+1LlwWq7GW4/x0jrMN/hKoFGZub3ppgvw92v/gXLj5xFtIBPYgIiE04SFgTAx3hf2kDrA2FvDx8N4ZsK0q0+3Xz/ygMwo3u3k6+p5xWw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ed2006d0-1f5f-45ea-a8d8-bd9c064fe048@citrix.com>
Date: Wed, 8 Apr 2026 16:48:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] x86/hap: Wait for remote CPUs during TLB flush
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260401163521.3603665-1-ross.lagerwall@citrix.com>
 <20260401163521.3603665-2-ross.lagerwall@citrix.com>
 <b985f554-0338-4426-8981-0613f112f166@suse.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <b985f554-0338-4426-8981-0613f112f166@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0085.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::25) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|BY5PR03MB5220:EE_
X-MS-Office365-Filtering-Correlation-Id: e44d8523-396c-4236-90fa-08de95865b95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	awZhiatb4hJS9M/zBJ8mQF2pzgBPaLPk1+zJR8j+36vzFjrFd04E/LT8NWJqEduNE0i5o5oOEemlojib6P0DuOfmkN7zId0h8n9w3mU3rfTJuCMjOoj7DooqndBIzHHU2R8Dyf/7L+5oLrengr3NRCVUaTmqlkKox6LucYz6cvp4ct6apfX6t/eidlllEiZSY+LRXgD74Egj+OP1knFsdgXRRwsKmdLSEqNDyyZxTTtVl7y0yB2KxPQBJl9KVNfmQGTiGd4Ar1/VqU42Ii7+DC8iTA2RE1RxvRz5DjMgJpTi4iiLe9z7nWg1i8EKxgZn2TzeWSHlnd8LDL2jYctskRJwLLj56fo8GLakOYHS4TloYYI+8AxGwA5o6hhY6W7JB4AM4UNoTb5nZDYsDB6v0OFDtBVaoj8oT+uquXEcYLKjlRWTVAvwQmGb+ybjHF0Grm0O3rGPJpXP6u0TrbHXISgkdY6fVIUJpfhDMd+nWKlEn8Db6sp5oBIcUDYCyD7uxEt2VMLOyND8ubpc+0n5aaCIbqOOY8/7S5UCa1UepRRlQdlspfplwfP0acqY+CF9yKWxW83Uz8VhvW9VPUfY7tHI+ndRfR/vxizcasSc7sSdmfNeV/7gHI89P4qVuPvhBhUPCo4RtZSOYsoIEsn4hYzwOT28H3gece+aIIoI3CNvK9UlBvn/pTR+8HOD0gVhXfqI6YxFCkeQQh9kSoVq4jUczF+kaQEtgollCx7XnKw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWVzZTM1enpocnFsQkFBN1ZyTzVxZkFoTFpqK3NCK0hEZW9UTkZhNjFwM1Qr?=
 =?utf-8?B?YUFhVDg1T3lOWVFVT0Z2NnNyczZBU3JSVmFqcERaaFY5NUJ4bUcxdnFwc3px?=
 =?utf-8?B?OWdpQlBMMFRVa0RlTmpsdzF3RDd3ZkdGaGNQZ1FqV29aTVJTNkZNOEJoOVhw?=
 =?utf-8?B?Z1A0aUpJZWlVS2pXOFZnV0hMSzM1L0h0Q3piOFdEUVArSUVrdzhYTnNOSXRN?=
 =?utf-8?B?TkZudVFMY3ZyTURQUmplMHdObzV1eTY3TDgwLzNQREMyRXFTWU1uT1orRm5w?=
 =?utf-8?B?cFZsNnBFQVVCN202ckVFNnVSMnVvalJTOUFQdGJNZ0J0bWg0Y05wckhBTDlR?=
 =?utf-8?B?T1phSUZMQ0RJZ0xUeklDZUNtS1U5eEFkek5BTWVGazNCdXVwSmQ1c1JDbS9B?=
 =?utf-8?B?eHZ0dkdwQi9CNjJJbmhoZGJKeXVERnVodE5oWDhycjRzdEh2R0JKeld2NElY?=
 =?utf-8?B?Tm9wdFpBTis1TDhiTElVSC9lQnh0aTNmMXRpaDhqOVE2Rkw2VWJuN3FvZVdN?=
 =?utf-8?B?RUVkLy9USGdleno0Z0Q4cFhlNEFWdnlnRmU3ZzRHZXRObDNHaVF2dk5XY1Nl?=
 =?utf-8?B?a0hqbWpmOGMraXoxRG50UVk0NUYvakw3ZW5pdTBFYzk2MWtsaE5zaWRkMUZT?=
 =?utf-8?B?aDFVUGFUNFhhRlZjbG5NNmRmUU9LUUYrYW1HRFpmLzdQYmkvaEJlaTBlL1NK?=
 =?utf-8?B?NEtPamhyYU12Qjk2bmY3OVlNSjh4YWdCMkVieGhvaW5iMjlFTFBOVUZQNXB6?=
 =?utf-8?B?ZzRyWlVFcGlpYzJTTHYrdUdxNXZHN0RIZDY2UFJPK3B3STBYSGU4c0dpRklQ?=
 =?utf-8?B?WjIrQWJ4TVg2ZHNNL1liUmxoLzIxcXBaTW4vcUtVMHhjUWtPc3k2ODlQWmw2?=
 =?utf-8?B?aDYzcUJPL1VZdWRYbEtuZ2dzZTllckd5dnlpSmd3WVJSbjdSM1JqWFluZjNF?=
 =?utf-8?B?S1MyRExJU2pMbGg2N2xmWmsxVkFXa0FvcGR1eEtidUVBSGh5WVVyK3lMLy9C?=
 =?utf-8?B?YTJ2UWNkMTltY2Znc3MyY3ZzQ0lOaDkrNEc3Wm9WaENYWmNwbDFKMDErSC9m?=
 =?utf-8?B?NG1vMDYvcGVSVmFXQlY1U3NJY1IxTGZCbjBKVzYxbVFTYmtGTXYxeDJpMXpx?=
 =?utf-8?B?Z0xyWG5wRFVRRThPVXdyTUlUamNlZG5KbHJ0UnpQM0dhVUozZUNjYzArd0FY?=
 =?utf-8?B?TVc4TlJmUWRMZlczek5VbThLS2hwRjZvYjZ5TDdram5XdUk2YVd0Z3VWSnN2?=
 =?utf-8?B?S1RJYXdPZU5CZEhFa2k1Mm5OVWRPRWRnMjd6ZnQ5K0IyZTFmSnZCTFMzSy9C?=
 =?utf-8?B?M2QzMjlyYVdRN1JTUVo0bmhFaHYvNEdVbkc3cDdhMVIvNDFjeC8vU1VUZE9x?=
 =?utf-8?B?WlVWbUt0WktjWnoxUFczM2ZLR09QUU1iaHozOHdxd05qVFBpc2Y4blV2ckZa?=
 =?utf-8?B?UXJXVk0rUklyeDVnUVFPUEs0R2pudTQzcjBPUnIvWFo3UElKaVpvT0hDVDZr?=
 =?utf-8?B?cjBKMkVWZlRkV3JMM0sxM28vUEsvdEVqVUk1QzdPMmVkdHdvRTZMUEpBaFZl?=
 =?utf-8?B?SmlDYitvbGlkSXdIdU1KdjMxdnN5enhOU0t2bTBheU9NQzlKWGd1RDZURzJS?=
 =?utf-8?B?cTRqZlRUTFpjdUlqQlhxNmQ3WUp4Nm8za3Axb3VFNWJUaVNab0lYV1FuSjlz?=
 =?utf-8?B?QnB4eDVLdTg5TkxnQlh1OGlhTjZ5d0IyaFFaL3dId2JEam8rZzFhYXVta1hk?=
 =?utf-8?B?QTNFR0JBNE8rc2ZhNk0vVEYzUXZxRER5TERmcDdPUXp2T1E2cmthZDhQcFkv?=
 =?utf-8?B?NVhqM1MxdHRIYlpRSndtbXF3cmk5bjFUTVNMTTlGaEt2RG9iWXZmdzNTM3di?=
 =?utf-8?B?QkQ1NVNVZEc5d1NESXFUd3JBYVpPdk1kZWh5SWk1N1B3SmpTU1pMbDdPU01I?=
 =?utf-8?B?ZlBvekxBZ0tOV3kzMzJDT051Kzh0T3ZqVU5yOWtjY1dzUWVQMFVyWHNSQnN5?=
 =?utf-8?B?ZjFJdXdEdWk3aXd3aThsc2kwWWJGNVFrbVZWT2hUc1FSV1lBdTZVaFI5QzNB?=
 =?utf-8?B?NVNpUG1kMCtsQkpjUk9uR3NKMlo3YjNFaTkwUDJqUjFBczdOaDBhWXVRWkEx?=
 =?utf-8?B?eTMvRE43c0t3RFE4d1N6cm1XNHFIeXR6SjNTNi9nTFBQblMwYXhzbHN4TjFU?=
 =?utf-8?B?d1hLZ3cvaktmNVQwSWp1TS9SMGY2dGt5ZExZUnJucnk4TmZWeDkrOGtucGxL?=
 =?utf-8?B?QmJzRk9pakhkaGp4QnU0Y3ZhUVlTZjlsamlrUlJnWUowbTlnRlFZdmZ3djI0?=
 =?utf-8?B?dE9EYTJNd1ZLTFVvZXpVRjBOQjdnZ09xS3pyYmdEbi8yaS9jY094c3BkNWZj?=
 =?utf-8?Q?HYNF8SCzONFcjgXA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e44d8523-396c-4236-90fa-08de95865b95
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 15:49:02.9557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: orq/BvzzpvVdxL5StY7GTJuHw8OIIoODR5IQLhg13irAgIlG6I9BPZFMyOHrdD+DoBQA1GrmyR+UBX8+R3R3kYwzQRqcmm9KA0TyIF3STz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5220
X-purgate-ID: tlsNG-d62444/1775663347-14EE3185-EA0A2A97/0/0
X-purgate-type: clean
X-purgate-size: 1236
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:mid];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6FB913BE7B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/8/26 4:21 PM, Jan Beulich wrote:
> On 01.04.2026 18:35, Ross Lagerwall wrote:
>> A future change to on_selected_cpus() will change the semantics of the
>> wait parameter so that it doesn't wait for remote CPUs to "check in" if
>> wait == 0. Adjust the call here to retain the existing behaviour so it
>> continues to wait for the remote CPUs to VMExit.
> 
> Doesn't this go too far though? IOW wouldn't we better make the "wait"
> parameter a tristate then?

 From what I can see, the current wait == 0 behaviour only exists as a
limitation of the implementation: The local CPU needs to wait for all
the remote CPUs to have read "func" and "info" before dropping the lock
to avoid a race condition.

With that limitation removed, I don't see a valid reason to maintain
this beahviour as an option, though I could be convinced otherwise.

> 
> As to the semantic change, peeking at patch 2 I don't see you discussing
> the safety of doing so for the several other callers that also pass 0
> right now.
> 

I did audit the other callers (including via smp_call_function() and
on_each_cpu()) and I believe they are all fine as is.
I can update the commit message to say something along these lines.

Ross

