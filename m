Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F1F511CBF
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 20:04:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315368.533894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njm15-000838-87; Wed, 27 Apr 2022 18:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315368.533894; Wed, 27 Apr 2022 18:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njm15-00080P-3u; Wed, 27 Apr 2022 18:03:55 +0000
Received: by outflank-mailman (input) for mailman id 315368;
 Wed, 27 Apr 2022 18:03:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8dk3=VF=citrix.com=prvs=109ad7ccf=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1njm13-00080J-DH
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 18:03:53 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63c79712-c654-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 20:03:51 +0200 (CEST)
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 14:03:46 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB3946.namprd03.prod.outlook.com (2603:10b6:5:48::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 18:03:42 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 18:03:42 +0000
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
X-Inumbo-ID: 63c79712-c654-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651082631;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4/xXnZrT2P5saFsPgvZKuPcLIfigjqJ+KiYXcZ7HJ5I=;
  b=U/t3adGCATUwMzpWqHgZRGXcC6pv/pcUUnS9GoK+R2myFckFQdpcfQ+9
   GgjA1R1uBDFh65hd16iS/UEeNqWte+YQNz2zsOOiGa7CfCEebPWXNvJLn
   quMxTfPB1xZKCv9x3zgVK2aMdF4wGnQwRTEaxe8XH4L2RF/+doDVuD4U8
   4=;
X-IronPort-RemoteIP: 104.47.70.104
X-IronPort-MID: 69467497
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:TyCad6vTdOMxMpgrV4oJdgNDwufnVHNfMUV32f8akzHdYApBsoF/q
 tZmKT2AbKuPNjHzL9p2a9m+90kP6sPXytZjHQdpri8yFHhG+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1/X5
 ouryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8UO6/ioeUecCBkOCxmL59a1uDGYiSw5Jn7I03uKxMAwt1IJWRvZcgy3LkyBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4AAmm5o2qiiHt6HD
 yYdQRNpYA7NfFtkPVAPBYhltOypmmP+Y3tTr1f9Sa8fvTmPklMtgeeF3Nz9fPfRG9wEsh6kt
 jie3mPFHhwEDtmQ1m/Qmp6rrqqV9c/hY6oeCqex/PNuqFaawHAaAlsQWEfTiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0WdBdDuk74wGl0bfP7kCSAW1sZiFFQMwrsokxXzNC/
 lOXhdrjCDhHubicW3WbsLyT6y6xURX5NkcHbC4ACAEDvN/qpdhrigqVF44/VqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTxgbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:14Rz+6mpAjnjIvrV4wbZbXiDqxXpDfLW3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRUdcLW7UpVoLkmyyXcY2+cs1NSZLWzbUQmTXeJfBOLZqlWNJ8SXzIVgPM
 xbAspD4bPLbGSTjazBkXSF+9RL+qj6zEh/792usEuETmtRGt9dBx8SMHf9LqXvLjM2fqbQEv
 Cnl6x6jgvlQ1s7ROKhCEIIWuDSzue77q4PMXY9dmcaABDlt0LR1ILH
X-IronPort-AV: E=Sophos;i="5.90,293,1643691600"; 
   d="scan'208";a="69467497"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxKxBBZf75uWYVsD1dPur2gQJTudUljVdD1kCiJ0/hgQdl6tGqaf6tzhYMZUs7SAuRX73QyFbB47G33CRJzkAWeObetHbfe9loa1g6pJawcgDk5HFVVjdEWHbztHEzqbGNknaM9oyuzd728Twv7JYjoaXHyNvI4kEVmmFAidfwhNLvLgpSv7guyhcquZFg+JlxnK54MJFp9bMnM+MIouJtf117Nelz/+PP8fYDGdYPAfVtBy7BpYGY2LoCV9m0uWa1hcoNYvfMcazNVi0IY9VHuQ8x3BvvrRRyDizvsY9cEOzRNg+GCXcebMejPmcvMy2tdByVRejXDdZunOzKax0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/xXnZrT2P5saFsPgvZKuPcLIfigjqJ+KiYXcZ7HJ5I=;
 b=CShnquIyHZp7/7mWA0K7yiP8yIdhZMj9LTaFzpg3kXOThq8JdBXsTkVokb3rfcH+A/SIrxDBqpfD+hRj3C20p1lgTXfzwldaQz0d+btxd+rUwRNqZTEaKa5QZKZE2FCHgCICCGniaBYDuyTKFRySVypyM5E+ttzLDIemspksIsNZRxJ/FlyLhFbvn/gNUIIa6RKWb6d+5NE0Z55fF2EU3DGwm7xJJWKiyiwen2v73BmOWJ3j6OAJ1Y4dheNIzT08hUlcFKNWy0IQ6EttaQGLjU8zFySLy0D2CECTp22wn4rLoCxv0STlyztKLSG4pL9KehWp/tEKz0s+xDBqquLBKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/xXnZrT2P5saFsPgvZKuPcLIfigjqJ+KiYXcZ7HJ5I=;
 b=sX2KERvESQEXjXAgHgwxLoPO81G3Yacega/q5x/EZB82dqV5/siadCVWNYjPzZ+Q/CE1hzT4K8R3LK/h4+JL/wb0ev69cFtuCPvklfOJJcWuSW7c/prSRbDhgxvKZZUwaGiya839RNi3t7GweRpftYKJHoc/demwPOy7DGI6/yo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: David Vrabel <dvrabel@cantab.net>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, David Vrabel <dvrabel@amazon.co.uk>
Subject: Regression with CET: [PATCH v1] x86/mm: avoid inadvertently degrading
 a TLB flush to local only
Thread-Topic: Regression with CET: [PATCH v1] x86/mm: avoid inadvertently
 degrading a TLB flush to local only
Thread-Index: AQHYU/6tz3jdg/qffEGRsGMfdOOu1q0EGkOA
Date: Wed, 27 Apr 2022 18:03:42 +0000
Message-ID: <6076f458-a56f-448b-2001-6af38b998edb@citrix.com>
References: <20220419150320.64783-1-dvrabel@cantab.net>
In-Reply-To: <20220419150320.64783-1-dvrabel@cantab.net>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed6e3109-2db9-45f3-ddae-08da287843a1
x-ms-traffictypediagnostic: DM6PR03MB3946:EE_
x-microsoft-antispam-prvs:
 <DM6PR03MB394680DCCED66673F7A6C9D7BAFA9@DM6PR03MB3946.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 iVAGEKTs7p+LR6fXUnfVOZ0LI+p4zqEJbOYDBivnXuix1gJ04p3HGGAsj7aJJ+DsT6QlNiUX43HGnnge4g7qIO2sTzQ2zrYmV6R1S6cWARTS8QorFXtlp6Uk89o8gFIl+kLW5DgtDc4II8vD1r/XOM7tH/HMR7dQsK0Mn9fEpZlqfBRSoDh3yQoxblceBVq2us1y7hpr+mQhP0mVRRPJajmi15mze7RjCGiRevQuF4FImW84EI1MOtCGnDYNNGzSimIjgen45QXLHfXRh35slUeBzVkmovRDhpLqP4zsaIcfi9RuqNvznOfP5QS/P8FLB6EeqfiedDqVT+T8L0YIktPoQA20SUr1p3MfI4sh/2EPZlwG6c1lpSdA6vh/I7KNrs+OWs2qAjrcSnjC5fEGWA85qmMdXjEwWXKsHDZ8VsT1MsHbkAUVMLzyJrMzxplMyu5Ndc1lBxeZMoQNrgs6xUAD8kVaj/14h+bO9EObZ+sE7Til/jodQgJ7K6tlrBWlC55r3V6ilda7pdTdPhhEEPYoY1sP1CnO1b6/DlFni14VYLMJhrn0QTmZ7Dc7cayP3Cs4oThR7q3Xxj83mAtOda3ZaD5eDb52dAUDK9IqAG/ZcDzOvHkD9/0aPdkaSGmr5KMctYkdK1DazfC2NeYfnKy2HjzNUT2C4Yyxjh0kCCixeFH6oIW+UshYMo4xj69S4prJX46mU6oQRg3TqRGutegMMbtwAiayvVeez5TVRtU/FkvZacLKA3ckoHRlWfaP8fIyqf1PSUwxVsxIOObBjg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(316002)(2906002)(86362001)(31696002)(5660300002)(8936002)(4326008)(8676002)(76116006)(66946007)(66556008)(66476007)(122000001)(38070700005)(64756008)(66446008)(82960400001)(83380400001)(2616005)(6512007)(91956017)(26005)(186003)(53546011)(6506007)(110136005)(71200400001)(54906003)(508600001)(6486002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SElYak1YYTkzWENsR0RTN0RLTXZZdlpQOUt5N3lqRXZJTCt5aFdWT3QydmJQ?=
 =?utf-8?B?aERpK0lGdmdqUVFnejlJRmI4U3FUVkpTeW14U2dCMzh1WTJMYjVMTWc5Rzhn?=
 =?utf-8?B?aFVIaG1RaFNsbVdDQVhZUWxFeWJSV216NkNQRFNKOHpkWGR6UEdSOStlSTYy?=
 =?utf-8?B?UFNKZzh3K0pZSTIrTFRiQTFDVmRtTm96OHJqRmN2OS9lZEN5WGp4M0NiRGxt?=
 =?utf-8?B?TWJhdC9xN012R0YyY1NwSVZCU3ZlWFJMOERyUzdYU3l3Z1pTSEY2SEJ6cEdy?=
 =?utf-8?B?alhCR2NyZUVJSWFZZkZNMmszZlBQNDJ2MWJvTE1JZFJVUFA4RmUvb3dGeVds?=
 =?utf-8?B?dDhuQi9rTi9WVjFQZmF3VXBwU0V3d1VhZjJYMGt5TFNCME5hejJSVWZ5R29H?=
 =?utf-8?B?Y2tMZnpjQzg3cllLVGZiMGtiMFJyWTN0TU9GVzU2ZmV0WGVYemdZalhkWnJp?=
 =?utf-8?B?Z0dpZGUyZmVtdUxHT01Pam1Wb2xnaEdMZTFXbm9KK1I3UzR3b0xISXdsODlO?=
 =?utf-8?B?RkJhNDU0ZndaL0F0NHZva0dPM3NBdm01UTlWSWVETUxabFY3Sk4wd0UydXdR?=
 =?utf-8?B?ZmtBdnNYT2ozaW1FdTZIN2xNTmw2VDRGYTZBM28rVXdxRWw5QkJlc1kxUGZ3?=
 =?utf-8?B?cVd4clppaC9jdzd2VjZvbnBQcTBhQWVaSlJXNGlqZUhBWUorTE9NOTlYMHhu?=
 =?utf-8?B?U0RyaGlaTHRpQVNmNks2WXZMZEY5QVVNUDU0OHdMZnFUY0h0UEZuNlZUWDhy?=
 =?utf-8?B?SVZSU3FsRlA3QnlkQ3IzOWJRL0ZaUkJvMEdaSmFURlVrTGFrWXFpME84dm1t?=
 =?utf-8?B?TDB2RDIveDU1THYyUHRNMktUbmZvS3NGUEVvSkw5MEFrRGNJelB3WCt3SUZ5?=
 =?utf-8?B?bEZmSFk0MVg5SGtxR0NocDAvYktYcU1JOStXVUxTS3JlZGt4QjNmdVBNN2xr?=
 =?utf-8?B?MUZDU2l2Y0xYQUJ6NG1ISlRTUmdUUnE3V0hvNlNFNHRMMERyRXJpS1YyQUlZ?=
 =?utf-8?B?OTVsMC8wWFRpbWNLWjQ5ZEJjTzFoM1k2N0FYQlJ1bWdISlVNcmdsWTZMcTBN?=
 =?utf-8?B?UHRRaHdpeUxFbkpHSGxIdklPUGxVUDNLdndOVkZYUlRtS253SjNWRE8xMGlk?=
 =?utf-8?B?UVNSdk9NcGV6c1d2ZVBSUDdBSE1QdjhpMXF2ZEd2em43ajUwaDBvWmROTkcv?=
 =?utf-8?B?RHcycjZLUzkySm16aW10dDdrT2JENjlST256SmdWTlNmYTloQzJxS0pJdklF?=
 =?utf-8?B?dUFsK1Zrd0crb2VmbWZWcE02V3dPbjhuTWJKb0RxVWtxZ2l1NWUyYXpySElM?=
 =?utf-8?B?RXZtaTN2ZlU4c2V5UGhmWTJRSGdoVEVKODY2T1owUzRtcEZpY1VpUm84eXI5?=
 =?utf-8?B?RDNLK3VaWGgrMDE2MWNaUzMzSmloQlRaLzU4MnR1eUVSSW5SZ3RSRkRWT0Fn?=
 =?utf-8?B?RFR6YWk2V2g3czE2a1hJbXhqSzRMVWhQZ1Nzc1Q2eU9ZMkFJYzFubVozRDRj?=
 =?utf-8?B?Q3Y4Ujg2eUgvZHltUkx4WVhjbkFha0wrOXJNazUvYkk3OWhBOW41akJuOFBD?=
 =?utf-8?B?UnFUcTdid3BhODJSd2NNQmR1SnBjTU1ZdU4xYWkzOEJ1MXR6NFBIQ1ZFWGdr?=
 =?utf-8?B?Q2UxeSs5MnlqK2U0UWdhU0ZVZFFqWkpOQ1ArdWhZc29GWm42VFNQT2pUL000?=
 =?utf-8?B?SkcwNFFkQ0Roejd2S3pQU1BMMXVyU3hZRjZBcVVnRUNIU3VLWEtBY1M3K2Vn?=
 =?utf-8?B?UkFnSGNVQURDUW1wR1N2MGdJUUxkRHB6RUpTV3FTM25HcG51RERsendEdzE3?=
 =?utf-8?B?OWo5Y2VKdko3Syt6RTJVWEl0MEwzNEIxSVhxZ1BUVWkxWStWcWNUMW5YaWdo?=
 =?utf-8?B?OWhNUkVvbDNKSS9wN0tIeU5SNVJrTFFpVk5iZzFQQWdKS1doMW54OUkzYmo2?=
 =?utf-8?B?eHFHK1kzUC90OGJVVVJ2S205eU9QeGdiUzFUaVR2aTMvVGxQN1MvOUhGb2Nv?=
 =?utf-8?B?Y1ZIZkZWcjVWT25ia3JUcW41NExEaFFMOERDazRnaXNzZGJnV0wrRFFBMzBy?=
 =?utf-8?B?MkZrNzhmU21RRm4wL1BqbCtVaitpY0x3RTdYdFpNdlRzRWpKeXI2dUpNWmw3?=
 =?utf-8?B?M1Z0TUxWSW8vTk0rektwVmVxcklCdStrS3JqcTBTVGp5SFp3M1dicW9TdkNF?=
 =?utf-8?B?cVZNUFp4a2FPaTU0b3pKWHUzNzRadGZQWUZjU1lFSHlrTHFaS2hHdFVXK1hX?=
 =?utf-8?B?clJJbHo2UW5uVi9OQlcrNnpuall5TWt5ZndmN2pVYitKcTlxWEF1K2ZOdkRx?=
 =?utf-8?B?cWVqRlNQblFaU1dheEMzRmZ1QzJncnNLUWNNcUx5dzBuUzZaR3o4VzVDUDNX?=
 =?utf-8?Q?aLDAoRWtn7Bz56pU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B8ABA3647D1BC84DAFD7177029A0D038@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed6e3109-2db9-45f3-ddae-08da287843a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 18:03:42.1902
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K6WCHJBuapRwto2QLg6zELHkYB7+RVslLrHHM62Vz7pe/JLVNKK6j1aa8TyHUH1gmY5yVOzd1AHAQpzZ0eNSYs4rUrYaWeJ8Xu8Nh66PTKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3946

T24gMTkvMDQvMjAyMiAxNjowMywgRGF2aWQgVnJhYmVsIHdyb3RlOg0KPiBGcm9tOiBEYXZpZCBW
cmFiZWwgPGR2cmFiZWxAYW1hem9uLmNvLnVrPg0KPg0KPiBJZiB0aGUgZGlyZWN0IG1hcCBpcyBp
bmNvcnJlY3RseSBtb2RpZmllZCB3aXRoIGludGVycnVwdHMgZGlzYWJsZWQsDQo+IHRoZSByZXF1
aXJlZCBUTEIgZmx1c2hlcyBhcmUgZGVncmFkZWQgdG8gZmx1c2hpbmcgdGhlIGxvY2FsIENQVSBv
bmx5Lg0KPg0KPiBUaGlzIGNvdWxkIGxlYWQgdG8gdmVyeSBoYXJkIHRvIGRpYWdub3NlIHByb2Js
ZW1zIGFzIGRpZmZlcmVudCBDUFVzIHdpbGwNCj4gZW5kIHVwIHdpdGggZGlmZmVyZW50IHZpZXdz
IG9mIG1lbW9yeS4gQWx0aG91Z2gsIG5vIHN1Y2ggaXNzdWVzIGhhdmUgeWV0DQo+IGJlZW4gaWRl
bnRpZmllZC4NCj4NCj4gQ2hhbmdlIHRoZSBjaGVjayBpbiB0aGUgZmx1c2hfYXJlYSgpIG1hY3Jv
IHRvIGxvb2sgYXQgc3lzdGVtX3N0YXRlDQo+IGluc3RlYWQuIFRoaXMgZGVmZXJzIHRoZSBzd2l0
Y2ggZnJvbSBsb2NhbCB0byBhbGwgbGF0ZXIgaW4gdGhlIGJvb3QNCj4gKHNlZSB4ZW4vYXJjaC94
ODYvc2V0dXAuYzpfX3N0YXJ0X3hlbigpKS4gVGhpcyBpcyBmaW5lIGJlY2F1c2UNCj4gYWRkaXRp
b25hbCBQQ1BVcyBhcmUgbm90IGJyb3VnaHQgdXAgdW50aWwgYWZ0ZXIgdGhlIHN5c3RlbSBzdGF0
ZSBpcw0KPiBTWVNfU1RBVEVfc21wX2Jvb3QuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IERhdmlkIFZy
YWJlbCA8ZHZyYWJlbEBhbWF6b24uY28udWs+DQoNClRoaXMgZXhwbG9kZXMgb24gQ0VUIHN5c3Rl
bXM6DQoNCihYRU4pIEFzc2VydGlvbiAnbG9jYWxfaXJxX2lzX2VuYWJsZWQoKScgZmFpbGVkIGF0
IGFyY2gveDg2L3NtcC5jOjI2NQ0KKFhFTikgLS0tLVsgWGVuLTQuMTcuMC0xMC4yNC1kwqAgeDg2
XzY0wqAgZGVidWc9ecKgIE5vdCB0YWludGVkIF0tLS0tDQooWEVOKSBDUFU6wqDCoMKgIDANCihY
RU4pIFJJUDrCoMKgwqAgZTAwODpbPGZmZmY4MmQwNDAzNDUzMDA+XSBmbHVzaF9hcmVhX21hc2sr
MHg0MC8weDEzZQ0KPHNuaXA+DQooWEVOKSBYZW4gY2FsbCB0cmFjZToNCihYRU4pwqDCoMKgIFs8
ZmZmZjgyZDA0MDM0NTMwMD5dIFIgZmx1c2hfYXJlYV9tYXNrKzB4NDAvMHgxM2UNCihYRU4pwqDC
oMKgIFs8ZmZmZjgyZDA0MDMzOGE0MD5dIEYgbW9kaWZ5X3hlbl9tYXBwaW5ncysweGM1LzB4OTU4
DQooWEVOKcKgwqDCoCBbPGZmZmY4MmQwNDA0NDc0Zjk+XSBGDQphcmNoL3g4Ni9hbHRlcm5hdGl2
ZS5jI19hbHRlcm5hdGl2ZV9pbnN0cnVjdGlvbnMrMHhiNy8weGI5DQooWEVOKcKgwqDCoCBbPGZm
ZmY4MmQwNDA0NDc2Y2M+XSBGIGFsdGVybmF0aXZlX2JyYW5jaGVzKzB4Zi8weDEyDQooWEVOKcKg
wqDCoCBbPGZmZmY4MmQwNDA0NGUzN2Q+XSBGIF9fc3RhcnRfeGVuKzB4MWVmNC8weDI3NzYNCihY
RU4pwqDCoMKgIFs8ZmZmZjgyZDA0MDIwMzM0ND5dIEYgX19oaWdoX3N0YXJ0KzB4OTQvMHhhMA0K
KFhFTikNCihYRU4pDQooWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqDQooWEVOKSBQYW5pYyBvbiBDUFUgMDoNCihYRU4pIEFzc2VydGlvbiAnbG9jYWxfaXJxX2lz
X2VuYWJsZWQoKScgZmFpbGVkIGF0IGFyY2gveDg2L3NtcC5jOjI2NQ0KKFhFTikgKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKg0KKFhFTikNCg0KV2UgcmVhbGx5IGRpZCB3
YW50IGEgbG9jYWwtb25seSBmbHVzaCBoZXJlLCBiZWNhdXNlIHdlIHNwZWNpZmljYWxseQ0KaW50
ZW5kZWQgdG8gbWFrZSBzZWxmLW1vZGlmeWluZyBjaGFuZ2VzIGJlZm9yZSBicmluZ2luZyBzZWNv
bmRhcnkgQ1BVcyB1cC4NCg0KfkFuZHJldw0K

