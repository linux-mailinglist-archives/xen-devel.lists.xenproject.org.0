Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E06A2476E57
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 10:54:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247793.427298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxnSw-0004lk-WC; Thu, 16 Dec 2021 09:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247793.427298; Thu, 16 Dec 2021 09:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxnSw-0004jP-T8; Thu, 16 Dec 2021 09:54:22 +0000
Received: by outflank-mailman (input) for mailman id 247793;
 Thu, 16 Dec 2021 09:54:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d0Qa=RB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mxnSv-0004jJ-4W
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 09:54:21 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2292947c-5e56-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 10:54:19 +0100 (CET)
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
X-Inumbo-ID: 2292947c-5e56-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639648459;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=szLyY7DcmobVGvk5LYxgpYXRbR5JQrtZcU/lfNYs3mw=;
  b=Ibvb81ZA73Kejn5FaekfJbCTn6/HrQjdi0cGo3tBWQeQmGxFFU7Uqy10
   f+VRszzNB7Qn9NMcikgaS1a9Y77hWCqpwF6og8UCk0gAf+7aEHFSCWJpZ
   oBYT2wXAm0J/AnKk58vYzNdXxMbH45uA9c+Gt0M8K/k2w791DTafWEXBt
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Tzt7NAjVVgNBoVIYh6zSQtyS4gQ3eikQCezd7CyUkZ9NOhJYtbsajZO8Xn3Fu6CtCxVg88cLfY
 ONOFai215HYN1ji+HtCJfkaoyNeJIYSGKnmisAoNMrR1EdrX7x7mkXBEdy4TZ/4ZxwtMK8UOSj
 /YgcaGV6sY+kIYTcgqVQyX0t6jx9sDKx6zV6zQlzxbI0eFPO7F3IlGsvoi7v0RXNI+rWYwfXmk
 rOQdOW66ORQx942/fEepFDh+0NsN2lBMuzZGhj2wGF2ziV6mNr+lZeWtb8qmjMeu2m9nDTCcuH
 7h5n3C7JTGN6NI2DNAWQgbeO
X-SBRS: 5.1
X-MesageID: 60159700
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Tma9hq4MIkrWborL5kQcVAxRtOfAchMFZxGqfqrLsTDasY5as4F+v
 mVOXW2Db66MZ2uhfIwkYI2/8kIP6J/Vn4diTARvryo1Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wrdj29Aw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z7
 9FO6o2PTAoTMfP+o8EHfiVHMDk9IvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgm9p25ERRa62i
 8wxZxhpLzfGUk11JmwlC5AiuMHvvXCkSmgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6Iq
 2SD82nnDxUyMN2E1SHD4n+qnvXIny7wRMQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlajuh1DSuVVHtc1tjO277D53xm6HisbG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnF447SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCslNOZJhKTysDA3CMqsyq7DFDFtW
 1BexKCjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9sBvWAlexc0aJ5fEdMMX
 KM1kVkLjHO0FCH1BZKbnqrrU5h6pUQePYqNug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm3BvrUuOFMuT50n2jtKjiIu9FO5t3K2mNbtisstpYWz9r
 r5iCid940kFDbClPHCIqdV7wJJjBSFTOK0aYvd/L4arCgFnBHsgG7nWx7YgcJZihKNbiqHD+
 XTVZ6OS4AOXaaTvJVrYZ3Z9RqnoWJoj/3s3MTZ1ZQSj2mQ5YJbp56AaLsNlcb4i/e1l7Ph1U
 /haJJnQXqUREmzKq2YHcJ3wjI1+bxD31wiACDWoPWokdJl6Sg2XptK9Jlnz9DMDBzacvNclp
 +HyzRvSRJcOHlwwDMvfZP+14Um2uHwRxLB7U0fSe4EBc0Tw6ol6bSf2i6Zvcc0LLBzCwBqc1
 hqXXkhE9bWc/ddt/YCQ166eroqvH+9vJWZgHjHWveSsKC3X3mu/2oscAuyGSi/QCTHv86K4a
 OQLk/ylaK8bnExHupZXGqpwyf5s/MPmorJXw1g2HHjPaFj3WLpsLmPfgJtKv6xJgLRYpRG3S
 gSE/dwDYeeFP8bsEVgwIgs5b7vciaFIy2eKtfllcl/n4CJX/aacVRQANhaBvyVRMb9pPd532
 uwmosMXt1SyhxdC3gxqVcyIG7Bg9kA9bpg=
IronPort-HdrOrdr: A9a23:2RBusKEtWV+WEPDvpLqFcJHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcT2/htAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtRD4b7LfClHZKTBkXCF+r8bqbHtmsDY5ts2jU0dNT2CA5sQkTuRYTzrdHGeKjM2YabQQ/
 Gnl7V6TnebCD8qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPof2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0auSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7vvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WrAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 ZT5fnnlbZrmG6hHjPkVjEF+q3vYp1zJGbLfqE6gL3V79AM90oJinfxx6Qk7wA9HdwGOt15Dt
 //Q9dVfYd1P7srhJJGdZc8qPSMex7wqDL3QSuvyAfcZek600ykke+D3Fxy3pDsRKA1
X-IronPort-AV: E=Sophos;i="5.88,211,1635220800"; 
   d="scan'208";a="60159700"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEQJIdOer2jQA/vN2sblRFwPC7/F/0Z1Ql/0Gbck0R07gDc2MkEdvg3YgOu8eP/3uZDSjzE+8nvNKFEwHTwLREYUSw5BZoVLOwz84CLrcZ7e+6Srtv6dywUhHzkVcC4DszP+uvuOF3Xe+48eokk6U9g6iUQ0Xwh0BU5ylOhGd6LHuP1g2o9h4EMzvztbeMIx5bYbWXqckdz5lRitIDAPtfhRqiAQ79oInKMolFNzudZXgYffzR+7WR4a6tJHMaksKMLR5buXgllCVZYEovG4Cjz2c7TL0x1FzDKt5AAc3nk1Gl4MCQJSCBDQ/znj6P1y/5XxCmHxPDyN8+ZODP8FTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ifj/s1+DTiS4db5Jgx1vQe5DmXzeizJkdHFj9VeABKc=;
 b=aA+BiQJsLPBZLvYDFZ7DUh0FYTPkM+yAzCV48hmGWyzH0uf/GDPiwHhqKwmWaJQC6cERyxpjjgR2KwPtZLfQxZYtzthCrs5D1dQgLtpL1VAGOKpoYUsaKgQxncC6lhk83an+FFOF2UpoT6OE2ijo6YyDw3nVzw+sVKUqMIM6m/XcZofciJWB0SgyHSFieuphvTmUeL4bmF67I53MXEme3uHFhGf9leZiomCuo20QfIR4aL0GF+fxNT/Et9v2XHGUb0xwb6ZkyKCTlajAw1Qv9ysebv+T8DA4AMuS7G4FirFyis8VCmXGHEzKN2yHS6tVH06Kjpl6t6yVeRvAQhX/oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ifj/s1+DTiS4db5Jgx1vQe5DmXzeizJkdHFj9VeABKc=;
 b=ewKFQQDW4S540UWNHmtP7YfR/BhsvzCNOuI0JehTvTlFdadUD7S0iPUo+BILEct8R2VbMsv45kasbmFvYFn4PvsHnYRc0kXORraIH6Mwgmrtb5G6p+rryTasIVgjgMxfh/PEPMiknXBorqnUaDmcOoCvVCMA2Y7o7nZJDTIaosg=
Date: Thu, 16 Dec 2021 10:54:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] revert "hvmloader: PA range 0xfc000000-0xffffffff should
 be UC"
Message-ID: <YbsMwIYFULP5sXQP@Air-de-Roger>
References: <036c6899-dbfe-eca8-7974-5a13d20455a7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <036c6899-dbfe-eca8-7974-5a13d20455a7@suse.com>
X-ClientProxiedBy: MR2P264CA0183.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::22)
 To SA0PR03MB5610.namprd03.prod.outlook.com (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a76e934-6e81-45dc-15f6-08d9c07a0411
X-MS-TrafficTypeDiagnostic: SA2PR03MB5818:EE_
X-Microsoft-Antispam-PRVS: <SA2PR03MB58185E2581F96275840BED118F779@SA2PR03MB5818.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YykwrkjkImRN72yrOqKn6+OMg3KFkUwobIOQnBzB/6c7uf/heyidLjpou4qyqpjJ1IgIaQ25CUkCZYDqbYjqAJCFADqf+pPFZGpLfV4hxnTF1r8fKhjWoF23Dh/0eC+a7kkKEs/dyZSajLBdYYuoIDGF5NPLKfd4mq01fdARHngTHY9G/FXdtkqi5SjtWlCT9HvcyN3nn5Mgj21nNRidwMhJe3RIQcHRPgBCH/fbqn60sD8qbpDbGJe/z5M/NML/DIV/j8N8U4o+bYguodOYjmF0RO2Eo/63lLpYNAZ2ZxwmLbV6+mHpho8dDrQ05ua9i+aPSTKltV/9bYgNmHcWohn+C1aHjvqUDGYMzCAgip93G8s4aADol6+a+Dikk5xUFkB1hvLJn0vMlRayD0Kh+POoWMVeuabGZwtLj61qpbElkjipAmsDoNaAgcxZLRwxSJmZ/vXpldrsB71immpgvucDfr2Wm3UpUMIhuBUgq8LbB3kWtRaKcjVrOU8LH7S8F5wGWYbX45yMK6o1hjHsAJTo2TDuBLrGd/jg70TowKGIYxiB9tLCgvjp/jSlEy53HGy09jVJBD8NxSLmX96Bx99+im8Dt0r6Kqv6fhJ57FJfPilLfTZFgCZRSkh2C2TcrHcaeywg2yfXhdaWz9qp8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(2906002)(33716001)(66476007)(6486002)(8676002)(85182001)(508600001)(26005)(186003)(66946007)(83380400001)(6506007)(6666004)(66556008)(5660300002)(9686003)(8936002)(4326008)(82960400001)(316002)(6512007)(38100700002)(86362001)(54906003)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2oyV2ppUnZhSmtySWFNRHI2U1VxaWRkVUc5TnUzcGtpK3hNMS94V08wV3FX?=
 =?utf-8?B?QXVrZHpVdTFKWE01Rk5OUXFZMmZjOXVYbEFGeVpaejZyRFJIY09MMVh4dWZH?=
 =?utf-8?B?M2pjQXNKTnRWWGhySlpFY3VlN3lxTlNhcHhqL0dwamxtdFI5WFlPRzA1Smt0?=
 =?utf-8?B?OXJURTY5NFhBRVFzUGFKTDcyWmRvM3oxRVRxUEtkTkZrMHhLRHpIdEd2dWxt?=
 =?utf-8?B?MlovbDkwQXJCdVpaNjRpZk02a1NmQThybHltcGorSEtQRjkycTZ4aVJ6dWEr?=
 =?utf-8?B?Qzl1SkJMTFR0QStqazFFMUkxSUt5NkwzUEdPNWphNWJFYmhSNUZNcU9KM1Vk?=
 =?utf-8?B?cVQ3ajcyWlpyR2g4WmphMHBHT3RSdWJxT1FvbXBRbWNwemdtRlQxRkNNT2JR?=
 =?utf-8?B?b3NlNVJoc1FHV29DYWlWdlpYRWNCTUd0aUc2Uk5ZMmZ4OHpDZzVLOTIxUDhj?=
 =?utf-8?B?Mnp3bXF2NEZ4bEg2YTBTNDZTTlQvTk9lUWZUc0l6UkxhWURxbk45VmhLd3dG?=
 =?utf-8?B?MUhqem80aHkxNjROUWJ2QXJoVDZrZUZEZjkwaGgybmNjd0lwK2YzZFZteG9I?=
 =?utf-8?B?c2RNSkFkMjBPR2krMzdxRndoMUFwRE5Cc2xtVXFibWYyc1UvNE85MXNzUkhx?=
 =?utf-8?B?STh1VUdSQTdQTHRUTHB2eE8zam1mN20rNTdLNVE0aXpjbEkwajVSVk5OREJM?=
 =?utf-8?B?SXNlYThnK2ljU3BNN1g3bmwrTFQvU3JncjJsNjFjOTRDUEk5UmlPYnZNc1Jz?=
 =?utf-8?B?Vk9STzQxc0dZMGdSUGt0QVBCK2hHL09SNkQyU2lwRElRam8ydExSZnFhVW14?=
 =?utf-8?B?R09DK0l4akJiQWVsdUJZckQveEZSeHJvS2svcDIxaFltb3dxcTU1RGkzQVJp?=
 =?utf-8?B?QnNma2l1VWlwQ21TaWw0VlQyQmsxSnpvMDZXTjYyNS9QbXllV1EyMG9BYzhm?=
 =?utf-8?B?WlR6T2VndGtadlBEWWw2c3ppM1doZHVVTGxndUpUaVFNbXpMSEg5VlRtSWln?=
 =?utf-8?B?dEk2a1I3allHU0srOVRSbVJCN1A3QVlxM0VlY0lNbWtjYm9mUG5nOGNOcHFL?=
 =?utf-8?B?S1h5cmhHbEczeGw2ZlZFbzFxUFMvM3ZkOVhzNWhndnJLb3dUR3krMzhFWWZN?=
 =?utf-8?B?N2x4OFZobHVHT0hnd0VMU0xBaW92N01sYVZOOXpTWnRqVjVOQklIMDFyemJU?=
 =?utf-8?B?cEFUd3BBTGRlSS9QbjRpdkFkcXY4M3l5eEJONXdmQzErdGZZbmcyR2xMUCs5?=
 =?utf-8?B?Q2pmenVHUG83NUhMWVBmbEV0UEk1RUlyZDlVN2FkVEFXVzVyUlVWdmtVc2N4?=
 =?utf-8?B?ZTJsMkdTcHdYbFAvRC9vUWMyeEQrY0p2K0hJcEhYaU9XZ281YlBEaStEOCtu?=
 =?utf-8?B?OWlYQzk3Q0VtMERhRjd0NXc2NE9WcnR6dUszdGpSaVpjNUI2bU9SWDhrMHhv?=
 =?utf-8?B?YlVIemtsQ2hZZEkrcTlOVVRoZFo3azkvd2J2NHpXa01ZaUpSN2pvUXh5cHdZ?=
 =?utf-8?B?WSt1ZXNUWVZnbE10UGw5Vit3WHdmTVkrTHhvM095UjZFdHV2d2tEWmdOQ0Vi?=
 =?utf-8?B?elYxZU01VitiVkdxbUtOdk5NR1JQcjFkcmtoV2Q0Nll4cTRWczVLQUJhNUU4?=
 =?utf-8?B?eUtabis5T01EeE1lUUt4T0JLaTFralBPQ3BKbXV4SEloL0pZT3JJRGVEN0Zh?=
 =?utf-8?B?U3NaZER1YUNPOTJZNHVMNVE3N2xDMkVXOWlRU3JJYUNCNFdKOCtiTm00RUV3?=
 =?utf-8?B?am8ybE9lRnhBd2grMjdiS3JZTHlveWJheEdQazk1ekxKb2JEQ1pqRFl1ZlVO?=
 =?utf-8?B?OWdodFdwelhuSVp6VWRNQlZsTW4yb3FiK2UvRlpid09YQm5ISTFheVdyVmxx?=
 =?utf-8?B?a1hMa2dYSU13RHkwbjViWi9QZ2ZIdzBPV05Nd3pBZ0ZCanJ4Q1lQZVBObGRx?=
 =?utf-8?B?aHFXNC9xMmFqZXhBVlh3NFl1RDhTSmVyTGdlY3d6L2d4UENjY1oveWZINTdh?=
 =?utf-8?B?d3RVbjRJaVEvYlpiOUM0alU3dXpGaWozQVhWTGtZaVgrMEdYTWtFT1p0YkNj?=
 =?utf-8?B?ZTUyQ2JaZlJ2MXpHQ0tUSmV2aVZXTVN4eE14TWNzOEE1NUpaTXhDQ0drMk0r?=
 =?utf-8?B?d2h2ZHoyMDRVMmpCd0p1SmtOdUpnK3g4SC9DQndld28vVVA0OWdXTjBTNUdU?=
 =?utf-8?Q?L2rjzF1yAfHMg/zmAQBEfz0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a76e934-6e81-45dc-15f6-08d9c07a0411
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 09:54:13.7970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dW2clUITJrXs+pnKeCq2irK7+eND8B//jsySA6ijHHtWSZacnH3B6Sw/rNlqJv6MmaSSQ8f9C6goBFHaENAfpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5818
X-OriginatorOrg: citrix.com

On Tue, Dec 14, 2021 at 09:21:22AM +0100, Jan Beulich wrote:
> This reverts commit c22bd567ce22f6ad9bd93318ad0d7fd1c2eadb0d.
> 
> While its description is correct from an abstract or real hardware pov,
> the range is special inside HVM guests. The range being UC in particular
> gets in the way of OVMF, which places itself at [FFE00000,FFFFFFFF].

I would assume this range to be unpopulated? Does hvmloader populate
it in order to place ovmf?

> While this is benign to epte_get_entry_emt() as long as the IOMMU isn't
> enabled for a guest, it becomes a very noticable problem otherwise: It
> takes about half a minute for OVMF to decompress itself into its
> designated address range.
> 
> And even beyond OVMF there's no reason to have e.g. the ACPI memory
> range marked UC.
> 
> Fixes: c22bd567ce22 ("hvmloader: PA range 0xfc000000-0xffffffff should be UC")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

This is just a hole from hvmloader PoV, so it's fine to not apply any
specific MTRR attributes.

Thanks, Roger.

