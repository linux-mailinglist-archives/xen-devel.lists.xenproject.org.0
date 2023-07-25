Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C9F760CCA
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 10:16:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569524.890349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qODDX-00067D-5a; Tue, 25 Jul 2023 08:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569524.890349; Tue, 25 Jul 2023 08:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qODDX-00064O-1g; Tue, 25 Jul 2023 08:16:27 +0000
Received: by outflank-mailman (input) for mailman id 569524;
 Tue, 25 Jul 2023 08:16:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nivo=DL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qODDV-00064C-CI
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 08:16:25 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20611.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 871d0864-2ac3-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 10:16:17 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS5PR04MB9944.eurprd04.prod.outlook.com (2603:10a6:20b:682::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 08:16:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 08:16:20 +0000
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
X-Inumbo-ID: 871d0864-2ac3-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ch5NkPY+GFt9nyypKSpM8CgyE+AYEu1uughn0qTX+uIwWhUfwH8JJ2uqyGmLVYbWzmb+7DWjC+aamZeQ4AEYtRIcHG2diHXl5NEeSdiISgT30srFP/qMDj4lPSKc9be93rBJZNU0/PEUnW0MUj3WE1u9YKOY47k6h1WmtLV02n/2eRs6qZEuPS3m/TW/IIUP3p4OHKo5nhqqsZqDtwh4Way4jiDYuW/Tl3jaKI14LrdVzbeu+LfcH2axPnJHX5voDr8Xap7DRIFCFV0ojzItO5OZBPZAYVrHoouQ9DsuCFoikZKDIFVlXQhBgXpvtKxwjBaCzojY6Wq8F8cWUC6P2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDUGSo8T5zYHmBk6fUObDr8uwP+vbIqt8tciC8vMC7k=;
 b=dx7PARJmxeAhWAqwnXYCwylICBGfnOwuX+pWnxAub3SLRNkoiRZnG7MHyg0rkNaQcNYa1rrpPUOZPH8W0K4HIB2iGfh497YHOYSnnwEsM/Lo4VpEv36q48wjkpBpPhTfemhgvWSTTl0OjcCLjIBBlqCKpZbzLI6t7GWTKPcV5s+e4U13QNi5Uw6A9AXAbJrHpkPvCtKR6KRqJRXj+d9GWVWgv1HLM+/7nX1GFg5XVnghHVPyzoo0AWCt47QX/au7qbGhlyrweftIoo6dl3iT6rhF4P0/L1QGv35Lyb7cFUTRmFx3q0fUmiN0av+aT1DS8PtZxhRJRqE/jNQlIcp0FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDUGSo8T5zYHmBk6fUObDr8uwP+vbIqt8tciC8vMC7k=;
 b=pxLG/nyK504mhcAffPLVVaT5LrRBA2yHHtKanUn43o4U6xLwQZCdHriKzgjuml99dEPnrNnUvYyuCRCvqtg9rOHaVdCAAnJJdWR9eChiEY969J1gHupNGjrNBBF7BF6jLVPnDTzOM5UC9Qx8XZ3d4e3MZvuzdw0R0CVKlio9ECC9KBG8nBxFhSqrlAxEeYroQG/5v2yjuE08v8bgjrs790gJedWtPukSG9atUlAy2p3xcdUXCfGIAK0MGhndJDS4aAtoB/qJtYcBOp5quVoSJW68ZtrioAED/UF1siaQo/mrdeYuYGZriLUuWiIZPz4DOgXZUUcI9KA2uk7V+Wjc4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d8aeb29b-1284-98bc-de75-3d5d8a825e1b@suse.com>
Date: Tue, 25 Jul 2023 10:16:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/2] xen/riscv: introduce identity mapping
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1690191480.git.oleksii.kurochko@gmail.com>
 <a8ab1829ab718dda869db3df3348ded211e81967.1690191480.git.oleksii.kurochko@gmail.com>
 <c32d8be8-75cf-78f8-304d-247b93b611cb@suse.com>
 <dddc1effe5fc112f79a84e4f0a7ccf283877a466.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <dddc1effe5fc112f79a84e4f0a7ccf283877a466.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS5PR04MB9944:EE_
X-MS-Office365-Filtering-Correlation-Id: 752c6799-e5ce-45f3-0e2b-08db8ce76d3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EA+dLGmbSdE1Acv1IC76pBRWdrnRUHCaK+Rmiq0XMV2wGQ/lCS8I35+AVjyXnt8wJbmQg+HbCOfYWTKZPNFWfzjMlXedxITZFeaYqSGZW4TOUGLqjbNN+lv3F+EZTN32IX/aQKzBDfzBBNiZaun/qVsv4rPwhDZkfTEchtfoAOblleCEfgxgTs1DIQv8V8GyPaK46Ux8a4sSrBNV9hIxXUDNYND2/HhIK8PgR/kzb533/ETtFb1ByfgbAOgZwVkTj9VcLMUJncENlR9IMt6dxgxStLzf/COk7a0QoBeDAUEske25wxtnKwd83nC4T6KKzTscTZeUceZCmUeULnkUa95E+9qoJr2i+Jg80DAzi1FGu/lYfGCjCMRpZrUc2g5Vn4TCkbLVWLgDALysko5Znx6F+DAeImVICRujgL7XTYlB1o/FImSszAvKi5jGHvd7U3iCCBo4ztW+TMHHOipZMMrhWM8wZb/EzJQqhCjR7OGLOa4Bibshuq7gWjJBvvEQ83pELjP/1MUyoGCOtBaHD36h52cS26lH5jJfoN5xu1iElwB3Gb5PX7AvjASFo5PKnpHx0sF+7FQ8CTPtevGapcC5IIV/nGEDVeY8WolUYjV4QxsGAsD1y6XjcqQCP6DMVk4mt9bv+L1zTwKxXbnppg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(136003)(346002)(39860400002)(366004)(451199021)(54906003)(66946007)(66556008)(66476007)(2616005)(36756003)(83380400001)(86362001)(31696002)(38100700002)(478600001)(186003)(6506007)(6486002)(6512007)(53546011)(26005)(31686004)(41300700001)(5660300002)(316002)(2906002)(6916009)(4326008)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1lUOTJ2TmJUdGJvYVAxVnNtWUJ3WDhPS1RrU21JVFVDVFFSWUxGYzZPSjQ3?=
 =?utf-8?B?TytkbHpLT2paZEIzZUtRRitNYjZ2YmZFTXFiQ3VqY2t0SmVnUE1kSzRrUVhr?=
 =?utf-8?B?ZGFjbHJnNlVGeGoydmNWL1pnTDVJcTljY1JaNm5TOFVUM0ZtemxuK3NmaWVq?=
 =?utf-8?B?Y29QdGxBQW00Y09LZjVDOXBOWXZma3BoQVdYODlKTjFCOCsxVFdNOFp6WS9S?=
 =?utf-8?B?RlEwRld0U0tzYmhDSlJlT1ZxQWVnbmgxek1MNXdYcitpZHFDekFpL0JYU0dk?=
 =?utf-8?B?YS9ST2JjeTRPZ29MaFBGWS95QytWUzc1T1BjemlyMmQvVVNVRXQxWXRLcHNl?=
 =?utf-8?B?UGcvSW11cGpYN3c4bllxV0d5Zmh2SCtJWHRrOWtzYi9ldVhSdXdhd2RDa2dW?=
 =?utf-8?B?UnJBVzU1UXhpWDdqU0JpZUpnZk5Kc3o4UWdMcGU4SjZkaE85dktFOGRCeEQy?=
 =?utf-8?B?VStPaUgvNERGTWhNN1YxMnpZeWcvNUZ0NC9VdnpDSGx1c2V2Vmd3VE5Rdllj?=
 =?utf-8?B?bEluR3BFRzJJU05VbStaZldYN3R2TmJJa015QnBrQWlLZG04czh2ckkzSkFn?=
 =?utf-8?B?WEticWtoMHNITmNHNE9VYmM1b0cyTitsOENhYythWUhqMkhtcnVWY3QzTEJy?=
 =?utf-8?B?U3I0UHJNTmhkenVMdi9yWm92Tkt2cnlhNmhrUS9xWVNmRmFXUW9Sdmw3eENL?=
 =?utf-8?B?QjZBaS9ISGt2cFcwTEpYUjlNd2hvekdGalMwUFp1WmFhYnBPbWY2eElpS2dZ?=
 =?utf-8?B?R0Y4ckdLSXlvZlMxa1U0UW85NDZSZ1Vsa2I5MllBb1NLYXBjR0R0L0tUOEFV?=
 =?utf-8?B?RWdrb3VoT3ZYK28rRGUzejVKUnQ1ZGJYcFJNcjk4bEdBampVVzZ2NFBQREJ6?=
 =?utf-8?B?UnJ4ZThUemhBYUd0TjdKS0s5ek1yNTlhSFA3UGlZdW5kWURhVWJ0bnl0UC9I?=
 =?utf-8?B?ZDRrR3pyZTROL0VMeTlFcjZ6K1hqVHdXWnBTUGRYSFVUczBpeE9uZWU0OTRN?=
 =?utf-8?B?dE1JRnFzRUFWUEM0L3hjVWxnMFhrL1pUU1NOeHdsVXBQd3puOXJjZmFTcWZX?=
 =?utf-8?B?eHRnRnJGaFlOQ2pJZHQ1aHBQSmozbll4TTlieUR0azFHNlArU2xBSEVSM1Bw?=
 =?utf-8?B?SFVzN3lkaHUraThnd1lMbHJpdjU3WTdFbUpqLy9ERlJYakFFK1NDWmsvc2Yx?=
 =?utf-8?B?bjlXWHRTVmpmYTlBRndOQ0ZZeEhhNkR4UmxTbnNUK1hjVjd5L3J0VzVYV1hn?=
 =?utf-8?B?YlN1emdCTlFWTjRuSEdVRHk5YmVGM0NMNnNXTDFSR1F6dnpNbUJHR3E0QkNT?=
 =?utf-8?B?R3F2QnVSZVZMZEI5ZDN4U3k4azVTMjRydjA0UVFYZ2lURFlLWGlGbXBESzVm?=
 =?utf-8?B?QjdWM1RpYnBPck1PcURWN0M1UGJHU2p6aFltdVNVdDdaK0MvcGJ0aFBpa3NM?=
 =?utf-8?B?eDZTYXUyRG5xbnJ5L3IvVGxMdUdQTE1LNmVGZFg1ai9oZkJvcC9rcmpVRWFL?=
 =?utf-8?B?Nmw0d3Z3elY3dys3cXQyMkkxYWQvZ3JTOVNTaWltdlJ1cUlZMU5iVUpEcFBw?=
 =?utf-8?B?aHR2clNjMk9LcXBLSHhoQ0Y5eWxCOWpIMTVXM2JDdnJybDhiN0VwVjNaM3Zn?=
 =?utf-8?B?RlNWTGE4ajJnRzhzNStFZWt6Yk9YN0psamZqMzRNeFRFTmh1b1l2MWMyV0pr?=
 =?utf-8?B?OUlkN0dVUzNYNjNzdnlpdmdxTkdwVFpTZmhoQWJmRWxEeDVOVGFiSHBNSTJz?=
 =?utf-8?B?aHN3Y2tULzlBR3BwSElXVkEzL0Fpa3Jqdkx0YVYrWFV3V1AyMTNqL1IrQ1lL?=
 =?utf-8?B?b0c4NUduaS9PNUZXS1BTY1BFWkZDMWZ2aGlEWFBST3ZmenQ3SHUyS3kyNUtE?=
 =?utf-8?B?Y3JqVXJoMEdCTS85a3o3MHNad1hTZWFMK0RrM3RydkEwUXhtNXJaTDVZNDZX?=
 =?utf-8?B?MmZSQnlLQUdGUTBxQjVlMUhLbTkzSVpvdVhrWEw3WFp5enBkVWFySm5QZlc1?=
 =?utf-8?B?MVpWQ01CQW5XT081S3pLZWRxMmU3N0pUYjFMRUw4bTNNM2ZXYTVHRW9uT2Jy?=
 =?utf-8?B?T0FkTHJ5QWFKMzhSdDZNZHF1MVVRdWhrbWNMVnN2SDhMcjdaMmdXQWtlL3F6?=
 =?utf-8?Q?KQtzd57E8Y9mLnsj/DJZFgwya?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 752c6799-e5ce-45f3-0e2b-08db8ce76d3b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 08:16:20.2100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: immbaLPzr1TkKlkQ5WuR0hWyFXuYuP9I3EC+Ghc7hJ/IwguSR4lRlSjZPAvMCPs3TOLi6W1UeyHZC01rM2V0Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9944

On 24.07.2023 18:00, Oleksii wrote:
> On Mon, 2023-07-24 at 16:11 +0200, Jan Beulich wrote:
>> On 24.07.2023 11:42, Oleksii Kurochko wrote:
>>> +void __init remove_identity_mapping(void)
>>> +{
>>> +    static pte_t *pgtbl = stage1_pgtbl_root;
>>> +    static unsigned long load_start = XEN_VIRT_START;
>>> +    static unsigned int pt_level = CONFIG_PAGING_LEVELS - 1;
>>
>> These all want to be __initdata, but personally I find this way of
>> recursing a little odd. Let's see what the maintainers say.
> I'm not completely happy either. Initially I thought that it would be
> better to pass all this stuff as function's arguments.
> 
> But then it is needed to provide an access to stage1_pgtbl_root (
> get_root_pt() function ? ). So remove_identity_mapping() will be called
> as remove_identity_mapping(get_root_pt(), _start, CONFIG_PAGING_LELVELS
> -1 ) or remove_identity_mapping(NULL, _start, CONFIG_PAGING_LELVELS -1
> ) and then check if first argument is NULL then initialize it with
> stage1_pgtbl_root.
> Also I am not sure that an 'user' should provide all this information
> to such function.
> 
> Could you recommend something better?

Well, to avoid the mess you are describing I would consider making
remove_identity_mapping() itself a thin wrapper around the actual
function which then invokes itself recursively. That'll keep the
top-level call site tidy, and all the technical details confined to
the (then) two functions.

>>> +    unsigned long load_end = LINK_TO_LOAD(_end);
>>> +    unsigned long xen_size;
>>> +    unsigned long pt_level_size = XEN_PT_LEVEL_SIZE(pt_level);
>>> +    unsigned long pte_nums;
>>> +
>>> +    unsigned long virt_indx = pt_index(pt_level, XEN_VIRT_START);
>>> +    unsigned long indx;
>>> +
>>> +    if ( load_start == XEN_VIRT_START )
>>> +        load_start = LINK_TO_LOAD(_start);
>>> +
>>> +    xen_size = load_end - load_start;
>>
>> When you come here recursively, don't you need to limit this
>> instance of the function to a single page table's worth of address
>> space (at the given level), using load_end only if that's yet
>> lower?
> Do you mean a case when load_start > load_end? If yes then I missed
> that.

No, my concern is with the page table presently acted upon covering
only a limited part of the address space. That "limited" is the full
address space only for the top level table. You won't observe this
though unless the Xen image crosses a 2Mb boundary. But if it does
(and it may help if you arranged for big enough an image just for
the purpose of debugging, simply by inserting enough dead code or
data), and if all mappings are 4k ones, you'd run past the first L1
table's worth of mappings on the first invocation of this function
with a L1 table. (Of course hitting the condition may further
require Xen and 1:1 mappings to be sufficiently close to one another,
so that the zapping doesn't already occur at higher levels. But then
the same situation could arise at higher levels when the image
crosses a 1Gb or 512Gb boundary.)

>>> +    pte_nums = ROUNDUP(xen_size, pt_level_size) / pt_level_size;
>>> +
>>> +    while ( pte_nums-- )
>>> +    {
>>> +        indx = pt_index(pt_level, load_start);
>>>  
>>> -    switch_stack_and_jump((unsigned long)cpu0_boot_stack +
>>> STACK_SIZE,
>>> -                          cont_after_mmu_is_enabled);
>>> +        if ( virt_indx != indx )
>>> +        {
>>> +            pgtbl[indx].pte = 0;
>>> +            load_start += XEN_PT_LEVEL_SIZE(pt_level);
>>> +        }
>>> +        else
>>> +        {
>>> +            pgtbl =  (pte_t
>>> *)LOAD_TO_LINK(pte_to_paddr(pgtbl[indx]));
>>
>> Nit: Stray double blank.
> Thanks.
>>
>>> +            pt_level--;
>>> +            remove_identity_mapping();
>>
>> Don't you need to restore pgtbl and pt_level here before the loop
>> can continue? And because of depending on load_start, which would
>> have moved, xen_size also needs suitably reducing, I think. Plus
>> pte_nums as well, since that in turn was calculated from xen_size.
> I forgot to restore pgtbl and pt_level because initially I used a
> function arguments to pass that information so it wasn't needed to
> restore them.
> 
> Regarding xen_size and pte_nums it looks like it is needed to init only
> once on each page table level.
> For example we have the following situation:
>   ----------------------
>    non-identity-mapping
>    identity-mapping
>   ---------------------- C
>    identity-mapping
>   ---------------------- B
>    identity-mapping
>   ---------------------- A
> So we calculated that we need to remove 3 ptes, for first two ptes ( as
> only identity mapping is there) are removed without any issue, then
> move load_addr to C and run recursion
> for the pte 'C' to go to next page table level.
> At new level we are calculating how many ptes are needed to be removed
> and remove only necessary amount of ptes.
> When we will back to prev page table level pte_num will be 1 then we
> will go to the head of the cycle, decrease pte_num to 0 and exit.

I think I agree that this case is okay.

> The same is with the case when non-idenitity-mapping is lower than
> identity mapping ( but it looks like it is not a case becase
> XEN_VIRT_START addr is the highest address by its defintion. Probably
> it is needed to add a check ):

And it looks like this case being impossible is what voids my respective
remark. (Might be worth adding a comment to this effect.)

Jan

> we know that pte_num = 3 at some level. Then we go to the next level
> and remove there only identity map ptes, back to previous level,
> decrease pte_num to 2 and remove only 2 remaining ptes.
> 
> ~ Oleksii
> 


