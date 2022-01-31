Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F25C44A4590
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 12:47:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263047.455598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEV9S-000841-3D; Mon, 31 Jan 2022 11:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263047.455598; Mon, 31 Jan 2022 11:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEV9R-00081b-V6; Mon, 31 Jan 2022 11:47:17 +0000
Received: by outflank-mailman (input) for mailman id 263047;
 Mon, 31 Jan 2022 11:47:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9KqZ=SP=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nEV9P-00081V-W2
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 11:47:16 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87ae41aa-828b-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 12:47:14 +0100 (CET)
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
X-Inumbo-ID: 87ae41aa-828b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643629634;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=EwMdjPZhW9E8oMhCWkr4EngvnoYzcRTUv9PqiHWtf80=;
  b=LToPDFtN7F69bVnP42V72MKPO0wCh55HM1O1Joj7Z5iz05S+CnYm0twj
   juxeA0YQyRlcErvkRmWAXZCv/eN7N7iITjqv4qvarB6sWPq6N3p/EYle5
   mS52z/LbCw0XCr6gHKRQJL7L6HgtzJthR1BytcNCwPvh6s9rjp/W8dK3F
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xsCZRPnvS8x0h9qUVyFDyyoY6+NMqd/S0gGxmrmM7N3EUiFQ91oID8zBaWKjls/YMgYUPiplbo
 QxQzaKA8cUuybSz0kS/AcQrd2alNkom77F6YSNUfMr7Vht388UNM9mJZKkGTg5Re0ZtZ3yiTd3
 hwSvAWWru1arJgNvY/VrFQNCv4W4oknYnRxP1nj64uL3/3Y0XkbuW1jifgnzs5GUmLxlQZiXl3
 MOtBV2jR0qoCCGUGhExcZXxLgAaRXVv6unG+0CZq4PrqgyXpdVvmq+jqAtiNuVydG1U7OytgoB
 ZjBqsrRxJ6OqcP594DtIILnL
X-SBRS: 5.2
X-MesageID: 63032653
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Nwtqka75ZZjuMRKrsSt/XAxRtNXAchMFZxGqfqrLsTDasY5as4F+v
 mocXziGb/fbMTb3fNglPYTj9EMGsceAmNc3QFdv+Sw1Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZg2dcw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z8
 sVQvrioSQQSPvfMis0GSBZANH5gMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQRq6FP
 ZREMlKDajzORBhoOUgaNqg9jd6w31nZfDNIj3Ks8P9fD2/7k1UqjemF3MDuUsyHQ4BZk1iVo
 krC/n/lGVcKOdqH0z2H/3mwwOjVkkvTR4Y6BLC+sPlwjzW7xGYeFRkXXluTuuSihwi1XNc3F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc+BADuYe8AGO8aqO4xSwHXMLVhkedtNz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbo1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNOtbABbvzt68owGOlor+p5
 iJsdy+2t7hmMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8ifxo5bZ5UJ261M
 Sc/XD+9ArcJZhNGiocsO+qM5zkCl/C8RbwJqNiJBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6NGfjTkkr2uZLDNC/9YepUazOmM7FmhJ5oVS2Iq
 b6zwePQlUUGOAA/CwGKmbMuwacidCZjXc6u950IJ4Zu4GNOQQkcNhMY+pt4E6RNlKVJjObYu
 Ha7X05T0l3kgnPbbw6NbxhehHnHB/6TdFo3Yn4hO0iGwX8mbdr95asTbcJvL7Im6PZi3bh/S
 PxcI5eMBfFGSzLm/TUBbMai8Nw+JUrz3Q/ebTC4ZDUffoJ7Q1Cb8NHTYQaypjIFCTC6tJVir
 uT4hB/bW5cKWy9rEN3SNKC011q0sHVEwLByUkLEL8N9YkLp9IQ2eSX9guVue5MHKAnZxyvc3
 AGTWE9Kqe7Iqo4z0d/ImaHb8Nv5T7ogRhJXRjCJ46y3OC/W+nuY7bVBCOvYLyrAUG7U+bm5Y
 bkHxf/LL/Bazk1BtJBxEug3wPtmtcfvvbJT0i9tAG7PMwawErplL3SLgZtPu6lKyuMLsAe6Q
 BvSqNxTOLHPM8L5Cl8BYgEia73bh/0TnzDT69UzIVn7u3ArrObWDx0KMknekjFZIZt0LJghk
 LUot8Mh4gCijgYnb4SdhSdO+mXQdnENXs3LbH3B7FMHXubz9mx/XA==
IronPort-HdrOrdr: A9a23:fKkGlKjXFetcOHCiqp8YUt2dlXBQX3513DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3IwerwRZVpQRvnhPtICRF4B8btYOCUghrVEGgE1/qi/9SAIVywygc578
 ldmsdFeaTN5DRB/KXHCUyDYqwdKbq8geCVbIXlvg9QpGhRAskKhWYYNu/YKDwMeOAvP+tiKH
 P23Lsim9PUQwVwUi3NPAhjYwGsnayoqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 nsiWXCl+aemsD+7iWZ+37Y7pxQltek4MBEHtawhs8cLSipohq0Zb5mR6aJsFkO0aOSARcR4Z
 zxSiUbToNOAkDqDyeISNzWqlDdOQMVmjvfIJmj8CPeSILCNWkH4oF69P1km1PimjQdVZdHof
 92Niuixupq5VmrplWN2/HYEx5tjUa6unwkjKoaiGFeS5IXbPtLoZUY5149KuZLIMvW0vFuLA
 BVNrCW2B+WSyLvU1nJ+m10hNC8VHU6GRmLBkAEp8yOyjBT2HR01VERysATlmoJsMtVcegJ28
 3UdqBz0L1eRM4faqxwQO8HXMusE2TIBRbBKnibL1jrHLwOf3jNt5n06rMo4/zCQu1E8LIi3J
 DaFF9Iv287fEzjTcWIwZ1Q6xjIBH6wWDz8o/surqSReoeMMoYDHRfzOmzGovHQ1Mn3WPerKM
 pbEKgmdsPeEQ==
X-IronPort-AV: E=Sophos;i="5.88,330,1635220800"; 
   d="scan'208";a="63032653"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZRqhXkv4fuiFImsD8wFjIh7Bb52yymKdmqv8TpZ8DlnXsE2V7JB638suv75B11qV/uM5Kcy/6yRFkMRsrt1hp7Ni5XZYuvpyY3QnLXdX7HHwOOqW96UMSwp9m4UWxd2A4cyv0SV8ic2f8INr6qoYJZ3Zh0KlZH45cKxzoFGoF4ZgXksBhzUEpC2KmD5mn/4qFxwas97TYWbYMupWkdGo5s6wAcFR2rDBmAohR8nSDJJAz4Dm37hEpzxCJcGAIlG96iRqaKOHkp1611V+GQEQaOj1CjcPKtzJf1c/OZCjRYc6GcmPmjdJo1txchnuOMCYD/etIGpKgXhCu5NiBRqow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwMdjPZhW9E8oMhCWkr4EngvnoYzcRTUv9PqiHWtf80=;
 b=aCC6G9BzzhfY4Zrz7W7wYFs3vrMQykOg1X5lsElG53TrMXAaCmzzK9Swq8fsvXJVTkhnW/5NLJUGZ5kvlvtitdYBbUhqJKNbSCiq4jSluQwxTqpRlD9P/oPU2P+luIq2FrJTlFjvumI18+YR03BnTkBVpm4GXYiwQrLLiWmGbsVOhqVe+oY7FVh4kPFUhXp3gl9MarHnEQcouWOg1SHhdZ50Nc9hQqV2kVDlenY0k8yp793FNa/PvCNIL3ecF6Xa0/dhtNHkGRyAwcjJQpIbTPobTF2R/kfAFA/kNykOsGDEE0uCueF/xFYtA7nzlwFj2xlHLd2rNjg/2JzEhI92NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwMdjPZhW9E8oMhCWkr4EngvnoYzcRTUv9PqiHWtf80=;
 b=u86xhpqOLkeccBJZv+Huki6JZaRkVFgDI/1FEiqB1Jz+IgcG35PBm96kZ3QfHuTHQzrexKOX45zrc8leTzt3mb+rRWtaPy5t1nQLGLeQ/Yp0XmqlzqYv5HsHnQtiP1ixLfDuIa1wlLBqfDss39dIqIEOqg/jwFZBnfl8JgrRXns=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 7/9] x86/svm: VMEntry/Exit logic for MSR_SPEC_CTRL
Thread-Topic: [PATCH v2 7/9] x86/svm: VMEntry/Exit logic for MSR_SPEC_CTRL
Thread-Index: AQHYFEsgduRKpPrES0uMVuwf+i5+76x881mAgAAUlgA=
Date: Mon, 31 Jan 2022 11:47:03 +0000
Message-ID: <6f55aba5-f109-b530-191f-b6215cc91419@citrix.com>
References: <20220128132927.14997-1-andrew.cooper3@citrix.com>
 <20220128132927.14997-8-andrew.cooper3@citrix.com>
 <46bb7297-cdf1-2196-a261-4357621792d7@suse.com>
In-Reply-To: <46bb7297-cdf1-2196-a261-4357621792d7@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b491d581-3236-4f90-113d-08d9e4af6614
x-ms-traffictypediagnostic: SN6PR03MB4064:EE_
x-microsoft-antispam-prvs: <SN6PR03MB406446DCF9C3DC6E64035499BA259@SN6PR03MB4064.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XeyMYUmC4KZkrcqtVJ9L4/2wYV+774MSGvPhJWDFn8xMyAw8+uONgRvpxFMgQWYji/MzAq7Qqq1p4JYYH6ycW6FMu3HO+9TzCSbQ1wJbkrdTTZmREvkeDdn1Q52iRqMFlxHsGYJ1x9cZpqDKRje9l47POVyzRm35kuDfNV5XUqr1hsRl5TRpHp5EwkBhEjFbh7dz+02i/el9kj1r/4bmFtnbPokj7Vyryb6BVvk0IUCyLRMPd767Zr91CdQ3Y64UK+aDRwLdauSw920o5cXqPmt4FQ4drzqDu5YPlQQufbraVtxFFvg55CU6FBcmor9o7Gzlx/hUNfkn1aq8Yq+qLW4rUi7oK9auIUremTGegMXYXR5H12Oirj3oPO6yV0SponQ4G6WETZ0B6r5Xg+vtb+VA2d97kz7x9t7uSutjS1KVW+D/KbvBPiU/xgEmXnKgYqaJ2yBaSyVg9CKAYPv0Gywj8mohxiwnPEOw4DQLxoIrL2scmi/SnhDCtN33gcfcvjwarzCdh5n6+Fhc2flYPWJN2x/n5FhkEeOFIVnzR7QvSo1VbKMretykxvh9/vXYgtjG/pGeBi0745jJZG81mGx4qncDCcIAssJ26n87U6Q5MDmocWXR6EvARMxkP+wJ3RqajIxsOJWFfAD5LnmLuNh/80ggwV59PiGJSX1Rhp3ks7UtIfOVI86QbhrvkHlStC5wxxImwWFoPDGDgwCrL1XmEHytSS7qH9+baYEZyYt7EvbiwttYhVv8+XNPQ87t7qxaAqR36eH+t50Bovl+sw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(82960400001)(26005)(186003)(83380400001)(38070700005)(31686004)(36756003)(5660300002)(2906002)(54906003)(6512007)(53546011)(6506007)(8676002)(66946007)(8936002)(76116006)(4326008)(91956017)(316002)(66476007)(66556008)(64756008)(66446008)(31696002)(2616005)(508600001)(71200400001)(6486002)(86362001)(38100700002)(122000001)(6916009)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVlLZGg1ODlMa041Z1Zqa2g3ZmFCL0NOblJ4dnpaczdIWFlselAzZXJ0ZXhr?=
 =?utf-8?B?cVhTNVIwelFNL0h1d1BNQUtoNEZlNGlQdVdsL2phOCs5MFZ3V1dPelNlZk10?=
 =?utf-8?B?c2g2TkxQdUczaVo3OVIvS2ZHRGdSa3U3UlpETFVlKzd3SmwxaFlwRlhtSmFP?=
 =?utf-8?B?LzlLQi8rWno5a3NrT04rdzN3dUsrZjZNVGRlZ0tJbGdxSWhNWXZhN3R6d0E0?=
 =?utf-8?B?a1J4eXdqVFZHTVFsUHZqNFp3K3RQSFdqSVhwQ0hvVzh1ZisvTFZYR2ZlOHJK?=
 =?utf-8?B?ak5ZV1pPS3pFRHQvenk0SVM1OElSQlpGNEsxT1p4VW1ZdDhaam5zcCtYZU5Q?=
 =?utf-8?B?NFR6RDZZNjJjUXNOT3I2QmJ4ZkJLK2hSNDE2NDJYYmRWQXJlakkzUFpROW5X?=
 =?utf-8?B?aEpTc0Ryc3pwYVpuVGtTSUVleXBBSzdZTFZkd0lyNy9IRmtXL1VhZE0yNFhU?=
 =?utf-8?B?OEgrcDAraHJkVTBsaENXL1VYdU05a05uOWJpOFpVczJQeXhkVHRUWkNiMU5L?=
 =?utf-8?B?TGRxbHJOU0dKRTUvMjdKNFhRb3dEMUd4cmpNQ3VlQmVHYXJwR1hCalhFOWdB?=
 =?utf-8?B?OG1NSzRtdllIbHlhemVWc3VNS0NnN1RpQmgyQmRZNFdYdGx6SEJtdVVrc2pW?=
 =?utf-8?B?TXZEUEFmRGlSL3FvNHpUNEtpTlZuQXd0UmFtalRpUHF5WlV1V2IxVGlPdWJL?=
 =?utf-8?B?eWJDUGRObmdDTXc3N1NPakNBN0d0M3dUbUxwUFg2QU5XN005cUlZWk5NeVZz?=
 =?utf-8?B?WVAvVC9YaG00WHVIbHM3alhqTE1heHBKUHFvSFk0QVJ2NlN0eHZ1RUtZSDFC?=
 =?utf-8?B?Z2RHUllxczBZcDFYUmRId0RwOXRQakMvNVAzcWZEd1lUNVNQV1phUlBZd3I3?=
 =?utf-8?B?ck9QNEdPMThSS1J0UW9TKzlJdldRRUEvNUdVWm9acVU3OEprOE42RFNpYWxm?=
 =?utf-8?B?MXM0SXl4UTFaTEhab01OM3ozZzIvaGViV2VqRXdmNFhOM29MdHIzb25yQXUv?=
 =?utf-8?B?TzVlQjI4OWlNRVVETEJwVkxKb2p2a2VCYnpBOXBMK0RXejh1QzFFc0o2Vmdi?=
 =?utf-8?B?TktBQzkwR1ZmV1RVVmtVTC8rQTkrWEh5SFR5RlpWYUJoZXl2blY4YmNaQjV1?=
 =?utf-8?B?d1V3Nmo1M210YnlGVWpSdXAycjBtR0RsbXFnU2RuZHpaM05LZVpDTDR5cGJF?=
 =?utf-8?B?WEhYaTBibGU2TWs0UTQ0ZVJUSDBJRENzbWNnUTlLQ0NHR2M0Q0g1TU0zcVJD?=
 =?utf-8?B?am9CYVFLaG5jb0JQSEUyRENYNXYwUjNuYUFaUTVKcEV1SE9UaFEzL0FlcnpT?=
 =?utf-8?B?YXFOWlBaN2pWYTBpb1RqVkdnMHkxY3k2UUN2cnBJVDRMRkVPYTBXdTN1OWd5?=
 =?utf-8?B?SVJFaFZOZnA3aFcveGFhaGJQejlmM3VtZ2J1ZVVVV3pMUXFrTXRDZngwS2ta?=
 =?utf-8?B?VklITy81R05HR3c2SVlkUEpxUXZROUNaL015bFI2WHhOYXk3NzZwVURTMlpH?=
 =?utf-8?B?T1JncDd5YUx6a2RSREJWQzhkVGZQZHd1a2M1MzJyQ01kMGFtUEtTNlhPQjBy?=
 =?utf-8?B?ZDE5akRXZGM0b0dxbHJ1aE9LMnNHUnRlWnFkaTNoVmhUbEZrT0NGc0pVTnhh?=
 =?utf-8?B?aGQ5S1daa3U4L2dkNy9pMUs2MzMvQ1NDSjBXeENxS090c3BsTDVybW5qT2tn?=
 =?utf-8?B?SWIwRm0xakNwQndFdEdpU2JpcjFsYk95VldVUm8zQ1VROFQ1eGYwd1ExclhD?=
 =?utf-8?B?eDlWUDR4dU95SWJyK1VmZSticEtTNjZpZ3d6anBjSkU3ZlFDUXBQTVhqVHFU?=
 =?utf-8?B?SU9Ecm5ERXdQN1dPVWNqRVZVVDVJN20vdkJOcFIzbTczWTJGUFNmSUZXQWE2?=
 =?utf-8?B?cDZBcUdrVVo4TXM3UldWU3k5OFV3L0taQklOMWNadFBya0JvUzc4NmVrekNm?=
 =?utf-8?B?OForTk9ZQ09EQkgydVlSdm51aUk3ZHpLaThZZUdJZzRpcVIrUHM0WkFFZlRC?=
 =?utf-8?B?NW94eFI2d1NCK05tcDNiTDY5NXNmcmVRZlBOdWxDUWVadEhTblBjODRsRkRP?=
 =?utf-8?B?RUtkNjhGR3pzSE1KQlRJV2tBU1MxTXBqK0I3dUpuSGRRVDR3TXZKYUwzeDc1?=
 =?utf-8?B?WTA5WjhJVm9NZHlHcGtPanVKTEdkTnh1RDl2ZFE2QWNERm41OXlBOUhseDdv?=
 =?utf-8?B?UXpmbFA2QzhPc2kzQWZDNVB0b1h4VUhSdTBYZEFlSUc3SFRlNGJZSEVrblVx?=
 =?utf-8?B?OUVWY2hrSnZ5cS9LczZNbHJvWHlnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DFF066FF3D696543A93AB3C8E0AD7F85@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b491d581-3236-4f90-113d-08d9e4af6614
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 11:47:03.1543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JIu9nZNFgYKTBaSTIVO0WbX6FP1w8rkGeXv4q7R8MIv7O8n5kNKt2NmBrXRv+E8BY3fXDyGTp1E8EUn8eEx7kkh5B8aYeptsJRDsCwf5u/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4064
X-OriginatorOrg: citrix.com

T24gMzEvMDEvMjAyMiAxMDozMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI4LjAxLjIwMjIg
MTQ6MjksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBIYXJkd2FyZSBtYWludGFpbnMgYm90aCBo
b3N0IGFuZCBndWVzdCB2ZXJzaW9ucyBvZiBNU1JfU1BFQ19DVFJMLCBidXQgZ3Vlc3RzDQo+PiBy
dW4gd2l0aCB0aGUgbG9naWNhbCBPUiBvZiBib3RoIHZhbHVlcy4gIFRoZXJlZm9yZSwgaW4gcHJp
bmNpcGxlIHdlIHdhbnQgdG8NCj4+IGNsZWFyIFhlbidzIHZhbHVlIGJlZm9yZSBlbnRlcmluZyB0
aGUgZ3Vlc3QuICBIb3dldmVyLCBmb3IgbWlncmF0aW9uDQo+PiBjb21wYXRpYmlsaXR5LCBhbmQg
Zm9yIHBlcmZvcm1hbmNlIHJlYXNvbnMgd2l0aCBTRVYtU05QIGd1ZXN0cywgd2Ugd2FudCB0aGUN
Cj4+IGFiaWxpdHkgdG8gdXNlIGEgbm9uemVybyB2YWx1ZSBiZWhpbmQgdGhlIGd1ZXN0J3MgYmFj
ay4gIFVzZSB2Y3B1X21zcnMgdG8gaG9sZA0KPj4gdGhpcyB2YWx1ZSwgd2l0aCB0aGUgZ3Vlc3Qg
dmFsdWUgaW4gdGhlIFZNQ0IuDQo+Pg0KPj4gT24gdGhlIFZNRW50cnkgcGF0aCwgYWRqdXN0aW5n
IE1TUl9TUEVDX0NUUkwgbXVzdCBiZSBkb25lIGFmdGVyIENMR0kgc28gYXMgdG8NCj4+IGJlIGF0
b21pYyB3aXRoIHJlc3BlY3QgdG8gTk1Jcy9ldGMuICBUaGUgbG9hZGluZyBvZiBzcGVjX2N0cmxf
cmF3IGludG8gJWVheA0KPj4gd2FzIGFsc28gc3RhbGUgZnJvbSB0aGUgdW51c2VkIG9sZCBjb2Rl
LCBzbyBjYW4gYmUgZHJvcHBlZCB0b28uDQo+Pg0KPj4gSW1wbGVtZW50IGJvdGggcGllY2VzIG9m
IGxvZ2ljIGFzIHNtYWxsIHBpZWNlcyBvZiBDLCBhbmQgYWx0ZXJuYXRpdmUgdGhlIGNhbGwNCj4+
IHRvIGdldCB0aGVyZSBiYXNlZCBvbiBYODZfRkVBVFVSRV9TQ19NU1JfSFZNLiAgVGhlIHVzZSBv
ZiBkb3VibGUgYWx0ZXJuYXRpdmUNCj4+IGJsb2NrcyBpcyBkdWUgdG8gYSBxdWlyayBvZiB0aGUg
Y3VycmVudCBpbmZyYXN0cnVjdHVyZSwgd2hlcmUgY2FsbA0KPj4gZGlzcGxhY2VtZW50cyBvbmx5
IGdldCBmaXhlZCB1cCBmb3IgdGhlIGZpcnN0IHJlcGxhY2VtZW50IGluc3RydWN0aW9uLiAgV2hp
bGUNCj4+IGFkanVzdGluZyB0aGUgY2xvYmJlciBsaXN0cywgZHJvcCB0aGUgc3RhbGUgcmVxdWly
ZW1lbnRzIG9uIHRoZSBWTUV4aXQgc2lkZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBBZ2FpbiB0ZWNobmljYWxseToN
Cj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KVGhhbmtz
Lg0KDQo+IEJ1dCAuLi4NCj4NCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL2VudHJ5LlMN
Cj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL2VudHJ5LlMNCj4+IEBAIC01NSwxMSArNTUs
MTIgQEAgX19VTkxJS0VMWV9FTkQobnN2bV9oYXApDQo+PiAgICAgICAgICBtb3YgICVyc3AsICVy
ZGkNCj4+ICAgICAgICAgIGNhbGwgc3ZtX3ZtZW50ZXJfaGVscGVyDQo+PiAgDQo+PiAtICAgICAg
ICBtb3YgVkNQVV9hcmNoX21zcnMoJXJieCksICVyYXgNCj4+IC0gICAgICAgIG1vdiBWQ1BVTVNS
X3NwZWNfY3RybF9yYXcoJXJheCksICVlYXgNCj4+ICsgICAgICAgIGNsZ2kNCj4+ICANCj4+ICAg
ICAgICAgIC8qIFdBUk5JTkchIGByZXRgLCBgY2FsbCAqYCwgYGptcCAqYCBub3Qgc2FmZSBiZXlv
bmQgdGhpcyBwb2ludC4gKi8NCj4+IC0gICAgICAgIC8qIFNQRUNfQ1RSTF9FWElUX1RPX1NWTSAg
IChub3RoaW5nIGN1cnJlbnRseSkgKi8NCj4+ICsgICAgICAgIC8qIFNQRUNfQ1RSTF9FWElUX1RP
X1NWTSAgICAgICBSZXE6ICAgICAgICAgICAgICAgICAgICAgICAgICAgQ2xvYjogQyAgICovDQo+
PiArICAgICAgICBBTFRFUk5BVElWRSAiIiwgU1RSKG1vdiAlcmJ4LCAlcmRpOyBtb3YgJXJzcCwg
JXJzaSksIFg4Nl9GRUFUVVJFX1NDX01TUl9IVk0NCj4+ICsgICAgICAgIEFMVEVSTkFUSVZFICIi
LCBTVFIoY2FsbCB2bWVudHJ5X3NwZWNfY3RybCksIFg4Nl9GRUFUVVJFX1NDX01TUl9IVk0NCj4g
SXMgdGhlcmUgYSByZWFzb24gdG8gdXNlIGEgbWFjcm8gZm9yIGNvbnZlcnRpbmcgdG8gYSBzdHJp
bmcgaGVyZSBhdA0KPiBhbGw/IFRoZXJlIGFyZSBubyAiaW5uZXIiIG1hY3JvcyBoZXJlIHdoaWNo
IG1pZ2h0IG5lZWQgZXhwYW5kaW5nLiBBbmQNCj4gImJyZXZpdHkiIChhcyB5b3UgaGF2ZSBpbiB0
aGUgcmV2IGxvZykgd291bGQgY2FsbCBmb3INCj4NCj4gICAgICAgICBBTFRFUk5BVElWRSAiIiwg
Im1vdiAlcmJ4LCAlcmRpOyBtb3YgJXJzcCwgJXJzaSIsIFg4Nl9GRUFUVVJFX1NDX01TUl9IVk0N
Cj4gICAgICAgICBBTFRFUk5BVElWRSAiIiwgImNhbGwgdm1lbnRyeV9zcGVjX2N0cmwiLCBYODZf
RkVBVFVSRV9TQ19NU1JfSFZNDQoNCkdvb2QgcG9pbnQuwqAgSSdsbCBzd2l0Y2ggdG8gcGxhaW4g
c3RyaW5ncy4NCg0KPg0KPg0KPj4gQEAgLTg2LDggKzg2LDEwIEBAIF9fVU5MSUtFTFlfRU5EKG5z
dm1faGFwKQ0KPj4gIA0KPj4gICAgICAgICAgR0VUX0NVUlJFTlQoYngpDQo+PiAgDQo+PiAtICAg
ICAgICAvKiBTUEVDX0NUUkxfRU5UUllfRlJPTV9TVk0gICAgUmVxOiBiPWN1cnIgJXJzcD1yZWdz
L2NwdWluZm8sIENsb2I6IGFjICAqLw0KPj4gKyAgICAgICAgLyogU1BFQ19DVFJMX0VOVFJZX0ZS
T01fU1ZNICAgIFJlcTogICAgICAgICAgICAgICAgICAgICAgICAgICBDbG9iOiBDICAgKi8NCj4+
ICAgICAgICAgIEFMVEVSTkFUSVZFICIiLCBET19PVkVSV1JJVEVfUlNCLCBYODZfRkVBVFVSRV9T
Q19SU0JfSFZNDQo+PiArICAgICAgICBBTFRFUk5BVElWRSAiIiwgU1RSKG1vdiAlcnNwLCAlcmRp
KSwgWDg2X0ZFQVRVUkVfU0NfTVNSX0hWTQ0KPj4gKyAgICAgICAgQUxURVJOQVRJVkUgIiIsIFNU
UihjYWxsIHZtZXhpdF9zcGVjX2N0cmwpLCBYODZfRkVBVFVSRV9TQ19NU1JfSFZNDQo+IFNhbWUg
aGVyZSB0aGVuLCBvYnZpb3VzbHkuDQo+DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9z
dm0uYw0KPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMNCj4+IEBAIC0zMDg2LDYg
KzMwODYsMzMgQEAgdm9pZCBzdm1fdm1leGl0X2hhbmRsZXIoc3RydWN0IGNwdV91c2VyX3JlZ3Mg
KnJlZ3MpDQo+PiAgICAgIHZtY2Jfc2V0X3ZpbnRyKHZtY2IsIGludHIpOw0KPj4gIH0NCj4+ICAN
Cj4+ICsvKiBDYWxsZWQgd2l0aCBHSUY9MC4gKi8NCj4+ICt2b2lkIHZtZXhpdF9zcGVjX2N0cmwo
c3RydWN0IGNwdV9pbmZvICppbmZvKQ0KPj4gK3sNCj4+ICsgICAgdW5zaWduZWQgaW50IHZhbCA9
IGluZm8tPnhlbl9zcGVjX2N0cmw7DQo+PiArDQo+PiArICAgIC8qDQo+PiArICAgICAqIFdyaXRl
IHRvIE1TUl9TUEVDX0NUUkwgdW5jb25kaXRpb25hbGx5LCBmb3IgdGhlIFJBU1s6MzJdIGZsdXNo
aW5nIHNpZGUNCj4+ICsgICAgICogZWZmZWN0Lg0KPj4gKyAgICAgKi8NCj4+ICsgICAgd3Jtc3Io
TVNSX1NQRUNfQ1RSTCwgdmFsLCAwKTsNCj4+ICsgICAgaW5mby0+bGFzdF9zcGVjX2N0cmwgPSB2
YWw7DQo+PiArfQ0KPj4gKw0KPj4gKy8qIENhbGxlZCB3aXRoIEdJRj0wLiAqLw0KPj4gK3ZvaWQg
dm1lbnRyeV9zcGVjX2N0cmwoY29uc3Qgc3RydWN0IHZjcHUgKmN1cnIsIHN0cnVjdCBjcHVfaW5m
byAqaW5mbykNCj4+ICt7DQo+PiArICAgIHVuc2lnbmVkIGludCB2YWwgPSBjdXJyLT5hcmNoLm1z
cnMtPnNwZWNfY3RybC5yYXc7DQo+PiArDQo+PiArICAgIGlmICggdmFsICE9IGluZm8tPmxhc3Rf
c3BlY19jdHJsICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgd3Jtc3IoTVNSX1NQRUNfQ1RSTCwg
dmFsLCAwKTsNCj4+ICsgICAgICAgIGluZm8tPmxhc3Rfc3BlY19jdHJsID0gdmFsOw0KPj4gKyAg
ICB9DQo+PiArDQo+PiArICAgIC8qIE5vIFNwZWN0cmUgdjEgY29uY2VybnMuICBFeGVjdXRpb24g
aXMgZ29pbmcgdG8gaGl0IFZNUlVOIGltbWluZW50bHkuICovDQo+PiArfQ0KPiBUaGVzZSBsaXZp
bmcgaW4gU1ZNIGNvZGUgSSB0aGluayB0aGVpciBuYW1lcyB3YW50IHRvIGF2b2lkIHN1Z2dlc3Rp
bmcNCj4gdGhleSBjb3VsZCBhbHNvIGJlIHVzZWQgZm9yIFZNWCAoaXJyZXNwZWN0aXZlIG9mIHVz
IG5vdCBtZWFuaW5nIHRvIHVzZQ0KPiB0aGVtIHRoZXJlKS4gT3IgZWxzZSB0aGV5IHdhbnQgdG8g
bW92ZSB0byBjb21tb24gY29kZSwgd2l0aCBjb21tZW50cw0KPiBzbGlnaHRseSBhZGp1c3RlZC4N
Cg0KSSdsbCBhZGQgc3ZtXyBwcmVmaXhlcy7CoCBJIGNhbid0IHNlZSB0aGVzZSBiZWluZyB1c2Vm
dWwgZWxzZXdoZXJlLg0KDQp+QW5kcmV3DQo=

