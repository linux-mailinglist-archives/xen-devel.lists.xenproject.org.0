Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D564F62AB
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 17:10:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299965.511353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc7IG-0005Q6-05; Wed, 06 Apr 2022 15:10:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299965.511353; Wed, 06 Apr 2022 15:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc7IF-0005N5-So; Wed, 06 Apr 2022 15:09:59 +0000
Received: by outflank-mailman (input) for mailman id 299965;
 Wed, 06 Apr 2022 15:09:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3N7O=UQ=citrix.com=prvs=088976f43=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nc7IE-0005Mz-Ir
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 15:09:58 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d3ff1cb-b5bb-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 17:09:56 +0200 (CEST)
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
X-Inumbo-ID: 9d3ff1cb-b5bb-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649257796;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=maPMO86fu40OMTwxf6amBWSGcZgqIK3ohXBFIXW/Fg4=;
  b=Zg0oWaoNJkYlx838Qrj2Ikbiy6AxPCPkMpmoqfGYZDEAx7FklXDUgPX5
   hYv/IzHSeexkHxqrep8W8NRUnuTGJn4y+RUIlxg8fi7m/OJyVNkGKB1Ae
   E7Rg21KKDSqwVynAPEBv6sAPDEdevE2UUZ2Oo7e3vDaXr5e8+m/C8EXAU
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 70567931
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:F5PVJ66Q0ZLfgidzNeWwdAxRtC/HchMFZxGqfqrLsTDasY5as4F+v
 mAaDWHSaKyOMzCmfYxxYYW+pEkO7MfRxoJjHQBtrnwzHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YThXVvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSrbRgAHZbxtN0BcBxSUC1gZr9g4bL+dC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsFvX5t13fBBOsOSpHfWaTao9Rf2V/cg+gRRauAO
 JtCMFKDajz9ZAx+EVoONqtmgduKu1jzTCZ8tFus8P9fD2/7k1UqjemF3MDuUsyHQ4BZk1iVo
 krC/n/lGVcKOdqH0z2H/3mwwOjVkkvTR4Y6BLC+sPlwjzW7xGYeFRkXXluTuuSihwi1XNc3F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc8F0DMQZ0zyh87b35gzaCnZfXBhYZeVz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbv1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4P+RECnCBtJ6sybp1qHHb4
 hDofODEsYgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0vfRc1YpZUKWCyC
 KM2he+3zMUNVJdNRfUpC79d9uxwlfSwfTgbfq68giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmDOCLbimnk/P+efPOxaopUItbQLmghYRt/jf/m04M
 r93aqO39vmoeLanOHOKrtdPcwtiwLpSLcmelvG7v9Wre2JOMGogF+XQ0fUmfYlklL5SjeDG4
 je2XUow9bY1rSSvxdmiApy7VI7SYA==
IronPort-HdrOrdr: A9a23:kshUoa3ZmAs9uIjxsUdcjQqjBVByeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5Wo3SITUO2VHYV72KiLGN/9SOIVydygcw79
 YET0E6MqyNMbEYt7eK3ODbKadY/DDvysnB7o2/vhRQpENRGtldBm9Ce3im+yZNNW977PQCZf
 6hDp0tnUveRZ1bVLXyOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mOryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idgrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT1vDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amGazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCR2B9vSyLaU5nlhBgu/DT1NU5DXStuA3Jy9/B96gIm0kyQlCAjtY4idnRpzuNId3AL3Z
 WADk1SrsA8ciYnV9MMOA4/e7rENoXse2O7DIvAGyWvKEk4U0i93qIfpo9FoN2XRA==
X-IronPort-AV: E=Sophos;i="5.90,240,1643691600"; 
   d="scan'208";a="70567931"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXt4/7KFG23b5Rw1OCR7IpS0QP8nP1rjy+AkwfOXWbYAYJv181FTIWAhW8Me7vYz+vx7RVLNkCHapeAfknE8oL7OZnPJwOCMIlJr6lcBcfvipMakqtqI1/jcRMTtil0R/X3z/0kzQgq24vDfgOghcQvsp1ghC+sfNWDtwPGOu8YDri+gb9tf6aWD5kRGQL25I9YOLbwrl0e6dZG3nBTBGRnn7T4+o+gNNrXgVU6QXxmpQEfhKtNpfiFikV4z9A24fR+fJ0Kna3DNAgOQGWDcyH6Kk9clUcm64Lc2gPfd7M3pJLoehVSE9tNQY7Purwcmrzc91kFkmIeQrVV6ielmqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nen8ntpYGf5NXRLPEtkxedr6pdADJ/uwRwuXXj5ksgA=;
 b=eniiGP2A+j0ygmuoOYtNWzHbTaTdQZJTjkphx8awaNf69PkH4Og1iyojKyd5iT2mKoWQoYnuCLPojE2BkNeMCOahieWB8hj74vGOhD3z0BtGiMS0b25NQrp2ncbiYWZTh/NwPjs0ztsaAaRfhy3CQxT5US0Q6WDQFM6sx4kngiKVbDv+1ZgfCCwNfx01Zra/8STYiZAF4jQGroRDYJUWTLWoL2ukUXM+0cfBcnTzi2E5MsvAzGU8TAiV75b+/NAiVhYtlOv/FMuOWnOWye1Ep3pUjj7K0L8AhmbElppvbTPoc++zdV+kDc8otXKOowIqjWvk2aUM8jMl8OzEddL+zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nen8ntpYGf5NXRLPEtkxedr6pdADJ/uwRwuXXj5ksgA=;
 b=t6e/ANK5vq3btAQoWlCC/CTbyoTwguNpCFM3rpHZ1Zqwa9QumIr6zVE1hXW2BBBrgXSRl8Wx59HNpEpUlKu9el61yI6yCUos2ZexyqcYKTckXfWR+nz8B7m1lg7se5+E2lU2SpvAnIR1XOoewgciNPpSTbvlqLzmZB6N5sB3grs=
Date: Wed, 6 Apr 2022 17:09:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: Questions about Cx and Px state uploading from dom0
Message-ID: <Yk2tN5h3nB+ijMoN@Air-de-Roger>
References: <YjrgQOYbsaYOV08H@Air-de-Roger>
 <6a029529-fcbe-3923-26a6-58a58926762f@suse.com>
 <Yk1tvf7oqOf3jySX@Air-de-Roger>
 <333e5dad-5a8d-a8b5-99b5-5d349c784b88@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <333e5dad-5a8d-a8b5-99b5-5d349c784b88@suse.com>
X-ClientProxiedBy: LO4P123CA0046.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6544dfea-a345-4148-8f99-08da17df7dec
X-MS-TrafficTypeDiagnostic: MWHPR03MB2896:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB28968CFB9C3E89DFEB51287D8FE79@MWHPR03MB2896.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P92NZ0q/BrANezdBguIYAzY/m2Bhuy3IlRkTZoSQPuOh+KSUzSA03Qv8kn0XWRfMUg5xBHSS97l71/xO+tTNh7nMmrjDzFVc2+QxPjJSoptyeFEhbDoocfF9dxgOdpiHfo8Fl5dO5ae8Hlkz8ttY39grSGcIgRYliuMSC6RjcLjlgNjEOwunZOtqvrlQqaGZ/zcEItS1rXR6ZxNemWr51Yu49AcauefXnhK3jdh004Y3EetH/mENmLRA4JqNrtJGSTZfHpCeaIIZzBBhqQJhBj6KX2OX2JsYXgxs8UUE18iXLgkAXgp1p8/oBteiBc5FBp3/2aDcB3wjQYX6UsBI5ajMNIwCrt/MJkZe0q+9S1eTUWSH73Z4Ru2y0H+bIyAK8Qdq3D6nLg2MyDvka3wQ9+x2MMPLK9N5JnOkzbs0+xaKSGuR05Q9XT3s8MVWr+f9nY/aGf0IsjeQfcexat0MvZZQ0sPtc0zBjZMztg3Orao1u4EH+clIfm/H6hyntT8okv3F3CG4TbAosHBTV1VFLr5aI1BHAnWUgsEnlAlCicH423ZXLNC1ZgZx1eNtUeheSiYZGhwsP6Y9Rq0dxF4MrCgHOvRuB4sRoSKL25AOfcFgaCTlSyF/AEgfah7G2IjUGyxXvL6HVVaODcu81wrEHh9OrWa1d2Evwhrpj/DNzlJOgo1uhp07ibRfnhJACQAY24M5+5yqYs1gMKUjpXJhmg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(8676002)(83380400001)(4326008)(66556008)(6666004)(66946007)(66476007)(6506007)(53546011)(508600001)(6486002)(33716001)(86362001)(26005)(186003)(54906003)(6916009)(9686003)(316002)(6512007)(85182001)(5660300002)(2906002)(38100700002)(82960400001)(8936002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE0xa2J4VmZqeTVUQWhNdHN2L2RUcXVCcTJZY25POHRrZFBEZ1pSTzFDN201?=
 =?utf-8?B?Rit4UVNkaTlMSnNRWnBSamJkbkNLOXJ6NTduaGpVTzh2K2taemJqVGVybkNz?=
 =?utf-8?B?VEhic3BqYWRENitmbGU5Mjgxd2xYMjRlckkzcndqNkFlRVRoeTRMTEFmYWhq?=
 =?utf-8?B?bmRzSVFyb1UxcDVCcTZoS3piQzRVT1ZYTE0vMkEvVDAzYzFqbzJ3V1pBUytE?=
 =?utf-8?B?bnZVZWUvMGlGTnc4bnFkNEdCQjlINGRHenBqZFhRQ3J0NThCVGNCcnpVMC9F?=
 =?utf-8?B?T0s0cFc0c2tDSXlidDVsc3lqaFVtMGJGM1lNbFM1NXAzb29jd2pRSXpRYk1H?=
 =?utf-8?B?amdjcUkxUXBNQ0o3ZXZwQktHUGhZMEJJQXBYVzZaZkszZkk1TE84d3d5ZWFn?=
 =?utf-8?B?QXY0VEdWVFY1OTBhblJqQ1J3SzFhbWVCUk5SbDJ6L3BWdFR3c0cvSjlTN3ds?=
 =?utf-8?B?cWNxQXlQclRkaStrNXk5Q2d0blRIZzJ4QWVBQ1VHY0ZyRFZkZzFYTG51aW93?=
 =?utf-8?B?SDhOcjNzeFQ1V3c3TU5oRWhUbHZwMmZ6d0tES3pSdkZwV3ltQjlrL2FkV2d6?=
 =?utf-8?B?ZzNVTEFoZHdXdXhLQWtXKys0TmpQS0Z3K05lRGVMUURzTjJkTWxMWmNiTG5r?=
 =?utf-8?B?ZVVlais3Z3hUQ0tlbWlTaVNPeXRCcGpaVlhuM2lHRUVwYWtBS3hIeGxRTnI5?=
 =?utf-8?B?NGF4Snl1cU8vSVFKZzM2ZVpHVmVqc2NzMFpRZ3pLY0dndUZGWnpJNm9lMldR?=
 =?utf-8?B?MUdZb0RMWHJudDVnSHFHTllXUi82KzI2VkNiQTcvME91czJ3ZDhTREdqdHRv?=
 =?utf-8?B?TUhJY2pyL05CZUxQWFgrVVYwdXFsTG9ka3dSNXVxdzBOUkMyZUIvWlRGWklF?=
 =?utf-8?B?SWZXMnVnTXBsOG5QSDFtdXV4VDNhOTZSam1vNDNqUXRLS2JZR0g3OEJWZG5l?=
 =?utf-8?B?UWQrRGNBc2toRjlqVWIwTjhpWS9FRTVLcGxTdzg3RVJ5Q0FRUXMyWFRHQldG?=
 =?utf-8?B?WGNMdXkyTDcxN0lRa1RkTDY3dmNISHZ6VTdlQ1V2M3RoM3BjRTN1QzNOSXZJ?=
 =?utf-8?B?ODYydjl2WFB6Um10WGc0bnZsc0Y4Z1IrOUFwZjcxcGxaSWRra2xoT3Y3UmFH?=
 =?utf-8?B?bDdTRHJrK29pQ25DQ0NUeWtDSWxjOGZ3QmorTnR6citqODBZblVpYjhVSHdQ?=
 =?utf-8?B?WnFOcTFtc3QyYkFQQUQrU0hqUy9YMnB3Z29nM1VQeXl6cVpSUGx2dzNlc01O?=
 =?utf-8?B?VjFxckttRnVOeGkzQkZ5ZGRTN1JGYUg3bFdTWmpETHFiYWRGSVZLNVhlYk1s?=
 =?utf-8?B?TVUybUZvOFZnTmNaMmhyNFExRFdRQzRLdEZMUWEvYW1OQTlzVzhob0NxWTZ1?=
 =?utf-8?B?bDk4TnJ0MFJQdDJDWS81eHBGZHhFc1ZkTkVURjRYcTRPR2lBandVT28xeDN1?=
 =?utf-8?B?ZTdVZlVJcnJFVGFTS1V0dDc5bzRoY1B6L3hzbGZ6UVowbDVOUEE2U2txallS?=
 =?utf-8?B?eHByM2VEKzB0aUdoeDl4QU9pczlkS2dCVDZlblg1R0x5djVrWC81cFk0RmtS?=
 =?utf-8?B?bFFtcWZTaTZic01QRHlVMmdsSXkrRGJnUmFhRFMySWFhMFZydXE0RWhjd0Mx?=
 =?utf-8?B?b084ZFF6bnpnL2ZvOE5qenVGVTMzaVpLUGlDNmpiT2l6VS9uU0hueEtBK1Nn?=
 =?utf-8?B?N3FmRENHNUFVYjhjUXlwMG5IbWliaENlMnN5ekRKNldjUHJhUXJjQitUUE9U?=
 =?utf-8?B?R3NUdW9qZGlSYVViVHErMG1TNlZoZGk4QzI3Ukd4QVZhVm5vUGthWStZNzlX?=
 =?utf-8?B?dURXWFJmV3dmTGs3aStxbDdBT3ZTVk4za3MwM205YVNGREZjOXJ1VkE2bm1D?=
 =?utf-8?B?TVVpQ2I2WWlBV1ZPbGNIdlNjVk02VlJKY1BqMDMzU2poUnk1bTF6UFhuMWdi?=
 =?utf-8?B?ZUtOL1JXcmU3TlRRMHVFV2JkelloaTlEZjFYazk0UmZlOXFKNmpObzF4eXc0?=
 =?utf-8?B?bUE2dkZyaGdtSS90c095T3VCWUpMNy93cGVkL2l0ejB5YlhpcHptYml5Uldo?=
 =?utf-8?B?MVhISzVwWjdCVFNXZnZXNzBXcmVOdzdwMG5yTVlxWHVFanZDSCtndi9TbDZj?=
 =?utf-8?B?N2szemFYNWlHd0FMdTVqNng3QnhmSnRvMmM4T3dMYUdwODVRVVY2UTN1aHBW?=
 =?utf-8?B?YVE4UHI2ZE5oUkNKWWp6Y0hrT08xUXhzWVd3YzFocmFkbnZQTFVndk1oNjIw?=
 =?utf-8?B?RklCZ3NVVDJPL2tWdkh6Z3JpOEV6cm1IanVGbkJ6RzhHY0hOTmxiRldwUEsx?=
 =?utf-8?B?NEJmdUhGYkt4eGl3cURMMk1qcHdLN3pDbnVPVWVOaTRDVENqVk1LM1BxTU1N?=
 =?utf-8?Q?/xKvhnaz+YZhGIbI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6544dfea-a345-4148-8f99-08da17df7dec
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 15:09:48.6022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /eq+tODyjpGWfO4Wg4cItF7Uv1tKumo6ZeJDIqQmXhecfYtfs+bIIHp1cq40TcgzEmKU+Tr4Bpw3RLBq1I0DPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2896
X-OriginatorOrg: citrix.com

On Wed, Apr 06, 2022 at 02:47:38PM +0200, Jan Beulich wrote:
> On 06.04.2022 12:38, Roger Pau Monné wrote:
> > On Wed, Apr 06, 2022 at 10:13:41AM +0200, Jan Beulich wrote:
> >> On 23.03.2022 09:54, Roger Pau Monné wrote:
> >>> Hello,
> >>>
> >>> I was looking at implementing ACPI Cx and Px state uploading from
> >>> FreeBSD dom0, as my main test box is considerably slower without Xen
> >>> knowing about the Px states.  That has raised a couple of questions.
> >>>
> >>> 1. How to figure out what features to report available by OSPM when
> >>> calling the _PDC (or _OSC) ACPI method.  I'm confused by the usage of
> >>> this from Linux: it seems to be used to detect mwait support in
> >>> xen_check_mwait but not when calling _PDC (ie: in
> >>> acpi_processor_set_pdc).  I'm also not sure what the hypercall expects
> >>> the caller to provide.  Should buf[2] be set to all the possible
> >>> features supported by the OS and Xen will trim those as required?
> >>
> >> I'm afraid upstream Linux doesn't quite use this as originally
> >> intended. Consulting my most recent (but meanwhile quite old) forward
> >> port tree of XenoLinux that I still have readily available, I find in
> >> drivers/acpi/processor_pdc.c:
> >>
> >> static acpi_status
> >> acpi_processor_eval_pdc(acpi_handle handle, struct acpi_object_list *pdc_in)
> >> {
> >> 	acpi_status status = AE_OK;
> >>
> >> #ifndef CONFIG_XEN
> >> 	if (boot_option_idle_override == IDLE_NOMWAIT) {
> >> 		/*
> >> 		 * If mwait is disabled for CPU C-states, the C2C3_FFH access
> >> 		 * mode will be disabled in the parameter of _PDC object.
> >> 		 * Of course C1_FFH access mode will also be disabled.
> >> 		 */
> >> #else
> >> 	{
> >> 		struct xen_platform_op op;
> >> #endif
> >> 		union acpi_object *obj;
> >> 		u32 *buffer = NULL;
> >>
> >> 		obj = pdc_in->pointer;
> >> 		buffer = (u32 *)(obj->buffer.pointer);
> >> #ifndef CONFIG_XEN
> >> 		buffer[2] &= ~(ACPI_PDC_C_C2C3_FFH | ACPI_PDC_C_C1_FFH);
> >> #else
> >> 		op.cmd = XENPF_set_processor_pminfo;
> >> 		op.u.set_pminfo.id = -1;
> >> 		op.u.set_pminfo.type = XEN_PM_PDC;
> >> 		set_xen_guest_handle(op.u.set_pminfo.u.pdc, buffer);
> >> 		VOID(HYPERVISOR_platform_op(&op));
> >> #endif
> >> 	}
> >> 	status = acpi_evaluate_object(handle, "_PDC", pdc_in, NULL);
> >>
> >> 	if (ACPI_FAILURE(status))
> >> 		ACPI_DEBUG_PRINT((ACPI_DB_INFO,
> >> 		    "Could not evaluate _PDC, using legacy perf. control.\n"));
> >>
> >> 	return status;
> >> }
> >>
> >> (This is a 4.4-based tree, for reference.)
> >>
> >> IOW the buffer is passed to Xen for massaging before invoking _PDC.
> > 
> > Indeed.  I'm however confused by what should be pre-filled into the
> > buffer by the OS.  _PDC is about the processor driver power management
> > support, and none of this power management is done by the OS (I don't
> > plan to let FreeBSD do CPU power management when running as hardware
> > domain), so IMO passing an empty buffer and letting Xen fill it is the
> > correct thing to do, at least for the use-case in FreeBSD.
> 
> I don't think that would work: Xen doesn't "fill in" the buffer, but
> merely alters individual bits. The buffer really is IN/OUT here for
> Xen.

Hm, but I have no idea what to put here from FreeBSD PoV, as said
FreeBSD will only use the processor object to upload the required data
to Xen, but won't attach any driver itself.

I've so far been providing an empty buffer to Xen and it does seem to
set the right flags so that the Cx and Px states can be fetched
afterwards.

arch_acpi_set_pdc_bits() does explicitly set some feature bits, so
there's not only cleanup done there.

> >>> 2. When uploading Px states, what's the meaning of the shared_type
> >>> field in xen_processor_performance?  I've looked at the usage of the
> >>> field by Xen, and first of all it seems to be a layering violation
> >>> because the values set in the field (CPUFREQ_SHARED_TYPE_*) are not
> >>> exposed as part of the public interface.  This all works for Linux
> >>> because the same values are used by Xen and the Linux kernel.
> >>
> >> Well, yes - that's the way code was written back at the time when
> >> cpufreq support was introduced. It should rather have been
> >> DOMAIN_COORD_TYPE_* to be used in the interface, which Linux
> >> translates to CPUFREQ_SHARED_TYPE_*.
> > 
> > I will send a patch to add those to the public headers.
> > 
> >>> Secondly, this is not part of the data fetched from ACPI AFAICT, so
> >>> I'm unsure how the value should be calculated.  I also wonder whether
> >>> this couldn't be done by Xen itself from the uploaded Px data (but
> >>> without knowing exactly how the value should be calculated it's hard
> >>> to tell).
> >>
> >> As per above - while it's not fetched from ACPI directly, there
> >> looks to be a direct translation from what ACPI provides (see
> >> acpi_processor_preregister_performance()).
> > 
> > Yes, the translation from DOMAIN_COORD_TYPE_ to CPUFREQ_SHARED_TYPE_
> > is not a problem.
> > 
> > My concern is that there's some logic in Linux to assert the
> > correctness of the provided data in ACPI, checking the match of the
> > domain and the coordination type between all the processor objects as
> > part of setting the field.
> > 
> > I see that Xen also does some checks on the uploaded data in
> > cpufreq_add_cpu, so I wonder if I can get away with just setting the
> > shared_type field based on the coord_type of the current processor
> > object, without having to cross check it's coherent with the values on
> > other processors.
> 
> I guess you'll get away as long as you don't hit systems with flawed
> firmware. Whether the amount of checking Xen does is sufficient
> depends on particular flaws found in the wild (which I lack knowledge
> of).

I guess I will do with that. It's all experimental anyway, and if I
find one of such systems I would try to fix on Xen then.

Thanks, Roger.

