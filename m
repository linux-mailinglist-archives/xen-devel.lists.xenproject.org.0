Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dcflKKSEQmrW8wkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 16:43:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC756DC2F6
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 16:43:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=Aat1Kx9R;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1347642.1605477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weDD2-00085m-92; Mon, 29 Jun 2026 14:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347642.1605477; Mon, 29 Jun 2026 14:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weDD2-00082x-5p; Mon, 29 Jun 2026 14:43:40 +0000
Received: by outflank-mailman (input) for mailman id 1347642;
 Mon, 29 Jun 2026 14:43:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1weDCz-00081T-Pi
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 14:43:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weDCy-003zYB-Qu
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 16:43:36 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a428493-e002-0a2a0a5209dd-0a2a45028fac-10
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:43:36 +0200
Received: from [40.93.196.6]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a428497-5a27-0a2a45020019-285dc4063579-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:43:36 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5631.namprd03.prod.outlook.com (2603:10b6:a03:28d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 14:43:32 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0159.016; Mon, 29 Jun 2026
 14:43:32 +0000
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
 b=kQb5ppvPtNO3vh/dGv0EDEBDQ2m0gwWrYVoMZNR4JW9YO3TotfWNSKxmdp5K4xWb5iHcN7O/WMRbXaaK8bbB5KAWQTBUoEZElWdAcqbPwj9UlNJ1bAaxIAOdHnQxsEr0C4CJmxLKUeuVOwIWL0g/3fvU9DDbsvo6Q9y4CAxx0sjE6xs1C0ODR2a2hux/tKfDRXFjHeHLTzbjJh4MPwCtyLVQRg/oyIIDbyGXz5M0R2giV140JKBTybE2nEDwIUzICcEMDK7h3tAR1zLAYVdf3XrNpGgAy1SOhlBWnaaCMTUq8WVCHWmWUzv5V4GpsoA5ETgiGhDmn63hpHBlS58vQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qljx5bOqSc7BsXTlAaebfc2w9zMP1CPW5NxzdU3RgY=;
 b=vPIqkPU/RNFRVK4dalvQ5O+l58O1O/nzqwhh067JSIF3U8v3Oac7Q9cFHEDayjGHOnvYhHAwmYm+2z8KZFxPcjf280X0Tt+CuOXF60gE2wLe7ji3vEUkyL1MmVj33cyWIMDLw8wsUlU0555sRURUZTYuU9UbdWpyx28gBiOrm3IG07OaeMUGjAyqdouQGU4uglSMi6XDMC3dcUMNaV5n/eJUO62f006t1No738DRX+Lq7q4WCQD+Tbe9omeo8SpMCdz/HqGCCPYvQ3krA7h/ZPG4MhysqZYtKDPdgXSTfaYqIx/tqCZMoufcUQdwd7UYiA/8TbYSMTpgY+pqnYjyCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qljx5bOqSc7BsXTlAaebfc2w9zMP1CPW5NxzdU3RgY=;
 b=Aat1Kx9RGA1q4V3AcBarT83FEEd1vvD1utP1B/lmonaZqGoLabvi7yuA+dMLnyvG/7xD7a1Ed/XtuHilJg/9CEkNd6zcjGWlCxINo87QhCPh4XoxtZ8L1GUekVUfKo9bwArLD3A+EjtrVOnkgUGxy0cOWa/iqSkTDa1xyYs950E=
Message-ID: <dc5a2e4f-a3db-437c-b591-62ded3def23e@citrix.com>
Date: Mon, 29 Jun 2026 15:43:28 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH] domain: domlist_update_lock can be static
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c511b3fb-2bf6-4739-a3fd-114976b77cfc@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c511b3fb-2bf6-4739-a3fd-114976b77cfc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0019.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5631:EE_
X-MS-Office365-Filtering-Correlation-Id: b91aff5b-4d61-4116-0e26-08ded5ecca53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mVHO+4lFNzWnhhbiWtWgr0LIv2e9hyH60nXkuuFsINFw/1/zQeeAR9N+RVdc9WWfPGaQ5QmaOV6gejvUOw6MLdmGKWMmIXW/Qc5ce1hyzg3V/g8mNHva+JSqRP6Fnou407R4mwhf691pnIIYlZwNLZlPo3Mcf3WwMc6RlE00OElXeL32ITox0jXs0UCtw/qS3mmTauKVXZPQ9yHqM6Tv46WXbNRlb6BwaSEpbDYBQ4Et+r36lqU0200EQU99kAq8cq6sCXXX3BDZNoTigyDsQOtNxLE8hg3tzlkQPkTK+RGNkjy4NZVx1KD7hmb3mSMZXnKoyHmGC5OcvjOrbjCKR1jGQcJGnSFYXlUXU3rGN4xd8EhehNfGTLLhpJNGunBiatOEn2HpJMN6FCi9sRkzYZPiH59RCzr9NYi4Zeq1naFHWPdxTc8fCloxuDKi0bb53qM+dwvXk9I3ANfnT2YKVVbK9VfBR/bysx+e10KNgFcuPMFAA9bOQQ/ZX84JYvPo902Y1xHdEg/fwrUJ9CT75bA2icjjiX0/OSFOomj3msWRnuCMJL76xy2t5GO3Ue8ILL/1RWLeMEPKSqUGcm1XPVRkfHh/LbzIl3LD3c3jVTK2pIuiWuheM16fQLNwdwCjYUrtd9//apSl4fX1f3Mn2qRf1XwhAiu/8ZcKqH7AGJg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3NYWE9HNFhzTW56M3d0Z1JVVXk1Z2djemhHY1g5OW4yZlJnRmNDV3hlcGp1?=
 =?utf-8?B?bzdZREU2MVRkUHVxaWg0OHlmL0Q0cW5hYmRxYlR2NVVlNlEwdjhCQzdJN2l1?=
 =?utf-8?B?MWh3aXFUaEdYdXdqQlF0MEh5d1dTZnNHSHpuajZsa2dSdTNBQjc1d1hJS29N?=
 =?utf-8?B?MTRZZ1llWE4rMkhEZUc5cnovbUNadTQ4SDl4MnB3eHhma2V0TFhuY2l6V2lN?=
 =?utf-8?B?MGNZbG9naWFCS3ZyVDZqVG5zTnhoNXFCZDRtaStxdGxsL2ZFNVlDZEh1bE9q?=
 =?utf-8?B?NXM2cUlxZjhYZHF1endEbnNLdk5qV3JMU0hTR0ZOdExYbzB3ZGhPL3RGV1d0?=
 =?utf-8?B?amJhQjdtd0pwNjJOT1p4NHh4V2hQZlE1c0w1anowOTZPWlJHSjNoeUxDWWxG?=
 =?utf-8?B?RUxPbkZ2djQzQU9TVHZib0VCN3Y3VllwK1I5QWVEOE9GamVFMmxlNDhzLytx?=
 =?utf-8?B?aGI1Zks3cEN0d2dkazRTLytZNnRWMy9vdkQzZjdvcFFqSUY1V3M2d3c1QTFy?=
 =?utf-8?B?L2N4bWRESjAvV1MrYWZmTzh4TnRXeXNzYVg3a0xNTkpwV3U2N0k3OVQwT0NZ?=
 =?utf-8?B?UU1SS2lremdlOWo3WC94UENDTmdXUDUvNWo5djBkSUtERHdlcDhUZi9ySGRR?=
 =?utf-8?B?bDRxZVZEdGF4Vm14bkZkcVJteTZzUzJZUzJaRStCa2NQanNrVXhlMDVOc3Nw?=
 =?utf-8?B?cVpyT2lpbmhLTlNjZUxEOVFvVzhwUVo2SGxuM1ViOHFNRHQxTDJsd0Jvd0hj?=
 =?utf-8?B?Y1UzMTJ5WGpheVB4a3ZMaE9SVlRsWHNqdE4ySVNVNEx3dXYvWGdaS3dFNXF6?=
 =?utf-8?B?YUo2Q1NJVlpYQnpUbFE0ajNibHRrR1RuZWoxQnRjR2VnWlhRL1BwZDN5eDdJ?=
 =?utf-8?B?ZjBHdnVKTFBxbnYwZjRlVHZWaVVvZ0ZvTkJ5U3VUSHBUTDY4azF2M1FscEJT?=
 =?utf-8?B?QVo0cUw4ZG9xNVcvc3VjaWxlVlgzckQwQjN6ZGhQZGN0b0dpenYyZ2duTTNX?=
 =?utf-8?B?cmxmOFl3TjN3MWtleWdRTDJpNTBDcU9XamVwak13TkVxYm1MTU1YL21DL0Nu?=
 =?utf-8?B?L3plRnFzNUZwVk9rb2J1eXZTd2doRUt3d2drYVJXZlJnNGtPWVRqcHM0ME9L?=
 =?utf-8?B?alhsRjYwaDAyWUt0NC9YTEtWR2lOZEZZSFhJMjdMS0JmTWozeG9OeEs3TFdS?=
 =?utf-8?B?NnQwQUVibWIwd2hiZm5aMmlUaFRyOTBlSnJjUW5ud3FYRmI4WUZGaWpyT25N?=
 =?utf-8?B?d2lRRUg3ZjZyVzdCa1l3azZYRGxCWTlTRDVtajJYcHEvbVplZjdpNUVvQlRX?=
 =?utf-8?B?a0QwTFFxQ2VGRVM1UlpSTkRQdDVMK01iendVMTdxd0hra20xZTF5OThKSFZE?=
 =?utf-8?B?NlB0K3NMelJSY08zbUtOYklUcHU5RWszVXM3dVFNRDNPTWsvNGc3blB3eFlE?=
 =?utf-8?B?WlM2ODRwanVUNGxhZTZrSVZUdGxDMnZOaGxGQ2pQaHRLTVFhSEhRTTRXTUtB?=
 =?utf-8?B?YWtSTCs1dnQ4dkhXSGJtejllbGwvTWxGM2pEdXZmVVJWK2JieDdZa1hRWTdH?=
 =?utf-8?B?M3d6Mkh3dy9IT0hZc0Z6QXRORlFPWnZzaGQ1RlZRTEI3cHBJYmYzK2JhVzFt?=
 =?utf-8?B?L2NJWm1VemsxT3czVHpMZHBxTFdPb1l3SHBnMDU2alVmWFVRYzlrdktlMERh?=
 =?utf-8?B?cjVBRUxOTm9yUEV0bVJqM1d0VHJNdTBWa2lNSmROc3VydlVGL0FvWi94eWJK?=
 =?utf-8?B?QkVidXdWUVB4NWlwYWJla2MyaXRkQTliLzdjQjhBa1pVaitOc0NFK2dQZTN1?=
 =?utf-8?B?anl0MFllOVBEZzBQdzdIVUNvaE1MOHErd2drUi8zUXJqRGJzSWYxZXdqVmNV?=
 =?utf-8?B?OFVQTlhuazF0cjI1TmxJMzJ0WjRsWUFEVmpDeWxYZlRKalpmczA5VXlNSTEy?=
 =?utf-8?B?ZDN5dnI4WWQ0S3VCWEVoRWpEMGtzVnhYOXhqd3NiK01HVUk1eURkVVZ6S0Y2?=
 =?utf-8?B?b1JhbVFPSWZ6Tndud1h0YUc0WmoyQzFITEU5R2VhSjN0QTMveDB2YzRCdnZC?=
 =?utf-8?B?TGNmZVdWY3V2OVpKRktJUGZBcGQ1SGE2ekJYN2dEcTBrNC9RSjU4aEtJdFF6?=
 =?utf-8?B?Z09icmpBNmgyUGlGZFBEb0lWcjBudzRmMVQzYTR6YjdCcjhtUlJWbkFGS3dZ?=
 =?utf-8?B?QVRYaTBabGVaZmozcWlZZnE0UlczM0tQYVUrSEJEZFBqc2lYeFBrZXU2M3pa?=
 =?utf-8?B?YUN2a0trd0c2eXpOenBMenlnZUdRKzNWYWxsTGdxU2lWN1p6U0NmdHZuY1Jq?=
 =?utf-8?B?dTFNSk1iRWpCVVVYdEdNeEJhN3JTczF2MzhFK2ZUY000OFYyQzl1RTNFWjV6?=
 =?utf-8?Q?L+NKq5223iVTTY2M=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b91aff5b-4d61-4116-0e26-08ded5ecca53
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 14:43:31.9577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WHPHJHd+Q0cS/wa42avTOr4VGRnAj84GT1XX3O/pg1cuE4/kclOm09xZmBCfaCr+O1srTWsbS+CiZr9HyWyHS3y4fjvhHIT+AlUN2iXvDR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5631
X-purgate-ID: tlsNG-720697/1782744216-7771D7C5-89CAD85F/0/0
X-purgate-type: clean
X-purgate-size: 348
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0AC756DC2F6

On 29/06/2026 3:05 pm, Jan Beulich wrote:
> For a long time (if not forever) this lock has been referenced only from a
> single CU. Misra C:2012 rule 8.7 (which we didn't accept yet) wants us to
> have such identifiers non-external.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

