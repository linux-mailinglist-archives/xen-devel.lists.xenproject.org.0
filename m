Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A2C20FFFF
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 00:22:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqOdR-0007mO-Pq; Tue, 30 Jun 2020 22:21:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5yky=AL=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1jqOdQ-0007mJ-7H
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 22:21:48 +0000
X-Inumbo-ID: 15432312-bb20-11ea-86a4-12813bfff9fa
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (unknown
 [40.107.10.113]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15432312-bb20-11ea-86a4-12813bfff9fa;
 Tue, 30 Jun 2020 22:21:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QlVADUyp02L4liYBJT+4Wfh54VZXXIefrz5iOo2QzrAfTWVbc4i6DHrXq6ohNFIJD8N9StyBaf4ZODmk/nLh/ggSGE9SXimqBFzag5Z7018PsGBF5PbEt5OGYVbqnWYRwOJ4xM09ot/polQiZYy2AS6Zoavhwp//pELMcaY+CZsbzKZCrFO05L/9EE9OPhFsErthisR1J+nxuDDOHKG3gym+RWjuEV7si92sxMZU11oogZRGfgChCGK1adwJ15H1l6MVgnXpt2KL3TTCj5w5NjCpPWORFalvudmcULVxRakE8WC1/QuUH5tOfjCMAJsuAocKGCCgQ0z+PqH4pPYjhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bZaYZ3iWlRtW7dKIEC/KR6HBTcOrwUs3Zqf1StHpjY=;
 b=lX35n+NW8q8QsPx8zGUJe4awpC5i1p6vbr/9Xnqd3F+CUXdKlDqJCd5yioR9lLsP2Qdf9NjuYUra8A9nqYn61KnRU9qrrPuEjDn4YcivohIhGLe/uHokcBVfryHufhW2jC2K0Mi8h68YBTZfO+MhGb54teQFy6UHRFcZuLP5uyFoZVfS88S13rXtYqFnEDaMQ0PwPUEKik9nxlcJ4iz1ANpbb0YrEi/FqI7ASeQCobDzg5qIJoGB7QCru2C6do9q+tjSdqQC9McQ640LqX0ZXuQ5TNm9NVK8Wav9pyzFx8lS1Bu4vn+wvULbTLc1JrPWr0bJ8fgYH7H6APcfIsloXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=durham.ac.uk; dmarc=pass action=none header.from=durham.ac.uk;
 dkim=pass header.d=durham.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=durhamuniversity.onmicrosoft.com;
 s=selector2-durhamuniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bZaYZ3iWlRtW7dKIEC/KR6HBTcOrwUs3Zqf1StHpjY=;
 b=VnMtykoTTjZJKSTQdKx3Qd2w7EwHpilIkUZm6F2Tjrh35QxwTV23sUFvdo1aiokmw5orpUxn0xFYeSxVLF4kECCro6fpggbWrTY3Hbkl5CnJ1Tpq1X+bvGY7CPgikZtnsM3kXKrhuvVRjvi8GMlivTgND8yITkP3gQDt4JnHfJY=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=durham.ac.uk;
Received: from CWLP265MB1634.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:32::19)
 by CWLP265MB1027.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:2c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Tue, 30 Jun
 2020 22:21:44 +0000
Received: from CWLP265MB1634.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d4cb:ad6a:b891:13d8]) by CWLP265MB1634.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d4cb:ad6a:b891:13d8%6]) with mapi id 15.20.3131.028; Tue, 30 Jun 2020
 22:21:44 +0000
Date: Tue, 30 Jun 2020 23:21:36 +0100 (BST)
From: Michael Young <m.a.young@durham.ac.uk>
X-X-Sender: michael@austen3.home
To: xen-devel@lists.xenproject.org
Subject: Build problems in kdd.c with xen-4.14.0-rc4 
Message-ID: <alpine.LFD.2.22.394.2006302259370.2894@austen3.home>
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-ClientProxiedBy: LO2P265CA0440.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::20) To CWLP265MB1634.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:401:32::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from broadband.bt.com (2a00:23c4:921a:2100:1097:224c:243b:f186) by
 LO2P265CA0440.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Tue, 30 Jun 2020 22:21:43 +0000
X-X-Sender: michael@austen3.home
X-Originating-IP: [2a00:23c4:921a:2100:1097:224c:243b:f186]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd2cb3ee-4db0-425b-5ce0-08d81d43f839
X-MS-TrafficTypeDiagnostic: CWLP265MB1027:
X-Microsoft-Antispam-PRVS: <CWLP265MB10276F22E27DEB1217F1E52D876F0@CWLP265MB1027.GBRP265.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:146;
X-Forefront-PRVS: 0450A714CB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0E2EzV2v3neoelojHGDN+wtn0xpFNNF07yTui7efBV4aSavbH2kGLZYLRMq+HPbd/dkrVyALI9UkRIi/R5WASvMZXB79Im0iu5z1KkxDOAQUtoD3uaOYNsL2HZjtFYRFs3bOfKYY6eX7Sj9LWMZEnu36aIszjmW62PhQHuh5djlyo084vrDdeXXJELSbk6Oh12Mffb8omXXYiOITIJQfEepBpKMFgRECnxQGsdBJiBFcw2lV+6fdm5Mex9OobXVJ3JsQ4lv5mSOiZOSx9P0/MnWzGtE2tOYMT7K0u18XuUdJoMX8GU/sbhxcChe1a/fP6nxreWgaOc6FE0lRuEh3BC3PsTEdQA8RgCnsMIOO5co/aN+1WAeTcMqT1LyoqNYjl28Il212dCwhnClB4k8Rhw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB1634.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(5660300002)(52116002)(6506007)(36756003)(6486002)(6666004)(186003)(16526019)(478600001)(966005)(2906002)(83380400001)(8936002)(86362001)(66556008)(9686003)(6512007)(6916009)(4326008)(4743002)(66946007)(316002)(8676002)(66476007)(786003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: hmKWtnp1ytG5QZtNmb3ivyzJ4Fw83ilojBhFOpBTq6JydUTZOKYUqiu289mQ9MagQKz3iF7ODhGfe1UfS081BTUSweOc/jgd0jNl3AecSNxolGANxKLuNnAhOsFAScvqYMIAdn24rFLzvapCuviaqyzKKPy4JImDSmRw1XnPu6rNIKarsVCQd4x/+ZvqqeQjo5CScWaNBYpJ3K3fRZjepPtfbebFXPueR71Dx1JLQe75xnIyUc8QstbH/3LqKYgi+R+i9UPiD1CuwtcQPcMnLjv2CYgfKaG2CaeEle1jzIZiabRhI6Cev6iL1DMpGKsNJgU/OleQ/D+iGP2y6dgPRrsK6IjpBPFrPuD56UAVsouTNaoW8v58KycItvbCJ3mZSHe1LKjGggRQzQZNVh0ETTCGYupaa7/qcjTAlaCZuqY14pFY/s/a+p/8nOxlH9OC8L0uWYpE6AimT+I6KcYvIqYBG/oKsDHVlwr4jVUJMR9jcHQN46sqAGvZ9lYgImdk5nClNpLbMX3Fn5PUs3PuVhMc6VcIuj7A5wIe4J+0J9VfrV/jMbSPOik2iDAYT5+5
X-OriginatorOrg: durham.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: dd2cb3ee-4db0-425b-5ce0-08d81d43f839
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB1634.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2020 22:21:43.9813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7250d88b-4b68-4529-be44-d59a2d8a6f94
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oUv4elOUcJg0NqUyzcIaFF2kPlB3LFYqtRPI2QKf/hfI7813L+jWrCmx5wzU/hn5nJvzPn736Go7NvlXDUFw1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB1027
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
Cc: Tim Deegan <tim@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

I get the following errors when trying to build xen-4.14.0-rc4

kdd.c: In function 'kdd_tx':
kdd.c:754:15: error: array subscript 16 is above array bounds of 'uint8_t[16]' {aka 'unsigned char[16]'} [-Werror=array-bounds]
   754 |         s->txb[len++] = 0xaa;
       |         ~~~~~~^~~~~~~
kdd.c:82:17: note: while referencing 'txb'
    82 |         uint8_t txb[sizeof (kdd_hdr)];           /* Marshalling area for tx */
       |                 ^~~
kdd.c: In function 'kdd_break':
kdd.c:819:19: error: array subscript 16 is above array bounds of 'uint8_t[16]' {aka 'unsigned char[16]'} [-Werror=array-bounds]
   819 |             s->txb[sizeof (kdd_hdr) + i] = i;
       |             ~~~~~~^~~~~~~~~~~~~~~~~~~~~~
kdd.c:82:17: note: while referencing 'txb'
    82 |         uint8_t txb[sizeof (kdd_hdr)];           /* Marshalling area for tx */
       |                 ^~~
In file included from /usr/include/stdio.h:867,
                  from kdd.c:36:
In function 'vsnprintf',
     inlined from 'kdd_send_string' at kdd.c:791:11:
/usr/include/bits/stdio2.h:80:10: error: '__builtin___vsnprintf_chk' specified bound 65519 exceeds destination size 0 [-Werror=stringop-overflow=]
    80 |   return __builtin___vsnprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    81 |         __bos (__s), __fmt, __ap);
       |         ~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[4]: *** [/builddir/build/BUILD/xen-4.14.0-rc4/tools/debugger/kdd/../../../tools/Rules.mk:216: kdd.o] Error 1

The first two array-bounds errors seem to be a result of the

kdd: stop using [0] arrays to access packet contents

patch at http://xenbits.xenproject.org/gitweb/?p=xen.git;a=commit;h=3471cafbdda35eacf04670881dd2aee2558b4f08

which reduced the size of txb from
sizeof (kdd_hdr) + 65536
to
sizeof (kdd_hdr)
which means the code now tries to write beyond the end of txb in both 
cases.

 	Michael Young

