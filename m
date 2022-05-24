Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9FA532EB5
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 18:16:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336655.561023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntXCT-0007sy-2y; Tue, 24 May 2022 16:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336655.561023; Tue, 24 May 2022 16:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntXCS-0007px-Vu; Tue, 24 May 2022 16:16:00 +0000
Received: by outflank-mailman (input) for mailman id 336655;
 Tue, 24 May 2022 16:16:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jpOU=WA=citrix.com=prvs=1362cb858=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ntXCR-0007pr-SN
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 16:15:59 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cab1d78f-db7c-11ec-bd2c-47488cf2e6aa;
 Tue, 24 May 2022 18:15:58 +0200 (CEST)
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 12:15:52 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CY4PR03MB3047.namprd03.prod.outlook.com (2603:10b6:903:133::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.18; Tue, 24 May
 2022 16:15:49 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 16:15:49 +0000
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
X-Inumbo-ID: cab1d78f-db7c-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653408958;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=eaZAWNBt51mFZ4D+UaLNPDlrcyvuFhdGRBRYioRc9BY=;
  b=fmVFMb1UzjVs2DjlaGrg8NVtwlmYsWNu9UbPFrPvPwog65epZtZWjic8
   n8XliGlNySE6UIR7TvwN/qAM6aRW+d+0pG+tEQjAw4LJZWtBK/GlqQLob
   C9uZIa/FeTxOZy4NTfwJ78tc2pRCVCD/GP0ImU2yRhUrxlPUfkM8OVkJC
   4=;
X-IronPort-RemoteIP: 104.47.56.172
X-IronPort-MID: 71438674
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:aO2UualzXFJkSo/PFGbQ0xro5gz1J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNXzqOPa6LMzP9e4t1Ooi1oxxQuJ7dxtEwQQFo+y48ECMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DkWV/V4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYZAcXEqLuh+4mVCJGSBh3E5JM9ufIGC3q2SCT5xWun3rE5dxLVRhzFqpBv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOXu5kBg21YasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUH8Q7O9fRovwA/yiRP/bLLNOTMQeaQVMhqlHeUh
 GOf0172V0Ry2Nu3jGDtHmiXru3FkD7/WYkSPKal7fMsi1qWrkQMDDUGWF39puO24mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4LgEhwASEy66R6AHAAGEBF2dFcIZ/65VwQiE23
 FiUmd+vHSZorLCeVXOa8PGTsC+2Pi8Wa2QFYEfoUDc43jUqm6lr5jqnczqpOPXdYgHdcd0o/
 w23kQ==
IronPort-HdrOrdr: A9a23:AFRMHa6PPVc/hcgliwPXwVSBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcV2/hpAV7GZmXbUQSTTL2KgbGSoAEIXheOjdK1tp
 0QD5SWaueAamSS5PySiGfYLz9j+qjgzEnBv5ai854Hd3APV0gP1XYaNu7NeXcGPjWuSKBJYq
 a0145inX6NaH4XZsO0Cj0sWPXCncTCkNbDbQQdDxAqxQGShXfwgYSKWySw71M7aXdi0L0i+W
 /Kn0jQ4biiieiyzlv523XI55pbtdP9wp9oBdCKiOISNjLw4zzYLbhJavmnhnQYseuv4FElnJ
 3lpAohBd167zfrcmS8sXLWqnzd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7k16xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklXavoJBiKprzPLd
 MeTf01vJ1tABOnhjHizyNSKeWXLzsO9kzseDlAhiSXuwIm7kyRgXFohvD3pU1wiq7Ve6M0mN
 gsDZ4Y5Y2mbvVmGZ6VV91xNvdeNAT2MGLxGVPXB2jbP4c6HF+Ig6LLwdwOlZKXkdozvdAPpK
 g=
X-IronPort-AV: E=Sophos;i="5.91,248,1647316800"; 
   d="scan'208";a="71438674"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXFwxV1iBVQxFMpCU3h7ufqtsM2KzLP09GmXFHvS8zvLHoQDZvBEB4f0dpbM4ersNrJiGCPmo39d5bDBmkf3R3ivzNfIxd3F7ice39prx9QzFgGzZaPoaltEuSE8uNqmENDuhqfhZW88LmIoh4GGHUC8upJBNbBVsgZhhU/d/LmDi+UKFkSwNXb6Pw6zM3BkeFKeaFlMbWMZnR4oGPpPUX8jQhHeCW0ZLFObCMoJNS8AHBT6cj8myk/jr1ISTxv79YYIaYoU1qasPI4JUHJEc9rfX2IxMBPIxzTLpQvLuegjBT/JyzV+IWos/HBtEc8qLN8+PkKErUEDJF9FMXNojg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bic+FVCBiOdBeEsuUkPpsfdFF/0ZeMDB1NQpH7jaHwM=;
 b=Ia1NuBlK7M3Yx3xPHybeKRvKpPdR+Glfwvw8FjNpwOoO7QxZybHp1ri+3Fzn0BVFFW8DB1OiGR14HPMFbYwZXDQ+uSfL+6FUw46e0kYdzdAjzc89JOtYOPyhyz28IU9R5IpaTT7OB7GmcKuTI1lqNTytY1YbaN/gMf2ogG3k+hRNzHKPGBP3AbbSzn6pLkkoQosYp9wmnInKNVT4RaCuWM7CxsM/up2HsIuMd9h1NMrrOdAnO4IDNC032diUdsUkiEZkf5MKGR/jk9YsjGwILJHICqauatPd0dmYjurj9RPD1FsQA8Z7c2FawCR/u9mqrOKnt+mHKknvOev2g+9O4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bic+FVCBiOdBeEsuUkPpsfdFF/0ZeMDB1NQpH7jaHwM=;
 b=NOpc8L5litV8KDmw/xjgaSVguMSurZ152gYzqLXW7pQk5jmlYY7L2tPANMIpsRDZSNB0zYvqIdZntpo68z5f2h5tHSAyV+OsiOxGdRTy3412xVC1/+0eNDcvC0LgjF0dGY5WZK0YrMe2QO3D7dA961aG6OYoPgmC3+kFQccSQmM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 24 May 2022 18:15:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>,
	Jane Malalane <jane.malalane@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] x86/hvm: Widen condition for
 is_hvm_pv_evtchn_domain() and report fix in CPUID
Message-ID: <Yo0EsamfnJD1XzVC@Air-de-Roger>
References: <20220518132714.5557-1-jane.malalane@citrix.com>
 <27a9ae9e-07fa-8300-d5b9-f9a88e4a1754@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <27a9ae9e-07fa-8300-d5b9-f9a88e4a1754@suse.com>
X-ClientProxiedBy: LO2P265CA0470.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58b3b855-c25a-4b57-1ce1-08da3da0aaa7
X-MS-TrafficTypeDiagnostic: CY4PR03MB3047:EE_
X-Microsoft-Antispam-PRVS:
	<CY4PR03MB304729F03F38058BAEA267FA8FD79@CY4PR03MB3047.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sSflwjl2Popu1XqWArNR1jHKYJDI6/njUQtD4BKKz+E2Xy7SebngfuEgqqoHO+NRCqhzgDhb2jyskE0k5PCviGOz5sEfpCZhw+gEU/WTYl5uAaDwhMsm1r3c4Tx2Gs82WYXa70dCoT27p8zXi8PUN72QuP2r5cnu6BF0TgIKDqJ1d3KPoSw8FBgPiageXPvRFOCkLUlp3qmc6AXNgfObr+pNI6Caa06sXvdr9to6DypS814R2fnSqxRvEpQPGTEY0L9DVHajjjSFByf/vNyTMrBmdhenUyTjijaN8DZki/ViwU6by1Geykb9rv0s3KSZaMXkC0HUODWbG6R/ZEMOIRGvOHwJz9UQ1BLBih4fAkgwnTtXHynCUAIukQCmiN9IIh/E0+FTwCpUAOl3ah7h3T7Wl4ZwPRDyo/sI60TYmrpG+U2IKHWCLqqwBEhx6b7V+CwAS6wBPZNRMPwcdZPj8YISMY4RpHYClqv5a7wIpgqFEpi3af0gNl5E3r7tpn921Nt6qvSLMwNoUcxW1NapOEl9wf8WPr9BYZqDExFC5dYWUhLbQaKzZ8aHs63Fflh7Vkc+To0XJmbm7aG4it3+g7WrTc7hw2Im7FH6cR6wORCwZVQHupGbnFnU1beISArVdb5qjopjFLMYRztI3pz4Pw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(85182001)(508600001)(6486002)(33716001)(38100700002)(6636002)(316002)(186003)(83380400001)(110136005)(54906003)(6666004)(4326008)(9686003)(6506007)(26005)(2906002)(82960400001)(6512007)(5660300002)(66556008)(66946007)(66476007)(8936002)(53546011)(86362001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cG5xMVFzSnREZlVVbzN5cWUvaXQrUkhNcXFUM1NaUWM3QXBuOE9EVndZSTIv?=
 =?utf-8?B?ZzVKQTljUFA1UGZYc09pNEwzUlpNVWxuQTZaVTZUcE9QNGNGL1JobjJTOWpU?=
 =?utf-8?B?bmNGb1MzMGJVcG5MUVZxcG84QjVGeXRBdWhqNFdxSHhpaHY1SC9oWmtKVVps?=
 =?utf-8?B?K2pEemxEQnI2ZWpCL1Y4LzNEQUNaYi9CNjAvY0JvRU03QlVSYmF6S21RSnBR?=
 =?utf-8?B?ZWJZems2Q0dic0QzaFdXL0J6RXhoRkNxUDA5anYwQjNyTlc3Y1diVkx6Ylho?=
 =?utf-8?B?MzlPN3NhbUN4N2xRRWFGYmdxM0N3TDlFcFl6V3R6NUNqVkNXOHVlYWNRU1Yv?=
 =?utf-8?B?VU4zNDRkbExyMGVJN2RzbmM1TjFiS1QyNnBnTUppelZmWmpmdGkxYlpueHFy?=
 =?utf-8?B?SEVSZk9UWnlNVnZZbitublZWMmZOa0tDa2tsNUdFbXFxaElPTzk5K0c2OWx6?=
 =?utf-8?B?S0tJL2dWZ1AwMzViZjVDRHUzNTNsUCsvLzRFWk1wSVJNUUc5djhRVWoxb0tB?=
 =?utf-8?B?ck1zK09STGJyL2hCZk1qbDBxS3QzUG15SVVBWG9GWXZROHV6V0orYnlOa2NF?=
 =?utf-8?B?eVlEajN2Ui9vQmcreWVSclpTNWdMRU9VOEV6WmFRQ0pjVzRFV25FOHBMSm5J?=
 =?utf-8?B?eWg4N2Z6ZndCTmJVc2cwZjQzek43eXRCMzBnZC9uYnZnSnBqeDgyU3NvN1BL?=
 =?utf-8?B?ckNud1lTL1d0U1hac2F2SmRiWDJaTituMEZ5RXEzZFUyek1BSWlXd1NLbGJo?=
 =?utf-8?B?VmtVTTVlNGZGOVg0R3A2Y0MzWkxuSnY0cGt3eVVCMkJRcHV1clBTKzRTUGFr?=
 =?utf-8?B?SVRwY3JMRVRSNndtaWFPazY4Q0F1US9BNkwxNXZ6bkxQK2ZpTjVRa0d6OVlU?=
 =?utf-8?B?ZEsrbld2Rmt3UGVNZ1M4YzRXUEVjWE1mK0Q0aGRyLzJWWTVZR3hTSlhtSW5V?=
 =?utf-8?B?SSt1OUFRbTNRYmFBNkxJNWJvVSt3RHZHazUwMUxXT3VReXp2dElVUGhCUW83?=
 =?utf-8?B?eGh0UWFXei91VnkxSXZkT0IyNnhQZmd0MUROem1URFFuTm5TeTlzTFgraVNx?=
 =?utf-8?B?cmc2bkhEcHZvcjBzM1lSZ05uRTZ2ZjNoUVdNZ0NZbGlzVnRQeGpuMnEvVEJv?=
 =?utf-8?B?NWIzSjkzdVBtbVNkdHdWbjRqckRkcWJXN3VQa1AvcHVPSnRJWVNCL05lUzdy?=
 =?utf-8?B?MHhEYzZoU2JSdVZIU1d5MGpxUlg5TEFHODk4V1hLTWluVXpVYkk3UXRrQi9u?=
 =?utf-8?B?NDc3aEhXdVFQeG5HSUh1eEtPVjdMM2J3RHREeHBJMHczNWZ1THBZMkdMQ0FT?=
 =?utf-8?B?S0p1Ynl5enBmVUdROFZJaHVnY0F1L2sxb2FQczRhOXZqaVJTZ09qbnVvdTBW?=
 =?utf-8?B?YXViUTVDUi8rNlIrTHpEMzRrdjdCTmhCenl0RUtVdytZeTRUeUJ0ZlR2MDlF?=
 =?utf-8?B?amxmS1J6K1E4TmdoYmVEYW1qcnVXYTExQW9QZUNaQW5Kb1Brd0d2Z0xxaEFB?=
 =?utf-8?B?OWU0WTNmdVowVk5nb2ZYUkNpeWdkM0ZMOVZzYUNKTUxKeWNzNFY0Y2VLN2pP?=
 =?utf-8?B?eE55QjBzN2RYMDRoSU01TVNEMEhlbnoxakh6QWhNNFQ1dkk2UjNoR012aEph?=
 =?utf-8?B?THRRYmdSckZVWnRsZG5KcDVjdjlWWlhlZ25RVk5lanR0OGJ5VkNRL2cxbVhQ?=
 =?utf-8?B?a1A0STBCSUV1VWhuK2d3bCtaWW9IUldoZzRzbHhNZXdDTGVDRjBwdWdTWS95?=
 =?utf-8?B?aDRDd1o5Nnp5VnhaVThlTWk3VHZJdzhPQlhKTVdJSERpcVd1WE5xWEFISkNw?=
 =?utf-8?B?d0lwM2d6YlZPVndwckRYYlFCNGdFaWxsQXdWc2Fha2hBQWdpYXI0THVJdDZL?=
 =?utf-8?B?TlBCUjg4TXM3a2xOYlRNbVlHQ29nNnh5ZnNIMUtya2Z6VUVkK2FKQTdIY3Vm?=
 =?utf-8?B?bHkzNENqR2lNQ2s4aU4wanRtTUp6VFR0bUhoZnJneGEwVE02UGZ2Z1BpTHNi?=
 =?utf-8?B?dmdrUDJLcW9wUVNMTW9PZ2grNy9qRGhKVzZVNk1ubWNGVkRpd1pUKzJKL20w?=
 =?utf-8?B?NDluenFyRGVUUHc3Rll6OFc3alFicUxLYVBITXQ3ckRpa2s4UHlNVGNWR2Mv?=
 =?utf-8?B?K3FKRW8ybGJhMit2U3BqbjdkZXp0cUhJRllEbCtNZkx5RENYd3UwK2JCZGtF?=
 =?utf-8?B?RzZqbTFidWYxYjdvZGE1MG9pZlhRK1I2K3ptTXpiK3BWNjVQSHNmY1ZIbm5L?=
 =?utf-8?B?MjhnMmtJcC9sbmZBbUcrS29jR3NKajZ4b2lId3BBK250V1lUOFpXRkltdlFJ?=
 =?utf-8?B?Wm1CamhrR1N2ditBTzZ0ZUlWMU9KN01HQVBuakptUnY5S1UxcFJHV3hRWHNu?=
 =?utf-8?Q?BLf20UAYJvs/3Ys0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b3b855-c25a-4b57-1ce1-08da3da0aaa7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 16:15:49.5361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5KpHvPOSHEq0DwI78E00nW3J96BbADHeAxgKAQLjhrWnklGAUOEL5ZHVO2q+caLnFrY6wjFsPpNIu/mN0fYyKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3047

On Tue, May 24, 2022 at 05:14:12PM +0200, Jan Beulich wrote:
> On 18.05.2022 15:27, Jane Malalane wrote:
> > --- a/xen/arch/x86/include/asm/domain.h
> > +++ b/xen/arch/x86/include/asm/domain.h
> > @@ -14,8 +14,14 @@
> >  
> >  #define has_32bit_shinfo(d)    ((d)->arch.has_32bit_shinfo)
> >  
> > +/*
> > + * Set to true if either the global vector-type callback or per-vCPU
> > + * LAPIC vectors are used. Assume all vCPUs will use
> > + * HVMOP_set_evtchn_upcall_vector as long as the initial vCPU does.
> > + */
> >  #define is_hvm_pv_evtchn_domain(d) (is_hvm_domain(d) && \
> > -        (d)->arch.hvm.irq->callback_via_type == HVMIRQ_callback_vector)
> > +        ((d)->arch.hvm.irq->callback_via_type == HVMIRQ_callback_vector || \
> > +         (d)->vcpu[0]->arch.hvm.evtchn_upcall_vector))
> >  #define is_hvm_pv_evtchn_vcpu(v) (is_hvm_pv_evtchn_domain(v->domain))
> 
> I continue to think that with the vCPU0 dependency added to
> is_hvm_pv_evtchn_domain(), is_hvm_pv_evtchn_vcpu() should either
> be adjusted as well (to check the correct vCPU's field) or be
> deleted (and the sole caller be replaced).

I would be fine with replacing, the sole caller of
is_hvm_pv_evtchn_vcpu(v) is never reached if the upcall vector is in
use.

Thanks, Roger.

