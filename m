Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11293372F26
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 19:48:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122651.231360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldz9F-0005b4-MT; Tue, 04 May 2021 17:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122651.231360; Tue, 04 May 2021 17:47:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldz9F-0005af-Im; Tue, 04 May 2021 17:47:53 +0000
Received: by outflank-mailman (input) for mailman id 122651;
 Tue, 04 May 2021 17:47:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Poa=J7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ldz9D-0005aX-Qn
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 17:47:51 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9957dda9-a73a-4c6b-8a05-587b76299324;
 Tue, 04 May 2021 17:47:50 +0000 (UTC)
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
X-Inumbo-ID: 9957dda9-a73a-4c6b-8a05-587b76299324
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620150470;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3VCWHNbh2yxzLC/u0igMuQk+qIam3UdIDz+UrWmvYm8=;
  b=eHKScAzM0u/QGwtxhZg5u/owVPn2RNbci3b754vL+0+SiZvmCj+4sSZu
   QRMXsvWvDat+YzokBu2f+kRLbEihAzoVkds2rMX62g8x4jcmIt1eaxPYY
   FAV6NUwH4Rgx38jrCASc9wFozGmsnp52dlJg44ni8Scw3K1MWaOwGMywz
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Xu46TS6FTTbKhTA6PIZWl3g/Un9KqRc3YSfevXA1XMvIHQp21aPrAg/+n8MxS5GSxXZXYA4093
 JkB0Hn+iq67NdcG4V0KZ9lho13sEbWGlGTXZerCWFBfqs4mHZeUcEkkBDUP+ow7+PSOduGI0Rc
 HXObh9YThcFPU4O3KYz8PjbnbiW3+jfvlgGMMhVM/w4AEHGvUyd2ROtlJKiExYA32TgcB/z748
 OeB1ypKz7J92XhKBFOhCS6c6/HyaHD/2spGj5eJUm1fJN+I1zDUGLRCSiRTqDtl2cmVeSbPukb
 p6I=
X-SBRS: 5.1
X-MesageID: 43046289
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:0I5MKKEkvtFvuHVopLqFR5TXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7L0/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeOJwTXzcQY76
 tpdsFFZOHYJURmjMr8/QmzG8shxt7Cy6yzmeLC1R5WLT1CQYsI1XYcNi+wFEpqSA5aQb8wE5
 SB7sRKzgDQB0g/RMK9G3UDQqz/vNXNjp3relorABQg5QmIg1qTmcHHOjKf2QoTVC4K/Kc6/Q
 H+4nDEz4iAk9X+8B/T0GfP849b8eGB9vJvDNGB4/JlUQnEpR2vYO1aKtu/lRAz5Nqi8VM71O
 TLyi1QQvhbz1P0UiWLrQD22w/muQxemUPK7VODm3PsrYjYaVsBerJ8rLlUeBfY9EYs1esUuM
 kgshP7xvgneS/opyjz68PFUBtnjCOP0B0fuNUekmBFVs8mYKJRxLZvj399KosKHy7x9ekcYZ
 BTJfzbjcwmFG+yU2rUpS1GztCqQx0Ib227a3lHkMmU3z9KpWt+3ksVyecO901whK4Vet1q4f
 /JPb9vk6wLZsgKbbhlDONEesevDHfRKCi8fl66EBDCLuUqKnjNo5n47PEc4/yrQoUByN8XlI
 7aWF1VmGYucyvVeIyz9awO1iqIbHS2XDzrxM0bzYN+oKfASL3iNjDGYEwykuO7ys9vQPHzar
 KWAtZ7EvXjJWzhFcJixAvlQaRfLnEYTYk8pss7YVSTucjGQ7ea9dDzQbL2Hv7AADwkUmTwDj
 8oRz7oPvhN6UitRzvWmx7Ud3TxelHu3J55HaTAltJjjLQlB8lpiEw4mF657saEJXlpqaotZn
 ZzJ7vhj+eaqACNjCH1xlQsHiAYIlde4b3mXX8PjxQNKVnIfbEKvMjaXWhT2XCANyJuVs++Kn
 8Ym31HvYaMa7CAzyErDNyqdkiAiWEImX6MR5AA3oqO+NniYZF9Kpo9QqR+GUHqGnVO6EZXgV
 YGTDVBal7UFzvoh6ngpocTHvvje951hxruB9VVp3LZvUC1vtouWXMfYj6rXaes8EMTbgsRom
 c0374UgbKGlzrqA3A4mv4EPFpFb3nSPKhLFz2fZIJfmqnifSZ5SWviv03CtzgDPk7Rs2kCjG
 3oKiOZPdXGGEBUtHxj3qH2y19sbWmGc0Vsand1jJ1lGQ39ywNO+N7OQpD2/3qaa1MEzO1YCj
 3DbDcICi5Fxty81neu6Xu/PERj4q9rEv3WDbwlfb2W52ikL5eQk7oaW9VO+ox+CdzouugXcO
 6WdgOPNgnkA+cx1wH9nAd8BABE7F0f1d/40hzs62a1mEMlCf3JOVJ8WvU1Jcqf42WMfYfB7L
 xJyfYO+c2+PWX6ZoTYleX5bztfJgjSpmDzZecyspxQtb8zsrw2P5Sza0q/6Fh3mDEFaOHznw
 ciZY4+xpbrEIpmZdYTdCJU5UBBrqXEEGIb9ijNRtYjdlQshULBN9yH47D0uaMia3fx0zfYCB
 26yWlh5P/LUCuI6K4CB48xKWpQblIg6H4KxpLKS6TgTCGrffpE5ly0LzuUd6JcUrGMHdwr31
 pHyuDNu++cbCzj3g/M+RN9P6JV6m6iBee/GhiFF+IN09u0Pz238+SXyf/2qDf8Uj2gbUsEwa
 VDaEwLd8xGzgAYs7df6Fn4doXH5mQ/k1Vf5jl7llninqieiV2rbH1uAEn+mZVZXT5aL36Sq9
 /KmNLoj0jA3A==
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="43046289"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIgS6//X48sLEFDEdV6/IzkrbYAy+cEWgENg+HlPh2UrPr7UQTJ8wT2QR1ZEjgyHdEKnkeV9+S/I+ugOtP2OIyOa4v5qAw8XCqriO+rtvHa9i2b74/lfls/DUJiFMv1Xqw249CR5c8GDabVhbahBN8+z7sjImSj44xItbpQMgR8bwFcqeKefVR4M5b6Tk750qLeV39t4yC4piz5zACmF/SWKQo4KVfuweyqEUMAdZNJkyvAZ0MGIITD9XXkbW+XxBRYMXhyGNQCHEn+o4j7uqyPgM9IEs3AauIlG2Bgyvg29IAuRLPrnWYd+YTQHaPnanwl5Z0dgXHf7YM2tXhaeWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kS+af/9wuEjAZ5jXY0405C5CYjrYskh69LYhnX2usEg=;
 b=ceAq+7UuYIit97h5Qbtapee0DE3XvBj2AhC1DTNP9wYJRxsBhSUcH5BLDn7L5MW/Rz5boIbjGu+Wrkgqd/bNqLClvqcBySQiIwMiIhab9wQRVSt8H5aSAPc2o8T1HKUdYS4brwuN6QhTRUtXsDF9lCw1DWSQwyWRwMxYYLNWrNJxgcaTbEPwVYkJjcSxxHp/BH9Ehag2pndGxVgjkiiu8sRdySmAYsEIxscPgosryDh8CCCQcveozoXPpjDt77xBjpd7uKTRfTMxghVtYQNcuOFYUyKBThwmbJlUkaUFiv92/s98OVZEzGjnSIIukm5oA3VqKOgR1Qt7OQBtUiI5Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kS+af/9wuEjAZ5jXY0405C5CYjrYskh69LYhnX2usEg=;
 b=fyg+FNYNexje7nNHVFhXXS8z2HuTGhYCyZRDrHYCYfOQVhkd5n7kOvQym+IzHSs1U1afW9PzBNLevGa5i2EJTevgx4AaCXsOhdl2ZK9CbgwjHIOqp7y4Hu44vKWhoEwsBkm2MFeHRg3mgAl64GU2tbvcSgg5HCVPd1GRX+IUeKc=
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20210504135021.8394-1-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1] tools: fix incorrect suggestions for XENCONSOLED_TRACE
 on FreeBSD
Message-ID: <c71658e6-422b-4852-6d21-4688d09d8b8e@citrix.com>
Date: Tue, 4 May 2021 18:47:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210504135021.8394-1-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0420.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9019baf-ea8f-485f-a021-08d90f24ac47
X-MS-TrafficTypeDiagnostic: BYAPR03MB4296:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4296B299C37170F3FB2D21FBBA5A9@BYAPR03MB4296.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Eb4beTQgTJG8JVgQj593PXY4Nnwi6yw+XBCuCVUa73yIvBN7o0EnLMeMsl0O+6dp8yCq44M7kDDnGnco3sU1oGS1L5vKQLjF3SBlRFhQE8qjfTUWySDWudj0AF1y+2kEgNpOTxU0pC6BA7J59wbIpoM0lZKxRmSPhGCy1PxDgg43kSrBbKdweey9fzosDerEXa0wBqJW3NoQFL5FVCXDTwYYYT1lWejpJjOmrX7fCmz9Wyy3gYetC6j+nfrlSSFVTIc883WPO3DQxwKKvUJUKN9uhz31Ax39R4NC8OQ1PfCYIkR4FKBn1aT9Uv+3BCTDVgwXPqT45WRpxTDA8GTnnmVdb4PcbLU8t1Rtt1YfnIdGAtOqXWYIV9mUQMFsxXw9j02FE2h1X6m4o+6S7h7eZXZbvJsUBc3oIANSO65nVRhfG8Ak7rI64KdA6/nlFSMobyQXgvFv2/eBY+6lZWYK7mh/xbUJg+SLK/BwyLJO9Sl/a571HMG0qlGRFHWtIJbyVwLGW4Kb1PvOKxxd2E18+Zw74+xoYUyHkwFw77HNFrxy8gVrDOv1TL8UuJff2VBwcZVjgrDPvq6yZ4a7I50WsoOs7VVlwmTKaqo8FexN7RoTJjme2P9L/HHjGA7jkvLU5XOgYE+I/CZ5cv3O75wd7xQ3V5TZJBnhB6mvifCddG0sMx6JOo0Lw3YhNNNM055
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(396003)(376002)(39850400004)(66556008)(66476007)(38100700002)(8936002)(6486002)(2616005)(956004)(31696002)(16576012)(54906003)(316002)(478600001)(107886003)(6666004)(5660300002)(31686004)(26005)(36756003)(186003)(83380400001)(16526019)(4326008)(2906002)(86362001)(8676002)(53546011)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cGIwS2ttczRqVE5KYjBXS3ViRTNEdVFJdkxwM3Fka2hTR2ZXRUozYzg0bjBD?=
 =?utf-8?B?RXpXZ1ZtMTFET1Nua0NQUWVuMlRwcVl5WDg4bm81dG4va2Nzck9NZkE5K3ZD?=
 =?utf-8?B?Y1c2MXVQZ3RVanpTNTQ5K3ZBSUVvMGNVa2QyV0JSM1dYeTJ6dVRmMjdMaU5r?=
 =?utf-8?B?aEdoaVlac095RzFpZEJOSWNESFR4RjF6aUNvNGVtVnl0MlpkNXBuTFdnWHRx?=
 =?utf-8?B?c3F4VDFyTnNXQVVsd21kYnpyOGdGSFdDTkxHU0lGM2V5UnQ5ZkNqeEQ5MERy?=
 =?utf-8?B?WFl5N2xmNXJ1aCtsenNDVzZMcVgySlB6eGFlRWlRTlJScC9SUzQ2ZTgva29T?=
 =?utf-8?B?anFmVzVkTnJIaCs2RkUwUGFYNC91SFhUcXJCNkJEWjlIL01GSFdUelBWZ1Nq?=
 =?utf-8?B?d2gvNnlkTERSMEJBM2VaQkFyaEhwNytNWURneUhQZHBpOFljVW93MUFUV2Iw?=
 =?utf-8?B?SGxSa0NROUZtU0lDRlJiOThvdERHTEJyYW9zOTVBR29ocTZFdXNSWk10bGMv?=
 =?utf-8?B?YkRWeFJCV3hYN0hWLzN1dG94cmtManJDbmxiZlBiSm5MTmp2RDF2UTEwMnk3?=
 =?utf-8?B?cFAxeWl5TThyQVlESHJJZ0wxWUdqelByQXdXNmxEU1pLUWhhVVhFaDhSVmZs?=
 =?utf-8?B?YVRWdUtqbDdFU2ZBWlMxTkNIWGFhdzQzVXFpeXhud00vMWNQWldyRUVMTXhW?=
 =?utf-8?B?cmQ2ZXpHdEg2aGo4SnBuQW5ERjdNL0ZVVWI1RmFiT3B5MlNvS3pKeE9SR0Ja?=
 =?utf-8?B?SVBJeGkzQURXL05pcGhGLzdZOFg0MWZxMjYvcm1yVTJvd1pENVVMREx4VERJ?=
 =?utf-8?B?K2hUS1A4dExUcFNQSlY0aUJRM1FoNDNxcFRDZkZMd252RG9nclpmMVc1YWx6?=
 =?utf-8?B?N210c2pZMFdFWnplQ21rRVFCNDNKM0Y0QlZJeWN0SHg5L2t6M1dSRnJSY2Ry?=
 =?utf-8?B?THRLNkROdlFIN1lPMXBVTTFVSTNSYlltNjFyVHpWNjNwcm8xMVp6YnhLdXpY?=
 =?utf-8?B?YjUzMHhGbFNOMkNDSGliMERBbjBDN1FBZGJVWDhYalRaRmVWU0RwQXZjOFc1?=
 =?utf-8?B?WW5rb0hoRUZhcURTNlo0L2dZL0JnWHM3R09FdnZZNnhqQ2lSRmdabStwSC9s?=
 =?utf-8?B?cmFIZ0l3Q3NaV3dmcmo3RldSRmx6bHkwWkZncUtYdEhTVlZTazg5K1lidmw3?=
 =?utf-8?B?ZHF3ZHpnWlduYTZaZ3k2UnZJbHlYbFE5Qlgzc21wZTZjZElJcGlEOHNCNnFM?=
 =?utf-8?B?WEdGazBNTHAwM285akY3YkVwMC9ibmJBUTFhaitjL2pjVHVNTitjUVJZd3Bj?=
 =?utf-8?B?MHBzY2pWVEJ0RmZHVjh0ZWNoVXpPNUJyaDE1SjJ6em91Y1dkb3ljL0t0aHh4?=
 =?utf-8?B?bDZBcXM5Sm81THlhdVlucVFpT05UVHZhTTl6NDZRTXVYSWIwZHhLUlgvbU1L?=
 =?utf-8?B?ZGpTaDcweE1FdTlZRzdtYmJ2bUUzaTgzNldNSEp5N2pWbTEvV2FXUnBWL3lE?=
 =?utf-8?B?RGE5UFhQMU9KV3YvcHdnclV5d24yRGh1bmY4OXhMdlFuRlRkR0c3Z1B0RnM4?=
 =?utf-8?B?cjNUVmpTRFBXYUtOTjdXbk5mK0FYZUo4YlhnM0pqWW9tSlhPN1gvK1JVN1ph?=
 =?utf-8?B?ckhqUS9hZEZoTkFyM3cvSEE3d2V3VGxuOUdhUFBiSThkU0FSVnFsbTk2QkRw?=
 =?utf-8?B?R29vNVJGZUJPLzFTcTRHUVNCU3JSVXVGdCtjcFBZeTJaYW1FcHdacU84V0Y2?=
 =?utf-8?Q?iX/MjeBoQoJUsszmb9TD1iuaXC/gBJTVH+hK+as?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9019baf-ea8f-485f-a021-08d90f24ac47
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 17:47:23.5838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dT1CMMwoWLAsnJf8ovsnlR2KlawB1V7e7xMFKNMM+wSIKNPfS4YVoucFjM/lJV0ogf2/pxB62h/R/VhIHkjIRoU9OueTTkW4P8GY3xceEdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4296
X-OriginatorOrg: citrix.com

On 04/05/2021 14:50, Olaf Hering wrote:
> --log does not take a file, it specifies what is supposed to be logged.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>.=C2=A0 That said, ...

> ---
>  tools/hotplug/FreeBSD/rc.d/xencommons.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/hotplug/FreeBSD/rc.d/xencommons.in b/tools/hotplug/Fre=
eBSD/rc.d/xencommons.in
> index ccd5a9b055..36dd717944 100644
> --- a/tools/hotplug/FreeBSD/rc.d/xencommons.in
> +++ b/tools/hotplug/FreeBSD/rc.d/xencommons.in
> @@ -23,7 +23,7 @@ required_files=3D"/dev/xen/xenstored"
> =20
>  XENSTORED_PIDFILE=3D"@XEN_RUN_DIR@/xenstored.pid"
>  XENCONSOLED_PIDFILE=3D"@XEN_RUN_DIR@/xenconsoled.pid"
> -#XENCONSOLED_TRACE=3D"@XEN_LOG_DIR@/xenconsole-trace.log"
> +#XENCONSOLED_TRACE=3D"none|guest|hv|all"
>  #XENSTORED_TRACE=3D"@XEN_LOG_DIR@/xen/xenstore-trace.log"

It would probably be clearer to untangle these in one go, leaving the
result looking like:

XENCONSOLED_PIDFILE=3D"@XEN_RUN_DIR@/xenconsoled.pid"
#XENCONSOLED_TRACE=3D"none|guest|hv|all"

XENSTORED_PIDFILE=3D"@XEN_RUN_DIR@/xenstored.pid"
#XENSTORED_TRACE=3D"@XEN_LOG_DIR@/xen/xenstore-trace.log"

I'd also be tempted to fold this and the NetBSD change together.=C2=A0 It's
not as if these bugfixes are distro-specific.


It looks like a bug in NetBSD in c/s 2e8644e1d90, which was copied into
FreeBSD by c/s 5dcdb2bf569.=C2=A0 (P.S. Sorry Roger - both your bugs,
starting from a decade ago).=C2=A0 It really is idiotic that we've got a
commonly named *_TRACE variable with totally different semantics for the
two daemons.=C2=A0 Then again, its far too late to fix this :(

~Andrew


