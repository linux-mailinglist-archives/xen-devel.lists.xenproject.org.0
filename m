Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C6D4161DD
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 17:15:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194410.346325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQRh-0002Qw-Bi; Thu, 23 Sep 2021 15:15:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194410.346325; Thu, 23 Sep 2021 15:15:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQRh-0002OG-8C; Thu, 23 Sep 2021 15:15:33 +0000
Received: by outflank-mailman (input) for mailman id 194410;
 Thu, 23 Sep 2021 15:15:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qmWf=ON=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mTQRf-0002OA-Te
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 15:15:31 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 16f8ed5e-1c81-11ec-ba51-12813bfff9fa;
 Thu, 23 Sep 2021 15:15:30 +0000 (UTC)
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
X-Inumbo-ID: 16f8ed5e-1c81-11ec-ba51-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632410130;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=B6zG86aQYgEV8mV02SHeuMwLHz//ADy1sKLf6lK799Y=;
  b=Xy+Gt0ajzjAL6U0p7WFEpf9IULo8aVN6RjkzDOis6BwH1tElC5hKG2nQ
   ysMKIQtF+pFjEregTT78VWuDoJ/ftiukLjQpitvuj6wwsKj992I0IPT5d
   OGMjlocgC3N2H2ZhVzb0UVcmDGFr38jugqygGZHFkUb+Ud44q4lpr5bQq
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6RLjGJjVJNrfGEEGs76qjVkrq5UFAU5TMeW4wNVCgr2rP1BKeuHQhqyg6le8WNf9WWuyKjFhG7
 Fr0ooO9rmLwdbOWFI9YhIF3vRUdG1kDkZ7A1Q0leE3+NXTq/7j8UMkndhmVC72JwHf02xQYJ2B
 p+v96Zhx+ibyimhi2KxjspsLWFXGW6gbrL3Vp/rZ11KOyGBVfHrFf3HtwSB8jgNLVzG3vovLAT
 nBHWxzXMWA9w/2CiKsj5bYMOGTVvkk7GrEp4h7Iq5+IXo+MqaYoFWJdCmXWltD4wMeyRFM9TlW
 IiJ3x5tHE2nDFtQ305tjnc4c
X-SBRS: 5.1
X-MesageID: 55266241
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:y0hDb60ohCPiHj98WfbD5Q12kn2cJEfYwER7XKvMYLTBsI5bpzVSx
 zQYXziDOv2JM2v0Loh/a4rn9E9X7JWDxtRrTQBupC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970EoywbVh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhu+gtl
 dB1sqGJaSR4J6bHl7VMQx5qHHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuIICgmlq2pkm8fD2e
 ekgSmRKUUX8eUdiOAs1IcoBrcmumSyqG9FfgA3M/vdmi4TJ9yRu1JD9PdyTfcaFLe1Fk0Ddq
 m/Y8mDRBhABKMfZ2TeD6mirhOLEgWX8Qo16PL+y++NugVaT7ncOExBQXly+ycRVkWbnBYgZc
 RZNvHNz8+5iryRHU+URQTWcmCLZuyYbZuNwMLwj4wqCm/vE5DSWUz1soiF6VPQqs8o/RDoP3
 1CPns/0CTEHjIB5WU5x5Z/P8mjvY3Z9wXsqIHZeFFpYv4CLTJQb00qXJuuPBpJZmTEc9dvY+
 DmMsCF2rLEal8djO06TrA2f3mrESnQkSGcICuTrsoCNslgRiG2NPdXABb3nARBodt3xor6p5
 iRspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD4J9sLuGkleh04Y67onAMFh
 meJ4mu9A7cJYBOXgVJfOdrtW6zGM4C6fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEy8kC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ7l0gWmDKILbimnkvP7FZrTCPMIVvzGADVNb5RAWLtiFi9z
 uuzwOPQkEgADL2iPHOHmWPRRHhTRUUG6VnNg5U/XsaIIxZ8GXFnDPnUwLg7fJdikbgTneDNl
 kxRkGcEoLYmrXGYewiMdF55b7bjAcR2oX4hZHR+Nle0wXkzJ42o6f5HJZcweLAm8s1lzOJ1E
 KZZK5nRXKwXR2SV4SkZYLn8sJdmKEahizWRMnf3ezM4ZZNhGVDEo4e2Ygv1+SASJSOrrs9i8
 aa43wbWTMNbFQRvBcrbcty1yFa1sSRPke5+RRKQcNJSZF/t4M5hLCmo1q07JMQFKBPiwDqG1
 lnJXUdE9LeV+4JsqYvHn6GJqYutAtBSJEsCEjmJ96uyOAnb4nGnnd1KXtGXcG2PT2jz4qijO
 7lYlqmuLP0dkV9WmINgCLI3n7km7t7iqrIGnARpGHLHMwaiBr96eyTU2MBOsutGx6NDuBvwU
 UWKo4EINbKMMcLjMVgQOAt6MbjTiaBKwmHfvaYvPUH3xC5r577WA0xdMi6FhDFZMLYoYpgux
 v0suZJO5gGy4vbw3g1qUsyAG7ywE0E9
IronPort-HdrOrdr: A9a23:myKTUahOgZdaV00RANq6ixx7ZXBQX0t13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKOzOWxVdATbsSlrcKpgePJ8SQzJ8+6U
 4NSdkaNDS0NykHsS+Y2njILz9D+qj/zEnAv463pB0MPGIaG52IrT0JcjpzencGOjWubqBJcq
 Z0iPA3wwZJLh8sH7uG7zQ+LqX+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+qemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lsdFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNzN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wqJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tABKnhkjizytSKeGXLzEO9k/seDlHhiXV6UkZoJlB9Tpa+CRF9U1ws67USPF/lq
 352+pT5fdzpmJ/V9MIOA47e7rENoX6e2O7DIujGyWVKEg5AQO5l3fW2sR/2Aj4Qu1D8HMN8K
 6xJ2+w81RCIn7TNQ==
X-IronPort-AV: E=Sophos;i="5.85,316,1624334400"; 
   d="scan'208";a="55266241"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahzHFFMslkj85t5MqmPOEW/gVTBFK5IBdQKik0RB0is2TmhNvRYURppFQG17g01AUFwov9bL8H0ipjSps6LeJw8vqBX60j9tEFi8trKTAswvJm9/VpLS0/tDSMvUaAQBstXzPTT/sRPNXaHmcct3vgPmZp7hEpMVq5koN5fWM/arkIqC21t8XmYecoR37/c5bb8Jafkm+l7Zw6fDUaKyKnSQCSe4Tm5kNUt20jYZlgSv8aL0fZmYZMU4goF5s0kJnzBJcylmHO4W1Sd8zgtOXW5OxQrB3Jgnr8lD6JagG7JfzgE9hN8BlciG8IHjIKZw9oQxg+cDd5g8rFYIyUB8Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=QhwNl3BWRz36UYDGvQyycjsgS94kBKFE4yuwg4hlGqI=;
 b=bpc03ETd1SJR1ElPvOskjQxvmNOgfgM0WgU4Q2OSHXarkS0FDQuZtfpelLghjRnqOb+g691/DNAit1n0KMj6KxyvO0fmjzR9TWVU+dznKQecbbgC0NhzyUI1ZcN1pfj+mgHwdiLDE2uLgSKXwUZsUwkBRH94fAo+nJkXrNRNWDR5JGvNXz2vp+RR5usB2IPmIdEhR4QeVA/JqP2CRf59aYgrPUwX9Mjoj39TN8+5Jp62Dtx+1ox5drWgLP4h1dpv3WKY+Ti3nknSgT4HWbU0XbiM9CaqZrju4ghHTxm8OOfhTI5/GI8nshCDxVR/9Nthjd8dcjcwsTUIWQ79hhEc8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhwNl3BWRz36UYDGvQyycjsgS94kBKFE4yuwg4hlGqI=;
 b=gIFo2s7gHIltb0hi6L65RtPH77ImSAoLPyvoeuOEeJ25LJduBVdT7iQsabWVJCgEzyVdrJueLCtmAXJNlRRTWiyI7OKo2nxUAnYpBxWsXLjtCPCobZncYvPmVP5nxQyOs+4G/B32yVXhtdhmzfNvyVLUCSsFHzu8gc6387rssVA=
Date: Thu, 23 Sep 2021 17:15:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>
Subject: Re: [PATCH v3 9/9] x86/P2M: relax permissions of PVH Dom0's MMIO
 entries
Message-ID: <YUyaCrdAdpnn/o0K@MacBook-Air-de-Roger.local>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <a141e1a5-0185-4923-a91e-68c06a4f78cf@suse.com>
 <YUxgsF47nrTn8WrS@MacBook-Air-de-Roger.local>
 <ec456bf7-df78-59f2-6c14-5bda165125c8@suse.com>
 <YUxrE/kx8wmftVIX@MacBook-Air-de-Roger.local>
 <33abd731-7c2e-8c9b-963a-fd446a21e87a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33abd731-7c2e-8c9b-963a-fd446a21e87a@suse.com>
X-ClientProxiedBy: LO2P265CA0414.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b54f447-1079-4fd7-c945-08d97ea4f9a8
X-MS-TrafficTypeDiagnostic: DM6PR03MB4474:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4474426E57B345067698EED88FA39@DM6PR03MB4474.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K3gf4MkGRdq4js9WvXkZPKz81U5lTIcpHH7ZNKcGvfiTTMVqR2Jdhr/AtCXtKQra/61UBu0fQc0HNfEq9wnaYur1bnj0GHTQoQbBnhuPY93HKctFWrEK2IsbxFih+eu0whkMt8VYwOfsxmweqfn9RJ1fNAQt9mrecddvQ9zQYRIk1kdUecVlRsLVKZJI0BlOoJMfYu1aFQaNuMwc9l+4JAbMRvY4djmUmJ8xFOy1A3vmFVmiZmEDWkd5vgSZKd+eE1ivAd3OGDHHlxQWpJ7NJFMpkw9H+2XOItnpztvJJ/mgr/B57EkZKvU3Ao7Roakm0jUuqoTfjSi9h3GCeSA+znFY4B9gVGOd/AUF5YXXAKFtYOn8LsFeXN0lBRsyWfjhk8vu4cwMxMLMrGLUDvKX8VwHnmwu2URohgcM/BldjNAU6xNu8aYdaCMcj634RYXQmXctqLJUJ7Xdv1DMQI33DIoeqd3ufxs5fUDcau1fETDQpE2c6uT/luS5hd7unXYNSGyBODfU1v/MxcNzDxbDPHje1LnjOrJQwbAYLMeqNjGZ42lYkCQYF0imkNK1mvI3lbcSCnYY2ri3TH/KCDfhqSH3SeNzptVtNiP75QwhckdFnFiT7MYfH0JW9jEdX6EpYM45ThK5LpBTzn3SsMzKiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(6666004)(66946007)(53546011)(5660300002)(107886003)(6496006)(66556008)(6486002)(186003)(26005)(85182001)(316002)(8936002)(4326008)(66476007)(956004)(9686003)(54906003)(508600001)(2906002)(38100700002)(86362001)(83380400001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFVuWGRzSmJyV2MwOVdZZ1EwMHh3SUtrOWh1TlVXNUJGSTRRbFZ0YmZBa3ZS?=
 =?utf-8?B?YUJQWFYvRjB1dWNOVkc1NXYwWGpHVTZOZnBnd1M0amg1OVdseUdaVzZIUHN6?=
 =?utf-8?B?TUEvdUQwellHbTIvaUNWU1pldURBaDhMUm40WU05TzBCeXdDUUYyL0Y5L05G?=
 =?utf-8?B?Umo4cDlpNUFPN1Myb3pZblNCbGo5cFlUZGdVd080RlhOaTRiRTVPUVlteXdS?=
 =?utf-8?B?ckxSYzJKN0N5di94bWk4TjIzWkNhSUNaTU9kbHN2UXF1dDVKc0lrSVVlQjhn?=
 =?utf-8?B?TGkzVnZvSHIyaS9Gd243RzltdzNrQU5wWTlWRk85QnB4RXM3TndMUTM3ZTZq?=
 =?utf-8?B?bGJVM0J4U2kxd2tvSUp2M2poWFN0cFBTMWlJWkJLN3VGUkl5b0hpWTE3SnBm?=
 =?utf-8?B?Wno5S0lzWHQ4TzNVSlJKdkI1T3BPbzEzdnNHamNianBWSFI2QUM0NnVOVGlj?=
 =?utf-8?B?Z3dpMDRVYnFPVjgwZjNyN2tyMGVKRkNtZThZOUhUa0pMZ3kvTHlLRm5TeFRn?=
 =?utf-8?B?RTVOYTB6RTBXalZQRC9XeFR1dmpWWXRaMVhtVjBNTEY1M043UzAySFVVMHFS?=
 =?utf-8?B?azZxcUFuOHc0ODk2eExhZW5WYXVib2FySW8ybUdDM0ptYmRVLzFHWmNNblNw?=
 =?utf-8?B?ZkRoQ1V6cDg2RUtzMUpUTHgxSUY1UmxXUTJHU3RDQVZpNVBTNlFzVC9jNlBV?=
 =?utf-8?B?V1g3MjkwakFieDY1bG1rTTFvc3hydkZkMFEzTUhVN3FSNEZUZHNRYjRzeVFC?=
 =?utf-8?B?ODdYN0lJaUdGTnh1R3hjSzFvS3dzaDcrb1g5SmcxMUp6Ujh4MjBpSVBGRXcw?=
 =?utf-8?B?VkNFVGt1MkI5bWl5b1ZzOEhnaVcrRDdtdXB5TkU5U1N5ekNITkQ5RnVibzIz?=
 =?utf-8?B?MXBtcDVjMHVLNGFubWZwVXRGRksvRVdQaHF3T2FDN2tjMjBTeGVmcDAxVzJK?=
 =?utf-8?B?cWJGeVlrSUR2NSt3MmdiU2J5dVhKZHcrS083V0tTT3FPZy9hWVM1VVU4cXVS?=
 =?utf-8?B?Vys1bFhnMnZEMW5jYngxMndqRnl3dTNnWUFRTk1VZWFPZU14UDRXbmF6MjE3?=
 =?utf-8?B?YUJqQTRFVklJekF4T202V0pMbDJSd2JmdzUwQlIrWGk5cWhnTlZHbkYybTh2?=
 =?utf-8?B?MnVxbzhDREMwRUJMbFhPNGRXcHJGTHFuVDlDNE5LYVZkd2Z0MlVMWERFWSto?=
 =?utf-8?B?ODFPbHFBcHRhcElwakFvY1FuN3QwSHpmTFNzMzFEblAwV2gxdHp3NElvVDhI?=
 =?utf-8?B?UkQ2UVRDem4vMFJhSjk1T3FSWWNDWGlrYlZUN1RGUEFRcHh2RjFoVlYrc3RX?=
 =?utf-8?B?ZVZFSlJTTkRSS0MvZWN5N283WForZXlENzV2L2NQaXAzTEY2S0V6RmdOS3BE?=
 =?utf-8?B?RHFaUEJwQ2greDQ0ZEZPUUxQV2J2bFNQZlNKQ085cE1WQVV5RU5WdDZOM1Nq?=
 =?utf-8?B?UExBSjlqRnE4UkZXOHlHcU12dGJHNGtmV3NqMi9GREZBTEgxVnVWM2tzRTNE?=
 =?utf-8?B?a0R5SmRmbW03bFptVWpTRk5TSXNxVnQzdlpuellBdDcrL2xFL3hQZ2MyS3Mw?=
 =?utf-8?B?dU9mOGVtLzB6aWlORllpQmdUZG9qcGticzRmdnd0VWtHUzdFY21UNXN0NVZv?=
 =?utf-8?B?bzRrMlFrTFJHdVBySEwyQU9LbTZVUi95SHpjSXJIcFpwQk83dVBxbG1WQTNS?=
 =?utf-8?B?WlBhTmpRRDNLTVZlZ0o1Y3d5bmw5cHhzbG1XQThLbGFmTVZNYlpmZEtRbEht?=
 =?utf-8?Q?59tw3KkBVtTgDS00uow/RoFoiHx2d302PORGzBf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b54f447-1079-4fd7-c945-08d97ea4f9a8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 15:15:28.0369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hC4QJHzaZEW5Z7T354lh9rR/xg1vhCmK24cOAVozUTahRynWm6YsHP3Ep7TEDeaj34IqSqsSHrYKUHcTwY16dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4474
X-OriginatorOrg: citrix.com

On Thu, Sep 23, 2021 at 02:15:25PM +0200, Jan Beulich wrote:
> On 23.09.2021 13:54, Roger Pau Monné wrote:
> > On Thu, Sep 23, 2021 at 01:32:52PM +0200, Jan Beulich wrote:
> >> On 23.09.2021 13:10, Roger Pau Monné wrote:
> >>> On Tue, Sep 21, 2021 at 09:21:11AM +0200, Jan Beulich wrote:
> >>>> --- a/xen/arch/x86/mm/p2m.c
> >>>> +++ b/xen/arch/x86/mm/p2m.c
> >>>> @@ -1319,6 +1319,18 @@ static int set_typed_p2m_entry(struct do
> >>>>              return -EPERM;
> >>>>          }
> >>>>  
> >>>> +        /*
> >>>> +         * Gross bodge, to go away again rather sooner than later:
> >>>> +         *
> >>>> +         * For MMIO allow access permissions to accumulate, but only for Dom0.
> >>>> +         * Since set_identity_p2m_entry() and set_mmio_p2m_entry() differ in
> >>>> +         * the way they specify "access", this will allow the ultimate result
> >>>> +         * to be independent of the sequence of operations.
> >>>
> >>> Wouldn't it be better to 'fix' those operations so that they can work
> >>> together?
> >>
> >> Yes, but then we should do this properly by removing all abuse of
> >> p2m_access_t.
> > 
> > I'm not sure I follow what that abuse is.
> 
> As was clarified, p2m_access_t should be solely used by e.g.
> introspection agents, who are then the entity responsible for
> resolving the resulting faults. Any other uses (to e.g. merely
> restrict permissions for other reasons) are really abuses.

But some p2m types don't really have a fixed access tied to them, for
example MMIO regions just inherit whatever is the default access for
the domain, which makes all this look slightly weird. If the access
should solely be used by introspection, then each type should have a
fixed access tied to it?

> That
> is, if e.g. a r/o direct-MMIO mapping is needed, this should not
> be expressed as (p2m_mmio_direct, p2m_access_r) tuple, but would
> require a distinct p2m_mmio_direct_ro type.

I guess we would then require a p2m_mmio_direct_ro,
p2m_mmio_direct_rwx and a p2m_mmio_direct_n at least, and ideally we
would need to differentiate the mandatory regions as present in ACPI
tables using yet different types.

Thanks, Roger.

