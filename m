Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D62976C4C78
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 14:53:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513462.794491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peyuO-0002Hx-6U; Wed, 22 Mar 2023 13:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513462.794491; Wed, 22 Mar 2023 13:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peyuO-0002FV-2S; Wed, 22 Mar 2023 13:53:44 +0000
Received: by outflank-mailman (input) for mailman id 513462;
 Wed, 22 Mar 2023 13:53:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peyuM-0002FP-1r
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 13:53:42 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f318c237-c8b8-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 14:53:40 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7268.eurprd04.prod.outlook.com (2603:10a6:20b:1de::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 13:53:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 13:53:37 +0000
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
X-Inumbo-ID: f318c237-c8b8-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OlGSfUubA+IbaPem4WpLbEXtg6SyweDjjTD30EJSzHyfDGpBkNICB8i3gSHfrSLSVO6UQxAFSu17dBBvqnF0aovS+UxUFi66F438IaHcoi2Jd9b08NYSKcLaMHsx3gN8Fz3vEIV06BnlR2YHr1pvUteu3XDe6lwKBeOiDVJliVyfPmjrZHnijtJnXCY6alRPLwVIChX2pMO1yEdPPMQcpiei98WMviBe5wD0CNMFIQVWiCps115CAtfwBnXQyWq/fPT6Ld09uausrU3csIgORLJ1WCyArfqZ0B+KZTFwk3WHU7Me4FyxlBxY7OUbti3Ic1FW14r2WT4bX+eBsXj0Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4lI/hH5CIFn9u4ZqB8ryW9VG1afFIZ7c5xB1aDbNus=;
 b=eWKGJhNf1Kz7X4w8mhONVMbTEJCQTH/7JPH1hCdYVMc9rqIayFjRTTlsK83O0Gidq+hCxZk/UcV6pV/QIIzPky4dyREm5V0KqD6LHoKR5qQMPjl1l/sTxHAA6zF3WSvb3xOcKWhU2cAboWmBdLTTuPw8O0kGQzo/xPNpQahesbbJwMQTMoR8zSFOCluN6Z9kD9JMHFXowrQlVLf1zQtNC1/Cjgxt2aVU7GMgh4caQ7MBR8WhsGRHdg5PBbPzYUHB/SSmP9jFkPb1n/hLGuizWIdllZ1BO9bfaU8JbDCmaJECBmpV/FlQmj3BlajwPt4j2YgSa2vwhVntqQ6iWI1eYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4lI/hH5CIFn9u4ZqB8ryW9VG1afFIZ7c5xB1aDbNus=;
 b=A860Poktkn6JGd9xraAn7ezM0Zz/UiMnWZV63/hGFQAHohdnNUOnRby4vmXWr/pXGvCJxjwaMn+mn0NmPtJGtRZAGpFhau3qNktoqmDmbSCLsvcj4MBBpHaBy+KqKCD+yZ1NzeLYVe93oyMLB35LQqWitUwF/n+LP2lBWokzB6cvFj2OU7KOl2b9Hqm03nf9ZH2xzlpxQEErOSSp9etpi5DWvX032sFWGxcvkCXstlKtCxXeN6v8Qe0PKWweeWvjyBtcLWEjRxOMGV2WrAWOoF0SqUo0qNjlZq4yIJuUyb2991mOtZSa0yaStSf60K4KHsI4z9BbgqK7A5cb1OgMOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d9f3ef97-1101-ac4b-57b9-be0fa19a7310@suse.com>
Date: Wed, 22 Mar 2023 14:53:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [XEN v4 07/11] xen/arm: Introduce choice to enable 64/32 bit
 physical addressing
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 rahul.singh@arm.com, xen-devel@lists.xenproject.org,
 Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
 <20230321140357.24094-8-ayan.kumar.halder@amd.com>
 <7d90ad7a-5daf-915c-2055-a27ca50d8581@suse.com>
 <e268e11b-8e93-c506-668b-c5c004b3aa06@amd.com>
 <1883c9a3-ad25-ac45-b1fa-d29e19b3cc14@suse.com>
 <01a800a5-1c0d-b9d4-05c7-c886b3e3009d@amd.com>
 <205658ff-e0ac-1656-2d12-099abd891fcd@suse.com>
 <ac320354-454f-f6e6-d2b6-a470b66c7ec7@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ac320354-454f-f6e6-d2b6-a470b66c7ec7@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: de014869-41a1-4e00-a591-08db2adcd627
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OMpwReOA7X+4M7s/X1XNqKIsYtlsWvivloWWdphdR68RRI5fvD9dcgCz7sIHnOTJTcBpFvkk8eRas5FOzJQeepEwlOG/HlBhPiNP1WrLpYAFcWVpy+KSu6/Ay8UxzhBLHAr6EWi8DzXFHmlhZ6WZuUDtKO3bDG/QaoQ+QAK1zaYGWIq/ziMUW5KXh/AJs+yyEz7OM5WaRyB0TD/0HQ21yBEtCDa955LT2L4iH2MehM8OyTADUCWVD9JasafTcVhvDh+Bl2q8JmsLP0HiUpK6JacR7ggSZ0Hy/WcH9Qsq8qkgGJKFmEK+rcNJzda94UW/BB3Ona6YKM7X1jFUQVOJozBO5S7rqADP3HlxSNzOGoExUHujDyBLXBFwAePXKWD5oqBkqSZbpCVd/74rRXsbPtzLhUYg5bCjefC427wtnxuQgZSlIWXF7zUei7eoNHMFa/cGtn6uOJ/3SZRapELfdgEAbU36hTngdjTxvQlBcPw6jBi2RSC+0VmWAcU2yqIJjPSCEmYbQr/SCjQp/B2bgfu4+dB4ttWvStDs/n5JdzfDqrURnIPR1ThoN8kXDTmUKpC5eoDpKsUi6zPCVEZ/+DWoa+7lcC/SpfpiM7FtYvqes4KemUniGkU6sOoqsA5LdpAQIx/OnYePAJiTdPoCDAvDVP010gy4msCaBzvW71dE3o5U7S6MSzXafo+1F/StOOgJPDZFD5kxzvychp892b3WevhLhO0eXZip6bGRGWdplonROIhBdoye5ey3jriE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39860400002)(136003)(366004)(396003)(346002)(451199018)(31696002)(86362001)(36756003)(316002)(4326008)(186003)(66476007)(66946007)(6916009)(8676002)(66556008)(478600001)(53546011)(2616005)(966005)(31686004)(6486002)(6512007)(54906003)(26005)(83380400001)(6506007)(38100700002)(7416002)(5660300002)(2906002)(8936002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0xpNG9HLzRPZEpnbXNsTHk4aUxORDRXY0xZa2gwSTdXaGV1ZzE1YXI1QlFG?=
 =?utf-8?B?M3hoTlFzYnVIUHd6RDdmWEdhejFqSTVObVJmTzdnanZOWTQ3UER2dDNtLzlR?=
 =?utf-8?B?SmlnR2FSbUU4TldoRm1WSU43Y2FCYWo0am9BbXhyUXdMUzJoV0ZRWVZIQ04x?=
 =?utf-8?B?VmhmcGliYkwzVjZZUXFQZnlKZmxYVnVsemtHYXZhT0pnK25lY05iaHRvUlNp?=
 =?utf-8?B?c2tuditlMmhlNkJxSTIzNzUwRUR3TlpUQWswKzFsazRIM29JdFVLakVOZ0h3?=
 =?utf-8?B?SXp0LzBNUUgrK0oyRjg2RnloandROXJTTklMWno0OTJNbVVCN01aK01vVi9m?=
 =?utf-8?B?OEY2TkpWMk9yTC93UFFBZHU2Q2NxbmhxZWRBVWZGbFJscnRqcUJsOXFDSy9E?=
 =?utf-8?B?Zlk5TVFVdVdrRU03ZWNUanRuNXNEZ2FMa0RqRm5qa1A5TlVsdnIzNXFJcElN?=
 =?utf-8?B?R3c2a1Y4cVhqYnNqcTdxcGpzQzM0RlNHUlovbXVRbUNMMklVMDhzOW5Qazlt?=
 =?utf-8?B?QUZ3ektMSWRlb1BMNXRURnpQdXBJMnhRU1N5ZmJhY1AyTll5OEVPbzc4OWhi?=
 =?utf-8?B?K2Y0WGFzc0lnbE1hcHc2L3hYMkp0QlFzeUNNM3dFNWlyVDNlbnNpcURNei9m?=
 =?utf-8?B?SjEyQ2RBa0hBZEwvSVBaVldicVNQZlBHMmhqSjUzMEJSdGNXSlRMOERkWG5B?=
 =?utf-8?B?NHVkT0YwcXRxQzNuTk1vMmNsOW5maWhJQWEzOEhrbVdvNmpsQ01uS1BjS2Uw?=
 =?utf-8?B?NytYNXR1RlFsN0tVY3VUT0RIQlNndnBmdm90MURkMFVFL1FiK3pSSHFiemEy?=
 =?utf-8?B?ZlVnelhGZjUrNzFhSzVTQjRsRitJMmpFMCtFTk95Q0RkUjFpd0FTem9aKzB3?=
 =?utf-8?B?V2RJK2MrdU91L0FOSWJjTHpNNmwrVjZ5d0h1bHNuMnY0WVM2RVpxVFB3dDE0?=
 =?utf-8?B?QjRXbEF2bjFNdGNESFlRc3ZiTlQ5eHQ5VzBVYkF2R3FNS21FMkpscDNUckRw?=
 =?utf-8?B?V214V09xZmswRUNGQkRpVW9QODNVemtHUno0Y2x6V2JkRE0vOTRRcHZIMGFP?=
 =?utf-8?B?eHFDMGdDdzNCT3BvRFdwemdlcVd3L2Vsa3JDOXo3OEdkYVBrOUFqNmhLYXJJ?=
 =?utf-8?B?SXhVRlExZ3FkZ1FZQ2JVemY3NzVOMW84SXQ4ZDRxbTBJb3puMGtvckZjcHA0?=
 =?utf-8?B?TVFZZlEyT1h5UmdCeDVXeWFTR0V4SGJiMi92TWR0RVA3WWxLWWtXcm5waTd6?=
 =?utf-8?B?Y1FlMXBLaDBNYmNPLzUvR29tRUVhd3FWcHRBalZCOHdMdGtLK1hwWjg4ODd1?=
 =?utf-8?B?WFl3TVlGOVYwRk9RNjMreVliaEltczdlQ1gwd2ZYVHhjR3lFOXExUHZCMHRV?=
 =?utf-8?B?djlwaWdVNkJrR0FwbHJvcnA3dUx5U2wyWXlSU3JXT01OL3RzWXhWWmd3TkFW?=
 =?utf-8?B?MUVTVUFNaytuRkpGcWtNV3N6SnFCTVZodlRncUd4Nzd4QXluRENNaWhlREMz?=
 =?utf-8?B?OW5qYmltVVdMWlpBMkdINnRXcmszdHRzdVlObjNnMUlESm80bEpnRWNObWpV?=
 =?utf-8?B?QTVsVGJQMXZQVkU2VHc1aHNDcDFVQ2V1d2JaUTRaSDBKY3RRMTNxd2NnZmtV?=
 =?utf-8?B?OXMxSjVJUklRaUdFUE5tTW1ScUZhZEhhYzlLRzZQWmJvc2xqOEVqSnJmZE1P?=
 =?utf-8?B?SDFkcS9JRndrQVkrd2tEZ045eElxenMxZktQNDJLNWc5ZU1FTVlnL0wyclpX?=
 =?utf-8?B?Zy9xTE5lZ3o4UHNqUXh4UXE4U3dlV3VaRC92R0hrOCs2aEFUTlMvRWgrVkV4?=
 =?utf-8?B?a2dvV0RjREpPU0sxd2h2L29CcE01UFNzdk91bjgxWk02c2h5NHcwVHRZSjFN?=
 =?utf-8?B?Mlh4ZnRTYzdDL2g5aXhQTzlDV3ZGeUxnUHpIOEVQbHRpMzVYeERCNWwxOG1o?=
 =?utf-8?B?Y0VCTDJkZEp4enFvQXNTRkg5TTB5TFE3ekxCQkl5WjRoQlhEeDZ1cW1nM0Vh?=
 =?utf-8?B?U1lCZ3ZoRjhPSG9TREZOY0RZR3VaY1c3WlRETnNYTWoyUVkyUGN5ZlpSRytk?=
 =?utf-8?B?a2pWWXBZaTFNNDFHMnBqcVVVVHY2dzdCRERaN1phRzA4TGtCL1VTU0VQcTlP?=
 =?utf-8?Q?5vxrkC0EhKswXH3T5uXgPEpVQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de014869-41a1-4e00-a591-08db2adcd627
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 13:53:37.8557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rnqiCWyO9yJX47t16+9/r8+YwwsnSlzYYe3B2Ck/Mu1s3HeK503KTWfSb+lHhxbZBehhYTYyClK6990tYl0Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7268

On 22.03.2023 14:29, Julien Grall wrote:
> On 22/03/2023 06:59, Jan Beulich wrote:
>> On 21.03.2023 19:33, Ayan Kumar Halder wrote:
>>> On 21/03/2023 16:53, Jan Beulich wrote:
>>>> On 21.03.2023 17:15, Ayan Kumar Halder wrote:
>>>>> On 21/03/2023 14:22, Jan Beulich wrote:
>>>>>> (Using "unsigned long" for a 32-bit paddr_t is of
>>>>>> course suspicious as well - this ought to be uint32_t.)
>>>>> The problem with using uint32_t for paddr_t is that there are instances
>>>>> where the paddr_t is modified with PAGE_MASK or PAGE_ALIGN.
>>>>>
>>>>> For eg , handle_passthrough_prop()
>>>>>
>>>>>                printk(XENLOG_ERR "Unable to permit to dom%d access to"
>>>>>                       " 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
>>>>>                       kinfo->d->domain_id,
>>>>>                       mstart & PAGE_MASK, PAGE_ALIGN(mstart + size) - 1);
>>>>>
>>>>> And in xen/include/xen/page-size.h,
>>>>>
>>>>> #define PAGE_SIZE           (_AC(1,L) << PAGE_SHIFT)
>>>>> #define PAGE_MASK           (~(PAGE_SIZE-1))
>>>>>
>>>>> Thus, the resulting types are unsigned long. This cannot be printed
>>>>> using %u for PRIpaddr.
>>>> Is there anything wrong with making PAGE_SIZE expand to (1 << PAGE_SHIFT)
>>>> when physical addresses are only 32 bits wide?
>>>
>>> I don't have a strong objection except that this is similar to what
>>> linux is doing today.
>>>
>>> https://elixir.bootlin.com/linux/latest/source/arch/arm/include/asm/page.h#L12
>>>
>>>>
>>>>> I remember some discussion (or comment) that the physical addresses
>>>>> should be represented using 'unsigned long'.
>>>> A reference would be helpful.
>>>
>>> https://lists.xenproject.org/archives/html/xen-devel/2023-02/msg00305.html
>>
>> I see. I guess this will be okay as long as only 32-bit arches elect to
>> use 32-bit physical addresses. Maybe there should be a BUILD_BUG_ON()
>> somewhere, accompanied by a suitable comment?
> 
> Hmmm... We definitely have 40-bits physical address space on Arm32. In 
> fact, my suggestion was not to define paddr_t as unsigned long for 
> everyone but only when PHYS_ADDR_T_32 is selected (AFAICT this is what 
> is done in this patch).
> 
> This is to avoid having to add cast everywhere we are using PAGE_* on 
> paddr_t and print it.
> 
> That said, I realize this means that for 64-bit, we would still use 
> 64-bit integer. I view it as a less a problem (at least on Arm) because 
> registers are always 64-bit. I am open to other suggestion.

It simply struck me as odd to use a 64-bit type for something that was
explicitly said is only going to be 32 bits wide. I would therefore
prefer if we could limit 32-bit paddr_t to 32-bit architectures for
now, as expressed before when asking for a respective BUILD_BUG_ON().
Especially if, as intended, the type definition moves to xen/types.h
(and hence isn't Arm-specific anymore).

Jan

