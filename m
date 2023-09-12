Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7350B79D312
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 16:01:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600532.936227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg3xJ-0006JD-5o; Tue, 12 Sep 2023 14:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600532.936227; Tue, 12 Sep 2023 14:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg3xJ-0006Gj-1d; Tue, 12 Sep 2023 14:01:29 +0000
Received: by outflank-mailman (input) for mailman id 600532;
 Tue, 12 Sep 2023 14:01:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LIu2=E4=citrix.com=prvs=6128f91ed=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qg3xI-0006GZ-4O
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 14:01:28 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db7a5b79-5174-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 16:01:25 +0200 (CEST)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Sep 2023 10:01:15 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MN2PR03MB5310.namprd03.prod.outlook.com (2603:10b6:208:1f1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.38; Tue, 12 Sep
 2023 14:01:12 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::efdb:990a:5b04:8783]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::efdb:990a:5b04:8783%6]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 14:01:12 +0000
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
X-Inumbo-ID: db7a5b79-5174-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694527285;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Iaui4fk2Ejcui4H7NOLJGxRcLIbblx4qI7z/JeGp6Vw=;
  b=M7Rtv2OS3nabg50m6nMCCdwxpXiVBh4SUnCbOjSF4uw2jOvFzui+paPI
   zZ466tTHxn2+6rz0g+HRvNT87gbjtqYrs9vMYR8YQR/RFpCIuC1N35xLI
   XF9Ee1uOS/ZxBESzW61lrfR/jfrZKrKHpboNTTc/UlU1Pg4y3t+lUlkq1
   k=;
X-CSE-ConnectionGUID: NVLSHNkFTLOHgUEFXdvG7A==
X-CSE-MsgGUID: MDmdkac3RsCsCRa1kHqSlg==
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 121051456
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:BYFbFKMLNdU7ekfvrR0rlsFynXyQoLVcMsEvi/4bfWQNrUokhjIEy
 2MbXTiEPPiPM2GjL9ElPYq+oRgDusOHn9JgGgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CQ6jefQAOOkVIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/jrRC9H5qyo42tJ5wZmOZingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sBJJVpu0
 /82FBQqTh++qsyGzKyUFcA506zPLOGzVG8ekldJ6GiDSNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujeNpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyj13rKWwX6lMG4UPJiU8/JpiVbI/Hc4EzYsXAK4geCCjkHrDrqzL
 GRRoELCt5Ma71CmUdDnQ1u4oXqIsxQGUtxcO+Q/5EeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq19L2ZsDezMig9NnIZaGkPSg5ty8bniJE+iFTIVNkLOKyoitz4Hxngz
 jbMqzIx750IltIC3ai/+VHBghqvq4LPQwpz4R/YNkq95x59TJ6oYcqv81ezxfVNMoefCEWAt
 X4sms6C4eRIBpaI/BFhW80IFbCtovyDYDvVhAc1G4F7rmvzvXm+YYpX/TdyYl9zNdoJciPoZ
 0mVvh5N4JhUPz2haqofj5+NNvnGBJPITbzNPs04pPIUCnStXGdrJB1TWHM=
IronPort-HdrOrdr: A9a23:17WXua1H7J7G6nnOcG+QRwqjBNEkLtp133Aq2lEZdPU1SKylfq
 WV98jzuiWYtN98YhsdcLO7WZVoP0myyXcd2+B4AV7IZmXbUQWTQr1f0Q==
X-Talos-CUID: 9a23:lRRDpGNYWkOEY+5DfhdDz24yGe4ZVlr9w0r9DX+0F0k2YejA
X-Talos-MUID: =?us-ascii?q?9a23=3AO5nvEAzRHwU7FQbl5WCSd9wwXDKaqIGCDUwOmJ5?=
 =?us-ascii?q?dgdKvLgdKMm6erC2MRoByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.02,139,1688443200"; 
   d="scan'208";a="121051456"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrsrjaZ+y1l9xst60OMDqcst0aIFzf6V32v0JFgyp5zEbdUSnrtabw8v9DeVNs+Y1TA+2Rj7MXGK4XvBk1K89qDDAU1twIGRgHe+Q5vxZBea+7Vfao/g/xktaghB+D3b3vsdeyiEY3p+mw81KHXzjAS5cBO7yiGpp3jEyWRQeQlSaW/+abq9hDDMbiS+Tb9IkZnk/7lkKOVPafwsyxi+IyHbGBV7wteoU52ftu0rboaa6XgIUIJFjQOzIJkWhtetF9b1uApadYvPa+UO8yuXYGDh5r/xzb9j1NGb0J4JbAGjDv9nKKVnULYaXvVRig1YfC1wYi9D1TvFSqvK8Hth+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aaSg8tdNbIqV1aTK86BUT9SyJcLCxwIRDVMiNv4JQI8=;
 b=iQ1KgSr+ytyhjYYlyzN79hoMc5r/27D7yBsZLGgDUUo6Ivh9q+nDrzgl3EZ+X+kWKivQTtIXinais9THIUHJGk9//1daUuhZ+6z71HPx4MI5v9I4fg2s7Vfcj0m54Lkl4IP/Tmj54K2q/APNLAf5k8fXNtLHTfNeafN6uXk2N3Htj8d4aAnkH7WsjtttgjR6x7wUUMykAWjgMoXA2VsaWj0LO2ifMY/gdKWGNO13aOzOu2t91vikWRiW8R8aSc3QierRPNaNHSwqEZwGqP4/OBBuDpl6R3Sm9ACFG5979B6Ympyf8mF6LipPwPB4GFPajCoOLmQpwBJr3y4p1I3DEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aaSg8tdNbIqV1aTK86BUT9SyJcLCxwIRDVMiNv4JQI8=;
 b=YYAfQTY6cJfIO1o6IrKZUSJF/RuhkP0LrzgIJaDaYf6P0EBcOd9vOIT4Bi4r5q46Cg6ijUSDwHk+d53poakAFbs/qbWwbhe9h6WEd5ZVnBW1caFoc49Y5xISfvlLs6VTr4avE7Qy0H+dhrGzW085PiWXl/GEYScdPsP1KNrkYio=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 12 Sep 2023 16:01:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v6 1/4] xen/pci: convert pci_find_*cap* to pci_sbdf_t
Message-ID: <ZQBvItPn63Eu61KD@MacBook-MacBook-Pro-de-Roger.local>
References: <20230909021647.558115-1-stewart.hildebrand@amd.com>
 <20230909021647.558115-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230909021647.558115-2-stewart.hildebrand@amd.com>
X-ClientProxiedBy: PR1P264CA0040.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cb::19) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MN2PR03MB5310:EE_
X-MS-Office365-Filtering-Correlation-Id: e3901f1f-be6a-4fa0-2bdd-08dbb398b8e3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U5qV9pwk2KBfNZ76Y5ScC6E7ve2ErnrkonxbzJrEU1Ef51OmgH9JiT94degw6HhHds0NkLn739+TO0O3gcZzegA0JUKJ5PsWtjXK6OU92plRsxhFmc1jWk8jgMKSlb/DnNSBSVA7UWGsMgNZg7M44s02B6zbeleshTuDqYoKDwakdion7ZAz/ATF2TUbkK3iK0cgFRnafyjiOp4a5HPc2gZMM1LJA3ilybIFKzLC6H+AVx5adMmBPrfyyD2zZHs8pDRxdnrkdBB6eY2K7LiRXG6ly0AWQnrptO+ls9LoJlfi/pk+tL3LUnr5bAeYrcI6bnwaEieEOYm836qSx+iZ+mil+ScyIjcg25hqn2tS0Axo3gWztEoqsVKCM8jpact1lY8gKn+z4Vk2sUmrvfWxw1YppIe5G80o/Ey55C+mNg6osxPTbTSjMocld2FRD1ucFvnrVRce2OHgtYs9urw0pAlxogoUfTGpgdFuIHcWT5AE7sOThN2FXZMQaq+GDPDtUavL7E9PdlBK9WmjMWWcaiuE7QW4R1L+OenXGP65M5fmaWLTyA75Kjk71F1qy18a
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39860400002)(366004)(376002)(136003)(451199024)(1800799009)(186009)(66476007)(54906003)(66556008)(6916009)(316002)(66946007)(478600001)(82960400001)(2906002)(38100700002)(4744005)(7416002)(86362001)(8676002)(4326008)(8936002)(41300700001)(5660300002)(9686003)(6512007)(6666004)(6486002)(6506007)(26005)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tmt2b2JpTUpzZUpLMDNxN1dBbEtZMHJrVUtOVzdpSXhQY2ljK3hrd1RxOEdt?=
 =?utf-8?B?cWhOVlV6bzNmbEFOVkJ0NlBzeXFyWEVhSnBUNWxZRXBVN1piaTlUUW52ekFJ?=
 =?utf-8?B?bjloYXJMNmkyWDdjT2hvQTNyZGl4TWZQVm1wU2NPclNFc0pqOUlWNzBPdDJU?=
 =?utf-8?B?dFlvbHpCYkI3RXFlczg0YXAvL1dHYWhwdEpqbGliR1oxT1JlMGhjS0IzME5X?=
 =?utf-8?B?TnM4UHV2RnN3cTRoeDZXZEdiRUsrcW1FNEFSN3RBaDFCT2ZCWTR3WE9mRVJj?=
 =?utf-8?B?aGFjSHR5aWdMSnFtUngwZ2lNbDBJdG9iRWw4cnNwbk1oOVVtU0ZlV0U1UHkw?=
 =?utf-8?B?Mzlxd25vaXg0VThjRVlCc1RJTjR4amxlMVcrRkZQRVdiOWNSeFhhNGl5VDlI?=
 =?utf-8?B?OVNFNWs1ZFNnMWdCVjBOajZwN0FMK1lnR2VkeXJFWTg3dUNvQW5wNEdMMEcv?=
 =?utf-8?B?cFVzSlN5dFRvOFQrNERraU95OUcyejIyb1F6VEhyNk5MTzN3a0hYNzd3cFdU?=
 =?utf-8?B?dVI3ZENNM1VHbWFYb3EvUVFhQXpPNDlTYVhzakhtZDJHWTBQUTlKMEMzRVRX?=
 =?utf-8?B?NDdBWWJWZHFRZnFOdlZQSUxmbEVTRlM5Vk4wYkwxdGZjYjVVSzZpVVJvUFhx?=
 =?utf-8?B?bnpyNGxPZlVvZWwwTjI5Tkt4VC9tcG5HSWxsTmRKbkhFUjNLR0RkQ216SkJH?=
 =?utf-8?B?SXprM0RLUmhQZ2ZCS2dpVlJwUFl6eW9ZdGlYemE1WE80bkdFRktYc0tNK2ti?=
 =?utf-8?B?NU9qSmRTWkJvMVR4NjM0T0lBVzl0c3kzVXIyZHI5Z2ZOYlFZOFM4N2RENjlR?=
 =?utf-8?B?SGJaanJqQWVOSzNNNXhFWThKRDVodkphVTNyWjVIL3AxS3h4WTZNdjZzQlpx?=
 =?utf-8?B?TTBWangvU01nQXlvWTJNS2ZpOS9waGRYa2l4TkRqVUp2R0F4SzdWMGltMGww?=
 =?utf-8?B?Sm9qV0gxZ0h6L21pSXllY1RsN0JXazBRYythSS9aaUIrMktSbGdnakVUQnlT?=
 =?utf-8?B?SFhDUkFqYjlMdlJwTGFPZmw2NWxYQ1dxSHo3aENuRWc5cVA2MXFHaklCRFlE?=
 =?utf-8?B?TDBLZTkzREdDeWFYU3dSYmpRVmY1TEIxMnJpc3c4Vld4YlFIem5FVmhLbXo4?=
 =?utf-8?B?U0ltZG5Iay9nanVvNnNvZVpRaFZmd2RBNTUvZElzWlpBczBZQlpkMXQ1L3Rt?=
 =?utf-8?B?bC9NY0VJYmtjRTlKRDdKSGFCNkppVWhjWWtZNi9wbVphKzVlL2N6bmtmSjlo?=
 =?utf-8?B?OEJsd0kvb25mSXZVeWZySU5iTFE2eWMrZ0JlcElhYnEyaTNSMzZFc0hiYnZr?=
 =?utf-8?B?dDYzK1JMSklxMTBNZW1NRTU1MzRmMmcxVnRCZXA5NEdaWHZFNWk0SGg4RTB2?=
 =?utf-8?B?V1UzVitFOGYzWjRmcmZkVFFyOHRnaG1CRWh3RlFGVFpZSDNnRmFMcnVndzNy?=
 =?utf-8?B?dWNFV0RKaDFUQXoyVDlIMWs2d3ZSd2sxbmw0TnFxdmVsMHlBWTF5VW1nMm5G?=
 =?utf-8?B?RjllNVluc09aVlowRjJqTHdVekJRQnFVZUlnRkJVK3lIQzNNcjFyYWwzd2xy?=
 =?utf-8?B?R2JlSzlWVmZMN3JwTVAyRlVXbGw3bTV3bi90cUhoQ3orSFlOWUN0M2xmOU1t?=
 =?utf-8?B?VDJMSURMa3UxMXM5bjN3RVgxOTlmZm1ueGtWR0V6ZUZwRUZjNjNNYmpaVlhE?=
 =?utf-8?B?RUllQmNHMUFqRFpZOU51NVJyMExWNGJ0K3JPWWlXbVc2c1FNRXg4cmRWbThZ?=
 =?utf-8?B?OG5RTFdpTld0T0lNcUdQOW0zQUZYSXoxTUxIWTV4QmRpQktQa3RQMXcrWUJE?=
 =?utf-8?B?QzQ2NzRreEM4NHNrZ1RjSWNjbUw3QllzVERsZkhoUHZWbU1zd0RMQUEzQTNa?=
 =?utf-8?B?aTlSWHYvSWNyZ09ONU5lN0pSYUtzSEZmd1hWdUdBb2N5U1k2eWxoMG4ra1dC?=
 =?utf-8?B?ZFRhKzJyN0xvdzhEMHJ3SE9peDg1MW9BcG1xOXlDSWNhdVZZMXBEQ3ZHa09Y?=
 =?utf-8?B?Nm80Um42YVN6UExsRzFvbFNTNkNPaTJ5NWRkTWRPTUZPdVRMeGMxdUdyQ2FC?=
 =?utf-8?B?Z1VNdDRtNXF1RDVQd3lZN2U3TzdQUURDRzNRMzB6ejJqcllOSmhQU25DL1Q2?=
 =?utf-8?B?ZEdZNnFxUG5mU2JaZDdEZUFMcUtyL2dqaFJab2txMzduY1pOY0tYUGtvN0Vn?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Twf5XPOQkN/pRGVKwENj1FE8RdFGtha8ct3i6BA4nbpnFuFQQqFcrQw9OInmwKcUy2KjmuBTFKJF1sYe8gz0sdjgJAqBFl+ZCUyNT7XWsn6cOtmheOHf1Iw/j6FKr/o9HmyWd2u6YxO09JBPXNOu0JTZ/hP02ktvYHxCyQS9ck8iAx9oZ+HD5fIeI7bYtFa46MmeV/+Ns8ikfjrR11n5fpQs+R/S46H4olEoKA7W5A4rGIgTz5/0OGKCOcky6Ty/7BWjtu7MAxHdeelltdE4Wmd2ODV4LCH5zVnCbgNgzds2LzgvmAgX7G3zleWtWWMjpQAAao7qFv7YIFYVyvOA+2CDFqQQBnjyp7wZhgBF9ybhBDSkvdU7I+1+YaOgu/1eHzGUkbYQyBC4q803SqP3YOrGa+dBOeTOUPROLySZEpZz/ihlinwkQME3Xq/Y3qgVcdwgozXs2THd0PU67XcO1WP4EkNz+jto4dpN0G0lZUo7+u3bpVPtkqPtTUJRr79UmQDzwlJnlDko38aemL9pxKvrxUl/rXNqPfRyLBTk8FSzEl73y+w9/1F/6s65/fJLxfxSm/NGETJA+0rrtQkh9pX7r8Y/+3cbe79MMitCSjY48JYHX093NLrGCnz+khwTnoEzqXx4WRgfdyIDfLi7jSo1UUp8gQvvvo6NXBYhCXE7J6KmN/aIxEdMETi95VjxTEz2ibOjCWxdz6lT7yRfq32gzcNP+zt7EtqJTdlNROMSOFkyOkS6sY3OXrE7f01QorQYOYHZyu9Lqh38akK0J2w5qyHpcCIRr6rGPGCCfYOzE6A70Lqn8t5lkmP5F0KE9+oOo1gFUrPTSRSbjc18/xKpnQ15hDV+WqtG7yT/QtNPQahuuf3ArseyKOJFEgU59TpqzfUGd8EV0YRDBOvjaA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3901f1f-be6a-4fa0-2bdd-08dbb398b8e3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 14:01:12.3488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uoyw9GkAnCPrDSoWdZaHy9ENKWRo1JvXbsw+4VUPFoo1BVlfkpJXDTh2MeopReIO4o306iln/dJNNXOZtgKecA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5310

On Fri, Sep 08, 2023 at 10:16:25PM -0400, Stewart Hildebrand wrote:
> Convert pci_find_*cap* functions and call sites to pci_sbdf_t, and remove some
> now unused local variables. Also change to more appropriate types on lines that
> are already being modified as a result of the pci_sbdf_t conversion.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

