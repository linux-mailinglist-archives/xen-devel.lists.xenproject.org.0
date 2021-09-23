Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE8B4159D2
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 10:10:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193480.344622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTJnn-0002nu-7n; Thu, 23 Sep 2021 08:09:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193480.344622; Thu, 23 Sep 2021 08:09:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTJnn-0002l8-3d; Thu, 23 Sep 2021 08:09:55 +0000
Received: by outflank-mailman (input) for mailman id 193480;
 Thu, 23 Sep 2021 08:09:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qmWf=ON=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mTJnm-0002l2-Hh
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 08:09:54 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a17c69ec-1c45-11ec-ba1b-12813bfff9fa;
 Thu, 23 Sep 2021 08:09:53 +0000 (UTC)
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
X-Inumbo-ID: a17c69ec-1c45-11ec-ba1b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632384593;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Ydpw2L3QYM2AIhLc1pzhasfeQz66ZGYQKxHkWjzM8FA=;
  b=SVgnbpjY+20WzW0pO7ZJTBtr+dElQRELGeKouJ+U4z110NBHZIT3Py7W
   uGrwWsnqa0Sms/6lvPVlp9ggO+v5vTfO/WfBO01uNTBSjmuXPxxy0BXOF
   7JGGzlvAl/R+6yYINU3iu2wVyjoTFuM+k606xpBvgdQ6q/hD1ULaer8qj
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +k7ryQpuop7DWC/lCqxNptHRWZGcu50pOP7z9X+/4+vEFMfy3WFh/IsemCPWKWTIzOFDSAadAV
 rDYF9n66BQsjeO4ukAPrU/YtGFdlEKt85y3qrMM5mxwhi5o19Bfq0VHENJcNSUWAeIYU3mzHY3
 Y6YHmHSmMShklMoD+daAXuPHD1Algo1ytUPmT3X8NkQhJuDZ07ZEQCIcsQzDpsgUQ53GRoq7+Y
 5NdT0eLEqljFRHeD+NmvdXK6pPyB5/17+Uk/tlkJ/A1WORAfnakMQ5S0qs0Y9Gm9HAJTDa/YHj
 5mOusDXC/kEfnFFDsOm9gC1W
X-SBRS: 5.1
X-MesageID: 53412025
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ZMGUVa7fn6arX6Pq8RaBPwxRtObAchMFZxGqfqrLsTDasY5as4F+v
 mtNDDjQPPiMZGejL95zO4/loxwHu5/cxtVrSgY4q3xjHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVIMpBsJ00o5wrZo2NUw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z6
 t5S6syKRgUQAYbUxONeUj1nMAVnFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgWxs35oWR6u2i
 8wxVTtjbRrYYwV0GHQJAbcloKSnuyDUbGgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6Iq
 2SD82nnDxUyMN2E1SHD4n+qnvXIny7wRMQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlamtQFDC+BfEdQFwxnRzenVxzm6InEtG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZnNIdzFqiTssCFJfuoi+/NhbYgfnE447eJNZmOEZDt0ZL
 9qilyE4m7xbpsoCzazTEbvv0m/0+8ChouLY4GzqsoOZAuFRONXNi2+AswGzARN8wGCxFALpU
 J8swZT20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4LumolfB8ybJxVKFcFh
 XM/XysLv/e/21PwMcdKj3+ZUZx2ncAM6/y/PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 /+mnTKXJS9CU8xPlWPuL89EiOND7n1ulAv7GMGgpzz6gOX2WZJgYepcWLd4Rrtit/3sTcS82
 4s3CvZmPD0FC7ChPnmLr9RDRb3IRFBiba3LRwVsXrfrCiJtGX07Cu+XxrUkeod/mL9SmPuO9
 Xa4MnK0AnKk7ZEeAQnVOH1ldp31WpNz8SAyMSA2ZA760Hk/e4e/qqwYcsJvL7Ug8eViy99yT
 uUEJJrcUqgeFGyf9mRPd4T5oaxjaA+v2VCEMR26bWVtZJVnXQHIpIPpJ1O96CkUAyOrnsIiu
 Ln8hBjDSJ8OSl06XsbbYf6i1X2run0ZlL4gVkfEOIALKk7t7JJrO2r6ifpue5MALhDKxz270
 QeKAEhH+bmR8tFtqNSQ3PKKtYakFed6D3F2JWiD4ObkLzTe80qi3ZREDLSCcwfCWT6m466lf
 +hUka3xaaVVgFZQvoNgOL931qZitcD3rrpXwwk4TnXGa1OnVuFpLnWchJQds6RMwvlSuBesW
 1LJ8d5fYO3bNMTgGV8XBQwkcuXciq1ExmiMtaw4cBfg+St63LubSkEDbRCDhRtUIKZxLI54k
 /wqv9Qb6lDnhxcnWjpcYvu4K4hYwqQ8bpga
IronPort-HdrOrdr: A9a23:kE/zuK76XJbwiFLZBgPXwVWBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc6AxwZJkh8erwXpVoZUmsiKKdgLNhR4tKOTOGhILGFvAG0WKP+UyFJ8S6zJ8g6U
 4CSdkONDSTNykDsS+S2mDReLxMsbr3ktHZuQ6d9QYXcegDUdAf0+4TMHfjLqQZfnggOXJvf6
 Dsmfav6gDQNEg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/josKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF7N2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuBelqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw3BjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXUd
 WGNPuspsq+TGnqKkww5gJUsZiRtzUIb1m7q3E5y4+oO2M8pgE/86MarPZv10vouqhNDaWtSo
 z/Q9BVfYp1P70rhJRGdZE8qPuMex/wqC33QRevyHTcZeo60iH22tTKCItc3pDcRHVP9upqpK
 j8
X-IronPort-AV: E=Sophos;i="5.85,316,1624334400"; 
   d="scan'208";a="53412025"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUUph1iSzCHqpYhBDmpGS8ISxDq9c2al3tZpOkxcBuYEA/bJKIZlA+pVuQSjWAy+uI9/AtmUYzfA19F7XC65AH2xRRVFe+xoGyi0vOPAQHkTuq6ViibA23kmcOCFxttYzGFJkbTj7f/nm03ZiP4CpnraDf5X3RvnLYC5zp8KpoDYrznDKT/9k0wWb1MRwHzI+IeLcxe6bHw8Rj9w1qC+AKSWpoz17IOA01re/0bBCIBj9Dxga0oa9K6FUumzkAOFXGfvYX4W+7cNRlZ5MV9lnKTfBUC0M4Z9jZ/gCaORvUj62a8jOkciI9F/m5JFCphNC13r7BpdOfG92AeA0igTYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=eBu4pcbXT29mhKOgwOyv523CUW4myLMsPAhueB0Ul0o=;
 b=NnHYa+2oN48WH9dZWvDA6OJTsfNMeiggYzPgCeOG5TdvBbEwo7NFBGtA2Ys4h2gHoh73SUX/65vqZrJZnYl4fdRG2XNB6HbyNa0+oTv+ImR9KMXOxYd8LZzqTVqBpBgw5Z/EH/+wNj8sbo4O0cEyw0EP0BgegR1jnusUJizDF0nwjBHnOlPJ9+xdmtRp5bF9mOJfAIhYhRcZhRCwNLB9xqpZa+ay3LvGvRp01nFs+rh0DRjekJ2Pf62rXf7qLCxtLmZj5YUT3d3FUwFoxXWuKkO0+IM1LRstufawXSKSbnJyr3Yf86s1CkNT7T8O5lqSwl10ysf6jAHSk5Xq9DT80Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBu4pcbXT29mhKOgwOyv523CUW4myLMsPAhueB0Ul0o=;
 b=gqfEPIRwM6dmmTUPtDS72wxDkMbfvI/Sv405Z2mmx0XDysBcE1FFAh5PMj3QOf0O8lS/49jUlj2qrgc5F3SrNt6nGMbPgv/yIDrtLXfxlgac89n6EC+mTrYHWwMrFPLpgIp8We9COW5fcy8rqvSUcPwkoxmPL08qmpcC4wbvaXI=
Date: Thu, 23 Sep 2021 10:09:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 6/9] x86/HVM: convert hvm_virtual_to_linear_addr() to
 be remote-capable
Message-ID: <YUw2RLtI73QNjaPE@MacBook-Air-de-Roger.local>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <3397b5ea-bc21-5a2c-ba5d-afc974a92df4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3397b5ea-bc21-5a2c-ba5d-afc974a92df4@suse.com>
X-ClientProxiedBy: LO4P123CA0309.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b43993ec-940f-418c-2395-08d97e6981ed
X-MS-TrafficTypeDiagnostic: DS7PR03MB5445:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB54458B13263CF5FB5B7F68188FA39@DS7PR03MB5445.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: be7NVAXHMjD5JPyGbSFVdIfZOYEwfJwNiIESUgHGq9gF3ASyg+JpSto2wF5uzmq/L3HLUbav9z9lkTI9gPcT9UZuOTPbfHIQPr8AhtGHGICWF6D3rxVmrXm4QhU5V59LkDEVFDk77ovFAhSlOfjjbwb4oW/s8Ielzh4urJRefdtUUh4gT4LkgbrGSRi5Lc/XvEQfOtc9Pvcbq45h8pOZwZO0g/g78NFRQSWDSNlIILFxZknHzkUK5cchExsdcKhK7A5ajYkR35WSc0kXCbejuxNhHVB1ycU2uwWKgaCOJwHN6eWYax6omWSaCaELOpl6eaUvnSA7ye2weKZfNj2Qk/Lt9gv+BAtAwCOLiPL24w7++03vFJKD3+FVLF50RZPaNmHTyivArGdoO7oRLGHDa87GPxtIE6pd5gREqAdstDODnEW7GcchezX9lDqnUe01tIs8vdAjB26U68fV1EeV/Qjth94ES3rEZdLxdpvgdYdlGRT3T2p6Ml9ZG2uMM0lxToxWNFoGI90da7I2jIF8VhcR6MdWVnjRcm51EgFCMWCZVv12W8BDtkXCg7SpEQvIXvgtJZhIZW7sk2d6OniEhdKHhbcIT6bg84yVjrRVxWEM5VsZryPwvUW/e4dy+cNn6H4+gx+NUfrnBsdg0QT+iQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(186003)(508600001)(6666004)(86362001)(38100700002)(26005)(83380400001)(85182001)(66946007)(66476007)(66556008)(8676002)(9686003)(4326008)(6916009)(6486002)(316002)(5660300002)(2906002)(54906003)(6496006)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXc5TG94UHlPcFV6T0hha2lYcXJpQ29iR0hXTnFpc0hrWWV3eGVnVFFZUytm?=
 =?utf-8?B?MS9aZEk4VGZsWElEWDNLTXFPZWVTMXlmMVhLdHZnM3R0WlVnSDJaVEhGWU5z?=
 =?utf-8?B?U3VNWHBxSktWVEkxTzA2d3ZwakYwVXdRMHcxaTFRL0g5K1hyS2hrTFk0OE1I?=
 =?utf-8?B?eVRNMkFOSDU1QlRiK2JHVi9VbXBLell4eXFDazcwY3VvTlFyKzNDZHV4QURP?=
 =?utf-8?B?QlFVTDBockRabWVzQXo5MGQzYWh1QlhOMVlJQmIwN1d2YUVVU1FkUVMxb1Jw?=
 =?utf-8?B?YVFvNnVydmpFNWM3Ryt4clM0VGpiSVZOaFNMa0VTK2FTRjlBeGF6Wkx2RGJO?=
 =?utf-8?B?VjZwUHhLSTYwZXZIS2VXZTNUZ3NVd0ZuWW04T1A0ZXJIbmdtbkdvZGprem1F?=
 =?utf-8?B?VzNzLzZyaE8zc2R5QXVRTnk0R21BcXlCY04vbWFYZlVieVN6QTYvUmVLZzZq?=
 =?utf-8?B?VGl0MzEzVmlzWmdGcWJub3U1NW5Pa2lGeFJRR0Z4OHBVY3g5YlJ1QjFYZjUx?=
 =?utf-8?B?VWQyc2RZMTR3a2U5S0c0d3NtRU5udTZ4YUN5RmdITlJlU2hpUGdKNkh2NXUx?=
 =?utf-8?B?bktnK0JRYlhpTEI5azVRNW5ZMkYzN0hzbFk5aDBTZXpjaG1vcEpOTXI4NTdS?=
 =?utf-8?B?SDc2R2kwY2J2Y0syTW1ZNHFyeFdkck9zek1HZWVUcmJPSXlDZHpRMGZsSkFp?=
 =?utf-8?B?WnEyMStmdkF0WTJ1NE9HNTFuV3E3OHFSbWg5ZkUzTE9rdmxpZUJQRTlwZ05C?=
 =?utf-8?B?bXRQRVpoQUxNajNFazFhREhOTVB5TGd4bUlydDlvc2VPeW1NV09uQ1dQQ0hv?=
 =?utf-8?B?dUJ2c1VxK2dJTElWZTd5QXRRMEgyMTduOTM4aVEzVnZNanBwSFN6V3VyZTBt?=
 =?utf-8?B?N01SM1d3dWdxQ3dtNm82Z0tobWJXV0FBa0FwaUJCWWtsK0VpZEp0cjNhWnF5?=
 =?utf-8?B?WmRvUG12cGYwYUsza1V2L0RCYkxXYVRkbVJmVUZEMW5aZXZtcUdBYTlMR3Vi?=
 =?utf-8?B?V3RTVHgzZDVDaU4vNnlUK1diMzFYeDJqRHI2Z3BiZFFGZmtYVFJneDJyR2sz?=
 =?utf-8?B?YldZZ0RINmdaTnRRU2lpMVVtZEdoZ0IvWXgrQnQveEkwWHZZekcxbFBybGpm?=
 =?utf-8?B?d1J3OSsrTTdPWXhFM3h0OXFtVkQwTTkvQk9pcXZYS3JlbG9uay9uNXVUZ0pi?=
 =?utf-8?B?bVlKRWxpeUJtM3dJdktCYVQvR0ZSUi9vUm8rRmt0aHhsZ0V6Zi9ybjlwazdI?=
 =?utf-8?B?Q2FZeHdDQVlIVmNtaGxTV1BLdHdtcDBDRmJ4SEowa2FVTFI4M2FBaFRKbDVl?=
 =?utf-8?B?UUJ4U09QamNIMGJSTDFwdEdGM04zbllqTDZneHhRaElwelVOaGppMHh6L0FT?=
 =?utf-8?B?RFgvTXNXcm1RNnN2U3FzYXlOVEMrV0MvZmZoSEh1cmZ0OWZCWFlHQkRQUUc5?=
 =?utf-8?B?WW1jNENLaHlaZi8wNzE4dHMzYTBZZjRkSVE4RnFiYTZkR21Cc2dJUTQvQ2Vr?=
 =?utf-8?B?WlovaDFRSWRxNDRoUHhXcE9ZNzZzL2FEZ1BJSUhEK2x0MitOV1NrYk1RY1Fy?=
 =?utf-8?B?MENGTGlYc0sveCthb2Jib1RNYTBjcGRWSEVaUmErbFQxVW1rcTRYRmhmMkg5?=
 =?utf-8?B?cTF6OHUvRHlBSFhxcWlReHhsVC9CS1plYUdweFJVNnJFcGY1MVhScjkxSllH?=
 =?utf-8?B?cExrMVQ3R1pFbCtIS3pHcG1NT3hsWnp2akgwelQ4Qk9aSENFQTFlMURONVpU?=
 =?utf-8?Q?ly2FiBMcaKV+l2KwiYhaHQ1ASrVFqTY4XMmQGlT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b43993ec-940f-418c-2395-08d97e6981ed
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 08:09:46.8353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y1p5vefj8KVo4ItfhP4vYfTeJYiU8D/JjT8WMGzWuv2AySsGkLyFtTx8QfoZZjxbO7XtBZSzt10V1QyUz5Npig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5445
X-OriginatorOrg: citrix.com

On Tue, Sep 21, 2021 at 09:19:37AM +0200, Jan Beulich wrote:
> While all present callers want to act on "current", stack dumping for
> HVM vCPU-s will require the function to be able to act on a remote vCPU.
> To avoid touching all present callers, convert the existing function to
> an inline wrapper around the extend new one.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Alternatively the actual dumping patch could avoid using this more
> elaborate function and, ignoring access checks, simply add in the SS
> segment base itself (if needed in the first place).
> ---
> v3: New.
> 
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -2526,7 +2526,8 @@ int hvm_set_cr4(unsigned long value, boo
>      return X86EMUL_OKAY;
>  }
>  
> -bool_t hvm_virtual_to_linear_addr(
> +bool hvm_vcpu_virtual_to_linear(
> +    struct vcpu *v,
>      enum x86_segment seg,
>      const struct segment_register *reg,
>      unsigned long offset,
> @@ -2535,8 +2536,9 @@ bool_t hvm_virtual_to_linear_addr(
>      const struct segment_register *active_cs,
>      unsigned long *linear_addr)
>  {
> -    const struct vcpu *curr = current;
>      unsigned long addr = offset, last_byte;
> +    const struct cpu_user_regs *regs = v == current ? guest_cpu_user_regs()
> +                                                    : &v->arch.user_regs;
>      bool_t okay = 0;

Since you change the function return type to bool, you should also
change the type of the returned variable IMO. It's just a two line
change.

Also is it worth adding some check that the remote vCPU is paused? Or
else you might get inconsistent results by using data that's stale  by
the time Xen acts on it.

Thanks, Roger.

