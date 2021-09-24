Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B12416E21
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 10:42:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195024.347480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTgmQ-0000e6-R3; Fri, 24 Sep 2021 08:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195024.347480; Fri, 24 Sep 2021 08:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTgmQ-0000bY-LI; Fri, 24 Sep 2021 08:42:02 +0000
Received: by outflank-mailman (input) for mailman id 195024;
 Fri, 24 Sep 2021 08:42:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N27y=OO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mTgmO-0000bS-OA
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 08:42:00 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bdc87bb7-617e-404a-8ae4-57beb9f8ba0c;
 Fri, 24 Sep 2021 08:41:59 +0000 (UTC)
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
X-Inumbo-ID: bdc87bb7-617e-404a-8ae4-57beb9f8ba0c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632472919;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=F/B0cVyUVT5RpzjBNiaxSAVTbNHy4nCj5kV36uuCphc=;
  b=Cp1FfYxjKNSogYzhRM1VgYxucjcjMrEAUiiEHk0/br87/6bZhJFwBvAq
   Yj4pfmL0zfXsE6F3vSUPgRsoCWC9ffzJeFOnXXgND+ZY6egYqvEJn4ug8
   g5yRoJvt5EUJMmyRP4nR5830mnkI/zAIETj8UqNnT3KeU5lA0fDOtOA0a
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: frdSI581sgvoyUHsLsyqKL2zJ65Ajsw4Rt0Qp50jVdfsJhnjbUFZs/zDMkpjyO2j5wrDsEtNS8
 99vhdQIaY77ht5MjwT6wdPDRfjOuEj8CWkvbKntucthv+igIQJR2ZfuKG/gQzC4t/sPqanus8b
 kDdQ1+sr9C1K/Nrez15SIlzKtqAmBE57zZJElquX8LOmKWGmPKP7WfHj1PXmpH/qb/+bL9r3eJ
 9vy7A6uCFw0Uk0hgD7WSCof82+DXSsOwn8ZOWcc2leAOmTVnqpmlnTRNXYZP6J2hQodrXsbwlt
 ogwvTS+rlDbcD0U5VkJHBrY0
X-SBRS: 5.1
X-MesageID: 53516225
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Yks8ZKmskRMcRhrO57bcVv/o5gzjIERdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeWWGAMv6KZzGmfIh1PN6x9RhUuJXWnNFiTgFprStkRiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA185IMsdoUg7wbdh09Q02YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 MRw5KCSbis1B7zBu+MkXQYCMC5RMbITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gpr25kQR6yDD
 yYfQRNgazv6aiZKBnoeBZt5tcjyrSWuUTIN/Tp5ooJoujOOnWSdyoPFMcXXUsyHQ91PmUSVr
 X6A+H72ajkkM9iYxSuA42ibrObFliPmW6ofDLS9sPVthTW72Wg7GBAQE1yhrpGRiESzRtZeI
 Ew84Tc1oO4580nDZtvgWxy1plaUsxhaXMBfe8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLTtrvb6OVWOG9p+bqDqzPW4eKmpqTTQfUQIP7t3noYcyphHCVNBuFOiylNKdMTb0z
 jORpS4ynYIPnNUL3KW2+1PAqz+0r52PRQkwjjg7RUr8sFk/PtT8IdX1tx6Ltp6sMbp1UHGQg
 Sk4ue+y8NkfALKKrSKSGsYCM722sqPt3CLnvXZjGJwo9jKI8nGlfJxN7DwWGHqFIvroaheyP
 xSO4105CIt7eSLwNP4qP9vZ59ECkPC4fekJQMw4eTanjnJZTwaB4CgmTkqZxWmFfKMEwPxnZ
 M/znSpBCx8n5UVbINieG7t1PVwDnHlWKYbvqXbTlU/PPV22PiL9dFv9GAHSBt3VFYvdyOkvz
 /5RNtGR1zJUW/Dkby/c/OY7dA5RdyRhX82p9pALLIZvxzaK/kl7UJc9Jpt7J+RYc1l9zL+Ur
 hlRpGcCoLYAuZE3AVrTMS0yAF8edZ1+sWg6LUQR0aWAgRAejXKUxP5HLfMfJOB/nMQ6lKIcZ
 6RVKq2oX6UUIhyaqmt1UHUIhNE7HPhdrVnVZHTNjflWV8MIejElDfe+JVawqHlSUHDn3Sb8y
 pX5vj7mrVM4b10KJO7dae61zkP3un4YmeloWFDPLMUVc0LpmLWG4QSo5hPuC81TexjF2BWA0
 AOaXUURqeXX+tdn+9jVn6GU6YyuFrImTEZdGmDa65ewNDXboTX/kdMRDr7QcGCPTn7w9YWje
 f5Rk6P2PsoYkQsYqIF7Cbtqk/4zvoO9u79Aww14N3zXdFD3WKh4K3yL0JAX5K1Az7NUoyWsX
 UeL9oUIMLmFIpq9QlUQOBAkfqKI0vRNwmve6vE8IUPb4i5r/eXYDRUObkfU0CEEdel7KoIox
 +slqfU60Q3nh0p4KMuCgwBV63+Ici4KXZI4u8xIG4TskAcqlA1POMSOFi/s7ZiTQNxQKU12c
 CSMja/PirkAlErPd30/SSrE0eZH3MlcvRlLyBkJJkiTm8qDjfgyhUUD/TMyRwVT7xNGz+MsZ
 TQ7axwrff2Dr2VymcxOf2GwAAUQVhSW93v4x0YNiGCEHVKjUXbALTFlNOuAlKzDH7mwotSPE
 Gmk9VvY
IronPort-HdrOrdr: A9a23:QIKye64AIJcneT2TowPXwUuBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc0AxhIE3I6urwQ5VoIEmsv6KdhLN+AV7MZniBhILFFvAA0WKA+UysJ8SdzJ8l6U
 4IScEXY7eQbWSS5fyKpzVQeOxQpeVvhZrY4ts2uE0dKT2CBZsQjTtRO0K+KAlbVQNGDZ02GN
 63/cxcvQetfnwRc4CSGmQFd/KrnayGqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 n+lRDj7KnLiYD19vac7R6c031loqqg9jJxPr3OtiHTEESvtu+cXvUhZ1RFhkFxnAjg0idvrD
 CGmWZbAy060QKtQojym2qq5+Co6kdT11byjVCfmnftusr/WXYzDNdAn5tQdl/D51Mnp8wU6t
 M844u1jesiMfr7plWL2zEIbWAbqmOk5X451eIDhX1WVoUTLLdXsIwE5UtQVJMNBjjz5owrGP
 RnSJi03ocfTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2n0A6JU+QZ9Z4P
 msCNUgqJheCssNKa5tDuYIRsW6TmTLXBLXKWqXZU/qEakWUki93qIfII9Flt1CXaZ4h6fatK
 6xLm+whFRCCH4GU/f+o6Gj2iq9MVmAYQ==
X-IronPort-AV: E=Sophos;i="5.85,319,1624334400"; 
   d="scan'208";a="53516225"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OuEMvmzLM8km5KGc1RV2XxnqsSzkvc0HmVn8KIceW8Onpo7ocglDRtAG+v4tFOYy6L72/vfOu0/j5d/a7UPgZiUtM/d0q03myT9xapXM+CGUNGPKDzn4x2UCcrttfQmGBVkdl6O2dw4tFl2toXCeoxjs+fBfiD4qC9wafwn3BmA6G+4KoNAiqg85LBret2kTnS2Lc3gZWNCQoiUub/FDG3guUFMOX/V1DUfFlcliPP680Xd+Fwm9Bt7gX1CaLyF0rSfW1IjC78dyaqsw2cQsZWs1llEJgdZr0BqkTMDLUyNr4rYmtsv8EkqpQe8Pg4BUkuz6C1CGi5+7b8U8b6U43A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=3QfVlt2un1DDm8HNlvp7qY/nnB/5eJ5J7RpyeAoGVS8=;
 b=DBOlumFH264fjITZG2BOPIA83CpCUaax4hcjNmQXVm29yrpQGxTbPUNOaFoQUjvaqQHGLCQCQh2GR6izzOUJ6tuw6GGmiUuN//JBRGZPg8xP7k687S2nzknD7hJV3F5DXqxn21ocdO4zH70/Kd1ya/WdjmvlaHD2IzSF2AMq0kSmKRgtsPO1LWyzSPZg1bBaSuGUy/phOCZxd0+seXiluy4IYx5DbfCBlJ2rg7rncqgrySCWoHqyVpBYsbgUf4QmlUrCdblEWlP7wZ2ZdZudBVUCmLfl9Ccjn5HD7slfMosyHAcZR1P/MRwCIHm2v9A5iLOYuXK992sH48nCI69oyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QfVlt2un1DDm8HNlvp7qY/nnB/5eJ5J7RpyeAoGVS8=;
 b=b3BGXGM/fgRLx6Y2m5Netjvb1TjaL9mnioXjuDjbx63er395GBBEnOGkqmHbAJz33Nbf7IA1aOxaSbkCIHmK9SVZqM3nJXJ3vnFXQHDuSoCDK13Sm15UnpjwjZUIe9QteW5XC6IJFnw9l8eDr4yiUquTFh54bnU0cJEv83p0CpY=
Date: Fri, 24 Sep 2021 10:41:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [future abi] [RFC PATCH V3] xen/gnttab: Store frame GFN in
 struct page_info on Arm
Message-ID: <YU2PT4rUts8KljKe@MacBook-Air-de-Roger.local>
References: <1632425551-18910-1-git-send-email-olekstysh@gmail.com>
 <de92ab24-a9f0-8f3b-e721-e0465e4dc065@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de92ab24-a9f0-8f3b-e721-e0465e4dc065@citrix.com>
X-ClientProxiedBy: LO4P123CA0222.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 334a77eb-6421-4a13-c052-08d97f372a01
X-MS-TrafficTypeDiagnostic: DM4PR03MB6094:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB609442F79FCB9E546AD37E568FA49@DM4PR03MB6094.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fdxJfjsLyfEktOrD8ZwrHcvtAfc1h6l/xoavR4HqIvUQaNFLc0iS5soaGyBMSew6VCIU5CSxgA5Asz+AG9ONf+DDjWhByG+AycNhH0UXMNL+3Isabv4aimo6Q2wozLDagN2LPEt4Rom0gIdFZl5bq92iqkIF/Z7X8dM5DHSK0TfNg47qDnYOQHmCVLE6woQKXNMw6icyrjEhQ84nJvs+prAWW/ykv5UcwMBhfxXjv6eV9PxLFjFZMVUJSsOhoRv3u2UrMcdGNYQGT/udr5Ki5wkhNHwxOPxpTSv9W4/r/izci4JgDp+EuEiaKzLSQGk63SeUX3izYN/YMF69ocnFnq3ApYp+DWZJtECkykNApbC1rZ1T2l/y+XQXcp6c1ZNRKi60WApknuk6LQhsQPeaX4lC2fuMek/stJuZrnG6QS2pAa0VSSbpb96GNxGO0gBDqeykPLzRxGZy13x8F5iKcgwa9uefIgclR4tLKtSgA26JVtl0A40kjiuBLZXeL8tKpYk77WQaAxIyxkKkuI3XIS/zxr4YxwX+v0QkwGZlMuiZKzmWaDMmFL83id04+hXTvSH8VVHadEYPNQ/NngduW+oVg0qB77W2Fxft+Iov00MStA1LogEeAMg13heijrckP2WT1OWC0XvjRs4w5LaKH9BlbcusvHJXpREtRoidb2BQYelV6snv4i9+pMpsp/zyjfR3IbBJ4B3dgDUeHLKRCJgR/vpQhbgn3jiwol44+kqCbIoHYaCZ8ddux7jOTmOgH/c1qLWCZrgURnh8t5F6tA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(8936002)(956004)(5660300002)(6496006)(6862004)(38100700002)(66476007)(508600001)(66946007)(26005)(8676002)(66556008)(53546011)(966005)(6666004)(86362001)(6486002)(2906002)(83380400001)(4326008)(6636002)(85182001)(9686003)(316002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWwwNEZuWkw1N2o4bWxzTVdjVWpsZ0t2YW9GSUlTRElCMmk2WThtQ3FSYkY0?=
 =?utf-8?B?ME9Cclo0bFcyNGFTcXdha1FYakZqeWR3enNXblpWRGlncmx0VmR6RGxFVUFU?=
 =?utf-8?B?VG1zSHJUQ1ZnZTZ3aE5KZUt1YUsxbGtmRU8ya0gvQmVORjhncEVWNEdHN3lP?=
 =?utf-8?B?NGNPTzdnOU1LZXUvSmRhb1VQRkU5ck5BeGptV0hWVmpaZ1UwMnFnYmVEbGJV?=
 =?utf-8?B?dEhLeUhXalpySndYcGE1ZHlpNXhUZjFHUW8yMWM0L3RWekRaVnZabXN0VGJI?=
 =?utf-8?B?bVp0WFJNOHk5R1lHM0ZidHZTTjdNM3VzeWlBcHRHU04yQTJzdk5EZVFZWThP?=
 =?utf-8?B?MHlDckMxTU51TVRFUzBtb0YyZVBBZXNGTkFhUWdaN3Z3UjVmVGczODlsNHZM?=
 =?utf-8?B?UVRpajVJZTZrd2xQUGlvTkxSblhwVk1XZ1I4cFdLaytpWk9NRmRXN01TNE4v?=
 =?utf-8?B?M1BuYlU5Z1F0TThJSFNjclRpUUJQU0RGZ2xpSzBxc3B0R0lVWHpxKzM4dXd1?=
 =?utf-8?B?ZEVJcWlxTzZ4cGZPNnlwbTNoeVJHWllHODFwbkNtK1o3d0ZkWFg5eGNTemJh?=
 =?utf-8?B?TkVQTHdVNlNFTXczMTlMUUxXWGpIUzVVK3p4ajk3UjB1eFFHQmJLZGc5NmhN?=
 =?utf-8?B?K2dYWHFOQVltRHQxc2dxdVpIL2ZvcmZUUEIvemdKK3ozSi9DZk1qTHo4cm1H?=
 =?utf-8?B?QUtsb21NbVB5VmhqMFZLQUZjMi9HWmF1MG14c3p6NDlZenlMYm93YWZ4dGtw?=
 =?utf-8?B?SUh5bXBTd1pPRFd2ak5MZ3dlUUErcmZJTUZqVDVhWVQrSXo0S3NiMkpKSGxM?=
 =?utf-8?B?b2tnK0tweGNLd0xVRE1xcW1tLyszN3VZUkRXU0dJd0RBaVFxTDNtcEw3N2FH?=
 =?utf-8?B?Y2hKeDMvNVhxbHV3a0dTTTk2N2xaUXY0Z2hHWmJJQUtBWDJ2QUFqMXYvTkpk?=
 =?utf-8?B?ZHdDRi9UbU9XZDhGQkxndEN0c3FvbnFHM1pXZlAzWExLZSs0dVYwbWNZUDF4?=
 =?utf-8?B?N1YvQlpXOWNWUnM5blBXL1dFL1JxK0lBRzRZbmtwcTBBTnpuYUEvTktwYWdw?=
 =?utf-8?B?cG1hNS9WeVhWVTNGR2tIMWs5bS91WUx6VGR6WWF2dDdjMTFja1FjaXY4M0JY?=
 =?utf-8?B?cDNMNjM1MnpWR0F4Rmc2dHlVQjBBSWZCNWpRL0g3RGhrQThFcUFQK3lOclRY?=
 =?utf-8?B?ZERxcGlsMnhkenVjZzBqTU1ZZzh1SXpXeUZuNGYyK1lnQTNvVjVqMGpNUlBD?=
 =?utf-8?B?cmlFY2xFcXA5SHNGbG1KaDNUWXM2ZlhoaHQyT25IeFNKUGNnTEd4QkxwajI0?=
 =?utf-8?B?OE0wQWpkM2hMNzFjY0tQWSsvbXZFMXBES2xWSCtxdnRWOHI0Y0llSWQ3bDk5?=
 =?utf-8?B?ZFdFQllUNFBCZWpyMk1MaWpmVDlydU5JS01TSFIwMVJVeFJGMyt4aUs0U1dO?=
 =?utf-8?B?MXlMdXo3UzJiLzhWaTdIdS9ZM3gwaUR6cEdkUkRYejMrVkNPVGRCMGtQbEV4?=
 =?utf-8?B?RmMxb0xtNFZTV3cyZ2djRzA2bTJtaGpIZVJLbkhGRXNPSUJjemFadkRBLzZ2?=
 =?utf-8?B?MjhGSmhWK1cwRGRWUmM5WnpDYjJKMXM3eXc1WkFWQkt3V01rb3QzWGVtRjM1?=
 =?utf-8?B?bHNuZHpqa0dDV2RhZUozZ3VwU2lSUkVUQ1R6S3BYTE1wSzhGV1NsR1pZamhI?=
 =?utf-8?B?N3NKQmVhK2ZsRUpCVUZiR3J0c2lKU0Uwc3BUTWRQb1BKVkxvUGRGYnBMd1RK?=
 =?utf-8?Q?OdqYdTHONCVcjleUiieE7rSiNRR6JAmeChT3v4f?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 334a77eb-6421-4a13-c052-08d97f372a01
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 08:41:55.6532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJ1brtyKVI+esUhwc0ygZ0I5UQ/MnPiYwC+5YLp96x72Z5G5TiLJUBeMQLLKOVGWCI7NdzNDRGvmenbRDJYN8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6094
X-OriginatorOrg: citrix.com

On Thu, Sep 23, 2021 at 09:59:26PM +0100, Andrew Cooper wrote:
> On 23/09/2021 20:32, Oleksandr Tyshchenko wrote:
> > Suggested-by: Julien Grall <jgrall@amazon.com>
> > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > ---
> > You can find the related discussions at:
> > https://lore.kernel.org/xen-devel/93d0df14-2c8a-c2e3-8c51-54412190171c@xen.org/
> > https://lore.kernel.org/xen-devel/1628890077-12545-1-git-send-email-olekstysh@gmail.com/
> > https://lore.kernel.org/xen-devel/1631652245-30746-1-git-send-email-olekstysh@gmail.com/
> >
> > ! Please note, there is still unresolved locking question here for which
> > I failed to find a suitable solution. So, it is still an RFC !
> 
> Just FYI, I thought I'd share some of the plans for ABI v2.  Obviously
> these plans are future work and don't solve the current problem.
> 
> Guests mapping Xen pages is backwards.  There are reasons why it was
> used for x86 PV guests, but the entire interface should have been design
> differently for x86 HVM.
> 
> In particular, Xen should be mapping guest RAM, rather than the guest
> manipulating the 2nd stage tables to map Xen RAM.  Amongst other things,
> its far far lower overhead.
> 
> 
> A much better design is one where the grant table looks like an MMIO
> device.  The domain builder decides the ABI (v1 vs v2 - none of this
> dynamic switch at runtime nonsense), and picks a block of guest physical
> addresses, which are registered with Xen.  This forms the grant table,
> status table (v2 only), and holes to map into.

I think this could be problematic for identity mapped Arm dom0, as
IIRC in that case grants are mapped so that gfn == mfn in order to
account for the lack of an IOMMU. You could use a bounce buffer, but
that would introduce a big performance penalty.

Other question is whether we want/need to keep such mode going
forward.

Regards, Roger.

