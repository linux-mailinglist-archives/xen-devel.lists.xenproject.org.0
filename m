Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2E040938F
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 16:21:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185723.334428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPmpD-0007L3-Bq; Mon, 13 Sep 2021 14:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185723.334428; Mon, 13 Sep 2021 14:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPmpD-0007IT-8l; Mon, 13 Sep 2021 14:20:47 +0000
Received: by outflank-mailman (input) for mailman id 185723;
 Mon, 13 Sep 2021 14:20:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hZsy=OD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mPmpC-0007IN-6e
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 14:20:46 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7ad5cc8-230c-408e-bc76-037f3d72c5c9;
 Mon, 13 Sep 2021 14:20:44 +0000 (UTC)
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
X-Inumbo-ID: e7ad5cc8-230c-408e-bc76-037f3d72c5c9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631542844;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=iAt0k1o/FLU52gRnoWXiAAiUeQEwBFyFuwHu5mpSN8M=;
  b=UTiu4Ud+Kr0NoWGY3l6HjykG1Cuono/HVYj0k2dJ0ULlmTbPw2MjQV6K
   0CjxxFaXgNI0x0uKRDUWiFCbQUtiCBYftd0z+oKctZ++uut/Y7gDjkJnn
   2T75YXrb0sDg842xLuZNbbjjcCUpbvu81kg0K1CHqoULMIJIXwfcgiG4n
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GqhEAQ7TUiZ2jysIj/Ot6avN18egzAbYm5GCAHQmwItlVHFcUK1nJwkfQFInHumvKPegnw7f/t
 0Dd86tNDDQZ1qUe0Z50enWsej2+TkW28aK9ynS1avpLUX0SxqKeQYRWaxbmw3E6aByWGSf4v5p
 82pz0m79neQzqhsqbI1WdXL4KJ1Imm4Z6gyp2QQRAzQiqpQCSWPEbeYlXTuEk7gbyg1JqG1s+T
 xuRjVCnnFN97yoYb/mJ6/aq2+lRmoDXiAYBvTovM45yqhwNrjwZlGeAKWKB9zHhggFD4SqUzdc
 5/tcW2f7b+8lOTzM6L7B7Qem
X-SBRS: 5.1
X-MesageID: 54357994
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0BYKLaz8MQ6jgOZJ3L16t+cpwSrEfRIJ4+MujC+fZmUNrF6WrkVUm
 2pMWzyDOvfZZjGgKd92ao+w9x4PsJfRx4RmTVY4+yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s7yrdi2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt9Myx
 NljpYbgcg0GMIj9s+AabkNiMhgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYIEh2pv15ESdRrYT
 8ApURo/bRD6XzxsO1RPDsJjuLqnhXaqJlW0r3rK/PFqsgA/1jdZz7zFINfTPNuQSq19jkue4
 27L4Wn9KhUbL8CEjyqI9Gq2ge3Clj+9X5gdfJW6/PN3hFyYxkQIFQYbE1C8pJGEZlWWAowFb
 RZOo2x38PZ0pBfDosTBswOQoz2IsjAMQYprGcI0zTCmzq3puTy4Pz1RJtJeU+DKpPPaVBRzi
 ATQxYi0VGAw2FGGYSnCrebP9FteLQBQdDVbNHFeFWPp9vG++Nlbs/7Zcjp0/EdZZPXOEDfsy
 nihqCEkjt3/ZuZaiv3moTgrb9+qz6UlrzLZBC2MBQpJDSsjPeZJgrBEDnCBsZ59wH6xFAXpg
 ZT9s5H2ABoy4XSxqcBwaL9VQOHBCwm53M303gc0QshJG8WF0H+/Z4FAiAxDyLNSGp9cI1fBO
 RaL0SsIvcM7FCb6PMdfPtPqY+x3nPeIKDgQfq2NBja4SsMqL1HvEeAHTRP44l0BZ2B1wf9mZ
 sbKLp/2ZZvYYIw+pAeLqy4m+eZD7gg1xH/JRIC9yBKi0LGEY2WSR6tDO1yLBt3VJovfyOkM2
 9oAZcaM1TtFV+jyPnve/YIJdAhYJnknH5Hm7cdQc7fbcAZhHWggDd7XwK8gJNM5z/gEyL+Q8
 yHvQFJcxXr+mWbDdVeAZEd8Ze69Rp14t386Y3AhZA76x3g5bI+zx64DbJ9rL6I//eluwKcsH
 fkIcsmNGNpVTTHD92hPZJXxttU6Jh+qmRiPL2yuZz1mJ8xsQAnA+9nFeArz9XZRUnrr5JVm+
 7D5j1HVW5sOQQhmHf36UvP3wgPjp2UZlcJzQ1DMfotZdnLz/dU4MCf2lPI2fZ0BcE2R2juA2
 g+KKh4Evu2R8ZQt+dzEiK3Y/YekF+xyQhhTE2XBtOvkMCDb+iyowJNaUfbOdjfYDTum9KKnb
 ORT7vf9LPxYwwoa79siS+5mnfAk+t/ih75G1QA1TnzEYmOiBq5kPnTbj9JEsbdAx+MBtAa7M
 q5VFgK25Vld1BvZLWMs
IronPort-HdrOrdr: A9a23:mPoSq6CcPeLI/8vlHeg3sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHP9OkPIs1NKZMjUO11HYTr2KgbGSpgEIXheOi9K1tp
 0QDZSWaueAdGSS5PySiGLTc6dCsai6GeKT9J/jJh9WPH5XgspbnmFE42igYylLrF4sP+tEKH
 PQ3LsMmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZTbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczOgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxeokPK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesXMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO11GkeKp
 gsMCjg3ocVTbvDBEqp+1WHgebcEUjbJy32AnTr4aeuonxrdHMQ9Tpv+CVQpAZGyHqRI6M0kt
 gsCZ4Y542mePVmGp6VNN1xMfdfNVa9My4kEFjiaWgPR5t3cE4klfbMkcEIDaeRCdo18Kc=
X-IronPort-AV: E=Sophos;i="5.85,290,1624334400"; 
   d="scan'208";a="54357994"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gz1VffEif7i2BvhAwMr0btZfVCTwnep0byajhkJFfX/pSo26sOQPt0dGw8xPhQq965aquJ4HMxBk0yCVzRYVgybdXhX4h8cpITcnGxnKdNNcqL1hPV7bAx7QdvB1I53JcM8Rkao6NxlGOKqqs1LQtrrxXrJ4I0QY3n5YWyGOrcwCK276HGukuSiF9+MHYUh5VRUVVC7i5IBpjw2bvJL08Np7emvS++5rBex7BIZADOPm5IwLqjbezgvyKcBdwVJOF5jwAtdWyBjakwOmDOY1ZnskGChGAFSdyIeG6G9UwNfatGuormObVeizUcQVW7Ow9wLBpQkuT1ZjGk0b+AwRUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=lFIpKuxY1KDo93eqklJaIn6eKn2dt3rHoncR3xazink=;
 b=nHu5GyXbgpQEuQQeuNlOfwffUhsHKKAIhMmv3rVc9Rv5ZPRmIoIsywCETKfm5/6KjRERreOcKL7WEXWmUwtYt9PaNihMtLbyBhOBWllv/MRWfOmq9fQP/6GKb0rsR3eMbXREa9yY+8VPnL53j3a4+bRA7HrrYoz64hMmYbNFQzJshKCSzY5SnI5GoQlccQAMZHNsgCvSPbTWJYjHyjgsiihkKptpp/g4nE4WNA4dxn1eBlAW5/zpZGrPMvYVVlHq8hlMmwT5/aGEb7brWnOe0mZE2OSGA81k7JEm8FEwX/S9oQj9ZgLl3IFyJvaaYwUgSK51OpmBOXssZNnwiV/Zvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFIpKuxY1KDo93eqklJaIn6eKn2dt3rHoncR3xazink=;
 b=N2+Lua01SaXfv48pKump9FSx1O9L4AS0tNwP+/sPv3/E9MMMz5+VslPCu1bQOJzqeqdrayoixSxkGNLDrYQWmr7ntkkbf26j371PSmIWmHo/Pzr6wRO3pAxAMmCgfwWh2J5Vr7Wl9UhkTXmqGXnEjvZWx8++7dTMGZx5c9Rsp7w=
Date: Mon, 13 Sep 2021 16:20:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: conditionalize workaround for build issue with GNU
 ld 2.37
Message-ID: <YT9eL7b7A8CirzOa@MacBook-Air-de-Roger.local>
References: <4efe38f8-16a7-ad66-04dd-d55aadd57166@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4efe38f8-16a7-ad66-04dd-d55aadd57166@suse.com>
X-ClientProxiedBy: LO2P265CA0265.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b85a7b8-a59f-410b-a536-08d976c1a78c
X-MS-TrafficTypeDiagnostic: DM6PR03MB5065:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB50655E42717F8A5A4D7FA2428FD99@DM6PR03MB5065.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8AmVr4Oc+g5z/Vdl7txidD23RFXNs8x9KyYBbdIODyIi+heAwbk+S0KYQ4WIYAPdQrB2S6ZcKNClMadn0Ge4QhHBJ+nWVDSVA27F7SNwDdiClNiVWe+3eo2FYe4nsQ+e9RUEUgHWlM0FP+u6lqT+T+1X5NKUz6A23l9YiYYA15Fwn/QuLU2NpLChaOvDxeqe6dIOApNcfe6M4tlEOmcz2CR02yphMPANKDRMm+HpGR5uzpSVw8QNrQFM1CFaGo+cQTC+DxGqnV8/QvZD5l7SUt0B9A7muy6FkA6cnplt70li+yzo1LczRYObmw4wvXdBJYt+qdJpg8rbDaoAY6EpKLzyFwWZ9Vqeco8ZNpPwVhRwBJkB88AUj9OLRtcRjaN9AAyQ9oWNKeOURHdL70M2DmSP1Y6Ttss9Tcq+kMSTa+CkemjOq4Ij2y6W2g4hTX+pSdSg1Yzrh81N/N15do3FpcFbGL3hYxlCeAj3/ES8dATRWXr6nmKt8xnLV6PE6FXODeS4mipt1+Hpx33lWiNovvliLQSDaPdt4jT7QupoKU3FoM/RbV5//MgjK+/hd+qP28hWQesXBS+U0Q8COo5uLJHSKYwvjOcafOflghGS2xZ3BB/LlYfwc/yS1+mH3NmO+ZyN++GDAW4kQRfKC20nOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(396003)(346002)(366004)(478600001)(66946007)(8936002)(5660300002)(66556008)(85182001)(6666004)(186003)(66476007)(6496006)(2906002)(54906003)(4326008)(38100700002)(956004)(8676002)(4744005)(316002)(6486002)(6916009)(86362001)(26005)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHQ2OEl2eXo4cmI5NlN2K25SK21LQXRLZ2JuNzk1bWhTVFF4eS9WWlpmRllw?=
 =?utf-8?B?RTlmL2w0aDVvOG1GR0c0K0pDNHNpbkkxWTNaOTY4bk9aMDBmV3VPQ05WWGp4?=
 =?utf-8?B?TFJ6WEJnaXRUS3BkRUk2RURkN2dLdDR4bUx1ZzZRSmhoMkJJNU1xNDFPWDlW?=
 =?utf-8?B?Nm9Pa1VxV3hibVJJQllqdWpaWFU1SjU3dTduVTBnbEpaUTR0LzFNMXg0bVUx?=
 =?utf-8?B?ZUs4ckZ6N1lYR3hyL3R4anNnckhCWFJER0FuV0V2cUFaa0dLeDlUVXhZVTJp?=
 =?utf-8?B?MVQrVVRMUGcrQk8rSXV3N3ZzRWh6M3FKYkw4QnQzdlBwTkFLd21INzlCWVNz?=
 =?utf-8?B?VGd5SzRQelhIekdsZ0phQjV0WDdGTG9KZW9lc1dQaHZidWRCdWJWdU03dkVV?=
 =?utf-8?B?akJuUEd5SkxpYjNmUncxckR0ZUwzRlR1TjNaTjVyRXBiZVB3cnZRSTdTVnp6?=
 =?utf-8?B?K2gvNlpibllOenY5UWJIM2R0OC9UUW5YWDlHa0M0V0JHem9VQ0lNaEpRWDUr?=
 =?utf-8?B?K1lVWS9WNzhpV280ZUFKTFM3K1JWSFZudE9UalhaYk9QMW1yYjB2NUd2VmVQ?=
 =?utf-8?B?eUpKeGxLVGlvNythVHhMRHB0UGowVWxCSXhQb0dVOFFLdkhrNURWU256dFc5?=
 =?utf-8?B?SGJDSnN4RFVRYkhWMUdIUVFiOUlISzhkTFFOVnJuazRKMGhIT280M2g0cmRy?=
 =?utf-8?B?OVF6aWxWOGFUaFRLZTgycHFlS0hOTExXWWdwZk85MGFSMmlOZk54aVA2ZGFX?=
 =?utf-8?B?dGlDM1NTYUpCQ1ZLeEtiNndPL0szNUdJTlJQQ0pmbTZnczJqNHNHSG9QdEhS?=
 =?utf-8?B?MTg5b2lBN1ZxS0xhcmZ5Qi9McWtKQnFkV0ZNejBIMjJiNDRwRlo3QmVjTkJU?=
 =?utf-8?B?ZWFqRElYMU94NVIybGpMSXJ0ZktjTGp4UDV2QWQ3ZlhUdCt4dHZRNFA3OGNr?=
 =?utf-8?B?UVRTdmF1RGJDa1cvd3RaT2JPSlFFS01IQ3dMUTZkTEYyeWVvWnp4cEVRdDJM?=
 =?utf-8?B?aGd1eERCV2U3OGlpenM0MitFQmEvMlRlNm5XSTNBN3ZQL29sWXhWZTQrWVJG?=
 =?utf-8?B?YW5YL3RrdS9uUFppcHIwS05lNVZUV2xZWFZiQldUZ1MyM2pXK0NiTlBUdzVr?=
 =?utf-8?B?TXZuY3huaUp5N0lpVW9iNUxIb3B4b0l5cTVRUmZFaFFxcS9aeTRsN2tNMkM2?=
 =?utf-8?B?Sk1xbGZhWTZGUHBqTXE4ZUtSeEJ0M0taVDdsbTR4MnpzTjllNGZSNHRteTVP?=
 =?utf-8?B?bUluWEY4VTJsZWp6MWlwWFYwUHdSRXoxcEIrZnpQdnd0Z3BTR3hjQjNNS0Nh?=
 =?utf-8?B?aytZcXhKME94bnl1QS9KVHh1Tll5QzFlTm9PYUZtalZENjhnbzFLcE1JcUIy?=
 =?utf-8?B?dm5QTlVsajk4U0pTckFESWZrWXNYUk93dXY4TFZQelJPdDdrSjgwaEVYc09M?=
 =?utf-8?B?RDlKNW5lNEVPU1hDWlBuMEkrVkRhQWp1dlZRRHh3Wm95aGVkeDBFS1AzdlRJ?=
 =?utf-8?B?UFNPSjZnNzJxdjVnM2IrNzV2YXNDSHFXbnlWemtkVU5sZ05KaTdsbFRKWWxv?=
 =?utf-8?B?SUlZOFh0aUtKaGxmQkorWnFCMnlybEIrRm5zZktibmVneldQS2VqNWhQWXgx?=
 =?utf-8?B?b05ZVEZTVFU0RHJ6MWZuNWdWQVBKcjFJNnhFMDdrWVdBN3BzVVRYYzBnb2VR?=
 =?utf-8?B?L3ExbFNMMjJJS3ZoeHY5TzhTWnZYWUhvYmFKdzZRaFdJcVY5Z04rWSt6VmZL?=
 =?utf-8?Q?4kxh4+lUEYU/skO4pFava6fKaOq++aQWzpX//FL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b85a7b8-a59f-410b-a536-08d976c1a78c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 14:20:36.2130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1fKqUc2anOV7swFgNW9+jjF1fN2zbh9Oj5dodV9XMhNRju6clIttmJT1SBsH/ZCrkslkkr+lj/pdw1CIn0qUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5065
X-OriginatorOrg: citrix.com

On Thu, Sep 09, 2021 at 04:35:49PM +0200, Jan Beulich wrote:
>  .PHONY: clean
>  clean::
> -	rm -f *.lds *.new boot/*.o boot/*~ boot/core boot/mkelf32
> +	rm -f ???.lds *.new .check.* boot/*.o boot/*~ boot/core boot/mkelf32

Forgot to mention in my previous reply, but what's the point of using
??? instead of just typing xen.lds?

AFAICT there are no other .lds artifacts, so doing a 3-letter .lds
wildcard seems weird.

Thanks, Roger.

