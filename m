Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF32C78D6F8
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 17:29:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593086.925994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbN7r-0007al-CI; Wed, 30 Aug 2023 15:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593086.925994; Wed, 30 Aug 2023 15:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbN7r-0007Xp-9B; Wed, 30 Aug 2023 15:28:59 +0000
Received: by outflank-mailman (input) for mailman id 593086;
 Wed, 30 Aug 2023 15:28:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bwNt=EP=citrix.com=prvs=599f699f6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qbN7p-0007Xi-Q5
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 15:28:58 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eda46793-4749-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 17:28:55 +0200 (CEST)
Received: from mail-mw2nam04lp2177.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Aug 2023 11:28:53 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6581.namprd03.prod.outlook.com (2603:10b6:a03:393::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Wed, 30 Aug
 2023 15:28:51 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 15:28:50 +0000
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
X-Inumbo-ID: eda46793-4749-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1693409336;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SSLqv0584YLMX3R1ZNaMkY4+OMZ4gvw9jU7k1eqYn4w=;
  b=CvYH4AG/LdkfPm51wurD/KkdFIkzc7HI7ZCoy/6dSUpFLMmICZMVxl7Y
   QCdd68YsZuhsXzxBgjb2mJakkZMAJAPO4UiApYAfYL0jotPveqHBarwE3
   qxL1uyJKttQoHviR46x8eepyefWL1mW/b8lJfVoNESUBAmjZsDvdIgbw4
   g=;
X-IronPort-RemoteIP: 104.47.73.177
X-IronPort-MID: 121002361
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/KbC/6leJQJI2nxY44Ka94Po5gxFJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdUDjTMqnbYmf2L9h3bNy28kMAuMSHm9NqTQJq+SpgRiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K6aVA8w5ARkPqgb5weGzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fo9Di49YTWzu763x67rVPUx39t4J9a+aevzulk4pd3YJdAPZMifBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVk1c3ieeyWDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTuTgrqQx3gT7Kmo7SzsJUQWrs9aCi2mvV/1YA
 WM+4SQTsv1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xGWwsXjNHLts8u6ceRz0s0
 V/PnNrvCnpsqpWaTHuc8vGfqjbaETgYKyoOaDEJSSMB4sL/u8cjgxTXVNFhHaWpyNrvFlnNL
 yuiqSE/g/AWkpQN3qDjoVTf2Wvz+d7OUxI/4RjRUiS99ARlaYW5Zouur1/G8fJHK4XfRV6E1
 JQZp/WjACk1JcnlvESwrC8lRdlFO97t3OXgvGNS
IronPort-HdrOrdr: A9a23:Gu/2za4C+HWJvzEFkAPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-Talos-CUID: =?us-ascii?q?9a23=3Ak/M90WsV2MOULKBrBw7ocCxm6IsjV1vD/Hj1E3P?=
 =?us-ascii?q?kCGF1GKOJFAaPo6h7xp8=3D?=
X-Talos-MUID: 9a23:9LZ6+waLU5+QbeBT9BnzgG9yJuhT4oO/BG8Ku7osoMe5Knkl
X-IronPort-AV: E=Sophos;i="6.02,214,1688443200"; 
   d="scan'208";a="121002361"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WqxLzXJEE0VSGqOEwgUNNpupWaVd/qKO+CQHkZlA8JE/5YLJaA3TdQ1ecknZMfqw1Rj0qkg2k/Fp2HgtMwoNOdQz0wJxt8KK3BB6E5tTtI0z5wqM++LdmbcvIe2QARj3RMA6Vd76365IsSZY/gRoiQTVG7NFoAm7YsUpg6mJBTnsB00jr3FJDR2qLv54sBmIfMgsWx/PqrrcmVO738ibqL2PTYsG4xQIM2ATkhAd/ozYgPZEuXGez2LgZFejuDf9adk88cTVCEAm4/gVO4TjZYZbRIty1qJhauI+At/sJ8J2zAfG6WZqnjs5LZuCiDDwWbHMwUrtmiaq6QfRtXHnvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZcNk7Wbo9xCtpqRbx4rtQ1B38ZDUKUG6haMmDp3Y7A=;
 b=mAihpT6Odj1owPCcJFNEPQDy2V1Sfh6/svd5Wqw5UhB08UMem4rXDw0PohHutvH66jNY2Tt7HDNsiTA5Gt2A9Jdhz4uFg34pE648/9cUjvZDHHRY54L/0cgthhqsIgnuPrrVTFi0d8T8CmJ8BclER6NbA+2Egt57pO95Av5bN5Xnl9dFq7/gkp0Jl4znbtEfrSpy6aYNMBCD3TD1+bUDxCsC695TzkZG+OLcPeummdEXlmVTf1CloECYS/n/kAWHHPi4qVXtcPGdKq6DzGG2xrxWW3aGa7BvqZHjEi3vapdMVYsaz7T/fJXeezVIwpCswbPBoqbq9J0Dotfkh3hm+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZcNk7Wbo9xCtpqRbx4rtQ1B38ZDUKUG6haMmDp3Y7A=;
 b=R/1zWThVhDEH4O/MdHpFIr3dRrdLr0HPhVMYalPDll2XmOfwlu20RxwJkWIRdTMW5BSozOEfE2We2oRqjaPC5VCVrCbdQ/QV9naARgqD+gf4IiAMcGVGA+YDP2nnEgSE5Gp6whbg9zN1U4PHQFElasK7EDhcY4U4p9q1Mlxo7MY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2ced7357-b8ec-e071-9ce5-c4d23b1a6a03@citrix.com>
Date: Wed, 30 Aug 2023 16:28:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] x86: Reject bad %dr6/%dr7 values when loading guest
 state
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230829134333.3551243-1-andrew.cooper3@citrix.com>
 <20230829134333.3551243-2-andrew.cooper3@citrix.com>
 <6217ca42-d5bb-40a0-53f0-ec543c8297a6@suse.com>
 <c86b8f1c-dffb-c850-3054-f31f584861c5@citrix.com>
 <0708d6fd-2672-a0f9-e782-83e6eb66dbeb@suse.com>
In-Reply-To: <0708d6fd-2672-a0f9-e782-83e6eb66dbeb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0589.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6581:EE_
X-MS-Office365-Filtering-Correlation-Id: 85055f74-8aa7-40a4-731a-08dba96dcfd5
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qobyfqYLypN8pCkNAyaXOoNx6DzK5xC8IVq0oLOwVQBwb+zGHJn6fL1Yka8RGeopjFp9uyxc7BIIhE7gkp30buLpwScc265mBFbh08HZCRQAvtt0DVyxGgYgQJbaeUHk1aXplTUErXM/ZIZGGtFeulKdfQYUL6ufAN4DqATlJDMBLJOtNqAWZIVMqkekFHA8VzCE2RY4ivRF5boxX/GchrD7sFjkI3uV5iGDvPQl9eeGI6u1z4z8uI/IGU76/F37vrT+7Xi02uYXlHVghZiTmUko91Usx7PnqfJfD0Fb8hGfmO0vsvbfNwrlzvKz9YRO9NoTTnOWq+obQBXECWH0bdhOYEjfcHSjLacWMKmnF3/PrcdDYrQxEpnHgZFx4M/M38zUt0KS3ps93z1jABUW1KVGTD5mq+sVN/SQ324K5NInqujGI0Y1GyH1JHb+nnUprITWeFf5xruw9CroVZFNsteTgGRk0lemCGTX3POxRuAeZi4Y/IhoEzUxQkF/pP/g/wwZT7upi2yHkJmQTcp1xhrzSBW5Dqj94TTmXRfi3dmy1Ikf6MDAh2ciz9Fl2v199uZKwezaZUpQa7Ivkm7XVVwKnkF3fKppIF+PU7PM9Bei+4nBITL2UMWV3JKosoVsbC3vY1jZDKR1B7dZwLYP4g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199024)(186009)(1800799009)(8936002)(66476007)(6506007)(2616005)(6512007)(26005)(6666004)(53546011)(6486002)(5660300002)(4326008)(8676002)(54906003)(83380400001)(316002)(478600001)(41300700001)(66556008)(82960400001)(38100700002)(66946007)(6916009)(31696002)(86362001)(36756003)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vk12Z2tlMTN0aEtJblVjNkpsSVNyNDhKQlJtWHlvWWNZd1VsWHVPN2VMVzhN?=
 =?utf-8?B?dk9XQ3ExNEpyWHZCQWZxbXZDU2NxMHhqOWZpdDcrZXRPZFJweERXWGN3SEti?=
 =?utf-8?B?Sk1VVHJCNjdpd1A5dXFNUmdjQmp6VEp4ekQ3ZVF3azc0cVA1UEZSZ1U1bkZU?=
 =?utf-8?B?T3RrKzRzVHRBZG9sbkdaVnM1MVFhaW9ZVm1LU2p0UnhpbFZwSXl5RzU1WWhT?=
 =?utf-8?B?aERKZkFEa0tyNUQxTXp6YU5HNUxpNFl5SksxN3Y4RjhCam1pc2RId0RaMjZn?=
 =?utf-8?B?QmJyLzIveGVrM04yM3F1VC9QODhqQ1ozVlBMMWpMOGZ4YUEvUkwyZkJWV0ll?=
 =?utf-8?B?eVRDV0RSR1U2bGVmb3EzdG9SSGZ6SjMrejBLZStpdTJMeTViWWRpTHV5MWZa?=
 =?utf-8?B?SGdwSDJScHBPNXdmWTNkM3A4Y1hWTVlZV1QrcC9lR0tGMDQrZTRCTFhkbjBn?=
 =?utf-8?B?emFkdG1HOUQvcHRyVVpicFBEbXJ1YkhiRkY2alRDL25EM0xBWlFUYm9jcGk2?=
 =?utf-8?B?Nk1wYm9IZnNoT3M1eDI5OEwrb01yNmRNMGV4RTZNZ01aUTljUisrOVEzMk04?=
 =?utf-8?B?NkppaDkzYnRRQjkzeVZ2NTRZK0tCRURtNml3NVd2cWkzRys2eVRsODloQ0VZ?=
 =?utf-8?B?cXJRb21ZUmdHTW9IMEhtYzdWSS9nYlRtTUNPTkQyU0hKdVRWbTZPY3pqaHFZ?=
 =?utf-8?B?cW9XQk5xRit5cll6ekFqblovYlJ0SDRYVnhnbWFyOXhkbW53VUJQbEk5MndT?=
 =?utf-8?B?OEMzTy9jNldFdExDdkZ6MFV0Wk5WY0s0cDUvdjczNFhUUTUwZEhEQllsblds?=
 =?utf-8?B?RlJFRU5ucWVZcDNSeE1wWHBnNmJMREI3T01mMm1mRXdEc0txMjg4ZS9xVjVR?=
 =?utf-8?B?NTJ3eTRFYk5OWTM0ZEtZdnJXT0Nac1hJNDl1RCtES29JWExwUHgxZDZlS0RR?=
 =?utf-8?B?ZGhkQkVuTy9lUUtJSGs2Qnk1QjRLQWJXRTFCTXE3S3Urdzk3V3RQZStNb0pu?=
 =?utf-8?B?T1ZEWGFuU0JJTTdOVkhqa010ZFB1REJiVC95UlVESlZYTW05dUhJeEJOWUJG?=
 =?utf-8?B?Wk9SUUgrMjVLdklDRS9HMDNXZ3Fwb1JCWERralZWMURHZjd1ekcwZVAwT2d3?=
 =?utf-8?B?ck5lejd4d0l5RGRWVDdnNWxreGMrV1FBU3I1bjNkM0tiaUQxY0hUMTZLZlJp?=
 =?utf-8?B?dThmVmpvWG55QVQ0UUVKcFZ6azdvZWdFcFV1L0tmTkNpZHZTTVArdytWdEdF?=
 =?utf-8?B?a3hYMmVwL3gva1l0MmE4NGxmNnVGcm9rd2E3UXFOM0pWQkh0d1V2WmUyVXRk?=
 =?utf-8?B?SHBEaWNqR2NteXdwU0RZTUsvT3hpaTFTajVxUnhNdS9UOWVlZ2g5K2ZFZDFx?=
 =?utf-8?B?NCtDS0JEQXJFTDJRODFoOXNEbS9ydkVBVEY2UlVIK0s2VS9rL241cmluRnJj?=
 =?utf-8?B?bWEwUGY4OG5Sd3g4OFRWMk1PN2Z1cklEamtkTGpsTElkR0pVaSsyN2RKenVR?=
 =?utf-8?B?elp4YVlKSnlOYUc1SkZwVEdEVXFxSllUQktqbURnK2RocmFSU3kzTnZtaFZP?=
 =?utf-8?B?akhxOEdrTmxTK1EySVNseCtOOFYycjZicnE5MHRPQXpKTjJiR1hpU2ptK0oz?=
 =?utf-8?B?K2ZFSkY1c05kZkVFRisxdEJJTnlmaWk2c1dGblYwdFlkUmh4M0o2WFB6UHps?=
 =?utf-8?B?eEFTekRJM2JnT3BNT0dMMzZxdW1NWmlmM3VSLzc3ZDYvVHB4d0loaHNYUU5Y?=
 =?utf-8?B?VHNHNjk4SmlUSEFLa0MzTXdsZGlYL0hnRE5TMmx6cUU5aDVSdGZtSDkzQklB?=
 =?utf-8?B?WDV2NGt5cEZOOTZqNEczNTRqaXlKYmhNaU85dTVDOHNHRXhza1VsNGcxSTFm?=
 =?utf-8?B?RFg5Y3JObVUrZnJzR2RzNWxXSmlYSFBVcTE5bGF3MHBPVDNpYlUrZlh5d0ZX?=
 =?utf-8?B?RmJyUmRicDY2MHRUY2lET1VjaUNCUnU2ZnhtaUVOUk9nU0xFNENyTUw2RklL?=
 =?utf-8?B?ZjZxeWhWeWpneHp6dmMyYkI2eGdDa0NGVXRlUkcrQVdhMXhKY2lRVGE5bWFn?=
 =?utf-8?B?aVRaVkFrYzNPTGNmeHFMSHFlTkx1N0JSMmNpczQvNmtwaWlTNVRHbEdMV0pa?=
 =?utf-8?B?S1pPNHA5M3dUQUR4SS9PTDU3anltWjhSTG9YNzNkMnhBU1NVZXVkMXVnaG1U?=
 =?utf-8?B?VWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iYxmX9QgCMiO2TSTamhrujY1qpe4veOnSYW9FI+wUQs/33oBdejobfW1dD9B3T+ZY6nKz6va0UIPP99Xo+XpX1rz3iuCjolX66/etWESxf+I5YP9TjTgThZhLh6tml0geS6g2yt6ymYhyPW4lsK+5L3R0w+mjspupk2m4C+iLW7IppDxZxVH+JMmGi27zDkzT/PLWrq4fPHsiqkuW0LmHCh1Ik9ou0uY0kMYok3x8MzWvxF6HnxfID7kootPuovBOFlvghZlHT8OmVXPiReVUfYLnB21z941++S3CFDTNfO/jnu39EdsI+OxBBuuUdycgOtVOJ8IEN2uoG+ryFyBGkWgP+nRd9c0IcZAUeNnVqxOBVsgNpjerbPMz1R/VGzTLPCPmoDoWEUL9Y00cLu8VGWsSMWQZKLpgmI7VDDLJjXMcEANgZF7EC86vMJBuVnMweRvDxvYonXWdzylzNTDPo3HOSq9tqG7FN0Y/NNI/gBGUFetdq1f5OPtRQHDVbxxTVmabXNgmcQIK+60PNI+50nttHgVl8J+NWYkScgBAYhSZ4mJStn7o+Xn69VQEsvkUTi20fzCjUOF2aiZO04zEkTlDnfVD8gYK07XHpbmHLL9qVB9+KJL1gVvXT1FUxVTBVF09BY0/oXxt0V3Ug51A3auYftkxPBYjGGKv3zB7Je0hMEdmDVStP7kfUEaSGXOjUIG7Q88H//spk016oIr1uNIxSg7JGIVeactARsVuLk4RhPinYLVAzQbC2DRtu+Qr9cVXERpU/BsBC9VtUOGYts2vxJU3ygNFVddniQqX1+IdRYdApghRiOnO07sWDeiJy2b+uF5cdEFK9D9pFu7/tyIfKoBLMvVoaQ3iE08fnA=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85055f74-8aa7-40a4-731a-08dba96dcfd5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 15:28:50.8151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SYIkmYktlmnT5FjdXW+/vzAvzuVbPY7uXq45nXrPORO65yoTHIUx/bNd4WU6k+QbnTtZFebZ5lGothUGeF/OxXGj4NQbPCNRi+/uOmFjhqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6581

On 30/08/2023 4:12 pm, Jan Beulich wrote:
> On 30.08.2023 16:35, Andrew Cooper wrote:
>> On 29/08/2023 3:08 pm, Jan Beulich wrote:
>>> On 29.08.2023 15:43, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/domain.c
>>>> +++ b/xen/arch/x86/domain.c
>>>> @@ -1074,8 +1074,27 @@ int arch_set_info_guest(
>>>>  #endif
>>>>      flags = c(flags);
>>>>  
>>>> +    if ( !compat )
>>>> +    {
>>>> +        if ( c(debugreg[6]) != (uint32_t)c(debugreg[6]) ||
>>>> +             c(debugreg[7]) != (uint32_t)c(debugreg[7]) )
>>>> +            return -EINVAL;
>>>> +    }
>>>> +
>>>>      if ( is_pv_domain(d) )
>>>>      {
>>>> +        /*
>>>> +         * Prior to Xen 4.11, dr5 was used to hold the emulated-only
>>>> +         * subset of dr7, and dr4 was unused.
>>>> +         *
>>>> +         * In Xen 4.11 and later, dr4/5 are written as zero, ignored for
>>>> +         * backwards compatibility, and dr7 emulation is handled
>>>> +         * internally.
>>>> +         */
>>>> +        for ( i = 0; i < ARRAY_SIZE(v->arch.dr); i++ )
>>>> +            if ( !access_ok(c(debugreg[i]), sizeof(long)) )
>>> Don't you mean __addr_ok() here, i.e. not including the
>>> is_compat_arg_xlat_range() check? (Else I would have asked why
>>> sizeof(long), but that question resolves itself with using the other
>>> macro.)
>> For now, I'm simply moving a check from set_debugreg() earlier in
>> arch_set_info_guest().
>>
>> I think it would be beneficial to keep that change independent.
> Hmm, difficult. I'd be okay if you indeed moved the other check. But
> you duplicate it here, and duplicating questionable code is, well,
> questionable.

It can't be removed in set_debugreg() because that's used in other paths
too.

And the error from set_debugreg() can't fail arch_set_info_guest()
because that introduces a failure after mutation of the vCPU state.

This isn't a fastpath.  It's used approximately once per vCPU lifetime.

~Andrew

