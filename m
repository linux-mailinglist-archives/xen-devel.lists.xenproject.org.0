Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE3967DEB4
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 08:52:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485345.752505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLJWk-0003cX-MK; Fri, 27 Jan 2023 07:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485345.752505; Fri, 27 Jan 2023 07:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLJWk-0003a4-JX; Fri, 27 Jan 2023 07:52:02 +0000
Received: by outflank-mailman (input) for mailman id 485345;
 Fri, 27 Jan 2023 07:52:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N8iV=5Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pLJWi-0003YP-Qs
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 07:52:00 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20626.outbound.protection.outlook.com
 [2a01:111:f400:fe16::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79b35d7e-9e17-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 08:51:58 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7419.eurprd04.prod.outlook.com (2603:10a6:102:80::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Fri, 27 Jan
 2023 07:51:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.022; Fri, 27 Jan 2023
 07:51:57 +0000
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
X-Inumbo-ID: 79b35d7e-9e17-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GXu/0IEsS8MdLKeLqGOA4j64nbbil7oGf/YXuPBoHKhgQdPQ3s577Aa+Ejkr0HLCzeL3i5sTQOop3P0nOTldUNA86LkP7a0D/PlOLx7HKC0cK0+811rcnY6fnVwVB2M/sCn5Sc6J3p04vSPY4XYlqglwtMJB+nR3wExxq/h+7B9j8dl63M7xr9JNUMqPyaQ7FxAEaqdluolVLhPF8txC+NphIv+8ukNe1hDogI5LHyslhJyWAUDkZtszi+qh46izpfR8zTeaV237Ykk44BIBC4pyZwfMjlA4fU3h1kwtZir5EOsFJ6scWe0dt4RmowA0i98/Bmnb9oDNHiHM7I6bsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRlnGW8yKLIHOKMPsol8u8OLrFS2lIjE0G+Q353odtc=;
 b=Og/fVgWh96Ad3bagvNY8LFvdKWAyFRS7zceuQWGdFCMptpBhqhfKYkGUhT7675HqVZAWZdjU5eTAjM9CX7Ge6gvidAL5xa0xQqzVDZvfzt7GY3U7GSXMbto20Eo/hUgjH1aErcb64nTO1cHtJKw99TmhBPFOcr2DEU26MUxqaoJz+mN8CB04nE5YtRL6wRC3g/3Cor2fYnXRhv9/roK3U1uI7JqnwNjEhExtOoOU9lhcB4Ui2+oZA8+CdSRwgGScUYa/Irpfh//ME7CRFn6s54Izs6t7ivuZg0UMhgwSNBbIUNXgAkZfO5vjJ22pHqRvt8BOGet9OzxaNY99x+bm0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRlnGW8yKLIHOKMPsol8u8OLrFS2lIjE0G+Q353odtc=;
 b=vt7OSA2PlXfciv+oyQMsDacrL/0va2TkqL87iuQjOxpb2dDbEbk3kN+yJzVKwBSm5v//a28pMPCSoCrHWEsTqRnngawxqBwHAoWIlyoc4HQQWS7JDap905uv6dq6w5GiYqh6+kghrtq26kwaf5XSN/z0Eiw9TkD3HJ/YY4bBBkjcL6F/BoATJmw1AFZykJsP13CS2/1nlzdh0EfG4gtvL3i5Ndo4D+BL9DfARYbQ7v4nb0cWuEoVzo5ttPtlz39ntzN+WtGS+eGabk+hgxE2sEaNsw3kOc19uCcmFjd9uJj7w6ndqRYoEUPDfl2umS3kbVTbqJfP5VAeDiw2wmSADw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0acfa717-8711-599f-4d29-d92a1466a1db@suse.com>
Date: Fri, 27 Jan 2023 08:51:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 3/4] x86: limit issuing of IBPB during context switch
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <930254a6-d0c8-4910-982a-bfd227187240@suse.com>
 <c39faba2-1ab6-71da-f748-1545aac8290b@suse.com>
 <d0a0960a-f110-c065-753d-9f000ca379a9@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d0a0960a-f110-c065-753d-9f000ca379a9@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7419:EE_
X-MS-Office365-Filtering-Correlation-Id: ce5cda7a-a2c1-4a77-15d4-08db003b5d20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kPh/TfzOy259rqDcSPKIE803AVk+xI2QIrwcS1PSxFxlBB57fe4bwx+Czt+kYk4sVVh7/9kukFKiWvKqB1H8K+M1AI3FwhVRvJqEDrDjHMz7WokTpwPPnUfXQXEtGyAKx7VqaA3U4v65MD1PnTZkWSMXcEQ9oiqGeIosDNH6JbvIekeP7qfrxBtxHha7o+wtmfBeXChFpGBeQrCDFOTR/DD1zwz2laUkgwGrEaKQEqOhrc6Kzf0OLmVYkD0UQEiOKz9Sx28okjs16fxrsW6ZqBygAs5p+L3kARD/S4YlUEayx1KS4kFvSfT0pyGqQNvu90nBZU8+qmM4maOQ/6L5M+AeQyV5Zl8aDivLoGvlwEOvo0vGMn/4vLYjgcLrM0xcH7nQ+YbtXojcSAFp0F2mm+5ZRhTxQ2nOh+YnCxKRP4aake9+z4Vk2oaFaSIQODJhdPfYmmOsoD7u/WFAXuZgZpU3YLWLwC4DRogI0uqCdbaxos5Ly2MDXJMytVZD4egLMHEtRiloDJ60HH9VyNndDCxhluaAS3mHAZI74Zbm84C5f9S1qExaewePGRTOUb1J2/KElhiRViH9X44WMS2hCDYDpb7vdTjiAG2z2glimgctuCjtH4bT8iJbLFHK36j4iaQHlS6OmIo+qCByqpXsBCLtFby4W75CWq3DnauUPR5Ijc+Nk3dp2hP3yEMH34BbO2tNLW6ZNyxMH2vXV5Orkwewwd5TReDhLTc2YKwS5UI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39860400002)(136003)(346002)(366004)(396003)(451199018)(36756003)(2906002)(38100700002)(31696002)(26005)(53546011)(6506007)(186003)(478600001)(4326008)(66556008)(5660300002)(8676002)(6512007)(6916009)(66946007)(83380400001)(6486002)(66476007)(8936002)(41300700001)(316002)(2616005)(54906003)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzRkZFVsaFBPay8vMDh6cHZRUGRjSWREM2xUUXY1T0xEcTN1NDh6SzJSY2pZ?=
 =?utf-8?B?QmN3cnJnZG1hZmVwT2FWRjJUbkhZU1lxMlBZaEZrV00zZWt2UmIyZlVIajRz?=
 =?utf-8?B?eTkveGRHVnVLc1VFTW1VTEUva3RuWXF2TS9kajEyL0c0VTJ1czhsV3hDY3ZP?=
 =?utf-8?B?NTJUZVBvc3h6aFpjSXY0UjRoVWJaYkRoci9JcXh1ZXJ4SU05SW5DdUc5aUkw?=
 =?utf-8?B?TFFyU2hSdW0xUVRjUHFBQkMvK1dOcW4xL0xwU3dTUnFoajVoc0xTRnUrWmRF?=
 =?utf-8?B?K3Ztb0EwTTU1TlNXNThiRXZ0bnNqS2RVekNXNWxjaURNQUZaU01EY2NjMk1R?=
 =?utf-8?B?TURDemVLWFFkRy8xejFEWkxEaUxPeC92YVN5aXpUTS9UeEt6UldWWHlkOStB?=
 =?utf-8?B?ejRRSTdCeFBJSG9TWWNxbUpXZ2ozeHVVVnladXc2S1JaeHVxVFdwY3BmMXNu?=
 =?utf-8?B?YXcwSnZxNE0ydU1NK3AwRTcrb0xaK1NPZkVrZVphbUhId29iT0l4T0lENFMr?=
 =?utf-8?B?TTA1L0NVVFBKRlhITnhaQTJuVUJVSTgwK3puMzFJTTlseDVuM3duUlpmS2xR?=
 =?utf-8?B?N0F6WlhpVktSNTl6b0ExejI2MDhrVlJEZUNEazlpR1ZxMW1CR3JyRjRTSVVa?=
 =?utf-8?B?b1lpdWxHVnV3Z3FXMXo2MWI3RXAxQ3lYVnJHLzRqcHhnWWVEYUF1K3ZYTU1n?=
 =?utf-8?B?eWJnNDNsVHdKVGtrTDZDalBZVWVPUHVJY0J1eTl3WHB6SnF3ekpvb3k3SFlv?=
 =?utf-8?B?NktBTXdHc3pwTXQ0b01vbXQvWlNQeTN4MEszeE9QNWk1M2lqUGxlNXFDSWlG?=
 =?utf-8?B?amVRWXp0VGlxV2FPZXdMYzV3U0creEtsY2taR29LYmI3L1BBU3RMd254MjZW?=
 =?utf-8?B?TG1QV29VM0txSG5PSlZROVQwcEU3ODVNNnVsVE8xSXdHSlMxbVFLQzVRWlRZ?=
 =?utf-8?B?clB4dWVtck8vd1pja0kwTnZQT2toVGhjTEY2ZmtvbWoyc1dkNE00MUJmODJ4?=
 =?utf-8?B?Y0NlYkt1d0pwSU9QNnh3NkxaMmtmVHU2NFJuZnBTV0VlZGptSjZ3cFArNHVG?=
 =?utf-8?B?S3JRNnViOGMvN3JFSHFkOVdqcUhuWDNNaTgzUENIcmN1Y1RuYmVLL1VJTElR?=
 =?utf-8?B?bGpNbk52NzFxMmdwQ3d1bzZJUmh5MzZVODFVeDcxVUVGMTRZUjNKSE1BK09M?=
 =?utf-8?B?LzRLWUdid3FpeGh4eGoxeWhiUTZVQ2tsNUI0ZExJSGorQ0tJM0pIMG1qTjh0?=
 =?utf-8?B?MU5XanBZUE5pSXVsYzgycDFhQXo1RHhmVjhNcGxocGZKbnd0K3NFakFubVRr?=
 =?utf-8?B?UE5jY2VsOEZMbEFOTkgwNWhQUWhGY1RlamhsdjVIRzVYR2ZYVWwzK29Mcngz?=
 =?utf-8?B?SWRTR2o3ZUh4SmpYOHIzUkNtRXdUMkdwekxaVlRLNzdNWkdNYmU1ZG5aV3o4?=
 =?utf-8?B?ak5qOTQzVlNIVEhZRHdtV3BPVkpvL1dGb3pJUFpxbzV0ZllaN0Z3WWJjaDlW?=
 =?utf-8?B?ZjlkVmovWklPTjJwejRxMFNiV0lyRkhiMGJ6OHFHNFNVdHBYNE1Hd3pZaFo4?=
 =?utf-8?B?OExvemhkVEZKVGpPVEZyYlBMZmtSVS9lOUkrenBMeVlZTmVmcUo4bU5JRVBN?=
 =?utf-8?B?TUFUenpQS0U1UUk0NXo0cG0vWWNWaURXcGgrcU1KTEZXSlBFZkVYZXlRVGow?=
 =?utf-8?B?dnRPSEFEZkFLbEl2OXpwY3VPaGN2SWJ2QUdQZXF5disrMzdIbWhBWXNRQTBr?=
 =?utf-8?B?TFZMcHJwQ3dUZjlNYTFZdjJqeFA2Tno3OG8xTjhQUHh4eG93RUtMWWxpRzFj?=
 =?utf-8?B?b3ZFTzlnc1pXeWR0aVNiMVFacjZ1UzY0R09nYlZXV3pCQ0Nuck80NlVZRHhC?=
 =?utf-8?B?RVZ5aEdWcThLanNYZmp5U3UzRlBEeFJRbExHdXc3S3FxdExXSGZEbnJMZERN?=
 =?utf-8?B?YkMwdkFUTEdqa0V3UmtFbXNZb0pFNjFHblc5RGpRYWRjbVBhV0wwUmQ3VFg4?=
 =?utf-8?B?Z3pKKzlTaXNGQ3NSL0lJYmRGZHllYXYvVVA2Mjl3SXdDeTNCQ25OTk4ya1E1?=
 =?utf-8?B?ZWU4aEZJbXJKZm40V1BEVEoxK0lCUHdrR0ZnKy9MN3RHWjg3c2x5MklEUWhD?=
 =?utf-8?Q?IALoHma8EVfEIxlmn7fKWWcWV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce5cda7a-a2c1-4a77-15d4-08db003b5d20
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 07:51:56.9605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJ7VoWkRuvWdMiino+XKAMObxBor5Obpj1YHUfyU5vxJCMmgYtBO6DepCB0lum1IPylPThg8xlb7IoF1hHFkug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7419

On 26.01.2023 21:49, Andrew Cooper wrote:
> On 25/01/2023 3:26 pm, Jan Beulich wrote:
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -2015,7 +2015,8 @@ void context_switch(struct vcpu *prev, s
>>  
>>          ctxt_switch_levelling(next);
>>  
>> -        if ( opt_ibpb_ctxt_switch && !is_idle_domain(nextd) )
>> +        if ( opt_ibpb_ctxt_switch && !is_idle_domain(nextd) &&
>> +             !(prevd->arch.spec_ctrl_flags & SCF_entry_ibpb) )
>>          {
>>              static DEFINE_PER_CPU(unsigned int, last);
>>              unsigned int *last_id = &this_cpu(last);
>>
>>
> 
> The aforementioned naming change makes the (marginal) security hole here
> more obvious.
> 
> When we use entry-IBPB to protect Xen, we only care about the branch
> types in the BTB.  We don't flush the RSB when using the SMEP optimisation.
> 
> Therefore, entry-IBPB is not something which lets us safely skip
> exit-new-pred-context.

Yet what's to be my takeaway? You may be suggesting to drop the patch,
or you may be suggesting to tighten the condition. (My guess would be
the former.)

Jan

