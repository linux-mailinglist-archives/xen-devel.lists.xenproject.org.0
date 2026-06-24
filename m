Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NvlWHSSxO2qtbQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 12:27:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B7D6BD5A6
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 12:27:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=mtvi8FIk;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1344753.1603787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcKpY-0000jC-0C; Wed, 24 Jun 2026 10:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344753.1603787; Wed, 24 Jun 2026 10:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcKpX-0000gp-TT; Wed, 24 Jun 2026 10:27:39 +0000
Received: by outflank-mailman (input) for mailman id 1344753;
 Wed, 24 Jun 2026 10:27:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wcKpW-0000gj-Lt
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 10:27:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcKpW-00GiND-2S
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 12:27:38 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3bb119-2eae-0a2a0a5409dd-0a2a4504b9ac-0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 12:27:37 +0200
Received: from [52.101.52.28]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3bb118-5f9f-0a2a45040019-3465341cdebb-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 12:27:37 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN5PR03MB8110.namprd03.prod.outlook.com (2603:10b6:408:2ac::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Wed, 24 Jun
 2026 10:27:35 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 10:27:35 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ijBqhE1EBft1fVQrAAVTAsZiJ5ddxWsinajjjQrgnIzq0NNtjgAPq+GU8oZGe5knednfVujwh9F9TVvYIcgHjLGRNAslfB7JG3o1EnOwcYYfZKZF/CslbUZPBfVu9zrnfhDd0yCMhJaMkeAAqDIkDW+7M7NKSQMn6DhDv4/7EsLbxlfV0KLcFCgWUzULHusNEpHnbaQmtcqDwn8pSIq+2pyF6su/nI2zeMzsHiMjCg4FqdtZ4gWIhmm2OAmo4tdQlc7QX7EY03tVmRPwrr6TCUYOGgbI41Yl2luUKfocEjPXnv9CeWPgM3zsS0a06NjQV5C3S9PWpYZJ7mbarwtD3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bFJ3fWWehjvF91yESLxGMzUEoPAW2ZazG/eLvAPVCM=;
 b=ZZUs5Qb/pem9tekmvybvgPsZS8CmD7+wO1LwtIW5FphHPSHgxnPey91GVweGGedywWNlfT/Pr/YzPTnlwUkG1EADfFF0cjiyU21S4f1pKlOIjc2+XfqEkRIyeZj3h8MC77jCbkW0phzD6drAbRynZWFpTWEvApkfoY3EGJ57FQ/GKYjqsRfriNL1fbUiAEnXaLhzOH6WFEud59P4XXCFGpxQ+5FkbEA8IKvYkXZS3kY46LAROf+Q2AGy3NckEbjAFbKDa2/wDD4DXpH84uqC1NdU+SS/kY5Zq5jy4+syTh3hVRU/XBhed0pwwVWZ8tmNw643FeiuPC1sX5PfTGfDbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5bFJ3fWWehjvF91yESLxGMzUEoPAW2ZazG/eLvAPVCM=;
 b=mtvi8FIk2Mg76appdtIDjVe5ySnolZZ83QBcyl7B0BmJ2vt+i5UY6nfp+zXEO8PlslthA64uvI4flaWQojT78nhm/2eW5fPv89nB9VwAEKFQc+rKu1sGjYyWN14N006WBeoLr/rzTZhlMlZ1bXRdg9YzFhs77Z5GvElt0H7yP40=
Message-ID: <52f21ea5-6706-44fb-bb08-bc9c60ef84be@citrix.com>
Date: Wed, 24 Jun 2026 11:27:32 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22] x86/boot: don't blindly mark VGA in graphics
 mode on MB2 path
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7fbe73a9-08b1-46ff-81fe-ddd6ed52deb6@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7fbe73a9-08b1-46ff-81fe-ddd6ed52deb6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0403.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN5PR03MB8110:EE_
X-MS-Office365-Filtering-Correlation-Id: ce6752fc-e8bd-4bcc-c991-08ded1db3502
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	eMbzya4rF8B0akstv0CtZbubhn1Few2E7GClhIYT9RW7tN52Qin5qGGojeEpBvOI8d2wXYxAt2SHdSXasXGfOnF2l9/o1QE0rbF6NFNCzL5eFRestm3BsNO9awX9Nf9BYfQi5rITjmI30pmDFT/xKwwSNWXepTKxs9gHUGJBtWauqJmYdmddGOlywmw/ji9twVPZyrGlONWQ3vtt2dKS8gj+wwvkag7ujIADpVNVfp2S1A4z+ldcn2mqqX1nKvwshhwvvLdSPEAtLA+lwXMx6JbaUZy6FPKKKomRD3d5Y+l1ZdOuHR4JQEkXDVoKsVcjbqLjQJ+228AxiWhR1iJbZmMeAIeceJ+O95CVIFd7suPcm2QUtqxDgo/9MUjkMbqX2RcG9vQaeVBW5T6GB5mIKYcs0UvQ4uFU9/AoLABfQBScD5ImbkeV+ZulKiC747zJE6K6Gfy8b4AncBtVTgzAW8qCjFW1X4bpxMWsg745jY8+bPmIJB8i7SPNwj0Q5i1MpGrBHgDjgjU4DQ3mv0P4ca0swDD3qmstgeBMByjaFAy/iUrMHEMzGSL3R5TaXGXk8ZJc8Lo8QaN5WUL9joT9rBaksEmfyKoL7lIwLDuvheISYBAieOlKgIqw+ja3yLf59k5RIcP8na742c/qn7OpdGhQF40iRmV4PUFw5C6rgbs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q05kOGg3N1Y5MEFoUE12d2M4U1dCalNCVUlES1U5SW05ZEFJbGxZVVdUeGpp?=
 =?utf-8?B?OTVXVWJDdFBuaWNCTW5mcTk3aHUzUkhpczVCaXZzS3BpNXk3Zyt3MTJBMERI?=
 =?utf-8?B?RUNDUUQzTVc3SjRjVnZDMExtZnhVYmFhcWYxWU1xc3ZWVDhobDA0WHZGNG0x?=
 =?utf-8?B?SWJxcE1PU05nYnIwK0NNUzdWTm5oUDJTeHpHV3h4RjI1MElWcndNNXh1am1V?=
 =?utf-8?B?cEJKZHE4VVdibDNSaC91Y1Y0Qm9FcUU1LzBiSXZPa3ozZFBvRG1ySk9teUxC?=
 =?utf-8?B?RXFDNDJrbVhYUEoxNkR2MzF1dnFGT0dqT1VmQ0NxTG1JN2txUTB5T3AyUjNU?=
 =?utf-8?B?emRmenNwZEs2T294a2xMYThLbFkxYWgvY3VZSlB0UFViY1JwRDhVYWRLdXhv?=
 =?utf-8?B?RktMR1F5K0NJTDRabG5jYlU5UXlZVFRTYzBtSjhCcnoxaEg5NVR5Y0h5ZG1t?=
 =?utf-8?B?UjFYUEZaM2ZrOXBqQVZqSXZzdHpOS0FmNUxmU2YwMkQzTjRxSzlSZ21kck5N?=
 =?utf-8?B?RFNoZDBIb1NlN1dMbi9wTy81M0cxN09VWWg1UEFzampmTTBxeUMrbmh5cnIw?=
 =?utf-8?B?Z0F3MXloUnpuQlcxSWZTVFB6WjY2azdHTzlFV1BJbUxsRlB4UWczNXlmM0ho?=
 =?utf-8?B?UTdaMXVlZ3pqaHNxNmlQcmJvWjk0eUtLejlkaVVrSWpCbUN3bm5UVHdCb2Uv?=
 =?utf-8?B?cnpuSEN0ZkZwQnQ5WGxVMkhhM3lCV0crYyt4RWJvQmxnWTdHbjJDSjNDRlRN?=
 =?utf-8?B?YjdHR1VGQmFETnBydlpnYzVwRTRMdUpHb1FmSndxOS82VU1PWUtmQjl5UUgv?=
 =?utf-8?B?bWxrZXV1dHVMUW1UY29DdGU0amhUQzJJVHJJQmNjTFJlbXhXVmJoZ0tFVGpF?=
 =?utf-8?B?UDNzcGxWZjNtL2NidVhuYkVjQ1d0UFZDY0M3blRCUlh0OGtEYUVkRUYrWHZO?=
 =?utf-8?B?cFRneVkyc0dXT2dDUlVnVDZLdXJ0MGROeHZodzdSNVVxVU43OWxrclA0bncz?=
 =?utf-8?B?bFVDRkFkN1hSeEpnMmQwdFc0U1E2ZjUzOUMvdzAwdVZFRFJIMWx5M1RpcDJV?=
 =?utf-8?B?MHdVSEgwTXZXeXVnUzFWNG1MOFdiaXFLR0FydDAwZlNSYzg1T1RCcitvVEh5?=
 =?utf-8?B?a1Jsa2tZVVJaUHZwOVNZOE5iSGYwZ1VieCtPY3VZYkdqRE5zeVIxU0RlZ2NK?=
 =?utf-8?B?bU81N1lIUDBWTVVXNEMxbHZ3ZEJJekZFV2lvNGpMbkozcTVBeFN3VExmVDdQ?=
 =?utf-8?B?aVRhWTVaZ3ZnclBGTjQzSXhrNXQwcml4UE5rL2VWTkhEdHU5Mi96cjBUeVNS?=
 =?utf-8?B?Q2VPOE9HdW5PanZhOTJMdi91aCtBd1ZPWmtRSVh2aTZMZmdZNHlGSk8zVUFr?=
 =?utf-8?B?cVNkSVViS05UME5nanp4cFZnSlZqeWN0dnBya2RrYUw1SnJIQ080VFZnbXl5?=
 =?utf-8?B?VEVjV2Z0RkljNDduK25ySWlaUXVhR1cxQklnOTZDcVROdnRNUGlRNzBQdmZH?=
 =?utf-8?B?Y2t4QU1WMFB1Ky9aNU43Y3RmZlR1QWd1aFJXUE9YeXczeEMzc0R6c3hGN1RJ?=
 =?utf-8?B?K1lTUWZ1aFNPRm1KRU8wRE03VW1JTytYSkNkWkZjYTIva3Q2RUZoczNLcXJW?=
 =?utf-8?B?MGUzTFpoeEI2RW9Dck1BeGlhdXduRzR3VVlXcVRGekxlZ2g3TlpNZG84T3dR?=
 =?utf-8?B?NHdneStPZm02RzQwUUNRb0xhTXBzUnlhbm96TmNIU3VkeGYxZlgyRFh1UjBE?=
 =?utf-8?B?aHg1TGxsZmROUGhGU2RXcDBYVXdiMkk1SXJLZytGaCtJYlpMZFVZNTV0dDBZ?=
 =?utf-8?B?OExSYmJaUWJLMDZxUE5Tc1hsUlBYUllKdVlEYW9IYU9CbzRiR0dIVDZ1WE41?=
 =?utf-8?B?V014M2N6SkFRejRhQnZaYklGWGJzMUhkWXczbHFRUkNhSVZ0d1lQSDVHK0Nz?=
 =?utf-8?B?Ykh6cmJLcWhtZE9mTXlBYkI2YjVHTmtzaTUxay9lMXl4MmZlck5NYTI4Z3Z1?=
 =?utf-8?B?NElleGFXbHplazUzb0h0TU15RE55MU9DMzFaOTNwYlVWS2tjV25ObTBOejRl?=
 =?utf-8?B?cVgyUHlUbE54Q2c4MkpRZkRxczJ0cFJCVzJqa09kOERYNGNwQzlLR0hMeWNy?=
 =?utf-8?B?ZGt0OU8yMnNFaGtOM29IZk41aVlEZFVtS0ozcktmZ29QdmZLTmlHVk5HcFVi?=
 =?utf-8?B?Ry9CMFZzbGs1anA0MXRSVEN4YjJEUmxMMUw2ZGc4cEVFdFZCUUdUZ2c4YXRR?=
 =?utf-8?B?aW93eHNvNDNGRFlpQklpSWs2cjNjU1FlbVdEMGdzQ1V0ODdrdTNmT0Y4Ykh4?=
 =?utf-8?B?RFNTMVIrLy9kaXVLbGR2RStDK29XWUtsdnN1NHJPemFERXQ4aWIyTUk2N2FP?=
 =?utf-8?Q?JKyEVwM0CbQWJpNc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce6752fc-e8bd-4bcc-c991-08ded1db3502
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:27:35.2091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ekTcDPOH9d2Ei9LZ1HTGpUKQ+jl7U9Ftwtijxr2g+kwLP8lX0nHPOEvTRP+gZ3t7bftjPjdrD3KZHdJiYV2qZSeuYn7A/Qo6RyABm6jEVLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR03MB8110
X-purgate-ID: tlsNG-ebf023/1782296857-4C78E141-6595634E/0/0
X-purgate-type: clean
X-purgate-size: 788
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,invisiblethingslab.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2B7D6BD5A6

On 24/06/2026 11:24 am, Jan Beulich wrote:
> Setting ->orig_video_isVGA to the specific marker should be done only when
> the VBE tag is present and the FRAMEBUFFER is either absent or indicates
> RGB type. Since the "video" variable now starts out non-NULL, this
> property was broken when in particular neither of the tags are present. To
> move back to at least close to original behavior, add a 2nd check to said
> conditional.
>
> Fixes: d5a73cdc6b90 ("x86/boot: Use boot_vid_info variable directly from C code")
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


