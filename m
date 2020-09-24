Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BA82777BB
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 19:26:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLV0E-0005KI-Uq; Thu, 24 Sep 2020 17:25:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W6+g=DB=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kLV0D-0005KB-V4
 for xen-devel@lists.xen.org; Thu, 24 Sep 2020 17:25:54 +0000
X-Inumbo-ID: 63ac7878-2bb1-4078-8b13-e488104d1c49
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.50]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63ac7878-2bb1-4078-8b13-e488104d1c49;
 Thu, 24 Sep 2020 17:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grBOV67/ipMOXdHc8m9cn1h+uYH5p5dqyoMYqB2FwX4=;
 b=om6j83w/sxA0MA9PjZezWDHqKp5mEEe6VwI4fFgrebFx0swtOEFoZuVUYViAAbL/m0K95xr9aJcrB2ma1Cu13qdKszpVu6lgR6Mx/wDaIo70iU9a8hkt/MGYLuOGmd1o4jmcz1CrGCaDlouVh2JxW72/V0dtSloHTX9nHmgm184=
Received: from DB6PR0402CA0007.eurprd04.prod.outlook.com (2603:10a6:4:91::17)
 by VE1PR08MB5024.eurprd08.prod.outlook.com (2603:10a6:803:106::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13; Thu, 24 Sep
 2020 17:25:50 +0000
Received: from DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::d6) by DB6PR0402CA0007.outlook.office365.com
 (2603:10a6:4:91::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend
 Transport; Thu, 24 Sep 2020 17:25:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xen.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;lists.xen.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT045.mail.protection.outlook.com (10.152.21.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Thu, 24 Sep 2020 17:25:50 +0000
Received: ("Tessian outbound bac899b43a54:v64");
 Thu, 24 Sep 2020 17:25:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 64e9c1aeb44d0e12
X-CR-MTA-TID: 64aa7808
Received: from 305b252c1b69.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 63329EF2-EE63-4D0F-AA63-033B4B907D8B.1; 
 Thu, 24 Sep 2020 17:25:44 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 305b252c1b69.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 24 Sep 2020 17:25:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NvQzvYdH3AFKGvi+DixA3HTmNHkzQ9KXq0zhshN4lRKL5YBqyFpDmM6x15y/3YEcc82xwamzHtc0LqN+GPqK0MB1hvVAs1Xl37xeRUDvOsk5Z3CynIy0bPUNkytnsBITSLcCLFSfxKnR11IK/xq6nFfnmXfZ7AQduFpTHyDahjV59rSHgrLzdD50EPoXcM/JzlpqcVzilZW+1WoI/rFNKTGzcOFAsUHbA46vExZ+2YT5pxEXTmG77M//4ZWb4kz6gq+7wn6CU3FvM3Id2agLqy9ljN8uL9UxjgmzeewL1SPyTBWn0dcY4cYsvXaRN/OtzoZ10RNNqmUVRPuOBsgZ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grBOV67/ipMOXdHc8m9cn1h+uYH5p5dqyoMYqB2FwX4=;
 b=nauJPDNn0pT9qCir0Kd/lXvSXrQUMOz1Xo/Vwmf6Z5MlK8Dm+MPQjrAr1KCi3lrdrzYSFUD6DYbsyJs3NjBdJmLrPPRHY9/OE/ABMASKIcN+8LAyXXl4bjUwn4jUbe8B6wYjt9mPSQ7Vddg1u/8OAcgB/VKDbd6/dtULI8n3DJivtJJzOgxudJwGDt7Omm1pDvM+O6zFxnvOQg7oC/m8NEQS0hseCyeyX1Tot+VuqbZfue+i888sf2Ncnoh3dcuCrASf5zspZAtef7w7CoZrkULWwYATzKSiCCFPMBUgtbbBEYqbhSnMWFqY9RCvwnG7p2ylBgXlre8SX9SfJERD7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grBOV67/ipMOXdHc8m9cn1h+uYH5p5dqyoMYqB2FwX4=;
 b=om6j83w/sxA0MA9PjZezWDHqKp5mEEe6VwI4fFgrebFx0swtOEFoZuVUYViAAbL/m0K95xr9aJcrB2ma1Cu13qdKszpVu6lgR6Mx/wDaIo70iU9a8hkt/MGYLuOGmd1o4jmcz1CrGCaDlouVh2JxW72/V0dtSloHTX9nHmgm184=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5324.eurprd08.prod.outlook.com (2603:10a6:10:11e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13; Thu, 24 Sep
 2020 17:25:43 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.020; Thu, 24 Sep 2020
 17:25:43 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xen.org"
 <xen-devel@lists.xen.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
 <stefanos@xilinx.com>, George Dunlap <George.Dunlap@citrix.com>,
 "jgross@suse.com" <jgross@suse.com>
Subject: Re: Runstate hypercall and Linux KPTI issues
Thread-Topic: Runstate hypercall and Linux KPTI issues
Thread-Index: AQHWh3jMy0NFQnBtL0aR33AwNuevPKlh5ViAgAABPYCAAAI3gIAArnsAgBWJPAA=
Date: Thu, 24 Sep 2020 17:25:43 +0000
Message-ID: <FB96958A-E432-4C42-9DD5-8F4DCB715100@arm.com>
References: <1844689F-814F-48AE-8179-95B0EE4E734C@arm.com>
 <8b9d8bc8-254e-01db-6ba3-ec41bc9cd2c7@suse.com>
 <2AD6A14F-AA25-464D-9E9E-6067F2F43F29@arm.com>
 <b7c7b1c5-c7c0-d7c9-b300-9a26e3b73746@suse.com>
 <alpine.DEB.2.21.2009100914300.28991@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2009100914300.28991@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5dda59ee-cd7e-4647-cd68-08d860aee1cd
x-ms-traffictypediagnostic: DB8PR08MB5324:|VE1PR08MB5024:
X-Microsoft-Antispam-PRVS: <VE1PR08MB5024150748C3D7C51396BCB79D390@VE1PR08MB5024.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 0zzZpCSQikZOTyoh6czWyMAmrhFRHgiEH1Pzq+S5i6Z6AmWVojzkUmgRgRJgI4eHqp69wnWoZ1olgtds7QHVqg4Trj7IGpJEbuOBfkom4ESgqOfS5b7xlsekmXsjTXBjktaJc8337SHWkCIQIr7xby3wqr+0VvXbB+k0NWZkit9gA0NiVkPTrm795yZynFjDI36ffiWAXHdLJf+rLw0RWNznAVLCwm3mDpEAxGZI9qmM8y3fJpYAj7TNxHfmZuS541u/zF79cAiZXombBDQqAedWrmSbM5U/tkJ/A0DR402s6vZ603ws1cywIFNpXaIsUi0rlYa0zDYSLgW/Rg2qMg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(66476007)(4326008)(26005)(54906003)(36756003)(64756008)(2616005)(6506007)(66556008)(6486002)(186003)(66446008)(53546011)(2906002)(5660300002)(71200400001)(316002)(86362001)(66946007)(91956017)(33656002)(83380400001)(8676002)(6512007)(76116006)(6916009)(478600001)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 2TIzYzSIZjGUMDOrbDw/QItIzcRbhaHIxtUbyF8DSdT5yjYsGiYzI9FfgSK+lowZXsd02R09KaG2sfn5lFL62LB37NMbEu/BmbOJ7+5Z/loAe7rWhnHxj5giybphNvdyYtznlYcUGIlX/na03sQHcuW+kp5nTdCvUUK5YWZ3g2gx/r0G3e7ftW5zKtp1h9WHbU4a26NOad18BdFB253mKtNpfwmHFFYWkUJhgDrFLR3zj2N9BlFVUIuN7ihQ5UygWFFQqoKJN0L+9e9qjvTzryHX7XDNHApHEEzn3sgfFRJkqX4flIhdrIM1qehPk2VN20kdS9lFYE3J1Gb+oSfmt81xABYF2aSgZZ30ycP9g7n0jp0q9rsMJnaTaMe4ZoXiIpMKf2QxarkyMGQ149jNPV26O640wpzu26qBABi0FYd6XFlvealB9eDf83EcXe//6GlnJFG9fSvk8vRXe+lqNaI9NmpctJxR7iU7tqz8qqQNpiDTzLbQtt5CT3ayx8q1fk5txwd+vFe/BMNSKmjiJkZgb+HYqil1iwMbPzgvk7uDnG53XeKmaWiENbv6tQjcAstAzTwXGlLva1BCEDRa98DrRwwG0VqGk3VubjXFpqiUKsu/Mddqf5fzv7ewBgZrgEyVfNSv5agJnfIcNf2LXg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <01BEF085A7BCAC4997D5AD93275F6164@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5324
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6d793ee8-f086-4ffc-da71-08d860aedde7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xa9pWcOiVAtLaqGLCZbF5tpx3XFu9piyCaR+J8vdm+gUDJlAq5i0Z9w5+FqPPcPNARo+rEJYVt51TyPZORT2t6urr1RAKutkfBt81tYijKa9HqcaHvWF9oqYFPFGMTvtKMLWUOcs/g7NkchqSA6Yh9eSxeyPnBq78ASzc5Lp5Fl7xwcHoq1O/wsaNYTe7+5IQIlRsOS78VXDXZyr3NiEs/8j0wsY/VLQHYYbbsPILZyviAhfuF1AjZVv8VkbbHDEVfyFlF+7yLIG/jDvUNuGFV4K//VI8n5JNnANbM36pXzKKBWnPyJxopzAH2R5XnblIl5U904U4DMUJqMXwfII8l1BBzUHD/3l+AXJzui7PLDqcb/1pxXkGnqmctndwxsZ+TtQ0/ASp3SBxUIPwLWUzA==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(346002)(39860400002)(46966005)(316002)(6862004)(6506007)(81166007)(26005)(82740400003)(2616005)(8936002)(4326008)(86362001)(83380400001)(8676002)(478600001)(53546011)(70586007)(186003)(33656002)(82310400003)(356005)(6512007)(336012)(2906002)(36756003)(5660300002)(6486002)(107886003)(47076004)(54906003)(70206006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 17:25:50.1802 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dda59ee-cd7e-4647-cd68-08d860aee1cd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5024
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

Sorry for the delay.

> On 11 Sep 2020, at 01:33, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>
> On Thu, 10 Sep 2020, Jan Beulich wrote:
>>>>> - should we backport the support for this hypercall in older kernel r=
eleases ?
>>>>
>>>> It's a bug fix to KPTI, and as such ought to be at least eligible for
>>>> considering doing so?
>>>
>>> That will mean also backport in Linux. What should be the scope ?
>>
>> All longterm and stable trees which are affected, as I think is usual.
>
> From a Linux perspective, we should fix this as soon as possible: we
> should backport a patch to make the usage of the runstate hypercall
> conditional on KPTI being disabled on ARM.
>
> Then, when available in Xen, we should backport the usage of the new
> hypercall with a check to detect if it is available -- do not assume it
> is available, users might not update Xen, but might update Linux.
>
> We have to do this in two stages for a couple of reasons. It is best not
> to wait for Xen-side changes to fix Linux any longer. And also, a Linux
> fix is best implemented independently anyway: Linux should benefit from
> the Xen improvements when available but not rely on their presence to
> work.

I fully agree with that and this should solve the short term issue.

In the long term the new hypercall seems to be the only solution but
it is not a small change and I will not have time to work on this in the
near future.

Cheers
Bertrand




IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

