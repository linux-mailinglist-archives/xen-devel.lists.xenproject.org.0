Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB44637C94
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 16:12:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447974.704673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyDth-0007OH-GU; Thu, 24 Nov 2022 15:12:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447974.704673; Thu, 24 Nov 2022 15:12:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyDth-0007MS-C4; Thu, 24 Nov 2022 15:12:17 +0000
Received: by outflank-mailman (input) for mailman id 447974;
 Thu, 24 Nov 2022 15:12:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GTCw=3Y=citrix.com=prvs=3201a854c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oyDtg-0007MM-Im
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 15:12:16 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f634b3c-6c0a-11ed-8fd2-01056ac49cbb;
 Thu, 24 Nov 2022 16:12:14 +0100 (CET)
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Nov 2022 10:12:08 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BL1PR03MB5989.namprd03.prod.outlook.com (2603:10b6:208:310::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Thu, 24 Nov
 2022 15:12:06 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%7]) with mapi id 15.20.5834.015; Thu, 24 Nov 2022
 15:12:06 +0000
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
X-Inumbo-ID: 5f634b3c-6c0a-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669302734;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=+XnoetakotoxNEToJ5NHRWB+nW0pCFYgCH6tkgYpQxA=;
  b=ZWNqMhFxm69OnNG/33nhZKlCiNR4F9PpEsYwqfjXnj+Dx4v1cQ7Md/fg
   NIu67mz4HpCvcUFwqA4nGLlDuB53iJkaLiiQCfKYVFFPeFslj3xQ2AUR7
   65+aG4jtoVm9suXe4Y7563u+cMyzBpB9pC6MyemJi/6MZJNBdMglFPt7/
   k=;
X-IronPort-RemoteIP: 104.47.59.170
X-IronPort-MID: 84551596
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Kmkd96i7B4cja4ASPOw0TQwFX161VREKZh0ujC45NGQN5FlHY01je
 htvXW/XOfaDYWr3fdB2PYvloBkOupKAmIcwQFNvrSAyQy0b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5QWCzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ/DQ8dTQq/vtvt76q2G/ZCttsNDtfCadZ3VnFIlVk1DN4AaLWaGeDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEgluGyaLI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXOnBd9LSezmnhJsqHTLwHZKAyUpaXy6nPuAhGvncOp1D
 mVBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rXQyxaUAC4DVDEpQMQvqcseVTEsk
 FiTkLvBFTFp9bGYV3+Z3rOVti+pfzgYK3cYYi0JRhdD5MPsyLzflTrKR9dnVaKw0Nv8HGiqx
 yjQ9XdmwbIOkcQMyqO3u0jdhC6hrYTISQhz4RjLWmWi7UVyY4vNi5GU1GU3JM1odO6xJmRtd
 lBd8yRCxIji1a2wqRE=
IronPort-HdrOrdr: A9a23:GVKnOKzn/yGY1irmFuweKrPxTOgkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scy9qFfnhOZICO4qTMyftWjdyRKVxeRZgbcKrAeBJ8STzJ8/6U
 4kSdkFNDSSNykEsS+Z2njeLz9I+rDunsGVbKXlvhFQpGlRGt1dBmxCe2Km+yNNNWt77c1TLu
 vg2iMLnUvXRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirCWekD+y77b+Mh6AmjMTSSlGz7sO+X
 XM11WR3NToj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhn8lwqyY4xlerua+BQ4uvum5loGmM
 TF5z0gI8NwwXXMeXzdm2qn5yDQlBIVr1Pyw16RhnXu5eT/WTIBEsJEwaZUaAHQ5UYMtMx1lP
 sj5RPQi7NnSTf72Ajt7dnBUB9n0mKyvHoZiOYWy1hSS5EXZrN9pZEWuGlVDJADNiTn751PKp
 gmMOjsoNJtNX+KZXHQuWdihPSqQ3QIBx+DBnMPv8SEugIm6UxR/g89/ogyj30A/JUyR91v/O
 LfKJllk7lIU4s/cb99LP1pe7r4NkX9BTb3dE6CK1XuE68Kf1jXrYTs3bkz7Oa2PLQV0ZoJno
 jbWl8wjx98R6vXM7zP4HR3yGGPfI3kNg6diP22pqIJ9oEUfYCbcBFqEzsV4o6dS/Z2OLyoZx
 /8AuMTPxbZFxqfJW945XyBZ3BsEwhubCQ0gKdOZ7vcmLO9FqTa8srmTd30GJ3BVR4ZZ0KXOA
 pxYNG0HrQM0nyW
X-IronPort-AV: E=Sophos;i="5.96,190,1665460800"; 
   d="scan'208";a="84551596"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLMbgPZxTC7UDMBnYaLs4C6F1jrX+KTD3w7Qaq8Kjla74h7fieNb0QeC7CpiQ3U8B27cMF9blcJw/phGbjjo9qedsqvVnCa2QNMJ34uvElsG80yqx6OCCTzo1isefgLjMbuOb+w8X7nLBCBagkOQ7ezNhJDqL+tIHokbNvXTOLmv6Ei5hHoLZHHbkGHo4k3D83wVoLbHKf84z7NU5ome1Fa+o8hrxmtXFtThwM3ef1uzbn35jop9w4MSzwBtacudpUY2eZhQ32bTK3nMGv9gHsl8N8ZZDKqm/SprlJiW6VmiGlVo4NzZzFez+DiYsGX8rCXfIVJYTnYvFez0U9jcZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=21OxjlFiUuit2SnAoDWdPFj7FvF+4J7Rk5F876MIRv4=;
 b=NG9vxLM2xBgL2dKPvHB2Z/63O8y7w2mXLiXB35K/0vfU/dK05Kn7sH7tMYs2NEr8zDET43C4VwuOSRFuemowJp4AweX3qF5Y4ynu5+WNiX7svPfR/B8SBvyFddxycosdvNfaXtykI3utBPShnkneRP3ZxyjL2Hn8IS38bTXUJauGII9q8MXRuxzslsHJpPQkSUCVMJHmODGXJeNgWmDMDeKLZ+BTbpAR3/fMFd5V3LUYlTRoq1Ma6DbVhyW22+RWb6byrS6PaLm29JSHmk4vu/T0U2YRuCd5X2XmvT+YnD2j0GgdxAN+wJ9ufcERDh0FjAkZ8wI8ekmRyYNgFpq24g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21OxjlFiUuit2SnAoDWdPFj7FvF+4J7Rk5F876MIRv4=;
 b=MKSWIVKLMugkNF2SKu0NLmeu1btm/aQ2vRj9BfvFOBqTlvV6Kp0G2vYdFLoG3z9OJytfR0w+RpeBEBXF4H9U9rMz13EMZ/lRBcutyxME7LDqpM4VgB2B6AFt1fEsLRBqyb3VXVtYvvWX6+WSke5T7YEXq5xF9CloMoqE28sCSJQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 24 Nov 2022 16:12:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Message-ID: <Y3+JwEtSHTRhngN1@Air-de-Roger>
References: <878e635f-b116-3580-945f-f8acb711a5bc@suse.com>
 <69507b8d-1f31-39fb-7469-e240fbfdde44@citrix.com>
 <33a005bf-0596-c624-0e70-077a450ac2ae@suse.com>
 <Y34L/MwSFGUsSe2I@Air-de-Roger>
 <351a6e54-8002-aef0-993a-c6b8bdcc1e8e@suse.com>
 <Y38ugExH9uGdw83a@Air-de-Roger>
 <Y38z/h4aEkzh5rCG@Air-de-Roger>
 <c928c198-2565-2105-2b6e-b07e96935080@suse.com>
 <Y386hoiAovoACjEG@Air-de-Roger>
 <3f3bced7-62e8-4ff2-655d-aed222f343a9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f3bced7-62e8-4ff2-655d-aed222f343a9@suse.com>
X-ClientProxiedBy: LO2P265CA0468.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::24) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BL1PR03MB5989:EE_
X-MS-Office365-Filtering-Correlation-Id: 092c99f9-3cb9-4f61-50c9-08dace2e3f9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bzw04FnPLdPtKEH5n/pKMGglZDeL7nnh/4wvkubXGc68m/K7A2LXBx5BKlxCg7lc1yXpdlq2yt+GOzWQDXHpw0V1g70we/f6INUPawkd2zJw9qVBuiE9gsBfOg0sEHvA81xhCpdeTmGe2w9DlWFjqh7SI8qX8OeuObqAwyUw9QFIhWvPOZnZk2O6t8b+3TCtm3nDZ433aBgLVw5OpSHcB9Pyhu5oc3DGQFQ1ACeHAFgAbY45tq8owTvg6QriHp3VMwKMMLCdUnKs4QbxOLqVZhLuTkVMinoqgXb/ORSGK9yfVnPPmlaH+yEAS/e60bcHDkuyLAxwh1LNK66z4IEOjmpKMTcy14EIfTgax9hN6wLkBB03nhGzEN+soyXv87+XBJChJ1kUb8BjVJx8tdLkQA1V6U2fspfGjzzlIfjP9Vsh8Gds44vwVFbQLVVrEEi574BprGujlzFckczu02GEHpoIXS2Aa2Y2JAHH0VF8C87fHUAeNOlYL2cM+dhm3b2MUCdpWiW2kEUzH2UVROd2ibDSzc7CS6wlOuEHq+ANVfhcBhR39jY4rLOL1e3AbMgIHiIP7JdT9PTroQ/u0RfFZKEBOn6tnL6B8TzpVkZYMN+wbmCgs2GQvV0ssdX0bl5fRnru5Tws+6vEzxFshqo0IlR4J13+H1g+QqCKuDOSOGkoB219VlHXfwwViUW+8AyzCkBQdvhjxxu/ZOm3D6M8nbWm8YcCnGwgnHUIQMz2ycE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(136003)(39860400002)(376002)(346002)(396003)(366004)(451199015)(6506007)(9686003)(186003)(53546011)(38100700002)(82960400001)(83380400001)(6512007)(26005)(5660300002)(2906002)(41300700001)(66946007)(54906003)(33716001)(966005)(6666004)(4326008)(6916009)(66556008)(8936002)(316002)(8676002)(478600001)(66476007)(6486002)(66899015)(85182001)(86362001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlJHd2g1cnpKenBNYjBGRE9aem9TcjVGeENwclNsQlcralV0L1RyWkdQcGZm?=
 =?utf-8?B?UTNaVGNIN2E2dHBLRmgzLzN3Zy9teW1KNG43K0UzbXhaVXRxSEpsSzU5cnBL?=
 =?utf-8?B?cy9xcGhzRCt2NWxFV21yM2YzUlBaamxXZW5CbVluVXhjOWJCNGNSRER1Rktq?=
 =?utf-8?B?WG4rcndrckJMeHA1M2R3a3l2Zkc4RFpBQ2dEeXBDM3FMU0lkUTBBZ3JjUnBF?=
 =?utf-8?B?MDB2ZC9EOXAvL0hnR0FVWTlQNk00bk5NV2xPV2JaNWJTdmp0RkoyYnBJUDF2?=
 =?utf-8?B?bUxHdHM2THhFZWRYVjBiTmg1S3VwbHZGRjdoWjd3TU5YVGxlSnkvVDI1ejEv?=
 =?utf-8?B?THV1MGMvRzRtVmlYbVhmK3RkeWRCWGFOS25vdGtrQkZEbHNMcWRFaGhhSWYr?=
 =?utf-8?B?bmxBSE1BT2RyTERkM0xyNCtIMWttZnZDRHhqcnB5VFRRK3JGNEp5M2JqZCts?=
 =?utf-8?B?T1h1R0tZVXRGeEtuQkdVTzdiVzZsSURyc3dBSkFaTStwbkM2amU2RXRwWWE0?=
 =?utf-8?B?R0pYbXYzUG5xaDZGNjVUOW5qcm1lTm05YWVuZTFweGdpaXlxMm4xdnc5K3U4?=
 =?utf-8?B?Y1QvdzJZam04ZXRtdXRNRXJrUS8zTkdwMEZCR1dMblhXQ3dwM05mV3R4K2hY?=
 =?utf-8?B?TTg4QXdLTjBLa0ZzWWt1SXVtYmtUWWFTNFpNdTBOQkpkd2lPTjRVSCsvcC82?=
 =?utf-8?B?YytCZHoxMUV5WUdBUkxzdGVoQloxQmtwN2RvODJUVWY2b3A2eXpEY0lXRXFC?=
 =?utf-8?B?akc5UXJFY0d6cjd5aHpjNkROd0ZWVUxKZ2Y0OG1kL0VScytSVTZJcHpaSmFt?=
 =?utf-8?B?ZFA4cGh5QmRMY3k2bHR1Q2JQMXFIc3Rqbnp1MURUUHUwRExuK2N2SFBTeTZa?=
 =?utf-8?B?bGp6ZGRFNzFvTXdaOGovV1B2SzArNmNpZ2llMDhSUnJ1N21VSjdsTlV0SmRX?=
 =?utf-8?B?SU1IdHFBdmNwMFBTYTI1b2o0eEFxSTVUYlJ6SXVjZTFiOEdNWFp0aFNsbzQ1?=
 =?utf-8?B?ZmFpOXN5ZFlaTGpGMU9heFJZZmphUG5OcUlwQ014YzV6MmpmUDNQS01tZzBG?=
 =?utf-8?B?R1lMcFZpbjNNdTZyZWMvcWxxY2NZS2RyQzE1WCsxWkRSdDNpLzB2NFpuSUtQ?=
 =?utf-8?B?c1ZORjJNQUFCUXhmdTlOKzRPQWtMRlp6SGxkNGFrY3U0dWlEblAxNFFrMHZE?=
 =?utf-8?B?QTBCTEJoeFZDeTlGYXJveXRiVllFbkVudWxyMmt2UEg0V25LUVZwZUtraHIv?=
 =?utf-8?B?QTJ6WDg3aXlXNHRuRW0rckxsTTdhNmM3dnJnMENFTkVUK2tBRFBvNU5CdDMx?=
 =?utf-8?B?SW00NmwrQVdUaG9ickRYYi8yUEV6b2t3dWtTWFN0bXhEa1FFNkN1aGJZc1cz?=
 =?utf-8?B?YjhzanBUNmlkaEd0a2JuUFRsSUdEUHhTS2o2NXRpaFJBVGliVGpBSlZUazZG?=
 =?utf-8?B?YVllc0dYRUIrK21UMVQ1REYxc0FHY0FVNTlXTXdhWWx3RldiV1VHMC9QMEFM?=
 =?utf-8?B?eEJmRS9rMmlHQ1l0YUhWdDczeGtjKy9NemVpb0QvUTdoNEtvS3hEbGVSTlJv?=
 =?utf-8?B?Q3lQSHo5cDlvdzRHZUloS0F2amt4MnA1V2ZlUUVmNjZOdFYySFNvRTFWOWIx?=
 =?utf-8?B?dmdCNEt2Uk50NFk0aG1iN2dxWUNkZmNEdERVNmZ2Z25CeFNucjJxSTJ5TDRV?=
 =?utf-8?B?Ti80U3JsMTRVS3g0YS9mdHVpdk5jTmhPaFRZeDlENTNUMjkwVXZCYk8wbHBo?=
 =?utf-8?B?YUVDVmZZcE10am5ieEtWVUN5SmpFbExpMjNsVjh5U21ZdlJBakZMa05SOHBw?=
 =?utf-8?B?OERaaFgxUFQrOEh1bTdHZGc0TklCKzB0N3B1MGZ5emd5ZTcxTmM5L1U2dTh4?=
 =?utf-8?B?ZE5YcnlWRXcxVGhrZmxMYm9WRE13bDRrcVEwQ3ZsUnF2dFljL2J0UU5DemNt?=
 =?utf-8?B?eW1CWmZUelJFamZtZzViKzcyLzk0cnpsQnhiZG00TVpHald5MDRRMDMzYVk5?=
 =?utf-8?B?YjFJWUliZWxYdUtEL0Vma2h1d0ZqaWFXaFFnWE1MZGpoa2N0K3RHTkxkWmxp?=
 =?utf-8?B?ZmM0UnYxcnhPWVJYZlNzRW1qTDlQaFFuYTFBMytMTW1kQnN4WG1hbUVHNmow?=
 =?utf-8?Q?99ul5HxdpCgziOKgIuKahaqma?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	W1+fPpRNnEt0zEKQZoQLT+Xemg7hjqtSpUthVimSdbP/Jdt0v5TTBM1urMTK1U4fJDkT+/kS5coWj5CvxA6DxxYX6A4LZ/j6fwc1k4HqWLmuINh6dKWyCHHRYTPMA8ZIiEyRlULsxCYFp1Tw3hoyKmcGRynkLCq3BgRkB3lwk6JrCt+RRmY7JiOGhiE9FUDgkxbXeqcAKAel79sxZPoWJtDgsU//+cojubYDmTfqYR20eyVbxRi8mOdEbyKgGFmND6XENZRHYFh6vXp3V6g918ZSBytascg/1BNc0025GfTBONaSNTZPboCG1fVvCYeMFusCQypZr9nxm7E5Rs/k8sRw7HoTz6hpwWpJlJ2xYaQRMoa7Oa2aKLyY0j7DYWFWcORHrS2H9oN/k0XcKd3GdmNdTk/nEAOvZ80Nc95zv/rasp5DX13kj765jqokRnh6jOjDdn+lgNYdvG+zwk0xIzJ8N3uSIZ35giJrCngRpQmC0rZfKwEdLYiKJv6OKqi4RyFaLuTcRlOdW1Xa3wlPQR+bn0Mv5VcAT8M4J1/fJGjBP03sKEVGytk2R6M4mfG+t43clo3BnOMGzSIYTmHL4rfGsvL7O1ApIVoLQwLuLCWoYrlOCXfC57CHWInXjQiy+KdpBWMmEA2MEbfwcMpFmsa4xSVJ4UGMmjIxWk6NKUCqQ5x4368LrHp+Nqb3XzSLp4dk8SLVf5fAvuNayc2sb/MgFWCu76ZYl3QiuExAwAjWYMa5jYLyTGpKcLMUf2EzAwiS/Z82+Rb6S+iR15om0pMx11rDkeTGqcM8r/G+kkN11DEbFVcsBO/41ZcguIEOj3oaG7B9ChwcKJt3VSSTZ1bXUYZvnhjGYc19a3vCrl0=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 092c99f9-3cb9-4f61-50c9-08dace2e3f9d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 15:12:05.9469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xXNb8QKZbpmRbT1FIeEz0Nwmwi+Lmm886K7BpboKYssV75b09QSkyh0+ft993Z/XvaOf0yJ3RAiIv88k+QwKTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB5989

On Thu, Nov 24, 2022 at 12:16:13PM +0100, Jan Beulich wrote:
> On 24.11.2022 10:33, Roger Pau Monné wrote:
> > On Thu, Nov 24, 2022 at 10:11:05AM +0100, Jan Beulich wrote:
> >> On 24.11.2022 10:06, Roger Pau Monné wrote:
> >>> On Thu, Nov 24, 2022 at 09:42:40AM +0100, Roger Pau Monné wrote:
> >>>> On Thu, Nov 24, 2022 at 08:59:00AM +0100, Jan Beulich wrote:
> >>>>> - problematic wrt evtchn_upcall_pending, once set, preventing event
> >>>>>   injection later on.
> >>>>> As you may have inferred already, I'm inclined to suggest to drop the
> >>>>> the is_vcpu_online() check from hvm_set_callback_via().
> >>>>>
> >>>>> One related question here is whether vlapic_do_init() shouldn't have
> >>>>> the non-architectural side effect of clearing evtchn_upcall_pending.
> >>>>> While this again violates the principle of the hypervisor only ever
> >>>>> setting that bit, it would deal with the risk of no further event
> >>>>> injection once the flag is set, considering that vlapic_do_init()
> >>>>> clears IRR (and ISR).
> >>>>
> >>>> That would seem sensible to me, and was kind of what I was suggesting
> >>>> in:
> >>>>
> >>>> https://lore.kernel.org/xen-devel/Y3eO0bMKRPYJc2yQ@Air-de-Roger/
> >>>
> >>> Another option would be for vcpu_mark_events_pending() to
> >>> unconditionally call hvm_assert_evtchn_irq() regardless of the state
> >>> of evtchn_upcall_pending.
> >>
> >> I think you said so before, and ...
> >>
> >>>  This will create some spurious events.
> >>
> >> ... I continue to be afraid of s/some/many/.
> > 
> > Not _that_ many I think, as we can only queue one pending interrupt in
> > IRR.
> 
> We need to be careful here - the kernel treating it as "edge" (like
> any other interrupt coming directly from the LAPIC), it ack-s it
> before calling the handler, i.e. before evtchn_upcall_pending would
> have a chance to be cleared. See Linux'es sysvec_xen_hvm_callback().

Hm, that's not how I handle it on FreeBSD, where the vector is acked
after calling the handler (evtchn_upcall_pending gets cleared before
the EOI).  Maybe there's some corner case I'm missing that requires
the EOI to be performed before clearing evtchn_upcall_pending?

> >> This event delivery is meant
> >> to be kind of edge triggered, and I think it is a reasonable model to treat
> >> the flag going from 0 to 1 as the "edge".
> > 
> > Hm, it's a weird interrupt model I would say.  In some aspects it's
> > similar to level (as the line stays asserted until it's cleared), but
> > we don't get new interrupts injected into the APIC.
> > 
> > Maybe the right mode would be to treat evtchn_upcall_pending as a
> > level triggered line and keep injecting interrupts until the line is
> > deasserted (ie: evtchn_upcall_pending == 0)?
> 
> As said above, and as also pointed out by Andrew on another sub-
> thread when discussing the (dis)similarity with IO-APIC connected
> interrupts, at the LAPIC there's no edge/level distinction anymore,
> as we're not dealing with "asserted" signals there, but just with
> messages sent on the bus.

Right, we could likely fake the behavior I've listed above, but not
sure it's worth it.

We should likely have some of this documented in xen.h next to the
declaration of evtchn_upcall_pending, at least to note that once
evtchn_upcall_pending is set no further vector callbacks will get
injected until the field is cleared.

Roger.

