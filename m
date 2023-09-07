Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 883B9797217
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 13:57:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597295.931516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeDdF-0004Ui-MD; Thu, 07 Sep 2023 11:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597295.931516; Thu, 07 Sep 2023 11:57:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeDdF-0004T2-In; Thu, 07 Sep 2023 11:57:09 +0000
Received: by outflank-mailman (input) for mailman id 597295;
 Thu, 07 Sep 2023 11:57:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=luvz=EX=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qeDdE-0004Sw-H4
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 11:57:08 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20616.outbound.protection.outlook.com
 [2a01:111:f400:fe59::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9eeaa37-4d75-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 13:57:06 +0200 (CEST)
Received: from DM6PR12MB2618.namprd12.prod.outlook.com (2603:10b6:5:49::24) by
 CY8PR12MB7196.namprd12.prod.outlook.com (2603:10b6:930:58::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.30; Thu, 7 Sep 2023 11:57:02 +0000
Received: from DM6PR12MB2618.namprd12.prod.outlook.com
 ([fe80::da03:9b49:1d90:e9d]) by DM6PR12MB2618.namprd12.prod.outlook.com
 ([fe80::da03:9b49:1d90:e9d%6]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 11:57:02 +0000
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
X-Inumbo-ID: a9eeaa37-4d75-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNLzyTS7PJRPRlweo7+jW+d0mpJEiPHTmF1xnnXKn6OUnW0wRhmLYwAQlxrKUP/OuCgBRra7cNW5a6GtEz0D0BW+dh2Ykmz6YhCfbrDlI8JIy9RjOIEmeBd6EOsdn6w3AeExfSz9o8EQqGYA9gNJssL5Jb+9Fh5/24UHdOCIWCHqju4i1x7lmS4HOMFEaVqTSHraW9d9SV90wgvCJk0S2OyBzOjoWMpYglM4JlEwbVnUiZm3NKS5g57kj6z38IH43Se8CU+nAJ8Rr9zXHuGdULKKTwhmbanJlFx+EkwgaE90nNR9Pr6ekGZVFZoJIQQv1o5MPHLyvJzc6QxrH8bu8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ma8U83hnYtF8upM7hyVBMfXe/YLUoHi09bxmUaAOQ5M=;
 b=Cr4/P0nYIKt5I4gw//wLlZpM4ey/EZdsKw7jG380IBZCrDBeAWx2ew4ke8dFY5gpqgl4GdyyGj8W5NsW60b8GioFiGr/gwoQ1gdk3rDjlMstK6iG9j6Qr+9w85jcDcKT+hkCZ/7CHFrvQxo45Ew3IN3payng9eMoOe2LzQ+qAYKX+wZllLLVpbHPQrZB331S0IYooFjCwgVNKp9Ndc0qZdLgVAjCZ3Iun3fL7sKWOgm/nmTgRvrPGo0F+/E6IJ1SGkYBxBNtSG3ZJSix1+nUSFnoOImA0yHS4pEUMtgcfVMTmxgMj2FORFych9wZzHyGA/okYCaoQ6zy26o/90mQbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ma8U83hnYtF8upM7hyVBMfXe/YLUoHi09bxmUaAOQ5M=;
 b=sHS4s+8r0ZpMXTpjAyXh0ykifLBFhsWb2KkYUlheaD9+3kzmMAlZ6EOgnmj14+hCVDONU5Pv9ZlTWO2NiGIqZiyhXwIKM27FHaEMXFFLSw2ro2aBLt3Nk5r0BvfdGMonAEq+QJj/foN7KEx3yYRCcmCekWsHO932kQRQ+OH2rTw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <30fc1a00-9b0f-9d1c-4457-f0cda48dd9ae@amd.com>
Date: Thu, 7 Sep 2023 12:56:55 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v6 01/13] xen/arm64: head.S: Introduce
 enable_{boot,secondary}_cpu_mm()
To: Penny Zheng <penny.zheng@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <20230828013224.669433-1-Henry.Wang@arm.com>
 <20230828013224.669433-2-Henry.Wang@arm.com>
 <b86047a6-f394-8dc0-a4ee-87543d6f9204@amd.com>
 <5767f02d-1236-dba1-12f4-6194cd0ed7ca@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <5767f02d-1236-dba1-12f4-6194cd0ed7ca@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0080.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::20) To DM6PR12MB2618.namprd12.prod.outlook.com
 (2603:10b6:5:49::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2618:EE_|CY8PR12MB7196:EE_
X-MS-Office365-Filtering-Correlation-Id: e8a6dddc-735b-462a-0567-08dbaf998c2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zN9rjcjzBVSTLma1Jw/MooWI2k2bpk6MUK9XyOdxVNro6MVPH6IYZ3SQnQcrqeMAmc66nny3rhpRrgpM3+A/cjnJiP6yGZiSWDHFY/AVDzxBT/qY+8CncHLe0xS2uabUioRoRsC+pIsb+HC+zIziBFOGXzhACZF0g5vENgXGk3XOb2Qj9DUkK/dD2gIBx2WvoVCnnPDDP/AaJO14+gfp5vWbUbT48fL6uk37KqvkKd928sfhayTY0gRJ/L05U+q0PvItZFlPo4iCg5uESHQvKcb71bo7Ybi3fthwdQzSnUasZ9cV0v9xgITnbALk/q0lAu6a7gPq7Is4xzeFh64z3hXSX3Pp/EzARfj1M3UDDV6x7I+YKDeQlOm20xyEJ/u9QQgl7PUr78k75Z/a8pa8/qUwikPHBRlXMpZcgkhoHLGnRCYVx06b6ix2WnM+0575N4sO17MuldDzmGdK+03r1TekbcySNibkSf64k6k368BIan9J3enOKN6KFmvNTwhmeUIyRMjndxXNf/a9nXEzSHW93cEAJ+oHfXw+FArAg5fgTJRmWP+d9Kph5Hfu4PnaqbicUm6W3C6VILiBEGSNl5xgyM5mANXKDWHk1zVhg7ThZeBHkK83Dddwy/KOXXg2ScFYPt3TD9VkH6lPq4bAlA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2618.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(346002)(39860400002)(136003)(186009)(451199024)(1800799009)(5660300002)(4326008)(8676002)(8936002)(6506007)(6486002)(316002)(66946007)(54906003)(66556008)(31686004)(66476007)(41300700001)(478600001)(110136005)(2906002)(6666004)(53546011)(6512007)(26005)(2616005)(83380400001)(38100700002)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGRWQ2twVFlGaUY4elFQaUkyZzVkQWFKazJUVlBHMXVMRG9EdUNtVWxENm56?=
 =?utf-8?B?THg3M3NXa0ZUVG5INFNMT0dyN0FJeEZoUmFvWmJhSDN0Q0VHMExRV0hua3FC?=
 =?utf-8?B?RUxlQ1g1ZXJJaUtTYTV1SVJtWUtHTnhndzZyT21Id3BIRWI5dDVES0k2ZTFC?=
 =?utf-8?B?eGZmbktvc2N3emJnWm1vVzVydHhPUU5TV3NmdW9zV0NUZ2V2Znc4Y1pGUTFk?=
 =?utf-8?B?enQvQUE3RWtLSWlPeG1XY3U1T2FGZVd4ZHVUVCtmdUkxamtJRGc2Y1hTQ0RP?=
 =?utf-8?B?Wkp2RXhVZndGSGVIUXNGbFBKUVBhcnBlUlJjUGtGa2N1NGRUUG94L1FwQ0dI?=
 =?utf-8?B?cjFRSmdsVDdjL2MwTGZRbERUNGg3RXUwYk9oa2hKaWtLc2xMRVRRcmFRcVhL?=
 =?utf-8?B?YUJxOEpuaklpWUhiR0hMSWJVa0xzSHdPbXdSZmFzT3ZzWGlySUwxeUpXUGJS?=
 =?utf-8?B?QlRuajQ0NktuRUdoakpjNnVkUXJLdC9IR3R1bVM3NWxiTStYWDRuR0toa2dI?=
 =?utf-8?B?eXJZdDlpYWlNWlU3Qkx5U3VMdDc2ZjVoeHhhckIzK0lKZkFJSERTalNRQlNj?=
 =?utf-8?B?ditFOThZTFR3aDIreHArOW84azJVa2ZzM1J0eUhMaEZYWVBmYTNTOGZTdlcr?=
 =?utf-8?B?S0wvSjBkclNkQ1FJbkkrS2luTGF4ZCtnS0hWd2tqbldMY3c5Ly9aNXh6ZWpn?=
 =?utf-8?B?MnF3TDFiTSttVk94N3d2TDRabkxZckljY0diQ2lWQTBlaXl1OGZUVlZSOUhm?=
 =?utf-8?B?TE5ybHNSQmZmem1YbDkzYXBmSTgzWURxclQ1QWpsZ3V0VEU3VGZFWC85VStM?=
 =?utf-8?B?aGJJSXV0NEs0WUIyMkdoVUE0a3gxNlVkNGRFUUxCSXBRNWNJN2xacGtrejdQ?=
 =?utf-8?B?OGZtR0k2R0VXWUxQb1VZUjRjWU9wRmdQb3dqalM4S0NBT01HMUlTQ2xJVlp4?=
 =?utf-8?B?T2F5OForRE1FUi96SkJYZnROWi9YZmNtajF6Q012YVFZSFVaSEVQeGRTYS9N?=
 =?utf-8?B?REcyME5leTFXQ0VaemtTd29Scm13UzluQXUxM3UrQVJJdHRnQk00UFk1WGdp?=
 =?utf-8?B?enhkbkt4cjBHREllZ2x4cTF3ZjdMOHF5T0hXYm1lWUt3aFRWajhKYm42SnNk?=
 =?utf-8?B?LytyL2djN1A0bjRPK3dRV0J0cmdSU2lVVHkxOXVEblh1UUZxTXJDL01rTEhJ?=
 =?utf-8?B?Rk9kTmVtZHZFUzRRS2lUZVQvZVp3TGVXWnZyelFJUm85YUlRZUNKcjNvMDAv?=
 =?utf-8?B?WUY0RDh1aWo2M0NRbDdHMmRETjlDNkcya0JERysvem4wOGR3OEJ4d3c0TjlY?=
 =?utf-8?B?RDFHMHlYTVMwaWxoRHloSk1Jbk1TeFRkYnpPZWlXdGRtbmh4ZXBJNk5GL01P?=
 =?utf-8?B?eVhtN3kzK0ZMTi81WDJMazd0MmZ6M3NPVDl6cS9QYWZFVEE3Q2NRdjR4Z2ZS?=
 =?utf-8?B?TkkyeUNLYldYZm9UbjgveEhUb1RRc2h5dStnV3FnSXhmMjdUNWNjSEhpM1RV?=
 =?utf-8?B?QlNaZkxTM0N0VFI1aFdoaURvZkpha0dIRWQ3MFZpZWNHSFExcWZzRjdQNWR1?=
 =?utf-8?B?b1U0UjRteWwzVzdCVTN3eUVJN0dLRmNDSFlLbTd2UE5LQnpxTTV4YTZLZVlv?=
 =?utf-8?B?TGZvNWlLeFJkOXNXRmNoOGVTOTRUb3NHdnpBSEZRQXNSWkZMTTdsZEMranJj?=
 =?utf-8?B?ZVVBcXdRcFJFYXFvMDhLOFpNanI4bFRSVThWQlZ6aERaNkJkZGRHUWR1UmtL?=
 =?utf-8?B?djhYZHMrQkdXVElxS1hWL2VQdUhUY2ZUS1pjSTlubTl5L1pmY3hYd2hiMlRk?=
 =?utf-8?B?ODVMcGh6RVFpSXNKNVdwME1WQUQ1K09XSnlTYVhtNEhtc0VLSTBXMlVMSFJT?=
 =?utf-8?B?SW9iTzBWcFVUR3RVSDNiaHNDVjU3eTN0RlJMYnZCUzVpL0ZqREEwWWV2NDky?=
 =?utf-8?B?Y1pSTnB3TmxSNk9qbnpjU2c3YWxicjdnSW1uWUdmSzRjNFl3dENyTk9DZnJv?=
 =?utf-8?B?cUVxVTJsTG9ubXRKYjBFdktCTFhyRkFGdzIxcEVJU054azZLMjdyc2RadW1p?=
 =?utf-8?B?M1BKWjFTaHFOVmwvUWp4VktaYmI3NnFRcXRqRnJxUENEZ0hKU293dnlxTzgx?=
 =?utf-8?Q?435dA9L6GjqfSaGzSOmPXn6f/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a6dddc-735b-462a-0567-08dbaf998c2f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2618.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 11:57:02.3776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dk1NRrlzX9xNe5CX/oB+x02nrf3pMDmHoCGW/rC16d8eJXSZR7Z4ukBKZc6nPwUg2t3UMDUECBat+dGWTHI87A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7196


On 07/09/2023 11:58, Penny Zheng wrote:
> Hi Ayan
Hi Penny,
>
> On 2023/9/7 17:44, Ayan Kumar Halder wrote:
>> Hi Henry,
>>
>> On 28/08/2023 02:32, Henry Wang wrote:
>>> CAUTION: This message has originated from an External Source. Please 
>>> use proper judgment and caution when opening attachments, clicking 
>>> links, or responding to this email.
>>>
>>>
>>> From: Wei Chen <wei.chen@arm.com>
>>>
>>> At the moment, on MMU system, enable_mmu() will return to an
>>> address in the 1:1 mapping, then each path is responsible to
>>> switch to virtual runtime mapping. Then remove_identity_mapping()
>>> is called on the boot CPU to remove all 1:1 mapping.
>>>
>>> Since remove_identity_mapping() is not necessary on Non-MMU system,
>>> and we also avoid creating empty function for Non-MMU system, trying
>>> to keep only one codeflow in arm64/head.S, we move path switch and
>>> remove_identity_mapping() in enable_mmu() on MMU system.
>>>
>>> As the remove_identity_mapping should only be called for the boot
>>> CPU only, so we introduce enable_boot_cpu_mm() for boot CPU and
>>> enable_secondary_cpu_mm() for secondary CPUs in this patch.
>>>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>>> Reviewed-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>> v6:
>>> - Add Julien's Reviewed-by tag.
>>> v5:
>>> - Add missing "()" in title.
>>> - Use more generic comment in enable_{boot,secondary}_cpu_mm() to
>>>    mention function will return to the vaddr requested by the caller.
>>> - Move 'mov lr, x5' closer to 'b remove_identity_mapping'.
>>> - Drop the 'b fail' for unreachable code in enable_boot_cpu_mm().
>>> v4:
>>> - Clarify remove_identity_mapping() is called on boot CPU and keep
>>>    the function/proc format consistent in commit msg.
>>> - Drop inaccurate (due to the refactor) in-code comment.
>>> - Rename enable_{boot,runtime}_mmu to enable_{boot,secondary}_cpu_mm.
>>> - Reword the in-code comment on top of enable_{boot,secondary}_cpu_mm.
>>> - Call "fail" for unreachable code.
>>> v3:
>>> - new patch
>>> ---
>>>   xen/arch/arm/arm64/head.S | 83 
>>> ++++++++++++++++++++++++++++++---------
>>>   1 file changed, 64 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>>> index 5029013a14..f25a41d36c 100644
>>> --- a/xen/arch/arm/arm64/head.S
>>> +++ b/xen/arch/arm/arm64/head.S
>>> @@ -325,21 +325,11 @@ real_start_efi:
>>>
>>>           bl    check_cpu_mode
>>>           bl    cpu_init
>>> -        bl    create_page_tables
>>> -        load_paddr x0, boot_pgtable
>>> -        bl    enable_mmu
>>>
>>> -        /* We are still in the 1:1 mapping. Jump to the runtime 
>>> Virtual Address. */
>>> -        ldr   x0, =primary_switched
>>> -        br    x0
>>> +        ldr   lr, =primary_switched
>>> +        b     enable_boot_cpu_mm
>>> +
>>>   primary_switched:
>>> -        /*
>>> -         * The 1:1 map may clash with other parts of the Xen 
>>> virtual memory
>>> -         * layout. As it is not used anymore, remove it completely to
>>> -         * avoid having to worry about replacing existing mapping
>>> -         * afterwards.
>>> -         */
>>> -        bl    remove_identity_mapping
>>>           bl    setup_fixmap
>>>   #ifdef CONFIG_EARLY_PRINTK
>>>           /* Use a virtual address to access the UART. */
>>> @@ -384,13 +374,10 @@ GLOBAL(init_secondary)
>>>   #endif
>>>           bl    check_cpu_mode
>>>           bl    cpu_init
>>> -        load_paddr x0, init_ttbr
>>> -        ldr   x0, [x0]
>>> -        bl    enable_mmu
>>>
>>> -        /* We are still in the 1:1 mapping. Jump to the runtime 
>>> Virtual Address. */
>>> -        ldr   x0, =secondary_switched
>>> -        br    x0
>>> +        ldr   lr, =secondary_switched
>>> +        b     enable_secondary_cpu_mm
>>> +
>>>   secondary_switched:
>>>   #ifdef CONFIG_EARLY_PRINTK
>>>           /* Use a virtual address to access the UART. */
>>> @@ -748,6 +735,64 @@ enable_mmu:
>>>           ret
>>>   ENDPROC(enable_mmu)
>>>
>>> +/*
>>> + * Enable mm (turn on the data cache and the MMU) for secondary CPUs.
>>> + * The function will return to the virtual address provided in LR 
>>> (e.g. the
>>> + * runtime mapping).
>>> + *
>>> + * Inputs:
>>> + *   lr : Virtual address to return to.
>>> + *
>>> + * Clobbers x0 - x5
>>> + */
>>> +enable_secondary_cpu_mm:
>>> +        mov   x5, lr
>>> +
>>> +        load_paddr x0, init_ttbr
>>> +        ldr   x0, [x0]
>>> +
>>> +        bl    enable_mmu
>>> +        mov   lr, x5
>>> +
>>> +        /* Return to the virtual address requested by the caller. */
>>> +        ret
>>> +ENDPROC(enable_secondary_cpu_mm)
>>> +
>>> +/*
>>> + * Enable mm (turn on the data cache and the MMU) for the boot CPU.
>>> + * The function will return to the virtual address provided in LR 
>>> (e.g. the
>>> + * runtime mapping).
>>> + *
>>> + * Inputs:
>>> + *   lr : Virtual address to return to.
>>> + *
>>> + * Clobbers x0 - x5
>>> + */
>>> +enable_boot_cpu_mm:
>>> +        mov   x5, lr
>>> +
>>> +        bl    create_page_tables
>>> +        load_paddr x0, boot_pgtable
>>> +
>>> +        bl    enable_mmu
>>> +
>>> +        /*
>>> +         * The MMU is turned on and we are in the 1:1 mapping. Switch
>>> +         * to the runtime mapping.
>>> +         */
>>> +        ldr   x0, =1f
>>> +        br    x0
>>> +1:
>>> +        mov   lr, x5
>>> +        /*
>>> +         * The 1:1 map may clash with other parts of the Xen 
>>> virtual memory
>>> +         * layout. As it is not used anymore, remove it completely 
>>> to avoid
>>> +         * having to worry about replacing existing mapping 
>>> afterwards.
>>> +         * Function will return to the virtual address requested by 
>>> the caller.
>>> +         */
>>> +        b     remove_identity_mapping
>>
>>                  ret
>>
>> I guess you also need this ^^^ (Similar to enable_secondary_cpu_mm() 
>> ). Otherwise PC will not switch to the caller.
>>
>
> We have once talked about whether adding ret here in enable_boot_cpu_mm
> in previous serie.
>
> Since the "ret" in remove_identity_mapping will make user jump to the 
> "lr" we defined before "b remove_identity_mapping", it is redundant to
> add another "ret" here. We will never reach the "ret" here

My bad, I see what you mean.

Unlike arm32/head.S enable_mmu(),

remove_identity_mapping() in not called inside enable_mmu() for arm64.

Sorry for the noise.

You can add my RB.

- Ayan

>
>> It will again invoke remove_identity_mapping() (which is redundant) 
>> and then jump to the caller.
>>
>> - Ayan
>>
>>> +ENDPROC(enable_boot_cpu_mm)
>>> +
>>>   /*
>>>    * Remove the 1:1 map from the page-tables. It is not easy to keep 
>>> track
>>>    * where the 1:1 map was mapped, so we will look for the top-level 
>>> entry
>>> -- 
>>> 2.25.1
>>>
>>>

