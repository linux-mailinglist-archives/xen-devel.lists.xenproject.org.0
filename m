Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F103A307D79
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 19:11:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77377.140112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Bkr-0000fS-19; Thu, 28 Jan 2021 18:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77377.140112; Thu, 28 Jan 2021 18:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Bkq-0000f2-Tt; Thu, 28 Jan 2021 18:10:52 +0000
Received: by outflank-mailman (input) for mailman id 77377;
 Thu, 28 Jan 2021 18:10:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0GBf=G7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5Bko-0000ex-TR
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 18:10:51 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7d75164-fec9-4de8-823a-3b48ed1346ef;
 Thu, 28 Jan 2021 18:10:49 +0000 (UTC)
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
X-Inumbo-ID: c7d75164-fec9-4de8-823a-3b48ed1346ef
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611857449;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=geRZwB08/xCNrTjCrlcklSj2P49juCcw4r/P/9d9Wpk=;
  b=btfb6DHBp+2ud4T2kGoVLS6nm+Opccfd1KTB97xSm/35g/pJ1G3mbOgX
   IaIygJLs3fEowg3aMa20efw6yBhEStnSYwplB1qIIW1gr7Tz06ZFmXbs/
   2l0IrOOomw5X2Qk4dRGMBDDcwRKv7K6plwRvoWNtYflydUWKevcu6xHbo
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TUx3QFc47QO9MJJO2mzkiE3y2yXe3d4XtYRh9F51pB5WzKLTBFaDasTwKoAPHAo6cZe5WFQRFk
 utZ6ja+KArFW2uZH7O5+Gs4MJb1vz00JJlEXN+ewui5IJ2jNBijxZg3oEOqPgNI8DIoT/Svkl7
 6sI9Gpw3AkzN/PHBTh0dlA1Ib6lXkK4boznl8iVwZEH6FB4fTnn4aA0Krt4mqouYbw6zHYPkeZ
 yVm2jJIDqdMGriU719BM/JxMrDzXvlKHWuwHt7Lb692uEHEZupOn/WpG3meGUbYTINkFYxrSQw
 av4=
X-SBRS: 5.2
X-MesageID: 37409725
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,383,1602561600"; 
   d="scan'208";a="37409725"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j6MuoMuMRQLlKULN61gpsetf06v6PrWB1/Ua43hALPvwWp6ACxBwMNhHQ3bWQ6hvjbH8peQNG/382ZY1g+C9Q8L6CAj5YcTD/esfcC+QszkwgAd7nRGRtlr0d2AT0nCQlUAgwqJ8QTInJZ97ghPyNmPG+rGiIvhzuouUaKcr8zOkMAVqQ+gZPDU85MVcFToVatHdNHd17oDibeQ5tT6NQ+U+NDIRSONbCxMerGzH/bNtsQuEz57auNJOlWxZQMDZ4Rg+O5VZK1pu1w5q5JrX5frED/7ZLdj+rSlswIgtqdWNzpy1+egA35PDYJUsnUhba6Nl7jNchFBMNhOwxZJr3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geRZwB08/xCNrTjCrlcklSj2P49juCcw4r/P/9d9Wpk=;
 b=PpMWJEZX2+qZ+VW4FND1GwcOqiB0LKOOOS3miBMtlXgGblJ2B5NyVJ1zsfnI7/I95Pci/f90AOKt9Hlb/2tV7DYcSGHsiFPiL5V1kVtyraeeyrv8QC5YwC9nuy2wOKnodd3/wBOJpN3tiY98qL2Da16y0I+DGGbL5zxbHHH17V9AGLyMY0OaoaeB/aLfhKfbCZtXGVW0EmIaBkv//PoDyai5aI8+dELiDNgigNKgz0sfjRZYEvZL7QsOS1tq78/kbkRY7BP3FItxHLVk3A8w4hMlVJVwzNFZZpulKD+kZayjSyzdGLFUoFkSj6CZiih/0pOVJLjVZ61T/tMAduWJvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geRZwB08/xCNrTjCrlcklSj2P49juCcw4r/P/9d9Wpk=;
 b=VPajaWT8lz0k2dtoDopwha2SFP4imfS4tTlCD1/A7+E8+bqmF8BHohYajWlfzNNvlW6zdIzgbW47HQgdCQUWUQsUtfj3FafziYgg6lq1CvLYG3lp1vw6EWAQU4UU3QgSY//YZwxi2T1moMAA03/+EA+g/nyeKUW4NU/c5zkisrw=
Subject: Re: [PATCH V5 00/22] IOREQ feature (+ virtio-mmio) on Arm
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>, Paul Durrant <paul@xen.org>, Jan
 Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
	<julien.grall@arm.com>, George Dunlap <george.dunlap@citrix.com>, Jun
 Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Tim
 Deegan <tim@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Kaly Xin
	<Kaly.Xin@arm.com>, Artem Mygaiev <joculator@gmail.com>,
	=?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <ca1375c7-852d-fb3a-6895-5ef12ea7a01e@xen.org>
 <alpine.DEB.2.21.2101280919590.9684@sstabellini-ThinkPad-T480s>
 <1bdfda04-5954-a285-db0f-3f1633e5fd2e@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5fa7024d-b259-3507-c708-676c52c13c68@citrix.com>
Date: Thu, 28 Jan 2021 18:10:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <1bdfda04-5954-a285-db0f-3f1633e5fd2e@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::7) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0b156a7-87e3-4d74-8e16-08d8c3b807f1
X-MS-TrafficTypeDiagnostic: BYAPR03MB4534:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB453440FCE9BD36807A68B9B3BABA9@BYAPR03MB4534.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WUW43xRxFs2IaV754rXk4u4L0e8adb+cpQqLtl5jcjUcj5caB2GlxdVxd7wKpFL/a+8xcO2AwOaJnHJrywE0jMiaQISmkeu0867+kkxODtt4VYqTmcheN7d2FeiYdSII8SfHKdIlNghD0RqvdKR3bO0Bqkx0HQxli0E2svDxnuOyUyjJacYtrewizK7B53xGutzwVOFOTVk0nTbI+7zG8ab6MZETmvvdnKCWmvJfbKD/SBpc2LoNPJjt3pwloLGY6XjtEn4dPAj2khKVkIXiDsfZXKA4xtEAT61XybKvnNnlqivNasOc1MM5hfR+IoRhvhu6MGx83HypYz3S9sWWPq5SETMGbHcsYWSGGBgRPUwqgCzHWqT485MaoixoMjZ7RpvtyCv57GqUqjXCu0G+60eSsz0JnymaW+JKK8WA8qWBUP360q2ZCcYCEXzBfJOkBSdQPaskbJ4o9SKBPZf1JPQ765Zy71BHXRbEXaDCC1rc6EIgpCDcYO+QwOWWV+vkU/ozbnB05Qs5qf2dEM+28x4dKN285M4rjzgd7bK32vC0u4BkWBRyz+Q7YyIM/ya6seI7b7K5GgIUKhnj5sdskSr5bVsvsST7P/0Q/FUKMng=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(31686004)(186003)(66476007)(16526019)(2906002)(8676002)(66556008)(8936002)(86362001)(4326008)(66946007)(53546011)(956004)(478600001)(5660300002)(16576012)(83380400001)(31696002)(6486002)(36756003)(316002)(7416002)(2616005)(6666004)(54906003)(110136005)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RTlPczRKa1dFdm1jNDFJd2JUQWNabVBhRXN5aWRSZ3dVTFpwWGZvZ0dVSktl?=
 =?utf-8?B?YjNqZitTL29XR090QU5QOVUzeGxUU0o0WWc1R09DalErV1U4WnlFeFpCWnhu?=
 =?utf-8?B?d2JjOElyYys5clNVK1EzSHJONjdiM2w5blRYMFdJUzQ2UUthelFqZ0VUVGQz?=
 =?utf-8?B?bjVaWURTYXcvdlduMFc1d1NlSWJlMmRlamt0TGFub0wvVC9GaDU1YVFvam56?=
 =?utf-8?B?VmIxaHV1bDQ2V2hmaXNvcVd0cnJIRG1FU1hRdlMybzJMUUZ6QUVXOTJCSW1K?=
 =?utf-8?B?VVV4MHFEZU5uOWdRUVA0NFBpMjZPSjBJVnlleTF3RnN5TERNQXBBZkNKOWpY?=
 =?utf-8?B?bkZmSGVPcm15SzNHL1k1OTI5WmZRRzQ5WWJGS1lNVGcwUTQ5RndDRWNvZEZC?=
 =?utf-8?B?OWxBcFNteGN3Q1I2eVQ4RjJwYnprOGVZTDFacjB5VlN4RnlwM0FqNXFiTWVh?=
 =?utf-8?B?a1laNU8rNktjWjlHNlA2blpyQW8rOE84cmZGR2hjQ3JoUEQwaEFuQWVlN0xy?=
 =?utf-8?B?WEM4ZjJCUGI4aEJnd1VsOWRENS9JMzA0RVJMR2ZKbVBteE42aFZrc1JISTU5?=
 =?utf-8?B?a2FrL3Q4QnZXMFBqNlBmMEM4U1hDS2haN3FSeHVtcFFxU21NU2Y1TGpmWGd6?=
 =?utf-8?B?MS9nMGJiY3JTVHcyMDRKVmJiQU9HRXN3cEM4UC9xbjVPOWNLdTdxalpqOWpF?=
 =?utf-8?B?MFdwcmN4TkprczY0b2dtd1Z0T0RWTTl6M3FMZTBLdXpybHJMZWh1dFBJQWhC?=
 =?utf-8?B?bG1YeDJrYjlTZDFVa25PNE8rRHE0MzBxZ2JyL1ArWUZvVXBwNFllOWs3TkVy?=
 =?utf-8?B?Zk5XcjREOHBSREtwZlV6Wms0RXZQKy9UZ1BkZnJDRW1zbllDOUFLR014T1hs?=
 =?utf-8?B?WkFjNGFYVy8yUVErc0NyMlJybDVGeEhqWmpPM2FsdUpGTWJHRzZNS2hXMHIz?=
 =?utf-8?B?OWQvYU1tdVFISURXWmV5WlVLcERGQkpWMktyTmg3ZEljL3VZbmpRcmN0OFZ5?=
 =?utf-8?B?dGQzNGdQbUVZb3ZGYTk5QmRWdTFuVDN0TVB1V2tmcytVNEEyWTF0MHVOMW5v?=
 =?utf-8?B?eHFlVTNvWllXU2trSGVsY2MyeERVVDcxRk5pejVpTnZjY0xXckowNkk0Q0Q2?=
 =?utf-8?B?MVlwbjFjU2doM2JDdlp2NVpmUVZRR2pzSHpyaGlsMVc4RlIrcm9JY1h2aGdL?=
 =?utf-8?B?V1UrdzBENkw0aGdKQ2ptbFo2Wk01ZktqK0pBK2dCS3lCNndBd0dwaHdpeENa?=
 =?utf-8?B?dVZJZmtWWTJZN3F6VTBpOHcwWnd3MStGbk10Tys3UTRHSEI5Q1NLQ2lEMVNh?=
 =?utf-8?B?VXlrd3htdWMxb3pCUVQ2aUtSZktjQ0JXTUI1MWZGVi9TQXlCU2tadUNBLzhG?=
 =?utf-8?B?TnUwOGkwWnpaZGF3RlFPNWt0QXpTY0JpVlpUWUdZSCtqQXpDN1pzeEFXSmdi?=
 =?utf-8?B?QUh0L09oMlNSYTVaWUIyN3dmRkllb3pIcGxIR2NBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0b156a7-87e3-4d74-8e16-08d8c3b807f1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 18:10:45.1033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xdU6YwgcucPxEXe8ozFWTuWtOaPzqDrokvd18110T/tzX3a/AIj2lXBep0mKB95v3IdQEW/+8Ha2I5Y+y6VVKYHDQ3uZXShg7tRposBHPnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4534
X-OriginatorOrg: citrix.com

On 28/01/2021 17:44, Julien Grall wrote:
>
>
> On 28/01/2021 17:24, Stefano Stabellini wrote:
>> On Thu, 28 Jan 2021, Julien Grall wrote:
>>> On 25/01/2021 19:08, Oleksandr Tyshchenko wrote:
>>>   > Patch series [8] was rebased on recent "staging branch"
>>>> (5e31789 tools/ocaml/libs/xb: Do not crash after xenbus is
>>>> unmapped) and
>>>> tested on
>>>> Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with virtio-mmio disk
>>>> backend [9]
>>>> running in driver domain and unmodified Linux Guest running on
>>>> existing
>>>> virtio-blk driver (frontend). No issues were observed. Guest domain
>>>> 'reboot/destroy'
>>>> use-cases work properly. Patch series was only build-tested on x86.
>>>
>>> I have done basic testing with a Linux guest on x86 and I didn't
>>> spot any
>>> regression.
>>>
>>> Unfortunately, I don't have a Windows VM in hand, so I can't confirm
>>> if there
>>> is no regression there. Can anyone give a try?
>>>
>>> On a separate topic, Andrew expressed on IRC some concern to expose the
>>> bufioreq interface to other arch than x86. I will let him explain
>>> his view
>>> here.
>>>
>>> Given that IOREQ will be a tech preview on Arm (this implies the
>>> interface is
>>> not stable) on Arm, I think we can defer the discussion past the
>>> freeze.
>>
>> Yes, I agree that we can defer the discussion.
>>
>>
>>> For now, I would suggest to check if a Device Model is trying to
>>> create an
>>> IOREQ server with bufioreq is enabled (see ioreq_server_create()).
>>> This would
>>> not alleviate Andrew's concern, however it would at allow us to
>>> judge whether
>>> the buffering concept is going to be used on Arm (I can see some use
>>> for the
>>> Virtio doorbell).
>>>
>>> What do others think?
>>
>> Difficult to say. We don't have any uses today but who knows in the
>> future.
>
> I have some ideas, but Andrew so far objects on using the existing
> bufioreq interface for good reasons. It is using guest_cmpxchg() which
> is really expensive.

Worse.  Patch 5 needs to switch cmpxchg() to guest_cmpxchg() to avoid
reintroducing XSA-295, but doesn't.

>
>>
>> Maybe for now the important thing is to clarify that the bufioreq
>> interface won't be maintain for backward compatibility on ARM, and could
>> be removed without warnings, at least as long as the whole IOREQ feature
>> is a tech preview. >
>> In other words, it is not like we are forced to keep bufioreq around
>> forever on ARM.
>
> That's correct, we are not forced to use it. But if you only document
> it, then there is a fair chance this will split past the "Tech Preview".
>
> Today, there is no caller which requires to send buffered I/O in the
> Xen Arm hypervisor. So a Device Model should not need to say "I want
> to allocate a page and event channel for the buffered I/O".
>
> The check I suggested serves two purposes:
>   1) Catch any future upstream user of bufioreq
>   2) Avoid an interface to be marked supported by mistake

"use bufioreq" is an input to create_ioreq_server.  The easiest fix in
the short term is "if ( !IS_ENABLED(CONFIG_X86) && bufioreq ) return
-EINVAL;"

The key problem with the bufioreq interface is that it is a ring with a
non-power-of-2 number of entries.  See c/s b7007bc6f9a45 if the
implications of a non-power-of-2 number of entries aren't immediately clear.

~Andrew

