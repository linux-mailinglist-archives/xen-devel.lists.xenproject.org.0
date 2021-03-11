Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6606337348
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 14:01:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96508.182613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKKwI-0002eb-3G; Thu, 11 Mar 2021 13:01:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96508.182613; Thu, 11 Mar 2021 13:01:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKKwH-0002eC-W7; Thu, 11 Mar 2021 13:01:17 +0000
Received: by outflank-mailman (input) for mailman id 96508;
 Thu, 11 Mar 2021 13:01:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DcZr=IJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lKKwG-0002e7-Ml
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 13:01:16 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b663bba-3f60-459a-bf86-514ab6e3a430;
 Thu, 11 Mar 2021 13:01:15 +0000 (UTC)
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
X-Inumbo-ID: 7b663bba-3f60-459a-bf86-514ab6e3a430
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615467675;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eGfdVCJ49I3T2FJxGhf5mXTVeWsNmVm4j6ue50ZEwns=;
  b=PWC0a5XiZ7YECf0jxzgtNWFzowS5iV/5K8sEkZ/Vw+I70HzMnu05PElV
   mnxT5CZ4kfjIamdGqkHgfCcR6RhHq6ClP8Tx/kDNbp5b2O3o/dc6YZtAb
   f2dV5gUAKc2NYpE6CW6kf3mOhFxVD5phl5C18jXv6Y8SwC7UVTzGM7aO2
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7VxGC+ThhMM3fS8KItu/SAvVvTlGG89yZr9RuGu64P0Jr5/RVz8N/gVkc0dthw0OavfDupJjBR
 UVdaR7MAWz9JEJ3wiJrexpOnLXiK+7mZES47kgdXDDZ/xvhHEripn6PA5dm5ic3mYfOAY0way7
 AaJEBPq8M7iXzDtWeP7Ug6E9nPraO+epOGXLc0SbA3p+pzLSroSVkH4Mq8Oi9SVaeEczoEQYZW
 aaL9o7wPNhCAOzlQDaSys4FFJrI2C/O1Nym597lL7Or7MjDA2cfxSF5YKbE1T4qIROtH8A/VoN
 ztc=
X-SBRS: 5.2
X-MesageID: 40463976
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:vP+viaGuDgp/lOEtpLqFR5TXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7L0/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeOJwTXzcQY76
 tpdsFFZOHYJURmjMr8/QmzG8shxt7Cy6yzmeLC1R5WLT1CQYsI1XYcNi+wFEpqSA5aQb8wE5
 SB7sRKzgDQB0g/RMK9G3UDQqz/vNXNjp3relorABQg5QmIg1qTmcHHOjKf2QoTVC4K/Kc6/Q
 H+4nDEz4iAk9X+8B/T0GfP849b8eGB9vJvDNGB4/JlUQnEpR2vYO1aKtu/lRAz5Nqi8VM71O
 TLyi1QQvhbz1P0UiWLrQD22w/muQxemUPK7VODm3PsrYjYaVsBerJ8rLlUeBfY9EYs1esUuM
 kgshP7xvgneS/opyjz68PFUBtnjCOP0B0fuNUekmBFVs8mYKJRxLZvj399KosKHy7x9ekcYZ
 BTJfzbjcwmFG+yU2rUpS1GztCqQx0Ib227a3lHkMmU3z9KpWt+3ksVyecO901whK4Vet1q4f
 /JPb9vk6wLZsgKbbhlDONEesevDHfRKCi8fl66EBDCLuUqKnjNo5n47PEc4/yrQoUByN8XlI
 7aWF1VmGYucyvVeIyz9awO1iqIbHS2XDzrxM0bzYN+oKfASL3iNjDGYEwykuO7ys9vQPHzar
 KWAtZ7EvXjJWzhFcJixAvlQaRfLnEYTYk8pss7YVSTucjGQ7ea9dDzQbL2Hv7AADwkUmTwDj
 8oRz7oPvhN6UitRzvWmx7Ud3TxelHu3J55HaTAltJjjLQlB8lpiEw4mF657saEJXlpqaotZn
 ZzJ7vhj+eaqACNjCH1xlQsHiAYIlde4b3mXX8PjxQNKVnIfbEKvMjaXWhT2XCANyJuVs++Kn
 8Ym31HvYaMa7CAzyErDNyqdkiAiWEImX6MR5AA3oqO+NniYZF9Kpo9QqR+GUHqGnVO6EZXgV
 YGTDVBal7UFzvoh6ngpocTHvvje951hxruB9VVp3LZvUC1vtouWXMfYj6rXaes8EMTbgsRom
 c0374UgbKGlzrqA3A4mv4EPFpFb3nSPKhLFz2fZIJfmqnifSZ5SWviv03CtzgDPk7Rs2kCjG
 3oKiOZPdXGGEBUtHxj3qH2y19sbWmGc0Vsand1jJ1lGQ39ywNO+N7OQpD2/3qaa1MEzO1YCj
 3DbDcICi5Fxty81neu6Xu/PERj4q9rEv3WDbwlfb2W52ikL5eQk7oaW9VO+ox+CdzouugXcO
 6WdgOPNgnkA+cx1wH9nAd8BABE7F0f1d/40hzs62a1mEMlCf3JOVJ8WvU1Jcqf42WMfYfB7L
 xJyfYO+c2+PWX6ZoTYleX5bztfJgjSpmDzZecyspxQtb8zsrw2P5Sza0q/6Fh3mDEFaOHznw
 ciZY4+xpbrEIpmZdYTdCJU5UBBrqXEEGIb9ijNRtYjdlQshULBN9yH47D0uaMia3fx0zfYCB
 26yWlh5P/LUCuI6K4CB48xKWpQblIg6H4KxpLKS6TgTCGrffpE5ly0LzuUd6JcUrGMHdwr31
 pHyuDNu++cbCzj3g/M+RN9P6JV6m6iBee/GhiFF+IN09u0Pz238+SXyf/2qDf8Uj2gbUsEwa
 VDaEwLd8xGzgAYs7df6Fn4doXH5mQ/k1Vf5jl7llninqieiV2rbH1uAEn+mZVZXT5aL36Sq9
 /KmNLoj0jA3A==
X-IronPort-AV: E=Sophos;i="5.81,240,1610427600"; 
   d="scan'208";a="40463976"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gq8E+bYP/w2DRNamVvtzae9hvqnXnc24Kym7qUhEGp6qihvzE1jsbnO7MYhhW1qAK45CdsM95wp+KU3WmpfuUDGWPhuGsyySipGqQhHHnn39EOmJeazvtmzs06o0Nb5zrgc69S8wcYnJkZS+/Ge8atkYli/DbRMBVLIWzMwA/znBV0rSzV1RNgSY5gNkV/89aYippVGwp+oyH9JGlGEKYrlns0EpZujUtZHcA9+KnRyMgi5KUtj9npGlNPsnjJY1cGj0CI/ZjPTXEAv91DviSYLFTt/VIVN8RZYB9cL8YIWN26foD7kQu0woNvttkoTAqguDfOGuX5mrgIJgziqN9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ajpze4cH1ExYhZ/fAlLPgE41D+0bllP+1rV/FTpxLa4=;
 b=fXoo024suvXf3rRflBYzimLNw03aAp3BWHkorMJsnDq6/Zi/cR2QtAxUoLoyRzkucqThbmQU0kRFSoukV76cBj/OBhyyRjfxz+zKnqlKfSoNAb+JQslHEf2GG1LSDISYlRGqkTyTM+YNf04yYVFLZAXQtK2LK+kbaB4IVgS8LbOeL3Lb0NEJsiG4jEzx6bne9uu1/jpGkqf59v0g4U5HdJft+E0hhpu8Y2Yu0gnbpoUC20XJZXXUYAFYUtOaZfqWTjwVsa8FkQd0eQ9zyGQvZPH1p+ZwPYwORuNJ9Wj8ybBoWTzgOz9DiW23Q24Y7zuabsSr6o4hf+B3mm3M67Uxeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ajpze4cH1ExYhZ/fAlLPgE41D+0bllP+1rV/FTpxLa4=;
 b=IRXfck3PrpN2gEJDuPgbtCO0s151G9FIxV2PQkMsbGLxtzK3jJBJhW+VDzgy7FTGCnpwISxFZvHrSz3oGBOTQ2G4IqleHk77iRtrP4aYd8Laa7ZPzqpg3VGcb5ULBNMYky4IS0CktbU4nOy0ovwvq63ey6lnrbrmwDNPA4xkdyE=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Ian Jackson <iwj@xenproject.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, "Paul
 Durrant" <paul@xen.org>
References: <20210310150722.27194-1-andrew.cooper3@citrix.com>
 <d375232a-d1a7-737c-0887-8b7e1c9a772d@suse.com>
 <13f03a67-18c2-e564-a0f6-84eccc7eeb76@citrix.com>
 <556ce32b-5087-b8b1-432e-643218dd8c6e@suse.com>
 <9ca069ab-8b6c-c8f1-d68b-4a9bb0cf5c56@citrix.com>
 <c8ed458a-6064-95d3-f189-f0928b09baca@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.15 v2] xen/dmop: Strip __XEN_TOOLS__ header guard
 from public API
Message-ID: <62b79d56-2438-23ab-49c0-a8c4b290c4f7@citrix.com>
Date: Thu, 11 Mar 2021 13:00:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <c8ed458a-6064-95d3-f189-f0928b09baca@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0493.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c58c1d16-c7db-4d23-b05a-08d8e48db847
X-MS-TrafficTypeDiagnostic: BYAPR03MB3864:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB38645B15DE17AF505BAF9C20BA909@BYAPR03MB3864.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aDoQ6mTs9BBtsjjJuWG8Kxs2PPi2v9eKMb/EVB3yOdClO9/kWdknKaKTP+5lsB/msX2Y27/EwjZOx9/LDVd3vOsaXHD/P2eYy0R9g+FgYzXsgFMUVH5pv15+jtL7sEQ2tcTnhb3oQdfH/SvwNZcOUKd4nJYGKz7HDDFZkwCY/EaM9H/s2RGr99K5Ro4c7Om5gHAFHvX4oBZVfS4yFH5ph4KHlt+/OGh/1QJKqLn3VnwpHBtJHViOyXavoaRe19YZprmHDE75yqmQyTgoaP6aqJVVDL5RC84PYyaL4pzH25Ud0W4bDiCqAaEDpii29gnjz0d+kx6IbZOPOQOu5YabpfcUhj2yuFAvX79zmggnaD/ku9+2DP0HNCzJYxWsDlnoaDAn7n8vZSJ2vSlYuvgRVZl8rsxiTByIEnTaSbEtdzZPWeI5ccZNlEM2z9mMC0PC9FAQkhzcrP+oeFgvd0Sz7XHaZR2ZlSQaU/7NZ2S0A0vVSYg5w9aymyrvI6zLmnP9VC1850Trq1JBrLOBxdQSSzF1m8GbTG7UD3KtQZTi2DZPB4/lDf9fjOsHW6aY03zGhNRfc2eNXIyBlotdj8AJWQJOO13UNSzzIzJtbBnGJjY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(366004)(346002)(136003)(4326008)(16576012)(66556008)(26005)(6916009)(6666004)(31686004)(31696002)(5660300002)(66946007)(16526019)(54906003)(186003)(36756003)(53546011)(956004)(478600001)(83380400001)(2616005)(6486002)(316002)(86362001)(8936002)(2906002)(66476007)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bTZ3MUpDL3NYODZ6VytZZUwrOCtlVTVVcmhURHdaeit1VEc3N2VEd2ZkWDM2?=
 =?utf-8?B?OE9LVU5PZm9rejZId3VzazREbmVadDhOdzZXRURkTmp3Q2VDNWZackMwZFRl?=
 =?utf-8?B?MklZNG9DOC94ME5sRUtheFdqTkdBNXc5cVh0M3ZkNm5KMUxqUTlFL0ZESCs3?=
 =?utf-8?B?dWYrWVF1WHFEN1RXU0l1VlorVXhwNkV3cWxTeWluWGZKWHNNTnRRRDg5RVBz?=
 =?utf-8?B?b1BTZ2RoempYV2lUcXpxWXJVRWFsMU9VSERCVTIrS1VzeVAvRWFuZzBXcWpM?=
 =?utf-8?B?M0RRbXE2U0tWbGo5a3lySkl4S1g5T1dkMldsOWVoQ2JnbnpSZ2xLeGtPRHF1?=
 =?utf-8?B?R2U4VlFRYVlEdkZRdWw0M2FVL0tSbDNCcDdiMUFIc05rWEFYcFhXWDVZcDFh?=
 =?utf-8?B?K09oQWI4d3NIOFJsMVN6WWhLRzhpWWVTRTQ5a3c1OUE0ZlhxWmhlQ1JWdUg0?=
 =?utf-8?B?UXZrNzh6N1lVRkp2OFJRVkFZSzJZVkdWUXdkS3d0akp5YWlXcFlhV3BYOTBq?=
 =?utf-8?B?dmFLVmRxRFQ1ckpKdUJtMTZsR2x5enlOZ2VvMnQ3cDlDdEtXcUo3UzJxajIw?=
 =?utf-8?B?UVdRbXNSckg4MjAvMDQwSlRvRHl5Y1FGcW9vNHRQRXVXSk5rTVBYZWRaczB4?=
 =?utf-8?B?ZzZIR1lsU3lpOWF4UldYTVN0OXB0aXB6R3dwM1Y1bUhPc0hEVlMySDUyYXZB?=
 =?utf-8?B?SURTTVkyTzJ1UldaQlBCb1Nacjl4VXlQVVNtZDdyUm90ZFV5TVh1ay9rUUJ0?=
 =?utf-8?B?elo2ZW1VcE5mVWE2NnZ2d21qUk5xUEtaSmlBaVlmTXdzeFFYRUxBdTIzRWFZ?=
 =?utf-8?B?NFJ3VmdQQTIxbGdKOEtNaFR2enhTLytzcm5qZlROdWNjUlV2TEt2a0s0THho?=
 =?utf-8?B?VFZzRERmV1gxYzdEYlRpM05na2lpWEpIV3h2NTVKTlRKd1doS2U1bGtCeUth?=
 =?utf-8?B?eTVaV2gvVjlnOHc2dmF1OEJVZEZFMkFZdGloS2dsaVVEV1piVVNNeTBuQzJx?=
 =?utf-8?B?aFFTTDVVaXAyVnV0WEZVRHhMYThnQjhIeTI0aDZLcVBWN0pSUjcvNm9vZkVs?=
 =?utf-8?B?Rzl0bjFIK0VxdFVRT2NZYzUrTlQwOEtQb2pjcS9lSVp2eHRWM2l4S1VoQnVk?=
 =?utf-8?B?a0VBN09yWkQ5UVV2YjRGRDVCZlhzSXhCU3hxbm1YOGNjS1hLTjJDenBKRExw?=
 =?utf-8?B?VGppR1pCTWlJQXZxV1JDNHB0L2J6bW5TbWlleC9YVDFOMkJEcHNiMkQzbGtx?=
 =?utf-8?B?bzVIdUY0S3lQY3A3OFA5SW51U3JjKy9GYk5naEFCTFJzQXE2Mm9BeTgxVVhX?=
 =?utf-8?B?TW1SUHJGdmRieWhnRml3ZjFhRjE2ZzR1aEZMMjhLa2JVMWRLVDhRNVVhVWZZ?=
 =?utf-8?B?Z3lKWmVKVWkveDFhcGxnWlJMYk4vdktWRXZMeVZkaVFtY2dvazRwdXBIdVg0?=
 =?utf-8?B?MVJ2elNMWTlTeEpSMERvc1NISzIweTBPVWIvaCtiZ3pMYWxGR05pRWFNU01F?=
 =?utf-8?B?c0JXRks4eWFLUVlZeHJtR25qTGZWd1JORmdpVEJwRmdKSzRlR2VwUWhyMVF6?=
 =?utf-8?B?VFp1M1hnc0N3QnJvVUZMbmRUY2V2MkgreGZLZEZzOVM5aEEwQllTMUJEMFo3?=
 =?utf-8?B?V2swb3NxMkFVeDJPb1FIdHRvZ2YxQnlxREVmUVhsUDNubWhMSGZtWERya1JU?=
 =?utf-8?B?MkVDQ1JGeFUrdDdzTys1VGIxNjR0K1E0UEoxRDYyV3QxUjdlcUdrWmZvODRR?=
 =?utf-8?Q?qNuGJKQYKnqPlubB6lnd4SIVUcgUc6ZNiED1FYR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c58c1d16-c7db-4d23-b05a-08d8e48db847
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 13:01:00.8731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8BUI7EbYB9O0hbyGtX8lJ405SU+R+q7veAkRgGGDEzB0P1Mhz39m/UBXcjtXa60GvPZbrCO3iAHW7uFBs1/FfdvaAgq5USZSi9C3j95l2aY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3864
X-OriginatorOrg: citrix.com

On 11/03/2021 11:41, Jan Beulich wrote:
> On 11.03.2021 12:05, Andrew Cooper wrote:
>> On 11/03/2021 08:27, Jan Beulich wrote:
>>> On 10.03.2021 18:22, Andrew Cooper wrote:
>>>> On 10/03/2021 17:12, Jan Beulich wrote:
>>>>> On 10.03.2021 16:07, Andrew Cooper wrote:
>>>>>> --- a/docs/designs/dmop.pandoc
>>>>>> +++ b/docs/designs/dmop.pandoc
>>>>>> @@ -4,9 +4,13 @@ DMOP
>>>>>>  Introduction
>>>>>>  ------------
>>>>>> =20
>>>>>> -The aim of DMOP is to prevent a compromised device model from compr=
omising
>>>>>> -domains other than the one it is providing emulation for (which is =
therefore
>>>>>> -likely already compromised).
>>>>>> +The DMOP hypercall has a new ABI design to solve problems in the Xe=
n
>>>>>> +ecosystem.  First, the ABI is fully stable, to reduce the coupling =
between
>>>>>> +device models and the version of Xen.
>>>>>> +
>>>>>> +Secondly, for device models in userspace, the ABI is designed speci=
fically to
>>>>>> +allow a kernel to audit the memory ranges used, without having to k=
now the
>>>>>> +internal structure of sub-ops.
>>>>> I appreciate the editing, but the cited points still don't justify ..=
.
>>>>>
>>>>>> --- a/xen/include/public/hvm/dm_op.h
>>>>>> +++ b/xen/include/public/hvm/dm_op.h
>>>>>> @@ -25,9 +25,6 @@
>>>>>>  #define __XEN_PUBLIC_HVM_DM_OP_H__
>>>>>> =20
>>>>>>  #include "../xen.h"
>>>>>> -
>>>>>> -#if defined(__XEN__) || defined(__XEN_TOOLS__)
>>>>>> -
>>>>>>  #include "../event_channel.h"
>>>>>> =20
>>>>>>  #ifndef uint64_aligned_t
>>>>>> @@ -491,8 +488,6 @@ struct xen_dm_op {
>>>>>>      } u;
>>>>>>  };
>>>>>> =20
>>>>>> -#endif /* __XEN__ || __XEN_TOOLS__ */
>>>>>> -
>>>>>>  struct xen_dm_op_buf {
>>>>>>      XEN_GUEST_HANDLE(void) h;
>>>>>>      xen_ulong_t size;
>>>>> ... this removal: What the kernel needs for its auditing (your 2nd
>>>>> point) is already outside of this guarded region, as you can see
>>>>> from the context above. You said there was a design goal of allowing
>>>>> use of this interface by (and not only through) the kernel, e.g. by
>>>>> a kernel module (which I don't think you mean to be covered by
>>>>> "device models"). If that was indeed a goal (Paul - can you confirm
>>>>> this?), this would now want listing as a 3rd item. Without such a
>>>>> statement I'd call it a bug to not have the guards there, and hence
>>>>> might either feel tempted myself to add them back at some point, or
>>>>> would ack a patch doing so.
>>>> Xen has absolutely no business dictating stuff like this.
>>> Actually there's no "dictating" here anyway: People are free to clone
>>> the headers and omit the guards anyway.
>> That is somewhere between busywork and just plain rude to 3rd parties.=
=C2=A0
>> "here are some headers but you need to unbreak them locally before use".
>>
>>> Outside of our own build
>>> system they really mainly serve a documentation purpose.
>> Header guards are not documentation
> And I didn't say so - I said they server a documentation purpose.
>
>> - they are active attempt to
>> segregate hypercalls by "who we think is supposed to use them".
>>
>> MiniOS, which uses this header within our build system, is not a part of
>> the toolstack, and should not need to define __XEN_TOOLS__ to be able to
>> use stable-ABI hypercalls.
> I've not been able to spot a definition of __XEN_TOOLS__ in the
> mini-os sources. Are you perhaps referring to tool stack libraries
> getting built also for it?

Things in stubdom/ which include xenctrl.h get __XEN_TOOLS__ set behind
the scenes, which is the only way that including libxendevicemodel.h
worked before last week.

>
>> Equally, the fact that libxendevicemodel's private.h needed to define
>> __XEN_TOOLS__ demonstrates the problem - dm_op.h (the structs and
>> defines - not just the types) are necessary to use the ioctl() on
>> /dev/xen/devicemodel in the first place.
> But this library _is_ part of the tool stack. Looks like it really
> boils down to ...
>
>>>> =C2=A0 It is an
>>>> internal and opaque property of the domain if the hypercalls happen to
>>>> originate from logic in user mode or kernel mode.=C2=A0 Stubdomains wo=
uld
>>>> fall into the same "kernel" category as xengt in the dom0 i915 driver.
>>>>
>>>> However, the actual bug I'm trying to fix with this is the need for
>>>> userspace, which doesn't link against libxc, to do
>>>>
>>>> #define __XEN_TOOLS__
>>>> #include <xendevicemodel.h>
>>>>
>>>> to be able to use the libxendevicemodel stable library.
>>>>
>>>> The __XEN_TOOLS__ guard is buggy even ignoring the kernel device model
>>>> aspect.
>>> Depends on what __XEN_TOOLS__ really means - to guard things accessible
>>> to any part of the tool stack, or to guard unstable interfaces only.
>> As far as I'm concerned, __XEN_TOOLS__ should always have been spelled
>> __XEN_UNSTABLE_ABI__.
> ... this. If you added half a sentence to this effect to the description,
> you may feel free to add
> Acked-by: Jan Beulich <jbeulich@suse.com>
>
> I still would appreciate if you also added the kernel (module) aspect to
> the doc change.

Thanks, will do, and I'll post a v3 just to check that everyone is happy.


However, having laid things out in this way today, it occurs to me that
we should consider further cleanup as well.

I do agree that code wanting to use the libxendevicemodel.h API almost
certainly don't want/need the dmop ABI.=C2=A0 (i.e. an individual consumer
will want one, or the other, but almost certainly not both together).

Should libxendevicemodel.h really be including dm_op.h?=C2=A0 AFAICT, it is
only the ioserverid_t typedef which is API shared between the two
contexts, and we can trivially typedef that locally.

This is something which we should either do now, or not at all.

~Andrew


