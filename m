Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 411E03BF396
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 03:31:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152813.282295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1IsZ-0008To-1Z; Thu, 08 Jul 2021 01:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152813.282295; Thu, 08 Jul 2021 01:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1IsY-0008Sb-Ua; Thu, 08 Jul 2021 01:31:02 +0000
Received: by outflank-mailman (input) for mailman id 152813;
 Thu, 08 Jul 2021 01:31:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFbg=MA=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1m1IsX-0008SV-EZ
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 01:31:01 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 387dbcf3-fb8e-4bdf-b6ed-103f15cf5579;
 Thu, 08 Jul 2021 01:31:00 +0000 (UTC)
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
X-Inumbo-ID: 387dbcf3-fb8e-4bdf-b6ed-103f15cf5579
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625707860;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PWb3UOCxEZjOQ0QNzRwuLU9Tt6S1u1y83ALAVn+4CVg=;
  b=dSctATJrbncQAcME9f+UYMiTrzgfwRg//DxzUA4X/jPI4nzJ2aidBa8d
   gIsVgCTrzspbjclg/T1MV9rHjtgHO4BExoX+JRsagWNbYiWjNXms4ftJb
   ys0hS22xTiR8RWZf0APQqaTU7dUxyVGmjQp+gdMg6givXWNF8GJkZXoyH
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: d5HWfhS3+FDUdLulU8wMjQ9G8h9LpopIiZ4ogCxJhnySlpCO1nOkkgAP6VmCyPuaCZDZ+ONrgL
 zmhlL8zYFkLYbJp0IWHrE5Rdp92O043nI0UCW7kLaiUptZxHksos/SWUAMsvKcOpHbS9T3Vl6T
 cW+RxXmE4P1TqOa6m+0TBIO3xsg41GEcLpk9AaniCK9YVVhh3kLb0swIoieAY+4l8DW5dgA2Hp
 mTIzgf+qw86yD7DZ7Ztwiz6J/kxtWaK3w4LL7sseKUU1p2e0wpwYv9WGjWffreqcxAv7wnvxzc
 u5I=
X-SBRS: 5.1
X-MesageID: 47855046
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:rTunlazK53HUsT9BjkopKrPxwOskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjlfZquz+8I3WB3B8bcYOCGghrUEGgG1+XfKlLbalXDH4JmpM
 Fdmu1FeafN5DtB/LbHCWuDYq8dKbC8mcjC74eurAYecegpUdAG0+4QMHfrLqQcfnglOXNWLu
 v42iMKnUvaRZxBBf7LeEXtEtKz6+HjpdbDW1orFhQn4A6BgXeB76P7KQGR2lM7XylUybkv3G
 DZm0ihj5/T/c2T+1v57Sv+/p5WkNzuxp9qA9GNsNEcLnHJhhyzbIpsdrWetHQeof2p6nwtjN
 7Qyi1QcPhb2jf0RCWYsBHt0w7v3HIF8Hn502KVhnPlvIjQWC86I9Apv/MbTjLpr24b+P1s2q
 NC2GyU87BNCwnboSj779/UEzl3i0uPp2Y4m+J7tQ0ebWInUs4VkWUjxjIQLH9ZdxiKr7zPUd
 MeTf003cwmM29zNBvizy9SKLXGZAVBIv+EKnJy8fB9nQImxUyQYiMjtboid0w7heYAoq9/lq
 z525RT5cRzp/AtHNVA7cc6MIGK4z/2MF/x2Fz7GyWvKEhAAQOUl6LK
X-IronPort-AV: E=Sophos;i="5.84,222,1620705600"; 
   d="scan'208";a="47855046"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=liTwTlWM3+6s6liiTq1lBxytjgdWupmxySGL9HZotL8X9BaLyJ7FcnVxALWJb6avyeStR+WwA3jKK3JIrKAbTu7619T/cMdNgU1QGIhFmBKghFZmwtI3wbfnL925PrVCB/KCNMYRYvrl3b1Yc7BH92Rn08uq4Msn2Vt19g814L8hXjGNgTO2jn9IYb3jb8Fm4Vsqrsejww4uFe7Hho2W7iRjSOX8c6frTsMIL6gW334q/D9krHz/8af5747M77CIHM/lOdsRubdiL6GdVap80+QEHro26prX8wbIxVRQg5IySR4CsLA9SBkZiSmE/HKF6oDviDyDxS5A/7+IjeBBOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awJ/myImDWdcz2ZkP3fKf7BwQDQfG4vKXrF1quNLI1A=;
 b=Ajy8Kb5pCgn/42v7+isiKt58UlZL8zIOfTRph1FEy6szRQA7ETRy5tvgFNmx4VeyOAYxwpjxx3EhvJPc5aH5HSaHPKFe8oBXM3KzW59KDDnnDtyL/s4SIll5wJgRvPPqIvDePaOZHaD4Z02wV0ApKojrSokvqAy4j2XO/3hPpktokr39D/IB04k6qu4ByhzOuqrgGiEtGB/Ye44ej5y/KfkLkNUtFao2Ef56LmSt0fgEP1X4H3H2gVRkf9+1PYnBaMyfwzDKRZF8EophSpnLWJjJnKlPXtHaS1X0bqQB9UUA9X6sXFQTiVEWFunNK+KDYt4hnLwtTQF20wS9F+9anA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awJ/myImDWdcz2ZkP3fKf7BwQDQfG4vKXrF1quNLI1A=;
 b=Y3Yr1d767YF7rxUIT2cdgiSv3rTJ/Pj1TkYW7XuNE36LYG9/DD/ofpVf/vJBjyEDCj5LEcmx0Q01S4kugJm7Mk3SITcjWa5JSFmjp/ZNvdZ4puUK85Q1L6M8h90t78BMz34IzMb4lizL8LCTZUSpWD30j+i/k5xytlPTo9aIXy8=
Subject: Re: [PATCH] tools/libxc: use uint32_t for pirq in
 xc_domain_irq_permission
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
CC: <iwj@xenproject.org>, <wl@xen.org>, <george.dunlap@citrix.com>,
	<julien@xen.org>, <sstabellini@kernel.org>, <jgross@suse.com>,
	<christian.lindig@citrix.com>, <dave@recoil.org>,
	<xen-devel@lists.xenproject.org>
References: <1625619764-23537-1-git-send-email-igor.druzhinin@citrix.com>
 <56e4d04a-dc79-ecc2-5ed0-0afef09077e7@suse.com>
 <8567bc8e-27a5-2f56-2765-e9b249764aff@citrix.com>
 <5dfb0321-ca52-5464-8bbb-c29d329d24cf@citrix.com>
 <ea392b06-6277-ced8-0cbc-40967fc1ca61@citrix.com>
 <9e44dee6-a7c0-e139-4eda-a483b2ba16b3@citrix.com>
 <66508b62-ec4e-9097-062f-023e7e20cb42@citrix.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <781b2b33-f2a7-3163-55dd-0947726f8f89@citrix.com>
Date: Thu, 8 Jul 2021 02:30:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <66508b62-ec4e-9097-062f-023e7e20cb42@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::24) To BN3PR03MB2401.namprd03.prod.outlook.com
 (2a01:111:e400:7bbc::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d52fbb99-00cf-43a4-4305-08d941b00881
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR03MB59778452DC75400879A63287E4199@BN9PR03MB5977.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Hpe/+NSuE6qqf5pH59JIQ+oXC+jS+CNohXaP2x2dQC+vqwaIP8jOGq8R9zs1Ig1ExtWeCyMz5bpwIJ3JyQHsszC7GR95r4NogZceVyLMdfOYIcJrp1RQoa7oF0EYW6K+sgL9vIZLcw21CXoYOrfxNZ+gvy9xuyXNoVB27oFd6UduDtFZFpw92jMJgM9IAQFRr0ovfEjHg81EiQwDV0Wc2jOEFdl+V19Xr4T/juwSLj9cFd5C/ansC6lNrmzz56PKJ75sEhXCR8ljOQgsPF2x5+BEMIigTlTeu/tzTVjGuN5HfZYrqxrnQWlQExq/j+M2Ko3If3PNdaRNZjUrGS8dwAFQX+x9nngDyRkmAWEd6jf6KBx7IgCYdTlKXh3IrEBCi6MGUERVaPJM7P1iaAT9SFjRUto1o5LyCs2HDzIHJELhTxojbiSDXa4rHxdW1e5MC6ZjHsjRSuu/9sR+NgxAQ0mB54x7xlasEs9KJjKE/oRhg14duo98Wj2j60/xt28nyg9nUm1uBMV0CjSX05mhhZG+TBQAhmD0JCWpAz1qM/NOWW9efs3MdTfXMSM4RzMdKLH0076hRten/npWOCUAl1O+8vRwDamWZlW5f0sjfs0esrElcz1p8yxOsY39Eq6YWA0Ko12NieXAOJGcCQjVz6d7qd72ol2nr1HL6vxOBFMx+h22+VBy1oUc4oLyfP3BDGevXd/tkSnbaZu6QrTF/KuWX5hphfCJy5anGnZAV8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR03MB2401.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(5660300002)(956004)(110136005)(2616005)(6666004)(83380400001)(4326008)(86362001)(66556008)(8676002)(6486002)(16576012)(316002)(478600001)(26005)(53546011)(2906002)(44832011)(31696002)(38100700002)(8936002)(66476007)(31686004)(36756003)(186003)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVB6bkdGTGRjZk1aTm83V2RzbGJTdjlPZlNJQnU4S1NYQWJnWEo4ZzFSa2t3?=
 =?utf-8?B?N0dHV1Y4cmJEdHBGckNOMm51bW83WDcxZWk4TUFCelhUUnRKcjhKOTMxUFZW?=
 =?utf-8?B?OUpmQjJDU2dsanNIQWxiOWJHNHA0UFNLbDV3ZE05bXF3dmU0N09sVnovRUNs?=
 =?utf-8?B?VktiOHkwV3lyL0R6WlFydXYyWjhzRFhyZmxaN2VSOUtDVDRCSWVMVE1ZV0Jq?=
 =?utf-8?B?OEJLWHN2MWNFQXZnTjNndC9MR2FRS1dJM2VDWWhITE9OWll2NGFTdnJoWHNR?=
 =?utf-8?B?dDViZVBxTktXUGtldmVWcm8rZmtXK1FNZTFFM1dFWnh3d2QrWEdMRGFoSUlX?=
 =?utf-8?B?QUNXOE1zQ0xxazBvZjdVV2NZNm83SkNkTWJ6Y2w0aWNNcG1ZYmpUWTQ4VENQ?=
 =?utf-8?B?WExkVmFEMlplaUx5ay9PTVFRbEVMRjkwbTdtbURPOTh0cWhJZFFZQTNvd29h?=
 =?utf-8?B?OUxlTC9rVjVsVnorOVVFMmVlTG1VR0ZuQW5sT0VoV09ldDFBOHJnSkx4K3BT?=
 =?utf-8?B?Vm5IWis0a3FEUjdPQTgvUW5TSS9FYXQyMG9NS21sc2RVUTFkMldEb1lZU2o0?=
 =?utf-8?B?a2lidit3dHRnb3JkYjhHTVBoNGxHeUFuRHRwanBZa1k4WDhXUmFkMmFtM04r?=
 =?utf-8?B?QWVBZDc0V2loS2JHRFZONjhIQWFGZVJZKzBzbFZwWGVzaEorVEFOWURvMXE0?=
 =?utf-8?B?YXJabG4xUTd2WmtKcnNUbUlSWG0xekIyQzJPTEVTcklMa0pQODdFMGM4UlFR?=
 =?utf-8?B?VVMzdTlISmVpeFc0UE5uMDB5RmcwcE84TGpjenZ5bjhkcXVwaTNMQ3pNR3kw?=
 =?utf-8?B?NzhjTm9CREZ5a2FXcVpMVG1RL1hZYnpTV0ZLem1SdTVKTDVSakcrSmZrSnBH?=
 =?utf-8?B?U25FZDUwaWdFbkNzc3h6TnJoYTAxMzBweEVNU083ZmFyYVNxNTFXR1p2QnV6?=
 =?utf-8?B?NlF6YTBuU3dGT1lIT3U2ajBWdnRGWTd1NDYrRTZkNzVXd3lDRDdiT3Q1UUpK?=
 =?utf-8?B?SVBuZnoxS2ZYWnB4TmJ0WnZpeCt6VHlXaEM2ODhKRTlKRmJhakY1STB1bHIw?=
 =?utf-8?B?WkxpZ21NQXprTjVsaEVoWjJ5U096ZUgxOWJTMndqdDMzQzJ5aC9LTG8raWk3?=
 =?utf-8?B?ZTIrNE50a3F3Ymx6WnFFZFhPc2hlOEVpTmdib3JKSG9RTVVRdExzWlg1aGNi?=
 =?utf-8?B?dElDYnlSRCtTVkZFU2tvTm9raU9rRm9jYzNNVEFTLzZoRngrWmttdTlxNEl6?=
 =?utf-8?B?WHRUUDRuNG9Ga0hNMDlEUFhOaldQVDRMdU1GOTR2U3hDa0ZDMmpNRjgwZGF4?=
 =?utf-8?B?TENWc2xFeWZlZWJJQ2M2bmRyajByYWVYVGR3Wlh3c2VWd0NwR0F1bHNjb1d2?=
 =?utf-8?B?c2pSOE4rdVp6dzZoRmVVS2pHZnFxTVlGb1RmOVNiNHhPVE1lYlo1V0dnaGtB?=
 =?utf-8?B?V1UzY1lkZ2Y2Ni9jZ05GZ2c3Q05NMm1PdVdTUkp0dWxJUlVjWUZOODY3b0RD?=
 =?utf-8?B?NXpLY1ZqTitEdnRpL1hjUzR6ZjVmZzhIaE0zblo5SFNJYjFIQ0pmTVR1emlW?=
 =?utf-8?B?aWJGdFNYdlk1RExxQ2RFYjFoeFozbHlIejdST3MxZWV6YzNxVlhmTnVSZnNU?=
 =?utf-8?B?VXZUU0RZL0piSTU3cTk1RWFqeHUxZUFnTml3cWRvYmpvSnE1WE5xRkJIQ2V5?=
 =?utf-8?B?T1IwcHdaSlZpZ29JQlRjcHFRT212OTZ2dExIQnFpTDNhejFHTzk2SmprVHdF?=
 =?utf-8?Q?kOMeLat7iVPfQS4Kswp22FYTSHh2YPj1J1oACE6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d52fbb99-00cf-43a4-4305-08d941b00881
X-MS-Exchange-CrossTenant-AuthSource: BN3PR03MB2401.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 01:30:56.5373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LtVsivCjRhI6WXOLek3doO7XU7mRf0Dg56ufcpzqfmg4Mvf5BdPDJ3S/ntSX9CY9/9ZmelsvlowRlCKqibI8FJgtiXe+ZJ/Lguwt9KhPCRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5977
X-OriginatorOrg: citrix.com

On 08/07/2021 02:26, Andrew Cooper wrote:
> On 08/07/2021 02:14, Igor Druzhinin wrote:
>> On 08/07/2021 02:11, Andrew Cooper wrote:
>>> On 08/07/2021 02:08, Igor Druzhinin wrote:
>>>> On 07/07/2021 10:19, Andrew Cooper wrote:
>>>>> On 07/07/2021 08:46, Jan Beulich wrote:
>>>>>>> --- a/tools/include/xenctrl.h
>>>>>>> +++ b/tools/include/xenctrl.h
>>>>>>> @@ -1385,7 +1385,7 @@ int xc_domain_ioport_permission(xc_interface
>>>>>>> *xch,
>>>>>>>       int xc_domain_irq_permission(xc_interface *xch,
>>>>>>>                                  uint32_t domid,
>>>>>>> -                             uint8_t pirq,
>>>>>>> +                             uint32_t pirq,
>>>>>>>                                  uint8_t allow_access);
>>>>>> Take the opportunity and also change "allow_access" to bool? Or is
>>>>>> use of bool prohibited in external interfaces?
>>>>>
>>>>> We've got bool's in the interface already.
>>>>
>>>> Where exactly? I couldn't find a single "bool".
>>>
>>> $ git grep -w bool -- :/tools/include/xen*.h
>>> ../tools/include/xenctrl.h:1844:                          uint32_t
>>> domid, bool restore,
>>> ../tools/include/xenctrl.h:1846:                          unsigned int
>>> nr_features, bool pae, bool itsc,
>>> ../tools/include/xenctrl.h:1847:                          bool
>>> nested_virt, const struct xc_xend_cpuid *xend);
>>> ../tools/include/xenctrl.h:1954:int
>>> xc_altp2m_get_domain_state(xc_interface *handle, uint32_t dom, bool
>>> *state);
>>> ../tools/include/xenctrl.h:1955:int
>>> xc_altp2m_set_domain_state(xc_interface *handle, uint32_t dom, bool
>>> state);
>>>
>>> and loads more.
>>
>> Are we ok to have different types in ABI interface and in libxc
>> function prototype then?
> 
> Yes.  Again, we've got plenty of examples like this.
> 
>> Because I was referring to ABI structures.
> 
> The hypercall structs can't contain bool.  bool has implementation
> defined width in C, just like enum, and there is no requirement for
> sizeof(bool) to be 1.
> 
> The pre-existing uint8_t here is correct, although the hypercall handler
> ideally wants a further adjustment to reject non-boolean values.  This
> hypercall clearly predates our more careful review practices...

Sure. Get what you want now. I'm just not a fan of type conversions
for the sake of it - prefer a common type to be used pervasively.
But, of course, happy to follow Xen practises.

Igor

