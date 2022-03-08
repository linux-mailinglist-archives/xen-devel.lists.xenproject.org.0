Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E294D16F9
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 13:12:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286777.486409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRYgs-0004Ir-Tj; Tue, 08 Mar 2022 12:11:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286777.486409; Tue, 08 Mar 2022 12:11:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRYgs-0004GU-QN; Tue, 08 Mar 2022 12:11:46 +0000
Received: by outflank-mailman (input) for mailman id 286777;
 Tue, 08 Mar 2022 12:11:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWwI=TT=citrix.com=prvs=059ab6e88=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRYgq-0004GO-Eb
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 12:11:44 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e92f5f58-9ed8-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 13:11:42 +0100 (CET)
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
X-Inumbo-ID: e92f5f58-9ed8-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646741501;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jrnMhiM5/yuSLSYE5+yZrcEhrPJesRn/SNu57zDKZ2w=;
  b=I2sDHqibQRWJPhKH1oxCisWqhzbMb3GikgFYFf8W939y3WE3J8cbGtyi
   Tc+TZOX64MXY7pKDQS9bE/bzp0bex1MbSVjB2cKPYw6Zpca0ARUz7HL2i
   LnkLyg1YVbDpnrxldG3QmIcxuzcolQHFs23uHxnoEbL2Vdl72UFqX9H5w
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68046791
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GeKSpaM6PqcODXDvrR2zl8FynXyQoLVcMsEvi/4bfWQNrUoj1T1Sm
 jBJWzrQaKrYNzP8L4pxO4q080pS7Z6AytdiTwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZi2t4w2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z1
 OtLh6DqFQQQMY7TpPQ8SkVmEC8kIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmdo2p4RTK+2i
 8wxcwU1bEnyIDp2H2wLJLQTubiavEnwbGgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6Iq
 2SD82nnDxUyMN2E1SHD4n+qnvXIny7wRMQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlaYgBguZ4AMENQ1yx6x2ovNvziaCDIbG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnE447eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl4hDGJGT9bxgbQ+0RqmBNzBJrVml
 CJY8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9Id4Ov2Ejfx45b51sldrVj
 Kn741g5CHh7ZifCUEOKS9jpV5RCIVbIT7wJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2lnFW7T6CHvjTkkX4uYdykVbIEN/pxnPVNbtnhE5FyS2Im
 +ti2zyil00PALegM3OMreb+7zkidBAGOHw/kOQOHsarKQt6AmAxTfjXxLIqYYt+mKpJ0OzP+
 xmAtoVwlDITWVWvxd22V01e
IronPort-HdrOrdr: A9a23:JCdkk6sffZouwOXSWWQwjmx87skClIMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLj2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzE4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kbEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 LxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72PeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl5Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbprmGuhHjHkV1RUsZyRtixZJGbEfqFCgL3Z79FupgE286NCr/Zv3Evp9/oGOu15Dq
 r/Q+FVfYp1P7wrhJJGdZc8qPSMex7wqDL3QRSvyAfcZeg600ykke+D3Fxy3pDvRKA1
X-IronPort-AV: E=Sophos;i="5.90,164,1643691600"; 
   d="scan'208";a="68046791"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Os4bKxrhNBUkYwyRxCXNMuhIoJztkddFmbu+2vc1fYGs4gK9XasWnoKIMWiQ8rxmnvGDJHrmqBK9W1fsi3+mFl6OzM0Afzg4jE5eOnluYgG9Ua73Bo+svDaG7PEJDzX3nYjwNzDH5U4iOhvsuSbE0DVtkmEcmVNjcAh5EkycXodckXUiXKE8OrCss7yfyDc8unOLsrrCXu2ox0PgU0T89vxUL2pmS0p428q7eQ5unTv7aqPTUtXf3d6it/4dQDlCfw03t+lZ87llYMi6KtdolrkTWUa96ymMQkkW72o8BMlRdol2emFvfibVinTfI022yWfiSYcpoKHz/6yEHcv9cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XhK1Bf8Jdjwmh0Gg7nwadCc7ANgqxa5bytjkrcWg84=;
 b=fpRWfgzb2gvPJpRUbfE0VETDYtiX4s8UCEBWRJWRGnusxnC3fnPR+WvzKRsK0p03p7gfBWtYWpxzcd3XxrRcULAYtMeMX6tCDgtvpEY6prFSG70ONONI1ZWENIblv8itGhdZzpS/KWQLMexQa4x7g4rrQy/BLSX7ASlXEf0C9r7b8kyIg3AogLsSTAeLui0wphb9Q+tihR3OSpLWSNJXo0GHCyKSFhsb2pMLXZnmU7ghJ3uP4P+t9chB80e3JB30pbjQgPfDwwit2QCSAxyH7NTfZIN9DeGs4XPcqIMyFJp2/bd89FaYsKA36wOAV3Z2tZ0ujMWrQmvp6ZQMmulwzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XhK1Bf8Jdjwmh0Gg7nwadCc7ANgqxa5bytjkrcWg84=;
 b=WdS0FkFUcghEVHD8kwNR03ca5+YxZri4rLI7fZsyP/lZxjRfIbLm54yhypm9dV/Y/849+cC3uHtUTalMzZctRJ8kZG0zIckC7M1Jar7peCbbtpOtoZIqSxjq0gC/D6/pE4M9IYsc8++r9D/pO4iplzpPdYEedO2/5xwnbQLk4Uk=
Date: Tue, 8 Mar 2022 13:11:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86/build: use --orphan-handling linker option if
 available
Message-ID: <YidH9La8I4X+M2S5@Air-de-Roger>
References: <289684f6-fa73-bf02-137c-680ad8891640@suse.com>
 <YicsK8xqdcGZYaIn@Air-de-Roger>
 <0cde8972-b357-e2c0-ccc4-a0720cfb3501@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0cde8972-b357-e2c0-ccc4-a0720cfb3501@suse.com>
X-ClientProxiedBy: LO4P123CA0301.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea8ce24c-295c-4e78-719c-08da00fccb57
X-MS-TrafficTypeDiagnostic: SN6PR03MB3695:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB3695A5ED9ED1E3987055A8408F099@SN6PR03MB3695.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iXtEsIZNaCmNtVuTDnKcJO8cxSi6tOSgy7c103tl1LokCVlSLpSDYtDdWh9RjsMBT3YDPpgFRLgqcFDe+v57SmSDHEqp7A35ZpX3b23Ao0QQEX5k1AIbvBAqrtPe6kDOrG6tIGUPp/UPobWmrZSOlUJVYlPDS+Fes6C6b06+0kXtAwnx8YK9F1Z7UlhTyMvknxEMGi77b36cF3e7t04hgtT3aUCW1P3cM5CsXlnnbVFfRkkXYetNFwxiYlgzVk5JYLlv66OOODzepJHX3gleQbXo0gmoXPZ3d2kItflEAV3dSvUrTVRo6Yv429VbKNUoyOv6npDYCxQZd2oyJyRDQaiBrxxTHtIUh2Fz+hFpS3JLJoDN/BP+2xiN8NrzdzGNSYn5AYz7L4MJbc/ZzfgMLNwC/RLJwtkbULU2ZY4rIbnjfpkBoIggUyLEom8mRSHLXjZqA2gRLjgCA78rn6s0WT8qJEpxv2Tvn0y+VliaelvMEw7k32S3ED3dv3YXUyU7+RhkHtc70tqG0jsZSMvaOMWmyr0q/oF16xzmx12bs73SGArHmmfyY1zBkX8nyojCUtp/T4ALsX5hZKnlQQio1Oh13rylST6zz6YM80SQDsi/ZjA7eYnuuAVTF9SsxsgJzZlXmqhDxgbQBqQNWnE7Akf07NccRu9f/QfUg/ImlCfsYdEHIpWIW2DVTkkA1l4dHNo4adqS9rmc4mgKGQkrBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(85182001)(8936002)(316002)(2906002)(33716001)(508600001)(54906003)(9686003)(6512007)(6916009)(6486002)(53546011)(6506007)(5660300002)(6666004)(82960400001)(38100700002)(86362001)(26005)(186003)(8676002)(66476007)(66556008)(66946007)(4326008)(83380400001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHVsczJ4N1k4ZzRFWDVQN0x0SWordnJWV1BmMTJTR1kxTm5jQzRhZTNyR2JG?=
 =?utf-8?B?bldqdXV6ZnZ3K2dqRnpxckR1OW5mVzJXeGc4YWxNMURwZkxMa3o3VTM4VUdQ?=
 =?utf-8?B?OXlXSGdaZHU3elB5N0JJemZkcGFyQmtMYXJuTUNaQ08xdzFzUlVQUG9sNHZm?=
 =?utf-8?B?dUJYb0x4S1BiMUJmRmRkbDRIQmZXWjdXbThTZURKZFVrdjlMNFBVSHpISlI4?=
 =?utf-8?B?SXRJV2k1OGpJZktWQmEyOGY1eDJKMnpaU2k5ZDZreTZuMm9GaG0vd1JHNitF?=
 =?utf-8?B?c3lxeTBvdGtZSnd2VGFXbnZETmpCOVkrbG5vTjdLZWU1OXduNktqcXYzMTBK?=
 =?utf-8?B?YzBNVkN4cXNCankwazR4Ni8zc2FkZEIxb1VNelVyMUdpTnVRa3hTZEFuQWZW?=
 =?utf-8?B?ZS90cWpMeWZjUlVONk5TMTlGQy9UV25hc1lhMFhNV3RRVXQ2NlZtdFlVZWhU?=
 =?utf-8?B?ODNZTWJ2TEJKNThCZUVkNndNTkVVZzdLZFMrSnpHdk9STFh0VDl3cGVrZUZj?=
 =?utf-8?B?MGNxbWtBV3Q0VkN0TStKK2M4N1diQjNRak5wbFFnUHg3WDJGazNWaE1jMGUx?=
 =?utf-8?B?U0NZKzFicURubmtITVZuVDlqV2V2V3loZlpGTzdSaWdNK3h5VmlHdVRPeTZS?=
 =?utf-8?B?UU5FV0M0M1VzZ0lyY2hrRkE4eXhjd2NTUVF5ZHNTeFQ5RElRb2hpc2YzTE5G?=
 =?utf-8?B?T2NYN1BZUzhhQlRMQS9RdDE1VXpBOHZLelVKNmJaSXNtVU9OZFU4N2NRZUtZ?=
 =?utf-8?B?S0FTNzVZamVGK2Q3c0RoVCtyaHBNcEU0a3hBOGw4NHpZVS9jaGJReDltV0o5?=
 =?utf-8?B?enhPbE9KNUJmUUMyRS83dVBTdnA3RDByWHZ6NWVESloyUGxLNE05VUFaQkhz?=
 =?utf-8?B?VC9nQVZDYk9sYW4rQWtGc3AzUyttSzYrMEtoWC9VOFJyKzZ5Y0UzdGlrWHll?=
 =?utf-8?B?c21mWmxKeGpRbDhjd3k1MjFFYzFxdVRDMS90bnRXcUNiNll6OGtKZTVGZGpI?=
 =?utf-8?B?akVib1hkZzdCeUZnTHh3Y25DQXRqYmdqMy9BNmZNZTZ3enBPNmtmK0QxdFA1?=
 =?utf-8?B?di9tejJyNU42NXVjeXdWSWJQc1FTc2lvaW5hbnliRGdRbUZTUG5RYjRpZU9t?=
 =?utf-8?B?Q1BKakxRSXJ4UHQyZ0Y0L3FmaVJVdWdTT0k1VmpNYUNVV0FlMXhLTlpmMGlh?=
 =?utf-8?B?MnpIdHlOOW82b1ZRTGhGWThVRXp4YXhwUE5FT1F5L0NadWVGMkFUMEhUMDVE?=
 =?utf-8?B?aWdyUC81YXdLTGhmK2ttc1p2UUc1TysrN2tmVWdzb096c0xycWczSU9wWlRU?=
 =?utf-8?B?US9vRVBmbGt1SmJZeHJCN3hTNy9sWGh4RVZuR2ZlL05idjZ1V000Sm85OWpC?=
 =?utf-8?B?YkMyKzRkb09JQ2grR29OanowckNqVG4walA3SEYxSWVjQmFIS0c0Y2gwUHFM?=
 =?utf-8?B?RzRTczA4QWIwTHJiSVRVMVFLSFZCQW5DaStzV0doTFpRZ2xQZWNtRlpHUzZL?=
 =?utf-8?B?cGVJT0NGYWJGMFpOMmh4VkNjSGEzZDFjZHJ6bG9jZzhSU09iVnNKc25SVFBl?=
 =?utf-8?B?RUFybXBjTTlwbVFkdk1uanZNMkJXQm1UUDJLd2I4WFpsdGJhWVlxOGFwRU9y?=
 =?utf-8?B?SW02YUdwSlhlZ3JLTGQvVFo3VHNSNStvSUJ3bkVneEk0OXM4U3RKWTBsa01C?=
 =?utf-8?B?TnJQQ1RuRG1pOUFsUDh6dlZ4Y05FN280K0pXMHVuZ3lhZkQ3S2RCWWhrT1lx?=
 =?utf-8?B?N09UUHJxMDJBdmg5dndrVUZsWk0yVDFCWDRiQktidGVvTklpdk9tWGNXbHVs?=
 =?utf-8?B?Z2FQbjdtTXBNSVpHczE5M1VDSnZDK3RJcHdGZ01oUFhXNm0wQzRxcEhoenpj?=
 =?utf-8?B?a1E1TFF0b3Nad1JHZDIrVytxY2xMWlRYVjkvRGZEaG0rcTAxdWFWaE1IVzZP?=
 =?utf-8?B?Rzdud3Q1VVBTUVNaSVNweEtCVnBjeXBJS1FpK1VDa2I4Y3dldHRtOERpenFS?=
 =?utf-8?B?K292TTFnOXRxLzV3WkJNVktqZHFvdG83SkgyQ0F1SFREM1czNVh3SnI4ZnBr?=
 =?utf-8?B?VUlISEpPMjQ0a2diL3k3RVZKV1llcTFtTzg4MW13WVI1M2pvZ3dZZFRXQlVw?=
 =?utf-8?B?TUJHbDJQZzlTWUFrcDlRRHJBalpWYlNWeUhib0RUeUpjYkdyQXlMNnZZWUFX?=
 =?utf-8?Q?KWtkg6pgZvMxFywFOUIUqX0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea8ce24c-295c-4e78-719c-08da00fccb57
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 12:11:37.1654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VN3ygSCWqYlKr9vxsOXKuD+RYuRezfW6bHVxmeixKlNqyYdBmPrFDcRVRvSsoQ7OsSAc0NCdW1P5iBvdOUHStw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3695
X-OriginatorOrg: citrix.com

On Tue, Mar 08, 2022 at 12:15:04PM +0100, Jan Beulich wrote:
> On 08.03.2022 11:12, Roger Pau Monné wrote:
> > On Mon, Mar 07, 2022 at 02:53:32PM +0100, Jan Beulich wrote:
> >> As was e.g. making necessary 4b7fd8153ddf ("x86: fold sections in final
> >> binaries"), arbitrary sections appearing without our linker script
> >> placing them explicitly can be a problem. Have the linker make us aware
> >> of such sections, so we would know that the script needs adjusting.
> >>
> >> To deal with the resulting warnings:
> >> - Retain .note.* explicitly for ELF, and discard all of them (except the
> >>   earlier consumed .note.gnu.build-id) for PE/COFF.
> >> - Have explicit statements for .got, .plt, and alike and add assertions
> >>   that they're empty. No output sections will be created for these as
> >>   long as they remain empty (or else the assertions would cause early
> >>   failure anyway).
> >> - Collect all .rela.* into a single section, with again an assertion
> >>   added for the resulting section to be empty.
> >> - Extend the enumerating of .debug_* to ELF. Note that for Clang adding
> >>   of .debug_macinfo is necessary. Amend this by its Dwarf5 counterpart,
> >>   .debug_macro, then as well (albeit more may need adding for full
> >>   coverage).
> >>
> >> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > LGTM, just two questions.
> 
> Sure, just that ...
> 
> >> @@ -19,6 +26,8 @@ ENTRY(efi_start)
> >>  
> >>  #define FORMAT "elf64-x86-64"
> >>  #define DECL_SECTION(x) #x : AT(ADDR(#x) - __XEN_VIRT_START)
> >> +#define DECL_DEBUG(x, a) #x 0 : { *(x) }
> >> +#define DECL_DEBUG2(x, y, a) #x 0 : { *(x) *(y) }
> > 
> > Would it be helpful to place those in a 
> 
> ... you may have had a 3rd one?

Oh, no, I just forgot to remove this. I was going to ask whether we
could place those in something akin to a PT_NOLOAD program section,
but that doesn't exist AFAICT (and even if possible would require
adjustments to mkelf32).

> 
> >> @@ -179,6 +188,13 @@ SECTIONS
> >>  #endif
> >>  #endif
> >>  
> >> +#ifndef EFI
> >> +  /* Retain these just for the purpose of possible analysis tools. */
> >> +  DECL_SECTION(.note) {
> >> +       *(.note.*)
> >> +  } PHDR(note) PHDR(text)
> > 
> > Wouldn't it be enough to place it in the note program header?
> > 
> > The buildid note is already placed in .rodata, so any remaining notes
> > don't need to be in a LOAD section?
> 
> All the notes will be covered by the NOTE phdr. I had this much later
> in the script originally, but then the NOTE phdr covered large parts of
> .init.*. Clearly that yields invalid notes, which analysis (or simple
> dumping) tools wouldn't be happy about. We might be able to add 2nd
> NOTE phdr, but mkelf32 assumes exactly 2 phdrs if it finds more than
> one, so changes there would likely be needed then (which I'd like to
> avoid for the moment). I'm also not sure in how far tools can be
> expected to look for multiple NOTE phdrs ...

But if we are adding a .note section now we might as well merge it
with .note.gnu.build-id:

  DECL_SECTION(.note) {
       __note_gnu_build_id_start = .;
       *(.note.gnu.build-id)
       __note_gnu_build_id_end = .;
       *(.note.*)
  } PHDR(note) PHDR(text)

And drop the .note.Xen section?

> >> +#endif
> >> +
> >>    _erodata = .;
> >>  
> >>    . = ALIGN(SECTION_ALIGN);
> >> @@ -266,6 +282,32 @@ SECTIONS
> >>         __ctors_end = .;
> >>    } PHDR(text)
> >>  
> >> +#ifndef EFI
> >> +  /*
> >> +   * With --orphan-sections=warn (or =error) we need to handle certain linker
> >> +   * generated sections. These are all expected to be empty; respective
> >> +   * ASSERT()s can be found towards the end of this file.
> >> +   */
> >> +  DECL_SECTION(.got) {
> >> +       *(.got)
> >> +  } PHDR(text)
> >> +  DECL_SECTION(.got.plt) {
> >> +       *(.got.plt)
> >> +  } PHDR(text)
> >> +  DECL_SECTION(.igot.plt) {
> >> +       *(.igot.plt)
> >> +  } PHDR(text)
> >> +  DECL_SECTION(.iplt) {
> >> +       *(.iplt)
> >> +  } PHDR(text)
> >> +  DECL_SECTION(.plt) {
> >> +       *(.plt)
> >> +  } PHDR(text)
> >> +  DECL_SECTION(.rela) {
> >> +       *(.rela.*)
> >> +  } PHDR(text)
> > 
> > Why do you need to explicitly place those in the text program header?
> 
> I guess that's largely for consistency with all other directives. With the
> assertions that these need to be empty, we might get away without, as long
> as no linker would decide to set up another zero-size phdr for them.

We already set the debug sections to not be part of any program header
and seem to get away with it. I'm not sure how different the sections
handled below would be, linkers might indeed want to place them
regardless?

If so it might be good to add a comment that while those should be
empty (and thus don't end up in any program header) we assign them to
the text one in order to avoid the linker from creating a new program
header for them.

Thanks, Roger.

