Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6A4622828
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 11:12:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440816.695024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osi45-0003tm-Pi; Wed, 09 Nov 2022 10:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440816.695024; Wed, 09 Nov 2022 10:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osi45-0003rY-Kh; Wed, 09 Nov 2022 10:12:13 +0000
Received: by outflank-mailman (input) for mailman id 440816;
 Wed, 09 Nov 2022 10:12:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CNAf=3J=citrix.com=prvs=30523791d=roger.pau@srs-se1.protection.inumbo.net>)
 id 1osi42-0003pU-VY
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 10:12:11 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f78e8f68-6016-11ed-91b5-6bf2151ebd3b;
 Wed, 09 Nov 2022 11:12:09 +0100 (CET)
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Nov 2022 05:12:06 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB6590.namprd03.prod.outlook.com (2603:10b6:510:bd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 10:12:04 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c%6]) with mapi id 15.20.5791.025; Wed, 9 Nov 2022
 10:12:03 +0000
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
X-Inumbo-ID: f78e8f68-6016-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667988729;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=9qSZl66V94H6iz3QC7K2DszNOKcn2TiAJeOzW0Ika1o=;
  b=Skz6H6nlDbTTrSKb/gHIHSFAGOIpbB8r8kw0wRLlzWr4Ap3vqk2GGYD2
   doqr0lXlDFd+kymz2RpclPSuvfOlcDDySbDvn89ALoLpQ4k48P7Uiy2aD
   PEKXRoRrZ7Yro3/Odk9Pw+EN+QQIl45g3onApOwFptVCT3X3uqD/mu8Of
   c=;
X-IronPort-RemoteIP: 104.47.55.175
X-IronPort-MID: 84459900
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kqzW06+K6LXIWVQymqidDrUDs3+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 zZNCmCHPa7cN2byc9ojPdvlphkOuZTcy4c3GlQ5pS48E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnPKga5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklf0
 acEBmgDSyqy2cbp3Zu4VdNOudkaeZyD0IM34hmMzBn/JNN/G9XpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUujdABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prr+TwX6qCdpKfFG+3sZpoUeilkAvMTc1S2OauN21jW6xY80Kf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwCGAzLDFpTmQAGcsRyRELtchsaceWjgCx
 lKP2dTzClRHoLCTDH6Q6LqQhTezIjQOa38PYzceSgkI6MWlp5s85i8jVf5mGa+xy9fzSTf5x
 mnQqDBk3upOy8kWy6+84FbLxSq2oYTERRI04QORWX+56gR+Z8iuYInABUXn0Mus5b2xFjGp1
 EXoUeDHhAzSJflhTBCwfdg=
IronPort-HdrOrdr: A9a23:NiVrT6tSFxzIkVTvRQKWPq2t7skDeNV00zEX/kB9WHVpmszxra
 GTdZMgpHnJYVcqKRYdcL+7Scq9qB/nmqKdgrNhWYtKPjOW2ldARbsKheCJrlHd8kXFh5dgPM
 xbE5SWZuefMbEDt7ee3DWF
X-IronPort-AV: E=Sophos;i="5.96,150,1665460800"; 
   d="scan'208";a="84459900"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qxk0SBGx/Ld0DzCGzOLgKD0yPdKx/vxbWSThlZg5fUtG0toZeovZvpcvaBXvyaxp4qyIZivI0Pyt+/0Sh3ld35pgQbMN3D9WzFFno5Eb7X9rblJBxX/uIxTT570mEM/Lisax+NEUhHokP8/fnbP6tCtpsuB6L1WJDS7aE6L86fEVGGQ3+oAPfCZ+d/RIlrLDfpL0vpOEO1tJQ5fq1eTv4L5fbzBF6CcyU32rs6kZz6KRMHvw7WF+JHwXzM/2jOyZ6+qB7P6zihsGzWBPH+AOHl9o+XePB8NgohNZzOM/sXf4KcPoS1Jkgs+uH5TPyLqTMopqcH1ANZL0aibsaE1ZUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvHwybfxsS/d38r0gvYyenMA2OtvdTDhqZl9pHKjHbI=;
 b=jTYyYOM9Sbn/98HhuV6e/nI0RW5WKP/Z+BYOgtXaBJFc3Bw++dFCNqy7qPqbZrbg7KdkzjpPZB5zcoiUO8ivoFoLhDYRxolin8N7Qtr5+nLN7eDdB0V213KXuR73wz4VDS1UoZMQrrJIfbiJGed2N4y9SscJuTreX2p6XIgyCFJ6zh2qNCHXTZoD1U74FC73gci0LuShzwcYuQeHL7km1Ol7Vnx8gDeNEXZhqe/Hn/9GjpuBJnYDlsnIarXSeWCMOmjMk0b5GZY/53EqOLoZ53CdEuobI19DWRiKOFooRjKyxm0r7Yl7K8VwM3mj2dbUbpz4TXbd+4b26uoxhW8Kjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvHwybfxsS/d38r0gvYyenMA2OtvdTDhqZl9pHKjHbI=;
 b=kTnzztyasct9lqsBt2IMkGGIRdlJvDCJPHgBumbTDXsvNEK3DXGVD8llnr1Lw30sB76fqjj64TagXQiQoSyhm4BCuqXYGYGVHA3UJZC83XSEWdq86WOBruZmgKZnDMsl3JKcyPqBC70p5ryhtv/Yv9b1YCoIPUGHU1v0oj8DBrA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 9 Nov 2022 11:11:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	Edwin =?utf-8?B?VMO2csO2aw==?= <edvin.torok@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17?] x86/paging: return -EINVAL for paging domctls
 for dying domains
Message-ID: <Y2t87YE5acLfiClF@Air-de-Roger>
References: <20221108113850.61619-1-roger.pau@citrix.com>
 <ae400ea9-ae42-9876-9c53-bf91ddc08a51@suse.com>
 <Y2qHOfemg/wrc07N@Air-de-Roger>
 <58d5e890-e052-47df-42bb-6cc84aedd4a9@suse.com>
 <Y2qOtSyuM43RfwAx@Air-de-Roger>
 <76cde159-088a-3351-56e2-0cf14e9c8116@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76cde159-088a-3351-56e2-0cf14e9c8116@suse.com>
X-ClientProxiedBy: LO4P265CA0193.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::7) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB6590:EE_
X-MS-Office365-Filtering-Correlation-Id: ec051c42-b86b-41b3-bfc2-08dac23ad950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	97WlfndpUmv5a+yKtnrSvASqXTziFrck0qyOo6pWIyUJz/a81dXSzzrvyd33+5Z4fvRihIXCesqBX/bGucsgtTvNXfb4p8oYurM+NsdTw7+KsyEiLj5yD52hr56me/LqQkRCANOD4UACfZly6sQMBKw2lCddhAHAFFPRHIO2E/nBuoE/kRvxiNDwwWpOsgY2qGHoL3XRB8X2CJ/iLHFpukfXDGYMfijkWIlam0zymVMwy1aT3E03a31TRoCazjjcUFjhcCB9LvNPDJ8SCT9ae0NoO+jp7q63mG+oK2eHiL+jbbaFvcjVDojcP4TcqET+AzqpN7mx1Mbag8HPxDX+Vd+P70v4kRfisL8vuGHXXYd2IxWQPHC+e2+tzPYGVrSb9y7FYfh1xqqDAimEecR+KqPtjOlKSNuLrJ8nw/B7pmHKfSOtn0Hso/9D9SoRuSBN/yXz9dqri+WtNCugBjieKbgwJLMKaSMU8pNLwmXd5SXFTJtaVIRmpYrXT2EM0hbItP0r68mM03VnRPpPFEefReQoov8/D9QwQz1m6jAGjGdA6WsuZk/393ZxXAM3Mbt19sUY8lkJ/P/xS8Np6W6EkJO/Jcz0d7maKwWruRhIlmthmjpylKRFLIUbU7G1JzTcoN2lZHAPIbkwFW3NgbQLrx7kDOquzJWm/zwuwrOm+RdZlf6quY/uWayt7Et4lqdtfh1lCVTgHKfhQeG9AwfOCg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(366004)(376002)(136003)(346002)(39860400002)(396003)(451199015)(66476007)(82960400001)(8676002)(4326008)(66556008)(53546011)(66946007)(316002)(85182001)(83380400001)(2906002)(41300700001)(9686003)(6512007)(86362001)(26005)(38100700002)(186003)(5660300002)(8936002)(6506007)(6486002)(478600001)(6666004)(54906003)(6916009)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1d6bTNwN3IxRGptR2taYkJBUVA0T1ZtMTBLQitpL1dFMVBIaFF1Tk05NlpZ?=
 =?utf-8?B?eHNhR0pMMVd0L3o3TDlRSy9xUFUzaDVrN3I3cW1vL3JrL1lDQkh6dm13N3ZS?=
 =?utf-8?B?dnZmVEVUNVdLNEZGZ2tnQWo3VDJJVzNwdE5iL2F0dk5ab3l0K1VKRlA4L0xl?=
 =?utf-8?B?c1VLU1BYOERpczNTR3VFNkx6dUFwNzJIMFh5dkt5TnNSbm1QMkxJa3R4U1R4?=
 =?utf-8?B?Ri9RNlloU0pyY2VibnpaZVNyTi9EL1ZsZ29aNlRrb1Z1LytZM01QYWtZc3Ux?=
 =?utf-8?B?VXlVZlAwOXI2QW9SU1dWcVpISllDZlp4M2RGbDBoVlU2VVhITGdEY1RHekdy?=
 =?utf-8?B?c25ZTGtrNGg4WHlRR1VQaUZiVmFCcmJBVWE5SE9PTmo5UEZXVS9NRm4xTkV5?=
 =?utf-8?B?akZNbDlNajJ2QmpOMDhEamRtMmdEZ1JzUU51WGY3Sk5TbTJyZ3BZQkVxMFJy?=
 =?utf-8?B?TWpDN25sVFR3UGdnemJEUEpUQkJzb3Q4VnNBblJKKytoanlQRlNDUWtwclV2?=
 =?utf-8?B?VkY4WG9aRExyS244TVZlZ3M3OWI1WW81OUMxMFk1cHB5R25pV3ZUYmp6NnBD?=
 =?utf-8?B?clFRZmNMYUNmbEM1ZHVrQTFEdGNxRUtYZGhiVTNHaDY0YVJKUW9JUHZiYmJs?=
 =?utf-8?B?TFFOYjdQR1lOR0JFdVNiTDNsVGV6M2JHS2ZIaUJpOE1lc01MbmZUWHNFZmtx?=
 =?utf-8?B?ZHJaWGR3dVkrSlpQblRqZlN5WjUrMVBxekJsQ1dJZ01ZQkJ6TVk1anZVOEh6?=
 =?utf-8?B?b2M3aW1GbUxzVUJCMGtUUEdVMytKeHdXUFNHV0dESEZOaStZdlVjQ05nNGVF?=
 =?utf-8?B?Zk9NbDQxM2ZTbGFFeHh6L1EzU2tNNE5yaWdPeGEyai9kbk1nSy84ZlFkUGs1?=
 =?utf-8?B?ZG5UdVhuOGxBWDIvZDViaGJGUlRJdk1wUUN3cE9pVGJnaDFHWG14dm4yTURq?=
 =?utf-8?B?Q2JxclQzaUtkMXJHdzhLQlpPYk5ZTnNKelB6bFpyN0wrcURVdHdNQThJeVM2?=
 =?utf-8?B?cU1JbGthNitpOER1WGdNZVNiZjF4eHk4eEdqSUF5Qzlqczh4S0pEN3ZaR3dv?=
 =?utf-8?B?S2ZqZU42VjFDanA2cWYyK0wyQ2hsdGo1TlBjakduWDFDVjB3cUIyeDNJZ2dh?=
 =?utf-8?B?MkVoTjl3K1NjdFc2S3p2Y3E1UzFtbXNtMnM4WVN0TWl5dEtuZGJ0TUNXZTln?=
 =?utf-8?B?YzNoMmRoMVI5T0VhMUQ2YWRGT1JSZVhiQ3Q1WWFQQ2N4cDk5czVtbGdvVWhO?=
 =?utf-8?B?bXQxTnNrcGFBN0RWNDlXbXRMbXk5dFY3WTA2U0JtU3lQZEs3NnY4eStlcWV5?=
 =?utf-8?B?cUlNQ1VtQ08ybktGbmY0L0NwQlpyTnFodFArUktHU0t2SnpLNERrY2tuOGp0?=
 =?utf-8?B?aFpKSHB2THFxblVMc3BZVlJxSXJ2UXloK290QTBBbTV5cmRtZW40TFRtNlht?=
 =?utf-8?B?eGdSWFd4Z1VnbEQzNzhobkJWTjM1TmxkVEN6cTFXK2tMUHpCUm9CUm1NSlYw?=
 =?utf-8?B?dnNyaENleDVjTFRZR3JRbXhrbFIzSTljb0JwTzIydlNrSjduWnpzSFJqOFEw?=
 =?utf-8?B?UjlES2FhR2piRTQ2VDdoV2ZYNHdpY2QrKzdxc1FjNUFidUFxa1h2SFF2c3By?=
 =?utf-8?B?cUNuZStiWHVwR0EyRHVBdjB0Z21oR0ZFQ0kyYzJYSDFnNktqa2xjRnFJV2dp?=
 =?utf-8?B?M2t2eWRiQjNGZHBLQlJONXQxRm93aHh0dC9Denp6VE1vc1l0MjRHWjAydGdS?=
 =?utf-8?B?M0ZxblhKWTlJazczMEtIeXY0OENYYVRSSUZpM2IxRW15dTltOHlMQTN3Szdw?=
 =?utf-8?B?b0I2QjhXbGtEZm1pQmhjSHFSNXNQOW9pclFSVndWYndhdVczcDBKZnZxUHpv?=
 =?utf-8?B?NllFN211VHAwSCt0WEVxbHA3OXdMMk4vZ0FjMXZUdnorUzJ2Z2pYaHBLTHYr?=
 =?utf-8?B?M1JRT3g2bWY4eEN6Mm9BVFdtamRmSDRYWGptMkZqaWtkdmxEWFQ3TUtqdFNP?=
 =?utf-8?B?bWorTEpSK2NTQTFnbjZEbVRncVhRaHFGeUc2b0Nhd2lnK2t1bk5vNjkwVk0v?=
 =?utf-8?B?bGhNZEtnSzNYY2J5bjd4Z3crblpGeTExdXdKNEMvNUljc3orUTRVQ1VrUG1M?=
 =?utf-8?Q?cpuyBRdlSGbVlu8OfwKzi+J48?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec051c42-b86b-41b3-bfc2-08dac23ad950
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 10:12:03.8362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /aCbq7Js52JlRv4mXZDdSZb+6D2CUFOZ4gX0TeDv9X8GIKtVZ+C7lUlvu/EfWSxF3Mk6w3hyl2Wf88LMfvFSPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6590

On Wed, Nov 09, 2022 at 08:48:46AM +0100, Jan Beulich wrote:
> On 08.11.2022 18:15, Roger Pau Monné wrote:
> > On Tue, Nov 08, 2022 at 06:03:54PM +0100, Jan Beulich wrote:
> >> On 08.11.2022 17:43, Roger Pau Monné wrote:
> >>> On Tue, Nov 08, 2022 at 05:14:40PM +0100, Jan Beulich wrote:
> >>>> On 08.11.2022 12:38, Roger Pau Monne wrote:
> >>>>> Like on the Arm side, return -EINVAL when attempting to do a p2m
> >>>>> operation on dying domains.
> >>>>>
> >>>>> The current logic returns 0 and leaves the domctl parameter
> >>>>> uninitialized for any parameter fetching operations (like the
> >>>>> GET_ALLOCATION operation), which is not helpful from a toolstack point
> >>>>> of view, because there's no indication that the data hasn't been
> >>>>> fetched.
> >>>>
> >>>> While I can see how the present behavior is problematic when it comes
> >>>> to consuming supposedly returned data, ...
> >>>>
> >>>>> --- a/xen/arch/x86/mm/paging.c
> >>>>> +++ b/xen/arch/x86/mm/paging.c
> >>>>> @@ -694,9 +694,10 @@ int paging_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
> >>>>>  
> >>>>>      if ( unlikely(d->is_dying) )
> >>>>>      {
> >>>>> -        gdprintk(XENLOG_INFO, "Ignoring paging op on dying domain %u\n",
> >>>>> +        gdprintk(XENLOG_INFO,
> >>>>> +                 "Tried to do a paging domctl op on dying domain %u\n",
> >>>>>                   d->domain_id);
> >>>>> -        return 0;
> >>>>> +        return -EINVAL;
> >>>>>      }
> >>>>
> >>>> ... going from "success" to "failure" here has a meaningful risk of
> >>>> regressing callers. It is my understanding that it was deliberate to
> >>>> mimic success in this case (without meaning to assign "good" or "bad"
> >>>> to that decision).
> >>>
> >>> I would assume that was the original intention, yes, albeit the commit
> >>> message doesn't go into details about why mimicking success is
> >>> required, it's very well possible the code relying on this was xend.
> >>
> >> Quite possible, but you never know who else has cloned code from there.
> >>
> >>>> Can you instead fill the data to be returned in
> >>>> some simple enough way? I assume a mere memset() isn't going to be
> >>>> good enough, though (albeit public/domctl.h doesn't explicitly name
> >>>> any input-only fields, so it may not be necessary to preserve
> >>>> anything). Maybe zeroing ->mb and ->stats would do?
> >>>
> >>> Hm, it still feels kind of wrong.  We do return errors elsewhere for
> >>> operations attempted against dying domains, and that seems all fine,
> >>> not sure why paging operations need to be different in this regard.
> >>> Arm does also return -EINVAL in that case.
> >>>
> >>> So what about postponing this change to 4.18 in order to avoid
> >>> surprises, but then taking it in its current form at the start of the
> >>> development window, as to have time to detect any issues?
> >>
> >> Maybe, but to be honest I'm not convinced. Arm can't really be taken
> >> for comparison, since the op is pretty new there iirc.
> > 
> > Indeed, but the tools code paths are likely shared between x86 and
> > Arm, as the hypercalls are the same.
> 
> On x86 we have both xc_shadow_control() and (functional)
> xc_logdirty_control(); on Arm only the former is used, while the latter
> would also be impacted by your change. Plus you're not accounting for
> external tool stacks (like xend would be if anyone had cared to forward
> port it, when - as you said earlier - the suspicion is that the original
> change was made to "please" xend).

AFAICT XEN_DOMCTL_SHADOW_OP_{CLEAN,PEEK} are equally broken if no
error is returned when the domain is dying.  A caller might think the
bitmap has been fetched correctly when that's not the case, as the
bitmap buffer would be left untouched.

> > This is a domctl interface, so we are fine to do such changes.
> 
> We're fine to make changes to domctl which are either binary compatible
> with earlier versions or which are associated with a bump of the
> interface version. The latter wouldn't help in this case, while the
> former is simply not true here. For Andrew's proposed new paging pool
> interface the behavior suggested here would of course be fully
> appropriate, demanding that tool stack either don't issue such requests
> against dying domains or that they be prepared to get back errors.

I still think we need to fix this bug in Xen, and then fix any
toolstacks that rely on such bogus behavior.  Propagating such broken
interface is just going to cause more issues down the road.

> Thinking about it again I'm also not convinced EINVAL is an appropriate
> error code to use here. The operation isn't necessarily invalid; we
> only prefer to not carry out any such anymore. EOPNOTSUPP, EPERM, or
> EACCES would all seem more appropriate. Or, for ease of recognition, a
> rarely used one, e.g. ENODATA, EILSEQ, or EROFS.

I was about to use ESRCH, as that also used by track_dirty_vram() and
seems sensible.

> Finally I'm not convinced of the usefulness of this dying check in the
> first place: is_dying may become set immediately after the check was
> done.

While strictly true, this code is executed with the domain lock held,
so while is_dying might change, domain_kill() won't make progress
because of the barrier on the domain lock just after setting is_dying.

Thanks, Roger.

