Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 000825815E8
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 17:04:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375397.607761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGM6F-00063d-PA; Tue, 26 Jul 2022 15:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375397.607761; Tue, 26 Jul 2022 15:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGM6F-00060w-LL; Tue, 26 Jul 2022 15:03:55 +0000
Received: by outflank-mailman (input) for mailman id 375397;
 Tue, 26 Jul 2022 15:03:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DB1L=X7=citrix.com=prvs=199b7977f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oGM6D-00060J-U9
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 15:03:54 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 286bfabc-0cf4-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 17:03:52 +0200 (CEST)
Received: from mail-mw2nam12lp2046.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Jul 2022 11:03:44 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5264.namprd03.prod.outlook.com (2603:10b6:208:1e5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Tue, 26 Jul
 2022 15:03:42 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 15:03:42 +0000
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
X-Inumbo-ID: 286bfabc-0cf4-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658847832;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6o9RvZbTsDfjC8LrRyMyCQQsobqoKLle2HPX71gNEQU=;
  b=O72JSrsmwp0U07ePn+6QFJW/6yj2wZBN1eKbcxwg7EOhJpnFKMw3Z/Fh
   d9teQ8pZ5o5MI6rNecMKvcsqBaRPbv5xq7TxpHfgHXLRjmpfyPVQhSe5H
   XoTNmWQDeVPyA7m8XBVNkafyIQyPAIJVDXbu9b2rH8bhk29mOVixIKYbR
   c=;
X-IronPort-RemoteIP: 104.47.66.46
X-IronPort-MID: 75940355
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5K77Sawko1PIMbAKXbJ6t+cpxyrEfRIJ4+MujC+fZmUNrF6WrkVVz
 GYfXz3VP63fMWCgfd8na9uwoUMDvp/cn9RiTQtqqiAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg7+s9JIGjhMsfjb90ky5K6aVA4w5TTSW9ga5DcyqFFNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiM+t5yZqgpDvkQPPpMTb5LwX6v1ZwKhxLidw
 P0V3XC5pJxA0qfkwIzxWDEAe81y0DEvFBYq7hFTvOTKp3AqfUcAzN1/VnwuZ9QHodx+GCYR1
 fMeCxJXciiM0rfeLLKTEoGAh+wFBeyyZsY6hSslyjvUS/E7XZrEXqPGo8dC2ys9jdxPGvCYY
 NcFbT1ob1LLZBgn1lU/Ucpi2rv3wCehNWEGwL6WjfNfD2z75Qp9yrXydvHSfcSHX559lUeEv
 GPWuW/+B3n2MfTAlGvZqinx24cjmwv/ZLALM5nl+8Uz3nmS3EkjTxRRW1SS9KzRZkmWHog3x
 1Yv0jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcL84QyUG2wFRT5pc8E9uYk9QjlC/
 kCNt8PkA3poqrL9dJ6G3rKdrDf3PDdPK2YHPHUAVVFdv4elp5wvhBXSSNolCLSyktD+BTD3x
 XaNsTQ6gLIQy8UM0s1X4Gz6vt5lnbCRJiZd2+kddjzNAt9RDGJ9W7GV1A==
IronPort-HdrOrdr: A9a23:Vh8MvaliCv76mb99WGk5e2pPHzjpDfOPimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SETUOy1HYVr2KirGSjwEIeheOvNK1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge+VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPYf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcRcsvy5zXMISdOUmRMXee
 r30lMd1gNImjTsl1SO0FnQMs/boXATAjHZuAalaDDY0LHErXoBerZ8bMRiA1XkAgMbza9BOO
 gg5RPni7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4ZkWUzxjIjLH47JlON1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGcl2E+pgEz82IIgMgE2nsQ/pM0TJdJo+
 zCL6RzjblLCssbd7h0CusNSda+TmbNXRXPOmSPJkmPLtBOB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8XU/fkr/YPf+qKGjMiq9NVlVcQ6duv22vaIJy4EUbICbQhGrWRQpj9aqpekZD4nSR+
 uzUagmccPeEQ==
X-IronPort-AV: E=Sophos;i="5.93,193,1654574400"; 
   d="scan'208";a="75940355"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIUCcP3S0kVeBU/+beJJVYXHTuwV071RBHn3xu0PTZEmsTXhh0qMtA6xd5rT3HxNcsXFNEAfkxNK7bKpoDbTgSf0nIQ21C+Uk0qX7S6LsPrneQyTHRzYtBvroZLB9tI9DGq2eVRp2esxLTQLd+dfNzi5iP48ZAlU8XOldA8Dw0MqzutjehiuvhoJC2tbN2qFSYpazEu5mPULnppfiEyquIVv+ab5A9PL+LHN1GxgHuYgjPPI9wdbz9i05N0VMwilttvQoPdcJArzLphoS6pJqgJ141SRTtB0wAJaYrOwj7N8Gm/43oQ1w6tAVVVMW2Gu6ErKQ51KS32BViC4G+5ciQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6o9RvZbTsDfjC8LrRyMyCQQsobqoKLle2HPX71gNEQU=;
 b=YeRH0M6a61LH+Vyv94Kn91y8j/T56Pg0VFH2KXu7pN/kp1Fea0qolImYg75t+s0WsFFfvnfNU8q7YEbTymxh6jn0YWocYX/byPiih96QBRIfmU3j1/0hqBMxbJS9zBRmQBEJRrdgNT80M1qwqEKLA5z4IDhJcO7xrLtg9BzINMEr8VmFY4THGPIyTuE+3L+yuAMWdGfxT3yFVHx4ur3HYAn0Ol91YZ9Hsp0nyN2aDBsKvmFgfv40vRSkiFN+I3A987ippMBhjaGpbslx5OzPjYIhWaX0cQsRa5V/6Qg4BnMGlaahZFQ/Sl3yq2bMIFug86adC2hotEXIDBzBS4ahYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6o9RvZbTsDfjC8LrRyMyCQQsobqoKLle2HPX71gNEQU=;
 b=xggJoV50svnIW3AuqRb/Fm5mtfFMYIM4HHuWqWprCW15tTxhMoywwekzjFBfifxgX7iOBRyTIREm2zo4ikYJYXCOoZNh1+l7FFVBTU8rbdqv0zBEJr59lL6J6Pe74YBNOOtMGf0KExgbT8M9alA66Bt2f8knbtF1prcCQh2FSn0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/msr: fix X2APIC_LAST
Thread-Topic: [PATCH] x86/msr: fix X2APIC_LAST
Thread-Index: AQHYoP4rWPti1ZyqlkWj0N9bQww93a2Qv80A
Date: Tue, 26 Jul 2022 15:03:42 +0000
Message-ID: <b054b084-1ee5-489b-b08d-9e6cd8426100@citrix.com>
References:
 <d4fb4631b82643751fcb3356b094be65e5bc9bcc.1658846616.git.edvin.torok@citrix.com>
In-Reply-To:
 <d4fb4631b82643751fcb3356b094be65e5bc9bcc.1658846616.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a3aa32a-acfa-460b-118a-08da6f180797
x-ms-traffictypediagnostic: MN2PR03MB5264:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 srotp9IbVWvOIKZuNlaPNVsBRpDKF0i5Ry6gyJGyiwcqliMXe4yi6tSrjaR7J2vKtE7rVL4fnCVy1u7POmkRkF3eMRuvhfw2zUy2EKKD+wb0QsYIHe46fwRkPmdBU47jW6JAbREmknWJ01G4DLbg5aureWr3N9xCz57qi+FtW8Pa/55tvJsvPPQFRJziXpv+1ZdUjpmc8P97zKWfDdHa9WL0ZyGR1d+blQlRaPf7kVHAXPmiqeGhuHu3TGiiXSNbzu4jsVJ8Q4l7ZTI2qy4Tgc0ael21JjeC5OBFzB/42vCJGnBb4RVrhT959NG/ytBJhDpQSaEKqjeIVtLwXhAlB2x7RbvwUPh1WyqvcMwHpSIsBjraszouZ29GWUW5R/UHcTFcZZ/RM3VTNIqv0c6Xneiv9RIPH1J+GLbpVh5C+hRUHKwGegoHMKIUe7qu1ZaLTBJOB0SrMVQvmjFuntz9VgKKzP/nBnI543QdjUggWiuq0VkCDE+3mlcM5ZEWpVwlhyDm+R6vA+US1//jmnwc0q7tdK00h/fvEMqjZGDTnQIxRN0IkkrnbVDPeDinieieSJOhHIhkOn5D2Enik0xnpwF2P1YxEBUo3Gab3HBPH1Cp0GNmNE5Il8QDCf59Y5cqxd9Kok13yqDnSGvDsbjZhQuuPQora0zJWYm1pZJ93LGfsh9KeFdq41vBnnohulxF1emmi1jmtFoawofiHHxV3kHN+Do2diBMW0u/mKYD01FZ1TiNFdskjtUsvlMnfDpizit2e/qN5n7LeNPm8tHEh3oEeHV5maKeuMH593gFrffMWjasjI+S69HczZMtA79om6XHRQ7W+ENUv8k977/yH1gBbbzipv7/0cBHp4zjVu3pQFhOS2hQ4DB4cams1gJ3
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(2616005)(186003)(110136005)(54906003)(4326008)(76116006)(66446008)(8676002)(64756008)(71200400001)(66946007)(66556008)(66476007)(91956017)(53546011)(36756003)(31686004)(41300700001)(6512007)(6506007)(26005)(2906002)(38070700005)(31696002)(86362001)(122000001)(38100700002)(5660300002)(478600001)(8936002)(4744005)(316002)(82960400001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VjZIUjlqUUNpWVpXeng2dzNFMVYxUW4rZ21QOWF2Znc4U2lldnpoZTlZTTd6?=
 =?utf-8?B?dTZuNW1KSHcvV3ZQcnRPdDNMZC9mMG1LWGZRNjFveVFOcDdab25WTXh1K1hE?=
 =?utf-8?B?SHJRL3BQWmYrckl0WGtVbGViV1BPcVNhaVRKNEdqNkovS1JpR2kzQldacjFr?=
 =?utf-8?B?QXFmaTRRaUVKY2svZlp4QjJ2WjRjbkNOLzRpVHp3UG1iM1c3ZUhGQ2h2dlpZ?=
 =?utf-8?B?dVZWb0NMeUgrSEhqK0xVVHRGT2ozVVVPY1J6SG5HYUtQQmNIM3NQZGxvM1pE?=
 =?utf-8?B?Q01ZbjVDVVkzejU1NWp5RWN0TjJ2VXVDUEpuNUlGQXZwTnZUS1BvemdlOXlM?=
 =?utf-8?B?QlZrcEN1MjdSblA1N1JBSmRxeEpGcjhUNEhSZWgzWnI3cFN0ZnFlTm5BVTBi?=
 =?utf-8?B?TDBXZkpad0dtaUNqdm1Nai8xYnJEUTJGeFdkNm85aVpEVWNoK2ZadVNzTGF3?=
 =?utf-8?B?MFFMUjBkVVBoYjFVR3NWYkhtbzV0NExkZWhPcDJXZ0JtSHZMTGdNaVNGY2wz?=
 =?utf-8?B?cGd0N3oxNmtSdnpWbmhqenFQWmg0K0xNL0ZZVUJ2WC8wVWUwQTZhSFVuc2FZ?=
 =?utf-8?B?YUJoRUtpeTNNcnYxZ3MwbGQ0SFF6VEhOQTdkUG9YTTBQQ3BHVUY3bGo2TjQ4?=
 =?utf-8?B?N0J1cWxPbzNwejcyRmc5WExtaXMvS2dsQ1UwdytQbmZNYVB3Qlg2SkRqcUYz?=
 =?utf-8?B?bEJqMzZCNzM1eFUvTmFtcFg5YjFsMXFVbnVDMXdLRGtlbjJ4ZkkzaFpqZlpr?=
 =?utf-8?B?OG9Bb0V0NElSMy9BclBjYTYyb0tsVU9QZWU2cE1zbFd4MHFrTmxsdnp3Q0o5?=
 =?utf-8?B?NytXL01KVm5WZFh4S3FpSHI5QmNYa2dBZmFxQ3E1ZEdZVlFyZ2lWMlBiWmJC?=
 =?utf-8?B?OVdCU3RUZmdZMGFDa2dabUFHQzNRSXNjc0w1NTQ0RnI4OXptSTJWZEI4bXNV?=
 =?utf-8?B?eER1UUFVZnVOeVkydnpLRFNuS2pLSk40UEdhUXNjcFRKWDgyZVFJWU1JM05V?=
 =?utf-8?B?L1lMWnBNYlN0Y0Zxc0lBdmNGRkM2dVJGbzBmYW1Ibk1nM2Y3bElKaGFWNGZU?=
 =?utf-8?B?akk1TEV6RytycnR4eFI1dzVXcnBGUVc4c0lKajlhcnVOcXhLeXRFaC9KSDJB?=
 =?utf-8?B?Y0s0ZzkxSUxDMFpZdmF6ck5lOTdLaTlZNWtaSU1hTkw2OCtnbGI4S0x0WTQ4?=
 =?utf-8?B?Y1RjZDl2ZXZwaFllNEhkSitvTHNnL1Z3UndDSlJvV2twVmJzUmNvWThUUTdo?=
 =?utf-8?B?ZEZQSG0wRWdhM1Y3MEZLQ1l5TU01c3JEa3VEQ2JVWW95aUlKYU8rTFNUcU1l?=
 =?utf-8?B?NENuTjJ3WVhLM2U0d1dSZ2VpSnlXNVlKTUZRQ3QwcXpCMzdDZzFZTUNNb2lp?=
 =?utf-8?B?NGlwVmZyNTBGa3RSSHJETWZwVmxYd2V2Z1l5NDMzYWQ4NVhPd2d0Y3JUbUty?=
 =?utf-8?B?Y29UZzhSSExRb00rTlVvM1NKZmNoOEt2b0lxaEVEdE5HL2hHMmMyV25tMlky?=
 =?utf-8?B?NHN6aEpEM3Q2Qjk1R2ZrdGFZdUsyL09MbTZLczRQV25vY1RuS0V3d2FYOHdj?=
 =?utf-8?B?bXVnY2w0YVY1UmhlWkNITlJxZXhlOERwbEpWZUl0Z0NBSVIxWmNNR3NvK211?=
 =?utf-8?B?YWlQYmFUSG84TjNwaDZFZEd4cWRsdC9SOHRIeExucVBZOFU0dkVNL0JRZG51?=
 =?utf-8?B?bVRxZnk2UFdxSEpSMXZhdnpJR3NwelBncGJjRkticXVIVVJTZ1lEOTB1T1E0?=
 =?utf-8?B?N055Q0lTNWlvU3kwTHVtdnhYMFgyb3dwVkhZQnoxR2RIbGFWNTk3VVFFdmpz?=
 =?utf-8?B?QklZWGlodDRFQkhiS2x6WDdSLysrSjUwS0ttS296a2lMODJEaHVjM0o4bDdB?=
 =?utf-8?B?K0FaQVZvNzZZcGtwcHhqRjZLRzdhZjd4cjBnM2JZWHZRV0M3MFVBYVdXcGNJ?=
 =?utf-8?B?MDBwNCtHL2xiNFpuWVdkNlpBYjVjbDBsaFJSb3BYWWphOTBCNlk5YVJrdkIv?=
 =?utf-8?B?L3FLM2VxMTlsVkRmdmFaSFNRc2VkWVQ1TlZNelQ2WTJpMzhMdzdBVzNKazhY?=
 =?utf-8?B?cTE0b1hRM21DOGJScHA5VUFsZHkySmQyYTI1OWFJOEMzOVl3eGVNWmt2bC90?=
 =?utf-8?Q?mcMk5MP9NAjFJa2CoKmUekzxJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <86F62CDCB7EEFD45A9200929C56DED46@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a3aa32a-acfa-460b-118a-08da6f180797
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 15:03:42.3429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LTFMi0wN/lUTZ7VgU0fCUuQopMRn4Wf0l9E8vm0wpNuZTj25gkCncaiez0sbVnrvQEREDvxYULO0zzHe5aDG3+0Ko7BUha/gvMrVY7BpqHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5264

T24gMjYvMDcvMjAyMiAxNTo0MywgRWR3aW4gVMO2csO2ayB3cm90ZToNCj4gVGhlIGxhdGVzdCBJ
bnRlbCBtYW51YWwgbm93IHNheXMgdGhlIFgyQVBJQyByZXNlcnZlZCByYW5nZSBpcyBvbmx5DQo+
IDB4ODAwIHRvIDB4OGZmIChOT1QgMHhiZmYpLiBUaGUgQU1EIG1hbnVhbCBkb2N1bWVudHMgMHg4
MDAtMHg4ZmYgdG9vLg0KPg0KPiBUaGVyZSBhcmUgbm9uLVgyQVBJQyBNU1JzIGluIHRoZSAweDkw
MC0weGJmZiByYW5nZSBub3c6DQo+IGUuZy4gMHg5ODEgaXMgSUEzMl9UTUVfQ0FQQUJJTElUWSwg
YW4gYXJjaGl0ZWN0dXJhbCBNU1IuDQo+DQo+IFRoZSBuZXcgTVNSIGluIHRoaXMgcmFuZ2UgYXBw
ZWFycyB0byBoYXZlIGJlZW4gaW50cm9kdWNlZCBpbiBJY2VsYWtlLA0KPiBzbyB0aGlzIGNvbW1p
dCBzaG91bGQgYmUgYmFja3BvcnRlZCB0byBYZW4gdmVyc2lvbnMgc3VwcG9ydGluZyBJY2VsYWtl
Lg0KPg0KPiBCYWNrcG9ydDogNC4xMysNCj4NCj4gU2lnbmVkLW9mZi1ieTogRWR3aW4gVMO2csO2
ayA8ZWR2aW4udG9yb2tAY2l0cml4LmNvbT4NCg0KSGF2aW5nIGRvbmUgc29tZSBhcmNoYWVvbG9n
eSwgdGhpcyBjaGFuZ2VkIGJldHdlZW4gU0RNIDY4IChOb3YgMjAxOCkgYW5kDQpTRE0gNjkgKEph
biAyMDE5KQ0KDQp+QW5kcmV3DQo=

