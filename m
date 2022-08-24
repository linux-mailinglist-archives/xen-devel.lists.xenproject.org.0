Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5771359F871
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 13:13:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392450.630804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQoJj-0006ZC-NJ; Wed, 24 Aug 2022 11:13:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392450.630804; Wed, 24 Aug 2022 11:13:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQoJj-0006WL-Jm; Wed, 24 Aug 2022 11:13:03 +0000
Received: by outflank-mailman (input) for mailman id 392450;
 Wed, 24 Aug 2022 11:13:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M3pU=Y4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQoJi-0006WF-Qd
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 11:13:02 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10051.outbound.protection.outlook.com [40.107.1.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b758d725-239d-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 13:13:01 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7505.eurprd04.prod.outlook.com (2603:10a6:20b:285::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Wed, 24 Aug
 2022 11:12:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Wed, 24 Aug 2022
 11:12:59 +0000
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
X-Inumbo-ID: b758d725-239d-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AkyyevrtTAsiS6Pbn1aueBt0Oh7GmlTe14AHclI88RMIUUCP+OhGfPFG10G+zezwug33+Wg1sAhss67ndLoU4TWErYsIliGefp1JbnC0nv2iEkasme4eRDEQ1aGpdmy3sR7bm2bx1Sq0lqCKzhdqjiwzKh5TJahL5vmttYeZOOPPS+mxQH/8PwksK5ICTk4fV/mZX6PpjbAZYf4TYZLhDa49BuzqjgwP/d1dE0XRpmgT9vV35rbIG4yqhOuM/JiCxsAV9NXuu3XPM9Zlcxww/2hPtHTkxjn/vnzyK7q1TzsXHQdhXT/Iuc6lc68xgSoOamr85XPZLvm3p173RD5vzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMrf3yloA/3QfrN9lyiqU4EGCX0ikSHLqQ+S+QQd0R4=;
 b=kwQS5LojM1HuykIgWJOKt2hmQrNnrvBQ+akc//wrnOvZYDHKQfo7eFZ8eEO1VHWqkymfAqvySo6TxtNc8VXPGJiDlZMZU36tcQjYm6UVs6779N1HlyPCM8hWehSGqEsxYYFS4xR0TtFLl7Zj/XjdHzR1RlyZzVbtpwEWtcMe+0mYqWCtrI+mRf0g2OmQHKRAq6F+ImU4uMxpi4VHP+NeGCRp9nEFikjsbOdE8ewrrEbFeaJFSu4eRWQz0nIYiqd05QxS+GSNb2IJHMnAj3enjWVNpf9lBUVrLPW4ZDnueiJtjYOoefTu+55emkwcOICbYVb5VFqriOMh9ebHmNY/cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UMrf3yloA/3QfrN9lyiqU4EGCX0ikSHLqQ+S+QQd0R4=;
 b=y58F5w3EDK8xrD7olgHJLHGcfzwvNGJSLtbQmzSwhaJxqVXMXbvL2CLOZKyKBY16EROtUTNsDnnwCnDIISrsD+rFAzfTcy8EQgtUWheb5VofAyK8Ga+TZoK8Wru5n0uhnRvieeVVQN3WHaYkcRX4DW2TEbSyOJXmW62AXK7SczmRGN609hDUa0ZYlooKRpwIqMcwZfFGOh80jUYK8fC+dsRVjOuJItQU0b+6mWGPJkxLwItEi1OWmCgVoM0kZxMn15ORvnC/CsEecZPNPbQRPkXlqciPItalMOoPsc5Lzidj6vykxeAOTt3k3vp+3cnaKbJM+ErT9sOxnYGUtocaXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6c29aab9-2d8b-44a2-d6c8-3316ac437c1e@suse.com>
Date: Wed, 24 Aug 2022 13:12:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] xen: let ASSERT_UNREACHABLE() WARN() in non-debug builds
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220824102225.11431-1-jgross@suse.com>
 <e611392b-7186-cf0a-96e0-4ea39b2bc151@suse.com>
 <de8a9208-0936-27db-e3ec-742254ff0525@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <de8a9208-0936-27db-e3ec-742254ff0525@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fee1b748-f1f8-4c76-e076-08da85c19aa1
X-MS-TrafficTypeDiagnostic: AM9PR04MB7505:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xJ2n2Jf2BlNcbniTYMqL9FmwZyzMQDK6793z0jo0ISVZ2+Q0ZKKKOgsR4mwrmoSVwAckyWlG2r/q+c2cRdbq0LokjlYvKf3K/4aYFqJLPgfTM2vYIexgZ/FPq3Ll9G5QKYWNHjWPakBS4tDrTBphA8TSkvigXoJqx9bue75QawGc6sie2KEvnVns65KpSMmyYEm13ABw6EIPYVORl4APuAVjiABsZ/qpf/4H/2jHezJfX/UfaaLfNKCbfVAuwSm7DzxQFIMpUBQPn1dljJDemOQoRwBH3R+lHF2hwjT9zvDgCYZ9rJawjOI7J79qX8d6VTw3GwuUEqRWM/MMm58wIJrBBZnQ5JNvuBtD1qfqSlljICR0wSc4m9WbQ+QD20UB74vFWNQYHoh04cdtmuNX3wZPsRfj636538z+RYLRu6rjmfF3jdxhZB8rkexLmLqWTUyEOmoxLIsLFPo1ojkQw4oBQChHkGe23pzKcEsUAHOjnKMuybxxcMKM0wIG1pBCxeRHxYxZmF1h5UQRGZnGT1l6sK1OA2sDfCUa7OoGxLIpBJlLC9QySKknK3f1HwIvQ+9UBmy4wAImv92XANeQuntdYiTQvXuA5VTobbmEtdGTPdmC9y9oAVcU4xtp0PBw7uHhWFsAq6W50raL8sdPUhZL0+1Mzo93Lj5Fg6Ao2HzpVfy0ghJLF0HJs5k/XEmPlBGPmkaQjoJ5Rvyddb9XiV3k6KA4DdrRRREnPD6Undi9liKIwSppeeJ0MYzb+SR6ydU2chUJoGjvpeTOwRQhPSGIylzHVNU2TtnlAtlJe8Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(376002)(39860400002)(366004)(136003)(5660300002)(41300700001)(31696002)(6862004)(8936002)(316002)(6486002)(66476007)(66946007)(478600001)(86362001)(186003)(26005)(8676002)(66556008)(4326008)(2616005)(53546011)(6512007)(6506007)(37006003)(2906002)(38100700002)(31686004)(83380400001)(6636002)(36756003)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDFhemE4TStWRW5WU0NhN21GTVNKdE5NWDVDaFZibnljdklhZVZxaTNmVWRw?=
 =?utf-8?B?WkNXa0MwK2xlenh5S0Q2ZE95ajlCWVhPdHVqenViVHJIYllkc0dZMzRJZGZs?=
 =?utf-8?B?TUpKcGMzbmpWYVJrb2lKejNuaE92Qk1QSGR4Mmo2NmpicGVDTEp5L3gwNTlu?=
 =?utf-8?B?cWdqQWluNW5ON1VBbzU3Znc2K1RlS1c2Y2Q3eFlGc2thRVYxa2Z3R21ubVBo?=
 =?utf-8?B?bVZXQXJjS25hMHplRUQ1cm54Tk41Zk1GZDk4SXJheVozaGZzbHQ1U2orbmti?=
 =?utf-8?B?a0k3eW9oNUpjQWNQeXdZZW44QzVORzZWMnJQcVk0cG9qcitkSDRTbnErdlJT?=
 =?utf-8?B?RHlYSUhqSmZQc1ZUVEVTcXUrYkJER0FMaUJOQnJVdnp2QkRVQWY5MHkzVnNW?=
 =?utf-8?B?Ujh0ZWZlNUhpVmNpM2wxR1Z2d1AwbHlBYUJoQ3JxQXRNMTlTMmJ0V3Q2SGUr?=
 =?utf-8?B?Y21NZTNuSjNMaXNRa0dxUHlmY0tLS25Ia0hRZHJtK3BXcEdMSGhVVlc5bTRq?=
 =?utf-8?B?ekVMZXdyTUlrK3FkYlJzRXM3TTFGTTh1cmpsbmdJS2J1ZmgzRmJweUpVZ0lw?=
 =?utf-8?B?WFRDR1RnTWcrbjU0UnNTSFdQbHJ4bmttZCtDVS9Ba1kwYk1rVnRFTzA5TzRq?=
 =?utf-8?B?aEU5TUVzNi9oMkJXR3BlWW0xUzlBVHU3QTQ0NUU3MTgwY1ZzRk01Rkg2NTZL?=
 =?utf-8?B?NWZPT2lOalFnSTR3YStPVGdkMkVZck8zY3E2VDMwZnR6ZDdNU0pjU0NTTVM5?=
 =?utf-8?B?aCtrSFlUMGJzdnJ3dzF6cDBQb25WcHFTb1NyWUtBZ3cxQmYrU2pkaTF5ZHVJ?=
 =?utf-8?B?L3FwUlNMVzQ5ajZTd1JNZzZBRXhEZHFtblQ5cC81L1V4VFdOeFhuenFqOEtB?=
 =?utf-8?B?RWJNa2ExZzV1RmpWTnBYZ21JU2lkbjdXOFpHMDA2TFM1RnZIM0hOQm5mR0Iz?=
 =?utf-8?B?MWQ1ZG8rS2plRlpONXpmQ1BEMFBDSTN5bUkwbzl4WllqckRvQ09qYU9lV0Jh?=
 =?utf-8?B?Y3dhOFBLcFFvT0ZwdndqUldpREtaV2Q0R0pDOGlQSVRGMkpUdXRiMzJyMTBG?=
 =?utf-8?B?WkVGYXU1S1NYQlNqdmROL2dkZnZZZldzY04zT0NhbklUUGpNZThIREx3OUw0?=
 =?utf-8?B?YVNVeWZYUVBtTTkrUmdLVlBHQVRkbCtwWGFwRW5QRVBqeWhXZWRzMXpidzM5?=
 =?utf-8?B?cVIxeHdzSjljSlZFaW9kUlJUdmU5Um9JNnd3RUhIUzdZMzd0OFpqYzQ5bXZW?=
 =?utf-8?B?K09aSjhrRjl3Rm5PcGtodWZadFFKZ0xhNzhnemFhQTNMcDFLazYxeWhsV3g3?=
 =?utf-8?B?d3dqVnRmVDlnWXhLR3h3SmVFOHl0UC9sQ0sxQlF3UkJCUzBMODhyaUVsU21K?=
 =?utf-8?B?dXN2RFovSVlVYmlLNWdMaEZHSzVaeFNOb1p5c3hpTnBwUTZybWxTdlRrOWxO?=
 =?utf-8?B?MnJ5a1RkZlE4M1hHaVI2OWg0SWUzVnFVOEE5ZHppYUhCL0hKSnFRRkJSOWg1?=
 =?utf-8?B?LzA3c3VmQkhDQUt5UGJ1NVI5dWh6dVdvMEdUS2d1TWxLS0pNZVdSWGx5QXd2?=
 =?utf-8?B?ZWFwdTNtN2N6UzZHVXRkZjRFZGNWYjh5bzVqc2xxZkFoT0RHY1N5MnM3N3V1?=
 =?utf-8?B?dlF3eEFJelI5ZkpWMFJlbzlwTW1xUm9zM1VhMmUyZmVmd1V4b3pYUVBLbDEz?=
 =?utf-8?B?K3hGcW15bS9McldPMjhucWQ1aDM5cDgzZlhhY012cTNrRlRMcFAyWjJGbGFi?=
 =?utf-8?B?c0RGWWZwU04xbEFIWXlhT2hrLy82LzhnUFBXN2hTWnpHRTA4L0VpeXNGQ3VJ?=
 =?utf-8?B?c1FKWXlaRk94NHF2cUtBVnlqUjcrNUgxa0JUMW1sYUJzakZ5T3M5SEJIMFZm?=
 =?utf-8?B?d1k4UEpKdXA5b21pd2syZmozcWx4YTM3SWEwSWh0SHBjZnJpb2ExTkYxaHE5?=
 =?utf-8?B?bVlSR3l2THZyNWxFWThoY012ZVRZbTRkcXp4RjZ5TmxFUnFCT2hXUGNkd1Bl?=
 =?utf-8?B?b1d6cVV6SXFybWttbUJPdHBCdzN5Q1FudHEzZkhGUGpCdkowYmFxQzlwY3hn?=
 =?utf-8?B?NTIxSC9sMFo3MGViMU43eEZNNzkrUGlYTjBpS1ZrQWw5OG1DcHJTUHlRRjVG?=
 =?utf-8?Q?WgcEwTQro9u7ihAai4M2qGsT+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fee1b748-f1f8-4c76-e076-08da85c19aa1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 11:12:59.7078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DSmr78wwMBjYxF0f7KcYT4Sp4icora8dV4RRwxNWMk+tN6AEKBx7elfHEiAti5oMXoXGWKbJsNvA16LHwTeZpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7505

On 24.08.2022 12:45, Juergen Gross wrote:
> On 24.08.22 12:35, Jan Beulich wrote:
>> On 24.08.2022 12:22, Juergen Gross wrote:
>>> Hitting an ASSERT_UNREACHABLE() is always wrong, so even in production
>>> builds a warning seems to be appropriate when hitting one.
>>
>> I disagree, for two reasons: This violates the implication of NDEBUG
>> meaning ASSERT() and friends expand to no actual code. Plus if doing so
> 
> This is something we can change IMHO.
> 
>> for ASSERT_UNREACHABLE(), why would we not do the same for ASSERT()?
> 
> There are multiple reasons to have ASSERT()s. Some serve as a kind of
> documentation (e.g. to document that the programmer thought of a special
> case not being possible), or they are meant to catch hard to diagnose
> bugs rather early instead of letting them hit later in a situation where
> it wouldn't be clear what caused them. Adding a WARN() for all of these
> cases isn't really appropriate, especially as this might impact
> performance due to added tests, which isn't the case for theoretically
> unreachable code.
> 
>> There's a reason we have ASSERT() and friends and, independently,
>> WARN_ON() / BUG_ON() et al.
> 
> We might want to introduce something like ASSERT_OR_WARN(). I'm sure
> this could be useful in some cases.

I'm curious why in such cases it can't just be WARN_ON().

Jan

