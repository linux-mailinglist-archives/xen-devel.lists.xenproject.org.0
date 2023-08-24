Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBDD786D2C
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 12:55:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589949.922031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ7zN-00052o-7B; Thu, 24 Aug 2023 10:54:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589949.922031; Thu, 24 Aug 2023 10:54:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ7zN-000508-4G; Thu, 24 Aug 2023 10:54:57 +0000
Received: by outflank-mailman (input) for mailman id 589949;
 Thu, 24 Aug 2023 10:54:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm8A=EJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qZ7zL-000502-VY
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 10:54:56 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe02::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7accb4e-426c-11ee-9b0c-b553b5be7939;
 Thu, 24 Aug 2023 12:54:53 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS5PR04MB9855.eurprd04.prod.outlook.com (2603:10a6:20b:652::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 10:54:51 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 10:54:51 +0000
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
X-Inumbo-ID: a7accb4e-426c-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBpLKa/mTNX1+Q8c81w/KntGm2CjCaX0PKsC0grCI6RkAjWUL7dj2oW8Ur3YabffXYFUaXaeZ2i3F89Cl8sL3KR6tiIu2h8RCbIxI6tpA4D8OcovHopLRaNEITFZjaYc2NXSiYLxTKgl8WT4asjaJCy2Jsu2o5d63So4uQtZTX9liXOVOWVaqAeZFNLkcuG2dy4DgNdB9EgpJKRHWVvDCodty9G4PZoOe1OinajwBYzIfKHNSt73CaTEnbEkg7i6izlhI3Vp7lqRY7bbB2MR9uPdoOa6FgrAh+feaYYq7KiFonCplxyu/JFB6H2sG52UpnEPIzqItxpWU5yALR0Q9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XD+2B8K1GW+byzjuizA8mHa1/4uQIS6fcTN3eGpOoYw=;
 b=VZYlDr3kqDO+x8BWwygr2jRZYItqJPjF/wWERuBLiWgvOhVtvSyVQ7yOrYJZWIk57WoZ47/sWuynuE3WsLgOJ1yvXpQgKeSXlkWt3HB0JPoAVKV+kyVsRFGRnnyXOfE5IC8BrSZYZwNRIm7EoMZX2nsDClMwmbGrsvqup8PEx+09YWmT8PNNHQoG1vF0SdG2KCWyC/T2I5x+rnvBt7FkUhAxkIsALIjlNZjjQ1gqFPtoFruFTywdGvsd4Su7g7d8gWxj96BY2Us9Vlfs+asW9CnbJ7kw32xmNhbCSzS/7O96bpkX9pS+V78M/sYQdxukwPYbAgCeZ+GCei8gjPbd+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XD+2B8K1GW+byzjuizA8mHa1/4uQIS6fcTN3eGpOoYw=;
 b=nE/fDXyeyIiD8rHHLSYLumqRTmPeVAYNXvklkvlQroU/QUA5bHY2B5tddM7rTyuaam90nC2WnUVECOf55u44F8Hf9FJZgpnlwmONv9T7haqD+oEVpNo3ZLBabQYAN6/DkA/7nNSYKjC4TNe+1Q5OG7IEKpat36ZaVr5/RIK2Wn9/PC46CgfbUjvMO10R5176FbHEcjfz/FTrJuqGdTekTqboPFYanTBZC0AH4tR23/UnwgJra3Q/n7WRFEwFNnJsAS/hn8+FuVqJ9rch/CIBzqqMgtxl/+G9iEIqGzwO6hemDAa6RYKel1lk2ibbajLUyypz/Cb0f+BevEAx5CcFJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Content-Type: multipart/mixed; boundary="------------uM449HLAgCvOhdkik00dVtT1"
Message-ID: <14f3796e-d591-1eb0-7188-8bb44bc582b9@suse.com>
Date: Thu, 24 Aug 2023 12:54:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 06/13] xen/mem_access: address violations of MISRA
 C:2012 Rule 7.3
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>,
 George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Gianluca Luparini <gianluca.luparini@bugseng.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
 <7e4ff67a24206177c5a304055f395cc2983bb994.1691053438.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2308031746340.2127516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308031746340.2127516@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: FR2P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::22) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS5PR04MB9855:EE_
X-MS-Office365-Filtering-Correlation-Id: 2af236e5-3f93-41b9-5df6-08dba4908a50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pZkyHS77H/z2QVgr4jmMkkcAN87YScSOa9HO9AyMzm67Lo5DdspefACq5FZ5jLrwt0ogWY99I3gE+/BGcYV+1PyBtYfs9wvYZiJ0gPlTV9P8mRNNhg4J7hOoBzoWsUH7BNHr4z7DVH7dnjrAeYS3Z5/UFzNHqugB3F+byW2erqC5x3I/NQbEX6n063kMVtgExsS48DSYcva+vfIrSgpchfPnQAAxfHMVJJDzL+jL0/C+2rOhvLySBMllnQT7DntQnREQuFVAGmcgOiLN1GcCIkUCn2h8r2cReU5QKlsboQjXXT9OR22oMyXL6rqLPquhCajMPemwVDm9NX1ucMFmaoapEklgAGYK0ZoYihQOQGvmN0nwBlpSSN7QTCgWEMg6epRFJlOpW5jeQapEGHBNCMX9+ZJBm/QmIj67Er5MuZS7aoitm9cBIlaDBEiKDykbeCSsdA3dRagNKRCDUlNx2KPcTllr7glJ3aH/Swc6FfKKezIZaAYICW2JuEwonCCYPinXUOGx5bJf6WeplNCTXJdUkaMYL2AcQ5ULOXR+z3sE1omL6hjQdUGNdTm2qIlnBQ3w5LoMKGUcstWRWqWf+vDCnBRNJNxZW+3Y1eWkeGwP5RhqLwHe1avnZIEdOEAQ9oqbh/nOJCi1mPj9TBLjFQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(136003)(396003)(366004)(186009)(1800799009)(451199024)(2616005)(5660300002)(8676002)(8936002)(4326008)(235185007)(36756003)(83380400001)(26005)(6666004)(38100700002)(66946007)(66556008)(66476007)(54906003)(316002)(110136005)(478600001)(31686004)(53546011)(41300700001)(6512007)(6506007)(2906002)(86362001)(33964004)(31696002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjNFcWNGcTRVdHZoaks4VjcwcFdJekU2WnovUlZwWEVGbVdTZ1NWdkVkR0F4?=
 =?utf-8?B?UnNJUVlkTUpaSmd4WU9CWE00V1VNdSt1Y0FzOE9EaXpZdlJxNHg1ek5BZGtQ?=
 =?utf-8?B?YVNYUTRQQzE3ZlBqOHVtWGtHR21HaDZEL3VuVi9ncnlqc29XUmM2VDdqbzFV?=
 =?utf-8?B?YTRPNUVCcDMwdEFtWDZ1aGQvcHJvWWdqQlFvUU5SZjZzalRIOUVIRmR3T3Jh?=
 =?utf-8?B?dWZUamFLR0VHT2N1K1o0SDlOVDFTSThGZnBhK2dEeVFMMXN3VmdteTMyRWRw?=
 =?utf-8?B?cnFLSUlGTklNUUZCVEpDZ3ZUNVRjZUpUN0lVOGJlOUhiRnB3WjhtNEhqNzYr?=
 =?utf-8?B?N01rZmdkN25xTjlzNWkxSkpIdzVjNkw1WmdMSUJ0ei93Q3ZSYVlYTHR3QS8x?=
 =?utf-8?B?eW5EMVJOTzVtRFJWamk0REhrZWVoVmt1d1JsVmIydklJMGRJeVQxSUhLVjVi?=
 =?utf-8?B?Sm5aK3JRWkhRcFFmYUlBNG0zSFZ3alp5RGtWckNoVHMwcjMxVElYNzBEczJq?=
 =?utf-8?B?amVzbGRUa3VOYTVtSktOdnp4WkVGcXVFU2VhRnFWRERJZVlrVEJGbS9uUkNK?=
 =?utf-8?B?RW5HUFBBUkVxRUorVUJ2Z2t1TVBVLy9ZOVhYVlY5MHQrQlg0SUZtekFnN0kx?=
 =?utf-8?B?WXRNTGdkZ0VMcFB0VzVLOFBDUi9OT2dGcUFUc1QxM2R6NXRva0xJZVljb29x?=
 =?utf-8?B?NmQ0RGZzNjZ5U1RQcHhtSEwzc2JqdlQ5VmQ5RiswajU2N3BmSWhjVm03Y2pO?=
 =?utf-8?B?aTZ3Z1dia1UvRVlFbG1JWXh1a1NMcTVMM20xeXB6QlF0bHJoZE9EOHF2THlT?=
 =?utf-8?B?RXRFTStCWUxRS052SFg2MnZWMjRrZ2VtYUx1QUdwQUdLbnhGdHd5NEw0SWZI?=
 =?utf-8?B?L1RoY1pabURNRHZXSjBBNGNHQWlZUFYxSG0wVnZER3ZvekYzMnEwamFXTEVP?=
 =?utf-8?B?M250aGtxb3dwVkdWdHBQYWx0REpDL2I4ZiswZWk3RmpSeWo5VHcvL01nL2lo?=
 =?utf-8?B?UE9XV0owbXkvYmlVNlBFMGRHOFJhMmV1ZWlmeFVwcXpLaUwxaVV4dU5rcVJK?=
 =?utf-8?B?YU44TndTaGFwMlpBYlR2QWVqcGpTR2IvelZ4bVRtdyttZ2Vud1BRTnd4TTV3?=
 =?utf-8?B?UStUZSs0QjhGK3lrNFIzY04wekZOdGZUVlhQR3ZWUGlpK3B4M3kvVW0wTUtl?=
 =?utf-8?B?dkVuYjhTSUEzWjUyb3pBQjZPZlY5Y3E0U2ovOVpNelNNYXkxcHk4YW5hNHVn?=
 =?utf-8?B?OHk3LzFRK0g4QlRlQUFyNUp2dkREVTVtT1lnTHlQYlUxQW9VcFpFZ1Y4Rkpw?=
 =?utf-8?B?clM5bS81ejQ2UEJTVkIzTGFQSEgrcHRmNFkxY3ZOVHlQN3YvcmpPNjBOTEpw?=
 =?utf-8?B?dzNrcjZBakhPemo4VWUwYW85bzJyai8vRlBJaFdvMUd1QnJua3A2UVI2TC9m?=
 =?utf-8?B?RjYxSHdmM2RrendFZEV4K3ZKRmVqc2xSRHYyRjJ4RVVTTUdzaVBhZjdvUU9v?=
 =?utf-8?B?Z2NLbGI0VnRPSTJTUjRaQndZS1M1K3FueU1LSEk2RnArNUNicmtmN0hPRS9H?=
 =?utf-8?B?SDduRkQvYlJrb0ZsV2lxRU15ZDJHSmFzYUFqVEw5bDB3MUhPTHQzT3hSYXA4?=
 =?utf-8?B?OVFGdEljSHNBdzNhNFAzZ2thckdJamhDeFNlUnEvR3laSmMyYjJEZDd4Mm5B?=
 =?utf-8?B?cVFzbkxoRDIyc1cxWm5IUjFoQUpDa3B2LzI4d01KQVVXcjZXMDNmbEdWbzBI?=
 =?utf-8?B?b3RwQWFJNWNBYnIxUUVEekVsY3E3anZNSmZ0VW92dlkyM2J4blg4SUc4cnpi?=
 =?utf-8?B?Nkt6NFVubnh0QVlXdFAzQ3UvNkhHMjkvWVZoTzkrcWl3bzJFaTVwelAveFFC?=
 =?utf-8?B?WnIzTHV1Mlh6Zkx0SGJ4NXVNUk1ic2RHcTBwSXFTZmhmVU0zWWpqQU1DR2E1?=
 =?utf-8?B?dzRUbndvM2d5R0s5OGdsYWpkVTg2a3lObHYxWkZuNCtIRytLenoyNEhIWFBn?=
 =?utf-8?B?K1FGWTl3WVpmbnV3N01ob3VXVnlQNGpmY1dsKy9tZy9YRjJrb1dmM1JlKytM?=
 =?utf-8?B?LzR0OS8zV0RzTVJ0RVR2RWZ3ZzBxK20rakZjQjJkTTh5NmI2dzJEUGlPenor?=
 =?utf-8?Q?mxBi4rIoXfjquWCwHYBlAI/Oi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af236e5-3f93-41b9-5df6-08dba4908a50
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 10:54:50.9982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M5XCcgxJFZTdN5Yy07Yu3qKLwHIP0/O83I01BKq/72pug4w5X13DX56PYdOwRFvssNjlKwqeE5onuG5DbHdM5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9855

--------------uM449HLAgCvOhdkik00dVtT1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.08.2023 02:47, Stefano Stabellini wrote:
> On Thu, 3 Aug 2023, Simone Ballarin wrote:
>> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
>>
>> The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
>> states:
>> "The lowercase character 'l' shall not be used in a literal suffix".
>>
>> Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
>> If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.
>>
>> The changes in this patch are mechanical.
>>
>> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I notice this again was committed with an ack by Tamas which has never appeared
on list. At that time I pointed out that the reason may have been connected to
the mail (as you had forwarded) having been a HTML one.

Yet then looks like the same has happened to me, with "Re: Ping: [PATCH]
mem-sharing: move (x86) / drop (Arm) arch_dump_shared_mem_info()". I can't find
record of this in the list archive. And that mail, from all I can tell, was a
plain text one.

George, for the earlier instance Stefano had Cc-ed you, apparently on the
assumption that you might be able to do something about this, or initiate that
something be done. Is there anything that was found out? Just in case I'll
attach the mail I did receive.

I also wonder what other mails from you, Tamas, may not have appeared on list,
and instead were (presumably) only delivered to people explicitly Cc-ed.

Jan
--------------uM449HLAgCvOhdkik00dVtT1
Content-Type: message/rfc822; name="Ping: [PATCH] mem-sharing: move (x86) /
 drop (Arm) arch_dump_shared_mem_info().eml"
Content-Disposition: attachment; filename*0="Ping: [PATCH] mem-sharing: move
 (x86) / drop (Arm) arch_dump"; filename*1="_shared_mem_info().eml"
Content-Transfer-Encoding: 7bit

Received: from PA4PR04MB9269.eurprd04.prod.outlook.com (2603:10a6:102:2a4::20)
 by AS8PR04MB8788.eurprd04.prod.outlook.com with HTTPS; Mon, 21 Aug 2023
 16:20:48 +0000
Received: from DBBPR09CA0027.eurprd09.prod.outlook.com (2603:10a6:10:d4::15)
 by PA4PR04MB9269.eurprd04.prod.outlook.com (2603:10a6:102:2a4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 16:20:47 +0000
Received: from DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::b1) by DBBPR09CA0027.outlook.office365.com
 (2603:10a6:10:d4::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Mon, 21 Aug 2023 16:20:46 +0000
Authentication-Results: spf=pass (sender IP is 209.61.151.227)
 smtp.mailfrom=tklengyel.com; dkim=pass (signature was verified)
 header.d=tklengyel.com;dmarc=bestguesspass action=none
 header.from=tklengyel.com;compauth=pass reason=109
Received-SPF: Pass (protection.outlook.com: domain of tklengyel.com designates
 209.61.151.227 as permitted sender) receiver=protection.outlook.com;
 client-ip=209.61.151.227; helo=rs227.mailgun.us; pr=C
Received: from rs227.mailgun.us (209.61.151.227) by
 DBAEUR03FT006.mail.protection.outlook.com (100.127.142.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6723.11 via Frontend Transport; Mon, 21 Aug 2023 16:20:46 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; s=mailo; t=1692634845; x=1692642045; h=Content-Type: Cc: To: To:
 Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References:
 MIME-Version: Sender: Sender;
 bh=WDPe/KwKFgFBxKVRMieomZVriiR87oLOMI3lhjSnIhQ=;
 b=WCeS9lTur1DP1iorkAVkAskxZ5TRCoqPFIOFlNL1mAvfj016y1znr3KW7xzPJgRocgQStZ1Jn+KtPODVko+Vv3ZDzC5ugGphY5Uo9Yjm0YejPLp3rtViJtYKhZCXs5M8C2gyo3e87GozrstBIql7eVgGL6KZgkn2F/NfPOJFuNqAtV+YsYhF/NpTEj38L8ce0ZRubfKBD6n/weyAslFoVyQFeoJSh0cVL+L0x+IgZ/FOOu7lxjXZHQkkwc67cDRSacIotpQvS4tVUkTP+gnsPQCCtM21KVDKC79s7qXNbfzLgdZ4fHNeXF80mQ0tHw+0gqze85ooIQS5dQLRbs9oaQ==
X-Mailgun-Sending-Ip: 209.61.151.227
X-Mailgun-Sid: WyJjOThjOSIsImpiZXVsaWNoQHN1c2UuY29tIiwiY2Q4NDAiXQ==
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182]) by
 5d64a587c9df with SMTP id 64e38edc61404629fff35d9c (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Mon, 21 Aug 2023 16:20:44 GMT
Sender: tamas@tklengyel.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d62bdd1a97dso3572832276.3
        for <jbeulich@suse.com>; Mon, 21 Aug 2023 09:20:44 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx+zTB0O3lZNHqxVAHUauCuKpqfNxWVfwE3LYEvfS3NVlgT/0rF
	oUxzsxjhPsw4mmEaGLP8Kxk92eVuqO20q7gfPPY=
X-Google-Smtp-Source: AGHT+IEZDX2qZ1XTAeKvtOCGb8tu5uP5P6I/08A/jM+qEzgIE+jYyuP1e7kfM18nOxcTa4RPa8+hsxto7RrdaMb2q9E=
X-Received: by 2002:a25:ce0e:0:b0:d6b:78fe:f1c1 with SMTP id
 x14-20020a25ce0e000000b00d6b78fef1c1mr7223510ybe.65.1692634844183; Mon, 21
 Aug 2023 09:20:44 -0700 (PDT)
References: <b0a49d20-8e82-8264-8241-86a108139682@suse.com> <57ced9f0-95b8-a560-cac9-08d58e2f0b86@suse.com>
In-Reply-To: <57ced9f0-95b8-a560-cac9-08d58e2f0b86@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 21 Aug 2023 18:20:07 +0200
X-Gmail-Original-Message-ID: <CABfawhkmywaLwmtda2RgzbmM14gab1-Xirxsg4COeW-KODk-yA@mail.gmail.com>
Message-ID: <CABfawhkmywaLwmtda2RgzbmM14gab1-Xirxsg4COeW-KODk-yA@mail.gmail.com>
Subject: Re: Ping: [PATCH] mem-sharing: move (x86) / drop (Arm) arch_dump_shared_mem_info()
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Return-Path: bounce+430b55.cd840-jbeulich=suse.com@tklengyel.com
X-MS-Exchange-Organization-ExpirationStartTime: 21 Aug 2023 16:20:46.8370
 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id:
 0b40f0d0-9966-4cfe-ba58-08dba2629382
X-EOPAttributedMessage: 0
X-EOPTenantAttributedMessage: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba:0
X-MS-Exchange-Organization-MessageDirectionality: Incoming
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic:
 DBAEUR03FT006:EE_|PA4PR04MB9269:EE_|AS8PR04MB8788:EE_
X-MS-Exchange-Organization-AuthSource:
 DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-MS-Office365-Filtering-Correlation-Id: 0b40f0d0-9966-4cfe-ba58-08dba2629382
X-MS-Exchange-Organization-SCL: 1
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report:
 CIP:209.61.151.227;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:rs227.mailgun.us;PTR:rs227.mailgun.us;CAT:NONE;SFS:(13230031)(451199024)(5660300002)(6916009)(4744005)(42186006)(54906003)(8676002)(4326008)(1096003)(6666004)(7846003)(9686003)(7636003)(356005)(7596003)(336012)(55446002)(26005)(107886003)(75396010);DIR:INB;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 16:20:46.3214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b40f0d0-9966-4cfe-ba58-08dba2629382
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-AuthSource:
 DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9269
X-MS-Exchange-Transport-EndToEndLatency: 00:00:02.0829930
X-MS-Exchange-Processed-By-BccFoldering: 15.20.6678.031
X-Microsoft-Antispam-Mailbox-Delivery:
 rwl:1;ucf:0;jmr:0;auth:0;dest:I;ENG:(910001)(944506478)(944626604)(920097)(835001)(250001)(410001)(930097)(140003);
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?KyttV2NYVDNSc3R2UlNWMjdNalo1MitDbTlLSXd0dG9Td01xdXhVSHBFbzk5?=
 =?utf-8?B?VVdHNlBWdTlMTG1wWTAxV2taOXVJM1dsZEEyZU9wZUJnTmtUV0RPM1ZQRTdz?=
 =?utf-8?B?YnRoQXVSbUU1WGRUUS9HZ0g4eWIyVFJhc2l2N20xTDdHU1JUMkU2Njh4YTBN?=
 =?utf-8?B?Mk1zMFB5bC9pNEV6K3M1SEY0YVczUitFaUVUelNWMlRVTUc3aFNudVMyUVlx?=
 =?utf-8?B?V2hzTGczOXAyUklJT2lWTnF1dlNqOTZGZFkwUWh2d2VSY1pNRVgwT0k0VjNW?=
 =?utf-8?B?amJuNWpZOUdUMTJDYXRjYVNEWWFjTldQQUtOdGNteEZVbXB1Sjk4ZWVJWHlF?=
 =?utf-8?B?cWlCb0ljRWNtU1dEb2FjMSs4YU9ZYVROK21XOUlUeDdzUmZ4WmVaVEFKTVB6?=
 =?utf-8?B?WmJnMnYzTGZzL3RwazBEdTNTZXR0T1N6Rm9lNWZRc2J1Z3FFdnkzckpXdXVZ?=
 =?utf-8?B?Q0lLUXFwTmd3SmhkaGFtMGZveHAzcW9lajJkSDlTK1RuRzNBa05HdFZVcnRE?=
 =?utf-8?B?NGFYUnY4dzVvclNuS1kvWHRDU3NhQSt5VHN0L1pxYWRuR3FvaU5CRWdZREt5?=
 =?utf-8?B?cVAzTUVZTE9QcVpsakNMTERXMUdpM25SV1VnTkMrUFNMSGU4S2VwenBNblFL?=
 =?utf-8?B?eXk4N09lRHVYMmtadkxJZ1ZWU09zMlh0MTNBY1l3VEN5S0hzVjdrcmdLUC80?=
 =?utf-8?B?alc0bFdiK1V0RXdvTzJLRW0xZnh6KzNHeDQ5Q2pyQURaTUZzZktpbm9TbzQ0?=
 =?utf-8?B?S1dmN2Fod0NOY2VpVXgvMjdKT1REYWZJb050U1k1dFBMV3NEOE1xTEUyb0dv?=
 =?utf-8?B?dGNLWXNvWVhCaGRtR2NnY2Q0OXlrb29XZ05pd2hqby8wN0YzUVRIVUdRYlZD?=
 =?utf-8?B?RFRuTUNNeEp3U1VkUkJ4VlNSb2xuem5zTjY3UThuK3dXN2JDOXZwclBPLzRo?=
 =?utf-8?B?YXNaS1lJdDJHUzBvelgrZC9nYmpCQXZPUURrYU9aaUdMM05NRUFBamlHNmlu?=
 =?utf-8?B?VlV2VWEwaFlvVmhGdGhxZVZhSEJVRnZSUWMvcUV2czVjL09ZTFZNb0FOTlRL?=
 =?utf-8?B?eXJJcGpTbDNCVC9sTUZlY09rajIyUFN3SjdHOXVwazJoTVlUSXNqTHY5endM?=
 =?utf-8?B?NFEraXZBYUwxd2YzNEtGbGZVckdZdHRVRG5VNGNNeFV2N240Zy9KM3Nwb2J3?=
 =?utf-8?B?SU1xdlhHNW45NHpTN0poWXdLL013Q0QwcWcrMkZqWGxwc1ZCR1lwZ3U2VEgv?=
 =?utf-8?B?bUcxd2g1Vy9KRnVHMUdoZDJCekdwbytWZlI1d25SL3V3U2ZCaS9FT3IxalNR?=
 =?utf-8?B?TE9rc3pUNDhUajdJQWhlV0ViOHZ5b0xncGlBdkpmbWhVZHhPazV6WnZQVkFv?=
 =?utf-8?B?SGhGNXlnMllYRVUwT1JnbG8yT0pLNkNPN251RGdDWEp2bFFBdlhOUy9tdlVm?=
 =?utf-8?B?T2tmZ3ZMOTZWbjh5alh3aml6ZWRHcVYzNmhKRFlRMDdBa3FxSDNOQmM0YUNr?=
 =?utf-8?B?UmpSVTE2dVlLZncxdmtiRXE4dzFrZkZjVi80Nkd3eWVDbGVhVmhJdjdzazBn?=
 =?utf-8?B?VVcwQ0sxMmFIcVRHVXhtMlFLMWVLQnFXOHhabTZXeWVGRVdPYXlzSVUxMFIz?=
 =?utf-8?B?TGtsazBjQUNqbS9Gdzk2VFVMdXEvQy9rdHU1dm1FazVGWnVlQlk3WjlmWXlH?=
 =?utf-8?B?TGhLcDFSTm8ySG9pejFiT2UwUEIrU3N5Z2g1MEdPQWszUHplVVBpRzIrUWh3?=
 =?utf-8?B?U1hNRTRxbFc0YThObFZWTTdIQ2RlT1dYcUx0UzJmR0J4dHJyVUlqcmpia0RU?=
 =?utf-8?B?OFpFeHhhMk02NU1BdERWUFZ1RlMzc0poSDBkdkg3anlIS21iMmRTaVVwQ0pY?=
 =?utf-8?B?SEczV0dBd0FJSVNjTFZaSDZDa2FGSG1tRHpUVStUbDhkQ29CdGZhOG5aZCtP?=
 =?utf-8?B?ZEdwZWM4U3U5RVBaWVRiUU80eXY5aVhkRElGYUx3MXFTZmRlVmdHQlFZVHhz?=
 =?utf-8?B?WlJVQTZvTkZRMU83Y3ZRKzUvcWtyL0xnMG5GcGp5WEdhWXduMEZ5bGNRRU50?=
 =?utf-8?B?OE9hWG1TcG5ac2UvMzdHZW9sakF1SDZuTUhMQUhCMmZ5WkdMTWN6Wmd5NVRB?=
 =?utf-8?B?Y0N3VHhmbE9BRzBiTFhrYklCcDNXUTZvazB3aStYdTJhdkw1ZG8vMFJXcXJk?=
 =?utf-8?Q?Ezl5cteDmojroGAJGyvslKc=3D?=
MIME-Version: 1.0

> > When !MEM_SHARING no useful output is produced. Move the function into
> > mm/mem_sharing.c while conditionalizing the call to it, thus allowing to
> > drop it altogether from Arm (and eliminating the need to introduce stubs
> > on PPC and RISC-V).
> >
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> Tamas - any chance of an ack?

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

--------------uM449HLAgCvOhdkik00dVtT1--

