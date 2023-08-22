Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4CE784184
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 15:05:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588458.919963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYR4a-0006xp-Dr; Tue, 22 Aug 2023 13:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588458.919963; Tue, 22 Aug 2023 13:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYR4a-0006v6-B7; Tue, 22 Aug 2023 13:05:28 +0000
Received: by outflank-mailman (input) for mailman id 588458;
 Tue, 22 Aug 2023 13:05:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nKjN=EH=citrix.com=prvs=59114b803=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qYR4Y-0006uy-Tb
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 13:05:27 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e364151-40ec-11ee-8782-cb3800f73035;
 Tue, 22 Aug 2023 15:05:25 +0200 (CEST)
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Aug 2023 09:05:08 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB7158.namprd03.prod.outlook.com (2603:10b6:510:29a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 13:05:03 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::50eb:2fe4:369d:decb]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::50eb:2fe4:369d:decb%5]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 13:05:03 +0000
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
X-Inumbo-ID: 8e364151-40ec-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692709525;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ON1VZJ3f6fNVRk7vYW1bpwMguPFtxe8VCJscMEBXXYw=;
  b=A/oRrUeikAfYMrAZV4hhmIPfhnDiYcmLUlDYVcWJwkWp42mkj/zhyaf0
   n6X6U+Xx7k5cHoJ98LSi/Fjht6DNLOxowKemrpI8pzLafTJklEYJyeCLw
   nWBnW0DOCCt7N8s+JnVltkAnr6HU5tbnaqdvsE8GHfSKKJ/bZdA9477Wv
   w=;
X-IronPort-RemoteIP: 104.47.66.40
X-IronPort-MID: 119524328
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:UAfgSarplnd1UUr/dKQPHryzGfReBmIBZBIvgKrLsJaIsI4StFCzt
 garIBmCOarcMWH1f9EgbIWxpk4B75KGytVkSwBuqyhnFX9E9JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weOzSNNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAA4WPwiTvt6U+6OcYMUrnuAvLu7uZJxK7xmMzRmBZRonabbqZvyQoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3juarbIK9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAdNPTuHjrK4CbFu733QcVBwbFnmBm/i7j3G9aslHC
 VAS5X97xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnNQtWTUg2
 1uNntXoLT9iqruYTTSa7Lj8kN+pES0cLGtHYDBeSwIAuoPnuNtr0kqJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNf7D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:f+ckg6qrwP835UHZgPFu0g4aV5tMLNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5Wo3SJzUO2VHYVb2KiLGP/9SOIU3DH4JmpM
 Rdmu1FeafN5DtB/LnHCWuDYrEdKbC8mcjH5Ns2jU0dKz2CA5sQkzuRYTzrdnGeKjM2Z6bQQ/
 Gnl7d6TnebCD0qhoPRPAh3Y8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzSIwxsEVDtL4LE6tU
 zIiRbw6KmPu+yyjka07R6f071m3P/ajvdTDs2FjcYYbh3qlwaTfYxkH5GSoTwvp+mryVAy1P
 3BuQ0pMchf427YOku1vRzu8Q/91ytG0Q6p9XaoxV/Y5eDpTjMzDMRMwapfbxvi8kIl+PVxyr
 hC0W61v4deSUqoplW32/H4EzVR0makq3srluAey1RZTIslcbdU6agS5llcHpssFD/zrKonDO
 5tJsfB4+s+SyLTU1np+k1UhPC8VHU6GRmLBmAEp8yuyjBT2Et0ykMJrfZv6ksoxdYYcd1p9u
 7EOqNnmPVlVckNd59wA+8HXI+eFnHNaQikChPSHX3XUIU8f17doZ/+57s4oMuwfoYT8Zc0kJ
 PdFHtFqG8JfV70A8Hm5uwEzvn0ehT/Yd3R8LAd23Ag0YeMAYYDcBfzB2zGqvHQ48n2WabgKr
 KO0JE/OY6XEYKhI/cP4+TEYegjFZAvarxqhj8FYSP+nivqEPycigWJSoekGJPdVRAZZ0jYPl
 wvGBDOGeQo1DHYZpa/ummcZ0/Q
X-Talos-CUID: =?us-ascii?q?9a23=3Ab7cdGmjEeQWYEyK+wflSHvw38zJuTGaM1GfpH22?=
 =?us-ascii?q?DGEFDZPqNbVOS36Y8jJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3A3WChhA8XpSFnEgDrMUCDzR2Qf95w7PivBQMvq68?=
 =?us-ascii?q?Hucy7Nh1rIxWBiiviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,193,1684814400"; 
   d="scan'208";a="119524328"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/I61DS8eBe4VbHOFItxqCDd1Z2JBv0GduLAMSGy2a6xOqJFkJgbI/hrhH1UdAslsnSMbSjiFxxH4ei+TUgTM1HQAaUe5Cpe0D8OFIrDBcDXvnYzfO1Db2/8bf/boeMVmdm1hWW/ZtoTwFfqTKtcA3p6uP4MlS+5x2/VCg6tzivONxPm05GbDEIWUekzQJ+VSoBe2Ov49zHNBx6Jbs1tkA6kDEsxZ5TmgWyuXcEMUH9ynO0x2GlotXRhXGGgBvmqbPjHXN5rz02G+XvDx6UOvBFCPz6eLkq+SBynMx5CWeHNc6bPxpkOksD1xRHARfaUNtOx1QS1KFK49ndcBiSgFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ON1VZJ3f6fNVRk7vYW1bpwMguPFtxe8VCJscMEBXXYw=;
 b=h/Bn0RtYuqSwHP0WTy9RoASUB0cMFc0JDifD+zTrMaIUXmaQpNR8dYFhhzIskuk7CYSayNGtSlWe7hJmmPHLtKcpkUp0luiBj8aciKftwZTCPMq5HjjdZIwU5RLuCxKh5wySlyf2UiN5E9UcaBK6x/dRvK3rBhmJbNBweix/pT9iLUsxWXnRr2U/xmjdZ38/sj9p67p4l4AKPNQ7gLXzfsQZfdvUBDW5yh54Ty42SXodZ2l2EPGmYUCCDuM63gRfO/cjwggiQ2g9vewsf7GJNBqMoD57Hst1WMyJY7ZDqtqFbKUnbQH656hsNmEoLHOSPjURYaIsn9F5w6hQL1XWgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ON1VZJ3f6fNVRk7vYW1bpwMguPFtxe8VCJscMEBXXYw=;
 b=wRuiAm9sJ6tUPvmYZASXONrRRWTzJsspOyaI7bH1S19rS9jbfvSu7Azn9yG56id1Na9Cf/2zGDwkYECyoO+eNmZ8jNu5r1Hdr2kfRKLemU+KkR60EKGDu3bHRxR8v2oEukHoBwlgWmyHImLCqLlqtgFlc7C6MtftdPF4VaRn5TI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 22 Aug 2023 15:04:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] CI: Update FreeBSD to 12.4
Message-ID: <ZOSyeniR-L7Zf6Zj@MacBook-Air-de-Roger.local>
References: <20230822130142.430189-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230822130142.430189-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO2P265CA0345.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::21) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: 8db2a664-4ea6-454b-e272-08dba3106601
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yzs3pWYKTi7EFjYOg+VSX/OfVLDdg4bI+qB9y/z3V73LQ8fu0C4k3BiNhpQ0MiXvs2AQ5r5AKnuSYwnj7LtTp7SlRiccLMPBjyrf5MOZawYD6VAGkcAirZZp5uAoykfKvteJ8pkIomQTC3N96ISvY1S/hTANhfM/RrF6IWe30/0xID/AQ8PkgLQFABh7N0ZkdEsjyUl8tbGuhy/pXKQBg1MDhGhdV8U5/2w7PYnhA0IbLlkFYoyI4sINXQnP8ffuCQ8MpDa5+gjfMLof4X9qRRuRzFxUDwrnyThtvKvErCUWHdV5OearE9n4mxcCw4lDtPZnrP7gfYO+YAl4iMhJTpYIvuiigL5htdwXRJKjze7JKU5sv+A/7vFk5CQNcIV+ZNOzL3x5sYiu3jCXvX9X2+BTalulPPJYhd45A9g/y066CdEs5z4V0nlmQBhB3z0Ckbz3j/c1gJfmlz7aDW3yP8WYpDPe+/Gu5unek1SX1/GnK2t0klCM0BsIU9tgp8z0wKRmJKuy8ti8QKWS0CQlr2rf50JcBbKDTaN2eOsVxhUCWzWaH8xCp4mx/oUUcSph
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(366004)(39860400002)(346002)(1800799009)(186009)(451199024)(54906003)(66476007)(66556008)(6636002)(316002)(9686003)(66946007)(6512007)(82960400001)(8676002)(8936002)(6862004)(4326008)(85182001)(41300700001)(478600001)(6666004)(38100700002)(6486002)(6506007)(558084003)(2906002)(86362001)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDIrUDNwQnJpNkNad1ltVlJKM01ibjhUZDR5MGtWWHpNTE92Qm1WaVptem90?=
 =?utf-8?B?N0c0M0FQaFowMm1uQ2RybEpOdDFac2o4NkZrcVZTUWV5YWRiOEo2SG5reUxm?=
 =?utf-8?B?RHFSemJ2S3F1N1hoa0NSbjAzWFZNd1VxYlBUeGJRcFVLcUNEQ3dCVXhHcmNp?=
 =?utf-8?B?K2I3UDVmUXlQSGg4REVUMUJGTS82aytTTDcwS2J0cjFFTytibXg0R3NMTHV2?=
 =?utf-8?B?WUZaNXVVWmxMMjZDakNzcDVIcGEwQWRuUXJEaEZZWXRkU3B3Q0VUUm5IQi9R?=
 =?utf-8?B?ZGlUaGJQVDQ0eUlmQXc0QnVHOElFY29kMTlmYXA4Smw2aWUvZ09nUko3bWhG?=
 =?utf-8?B?ejlxWUJZVyt5N3UwcDdYRGkvYUVxbWJPTE0vcWNmeDA5SHQ2TG1ERWs3NG1O?=
 =?utf-8?B?Q2xTSUhJOG1wZGJrZUozamsrYXhjb2ZMWml5Wk9kRkgzMjJwSTRid0EyeG9t?=
 =?utf-8?B?MUhpZXBSM0EybTV0YUVZb2pXOTFadG51ZDJVUlRmT1FBT1ZBYzVnblVwOHdS?=
 =?utf-8?B?OGp0dW9Wa001Z09kNDBmY1JNTVVvWE0vSmVJKzB0c0Z5ZnZNZWNFUEVvNzBo?=
 =?utf-8?B?RkZTZXN2TmpwbGxoQXBWOThPWDJXTXFrcUQxVlQ4TEM0NytKa3l3VVJlaHZ4?=
 =?utf-8?B?M251aUtFUmN3QlNZOStJV2NpTmh5blQvbHlnNjVnRFdFSWdXN1JIWWVFNnBt?=
 =?utf-8?B?cjBZbUVIMTFLSW1xdHNqZjNOWE1aQ2NxeEtXQ1VFUEtWVUd0c25RVkx6WE9E?=
 =?utf-8?B?bllmS3dmUnQzbEZXL0xnK1VvR1QzaDZJZ044NzB1c2xwREswWFFXQm9neXdx?=
 =?utf-8?B?eGhUV0k3SGxldXB6azQyQkwwelpKbEhYWFJ0bnJUZXpTaUNzTW96eXZHQ044?=
 =?utf-8?B?MlZVcGEwa2V3QkIrMWxxcHdaS1Uwd21Fcmd4cS9NaTU5OUZaTnVQYktBNm80?=
 =?utf-8?B?L2FDV0pTU1NLVEF5QklUZi94aS9ibTkrVDJQa0xuWjBlYmJNL0Y4TVVFRWhJ?=
 =?utf-8?B?WVFzU2l0M1Vkc2t3Q2VGNGFIcFYyL0ZieW1BMnRvZ1NKUTJFNlNPSm0yaitx?=
 =?utf-8?B?Y1A1YnJwSW1nbUdIVUpiczUvSnpPYjFpLzIrSjBFMUNqQkxlQ0ZIV2pEQUdn?=
 =?utf-8?B?Q3ZHQlFib3RoemZQWU5MdTVURlJWSXRvNXdBTjhiVXlmTmJPcFlrbjhTdlo0?=
 =?utf-8?B?R094NG4ybEdnVHU3KzBMTml3R29kTzN1cXEwUVk3UDR3b2dJRkpMcnZVMVBx?=
 =?utf-8?B?Y3BTT2o1QlhRTWszUlBRMWlZQXVGcG5rVExMTTVobXpwYXpMVVVrTHgvTEt4?=
 =?utf-8?B?L2UyZ3NwNjJhcGNiVGRWeDZ0OTloRGV1aGp4MGZVMGRTYkxjRGg2cHYySXU0?=
 =?utf-8?B?ZG8zUnR1V0pZR1lwQjViU2R2L1R2Q2o0NjNvKzlIdWNoTExTcmVzMkhRN2NL?=
 =?utf-8?B?dHNpNUdpa2d5OHRQNENNYWd5bEcyd2FHaW8wMThPdlk5OWYyYWsrNjFLdzVh?=
 =?utf-8?B?OGZ3VFNBSmMrN0R6OUxNZkZMSnUwa012dVVvUitJQ0xzdDI2UmdaWlBnVE0w?=
 =?utf-8?B?NTNhamlMcnlCcWhLb2NzQm42UmREUTZRZEtQOG0vTWg1aS9wb1FYMjgxdkIw?=
 =?utf-8?B?dWFORCtRaXpLaUpHTUxvYWJxcnVTR2JVZVo0SU1jRGhRMXJnMmlWS29EMUR0?=
 =?utf-8?B?RGdtTzdOTFppNkRDVDViT2hHNlhTVDJMSXZZb0lSVUg3a0JuNXdVV2g2dEtB?=
 =?utf-8?B?UElJd2pRYjFmSmpQTDgyZmt2YmRsbEk2TmJLdExMdnZTdWVpbHNxMUpWQmdV?=
 =?utf-8?B?aTgrYkx5WXc2dU01ZmpudlVxYnNlVFBMdFdWQ3N0SmM2OXRQVGJ0VXVMalVI?=
 =?utf-8?B?NTdxL2FFZ1FiUDRiYWNXdGRpZjR4amUzSC9ReEx1czY1T3N3UTZXdWJySFJD?=
 =?utf-8?B?TVhaQzloWEprV1FmdzJZV0g2enovMFFLYTIzdVEvOWZJUlRnR2ZuNkZoRzBo?=
 =?utf-8?B?SzVsc0dqeXdJL0RodmhOcSs1ak9CeWdoUHNSOVl2UG5hQW5KcTV0dmNQeVVl?=
 =?utf-8?B?ejFIRnhXWXEyMnVDRFhmUTJ6SkxaZGJTdkU3RGlNRXh0cG5Uc3BDaGt0YWRy?=
 =?utf-8?Q?NqjNBOS/17nNQJdd7wjtYboZ5?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lXWLM4noEPRWUKJ3n4pz2D0NQwMgT2F7TJa4U4CGCD+Z5bV4V3NFu1IbLXNtfm8lRkW9eirKFRdkvhb+FTeyZOGfx6T0ajr++wzDWQPqwXXcS4lez5p0EFlJmt+ymmU1Y8x4ExrJgrfJPgabnKUNSbdeASjbq1NnhKxKFyUpXYaESKsJmJxz+Cr1zPyYjz/h/jozb69q7BdPss6HZ2elh5dPWPdoj/lSH9uY2pLlAE382U2/74/IEeUEPFc6okwDKX3T2Vd0oDz7lRiJUecrvqqkGAVsCnuYujcr3hJawubdsnXVzKAwh+MN9Ie/xnHF/9dHbXm/Cq5Gt3jl9MFQf38pxAxgdeH7IZj4TPbcJeeE3mBXnEfXB6m8qP+bAS0YWUOyPpcCwMJ+Bw/TlpR1y/BEijzJVHU8AnFrd+vRS0mjJWDqSmOIFTrAvIoRMZIK8lD4DcyhGaFUXJdmYjFM8a3E0N+lTH5+6TMgvKzIFDSkOpQzFZ9s8+z2/xsbMGzEuf5wmsooeMEMWUOCk0o436jVTF9rYsZ4YX8OdyELzZSlJqLVnQVNGbfsUEwkdu1OLttO8vvG2N2+26CCWV/ZhhUPtBnJB3BAa5rDKJSrSCGbdeZTbCmSKvTCkPWlYcer9z1nyDvikG4AcAg2ZmorJdnBKycYUcRmC9Ep0bibEBPM8SKYjid2w/TJzUmRokqwGzE/VTHA4ay4HVBxz958d2ViMHoDL6zP8Mc1XGehRJ8L2piy1F1AzKGpcg4aluML4X62muv9Yj5WzA6yo4QLVNvDFA8yWGasCY55QW3DW6O034/14uuVjJbetFSh3QTg
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db2a664-4ea6-454b-e272-08dba3106601
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 13:05:03.1345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X6d/+O9f0epq8sDTFJZIEzeHvJNaetQLIwtI5tg8AcRcFaf2uJrHOi9xDWt3EHCI9vT3RtMlvO1/JZefEaEZ8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB7158

On Tue, Aug 22, 2023 at 02:01:42PM +0100, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

