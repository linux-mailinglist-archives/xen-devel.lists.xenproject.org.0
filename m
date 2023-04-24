Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5E36ED22E
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 18:10:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525545.816821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqylb-00076J-Dy; Mon, 24 Apr 2023 16:10:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525545.816821; Mon, 24 Apr 2023 16:10:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqylb-00074b-9W; Mon, 24 Apr 2023 16:10:15 +0000
Received: by outflank-mailman (input) for mailman id 525545;
 Mon, 24 Apr 2023 16:10:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pqylZ-00072v-RE
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 16:10:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c408d3b-e2ba-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 18:10:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7882.eurprd04.prod.outlook.com (2603:10a6:10:1e7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 16:10:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 16:10:06 +0000
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
X-Inumbo-ID: 7c408d3b-e2ba-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANjVEypR2dehnasN6FSLN8uhZbMwUoC0Rnh4nMb1DTe4tsWs3p45HICPa/2ZCBR1WJi8ctcxUBTj75SFYN8WQcqLJ2imkrCFH5EWstzDP6RdvT8t5Vw3/aD97Tw2PXeZH/p+ff+nN6HdU2Qslxg4vXQ8+4aCFKW2txpShgyed+FyAXgGyq4l4hDHyMV9uzuiVvPGhlPRZe9eww0qPfb/qS6JLgTYxs8slSXSJ4+x8eAQLTeD8we7K2G6RRCXMuZgTY+/fJeZHPRP3mimVGaavBKdNGPo0iIHNrQ9ZtmXOlpmEQWzDgFh9QB8AvFC7y09YL+XnTcnsbY0YuFvicVVKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKf1rklL4kim2o6be/N/6Qkhxt83x3us1rIf78YHmi8=;
 b=c+P8S/K6HVOtk+I9PVjHyHNYeXU3n8KxAJ4NX7rolIQqO+Diuih00lKptO7H0f2fqzMX0FODuij9kF8l18Z0Vyuh3A4v3jNtOV7GAhGai9nrm65baVQ5RtSmLZX1jFULmxg5sGjImQFSaD2Esd6aZ5kHU1zWh+Il7rZpoT1C6H2ojA0x0Au0yVoDHW1DXYolldRJqijZFXfwGDJnb3Fmw/ws5G5X7Z0zemxR+59+ItWJm1JEsfjIAC0vpzYMUyNUSAkETdhGnx9KzDaW1mYfgBmDovJeu46/Aolsro/X3gO1J0n+ouqjzAL5tLrIlPF7K6bCzeq9AvuUYM0hh+f8/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKf1rklL4kim2o6be/N/6Qkhxt83x3us1rIf78YHmi8=;
 b=DH1pwA66/ONbVaIDC88JfF8qZgxx3TSKkKTxfBZ+rZwKLIxhGzERmu1n7lWj4IqdHilGyI8jU8X7A6TlxwgJ9wMBkT0R+yN3ZtH6eLTYbWoE8Kf1gXFSi9vWK/sLftUT8TbCT1e/6CSiF6DsNsP5AKOP2FJt4a85fbu6LeziE9zjrnO1Ax5QLuO8VEc6QSYY4dSw4n5pXM/2aeZ2+r5UsDvMeU0ifMmf+gmhOA+E5P/OZOUrfQzEzVX1K1AeSEx3Dx+2nw5e0Kjrkn5HW/EG1/gJSb9D4XpLBZhjcdWM/1WWT/kF3rH9ZGBW5Lz8o1tFWEpt+tultjzqaKwESKVMpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f9e631e1-02bb-a565-4df4-ccbb66fbaf49@suse.com>
Date: Mon, 24 Apr 2023 18:10:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 07/12] xen: enable Dom0 to use SVE feature
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-8-luca.fancellu@arm.com>
 <589fdeec-a0cf-1dc0-18b2-bd20c76832d2@suse.com>
 <7064B21E-414F-4FB5-BCC9-349388B32EA5@arm.com>
 <11e92082-6603-7180-f405-b96a14d430dd@suse.com>
 <37C35493-D5DA-4102-9B93-0045732E6F94@arm.com>
 <d49f1df6-ac49-27ef-d55f-b6284c76b055@suse.com>
 <5535FDB0-989E-4536-AF7B-8F0BB561667A@arm.com>
 <bd064b44-3531-a1b0-a7a8-1ad7ae434394@suse.com>
 <300BE89F-CA37-4A28-9CC5-5875E10D4A0C@arm.com>
 <a268313d-03be-9281-3627-c38115d3e5de@suse.com>
 <B534E482-71BF-4C5F-B9A8-3D567367F7AA@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <B534E482-71BF-4C5F-B9A8-3D567367F7AA@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7882:EE_
X-MS-Office365-Filtering-Correlation-Id: 479e3b65-8108-4e9a-ce1f-08db44de5e9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M7HgBkT2mCxdT4C+cot1gq8z+BOB2n3cBB9QgtzytqOnbeA1ZP/iPrXWHNMGq3a30oODF/NuClLACDphMQapx1p3BJMnds7rovJeGeR94SRlJbQW7LDZ9wHmOdSWjTZYHR1VGwwStXk57tbmKw7puH1n+J3sN2EJgFpzxog0jHgqw56taJh7MZqqgbaxOodHMm2fq1C0PY+EtPAP17bEhm2MmeLsGtA87uPG9EMO3PJxHbdfUzvJl4M9m1B6dUet7mdksne7xJXebc5OfTiVMrQ9Uskhizcu/bM/wAYPxT9BXzHzimyEbkdkfSUvx7zIis34y42XQxPQhos/otMortd929eWsJl12NDAxHI8p5zvK09hawvv3px9IRv50aIs0Xz94iIhSSWPKkG4RWoRs1ENu6uo0LH2dGzEuz7Us9VbmBqHA67EhbtBwNNuvUqITNsLeZHtGvUk+16khymGninT57cN0FtNMFw92kLx3wy1lypr0i1eOnergaS/8PMoDOjQYdurVuqmLnTljgk2Zu6e66X+vVX/V3pF4ZyyQCFg5kT7nwozDzqPOzsU4PYPqjXwJ86GTmaldfdaupgbDCvXaU27uz8yOAhHD+QYtR303Ih5Mx23ZspcYZwa3zMCtDuhHCxt/0+hSoQb/dRe/Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199021)(2906002)(66476007)(66556008)(66946007)(6916009)(316002)(4326008)(7416002)(8676002)(8936002)(5660300002)(41300700001)(36756003)(31696002)(86362001)(6512007)(26005)(186003)(53546011)(38100700002)(478600001)(6486002)(6666004)(31686004)(2616005)(6506007)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUMzS1MreWRkOVA2cW1FbHdTVG1NREUyMmgvT3lyQmNHNUVwYTdicXJnM0ZL?=
 =?utf-8?B?VjIyeVRYT3hiUXpNL0hXd21YcWZIM2tKNUVvYkc5NHVmVFBqQmpxTFpZdjVQ?=
 =?utf-8?B?SVdoNFY4SStkNWZRZ053TFdsWHQrVnozdjJNaXF6V1RrejVOL01ua3EyUDQ3?=
 =?utf-8?B?RlRmdUxwZVhpSnFWdk1ONnEzV1E4QzNzdnN4SU5yWHhuRG5BVERQUmVYRDFq?=
 =?utf-8?B?TWxCN2FYT0FRMW5oRUtQTUsxdmdadFNEZkJmVjhYZU9hN25iT2JreDVERnlX?=
 =?utf-8?B?ZHBCQ2J4TGF5aW1TMDJCREpKdUtZbTByUVRDTnFRdmo3QTRjb205REZCczA0?=
 =?utf-8?B?VDBaemZ0OUFXWXhveW9EdnVEY2ZJTTNIcjRUclJHalI5QmFSeWJCaGhhdkl2?=
 =?utf-8?B?VUxuSFF0WU5BU2xEWFFYME9tZ1JpWmVTWFk4OGdFMFJwaGhlN0xqZ08xUnU0?=
 =?utf-8?B?RUlobHJuWkJtd1VCTU04ZWJGSm11K1FpeWlDNzFvdGpUeFV3WXNPdXNUT0pG?=
 =?utf-8?B?MEZIRTBMY2Q4RisyN1A3amFkaExJSVJjVEdrUC9HblFnakl1TTlxNGJ0NmZ4?=
 =?utf-8?B?ajI5MFpYYjQ5SFFibStUUGJEU2c1WEptOE5pUlFpWG5MNjhEMmIxUHFKMHZJ?=
 =?utf-8?B?VTJObWVISWNCWWZvZEdCL25JcklKd0lvaUkvMjNvSEdqV1VRRUpZNm95Vktm?=
 =?utf-8?B?NXBlemJHSXJ6MjNSUzZtb29Yd2c4ZXBMQm5pRnRmcEM2Wng3UEMyOFhrdHE1?=
 =?utf-8?B?bXcrVmxQenUvc2w4ZFJ3dU9CV3BxZytRd0hQWm9rcHNJRmpKbjhpMXF6ODR0?=
 =?utf-8?B?c0pUWGJ3RFk3NHBPaGVtOXF3bG1HUjN0N25ueERWbWJWY3RqWGdSQnJtVmlm?=
 =?utf-8?B?MXBTSmxoak0yZWpUTytVYklGVnhYR2oxdHpDZnd1eVdwVnNCRFgrNXBsejZ0?=
 =?utf-8?B?emdhdjBmTWdnbGlPSEFpTW5TenRzMW9rYmpCejdrRmsxZEJiUmVLUTRLSUVS?=
 =?utf-8?B?cEpERUE0STF2V3ozMlRDSTRTYkQ4K1V1K1ZJbGtzM1h2N3pDLzVPa21LcE0z?=
 =?utf-8?B?UytVdlNIVTBKb3R0ZVc1OVlqU0ZpM2FjcEgzeHkxU1lLYVZPVmFsY1RBWGlS?=
 =?utf-8?B?OThCT2F3TjMvYnU1TFNPWFV4TWJTbVlZMFBKZHBERU1kVURVVUp4aWNURFpl?=
 =?utf-8?B?VUo4bEtwdFd4aXhaaDBDMjBNeVRxZC9LcGxLYWdXMGNwdTFSYlVTdlB2Q0pT?=
 =?utf-8?B?bElFSTUwdnkzeGdPVUQyMUZrTVVIcTN3NzFOZTdJdUc5T215bUhYaFV6cVlt?=
 =?utf-8?B?SnJNZUlPSGJDUGNUdEdGWlpWZ0dRVEsxejFJa1NEQnJpK0tGdGhwSzJOdk9T?=
 =?utf-8?B?OFFhazFoeWErcld0cmdhU2FvejJQQnlJbnlOMnpsVWZBejJ3dFNnckI5ODk0?=
 =?utf-8?B?c1hXRVJtZTlwV0R6dlZrYkVUaDFJaG5xM0hLYXk3RGFweGQzVmdMQmFJTkt2?=
 =?utf-8?B?REhBdVlIb01KdDJGWWpWM1BTR3l2U0o0T3BFd2pKK0gwTThyS1NuZjZqcERO?=
 =?utf-8?B?UzcyelFMS0dveWZaRjBHMHNXNWY1MjhYc1ZDZTBWV2VTRHovVlN6QnJyZzJP?=
 =?utf-8?B?NDYzbHhId3hCdnhXMFVBTVNJakswUktJVmJvM3ZnV29oNDNVRTdnWDZiK3Y0?=
 =?utf-8?B?TnJzNGh6Yk0wWHU3enhYOVlIZjhWMkJhRGVMSHJITWUycUZVYzhCbHRCdUFX?=
 =?utf-8?B?K0M0OEdHTm5qd0t6eThQWWV0c2wxRkFEN3EzeFYxdjhyVlNKcDd0VXNsNUcz?=
 =?utf-8?B?QkVHWGIrZU5WbXlia0FER2xGTTBGdGU2UlRqQ1ZpZ3JZY2tOZjdRZzdBbTJQ?=
 =?utf-8?B?V2t4dWtUeU9XSitnTHJWMGwyU1pWM2xIRURKNnhMTktyV3pJNHByQ2E1N25X?=
 =?utf-8?B?Y3RoZ3IyWm5UcERWemU1T3Bnc1NNODdrOVJzTGJ1RkZuOHUxdGVwcnl5ckVJ?=
 =?utf-8?B?Z2pmUlg3Q1gwcENMWm9SMUNjVmFJUGs1TE1YeENjOTVLWWtid0pNMWdvMk05?=
 =?utf-8?B?UUdhZDkwZjVhQzd2dkV6aE5sMk0zS2xCTlVHL1lsb2R1NmxxMjhvRTlrekEw?=
 =?utf-8?Q?rHynjteX/BmlzdlzIIP5ohX3b?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 479e3b65-8108-4e9a-ce1f-08db44de5e9f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 16:10:06.5220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 84M04vLhHAZHY0JYCLDxQWIbLVaqg8X6ln2uWcTLWaSVvYhQQpCJicjRwKCfvZiTb0jUoe9mHmOY/Xe8GN37uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7882

On 24.04.2023 17:43, Luca Fancellu wrote:
>> On 24 Apr 2023, at 16:41, Jan Beulich <jbeulich@suse.com> wrote:
>> On 24.04.2023 17:34, Luca Fancellu wrote:
>>>> On 24 Apr 2023, at 16:25, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 24.04.2023 17:18, Luca Fancellu wrote:
>>>>> Oh ok, I don’t know, here what I get if for example I build arm32:
>>>>>
>>>>> arm-linux-gnueabihf-ld -EL -T arch/arm/xen.lds -N prelink.o \
>>>>> ./common/symbols-dummy.o -o ./.xen-syms.0
>>>>> arm-linux-gnueabihf-ld: prelink.o: in function `create_domUs':
>>>>> (.init.text+0x13464): undefined reference to `sve_domctl_vl_param'
>>>>
>>>> In particular with seeing this: What you copied here is a build with the
>>>> series applied only up to this patch? I ask because the patch here adds a
>>>> call only out of create_dom0().
>>>
>>> No I’ve do the changes on top of the serie, I’ve tried it now, only to this patch and it builds correctly,
>>> It was my mistake to don’t read carefully the error output.
>>>
>>> Anyway I guess this change is not applicable because we don’t have a symbol that is plain 0 for domUs
>>> to be placed inside create_domUs.
>>
>> Possible, but would you mind first telling me in which other patch(es) the
>> further reference(s) are being introduced, so I could take a look without
>> (again) digging through the entire series?
> 
> Sure, the other references to the function are introduced in "xen/arm: add sve property for dom0less domUs” patch 11

Personally I'm inclined to suggest adding "#ifdef CONFIG_ARM64_SVE" there.
But I guess that may again go against your desire to not ignore inapplicable
options. Still I can't resist to at least ask how an "sve" node on Arm32 is
different from an entirely unknown one.

Jan

