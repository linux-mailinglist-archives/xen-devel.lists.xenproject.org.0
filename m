Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5DD6C3796
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 18:02:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512885.793242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pefNS-00038y-L5; Tue, 21 Mar 2023 17:02:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512885.793242; Tue, 21 Mar 2023 17:02:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pefNS-00036F-Hn; Tue, 21 Mar 2023 17:02:26 +0000
Received: by outflank-mailman (input) for mailman id 512885;
 Tue, 21 Mar 2023 17:02:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKE/=7N=citrix.com=prvs=437062dd9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pefNQ-000369-Eg
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 17:02:24 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23f8550d-c80a-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 18:02:21 +0100 (CET)
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Mar 2023 13:02:18 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN9PR03MB6026.namprd03.prod.outlook.com (2603:10b6:408:137::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 17:02:15 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 17:02:14 +0000
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
X-Inumbo-ID: 23f8550d-c80a-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679418141;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=LpgM0Y2qRpi9rxznwCbimtBiAKclAW78pqYBWUtyn2Q=;
  b=Nnj7Mvh1ScUCW6+icHO1QnJaBScHEhp42eiEx/L1d9KNIsdq6vvIdO2b
   rU2TN+hFf2FSC8zvrX8OhqdKB7Tlwy62DBxKqOMCMIDLaZsOmasrl5Rn5
   H6ci2qCwGG44nJ7ym6BAhUMEv3YfDJI8Zud0lBx9IVaOvo0lEfyJfPlsI
   I=;
X-IronPort-RemoteIP: 104.47.55.173
X-IronPort-MID: 102156610
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Hrf+Z6nOX5cG8UWQq4kuBCPo5gynJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNDTvTbKzeZWfyKdknPI2w8E4P65KGy4MwTAM+pHhkRCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5gaGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 aU7cS1WQkG4vrOzzeuRVel32tY8HMa+aevzulk4pd3YJdAPZMmZBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3iee2WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHuhAd9MSuTgnhJsqAyM6WsaMTkvbAG2mMuyiGycavxDB
 nVBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9Vna15rqS6zSoNkAowXQqYCYFSU4P5YnlqYRq1BbXFI88S+iyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAtTA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:ilTnBaDABQLktUPlHejLsseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80kqQFmrX5XI3SJTUO3VHFEGgM1+vfKlHbak7DH6tmpN
 1dmstFeaLN5DpB/KHHCWCDer5PoeVvsprY49s2p00dMT2CAJsQizuRZDzrcHGfE2J9dOcE/d
 enl4N6T33KQwVlUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyR+49bLgFBCc/xEGFxdC260r/2
 TpmxHwovzLiYD39jbsk0voq7hGktrozdVOQOSKl8guMz3pziq4eYh7XLWGnTYt5MWi8kwjnt
 Xgqwope+5z93TSVGeopgaF4Xir7B8er1vZjXOIi3rqpsL0ABo8Fsp6nIpcNj/U8VApst1Q2L
 9CmzvxjesdMTrw2ADGo/TYXRBjkUS55VIkjO4olnRaFa8TcqVYo4Az9F5cVL0AACX5woY6F/
 QGNrCV2N9mNXehK1zJtGhmx9KhGlw1Axe9W0AH/veY1jBH9UoJu3cw9Yg6pDMt5Zg9Q55L66
 DvKaJzjoxDSccQcOZUGPoBadHfMB2NfTv8dEapZXj3HqAOPHzA77Tt5q8u2e2scJsUiLMvhZ
 X6Vk9Cv2JaQTOhNSS35uwJzvnxehT+Ydy0ofsuoqSR+4eMC4YDCBfzCGzHyKCb0rEi6s6yYY
 fHBHsZOY6lEYLUI/c44+TPYegtFZAgarxlhj8aYSP4niuZEPydisXrNNDuGZHKLREIHkvCP1
 prZkmAGCwH1DHmZkPF
X-IronPort-AV: E=Sophos;i="5.98,279,1673931600"; 
   d="scan'208";a="102156610"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRfP5smR6/nr2/p8SPiQ0cNm+hIQUWmumzEbxRyP5sivf4OjK8aTUy31z8DVr+u+fxMCZLVk+a6oelNQE3OAFXC60d8wUDV1dbP+7WOgA4rYnGDMR18kBbVg/UfIXR4F+GU2RB9GkhsFPvwcpfB7T23kEoiO7MFh75zWYrJ60uuuTNMqGaW4g/al+lYm4vacLij7n8LdBVTj5lIYto8VLYuqQcGyDBHud5ASOg4FFk2ApA995cv1ugDLSttlbOmAbblmeseV4ILtrFlF72F+vYjrVzG0DO5tLkBVGgUJMfcA3fhK5p/46roMVKgN6mrsL24VeYBE3yPHoVBxXqBvBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BA+WzcR8xh0aD68iDNMC6IbMvR0wFWFv5Phxvyr4UnI=;
 b=lxVr/lxiXpzeLVFn6GKolp1RltecCRA8L33qmvQhABwlgRihp60e2ng7NzrarhrjVoG184SkR/pHcH1ojgR5DCyZiQzlG0bgyKLFTpHD7+Bt76VvPNImjdzn8EM0/yPrS/RNFgQnwSEEUW8VWNw+x7mwk4BAyDSHzdpg+NtDVFeuHRA5pD+jpwxxNPvOzc670RthbC0PJxpYLVzj101GDbmToqYYjC/k8/TFVu81LXI+rAzI1ETzgIO4HxoHqXEXpEc49N2xhVNc1wNlLDubSOLnKMH7y4ECJ8cxITx4jdPTc/80UhOpKqW9esK/C/+dRmVDiZmVena8uZ+/zWDfZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BA+WzcR8xh0aD68iDNMC6IbMvR0wFWFv5Phxvyr4UnI=;
 b=iX/RWH2pBj2KMeWHP02OEnXZnTDP9FolrEKPDcgXU9RFaJ03+CBWBUkongk2J5htFOaM7tmBb7pK7R+8ZNQS1fT/j0ILc2oKHSLrpO6k3/KvSf/e8mMDoauHkf0myBW4jcFPdqkdIbcVAj4NSvMLoybZ++yEsZ89j7kl0ifBlUw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 21 Mar 2023 18:02:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86: use POPCNT for hweight<N>() when available
Message-ID: <ZBnjEPf3cg8ecHlD@Air-de-Roger>
References: <55a4a24d-7fac-527c-6bcf-8d689136bac2@suse.com>
 <ZBRNWhExetXH1OaS@Air-de-Roger>
 <011cb7d8-fb32-74b1-2b06-f57be67f5c6a@citrix.com>
 <f1b0e3be-cf23-6471-7a59-c130380be0f8@suse.com>
 <ZBnF2oTLQjJtfZiK@Air-de-Roger>
 <e18b997f-48ba-4090-0c0e-67475f5b3329@suse.com>
 <ZBnb8Dv08XZm+a3t@Air-de-Roger>
 <3d866810-f33e-fc37-abbd-daf7aacc053a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d866810-f33e-fc37-abbd-daf7aacc053a@suse.com>
X-ClientProxiedBy: LO4P123CA0699.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::6) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN9PR03MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: 6583e723-4ee3-4663-04bf-08db2a2e051b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RAK1wC0Eg45y1GSHgN3zQZEdwkD+DwAXtr+IGe5OMz6GkwP2M9ChLR/mXestprJm2ZQYvHikjz+Bor+mzf7CVTsWqONdgtlEToNLNuFotkPacgs8L4EiGeQPLUUZDcep6y5vBxQz5BINcroDmP+KfJeF3jtmgoy571MHlZ8n7YATYqqixwwX7TDLt3Iw+NBkDM8Zz/PQ07nkqSzMvyaYtxxMNrjSeV76tubZ6bLKIzAhy1PPSZHp3/mcqxP/XJJKrL4jHNyVMcvKdgEoYppL/Kks5N75dtUFD3m8/z5ekvVFowX11y0Mzk6Wo6T0a2Fj4PeTRvQPpBetjh2sCBOwmTCulU7GZKFdXdcVttjdZwVvqUNqe5RziKvB3f3XSP2zaD+1tS+gjyv948msYTpMjT0gL36cTbz52I1K7eBJJrLeRiehMkxC5Hk9o7prs1fj2P3hkkwnU22FwydPy04/QNGu46qj5jfvKt9ObhQRELfZY0FyQfRbi6/EH/nqBOfdF0R3ZNc7e1+IogmO0NrbaJyBjxkpvj8+EDahgZpVLNipK2SMCnFjXSUT6yrZb05Vjk1btYQ8jc6/EfNUEmD03upHOhK1KrIYPrTtrFLYmBoPcXjO4TrF0ISQjG06xaWStuRWTWtWpdCnJmi1tKkB0ZuYRTG0a8Gp6Fispv5Q3Lo7SKBD7yEV/mqY0SMWsxkRHVOY1OYNB+QoRt/43AFOwg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(451199018)(316002)(33716001)(38100700002)(54906003)(85182001)(8676002)(66476007)(66946007)(6916009)(5660300002)(66556008)(4326008)(8936002)(41300700001)(2906002)(86362001)(478600001)(83380400001)(82960400001)(6666004)(53546011)(186003)(9686003)(26005)(6512007)(6506007)(6486002)(16393002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGQwY1I4VFo4TjZNSHN1MkJIdWd1dFZNRWt4ZGtBUnE0bGh6WUdMT0xXTzN3?=
 =?utf-8?B?VXRSRlhGZlV5QkdURXlsaUNFeFVtUTdqLzkvNXFDNzlPUWFkMWdNUFNlWFRv?=
 =?utf-8?B?RHU2QVhJTE5DRFF1bkJNczBKZGVWbktkc25wWERqcUVtbVZwYlAzT1ZteCt5?=
 =?utf-8?B?dU4wMFhZSHFwQ2orNUIyR1lRZDdMNUhENzV4TmtYbXcxSnYrdis5WktXbDBF?=
 =?utf-8?B?Skh5Y250M3ArSkhNMHYyS1lNUzRqd2hNYkc4cEcrSm4vTmhwdXE5bzJFWUFJ?=
 =?utf-8?B?aE0yU1JpbzM1ZFlUQVFoTW1DMEJ2UWFvb2tBNXZrd1hQUmlaL1IrcXFsY3k4?=
 =?utf-8?B?WFJEbVI1eGxnLzVHS0tBZWZCdHJnTXNkbTlLcEtCM3N4cyt3WUlrbWMrSVQw?=
 =?utf-8?B?QUwyRUd0a0dnRFYzNUpsOUdMcUVWdW8yVWRON0JONE1mSDhBUFgzanV5dFht?=
 =?utf-8?B?U0IzaHpFcG8rdzExUFdGR2V2dzVxMXFPUnJMd21pT2NrZEtEbDhVY3RVV1pW?=
 =?utf-8?B?b1hxMGpKTmVvaGZpdlNaUjNrQzErLzlxN001MExlaS9tamtYOW00RDJBdzky?=
 =?utf-8?B?VnhuM29SSWxuVEhSbHQ0QTJrelNUVXBLRDRRd1UzRFVMQ2dCVXZoZkFXeGFT?=
 =?utf-8?B?UUtyLy9DUjZIRWtES1IrQ3NpT0EzYnRpSnM0eUpPNVJiMnRnWHp0ajZ2c3NR?=
 =?utf-8?B?VzFNTXprM3RVTndPN2VpVDNOU1ZFOVJTTEE5Z0FHWE9SeE1admJXeHV0WnNk?=
 =?utf-8?B?YkZoeGRpZmhLeXV3eUp3VHZTNEdNb01IL2NoWXJ4ZzJjWnFZc29ZNDRFWWdE?=
 =?utf-8?B?TkRndCtxQjdna0NVR1I2UWlwdE5aWDloNVMraFFMemdEUnYyRHFCYktMbVFz?=
 =?utf-8?B?Q04yekR0T1AyRTJHM0dBTkYvbVFmMUtpcnZFdGlROWV5bFNOQTdYUEJmQzNx?=
 =?utf-8?B?aXE4VU5ndGQ0d01qN3YvUm1rSCtHbW1SQzFTUTNpNk93Umw2SG1Sb2VCb0JN?=
 =?utf-8?B?MnZnald2MFBSY3lGZzlCRnRTQzlDaWUveGZ6M3FISncwRkZFNFVPV1prbllu?=
 =?utf-8?B?bzBZaVk1THZPQ0ZhbHB6UTVmNkhYVGdtVjFRMStFQjl3cnBiS21kdjdUcDhk?=
 =?utf-8?B?cHlVNEIraklGcGY5Q25GRlNBdHpyMkloYURUZ0RubU4xSHJvOFZuU0lJWURE?=
 =?utf-8?B?YXlBQXNRaFl5dkpnN2ZjSVFVV2VpN0hKNlgzd2pPQ04yYThWU3NMblcyS0JX?=
 =?utf-8?B?YzFKMVFDSW1yM0UxTm5wS2pBUFJFRklnY3poRUpxMnpVL3ptbVkvcDcyRjU2?=
 =?utf-8?B?YUZrMHN6eWdLakttT1NhTzNCbEZQU3lpZUIyK1p2cmFHcUY0bHpCZmNGVTMz?=
 =?utf-8?B?UlZVVkZVWUZNNFhwY2h6Z0pEMVRiRGVqRUdaU0k3c2R2K3RZWEtQSlZaRFNx?=
 =?utf-8?B?VDdEMUo1Z1FQdHI3QnVTR2ZBc09uT0RhZnNMK2k1RjRUaW1adVZGaG9Dc2FG?=
 =?utf-8?B?RUtKdi9TOFdTL3A0Ulc0MjA1TDF5ZzZvS2hZWjFpRlR6WmhLSmU3UmpzM0da?=
 =?utf-8?B?azh2bTVRMGhhVStxUVVHWmVURDdyMlg1TXFWRFU2Y2xtUFZvQjVxemhiUkk0?=
 =?utf-8?B?YnRxVlRqOXJkZGxsMU9vSTFEcnpPemV1WTdMVlRFb0huVFVkQXFDN0lVRzlN?=
 =?utf-8?B?U1ZkV1lqbUUrdE1yWitqY09pVllFc2pGSEhXbFlEOU9CRUlUWkVBbjZscDRh?=
 =?utf-8?B?SjNCbzlPMjRQdVU3a2k0TkRRbS9zLzJBNUJOSk93SU53Z1hGZHl0cXo5Ym1t?=
 =?utf-8?B?QkdNcnlVM1NnRi9STXAyNE5Yb2FFTkN2cDNSaHM2a0FlR3hpNWtITzlSd1Rq?=
 =?utf-8?B?TVVvbE94eEF2Mnc0MXptV3dRL3M4dVhNUjRaT1BrUkxWbE1pYzhYa0I0TXFa?=
 =?utf-8?B?Qi9OTGdidzRIc2Fibnl0dWlwYk1pbldseHlPRi85blc5bElsMUxxa3VMY3Nn?=
 =?utf-8?B?OGs5RkF3WVNVNXpKV1l2Zzd1N3lZN1Y3Vll3R245U1dYRWxDZ0xGZkZVSjBy?=
 =?utf-8?B?VHBCRnhFa1FxRFBORm9xZnNaQ3R3ckl3dXNJV0dzdndRSnNDUEhtbEkxa05y?=
 =?utf-8?B?UXhPZmJ4ZzJEeUp4WnV1QW5XZTkrY0hpZjVzV2xidnZDSHord3JUY3ovWGV0?=
 =?utf-8?B?ZkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	stWcNKTe+7iYy0qVHc7JQzY/9aVsik9IFAcvPnmjKyclhKkCl1UQSDZk8Fz5pxwcSjBfr7w8zcHuDVLLXq7WCLdBIBAKs8SlMchFW4N1U8nO2yaWtAKd9I4hGAV1eZlYch0CQj8tZ5HhpvXr6QU7kGNQ+PE2dxv3hEFIKWQDHcq7sM5VZwVzQwmRwsnTxxj8TyadgvPI3qNiixnBgF6zHRitZx2f4IerrsOcAzs11Rmnu+OgjDNwwgZJBLQgswrtk/LMOZ8hHbP+WUPAU3wIj3eqmLAlUSjlT++K9PUda6G0IyQfxOVz3j2eCj/scJmv9gI/s+043NNrWIHlwD3B1jY5fkiznqhox9JQIQfSCBBjZZ8r2iSr+vHNdyD5m20e7axouuJhshQg5qrE/TEMjje9BuvgJTOJTT7LsCA4B3fYGWfMWLN1eCyQcJip1Vr0/oSMeSFUx1u6pyk3Fxy8V1j5sYlVlqZMszP2jsSJPgNCVqEGJxu2IMeT9q0eXkK5uT4yXnHztSN1jnDZ/oSgONSPFVMyDy79E8UTh02hVnA8qr22BBKuK9FhjStqrF2FTlVwJZUvmLlUtfCfFu4X9baLD5QFVIZ+DmAPcmeCrhx5CFuyRg30wDvD2SUOdRrLxFAp1jVWcNcdTUAxM4WJnWIcHUl+pPMfSTaTL+JvofLWQX8CSSTg1S8W2D5T53suLbHfw/BDv2k3PP89E0XCfj9W3FgL6ykQbWNMinljWDzxTacWM75fUj/XA/G6Ib1FyrcKscg7Xv6EOowhW5LqYqWfRcAplRRYMToMl46k4NX5sZEsnCXOKwEZ1/P6jQNS
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6583e723-4ee3-4663-04bf-08db2a2e051b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 17:02:14.8401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ut9rCnVRuYwwZyApEOzJaC/SSruCq2aDe/fPnWjTbY485ASEJYLMc6TzCY4Z53xBkkN+JE4DeDcpTcB9qTNsyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6026

On Tue, Mar 21, 2023 at 05:41:52PM +0100, Jan Beulich wrote:
> On 21.03.2023 17:31, Roger Pau Monné wrote:
> > On Tue, Mar 21, 2023 at 04:35:54PM +0100, Jan Beulich wrote:
> >> On 21.03.2023 15:57, Roger Pau Monné wrote:
> >>> On Mon, Mar 20, 2023 at 10:48:45AM +0100, Jan Beulich wrote:
> >>>> On 17.03.2023 13:26, Andrew Cooper wrote:
> >>>>> On 17/03/2023 11:22 am, Roger Pau Monné wrote:
> >>>>>> On Mon, Jul 15, 2019 at 02:39:04PM +0000, Jan Beulich wrote:
> >>>>>>> This is faster than using the software implementation, and the insn is
> >>>>>>> available on all half-way recent hardware. Therefore convert
> >>>>>>> generic_hweight<N>() to out-of-line functions (without affecting Arm)
> >>>>>>> and use alternatives patching to replace the function calls.
> >>>>>>>
> >>>>>>> Note that the approach doesn#t work for clang, due to it not recognizing
> >>>>>>> -ffixed-*.
> >>>>>> I've been giving this a look, and I wonder if it would be fine to
> >>>>>> simply push and pop the scratch registers in the 'call' path of the
> >>>>>> alternative, as that won't require any specific compiler option.
> >>>>
> >>>> Hmm, ...
> >>>>
> >>>>> It's been a long while, and in that time I've learnt a lot more about
> >>>>> performance, but my root objection to the approach taken here still
> >>>>> stands - it is penalising the common case to optimise some pointless
> >>>>> corner cases.
> >>>>>
> >>>>> Yes - on the call path, an extra push/pop pair (or few) to get temp
> >>>>> registers is basically free.
> >>>>
> >>>> ... what is "a few"? We'd need to push/pop all call-clobbered registers
> >>>> except %rax, i.e. a total of eight. I consider this too much. Unless,
> >>>> as you suggest further down, we wrote the fallback in assembly. Which I
> >>>> have to admit I'm surprised you propose when we strive to reduce the
> >>>> amount of assembly we have to maintain.
> >>>
> >>> AMD added popcnt in 2007 and Intel in 2008.  While we shouldn't
> >>> mandate popcnt support, I think we also shouldn't overly worry about
> >>> the non-popcnt path.
> >>
> >> We agree here.
> >>
> >>> Also, how can you assert that the code generated without the scratch
> >>> registers being usable won't be worse than the penalty of pushing and
> >>> popping such registers on the stack and letting the routines use all
> >>> registers freely?
> >>
> >> Irrespective of the -ffixed-* the compiler can make itself sufficiently
> >> many registers available to use, by preserving just the ones it actually
> >> uses. So that's pretty certainly not more PUSH/POP than when we would
> >> blindly preserve all which may need preserving (no matter whether
> >> they're actually used).
> >>
> >> Yet then both this question and ...
> >>
> >>> I very much prefer to have a non-optimal non-popcnt path, but have
> >>> popcnt support for both gcc and clang, and without requiring any
> >>> compiler options.
> >>
> >> ... this makes me wonder whether we're thinking of fundamentally
> >> different generated code that we would end up with. Since the
> >> (apparently agreed upon) goal is to optimize for the "popcnt
> >> available" case, mainline code should be not significantly longer that
> >> what's needed for the single instruction itself, or alternatively a
> >> CALL insn. Adding pushes/pops of all call clobbered registers around
> >> the CALL would grow mainline code too much (for my taste), i.e.
> >> irrespective of these PUSH/POP all getting NOP-ed out by alternatives
> >> patching. (As an aside I consider fiddling with the stack pointer in
> >> inline asm() risky, and hence I would prefer to avoid such whenever
> >> possible.
> > 
> > Is this because we are likely to not end up with a proper trace if we
> > mess up with the stack pointer before a function call?
> 
> That's a related issue, but not what I was thinking about.
> 
> >  I would like
> > to better understand your concerns with the stack pointer and inline
> > asm().
> 
> You can't use local variables anymore with "m" or "rm" constraints, as
> they might be accessed via %rsp.
> 
> > Other options would be using no_caller_saved_registers, but that's not
> > available in all supported gcc versions, likely the same with clang,
> > but I wouldn't mind upping the minimal clang version.
> 
> Right, you did suggest using this attribute before. But we continue to
> support older gcc.

FWIW, I would be fine with not enabling the optimization if the
attribute is not available, but then again this means adding more
logic.  At the end this is just an optimization, so I think it's fine
to request a version of gcc greater than the supported baseline.

> > What about allocating the size of the registers that need saving as an
> > on-stack variable visible to the compiler and then moving to/from
> > there in the inline asm()?
> 
> That would address the fiddling-with-%rsp concern, but would further
> grow mainline code size.

I'm fine with such growth, unless you can prove the growth in code
size shadows the performance win from the usage of popcnt.

> >> Yes, it can be written so it's independent of what the
> >> compiler thinks the stack pointer points at, but such constructs are
> >> fragile as soon as one wants to change them a little later on.)
> >>
> >> Are you perhaps thinking of indeed having the PUSH/POP in mainline
> >> code? Or some entirely different model?
> >>
> >> What I could see us doing to accommodate Clang is to have wrappers
> >> around the actual functions which do as you suggest and preserve all
> >> relevant registers, no matter whether they're used. That'll still be
> >> assembly code to maintain, but imo less of a concern than in Andrew's
> >> model of writing hweight<N>() themselves in assembly (provided I
> >> understood him correctly), for being purely mechanical operations.
> > 
> > If possible I would prefer to use the same model for both gcc and
> > clang, or else things tend to get more complicated than strictly
> > needed.
> 
> We can always decide to accept the extra overhead even with gcc.
> 
> > I also wonder whether we could also get away without disabling of
> > coverage and ubsan for the hweight object file.  But I assume as long
> > ass we do the function call in inline asm() (and thus kind of hidden
> > from the compiler) we need to disable any instrumentation because the
> > changed function context.  I don't think there's anyway we can
> > manually add the function call prefix/suffix in the inline asm()?
> 
> I don't know whether that would be possible (and portable across
> versions). But what I'm more concerned about is that such functions
> may also end up clobbering certain call-clobbered registers. (Note
> that when writing these in assembly, as suggested by Andrew, no such
> hooks would be used either.)

Right, we would just pick the Linux assembly for those helpers.  I
have to admit it feels weird, because I generally try to avoid growing
our usage of assembly, and hence this would seem like a step backwards
towards that goal.

Thanks, Roger.

