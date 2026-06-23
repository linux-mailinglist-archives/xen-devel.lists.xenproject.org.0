Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8arUALy5OmpwFAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 18:52:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD1F6B8E04
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 18:52:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=uLCd7FJ3;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1344437.1603497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc4Lz-0000RW-Mf; Tue, 23 Jun 2026 16:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344437.1603497; Tue, 23 Jun 2026 16:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc4Lz-0000PE-J3; Tue, 23 Jun 2026 16:52:03 +0000
Received: by outflank-mailman (input) for mailman id 1344437;
 Tue, 23 Jun 2026 16:52:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wc4Ly-0000On-9N
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 16:52:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wc4Lx-00GDns-M6
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 18:52:01 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3ab993-bab6-0a2a0a5309dd-0a2a4505ea5e-10
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 18:52:01 +0200
Received: from [40.107.200.34]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3ab9b0-ef3d-0a2a45050019-286bc822f0ce-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 18:52:01 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA6PR03MB7568.namprd03.prod.outlook.com (2603:10b6:806:43a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Tue, 23 Jun
 2026 16:51:56 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 16:51:55 +0000
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
 b=XA8u8/MkiBxMARpXfi8PI76W37bXxtcgr2dInKGHVFMRXc+gYyVmO0WCBnPzLRpQn37QDNT1tNOVBQfEJNAdq7svRNdrmFigiSS2k0nvdfKIjfOFk25DmUtwRvU5laeoGCO+ff4G6VzHGkIV7SfNKtdt86QxG6nhQIBBnEXdoxaOL8qP4vKEfwVZ2N3fbKcBSBX7Ln0qUBnqpvvAnWLuRmt8cES4CZOtT/YaIs63vXgBwkP8wOzOgKIZVvVYqS9v47YHMFwZ/sLnd5CL2MddJ+Ohk9RlQbRN25DnG0Wn1A0QvuO1QQFvox3hqka0sH0rFe1XVBg8GuOijd0K1EnZ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oypZs/qqbX9/vN7ZSpXmub9FJ6bvFsfvAGT6CrhxsFo=;
 b=hS04MKcwMDx+gHPaU4c9eA/GtVypWwI2Dv4csCwObW5Xj/zyiKZ509forsW0viLlxnROY/qd5obRgIcb2cFMatppxuf8uy7ctKfj2ba8NhoJZz2oqoBy3LO7FrDMm9rL1SjsHvdiFSX0tEciw3U6/ZPB7FySNIOvP3EgQ9RDc6wt9Lovv3RQr3ibMJsFWui+Dku4Gvj/2PkN7WQMZi5w5Za4ECUq1GM7LnSYS0aVI2j6mVImOQc677EWRi6gjvrnGy1Du6pZogtPhvfrg1hY79Sz6aie30vwSAbtk6WFft+ewrp/h4+3Eh4aGZLC4kmMbJTXGPlfwC2bipswKL9Uag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oypZs/qqbX9/vN7ZSpXmub9FJ6bvFsfvAGT6CrhxsFo=;
 b=uLCd7FJ35iH+Tt2Ptm/faCAQC31qvqwL+nnrhWSFwEhE+imMdHwB2HJ75YlPpoPoOOurbIIPc1A3O9ihfEDveJ1sM7cswMUXh3Tfc7NahzcqdcRBEmdryG3rf1rQsUUDCs/pPJJTJ2WnEuQF/TXIh3O1P5PM5hTTf2pJ2jRrPjc=
Message-ID: <ad645745-23f9-4795-aa46-8eb32e2f2fba@citrix.com>
Date: Tue, 23 Jun 2026 17:51:52 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/4] x86/kexec: Stop hooking NMIs with trap_nop()
To: Jan Beulich <jbeulich@suse.com>
References: <20260319122549.922724-1-andrew.cooper3@citrix.com>
 <20260319122549.922724-2-andrew.cooper3@citrix.com>
 <c2129389-cc61-44bd-a680-c75b05725749@suse.com>
 <8c64e93e-cade-4c25-b8e8-cd23028628e4@citrix.com>
 <2fa30970-f2c9-44a4-99b6-cf5e22910f26@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2fa30970-f2c9-44a4-99b6-cf5e22910f26@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0231.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA6PR03MB7568:EE_
X-MS-Office365-Filtering-Correlation-Id: 69bb945d-0dc3-4ab0-9e00-08ded147bbe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	JBUoDSts7u5FDWHLcxBW4Da5eMui0ZtuUPDt68Yzr/9T/X+ktNF7vqxxizJQgQgELijo6XGFPtwhXn2GQfOL/roFceA/g6FLZFf1Y4ikz9WHa9OutbUsOPm5jR/K4lN1ruOecDIX0LfYtmgy73z5wNhCIpkW0mIyE/PdQ9saFThW78WU6aAtm4VdS0D7w0aIU92i61/C7tC1ub8oKevRQgYWmZglDrS+aR2Cq1vEQ3DTDKsj4K8l/r6yEw7P55tJQWhMBkoiCLLuNkAjO7RslI5mRdfuvvZf/hVoeNOr9+3DOs1kQOsLTETb8X8HyFGUJyySjF5UC9hng+oT513wTE7y8tQMKGZqcb56nzQgFuG83zg5OJPCZiTBVZ/0hoIUycZk/NzcGYC/WGAcN6rTk718VQJI7zrnbLOXo57PNqiZ9LjVDZ9cEi16UY/T2EfMPm4xJvU/VJ98BWxXa6AeaURCAYbpFZlc2CcodCQOdWhZvci7NQDYnfvKLoYdSwaV0ctiz8frnRotyBqlTcv04VMqdZlr2/mLa3Q6RzP5NrqHuaicbDTF2/sjfiOujz3BdT74vijijmMsD0lEwXSLAzRY1dl0jTnYCPME5GnXXQVzQvepuobcZqloc3OJyBdxVbK7fxOPoecP+bGh/LIUU4hzY//RH9vFLmLuaqktZKY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXh1UlkrRjN2aWF2ZE84aFdxN3dBdk0yQTVUUDkwRVZMN1NmclphSGtFc1Vm?=
 =?utf-8?B?bEZZZUN4MzhldTM4K0krYXppTnR6cXBPQkc3RE45ZjM3Nk1FdTVzbGwwUkI1?=
 =?utf-8?B?dVhZMUIwR01VRzk2d01Jdm5pTkxUdmZia3BYVkx4Vy9RVHJFUEZYMVpYc2tn?=
 =?utf-8?B?OE8walovRDh5dk1YTmR3VWZuaVFwSXR1REFmZ2FPVUFFWjN2blA3OW1PWTFP?=
 =?utf-8?B?Tk9udndNWkVZN0xvMWgxWklmbW5vMkhzMjF0MXBzWWUyOEpkbFQ1S29QaWFS?=
 =?utf-8?B?WEZmaGFnaVRKakxpQzVUNmZBNjBrZnVxQzVkRy9tTVRIb21CSDJhSHpQZEc4?=
 =?utf-8?B?OWJQRlFFVVFUNkVuOTVpSzlTb0NuY2hCVkN3Z1VIMHBzRkV3YkxCYzFMUGR2?=
 =?utf-8?B?V25hbzgyZGViMVJreTBmRmQ1L1NycEc4enZLVlBFWlJmZHNaQWp4NWVQNVYw?=
 =?utf-8?B?b29zOHF2dUJ4N3VKSUVDdGxIWVN6WFhCWHVuOUNLNXFqalhIMjlQSkc5ZFhx?=
 =?utf-8?B?TEhKcWtJZzU1NVkrSHVCTlJMOUw3OEVvQitaWno3ek5ET3VMSCs1R0x3bHBM?=
 =?utf-8?B?WHM3NVlCaFNzdXgwNXlyeEJySndxekpyV3I3TW52Y3BQTXJud1dhMTcxMjB0?=
 =?utf-8?B?d3hsY2dqQXhLSlAyd25GL2Z1cDJOOTRrM24yZGpDRkJHNnhGOUlpUmRpSGc0?=
 =?utf-8?B?cUVHelZWZ0RYT094dkJ4SlBabjUzVExQeUhMVHBacysrODFDemVtSGpvTHg5?=
 =?utf-8?B?K0VUVzVyVGdDS1lqYUZZK0lHbmdVWllqeCtVRDJIZ3EzSDNtaU15anNJWC91?=
 =?utf-8?B?TVRJWk5nZnVFSU91Si9IbHJraWdWbGwxQTdheHg5ZFUxUS9wbkNXVVk0QStW?=
 =?utf-8?B?bEVYaXJWKytrWVRWMHNFTWdhYy9vTmVIM3hOdTlwSkRSQmd2Q1U2cFk4WEV3?=
 =?utf-8?B?VS9FSVpkaFBheVB5bUdTdW80cjhYT25xSWxrVWRyR0FMM2k4TGlFNFNwZERz?=
 =?utf-8?B?SnR0WnVlWHlYT251bEpEZjlNQTNoNjE1c3FFNFNyMVFPeWE0dUJFTTc3Yzhu?=
 =?utf-8?B?S3FCUTB5S3ZydGlZOTJyZlFHYkpWWW9vbTc4NnpITWs0a3BQTXliTForc1Nk?=
 =?utf-8?B?Zy9VQkYvb2Fram1ITzh2aTRZVGpJbjdhdEhJWUgwanhPY3phQVhKVjVCc2JX?=
 =?utf-8?B?M1lUd3ZEbVhIZ1ozT1hFN2g4eFdpWUdYcU5GTVJDc0ZQRW4vWDZtV1U1Nnhm?=
 =?utf-8?B?Z1RIcWhkY3k3NkEvck42VzNFRFZWb3RFVDZScmQ5aW41RWk5SGxaUTBKUTcz?=
 =?utf-8?B?VWlLenAwV2FGdFBFd2RpcU9KQ2p1MVEyRXYwZCthN2JqTnBXYUhhL29leDhk?=
 =?utf-8?B?S1Rsd29FVGVjSFFubGNmd1lLekM4K0c1NlNuMXJidGhOVzJQRFdKZm5sNVdk?=
 =?utf-8?B?NmlpMkt6Tm1qRCtKbXpobTFYdWJKVC94Y2dPc1dXdVZxY043eUV1ZlZvejdF?=
 =?utf-8?B?UnFvNkhYNjZqaVNEaVBKQzh4YVNkRkYrVUVydFBIUDBueUVHMEozNTdERHZy?=
 =?utf-8?B?TktmWnVnK0xLb2pxTDU4ZlBzTy9BVjVveHRKYnZueVZsVG81ckU1TzZ5M081?=
 =?utf-8?B?cExkekVQaE9uN1hCRFdFN2s2cjJPbkU0eVp3ZVF0MzA0V3VoeXY0UjdGckpR?=
 =?utf-8?B?N25SelhIWXlia1c3VVNMLzh0Y0V2SVlWYTZPV09weXY1N1hmd2x3UkJPb2NG?=
 =?utf-8?B?QVZjK05zR1ZsOHpZdHVoeWtjMEErQ1dxd2pMc0Exa2VDQUVrQ2Iza2pEb3JM?=
 =?utf-8?B?WXNtZFVSd0YxcGxiVEFCcjlHU3h0WHdZdmZSbzRPclEwa2hJbFJMcXAxZGlk?=
 =?utf-8?B?ZGZwbklXTlo5K0c0UEZLdjdDamN4WHFTQmJSU1RHVEpwVUYvc3FMZi9qc25F?=
 =?utf-8?B?VHExaUlobC9heFZFajZucUl6UzY0TkZPNkVBU2l2Y3ZaSWVvcm9oUzNDZUx2?=
 =?utf-8?B?M1ZacTh1YlUvTmtyOWNCNjJQVzZsMlpldHZraDlnd0F4ODMrQXozcmh6eVM1?=
 =?utf-8?B?THA5V2p6bCtNRnhRK2pOVkRmNldjTGtJanNtV0RpTWM1bkErbDZ3VVhXWTZx?=
 =?utf-8?B?YzZNNi8wc05IV0tDRlhJa2lKemt0Z3dsZlMxWDJvRlpLV3RQK2pQSVpNYkdi?=
 =?utf-8?B?RFFMNW4zcW1lVklybm5nYmNxbFZVN05lajhLcnBQcm4wN2hMWjJ2ZXlidlZm?=
 =?utf-8?B?aGg3YlVkZGRCWmdMOUpyWVdOY0o3SGxIMWxhTTNHdGRIVGpsZHVyUS9JeUtY?=
 =?utf-8?B?V1RPL0ZkdHpHdjVBZ2FxTHc3U1RyOUN1M1ZpdURKV1g5b1dvMEN5UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69bb945d-0dc3-4ab0-9e00-08ded147bbe1
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 16:51:55.8995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BH4tRjmokbh8ziGzM6EwASm/GGh15a0rBQrPqtjn03jBRHCUukh12K2E+iukI+GH9hdSyh45Q9YQVQNLRRrfJGk3MZxUM4RIk800si2X6b8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7568
X-purgate-ID: tlsNG-c201ff/1782233521-F75D7127-59612415/0/0
X-purgate-type: clean
X-purgate-size: 732
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:mid,citrix.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4DD1F6B8E04

On 24/03/2026 12:58 pm, Jan Beulich wrote:
> On 24.03.2026 13:50, Andrew Cooper wrote:
>> On 24/03/2026 11:52 am, Jan Beulich wrote:
>>> On 19.03.2026 13:25, Andrew Cooper wrote:
>>>> On x86, we simply cannot free the per-cpu block for any CPU that hasn't been
>>>> put back into the wait-for-SIPI state.
>>> Please remind me, is there a reason we can't put CPUs we have offlined (not
>>> parked) into that state?
>> INIT clears CR4.MCE.  Any multi-target #MC (even non-fully-broadcast
>> ones) which includes this CPU escalates to SHUTDOWN.
> Wasn't there a difference between AMD and Intel? After all the above is why
> we park Intel CPUs.

Intel is more prone to broadcasts, but AMD is not immune AIUI.

~Andrew

