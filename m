Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0285E7D53FE
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 16:27:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622029.969111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvINN-0004LI-Az; Tue, 24 Oct 2023 14:27:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622029.969111; Tue, 24 Oct 2023 14:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvINN-0004Ig-7t; Tue, 24 Oct 2023 14:27:21 +0000
Received: by outflank-mailman (input) for mailman id 622029;
 Tue, 24 Oct 2023 14:27:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=krZT=GG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvINL-0004IY-Gk
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 14:27:19 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f8486d1-7279-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 16:27:18 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9254.eurprd04.prod.outlook.com (2603:10a6:102:2bc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Tue, 24 Oct
 2023 14:27:15 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 14:27:15 +0000
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
X-Inumbo-ID: 6f8486d1-7279-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLX1XJWMvI0DI2CrGV11l9vJB37P55ZZbGBlTt9ltLYKSS+3oNdrMPW8Sl/EbQhVsfOscnsQC7NWm/7Zt/LlpQL1NWqYReFGDyE/CBWWFzODdGt2DEOVYRBpXrG3cg9M+3VbdybvPfVNDklaTRGA4PfpW1BJtcfXnGrJbFzQ79YoJds+F0Scc1dMWI6vAVHeoUiC9zBtCcWTIEk2a8ecK5+bnVSS1cGa8X8Ww6lbMQG9KuRV9bbfJE+9pfUMuO4yzPo6vUtoqqd4vkvrgrMmHLPbO6DXJHhb/Bi2D3FtIknQ71YQilGCe/QkUvwo1NXa1tFDe9WocDa0eNHjgxPEMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASSYmQwZBIx1bB8RhQuEVfQxm2TNmLZyuCT0rbjrlSg=;
 b=EFbNwOILCNkHjK0229MuWdsJPbsAd5H/2fhYpD0H9VaWJJuUo12LrYMt6kVexhoIzFFORsBhs7y0akcMYAeE5leJodVSKPXQBufwrk5FVTAaYCGh2JB7SqBVqGUMcDCK8+uqy/pKmEDuoXXc2G9J8PiWuppuETjM0f47VDg8tVpgarkbR56hLVhyYhyBS0TTKx4L+kJjypZKWswDD8JPLZnonHGBMfsXocSt77xLfrjD6BllXcHOjGqzgwX/k+Ms5OYy1+CggGxZPZ23/L+6sW91pW4BcxWrt9hnTLfPGiuR2wZS5cIj6MWoe1NLOf5XW4iZswzNVNWNWU7srmCXXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASSYmQwZBIx1bB8RhQuEVfQxm2TNmLZyuCT0rbjrlSg=;
 b=qEY6ZSNJABU4tUOps7twt3lBjg+UoSk+BkBDJowHJXOCxVGfqDHazIGBxVsY9sqYWyLdzY89uOjG/g4trDGn96WuU8HAdxKz05dg28zt4v30MLEXKs7PTUta+RvOaGSI5dL89Xc++t+ARNGgVPQTpel7439zPaMEbee6qragcaHKc0qV8/p1FgIJjcIfi+7dwPKFZMd6V4W4nmY4srUVRet6wJaO4R8JJedcs8AscFFDrQ09cPBuzvOWPd/Y2oU34/oZVxbBeya343PGdRyuSZ6P9uSsgiC0VvGX1HUWQ2pCF9MOnQForAihMl4aw8ZJs+W8kPcEF4TjZPMSW+enmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8a6f6793-d0f6-640c-2f3d-11a3b7ce620e@suse.com>
Date: Tue, 24 Oct 2023 16:27:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v4 2/8] x86: add deviations for variables
 only used in asm code
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1698053876.git.nicola.vetrini@bugseng.com>
 <67ec8b468d6048f7f91590b59430df275b2f5870.1698053876.git.nicola.vetrini@bugseng.com>
 <2aaa0978-e28f-4151-f4ba-f2628f6d4677@suse.com>
 <ef7f5c65ad0b0129f6b6119b6ad7d506@bugseng.com>
 <2f3850a7-f2a3-350f-b9b6-be0bde0d1a28@suse.com>
 <53617132b87450fc385b2f5887bfe65f@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <53617132b87450fc385b2f5887bfe65f@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9254:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ac86065-5805-4c7c-bdd3-08dbd49d520d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qV2+eGrVgNJpbP/jdyC1i8bvghODP1kNB7ywdr4Ab5MRD2DgzKK5Pt4G8V31PF/m/RcgW5WRs7qgyoiYZPhsIeDIxAF5F29eD9SUnKbuLWR3xHacz21SqW3Te0tPW8FhmZvdLfrvI/+ztBWBcdweAz+WQj+wEDaeeMNsdrNi/lZDeHpMSn878t/geiuRSrQ8lZTZ0aa/VWxI8HexmGeWkNEcCV1ckZE9DWLmbbeFYrfFQaxEm2zRflWCjh1kginC3vPvi7TedW5OfKcoI1RtfSwgUXlEaWzBs49NHPfnwYuGO9f4AofTf+M4ard9KGt1BZJA+ioRnEbIKcGFxVMQs5JrBaLgQBmcWKJXzs3TQgNZ+Z0qfiQQdzX9wQ+NySB09st8xSESz7HPG+rFvIXsFbMtsqRmjSfGqfkLNhChqpMXvJjlkdId+kWQlmibDuEVXfxhHjo+x5utDcGE2jb4HT75dShfvRExOlDIuokVBwoiSieMJidDc2/OzGyhVtCcJ/uNmxekPGPs5xKzX6dbfD4J0JQb2q8Lf03o3jBuQZ2WtUm2t+wNY/zRBv9Vj8A122wYaMzdKrRyuIQhNYM27LWWDH5XEmcBL6/Zw3bgWf8bAjIj5V6HH+DErcBcHr4DzYmTnr+vV2nPBHcQAYINLg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(39860400002)(136003)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6512007)(26005)(2616005)(6506007)(53546011)(83380400001)(41300700001)(7416002)(5660300002)(8676002)(4326008)(8936002)(2906002)(6486002)(478600001)(66556008)(316002)(66476007)(66946007)(6916009)(86362001)(38100700002)(31696002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEtZOENOMFFpTitGTmp6RVQ1TTRNRGpwSG1rcnRDTURDS1oveDliek03WUcx?=
 =?utf-8?B?SjhZUVlrN1hFbHRvQVVJakxkYitDc3JQMnlaa08xTnVYZkxaOWJ6cytzMWVx?=
 =?utf-8?B?MWpSdEVPamFMTmFreVd0Ti95dGU3WXJya2JHZjRVSlFaSTNDdkZ5TlRaaGRL?=
 =?utf-8?B?ZTVFY045aGhsWUV2QmhRRGFhTWRJeEs3TjFaTEpVOE9sK2lWZVhLNG5tZE5s?=
 =?utf-8?B?Ny9aY2JKdWs0djN5K0k0UTVQb255Zy81SkdwcFVGTkVqa1haSnhrRVF5ZlB1?=
 =?utf-8?B?Z1FKZEhiS0N6T1YrcFhUZTRhYVltbCtHTFg3cS83enhDTjNZdnRNeUVoVWJE?=
 =?utf-8?B?c0lZSmo0SnFGRVZqMytBeGVBT1RJTDVMbjhLUFlVdFFVNXF4Tlhwbm5BdVVV?=
 =?utf-8?B?YkVNREhGKzl3UDJpdllXR3ZaSVVVakhHbkMrUHhGSDQxanpib25MOHhtSEFJ?=
 =?utf-8?B?Zmx2bkI0ZDlmZXE2cVIwQ244U3duc04wdWRCSWxHVWhXSFlzTmtxYjJkRjBr?=
 =?utf-8?B?eVdZdm5JOHdOZ3JrVnlKd21MMTF5S01LblUzSWdGd2FFMU5BbW40dVdqRFQ2?=
 =?utf-8?B?TWE0VHE4VktJM2Zsc3diQkw1bDY3RkNsM1pYaHlodUNxSmJMaytWakJ6bE1R?=
 =?utf-8?B?YzlrT3huVFFHVmF1aWRBa1VPUG5PYlJpbVhrc0VyQVZsb1BFSkovTFFaUDNF?=
 =?utf-8?B?RU1SeVd4NmxPT2RMbXVFSHBKSDJzMEw3bVlIR2p6aW5hOUdRWWdieHN3a3ZF?=
 =?utf-8?B?cW1tM1YyWm16M3IwNWF4dnpQc0o1dnNka05YYTZqQ1FiNFFVNWZpeEJpc2pk?=
 =?utf-8?B?OGdMTFV4OWpkSGw0cm5rM0o4bWZuNTV6NzN1KzNWVy9Zd3p5MzVSVnpUdmI3?=
 =?utf-8?B?QkJNK0JQMFI4RFA0M2pnY1g2RGx5Wi9EbXk3QkxRemVpR1BSeTAwU1h5TG1N?=
 =?utf-8?B?VWxuQXdMVVkxVW1pL1BZUVB6SG8vQ3hvczJtcURTT0V4RXJFendTak1MWU5B?=
 =?utf-8?B?QjgvaytSVzVsRzh4czduT3FyNUwwOEhEbDB6TWVBdEEvMXJ2amYxWitQb1hi?=
 =?utf-8?B?MWNRbjZaSHAvK3NiQk9FV0lWQkxRVUJIVUJ4RmdUcml4MUhVSHV6L2ZFOWJ0?=
 =?utf-8?B?MmNpbVo0UklOYXdoOGMza1ZkNlhlUXh3aW1MbjNMb1YydTRMSFhWZWxSRlRj?=
 =?utf-8?B?eWpiVW5HWG1CSGg3b2tqa2VuV2ZCb1djaE4reFFiV01oUWNuSDUrZ1NzTnRM?=
 =?utf-8?B?QWtVbU91eVI5WmtXSXFBNVF1bWNGN2wyUFFFWkhydnZuL1gyaVIzbTV2bmhJ?=
 =?utf-8?B?MGRnL2ptc3dibEJVanA4R2RFbFUxbWdxWFp2UlRITnA0T0RWbG1ObEViRTVI?=
 =?utf-8?B?bStqdkdSSTlGUXRHYUVIelAzZ2NUdU1MOG5BYVpsMS85ZGhEZ2tBWGozYXNw?=
 =?utf-8?B?blVUT29yaWxrY3pvSVJQNFJSWnVVZDJYZExJY2cvTWxwREdIajVKVzVsdThV?=
 =?utf-8?B?NklnbkNnT2VidVFBVVF2cXY2TTU4K3kyRVY1bmxlWnFLS1AzTC9kTWtJaHFl?=
 =?utf-8?B?eHhheFJDVGhwb3JIMWd1M0RHWkNyNkpFVHV1ZU1aNE5CMEtOdDMvcUE0OFpz?=
 =?utf-8?B?M1ZRVHloV1Y4QVdmbHh1MG81KzVHbCtxTCtmMWJxdnlpWkdrdHIzemE4TDhX?=
 =?utf-8?B?dERqTHc0SE1hT1U2SHRvSDRZUnZjL09KY1lRTW11aDhzbk1LRkFLcytJV2Rp?=
 =?utf-8?B?a1p4MWt5WGlYQkcyazlxNGtrYmRwWVUyVVZWQVk3WHZsTkdjL0kxakljeGhy?=
 =?utf-8?B?Ump0WlZFNUVPeHBRQnFiclJCbFBFSFBtRXJWNkljQUxFQnNiT2VrZE1aNFlw?=
 =?utf-8?B?TzVXWkg4a3cxMVhtcW1kcjdQUTZpZjVSbFJuQU9iclh1emxGUVF1L3E1d3N0?=
 =?utf-8?B?MXllcVc5TmxablllcnhLbGN3ZGxBMEZBOHZPZ1lhRzIzRzFuZG9xa21Ib0h4?=
 =?utf-8?B?Z3RFZFoycUFWV3pmWklsRkxhaFpyZ002T3dWeUhsY2QzanY3WmlLc0l1WTRM?=
 =?utf-8?B?L3ZGZ1FRbjY1c3k0YndVYWNESG9zd2JuQnk3YTIvYXJ3OUs1Y3FlMlBORkVZ?=
 =?utf-8?Q?OBah1pZZM/go888kLZNELBUMz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ac86065-5805-4c7c-bdd3-08dbd49d520d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 14:27:15.5777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: opPwASQLBgJmoyWVmJ+yhZCGC1PmXwG9UwDVz8V11ys8s9yMXn3yxaGrXfkQsh4qp/WUGT0Sze+2JFgia5D3sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9254

On 24.10.2023 15:40, Nicola Vetrini wrote:
> On 24/10/2023 10:12, Jan Beulich wrote:
>> On 24.10.2023 09:58, Nicola Vetrini wrote:
>>> On 24/10/2023 09:32, Jan Beulich wrote:
>>>> On 23.10.2023 11:56, Nicola Vetrini wrote:
>>>>> --- a/xen/arch/x86/include/asm/asm_defns.h
>>>>> +++ b/xen/arch/x86/include/asm/asm_defns.h
>>>>> @@ -31,6 +31,7 @@ asm ( "\t.equ CONFIG_INDIRECT_THUNK, "
>>>>>   * gets set up by the containing function.
>>>>>   */
>>>>>  #ifdef CONFIG_FRAME_POINTER
>>>>> +/* SAF-1-safe */
>>>>>  register unsigned long current_stack_pointer asm("rsp");
>>>>>  # define ASM_CALL_CONSTRAINT , "+r" (current_stack_pointer)
>>>>>  #else
>>>>
>>>> SAF-1-safe is about symbols "used only by asm modules". This doesn't
>>>> apply
>>>> to the declaration here.
>>>>
>>>
>>> The wording could change to "asm code" if that is deemed clearer.
>>
>> Question is what would be meant by "asm code"; "asm modules" is quite
>> clear.
>>
> 
> Well, I don't know. It's up to the community to decide that. It can be 
> an ad-hoc
> justification, but I don't see much value in doing so. What do you 
> propose to get this patch
> approved (at least on your account)?.

Drop this change and have Eclair recognize that what we're talking
about here is just a declaration, not a definition.

Jan

