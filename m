Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3898848C417
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 13:36:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256618.440537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7cqi-0005SN-JH; Wed, 12 Jan 2022 12:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256618.440537; Wed, 12 Jan 2022 12:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7cqi-0005Q2-CB; Wed, 12 Jan 2022 12:35:32 +0000
Received: by outflank-mailman (input) for mailman id 256618;
 Wed, 12 Jan 2022 12:35:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dBVB=R4=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n7cqg-0005Pw-J8
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 12:35:30 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e04d8ac-73a4-11ec-9c70-5536b2d1e4e1;
 Wed, 12 Jan 2022 13:35:27 +0100 (CET)
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
X-Inumbo-ID: 1e04d8ac-73a4-11ec-9c70-5536b2d1e4e1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1641990927;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=VDMJ1zIcyHUHen2rOo8eLLLmdZbh7PPh/o9r3Pi6CNw=;
  b=aF8HnjUInPhzLRKIaiZl8msCB3jjlc9/4UxdHRiZQwU6MPyqrigIc3ZF
   Qt7EkhTYO8uiZ87HY9hwyu3T1RQ27UB7D1nL/k1KdYBFzFT1s/uPV6LUS
   GI+3vTTIk6GcMlut3P33VapS2lk5pXFusNsnG++CDzeRX2OUj1t1Tdsg3
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /1JR4a2TC0pDSYZaSVn2+Mgmpfs3yG0go8p1H4QU6LBKhnNDIHOFuYwp6+l6Q2NXoxa7PvkvHZ
 9ydAQXyBTTJUQ94ZhYVqJp1aBaoGl39I+DpQnXfGnsb06EiEde8OPDX6J/diZ3KPYvuhjz9JlN
 /OReVj/2/OQktGdGgaDJxLF8Gw3GuheJkZxmryHwBif7hck+XVgAScos30CRy7qz+z/GjcBz4H
 AooF4cL+wVph1NG8nKO4CgUdO+ZgYkzO4p0KCIx+HEnWdN49eOt0gkEawz44StqyrYoM1B+5j2
 m7Hty47iQeS5sK1QFpFbv5mL
X-SBRS: 5.2
X-MesageID: 61308182
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:NfLYd6gGaWvtJvn2MCzvlDp4X161qxYKZh0ujC45NGQN5FlHY01je
 htvX22COvvcMzaneI1wboXk80sDv5bXmtM1TVc9pCkxFn8b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tcx24Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0dv6CdTyYMIpaVwvk3TEcbCxBkA4RZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u35sWTa+OP
 aL1bxJIMz7ZQF59E24WK4wPouKnvln1eSZh/Qf9Sa0fvDGIkV0ZPKLWGMLcZ9iiVchT2EGCq
 Qru/W70HxUbP9y30iee/zSngeqntQrhRI8XI5ip+fdrjUO7y3QaDVsdUl7Tif69h02lUtRTM
 Xsd/CY0sLMy/0ymSNr6dxCgqXvCtRkZM/JKGu0n7EeWy6zb4y6QHG1CRTlEAPQsudUqXzUs2
 hmMlsnwGD10mLSPTDSW8bL8hTGvPSkYK0cSaClCShEKi/HzrYd2gh/RQ9JLFK+uksazCTz22
 yqNriU1m/MUl8Fj/6y98Uqd22r0jpfMRw8xoA7QWwqN8AR9Y4K0Yp2y3lLS5/1AMYWxQ0GIu
 T4PnM32xOcKAJKWnSqBWtIRDaqp7PaINj7bqVN3Fpxn/DOok1a4ZpxZ6jx6IEZvM+4HdCXvb
 UuVvhlejKK/J1PzM/UxOdjoTZ13k+6wTrwJS8w4cPIeaKRcci6i4Bo3P1O6wD6uiHk2r4ggb
 MLzndmXMV4WDqFuzTyTTugb0KM2yi1W+V4/VawX3Dz8j+PAOSf9paMtdQLXM7tntP/sTBD9r
 o4HX/Zm3SmzRwEXjsP/1YcIZW4HInEgbXwdg5wGL7XTSuaK9YxINhMw/V/DU9A090i2vr2Rl
 p1YZqO+4ACu7ZEgAV/bAk2PkJu1Af5CQYgHFSItJ020/HMofJyi6qwSH7NuI+V+pbY9k64sE
 KJUEyllPhipYm6Wk9j6RcOsxLGOiTzx3V7eV8ZbSGVXk2Fcq/zhpYa/I1qHGNgmBSurr8ouy
 4BMJSuAKafvsz9KVZ6MANr2lgvZlSFExIpaAhWUSvEOJhSE2NU6ekTZ065sS+lReEqr+9dv/
 1vMaT8Cu/L3qpM4mPGQw/jsQ3GBSbUuRyK33gDzsN6LCMUt1jHynt8bDrfZJGC1uaGd0PzKW
 Ni5BsrUaZUvtF1Lr5B9A/Bsy6c/7MHovLhU0kJvG3CjUrhhIuoIzqCu0ZYdu6tT6KVevAfqC
 EuD9sMDYeeCOd//EU5XLw0gN7zR2fYRkzjUzPI0PESlu3MnoOvZCR1fb0uWlShQDLppK4d5k
 +0vj9Ebtl6kgR0wP9fY0i0NrzaQLmYNWrkMv40BBNO5kRIiz1xPOMSOCiL/7JyVRc9LN00mf
 m2diKbY3uwOzUveaXsjU3PK2LMF15gJvRlLyn4EJkiIxYWZ1qNmgkUJ/G1uHApPzxhB3+ZiA
 URRNhV4dfeU4jNlpMlfRGTwSQtPMwKUpx7qwFwTmWyHE0TxDj7RLHcwMPqm9VwC9z4OZSBS+
 byVxTq3UTvue82tjCI+VVQ89q7mRN11sAbDhNqmD4KOGJxjOWjphaqnZGwprRr7AJxu2B2b9
 LcypOsgO7fmMSMworEgD9jI3LsdfxmIOWheTKwz56gOB2zdJGm/1DXmx5pdoS+RyygmKXOFN
 vE=
IronPort-HdrOrdr: A9a23:61Ev0a5p3TRvv1jaTgPXwSyBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc6AxwZJkh8erwXpVoZUmsiKKdgLNhR4tKOTOGhILGFvAG0WKP+UyFJ8S6zJ8g6U
 4CSdkONDSTNykDsS+S2mDReLxMsbr3kpxAx92utEuFJTsaFZ2IhD0JczpzfHcGIzWvUvECZe
 WhD4d81nGdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lIn5y6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXoIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6V9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfF39tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc8a+d
 FVfYHhDcttABCnhyizhBgs/DXsZAV+Iv6+eDlChiTPuAIm2UyQzCMjtbsidzk7hdYAoqJ/lp
 f525JT5cVzp/8tHNJA7dg6MLmK40z2MFvx2TGpUBza/J9uAQO5l3ew2sRz2N2X
X-IronPort-AV: E=Sophos;i="5.88,282,1635220800"; 
   d="scan'208";a="61308182"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UvzNR6MeB/eRU/ETRTtKEVvnbSTF3Ci56kunfiS2JweTub8NuqLYPeVTUaAOvwgqGAADFei8dCItqK1NX1PQKlMNuBRPf81RM/grQkVma2eHRbwgAUCYl7Fc6QWVlYd4TIwp7mkZv6DC3i+eG3499kXUD8hflLJo+ZKROssabYnptZj1tt3YfwN5AI3GiCRhMPIVTF8C1zebJ9PPRcF6fFCN0gIq2y+e62zNULudozv7cZI6IUZPYZsEbTeggP7VOVORbOJhshqvMaEx1sYb6IbuXCn9WatI250bfjG3cCmz5TXaFwLP+C1sTtZ08tOh1oNLx6dD2lnwTZNj/zFIJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/l0qq5D6M3CGfGZF/3xXMitwhOP01cIvv/ii/v/70fs=;
 b=CEDC4FF81BW6W9oYQ6/VWAISVMpS0wQKyx4dosVn85Nf3x8nFjWmXhIMQb+GDBSSBQhvTNoSLfnOSnkrmEgVlNXxvGShPRSDWbfWXzXzyakuX3nradjLBVLCvokqwmr7OE1Pszx5WVMbXXTqX6nvADbQH+lBdJRImpy6+33Ippqc+8l/jEqQuHjis9UzVAnZC1hl5IbgZp4Buv/E7wAhhA2HyiZUekb160YO8kZUoAkx8B0303NY9bJA7d/yJPfiobcTNscDLfgEE6Dijb8bB3VMWFuXXPReTcJ/XItbQxhoVHlyqZ4bhNfJ61q6ShNMDb9Uobx2z2HMEuDwTyaQLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/l0qq5D6M3CGfGZF/3xXMitwhOP01cIvv/ii/v/70fs=;
 b=C3ciZn9YU8U23YsIzVFpG9KgJMu6ohi+qwgdkBJqhl1mQXZKu7PZQOtBxc0qLs+CD6JsUy4zhSCCA2yP67yzZhL3AGcWiutSdaSFoIRJS2UvZqBzePYdyI264B8FU6OClr/I+zI7ZabWoTIqi5U3fA/GPtGoCnmlyREWBmo9ZjM=
Date: Wed, 12 Jan 2022 13:35:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <paul@xen.org>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Message-ID: <Yd7K+9fvnBz+WTXA@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211125110251.2877218-7-andr2000@gmail.com>
X-ClientProxiedBy: MRXP264CA0035.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::23) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c04acef-583f-4191-573e-08d9d5c7fc03
X-MS-TrafficTypeDiagnostic: SN6PR03MB3759:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB3759E3C13FB6626A5DAC0F868F529@SN6PR03MB3759.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OWED1qCCbJxvckwf4nDramIYCc6euQyRvKAmYR2A+N5bjh1DOUclyaC+eUeFNJQ3rh4uI3/h/YRF6o4BSqhj+cf6BhYOhhslanKTlUvG8bXOlFSvgzdt3gEMWVmN9lfkccILTbGHykUVPeMHxOtLcjZ8r6DNIPf28SEvcT0s5gk9E6xWKZojCh/vwp2ZbILWLaLZ5FUJYeQ3q6wB7wJiUqsXOtsiamj1+VI6Wh9Xc9StvLZNJ60B7wLbq6gYeFy/yiKxt2MnGzH6Iz9TPJu0vp4PCfSmKhzpBfGxQimNdkTnNdktcrYSE9GBHChzpHJkIdHXJ4g7un8ClVETppnBPL5rm41/WJ6qR0HTHQ8Lp9p9oVzKjFQJsgXGh/HlmRfEyrh0kuAFMtuyifC02vkg/LYhnpM5QRN5EeJ9IwF0kErTXl5uy96vOGN+XHcX4o9j96AEdyIt3WPdZxpyjLbOsF7nlWAnmSPMypq6hJXBxglA6+yIvGcqq4iKSAUYTScFIAFt7VnaySUyvykrUHn9Zx66JWQ6jdumM+LCwK4OsayrqnARvhMPDtPohJ+XncLgCCq0Edh6AEiz0eeysPMJP71lDdEyPFKITxHT61ZxJ0TnhS1pW59PHgQLQn7UZqEOrKfdnFMhW69zbDjCZyn9tw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(66476007)(8936002)(33716001)(2906002)(26005)(7416002)(6666004)(6916009)(66556008)(86362001)(508600001)(8676002)(9686003)(6512007)(6486002)(83380400001)(6506007)(66946007)(316002)(4326008)(85182001)(5660300002)(38100700002)(186003)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MldiM3lPRjlOYTh6R0F0VW80T0Z2RmRHUE1TUUJOWlFGd2UyRGp2QnR1Y1g2?=
 =?utf-8?B?NWtKOGV4eVRtQmUxQUM4QUdKVHN3UnZaOUV5VU1JUHpicVNWYzVGenN3b3Mx?=
 =?utf-8?B?SlVPeWhGTDE0ZFFpQ3dlSlFxa0o0ZUZqbTlvZERNZjQ5V1crSURqZzk0djBS?=
 =?utf-8?B?ZTl6bmlEdzhQOU1VT0p4V2g5ZlJ2MmJMZ0hLeHN1a3FCcks0SElKS0Y3T3hB?=
 =?utf-8?B?RFZCdCtMOUM1SDBJRDFvRWRjL1YvZ0FWOTNsc1I4ZXFNZGt3VzE5TnZ4WldL?=
 =?utf-8?B?U0E3V2xxbFBENWYxK2QySVJPRm91a3JOL0RKWkNlVlorTjZzQjAyN3JhVTE4?=
 =?utf-8?B?dFZsTDdBcjFLZHpDb2ZpK3Q4M21Uak5PeGRMYllyMWRpUEsxK2k3YXV3NlBZ?=
 =?utf-8?B?NTdLTm5lZ3pYZ1EyOFprUkdzMGNpUjFXa0pRckhHZE4xQWdlRks3Q3dxNng4?=
 =?utf-8?B?RnFCdzdMTXB1aEN1SFJXK08vTXdDMzQ2TGdTQ0tjN1M2S1BuSm0ra0RJUmY5?=
 =?utf-8?B?bFZmK21sejE0YzV2NXJTSXhCdU9tTUt1VVFUSllYZ21UcE50ek80S0Z1NWdt?=
 =?utf-8?B?azdZNGZraGVYSTZJOVh6YVhGcWtWRlV2UDhxQXRjekZRd0E5U3IyZzhlLzhB?=
 =?utf-8?B?NmpRUW9nSzJBVjJMTWZNNHhsYWUyMEt0Y1IyUERrWklFOVB5VDg1RDFIcUtt?=
 =?utf-8?B?MUF2T2lWME9BN2hIamN6VWZHdllYUTZEaWVmb1Y1R3R2Ujgxb3lUNE9LR3Zy?=
 =?utf-8?B?OEliQXJFL2ZyQ3cyd3BSZUtzZGNOU1RjSWJqQVNRY0JNY3FWSCt4Tnc4NjFm?=
 =?utf-8?B?eFRpRmJ1WlVRY0VscHl3TWU1WUtwYld6UzBqRVV1N2Q4c0dqbGFQZHc5Z05r?=
 =?utf-8?B?Vy91ZWovVHZ0TlAyeFBLRjV3OC9mNjdCU04vYmxBWjBZNkRDa3RkdFRmWXJk?=
 =?utf-8?B?REV6aU9OMXoweG1ZZXg2RnljSjRTV3VxRjRkTFlsZ0MyVU1qaWx4T3FEN0JK?=
 =?utf-8?B?dlJUQXRoczl2OHpwOU5ldU1vQ09VcjJpbGhrajBhN05KOEJ2OVpTV2lvSjUx?=
 =?utf-8?B?WUR4Q2Z5TUduaFpFRjBVQjZYcXNkbFBmNEtMTzdGanV5ekJkZ3ZZQjBzTHBy?=
 =?utf-8?B?b015WFhkeE1mL3RDY2FaUE9tK3lSQ2FiQUNRUHVPa3o5dy85Q2ptd2poMnlm?=
 =?utf-8?B?THY4R3BqL0FHeGlGcFZkK09tU216NnFwcndBKzIrM0k5WWVIVG9sZkhaaFFy?=
 =?utf-8?B?THF3ZDhwVXY4MjNtdFNiWHk5MTVwVTVPbDlnTkhwRm9kZ0V4NVRUZnZJKzAy?=
 =?utf-8?B?RS9MbSt0MmxPdENaTVRSNDd3WkpKNnBSUG5Hc3ZMd3NoMEtLaXJkbi95WFJF?=
 =?utf-8?B?RXRJRG5yTHlTcTIrcFZ4V1BxMG85eW40U3pza2ZUeTJNWnVOUm1LbHFuS3JD?=
 =?utf-8?B?eGxnZVR5bVFtRTIrZ1JlbnN2OWRSWEtiQk45bHhta2JXWGVkZm52TjFaa1B0?=
 =?utf-8?B?UWF5NTl6SG9lYmVKWWtMRWYvZmhvU1RxNUlrNjZLV2hXV0U2VzRabk5NQml6?=
 =?utf-8?B?dnVqb1ZYbHEyN2czaVc5SzhSRmoyVENrTmFvRzlSeDNUT0VtYVRuV1k5ZEdI?=
 =?utf-8?B?MDdMUVF2SjFWdmh0SHhIWWlSUUlicFlUWGtZQ3d2T0tqMXlraUhLeEwwTTQy?=
 =?utf-8?B?RFlFSDJERktHWHpXeWQvaGJjQTY0OE9XL3RIeEx6dFdXUytuZG9JSHJFQlJ4?=
 =?utf-8?B?MWpnbE4wSnU1T0dNNG92Y2RZajNBT01nKzdyQTg5cXNqWlg4L0lPbW9GamFT?=
 =?utf-8?B?MDhBUmUrbVpWd3FJd3NHWlFFQ0dIM2xOdFJ3aHdVUWp4VWdzSkhlRnlrRU9l?=
 =?utf-8?B?Z0xmWUZBMFhuUFNXMWpRQUttbTJUR3phQWJlYUZ1a2hPZnkxTmJFQWlMUmVh?=
 =?utf-8?B?RkV3ckZnK1NGSHhzZmJUMSt6TWNIS2kzLzI0OFJwRlhONTJWS01OWFhnTnFh?=
 =?utf-8?B?SkpGZlJnV1hDanpsaVdEWmRtRVlWVjc5TnU5cG9TNU1UazByU1g2eHFPSG5U?=
 =?utf-8?B?RENrazBsaWNaN1pNZnRKUVdQZTF4NG4rKzhTenBsU2l5aVJwTmFoT0RvckJZ?=
 =?utf-8?B?dkRUbUdLcmFrK0dGV1QyczVMZVJ3MkEyZFBxWVdEL0hUUGpJZ2pMU0I2ME9Q?=
 =?utf-8?Q?hOda1srcB7hHcqAuCOvbSl0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c04acef-583f-4191-573e-08d9d5c7fc03
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 12:35:15.5108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I/Geb3AcR2kwqgWJBXTuOgvlEj8HMOba48tSNeuGwywnKjzF9vmcaVurMEGcVVosYaCcOq+aAK/dAG/4P6eHCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3759
X-OriginatorOrg: citrix.com

On Thu, Nov 25, 2021 at 01:02:43PM +0200, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Add relevant vpci register handlers when assigning PCI device to a domain
> and remove those when de-assigning. This allows having different
> handlers for different domains, e.g. hwdom and other guests.
> 
> Emulate guest BAR register values: this allows creating a guest view
> of the registers and emulates size and properties probe as it is done
> during PCI device enumeration by the guest.
> 
> ROM BAR is only handled for the hardware domain and for guest domains
> there is a stub: at the moment PCI expansion ROM handling is supported
> for x86 only and it might not be used by other architectures without
> emulating x86. Other use-cases may include using that expansion ROM before
> Xen boots, hence no emulation is needed in Xen itself. Or when a guest
> wants to use the ROM code which seems to be rare.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Since v4:
> - updated commit message
> - s/guest_addr/guest_reg
> Since v3:
> - squashed two patches: dynamic add/remove handlers and guest BAR
>   handler implementation
> - fix guest BAR read of the high part of a 64bit BAR (Roger)
> - add error handling to vpci_assign_device
> - s/dom%pd/%pd
> - blank line before return
> Since v2:
> - remove unneeded ifdefs for CONFIG_HAS_VPCI_GUEST_SUPPORT as more code
>   has been eliminated from being built on x86
> Since v1:
>  - constify struct pci_dev where possible
>  - do not open code is_system_domain()
>  - simplify some code3. simplify
>  - use gdprintk + error code instead of gprintk
>  - gate vpci_bar_{add|remove}_handlers with CONFIG_HAS_VPCI_GUEST_SUPPORT,
>    so these do not get compiled for x86
>  - removed unneeded is_system_domain check
>  - re-work guest read/write to be much simpler and do more work on write
>    than read which is expected to be called more frequently
>  - removed one too obvious comment
> ---
>  xen/drivers/vpci/header.c | 72 +++++++++++++++++++++++++++++++++++----
>  xen/include/xen/vpci.h    |  3 ++
>  2 files changed, 69 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index ba333fb2f9b0..8880d34ebf8e 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -433,6 +433,48 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
>      pci_conf_write32(pdev->sbdf, reg, val);
>  }
>  
> +static void guest_bar_write(const struct pci_dev *pdev, unsigned int reg,
> +                            uint32_t val, void *data)
> +{
> +    struct vpci_bar *bar = data;
> +    bool hi = false;
> +
> +    if ( bar->type == VPCI_BAR_MEM64_HI )
> +    {
> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
> +        bar--;
> +        hi = true;
> +    }
> +    else
> +    {
> +        val &= PCI_BASE_ADDRESS_MEM_MASK;
> +        val |= bar->type == VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TYPE_32
> +                                           : PCI_BASE_ADDRESS_MEM_TYPE_64;
> +        val |= bar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
> +    }
> +
> +    bar->guest_reg &= ~(0xffffffffull << (hi ? 32 : 0));
> +    bar->guest_reg |= (uint64_t)val << (hi ? 32 : 0);
> +
> +    bar->guest_reg &= ~(bar->size - 1) | ~PCI_BASE_ADDRESS_MEM_MASK;
> +}
> +
> +static uint32_t guest_bar_read(const struct pci_dev *pdev, unsigned int reg,
> +                               void *data)
> +{
> +    const struct vpci_bar *bar = data;
> +    bool hi = false;
> +
> +    if ( bar->type == VPCI_BAR_MEM64_HI )
> +    {
> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
> +        bar--;
> +        hi = true;
> +    }
> +
> +    return bar->guest_reg >> (hi ? 32 : 0);
> +}
> +
>  static void rom_write(const struct pci_dev *pdev, unsigned int reg,
>                        uint32_t val, void *data)
>  {
> @@ -481,6 +523,17 @@ static void rom_write(const struct pci_dev *pdev, unsigned int reg,
>          rom->addr = val & PCI_ROM_ADDRESS_MASK;
>  }
>  
> +static void guest_rom_write(const struct pci_dev *pdev, unsigned int reg,
> +                            uint32_t val, void *data)
> +{
> +}
> +
> +static uint32_t guest_rom_read(const struct pci_dev *pdev, unsigned int reg,
> +                               void *data)
> +{
> +    return 0xffffffff;
> +}

There should be no need for those handlers. As said elsewhere: for
guests registers not explicitly handled should return ~0 for reads and
drop writes, which is what you are proposing here.

> +
>  static int init_bars(struct pci_dev *pdev)
>  {
>      uint16_t cmd;
> @@ -489,6 +542,7 @@ static int init_bars(struct pci_dev *pdev)
>      struct vpci_header *header = &pdev->vpci->header;
>      struct vpci_bar *bars = header->bars;
>      int rc;
> +    bool is_hwdom = is_hardware_domain(pdev->domain);
>  
>      switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
>      {
> @@ -528,8 +582,10 @@ static int init_bars(struct pci_dev *pdev)
>          if ( i && bars[i - 1].type == VPCI_BAR_MEM64_LO )
>          {
>              bars[i].type = VPCI_BAR_MEM64_HI;
> -            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg,
> -                                   4, &bars[i]);
> +            rc = vpci_add_register(pdev->vpci,
> +                                   is_hwdom ? vpci_hw_read32 : guest_bar_read,
> +                                   is_hwdom ? bar_write : guest_bar_write,
> +                                   reg, 4, &bars[i]);
>              if ( rc )
>              {
>                  pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> @@ -569,8 +625,10 @@ static int init_bars(struct pci_dev *pdev)
>          bars[i].size = size;
>          bars[i].prefetchable = val & PCI_BASE_ADDRESS_MEM_PREFETCH;
>  
> -        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg, 4,
> -                               &bars[i]);
> +        rc = vpci_add_register(pdev->vpci,
> +                               is_hwdom ? vpci_hw_read32 : guest_bar_read,
> +                               is_hwdom ? bar_write : guest_bar_write,
> +                               reg, 4, &bars[i]);
>          if ( rc )
>          {
>              pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> @@ -590,8 +648,10 @@ static int init_bars(struct pci_dev *pdev)
>          header->rom_enabled = pci_conf_read32(pdev->sbdf, rom_reg) &
>                                PCI_ROM_ADDRESS_ENABLE;
>  
> -        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write, rom_reg,
> -                               4, rom);
> +        rc = vpci_add_register(pdev->vpci,
> +                               is_hwdom ? vpci_hw_read32 : guest_rom_read,
> +                               is_hwdom ? rom_write : guest_rom_write,
> +                               rom_reg, 4, rom);

This whole call should be made conditional to is_hwdom, as said above
there's no need for the guest_rom handlers.

Likewise I assume you expect IO BARs to simply return ~0 and drop
writes, as there's no explicit handler added for those?

>          if ( rc )
>              rom->type = VPCI_BAR_EMPTY;
>      }
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index ed127a08a953..0a73b14a92dc 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -68,7 +68,10 @@ struct vpci {
>      struct vpci_header {
>          /* Information about the PCI BARs of this device. */
>          struct vpci_bar {
> +            /* Physical view of the BAR. */

No, that's not the physical view, it's the physical (host) address.

>              uint64_t addr;
> +            /* Guest view of the BAR: address and lower bits. */
> +            uint64_t guest_reg;

I continue to think it would be clearer if you store the guest address
here (gaddr, without the low bits) and add those in guest_bar_read
based on bar->{type,prefetchable}. Then it would be equivalent to the
existing 'addr' field.

I wonder whether we need to protect the added code with
CONFIG_HAS_VPCI_GUEST_SUPPORT, this would effectively be dead code
otherwise. Long term I don't think we wish to differentiate between
dom0 and domU vPCI support at build time, so I'm unsure whether it's
helpful to pollute the code with CONFIG_HAS_VPCI_GUEST_SUPPORT when
the plan is to remove those long term.

Thanks, Roger.

