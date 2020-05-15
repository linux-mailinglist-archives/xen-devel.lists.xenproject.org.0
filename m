Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ACF1D4739
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 09:39:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZUwT-00053f-8M; Fri, 15 May 2020 07:39:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lh6L=65=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jZUwR-00053a-4W
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 07:39:35 +0000
X-Inumbo-ID: 382d8b6c-967f-11ea-a52c-12813bfff9fa
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.53]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 382d8b6c-967f-11ea-a52c-12813bfff9fa;
 Fri, 15 May 2020 07:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pakA4T75Axh8hjqouFdaJiSQLAm3fu+OKSvdPPLKor0=;
 b=kI+R+D5xLG6rg1gYSHZyeuTA+NrYHOTXVmdNx3D8snNoMSfitHjjDib9ZwL5/ZhIk2I0H4D16F/PUN6ArZgz9OiqfG6uoWHH0geDMY2Vgr+fvkM5IHEypC2yGwVB8Xim8Ji2IJPO+DoN7kxt5XFNCRrbAms5P4Z691zbzbcgyCQ=
Received: from AM5PR1001CA0017.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::30)
 by DB6PR08MB2837.eurprd08.prod.outlook.com (2603:10a6:6:19::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Fri, 15 May
 2020 07:39:25 +0000
Received: from AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::53) by AM5PR1001CA0017.outlook.office365.com
 (2603:10a6:206:2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Fri, 15 May 2020 07:39:24 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT012.mail.protection.outlook.com (10.152.16.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Fri, 15 May 2020 07:39:24 +0000
Received: ("Tessian outbound ff098c684b24:v54");
 Fri, 15 May 2020 07:39:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 67ce12c4f3bc0b86
X-CR-MTA-TID: 64aa7808
Received: from 19d34f196933.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1BB05BA9-3665-4B89-B615-EDB8FB28FB17.1; 
 Fri, 15 May 2020 07:39:18 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 19d34f196933.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 May 2020 07:39:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiVId1Wq9ftD0Q4l6epFMW9HSUYSVKSnIiCHam2dV4/0+wURACZ35cdmDYeGx1yFyuHKv+CHbW/8UGsASIVr5WA7tl4NH9MTY7HbwTgfTp0eBXbheF9oBjcyYtHzYk8zJqS38hInFTkNHyqKNkQ/bCsTbSLlqcniFsczHEMYOAxpulzeszHflg8VR3GyRylPWM2uW8A+0wrY5eVWDpBeqbcG8StHUsolOaOvndbiLhgNaKG7WWfMZYrq2zlpFLDLbLPVVKdC19TSABMGnSwj2OHmzk12qmiTYQLv/NQzb6ccrkGbRAUQvgk+GQFuonyOO7Udt9w2/BisAbhmc3awMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pakA4T75Axh8hjqouFdaJiSQLAm3fu+OKSvdPPLKor0=;
 b=Wr4hbg3Nj6HcL/nuHQdTJtng8KV7Q4pjPpfNHIZ7VR7WGUlwiv1F8hZeVAyy/npA2J60CaV+HYwTWqfy9bebDD6m3NVyyamMEnJW3eD+QWHVpbcrQRe2rS6CaJ2nVu2rM6O5iKymZHQBdnC9SxfVPjXjUK9yzR42W/YAPI57fuw0GlyYH6vJS7GcHbu6Oq298ztpMsX7osYr2/PqxH5qreiWIV3SCyDSMb5NRwBtzXnwsFbDEYYdpycd31mUkFE0//T/dx61NtuBoJBr0fiLUSPWMX+6JjHviL53Yvw1Hy8wEGwAMAod3e/6llaC0200mS0OJwz2DCFrIkJWPwTZ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pakA4T75Axh8hjqouFdaJiSQLAm3fu+OKSvdPPLKor0=;
 b=kI+R+D5xLG6rg1gYSHZyeuTA+NrYHOTXVmdNx3D8snNoMSfitHjjDib9ZwL5/ZhIk2I0H4D16F/PUN6ArZgz9OiqfG6uoWHH0geDMY2Vgr+fvkM5IHEypC2yGwVB8Xim8Ji2IJPO+DoN7kxt5XFNCRrbAms5P4Z691zbzbcgyCQ=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB2970.eurprd08.prod.outlook.com (2603:10a6:5:17::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Fri, 15 May
 2020 07:39:16 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3000.022; Fri, 15 May 2020
 07:39:16 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien.grall.oss@gmail.com>
Subject: Re: Error during update_runstate_area with KPTI activated
Thread-Topic: Error during update_runstate_area with KPTI activated
Thread-Index: AQHWKfvm5I6PbMAmoUakTwbdgqMBQqinvLCAgAAF7oCAABaDgIAACWGAgAARCgCAANBZgA==
Date: Fri, 15 May 2020 07:39:16 +0000
Message-ID: <478C4829-CCAF-495B-860E-6BA3D86AA47D@arm.com>
References: <C6B0E24F-60E6-4621-8448-C8DBAE3277A9@arm.com>
 <2c4437e9-d513-3e3c-7fec-13ffadc17df2@xen.org>
 <2E95C767-FFE1-4A48-B56D-F858A8CEE5D7@arm.com>
 <ab4f3c2a-95aa-1256-f6f4-0c3057f5600c@xen.org>
 <b6511a29-35a4-a1d0-dd29-7de4103ec98e@citrix.com>
 <CAJ=z9a1H2C6sWiScYw9XXLRcezBfUxYz2semj33D5GpB5=EE_w@mail.gmail.com>
In-Reply-To: <CAJ=z9a1H2C6sWiScYw9XXLRcezBfUxYz2semj33D5GpB5=EE_w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 62716e4c-0fc2-45ec-4ade-08d7f8a316f2
x-ms-traffictypediagnostic: DB7PR08MB2970:|DB6PR08MB2837:
X-Microsoft-Antispam-PRVS: <DB6PR08MB28374B786A986E45956F80B29DBD0@DB6PR08MB2837.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 04041A2886
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: CqBUInAG6bTg+U1pFZ99w0FQdeQ2Rjhrbxx4Pkyo5fnXgcDcC8T+w7nv9UqEknL6cAy6RR9Sp1I/fWehN06LT98Thxbx5IQKfTqn9W93vbqvyjFhYFQaSDKVDPYbPAlTYZkq0ZPHZ1XI1g9rsl8QWg2iMvoMk5If1YtpOz269dpV5E3p0vivi6ZBYt3Pzs1a1maeW5+I5WH2K7ECJel8DFeXY+CeLYgqp3jV6FJw39oWAWziBo3bnErTbobVdQ4BgxXm6eLcQcQfGOFBNCU3RbaRQMvrWE1llo+fP54tcdgMqscMPh8crH4I2E/c6Nf8vcdRVDjkWw3TrvbaGMOdttkOZIXRKGu3GYDP8FWIL2LGxI2ZSyeeBIBaGqOGcxf6ITlR76bFV4nog4KL6c5MsU2U1q3qY7m3V36gBZNkM+DT6eGzApBGGrmlCcu0M8X4kRHnnDMaxb+XSenR143kOk8MN9/LGbRNUl4TFdyR+PhHmkUYrCFkIikZevV+o0shcdzfN2dqHOZvYvXZSr2mrg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(366004)(21615005)(66946007)(26005)(76116006)(6506007)(8936002)(8676002)(4326008)(316002)(186003)(54906003)(33656002)(86362001)(6486002)(2616005)(53546011)(64756008)(2906002)(66476007)(36756003)(6512007)(6916009)(478600001)(91956017)(5660300002)(66556008)(66446008)(966005)(166002)(15650500001)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: msz+GeqhIJ9t+J9DV1L9At3e+my8fLZSsMC5rHqoiSHSZgP3Uu3Yj/HdsXzhmqzOj/7ZDjktzBrD3gI5/PVfq7bFTU7frVZC4NUMAO2d11qpEuH1RLg3S+NA/pfJim0jitOO/PQPFdt1WLeA9fnpmoKtIEZDzSm0dxP1ort33dEOD2lt3Mdvk/Uexy7hf/Chf48z1orcPEFrDQQUAWCCVV/tCYmLXVvTR+k94gV9T4LxDeodRILFO2fW/HL4nC8DETpWljcGeWXBXn9QfNTN5ftoz/4Knvrs2b/WCxMJa0e1rxCSblNBQRoVHDUyfV0xFo9MF60rm4LjZ1T9K9tPfQ9lvjA1dCjAcfKCniQA7eDnvPbL+0TKt5UDG152E22YQyZx+ITbCCpbWwjOtvkC2v8Q24ANKcxu7d12lbDkEIYlRbYRSWrMTpOnDzciKDlV3v5WKY1c6N+3KGTpstTKIxh4xN7ctIgiYbmEp/yUR5ZN6cVMbctZgciXP24rByOY
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_478C4829CCAF495B860E6BA3D86AA47Darmcom_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2970
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966005)(53546011)(186003)(47076004)(36756003)(478600001)(356005)(6486002)(21615005)(336012)(70206006)(26005)(6512007)(966005)(4326008)(2616005)(6862004)(107886003)(45080400002)(6506007)(33656002)(70586007)(30864003)(86362001)(8676002)(5660300002)(82310400002)(166002)(8936002)(81166007)(2906002)(36906005)(82740400003)(316002)(15650500001)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: fd4d273e-d2db-4e55-4aed-08d7f8a3124f
X-Forefront-PRVS: 04041A2886
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9yqDkwFz0/mJIk3WHoUiNl+wAGuz7vYU/NnyxH8Xhj01jzi9KB3cJHivkzfU3UqtLQOpfXQytRLIysmEjkXM/cfh+hclqYWHDKN8DS5H8OaK5YCPCaS4R9wrHg0Rp9vGSfG6EjgHXT/LJKfdXx2cAEZRNTeqy1R9cJXIspYQj7L90ltkxbRMUBINgRBVucLTYgjLJPWxTQgjJiHUHgL9LDxNJTk0c5YiblTmnfO7NX10u4JbHxrlHoZElZ1AVKYwA3AaeASObY/TOZNoh1UCogA45B4lrkyNbPUm1z726E+OodkrpPYaPM3mKON7Jhw3ZbODjTspEMYigv8yG0VAy0hQIf0A4CQNafzUiURU+Hw8+Hm8TmRH+5/FK6bsCPif5RbVB1MEd/3ehbKqjKmrfVVKnlBTCB8sSglfDBxZUKGROyBorLVq0oUXzHNyqwOCiWqp09miJhuVdCfhqw7rk/pLXwaFLHE5ODDp+6qimy/wV7Ff+4jJaHkwLM6y8zt80XApf1zfWUQamvwwig89U2Vwz/GnixLZi4eWotvF0fUcUbzRm62Pr4ASl9sRVpXm8+T3S/yGRtvjEo5I1Le3qxPjLbzgRzRizvEqj7kludo=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2020 07:39:24.3210 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62716e4c-0fc2-45ec-4ade-08d7f8a316f2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2837
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, nd <nd@arm.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--_000_478C4829CCAF495B860E6BA3D86AA47Darmcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On 14 May 2020, at 20:13, Julien Grall <julien.grall.oss@gmail.com<mailto:j=
ulien.grall.oss@gmail.com>> wrote:

On Thu, 14 May 2020 at 19:12, Andrew Cooper <andrew.cooper3@citrix.com<mail=
to:andrew.cooper3@citrix.com>> wrote:

On 14/05/2020 18:38, Julien Grall wrote:
Hi,

On 14/05/2020 17:18, Bertrand Marquis wrote:


On 14 May 2020, at 16:57, Julien Grall <julien@xen.org<mailto:julien@xen.or=
g>> wrote:



On 14/05/2020 15:28, Bertrand Marquis wrote:
Hi,

Hi,

When executing linux on arm64 with KPTI activated (in Dom0 or in a
DomU), I have a lot of walk page table errors like this:
(XEN) p2m.c:1890: d1v0: Failed to walk page-table va
0xffffff837ebe0cd0
After implementing a call trace, I found that the problem was
coming from the update_runstate_area when linux has KPTI activated.
I have the following call trace:
(XEN) p2m.c:1890: d1v0: Failed to walk page-table va
0xffffff837ebe0cd0
(XEN) backtrace.c:29: Stacktrace start at 0x8007638efbb0 depth 10
(XEN)    [<000000000027780c>] get_page_from_gva+0x180/0x35c
(XEN)    [<00000000002700c8>] guestcopy.c#copy_guest+0x1b0/0x2e4
(XEN)    [<0000000000270228>] raw_copy_to_guest+0x2c/0x34
(XEN)    [<0000000000268dd0>] domain.c#update_runstate_area+0x90/0xc8
(XEN)    [<000000000026909c>] domain.c#schedule_tail+0x294/0x2d8
(XEN)    [<0000000000269524>] context_switch+0x58/0x70
(XEN)    [<00000000002479c4>] core.c#sched_context_switch+0x88/0x1e4
(XEN)    [<000000000024845c>] core.c#schedule+0x224/0x2ec
(XEN)    [<0000000000224018>] softirq.c#__do_softirq+0xe4/0x128
(XEN)    [<00000000002240d4>] do_softirq+0x14/0x1c
Discussing this subject with Stefano, he pointed me to a discussion
started a year ago on this subject here:
https://lists.xenproject.org/archives/html/xen-devel/2018-11/msg03053.html

And a patch was submitted:
https://lists.xenproject.org/archives/html/xen-devel/2019-05/msg02320.html

I rebased this patch on current master and it is solving the
problem I have seen.
It sounds to me like a good solution to introduce a
VCPUOP_register_runstate_phys_memory_area to not depend on the area
actually being mapped in the guest when a context switch is being
done (which is actually the problem happening when a context switch
is trigger while a guest is running in EL0).
Is there any reason why this was not merged at the end ?

I just skimmed through the thread to remind myself the state.
AFAICT, this is blocked on the contributor to clarify the intended
interaction and provide a new version.

What do you mean here by intended interaction ? How the new hyper
call should be used by the guest OS ?

From what I remember, Jan was seeking clarification on whether the two
hypercalls (existing and new) can be called together by the same OS
(and make sense).

There was also the question of the handover between two pieces of
sotfware. For instance, what if the firmware is using the existing
interface but the OS the new one? Similar question about Kexecing a
different kernel.

This part is mostly documentation so we can discuss about the approach
and review the implementation.



I am still in favor of the new hypercall (and still in my todo list)
but I haven't yet found time to revive the series.

Would you be willing to take over the series? I would be happy to
bring you up to speed and provide review.

Sure I can take it over.

I ported it to master version of xen and I tested it on a board.
I still need to do a deep review of the code myself but I have an
understanding of the problem and what is the idea.

Any help to get on speed would be more then welcome :-)
I would recommend to go through the latest version (v3) and the
previous (v2). I am also suggesting v2 because I think the split was
easier to review/understand.

The x86 code is probably what is going to give you the most trouble as
there are two ABIs to support (compat and non-compat). If you don't
have an x86 setup, I should be able to test it/help write it.

Feel free to ask any questions and I will try my best to remember the
discussion from last year :).

At risk of being shouted down again, a new hypercall isn't necessarily
necessary, and there are probably better ways of fixing it.

The underlying ABI problem is that the area is registered by virtual
address.  The only correct way this should have been done is to register
by guest physical address, so Xen's updating of the data doesn't
interact with the guest pagetable settings/restrictions.  x86 suffers
the same kind of problems as ARM, except we silently squash the fallout.

The logic in Xen is horrible, and I would really rather it was deleted
completely, rather than to be kept for compatibility.

The runstate area is always fixed kernel memory and doesn't move.  I
believe it is already restricted from crossing a page boundary, and we
can calculate the va=3D>pa translation when the hypercall is made.

Yes - this is a technically ABI change, but nothing is going to break
(AFAICT) and the cleanup win is large enough to make this a *very*
attractive option.

I suggested this approach two years ago [1] but you were the one
saying that buffer could cross page-boundary on older Linux [2]:

"I'd love to do this, but we cant.  Older Linux used to have a virtual
buffer spanning a page boundary.  Changing the behaviour under that will
cause older setups to explode."

So can you explain your change of heart here?


I would prefer to fix it like this, (perhaps adding a new hypercall
which explicitly takes a guest physical address), than to keep any of
this mess around forever more to cope with legacy guests.

What does legacy guests mean? Is it PV 32-bit or does it also include some =
HVM?

Reading all this and digging into the code, the meaning full implementation=
 would definitely be to validate and translate the address when during the =
hypercall handling and then to just reuse this address along the way.
Wether or not the guest is passing a virtual address (versus an intermediat=
e physical) and creating a new hyper call for this might be a different que=
stion that we could handle separatly.
Does anyone see something wrong with such an approach ?

Answer myself:
There might be the corner case where the physical area is actually can be r=
emoved from the guest (ie a guest using some memory coming from a temporary=
 mapped area).
Would there be a way to check that during the hypercall ?

Cheers
Bertrand



Cheers,

[1] <3a77a293-1a29-42ed-8fc0-a74bda213b92@arm.com<mailto:3a77a293-1a29-42ed=
-8fc0-a74bda213b92@arm.com>>
[2] <dc80422f-80bb-bd37-ed41-bb6559f4d7d8@citrix.com<mailto:dc80422f-80bb-b=
d37-ed41-bb6559f4d7d8@citrix.com>>


--_000_478C4829CCAF495B860E6BA3D86AA47Darmcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <398C66BC003CCA4E8C49E38C8BC3253B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 14 May 2020, at 20:13, Julien Grall &lt;<a href=3D"mailt=
o:julien.grall.oss@gmail.com" class=3D"">julien.grall.oss@gmail.com</a>&gt;=
 wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helv=
etica; font-size: 12px; font-style: normal; font-variant-caps: normal; font=
-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0p=
x; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; text-decoration: none; float: none; display: inline !=
important;" class=3D"">On
 Thu, 14 May 2020 at 19:12, Andrew Cooper &lt;</span><a href=3D"mailto:andr=
ew.cooper3@citrix.com" style=3D"font-family: Helvetica; font-size: 12px; fo=
nt-style: normal; font-variant-caps: normal; font-weight: normal; letter-sp=
acing: normal; orphans: auto; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit=
-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" class=3D"">andrew=
.cooper3@citrix.com</a><span style=3D"caret-color: rgb(0, 0, 0); font-famil=
y: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: norma=
l; font-weight: normal; letter-spacing: normal; text-align: start; text-ind=
ent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; text-decoration: none; float: none; display: i=
nline !important;" class=3D"">&gt;
 wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetic=
a; font-size: 12px; font-style: normal; font-variant-caps: normal; font-wei=
ght: normal; letter-spacing: normal; text-align: start; text-indent: 0px; t=
ext-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-s=
troke-width: 0px; text-decoration: none;" class=3D"">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; widows: auto; word-spacing: 0px; -web=
kit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration=
: none;" class=3D"">
<br class=3D"">
On 14/05/2020 18:38, Julien Grall wrote:<br class=3D"">
<blockquote type=3D"cite" class=3D"">Hi,<br class=3D"">
<br class=3D"">
On 14/05/2020 17:18, Bertrand Marquis wrote:<br class=3D"">
<blockquote type=3D"cite" class=3D""><br class=3D"">
<br class=3D"">
<blockquote type=3D"cite" class=3D"">On 14 May 2020, at 16:57, Julien Grall=
 &lt;<a href=3D"mailto:julien@xen.org" class=3D"">julien@xen.org</a>&gt; wr=
ote:<br class=3D"">
<br class=3D"">
<br class=3D"">
<br class=3D"">
On 14/05/2020 15:28, Bertrand Marquis wrote:<br class=3D"">
<blockquote type=3D"cite" class=3D"">Hi,<br class=3D"">
</blockquote>
<br class=3D"">
Hi,<br class=3D"">
<br class=3D"">
<blockquote type=3D"cite" class=3D"">When executing linux on arm64 with KPT=
I activated (in Dom0 or in a<br class=3D"">
DomU), I have a lot of walk page table errors like this:<br class=3D"">
(XEN) p2m.c:1890: d1v0: Failed to walk page-table va<br class=3D"">
0xffffff837ebe0cd0<br class=3D"">
After implementing a call trace, I found that the problem was<br class=3D""=
>
coming from the update_runstate_area when linux has KPTI activated.<br clas=
s=3D"">
I have the following call trace:<br class=3D"">
(XEN) p2m.c:1890: d1v0: Failed to walk page-table va<br class=3D"">
0xffffff837ebe0cd0<br class=3D"">
(XEN) backtrace.c:29: Stacktrace start at 0x8007638efbb0 depth 10<br class=
=3D"">
(XEN) &nbsp;&nbsp;&nbsp;[&lt;000000000027780c&gt;] get_page_from_gva&#43;0x=
180/0x35c<br class=3D"">
(XEN) &nbsp;&nbsp;&nbsp;[&lt;00000000002700c8&gt;] guestcopy.c#copy_guest&#=
43;0x1b0/0x2e4<br class=3D"">
(XEN) &nbsp;&nbsp;&nbsp;[&lt;0000000000270228&gt;] raw_copy_to_guest&#43;0x=
2c/0x34<br class=3D"">
(XEN) &nbsp;&nbsp;&nbsp;[&lt;0000000000268dd0&gt;] domain.c#update_runstate=
_area&#43;0x90/0xc8<br class=3D"">
(XEN) &nbsp;&nbsp;&nbsp;[&lt;000000000026909c&gt;] domain.c#schedule_tail&#=
43;0x294/0x2d8<br class=3D"">
(XEN) &nbsp;&nbsp;&nbsp;[&lt;0000000000269524&gt;] context_switch&#43;0x58/=
0x70<br class=3D"">
(XEN) &nbsp;&nbsp;&nbsp;[&lt;00000000002479c4&gt;] core.c#sched_context_swi=
tch&#43;0x88/0x1e4<br class=3D"">
(XEN) &nbsp;&nbsp;&nbsp;[&lt;000000000024845c&gt;] core.c#schedule&#43;0x22=
4/0x2ec<br class=3D"">
(XEN) &nbsp;&nbsp;&nbsp;[&lt;0000000000224018&gt;] softirq.c#__do_softirq&#=
43;0xe4/0x128<br class=3D"">
(XEN) &nbsp;&nbsp;&nbsp;[&lt;00000000002240d4&gt;] do_softirq&#43;0x14/0x1c=
<br class=3D"">
Discussing this subject with Stefano, he pointed me to a discussion<br clas=
s=3D"">
started a year ago on this subject here:<br class=3D"">
<a href=3D"https://lists.xenproject.org/archives/html/xen-devel/2018-11/msg=
03053.html" class=3D"">https://lists.xenproject.org/archives/html/xen-devel=
/2018-11/msg03053.html</a><br class=3D"">
<br class=3D"">
And a patch was submitted:<br class=3D"">
https://lists.xenproject.org/archives/html/xen-devel/2019-05/msg02320.html<=
br class=3D"">
<br class=3D"">
I rebased this patch on current master and it is solving the<br class=3D"">
problem I have seen.<br class=3D"">
It sounds to me like a good solution to introduce a<br class=3D"">
VCPUOP_register_runstate_phys_memory_area to not depend on the area<br clas=
s=3D"">
actually being mapped in the guest when a context switch is being<br class=
=3D"">
done (which is actually the problem happening when a context switch<br clas=
s=3D"">
is trigger while a guest is running in EL0).<br class=3D"">
Is there any reason why this was not merged at the end ?<br class=3D"">
</blockquote>
<br class=3D"">
I just skimmed through the thread to remind myself the state.<br class=3D""=
>
AFAICT, this is blocked on the contributor to clarify the intended<br class=
=3D"">
interaction and provide a new version.<br class=3D"">
</blockquote>
<br class=3D"">
What do you mean here by intended interaction ? How the new hyper<br class=
=3D"">
call should be used by the guest OS ?<br class=3D"">
</blockquote>
<br class=3D"">
From what I remember, Jan was seeking clarification on whether the two<br c=
lass=3D"">
hypercalls (existing and new) can be called together by the same OS<br clas=
s=3D"">
(and make sense).<br class=3D"">
<br class=3D"">
There was also the question of the handover between two pieces of<br class=
=3D"">
sotfware. For instance, what if the firmware is using the existing<br class=
=3D"">
interface but the OS the new one? Similar question about Kexecing a<br clas=
s=3D"">
different kernel.<br class=3D"">
<br class=3D"">
This part is mostly documentation so we can discuss about the approach<br c=
lass=3D"">
and review the implementation.<br class=3D"">
<br class=3D"">
<blockquote type=3D"cite" class=3D""><br class=3D"">
<blockquote type=3D"cite" class=3D""><br class=3D"">
I am still in favor of the new hypercall (and still in my todo list)<br cla=
ss=3D"">
but I haven't yet found time to revive the series.<br class=3D"">
<br class=3D"">
Would you be willing to take over the series? I would be happy to<br class=
=3D"">
bring you up to speed and provide review.<br class=3D"">
</blockquote>
<br class=3D"">
Sure I can take it over.<br class=3D"">
<br class=3D"">
I ported it to master version of xen and I tested it on a board.<br class=
=3D"">
I still need to do a deep review of the code myself but I have an<br class=
=3D"">
understanding of the problem and what is the idea.<br class=3D"">
<br class=3D"">
Any help to get on speed would be more then welcome :-)<br class=3D"">
</blockquote>
I would recommend to go through the latest version (v3) and the<br class=3D=
"">
previous (v2). I am also suggesting v2 because I think the split was<br cla=
ss=3D"">
easier to review/understand.<br class=3D"">
<br class=3D"">
The x86 code is probably what is going to give you the most trouble as<br c=
lass=3D"">
there are two ABIs to support (compat and non-compat). If you don't<br clas=
s=3D"">
have an x86 setup, I should be able to test it/help write it.<br class=3D""=
>
<br class=3D"">
Feel free to ask any questions and I will try my best to remember the<br cl=
ass=3D"">
discussion from last year :).<br class=3D"">
</blockquote>
<br class=3D"">
At risk of being shouted down again, a new hypercall isn't necessarily<br c=
lass=3D"">
necessary, and there are probably better ways of fixing it.<br class=3D"">
<br class=3D"">
The underlying ABI problem is that the area is registered by virtual<br cla=
ss=3D"">
address. &nbsp;The only correct way this should have been done is to regist=
er<br class=3D"">
by guest physical address, so Xen's updating of the data doesn't<br class=
=3D"">
interact with the guest pagetable settings/restrictions. &nbsp;x86 suffers<=
br class=3D"">
the same kind of problems as ARM, except we silently squash the fallout.<br=
 class=3D"">
<br class=3D"">
The logic in Xen is horrible, and I would really rather it was deleted<br c=
lass=3D"">
completely, rather than to be kept for compatibility.<br class=3D"">
<br class=3D"">
The runstate area is always fixed kernel memory and doesn't move. &nbsp;I<b=
r class=3D"">
believe it is already restricted from crossing a page boundary, and we<br c=
lass=3D"">
can calculate the va=3D&gt;pa translation when the hypercall is made.<br cl=
ass=3D"">
<br class=3D"">
Yes - this is a technically ABI change, but nothing is going to break<br cl=
ass=3D"">
(AFAICT) and the cleanup win is large enough to make this a *very*<br class=
=3D"">
attractive option.<br class=3D"">
</blockquote>
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">I
 suggested this approach two years ago [1] but you were the one</span><br s=
tyle=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; text-align: start; text-indent: 0px; text-transform: none=
; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; t=
ext-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">saying
 that buffer could cross page-boundary on older Linux [2]:</span><br style=
=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fon=
t-style: normal; font-variant-caps: normal; font-weight: normal; letter-spa=
cing: normal; text-align: start; text-indent: 0px; text-transform: none; wh=
ite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-=
decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">&quot;I'd
 love to do this, but we cant. &nbsp;Older Linux used to have a virtual</sp=
an><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">buffer
 spanning a page boundary. &nbsp;Changing the behaviour under that will</sp=
an><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">cause
 older setups to explode.&quot;</span><br style=3D"caret-color: rgb(0, 0, 0=
); font-family: Helvetica; font-size: 12px; font-style: normal; font-varian=
t-caps: normal; font-weight: normal; letter-spacing: normal; text-align: st=
art; text-indent: 0px; text-transform: none; white-space: normal; word-spac=
ing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"=
">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">So
 can you explain your change of heart here?</span><br style=3D"caret-color:=
 rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal;=
 font-variant-caps: normal; font-weight: normal; letter-spacing: normal; te=
xt-align: start; text-indent: 0px; text-transform: none; white-space: norma=
l; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none=
;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; widows: auto; word-spacing: 0px; -web=
kit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration=
: none;" class=3D"">
<br class=3D"">
I would prefer to fix it like this, (perhaps adding a new hypercall<br clas=
s=3D"">
which explicitly takes a guest physical address), than to keep any of<br cl=
ass=3D"">
this mess around forever more to cope with legacy guests.<br class=3D"">
</blockquote>
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">What
 does legacy guests mean? Is it PV 32-bit or does it also include some HVM?=
</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font=
-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: no=
rmal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-w=
idth: 0px; text-decoration: none;" class=3D"">
</div>
</blockquote>
<div><br class=3D"">
</div>
<div>Reading all this and digging into the code, the meaning full implement=
ation would definitely be to validate and translate the address when during=
 the hypercall handling and then to just reuse this address along the way.<=
/div>
<div>Wether or not the guest is passing a virtual address (versus an interm=
ediate physical) and creating a new hyper call for this might be a differen=
t question that we could handle separatly.</div>
<div>Does anyone see something wrong with such an approach ?</div>
<div><br class=3D"">
</div>
<div>Answer myself:</div>
<div>There might be the corner case where the physical area is actually can=
 be removed from the guest (ie a guest using some memory coming from a temp=
orary mapped area).</div>
<div>Would there be a way to check that during the hypercall ?</div>
<div><br class=3D"">
</div>
<div>Cheers</div>
<div>Bertrand</div>
<div><br class=3D"">
</div>
<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvet=
ica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-w=
eight: normal; letter-spacing: normal; text-align: start; text-indent: 0px;=
 text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">Cheers,</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: H=
elvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; f=
ont-weight: normal; letter-spacing: normal; text-align: start; text-indent:=
 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit=
-text-stroke-width: 0px; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">[1]
 &lt;</span><a href=3D"mailto:3a77a293-1a29-42ed-8fc0-a74bda213b92@arm.com"=
 style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; font=
-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans=
: auto; text-align: start; text-indent: 0px; text-transform: none; white-sp=
ace: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: aut=
o; -webkit-text-stroke-width: 0px;" class=3D"">3a77a293-1a29-42ed-8fc0-a74b=
da213b92@arm.com</a><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; text-indent=
: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webki=
t-text-stroke-width: 0px; text-decoration: none; float: none; display: inli=
ne !important;" class=3D"">&gt;</span><br style=3D"caret-color: rgb(0, 0, 0=
); font-family: Helvetica; font-size: 12px; font-style: normal; font-varian=
t-caps: normal; font-weight: normal; letter-spacing: normal; text-align: st=
art; text-indent: 0px; text-transform: none; white-space: normal; word-spac=
ing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"=
">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">[2]
 &lt;</span><a href=3D"mailto:dc80422f-80bb-bd37-ed41-bb6559f4d7d8@citrix.c=
om" style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; f=
ont-variant-caps: normal; font-weight: normal; letter-spacing: normal; orph=
ans: auto; text-align: start; text-indent: 0px; text-transform: none; white=
-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px;" class=3D"">dc80422f-80bb-bd37-ed41-b=
b6559f4d7d8@citrix.com</a><span style=3D"caret-color: rgb(0, 0, 0); font-fa=
mily: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: no=
rmal; font-weight: normal; letter-spacing: normal; text-align: start; text-=
indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; display=
: inline !important;" class=3D"">&gt;</span></div>
</blockquote>
</div>
<br class=3D"">
</body>
</html>

--_000_478C4829CCAF495B860E6BA3D86AA47Darmcom_--

