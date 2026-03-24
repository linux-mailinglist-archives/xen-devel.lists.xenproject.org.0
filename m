Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EF0eOFsYw2lCoAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 00:03:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4024D31D9C6
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 00:03:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261402.1554418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Alp-0001N1-NM; Tue, 24 Mar 2026 23:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261402.1554418; Tue, 24 Mar 2026 23:02:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Alp-0001Ki-Kd; Tue, 24 Mar 2026 23:02:45 +0000
Received: by outflank-mailman (input) for mailman id 1261402;
 Tue, 24 Mar 2026 23:02:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1w5Alo-0001Kc-7Q
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 23:02:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Aln-007qHu-H1
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 00:02:43 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c31805-e002-0a2a0a5209dd-0a2a4501a004-26
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 00:02:43 +0100
Received: from [40.107.209.3]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c31810-6400-0a2a45010019-286bd1030708-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 00:02:43 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN8PR03MB5075.namprd03.prod.outlook.com (2603:10b6:408:df::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 23:02:37 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 23:02:26 +0000
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
 b=WQr4i1aD6CjWwC4HUjTFoVx8+MtEciqSu1s80rhC/h1mk2FV0g1hgheBdgkwSXGB4ljNxg0LZZT0gnQ4+IYOhx0m1QAVha/GADpwUEa6OXEz5sViQanxq6zLSeNUetYX1L7ZjS4gBAx10Jmbga7CdijH4Pi6g615dW8tyY7mjxbtg+vMdMkcOl6oFReHIxjPoPXM4ElOF+i/qlgaG4SjNuj6Z26NeFwLp9orxcYaF9un17xudEzTwIhoLtCQLeNs5SBnUc7R6mva5ooLe4VO4jWGxYMRq1wuLhAx8+vPXx2Hx6pr7VTEwUzqcqrmEbN7seZwb4tqw4+eEf+Xu3Gkbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqqudF5anQWFqWO2PLgWenYBP8oU9QxSD9EI6x275qA=;
 b=OmW5WgeWOcHyP2uRIafR44kz/DAlDPmzz8tfNUxFMi672sgwt1Nd9AVhFT1QcJb1Nfd8FYNfs98GeugSZl2Q/W/x+Q2mZPHNzW3ttQ7/0QLfe5jDIHsjnyFACvkxFIFAPB1jY3m3aISzGZUWpvF0mGZ6XrARF4wD7rUzq6i2HgqwJq+Q3TXfFqqrm2khEhFHAHxX3AbkCevIOpIsnEbfMA5H5OjeC279vOzI/gDyLiq+8MlidiN9NVRmntlFfDJSXAZkoZVgg8JHaRDCGB0svmpZh+biMYzi7q8CjWACVV6sfs8PMFEOsA6Z06DeYmHEuNIAYNq2ahESch6jb58UOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqqudF5anQWFqWO2PLgWenYBP8oU9QxSD9EI6x275qA=;
 b=wT5xysICdXCxcIcXmrUwsRhVv4M0bfHHLG9/HyujLwGQ/E4dF5p49LKp2Y91VlhhLlG5yzeX2YKdUA/9tnj9KfxcYbYaNkS2rPrWhzz5UT+vRdV8/qarYTbP/bK2AU1bp7yV8F6kdaZheyYOGe4peF8JzehWKXfrQ0+7cqosHpM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0471e754-9ea7-4fb5-b573-b770713b2f53@citrix.com>
Date: Tue, 24 Mar 2026 23:02:34 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/9] x86/domain: Ensure a vCPU's FPU is reset early
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260324181937.2465574-1-ross.lagerwall@citrix.com>
 <20260324181937.2465574-2-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260324181937.2465574-2-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN8PR03MB5075:EE_
X-MS-Office365-Filtering-Correlation-Id: 1de09cf8-e9ac-4b27-e088-08de89f96ac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gTpIQekK4U98TfhyrtDLll5Zw6PTSV4Q/Ns5ckDILBwT2AzvzEAcQVCSNKGA5YKEhlMl0VXMC7hui9z1vRIxKSYCQJDBWij7PJt9IsAejpfmR+MZky7qkRCHCAtAPqIVsbker5S7BBDWyAe79VZ1mpNdwONX48fZUTKBfvYC6qMpOd5rlZ5JKXtVneeTH+O2Yfq8CjW/bbBGdGkMUsu32yYFsilDKeiZ54F93XgEBQkhs4EXSTjVFmPYQNSu7p8wKZiHAMnVmhVKFA1BrAEq9tACYg+ous9Y+mMHaCNyNxy28qJr2AnQVxq7cBPPXQcJPppdai5DjRDoLLev+0WGbHGiD/C+aIWqePxyIQd1kbjPvKFdJE6ZBQNb9pKP6+SehRRjK+hKL+c6qY93ArSvqtfaTvOZs6CEXV6QctV39qftjfUXkv7SoivRBfHYmEUSWbKaKGtfa1ccXpG4CeFHfxmyElDYdfF38fw582fWS/tInx2zvL7jkxm/R26cvpiYLP7U5DSFLD88MJLfOv319AFEOmK16oJD8jzWMos379BdARTwvLZIPrty3GzXwYV5ac5R75m/Tzt4hnCCGbbImImLC/Pib3+0W1diZ2MDaSMaWj0g9SQ7XjkMN/NmOH8+bmQZwJIcgO+4j5zR04fC6gHj0GzO6iF0LUALdqzqrrfDWhx9YRUgPTK0BgSBIqQf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHpmcTBqZEpqZkVyYTU4NURoQlYraFpqMjk5WWdXTkE2RTlnWTUwZXd1NnBt?=
 =?utf-8?B?YTEzcVMxRXBYR3NUZWUwVGVacW9UUXZUeVhGVUoyYUpzd09kVFI3SFZPTElG?=
 =?utf-8?B?cDFRUDlRZThpbVZGYW9GVDIwM0RPZXJnRnR5MnJVUzlocmwyUEpoV1MzTzVX?=
 =?utf-8?B?ektpOE5JajdBT0FtcHdYNW9iemhLVGRRWTl2S1lFMmdRZ0pWdnN0MFIrK0NJ?=
 =?utf-8?B?aFg5ZlhjclR3ZlZ6Yy81Z09TeTl2S0FHR2t3OG5NNmNiU0dKTWdmSXl6RHZL?=
 =?utf-8?B?a1A2dklZYzdBZ2lBMmF6SkNxSXhkZFMyRzMxeHY5MGNHYnVOY3V4cTlERDdp?=
 =?utf-8?B?bVcvZjUxTVIxQmxmZEk4djc5WXFjZEw3a1J4SERmMUdOZUZ4UWlWTHE0QnE1?=
 =?utf-8?B?a0o0NTNVTHpSYlY0aW1GbXAxYUJKNE13cTZ1eC96eG1DaitBK2xHbTdoMGlm?=
 =?utf-8?B?V3dVaHY2QzN3QTUwU25adER1VWNnZ0xYdnhhejNTaHdYZDd1cjVnSzdkaitu?=
 =?utf-8?B?L01ZNmZrT0J3VkpXN0I1enNOY04xdjFIaE1nK05MaTVkWUt5eGFJbThjNm1a?=
 =?utf-8?B?dk1mRjRRMHpUVnduM0huTFFsTm1xWGhlQ1NWS1dMWGtodFNpdFBCem5qYUxI?=
 =?utf-8?B?M2dvK1JiMENZMWp4TjZtK0dnaDR0VmNDMjZaWDRlT1FNb1pxN0lSdGRuK01Q?=
 =?utf-8?B?ZjRrbjY1YTEvVS9VN29HK0l1WTA0N0RwK3hXZTZZMFFEK2hMalhXV3J4NGlY?=
 =?utf-8?B?NmJzNUZOZzhaS0JwUEh6b0liSXgvbFVZa2dpODFBcG1NRjg1WVplUlMzeWdy?=
 =?utf-8?B?SmNCT1pGUU1ORTcvSXBsbjB3NktMeENvUGF3b24xa3NNRkxBVGdrdmVTak1W?=
 =?utf-8?B?MXBzV1g0dnMvSTd2UVB6QThlR0Z3dDBJVktLbiszdWk1WHZ6YW5IZUlTaEdz?=
 =?utf-8?B?ckJDWm5sb2wyRWRxZEpSZzdleXE3cHBuY0wxNWNxUkdOWEdXUlF6VWFoL2tM?=
 =?utf-8?B?cFBDSjAybkFqVzgrS2JaeUtQOFpUVnA4NmF3OUR2Q0lIRFVRNHdwQzNJS2dq?=
 =?utf-8?B?MlJITkhkbmJrYTdzaTVWNGV0bksrcDRoZlhBY3J2S1d4Zy9jV1lreVI4Nk93?=
 =?utf-8?B?MEJyc2orOG1FVzRady9lbkR1cjNUTllVbW51NGluajJVQVQ1b1NWS1RRMmpB?=
 =?utf-8?B?ZWRPUjBLdlVsR2xQbVcyRHNOUTgxNFdOMENubXNZUkpDYVNqMThVQUhxUmZs?=
 =?utf-8?B?N0wrc3A5YnYxRDRmWEtielV6dVJxbmY3TjMyMnNvSkR6SzNTZHd2WDB0TVJ4?=
 =?utf-8?B?WmJsRVdmOFFtR1pEa01xVVFlbHMrbmlvZXJjNVZVa0pYV2pWWnBkRXlieWRN?=
 =?utf-8?B?ejlVV3NTdXZONXZvcmoxSHdnNnBvUUdjK1hFanZ6Rm13ZW1neGo3UXp5dWVh?=
 =?utf-8?B?SzdoeEFjbEFpRkRNRXgzb3F2ZWd5YkFNRjhDaWtyQ1J4dC9OcTc1cGErKzcy?=
 =?utf-8?B?N2grV1liVkJJdUZ5Z3Q5V2l3V2VCQUxSMDMwcWplSUZRQzV1RTNLWlZ3aGQw?=
 =?utf-8?B?R3BPL1lLek8wNFJ2aVlpY2hLcjBnaGtPK21sR1RmK3ZUWWd1UHBmNGpGMVBL?=
 =?utf-8?B?MFFDQmg5Y01nQmNwM1k3MjZZdCtoOHpiSUFqd0UzZ2pHS01VR1BnMHJkK1Vi?=
 =?utf-8?B?YW9DMFNRRVRUNFBWSmpPdXB3TUh5UDh4RzE5M3ViSXljR3FYM3FmZmsvQUhl?=
 =?utf-8?B?ZlcvSGpqYXNVajdETlFSMHJIYVlRbWJJcElQSXVESi85aEVlUm1vb0R2NVFa?=
 =?utf-8?B?N2hlYjZVRkl1SlFPZ0g2ZW0wYk9MaXlHT1ZNbUMxWVQ0ek1UUHl0LzFPVnlj?=
 =?utf-8?B?SkJwNTBTL0tyM2xCNzJhSUxXVWJrMmtDZm1rdmdsczQ1NW5KdytSTlRkWVJR?=
 =?utf-8?B?cmtUcXdvZ0swNTI3WFI4cFpFV2xJS25CakhIa0VoVzlGMzZsVGNRMTlNWGpE?=
 =?utf-8?B?cVZ1WjdkZ0VvNjZGZXR1TTIrc0loWDhxTDdUOWIyZEJFVGFpYVFtZkRUU2dV?=
 =?utf-8?B?NzVUb2RVQlVWTjVLZ0IrZENoVTZxaHcxamVvaHZ5aklQUFRBYW9IN0hFWWp1?=
 =?utf-8?B?eXNiYVBqZUZVWWZ0WUE0VW40bDJlaXpmV3NPVjVVR0dVSGlpWFNvQUl0WGJo?=
 =?utf-8?B?K1ozSnFwOTBjS2RQc0lnd0ptSTlPejJuK2xqS0V5NkNpUWhVazNDYStiQzNp?=
 =?utf-8?B?ak44anpPb2Vudm1CVmFEK1dKQkZOQ0EyQkhhZlJuU2czMk04YURQOVhNMlRj?=
 =?utf-8?B?UHRtcjFpdTRWbkg5OFZ2dUx0TDF2OHdralVXN1ZaN3psT3h6UEFBNk9mS25M?=
 =?utf-8?Q?AccaddxuT7n2ta1E=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1de09cf8-e9ac-4b27-e088-08de89f96ac4
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 23:02:26.5348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RD8ofXqEIX04yzfQBTtJ2WHb+z/4G2KBLbkgR3CxzYMZOXzZMFv88DboN/h0kCVIB/ezLGU9F3/D/YtZVohV4DxHAeHSfxniQkA5afHIhUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5075
X-purgate-ID: tlsNG-d62444/1774393363-48815DF3-E9764C63/0/0
X-purgate-type: clean
X-purgate-size: 3290
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4024D31D9C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24/03/2026 6:19 pm, Ross Lagerwall wrote:
> When using eager-fpu, a vCPU's FPU is always marked as initialized on
> context switch but it is possible that neither vcpu_reset_fpu() nor
> vcpu_setup_fpu() has been called on it.

How?

I don't think a PV vCPU can.  You cannot VCPUOP_up a vCPU for which
v->is_initialised is false, and setting is_initialised involves either
giving a good FPU, or taking the "reset" path.

An HVM use of VCPUOP_initialise only passes basic state, so can be used
to set v->is_initialised without touching the FPU state.

DM_INIT preserves the v->fpu_initialised-ness while not touching the
buffer.  This is correct(ish).  FPU registers are (mostly) not modified
on INIT.

>  If that happens,
> arch_get_info_guest() would return a block of all 0's for the FPU
> context claiming it to be valid.
>
> Fix this by calling vcpu_reset_fpu() during vCPU creation.
>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

The phrasing is a bit awkward, and the function names don't help, but it
is something we're going to have to address properly when doing nested virt.

(A minor tangent which is relevant to where we want to end up)

https://sandpile.org/x86/initial.htm

#RESET and #INIT used to be a physical pins, but are just a message on
the fabric. Either way they're events which alter state in well defined
ways.

From Xen's point of view, vcpu_create() is the only #RESET-like thing
we've got.  If we didn't model crash/reboot as constructing a new
domain, that would be the other place to use #RESET.

#INIT exists explicitly for HVM guests, via the APIC interface.  Xen has
no working model of this because HVM guests were built on PV which
wasn't modelled on how CPUs work.

v->is_initialised is a PV-ism which has infected x86 HVM and non-x86
architectures too.  The key thing which PV vCPUs need that doesn't work
like CPUs in the slightest is the chosen vCR3 (and vCR1 for PV64) need
to refer to a property typed L4/L3 pagetable, and PV guests can't take a
type ref on 0.


Anyway, returning from the tangent ...

> ---
> New in v2
>
>  xen/arch/x86/domain.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 9ba2774762cc..82da1c5d7b38 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -522,6 +522,8 @@ int arch_vcpu_create(struct vcpu *v)
>          if ( (rc = vcpu_init_fpu(v)) != 0 )
>              return rc;
>  
> +        vcpu_reset_fpu(v);
> +

... this really should be part of allocating the memory.

First, we should never have the backing memory in the wrong state, and
second, the idle vCPU doesn't take this path.  i.e. in
xstate_alloc_save_area().

Looking into this asks more questions.

xstate_alloc_save_area() does set some of the backing state, but misses
FXSAVE_FTW_RESET.  That's easy enough to fix, and turns out to address
my original concern.

vcpu_reset_fpu() sets v->fpu_initialised = false.  Doesn't this defeat
the point of this patch?

Maybe it's easiest just to fix FXSAVE_FTW_RESET and then purge the
booleans in the way this series does.  I don't think trying to unpick
any other bugfixes is going to be fruitful.

~Andrew

