Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3814A408F
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 11:56:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262948.455433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEUMX-0002lx-Uv; Mon, 31 Jan 2022 10:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262948.455433; Mon, 31 Jan 2022 10:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEUMX-0002jD-Qz; Mon, 31 Jan 2022 10:56:45 +0000
Received: by outflank-mailman (input) for mailman id 262948;
 Mon, 31 Jan 2022 10:56:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ytUN=SP=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nEUMV-0002j3-VS
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 10:56:44 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77c5a787-8284-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 11:56:41 +0100 (CET)
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
X-Inumbo-ID: 77c5a787-8284-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643626602;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8J72P5LxXaiPqKAIOG2XyaAbrXVf+A6AhTFS8TeSYjs=;
  b=AyDoeOvlGuTXbaHSLstPu7EvFrV9JolKvoqdavkXAEGYAI0u9BvmhREl
   WGT2YLDeM971/sIxUolrCIN0aB4bDaE2kPdtz5zYvEGl1Wk8UtoacGHcn
   ag75EzFWwLJMAT3b9cYl7Oy+Knq4JOEgs7x5BuoXstILSqpiWHJrV5m+o
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: s8KAeqLX1lM8cFmks4HZ2jtvIj/T6Mq28fF88jGQg+WFCHPHQGdoClz5SRiJzS++FeKgzHDBn9
 mcF/47njaLufyzGpkYdsZQEiOipxYfHTREMM0bz/k5kNVOoaMxhRwbquxCymdja8GiGqjMkppC
 px49ECVN3YAdfCKiVczNq+BnWiHATtjfZpag9SffHfaVwPvJQ7qKkE9TJVUP2FGS3AMHl20y0i
 w8+rEzH/HOAzBxCZyC+Pm3934pqUiwigqUBaLa0ISnymvnRAKCS2qPHrcncKNB0p7fSh4ZcTD9
 pj/k2J5rnrtJXQTQZ48MbaUo
X-SBRS: 5.2
X-MesageID: 63520410
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:JWzkcK+dIDu1axvYCcMBDrUDtHiTJUtcMsCJ2f8bNWPcYEJGY0x3y
 TMYWG/VbqncYWDwKNAib9628xlUvsfRyINlHlRqqi48E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7di29Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhO6
 /ZHtMacYD4lBa2Ws+8xfQFqLw5HaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGh2pq3pwXRZ4yY
 eIoWzRGVEjMSSdTOwkSN6pjoLmDhnzgJmgwRFW9+vNsvjm7IBZK+LrnPcfRe9eKbd5IhUver
 WXDl0zQGA0XMeu62DWM83+yruLXlCa9U4UXfJWg/+NuqE2ewCoUEhJ+fUGyoeS9zFW/Xd1fA
 0UO/2wlqq1a3EamVMXnVhu05nuNpAcBWsF4Gvc/rgqKz8L83QGdAWQVSy9bX/YvvsQ2WD8C2
 0eAmpXiAjkHmK2YTzeR+6mZqRu2ODMJNikSaCkcVwwH7tL/5oYpgXrnadJuE7W8iNHvLhj2z
 yqXtyg1h7gVjskj2r2y+BbMhDfEjprUSg844C3HU2Tj6Rl2DKaCY4Gr8lHd4ex3EJeCTlKBs
 X4HnOCT9OkLS5qKkUSlW/4RFbuk4/KENjz0glN1GZQlsTO39BaekZt4uW8kYh0za4BdJGGvM
 BS7VR5tCIF7A1iJZ64tT6uIB/8ql4PrOfr9ZMz7V48bCnRuTzOv8CZrbE+W+mnilkkwjK0yU
 aumndaQ4WUyUvo+kmfvLwsJ+fpyn31lmzuPLXzu50n/idKjiGippaDp2bdkRsQw9+u6rQrc6
 L6z3OPamkwEAIUSjsQ6mLP/zGzmz1BmX/gaSOQNL4ZvxzaK/kl7UZc9Jpt6I+RYc1x9zLugw
 51EchYwJKDDrXPGMx6WTXtodaniW51yxVpiY3B3YAb3gyh9MNr+hEv6S3fRVeN9nACE5aUsJ
 8Tphu3aWqgfItg502l1gWbBQHxKK03w2FPm09uNazkjZZ9wLzElCfe/FjYDABImV3Lt3eNn+
 uXI/lqCHfIrGlo+ZO6LNqPH5w7h7BA1xbMpN2OVc4Y7RakZ2NUwQ8AHpqVpc5hkxNSq7mby6
 jt69j9B+7GV/ddpoYaY7U1Gxq/we9ZD8oNhNzCzxZ69NDXA/3rlxolFUe2SeivaWn+y86KnD
 di5BdmlWBHetFoV4Yd6DZhxyqcyu4nmq7NAl1w2F3TXdVW7TLhnJyDej8VIs6RMwJ5fuBe3B
 R3TqoULZ+3RNZO3CkMVKSokcv+HiaMelA7N4KlnO079/iJ2ouaKCB0AIxmWhSVBB7JpK4d5k
 /w5scsb5lXn2BonO9qLlA5O8GGIIiBSWqkrrMhCUoTqlhAq2hdJZpmFUn3655SGatNtNEg2I
 2DL2Pqe1uoEnkebKig9D3nA2+ZZlK8ighESwQ9QPUmNl/rEmuQzgE9b/wMoQ1kH1R5Aye9yZ
 DRmbhUnOaWU8j50r8FfRGTwSRpZDRiU90GtmVsEkGrVExuhWmDXdTBvPO+M+AYS8n5Gfygd9
 7adkT63XTHvdcD3/y0zRU869KCzEY0vrlXPyJK9AsCIP5gmej600KahaF0BpwbjHc5s1lbMo
 vNn/booZKD2XcLKT3bX12VOOWwsdS25
IronPort-HdrOrdr: A9a23:j8qBaK5S7aMrJTNtPQPXwVKBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc6AxwZJkh8erwXpVoZUmsiKKdhrNhQYtKPTOWwldASbsC0WKM+UyEJ8STzJ846U
 4kSdkANDSSNykLsS+Z2njBLz9I+rDum8rE9ISurUuFDzsaEJ2Ihz0JezpzeXcGPTWua6BJc6
 Z1saF81kSdkDksH46GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 T4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRsXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqrneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpn1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY/hDc5tABCnhk3izytSKITGZAV3Iv7GeDlMhiWt6UkXoJgjpHFogPD2nR87heQAotd/lq
 P5259T5cNzp/ktHNVA7dc6MLiK41P2MGfx2UKpUBza/fI8SjnwQ6Ce2sRA2AjtQu1P8KcP
X-IronPort-AV: E=Sophos;i="5.88,330,1635220800"; 
   d="scan'208";a="63520410"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfST2g3moNmfpZxdepccu1A/1rUv/Fp67au/MVMhDSFYiM9qLK3YfhX5dnD76rMUX3frsMFc/ubLJMYzIXnLgCG6VdSYozmvXTLXYc2IqWF534XCIQ0Qi7+8BwYl2xhDc8bi2w2sPu8G4WUu0v7ea7nNvNi0NM2FdskGrszjULjDvrzjiobFDU9mZ0t6svpekMz0ohAtwDJ0qmatJrhTmQ3K5Je5HNSJsnfdT/4izPyg6cObDQXvvjgi1M/XHPUymAqb9yPsJZ5SPiLtcEStZkmPLLuMIRrG3aftL48v7Pd/yeR9e4EHuc+6Y+Q4SdStBljKmqEJrkbobYymb8E07g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+p+mpPH78GCxBYh8Q/sD+9whxnn1yZCYPXCGEANxWQ=;
 b=XNvqXThRxAN1i4UQnqGVu36hfxTjF89OzttrBubqNDpWIW5XSXYdzRNMB0KPcsUUc0raZJKooAVFG8OJfpx6hmKyjoCbCY5nzlPAKEZvAhmR6e+s/5GO4q8u8rjZG+c1FJPA3ErydlHs1ddPfVJGy8bLQVFaj/pbnCgLyq/ypJaoDQvnfR7H8Miq8x0nJDCDrihW8zqMLPGzqlkpsuIZ8MFgel847WUlWMF4VsqRTkErou8gGU8WoQUZwh9PVSluzJFc6/xtOL7AoiBAw2E7QrecgkjwujDIayJkeUA+qAQ+WTbBqPI0XJoDFI8niAfAxn7Rc1ymq8PPA6W2O3fjww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+p+mpPH78GCxBYh8Q/sD+9whxnn1yZCYPXCGEANxWQ=;
 b=UV+hNGBekN7qrP0bwA/mOsH41MGVBSseXi3JtW77m7Bt5IuNGSz09CzpfNpPeTaGZTViexz6cjqq/18w9mRIyHwc9qlj0hCjncSuY20cdOocccWc1fZznNk2XGKFcFPgoUaUpz70+yMPt2hs9kcldxVpAtadkBhPteoTKm8LjzQ=
Date: Mon, 31 Jan 2022 11:56:27 +0100
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
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Message-ID: <YffAW/XzNdtGbCjR@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd8RJfpEalnfl+CC@Air-de-Roger>
 <d493b022-3c78-1721-e668-48f4553056a9@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d493b022-3c78-1721-e668-48f4553056a9@epam.com>
X-ClientProxiedBy: LO4P123CA0348.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25954b71-149f-4487-a2eb-08d9e4a85753
X-MS-TrafficTypeDiagnostic: PH0PR03MB5878:EE_
X-Microsoft-Antispam-PRVS: <PH0PR03MB5878A339C41B85514CA731C48F259@PH0PR03MB5878.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u4H0+TZBruQ/GwT4oBgSozenxXE3Ok6Lrrii6li1pUp276ij7WQZli5FiNhjZsydBAs74ontfp3gXRAj5oroekgi9Y/rCOcxkyX/SqlA7tk6Nq9ZK53d6TzVG7Z+TtkecUWDwUFZ9KK7DRnpQnBtNE605EzsNpGUPUZ1mPfvn6Lj9s9raABZa2pgtIGp65+cPghbW+0Wv8nn9q1u2cKmMpFhp/zXhqJSar4pTGfV4LGX17VpoBL03epB/h7LYOdVWxzlROmdKOwSe9YUVomhACDB3IQPIzaucx4GzgqbA2bHUFyJB2Fm8Hf4mkkun3oETonc6GQwnWpVEqnkKbz/sui99kfEv9R56EAspDRIRNgAlcFuCJ6b8dNYJYscxGJGxA64ThNqkhHGhwXPll4ssFw6h7dcYSxu503hjHrtTVXP6aXmQd9q7iHQ1m9K3hgtiDFuY/+nqE1/8yDIMORgqIzSrh6Y0dwG5OZCyT8lJgbSs0fNHhx2wy+mZNCskE+CL7DQLKp2RtADQXtqmBOTBumMRtzX3rik5O/5MmFy+rYSFay0Y+13gH/vAB+NBHFOkdjrahbC77JJKOr7ywGx1N/9sdMhNo0S7kdxQjPjnO/PbzYgx0U3phjin/qISNxpRL57HirjZQm22CkZ45/WqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(38100700002)(86362001)(33716001)(82960400001)(66476007)(8936002)(66946007)(66556008)(6666004)(8676002)(9686003)(6512007)(4326008)(53546011)(5660300002)(6506007)(508600001)(6486002)(6916009)(54906003)(316002)(7416002)(83380400001)(2906002)(186003)(26005)(85182001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emRwaVRDVnVMekxFcjVKenNZUm9zM3RlVzlidmRPTzhBZlowWnJXSkF4VFZn?=
 =?utf-8?B?ajF2UHBrb0RlaUttRmQ0NWVqTkVVcjRlTVNscFZnU1M2cU5mOENoelZsQjk4?=
 =?utf-8?B?WFc2dkdFUDRCMERhcXlkWU5zNFlDM2VYcVF4TWszQTZNTUhmZXZIK21lWkJj?=
 =?utf-8?B?UG9vdWNsSWhJWG5mdS9XRUFhb1hsZktEUC9Ed3UvUGdETVNtajQ5dzhyaWxT?=
 =?utf-8?B?RHZMUkhOSnFTSXN2MWRTQVFWc3RFSkszU3FaUlFmVldvclFTWmN1dEFhMWdK?=
 =?utf-8?B?MWdOQnRMem9KN3kvMmt3RHJ3alY5cGpRakNzTnNOUmM1cEIrWDh1SzhKQzVU?=
 =?utf-8?B?MjdCVm9kM1RCMnBXeVk4aFUzR3YrMS83WmtRR2FaZTJCNHlQWnA2VnAvbDB2?=
 =?utf-8?B?enl4dTkxVXdjWDlBY0VCc0FmbjZ2MGkyU1lsNzA5RGFvazRibWZHUnZYQjlI?=
 =?utf-8?B?WjVJa0hIZUtSdVBhTFpRdWZhM2drREx1Nm5PblMxZXQ2ZHlpRzBpRTZPQlFO?=
 =?utf-8?B?ZjE0emxnc1hBWUg4bUY1VjhHVnB0dEpRRnl6U2VIMm9DUDlmRTFzakx3TmZu?=
 =?utf-8?B?blNkeHZieFZRTVRLKzA5c2lxbmVuak9SVkdqMWNPejNyeU9lOU5pa2EwanBK?=
 =?utf-8?B?WnFDbUU0L1hIRjNJaS84c0FHQVZhUjI2ampQOE95ZU0rTGQxOW5ib2Y0bXFz?=
 =?utf-8?B?NlRwWU5vTUxIUzhScTdpK1hvMTh0Y00rUlpQWXNRUlgxY1VqTU1XTU5CWkFX?=
 =?utf-8?B?TFdIdU5VdHhYby9WNzZjbmdkZlV2bnYxSWszNXBqdHY1VXpMeU1MYWxZM2s5?=
 =?utf-8?B?aFJxU2xjTVBQb0JyVHlFc1dXaXRTcmEyY2k5bUY0VEtlUnE1b3UxM295WXFw?=
 =?utf-8?B?bm56ajBGU3dyaVliWVZGMjdXQThLdVBENXpVcTdTWVpnUUFJK0V5cERzUW1E?=
 =?utf-8?B?WlpWN0ZpeGdyWmt1UFlGK2JRcllvbHFlcTZZL1dnRjhiMjNrT2VnbklXZmtx?=
 =?utf-8?B?RVFWNmgrdnBCSTkyVlJRbVhOVUpsMEdodVI0dXM2bnVtRVg2M2JtSlR0Yk5B?=
 =?utf-8?B?YXNVYlNOdzM0ekRFZTF2QlRuRDJ6eUxTYmxsaHp4SzZBa3R5T3EzZTdaNnJP?=
 =?utf-8?B?RzJUSjkvQlRvL1FpY3dmTllIdUd2TTBVUlM3WmR3UU02Sm1lUE9CQzNmMitu?=
 =?utf-8?B?RiswNlYweUs4VDJHTGkzTWJuZ09UcEZTdk81Qi9hTUFEQ3JMWUpzYlUza0Mw?=
 =?utf-8?B?cHk2VmR0UzZCbXljK0VlcmtQK1o1RkZ3RjJwYWNQdHYvSENXV3ovWm9BSHh4?=
 =?utf-8?B?U0hTNE1uOTBrSHNKTmlQZlBZSDFNN3pod3hMRGtrV2NYaWRuVy96Tnp6ZUEy?=
 =?utf-8?B?NDJHakJXQlBUTjlVZFJjbXNKOHN5Nkd5bDBNeUFtNmZhOXVkeUhqWFJHY3ZR?=
 =?utf-8?B?aVZoc3QyU1dtMnNHRjk0OFV2S0cxZzV3ckdIZGRhbndLdTJJaHlKS3JlZHBD?=
 =?utf-8?B?ZHhKWXlKSWRaR0M1aXltSWR2d0FEZUo2U2RmY2ljNGRzd1BwdEJjcWZkQzBn?=
 =?utf-8?B?SmNQZHFCTWZsdGtvT21vYUNWQVJWUDFlS3pOeEVJY1NRSnlONkZOMW00MFVy?=
 =?utf-8?B?dUsxT2twbHRsOGk5MVA0MWkySE1ZdWFvclF1TnVMOGRrN2dMV0lkUEpBRktQ?=
 =?utf-8?B?YmtSMHFmL2VVRy9nWGxiSkdKa05zaU9zS3F0d2ZQZCtSalJWTHRnblpZUUhB?=
 =?utf-8?B?OG9YRnYvYmx1ZSt4aHNGT2VyOGV0Q1F6UndmZWlLdkxCZFhudUxnTVAzekFq?=
 =?utf-8?B?OTlyNHFNR1pSd29ZSzJ3bjNWdWE2Y0lWSHlaZWhuZ2NXTUVpZVV5T3BFRGlB?=
 =?utf-8?B?anBuMlBkOE5WZHpDQ0YzYzFZSS9OTEV0UzBhZEgzQWx1VnczbGpVdTQ5VXB5?=
 =?utf-8?B?dnJkQkYwbjN6OEpHeUhaWmhhRjFTUldWNFNGRTNiUjZZY1lSNjZkWEJGTURl?=
 =?utf-8?B?ZU1SOEpqRGMzZ2x1ei90cnlPZUtIRWIyeGRRS05CMWRHSFQ0Zm4vSjJ5OUNM?=
 =?utf-8?B?aUxnZk9uWDRYZlMrNmoxSS9qWHFRMldpb0l6U3ZKYzJiUUZqTHNLSm1CT0dw?=
 =?utf-8?B?V25ZNU1VNGdUWmQ3VFU5bEl3OHNFbDNIUzd1ZWUwY091MWlPNENNR3d3dzdn?=
 =?utf-8?Q?+RAnmURYbS+cs7ve2RMZJvk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25954b71-149f-4487-a2eb-08d9e4a85753
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 10:56:32.2872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UMQa0PTt/I/ohBp2C0NtcjNS8aHEJ1Wy79LmV69HoEVOE6JCehjiPsNk6hfP8eLlx7/mGPLWqw9kVJOh+odyhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5878
X-OriginatorOrg: citrix.com

On Mon, Jan 31, 2022 at 09:53:29AM +0000, Oleksandr Andrushchenko wrote:
> Hi, Roger!
> 
> On 12.01.22 19:34, Roger Pau Monné wrote:
> > A couple more comments I realized while walking the dog.
> >
> > On Thu, Nov 25, 2021 at 01:02:43PM +0200, Oleksandr Andrushchenko wrote:
> >> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >> @@ -569,8 +625,10 @@ static int init_bars(struct pci_dev *pdev)
> >>           bars[i].size = size;
> >>           bars[i].prefetchable = val & PCI_BASE_ADDRESS_MEM_PREFETCH;
> >>   
> >> -        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg, 4,
> >> -                               &bars[i]);
> >> +        rc = vpci_add_register(pdev->vpci,
> >> +                               is_hwdom ? vpci_hw_read32 : guest_bar_read,
> >> +                               is_hwdom ? bar_write : guest_bar_write,
> >> +                               reg, 4, &bars[i]);
> > You need to initialize guest_reg to the physical host value also.
> But why? There was a concern that exposing host's value to a guest
> may be a security issue. And wouldn't it be possible for a guest to decide
> that the firmware has setup the BAR and it doesn't need to care of it and
> hence use a wrong value instead of setting it up by itself? I had an issue
> with that if I'm not mistaken that guest's Linux didn't set the BAR properly
> and used what was programmed

I think I've made that comment before realizing that all BARs must
start with memory decoding disabled for guests, so that the guest
firmware can position them. Using the host value as a starting point
doesn't make sense because there's no relation between the guest and
the host memory maps. You can drop this comment.

Thanks, Roger.

