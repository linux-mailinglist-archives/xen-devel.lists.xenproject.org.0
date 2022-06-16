Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E4754E1AB
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jun 2022 15:16:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350610.577053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1pLN-0004U1-NB; Thu, 16 Jun 2022 13:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350610.577053; Thu, 16 Jun 2022 13:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1pLN-0004S6-Jw; Thu, 16 Jun 2022 13:15:29 +0000
Received: by outflank-mailman (input) for mailman id 350610;
 Thu, 16 Jun 2022 13:15:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/DUN=WX=citrix.com=prvs=1590248a2=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1o1pLK-0004S0-QA
 for xen-devel@lists.xenproject.org; Thu, 16 Jun 2022 13:15:27 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60a303d8-ed76-11ec-bd2c-47488cf2e6aa;
 Thu, 16 Jun 2022 15:15:24 +0200 (CEST)
Received: from mail-mw2nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2022 09:15:09 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5412.namprd03.prod.outlook.com (2603:10b6:208:291::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Thu, 16 Jun
 2022 13:15:07 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb%5]) with mapi id 15.20.5332.022; Thu, 16 Jun 2022
 13:15:06 +0000
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
X-Inumbo-ID: 60a303d8-ed76-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655385324;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Osk/NGbZYRC8vKOnyqsekoVPNNLahBQA+xrGSIBX7eg=;
  b=gWkX5rLZHYJ3okfMLpkvc4Zj/NdWCdEDttUwrkq0qLubEHbwAUaSKeDx
   i08J23Pw698uXf9cK5l7q7TgBR56VJXUhaMeR40lhWejXpuKH7SEt6jzx
   QkgKGnlasOiIowUKBCUEL3xBgXj6EA1iPW5IOPW9lGIPRcvgVrahd6tgG
   s=;
X-IronPort-RemoteIP: 104.47.55.106
X-IronPort-MID: 73099298
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:3ekgMKi2ewT7zs+NGEWALYlwX161ExEKZh0ujC45NGQN5FlHY01je
 htvDzqOP66Mamv2LdwgPIWzoU5Q7cXSyNVmSQc/qSk2Qi0b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXVrT4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQEAH6n0hfgkbxYbPRt0DIxj5ufnJnfq5KR/z2WeG5ft69NHKRhueKgnoKNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuIIehW9u7ixNNa+2i
 84xQDxjdhnfJTZIPU8aEskWl+a0nHjvNTZfrTp5oIJouDCCnVYggNABNvLwUYOwd556nHyav
 3L/+D77Hxg/b8W2nG/tHnWEw7WncTnAcIAYGaC89/VqqEaO3WFVAxoTPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslgEYc8pdFas98g7l90bPywOQB2xBSyEbbtUj7ZcyXWZzj
 gHPmM71DztytrHTUWia6rqfsTK1P24SMHMGYigHCwAC5rEPvb0Os/4Gdf47eIbdszE/MWuYL
 +yixMTmu4gusA==
IronPort-HdrOrdr: A9a23:nWONkqhXQD7ZlRvYtLgemzG85nBQX4N23DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICRF4B8bvYOCUghrTEGgE1/qs/9SAIVyyygc578
 tdmsdFebrN5DRB7PoSpTPIa+rIo+P3vpxA592uqUuFJDsCA84P0+46MHfjLqQcfnglOXNNLu
 v52iMxnUvERZ14VKSGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3z8FOgk/gYsKwC
 zgqUjU96+ju/a0xlv3zGnI9albn9Pn159qGNGMsM4IMT/h4zzYJ7iJGofy/gzdktvfrGrCo+
 O85CvI+P4DrU85S1vF5CcFHTOQiQrGpUWSkWNwykGT3PARDAhKd/apw7gpMycxonBQwu2Vms
 hwrh2knosSAhXakCvn4d/UExlsi0qvuHIn1fUelnpFTOIlGfdsRKEkjTVo+a07bWvHAUEcYZ
 tTJdCZ4OwTfUKRbnjfsGUqyNuwXm4rFhPDRkQZoMSa3zVfgXg8liIjtYYit2ZF8Ih4R4hP5u
 zCPKgtnLZSTtUOZaY4AOsaW8O4BmHEXBqJOmOPJlbsEr0BJhv22tXKyaRw4PvvdI0DzZM0lp
 iEWFREtXQqc0arEsGK1I0jyGG7fIx8Z0WY9ihz3ekIhlSnfsubDcSqciFcr+Kw5/MCH8bcR/
 G/fJpLHv6LFxqaJbp0
X-IronPort-AV: E=Sophos;i="5.91,305,1647316800"; 
   d="scan'208";a="73099298"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVOerus9TKDPXhnuJSJEBFk30CIaK0BZKJR1kkdrB3LSa9nnuLyDUfU2L6K2zPj/OQhrS/HmmBSjtgJVKD5zYHledSGOwH6IJbgfyigCp0ruKDYvZaSM6yhRgGNc500lKwZLV66mFPzjaF5IV16C4WDb4qhi5Te3cFl2yi17qWi10t6FtrlSvAZ14RNpk7xch9dnvh650nTV59ldCFMNMXms/H7tALsp+LmI1aFuleX2PHGxuYTyFcu4GA1FYVtQAdhlN/F5KymySL+kwuVDDNJApjgucOZ0MJyXEQ8K/mQDBANJvr7afyZroBVh+o/mjG6q0CC2Dx+05qKa8a1Yiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Osk/NGbZYRC8vKOnyqsekoVPNNLahBQA+xrGSIBX7eg=;
 b=hu7b8beT3o5akIG3WPXE3Q+gWxnXiNgi7zyXj/I41CXHVydzCWNqsG3+cQt+6F5sMJxFKFL8unGO/gZtGdn1B/jrfTnlts0PEcko8z8uVIO4lNinTpttmb7ui0x5Cl37/dyoU1ftNqOd+iOLfJhNqwuI/bc65Ko+EvATM+mP9yluX1zxFLtc7WXgJt1KURAFrQBcec/usK6lWxABJuaHZuSjArzQexlbVwPPXo+ZyVVy2kr9xM5TUa85cAVjkcEESncqfKh5W3YshxZaORfoa7G9xxLPPgjk4DtOD/tq6AeJ54x5UGOnLKgFHXmJArfWqWKjwByw0EpWNoCk0s+foA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Osk/NGbZYRC8vKOnyqsekoVPNNLahBQA+xrGSIBX7eg=;
 b=FS7ETvyWZ0K0quTNoT7pvZN4UrgCCzJCzLGzn992EBcjDwnHtbxVUikTdx3EpsJ+iH/VvLDx4EpRvKHLTMuq7F7lvt1fUJsJqKdmaD5okU1OC5nKn0PrNGnSbJom4snDrJ2GaClmfZUYDp3QFJTi2Ju0OwvDL4Y/92NEpx8rodE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] x86emul/test: improve failure location identification for
 FMA sub-test
Thread-Topic: [PATCH] x86emul/test: improve failure location identification
 for FMA sub-test
Thread-Index: AQHYgAhN5vfsYbvhOUu6F7yjqbmrJK1SBiAA
Date: Thu, 16 Jun 2022 13:15:06 +0000
Message-ID: <4193f0db-b75d-0eab-209c-49c6db787e3d@citrix.com>
References: <ce7d7acf-9ed2-9dcc-34ad-f9b1e3f77d4f@suse.com>
In-Reply-To: <ce7d7acf-9ed2-9dcc-34ad-f9b1e3f77d4f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75e21b63-40fb-4c6e-a02c-08da4f9a3b86
x-ms-traffictypediagnostic: BLAPR03MB5412:EE_
x-microsoft-antispam-prvs:
 <BLAPR03MB5412DDF05AE5B70689F73D44BAAC9@BLAPR03MB5412.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 cGmD1pQplpW+0fjWXXRY1NY7sfhY31g7Qg0HoyXBnLFP7oDqz9FOswYuH8vxXUkMPKRwVkWQ/ZFnPzF1ccgDexm7saFNL3Erhpp7UOumUc/aaegY3zS12IpglCWWUoFz6x3Mk1vtANygzJPTWGpWdbdxXDqR+n7Ci0vtk5a7B5ZduzARAVunGqKxJHBkAG0LDrZsMSQtWBLeajUB3VM8YZg5uLBcQS0uxeNi6fx7pwajXwgqoZ8ZWvQqwMYQV9ant7lrIYWO3Vf9Dl8/R1aG+UhUBBw93CRjkPZjq3oB9jNoknTSJU2DcIhLlki3a/cpkARPMu1lZpxBLHf0jE4MvFBo2ukLHDGHJkhfSPgBnT7x+ggxghddVCBuMK7O5AAT7XUV1RKYG8giyAQtYyHhENSrAKEn4cvqI7TC2igJEu/y7f7XFhD+atWD+u6UJWBvDVlaJKqWzACYAdYgOaBvguU+GFwDOLPklnk6+5SeUtYDt0llxLFapujtsjByPjL+4vEsGLUbqC++xl/mHaE9WaU5LBvOKXsMW+HU0w0ISQzfcypRJtqR4N2rAGTQUy8/FPFlm/WiEAHiGtpe/9a9IVmAK5edb8MpZkPIZeav/wbuMfT61PODq1I1qHq4MTTP9rQangrduPv4s7z7M7IIUAtzx2kycMvAyjcBI5/S/IAHif/n1VAl1zneDDAp46CBdaLk2IPScRjCdug1JE/YWMJV7yQ7pCJnK7q7tEY5yed1uTDdEi2w1sot88258eWnvSR1eGnXi8fU0I8uK4twFQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(186003)(316002)(83380400001)(6486002)(2906002)(91956017)(498600001)(54906003)(71200400001)(4744005)(110136005)(53546011)(8676002)(4326008)(76116006)(6506007)(66946007)(66476007)(66556008)(64756008)(66446008)(38070700005)(6512007)(26005)(107886003)(82960400001)(122000001)(38100700002)(31686004)(86362001)(36756003)(31696002)(8936002)(2616005)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MXJRK1VId1J3K0NFaisvZTJnUjg2Yjg0NHovZDA1L2xQODcvc0V5Qm9iYVdv?=
 =?utf-8?B?OTRBN1EveHRyWm1RUlcwUHQybXZuZjg4Q1ZEN3gybXFTUms3UTVYTjR2cEhL?=
 =?utf-8?B?Nmo2bWdUa2phMitzOGlGY3FYSjdYYXJ5Mkc4K3B3N0ZNaG4zV005ZGRrOXZF?=
 =?utf-8?B?WGgzYk5aaUxOWHdUTFFBd0Y3NWcyZDRmMkRvb01ucW1jNlk1NzFFaFVWSzlp?=
 =?utf-8?B?YTNsRm13NUdjTWlvTVZuOE1pSFNyR0VXdGxObnU3QW1sL2tWVlhLL3ZmbWZh?=
 =?utf-8?B?M2pKQ3BYNW1COGNMVlVKUEgyL0Z2VXNWOUwvQjZCSmRSSENqbWYxdFFNK3Vq?=
 =?utf-8?B?YWs1RTFWemVMSGRXZzF6di9zaEtYU0dkczZLeXAzOVM1ak4vdDN3NTBOSmY3?=
 =?utf-8?B?Slh6V2FuY3hIZzZzMzZuVkQwRlpqY0orRyszaEE1NkdRcDA2ZUdzanNmNW5y?=
 =?utf-8?B?NTZkTmtjYmw5Y0xVSGFkMGMwSGl1dHJzODBWcmF3ZWVqa0FMQi9QNlVlem44?=
 =?utf-8?B?VWZ0SmpHdEhEVzAzREtSb3ZSTXU3MHdoalI1U1dkNm9DSjNRaERucEVrQnMx?=
 =?utf-8?B?YXJ2REVka21lajY4OC9TWjZ2QVM1Qit3bHRqSEVrSjF1K1ZtMkV1QVhFMGVt?=
 =?utf-8?B?UTlHWTZqRzFYOURmaEhwaGg1U3VCQTNmdi9mYy9UM1ZNV1RoK0ZaQXgrNUFm?=
 =?utf-8?B?K2ViZ3JSOE1EeGZqR2ZxRE9yYS9hSzR6WjlGWGVuT1lwSjlMQ3JLeW5WcFBI?=
 =?utf-8?B?bWkyL2NmSndyZ2VHL1pmTTdjSXM2d3RKMEtZZ1FwSXJkMU1xQUhoSG1qa2Fn?=
 =?utf-8?B?dFFON2xkWlR1YXg5aGNyZ1BvT0RZbnBzUkVIaWhCQXl3UyszcWhCVVlKWDFu?=
 =?utf-8?B?Q2VTUkxOaGVKdmg1QjlKR3hES1gwcEpwL2FnbVNKMXhlQmFLODdrOUtVaGNF?=
 =?utf-8?B?Q2Y2M2VzUkpvODgxRUw3TGsxMzZNb0g3UVA4ZFkvZFFwbXNaY1JsTW5BUmhW?=
 =?utf-8?B?OXpkRDJtNGt3NjcxK0pzcCtnN2pKbVRZaGRZeTV3Z1ltUThldEZNZUtpRFAz?=
 =?utf-8?B?aFIyTzhZYlpNMUtQR1Z4NlEzQjkzdHNNZ2RNTFA3YTdVTWw0U2didTVwQzhE?=
 =?utf-8?B?TlhZbm51b20yNG4vKysvb3h3anNLNjB2V3RBdkdyTFFKeUQ2dTdRM2NJS1d2?=
 =?utf-8?B?T09kbTZlZXFBM1lsRTZaSE55RGlnZmtKR0tHSkk2Yjd3WHV2RWk1SmUyVE9I?=
 =?utf-8?B?VlRkRXNiYWQ1Zk11YWJURVNWNDJpMUMvL3hUSVhJQ0NTd082eHZhYzd2Ym9o?=
 =?utf-8?B?UlI4Z2g0WjIzdkJuaE1zRG1CSEx3azNVRjZGYzVSQWIzNzhjRDNmdUN3MVNR?=
 =?utf-8?B?NzIrcXNEeldQWHg3U0l2WjNkd0F6Y0RrMFkrQnQrYkhSdFRFWHdBaGpKQW9i?=
 =?utf-8?B?WWt2bVljNjRCYlpOWTlSRVpWUzdsdFYrOFh1TXZZclZCNWlVaENVaHQ4aFli?=
 =?utf-8?B?RytSNmt1WFAwOVV4dVd0VENLeUFhUUJSMVJOemZtVXRrVFluR1JKSDdBK1lG?=
 =?utf-8?B?M0xFNlQ1VlF6MGtFckxQR3BBdnB3SEpWcVQ1LzdpN1ppM3lsM0lrc1A5Zk1l?=
 =?utf-8?B?SUdwT0ZUYTV4T2xFU3ZaYVJHaUNaa3drTkwrYVZDQ2w3eVpMTDgyOVdybmlQ?=
 =?utf-8?B?VlRUcEJzSzhwSStxLzRzaklJb2VBdENaNEEzNHhoTmxLT1h4Y3dDd3kxL0JN?=
 =?utf-8?B?djJKeEhNUUMrZ2c1TFIxSm56Q1orRHNtcG8rWmt1VXNNZ2xzS1FkR2xhWEVP?=
 =?utf-8?B?L1dsTE1yR05tUUpqckpDVHllVXFFeDBvWExNRElOOG5CYmlKVGJvNGVJRTN2?=
 =?utf-8?B?L2tkbFdsNmZpMHVaOWFYUThZSno4WVR1eXhsbFJDS3cvc3I3d1Avb1FQUUQz?=
 =?utf-8?B?djZxdlRvTGoxcmlPN0RETTB5K1dwY01LRVdHNnRMd0g2Y1IwK0IyV0kwZUJ6?=
 =?utf-8?B?SWd0cSs5N3J6dWpDYWVQVVhFQ1RUcWEveHB1Sm4vYWFjNW4yM0pZWEFZZkwv?=
 =?utf-8?B?MjZBZW5rMURxc0JYUUFpb0ZhcTM1ckZEOW1KeGt5NkhOTzdkNVlId3lXMjVp?=
 =?utf-8?B?RlprZE85SitoWTJJMG1TdExXSnlVTm0wREg1Z0psZ3FHYWZrNnFjUjVDaURr?=
 =?utf-8?B?VnVyNmdqRmt5MXoxKzhyazQzdjVqR1drMElaV285VVBUR1RuRUh5T1JuZFdM?=
 =?utf-8?B?WVFhWEFPRTg5SkZKaEFRNUFDdGV6MGNSMEJRdkFxRXFxYUhud1F0MVFUSWNy?=
 =?utf-8?B?TEU3T1duTkZuNnRrK25RNzVpVkR4UTlwalFFVS9iekZ5UWprZVZySHluMGFn?=
 =?utf-8?Q?a+/LTeVIcfkdZn54=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0AB87D41FD44414B91F7143D1D8EA129@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e21b63-40fb-4c6e-a02c-08da4f9a3b86
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2022 13:15:06.8270
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kwtvqDLS6T1gIG7NRpjB9q6m9NGcmeqdycxR47esISc6RpBwT2sJlSRGjmbX1QaEosPK/SOEwGm1YP3CCh+RP3R2srltDGZhs9gNxVD2JTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5412

T24gMTQvMDYvMjAyMiAxNzowMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFdoZW4gc29tZSBGTUEg
c2V0IG9mIGluc25zIGlzIGluY2x1ZGVkIGluIHRoZSBiYXNlIGluc3RydWN0aW9uIHNldCAoWE9Q
LA0KPiBBVlg1MTJGLCBhbmQgQVZYNTEyLUZQMTYgYXQgcHJlc2VudCksIHNpbWRfdGVzdCgpIHNp
bXBseSBpbnZva2VzDQo+IGZtYV90ZXN0KCksIG5lZ2F0aW5nIGl0cyByZXR1cm4gdmFsdWUuIElu
IGNhc2Ugb2YgYSBmYWlsdXJlIHRoaXMgd291bGQNCj4geWllbGQgYSB2YWx1ZSBjbG9zZSB0byA0
Rywgd2hpY2ggZG9lc24ndCBsZW5kIGl0c2VsZiB0byBlYXN5DQo+IGlkZW50aWZpY2F0aW9uIG9m
IHRoZSBmYWlsaW5nIHRlc3QgY2FzZS4gUmVjb2duaXplIHRoZSBjYXNlIGluDQo+IHNpbWRfY2hl
Y2tfcmVncygpIGFuZCBlbWl0IGFsdGVybmF0aXZlIG91dHB1dCBpZGVudGlmeWluZyBGTUEuDQo+
DQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KQWNr
ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo=

