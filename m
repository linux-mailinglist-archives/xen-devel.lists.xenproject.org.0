Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 748144317C6
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 13:46:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212107.369863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcR5o-0000Lb-Rv; Mon, 18 Oct 2021 11:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212107.369863; Mon, 18 Oct 2021 11:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcR5o-0000Jo-OY; Mon, 18 Oct 2021 11:46:12 +0000
Received: by outflank-mailman (input) for mailman id 212107;
 Mon, 18 Oct 2021 11:46:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tpC=PG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mcR5n-0000Ji-5Q
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 11:46:11 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c262a53e-2a3d-4c1a-88fa-26783c841b31;
 Mon, 18 Oct 2021 11:46:08 +0000 (UTC)
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
X-Inumbo-ID: c262a53e-2a3d-4c1a-88fa-26783c841b31
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634557568;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=1gkF3kswacgJ2yC4f/gP8wNsUCZXuYplBY+aq4y9jm4=;
  b=YShnsFc7vBRBwEvZOlZmbjO0Y4oKElKTn07AiyJ5S+EDpK5Sndo9OP16
   ApRGqvmBlCjx64PdYR/qpue9umDuhs73lIw6Py1X3Sz5E3MkxRms2cyri
   AtbdJhdeP22Z+9VnQDuvs+nYZzV2Q7vilVmWv9rRLVkxm6a0odlyDjBk4
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: JBnknY3CC1V97fTmYGZpkXQwL6u5AtuVBTNzHzWgp9VdRks3E6zbAzkOTh1Oddo2Q6rAiUEnLv
 sA+g7SbAYJ/ywfE9SWHmnnc/PPGkFA4cTKW19MUmZ0IH0HhA2cR239vPh4ZKNx5E+qyHWSzErJ
 oNa3+5PDbm+k+MTcY7N1MTJIRBV8ORS2L6xVx+9cmejlZikd/nrzjMOQVpz8EC0V56HPoTpAdO
 l6wB2Y9MJNLW9iO06zCuLDVyvybXAm6UNqnsHukJGGl+WtyoTNzaW7xc0nRq72VdGen919KhfX
 DqJYxsE8K4NKea/KqTSnFg0h
X-SBRS: 5.1
X-MesageID: 55412489
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ZMU/eqKV/xfW4ik6FE+RCpIlxSXFcZb7ZxGr2PjKsXjdYENShDUEz
 WZOWGmGM/jZazSmKogjbI62/BgFsJKEn4RnHVNlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZ0ideSc+EH140Eo6y7Zg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2Vx/5W4
 +xL6qX3SCwGYLOSlMUmbRZXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2XuIMBhmtg16iiG975R
 /Ufdh1SaijtOR9SHQwlD708uqSn0yyXnzpw9wvO+PtfD3Lo5BN1+KjgNpzSYNPibdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+o6Fre16/pri1273XEIBVsdUl7TnBWiohfgAZQFc
 RVSo3dw6/hpnKC2cjXjdwHgjlmvhxhDYp1ROMJk9l+B65Hq7AnMUwDoUQV9QNAhscY3Qxkj2
 VmIg87lCFRTjVGFdZ6O3uzL9W3qaED5OUdHPHVeFVJUvLEPtalq1kqXJuuPBpJZmTEc9dvY+
 DuNsDQlz4saicoGxs1XFniW3mry+PAlouMzjzg7v15JDCskPOZJhKTysDA3CMqsyq7DHzFtW
 1Bfw6CjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9sMvGAjdR01bpxVEdMMX
 KM1kVkAjHO0FCDyBZKbnqrrU5h6pUQePYWNug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm3BvrUuOFMuT50n2jtKjiIu9FO5t3K2mNbtisstpYWz9r
 r5iCid9404DCbKjPnSOrNd7wJJjBSFTOK0aYvd/L4arCgFnBHsgG7nWx7YgcJZihKNbiqHD+
 XTVZ6OS4AGXaaTvJVrYZ3Z9RqnoWJoj/3s3MTZ1ZQSj2mQ5YJbp56AaLsNlcb4i/e1l7Ph1U
 /haJJnQXqUREmzKq2YHcJ3wjI1+bxD31wiACDWoPWokdJl6Sg2XptK9Jlnz9DMDBzacvNclp
 +HyzRvSRJcOHlwwDMvfZP+14Um2uHwRxLB7U0fSe4EBc0Tw6ol6bSf2i6Zvcc0LLBzCwBqc1
 hqXXkhE9bWc/ddt/YCQ166eroqvH+9vJWZgHjHWveSsKC3X3mu/2oscAuyGSi/QCTHv86K4a
 OQLk/ylaK8bnExHupZXGqpwyf5s/MPmorJXw1g2HHjPaFj3WLpsLmPfgJtKv6xJgLRYpRG3S
 gSE/dwDYeeFP8bsEVgwIgs5b7vciaFIy2eKtfllcl/n4CJX/aacVRQANhaBvyVRMb9pPd532
 uwmosMXt1SyhxdC3gxqVcyIG7Bg9kA9bpg=
IronPort-HdrOrdr: A9a23:W9dgcqinqfDuFAR7lPCo1AvAq3BQX0F13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkCNDSSNykFsS+Z2njALz9I+rDum8rJ9ISuvkuFDzsaE52Ihz0JdTpzeXcGIjWua6BJcK
 Z1saF81kadkDksH46GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 T4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRsXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqrneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpn1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY/hDc5tABCnhk3izytSKITGZAV3Iv7GeDlMhiWt6UkXoJgjpHFogPD2nR87heQAotd/lq
 P52gkBrsA6ciYsV9MPOA42e7rBNoX8e2O9DIusGyWUKEgmAQOEl3el2sR/2AmVEKZ4uKfa3q
 6xFm9liQ==
X-IronPort-AV: E=Sophos;i="5.85,381,1624334400"; 
   d="scan'208";a="55412489"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XfHkCbKCJnO6Q8QuM+fitZu0OV9LwLtI+VcdZeeqHimNNA41qhVG7KvelL0xiYUZ2P+WSCfpOv96yMT24YzZBnG5eTbDqCPtE3EDOb1fvmwygBGBzETpBWWcvqVN4SuE8llKAEPSg2rwMApaXwa538km0dUMwmqYoDdxNSg5W9jaOcYS/O3Ywled/JBBNW+oSsSZct6V+S+k69uHco0hdKktNG5gjq5QjJXevzqsJe+OTXqWyZCsiN6Dj99fGMKnl5oSDprVOYHhETd/ZtpXmO6BNaNetefCJeZ/op2Kwo0Q1b3A738SC4kfStcb1KF8o/igh2ElEBWHN6lvicAt4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcYuhL0Sw6ybNQmZXVMzlvwa2CaGB10Vwt71/KMmJss=;
 b=PaaWC+ZpnmE5w0rf7jhig7WzqtEYdJBteDgkaQd2q+Xz3yMI29Yr0G/QFhlIOHJN6YXhHUNYWPIVZdy6xU7I52vd98bOu3+i174uwAUd0T7ex3yg4ZKwWMy31CJ52Ww5a32lxgNDblhQzMpmeHK1v1ETQVtSSr2PmGENHtmUQpVyqqNnsGMXPK90cmCUe8HJ5DZyfCg5rl+p9WcnXvJ+jO2Qrv3xf/xZKd4NsGz8pdnxh61yrVi80b9LDwsB8kGHLPWdpH2/GOHA+Xc/q+3/a+ua3bMVtjujefv1UzUpjtXdo8BGHZ1YLNl2BDcaRqwqWmFh0Tu0431McFUDN8MMMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcYuhL0Sw6ybNQmZXVMzlvwa2CaGB10Vwt71/KMmJss=;
 b=NCyLoq+xvUWJVt1lPeV9O3En+lCgEG2Oe89dTJDnPwqkYXiAtmKCqlYy4TxO3hW6K+hwcR7wmLApzQOWMqsLe2TZ9vFtJk0HQW9bdzW0Lqq7mXgOvFLk7yDrGdrWDO8xHWeNJVGKOLB2rTQaerM9488aWohE+Fe3dn2WIr1vmtM=
Date: Mon, 18 Oct 2021 13:45:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH] x86/CPUID: don't shrink hypervisor leaves
Message-ID: <YW1eWeFls5igZcHu@MacBook-Air-de-Roger.local>
References: <0f5fe8d3-4c43-e60f-c585-67b2f23383ab@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0f5fe8d3-4c43-e60f-c585-67b2f23383ab@suse.com>
X-ClientProxiedBy: LO2P265CA0282.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b8d33d1-5a39-4574-9119-08d9922ccc07
X-MS-TrafficTypeDiagnostic: DM6PR03MB4220:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB42203252AF7D1136B9DDC81C8FBC9@DM6PR03MB4220.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1u5uSTraTwzPIyJenJZ7A4wt/Rk5Nt6YPzQK37lmDGbGy7AbLZOZc80+u992CDaXJ1hplcmoA13IrbUynMdcjuGYOzbSmwSI0h04wdoBcxZ7H9x+7eXjI6caDs983MQz1WntkD/cEfi8BRJeGMnKQucUV2gDKJRaPzjriKpXOxK+bQvyveiUVueeAPHYA/aIv20f79yhMq2nvEoNQ+fm3h1SFk++1CYwoEYyvKtUSwDhIyfTXewPYAgC9HrOAs6h3yrWDejxShdrovJD12AZJR5G6KZVqPFJ4JmdvcIdlYW/deibbQPqcux+jHLlkMOH9Z4UArpKVhLImAZTNuD4SqsILdBJzDcEKua3cpZSCejshR5JCOBcJWA09EG8asVcZPQ5Elv7pqA5AcOYJwUIH81r1J+OWQGWCFA/7JEzXX+HWqgFC+4bCqBqfhRoosiqf65v+d75ekQANHF5Azb3mSVYkDjsVkc9nKq5c0wJ6km4n68B95Iz1ReM/mbb7RfQs95MLabem7me1k4kiUMfI+IkKEdWUcEx+2v2OqhAsYeyAz0PpKq1qiDyCvvRkc/naJcOtu6RovSILK9vkwgQhxmjHMcUBBEcBoGZSuMDXsCni+yYtkhmOIffu22Le1Dg5JjRQ6rUPeFHzI8syMRa1Td6qLwsHzMrvD6a5N07WVXW/tHn0fvV8CpifVDzNMNgxc30wXSNEUCNvhJU6Fq/cQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(110136005)(6496006)(66476007)(86362001)(66946007)(186003)(6666004)(83380400001)(508600001)(66556008)(6636002)(6486002)(85182001)(956004)(8936002)(316002)(82960400001)(9686003)(26005)(5660300002)(4744005)(4326008)(8676002)(38100700002)(2906002)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3ozbG4yNlFpa2dhNGdKSmRIT3psTDFweUV3SDdENnR2eEdTSmhEa1lvNndB?=
 =?utf-8?B?QXUyRWdJZmord1JPNzV1eUVWUm45N0pPV3paNWVncWNLMHorZ3I3NkNyUFNl?=
 =?utf-8?B?SmNXak1IZGpLYUhLeFhxVWRrVU9qMDBoQk1aeG1pWHc2eFFIUytvSG55OWpL?=
 =?utf-8?B?b0hFQ0JJRXpZUDczOTkrWFRPNTdKRjdTejJpem01c1FWUExXU215RDNwU1RT?=
 =?utf-8?B?YTI0Mld2WWxpc3lDMjVQTFozazByOXA5Zkl3cGNGNVhVRFBUZlFQQ1hXVzFU?=
 =?utf-8?B?Vzhjc0lqci9ndGhZL2FjdWROWk5sbmFhb1dvenNRNkF5dWdLRTBoSDNWaTN5?=
 =?utf-8?B?cWxXTCtqMXFwK0h5QXkvR0l1OXRDaC9xV0c4cGVxYVNsczAveU1ZZ013bzVK?=
 =?utf-8?B?SFZpd3pHejhHVmdMY3hZMUYzTmV6Tm1VZmVmd2lpcldnaXlpNTRVUVg2bXho?=
 =?utf-8?B?cVlEbEFJcHF6US8xNFVuRmhqZk1PengzVXRnaFkxaW9EaFdKUUExdnptWXF6?=
 =?utf-8?B?bWlmdzZOUnQwaUl1TDBoVC9wMFJzOURCUlQ3Z2o1amgwdlpOSVJuQzYvYUlk?=
 =?utf-8?B?YTV4dDBiQVhWYVQrZ2xZWW9xRTIrWTR0NGduVXRqVHpqemZraGs1d0crSzJQ?=
 =?utf-8?B?Rm1ocUJ5NkxmeEZ5bEJLQUF5WFJReTVsQjZJKzRqWW1KMDgwQlRQRkRnbUoz?=
 =?utf-8?B?M1Bmbml3MVlEYUFKNmhjVUg0T3pnTU1IelVjRnNnMDkwaFdqRURIenBXSHVl?=
 =?utf-8?B?MDNxbSt6bTVEWVVPRVJtdzRSdU5XQXNsQTFJc0x6eUU5c1FydjJRN0FiQk5G?=
 =?utf-8?B?Z0ZUMUpVSTE1T0xocGlvTkRXaDQ2LzQ3aHoxVGdjSTd6UjFJOWJYSk4wWXky?=
 =?utf-8?B?TmZQZSt3cjFPZ091TDlzbUZmV0o2dWNSK3hZcEFnNy83SERwMmZRbm80T3Z1?=
 =?utf-8?B?Mk5TRzU2QmhhWTdyM1FDRkU0dG1TUXJOdnJMdklKM216NE5DK2FYM29nOGs2?=
 =?utf-8?B?SzkvbFNqQkRjR1p5c0RwYnJEUnJOZ2ZjRFJHTUM5VnR4bGNjU3BYditLMG11?=
 =?utf-8?B?elpRd3JHeHdvVU05dlFsMzhXMGtEQ0JiNFg4YTIrVDV5QVZjVTJSYUxTdlFN?=
 =?utf-8?B?M215T3gwOUdmRUV1VUl2aFVTRFNsdUNaZlB1b2dKZVR6eit2cnppditWYWZQ?=
 =?utf-8?B?Tm5hTWxONjBQb3pUL2hrb0ZNZ043YmFFY1RranlGRTk3VnRMNXVSUHdrcnV0?=
 =?utf-8?B?RExPbEJ3TVpVWi9LRU5VcVNUbHZhVzhzb3JRdnUwcmY3ZU1rd3RJdWFZTmk1?=
 =?utf-8?B?SUhwWDcwcEFZVXRIT2VoVS83RXk4OXZhd3ZhYm1kQTFRWGY5bmJ0L2oxQm9W?=
 =?utf-8?B?K0MzdjRscDMxYzE3NnB6QlJJbFFwUFljUDU2cGYvLzNzemdVS09wS3FBYno0?=
 =?utf-8?B?WEE2dVRFTzFBa1ZEVWQycXYwMkh4bUF3T1BockZ6REZzYSs0UXpxWVRXS0Mr?=
 =?utf-8?B?V1JQVHM5WVNyTWFKS2lZNFg4b2dWUWJxQjh5cW81SmZseWpkRWZrUS9YVlZl?=
 =?utf-8?B?QXBHU2VBS1JSV2swcm0zMlhvMnVNQnR6aFdOVncxbEpFa2FtNlQzc2JUS2hU?=
 =?utf-8?B?eE5BWTIwa3ZFYnJEN1Nvd3pzbHhSb2tGamtwTVgzVDVnL2hFc2Y2TFZQeEJx?=
 =?utf-8?B?UjIzcVBWZTVMNEdJVnZKeG5oczBzZVRBeUMvL0FRUFdOTFEvdGxKTG1wWUxp?=
 =?utf-8?Q?+bSVU/NdzZDQ4ZrsBxWmyPrbbo6NAP070JXlBWI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b8d33d1-5a39-4574-9119-08d9922ccc07
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 11:45:35.0055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+qW3r9yetBsw+OpQzXdKbymXX37arRcxy6MMNSu3636F0YnULCcK4fX/+iE5J9Z9pRaIH7lQG9dmu0gWisI7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4220
X-OriginatorOrg: citrix.com

On Fri, May 07, 2021 at 10:40:34AM +0200, Jan Beulich wrote:
> This is a partial revert of 540d911c2813 ("x86/CPUID: shrink
> max_{,sub}leaf fields according to actual leaf contents"). Andrew points
> out that XXX.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Obviously the XXX wants filling in. So far I did not really understand
> what bad consequences there might be, but I can agree with the undoing
> of this part of the original change along the lines of why the Viridian
> side adjustment was also requested to be dropped (before the patch went
> in).

I have to admit I'm confused about this. Here the maximum leaf
reported only changes between PV and HVM, but never as a result of the
features exposed, which I think should be fine?

Ie: I recall the problem being the maximum leaf possibly shrinking
when migrating, but that's not the case.

Thanks, Roger.

