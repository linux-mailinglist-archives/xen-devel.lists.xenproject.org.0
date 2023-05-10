Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FB16FE174
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 17:20:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532903.829251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwlbk-0006aj-Uz; Wed, 10 May 2023 15:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532903.829251; Wed, 10 May 2023 15:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwlbk-0006Xx-Ri; Wed, 10 May 2023 15:20:00 +0000
Received: by outflank-mailman (input) for mailman id 532903;
 Wed, 10 May 2023 15:19:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N27j=A7=citrix.com=prvs=487c252bd=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pwlbj-0006Xr-7f
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 15:19:59 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e52eeda-ef46-11ed-b229-6b7b168915f2;
 Wed, 10 May 2023 17:19:57 +0200 (CEST)
Received: from mail-dm3nam02lp2040.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 May 2023 11:19:54 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA0PR03MB5466.namprd03.prod.outlook.com (2603:10b6:806:c0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Wed, 10 May
 2023 15:19:52 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%4]) with mapi id 15.20.6363.032; Wed, 10 May 2023
 15:19:52 +0000
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
X-Inumbo-ID: 1e52eeda-ef46-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683731997;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=SGCX8BmDkjg6X3ZQ0fmrJ6M+bf6B4ItCD5uirPezaGc=;
  b=CEiLVnjntXbTb4z/Vlz6lTYkvnZddIJIWTXOKcbW2JYwSV0fMw0XfiUV
   c59IMWbK0bJ2BnjM1JTIp5QV1V8AcIxDtEHDj4PYv+Dwn90XlJEYS67Y3
   7cKGkGw2WQHvfcmQrBcmvcLr3QHF2OOyGOY/+R3055wjk3nihsgwQSpKD
   M=;
X-IronPort-RemoteIP: 104.47.56.40
X-IronPort-MID: 108948413
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:db2eIa3Omuo3WsWw4vbD5fpwkn2cJEfYwER7XKvMYLTBsI5bp2cCx
 2VODzyFbPvZZ2PyLdwlO4i2/BsD6MfQzoI2TAE/pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+XuDgNyo4GlD5gFnPagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfByJXx
 MUkNS82bCuojeaczbSadPtlr5F2RCXrFNt3VnBI6xj8VaxjbbWYBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvS6PlGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv01r6TzX+iA+r+EpXp7ftn2w2h6FAsLycNWxihgcub20yHDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8U55R+MzOzI4g+fLmkCUjNFLtchsaceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDRLoViMA6tjn5Y021RTGS445FLbv1oGtXzbt3
 zqNsS4ywa0JitIG3Lm6+laBhC+wop/OTUg+4QC/sn+Z0z6VrbWNP+SAgWU3J94bRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:08T5j6AKelmFxHzlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-Talos-CUID: 9a23:8ZAs322ybZMGRq9FSclBZ7xfHIM8Q0Th0WjrIXSTA2JDRbu0d02Z0fYx
X-Talos-MUID: =?us-ascii?q?9a23=3Ab0b4uQwk87KHJAH6beoJY6q3JdOaqPW1DU1Wwac?=
 =?us-ascii?q?oh/ajDzd+eC29vhbmQLZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,265,1677560400"; 
   d="scan'208";a="108948413"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSV+KpxG0Y55juAPMDlxgN6k2Q+KAfEaLbO4L97B2j0p+/qTBMTVkfbzPfzmv/fPnWRYsmfi8V6wp+cbbbPLCEpMcOjlQ1GM05wiNKRDUcI3cUIeX4zkzQRLVWdh3JKNOPwpDSJRXG3sdBrjPaei6OwRriGfnzxHtvyeKfYyUh+VKybOJgxbwR8IgLYHYtuG/wLo43oLPb57jPxHtpqgdsGspQvOGXMEFYpRIk8tZP+iYyjjdS62XmpH/m/NbkxYEdQVQFB99RXPnJGEs9xqmykgt9RX4J0Wk3y3cFRvjFbKffmzHAZpHJ4bJ2vSxKZnTYy2RuOVteBFAH6pbV3n+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHH4CRqUzr0Tqny5FLwoqq2KFzM5tgVW9+7FUQNsDAo=;
 b=Fbf8XsrTAIxHwwz0gHOcif8D9DRxHoUE/T76X8XT2Uw/qGQLfVxAub2+v5IsMYnFF945tg9KgNZCVgyIHWYPV4oQe0S+SOchFoaUx0iQQS33Q80rWtInTRP9uKxIF+L9RyJQgUjQJzTY1Zt1dmCTmKc8FvWVNPe1REy3nQQMdA0XaK7k+HWiLIUekDRnusA64XRXAqSTtuQFPLQA9TZe1qPfnbSkiy2BoY+vye4LpXbQDLU0RG4V3/Vn8Md5ZJY50BAuraOGbJtB/RN61xdZ9/Jz7Xiq6McGOJoid+ZaNIk0bIiT+zKRM7Rfp6v0DkDDEw+sTSEk0IUaCwurZ7nsuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHH4CRqUzr0Tqny5FLwoqq2KFzM5tgVW9+7FUQNsDAo=;
 b=V6MPEaJDGEE/NIs0CoaavQ3w6j90+4oo5fMkWrlAZa7Q55MpESbeNp9WvodytA3ddYbc/xZda7Hk63+CpzXt9UnV+XXTJ4zr1Y6eBhSsV1jqYz0qX6MyqQa7c6CtABsek4fPCAokJHPk+0hDkxLW4u0/B2Oeu056zfUXKK72Wps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 10 May 2023 17:19:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] iommu/vtd: fix address translation for superpages
Message-ID: <ZFu2EzMmQvfpE7tJ@Air-de-Roger>
References: <20230509104146.61178-1-roger.pau@citrix.com>
 <bc750b8d-77be-f967-907a-4f19c783ad99@suse.com>
 <ZFtVYEVsELGfZxik@Air-de-Roger>
 <5bde1d79-03ef-6f8b-4b28-8d7e6867ba18@suse.com>
 <ZFtwSjuZaz05DIY0@Air-de-Roger>
 <f53d0041-d694-1221-475e-648a2afd2ff9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f53d0041-d694-1221-475e-648a2afd2ff9@suse.com>
X-ClientProxiedBy: LO4P123CA0664.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::8) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA0PR03MB5466:EE_
X-MS-Office365-Filtering-Correlation-Id: 9870c1a2-8a13-41c0-2204-08db516a0095
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	miZ8/XDTEKW+SyS361Zx+qyfzbvd3O2Lqngu1no/md7MFL+HBqOoD2eLeN9Z1xu5QsvNdBWNlCv9AoS9c0hI4pNCYjheG5336RFZ3h07dusy4TUYIrlukKwjFEFjjC1IUeebNIcaShuojIQcmnj44iAtM+K3Xrg0rDhCqqgelB+8vtAbRTh1Ta9jEXHIZlYHQ+t5yN0+xnKWcmu/HNG8akSJJ125vDSSyIeQK0ry7kGQQyjkdKnmlEvIPhY6tq5amhrFXxLZ5vNp8dduYbX4BFIcXacst7N+2HnswjG310VdLv1qdT2NajuH1b/7kRzCMzxg0gYo4kUSHICsYacFYesQIeB0un+pt7XRCr5DIXNZRE3tWshfbqUkz5cr6aIdpMUgIid8IMnd+kEi+qAa/YgpkYLSkGG7yP+8Ck0cjH20DrPU4LzBg9RPDRujUL56NLIsR9NyWTNdPcZ70rLiGwAz/EG3KO5xYskW9Gol890C5gghz4RqmzA9n/NWtlLvtCd3efmYWie7yPj8BWalbVQGPCCYL8wVEPAbUi6oWNAoV6LH2gPNHrYj1T0BSn56
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(39860400002)(376002)(366004)(136003)(346002)(396003)(451199021)(186003)(2906002)(83380400001)(85182001)(38100700002)(33716001)(86362001)(82960400001)(6486002)(8936002)(8676002)(316002)(6666004)(41300700001)(5660300002)(478600001)(66476007)(66946007)(66556008)(6916009)(4326008)(6512007)(53546011)(9686003)(66899021)(6506007)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTlTRDk2azlHVjFWU3hCc3AwNVVDQ2xqcGFGT1pBNVpTNi9sVHVpcmZTSjBV?=
 =?utf-8?B?OVVzejM0SXVXc0R2QXlyLytwSnY5NHVPaGxrZGprcDMxVkJQdFJZMkM3MXhJ?=
 =?utf-8?B?VHM1Y2pobTZlUDNadjhDOHdNUk1obHBlRmMvU2lCM1VENnFLUnZya2N3N2FY?=
 =?utf-8?B?TlhncWJzVlhMZlZGZjVjMnlVRGpqaTh2Ykw0a20xS2w5S2JVa0x5b1JhQ09V?=
 =?utf-8?B?enNCNHZ1dzlhMjBUdCt2MVJVa1M5Mk5mYjR2RDdESE1PdU50YSt4VFlxODdC?=
 =?utf-8?B?TXZ4ZzB3R0MxVnZnbmNNYzJMcS9IazFNVWJNQVgwU29zL3hHajlYckMrdUhI?=
 =?utf-8?B?azRUV3ZMeU83VmdQZUxIeGlySXhxVnIzM3NFSm50bUE4Q3pRNzZkdGtaWG9o?=
 =?utf-8?B?SVFFQjhFVzJDcGVpNnZaSVIyNUtKQkFid284bWlTSlV4QXUrd1FINWxUZkdz?=
 =?utf-8?B?aWZ4V0RqNHRkZWFJLzlJVnlqbHhjRVZqc2pnQ0NhY09xZUVMQUxzT0tBbU10?=
 =?utf-8?B?b1FHN1ZwWjlIZmk0MHFNbjZXM3IwU0wyTjlaclNwdE1McXNSNXRjQjBYWTlB?=
 =?utf-8?B?ZEUwK1NsODFuaTdlTWErZWd0VnRQOTV1dG1tbTFWV2JZbktONUNnVVJtOGZr?=
 =?utf-8?B?K2QwcXE3S2Qza05tMnRuSjMyVWkxTmk3RStKTkhOL0h4MEcyU0hiS283YjQ0?=
 =?utf-8?B?M0xiQlJiRVZXUW1vZnR2Z3J2UnlMakE0Y2hKa2VoRnR1QVk2OEhPTjduNTN2?=
 =?utf-8?B?SXpRdHJ0akxqcml5TjVKbVZ1VFZPQytzdGNJN1lPekNsR2RtZFd0MnZ2R08v?=
 =?utf-8?B?akRxT3FTMEhtUTNJMElqdGlod04vcHdoTFpiOUxXODdtWjJjbDE5SDNvUU1m?=
 =?utf-8?B?NlRkWnk1cUVVVktVNERvSGFOb1QwSzB2ZDhiTlBOMHVCMU8yQXV2R3ZhMzNv?=
 =?utf-8?B?amxTSSs4Zjc2ajdnUVFlZmFvYURoNUdxekFiU0tLQU9UUDRxQ0VNOWdGcnRB?=
 =?utf-8?B?cVU2UEZlY0VMVFJPUmVhNFZEaXZ1bHo4Yk5pakE4NTNVTERvcDJST1NEaFh4?=
 =?utf-8?B?ZFRhQm5BQjcybzVUTlNpb0E4T0F0U2VYUnhhcnFZSGthRWdIM1F0dGZWRjBa?=
 =?utf-8?B?RDRXU0VLT0JxZUMxdGlUek4zZTR4MW9sV21LVVRadXdZMXNNamo0M1Vuei93?=
 =?utf-8?B?S2lrWjlxamtZSWdjZkFOYXNseSs5ZVRMZjJETER3czBKVTYrRWErakZYSzZP?=
 =?utf-8?B?cXpVa1MydjBXRmphNWIrRjEwdDZKT1BuM3VTNFB4Mi9TZHJsYTROLzFUZWxF?=
 =?utf-8?B?cW1vc0wrMEVoTXBUakMxWll1NHQrcGs3NTVWalovR1pRczBad1Z2YWxGNWVv?=
 =?utf-8?B?ellRazRTUFJiY2pUaE5tc3RmYUlTMG5INGtscGpUcjdhbUpjdkYrU3lRak1M?=
 =?utf-8?B?Z0txa01BM05YQ0U0a2t5TldUdFVpMnZ2OC9OL1JXaWdFOUp6dTg1Y2lvUFRX?=
 =?utf-8?B?QXJrdWFxNlFqdGdkYVFaTGVlVXhPWHNUQW5GRVRlM2FEejh0ZU1UZ3VQb3BO?=
 =?utf-8?B?cm00THBxajRiZzgwZHRRdmZ2NnlqSkV5aWJTT2hRT2ZyRFZ0Q0RBajNubmR2?=
 =?utf-8?B?ZFRkays1bDZKU3hsNTdiakYxTE5KT2hyTitycEZZMEk4RWEyY3pxMnFsTldV?=
 =?utf-8?B?bmtzRjJ5YlVZTm9TaDVEK09XMW11WVN2TWxGdU4rdGNCT1NmamZWbDFRRmE0?=
 =?utf-8?B?bW00OS9oc1doNktFSm1MQnd2SEp4Z1FBZFE3M0FTVkxZZ2JtRUtnakVZVEJ0?=
 =?utf-8?B?SUtJbGhyNFpBQW5lc0FLZE8yZmZSNnZiVGl0TVlhTkZIdWNCU2d0ME1JYzN6?=
 =?utf-8?B?b2VFZm41M3BLTTVNdHRKT1V4bmxqaXhaSnVvMFBXRE9oQWc3WTluZ2FyMnlj?=
 =?utf-8?B?NkJZUEtqL3I5VDlnMDl2L05aMFZJUHdhNkZtUGNPUE5yeVBLWXJPTzkvbk1p?=
 =?utf-8?B?eHMrUlVpS3NYNS9YcnJaK3UxYjJRMEp1Y2s2RFBPQ2kxZTUyK3lqeE1DSDZK?=
 =?utf-8?B?c0gwaHg3WEs4SGNxSTRBbGlsMzI2emxMS1VXZU16VlVXK2swYXFCMjJjbGU1?=
 =?utf-8?Q?ZMnEZ2FEa+jU/iTp+cHXwG45F?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ufN7wAVKN3eDkD2vjRT36henLNkn4X1MzTLNnHicm1PSHDhz5CNScGiN0aZPxliRy3SoITjNZ1Al0ih9rLKRoYKboOQLnQun9Ttkr4JGmSQ4BWMpIy++sZ8gSMZK/14wyToY3szw/rmKPvtyVpX7ui7TkxfEc/uO7dn73O4mjI9iP+b0nFZGuqdYdzC0MyIx75IMZdUmlJzjFkIQNSCJo8mYS4aifWP76hmRGAfRvpXlZ8+4YbOuazW9uTXTDG5bvExA87YeFIdBwB/nXadqJ20TSjCDpM8Gl7HazzO9SeNjLiPuiHsRdhmHY5M3qlD2WWIj1+Xp/XV8p859jUP3wUOQVQh/bGhW6ma0DApMiHtVtQUVCJRMmlW6njCQpDYlaS24TS6Bfy4EGswoed/o4qgEEey0cuffx3VNNUnDKQEL5L9NDzP7UZFcvHqIuzD/HDu6XHTUxUezDk/1CMWGd2HxYC8DVw/+d2Btqn+6A5pPadxp0+j6JcuVlC3OAnIId7ZfGg9uEovRNAonhyhHHn5TfoJ9tshElVjJCukTWVlI4nU3Yn1AexY0MPNptlg+ads3cfteDDsNMx/PYA2hhuF1oqXw0hexG+E5yzm+kIDAAB1qgzLp54X6P/Jx2WjltLfpMs9zSogaxOv+pblRcA6bu/Bkqn6djGMbacUdOREv7FVf6Y5UnpfNjIVAm920+WTR7RoZWp5S0+H8qFN3cnGoAKHQtWpALpPMedipYVB8B1QY4Wj4JwOtrvF+ex8jPBVHkhC7R8Schz7BIDKPfT3ExyH9o2Up0laXSdfGZG+B2l0jTNS9xHXQN6CIQcCrrVYczuJ0APhab8IGD+TGhg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9870c1a2-8a13-41c0-2204-08db516a0095
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 15:19:52.3097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mU8Eoa5srsX5Wq4qQ8i0xer9cQb8lbZSCro839pGaU1rV/ZKwoFvVUhBxqbiBBemRhcjPy82QSO1JmElsi4RRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5466

On Wed, May 10, 2023 at 03:30:21PM +0200, Jan Beulich wrote:
> On 10.05.2023 12:22, Roger Pau Monné wrote:
> > On Wed, May 10, 2023 at 12:00:51PM +0200, Jan Beulich wrote:
> >> On 10.05.2023 10:27, Roger Pau Monné wrote:
> >>> On Tue, May 09, 2023 at 06:06:45PM +0200, Jan Beulich wrote:
> >>>> On 09.05.2023 12:41, Roger Pau Monne wrote:
> >>>>> When translating an address that falls inside of a superpage in the
> >>>>> IOMMU page tables the fetching of the PTE physical address field
> >>>>> wasn't using dma_pte_addr(), which caused the returned data to be
> >>>>> corrupt as it would contain bits not related to the address field.
> >>>>
> >>>> I'm afraid I don't understand:
> >>>>
> >>>>> --- a/xen/drivers/passthrough/vtd/iommu.c
> >>>>> +++ b/xen/drivers/passthrough/vtd/iommu.c
> >>>>> @@ -359,16 +359,18 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
> >>>>>  
> >>>>>              if ( !alloc )
> >>>>>              {
> >>>>> -                pte_maddr = 0;
> >>>>>                  if ( !dma_pte_present(*pte) )
> >>>>> +                {
> >>>>> +                    pte_maddr = 0;
> >>>>>                      break;
> >>>>> +                }
> >>>>>  
> >>>>>                  /*
> >>>>>                   * When the leaf entry was requested, pass back the full PTE,
> >>>>>                   * with the address adjusted to account for the residual of
> >>>>>                   * the walk.
> >>>>>                   */
> >>>>> -                pte_maddr = pte->val +
> >>>>> +                pte_maddr +=
> >>>>>                      (addr & ((1UL << level_to_offset_bits(level)) - 1) &
> >>>>>                       PAGE_MASK);
> >>>>
> >>>> With this change you're now violating what the comment says (plus what
> >>>> the comment ahead of the function says). And it says what it says for
> >>>> a reason - see intel_iommu_lookup_page(), which I think your change is
> >>>> breaking.
> >>>
> >>> Hm, but the code in intel_iommu_lookup_page() is now wrong as it takes
> >>> the bits in DMA_PTE_CONTIG_MASK as part of the physical address when
> >>> doing the conversion to mfn?  maddr_to_mfn() doesn't perform a any
> >>> masking to remove the bits above PADDR_BITS.
> >>
> >> Oh, right. But that's a missing dma_pte_addr() in intel_iommu_lookup_page()
> >> then. (It would likely be better anyway to switch "uint64_t val" to
> >> "struct dma_pte pte" there, to make more visible that it's a PTE we're
> >> dealing with.) I indeed overlooked this aspect when doing the earlier
> >> change.
> > 
> > I guess I'm still confused, as the other return value for target == 0
> > (when the address is not part of a superpage) does return
> > dma_pte_addr(pte).  I think that needs further fixing then.
> 
> Hmm, indeed. But I think it's worse than this: addr_to_dma_page_maddr()
> also does one too many iterations in that case. All "normal" callers
> supply a positive "target". We need to terminate the walk at level 1
> also when target == 0.

Don't we do that already due to the following check:

if ( --level == target )
    break;

Which prevents mapping the PTE address as a page table directory?

Thanks, Roger.

