Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EECB76F3D3D
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 08:16:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528352.821378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptjIo-0001rh-Fw; Tue, 02 May 2023 06:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528352.821378; Tue, 02 May 2023 06:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptjIo-0001py-D6; Tue, 02 May 2023 06:15:54 +0000
Received: by outflank-mailman (input) for mailman id 528352;
 Tue, 02 May 2023 06:15:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ptjIm-0001ps-41
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 06:15:52 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c855e62b-e8b0-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 08:15:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6980.eurprd04.prod.outlook.com (2603:10a6:208:17e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 06:15:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 06:15:47 +0000
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
X-Inumbo-ID: c855e62b-e8b0-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S73vx3jv+I3zZIewPLdwXxwL5Aq+E0BKkejpZnLnCQUCIebL3U9nqGJlBFlL3uZ0wyV2g9O4tiOG3PA+J7yR+gudvO8412CtM9smOizWAHsrMW22QsPisn5NudrHgDKB2r82DHg14DhMTRjm+E0aDYndDPf0mb5DwQ0som4TtGl7Ryjo3t5MoLCQucULrTKhygXezoakFMkhxOx1bvo5m0AbAISl0nq2BK4ZeQ06dYJK/fm25fHZBbQO0M6pSYCER6QMvoKg6cuv7txi1M32Ldhf2INfMO0qB8NI6ObpVq0/9jOfaVl4DSkJaLgQqcqwBXvWYpV+nuh7Wo394LEkrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYW6Ju3/WGY+WAhCKayIV6c3SHWrtO97t72yOJ0NzeY=;
 b=J6bX0SUIIzm2dmPEFEJImyqW/FB+pFbbkGOuTseFfKqt7uw964HbLJMAGcY4yPUYvOFbdu7jt0BVncsBm6FLuv+HHQqI4VuwYuQO6EAPCkSkKJceBu+tcg+NeeLTsYRq195OxLTyiSY9DWxPP2uNiSz0+lIzP6f0dw8NIqnakCloRGuBFO5pCrtii4ugune34RnjaG+vhW40MQtXDAqYn/CjWniZkOBXp6Y0vGPHpqToEqZIQ43NEfGPb2t+2qGkaiThFJrNmBtdTbL8yR5tN4ozOz32SqcyD++EoIOQG2RWDNkwmGWeCg7RjjTK3UeDTjvK68U65RCb2/Mtscqkfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYW6Ju3/WGY+WAhCKayIV6c3SHWrtO97t72yOJ0NzeY=;
 b=Jdv5Ce3ECq1X3GCU8phbXmAQe861HQXy+tRjU6rra1L4XRhB/Gp/qlraWFMVpRxj7mtWxkZVvs4dv1MQbwq5qQiEkGLcMuOt4HadGyF5zIdjhH8u3MRthYYYg8rzNditQrbJU34GvRnTNTurq+E/spbq28Ztmxl0qk3IuH/Ykr/ixUB1Toqsnh+UtMjq7d+IodeacRsU5PWWqyyBxerWge9gDzPTTICGT53MXB7sUcOFbF87zQIvuJzkG4QP1rznVRzZ/ZW8Q5wLpADXQbKwQHlsMvd1Pta2usRXvZiye1Y34f50bhNhnjTFTnG+FwyUNSmC/oYb+MNr1cLI6DWK5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6e03a33b-f5df-391a-8c70-ebe4294e6fe6@suse.com>
Date: Tue, 2 May 2023 08:15:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v5 2/4] xen/riscv: introduce setup_initial_pages
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1681918194.git.oleksii.kurochko@gmail.com>
 <5b27693bcdf6d64381314aeef72cfe03dee8d73a.1681918194.git.oleksii.kurochko@gmail.com>
 <67d8574f-2e0d-4eb6-19aa-67fe7645e35a@suse.com>
 <ea2d5cfabb9ada64eb975369779ca430f38e9eec.camel@gmail.com>
 <53257ae8-d306-8c7e-35ff-f3bc3947849b@suse.com>
 <3d440048717892fe5d3ed7fe3255dc8c9f5d38a3.camel@gmail.com>
 <2c424759-3072-cd07-913d-c45ae6791ce2@suse.com>
 <5316859bf081d2c00dae784e6700f55747a6635d.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5316859bf081d2c00dae784e6700f55747a6635d.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6980:EE_
X-MS-Office365-Filtering-Correlation-Id: da6376f7-a144-4f30-e057-08db4ad4ab5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ll7wMgtoyjyzanHg9MO198TJFt2Qjymz7qOnusWeKbZZOqqg5lo+cdJ+M0gLxU+gTlO5cyWOdEGLlLLCl8NoSAiTS65KWaoxUemfvbj42F45QuicVtertWZuoFMlP7mVzvmdlxApVGtfNaN4Wx0qcLp1P5k58yLoHLTfv8j65GUvTxUUlJCafpWloOKmL5FI1GuMrZAaNYiR5+fenT0SxEiSGR7a3Gg00wQ06IOw8MbfDbtY6OAwHbW3yU+s6NaA+NSnI+C3JTVhPKlxJcfMUTHTBUzpBEdYsakr53SjuCpnLz8XuwAYlivHLQ/rlkcKtOl0vU8NC38SuVrmzXYJp2PSw7RFh4Zyes0+LRoHyMe8ZLzaSbXcGsiMDoG3xdINhdheVT7KOc79mfuIfVKqnkZETSeVl7owqw6c39k9jsUAOHE6LCRPgt36IgxD5QYsAErYhf5ZPujGgwR2zBZLX/YuG3j4632DqADg4pLKNLsCbT+jDncRrDBWg6LhkCeWlPVT4AEzpoTJLXGWRbYjJkC3TcDv0lRki6R5p8N5JDQf+rUYR6DfF1HVAI+R9mA1JmAY1paoi2jUnBlz/qt56cLOTaNZn+w+pDkd3rBpUrvHxLA7UnevMSW9NkESn1pYlmITFJwcC2xzk1vbU7cMUg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(396003)(39860400002)(346002)(376002)(451199021)(4326008)(66556008)(5660300002)(66476007)(66946007)(31686004)(2906002)(316002)(41300700001)(110136005)(8936002)(8676002)(478600001)(83380400001)(54906003)(6486002)(53546011)(36756003)(6512007)(186003)(2616005)(26005)(6506007)(38100700002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGVFbFZ3OG9jd01GOU9lbVVISUpsZkJQZnpUdHBFUVRuODlOR1pjakJ1cW8r?=
 =?utf-8?B?OHhOaUFjcDBuTXovdHpXcUo1OUlHdlNVVFkyT2RhVUxiRkVhbGpjM3NtYnFE?=
 =?utf-8?B?b2xpUHFlNHZwbmdrdHFJTitWNldKb1UxMnRZenFXaXg5djdnaFllU3g2a0VF?=
 =?utf-8?B?S2VIQnRLcnk3WXBlcm9pNXlxY1lsMmd3UVZoQUxBWnIrTHhwbm5YUFN1OFlY?=
 =?utf-8?B?WEJQTFBPNE5iUSsrYzNCTW9hdzJoZTl6c3hZeTllU2w5Y3RNREM3a3pGN09F?=
 =?utf-8?B?VEVkMVNKTGtCMXpOSVpPOWRQMU9PbU02N3BzZE9EaCt5ZzRFcTczbzRxeXdW?=
 =?utf-8?B?dVNwVUltc3FzeWJpeExVWTBNRTVLSy9qOTBTY0pHNmFPejRkanVUNWRXa29a?=
 =?utf-8?B?M3Q4Y0sxbnZGNy92WjhCTFJHakxwdkh4WW5aVzl3K0phWklZVFJHbjVJU2V2?=
 =?utf-8?B?aU45VUV6dmpCcnBMTUxGVHVyQ0lEZEhsY0tUVmVSeEp6dEVFbjNaU1ZnN2lH?=
 =?utf-8?B?RDlYdXhhL3R3Q3FRbnB2Y0pyRUd1UmdvaFR3OElISmtFelRuY2JCY01NSERy?=
 =?utf-8?B?L0RKUzJMV1lQUG54Y0JRaER0alFLR01DWStFcUJSUktNRUowK25HRzhJZDlu?=
 =?utf-8?B?RStmaE1NeU9oQ2hicnEwYlJCWkY1eklOeXpzaVVaU0dOei9QeVNBdUxwb2dy?=
 =?utf-8?B?S0Jvd2FkTWcwYjc2Mkl5L2wyM0FvQXEyVktFc3ZYbHZya3BYUFZOMU03ODNK?=
 =?utf-8?B?MFNoSGhSaFF0R3ltNkZwTi9oUHlzb2IvOTYvdEY2VnFDUUwySlQ4b09ZL3R3?=
 =?utf-8?B?ZDNhVnZuSVdncjJwTFUzeXQycUNlT3h2NFkyVERCRmEyZ0NZWFJMaXFmbjZk?=
 =?utf-8?B?ZTZSR0c2WmJuTFpqOElaaUF5ZUpWRkxrSnpHQ2xFVS9UZVBEWFJvUmw0RWh1?=
 =?utf-8?B?RU5BNkJaL05vMndvSkkrajhBSDBwamVZdXh2UFhTNm9iWWdkZVRJcFRQMUJZ?=
 =?utf-8?B?cG5jZ2toRXpXc2huRWFkU2RENVg0M0hDdmxFNDZjMWJEMmdXbXVCNWlYZ2JP?=
 =?utf-8?B?MDNVSE54OXdhM0J4K2t2bWNYdUJicTZKQkNPcEovYXdldm16MWR6MUJKOCtz?=
 =?utf-8?B?ZDllVHF5ckpxaG9JVTl4aFE1aldpQXFwNWhFdDFhaUlpM0hYaldFMEN3NlZD?=
 =?utf-8?B?K3VvcHhCbHcxT3dVL3hNdEZuTUZLMG9QOFZVa2taVGdyQUpRMVV3RTh0UzJ0?=
 =?utf-8?B?RVRzMG5IVFhCKzYyLzV5ZXdFNmxsQ2lHMWVMVlhWRXgrcEZMS21uMmdsVjNW?=
 =?utf-8?B?b3E5dkZXRHpEVVJyT1pvVGFHTVA5alVOcTRBYnh2QWJxZGtaYnkrTXppOTEw?=
 =?utf-8?B?S2RLZnI4andJSnVvY1ViZXJZaEYzbCsveEY0UytIUFV5Z0ZSQlkvaDdlaXZi?=
 =?utf-8?B?QldzdHdwUzNrZi9lbjMwcjJpR3ZYSUdWd3h6SDFGRFU0cVlHOHNtSzI3RzUv?=
 =?utf-8?B?ZG05dGRWdDNtWlBQNEN0WitpNDZBcmREMGphUzViS0pDNUtVQTNNY3hsS09G?=
 =?utf-8?B?RDNOdEFrRXZvb2hMS3UvNSs5MThVNlp2UC9NUVF1MUt6d2kzT09pUGJ3TWFq?=
 =?utf-8?B?VWp2bGxzNnQ3MTlrTGhNM01adU1sQ1RRS2dKVDJDYUNOVTd4MXNkOWVkOXdi?=
 =?utf-8?B?KzVkUXRxNGNNdktRRmE3U1ZiZ2Zid2NpYXFBbGlJbXNjdG45N0hGNWtxd3B4?=
 =?utf-8?B?U3pOVmlwbDRJYWdZczVkdGQ4TzY3K3hNS2RwaDRnMEswMU1nTEkvWTBtQXRP?=
 =?utf-8?B?Nm1SOTZEMXVlSGl5U3h1TWt1dG53K3ZqYlhab3pDNkJoMDdWVUN0Q05aeGow?=
 =?utf-8?B?NmR5WUdWZGxBcHNQM0NWdmRud2YxQzlYSFJ0ZFE3eUFjOGV0NEZPd25LeVUx?=
 =?utf-8?B?ZWJHdjdiRXVSajAza1h0QkVjNVBabnY0bi8yNVR0UkJ3OWJCa0dyMlY4R3RC?=
 =?utf-8?B?MGgrQ2NZcXY2aFNyNThmcG9XSERSRG9XUGd5NVhyTmhYNHZnc0lmcllPRGlh?=
 =?utf-8?B?WTlFT0VxWStlMDdkdDJVdVlyMHU5T0ExMVFTbVpmRWlPRUdhWmdBSDdIM3Ru?=
 =?utf-8?Q?6H6ak164D21bQYgYyTNPSI6NI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da6376f7-a144-4f30-e057-08db4ad4ab5f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 06:15:47.3983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kD+C9xJSh4wHYIcicNpEDAfHylgmPqvWHTyabzJx5tf9tSpBpKmRq3bRy0EAk6s5Il/3CwSVKDglkCcr62+cAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6980

On 28.04.2023 22:05, Oleksii wrote:
> Hi Jan,
> 
> On Mon, 2023-04-24 at 17:35 +0200, Jan Beulich wrote:
>> On 24.04.2023 17:16, Oleksii wrote:
>>> On Mon, 2023-04-24 at 12:18 +0200, Jan Beulich wrote:
>>>> On 21.04.2023 18:01, Oleksii wrote:
>>>>> On Thu, 2023-04-20 at 16:36 +0200, Jan Beulich wrote:
>>>>>> On 19.04.2023 17:42, Oleksii Kurochko wrote:
>>>>>>> +    csr_write(CSR_SATP,
>>>>>>> +              ((unsigned long)stage1_pgtbl_root >>
>>>>>>> PAGE_SHIFT)
>>>>>>>>
>>>>>>> +              satp_mode << SATP_MODE_SHIFT);
>>>>>>> +
>>>>>>> +    if ( (csr_read(CSR_SATP) >> SATP_MODE_SHIFT) ==
>>>>>>> satp_mode
>>>>>>> )
>>>>>>> +        is_mode_supported = true;
>>>>>>> +
>>>>>>> +    /* Clean MMU root page table and disable MMU */
>>>>>>> +    stage1_pgtbl_root[index] = paddr_to_pte(0x0, 0x0);
>>>>>>> +
>>>>>>> +    csr_write(CSR_SATP, 0);
>>>>>>> +    asm volatile("sfence.vma");
>>>>>>
>>>>>> I guess what you do in this function could do with some more
>>>>>> comments.
>>>>>> Looks like you're briefly enabling the MMU to check that what
>>>>>> you
>>>>>> wrote
>>>>>> to SATP you can also read back. (Isn't there a register
>>>>>> reporting
>>>>>> whether the feature is available?)
>>>>> I supposed that it has to be but I couldn't find a register in
>>>>> docs.
>>>>
>>>> Well, yes, interestingly the register is marked WARL, so
>>>> apparently
>>>> intended to by used for probing like you do. (I find the
>>>> definition
>>>> of
>>>> WARL a little odd though, as such writes supposedly aren't
>>>> necessarily
>>>> value preserving. For SATP this might mean that translation is
>>>> enabled
>>>> by a write of an unsupported mode, with a different number of
>>>> levels.
>>>> This isn't going to work very well, I'm afraid.)
>>> Agree. It will be an issue in case of a different number of levels.
>>>
>>> Then it looks there is no way to check if SATP mode is supported.
>>>
>>> So we have to rely on the fact that the developer specified
>>> RV_STAGE1_MODE correctly in the config file.
>>
>> Well, maybe the spec could be clarified in this regard. That WARL
>> behavior may be okay for some registers, but as said I think it isn't
>> enough of a guarantee for SATP probing. Alistair, Bob - any thoughts?
> I've re-read the manual regarding CSR_SATP and the code of detecting
> SATP mode will work fine.
> From the manual ( 4.1.11
> Supervisor Address Translation and Protection (satp) Register ):
> “Implementations are not required to support all MODE settings, and if
> satp is written with an unsupported MODE, the entire write has no
> effect; no fields in satp are modified.”

Ah, I see. That's the sentence I had overlooked (and that's unhelpfully
not only not implied to be that way, but actively implied to be different
by figures 4.11 and 4.12 naming [all] the individual fields as WARL).

Jan

