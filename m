Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A68F6234169
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 10:43:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1QdZ-0006Ir-Vv; Fri, 31 Jul 2020 08:43:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uPNw=BK=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1k1QdY-0006Im-Id
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 08:43:32 +0000
X-Inumbo-ID: e8c3194e-d309-11ea-ab92-12813bfff9fa
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (unknown
 [40.107.11.128]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e8c3194e-d309-11ea-ab92-12813bfff9fa;
 Fri, 31 Jul 2020 08:43:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=llZUv53o5b8jUJ0AmKPYkv+AJKoj4Ec40emHe+5s4EQLxX7Z2lLPoIfrbjZFdEhOs6K/NosTkNosH9cTS2bIJQyKhiPiGgK+JvsCGW2XvMv4iRg+DQRc9Z7o8Ke/ruf7jhaf0zooMZEhyfbuSJQhmkP0DUketsZZlupQJJpdTKXCk2ycVoro9SjZVgk7DwF1XQSJjQvctZVPWtWPbovHqSQa6HX3Xq/wdmG8OpqPlapOx9Fa1yF6rdadL/N3+xD/5voNUxQhKqCGnjtNiXfGmwuCal3BGNxCOPGJGR07WagIXYSPMxgvLQ85MT/owiDLpLTe23iBndyvMBbz6dd3Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLoaLEe6EYFmh7sY8j42lkXdpWwKkOT+yOFnO8lzP2Y=;
 b=FKVO2xndzcLPSLHi+JqtETX71wfgN9lRKd7GsYfNNIZSVsYuS55v08uF0R9PSsuJkeG8twURfYXobalGtjH+3c5lmzFnDDvl3gOym5YkDMOXUgyMszpiL84FImatTRZbyHaRU3fdkoKzrufDIopEwxiGs3qVI01qCYEdaME1M7cfRAHoy8xEf6bJQNLavE2YQYka8NihSFEUZZ1Yxxdg2GkzsEA7rA8M2Q/c9NYDkhqR1hl9lULK4Mi66o9DPLF4+XdbCWvK129S5nOQcNiSzy0b90IhM3JEyxyCL8EvdMDRGTPeR6biEq9KbNzrkU6unzIQgdMXTeZh1u5kq+x4Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=durham.ac.uk; dmarc=pass action=none header.from=durham.ac.uk;
 dkim=pass header.d=durham.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=durhamuniversity.onmicrosoft.com;
 s=selector2-durhamuniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLoaLEe6EYFmh7sY8j42lkXdpWwKkOT+yOFnO8lzP2Y=;
 b=QjQbwpktUMWHNlwqAtJILFUBlHbluqucaHqA0mWVnSHbdkViwfbqO2GuC3vGzu+AsHT3nhWrvmd05GWxW2JYoMRi1uG/zSFZrT1sg/lww7caEyDZgZnTf61RGgdHCODrvlaEscmo/kxRJ4NOZwsQJgvXkid/v4hTjdfZSD9XCAs=
Authentication-Results: knorrie.org; dkim=none (message not signed)
 header.d=none;knorrie.org; dmarc=none action=none header.from=durham.ac.uk;
Received: from CWLP265MB1634.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:32::19)
 by CWXP265MB0597.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.24; Fri, 31 Jul 2020 08:43:28 +0000
Received: from CWLP265MB1634.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6114:a769:8565:1a70]) by CWLP265MB1634.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6114:a769:8565:1a70%4]) with mapi id 15.20.3216.034; Fri, 31 Jul 2020
 08:43:28 +0000
Date: Fri, 31 Jul 2020 09:43:25 +0100 (BST)
From: Michael Young <m.a.young@durham.ac.uk>
X-X-Sender: michael@austen3.home
To: Hans van Kranenburg <hans@knorrie.org>
Subject: =?GB2312?Q?Re=3A_4=2E14=2E0_FTBFS_for_Debian_unstable=2C_libx?=
 =?GB2312?Q?lu=5Fpci=2Ec_=28=A8s=A1=E3=A1=F5=A1=E3=A3=A9=A8s=A6=E0_=A9?=
 =?GB2312?Q?=DF=A9=A5=A9=DF?=
In-Reply-To: <dab05ef3-4ce8-2177-893d-61168d897821@knorrie.org>
Message-ID: <alpine.LFD.2.23.451.2007310933040.2862@austen3.home>
References: <dab05ef3-4ce8-2177-893d-61168d897821@knorrie.org>
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-ClientProxiedBy: LO2P265CA0269.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::17) To CWLP265MB1634.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:401:32::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from broadband.bt.com (2a00:23c4:921a:2100:1097:224c:243b:f186) by
 LO2P265CA0269.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a1::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.16 via Frontend Transport; Fri, 31 Jul 2020 08:43:27 +0000
X-X-Sender: michael@austen3.home
X-Originating-IP: [2a00:23c4:921a:2100:1097:224c:243b:f186]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 366669bb-933e-482c-ec81-08d8352dcb5e
X-MS-TrafficTypeDiagnostic: CWXP265MB0597:
X-Microsoft-Antispam-PRVS: <CWXP265MB0597AF64D316812CBA5195D5874E0@CWXP265MB0597.GBRP265.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GM8fARhmYusFECbOhI0hQZuuuaUZdweSNP9GOTXvnNh+pCTiRKTxVSCq+6NWO/YEYng1FUcntMMpWhB2v/ZMt0de0AuSY8/IVy4rhLMIoTs4/Ezlngu+OzYsKwoLAFQgk2SA3D6MD/rWJTIzsEzRxzBr0TnerPnd66Wr99krZVIYxB6tAOPQcYguhFLaiHfUEuRooXBWxxEtDG9G5ECBxauTLun1NrQGHUZqtJAaaTrm9xDYPkkhRZsdc7PjopTw0c2Ye/C+H1zcXoPAHRGXjLRciny/xuSzMB2ZnYk6eLFcDmbl2/i3Zh/kASsj2ch9LEU9hSWAivB24pfgOLqfwzybUJZiBfAAcgPmGVaIwM/niPVenmDAbESHfPC2ek7H9jA2OleyibI1/Rkmur4kSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB1634.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(8936002)(186003)(6506007)(966005)(16526019)(478600001)(83380400001)(66946007)(86362001)(36756003)(52116002)(6512007)(9686003)(5660300002)(786003)(6486002)(2906002)(6916009)(66476007)(4326008)(316002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: CKs9E5Sg8uMOcuvE9YP48MLjHxcb30g5/IVa1E+r+WXTUniwfajorP0HS652DBZVKHJhzEqwR+VtyrNvXAdP1t+NO2fb7Exj+qJpV2oMt0DcHltcROMtFHcggk6G3OQ+ESZAK2Wu6xYGzcVxvFtZST3bEApS7ITdoP0LX6/nAvYfAwgKWHXNDHdbwfi4SaSY3xCx8ntOroQFvwjjLl6SvYOorDRio28qyfm9MlI4N105vaYBVU4uy/J46XtAglTYQFXT5MLhCcQvT/SJAx/iZUjafRBQhU+Wwq1rybQHESHh1gdiJGM/h2pjiH0dGqtTTs03RCIU50AJk+bafogB4VgXdnt9bt8BuaGA1q+nxRH4vPiHlBIGVlF1oH+WPb28slSaXJxadfXl+n1vS+2oM0A/WdjFLPtBkJXe5FSUPxkb39f9Om4x3h5yhdduK7sXWamzNwh4U5rxbErk1MN5+qSqe/EFP8pMMJr8RcVZGSwucEbo7/GlHZaJaEBtV+PBpklMgKGxo6rEKpXIAV9+Yo83ecV0bRNXmzVc8Zuk28o=
X-OriginatorOrg: durham.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: 366669bb-933e-482c-ec81-08d8352dcb5e
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB1634.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 08:43:28.0748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7250d88b-4b68-4529-be44-d59a2d8a6f94
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mpR3ZvbhLVWxu0fzlYKjoOOPu7xQW+qj7RMWH3ZPWv4xtxY6KIzLUukugUDct4voieJ08kijzzPwXZ37KhE6uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB0597
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 31 Jul 2020, Hans van Kranenburg wrote:

> Hi!
>
> News from the Debian Xen team (well, that's still only Ian and me). We
> still have Xen 4.11 in Debian unstable and stable (Buster) now, but at
> this point I really want to start working on the preparations for the
> next Debian release which will happen in about a little bit less than a
> year from now.
>
> So, the 4.14.0 release is a good moment to kick it off. In february 2020
> Ian and I already spent a day to move the Debian packaging to 4.13, and
> the result has been laying around for a bit. Now I'm forwarding it to
> 4.14.0 and I really want to get this in Debian so users can start
> playing around with it and have enough time to either contribute new
> things (like cross-building for raspberry pi4!) etc.
>
> All the yolo WIP stuff without anything cleaned up is here:
> https://salsa.debian.org/xen-team/debian-xen/-/commits/knorrie/4.14
>
> Unfortunately, it FTBFS in an unexpected way, since I cannot relate this
> to any of our additional patches or anything.
>
> This is the last part of the output with the failure:
>
> ---- >8 ----
>
> gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall
> -Wstrict-prototypes -Wdeclaration-after-statement
> -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O2
> -fomit-frame-pointer
> -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__ -MMD -MP
> -MF .libxlu_pci.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE  -g -O2
> -fdebug-prefix-map=/home/knorrie/build/xen/debian-xen=.
> -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time
> -D_FORTIFY_SOURCE=2 -Werror -Wno-format-zero-length
> -Wmissing-declarations -Wno-declaration-after-statement
> -Wformat-nonliteral -I. -fPIC -pthread
> -I/home/knorrie/build/xen/debian-xen/tools/libxl/../../tools/libxc/include
> -I/home/knorrie/build/xen/debian-xen/tools/libxl/../../tools/libs/toollog/include
> -I/home/knorrie/build/xen/debian-xen/tools/libxl/../../tools/include
> -I/home/knorrie/build/xen/debian-xen/tools/libxl/../../tools/libs/foreignmemory/include
> -I/home/knorrie/build/xen/debian-xen/tools/libxl/../../tools/include
> -I/home/knorrie/build/xen/debian-xen/tools/libxl/../../tools/libs/devicemodel/include
> -I/home/knorrie/build/xen/debian-xen/tools/libxl/../../tools/include
> -I/home/knorrie/build/xen/debian-xen/tools/libxl/../../tools/include
> -D__XEN_TOOLS__   -c -o libxlu_pci.o libxlu_pci.c
> libxlu_pci.c: In function 'xlu_pci_parse_bdf':
> libxlu_pci.c:32:18: error: 'func' may be used uninitialized in this
> function [-Werror=maybe-uninitialized]
>   32 |     pcidev->func = func;
>      |     ~~~~~~~~~~~~~^~~~~~
> libxlu_pci.c:51:29: note: 'func' was declared here
>   51 |     unsigned dom, bus, dev, func, vslot = 0;
>      |                             ^~~~
> libxlu_pci.c:31:17: error: 'dev' may be used uninitialized in this
> function [-Werror=maybe-uninitialized]
>   31 |     pcidev->dev = dev;
>      |     ~~~~~~~~~~~~^~~~~
> libxlu_pci.c:51:24: note: 'dev' was declared here
>   51 |     unsigned dom, bus, dev, func, vslot = 0;
>      |                        ^~~
> libxlu_pci.c:30:17: error: 'bus' may be used uninitialized in this
> function [-Werror=maybe-uninitialized]
>   30 |     pcidev->bus = bus;
>      |     ~~~~~~~~~~~~^~~~~
> libxlu_pci.c:51:19: note: 'bus' was declared here
>   51 |     unsigned dom, bus, dev, func, vslot = 0;
>      |                   ^~~
> libxlu_pci.c:29:20: error: 'dom' may be used uninitialized in this
> function [-Werror=maybe-uninitialized]
>   29 |     pcidev->domain = domain;
>      |     ~~~~~~~~~~~~~~~^~~~~~~~
> libxlu_pci.c:51:14: note: 'dom' was declared here
>   51 |     unsigned dom, bus, dev, func, vslot = 0;
>      |              ^~~

That looks like an issue I saw in Fedora which I associated to the update 
to gcc 10. It is one of the things I fixed (or at least worked around) in 
the patch here 
https://src.fedoraproject.org/rpms/xen/blob/master/f/xen.gcc10.fixes.patch

 	Michael Young

