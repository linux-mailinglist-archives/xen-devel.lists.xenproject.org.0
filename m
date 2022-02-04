Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 743AF4A9811
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 11:58:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265370.458726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFwHy-0007AP-7r; Fri, 04 Feb 2022 10:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265370.458726; Fri, 04 Feb 2022 10:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFwHy-00077o-47; Fri, 04 Feb 2022 10:58:02 +0000
Received: by outflank-mailman (input) for mailman id 265370;
 Fri, 04 Feb 2022 10:58:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=46ws=ST=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nFwHw-00077i-8E
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 10:58:00 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ee20772-85a9-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 11:57:58 +0100 (CET)
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
X-Inumbo-ID: 4ee20772-85a9-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643972277;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=OgOvysuyaITv+BlJ0XQ27OL1fJgus/Tep3gZgmDIyeo=;
  b=b9fLYJeYpSjXr1A6cdQSITtCJx2USssDn6cmZYI/Gf4DUgnj2glKkpI7
   aXIK5vptJXuTd8gTuik5vC/gQQqusgz8rqTaqFxf6h8xlhywM7e9hmx6/
   h5/pdZ6BkxRd5Fpef1Q9+CGTxdb8wsGzrVCCO+15e4An67zfOI2BfjtLw
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: T1E2g3GEJtu+whThmC8irrkPrAySNmfUzpryHD0wToOyBxG4WDP3WWxTttRg6EhHPBebucCYdr
 z/Qnl7RZ8accrwtIDrRAh5/TIOXY8cz1hSFH/ntmbKfMkP9q8p53r09nav6kSzQyaz+W/FWYhR
 pS5RnvcLH97MhPRy9/TftIT/7KYP/4cOGEPYxJ4glJ9NRT3LJVxs/MRgHmHDDn6KjF90hxTvkB
 HrvrXQqE4/YrQ8+mDgr7R3KcCwvEYMa1CXYjy+QI/fcFBlsyAhvqsa12F/bv/XaAyspO9zmeaQ
 r8Ugf4L1VX1+l3LCgpF3EEIX
X-SBRS: 5.1
X-MesageID: 62950546
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:v155+q5L2q0kRlWVDvRTwAxRtBrBchMFZxGqfqrLsTDasY5as4F+v
 mIbCj+EaamLYjOke98iPd/jp0hU7cXcmNFlTQQ5qyg9Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj2tIw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z0
 f5P7LCBET4TPqzxmPgZegYbDhFXIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgm1h25gTQai2i
 8wxYj1JRj3maE1zZngYNY4YsPiZhUHkfGgNwL6SjfVuuDWCpOBr65D1OcfRUsyHQ4NShEnwj
 kvc42n8NTQLO9WexCSt/2qlg6nEmiaTcIgfDqGi//hmxlia3HUOCQY+XEG+5/K+jyaWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8Ug4QGQzuzP4gCWBkANVDsHY9sj3OcIQjgt2
 k6MjsneLzVlu72ISlqQ7r6R6zi1PEA9L2UPeCsFRgst+MT4rcc4iRenZvFnHa2uh9v5AwbZx
 TyQsTM+jLUei80M/6ij9FWBiDWpzrDLUwo06wP/Tm+jqARja+aNQIil6kPS6/paG7qIVVmKv
 HUCmM+24fgHCNeGkynlaP4WALij6vKBMTvdqV1iBZ8s83Kq4XHLQGxLyGggfgEzaJ9CIGK3J
 h+I0e9M2HNNFGKBb/ZbUtqIMcQr8Kj8Ef36Fe3kR8UbN/CdazS71C1pYEeR2UXkn04tjbwzN
 P+nTCq8MZoJIf85lWTrHo/xxZdun3ljnj2LGfgX2jz6ieL2WZKDdVsS3LJihMgd5bjMngja+
 s032yCim0QGC72WjsU6HOcuwbE2wZoTWMieRy9/LLfrzu9a9IcJUaS5LVQJINQNokitvr2Ul
 kxRo2cBoLYFuVXJKB+RdldoY671UJB0oBoTZHJwZgbzhiZ+MN3wt8/zkqfbm5F9r4SPKtYvF
 5E4lzioWKwTGlwrBRxBBXUCkGCSXEvy3l/fV8ZUSDM+Y4RhV2T0FizMJWPSGN01JnPv76MW+
 uT4viuCGMZrb1kyXa7+NaP0p3vs7Cd1pQ6HdxaRSjWlUB63q9YCxu2YpqJfHvzg3j2Yl2bDi
 lbLXUxFzQQPyqdsmOT0aWm/h97BO8N1H1ZAHnmd6rCzNCLA+XGkz5MGW+GNFQ0xnkupkEl7T
 ekKnfz6LtMdm1NG79h1H7pxlPps7Nrzvb5KiA9jGSyTPVisD7phJFiA3NVO6fIRluMI51PuV
 xLd4MReNJWIJNjhTAwbKj06Y7nRzvoTgDTTs6g4eR2o+C9t8bObekxOJB3Q2jdFJb54Pdp9k
 +csscIb8SKljR8uPorUhyxY7T3UfHcBT78mptcRB4qy0lgnzVRLYJr9DC7q4c7QN4UQYxdye
 jLN3fjMnbVRwEbGYkEfL3mV0LoPn4kKtTBL0EQGewaDlO3ai6JlxxZW6zk2EFhYl00Vz+JpN
 2F3HERpPqHSrSxwjc1OUm3wSQFMABqVph74x1cTzTCLSkCpUirGLXEnOPbL90ccqjoOcj9e9
 bCe6WDkTTe1I52hgnpsARZo+675UNh81gzeg8T2Tc2KEq4zbSfhnqLzN3EDrAHqAJ9piUDKz
 QWwED2ctUEv2fYsnpAG
IronPort-HdrOrdr: A9a23:sLwFjaw5gFpO+aIxxr9jKrPxtuskLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9wYhEdcdDpAtjnfZr5z+8J3WB3B8bfYOCGghrTEGgG1+rfKlLbakjDH4JmpM
 Ndmu1FeaLN5DtB/LbHCWuDYq4dKbC8mcjC74qurAYOcegpUdAa0+4QMHfrLqQcfng+OXNWLu
 v62iIRzADQB0j/I/7LTEUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13zDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa3e
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0IXEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4Fi1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusqsq+SWnqLEwxg1MfguBFBh8Ib1K7qwk5y4OoOgFt7TBEJxBy/r1aop8CnKhNPaWsqd
 60dZiAr4s+PPP+W5gNc9vpcfHHeVAlfii8RV56AW6XXJ3vaEi94KIe3t0OlZWXkdozvd0PpK
 g=
X-IronPort-AV: E=Sophos;i="5.88,342,1635220800"; 
   d="scan'208";a="62950546"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDHC1C3VT3VITYOGbrTW7ibGcVdU/QiK5JLdgauyKeJbfpCUOBoYH31Z8BqqZagVn2ZTNj5/9lzjtj5OIJikymK9rvi1XHsYjdSb+aStTBNSgvdT2RFOZbDPZLMCalQexS1en6+ngT6UmsD3R8Ym2D3XBEpdW6XXhp0fljyGBy/wUfEcv9uXD+b2uCrzQaPawVsVdaveCu8B1Xa+Ko7g/helQ+bAHzWNmM4R4jpXYubUznD9eZZ1y/Lwd4K7FzLH0PvgXfOeMdeRS/PF1jj0cbs4v4//Ikpb6/ttsPLTsjImjCm/njpY3e141Luj5rvk2iWgIPkOnrzHA9/Pmhg9dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Ei6D6DYVxWsWl6EIOxM2w/fJrygwoeM3gINgQBcIx0=;
 b=EhwILJKM0SyCYJawGt+V/iMlyzslTaouP6YaBKlW1bKV/MS8pPwCWfs0Qx8laW5JaygI4+9NToL7SD+crfaEQZFK40JxfE88IaUD6BTDhyO5GmGytN5ERRVmwpb7aWobG3HsKt2E3R5lda5SnQNdAooh2VUkpojKDCFtWp7LyY2yOfKuidmA+rtPHvjF8BJoG0HhWTigShjUQhQhDi7ukl+moXt2Pe9OUoX38t4/Lom7TUaBv6wmFa0Gq6U80VUil+9Avrfj6iv7LnmS7opdyIsErmeOQnfLIGNNOwuWbUvdyHifrz8jdNT7KuQ1TRVJ/SGZk3rp23PREx46nehSow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Ei6D6DYVxWsWl6EIOxM2w/fJrygwoeM3gINgQBcIx0=;
 b=X9N3sGzi93L+Uw+VFtRYJCQsoCybMYhGqtwOpCsO71q8ybpRFgFwbVKyaOsMZPyXR0XBd/Bp5YyJVUQrGcqj/AK8wV4LhbauTwc47foYZ9QGGh3SabkDNvm4Zn8GI3L9EwKg5YRR9NlCY0jd+tTjGTE5KTkxlRkqvqRGVVxKeAY=
Date: Fri, 4 Feb 2022 11:57:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "paul@xen.org"
	<paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Message-ID: <Yf0Gml+2ERdcOJ5K@Air-de-Roger>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-4-andr2000@gmail.com>
 <7209889d-8f17-61cc-72a4-97f6dbc1d54d@suse.com>
 <2cf022f8-b000-11b7-c6b9-90a56bc6e2ea@epam.com>
 <04726915-f39f-9019-436e-4399533c9fc3@suse.com>
 <9ed3f4ac-0a2d-ed45-9872-7c3f356a469e@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ed3f4ac-0a2d-ed45-9872-7c3f356a469e@epam.com>
X-ClientProxiedBy: LO4P123CA0346.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ba98957-7902-4c21-4f9f-08d9e7cd26f2
X-MS-TrafficTypeDiagnostic: BYAPR03MB4118:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB41183792E8E1C748B9D9A05D8F299@BYAPR03MB4118.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C5WqvRA87nq2xG7Ok2wz9Ff3Sqeo0XUNSVl/nyX7XyJau4GZEFgMJPBWp+mIZ38BGmjaYKcbOOCwxCYSOiCmO3yvj4JAgHJ0ULHXf69jDltl2TkO4vpyTbVoR8hH3YrbYTKQMcFY11zolZ1xltd75MMcWCeZgwMbuV+FTbfuhVTXVyXxJYivsJo1vJ81mqi5zB+7RlTlPP1/OqF1YY9R3DhM1gDNKPPHcLys+jUjk3uLoE9MJJRnwrZaPUEF9Xzc6RHFA4Z8lV6in+YTbouqX6YZg/x5bGB7x2re4jQPcY/5JFUuUS8MFXmVPevXMoDXxZaY0qnZF1QptUm/1flwEOJLmSYckei5hgP5KsaejWRAorubhne+Uf1/S5482fvMRVR64YQ2Ebp8tpc4Vt7V6vFxeoaHGc2Lyv+sMRb8NvYZmitQvJ4Ggx/AJ4Kqs7u4zyOu2CTTeZ/SBUEjjDQsjZAQtXmeYWbk0YSx8xuXSBwMufBfJJt8niq/dL3zD0AgqLXYVFVgAHRApgaZW5WR2ViTKlzIgebdCCNyhSHJ3c9/eJpFo2UX/8JtrFjswAXNOnz0+ts38mAcFh/wJKe3d50EQ7Oz1ZCRpP9L/T08UbMfJsiHICoKhc1rGLgZpYVXbUwrWS4ndPhc543ewY/p4Mqa5MezHk/a5h8NPjkFEZSixj2ziOBCTdUux3B1UePFmB5ZV9gT7P3Q6Ujv4AOK2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6916009)(8676002)(8936002)(54906003)(4326008)(66476007)(6486002)(66556008)(66946007)(316002)(2906002)(6512007)(508600001)(86362001)(9686003)(6666004)(53546011)(7416002)(83380400001)(6506007)(5660300002)(33716001)(186003)(82960400001)(26005)(38100700002)(85182001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXVCUXVxbVF1elFkcnJzVzhBdXlqVkY4cWhQQ2tsSWpobWVMOVgybDNOeVhF?=
 =?utf-8?B?Ujh0TkIzWmZiODlJZEUxZkMrSmM3QUp4R3h1TXhrN2ZrR0ZZQTUwa3F3ajk5?=
 =?utf-8?B?ODVhcFMwT2FLQzJZRDJoU1lTVG1VWkZHWXFHUUNmR0QzVUtKK2NRVmVMZWRn?=
 =?utf-8?B?bEQra1FwN0dmZzlEVXJlMzdCSjBGODI4eXRKdnM0TmZzcjhzck50SXYrZnlw?=
 =?utf-8?B?bldraUhrV0N2czVzVld0RkRhR1N3ZnRsTzYyRmhvZGh2VWtrSXdmalhoRnYx?=
 =?utf-8?B?bm16MXdiUGFKTENrR1pwMk1tNmFySldxZFBmTjN3UlRCd3ZhZ2hteWQ2Qlp1?=
 =?utf-8?B?Tnh3UTczb3VlcVI0UVZlbStjQjEwWlpwWjgrS1ZyMng5QlNTV1NzUTNTSFNG?=
 =?utf-8?B?OXZRQ3MrK3R2SnFtVW5EVXJMRWoxOHdxRTF2L2p5SVNGWmtJaEw5WHB6VmUv?=
 =?utf-8?B?VHdpTUw4Z3lGQzQ2Z2Z5RnBJa1JyeERCS3l6TWdxRW9LVmVZcmRuYkZGd3Nw?=
 =?utf-8?B?NW9TM2VGMThib0xxSjcyZHc3Sm9CZU81d2hZNEdtc015WjVvc1k0YVdyNnMr?=
 =?utf-8?B?VnNJMjc3WXdCdExINmxwK0I5OE5Cc0wvTW9WSC9ZbkNqYnhpRWJtQTZ0Ykl1?=
 =?utf-8?B?N1luR2czQ2hLSVhLcXdRRzNFdlpWR20zU3o1ZEdVVzQ4ZDlwd2ZpZHJMVk9m?=
 =?utf-8?B?ZWFTN2FRWEN5Rm1LMUVxVXd6QWVuVFluM0dFMDFEd2g5KzV6WERjNWtQRWFF?=
 =?utf-8?B?Q2QxM2Mxdld4WWZaUGlGd296Rno1YXVZV3MzUk5qWTloclJIc1E4WWVTY2VH?=
 =?utf-8?B?NlNaR2hSMmJEQktlWHF2ZHV0SkptVlN2YWY5UFJGTFo2OFVja0tGV2V0aWhz?=
 =?utf-8?B?RytnSEpzUXl2YUcrL1hsOXZsTHMrZ0lEa2ZWV01TMUxRSmdvZnRWb0tHTW55?=
 =?utf-8?B?ZGUyWHJKZjVZVm9QY0lDODBObVByWW1hLzUrb0d5Yk8vT3E5OStQcWxaUVB5?=
 =?utf-8?B?R3BadUp6cU5FNGk0OVdIdjRPdWVUOW8rRVBSdm12V3RFSU1wNnhQaVR5WlR1?=
 =?utf-8?B?YmE4UjFiREVGbzBiemV3TUx6U1l1QlFzWDdlamZYMEwvYUphQ3hIbTRmV2l3?=
 =?utf-8?B?TU1zeUp4UXROcTBTRnZQdURxNXpPYzVXd3hBVytaOWxCcDM2S0hHSjhwam8x?=
 =?utf-8?B?QVlXYXJFaTBjMHcrdGw0NklqcTFkWXQ5NUJZR2gyeWVRWFc1aTA0NjlvMnhh?=
 =?utf-8?B?d28wUGFucWNRNFlFb1N6T3duM2VxS1lFWG93Z1lpRkNaSXJkY3JDYTFWMVZD?=
 =?utf-8?B?Rnl3VEtwYjArTDUrOVl3WmxUMVNyTC9vaTZHcW13SVcxWlBhMGZFa3VYVlVU?=
 =?utf-8?B?SzZPOGt0YjhwVm1QamhWTjZxcUpOaDd3NWgxYkZEdm51U3hPUGNYbXFoMVVB?=
 =?utf-8?B?OVU5T04zd1BIeVlTM2NURDhOMkx1cGlaY2RPWEEzMTdxdXpWaVY0OXlXcXVX?=
 =?utf-8?B?R1RsVWZVZXFXN0UzZStlbnJQTkg0alJBSGtLK0FhUkxLTWRmMTdCT2xQQUh0?=
 =?utf-8?B?N3oyQWJuNlBDbExkQ2xGN01KUDRYbDR6VktaKzgrTmtCUEhUa1pEOHRWRWk0?=
 =?utf-8?B?cEpTdjdYdHJ5Q1E5UVpiMmpjUFhhWHR3ajRQSjU3dnlGQWFnN3dxbXJ3YTVx?=
 =?utf-8?B?ODl0M2t4NXlrN3JpSkJqeVZSaWRvZWRSbCtJQVhjdnlBTE5zV2dRbksycGQ4?=
 =?utf-8?B?ejJtMk1MZGJXZEtkdzBUZmhnd1FDTC90YUQ4a211Sk01TXJJMzBnZDl1NzlH?=
 =?utf-8?B?SmFySk01aXkwZW95NWtFbTJ0cDExTERpTjZSVjRnM3YrZmN5RWZRU0pMVTg1?=
 =?utf-8?B?dW13dE5Pckd4YVFGQUVMTlNTbWdQbDJESmxCbmJIcS9RS0NYZXJtMnpiYXkw?=
 =?utf-8?B?cjFES3pZeVB6Y0FjRjhITjVJUWZOM01yRnNOdWlETnZVRE14VzFwU1F3ek01?=
 =?utf-8?B?Z1VkTGlLT3Y2ZjFrWmJ6SnMxMWdyVGJtUjRIMnZtTU9ueEQzZ01EcWZ2LzBq?=
 =?utf-8?B?TWRNUUFCRi80S0dMK0dhM0FzWUppUFJtaFJLWmZhdnJiU0x2czNIQjhUZjAz?=
 =?utf-8?B?R0w1cFpFVE1XR25YSlVsSFFYamdHdW1PS2FxV0ljZUpFK1EyNWxCR0loV2Uv?=
 =?utf-8?Q?ZmjIMm4EzQi5P0ZLc2gvARQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba98957-7902-4c21-4f9f-08d9e7cd26f2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 10:57:35.9079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KwVnEGpALDfUnSCGn1PmQj+izXrV5bPqkKUxlWRA5x0uNCEBMxLnN4RAaY1Cu435ZMXf8PvQIDmK3a92TH8iZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4118
X-OriginatorOrg: citrix.com

On Fri, Feb 04, 2022 at 10:12:46AM +0000, Oleksandr Andrushchenko wrote:
> Hi, Jan!
> 
> On 04.02.22 11:15, Jan Beulich wrote:
> > On 04.02.2022 09:58, Oleksandr Andrushchenko wrote:
> >> On 04.02.22 09:52, Jan Beulich wrote:
> >>> On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
> >>>> @@ -285,6 +286,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>>>                    continue;
> >>>>            }
> >>>>    
> >>>> +        spin_lock(&tmp->vpci_lock);
> >>>> +        if ( !tmp->vpci )
> >>>> +        {
> >>>> +            spin_unlock(&tmp->vpci_lock);
> >>>> +            continue;
> >>>> +        }
> >>>>            for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
> >>>>            {
> >>>>                const struct vpci_bar *bar = &tmp->vpci->header.bars[i];
> >>>> @@ -303,12 +310,14 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>>>                rc = rangeset_remove_range(mem, start, end);
> >>>>                if ( rc )
> >>>>                {
> >>>> +                spin_unlock(&tmp->vpci_lock);
> >>>>                    printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
> >>>>                           start, end, rc);
> >>>>                    rangeset_destroy(mem);
> >>>>                    return rc;
> >>>>                }
> >>>>            }
> >>>> +        spin_unlock(&tmp->vpci_lock);
> >>>>        }
> >>> At the first glance this simply looks like another unjustified (in the
> >>> description) change, as you're not converting anything here but you
> >>> actually add locking (and I realize this was there before, so I'm sorry
> >>> for not pointing this out earlier).
> >> Well, I thought that the description already has "...the lock can be
> >> used (and in a few cases is used right away) to check whether vpci
> >> is present" and this is enough for such uses as here.
> >>>    But then I wonder whether you
> >>> actually tested this, since I can't help getting the impression that
> >>> you're introducing a live-lock: The function is called from cmd_write()
> >>> and rom_write(), which in turn are called out of vpci_write(). Yet that
> >>> function already holds the lock, and the lock is not (currently)
> >>> recursive. (For the 3rd caller of the function - init_bars() - otoh
> >>> the locking looks to be entirely unnecessary.)
> >> Well, you are correct: if tmp != pdev then it is correct to acquire
> >> the lock. But if tmp == pdev and rom_only == true
> >> then we'll deadlock.
> >>
> >> It seems we need to have the locking conditional, e.g. only lock
> >> if tmp != pdev
> > Which will address the live-lock, but introduce ABBA deadlock potential
> > between the two locks.
> I am not sure I can suggest a better solution here
> @Roger, @Jan, could you please help here?

I think we could set the locking order based on the memory address of
the locks, ie:

if ( &tmp->vpci_lock < &pdev->vpci_lock )
{
    spin_unlock(&pdev->vpci_lock);
    spin_lock(&tmp->vpci_lock);
    spin_lock(&pdev->vpci_lock);
    if ( !pdev->vpci || &pdev->vpci->header != header )
        /* ERROR: vpci removed or recreated. */
}
else
    spin_lock(&tmp->vpci_lock);

That however creates a window where the address of the BARs on the
current device (pdev) could be changed, so the result of the mapping
might be skewed. I think the guest would only have itself to blame for
that, as changing the position of the BARs while toggling memory
decoding is not something sensible to do.

> >
> >>>> @@ -222,10 +239,10 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
> >>>>                break;
> >>>>            }
> >>>>    
> >>>> +        msix_put(msix);
> >>>>            return X86EMUL_OKAY;
> >>>>        }
> >>>>    
> >>>> -    spin_lock(&msix->pdev->vpci->lock);
> >>>>        entry = get_entry(msix, addr);
> >>>>        offset = addr & (PCI_MSIX_ENTRY_SIZE - 1);
> >>> You're increasing the locked region quite a bit here. If this is really
> >>> needed, it wants explaining. And if this is deemed acceptable as a
> >>> "side effect", it wants justifying or at least stating imo. Same for
> >>> msix_write() then, obviously.
> >> Yes, I do increase the locking region here, but the msix variable needs
> >> to be protected all the time, so it seems to be obvious that it remains
> >> under the lock
> > What does the msix variable have to do with the vPCI lock? If you see
> > a need to grow the locked region here, then surely this is independent
> > of your conversion of the lock, and hence wants to be a prereq fix
> > (which may in fact want/need backporting).
> First of all, the implementation of msix_get is wrong and needs to be:
> 
> /*
>   * Note: if vpci_msix found, then this function returns with
>   * pdev->vpci_lock held. Use msix_put to unlock.
>   */
> static struct vpci_msix *msix_get(const struct domain *d, unsigned long addr)
> {
>      struct vpci_msix *msix;
> 
>      list_for_each_entry ( msix, &d->arch.hvm.msix_tables, next )

Strictly speaking you would also need to introduce a lock here to
protect msix_tables.

This was all designed when hot-adding (or removing) PCI devices to the
domain wasn't supported.

>      {
>          const struct vpci_bar *bars;
>          unsigned int i;
> 
>          spin_lock(&msix->pdev->vpci_lock);
>          if ( !msix->pdev->vpci )
>          {
>              spin_unlock(&msix->pdev->vpci_lock);
>              continue;
>          }
> 
>          bars = msix->pdev->vpci->header.bars;
>          for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
>              if ( bars[msix->tables[i] & PCI_MSIX_BIRMASK].enabled &&
>                   VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, i) )
>                  return msix;
> 
>          spin_unlock(&msix->pdev->vpci_lock);
>      }
> 
>      return NULL;
> }
> 
> Then, both msix_{read|write} can dereference msix->pdev->vpci early,
> this is why Roger suggested we move to msix_{get|put} here.
> And yes, we grow the locked region here and yes this might want a
> prereq fix. Or just be fixed while at it.

Ideally yes, we would need a separate fix that introduced
msix_{get,put}, because the currently unlocked regions of
msix_{read,write} do access the BAR address fields, and doing so
without holding the vpci lock would be racy. I would expect that the
writing/reading of the addr field is done in a single instruction, so
it's unlikely to be a problem in practice. That's kind of similar to
the fact that modify_bars also accesses the addr and size fields of
remote BARs without taking the respective lock.

Once the lock is moved outside of the vpci struct and it's used to
assert that pdev->vpci is present then we do need to hold it while
accessing vpci, or else the struct could be removed under our feet.

Roger.

