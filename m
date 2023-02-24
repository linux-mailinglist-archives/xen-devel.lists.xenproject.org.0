Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0EF6A1E7B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 16:24:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501185.772819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZvb-0004cN-NX; Fri, 24 Feb 2023 15:24:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501185.772819; Fri, 24 Feb 2023 15:24:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZvb-0004Zz-JI; Fri, 24 Feb 2023 15:24:07 +0000
Received: by outflank-mailman (input) for mailman id 501185;
 Fri, 24 Feb 2023 15:24:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V4+4=6U=citrix.com=prvs=412e064f8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVZvZ-0004Zt-GP
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 15:24:05 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43e87c48-b457-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 16:24:03 +0100 (CET)
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Feb 2023 10:23:59 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6335.namprd03.prod.outlook.com (2603:10b6:510:aa::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Fri, 24 Feb
 2023 15:23:57 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.021; Fri, 24 Feb 2023
 15:23:57 +0000
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
X-Inumbo-ID: 43e87c48-b457-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677252243;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mksvIhVF3yH5ia6s2zcyTH6WWQ0Ay5mhiOyLv/rrGMs=;
  b=eUWlbLnygpl5m6cxLoal7WO5CRikAlm3VMXCMYTu1+j4Uy3GOIR1q7fN
   cgDAdi+NLv13liMFK9dkU2pYvCmd8x3L24P6cp5yh2UVxNw5Erdk+SK1f
   j5tJr60hWsOKV3FZ7YhA3eVA+OES7CR1sHjmzsx8kyrZJrsi4u1+PY4K8
   E=;
X-IronPort-RemoteIP: 104.47.59.175
X-IronPort-MID: 98335443
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:P5PrpagAN+LnQtGMH9tXDP4xX161+BEKZh0ujC45NGQN5FlHY01je
 htvX2qOb62ONzf9LtEjadizpEsPupfSnYRrHVRqrS9kFS8b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWt0N8klgZmP6sT5gWCzyJ94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRfIQlQUS+ci9uHxYqRa+5h2vUMJfbSadZ3VnFIlVk1DN4AaLWaGeDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEgluGybbI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6Re3jraM23Ab7Kmo7VzAnX1CkuqeD20PuWvNzE
 n4y+gA8sv1nnKCsZpynN/Gim1aDuhMfQNtRVe4n8gaGyqnTywmcD2kACDVGbbQOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRUcZfjMNRwYB59jloakwgwjJQ9IlF7S65vX6GDj2x
 y2BpQAkhqsUls8N3OOw+lWvqzirrJLYQxU14gjSV2SN4QZwZYrjbIutgXDS6fdbMI+YVB+Pp
 nECkMmFxP8CBteGkynlaO4KGreu5fqMLjzHqVFqFpglsT+q/haekZt45Th/IAJlN5gCcDqwO
 kvL41oOudlUIWegarJxb8SpEcM2wKP8FNPjEPfJct5JZZs3fwiClM1zWXOtM6nWuBBEuckC1
 V2zKK5A0V5y5Xxb8QeL
IronPort-HdrOrdr: A9a23:58G7gaATiXE9VsrlHemo55DYdb4zR+YMi2TDgXoBLSC9E/b5qy
 nApp8mPHPP4gr5O0tApTnjAsa9qCjnhPtICOAqVN+ftW/d1VdAR7sN0WKN+VHd84KVzJ876U
 /NGZIOa+EZrDJB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.97,325,1669093200"; 
   d="scan'208";a="98335443"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Btp6KrTG9pMhsgk+RfqYkUAvH08rVCXeJqOdEnrhOHsLXWN59MKDfP/5Ljnm02FEiDDqRZCURtM99r6vYfuejRrE3r2QTLZlqcYgugbd36jR3vsK+L7gEX9vL6+sn1jG3uIbg0Mt0TXwWQEzprV6L3JDluwpDw2zKtK6lpZiABj5/O1nChv7wOSvtvASL8vN2XD7Usydzt8k3ALg++jufn1yW3c/P1xv2WTUiBoJS5t8A+q0EHoJLLMTgd9wMPAMShbjTk994v0yJ0YtD8ZJc7re+uoPkZWvz8TBrqk//8XUb5PtI5rEoURgas+6Bobq2pfelafZ36RO5uYkTzXWSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2hCQnm3TZvBvFpIF9lO32P5+ojF4fZG0l5NOWjcCMI=;
 b=PVD3WhtMaAl1juAWo7gBk1AUKRKv/cL+mORqCmDkDPMEa2VRomSUI1qRSCmx07jK/KGcW1QZQhYxXTqf2TbMaE5NhYgBwpm/5QEYpBO1Ys9NT1n1bWuZcPKAu4/JLPHDSol3NgCfg9kGR4R97wMyqZnCF6lfgBO3dMhpRociQrvjgChSCl3CtcLwJVnwa/ErFDEB+O9QV3Ivbz4UA8+OJqCJJjN711tjv3Bz9jJ85gXaYrAK9wUQeqpmSJ8EJ/c9XzF77GRhgNFJMJXrsb5MTX3vbcUEFpGdstudu7QFc8fUAm2moE1uApQVBUa2y3pgmxpPlgfKkP6+N2UgK59BZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2hCQnm3TZvBvFpIF9lO32P5+ojF4fZG0l5NOWjcCMI=;
 b=r/QLgIQapnJFZvSSIHOhG7o/+80Tt6pAf13cmIcGhtZVe7xSiaaxyvko8VUfZP8FBJe0M+NMj8ywvgejNpXu6P/GABOlboryy/K8MXQjQBM8TWZ6WrAz7ECchPtWy4k1uEUZCvPkAB09joszoqvpHiJBcYN1e3jGBBPQv1vX6Ho=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cbf1259c-7ca6-4d23-02d7-fdb0efa40827@citrix.com>
Date: Fri, 24 Feb 2023 15:23:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1 1/3] xen/riscv: introduce setup_initial_pages
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1677250203.git.oleksii.kurochko@gmail.com>
 <a145fbbfb166d9f6bd4859b669d23a1f52004b2b.1677250203.git.oleksii.kurochko@gmail.com>
In-Reply-To: <a145fbbfb166d9f6bd4859b669d23a1f52004b2b.1677250203.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0185.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6335:EE_
X-MS-Office365-Filtering-Correlation-Id: 15c02ac6-ee9c-4ce3-e313-08db167b25cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G7QARIfHLvGFOlCy/fXThUTc3g8Swxo9qDISyvEsORtM8H41DlkJeHwInwlXTr3mRt4CTmA7IWtFOXuvTjoVW4wrY/sAS93OusWYILnSayhScNqipTDbETZjVNO8nUI234flO3A6ue22y+JAUShiIZAUWGAWnyPuMitpQif6gLo/UCGwr0stuwHKuhsP7beufS0escyTUdqFd3d/tKJWgE2YQITo8oc9Cj3tlyNRmFJ4H85AWuqKAUlXjNeZzbeM2ReWpLUabafmlj9jXb7R2D+u7aSx2juNsEw7BqAIDqePS1Jw7w1v4FTAkbhUCSelBB8P+PQD2Fagtehow6cErCFbG6nPWN5Epcckwds6H4L5qhB6k6YfpP7CRiM6rmD+mBIKwJaOvIE8Mx17Vq0qWtXZyKZGLzMLXGEcCuVtMUJPhA+ggv6Q3MxEhckWvvkQ0+TioJkBx7d67utv4wcPb5Bx/HrIt+D5GelLQop/JPRayKsgulgmDFS6SZ8tRtgTIEbnqbzKLNa/e4E4j9hTj1rGA/do7o1HRzViwXOhyR3tMFoeSZ9XV/wPgXlQcXhxkOI4SbVfuWyInEFSf8/aw0tCvLerkyHPRocw1somK2lk5wTkrLMo5IdFoaqR38mKyFdGrRCqY8rWHHf6RjMWFTH5pX34j2V1WiDGs4Pjk2FOsuyEmukjvhu3Ukp2OZUzW/DLn4Yd3II5yliAlNXsDB8daSCQ5KA1DdR1lv/3Yqc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(136003)(39860400002)(376002)(396003)(451199018)(82960400001)(31696002)(38100700002)(31686004)(54906003)(83380400001)(86362001)(2616005)(8936002)(36756003)(4326008)(8676002)(316002)(5660300002)(2906002)(6486002)(478600001)(66946007)(41300700001)(66476007)(66556008)(53546011)(26005)(186003)(6512007)(6666004)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzQvd2NtMjFSZ2NuMDVYZ1pvVEozdEpOSGpBN1orNGNkZndzNWtYc3hydi9o?=
 =?utf-8?B?Vk1DNDdqTkFpbEorNWxETktCYXhtZnVZS1FLRWdFQWNsWm1tMGdDalV6OHI3?=
 =?utf-8?B?SDVZL2ErY2RCSVVLVEZRb1g4VjVrc0gzTDJCT2dVUk1YUHJMeXdyWHlIMm5J?=
 =?utf-8?B?ZUZpMlVrNzk2dHNnR2c4QTZKcTF6dlRtcXBoUS9SaXViVnh2eUlycmNsaHhK?=
 =?utf-8?B?NkJHVk1yOUJoZElJMk9TTFhKSVBLZDZIN1BGVVAvaDdtZzdkaDhLenBoaGxF?=
 =?utf-8?B?MzBZR0pKb3UxSVhqdlYzcFdxKzRqSGJXVmpRZTUyMW5NblIzbFZzdnJseFFN?=
 =?utf-8?B?K0QrZVJTQW9mYXJDWDdNQlNjd2FQUUxGNnpaVjFnSFNEOEZHa28rcUZTMmVY?=
 =?utf-8?B?UlROT2IxVXFxMzhuYVg2SVk5SC9tYThmWFF3RVVTelRGNmxJM2E4R3p0Vkla?=
 =?utf-8?B?UkUrcjU1Rk9oV2NUUldzZTBnQzlVWG1JZkNTTXhYeGQwM3ZtZ2oyODhDVG9p?=
 =?utf-8?B?cFkzVGZlbEJQR0xCK1d5MHBucmZHTlFxWjVFRDBKWStVSkNYYVY2Y3hHVFZq?=
 =?utf-8?B?MEhyeUU4M1dWNmptck1qb0NnQSt4Q29oVUMwS25mQnlxMVAxclBTbFRCT2lt?=
 =?utf-8?B?S0prQlJvdmgwZzZ6ekc4M1hYNERiTFRqTkU5bllHUlYvTGVRWFZKNGRHNm9H?=
 =?utf-8?B?c0dCRlkyRjJsaWppd1RYWWQwUTVUaGVPRTNPM1hmY3JCdGh5MzlCSERwQ3c0?=
 =?utf-8?B?N29QMFdjYzltMXIwZjZ2Q21HUnBSMkp0OUVkNjd4a1BjNlNNbnZOT2w0ZjVO?=
 =?utf-8?B?QTZBZGZNNExGcGs1VnpHQ3JhaW9GeDhIT3NMMlFxVXJUTmRuQnBabVdoeEZB?=
 =?utf-8?B?OWw2d3VlZC9RelFSczJpaVVURUNWQkJaMXVKUWd1WklZR2U0UlVteCtjbkJ1?=
 =?utf-8?B?MjVIS1FIbHJHT0NHU1hvNitNL2lKSzdqa2l2Ry9KdUkwMHJndm53d2o2UHFU?=
 =?utf-8?B?TElwYlBIbUhWWUluQVhwd0g3VVJ2dExRS1VlazZUWWpIQ3gvOUl0K3ZpaDgz?=
 =?utf-8?B?WjVCVEtnVVB5dndaMjJrYmI5SThXa0l1eEl3ZGVjYUYxVWt4ZGpjeW92aU1H?=
 =?utf-8?B?Y0hZTCtsbFZKNk9VMTRUd0xiL1YwOHE4VWlWY3FIa0JxVUlJTm0vTlZEWnd4?=
 =?utf-8?B?dXFuNGdxbUxmUTFqelp1YXJUQ0JDTVpiYld2Tkwrc0JHMncxeldQNEdWeG5O?=
 =?utf-8?B?ZGkvNFVRZklMNkpZNFk4N1VVVk1aQU9CRTRZVXU3NGJuZElhYzBoV3IxZHdE?=
 =?utf-8?B?d1BWNnNPUk5HTDRaNEV6YXZlZXovTGZRNXpkN2M0VEVrZjJ4cDc4N0RKSTVX?=
 =?utf-8?B?aFNCeThYenpGdi9KMTUxT0NXWUxCNElNdzhlTGtWY2pQYTAwV2JDVEZ5NG5J?=
 =?utf-8?B?OU1wdVJxUXJRbjV5dTRBME9OUHg2ZnJETERnRW1ycnVBbFNyOS81S2doU2JR?=
 =?utf-8?B?TmtFQzVwbXZWczRNR3hWM3dZbXFHbUhCQ0Jla3R3SUhuVXVMc1lJeGJ3TVNM?=
 =?utf-8?B?ZlRiMTNoU3Vlem1heWw0cTZ5WWl3RXg2MWU1cUNUamZ5WGxKSEdZSFVrRHJT?=
 =?utf-8?B?RVNKL2ErRzFkNE5PM2o2eFB5UFZXaXphWG5tZjM3eXZ1Q2lNekw5U3JLVWpp?=
 =?utf-8?B?b2tDM01Zbmgwek8vYS9saDdQYVF0Y3YvQUFnZjNiUFIvOWRuVnpjTVorWmlM?=
 =?utf-8?B?V0E5SFAwcHJwZHE5b09TTzcwU1cxeW8rbmdvbXEvZ01xMGFvaUVyZ1VzMXFU?=
 =?utf-8?B?WXNsRU56S1U3eWY1ZktiNnZVZWx6aTk0TjFEcjRLTjR1MENyanVtbnpvZk1E?=
 =?utf-8?B?SFF6OFc3THhrWEZQK3B6OTZTVU9YNEkwYnR5aGhQM25ZL2wwK0hXakpIQ2JE?=
 =?utf-8?B?enZOblAxQWsrYkhyQ2p2eEJwK0MzU1FHYWJFc3BiOGk1NzlCcHIzWkQ4WnN1?=
 =?utf-8?B?Qjd4K3c0NXFYN2VEQlNYQVloV002ZFJFTnB4bE0zWWI0N2ZvaGkzOWlLUGNR?=
 =?utf-8?B?YUFuSTBCczVTTjhmMTY1Wi90N2RuZCtRTnpJTVNReDJCTWp3ZjE0U1U4THlL?=
 =?utf-8?B?aDFIeTA5L0JTZlMrck1uT3FlN3FlVS9XZjlxVVN4ekJMc0VJWUFMVG1RTXQv?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	m51bccOLI1sMDGSVCwLrh9/c4X+LRz4bGh9oV5kVyDoKqcV4+v543zK4AVznOoJKGWbM7RNet3dhr9kihUILtPAryk+nbE5KdQSBC1w6ypDCarTS4KaZ6AjpYNneMZQJQOMf0qALTD8Ccd2halDKYa/s5bDKP7FX9hVnbTTwIlyTL/bNFVc/3G49+qb39IR6rK6ocSbuiSd48D7iGe/Nm4NL3D/F/oX2c8oxtIS9nugWCXp3KfggUKc4jSZxd56iao+iLjJEnuOB3ofXtfbAS/+j8BGdnp/1fMJbCt2hf7mOgb6rzlTYQmpPLHQ4EYUYP4m+1wRflZy4hCRFZ0gh92L/IdaiqJYhl77xUQVYyzBDhqSRb7jao5yjmoShThKVP3BobPDoP5yD0maEJx3S+dIGWBaG+X9IKgcEz7UH0y3h6bM+lev9uoVSGcOfDsfmdN3huZqKU7XmfysjYewx5DCPpY/fzxQONB3DIsMf0TiaTKl62Od249q2tUAFviDGyRfGVTcdOGfPTK+Ny/Mh1+aohYDQUwJjpo7ptMKxnGh6BuYXj0zSZW0obsKLbGryiRTYrc4ahu2Hltt7TH91afgSLlIdZ39OzWwC9eyljt91B2lh7G2YcDSlLdKYzPGtGHarkjz3Nq0nN+eawSKbJupnVmvsGaWmuRWxp22HBTppEZpU2dh9E0flg3VxkcujLaZThNyDVwXo/J94lsKiccSszk1TSNUb9sklfbY4/wSGkw2NLqbD8yqAat9JUzY28KbAGQonyEeAp1hcGav/qibkF2+8P6u0YHDBgq+V+mJ0lX9Df8F6vQhVq1Q/gQtHewQ+aZl4Q1nlVdMb4SRgChAa1I3/FQ7ehawmN59Hz4MhPuIN9G68S61qPNma7xdmbJQTVROm8hAxEn1T/rlzRQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c02ac6-ee9c-4ce3-e313-08db167b25cd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 15:23:57.6751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IKtHbgUrJEHGfhyI7rYy1gLs+HnYfYOK07DxapRzM6TrUzcvmk+kynjj+gSX8RXRFI4hsxpLOpJAZYoC/7JUooY30MpohiC5F6eGaVi+6dE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6335

On 24/02/2023 3:06 pm, Oleksii Kurochko wrote:
> diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
> new file mode 100644
> index 0000000000..fabbe1305f
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -0,0 +1,90 @@
> +#ifndef _ASM_RISCV_PAGE_H
> +#define _ASM_RISCV_PAGE_H
> +
> +#include <xen/const.h>
> +#include <xen/types.h>
> +
> +#define PAGE_ENTRIES            512
> +#define VPN_BITS                (9)
> +#define VPN_MASK                ((unsigned long)((1 << VPN_BITS) - 1))
> +
> +#ifdef CONFIG_RISCV_64
> +/* L3 index Bit[47:39] */
> +#define THIRD_SHIFT             (39)
> +#define THIRD_MASK              (VPN_MASK << THIRD_SHIFT)
> +/* L2 index Bit[38:30] */
> +#define SECOND_SHIFT            (30)
> +#define SECOND_MASK             (VPN_MASK << SECOND_SHIFT)
> +/* L1 index Bit[29:21] */
> +#define FIRST_SHIFT             (21)
> +#define FIRST_MASK              (VPN_MASK << FIRST_SHIFT)
> +/* L0 index Bit[20:12] */
> +#define ZEROETH_SHIFT           (12)
> +#define ZEROETH_MASK            (VPN_MASK << ZEROETH_SHIFT)

Don't name these with words.  That's an error ultimately inherited from
an architectural mistake ARM.

These should be named L1 (4k) thru L4 (512T), and don't need separate
separate masks or shifts because it looks like RISC-V designed their
pagetables in a coherent and uniform way.

You'll find the code simplifies substantially if you have
PAGETABLE_ORDER 9 somewhere in here.

The shift is always (PAGE_ORDER + level * PAGETABLE_ORDER), and it's
rare that you need something other than "(addr >> shift) & mask".  About
the only time you need a virtual address masked but unshifted is for
debugging.

~Andrew

