Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 637DB7AFB2A
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 08:35:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608677.947320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlO94-00028e-IB; Wed, 27 Sep 2023 06:35:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608677.947320; Wed, 27 Sep 2023 06:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlO94-00025I-F0; Wed, 27 Sep 2023 06:35:38 +0000
Received: by outflank-mailman (input) for mailman id 608677;
 Wed, 27 Sep 2023 06:35:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qlO93-00025B-61
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 06:35:37 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2080.outbound.protection.outlook.com [40.107.7.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ff179f4-5d00-11ee-878a-cb3800f73035;
 Wed, 27 Sep 2023 08:35:35 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PAXPR04MB8318.eurprd04.prod.outlook.com (2603:10a6:102:1c0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 06:35:05 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc%7]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 06:35:04 +0000
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
X-Inumbo-ID: 0ff179f4-5d00-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CaztjUmeFhIgO1OU+rmeTXQPyvEA3Vg2LFpVk8wUY1XxJpbflvW/tJe8FADmJ/d6L1jzD0iTFT07cU/aTZXo3SV6oqLOUoe/hRjUOzA9voC1LUdbFjCPgwEK04YxS8J+2k/UrH1BO8gUz8gLE0ttEwYPv5OvWr+U4eSP+rtHN+WpmbNuTBg/qW4ogeGAHIOdCKScArHNKqLxS5mXI+sncmCz6EEgzd/dRRkVHfBKu34m1t5fU4Uwu8oYH74ro4tX56ZhmzFujRPqgRsJtEhz3S9WJt04/V2XG0uSKgewDr63PDOYDufcKaTELVEHTvd+QSiC1i9vOLN99m0wpISQ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqbbxxy3xLCuegXMkZW9sQ30IfNcV66flQsHopV9nS0=;
 b=bS5Q0ddxcZ1l4938WjCSSntwd6zKGoBums0jZA6T6DDn02TIeuPQC27jzsbY9s0VzZaBZPxlks9A9vYj17vnJJctTP/8fgnE7Hir6xoYyvGj6DJ87dBEBa/13sqoJaRof9ZLtdzH/atZ5Mu7d6/ay6hxIQ7mJmkTLwcZ1/JYAm0+fap4qVEWRfcMIS24Pyk6cP23SZ7tBFXb0i6hV7/Vrj1VIFj7TGKAI6A5fRtEArG0ufExvsODIfRmk4CZuFnEcB+vT2b5KvHLemrbyvqry7tBVVZrpVVC1CW+jDZBU3+YKwwYHhFOb8aSp1OLBqBbFSR4ZKM281boG9RimPHI0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqbbxxy3xLCuegXMkZW9sQ30IfNcV66flQsHopV9nS0=;
 b=Us52aT3Pdzpc+2et6sgZze050nc3PfSXDR/0rrm4F7lsSPVKJjUmU/ZPP7yRVzw11tVdPQxcyfKck3BxRd/PaKyoone7xh0EVvbGJTQajFhgvk9uI0JMOKW9kGp8bSdeoVfxXAb5ao0k9/7RFJC8LMuTuyYT3rMXBLo97/hONnBBng3oL0HDedA17vbODnfgLzH1QSQ/LAQGulgbDpsfsuIf9j3ZJnI+xktsDAymP7t9+0hOWVWzXUWKRpHXut6r6nvQO+v7BwG+j8IK5il/1sA0K264wcNgqoyKrTF0vuUCGFOVQk7vFPPxZooWQ7nDNSGFGqmNunVLH5lbnwVj8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f4376f27-8ef1-80f0-dcc8-b0d1d471c515@suse.com>
Date: Wed, 27 Sep 2023 08:35:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] SUPPORT: downgrade Physical CPU Hotplug to
 Experimental
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 wl@xen.org, roger.pau@citrix.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230927002938.1770418-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230927002938.1770418-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::18) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PAXPR04MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: 42ebd314-9613-4059-fac1-08dbbf23e27f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XvQuzPwYhjqm312bK8eIS7Jaha6jlpeO+OMSIJ9HlbonhjCnSrzw+jHMiLhn3K12NJy6LmvoKu4f9M6ELMoxFnq4/6B4VOcdnuxGfYjcF6lg3OsqDLLHtbj8Hze+/Hx0tKUYHPexSvZ7HLmAXEikgZm90NeVkvfmibKAohxia0Nv75TGDZhDBo1OogbApglqKvbxPw9S5bqX21tO3DmsXwySoYG/K+OqZ+VQmiNZzJSr8/crE4aJ7ST3a1cwB0Jl/o4n6nh/Pb+Mu6AaRoc9snBlPg8Zdrx5X5RedjSCDGKCtmVGJ/FXNyvLF90osPF688AShhTiBS19DHnsD8nUq87NfxBMsx7HWI6U89LxAd6FqURY37CexW/dO2TzL4LxIJaAed1GwJ8vv34lrMZ70g90PTC8jndbrGe8of/n/ufOWQhJEArkLkgycIX5fQeVypI2FLTum/15Yw7snNDnBsE8JNky67FEb1xZ45ZY1UjepM+g6+Y+q87vyRB5DO1+TXmWPY+qEJ5i000YjZh98zclt4QyHL8HlBxZUtQ0AOoIsHogXYhUMWzHmTA3mkPkMUmEHWsSRQtAu15V5huJkzQzuwJc99IzodlpWbSAeB/M4neK29OVrz10waQLs4m9p1RVgbk3kKF0lGuJj7aIgA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(230922051799003)(186009)(451199024)(1800799009)(53546011)(478600001)(6512007)(6916009)(41300700001)(38100700002)(316002)(2616005)(26005)(5660300002)(83380400001)(6486002)(66556008)(66476007)(6506007)(31686004)(8676002)(66946007)(4326008)(8936002)(2906002)(4744005)(31696002)(36756003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckNZVTljZVRTY3FQeE52djZ1eGZHOEx2eUdzMDVEOHJnUmt3UDY1NG51U2Fp?=
 =?utf-8?B?SUNMODBOYTZUdUFCK1RCeGI3NVBneG1xWmtqdCs3WFVaM0lkcW4ySEJZbTlG?=
 =?utf-8?B?S2h0NDd4b3hFSFVyWmJsVmZobERQNlNLVTRlUUduSDJIbkZOYW5LYlltOFo1?=
 =?utf-8?B?YStLVUxvNGtERVJDYWtkSUVobkJpMVV2VGI5cVVyeXordGhGYnZYek9PTkto?=
 =?utf-8?B?a3pBeXlGMXl0QXZZbE1rSTdKWlBIMW9Melk5RGd3MVdaS2dnZExhV3d0M1BO?=
 =?utf-8?B?UEJBcFJrb0k4ZWFoYnZEWllDOENKQjMxSmx4MXFyU2FFRDFMcTJoZ2pyaWw5?=
 =?utf-8?B?NjEydktjSjRoQ2s3Z1BObXBHMGhGVytOQjR1bllvMHAyWWxHWDFPYjNJQ3hP?=
 =?utf-8?B?MHBJS1cvaGxYbjZOOXdubU9yc2hvQ29CQ2xGQzRtZzdGTGNKeHIvRUJ5cXov?=
 =?utf-8?B?TnNUalhqbGl5K2ZLWnUrY2M4Y2JDNnRidTNCSG1wR0xXK2N6WE5yL0V6bUkw?=
 =?utf-8?B?ZUZyUDY5aStuUmpqRW9uQlEvRm51czhZTzB2M2hSemhja0tDUVJ1WFJsTDJZ?=
 =?utf-8?B?ZDRqUHE2b0N5WjhWc1hqcGxPejFPQ2tHY3l2dWtkd2F4WlBTS2h5dmg4VENU?=
 =?utf-8?B?bmtjKzZXWjV6RkdOcmdyUlRQeU1yM2hLdUFRMFFNME5XYm5DRWdlR3VzRVVt?=
 =?utf-8?B?Yi82ZkxGdkJvTGxjb0xSWGRLTjVBdkoza1g1VEdrTW1RMGFiQlRJTEJ6QU1U?=
 =?utf-8?B?T25XZmFqdWc2Smg1OHhkNHRRV2hya09UWXV6bDFvWlIwVGtUYlpvWGRuZTZR?=
 =?utf-8?B?cHJaOXpsVGZpZzlXcVdSNC8vQklXcXVNVk9NMlZtUFJpVGhuRlE2TXdnVlFP?=
 =?utf-8?B?aGdZMVhWaVNnSStlbUJKLzV3ZTRKQXd6RzZaejdVSkZkUS95ZjM1YTdvVElB?=
 =?utf-8?B?Zmd5S3lVU2FDb0FaYkh3ZUtUK2E0M09kbnZMaEY0Z3p0UGxhSm44SDI0MFBJ?=
 =?utf-8?B?d3hseHdtT0tWcytWNUsyOGh6dS8vRWtXMUhFKysrVUU0dXZtc3p2d3dFTWhP?=
 =?utf-8?B?ZnU4aGoxVzBTNFA4cjA4a1ZvTTN2Q2NQd2NldlR2N0JRUnEzNjl0QWVhVUlF?=
 =?utf-8?B?WHFQR2dRcFl2dlc1WUVUSytkRDZDWkxQampIMGNLb0JRcTU2UEZxYU9uenV2?=
 =?utf-8?B?MzFwam13cFduazVuekRyb0ljdU9Ha01wbkdOMTk5Q2dzKy9VcHNDSEMrK0NF?=
 =?utf-8?B?SDZFZHBndXJQQlErZWovR0R2eFpLRFp2Q0pBWTdieE1sdHdnQlFOSlkwUEp3?=
 =?utf-8?B?dzNxWVdjK2REeTZOaGZIcHRCTkROUGJxN3JuU0FlVEVtc2JZOEJyN0pFK0k1?=
 =?utf-8?B?ZUNXaG9MdTc4a2VhRFJFYjNadEJNWWVoZERrckJTajFPYWhMKyt5Sk44Ykdu?=
 =?utf-8?B?aFFmTjE0aVRFU2JIVWRzZHFTLzFSYTM5UUpBdXhFUXg0ODQzaTdLeVE0eVJu?=
 =?utf-8?B?QmJ6and1RmFwNjNQZEQ1WERBU0t1TjRCL0ZYVld3djg5MmVrN2ROK2NVclRU?=
 =?utf-8?B?WXJnQlpwcERQWDNmVytOcUx2VEVOa2xXT1NybVdzNllHRDc5U2lyL05ZUUJQ?=
 =?utf-8?B?RDlvWHBPR2hVclZmKytyMlJueXZrUk81ZFRHQlA4QlR1SjFHcEVFdGxad0ND?=
 =?utf-8?B?MXYyeGJ3RVlzeHR0NVNZTjV6UVBUTzFMTEZ4bEtBNGx3aCtCd0J1Tzl1dEdY?=
 =?utf-8?B?MXE0NzVaRk43dGEyajBLRmlrQ1dUbUdKTTB1VC91Q2c1R2NKSWFvM1YySU9G?=
 =?utf-8?B?SmhUNUlQS3ZIS1pMUmxuYndtYklQL3BqMmwxVHNQbGRwNnNpa0c5eDhjajEr?=
 =?utf-8?B?UTI3clRMWGhZTExic1llQmxnRW0zT0JONXN3dnNBYXNQR3ljTDBlOTAvRFFU?=
 =?utf-8?B?TEE1MmZrL1FkaDhCaGV4ZTFPVFJ3cmNjRGMwNzF0TCtFb2NWZlJhcHo1Qkgv?=
 =?utf-8?B?WWlZK3B2cFozNXBzenJ6OGtBbFhWR1JZYU00V21ENVJaZ01qZDJNcVdhTXNQ?=
 =?utf-8?B?NWl4Uk1oa2dvcjdhWndjNHBRVDQzNGxHN0xqKzZOdkc4dlp5LzAyN3NSbE1l?=
 =?utf-8?Q?sz8XJxqKD90yPJGJ8JvkscBLY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ebd314-9613-4059-fac1-08dbbf23e27f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 06:35:04.8979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kYLNotNgfXRUfPJ4p9sgYQF9QHAA1K5MK8qpZQ6C0YX4RA/pakLbJ7F7ir3Fx0m9rUZ41OFp0fdfBPcN5809XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8318

On 27.09.2023 02:29, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> The feature is not commonly used, and we don't have hardware to test it,
> not in OSSTest, not in Gitlab, and not even ad-hoc manually by community
> members. We could use QEMU to test it, but even that it is known not to
> work.
> 
> Also take the opportunity to rename the feature to "ACPI CPU Hotplug"
> for clarity.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Changes in v2:
> - rename the feature following Roger's suggestion
> ---
>  SUPPORT.md | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

As indicated before, imo this needs accompanying by a CHANGELOG.md entry
(and I don't think that should be a separate commit).

Jan

