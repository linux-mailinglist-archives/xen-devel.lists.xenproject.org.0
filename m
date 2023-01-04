Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0EE65DC9C
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 20:16:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471391.731228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD9Eg-0005Jo-Iw; Wed, 04 Jan 2023 19:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471391.731228; Wed, 04 Jan 2023 19:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD9Eg-0005HG-Fx; Wed, 04 Jan 2023 19:15:38 +0000
Received: by outflank-mailman (input) for mailman id 471391;
 Wed, 04 Jan 2023 19:15:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tpAs=5B=citrix.com=prvs=3612a7559=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pD9Ee-0005HA-Gb
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 19:15:36 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 290561a0-8c64-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 20:15:35 +0100 (CET)
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jan 2023 14:15:24 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5423.namprd03.prod.outlook.com (2603:10b6:a03:28c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 19:15:16 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 19:15:16 +0000
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
X-Inumbo-ID: 290561a0-8c64-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672859735;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ES+kHXVNJkaJV81kDGifXMUJBPFcIwo0/HwQsQat0AE=;
  b=WNelfR7GPnBn1EPbkjRIgrAl4qehZTtd29k/1ArIpo0PnAGlMFfGZoZU
   vvRRHhWFHVBqoEzngkBk6Pmr6e95nBP4Jpqhep9yHL9TustBjdoIgCCnQ
   ogvv1gy4Tktfjs6ryAz72HdAHHO9Wp4d4R9w6t/hA8Msysa4WfsdFoS9T
   s=;
X-IronPort-RemoteIP: 104.47.57.172
X-IronPort-MID: 90682189
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1sxPZ6wvRxZNrVaCJGF6t+f9xyrEfRIJ4+MujC+fZmUNrF6WrkVSm
 moZCjiCbP7ZZ2P3LdEnPtix9E8DvJSBzt5lHgVqpSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5QRnPawT4DcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KSIXq
 9lbBzsnVUykpvyH4qmZRc5AhMt2eaEHPKtH0p1h5RfwKK9/BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjeVlVMruFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuqANxCTuTop5aGhnXJlmZPLBIKWWCwitDnuGyneNN1d
 k0br39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLP+BqQDGUASj9HafQludUwSDhs0
 UWG9/v2ARR/vbvTTmiSnp+WsDezNC49PWIEIygeQmMt89Tl5Y0+kB/LZtJiC7KuyM34Hynqx
 DKHpzR4gK8c5fPnzI2+9FHDxj6p+J7AS1ds4h2NBz3/qARkeISieoqkr0DB6upNJ5qYSV/Hu
 2UYn8+Z76YFCpTleDGxfdjh1YqBv56tWAAwS3Y0d3X931xBI0KeQL0=
IronPort-HdrOrdr: A9a23:CfHTEq1Oiy4b5QOZft5SKwqjBKMkLtp133Aq2lEZdPU1SKGlfq
 WV954mPHDP6Ar5J0tQ++xoVJPufZq+z/JICOsqTNSftWDd0QOVxepZjLcKrQePJ8T2zJ856Z
 td
X-IronPort-AV: E=Sophos;i="5.96,300,1665460800"; 
   d="scan'208";a="90682189"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VbkJ81F2guUFQ+9R/QitJS11I7xkpRJAbQ8Jwn2JKbVPUdy6VX7VzQ5BXQByDGlU226PUFXp94fhTGhSaDmVY/7Z3tF5GLQaRu+ciAKRA468IZD/9tsxOkOsy+lIkebLks5kL4c45lPuOGnvlatiqEBGQy75vwLGImN07qWlOG/QoBgC+xJf1LRzTDyQKsHC4kKSiVQeT3GnijDQODytrUiaB0QywknZrVGR3q0cT3YSbjjacH8074kGVm1nZVIiMPCHnBwIs14CRXEfqiYkZC2sGvXTd+S6KC0oTlqtYLBcx5qXuue+kdB8xZWLUArSt/c9q0ZAQTj8t7MyvBeB8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ES+kHXVNJkaJV81kDGifXMUJBPFcIwo0/HwQsQat0AE=;
 b=UgC4XwWw58TJrRl0Yi2lbOQQDvtskvPKjka/7lktz2ULs74S64CXKuu7oEjsMeAk68A62KfIfdJLFkSAa/M0CYWlStdiybN49eQ9rGNzVd+yrE1BgZoxFqoMo5CXmwl0q7JQawT6dlccMecfB8q4LxFAgLc44W4zIZz8VBocKdWfJokdWcbZmoIFyi3VwfAScAtQ0WPGlTIgJi/hOOmiWljiiHSHhv1lCpmZilmu9j4MvDHvBt82hQAZXfg0dsNqvSEISfD9H9fjguX8U+2Pkp8237N7G4y3EhvG+bTRLvdgC9gT9Tf90YKFJanK34RN14EnpT1psLCuVBG63CL3Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ES+kHXVNJkaJV81kDGifXMUJBPFcIwo0/HwQsQat0AE=;
 b=Ui+GYpNj2ewOOFdUmzktB3KSlfnIIvzI2O5VXXLKV3FD3I2x5RQ3MPW2n12HIR1hCJyliq8nXOWg3ib68Bk9YsfSFM5+6ySD8sf5bXq0grxNYOOzAbEejKTtFmEI2PRWylDUG2woWCl8OesJ9GPTNiEQS6QooSbRqO9A/yT3jW0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/4] xen/version: Drop compat/kernel.c
Thread-Topic: [PATCH 2/4] xen/version: Drop compat/kernel.c
Thread-Index: AQHZH69b2rEsPPoAl0SiHrhvZ3gYIK6Oc/AAgAAucYA=
Date: Wed, 4 Jan 2023 19:15:15 +0000
Message-ID: <c67509bf-b5e0-5364-9307-5432f5417ce5@citrix.com>
References: <20230103200943.5801-1-andrew.cooper3@citrix.com>
 <20230103200943.5801-3-andrew.cooper3@citrix.com>
 <074042f5-ecc1-11c9-bdcd-b9d619475d58@suse.com>
In-Reply-To: <074042f5-ecc1-11c9-bdcd-b9d619475d58@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5423:EE_
x-ms-office365-filtering-correlation-id: 9e38970d-5cbc-4f84-d7d8-08daee8802f8
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 wa8cPpSWkVRdQGIKDEKzyo//wjwv5VcoXFgePCyIPoo2WYZVpgST/XKO2VxACD0g9Vv2phbYAh8hOO8LPHqr3LjjVQoXLvz340KIE/zlVU0pZyNUJPIq3jvIOOTvp1TjDFlhcaapJIxtBuJszWzI6c7GpfAyuHHtMnD9KYKIOqV7jQ++XmsF7qxi8ocjAfUpO9e/DaBcA/asmOe9s8JadVvP4j+rZHrySZJpsGd74EoFpNs6F6fYyo6uovoJUHJWQ+hkqSFFjIe6Fb8KCGGHakNcN5BONNbDNNDoSl2grv9YTJiHgKWtwA3RuLaKmTedSqN6KsWg8NBh9OVgTylMZG1cO83wUyYHsVVhf/Jff/1U8LBnXiS3k0YoH0c07BcR2uVoprekg52qyX6GJTezazqeGgxEVmjAVm650TV25pu2TG0u5h5Ay1ccTG4pPycm6svcyPLSgXd2dbLzFXS14ZKX/pfLd3yqu4u9p+ukLNzPGU9nhSit61qQHpUqS6pyxQ9Y8aiI2IcDLKXmd5prNC5rJzV1FDfIViWvkrijYgqF8cwQA6Gdx9EpowhQo5FxoYCNJvXWUMVRKkI4/USXligU9FfFrYfE81n2fwXe6r467z62PfddhsP5tkmXll+tYw0EgoUnnJhtK08SaSqrlkqpcZujNHJG1y97WvLZIvm0VdC01+wyrvHwTKVM4pLmdrq60Y+rKg5QZNto0X55pkZKwFz/rVgxqhq31TI0Ro9OnUrZY/Se4iquK3c0AePhdpeObBh0rWQiHaaKTUIjmA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(451199015)(5660300002)(2906002)(8936002)(8676002)(4326008)(31686004)(41300700001)(66556008)(54906003)(316002)(66946007)(76116006)(64756008)(6916009)(91956017)(66446008)(6486002)(478600001)(71200400001)(66476007)(2616005)(53546011)(6506007)(186003)(6512007)(26005)(83380400001)(122000001)(38100700002)(82960400001)(38070700005)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dEl2bFhMcTRldXFoVExGcmZkRHQxZy9pUVV1aDQ5WldVaHhMcGdrMVV5cjdh?=
 =?utf-8?B?QkZ2VGpnek1md1NNL3ZYRnJPQWF2ck0xTXBxUFQ4TmdHdzNwZmNPbks3NVRs?=
 =?utf-8?B?MkkydnhhTGVVWXhURE12eVVmWitJbkpma0g3K2dRNXRvMHFYVDZRYkhPUzI2?=
 =?utf-8?B?UzVNYW5TVWpDSWRXT2RnVmpmQU51SWJEOU9Tc0dYZnkyZi9sVDBqSGpsZUQr?=
 =?utf-8?B?aS9HUlhBK3Y5ejJCTWJ6TmUvYnQzbUZiaEhWQlloNW52c2RJRzdHSHZyaC94?=
 =?utf-8?B?T0hOMDA1MXFtb0lCMVJZdCsxWUJzSENVMTdIaXlzSUNJQnpoQXNEOGlnRUtx?=
 =?utf-8?B?VWZJZUNPaHArcDZSTVFXZXNTamhmekQ0LzBhZmt1M0h3UUEvTmh2QTJEcVJn?=
 =?utf-8?B?c2EraEFpaG9Zcy9YSzhwcmNxRkxwRDZyakI4VWF5bldkVk9obXFwQ2Nwc2dm?=
 =?utf-8?B?RzNKVWtVK2FxL01VQ3gxb2ZYWTY0NmZBT3c4cGRlRzFVV2QvNXlkL3dVaGV6?=
 =?utf-8?B?d2ZpbkgxSG91d0pGcmYvaFBhSzM5aUdUSWlEempaZkcvUmVxL3JyL0pzTkNX?=
 =?utf-8?B?RDZ6ZFo1OTZlVUpzUkFXNndSRkQvREJuYmJXQS9uQlRMK3FOYUN2SVd2UzRy?=
 =?utf-8?B?R0hPaFo5ZVNxTGNKSXA5Mkd1cEdOVExJQ0kzUTNsYVlKREd4RFdTTTY3dUtC?=
 =?utf-8?B?bU95NnkxQlBZNXFKRTc2a3h0ZUtxVjlPV0lhWEw5MHpESzc4OEZTOTVvdGhl?=
 =?utf-8?B?aEhuUlVBVWVOeHY4RkxlT1pOUWZmRmxGcHN0UTZZalJmYThpQzJ0aU5lSVJF?=
 =?utf-8?B?THM5NU5RVlpSQkZ0c21mMis5Wnp5aFVnSVluK0cxcGd0L0pvam9wanVuSjhL?=
 =?utf-8?B?YnprMldRakJzTlVHR1J3djJaZUZ1Y3RjZmovc1RUdDhZeGJRZnluNUQ3R2ZJ?=
 =?utf-8?B?R3E4VUZmc3ZhcDFaWWZCSXR5L2NKeHR0U2IvbUpjYXQ1TDVZWW1PdjhtWFV2?=
 =?utf-8?B?Nit1MVQ1Q0RTeURRV3U0aWFsNzBDYmh6YXF4NTRDaWRzME5XY3EzbDUwY3Vx?=
 =?utf-8?B?bzVpTmRuQUFhYXF5elQyd3cyMGVYZzJtbUpWSE1MTlVhT0tlUDhiQ3NQdCto?=
 =?utf-8?B?cUZraENRaEFGQzA4V2E0T0NVK3QyYndjZU1HenpFVW03L0xpaXVjYXJZYnBr?=
 =?utf-8?B?VTkrZElaZWxGaGJPME9MRGhUdCt2RlZmQldXdDRMQjduZkRWYUl5WWdGd1VT?=
 =?utf-8?B?VEQ1SFdGbkVNUjJ3U0pzR1ZrakVDcmJPUlZ6SFppZEZtYlI2LzBvZGoxQkxL?=
 =?utf-8?B?T3RUdndxRHN3cDNhekZaanh3SDB3TTNNdmJuL0I0V2pyL3lzMWZyVEFlczBr?=
 =?utf-8?B?K3B6d1dvN1U0WUw1Qm5IOXlsZnB5YkpuajljeWxneFk1WnBscCsvQUdJRnFQ?=
 =?utf-8?B?eGdzMFhwcEZCanB5TDY5ZHY2bXlFRmNvbTQ4aTFTcHR0dDZNYnkxaE8zZFFz?=
 =?utf-8?B?UWNxdEltUWVrd2hST0RaT2xVSnpmWXRpYmNTN0FLUjI0OWhtSjFiQ0UyTkdX?=
 =?utf-8?B?S1U3R09kWko3QnJITUNVbWxqeTl5U3RQcHkvakkxdEZpZ3lweWRlVDI2ejBP?=
 =?utf-8?B?MHpoL0pncENwMml2YkNjSStVN1IrZFRVUGYyVEc3cTd5djQ1Vi90MVUxOGp1?=
 =?utf-8?B?MHNvSlU0cEp1SVp2b05ESm1hTzJpcnh6YWRGZVdyV3NkVkgxb0FhdTUybGpW?=
 =?utf-8?B?VjIxZTBxd2wxSlhDekJnVUVnWVhBbzM4SSt3alZxdVFRZDFwUCtMTHY3d2dH?=
 =?utf-8?B?bmEycnZUWVViT1FDOGZBbldjbE9LeGhRSmFjQ090NEo0TW9tSVdzemFBYmFN?=
 =?utf-8?B?OW8va3ZtNXdOSFM0UTBhSlFrUFlOTFNIV2liUzluREFWQVhkQnpXSWpnbEJm?=
 =?utf-8?B?THYwa09lNTIzMmtucHdHSE5tZ1ptalpVS2JsVll0T2w1TjJ4RExYZS8zS2ZC?=
 =?utf-8?B?bm50aUcveGZBb0hnMGhFdytFbER5ZlhQUHhsUEkvaE5QenFScUM4cmNwSWxO?=
 =?utf-8?B?ZzlmTWpYZzFWKzFrK0hkVXU2QXQvTEx5anhpeHYrZnJXbXVrMzBwUUplM0Fv?=
 =?utf-8?B?NkZWcDVFK3NwQ3ZHcjNIWm1YeWJjRlpOQzR6UkNPeXFRRVRwbGRnc0REMmh5?=
 =?utf-8?B?TUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <13739C70CA4FD642898371BD8B097636@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZkQnKcX4CgEUtA9dnFwEVhh+xG+FURvVZkIu35Bghaolde8jnz1pC+eV1fZJ/CLgM7n0PVIv5a6+r2Rg0lVrtaaUApgoagyO6fKdfG3wXJ/TepiAMSOXbGX9HzUZraVe8lrqxm50eoZUPGdL4aR0vs+ZsrwojcNBi8MYK+scldkfgFpoy58D8M7ANOwqvZBsp9HhBB6W48y2RzjD0hhDK335RbP0vCgsnsDat3+qkeFKniHs+BfJGE8bWkqzhhKKYPpwKo3Nw+SYiVwHRP1lt/6/+t8uj9uHKLzsLXHhNyE6vPme1L4WxjqdPUb6UKN6YHf4fhtwMQSHANQfgl7q9mdNlUB+us+pxzgzVUhm0yU8tVUjdWHTHSd3AtVKlWxGb9mzBwTOA2G3qrHhsPukJ8E1273Au9uRE6fQP+0cw31gwfV8pl+q5MfWxRklnT0PsL1jbg5h7gB68dEaQe+hFENvSfWjy3TpSO6Oq1ohd85tIvwlHSbWDmbAH46ihcYG7AzdIE6Nra15ESBcUwl0qVwP6xO0b89W641JlRsuDKZlYbFcQBqI+j9RePMStDi2FPN99kPnabE3wLtpOW2cxQ+RtUtCFpCnYRqVL/6zePSk6TXenYviAiZfwAbv58KGDy6PKIuDlW1QpZ4aI71WOcaCovuIzoKDEVcYBpNPzkKEbQvLXddpNE6BXc4qvvyayticTXF/tz0LKIrFsJKA0yxgoCV/3H+XgWXca9wwDo1p73SmmSdq+3ZVzRUIJKrAHLNvqgCDFzcUVSSjw6jcMDonnFyEliSM4xRKwRmbJV7FG8Xbh8K6dG2FvOHchVqcvZJe3HP2V8D8dvMfwDtcvaou+bacJFWeyNEBzmQgQFOdxaSwWxJS3+lH6f0nPxo1
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e38970d-5cbc-4f84-d7d8-08daee8802f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2023 19:15:15.9015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 28EeK6JdHutwXbrLmgxixL6uibIH7zGTH1d19uxJ7x/aRSOzU9+OfBe70avVkcIH/bvm7bfShToag/7xdTZbNevvqBaZ17JF+x3lYSmJyP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5423

T24gMDQvMDEvMjAyMyA0OjI5IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDMuMDEuMjAy
MyAyMTowOSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IGtlcm5lbC5jIGlzIG1vc3RseSBpbiBh
biAjaWZuZGVmIENPTVBBVCBndWFyZCwgYmVjYXVzZSBjb21wYXQva2VybmVsLmMNCj4+IHJlaW5j
bHVkZXMga2VybmVsLmMgdG8gcmVjb21waWxlIHhlbl92ZXJzaW9uKCkgaW4gYSBjb21wYXQgZm9y
bS4NCj4+DQo+PiBIb3dldmVyLCB0aGUgeGVuX3ZlcnNpb24gaHlwZXJjYWxsIGlzIGFsbW9zdCBn
dWVzdC1BQkktYWdub3N0aWM7IG9ubHkNCj4+IFhFTlZFUl9wbGF0Zm9ybV9wYXJhbWV0ZXJzIGhh
cyBhIGNvbXBhdCBzcGxpdC4gIEhhbmRsZSB0aGlzIGxvY2FsbHksIGFuZCBkbw0KPj4gYXdheSB3
aXRoIHRoZSByZWluY2x1ZGUgZW50aXJlbHkuDQo+IEFuZCB3ZSBoZW5jZWZvcnRoIG1lYW4gdG8g
bm90IGludHJvZHVjZSBhbnkgaW50ZXJmYWNlIHN0cnVjdHVyZXMgaGVyZQ0KPiB3aGljaCB3b3Vs
ZCByZXF1aXJlIHRyYW5zbGF0aW9uIChvciB3ZSdyZSB3aWxsaW5nIHRvIGFjY2VwdCB0aGUgY2x1
dHRlcg0KPiBvZiBoYW5kbGluZyB0aG9zZSAibG9jYWxseSIgYXMgd2VsbCkuIEZpbmUgd2l0aCBt
ZSwganVzdCB3YW50aW5nIHRvDQo+IG1lbnRpb24gaXQuDQoNClN1cmUgLSBJJ2xsIHB1dCBhIG5v
dGUgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLg0KDQpJbiBnZW5lcmFsLCB3ZSBkb24ndCB3YW50IGd1
ZXN0LXZhcmlhbnQgaW50ZXJmYWNlcy4NCg0KPg0KPj4gLS0tIGEveGVuL2NvbW1vbi9jb21wYXQv
a2VybmVsLmMNCj4+ICsrKyAvZGV2L251bGwNCj4+IEBAIC0xLDUzICswLDAgQEANCj4+IC0vKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqDQo+PiAtICoga2VybmVsLmMNCj4+IC0gKi8NCj4+IC0NCj4+IC1F
TUlUX0ZJTEU7DQo+PiAtDQo+PiAtI2luY2x1ZGUgPHhlbi9pbml0Lmg+DQo+PiAtI2luY2x1ZGUg
PHhlbi9saWIuaD4NCj4+IC0jaW5jbHVkZSA8eGVuL2Vycm5vLmg+DQo+PiAtI2luY2x1ZGUgPHhl
bi92ZXJzaW9uLmg+DQo+PiAtI2luY2x1ZGUgPHhlbi9zY2hlZC5oPg0KPj4gLSNpbmNsdWRlIDx4
ZW4vZ3Vlc3RfYWNjZXNzLmg+DQo+PiAtI2luY2x1ZGUgPGFzbS9jdXJyZW50Lmg+DQo+PiAtI2lu
Y2x1ZGUgPGNvbXBhdC94ZW4uaD4NCj4+IC0jaW5jbHVkZSA8Y29tcGF0L3ZlcnNpb24uaD4NCj4+
IC0NCj4+IC1leHRlcm4geGVuX2NvbW1hbmRsaW5lX3Qgc2F2ZWRfY21kbGluZTsNCj4+IC0NCj4+
IC0jZGVmaW5lIHhlbl9leHRyYXZlcnNpb24gY29tcGF0X2V4dHJhdmVyc2lvbg0KPj4gLSNkZWZp
bmUgeGVuX2V4dHJhdmVyc2lvbl90IGNvbXBhdF9leHRyYXZlcnNpb25fdA0KPj4gLQ0KPj4gLSNk
ZWZpbmUgeGVuX2NvbXBpbGVfaW5mbyBjb21wYXRfY29tcGlsZV9pbmZvDQo+PiAtI2RlZmluZSB4
ZW5fY29tcGlsZV9pbmZvX3QgY29tcGF0X2NvbXBpbGVfaW5mb190DQo+PiAtDQo+PiAtQ0hFQ0tf
VFlQRShjYXBhYmlsaXRpZXNfaW5mbyk7DQo+IFRoaXMgYW5kIC4uLg0KPg0KPj4gLSNkZWZpbmUg
eGVuX3BsYXRmb3JtX3BhcmFtZXRlcnMgY29tcGF0X3BsYXRmb3JtX3BhcmFtZXRlcnMNCj4+IC0j
ZGVmaW5lIHhlbl9wbGF0Zm9ybV9wYXJhbWV0ZXJzX3QgY29tcGF0X3BsYXRmb3JtX3BhcmFtZXRl
cnNfdA0KPj4gLSN1bmRlZiBIWVBFUlZJU09SX1ZJUlRfU1RBUlQNCj4+IC0jZGVmaW5lIEhZUEVS
VklTT1JfVklSVF9TVEFSVCBIWVBFUlZJU09SX0NPTVBBVF9WSVJUX1NUQVJUKGN1cnJlbnQtPmRv
bWFpbikNCj4+IC0NCj4+IC0jZGVmaW5lIHhlbl9jaGFuZ2VzZXRfaW5mbyBjb21wYXRfY2hhbmdl
c2V0X2luZm8NCj4+IC0jZGVmaW5lIHhlbl9jaGFuZ2VzZXRfaW5mb190IGNvbXBhdF9jaGFuZ2Vz
ZXRfaW5mb190DQo+PiAtDQo+PiAtI2RlZmluZSB4ZW5fZmVhdHVyZV9pbmZvIGNvbXBhdF9mZWF0
dXJlX2luZm8NCj4+IC0jZGVmaW5lIHhlbl9mZWF0dXJlX2luZm9fdCBjb21wYXRfZmVhdHVyZV9p
bmZvX3QNCj4+IC0NCj4+IC1DSEVDS19UWVBFKGRvbWFpbl9oYW5kbGUpOw0KPiAuLi4gdGhpcyBn
byBhd2F5IHdpdGhvdXQgYW55IHJlcGxhY2VtZW50LiBDb25zaWRlcmluZyB0aGV5J3JlIGJvdGgN
Cj4gY2hhcltdLCB0aGF0J3MgcHJvYmFibHkgZmluZSwgYnV0IGNvdWxkIGRvIHdpdGggbWVudGlv
bmluZyBpbiB0aGUNCj4gZGVzY3JpcHRpb24uDQoNCkkgZGlkIGFjdHVhbGx5IG1lYW4gdG8gYXNr
IGFib3V0IHRoZXNlIHR3bywgYmVjYXVzZSB0aGV5J3JlIGluY29tcGxldGUNCmFscmVhZHkuDQoN
CldoeSBkbyB3ZSBDSEVDS19UWVBFKGNhcGFiaWxpdGllc19pbmZvKSBidXQgZGVmaW5lIGlkZW50
aXR5IGFsaWFzZXMgZm9yDQpjb21wYXRfZXh0cmF2ZXJzaW9uIChhbW9uZ3N0IG90aGVycykgPw0K
DQpJcyB0aGVyZSBldmVuIGEgcG9pbnQgZm9yIGhhdmluZyBhIGNvbXBhdCBhbGlhcyBvZiBhIGNo
YXIgYXJyYXk/DQoNCkknbSB0ZW1wdGVkIHRvIGp1c3QgZHJvcCB0aGVtLsKgIEkgZG9uJ3QgdGhp
bmsgdGhlIGNoZWNrIGRvZXMgYW55dGhpbmcNCnVzZWZ1bCBmb3IgdXMuDQoNCj4+IEBAIC01MjAs
MTIgKzUxOCwyNyBAQCBETyh4ZW5fdmVyc2lvbikoaW50IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9Q
QVJBTSh2b2lkKSBhcmcpDQo+PiAgICAgIA0KPj4gICAgICBjYXNlIFhFTlZFUl9wbGF0Zm9ybV9w
YXJhbWV0ZXJzOg0KPj4gICAgICB7DQo+PiAtICAgICAgICB4ZW5fcGxhdGZvcm1fcGFyYW1ldGVy
c190IHBhcmFtcyA9IHsNCj4+IC0gICAgICAgICAgICAudmlydF9zdGFydCA9IEhZUEVSVklTT1Jf
VklSVF9TVEFSVA0KPj4gLSAgICAgICAgfTsNCj4gV2l0aCB0aGlzIGdvbmUgdGhlIG9kZGx5IChi
dXQgaW50ZW50aW9uYWxseSkgcGxhY2VkIGJyYWNlcyBjYW4gdGhlbg0KPiBhbHNvIGdvIGF3YXku
DQoNCkluIGxpZ2h0IG9mIGhvdyBwYXRjaCAzIGVuZGVkIHVwLCBJIHdhcyBjb25zaWRlcmluZyBw
dWxsaW5nIGN1cnIgb3V0DQppbnRvIGEgdmFyaWFibGUuDQoNCj4gUHJlZmVyYWJseSB3aXRoIHRo
ZXNlIG1pbm9yIGFkanVzdG1lbnRzDQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQoNClRoYW5rcywNCg0KfkFuZHJldw0K

