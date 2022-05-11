Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D40752352D
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 16:16:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326929.549598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1non8E-0001AP-3Y; Wed, 11 May 2022 14:16:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326929.549598; Wed, 11 May 2022 14:16:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1non8D-00017I-V3; Wed, 11 May 2022 14:16:01 +0000
Received: by outflank-mailman (input) for mailman id 326929;
 Wed, 11 May 2022 14:16:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dmv0=VT=citrix.com=prvs=123c0883c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1non8C-00017A-0J
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 14:16:00 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e055ca26-d134-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 16:15:58 +0200 (CEST)
Received: from mail-bn8nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 May 2022 10:15:56 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SA2PR03MB5803.namprd03.prod.outlook.com (2603:10b6:806:116::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Wed, 11 May
 2022 14:15:54 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 14:15:54 +0000
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
X-Inumbo-ID: e055ca26-d134-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652278558;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jXPGiBibOf4CplYiKWywPrN1tFR2O4LY/Sfbp0c5l3c=;
  b=gve2vB1/hEWy/pyACVrqls2ugV7NcxtqHV+3aX85Cb1ycqcW/UF9/TZ2
   6gRiqJEpF18CG95ov8WrSdAYS0fGT85tmav86OMvB3Oda+R4jzXI7gyjX
   KLxVRNZyd8QZvv2XeTc6OZIzMo4brz0dXavhLJhzJDyGzmBV/xT78Wzqn
   I=;
X-IronPort-RemoteIP: 104.47.58.172
X-IronPort-MID: 70944886
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:A5r1haDlMsuD1xVW/xbiw5YqxClBgxIJ4kV8jS/XYbTApD8mhDcDz
 zRMXz+AOPeCZmGgKd9+ady38k4GsMSAyoVkQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Ng29Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPg21
 OdijIGiZDssP/KVl70kQjlTSBlXaPguFL/veRBTsOS15mifKj7G5aUrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t2B8mcGc0m5vcBtNs0rtpJEvvEI
 dIQdBJkbQjaYg0JMVASYH47tLjw1yWjI20GwL6TjbYN3DmKkBxb7JeuPYDyRfOmYtUWkEnN8
 woq+Ey8WHn2Lue3zDOf93u2i+znnCXlWZkTHrm16v5rhlKIwmUZThYRUDOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYeUddNF+wx6CmW17HZpQ2eAwAsTCNFadEgnN87Q3otz
 FDht8jyGTVlvbmRSHSc3rSZtzW/PW4SN2BqTTAAZRsI5Z/kuo5bs/7UZtNqEarwhNulHzj1m
 mmOtHJn2O9VitMX3aKm+1yBmyirupXCUg8y4EPQQ36h6QR6IoWiYuRE9GTm0BqJF67BJnHpg
 ZTOs5L2ADwmZX1VqBGwfQ==
IronPort-HdrOrdr: A9a23:1yu9SqB4WAh6iTLlHeg+sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80kqQFmrX5XI3SJTUO3VHFEGgM1+vfKlHbak7DH6tmpN
 1dmstFeaLN5DpB/KHHCWCDer5PoeVvsprY49s2p00dMT2CAJsQizuRZDzrcHGfE2J9dOcE/d
 enl4N6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr1wjegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKvW/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdb11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtVqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW7HAbgcYa
 hT5fznlbZrmQvwVQGbgoAv+q3gYp0LJGbJfqBY0fblkQS/nxhCvj4lLYIk7zI9HakGOuh5Dt
 T/Q9pVfY51P78rhIJGdZA8qJiMexrwqSylChPgHX3XUIc6Blnql7nbpJ0I2cDCQu178HJ1ou
 WKbG9l
X-IronPort-AV: E=Sophos;i="5.91,217,1647316800"; 
   d="scan'208";a="70944886"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dV/6IHWHpJelJDVbm2f4Nzs7IiCAkdrKoixZGP5wJ9EWD7bEGr3kuaUMsjhTYojIG70IJG3hInjSnS01GAD3CmWBnL0TbgvQGX6BVCAeY/jbbRTGlBheCqDyZv5xRLOvra3VQI0EJ0ZSQ7TGRsfJGLBU20pjew1sRM32+pJZNsfRSxswniPq1WLP7qmYGglqchdAI2fFHTf3mWzp9x8MdSmZIbHwg/ny/S1LU6cuICVSOGInflyv9nbXZ+QrYHMBGEm+q4KuGIEu8jU4EeG9abJP2qD0L0pnWKUpOsTL2EZYzNTIFIPHvxczG/uGXjGIw4Sm2S2m80QKDnVCvGXNwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSgWIYdU4lCodwgwd0CX3I9ZlWWCoBOVBvN3BKDAp44=;
 b=amfxIxyQsj2i9SpBbgKCd9Gd2JqOjj5toJ0UykMu5QeaRjwghR87Q1De5CloH4oWkeCn3POm9JIlGlNnW+zPHRGzFonkJWoQ6AfZPWsOsXYi1dDnYA159mt5w4lrNh06gmc0JMFC0jwMz7QKXP6JqLm/Ja7juToN3HT7y2ZfebKBTA3fmdSOgdC3PMObv2w/ZzXRxO2aA6BbsElQ4SmMJhhSJDWRore3yIlkt05nF3DV1jHZ4gGgDBacqdfQ5PA8iwoAGCaviWZhj5+wXNGe2paT9UBzfCFEdyZ3CB7upb7VrXj79t6Ccp4RI/pEVbQQzPdN/pirqwuQGlYRqKufnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSgWIYdU4lCodwgwd0CX3I9ZlWWCoBOVBvN3BKDAp44=;
 b=uLFUUzQQcu+tTnrwJ2C3QNJUtENIdPy7MaG2E+OB1cPPwHTaOWU4ijMBqchm17zudj85my36ynBEUTawJY8WTG7ztKHSsR5hG0NQI28txevf/TkRtjPrjsl9VkFeYQdckhGF4TQLgckOhwJtR1EnVH3r2KDCwEPmDlZENpsP4b8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 11 May 2022 16:15:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 1/2] ns16550: use poll mode if INTERRUPT_LINE is 0xff
Message-ID: <YnvFFdBR1tgbOMkQ@Air-de-Roger>
References: <20220511135929.1823116-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220511135929.1823116-1-marmarek@invisiblethingslab.com>
X-ClientProxiedBy: LO4P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00bc6145-e6d3-49ed-0351-08da3358c275
X-MS-TrafficTypeDiagnostic: SA2PR03MB5803:EE_
X-Microsoft-Antispam-PRVS:
	<SA2PR03MB5803E87FE0F48CD0C84F3DE18FC89@SA2PR03MB5803.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1oenoG6UHVZG6N75iXtfDalZMlY8573UV/bGtDUKc5frRC3e8YpHGpY/2U1hHMFwfjB2FZO0Ljjnf8OgNW827ltL2loxre+xShXQyJAbD+ObowFDuTeqhRjBiLukoq/gcky7FmD/t0OUkMJ7Jx+s1AGGrlaprPITcJ4ri1J3VydGRJO/VBB6HBH5uvmF0Nk3z4QBkqvgvvPg940JkpdCgVGYdbnUFEtnCoyJyuvR8LF0gtZQHK07koheNCzslhgE6NFwZncve8/I+E0QmTmAxTYPThNUbvIxoCBB95l72U1crgDmw/ic1kd/G2JH/c3SeU/bpcTIU1mz6V4ka63s2txoHN7QZ1mrupVCIdE8TXxAjzLL5+bZvdqiQXqXio7pikjh5eeBglSqCpYOWu83OnglKvhKBKbjI/aXV7qZLzoYohbtS8Ik8uKE3n+m/ZkMUq1H0jeRc9k2dLDwjRbekOYoeQaxjeiXdZkPdF10g5pFYmz6A6GGPnO1mikc09bzi2yE/Sk3YuO6/+GRl9svg7n1yaAL7mEft5COpzd5/ZuxQ3sGfDDHab0Ckhfn+93gnBODE65c7gDGTTDaJ1xHx0hNmj3btySJAPmcg4NErG2n0LjNwQQKicWzpN6PNVgadO1jK63waTuysquBF5tfZw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(85182001)(2906002)(33716001)(8936002)(82960400001)(38100700002)(5660300002)(66574015)(186003)(4326008)(83380400001)(508600001)(66556008)(8676002)(66946007)(66476007)(54906003)(316002)(6506007)(6916009)(26005)(9686003)(6512007)(86362001)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEE4ZmhjRjhwckdHeE0vM1Vkc001WGJiWHBTSGg1aUdDOHU5cW1sdlJaOGdk?=
 =?utf-8?B?bGJmQ282UEVjV2tId3BvOUdXYzJiVi9KVDBUUzk0a0dyL2pyZDBYVW9nM3FC?=
 =?utf-8?B?MUJiY3NUL1NuMGEvbzREVzdnYjdZeTJNL1ZVOW9LS3hxMDZUa1JLVkI4NlhG?=
 =?utf-8?B?c0VNdmdVSlUweS84cCsxZk5DeXZHaUNjT2RBODJVVHRNcGRoYW51Z09rQ0Zt?=
 =?utf-8?B?d2RUeEVZcGlUTjVmOE43cUd5YVorNzNwWFFnZUJKNU5YZTBlWnoxK21aSSty?=
 =?utf-8?B?Uzh6N0hpNXpIQk82V0wxYnFQdUdKMmcxZWMrNlphT0EvaUhFa1p5MmJPcDdV?=
 =?utf-8?B?YXA2dmphcmlya3NwSUdxNUEwYkNNaDZhZVNYbG1ydzdwcHZ3R0pkQVJKQmhj?=
 =?utf-8?B?VGd2TitFZG0rUi9KenZQT1BEdVZjaWM4b3IyVVlJbHc1dDZkY05MSk8zV2E1?=
 =?utf-8?B?ak9FbmxERkhvb1M0QVVjVHJCaE4yWnhleUU1UFdma0N0NWJqbHFVRGVGM3ln?=
 =?utf-8?B?VE42TklhVVlKbTFsbGNCSFRBTThNRlNVK01YTHljWUptUmFNdnZmT3NXL2p1?=
 =?utf-8?B?d0lKSDlPdDRFMkx3K255SW45RkJYcHpGM0wvaHF3VElCVG5lUnRpVHNLUm45?=
 =?utf-8?B?NnRlQ0I2WmZhRUJVb3VoM040VExMOEZ0dmFBQW92cGhwT2w4OW9lZ2FFV09G?=
 =?utf-8?B?UXY1UXUzVFVsQlZMVEVPV3BuN0dkQ0d2NUs4YzFrMm5MbjlteHQ1OUxDc1dV?=
 =?utf-8?B?Y09va0lLVG5CRDJKb3VRL2YrRVBkVE15cXFPNGxMTkhkWEtZT2RuSmk4cGkx?=
 =?utf-8?B?WlFpVVBYN2t3bDFhd05jSXVMRUNvYnd5S3ZKSXBFRnd6emJCWTE5QTBTU3d3?=
 =?utf-8?B?YS9oWC9pQnEyRnBFSld2TmpPUS9HZEhqQ2JjeXR5YzhnTTJ4cnpNRG9URnpl?=
 =?utf-8?B?UmxjdDREd0xjQ2FGUjJrRTh2dDVZTHNQdmtkbklnU3NMOEhqanFaYjdmVVJE?=
 =?utf-8?B?OTJPYkg4YWVjbkJYMEM4bWJRTHdobzh6WG1jSVp4SnpER3JhL25meGd0OHFr?=
 =?utf-8?B?U29peHgzdTRmU0h2Mkt2b1hYdzdnd3hIK1F2R2RSZVhlYjludGJlcGJVeXBP?=
 =?utf-8?B?ZksyV0c4UmtSb1VTUXNDRG1YUE0xYUhKZ0drb0QrMDFKT2xkTUZ2SUxBTmt3?=
 =?utf-8?B?YTNaRVZaWEJTR2cyNU05a0JIdGhxRzlhQ3hIdnRjTmEwQVBHbEZ0Z0FBdDRu?=
 =?utf-8?B?VHo4YUlBUnhrOHRkU2dKWmg0c2hiOU5lYUVXMXVEeVY2SUpSK05vSlpsRWpi?=
 =?utf-8?B?MG5wYTNtYnlNb2ZsR0xQZFpDcWRTTXQ1UnNvVVIxNEQ4Y2NQdVpUNXBCYnJC?=
 =?utf-8?B?alZkTGQxS0dTTW5tRU1XY0NSVVhBbHBtcmgzL04ydFpUSEJDaDRUVExPV2Yz?=
 =?utf-8?B?WWRSaFVwMVFwTnZ3SGhia01rQVRFdGVLWDNhcXRqRVhTSVVKTWdoMHFZSXdS?=
 =?utf-8?B?ZjJEcWJwaWpvUmpqZExqZ1QrMkxqMEpqb0tRTnlUbU1YUnlIYnIvU0NhRkxa?=
 =?utf-8?B?eUZodDZsM2hFT005V3NnaFVwdDNrQVJBbk1ZMWxycUJJdmxPbFY3M1A5SStj?=
 =?utf-8?B?VkZIRGlZU1ZHWktKSVpxckFsTGtsYUJELzEvanZXSC9OSVlIT3NaVU02WURQ?=
 =?utf-8?B?aGs3VzdWT3lqWE5HY21SMmlubjdHMnJFTFNJQmNFdWZBcnJEajlFa2pidWky?=
 =?utf-8?B?dXl5L09XWmpVNTBQVEZKY3BobXNaMWJWd3lGeDNWaUIrOFgxcHVOYzl4bVFz?=
 =?utf-8?B?Y2hUUDZudm5uVTZrTzhTRUZ5bkU0eE5ncDNKUnltbWNTZGhTUjY1VEl6Tzdn?=
 =?utf-8?B?ODNySCsybGdRSU4zK3dmNHRYTENPZnQxcTVhWEdYMmdCR25OelFJRS9rbW5k?=
 =?utf-8?B?L1dadWk5cUdBOXdkcUNCMXhqK0MyejVyem9tVUdpWmh5ckdheWxsMjNxSkwr?=
 =?utf-8?B?NVpheWhFazRneUE3aEFaVmJjWVpvL05walBpeHpwZGYydVpKRmNFZDZoVFZl?=
 =?utf-8?B?dlpwMklyKytLNklJMUhLQ3RWNFpzcEdVQUdObkJjVThiVHRBL2xDTzhGSnlD?=
 =?utf-8?B?TXZHbEE3OFVEOVZNRDcwYlF0MTNXWlRqaTMzSWlDaG85bTdnSE0wZ2ZiQlkx?=
 =?utf-8?B?SFJWa1pqOFE5MEJuVmRicVhUSmxmRmlwWUhxUlZrRkVpUW9SNllVbWFReHFq?=
 =?utf-8?B?c0hIUENheCtmNjJsdnlJNDRsTHBlc0lScFJibTYrcmtTbFNxUk02NXVkYWR6?=
 =?utf-8?B?QXB1aWwrMUk2aGlyUGRoT0g0ak5lc01oWHJiKzRoSnlHdFZJL1B2U0tBRTEx?=
 =?utf-8?Q?LBG3EREznpHsrqkM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00bc6145-e6d3-49ed-0351-08da3358c275
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 14:15:54.0808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OKIfzg457/n6ilQsWujETWFYpPqC2mni7gU0ltiBwA7L7km1YaXkbLRZpXLD6eRU4cLiIlaqxy8+55lPMsQ36Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5803

On Wed, May 11, 2022 at 03:59:28PM +0200, Marek Marczykowski-Górecki wrote:
> Intel LPSS has INTERRUPT_LINE set to 0xff by default, that is declared
> by the PCI Local Bus Specification Revision 3.0 (from 2004) as
> "unknown"/"no connection". Fallback to poll mode in this case.
> The 0xff handling is x86-specific, the surrounding code is guarded with
> CONFIG_X86 anyway.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> Changes in v4:
>  - adjust log message, change it from WARNING to INFO
>  - re-add x86 reference in the commit message
> Changes in v3:
>  - change back to checking 0xff explicitly
>  - adjust commit message, include spec reference
>  - change warning to match the above
> Changes in v2:
>  - add log message
>  - extend commit message
>  - code style fix
> ---
>  xen/drivers/char/ns16550.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index fb75cee4a13a..c0d65cff62fe 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -1238,6 +1238,13 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>                              pci_conf_read8(PCI_SBDF(0, b, d, f),
>                                             PCI_INTERRUPT_LINE) : 0;
>  
> +                if ( uart->irq == 0xff )
> +                    uart->irq = 0;
> +                if ( !uart->irq )
> +                    printk(XENLOG_INFO
> +                           "ns16550: %pp no legacy IRQ %d, using poll mode\n",
> +                           &PCI_SBDF(0, b, d, f), uart->irq);

There's no point in printing ->irq as it will be 0 or else the message
won't be printed.

With that fixed:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

