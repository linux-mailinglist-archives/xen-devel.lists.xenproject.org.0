Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBEE4A4940
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 15:25:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263132.455730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEXbg-0004LR-T2; Mon, 31 Jan 2022 14:24:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263132.455730; Mon, 31 Jan 2022 14:24:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEXbg-0004IG-Po; Mon, 31 Jan 2022 14:24:36 +0000
Received: by outflank-mailman (input) for mailman id 263132;
 Mon, 31 Jan 2022 14:24:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9KqZ=SP=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nEXbf-0004IA-7d
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 14:24:35 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80f961c1-82a1-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 15:24:32 +0100 (CET)
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
X-Inumbo-ID: 80f961c1-82a1-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643639070;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ecAUYcrhhHo+Pfg6PLlPNqcJcg4zZWxT1Ck9tcU3S3Q=;
  b=ZPCpWqNe1sfdQQeyl+id0XnheaflOIsh1OvI/6AkabTQ+C5Zh/WsVCXE
   Rd27y+DbUFfJipPUa1RsJ3JxzD36IJoY6vvmaofkCPpFcves9fKH6llVK
   IYBwg4GGUiI3SQFGjwLXIbb+JPik8jfXsXRvT3BvddX6xMl2rH0ML8ERT
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: SX6vc5aJhmBq8RR9yU5dB4Ne0gZ74jm1bqph1FNNV4UveMeO5ddZTUdcgqo0KXHq+KYaJoDE/+
 2/fd1lW7+jTtoUGJ5vd+UWsbRBHOMPMNUfHFJvyINsasRpOEfv9QufO08uY1rShdbLSwTQpAvC
 maXKmMa8vBvJmYj6TuKHz7ofnAGTbjC6H/rAjdHxPB/vV/Y7uuw9/HIXfroQLk0x0h4OGuPTrR
 wgAA2w6fWqethhtejSZxySjeV3m5+2vBNGz6YCBPtNPlL+4TMs6eXz80uDHvI+qja+aEHSTg3+
 NF8ZzpUhyuGrGD77G9m9Jksb
X-SBRS: 5.2
X-MesageID: 62598248
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:d3AJma/YKPHq9QGxXe5KDrUDbXmTJUtcMsCJ2f8bNWPcYEJGY0x3m
 zFMDGnVMv2LZ2ugeNhzadi/9BlXupPSm4dqHQU4rns8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7di29Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgtw
 sRslrmuFztqO6PTl9YmChlTLg1HaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4UQKeOP
 ZZJAdZpRBbYWAN1AWgPMrEjrbehlGLxfidzo03A8MLb5ECMlVcsgdABKuH9atGMAMlYgEucj
 mbH5HjiRAEXMsSFzjiI+W7qgfXA9QvkXKoCGbv+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0B9BBMs4f9l+xia/a/AmrPTEERQNtUYlz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPPt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4PeRECnCBtJ6sybp1qHHb5
 hDofODFtIgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0leRc2apZaKGO4C
 KM2he+3zMUJVJdNRfQvC79d9uxwlfSwfTgbfq28giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmD2PLbimkUXP+efONRa9FOZeWHPTP79R0U9xiFiPm
 zqpH5HUm0w3vSyXSnS/zLP/2nhTcyBjW8iq+pMGHgNBSyI/cFwc5zbq6epJU6RunrhPl/eO+
 Xe4W0RCz0H4i2GBIgKPAk2Popu1NXqmhX5kbyEqI3iy3H0vPdSm4KsFLsNldrg77u1zi/VzS
 qBdKcmHB/1OTBXB+igcMsah/NAzKkzziFLcJTehbRg+Y4VkG17D9Oj7c1a97yIJFCe265cz+
 uXyygPBTJMfbA1+F8KKOum3xla8sCFFyuJ/VkfFOPdJf0Do/NQ4IiD9lKZvccoNNQ/C1n2R0
 APPWUUUouzEookU9tjVhP/b89f1QrUmRkcDRjvV97e7MyXe71GP+44YXbbaZy3ZWUP15L6mO
 bdfwcbjPaBVh11NqYd9TepmlPps+9v1qrZG5Q14B3GXPU+zA7ZtL3Taj8lCsqpBmu1QtQesA
 x/d/9BbPfOCOd//EU5XLw0gN7zR2fYRkzjUzPI0PESlu3MnoOvZCR1fb0uWlShQDLppK4d0k
 +4utfkf5xG7lhd3YM2NiTpZ9jjUI3ENO0n9Wkr23GM/ZtIX92x/
IronPort-HdrOrdr: A9a23:OvNOv6pu14i1NOGJhVAEo8gaV5uNL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossSkb6Ky90KnpewK5yXbsibNhfItKLzOWx1dAS7sSrbcKogeQVREWk9Q96U
 4OSdkHNDSdNykZsS++2njELz9C+qjFzEnLv5ak854Fd2gDAMsMj3YbNu/YKDwNeOAvP+tlKH
 P23Lshm9PUQwVvUi3NPAhiYwGsnayvqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 nsiWXCl+eemsD+7iWZ+37Y7pxQltek4MBEHtawhs8cLSipohq0Zb5mR6aJsFkO0aSSARcR4Z
 3xSiUbToJOAkDqDziISNzWqlHdOQMVmjjfIJmj8CDeSILCNWgH4oF69Pxkm1PimjsdVZdHof
 52Niuixulq5VmrplWM2/HYEx5tjUa6unwkjKoaiGFeS5IXbPtLoZUY5149KuZMIMvW0vFtLA
 BVNrCX2B+WSyLsU1nJ+m10hNC8VHU6GRmLBkAEp8yOyjBT2HR01VERysATlmoJsMtVcegK28
 3UdqBz0L1eRM4faqxwQO8HXMusE2TIBRbBKnibL1jrHLwOf3jNt5n06rMo4/zCQu1F8LIi3J
 DaFF9Iv287fEzjTcWIwZ1Q6xjIBH6wWDz8o/sur6SReoeMDYYDHRfzPWzGovHQ1cn3WPerKc
 pbEKgmd8PeEQ==
X-IronPort-AV: E=Sophos;i="5.88,331,1635220800"; 
   d="scan'208";a="62598248"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iFvzwRu1WH1KR50iAGeNLZpgOuyBbAhuIo/GmFBJerPvrs0E0nDn4VaJTDcze9OoWMBX6P5HEwqxfErWWFhQhW328tgpAjPrQTvHefxS2wu+Sx4qe6rnpPApl6xDVv+bHYOanAyOzW1DlaZf5gsMgZMSzup09jkzGkJpbtdw4yaPSMvL3TzFUHMOw4u3lxIrfRIeaG4tWgwvxtcWK6HsmqxKcydXEGwgolTO2VNrPK/dfTwptFY++HauFhVkP4+ofJU0tygriOgqlYVhqMin7Pcr3xtC9RBgCn6XRCDkaYthke3Cqyx38wz8ILMK6Xxsc+9gR3Qdli8aHJ5nJV9efg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecAUYcrhhHo+Pfg6PLlPNqcJcg4zZWxT1Ck9tcU3S3Q=;
 b=e2EsfJMdAtjaT8KbgSKtR2i8ToUZF2rE+OVKg34zuma2ipMGQSXPxVs1O267gm29cA38cricoVaCuzzVnqJEFo7LnN+B1tUHumqaB7gS+yAe+TFhwWNAOIjO0Q2Ozz92iG2pwEzCWHsZDPFgAT2YUDqX6MoE2ZGVxrKqjmQFtABPgAql+G+PU5ESWdM4YiObF7znrUllGlx6icYleNU7iH67F0zqnHJzbtzbp9v2hamw4XWiLPnJSegJNuI69HQhRORyan/imfdQe5KisaiYndDaLVN6t10Dg9TJVP+6DLYvfUZYW7smpkxueXfw29lcRNzcfFaQX9kM/pW+JxfIRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecAUYcrhhHo+Pfg6PLlPNqcJcg4zZWxT1Ck9tcU3S3Q=;
 b=K7wfhq3MqAvyhGJVZH+EGm5M7XFIiCzrie9b4fWW9Bd7OU+9b7t5uEfQx08JeuLPi7gSbnHr4fUaKVAImuI/H+TBSScx8DHiEkbbW8A3NXxtiYXuYurY5SdHFjA2NgYMbp4Ld3gEEjQiQOUXWT++8PE0VgbEGOsrWelJCp3opr4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 4/9] x86/spec-ctrl: Don't use
 spec_ctrl_{enter,exit}_idle() for S3
Thread-Topic: [PATCH v2 4/9] x86/spec-ctrl: Don't use
 spec_ctrl_{enter,exit}_idle() for S3
Thread-Index: AQHYFEslNylcZ92lUUmGXdMcKHF6zqx87mCAgAATCgCAADJ9AA==
Date: Mon, 31 Jan 2022 14:24:24 +0000
Message-ID: <0fb993c1-9fd1-f652-aba5-97e14741bbe9@citrix.com>
References: <20220128132927.14997-1-andrew.cooper3@citrix.com>
 <20220128132927.14997-5-andrew.cooper3@citrix.com>
 <23ac2bed-9ab4-8b4b-2861-3362434dea61@suse.com>
 <daf19c30-7602-a689-c39d-35e477d9874f@citrix.com>
In-Reply-To: <daf19c30-7602-a689-c39d-35e477d9874f@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f7b84bb-fd74-4f95-c197-08d9e4c56187
x-ms-traffictypediagnostic: BYAPR03MB4872:EE_
x-microsoft-antispam-prvs: <BYAPR03MB48729B2C83372A38456E1387BA259@BYAPR03MB4872.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8CpdEDs25q0ZLwdf0tgHxQIh+kOBMYIDsZ9xf2YjB0V6dT2/fmn8EN2YtCzXGMf795aNlmECw8NSEa4/LgArvhnhqTFILT8KOLWyAUG86mXyUTOs4OWw80Y7d0wkFk7LHzp46QsZNGTyKBLnQbFnlFPZLlJb1BZ9QEVdIttwQEFq53FojSyhO6mjStLpvniDDsIF4q6xcbM4XKnr15fW3nJnPHe5b0RW6Wwrzgoruk+51AKYgpgLRrbenk301K6Qz1Z/zg/jrWgGkHOSegrbFiYbfKb9K/FXVRmy7YgRpDY75nzOM3Aqb3guOZXJ4wEbAXshDsII5LEenkjx764OR8nohaey1wt+lRMNg63dQYKincuO/eDJWPHK9MN9+/s8ug/DTpwDe17RNsoF50BzTPzPP1Knc0CbTcI0RJwnoVwIFiN2eFFdwzcYBYrJ7VV4yr5nT/a/5vYH+HxrH4cXwYV8iK9nfyO+o7g0cYzHyrhz5uSqgR0QqVg/3DDsd3VYZeOXmgSHvpIx8rQZXoCWqlnG9E1zzJrOiiRtrrF39bHID5AKWHGXiVYW18L841kzeKc1xxWXSJtZTw8sLn1ETeJ454lQ/J/ZxfJuPhdx61+8a1vIF1WNWgNkxfTyCTlpIf++YpBzZSfEZuUblXOV+kDTCCwDnIfbyCyrefxdNKXAsmv4RESYZ68F0ob6pZuv8saWn8UoMoornWM0yGr9ExwH6sjPu/gK6Mn4gxoY/NsJ1MxeaHQeT+E9PMb7xBwW3GH8P3dUmUgaoqKyogGkww==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(186003)(6486002)(4744005)(4326008)(71200400001)(31696002)(26005)(38070700005)(54906003)(82960400001)(6916009)(316002)(5660300002)(6512007)(122000001)(86362001)(508600001)(31686004)(8676002)(2616005)(6506007)(66946007)(2906002)(76116006)(53546011)(91956017)(64756008)(66476007)(66446008)(8936002)(36756003)(66556008)(38100700002)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eW40ZVdySytuK09Ycnd6N3h0WktSQnY3U1FRMHR5MmR6NG5ScHROYmNySDBI?=
 =?utf-8?B?V0pST2hnaXlZcGoyVzR6Z2NRdmU2SmdxT0xBZHZDT2RZOURxYXBVYjBrWndp?=
 =?utf-8?B?QjJwV3FRMWJzTVRmamt6aTRNUGpQYTc3M3RrWVVPNG95RlNNKzYzN1NCbnVm?=
 =?utf-8?B?MGdlaVh4dTlUSzhqOGFnbVNsbHlyRGRWMTdZOE1GZ1l4SWIwQ2ZDWDE4MVFt?=
 =?utf-8?B?L0J4NHNROFRrYkVXcjNiK2hDNmUzVFBUVE9DZWJ0L0RuMTZLbTBCSkJuQ2lN?=
 =?utf-8?B?dStzWXEycjJWVnlZM3dBaTVmU0VUbEk2dXVhUzRWZm0wSGlCZ0lRU243eUpa?=
 =?utf-8?B?MVNtTGJxd01DWUh4Z1l4MkpzdVFlUE9SclVWYVduNnNGZmZWbCtYdFNuVFph?=
 =?utf-8?B?bE9hRVNJdVovL0dRYlBYdWVlQW11Y1MwdmYvUExWNUhMdENvemJqWVNJcUVG?=
 =?utf-8?B?eFdVa3VsSVNkTklISUg0ankzN0pmWHYxL2dmTGpXTS9abENtR3g1bldKUkJU?=
 =?utf-8?B?VGJySldYaWh2UmNDblUyT2FyVHRUMnY1U245SEhZOTlQSjBSejVXcmNIR2pz?=
 =?utf-8?B?ZDZsWUwwbVNWSElDT1ZncTEzaGpweTg1YkRRVkY2Rmw3ekYvNGwyN0Nlc0tQ?=
 =?utf-8?B?MnRRWXpiOWJvU25obVBHQ0lWRUQxQ1ZvTE5DVTJHOHRxcGxVOVIwd1MvcGwx?=
 =?utf-8?B?YWg2VDZvQUVOTEZQbHlWRC9WNm1DMjE4OGJqNWJteGdHa2pSaUlsdFdDc0pK?=
 =?utf-8?B?emY4ZFUwUCtOZzRtOHppZnpETTh3Z1JvL1VTUmZieTY2cXlpK1gzclNjNDF4?=
 =?utf-8?B?QnlMTFdxK3IvUmlnNjhCbWNTVHhGZHJJS29WSEhDM25SS1FzTnlSUmZERnlu?=
 =?utf-8?B?Tk5PSGtJazBEY1JLSTV4c0Q1OW03eFhiZ3RLTitwL200QVJQYmY5NUtObmJ3?=
 =?utf-8?B?Y3NLN0hOK25CS2crWmdmUndYdmJRWjZuUDY2R1FEZXMxS2pxT1JlMW04dlFR?=
 =?utf-8?B?VlI4NjdOVkFpRThobk84azlMSS9uMXJuU1hvVklMSGVKYWJEb016ZlQwTGQ1?=
 =?utf-8?B?ZTYwNHdzVVpURnVqeUM0amttei9UaUorRVpQMEZqSVU1RTJyQUM3Smx0dDdB?=
 =?utf-8?B?YXFTcURqM3F5T2kxYUVQWlVVR3FoOG1oWkNFQTc2Q3NZZkIvMWlaRUhhZExv?=
 =?utf-8?B?L2Rja2wzN0RZUG9iWGYyV3BNODh3bm1vL3BjenlIQlplNHlDUmRPVXlVa0Nm?=
 =?utf-8?B?YU1Eays3WXE3R3JQWEJ6ZHdrQStDbTk5cG9rOEptL1JaM0tDNlJ5QWlkek5x?=
 =?utf-8?B?d2tWRnVPOThLQkJhRkh1N2pXaWluK0l2R0w5WlA2MHBSU3cvVjVhNUhmOXQz?=
 =?utf-8?B?ZEoxbXB3eWtCZVRZb3lxdXpzN1JRejNLRTNKSXVySUFmN08rR0VFY1VMVDha?=
 =?utf-8?B?T0tGSHV2RFRSSHRIVjlHaFVscUpna2htTXVWeXN4WEFyTVFWNG8vZzBVV3pu?=
 =?utf-8?B?Y0lRTlJNOCtlYThCaWdNdWVsUlhRb1I0UDBLT1h3OCtJRlBpZWVnUWF5QlJm?=
 =?utf-8?B?NlgwRllqOGo0WnNlZC9BclJmKzJFMTlWcEFmMm1jN0RiR25VYXVmMzdFZ3hT?=
 =?utf-8?B?N0ZzQUVaemVnWmNsdVdMODNaZHdQd2JiVEQvekFXQVdETnpTNUVScEVxS3d2?=
 =?utf-8?B?N01OWllraGdyM3crRW51a2tTM3N4NW8vLzZGcWNmTzZpcG00cjRJRjN3Q1h2?=
 =?utf-8?B?ay9JRml0U3VVNFViUzVLZldCcU1sWi9uS0ppd2U3SERYb3R2VnE5bnZ5dXU2?=
 =?utf-8?B?bHJXZHNVWVVwTHVBUWNkMUsvVFpHTENyUVV4TGdtOENaN25qQ1VRdUdYOFZ4?=
 =?utf-8?B?cUlyUkR2cVBzcTVqTEdGQ2ROZlVmMmRlcXp3NlBvUk1Ma2FXdjFaWHI4dXpZ?=
 =?utf-8?B?emtvZVFYV1JhYXRUeGt1YnJaYXFKUlNXTUJwQ0F4K1JrRUFLMTdSSHJhN3lD?=
 =?utf-8?B?aG5zK1pwSXZReXQ3dE55cFVoV0h0Q2N6Q0hCVThYSUorUVY4bXZlby9GVVY0?=
 =?utf-8?B?Ykxtbk83Sk1IRWtSRFFVSUVnWGNDV1NyQ00vRlpOMUd1SUNubXFnZ2sxS1Vp?=
 =?utf-8?B?RjAvdGFsUEdlQkpDZktPT2prdzRmNE9STDhvMXBQRzBMUlJ4SlNzQTJma1Yw?=
 =?utf-8?B?UDMybjNrbGM0NlRVRWRiK1d5U1JlQXpMQlo3L0p6L1NLUkJKN3lJRUZDUk50?=
 =?utf-8?B?dG12ZjBxOWRiV1hKdE1ZbkpFUTBBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0299F19953E88D4CA8602CB62FB36374@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f7b84bb-fd74-4f95-c197-08d9e4c56187
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 14:24:24.4675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6JO4DF86KoZvjUWjTbKtFNE81xh7VoGwbGiHT7S0fu5wexyJURnfWxNfToleIVyklehWzmHm6TLmx+m2fIkxb9p5Cr7ZyFpiW17dx5yTi3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4872
X-OriginatorOrg: citrix.com

T24gMzEvMDEvMjAyMiAxMToyMywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMzEvMDEvMjAy
MiAxMDoxNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAyOC4wMS4yMDIyIDE0OjI5LCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+DQo+PiBQcmVmZXJhYmx5IHdpdGggdGhlIHN0YXRlbWVudCBh
Ym92ZSBzb2Z0ZW5lZCBhIGxpdHRsZToNCj4+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+DQo+IFRoYW5rcy4NCg0KQ29tbWl0IG1lc3NhZ2Ugbm93IHJlYWRzOg0K
DQotLS04PC0tLQ0KJ2lkbGUnIGhlcmUgcmVmZXJzIHRvIGhsdC9td2FpdC7CoCBUaGUgUzMgcGF0
aCBpc24ndCBhbiBpZGxlIHBhdGggLSBpdCBpcyBhDQpwbGF0Zm9ybSByZXNldC4NCg0KV2UgbmVl
ZCB0byBsb2FkIGRlZmF1bHRfeGVuX3NwZWNfY3RybCB1bmlsYXRlcmFsbHkgb24gdGhlIHdheSBi
YWNrIHVwLg0KQ3VycmVudGx5IGl0IGhhcHBlbnMgYXMgYSBzaWRlIGVmZmVjdCBvZiBYODZfRkVB
VFVSRV9TQ19NU1JfSURMRSBvciB0aGUgbmV4dA0KcmV0dXJuLXRvLWd1ZXN0LCBidXQgdGhhdCdz
IGZyYWdpbGUgYmVoYXZpb3VyLg0KDQpDb252ZXJzZWx5LCB0aGVyZSBpcyBubyBuZWVkIHRvIGNs
ZWFyIElCUlMgYW5kIGZsdXNoIHRoZSBzdG9yZSBidWZmZXJzDQpvbiB0aGUNCndheSBkb3duOyB3
ZSdyZSBtaWNyb3NlY29uZHMgYXdheSBmcm9tIGN1dHRpbmcgcG93ZXIuDQotLS04PC0tLQ0KDQp+
QW5kcmV3DQo=

