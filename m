Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 684EC417831
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 18:10:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195519.348264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTnmc-0004jv-GK; Fri, 24 Sep 2021 16:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195519.348264; Fri, 24 Sep 2021 16:10:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTnmc-0004hk-Bz; Fri, 24 Sep 2021 16:10:42 +0000
Received: by outflank-mailman (input) for mailman id 195519;
 Fri, 24 Sep 2021 16:10:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N27y=OO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mTnma-0004he-4z
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 16:10:40 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1985d62-59ed-46cf-8685-1cc2a19a2c1c;
 Fri, 24 Sep 2021 16:10:39 +0000 (UTC)
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
X-Inumbo-ID: f1985d62-59ed-46cf-8685-1cc2a19a2c1c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632499838;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=MeSee60f3BLx3E2EiiB1a9aLCb4HxN/cClOSIv/zLyA=;
  b=VFXLhOQY+B6vqPZwBdiCzJMgY0CwA4KZ6bGjaSglYI22P5ohsCLS/BdW
   C0a8EnOGFbFPCMWIA2HkAeEi2cWLZd66Q1Ilhq4N+WwnCSdiuS3GaJZvs
   TJUUFLHf7Dy05kdB+EvitoR6dJce8sU9c3OpKYQGtMYV39LOO6z6VYYUG
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: cdY/KAXvb36ZmXszRwkZeYs/4tc44ICszkczQE0nNDdY/pb+Q0i3LEF9X3OTeiZTmgjVCVg8WK
 vldKa7wVkx4U34vjHoruSWZYBeRWc7+/dEWVGM6/1FPqh3aBAVkksCUEgPwsWybF83bfiLAvdP
 pE4LHchTgzC3fwbWAO3qF8CZ3bsW9C+Qyxy02euj5Rw3uefRCkZMwE7e1OY4UL9LoKVFRdAWQM
 6B4h/fgF/YyRZ+BSxjxs9ODwbTsaJZe2uLb5gesvH4f8xslBMaRR8Y7X3khyIhcxgjEhlsLPFp
 kHyZMTmASBw4l9ZTEp9TmDpS
X-SBRS: 5.1
X-MesageID: 55373547
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OpyUj6t1cnOjUGNtDEt/HUzV5+fnVDRYMUV32f8akzHdYApBsoF/q
 tZmKWGEOK7ZMGPxLd9+bYvn9BhT78XQy9EwTFBkrSAxHy4S+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHpJZS5LwbZj29Y524ThWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpllraOcz4WDvH32+kvCV5jDxhjJJwF9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY250VQq2DO
 5VxhTxHTS7eRyARZAssV58FzOixnGHOTmNakQfAzUYwyzeKl1EguFT3C/LUZd6iVchThlyfp
 G/N4yL+GB5yHOKYzT2J43e9nNjllCnwWJ8RPLCg//ssi1qWrkQMDDUGWF39puO24ma8Ud9CL
 00f+gI1sLM/skesS7HVRAakqXSJuhodXdt4EOAg7gyJjK3O7G6xAWwJTSVdeccmnMAzTD0uk
 FSOmrvBByFrsbCTYWKQ8PGTtzzaES8RIGwZbCkIVzwZ8sLjq4E+iBHIZtt7GavzhdrwcRngz
 jbPoCUgirE7ic8Qy7797V3BmyirpJXCUkgy/Aq/Y46+xlonPsj/PdXusAWFq6YbRGqEcrWfl
 FsupfKn09BSNtKApnbKe/k0AaiYpPnQZVUwnmVTN5Um8j2s/VuqcoZR/CxyKS9VDyoURdP6S
 BSM4l4Luve/KFPvNPUuMt/tUqzG2IC9TYyNaxzCUjZZjnGdnie89SdybAa722n3mSDAeoluZ
 M/GKa5A4ZscYJmLLQZapc9BjdfHJQhknAs/oKwXKTz9itJyg1bPFd843KOmNLxR0U99iFy9H
 yxjH8WL0Q5Dd+b1fzPa94UeRXhTcyNhWcqs9pMKKrLZSuaDJI3HI6WKqV/GU9Y595m5a8+Sp
 i3tMqOm4ACXaYL7xfWiNSk4NeKHsWdXpnMnJy08VWtEKFB5CbtDGJw3LsNtFZF+rbQL5actE
 5EtJpXRatwSG2+v02lMMvHAQHlKKU3DafSmZHH+PlDSvvdIGmT0xzMTVlG0qXZSXnbp75tWT
 n/J/lqzfKfvjj9KVa7+QPmu00mwrT4anudzVFHPOd5dZAPn940CFsA7pqVfzxgkJUqRyz2E+
 RyRBBtE9+DBr5VsqIvChLyerpfvGOx7RxIIE27e5LewFC/b4mv8ntMQDLfWJWjQBDHu5aGvR
 eRJ1PWgYvcJq0lH7thnGLFxwKNgu9a2/+1Gzh5pFWngZkiwDu8yOWGP2MRC7/UfxrJQtQasd
 FiI/91WZeeANM//SQZDLws5dOWTk/oTn2CKv/gyJUz74g5x/aaGDhoOb0Xd1nQFIeIsYo0/w
 OontMoH0CCFi0InYoSckyRZ12WQNXhcAa8pgY4XXd3wgQ0xx1AcPZGFUn3q4IuCYslnO1UxJ
 mPGn7LLgrlRyxaQc3c3EnSRj+NRiY5X5UJPxV4GYV+IhsDElrk82xgIqWY7SQFczxNm1eNvO
 zc0ax0pdPvWpzo41tJeW22MGh1aAEzL80P8/FIFiWnFQhT6TWfKNmA8Zb6A8U1xH7iwpdSHE
 GV0EFrYbAs=
IronPort-HdrOrdr: A9a23:OsWp2qoyaDW/njmefzxnDXEaV5u6L9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPPHFXguNbnn9E426gYzNLrWJ9dPwE/f
 Snl656T23KQwVpUi33PAhJY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX232oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iBnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJDA4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWArqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocWTbqjVQGagoBT+q3oYpxqdS32BnTq+/blnQS+pUoJjHfxn6ck7zA9HJFUcegM2w
 2LCNUvqFniJvVmGZ6VP91xM/dfPFa9Ny4kAFjiUmgPK5t3Tk4li6SHq4ndt9vaMqDh8vMJ6e
 P8uRVjxDcPR34=
X-IronPort-AV: E=Sophos;i="5.85,320,1624334400"; 
   d="scan'208";a="55373547"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AyaZYfWqBEjCHMFJC3/Hs5wAdk4CKDaAYEcysPbMu7Am+PnaYHXCgEWMjkVnxl9KXCDPCVY75b2FT8sUsYZwf+748hHRKN+bCeY180QFL8b/Wq+yyVW+IjdA8PCtEKwOhnQ7YVi/Q+IOKgaVeBClM/KzBDqbcCRZs+896m6AS9Q9fkATZ9ubpkHYK6bLBfEr5uIc8pjQ6dd1QGLtPh4ArnOkq42S2LDxnvvIc4PH2KVau47ZcVbSFKBO8nCvwqjR9h+3/MygeOGsvyiiZDULrFKTdopiOqNIv9tcqvmmH/DWPommXKxE1XhF+L+SWi3avTXlRltrLK1vJ74qy3nr6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=O8nMueq38I2p+lvETxLMhIuc2Rdsh+z6aiNM5xAQUpE=;
 b=Y+pOPCmr5CQVBsJgVtHEQPEMysjRUDFgs025dC7iz19VYohXJLusX9465i3iHGNbma444Ce0F1rwO9bRHbzENhlzhLblWO1wVOiuz9L/3WaCwEiOkCgAVye5YA6EUPchSH3X48PJNDP6EQqgP/4zaI3eGcHIbNCG1jYAA6TlPkGhIOmV2Dv1JchuCOto6cci/qN2jxil+Q0qL/FUd3JV3bFmr8Z68yw+IRGmAfkPiAsx16eU2x6vqbuzJAlg7Q4uUfbxlmO1X0Z5qd65lMTh8jvVO26ekmuA2dP8ND3qJwNqSIhvakMqMeiKEJFdsTMONytFPgRyPjlDS58N4sDzhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8nMueq38I2p+lvETxLMhIuc2Rdsh+z6aiNM5xAQUpE=;
 b=vn5iYFbs2sr+PP3OSsquHSxERxuhzBCnbkwjY84mutjPvxXV6C+YES355Bl30p1gsJj0dOC9N3DTcc4Rq5Hafndl1zYDLyv8YoIdlYdIPuWrKODNoshrxm+y4baCzllbUOt2BCvwizKZ6LFnQxduRFO37mG6QMJTljJbSCexeVg=
Date: Fri, 24 Sep 2021 18:10:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Oleksandr Tyshchenko
	<olekstysh@gmail.com>, <xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [future abi] [RFC PATCH V3] xen/gnttab: Store frame GFN in
 struct page_info on Arm
Message-ID: <YU34dsl4cSCBbfrk@MacBook-Air-de-Roger.local>
References: <1632425551-18910-1-git-send-email-olekstysh@gmail.com>
 <de92ab24-a9f0-8f3b-e721-e0465e4dc065@citrix.com>
 <YU2PT4rUts8KljKe@MacBook-Air-de-Roger.local>
 <04400e18-dde2-4b90-4056-f56c5d7937af@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04400e18-dde2-4b90-4056-f56c5d7937af@xen.org>
X-ClientProxiedBy: LO2P265CA0126.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f361e42c-f2e5-496f-99cc-08d97f75d7e4
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5608C12985EDBC525B43A2B58FA49@DS7PR03MB5608.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PAcArE8NoewHrhdkAOnYtd6FDS8q7ym/R77POPL5pqDbu5y29VKOV1O/ZIdf3jIs7XAK+siFwPpXeaBlduuIxDzdFtAaOY9eRELaj2yCJx6g/+Gy1KrkUIzfBKnpCcF/lFsMCziSvQcZViHc1kIE/9SRi8kDvrE6M2c6p/CpKiT1FSC0R9ft/tvk/uKunybqNAsFMHXBtfxbFIOmkRkNYk51/htqpGVu1nZ8INh5EL13nf2+W3Gf+Z7Dw0z/ptOkJq3jHfgNTq5ddodJkioYWsW5S/oS19ooWYu6znGC1FwmOFzVJNDwXTmKXnrEoPhdyrzgskRPc+9JytysYFyqJJyj/3XYsKRW0syTtYKiv6QU6UhmaXVDJQA6Nv0IauYgYyIaLTdoEzB0GGqerOPNSjh/d4bw2nS9En4yCMTBheJNLViQVTsCFlLEsRfu/I9vJJ8t70iLTAl7gsXsIUuhANnHbgcrTiWgAV6W3Lfb85EB11G5Yk14/VTHqS9wae1SPbKQMVW1zgAwlA1W7X7rBkTuOf5RrNYjviS1Z2/wpLHJ32qQc3CiqsIeuwGOBiC2GaRvEjhSEC4VtnFvLZGJZSe/9XQUfRKv2pOin6XGafxRxexeWtAY49b53aXDzDz//KR2mgx1bmRTYi8GI3oE/hwiiDkKSgAMglagy5O+fcC3556FCFHDGhyebxXr5WJ6BPttJt3gYwaA4rXiXRwxyfVNZq83GUt770xBXsMmuoJqIQl5/ooIob1lwZwJl31IZeBcO88/pyBxOdhYwdMAYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(53546011)(6666004)(85182001)(26005)(5660300002)(186003)(8676002)(6496006)(83380400001)(66556008)(66476007)(66946007)(508600001)(86362001)(966005)(2906002)(9686003)(316002)(54906003)(4326008)(6916009)(6486002)(8936002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWdHRml6Ui9VVGlkNDFDZ29XNFc5S09rRHRyTm1LTFk3V05tRWEyN1JtYnJP?=
 =?utf-8?B?a2gvWUkzd1hoYjQ0OTFwekl5bVNRUkNvSnJWOXNzV2lOSXI3NFkyc0R1a3BX?=
 =?utf-8?B?SVQ3QUoyT0RiMXVBaEdOZ3kzOHBESi9vMTVuRjNEKzhIWVZvOCs3UW9JWHlh?=
 =?utf-8?B?bnkyckRLOUFDUWdyTG9oVGM5cWU4Ykc5MUpWNENISHZQM1NHSXRWT2RSaUhP?=
 =?utf-8?B?SGpXd29zUHVKbTN0WjJWa2VXbVZMbVUyMUxUQWpveU02K2RDSTZNWGZiaFBD?=
 =?utf-8?B?SlVZWnBvbUlENThSV00zc0dnMzhvbEh2c3ZJcFlDbGlRQjQ4UVVOb2tJTUUy?=
 =?utf-8?B?dEc5TjlYMVp0SmNTRHAwREpRYU44K2h4S2d0dXJYOGptcGFxV2M0L0pPTjAw?=
 =?utf-8?B?Z00zbzRscDBncThpS2czOVhadmhWVXJ1UGtjZHM1N1dlWDgvSWpncWZ2Y3pa?=
 =?utf-8?B?cXJLL1NyblE4aE9KWkhSMlh4RjJnTm84YjBZK2VJTWM1QUxhdy9JME4wMGNq?=
 =?utf-8?B?RzloTFR5MnJKL0NvMi9mTGd5UXhiUDFlS2x4cEt0SFZ2aS8yN2JQRm1KY05N?=
 =?utf-8?B?VkdBZVB4Y2xTUVBQWHdqNklCcDdiL1MxK3J2ZWVKZVFaa1dLdkJUOWdZZWRn?=
 =?utf-8?B?ZlllZjkzN1pyeUNMQjVGaHR2WVQ4S2hEbW1sNThpT09TRFNaWWg0eG05THgx?=
 =?utf-8?B?MHd5NzhOMTFoL2llY1hWdVd5Yy9pZGlVb1BoQXc1MmZ4WHh1dStLUzlLaG5p?=
 =?utf-8?B?TVlQTUk4bnpkNnlxS0FZMFcxSlVBMHIvYUtMSkZ0elQ2NkMyU3Q2ZzRETFBS?=
 =?utf-8?B?UmYwVmFmenE1T3ZQU1d4VXJQelVZcUszS3EyaGt4UkwyUVgxZTdmMFBzc3ZJ?=
 =?utf-8?B?ditGU3BqVmd5MEJZWXMxdU10R2M0UVJBcDRhVTRaRkVBZ0M5SnZWb045dEw0?=
 =?utf-8?B?Tm03RWhENngvWVhHTTlFSWh6MGpBY3FsZ0hFd3VzQWdHaC8rb0c4NEREeFU1?=
 =?utf-8?B?WnpMbzllNlh6djFCNDVNNjBPK3BSVTBWOENRMkkwSnEzcDg0Z2c2SWFZRDF5?=
 =?utf-8?B?dXRET1dOdWVzRHkrTFNmZGNrbnk0UWU0cmZQQ3dyMkZLWVNGK0hBWUU5cGdr?=
 =?utf-8?B?VlpVTm1oeU8xRUh3NjIycTd0dlo5NXR3cjlSRVBYYnhNYkJkYnZrbDk0MjV1?=
 =?utf-8?B?alBVZzVVZmRjQ29FL1hIT2FIUWRkZnpiSnJOUDFDQ3dsOXg4ckkrQktnMTVM?=
 =?utf-8?B?dXY2M05TZUZ2VkNPWWxCYnNhYjk1Nyt4WjkrNkx2c2tOcXVya1J3cXBFem9Q?=
 =?utf-8?B?eHZpOStPQW5sSWNpUWlnbjY2YnBteGdzT2JILzJYeTFrMUM0Q1prQVVYTFY4?=
 =?utf-8?B?N0xMbnl3TlhwbnhyUmcvbXg5MUoyZTRiWGxsQS9CelBJQ041b3RhNDk3Skdq?=
 =?utf-8?B?MHJWQ3BWYjlGTVV2R0xpYmNCaWh4VDA1cU90NTFuZzYwd0c3c29EdWU4UlFj?=
 =?utf-8?B?bDZvUkkyYm5vdkhST0RYdU9nQXZxd2hCRG5IVEJMZEcxdDhhWTZVMjJXQ21a?=
 =?utf-8?B?Z1kwSjBJY0VCMXN4dExHWkUvb2tWb2x6a2VlMCtvZXJyRnZIa2t5d3NETzdU?=
 =?utf-8?B?c2swQ0ZValNXSmMvcDhNd2Jpa1IwQm5FVi9SVURNdEpaQzhYSEpwZGtLNHgx?=
 =?utf-8?B?WEdwTjhZL1l0M211WjVuQzU3Zk1sRU0zTHZVMEI3L1lkSTV2WUNYbUlEWFZ2?=
 =?utf-8?Q?AJG3ZTTXpSToHqlsZDl1b/1OjBLi4YrBKm0GtFQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f361e42c-f2e5-496f-99cc-08d97f75d7e4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 16:10:36.1382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BrhBm+9ifDGaZIeifABgcfpFLrYqTwkETPI6FvYHUrSL1RCj65Qj6KgInGwPBvI8nJmZBsa6AQqRlC89Xe8ABw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5608
X-OriginatorOrg: citrix.com

On Fri, Sep 24, 2021 at 07:52:24PM +0500, Julien Grall wrote:
> Hi Roger,
> 
> On 24/09/2021 13:41, Roger Pau Monné wrote:
> > On Thu, Sep 23, 2021 at 09:59:26PM +0100, Andrew Cooper wrote:
> > > On 23/09/2021 20:32, Oleksandr Tyshchenko wrote:
> > > > Suggested-by: Julien Grall <jgrall@amazon.com>
> > > > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > > ---
> > > > You can find the related discussions at:
> > > > https://lore.kernel.org/xen-devel/93d0df14-2c8a-c2e3-8c51-54412190171c@xen.org/
> > > > https://lore.kernel.org/xen-devel/1628890077-12545-1-git-send-email-olekstysh@gmail.com/
> > > > https://lore.kernel.org/xen-devel/1631652245-30746-1-git-send-email-olekstysh@gmail.com/
> > > > 
> > > > ! Please note, there is still unresolved locking question here for which
> > > > I failed to find a suitable solution. So, it is still an RFC !
> > > 
> > > Just FYI, I thought I'd share some of the plans for ABI v2.  Obviously
> > > these plans are future work and don't solve the current problem.
> > > 
> > > Guests mapping Xen pages is backwards.  There are reasons why it was
> > > used for x86 PV guests, but the entire interface should have been design
> > > differently for x86 HVM.
> > > 
> > > In particular, Xen should be mapping guest RAM, rather than the guest
> > > manipulating the 2nd stage tables to map Xen RAM.  Amongst other things,
> > > its far far lower overhead.
> > > 
> > > 
> > > A much better design is one where the grant table looks like an MMIO
> > > device.  The domain builder decides the ABI (v1 vs v2 - none of this
> > > dynamic switch at runtime nonsense), and picks a block of guest physical
> > > addresses, which are registered with Xen.  This forms the grant table,
> > > status table (v2 only), and holes to map into.
> > 
> > I think this could be problematic for identity mapped Arm dom0, as
> > IIRC in that case grants are mapped so that gfn == mfn in order to
> > account for the lack of an IOMMU. You could use a bounce buffer, but
> > that would introduce a big performance penalty.
> 
> Or you could find a hole that is outside of the RAM regions. This is not
> trivial but not impossible (see [1]).

I certainly not familiar with the Arm identity map.

If you map them at random areas (so no longer identity mapped), how do
you pass the addresses to the physical devices for DMA operations? I
assume there must be some kind of translation then that converts from
gfn to mfn in order to cope with the lack of an IOMMU, and because
dom0 doesn't know the mfn of the grant reference in order to map it at
the same gfn.

Thanks, Roger.

