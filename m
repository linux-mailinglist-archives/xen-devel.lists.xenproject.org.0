Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C44B21F32ED
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 06:17:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiVh5-0005xe-6V; Tue, 09 Jun 2020 04:16:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f2DJ=7V=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1jiQyH-00041E-D8
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 23:14:25 +0000
X-Inumbo-ID: ca443da4-a9dd-11ea-8496-bc764e2007e4
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::72c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca443da4-a9dd-11ea-8496-bc764e2007e4;
 Mon, 08 Jun 2020 23:14:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gC8E0foYlAxg7I3/fz8jUx1isFQyI/uwZ8EZUC/VP7QpOlcEhN+KdWjQ6AFO6/XFbAmIwQa+iRBP5EDF65uzk7wg46VtR0+gYSMPB3PggGrBzVaA2n9KUXefUhETj9jaiprQxmd3/ffyHfGNVFZtDRIMs8bcyw/8Y67VR3FRNn7Kt0RRrFrPcqdWmfDZMKXnqp0iVZzvEbPmuz+EXh9fwqnTDGFnvymuPTkyoImfy4a9zI1TlaW5tFiddUG5AP51M2pZvftJaYrWTMyy8Tw3YWaAaHp6e34Ho29EAzfW9piJOuNKX4gg4wQXHIHGoqkvOzqzVaI+RuC3U3FUVbjGrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0z/blzsh626fEpKcpbfFnHTuK9nMDcgSPsH5WU4t0oQ=;
 b=X0whqMCJ2wiCgTTw18CBIKWC/lUDjzrc2gpBYkbsTELpFzGPR1N1n0YnIBhjTWIfNJ+61E1RLGjj2Ub0UtuGP2lx/7aNUp2u5ggN0zhM0Sau+XRE6gOGFjvX+26Uy0wpmL4cr15QVqUDhC8xyY62dX/F+QqpTJcLZDVKcRaWHiG3GEWdoXGYj/x6rif8hqhWErWT4RzwgCo2OMcuNdUp3hO5m/RBbPsuWXBIne+eDEd2UY/H8tyhP7+M2CyUqKJBIspuLErOvzH9PVDjKh/nfL8MwkoeamqHxH6WUwzVpoP8UCqcJAu2RJ5f2VgcX4gRvTelQTK7xz4hSI5vcUYqAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0z/blzsh626fEpKcpbfFnHTuK9nMDcgSPsH5WU4t0oQ=;
 b=vhNgBXWk9s3ZZP3INRFDBNOURhg6AefZvI8ZK0hnyLj4CyEKS4oYvUNuXFX/XEKP8fqRqPURUa9TsVpciDIX/KD+LqdtuRrEaxq30otrqOui9NmKmZUPjxAaC6a2i3R7jrM+cJgIZniZirbKalWmCrpgd4bIunnlUED9qe0j65E=
Authentication-Results: bitdefender.com; dkim=none (message not signed)
 header.d=none;bitdefender.com; dmarc=none action=none
 header.from=bitdefender.com;
Received: from DB8PR02MB5434.eurprd02.prod.outlook.com (2603:10a6:10:e5::15)
 by DB8PR02MB5770.eurprd02.prod.outlook.com (2603:10a6:10:fa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Mon, 8 Jun
 2020 23:14:21 +0000
Received: from DB8PR02MB5434.eurprd02.prod.outlook.com
 ([fe80::3c22:239a:7f84:7572]) by DB8PR02MB5434.eurprd02.prod.outlook.com
 ([fe80::3c22:239a:7f84:7572%5]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 23:14:21 +0000
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
 <fdedc03a-57cf-3899-93d1-db491ecbbc5d@bitdefender.com>
 <CABfawhkU+L0irWg47aoPWW0g6nJSY62Vodwi=mPH7f=tnghKTg@mail.gmail.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <4cd66e91-3c7e-6af6-e789-9cca5109dc18@bitdefender.com>
Date: Tue, 9 Jun 2020 02:14:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <CABfawhkU+L0irWg47aoPWW0g6nJSY62Vodwi=mPH7f=tnghKTg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0007.eurprd08.prod.outlook.com
 (2603:10a6:803:104::20) To DB8PR02MB5434.eurprd02.prod.outlook.com
 (2603:10a6:10:e5::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.228.119] (82.137.38.55) by
 VE1PR08CA0007.eurprd08.prod.outlook.com (2603:10a6:803:104::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend
 Transport; Mon, 8 Jun 2020 23:14:19 +0000
X-Originating-IP: [82.137.38.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3a6edf3-8919-48c5-586c-08d80c01ace0
X-MS-TrafficTypeDiagnostic: DB8PR02MB5770:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR02MB577000DF5F6872ECC8C5B4D0AB850@DB8PR02MB5770.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 042857DBB5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z25PGDveBnUJUljtOl+kahz48XO5wBwinOMHl0J542V8N7vOCqNpRNv0Uw5AOq5Jl0A5foQ3eYJduX7CSNbSs5jHtRM78AkgIaiAfEMnrNxDm3Wep8erTynGgxANNlf+jYq08tLpGEie/lb1Za3qDm8GHNE4dj2ZtK8hAn8tjvTxyV1A09y0Q3Otj4SDJ+1a9BXvRHTOSWH1II9uDe2pN/X+Gl7ZF2mdVND3/yVNipH53oevFe5x9hzZaD/6Bg57TMCibuCYN19JEravMN6H7DgqZkat33hS5XKKJN8AaBbijCE3bNs2sGcabJzj4XPWOMnFPxR5IrbGesmMqfWZgrMGq2AuiKYYF93U1wQBQcZQWKImdWlj+7LDdTMFp3VE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR02MB5434.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(31686004)(66574014)(8936002)(54906003)(36756003)(6666004)(52116002)(5660300002)(31696002)(83380400001)(2906002)(6916009)(2616005)(107886003)(4326008)(8676002)(956004)(53546011)(86362001)(16526019)(6486002)(186003)(66556008)(26005)(7416002)(66946007)(498600001)(16576012)(66476007)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 1B2Okm8H2TBrbJ3+AW1LmJVO/WFDtWk5Nsjo3cVEjMC+sg95MieaBBZAYMeK4xrf0pePsJ28T1ddtYUsUJMA25V4v7QXUMJ0WeUXrs4F9DvT+v6li3wgLJIMrQ2yDT3tSqxYqIE/y5gBGc4f79BCm4xjwYc1omVNYSaNAAmbMNLREtWcqerXQ1H6EQJyRzVENwOKGJI0CwLbgs/YwaXhcl+o7kGdynTLiUukNgItDn5D3qjJqw8uqsA6yOQhWz1OdBelJ99YQWvJv2Gd9owQVyOs0oGrmvfKkflN9Wz53snPk8kV0oVGeH8LlI/yr89ssTfRo1XZ/YOUoogX5t16X+p7wc8pIdd5HVtHrEfZGre8gC6na2j/IDo64dVsYX9DcvQn/Qt4dy1pUNXmACeDDAsgWiOjXcnwTVPl2pI7VO6nuPh6gQuBpSqpeyDXZDcc2LZkOn9tsvi0a8SIk56cBernEqGk90LmdUpdVoT5jvE=
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a6edf3-8919-48c5-586c-08d80c01ace0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2020 23:14:20.9518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xt3/F897JgkI2y5Ib4y/b2FqPxkcHIPZH43CrvsvScOmG9QEbjP8nyqYmn/UDWNrT/vDysF0S3GddasKVAR3mHYgiJ6SBgcIR/8JbBUoCK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5770
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

On 6/9/20 1:50 AM, Tamas K Lengyel wrote:
> On Mon, Jun 8, 2020 at 3:16 PM Razvan Cojocaru
> <rcojocaru@bitdefender.com> wrote:
>> 1. A security application that is unable to _prevent_ things being done
>> to a system is not doing a very good job, since in that case you can
>> only collect stats and not veto anything. I would argue that the default
>> for such a monitoring application should be the current one (all events
>> should be pre-action).
> 
> Not all security applications require this though. Malware analysis
> where stealth is required would absolutely not want this side-effect
> to be visible to the guest where malware could use it to determine
> that it's being monitored. So I don't buy into this argument.

Fair enough, in that case having both models supported should be fine.
I'll leave the rest of that conversation to my colleagues.

>> 2. This is further supported by the fact that that's exactly how the EPT
>> vm_events work: you get a "I want to write to this page" event _before_
>> the write occurs. If register writes behave differently, you have _two_
>> different models: one where you get an event post-action, and one where
>> you get one pre-action.
> 
> Whether you get an event before or after the effects of the event have
> been applied to the system state shouldn't matter as long as you can
> revert that action. I wouldn't care either way to be the default. But
> having a default that breaks other use-cases is unacceptable.

You keep saying that as if I disagree. :) But we've already established
that the potential for a race condition has been found and needs to be
fixed.

My only (minor) objection has been that a patch fixing the current model
would have been preferable to one that switches the default as a
workaround. Still, it's understandable that perhaps there's no time or
motivation for that.


Thanks for the work,
Razvan

