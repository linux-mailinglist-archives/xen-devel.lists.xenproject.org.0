Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOxyAuzcnmkTXgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 12:28:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5B91967A8
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 12:28:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240573.1541908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvD3p-0007Lh-GG; Wed, 25 Feb 2026 11:28:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240573.1541908; Wed, 25 Feb 2026 11:28:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvD3p-0007IZ-Cq; Wed, 25 Feb 2026 11:28:09 +0000
Received: by outflank-mailman (input) for mailman id 1240573;
 Wed, 25 Feb 2026 11:28:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dz9A=A5=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vvD3n-0007IT-MC
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 11:28:07 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e03c830-123d-11f1-b164-2bf370ae4941;
 Wed, 25 Feb 2026 12:28:06 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB7065.namprd03.prod.outlook.com (2603:10b6:510:29b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 11:28:02 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 11:28:02 +0000
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
X-Inumbo-ID: 0e03c830-123d-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fk0trAsdhiuUGL/MEHpKsw6pPaWauORX2O7qMKTs1uV11KUs/mfCZw7pJUVz2wRz0cgoZ6zfOJ7X45NjmwaIAzNI5bCv5DdZOPyJYQmbml8KOOR3PJswdEu7fKp4+Ho0C7vXHyyT9Vn9PMIQKgybtlTW5yuy2Bt0K/uhJiz9UDvkEB76M0QvbJugpLUMxj1a/aS7YgYNx6xwa54cYjkGNp25gIwcmEnj2f32FTuMAKk5opKUuTQCSSDgfhC7V0x8/JiGEVS/erAOFRgMuHqkaWrDnbSfRIZuQ5z9b1+hblMhA8eAAyGFf++ZdgtRuI/AkmRVTWsQ731uFMeHdVg2tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6eRewzxLUuHWgVB61gtlBwhjyQzdMa0dAcfY9uYcKk=;
 b=y0ZI68+Vci2Pu9uqfChv1s58PEFM7NRv4q0qg/2qAp4fmbZNRbfTeSubZlJJrv8s0khLdl8UdsdfusvLTbomXVF8vbWo//z4NU9DnhNF0EJJPR4vzGsT/vyOAnhQx/mu4vsvLFz2mwK0TfokJVADN2yF/Jj1AnlePPbegQrgDOAFX/SdzaDUWQMFGhWCiQNVLkOrnS+8XSt3J2OxaykDxjPHCHvAHBMe+I75Bt+6aTtCdQVC+ZJrpYsXPsFjX6OJAb/ljoZSx3eVkpyxyhsJjcmmdmIxKDp0vWI7z1WUGD9zSR8eJSGcP6UFy/ko23MwEPcG/URV/CrxwSOsFyqumQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6eRewzxLUuHWgVB61gtlBwhjyQzdMa0dAcfY9uYcKk=;
 b=BQtrAnZnDj1M1wA9tBy21SRoqh6qsBjNvzCR3cQL7LZpxvWnSR1u37Bay5LUrqof96aOmGx+lfe7xIxzAen5VvYkLtM/KTMSrAdOQ8lonkcWEkky99Ozn/g5qn5ZVscbSBMZRSQ34rMTA+S/LHPKSEjLD1INzWlQ1KT2a7Zhvic=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <48e5a691-a232-4a36-8b90-9e0a77a5b498@citrix.com>
Date: Wed, 25 Feb 2026 11:27:59 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/2] x86/cpu-policy: move CPU policy library code
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <4bd68e41-e665-4992-9d3c-0086bb5195ef@suse.com>
 <7c06bd5e-fad2-42cb-947f-6749f647b068@suse.com>
 <d8eb4220-da82-43b3-b0e0-9d006f68877c@citrix.com>
 <e5e75e36-a383-4506-8e59-288faeffb614@suse.com>
 <1d85f83d-45c9-444e-8db4-3e0962aad0a6@citrix.com>
 <11c2f97e-efa8-46ea-8605-4ce6cffb9683@suse.com>
 <aZ1m8ZcXyiEBk1Sf@macbook.local>
 <c412f399-9e20-4f20-a43d-f0b3c3fa8f52@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <c412f399-9e20-4f20-a43d-f0b3c3fa8f52@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0289.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: 3764255e-0eeb-4041-9406-08de7460eff0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	1mRsOMfmepfzPVO2T0/ClY3BQlSuuZH12fIH8LaiLquxDUNti4Vh/kVRzQcyFxPoelyqD+dcSSEbM0oTd2II/P8WVJQRsA7Bs/5+8gVA0z8+oW6+rlaaAt0xrP8PPmjizzlUvVdxFh5dXYUYqM0l2KRZdwcNZdcBG0u9zzjYYPqaPnZNlmyjkUKn16+2nl6zskUu6pBm7NYl8EdHmHIKfmzK9LCJXt6WepGeazhRCLzWvbiWWnCZ1N7Pc6hz3gbUt6jNPcF9hcP7JID/dknut83+gRhu8FlGhYXUNlFrIza9uDYOIm8OFrrQ63miRwplYcBoufXraR4cbHNDqCzcVPH/2gig6C2ifu4zskeC95yI6OaeBIrjOKyTwDKq1svdz0lst1pEsXobb1KpqLT5gIEBRTljeeLmOGhtaXYMQ9BzaFXMVW3MsnP7Mzzj8Dr8kmGzAuo/bpSFp0kKbSb/1ryRV2xZApu+4XoygR/f7nHXpg4ituzf5DvYAu3A0PU0q9DErMpONvck0kBc+cOIl6DB61udiYREUaaB3Bq759wLofG20HbeE0xblLIiLuvmjpIcgagfi7hPSbG6eGWdIAXPXmZDXoeR08KNBSbR14qO10HilNmMGjYvH0ZGQ56VFjDqNF/IsXktTTsNWBUHZrzwwXswRiiHk761qrlxdt+y0rvG8kPM3Muv7HSiWkaIiZIIcshHQtO/D+pp3tvH3asdwI67t3fqyC+liYXSSWI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmx4emViWm83eEhGS0dxTjMvdDN6eGMyd284Q0hIdUtFLzNya2FENThFbUlX?=
 =?utf-8?B?TmxoNkk0UDlWT3g3UXNXdmt4SnAzeStZY3VIdm5ILzVwTnBpNzNRaGdBSVA5?=
 =?utf-8?B?ckdlYUZYVUhGVDZNV3VyTUY4alZTcEluRkM2UVhjWGtmVTVReVNzekJNZ2Z2?=
 =?utf-8?B?Z216SmhqTXhic0FjbHlwc2J2bTNiYTJRY2s1NmkwMGxPSUsvNXc2QXFVTElM?=
 =?utf-8?B?bVdvTUFiZVZnU1FUeU1GVkRVTXVQaDIySmNOTEcyTUtlY2ZEQmpUbk9iTmFH?=
 =?utf-8?B?M0YxVEZpTm5LMG1tNVZEYmNBVVB1aDJ4dEhVYjhvOEZWN25CZTYra0VVZ3ZE?=
 =?utf-8?B?YzJCNklQSzdvN0RMYWg1UFlmYTE1YWprajhOd0orMlBRK1pldU5GaU5kanRz?=
 =?utf-8?B?WFBJL3J4eDh4WUE0TXNEVFJ6UUJGOEtVSzNub3I5L3FoMS9IL2dBejhHVm5E?=
 =?utf-8?B?dHRFTWE2cnYzWnVkd3k2dmgwTW9VUUhPUTAxVEdhQWdzL09GNitBcVVRa01H?=
 =?utf-8?B?LzhsWmtseFM5LzJIMXJVMWtPM0FBRER4d00xSU9wd1lFMC9mc2NtNHhFLzZj?=
 =?utf-8?B?amlHRHg5N0E4K0NJcERjNGtmZlMzUXFJdzNkQmFzM0c1U3kyU3FSQkZQOGdI?=
 =?utf-8?B?dUhPUnozT2tRSlBwRWo3bWlnbUpibmoyOGxpY0RLVXMybllyQnY0ek42aTE5?=
 =?utf-8?B?RTFTZS9oRXF1TkVqZkxodUNiRllSZGRmRDBSYXBiSVNrNEk5ODFQRVJPSUc1?=
 =?utf-8?B?cEgwWDFHcm01RVVGOTg3L3VBcFZuMUF6ZHV1eXZDWFJkSVc5blJZNS9qTnB2?=
 =?utf-8?B?WFU2TnVUdUx3aTdJSjRncGpRRWFqbmFWTHZHUEtZdXdwa0RMWkxYOEdHNFVN?=
 =?utf-8?B?WGxTRWZrYVR0QjNHTnFqR1g5cXBTeXN4anZUV0YvTTVvSnNiVVpEclAyTFp2?=
 =?utf-8?B?OGl4eDFMQ3h1OEhDM0JaWlpLOHZKbWU4V3dsVTZ5NXl5c3RqS0NiQzBZUUdi?=
 =?utf-8?B?bWh2dkl3YklaT3J5bUYvZTVlSVRKOW96YWFRY2IyTXpkYUhQUUl1WWhUemRz?=
 =?utf-8?B?a0lMZnJsbTFkMTB4cEdJWUdybEhNeU0rckpQREU1UTVZU0Y5bys4cEQvdE9I?=
 =?utf-8?B?eENKZGFNWmYwWWZwTVpOQS9LZ2pvM21GbnZGTkJjc1FoenNvVzFaVnNVVERw?=
 =?utf-8?B?NlJoV2VvU25ld1FsSk5tcTBPMC9laVFMR29nY1ViR3hHSllVbVRLTHdKMmpP?=
 =?utf-8?B?MmduWTJ5SUdLakppSDFVRTFHYTZydFRpMm5xVTQxQ0s3NHJvUDlQaDV2R29n?=
 =?utf-8?B?RjNMY1BZMStXWk45RGJqM1g4aGtxTUZBWkJTU3lnek84dW9QL0ZiQ0lKNXZv?=
 =?utf-8?B?K1BCM0E3UTN0RkNmcHZIV0RnQzNpUXMzY2dKazIxeC90cU5acDlxNlF6aU5J?=
 =?utf-8?B?eTdLYzlBVXBtRWNOVzVpSjd4aE5JWmxVaFowdXBMTVRBQzRvL1pHNnRIVC9P?=
 =?utf-8?B?VDh1K1MzclJjUXFWUXdzNHBwREtYcmFqenFDQlZVVC9mblFvbmU5Q202eDVr?=
 =?utf-8?B?encxbGJYNmgvN1ZqS21qUUdSbjU5MkFwQkRmRlB1Z3AzZk8rVmlYb2I0SktW?=
 =?utf-8?B?VUNmZkdzZlRySTM4WStDYjJFY2VtbGlFS3VYLysvMnRDQkx0M2hSVWV6VW4z?=
 =?utf-8?B?RERTbVgyWjZoTFRDOEkvNHU1bExVK3dKNXIzVU9YZGtXdnFyc05EQVVHazhQ?=
 =?utf-8?B?OUhIajZiMWJ0Mm93Rnc0YlpxUDhHeG9NaTdxRDJibjhxdi85bnpFbU9aeWRl?=
 =?utf-8?B?VGt5TkMybDR2UkRPenJYb2tqaG9YTUVlQkIyQ0NVYTBWYmFDd2tES1p0WFRD?=
 =?utf-8?B?azBQYVR4ZGtYd0J5NG55SWY4aGkxcWtrV0d6dVliQlBZcm1FRjhPaGtsc1Nt?=
 =?utf-8?B?TGx4L1FQYmxLRS80WTdkaTAzK0ZnZlJER1VsbGxsOEJiRjdIc0g1ekcybS9k?=
 =?utf-8?B?amsyUktldjRIL1ZNRTRWYWY4SHBRWkM3UkNOb2FPV0NuaTgvaGNxUG45Yzdz?=
 =?utf-8?B?VDgyMndlUXFPc3dyZUFoVVBqNEkxWUUzT1g3dHZVb1g0ejdraGdkWHdOYjlh?=
 =?utf-8?B?N0tka0ljSk1uUEJHdDg3dnV5OFlwM2pYd0w3aVlmRkJHVks4b1NtWmFzcElB?=
 =?utf-8?B?U2NSY3B6NnIwaENaNTBRNlM2Y04waXNlM2RSM1lYbkMxTjB4VjNEM2Q4djAw?=
 =?utf-8?B?UVlQcEkrdWs5cjZzY2dqNS9oUFo1elQ2RmRCOVdDckdWbFpDMS9HQjVsblE2?=
 =?utf-8?B?VEg2UDN0QlZtaE5XNmJVTXRaYklpSGQ0UG0xeWJOZjdlaU9lSGNOUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3764255e-0eeb-4041-9406-08de7460eff0
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 11:28:02.6189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p8QURjRY605imleKFXnHOW3SopV9PRfC7yPtMM+PxhtD+tbUo/dNHIbqP/fgb6elRt22ZBnAh4wNKYxsA3UhoWnIUI0kRx1c0RJj1N5u6R4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB7065
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5E5B91967A8
X-Rspamd-Action: no action

On 24/02/2026 8:58 am, Jan Beulich wrote:
> On 24.02.2026 09:53, Roger Pau Monné wrote:
>> On Tue, Feb 24, 2026 at 07:54:29AM +0100, Jan Beulich wrote:
>>> On 23.02.2026 20:00, Andrew Cooper wrote:
>>>> On 02/02/2026 4:26 pm, Jan Beulich wrote:
>>>>> On 02.02.2026 16:47, Andrew Cooper wrote:
>>>>>> On 07/01/2026 2:17 pm, Jan Beulich wrote:
>>>>>>> diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
>>>>>>> index 0203138a819a..be6c76d2934b 100644
>>>>>>> --- a/xen/arch/x86/arch.mk
>>>>>>> +++ b/xen/arch/x86/arch.mk
>>>>>>> @@ -4,6 +4,7 @@
>>>>>>>  export XEN_IMG_OFFSET := 0x200000
>>>>>>>  
>>>>>>>  ARCH_LIBS-y += arch/x86/lib/lib.a
>>>>>>> +ALL_LIBS-y += arch/x86/lib/cpu-policy/lib.a
>>>>>> This wants to extend ARCH_LIBS-y surely?  Is this a rebasing oversight?
>>>>> No, this was deliberate. The functions here are different from those in
>>>>> arch/x86/lib/lib.a. We don't need to fear collision with "common code"
>>>>> ones. Hence I preferred to use the more "normal" placement into what's
>>>>> passed to the linker.
>>>> I agree that we don't have the explicit ordering requirement that we
>>>> have with arch/x86/lib/lib.a.
>>>>
>>>> But, it still reads as bogus to be putting arch/x86/lib/cpu-policy/lib.a
>>>> in the non-ARCH list.
>>>>
>>>> What difference is there having this a little earlier in the linker
>>>> arguments?  Nothing AFAICT.
>>> Indeed. The sole reason why I'd prefer things as presented is that putting
>>> stuff in ARCH_LIBS should imo be the special case (i.e. requiring a special
>>> reason), while putting things in ALL_LIBS should be the default.
>> I agree with Andrew that it feels weird that arch/x86/lib/lib.a is
>> placed in ARCH_LIBS-y and arch/x86/lib/cpu-policy/lib.a is placed in
>> ALL_LIBS-y.  If we want to do it that way it needs a comment
>> explaining why they are placed in different list, otherwise it seems
>> like a typo on first sight, and it's likely to confuse people in the
>> future.
> Well, I'll (reluctantly) change then.

Thanks.  With that done, Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com>

