Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F45663DBC0
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 18:15:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450065.707210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Qfj-0008Jk-Tu; Wed, 30 Nov 2022 17:14:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450065.707210; Wed, 30 Nov 2022 17:14:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Qfj-0008H9-Qt; Wed, 30 Nov 2022 17:14:59 +0000
Received: by outflank-mailman (input) for mailman id 450065;
 Wed, 30 Nov 2022 17:14:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7pd0=36=citrix.com=prvs=3269fc642=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p0Qfh-0008H3-Ht
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 17:14:57 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8185a50c-70d2-11ed-91b6-6bf2151ebd3b;
 Wed, 30 Nov 2022 18:14:55 +0100 (CET)
Received: from mail-mw2nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Nov 2022 12:14:52 -0500
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by PH0PR03MB6771.namprd03.prod.outlook.com (2603:10b6:510:122::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 17:14:49 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b%5]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 17:14:49 +0000
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
X-Inumbo-ID: 8185a50c-70d2-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669828495;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=cNo3kbzVMLSvEx/qQJP97hBtjOe56k8Itj3k/ZkIiN8=;
  b=Nu2Og/C9KaWPQWW0jUP/k1g0D6BW5mMuR/yobmr063FLkgbkjarqBffa
   k02GOv1IogpPXN7TT+tK2iI5FLBJFpnD/a4zxEH87jG7JZVUjQGAoFVYM
   VE1OC252DqozvYJhAwQeX++5ztux7K8VKLd66CmSnJB6fKFzpV+dojT9/
   A=;
X-IronPort-RemoteIP: 104.47.55.106
X-IronPort-MID: 86309856
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:lvY8caqlozAXVPCkgOIWmR6nq49eBmILZBIvgKrLsJaIsI4StFCzt
 garIBmBMvmMNGvyf4wgOti1p08OvZ7Rz9JlTQNlrXg9QShAoJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaHzCFNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAA5Rbx2qvM2Z/J22V+dngPkBIerUF4xK7xmMzRmBZRonabbqZvySoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeWraYKLEjCJbZw9ckKwq
 27Y/mK/HhYAM9+3wjuZ6HO8wOTImEsXXapCSubgp6433jV/wEQiWTE5dVCQvMW/1EjuW9BNb
 F4l+HIx+P1aGEuDC4OVsweDiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6ceSTU02
 3eTktjuBDgpt6eaIU9x7Z+RpDK2fC0Kd2kLYHZcSRNfuoG95oYukhjIU9BvVravicH4Ei3xx
 DbMqzUig7IUjogA0KDTEU37vg9Ab6PhFmYdjjg7lEr/hu+lTOZJv7CV1GU=
IronPort-HdrOrdr: A9a23:xsAJxK26dpwIy/OqnQXlywqjBLskLtp133Aq2lEZdPU1SL36qy
 nKpp4mPHDP5Qr5NEtNpTniAsm9qBHnm6KdiLN5VdyftWHdyQ6VxepZjLcKrQeOJ8W0ntQtsZ
 uJGcJFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.96,207,1665460800"; 
   d="scan'208";a="86309856"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBmLWmaa6f5lONW5/cJKLhmP66peH3Miz9tpHwuTZvOCAyPGS+0WzxXbsFV6KVT6+PE5F1Dl9cHCKlEIEhi1yEgOOEm135FmGGOs9DuMIP+2TkboUsSEYufOR10iY8I2/uUjNFWBEPW6gsaarTiurZKZoc48wq+i6w8CDmewGEhhDMqEqW2xNb0IMvLDxUrquQB3jAHnmq6P68fy9X0+iLrdXu/roCVej0ljtiSde9AWhABXwzgoCszFnXmDghQAKq3j+RDj6avUIYofPVO436Nb3i4OC9JJ/trsU61vxNWrB1AjNgCm2oXDhKeHwxurH4onJjF/5ndkHza+P+kUKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNo3kbzVMLSvEx/qQJP97hBtjOe56k8Itj3k/ZkIiN8=;
 b=j/xWCzfNANlHh+C4fZaG+xSd9XB3TGZ644QGWlHGkSS6oaZ2/qd2gLNf8QHYbSaVFKNSXaoYz6iLaO1/FLVgErQ++byTueP66hpnjFeUYw0oYniYN/NuFCMnEk7AjGU5Qa7V5kaLUGJkktYYpxl51Z/8y1BhUXVNEqm9/z/iCNzmlvXBKqItMhA4LVwoCIyMTPYVprttNvpRO0nHuJcx/0Jz5WLiM4aHuuqw5zImM3v5g949bE2yU5qhfu7O69UHw8BAfYKc+w9cFS1qcRO4oJW8VJ8ou5yxYTQzc0dBXxLpt33NtGBt66o0ifv+9mQ8bsXQG7woy4em4347LIXjqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNo3kbzVMLSvEx/qQJP97hBtjOe56k8Itj3k/ZkIiN8=;
 b=kvJuXWraeb2SuB1/W/gNVyLVv9liqKkKRrsNx8NIQ4eix5+qupP9KEZcBFdLjBcG7w6B42qRBhxnpRqNllxZrwh9CzGfGOq4YW3sU+EWgHp/fY14OGDqFrfnQpFzoYiErzzjCUG7/g2oPB2AKBrNQsWBmi+E77HpXKCKbhf1vDo=
From: Edwin Torok <edvin.torok@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: Re: [PATCH v2 1/6] tools/oxenstored: Style fixes to Domain
Thread-Topic: [PATCH v2 1/6] tools/oxenstored: Style fixes to Domain
Thread-Index: AQHZBNx/46jv4MYnYEmbfJm7DDYZZK5XtLyA
Date: Wed, 30 Nov 2022 17:14:49 +0000
Message-ID: <4EF34CCE-E2C6-4367-A514-D205C7233496@citrix.com>
References: <20221130165455.31125-1-andrew.cooper3@citrix.com>
 <20221130165455.31125-2-andrew.cooper3@citrix.com>
In-Reply-To: <20221130165455.31125-2-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|PH0PR03MB6771:EE_
x-ms-office365-filtering-correlation-id: de128317-1738-41a0-5b64-08dad2f66357
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SBk+Zp6dtAT8YsBJxDy04fIVcgVMPxPjQkwHwDL5jTRt0s8BSyYO38drL/YNPoRCxo3jP5QtCP4/LGbLj706vwCfaBAcB/4m5WlPysKAxxMxv4t4MupPHoAkkpZ08NVNOZAvEh3p/CsZgdPIj6xHvZBW821oj+MH9ow9F8o24vEymF1vVavJQhNknCKoynJRR1PTIM1VBuCoPIzjacIhajtzkE88W69etMDEgRiYc9a6qnX/8/AEFj3tCRvcwtY2DTyjJMf4ai4qTOJslvxKy9zxI2D9k/XJDzIiStaBXS8D792Uv+3CnTyEngYKXhi8Q2sNm1bQJ3fqO8smPd+fa4975viaeOylmMp3qyFhEW+YBfy1zzW2RgPQCmGFo7DRtTX6rtDBQVtZZoFWEHYYOzwbKdsIthwKbAF+Jcb1kvbxxMtGKwkYrnA+fff9IE42SmW1nPlSHbVoKDEYD77nZtkClIDPPtJEDgy4sR8csfqmnMntR9utGy/7YypwOh50S3vC6V6vPNHKkMzBzZk2sZQhL8NLDXYJ22v1mt1Tp8AtQs6+TVBJKy+eTbyXS3nM9mSkhzAnr4wZ0oyaG6CtKHSyc8+RbSoYMNQWEffnO5jUQzgGcE44+tV1/ye9FXnFfr8v+meTpHDQupL66DcHG6aQY74mpO4Xk8RlShaniHaI+0KxwwTCgjndpO0YZOOFhbFgQHRBUGouapelGgC1Zf4oGx2AyWCFyhP309ATk6Q=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199015)(478600001)(83380400001)(6486002)(2906002)(53546011)(82960400001)(71200400001)(107886003)(6636002)(37006003)(54906003)(38100700002)(5660300002)(66574015)(38070700005)(122000001)(66946007)(6862004)(41300700001)(26005)(36756003)(8936002)(2616005)(66476007)(66556008)(64756008)(4326008)(86362001)(66446008)(6506007)(8676002)(6512007)(91956017)(186003)(33656002)(316002)(76116006)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SXJCRG9vR0tMYzB1bDQxRFRmNGR4aTVYeThBTy9Rc3VXaUcwVmFhdTlkN3d4?=
 =?utf-8?B?T29lemxqWllDZjdCZENQQ3RmOFpWeXVmNElmZW9laG1FTWVRbVBDamJuaHAv?=
 =?utf-8?B?Rm5IK3Yxb053bVVjRS96MloxTFVoMVI0QVpzYjAzRE1yeGJoK3o1ODBYL04r?=
 =?utf-8?B?SldyVzFmMkdCZVZOTXNGTlJ1ZEtzRjdvZVQxbzZVcDI2eFBCQy9MaUJJWjBs?=
 =?utf-8?B?dzloWng4T3BYNjA4S20yV2FTOEc2a2V5czB4SW9salBkZG1PWWVzbXVxNUxS?=
 =?utf-8?B?cTNDN3pBblRNR1hXU01jVTZUTjRYRUhkY1NrYmZSb3k4anNzT0JPejlkelhR?=
 =?utf-8?B?YXBxeWJqVGptaVlrMXQvbWpSRnRDNEp5K0lYd3grNE1PcFUrWTdVcVlpbWVk?=
 =?utf-8?B?M244M3JVMlp3U3Nza2pBWm1oejRsdVc2Z3N3Q3QwMFJvNmpPQlAwWlZVR0dO?=
 =?utf-8?B?QkxGWjVuWU41RVl3VUZVK3J2eFVkK0RFOHU4bEJ2alVEZkUwVVdYaUViUEhZ?=
 =?utf-8?B?Nm5PQVF5SkxRWXhBYTlZc25YTXVTdnl4WjI5Ym9wS2JpTjlCOFk2S25rbUNk?=
 =?utf-8?B?eHNoSDJqU2lXZ2JPR21EUTNJT2NPK3d3ZkszZlNoK1NxaDNmM3plNlVRN1Uy?=
 =?utf-8?B?L0tKNFR5NE02YS9UV0FvdXlldi90amhaZ2JZQ2QxNlM3R0J6K2d6bkNBZHla?=
 =?utf-8?B?Zm8ybTh0N2Q4ZldlYUwvRSsyRG1pTTJscU85WDVtQW9GOWlJQ2FTYzNpdk1F?=
 =?utf-8?B?NHRPc0dKTzByQUgwMU1DL3dIU3NmMDl5Wi91ZjN2Wlg5RWc3cks2VzNqdnMv?=
 =?utf-8?B?RU9ZemFWQUc3Y3ZQSnlFVERyQjVmRktTNUlEbld6QlhFditEWDc0OG80RDJX?=
 =?utf-8?B?M2xpK2kyNGVtYTE4Ulo2Y09EblpDcCtaUFpoeXoyLzk0K1Q4ZDVDWlI2bVEy?=
 =?utf-8?B?bEkzdkhuOGtVOUpoWjlFQk5xc0xCZ085bHNLbFhuaW1sQlI2aWZhRXhDejZl?=
 =?utf-8?B?WjVVUmVxeWo0bVFxbk5ldlNzK1dnTmhKSlB0bTJ3SkoreVRlMjNQU2VEbzQr?=
 =?utf-8?B?WVM4eWVUTlNNVXBPWUhSMlNiWnk3WXQvVzBlUjRWVWNZTnR0NlJEb2VUR0cv?=
 =?utf-8?B?MUFJbnhDaXIycGlCcmVXNE0rOWs3bTI4VHhodWJ1RTdYOGFyS1FQWGdLL2tZ?=
 =?utf-8?B?L001VEJvcnh5cFJuZlMzSjBiWUJYbzJXQ2pWcXRXTFozK1hkT05YenhBbDVn?=
 =?utf-8?B?Q28vT0hsSHp4elFCbDhuT1Uxcjd3YzF5WFMxVE5adXNiWDhiK3o2VHlmWnpD?=
 =?utf-8?B?UE9Yd1RIeldaZGc1ZzRCNUJEcHhvT2dKYUovNnVyc3VjN2FzVjdSUnhucEMy?=
 =?utf-8?B?aEo0eWdlTUZwZTFGaEdiUUJtYUhzS0JYNGdYdCtoSjdnaFpFSUhNZmozMUhN?=
 =?utf-8?B?YU9xdmtTeWhOd2RUemN5RnhwYlQxSHFwaEFWTjQ0L1BEMGF2dEdyUnpQOXh2?=
 =?utf-8?B?UXZVUUFpYXVOY0VIVjlnS3VURFN3dFpiOGJFUTd2amJsVVpGbFNyR3M4b0tw?=
 =?utf-8?B?SHBaTGRYVXJteklBTUxZUkZ2blhSYURtQXBtZkUrV3N5ZnZnUitObGY4QWNG?=
 =?utf-8?B?WmpIWDBoK3N0aVp4d1c3Zi9zWWwvUk16eUN3SVhqbVp0RFlTdVBXbWZqajFK?=
 =?utf-8?B?aTZRN1R2QXVuMloxcXRib05ydS9mei90S3M4WThtSVg4K1ZXVTVsQ3NxTVA1?=
 =?utf-8?B?SjNjb1JVaG94aVYwclN2azhaeXI5QVlWYmMwazdBVmFzODQwNnkzR1hWTHl3?=
 =?utf-8?B?VzVXM2poZ1RYamJ4N0tIZ0ZoVGVuelBFdFpDQlVtbENxYWF4RURWYnRLcEU5?=
 =?utf-8?B?djV4NkNHRlRESmd0cHcyTjlLZUx1dGwrQVNxM1Y5M2pGbG1WVlQxOGZLZ0p2?=
 =?utf-8?B?bmJHR1NaVGFyVTl5VlQ0ZEVQdC9CLzAwM3diRFk3VU41NG5laXdPNkNSZ21L?=
 =?utf-8?B?YUN3SkpZMFRZeDE0a2Jtb0loR1F0MlVMZlVkQnhyZmdSQUFPK00vbktSc2hL?=
 =?utf-8?B?M2lGMklxblBWdklXWXVRSmtkZXNJOE9Wc2JJYS9lcHBTRElwMjJaTmtPd1N0?=
 =?utf-8?B?cHhuaXUrRC8rMFVyRERBZ0t0bWpiaGl1QzJkejdmVlNBd2RIOHkzNysrdm9l?=
 =?utf-8?B?L3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C7B5EA2D070434387B3C3DB96F0D103@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	38be0geFg9NYJkKAgNeyl7Y7uMbZkjT1FVpSeM28lSVoVfGBzN5kJZ+F/G0Imcw57EilWwRzCjTFh0DYwa8ucCog0p/W8894nSsZw2xOS2pm2niUb+g+B0DYvQeEvV+phmD1ruP4K0S1sC190RfKnZmLfGctRkz6WzePQTA9V+R4yqzl4vP52BPUFjgpjkn1sVAq94j76kgwEQ7IsU4bydTeJmsiG9CpP+e6oUgvUmrjqEf3JR7W0gvNl9392H2aCKZsHepl7PG9kDM0xlFsY00GPw1xLVQgKhrm8zKaTPQRjSPMasp9V+igjpFvo7lVgE9OPMSgYJz4Rbsycm9an2wyPk/ES0y2W+LY9Dqpv8Jt+Rq0dkdoBPvNf849GYYfBdGPDxdrows+BaF9TFeWUFQ38QvlvDH7XZt0FYvpkMHZxKcojiIQcIzaCWsGYQRClOcNaFMgso00PJqLgJHj/WyEzN+6TER/qJeAOnuWtpBXBLFqqwPAgf1egclbUiXx6FDFEwv04HfXkWYttW5gEXKvPeuhplc2VBiSS3418FTnTkNWmTn0VR+HWGSQv5ZHVItbOKvDua66SfgyP48VcSm0q8Ye7epOjKwBOJjtWmazq2hZZf71RBTDDqi4Vf+0nDSbwN3319UhvM/P6eizmivEtSy9pVM+Z8VUP1ZJ1oim0EoBFr1X09P1jStlk3KagNc5vIaWdREuIsHkOmRBcDsTuenkmepeFouSDuF8luErfpGgj5a/hX+EgyXLcY69z/yQPTF1L72U6RhMFFpK9D0g21CuBOrJlp2Y9wipIBVyDdENk2gmUILE1exsa++Z
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de128317-1738-41a0-5b64-08dad2f66357
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2022 17:14:49.6491
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hEnfiWfALa04P1kS8DkHOi0fjwGP9YnSYtBEayVZ2eTBa3l3/22f1i2GQfBWIKSeg2G7WRCBv6sRN9NUkX4h2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6771

DQoNCj4gT24gMzAgTm92IDIwMjIsIGF0IDE2OjU0LCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IFRoaXMgZmlsZSBoYXMgc29tZSBzdHlsZSBw
cm9ibGVtcyBzbyBzZXZlcmUgdGhhdCB0aGV5IGludGVyZmVyZSB3aXRoIHRoZQ0KPiByZWFkYWJp
bGl0eSBvZiB0aGUgc3Vic2VxdWVudCBidWdmaXggcGF0Y2hlcy4NCj4gDQo+IEZpeCB0aGVzZSBp
c3N1ZXMgYWhlYWQgb2YgdGltZSwgdG8gbWFrZSB0aGUgc3Vic2VxdWVudCBjaGFuZ2VzIG1vcmUg
cmVhZGFibGUuDQo+IA0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IC0tLQ0KPiBD
QzogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPg0KPiBDQzog
RGF2aWQgU2NvdHQgPGRhdmVAcmVjb2lsLm9yZz4NCj4gQ0M6IEVkd2luIFRvcm9rIDxlZHZpbi50
b3Jva0BjaXRyaXguY29tPg0KPiBDQzogUm9iIEhvZXMgPFJvYi5Ib2VzQGNpdHJpeC5jb20+DQoN
Cg0KUmV2aWV3ZWQtYnk6IEVkd2luIFTDtnLDtmsgPGVkdmluLnRvcm9rQGNpdHJpeC5jb20+DQoN
Cj4gDQo+IHYyOg0KPiAqIE5ldw0KPiAtLS0NCj4gdG9vbHMvb2NhbWwveGVuc3RvcmVkL2RvbWFp
bi5tbCB8IDE2ICsrKysrKystLS0tLS0tLS0NCj4gMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKSwgOSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90b29scy9vY2FtbC94ZW5z
dG9yZWQvZG9tYWluLm1sIGIvdG9vbHMvb2NhbWwveGVuc3RvcmVkL2RvbWFpbi5tbA0KPiBpbmRl
eCA4MWNiNTliOGYxYTIuLmFiMDhkY2YzN2Y2MiAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvb2NhbWwv
eGVuc3RvcmVkL2RvbWFpbi5tbA0KPiArKysgYi90b29scy9vY2FtbC94ZW5zdG9yZWQvZG9tYWlu
Lm1sDQo+IEBAIC01NywxNyArNTcsMTYgQEAgbGV0IGlzX3BhdXNlZF9mb3JfY29uZmxpY3QgZG9t
ID0gZG9tLmNvbmZsaWN0X2NyZWRpdCA8PSAwLjANCj4gbGV0IGlzX2ZyZWVfdG9fY29uZmxpY3Qg
PSBpc19kb20wDQo+IA0KPiBsZXQgc3RyaW5nX29mX3BvcnQgPSBmdW5jdGlvbg0KPiAtfCBOb25l
IC0+ICJOb25lIg0KPiAtfCBTb21lIHggLT4gc3RyaW5nX29mX2ludCAoWGVuZXZlbnRjaG4udG9f
aW50IHgpDQo+ICsgfCBOb25lIC0+ICJOb25lIg0KPiArIHwgU29tZSB4IC0+IHN0cmluZ19vZl9p
bnQgKFhlbmV2ZW50Y2huLnRvX2ludCB4KQ0KDQpJIHdvdWxkJ3ZlIGV4cGVjdGVkIG9jcC1pbmRl
bnQgdG8gYWxyZWFkeSBkbyB0aGUgcmlnaHQgdGhpbmcgb24gdGhpcyBwYXJ0Lg0KDQo+IA0KPiBs
ZXQgZHVtcCBkIGNoYW4gPQ0KPiBmcHJpbnRmIGNoYW4gImRvbSwlZCwlbmQsJWRcbiIgZC5pZCBk
Lm1mbiBkLnJlbW90ZV9wb3J0DQo+IA0KPiAtbGV0IG5vdGlmeSBkb20gPSBtYXRjaCBkb20ucG9y
dCB3aXRoDQo+IC18IE5vbmUgLT4NCj4gLSB3YXJuICJkb21haW4gJWQ6IGF0dGVtcHQgdG8gbm90
aWZ5IG9uIHVua25vd24gcG9ydCIgZG9tLmlkDQo+IC18IFNvbWUgcG9ydCAtPg0KPiAtIEV2ZW50
Lm5vdGlmeSBkb20uZXZlbnRjaG4gcG9ydA0KPiArbGV0IG5vdGlmeSBkb20gPQ0KPiArIG1hdGNo
IGRvbS5wb3J0IHdpdGgNCj4gKyB8IE5vbmUgLT4gd2FybiAiZG9tYWluICVkOiBhdHRlbXB0IHRv
IG5vdGlmeSBvbiB1bmtub3duIHBvcnQiIGRvbS5pZA0KPiArIHwgU29tZSBwb3J0IC0+IEV2ZW50
Lm5vdGlmeSBkb20uZXZlbnRjaG4gcG9ydA0KDQpidXQgeWVzIGZvciB0aGlzIHdlJ2QgbmVlZCBv
Y2FtbGZvcm1hdCwgbm90IG9jcC1pbmRlbnQuDQoNCj4gDQo+IGxldCBiaW5kX2ludGVyZG9tYWlu
IGRvbSA9DQo+IGJlZ2luIG1hdGNoIGRvbS5wb3J0IHdpdGgNCj4gQEAgLTg0LDggKzgzLDcgQEAg
bGV0IGNsb3NlIGRvbSA9DQo+IHwgTm9uZSAtPiAoKQ0KPiB8IFNvbWUgcG9ydCAtPiBFdmVudC51
bmJpbmQgZG9tLmV2ZW50Y2huIHBvcnQNCj4gZW5kOw0KPiAtIFhlbm1tYXAudW5tYXAgZG9tLmlu
dGVyZmFjZTsNCj4gLSAoKQ0KPiArIFhlbm1tYXAudW5tYXAgZG9tLmludGVyZmFjZQ0KPiANCj4g
bGV0IG1ha2UgaWQgbWZuIHJlbW90ZV9wb3J0IGludGVyZmFjZSBldmVudGNobiA9IHsNCj4gaWQg
PSBpZDsNCj4gLS0gDQo+IDIuMTEuMA0KPiANCg0K

