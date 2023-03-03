Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 987F86AACD7
	for <lists+xen-devel@lfdr.de>; Sat,  4 Mar 2023 23:02:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505505.779572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYZwb-0001fx-8E; Sat, 04 Mar 2023 22:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505505.779572; Sat, 04 Mar 2023 22:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYZwa-0001UF-S1; Sat, 04 Mar 2023 22:01:32 +0000
Received: by outflank-mailman (input) for mailman id 505505;
 Fri, 03 Mar 2023 00:57:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yqmn=63=wdc.com=prvs=4197e97ac=wilfred.mallawa@srs-se1.protection.inumbo.net>)
 id 1pXtjh-0002jL-E2
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 00:57:25 +0000
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 590524f6-b95e-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 01:57:21 +0100 (CET)
Received: from mail-bn7nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.108])
 by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2023 08:57:15 +0800
Received: from BN6PR04MB0963.namprd04.prod.outlook.com (2603:10b6:405:43::35)
 by BYAPR04MB4934.namprd04.prod.outlook.com (2603:10b6:a03:4f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Fri, 3 Mar
 2023 00:57:12 +0000
Received: from BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb]) by BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb%7]) with mapi id 15.20.6156.018; Fri, 3 Mar 2023
 00:57:12 +0000
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
X-Inumbo-ID: 590524f6-b95e-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1677805040; x=1709341040;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=7S55+emyh6w2GLeLXGHxLfK4ojaE/gAciVDT5/byjX8=;
  b=R8cu9SRIiyHKrZKjRC7iDOn6XlRSfLBfIKbEFoP8PR16kw+ayVTZ/Z6q
   Js+C3I4HCZwiF6HIJIkx5SEWaVmd6FAtAaROciSW452QGP2FeBV8zDbnZ
   Bs3DfjqR6cC6GXeHgehe/kx0lUDe4wLajVj81W8uL7bu2GxR2usAJH782
   PoU+26C9L3yhMpIg8TvKX2ERwYzKw5Ck6zNYVtMhSqqTP4tzNU1t/DIA8
   wkM6PvySLaIwo6EcX3eUMrqyrKEJg/LLXzwzT24iMG/NyC/VJ6q+F7RVe
   oQlWaEsU4ikhhmePxq788q7QAwJpDnM5PTuOHSOvCLvOW9TLgcRHKHN9s
   g==;
X-IronPort-AV: E=Sophos;i="5.98,229,1673884800"; 
   d="scan'208";a="224463212"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTIMqf/0AhE8aj/Xm7CvSktjMviSpErEf7753fDE76PBKvPsspJHfMZ4jmysylxEnQvsutg/hKWvbaGN64O8bmyBi4E3k77hOB98asGnFWhf4xSVMaWKxz6NBRRFyM+ExQ0WOIZf9Ov49JcIWtqDBgj+Ai6UIGOVn9G+yJNxVl7Ua/eNCmi8d4CvUhby1FQxVrDJNLC7AqQ+zTg+l8J3vUyMf+sV0YFj+Il+cib8PkpG/uYJxMcqxz/zkCppuoaFpNAmGLn014rJCEBM93A36H/BwE4ywPKmz3do72U72UGfYPRPrY0m018HHh+HriZ1/UzG8+Q6J0v69KZNcmfIDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7S55+emyh6w2GLeLXGHxLfK4ojaE/gAciVDT5/byjX8=;
 b=naWMfxl71qoqyicDAQCSat8UX15B2iBo4q0wknl8qSVJx88ie/OMLLTD9RC7IIm/oEPVyi46di45I59iBUWWpmTSMitQEshi+xknMsXyoVJiLsfop7MPtJraYiqkgBZA2VXn+TEi0hfnATUOXFjXaXK+hj0ugYmyihtvJZcepHqTBsGip9G0nYp1axdwvzmbJ4+uWU0EdRH9o4ntRTEzbVhds97YZjIT93hZkMLX/cQvN+DXadDIijFetutwUnIH93MOITHo1KPo4/YYK0M8xJ9MoVdfupT9nvyWhMAJhYEE+RtphqgZlPZdzmaIXVl1GDiQ8GdAICLkuWRK2RLcbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7S55+emyh6w2GLeLXGHxLfK4ojaE/gAciVDT5/byjX8=;
 b=eXoX12sS/C55H1mq3Dhit3BGlbRTbelzdoIyQ3d9/8qqJFha04OMxctI4cc65oO2VlC0lkm79buXOEEHwStva85QxRhjdIXK+nECCWQ4Bk5tCEyp8x8JOy/1+MfeLQmNbCpSlSYLtICQUN7W6qNqYNVvu1hpCZI2RXmTYpTAMC4=
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "berrange@redhat.com" <berrange@redhat.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"thuth@redhat.com" <thuth@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
CC: "alex.bennee@linaro.org" <alex.bennee@linaro.org>, "armbru@redhat.com"
	<armbru@redhat.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"libvir-list@redhat.com" <libvir-list@redhat.com>, "reinoud@netbsd.org"
	<reinoud@netbsd.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>
Subject: Re: [PATCH v2 5/6] docs/about/deprecated: Deprecate 32-bit arm hosts
Thread-Topic: [PATCH v2 5/6] docs/about/deprecated: Deprecate 32-bit arm hosts
Thread-Index: AQHZTSSxnXLNs0Zv+UaZA/JKDWfIZ67oO+KA
Date: Fri, 3 Mar 2023 00:57:12 +0000
Message-ID: <bcd0821fdccd06fc0f3c084dc2ad77424f37655b.camel@wdc.com>
References: <20230302163106.465559-1-thuth@redhat.com>
	 <20230302163106.465559-6-thuth@redhat.com>
In-Reply-To: <20230302163106.465559-6-thuth@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR04MB0963:EE_|BYAPR04MB4934:EE_
x-ms-office365-filtering-correlation-id: 46394d25-9359-443b-ec1d-08db1b82393d
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 gGUfBJ6Sy+HVsK+SkIbgOb374BmvCTXKlO3CUVBSjIEru2I1zZ7bdWzfqKSspLF5UBa0tymAUW90KswUDY49mx3Qt2CqFbatFFiT+ptyfTUjHbTDgB1SACQZRD8jTPAU1qlAk3i+T+RuFZjweIORzb8M5nFBY/CpMgcsVrz8PQ4bzu415Oxq2tRrom4om6ZCATFJ1B5lWdazK4jiaB1LM1OyLlmOI4G0sbTsrhsvhAJBbVMJRRo3DIe/1XPUHpffLVMSjXy6rgmbcw+ysLi9hp5tSxvBXpm5hZllgOoJy/DkcfNAVBpBtkMWlLoSvNzfDeMbi/85x7cBBrgiCjzfwQIQJb6MQJgaqwhlWLnqvqG2mMLsNILfyqQtowDtR6QetYavK3XAFBVz9VcDnmCYxWqblzULnn4X1bSwEB95w35AIv/1W+dW59cWIBeoBWlML8V0M93iTRRPbi4OvCwSm0WpppEcNTPUE5sTxkUHzHsXziW4azaSi+qlACeWZfEmv7ua/7pOeelesihVyKsi2DhyVd+wbvviPddJftKJ/6tqnXfl24VkUjynWbzoYtF3cIzrn/XnnCOjnwl7Tp85QOurNg/3b9DzS0gpcsT/eUVBAxK0AZJOn3GimujgkcXqwsh7Mcvr5AY5JgAeDD4u0uDHW/YBQfvkeHmQ6Pz5pqzVthYhrN1VUWaltxRToGE94QioHSUzRD1pjp/2DrMziA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0963.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(451199018)(4326008)(86362001)(8936002)(36756003)(66946007)(41300700001)(66476007)(64756008)(7416002)(8676002)(66556008)(66446008)(2906002)(5660300002)(44832011)(82960400001)(38070700005)(122000001)(38100700002)(71200400001)(91956017)(478600001)(54906003)(6486002)(316002)(2616005)(76116006)(6512007)(110136005)(26005)(6506007)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WUpkeVR6R2JoZ3dUeW1DeFBxR0dWVmdIQlh5dzYwMVlLNmw2NCtzM1lHVFNa?=
 =?utf-8?B?MFpyZTlCTjBkZS8yUTVUWGY0QjNENXh5dHlzNUlGbHVNUzdSMVZ0d00vb1NF?=
 =?utf-8?B?QUZ6NTV4RElwTTZEWitUdXFEVmIvaW50aEI4eUhDWEpGK1hWZzRPVTlTbGdG?=
 =?utf-8?B?Nk1Gb1RUaVl1TzFKVkJ4T3B6Y216Q3Z4QVNBdCtxVm1nV3hjV1dmVER1WFZT?=
 =?utf-8?B?Vy9yQWpvd2R2dWtMREp1cDZ2ekJjZEZXTTJBZ3JnVlBBM05pZzBtcHFMcDZv?=
 =?utf-8?B?UUdjK0MvU21GdzFvZ1dSUEdvQVV4THd6RkZjK0FJdGV3TmFPZTdOem8ycDJI?=
 =?utf-8?B?TG8wWVpmc0RqMTNqTDF5bGp5c1huWXMraGNieS9xeityK2NNcU9mb2xBQmN6?=
 =?utf-8?B?Z1U5NytBaUJOQzVtSEh3Nmo4MTV4V0E2MzR6Wnp0QnBJcGZkdktPVE9oa1VB?=
 =?utf-8?B?SDU4M0duUndldDNpQkNkbGN3ajhjZlN4WG1KQlJ4SHUya3dvK1ZCems1SVdN?=
 =?utf-8?B?TzJlZjYrZCsvQkJIOXY4cVR4Wk84emFxR202R0o0WnJaQ3JEb3Z4S1BaWG92?=
 =?utf-8?B?ZHZYYW1HRmlOWDMwblNtTGx3clBvYlpPbGYrRDFqR3dvOFFsajJxUjFMOFJ0?=
 =?utf-8?B?NnNKMWlFV1lMMDFJcXc1M0cvaXduZEhxREU1YWVUQW5raFZHV21ibHg1MHNM?=
 =?utf-8?B?QnJKbEtPck5sSkhmLy9aWGk0VDdiaXFSRTdWeXZJMjN1b3R3UGNHUnc2K3Zj?=
 =?utf-8?B?bXVxcXh2SUE0RVl0bi9WMGZIWEl0TlpzSE1YTVpQbGVDRmRtRXZuSkNLSlpG?=
 =?utf-8?B?NDROZzQvQkR0UmFVaW5jbGs0aGpwZHpwNmR0NDFkb05uV2g4YnVmZi8wUktL?=
 =?utf-8?B?YzREcXg1ZjFuMFdTTk9JTk1qclN2R3ZzSVltKzR1dlNnSHJqRUdOUTZqb2s0?=
 =?utf-8?B?bkdMd0wxQjYvMmw5TWhhaXlRN1NLQTBEcVVoYmpzWXJ6aGdPekhDeHRZVWpY?=
 =?utf-8?B?TWlXRGZyTnJibjRpQ01OcFphSXlSWjNvWXdPdHg4VEtCeUtkUmpBbVZlMGFG?=
 =?utf-8?B?a0pvNERCSzJxdGFuTm1IaTdzVTBwZFEwaXp4UTNkNHFzTTJ4N1RFR25UVjRm?=
 =?utf-8?B?VC84aFJRM2tybGt5UGhyTFIxa042dFJ6YXdLY29QMnJ6K2YwZkloS2EwZ0JE?=
 =?utf-8?B?emtPY2gxZ0FPMHN1ZzB0Q3Qwbm9aemwxUGVNRGxRVXlHaG1yTkkvdkVjaHpB?=
 =?utf-8?B?YnFxRHpZTFpHbzlKdXBNV2g2ZXBxOFdEcHhIbVl4cnA0WjBzMkloOTRSM2lH?=
 =?utf-8?B?T2JkUE5XY2xVZDZIL0dBcC9jT3pGbGd4Ymt4cWVFdmgyYm5RZXk4WkNYL0N3?=
 =?utf-8?B?YS9Dalc3eU1FQlpic1pUeDg4TGxyV2VoZGhzeS8veVBjR2VFdFQ1dm5xQUY0?=
 =?utf-8?B?YUh4OFh0L0Zsck42ejhYd3I3Q3dZYmlJelA5TDhEZW5FbVg1bDZqdWVoVUJn?=
 =?utf-8?B?WDB4VUxieDhCdmFkY29zYnhpbXdwbDRVWkRnMjdwK0o3MDV4ckJrbDNhVEJt?=
 =?utf-8?B?ZEt2L20vUm5VV1NUOHQ0aUJRNjI5bjNhdnBaejhsS3k5MHBvVWNpRjN5ZEQ4?=
 =?utf-8?B?RExYOE9ldmNaeVVqRWxBUGhHMWIvS2FIcWNVelpIWGZ2Z3BKZ1NSNGJjMmFl?=
 =?utf-8?B?UThuajM0aXdRdVNMR1BnaWhxajJLRkVtbWpHZlVaTjhtRFBPVmR4alFMQ0Qv?=
 =?utf-8?B?ZjNVdEZMd1dvK2xTWG1aandZNWtMb3pINmZHaUNWZ2JIV3kyNFMwWER0WjZN?=
 =?utf-8?B?dGdHNGJjTUFDL3hpcmIwUnB0eHRxUFFsOFQvSWpkWVNjc3ZHZ0pkU25MT0dD?=
 =?utf-8?B?NTV2aXBRcWVlZUp0SkNYYlU4bHplQW5LTDI2ZjNoQmZ0aXJlYlgrOHNXUVNZ?=
 =?utf-8?B?ZmNpZ2xDUlFXYzVZWXRBOG5kcDJ0NWFSQW42Sndkd1luYWNoaVBFU0NSMmw1?=
 =?utf-8?B?RC80aFZDMmJScUJKSUxXWmVmbmFsMkRGRm81ejYvUkxobGFldjRsNkNFY08y?=
 =?utf-8?B?aWRTb3lKc3BCbW8rQkNEWTRqRGh6Y2dRWXRLU0g4em9BOVMySWhGaEdhVnEz?=
 =?utf-8?B?TE9jLzRmYXVkOWdJc1JHTWNyTmRFaFNPSWtMamVwZzJnS3N3U0I5YmlBc1hP?=
 =?utf-8?B?akE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <93564DB975D52B4EB14C0C0C43C38FC4@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	x7iZZBsKVwUyF45LJbRqK+VY5SlsFdF943TKr0CD8Jbi8FLKiVM2RT32915iikhAqBhQd6er8qI2mf4u5gKK2drHSsmJ+5z7N+UL4rilbugzzrUoXm2V0HuM/sfAx2/N1KkZ/yBATbUlZfqYnvpNnZ0yBOWWgAFIkpWUuXrVvAoMArlfSeHg+4gWb92jJ97z4tigNCknMKVQ6SePd9MIiIUsW0H7/3/e6nBIuZsI3L5j56gp8rGtuOEGULGDFRVfg1DHev8C0LxuTbUZfYzHYu00f8+AlkSlmpQfIaZ4LmAbkBMjCGSc8Nl6Qg3XfP3+/gEgVXFi1lyHBULoYNtP2+vetqrnmYWXKaY/tXXGE8KdrL6EbwMcKZKbolFhJ+rhPvVdcWdiwX46MnyAmW5nWQGxKBEl555aKbGlRObpMgVLBVsFEaplzzpS4leNMSw39m3rR9Vua5vjpRgP2n9ia7+l2+b91yF16qo9fPSU7UHJOHVHJv3h6ntnfQstaKAgSv/h12UJvt0UTeEinjRNq9GhhYUtNiqOkbFgCa02Yl4cRldaEaZBFRHOKDub0gcz0+r7t9sRT+RRQiEywhVGtj206GwYdTc2S96A+GRjqouOfv3jsljYaidAzKp2UE24aGjlcXqaJV5VSoXqNmy96lGs8KtxVquVq/oVTG0RXJIC5vYw/Zb79lvwPakwhIg9YKdFXJqGOlvDFFE0XP5it4HRxuh71gHTVaims5ZdgBRJa8Gxh3WzENe700FWja5sbaacEXB3rbZg73RtDN//+7OV/hVME3l334ekKCX2K1LztEtuL4tfD3D6mNoDXXPT9Ccnmx29takvU5BMox7IZr1hVE/HNJcrFq6ozfzbQdKVtslo7LqMj2jlquELLuelLJ38RegcLwbzsjv1RkdNau6nSPdmjFKoHnqzLlpGwos=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR04MB0963.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46394d25-9359-443b-ec1d-08db1b82393d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2023 00:57:12.2802
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7KYxgsr5usMIfI9wAXIbfvVeUBCxWZF2lkYqanloy7r7DKyBktLxtGhdrJAXDgep/ATmgJcvXAPeFkhbpvuPJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4934

T24gVGh1LCAyMDIzLTAzLTAyIGF0IDE3OjMxICswMTAwLCBUaG9tYXMgSHV0aCB3cm90ZToNCj4g
Rm9yIHJ1bm5pbmcgUUVNVSBpbiBzeXN0ZW0gZW11bGF0aW9uIG1vZGUsIHRoZSB1c2VyIG5lZWRz
IGEgcmF0aGVyDQo+IHN0cm9uZyBob3N0IHN5c3RlbSwgaS5lLiBub3Qgb25seSBhbiBlbWJlZGRl
ZCBsb3ctZnJlcXVlbmN5DQo+IGNvbnRyb2xsZXIuDQo+IEFsbCByZWNlbnQgYmVlZnkgYXJtIGhv
c3QgbWFjaGluZXMgc2hvdWxkIHN1cHBvcnQgNjQtYml0IG5vdywgaXQncw0KPiB1bmxpa2VseSB0
aGF0IGFueWJvZHkgaXMgc3RpbGwgc2VyaW91c2x5IHVzaW5nIFFFTVUgb24gYSAzMi1iaXQgYXJt
DQo+IENQVSwgc28gd2UgZGVwcmVjYXRlIHRoZSAzMi1iaXQgYXJtIGhvc3RzIGhlcmUgdG8gZmlu
YWxseSBzYXZlIHVzZQ0KPiBzb21lIHRpbWUgYW5kIHByZWNpb3VzIENJIG1pbnV0ZXMuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT4NCj4gLS0tDQo+
IMKgZG9jcy9hYm91dC9kZXByZWNhdGVkLnJzdCB8IDkgKysrKysrKysrDQo+IMKgMSBmaWxlIGNo
YW5nZWQsIDkgaW5zZXJ0aW9ucygrKQ0KUmV2aWV3ZWQtYnk6IFdpbGZyZWQgTWFsbGF3YSA8d2ls
ZnJlZC5tYWxsYXdhQHdkYy5jb20+DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZG9jcy9hYm91dC9kZXBy
ZWNhdGVkLnJzdCBiL2RvY3MvYWJvdXQvZGVwcmVjYXRlZC5yc3QNCj4gaW5kZXggMjFjZTcwYjVj
OS4uYzcxMTNhNzUxMCAxMDA2NDQNCj4gLS0tIGEvZG9jcy9hYm91dC9kZXByZWNhdGVkLnJzdA0K
PiArKysgYi9kb2NzL2Fib3V0L2RlcHJlY2F0ZWQucnN0DQo+IEBAIC0yMjksNiArMjI5LDE1IEBA
IGRpc2NvbnRpbnVlIGl0LiBTaW5jZSBhbGwgcmVjZW50IHg4NiBoYXJkd2FyZQ0KPiBmcm9tIHRo
ZSBwYXN0ID4xMCB5ZWFycw0KPiDCoGlzIGNhcGFibGUgb2YgdGhlIDY0LWJpdCB4ODYgZXh0ZW5z
aW9ucywgYSBjb3JyZXNwb25kaW5nIDY0LWJpdCBPUw0KPiDCoHNob3VsZCBiZSB1c2VkIGluc3Rl
YWQuDQo+IMKgDQo+ICtTeXN0ZW0gZW11bGF0aW9uIG9uIDMyLWJpdCBhcm0gaG9zdHMgKHNpbmNl
IDguMCkNCj4gKycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycn
Jw0KPiArDQo+ICtTaW5jZSBRRU1VIG5lZWRzIGEgc3Ryb25nIGhvc3QgbWFjaGluZSBmb3IgcnVu
bmluZyBmdWxsIHN5c3RlbQ0KPiBlbXVsYXRpb24sIGFuZA0KPiArYWxsIHJlY2VudCBwb3dlcmZ1
bCBhcm0gaG9zdHMgc3VwcG9ydCA2NC1iaXQsIHRoZSBRRU1VIHByb2plY3QNCj4gZGVwcmVjYXRl
cyB0aGUNCj4gK3N1cHBvcnQgZm9yIHJ1bm5pbmcgYW55IHN5c3RlbSBlbXVsYXRpb24gb24gMzIt
Yml0IGFybSBob3N0cyBpbg0KPiBnZW5lcmFsLiBVc2UNCj4gKzY0LWJpdCBhcm0gaG9zdHMgZm9y
IHN5c3RlbSBlbXVsYXRpb24gaW5zdGVhZC4gKE5vdGU6ICJ1c2VyIiBtb2RlDQo+IGVtdWxhdGlv
bg0KPiArY29udGludW91cyB0byBiZSBzdXBwb3J0ZWQgb24gMzItYml0IGFybSBob3N0cywgdG9v
KQ0KPiArDQo+IMKgDQo+IMKgUUVNVSBBUEkgKFFBUEkpIGV2ZW50cw0KPiDCoC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0NCg0K

