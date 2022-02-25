Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E6E4C476A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 15:27:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279154.476726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNbZ3-0000KE-W6; Fri, 25 Feb 2022 14:27:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279154.476726; Fri, 25 Feb 2022 14:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNbZ3-0000IA-ST; Fri, 25 Feb 2022 14:27:21 +0000
Received: by outflank-mailman (input) for mailman id 279154;
 Fri, 25 Feb 2022 14:27:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=halk=TI=citrix.com=prvs=048fa7b34=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nNbZ1-0000I2-TD
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 14:27:20 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08450661-9647-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 15:27:18 +0100 (CET)
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
X-Inumbo-ID: 08450661-9647-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645799238;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=02JAWAv02yBJddYouoIiPUrSkCTCLharLLXH/U//9Ys=;
  b=Z0+5wquxP+i+ONYsBuYT0qXgUbwtXxcaltWTML8gPoCHoKY3SCps4usp
   PaoZ7LQARB0eFsHCwGqK3jTpwAdTrYFxpoRypwggBAveMkLMNa1NZ44P+
   78pvEEFlAizWLmD18W23g6Cw0wfaxs18MesJnbO3FwZZVLIE9VVKF/Byp
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64994181
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Lf4lBaC4GEIV9xVW/9Hjw5YqxClBgxIJ4kV8jS/XYbTApDInhTAEn
 DAaUW3XPPvcMzDwf9txPdi0ox5U6p7cm4MwQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Rj39Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhW7
 e12qJGfSzsIO4yUmb0PaEdbH3lHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwBJc/meqYWvnhkxDfUJf0nXYrCU+PB4towMDIY2JwfTKqHN
 5NxhTxHUzP7ajAeCk4rKMgfzMGluCjAVW1UtwfAzUYwyzeKl1EguFT3C/LZc8KHbd9YlUGZo
 iTB5WuRKgoBKNWVxD6B83StruzChyX2XMQVDrLQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAaykuvSdXsWgyil1SNtBUcRtl4HvUz7UeGza+8yxmdLngJSHhGctNOnM08SCEu1
 1SJt8j0HjEpu7qQIVqf67OVoDWaKSUTa2gYakcsTwQf5ML4iJoulR+JRdFmeJNZlfWsR2u2m
 WrT6nFj2fND1qbnyplX43jgpgqXu5XmTDIU4ySPXzu31V16aNacMtnABUfg0d5MK4OQT1+kt
 XcCmtSD4O1mMaxhhBBhU81WQuj3uq/t3Cn0xAc2QsJ/r2jFF2uLINgIiAySMnuFJSrtldXBR
 EbI8T1c65ZIVJdBRf8mOtnhYyjGIEWJKDgEahw2RoYfCnSSXFXelM2LWaJ29zq8+KTLuftiU
 ap3ie72UR4n5V1PlVJavds1374x3TwZzmjOX539xBnP+ePAOCPKFe5ZbQPWNrhRAEa4TOP9q
 Yc32yyikUg3bQEDSnOPrd57wa4idxDX+qwaW+QIL7Xec2KK6UkqCuPLwKNJRmCWt/89qws8x
 VnkAhUw4AOm3RXvcFzWAlg+OOKHdcsu9hoTYH1zVWtELlB+OO5DGo9ELMBpFVTmncQ+pcNJo
 w4tIJ3RUqwSEW2co1zwr/DV9eRfSfhivirXVwKNazkjZZ9wAQvP/97vZAz08ycSSCGwsKMDT
 3eIjGs3nbJrq9xeMfvr
IronPort-HdrOrdr: A9a23:LXTLLaDrbPykj53lHegbsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPEfP+UsssHFJo6HkBEEZKUmsuaKdkrNhQYtKOzOW91dATbsSoLcKpgePJ8SQzJ8l6U
 4NSdkcNDS0NykBsS+Y2nj3Lz9D+qj+zEnAv463pB0NLT2CKZsQlDuRYjzrSnGeLzM2YabRYa
 DsgPav0ADQHkj/AP7LZEUtbqzmnZnmhZjmaRkJC1oM8w+Vlw6l77b8Dlyxwgoeeykn+8ZizU
 H11yjCoomzufCyzRHRk0XJ6Y5NpdfnwtxfQOSRl8kuLCn2gArAXvUgZ1TChkF3nAic0idurD
 D+mWZlAy210QKXQoiBm2qu5+An6kdp15at8y7AvZKpm72HeNtzMbs+uWseSGqD16NohqAM7I
 tbm22erJZZFhXGgWD04MXJTQhjkg6urWMlivN7tQ0WbWIyUs4mkWUkxjIdLH7AJlOO1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGcl2E+pgEy82IIgMgE2nsQ/pM0TJdJo+
 zCL6RzjblLCssbd7h0CusNSda+TmbNXRXPOmSPJkmPLtBNB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8XU/fkr/YPf+q6GjMiq9NFlVcQ6duf22vaIJyoEUbICbQxG+dA==
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="64994181"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cy4nsMTgmJA2CS3cNXnEX4NhjPl8Fz8MMIfaMLQpLUpWjzUuuT+2ssPOwJd7QUtalM/qFob+0I78StvcM6gq0/ZgU1jI/7ZvjdjitlVqB6J4CV3Ndh2e7aZkbj4IIE/vy08vPo31QIfNsAB4cBczpNwsJMVLYg2MxSPGu0yhkToyTwPty1aSx3Wv57VzP8spysm9xFsPW9nla7+f/symgTprIFL8fbrmKRR0ilmNGHm3Rb/YrQ0z+ucxmI5YZbmT9m+GuQG6qIx3B7sa2NZ7pWw2/vAMcFqMCneMPJVfRgv5IFEdDjrIueuw671O3ed/0tcHNStECufgyAVfyavyww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02JAWAv02yBJddYouoIiPUrSkCTCLharLLXH/U//9Ys=;
 b=KJGRUMX3SjMEA5RYgSuXBPzJPiQlK8zkBPlj1G8ciqPrUZhtvX89ch8npLP8LrMSEqXo3hDRtrvGsq9c2KDyKxY2Z5j9uQ3prgVMp4AALk8fSZIlPDtXJ9IN2bx2aYd7tfn4HpZAJ072AeK0FMfsPN/Kmb2MILnc6CV1mDvWlovxLWniEsLKcIrJTCw203qjGDddw3JsgNneDm8EQ/itsHXZXeE4m35NcQg80e1lvAodgbjFieZCaoPswQoQEpjH6ffT2OKh06/BhfvOZAX6ugQzBI3jtxiW0asvrJKPlmgWCzQKakihvfulc0STGPJEsthar8KIik+MbRf9o6+LAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02JAWAv02yBJddYouoIiPUrSkCTCLharLLXH/U//9Ys=;
 b=uBACfVh87DxrQGRFFqZuF71qgbjalL3w1QRrfqWm6ZMkEWQrTl6dNmALOxREgqM9lRf1YKgm+Ykjc/7JaGT2o9W0nnv8YTbgTQJwI/WOP205SleVdN8AKUVBvXQtfKygKhE+QkHaTcw80NmFtPvgfhXZn9AaUR/OxTXGACOmsmA=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "George
 Dunlap" <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Topic: [PATCH v3 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Index: AQHYJO0/E2Q9kBLnmUergICAnT03vayiyEcAgAAtrYCAAAFvgIABZk2A
Date: Fri, 25 Feb 2022 14:27:11 +0000
Message-ID: <62fa98a0-09a9-0af4-f289-d89cfcf8e046@citrix.com>
References: <20220218172943.12182-1-jane.malalane@citrix.com>
 <20220218172943.12182-3-jane.malalane@citrix.com>
 <b83773ec-c97a-7aea-e61a-c2e34b270816@suse.com>
 <50854702-490a-521f-c4af-1de57d4abf4b@citrix.com>
 <e7c952bf-ac8a-156f-6015-738ff5eaa138@suse.com>
In-Reply-To: <e7c952bf-ac8a-156f-6015-738ff5eaa138@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b8fd214-27b1-4da8-5377-08d9f86ae97a
x-ms-traffictypediagnostic: SA0PR03MB5466:EE_
x-microsoft-antispam-prvs: <SA0PR03MB5466F5EBC0A5E34F127E220F813E9@SA0PR03MB5466.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ETTn9W9k+gLffzFw4hefcyb9ndXkvUddOaRROCAt2+rJ2paYAHtdC716FC4/d2gwNwYgk9y6SWzO8HuJMbh5C0gi1p6802dr9NMmT0uXQ9+4evG7GZDjFrmryysR9/J8IRiu8wcID4cm0j2FYVyv/V/XFTSS0xfOG0tgXt3oaJdFiFy7ZuZzkg5pJb5CuDPHQFMs5YJaIrRsNKHVnV0RyrBMbzkt2ZCeWLHrFk21G0xXQuVlpUMD8Bi4gn0cRJbEMtKk4/miGC7M0rTZDtWz62A2PvheMQvxetis/kPJIf/ul/+rcSDQ8JpsyOJQ60B1Bx5pz1ne1O23acVJKIcR6L7/Mk79/fjac9nVVpJYY+zHQWQxU1i8aeZif9H76W6PG8zfjDepsvNvlta2Y+3qEbawDdheyRwcpW9oWfjTqjtd5AHtx/owQsr5TZu3l4lenQuVXus/iZcw2bzcqGh217CFDeKW0lKk4satN3ex/Z8yFYvxPARshqzTbcT/CUG02B9mN2W3NQo8JiwX81tZQxQjYFdj70yMLelljMRfLuoi9Uz/xNtqL7ulRuoPx54ozX1sishodic0neK4RIP9so8TLrqNbXh4EsVAUgo7LsydQICXcNLevQ14+34joHE2Wz6GzvF1Bxf/v1U8Zg3ol7FjrhV2Z+zoq4u4LGRPBV1aq3lOq9X5bBMz8L5EfKjYUnPyionv3lHxqGUOGWRmm06JRZWrG/iK084Z/e0cq0ZtP2r2NC0JyeI540vjdBj8
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(6486002)(122000001)(5660300002)(31696002)(82960400001)(38100700002)(316002)(36756003)(83380400001)(54906003)(6916009)(186003)(26005)(31686004)(2616005)(4326008)(8676002)(53546011)(86362001)(38070700005)(508600001)(71200400001)(8936002)(66446008)(66476007)(66556008)(66946007)(91956017)(76116006)(64756008)(2906002)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?amU5MkdyYTFwVU55QWpsL1pya2tMb0RBcmlYdks4NXh0YVlZTndVNnMzb0Q3?=
 =?utf-8?B?SklXdGRTSHJNRFNqNUV5S0tmYStnYVJ1NEZmek5FS3RRRXlBTXowb0lRc2ZH?=
 =?utf-8?B?dlRmZlpZbEVFdFRGcUZiWUNWc2szZ1BWeTRqRG9Rdllpam5rOG94bUU4TDUx?=
 =?utf-8?B?NlZXaVRGejJLdU0wMVZlUWNmRi93YzdIZ3p0NTJ3T0JVcWRZeUpXclpINHJL?=
 =?utf-8?B?M0hjWU9hbVpwbDJZL2Z2UXduZ3ZBOG5VNEhMOHZHWUMyVWcxZk1oUGtnSVZY?=
 =?utf-8?B?d1RCTktlMXlzMVNhRFBjQit3OUJYZGg4dnk1czB1ZVI0eDk3WlhjRXpvalJm?=
 =?utf-8?B?US9ERytHWnM5WG9IZk1rZUt2V2dlU3lqT1RZRkhlQk1tUThxTVk5ZC8rcE4r?=
 =?utf-8?B?aXFSRzJzMXBUdjllWVdWMnBaSUFKWjB3RkF3MW1PN2xSMDcyT0tuWHZ3dHMw?=
 =?utf-8?B?OWF0RWtHOFhZQVdsWnp5ZE5PUlRHdDc3MDY3ckNRM1NWU0s0Y2o5ZVZjK2hn?=
 =?utf-8?B?dVdGaEV0dE9ua2tMcnQvMDBSNk5SNVNxUGlIa09kWHVZZldGcTdXdGM1Lzdj?=
 =?utf-8?B?MkJ6Z1llRm93UVJvczdHWVJtdEswNDVlRjRhak5XLy85N3BZNXRpdG9YdExE?=
 =?utf-8?B?VXBWcHcyZ3hpVExRSElMZGlNR25aNXhDbHJLeE05bGF2RERLNHZQTEU2RnRZ?=
 =?utf-8?B?OXJuY3NTSloxMFFBYjNCaXpkbm1qVXlOTnFQb3BKbWF0VVNoeHZJK1JNN2JK?=
 =?utf-8?B?RGtHZFZzcmwwSHVMN01XL0t6aDREZjBMeEp5WlE0a3FNUEdCczc0cC9GOE1x?=
 =?utf-8?B?WnMxVUJld0hjVDJXNURvaThrNHBrTGQ1WEZHMFU4NTZDMXpFcGJTYmc1TFVK?=
 =?utf-8?B?cFVKRGpLRFpKYzd1b0hmUUJhc094bG83UnZWck9qUmdFc3o2Y2FuQ2o3Z25E?=
 =?utf-8?B?NnMwZFJKSzlqZGZWV1BuUi9hN3pXRXQwOWw3cW5STkVtUk52K3A4WmlDcTh5?=
 =?utf-8?B?Y3dqWFlSc0FVUjBKc1l3NDRWcUdrazVpbVVTU0FoZlhBdFNzbExDMDcvdXll?=
 =?utf-8?B?VU5LdFlCaTVnVHEyUEE3Unk0c09teWV6QXRMTERXc3V5UkhIT2lwMjBFalZ0?=
 =?utf-8?B?dDhOb3BtMmpBNmdEVlRVVUZjaHdxd2xYWDVmc3BSRlRZRlVEWUJpczcwVW00?=
 =?utf-8?B?UjBJSHVqeldodGV4a2VOck92Ulh6K3BaVTRzKzF5ZFRGUFBTa1dpYktuSlNH?=
 =?utf-8?B?VGhXcU1WcU9FWFVoREZkcTQreEl6VUwwdEJYLzhpRzVqa0pzckY3cERqYXIr?=
 =?utf-8?B?dDYxWjBkcmJXS2hLcUdMUTh1MnhqMFN2dVdBUHZtYkJ1M2hoNXFZL0RsOFh5?=
 =?utf-8?B?QXhFTTZ0VGd0MmN5MCsvc2hFTUR6blloUVpDNkVrMVJaQUxjdzlpb0xZZm1E?=
 =?utf-8?B?S0YveFVkTmJiMEQwU05ic3BxV3NxWXdiSHcvd1pjcDl2V1pWWlc5REhRVXZy?=
 =?utf-8?B?VHdnOG82dzFCVUpoY2dmdmRDN0hocnFyYUxxek14NkZyUUJRZ2hDeGgrRUJD?=
 =?utf-8?B?SVpIaGhkay9HOXdBajhpOXh5OFQrUzRPZTlnSHRkSXllTkZOZXR1MnpjUzNr?=
 =?utf-8?B?dkNQMTI0Ym5laGlmL2Yra3Izd0ZON3dXU1VDRnV5TlNXQk43MGxBbXRKY1Qv?=
 =?utf-8?B?aS9NQmgzV3pGY0F3Rnk2K282TVNjMXg3Q2d2SklJZEJNbjB1amd1dzhyQUFh?=
 =?utf-8?B?Z1JTcCtkWUtjUDdTQ1VubjYzVDdyOWVEbnp1T2pORWk5b2p1aHg0K1ZIdVI1?=
 =?utf-8?B?bjBoOTI2V0trc2FEQVl0NzUvRWZ1WHNML21oMUpTZ0d0UUtuNXB3MWN5Znlo?=
 =?utf-8?B?OVcvdXRBK25iVllYeUFvcC85L3N2ckFhdGcwblJ1bDdKZkZFMkV4cGJKNmd5?=
 =?utf-8?B?L3Z2N2RvbTdKeHNaN2FNU0tOalNnZldGSm5jZ3lWVGluYmpKTlZRT04zTVZa?=
 =?utf-8?B?d0M4ZnZ5MHBURy9FYnlsVGl6cllLNnFPampMeUNDZEMveStsdkE2TkcrdUJK?=
 =?utf-8?B?UGZxeTJuNUg3WURzNWZja3FHc3QwaGh3dWRWQml6VFgwQ09vRmFySlNTZVk4?=
 =?utf-8?B?SEh0NXpvSERIRjJYTFZLSHVqM3lMTXMyekNXSDdiWGxHbzVqRll1UHRIbTRl?=
 =?utf-8?B?ZU1aK2txRktDQVBDMERQbHFML2JDSWZLUnRMa0dPNUc4bnJtN1ZTVUdWYjBa?=
 =?utf-8?Q?tghuDA1T1TbhaeXBNwlkEUC8i/CTJsblTJ9C/jONmo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4AAA76416F20B4CA11B19664C1E0FAC@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8fd214-27b1-4da8-5377-08d9f86ae97a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2022 14:27:11.6497
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: orXDXlVOpIZV5hbeY2dbiI2gofroFGCBcPsd+KL6mX3VxNxsmtjwI6lgPz0V6m2PQN5VWpG04DCwuq+BFq81j6OLf2T2X0XBlpq/ziVZHUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5466
X-OriginatorOrg: citrix.com

T24gMjQvMDIvMjAyMiAxNzowNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI0LjAyLjIwMjIg
MTc6NTksIEphbmUgTWFsYWxhbmUgd3JvdGU6DQo+PiBPbiAyNC8wMi8yMDIyIDE0OjE2LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBbQ0FVVElPTiAtIEVYVEVSTkFMIEVNQUlMXSBETyBOT1QgcmVw
bHksIGNsaWNrIGxpbmtzLCBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgaGF2ZSB2ZXJp
ZmllZCB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+Pj4NCj4+PiBP
biAxOC4wMi4yMDIyIDE4OjI5LCBKYW5lIE1hbGFsYW5lIHdyb3RlOg0KPj4+PiAtLS0gYS94ZW4v
YXJjaC94ODYvaHZtL3ZteC92bXguYw0KPj4+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92
bXguYw0KPj4+PiBAQCAtMzMzMywxNSArMzMzMywxNSBAQCBzdGF0aWMgdm9pZCB2bXhfaW5zdGFs
bF92bGFwaWNfbWFwcGluZyhzdHJ1Y3QgdmNwdSAqdikNCj4+Pj4gICAgDQo+Pj4+ICAgIHZvaWQg
dm14X3ZsYXBpY19tc3JfY2hhbmdlZChzdHJ1Y3QgdmNwdSAqdikNCj4+Pj4gICAgew0KPj4+PiAt
ICAgIGludCB2aXJ0dWFsaXplX3gyYXBpY19tb2RlOw0KPj4+PiArICAgIGJvb2wgdmlydHVhbGl6
ZV94MmFwaWNfbW9kZTsNCj4+Pj4gICAgICAgIHN0cnVjdCB2bGFwaWMgKnZsYXBpYyA9IHZjcHVf
dmxhcGljKHYpOw0KPj4+PiAgICAgICAgdW5zaWduZWQgaW50IG1zcjsNCj4+Pj4gICAgDQo+Pj4+
ICAgICAgICB2aXJ0dWFsaXplX3gyYXBpY19tb2RlID0gKCAoY3B1X2hhc192bXhfYXBpY19yZWdf
dmlydCB8fA0KPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNwdV9oYXNf
dm14X3ZpcnR1YWxfaW50cl9kZWxpdmVyeSkgJiYNCj4+Pj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjcHVfaGFzX3ZteF92aXJ0dWFsaXplX3gyYXBpY19tb2RlICk7DQo+Pj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdi0+ZG9tYWluLT5hcmNoLmh2bS5hc3Npc3Rl
ZF94MmFwaWMgKTsNCj4+Pg0KPj4+IEZvbGxvd2luZyBmcm9tIG15IGNvbW1lbnQgb24gcGF0Y2gg
MSwgSSdkIGV4cGVjdCB0aGlzIHRvIGJlY29tZSBhIHNpbXBsZQ0KPj4+IGFzc2lnbm1lbnQgb2Yg
di0+ZG9tYWluLT5hcmNoLmh2bS5hc3Npc3RlZF94MmFwaWMgKGF0IHdoaWNoIHBvaW50IHRoZQ0K
Pj4+IGxvY2FsIHZhcmlhYmxlIGNvdWxkIGdvIGF3YXkpLCBqdXN0IGxpa2UgLi4uDQo+Pj4NCj4+
Pj4gLSAgICBpZiAoICFjcHVfaGFzX3ZteF92aXJ0dWFsaXplX2FwaWNfYWNjZXNzZXMgJiYNCj4+
Pj4gKyAgICBpZiAoICF2LT5kb21haW4tPmFyY2guaHZtLmFzc2lzdGVkX3hhcGljICYmDQo+Pj4+
ICAgICAgICAgICAgICF2aXJ0dWFsaXplX3gyYXBpY19tb2RlICkNCj4+Pj4gICAgICAgICAgICBy
ZXR1cm47DQo+Pj4NCj4+PiAuLi4gaGVyZS4NCj4+IFByZXZpb3N1bHkgd2UgZGlzY3Vzc2VkIHNl
dHRpbmcgdi0+ZG9tYWluLT5hcmNoLmh2bS5hc3Npc3RlZF94YXBpYyBlcXVhbA0KPj4gdG8gb25s
eSBjcHVfaGFzX3ZteF92aXJ0dWFsaXplX3gyYXBpY19tb2RlLCB0aGF0J3Mgd2h5IEkgaGF2ZSB0
aG9zZQ0KPj4gYWRkaXRpb25hbCBjaGVja3MgYXMgYXQgbGVhc3QgYXBpY19yZWdfdmlydCBvciB2
aXJ0dWFsX2ludHJfZGVsaXZlcnkgYXJlDQo+PiBuZWVkZWQgZm9yIHRoZSBzdWJzZXF1ZW50IHBh
cnRzIG9mIHRoaXMgZnVuY3Rpb24uIEkgbWlnaHQgYmUNCj4+IG1pc3VuZGVyc3RhbmRpbmcgeW91
ciBxdWVzdGlvbi4NCj4gDQo+IE15IGV4cGVjdGF0aW9uIHdvdWxkIGhhdmUgYmVlbiB0aGF0IGFz
c2lzdGVkX3gyYXBpY19hdmFpbGFibGUgaXMgYXNzaWduZWQNCj4gd2hhdCBpcyAoaW4gY29udGV4
dCBhYm92ZSkgYXNzaWduZWQgdG8gdmlydHVhbGl6ZV94MmFwaWNfbW9kZSAoaW4gcGF0Y2ggMSku
DQo+IEFueXRoaW5nIGRldmlhdGluZyBmcm9tIHRoaXMgbmVlZHMsIEkgdGhpbmssIGV4cGxhaW5p
bmcgdGhlcmUuDQoNCk9oLCBzb3JyeSwgSSBrZXB0IHRoaW5raW5nIHlvdSBtZWFudCBjcHVfaGFz
Xy4uLiBpbnN0ZWFkIG9mIHRoZSBsb2NhbCANCnZhcmlhYmxlIGFuZCBpdCB3YXMganVzdCBhbGwg
Y29uZnVzaW5nIG1lLiBXb3VsZCBpdCBoZWxwIGlmIEkgZGlkbid0IHVzZSANCmEgbG9jYWwgdmFy
aWFibGUgYXQgYWxsLCBvciBjaGFuZ2VkIHRoZSBuYW1lIHRoZW4uIFRoaXMgaXMgcmVhbGx5IGp1
c3QgYSANCmNoZWNrIHRoYXQgaXMgZG9uZSBiZWZvcmUgZXhlY3V0aW5nIHRoZSBjb2RlIGJlbG93
IGluIHRoZSBmdW5jdGlvbi4NCg0KVGhhbmtzLA0KDQpKYW5lLg==

