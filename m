Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1836349C860
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 12:14:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260809.450912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCgF4-0000yW-Ea; Wed, 26 Jan 2022 11:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260809.450912; Wed, 26 Jan 2022 11:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCgF4-0000vd-Ar; Wed, 26 Jan 2022 11:13:34 +0000
Received: by outflank-mailman (input) for mailman id 260809;
 Wed, 26 Jan 2022 11:13:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8h68=SK=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nCgF2-0000vX-3S
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 11:13:32 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcecbcfb-7e98-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 12:13:30 +0100 (CET)
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
X-Inumbo-ID: fcecbcfb-7e98-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643195609;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=H9rhxnYjHYblKwYhaBHI8y1mlD5Jugb9N2BXEwUoDqY=;
  b=NBVY5F5FXrJ/D6lc9Hix3OiHXBA3ZWasrWBzj/A96sQfisBafwNcPhBK
   RyuM6rAjsl/WrgxOORYmqBOnxyLi6F+SSXwkSbSUtOTIzGaFu11o1j6hX
   pi5KnxUgt4ulOH5Ql7rdzCGM797qsD7bAdZ9kE+NErzeGB64uxRfkePkd
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1xFPp3EH0kWiukIy4OviummUkCdahCThLxtHfBOpIzHNYZcPTLqjQFlDDnAj9DAOKmQs6NL8C9
 fNgWWUxtIziCUB7w+r6TlKR9i6XAqYqllAi7uWB2tMe4Tpsm5RnaMpuOiG35LipMUBGAKnejvd
 4MYkbu57Nf2R/Lf5e2bt0XFqznymlBntd+9kqwLlfWJ1n0JLgQGEhoSijKMXjnjQeZXjuo0Eo8
 glSZ/ez17HfMC5Purx+QNklz0NPF7kQ5bS+KrZLiwO1/avNueDUIbRed/FzqkKQ9CMAKSu/UhS
 a2yCokJ7rn2UYgtzS5Bs5eNr
X-SBRS: 5.2
X-MesageID: 62789622
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yj/Mn63MQyihAg3c+PbD5ed3kn2cJEfYwER7XKvMYLTBsI5bp2cGz
 WJNUGzQaPqLYTT8KtpwboXg908BvMTRz9E1TQI5pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o6wbBh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhgdsr4
 owKts2MEAYzErbzt88zVB1YHHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6Diu4UHjGZu3Jom8fD2W
 uo7d2piNgn6REdsJgcsVrdml+HwiSyqG9FfgA3M/vdmi4TJ9yRYyqTgNe3wa9ODRMhLtkuAr
 2eA9GP8ajkkM9iYxSuA42ibrObFliPmW6ofDLS9sPVthTW73mUODDUGWF39puO24makUtJCL
 woP+ywhrYA77kntRd74NzWyrWSYpBcaV5xVGvcj9QCW4qPO5kCSAW1sZhlFZd89vck6XwsWx
 0SJlNPkAz9omLCNQHfb/bCRxRuwMyUIKW4JZQcfUBAIpdLkpekbqRbCTc1qFqKvufTzFSvt2
 DCBrCU4hLI7gNYC0uOw+lWvqyKhoN3FQxA44i3TX3m59UVpaYi9fYuq5FPHq/FaI+6xVUKdt
 XIJn8yf6uEmDpyXkiGJBuIXE9mB5euBMTDaqU5iGd8m7TvFxpK4VdkOunckfh4va5taP2+yC
 KPOhe9PzIFYZlHzKqwmX9uwEegx8ofLO9PhVv+BO7KifaNNXAOA+ShvY2uZ0GbsjFUgnMkDB
 HuLTSq/JS1EUPo6lVJaU89YiOZ2nX5mmQs/ULiml0zP7FaIWJKCpV7p2nOqZ/tx0q6LqR69H
 z13Z5rTkEU3vAETj0DqHW8vwbIicSlT6XPe8ZU/mgu/zuxOQjBJ5xj5mutJRmCdt/4J/tokB
 1nkMqOi9HLxhGfcNSKBYW15ZbXkUP5X9CxnZnV3YAj0hyVzPu5DCZvzkbNtLNHLE8Q4lZZJo
 wQtIZ3cUpyjtByak9jiUXUNhNM7L0n67e5/FyGkfCI+b/Zdq//hobfZkv/U3HBWVEKf7JJmy
 5X5j1+zacddG2xKUZiHANrynwLZlSVMw4paAhqXSuS/jW2xquCG3QSr0K9uSyzNQD2erganO
 /G+WEdB+rKV8tZrqbEkR8ms9u+ULge3JWIDd0Hz5reqLyjKuG2lxI5LSuGTej7BEmjz/c2fi
 S99lpkQ6dULwwRHtZRSCbFuwf5s7tfjveYCnA9lAG/KfxKgDbY5eiuK2sxGt6tswL5FuFTpB
 hLTq4cCYbjZatn4FFMxJRY+arjR3/8jhTSPv+8+J1/35XEr8ePfA1lSJRSFlAdUMKBxbNE+2
 e4ktcNPs16/hxMmP8yolCdR82jQfHUMX79+7sMRAZPxixptwVZHOMSOBijz6ZCJStNNLkh1f
 WPE2Puc3+xRnxOQfWAyGH7B2ftmqa4P4B0ankUfI1mpm8begqNl1hNm7jlqHB9eyQ9K0rwvN
 zEzZVF1P6iH4xxhmNNHAzK3AwhECRCUph7xxl8OmDGLRkWkTDWQfmg0OOLL90EF6WNMODNc+
 ejAmmriVD/reuD33zczBhE5+6CyE4Qp+12Qgt2jEuSEA4I+MGjsjaKZbGYVrwfqXJEqj0rdq
 Og2pOt9ZMUX78LLT3HX32VC6YktdQ==
IronPort-HdrOrdr: A9a23:Q4CcbauL0qylrQ9U3ACfnvZo7skC7oMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLj2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzI4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kHEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 PxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72OeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl9Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlblrmGuhHjDkV1RUsZ+RtixZJGbFfqFCgL3Y79FupgE586NCr/Zv20vp9/oGOu55Dq
 r/Q+BVfYp1P7wrhJRGdZM8qPuMexzwqC33QRCvyHTcZeg60iH22tbKCItc3pDeRHVP9up0pK
 j8
X-IronPort-AV: E=Sophos;i="5.88,317,1635220800"; 
   d="scan'208";a="62789622"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S4L+8AW3RQzBZCkEBln+yM/JRzWfQxtmD8zV1a0NLiUWou82txA9V8iqrtUBprNV2UCKLX4sTY7VzOdxAucegMmJW6j5jIagHmDMDSUGHbRfhe6z1zTHyrgvmqHpKw4tNLYA4CBsOWzuDcs7lscBUHRFcWQuKQwt2dOIarC0HARvUZN7La2+m7NXqSQ4l7KKM5cRTj4zdK9Y86pJFBERkiVce9+m5MCkXXh+Fdw0srP0DTA7yUQtTnyBiLtjTcDpDEAJkZneACxX93v/FU14L5LX1rbbgKaaSttvfkINlhhHXwcZAcKFaJEWcEsDYuQb4VH23sn9MdJRvRbgBlHllQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NX03lr0AxXyxB81rw2UgGEiN02nL+aX5LRQzc8eG9w=;
 b=cs+cM92uNp9oEueLCsf6v30poTi0PSAMy7eulDn7P2Yk6MblA405dCka7+FNR/w/GBZgdR4w64l+9l4bbyXOVfOYnOzJdWnhICVobDYzs6jDHjXY5M4iCI8e5A0aLCN/Slgus5SwPRtS236iui2xPZw6DA3VQ+ZvP+u3xdwNZOAm856tzumZwfjQb5pFc95JPMGmxAPU+5kieA+JHHmfli7eAH2xBgthGiZB2/dYF5vHhgsYinqvioTl5e8+MDaS5O1Miq23CYXwM+RoVCPwbeLUYqYxJ8o72SWMv3hpVNsUU85fS46YDj04VQspQqLeBjXkm2tJRBacSlAvK8/0aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NX03lr0AxXyxB81rw2UgGEiN02nL+aX5LRQzc8eG9w=;
 b=u1qnUpBYXeg8N08/mzGJxDssiAZoFJ8Ky/fE14bQK4GNy+9fTYBNgofs2O+z7pO8WFwRTfTIM9cUq5b10/NifR2FG5Cfj+I5HLglmx+JdtEd57juwn2XoxFiLwfl1Wdt/VrT5hUVB9LHGxow1PISHZ/Vn21TkKwfj6zOPsvLXbw=
Date: Wed, 26 Jan 2022 12:13:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "paul@xen.org"
	<paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: [PATCH v5 03/14] vpci: move lock outside of struct vpci
Message-ID: <YfEszsdqeDkWT3ja@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-4-andr2000@gmail.com> <Yd2ffPULbmNpSmaD@Air-de-Roger>
 <d738229b-11ed-db77-f313-5f1618ed95a1@suse.com>
 <5f00c94d-069d-ea5f-aa1b-1861fe8a7cef@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f00c94d-069d-ea5f-aa1b-1861fe8a7cef@epam.com>
X-ClientProxiedBy: MR2P264CA0024.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca11f7f2-8e2c-496d-f710-08d9e0bcde9d
X-MS-TrafficTypeDiagnostic: BN8PR03MB4721:EE_
X-Microsoft-Antispam-PRVS: <BN8PR03MB4721CE26D613A881586EA9A88F209@BN8PR03MB4721.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yG4dyN7W9sel2ktYL1oh6aJUZPVqZ+OTQUeH607wU5wwPGbgTLN4dQVnO1Cf7gr+6Y6E9n1v/4Wznv1uk2w7JpcRQ4dFcj40CAm4/6ZBPIk8t74rdDnP3sDxKnX0aI88bIplpJDGVWEKVjJoa+++rPhiveTDE8yNjAYohHd61pcZOAebH2cN8z6cubXxSsnuXtsxriS/3t8Qrxf0puXd7MKxKh4FecbDejepWSZjiiUtM/E5yvk22BtY07t0VuaSLTFZNOXCQdY95amoYMf7f4MTT5lYlRn5BDAvUqNwLcll6b6qrmqjrgpkZU+PD/xpxLhgBkWxZQnpo50A28pv0wx6l2Wg3ex4stmt1OPq4By/lIeb/dnv2Mw+H7cb5J0CPDYTJ+wfvzRUTnDMlyofq4rtztdPQZHzA62Yorw5+FAtnGLd9J0d0r6oDQkI+oehJs/G5NDY1h4wi0/8cOiQzrc94szQvf1rNqL/gPw9oU2+g5FQijPoAhSSISdRT3gSQgs4QaOPuyddWKcJbTqIvzWoplIvZtmuOrseql6/aMhXOMMHm5ChEod1KXHTKv2aeX0Qb3rHCf1QykRz3JkKTJ/vt7RnUGn1B6BsY29ci+IjehwWBJ/B8663MkxIpH3Q9boZKjrGBNsrrtQCBZ0COQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6666004)(6512007)(6506007)(7416002)(53546011)(86362001)(9686003)(4326008)(5660300002)(82960400001)(107886003)(2906002)(33716001)(38100700002)(8676002)(8936002)(6916009)(6486002)(85182001)(83380400001)(508600001)(54906003)(66946007)(186003)(26005)(316002)(66476007)(66556008)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnpPS3dKeE0rUjRyUmpCUWpFaytMK3UvVVhxR0k0Snplb2pVSUx3N3k5dUMz?=
 =?utf-8?B?bzRoWHRybmZXWWpudU1MM215d2F2OUJ4TFk3dEpyUGRSWHVHWXYzYmJhZWFZ?=
 =?utf-8?B?eGsyWVMwdlBlbkFxRjZ5N21Cc3RWN3Q1blpYdFd6RFJuUTNpZkRRcWpXRGl0?=
 =?utf-8?B?M3JxZ2F3WkxhMnRyaTlmYldqR0g0K0ZxTEVmclplODFsQUlHM3VOcEpZeW1l?=
 =?utf-8?B?SzdCZnlXM0x5cXp2b0xvb3FmNUpDcjRqYVYxTkN1QldPTStDZGpCVU9Pc21n?=
 =?utf-8?B?U2ROTGJUQU00eW5pRC8yMmxTWDNrRlpjR2JBMFM3MlVQRlNTYm56dHZ0LzBp?=
 =?utf-8?B?YVNpYytJNEVEUkVnVGdhemZMbVZ6cE5hZGdUZlJzcDdqTGRYRGtHY1dhTVlD?=
 =?utf-8?B?QVBHeHdvZ2c0WnU3ZzJWVVVpc1NjZWZJSUN6L0FHWWJiSmNua293VThwcWN3?=
 =?utf-8?B?R1hxQXNMWTUrbjNXWjRadmcvNUtWa0VFMTcvcUVpWTM5dTVoMmJTUURkR2dl?=
 =?utf-8?B?WGhWQjQ2OWEwazNNOFBHMy9RcS9lajhxTHh2ZEMrclpVWDhYQXlhVFVEZyt5?=
 =?utf-8?B?ek1NcTNMTnBpM0owbGZsUDdsN2lHQ2Y4cmxkUzRRcTF4dCt4bTgvaS9zNkV3?=
 =?utf-8?B?UCtZSTBaVUp0LzJ6Njg2eG1zTDF4MkZSaWVaaEl0bmIwdkJLV0xXOFFxWkkr?=
 =?utf-8?B?MEZwdlV3Z2J2ZVBJTDRKaS9SVFRBNXZTN1JNRjhpam9FUW1xQzI5dFhzajhJ?=
 =?utf-8?B?WWdJTm9wbHRHandjbGN2emU1Um9sY2JLWUxxOHl2eExiQ1lkblNPMStGL1Bl?=
 =?utf-8?B?T1I0UG5uZ0pCZkdnR3RFVytLRENWQ01LNlAzZnhqZTlQTU1pbUFPVytjdHZM?=
 =?utf-8?B?N25qZkM3T3Vhb1Jud1p1elk4QzJQTTdCN3pidmhmRmV2U00wUnZ2VitjbmNm?=
 =?utf-8?B?d3VRVENWUVd2TnhkWGVpRkxLMG5GSWU0N2VYakdJRHpSVTZRK0REOStvTHZz?=
 =?utf-8?B?WlpiQkd5dDMweHpwY0EzSDN6eUZHbTUvcFBPM3dwaFNLTllubG1RbWdKRHBt?=
 =?utf-8?B?bk1tdldWUCtGSkNHUS92Wnh0VHA2R2dkZDFxQUJJeFRCaiszYjNGNUNsMmdB?=
 =?utf-8?B?MWxXSHUwdFd1aGppV0lJOU8rbjIzdFhLdHhSeE9JdEorVGRNSmZReFRHaEYz?=
 =?utf-8?B?OVZLLys1ZlREVUMwVkdXK2NNb2xxNXZXTGJxMVpsRTBVWVFLeENoampYdnlX?=
 =?utf-8?B?c0VFeVp3cFQ5WFQ1RGk1VUhpVTM3QkV3bUo1TVNucm52bFRzdHFBUXhDZDB0?=
 =?utf-8?B?cTJnWkYyWVJBMTVsK29ZcjZyelpwSytvNWpkbGVKMEpMVDA3TmMzR3NtUVJ2?=
 =?utf-8?B?WllIYmd3ekxRM2JnN0ZpYjBmR3pVUzI4c0JtbU9LRUNIYmhIcS9qeENsd2hH?=
 =?utf-8?B?ckVnWTN0bVpudGNkL2lkOHpyM3AweFl2cmxWYVJRM2RCWGNFeFZLZ0Zmc3Ix?=
 =?utf-8?B?eW80TytFTnF5UHJpVVppdUdLS3RBYi93U3RaOGsyTUhVKzcvV1VMbnlWbGpV?=
 =?utf-8?B?cU9wL0NCLzVrcU9veEQ1cTZpK3p4VEc0Tk5PTlUxcHNkVXVsZ2p1MUlJNVN2?=
 =?utf-8?B?SmxxS210dDdPbzNIdVpWR3pQTnBZd0EzaUJKMVV5Qk1HVzdHM1lVeEJqTGQ2?=
 =?utf-8?B?eEtNSGYxNXl3a3FndExJc3N2R1ZyUXhiK1FDeGNWOVp6RW1uSGk3Zndlblpw?=
 =?utf-8?B?ZnFYMXdUTTAvSkwxUytLRnYvOXRKZ1hNaTJRejM1S2R0cEd5bUQ1ZTYwNlFV?=
 =?utf-8?B?VHJUQnR2TVlITUVac1loWHZSQXRKUkM5ZVphbU1BL3IvQytlcTlpYU9obDFm?=
 =?utf-8?B?TmIzVWlrcXBLVU5ETndVREFyR1JEUGszeDdhbkJDY0FCUGxKeFUvYnJuRzkv?=
 =?utf-8?B?YXJUelNMaG1pK3A2Q0lRZFYyWUtnTCtDK3VjMWFudmMvTDJJR3dvVnowWUpR?=
 =?utf-8?B?TVFtMHRqbzIxSjdBcFp2OEhZVWdkQ2x3eTVuVFFoMTV6b1hWV0JSeDMrVG1Y?=
 =?utf-8?B?eWx1UXQrdTJrMW5zem5HN3dUZE1pWnBGUmxxK0Z2U3pzV1M4L09XRWY1NW1l?=
 =?utf-8?B?VzB0SzhlZ2Uvb1hackRBellOSWlwK2NPOVJqbVMyM29Xdml4VWtOZkczeGVC?=
 =?utf-8?Q?W5gWFfPOO1m9Y/9JKG1cuQo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca11f7f2-8e2c-496d-f710-08d9e0bcde9d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 11:13:24.6284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lD0HANiesl/mPiBF6m4awbfmLjetl2wiLfIwpIVNrgbSShlhZGc/gaADUj21ZmEKAs7I+8PEdghs2HyWs6gASg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4721
X-OriginatorOrg: citrix.com

On Wed, Jan 26, 2022 at 08:40:09AM +0000, Oleksandr Andrushchenko wrote:
> Hello, Roger, Jan!
> 
> On 12.01.22 16:42, Jan Beulich wrote:
> > On 11.01.2022 16:17, Roger Pau Monné wrote:
> >> On Thu, Nov 25, 2021 at 01:02:40PM +0200, Oleksandr Andrushchenko wrote:
> >>> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> >>> index 657697fe3406..ceaac4516ff8 100644
> >>> --- a/xen/drivers/vpci/vpci.c
> >>> +++ b/xen/drivers/vpci/vpci.c
> >>> @@ -35,12 +35,10 @@ extern vpci_register_init_t *const __start_vpci_array[];
> >>>   extern vpci_register_init_t *const __end_vpci_array[];
> >>>   #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
> >>>   
> >>> -void vpci_remove_device(struct pci_dev *pdev)
> >>> +static void vpci_remove_device_handlers_locked(struct pci_dev *pdev)
> >>>   {
> >>> -    if ( !has_vpci(pdev->domain) )
> >>> -        return;
> >>> +    ASSERT(spin_is_locked(&pdev->vpci_lock));
> >>>   
> >>> -    spin_lock(&pdev->vpci->lock);
> >>>       while ( !list_empty(&pdev->vpci->handlers) )
> >>>       {
> >>>           struct vpci_register *r = list_first_entry(&pdev->vpci->handlers,
> >>> @@ -50,15 +48,33 @@ void vpci_remove_device(struct pci_dev *pdev)
> >>>           list_del(&r->node);
> >>>           xfree(r);
> >>>       }
> >>> -    spin_unlock(&pdev->vpci->lock);
> >>> +}
> >>> +
> >>> +void vpci_remove_device_locked(struct pci_dev *pdev)
> >> I think this could be static instead, as it's only used by
> >> vpci_remove_device and vpci_add_handlers which are local to the
> >> file.
> This is going to be used outside later on while processing pending mappings,
> so I think it is not worth it defining it static here and then removing the static
> key word later on: please see [PATCH v5 04/14] vpci: cancel pending map/unmap on vpci removal [1]

I have some comments there also, which might change the approach
you are using.

> > Does the splitting out of vpci_remove_device_handlers_locked() belong in
> > this patch in the first place? There's no second caller being added, so
> > this looks to be an orthogonal adjustment.
> I think of it as a preparation for the upcoming code: although the reason for the
> change might not be immediately seen in this patch it is still in line with what
> happens next.

Right - it's generally best if the change is done together as the new
callers are added. Otherwise it's hard to understand why certain changes
are made, and you will likely get asked the same question on next
rounds.

It's also possible that the code that requires this is changed in
further iterations so there's no longer a need for the splitting.

Thanks, Roger.

