Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC1063EF6D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 12:27:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450556.707876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0hi2-0002yo-Un; Thu, 01 Dec 2022 11:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450556.707876; Thu, 01 Dec 2022 11:26:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0hi2-0002wX-Rs; Thu, 01 Dec 2022 11:26:30 +0000
Received: by outflank-mailman (input) for mailman id 450556;
 Thu, 01 Dec 2022 11:26:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/wf=37=citrix.com=prvs=32775c42f=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1p0hi1-0002wR-Eh
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 11:26:29 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d818e7a-716a-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 12:20:11 +0100 (CET)
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Dec 2022 06:26:18 -0500
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 SN4PR03MB6703.namprd03.prod.outlook.com (2603:10b6:806:21f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.22; Thu, 1 Dec
 2022 11:26:17 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22%5]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 11:26:16 +0000
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
X-Inumbo-ID: 1d818e7a-716a-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669893987;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=YmjI6pAkG+BdzKjrihEgJqAvcwNj3hrdHNXnMlDRRp4=;
  b=Vv0FR55rkwGuuRMWigEPV/dXMPcIWuWcOZshaX/kEq4onOh/cgr9O5+7
   /SNClo0cnp0OL87dA8XIry0ofgnlpuFzpiWS6dKmVJqyAbwPrZmfK6HXb
   GlaikZeBGc1dzDDIMpRdIIv+9xrwFRyLEHXQ8+iLu5AlS5D+WMvVWrS/0
   M=;
X-IronPort-RemoteIP: 104.47.66.43
X-IronPort-MID: 88568380
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:MPb2AqJ26lXE1F+UFE+RzpQlxSXFcZb7ZxGr2PjKsXjdYENShDwFm
 GQZXWrUM6uDN2b3eY90Oom18hkCvJaDm9JrQANlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5ARnPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5xQj9z9
 NBDAQoGLU65t8SEzpuiSftj05FLwMnDZOvzu1lG5BSAV7MDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/RppTSIpOBy+OGF3N79cdyQRN5Jn0+e4
 GbH+Wj4DTkRNcCFyCrD+XWp7gPKtXOrBdxCT+3gnhJsqFO55WsNMU0Pb0q2u8C/oRS1dPBcK
 mVBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQqvdE7bSYn3
 ViIm5XuHzMHjVGOYXeU97PRqCzoPyEQdDUGfXVcEVBD5MT/qoYuiB6JVsxkDKO+ktzyH3f33
 iyOqy89wb4UiKbnypmGwLwOuBr0zrChc+L/zl6/sr6Nhu+hWLOYWg==
IronPort-HdrOrdr: A9a23:k/+RWq3xTnLqHecpws4OpQqjBVxxeYIsimQD101hICG9Kvbo8P
 xHnJwgtCMc+wxhPk3I+OrwaZVoLkmskKKdjbN/AV7AZni3hILLFvAH0WKK+VSJcEeSmtK1vp
 0BT0EKMqyTMbEMt7eY3ODXKbgdKZK8gdmVbK/lvg9Qpf0BUdAr0++HYDzrWXGfumN9dNIE/d
 Onl7d6T0HJQwVbUu2rQnMFU+LAvNHAlIvnbRkaDR8q4guDgFqTmcTHOgnd0REEXzxVx7A+tW
 DDjgzi/62m9+q20xnGygbonuNrcfbau65+7fa3+7woAySpjhztaJVqWrWEsjxwqOaz6EwymN
 2Jpxs7Jcx8537YY2nw+HLWqkDd+Sdr72WnxU6TgHPlr8C8TDUmC9BZjYYcdhfC8UIvsNx1za
 oO1WOEsJhcCw/GgU3Glq71fgAvklDxrWspkOYVgXAaWYwCaKVJpYha509RGIdoJlOJ1Kk3VO
 11SM3M7vdfdl2XK3rDuHN03dCqVnMvWh+bX0kLoKWuonRrtWE8y1FdyN0Un38G+p54QYJD/f
 7YPqNhk6wLRtMKbLh6GPwKTaKMeyPwqVulChPTHbyQfJt3eE4khfXMkfcIDKDDQu1H8HNE8K
 6xEW+xlQUJCgfT4ebn5uw2zvkMehTPYR39jsVFo5RpsLz1Q7TmdTeDQEsjns+po/AVBNyeQP
 CuJZJQDffsIWzyXZ9T2QfzQYNfJBAlIb0oUqVSYSPLnivmEPyaigWASoetGFPEK0dbZov8ak
 FzGwTbNYFa6Fy3Vjv2mx7UH3P3fEvn+4lseZKqodT6kuU2R8txWit5syXh2inKRAcy6ZDfMi
 ZFUenaeu3QnxjowY57gl8ZYiZ1HwJJ5L37XzdQqRUXNl6cS8dfh/yPPX1X1GGKYgByVNnXFg
 k3nSUqxYuna4GLgT04A9ikMmWVy3sfzUj6NKshpg==
X-IronPort-AV: E=Sophos;i="5.96,209,1665460800"; 
   d="scan'208";a="88568380"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itVPV0MocV/g2jX17cVYIC2Ow7NFkzKLlzD0wNznFt7OPOma6t8Nd3og6lT/YSIVdx2Lr0r9AkDr46OXcXvLEAqYSy87vSWC+r5M4X5pyZV5szt/GJPNMIiS6Dg2aDialicmJjdFihNzVpPc/fEiufkMAJ/00sjaJM6IPvyyzSp5YlWAdohYWsbGAtninWgh16ZAZPDbc3s5zetrIrYQGou5gu5WqvAq0OoabncYuAGLZv2+Xzl35zPA97p4NJ1PUWtUw2mdJWlx4TUKyiAK7g67FFZYzrkmZaewWdVF1gkn0cZWkOAO2v5NiKMQ9i5OaEuw1QJdYXyc3qIbyHDs4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Aqy0MZ9IAOZpNXFwlHlIPsi2nmbKD9KDE9zcUf9O7k=;
 b=dquSSfdfwPqQR4SRH46AZl8Yy0EBC1uNWqd9hTKG/uODR/MAKwqcK6uNYk1XK+15TaOts126Dk2tZOx/2svp7sC4B6JLwpp1FaS+8CCSDxWRPMhwvHMiPnPM09xV1GAvfiTABV3jEzEWCR8tH4guRrbBh9QRetCaliyzU02CITZbokyyzISdsrO9A4yJJdyJf82ZGgFepsB+qpEcKsXRDEmobg5ZA8hK78VMQ4Oe5Lf+WtRJof1wrO/MVOnjwfiXp9HTcSejOxkn4JVqGYhDzc6ylRIzkgG7pwFReaGIDkNnbPfyw6pdD0phn2c1akBx/d+/flvVAQ70BMyyoAxR4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Aqy0MZ9IAOZpNXFwlHlIPsi2nmbKD9KDE9zcUf9O7k=;
 b=NyRUSHTdaqjHfZYMi2eNa3c1J4EsQnXwoYWDZiDbuXqtEjlNtUs/JU/w8YeXhveC8PPI1bI+MlAtiH874lw/CRSMI052t01NQsvpdJ4WCUfau0wSdyzBAx+ZJKUJRJWbhhCq6lo5yfqjAdwA2C9Nrv1RIIn9L8YgzFC1ZhSQNG4=
From: Christian Lindig <christian.lindig@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>,
	Edwin Torok <edvin.torok@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>
Subject: Re: [PATCH v2 3/6] tools/oxenstored: Rename some 'port' variables to
 'remote_port'
Thread-Topic: [PATCH v2 3/6] tools/oxenstored: Rename some 'port' variables to
 'remote_port'
Thread-Index: AQHZBNyG3m7L7jSbr0+plHBtk/aEza5Y5boA
Date: Thu, 1 Dec 2022 11:26:16 +0000
Message-ID: <775FA3EA-6F85-4706-8159-EB8CFFD983E2@citrix.com>
References: <20221130165455.31125-1-andrew.cooper3@citrix.com>
 <20221130165455.31125-4-andrew.cooper3@citrix.com>
In-Reply-To: <20221130165455.31125-4-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|SN4PR03MB6703:EE_
x-ms-office365-filtering-correlation-id: 65a11df0-ffe8-4a97-56fc-08dad38edcc5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 HMEaC2Aj7+Q1MJLWWGM0Lvib2IMxRlbXYGqGMkt9stLueneG3U9HI8SinNEA1c0R79hg9FXWqV4Agn7RYB2OU51f2LR9MpCAB95tO+iGw06QsbTWPoD8wcL7rHSLt0dKUTeg7mNSGuM3WPdNCpRUHh43g6hX4ImlVL0eNBo8W/EVjnIZ7EQGEyQz11UUbJmHRH/bRVES1Ggz/Zw0Ws7i6NTaiPR1xqiX+oYEK+eoxz5ZFqby1X9+/PABqUPaShvCeJhm76evbAS+OSzqvvS/HPOBH8vGpPXRyZXlS+HQxCH3GaL5LFDHHSQ9nBFFu3jy2N1O/cF8klJK6PyCgnDY/UrWjyB59upANnjKjKljFYVDA5PL8zvnSR0bC5obuENhDFMMz7i+CWwvO4rrlFizC90tJ2Yqu+NE+c6QzqOZBgG1+5hPNHkzghusfExh2mCumQd/yh8fxUAZh2TuWn5Gk+d9GsMBLrAkX0MbpJkghQpTRIa+5jwkPtR82xi6YMLVfJygsKc1HZ3kM3nzlWgxFy7YtJ5D64Iefrk3UEE9wdqOXSSdd7UeopT7foOUTnWzPb41h/BLFs6HKDgCdz9FLlVILaJYV9ULhDj/daCxY2//nRK0ZbqCYrpX1MIr3ZOwMCNVlTruj8e2gAaMZFi0vjU1j3KDllAI5goAqaSIjHHeh69/GDuZ3PzDlPbYRwYoYEAk4FUvJKWXeD3bdp9+IjtEsEszanDr3hEfbXRyeuA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199015)(33656002)(2906002)(83380400001)(38070700005)(6486002)(478600001)(91956017)(44832011)(64756008)(6506007)(66446008)(82960400001)(66556008)(66946007)(86362001)(122000001)(4326008)(107886003)(8676002)(76116006)(36756003)(316002)(5660300002)(6512007)(26005)(186003)(66476007)(71200400001)(6636002)(54906003)(2616005)(6862004)(37006003)(38100700002)(8936002)(53546011)(41300700001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?N927CAaHTW+84+VKyVt6FbARqx6UjOOcSiYCedDLE3VX0LCI4g85t3ZmFAL2?=
 =?us-ascii?Q?JsG8MEktcRVpbtKZIcVYJsVV3of/F0s5OD/cUJKRkKHWmgU8zMRhnrOy4ZFi?=
 =?us-ascii?Q?aatdtIIy5tBqm3MX1hscPHenlhjnEmSPC6T0gfCYg1h3jmDJu7P1va8FCw/f?=
 =?us-ascii?Q?aka9hUejvve3uiTgkBdovcZuyQompDxdKsEqghahzrHhcavW3/9yrJoAes/s?=
 =?us-ascii?Q?abeDuTx/3pLjJ6q7wF+JjJhVM3T+PJ82+IdiY+LY+mZZqT1nkbWYdN9Crzem?=
 =?us-ascii?Q?VWqpYncTufWMWilhCESYAaXTzg6JeEmSNfbQkWBOtWmuaunfqwYxZUQfbdPS?=
 =?us-ascii?Q?0+pAGJsKUurPGl0IXCm4RlnB4Fk91rO9riBoq9DHnPYDw+2PSCkt50tqtrlv?=
 =?us-ascii?Q?efLTu0zWux2xswrhyHUin9fFxpG1dcjykgrNxCtxzkBzHgQhRXKwXzrFlm6o?=
 =?us-ascii?Q?QweESEuO2PNo3DTj5h7aKPToJtMhgpkrdvDaI1M86YAIA39OxVo/H8cF94Ps?=
 =?us-ascii?Q?icomvZQXU/xOqc/L9msPwIAQTYJZgQppnQsrD6kVWl42kS2gg+RmHiPH8ACg?=
 =?us-ascii?Q?E8r95qApXcgrYMnZwQUG5Y0jt5TAQ44boI9//aaB09ugoRrqDawMNXOKcJ1i?=
 =?us-ascii?Q?Njvy3vh9xIAEXIyOBYrVzvmS6RXrMx3pZuFVbbxWcjtGkdaocpE6jAi3cR7+?=
 =?us-ascii?Q?hWhfivzOndRhHILRhzKvHJ7bxmZUSwPOJG5iXA7QLmTE/oybp1mGABIf8qg9?=
 =?us-ascii?Q?BvjRFkHahWsVm2lp9OBoswGiZaWSriRlksIIXsw86sDH9DbQQ3i/NdjWGGfd?=
 =?us-ascii?Q?fKkdm7Xc1S5Oq2aH98rEJ03tE5MXVPom47vBshvFRo2TiaRmWXjAiuuPnNMI?=
 =?us-ascii?Q?9Um2fO66kIKph9jDrbO3/ecTqLdO1sXW+evHQbGYutxantteAKU+daEYJwUE?=
 =?us-ascii?Q?8XZi9uFxXbEFrFtCCGETQNM+sn45q5QCdVx2Rj7NMX9zYlyJczMvLe3aO5cL?=
 =?us-ascii?Q?pVEI4TZVsEOtiWcfo1CzBKcYKXJpcOSx1/laCDcaAxFnchPQRuuBykcv2DBg?=
 =?us-ascii?Q?ulw37WuvWyOO6B94vwTDd0PxCSC8bDZ00oZB2BT+o+/XzM/T3k0CUhpHr/Cw?=
 =?us-ascii?Q?KZGv3fM3vAVgpGXjc5B7+lHFwcsX84q9987hR1bZMPEiDp8zhjbaEr4p4tK5?=
 =?us-ascii?Q?ZBq43aBN17Ux4iqXOIrDOOCzdGFTxmLRLxzLtYK1ZZQNZhlDSBe9o+HPa56l?=
 =?us-ascii?Q?x/0RLoaUwz2uVoIVfrRTLU2ewXp47E2Ols6oUjnsJTOgAf5olAIFDrvKd5JJ?=
 =?us-ascii?Q?au4ZFfZ4sdErRFJBXOwKU4HVGvaWu8u+YzwdvWwsJEc2aXVTjt6vkGk6tCLc?=
 =?us-ascii?Q?ss4l6OdhX2/nOaA8OPFeO8icLkQqWPOjnswqbQ8dxXX8HM9poMEGGTNpU0Hl?=
 =?us-ascii?Q?6ICh5TUixC2snFbVqXSOqQBoMWheVpb/5QHk4gmndC17BWoffpdqbjbKMVO8?=
 =?us-ascii?Q?2HJSSXCm9ifjbJvNcXhsPY3FFSp5YJvy4+m11f2BzfpqXIgB1ltbbslB020P?=
 =?us-ascii?Q?u9H7sjOOIZdEjeVKBNwZJBs+GEwwTaoXix5AbidyfcdEFBf6CkcPSVZKsf4z?=
 =?us-ascii?Q?fxdmekkByxw5Ct3BrNBFBFA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F07E22C1033DDF48BA183818EF5A68A9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6mpcMh+aK6PxwECsiFTkPPxeVnw6wrPuPw/oByBZOIdi+YXqIy8SxxSCKrNpsLggnFgaXYGVMxrWOwOK7uE7YIKS49vJuuq6+DZMGd06I7hwRDa9aIK3S7DvFUkqQdxoTplPpO6n0SGyNU3EkuI31I3FuZtUrARZeFtlNZnij7xjZ7fleyTGchQUn8zkG29oNqG6s2cFb8VSWl2lGmzoKBr9VM/kmylc0SGbBPBGIQyRq/eNZMbw0ZisiP8vNLtW+zRIXKksXkUVwnOfppMt6jbRn+sO6JcdT5Z3Afw9UEm8qtOO798b49tnZDpyw5x4ZbLUHwfy1oYdxtZKZ/Y1OTsCJNnd8s8stxrUtDaNG+I4mtuRW3qkqbpymenz+Nwnzo9QzE3Hdajxy1njI45SqOXcbKxUJeY0NwqYqLXYi9juZItsTQBMB4vwu0MC/iA0Wip/GxUufrwCtoFUHmKt39Xeyf/54XnS01suFSuvh2FpiqqdiQBsw1Yf+9MQjZfMh7TNVKuaq+FcAtv3pz+9ArjkeHcZjS9u7GlNRVZgo0OaLkjHnDWqjG4lUP71P+yTWRi6deEPu7nFMr9MsPEmAFJJbLNQK9+2W4MA6x8liBP/iYJX5RhnaB6ToddBuSpBLsWOYvGuwJqCmU5Zym/xt9fzeQjPwSHnw27zseb+/Cz+te9LiZOUw9kY7AZqj3fvOwMU644htTNnBcmk+uSzafQFhZuJfN0WXRPK3aSE4bnuM5o20roTetNTq1Kcpe/7CMft+/udCgSmI4CHfwKcygG/S7nLHQpcv9pMcopMK8y7v8q5cf69NFNaXhYCgLM9
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a11df0-ffe8-4a97-56fc-08dad38edcc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 11:26:16.8927
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SKndzGmN58/Hqbeay+gm+X+HtYn/i+MpoO/xjJLcxEHgHwMF7Yat084L2kmq2COSgugs2EWpayFCtdgtpW20b5wbTXXeaWW47tVAg+k9YC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6703



> On 30 Nov 2022, at 16:54, Andrew Cooper <Andrew.Cooper3@citrix.com> wrote=
:
>=20
> This will make the logic clearer when we plumb local_port through these
> functions.
>=20
> While changing this, simplify the construct in Domains.create0 to separat=
e the
> remote port handling from the interface.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: David Scott <dave@recoil.org>
> CC: Edwin Torok <edvin.torok@citrix.com>
> CC: Rob Hoes <Rob.Hoes@citrix.com>

Acked-by: Christian Lindig <christian.lindig@citrix.com>


>=20
> v2:
> * New.
> ---
> tools/ocaml/xenstored/domains.ml   | 26 ++++++++++++--------------
> tools/ocaml/xenstored/process.ml   | 12 ++++++------
> tools/ocaml/xenstored/xenstored.ml |  8 ++++----
> 3 files changed, 22 insertions(+), 24 deletions(-)
>=20
> diff --git a/tools/ocaml/xenstored/domains.ml b/tools/ocaml/xenstored/dom=
ains.ml
> index 17fe2fa25772..26018ac0dd3d 100644
> --- a/tools/ocaml/xenstored/domains.ml
> +++ b/tools/ocaml/xenstored/domains.ml
> @@ -122,9 +122,9 @@ let cleanup doms =3D
> let resume _doms _domid =3D
> 	()
>=20
> -let create doms domid mfn port =3D
> +let create doms domid mfn remote_port =3D
> 	let interface =3D Xenctrl.map_foreign_range xc domid (Xenmmap.getpagesiz=
e()) mfn in
> -	let dom =3D Domain.make domid mfn port interface doms.eventchn in
> +	let dom =3D Domain.make domid mfn remote_port interface doms.eventchn i=
n
> 	Hashtbl.add doms.table domid dom;
> 	Domain.bind_interdomain dom;
> 	dom
> @@ -133,18 +133,16 @@ let xenstored_kva =3D ref ""
> let xenstored_port =3D ref ""
>=20
> let create0 doms =3D
> -	let port, interface =3D
> -		(
> -			let port =3D Utils.read_file_single_integer !xenstored_port
> -			and fd =3D Unix.openfile !xenstored_kva
> -					       [ Unix.O_RDWR ] 0o600 in
> -			let interface =3D Xenmmap.mmap fd Xenmmap.RDWR Xenmmap.SHARED
> -						  (Xenmmap.getpagesize()) 0 in
> -			Unix.close fd;
> -			port, interface
> -		)
> -		in
> -	let dom =3D Domain.make 0 Nativeint.zero port interface doms.eventchn i=
n
> +	let remote_port =3D Utils.read_file_single_integer !xenstored_port in
> +
> +	let interface =3D
> +		let fd =3D Unix.openfile !xenstored_kva [ Unix.O_RDWR ] 0o600 in
> +		let interface =3D Xenmmap.mmap fd Xenmmap.RDWR Xenmmap.SHARED (Xenmmap=
.getpagesize()) 0 in

Can we be sure that this never throws an exception such that the close can'=
t be missed? Otherwise a Fun.protect (or equivalent) should be used.

> +		Unix.close fd;
> +		interface
> +	in
> +
> +	let dom =3D Domain.make 0 Nativeint.zero remote_port interface doms.eve=
ntchn in
> 	Hashtbl.add doms.table 0 dom;
> 	Domain.bind_interdomain dom;
> 	Domain.notify dom;
> diff --git a/tools/ocaml/xenstored/process.ml b/tools/ocaml/xenstored/pro=
cess.ml
> index 72a79e9328dd..b2973aca2a82 100644
> --- a/tools/ocaml/xenstored/process.ml
> +++ b/tools/ocaml/xenstored/process.ml
> @@ -558,10 +558,10 @@ let do_transaction_end con t domains cons data =3D
> let do_introduce con t domains cons data =3D
> 	if not (Connection.is_dom0 con)
> 	then raise Define.Permission_denied;
> -	let (domid, mfn, port) =3D
> +	let (domid, mfn, remote_port) =3D
> 		match (split None '\000' data) with
> -		| domid :: mfn :: port :: _ ->
> -			int_of_string domid, Nativeint.of_string mfn, int_of_string port
> +		| domid :: mfn :: remote_port :: _ ->
> +			int_of_string domid, Nativeint.of_string mfn, int_of_string remote_po=
rt
> 		| _                         -> raise Invalid_Cmd_Args;
> 		in
> 	let dom =3D
> @@ -569,18 +569,18 @@ let do_introduce con t domains cons data =3D
> 			let edom =3D Domains.find domains domid in
> 			if (Domain.get_mfn edom) =3D mfn && (Connections.find_domain cons domi=
d) !=3D con then begin
> 				(* Use XS_INTRODUCE for recreating the xenbus event-channel. *)
> -				edom.remote_port <- port;
> +				edom.remote_port <- remote_port;
> 				Domain.bind_interdomain edom;
> 			end;
> 			edom
> 		else try
> -			let ndom =3D Domains.create domains domid mfn port in
> +			let ndom =3D Domains.create domains domid mfn remote_port in
> 			Connections.add_domain cons ndom;
> 			Connections.fire_spec_watches (Transaction.get_root t) cons Store.Path=
.introduce_domain;
> 			ndom
> 		with _ -> raise Invalid_Cmd_Args
> 	in
> -	if (Domain.get_remote_port dom) <> port || (Domain.get_mfn dom) <> mfn =
then
> +	if (Domain.get_remote_port dom) <> remote_port || (Domain.get_mfn dom) =
<> mfn then
> 		raise Domain_not_match
>=20
> let do_release con t domains cons data =3D
> diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/x=
enstored.ml
> index 55071b49eccb..1f11f576b515 100644
> --- a/tools/ocaml/xenstored/xenstored.ml
> +++ b/tools/ocaml/xenstored/xenstored.ml
> @@ -167,10 +167,10 @@ let from_channel_f chan global_f socket_f domain_f =
watch_f store_f =3D
> 					global_f ~rw
> 				| "socket" :: fd :: [] ->
> 					socket_f ~fd:(int_of_string fd)
> -				| "dom" :: domid :: mfn :: port :: []->
> +				| "dom" :: domid :: mfn :: remote_port :: []->
> 					domain_f (int_of_string domid)
> 					         (Nativeint.of_string mfn)
> -					         (int_of_string port)
> +					         (int_of_string remote_port)
> 				| "watch" :: domid :: path :: token :: [] ->
> 					watch_f (int_of_string domid)
> 					        (unhexify path) (unhexify token)
> @@ -209,10 +209,10 @@ let from_channel store cons doms chan =3D
> 		else
> 			warn "Ignoring invalid socket FD %d" fd
> 	in
> -	let domain_f domid mfn port =3D
> +	let domain_f domid mfn remote_port =3D
> 		let ndom =3D
> 			if domid > 0 then
> -				Domains.create doms domid mfn port
> +				Domains.create doms domid mfn remote_port
> 			else
> 				Domains.create0 doms
> 			in
> --=20
> 2.11.0
>=20


