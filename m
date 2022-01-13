Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E1948D590
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 11:22:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257054.441478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7xFc-0003n0-9S; Thu, 13 Jan 2022 10:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257054.441478; Thu, 13 Jan 2022 10:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7xFc-0003l8-6C; Thu, 13 Jan 2022 10:22:36 +0000
Received: by outflank-mailman (input) for mailman id 257054;
 Thu, 13 Jan 2022 10:22:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=64pG=R5=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n7xFb-0003l2-3C
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 10:22:35 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6a1cffb-745a-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 11:22:32 +0100 (CET)
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
X-Inumbo-ID: b6a1cffb-745a-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642069352;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=jk6+BjB+9ucEjAqXToPydTbHE8W5DVPyM9IHyjxVhBs=;
  b=OMkQjGSUZXbC+CdaZ1siz6wXTUu4Vf3mlEb8oC+79zEdn4vcy+MbjSWr
   vSPBlflrIjROD7scPE0y/Ktxz4Q6nB09vUeq14SF76gIY6enXpACBqfO3
   MBO4VB4HlZZW2ZihrSQ/RINottN3PYqSJkIjdjgBP76/VfHzEvXLHoOHY
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: mq9R4FaZzdTbEtnsE3P+89x0bjuBafmuqxdHkh/B+P9AYHeNuXNAC5x2IWFNlD1rLVrggbWhrU
 4HHnilt/MHwZyHsVgMwDSsHTrbHrRHVb6t7xnou/f8EcH4TpFuE8ZUGy8o1qI/yuZCMASYfL4w
 hVJuBVzwrQuQ8NkIBlf121RotjTtbI89mDSu4/JL0trLExnIanZiekTDyG+t/TuIQHJBtVWbvx
 YXsYo6ESGk4llfRFpjrml41ryMJrWbkXn+EGqfOqvj3rj6R9OMInMc41gr42kbs2jbiMyK1eJM
 wxcf37tom42gMTFUiZ22ntyY
X-SBRS: 5.2
X-MesageID: 61908854
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VjBsS6PJKx9HKlXvrR1lkcFynXyQoLVcMsEvi/4bfWQNrUoh0TJWn
 GUdDDuBMvzeN2akfd5ybovk/BsCv5DSmtdkSwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En150Es4w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoz6zx8Jxw
 /xcicePElsiP4P2o+0iXwYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uTtIcIjGps7ixINdrxe
 ZcmNDpvVTn/eBNuNkkpU4xlvej90xETdBUH8QnI9MLb+VP71AVs1JD9PdyTfcaFLe1XlEuFo
 mPN/0ziHwoXcteYzFKt22iwi+r4uDL0UYMfCpW17vdvxlaUwwQ7DxkbVkCyp/WjvUe4V8hCM
 Ewf+icorq8a+VSiS5/2WBjQiGSNvgMYHcFRFeI6wAiXz+zf5APxLmIJVCJbYdoq8so/XyU31
 0ShlsnsQzdotdW9S2+Z97qShSO/P24SN2BqTT8JS04J7sfupKk3jwnTVZBzHaitlNr3FDrsh
 TeQo0AWjrMfl5RTj/2T8lXOgjbqrZ/MJiYr4QHQUnOg/xlOboevbIy16nDW9f9Fao2eSzGpu
 3wJmNOX6uwUOo2cjyyGQOgLH7aB6u6MNXvXhlsHN4I66z2n9nqnfIZRyDJzPkFkNoADYzCBX
 aPIkVoPvtkJZiLsNPIpJdLqYyg38UT+Pd/fDuLUZfNfXsNOL1OM/Q9UXkev03+4xSDAjpoDE
 ZucdM+tC1MTBqJm0Ce6So8h7FM7+swt7TiNHM6mlnxLxZLbPSfIEuldbDNie8hktPvsnenDz
 zpI2yJmIT17Wfa2XCTY+JV7wbsifSliXsCeRyC6m4e+zuta9IMJV665LVAJIdUNc0FpegHgp
 CHVtqhwkguXuJE/AV/WAk2PkZu2NXqFkVo1PDY3IXGj0GU5bICk4c83LsVrJ+F+r7Q9ka4vF
 ZHpnvls5NwVGlwrHBxHPPHAQHFKLkz31WpiwQL4CNTAQ3KQb1OQoYK1Fuce3CIPEjC2paMDT
 06IjWvmrW44b106Vq7+Mav3p3vo5CR1sL8sAyPgf4cCEG2xoNkCA3Gg1ZcffpBTQSgvMxPHj
 W569z9C+7mUy2L0mfGU7Z25Q3CBSLohThEETjiCvd5b90DypwKe/GOJa87RFRj1X2Lo4qSyI
 +JTyvD3Kvocm1hW9YF7Ft5WIWgWvrMDfpdWkVZpGmvldVOuBu8yK3WKx5AX5KZM2qVYqU29X
 UfWootWPrCAOcXEFl8NJVV6MrTfhK9MwjSCv+4oJEja5TNs+ObVW0tlIBTR2jdWK6F4Md15z
 L556tIW8QG2ljEjLs2C0nJP722JI3FZC/cnu5gWDZXFkA0uzl0eM5XQBjWvuMOEaslWM1lsK
 TiR3fKQi7NZz0vEUnwyCXmSgrYN2cVQ4EhHlQZQKU6Il9zJgu4M8CdQqTlnHB5Iyhhn0v5oP
 jQ5PUNCOqjTrSxjg9JOXj7wFlgZVgGZ4EH413AAiHbdExuzTmXIIWAwZbSN8UQe/z4OdzRX5
 ujFmmPsUDKsd8DtxCoiH0VirqW7H9B28wTDnuGhHtiEQMZmMWa03Pf2aDpasQbjDOMwmFbD9
 Ltj8+tHYKHmMTId/v8gAI6A2LVMEB2JKQSumx26EH/lyY0ERAyP5A==
IronPort-HdrOrdr: A9a23:ds1z7agS1QWb2zb8kpq1NYjGcXBQXt4ji2hC6mlwRA09TyX+rb
 HIoB17726RtN91YhodcL+7VJVoLUmyyXcX2+ks1NWZMjUO0VHAROsO0WKI+VzdMhy72ulB1b
 pxN4hSYeeAaGSSVPyKgzVQxexQouW6zA==
X-IronPort-AV: E=Sophos;i="5.88,284,1635220800"; 
   d="scan'208";a="61908854"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVJGJHH71dJZntvuPRAyCm4YLeJ5LI8hXLEyknB2WuO6W1G1iHErQz93/o88+ao9epc6HlakPQP0ZIembun5rRSU7VGZ2bR7RIVR6DD6uWg12NWzeg35wInzNohPJYCT+7WH09rqyFVEM8n6EjEBjWKC+ZWO8t0pAn4YzSmWfs2YBGToPL1b0J+NmnPfWtlTN1o/2RWCW9Xf1yKAdKoNjMPnUzOd+l+TXb670GhZvFqKOZjrzLeEcqMvhSQUirIseLRTiRk6uNAfNF37sNEGNGSUQ3Fiu/cgjTHsiiIyOJnYy9c6x4oyXqyiA45CmACYSDi3cgeNN4yOvI/dQPoyBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swU79RKhpKmTDx2UQp8knIDGCmys2YDniE22Z0GmeRs=;
 b=LRVwuyCdBWP2Q3YdsJzuyIDaPy0k4VXOeFM0iSl3NJPF2lIA0r2FsOpf5R55eGRVyNNjzlKRuoG3mTzexRw3C9rEJbEuD7/LFnWfQ9s+/hBvSuntmPdvqrsfiYNHgZzUg9Hey6XOpsP8QYdGloq0UMIS2HyNFFcXV0nnEgBynu8SITvlBqEOZuilmacllXmzrz5QCvYoG94W7oqpg6d2EQdwpP1I1OOW6Owad9fWCDEz0cabCnY+6ZUmtf1NDfuDT0TwQxVEIQlCVmfAoqJFHFfyCsHKM5Rey8S/lVUGTdFJt8XkXB8jYoTxxFqLRYgFEqTyBLdpU1Y/4gwhmMynBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swU79RKhpKmTDx2UQp8knIDGCmys2YDniE22Z0GmeRs=;
 b=A/O3I8xGmxbhlLoZSeEQuotHxDJ4AX/MqyXZyfyaC0ch8DhMetM2OYV0sHD1jPkNm2eBmJnbu7eAHpOXl5zcJX8hfxJJaYexRUbfv0XypFhiHK6zEIxQ+9mMHRscwPbYQt4Pis5TvBrXq7s50+Rn6nk0bhyVm5zxQPwHOY7xxDA=
Date: Thu, 13 Jan 2022 11:22:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <paul@xen.org>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v5 08/14] vpci/header: program p2m with guest BAR view
Message-ID: <Yd/9W7GFO51GE0ch@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-9-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211125110251.2877218-9-andr2000@gmail.com>
X-ClientProxiedBy: MR2P264CA0106.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 518c31da-fb4c-4561-4706-08d9d67e97c8
X-MS-TrafficTypeDiagnostic: BLAPR03MB5410:EE_
X-Microsoft-Antispam-PRVS: <BLAPR03MB54104D642B38AA716486EBDA8F539@BLAPR03MB5410.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8oQeSJ0EttQB4u5ZxeM1SuALX/Zcgr+YWr5ZDWjDUH4YGU89JlEFViweQNZjP1AXCYUlc+uiYf7/0cGYgJAJju9V+kUH1NlOu17E19ywkpM0b+J9kGRQPrVjsWDC6wYWhTswn4vQj0YJeR5ZxH2o3yDDohjxQUC+S7L10Y/mKQ7pkOEb9quUR74Mlb9JXFhyO+sBeadbWwYqZw6aqVWQkcA5EOAQhxXeXkYmRbiqWxzG/ZyFy5N3f9Mg8dKdXVPyIR9aG9FxArb60nt6u6Keo/mPirS5qM5rM7UM1XuqpWsuvRPGP0d4h8N663k/kbHAPBplCRUUn38vGYEMaETSjTq1/ooLPjuoVPTkl1zMwFyB7msXupToMT4RGOGvk9GLwjFUsF/Tz+3sOyPJe0GDOm9b/hkcOsy5IhrST4zv9tkqmNDK3g+8RUaerIxI/Do/HkuzsWcq+Vv5x37X5SJ719IjuOXr3PY0qaIcXh0yOwbCfSoJjRrhGAp88XeM52HZFGKXdoX/ZZ/n4SII4dWscghr6nIkmAr47tWc4FXiRz9lHSI2IVfQ6Ve8KkCMVFUraFsUiAo164il9x6towSIB9YtFChdeHj7fT5IszHIoRtbySERkFg2LRgzdNiPFJMjCvtnzZBY+5x1H78Kp7qjnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(82960400001)(38100700002)(4326008)(6666004)(85182001)(66946007)(66556008)(66476007)(316002)(8676002)(6486002)(6506007)(6916009)(83380400001)(33716001)(6512007)(9686003)(2906002)(7416002)(26005)(508600001)(86362001)(186003)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUZIcE0rTnV6WUJuVVJsV2wrQzk5R0RCMmpSaDBxT0IzYWVHaE10MHhla1NR?=
 =?utf-8?B?RW9NdXhLUHRrVEpma2tRdXlISjljTWlZd0IxSXlVQVBLVkVnWGs5dnJ5eDMr?=
 =?utf-8?B?clNnZERTb29BRWdZMG5USjJoS202eFg2Znpta1ZKOFByOXk5ZUJCK2dQc25D?=
 =?utf-8?B?dW02V2p0UzNPNktJZVVrQytTTFNJU2cwYWZvcDJxUlVkSzd0b3R0RFEzQk1U?=
 =?utf-8?B?d1ZJVi91SW5YU0ZwbHBCR25jNmI1cjZwSzNpQnowelh4aFVMVEd6Zit2UXZX?=
 =?utf-8?B?SXpMOWlWbFhaRnhRdS9TTGgybFprSDdBQlFyUmo2dXR4blh6UFBic1JkNGpN?=
 =?utf-8?B?dFNyRUVOMWJ5ejdjcTZ5STlFUWJLMUNYZUR5dVB1eXlReXB4eFNJUURBVlhy?=
 =?utf-8?B?c3R5bm1UdjlERjlnMHlnbnNhQmZDRW5Mc0tObER0YVFwVEZ3ckNncmhPTmp4?=
 =?utf-8?B?Z1VoWktjdElITHl4T1VNVC9NQUkzdkFLWUVMU3gxbkhEUm8xSDRuREFzSzRW?=
 =?utf-8?B?VzFHRC9DU2F1Y0dOeU1qRXZoN3FNdjhHUkhnK09wQndOVUFKenBSczlDazFt?=
 =?utf-8?B?YXBRRDZkV0dFQUZ3K0JaeUwxSUZTNW5TS2NSeWx4LytYckJYbWtISVl6TFkx?=
 =?utf-8?B?ZmNId1Z3cytHczlNMitFWmxMZko1bElEZWFGOXRmNURFd29UTDRlNEpscExC?=
 =?utf-8?B?Z3VXcVB5SmVVc1ZJREN0aTJqOTI0TythNjF5TTR3MkQydjM3MDA2NkRZVjds?=
 =?utf-8?B?QWZlZ0pXV3RKZ05WOGwzVXVWejRnYXFvTVFCd2I0S3BldUsyOVV2Y1dkMVE4?=
 =?utf-8?B?WCs2aHdkMEx3aGlVYS9OVU8vVjNLUXZ4VFFmTHFxUk9XcytIZkprSmkyRFFE?=
 =?utf-8?B?VW1GU1lCUDBpb3IzdjhvSEF3VUUzcUk4TmZaVjlBeW9RYk0zelJ2OEI5N2tu?=
 =?utf-8?B?VFZjRmJtQjdSNVZaRCs2SzlYL09VYytySElmb2grbEtjcXJPK3FpbkYrV0Ri?=
 =?utf-8?B?ZnovYnFTdlVtR0pObXIyaXhNVGk2VDdHbWRkVFBkblpxN1phcXNua3dTZmZM?=
 =?utf-8?B?bTVPelpRUjE2Z0pDR0laRnBkb1JsdlluNkFCMVdrWlpPRmdUVjBTai82Q29X?=
 =?utf-8?B?M1BJREZqem4rYjZTVG82WlN6bG4wenpSc05qVFM0OU9iOE96NDdjdU9Lc1JD?=
 =?utf-8?B?WTgvTUZ4TEtrTGZoQWRuWGNVd1k2YlFHcHlrZ05TTk1DM3J3T1hCUHJzNlZ5?=
 =?utf-8?B?ZzM5MW1sRjlEbzhNaG5ULzUyS05mVThhUktPVXlMV21SMzlZVTBnTjZCY2xV?=
 =?utf-8?B?Z3V3TXRtZnhWL0M4NUNoUDc5eWt5Q2dBNzdkM05rSXNzTEp4NE1lTkNuUjFH?=
 =?utf-8?B?OFY0WFdKSzZzUlU2R0JMcDloYlhnTy9Td090N0FhQUtNRldTbDU3NmhkSzFO?=
 =?utf-8?B?U1JkSTcveGt6UUtIYXZ2RzZ2U0tqYnp3YXJsUnRxMVdwU2RHcEhOZzB5TFJ0?=
 =?utf-8?B?UVZmUzdSNDM4N1QzWmVON05udlMxbTRQVWZmT01yK2lMajVyUU9OYUFNN0ZB?=
 =?utf-8?B?ZDlwKzdoa1RyNjV3RkljRlczTVh5ZFVIN3RYL3A3WXBoNjg2d2tFUTg4RE5n?=
 =?utf-8?B?TkNJSDlvQ0pHL25wSkZxZ1kvanZnQ24xVHRRL1IyVU1EaUZuUlpTaW4wOU9i?=
 =?utf-8?B?S1RpZXU3NkszVVNlYU51eWJnM3pxVllOczh2b3VGKzh4K3ErZ1JTTDZBYUxx?=
 =?utf-8?B?LzNOS2w5STgyREswZ0FUSmRLVlFmdHVuN29lUkEvaEJ0ZXZobXo2dGZDTVcz?=
 =?utf-8?B?NVRrYzQ3TVZzblFJTUNxVFB5UUlZcTl6LzZZSkJRcHl1MTYzNllhZDNLK1Mv?=
 =?utf-8?B?MmpCUjlQR1FzVC9laDlYZTdUeXZiWm56THRsd1pTcmdkNTg0S0QvcHhKNW9O?=
 =?utf-8?B?b2FsV3ExS0R4c2dWUTBQRDVjNXFKTFppRXhsK0Qrb045ajg5bW9JTFN1L0Ni?=
 =?utf-8?B?b05hcnJJT1RMeWx6VHdUNFJ2NWk3UHZrSFpLbUJyT2M2WHpRMlpWS2lJcHpE?=
 =?utf-8?B?WEI4T1VpMWdJWFQxcHdIYWJkcGxicDIyWHBuQ1JLQStWSThLekkwakoxbzRx?=
 =?utf-8?B?SlhMT203NkkycmlGbEtGQW1naHREd05zRTRmd2dGYVdXZUUrY0FYaE9razBU?=
 =?utf-8?Q?8gHXDA89mzeuErBOMFnHNig=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 518c31da-fb4c-4561-4706-08d9d67e97c8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 10:22:25.1919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 68laJ7MeyZ70meMq7bo85wyfIpRrR9QgUa9bN9PGhPunLQAgmy624SpnNPueb0TF0DbE4PPyrqQUEXc40T/HeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5410
X-OriginatorOrg: citrix.com

On Thu, Nov 25, 2021 at 01:02:45PM +0200, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Take into account guest's BAR view and program its p2m accordingly:
> gfn is guest's view of the BAR and mfn is the physical BAR value as set
> up by the PCI bus driver in the hardware domain.
> This way hardware domain sees physical BAR values and guest sees
> emulated ones.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Since v4:
> - moved start_{gfn|mfn} calculation into map_range
> - pass vpci_bar in the map_data instead of start_{gfn|mfn}
> - s/guest_addr/guest_reg
> Since v3:
> - updated comment (Roger)
> - removed gfn_add(map->start_gfn, rc); which is wrong
> - use v->domain instead of v->vpci.pdev->domain
> - removed odd e.g. in comment
> - s/d%d/%pd in altered code
> - use gdprintk for map/unmap logs
> Since v2:
> - improve readability for data.start_gfn and restructure ?: construct
> Since v1:
>  - s/MSI/MSI-X in comments
> 
> ---
> ---
>  xen/drivers/vpci/header.c | 30 ++++++++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index cc49aa68886f..b0499d32c5d8 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -30,6 +30,7 @@
>  
>  struct map_data {
>      struct domain *d;
> +    const struct vpci_bar *bar;
>      bool map;
>  };
>  
> @@ -41,8 +42,25 @@ static int map_range(unsigned long s, unsigned long e, void *data,
>  
>      for ( ; ; )
>      {
> +        /* Start address of the BAR as seen by the guest. */
> +        gfn_t start_gfn = _gfn(PFN_DOWN(is_hardware_domain(map->d)
> +                                        ? map->bar->addr
> +                                        : map->bar->guest_reg));
> +        /* Physical start address of the BAR. */
> +        mfn_t start_mfn = _mfn(PFN_DOWN(map->bar->addr));
>          unsigned long size = e - s + 1;
>  
> +        /*
> +         * Ranges to be mapped don't always start at the BAR start address, as
> +         * there can be holes or partially consumed ranges. Account for the
> +         * offset of the current address from the BAR start.
> +         */
> +        start_gfn = gfn_add(start_gfn, s - mfn_x(start_mfn));

When doing guests mappings the rangeset should represent the guest
physical memory space, not the host one. So that collisions in the
guest p2m can be avoided. Also a guest should be allowed to map the
same mfn into multiple gfn. For example multiple BARs could share the
same physical page on the host and the guest might like to map them at
different pages in it's physmap.

> +
> +        gdprintk(XENLOG_G_DEBUG,
> +                 "%smap [%lx, %lx] -> %#"PRI_gfn" for %pd\n",
> +                 map->map ? "" : "un", s, e, gfn_x(start_gfn),
> +                 map->d);

That's too chatty IMO, I could be fine with printing something along
this lines from modify_bars, but not here because that function can be
preempted and called multiple times.

>          /*
>           * ARM TODOs:
>           * - On ARM whether the memory is prefetchable or not should be passed
> @@ -52,8 +70,10 @@ static int map_range(unsigned long s, unsigned long e, void *data,
>           * - {un}map_mmio_regions doesn't support preemption.
>           */
>  
> -        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(s))
> -                      : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(s));
> +        rc = map->map ? map_mmio_regions(map->d, start_gfn,
> +                                         size, _mfn(s))
> +                      : unmap_mmio_regions(map->d, start_gfn,
> +                                           size, _mfn(s));
>          if ( rc == 0 )
>          {
>              *c += size;
> @@ -62,8 +82,8 @@ static int map_range(unsigned long s, unsigned long e, void *data,
>          if ( rc < 0 )
>          {
>              printk(XENLOG_G_WARNING
> -                   "Failed to identity %smap [%lx, %lx] for d%d: %d\n",
> -                   map->map ? "" : "un", s, e, map->d->domain_id, rc);
> +                   "Failed to identity %smap [%lx, %lx] for %pd: %d\n",
> +                   map->map ? "" : "un", s, e, map->d, rc);

You need to adjust the message here, as this is no longer an identity
map for domUs.

Thanks, Roger.

