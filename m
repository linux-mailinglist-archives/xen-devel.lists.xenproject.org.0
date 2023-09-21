Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF997A919F
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 08:07:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606096.943827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjCqJ-0003kP-Os; Thu, 21 Sep 2023 06:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606096.943827; Thu, 21 Sep 2023 06:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjCqJ-0003ih-LK; Thu, 21 Sep 2023 06:07:15 +0000
Received: by outflank-mailman (input) for mailman id 606096;
 Thu, 21 Sep 2023 06:07:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rTyL=FF=fujitsu.com=lizhijian@srs-se1.protection.inumbo.net>)
 id 1qjCqI-0003ib-6n
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 06:07:14 +0000
Received: from esa17.fujitsucc.c3s2.iphmx.com (esa17.fujitsucc.c3s2.iphmx.com
 [216.71.158.34]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a2bb233-5845-11ee-878a-cb3800f73035;
 Thu, 21 Sep 2023 08:07:12 +0200 (CEST)
Received: from mail-os0jpn01lp2112.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.112])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 15:07:02 +0900
Received: from OS7PR01MB11664.jpnprd01.prod.outlook.com (2603:1096:604:247::6)
 by TYWPR01MB9807.jpnprd01.prod.outlook.com (2603:1096:400:235::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 21 Sep
 2023 06:06:58 +0000
Received: from OS7PR01MB11664.jpnprd01.prod.outlook.com
 ([fe80::1a61:2227:a0de:2c53]) by OS7PR01MB11664.jpnprd01.prod.outlook.com
 ([fe80::1a61:2227:a0de:2c53%4]) with mapi id 15.20.6813.018; Thu, 21 Sep 2023
 06:06:58 +0000
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
X-Inumbo-ID: 1a2bb233-5845-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1695276433; x=1726812433;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Czt4Vqpqpa8teNewGt1ClwS8K2U8gOZZ2ifKnLuwLlk=;
  b=oC2ZuumP7MWAdx/ZB2EAyR8WLqWqM9O5nKOe+BLptLTGxyIJDV6Mgb+w
   DoR/gQJo4mRkCpuDBdacCKh5+sFD6tIzVguFEfrn1ygM21zCojv9FfY2R
   NN95hkBg76mMrtWkXS7cz1wNUfcFIgihxGpkHo77Zmw0RiLYSCw3iFy3O
   L2f2xf0l1s4SQpNetAfwFYtlRuvKZumsMy6idNIWmyJHm8BJXBowJzDKQ
   OvgqZqmK6yXVYVl3bi0KHrUD0dBgF064aPLjyiOI/AhDNSuRyOZokqVgn
   Rl1eWv/l94MX7ci+DfPCoFSf7R4sdPMYUosKSfKIacRxKhkqp9lXSHVBO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="95949117"
X-IronPort-AV: E=Sophos;i="6.03,164,1694703600"; 
   d="scan'208";a="95949117"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oS84lbm1VkLQLa1v0tWXgF7+S5W5BjnNDbn8V8V8OMcrkeMF/4R1aOFHs7YnVLkPeD2VmU/AGkNxzHH4wFxXHnpq0mAWaeGWX1tTQT4F8XNTX64aEGxkq3LIzWuuF99Dzly7/TMsNRapJ+116GXbPEM3J+wkATFI3i+8tp6W98WvlRblXjiPSa6XqCZedZU6lEROhrA+cHdF4BAbauoEqj3XvbsMnTXyQ2yhWpJbEy2GAjO0Od50X2pWrI/OHwGu32KSxqHJF1FZ95BXWHzztFQL50Edv4cfKxZMaN3t5eYr/S/sm29qdJDc0Ai2h+zMUp06yXcRmxNHng0cQSI+PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Czt4Vqpqpa8teNewGt1ClwS8K2U8gOZZ2ifKnLuwLlk=;
 b=oQCV8B/zu27Yn/cMabHC4FFy/PFwL6n6PkEn5Z+3oTPYciWEKJJReM9tTibNA5dw9B+R1SPCvkQOYYiUkEKG20FxnZUB4BjJAB1IjPUBHUmlK2Ffjl3bKj7Yb/9pFt3yx7Wla1v4GSU8dGKdv4W1ueU+2xVXthxUYygkzRC+7+rtXcMQ9Y1AZSbtBo20vub7jxBcuDfhMOcONF8AA7gi8WqDxvIAKGekWRSwpTXxj/EwU4862M5bzWwCfurxfFOyUx10E4avRf3e5Dtl++I8jQ8ByGF26jhKwLaSEwUWW9E89Swx6Z0X+T/J81v5jyedU25D7ABNgak6lbRisNnzZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
From: "Zhijian Li (Fujitsu)" <lizhijian@fujitsu.com>
To: Markus Armbruster <armbru@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
CC: "kwolf@redhat.com" <kwolf@redhat.com>, "hreitz@redhat.com"
	<hreitz@redhat.com>, "eblake@redhat.com" <eblake@redhat.com>,
	"vsementsov@yandex-team.ru" <vsementsov@yandex-team.ru>, "jsnow@redhat.com"
	<jsnow@redhat.com>, "idryomov@gmail.com" <idryomov@gmail.com>, "pl@kamp.de"
	<pl@kamp.de>, "sw@weilnetz.de" <sw@weilnetz.de>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "anthony.perard@citrix.com"
	<anthony.perard@citrix.com>, "paul@xen.org" <paul@xen.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "marcandre.lureau@redhat.com"
	<marcandre.lureau@redhat.com>, "berrange@redhat.com" <berrange@redhat.com>,
	"thuth@redhat.com" <thuth@redhat.com>, "philmd@linaro.org"
	<philmd@linaro.org>, "stefanha@redhat.com" <stefanha@redhat.com>,
	"fam@euphon.net" <fam@euphon.net>, "quintela@redhat.com"
	<quintela@redhat.com>, "peterx@redhat.com" <peterx@redhat.com>,
	"leobras@redhat.com" <leobras@redhat.com>, "kraxel@redhat.com"
	<kraxel@redhat.com>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>
Subject: Re: [PATCH v2 2/7] migration: Clean up local variable shadowing
Thread-Topic: [PATCH v2 2/7] migration: Clean up local variable shadowing
Thread-Index: AQHZ6/D0hSSeiTIhfkazdX4/frS54bAky8QA
Date: Thu, 21 Sep 2023 06:06:58 +0000
Message-ID: <2d279657-572a-db86-d227-849b41c14436@fujitsu.com>
References: <20230920183149.1105333-1-armbru@redhat.com>
 <20230920183149.1105333-3-armbru@redhat.com>
In-Reply-To: <20230920183149.1105333-3-armbru@redhat.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB11664:EE_|TYWPR01MB9807:EE_
x-ms-office365-filtering-correlation-id: 2d03fedc-aa92-4ee1-25d4-08dbba68f6fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 obbt+cWNczQSMpk+W147i+qK8Kbp0IkdmxMGRSP45u07maDYTn2dbN3qrfVD9QRAG4RSYxNarrA/Ay1490LzY9tqoNgScq8XAxqw/5QjwyYjOyF8oFDrdcV9PXxs2nbeJLvXueR6LvDN8lFP9DEiro6HUchMNnnFhHLRaWMyzEBHMw5uOKwBvew+9xGEdfkByd/L0/OsgysBAtKf1rVGkt/b7Qlmxcfwg6i6/BEAN0WUTW7WWoxHNkxCISBf9mZO1q2SUOgVlP1oY8fDhodCgu510oMxjTpkDNzuY065bT2JowH9CA/7gIlvG3/CWEFwhve0Wjxv5wwD+A7qHsziFnXtRm+iwmBNFuZdAQIFW8NuRWTnMNbwyq7PykebpllxJdEYvmUHyKlcxDQLHiy2OlN4shMw7c9CG4AT8Cp3WC/Pr9YxePV8PiY53oIKsRyz0NLORj4KXL1auYcwu7ncS4T2TsRCUZvjA5huRjtAmEnvJ9D7Z4Z7B0akU8M1DdAOt606B1hDhA0N2lAoIpJl5PT7yxIoDdzCgLJPRMY4Y7EBUIDyLYPaOahA+CtRfNaSTqDG+PKk6Z52CvJgd6maYaIBc2bgj1RV60SWRbYEdZAgec4+eJ6QvwGbAxhvrjpreldktImZ/yIjg/sdGThexxzaLKsHl4h4jETRGVEwnYsr6KfdL1AEmfFMIQa8W7rUFXvBRXE7zxdCjYLYfztlzQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB11664.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(366004)(376002)(396003)(186009)(1590799021)(451199024)(1800799009)(38070700005)(83380400001)(4744005)(2906002)(26005)(1580799018)(478600001)(86362001)(316002)(41300700001)(36756003)(66476007)(85182001)(31696002)(5660300002)(8676002)(4326008)(71200400001)(54906003)(64756008)(66556008)(91956017)(76116006)(66946007)(110136005)(66446008)(31686004)(2616005)(7416002)(8936002)(38100700002)(122000001)(82960400001)(6512007)(6506007)(53546011)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d1RTVDhvQ0FIb3JENWVZQ0NMYjIzSm9pbUdZbE45L282dVVneWl0Z0xQR09w?=
 =?utf-8?B?cHhDWVM0eU93bTNlZmptYzZTc3NkS09KTVFXaGRpMEV1dlpDR0kybU40VlRn?=
 =?utf-8?B?MGh6UmNiNmVIbVczTnMybVZIWmZNTWpLN0hMU2x4ZVcyS2NlRXNGNS9tU3hG?=
 =?utf-8?B?UDBrZmdxMnNhdmM4b2ttc0txRVIzeDFIUnJxUUR6QnhVNVBERVdKU3JlNkVv?=
 =?utf-8?B?eVByc2dxcTFaMkprTEMvMDNXUEljZ2lKZ2hVQUFuQnd0MzVrcEVKK3dvcDRR?=
 =?utf-8?B?VkxtWE1pZW4zcG9BM0NUcHBUVlA4ZkI3bWpVZ1lDRUlMeDY0U1doeEZyUEx0?=
 =?utf-8?B?YjBjbWV5bk41eE54UWNnN1B3Mjd3QnJlR0hDT1VOVm9hRWZJUzQ1a0ZScHNm?=
 =?utf-8?B?UTYydFNxckd4NFJrdXZVNCtLVmFXTlZjSWMzaHRUZnhQaUZKQ3BQSmlTUmlK?=
 =?utf-8?B?ekMzcmlTNnV1Q3pOazZkbXhRcTl5NUlUVWdPbEpsVlJIMTJvUmRuaUhBc3o3?=
 =?utf-8?B?b2NmRWhGYkFWbmJQTnpKcFo2TmlUMk1QSW50VXpOMmxuTTZJTUJmRFJMT093?=
 =?utf-8?B?R2N5L0ZQSjVwS0RsekRFTFBVV2VxMzRvQUJuOXdKL3hsTlZGRms3SHhBbU1R?=
 =?utf-8?B?Y3JjMUN5SWRPY2F6eFkramxIVU91ZUFMb1JTcDVlZk5IQS95dnhYeDdIeEhE?=
 =?utf-8?B?bGdiUGkrNG1vUWp2TGZHVnNuVTRnYUNBYlcwV2QzVU8ySVJUYTJSTGdmWXNz?=
 =?utf-8?B?WXQwWVpTUGttanV4WVVSdGRoZmo1aWF5UXhKc3VQVFhJVHN0R01OVG01Nk9s?=
 =?utf-8?B?b3owN3RCMWdEVTZJVmI0R1BEL1NXNURET3gwZFh5am0rTTB6WHNOUjh2VEtV?=
 =?utf-8?B?cndHR0txSjUvYXg2NVpBcmdKYkZzTkhlbmI0VW5MYmprV2pITzBNZTJuUkhs?=
 =?utf-8?B?a0drUTQ3SXBxWklhc2hLdEpHc2g4NHd0eVlhZ2JsTFR3ZkNIdDVBVXAvS0wr?=
 =?utf-8?B?Ump0L1QyMVJFMWpRUHJ3WjEyRUIvaVlYZ2dla3crZHJlTzZiY1JQT3JheFF0?=
 =?utf-8?B?VnRYQkptc0EvRHFVOHpmc1gvMDE0YTQwanppUW9mN3JZVVQyZkl4dGZMeklh?=
 =?utf-8?B?em5JVDVCMHJBR2xVMm5MMzVJTzVqSDhpQVFUNXdYNTY1MktxRSttVFJpQ3Rm?=
 =?utf-8?B?U1daN2NTbDNSdWNtWit0eGMrdlhXZlF6NkJYSUdLdHJ6Y3JDU0gycU9MVGRJ?=
 =?utf-8?B?SlNhblYwMGhETUxzQXJxTlJpN00xazkzZERsby91eDBFVEFIMWFSVHJYS3ly?=
 =?utf-8?B?OE1iWU5pUXg5RG8vdVMrOTcxLzVpT3o1d2hFNFVvRWlTaTB0cFozUEl6elRP?=
 =?utf-8?B?S1ZabVRmVkhHOStoMkFHNUZTL2dscjNnME9sY0pjMEF0d0VnajNqb1JMQU5T?=
 =?utf-8?B?dDE0ekw4bGtoV2JXTkZ0V25RMkdybXB2ZVozWVRJaXFHOEFKcS9NOHovM254?=
 =?utf-8?B?VGdMUHBHaStjZExZcXdPc25HQ0J3ZVJ0dlJwNmRMdlhrV0VXbVNhU3E1SlFu?=
 =?utf-8?B?SDAvOWhqeWtTUWVuT1IrZVhxbStKNG1IcDB2ajI3QUpRbGJNZXdyRmMyM3ZI?=
 =?utf-8?B?eDVEeTV1VmRnVGRoeDFoT29NdTNOSW9DL1lyT0pIWExSb1lRVkpPcURvTThj?=
 =?utf-8?B?Z3JseWMyWTcxTTAxay9VMUY2SUw0eWw2WjdiR1ErcVh5Vkw5TnZNYzZoLzha?=
 =?utf-8?B?WGRUYVNRWCtYai9rY29ndUVHOTF1Yy9xeGIvRUVNaC9Xd0ExNm83cVhNa3FD?=
 =?utf-8?B?bVFIdFVnRWl6RXNIcFdUR0xCVDFmTW1CRncydUM1N1pTbWJiNEpWUmtPTHlF?=
 =?utf-8?B?Tmc3SEdzYllWZnY1ZjBIQzV3R2lBbng1QThvZ2FrZUFHSEdMTVJ5NU01WmxG?=
 =?utf-8?B?ZXRSdGhzWnI4R0s5MzBuSWtXRHNkU1l5b0UyUmFWZG9DYTZ6KzdhbkJGdWxR?=
 =?utf-8?B?ZU5SRUJaNDFZZjZMY1N4bisyMUNyZHMxNjBOeHZjQzFiaER3M285dzdDSlBI?=
 =?utf-8?B?TzVjQUZCRFhJSzdJQ2M5eVVBZVViQWc1aTYrNXBkdjdpNVltNEdadTRqY0sz?=
 =?utf-8?B?bUs2bHRPR1lER3pIUzU1MnROejB0Y0RoWStnSzZlbUxjYyt0NEdmQkk1VVlP?=
 =?utf-8?B?ZHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7F75A53AE1AAD4AA5E8CC2D8659E53C@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?NkpBZ3FyYjJjQTVTUnVHaXNMdUJITno1RGdGRzJpa0lvVm5CZU0rNWFTNzI0?=
 =?utf-8?B?ek9ITFRWQkM1VElWc3FtNEJGTjFKMEk1MzMrQVlWOE9rTFJWZ2JCL0dWRmVB?=
 =?utf-8?B?YS9ncmdxbDZGdStRZG54MnUwWDZVUk44ZzFnMktpZ0I3Z3RQdFRNQ29MM00x?=
 =?utf-8?B?M25UNktpNW9DYWtLYXQvdW9nMXdjQktFQUd5Ujh0aTduV2dZVnZTRnhwMzhS?=
 =?utf-8?B?L3U1ci9ZWVdWaUJrSDhNc2dEaDE1YU45U0syY3l0Qy8wZFhWajMxdFZXd25x?=
 =?utf-8?B?dGc3SnJwSE5mTUFPdGN5N1ZHOXlYTzZYSzdjTENYZmp0Z3hsNnVYbzM0eUJa?=
 =?utf-8?B?c0ZNODY1bXlJb1Y3dy9FRWxpNy85T1p3emZ2RGVnME1qRThDbXVYdnNweW1s?=
 =?utf-8?B?MTlPWVBlZi9LVGJHY3BhUzRIaHljb21aTWd2UGpkbExQT3pMek9GaitycHJp?=
 =?utf-8?B?NDhhT2llQnV4Vmk2MzRneWYzbzBvZk14elUxWHM2UXZraEt5YlRVTWJ0MlRX?=
 =?utf-8?B?OGlEcVUycG5GeVgwK3d2eWJyM2NBRzQwZTlCWWdBN1dwTHJNMEVFcFlmQTdO?=
 =?utf-8?B?L0laVTVVcXlzRmw3K2ZPM0F4bDgyVWNIT2FiNmNrbllrenlydndTaTJWRk1I?=
 =?utf-8?B?bnlOd2N3a2JWU1lGU0ZUbHM0KzNrNk9rT0xEZm5UK2RUZXFjNFA2UmNsQjF2?=
 =?utf-8?B?NWhmaEJ1cmY2SkZzTnhab3U2cVBnSFNHUDJ3M1MrK1NQc0NaVW9rVWxVUGhk?=
 =?utf-8?B?N2lxQTA4Sk00SVhVQ2paUERHZ1dCbmdTbFdpVnBhaEtlRXJxdEdSTGxaYXhD?=
 =?utf-8?B?V1VsNXVqcXhLTGNQSkxQU1Q4dmFLVlBoTXBEODRidVpRWEpqM0JhT254WW5E?=
 =?utf-8?B?ak95d0EySSsyNi9nR2gwU2lwUDNzcUtia1g1U0MzZ2JLM09NS0l6d1pjd01B?=
 =?utf-8?B?cUFLVlAwN29zVHFQSlF6OTN3QjI4QWRJaktac0ZHTjJwUmxLVWFpdnJ2M2I0?=
 =?utf-8?B?dmxrS2FxNjJwaUM3OEwwSkJrRWJKUnpUQVg2YkZnYnpaNFNiNi9OdzcrUDBZ?=
 =?utf-8?B?dTk4d1FabVZMb1NCT1c1WXFNRDZDWWp1YXVaUE9DL3UwR21GOUp1VE1zMWND?=
 =?utf-8?B?R09sZ01Wcm51eDl4U2VBZjVxUDdPMWZ0STE4ZWR3dVhISjl2eFowZklFSW8z?=
 =?utf-8?B?TlB1cXU1MW5xZ3oxRmF1NWlKRVQ2Z09EVHl3ai9VQThUOS9YVHZpcXdNZnpU?=
 =?utf-8?B?SUJjOHhndnpBVldweVdDWE9XdU13ZXJxYkx4WnNjYzVIb3ZwUko4Wnh3QzI1?=
 =?utf-8?B?NXFIcDlsVUNvK0RYOC9YcENOZnlaazRua3FMYVZpRFpDZWYrQnBJanFmYzg2?=
 =?utf-8?B?ZXp5UnZrWk01MjNwV2wzNW0zYVJua1lkOUpYOGZkbzZRREZwSDUyekdwYXR0?=
 =?utf-8?B?VlM0MWsrdDU1NnYyOW5mRDFWNFdTZldhUDFsalFDUG90M2o1NW5GU2t6MWds?=
 =?utf-8?Q?DilPQc=3D?=
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB11664.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d03fedc-aa92-4ee1-25d4-08dbba68f6fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2023 06:06:58.6099
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FY9H3lkZJ7cYyQaO10B1u8zz/CZtqYsTQTIwOmLftF0w2Tritil07xd5fV67Si0B6N/zhJeIchlrgpmZvrzQqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9807

DQoNCk9uIDIxLzA5LzIwMjMgMDI6MzEsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOg0KPiBMb2Nh
bCB2YXJpYWJsZXMgc2hhZG93aW5nIG90aGVyIGxvY2FsIHZhcmlhYmxlcyBvciBwYXJhbWV0ZXJz
IG1ha2UgdGhlDQo+IGNvZGUgbmVlZGxlc3NseSBoYXJkIHRvIHVuZGVyc3RhbmQuICBUcmFja2Vk
IGRvd24gd2l0aCAtV3NoYWRvdz1sb2NhbC4NCj4gQ2xlYW4gdXA6IGRlbGV0ZSBpbm5lciBkZWNs
YXJhdGlvbnMgd2hlbiB0aGV5IGFyZSBhY3R1YWxseSByZWR1bmRhbnQsDQo+IGVsc2UgcmVuYW1l
IHZhcmlhYmxlcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hcmt1cyBBcm1icnVzdGVyIDxhcm1i
cnVAcmVkaGF0LmNvbT4NCj4gUmV2aWV3ZWQtYnk6IFBldGVyIFh1IDxwZXRlcnhAcmVkaGF0LmNv
bT4NCg0KUmV2aWV3ZWQtYnk6IExpIFpoaWppYW4gPGxpemhpamlhbkBmdWppdHN1LmNvbT4=

