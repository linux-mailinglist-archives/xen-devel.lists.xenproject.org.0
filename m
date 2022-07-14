Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D4557511E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 16:54:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367690.598789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oC0E9-0006sA-LB; Thu, 14 Jul 2022 14:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367690.598789; Thu, 14 Jul 2022 14:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oC0E9-0006p4-HZ; Thu, 14 Jul 2022 14:54:05 +0000
Received: by outflank-mailman (input) for mailman id 367690;
 Thu, 14 Jul 2022 14:54:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4joA=XT=citrix.com=prvs=1872ec3d0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oC0E7-0006ou-Cr
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 14:54:03 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb5bdbd6-0384-11ed-924f-1f966e50362f;
 Thu, 14 Jul 2022 16:54:01 +0200 (CEST)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Jul 2022 10:53:34 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6625.namprd03.prod.outlook.com (2603:10b6:806:1c8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Thu, 14 Jul
 2022 14:53:32 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 14:53:32 +0000
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
X-Inumbo-ID: cb5bdbd6-0384-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657810441;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+qesU61S1uD2pO1BRVOwgxgzkC4AwXaj4uyltg6FBc4=;
  b=O2cF9j80mIM3sZ/fnos6hmQgrIx7JNu6wE21xUzzEtPFGPIvy6KbTRM+
   qZZG8hLOCcI9uE+WEUL/SHX2YBjOdGg3eVHiErUtT3ToYEVL9De91M6RQ
   aZQltCisaUudeJnYaAdjsVV93BUxhGbiEHskB2AWfwz/BcWynC0aCQX2I
   E=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 75622518
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2PAu0qAx1Iro8BVW/+jiw5YqxClBgxIJ4kV8jS/XYbTApDwh0mYCx
 zcZUDrVa6mJM2enedAjaoS/8E9Q65bXyYMxQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E3ratANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq3uU0meaEu/Dga++2k
 Y608pe31GONgWYuaDpLsv7b8nuDgdyp0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36ZGBivkF+Sam66iWukwRpukoN2FjwXm8M49mBt4gZJ
 NygLvVcQy9xVkHHsLx1vxW1j0iSlECJkVPKCSHXjCCd86HJW1vox+VANEw0BtYn/eZ+OE8S1
 voaFC9YO3hvh8ruqF66Ys9Fo516aeLMZcYYsHwmyizFB/E7R5yFW7/N+dJTwDY3gIZJAOraY
 M0aLzFoaXwsYTUWYgtRVM14wbnu3yahG9FbgAv9Sa4fym7f1gFulpPqN8LYYIeiTsRJhEeI4
 GnB+gwVBzlFaYLFk2fcohpAgMfPnDvJdJAMNoSq//9Frk20934KAgUvAA7TTf6RzxTWt8hkA
 1wZ/G8ioLY/8GSvT8LhRFuorXicpBkeVtFMVeog52mlyKDZ/gKYDWgsVSNaZZots8pebT430
 l6Emfv5CDopt6eaIVqG7audpz62PSkTLEcBaDUCQA9D5MPsyKksijrfQ9AlF7S65uAZAhn1y
 jGO6SM53rMaiJdS073hpA+ZxTWxupLOUwg5oB3NWX6o5R94Y4jjYJG07V/c7rBLK4PxokS9g
 UXoUvO2tIgmZaxhXgTRKAnRNNlFP8q4DQA=
IronPort-HdrOrdr: A9a23:bFL9yaGhQW4rd8HRpLqFS5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNNICPoqTM2ftW7dySeVxeBZnMHfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj2Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnY4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlUFtyssHfqWG1SYczGgNkHmpDq1L/sqq
 iKn/4UBbUw15oWRBDynfKi4Xi47N9k0Q6e9bbRuwqenSW+fkN1NyMJv/MmTvOSgXBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjxkC3fLFuH4O5l7Zvin99AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlPeK3Jy8fC9wnxThjR03kEYzMsQkjMJ8488UYBN46
 DBPr5znL9DQ8cKZeZ2BfsHQ8GwFmvRKCi8eF66MBDiDuUKKnjNo5n47PE84/yrYoUByN8olJ
 HIQDpjxBoPkoLVeLizNbFwg2DwqT+GLEXQI+lllutEk6y5Qqb3OiueT11rm9e8opwkc7/mZ8
 o=
X-IronPort-AV: E=Sophos;i="5.92,271,1650945600"; 
   d="scan'208";a="75622518"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M7VkKkFFg7AyWyhMqQl8M2goPyLGDNdkGyc4bavQs2aWihkEmmact0f3bjBKZwXE+jyqtVN1IYl0Sn3ACtp5dyuBGSvdIi9LnpcnhOYOl2unShBwHcCAclOXGV/ZerSpUTfd7BxWjgwT1lmArcQpR/RMeiMXoQRoGXDc/za4Ew1inijSKg2vq+yUHp+223yMt1wnJaNUePHh+exqof6rEDNxN+aZgf5d/nvzBMDz9iUWuSA2HJ3GomWueJVRa1AO0WZEWF+uAlBYEBjsbJM/Zzwo/d10Zzy6SAuaJqf6J9KG3eQlefU7Uk9j+iKtBo1PtLFWHQC8eqSboqR84RiqLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qesU61S1uD2pO1BRVOwgxgzkC4AwXaj4uyltg6FBc4=;
 b=AJZE+bwYEv5EMuY3KEPQRz6r6OgbAwBTgpLZjckx02+P3sq0jCIXugiQvyPyNgZ+dCamtyz03Bz0bYrXqyZSV1LaE5BB3YN37vJKibpPupq6PJc8CFrpy/m/0duB+LanF5hQGkdIZrBkGDLqLMm+b7oAeTSUq2qbOGmkRQlkOGsYoYj8vaiChpaqFBLK7EOrdxqUGTuclKD2Oi/PLFJOVTeQIpcW1lhx4nfllP7j6BX8N4n4aKf1ASBHZXv01oiwfLqcFnmUfB8jVwgfKSguEcr+xgF4dodjW5BhFkO35KX+49qCoYyVotxRc5DpQY+4UbIHuRIAjLZIXLYaM2/IlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qesU61S1uD2pO1BRVOwgxgzkC4AwXaj4uyltg6FBc4=;
 b=sCmvfwQvMTFaTbVwV5F1aNZSqH29meva8VK4PJXnMD4Jg9XnC9w1Mp/+zgYddQwM6yxVoE0elnPchWjM8k667lXHHOWgPs5P9Z/OB1PEFUcp4RjsblU5/TDkJUMHyiXw9PF+eaxUS5U6u4HbUIYk6BAaoidyfEt/+15sGqmg5yA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 2/2] xen: Introduce $AWK in check-endbr
Thread-Topic: [XEN PATCH 2/2] xen: Introduce $AWK in check-endbr
Thread-Index: AQHYl4+EPxA5nYqw/02GdHJyv+moia1989iA
Date: Thu, 14 Jul 2022 14:53:31 +0000
Message-ID: <9e811b53-2859-3d8b-b503-527cb187cfd0@citrix.com>
References: <20220714143907.25938-1-anthony.perard@citrix.com>
 <20220714143907.25938-3-anthony.perard@citrix.com>
In-Reply-To: <20220714143907.25938-3-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 924ade66-e44c-4acc-668e-08da65a89ec7
x-ms-traffictypediagnostic: SA1PR03MB6625:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 eUndIf1PhyCfReVPdMjaU554KljWjvlrktNdUhCC9jqUiydVHdgvD8NpJe6nhoKaqrBbFl07IA/1ebc0K1aKuMwIQoCTz7za9SXQrD/vX0IpOyPESoUP65x9XUzyRDC6NQ1GZpUol0OKvd4DzClWra49Up74llQctyqs8UdR4vdMjvXMUPSX0lDjqJwpM3sTjahWVgOtLatVDwH0ofAin+VZ/SbCZOBK/w39d7ybLsUXCiKDInXKXzOxApSINa8nK8XhBvJwClzhnXrbrixgxUAuQbOh+Ig+/N/NZfdXSvtnVoI0k6EfLWgKfJ1jt5JHcigyHnEsglOwEK5xtgau1RLkWacDP6EmlHoobOWwOFCqiLancoTuv2wuIrsdhR8gISbK3Zwqcy4Bd7z7sx78cr9j1Frau65eiQ5uy+TdEoRVgvFzp4hLXIowlKlDhlZmEe9zirfhp5zX3wlZ1exdw9o19YKZ6NBaHvXxoSMJwRwkKNHGm/2Z4trJjUimoOimtSkznw1rCnl3xrNqr8D+tMKlUQ1P16LI35RiaCbqoJYDJsd7YRTaH2EMe/cdg/E3MXQGNpTMoUUdIs0CBY3WRNlr/Wqe6Kskq3sks/do5OpOjwcUFyxI+w1XzIU83r/WzoZle7gw5zwhoKM1F8ahGJq5TLfKnC+gYS6jMyWqMGednCWT0/Q23R+5e9V/TljhCJ1Gbd1ifzV3RnMc/YIcjaYkZHPN7Cj1pEfpSlTZySIvkar4C5Z1ETp6W1qo8NHsuG2O6fnq745AtP1vztRbwk0geaS3Us+WhbZwvzsq1n9LZG6p2ff3o8knZeqjv1zQuJcDletQiR50GiN8ZUKuEMFMnoYV73mVRvs+hysyjklBQTtNVeSXVhwk8tJMCObt
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(38100700002)(31686004)(6486002)(36756003)(2906002)(316002)(122000001)(53546011)(5660300002)(31696002)(86362001)(66476007)(64756008)(82960400001)(478600001)(6506007)(66556008)(91956017)(186003)(4326008)(8936002)(41300700001)(558084003)(6512007)(110136005)(2616005)(8676002)(66446008)(26005)(54906003)(76116006)(71200400001)(66946007)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZXh6ZitGMmdUOWJDcXBRNUI1WDNGNlBrNVpjczBQazlrbnhwQzIxS0wzOVNK?=
 =?utf-8?B?SGpEdlV4cno3S2J4UkhxaWluMWVDL1V4QnRadldOd2RCekpwelBwMzNxNU5n?=
 =?utf-8?B?SDVpbkdUQm5yMXpKZDk3dkUwai9iMmlQaTlCWitzbEJTWWE0a1k1VkppbmQx?=
 =?utf-8?B?Nm94SlJLUldnNE1KaU1FNGUybmg1TDNNTHp5TEc1TXZ5QUtTYVUrYXJzZGxr?=
 =?utf-8?B?V3NlNGY5RlNrcFZ3U0RmRTloQ2FjTkhHcWZoTjZXcmJrM1FibGljMnFwMVBB?=
 =?utf-8?B?VFdkZ05EL1V5TEh6Mjg5UitGcWwzNndzSjI2NmJzM2NmTTI5RmFjdWlMRFdi?=
 =?utf-8?B?cXBnOU5mdU85djk4MEJjUFRSNlZ4d2hjU1RYMGhOUHF6cFdOTElpNktXeVdq?=
 =?utf-8?B?bHRmQThIeFkwaXA2RG9nWkYyN2JLdGZVRU5vTS9ESUkya3pzTW91ZWo3cHBW?=
 =?utf-8?B?aXlycVJDZHZQaDJaTHN6RTdjL2E2Q0szeFFlQ3o1VEkrakI2VWZXOUp0VXpG?=
 =?utf-8?B?UytMQUtRUTJ3V29FS0lvZUVpNTdpQjB0cFkrazd1NmVaVlhuUkhmYUpVM0cr?=
 =?utf-8?B?bFdTdC8xSmRNRG9aOHpSMlRDMVpBUms5TFUvNXduZU1TZGNYRHBuaHg4S3Rk?=
 =?utf-8?B?Q0h3eEN6dEFuTkphUFB1R3hmd25IL0FKd1o0SXhDWkhDaEs5Qk4wMjJYb2t6?=
 =?utf-8?B?RitkYlJ1R0ZYd0J0U0hQc3hRS0JDUDNLRUhxY1F5QkZNbUVaTGZwNlZhcGpU?=
 =?utf-8?B?dkl3UTA5cHM0azZ4MHRwQkMzZkhTWFRaa01aUjhrb21rRkNxdlN4U3d6SVMz?=
 =?utf-8?B?VFVtS2VYRStPVzN0UFRrZm8zYUhzZUV3KzRsMm5MdSthTndVL3ZLSUhSQVpO?=
 =?utf-8?B?M1pIY2cvNG9mY29QeHp4SzdjNkwrVENhcVV4Z2dDYzlZRnZCaTFmSzlOMEJl?=
 =?utf-8?B?K0FGNm41VDIybXNmK29iV2dRYVQ0eWVXTjJLZXRyUkdzdUNKK0w4SFk0N20z?=
 =?utf-8?B?WWdWOW5vaFZnSE83Z0p0V0EzZ04yNXMrZkc1SGh0UFFoZVc5S25lSGVDUVho?=
 =?utf-8?B?UW94b3IxZVE3ZnVnOGFUQ2diK1lVblJiNmVUTS9YYUYvaFJqTUFxTlBXU3g2?=
 =?utf-8?B?QVZYN1dvUWZXTUMvNGVaT1l1T0dMbm13V200bXdTQU4ySlEvUWVjUWtmOU43?=
 =?utf-8?B?UCtsY3hUQUlSRllscCtkSGQvZXB2aGV6ZC9vTUh4MU9FaFlsRExkdzRHRFg1?=
 =?utf-8?B?TDM0ZmZxeWZlVHhhYitOcG9XYWVFNE9WRlZaQlNiTkRjL0xSOTdtT3ErMWxQ?=
 =?utf-8?B?SHYwdi9LblJNRkFJS0JQdERWQWx5L21DR3Z5cTkyMUxkNzFURFBJOTVFT2pu?=
 =?utf-8?B?QjdFTlpZOEovYUlRS3Vjb2hYMnQvZjY3RVpMcEE3VFB3U3BDWElkOGZSRmcz?=
 =?utf-8?B?NUt3M0RHQWRzWkFoZGNWYkViRHlIWjdUQ3hxcXdlZ0FtYlNWSkRvRzIyREl3?=
 =?utf-8?B?a2Rqb1BlTTZVSjhXL0ovSmFpY0tyMmhNQU1EK3ZBQjRYY0FOcWVnU2hTRC9n?=
 =?utf-8?B?M1luT2dWNGR3UDJtOG8wVHhLdWtWQUR1b3hUMmJCRzdoMWRjUElmWlg2RW4z?=
 =?utf-8?B?ZWVLMk5GbktqaXNSZTZ1MGRpaWZxWjRKckQrM0dCZUVYY0hQQXBnZHRxVUpW?=
 =?utf-8?B?TmNXeVh6VFp3R2VsTHMwSWx5NHNmeGF1Y3laUFhzNy9QSU1LcGlRR1I2ZkhE?=
 =?utf-8?B?OVdHTk5abUd5UzNxRTQvaWhna0MxRWcva1ZTSW9wYUROWVRYZUwrejk1QVk5?=
 =?utf-8?B?cXhtOFMrR0RGSUV2ZDBFM3BvQURqTXJXV3A5UXcwdnhoc3dxdE5SSUxGQ29n?=
 =?utf-8?B?eHdQMlduc3pmdkh3Qk4vYTg3UC9ETkdDZjhDQVBrNkVZL0lsWmowcjJWN1FQ?=
 =?utf-8?B?WWhnVzZNWFZWL255UFk3K0ZFQVRUMWlxaGg2d1I3emhpZWdzQWQ3UXFrYXhW?=
 =?utf-8?B?NDJGRnErYUN0R0ZIYzk2TExoY2d0QnJWVVpWUS9tTGZjMXB1OHZZeUN1Qk9B?=
 =?utf-8?B?cGxrbnI4M2RGbHBrakZua0xZQ2I0MzFuay9yN0tSL2RlbTh0NE0xWTFxaXZa?=
 =?utf-8?Q?dIW4gsTnjj/sOO3bCW6cdknDq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E532D1FB9929C49ABF0E3D4BB854870@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 924ade66-e44c-4acc-668e-08da65a89ec7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2022 14:53:31.8813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R128glzss6L7MnaxcZZEDIm4w/l6ggwu/Tdi4hqOVyJg7I1k4+RlVLNFbw4EoKQ8ygf8Q12hexG12Y+6QWX9HST4qGRvYmsb7keek9b+PWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6625

T24gMTQvMDcvMjAyMiAxNTozOSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IFNpZ25lZC1vZmYt
Ynk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPg0KDQpBY2tlZC1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg==

