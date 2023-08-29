Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F3578C941
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 18:02:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592394.925110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb19Y-0006wE-GF; Tue, 29 Aug 2023 16:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592394.925110; Tue, 29 Aug 2023 16:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb19Y-0006ti-Cj; Tue, 29 Aug 2023 16:01:16 +0000
Received: by outflank-mailman (input) for mailman id 592394;
 Tue, 29 Aug 2023 16:01:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sej8=EO=citrix.com=prvs=5989d6290=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qb19X-0006tc-7c
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 16:01:15 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45e8b052-4685-11ee-9b0d-b553b5be7939;
 Tue, 29 Aug 2023 18:01:12 +0200 (CEST)
Received: from mail-sn1nam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Aug 2023 12:01:05 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MN2PR03MB5232.namprd03.prod.outlook.com (2603:10b6:208:1e5::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 16:01:02 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::7b93:d9b3:b043:8c8a]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::7b93:d9b3:b043:8c8a%6]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 16:01:02 +0000
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
X-Inumbo-ID: 45e8b052-4685-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1693324872;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=iJ6GWb3FTTTSw4e06WYuLiril0YDiuIc1mFOJsR3ong=;
  b=EiUVm/eMd6YDM3uJCy0SSDN/Xi8FjR6oc+1i7Wl7UPfUWvgpQhsWamVy
   TK6Nn8TQNnZE0o5zmPiX8lSX0rYZrvnFm7W6MPKEdFCZm3x7T7niOzTfB
   26DiUsHNVti8JNijEUuqwrjXLwJRYo9e27wxPM5jw97ITWwF9jOpqOD+/
   g=;
X-IronPort-RemoteIP: 104.47.57.44
X-IronPort-MID: 119676710
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pMbOW6PCpTtIlQvvrR2ClsFynXyQoLVcMsEvi/4bfWQNrUom3jBTx
 2JNWWHTPPyCZTbwf49+OYTg9h4OvJXSnd81Tgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/jrRC9H5qyo42tI5A1mPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0ut8LWJV3
 /5GEjMAfhGKte/x37KnRMA506zPLOGzVG8ekldJ6GmDSM0AGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PVxvzS7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqyPy2bGQxHuTtIQ6C7zo6+dkmF2ow31ONyEsd0qRj/yalRvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLkouQyNFadcmnNQrXjFs3
 ViM9/v2ARR/vbvTTmiSnop4thu3MCkRaHQEPCkNSFNf58G5+N1vyBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsjDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:xmuEv6kT34uZ2tri0SJxQK3xdpbpDfIn3DAbv31ZSRFFG/Fw9v
 rFoB1/73TJYVkqKRIdcK+7Scy9qB/nmKKdmLNwAV7AZniFhILLFuBfBOLZqlXd8kvFmdK1vp
 0PT0ERMrHN5FFB/KLH3DU=
X-Talos-CUID: 9a23:o9gnkm1k9mLOlu3reSiRLrxfF8sJcWb3zinqIEKoCG9bRfqKSUOe0fYx
X-Talos-MUID: 9a23:Kl3UFgizixRbw06yHPrb28MpK8Y4/r2gEEA2lIRbhPW+Fz1aFTK+k2Hi
X-IronPort-AV: E=Sophos;i="6.02,210,1688443200"; 
   d="scan'208";a="119676710"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNIS7n3A/yZDJatpTrd76ly2tqnFwmFBUhEEGG0LIlAouVx4BwOpl+ar693yjMatmz0l9rVOXO3dnzZCLpr/Yd+VV45GUgWwK8I/fUAXjpXEl6NaDZENWeJ/nC5b6SYBpw2nOOj6evZ59zt3waLDSP9o5GonPiXJC/r07PIQ66ptn5Y5Ztcm8XFS62NizO0OMfVwfWAApnq99+z1i1Bph+q8SuUjAHZNnn7Sv3ezaZsPohhXgg3ioLFaAEu8ZuywBWNwrPEiQ9hdETcPyNoU9r3kUtTyj6cvZeCOAvPJHEX/mJxKHsy+AVBu/0+ER0qQpAJl6JszmtqmbQ0S4kQ8WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzry+knR1wpy2j+D9GmBw8oLXwW5CHI1JGm2cnlweGs=;
 b=P3LaCggjSVCkDjYPmqIWq26YUQoh5xRyFoaaiPOUu8syDJeWbt7GQNd2ECR2MKaAcPRrqrWi8OITbI8ShUvDgxQth5EVq9NIMLDnt3H4yiX6TlLiFojSuxqSf/fFFldKTgFhnKXsW1CQYRiqHKyd0tCZsXGFNogFP9uPGDc16nFzyhxd2yu3dIGNxbPF5ObRSGdFJW3wm9PhTMN5+enCMtCtsyST4JVpJJe2Pn3CES9DcXFs2vrBr8MXV098L2i5t/hj5oFy/5xrTe0QvZtSdmUtoma8w7wa1Fe49nW6SxvmkZ6L4w5x1Cn6X+cLVsqmX8Y3TVFaBhTwCP5jPblvOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzry+knR1wpy2j+D9GmBw8oLXwW5CHI1JGm2cnlweGs=;
 b=U0xgvjJDKQjVuGhdSyBE5W6nChjAc91Y2x8CDSJKyOgOe5ImpeEg6V5BmB339KY0DdDSpv/kj3DSm7inx06zAteeONb6tJDcMU+4NcapnCpv6QOnsev5phS0/EUIilnC+OgRryAah83nYPz4euvDiNos3zb0zhy09F/DFjWYXFw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 29 Aug 2023 18:00:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/APIC: Remove esr_disable
Message-ID: <ZO4WODGDiXRj3mrX@MacBook-Air-de-Roger.local>
References: <20230829154621.3565971-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230829154621.3565971-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO4P123CA0481.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MN2PR03MB5232:EE_
X-MS-Office365-Filtering-Correlation-Id: e88fe23b-8984-49e9-c775-08dba8a924b0
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZW0MR4HVka8ZFBy6ZBBXF4M4D/q4blFgncvOr4v1ZnwHM/fCtPQVEucM2wwuWnrpqtQTS8x9+ewFPMfjig5ijbAww34MbqAZVj4VWJRDGNrL2iVZb+okD3vcK4R6Hqpzhny0z12GmYolk+iltsUZcvL+8qwDKBKIHMJH1WD67ZZ+xs+jFj6vrAp9vaM2a2qax2luc1LYXIR5sAt9WGTG+dB2ubovulWHxe1GbSWc7QUCNnDBi4fXHaAzop2mcm6sl2+ai/skM54dPjnwmTg4ylHajWUOXRKsQzxwrP6aEa5bt7z9hAuBtczgoR775ZnNAyPaUeHNmTEumGqywl0XC4mWal5qGT5Yhzn8QeJ4ezwOP8gYP21kk/0WDf3JOlXUePan971dhePxi/LzPHERMLvXS6PGIbukthxunpdoEaUHsg+MqQbTFJOiMagPqG0dL4kAMQztSCOPjw4w2HLCEPBdWn9FqyoHgRIAEueIZo1D96NAhMYu5TLBmvl3J8IxC4dZQGaboO+LftAszPai3hPz6GKlskM5wFzHs5AfRHa1ySe9aySk/hggi+GTsZUw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(376002)(136003)(346002)(396003)(1800799009)(451199024)(186009)(6512007)(9686003)(38100700002)(316002)(6636002)(41300700001)(82960400001)(4326008)(6862004)(2906002)(83380400001)(86362001)(85182001)(26005)(5660300002)(8676002)(8936002)(6666004)(6506007)(6486002)(54906003)(66556008)(66476007)(66946007)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2xLMHRKaGF4aTFrMjlCeUtMMzArRVgyazNPTWZ6VS9pbkNUVHIrOUo1dEpy?=
 =?utf-8?B?ZG9jOWlhQUFWWHVaejhpUFAvRlpkcHcxcnBGMUI3NUlRbHBtRnFVU3owcFE1?=
 =?utf-8?B?THczQzdKbkNQdGJCNU5ZNXZNY0ppR20wT1pNVjNicXhxeG4xZDhCcWNDWWls?=
 =?utf-8?B?RFBaUHkwME1vcS9TMHZHNUFORW9oRGlPdFVtUHB5RzNqSWFzVDd3d1lhdlZw?=
 =?utf-8?B?R2U0KzVKU1BYWXA2dVMyVWdoaFBTcDlFcFd6MlFyZEw0YU9oWnYxbDRzSzd5?=
 =?utf-8?B?YnpSSVZaSnpybU9KSFBSdjNqN3RZWWNJSWVmeGE4RGRtc2FvY3RCWlIxdFN5?=
 =?utf-8?B?N2hNWjBHdUZ0Q2ZPWEJYZVBwY0twbnhUY0RUb3BFQitqVU1XMjVNU0hhNFh6?=
 =?utf-8?B?cUdkZEV2YTcxNXNIVk9TWHR3cWt0b2orVzVxMXBlb29PWVI4MkhDbmpSeWRB?=
 =?utf-8?B?bFdoQnNXWkpWVWJqM0dMc2FRL0g5OTNlQklpUWVGWFUzOTNIbEY3UmFVV0c0?=
 =?utf-8?B?eWkyOXloUVN2bC9TYXFmcUZlV2liYmVPekJDYlpyV2V2QnI1RVRZcDBBZDFi?=
 =?utf-8?B?Zy92MkxOQzd0dmZiR2t1WXhHeVV0SjFFRlBPNVJGNDhCd2dnekNTRXh6VUdI?=
 =?utf-8?B?aWFvZWZjSFlUdVMyMEZOYTJpS0R3ZkZLdlg5Y041S25YN1V0L3h0amVCVkdP?=
 =?utf-8?B?M0dZR3dVZ2lvSlNUUmdGSEZBWDFhbDVLNE1wdUYrTzdKSmZSdUZrZTdWK1lm?=
 =?utf-8?B?ZjBsZ0pjSWdPdFp2Rk9KbVRWYjRsLy9scWtSY1hCQ3JoZEJGdXZRSGxUYVJD?=
 =?utf-8?B?S2hWT09yQmcxejAyMnBPaHRrQnJacTEzMnhMV1FBUkxGMVpxYWUzWkE2aHNP?=
 =?utf-8?B?Y1FVMU1MQ2EzU1N1QTdZMTVTYXVyTkN2MCtwRkdDZTVPR0xXb0dIUlczSHps?=
 =?utf-8?B?MHQxZUhJZFV0ekIrVVIwb3R5RlVpMGxXOFZCaS9keW1zdXY2VnRVcmZxcWFn?=
 =?utf-8?B?RkRDaGNwVVlIOWtaeThaMDc5OGxTN0hweCsrblRmNEhTUGg4b1RucjEzdENJ?=
 =?utf-8?B?dVhSYkZqSGJ4KzhjMisxZlFSQzBkSGhxZWg3b1hjZVkrNVR0NUtOQUxLSzFQ?=
 =?utf-8?B?TGcvM25OWDVvRmVTK2NaSEpTOFcwUXFxRUs3ejdHd3RRckpoS3pwY1EvTjVy?=
 =?utf-8?B?T1FSZ0x3K1RpU3ByWUowamZhU0lOeFcrMHRZdFN4QXp5T2NWdmcxd2EwRElQ?=
 =?utf-8?B?UWhaWGNxMVh0clY0UFNDUktiTUV1VXR0WFZid0xDcmsvQ0tkS2ZsdWlNRjE4?=
 =?utf-8?B?blFvTFhIQ0pGcEQ4SFlxNTFMYkZ6M3JQSE9Ub1FXVDRLUWZ4NHJ2SmREU3pP?=
 =?utf-8?B?ZGthT0IrQjJjMmRjUVhRVW5OWmROU2pWTUlkZlRENFFoZk8yTkxZanFwN2RL?=
 =?utf-8?B?VjQyZzJMSFpsRmJPQ1puamRydTlmeTQvWk10RzdtczVPckRvOG5HU2t2K3Nn?=
 =?utf-8?B?WVdqZUl0cnU4NGl3T1c4bzNIMFU0M29WeEtqRnJ0YXRyUmZSeDdFaUt5amYy?=
 =?utf-8?B?YlA2Tzc5bllsZjNXc2ZtVGlZZlQ1elVGT1pVbHFJeGVFNitpQzhEVHFkRlhT?=
 =?utf-8?B?R1ZCUjZMMXRNdmZRazFGa2VlTUFkYXFGRTI3MytJQk1wZGFCNHpzYWI0OEk3?=
 =?utf-8?B?NVRlTkNPcG5ma0FUV1pPQVZCaE1tY0ZBNVRvNFl2U0tnaHFVZGh0SUxaQWw3?=
 =?utf-8?B?WGRrYWhZT2o5YTgvNE9TRjJuMEkzRno3Y3hJZFRRQll0c2Vzb1VMWWF2Z1dD?=
 =?utf-8?B?Y3lhcWpOUUM1bUdEeklzM0pxUFkwVmEyTVpLUlZJNGtZKzdUTUdNL0FNQ2VX?=
 =?utf-8?B?SzBOckd3TTlCOHRsZmEydXdncEtXZ0RIOU14QjlnNHRYNS9VUFFCUGdTTVdt?=
 =?utf-8?B?bjM3bzROR2Y2SGJCa0Y1MTVvVlBHd2NTRzl4OEFtTEsyLzJ4aW5NdU8rdGUx?=
 =?utf-8?B?VnArUFFOTDQ2SGYzdE53WnpoWGpiQ1JMTWpVbUljYlNBTkFPYWtIcnRKOTF0?=
 =?utf-8?B?aUpoYkkrVzRSays3TWZQTGlCcnVXYUdDRmREVVkyK3l0UUlwbDZ1Um5lYVRl?=
 =?utf-8?B?MkQ4ZWFNbTF2TTNNSE5YUEYvNWVpV2cvMUM1M0s1UU9vQXhlbzVIa0VBMHBm?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bzIO6vUA4zDX09uotMFpltHDuOMwmNTr9CBFWSRJgWC9PUbCR9CBO/lc0Ftdu/APQDqif6XhMrM8rAH7CFclsj/iZY7+ObJmW10johHfoutxDtq33h9LvhzT35GXcPyU9GUHb7sKGArPNQcxRcPmbPDfOEB0kKxfkukH3hxi3iWgZbhpGkZ4DCI+b2DeaH/s1CSp0ct+CXiXS5WAJKM4eyQM7gKB8jkRx6RXkIXBlXs6ET5GTnoWw3CpfJe+uXoHCUJSQGK1e6Fz/NSIlz8BAvbWFYE71DBAbXN9BC/XLgtAa7Rk9Ton6bpoBToGlVlQ7QINh+9dVfxrRgAZ8nOwCebhFEUE3SXgaXxiHBUAuq2snEwoBPYyrFCiaIH1wwO4j+D2Z+epT6qYRD8uIw+ROWvgSNdy67hH0HdwgX86PXcWoseTt+Sk2ZnX4febo3Ng78fC7Czi7Mg5dkzHE0yYwk0iebvP3GLsIYLUYK6jfWRxIRzttF0k87tfzJ4LGPsgt7dRlP4dEnBMNuRmeoYNE5yJy6mqOTeF+LsBLdy3Wch1PigRxwdeFSz8w7T8s20rlYxsBLdPqQ+O2AIeuX6TofkxvmtK9yS3K3kdF70FAnsd6P+lMIegpDf7Yygi6wlGG22TNxWo1GnPcX0tAap0KWbpdPSBrAEnw7dlZkjAeLTkzKrm/PBMmHlVOof24CfhSvomp2Di6poh1eqW8a8qLCt64wkWYM8s0dVAN4nO1ivddPKoLz0WJzax1hdissf0GplnL1+NIp7qq4dkYSAeeFViartPK7IJKDJ5n7wk3g2lOEmnoSo2PaqJBKH+adqi
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e88fe23b-8984-49e9-c775-08dba8a924b0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 16:01:02.4028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hlAKvP4PkBNlrZCbmWI+1gC3du4/Pox9SdQAPHud5/GWM55cNjkQ4ABGFsPGrYFr2s8wp8w6wsyQmQp/qzV1Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5232

On Tue, Aug 29, 2023 at 04:46:21PM +0100, Andrew Cooper wrote:
> It is unconditionally 0 in Xen, and was deleted in Linux somewhere between 2.5
> and 2.6.
> 
> Remove it in Xen too.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> 
> I got bored waiting for `git log` to tell where it was disabled in Linux...
> ---
>  xen/arch/x86/apic.c                           | 50 ++++++-------------
>  .../x86/include/asm/mach-generic/mach_apic.h  |  3 --
>  2 files changed, 16 insertions(+), 37 deletions(-)
> 
> diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
> index 41879230ec90..5c6935ba42db 100644
> --- a/xen/arch/x86/apic.c
> +++ b/xen/arch/x86/apic.c
> @@ -496,14 +496,6 @@ void setup_local_APIC(bool bsp)
>      unsigned long oldvalue, value, maxlvt;
>      int i, j;
>  
> -    /* Pound the ESR really hard over the head with a big hammer - mbligh */
> -    if (esr_disable) {
> -        apic_write(APIC_ESR, 0);
> -        apic_write(APIC_ESR, 0);
> -        apic_write(APIC_ESR, 0);
> -        apic_write(APIC_ESR, 0);
> -    }
> -
>      BUILD_BUG_ON((SPURIOUS_APIC_VECTOR & 0x0f) != 0x0f);
>  
>      /*
> @@ -628,33 +620,23 @@ void setup_local_APIC(bool bsp)
>          value = APIC_DM_NMI | APIC_LVT_MASKED;
>      apic_write(APIC_LVT1, value);
>  
> -    if (!esr_disable) {
> -        maxlvt = get_maxlvt();
> -        if (maxlvt > 3)     /* Due to the Pentium erratum 3AP. */
> -            apic_write(APIC_ESR, 0);
> -        oldvalue = apic_read(APIC_ESR);
> +    maxlvt = get_maxlvt();
> +    if (maxlvt > 3)     /* Due to the Pentium erratum 3AP. */
> +        apic_write(APIC_ESR, 0);
> +    oldvalue = apic_read(APIC_ESR);
>  
> -        value = ERROR_APIC_VECTOR;      // enables sending errors
> -        apic_write(APIC_LVTERR, value);
> -        /*
> -         * spec says clear errors after enabling vector.
> -         */
> -        if (maxlvt > 3)
> -            apic_write(APIC_ESR, 0);
> -        value = apic_read(APIC_ESR);
> -        if (value != oldvalue)
> -            apic_printk(APIC_VERBOSE, "ESR value before enabling "
> -                        "vector: %#lx  after: %#lx\n",
> -                        oldvalue, value);
> -    } else {
> -        /*
> -         * Something untraceble is creating bad interrupts on
> -         * secondary quads ... for the moment, just leave the
> -         * ESR disabled - we can't do anything useful with the
> -         * errors anyway - mbligh
> -         */
> -        printk("Leaving ESR disabled.\n");
> -    }
> +    value = ERROR_APIC_VECTOR;      // enables sending errors
> +    apic_write(APIC_LVTERR, value);
> +    /*
> +     * spec says clear errors after enabling vector.

Is it worth making this a one-line comment while adjusting padding?

Regardless:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

