Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CAA5F45C1
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 16:40:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415595.660204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofj53-0007k3-6U; Tue, 04 Oct 2022 14:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415595.660204; Tue, 04 Oct 2022 14:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofj53-0007hB-3L; Tue, 04 Oct 2022 14:39:33 +0000
Received: by outflank-mailman (input) for mailman id 415595;
 Tue, 04 Oct 2022 14:39:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ofj51-0007h5-Dp
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 14:39:31 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2077.outbound.protection.outlook.com [40.107.21.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a5483db-43f2-11ed-9377-c1cf23e5d27e;
 Tue, 04 Oct 2022 16:39:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8248.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Tue, 4 Oct
 2022 14:39:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 14:39:27 +0000
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
X-Inumbo-ID: 5a5483db-43f2-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YgPVYGXYQ5bzRRNqubA81mA/amzpGhWndJIt+7hNrFO0WvwfJEX1BlS5GoigTpvA5daP2DvN9TSA8VR03UE+zqcochTMU19ea0hrTBT8geqL8NvPLStakwl71EKXHdsWxdn5kQ0ZCPqGVB3UhnMiw+VUp5mJFbhnSTmmdH8Fy/bdI2BG5sIBkK1BVYV+Di/5JW5WnEadjsXHNVnAZkHVGCjAfDtTLbdL5FiypDFR1tZeyqj1W68v6iIPNoVtcIxDGq1Y+JGlx5g6Xiko7g4OsE+36NzcwUCqMIcVK3YqxkWEO5jJFYi4wLqnvv56QeMyU1xb9vGdTXy4yztdRhTrXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Sm/x/xTQ7b1Bl2Pc8zQBk89dP8JJhzZeAjgh6EVbhY=;
 b=EQtALlS9rbUHE5qN24by2oAg3hrhWeRKH6sT02ortuDD9CRBaPL/lcE5M24tsAZqqKROEOSfMKhMCp0OXby3DB9j1h6SyMPbfjRI+oEKFNqRL7Dy0brTeL5YXgJJz5f5XmrJU8K7hCO6exVPJkMxIUzgmXHwin82nhAvIiz9xSlUuiyPSDgPgygRy0NHklIeyLNy//qDkUAFXWeyRomLj+yyP4WaW642whAXg0XbexBGVO9pH8htFExpm/cLnXKX0TrSyI3NyP0GCLLOmMOT9opfR7JJw0C3bspsYeygst3izzZUSH32Xi5sD9w7M2HnxuJ41kW3LDVCO+ut4S4NCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Sm/x/xTQ7b1Bl2Pc8zQBk89dP8JJhzZeAjgh6EVbhY=;
 b=AJjvonxxDkBPVFmWYfrKGdVZduWDJ033GOuxhIjRe8H8TXSu70j1jqTVXf7fVigFXlW0ML/0GHQ3zcX9AEBoejiii/WV9O0xHwM7U+F7jIddDi3sjvUok8EDt+EadE/b+/kPcMOnreCPJjhbVijrQrTe3qikjsDCunLAlbfTTjwXqS085z+MaOFt4PRfhCRtG+xLzY4ZD/fDa6VmYvUlVwiuPXLVrtfMZMJ+j3Gc5nmWycZikygwvLvgiWTlAfNxdM5s3ou8P+xZBe6t59z4uYN42AFVhBReveqQ74MwdsSV9h+CQ5yLPQpQocSdSAdLBjfMTMeqjNNHreW53CXfag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0f3d61a9-aeac-0aba-e930-cee80c9232fe@suse.com>
Date: Tue, 4 Oct 2022 16:39:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use to
 ordinary RAM
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>
References: <Yzb9BDGc45OshRZN@MacBook-Air-de-Roger.local>
 <df0dc3e1-da12-9d42-b652-e33419134d38@suse.com>
 <Yzv92zTdfG748MXO@MacBook-Air-de-Roger.local>
 <19befbce-ac16-19fe-25a0-73678ce440c0@suse.com>
 <YzwNGd0wiAbhDR9e@MacBook-Air-de-Roger.local>
 <db9856f9-1777-8fe5-5b5a-ef3f132193dc@suse.com>
 <YzwQymW3jkfzUQrI@MacBook-Air-de-Roger.local>
 <9aa0569a-bc18-9480-c86a-817222d4fea1@suse.com>
 <Yzwsq/LL/i9ARxiJ@Air-de-Roger>
 <8fcb15bf-4477-78f4-f8ee-33603ef20995@suse.com>
 <Yzw8t4oECUL6tzNB@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yzw8t4oECUL6tzNB@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: cf12c051-55eb-4269-0474-08daa6163d60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ulduJyK5vFasNxqNLR+mdxhU4cTS8P9tFwcEyPjH9ZRJbcL1OZFFSEKRKiaSMPsgx83N+iTUcmKrF4L2tjYeYDCAP/qksWCqFhfbXSB20iy8ua5EKnLH50jXo3T5u6egsrC78DOoKeNf5a8Adrs65PReBRm4t7Nmjp+MM5r8RZYE3a4lG4dww92Bb5NdcGpfI+PuFC3JHzwIL2UDdqnW2VzzvDvfsgKGSz3CgPE9bOotwOVYRZq4UTf2TfORRN+YprF2dnHCi4677evgaYRnNDM25Wu8LE4eSB4pSd9aC/T8ZO802BVk4h4k53QREMbYHWP0BrQQ+SP4zUfjWQhaDyz6wWP90nP2tto4fEyRwlLv98fjDhbESsPRFbNSf48uy+vxsgbjf4dMXs1wIdD+E2n1uKBy2KaYjfLOcvFbPzj5dAH7Nm1mxcQu/PoP3d8u57QiOWSWA8iqAF3AGaNM6izN7pZcImC5bWldoEhsAqlhbgEfiD/wRrnQCZYeBIROSsV+nqzv7MrQwEgWwVqAJpF3soovS1u8xyZgmjBvT2IdCn1U6AQTNnqe4FHTPrdSMBQ+lpDtlF404sWzwdKnlfErlT9tcNhhJhBxPWZq7lrRbvAz5j+GESAoKbPPrpeSFj9aD/Hmn1cxGvnWxiVI+whOpwer3qjrTpQcMHEZ5w1AcmLV0NV3sLReOmNv7DJxfO5gdOi3GaHRbnzQJJRzkpMoqcgEFNceEj3cxFV1/K36WbVBCcw4BTQpmMiaGLQo+xLbo2A02fhsxHWq3lZprCQuz4ERhs+HRT98Y3d13jg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(136003)(346002)(376002)(39860400002)(451199015)(5660300002)(478600001)(8676002)(6486002)(41300700001)(4326008)(66946007)(66476007)(66556008)(6916009)(8936002)(6512007)(26005)(6506007)(53546011)(83380400001)(186003)(2616005)(31696002)(316002)(2906002)(86362001)(38100700002)(54906003)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXNHQzhUcFBpdHVYZCtudnBDT0RuYVVtM1VGaHhKSzhwczhCZ1ZWbENTYzBR?=
 =?utf-8?B?a0FHV0pDRTNwaExWQjRXdHpWNWtvbHRMQTlQNDhFaSsrc1ExeWozYUx5Y0k0?=
 =?utf-8?B?cDlWRG5GUkd2SzczZkNsRU4zWWJXei9VMXhJWjh5UUlGWGk4cUs5SlVWeUZG?=
 =?utf-8?B?dTVia0JFN09idnlrMlUrUkViVFU1ZWNVOXhFOUU4Vlg3ZDRNeFNpQzJaRldP?=
 =?utf-8?B?YVVoR1hzWFpNY1NGYXhMTVdHRnllbjJGaTZNNzVheWdhZFY5aDFsUlkrTDJw?=
 =?utf-8?B?U2FMVEtoWFY5clY4SW5ZKzlOVXpIVW1zb3FyaFhIcnhYRDBlY1MxTmMrM0ZK?=
 =?utf-8?B?QkpnMGF3WlQzVUQzNFBZTU5UQzBSK09GRERTSUdmMEVVdllkU0VMc2dnZlVS?=
 =?utf-8?B?ZjJCRU4wc3p6bHNXbFgxTktZcGN4Z2R5eXUrMHl4eVVPZ2FvZkhIR0ZYbXA2?=
 =?utf-8?B?NjRFbnozUnM1WVNnV3pnNWRaRGtXWVUzWDhidFFSa3BjOXVuMXNTR0pKUkxi?=
 =?utf-8?B?djhvVkNVVWlnQWsxMmhnaHBVd1lOM3BQUDhqcFYyS3VkOXJoUHQySUVDMEVu?=
 =?utf-8?B?UEY0V3Q0NkZKRktJaWRsMXVkeGlQM2ZuUU1oZkRxOXVWeUpMREx6ZEx5bU9L?=
 =?utf-8?B?TGU2SFlpTEZ6K0tKMWNMdG0xYUFRaFRheHBEbExwczJ3cHJzNlhPT3Q2RlNz?=
 =?utf-8?B?eHN4eU43dGQ0Z2czNE5OZTJYZDFUZnJvZFk4cE81TFR6RUJxRTRYcUtPZFU3?=
 =?utf-8?B?aUpxbjY5SWVLLy9nUXNZSk9LU201UmhSS1JLeUhobndhc21oSm1sRXlDQmZ6?=
 =?utf-8?B?SjI3N1A4dzltYTVkYk0wWUQzVHJCTnF1NFhKSEI4WXEvMlUvaG9vWTJXNXVa?=
 =?utf-8?B?WEUyck52R1JGVHAxVGdGWDdWcFRXVUNzMnJLRlNocTQ4bjhvZFFxY1lGN0xn?=
 =?utf-8?B?eWhoNHBWcG56bmlOanJtL200Y2drSUJUYlliRmplN1RoYU5BQ1pTdThPSHIv?=
 =?utf-8?B?enZIREJ2V2FPd0ZpUkdZa042Rlc2V3MyVi83c0pTMXlWcDFsVW93WkJqKzJk?=
 =?utf-8?B?RG1JSm5wZmR0RGZTekY0Y1BCb3VyaWJIaFh0VEkyMUM3STFQTTd5OFJwMnNY?=
 =?utf-8?B?cyt3VUM4VEViQVcwMnRRdVUwc01pdWhycjdRZmVUYWkxOVFjZkR6UW9PbktU?=
 =?utf-8?B?VkZuTHQ2VUJZcXl6QmxMVWQzSlFRUXMzc0x5Zkd5RmpyNlJYSlRnczlJZ1Bk?=
 =?utf-8?B?SE1ZUEw5Q3dXQTZ5cVcrOUVEeGdDT0JhcVAvVnByVmxRdTVmSnBBbUFpU2dt?=
 =?utf-8?B?QWdnc2p2VHZOWlJycEJUSTVLT0JJTlBKbkpGN0FCL2lhTzFCeDFVVjVLMEFp?=
 =?utf-8?B?WDdxenJMREE5dk1YVkYyTjFXWGFxRlJPKzVQeW1UYXVlaE5teFFPekNubkJD?=
 =?utf-8?B?bkluYjdjTVoyWVVvNlBIUnl3THk1OXNwaGVEMU1uQlBSRXIreDZGYzg1SmNv?=
 =?utf-8?B?RXR2K3dMNUwwK1F1akxad1RPbnFrYWI1M3BHSk9nOGRBZDlsVDVqckx5cUgy?=
 =?utf-8?B?cEhIN3dCekQ1MzBFRllVSE5hRktrWVJUejNGbnpuaEF0Unc1dGNLaXNtdk9L?=
 =?utf-8?B?WEhBalg1aS9sNGlXRG8vdytiMDFLM21la2padGJ2MGRjSDZvWjRwQm5aazl0?=
 =?utf-8?B?Y2JvNlpFYVExbjA1emZvaHZFTUVqOE9BNnhzM25tWHg5QktsYXl3U2d2cWJC?=
 =?utf-8?B?YkRBdnNMbzhYUXVWVThEbHU0amF6cFVqVXdDcVAvS2R6d05aL05xdTlacjV4?=
 =?utf-8?B?T2dCZ0dFbXRKSWFjN1BObjMwUVFkd0FoK2ptaUkzR0h0MENYc2JEeXNLdkcr?=
 =?utf-8?B?ZTF0M0xEeWZYbmloRThFVFRpbkRaVFhUSVRjQk9WaUVFd3lUYVNhWnd5a2Nr?=
 =?utf-8?B?OHZEWlRsWGVzOGFJYngvK0dCMSt5SmVmNnlwUkNHaTFiMTVwNDQraVdaMlEy?=
 =?utf-8?B?NFlPQkkvQkdkVTM2ekNTMnZkdVp0eEFGRUZ2cUd5QTZkOGNDbjN1aHRrTE04?=
 =?utf-8?B?Q096SVZNRW84cXRINFg5VkE2K1ZhWHJmYXBlRTZpS3RRaGRpT3hrV3RNN2Na?=
 =?utf-8?Q?XYgS2RE1VEKQ93vUK9PKjVACU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf12c051-55eb-4269-0474-08daa6163d60
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 14:39:27.6946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCbE1qrln6gkLDcwlir0SckvzqI7CThNZIm99LB+KVCA+r33O9SJV4TR2BTwyTQAS/YNZYcK3palGH+Dp2YRAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8248

On 04.10.2022 16:01, Roger Pau Monné wrote:
> On Tue, Oct 04, 2022 at 03:10:57PM +0200, Jan Beulich wrote:
>> On 04.10.2022 14:52, Roger Pau Monné wrote:
>>> On Tue, Oct 04, 2022 at 02:18:31PM +0200, Jan Beulich wrote:
>>>> On 04.10.2022 12:54, Roger Pau Monné wrote:
>>>>> On Tue, Oct 04, 2022 at 12:44:16PM +0200, Jan Beulich wrote:
>>>>>> On 04.10.2022 12:38, Roger Pau Monné wrote:
>>>>>>> On Tue, Oct 04, 2022 at 12:23:23PM +0200, Jan Beulich wrote:
>>>>>>>> On 04.10.2022 11:33, Roger Pau Monné wrote:
>>>>>>>>> On Tue, Oct 04, 2022 at 10:06:36AM +0200, Jan Beulich wrote:
>>>>>>>>>> On 30.09.2022 16:28, Roger Pau Monné wrote:
>>>>>>>>>>> On Fri, Sep 30, 2022 at 09:50:40AM +0200, Jan Beulich wrote:
>>>>>>>>>>>> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
>>>>>>>>>>>> higher priority than the type of the range. To avoid accessing memory at
>>>>>>>>>>>> runtime which was re-used for other purposes, make
>>>>>>>>>>>> efi_arch_process_memory_map() follow suit. While on x86 in theory the
>>>>>>>>>>>> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
>>>>>>>>>>>> E820_ACPI memory there and hence that type's handling can be left alone.
>>>>>>>>>>>
>>>>>>>>>>> What about dom0?  Should it be translated to E820_RESERVED so that
>>>>>>>>>>> dom0 doesn't try to use it either?
>>>>>>>>>>
>>>>>>>>>> I'm afraid I don't understand the questions. Not the least because I
>>>>>>>>>> think "it" can't really mean "dom0" from the earlier sentence.
>>>>>>>>>
>>>>>>>>> Sorry, let me try again:
>>>>>>>>>
>>>>>>>>> The memory map provided to dom0 will contain E820_ACPI entries for
>>>>>>>>> memory ranges with the EFI_MEMORY_RUNTIME attributes in the EFI memory
>>>>>>>>> map.  Is there a risk from dom0 reclaiming such E820_ACPI ranges,
>>>>>>>>> overwriting the data needed for runtime services?
>>>>>>>>
>>>>>>>> How would Dom0 go about doing so? It has no control over what we hand
>>>>>>>> to the page allocator - it can only free pages which were actually
>>>>>>>> allocated to it. E820_ACPI and E820_RESERVED pages are assigned to
>>>>>>>> DomIO - Dom0 can map and access them, but it cannot free them.
>>>>>>>
>>>>>>> Maybe I'm very confused, but what about dom0 overwriting the data
>>>>>>> there, won't it cause issues to runtime services?
>>>>>>
>>>>>> If it overwrites it, of course there are going to be issues. Just like
>>>>>> there are going to be problems from anything else Dom0 does wrong.
>>>>>
>>>>> But would dom0 know it's doing something wrong?
>>>>
>>>> Yes. Please also see my reply to Andrew.
>>>>
>>>>> The region is just marked as E820_ACPI from dom0 PoV, so it doesn't
>>>>> know it's required by EFI runtime services, and dom0 could
>>>>> legitimately overwrite the region once it considers all ACPI parsing
>>>>> done from it's side.
>>>>
>>>> PV Dom0 won't ever see E820_ACPI in the relevant E820 map; this type can
>>>> only appear in the machine E820. In how far PVH Dom0 might need to take
>>>> special care I can't tell right now (but at least for kexec purposes I
>>>> expect Linux isn't going to recycle E820_ACPI regions even going forward).
>>>
>>> Even if unlikely, couldn't some dom0 OS look at the machine map after
>>> processing ACPI and just decide to overwrite the ACPI regions?
>>>
>>> Not that it's useful from an OS PoV, but also we have no statement
>>> saying that E820_ACPI in the machine memory map shouldn't be
>>> overwritten.
>>
>> There are many things we have no statements for, yet we imply certain
>> behavior or restrictions. The machine memory map, imo, clearly isn't
>> intended for this kind of use.
> 
> There isn't much I can say then.  I do feel we are creating rules out
> of thin air.
> 
> I do think the commit message should mention that we rely on dom0 not
> overwriting the data in the E820_ACPI regions on the machine memory
> map.

Hmm, am I getting it right that you think I need to add further
justification for a change I'm _not_ making? And which, if we wanted
to change our behavior, would require a similar change (or perhaps a
change elsewhere) in E820 (i.e. non-EFI) handling? The modification
I'm making is solely towards Xen's internal memory management. I'm
really having a hard time seeing how commenting on expected Dom0
behavior would fit here (leaving aside that I'm still puzzled by both
you and Andrew thinking that there's any whatsoever remote indication
anywhere that Dom0 recycling E820_ACPI could be an okay thing in a PV
Dom0 kernel). The more that marking EfiACPIReclaimMemory anything
other than E820_ACPI might, as iirc you did say yourself, also confuse
e.g. the ACPI subsystem of Dom0's kernel.

But well, would extending that sentence to "While on x86 in theory the
same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
E820_ACPI memory there (and it would be a bug if the Dom0 kernel tried
to do so, bypassing Xen's memory management), hence that type's
handling can be left alone" satisfy your request?

Jan

