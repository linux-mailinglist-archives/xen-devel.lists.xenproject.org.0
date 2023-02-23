Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E61416A089B
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 13:29:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500322.771642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVAj9-0006yJ-RI; Thu, 23 Feb 2023 12:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500322.771642; Thu, 23 Feb 2023 12:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVAj9-0006vL-O1; Thu, 23 Feb 2023 12:29:35 +0000
Received: by outflank-mailman (input) for mailman id 500322;
 Thu, 23 Feb 2023 12:29:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pVAj8-0006t4-5c
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 12:29:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7d00::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b95ddfba-b375-11ed-a82a-c9ca1d2f71af;
 Thu, 23 Feb 2023 13:29:32 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9294.eurprd04.prod.outlook.com (2603:10a6:102:2a5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.18; Thu, 23 Feb
 2023 12:29:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 12:29:30 +0000
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
X-Inumbo-ID: b95ddfba-b375-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xo/nmgehQd3K8GeZQeYb75524r4DlFwDvxsI0UWTXgtB/2Cm05o9dvY10CeecHR5F6a4ll8wvosWeBtKYvhbW38sfz6T60y+K86/MyNGBrddWM6QzAuM6XiN/Cs4bVqX0C58YW3FSS9ojMkesHwtkqxxfIXOQ/BOTiqnseohYYuxmuQOVNY9NFxsZdVE6E2irQPQEvdBay/WGSILX2y/RtTaHqRhZ2/LjH8uc/W+ywBZhV4uipEwYNAt6jTWNaiM1+HyXddaE1dt8gMBigiDBAR23dhssR8k2SIt5GFqpqGdtHvVnFLivOw7UAHmcO4vkGuKaXljIviybDhGzNc3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+Kqgcn4yyNtyr0dF1EqlDuMFZer1dLgbP+SLRTi3Z8=;
 b=gMoI4o4LOdOkCJf69fmJk4FwdmnqmglLsApj8HMX5t2FR5C8Wz5yF3lAn/S/WwjC6tcTYxU41w2LCvGIn8VXsUF8mGj/erDO6V7W1RAG7o0AaMidGlnmOQex30c/u03yC9KnHmFJbmydu7f5YfpGU9MdV6yowoPSklDHfmZElMkkJXxX8smGEKlH6dLaupQ52iqxrlLMS2I0sZFd/JcO5FvOr8K/jBBD5I4FtTq2b5u1uAs8m0QPtiX1KwJ/kvh4VZ7orsmGvKMufIMgl0vo6dSV3Iy57SlTtOZUJ3FaVWp0YVV8j83OxbrAhAL+LfYPl7nC4CCvr9X3vb5sOqTmQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+Kqgcn4yyNtyr0dF1EqlDuMFZer1dLgbP+SLRTi3Z8=;
 b=H8v7aaUB43uo6WO0pXW96F3bl04XijHEAnr2lufUJGILuxwS6tl7IbuXRqH96GSnlBu80Ctcq0oq0aEqAtqsHkMvXEkNWCtpS1UC49CWXh6OJIZ+IIsl564AUhlHTmrnA/ATI35X5++0wqCIly67rVK4PEYrTzPzoabiSDC0J4xaEx2+s2y/BXWQx5LP5+mYu7sX51xbvbq2hMABkqpwOPmDHN8wI/wFzoZ6pjx7PrHY5dBXznQ5JRQyXvX0o+eo9tN9k3dn4q4X0c2XPG2CoHeCZLtWRryzpkdMjXNSHmHQxnPCifhpfyIQ/QiiuVPu9yPVFqXK/HANJtk9V1hKPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <be361ad5-54ac-8b78-0a15-38c02c9573f0@suse.com>
Date: Thu, 23 Feb 2023 13:29:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] x86/vmx: Correct the declaration of
 vmx_asm_vmexit_handler()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xenia Ragiadakou <burzalodowa@gmail.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230223120757.2549079-1-andrew.cooper3@citrix.com>
 <3a088a8e-2d9b-a89e-b7cf-65f9341884e7@suse.com>
In-Reply-To: <3a088a8e-2d9b-a89e-b7cf-65f9341884e7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9294:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f34d047-094c-4a9a-ec5c-08db15999c1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CSh0PNJxB0k4qrT73SWhk1DF4Twt+/7sjTQL3kTbulVV9SGVXtnpXjkDy8DAHeGV9K4OVgVrOjh/OA3nxotbXPyfgYWYkKDBMdtt9h+fp127NFY3p6N0M9gFlZwzth1PY6Zxp9+OgQbSYytiG5eEOTy0Q1yhLCYRIogFEHFUSIi0uLJX6OiDY/q7k+s12/g1j14uA9xTRYSJirgBBltYTOEBJQBfK5SzXKhOSPv+wbCfta3HrbDoaHEhKHKAiMya6HxxqNi7YsgecB1GKUKk9LQiubd74JpjiIzQCVkXj0QddrE++2l8tvnyzQk+WQ2XDYyc6ac/63BMF8NtGHsxPYWcK8b5B8bo8qo97pUc3Dx2NTiMw5fkcqNkRpuXxdNi7MpHBMMqbMp6axp+73wsMinr6s2jhbZw3Zml1tNwh9QR2mbFYOE1jSyoz43ZXdCOqXEhPu+D6IoP5Jiu9Yl1+qb5p5vRyknOSSjMY69OczPzoJmLIxVR7xvxuYzLtk/XKf3ju54lgMPV1qFJj6Z/wNl7NLwVwex4r7lXlm2SLB3AFhSyidWGTQw5erpqpz4r3mPnpCfcLEjuUhQQKA61Ry+whwHsHaWj9LDKUdZZw61pJJ2J3GPMXDPE/ohzmZ86KHW3JPpNqaqWMfG+yz6MCUbzLXdXVrcVjTQBlNPa9fDjamuGVzv/BihEmIA0KVvekhDJoY1NbBbI0VTwdJ05P1NBdFqx1yWFskfX6a1u6Sk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(366004)(136003)(39860400002)(346002)(451199018)(31686004)(31696002)(316002)(6486002)(86362001)(54906003)(66556008)(186003)(8676002)(66946007)(66476007)(6512007)(6506007)(478600001)(26005)(4326008)(6916009)(41300700001)(8936002)(5660300002)(53546011)(38100700002)(2906002)(2616005)(36756003)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3pmYURxOFB6ZHlqVEJ5aDFHdmE2bU9YRVJVeHkxVENrMGpFeFRBdHJLS3RC?=
 =?utf-8?B?OTQ1cnVKMEoxN0ZVY1hwQXpUc3pwY0ZLOHhrOVd4TFZCYk5tVHNOQ0NYcWtL?=
 =?utf-8?B?dFVxbFY2Rk0wNnhOSnkzUWJFeGxiMEN2QjY0Q2picWdtT3pMTks1RmtZaXNT?=
 =?utf-8?B?WVZNR2VESXVzZGZueHM3dHpCaEFFWGJlWktiaEN4bGJCcXpaYzRVMzFhYUN4?=
 =?utf-8?B?WnkrUzE1NC9Za0ZGa0tTZzVkQUNnY3RMYlpjaGxybUVHdHhIYkRFaEJueXMw?=
 =?utf-8?B?QXFNbDR0emdXcjlQMnNKY2pCanJFNGRyaHhWNkJPVjlKWWpEWGtpSDloVHNO?=
 =?utf-8?B?OXlrelozRkszQ2huV0NuWEhBZ1puQ0hNQWFBS3cwY2hrTkhnQVZWTk9pVm1o?=
 =?utf-8?B?aEdDbThzTm53K2FSZG5sRkdKSUNGeGlWdTFlU1FuTzYwakNVekxkVElaK2da?=
 =?utf-8?B?WlRNUzhyVk1KcWhtVUNDYzQvcEVvdEM1NGNMUXZTY0pFZnBOcGZubDR5bVVq?=
 =?utf-8?B?bDB5RHphckVUUHdnSk9xSXJ1VTloWVpCSzg5Z2ZONi8rMUpEZlREWnpiditq?=
 =?utf-8?B?bUcyZE1Vc1ZhbHQreTBRNVc5MWEzSG1FOFFOWVlzVndvMk5GRE9TYnlnUXdI?=
 =?utf-8?B?K001bDVCTUJTTlYyRE1YNS9aam40cnZCdFErdEdaNHI3SGd4aTFnRS9xMUxy?=
 =?utf-8?B?azNZRlg1aG5zMmZxcUUranVyVXlFNUlmRlZ0eDBSUFpSeEx5R3dDRkNIa1cy?=
 =?utf-8?B?ZUlxanA1ZjAyb3kzSjJuUnhOa091OTVMcGVham5ZODl5bUhsa3ppUXdJbzVI?=
 =?utf-8?B?WVhZOGpTNEs2Tko0RFVONFdkWnlONFdEbGk5cVlOTytZV1VVNzRKV2RtZ0h1?=
 =?utf-8?B?aS9qWkpER0pNVnQ4K2drTkpSUG1Cd3AxYURJVFo4aDk4QUpUM0FTTUdCVWFC?=
 =?utf-8?B?VDB3azJOY0dmUmNMbUN0czd5YWVvQnRJS01WSk1aanluT3Y2RS9PNWtQMW9L?=
 =?utf-8?B?a0JiZEp5U0Z3Z01UYVFFQ0RhQnZTMmpHd3N4TVlKL3FaVnQxb0xZOFBXMWhG?=
 =?utf-8?B?cmpsNXNsamFKTlB4S0V1R2g3TEx6SFBmMGNwS0lHcDZyaVNXL1dDbGQ1cDRk?=
 =?utf-8?B?T296UkV6Y2w1c3J2ZHVHWnhORTBZanF2UTRpV1lBalMwazlCNnVkS05MeDVx?=
 =?utf-8?B?Z041RVZ0eUZFdjhaeE1ZbEJpd08xMXF1eW9CQ3l5bUNuYlpxQzV6SzdyVUQ4?=
 =?utf-8?B?cTJGZjYvUzRpcjhibm1nMVNFcHBGRURabktDb3l4SnBLNFF1TFFRaC9pejhp?=
 =?utf-8?B?TkkwVlozZ1N1TGoxZ0lGdUFJOXBlcUl1NG9zV25UaGNyZTBZNVZ6a1dXdkhv?=
 =?utf-8?B?YU90T0MxekNCMzFwTG9hVnkvUE1GZCtoOU5paGYyYlRRRWF2NVplQUhZOVBV?=
 =?utf-8?B?ZStUVVFSK1MrSlFENWJOeFdaK0NSYVFxOHJyc3ZYcWRTZERSaC9jc1l3d0VG?=
 =?utf-8?B?Ukhhdkc3UlJHdGpEZjZhNHByY0RCNElNVG5jUlVpNWFjTkU1ZkVnL0FCbXl4?=
 =?utf-8?B?dUhHWDAzYnJhd29wMmNDMTJNbGEzeHE3cTBodlVLaThlc0I0aS9TTlBFNzY5?=
 =?utf-8?B?RTNBb0t2dzZiRHVmejBrWEFyZmoxaldlbXg0MWZRcisrelN6bXRlRXp6VnRa?=
 =?utf-8?B?aUJaeSt2ZVRUa2thOVJiSk0yZlU2ZVV4RzUyU09jWTZXYWU2bWowUWRCc01s?=
 =?utf-8?B?WGtRZXB3Nlc4Z1ptaFRmamNPbWJ5TGNuSTJqdldJTTZMbGFZY1RLclJmWXla?=
 =?utf-8?B?elExS2NGQjN6TTlJdWx5bm1QMGcvMTdORHpUbkJ4QVV0QmdzZE9WTTZ2K0JY?=
 =?utf-8?B?ZVYySDhtSHNTVDczcVR3ZEpEbnFiL1UzWE5oM0hnVkg5OUJJL01Vc3c5aHYw?=
 =?utf-8?B?MHJ1TFVWdFhnYUFacmUrQzhKN2p5L29vN2pKVFdaRktpTUwwWEwxZ2lsTkp2?=
 =?utf-8?B?S2ZpekJXK09peFZud1g1OWdKb0QyV1gyc1JveVk3OFU4cWJmbG5wdjhuNW5M?=
 =?utf-8?B?MHprMzVhRHEyRElLZzgySThxaEpGOGtrVDRobEp5c3Q3VElSa0tCNWY4T1lC?=
 =?utf-8?Q?sZAjtFWyUp9kI0Bn/cCE1MngV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f34d047-094c-4a9a-ec5c-08db15999c1f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 12:29:29.8136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V32t/06wP4hQX87ZiwW0Nuj0wytZXcieilaV175x1LPAuF4SjThmUazODFm9RvaDX1Xqk4l71kxfG6XzLPJYdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9294

On 23.02.2023 13:28, Jan Beulich wrote:
> On 23.02.2023 13:07, Andrew Cooper wrote:
>> Taking struct cpu_user_regs as a full object is bogus, and while what was
>> probably meant was to take a struct cpu_user_regs pointer, that's still wrong.
>>
>> This isn't a function; its an address stored in the VMCS that the CPU resumes
>> from on VMExit, meaning that it doesn't conform to a normal C API/ABI.
>>
>> Annotate it with `nocall`, and move the declaration into vmcs.c next to its
>> sole user.
>>
>> Fixes: 9c3118a82523 ("bitkeeper revision 1.1159.1.483 (41c0c417XYObowWqbfqU0cdLx30C9w)")
>>                  `-> "Initial Intel VMX support"
>> Reported-by: Jan Beulich <JBeulich@suse.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Since I had to look up what exactly "nocall" expands to, I'm wondering
> whether it really is still the case that Clang doesn't support the error
> attribute ...

Argh, should have looked at your next patch ...

Jan

