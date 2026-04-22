Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAmkGjG46GmgPAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 13:59:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0E4445A53
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 13:59:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290419.1570022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFWEw-0006XA-MR; Wed, 22 Apr 2026 11:59:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290419.1570022; Wed, 22 Apr 2026 11:59:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFWEw-0006UK-Ja; Wed, 22 Apr 2026 11:59:34 +0000
Received: by outflank-mailman (input) for mailman id 1290419;
 Wed, 22 Apr 2026 11:59:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wFWEv-0006UC-NE
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 11:59:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFWEv-00Ecnb-3m
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 13:59:33 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69e8b825-e002-0a2a0a5209dd-0a2a4505bb0e-0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:59:33 +0200
Received: from [52.101.61.49]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69e8b823-aaa8-0a2a45050019-34653d31b2f0-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:59:32 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB5480.namprd03.prod.outlook.com (2603:10b6:5:2d1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Wed, 22 Apr
 2026 11:59:29 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9846.019; Wed, 22 Apr 2026
 11:59:29 +0000
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
 b=uekD+EC73qBRAVBh3mgML3J47C06l9RGMDc4eV1gTsSXCnAE3lSmFlTIs1qu1nxRL0T3KqZhUZugQTjqrk2T3qodraYmRk3h3ZVj19B5oLBJo6/oMjLXimR25cpCOLmfKmdh8zFjSpVjxc3r3K4IWZdZaD6uXznLYPdTBHZcfAmZ+E3uzjTtIB3l0E1my8IcOA9Yf84EA6b6g4YMi5483N6DGeJIIvNE+UR6yZcPCT+pHIdvI/cuU7SZQeGQOwTbn0c/tL8olK4ibS1GCUrVdfl5GPgPRsOUKe3r0IWHsZBGCLzT4Y0k7OYFjFhlZsKma1YCEYLfNU1iH4T6AujJ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vz0lG9odJQg8SnoQqf4E0pd0+0LnX1UAlpptmlhug5g=;
 b=sb8QGuzQxZEZ3rjBm+pVby5yfXVtCCi26m1hx116nSZeT9qYXIJ3pQ3ZYEIj3NIyCX6/GcwagtNZBmU57LZgxxDpgTX+O4QAXi6nVHY49aox0hyv/0BUArTV8/6l3A5jRaySYnfVoqUbFZ/ffRP0IZdsRmoYBr7RiAEQtfMh/oBGz3E3zksBStFwLk7Er0dEztBI2HfOchygHBrSoQ96yfy6+031uSvS/hbuasV+orldi24yWdH8qSjb6TPaN1JZGoMCnW5AbpkcljsGEdQifA9DwV05/3DQ5vwBXlRHmx6uXp8bSG08CFWs0P2E2niKubgfmaHwkEyPDUn5u2GKwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vz0lG9odJQg8SnoQqf4E0pd0+0LnX1UAlpptmlhug5g=;
 b=fALxY3szKmRADhh3MAHi5DkV7Cfw/cfsHtfrEZdJubHFe25ou8Lw3UTGBkbXRmXJeM+S3A4Ihco52qADOzdVExLD6RpLZDJaBZTeBRz6Guv3cu9uSNYHuCAZbSJs/FG1ydoytoeFjYVZ8fSHLw+NwSfT+w+l+yNHd+yKEMP0Nrk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <77234acb-4539-4efe-9c30-03cb7a389912@citrix.com>
Date: Wed, 22 Apr 2026 12:59:25 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Bernhard Kaindl <bernhard.kaindl@citrix.com>
Subject: Re: [PATCH] EFI: adjust cfg file buffer freeing
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bf990673-83c3-44c3-a76a-3b0c36108ec5@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <bf990673-83c3-44c3-a76a-3b0c36108ec5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0357.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:37c::22) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB5480:EE_
X-MS-Office365-Filtering-Correlation-Id: c53a3075-55da-4dd2-8c53-08dea0669b97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	aQbPoZisxoOI/OoYxTSF4Uug1kcvnaFALsqBzIcxe519C8mNIzBn/yiFt93dRmCD3vFITS7DS0vbPfv1JzWNtI5Nk8e73TmJz7D2LN/On6naWgcsA2oOCIeTFS/tn/WBeeH6JpiWEXcAaTO4ise5bpUUx+VFilsw5SSZn5P4K1r6cJd9OZGN+jxBHIIrOpUlIRAe86B3saiZeOVLu3JrVOef70Z49Z3wSPNMyBlvPQulpNiPV0XWq4r2+EIOnzVl2kpgX2tznwIwvsjA3W0u/VBfsq4Axa5MDpjxqkdTswJ68XJAfqe2eCYcZx9eppHtUWguhfx2Z06EPHpRjItn92Pb2dVOSm3JZ7HAQoVY3RgZtJkWHy0IulxnzIWu2EytsbRiH7UZf3S4tmHxuI8Sd6O2TElq4qNsPbjDgV5QSRAlAOzoVflZDm7N0whv52oUAAst4KA0Z2G5j5/OE2v3JdbO5Ng5qRM3qKU+V0gg0mUf6VrkYP+my8quv9GlmCfSqxfn5l5a5MGx60IAWYCAgfWlz80z2RPdV/JWd7bdhrA1gCYwWHYLMEgMwSHIEJZxbohMOoWrddhirja5R8r+Eavjy4xUhZaDDbC3+2JZhyhUljVmk0k8Rh4ct44ksCjJCtbxi69NuKO9IbyELfMKdbAXs4LxeYvKzQRmDmHvLBHoa9JBRoA9J/ytwEXTFjOF3Y8PoK2f+yyVrwrydnf+csoWmoFqjP6pPwxZ+idydld0hqNqg3tKSvxY0l4B+LPk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnhHb2lERmF5K0pjbkpEQkk0YlViRlNTaFZ4M0hES201b2JxMHExZk15U0Uv?=
 =?utf-8?B?NXJnSVU2cGp3RE4xWEZ4K3p6VFZhSzVuOFJtek02TGhnSW1vYzB3Z3EvZ1Ri?=
 =?utf-8?B?bEFOUm1LNzJvZVFNTTd0bjhZWGxDYWdjZXhBQm52L21hWmRZYTVNbTBTS040?=
 =?utf-8?B?TUtlNGdXek52TWxDS3pRR25aOWpvekNvekJxQWRnTTB0NHJ1Szg4bGRiWTl5?=
 =?utf-8?B?Q3VwYmtKNGxndk5SYXZDS1J5ZWhzWUFCTVcwMk5kMis1VldMdUhIMG1YMFRZ?=
 =?utf-8?B?Mmh0aWxsTWYzSU1qajQ1S0tlZ1VVWXZkd3UwUUcrSEVpYjBWZ2pVVEtvVEsx?=
 =?utf-8?B?dXByejI3VWR5N3BtU1FGVzEwaE9rN3J6TmVMbm9rWlc3b2wwRTZlL0tNZHUv?=
 =?utf-8?B?NllEWkgySVhNRWlYMzNPaWxpZHdIWHNUc3JMT2VqanVtbFZUYUhKdHQxZS82?=
 =?utf-8?B?QWVWQ2JlQVVzR0VHdzJqUjB3aDVDRjRpaldsTU9NbHlzVUFMQ0UrMVNiVEl6?=
 =?utf-8?B?dHIxV25HQXVIQTFnZ1pKaVJlV3FDcnZoWkl2b1krQ1RtY0M4WUd1bnBrazlv?=
 =?utf-8?B?Z2d1V0ptTGhJZVZQc2Jkb1ZlcUhRN2Q4UUYySmJzbzVUb1dDQ2hxU3NSYjQw?=
 =?utf-8?B?YkhsMTQyTjJQd2hYcEVMczJzQ0tDU1llMjhxeDlJdXN2REJ0c0FRdUdBSGh4?=
 =?utf-8?B?Uk1US285eE9IMy9uVGtmNWtHWG5ndUQ5ckY1WVpZNXdLcW5VMHgyeE0rbklJ?=
 =?utf-8?B?UHRKQ2drWE1ZaXpyeUJFWHg0M3Zjc0dWVGgwRi9ZaU5jRFMyaytLdS9vTUVZ?=
 =?utf-8?B?QUlZYmVlN2lLZlBkLzhMZzVyUGJCNitVTWtVOWg5eG1ZSU03WkJaanlDdllK?=
 =?utf-8?B?MmhVeXhGeGRGajVCWld4ajZnRmZmWjZZbytPTDU1dkVJdmFRdFdLRHAya3ZZ?=
 =?utf-8?B?MTZaQ2I5VU1rdmJTNmdHaW9HTzlyRk9wK3h5bFpEejVMOTdKS0o3WE5BNFJE?=
 =?utf-8?B?WkRscFhPZmw1Kzc1d05WU1V4SThVZ3czcEtURnFpSk5PeDZsdGRsdCs3V2Nr?=
 =?utf-8?B?YnZnZWNEUThkS2FNWVJmMGtQbC9uQTdSZ1JNcjdXTkxRY2lvYnpXTmNWY1RU?=
 =?utf-8?B?bzMwSjQ3UmRucTdrWVZIK0U1QnFtZldIek5UbUVRaTBQZjBFb212TEUwQUNS?=
 =?utf-8?B?Z0haS05xRCtHaGNCZTRjVktrM1dGYS9WSEF5dStIc25QL3FPeE4weEQwck5k?=
 =?utf-8?B?L29kSjNqVFBFeEdFcmxVc0ZqZUdSVVVHciszMmtVMEpBYjRlRHN3Tm05dU9s?=
 =?utf-8?B?YmhwWDlIQ1liZ3BVZXBpNWszVEVISm1lK3Fxd3BUNEVSNUYvRTE1RkZkb21q?=
 =?utf-8?B?NkVvWis3RXI5YjFUNHQwV0IrTWNkSHNmQlRmZk1Ia0tBTkN1SFU3RGpMOVVr?=
 =?utf-8?B?YVMvcVh0OThrdkV0bWdzbGtuTm1vN08yQ0xkODUrUnlDV0Q3VzROeEpXM2F2?=
 =?utf-8?B?USsvb3FDSTB0alBycVR5VnFicTZxSEhjR3h0NWhPMUJEekk5dFBPQUVCVHBi?=
 =?utf-8?B?Sm12TFpxYzZIVm54TS9saFEzd0MyQXMxSlVrNnk3QlhnVmF1bWhPQXlLdHE1?=
 =?utf-8?B?OEVlWndLd2xmbXdrN01PM0lySHVrUldtdUpCZjVLcnkxaEVUVGNZL0JDMGZn?=
 =?utf-8?B?Z3A0TXJQZFQyYWkzV2dVS01VVkFvY3VLOFBKRTkvcGNmbVVzMEl0OVZjRkY5?=
 =?utf-8?B?akswMC9OdDd0RjBQTkNXWm1PRitkcHVydFgwVkRqbExqNGJGRTRMMjBkUENC?=
 =?utf-8?B?ZDRIa1JqdjJ4cmwxVmI4MFdMT0pGckh3QStmRUY5dkpLVGFxNVpwMUpXc3FI?=
 =?utf-8?B?TnZtL2IwY0xFT1lLRUtYYktMbDJaUG52Ymk2Y1F4T044Y3dHYkMrUk81L20y?=
 =?utf-8?B?SW9nLzE5U2pOUnpPZXpYcnBpQkN5VXRiZ1JmR2RKNU9vbmg5dzEvMVhUVlRr?=
 =?utf-8?B?clRQZlZkNlJqV2s0eDRWWlljeE9RZUNqcU5PODh2UERHb0tUOTdnUE5VNFpw?=
 =?utf-8?B?dy9mYnRMTFYrbjFWQ0lvdHQxdDJsOGExNjVjLy96YmJkT2lyOUVuRW5ORTZH?=
 =?utf-8?B?ZGRMMjNLTjdsVG9MNjl0SjIzUlpkWEdpMmdpTkh6MDdPSlpBL2lGdUpINUp0?=
 =?utf-8?B?THlrYThJYnJoNEh4VUV5amE0TVVtU2YxdTBEQjc4MSs5VlJKQUdZcGZqdTlz?=
 =?utf-8?B?bHc2emJuQ0xlT0R5ZjRUSVRzRTRxcS9mSVpKMDlhY1NiR1g4T2R0NHVwSXFw?=
 =?utf-8?B?Qk1HL1c2ckJpMkg2MCtBaThpb3FyajUwalh4MjdOWkhyU2tLSHNNYU1rRHNh?=
 =?utf-8?Q?hrwxu1eRJYlLszGY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c53a3075-55da-4dd2-8c53-08dea0669b97
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 11:59:29.2421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JFsQc5SzRFxZet3uaMlzHFR1eQcjlTAESefT+sb7rNEJQxLez4hf4h1cZ7jcUCdvZ6S2BhVxU+Z+fy/cqxCy18fZf7aXo1s1ngvxaOeoB0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5480
X-purgate-ID: tlsNG-c201ff/1776859173-E87AE443-BA1D2CF2/0/0
X-purgate-type: clean
X-purgate-size: 1097
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:bernhard.kaindl@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,citrix.com:mid,xen.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BB0E4445A53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22/04/2026 12:51 pm, Jan Beulich wrote:
> The boot services FreePages() needs passing the size. Since we allocated
> one more byte to put a trailing nul there, we also need to bump the size
> passed there. Make a small helper function to centralize this.
>
> Note that there's no permanent memory leak because of the oversight: The
> allocation is done using EfiLoaderData, and all memory of that type is
> later reclaimed anyway.

This depends on -mapbs at a minimum.

>
> Fixes: df75f77092c1 ("EFI: avoid OOB config file reads")
> Reported-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This is an alternative proposal to
> https://lists.xen.org/archives/html/xen-devel/2026-04/msg01044.html.

One thing this patch does not do is fix the boundary passed to
efi_arch_flush_dcache_area().

I find it hard to believe that cache maintenance is actually needed, but
given it is present in the code currently it needs to stay correct.

Or, if it's not needed, it should be dropped in a separate patch.

~Andrew

