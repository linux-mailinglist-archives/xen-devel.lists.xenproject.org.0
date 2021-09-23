Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F37C64160FF
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 16:28:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194322.346167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTPhW-00059S-Tm; Thu, 23 Sep 2021 14:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194322.346167; Thu, 23 Sep 2021 14:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTPhW-00057C-Qe; Thu, 23 Sep 2021 14:27:50 +0000
Received: by outflank-mailman (input) for mailman id 194322;
 Thu, 23 Sep 2021 14:27:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qmWf=ON=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mTPhV-000576-1Y
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 14:27:49 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6bb4ff1b-1c7a-11ec-ba48-12813bfff9fa;
 Thu, 23 Sep 2021 14:27:46 +0000 (UTC)
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
X-Inumbo-ID: 6bb4ff1b-1c7a-11ec-ba48-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632407266;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=x/gEY9gzTGZhm/wQT/kiNjp1mxgYWbHDqyrq2xP0rQ0=;
  b=SJASOTrx0/OEnKfRzVpGfH1Dfk4PnHrZJWnQtGCAiUwlS6GT5bOfbzfk
   L5fbkiv7EJmvThMFg5EpBwmIYvF+sUoge0M+7jT6YvqJH/HHC3VbBphv+
   fnXszsoz0qMuf2ny0VX6JBigsIG2eBcnyKuRIFWvUO2CmYYoYRcHyBrdd
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: O/jMWOvezTj0FUwOymsiK7vUL7HT0kJHhAuuMOHTnN1fQjuzCDQXadvq+iFPqMWCEl6AVkO3Aw
 ZsDi/Oos1Wd/KvVGs3UmXIu+qNzKRLjLsySk11pvvqxwAFDLQEYWWAVCL2uMugX8CSjksfG9ts
 Qk1gK8Cq5lRL5p4byXHGD6Q2DkuGoNhrnZ8wafhyvvaZl5rtTFxXmoO0ID0QvyBSZELMcPywRw
 v4CocLvQjy/iH619UaXxGYBAibPNiDaSF5pv8SUkcjaVtGbLi39FhCac7U5SFs0JKx8478Xywp
 6AeJDjuIOfe3j0EVCiH7qRJI
X-SBRS: 5.1
X-MesageID: 53862938
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:IXzjb6mrqkDQBihFY2AH/Q7o5gxYIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOC2zUbPneYmGnfNkkbtuz80gG7MPQmoA2Tws+/ntnQyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA185IMsdoUg7wbdh09Qz2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 JJdhIe+e1sMBLDFs8U/eR56HShGYYQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gpr1p4UTK2OD
 yYfQX1IaBHsejBwBkk0Aqgzl/rvmXejWQQN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wt
 m/Aumj0HBweHNie0iaetGKhgPfVmiH2U55UE6e3ntZoilCOwm0YCDUNSEC25/K+jyaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCs+Q4tQNRiT8gA9Qim64j+5CSXD1BYZ2sUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYndOcDVcDcMQZU5cuYCy/d1q5v7aZos7SMaIYsvJ9SYcK
 txghBM3gakaxeUP3r+ylbwsq2Px/sWRJuLZCwO+Y45E0u+bTNL+D2BLwQKChRqlEGp/ZgPa1
 JTjs5LChN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOu2slfx8xaZheKG6Bj
 KrvVeV5vsQ70JyCN/MfXm5MI55ykfiI+SrNDJg4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 c3zTCpYNl5DUf4P5GPvH481iOZ3rghjlTK7bc2qlHyPjOvBDEN5vJ9YaTNimMhit/jayOgUm
 v4CX/a3J+J3CrajPXWHrdBJfTjn7xETXPjLliCeTcbaSiJOE2A9Ef7Bh7Qnfo1uhaNOkenUu
 Hq6XydlJJDX3yWvxdyiZi8xZbXxc4x4qH5nbyUgMUzxgyooYJq17bdZfJwyJOF1+OtmxP9yb
 v8EZ8TfXagfFmWZo2wQPcvnsYhvVBW3ngbSbSCrVycyIsx7TAvT9966Iga2rHsSDjC6vNcVq
 qG70l+JWoIKQglvVZ6EaP+mw16rk2IaneZ+AxnBLtVJIR2++4l2MS3hyPQwJphUexnEwzKb0
 SeQAAsZ+raR89NkroGRiPnd/YmzEuZ4Ek5LJEXh7O67ZXvA426u4Y5cS+LULzrTY3z5pfe5b
 uJPwvCibPBexARWs5BxGqpAxL4l44e9vKdTywlpESmZb1mvDb88cHCK0dMW6/9Iz75d/wC3R
 liO6p9RPrDQYJHpF1sYJQwEaOWf1K5LxmmOvKpteEiqtjVq+LenUFlJO0jegSNQG7J5LYc5z
 Lpzo8UR8QG+1kInP9vuYvq4LIhQwqjsi5kai6w=
IronPort-HdrOrdr: A9a23:3Nga4qzQ6Ip36wjykFA+KrPxv+skLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9wYhEdcdDpAtjnfZr5z+8J3WB3B8bfYOCGghrTEGgG1+rfKlLbakjDH4JmpM
 Ndmu1FeaLN5DtB/LbHCWuDYq4dKbC8mcjC74qurAYOPHJXguNbnnxE426gYzxLrWJ9dOME/f
 Snl616T23KQwVoUi33PAhIY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX222oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iCnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJDw4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAoqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocXTbqjVQGdgoBT+q3pYpxqdS32BXTq+/blkgS+pUoJjXfxn6ck7zE9HJFUcegN2w
 2LCNUwqFniJvVmGp6VP91xNPdfPFa9CC4kAFjiU2gPK5t3T04li6SHqondt9vaNaDh8vMJ6e
 L8uRVjxDYPR34=
X-IronPort-AV: E=Sophos;i="5.85,316,1624334400"; 
   d="scan'208";a="53862938"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bI2YVqn0Lu+5mKNGVhG5xyPiU95j85s3Hl6VihprBE9a8UBtt9+qn4ycJjIu7Cwaf67vUYBtE0zXQ/rnMIAaQKgf1P+0ik3Q5q2JFnA2pdRnmT7X8be3UwHDUJRY3BGhqNiSeTUbXxWkqAufm+w5fGqwjDcfMv1HQyV5AaRcolm6Vpb5wM0G9BZnejA1XhvdfyvEhnSPzXvHGwPJ4ocCRwO349X63e+plu1rkkFe5YFizrJe/ivWgRCyjaya+g7363Os3MMO0Meix4nr6y+NtlvnUVNX7idgSDM41HlROgOmO5kl2WI6bFKaUsYFFOGhrZP+nEbWNE7sz1Qmbs6iIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=axzB9TFmmredPYZ3kjovrzEr0FcHwwllGcngRBrn7bs=;
 b=RzmJfZbDFRyt0l4kGBKDYXPF7yiyRZxuNuDrdq0INQMsJukrc4OZ54A3j3ylH9B7wqMwLn3qqTT2rXBkdbH5fQFoai7njNenYPVOiD3q12afSgHE9+h/1dF36Aa8w9EsXTH5ZUnxgs2E/RRWo2jb2FyXdTx+uu6No/Ee4TdT3riTF3Sqw5CyVojfEXb+fQ3Mm/QYVS2Y5xrnRJDSe8J9EiPiaSDk3Zdb7kM+5C1IIEneGKBIkVXsBfvu2NACf2AVPKXjJIHPtozwU/cMXsCnkW1yY2es6jDb1hDWot0OZFJiHxX4AQ2fZAVo8GVpa/l+zTPZPDgA7jTf+VkV4d79Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axzB9TFmmredPYZ3kjovrzEr0FcHwwllGcngRBrn7bs=;
 b=vHzmndbyAPMZLWrS70EAYPjMsNi/4uWANdCKlBM2jcKIN+ggmT5vCZOF1We3qlvF4k/HLVVp9QzfROU2ISg2xItN0ZRz9SWrUu3BBrH8c5dcj0BqxAouTnKrkyem7cwJffpQIteXym4fZdko5KR26fcBysOhM9tGXkW4eeL4vLs=
Date: Thu, 23 Sep 2021 16:27:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 5/9] x86/PVH: actually show Dom0's register state from
 debug key '0'
Message-ID: <YUyOwBNNa6Go1yrW@MacBook-Air-de-Roger.local>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <4ae1a7ef-d6e8-75db-ddf5-987f10175196@suse.com>
 <YUtQPUHjZ8GnfeCE@MacBook-Air-de-Roger.local>
 <d58fdb48-0452-321a-5ded-d949740682c5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d58fdb48-0452-321a-5ded-d949740682c5@suse.com>
X-ClientProxiedBy: LO2P265CA0205.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7f6d310-a131-4faa-eb88-08d97e9e3f44
X-MS-TrafficTypeDiagnostic: DM6PR03MB5321:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5321020CD9A02A664B3F65918FA39@DM6PR03MB5321.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1BemFRzilzvcHGRUZh/vDy4Bau9/Rr/kTsQcVqWeaa4p5oLhcpdNmq3Kx1wNz3t4SICi+9h38O3Pg4f6bQ52cEUhLao0T1Ca5KgI39SylF2D6QzNlddJgqhcnzjxcoIGNEHY3dGYsorfxT1Dcremhmy3pRCQ1U59ldsrAu5WCJCsHxbLKtSZeTskatmbXYUYgZKFyhUMYtw/QlWxwMZYeiXeAQLTJIxRblh5N+yUVeYdP2xRHrWki7ywCfvqVxtH3PQAzzrh23GVH/YgNlr7qcXIBo28eRFrsRzoUrAqPggetYa1OxGTU7mcVimYDG4LQ+ETZ62JUV7cKA1ECBjh9H6ourNODWjG4TqS3ujU4BQtwEFTGjZUjyQsFQZJkZsIQAyviOqzMutz27cZr2b1B2p0PXOMuMsNEmyc5M9ykkuLNs3tVvR8ecfi2aatgci2vBAcancW9FZZcX0J3k0u+b+eA5SCbbtF2JPwuUjR3aD4Bq9yJAPbIV2HD+T07UE/AK2jXzqlA3jXO0DSGOSIRdDByOWCsRkcgqdpx7oZoZIH9O0JDF6UBvEVjfqgDzLX2bI2UiDwd9nv7JN1x2w2FI3ly+FdVmRwljOR9pmTG1AiotlHZLX29W94N7pC5gTVzOXS9oh5R2MG/T2lQW0sHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(9686003)(66946007)(38100700002)(2906002)(6486002)(66556008)(66476007)(85182001)(8676002)(8936002)(956004)(508600001)(4326008)(83380400001)(54906003)(53546011)(316002)(6496006)(6666004)(26005)(5660300002)(6916009)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlN2N0xNcWRiZVFtL09heXJCbVpycjRhK3R6NnZMaFdLU0VyaHdqVmo0c0U0?=
 =?utf-8?B?eGhhRXZIWEFVczcxcU5rZlZXSmdmQTJhUGp4SEVtR1o5bVMzK0ZyZ1VQVDhI?=
 =?utf-8?B?OEp6ZWlZdFgrcW1JT2VhZ2lFZGFlYUNIanZWSHdiRVJ6b2NCZlcvS3dMa3NO?=
 =?utf-8?B?OTNQOFlWT1FPeWFIQk5lRVcxYkpsUG1jcmNmQkVCZytuQkRxeWtKdlNHQXNz?=
 =?utf-8?B?RndBME5KZXMxMUN4MjBTcTRoQldOdnNlQkNOTStyQjlKYjVDOS9QMFRqZHhB?=
 =?utf-8?B?U2hFVUNaK29qcU1PMjU1d3VhSVRnL25pRTVraVpqYW1pRTcxd2dnRFZsR2Js?=
 =?utf-8?B?eEU2cU1XbWsvY2w1cmpsL3ltMm8raHBJYmMxaHo1blpUMVBXdnNLcjJBc05K?=
 =?utf-8?B?SHlXUEd3MXZBLzF1SVk3L0psdXNOUXgvc1I3QSs1UC91UVVORHEvUGluVlRM?=
 =?utf-8?B?alI4c3NSUzJLTmtqRklKOTNoVmRwSUJENk5PNkc4QkNMb1FWRUhPL0x4SXVP?=
 =?utf-8?B?c09PUVlsc2lrWEJ1UjhBTVB1TDFrK3dta2N0dWMrMi9BczQxM3FKcmZOdXBw?=
 =?utf-8?B?czJFOUYycjREblFrTXRZQk8zTzBDd0o5L2hxZ21KS3FMQXM4aCtHYTBDU0Rt?=
 =?utf-8?B?U21rNTlBVWpiZlp5SGR6T2dmYmEzTGFOZVBPRzFLcEx2VEZ2OWdnWUsxZXJa?=
 =?utf-8?B?Z2JLVmNrMldCZExZdU01WEd5ekJFcTZBTE83R01Ub0NIN1ZXSTh3ZDArNmZv?=
 =?utf-8?B?OXp6WUQ5OWJyV2FRTFNpTUNpRGh4N090RE5EQmYyMitBb3NFdTRVdlkvck5C?=
 =?utf-8?B?aU1uT3JHczE0WjN4MFBvb3lWdlozOGtjV29SbDFvbzhmWmM1UGM4b3M1L1cr?=
 =?utf-8?B?dnhNOEIyU012RlZHQWNRNDFBUjhubnJqT3BZa1Z1elVtMnltbDVZRFJ6Qks5?=
 =?utf-8?B?VDVmQlY1RHFzQ1FSdGUwWGVDQUY5ZlkxcGduVHEvVE04djR2V21GS0FoanMy?=
 =?utf-8?B?QW03eGFDRUlicUVDRTF3bHdJeU4xTzRCaEF2SkwveFE3aDY1V05hK2FJUkJn?=
 =?utf-8?B?ZnRoWndHVXU3TWw4Ti9lUWtPc1hSSGFhc0pvaW5BaGYzWjZsOFkyK0ZzaThl?=
 =?utf-8?B?cEFLaHVsN1RmR3RuSlJ5eXhJZFEyVGRxK3B0OXJ3b3hRVXZsdm5kK3lxMVhY?=
 =?utf-8?B?WnFGd0pyVGFCcmIyY0VnbGVONW16NmltL3dxaG5HeXlwVGJtZGg1U1pPTGZw?=
 =?utf-8?B?NHVtWGRqdUJacldoYjV2TUlEcFpqdHdIM3dtRWJCWFFVWEVuZnd5d2pqTnZ2?=
 =?utf-8?B?dXBudkFUREdXOVI1c1RPTEQ4WllCNGE5SlRVNHBucWRPSUdBS1F0bVNnTWRW?=
 =?utf-8?B?R3o1eDFFVGZJRmc4ejA2UVoxNnhtV1RrdjVkL0VPbXVhc1RnczJEMElMTi9J?=
 =?utf-8?B?WlcvVDl3NmZVaUc3K05MSU1FVUdpSmQyTjBmYUpXOStPNWNHeWVBTmlpYmN1?=
 =?utf-8?B?djB2Wk9Bc0Vrd3oxa01iWTllWGJlSEJDdDh5d3liOUxDaldWZWJQYStXTG1P?=
 =?utf-8?B?bzd3K1Y5ZjVkSHZtc3JCa2Ryellqa2tyQk15cjRpOWttalJEZ2EyS0dDMEJW?=
 =?utf-8?B?YVNUQzNTS0FoZkM4MktKQTJYblhrU2E3bFM1WXE1MG45OSsvWkJnOUs3bjFS?=
 =?utf-8?B?UW5URG5aU2YxUUEvdVlBRWVISU4vOFZ2TnVSY25Id0Y2d2M5TTRFRzZUbW13?=
 =?utf-8?Q?dwM+PT0FudV8uNwe8t9L9tAqCX509iXsIzwXxi4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7f6d310-a131-4faa-eb88-08d97e9e3f44
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 14:27:18.2871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DvQpqLmbDxBJoCb5CPGOYEoUo1vIrdCUN/cSBElCT1oJIXOIDh/NQ8MbwiswlvTrtNiFGwl4VGDhPoPhReq+Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5321
X-OriginatorOrg: citrix.com

On Thu, Sep 23, 2021 at 12:21:42PM +0200, Jan Beulich wrote:
> On 22.09.2021 17:48, Roger Pau Monné wrote:
> > On Tue, Sep 21, 2021 at 09:19:06AM +0200, Jan Beulich wrote:
> >> vcpu_show_registers() didn't do anything for HVM so far. Note though
> >> that some extra hackery is needed for VMX - see the code comment.
> >>
> >> Note further that the show_guest_stack() invocation is left alone here:
> >> While strictly speaking guest_kernel_mode() should be predicated by a
> >> PV / !HVM check, show_guest_stack() itself will bail immediately for
> >> HVM.
> >>
> >> While there and despite not being PVH-specific, take the opportunity and
> >> filter offline vCPU-s: There's not really any register state associated
> >> with them, so avoid spamming the log with useless information while
> >> still leaving an indication of the fact.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> I was pondering whether to also have the VMCS/VMCB dumped for every
> >> vCPU, to present full state. The downside is that for larger systems
> >> this would be a lot of output.
> > 
> > At least for Intel there's already a debug key to dump VMCS, so I'm
> > unsure it's worth dumping it here also, as a user can get the
> > information elsewhere (that's what I've always used to debug PVH
> > TBH).
> 
> I know there is a respective debug key. That dumps _all_ VMCSes, though,
> so might be quite verbose on a big system (where Dom0's output alone
> may already be quite verbose).
> 
> >> --- a/xen/arch/x86/x86_64/traps.c
> >> +++ b/xen/arch/x86/x86_64/traps.c
> >> @@ -49,6 +49,39 @@ static void read_registers(struct cpu_us
> >>      crs[7] = read_gs_shadow();
> >>  }
> >>  
> >> +static void get_hvm_registers(struct vcpu *v, struct cpu_user_regs *regs,
> >> +                              unsigned long crs[8])
> > 
> > Would this better be placed in hvm.c now that it's a HVM only
> > function?
> 
> I was asking myself this question, but decided that the placement here
> is perhaps at least no bigger of a problem than putting it there.
> Factors played into this:
> - the specifics of the usage of the crs[8] array,
> - the fact that the PV function also lives here, not under pv/,

I think both functions should live under hvm/ and pv/ respectively.
There's nothing x86_64 specific about them in order to guarantee a
placement here.

> - the desire to keep the function static.

Well, that's obviously not possible if it's moved to a different file.

> I can certainly be talked into moving the code, but I will want to see
> convincing arguments that none of the three items above (and possible
> other ones I may have missed) are really a problem then.

As said above, my preference would be to move those to pv/ and hvm/,
but I can also live with the current arrangement.

> >> @@ -159,24 +173,35 @@ void show_registers(const struct cpu_use
> >>  void vcpu_show_registers(const struct vcpu *v)
> >>  {
> >>      const struct cpu_user_regs *regs = &v->arch.user_regs;
> 
> Please note this in addition to my response below.
> 
> >> -    bool kernel = guest_kernel_mode(v, regs);
> >> +    struct cpu_user_regs aux_regs;
> >> +    enum context context;
> >>      unsigned long crs[8];
> >>  
> >> -    /* Only handle PV guests for now */
> >> -    if ( !is_pv_vcpu(v) )
> >> -        return;
> >> -
> >> -    crs[0] = v->arch.pv.ctrlreg[0];
> >> -    crs[2] = arch_get_cr2(v);
> >> -    crs[3] = pagetable_get_paddr(kernel ?
> >> -                                 v->arch.guest_table :
> >> -                                 v->arch.guest_table_user);
> >> -    crs[4] = v->arch.pv.ctrlreg[4];
> >> -    crs[5] = v->arch.pv.fs_base;
> >> -    crs[6 + !kernel] = v->arch.pv.gs_base_kernel;
> >> -    crs[7 - !kernel] = v->arch.pv.gs_base_user;
> >> +    if ( is_hvm_vcpu(v) )
> >> +    {
> >> +        aux_regs = *regs;
> >> +        get_hvm_registers(v->domain->vcpu[v->vcpu_id], &aux_regs, crs);
> > 
> > I wonder if you could load the values directly into v->arch.user_regs,
> > but maybe that would taint some other info already there. I certainly
> > haven't looked closely.
> 
> I had it that other way first, wondering whether altering the structure
> there might be safe. It felt wrong to fiddle with the live registers,
> and the "const" above than was the final bit that convinced me I should
> go the chosen route. Yet again - I can be talked into going the route
> you outline via convincing arguments. Don't forget that we e.g.
> deliberately poison the selector values in debug builds (see
> hvm_invalidate_regs_fields()) - that poisoning would get undermined if
> we wrote directly into the structure.

The vcpu is paused at this point, but I agree should not undermine the
poisoning. I assume those fields don't get filled because it's an
expensive operation and it doesn't get used that often.

Long term it might be helpful to have something akin to
guest_cpu_user_regs that could be used on paused remote vCPUs.

Anyway, I don't really have much other comments, so:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

