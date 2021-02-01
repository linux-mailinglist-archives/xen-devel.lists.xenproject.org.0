Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 833C030A939
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 15:01:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79898.145679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Zl9-0004Pe-2w; Mon, 01 Feb 2021 14:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79898.145679; Mon, 01 Feb 2021 14:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Zl8-0004PF-Vd; Mon, 01 Feb 2021 14:00:54 +0000
Received: by outflank-mailman (input) for mailman id 79898;
 Mon, 01 Feb 2021 14:00:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWGu=HD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l6Zl6-0004PA-VR
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 14:00:53 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9f785dc-8710-4321-a0bc-7cfe6d4b1454;
 Mon, 01 Feb 2021 14:00:51 +0000 (UTC)
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
X-Inumbo-ID: e9f785dc-8710-4321-a0bc-7cfe6d4b1454
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612188051;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=V3gCxFCSdMi8jsyeVIxWaTf0d6D86exZfF+VqOYQOx8=;
  b=dXRkk55VC5HPkptt66aA//+YDBjkGYWI7BxgLrfxUA58dsC4t3F8RoWK
   LX51KNZhHuPG7VL9EB9yy4t5H409T3FCTEmKA7eerlZEl/ErdduifKBWu
   +hDXMcZBgB+oAJ7pi2fqDtWXk3YirPQ/2mk0+4iIx23LZ5umMDOb2oARD
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: hhp0urncDouQE7ZHFIARHbz6CmalhAagCc/oZNVbKMRK7ZCp0gdiV9P3KN/khCCfrgT959NbWw
 u/H/cDSzvVu17hJGTdsUjTCzCB1DyX3x/wgTC0jQDAXqyNRYDOFGxcdJZHTKGVW9iyh+LnRM6o
 R9WENkpvoowqAFI3QWvOekcMumqBMjo4P89eoOLBCvA41z8hX59xP/o0cDEJRkHwfMK/GyJm/P
 c5u53uIehJsGUQR2A0xOgZBUFZwE96ZIRk/QyY6n9eM1PqVBIpRgz887ttjALMx+04672T4Sl3
 wOk=
X-SBRS: 5.2
X-MesageID: 36475573
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,392,1602561600"; 
   d="scan'208";a="36475573"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6rL1ls46V5anZ1JuaE/G1Oaj6eb8IWdgEjmJGB7GCMl5QnZC2A6ZFyknZMppKPZm/gdlSFD6nWNvlDB80uFJRIamHT60aTmpwgxDFBm+8wiR8yMew7vbgisxykLpQK8T6NfwwdlDKcCuPknLil/1v5UNpnubEX4AcjT55WfLmlSCphAV4RzoGGvg8GtJkiclHMaaLbs9UPRf2hU3xzV2HRTit2mJ46IN3k2zDhFo2W6KeiAvbXXKDOFo3dTTbMPq3gkBx13XPMj7d7rvuvXK3VCudiBKEE56N59pgcvnyfBQJunW2uD03pW/hcaAPASHx/+BC6AFdtRwRCHEb48CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3gCxFCSdMi8jsyeVIxWaTf0d6D86exZfF+VqOYQOx8=;
 b=n3nVZSnsF5ERX2je8MQA11JGYr1cPagEx1SBw0e+PWD5Bb+/bRo+e11do3YXPQJunui2mEuAfCblMTOjlao8ZhoSjFiNRDyYIcD6OJpL5OM3asaYmyotSejEAk0WbB8SJcxbILJHoluxQc8q+F+Qmt0DCUvdteemfCrsgVfM8wiTV/QsvjbQyIPUlKi1dOoWEePStLEk4x+1eO6m3yAeeqIU+P3Fnsj6S/UtcK1ka+Tc+l1xJYDcPywSSFHOS5pC1uvUj+WUPr8HU5MDHF3snPiaEpzG9bxWkX5TjzsCLKcqL3X97Dioy19cqYJxTYByT+0X+9ZuoaBdgQN+a9nPsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3gCxFCSdMi8jsyeVIxWaTf0d6D86exZfF+VqOYQOx8=;
 b=GIjiC+LEGkynneq4ivyIiudz6LvmZZUjdIhzGvb/yjzbPaeQ+1a30+WH5xkBfqUEb/+1WuEiJAI8LMZiJi4TmretAItTlhJ+jKtYD7gXRECxCxW5jRCHpOukB2/vALeeTlGuO0NUfdx2XAe31UXD0+yqRXqfZQKxVbl4smAgB+o=
Subject: Re: [PATCH v8 00/16] acquire_resource size and external IPT
 monitoring
To: Oleksandr <olekstysh@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin
 Tian <kevin.tian@intel.com>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
	<michal.leszczynski@cert.pl>, Tamas K Lengyel <tamas@tklengyel.com>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
 <911270bf-0077-b70e-c224-712dfa535afa@gmail.com>
 <fceef592-e637-e985-8217-11546e088027@citrix.com>
 <d5cc17a4-267c-3022-11e5-eb043de121a9@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7384c55e-f996-be08-f8ee-b6d09c9e2eef@citrix.com>
Date: Mon, 1 Feb 2021 14:00:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <d5cc17a4-267c-3022-11e5-eb043de121a9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0380.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::7) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 345d8f60-ca38-473d-040a-08d8c6b9c5c2
X-MS-TrafficTypeDiagnostic: BYAPR03MB4584:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4584BEDBA374A160A605DE6EBAB69@BYAPR03MB4584.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HzWPgRyFWHVIXLsiiCulX18aqdr2T59fPc955U6IWCqHntrbRZ7q8mN0Dopzn9NLY4ZWzjdgTdhK33UoZBooBrpz2EeMCJ9xc692ux5yYJM7LFdxdsxEtOjorNgQDoH1SMWHNwxY+claAuEheXGc/4cw96PbMG1mAt1L7D7Jwjjum4oHEyBI6HUiU93FmcbWU63XFAhscQzOUwZDfQEGKjplHF0nGsIUce2KIPtBYxmWo3MLmc6t2XoFHX6FrVF9rlvdfnNb3t7C357LlNVo+gedb4R5tg99IRvxazWVERjTohxThQqZY8KWMC4EjkdfrnL4NWebrBhutTNsTZB049I9NSpzqvVZmOKwyMTaFEn7bbo4xJFV577QWWT6HJgbRS1a3OMsH6NoWFMDyouFGesLiMFwkXzUiqK1hdoggiv+NLdL+Mf/wZKNvbHmDQbA6G2Bcw1+9p5/NYEhBhWycX/MNE4O+1KJ5dxDX1mSbBVOD0V4X+hjWRNocEZk3+/1Aj2zH7kqRbvmF5Iu7z4VZYzmOZ7KF0uOqz6kcmF3LYMpDFlEsg2oGiPaV3iwg+klGhLcLXU4NMQNl4wTS6002vFpncXXkMzptf34Z9k4Kz8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(53546011)(31686004)(186003)(6916009)(2906002)(4744005)(4326008)(86362001)(31696002)(478600001)(5660300002)(26005)(2616005)(956004)(66556008)(8676002)(66476007)(66946007)(16526019)(36756003)(316002)(6666004)(54906003)(8936002)(16576012)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q1UvTEdrb2dZMmV5L3FHNm1oWnlLaG1lYU1zQjI1dUZ4QkFxZXBkRkxDQWpu?=
 =?utf-8?B?QThMWEx0SFdtakdwTUw2R2VWRzJ6b1pGUXB5Zmo0R0dBRkF3ZmdmYytLZmIv?=
 =?utf-8?B?YzY4NUNZYmtDQzVxRkp5Wk9yaFkxdHhESXhUZ2xQMjEvbmJZdUc0aHRoNjU0?=
 =?utf-8?B?eG5ucHJCc0g3L3Q4dW9yRFRlVllCRGs4aTBXZ1pVa09MQ2FnamdROU04eWxP?=
 =?utf-8?B?UEhYMTFmK2d2eXZ5NzJDMlZEZzNoaTVlVXdZV2hjYmdyWHhmc0pDZ3Rwb2Vv?=
 =?utf-8?B?N1ZKS0NGeVBvdkxwUUR1UUNNV2pPdFpNMVU0Q0orazRxWEptanZVTnBBSEFO?=
 =?utf-8?B?TXdzd1VpRmRuVkdFRzk1c2tHSUFpOU92R2lhMlExdmhRT2VpUkNBMURjaC9i?=
 =?utf-8?B?STlObFpLRmVmUmtzWnNrbkt2NXVnL3plbjFveTZuS2FYQkNLeXpyZ0kyUnpC?=
 =?utf-8?B?VUl6TVRYMENTZlVjV2p2amtWc2ZOWXBoZ3dCb0ZvMHlSZ1lNbFYyUWJzeU8v?=
 =?utf-8?B?UWFNbU1MMXh1bUJmeXBid1lwQjlFWmdLaVdYUUpML0ZycjFTWnZCYkZ4RDVH?=
 =?utf-8?B?Q0plaGFiU3llV3FFK2RIbTRQSDJwNlhySjB4cDRJZ0JBY3Z4SjRYbmVISXg2?=
 =?utf-8?B?ODlkRmNKWGxxbURBMjMybTR2dVI2TjM4ODcvbXRqcUdDZ3l4b1VJWjNDam01?=
 =?utf-8?B?ZDBaeEFiRnhVTkhCc1Fja3I5bFFYOFYwclAvRzc0Q2NVclphMHVnaFh2Szhr?=
 =?utf-8?B?SURRQ1hXM3lZNTFsTDEwaEc3TlJvbEZzVWx6Tm5WaGNMZWV5WlFaNjQ1VVdH?=
 =?utf-8?B?b1czQkFndEpBZExHdWlseHRCQUJtcjNrRm5WOVpFbUtndTBrWjJYeEVFeWpD?=
 =?utf-8?B?N2xDL0gxU2hYZjQxZ3BpSUFCcVo3WUpaaEZrL0dWWWZZOGFJL1VITGV3WlhL?=
 =?utf-8?B?clREMWU0K2xQaHBNenM5cTVIMnkxQmV6MUw1YitsMFBXQ2E2azZMWGFYbUFl?=
 =?utf-8?B?ZTFLaEZ3eFQxNEZJa0ViZ2JDeG4xRjN4Slowb3ZaVit2MDlONExIT0ErTjRi?=
 =?utf-8?B?VS9HZ1JVRWdkQVJBUFBoM3RGZzYxK3lXeEJ3aTZLSkpzZ051aERSTFozNW1Q?=
 =?utf-8?B?WitkNlR5bTdGU2FxZlZwMDR3TnkrM3ZmdkIxVGhVT1BkYUdBNDg4L09zQUFF?=
 =?utf-8?B?N3hHZ1ZxRkEvWnN2eFBKeUNQb1hCNDM3U2VIUUtUMW14d0ttOXhOcG9CUVJM?=
 =?utf-8?B?d1c4Z3FKMDdNL3VROGdNMEwyNnhpZ3lwT1lzK2xwS1BjVjJWTHFFc29lLzFU?=
 =?utf-8?B?NlpJaUZkNnkzb3VWZXV6RTdQRDRITHQ4Y1ZuNkNhbXAxbnNoNFNpcFI4YzN4?=
 =?utf-8?B?aTV1enpGSTdpcDNTeDh0MGViQXFNZkN5UzhVOXZCMHVYRUIvbm1zeHg5NGdz?=
 =?utf-8?B?bVRRck1Id1M2U2x5enRhSGYvZ2plQUZpekRna3h3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 345d8f60-ca38-473d-040a-08d8c6b9c5c2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 14:00:46.3840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQ1TckDc6SkcABilpaYzS4nnZlD2EGPR+B2gNSaix2DKzXdIYORrKM8wWY32e2x1ZekF4/Ti9gzAJ+/fSO/M1kUX7mhjOOYF6acWgHJgFb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4584
X-OriginatorOrg: citrix.com

On 01/02/2021 13:47, Oleksandr wrote:
>
> On 01.02.21 15:07, Andrew Cooper wrote:
>
> Hi Andrew
>
>> On 01/02/2021 12:34, Oleksandr wrote:
>>> On 30.01.21 04:58, Andrew Cooper wrote:
>>
>> One query I did leave on IRC, and hasn't had an answer.
>>
>> What is the maximum number of vcpus in an ARM guest?
>
> public/arch-arm.h says that current supported guest VCPUs max number
> is 128.
>
>
>> You moved an
>> x86-ism "max 128 vcpus" into common code.
>
> Ooh, I am not sure I understand where exactly. Could you please
> clarify in which patch?

ioreq_server_get_frame() hardcodes "there is exactly one non-bufioreq
frame", which in practice means there is 128 vcpu's work of struct
ioreqs contained within the mapping.

I've coded ioreq_server_max_frames() to perform the calculation
correctly, but ioreq_server_get_frame() will need fixing by whomever
supports more than 128 vcpus with ioreq servers first.

~Andrew

