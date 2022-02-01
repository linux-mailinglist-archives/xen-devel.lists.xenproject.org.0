Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAF24A59EC
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 11:24:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263479.456179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEqKO-00039m-Lf; Tue, 01 Feb 2022 10:24:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263479.456179; Tue, 01 Feb 2022 10:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEqKO-00037Q-IT; Tue, 01 Feb 2022 10:24:00 +0000
Received: by outflank-mailman (input) for mailman id 263479;
 Tue, 01 Feb 2022 10:23:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JAuK=SQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nEqKN-00037K-NQ
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 10:23:59 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fb997f5-8349-11ec-8f75-fffcc8bd4f1a;
 Tue, 01 Feb 2022 11:23:57 +0100 (CET)
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
X-Inumbo-ID: 0fb997f5-8349-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643711037;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=waRVfAc7vidf2MNXlwI1vsYzkwpyFo1xPqibtbJgOu0=;
  b=BtX6t0ACwqNy8b5LIeqmXjRm7ZTSJY7+99pSdlUMKwfFCik3QjzY4TlT
   Ctz5qqLupzehOMoNr/iSqu/DPj6Vg6V83D1j0PTmlQR4N1pdcyuuCa8Bm
   hNpz443jA1P2SqP8qM5C0tXEaEg5S1gdcTtyg/9bA2zLeg9rM/li+5V4M
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vVc4Uv59KrjVwq98irhOKRHGp3JjtRgyjxJJokmtOKIazOS2JHbqw6zXp9qx9F4dh9Srzi8dBS
 AKMdx88DRt7eDVXdklEDtrQEnL9CnC99tJPWSRooEA6hZqeoLM/dUW5hgn9gXdaZe8qUiyaXN+
 HKEOeWovXr7KTW2PxFKel5QVmIKpI6g85minSPNFTfjTuDbTRx28eM9BuZntU98dFV2g2nrTGP
 rBqgpXJUHCE2aVJxBuVpaiQZURdkmre31KHXnYIfDdAhJgZnWEExDISeOoBjdWyOfj1dDISIkS
 Z5i27vEU1VDgO/Tqx4DT4GUX
X-SBRS: 5.2
X-MesageID: 65388474
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:nrrY5627PuDK6CB/UPbD5ed3kn2cJEfYwER7XKvMYLTBsI5bp2ADz
 mAeWW+AafveYzH0e4wiO96w9h5UsMLUy9VhQAVvpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5w7dh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhsNdK+
 OtCmsKKdSQiYaP+qs8HQQdaHHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6Diu4IDjGds2Zwm8fD2S
 O42MRRDMA38TiIVY0tJEslgk+uYryyqG9FfgA3M/vdmi4TJ9yRz2rXwNNveevSRWN5Y2E2fo
 wru1n7lDxQtEc2QwDuI7FqhnubK2yj8Xeo6DLSl8tZ6jVvVwXYcYDUMXFumpb+ii0ixW/pWM
 UlS8S0rxYA4+Va3VND7U1u9qWSdox8Hc9NKFqsx7wTl4pTT5wGVF20VVAlrYdYttNI1bTEy3
 1rPlNTsbRR/vbvQRX+D+7O8qTKpJTNTPWIEfTUDTwYO/5/kuo5bpjXLQ9V4Gai5lOrcHz3q3
 iuKpygzgbYUpcMT3qD99lfC6xquu5zIQwgd9gjRGGW/4WtRQ4qoZJeh71TB2spRN4aSTlSHv
 38sltCX6aYFCpTlvDeWXOwHEbWt5vCEGD7Rm1hiG98m7TvFxpK4VdkOunckfh4va5taP2+yC
 KPOhe9PzLBUB0uUYoApWb6SAJsk/5rLD8b7VP+BO7KifaNNXAOA+ShvY2uZ0GbsjFUgnMkDB
 HuLTSq/JS1EUPo6lVJaU89YiOZ2nX5mmQs/ULiml0zP7FaIWJKCpV7p2nOqZ/tx0q6LqR69H
 z13Z5rTkEU3vAETj0DqHW8vwbIicCJT6XPe8ZU/mgu/zuxOQjtJ5xj5mutJRmCdt/4J/tokB
 1nkMqOi9HLxhGfcNSKBYW15ZbXkUP5X9CxnZnF8Yg74hSl/MO5DCZvzkbNtJ9HLE8Q4lZZJo
 wQtIZ3cUpyjtByak9jiUXUNhNM7L0n67e5/FyGkfCI+b/Zdq//hobfZkv/U3HBWVEKf7JJmy
 5X5j1+zacddG2xKUZiHANrynwLZlSVMw4paAhqXSuS/jW2xquCG3QSr0K9uSyzNQD2erganO
 /G+WElA/beV/95qobEkR8ms9u+ULge3JWIDd0Hz5reqLyjKuG2lxI5LSuGTej7BEmjz/c2fi
 S99lpkQ6dULwwRHtZRSCbFuwf5s7tfjveYCnA9lAG/KfxKgDbY5eiuK2sxGt6tswL5FuFTpB
 hLTq4cCYbjZatn4FFMxJRY+arjR3/8jhTSPv+8+J1/35XEr8ePfA1lSJRSFlAdUMKBxbNE+2
 e4ktcNPs16/hxMmP8yolCdR82jQfHUMX79+7sMRAZPxixptwVZHOMSOBijz6ZCJStNNLkh1f
 WPE2Puc3+xRnxOQfWAyGH7B2ftmqa4P4B0ankUfI1mpm8begqNl1hNm7jlqHB9eyQ9K0rwvN
 zEzZVF1P6iH4xxhmNNHAzK3AwhECRCUph7xxl8OmDGLRkWkTDWQfmg0OOLL90EF6WNMODNc+
 ejAmmriVD/reuD33zczBhE5+6CyE4Qp+12Qgt2jEuSEA4I+MGjsjaKZbGYVrwfqXJEqj0rdq
 Og2pOt9ZMUX78LLT3HX32VC6YktdQ==
IronPort-HdrOrdr: A9a23:cR8w+a0FcJ188BwLUmNgIAqjBfhxeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5AEtQ4+xoS5PwPE80lKQFrrX5WI3CYOCIghrQEGgP1/qB/9SkIVyEygc/79
 YvT0EdMqyJMbESt6+Ti2PUc6dC/DDuytHxuQ609QYIcegeUdAH0+4PMHf9LqQZfngiObMJUL
 6nouZXrTupfnoaKu6hAGMeYuTFr9rX0Lr7fB8vHXccmUizpALtzIS/PwmT3x8YXT8K66wl63
 L5nwvw4bjmm+2nyyXby3TY4/1t6ZvcI5p4dY+xY/ouW3DRYzWTFcBcsnq5zXcISdSUmRQXeR
 /30lEd1opImirslyqO0GfQMkHboUkTAjnZuASlaDLY0L3EbSN/BMxbiY1DdBzFr0ImodFnya
 pOm3mUrpxNEHr77W7ADnfzJmRXf2eP0DIfeNQo/jdiuEolGctshJ1a+FkQHIYLHSr85oxiGO
 5yDNvE7PITdV+BdXjWsmRm3dTpBx0Ib1u7a1lHvtbQ3yldnXh/wUddzMsDnm0Y/JZ4T5Vf/e
 zLPqlhibkLRM4LaqB2AvsHXKKMeyHwaAOJNHjXLUXsFakBNX6Io5nr4K8t7OXvY5AMxItaou
 WJbHpI8WopP07+A8yH25NGthrERWm7UDz3jttT/Jh0oPn9Q6D3OSqIRBQvnqKb0oUi6w3gKo
 CO0b5tco3exFrVaPF0NlfFKudvwFElIb4ohuo=
X-IronPort-AV: E=Sophos;i="5.88,333,1635220800"; 
   d="scan'208";a="65388474"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5d2DQbZJGtPiMrb01XcPPFvczQNYSZzxLyXgElN9kdvMY1IFKcOvtbqYZ5m7xWr71Gu46nSFVFbtUrU9+Kynl1k+ujt9aLRCcebA9ckWdvamHgciKun0Muu5T7ngy6lpEhNQ4ANjGP1JxWaKlaMrin8S6o0eawrwXIOio2MxoU+T3VufCGHtXVAZ1Gw99Koc35IFTDZeTQ7WIh+6/hJ67hk+NXK31d1RwzR7OhIIDdHKUlWk9aA9juXrl2E//lsRRUg2P7gxqieIToC01+3XBdJxJXgn8uzddvmYgSVIzGjkkOe58ArRIzspLTGlZw8GzQAVyQE1YW+/6GX/r85Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjmKXC02a46b0N4agfLPjg7mRyM64QzovMyqMf83574=;
 b=Vmon9T6SkCCcGP6j0qgZYUvoctVC6iHfB8ImRMA2+1jBPwtLzLMHwVIpRq7q0HUpI43OyHslywl2WmdMEQdon8hp7EK9nosIvXWl/ywBO2e3/x+ITjVU+n4CgFMJUhksnq24mXsQvsktP4wlKbYqCqU6DL+fSrXKDEJOQUMobqWYdZJ/XERq0nITe+VRqmGO1o5pOr0iYhBG6GOjsLn1w2hoOA4RkVQhRJyHy9RYq5REyqLl9tbXakr4T+U1k03k0a+ovBBUHCshil7hQs7Lht5PUfRye6nPfFtPF5qQ+HzfxLuHzjSxDNTy33E+/w1mJX2Zpe9SoFbYD15sYqxXzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjmKXC02a46b0N4agfLPjg7mRyM64QzovMyqMf83574=;
 b=BTJe+ObAY2fMOJNVKm9t2SHfWepADyYmftkpMHvir53bbVHAzsKxmnLdQMW4DSIjIVnWUyQL1k9E1L4+MCD8FYwW+l6NQ10CS8XT4VY74fi5jud+i8fI7v2GDLIHHqkVUWC6cTYbFyj2SOQvqLHDfF2ptrnReuXsUhqzrwN1LSs=
Date: Tue, 1 Feb 2022 11:23:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "paul@xen.org" <paul@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH v5 05/14] vpci: add hooks for PCI device assign/de-assign
Message-ID: <YfkKMgul+CrkMQQI@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-6-andr2000@gmail.com> <YeAPxA8gZZ/xBYdA@Air-de-Roger>
 <f4ea5ece-551e-8a91-90c6-d9f806c97d5b@epam.com>
 <ef8feba1-695f-5cd6-bdf6-8ef6c55e62e1@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef8feba1-695f-5cd6-bdf6-8ef6c55e62e1@epam.com>
X-ClientProxiedBy: LO2P265CA0226.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80a2a947-f381-4721-b07c-08d9e56cf06c
X-MS-TrafficTypeDiagnostic: SN2PR03MB2255:EE_
X-Microsoft-Antispam-PRVS: <SN2PR03MB2255190707EF6E4A9FD8407E8F269@SN2PR03MB2255.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hu0XXdbvalXI76T2Tv4oiWB1n4nk4g5t9iw5yC2s3bQJzbMD9LQzcb5ilvi4N//Qznb2ynupyVAI2vcsurodgSq3lj1/WzoKAO/5zV7LROquVvzDZsxuKw/WD7lBasdM5qg2Dq6SvwOAQl83KBSEO8hOOddXDujcYDqUc0DMXLUoUDURQTRarw9s1Y1YcOP7zGfoVEGP94QdI10O4oKYiT4T3oibBONOVDn5ICwnvdoYEP5YnVNVi2o9dhRg24Tp1R8OHUpVMdazsV5D0xTuPooGrlcKgvmI480gTJMbeLB+Iey8siWNEPAtWJpndlAI/AgztgfFZ8kNfw5wKBgn1uQebT4KWfDuYlAXTseXF4XRJ3zc6xTJJiQb27601RrPLFfdi9pXPKr7A+R4VbBnnXsRIBw0EOzF5U+XyDXOFuh9o5Qq1yfp1C9M+WqVPakriWo3dl27BdxFjQ8eLfZyfJKFVvSZ/WhB7rB+5LWQPxAyJVnfpUKr/oWUL+9IwTnwEKj9GClC04WQf/5Zj8ltiCbMRR1Hk1X3rd6tfquLKpnvdgfztz/lcy+rJhVe791maoXC43j+AHRHmNAQXwNEBt0ZtZ2kMS0fCLdXIfwofv0qV8ulQjyCSVwyvGNIs36rGEXCWvNFDvjTuv9wDoLUnhy04U27O8Fvi+GyyQZhr0Z5EfqKPUh8zk8On8B9BRPzNSZrj96zH86rJDb63Jq26A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(7416002)(85182001)(38100700002)(83380400001)(6916009)(508600001)(5660300002)(316002)(186003)(26005)(33716001)(6486002)(2906002)(66946007)(4326008)(66476007)(8936002)(8676002)(66556008)(86362001)(53546011)(6506007)(6512007)(9686003)(82960400001)(6666004)(54906003)(67856001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2ZEeGhSZ0htOGR1NndONWhFcGhOMnVrR3FNdmpNdkVRb2VOb25vc1J0UXRj?=
 =?utf-8?B?VHhTK1B1ejdWdzE1TjZRYVlGZEZzQWNYSTFGUEZBUlNJd2EyWVFoVXVEbFJ2?=
 =?utf-8?B?TzQvWGdIeHdwcU12MmxXQm1wVjFhUzJ1THVYMk5YMzBac2NQMmlxcEozNHpC?=
 =?utf-8?B?eVphTnlUMS9hZndGcDFTMmMvN2NEZHB1QzZWRERhcFU3MzgwZld2aGI3VVND?=
 =?utf-8?B?S3lLK25JcE1VUDR5UFpMY2I3Z3ZSWFo4NERPZWsvMHArL3g4M21FWHV6S05z?=
 =?utf-8?B?Y1VsYmZuSXd0RUpQUkVVWVZzSmFCZnZFZld0RzFUOVJKVEZ4UFJ6S3c5REVr?=
 =?utf-8?B?QXI1N1FnOHhTQjFKbkZoeTNNT29sOWp2QnZCbEZXK0tZcHlsSzY5M3pkSDVo?=
 =?utf-8?B?THBqTFlJNUJJczlFWlo4R0xFR3IrSUxFdVd6UHQwd2VsL0tKbU1hdGh1UktB?=
 =?utf-8?B?NHJueHpOUVprWW9lcGJaemZvRTZML0RFS0dhT21OWTZmV1MxOTgvdlFjQ2E1?=
 =?utf-8?B?WmYvRlhoa2pVVXZueldwaElPY3hxVzh3L0ZpV3pEWXQ3Ym1nZllRaVJNL3VQ?=
 =?utf-8?B?LzRxVys1NmNjb0xNLy9HZDUyR01xcFZVLzl4Q3hlR2NyY1NQUEJ4WFF4bm51?=
 =?utf-8?B?a0pxbG5EaHc0WmRGcnhRb004M2hieHoveHRzczdpVUhWeVZmaWdwSWI4Wlpa?=
 =?utf-8?B?d01DeStiY09ETzFGRnJTUlhZeUhabXJSRThJOUc1c2dyQTN1NUZhRWhSMmI0?=
 =?utf-8?B?cFhRU1V6aWdBeW54czlDaTFBK1hNeXNKSkEzQVU0bjJFZjZYWkw1VVpIeitP?=
 =?utf-8?B?S29yc2VpSW1udXYwajQ5dFF1MnVneTBZZktvUGpQckxlZEE0RnZKQmxHZmdU?=
 =?utf-8?B?VExEUXIzelJIckk1Z1FJeXNZdEdjaGZaUGVCMXRPWUx4cUFiQ0VVK2IyVHd1?=
 =?utf-8?B?ZXVpd0lPdzNDMFdjRmE4UHVBbStaMVZIN01WK2tqL1J5dUVYT0JMeFg0VHly?=
 =?utf-8?B?NHZHM0ovMDBzQUR0cTgvZXY5VkJDNENCOUNXSHh4NkNadlF2b1BsZmxCK3M0?=
 =?utf-8?B?RkFCeGt5aGZDdHI3TlhkcjFWaDVhQnFDdWFpNXZ2WG1QckdHNjhiUHZ0dDla?=
 =?utf-8?B?WXF6UEdlRHZzV28vRFhRRnlyaC9KRVI1WHRoYmZ1UHR3bjJlSzM2ZXVZNWtP?=
 =?utf-8?B?RU1sUWNHRWlTUE93cXpzZWFSN0xtajBmbFVCYzZSbWoxQitrK2NUZDZaT2lB?=
 =?utf-8?B?NnJ6VEVvNWxJOGdadU9aNjhOVWVESVpXeTFubGlZUnMvcjdEZnIzUU4zS05X?=
 =?utf-8?B?M3U3TlVNbTZZaVh5NDF0RjdvR3ZjbW41TW1KNTRyMjNhYXJNVlFhYzhCdkxn?=
 =?utf-8?B?NTJFam8xYUVYMERSd1VWN2N2OXgwQ0RNamx3cEd3T1VkaFg3SUVYL1NFcEJX?=
 =?utf-8?B?S1ZLMDRRamh0djVFaVNzQzlDL2UxTUpMY3YrYlFRblNIY0h3R0VYYi83K2Q0?=
 =?utf-8?B?cWN3U1RRWVRKL3ZtMGVJMkh1d2E2Q2xON1JZUXQzaE9ua0Q0OXJ2bHlzN2hO?=
 =?utf-8?B?L1UyanRvWksySFNlK090b21jWGlSRVpodEFqYUYxVzNiVjRKRDRkVGhQT0Nm?=
 =?utf-8?B?SXk2T1hqcWU4UVNmWlRCcDl0cmFJYm1hZ3RrdkJmZ0k2UERlTVpXNGFsL3NH?=
 =?utf-8?B?aVA2ZmdJcktveTdRcDJSeDduYjR0OVlyeE1aK0d2ZDRTUzRGYnZVM0I1eDIy?=
 =?utf-8?B?RXNraXZlU3Mzc05Ga3BjZTQzbUZaekRBWjdDcS9sV2xPc2xNNko5d3llQlJz?=
 =?utf-8?B?SzhiNHppY0t4WDRZK1paRjBrSjNUZ2NLTGIvUGdadDdjQmlzYlQ1T1FQMUNM?=
 =?utf-8?B?bzk2WGlWWkRaNThsd1dhUll1bUR1WWJacTVEUmpwRzJMN2d3Y2pSTXQ1aGw1?=
 =?utf-8?B?dGdTcENTQUdsRElKcjVQUEZ0WnBDZVZvUXl2Q21ZbktxV0NzMU1RZkJJK015?=
 =?utf-8?B?dHBveVc4Y0xhcmpFT1pia0RpaVpNM0pGY0JsOXk1UmZpcFpjRVlXY3Ivckdt?=
 =?utf-8?B?djEzaUdnQ0hQemgvUzBSRVJqQ2o1WENVbTZITlNkMGNnKzZaNFU3MU10WEVw?=
 =?utf-8?B?K0REK2lvdW1tTyt1SXp6WjdYK2dTaUtqUGpLZVh0YlVwa0hZcExVT2NTVUdH?=
 =?utf-8?Q?/pSgjGTmM0a2AId6vRqphG8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80a2a947-f381-4721-b07c-08d9e56cf06c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 10:23:50.4238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/2N5+Us7hIRZiqb6EpJhV+YPHxdzDzCTaPlQpJh3SGilwxMdujXnY1MOYEykGv/ZqVJTxNpvtojEckmgs+K7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2255
X-OriginatorOrg: citrix.com

On Tue, Feb 01, 2022 at 08:56:49AM +0000, Oleksandr Andrushchenko wrote:
> Hi, Roger!
> 
> On 31.01.22 10:45, Oleksandr Andrushchenko wrote:
> > Hi, Roger!
> >
> > On 13.01.22 13:40, Roger Pau Monné wrote:
> >> On Thu, Nov 25, 2021 at 01:02:42PM +0200, Oleksandr Andrushchenko wrote:
> >>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> >>> +/* Notify vPCI that device is assigned to guest. */
> >>> +int vpci_assign_device(struct domain *d, struct pci_dev *pdev)
> >>> +{
> >>> +    int rc;
> >>> +
> >>> +    /* It only makes sense to assign for hwdom or guest domain. */
> >>> +    if ( is_system_domain(d) || !has_vpci(d) )
> >>> +        return 0;
> >>> +
> >>> +    spin_lock(&pdev->vpci_lock);
> >>> +    rc = run_vpci_init(pdev);
> >> Following my comment below, this will likely need to call
> >> vpci_add_handlers in order to allocate the pdev->vpci field.
> >>
> >> It's not OK to carry the contents of pdev->vpci across domain
> >> assignations, as the device should be reset, and thus the content of
> >> pdev->vpci would be stale.
> >>
> >>> +    spin_unlock(&pdev->vpci_lock);
> >>> +    if ( rc )
> >>> +        vpci_deassign_device(d, pdev);
> >>> +
> >>> +    return rc;
> >>> +}
> >>> +
> >>> +/* Notify vPCI that device is de-assigned from guest. */
> >>> +int vpci_deassign_device(struct domain *d, struct pci_dev *pdev)
> >>> +{
> >>> +    /* It only makes sense to de-assign from hwdom or guest domain. */
> >>> +    if ( is_system_domain(d) || !has_vpci(d) )
> >>> +        return 0;
> >>> +
> >>> +    spin_lock(&pdev->vpci_lock);
> >>> +    vpci_remove_device_handlers_locked(pdev);
> >> You need to free the pdev->vpci structure on deassign. I would expect
> >> the device to be reset on deassign, so keeping the pdev->vpci contents
> >> would be wrong.
> > Sure, I will re-allocate pdev->vpci then
> After thinking a bit more on this I have realized that we cannot free
> pdev->vpci on de-assign. The reason for that is the fact that vpci
> structure contains vital data which is collected and managed at different
> stages: for example, BAR types are collected while we run for the
> hardware domain and in init_bars we collect the types of the BARS etc.
> This is then used while assigning device to construct guest's representation
> of the device. Freeing vpci will lead to that data is lost and the required
> data is not populated into vpci.
> So, it is no possible to free vpci structure and I am about to leave the
> approach as it is.

We discussed this on IRC, and we have agreed that it's possible to
free pdev->vpci on deassign since in any case we need to call
init_bars (and other capability init functions) when the device is
assigned to setup the register traps and fetch the required
information in order to fill pdev->vpci.

Roger.

