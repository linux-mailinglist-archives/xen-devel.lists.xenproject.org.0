Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AB71F32EF
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 06:17:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiVh4-0005xY-Te; Tue, 09 Jun 2020 04:16:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f2DJ=7V=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1jiP87-00025z-GI
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 21:16:27 +0000
X-Inumbo-ID: 4f31e48c-a9cd-11ea-b7bb-bc764e2007e4
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.102]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f31e48c-a9cd-11ea-b7bb-bc764e2007e4;
 Mon, 08 Jun 2020 21:16:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AIgwRbf5VjnUiogij1+0HRFkMm3YCKXScGhMXJgbWmr+CBAUXrH535WM8YVJuwhBi4w1xO3RwAxgNuD91afHQMkuNsf+wpCoC8oAJdgEazlzvVB1i4l5FOVMB7np5iHqwprAGFEtRCpTvJushH2Y8OBuwLNvWd0bXJT7tHbRseDwO9dqRSFbgjVGfIjPmVUFEfKUVc8HLM67tp8Koa6g8yhkDw/SPsZHq0vCJgtWr0XI2BHfu+CoZcfGK3RtKsjFdwe+2Pqvv0NIhbg7xdShmSJ3MColsFcvvIUGB0Wz9Q2gNPXS33x/qUMlwX9MPMycAreVmm+2eH+SOEF9X6Py4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BMyGPbmxiYGh7C6IwlCMGwsJeFFFqYdhaaLHnlr1MU=;
 b=HfyPkxwofWW40j8I3a+cT0cf1a3hiBWFtpuJtRK0WNLpEtwcFnHqPOZITDNIuP3XxDkcAltw+M5rP6ViQoaHPUFoVh+RundO7CHZN9/zE0XJQn/BqQqo0OdnxBoCzYsErpTSAOKZYfMWFuaB7cXju6AlYiK5eKgBn1EitqsNNCDqfqZu4O9GLUeb9Xi4IKL0wdMqcnL4uG7qTGmvZ4FWp6pabJfmzVS1c5c7E8aT4L8wSMt+ZHdZIuIHL2dvIRO8CijvK0YjHBnYiFA3tmXnXQrT6/5Gb8heR9Adlul1Cu6XVp0z4IMyFsaBrE1JDq9+5HHmJ8RJn62+CO9Qev39tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BMyGPbmxiYGh7C6IwlCMGwsJeFFFqYdhaaLHnlr1MU=;
 b=IFje1UGsOi8VNYyQEYF7snF/MYG6vo5mAGfE9aRqLvZqmR5Fslhyuc4cw6q1Xn+27fG4BVIRxVTrVOK5ZekXGaLeqHqgTwr1WKnBtAS5bKoLKLduUtYm0fJWgiVu/nupgHhH5OioOYANmr29XR5GQYHvO13ereMWnBVlsU93css=
Authentication-Results: bitdefender.com; dkim=none (message not signed)
 header.d=none;bitdefender.com; dmarc=none action=none
 header.from=bitdefender.com;
Received: from DB8PR02MB5434.eurprd02.prod.outlook.com (2603:10a6:10:e5::15)
 by DB8PR02MB5564.eurprd02.prod.outlook.com (2603:10a6:10:e1::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Mon, 8 Jun
 2020 21:16:22 +0000
Received: from DB8PR02MB5434.eurprd02.prod.outlook.com
 ([fe80::3c22:239a:7f84:7572]) by DB8PR02MB5434.eurprd02.prod.outlook.com
 ([fe80::3c22:239a:7f84:7572%5]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 21:16:22 +0000
Subject: Re: [PATCH v4 for-4.14] x86/monitor: revert default behavior when
 monitoring register write events
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <20200603125237.100041-1-tamas@tklengyel.com>
 <20200603150721.GF1195@Air-de-Roger>
 <be627680-5ab2-d93d-b042-2b6aadbdcd8d@suse.com>
 <ffa44e09-a9fd-8fff-16af-e0991db3cb9b@bitdefender.com>
 <CABfawhnNC3yCuG+xNicyjA_Qo89qpvXKL-Cp9wAc4Cq=Xv8BYQ@mail.gmail.com>
 <aded2ba0-3a16-bee5-d3e0-98bf5beb068d@bitdefender.com>
 <CABfawh=s6OL54ckemhvjWRQWu_apmV6--L0+bRY9xEQKaPj16Q@mail.gmail.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <fdedc03a-57cf-3899-93d1-db491ecbbc5d@bitdefender.com>
Date: Tue, 9 Jun 2020 00:16:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <CABfawh=s6OL54ckemhvjWRQWu_apmV6--L0+bRY9xEQKaPj16Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0131.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::24) To DB8PR02MB5434.eurprd02.prod.outlook.com
 (2603:10a6:10:e5::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.228.119] (82.137.38.55) by
 VI1PR06CA0131.eurprd06.prod.outlook.com (2603:10a6:803:a0::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18 via Frontend Transport; Mon, 8 Jun 2020 21:16:21 +0000
X-Originating-IP: [82.137.38.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c59c2ed7-edc4-4156-c55c-08d80bf131df
X-MS-TrafficTypeDiagnostic: DB8PR02MB5564:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR02MB55649198F2139BC4E8C09E2EAB850@DB8PR02MB5564.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 042857DBB5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6egoxf1Qs/itY71To2uEADxLcQ3JFd0DW6zD/eP7LPHqliJT1lCRU+YZg6842awWxTWQUMiTuLZoKENT8e/ru83bPVulrfmDH/DS9bz3kly27Exp8FSmO/jseSVZEwE8H6KRBqdzVLwfFQs0RPD81DagrLaVxuHMEEt+U5F91CmJNNCTYgHfIiqSbIlJ2HDflTbTXXdyjDkDdG6MfRvvjI8YPIrDbGv+/nCcGaSkqhZnmuu1Gwb7CFuUtsDO3yBKmB8CZxbvmWz2DTrDKZ3K/SV37TK1QC1F+gN3Avd4sZaUHrI+EfNhfb50STh3EU3JxvQOhoO3K1fkRDDRBX65spFTFitTqWloaWKIXEXa5o2/kuG7fzdO11z9kP3Ys75c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR02MB5434.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(136003)(396003)(39860400002)(376002)(366004)(26005)(186003)(83380400001)(16526019)(7416002)(8676002)(8936002)(4326008)(86362001)(31686004)(107886003)(478600001)(6666004)(31696002)(5660300002)(66946007)(66556008)(16576012)(6916009)(316002)(54906003)(6486002)(36756003)(52116002)(2616005)(66476007)(53546011)(956004)(2906002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: qk5VsOYQzqvkfcccRj+FF+Q9YHRbY2qePXPj9K54Vm0xXranBPuRTca8V/v53SvA3ylke0RcvovVryeRHEqYRAyVTTJhA6CNtBIslMtLePypph3HyVy8WvTMhpmMMoSdOFhWJiK5Q4aExwg/LthSBKHqwpqgfZIaofnzyPOIYSKgviJd8gD+O27pZnhHz6N0EzFQk74+AwWvv/iz+MOJHQt4NnQiz1FtIzNX1kHEgXmKBGpGuwE9TxQJf1ztf3hgEa3POOROZwwvIVw5pmUai2IFWANqd2EuMYFdsAijTG4Pr9tfZWg1hYGgKZJcAo+4h/gkDJWFUUiif0ycAMp0NfyvEXJkkPbSH2JAVUtrhg+jQoRBkYCPhCvEi6whWejUpHNV1WXG4O0SJevxmJcKnZySYJYg5h46SPzTNydltjX8K8mikiFvk+HE4A4onJNkzfiFwwG9y80TUjHl2shss305etPfsppdyee+8Fkv5R4=
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c59c2ed7-edc4-4156-c55c-08d80bf131df
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2020 21:16:22.6496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FozwZKQmh1Li3QC9Appi7PboI9kP2vP4yl3B+8nzRAHMXhMuX0TA4brOb6eju5X8WBLbUp1TUyC7KMZdKNmsLwvMJofatjz9RvjWv2hgmCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5564
X-Mailman-Approved-At: Tue, 09 Jun 2020 04:16:56 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Andrei LUTAS <vlutas@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Mihai_Don=c8=9bu?= <mdontu@bitdefender.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 6/8/20 11:44 PM, Tamas K Lengyel wrote:
> On Mon, Jun 8, 2020 at 2:14 PM Razvan Cojocaru
> <rcojocaru@bitdefender.com> wrote:
>>
>> On 6/8/20 10:54 PM, Tamas K Lengyel wrote:
>>> On Mon, Jun 8, 2020 at 12:58 PM Razvan Cojocaru
>>>> And last but not least, the proper sequence is: 1. unsubscribe from
>>>> register write events, 2. process all events "still in the chamber"
>>>> (keep checking the ring buffer for a while), 3. detach from the guest
>>>> (disable the vm_event subsystem). Not ideal perhaps (in that it's not
>>>> guaranteed that a VCPU won't resume after a longer period than our
>>>> timeout), but if the sequence is followed there should be no guest hangs
>>>> or crashes (at least none that we or our clients have observed so far).
>>>
>>> Incorrect. That's not enough. You also have to wait for all the vCPUs
>>> to get scheduled before disabling vm_event or otherwise the emulation
>>> is skipped entirely. Please read the patch message. If the user
>>> decides to disable vm_event after getting a CR3 event delivered, the
>>> CR3 never gets updated and results in the guest crashing in
>>> unpredictable ways. Same happens with all the other registers.
>>
>> I did read the patch message. As I've previously stated ("it's not
>> guaranteed that a VCPU won't resume after a longer period than our
>> timeout"), it's not ideal, and I've made no claim that the problem does
>> not exist or that it shouldn't be fixed - but really if you've got a
>> VCPU that will wait more than a couple of seconds to get scheduled then
>> you've got a bigger problem with the VM.
> 
> Sorry, missed the part where you say you knew about this issue. We
> didn't and it was absolutely not documented anywhere and certainly not
> mentioned in the original patch that added the feature. It literally
> took us years to figure out what the hell is going on. While as you it
> can be a couple seconds before its safe to disable it can be a lot
> longer depending on the system state, how many VMs are running and how
> many vCPUs are active on the VM. There is absolutely necessary
> use-cases where you want to keep the VM paused after a CR3 event is
> received and exit vm_event afterwards. This bug totally blocks those
> use-cases. Not to mention that it's a total mess having an interface
> where the user has to guess when its safe to do something. If this was
> pointed out when the patch was made I would have objected to that
> being merged.

No, we didn't know about the issue. It's apparently not my most eloquent
evening. I was merely saying that I did understand what the issue was
from your description, and offering an explanation on why we've never
seen this in QA or production. Of course the issue would have been
mentioned at least (but ideally not exist to begin with) had it been known.

We do take several passes through the ring buffer (and as a side-effect
reduce the probability of a race occuring to almost zero), but we do
that to make sure we've cleaned up all EPT vm_events; the fact that it
has helped with _this_ issue is a coincidence.

IIRC Windows, at least, will be upset if a VCPU is stuck for too long.

As for how the vm_event system behaves:

1. A security application that is unable to _prevent_ things being done
to a system is not doing a very good job, since in that case you can
only collect stats and not veto anything. I would argue that the default
for such a monitoring application should be the current one (all events
should be pre-action).

2. This is further supported by the fact that that's exactly how the EPT
vm_events work: you get a "I want to write to this page" event _before_
the write occurs. If register writes behave differently, you have _two_
different models: one where you get an event post-action, and one where
you get one pre-action.


Hope that's clearer,
Razvan

