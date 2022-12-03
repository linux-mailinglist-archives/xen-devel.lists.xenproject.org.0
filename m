Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3165F6418A3
	for <lists+xen-devel@lfdr.de>; Sat,  3 Dec 2022 21:12:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452783.710580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1Yqs-0007Cm-BC; Sat, 03 Dec 2022 20:11:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452783.710580; Sat, 03 Dec 2022 20:11:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1Yqs-0007Ap-8R; Sat, 03 Dec 2022 20:11:10 +0000
Received: by outflank-mailman (input) for mailman id 452783;
 Sat, 03 Dec 2022 20:11:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vq0y=4B=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p1Yqr-0007Aj-CK
 for xen-devel@lists.xenproject.org; Sat, 03 Dec 2022 20:11:09 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e83::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b232844-7346-11ed-91b6-6bf2151ebd3b;
 Sat, 03 Dec 2022 21:11:02 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM6PR12MB4385.namprd12.prod.outlook.com (2603:10b6:5:2a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Sat, 3 Dec
 2022 20:10:56 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::62cc:47ae:a750:8f57]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::62cc:47ae:a750:8f57%4]) with mapi id 15.20.5880.013; Sat, 3 Dec 2022
 20:10:51 +0000
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
X-Inumbo-ID: 9b232844-7346-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ha+IYurYXF2m5XfbFWBqkQXmnZQ8fDsVWZkR2B/36WHLjSrzVH2QYw9CUVZ8stWJ1sDM//ZbY5ttJouYLevooIgr2qfXVVKznb7dTtKTkoN97FlvmTYWJk0S52qpC4cXAipIDX58Q1lZCx3q+cGM4mee6ghZOxnbXKaeftIIsbcojb6w25j6YfnBCCy539SDm3JVCUSvuHJFhggNGT8VNZsVEwLx+vZ2P169IOcO4W9hj2LbhVQ9mZwJVNgVZvpZbSOZQMREUkKaY6v/MXS6DpBkXjtsnn3Q+JAK6oguXEn1YB64xi30dU9JOYS6VmJlUbothILD8OP++/YoZKepuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDvWbq2p6X+J+Q4Nvc0tfmCpblZay8TArtvg3ZdRtU8=;
 b=caIYI7Mt+6LRtT1UIYuzwpXfB2Cpc9dJK9bgSS1Om79h8Xg1ClBRyoFnmjj5qjddJ2v6qToaJRDmOPTNtB6I05dr1S0ChgweRT7a2PSSpZZ3JlzhcAWZ/kGl+JI9d1EvysMAuCIS+d4mfbXBTWDwxtH+aU7VDc2N94nJKsiaMlAXBnJJR6/DNNTqWQLmvGyEL5W/33rG5OlHVzrLsKeWZDj7u147hrCbGuBd4c3gFJ9YRGTERSM9ohhYKV9wxdMVLGkugInAtmtoannZJhNHg3gT1OctGgyGhUahWR2JLx8yPYJUfJ7Ecn1FyKU+LnkuEhMmRXPA4yBOe3WPMB2E7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDvWbq2p6X+J+Q4Nvc0tfmCpblZay8TArtvg3ZdRtU8=;
 b=q62kQZtNtFhDVjyxYb7WZbz8ZbVcW5ZwfR3yLDMC7UCp7wwRbeT0rA1O8VZCxlDAh3N5d/0clrr6cx/pv1zACZYanMTUKlLcJ3HDpkyf1dXfo7TT82CNs94mnjZm8QLz99G0oJ2msG5cW2qeuaMBbjeQViz6m8NcsdWpvOAYXZ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <83d2e3b6-1aa7-518d-43d8-58f7f90d2ba6@amd.com>
Date: Sat, 3 Dec 2022 20:10:43 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [XEN v3] Xen: Ensure "xenheap_bits - PAGE_SHIFT" can be used as a
 rhs operand of shift operator
To: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "stefanos@xilinx.com" <stefanos@xilinx.com>, "julien@xen.org"
 <julien@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "alistair.francis@wdc.com" <alistair.francis@wdc.com>,
 "connojdavis@gmail.com" <connojdavis@gmail.com>, "wl@xen.org" <wl@xen.org>
References: <20221202123559.33143-1-ayan.kumar.halder@amd.com>
 <1a42f92a-81e3-eba8-6831-900414e0e809@citrix.com> <Y3pdbqojLiyQKUlz@bullseye>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <Y3pdbqojLiyQKUlz@bullseye>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0254.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::26) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM6PR12MB4385:EE_
X-MS-Office365-Filtering-Correlation-Id: 016f9966-604c-4464-115e-08dad56a790f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LrdMq8RIdv6wbhQQl0RUvbh7AkrwtZp4pGlH1D864sv0XGW8SJw/AEOMVQiNYWEFD6Hhy9PdYW18RfE0L11+LF9kHWGLKmmp0bnoBLfO0oDGAkieXHvneydVau2AtRu0QB0/Jxi6rE40gzpM+2jqSH3R35VZA3NMbVFv/uMYKy+RXL7b3C9pORRiIL6W3b9INiRc2/syIPRnCeG4kGkqefKdxqOR80M5+GuUQaXJiFIZZStzC7Rq3DcysrNAS2X6Mx7CehDYT694FLVmfxBMH0bvV6yIgpvlMOmCfCibLO02cYgIG9zyhP8v2sBIazFBkPRxJs73EtqDZKQudqbIgDJn9zCLXizUihweYI8lQuodxVfrQMza5iA3vSzLs5lsKO3UUUVByLxoaW1gq72qAJ7iIuB0oojOg7KViXt/17CXvOuARRT0nc8MnP9Lqpv5N5L5Hag06OYmAy1BE3SYIr3AFVCES09K7DJWaDV3zhK7XEDMiloe4UU4nLuzkyVdbiP+BpKWPYcLQcjzbW6CHdvrU3z+vh3fYtVVQhjHxKIIBjSRwkGOyEcDF4rWox5q3TTY3Qzv/RHPvkzCG6cjoO5YT+iVKKZLIX674t2YqYPxLsoHqxRBYXNCisTQPxu7M0xnNP9B+CS2i6y+uny4H3xm7XjoVZK32sDLuqpoTK7phLz73bQ2bB2Eubz3SsqWNl6rLGTk0LIV3jKA1/SeqOWnDixB1fr1usy1w/b6OtM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(451199015)(2906002)(31696002)(316002)(6506007)(54906003)(110136005)(6666004)(53546011)(6512007)(26005)(6486002)(186003)(2616005)(478600001)(41300700001)(7416002)(5660300002)(4744005)(8936002)(38100700002)(66946007)(4326008)(66556008)(66476007)(8676002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTgrbmxMeTNpczZxY2J3b0VHRWJ6d0U2TTRkSEEyZVREZVZQaFpjTm14eUFW?=
 =?utf-8?B?dHE3RkluMUhKdndQYmQvaUsvR2dldHIwMEMydkFLajliOTl3SFhtZ282a2do?=
 =?utf-8?B?YkxmbUZwcFJTOGg0TDh0Zy9VZ2RyL2tRbFZEdHNFd3VWQjEvT05hQ2hJMFBF?=
 =?utf-8?B?aTVJd1JjUWprOUMvbXdVSGhGM2tJTXZ2K1M4SWFuMi9EbVVsWEhMQy9reDc2?=
 =?utf-8?B?ZkgwSU5MTXhDN1gyWDZ6NDdwZWh2TmFrcm4raFNkNk1LWGVNVXBLM01WNDVx?=
 =?utf-8?B?M3BEWm53UWtBUDVyRldpVUJWUFgxeDVUNDNKcUpCVGVGWGpISFpjZkUxY0ls?=
 =?utf-8?B?MkRXZGYvSmFqTlNnTGxoNWxQZkVwSVo0R3JyS1pRdFlwRGd0SXF6cDVBUVZT?=
 =?utf-8?B?VlduRjZDeWxnKzNDMFMyRVdud1FGVDZ5UHZQUDBQQnp1bHNud3gxRC9tWXVa?=
 =?utf-8?B?dm9PcURocmZVemREbXBiL3ZwUndkcVJmTlkyUHVrMzZaNDAvMlI1cUxpdWpj?=
 =?utf-8?B?SlZFbFA3Qjhvd2drcTVlNXdyZVBhOW1aSytQRVhtVWkvRmdCbE4rakxUaGlY?=
 =?utf-8?B?T2RaTnlkV3UzcS9nZVdsbEF2Wm1NTCtBcTFUQWh2MW9aU05Za1pqQlEzWlJX?=
 =?utf-8?B?SUFKbG1jV2VKVmxOdm1jQXRSUi9HeE43TXZIV3Y4WFZRY21EVFhFRmRvMVFG?=
 =?utf-8?B?akM3cjREdmJNMFdseldlTUtlRVNNYmtzeGdldGRaRWpxYnVTdjJOUDNRd253?=
 =?utf-8?B?WUEzaTc1Q3c0ZnNVcVRBWU9XYktFWEFKZk93cFRVTEcrM25aMlEyV1gzZGlk?=
 =?utf-8?B?NXBFaS9DWmUxTWlmL0lMQm9qbXZ5MEVNV1lPZ0x3UjFWWXVTTi9VRFpQVmRj?=
 =?utf-8?B?czk1L2lTSjRJNFc2NWFuVEthQWV3Wjd6SU9vRTN3SWorUWIyUGQ3Tm02ZHdx?=
 =?utf-8?B?blA4c1huc0ZnalNJdzBZOW45eGEvb2pVS0tkMDlud3NDZWdGOUFTQVdlUnVL?=
 =?utf-8?B?OUNyRUNnYjFrc1ZEaG9zeGRzSzRNanhqK2dMY2dtMzlOMTNNSmwrR1FRU1Nm?=
 =?utf-8?B?MncvclN2QkZNNytKRGZIdlBJLzlHWVJ0WlhXTStyNXJiOXdmMG5kK0Q4TzFv?=
 =?utf-8?B?OWtIWW1DaWlUZEFHN2JzZ0RDcCs4bEJ3RU96VGluRlhhMEFVcTVRRldIblg3?=
 =?utf-8?B?VkMzSitKcVEyaGNXNFZER2lUOFdzWXZXR09RNHR2Tzk5VGJTOGtyOC9EZGNz?=
 =?utf-8?B?TThhallySHlPYkFhUG4vbzBwTzN1cHV6Nk94VVcraUlZdDBnK0tyT0JsWFlx?=
 =?utf-8?B?K2NUdmFxUm5zZmhsWnpYcWE0Q2UycUx4MlR0K0s5Ynp2Yi9DQmFsWUFqS055?=
 =?utf-8?B?WUk2ZDlPTEdvNDhKVkViaWRZRjE4NUVPemJBeGs5NEx5N0hjR0lDMDBDVm1E?=
 =?utf-8?B?czJtYnhyS2h6SUVDM1VRM21xKzI0VDcwUWRNbXJmYy9ydU1aMUxmOG9jRG5Z?=
 =?utf-8?B?REJhRXRGWFpPMzdiTmhPRmVrZjlJYUkxQ29ldENudW5lMHI0L1Q5L1FpTkdF?=
 =?utf-8?B?Tmk2YThVeEpIMkRRb3ZRaFFydkhyOVJHNFNXTHgrR2JXRi9kZzhLMjhTMWFt?=
 =?utf-8?B?T0htalRZZTRiYWJpc3ljV2N2aUgweVpvNDRpUi9Ka1pOdjZEbi9YRmdqc3JL?=
 =?utf-8?B?NGgxSVVhZk9WTTNzMEw0UGZ6WjIzREpzLzlhcHZzYjQyRXV1R0Y3NzFrUFgy?=
 =?utf-8?B?YmJ5K3A5Tk9wQUtwRzVYQk4yeFEyZi9USkNteXhLcmpRMWpPdmJubDNnVWZt?=
 =?utf-8?B?U2haeDVkdE1uaENFOU1vMHpzczA1OW9FT1RpbjZoaXRmU0crcHZIcTZqbWY0?=
 =?utf-8?B?bU84MkxpaHV0R2lMY3lsdkpLOUJ5VEJhRUpQR2liUVM3R1ppL1ZDT3NCQ0Qx?=
 =?utf-8?B?QW81NWFsYU5BN2RvSDRoelJsRW8vZHNxc2NVeVlyTFlDS2FVYTRSU1JMV0VK?=
 =?utf-8?B?Y2NhbWpyaFNxanhJbkVMMzdWdHpaZGd6OWl6QWdzSjd6eDVWcXp2RmoyOUZW?=
 =?utf-8?B?eWFFUnFJSG5XWitKQkhhNFhaQ3J5V2Q2RkdXNUVkQUh3d2ZHd282REZwS2RL?=
 =?utf-8?Q?NL6zTwFWaqzcICLEiqvrIH93k?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 016f9966-604c-4464-115e-08dad56a790f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2022 20:10:51.6094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1EjkJf0o72tSo8YHC+nC7E3Cep22ZghShg4HBtLQzpj4/hvQKXAJwNQ8iQtYFne/0CzLDluJ25dGmevPFuAZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4385

Hi Bobby,

On 20/11/2022 17:01, Bobby Eshleman wrote:
> On Fri, Dec 02, 2022 at 12:56:06PM +0000, Andrew Cooper wrote:
>> On 02/12/2022 12:35, Ayan Kumar Halder wrote:
>>> Currently this change will not have any impact on the existing architectures.
>>> The following table illustrates PADDR_BITS vs BITS_PER_LONG of different archs
>>>
>>> ------------------------------------------------
>>> | Arch      |   PADDR_BITS    |   BITS_PER_LONG |
>>> ------------------------------------------------
>>> | Arm_64    |   48            |   64            |
>>> | Arm_32    |   40            |   32            |
>>> | RISCV_64  |   Don't know    |   64            |
>> Just FYI, I think the answer here is 56 for RISC-V.
>>
>> ~Andrew
>>
> Andrew got it: 56.

Thanks Andrew, Bobby.

Bobby, I couldn't see PADDR_BITS defined anywhere. Did I miss something ?

If not, will you define PADDR_BITS somewhere in xen/arch/riscv/* ?

- Ayan


