Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8445462DE
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 11:55:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346327.572101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzbMO-0007dr-34; Fri, 10 Jun 2022 09:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346327.572101; Fri, 10 Jun 2022 09:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzbMO-0007br-0G; Fri, 10 Jun 2022 09:55:20 +0000
Received: by outflank-mailman (input) for mailman id 346327;
 Fri, 10 Jun 2022 09:55:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LSau=WR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzbMM-0007bl-Ni
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 09:55:18 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e0b68c0-e8a3-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 11:55:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8379.eurprd04.prod.outlook.com (2603:10a6:10:241::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Fri, 10 Jun
 2022 09:55:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Fri, 10 Jun 2022
 09:55:14 +0000
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
X-Inumbo-ID: 6e0b68c0-e8a3-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WuBKkmR5xTvxmrwQ0pJqSPMvswpEbKOnHyg1OqOUhMXk4WMZmOfinsMl8W+Ml6QzjCBhHjrHiPkScgNaEkC5LHBzMCKLgNFAzYjOwU972Kny2uL3aRPqqDRyb21CgXXuVyP69EzlVZAgNEqxqO1Bq+Ip13djkXq77lvZ7NU14fOxM831tdckiaYtUwZ3oLnTP0NkqYdmXXT0QutMziAXMltR5EWA0Pb+xqFm3ZbrVgHVKgHFcsAKmwuXuybhMVwUX1a0Hf0Pyox7Hdm3MgqQQyuOMXwT4YETE89Mzg4WEYbq07+LnrVrlHd0VQ71TqSrio4GbBKn8If4+dUbZV3/MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dIv2tz0F8UNY0fk7k6SDge/lwFDkLp5KvmHcM4Wrro=;
 b=KZTQXnEzAiV1HLVdSiLeGo/oJdgGgRsdrdrC9HXKC6E6oPs/aJLMquF8IYHjBAlp3YyWqdm3oAyNtA1+te9B0K/n1DIWrbzculMd8P+reudlWUiCo8qu5iX250dqLL9wE9H+okv6ovadIsnlvwR+q1QkzlAeKpV9BhuiWq2rCfslZxA+0JQ+niee4tDZ3fIQaaZkM3XPp9jJihONhskWd3iUnhOR+KMiMSmOMpZR5XHXhljrl0LIKAkeUe5lRWZQ13zEw5hm/6tdJUddGAB7xBWg6bkYUrCxoxfygWT2qRJzyAKI4u7XqSMfeJCUj+U8OIgUCDz5h15RyW8Ju9/bYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dIv2tz0F8UNY0fk7k6SDge/lwFDkLp5KvmHcM4Wrro=;
 b=aHPWgonr/sZYv+5U0rLlvlMk7CinmXY7xPfPnb2ZkS6zNPBAY7ACszQSkfWJTrk7FSJiaDdPCXtAAYD9XnmGFeljm3IrVexys4YgjjgcBSiY4YhwXaoZNjNnye9C8BMvKs4JiTHS9W7iHS4tP5vVIk/LYsiAgO788jIV/sPHI275AwY2p0pcnjN+sEMBZ/kDv8056lPeuZNry0XS3s5lEu08XdIwz8YjyuYoPBxaKDfm3LXzpyUrGYFOtN5el2TD9nD9pD3Jh5tvsBb8rLT2oWVZMCUm+AwULIEGAO14Jz61EPQPxMo70MEwX9Xa0Ids/4z4ds+GenHS1jGHC9QBBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <295e9c7e-e0de-bbd3-eec4-0864cb2ef086@suse.com>
Date: Fri, 10 Jun 2022 11:55:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/3] xen/console: Fix incorrect format tags for struct tm
 members
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, Michal Orzel <michal.orzel@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220610083358.101412-1-michal.orzel@arm.com>
 <20220610083358.101412-4-michal.orzel@arm.com>
 <b84abd29-2856-a173-55b4-4e642d8a6ee5@suse.com>
 <2ccd52a7-a5b2-c221-b847-ed0c9de2effd@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2ccd52a7-a5b2-c221-b847-ed0c9de2effd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0062.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::39) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e50d11f9-3e18-49fb-9a63-08da4ac750bb
X-MS-TrafficTypeDiagnostic: DB9PR04MB8379:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB83799DAC062DC930A197B96CB3A69@DB9PR04MB8379.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z34sCjkNgDWVEZj+wypYBKFItZh3kHUeCT5ma9CUc/eZkE+X/qElX5QA/NKYHCEs2jS2uk8LiAnAzbbYbJscwm2gvpSS3s9FaUa5P299V+6RSqO4tQ+kQj0p/DpSaHW/gJoWJYnTS1pI27nl7dr4t6WmWL8PKySA5M+dz4ci2m1KTf4HK20fk/AbacLhIPi5sF2ZSJqxso3fvZfCVXyeMgIpe35JTQYjjBSS8OKgg+PZhxuU+GVvMmjxrKl5t7vJaLMsf8wlk/tGaUWPCgIqzIbpGoflq66za/WLAM1c3c2jYC3ZsNi3PS5D5VmEDGs+Y9YUDBBuLVeVZHxIwKxDRFBo/jffw/ObLZvcGoK9/RtfzizQc34xfOIvBYXwrBFUkotdMAnFaQHhkBfeCnY0EjioborFh/S4EV3zQxbrTmeHSJnK+BKiqANhmuTqBQuR2bORGLMbEM5vxGyropdWyQ3O/9bjZInWaY9xmtCYIw+n2kllcJ07HJIn2E0MfTkHoa97lw3f8ngVAvEvnoSKpktGK4yTqNOxn7kMq/vr9WZYA1emNvtMLs1zNjWdU8Fsy0Ys2u+qG85BPKUbGCpyCvqx/CfP7xcN7GzM84hMCJYoCL1NDp4r2jVxFfvlEDmaiWdWRsqSM60Q5jZtESLWnUXPC+Nq2s+XFg7R22/7/0eB3aUnx1IA1Nkvom02oXBUomV6zDxVTIGmGW3DeKfNIHcwd8kut4SGZA6pDY8WU1st76ghSLWxbN+zYZ38ePTZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(2906002)(2616005)(53546011)(86362001)(8936002)(316002)(66476007)(66556008)(66946007)(6506007)(38100700002)(110136005)(31696002)(8676002)(4326008)(54906003)(4744005)(36756003)(186003)(5660300002)(508600001)(6512007)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTNDRnNyWERVdWMwNWVDVXF2NWtDY0toUml3SytjSGpHZFJQUDZ2VXlQUDZP?=
 =?utf-8?B?VkhtQnQxTjBnVTI3RExBaW5NT0xVVlMrVnp5UUpiN0RzVERVaUpBbWNjem9J?=
 =?utf-8?B?blRLWXpOODlXTldudlJCR1dITjlnSlptUDBSMUNFbWpwMVg3MExZVkEvWGZj?=
 =?utf-8?B?eG16ekZvamU1MFV5QzBsajE5MzZicWhUNDRlaVB1Uy9NMHJTZll5M0RUWXUw?=
 =?utf-8?B?NlpaTmpLVm9acGJHR3I5OHkrd2xJdzdtZmlFTXBiYVpSQVc1Z1hyVkZGTit0?=
 =?utf-8?B?SzBEYk9qMFFpblZPNzVhSTdyaUFMOWJ5U0Rra0pJRDZudW9tUHBRdnBVQ3Fv?=
 =?utf-8?B?YndKN3c1MnFEUjVJMFBSL0ZpSnZLekV2cU5YSDhwVjZqSGtCbFZnK2lvUTlI?=
 =?utf-8?B?QXhxY1FOL01LaGQvSCtRdXlYZzVDUXd4SUt2Uk5INUhZYUt3OGVmVUhtRG5C?=
 =?utf-8?B?dXBOUE9VNmVSK0RvRGp4Rk8rRllTVHIwMWM1UlZRWFdVbThObERVeTE2Njh2?=
 =?utf-8?B?R0VqVDdDd21NZUthcXBXWnQrTWNTZWxEODA0bGZ1bEltckVqc0ROODYydzJP?=
 =?utf-8?B?R3pVZHlLbFBUbUtHS2h6UU82OEcwN3BJSG1ZQTZJSitoYklLTkZlWDVNSWJW?=
 =?utf-8?B?Wmw1aVl6dlVuTjE4czZ5RlBoRm9yejZncUE5amRWdGtPWGFSVExRbVIwSVVa?=
 =?utf-8?B?RlhWYUJtNkhiV29Uc3ZIa2pRREJ3ZXBaOVJyWHlhRDFPWWc1d0RtcU43aE1l?=
 =?utf-8?B?THR6dHJCVExMT1Y1VXY3SkdwWHp0MWZrVVJsMmVTbkJzN0g5dHVGTEF2OHBw?=
 =?utf-8?B?RXBSZThhY1JwN1VycHNMMFZoamZmV250L0plVjFsQWZuUDAyNm51TEJGY3Vx?=
 =?utf-8?B?aFJtR01hbEJSNUQ5TjUydTREbW9vVHVsbkQ1UCsrWVYwMC8wcDFsTHhnblR4?=
 =?utf-8?B?WFlqbll5MTRoMWdlMGluQmszNGFpWjl0anNGRCtJYkQ0M0g0anZWSk0ydm5N?=
 =?utf-8?B?RHlvVmhKYW5TV0J5akF5TVZqWHJlcWRPL1E5SW16THpIV24wTW5GSkZZU005?=
 =?utf-8?B?T2R1RktOTUdGeEpUdFZ2cThyckFkVGNWb081YVdqRlNZdHhQR3lKSFU0Q1dq?=
 =?utf-8?B?anRYaDNCZDcza0c3RlM2c1NHZzAwZWZkaEE1eUl4VXpzWFV2OHZmS0N1S0oy?=
 =?utf-8?B?MUZVdVVrRk1rcjY5Mjk2MWhKUVhpWkZYZnZYK3ZRaEE1dEVscE1sWUk1VXlR?=
 =?utf-8?B?MHVPT2V2NWg2cHZFTnpLKzhtU2c5M3BnSmNjNC9YTmE4TFZqQUVWMTBpYWV6?=
 =?utf-8?B?NzVlQTB0eHBURWR0K09QYTViZXRTNlJ4OTJrMjc3RHBWcW9TMk91bkk2Sm1P?=
 =?utf-8?B?a0RnK3d4LzhBZzNWeXh0V1BGWDg4SjNrTFk1RU55bW9URU9BTm5BMml6K2hJ?=
 =?utf-8?B?c3c5NHNMalRhZUtCMjVRTHdna29jVUhvamVQTjhva2ZsODEyTnJwMW1sZWZT?=
 =?utf-8?B?MjJIZzIvYmpxeVRSM0l2Smw4b3YyOGp3NERIYnBVNXBLekZWZlZwRzNtZ0N1?=
 =?utf-8?B?QU1TVDIxZWVCZHpEL3l4L0lYa1lVNmJlYkhud0ExL0JUZHFMbzhPYm5oa2Vy?=
 =?utf-8?B?RXFHNm5SSVFZU1lRYjRkUEg5UEpOcmdwYnRLNExlVXFzMDFKZDlRUEEwOVRY?=
 =?utf-8?B?ek5qZ1FCR2ZGM3Mzd2pJVHd4anNDbnFVZ1crbFNlZW00bUNnWVRacjJMTDZF?=
 =?utf-8?B?WktnVVJGYTBGbXdCaUE3cGMxSER3Yk1WY2VBUVZsVXpycGRKd0lwNmVWU1dS?=
 =?utf-8?B?L1djSVlJOHFuQSsrV09OUC9MTmpzRVp1ZWFFV0lWb2VDY0w2SzZjQmx6WENa?=
 =?utf-8?B?OU5jaGEvU01XN0xYSE82ZFNHUjJRMG1WYlIzMys2UEtEaS8yUkJGcEcxbGx0?=
 =?utf-8?B?eFNva3h4b2QxSm42bE1MNU1SeHpLRVZ1eUhJUFIyS0ZtZndvcUlURjVVbWs2?=
 =?utf-8?B?ZkU4M3YzU3hBbVhpMDRORkY0OTN5Ni9UZk1ua1I0bkdiSC8yVGZRK0V6U2hS?=
 =?utf-8?B?eG9QVWxBNWY0UHBXOTVEMTF4R2pveER6OHppOE5Bemd3cTNTQkJZMlUwRzBi?=
 =?utf-8?B?amtCS3J5SVNreVFJS0pRdDhQR3BkeUcyN0YwTmhDZk1UdEpsNnRiemFrbjAz?=
 =?utf-8?B?M0VwY1Qwb2UzL3ZqNEc1blRyT004ZCtxVWtvWFQzY3dBYThCNlJWR3lQZlJo?=
 =?utf-8?B?b0NQZFQ4TWltQnNGMmhWc0JqYSt3QnptU3N1NGtyTGp5SmtJM01tOGJPSFFt?=
 =?utf-8?B?QUhPbEphbWdnNjJBRGJmM2JoaDNsSkhTQXhWU0tielhxV1AySHd6dz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e50d11f9-3e18-49fb-9a63-08da4ac750bb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 09:55:14.1015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bs82FZgwP7oUosThjBo0FdvUwZ7YF3nf2/FeW/HfSlKSm40+7Gjz1dXrLDocGf03GYpJ8LvXIHc/AhJ+Uy46ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8379

On 10.06.2022 11:51, Juergen Gross wrote:
> On 10.06.22 11:44, Jan Beulich wrote:
>> On 10.06.2022 10:33, Michal Orzel wrote:
>>> All the members of struct tm are defined as integers but the format tags
>>> used in console driver for snprintf wrongly expect unsigned values. Fix
>>> the tags to expect integers.
>>
>> Perhaps do things the other way around - convert field types to unsigned
>> unless negative values can be stored there? This would match our general
>> aim of using unsigned types when only non-negative values can be held in
>> variables / parameters / fields.
> 
> Don't you think keeping struct tm in sync with the Posix definition should
> be preferred here?

Not necessarily, no. It's not just POSIX which has a (imo bad) habit of
using plain "int" even for values which can never go negative.

Jan

