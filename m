Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FB05FC0B8
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 08:36:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420746.665738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiVLj-0004lw-Q7; Wed, 12 Oct 2022 06:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420746.665738; Wed, 12 Oct 2022 06:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiVLj-0004j7-Mb; Wed, 12 Oct 2022 06:36:15 +0000
Received: by outflank-mailman (input) for mailman id 420746;
 Wed, 12 Oct 2022 06:36:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIvO=2N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oiVLh-0004j1-SC
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 06:36:13 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2051.outbound.protection.outlook.com [40.107.249.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29cd9bce-49f8-11ed-91b4-6bf2151ebd3b;
 Wed, 12 Oct 2022 08:36:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6906.eurprd04.prod.outlook.com (2603:10a6:10:118::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Wed, 12 Oct
 2022 06:36:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Wed, 12 Oct 2022
 06:36:08 +0000
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
X-Inumbo-ID: 29cd9bce-49f8-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SEwU9gxv/BV1WsprffAYs75709hkPnNsJ94uWLylpUjQKw3HW+jn9sD2jMbYZEg3z9X++XU2q1l3n+0SQFjnNnNbYkj43//cBE4pnKMS7bFhv3R9cA6Y/1lskvZEhCh3bUgfIickc9sPSY55bzcVsUIbTa4DsajpWWTE/tszsGzSUBvPsnl5Sy8w0osvGwYg3G+eSf/rGTqy9Y1L7Xi+YLvldMEJ23KD9G6RXpOsTfpwfpV4cgj8UzLQl3LMBEzZAEYkznL8AGuAY3+hW330ZbRiQUBe5lIsfKgdR0SxlaUPSH0A4IXwsN0OYL3EVBpkPkmctXwFHRMHOzbODtnc3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0CRIrfe1tLwH6ZN0KxJ/TK19Wc4PhRD2oiJkulZdKQ=;
 b=SRGQDaNOLg0ld4FkGW49yzkAZbdy0KDSmb08ZC54khmvuowjSDFuZ/SeLiJ0i5DdQw6jfP9NMeWm7VYNXHBhdJu6WrTQOykm1bezp1ILWCEMbpDkmepJmEcM2R7WdqcUEwz5hS8AcUYV+ZnBqpnm8wRnz8AdcSqzpwgomJKz83bjMydOM8pX1+NjVE5u0/c+8udux1EvXLhA60wWV1qQScn+Mf6Yhp26kClyR/DYgtVS7VgHtSSyfHbjCcwmksKVODTYInkVSOe3nTmRAPEYc2pLw5ivfPsv3cQi8LJEEneSDC3tVVF6toPMEEd8GPseYWvWlIwTcMbJbYvfyfD8Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0CRIrfe1tLwH6ZN0KxJ/TK19Wc4PhRD2oiJkulZdKQ=;
 b=DYfJviTaRAoByxZSO2UBOA4WWhvzpu6AIGmEbggW4b08z01G62V5FdQKhHFj7yUETVVZY8LXRJoHbyCjYmvvvouxYlHo6S87v/VmJvAVeORqgIC2ytsALFddP9MELCUexJtIwsLU1GMCNapPaRWvv4YAm5t/zuDBDTjDGW5Xfz1ez518sGDni1WGT3ZjvESpo2pvGqEM+Va+GOoGJewS94qNcLZsJXGkRmdyyuD6ADER4Qk8s2RzsmulO1X+KLgPVX186YfiyUeEx/RsVVJuGUB+1dDhnPEkHtRzpEa/zssCBoNIjozvabH03P3yUCK4XaBiGecBrRQ2oMYU4UIdeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9a004932-ccaa-5e78-c0fa-6fe3f2c13b78@suse.com>
Date: Wed, 12 Oct 2022 08:36:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [xen-unstable-smoke test] 173492: regressions - FAIL
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <osstest-173492-mainreport@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <osstest-173492-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0263.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6906:EE_
X-MS-Office365-Filtering-Correlation-Id: 005e9082-779e-4ead-ac90-08daac1c0bf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vjRyNewAzptY7SVgmPrXuYstWHxwRJ74VKfUkvAGJz+h5cFx2X0i5RNXtFH8zQ5j/MzZKyk2wmhaZ/oyN1repYsv14w1dx7B+ulzElGYo2QHrjE07OA3Wgfie8Fn+jUxspHiJ2TdEA9MZp5bovTgqYqg57S8mWnm5g9cHfnTj3ofMlv8bbVoexxjyJU+mCgRg2kZKd7pD+xo6eLTw4DtqZ1oo1j2d4juI9Oi9GQ5CLgcKbHd4XSRRqztOJcBcjETOXGHjthqDHqgFA0POmemIMYO+PEqfPqqF4aULnpnX4ToYf0EabfHM1KvR/yh0ehdLp12Wwr3iwamK9TUNlnwPOnNVAruGw7oWk/Y+L4WVLw7B8QTJc2d83tFGQixT8wsAqcW2cZ+LU8yqlkPsU7gPXWSizIPyEGNYhY6SVI0QaOK3xCv8R1upQ0asMIojPX4/wxQw3NsKVEAI0bUapT3oTOEbE55l3DNad2elLthWwLAVOj3t+l9/VWIG9EBxXYa44CNjdGa5Q34AsCcNZAdwV9lPrg/p07UPHZDM3OP7N8DMKqt+/Pv648AYgsQ3fhXVQMNgS2e8ZOLvMf2NmZbM5Aa/IWUJWoYDNVjW3v1gX0dDEcz+z6PwoOCHpaerk0MEDZ2jca8R9yf8duAy06AwDX+h9C9wUiwRJSJ8hhgrMCg772nFulr2BuSQ4Jzou0DM0/7/MJE1N+3/QUWTO8HkEupU1ZZHwP1td3QXu92sFfOjFJWXlPQuv9NkI5MC5zV6gQg6SzXw7BACG6OyANA/PFcfZSF6mXucB1G2RqlP4o+x3GfHymn0UdUXCo/kI8MdLGPkjbN1d+zQYhqlaV6BQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(396003)(376002)(39860400002)(346002)(451199015)(6506007)(41300700001)(83380400001)(6512007)(8936002)(66476007)(66556008)(8676002)(53546011)(4326008)(186003)(2616005)(86362001)(31696002)(6666004)(36756003)(66946007)(31686004)(5660300002)(478600001)(966005)(316002)(38100700002)(2906002)(6916009)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bitRT21rMU5iNDIrSDE5OW1aNEhabWpsVFducEFWdmxBNEJkTHJCNkJNSkZr?=
 =?utf-8?B?RFA1U2VRSXFjQzJwSmltbXpHSjBoWkwxblVXZHRaMllpc2gxdEFqZmRLcHdr?=
 =?utf-8?B?ejBoMUwzb0diVmJ0RzRGVGVyZVl4dVlrUm0wTld2d0xTUG8xQU5FUGFyWkE5?=
 =?utf-8?B?SDYxelg5SWczcWVDNWpRYktkMVNlakN0a1ViU25KQlUxTjc2eElVd1U1UUQ3?=
 =?utf-8?B?YXNHRDRZakdSOSsrNm5pdDVSOEtUWGJxb0NsL2hTK2F2ekNBZ3ozQTVFNll2?=
 =?utf-8?B?ODBVclNXZUg4VUFySmJMa0lHTGJIQVIyY09WbWhDZGRuaHovV3Z1bERpUFBs?=
 =?utf-8?B?clY1YStsU2d0aWZjdy9FRzUraWZqbm1sU1lLN3V3UW1sNDQ4OVc0OTNtZ0gx?=
 =?utf-8?B?anVqRXNvOEZ5QXU2aFJVbllHSEw0OWljWW1vY21IK1RZakNSQ1VmV2VFa290?=
 =?utf-8?B?K3hDSjlzQ0NyZkJEYTB6cFJYZmkxNzB2b3lLYUZXRzMxUzNNVXpRUktEbzU1?=
 =?utf-8?B?a2I5MDFIUFdXY3Y1VkN2Q2p0ajA0V3JNQkJlNUZVR1I4YUM1d25kTFBxSjh6?=
 =?utf-8?B?Yys2c0lML0MwSmNuM24rRE0zMmhEb2VDcjRaR0JrVkNlR0JPZFJZN0lkUE5R?=
 =?utf-8?B?ZHRaRDdjMERScks4dEUzcUNUOWt2bi9tS2txblorQ0JleTJuWmx1SXZCeHlT?=
 =?utf-8?B?aGNkM2Q3UzVyVXZiT2V5YlJIclhKT1FkTTJMT0o0a2REZnVEeXV2ck5ac0tp?=
 =?utf-8?B?NlhKd2FTNEdnT1lyZ0NEZktRbXpXRzFPaURTamo3NHZGSXBsZDI4V0U0ZDFm?=
 =?utf-8?B?ek9PYmtXdHFsRzJJbGNYc0xrRGQvMDhwUlJZdlhmNTFWYUc0ZFNIUm14UjVG?=
 =?utf-8?B?eDcyWFh5TWVaSEgrYTlHakJYRGVXVmFJSE9CRGkrUGRyUFUrODJTTTJ2Vm4r?=
 =?utf-8?B?RUVDR1BzREkraFlCZUVzdGdaZHRzVDVXS3Bpem9kd01qNDZGUTBGakxhVkxn?=
 =?utf-8?B?bGU3QlcrQStEU2IvOGJvSEpYaWVnU3FSUUNuOWlYNElMb29FSmJUQytMTXRB?=
 =?utf-8?B?TERzTGRVdnFTWDNOb0ZlcTlnNVkxYWJxaXROeEQwUXBTVmdINW9XbTloR3hC?=
 =?utf-8?B?eE05eEYvRFlabGY4K3NJWXdxa0p5Q2xxSjBaTU5hWGpueTZpYUx6eEx6VGNp?=
 =?utf-8?B?YU1YTnZGc1VKc3F6c05JQmZFaGRGeVJibE92N0ovcEczY1VUczJ5Q3BISlhE?=
 =?utf-8?B?ODJHT2JzMkJyWW9KUGNWTVdCVjlDNnhPMys4WklVZVZYVy9SZDF0am9PQ2FX?=
 =?utf-8?B?Qk84UjNveENFOVIrOE9ZZ09TM2dlTE13OHlTUDU2Qm52bFViMzBnQ253ekpm?=
 =?utf-8?B?UElvZHhqV1pFall0akF5UUs1a3VneVBLSlorVGxJcG9raEVWYVlRTXRSM0dL?=
 =?utf-8?B?cXNvNE1KVWJKeDhVQ3RJb1Q2enNVbTVITU9pV1BGN0xFbjdYdlR3Wmt1N1BG?=
 =?utf-8?B?cDJrSkRlZFAweVErWVFXenBOMUlYOHFxRzZra1B6ZFRZRUFGZEREWmZXNm5F?=
 =?utf-8?B?ajlFbThlbE9HOWE5NWFieU10YUJzMThxRXBFZzVXbkhRU3pTNUZYM3J1T01n?=
 =?utf-8?B?U2NIMUpmWk5kL2dQa21uL09wWllLNFVEeVpFT1Y4UndQdStML3RPR0RrK0pw?=
 =?utf-8?B?MTRQSlRpcVdVWlBqUkwzc0NId0hKUjhMSEovb0JMU0FNemVISnlHdFZBOTZW?=
 =?utf-8?B?bnh2ZStHUUF4MlFRUGtRL0RYb0phTlFQSnBxR2tPN1BQTUZpU2E4NW80d3lt?=
 =?utf-8?B?OXlYRlZGSHpSNHZ6QndXWFRxTGNRbHc5b3ZrWVdoUGh6bTNzd0NFTWxOWlRV?=
 =?utf-8?B?WVhTM1NWRExyNmZETXI5SmhKTmMzWWdGN1ZCVWZnN2VmeFZreTFCdEVOZ2I4?=
 =?utf-8?B?TzFLQmNaRHhRTC8yMk9uUzY3YVV5V2RwYVBsWkhWcGo2MVE4bE1NdFFBTVNv?=
 =?utf-8?B?NTZleGtTeC9FaHhBWGlxUVhDYUpWeUdNNkg2bGdEZk8zSml2YXNTYTZ3Q0xK?=
 =?utf-8?B?YWpvRks3YWJ0aFJpSmZ2NFcrQ2RFRFZ4T3JXMDFyN2NhNmFlemNXRDRGSkpM?=
 =?utf-8?B?VXR6TFpYK1RvTWdmYTA4NmZtNDRRYzBOZVNpZmp5azZVTDFCQ0FWdnl6M1py?=
 =?utf-8?Q?tgNpnHn9yz/Sr47V30yx8Cv5E5lNSFzdHeJg/ccGJKT8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 005e9082-779e-4ead-ac90-08daac1c0bf9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 06:36:08.7726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HK6Mr/TByMrYSUvh7GfJ8ax1nX7T8KtTZOJEpptLB+9V0zk5mWh2ysFk7msIsbNBWK6p+oOtCtdeXF/csadEKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6906

On 11.10.2022 18:29, osstest service owner wrote:
> flight 173492 xen-unstable-smoke real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/173492/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-arm64-arm64-xl-xsm      14 guest-start              fail REGR. vs. 173457

Parsing config from /etc/xen/debian.guest.osstest.cfg
libxl: debug: libxl_create.c:2079:do_domain_create: ao 0xaaaacaccf680: create: how=(nil) callback=(nil) poller=0xaaaacaccefd0
libxl: detail: libxl_create.c:661:libxl__domain_make: passthrough: disabled
libxl: debug: libxl_arm.c:148:libxl__arch_domain_prepare_config: Configure the domain
libxl: debug: libxl_arm.c:151:libxl__arch_domain_prepare_config:  - Allocate 0 SPIs
libxl: error: libxl_create.c:709:libxl__domain_make: domain creation fail: No such file or directory
libxl: error: libxl_create.c:1294:initiate_domain_create: cannot make domain: -3

Later flights don't fail here anymore, though.

>  test-armhf-armhf-xl          14 guest-start              fail REGR. vs. 173457

Similar log contents here, but later flights continue to fail the same way.

I'm afraid I can't draw conclusions from this; I haven't been able to spot
anything helpful in the hypervisor logs. My best guess right now is the use
of some uninitialized memory, which just happened to go fine in the later
flights for 64-bit.

Jan

