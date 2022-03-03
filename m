Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 678084CC6BD
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 21:02:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283730.482831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPreZ-0001Zi-CF; Thu, 03 Mar 2022 20:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283730.482831; Thu, 03 Mar 2022 20:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPreZ-0001Xs-94; Thu, 03 Mar 2022 20:02:23 +0000
Received: by outflank-mailman (input) for mailman id 283730;
 Thu, 03 Mar 2022 20:02:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=++p5=TO=citrix.com=prvs=054f29298=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nPreX-0001Xm-Jt
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 20:02:21 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3fe2441-9b2c-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 21:02:19 +0100 (CET)
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
X-Inumbo-ID: d3fe2441-9b2c-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646337739;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Urch2SAdWlJOjEgLahikV4ROS4eP8W7WNa29IKN8kIE=;
  b=ZhC30Bs7yb5kKBKZxW+QkApBOR/O0ajvkAgNa3Zk2fziRhsS4zcO5VvO
   I/1BxuhDghMqfwKo0clONShZN3FrBuilYU1BlPKm8uNdkvLiP3+6NDvLT
   PslD33d6lhu/GHwzx/p4RU30VtSSvKWUMtd3w/oVhdU2tDsf3RjlQigky
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65422815
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:jtuP7awdPSDB+6trNL56t+cvxirEfRIJ4+MujC+fZmUNrF6WrkUEz
 WMcXGDQaP7ba2TzctgnOYu/9xxU65DTxoRrHlE5/CAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz2YPhWGthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpliKa1ezgoYZDwv/00fwJ9Sg1VAIMaweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 pZDM2o2MXwsZTV1JgkeLpI/pNzwrXLTLm1K+FOPtYQOtj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKgEXMpmTxCSI9lqoh/TThmXrVYQKDrq6+/V2xlqJyQQ7ChcbSF+6qvmRkVOlVpRUL
 El8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO9AA7TOyy/Xp3yGAL0Qfa2dtQ+EI6PZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WoQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtACzARVodt/xory9U
 J4swZL2AAcmV8zlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk1bJxYJ2O4O
 xCO4Gu9AaO/2lPwN8ebhKrrVqwXIVXIT4y5Bpg4kPIUCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bcmin3yPjOrPDFbIGOxtGAbfMYgEAFas/Vy9H
 yB3bJDRlX2ykYTWP0HqzGLkBQtSfChjWMuv8JQ/myzqClMOJVzNwsT5mNsJU4dkg75UhqHP+
 HS8UVVf013xmTvMLgDiV5ypQOiHsUpXxZ7jARERAA==
IronPort-HdrOrdr: A9a23:iv6UIazbDeuljpMd1Z0GKrPwKL1zdoMgy1knxilNoHtuA6ulfq
 GV7ZAmPHrP4wr5N0tNpTntAsa9qBDnlaKdg7N+AV7KZmCP0gaVxepZjLfK8nnNHDD/6/4Y9Y
 oISdkaNDQoNykYsS8t2njbL+od
X-IronPort-AV: E=Sophos;i="5.90,153,1643691600"; 
   d="scan'208";a="65422815"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJs+g+QI8Jd/uTy1c4QgzA3HxjXl/VRviPbWJuYhhPcYMmrNwiibGbHaNyozw+PgiPtdKEkFiTAU/M0NE9KEEYZ/21SAP1WJCkS3qTk7D3gfhSS8dEuOkXXl6VKo0mBTcJobzLYoVrvoMyj65WyNyCjk4kg6Lrs3q6xmt6MnYcrdTnZFj40nMuamYQu0KZBC1uynawtLpdYR/rinNpjWzgROVVmvTWAFI336OtlF1fE9pOlXm4vQyom1JeAMGe7qIGMO/7SoydzzAle3XyfY7Rq7MeMhbqc/LoegE3RWxScnMNw3bing0bsSTqhkx+nPXDw5VF5HIYf1qjtIZYFuZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Urch2SAdWlJOjEgLahikV4ROS4eP8W7WNa29IKN8kIE=;
 b=i5PzIJ043IV6QKSy4b5lWeDj/0iFWvxV4xwBTGaw3ROC+Kmbbd3+BvvR/Rmy3lthw8zfyntZnTx6TPej2Dj0r504Jz0ycItdcmtADmxGqKbs3gtorQBqYTi4SoSktMm6f06J3l6Qq5ELhljE6EHOCx4e9PRvN4/yamoFL46ZSS4SMHFZykLpOWCWyNVZ0+HbGPDnmFCdctC+4vESvlL4N7u/izH+KCqgZORBf+/dnk9J1SxuTs7i+gUB+CLkPDlYpGlW1ILFonGkw2IrxamXLh6Vopjwk+RflJAnXQDODJ5P23NB4d3pXzGZ7yXS4YfDxTtyuIrY4oZevLUvQKVv1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Urch2SAdWlJOjEgLahikV4ROS4eP8W7WNa29IKN8kIE=;
 b=mCyJtjiZ3Hi0ZkXHnWbpOef3eIEGNyNYSVyx3oissRZz059Mp3Pa2FyGj9ZGXiH3cjc9tXRXfzw6ITB6hjcOUYJ8ZbVbm/Lj3ogTu5VcSQkwO7DjQblXrLWqI8pk2XpS6oZ31Lg9IUxtdCGfqNkeE6Lh6to7NMD0Md5bhIDOYeM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: [Regression] [PATCH] x86: fold sections in final binaries
Thread-Topic: [Regression] [PATCH] x86: fold sections in final binaries
Thread-Index: AQHYLUom+7MvssZr9kajAcxWuiy9JqyuGI0A
Date: Thu, 3 Mar 2022 20:02:10 +0000
Message-ID: <85b6a876-ac8c-051f-5b61-23c58b29c1dc@citrix.com>
References: <03851bd4-9202-385f-d991-c9720185c946@suse.com>
In-Reply-To: <03851bd4-9202-385f-d991-c9720185c946@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57132d20-2fb7-4968-3137-08d9fd50b42d
x-ms-traffictypediagnostic: DM6PR03MB3564:EE_
x-microsoft-antispam-prvs: <DM6PR03MB35649209ED5DF674B8B3BD81BA049@DM6PR03MB3564.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y5EXbbOqbkjHerPdRyR/b1UfM9t8x8cNz1vOXzM1xJkCLsSv8N6gR67OSY4rlV68YabO/gh2KYCvlUhBMyteoEFS2hq47mNHefm3msUXATJJOJIC/jzxM/65TP0qeO/qo1gvDcxdFkgaxKXjhOD0vWCEfblH11PckNvLRK/cIT39GJjZzMmdQIxTPab2JiJ1XFWTBkXFUCg9E2/Vf8OeXX3hBZBa1AQFIPc98onOJH2NDZXeL1HVGrHTgkYKIB+6eEgcg2g0KBHCeHf+MZUUNHmV+k4R9xm+xTxSRIzup6CeCIOwLI0RiTAtrbbNTeO3UPslgUzvH2sIaj9jwaOdCvV5fR+LJklSQLYGhIl9Cj5MpKuIifGz90zD2Yj/ujMdHr1dav/Hao/yqIqhGLE9eyQBnV2+3qZifdrEN/4f7Z3DJzijikL4wVh4T3H5tsReQNY7cvV5KvAiN8t7442XVqyw7y527PrRF0mbc2Lxqi1dB1Bld5XZgRDmcfavmcplcHup9mhjb8r7bl8m6UnFGoz1uvwAOKJquxd9l+JWhqWhwCcgqbEvLQofAjTHaV/4CfdBBatki9LxZOWhT0ZWrXGXI2Uq4KXPuHXe4wobNFf+d7gG3IbtuTiqgcK80qFiCIOra9eEvvq48MyP1jACSRjRXm6CxLhR7w+9dc1CgNUsCHRHbQWNo0//9yQAYr2+O4jPZZhW2Iz5PmUUvkFjWjYyhe+2CB5AvhtVGHkwGfwaTIbnFpse8iQwx4xvAYp/z7qk7dJwnnzaT/E18L7L9OTfjxKy/npAbw/Gs9b+H3crSEegr/QM/dZYYCIzc4phjwJYiDSdj+o0lt5kIfQ3uSJqy6gfSZl/skPwRI6SDA4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(4326008)(66476007)(53546011)(66446008)(64756008)(66946007)(66556008)(2906002)(71200400001)(76116006)(36756003)(6486002)(186003)(966005)(6506007)(508600001)(6512007)(91956017)(26005)(2616005)(107886003)(86362001)(54906003)(122000001)(110136005)(31696002)(316002)(83380400001)(82960400001)(5660300002)(31686004)(8936002)(38070700005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGtKYUl4bmxMaWY0bTQyUXBwdENOSE9DVVRqWEtRdEZ5SEN6TU1mNzNZM2Nw?=
 =?utf-8?B?cGlqQmtKWWE4STQycCtzOWd0OFFZd0FJWmZ3UVh2cEk2dFRTYlNoYjhXU0w1?=
 =?utf-8?B?cDR3WXJYR1RaUy9IWlUxZW54OW8zckozMlhvRWxqZ2oxT0RQNVBiS3kvLy9S?=
 =?utf-8?B?NHhoZWFkakxDR1FQaG1MV3h6QnJEMXNqbHd0RFJFVjVFSmlDa3FETkJFSkxk?=
 =?utf-8?B?ZlRGTUl3ZUpJdnpnOEU4OWo1WjJHZGpqbm5vTVhiNHFtcEt6MHZpMDBKcmJo?=
 =?utf-8?B?TWFDZ2c1ZXhwS1hZU3lnbklCblVLRzIvNnRGODY4UVA3cEVMc3JuK1lpaUtl?=
 =?utf-8?B?ZkxMQnM2STRjSytoQjVXd0NkVFoydlJubTExR1g5andyZk0vUk5FTVNnaXJO?=
 =?utf-8?B?d0oxWWtVZ1RDQUdsS2Rwano1Y1FsSTIvdU03WDJXMEFocXVuaHMvcGVxM3ZQ?=
 =?utf-8?B?WTVDKzZmV2RFQ1dMV2ZMcDB2RlJLMTc2ZHdtblllU0xHWlp6MW5vYnVOb09K?=
 =?utf-8?B?L2p6NmtLN3lEdTBWdFJaUlhmZnJmd1VGMEd3NDNZL2JnZnFOU0h0K083N3c5?=
 =?utf-8?B?eGlUK0xqaC96UnIvenRidnJiMUloMS9yVm1vNU1lQUlGeFBHb0hzZEMyTVhM?=
 =?utf-8?B?dUxrTng3YjZFQ040V2VrMkdWMmd2M0ZQL3dta3dmenF5NHhNQmlYUjBQV00v?=
 =?utf-8?B?UUhWZWJTaHBUdmFFb3pCVklsMGM4eU42Z2JFWHJwenRhKy9VU29tQ0szUXVR?=
 =?utf-8?B?TCtaaENyc3c5aGtkZWxlUlhhaVJnQURiNnlCUitiTTBTaTZUcXcxTFg5dFBS?=
 =?utf-8?B?c09xVVU3dS95V1l0TURjYXEyYk41Y1VWZUlrcUdEV1V5OTdhTmd0R1d5Z1kr?=
 =?utf-8?B?cVBQUFdyWWpUL0hLS08zSS90MHl6RTkzci94ZElmVGNiOFZyRFhURytDYzhy?=
 =?utf-8?B?RWszVVRzcFJJYXg1Z0t5aEdkOGJYdWJTd2tXdlZNYUdEcDlzWEpYejJzcGp2?=
 =?utf-8?B?dXJZOGZyOGNsNmhkT25FN2tQMy9qdDFKSVlsMStzL2xSQW5FazlPWGo4OHE1?=
 =?utf-8?B?Y003bnE2MEtOcnNhNDhLZHVWNGUrVnZWSVVoRk52TThzQjNxOGk2STRoOEZF?=
 =?utf-8?B?OHhxa1RHWFh4V2hmVzY0NEVrRTd1blEzeGp5QmVxeXdIZExDL3ZuaEdka3Jy?=
 =?utf-8?B?ZzRpZjZrNitSOTBjVnpXQUVhdk5Kd2szSVBhcHYzT2kxbmpVSVdML0JZT0FK?=
 =?utf-8?B?SXRMbzM3ZzZ0aXArdHAvakYwZmdzeloxSWFkM0N4WDdoMTVuZkZjbTFxak1W?=
 =?utf-8?B?SG1NUDIvZU85a2FpMmR0T05sNzRsQ2N6Umt3dTFBbFJZNk40TFlmNDFLMkJV?=
 =?utf-8?B?WTU5V2RNNVdvU3FUVGg0Q3plNG9ZL2piU3c1TnFZTkhTdGdqT3JjSnlyWXNI?=
 =?utf-8?B?dTdldDNyUW9YampEWldZOWlzTHVjclVlWVJ1M04yb2FIcngvL0FITnlicHJQ?=
 =?utf-8?B?UjJGRE9hbDhVb0lXNHpGQ0N0S3Jaa0JscWN0YWZ2Ym0ydWY4cTdqNGxDcCtQ?=
 =?utf-8?B?YjR4WnVBNGdCcllPYlJTTmxqNlhpa2taZ2pjc1hqTTZJYXROcnZRdU1Cc3Z3?=
 =?utf-8?B?ZllJeTVrMjZpcDVHSHUxdXFQVm1SVEJ2M041OUMwdWJpVHFEeG12RTNXNGI5?=
 =?utf-8?B?OE00WEZyS3NKbWFvd0ZaYTVkRjUzZFY5dzJyWGNIQmpjOWVOQlByT1AwSmYw?=
 =?utf-8?B?Y2dtMU12RU1IeVQ3V0xhMS90S0xoSHpZeTRNOVA4ZTBaWk5Bd1BNNjNkQ1pi?=
 =?utf-8?B?bEtJcVkwZGhrQWN0Q1RZUCtRdzJjWTFMR09UTW9RV2VVb1YzMlczZmNneEJm?=
 =?utf-8?B?Z3orZVM0U1ZTWFU5bzN1S0JCdU80aEZ3M0JpNHN3eW9xRVJ0Ym9JQnZEU2VV?=
 =?utf-8?B?TFdXdlNIY0NJWGZUQ3VRTk56My9odzJrVXJqUWVsa3Jjc0VWOGtiTU1WcW54?=
 =?utf-8?B?S3o5ZHpxMXoxQitmTVdjb0lyZkNYZDFmeCtxZjRWOXJlSlJJdU9zZkk0WFUw?=
 =?utf-8?B?M0N6NDFZR3dXWVpUY1Z5UjBBZXdhdW5RaDVPZEVCTTYrQmtLc3JjNndwTi9N?=
 =?utf-8?B?bVVxTFh6V1lVYlo2bENkSk11UzNacUkwNEE3UGFxZUpkSGtsQmlHMTdoMXhV?=
 =?utf-8?B?aThiUHN6Q2dEckxFN3NNVkw0TEVYaHJTdk92STFHN1hMa2Q1ZGtSdUI3eFJp?=
 =?utf-8?B?ZERycmR6QnBORWM4ZFlrNTJkRG1BPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6EAEAEE5D6C5E84DBA09AD7C9CFDC52C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57132d20-2fb7-4968-3137-08d9fd50b42d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 20:02:11.0301
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7QDN8XVNKUbRkGqE8XKhPhnf8Q4CdJHIF+etL5L2b43hb1esArJpIOKJvp69K6ozZx/SJ72Q/0+YmzcOml3CDbLpP0CLnbwOBqJQ1EIP4l8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3564
X-OriginatorOrg: citrix.com

T24gMDEvMDMvMjAyMiAwODo1NSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEVzcGVjaWFsbHkgd2hl
biBsaW5raW5nIGEgUEUgYmluYXJ5ICh4ZW4uZWZpKSwgc3RhbmRhbG9uZSBvdXRwdXQNCj4gc2Vj
dGlvbnMgYXJlIGV4cGVuc2l2ZTogT2Z0ZW4gdGhlIGxpbmtlciB3aWxsIGFsaWduIHRoZSBzdWJz
ZXF1ZW50IG9uZQ0KPiBvbiB0aGUgc2VjdGlvbiBhbGlnbm1lbnQgYm91bmRhcnkgKDJNYikgd2hl
biB0aGUgbGlua2VyIHNjcmlwdCBkb2Vzbid0DQo+IG90aGVyd2lzZSBwbGFjZSBpdC4gKEkgaGF2
ZW4ndCBiZWVuIGFibGUgdG8gZGVyaXZlIGZyb20gb2JzZXJ2ZWQNCj4gYmVoYXZpb3IgdW5kZXIg
d2hhdCBjb25kaXRpb25zIGl0IHdvdWxkIG5vdCBkbyBzby4pDQo+DQo+IFdpdGggZ2NvdiBlbmFi
bGVkIChhbmQgd2l0aCBnY2MxMSkgSSdtIG9ic2VydmluZyBlbm91Z2ggc2VjdGlvbnMgdGhhdCwN
Cj4gYXMgb2YgcXVpdGUgcmVjZW50bHksIHRoZSByZXN1bHRpbmcgaW1hZ2UgZG9lc24ndCBmaXQg
aW4gMTZNYiBhbnltb3JlLA0KPiBmYWlsaW5nIHRoZSBmaW5hbCBBU1NFUlQoKSBpbiB0aGUgbGlu
a2VyIHNjcmlwdC4gKFRoYXQgYXNzZXJ0aW9uIGlzDQo+IHNsYXRlZCB0byBnbyBhd2F5LCBidXQg
dGhhdCdzIGEgc2VwYXJhdGUgY2hhbmdlLikNCj4NCj4gQW55IGRlc3RydWN0b3IgcmVsYXRlZCBz
ZWN0aW9ucyBjYW4gYmUgZGlzY2FyZGVkLCBhcyB3ZSBuZXZlciAiZXhpdCINCj4gdGhlIGh5cGVy
dmlzb3IuIFRoaXMgaW5jbHVkZXMgLnRleHQuZXhpdCwgd2hpY2ggaXMgcmVmZXJlbmNlZCBmcm9t
DQo+IC5kdG9ycy4qLiBDb25zdHJ1Y3RvciByZWxhdGVkIHNlY3Rpb25zIG5lZWQgdG8gYWxsIGJl
IHRha2VuIGNhcmUgb2YsIG5vdA0KPiBqdXN0IHRob3NlIHdpdGggaGlzdG9yaWNhbGx5IHVzZWQg
bmFtZXM6IC5jdG9ycy4qIGFuZCAudGV4dC5zdGFydHVwIGlzDQo+IHdoYXQgZ2NjMTEgcG9wdWxh
dGVzLiBXaGlsZSB0aGVyZSByZS1hcnJhbmdlIG9yZGVyaW5nIC8gc29ydGluZyB0byBtYXRjaA0K
PiB0aGF0IHVzZWQgYnkgdGhlIGxpbmtlciBwcm92aWRlZCBzY3JpcHRzLg0KPg0KPiBGaW5hbGx5
LCBmb3IgeGVuLmVmaSBvbmx5LCBhbHNvIGRpc2NhcmQgLm5vdGUuZ251LiouIFRoZXNlIGFyZQ0K
PiBtZWFuaW5nbGVzcyBpbiBhIFBFIGJpbmFyeS4gUXVpdGUgbGlrZWx5LCB3aGlsZSBub3QgbWVh
bmluZ2xlc3MgdGhlcmUsDQo+IHRoZSBzZWN0aW9uIGlzIGFsc28gb2Ygbm8gdXNlIGluIEVMRiwg
YnV0IGtlZXAgaXQgdGhlcmUgZm9yIG5vdy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiAtLS0NCj4gVEJEOiBXZSBhbHNvIHVzZSBDT05TVFJV
Q1RPUlMgZm9yIGFuIHVua25vd24gcmVhc29uLiBEb2N1bWVudGF0aW9uIGZvcg0KPiAgICAgIGxk
IGlzIHF1aXRlIGNsZWFyIHRoYXQgdGhpcyBpcyBhbiBhLm91dC1vbmx5IGNvbnN0cnVjdC4NCj4g
ICAgICBJbXBsZW1lbnRhdGlvbiBkb2Vzbid0IGxvb2sgdG8gZnVsbHkgbWF0Y2ggdGhpcyBmb3Ig
RUxGLCBidXQgSSdkDQo+ICAgICAgbmV2ZXJ0aGVsZXNzIGJlIGluY2xpbmVkIHRvIHJlbW92ZSBp
dHMgdXNlLg0KPg0KPiAtLS0gYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TDQo+ICsrKyBiL3hlbi9h
cmNoL3g4Ni94ZW4ubGRzLlMNCj4gQEAgLTE5NCw2ICsxOTQsNyBAQCBTRUNUSU9OUw0KPiAgI2Vu
ZGlmDQo+ICAgICAgICAgX3Npbml0dGV4dCA9IC47DQo+ICAgICAgICAgKiguaW5pdC50ZXh0KQ0K
PiArICAgICAgICooLnRleHQuc3RhcnR1cCkNCj4gICAgICAgICBfZWluaXR0ZXh0ID0gLjsNCj4g
ICAgICAgICAvKg0KPiAgICAgICAgICAqIEhlcmUgYXJlIHRoZSByZXBsYWNlbWVudCBpbnN0cnVj
dGlvbnMuIFRoZSBsaW5rZXIgc3RpY2tzIHRoZW0NCj4gQEAgLTI1OCw5ICsyNTksMTAgQEAgU0VD
VElPTlMNCj4gIA0KPiAgICAgICAgIC4gPSBBTElHTig4KTsNCj4gICAgICAgICBfX2N0b3JzX3N0
YXJ0ID0gLjsNCj4gLSAgICAgICAqKC5jdG9ycykNCj4gKyAgICAgICAqKFNPUlRfQllfSU5JVF9Q
UklPUklUWSguaW5pdF9hcnJheS4qKSkNCj4gKyAgICAgICAqKFNPUlRfQllfSU5JVF9QUklPUklU
WSguY3RvcnMuKikpDQo+ICAgICAgICAgKiguaW5pdF9hcnJheSkNCj4gLSAgICAgICAqKFNPUlQo
LmluaXRfYXJyYXkuKikpDQo+ICsgICAgICAgKiguY3RvcnMpDQo+ICAgICAgICAgX19jdG9yc19l
bmQgPSAuOw0KPiAgICB9IFBIRFIodGV4dCkNCj4gIA0KPiBAQCAtNDA0LDE2ICs0MDYsMjAgQEAg
U0VDVElPTlMNCj4gIA0KPiAgICAvKiBTZWN0aW9ucyB0byBiZSBkaXNjYXJkZWQgKi8NCj4gICAg
L0RJU0NBUkQvIDogew0KPiArICAgICAgICooLnRleHQuZXhpdCkNCj4gICAgICAgICAqKC5leGl0
LnRleHQpDQo+ICAgICAgICAgKiguZXhpdC5kYXRhKQ0KPiAgICAgICAgICooLmV4aXRjYWxsLmV4
aXQpDQo+ICAgICAgICAgKiguZGlzY2FyZCkNCj4gICAgICAgICAqKC5kaXNjYXJkLiopDQo+ICAg
ICAgICAgKiguZWhfZnJhbWUpDQo+ICsgICAgICAgKiguZHRvcnMpDQo+ICsgICAgICAgKiguZHRv
cnMuKikNCj4gICNpZmRlZiBFRkkNCj4gICAgICAgICAqKC5jb21tZW50KQ0KPiAgICAgICAgICoo
LmNvbW1lbnQuKikNCj4gICAgICAgICAqKC5ub3RlLlhlbikNCj4gKyAgICAgICAqKC5ub3RlLmdu
dS4qKQ0KPiAgI2VuZGlmDQo+ICAgIH0NCg0KVGhpcyBicmVha3MgcmVsaWFibHkgaW4gR2l0bGFi
IENJLg0KDQpodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxlL2FuZHloaHAveGVu
Ly0vam9icy8yMTU5MDU5OTU2IChnY2MgMTEpDQoNCn5BbmRyZXcNCg==

