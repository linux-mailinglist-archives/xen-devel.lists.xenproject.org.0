Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CCE645958
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 12:52:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456232.713981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2syY-000716-4X; Wed, 07 Dec 2022 11:52:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456232.713981; Wed, 07 Dec 2022 11:52:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2syY-0006yt-0L; Wed, 07 Dec 2022 11:52:34 +0000
Received: by outflank-mailman (input) for mailman id 456232;
 Wed, 07 Dec 2022 11:52:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2syW-0006Zm-9B
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 11:52:32 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20612.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fe06638-7625-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 12:52:31 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7564.eurprd04.prod.outlook.com (2603:10a6:10:1f7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Wed, 7 Dec
 2022 11:52:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 11:52:25 +0000
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
X-Inumbo-ID: 9fe06638-7625-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibFLcO6L2Nt5hN84WozKbD8lgmNGN96tzPqf9eLQhiBANGecRlzZ+nXGyWANH3+2zgBXUQ+hZMITLvo+QgipVT4lKOkQrVRJOLgW1RjzqHYwp1B+v1gULqgNOUZKaM3wKFXONXB/NpA0TMC0EjbIBwtJqIzIjSchuDrEMgiLAsDI/eeZehkhDQvI5n1IN0VWvQsUaTNNjABdd2Di2TqXUZtqVSU5/3MEwxUo+hiD1XRac3c6adi7azMBllvLC/KZ/N8blloYZj2RT7/9yyS5PAPNTuIJrfolCjNPVmHBz4LG95A0YZGknQDLlIeiGjo/MbIgcu2f/8pV2OcBX+yzlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ajysnE3BKNpAVI201jl8o5QZOBMmIPAaJcGcfOItTo=;
 b=U9v9lDJc0vlNm3ys+psGvuUDpQw2Vj5Rv1S/Dg/I36l10nJV/ry/RpuCI11ni2cZpF9xtqgQvVxlShJNNc41y5fDpF/1W+F7ERT1ao8thRGCb3X8+uQeHj/pHPzgb6i9DxFGYMRFZa1T/+5UNI6DctVE7f2Pn3eFuOcNUw+08AoGSylZjZUc2LPYYEgM5Y0EhM4bPl/nErnSu4ghZuprufwCOAdLoYHwqLJs42Bo0mJITkmB7dV0xgHFOQRIrBHCsWwVveFpiprTcy9+DzGEj01GgHESZpmqK9vcXd67emUsifMt2VcRQajO5K3sMac/fMgHHikafXKkopzKnkmUvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ajysnE3BKNpAVI201jl8o5QZOBMmIPAaJcGcfOItTo=;
 b=FVuLIUBnLC9tOwoy4CQ/+LH+OorjM8gn531cQAtBWOFjidJzrAPFt1Raae6Gu7QExDHMaWzuyA1PkC56xrjI4+39AbnD2R06xXHrj3ytgB6leuFD9hYmTN2MlEth8jGVDEZRsA93LKJnXVZSemZ/+pG+8UfG6zbV/BjNnckBVsXTpqUeIjU6LZCrvouutnMfJC8l4yzNMD3PF3thkZxuev9SDuZzMrNF4ezNot0d/ioQdZz9LNNqCGraIgCzN3zi5j2MLYSN8unj5nUlCv0cxCyr1PYOYSiyKOKJ6MB9ePgRCjH/D3CpEH4hFiF69GF+E338LiFWaAMHQ+SsbyRfwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <13a149a3-9b7c-bb8b-afed-2805000e9c48@suse.com>
Date: Wed, 7 Dec 2022 12:52:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH] xen/common: cache colored buddy allocator for domains
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: marco.solieri@unimore.it, andrea.bastoni@minervasys.tech,
 lucmiccio@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221022160837.8497-1-carlo.nonato@minervasys.tech>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221022160837.8497-1-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0196.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7564:EE_
X-MS-Office365-Filtering-Correlation-Id: 1609f21e-a4d5-4fdc-ea73-08dad8498229
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+FPlZsW5UmlcyNxoYaPh14TGaOJsacfCKGEhpeFA9V1EN/y5/PzhQCMF9WTysA7ApLNBmtqrFEl2WDuurfAR3UYSncP6XIMlnDxEdU4hR45BhYqE0MBX2sqLYIASIIMHi/6XoOGdQRWQxGUp7hYUHgRlqvCRZZ/8Njkr1BiKHFL6maJvVV2SA5Y5wxnPd69X4QGo5/N2c7sJy+IlyKpd7JxVBCK66q/a9tRVAFWp/7pzPtzg48HI0CGcPJ/z7Aif0PLF8UQPAfrk8OiKiPaTMo5+igMKPX9phj4ospw3S7X9k9AvrZRah5K4Ssyl3BTuHOogYrq/4t/MrGZfdjB/havq2oci0P/pTrRjV/ANsUy5Ac7FqZmsmNDHM0K5Un/ng0dOjFHKs7rXd6a3231RgGnFZ1J+LWKcIjJehqlyB8Xbo5f+4UJi9W7RnSJfBe0Ju9K3b6ltwI9WZTkh4q9O6gBs5YRe54LiPeaciMHGLDXIHJ1zWrySnRupvVBK8gpIyiQoBIhmRcYAJxTHg29+6DQlHXrwZvrw2s5cmlQVJcfhGh6dyiBka0ztnIQMTdW3oHrcKJimNOyCmZP2OCpiO/7vsUWBZ/zVFW8JqsRYECp1SX+zYG/Vg/TTn7mi4nJLlcg9HE9LhRZD6Fo0DKhalrVgkgfykvfPX30ggfynfCF9TRL3C+kikkyYKRNRpnyZ2ECDHZcumgOQENukFJyP2F+HNRSmYP2BPvWvKYk0wNH+pQlPOfmPMMMwvwBCQR8/9EdaykJHrduincYokit2xQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199015)(38100700002)(36756003)(6916009)(31686004)(86362001)(41300700001)(8936002)(2906002)(5660300002)(31696002)(4326008)(83380400001)(478600001)(6486002)(316002)(66476007)(66946007)(2616005)(66556008)(7416002)(8676002)(54906003)(26005)(53546011)(6512007)(186003)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDlDNkd5RlRBUGtRVnZEdE1NTmdzVEN0R1dvWWFhZ2k2QlhzZTJSSUxEVWR5?=
 =?utf-8?B?OEp4K0RYaHdobXd5cXVxVkFSK0hIWTJHZHBvS3ZPSEVHd3NIN3l3dEM0dGdU?=
 =?utf-8?B?Z09HSC9JSjJzcmRRSk1VSHIvdUtmZUVYQzZIbWpOaERtdFZzU0ZkTENuckhw?=
 =?utf-8?B?UmZ2dGQ4NFVwTzU4RHNSa2RkT2t4bVhwaStMV2FpN0lRa2pKWUNvL2YvWVlS?=
 =?utf-8?B?ejlKRUY3Y0cyb2VydVZ6UWpqZjdlVWZuYzhwc2lOT01JL0NTSkZCODlaQ0FY?=
 =?utf-8?B?dWVXYWdvVlc4dHZOVEdhUGQrTUZtL2xZNWVpcGxiNjZMblRhMmNocFFkN3Bq?=
 =?utf-8?B?dnM3MmFDczdtakdwbGlaWkNyU1IzQzVXZllXTzRqV1NZMlpqOFMzRk55MU1X?=
 =?utf-8?B?aWNnWkNaa3M2RHJudjhjWTNTaVpzd1cwWTJSVnNFNk84YkVsT09YQkgwZi80?=
 =?utf-8?B?UjR6NjFOZWgxdHdNNkMvM1QreGFuNTBpdlhNZmxlT1AxWDYxazBNN0RGMGdj?=
 =?utf-8?B?QktCMnc1WHFXVElaMjVwaXBvRktVb3ByS3FCaHdlSWFOdmpCbnJoMUxiSFJ3?=
 =?utf-8?B?TDBnZGlFQk9UZk45cncxSlBtNU56czVWNU1WS2tzR3d3ME54RG9VNWZSOTQ4?=
 =?utf-8?B?bDRmTWgveHNMb1kyR1BmKzJlZDVuaXZ0NXFnbVFVQlluem0veGRwOVE5b3pm?=
 =?utf-8?B?Sy8xbDBSK3VNWTR1ZWJ3T0MrS05icFZyamptYnFRc0dwaC9BdFBOVml0RCtu?=
 =?utf-8?B?TDJzRnh1L0tJWFlDclZxMkFBeVdqU0gvWGpUYWtNUHAyVEdQcFQwTTlDdnNa?=
 =?utf-8?B?SGc0bGVzcCsrU1VSU1lBZUViQmorc3lON29GdDRXQ2FQd3hKVllMZVJIQ0ZS?=
 =?utf-8?B?Y0xNUUw5STl0blllMm5ab0lyOHRWZW5YMVFEYkdVMHAvSkVtVnh1WVlnemVk?=
 =?utf-8?B?ZjBlZ2lVZkdCdzczS0Y1NU9STDh6SGk1aGwwNFVpZnY4SXBzaGpRUmlyZmhI?=
 =?utf-8?B?V3drdk1VVmE3cERuOEdaZXZ5OUExUFkzWUVVWVlDazlsYlQxSitxNmgzN3kw?=
 =?utf-8?B?S25DR1ljb1phbkJZOFJwVll6YVpSdGYwOWt6Mzd6OG9yV2YxektpQy9lR092?=
 =?utf-8?B?N0NzaURxRjQvNVVqSVVVUHN3WHk5L2xtR2VRbTk2bjJIYWhJemM5OFZJUDNv?=
 =?utf-8?B?cVp4c0NrOGZRS3pKbEF5dmxXcmIrM2VWcVVDRkdnbWMyTFRxaDc4SDlJTjNw?=
 =?utf-8?B?bm9COGhHQ0w4aTV5Q2xpZStiSE5hOXpSSmZpK0hMVzMyU1UxTk1YTS9PM0lh?=
 =?utf-8?B?UG14TGhha1dUcDVEcVUwNGZ4TmpSeVVtYmlBRFJkR0w0UWxzRHVrbjZUdGc5?=
 =?utf-8?B?aTU3SDQzWHpIUGdoaURnQ2ttajNDTjFqcFMvalc5RzVMVVlWL3RJdjhGVHFE?=
 =?utf-8?B?blRmZG1WdHBGQVY5aWd2UEMwODVoRmYyVitzNUZiMzBOVVZGV1BoMHlkVy9u?=
 =?utf-8?B?YmUxRFIrd2srUGVFVkRsVjlJNWo1UHRZd0xCdlVYMmJZSXBYa2FiWmZxZVpr?=
 =?utf-8?B?dGI1OWFyT2djNVpyeUhUVnc5ZDZRUkEyVXJYWDdFRDJkYTB3YXpvMDRzQ0Np?=
 =?utf-8?B?T1JpNG1nVkV4Vk16YlJsMSttbnM0N3pja0lVb1h0OUpmbmlwR2dOb0Qzek44?=
 =?utf-8?B?eXZrajkvKzdYVVlxTEVHZklCV2xITndFUG1wNjUwTGlCZnJNWkxVUnEwb1V4?=
 =?utf-8?B?Z1UxazdlWWJ0dzNWWW1TY1krcFY3RlE5QnZSbGlkSzFLb2hMSGdKdkpyckh3?=
 =?utf-8?B?L25SK0NpUXk2bHpuQ1gzRm5xR1cvdjJsZGxoRHBJL0FWN1BTZDc5b2dFV1c2?=
 =?utf-8?B?N2pBR0xPdnQ0cURnVWF5M3NtYUk2QXRvYzBubHU5K0UyV1FvZklYQ2N6QjdP?=
 =?utf-8?B?MFJ6THRva1A0d0ZhWmpBY2lwbThXeEdVM1NjTm5hS2ZJaHpQN1RLMFl1SXYr?=
 =?utf-8?B?OGpGZFkyNW9aRkJuNUNqZ3FjUWJBc1Y2S1Y3QzlRQjNqOGNJSFFtTENJUzZh?=
 =?utf-8?B?c3h3ZCtGNy9zdVRDSmJOSU5VRnNhV3VtbDFCVUx2Qy9lR0M1ZWoyWE1BTWoy?=
 =?utf-8?Q?YWMeCRaASbMlhiXHEpeAXNHSa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1609f21e-a4d5-4fdc-ea73-08dad8498229
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 11:52:25.6218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rHoP0YSI1Qrrezu89avvLRGrNqfm0dug59rmITos6FrFBdvjN5/+0AP1Zx17K/5/r8+q6dng0j3KBwT57OvBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7564

On 22.10.2022 18:08, Carlo Nonato wrote:
> This commit replaces the colored allocator for domains with a simple buddy
> allocator indexed also by colors, so that it can allocate pages based on
> some coloring configuration.
> 
> It applies on top of Arm cache coloring (v3) as sent to the mailing list.
> 
> This has two benefits:
>  - order can now be greater than 0 if the color config contains a
>    sufficient number of adjacent colors starting from an order aligned
>    one;

But still not large enough to reach the order needed for large page
mappings, aiui?

>  - same benefits of the normal buddy: constant time alloc and free
>    (constant with respect to the number of pages, not for the number of
>    colors);
> 
> But also one "big" cons:
>  - given the way Xen queries the allocator, it can only serve larger pages
>    first and only when a domain runs out of those, it can go with the smaller
>    ones. Let's say that domain 0 has 31 colors out of 32 total (0-30 out of
>    0-31). The order-4 pages (0-15) are allocated first and then the order-3
>    (16-23, since 0-7 and 8-15 are all already allocated), and then order-2
>    and so on. The result is... the domain practically uses only one half of
>    the colors that it should.

What's unclear to me is how big of a con this is, i.e. how reasonable it is
for someone to configure a domain to use all except one of the colors (and
not, say, half of them).

Jan

