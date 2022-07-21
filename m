Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6D157C8D5
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 12:19:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372620.604445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oETHG-0002XG-1j; Thu, 21 Jul 2022 10:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372620.604445; Thu, 21 Jul 2022 10:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oETHF-0002UE-UU; Thu, 21 Jul 2022 10:19:29 +0000
Received: by outflank-mailman (input) for mailman id 372620;
 Thu, 21 Jul 2022 10:19:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=itvi=X2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oETHE-0002U8-Ci
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 10:19:28 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140071.outbound.protection.outlook.com [40.107.14.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 998b67a6-08de-11ed-bd2d-47488cf2e6aa;
 Thu, 21 Jul 2022 12:19:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4077.eurprd04.prod.outlook.com (2603:10a6:803:4b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Thu, 21 Jul
 2022 10:19:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Thu, 21 Jul 2022
 10:19:24 +0000
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
X-Inumbo-ID: 998b67a6-08de-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ntljw+vnOapobpr/a6k3U0KLx2ud1n0qRjZv8Q28JFNg+HMUrHhowSLmohlIHlYTbQfWYtAdm/cu9TODAfmjhy4wb2ZFiy/nU+KpcPy4LO282r9+IBjjcmRu1047ZUheDD0HoExSFslIuEbRjoCX3rPkXo6QgqWhHHBySuiqn+PE7JGOrwIjgtwdD1l0qe/cMLISXgAchbsIuhJgbhvSsz1tPSF6e/KW0mGaXJ4/K/2kkR2D3NQO9IwZptXUfv/0wqkyv6Obmof18eljBmOnhd/N6gq47Pu7Ovw/XOZCJaAnfZlgBohQHuXxSpUz0BhXh6HlYoiZbAiV3TB2DnTMQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYQPAfY154PcZSxi7JMTTG068QuW44x+WnKsxhbnoKg=;
 b=MaxoEOIc/KAnrGf0EzI+Yv6ip3YPLdpMYHQ+tcvc6B+meSkYRPDQ9KXlbdinNKH9NkcZjfk5V1FMaMIr7T+f5qoZJNzmpQaHuf5Hg3KZp0fG4axLO73h9/jZd5RnX1A/Cbk6qpInDWwttKyS49iNCKVQ4PRJxdlhCnUKP8TIvQsc1bzM+8CydYrrmL1raD4jnu07eS4Sj7wl+wRGEH8gHD/7VNFFdWBQUnSDWTDoFEMPESfeqP/NTLthbnBNcsgcl72Stzb6/cWi9guQYdIoV0YXbRguilm7kZO7dZkGJieWBUIqFo+az2SqGCRKIJq7jZivgqht87/q91MgPeJWXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYQPAfY154PcZSxi7JMTTG068QuW44x+WnKsxhbnoKg=;
 b=uNcaBBU0/FlkL2PgXyzj0UFfn+MzXzp/EOV6cK/sCHgPoit8e1lA0gni5FOCDdEhS1jLCk06BZd+nMjmKPSH8cPxCooT2oVrTqUaP2TgS6KDBExNqrqsUnbjspN3oRXQediMYk6m6xC8bdhPoaePVUnwNtyuUPwwEmhh5+KuWVHFRGIO53axHKcfOnjoq5mrVaVcpX5SDAW3yDNCrTKpChwztQ8gI69yvMIl0pTZgQhwR47E9BJH9PHH7fmMivksr3KKUfENMfzdo0BoVNOXFwfKMQwpd5oQCHGfA4SASbQl5VeIK9DMRj31IKaF+uSAe8M+8QHW4II3f3CE16grqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3160640f-f74d-725e-f2fe-3d33c4999772@suse.com>
Date: Thu, 21 Jul 2022 12:19:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] x86/mem_sharing: support forks with active vPMU state
Content-Language: en-US
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <a8a66208064c209e65c08380c59bc6aeff5f57f8.1658340502.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a8a66208064c209e65c08380c59bc6aeff5f57f8.1658340502.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95bfe582-eb26-4c3f-ce4a-08da6b027c47
X-MS-TrafficTypeDiagnostic: VI1PR04MB4077:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lrBTER3e3IybvFTjqDovOhxj5hzLqqli1+1a44WI7vc5WlYGwgkWydHv1wgMnGhHaxkSBIA4I5glGzyQhd0Y9is4LsFJ9y1wJ6mAmDeWGnuHtwyUnZaj12IaeL3onYIKkaNA0Szw/WESiqo6cQtP+dDXmaVStnj5EpRgC6c9bIq3KxFLGQrvk0QulbYmwGaEEArLhADIfplPntkV0evoWaDk5pg4vH3UbgsHz6GY52IgthlJtyF+syYSuixEmzA8HIeFukONFq/Vfxi1zaMBhRQBZe3GMgHGCOkRb4JZ5MxFVG+VNo3VP5sYiRLenZ0gYfVB+FXMrZ4o4r/8owv6HkbVOrtR9cFKSjRh9VkqRl65c91/CDFAdoFmD5GnQh7k1qiRq198vju1L87yyyAm6AhDDzDXsnhbP1uGdfE1arYV80CLVjNnLNuCSGZbFs1Iea5Tyl+bmkrB/cYh0qVuPGChVvR6sRBp6HY3P1VzzDbpXl+hMbqm/kCRucyUIL5z8qX0NFrDznvJniHobiN2cA+9usRVv/UWEz2i7gnqNdXKYzoMItO0gj9qNo4Cl/pGMGvuZvaB9c6qwIUSfx7Ps4jUjQykDBmGhw81OoJTKa9DXTsWY1KCQ+BWxJojw3ZNGIH1kizfxkTt0F0gkO5rBt2OCfIgzw57Hm0HnEMjM1yn65dYDWbcAlS042Wu6kqbvH36RCCnWpkhF9UJCnyIsz4uq1uWnWXIj3nwV8wUTd/oeM31bOb7RqQOHuDNehzoQz/i0MLu1eURgRi1y9yZ70ly0w3sN5E6GSm/tCpyeS2N+A9RPeMrmPx7F/IhbyJ5XkE4LCZv/dyTRumZOyEisw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(376002)(39860400002)(366004)(136003)(31696002)(2616005)(316002)(6916009)(5660300002)(6486002)(54906003)(186003)(38100700002)(478600001)(8936002)(86362001)(66476007)(66556008)(66946007)(4326008)(41300700001)(6512007)(26005)(53546011)(2906002)(31686004)(36756003)(6506007)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVdwbjJFdncxcEVybGlwNjVQamNEd3FRcEkwRVRjdjNwc2VnSkNPY1ZNLzB3?=
 =?utf-8?B?MjEycGlXSEMxOEN0KzFIamFNekxPczRtZUl3SXMxdWM4S1Y4M2NOeGFscUJs?=
 =?utf-8?B?bmdhQVFUY3p2WWdTd01PQmJoYngrdXJxcVE4UmM2V2tjTnVoNEdQMi9yd3NM?=
 =?utf-8?B?ZDMrUzhZTXhiREE4ZVBCbTJXb0t2cmFCUVB4VHpiaXpBZlNCVTREeWhjRlR5?=
 =?utf-8?B?S3BjSlA2bWFqeWYvVjNPWjg5SlVMc2kyeCtjRFB2VlRkUllFLzFvTGo4c0NQ?=
 =?utf-8?B?NHhzSDRCSGN1ZDY5T3dBaGF4bmFlNHhHcHBqYklPdmhMRGdvdUJ3ZFhKSDhN?=
 =?utf-8?B?bXNiOGhTUXJ0SjdTQVZsazg3QVdsL08xSTNMckRqeTVyVGZyTDYwcENHZzQx?=
 =?utf-8?B?dCtKT20wbXpQRlpld2dEVG9pZ2JDb1BIWlJENXZ5eGs2T0JDNzJQNWhmK1V6?=
 =?utf-8?B?dk5KR04zUlBORVFQbTZJenZ4NWV4TzBXN1NHSUwrcVd2Y1FHdUVoK2ZZTGxL?=
 =?utf-8?B?aTBmZUl0dk5QNU81NjlpdHpZQk9mZE1UUE9PbVpLNGg3RmNIOHM0YVpkVVF5?=
 =?utf-8?B?MGozRVY5QmNzUlR1MWJ0emJ3cE9kL2g4SGpWREZIMlFmQnBDTmFVMzBYa04y?=
 =?utf-8?B?NDhKR0FXMFQrM3dyZVdoay9PRUdwSTV5Rk5hUnRNV3RERFBIdFlsaWdVeXZG?=
 =?utf-8?B?RXBEU1dEbitEQlhUaXRmSldYYVdpS3k4KzZrODFTZ0FGcTJZSk1PdGl3QjVo?=
 =?utf-8?B?bHZMVHBOSHE1bjU5VlFsaVJ5ZDV2ZEtESG5rWERTZ3M3NGlyS3VEUUFudFZa?=
 =?utf-8?B?ZUZrTHJ6b2c3QXloclNPZ0ZVRlV5L1A5TUpnRUt3SDRqZzhQekwwVFhaWE01?=
 =?utf-8?B?dzVST0RPRnhhcXdXS2xZS1EyaDJjQ1ArUmhGWXBBMGs5NWRYcnhOdlkrNjR2?=
 =?utf-8?B?YTYwdE1sTzQ0bVlCcGc1SkdEK29mbG1mNGRPRExveUkwTFlWbmUyMEkwRmJF?=
 =?utf-8?B?bEFCMUM3VW04eFhkL2N1V0hmNDN5ZzFGL0hlSzEwVjNVajFjSlFXbTNCamtz?=
 =?utf-8?B?bVNYb0g5ZW8zSTBDbFpaTllMeWVUQmVDSHZ5QVIrVjRNNE5uYzZvS0VHemNz?=
 =?utf-8?B?dlhjRkNTNTllUjhmOENrZjU5VE9JQ1RHMEFEcTREbWhUS1NsZWg3aWQ0ZlQv?=
 =?utf-8?B?OVBEckR6a3JmeGFCZ3hXMjNaWlZ2azNCbkdPa1FQaCtFSk1BdlZiYWd0YmRJ?=
 =?utf-8?B?RExNdk9qS05UUmY2UGovZGV1aVBaYXlaSVlWYXhubWNXN1JrYjdaNnRFcmVw?=
 =?utf-8?B?R0J6ekpEaVVTdVhwZGpLc3BhTFhZUU5LMlpXNjBZMnlMWG5BUzRrSU5VdEZL?=
 =?utf-8?B?Sys5VDZjWjI0ZWVNVjJ3OEpKTFFXYzJLYW5QMGpBMFo3SHIwQkNKUUxzRTdI?=
 =?utf-8?B?UDJUT0I5SnJwc2Zyd1lJaStIUVc4bkF1VHY2VEtjS2grSkNzSTJhd2VkV0F4?=
 =?utf-8?B?UGZmaUl0RGIyd01iTlEybURjbEc2VEN0U2FuZ0V4VitCRXhUVW1OelRrUU5W?=
 =?utf-8?B?SXJsSFRrWVl5bDZiVU5UL0tyN3F6TXlwY1oxUWF3V21sTytuVU85UlNWVlNB?=
 =?utf-8?B?YjR0Z3hPZUQ1T1MwSTVTVEJ3RUZERlVxVlVEcHNhMnQzdWtnaVQ3clhUL1N3?=
 =?utf-8?B?S2hyMjd6QVROUEpBTzRyU3RQU1NMQUVtam1qL1A3cnRXdWUxbFlLYVVYYU8y?=
 =?utf-8?B?OGtoQWw4clZ1UmhOWmtaZzdxeDdkRVFoQ3RZQ2ZrMkNFakczNkN6NWtpdnNM?=
 =?utf-8?B?Slhmak9DWWxMZTZhYzJodUdLcUFyMkN2V3JqSlVnZWdrMHE0Mk1PcUZwOTNk?=
 =?utf-8?B?cVdJMGpoZWsvR1B2OVdzSVVvL0Y5ZFhhZVoxbWpyeGFzTDArZGpmYmJsMXAr?=
 =?utf-8?B?bzZPbXBrUnJ1ZEVUNjhoWHc5djljOHNGY3JBSWFvQm1WVjY1ZlZLRHFRL3hi?=
 =?utf-8?B?STBiQ1NpMmw1LzR2Y2NDcWpGQ3Z3YzZlUWxnVzhtS0tvMG1LbGVzV0lkNCs5?=
 =?utf-8?B?ODVjZi9JSWwvZkNsVjBLWjN3SElMS1RkWXZESTF2VTFZQnd1OXJ5dkp4bG1w?=
 =?utf-8?Q?BcFlgKVSkPh0+DjG0ayZ6S7GL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95bfe582-eb26-4c3f-ce4a-08da6b027c47
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 10:19:24.6627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IjeJsK0frO6p7pNA6j1tcBSvC+2g9mt8ysKV/4bjXNH8iEqhDVklvquq4Ve7uopMDvAaZxY/du6ipom5TXmIig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4077

On 20.07.2022 20:47, Tamas K Lengyel wrote:
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -1653,6 +1653,46 @@ static void copy_vcpu_nonreg_state(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
>      hvm_set_nonreg_state(cd_vcpu, &nrs);
>  }
>  
> +static int copy_vpmu(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
> +{
> +    struct vpmu_struct *d_vpmu = vcpu_vpmu(d_vcpu);
> +    struct vpmu_struct *cd_vpmu = vcpu_vpmu(cd_vcpu);

I would hope two of the four pointers could actually be constified.

> +    if ( !vpmu_are_all_set(d_vpmu, VPMU_INITIALIZED | VPMU_CONTEXT_ALLOCATED) )
> +        return 0;
> +    if ( vpmu_allocate_context(cd_vcpu) )
> +        return -ENOMEM;

The function supplies an error code - please use it rather than
assuming it's always going to be -ENOMEM. Alternatively make the
function return bool. (Ideally the hook functions themselves would
be well-formed in this regard, but I realize that the Intel one is
pre-existing in its present undesirable shape.)

> +    /*
> +     * The VPMU subsystem only saves the context when the CPU does a context
> +     * switch. Otherwise, the relevant MSRs are not saved on vmexit.
> +     * We force a save here in case the parent CPU context is still loaded.
> +     */
> +    if ( vpmu_is_set(d_vpmu, VPMU_CONTEXT_LOADED) )
> +    {
> +        int pcpu = smp_processor_id();

unsigned int please.

> +        if ( d_vpmu->last_pcpu != pcpu )
> +        {
> +            on_selected_cpus(cpumask_of(d_vpmu->last_pcpu),
> +                             vpmu_save_force, (void *)d_vcpu, 1);

No need for the cast afaict.

> +            vpmu_reset(d_vpmu, VPMU_CONTEXT_LOADED);
> +        } else

Nit: Style.

> +            vpmu_save(d_vcpu);
> +    }
> +
> +    if ( vpmu_is_set(d_vpmu, VPMU_RUNNING) )
> +        vpmu_set(cd_vpmu, VPMU_RUNNING);
> +
> +    /* Make sure context gets (re-)loaded when scheduled next */
> +    vpmu_reset(cd_vpmu, VPMU_CONTEXT_LOADED);
> +
> +    memcpy(cd_vpmu->context, d_vpmu->context, d_vpmu->context_size);
> +    memcpy(cd_vpmu->priv_context, d_vpmu->priv_context, d_vpmu->priv_context_size);

Nit: Long line.

Jan

