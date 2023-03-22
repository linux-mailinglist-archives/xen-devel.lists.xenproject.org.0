Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C8A6C465C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 10:28:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513206.793885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peulf-00048l-Hi; Wed, 22 Mar 2023 09:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513206.793885; Wed, 22 Mar 2023 09:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peulf-00046q-Dw; Wed, 22 Mar 2023 09:28:27 +0000
Received: by outflank-mailman (input) for mailman id 513206;
 Wed, 22 Mar 2023 09:28:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peuld-00046j-RU
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 09:28:26 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe02::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3d1c29f-c893-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 10:28:23 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS5PR04MB9896.eurprd04.prod.outlook.com (2603:10a6:20b:67d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:28:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:28:21 +0000
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
X-Inumbo-ID: e3d1c29f-c893-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXDSgnS4RDD7V0+ufBUNqLQxLXeXyb0gfnVaj5imtNUrt43zV9tFWGArGsgXBvZJlRxcyZl3PmO97GGvgKXb6e4uCyDZZR4ZSM8oYYUBzhcEd9+TfwMeMUD1TWilsgk//3TjHYBJJWiLWO2IpR2liw2F58rfyRGdaNJ4D1X7adELZkzGHDTagPX6OVxjV1C3B2PerY8a0o71T9qd5fPrpzAyo+v3VM4BP3GeQn1jazjMPD7JRD1pHeJAG/zICxnaZj2glBkI0Qcg35q9PLM4/rLD/pERAa522OR1zJ+6kdOF9qt03cSbvDx4FYmUZESW4gOE2jlK/QcI2uEGgMGR4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3lh/XHrJ6mUqcRytNOoUcux+y7tpgfVkGIjWwByego=;
 b=hSzZKSYmizX8kd0xQG1rxFK+BoYPUqatq8ZHAnVnFJ9QEvnnSrHw6de3pod216MDYCotkseZahMKTOjrE9Rzfna8LfxVb7Wex/g77cmDKBW/g9q9/ipFuD340enHdAf8jzjSN/ryhwuW4sn1MALPnnDH6TfFK6caF2C9aousPnnc0OU3pMpz3FrKxc4C7BEIsBxjHqLcRZstuLbmtMVZWR/kQ/R8o8ptMqGf9K49xypMrXViwiVyYENIKtJtX2tuo7Pen5Nc88fPZSOyEKTCWL4wUMgayiwtB5jiEf4ozEZIN21u/iasKtH1m0rL1uC8SsG+O4nsU23l0zYtcoo3tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3lh/XHrJ6mUqcRytNOoUcux+y7tpgfVkGIjWwByego=;
 b=yKmqyYz+7j5UWJovoqVzMs8vRallz4PKkS65Y0epVSTc8BikVik5rojwADvwJHnmp9SI0zHTuikY/UITVvZ/Cl4q7TZMxFqz/UyL693a54wlUQQUd9Rpf7W5Dpiu/CkDb8zIyj7BKgsSJHIeENMHJmHmsv9hP/uLlIX3szBUCbo7FpboAR7Q/8C7MXAyWJMhGzBEOxi0VmW4JIGdUVhGTgryKc2M/eVFP9U3prVpvSMnXy82tM6/g5knf1ROIcw59CS7GA+oDkFaiyCssiLqoJJncJcbr3GlGANqRmyOZ4748dPSG2/mdEM6wcGvhIqfq9/YuhQbebYj3alPtMaeEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
Date: Wed, 22 Mar 2023 10:28:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 00/16] x86: assorted (mostly) shadow mode adjustments
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS5PR04MB9896:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d589a55-ccd3-4be2-0354-08db2ab7c6fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kq+Uk1pjo29Wn8XL/PmVX8ttVMturQHTsQyF5zFG491BorD3pZnz2IHxigmlLD5AZM7elzFIo5zWGzV/1L+wqkkveMxqpMMyq6YJfUikE+32ayviePLlr1lQJEr8xpoyHlG8ej9bV5OA5ANHxFzVC4qsodyJzaABCcQY5OtQCqJ1EU4vYiUkVrFGrwgNbvawes5kEqTVQZs0ApNQsf2Rzs3NoUwJFdyUtaGYNp7buemZfGFuoBceRwgBbcY6yxizYUT544uCJoRCPeULMA4HYUpSyY+E94ZIF2qRQbMR5oryQSPN7+K+nDy7qnA8wjcoyC1cAkwNmMIQNIaRK8tgD6lbMALMxNYWQ61+8NJ7A2pmsPwgQ8CgaqiH6isZBepybySD/oJGDCBlx0BLq3zgzTVYbuS3OFMvFd2fKXqYizlPspxAtuqMWECsw8i/VZT60ISyXiKcxQINuXhqXeS66j7PDYpXvGI8G98VEm71xES8ruTM9XPjGx0J3PsnHf8VbRx/iital0rOsY5b07mh/lZSX8aks0iEZ8VjZiAADtSx6gt4o6iP2Ity6PPvjFvJsbEndTQjtNWUBqS/CrNMHZwLcYbGqFTsROhZ2HlGHYmUO5WtBClOYs6jftnKXMcoDvRiStEhg1gN5nEEzPHhYErpLxyxmakkvQ5JzzZZTXhkIebOHYh90ptW9GRaJ3/u/GiQBx9fTM0WBvyrnZEbSmt+9Q3BR6EfUq3CCNrCbOs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199018)(36756003)(8936002)(5660300002)(41300700001)(83380400001)(2906002)(2616005)(316002)(478600001)(6486002)(54906003)(31696002)(86362001)(31686004)(38100700002)(6512007)(26005)(8676002)(6506007)(66476007)(6916009)(66556008)(66946007)(4326008)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWFicy9MN0tuRXdMVklLVVVDK3BvRDVnNFlWTkpmWm5RNjFQQVNaeTZUZzd3?=
 =?utf-8?B?RUdyem50OWxKQXZieFgzdlBrbi9zL2VnM25VVURaY2E0MlFTdGQ3SWJaVXJG?=
 =?utf-8?B?eEJEeHowWE41eHBDM01EZnJzWkZPaVFsV1hnekluZzRwdW9lZGNjbDUrbzdw?=
 =?utf-8?B?cmF4aUY0cGlXR0V2d2Zkb21IT2FuaG0zVG1kcVhQR29BSVZBeTV6RTduTjBU?=
 =?utf-8?B?dFo2d1FtWkhHb3hxcWUyenNQZ0x6dFBsODZFR0s3bWxlNHZ4S2V1N0FkRUxz?=
 =?utf-8?B?WW1DVGR6VEp2Vk5jSEV6VDc5VXNIdWJSLzByUnlNalYxVnBzdVB5bldVNFBx?=
 =?utf-8?B?eTJhTGpxRHZ5aDFORGxjWHlVRmNaa0lpWmxaNjBxdGhNOE52UkRFb3NzdFZ4?=
 =?utf-8?B?bmZYM0w0TC9TRjl2dTExTTU0Y1NaNVphbFByTExVM3dia2xXalB5SVJMYUZW?=
 =?utf-8?B?UWJkNEgwbEZ4ZHJsVWJEUCtucTV4OEdIM0JIck9GMlZhN25QdVQ1dy9FZmU1?=
 =?utf-8?B?WGcrSnFVOVl3TGVJSUlCS2ZkaXptLzc3UHJkSUJ2TXlzYkozRUVYaWFCclBV?=
 =?utf-8?B?aDVpTXlvMnVpS1pDTTE0S0ROcHdLWlpvZ0wvSk5YZ09qb2wwMlAvL2VSRThV?=
 =?utf-8?B?cXgwNTBBTUNLc2ZoOGhPZFJnTGg2dGFncW1kV3JCeG5wUS9OSnV1eW1IS24v?=
 =?utf-8?B?NFpSMi8xV2x3b3hya1dmQkxpZlhyNFZUV24zMnZkSXdkbXNvMXkzcUM1VW9y?=
 =?utf-8?B?S0RyWmpSTE45dmJCdFYwSnlHMi9QdlZpRTVaeElRbGEzdGtrMUk4VE9FUXM0?=
 =?utf-8?B?QTl5SEZRT1djdks0Mk1DOVlVbTI3bjRWRTV0a0lsM1Njd1huNUtIS3Y5bEpW?=
 =?utf-8?B?dXliYkhTUzhaT1ppdFpFSjRHd2JpTE5PRkp0Q2dwK29ZS1o0WGFpT0xvdnky?=
 =?utf-8?B?dk5BWXgwSUV4VUpBL3RFdGZMUXJoUEJlLytVSWRIUkc1UlVPTm9Ucjk4UHBL?=
 =?utf-8?B?bjFYWEc4SEthbHVVc0RSdERJREh5Y1hJZ3dyaitST2lDV1J2d1Y0RjJ2LytG?=
 =?utf-8?B?VEk4anV2N2Q1czdQSGMxUVN0cmptdVZmWk1TQ2htN3hEZ0lxdGlBMGg5Z0xK?=
 =?utf-8?B?cS9DUlpzVEQyRGMvWkhNVjdEQnRhUkRYV1BrYmVWRGZWSDhYNnlISStHR2pM?=
 =?utf-8?B?UDRXaTJsbzdDTDlDNTNLMUE1T1dpWVYwMGJiR3BNM05kQzFZMkNVSGhMVTVM?=
 =?utf-8?B?OEFBTll5c0F0VVVHdDRhaHNaeC9hVzd1dmt6V2gyeWpZb2dtV0d5Nkhic3M3?=
 =?utf-8?B?ZlZiK01ROE1heUU1anNpWk14VFZqeHEvMXFCY25FWWZETDRPbG5TNjNDMlB6?=
 =?utf-8?B?aXlJT0p2YWxUVUdoaEtmZFh2eG1URU9QbjZic0FHaWxlcm9uZ3lBU2ZVZW9C?=
 =?utf-8?B?MEZYbm5PdW44dWJvNFd6VmNOcDNJMUNTbmNzR1h3cU5WRFJlREpBRkF1eFFo?=
 =?utf-8?B?Rzl6WndKREJPdUV0d1FNeWp2VEFQNWl5eGVSeWxHdUJoVjVXdGp0UktZYVNH?=
 =?utf-8?B?SjdYMTdKRTdFaEZ1R1MvOTVwV1FzVTh4YzBmN0pXVGp3UU5oTm9iYUVDcEhX?=
 =?utf-8?B?bm5DMXFMbE9RdGRaZWdadWdjYmczTGJtOUN5R3N4Z2huNkE4QjdtVzR4U1NQ?=
 =?utf-8?B?N2N2NkNPeEZZdXB2K1UwL0tnTnY0ekJxbFZXMmo5eVErL3M0T2Rnak04Y29m?=
 =?utf-8?B?Zk5WYjMzMG44QTJDa2Z0ZnRjbXpsM0JqTlZQdVhxd0JwN2V4Q0QwQVFscVMx?=
 =?utf-8?B?UzlGcGd2MXQrcTZrQkJOcFpTN29VeGxjVGxRblNheXlMRHdTVGcxcGsrR0du?=
 =?utf-8?B?MTc4cndFeWYvam5CdnhCb2lReERPRENQZXVpdUtnUnpIcXAybmUzY01hUXJy?=
 =?utf-8?B?RE9oUmQzNEhkUUFwRTdJUEdTWFJJUnBVZnJVSTlzbnpUTm05RFdQalFNelU3?=
 =?utf-8?B?YXRQVEozZnJmMXh0MTJuYU5PZGhVbFpxM0gzdVA4TGlNUWs2d3o4Nmt3VGhG?=
 =?utf-8?B?VnkxVGc3elhqWEFZTE4wdEkvZjdlTzkxdVFsVTZ6SWpwV0FoeEFkK204ZWg3?=
 =?utf-8?Q?uX3ZwQU1Z+SgkO2nfKSZr3IRR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d589a55-ccd3-4be2-0354-08db2ab7c6fe
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 09:28:21.0380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJY63BLJ9XvdaLI2eTrJIjI+gbu5Xwjii/Eo90h0PfU1YaC7goH/t9PQCBz52BR3xfY920UbcbLr28NmXacUvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9896

This is kind of fallout from XSA-427 investigations, partly related to
there having been a more intrusive first approach. This is also the
reason why one of the patch has R-b already - that was a prereq for
the original approach.

Most patches aren't really dependent upon one another, so can probably
go in independently (as they get acked).

01: shadow: fix and improve sh_page_has_multiple_shadows()
02: shadow: fold/rename sh_unhook_*_mappings()
03: shadow: drop redundant present bit checks from SHADOW_FOREACH_L<N>E() "bodys"
04: shadow: replace memcmp() in sh_resync_l1()
05: shadow: reduce explicit log-dirty recording for HVM
06: shadow: purge {write,cmpxchg}_guest_entry() hooks
07: shadow: call sh_update_cr3() directly sh_page_fault()
08: shadow: use lighter weight mode checks
09: shadow: OOS mode is HVM-only
10: shadow: move OOS functions to their own file
11: shadow: drop is_hvm_...() where easily possible
12: shadow: make monitor table create/destroy more consistent
13: shadow: vCPU-s never have "no mode"
14: shadow: "monitor table" is a HVM-only concept
15: shadow: adjust monitor table prealloc amount
16: PV: conditionalize arch_set_info_guest()'s call to update_cr3()

Jan

