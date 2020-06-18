Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 452401FE8CB
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 04:51:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlkdk-00081X-Lx; Thu, 18 Jun 2020 02:50:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0e1t=77=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jlkdj-00081S-4K
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 02:50:55 +0000
X-Inumbo-ID: 8684eca2-b10e-11ea-8496-bc764e2007e4
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.54]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8684eca2-b10e-11ea-8496-bc764e2007e4;
 Thu, 18 Jun 2020 02:50:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OvAjnMA4z0MvsiREi0f4dsvaj0IbrFs753qzYcgJwNrLCUKIC+1FZeU1yLaMdk6yblJokfcdu5WB1G9GkdQE7L5JQjk4QI1AujpLVTFxK/jrbjw9mowF9VQiXKm6GNJnQZWUT6/x1/Ryez0BX4+ycRzkca48TfH2H/xCH4RRSudMWXxaLRDJjQlV+XYml3Gx0VZYmEXAl9jp6jEuT8+X2ietRgzISfS7KJ91EriulummEvl/Bcwx90j1jovzmdEnSFf6SV8CgfaRxDHNKOpMAprNBFtjaYdUOB2iJEvvGtk9XO4qlrZVtd8PzN8sDrVyeFswexNtBmBB5HYK2Sm/oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b20j/K/217vYUbZ/Ef5p7dL2LuEFddj3s/AcWuYZGfc=;
 b=UUrYa0+cbhj1MDvjpz9GVoK4HhfWRiA9rWCM+a4k7MHSePqmmjZbhK0m6q6d2nt4dJUpTg7JxCscutWVRh16bRCfVi6Ty/Mc+yUqflXo5xiz1I5Kw/U71PbO+ckRLqW/ROUX7lqvEvbL1cI/ZWEcaCiz+7Gimw0Kpuz9v+rLJcRLQj3630+MZnXHnJUZF6qmhyPI5PJtM/mKZhF/9dxKozEZa1ZZK17Baa7t5RYJp/J4cjPUQEPI4Cc7fOA6hwee5K0Z0C8Tzy+DYW+jDnJO8dfXluk6YVtfhe7yqqAkjzjib9/VCymZVPqLKWF2yPBoXfPZbi5lz7zB/rA/QSj0Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b20j/K/217vYUbZ/Ef5p7dL2LuEFddj3s/AcWuYZGfc=;
 b=etmtVuAHjWf3Zi0Ii53lQuMj+mVo9vOeWgFM5SS5mpMUQz1Myg4EVRgNfE0M+FxyOHzhagtEUBU3MQXQicHeaAAbbZ1XrcinIhrVnkblSGUAP04gHOdWzZ60DSWkNDF+dLLhO4fJZp4ljZY+xtKBRwdLb33uNFdbCH1B6jBQ6cA+mCFITcjATb+evIRHmVE/mAaI11JdmSCuKYXsffbjBNJxtyI+NHIysMsqlHEQ1nX2gIB7x57CPL7/uXo0LnoGQjRbTu6c3LWWzGDdK1IdtWwKPop4WzLAbxxUbj8eKI1LOgay6Ot6APzviJLNwvGabqX7pNCIxJMmqX4B2RLfYw==
Received: from VI1PR03MB2926.eurprd03.prod.outlook.com (2603:10a6:802:35::28)
 by VI1PR03MB3535.eurprd03.prod.outlook.com (2603:10a6:803:2c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.20; Thu, 18 Jun
 2020 02:50:50 +0000
Received: from VI1PR03MB2926.eurprd03.prod.outlook.com
 ([fe80::95fd:55d9:421b:1f37]) by VI1PR03MB2926.eurprd03.prod.outlook.com
 ([fe80::95fd:55d9:421b:1f37%7]) with mapi id 15.20.3088.028; Thu, 18 Jun 2020
 02:50:50 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [RFC PATCH v1 2/6] sched: track time spent in hypervisor tasks
Thread-Topic: [RFC PATCH v1 2/6] sched: track time spent in hypervisor tasks
Thread-Index: AQHWQE+SUtF98x/3akmRxwBff1s+m6jbDBqAgAKp0oA=
Date: Thu, 18 Jun 2020 02:50:50 +0000
Message-ID: <871rmd3x4m.fsf@epam.com>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-3-volodymyr_babchuk@epam.com>
 <7d3e1741-b8bc-b522-8d64-20ca9c14744b@suse.com>
In-Reply-To: <7d3e1741-b8bc-b522-8d64-20ca9c14744b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 26.3
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71cb6675-fcd5-4fde-f8ec-08d813326942
x-ms-traffictypediagnostic: VI1PR03MB3535:
x-microsoft-antispam-prvs: <VI1PR03MB35358974FBF170F0404B4A8AE69B0@VI1PR03MB3535.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0438F90F17
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4/kR/YRy8emoov4ZlH4hjiMsw45HCQ2/3YUYdJfptQDNgaoXZsiYdI1wVSEaSTnnwKgpMXBU4QvUfZtBya6VlQ3nd5D9CEQbe/kJw2h55N09ldpSOMB+m/dC9cBWZlWWK/5z2os0TKI88iXCNVMLqefmhuc5eEj/nBliLFxAUBMpQlxOc8+9Eht96ymh9Lwi/XSIkpYDUjNPm3vH6XCw1cpexiKK2oJtHtQnN9DZiWHx3J+dwtk6hJ0ATyIw0GLQW6YtDpeQdaHSL7fTPmOQaO/6lkF5v+fLlq5TLvKkmx7+m8HEO8wUcsS8hHm6+0y8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB2926.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(86362001)(4326008)(36756003)(6486002)(5660300002)(6916009)(6512007)(2616005)(83380400001)(478600001)(55236004)(8676002)(186003)(26005)(64756008)(66476007)(91956017)(54906003)(6506007)(66946007)(66446008)(2906002)(71200400001)(76116006)(53546011)(8936002)(66556008)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: IfxbIq8PHkNaRyUv47Q0DJTIB0TaYCN19XMql2vkL+wosoXnh26iurjrwz8uSKPMIX5gSFoC0zboywO5I9r7FXWxSAahaDH0k+UfQaUseEq+2wom/xeQHcG8TuWhm/nab9S0Wl5PLz7nmb0jlPsGQeM1vSJHODWylaQZKvr58ktuLGTIlMndP7kZ7PIaG2suNDU/g9kiO3ka798Y82iN/yo0f9XnC0DDSiT9AqtMwICvEj6GDtTj4gWK/mc+5XdDb29IL6f/eJWGcAold8p1WpuGlQDfdw3mkQ8V17JEEKPcFbhl3vhwCIH0IUYCOSaWpfJMArQQBfsoiq6eqjk5aF5QHdLXFJ4kw5Bbi+y6NoT1KYVo8SvCVmtQxyd+4ziOi/Bseml46KD9A5cn444dD7zTctCyA+xhpRHr0Nwj6n5e9NUHSb5dZo1W3k+x2pUcbN8k8FNzAxvznmeDDRM8QTIFoTsnhPeNqLptqheRDew=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71cb6675-fcd5-4fde-f8ec-08d813326942
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2020 02:50:50.7165 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gfBOnV4DQiskfVXONBAgUBacypZv9HaJVK2eXD8nYtjvDVj4vcnn+YtexcITr+l8FO2TEXNp5GRbo9F4N2XNogjFiQOhhzrJUlwnl6HfQB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3535
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


Hi Jan,

Jan Beulich writes:

> On 12.06.2020 02:22, Volodymyr Babchuk wrote:
>> In most cases hypervisor code performs guest-related jobs. Tasks like
>> hypercall handling or MMIO access emulation are done for calling vCPU
>> so it is okay to charge time spent in hypervisor to the current vCPU.
>>=20
>> But, there are also tasks that are not originated from guests. This
>> includes things like TLB flushing or running tasklets. We don't want
>> to track time spent in this tasks to a total scheduling unit run
>> time. So we need to track time spent in such housekeeping tasks
>> separately.
>>=20
>> Those hypervisor tasks are run in do_softirq() function, so we'll
>> install our hooks there.
>
> I can see the point and desire, but it feels like you're moving from
> one kind of unfairness to another: A softirq may very well be on
> behalf of a specific vCPU, in which case not charging current should
> lead to charging that specific one (which may still be current then).
> Even more than for TLB flushes this may be relevant for the cases
> where (on x86) we issue WBINVD on behalf of a guest.

I'm agree with you. Something similar we discussed with Dario, but in
do_IRQ() context: we can determine for which CPU we are handling
interrupt and we can charge that vcpu for the spent time. The same
stands correct for cases that you described: for some soft irqs there is
a known benefactor, so we can charge it for the spent time.

I and Dario agreed to implement this in the second stage. I'm working on
the next version of the patches and I'll look at this more
closely. There is a possibility that I'll introduce that feature. But
I'll need some help from you or some other x86 expert.

Anyways, are you okay with the general approach? We will work out the
details, but I want to be sure that I'm moving in the right direction.

--=20
Volodymyr Babchuk at EPAM=

