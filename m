Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C19F6E78FA
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 13:52:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523379.813368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp6Ls-0000d6-Lx; Wed, 19 Apr 2023 11:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523379.813368; Wed, 19 Apr 2023 11:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp6Ls-0000aW-J1; Wed, 19 Apr 2023 11:51:56 +0000
Received: by outflank-mailman (input) for mailman id 523379;
 Wed, 19 Apr 2023 11:51:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WAk3=AK=citrix.com=prvs=46623c849=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pp6Lq-0000aQ-Iz
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 11:51:54 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92a5fb83-dea8-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 13:51:53 +0200 (CEST)
Received: from mail-dm6nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2023 07:51:48 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6875.namprd03.prod.outlook.com (2603:10b6:a03:43a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 11:51:45 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 11:51:45 +0000
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
X-Inumbo-ID: 92a5fb83-dea8-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681905113;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=RHe9ZI82jU5eDVIH+XZ9oUyWs8fp76d2ZgQmAdH27Xs=;
  b=V1NznTO6EMGD+R9TvVzneM/7Ukyy5n2P3Z7LoIaPsJaQCY5auUB/ywx3
   52oYm8zRlFN2F8gaq/fYzFla/30DZsyczN3ZMQ6EDtaCdln1VvMzlNPDd
   LvMeRIYZ2yUskQNABNkiQ829HlH2fFWR023dECzdfRbet2iCcZrcaBCrK
   w=;
X-IronPort-RemoteIP: 104.47.58.107
X-IronPort-MID: 105434527
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:mijxQKOrQ6yIUwrvrR23lsFynXyQoLVcMsEvi/4bfWQNrUpxgjQDn
 WZJXzyDPviKMTH8cot3OYW29ktVvp7Sy9RlSgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvPrRC9H5qyo42tE5w1mPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0qVyWkVH0
 MQpEw0Qbyub29mnmOi1GtA506zPLOGzVG8ekldJ6GiBSNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PpxujCMpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyrx2rSTwHmkMG4UPKOf0sJqjACi/1JJIhI2U1aWhPXll3frDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAGRDNcbN0ttOctWCcnk
 FSOmrvU6SdHtbSUTTeR8+mSpDbrYSwNdzZaOmkDUBcP5MTlrMcrlBXTQ91/EamzyNroBTX3x
 DPMpy8771kOsfM2O2yA1Qivq1qRSlLhF2bZOi2/srqZ0z5E
IronPort-HdrOrdr: A9a23:yETkJ6hpzZu5Phw/BhVXJAVvmHBQXvAji2hC6mlwRA09TyXBrb
 HLoBwavSWZtN9jYgBGpTngAtj5fZq4z/VICOYqXYtKMDONhILsFvAG0WKA+UyaJ8SdzJ8/6U
 4IScEXNDSzNykZsS+Q2maF+qMboeVvh5rHuQ6x9RpQpEpRGsddBk9Ce3+mLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3AQ/0eIGsUyWVcNqR+VwiwL/Tj6Itmdyb5xVLoEnS?=
 =?us-ascii?q?FFGdSUOGuWAfK9vNdxp8=3D?=
X-Talos-MUID: 9a23:2P8IKAs47x2VawL3rc2nmhZGCMdkvpWXNhonnrUAtuShOXBtAmLI
X-IronPort-AV: E=Sophos;i="5.99,208,1677560400"; 
   d="scan'208";a="105434527"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+Jo3ZDMO+3wI5Xiu9XjvX+ibthXKaHoM38SvNJY3IipC8RjhWgCrcRd1KsopTN3K/W+/54qZGib1IFEV5nNjzBCRtF17LVnPHQjgFr6WUoITxq16+5qbDn8BqCNsxzhPwcig1/ZZxNiVnvnfYKFIew49A41xdZycCkH3OUSdioWKB8LYbAobjfy1rolnQ2bhj2rEZDOC0FbDnlli4UprSkBUnDdwA/DSphbH5oMHwaJ8TtFMmBNH54eEA62jq8xO9zMRfgAlSDWbas2+kivzy/W7KJFVspj14V5wI00k+vdVco+408ZWY8drUhazv0k4YDROKCi/2t1smxomKvZjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gxOiCj0ew1AXfI00DEpXrlfQJSdQHydWgSkSdAuWFg=;
 b=WsKkAfr18I1e1SonhJHpH087X+UjykDEFE+D1hL9lvtLrMkz73TYsE5KgS4XnUKAnndzavykCSvepU8OuRMLBm/vYthvau7QIPi/SOlmZ6vcKWe3zVjdQYEGhq8+YRdM9ynX5G8CnFi5IfgmrUigdSAkLB0GoWbw2FcehRlmDI+S2Jx68VqKXnylmEE1yOxy2GCFII+hNBTiyI9YNg24CvABrZ2HyyKqnLb6DLkV0UUpvabZb+Kkgh1kfI9zxnwLuY52CXRhHrti2ub/mkRdw7nGS5jqIoTAYEwP5f0fHkNA3c/82W9QQZYhD1Dwv7GHlyoSAsW0c18faxnOvPNL0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gxOiCj0ew1AXfI00DEpXrlfQJSdQHydWgSkSdAuWFg=;
 b=Mqbb1dYk/s+XjEZ9sMhsSB81BuD5MtWqyKYpo6XLJl3ScVXmTLKx62/WVSTs/5qq21uj5ZFTrZ5joeAsFzI7nkV4MpxAPM26rY2k4lOldibZ8nxLiHAPck41E7nJtM/RSL99iRynPTBEEJkFoDkgWIhQalu/4/bUKObb+2v7d80=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 19 Apr 2023 13:51:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Removing armhf boxes again (was: Re: HEADS UP: re-adding the armhf
 boxes to osstest)
Message-ID: <ZD/Vy1HAhvvr2tPM@Air-de-Roger>
References: <ZDkmu0mgy23ypaL7@Air-de-Roger>
 <92e6ea3e-a381-a77e-f909-bf65d009647f@suse.com>
 <ZD0fbNMqT7tMZVAq@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZD0fbNMqT7tMZVAq@Air-de-Roger>
X-ClientProxiedBy: LO4P123CA0125.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::22) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: 84019c47-25bf-4aa3-1fe0-08db40cc7316
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VV3E2PFXrBKZ8xfyAH/aop8frtQkGdlCoUQnaxA/T54DxGtWVe1tP/pfTWAP8QaLEcZV1Y0hSOwT43ubFmzfJYXPlwqlFmuOq9GYGnuB3Kxne2y+9OqLV3A0tjPrqp7iIrlyIGC/1XrdvPM9XqWFuRiJDwk1C5ZvBFxwC4/hoDQaukfwefbsUF2gGswt+Fxy/f7Pxaf15mq0KAVBct8HL94ac10OcuBuLMmqz98cWPQ3HOqFdSXD6wnkxrjpbDUWneP17hqT59D8Rx+X4xYS4oyLGsrmsn2mLIwODophgS7DWELIzDOeTmYhW+kKuFWfAqfXZt+zijrZqlDRnr2no46w1k4P0VTw3vcl8W2b10EXl4ffrCNiELak2zKPHUrKdF4YZuV0vmWdyHN3K86xAUG3iioVv7KK9Rgdxcnta46sfqsxeDqo7XMgXCsWf9X9uyAcvTNJirrDdE0gtEwVOzFtaJfYGwRV/6norteq1HDgnTXinArCn6LM+Ok4FQZZyLv6VwOl2ikZ5h630ZHfOz4HsqeUi/0evGxCqMkPcTvSRvRuMdZqKPwqi7nn/ZQI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199021)(66476007)(478600001)(6666004)(38100700002)(8936002)(8676002)(316002)(82960400001)(41300700001)(6916009)(4326008)(66946007)(66556008)(54906003)(186003)(85182001)(2906002)(53546011)(6512007)(26005)(83380400001)(9686003)(6506007)(86362001)(33716001)(5660300002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWZJMWVaTndmVTBiK2o3VDZuWHNHakRUZ0dPSHM4N2pZRHdTV2c4QzVMdHRu?=
 =?utf-8?B?NXdPTEtkZkpHaTUvMXBNa09ZOVY5YjJwd0ZJdVo5NVpMOE01NjJNODJBVms2?=
 =?utf-8?B?Y2RId1RBbFVlSFp5QkZ2VDNPb1pWWGp0Rm5mMmN2eGJnKzVCSlJlUElxc0tq?=
 =?utf-8?B?bG5SbExKYjc2MXNxM2M4WHBlMStlck94OXdrR3NqK2VHQWZWTXlvZEM3T3ZQ?=
 =?utf-8?B?TDZCMVFzZHkrK2R3cEYxSmcwTWxxQ2dKdFluUXREczh2aUZIVGVEcGsrMGZP?=
 =?utf-8?B?SHgrQ1JzcVc2V1c4TE1nb0ExdHY5bTB1U2xmazZYS0k2MXRGeTl6RGdYL2gr?=
 =?utf-8?B?cGFYWHptakNxdGlRTTBncHdCZ0tCZXVhZUpkS2ZMdE1sdVpZUHNheUJEV3NG?=
 =?utf-8?B?aW5zUHBNclVoWFM3NHBGRzdMaHMzSDEyWTFiOUFTRldJVGJUSFVNL2hPalM1?=
 =?utf-8?B?Z1pBMkducHE2cDdNSXNZaXBkY3FQeGNhdXBLU0hPdWVBS0FwelovQlZNVklD?=
 =?utf-8?B?RFlOYzdYSFN6U21XZkQraFRlWkFHclYzNjg1VStzVVFiemg4TDNIaUpHM2h3?=
 =?utf-8?B?MUpaSHRxK0ZtdzVZaHFXYkVmb0pxeXNSbWI3bTJZSmtQYnBYNktQYmdZc1lp?=
 =?utf-8?B?MUZTd1NtdzlheGNVajdwV3RCQ01zN2JnQ1ZzS09XcmpxNDZZeU1vNlNQU1Vm?=
 =?utf-8?B?QkJER2FldEhQeFpoK05NK3hJcGtWa29FQTIrdGtMMHpMSi9FMGdmeXpoY3Fo?=
 =?utf-8?B?QVF6L2E2UUlhKzBuK0ZmUS9LemhPWVZPbUEwcXpKMTFhYXQ1NCtVUWc3aFIr?=
 =?utf-8?B?MGhvR1FLWXpXNy9SSHgxN1RTSnE5L1plWmdldTBJQTZYcHNEZi8vcUs0ZG5G?=
 =?utf-8?B?WGRZR3RJOFAvMFlIUWsvTFFHMnZpSWZOSlU3cHgrMzFhbFJ4TlA4dVBZVElT?=
 =?utf-8?B?WTBndEdMN2k4bE5YMjljREs5dUFnWllySXQ4OFV6SGhtV2pPMkIyNW53R0da?=
 =?utf-8?B?Y0h0ZytFWElvdTl5MUVtVWZ4V3R0RGRabWVzTnp4ZHFGT2Zad09qMHRKOEtr?=
 =?utf-8?B?dy9mZk83eHFMVmU1RTB2eXJjb0VHUHNicnB2V1VHV3NZRUQ1KytEOG5DeUV3?=
 =?utf-8?B?YTZoYXA4NHRNZnI5akhzK09FYXhjQnNWVFlvUWFVcFZzV2hGanhzLzNMT3lm?=
 =?utf-8?B?Y24xS3JDS3RwY0kwY0ZTeDRRdGMwTVQxYkhhaTU2RnJBRnlpTW1NTGJkVDJP?=
 =?utf-8?B?L0I3WGUrZGZlTEx3MG1TdHNPMklpUEZMQmh3L1JOai9KdXBJdjlGWStMWEw4?=
 =?utf-8?B?dkZSbDR0cFd6NExrTjdMd3pBNGZXc3NCajJaSG9Eays4MzMyeS8rQWhaa25K?=
 =?utf-8?B?NFI1MGJXQWVVQnNSSHRud2JadzQrWHNMZlFBTjFQVWt6bFBhZmhkM2pKbG9x?=
 =?utf-8?B?c3F0Sm91NjJOUHlZQzZUYmNsR2pJQzkzSGtUVThSVnBpU1MydE5hRHNGdmk4?=
 =?utf-8?B?ak1Xa2JXT0NnM09leVlvRVM1U1E2SVpmbmhjZlZyTnc0eWNQZFZuY2tjZWlP?=
 =?utf-8?B?eUtQN3VMdG81NVl0Nk5nWkxKUkprOXc5WE5yeFdsU21pK1FEVnM5Q1NUQlAy?=
 =?utf-8?B?azFLRGtGOGJRK0JsUFpQQk16cDRrNlVpSDBPbmRnZjM2Uzd5S2hhMDhPVDFZ?=
 =?utf-8?B?dmttWkpBazhKTWlmY2NwRWhmb1NDbkZ3QmdVeDVCMTFoaEYrMU5xSCsyRDlK?=
 =?utf-8?B?N0dhanQyUGdlc3dMeWoxNFkxRFQ0b2d5eDUzTURIeEJYSW9FTWhrektMaWU4?=
 =?utf-8?B?K2Z1dzVkU0R1RVR6d2lSelQrMFpMdld4NjJDWDRENTZFeFA0UVVybGU4MVhD?=
 =?utf-8?B?ZzRicVd3Z0dDMEx5K2EvL1BFUno4MEJDY3ErZnRwckpCUnlpcE5BV2NhaE5M?=
 =?utf-8?B?cDlwU0h3ckpFVGlHck5scnpYWTl1b2xaL3hvMENKOWFoOVVFYW1tNmt1eGdC?=
 =?utf-8?B?NCtpZFB2aG1PaVZHVlVlR0kwSVBXSUNoSlNnNDNjb2FTcGticEtoTmYyaXdy?=
 =?utf-8?B?YWFXWUdiWFNqWnJZQzV0REh5QmlmWG53NzlkejJvUVRKSmVsL1VBSUtsZkRM?=
 =?utf-8?B?NkUwRU5MTFRlcTNlSjZwV09jRmhxNS9HZlZFZHFuNGJmVDlEL0MzUGZ6Q3Ju?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ndXIJHOkgJvrRpl+V/RQ68ww7LnrVNGuShoJpXNLWE8D7giqyUmM37ufsnIaEfzVmY69wxhtCrC82Rf/H0tUuA8H8T1BYFO/6wobc4DZLgZk6PenKH5F9yKt/5Wu5M+k0CFqzMi2i1kQt19mEitaSILxgiNP+niO4NeOtf5liHwkqOTeizkaAkcJXW/nwsaBiyrZ3zP6dsnGybxpRPPbChm21nI0LVjAzWvf6eLPrxq6TcS+nuijDiPY9YzfXpsXtjeyxWs06tJlPAkpMjYXn0aufSd/w0Ij4kYgoSIeOiSUEfD7G8TgO9hsk1TbfDlMeP5jevL+8yeXnLlFaRTy6cmrHnKvBkOotU+t+Vfh74AfNdjZ8NA9Ok9KWR9bly7o98PAb6XKGaIrz9YIg+Dcnx8weR+2WzCtSK7oj6SovEMwkF/dmwdASIOy5KNoX1BLkaR3Za9yRdlgRG/8wc+3fA64Cn3t8SeqO3IFVkZ76tyWqvFZ8OGw/WATlrI2i6hevyNOQDY0k/5spytvnvJkg13WWE+9C8q9btbBK5Wyv5cEFdL24plMxw7JXa+BAoHoHi3Ca7UH04TH3EEKG4rbbJ221phOHEsXwUAm9pPidbXPYQpgHn2T7qkSjMVugtbMrqGQB6Z5xUmQIf/vQkVGJ0p4/g7oNX0oG0H0onGP/6L0c8xPjcvcKtwJXMN2Ou37R0iGADhLbTi87v3L6naKhMmQoniRjWr/cd5A3oR5anTBaUqllBcHEI4owv9YwyEANHkhHANrUEMpuLWMrOfuxPg7z6eIxp4FRycTiXKvn77viW8PJAoWk/W0qZ/CZfxf
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84019c47-25bf-4aa3-1fe0-08db40cc7316
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 11:51:45.3707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dyFdO3D8wTCbqeD4kT0aqpfaMcnAQriMdl9Q4tV1qBurJuQAv77Y7Z27eyhhbrshlkdaH4zInrsXEo2eDzj4vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6875

I'm afraid the serial output doesn't work on any of the Cubietruck
boxes, so I had to unbless all of them (because the arndales are not
suitable builders).

Have already contacted Credativ to further investigate.

Roger.

On Mon, Apr 17, 2023 at 12:29:00PM +0200, Roger Pau Monné wrote:
> On Mon, Apr 17, 2023 at 10:23:59AM +0200, Jan Beulich wrote:
> > On 14.04.2023 12:11, Roger Pau Monné wrote:
> > > We finally had the broken PDU replaced in the osstest colo, and the
> > > armhf boxes are operational again (those are the arndales and the
> > > cubietrucks).
> > > 
> > > I've run some ad-hoc tests on them and they look fine. I plan to bless
> > > them before the end of the day.
> > > 
> > > As usual, keep and eye on any failures that could be caused by the
> > > newly added boxes.
> > 
> > Sadly recent flights look to be reporting them as broken again.
> 
> I've unblessed arndale-bluewater which doesn't seem to reboot properly
> when the reboot is initiated by the OS:
> 
> The system is going down NOW!
> Sent SIGKILL to all processes
> Apr 17 06:59:53.337634 
> Requesting system reboot
> Apr 17 06:59:53.337668 [ 1109.675149] reboot: Reû
> 
> The other boxes seem to be fine.
> 
> Thanks, Roger.
> 

