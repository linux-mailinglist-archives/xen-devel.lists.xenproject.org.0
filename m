Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B6A537988
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 13:02:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338506.563286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvdAC-0002gi-VF; Mon, 30 May 2022 11:02:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338506.563286; Mon, 30 May 2022 11:02:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvdAC-0002dc-SD; Mon, 30 May 2022 11:02:20 +0000
Received: by outflank-mailman (input) for mailman id 338506;
 Mon, 30 May 2022 11:02:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nvdAB-0002dW-JK
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 11:02:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8572cd5-e007-11ec-837f-e5687231ffcc;
 Mon, 30 May 2022 13:02:18 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-45-OYtXvzNeMfit8n1L1YCkgA-1; Mon, 30 May 2022 13:02:17 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6682.eurprd04.prod.outlook.com (2603:10a6:10:10c::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.18; Mon, 30 May
 2022 11:02:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 11:02:15 +0000
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
X-Inumbo-ID: f8572cd5-e007-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653908538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NH+F8tSCrSr3l0tFHnWetIpHjPscCt/xjHBzgzrq8vk=;
	b=BEELIbRLArpJEmDF0zf2vhtFYKzJ5SGvSs3pjlh5r2e0Qf6YdKLOQ8/TT5NY6HbN6EBn++
	22Nqe3Fs2Rk6uMjVlEsgqoDJxR9e4X5pxXctLmLdzyMzjWnF7wX5Hfhum7aF8CCEqpKb90
	xoimZPhCk4KYAZLHWv8yHgrL26cYGbE=
X-MC-Unique: OYtXvzNeMfit8n1L1YCkgA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMXBW0ED4NBWiKrFRDd9x9iEtuVVmpzzAwvJtSGwnY9g8E95/dLkg9RWwEwiWtwuLOB1GtfV8cg8+2r/R+t4OJyyZb+QKZbDDAPKj1Hd78vFy/zMBlSdrAbLyUpDd/fw/kSEfRaCAOfXOauYreVvzhpNzGTDBnxOokUgN2ncZz0YOUzDJ1AyeA2/4WETlBkvtrw7EQ+ynP8rg8qe2r4pArk3iR2LumVbLHaa5IoVp14xDnNXG/F3eVeEaLM32/r+14ri70shb+7IAvbG/fo2eONLjLgnXepMPg7OIQCxUg2EsvItYn0r94khaRlcIFkYE3Yoy6T/G3wik0Wni6XARw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NH+F8tSCrSr3l0tFHnWetIpHjPscCt/xjHBzgzrq8vk=;
 b=SRt+T7pJ3965PVTZhU9tV3BafgTVtJszWi/ziit3OgKesYGbp71Be4pcsiGFU6AKQ5MlQ0pWmw66KKlLCRCAo87aL2kVvnxvbFRHpg7nmvHSVyQpCpJG7Dj92GCznKWmMwh7Yn7aIddzB5L0cHy3y+mKNNphVT/oy5SzJLJ2+D0swBszkyVeDIrTwUhOJHzhTu9ncwWvcJTSkLF8bTTQa53Pd9SW7qqg9axyiaGNy+GCMOBRqoSlCfuSUVF7V7AaRcedQH3xeTjRzXnpRRXRhIZNJaD1VikuCOH2MS7wWkI5oFJcIkoBfuUujPoUP2YGnqVjljGz2qmVUr1Vko6UBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <23ab8323-298a-3649-c484-918c9de148c9@suse.com>
Date: Mon, 30 May 2022 13:02:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [linux-linus test] 170771: regressions - FAIL
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: osstest service owner <osstest-admin@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <osstest-170771-mainreport@xen.org>
 <8fb558c5-bc9c-af86-d425-974b8c45768f@suse.com>
In-Reply-To: <8fb558c5-bc9c-af86-d425-974b8c45768f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0015.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d0416da-4448-4a69-0617-08da422bdb2e
X-MS-TrafficTypeDiagnostic: DB8PR04MB6682:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB66824CE4221FE824546E30B8B3DD9@DB8PR04MB6682.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ys2mT4iLmmrCI4LowbCyHZA8mhHhgbjYTc6BOqtKgHqpSwb7vRB9rdhjNdNZbRQ0OhSMub9laANZZyyZL0ea+4ldnO8rlR+WIzMLE00cZnIgbFc5y1L3vXPRy3VF+/TgXpIG+O0mhPrkeZLdWfqF32gUnt2CSK+eKfwK/jnIBHt7eiXbYsRGeZnz7UPTt9Lr9kKAatE1AkV7SWPjc1hX6E5VrUSVAu2jug3dz0oAABq94zTR/1w1VljkWf/TaIIW/dx6MKIDpsvW/BpM5aYW16gHkI1udQQKJJBMdyqYLdSwaWkVdzajsMVYTkEbjJYreT9G9RnV/q+MXPfSXBzCcqTm42Fc6yng5Bc+5tWiD06fkUtffgtZFolu1u8KcpwYM1qTKwMKrAF/G1vjvlf+Px6Q0d4LX+ehujmTrVsfUBWJfoYxfpqGj9bgAmil6orsSwM0m4iibc9OKSje8QQlsPJ0FvcmYKVzqq1ZdcQqB+I9LhVT0QkVSaNB3PWKehEzCVRE9XF2T6B9SwVKoILPRhjw2CfK116iig5tUidf+GdijLOj4pFGWalA5vDRMh7QEl2VdR5kd1vFp6G59PP2esHFI9k7FVhgrSMQYb703Xniv6H+kgqlu962hQgSaXGYrdSAkdtT9Scly/Dkihof3QO2Mn9a4auxX6/+IcWaL4CruELAqUXp1orhOA9CtQBTYp7h9JF/PhwLw2evFR3F6Y31XfAUoscMjbGf1aZ4qwT5Ksyh22SacoLCROZdlly6MTPTH8zlwHBf7aicCmLe5Sms9n3TLsNT6kkoqArzuxdh2inQ2l2dhSWvTkAMka7FPj50HdYOQRPfGz/JIEN3cA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(83380400001)(66556008)(66476007)(38100700002)(186003)(107886003)(316002)(8676002)(4326008)(66946007)(6916009)(36756003)(31686004)(2906002)(86362001)(31696002)(508600001)(6512007)(6506007)(53546011)(26005)(6486002)(966005)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bllXRmQySUpvVlUwaTIrVGJodVliTmdjd3N2azM2VWMyR25keTNCNXpFcnRl?=
 =?utf-8?B?MTd2K01uM2YrS2I4TXRqQldKakNVM2NpMDhVcGw5ZFhPVi9nZS9JZGc5RnRw?=
 =?utf-8?B?T0paYW8zRFpWUFpNbDF2TkptNnE3VUNUL0VuK3c4aFVaN2Y5UnRRbHV4QXJU?=
 =?utf-8?B?TExhbnEzSjVtZTJxdml6U1VMZ3VTNzZyWlo2Zy9ubFRMWTVqQ3BhL2dqVFV3?=
 =?utf-8?B?UWV6RXR4QWxtY3RZdUJrUkRFTXg4U3Z2QzZxc3Z5b3NoYXFnVTFXdS81TnFN?=
 =?utf-8?B?a1RoMHlvNDBwRnJBNWppeWFJVjVpcE9oUFBVdFFLR1k2T2FlWmM3RTBMMWp0?=
 =?utf-8?B?T1RtdmNRUHRNWEhqdFNwSDZNTmVHdkZKdzlhVEFKc2duT2xya2t0djFGV0VO?=
 =?utf-8?B?blNQMjV4QWJ4Z0RDQ0dRQnluN3VBMGZjYTJoK1BFV0FWRlptZFFHc3E0MzhZ?=
 =?utf-8?B?eGE5R0xHQTBpTi9WUlJpdTJWUkkxZy9rYmJRWDduRHNVeXZ0aXpsaE1tbnA0?=
 =?utf-8?B?T0NtaERuMzJ1bWdJNzRQMmYxc0hMY2ZGaWkxaHpqY3dWb0s0dysrNm10T0hN?=
 =?utf-8?B?eWV2b1M0dkhNYXJIOGFmQ29tYm54RHhvZFB2UExnZ2podlJ2QWpLSnFzTXQ0?=
 =?utf-8?B?WVZZL3ptZ095VGdxV1B2V2ZYdmNabjdLS0xEWUdHRmRSaEtBUjZRVXQ5Z2Jm?=
 =?utf-8?B?amV6dTFwSVpRSlRQRnBuZGl1YU5iSndLdVpqdTB4WHRMcm1ocnc4R3paTTk0?=
 =?utf-8?B?clEzYllTZUtabXF2SFA1QVZXeWhXZk5FSU5xVUhkVWN5bWcxcnVvc2VJMHNJ?=
 =?utf-8?B?YnY5c2orQkhhOXNNZGtpcHJJTzJEVmtvSGNiZEI1MVRFVjJWV1VwQ0FnZzl2?=
 =?utf-8?B?OERMMFVkUlo0VkowekR1VFNnRDNyZGozOWhEV1Iyd1JzRkduSHc1U09GWURu?=
 =?utf-8?B?VzF3bFJJb2ZobFZUcUYwbFFBQkFodUN0bEtObm16bVFDaWF4eFdnNjJyZHUz?=
 =?utf-8?B?RU8rKzlESUJ3c050blN2MHljYTgxWEdUTStvNzg0ZzhadkpmOU11WTZXaTF1?=
 =?utf-8?B?bUtoSTkwRExNNFFMZGJMWi9UWFlBdld3N1hwbENtcFJPTGJKeTlYaFkrVFl5?=
 =?utf-8?B?ZURadUUrS0d0WWV0WEZNZEZUeVY4OUErTXVqTDk4U25BblYyalJqV2RobG9S?=
 =?utf-8?B?Z1ZmMm5lQU9kMzNPUWhsTjgvdGFDbDBWZ1NQeDRtVmkzRTJHR1B1VkdGNmNC?=
 =?utf-8?B?UzdrRkUwSlFZZ3FqNW9zYk9VU0Zoa21qd3hKSHBVYlNqM3AwdFA1bWxqZ2lY?=
 =?utf-8?B?SDIvUW1haUJuQlhaN25Yd1ZoZW5Bd1RZcVZhTkxDdGlCeTJ4RHpad21QVlY0?=
 =?utf-8?B?ODhoNlNwZVJBRkVaRjY2anZaUGNhTVVHc3J1dlRSK0Y3YkIxelI0VXd3MXBM?=
 =?utf-8?B?Mks1RTVrWUVJZzkvYlRiRjZ3dVVSTXhGMU1Od1gybWR3andtNkNZL0JTS1NG?=
 =?utf-8?B?YjdOb2NBemp0bnJpSDd1VFdlMEpxUWg1aHdvc3lCTEV1UEJlMlQ0c0tQRFdB?=
 =?utf-8?B?MUNhYWUwVnhnck1QczN3aDF6eHNVckY0QWdwb0JHNktQSTNSempxWkE2Mk1x?=
 =?utf-8?B?TkdxRnh0ZTZiTXhYdUtjQlRObjg4amVubjdsazUwR3NOanpyNVBKeldVcTFV?=
 =?utf-8?B?ZWpWUXFqa29TTForWFhJaXBMekdxa3dLQXdRWWIvTTZ1SVpaOXJxM2puY1JN?=
 =?utf-8?B?NGUzOFd5d2IvUHNmZitlYVdvS2JtZis5cU5QN21ESnJ0V3JGTEE5bUdVNG1H?=
 =?utf-8?B?TnNabzBjam55enAzYmhvUHhLbzdXODBOTUIxc0o3d0I1aHFkMmk4V1N3eElO?=
 =?utf-8?B?dmc3ZC9adEZtNndDK2NXZHB2aHc1VXNZVVNZampNQVp5RE9MemRGQ2xKNkNE?=
 =?utf-8?B?NlhMUlQzMExuS1VMdC9OUnowaDdhcjEyMkhDa1pOWUZaUjlKVW1tNzlxcDRk?=
 =?utf-8?B?UFFMNm9kZmMwVjhlN0pHWkx5aGNvdjJLV2tUSXZFQ1BjL1ZEbnNpbElwQmdu?=
 =?utf-8?B?L0s0VEgvNDlEeUpBbTZSbUYxN1M2NVZHTUF6NEgwWHVRcWZpZ0k1ZUw2THhk?=
 =?utf-8?B?UURhdlhXTlFZZWlZb0tqcEJJWk81OFFjai9aZTV4dnFIZm52QktCSVFqWmpp?=
 =?utf-8?B?MlU1Qy9jelYvc3ZjcUlPUmRUaDVyeWJKS080d2dmMWUycXhmMS9iZnFUV2x5?=
 =?utf-8?B?Z2QrNkZHTTI1WFR4TnpvcFlVWGZWTHhmMzN2QW4zWWU2bEt4dlpwQWdQTHZT?=
 =?utf-8?B?WFBwS2RyUmhPc0VsQmJUa3k4a2wvV0FSMkhUSFluK1Y5bGJJK0xkdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d0416da-4448-4a69-0617-08da422bdb2e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 11:02:15.5693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vyiaxog/F/CCBcJ6cjLLJp+Nz3AHCW0dcvnhTz+l1VDCI6iE8OQrHDljY4xqjoqh4ASVgB0sl8SX6skXuGv9Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6682

On 30.05.2022 12:49, Jan Beulich wrote:
> On 30.05.2022 11:03, osstest service owner wrote:
>> flight 170771 linux-linus real [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/170771/
>>
>> Regressions :-(
>>
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>>  test-amd64-amd64-dom0pvh-xl-amd 14 guest-start           fail REGR. vs. 170714
>>  test-amd64-amd64-dom0pvh-xl-intel 14 guest-start         fail REGR. vs. 170714
>>  test-amd64-amd64-libvirt-qcow2  8 xen-boot               fail REGR. vs. 170714
>>  test-amd64-amd64-libvirt      8 xen-boot                 fail REGR. vs. 170714
>>  test-amd64-amd64-libvirt-raw  8 xen-boot                 fail REGR. vs. 170714
>>  test-arm64-arm64-xl-seattle   8 xen-boot                 fail REGR. vs. 170714
>>  test-amd64-amd64-xl-pvhv2-intel 14 guest-start           fail REGR. vs. 170714
>>  test-amd64-amd64-xl          14 guest-start              fail REGR. vs. 170714
> 
> This
> 
> vif vif-1-0 vif1.0: Asked for 0 slots but exceeds this limit
> vif vif-1-0 vif1.0: fatal error; disabling device
> 
> to me looks like a regression in netfront, considering that there
> don't look to be any relevant netback changes. I have to admit
> though that all three recent netfront commits don't have an
> obvious connection to the slot count going wrong. Or wait - isn't
> this a result of 6fac592cca60 ("xen: update ring.h") touching
> only netfront, when netback also has a use of
> RING_HAS_UNCONSUMED_REQUESTS() (in xenvif_tx_build_gops()) which
> wants an actual count, not just a boolean?

One more general thing noticed in this context: It isn't very helpful
to have both host and guest use the new kernel when wanting to
isolate regressions like this one. It would imo be better two have
three (host,guest) sets: (old,new), (new,old), and (new,new). I have
no idea at all though how feasible it would be to arrange for such.

Jan


