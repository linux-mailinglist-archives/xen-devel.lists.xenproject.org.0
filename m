Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B52B1203AAF
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 17:22:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnOH2-0002YR-11; Mon, 22 Jun 2020 15:22:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ahnO=AD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jnOH0-0002YL-FQ
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 15:22:14 +0000
X-Inumbo-ID: 25a8be72-b49c-11ea-b7bb-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.48]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25a8be72-b49c-11ea-b7bb-bc764e2007e4;
 Mon, 22 Jun 2020 15:22:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7VeEIU/iw/QUOM2Ywk//xlvJ3f4GyUi0hVMQvH2fzsvDTfm+cI0RySJr8WEkt1JetBR/4kzJmkTYd5TFBYS+gRjACMhLlguuSbMa7q8jRXt8k0Zx6/6JJZdxexWQTfmrPlveBujRRhr2oAuIXHqFu4mBo2iEMLoG2Xk/sIjAtZ4ssaW4GH9fkW7tdTev01KIuT97OxJsC/1dMc/k85ej2oyldXmDX25spgRSLpTHy4sH88ETfwj+NLz/zz0Kh7lVKrq/z4jYnVJn2Z5w+M3jjmkgauYLujAEaau7ksbcfJA1lrJTC/Cyk8eMgmE9yT+gnlX9KSYFJtfOgXZrqzvxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PjXg3PzYzzcxJGTITGiqTsNtikdSrALWz0hLC1D5Xc=;
 b=EjlZpnItQpra6l098mq1AgaHApZibGj89pOBtmK3nkO11DyHPCftviOT6dkFzQVYFDsnLOac4X2nF5iN/5eW3u6BAVRYGdtp/p0RlP/zB7tr57PyNayMn4lCL9+i6azDRc+sRPxTYaDDtgMzqxB37oZSB9NUj1ZcOJ+soJNhwAPpEndCgI9RZE7r/0d57D3Nu1srewhC5hJSQkr93p3dkmBoTZbffMxQ2igx/QVVxLD2uniIG1aS8v/6Q2+mbQncthPG5eeL/KOMgFaaszQDsHbVF9o2EyrHt/w/PIU+31OZYZUVYiPvkx4guIftgmH/YVva9iJzngysrKJ4GxZtRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PjXg3PzYzzcxJGTITGiqTsNtikdSrALWz0hLC1D5Xc=;
 b=H6wGgwIBM+YIrgNe11amPkvVDHj26CsdK62YFd5RJ2jWy6worcNrep7kPBaGLv93dF8gbZ8kRNVDfucV/R2tXcjMmotJlhIX/XhW0+adXju6KSXK+AnIhCXQfhK7Xp5X//l05MfOqdmqr1EVBtKzxi2xA+q888cZafb8bN2PQQSFc78KaV1yEpdrQFoGxrBUq2FQEXr29xeBxvjSvl3e6pH7ZItfqHV5jqJ8w4CAN3LIWh6H+bw3C+dXlaGATxki4DuPRpYylgSBfjKAG915kwykZcoqBw+v7cF4fFwG2xD+LB61QhpFjQHLdAhPUyAs4iZ7KDr074aVbJWW8OqnFQ==
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4432.eurprd04.prod.outlook.com (2603:10a6:803:69::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Mon, 22 Jun
 2020 15:22:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600%6]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 15:22:11 +0000
Subject: Re: [PATCH v2 4/7] x86/vmx: add do_vmtrace_op
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <1005194077.9820950.1592523663199.JavaMail.zimbra@cert.pl>
 <4e040500-0532-2231-f5b7-c61e97a0a0c5@suse.com>
 <800738193.11403725.1592836530558.JavaMail.zimbra@cert.pl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <87576264-e7df-2590-f141-351d76baac7a@suse.com>
Date: Mon, 22 Jun 2020 17:22:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <800738193.11403725.1592836530558.JavaMail.zimbra@cert.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM3PR07CA0116.eurprd07.prod.outlook.com
 (2603:10a6:207:7::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.60.99] (37.24.206.209) by
 AM3PR07CA0116.eurprd07.prod.outlook.com (2603:10a6:207:7::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.10 via Frontend Transport; Mon, 22 Jun 2020 15:22:10 +0000
X-Originating-IP: [37.24.206.209]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e8cb101-a90a-4c48-77b6-08d816c008c4
X-MS-TrafficTypeDiagnostic: VI1PR04MB4432:
X-Microsoft-Antispam-PRVS: <VI1PR04MB4432574A1F0A0DB42451A329B3970@VI1PR04MB4432.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UOseMuJdYqAMwR+KpUxxremwtkdxTRPhi+fSjy9QZvlPeM0k+ZYqy65Npv/mnRp6pkHXLDXcZxoENyOgODcfMCdGWWqThXkBUHXzkCJPDIBqVJrhYNQ+If/EGcCRpdolaUX60fX2dkRLwLeUxhBb86EuN3yQh2lxX4DLOXVPC8yUYAglgfyydJIUDl91eQ7wuNTYgM/3hgP+B5HhkEsRYlr1wZ5CJFLAgt62cz1+fF5uG1MmGvoC6wSUgpLK5SZng8/Io2WiugWLYN0a8WoQz1rpsy94wnfhf9CGIHDNnDo87z/zB955PU9J/Gbkrj5JsoleweSTQb2MvGPfbivcKqL9xklUiV9SsIyB69atGiw2frno3ob3/IfaVsd+gUng
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5600.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(136003)(396003)(39860400002)(376002)(346002)(7416002)(6486002)(478600001)(26005)(6666004)(6916009)(31696002)(2906002)(5660300002)(8936002)(54906003)(186003)(16576012)(16526019)(316002)(956004)(66476007)(66556008)(2616005)(8676002)(66946007)(4326008)(52116002)(86362001)(83380400001)(36756003)(31686004)(66574015)(53546011)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Nm+7I6cF+WeBbjm7qgrNIVGI0XrQx0ZXV5ZnjCAuavu6k7tk8H35wlWj/w4pIEadM3JimtwYXv7GmeFHRmqwE1A7tylBBPw1pOgQG3z7PxU2viJh3JMh52tKsJTw2Pjq2znNfHscpOhzer812YpnFOF5qvaR4KHLNSM9o25mV7vbkhWWr4q/26jf0HGkJ4vmSCD6IRWtO8ErpXIQjo55mJ9kU6bo6UZRNxXCaFa/sGYDf2g0nszvPiUCr0wUArMOKxEVOkyxT1bRC56CWQYpvSKhU+4E3U1G74kbWgeziieiqcXCLZN7+W2haf+hFDpKfx/3qmk040nfZqF0Q9sXgAuKRLcgQc3yKa5mYemcUYr4i+HFBUa1hqD7Mrpr8lUyw6kurCUCINdumXzNiyPOW8le9004hs8bLvdusFMmtuLJhJj/17cYKcmuGbyNSGGEK1Trbcmlyxe0DwtgXo1pdTrckvhytMQqcp+quLOjS6Y=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e8cb101-a90a-4c48-77b6-08d816c008c4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 15:22:11.1099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: epsE4Zu4VCjMGabGK5MzdDsh46Is0AG5yHcSpyK5132R95mBfytCsh8guTUnD4E3LKSzzCsghcwpTcgtxpbk2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4432
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.06.2020 16:35, Michał Leszczyński wrote:
> ----- 22 cze 2020 o 15:25, Jan Beulich jbeulich@suse.com napisał(a):
>> On 19.06.2020 01:41, Michał Leszczyński wrote:
>>> +
>>> +    domain_pause(d);
>>
>> Who's the intended caller of this interface? You making it a hvm-op
>> suggests the guest may itself call this. But of course a guest
>> can't pause itself. If this is supposed to be a tools-only interface,
>> then you should frame it suitably in the public header and of course
>> you need to enforce this here (which would e.g. mean you shouldn't
>> use rcu_lock_domain_by_any_id()).
>>
> 
> What should I use instead of rcu_lock_domain_by_and_id()?

Please take a look at the header where its declaration lives. It's
admittedly not the usual thing in Xen, but there are even comments
describing the differences between the four related by-id functions.
I guess rcu_lock_live_remote_domain_by_id() is the one you want to
use, despite being puzzled by there being surprisingly little uses
elsewhere.

>> Also please take a look at hvm/ioreq.c, which makes quite a bit of
>> use of domain_pause(). In particular I think you want to acquire
>> the lock only after having paused the domain.
> 
> This domain_pause() will be changed to vcpu_pause().

And you understand that my comment then still applies?

>> Shouldn't you rather remove the MSR from the load list here?
> 
> This will be fixed.

Thanks for trimming your reply, but I think you've gone too far:
Context should still be such that one can see what the comments
are about without having to go back to the original mail. Please
try to find some middle ground.

>> Is any of what you do in this switch() actually legitimate without
>> hvm_set_vmtrace_pt_size() having got called for the guest? From
>> remarks elsewhere I imply you expect the param that you currently
>> use to be set upon domain creation time, but at the very least the
>> potentially big buffer should imo not get allocated up front, but
>> only when tracing is to actually be enabled.
> 
> Wait... so you want to allocate these buffers in runtime?
> Previously we were talking that there is too much runtime logic
> and these enable/disable hypercalls should be stripped to absolute
> minimum.

Basic arrangements can be made at domain creation time. I don't
think though that it would be a good use of memory if you
allocated perhaps many gigabytes of memory just for possibly
wanting to enable tracing on a guest. 

>>> +struct xen_hvm_vmtrace_op {
>>> +    /* IN variable */
>>> +    uint32_t version;   /* HVMOP_VMTRACE_INTERFACE_VERSION */
>>> +    uint32_t cmd;
>>> +/* Enable/disable external vmtrace for given domain */
>>> +#define HVMOP_vmtrace_ipt_enable      1
>>> +#define HVMOP_vmtrace_ipt_disable     2
>>> +#define HVMOP_vmtrace_ipt_get_offset  3
>>> +    domid_t domain;
>>> +    uint32_t vcpu;
>>> +    uint64_t size;
>>> +
>>> +    /* OUT variable */
>>> +    uint64_t offset;
>>
>> If this is to be a tools-only interface, please use uint64_aligned_t.
>>
> 
> This type is not defined within hvm_op.h header. What should I do about it?

It gets defined by xen.h, so should be available here. Its
definitions live in a

#if defined(__XEN__) || defined(__XEN_TOOLS__)

section, which is what I did recommend to put your interface in
as well. Unless you want this to be exposed to the guest itself,
at which point further constraints would arise.

>> You also want to add an entry to xen/include/xlat.lst and use the
>> resulting macro to prove that the struct layout is the same for
>> native and compat callers.
> 
> Could you tell a little bit more about this? What are "native" and
> "compat" callers and what is the purpose of this file?

A native caller is one whose bitness matches Xen's, i.e. for x86
a guest running in 64-bit mode. A compat guest is one running in
32-bit mode. Interface structure layout, at least for historical
reasons, can differ between the two. If it does, these
structures need translation. In the case here the layouts look
to match, which we still want to be verified at build time. If
you add a suitable line to xlat.lst starting with a ?, a macro
will be generated that you can then invoke somewhere near the
code that actually handles this sub-hypercall. See e.g. the top
of xen/common/hypfs.c for a relatively recent addition of such.

Jan

