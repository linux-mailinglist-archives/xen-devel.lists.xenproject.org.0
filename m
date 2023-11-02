Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6E67DEE36
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 09:33:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626765.977299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyT93-0002XC-9s; Thu, 02 Nov 2023 08:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626765.977299; Thu, 02 Nov 2023 08:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyT93-0002Ul-6j; Thu, 02 Nov 2023 08:33:41 +0000
Received: by outflank-mailman (input) for mailman id 626765;
 Thu, 02 Nov 2023 08:33:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5SK+=GP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qyT91-0002Sn-Qj
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 08:33:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84e91d2b-795a-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 09:33:38 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GVXPR04MB10069.eurprd04.prod.outlook.com (2603:10a6:150:121::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.17; Thu, 2 Nov
 2023 08:33:36 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 08:33:36 +0000
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
X-Inumbo-ID: 84e91d2b-795a-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWkHJjXe7d3xealKlsWCp5K0udmlW4VrGjLzEgOm5lTec4LMzc2VqOuF9WKqdeppRTMJ1uyDAqCjYyTn1ErB0GbyyQ5hJSjjUKZpcyfEyXkwWtRGC/FOvZkUh2wq0NSTKWdvDDGtggc2SIDmpoS+GWmAde+1vDdRl2KyUB9taZFLKIO38uVPeecoBfFIACwDAM9TzHTSQbjQN88Lq0NspokHy4aPnlXq1cr1K4D8LZqUeyfHWhDUZV4BF5TO0gex/FBt7DVRCm7ZP6uT0w4CGhYunTr3e8ebUYpZG6W0Z9rTxps77Yx+112tpAdd1zviEwg9LOsCDlJ62cL9A+Ia5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2BvuN/CeamPsqtW1W+IGaWU0iyTL+kGvCgiPZLlIso=;
 b=ccWetqCoiKg5TfJ9k9XA6L2wgkwUPJo5rFefz0QK6aSVuiMCYV0Q2tdRgY/hZ1rnF3+jOO2/WMT4ffj340Aig1709iFo3gCWndcA69SKD+1fhSEQrgK3lHDtyd4U60MJo5FkkRe7SvSD67UO7xvbVMg+EhAWErmdVWwuVeUF1nP/m7VxM797VwIQr5PVpjT5ei+M6Qxzo63VPwcUVoId0s8uPbbUmRhRABcnppg5LpEycPODtCVPlnvpcpj+Ayii+AjUWu4RVUxGMKtm+6BbHF4HONpVjNvNiKq5sE1fSKtf8nKxrhAbWp9lPmrtoeKKqFB7Bz61h6O3Z15PBFfoWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2BvuN/CeamPsqtW1W+IGaWU0iyTL+kGvCgiPZLlIso=;
 b=SDkvbFq0yipLpIxFTw4ZlWvmT8govmHbQa61AEHPeO3fOp95wQBgnrBGbh4mfYkW8lZ42IZ1+Y0Xe+d+U1JvLyLLlDXGlstvj4K/5MOrmmi0SyXAZ4baW3YitDl++fSIkVTlvTzBOjXo2AXMMNoZ4rQc6kRQxkArTAQdASNixTGOqFhvzDfbD6OPjxezZBZbTydVdZMSIW6ZWzZpfkgDRyme8yhsRXIEJWLyrWQ8vA89iX+kTFIZ4vC+HqRscsIPvMsMon8iCYQV1XG8cZ8DfAs93S+nTWzEsHqkyR4UeM0+iKZ37qSl30lhhvDLhg1nkRh+efmbPn/KbsEtMNPpeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7ca0ed7c-e797-7894-80e6-5d6497db9a99@suse.com>
Date: Thu, 2 Nov 2023 09:33:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH for-4.18] x86/time: Fix UBSAN failure in
 __update_vcpu_system_time()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231101203737.3441425-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231101203737.3441425-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GVXPR04MB10069:EE_
X-MS-Office365-Filtering-Correlation-Id: 88f7d23d-9745-4f10-5cda-08dbdb7e681e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PInwxHOnzaUe2KY/euAQ8weGz+ipGN+B1aNCfCjBgHQIIqmrugQ5qZxS5EcU292hvRVXlorh1v2tlueGI9HE4Ngb+8rFUsi1pmZU3Bhm0MRzC3ROh2KqYnBSAfsCrR9K7Q3iOvTgOmLts7WeYTm2B5sFdPq+Dx1PR8eF7jbBlpEDnBhVNTqErehhEMnxESURFYa+7HF4gPmd2DXZkOG3i2b4LQz6+fv5LpGABI6e2oJoBGz44STfAtQg8Mih4LHCbiaWS7KXnVzBYW/k6C2o0pTtNSFWjHqSREgwcRrA0VfgsrEeHZVZMYYITqvrjuMu6pPJODDXBbYbLiQkHOek9Ptsg0KcQsqMrQ+cpY5H7QDcYsNMbPOkdCL2fv+fC5wKQg20QkNI6JID3xte7lWm7GImsnyPYLPWeHYYLBcka0Vz7/AxoSu41PvkswOOi+poo72OCFMaBeCk+2aT7AFGlt/qFz5dx8qmfq3Ydo9u61wfim4DW+EvNp+OmcPoz1jPAC+1T0OQ4i1EbuNHzaQnSWe76bL+ROa7hXpKqHbwm4/FH2X8tLOCir9M+jU+XqLjfe+WYt6NkuF8aen0GcMJvqWYsvebQo6KURlTlGIfeU3qyyStw/H1sl7vch1G4Sr4vw5W/TMtzuJFTyg2DM/SSQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(396003)(39860400002)(136003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(86362001)(31696002)(36756003)(31686004)(66476007)(6512007)(6486002)(8936002)(41300700001)(478600001)(8676002)(4326008)(6506007)(53546011)(2616005)(83380400001)(26005)(5660300002)(66556008)(316002)(66946007)(6916009)(54906003)(2906002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejlkODBsSUJ6NTIzaGhvZXh4M1BVNGRNakxaenZIR1BQUDhHVjB2ZitFUlI1?=
 =?utf-8?B?NnNldjc4eUFTbUtORjlmS1k3RytaMWRFMzNoUkpySkxndkZqMmlNVlp2MTZs?=
 =?utf-8?B?STZmOWhhUUN3bGlLWEJ3Qk83ZGs3WFVUOWxGZVlYWnlIa2FJclNoditza01w?=
 =?utf-8?B?WTlIQ1VzUzBseVk3UjBvaXl5K1JXejVZbmVqTTB1U3hzWkEzcVBEOExxelh0?=
 =?utf-8?B?UFgxdjR1eCtHeUxqTWNqRXJBcjNPYlBnV1cxYXZMVkJidmZQMDMwR2FBS2Nq?=
 =?utf-8?B?eVZpKy9DZFVkMFd5eDJxdG1BRnNGcXl6NnhRc3FkdzIzUzUxd251WmZiZGp3?=
 =?utf-8?B?YVdOTUtkUjBaVG1aSTc3VmhrdExXTksybC9COFBFK25DNFBpUnhEbjYwc1p2?=
 =?utf-8?B?OSs4c01ZbU1VaGt3UDV2UjNueE5IUkRRNW5PekJ0dWMvaDdBOWo5MTY3dXhz?=
 =?utf-8?B?ejdjMDJabHJxTFpJQ3cwaXdKR2laSUNjSVozeVl6WE9nK1FHUDM0WVU3amZD?=
 =?utf-8?B?Uklna2NKQmF3SjRXQVlMMFlKV293WUt3SjAwc2twL1F0V1pVZEc2T2VFNmZD?=
 =?utf-8?B?VG4zcE1NNzdRMzhIb2YxVVorcFlMU2V1ZmhIUkFvM3FjMVdGZ1kzZUxOaFd5?=
 =?utf-8?B?Q3E3UHBVOTQ2ajVhYy9vdFNlR0d1MStTbzNoQmVycDBzd3F4S09rNGdGUFc1?=
 =?utf-8?B?QkhEZjVVZDhFNm4vNjFMZFd0aVhkYjRmZUJXSnZrQ0RKS2NVMnNQWXMwUmlY?=
 =?utf-8?B?dFp6clRnQzlwS21neDNKU21NVmJKd2xxK0xUSHZpaTNkdHBSNVBJeTAwdE1w?=
 =?utf-8?B?MkcvZTQzYWlmYW16VDFuRlgyWGIzL1UyYitZVXZQYWJpSC9GY0xLb0E1dXJh?=
 =?utf-8?B?eFFsalo0OGF2R0FPTElzM3NKR0lTTjE4SHlXWmgzUzBjMWhYRm9Sb0JBcm52?=
 =?utf-8?B?aU1naTJibjJrcCtJanlsamVMMkdGb3RDMEF5elUyMWpOeFFleFdQR3E4c1c2?=
 =?utf-8?B?Umg4aWJHaFpncHBvZTZhRnJyOGxwYUwzZ05ET2JzNGlQQno0Ti9vMTc2VUo0?=
 =?utf-8?B?ZzZNVCtlUE5mQVVHS0xNNHZWYjZLU3ZDU1BiaWc0OFU4NVNRa1BaWWRpMGNC?=
 =?utf-8?B?Y1B0TFZBRDVLeEVKbmw2eHRqWWtmL2lIeHJrYm9ucUdobE93Vnl6ekU0d0NG?=
 =?utf-8?B?cnVzY3NheU8zNXgwdHZnNTgrbkJsQlJFdXREVERJZ0EzblRWeFhoY2pEQWNR?=
 =?utf-8?B?VnJhZ01BdUNRSlh5OE5vMXprY0EwQmd3bDRPQ0NaSWJWMzluMkQxeWMvcVhu?=
 =?utf-8?B?cWFQWkJ4ejl0UlFlYzliUlR4VmFWbjJjY0pLQkg0dHV3ZW81aWJHbHZFdG9W?=
 =?utf-8?B?aitONFRaSjU1THhGWmh4UVNrYk9oNXJFc0NUUnd1WVdiZ0dyakwwYlQwTUJt?=
 =?utf-8?B?T2xFUjlpUjhSRFN3bjYvL0IrVWdvaDBLK1FTVVNmSWxiOWxBR2cvNEJIcHZJ?=
 =?utf-8?B?UXEzZ1F4OXUxTG0yLy9Zdk9vYjI1VDVsSzVJNWRjR1BXOTNIN1V0Tjg2a0VX?=
 =?utf-8?B?S3MrNUlYQWJ5ek9WNU5pcURNNGRzTkFnUEEzQmcybFIrakJaQm91Ty91bVBJ?=
 =?utf-8?B?T0kxSzZ0d2xHVXlZS01Kd3RtODIyT05veUdqTms2K3JSZ2ZOQzVtaUNPOGpI?=
 =?utf-8?B?UGpvS3pGdXh2MWVjaHlkQ0hWSk9hNzNPWDdVYkx3NkZrejFXKy84K3BlaVBG?=
 =?utf-8?B?bVBnUUw2aTVZQkVUdHZNcUVoczdVOUNWSm4vaUprRUVxY3ZlY1d0K3VuTXRF?=
 =?utf-8?B?ODFSK1RBWUVKWDVnVFRXUVZraEEzVS80cksvYnBnejA2YkpWYmRsWS9yUUQr?=
 =?utf-8?B?b1BVK3ZraVZvYnRqSlI1QkpNSGw2RXVFb0lNM1AvaHJVQ2hXNm5kYVQ3ME5C?=
 =?utf-8?B?VVd1ZUV5Z1VDRUVXdUVvTDRzd0dmY2xPOE81NnNHb0VWS3Qvb0tDU2tjU2V6?=
 =?utf-8?B?MzZOQ0tsMWFXK05yZEZSSGZRV0l6ZjRYR1NzRm15VTRqdzl1anhzK1c2MWoy?=
 =?utf-8?B?T1dHTUdUeWtzQnZzQmh3VUJPWHZORHFkcVFsNFNGQkc0UHJDemVhb0dMYWdq?=
 =?utf-8?Q?Ws6UlsdDtJuX3mmjqSMeA3LL0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f7d23d-9745-4f10-5cda-08dbdb7e681e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 08:33:36.3556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mD2WvKyygwBu4W69iAIz/ESMCdmfJp4fBBHLNR03NYsSxT1F3tfkQ4BGuS1B0p1PFj/NwIJURpX72AfWruVz+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10069

On 01.11.2023 21:37, Andrew Cooper wrote:
> As reported:
> 
>   (XEN) ================================================================================
>   (XEN) UBSAN: Undefined behaviour in arch/x86/time.c:1542:32
>   (XEN) member access within null pointer of type 'union vcpu_info_t'
>   (XEN) ----[ Xen-4.19-unstable  x86_64  debug=y ubsan=y  Not tainted ]----
>   ...
>   (XEN) Xen call trace:
>   (XEN)    [<ffff82d040345036>] R common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xd2
>   (XEN)    [<ffff82d0403456e8>] F __ubsan_handle_type_mismatch+0x133/0x49b
>   (XEN)    [<ffff82d040345b4a>] F __ubsan_handle_type_mismatch_v1+0xfa/0xfc
>   (XEN)    [<ffff82d040623356>] F arch/x86/time.c#__update_vcpu_system_time+0x212/0x30f
>   (XEN)    [<ffff82d040623461>] F update_vcpu_system_time+0xe/0x10
>   (XEN)    [<ffff82d04062389d>] F arch/x86/time.c#local_time_calibration+0x1f7/0x523
>   (XEN)    [<ffff82d0402a64b5>] F common/softirq.c#__do_softirq+0x1f4/0x31a
>   (XEN)    [<ffff82d0402a67ad>] F do_softirq+0x13/0x15
>   (XEN)    [<ffff82d0405a95dc>] F arch/x86/domain.c#idle_loop+0x2e0/0x367
>   (XEN)
>   (XEN) ================================================================================
> 
> It is not valid to derive a pointer from vcpu_info() prior to checking that
> the underlying map pointer is good.
> 
> Reorder actions so the NULL pointer check is first.
> 
> Fixes: 20279afd7323 ("x86: split populating of struct vcpu_time_info into a separate function")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

In the interest of silencing the checker
Acked-by: Jan Beulich <jbeulich@suse.com>
However, ...

> 4.18 blocker, or we'll need to issue an XSA/CVE.

... I dare to disagree (or to at least be uncertain) here, and I further
dare to question correctness of the checker (which suggests that it might
be helpful to point out in the description which version of the compiler
it was). Quoting part of a footnote of the respective part of the C99
spec, describing the unary * operator:

"Thus, &*E is equivalent to E (even if E is a null pointer), ..."

This imo leaves it at best ambiguous whether there's any actual UB here.

Furthermore, if you deem this XSA-worthy despite the generated code not
resulting in any real misbehavior, code patterns like
(found in free_heap_pages())

            struct page_info *predecessor = pg - mask;

            /* Merge with predecessor block? */
            if ( !mfn_valid(page_to_mfn(predecessor)) ||

or (found in get_page_from_l1e())

    struct page_info *page = mfn_to_page(_mfn(mfn));
    ...
    valid = mfn_valid(_mfn(mfn));

    if ( !valid ||

would be in the same class (access outside of array bounds), just that the
checker cannot spot those without producing false positives (simply because
it doesn't know frame_table[]'s bounds). We're fully aware of the existence
of such code, and we've decided to - if at all - only eliminate such cases
(slowly) as respective code is touched anyway.

Jan

PS: argo.c:find_ring_mfn() has

    *mfn = page_to_mfn(page);
    if ( !mfn_valid(*mfn) )
        ret = -EINVAL;

which, while not at risk of yielding any UB, is an entirely pointless
check (as the underlying assumption needs to be that the struct
page_info * must already be a valid pointer, or else _its_ obtaining was
possibly UB). Having such checks in the code is at best misleading.


