Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB674F93FC
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 13:26:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301432.514433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncmkn-0006ky-8l; Fri, 08 Apr 2022 11:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301432.514433; Fri, 08 Apr 2022 11:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncmkn-0006ib-4w; Fri, 08 Apr 2022 11:26:13 +0000
Received: by outflank-mailman (input) for mailman id 301432;
 Fri, 08 Apr 2022 11:26:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OHy9=US=citrix.com=prvs=090a3f169=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ncmkm-0006iL-93
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 11:26:12 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af16dbe0-b72e-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 13:26:09 +0200 (CEST)
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
X-Inumbo-ID: af16dbe0-b72e-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649417168;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=7rYjZmCw0+UEOys+hXlQKe9S94XsKq7tUj4vhZkqTYo=;
  b=iYwxlpG8jt+wJ+jiv7njjaP81BlTA/sINxWJMkWGLIpXFyeuufiFbtaA
   okxqd/K+fJQM3lewXkquPk9OnmV9MkJ6u8H/fS//5F52Z8c1TS03ObV23
   8zTcgl+Btw7XmpYiDSjJM+urrzr6pla+WMkCMhESeqRD7pOVsxrRxSxt3
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68248977
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:F0qCZq4mH6fdFhfzMhLgdAxRtM3HchMFZxGqfqrLsTDasY5as4F+v
 mRNDG6Ga/aKamDzf412OY6x/EgC7cLXz9Q3SQRrrH88Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YThU1vU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSWbj0FGO7ih9gYfAhgPTtvL5Ecu7zYdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKs2vH16wC6fJvEhWZ3ZGI3B5MNC3Sd2jcdLdRrbT
 5RJM2Y/PUufC/FJEkpNDJQAk+6wvH6heCcE7xWH+4hm5lGGmWSd15CyaYGIK7RmX/59hV2Er
 2jL+2D4BBAyN9GFzzeBtHW2iYfngifTSI8UUrqi+ZZCjFOayWMSDxkXfUCmuvT/gUm7M/pYM
 FcI9zEy6KE+8U2tZsnwWQWip3yJtQJaXMBfe8U49QWMx6z88wufQG8eQVZpatYrqcs3TjwCz
 UKSkpXiAjkHmK2YTzeR+6mZqRu2ODMJNikSaCkcVwwH7tL/5oYpgXryos1LSfDvyIevQHepn
 m7M/HNWa6gvYdAj8YKB0XaErS2Qo7fYdiAv9xfrBCGm8VYsDGK6XLCA5V/e5PdGCY+WSFido
 XQJ8/SjAPAy4YKlz3LUHrhUdF29z7PcaWCH3wYzd3U03271k0NPa7y8992XyK1BFs8fMQHkb
 0bI0e+6zM8CZSD6BUObjm/YNijL8UQCPYm9Phw3RoAXCnSUSONh1HszDaJ39zqw+HXAaYllZ
 f+mnT+EVB7285hPwjusXPs62rQ23C04zm67bcmlk0X9gefDNCHKEO5t3L6yggYRtv7sTOL9q
 Yg3Cid3408HDL2Wjtf/r+b/0mzm3VBkXMur+qS7h8aIIxZ8GXFJNhMi6ehJRmCRpIwMzr2g1
 ijkAidwkQOj7VWaeVTiQi0yM9vHAMcgxU/XyARxZD5ELVB4Ot3xhEreHrNqFYQaGBtLkaYvH
 6ZYIZ3ZahmNIxyekwkggVDGhNUKXDyghB6UPjrjZz46fpV6QBfO9MOidQzqnBTixALt3Sfii
 9VMDj/mfKc=
IronPort-HdrOrdr: A9a23:7k4YC6simCapg4nvCreWbcZr7skC2IMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJh5o6H8BEGBKUmskKKceeEqTPiftXrdyReVxeZZnMXfKlzbamHDH4tmu5
 uIHJIOceEYYWIK7voSpTPIaerIo+P3sZxA592ut0uFJDsCA8oLjmdE40SgYzZLrWF9dMEE/f
 Gnl656Tk+bCBIqh7OAdx44tob41r/2vaOjRSRDKw8s6QGIgz/twqX9CQKk0hAXVC4K6as+8E
 De+jaJppmLgrWe8FvxxmXT55NZlJ/K0d1YHvGBjcATN3HFlhuoXoJ8QLeP1QpF491HqWxa0u
 UkkS1Qe/ib2EmhOV1dZiGdnTUI5QxerkMKD2Xo2EcL7/aJHA7SQPAx+r6xOiGplXbI+usMip
 6jlljpx6a+R3n77VXAzsmNWBdwmkWup30+1eYVknxESIMbLKRctIoF4SpuYdw99Q/Bmcka+d
 NVfYnhDTdtACenRmGcunMqzM2nX3w1EBvDSk8eutaN2zwTmHxi1UMXyMEWg39FrfsGOtR5zv
 WBNr4tmKBFT8cQY644DOAdQdGvAmiIRR7XKmqdLVnuCalCMXPQrJz85qkz+YiRCdY15Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIW2m5VSSF8LAp23G4gMyKeFPGC1zwdLl1qbrSnxw2OLyvZ8
 qO
X-IronPort-AV: E=Sophos;i="5.90,244,1643691600"; 
   d="scan'208";a="68248977"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWSLnDM0uwYjuKF4qfMNL3TP7HepH7Vx/7OkVdr/fWEeLJVndj0rUut2bd9ecwYevsiTDV7qC2ryS7VqzwbnmiMbanWHklAc8LJRG9BsrnxqvRvKkI4Qnfd14FXC4SCcj5WpYqqvdcg4i0COGSntpb7yX1c1xwp4GRhhaesM4R9PBCgngbwPPTY5xcPIISH3A5LU0oB3lD+uC/w0Ec7p3uC0vAs2cb2tQo2dDYTraBKkLsFl2sgjuxBN/rJ4NIBJqJ2mJc8sBZGVeTQhp0mRLkiDhkYuY03/CZECwjEJv18o/iPur3ixZZjwYoD8HCIuwPk0sTo1r1RmzH6+t5+qAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rYjZmCw0+UEOys+hXlQKe9S94XsKq7tUj4vhZkqTYo=;
 b=RNRuhatDlShMPSfPcqd6IjdgmcVMy2/lqpJCszTU4M5pnd1AfWTDFRuVazekDW9c8t0lXqfxTsxISwZMJXxBFbfgCyK+rVH8e16Imzqw/ovcmwOEprl/nv3dl6Kn4E/spYn3BxYatpdClb8IrI75SyPyGIsJYJKG7QqRbYMnzukmYG5Ft5Wo2W7m2mIN7Y9crnaQupwlGIel0ol83lyeyJg31JnsG2fncrxPnlZWiaVpYo1UPRayDbl+TJPVNCIz1wHTMfbw37n0fmH9TxKq43b/tgCYaGlWoPdKnS4VTTgwTvrceRiVvH6ujDIHV32Vj+s69YAgxU/0DyGif0/w3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rYjZmCw0+UEOys+hXlQKe9S94XsKq7tUj4vhZkqTYo=;
 b=S/EM6hauRrZGjmS2vz9P3x0ChB3pVz02P4DsHQJF2QCnw6zeBdtbMcCa7+kYJ7C9UznzJbfvzatmrrfyMwBj39zEBUObxCog/fSgN0Wu/CHjRoDRePBgwXJ3D9Oia9bhFyhDudDqVYnVabhQjKUqv6nAp0V+lOT6H+Kc7UyVP1E=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Julien Grall <julien@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
	"Jan Beulich" <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"osstest service owner" <osstest-admin@xenproject.org>, George Dunlap
	<George.Dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Wei
 Liu" <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [xen-4.12-testing test] 169199: regressions - FAIL
Thread-Topic: [xen-4.12-testing test] 169199: regressions - FAIL
Thread-Index: AQHYSlvwuwuenWmolE2vvQwyk4J/36zlmCOAgAATLgCAABUiAIAAGtAAgAAB2ACAAAUIAA==
Date: Fri, 8 Apr 2022 11:26:03 +0000
Message-ID: <22912e60-9cd8-2c68-ebb2-37392bce9436@citrix.com>
References: <osstest-169199-mainreport@xen.org>
 <43ad1e8c-dacc-9b7a-7250-9348e7e52580@suse.com>
 <Yk/tzuKq4D3mFEQu@Air-de-Roger>
 <a6c6901d-0f6f-f4f6-eba9-c3d169c30433@suse.com>
 <YlAWBom8O8d1lCpQ@Air-de-Roger>
 <ab27a3c3-a85d-b9aa-de0c-ca96f3e2a3fc@xen.org>
In-Reply-To: <ab27a3c3-a85d-b9aa-de0c-ca96f3e2a3fc@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ffd2b735-8d3d-4ea1-f3cb-08da1952910d
x-ms-traffictypediagnostic: DM6PR03MB3449:EE_
x-microsoft-antispam-prvs: <DM6PR03MB3449BC0AC8E254D9B1C3C9E1BAE99@DM6PR03MB3449.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 64g8CCrJRX7FJUWpPYMhmkYhZ/Mw5JICGEyljFjkB9tcSBosc1y4m9GQefL7bCwWyrrLzaMGBXcjt8z5tW48bV4By8ss1sVgLsTYI9mX2VNBKJX4jG3nQ1YofdjaElGuda3kSEE4vS494WfidNHaMozpoojrhHlgQWTn+f2ksBG3UlANGyFrpulSWywR5joDEqdqebXkC5w4IgcMpSadWBL38MoyEEyrk091KsV5P0TIaQlXC8MtJfnC7OfX0rzYvwF4q33z4+khlGIisLA74inEOAagdrh6bkkouGp6RH4qXruct1nZEj/vKZ6+9BgIp4R4g1h0PK4Qe4pkJgWD7+mIjOyiBRgvay4Z3z6KHvJlaVJdXsDtCLcMwX5SRXxLH2pcFFuFoiuzJTxtqOukbKldSgcmfoqNSOd0UcINKfT5M7H5a35Sr7+VVjSym5R2JdfdwuTGxhfl5Lp2riqItjoIE+xGPsslzSUiIzsKL7vksAfcvGPJOZn7Lwb1r6CGsZQOd8MmpzNACFBv/YTuVmw1+BY1ovGRj3IZ2XshQW4t/GTSGJuOfgGIe+R16B05S7bgr43WUdBWUw9VAqVidrKtAehdoXYxgyPt47Xi0vKbJPAj/uAG8pbDgTu4wii+X2KJlzxNyjZxrNijfTDwkWNkLYwS73GUKuYvIC034rttquGDWeLb8YnX0IZYTdODoqfjjsSns/C7ls5786RVdawW2l/+GBWcmD3HOpQAhmFx9uo3lnIrUOiWY+YoKrgeCZBsqEVMNyAhqycewZ6m9Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(82960400001)(31686004)(36756003)(6506007)(122000001)(5660300002)(38070700005)(8936002)(2906002)(31696002)(66556008)(91956017)(8676002)(4326008)(110136005)(66946007)(26005)(186003)(54906003)(71200400001)(38100700002)(64756008)(508600001)(66446008)(66476007)(76116006)(316002)(6486002)(6512007)(86362001)(2616005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmNWSmZ5U3B6ZllsVHFkc1gyc3MxOU9GWVRGS1RKSm9Xa3VldHVvdjMxclRt?=
 =?utf-8?B?dWxvT3pDQ3AwamhjY3FLK1RjS1AxUEYyNXgxZkJMQjAyM2J3akN5a1hsVVI4?=
 =?utf-8?B?eG5yaDhwdHZKZGdGOSsxZE5NL1pTUkdnTHZ3UmFwaXdnSE9ITjFKb29Hek1X?=
 =?utf-8?B?WFFmK1lYSEVnTkpleVJGQ3J0bVAvTjk3VXJpNHBzVklQZm9ObTJ1N1RaQ1pH?=
 =?utf-8?B?aFZXMit0QzFwV1NsUWp1bnMycU53MmhlQWRwVG90M1J1TWtwWWlqbVJxdzNj?=
 =?utf-8?B?OTYyV3l4VStteGIxK1lWODFJc1dhek94RE5LdTZwZXdVQWFkV1BjY1V4aGVF?=
 =?utf-8?B?QVEzdW1UbWtCMUVRMU9MWW16Z2s4KzM5MjFrMjNra1FRSm4wTkF3bGJSMHl1?=
 =?utf-8?B?aGJVbW83NWd0bEpLSXNlVjN2L2VYYlNJNDljKy9rN2Q4V3dVcmdEaXlZem5H?=
 =?utf-8?B?eFVRcWJDMXBMSno4TGQ4R3BFOGN1RVdPdUxIWG1UTlY1enlGR3YzSDYySkJo?=
 =?utf-8?B?dUhYVk5sRTdDUWdPRG91TzJ2YlFCVU9VdDlZMUJZQUpYUU5UM281N1p2L3Zq?=
 =?utf-8?B?NEs1YW83M2NRcnVyMzN1QUhnbUlCRkV6eCt4VFIrVDRIamgwUVoxM29CbGQy?=
 =?utf-8?B?UXZsUFJKaWVZU0MxNG1KbkVmWDNIOUw2SHJoRHNVcjkrNWxuRC8yZ2JpSzNy?=
 =?utf-8?B?T2hqbkxNQmtQV0FGZERUWFEwbGE0NFVWaGs2YWJDYlloYkxYSmlyTDZMZDZx?=
 =?utf-8?B?a2N0ZXpBVWVhaHpjWW56VXlMOEpvU01CVFBlSFVndXRKOTJKTDhzNXRKNW53?=
 =?utf-8?B?UG5PUWwxaGIrOXZOQjJ3TkFXMytSM0c2R0VnbnRWbjY2VmJLWGk5ZGRnREVa?=
 =?utf-8?B?Nk1LRlduRXUxWnBNbEo2d2lIZzA5bm1UTFBCMkhwK0IrUm4vRUpPSVBVRHB1?=
 =?utf-8?B?emphNzJGMS9wSk1CWkV2Q0YyRlZrQWJ1V2pubVk2UDIwMjE5YUVseTZhNXQ2?=
 =?utf-8?B?QklQdkZmMC8wcm5yNFJuczlObUJOQnFmUEhydTlFL3lHUWFzdUprbi90OWRr?=
 =?utf-8?B?OWZzVktVVFlJVHNYYU40a250dHZqUFVYMGRMVVdDT0I2aUs2ak05WlVIKzM2?=
 =?utf-8?B?OHVTNVlmaUtma2RJSDNsNTJPcStIMFY1VTd2Wk13WHhHb0IyUWJnKy91czVj?=
 =?utf-8?B?YUpEVHlUTGNkQ252VTVkZVVCRTBmckRPSmY3RmVuYkxUZEZRSUQ5cFh3RHlH?=
 =?utf-8?B?NDBad3ZkRHFYcDVCU0xqVFhQTVpDaWdKQXU0dWdmLzM1SnVTSzVTOFRDMU1B?=
 =?utf-8?B?c29tTjdBYzBRQWlVVGFaMHFkdjZxRGZ6ck9OM1JxcXFIOWxkNmNYVVFCTmVP?=
 =?utf-8?B?d3pOWTVkMUlxTUtIYjZXRVYvN3UxNlhQbC90TDBYbXF2M2pUcU9xMnBxd3Nt?=
 =?utf-8?B?VjFMN0JPWWJCcmNvMVFDeVloeXJFSG44cE5PNlVBRmpuZEVDeGJmWCtxeUFH?=
 =?utf-8?B?N0JFTTc4RHlJZXZuRWxOdHgzQ0ZBODJ4eUNJaElvUm5zVjB6WmdLKzlHczE1?=
 =?utf-8?B?cGQ5ZEVabzdwclJQVWRvWTRvWjA2QkUwUnZCRWtOcHVRdWNLRS9UZytjK1ZU?=
 =?utf-8?B?YmxmVzRYekVHQ0FsSEprMFpLeWZPR0tpVzEwejhBcDJleXZJelJYcStBRlR5?=
 =?utf-8?B?T29pV1ZTTVdXVzVpNXFTTmt4KzlqZWxFMnJQSGlpRldxUk1pOE9kdW03SWYx?=
 =?utf-8?B?L0xBeHpJN3ViRHhNcm5sMnVqWHFjT0xHKzBsQS9vWEM0b3R1VysyeG0wSWNw?=
 =?utf-8?B?b1FzUkg1UkpPeDdFN2ptUkhGWFVxRG5Sbngya3daYmN5T0Q5MzUvWGVzbHAz?=
 =?utf-8?B?UzJjNUlKOHdPclFyQU1XRUlqeTdaVmt5d3JOSTJiTGxGNGhNU3lpU1J2MmV5?=
 =?utf-8?B?ckVOWFZIVDJYMlZsTnFHMElMdnRQb2xzWVUrSlJvc0ovc29LZktOWkc1NGFS?=
 =?utf-8?B?emNEUTE0dWFqVXpVWmJEV3p4VjA3blFkNUJEb3J1OWN0cExSRVJNTTVRL2U1?=
 =?utf-8?B?aGdtZWhOVnRFOTd2dkZwSStKVDk2UjJON2xjQmhmRjh3UENRVEN4K0tWSDRs?=
 =?utf-8?B?eWVnRHN2OGh0MnBxWDMxTmpWYUEvQys1MHBKM3JocWd2L2NXT0FVYm81ZWln?=
 =?utf-8?B?NkREdEFJVHdFSUNnMEhCNEhUTCtKait0RUxib0hSRjdsNDd3MzIrQkdKWEw0?=
 =?utf-8?B?algvMEVEWGtiaWhpSGh4L3ZsRUcvMzRZZWhOSUlFRGJTNm9uRjBoT2Q2eWVI?=
 =?utf-8?B?OEFEVTBramZlSHBmbm9VeWhIUlQyMWFFbE81enJBU09wd1J0dTB0Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <42090F27A9E80349BA14C8BF36CC75CB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd2b735-8d3d-4ea1-f3cb-08da1952910d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 11:26:03.2657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kTemNmPlPOsaO6KgdeSy3mYnEKHy0C61nCnm0kMb3+8HYwN0etf4U65bYn/ryl+xV9icC3bXItFCCi6Z7F1N032bRsBb8V63yXFIwzdey5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3449
X-OriginatorOrg: citrix.com

T24gMDgvMDQvMjAyMiAxMjowOCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSwNCj4NCj4gT24g
MDgvMDQvMjAyMiAxMjowMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4gSSBjb3VsZCBh
ZGQgYSBzdWl0YWJsZSBkb20wX21heF92Y3B1cyBwYXJhbWV0ZXIgdG8gb3NzdGVzdC7CoCBYZW5T
ZXJ2ZXINCj4+Pj4gdXNlcyAxNiBmb3IgZXhhbXBsZS4NCj4+Pg0KPj4+IEknbSBhZnJhaWQgYSBm
aXhlZCBudW1iZXIgd29uJ3QgZG8sIHRoZSBtb3JlIHRoYXQgaWlyYyB0aGVyZSBhcmUNCj4+PiBz
eXN0ZW1zIHdpdGgganVzdCBhIGZldyBjb3JlcyBpbiB0aGUgcG9vbCAoYW5kIHlvdSBkb24ndCB3
YW50IHRvDQo+Pj4gb3Zlci1jb21taXQgYnkgZGVmYXVsdCkuDQo+Pg0KPj4gQnV0IHRoaXMgd29u
J3Qgb3ZlciBjb21taXQsIGl0IHdvdWxkIGp1c3QgYXNzaWduIGRvbTAgMTYgdkNQVXMgYXQNCj4+
IG1vc3QsIGlmIHRoZSBzeXN0ZW0gaGFzIGxlc3MgdGhhbiAxNiB2Q1BVcyB0aGF0J3Mgd2hhdCB3
b3VsZCBiZQ0KPj4gYXNzaWduZWQgdG8gZG9tMC4NCj4NCj4gQUZBSUNULCB0aGlzIGlzIG5vdCB0
aGUgY2FzZSBvbiBBcm0uIElmIHlvdSBhc2sgMTYgdkNQVXMsIHRoZW4geW91DQo+IHdpbGwgZ2V0
IHRoYXQgbnVtYmVyIGV2ZW4gaWYgdGhlcmUgYXJlIDggcENQVXMuDQo+DQo+IEluIGZhY3QsIHRo
ZSBkb2N1bWVudGF0aW9uIG9mIGRvbTBfbWF4X3ZjcHVzIHN1Z2dlc3RzIHRoYXQgdGhlIG51bWJl
cnMNCj4gb2YgdkNQVXMgY2FuIGJlIG1vcmUgdGhhbiB0aGUgbnVtYmVyIG9mIHBDUFVzLg0KDQpY
ZW5TZXJ2ZXIgdXNlcyBkb20wX21heF92Y3B1cz0xLTE2IHNvIHdlIGRvbnQgb3ZlcnN1YnNjcmli
ZSAoZXZlbiBpZg0KQ1BVcyBnZXQgdHVybmVkIG9mZiBpbiBmaXJtd2FyZSksIGJ1dCB0b3Agb3V0
IGF0IDE2Lg0KDQpJdCBpcyBwb3NzaWJsZSB0byB1c2UgdGhpcyBvcHRpb24gdG8gY3JlYXRlIG1v
cmUgdmNwdXMsIGJ1dCB3aGV0aGVyIGRvbTANCmRlY2lkZXMgdG8gZG8gYW55dGhpbmcgd2l0aCB0
aGVtIGlzIHVwIHRvIGRvbTAuwqAgTGludXggd29uJ3QgZ28gYW55DQpmdXJ0aGVyIHRoYW4gaXQg
Y2FuIHNlZSBDUFVzIGxpc3RlZCBpbiB0aGUgQUNQSSB0YWJsZXMgKGFuZCB5ZXMsIHRoaXMgaXMN
CmEgaG9zdC9ndWVzdCBsYXlpbmcgdmlvbGF0aW9uIGZvciBQViBkb20wIHdoZXJlIGRvbTAgc2Vl
cyB0aGUgc3lzdGVtDQpBQ1BJIHRhYmxlcy4pDQoNCn5BbmRyZXcNCg==

