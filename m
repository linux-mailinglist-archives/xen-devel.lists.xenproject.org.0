Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A44384DB939
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 21:14:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291275.494283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUa1f-000531-H6; Wed, 16 Mar 2022 20:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291275.494283; Wed, 16 Mar 2022 20:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUa1f-00050w-Du; Wed, 16 Mar 2022 20:13:43 +0000
Received: by outflank-mailman (input) for mailman id 291275;
 Wed, 16 Mar 2022 20:13:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SsrA=T3=citrix.com=prvs=067c1f106=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nUa1d-00050q-O6
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 20:13:41 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 911de443-a565-11ec-8eba-a37418f5ba1a;
 Wed, 16 Mar 2022 21:13:40 +0100 (CET)
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
X-Inumbo-ID: 911de443-a565-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647461620;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=OhaY+uVYpEHCSCw5BSSoElCvVNP506Gsq8VSkbZbBjA=;
  b=CDFQ/DrsoBYnf6ILGIBCN4nIvT5etNqdQPCVixlOc9DoD8+EMETBYWGG
   7Ngjj0Zm6bUGbNtc41NA7EJtIpDXvXZyryOYGsjHL18e59XG0DtWryMgn
   5vAC2WAFKMmErKm+/zslmoi6ZNva85vwHeIqe32KFTDCChEzbDeYaxU0k
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66429712
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:v2jFhq9KJjqRTvJ0/xgYDrUDvX6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 WsZX2iDbvaKamP2coh0O4Xj9UgFuMXUn9VkQFY9+Xo8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oHnW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZCuayIXJ6eXofQAcDJaNhwlEPQc4LCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ZRFM2swNU6ojxtnZ1UwJbgwn/+TvkL6MHpCtEnLu48H/D2GpOB2+Oe0a4eEEjCQfu1Ql1ydr
 3jL/Ez4BA8bL92VzTeZ8nOqifTLlCm9U4UXfJWo+/gvjFCNy2g7DBwNSUD9sfS/klS5Wd9UN
 woT4CVGhao4+VGvT9L9dwalu3PCtRkZM/JPF8Uq5QfLzbDbizt1HUBdEGQHMoZ/8pZrG3p6j
 Tdlgu8FGxRjrp+wd2uXrY6EsBCZOw0odkJbPzcLGF5tD8bYnKk/iRfGT9BGGaGzj8HoFTyY/
 w1mvBTSlJ1I05dVivzTEUTvxmv1+8OXFlJdChD/BDrN0+9vWGKyi2VEA3D/5O0IEouWR0LpU
 JMsy5nHt7Bm4X1geUWwrAQx8FOBuq7t3N702wcH83wdG9KFoCbLkWd4um0WGauRGpxYEQIFm
 WeK0e+r2LddPWGxcYh8aJ+rBsIhwMDITIq5CaqFNIMUMsErLmdrGR2Cg2bLhggBd2B2zckC1
 WqzK57wXR7294w6pNZJewvt+eBynX1vrY8ibZv60w6mwdKjiI29Et843K+1Rrlhtsus+VyNm
 /4Gbpfi40gPAYXWP3iMmaZOfA9iEJTOLc2vwyChXrXYeVQO9aBII6K5/I7NjKQ+xvULzLiUp
 i/hMqKaoXKm7UD6xcyxQikLQJvkXIplrGJ9OiopPF2y3GMkb5rp56AaH6bbt5F8nAC/5ZaYl
 8U4Rvg=
IronPort-HdrOrdr: A9a23:vuCi460X2wSeJZHC0eQyuwqjBRxyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5AEtQ5OxpOMG7MBbhHQYc2/hfAV7QZnibhILOFvAt0WKC+UytJ8SazIBgPM
 hbAtFD4bHLfDtHZIPBkXOF+rUbsZi6GcKT9J/jJh5WJGkAAcAB0+46MHfhLqQffngcOXNTLu
 v52iMznUvHRZ1hVLXdOpBqZZmgm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYL6w
 H+4kzEz5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwizyveJ9qV9S5zXMISaCUmRQXee
 v30lMd1vdImjTsl6aO0F3QMjzboXMTArnZuAalaDXY0JTErXkBerV8bMpiA2XkAgwbzYtBOe
 twrhKkX9A8N2KwoA3to9fPTB1kjUyyvD4rlvMSlWVWVc8EZKZWtpF3xjIfLH4sJlOy1GkcKp
 gnMCgc3ocjTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2i5ozuNxd7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUKsHJ3XOoZjq56hd3pDhRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOtgvARW2sNA6dvP22J6IJzYEUaICbQxFrEmpe4PdIi89vd/HmZw
 ==
X-IronPort-AV: E=Sophos;i="5.90,187,1643691600"; 
   d="scan'208";a="66429712"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMEQGLWtIjtvtjtiZtB+Mt9kswHsve1bunLFQN6O8edYRRCW+orCW3j9U0eQm/Vrj76OIfJLvYIXVKq/r6bLyXp42dZAB64Fbdl2NiW1BHbZfkMYIRO3L5J70OP0DACOkIcdZzYQ4fqG0g6nBTx51a0xGC+h36KXGcg5fP8oLOn7vWKxIkvCIfPKMHW6EDy4Vn7Wqlt/EL+kBfLSsR/bL4jgNng3Be7GbSPY4QSkE+lEFqf1m+GteebyfSDj2Se5GNjuacDIsLxmZmqCIP3vh+hd2SB2Paqjf++ExeX5pHExFv0xRCOht7tQR/3SWxvSW6XYLo0txkrd/garOYgj4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhaY+uVYpEHCSCw5BSSoElCvVNP506Gsq8VSkbZbBjA=;
 b=e1xZUY5sjCvLxeooR6SvnZOQU6eddhRA25GPQp0WLW90qzdduRw3C82vlanmX1lHV33rwtkKBDhDjJANUbF751GbIYAF7HFcZk3QjPE1ut0vzrTHRqTM38V/0dhuMSFSNqARaJolsu9PKZjpNcRvz9CgSSEwfm/QTlZBUx2tVSBUDM44gga3oLzYNFrqjvVYGeMnxQZngfYzFGnfPMAecscuyMtaMpRqjEZwe1Z97Envj1/d9sLK2JAh/D+V1IKF2UgAJCyodeG2q7Po3whtfyShVL1L6Vc8TLTk6JqR7aa6CkMdUVe7AnMoWL/MUfCB7ZYioUy2fE5tv1ewqQT4nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhaY+uVYpEHCSCw5BSSoElCvVNP506Gsq8VSkbZbBjA=;
 b=fX34KUpqXzWAF74RBglVOLPEl2mz8lGw94H9wDyP4DB7bCuCt3hercY3sfRXMCLcw0mD6V0++YvCiU7N7oad41zp9nHAqx0XGOb3QcXu0WXru5/Ln076VW80lcSBdmarTIiTHUCEzgmBHexGlTcOtY33hfMd5k2aZ3ISePh1YwI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/cet: Clear IST supervisor token busy bits on S3
 resume
Thread-Topic: [PATCH] x86/cet: Clear IST supervisor token busy bits on S3
 resume
Thread-Index: AQHYN5LV95qT5IqqP0y7/NV/gPy3Uqy+7QsAgAOIboA=
Date: Wed, 16 Mar 2022 20:13:34 +0000
Message-ID: <d0296479-316c-07fa-c929-af75e3cfec66@citrix.com>
References: <20220314110034.28498-1-andrew.cooper3@citrix.com>
 <c542fbe6-8910-4dd3-aa6b-41af647c728e@suse.com>
In-Reply-To: <c542fbe6-8910-4dd3-aa6b-41af647c728e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fdda305b-6d5a-476f-3ce8-08da078972c3
x-ms-traffictypediagnostic: MN2PR03MB4640:EE_
x-microsoft-antispam-prvs: <MN2PR03MB46404B2FED6CD3C23D182B78BA119@MN2PR03MB4640.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gMNwUbyNMfVS7nAe3r3Pa2oZ2PFLHWoJBH60mxTDc8cpye4Hq0Mjr8J/ivRPGodExWJPAR7r5y7PhZ4ld82RY+0ointo7Jf2hEnn0j7b9P6HpUNAU1xMXxyxNeNWbHBxyvJVVkPYqnyigzayUEwWc9fo48II6VAHOrLOSKkZeYByc7sjsscvNwvGUsFS4uWnx++pNB1BNM2k8WUG1xrutt+4nSkMDvc2PchQSXKyzo5bVRbVMWENakHJvomMM1/XnjyLKIlsG3ZDeAOdGpNIPTwXLhW+LWvfVclqA5QEY27o2LCw+stEzo3Asswyn1ezrOUmJMCIb26Xofgnqp3/C1cYOSLVLpdpeEQjH8x8FVnT+isI1fGyb9HEnzJPa89+iWDTsoCq0RFzjWmEdjBwkhl3zlrmmsOM61pLMtQqRXHC3QtpMTy1wqQugegaTYFSbC35unrjPr3J4AAEFmqRZB8wqwirTQdUVZgFhdfSLJgTJM/uNpn96dVyis4x1htyFgJBzGZWe6WHEhq8B+lp2FtbUAsJpovaEnHT4VhLPHUNFyISm38qVYZkpilitR3buTGu6WSz7k5IYviWGjrtU9ZCcVt+ydW5V7sJKsXQyi2qRbyASW9V/0eTBKWlJfHvUDgVKqGvFrGr/7saGYig7N8toovOvUTfK39tAWT6VjkLHmJisFqNHm+VQ6FrCn3zJ5xwphmn7KMvIGklTqvcLZa5LQtzKWcxS/RHdtcHMfjNnrHbGOhC8SWQULsM7OLTID2osC1c90fhXuTtfGvTXU4+qcVkZA21SoJpFEadml2crRzfPWg5RsO+WKRYyd1vO3saSof1yN5KLUX0LP7vaAkCeUHUO7v/7Ei38kcAlQtpLZkoRjlTski9k3yinzdq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(2906002)(6916009)(54906003)(38070700005)(4326008)(8676002)(26005)(186003)(31686004)(31696002)(86362001)(71200400001)(316002)(122000001)(36756003)(82960400001)(38100700002)(6486002)(64756008)(66556008)(91956017)(5660300002)(83380400001)(76116006)(66446008)(66946007)(66476007)(2616005)(6512007)(508600001)(53546011)(6506007)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGtseExrMUJmeGZiaVpNODJwc0RJZnErek9NdDYyZyt4MXNEclNWQitELzdm?=
 =?utf-8?B?Zkc0OTZVMUgvNDBibjFJcDFPZDcwRGMwa0hRc0Noa3FRaGF5bmFFN001SnV0?=
 =?utf-8?B?Ry8xcjIxTGlBdHFxeUQvaU1jRk8yU1dWOUxQT2J3dldmZ0VyRVhlRXdTTWY2?=
 =?utf-8?B?aXBYQlpsWi9QcGhvdFdac1NGa2RTNVJSQzNvZDJxY3Q4SEIyVXl5UXFWY041?=
 =?utf-8?B?amQrQWhaRnpVWk9Xd3Bxd3pIYVYwdWdZd3VOdzRnNTJyUzZXKytUK0FTZXIx?=
 =?utf-8?B?SU93QlBpM0JDOXRtYWovcUs4bUh1VUdFQ2RHOFlRUmd1TEs1ZTN3RGhodGE2?=
 =?utf-8?B?SHdnU0pTK3V6Z29GZnp3U0wxWWVnQ21yOHk0UERWd0VtV3lLOHRiTWxWaDZs?=
 =?utf-8?B?UGxTeTBlY0QvTXAxRHllMjR1QlEyODlFcUlURkFCQlV3c1JvWVF4SlU2UjVr?=
 =?utf-8?B?NmxlQkJ2SnhQSUllQTBnZFJRNGZWcnB3TkhqcldZY3I2YXZKUFhCZjlNckpx?=
 =?utf-8?B?UU5CTmdJUkxacXdDdHd3bEpSdGhPWStGMHhxMHZiYnFnWUNzTW9iMUc2Q3pm?=
 =?utf-8?B?MU9wcFpMK2R6WVJYanRjQ04xTE1VcjJUSWc1ZDRiQXozTldaQ3l0bFBFYmpB?=
 =?utf-8?B?QzcwTjdYeURmZUZCWTE0bXBONXZwQnhYT1hBbklRMDBsT0hmdkRiMm51L3Zn?=
 =?utf-8?B?ZFhRZXA2MkJXM1NLUENwQy9DNHp1Y2tMa0VxYVY1VkVOZytrZUpVdGJ2TklD?=
 =?utf-8?B?aEdKNlU2TFZNcDgvbGoveFk1ZFd5RUJ6b0Q0TGQ0bGtYWUcyZ2xWZVpjNFVF?=
 =?utf-8?B?dWhLYUUvbklFakxOaG5DTXpnVGwycU9sTDQvTjJZR2QrNzNDT2RocXFnSXNj?=
 =?utf-8?B?bUtxSHB6K0RLL0tLb2xFc29KRUwrTlFrc0J4am5yblFWRy8zWWJDUXA4amxn?=
 =?utf-8?B?KzRzQk5pbkhFQ3BIa1VkMkIwOVhyU1lYQXAyQW9FWmZ6cXBKUjFNeWtZbWJ6?=
 =?utf-8?B?d3V4NVE1ZUI4eXVkbkRMZGJINzZ0U3pJM01vZFQySVVhc3pKMk9sbWQ2SW5G?=
 =?utf-8?B?SVJQeE5KNzVuUVRNRytFSkppYkxLMzlHK1VpbjB0ZUhOQ1lQbzdUWDdiUktO?=
 =?utf-8?B?RXBDS3RYc043Tlc1dU1ReGM3M3dmN05OeHpJQkJLOEk4MmtFdmlYYlV1Wm5I?=
 =?utf-8?B?KytxRHR5dS9GU2pLQlJ5WVp1RzdmelBTcnRKWWxIWG5aY0hUZUNjZ3ZpNkQz?=
 =?utf-8?B?OVc2TE9STHROU2Y2NXlsNUlwK2FTbkNGbmYwSHFzQWRPb29uWkxHa1JqRjZY?=
 =?utf-8?B?KzNtVDFxODRZemIyRmlFMkNmVDhsM3JRdXNWR0VUMDJhdHdEcUJGZnpVRlMy?=
 =?utf-8?B?MFJ3bU96MzNXOFN3U2piU0lTZWhaTlc4bWdST2xuQk1jZlJ4ZWR1eThPYW5r?=
 =?utf-8?B?cGgzOUliTHFEL3IvUUZsT0svdjNVRXNqWnNRZUxRcXJGbTUxbW9FUkpsMUY0?=
 =?utf-8?B?SVBJdUdlM2tsYmF5YXZ0Qjk1UkJrVUJDMStmRGU2WGxKY0dJQ2wxQlBuaEkw?=
 =?utf-8?B?WXA0Tng2Y0ZnK1pxU3VpQi9mUVRQWGltdU1SQlVNdFhESFE2VVQvM0Q2Zkxy?=
 =?utf-8?B?NEEvTmpHNkt5ZGovZmVsQmdWaUV4UTFDeHV0SlJmVkx3cHBwa2Zoc09qU2s1?=
 =?utf-8?B?aEVLaG00ZHFPU01SS3NCZ2xVeG9YV2lMTEg4QmlPd0hPaHhzZkZzQjBhRm1a?=
 =?utf-8?B?NUNFR21XM0o0d044eUJiRzIrRTA1N3pOSnh3U2lDeHhmWjBnTlMzbWc4cVFp?=
 =?utf-8?B?OXVFNFNGR2NkUzVqSzhKNUxwNUlYcmVVTWxqZGROcWFEeS9RdW8zdURSUFpI?=
 =?utf-8?B?ZEs3UkNJdnZyU3JLTVVuOHlhMnZQaXY1MWhtSmMxaFVWaW4ycnBNbHMvZi9u?=
 =?utf-8?Q?02+Ub0y/ctmVQZ8Zom0Vz5/hG+2CqPQK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B494C0720114EC4DA9C591BF977511E6@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdda305b-6d5a-476f-3ce8-08da078972c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2022 20:13:34.2720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X1Wrc7Cc2JzOAe+7k4ZJQU7kFWWySVvm3XsbLS95GTyI4Qtyk3iTjOc+YFSyn2rn7kqTTe9P+zjNN5KgNoDlVqMg8WInfh3iw9p45UW3TiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4640
X-OriginatorOrg: citrix.com

T24gMTQvMDMvMjAyMiAxNDoxNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE0LjAzLjIwMjIg
MTI6MDAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBTdGFja3MgYXJlIG5vdCBmcmVlZCBhY3Jv
c3MgUzMuICBFeGVjdXRpb24ganVzdCBzdG9wcywgbGVhdmluZyBzdXBlcnZpc29yDQo+PiB0b2tl
biBidXN5IGJpdHMgYWN0aXZlLiAgRml4aW5nIHRoaXMgZm9yIHRoZSBwcmltYXJ5IHNoYWRvdyBz
dGFjayB3YXMgZG9uZQ0KPj4gcHJldmlvdXNseSwgYnV0IHRoZXJlIGlzIGEgKHJhcmUpIHJpc2sg
dGhhdCBhbiBJU1QgdG9rZW4gaXMgbGVmdCBidXN5IHRvby4NCj4+IFRoaXMgd2lsbCBtYW5pZmVz
dCBhcyAjREYgbmV4dCB0aW1lIHRoZSBJU1QgdmVjdG9yIGdldHMgdXNlZC4NCj4gVW5kZXIgd2hh
dCAocmFyZSkgY29uZGl0aW9uIHdvdWxkIHRoaXMgaGFwcGVuPyBUaGUgb25seSBzY2VuYXJpbyBJ
IGNvdWxkDQo+IGNvbWUgdXAgd2l0aCAod2hpY2ggd291bGRuJ3QgcmVzdWx0IGluIGEgY3Jhc2gg
YW55d2F5KSBpcyB0aGUgTk1JIHdhdGNoZG9nDQo+IGhpdHRpbmcgYWZ0ZXIgYSBDUFUgd2FzIGFs
cmVhZHkgdGFrZW4gb2ZmbGluZSwgYW5kIHRoZSBoYW5kbGVyIG5vdA0KPiBtYW5hZ2luZyB0byBj
b21wbGV0ZSBiZWZvcmUgcG93ZXIgaXMgY3V0LiBJIHRoaW5rIGl0IHdvdWxkIGhlbHAgdG8gbWVu
dGlvbg0KPiBvbmUgc3VjaCBzcGVjaWZpYyBjYXNlLg0KDQpBbnkgTk1JLCBhbmQgYW55ICNNQy7C
oCBUaGV5J3JlIHRoZSBvbmx5IHR3byBJU1QgdmVjdG9ycyB3aGljaCBhcmUNCnRyaWdnZXJlZCBi
eSBvdXQtb2YtY29yZSBhY3Rpb25zLg0KDQojTUMgaW4gcGFydGljdWxhciBiZWNhdXNlIGV2ZW4g
TE1DRSBoaXRzIGJvdGggdGhyZWFkcy4NCg0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIveGVu
L2FyY2gveDg2L2luY2x1ZGUvYXNtL3Noc3RrLmgNCj4+IEBAIC0wLDAgKzEsNDYgQEANCj4+ICsv
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqDQo+PiArICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdh
cmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkNCj4+ICsgKiBpdCB1bmRl
ciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hl
ZCBieQ0KPj4gKyAqIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9u
IDIgb2YgdGhlIExpY2Vuc2UsIG9yDQo+PiArICogKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIg
dmVyc2lvbi4NCj4+ICsgKg0KPj4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0
aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLA0KPj4gKyAqIGJ1dCBXSVRIT1VUIEFOWSBX
QVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mDQo+PiArICogTUVS
Q0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRo
ZQ0KPj4gKyAqIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuDQo+
PiArICoNCj4+ICsgKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUg
R2VuZXJhbCBQdWJsaWMgTGljZW5zZQ0KPj4gKyAqIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBJ
ZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uDQo+PiArICoNCj4+ICsg
KiBDb3B5cmlnaHQgKGMpIDIwMjIgQ2l0cml4IFN5c3RlbXMgTHRkLg0KPj4gKyAqLw0KPj4gKyNp
Zm5kZWYgWEVOX0FTTV9TSFNUS19IDQo+PiArI2RlZmluZSBYRU5fQVNNX1NIU1RLX0gNCj4+ICsN
Cj4+ICsvKg0KPj4gKyAqIFJEU1NQIGlzIGEgbm9wIHdoZW4gc2hhZG93IHN0YWNrcyBhcmUgYWN0
aXZlLg0KPiBJIGd1ZXNzIHRoZXJlJ3MgYSAibm90IiBtaXNzaW5nIGhlcmUsIHN1cHBvcnRlZCBi
eSAuLi4NCj4NCj4+ICBBbHNvLCBTU1AgaGFzIGEgbWluaW11bQ0KPj4gKyAqIGFsaWdubWVudCBv
ZiA0IHdoaWNoIGVuZm9yY2VkIGJ5IGhhcmR3YXJlLg0KPj4gKyAqDQo+PiArICogV2UgbG9hZCAx
IGludG8gYSByZWdpc3RlciwgdGhlbiBSRFNTUC4gIElmIHNoYWRvdyBzdGFja3MgYXJlIG5vdCBh
Y3RpdmUsDQo+PiArICogUkRTU1AgaXMgYSBub3AsIGFuZCB0aGUgMSBpcyBwcmVzZXJ2ZWQuDQo+
IC4uLiB0aGlzLg0KDQpZZXMuDQoNCj4gIEFzIGFuIGFsdGVybmF0aXZlIEkgd291bGRuJ3QgbWlu
ZCBpZiB5b3UgcmVtb3ZlZCB0aGUgcmVkdW5kYW5jeS4NCj4gVGhlbg0KPiBSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpUaGFua3MuwqAgSSdsbCBzZWUgd2hh
dCBJIGNhbiB0byBkbyB0d2VhayB0aGUgd29yZGluZywgYnV0IHNlcGFyYXRpbmcgdGhlDQpzdGF0
ZW1lbnRzIG9mIGJlaGF2aW91ciBmcm9tIHRoZSBkZXNjcmlwdGlvbiBvZiB0aGUgbG9naWMgd2Fz
IGludGVudGlvbmFsLg0KDQp+QW5kcmV3DQo=

