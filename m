Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AE46FCAA0
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 18:00:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532300.828423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwPkt-0006iX-4p; Tue, 09 May 2023 15:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532300.828423; Tue, 09 May 2023 15:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwPkt-0006gT-1j; Tue, 09 May 2023 15:59:59 +0000
Received: by outflank-mailman (input) for mailman id 532300;
 Tue, 09 May 2023 15:59:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vSxc=A6=citrix.com=prvs=486b9cf0a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pwPks-0006gM-74
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 15:59:58 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89862df1-ee82-11ed-8611-37d641c3527e;
 Tue, 09 May 2023 17:59:55 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 May 2023 11:59:45 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB7012.namprd03.prod.outlook.com (2603:10b6:303:1a7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Tue, 9 May
 2023 15:59:43 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 15:59:42 +0000
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
X-Inumbo-ID: 89862df1-ee82-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683647995;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=W9gH6urSQ59K0ZNTftgzaVYfZVX6edf0EvkUySIZl+0=;
  b=CfQBGjtQgamkqucl4gRnUrBBSfondg4FlI65fhmRkMVs8eIt95M9HxSJ
   aFGsBP3aiR4xg6YQKQOZEO4dk3lxny+4CQpfpGJGbVaGD0Lp8/MWUXXzl
   wJQcJizhyKzbW0i+vUPdOy/R/lkV9terbLKBzCT4qlrCPE2Zrw7z7w1aj
   w=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 107173637
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RLXN/akW4qcIzd2JLEmRPF3o5gysJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJXGuBbvjcMzSjLdwkPd7l8RlXsJ7Un4RhGlQ+ri9kRCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aWaVA8w5ARkPqgW5A6GzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eM+DGEzVVO6vcmnxJWAa9cv3/8Ncsa+aevzulk4pd3YJdAPZMmaBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3iea8WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTOLhqaU02wL7Kmo7FloGfny8gOKD0V+iacxzC
 hMv5AUOlP1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xGWwsXjNHLts8u6ceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDRLoViMA6tjn5Ys13hTGS486FLbv14OkXzbt3
 zqNsS4ywa0JitIG3Lm6+laBhC+wop/OTUg+4QC/sn+Z0z6VrbWNP+SAgWU3J94ZRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:zQmUbaNxK5kDN8BcTuejsMiBIKoaSvp037B87TEKdfVwSL3gqy
 nIpoV86faUskd3ZJhEo7q90ca7MBDhHPJOgbX5Xo3SODUO2lHYTr2KtrGSuwEIcheWnoVgPM
 xbAs1D4bPLbGRSvILT/BS/CNo4xcnvytHSuQ4c9RtQpMNRBp2IIz0XNu9TKCNLeDU=
X-Talos-CUID: 9a23:Wy1ZiW9xLD1LOS9y+nCVv1EyPpEbST7k9lzBJ2iDKFgqEYa7F1DFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3A+gGRPA8d853GsYMtdClLJKyQf9kv84+JD2EWq84?=
 =?us-ascii?q?Xp/uaGQ0vACmyrA3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,262,1677560400"; 
   d="scan'208";a="107173637"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWF7UH+hulSXeiYvbeb3gvpF2vAnoyotoxW5mJ1gmka5bw4b/VI5hyOUhR6YGqHzY1bSBFfE+Ua5qzOX/2ti8ffaWAFomPYI1cwurSsHZtpjDaiZ7Nhpv873x2hWsd9Q427rZ2CflD/mthSw4EKENCNneCbJqTnpCGoQBia6AtUmOmiwZ5kFd8EOid7/FvSowYqGn7uqZtm2zrHJOLbVdWmCckLmFz3hffLIjQxLbW+5xzNo0VJvzfCLIFY3OxTRxjHPX4SKk24eG/GX6FG2dyzxxJwAan7KaKHsdd8eA7Rqdugdh2Pu3lg0QuscbH4KtR0NLyLJp6jxPsuL2Zw61Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AkvkqYWUH0cLPGfLd0sXi0jaQLqO4CG8XTHHa6qEJQs=;
 b=Za9ylj33Ueu4HQeMs+yYb196mSjyKABdz46y5LIZUf+JggJS2l9HrogCGxofM9MtTXGv/JUuAvipCg79ZP9Y/RKRSQfxc+Pm8s9mDGXUnOiUho7u7+hFpPjBUtVtZsP5Iuv7FBj6pvUkLIhsTR+FVxxzBSAY3XG/rr1aadVeeN5OpOtTAbjxMHprgth3tOCg8tucwIeQghUiBgilPdxJy5JnJSlQmOV8zXIA2CXZgEfYg2J4jjxc8I7GhgTKSVYHjXI7cB0KWa1zvAiG2Zn2oq29UAgj7ms93PmB3dwHHXmwU5M1XfBYn5rW6w9gZwxfJw6151wludAQ0iRacA1NWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkvkqYWUH0cLPGfLd0sXi0jaQLqO4CG8XTHHa6qEJQs=;
 b=tCTAyn/5oLTiI5a81kNZJZidzzbMCUXR9ieLaSp/m8TU666zlHYN/lxDYu2EfkLm9LkPJVy9pXLFJFx3qRs1Kc9ll6WPtod6rrgofEfGLlx7Yr67GPdO7KOc1D9AVMCKv75gQLc13xZN/eUkFpJlpZAk3NWLkMtcGrsCUnzwdtI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <742a5807-dd53-0cd1-d478-aed567d5c4f5@citrix.com>
Date: Tue, 9 May 2023 16:59:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/6] x86/cpu-policy: Drop build time cross-checks of
 featureset sizes
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230504193924.3305496-1-andrew.cooper3@citrix.com>
 <20230504193924.3305496-2-andrew.cooper3@citrix.com>
 <6531df09-7f7f-a1e2-5993-bd2a14e22421@suse.com>
 <18090224-6838-8ed4-6be5-ae10a334e277@citrix.com>
 <bbbd4c8b-e681-f785-b85c-474b380d6160@suse.com>
In-Reply-To: <bbbd4c8b-e681-f785-b85c-474b380d6160@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P265CA0013.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW4PR03MB7012:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a7b4d7a-4781-442c-9b3d-08db50a66701
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fOzxUB4/LOcB1KO5AtWWwrF85U5Hc3z9iejlVTSfqtXjC+ClJXfH009RGJJ+E2PF383LW2U34u5+jLRTKeF+1MCDFCDT+YyoVBrYfvNeq2J8oOUwVPW+BGzgKcE1J+AW+DOGOsyNQbEeZo9IaKR34ng8bQVTYZYqSCurKsLXI2AsPHia9LmMRcSz4Fv35jJB4wKtGQFc7Ma1f2Q0+1l2Uw/XXRMLzREQQBd5WTzf9uPQNSmcmoKqHBVwCwo/EyQLiZPCOZ4+SEM3Oq6CaJ7D9aBpqeF5FGwAvAaI/l8yBORJ7/OYvpq7tfmD5UFq7sNORLOekjxH0EizS7hMmyd23wYTfksR2xS0501OjbWghYSoePs/vIAIXAXBt0UiD6NWDygG1i7PLJV0zvxwJ+9o88rK8UX7VRkR7aspuKppDuSZXSli0Hw0rS8Prl4QyP+YEhE30miwccTkGbxrjyKnRBAgrIZUW294+W0V33yilSBuEDQ0qLnO97NbGbZ+N3E8MbPK3IA18/6XM7JfKsEfY1kjpq91Y1ZpXEFFEx1rTjA++nPfwWMSXrpC5o4RwaVgHVNNnil31RIhzclLRy1gaxyIAmaQVjQpUpa4uPyN0xkuAvDSP1Vxh+QJTcq3ZOpDVP44whe4ZztO83XLoAcCgg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199021)(2616005)(6666004)(53546011)(26005)(6512007)(6506007)(8936002)(8676002)(6486002)(86362001)(38100700002)(31696002)(478600001)(36756003)(186003)(2906002)(5660300002)(54906003)(83380400001)(316002)(4326008)(6916009)(66476007)(66946007)(66556008)(41300700001)(82960400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aG03aGlJRHl1RGdGSkZycGlsRjNwamJuWlFOZElYNm9sRDMzQ3Z0N1kzK2NY?=
 =?utf-8?B?RURDUGp6a3M2UzJ5cFNBbFlJYVR5YXAzSGd0b1VhQy9kUHhtYXNhSWRScGhZ?=
 =?utf-8?B?SEsrMWtLSE4vd3hEOUtGZlRiQXhTZXY3OWlHZE00bFBsMEpRbHFZQnY0WCtz?=
 =?utf-8?B?czhzWEVtQndQL1cxWU5ybG54WHF1d0Q5cFk0N1ZFTGtxc1ZDRFVuRkN4ZXc3?=
 =?utf-8?B?dnNkVlkyNXVkQVlmT2l4TS9hK2tkTFhSQmQrMzk2T0k5blV2encvZmZoMlBh?=
 =?utf-8?B?dW4vRnY2ZjgwU0dmVzJtL2RwdG1PU2VMRVhEVnBkbEF6OVVHK1RzRkxIdzBB?=
 =?utf-8?B?T2VuZTB1ZFRnK1hZM2puSlVlTUVPNUZ0WkxrampvYTc5VE1RL3F5THgvc2VN?=
 =?utf-8?B?YXMwdDZsS2VJRjJkTmJpZ1lEb0pNcEFxNVd0WXplamMvYlp5cHdUQnhldEVJ?=
 =?utf-8?B?Z0l3QkNUNk9tU21nUmo4dWtIMktwMDhCTm5OcTh3QkZ4ejZTYlMwTTMzTjRD?=
 =?utf-8?B?M3JNb0h3SitNbFRXaU5VSCt2T0EzSFhmdWM3Lyt6dVM4VW5xK2MvVFBORis3?=
 =?utf-8?B?a2dGT01mbExjQW4rT2creVlPN0VKazJFd3cwUjBLU0ZoSStFYXpWQlpiODN3?=
 =?utf-8?B?aXFXTWNqTEFabTZhQUN4UDFCbHdIWDFibVQrQmhHa2QxNnZZZm5zZDdIY0cr?=
 =?utf-8?B?enRZVTNnbmlGKzZudzE3WVE2aHJMSlNtVm4yTWY2U2pnWk0rbGdmbkNkL1dl?=
 =?utf-8?B?alM5S2g2STkzZEx6NEZ6ZSszRFlhVTliUjNIajVNN01oREdoZjZFYWJGdE1h?=
 =?utf-8?B?Vngzd0NNUjVHOWwyb1UrdWZFTkZ6SU5pWWVWZ0xGaFFPMnlDNjBjUzR3LzdP?=
 =?utf-8?B?UW9aTHJpV0FoTVJnUUVpTGVZdVVFSG1zTGdtWnREZFp1ZWIxN1ZZUjROZk5o?=
 =?utf-8?B?OEFDUXFWVUtVQ2ZDSFBHMmY1cVpFdi9BVGhGUHZhVHp1ODRndXl3VDZvZXp5?=
 =?utf-8?B?OEpuWDl2dlNHRjd1VGZoc2didi9yZzZQNERna2x2ckZ1RXN1djlkWk0xVGgw?=
 =?utf-8?B?MzVDTjJ5Q3ZLaFVNN3VqZVh6bEE0SmxtVDBWN3VYYWtZQ25JRFptY2JCcGds?=
 =?utf-8?B?SnN4bVdyZTJzY2tVd0ozZ3FiSmE3aGJiOSt6dmxUMG85aE93ZnRuZXE1d0lT?=
 =?utf-8?B?eGdtUXhaWk9pbmJ2NjhTZFRzcW04WkU5SEphQ0VSOGN2dmd0ZUQyb0ZIQmNG?=
 =?utf-8?B?SllEdldrYlFTWTJad3ljaDBtdldKNEUvQzdUcklkcUI1QXdtRzVpbFlKWkRo?=
 =?utf-8?B?RDJYemUrb2FZTkxVbkVaSjdDeUl6Z1lmSEVNdm5jcjBzbkdKelJrb3J5T1Q5?=
 =?utf-8?B?K1V6Uk8vOW9nT2xFYkh5NGJPTEt3SHk1eVNWVWNaekJCWGEzMG8vVzQzQ3U5?=
 =?utf-8?B?U0hGM2J3a3F3cElmWXJPNkxjSVQ5ck8wSm1ib1RmbjVOM21LalJZczJFOHZS?=
 =?utf-8?B?TzhRRU9LRWI1NFMweUw3YlVzK251MURLZU8xVVlwZ05lTGNTUDVZZm5TTEJu?=
 =?utf-8?B?SXRPOHlpRWFHWHo2UU1ZaHBrQmpTNnRIbUtzYUhyVlFwTHEyZUx1ellOanBU?=
 =?utf-8?B?L1gwU2JxL3RoYjJVaHRzWjZ1VHY3VmVvM291ZFBzYURSUi9FRUlaK05jR3J2?=
 =?utf-8?B?aGJxU3JTdHRFV2dIVXpsME5VTy9MRzZuUjBibWhmRmM4WVIrSk9NUlhJeHRN?=
 =?utf-8?B?S29HRHI5UkNjTjlxTXVxT1NMZjBVMW1MVXNUcm1sMW52WVZITmN6dTN3OUZO?=
 =?utf-8?B?cWptQUFjTnpvRy9RWGY4emQzUmVtZlRWaUplNWJpMFpRRjRZWW8rZnVlUTZ3?=
 =?utf-8?B?YW5EYnJUaGpUTi81N3FFZnhka0FZVUVXdDVIcEJ2d0xWRVhkbkJRczIxalNY?=
 =?utf-8?B?WlRSOFp3SHRSYU90YWI5dytsd3daQ05lV0FjR1EyTDF6WGU1YlNBaUcxdjB1?=
 =?utf-8?B?NHBHdHBzcnpFN1dxTzVqSlVPeWxTRVJDU05qbW50ZVg2UExBNlkyME96NlpP?=
 =?utf-8?B?eHZUb2VwVmV6Mjg2YXVDa0JKMExHYlRtVSs5ZmFkZ2xQMHc2emRDQW9DUlhB?=
 =?utf-8?B?S1h4MDBYM3NGZGdQOURCNVJqUWtIbURyZGQxR0oyYU5BMHZrYSt1c01DWUpB?=
 =?utf-8?B?cGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ND8uhVtwjN21bm3EQD6ysD3MAheEhDzSzjCMENXgM8wePXoGapZGf0tjSZlS5PIlwjI7swIXjbfU5xM54ogL25lnz0D3XNsOc0P9AeSHLiVfIoisZz+dXI8I72HFvAwX1QZi/RSiHWsJ14kSzSCKyghpejiausgJATfrcXkx/5CeOJE+Uj9Vfch/DYRmEYjmVRkBTREmup7KqLIBvCIWH+0VRvS59EXchyWfT5BEobIaFH26jcwKUrSabr5NeOkDTl2I+RWAYBiraHlqK/R/KKDqgB6lkahS6fAzc3IRcOGEqZgkRxY301D6TFuontb5nrtJxtmcbnb+IczodK6RFGsfbgWA/I5ttwUtIOjM5b4g/yh0gSqEDscrGIMoO8N1DfotqfVbe6Pu7SqdGf0fKSZm7VgA8wJWBeeF3oD5BDpl4S1BRZmBtpqq8pFyInoPKxsDAqpH+RkM1w6krjDhInqEY8eEFUtTFZ6D6JPNKhxMKhYFZ/zs+yagvrSq9Pj3naic4lbEfLzBK6VUOn2kUw4MdELKcugH/qR1aJ/H4rdnW3NjJhcvHi0O43jl9O/+7HXB8Iw09gKDA7oiJ2rGcYbRlydcCnpAgnsT7d/OpSkiV2jABJ2ZxgqLVgwOdao+DtNyGt8jA8YkPpVJy1JbOW/VqNrjMpcUPDTU8qXV9zLzcWN70BYUYZ51WXgy3+kCkIsyfKJTCJMocwWDkJeNcgVSWApoWWHIq35a4LmgTyC60mdPbZpN4Zvlww7ODNyDnnYfhc19i/m6iCw5c3OMa4gHhJNUQQluntAuFXHk/+kS1gFZbN3PLBlfxlmepT2q
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a7b4d7a-4781-442c-9b3d-08db50a66701
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 15:59:42.8893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DqIVw3H9w7mf8iDTz323MqsEUtz+euDBZOczPqb4CHEcyLhAJHv80gMaGdIzWIgqr+qR34Z1sU4UBtzYPNZKt/dvM8Wrk3QH2KtE1Ys4MjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB7012

On 09/05/2023 3:28 pm, Jan Beulich wrote:
> On 09.05.2023 15:04, Andrew Cooper wrote:
>> On 08/05/2023 7:47 am, Jan Beulich wrote:
>>> On 04.05.2023 21:39, Andrew Cooper wrote:
>>>> These BUILD_BUG_ON()s exist to cover the curious absence of a diagnostic for
>>>> code which looks like:
>>>>
>>>>   uint32_t foo[1] = { 1, 2, 3 };
>>>>
>>>> However, GCC 12 at least does now warn for this:
>>>>
>>>>   foo.c:1:24: error: excess elements in array initializer [-Werror]
>>>>     884 | uint32_t foo[1] = { 1, 2, 3 };
>>>>         |                        ^
>>>>   foo.c:1:24: note: (near initialization for 'foo')
>>> I'm pretty sure all gcc versions we support diagnose such cases. In turn
>>> the arrays in question don't have explicit dimensions at their
>>> definition sites, and hence they derive their dimensions from their
>>> initializers. So the build-time-checks are about the arrays in fact
>>> obtaining the right dimensions, i.e. the initializers being suitable.
>>>
>>> With the core part of the reasoning not being applicable, I'm afraid I
>>> can't even say "okay with an adjusted description".
>> Now I'm extra confused.
>>
>> I put those BUILD_BUG_ON()'s in because I was not getting a diagnostic
>> when I was expecting one, and there was a bug in the original featureset
>> work caused by this going wrong.
>>
>> But godbolt seems to agree that even GCC 4.1 notices.
>>
>> Maybe it was some other error (C file not seeing the header properly?)
>> which disappeared across the upstream review?
> Or maybe, by mistake, too few initializer fields? But what exactly it
> was probably doesn't matter. If this patch is to stay (see below), some
> different description will be needed anyway (or the change be folded
> into the one actually invalidating those BUILD_BUG_ON()s).
>
>> Either way, these aren't appropriate, and need deleting before patch 5,
>> because the check is no longer valid when a featureset can be longer
>> than the autogen length.
> Well, they need deleting if we stick to the approach chosen there right
> now. If we switched to my proposed alternative, they better would stay.

Given that all versions of GCC do warn, I don't see any justification
for them to stay.

i.e. this should be committed, even if the commit message says "no idea
what they were taken originally, but they're superfluous in the logic as
it exists today".

~Andrew

