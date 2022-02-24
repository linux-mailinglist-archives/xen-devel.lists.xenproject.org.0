Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E9A4C2DE7
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 15:10:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278310.475506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNEov-0005Ft-3z; Thu, 24 Feb 2022 14:10:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278310.475506; Thu, 24 Feb 2022 14:10:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNEou-0005Dy-W7; Thu, 24 Feb 2022 14:10:12 +0000
Received: by outflank-mailman (input) for mailman id 278310;
 Thu, 24 Feb 2022 14:10:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gX/V=TH=citrix.com=prvs=047ddeb39=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nNEot-0005Dm-SX
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 14:10:12 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78e24426-957b-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 15:10:10 +0100 (CET)
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
X-Inumbo-ID: 78e24426-957b-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645711809;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=HO8d3Iy+0MObli41qHjfUvXIzSVy6pokjBaXj4EM0T4=;
  b=fkPgfW10n8MOqLqJPdXIO/PMCpF3qNZ7b7PL/PA04Da54si135011FST
   +5SasELJBo8hF1E06fBjfp7Bi8QdINADG5fPNsJIPx7VcB26t379xsN1B
   arMmsXWv9heOtQnIzoEJUvhbwZMGbgjPfygnMIHBBLsx3KR2y5EU+QidC
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64796963
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HdP6uK6NAodK4EofwljI+wxRtC/HchMFZxGqfqrLsTDasY5as4F+v
 mFMCGiCbPrYYWf0fdpwPInkp0xX6JPdyYAxSgI+pHtkHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YLjX1vW0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSZRyp4YvbInd8jfEZ+LCtzDIhbpbnudC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsFvX5t13fBBOsOSpHfWaTao9Rf2V/cg+gQQamPO
 ZtHMlKDajyYOTkRJUcoWKs1gcDv2lTGLR1Xlg6s8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u13T0BFQWOcKSzRKB82mwnanfkCXjQoUQGbaksPlwjzW7xGYeFRkXXluTuuSihwi1XNc3F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc/NePrxmswWI8ZT7vCCmDGU1ayMcbvVz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbo1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNOtTABbvzt68owGOlor+p5
 iZsdy+2tr1mMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8ieRk1aJpeImCxO
 yc/XD+9ArcJYhNGioctPuqM5zkCl/C8RbwJqNiOBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WkPHGMqNZLdQpiwLpSLcmelvG7v9Wre2JOMGogF+XQ0fUmfYlklL5SjeDG4
 je2XUow9bY1rSSvxdmiApy7VI7SYA==
IronPort-HdrOrdr: A9a23:BbhWQ6jugE0EZHBLfg/jzfA9b3BQXz513DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmsk6KdxbNhQItKOzOWxFdATbsSl7cKpgeAJ8SQzJ856U
 4NSdkbNDS0NykEsS+Y2njJLz9D+qj+zEnAv463pB0BPGIaCZ2IrT0JcTpzencGNTWubqBJba
 Z0iPA3wAZJLh8sH7qG7zQ+LqP+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+iemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30l0dFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNNN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wSJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tABynhkjizylSKeGXLzcO9k/seDlBhiXV6UkboJlB9TpY+CRF9U1wsa7USPF/lp
 P52+pT5fVzp/QtHNBA7dc6MLiK41P2MGfx2UKpUB3a/fI8SjrwQ6Ce2sRA2AjtQu1O8KcP
X-IronPort-AV: E=Sophos;i="5.90,134,1643691600"; 
   d="scan'208";a="64796963"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zsqd6xnAMBiXmwBzY8FGLugqGsYpYofLTJTYPdSDNtgdOgAThrPMJew6tfq8kfGOoQqpoeAV/MhTKmUeXBL/fzygFMzGknWDyTYxNCj3Lk62GkPXtMRAqd/4Me4F21gjw7dgi9a9ywG0+2Gr9VwnksmY8fYkFOqVttB2wcg87IPAcIf9Nax9pCNtEXlrd0MNLoMG7uVMQcqoImtSVA1lRJ1GgZIVoX+TZElhqQ/RuSHPC0HJfZ7YWpDgmkJBdNK8llT8ospmjUMuE5rKSTOclo5JwI/gNjHtdEo7V/bMTkuw71iImaByCC6RDvGvbNCfLdP47DTfJPyRbfoehA/edg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WK2wEGyyPtiRAwLzmuL1Xx7dgmiNnWcwAFWR0DlvWUc=;
 b=OCX0p8y6h4irYJqF5GND0PAriz2TAH9harWztld6Ih0+nADA59iXDUSP6rzYvGnZs5Ks5IoQ82LvV/MFevbtH+Ad3zHjFBlBez68xFF8oAtWNi3/Yjr8axjLA+RYH70zoOOkzaq+pVPG3DyopodEBbC4BtJveMylsxe3kN28k5XJ31hrihiKVDSw1belH2urHHGXShZvxvRMGwWxDauGmxKHWhWf84X9ZXqkMxtAuASVYTxTlMBwztpZ/2GkjqdB/OPu0bx0X3yR+tQszsHUzNL3HaA3Gmq4M1xJHH+VsvDyq2XkZ79+Hez9vk9ixh3crQGrci7sAOB+rjruBi9qxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WK2wEGyyPtiRAwLzmuL1Xx7dgmiNnWcwAFWR0DlvWUc=;
 b=tuRl269dfaqTx/Z2LD6esPxu6WbfD9nBbLNBvN9QwyPgsqJo+dw0gI22zMT3Ze7/S4YvAEyoW/bypw4SelcJKsOqZilyKa0/agrg5J/+LUXgtAaAisFgo7C2/66XekcPuHGa4lRoMZyWxjDmge1TVQPcocAbH9HYxthxGdIfwfc=
Date: Thu, 24 Feb 2022 15:09:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86/time: switch platform timer hooks to altcall
Message-ID: <YheRtlnodHjyQuYW@Air-de-Roger>
References: <5f1f49e6-1380-73bf-d68f-6eb9dd05cad6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f1f49e6-1380-73bf-d68f-6eb9dd05cad6@suse.com>
X-ClientProxiedBy: LO4P123CA0499.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dad1d80f-5282-4aab-1ed0-08d9f79f5aa8
X-MS-TrafficTypeDiagnostic: DS7PR03MB5509:EE_
X-Microsoft-Antispam-PRVS: <DS7PR03MB55096DE628170EDD804854FA8F3D9@DS7PR03MB5509.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 14X2l+zCImwq8NYtwRAXEvXAZCirB3CPeQPkxpoMGgLghjNLmw0+vcrwUoyzDUdLYooa8AfF8p11H5/eRX+tAvgunb4h1aI9AKrgRXuWnGI/rx5h/Ec66dDY/Mx7EfIiqZ3IsNC610T52qjy5GQ4CpqQ19ssl+nITvbhoPIZM+vApHzCpTrk1aTb5bBrVgDStVyKuJJZF3KuNr4Apnxhfb9oCzk95ZRFbv0N+3KdNT3i+Cf/WvKJtOR5aqaUpn7ltXSG+xXATY0U/Vo+agv7i000BclxCy1tIsG06XLkuZxyZ2T3aifUCVSf3JsTQ685Z0wx2EtZhioid0KHBv/BHm64GLoU+x5ru8O2p0ZQ2SEXJOER/JPZ03QSdsRwUF89HXKaTkoW6V89Sojt7DNorKrM/9GOiksiB+eaFotcfvnJnOK7ihfU275q0b2J1UpC/Sp7YZJ07mGIDwBhEmea3L8qr9XHicHYVHwu9Tl0D/fu8Rl2q0Ss9aJSIJQ/jAG77WkMh+Y2ExZ/fXixU1tIOTOkwnhfLbPMklwqV4RwHBIFm+G8k2Squ8l7wCCDk/kpyK8x/YePStt8HmDSy0lGWE+mxyeE0sXRb42Z22Xj5HUHZCE38hoOyf6BG762HwEyB9f8aaaub8X0VD1sQqkdCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(8676002)(508600001)(4326008)(38100700002)(6486002)(6916009)(66946007)(86362001)(66476007)(54906003)(316002)(5660300002)(66556008)(2906002)(82960400001)(8936002)(85182001)(4744005)(9686003)(6506007)(6666004)(83380400001)(6512007)(26005)(186003)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3puRzdLYS8zWnNLVkpqNEI4eEd5clMwT2w0RmVwTUhwYWtPVUlreEN1ZWtn?=
 =?utf-8?B?ODhjWitsWjBSVjBuNUNWd3lsOXNSSGhicXJybFlxZjdadWwzUHBVakhOZzdE?=
 =?utf-8?B?eWlyZTRVQndwcmZNUU04ZG1DaXgzNFEwS1lsUm96dG9kcldNT3ovdHN3OUtv?=
 =?utf-8?B?aU9lb1ZXNGk0V1lWUEtHZktpMmtJZnA0dnpyem4yaDNGbGVFNVhIQmpvYVBI?=
 =?utf-8?B?K3dYcnlsaXk3U3o4S2xjb28rUGpFRjZkNkdiNnFGV0gwSklTTlZ3cTFORUlj?=
 =?utf-8?B?SVRUTHFYUTg1RHBUQjIvNzMzUGxGRVJDUzEwbU5mMFNCYnhlZ284dHMrVm90?=
 =?utf-8?B?QjJGbkE1bGxEVXo5Qzk5UjlpZFA0MXBhS1h1SURYVitVazRWV1ZQTlVrd2Iw?=
 =?utf-8?B?N0RaNHo2NnV2RlBaeTFuMUI0TTl4QnJNeGZKR082dHQrblFkREFMTzljRGpv?=
 =?utf-8?B?bWlrL0lqQnhtMkx6amFtRThobUM4VzdPUEJNbThJc081cE9NTGJsTlZJRXY1?=
 =?utf-8?B?Mlo5M1JHNnY1ZVdyTlVVd0NCSGlXcEZSN2ZqRGJ1YVg1RGF0QzFqaHJudTFz?=
 =?utf-8?B?bFJob1NaL000RWlKUFlxNkRzUEhmRlpTVHhMTUdLZVlvUW1adzRMUEVKMm9j?=
 =?utf-8?B?eEVscFdJeXNxUjQveExiTlJIclFrT1FUajN2aWRwS1E2U2ZCYW9YMGxHZnFF?=
 =?utf-8?B?UmpZUmdLS2NnSFN0aHpWdTZNY2hZa3hYeVJQUjgzL013VGVwNVd4OXpvUmFO?=
 =?utf-8?B?REtZc2JHaGR0TU1nRDZ3cmJlVGs0OWs2K2Y1dDF6UGdoblVnK2lEendxb2hB?=
 =?utf-8?B?N0V3T2Ixd0ZZMnpjeUNYWG9UMTVwa1lIUFp2YTlFcU1NTDdMTEMwOUpQSHlX?=
 =?utf-8?B?amxTS0NPQ2hmT3BSZXNGSUVOOUsvenNSbWo0QmorZ1lKNzF5bHpDd3hUOFU0?=
 =?utf-8?B?VW53bzc0eURia3pTWkZ5QjhBbHZPWHk5cnlrVWlNL3F2RWFXb05COERvTjRH?=
 =?utf-8?B?M2FiUEtGakpUMzRlK3I2V1JmcTgzeWpsUlFWTnFzSTRXR3RaUG9Bekh0M1pU?=
 =?utf-8?B?c3RKNVQ1REVNMjVGZnZGS1VNd0lqcEVEbitFU1N2bExkdU84VHphSEdjK1gr?=
 =?utf-8?B?K1ArdEdZekZwYnBnbURsNTBsZFZMalVsOG9veWk2U0R1ZW9YN1cyNDh1M1ZT?=
 =?utf-8?B?T0RuL0NwZ3plQi9vOFJuVkFhMmFKTjlOWGNRbHh0U2tSd1FRaDZ2ZkU2c05T?=
 =?utf-8?B?TURkdmpwOXh0QjB1L0ZtMGs0TUM3VWNpNnB1dUtRaUVXQ2JJQkU5SjN2MHpQ?=
 =?utf-8?B?RVREdi85dDVZaXdaeEtJWXd0MWxuTTRSMHB4N0w3RjhlUkp1YStNMmt4dlZR?=
 =?utf-8?B?QURhOGlTMTc5VnB1RDlaQmw0SjlJM2JpNnQwTVp2TExmTUN6VDU2bENZbEtl?=
 =?utf-8?B?RGJXWXZrTTFOMXV1R1NDUmI3SjZsc09pM1lpUFZMNm1IZDBKU0FXaG5sVmRp?=
 =?utf-8?B?dE1TdjZPNlhvdUxKVHo5Tk1Pb0ZXVmdPSHRsTnB1UWhsdXMwbzFtOTJRdW5o?=
 =?utf-8?B?c1NORGtkU1RGTHlEcTBZRnM3TU9BZGttSmtNYW5rQ0lzbHpYVXFvcWJ1aEdp?=
 =?utf-8?B?NWZ0a3FTZ1FwbjN3M0VTZVNFZFcvV2x3cHhiWE9oR2QweHFHM1lSc2pvZ3ls?=
 =?utf-8?B?RTExVGtSdGxkZUN6cWFLZWlEM2VMWnMxMVR6SElLQWUxTHBCWWlDb3Y0eUwx?=
 =?utf-8?B?NTcvVGE1blBoTEdzcFF5Z2x0VzVEVVI1c3JyTEFFR0Q0QVNtU0JUN3lUbHlK?=
 =?utf-8?B?czJMSFNLdnpBOXVhRVlWUzdlZmVPclljVkhWNSt2ZFd1QTBuWWY4eFBONXM3?=
 =?utf-8?B?ZEh5YjZDajJpb3FlTTZMeEV5eUpQTDZaNnZxMjYyZ0c2eHhQOXlSZ0d3V203?=
 =?utf-8?B?VStSd0UzMk14VEZlRHlMS3I4YWozMys5c3I4cCtHMHdVNTNFMThFaVBhaVN2?=
 =?utf-8?B?Nm9OL241bnl5Z1JMMmo1aXlUZ2p2aGhiSi9UNk1SOGZkdHQvcFNNaFpIdGJs?=
 =?utf-8?B?WERRRk5XYlJKMjRZYUZVMkRIeFlQUnFpdDMzeEVpeUNqMUJpUTRzWkxTVGxG?=
 =?utf-8?B?QVJwc21GYU96SW5YZkNFLy8yZjZ1dUMxZnlHZDdFZE1UY1RYU1FobmJMYVZJ?=
 =?utf-8?Q?LtqmKF+yjoDPf+yoNOURryU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dad1d80f-5282-4aab-1ed0-08d9f79f5aa8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 14:10:04.3401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KOTxbLUHLED+nUynXDgs3yzvjNTD9VpV86Ado6+OGjFmhDIdizvqiU+T5kDhdKHSis0JJt+QhVnlHKTKwsvpRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5509
X-OriginatorOrg: citrix.com

On Thu, Jan 13, 2022 at 02:17:18PM +0100, Jan Beulich wrote:
> Except in the "clocksource=tsc" case we can replace the indirect calls
> involved in accessing the platform timers by direct ones, as they get
> established once and never changed. To also cover the "tsc" case, invoke
> what read_tsc() resolves to directly. In turn read_tsc() then becomes
> unreachable and hence can move to .init.*.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> TBD: Instead of adding __init to read_tsc() we could also ditch the
>      function altogether, using a dedicated (non-canonical) pointer
>      constant instead for the .read_counter initializer and the two
>      comparisons done on plt_src.read_counter.

I was going to suggest adding an ASSERT_UNREACHABLE, but not sure it
makes much sense if the function is init only.

I would be fine with using a non-canonical pointer.

Thanks, Roger.

