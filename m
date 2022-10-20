Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A440605B97
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 11:57:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426373.674763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olSIy-0006K9-57; Thu, 20 Oct 2022 09:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426373.674763; Thu, 20 Oct 2022 09:57:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olSIy-0006Hi-2K; Thu, 20 Oct 2022 09:57:36 +0000
Received: by outflank-mailman (input) for mailman id 426373;
 Thu, 20 Oct 2022 09:57:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3+B4=2V=citrix.com=prvs=285f10a64=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1olSIw-0006Hc-F3
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 09:57:34 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d0685e8-505d-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 11:57:32 +0200 (CEST)
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Oct 2022 05:57:30 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5477.namprd03.prod.outlook.com (2603:10b6:5:2c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Thu, 20 Oct
 2022 09:57:26 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 09:57:26 +0000
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
X-Inumbo-ID: 9d0685e8-505d-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666259852;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=XsioKsCG4Kwr3mwXn/CwG2Bxa6fJuAR026roc6JWHw0=;
  b=hGrVTRBWQJb+xyh/yd7ffTNNPJe7/XdayAgzQwYKT89s1LZLQq+PPKZF
   U8yks1JMM1pCol/9/p6mvFa/3/iIzXgNrXnuydLBHuLJktosC12UUVp3r
   qhKTKX2/jBQ4tJtKOaX3tltUe+AJgVQanBg7wqO+8LFewG9nMiiPZyOOi
   I=;
X-IronPort-RemoteIP: 104.47.55.173
X-IronPort-MID: 85669954
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HfKLj6nIZjlTgv5bEHFp+mTo5gyUJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMDGmBbq7cYjDyfNlxOoXg/UlQ7JTdyoQyHARppH9hECMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6UqicUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9XuDgNyo4GlC5wRkPagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfXG8J0
 7tAeTY3RzOmvLy1/KqiTugvv5F2RCXrFNt3VnBI6xj8VKxja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvi6Kk1cZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXOmBtxDReDknhJsqAaT/z0+VyAab3yAs/KTrlSUQNYCO
 kNBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQ5sOcmSDps0
 UWG9+4FHhRqubyRDHibprGdqGroPTBPdDBZIygZUQEC/t/v5pkpiQ7CRcpiF6jzicDpHTb3w
 HaBqy1Wa6gvsPPnHp6TpTjv6w9AbLCTJuLpzm07hl6Y0z4=
IronPort-HdrOrdr: A9a23:wzZPHaFQCAD9IETrpLqFS5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNNICPoqTM2ftW7dySeVxeBZnMHfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj2Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnY4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlUFtyssHfqWG1SYczGgNkHmpDq1L/sqq
 iKn/4UBbUw15oWRBDynfKi4Xi47N9k0Q6e9bbRuwqenSW+fkN1NyMJv/MmTvOSgXBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjxkC3fLFuH4O5l7Zvin99AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlPeK3Jy8fC9wnxThjR03kEYzMsQkjMJ8488UYBN46
 DBPr5znL9DQ8cKZeZ2BfsHQ8GwFmvRKCi8eF66MBDiDuUKKnjNo5n47PE84/yrYoUByN8olJ
 HIQDpjxBoPkoLVeLizNbFwg2PwqT+GLEXQI+llluhEk6y5Qqb3OiueT11rm9e8opwkc7/mZ8
 o=
X-IronPort-AV: E=Sophos;i="5.95,198,1661832000"; 
   d="scan'208";a="85669954"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gyM7hwX7DjMaw7GkVl1v24rOcvf+gL3SNXiK6xrtLGM5nVmPAwTM6ZD+W7eddI4CkatzSWHp3Jx4E5kkbJTder3BMiNXPOw/Mk445AyuDcSMS7GLCsSOaoPlgzTE7dd+L8stov3RtQIezU8OqNhRPJ+qZ9Xup9eVfAYpW+/VZsus1IR8pVzHv2eL+CXAcNZm04H4zbAXvTEHE766LfLjS5Fz/WGrbrgYAMEvzw6aLsuq2fV/Ygm0fOVHn3kPBy99dofCbP4nPq+Y3eBDEQMjVwzOf/n7zCpvzmXZ0VJcDmdri4pwlgDn6wrZeSGJjBt/lacAAEIwcAp6fWf+y1LuVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsioKsCG4Kwr3mwXn/CwG2Bxa6fJuAR026roc6JWHw0=;
 b=Hm0Kq9il9NTFCjxNeUkWbD97f3tPaSgJ5O5Cjx51NG57lPcvFYKWBRR291OB+S47bgobYU3tYBDKKxwqq79jKg3CzugJJkg5ch68JxO91oMg30Up/OvcR3g5gx+23BAHy3jVUQ3lqpLb3MnSt4DQhcUV8IFyikplX4U+PzmBDf0jZVjYSE5NkgeN5FQ/PZbvPmOA7yqVwD3pKhvgxHzhHf72nRIhvs0lcbPTglEMmJQepg20kwpCdV65mRjkHOeHHVfn868kxajyGh1o8ylUuxCRq4m8Fp8/Fih1gdC3+n/uNbqIGTuP7Fs+2QOoctHNPeGLP+zVpqZsp/glD1Uf5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsioKsCG4Kwr3mwXn/CwG2Bxa6fJuAR026roc6JWHw0=;
 b=S1s/kZpkKMfMKt5UOmp0edRQr/dxe2rXi0dZlE27zR2EYBafkwF9Ct8iz15MK7a7ijmMHHExZfpPI+890yu7ZKZ97EZs2pWLm9ZFEXXlP5acxi1ius4f82JuJ0P8BDIl6T6YV+5Cj4mul0b1+eD9gdJp+J2mKwGkDooH8YllO5k=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH for-4.17 1/6] test/vpci: add dummy cfcheck define
Thread-Topic: [PATCH for-4.17 1/6] test/vpci: add dummy cfcheck define
Thread-Index: AQHY5Gj3NrHn8HwTAE6Wstyf2zkCg64XC+OA
Date: Thu, 20 Oct 2022 09:57:26 +0000
Message-ID: <93b6bfd9-729d-74b4-d4a6-21286074fe8f@citrix.com>
References: <20221020094649.28667-1-roger.pau@citrix.com>
 <20221020094649.28667-2-roger.pau@citrix.com>
In-Reply-To: <20221020094649.28667-2-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DS7PR03MB5477:EE_
x-ms-office365-filtering-correlation-id: 425e0aa8-17b3-48cc-915c-08dab2817e21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 OVXU7tIXliBeFKOgZ5krawkxpaG93DsXUT3ZtwFEqqJzPd3qqpfOJCG9cA4lWdjc4Gp9TCF+FXk3C8EvhZUBMN7eniZkxAUwie12SZ4ge+0nZcYFkeimblZzvFMOcA0GgVRdNFSZ0a6nrWm3c6MR+xEXfJVhjFNBYzrD+AME04gD/kRbdFIgrckjvnT+XO28kXp33EnstLUX40huKEQSpM+Je6V9Bm1VEM9zRjSay1qP3QXerIktcU3KGF4YBUlbuDQHRPSeQHaO2FDWVDteom3wRUTPp3GMv0917WGpPxV2nl1jP5VhPcW6x79HwM1//jxEhs6hhZ3t35qhq6znnmb01sKpjWiKz4dNjdoyw+n15uMvb/q5X7ogiP4oQJOHiPjqJwKyifVQHblNZ6BQeM8p0cDDTp+LdrLKTIM+ewG+WHfPtsEvFUTozLHIjYgjqDSK8WuzpTZTVtzBLgWRjyforNYMdI+EV5fXHHY/khPbfNl4QJqo9ohoQId6WxGBi1t5gdxnZmKq3lWRKbCrX3z2TwHWm+8op5kHNRzmciyzU+oa9Wdac+w1ZmOjqq7XwUvCb+d03WV39YFs6lUXyUecW60ea4rluGMtNBaId5v38es3BYJMfx+KD6C0r5V9VITMEMwVSd/tmF/I81HLlhGgP+gPhVhvovka/bpJubxnBUZuGF/JEE1GT1l1MyPW4vZzOIuoBdMREkJupr7HuI4o41deHOTDH8L8uuND8jurS8sCtaU/Mo5NR7nlUotaaz+HWxUXntFciS5QZjIv7BpRD67RD5GJhU6qU+bgXSRCiY/m+ED/xxs7YpISw9286DeqHoosXNKSzSB0kQox6A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(451199015)(186003)(2616005)(31686004)(107886003)(71200400001)(2906002)(4744005)(122000001)(38070700005)(36756003)(86362001)(31696002)(82960400001)(38100700002)(6512007)(83380400001)(6506007)(53546011)(26005)(66946007)(316002)(41300700001)(478600001)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(76116006)(6486002)(110136005)(54906003)(91956017)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VWc0SXNSTTFZT2hTVkJHNnBKc3ZsM0c3bFJHakovSTZuUXo1Tk9yUXQweWJ3?=
 =?utf-8?B?dDhZdkE4YzR1OEVmSTd3YTNpMGtBdU13MWxtaFpDMlZIazhsRGF6WEhOelhN?=
 =?utf-8?B?Slk3RktlREYyNlI0QXphR0RDaVRFRWk4dzVDVzBmcWFZYWtwTXI3ZkljSjBQ?=
 =?utf-8?B?RER3emQ4Tks0WHROZFhMWWx2cW9hVjc4UU9QZkd2cmVFVzBnbUs2Z05lTGla?=
 =?utf-8?B?bGJSV2xOa1hCSENGekJNc3RtWG8xVHF5MWMxWHZDbnlUNWd5WURuZlJldWNV?=
 =?utf-8?B?b0RJdXVBUGFLV1N5NDFKbEUrL1RqUjI1MU5TLzM0clpHdFpvd0wxVC9JcEhz?=
 =?utf-8?B?d1JBSDNTeE4yaW4ybnlwakR0dVBRTVJBYXo3NWRUVm9zUDByRkZScEF5Yk1V?=
 =?utf-8?B?ZEQ3NXZHNFpZWDVpQ3RIVy9hdFFnMUkvbDNVM1ZqZEltYkI1QnV3TVgzMHFs?=
 =?utf-8?B?RGFpT0R1elBUaGh4Z1ppREloL25DcG04aExtLzNHdVJLVHFQTGFyZ1RCNklE?=
 =?utf-8?B?MEQ2VGVyTmk0c1RuSFdrNW9XUnk0VUF0bWFQREMybmpia3k1RnFiTm9NMytG?=
 =?utf-8?B?TDhmUXh6djU3V2dsU3hhemJPa1pqSEMxaFd6VkJFWFhZMnd2Y0NVbndrZkVQ?=
 =?utf-8?B?dkRXZjA4VXZieU9VUFltNnMwTFZWbFBwU3FKNWFmaFpZMnkvRHFGeTg1QmpZ?=
 =?utf-8?B?b1FUMXloSGoyODJ3NzJ1dmpSM2xnQmpITktQQ0VkL2FyQ080K3QvcUVHY1Zu?=
 =?utf-8?B?SGg2WHJhNFNvM2daU3V0YW9iRVJIMjVHUy80NzFDamwzU0wycHFHRWJDVncz?=
 =?utf-8?B?M3BML01QaVE5SGVxalJJYjRVWTRwTEhHQnlTNG1KNkl6eWs5bmNJY2x6T3hy?=
 =?utf-8?B?THZBNHdGNTZtRkYwYm9yVm9KclRNNHNUTUh0NUlKV2ZNVUR3eE5TbnBuRGVL?=
 =?utf-8?B?NldIejlzeFJjaHNPSUhGMXFDcjFjUG53eGFWUFlXYWthN3FOLzh1V1ZRTWZh?=
 =?utf-8?B?Tzk5TnZ0UmhscExCYmJ6Zmh4S1IrYmc2U3MxZElhM0E4ZHVraVZnRXc5UjAr?=
 =?utf-8?B?SmhIRzhVTTZ6Y1J4VGFKMk5oTVZ2SUNHSXpubTFSdXpYME1LMThGNHowaEVE?=
 =?utf-8?B?SDBhRkIzSXhVbXB0LzRVVHVXd1J0bkg5enNGb3VkcmxiQWVLN1p0R1pLakhE?=
 =?utf-8?B?YW5waUFURCtMTjl0dGdoQ0h3NUxhbVZsUHRFZVVCZHNkbWI3cmQ3TE4xNjhq?=
 =?utf-8?B?Rkk2Z1BXbHdjUncrRi9lMWJLa2Ric0p6d2dsL3lRMEszT0xOU3FrN3c3a1pr?=
 =?utf-8?B?cExmaVM2dWVwQlZyYXdTWHhqZHBZRHdwTWJKNzNPaG95VHhURHR0Ti9UWlls?=
 =?utf-8?B?MWlnMm9rcUh1d3c2cittVUxvWFJjMDV2YXQyY0w0dXJWaTZHazJ1UXRmTzRn?=
 =?utf-8?B?UkpIMjZMYll3UzhyaHdodlZIQk9QTnVqZHN4d2kxREZYRzBBbjZ2THFiZTQv?=
 =?utf-8?B?WENDRDE4Q2poUjlwTlk2Z1dMTjhiWld2dzczbTlzc1RYN3ZUWmJoSlBsVDU2?=
 =?utf-8?B?Z0RBeFVGbGVXejExblVpby9HWjVLWkp3K2tjZ1I2T3RoeVc2Qnh5YVRCMjJF?=
 =?utf-8?B?ekFEU1RBZkNPT3hHbFVaeHNZaHRmV2JJdzJMK3d2VkU3MWVENmUzRkZTejUw?=
 =?utf-8?B?U01ua3BlYVp2WXczUzdmU0x4NDk2K20wWWZlN0ZreGIwamo5U0xmOG5pRnlM?=
 =?utf-8?B?dG9uakxhbkRodmc2bWREbkpFcjlQOXFzcm1zcXJUMGMyVFZEdU8xUWxxb1Rl?=
 =?utf-8?B?SHBleWxDRWI1djIzWDJMZSttWnRnd013SXBjVXFzYlpwQVNIbW4raGtOTnlD?=
 =?utf-8?B?OTdIWjZGMStrNFZpMHRVSTE4TDl6MUNzYUV1elR4U0tNNVhjek9GNzFYTnl4?=
 =?utf-8?B?bTRFYXVtQWExdWluTGRXWlJnS2hoR0lhU2xUWWZDcTR2bGV3M1FmamdGT2Z4?=
 =?utf-8?B?MkZHREJxdzkvRjhGaUx1MTNvaTRYa0NQNFhub01SY3Mxb3FrcXh3aHYzU3hZ?=
 =?utf-8?B?cUtaNGdBK0hqSTJGL3cwbzZIU3dOM1NwcCtvMndtd1VVVEJvU29PbEx0TTJY?=
 =?utf-8?Q?zIvWu0GFU7TYDDXVKDm2fAi9+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <679068DD1E1CF245854B86A20267BB70@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 425e0aa8-17b3-48cc-915c-08dab2817e21
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2022 09:57:26.2844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CdLG8XvsoO1K1McQkjrHCtuCDxOiIhAQAlC5RVKucDBADV/wOm/XsUuEjNULE1ogrgt892tyqQHvf/cP7Pj6LdUPn8awj+tqKhUrifUEJhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5477

T24gMjAvMTAvMjAyMiAxMDo0NiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBTb21lIHZwY2kg
ZnVuY3Rpb25zIGdvdCB0aGUgY2ZjaGVjayBhdHRyaWJ1dGUgYWRkZWQsIGJ1dCB0aGF0J3Mgbm90
DQo+IGRlZmluZWQgaW4gdGhlIHVzZXItc3BhY2UgdGVzdCBoYXJuZXNzLCBzbyBhZGQgYSBkdW1t
eSBkZWZpbmUgaW4gb3JkZXINCj4gZm9yIHRoZSBoYXJuZXNzIHRvIGJ1aWxkLg0KPg0KPiBGaXhl
czogNGVkN2Q1NTI1ZiAoJ3hlbi92cGNpOiBDRkkgaGFyZGVuaW5nJykNCj4gU2lnbmVkLW9mZi1i
eTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQoNCkFja2VkLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KDQpIb3dldmVyLCBJIHRo
aW5rIHRoZXJlIHdhbnRzIHRvIGJlIGFub3RoZXIgcGF0Y2ggaW4gdGhpcyBzZXJpZXMgd2lyaW5n
DQp1cCB0aGUgdW5pdCB0ZXN0IGJ5IGRlZmF1bHQsIHNvIHdlIGRvbid0IGtlZXAgYnJlYWtpbmcg
dGhpcy4uLg0K

