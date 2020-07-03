Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BAD213802
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 11:49:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrIJh-0000Yr-9C; Fri, 03 Jul 2020 09:49:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XiPz=AO=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1jrIJg-0000Ym-2B
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 09:49:08 +0000
X-Inumbo-ID: 6e6a5d40-bd12-11ea-bb8b-bc764e2007e4
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (unknown
 [40.107.10.95]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e6a5d40-bd12-11ea-bb8b-bc764e2007e4;
 Fri, 03 Jul 2020 09:49:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5P7Qy0IogidzzN85fhC8FatoqN/w8TznaE4y6KRM0OixtM9Ipk8MpnJOqnvHdJJ1HzO6OBeo+vBESd3n2saiR9NpM1i6brJGgfIk1Vrrvn5TOm653PhXVlpmVHL9LcKZ4NwS65wGBovZtcbEih7RHD6z/O3PCXvXE7n3r39y3r2DM9QxoO6FKbvi3lu+BDa9q/dz9T6wirgN8yVmcibIgSIjJ+27V4ffL8R+pOLhs1TPg37TWOBUZdKhX2POAtIRNiBd0iJkkxcYe1lHaVk7HHqa9651Z3pXDQqAs1gNpUlxY0cGJ7z84yeM3386guKyXUOAAiOpd1817OjQRS6bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAW/Crn4QUVtArQFAkNzARmHWlCle50TRjQ41/NK3Tk=;
 b=OUZgek7CeB61ulyKTT/4w9UXj8rWE9yC2jrxfpPtPSSICuktuT9mzN3uSbI4U79RBuiPTl1CidPuGzZ5Hffnq6BHD9lqb2z6Ti03dTkXApL7yfgJ9Cu7eOqtkknQ4yiCxcx6M25vYCPMlaD+/avarfRo4wcQt62A+BCuNppopQosF0DQXSUk5o+ATmAdp4ldU3A5tjzWGVAObNnFeC/nVHM+tdz6NKVEGxPF52/4B0q/deNli1CjwCYGFHQpBd4H2IwuDP4giPEPBS+jG/tKgHjuzpkIlBF2iR0TYTpWWvAa5w2s5E45ZdUhB9gomIMeq0gVbAbW6aFv0/V3NvaKQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=durham.ac.uk; dmarc=pass action=none header.from=durham.ac.uk;
 dkim=pass header.d=durham.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=durhamuniversity.onmicrosoft.com;
 s=selector2-durhamuniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAW/Crn4QUVtArQFAkNzARmHWlCle50TRjQ41/NK3Tk=;
 b=L0qmlccPW3z+vD2LgN6DO6ZlBK+d2NuoJ1HfDY7UsoV8rGcAnoRhQBn4CskVJ7RNKh6YU0zL6QYao9ml2ygsGnf1MMLrWxL38zPIoFfHOuCr2gUwXiXuG7HYc01rAfyUxtV3q6bvGLEZR2jAS+IMnF77xs9oIhtxTnQJ+0/261Y=
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=durham.ac.uk;
Received: from CWLP265MB1634.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:32::19)
 by CWXP265MB0870.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:46::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Fri, 3 Jul
 2020 09:49:03 +0000
Received: from CWLP265MB1634.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d4cb:ad6a:b891:13d8]) by CWLP265MB1634.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d4cb:ad6a:b891:13d8%6]) with mapi id 15.20.3153.027; Fri, 3 Jul 2020
 09:49:03 +0000
Date: Fri, 3 Jul 2020 10:48:57 +0100 (BST)
From: Michael Young <m.a.young@durham.ac.uk>
X-X-Sender: michael@austen3.home
To: paul@xen.org
Subject: RE: Build problems in kdd.c with xen-4.14.0-rc4 
In-Reply-To: <004601d6511e$28673710$7935a530$@xen.org>
Message-ID: <alpine.LFD.2.22.394.2007031044330.1956@austen3.home>
References: <alpine.LFD.2.22.394.2006302259370.2894@austen3.home>
 <004601d6511e$28673710$7935a530$@xen.org>
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-ClientProxiedBy: LO2P265CA0236.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::32) To CWLP265MB1634.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:401:32::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from broadband.bt.com (2a00:23c4:921a:2100:e6ed:102c:ecbf:28ae) by
 LO2P265CA0236.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:b::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.21 via Frontend Transport; Fri, 3 Jul 2020 09:49:02 +0000
X-X-Sender: michael@austen3.home
X-Originating-IP: [2a00:23c4:921a:2100:e6ed:102c:ecbf:28ae]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0e50c2f-ef4d-494f-65de-08d81f36519b
X-MS-TrafficTypeDiagnostic: CWXP265MB0870:
X-Microsoft-Antispam-PRVS: <CWXP265MB0870106082A889A150B5F2EE876A0@CWXP265MB0870.GBRP265.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tmAyIsLlrBtnsIQpzU9ubT2rsoC9toP9MkJDMwpEp8JKU7uWGiSxnGFK/G9/bAQg1uj7sKDOZTY/C6Hoivdk6QJS9MlWje1rBDqXvBTxOJP7h1ytAZrmjyVkmUwJwiGd04AIwnfNMRsZ77DQokLSwm5yx0WJGNW+FVHwrMg8oz/wzQj4Tb4vUhKgWZ+o4ykC6UmaP/7hpJm8HE2p+2Y2yu69VbdXfJ7GVhjSVivan58cAg0rmYArjYgYKw0xQMoM88vfn6hzP3mvg31hBmVvjjAV2Ltc6tCYlGa2IZSMDv8wO1BAaQKg3D6KVPzurVSBc0PHziLIqbVk06geVc6zYFoHXQS57MKaTpshpLPP3UfmqblDn2EVor5e4Vh12+K7Ss5M5WQMgP9ci8l264G4DQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB1634.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(52116002)(86362001)(53546011)(6506007)(786003)(316002)(9686003)(6512007)(2906002)(16526019)(36756003)(186003)(4743002)(478600001)(966005)(6666004)(6486002)(6916009)(8936002)(66946007)(5660300002)(83380400001)(8676002)(4326008)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 428TjF7Lu7hB4zXBkm2PySSj8fW0nj6ZhjMOTgaY/pjwP+KtLCGaNzuzx1Rj9WKv1N4E7z51xh3ohwE8MicI9gxEPMQKqdp4e4NX42qCF+Pd94C6Udwt5kyiiH8fPG7XyDBAWhznbS3WUGRWYtb8b4d/L2qDAG18rYaKijDpq5kB9woH1qZ82UC1nR/GVPVnW5btUKyXCDyzkmjWkz5xSWa8h4moVVxQms4V4saY2bVbtR9/WuNBQ0FY8lWjxs+F5/qhMFPsPVlsIt1RLnZPCfw7et39U62NhkYs2aSz36oUXQ1hoTwFWpC2mZ1con+L92xtLh1WhWvCB/dv2hdvZTq0M9BoAT96QUs9D13XFWoyvVJ9AEXs/pvgPE2nkpuSXuj808zmM8plscTh3gYUx2Xoz54jQ31l2oA45inOKGt/FbP4sJPMZ4rqhJ2X6u1OjnnjsUMo2O0okILOxjQPSZWBT3dGTL4+yoeIN+N82xy3QffGFUqtY2nyNiFSPrtXzoLWWrSFfyZ77Dz2+dnVDElPsltE+Xfuw76dmbTouvM=
X-OriginatorOrg: durham.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e50c2f-ef4d-494f-65de-08d81f36519b
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB1634.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 09:49:03.3117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7250d88b-4b68-4529-be44-d59a2d8a6f94
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0fWXS8w050i4/pHhu7nU8hkQQN7Le0Gi/IRKVpdpEE/JjXaTWJUsodHAwyR29vDQc0hdSY46EieOSSIq0Fny4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB0870
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
Cc: xen-devel@lists.xenproject.org, 'Tim Deegan' <tim@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 3 Jul 2020, Paul Durrant wrote:

>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Michael Young
>> Sent: 30 June 2020 23:22
>> To: xen-devel@lists.xenproject.org
>> Cc: Tim Deegan <tim@xen.org>
>> Subject: Build problems in kdd.c with xen-4.14.0-rc4
>>
>> I get the following errors when trying to build xen-4.14.0-rc4
>>
>> kdd.c: In function 'kdd_tx':
>> kdd.c:754:15: error: array subscript 16 is above array bounds of 'uint8_t[16]' {aka 'unsigned
>> char[16]'} [-Werror=array-bounds]
>>    754 |         s->txb[len++] = 0xaa;
>>        |         ~~~~~~^~~~~~~
>> kdd.c:82:17: note: while referencing 'txb'
>>     82 |         uint8_t txb[sizeof (kdd_hdr)];           /* Marshalling area for tx */
>>        |                 ^~~
>> kdd.c: In function 'kdd_break':
>> kdd.c:819:19: error: array subscript 16 is above array bounds of 'uint8_t[16]' {aka 'unsigned
>> char[16]'} [-Werror=array-bounds]
>>    819 |             s->txb[sizeof (kdd_hdr) + i] = i;
>>        |             ~~~~~~^~~~~~~~~~~~~~~~~~~~~~
>> kdd.c:82:17: note: while referencing 'txb'
>>     82 |         uint8_t txb[sizeof (kdd_hdr)];           /* Marshalling area for tx */
>>        |                 ^~~
>> In file included from /usr/include/stdio.h:867,
>>                   from kdd.c:36:
>> In function 'vsnprintf',
>>      inlined from 'kdd_send_string' at kdd.c:791:11:
>> /usr/include/bits/stdio2.h:80:10: error: '__builtin___vsnprintf_chk' specified bound 65519 exceeds
>> destination size 0 [-Werror=stringop-overflow=]
>>     80 |   return __builtin___vsnprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
>>        |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>     81 |         __bos (__s), __fmt, __ap);
>>        |         ~~~~~~~~~~~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>> make[4]: *** [/builddir/build/BUILD/xen-4.14.0-rc4/tools/debugger/kdd/../../../tools/Rules.mk:216:
>> kdd.o] Error 1
>>
>> The first two array-bounds errors seem to be a result of the
>>
>> kdd: stop using [0] arrays to access packet contents
>>
>> patch at
>> http://xenbits.xenproject.org/gitweb/?p=xen.git;a=commit;h=3471cafbdda35eacf04670881dd2aee2558b4f08
>>
>> which reduced the size of txb from
>> sizeof (kdd_hdr) + 65536
>> to
>> sizeof (kdd_hdr)
>> which means the code now tries to write beyond the end of txb in both
>> cases.
>>
>
> Sorry not to get back to you sooner. Which compiler are you using?
>
>  Paul

This was with gcc-10.1.1-1.fc32.x86_64
Full build logs are (at the moment) at 
https://download.copr.fedorainfracloud.org/results/myoung/xentest/fedora-32-x86_64/01515056-xen/

 	Michael Young

