Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F30BC66B989
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 09:57:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478464.741679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHLIf-0005j7-4k; Mon, 16 Jan 2023 08:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478464.741679; Mon, 16 Jan 2023 08:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHLIf-0005fk-0n; Mon, 16 Jan 2023 08:57:05 +0000
Received: by outflank-mailman (input) for mailman id 478464;
 Mon, 16 Jan 2023 08:57:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SJiS=5N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pHLId-0005fZ-F1
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 08:57:03 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2050.outbound.protection.outlook.com [40.107.15.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdbf1a14-957b-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 09:57:02 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8881.eurprd04.prod.outlook.com (2603:10a6:20b:42c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.22; Mon, 16 Jan
 2023 08:56:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Mon, 16 Jan 2023
 08:56:59 +0000
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
X-Inumbo-ID: bdbf1a14-957b-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4ug+IVv4wiIPwD8nABUdEvsfRqyW5Wq8P9DNA2otOlw3xa5RJshRA/DEq1yR/9jUSJPDEQJn9oAdK4Xn3kauNxP4RQ3UfHEgNbZgXK3ZDdF61b+OcBuDBKXlgPzUebehNnvPy0L8tN/+3Ec7ZpjnA4qRlxF7PSvpnvtqUrX9+C8lp2cDs7ITqcjPCJErOtarKBq7qgD1kj0M5LpySuX6pZ/X7YYdW7ExKPDVkYDxehvCYV6dLDlX4UORPs/Moy1L0qWJ0JRwub8gD46Nez81H5Wl3bE2HdreG3OrN4QvW0Ty2qH/aG1pDg0k+SqCi83fd7RDP1uulxYiez6m/Y0dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9f1bNX4yYHaymSPKHN3ykqRaflHQLdQFgGma2M45HEA=;
 b=SoqCJ3gBl7DuviBmdOHs3DkGpsD0TI+03M6vSPpC9PVZW8X2Bq9Di8MgvYzRcnpE/6oOSggaFN9Gr9ZjyDQIQNyOPaIAmAbESTrBrnppZY/ER9ZsXsvgOLQwcPiNPgL9iBurGQ5heRMyaZX4w1ntH+bW6yyqQxi2B+bjHHvXCiIKlUXVJfC0y5fN2nk0X87Y7HfF3QIp245w3i8ki6TGG7NUiZjRmv/i5CiQO2+AFcU7+9vwi0YuGc4VYTIDPU9XrRFTPwfwP6caa7RISuoQif3Jbpd1ij21cCcry2R++byPKs4MO4Ms5w/UYWnTUfvwg1YReQQKNI2lI+NuH5PMOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9f1bNX4yYHaymSPKHN3ykqRaflHQLdQFgGma2M45HEA=;
 b=jFYZ0ZTIJBZDtBN7WviUpRXi38OEvSawsUJWChat9aEhgFb9B2tT3dku2R/iutTuteMipvJmdf4WeXdeCZfhwzAFytznXlFaIw8/cZxgKBKC5SiHMQsJyZWPicLvOLl4FoLv2VYfU+C6eyVXcenI6BO3durWa28HGKjpnYeAkFWyIFZH6QAcBbic8BTms6L3xHY8vTO17n/djAiCODfALFdO0hco0MjNwQDR//usgyW7/YoJ6ogNOFZr57IADFXcz7Mpu8JGl5BzgtkxJtzxocI/ZWGwoQsMlFgbZA9LvY6h2bWL6xd763wMrlUmuGC1xeZrVBUnXFT2Tgn0M+c5Xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9e918d63-3f32-6d43-9836-a9b75b98c295@suse.com>
Date: Mon, 16 Jan 2023 09:56:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] x86/shadow: sanitize iommu_snoop usage
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "Tim (Xen.org)" <tim@xen.org>, Xenia Ragiadakou <burzalodowa@gmail.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <01756703-efc8-e342-295c-a40a286ad5f1@suse.com>
 <cf0ed06f-4d49-0f73-cfd9-eb49e951048c@suse.com>
 <f24da4a8-4df8-0ec3-32f9-41f134b87d67@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f24da4a8-4df8-0ec3-32f9-41f134b87d67@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8881:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c010605-a358-45e1-ffd2-08daf79fa057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RQKqqKWFNkBbkcqKemEEZpIul68hdUEBRA+OmmdEXARv0Wp/cPNFySyErTWb12fGR+/2/kzVDfEl/o78U5ertLzYV1a+PdSJlQYUaGypMMHvLlpEO+gY3cr+S6JVO9KUxu3/n0QV3F/+gWc+CDZk9HYnoFrBxaT9r5vlZKQI2xCK5FJGbOIWXZ882nVzxBk9+BQBHXsWrvNrW27UXOHJip3UF3PBruY1AMVjWVyPHa3E5gNXq7wsmcZZ6EVEcQSNymufR37y8j19t1SX8UT1sWtXCTNosk7ix9fD6dQJOwoFwQ14PYZ+lYevzVuICU0xeeoNHzXcwcMZ58kdOukgknogYqobGy8E3vi5tWEUQNcIMv0Fj/zDAfwHVvgTP7W7wlUXntx91h4HSCnM14zSTsKm1GGjsq3NRGMSL/FUIvxOJvTWvlNjIqt/2Ce+k4KquD/6aG1qzqB0cevSUYJumdHZsASxN+hpQD89Q8zb9INUZncOXQN3kTqBRFNnq0OaO2HmTfrsIsCNESljjR2HG0g1d8HPGTWf30qBmtTyblUJJfgYe6t6MEdSLZLzMciiCvoQ29icrcY7O8fw91iyNn+OZ6715t5aZJDkKp2rZdEADKwH9ErA8SK3kUr3Z7El6pdRKuXLT1+8TZpw6XD2/TrtNA0sZiZ2S/WVIXkZeFZ2Gli5MKN9cGtytTDn+MFV5wDEFkHLclPBzk9FjLHvWM57Oe1hrGndRgdBGe4KHxU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(136003)(39860400002)(396003)(346002)(451199015)(54906003)(2616005)(26005)(8676002)(6916009)(4326008)(186003)(6512007)(66476007)(66556008)(31686004)(66946007)(478600001)(41300700001)(8936002)(5660300002)(2906002)(83380400001)(53546011)(316002)(6506007)(38100700002)(31696002)(6486002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjZqSlFHbm1ES2pEMThQNDhSZWZ4VGtzSGxGbFlsMk9tSldtY3NDTU9ici8r?=
 =?utf-8?B?c1pqOS9rMitXek1KY2dxTEZtd3htLy83c1VONFU4dmtQVXE4RXNQVXdkMHRy?=
 =?utf-8?B?U3gyVXVDMW1XK3BsalN0QlRyZDhBY2lUNmtwV0VEeS82Wlkwdkc5ZUV0TjR3?=
 =?utf-8?B?S1RXWnJjWUxZVnFjb2VxUXNDMzMwZi9nWjhkMFJTVk1jWFFDZ1VxTVBtRzhl?=
 =?utf-8?B?YUFXMTQwNDhiQm9lYktCQytPZ0tZaVN2U3E2Z2xhRFhYTjUzb2pLa0hOVjJW?=
 =?utf-8?B?YzZoOGNzSEFDWFUxWlcwUHJON2RLdE1TYW5oTmxKSEVtelBHbWUzNzBVSDJ1?=
 =?utf-8?B?OTQ1WXBJOVFpaTlybDkwbGxTZDh2U25zSGtvajc2U2k4dmEyRVVIb2pScnFn?=
 =?utf-8?B?Z1V1SjlYL20wbHc2eHk1YkZDd1QxK3BSMm1taldkb0dUcFVwYkl2TXZsTlVq?=
 =?utf-8?B?VEE3ck1zcmRHL04xQUU2UXQ4dmhFNUZXOEFhSjVpVXF6V1YvQlJKZHd4aHU5?=
 =?utf-8?B?VDZiTjRsa0VjaWtCSEpxUTNjMmlwM3dqSC92cmJxQTlrR1lFQlRHWkR6SkhT?=
 =?utf-8?B?ME5xOU5aekd5WkJwdGV6V3B2WE5hdWVvVEpramg3OGltMi9YTmp3S1BENnRF?=
 =?utf-8?B?cGROUnlyVklGUGlRZEFBLzFGT1FqWENhZm5yS0Y2UFhoZlRkWmlPU1Z6VUwr?=
 =?utf-8?B?T1p4cEtTaUszMFpuelh5dnZSRmVaeGFRb1NVeHlleFcvTTZ3elFzT2prZWdT?=
 =?utf-8?B?RnB2V29aZzFNREVBb3ZmOFdaOHpNVFVoeUx0dXAxZVVVbXFFOG5DYlJ6NUR2?=
 =?utf-8?B?NGErZS9ZNkNXc0JxVklSci9sVU9ZcjVsek1tTHg3VEk2Ukt3ZUFMRWdWekQz?=
 =?utf-8?B?N3QvdXZzck5pNTlqY1FCVDRONGVGWnltYjBoSU1lMFpJdDFIbHZlSERRdUJk?=
 =?utf-8?B?RW5LNjlJL21DSVF5aU14YlNjZmF3K052VmxNS2pya3hyNnJyeTVmTStHMFNx?=
 =?utf-8?B?b0NybE9nMlV0b25IYTZDU2ZCQnNicHRjWTkxOE9xditIMHBRMzhmNlRkejZz?=
 =?utf-8?B?LzF0UkpycXFudEtFU2lxUS9KR2pqc2dlTXQ0SytNUkVnRDdMenduT3NwSDhm?=
 =?utf-8?B?Rm5TRXBCaWluMDREUXk3WmhCbUVmWUwvQS9lbzJTWXc1TTdQL1d0VS9mUisz?=
 =?utf-8?B?cTdJZ3VabUsydkpoUDRzU0hkYlFoMGh6dWF0L1FWdHFVWXMzNVRBL1IwaXlP?=
 =?utf-8?B?Q0xGZGRIK1U2WUdyZ01jejNGa1YvWWJBamRIeWZTeHFOTm12MEp4bGx1TWVu?=
 =?utf-8?B?MGdPaW1GWnhCQ1dLc3BoOGxSWitmNVlQcm9SOTJDQ2FhT0ZuR2V3L2l5a283?=
 =?utf-8?B?WHVTUjFCM1dYNkcrU2JvdFlIazNaSEYzeEFTSU9EYWNwWEx4TENWckR6T2hG?=
 =?utf-8?B?SndHUjVqbTdEZDBPdGdrN1MrZW9ROUF6U0lJNWI3b1paYjI2MTY2YmFTdEIr?=
 =?utf-8?B?Z2VvMHpFd3N3MzR3VmpIbGlQVkgyZk9mTEJIcmFpZ2RFZTBWQ1ljdGlSSU8x?=
 =?utf-8?B?a2F2T0xEZmR1QmV0TDRoR0ZQZDdjWmhSSXBIU0RiTmQ2MEtnaWxrcEI4Y0hL?=
 =?utf-8?B?WFdrajVhMzFxdFBoNlFLZUc2SmpuVGxhVlRqSXV2THU3blNDeGw2THFSTXph?=
 =?utf-8?B?bG9VZmhvQmhvTHJDRGsxNEZjK0NKZ0lBQkNFOEJQU2wwOENxWTA3eHM2Q0Uy?=
 =?utf-8?B?dmdJZ01rT1BtWVd5MHdLZWJyZ1paMzV0Wm1aUVFjdEtBR1hJVmJTRmdtSTcw?=
 =?utf-8?B?TzcrTHNIbU9CV0lsK2tHTWJqSXcvbGlwUkN0dGw4Q0pXMUJOdmVJRmxGMkVj?=
 =?utf-8?B?UTNQOVRqdjdKVzNxbW10cElqUm45b1JGOHhlaXBXWVNtWEtyTExnOHZhM1Ru?=
 =?utf-8?B?eGliV1lpY2s4ekVNYnB1a0xNMm1OSW1CL3JyYXdWV3RWVEhoNTEwajgrQkNr?=
 =?utf-8?B?YTlmS0ErN3gzNDRIbGtPTVh3TVg3R29sbGdvSytWcDdZRUJocVViSHJ3R2d0?=
 =?utf-8?B?NGVUR2JvYW5tSFhGeFZiZUdPa2x1ZVpLcERCSHg1Qk9UMlhldzNDVm5JMCtv?=
 =?utf-8?Q?TpkuPxDq3nBTrPLwH5Ss16//Z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c010605-a358-45e1-ffd2-08daf79fa057
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 08:56:58.9891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ce6jYqfEK2P/ckkMAksB83VufH/nnofDCtMpcTSexIDssG9H5fgCYqkQYAeG7U/e1D8j7LKeUczgNSvXc756ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8881

On 13.01.2023 12:55, Andrew Cooper wrote:
> On 13/01/2023 8:47 am, Jan Beulich wrote:
>> In _sh_propagate() I'm further puzzled: The iomem_access_permitted()
>> certainly suggests very bad things could happen if it returned false
>> (i.e. in the implicit "else" case). The assumption looks to be that no
>> bad "target_mfn" can make it there. But overall things might end up
>> looking more sane (and being cheaper) when simply using "mmio_mfn"
>> instead.
> 
> That entire block looks suspect.  For one, I can't see why the ASSERT()
> is correct; we have literally just (conditionally) added CACHE_ATTR to
> pass_thru_flags and pulled everything across from gflags into sflags.

That is for !shadow_mode_refcounts() domains, i.e. PV, whereas the
outermost conditional here limits things to HVM. Using different
predicates of course obfuscates this some, but bringing those two
closer together (perhaps even merging them) didn't look reasonable
to do right here.

> It can also half its number of external calls by rearranging the if/else
> chain and making better use of the type variable.

I did actually spend quite a bit of time to see whether I could figure
a valid way of re-arranging the order, but in the end for every
transformation I found a reason why it wouldn't be valid. So I'm
curious what valid simplification(s) you see.

>> --- a/xen/arch/x86/mm/shadow/multi.c
>> +++ b/xen/arch/x86/mm/shadow/multi.c
> 
> Just out of context here is a comment which says VT-d but really means
> IOMMU.  It probably wants adjusting in the context of this change.

I was pondering that when making the patch, but wasn't sure about making
such a not directly related adjustment right here. Now that you ask for
it, I've done so. I've also removed the "and device assigned" part.

>> @@ -571,7 +571,7 @@ _sh_propagate(struct vcpu *v,
>>                              gfn_to_paddr(target_gfn),
>>                              mfn_to_maddr(target_mfn),
>>                              X86_MT_UC);
>> -                else if ( iommu_snoop )
>> +                else if ( is_iommu_enabled(d) && iommu_snoop )
>>                      sflags |= pat_type_2_pte_flags(X86_MT_WB);
> 
> Hmm...  This is still one reasonably expensive nop; the PTE Flags for WB
> are 0.

Right, but besides being unrelated to the patch (there's a following
"else", so the condition cannot be purged altogether) I would wonder
if we really want to bake in more PAT layout <-> PTE dependencies.

>> --- a/xen/drivers/passthrough/x86/iommu.c
>> +++ b/xen/drivers/passthrough/x86/iommu.c
>> @@ -56,6 +56,13 @@ void __init acpi_iommu_init(void)
>>      if ( !acpi_disabled )
>>      {
>>          ret = acpi_dmar_init();
>> +
>> +#ifndef iommu_snoop
>> +        /* A command line override for snoop control affects VT-d only. */
>> +        if ( ret )
>> +            iommu_snoop = true;
>> +#endif
> 
> I really don't think this is a good idea.  If nothing else, you're
> reinforcing the notion that this logic is somehow acceptable.
> 
> If instead the comment read something like:
> 
> /* This logic is pretty bogus, but necessary for now.  iommu_snoop as a
> control is only wired up for VT-d (which may be conditionally compiled
> out), and while AMD can control coherency, Xen forces coherent accesses
> unilaterally so iommu_snoop needs to report true on all AMD systems for
> logic elsewhere in Xen to behave correctly. */

I've extended the comment to this:

        /*
         * As long as there's no per-domain snoop control, and as long as on
         * AMD we uniformly force coherent accesses, a possible command line
         * override should affect VT-d only.
         */

Jan

