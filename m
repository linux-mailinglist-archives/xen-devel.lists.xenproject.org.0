Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKqiHjXg2GnHjAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 13:34:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CD63D63D7
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 13:34:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278805.1563537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBA7a-0007vm-Lk; Fri, 10 Apr 2026 11:33:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278805.1563537; Fri, 10 Apr 2026 11:33:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBA7a-0007t6-IX; Fri, 10 Apr 2026 11:33:58 +0000
Received: by outflank-mailman (input) for mailman id 1278805;
 Fri, 10 Apr 2026 11:33:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wBA7Y-0007sy-SG
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 11:33:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBA7Y-00FSpf-83
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 13:33:56 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d8e020-e002-0a2a0a5209dd-0a2a450784ea-16
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 13:33:56 +0200
Received: from [40.93.194.9]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d8e021-ba2d-0a2a45070019-285dc2095ad8-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 13:33:54 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB5099.namprd03.prod.outlook.com (2603:10b6:5:1e4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 11:33:51 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 11:33:51 +0000
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
 b=Qt8jNM0LilzFOB0mYTC0iQCn8QTa9e3nQXK3bC5tvroxKY+84gklh6gn+eh35FntQn90UAsyBtmvuOPnM5eczIoUJ6jbIcIzNzkOztFtmKTjN1i2mseqAz6W5JmT2ZWnjGjJUIX7shZjNxmNUOm/3lrLPVLJj3qk1vISCIPXZUD1f9SDxSMsCYLGy3ezy5m1P9TsulFPo+ISVnSti7iAc4VI73g5ypD7EjVibb2j7x9+viWytFzxxIdxjeLh6jmmc+BqEea1jUKMGdcnmwrR7uM2NXJGvyICG91qCYzvaExkMCMZi6eAIX89CeIPYywCW1qyTfUdyTFkBrmKizVCoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwL0SmSCSGloE7YDySNcg9PHFX/+SGsk2feI05qphag=;
 b=Y9Sf9yq12MgzLIY2XkHZfoqv6j/C/S2fsx38hMVi7qAXfHlEZkkLFkLwEgQHbzczJWDlge/52WHMzXvpoliue3tbImMkaED+cObxNhWfhgWvaihympcnzwCk49gbcijggYV+dAKDfGxcgsyc/dzeMC6KZPNiSluGBpJtetmTHg88ph+PPn3k4kQZiDeCQip/pEyOv6EOKQ1AURUZiiQPKK8iP9mwSmxwE4WVVkULQRgKhJfnym1oabcXcYrVUU/LOE+arxKuAT5iyuW5ddZb7JvsYWBQwc27i1zo2APfG1ljX960H+AQ4RiP9ImFo9PcfSH+uThz7KHFK/+YWyP7AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwL0SmSCSGloE7YDySNcg9PHFX/+SGsk2feI05qphag=;
 b=srd30EDQ+pHJYlIdMc7hFiSn3GYUBqrExwnoZ6O6/sCuVTtzA1RFVGwttFQEGqErITJYmYlAJWkYga6TxVVPadzbE0oDxEGAru9JV7/k05PZ38JV979VE7rH+ZZx6p1Rq4bHle1myO3NYXNEgThohBnP10hx10Mx17dCdVcdYEY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <09b58fe8-cc6a-4bc0-b2e9-ed2e76d19ed9@citrix.com>
Date: Fri, 10 Apr 2026 12:33:46 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Mykyta Poturai <mykyta_poturai@epam.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] arm/its: Decode BASER cacheability field before comparing
To: Mykola Kvach <xakep.amatop@gmail.com>, Jan Beulich <jbeulich@suse.com>
References: <dba15db692025c75f8bd3a2c5dab2654eaa4e896.1775801199.git.mykola_kvach@epam.com>
 <0c68ca5e-51d3-42ee-aa27-301ffafefc5f@suse.com>
 <CAGeoDV8OAiZL6d8+qs6T8bRT++H-tpY--8yhb7He1bMgVvHeUg@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <CAGeoDV8OAiZL6d8+qs6T8bRT++H-tpY--8yhb7He1bMgVvHeUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR1P264CA0118.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cd::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB5099:EE_
X-MS-Office365-Filtering-Correlation-Id: 13f54353-d729-4f15-befd-08de96f509bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	MdQSMLia1OYKvcOvAomjsI+Lf6raeud9XoSFOjX2iJWU5IKi2NGePA5S6n4fsbuDFegLZV7Vv2H6FlnA0miBy/50vT0osZWPCRzOQb6RMFjW3vNLIfIvo92wZF8/AzE/P7LSfEwqi6JlZnH7ADSSvGlhDdGMvOHu8nnnosc/VK6WACbO6kUMpThByzmJ41h+MwrHSRbQGo1dLrxW//8XoBPZfFTtoy6RYwzCpvYBoFCkGj3zetq4EYgEmX1a+I5rye9VBBv/nN2ak/+h5LFJtFl7H9xU2FKQ0PwOlxJeLGCG5O7fwNxEW3NfAHawYANKy7Lkcf3L4/geQjV2w010BQwaivXdiVmnx9GxoIhioOhlu5Qp4IblT06f8/rEqGayy3w4GoFHfpWXHvN4SGX2ghG4Z2ZOUAgGXV3FA1kKBgfABWafZ2SBKrVt/3aTh4Z+qW0D01AaTAO58+XCeCwEtvRlG6WBXv2BnRgncbiuRAiHZiOgcZ0QMBLsLIQNFjTNE+eVpGk9BPS9yaYqv5a2bXj9WsgIiwOF0o5pJAI0zNtyalkAKDhQprS1wsIeh+D7pA7jz+CeZE84NfPOKA0DDKpG2Qck7+Rg5deAuRm6UbMUSg7wZHgrFzh089aAQJewEam+CbAKjPgs/cTWdfZfoWCbspAPmA8zvlEKdLN08FtfyZBntQ+2GOiOHc+NX6ncJkSxuYnwCoPCpE6vOoIuCdU/niqKWS3MzK3OFQD8NHY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NU9KWjhydHYwMFNrUkM5RXl1c0l6bkJ4dkc3TzdMNG8weUI4Y1RBV0VDS1Jy?=
 =?utf-8?B?YWJXZ0dSemFXOVhpR2h6OGw5RjVGZDY2TUVuK3NzTE5PWUo2bjNaMVgrWWxZ?=
 =?utf-8?B?aHhXUFVqTlFpUmRNS3RpWEJFazlhRTdjbU9aQXpMcm1Bd1llQzZvZjV5Z3NC?=
 =?utf-8?B?LzFLa2xqZkdKVE85ZGdPMXJDczZNOXg2UmhLNkZmZmduMllJckQ1WWhBUW1G?=
 =?utf-8?B?Z29wS0djZWQzUFJZanhidjNkSHNHaXZRcFlNMVZUSDJmcGJQTUIvMzFkb1JY?=
 =?utf-8?B?Y1UzSzZCRldYZEUvbVBYMlI2WTJnNEF0eDNUOXdVdDFBQ1RjUTNrSXJ5MEJK?=
 =?utf-8?B?eWJFYlcvNFJpNUl5czNHbkdTLzB5VVN3MmxBQTlsSG96VjIyWFFQSHYrNmxa?=
 =?utf-8?B?dnVYVy9EcTY1Y2RlQk5jNEV4bFBib0ZQaG1qWkVDT3ZxakpsWFNOdEsrenVH?=
 =?utf-8?B?azZPOG9pUUFYK09ESzdRUkppZ1pVaVh2Q3RwTDFsZTlOY1pzS0luV01PeGpE?=
 =?utf-8?B?RGJCd3F3YVRPQmRyWVZRRnplZ3VPSGVsYlpqQXZMZDcrMVBxVEx5aVpEYWFo?=
 =?utf-8?B?YjN4eUlyMVdnMGNoOTNWdUU3Vk5RZUpjN0k4WThpdUhER3VFd2ZPZDVDalRY?=
 =?utf-8?B?NkFpWjdWV1E3TkhtRzM4ekZpN0Z2RFV0aVNiQTZtQmtDVC81Z3V5Q2J4ZmVU?=
 =?utf-8?B?SVBQeXdTdzY4U29RMk5pZW5OZjBPQ0ltMnFpdGlrNDhFcEwvcG1mTkt3S2s2?=
 =?utf-8?B?R2xpQ0x5WWJoZlNaa2dBTGhhckRVbWYyK3FGcFFaaC94MGlubCt4U1YrSmhW?=
 =?utf-8?B?b1dNVGZEVGcrMDV4M0wxUFR0N0lVV1ZaZWhNaHYvMjFjQmlib2FvbEdHdkxG?=
 =?utf-8?B?eXJqR3hsVkxuSnJJa0hxK2dxSjhxRDZ2Q1ZQZG8xZTMrcDk0Rlk0NjJGanFx?=
 =?utf-8?B?VGhlUVN6SzdZdEkxK0lsRWNlUWxpbmpuSjY1KysrV3RwTXpvdENxMCtiQWRX?=
 =?utf-8?B?QVNvRnN4RmRQQ0JpMzNzWWt0STUxenFtUFFrb1hiV2lMOW5XR3B5eTN3ZENC?=
 =?utf-8?B?NFlrUHRlRXRwRU5LK0JpWXNMTG5PdEk1Rm02Q3M0Z2hiMGljNlZHdy93enoz?=
 =?utf-8?B?dUNCcC9CcXhJSDR6YjBScUF3ZEYxM0pMNVE5VThMYjFTWVAyOEYyZXZqZnRG?=
 =?utf-8?B?Sy91TUZvcXdKdFcyK0tLUllJcHRhR3JHY3M3ajhpUDBRZlZiRWExZU5nR1Bl?=
 =?utf-8?B?M0VNVXU5TW9VeGpWNWNrRXYxc1p6SVFJVUlEWTdHdEtWb0J3a0hSdTZaeUsx?=
 =?utf-8?B?TmF0S2x2Z0tPUXZ0ODJ0ZFk3TjVYM2V1YjkzemVTSUlGOW5jNyszUG1yaGlw?=
 =?utf-8?B?YmdiNytDai9oUFI1OXI5R2NiVCt2akpWQkYwTWNPRG5rSXNDSWxVOHhJUWVM?=
 =?utf-8?B?NUhJbHhDaFROL1grdThDanlqdVhENTBwdzdlNFNzUEY3bVRtR3djOEs0VHRM?=
 =?utf-8?B?TlNuSnd0OUV4QnYxa0NBRkUrQ3g4VlVIQUdzYlBkZy9QQlZuQmRRWE9HRytX?=
 =?utf-8?B?dm52MDdpeWdMQzNMMDdmK0RMS0VSQ2F1QXJNdmJ2M3pVaTVDNHJjUzJ6V2x5?=
 =?utf-8?B?L3JJcERPczBSellPMGIvNzFkL0NYVXd1MHR5MUNyS1ZYSlpOb2lFeFpLL29M?=
 =?utf-8?B?TklsT2xYWXJyNnVxT3gzK1FseDlMMDlHaHJrek01NEV6ank3dm9LV29yVG5l?=
 =?utf-8?B?R1NqK1hZY1FYb2U0aUwrc3BJZVJvRDZsVTNQeG11WER3aUk5MWdKRTlIUUJo?=
 =?utf-8?B?YiticjJWNG1iMU1hVWVGRWpHUThCWUxVUm8xemNVOW1xY3FZRHFFMEdET04y?=
 =?utf-8?B?NTl1OC9yZVpVWW9PS2ZvMitPQllHank5SlErbzhVcjdaVlVyeTBCTDdrTVJa?=
 =?utf-8?B?Yllkd3pJT1BHRytjZ3hxNVQwUmFwSVdpSGt5aTZEeXdGSktsdXI2dUdDb2Rq?=
 =?utf-8?B?S0x1TEdRcjVBZzRNbTRLNXF5akJTYmRKaXp3UVovNG5QRWJaVGVVS0UyRGV0?=
 =?utf-8?B?K3BHZDNlUklvSGJjSHRIdGpFSDlDd2R1NnkwdVRSRDJyWkVkcTFDRk5QdDQr?=
 =?utf-8?B?U1M3OEZnRkNjN1NvZ2JTalB5T1pOUy9WK0ZPYStSSmp4aE1XOUhrQ3pJN29B?=
 =?utf-8?B?aFlTcENCZTFCNWpBTnRzNlNVdGVXRGtUWmVMbHUyWW9sZzZkejZINHFOV3lk?=
 =?utf-8?B?azRvMWVjMW9xYm9VZHBBQ2Q4eGdtVUc4NE4vdmZlUHNGcGM1dCtNaGJCVEFk?=
 =?utf-8?B?TWNPLzlMN0NsMGZpQVQyY0svclBvdFB1UmZ5VFM5ay9oaXI1OVJCMXBpWjll?=
 =?utf-8?Q?FSWLRbUzZp+2EL/A=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f54353-d729-4f15-befd-08de96f509bb
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 11:33:50.9481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZXRKj/i5hthNlP+JfCW6ZpDMFV4jDEJxKgi0WVhfvS8caewR4M/YgW5o6ORF8DN2kcvgQp3Dt44dVzYlYBTL8bvKBDMOi8VsFGRDRCARSv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5099
X-purgate-ID: tlsNG-ef75cf/1775820834-8BD4741E-62A6E9E0/0/0
X-purgate-type: clean
X-purgate-size: 1310
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:dkim,citrix.com:mid];
	FREEMAIL_TO(0.00)[gmail.com,suse.com];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:mykyta_poturai@epam.com,m:xen-devel@lists.xenproject.org,m:xakep.amatop@gmail.com,m:jbeulich@suse.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D7CD63D63D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10/04/2026 12:30 pm, Mykola Kvach wrote:
> On Fri, Apr 10, 2026 at 9:40 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 10.04.2026 08:09, Mykola Kvach wrote:
>>> --- a/xen/arch/arm/gic-v3-its.c
>>> +++ b/xen/arch/arm/gic-v3-its.c
>>> @@ -496,7 +496,8 @@ retry:
>>>          }
>>>          attr = regc & BASER_ATTR_MASK;
>>>      }
>>> -    if ( (regc & GITS_BASER_INNER_CACHEABILITY_MASK) <= GIC_BASER_CACHE_nC )
>>> +    if ( ((regc & GITS_BASER_INNER_CACHEABILITY_MASK) >>
>>> +          GITS_BASER_INNER_CACHEABILITY_SHIFT) <= GIC_BASER_CACHE_nC )
>> Are you aware of MASK_EXTR()? This is one of the cases that we have it for.
>> Really all *_SHIFT constants should be purged, as they can be calculated
>> from their *_MASK counterparts (leveraging MASK_{EXTR,INSR}() to keep the
>> code readable).
>>
>> Further, doesn't gicv3_lpi_set_proptable() have the same issue with
>> GICR_PROPBASER_INNER_CACHEABILITY_MASK?
> Is it acceptable to include Fixes tags for two different commits in
> a single patch, or would it be better to split it? Both issues are
> logically identical, just in different functions.

Multiple fixes tags is entirely fine, and we have several examples in
fight even now.

I'd absolutely recommend one patch with two fixes tags in this case.

~Andrew

