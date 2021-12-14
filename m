Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3618F474593
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 15:51:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246798.425608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx994-0000ZD-W3; Tue, 14 Dec 2021 14:51:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246798.425608; Tue, 14 Dec 2021 14:51:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx994-0000W3-Sv; Tue, 14 Dec 2021 14:51:10 +0000
Received: by outflank-mailman (input) for mailman id 246798;
 Tue, 14 Dec 2021 14:51:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xzzU=Q7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mx993-0000Vt-H4
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 14:51:09 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43e82e91-5ced-11ec-85d3-df6b77346a89;
 Tue, 14 Dec 2021 15:51:07 +0100 (CET)
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
X-Inumbo-ID: 43e82e91-5ced-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639493467;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=5oNuD8VEQyPv7E2WfZtUh1Bwtr5EvGJs0byCK2iECl0=;
  b=hKruE+SO6+iD29K6P4h9wFwkZfJlFFbFQeaeDHZqdnb2SV3JFJLFn6IM
   ZiA330Cw1XBTYVaaOltp1fJusvx8jYiTv0ta7CcZwabWtdk6CNfEpDp+0
   5lUsiG+EBxPp9gvIS3ur/qcPSMzOzHHlZfE9/ErkLvDbTlDwXvLi7L/KS
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UkQmCFYnl6IiGcfpPtWcVS1jJ2WAswybIn7TyCydSUt9YM+FEXgLqIjfDxgY4aS+rrfG1kxq59
 TusqESE1uegOKCzxXWElSjzJbwQA9OslvnkqToI7+ki31TaIDgRWLaWNSAWsLDb7rqjzbC+a9+
 l4q3TRtrgogSI0ATMj7XNwA953JCINmbF1uvDNxC37kLbA1prtg9v7W13h1ECysxDeu8qUQoYq
 Dzi3x+RNdwhWZ0fgJPtDcrDGfgWAaZ3fUuN3sN5jt1CgFOb8ACXSS55CIVB71isSzf4MpUD51U
 aN2iYPprfYAHJx66DTa5pvZj
X-SBRS: 5.1
X-MesageID: 59490827
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:CGACSqhSvDJATECFT0oqICKQX161lxcKZh0ujC45NGQN5FlHY01je
 htvD26HPquMZTT1KYhwa4/k9E5TscfdndFgHAtt/CA1F3gb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rg29Qx3YDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0W6oG2ZxcvLJfyxugSUAcICy9FHqBvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t15wfRaaEO
 KL1bxIodEzAO00VFGszJ4NhwOOK2GjmUR9x/Qf9Sa0fvDGIkV0ZPKLWGMLcZ9iiVchT2EGCq
 Qru/GnnAxdcKN2WzxKE9G6hgqnEmiaTcIAYGaC89/VqqEaO3WFVAxoTPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsg/IHc4MOSatgsljLk/eKpVbCboQZctJfQId5qckYVTo47
 GHXk9zqG2x3voa2RFvIo994sgiOESQSKGYDYwoNQg0E/8TvrekPs/7fcjpwOPXr14OoQFkc1
 xjP9XFj3OtL0abnwo3ipQif6w9AsKQlWeLcCu//emu+pj10a4e+D2BDwQiKtK0QRGp1o7Tog
 ZTlpyR8xLxeZX1uvHbUKAnoIF1Pz6zaWNE7qQQwd6TNDxz3pxaekXl4uVmS3ntBPMceYiPOa
 0TOow5X75I7FCL0Nv4rOdvpVpp1nPiI+THZuhb8NIUmjn9ZLlDvwc2TTRTIgzCFfLYEz8nTx
 qt3ge7zVC1HWMyLPRK9RvsH0K9D+8zN7Ti7eHwP9Dz+ieD2TCfMEd8taQLSBshkvfvsiFiEq
 L53aprVoyizpcWjO0E7B6ZIdgtURZX6bLirw/FqmhmrflA7RTp/UqCJmtvMueVNxsxoqwsBx
 VnkMmdww1vjn3zXbwKMb3FocrT0Wphj63k8OEQR0ZyAgRDPuK6js/UScYUZZ74i+LAxxPJ4V
 aBdKc6BHu5OWnLM/DFENcvxq4lrdRKKgwOSPnX6PGhjLsA4HwGZqMX5egbP9TUVCnblv8UJv
 LD9hBjQRoAORlo+AZ+OOu6v1V64oVMUhPl2AxnTOtBWdUi1qNpqJiX9g+UZOcYJLRmflDKW2
 xzPWUUTpPXXop9z+97M3PjWo4CsGup4P0xbA2iEsurmaXiEpjKumNYSXvyJcDbRUHLP1J+jP
 egFnevhNPAnnUpRt9YuGbhc0q9jtcDkoKVXz1o4ESyTPUirEL5pPlKPwdJL6v9W3rZctAa7B
 hCP991dNenbMc/pCgdMdg8sb+DF3vAIgDjCq/8yJRyitiNw+bOGV2RUPgWN13MBfOckbtt9z
 LdzotMS5iy+lgEuY4SPgS1j/miRKmANDvc8vZYADY630gcmxzmuu3AH5vMaNH1XV+hxDw==
IronPort-HdrOrdr: A9a23:LCnRpq0/8ejosw0IjEp4jQqjBRpyeYIsimQD101hICG9Lfbo8v
 xGzc5rtyMc1gxhO03IwerwSJVohEmsgaKc4eEqTM+ftXrdyRiVxeBZhrcKrAeQZxEWmtQts5
 uINpIOeeEYbmIKw/oSgjPIbOrIqePvmMrE6Ya/vhMdKj2Gc5sP0+46MHfkLqQffngFOXNTLu
 vm2iMznUvcRZ1hVLXAOpBqZZm7m/T70LjhbBI6GRhizAWVlzun5J7WeiLonis2Yndkx7ovzH
 bCqhf+7Km4qf23oyWslFM7264m3ecJh+EzXvBlRaAuW3rRozftQL4kd6yJvTgzru3qwFE2kO
 PUqxNlBMh342O5RBD+nfO4sTOO7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBVys
 twrjGknqsSKSmFsDX25tDOWR0vvFGzu2AenekaiGEaeZcCaYVWsZcU8CpuYcc99RrBmdIa+d
 RVfZ/hDbdtAAynhknizzVSKQmXLyUO9hTveDlIhiXa6UkW7SVEJ41x/r1aop5KzuNOd3B+3Z
 WyDkyz/Is+CPP+XZgNQ9vpCfHHf1AlYSi8aF56cm6XT53uzRr22tLKCItc3pDiRHT+pKFC1a
 gpFmko6FIaagbnBMrL25tQ6xjIBH6wUDT3xstCjqIJ44EUdYCbeRFrYGpe5fednw==
X-IronPort-AV: E=Sophos;i="5.88,205,1635220800"; 
   d="scan'208";a="59490827"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZjZrkjRatDlDohwGylIluDSOSoogiy+doVla7+zn8wNN+ZR5o7Ql+nI7JOBYXDYb6RkgnQveCVfwxRwvNOqfz7qGDo8vKu95hEatVyTk6AfvZO0DjZMIUbd3l39Z9ta4R7UChu0MB6r7LHNja7Uq2yxk8Xqov/SCMl8KvnN3VjWBTWBdSjOQ6vvkKiAYP7G8RzQbqmtBUqvzoXqZ61pJ3q1Vzeo+nX41hxpFrr4KVn0Ho82g5qyQBBoZF8kUjRZ7XDV224rdYoh2Mc8kT25bA+x4ALAnGcTMM1jeCkFRsVPxftNW/3atXfhNiUB1iy9YgCtDx/qpiKWZJoQ537vK2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5AwfmST6IEJAWwXeNpOUO0xK1o8sx/l3Wpo8ECsrhQ=;
 b=DEP++/jlI03qBoLXjQTDYgqi5VkuqaTzEehNIhRNJ61Gfno1GhJik/RVWYeAYnDfgXWZKpHepGnN5a3q8nNcQOoWmY5GE7AZeno5IXJvSo9yOp/zmsEdxcuM1qwcy3d2mctaNxz5nocOj+ygRKtE8JVkv9Ivf8QAF3y+BSuawKTs9fmDvMtiaFhukZFl1TKEbcrJxzKR/f8OePZPFVn2/fG7zxqDLq/i5nFzLNTmvgBbRYCiT0NhPMzXeUtbNb+C4TbvuDvFzhOCXZ7YmuqlZ1li7cHll4Brg/XnQT3WODYMn67AJ2dWedYFGHrs/s5UtXhrstfPXYMziD5YODUSnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5AwfmST6IEJAWwXeNpOUO0xK1o8sx/l3Wpo8ECsrhQ=;
 b=aYmJDwggVSoQVYKnkb7bsV2XLy6Frb1n/Q4/apiVW7LxVNq5xA7APoAHJPuovxbFdS8MFpzrPf4vOQhRxKLyF94a1ByG6FVw0SSIKSuzkLFTplPiKr1HWdNsETnbU7LgNZpNVUczw4U4ZylDxHLlYBywjrzja0mnfV4niMYrxYw=
Date: Tue, 14 Dec 2021 15:50:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Kevin Tian
	<kevin.tian@intel.com>
Subject: Re: [PATCH v2 15/18] IOMMU/x86: prefill newly allocate page tables
Message-ID: <YbivUH/Er0o2PwsG@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <2656844d-47cc-70c3-d7ce-7d83967d576e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2656844d-47cc-70c3-d7ce-7d83967d576e@suse.com>
X-ClientProxiedBy: MR2P264CA0174.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::13)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdf67072-7f00-4909-dc34-08d9bf1125e0
X-MS-TrafficTypeDiagnostic: DM6PR03MB3481:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR03MB3481CC0A225EEBAB5F95517B8F759@DM6PR03MB3481.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 50tw47/arc+1U3CMZibCDAG01kjZJHBCURX5mbFszuDtSteHkE5xcQEB1cbmZB6hdmhi+e+a/Ve4XLfE+O3wzbVXFMCie/5P+z8udnyvQ1PB0uW7/7uLsYaRPy8KubS8dIyraNNELlVhYLd01sxEAAtPRndcT1Ek+BlnpijhdL5Pw2JBHKCXoT4aaMGC11M2pClDiOY1Yv/rO8OtXLypgdTqtDRsrTYHViZemzH1vouBtGjUXPMasz+/mL//YxC8Y3CXzgaCjSElroFOJkrc+VzddJxF8RqoSQc2UDyQaUT41q2pbo4RV9GzbEVUQ7YkJN6efpL/yQAaehir6RkgpaGrAaShe3RXtIpKJ00L45mzqsrO+u7eZeJSgU6KDi613j8KmTzbDHAjxc/s+wHcNFrKgXTyXwID7sknmV17UpxJMj5d1QGLLFwkEb+MDTOYPHKIFhBSz07CgVRLyLirSyvq/ptDv8BNXxeHwFBCwkHBh8RJ9OArDeyXdz90YjqvZJUJMFOdNVtXOGQUezcd03Pg8f4GjtkIivkCqFmmHmCUa+NWdKOBJey4l3hLkXJeJsYNeqX+OlHmEsyD4QOzCaJn42Mw7wuka1uAXSw4KBe7amFrTLrkpPDltUClaeFSRYpVGGhBRWCPJ9JgELArQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(316002)(54906003)(83380400001)(6506007)(38100700002)(508600001)(8676002)(186003)(6486002)(5660300002)(66476007)(66556008)(66946007)(4326008)(86362001)(33716001)(6916009)(6666004)(85182001)(2906002)(8936002)(82960400001)(26005)(6512007)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0d2UzJoRUprTGJXVGRUek5qaHVUSjBKZXNqRnE5VWxzZ2x6WVBTYkdxM2hR?=
 =?utf-8?B?eFZjUCt2ZGdwMG5GVDhsYmZHUy9rc3AzT3MwdG10WG1lTWQxYU5US1piTkht?=
 =?utf-8?B?Njg5Tm9NSHdmNEFKN0c4cmJFZmtOQTd4MTVaMjZDSVhvUlZvQ3ZSZHlTUXBS?=
 =?utf-8?B?d0t0UVk1Z2NJZHFldFpFVll3Ynp3cFJpMzV1V3FVdFdRRlhVdjcyY1VpbjBK?=
 =?utf-8?B?Y0IyNVJ6VHh6R2RVYnFQZG5CbUNWMUlqK3ZMMWhUTEpwVCtoMzNiWGFRV283?=
 =?utf-8?B?NkpVelg2YjZUNmRGNGEwQXlXZFBBTHdvc2NoOHJYREhqMjJlSGIxanFrQXFo?=
 =?utf-8?B?MmNNWnhBVkp5QUxhNWJGSTlwU0xDWmlOdlZyNmh0RjEzYnN4TlVRVE5NRmtB?=
 =?utf-8?B?V3lFbGZqWDdDOGc1Y3k0K2dkcnhYVTQxRTNLWkdxelE5cDFnYmhtN3loSDZV?=
 =?utf-8?B?NGk1V3FwQS9xcm5LYUNXWjF0YTBpQTlTdVd1ZUNUai9veW5ERnNwK3NvbVp4?=
 =?utf-8?B?Sit5aTFoTkRLcUhyTVJNN0JLb3ZIdGpCTHNKTzJTNWwvbldCQ2FhQ3pRMGxR?=
 =?utf-8?B?NFpQd2hFZjFVYXI0RDgwdm9UKy9YMVpIZzVVa0FPd3p6YVpCVUo3K0lCd0dU?=
 =?utf-8?B?R29ZWVVPNjd6T1dYMzZxbFZxV1pib29DZnFDYU14NHpTZzhnWUQzMVRKWmFC?=
 =?utf-8?B?VXduSVRadDFtczg2alFudWp6TERNWEZtdVdDNEY5RmNyaS81cGU2K2Jza05G?=
 =?utf-8?B?Y0UyN3FOUS9uRHpOOVVQZmR2VENaNUJrQTFzUElJRVZqNmp3N3FobktudEVn?=
 =?utf-8?B?UG02SG4xeDlxNnhBUTFSUm5lcTVvS0tSOFNJSXVvYnI5djBCZmhXVkxtL1FX?=
 =?utf-8?B?S0pPQlU0YmlyMUpMTzdhMHMxMis2cjIxR0dxZERZRDkxT3N5UXdFQTNEYU5S?=
 =?utf-8?B?dkVHNkFsSkljc1JoczRhaXlqNTJHNEhIMkQwTE9sbTAzNXQ1V3FWYnlJL0pv?=
 =?utf-8?B?b1ZEbklpZUlRcDc0OWlrelV5WmdlWUZzanY0cjcxNzRKMXdTOTZDSmVxMDk5?=
 =?utf-8?B?bjhMbklVZHo1eHU1bmgydmNhWGQvOTlwWDNlNlFVMGMxb1hmQyt3aFQyVUNt?=
 =?utf-8?B?Z0FRbUxLeWZReFRsMUk1U2tnS0t2ZXM1c2dHTk9RNldXN1dKVGlJU0IwTmJj?=
 =?utf-8?B?V0hQNC9kNUZQK0Y0bVZLdmh3Z085UGFyQWFjejBXR2M4bjRtWWRKWFVBbTVk?=
 =?utf-8?B?aWJBbUZGQkcxWjZrV0QrS1l3R2ttYXpENmpSc09kTHpHZE55dlk3bE1lM0Fu?=
 =?utf-8?B?VHhzY0Z6aWpYSUc2SDUyUmJzeTgxMlJ0SmVkSnRXMEtvaFRoYTYyVW4zOFJi?=
 =?utf-8?B?ODdXU2U4WklsZmRCUjZEeTdsc1RvM1VST2xpaEVkOHNGb0pDZWJ4RlFBaVYw?=
 =?utf-8?B?VGVjVW41TlU0U3RWWDZackxsUEFhVERkeWF5YkJxZ3ZjWkV6dEF1c2V6VkUx?=
 =?utf-8?B?bUo1OTlqNjZINDFydHV2dFFlY0lUZlBwZnNJVUdJcjhKb0tIWEFNYUJjMk9u?=
 =?utf-8?B?V25RTWVDSjZna1NXb1I3bmd2K2ptK3ZQZkJhQWYza0RNbktWQzdMZjlxZ3li?=
 =?utf-8?B?RzFZc1VDd1BkWnhDdlo1YWNEWHBPTjkvb2tRSVVZc2k3Y28vMG8vQlFLUHNG?=
 =?utf-8?B?STJwVUREdUFOUGYvRnRXNmU1NzhzZ3RPYUhUSS9vZ01hOFUxa1p2U0gxUHFv?=
 =?utf-8?B?N0JnUzZxQ3JkRSs1clhhc0lDa0RFenJQSWp2aGxnTk9IVlQ3UE1vS2x4Qm4z?=
 =?utf-8?B?SkZJVEtjYlBxRlZxSWtqTkRwKzZyOVpUeUJOTU4vUzl3VXZNWk1PR3FiSERW?=
 =?utf-8?B?YkZhaDlUYnl6WVhxaTA2TG1MMGFmRjZBUG00blVwbldRcGtUM1V1SDdSMlg0?=
 =?utf-8?B?L3JPQ3l0aExMdmJ1LzNNbE9hWVFmS05KYmtJbCtHMzQrb2I0VWw0SWhzR1pq?=
 =?utf-8?B?MnhjYTRCcUJIRkRJUG1sTXBwQXptajNEVkx5YjVPejczOW9IcFkxcTc2ZFRD?=
 =?utf-8?B?SG5sRWtkMWYyRDlxY2gwN2YzRWl1SUozbXV4bWV4TmE0QW1aRHduSzZPRTNo?=
 =?utf-8?B?eWEyT3pmRFRiYk9QU1NzK1lXdDhoVk5YcTFiREJqTlRWS1kzMm1iM05vZ0xH?=
 =?utf-8?Q?Xcy9d4hf9vrb05IBtiCdK1w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf67072-7f00-4909-dc34-08d9bf1125e0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 14:51:02.4251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: djoAsfjemz6Q5mF16jcIxij0w6r2WgGRQTuhBGV0eVB/QsU66qU3ucW0A08IU2no+Obo787TCpsFXEw4VmgyYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3481
X-OriginatorOrg: citrix.com

On Fri, Sep 24, 2021 at 11:54:58AM +0200, Jan Beulich wrote:
> Page table are used for two purposes after allocation: They either start
> out all empty, or they get filled to replace a superpage. Subsequently,
> to replace all empty or fully contiguous page tables, contiguous sub-
> regions will be recorded within individual page tables. Install the
> initial set of markers immediately after allocation. Make sure to retain
> these markers when further populating a page table in preparation for it
> to replace a superpage.
> 
> The markers are simply 4-bit fields holding the order value of
> contiguous entries. To demonstrate this, if a page table had just 16
> entries, this would be the initial (fully contiguous) set of markers:
> 
> index  0 1 2 3 4 5 6 7 8 9 A B C D E F
> marker 4 0 1 0 2 0 1 0 3 0 1 0 2 0 1 0
> 
> "Contiguous" here means not only present entries with successively
> increasing MFNs, each one suitably aligned for its slot, but also a
> respective number of all non-present entries.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Obviously this marker only works for newly created page tables right
now, the moment we start poking holes or replacing entries the marker
is not updated anymore. I expect further patches will expand on
this.

> ---
> An alternative to the ASSERT()s added to set_iommu_ptes_present() would
> be to make the function less general-purpose; it's used in a single
> place only after all (i.e. it might as well be folded into its only
> caller).
> ---
> v2: New.
> 
> --- a/xen/drivers/passthrough/amd/iommu-defs.h
> +++ b/xen/drivers/passthrough/amd/iommu-defs.h
> @@ -445,6 +445,8 @@ union amd_iommu_x2apic_control {
>  #define IOMMU_PAGE_TABLE_U32_PER_ENTRY	(IOMMU_PAGE_TABLE_ENTRY_SIZE / 4)
>  #define IOMMU_PAGE_TABLE_ALIGNMENT	4096
>  
> +#define IOMMU_PTE_CONTIG_MASK           0x1e /* The ign0 field below. */

Should you rename ign0 to contig_mask or some such now?

Same would apply to the comment next to dma_pte for VT-d, where bits
52:62 are ignored (the comments seems to be missing this already) and
we will be using bits 52:55 to store the contiguous mask for the
entry.

> +
>  union amd_iommu_pte {
>      uint64_t raw;
>      struct {
> --- a/xen/drivers/passthrough/amd/iommu_map.c
> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> @@ -116,7 +116,19 @@ static void set_iommu_ptes_present(unsig
>  
>      while ( nr_ptes-- )
>      {
> -        set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
> +        ASSERT(!pde->next_level);
> +        ASSERT(!pde->u);
> +
> +        if ( pde > table )
> +            ASSERT(pde->ign0 == find_first_set_bit(pde - table));
> +        else
> +            ASSERT(pde->ign0 == PAGE_SHIFT - 3);

You could even special case (pde - table) % 2 != 0, but this is debug
only code, and it's possible a mod is more costly than
find_first_set_bit.

> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -433,12 +433,12 @@ int iommu_free_pgtables(struct domain *d
>      return 0;
>  }
>  
> -struct page_info *iommu_alloc_pgtable(struct domain *d)
> +struct page_info *iommu_alloc_pgtable(struct domain *d, uint64_t contig_mask)
>  {
>      struct domain_iommu *hd = dom_iommu(d);
>      unsigned int memflags = 0;
>      struct page_info *pg;
> -    void *p;
> +    uint64_t *p;
>  
>  #ifdef CONFIG_NUMA
>      if ( hd->node != NUMA_NO_NODE )
> @@ -450,7 +450,28 @@ struct page_info *iommu_alloc_pgtable(st
>          return NULL;
>  
>      p = __map_domain_page(pg);
> -    clear_page(p);
> +
> +    if ( contig_mask )
> +    {
> +        unsigned int i, shift = find_first_set_bit(contig_mask);
> +
> +        ASSERT(((PAGE_SHIFT - 3) & (contig_mask >> shift)) == PAGE_SHIFT - 3);
> +
> +        p[0] = (PAGE_SHIFT - 3ull) << shift;
> +        p[1] = 0;
> +        p[2] = 1ull << shift;
> +        p[3] = 0;
> +
> +        for ( i = 4; i < PAGE_SIZE / 8; i += 4 )
> +        {
> +            p[i + 0] = (find_first_set_bit(i) + 0ull) << shift;
> +            p[i + 1] = 0;
> +            p[i + 2] = 1ull << shift;
> +            p[i + 3] = 0;
> +        }

You could likely do:

for ( i = 0; i < PAGE_SIZE / 8; i += 4 )
{
    p[i + 0] = i ? ((find_first_set_bit(i) + 0ull) << shift)
                 : ((PAGE_SHIFT - 3ull) << shift);
    p[i + 1] = 0;
    p[i + 2] = 1ull << shift;
    p[i + 3] = 0;
}

To avoid having to open code the first loop iteration. The ternary
operator could also be nested before the shift, but I find that
harder to read.

> +    }
> +    else
> +        clear_page(p);
>  
>      if ( hd->platform_ops->sync_cache )
>          iommu_vcall(hd->platform_ops, sync_cache, p, PAGE_SIZE);
> --- a/xen/include/asm-x86/iommu.h
> +++ b/xen/include/asm-x86/iommu.h
> @@ -142,7 +142,8 @@ int pi_update_irte(const struct pi_desc
>  })
>  
>  int __must_check iommu_free_pgtables(struct domain *d);
> -struct page_info *__must_check iommu_alloc_pgtable(struct domain *d);
> +struct page_info *__must_check iommu_alloc_pgtable(struct domain *d,
> +                                                   uint64_t contig_mask);
>  void iommu_queue_free_pgtable(struct domain *d, struct page_info *pg);
>  
>  #endif /* !__ARCH_X86_IOMMU_H__ */
> 

