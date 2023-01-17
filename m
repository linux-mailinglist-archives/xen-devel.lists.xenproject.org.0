Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B01B9670D94
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 00:32:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479994.744132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHvRV-00013f-Gx; Tue, 17 Jan 2023 23:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479994.744132; Tue, 17 Jan 2023 23:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHvRV-00010u-CO; Tue, 17 Jan 2023 23:32:37 +0000
Received: by outflank-mailman (input) for mailman id 479994;
 Tue, 17 Jan 2023 23:32:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kjsf=5O=citrix.com=prvs=374a1453b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pHvRS-00010i-T3
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 23:32:35 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3535f902-96bf-11ed-b8d0-410ff93cb8f0;
 Wed, 18 Jan 2023 00:32:31 +0100 (CET)
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jan 2023 18:32:22 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5636.namprd03.prod.outlook.com (2603:10b6:208:297::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 23:32:20 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 23:32:20 +0000
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
X-Inumbo-ID: 3535f902-96bf-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673998351;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=G2i3daRfa0oeNdufIOpYLdInNUCQHAwX6/3DupdRhMo=;
  b=DrTeKk7dLYDL8PD8jody9Ds5PdzxYjmHRKrt7dxGd3ZNWNwLNlPKhATN
   3YvM1OIkj7Rvnvwxc9flh/yuu46Zzw58GfdbBey0Z6MAjPOc+e77Gmf1q
   VHfTknIR1kIHUYDeOoDdghU5yOYKSCrHd2C4VRWVVvrqgMFdR0NwzMy+J
   k=;
X-IronPort-RemoteIP: 104.47.66.40
X-IronPort-MID: 92529949
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:tB2qDKDx8H21zhVW/3Xjw5YqxClBgxIJ4kV8jS/XYbTApGshhmEAn
 GVOUTrXa/yMM2egfNl3Po2+oU9Tu5fQzIRiQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GpB4QRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw3utqPjBw6
 8IiDxdKQgiDiOSd3LGaVbw57igjBJGD0II3nFhFlGucKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTL++xruwA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE17WSx3KqBNN6+LuQz+FOw3a84HwqEhA1VXiaq9KdkGC/RIcKQ
 6AT0m90xUQoz2SsStT+RBy55n2ZpBkXW9lXO+I/4QCJjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+Wpz6vPSkeLUcZeDQJCwAC5rHLopw3jx/JZsZuFuiylNKdMSrr3
 zmAoSw6hrMSpc0GzaO2+RbAmT3EjpfIRwgx+w7ednik8ARiZYiuIYev7DDz5/FKJpffQ0KBu
 HUBks624+UHDJXLnyuIKM0HG7uj9vueMDnRhFdpN5Yk/jWpvXWkeOh46TV/P1tgM9xCdyXgZ
 kTSoitO6JQVN3yvBYd8ZIS3DMYmxLbhDvzqU/nVapxFZZ0ZSeOc1CRnZErV2n+3lkEpyPs7I
 c3DLZ7qCmsGA6N6yjbwX/0azbIg2iE5wyXUWIz/yBOkl7GZYRZ5VIs4DbdHVchhhIvsnekf2
 4w32xeio/mHbNDDXw==
IronPort-HdrOrdr: A9a23:7UDfka2S/JJWjt7CE3kHVQqjBI8kLtp133Aq2lEZdPU1SL36qy
 nKpp8mPHDP6Qr5NEtPpTniAsa9qBHnhPtICOAqVN/JMWXbUQOTXeNfBODZowEIdReOkNJ15O
 NNdLV/Fc21LXUSt7eC3OHye+xQpOVvKZrY4tvj8w==
X-IronPort-AV: E=Sophos;i="5.97,224,1669093200"; 
   d="scan'208";a="92529949"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/7kbe3nw2mwrPD/UmZn753YOIH4khQrYkUjVpIweDEIAC0P/9s+txZbZTY7viqExsLICr2//kKOISpKC19sUU6Boa0vI8dGuKOQgK9E2IA3TQcONI2Jc6nXuSga9h43TKZ/vpW+s9PwLuw1HEFAUZ12wwb57vx61C9KO6yVZrLbKEPfsLB6ZZmX5ifwPAB+Qef89+IQzxz0pfBH2Fe4akmYBy/tYNiuKo5L9iqrr4dtxpKLNsmlXSmwyjf/q9FgLN3oc1NAfhiysTvv7QIS+KnasEb+ABNKJbIn4k8VAPdFCediqF6JtBk2ZuOFub+A28h7bDWp/RQDd3dvcb3LMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2i3daRfa0oeNdufIOpYLdInNUCQHAwX6/3DupdRhMo=;
 b=U8eF4pcnwlgcimHwKFUfY7hhf9qqJ/k9jYaA/C3Ub/B9/40u9reypbb9+S7Gy1eUrj1iOEUNJtrFUoz1Dsa1t2ck50+0MMBNabsT9QoGn6Yr3hXYTjTnGreNcXlYHBEnqJwxWqvepOhCzRTXVdqwnE33iA3MO/+S4C32xF90+nnVxFwAQqF0oJd/rpfeHWGxreRTEjmNdO8S/kB0Vdn+LYYe/YE7Tte6YNk601nW0bE4cgcm6KUhVdSjrLPcAARJyM5mz+uZUHLJjBfh8J2iIwhnDZSQgtz+6AaOTCs3z8wDo3s/T0mR/i9hviBEc5+P3ZDsnOkPpvWPQhW+0ovyfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2i3daRfa0oeNdufIOpYLdInNUCQHAwX6/3DupdRhMo=;
 b=MBVigsYysJQzoyQYtdjCvVWd2KMc27YJnPv/35Mvkb6c8wtLNbCT9nbSwM3MhFKvdXW5WgjyK554l3UhZv90eIcJuM2r8wqFGWKNJO6hwncLjDoNIZEr+WR49TSx4lKOmGZGmr117ge0QqrHs1gXV1A3eq61oaMMGtBRqkMarQg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>,
	Bobby Eshleman <bobby.eshleman@gmail.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v4 2/4] xen/riscv: introduce sbi call to putchar to
 console
Thread-Topic: [PATCH v4 2/4] xen/riscv: introduce sbi call to putchar to
 console
Thread-Index: AQHZKbhhqgcYVfmmBkmkfqhgFJ6YQ66jRHCA
Date: Tue, 17 Jan 2023 23:32:20 +0000
Message-ID: <7918f456-14ff-77b2-3cdb-1e879e030b39@citrix.com>
References: <cover.1673877778.git.oleksii.kurochko@gmail.com>
 <06ad9f6c8cbc87284ef4ecd4b85d9c7df33bd2c1.1673877778.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <06ad9f6c8cbc87284ef4ecd4b85d9c7df33bd2c1.1673877778.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BLAPR03MB5636:EE_
x-ms-office365-filtering-correlation-id: 09bf7616-1aa4-426a-fb43-08daf8e313ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ptMXPr7SB2NV2zYIfWr0L6ERHPKaosTlAGP+UWEMX95zCOk7qMxC+zZFx5T2DJJXT8FneF1rInfryznYCMu/Cz50TDmBeSq49Tpgs6eWDXJ5BT51AYaDqhCVmzu7DTnUYY2tGDq5nxGuk8qbpiB9i2Dk09gdAnF/ukRkDfuz6rIc+3UhnMDjwyOBzFxLEnRhHei+x+EDChyk3Rsi/w9ajDFo9hK/v9JkODh5AIBgQnQRqk+PKTW8CRmXdb/GjhkFqnHnyirf2GFXtzsJr8WKYQw8mhnDeoNC75PptmbKMU0Jrf+5kIYxcm8OTw+O4nBP0gZeLW1FXWWwY0K3tAD3lUziRWjQ4IG7pNhd6npkZTjI9dILX/8WKXZMiPdkZyCe0yQ1yWBmxt74hapSv5fzjuhC/S/VNCkBn6kYI1QIWST/Xr9WqTOcj0MBt2wlLRzpiqU4w9reJe/twTCd6PCMHOhuo7H34gd7LNgNuP7tTCZx3DHZ4FSUnpCeag1dGZxAyT4bClxY5NR70QfQGqR/l0LlddiGcroFQkflCMs56lFWgDl9A3T7uNKCUum/w/k/l7aZOgbhXD1vlGpfnFSAStjuLs2G9p0Yv0VJHGYYWRWwd1l8goeK/6XtZg3YLg0iTNXRT1/6m0zSKLxARzbCY1Hcphh3510Fh0XoCIzWPwiCKaFFgk6i8dIhkd6uBk54ck4f2tOEMmIr5FajXwey+8TsoYt2//wPU0q3I3jU2Qo8QmYZQevzc0NAHx7KEwuqQoegmPl7/7Qqpwo1Lnw/HQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(396003)(346002)(39860400002)(376002)(451199015)(71200400001)(64756008)(66446008)(478600001)(110136005)(8676002)(4326008)(36756003)(41300700001)(91956017)(66556008)(54906003)(6486002)(316002)(82960400001)(53546011)(76116006)(6512007)(38100700002)(38070700005)(66946007)(2616005)(122000001)(6506007)(66476007)(31696002)(26005)(86362001)(186003)(7416002)(5660300002)(31686004)(2906002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U3VqNmEwdG01YWJDOGV3d1FhdmlzSXFXUFFMY203aFcxdUN2c0RTNGVldFNE?=
 =?utf-8?B?TmFoa1Q4ak5TRllkbEd1ekIzOXhQaWFpdGZjTDFVL1lmQ3IySVlkL1ZicGZL?=
 =?utf-8?B?OWlDYlB0TjMwSFlBNjFzdXNVRmcxK0RnaTBubVFWRy9Lc0h6bDNScnVxaFd1?=
 =?utf-8?B?MWxMVGdjUGtvTUlVZHRWdE15bThtYWhiU1lTSTQ4cUxncDdJRUU5a21Qb0tl?=
 =?utf-8?B?d0lGOEFuQzRwdUsxVXZOSjltbHlOS0l6U2ZxMzJWa2xIbE5LMkQ5d3Nyd1Rn?=
 =?utf-8?B?K2FwSzRPWThCbjNENlU0aU5MMHRwOEkzdTBzK2tZcXBHbk54YzdwMUZPZGFM?=
 =?utf-8?B?eUppdGNyekhZSTBkNTh6MTJiWHMwMTd5RHF0bHo2QmNVMDBBY1NOZmdZQzhL?=
 =?utf-8?B?cHUwZkF6UXY1R3U3RGtObThaQTBkcTdoL1pNaGNzcFZsWkxORHgvWmlSVU9a?=
 =?utf-8?B?WTlja01ZVkpJVWlhZm1jT0pkR3FDdzkyczIya3VvRE1YWm9Ua1g0MXM1bUh3?=
 =?utf-8?B?Y2xxUXErcmp6TTZteVVnUno1ZXJGc0dML0VGMU45UFZpS241NWpuc0pONHY4?=
 =?utf-8?B?NVJJSFFSTXhUZisybkhWd3BDYUZiMU1VdStHSE1mbzhPY21SSEFzbEo4aEdB?=
 =?utf-8?B?cWR0OGhmdVRxdkVaNDdKNGpUWEFmOTdVRWJWWDRLQTFYdTVneVp5SzkyTVBP?=
 =?utf-8?B?MG1PM2N6N1NEaHJyN25rd1NzeTNOTTNBdUVLVXVFelBoV29ZczRUN2owenZS?=
 =?utf-8?B?dTBnNGQ4emJmTFhGcllyNkRIbHdYQ1Y4Vm5PcnFHa0g0UTNQdjlBVHRrN1Yv?=
 =?utf-8?B?UVhJSWtGZnZEMlJjZWpjYjRHVFRpZ3BpNGdpY1FTOHczMldGRTVwRUN0S1Jn?=
 =?utf-8?B?TlBmb0tVNGczbUlwRU4wVGFrM1ZTT0hwUjNONXFFU0g0ZGwyajR6eVZQZEh5?=
 =?utf-8?B?NlNKTnN1VG5RQmJCTzBIUGhKdkJDOGFuV3pGb25aaitlcmR1dTR5OXp0dXVy?=
 =?utf-8?B?UHEyYldQeHhKbzNpbVZzYlM2RWVEdURDV2pnZ3hrR0U0QmVqQUgwaHQyd0NJ?=
 =?utf-8?B?VStJYi9nOWtodzc5SEtOZ3lMZVkvQ1dDTWtteHRxMS9uM05sdWk5amFWOFl1?=
 =?utf-8?B?NWhwZlZPWDhSdGxPK2FiRGtmUm00dGhyRExENSswaStpZFRYREtBKzdySmlE?=
 =?utf-8?B?SSsrY0JpZ2huNVU0K2EvMytZTmRRS1g1aVQyeWVyQllQVllOTlhRcnFXTEcy?=
 =?utf-8?B?eEJkVm5wcmk5SmlqRS9OaUlsbkpRbkFMMkt5RkpnWVN1RDI5elVUOHorV2k2?=
 =?utf-8?B?ejhvWDNoVVBXOHJFNFRySnZTUnpBRmlBd0x2QmR2OThOWW9UbVgxNFF6alVp?=
 =?utf-8?B?Sm9kSk9VbU5pVDJ6eHJjMEJzMHBINVRJd2RHSGlLNnFZTW82V1NIV1dRTE0z?=
 =?utf-8?B?QVArWC9xRmh3TFZyTWpjUlRtRXJQU3F4Yi96aE1hbmpuRVZoa2xFR0paV1ZU?=
 =?utf-8?B?VWhIbjFHbVNsQmtiWmVhSnFtS1ZrSEYxRTYyRFNNN2Y5REpkSXBqUVpnaXE3?=
 =?utf-8?B?NCtSY2x5bXFSWWk5STByMVUwQ3VLd1FwbSs3MkYrZEdsR1QwdE1qckgraFBr?=
 =?utf-8?B?SDhtWlFwTTN3SmtaWGNYdWRlOUtLQ2QzRkNMYXNTdkdndEVERUtyQXBUMW5p?=
 =?utf-8?B?RGhqWG9zSVFIMXdQdnpOVTgvRDNJdm5WRFlYV3lyYnVYOU5RTUZSRXpoNmtS?=
 =?utf-8?B?bytuZzBKbi9ncmZob2Q1V0J0dGdZK2l3S0pkUzdBODU4Vnc3STEweHFrM3I1?=
 =?utf-8?B?R0JvdXZLYWljSEUwcTg0RmJudGMyODZrcGNzaXlmamRxVVFrYzJVRGlzUnRt?=
 =?utf-8?B?TGoycUwxRXFQZEFnR3pkQzQrQm1DN2JGcnNFaFU1dlFWMzZqWTloTDZxMWpz?=
 =?utf-8?B?aEVDMFNwQzBGVnBGczdoUjJsODd4RGdyN2FFSnZKbE1BcnZySmxQc0ZqZGFT?=
 =?utf-8?B?UVJ3ZTIyTkR4b2s1K1gzK2wwZUZmaXVsUENVdVNpQXFyVS9TZFNVM2o3ZjFx?=
 =?utf-8?B?SVBySlZxcENHcE82em5rOUg3VHRFeVJFNTNQb20zZGFMZENJZzVXdURkYzVY?=
 =?utf-8?Q?8YCxDtkZtPr4C9f1zuoR6V1Qg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFFD7868C655B34E817A535B4D50C1C6@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?R3NRRk9mSjdLOUN1d3QvQ3owbUlKSU93dXJnb1lybXJVbSs2eHhTaDNvVTBq?=
 =?utf-8?B?ektJUWdoM1U4L0dkYWpSQ2wrQ3JhcGdrUGt1NlFjU1F1T0FSSU4zOFZxMDh1?=
 =?utf-8?B?YVQ5SE1jcTNXanNMTDZ5cTJ5bGxtbVB0MGVOSDJuQllWZVVML2ZHV2RvQTQr?=
 =?utf-8?B?QXdTVDlrYm44MUtoTkxZMk11YzM4aVFNSmZtUXpTSU1pakExM0ZVK2VCUUFs?=
 =?utf-8?B?YllrbmZ0ZzJ6Vzh4d2Frb3VxeUhhSUJjMmxhaHZvZlgzL1hIQmZGZnlWT09D?=
 =?utf-8?B?eTVmVWt6RlEyb2owWERnWG55cGNENnBKNkxGY0JZemovVkkrNkxXN2UzNWVC?=
 =?utf-8?B?WGlYQWRmZDhiRm9WR21FMThCbENhN0x4Y1ZyOHpaNU01aW1ZVkwvWkViRndu?=
 =?utf-8?B?aWxqVGVuaHgvNGpQVDJMY2srWW5qRXJlK2RqTlNKVGF3ZHlNRFN1SDJjTFlk?=
 =?utf-8?B?WVFLWXN0ak5HMXE3WmZUZHNjWmxadVlnY1ZaSnFWcjJpRkYrVlFPQUYzbmhF?=
 =?utf-8?B?RTgrOEZjMTc1cjNBenBqaUpkU1pqaUhEQTAwOHBuQkNSMWsyY29MSVVLMHpZ?=
 =?utf-8?B?eDJ0VlRwcXZrZ3RONWRucTY5ejVDMVNxdDh5N0tDcEtGRDh3L004MCtNS1hE?=
 =?utf-8?B?LzBjZ0djM1UzSHQ0dEgxSWE5K0MwZWwvUmJ4V08yaTliOHY5LzRlZmNiVkUx?=
 =?utf-8?B?aGRyVk82NjBlNUZMY0M1dnlCVWRxbGFPNjJQOHFMQzZTb0ZKSm11d1lXODNy?=
 =?utf-8?B?ZWoxT2ZsaG5vaDgxSnhHLzNNTWdTY2dwNlF3MXdNRUgrZ2Y5dUgwV05wMmly?=
 =?utf-8?B?Mms2bmo1aGMraFVaSnNuUXFKa2JxV1ZPZHRNRTdOQndHTHVwTC9YTEtmcGY3?=
 =?utf-8?B?MjJoclBaMFdPWUdqcHJpZFErcmlJSDVDR2JuOUdPMUxhaHlUdnF3MkFMc1c4?=
 =?utf-8?B?bHJTWlphcWVmd3Bid2ZXZUdvWUhCUy96SmtKZzZxeVVYMnkxc2FmYkY4N0dP?=
 =?utf-8?B?bFROYXJxWXpHeEJlT1llUCs0OG5NNy9zQzBUUzhrVjdDbGRYV1ozZ095dUFr?=
 =?utf-8?B?RWc1YXRxZW50YzlWOStVbWlrT2d0YUNCbWhSVVgxWENUbXlsRUtzSnpNOEhQ?=
 =?utf-8?B?bmlrem1VdER0eDMweUVLYnVWL1Q4ZDFRY0djS015eWtKTU1Zc05WVHBGYzY2?=
 =?utf-8?B?R21LWUZqY2hjVmwxWEd4SjFBSFRtajZaWXhZcnVJdlRGaHlCang2Q0F1NEJL?=
 =?utf-8?Q?ZYWKe8+hv+82tAE?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09bf7616-1aa4-426a-fb43-08daf8e313ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 23:32:20.1883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bk2LRP8S6wP2L+ZR/OV/eud5I59JChasNwNN2mdJT/f/UsikXrqqhux4wlJfkHSS80PTuam/gBpeVgQnHBZb1sJWCNH/oLHlU/f5VwOruz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5636

T24gMTYvMDEvMjAyMyAyOjM5IHBtLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOg0KPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvcmlzY3Yvc2JpLmMgYi94ZW4vYXJjaC9yaXNjdi9zYmkuYw0KPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwLi5kYzBlYjQ0YmM2DQo+IC0tLSAv
ZGV2L251bGwNCj4gKysrIGIveGVuL2FyY2gvcmlzY3Yvc2JpLmMNCj4gQEAgLTAsMCArMSw0NSBA
QA0KPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIgKi8NCj4g
Ky8qDQo+ICsgKiBUYWtlbiBhbmQgbW9kaWZpZWQgZnJvbSB0aGUgeHZpc29yIHByb2plY3Qgd2l0
aCB0aGUgY29weXJpZ2h0IENvcHlyaWdodCAoYykNCj4gKyAqIDIwMTkgV2VzdGVybiBEaWdpdGFs
IENvcnBvcmF0aW9uIG9yIGl0cyBhZmZpbGlhdGVzIGFuZCBhdXRob3IgQW51cCBQYXRlbA0KPiAr
ICogKGFudXAucGF0ZWxAd2RjLmNvbSkuDQo+ICsgKg0KPiArICogTW9kaWZpZWQgYnkgQm9iYnkg
RXNobGVtYW4gKGJvYmJ5LmVzaGxlbWFuQGdtYWlsLmNvbSkuDQo+ICsgKg0KPiArICogQ29weXJp
Z2h0IChjKSAyMDE5IFdlc3Rlcm4gRGlnaXRhbCBDb3Jwb3JhdGlvbiBvciBpdHMgYWZmaWxpYXRl
cy4NCj4gKyAqIENvcHlyaWdodCAoYykgMjAyMS0yMDIzIFZhdGVzIFNBUy4NCj4gKyAqLw0KPiAr
DQo+ICsjaW5jbHVkZSA8eGVuL2Vycm5vLmg+DQoNClVudXNlZCBoZWFkZXIuwqAgQWxsIHRoaXMg
ZmlsZSBuZWVkcyAoaW4gdGhpcyBmb3JtIGF0IGxlYXN0KSBpcyBhc20vc2JpLmgNCg0KPiArI2lu
Y2x1ZGUgPGFzbS9zYmkuaD4NCj4gKw0KPiArc3RydWN0IHNiaXJldCBzYmlfZWNhbGwodW5zaWdu
ZWQgbG9uZyBleHQsIHVuc2lnbmVkIGxvbmcgZmlkLA0KPiArICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgbG9uZyBhcmcwLCB1bnNpZ25lZCBsb25nIGFyZzEsDQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGFyZzIsIHVuc2lnbmVkIGxvbmcgYXJnMywNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYXJnNCwgdW5zaWduZWQgbG9u
ZyBhcmc1KQ0KPiArew0KPiArICAgIHN0cnVjdCBzYmlyZXQgcmV0Ow0KPiArDQo+ICsgICAgcmVn
aXN0ZXIgdW5zaWduZWQgbG9uZyBhMCBhc20gKCJhMCIpID0gYXJnMDsNCj4gKyAgICByZWdpc3Rl
ciB1bnNpZ25lZCBsb25nIGExIGFzbSAoImExIikgPSBhcmcxOw0KPiArICAgIHJlZ2lzdGVyIHVu
c2lnbmVkIGxvbmcgYTIgYXNtICgiYTIiKSA9IGFyZzI7DQo+ICsgICAgcmVnaXN0ZXIgdW5zaWdu
ZWQgbG9uZyBhMyBhc20gKCJhMyIpID0gYXJnMzsNCj4gKyAgICByZWdpc3RlciB1bnNpZ25lZCBs
b25nIGE0IGFzbSAoImE0IikgPSBhcmc0Ow0KPiArICAgIHJlZ2lzdGVyIHVuc2lnbmVkIGxvbmcg
YTUgYXNtICgiYTUiKSA9IGFyZzU7DQo+ICsgICAgcmVnaXN0ZXIgdW5zaWduZWQgbG9uZyBhNiBh
c20gKCJhNiIpID0gZmlkOw0KPiArICAgIHJlZ2lzdGVyIHVuc2lnbmVkIGxvbmcgYTcgYXNtICgi
YTciKSA9IGV4dDsNCj4gKw0KPiArICAgIGFzbSB2b2xhdGlsZSAoImVjYWxsIg0KPiArICAgICAg
ICAgICAgICA6ICIrciIgKGEwKSwgIityIiAoYTEpDQo+ICsgICAgICAgICAgICAgIDogInIiIChh
MiksICJyIiAoYTMpLCAiciIgKGE0KSwgInIiIChhNSksICJyIiAoYTYpLCAiciIgKGE3KQ0KPiAr
ICAgICAgICAgICAgICA6ICJtZW1vcnkiKTsNCg0KSW5kZW50YXRpb24uwqAgRWFjaCBjb2xvbiB3
YW50cyA0IG1vcmUgc3BhY2VzIGluIGZyb250IG9mIGl0Lg0KDQpCb3RoIGNhbiBiZSBmaXhlZCBv
biBjb21taXQuDQoNCn5BbmRyZXcNCg==

