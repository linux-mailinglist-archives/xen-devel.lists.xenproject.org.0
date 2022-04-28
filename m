Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B98513255
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 13:20:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316458.535391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk2CK-0003bg-LN; Thu, 28 Apr 2022 11:20:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316458.535391; Thu, 28 Apr 2022 11:20:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk2CK-0003Zr-H0; Thu, 28 Apr 2022 11:20:36 +0000
Received: by outflank-mailman (input) for mailman id 316458;
 Thu, 28 Apr 2022 11:20:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O/gZ=VG=citrix.com=prvs=110729f0c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nk2CJ-0003OV-9x
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 11:20:35 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 378df62e-c6e5-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 13:20:34 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 07:20:31 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN6PR03MB2721.namprd03.prod.outlook.com (2603:10b6:404:5a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Thu, 28 Apr
 2022 11:20:29 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.023; Thu, 28 Apr 2022
 11:20:29 +0000
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
X-Inumbo-ID: 378df62e-c6e5-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651144834;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=MK0Pt5bMm3eDfoFrgFqkKaQgL8YWZjd+beQNr0UHrW0=;
  b=a1EGU4P29XVMfGGiuhHH0+YFog9jEvA09hyTajby2fKL9+kvbNc7mQU9
   GSfvjIRYpkxRduICvIfktAC6isX7dOQCsYs622U2NvaHsCLzlO2lV/Knh
   xlbEbg+a6DfD/2FQpTDjHujcwMqGU5HE7tYYjQGU4TaaQdCt4c3UI7OQk
   4=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 70149174
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:yHexe6ylVdIbACHRpQt6t+c2xyrEfRIJ4+MujC+fZmUNrF6WrkVRz
 WFLWD2EPayJZWLxKdp0YY++oUMAsJfVzdc3TgA9qSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NY024jhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplrYaoeS0MB/Xwg88DUkVSLw0uIPxL9+qSSZS/mZT7I0zuVVLJmqwrJmdmeIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtaeE+OTu48wMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgK2QE+QvK+cLb5UCLygtBj4nXC+bMUYG6e9lapGOBp
 WzJqjGR7hYycYb3JSC+2mKhgKrDkD32XKoWFaak7bh6jVuL3GsRBRYKE1yhrpGRiESzRtZeI
 Ew84Tc1oO4580nDZsb5dw21pjiDpBF0c9dRFfY+5SmVyrLI+QeJQGQJJgOtc/Qjvc4yADYsh
 lmAmoqwASQ16ePFD3WA6r2TsDW+fzAPKnMPbjMFSg1D5MT/pIY0jVTESdML/LOJs+AZ0ArYm
 1iixBXSTZ1J5SLX/81XJWz6vg8=
IronPort-HdrOrdr: A9a23:bMxjwKHu0IfN7S1QpLqFDpHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LK90c67MAvhHP9OkPAs1NKZMDUO11HYSL2KgbGD/9SCIVyCygci79
 YGT0EWMrSZYzlHZK7BkXOF+r0bsby6Gc6T9ITjJyAHd3AQV0gs1XYPNi+rVmlNACVWD5swE5
 SRouJBujqbYHwSKuC2HGMMUeTvr8DC0MuOW29OOzcXrC21yR+44r/zFBaVmj8YTjN02L8ntU
 zIiRbw6KmPu+yyjjXcy2jQxZJLn8aJ8Ko0OOW8zuwubhn8gAehY4psH5WEoTAOuemqrG0nld
 Hdyi1QTfhb2jf0RCWYsBHt0w7v3HIF8Hn502KVhnPlvIjQWC86I9Apv/MVTjLpr24b+P1s2q
 NC2GyU87BNCwnboSj779/UEzl3i0uPp2Y4m+J7tQ0UbWInUs4fkWUjxjIaLH9ZdxiKqbzPUd
 MeR/003cwmPW9zNBvizylSKN/FZAVBIv7JeDlAhiWv6UkooJlI9Tpl+CUhpAZ/yHtEcegj2w
 3lCNUcqFgcdL5jUUpCbN1xMPefOyjqfS/mFl60DBDOKJwnUki926Ifpo9FrN2XRA==
X-IronPort-AV: E=Sophos;i="5.90,295,1643691600"; 
   d="scan'208";a="70149174"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fcHDROX84ZtwP/aovoj/EspmNuUJlK0y72adpZDurQD8lmE64faCuA/S2ZatKCU2mmruREI5uJUzki0tOPGb0P9nqYVqGpaUD++5kxwb/cnWa5Wxtj9D67+hMK8/s7lrMKRgUMhxrtEIw/GgfDWrjZxMpRvMDOir0JqkyWDjyRXUMnTAszRICge50ECTun9Fy3toMyqGNWwNRoMNBNbXbswgUwOvBaK0uPpwlL99fygrS8VznpzyclQg3+YjEv5qr25rI63yPbltw80jAc9cIeu/CL/Z7T09zhbVPuO/+E91YDggKktvjARxX1U+yJpEDn9as2czU9BrK1lWszcIhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GryavTxYR6LKXF2Iv/E8mX3vooppy/oYJi74mU6x3YQ=;
 b=Z+uv0f0AfwQBcfBVOOcgn9W6QePgxHohCoBtuIvBYYaXMoZaWEgg+yTdmF/MeDh2sRBLwVrooejasNGLfFYZiPPRUm8Sdhof8eoG62Md4zDkvRrCfCUuhBsAzHjF/lDNWjMnSwzbc8Iri0KRGIx7pY5H1wetUpUnOkrgzwSvZ6olEdWqxQfmSogcbKCdyV6XhCVMoeCKok57C+6dbgmti7lXjsYYKWfivWSQNs+MGICYjLrhpHfBkAcTbDDCr1SUiSBo3hVhg/QvJlssM3Z1wyXhCwcGPaI94UAeQJu8ULLiM4lzRC5xR8fRmxtxi26SC/6ArXmUyuPMTBCgvOhrOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GryavTxYR6LKXF2Iv/E8mX3vooppy/oYJi74mU6x3YQ=;
 b=aY6X64QGPXsCy1RF03uGMQIEo5HgWa9lsuIKqsLpN6b4B4zqKOsgQuryUFX2cOvGusTrgThF9FKbFqIqsgWpK4EwXTei6tenmPQzf34J36sFhnw56/fQwl+MdHYBLjtgNbrfK9M6lbPCWId5YjsCFCUi2hGx/lq0OqkWbC0W5ec=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Steffen Einsle <einsle@phptrix.de>
Subject: [PATCH v3] x86/msr: handle reads to MSR_P5_MC_{ADDR,TYPE}
Date: Thu, 28 Apr 2022 13:20:23 +0200
Message-Id: <20220428112023.93195-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0031.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55184def-b63f-4536-8ca3-08da2909199c
X-MS-TrafficTypeDiagnostic: BN6PR03MB2721:EE_
X-Microsoft-Antispam-PRVS:
	<BN6PR03MB2721E0BC99CD9D9033D32C0A8FFD9@BN6PR03MB2721.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dHFXawJGjcMfGMv4TbCe1AWP8Khc+MPV4aAK81sjY81CAjOyIwmxDca7eCsbHyfoklX5Ke1GdLv3TEq+OaEIQPgCGG6JPFKwjkNmFajoIayehxe7wDYbWEF9xthMQB7TC8l6j4pb2KNz0z8ASHU44RTLk+7wxALbue9t8LzyycwMuha8IyQUDa4G642TNk3B4WW2uX5ke7uaQzZ/VoskBbM08ECPeO7mDdDZ8B25flX8WyXRHt6HiFlkhVkP5nx68JROuuAdJU1mYCDJrvpA4iaFdRlx7V4HWVnjw4jSFuebVCbLdjPTODgyeTrJUEpuNEssUGyKb+kVx/4xtwVH4L30ku0RrfrYQ0nP3UtnvnxWa1p+hgbP0k346TBI6cXkUMxmL54CS3hPRnftt2caqYynQSAC3FDGkMB71WC8Xq0/KJg14zFQVkYFkweOGb3C638qSINYnLEnNx7KAZP5mEWGz/I7ThhhVn/qq0f514s1Wrzev4/CwbrcAYs2FhjNJKKCnwpJ4JkkdBwZFj0HKJ9MN5x+4P1itH4caotmVWVhYDGH17H5h/BGqPpaYVLzNP7d/4PwXIbGoVHjqixFZRt78K+OZKfgTXZsP+vd44EuZknI3+QjE0UAkwdFhKmxY3svqsX80uARhZ65FlhPYw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(316002)(54906003)(6666004)(4326008)(8936002)(82960400001)(38100700002)(66946007)(508600001)(5660300002)(86362001)(66476007)(6916009)(2906002)(66556008)(6486002)(6512007)(26005)(186003)(1076003)(36756003)(83380400001)(2616005)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aG1DOURTeiszUCtuZk52cm5FWlJWOTB5U2xDTGp2S1NFUWRoTGVDN1d6ckZ3?=
 =?utf-8?B?RnkwVzdJeUdMdmJkL1RKVlBTdVRVSzVPeEdqSmNkZ3B0Wmt5UlkxSUIyNjBr?=
 =?utf-8?B?d0Exb2tpajhjNmZ0M05weGRGck9ZbUZ3ZWFDWklsL2lqdUZlcGFyZllDajJT?=
 =?utf-8?B?STBwVk5XWkpoWDBKcmRNQkFrNXVtZ2JJcW1ORExURmdaM1Azak9OSkxob0VT?=
 =?utf-8?B?Nk9EL3JqWER0Wjdza3VyejBFOEFPd1U1UENreno4c2E5V2ExRlRvenZ2ajYr?=
 =?utf-8?B?c2JUMkQ3aEhtZGh4YUdCenhIeVUvRGJUQ2lhSURmN2VaR29RcjB5MHBaMHRD?=
 =?utf-8?B?UHJqM1hHdW1PSWhiSUVIYmJFRWVlQzQ0NnozZ2dwVStGV2c0Q0drcVh1QmpS?=
 =?utf-8?B?T1hGZ1VqdXZSOWpTeWh4azFtNStMVWpkc1hyWmNNMUs4ZHRobzk0Y2o4WXd0?=
 =?utf-8?B?UlV4c0UvYXB4SnhvWTNHTXRLSkZkK25oT3VxMW9RdlFxRklmRzdUQStmMi92?=
 =?utf-8?B?ays3bVpXSDNTVnVrQlZ2TDBzb0dMTUxqRXRVTk1yYlNEblM3a1pVMGErbkE1?=
 =?utf-8?B?RWh4Wmw5SHI2WGZ6bVlUbGU4Q1NNU01NU0RvK0tTejJncXJBbkVocXR1cHJ0?=
 =?utf-8?B?aFpmeE52ZEV1d2N1N3FYZ3FIVFQ5QW5mcWM5dTRyQVhnNXAvclRoN3MxYUVj?=
 =?utf-8?B?NzFFdTJHY29YcW5BSUo5L0srNWNkdFE0dHFmbVNuR3NaN2hRc0xaTlUzdzRv?=
 =?utf-8?B?RE9wNUlOVGJ4bDJjaUU0ejF1c3ZzbW1yK2tKWDJQREU2dUozVXMvZnQwZGhw?=
 =?utf-8?B?dFF0S2JZMEpqU2NvbytFYVI3eGZFNnFnSk4rL3ZzZUtFUjB4bFNOL05jVzJQ?=
 =?utf-8?B?ZDgyUTVQVTZ5ZytKZ05aLzVJOTlHM3MzZ2pYbCt2aDN2alBqaG5hc0w1RkxH?=
 =?utf-8?B?WEVsVHlyeWRETU91Q05GbXFORXVSMUd4cG4rLy9WUjFjanBsWUVTK3hueWRU?=
 =?utf-8?B?TFZxaU9pTUgzRWFpMjA4dkswQXVMZ3lFZ2tsQjNRVXloS2dUUmRvV3VuMkdY?=
 =?utf-8?B?a0doc0poQkVXSWdJeENUNzNabFNKY2QvdzJ1aGFoVW81ZW9rSWJLRUoxSVdB?=
 =?utf-8?B?WktpbDRXS3ZGMGNxbUdaT1gramI3b3N0WjZaSmdDQ0dOajFwY3k1ck0vZjhm?=
 =?utf-8?B?U2RmbWp6aDJBanR5SGU1TFllNXBzKzc0UjArbSt0MGNJd3ZQcTFnNWMzNGUy?=
 =?utf-8?B?ckJjWWhzZmVpYkNzZ3NkenRkYWVhN01pbTJOS1FhdzFSRDlzT1B5MHI5WVBw?=
 =?utf-8?B?V3FFSWFUWWlobjhDWTFhdTBOUHBiMEkweC9CcWlvUWxpS1dwVXJsS3pNYzNh?=
 =?utf-8?B?SmRNT3YyRWY3eDBuOVU4TUNQWENrVm9XSXVIcXZQK0R4ZTZpZCtsNDFweC9q?=
 =?utf-8?B?dEhFWTcxR0NHbTdrdkxQK25YdEQ2bzVtNmt1cm1MaklYdTI4ME5DN3ZmRzUz?=
 =?utf-8?B?NVBtSC9ZUkM2NzFNQnZjd2k1YitEc0ZpZ3hDZ0c0aXNHWHVZaW16SUhjQm1w?=
 =?utf-8?B?SSsxWVBUdFJKaTZBMkQ5am9WQVdlM2RiTGFHeENnWUJZUzdQRVpDRVZOQ0U3?=
 =?utf-8?B?NzhBVVhwVmtVOENyUDVOTFdjWlBtRGhuM0Z5ZnluUFJ4WUtKSnlqV2NyU2dX?=
 =?utf-8?B?ZXUvMFJUZWV1b0l1RCtPQm02c3Z3ZVNZQVFQSWFaTS9kWXhCTlJGbU1PdGx4?=
 =?utf-8?B?UUpETmpSMm1YTHpIYWo1L2VvOEFxK0xJVkxweW1nejFvVlRiUDNrRUJwUmJE?=
 =?utf-8?B?M3h4R1FjWi82R2FNTWJUT1NXczBxeFNoSHhjUkk0M2grd2djejcyL3BYSG5L?=
 =?utf-8?B?THV6NHhYR2JyY3hLRFByUFIyWlZZV3JnVHdPdGJjQ2U3Qm55dFpQR1NRd1Bq?=
 =?utf-8?B?aUlxR1VxNjczU0RhclZzRmlqS3ZyTEp5cU41UDlRZ2NUVWF5ejVGTHJDTUdR?=
 =?utf-8?B?MzZQS3AzWExzc0graVo0Qmt1aVBVck4zY0tESnFjNnZqOEMySTN4M3FiM2NR?=
 =?utf-8?B?bHFLTjVZckY2SzNJTXp5ak05ZTYwdUVKTVpVcXFYd21ZYnZvM1RnYlhyMTFV?=
 =?utf-8?B?ZGlPTjVXV1BGWStaOVZENFVPNmVyQW02L3dSdjlKdDVzbmVzakJnY3NPU2lY?=
 =?utf-8?B?bTJDQmRjdkpIMERPMlZ3MmZuRjMrN0RkZ2MzMUY2K2N3T2xsWTZISFVBRGM5?=
 =?utf-8?B?ZFpjRHRCRWpGdHFVdWNyU09lS3Z0NExPTXF4SFpycVU4VXJhZGFQUnQzcGc1?=
 =?utf-8?B?cEZ1M1BHYjZRL20wRytQMXNTTFpmZFYxaVIxMm8ySENwV2NsN2FQNmowcWJj?=
 =?utf-8?Q?k3lih2GE4GK46jjs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55184def-b63f-4536-8ca3-08da2909199c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 11:20:28.9199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ME8JBhfxxpKXzxTctrS7Suu5KE539rTHgw+v+fcajtROajLOGaVfGKRvZbp2A2IaQUapObup+LTPHww43Me9wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2721

Windows Server 2019 Essentials will unconditionally attempt to read
P5_MC_ADDR MSR at boot and throw a BSOD if injected a #GP.

Fix this by mapping MSR_P5_MC_{ADDR,TYPE} to
MSR_IA32_MCi_{ADDR,STATUS}, as reported also done by hardware in Intel
SDM "Mapping of the Pentium Processor Machine-Check Errors to the
Machine-Check Architecture" section.

Reported-by: Steffen Einsle <einsle@phptrix.de>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Use fallthrough pseudo keyword.
 - Expand comment about bank 0 quirk.
 - Change condition for early exit from vmce_intel_rdmsr.

Changes since v1:
 - Implement in vmce_rdmsr.
---
 xen/arch/x86/cpu/mcheck/mce.h        |  6 ++++++
 xen/arch/x86/cpu/mcheck/mce_intel.c  | 19 +++++++++++++++++++
 xen/arch/x86/cpu/mcheck/vmce.c       |  2 ++
 xen/arch/x86/include/asm/msr-index.h |  3 +++
 xen/arch/x86/msr.c                   |  2 ++
 5 files changed, 32 insertions(+)

diff --git a/xen/arch/x86/cpu/mcheck/mce.h b/xen/arch/x86/cpu/mcheck/mce.h
index 535d0abf8f..bea08bdc74 100644
--- a/xen/arch/x86/cpu/mcheck/mce.h
+++ b/xen/arch/x86/cpu/mcheck/mce.h
@@ -169,6 +169,12 @@ static inline int mce_vendor_bank_msr(const struct vcpu *v, uint32_t msr)
         if (msr >= MSR_IA32_MC0_CTL2 &&
             msr < MSR_IA32_MCx_CTL2(v->arch.vmce.mcg_cap & MCG_CAP_COUNT) )
             return 1;
+        fallthrough;
+
+    case X86_VENDOR_CENTAUR:
+    case X86_VENDOR_SHANGHAI:
+        if (msr == MSR_P5_MC_ADDR || msr == MSR_P5_MC_TYPE)
+            return 1;
         break;
 
     case X86_VENDOR_AMD:
diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/mce_intel.c
index 50198e0c29..28a605a5cb 100644
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -1008,8 +1008,27 @@ int vmce_intel_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
 
 int vmce_intel_rdmsr(const struct vcpu *v, uint32_t msr, uint64_t *val)
 {
+    const struct cpuid_policy *cp = v->domain->arch.cpuid;
     unsigned int bank = msr - MSR_IA32_MC0_CTL2;
 
+    switch ( msr )
+    {
+    case MSR_P5_MC_ADDR:
+        /*
+         * Bank 0 is used for the 'bank 0 quirk' on older processors.
+         * See vcpu_fill_mc_msrs() for reference.
+         */
+        *val = v->arch.vmce.bank[1].mci_addr;
+        return 1;
+
+    case MSR_P5_MC_TYPE:
+        *val = v->arch.vmce.bank[1].mci_status;
+        return 1;
+    }
+
+    if ( !(cp->x86_vendor & X86_VENDOR_INTEL) )
+        return 0;
+
     if ( bank < GUEST_MC_BANK_NUM )
     {
         *val = v->arch.vmce.bank[bank].mci_ctl2;
diff --git a/xen/arch/x86/cpu/mcheck/vmce.c b/xen/arch/x86/cpu/mcheck/vmce.c
index 458120f9ad..af30811afd 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -150,6 +150,8 @@ static int bank_mce_rdmsr(const struct vcpu *v, uint32_t msr, uint64_t *val)
     default:
         switch ( boot_cpu_data.x86_vendor )
         {
+        case X86_VENDOR_CENTAUR:
+        case X86_VENDOR_SHANGHAI:
         case X86_VENDOR_INTEL:
             ret = vmce_intel_rdmsr(v, msr, val);
             break;
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 3e038db618..31964b88af 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -15,6 +15,9 @@
  * abbreviated name.  Exceptions will be considered on a case-by-case basis.
  */
 
+#define MSR_P5_MC_ADDR                      0
+#define MSR_P5_MC_TYPE                      0x00000001
+
 #define MSR_APIC_BASE                       0x0000001b
 #define  APIC_BASE_BSP                      (_AC(1, ULL) <<  8)
 #define  APIC_BASE_EXTD                     (_AC(1, ULL) << 10)
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index a1e268eea9..d87317e989 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -283,6 +283,8 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         *val = msrs->misc_features_enables.raw;
         break;
 
+    case MSR_P5_MC_ADDR:
+    case MSR_P5_MC_TYPE:
     case MSR_IA32_MCG_CAP     ... MSR_IA32_MCG_CTL:      /* 0x179 -> 0x17b */
     case MSR_IA32_MCx_CTL2(0) ... MSR_IA32_MCx_CTL2(31): /* 0x280 -> 0x29f */
     case MSR_IA32_MCx_CTL(0)  ... MSR_IA32_MCx_MISC(31): /* 0x400 -> 0x47f */
-- 
2.35.1


