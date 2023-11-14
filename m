Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB9F7EAAD2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 08:20:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632156.986238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2niG-0003zo-FH; Tue, 14 Nov 2023 07:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632156.986238; Tue, 14 Nov 2023 07:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2niG-0003x0-CI; Tue, 14 Nov 2023 07:19:56 +0000
Received: by outflank-mailman (input) for mailman id 632156;
 Tue, 14 Nov 2023 07:19:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5ZB8=G3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2niE-0003wb-Ud
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 07:19:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34aa5417-82be-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 08:19:53 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7839.eurprd04.prod.outlook.com (2603:10a6:102:c9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.15; Tue, 14 Nov
 2023 07:19:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 07:19:50 +0000
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
X-Inumbo-ID: 34aa5417-82be-11ee-98db-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSCige+OTFW67D5chvWqM8oxsdg9++WCYr99Ieevpj4eaNh0L7H/CzfbWjUXGzguCpFaN565+AjcUYzr4tTUWrFC4GcrCPwI8B56PtqpUIqFa9KiLvBT48olF8PACCwzNbEysdOeNyu1UMWvaChVSa6+wG/nnbGLdSHlvmXyfBRLR0WUHpVC+WmKfR0sLAVTv6GZVVsEGsoZUJLxx0BQk5SfJP2U4TE7AG44vnQumruxR+JufYiaOsKpzTniTKNP+qrW8GX9kwfWYv6cxm/lF6wZxxv7CAOv5Ke3Aj0jsmC4oMwCcSgInrZEYiNudG9e75IndbFfvkUBl+c42oXA8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dneJVy0qJLknSKlthWMe10HvNbRG0QkeO876ARckVSU=;
 b=QmyR559s8aRTxKbViRAyD4QaRcPPXGBfM+LvmOBRzATiSctX0g4PVYL8E3N/rf8XGzJ08s+0O5dQGRutFxGYM0ceUI1hM9OWqWkLwgM6MaXrxqUjteDLLkITjHAy045RcsXhRnxqxPtAvoZAFjGgXz1kS36yGn4uvkBPR0pz/hjqjX3uyBOzaqrlIHamQbo9PSXp09OqJPUiE4q89iS0alI9CtgtRSQjqxhhuZCmV7z6oHI/p80Jzt+P46UhnxyYjAzvKtdW0w399s3LwhoZr8Hq/Gm4g0fSCyyEz46K7RN87pM1sWS6xKBCebMuGXfHAoZxaBLIgq9XNQZcU+J4Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dneJVy0qJLknSKlthWMe10HvNbRG0QkeO876ARckVSU=;
 b=aNw9dDZ67JMFrTsQRmGBwcouX4UnoYeYK3QooduEXJSViVmdPIRO8SN0Mei5BUPWveQv5Uq0iUKBVrZChF/aVJkta9NYINUsb4G0MbMjBfQdEVSyqzpe4uE2GvgO73GhT5dcFVBe/NcYV4ev/0ksk98upFlelc98wufk9FrS2GiY25rHLL88zRchBSh2J2iRhwJ+e0ZjaYqlozVeAIYEtuJpHa2IvkNhLxBkQWhYLg5L3c9K01lEHgioekxUJ2jS0UYzAgeAbrvIqUwONLDRKVFMug4N1YEpy8MiqjAV9NPxT0hh36zCUdzF63Bflvn22np+2FUDyRQ/TYqJNd2RhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <82637305-58ff-3204-09f4-13a1f2c969fb@suse.com>
Date: Tue, 14 Nov 2023 08:19:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v4] xen: address violations of Rule 11.9
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <b8a82daf5862287bda9545d7e672ce98e49004a2.1697701358.git.nicola.vetrini@bugseng.com>
 <b7df2987-ab46-bb09-4440-e743018561ad@suse.com>
 <alpine.DEB.2.22.394.2311131557210.160649@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2311131557210.160649@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7839:EE_
X-MS-Office365-Filtering-Correlation-Id: a91a968b-360a-4e02-6666-08dbe4e21722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ngku7ytoxnSHBQxptNd3tS6RH55GrEPOh9DH0Ma1i6GFIdhI+6tj+KCOGm7dQ2+DE6kbA8j1KjrX8RcdrcWJFVglBsBw0g22EEy35phfguQciJXXHiQDX3UqzEeiPpRxtlTMt5mR9uWmpe2e0ZQvt/+FZKeu3fH66H70voPYNjZ5scYhHmXn51UDFgy4glKKW1atpIk02Ks6Dz0BuNbb0o7LA+OAUdSg07ehTWaYkiDr3s6DbJ6J7AD3Hues70/fO75rocPiUwxwDmwUKK2YwTe539x3oyJtCo+VDrktu8EIMs7Tv7xKL4kf6is3mECpXtzMvKWwCOKjVBrDQJdtUYyRcIPQKN+mTVv/5YODkHl0u+esS5LbKvqkwsuf8MJN+tvt2s40ITlXHEAqPPzgePUOiqBm2392MOHt0bUyX3N6y82+ldr81w3mhD7pSuftmcaYRcs6y7kxHDlHr/h6glKWfzI4w4yblG/C6v0dO5cArN/Fmte7ThObymKwPFSiDq8z2Er57/lkJrLA/OzeRYVQGbWq/Z+aCpwB2lJIcPvFYrVSraZbI7oEBbFD41lD5DkRFxMULOW784MQ0mGShm3cFuxsPlWSwWM1kENRFwZoOvLs8JYEIU5KWdNmJxdkPMgU1eURx2mV1FgMezn50g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(136003)(376002)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(31686004)(66476007)(66946007)(31696002)(66556008)(316002)(6916009)(54906003)(38100700002)(36756003)(86362001)(6512007)(83380400001)(53546011)(26005)(2616005)(6506007)(478600001)(2906002)(6486002)(41300700001)(4326008)(5660300002)(8676002)(7416002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uk4vbVI1S2V4d2tIOWJXRzBHeVNORUYzNEZhVHFaWkx5eVBJM1hyb2Evd0Z6?=
 =?utf-8?B?dTlSN1l0cjlCWjdhUUU3Vk9xVDNOWjZtWmZGL1BsaisvemdFUjNzM2x0K2RW?=
 =?utf-8?B?OWEzUE5hWUVCQ0hvKzVWT2ZiUnhldStrU1hXSFBPeHU1NmtsazIwZVpEaXhY?=
 =?utf-8?B?TW52OUN2M01TUnBsREdldWtYWDcvbDRHM294QmJHemhZREU2UEZCSmkvN2pM?=
 =?utf-8?B?a3VWYXE1dzZibW9DYWFiU3N5K0Vnc3FGSVRFVmpYRnMrSm9MbnYxa2Rtakdm?=
 =?utf-8?B?NldNRzFVTXVUZGt2Z0R4RmJnbVNtNm5qU053WDM1NC81NDBNQVNVRk1UcjBn?=
 =?utf-8?B?RDltbi9oNnJFbEdOc09RcGl6TFNwZjkyZGJRMnd6TUFxTjUyTFlQaW51OEpp?=
 =?utf-8?B?cFlQbk16bm42MVZsUS9meDlwS0RieVpKczVsY1lmZFJ6aU5LU3U0eUNIdFlp?=
 =?utf-8?B?UHV1aTFKOG5WRGwxdUN1dFV0UWFjeDhRSnlJT3kvWk01UTZSVkROdmt2MnBy?=
 =?utf-8?B?ZzBFUVJYV1hlMUNtTDR0R2pubytFUE0wNmpPZmo3SlJhWUg5aWlid1ZlNEV3?=
 =?utf-8?B?ZG1ZMDR1ZHR2M0FRQlNlNlFjR1dTdTkvRlQwK2dRMmxEeWJuamRDVjloZnlm?=
 =?utf-8?B?c2FSZGtqSWhkYlhJbkpTYW9nRmNLblB5RXlFMW9pRFdQN2kvWFhSdG5POWJ0?=
 =?utf-8?B?bzJja1dxdnMrWEp6TWFiVWc0cTVBYm9jN3B6cGZhR1NoVFNKS0RkR3AzdlUz?=
 =?utf-8?B?b2FGcWcyeTlwTFVBTGZmS1FxQkNHWFR4RFdacDFiVmRXMUplZ29YT3VMazcx?=
 =?utf-8?B?NEg1MUttN0l4bGxneExEdDE4ekdLVTBOK00yUURxNFM3SHJZVFh6VE0za0h0?=
 =?utf-8?B?R0s4U09UTzVPNGIwTzhNS1FyMTd1Z3dvU3J6ZnNtNVVlUzNhR1JqS0ZJNVNm?=
 =?utf-8?B?VWc2ZmRHL0lrdWl1VDhLbGtSamZmSHFaZG1peVMwOFlqcUtjN2ZrSTRNRHc2?=
 =?utf-8?B?dmp0QmJaU0pFcEppK3V3bTh5MklPaUdnUlVhcUc1N0NNT3c0WlV4Q3c3ZEhw?=
 =?utf-8?B?V2N4RmVEeHN0L1Q5aU5rL1ljYk90T2c3aFR5WW9GTG9UTkI0RW9obm1SSndV?=
 =?utf-8?B?VUJHaDZiRHA1UitrbThqNkpnNWFwajNPenhDTGNzNG5qU0xNNWIzYms3V25W?=
 =?utf-8?B?U3FLSThhb1R0OFN0dzM4VnpnTDNZTU5uZkZLVHIrYjBQNnorUzl2cnNDcm5U?=
 =?utf-8?B?cm5aTUhJOFBCc2FIUjFoelZ4aFFpMmFkd1NjTDNlTXhsSVhzWmovc2pIOVBR?=
 =?utf-8?B?QmFMaC9HYUJuaGNIa2VIRnJGUmsranJkNFd6VTJiVnY5djFZSHFsWHdzZHlE?=
 =?utf-8?B?VjZFbEdMRUV1Tlc3SUhUeEpFc1F5elhmNVIxV0ZobEU1R2FQTDB3cTVyY1k3?=
 =?utf-8?B?ZXRoaTNqRXFuU3k2M3NvQjdhMWdFN3BPSms5VWE0cGNMeTZDaFFzbzhMcVh6?=
 =?utf-8?B?TGtoMDdQOVdIV0N3QjdFbm1Pa2NMS015NE44MkI3UzJMR0xOdDJGcWNoWURK?=
 =?utf-8?B?b0pZU1BQRC85Mm5UN2JyOUdiUG1ZejMvTnpqYjZGVlF6US9pYVJMbmMrVjhH?=
 =?utf-8?B?ZndOSDgwV0hDbSs1eVFvemJqS2hnenNGNDJkWlFEM1AvL1ptNTNHcVZZdFl4?=
 =?utf-8?B?eTk3MkpXNGJPVUhNUUROT25TL1JvMmF0S0Z4dDVaaytyRnpOQ0FMZzhwMkFK?=
 =?utf-8?B?M0VobGJPeWlUNXNPWkIwcmU5Rm5zcjlXdm1pUkwrby9WUThrTmV5L0J3M3Z2?=
 =?utf-8?B?UVdvYUpzYzQ0S1c1NjF2bmgyNXpIMi9FLy9RdVptVHBxTnpOMjBheWo5RUIv?=
 =?utf-8?B?d3E5cUtDZHRqSXVWWmhWcmppZGxVNFo1TUJEVWRBUlBtejIyY003Z0ROZ0RL?=
 =?utf-8?B?MzA4aTF4RzJaUmlCVGNiY1I3a0tVL0k2QktRNzVCcXRpVHRJaXpENjhUMCsy?=
 =?utf-8?B?ZHFEUXFlUCs3MWNYcWVvTVpYeUxteUZUTWJ3S2RTVXVwcFk4TnptbWdZTXU1?=
 =?utf-8?B?UFhoVm5oTGdKMi9aM3F4djd5bE02YTJadVpsYmN4YTM1cXR2V3BQMzNCSEV2?=
 =?utf-8?Q?fcpTtC8RAemFPX2uWXgIU1DcA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a91a968b-360a-4e02-6666-08dbe4e21722
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 07:19:50.6050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dIV41B9dSE7tLLtzFFFkKw30EX/Ebkp59DQwfvmblOa3/iAbaI4Xq+sOr7n5uGAK+Na/Wk7oj6TSMFY5alMe9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7839

On 14.11.2023 00:58, Stefano Stabellini wrote:
> On Mon, 13 Nov 2023, Jan Beulich wrote:
>> On 19.10.2023 09:55, Nicola Vetrini wrote:
>>> The constant 0 is used instead of NULL in '__ACCESS_ONCE' as a
>>> compile-time check to detect non-scalar types; its usage for this
>>> purpose is deviated.
>>>
>>> Furthermore, the 'typeof_field' macro is introduced as a general way
>>> to access the type of a struct member without declaring a variable
>>> of struct type. Both this macro and 'sizeof_field' are moved to
>>> 'xen/macros.h'.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>> ---
>>> Changes in v2:
>>> - added entry in deviations.rst
>>> Changes in v3:
>>> - dropped access_field
>>> - moved macro to macros.h
>>> ---
>>> Changes in v4:
>>> - Amend deviation record.
>>> ---
>>>  automation/eclair_analysis/ECLAIR/deviations.ecl |  9 +++++++++
>>>  docs/misra/deviations.rst                        |  6 ++++++
>>>  xen/include/xen/compiler.h                       |  8 --------
>>>  xen/include/xen/kernel.h                         |  2 +-
>>>  xen/include/xen/macros.h                         | 16 ++++++++++++++++
>>>  5 files changed, 32 insertions(+), 9 deletions(-)
>>
>> I tried to commit this patch, but ...
>>
>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> index fa56e5c00a27..28d9c37bedb2 100644
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -246,6 +246,15 @@ constant expressions are required.\""
>>>    "any()"}
>>>  -doc_end
>>>
>>> +#
>>> +# Series 11
>>> +#
>>> +
>>> +-doc_begin="This construct is used to check if the type is scalar, and for this purpose the use of 0 as a null pointer constant is deliberate."
>>> +-config=MC3R1.R11.9,reports+={deliberate, "any_area(any_loc(any_exp(macro(^__ACCESS_ONCE$))))"
>>> +}
>>> +-doc_end
>>> +
>>>  #
>>>  # Series 13
>>>  #
>>
>> ... this change doesn't apply, and I also can't see how it would. There were
>> no dependencies specified, so it's also not clear on top of which other
>> (ready to be committed) patch(es) this might have been meant to apply. Please
>> resubmit in a shape applicable to the staging branch.
> 
> The order doesn't matter in that file, you can place # Series 11 just
> after # Series 10

That would have been one of the possible guesses. Yet then ...

> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -274,6 +274,15 @@ still non-negative."
>  -config=MC3R1.R10.1,etypes+={safe, "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", "dst_type(ebool||boolean)"}
>  -doc_end
>  
> +#
> +# Series 11
> +#
> +
> +-doc_begin="This construct is used to check if the type is scalar, and for this purpose the use of 0 as a null pointer constant is deliberate."
> +-config=MC3R1.R11.9,reports+={deliberate, "any_area(any_loc(any_exp(macro(^__ACCESS_ONCE$))))"
> +}
> +-doc_end
> +
>  ### Set 3 ###

... there is this grouping by sets as well.

Jan

