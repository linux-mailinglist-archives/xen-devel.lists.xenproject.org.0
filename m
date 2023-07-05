Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C010748049
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 10:59:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558853.873308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyM4-0007MD-Mo; Wed, 05 Jul 2023 08:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558853.873308; Wed, 05 Jul 2023 08:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyM4-0007Jt-Iw; Wed, 05 Jul 2023 08:59:20 +0000
Received: by outflank-mailman (input) for mailman id 558853;
 Wed, 05 Jul 2023 08:59:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hFzj=CX=citrix.com=prvs=5438f3518=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qGyM3-0007Jl-Nu
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 08:59:19 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37c232d1-1b12-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 10:59:17 +0200 (CEST)
Received: from mail-bn7nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jul 2023 04:59:13 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6477.namprd03.prod.outlook.com (2603:10b6:510:be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 08:59:10 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902%7]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 08:59:10 +0000
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
X-Inumbo-ID: 37c232d1-1b12-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688547557;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=RDLM8wX+GFsJLjZT93hHlvwkcV8Cd/txxT9hjTWWjpw=;
  b=NUfS09SkGb3D1nSRVJdk5hPhd46x2v34bhYH7emjFppwwE2SNBR+ZzdM
   0pgVDQgFtlahVt7aISZRztFnfU9nv9TJbmJeB+K60VkcM/A5UJYoSbd3a
   nPp/UOJ+KgL49y+JSHbGwz2ApnXpYmBMjsPY9fO8nhDBeoPvF7BsLoOD3
   s=;
X-IronPort-RemoteIP: 104.47.70.102
X-IronPort-MID: 115221195
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Yp8Sdq3exf7+DMztMvbD5UFwkn2cJEfYwER7XKvMYLTBsI5bpzdSx
 2FJDDyPPP2IZ2X9e9hyaY2z/UkAvJHQzNNjHgFqpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8XuDgNyo4GlD5gNmOKgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfKz5ip
 dMDCWs2awmj2eCMy56AeOB9v5F2RCXrFNt3VnBI6xj8VK5ja7acBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouy6KlFYZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r137KVx3qiCd96+LuQ3fhWmQyInVwpVRhOFmm9hfL+12S0cocKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUS1gaJzabF5heDMUINRDVBdd8Oudc/QHoh0
 Vrht8PkA3ljvaOYTVqZ96yItnWiNC4NN2gAaCQYCwwf7LHLh4U+jQnGSNp5J4ezgsfoAjH7w
 z2Mry8Wiq0aiIgA0KDT1U/DqyKhoN7OVAFdzgfKWmOo6CtpaYjjYJangXDA9upJJoudSliHv
 VAHltKY4eRICouC/ASVSfgJNKGk4bCCKjK0vLJ0N5wo9jDo8Xj8e4lVuWl6PB0wapxCfiL1a
 kjOvw8X/IVUIHahca5wZcS2Ftguyq/jU9/iU5g4c+ZzX3S4TyfflAkGWKJa9zqFfJQE+U3nB
 aqmTA==
IronPort-HdrOrdr: A9a23:18CFgKgA8G2uMG0vp3O01CnHFXBQXuUji2hC6mlwRA09TyVXrb
 HWoB17726NtN91YhsdcL+7Scy9qB/nhPxICMwqTNSftWrd2VdATrsSibcKqgeIc0bDH6xmtZ
 uIGJIOb+EYY2IK6/oSIzPVLz/j+rS6GWyT6ts2Bk0CcT1X
X-Talos-CUID: 9a23:PaG4JGN94rnug+5DcnZLpGEPO5sed2T9knXqKGODO294cejA
X-Talos-MUID: =?us-ascii?q?9a23=3AwHz0Pw1flElBPetoGvJ3zLIDyDUjyKKSEREWyqU?=
 =?us-ascii?q?85szcdh52Hzza0R69a9py?=
X-IronPort-AV: E=Sophos;i="6.01,182,1684814400"; 
   d="scan'208";a="115221195"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZB4PK9ZNgQSx/o7fYZHTzH7L0eTaUdUQaWZ4RGDseuAC3WRW7oHKxamDsFgo/yLUIyzAVKgR9IUYF4VlEbqwsFXPmBGgR/w9Pc+cy702rHJeC16Xi01fo34qLOHl4xpVZJVXkoayQhUNlQNgcfjS+cDuCbGanOgU8nJ6VSv2AETwmzcX0870xH16xV+s/X+LOaj6qvUgxIdVijQp8Q1svOmiOBy5UQPZebwEcWYMcLiPYEabWs+31UTPeP7+sHNwkDp3sNzgim5HPeMSaI/+rLLVuT4T4sEWIgbMcGBkBydHAeKWOdQ+Ix5KLMjkpcG8NhPG0Ucjck9IjBCOjOnU4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vG5yjm9LnzT5cClrs/a/AivTKV0lSsBI0fIE2N1cEy8=;
 b=PB3aAldRPgOpPN1v8IxxVPr7U/GGeUahz2nxsE8fd6TKf2QAoTSKU56x8lUG4jNNU77Hat7iiywymtAzNnZY1IIDZMD6FIMGM0NSfNj6kqO56Jy7SiIvMxje3nU1MpGRz+ujMgWty6zc/BRqYsMvMZKth8dOpMcbhCjRXFLWCEveQgKK+7qtImejijQ515dTQlqZajHUQtDERdmgZ9eU3dNV4ZKjzogZL+xo4zAXPrP8Np8+sG5SrDIKX+RVQJqqedCyeRZo/WNZsnAlytlqlrl5pXOE9LAcmFt6ttx3AX8FYqx6ea45Gorenh7RB6OI7WVRmCuAGWofQ7htjgV/oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vG5yjm9LnzT5cClrs/a/AivTKV0lSsBI0fIE2N1cEy8=;
 b=iv1AOrU1Ql5pav2goyBBLx0qICG4G+84eJ4tejPNiYOTp1aCk9HL9EUdr86aB6HjfKD5+UJkyu5prdDmtw92uHtWjQ1ooie0fdTPTkUhM6hmxl3vpilNhu686JbdBiPcFIAgxT1zy0OsL95bi1qperaDwWHNLh2othgXMYJetLQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 5 Jul 2023 10:59:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v7 01/12] vpci: introduce per-domain lock to protect vpci
 structure
Message-ID: <ZKUw2MPBhOSgG-Eg@MacBook-Air-de-Roger.local>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
 <20230613103159.524763-2-volodymyr_babchuk@epam.com>
 <ZIyOCan//39V3bdy@MacBook-Air-de-Roger.local>
 <87352kpj04.fsf@epam.com>
 <ZJQDGOrP1I3hR5Jj@MacBook-Air-de-Roger.local>
 <87ilbfnqmo.fsf@epam.com>
 <ZJVc77SwvyKOEdnJ@MacBook-Air-de-Roger.local>
 <87wmzfmltd.fsf@epam.com>
 <ab79bcb6-6fc8-c68f-65bf-16ce7316c3ae@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ab79bcb6-6fc8-c68f-65bf-16ce7316c3ae@suse.com>
X-ClientProxiedBy: LO4P265CA0180.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::11) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6477:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f523658-282e-4b6a-a5de-08db7d3618f3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FeQHBjioexWrkXsJ4DJ5A58DAQy+NTPHirG+FRZ7tq4JhpFUwb+/P5U2pz6hwec4Ykpgd7RCkDN63t8XqyMbcdSVuxaT09Gf7TWH04i7dcXK3FlHlma4Z+k2vyxsZSWpS4K99tzjTBwtT+porRpGPNVThGldJQnY9BfQC6YzuE6dPYvq/tc0QTvfyuXIKLueSXe2uSXTOLOlK9h+VZrnkHUcRUYVxMJBrA4r4WyHxXIGbbETRWwScCsG9HS5t5PoTc86MIG0UvOWdBl/KI+xVr7cSbMZvUgS2RTiqvk1WuqZEtCjOaGebArIaxOunPUvxLGyGKwIs0lTlT2QfSsfHWKsmkbmTz5BARjLTmKP30YSzusBsOiMyaFpKi3/cgLzOkN4dXGL37buGcXvLfl1FgpU8yRoWZwFbGYKYx9pOiluwsUgC8GN96JwlKkH/pxna8ppuFl0lxtC5zGYfaqu2ApZsFRv3nmMGx4LJyJmf2aQca0LT4u7YH7BRr6W1o8KTQ4kLJrpfTZDaQmE9ibxXd2cQLLLQxb0WAKkdrLBCBFGbUK4Oukksjgrj7myFB9R
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(451199021)(85182001)(7416002)(86362001)(2906002)(5660300002)(6512007)(186003)(83380400001)(9686003)(6506007)(26005)(53546011)(6666004)(54906003)(6486002)(82960400001)(66946007)(66556008)(66476007)(6916009)(38100700002)(316002)(4326008)(478600001)(8936002)(8676002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vk5PREU2RUtmSTFabmVxOVcwQ05BK2ppQnZrS3NSdE5ISk8wM05GcTF3UGY2?=
 =?utf-8?B?cHVGcFhCTmdSUlN5UHdCbGxneTh0Smhta0I3RlZmSDZPbkt5R0tNNU5ac3BL?=
 =?utf-8?B?TzdYRU9MbmN6YmhKM2FrRmFuSzA3dGQxc0NSY1dLK2twZkFsNEFXL2x4cURG?=
 =?utf-8?B?WkdHaDJ5ci9TQlJRekxlV2RDSFhnZW80VlVGOEVRQmVaL2UwRXdzenNBLzQr?=
 =?utf-8?B?bnlnRFpiZEl6Vng0eThUTlEyck5NclRNejJrdlhXZmh5akVOWTlnUlBsRGly?=
 =?utf-8?B?NDlSZTlsMk05bnlHR2llK1ZvZ0tLQ1hGaitJRFlvTUdnZDZwYkVEM2hSMlk5?=
 =?utf-8?B?bjAxS3BPY29YV085R0NQdFZQK3ZjQjFrUUk1MENsWE0xTXcxNXljbHFyTUkv?=
 =?utf-8?B?S3cvVmtucHpWK21NQVF3bk1QNGg0OHo5UzJQYTRNbHpuSnMxdWI2UmFWaXdM?=
 =?utf-8?B?Qkk2TkNsRkJIb09ENGkrbWQyZkpmUFpsMkNtYitzWVBzc3Q5RWFwbjY0bjJK?=
 =?utf-8?B?c1dMaEJtcmt0bktMWUJhT0N0cHptdzIxeXErcTZxQklWRE9HLzFFVWVBZ0pa?=
 =?utf-8?B?bW9FV2NMb3ByNnZnNWlwdFZtMWNjTElKanpGdTMrUGs3TGJVQUlQSWk5SDVs?=
 =?utf-8?B?ODdzK21xaUwxblE0Yks4K09rekh4VDROZHJRc2ljVVZGdS84RFVBQWRrMEZN?=
 =?utf-8?B?MzV2RmtCSWhScVVVcE5CYlFnSTA3bzh0QmRDRHRvSFVkRDBaUkl1dzNMZU9H?=
 =?utf-8?B?cGRHUUZTaENINjdlUHBMUzc0NktOZHVXRGRzNVBYcVRlUEx4c2kwWERoRU9T?=
 =?utf-8?B?WEdwSjFQcTYzcUVUYmhhR0xlRlZXVlRadTUzZFpRY2cxa3NuRW5uV00xVzM0?=
 =?utf-8?B?a3pydStPWXVYOVdiaUZDSVRvYUtLdGU1VlNpQ005c1BKbEZPbkw2ZVZqNThu?=
 =?utf-8?B?cmx5T2ErRVdjUW1oTThqS2hRMGo1aHFnOHNFaUU3SlZUVG42QVlwR3g3Zkto?=
 =?utf-8?B?a0lUNGV6VjNjcFZhM1FSQitzWVE1R2NhaTY5QjAxQjZnWDY1K2haZ2tMRWM1?=
 =?utf-8?B?QThvd0dnaHg2Zjlwa2NZSGw5U2ZDU2gxbW0wb2pTSlE3aWVrTmxSQjB3ZmV4?=
 =?utf-8?B?LzNBTUpyMDdMZmlSall2TDVZUVBFN2RQc2lTdDVsamNoUm5OaUF1SHBGWWli?=
 =?utf-8?B?Y081WTV1Yks3ZFZyVW1TSmlsOGcxbjgyZ2Rjb1RtUFJuUEE1TFJhV0x5ZFVM?=
 =?utf-8?B?bFFYdisyQS8wYkFmdzJnZ1N2UWNIUmhrK2l3cElzSTEzL2t2ZDlMMEhTaEMx?=
 =?utf-8?B?Y2U1ZXc5MG03RHY3cXJBTlBSY1FyVjN5NEl1K2ljODZVcDBSSTY1YUlnZy94?=
 =?utf-8?B?MVE2M2hPbU1XSzY1YWRBQTVpcHNyR2dJT1VURHJ2RVd5ZC9qZFNUN2xZNEMy?=
 =?utf-8?B?VzJpNDRIa0RObFp1TGtBQmpSZ1JTV21RWlJsbjlhTjdKSW9Gb3FOQlRYYjBY?=
 =?utf-8?B?dWJRamxYQjRqa1V5NVZrSnowNWpoaHdzL0FBWFZwbjFCc1FtVFFqM3NuRlNQ?=
 =?utf-8?B?RkNCa0ljNGRIRzM5M1dCd1U1YVVmY0VMdmZLczBkaXpPbWtQbDFmbjA0YUdC?=
 =?utf-8?B?Nm1MUUgxYlRtTGNoRjlFVlcxanBWbVZtZFBURHpPcWFVOTZVUjFudHptUGR5?=
 =?utf-8?B?Q0dFb2dDY1U5eGhRUDBIK0trWlBnU3Z4S1J3ZDVWckZjMFJxTXg3Snlzb0lI?=
 =?utf-8?B?YTVMUSt4NExyQmNDS3U0WldXbklKQzA4RTFKMGEzcFpzemNJZG4vT0Z0MW9I?=
 =?utf-8?B?citEcmVVbE02enUveFQvaVJOY2FIcTdyQ1RVTk9GTFFOeFp1dEVrRFhpZnVt?=
 =?utf-8?B?M05rVWM0NXQ3bWIwM2Y3RmNmK2QrRERVcnJNYVZNa0xkT2lKNW1SbE93R1VT?=
 =?utf-8?B?WHNoZTZOYTZxc2dXc3Z3M1duUW1KOFJwalpjazg4WlhCVjZESzRLYWkzMStO?=
 =?utf-8?B?cHRzOFlhSHhMS2VjV1dYNHlCd0M0ZlVRYVdveEVmdUY0YXI0MkJUNmJJVGRX?=
 =?utf-8?B?VFhLWjAxT3NsSnV4REhLQjdiVjNUSTRkdmp5cEUxZkZCS1RLd3dWTmtYRWtC?=
 =?utf-8?B?eGlVNmNLT0xqMDNlY2k0SkNuajU5K1FXMTdYM3JNWFBiaVFaV3ExdENzT3dz?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CrJh6lwCWjvLfZAJ/izPtYukb2hHKx1XGOlvfDLPAYHnAAQIvhw/0VA4wHI2fmcEQVxUJgb838hyh+gHMXguaAwtpo44Z6f0AMT/oB1VUSItqVg8YeqvE318bO9WGRHHwdHrK7/PvTD1Z1fzxlP1Y05NTXpDCWlqR/a4Huy6UmHm2RR9NqjCPvJu1WEKVlbNd1pihI6Idr2IV30jJAeyxOJqT5UZk1wIOBAyiCPwJET96Hd2/tuvBmEuPMBEMmtMUy1KyVVVXobjl+knAPdtTuimwGTpY1C0hhxmilsnhONbf5hKXh99Kbrx1t5oSS2t+udDeHxdAL5zcI5j04Q3KBQNJJ/JwFfahkBhHd+Rp9iSTIY1f1U4YIeIgS57IhhJsPKLByyRFvx+1+d7t3Wm+c2zIeST/1YCwe4CSzzR85PufNXlJuStbZmwww1HysRQEQo9XWztjFOTwDBmoyAywXOCK7K9dzbcoMYjcw9Cc1uFTP1cqzARbaIW+4pydcmHZUKYTAKAJgCDBrEY1WP+bv7IkDQpNuo9sTHvMItYKC6c8R0dg9tXrc7o++h6LLd0pzo15bfMv6AKe92YPj5kFSIo4V6R/z7FndWwKb3hagWpuSpY8spibGGcyFZZbq2E2e90QF7LpJTyVrZ3bt7LRYS5RG9dhSAL4RUonqtX/AnQe6DMLmw05HNL9RY0I9BNt4xsuUgozc0sDiB33eLw98IEtFZiY5Q4KY1dKk5eCBnmw8HoXz0N3NOnWdyqouX15dGkWtCw2m+SKyjJg5bqN+Vk2uIYGI23yXfE/Zzb0mCPGrC5rKgrBnpJXhXlLqzEyCR98dpMuF5VazeHV/RWaOcNshxi5D603T7kJfTBQGVepw3uqbWBpWLmjI5lEYUv
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f523658-282e-4b6a-a5de-08db7d3618f3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 08:59:10.6377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I9f183Xlpu++pynbtqSZD9/NtjUzXtORQK1MmYWUWjKZKY1TjoL5YK1TFgpZ0VWxNZUrOY1xNsnQwa9yXw1R5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6477

On Wed, Jul 05, 2023 at 09:11:10AM +0200, Jan Beulich wrote:
> On 04.07.2023 23:03, Volodymyr Babchuk wrote:
> > I am currently implementing your proposal (along with Jan's
> > suggestions), but I am facing ABBA deadlock with IOMMU's
> > reassign_device() call, which has this piece of code:
> > 
> >         list_move(&pdev->domain_list, &target->pdev_list);
> > 
> > My immediate change was:
> > 
> >         write_lock(&pdev->domain->pci_lock);
> >         list_del(&pdev->domain_list);
> >         write_unlock(&pdev->domain->pci_lock);
> > 
> >         write_lock(&target->pci_lock);
> >         list_add(&pdev->domain_list, &target->pdev_list);
> >         write_unlock(&target->pci_lock);
> > 
> > But this will not work because reassign_device is called from
> > pci_release_devices() which iterates over d->pdev_list, so we need to
> > take a d->pci_lock early.
> > 
> > Any suggestions on how to fix this? My idea is to remove a device from a
> > list one at time:
> > 
> > int pci_release_devices(struct domain *d)
> > {
> >     struct pci_dev *pdev;
> >     u8 bus, devfn;
> >     int ret;
> > 
> >     pcidevs_lock();
> >     write_lock(&d->pci_lock);
> >     ret = arch_pci_clean_pirqs(d);
> >     if ( ret )
> >     {
> >         pcidevs_unlock();
> >         write_unlock(&d->pci_lock);
> >         return ret;
> >     }
> > 
> >     while ( !list_empty(&d->pdev_list) )
> >     {
> >         pdev = list_entry(&d->pdev_list, struct pci_dev, domain_list);
> >         bus = pdev->bus;
> >         devfn = pdev->devfn;
> >         list_del(&pdev->domain_list);
> >         write_unlock(&d->pci_lock);
> >         ret = deassign_device(d, pdev->seg, bus, devfn) ?: ret;
> >         write_lock(&d->pci_lock);
> 
> I think it needs doing almost like this, but with two more tweaks and
> no list_del() right here (first and foremost to avoid needing to
> figure whether removing early isn't going to subtly break anything;
> see below for an error case that would end up with changed behavior):
> 
>     while ( !list_empty(&d->pdev_list) )
>     {
>         const struct pci_dev *pdev = list_first_entry(&d->pdev_list, struct pci_dev, domain_list);
>         uint16_t seg = pdev->seg;
>         uint8_t bus = pdev->bus;
>         uint8_t devfn = pdev->devfn;
> 
>         write_unlock(&d->pci_lock);

I think you need to remove the device from the pdev_list before
dropping the lock, or else release could race with other operations.

That's unlikely, but still if the lock is dropped and the routine
needs to operate on the device it is better remove such device from
the domain so other operations cannot get a reference to it.

Otherwise you could modify reassign_device() implementations so they
require the caller to hold the source->pci_lock when calling the
routine, but that's ugly because the lock would need to be dropped in
order to reassign the device from source to target domains.

Another option would be to move the whole d->pdev_list to a local
variable (so that d->pdev_list would be empty) and then iterate over
it without the d->pci_lock.  On failure you would take the lock and
add the failing device back into d->pdev_list.

Thanks, Roger.

