Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C29BA7CBF87
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 11:34:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618164.961480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsgSQ-0000tC-CU; Tue, 17 Oct 2023 09:33:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618164.961480; Tue, 17 Oct 2023 09:33:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsgSQ-0000qk-9a; Tue, 17 Oct 2023 09:33:46 +0000
Received: by outflank-mailman (input) for mailman id 618164;
 Tue, 17 Oct 2023 09:33:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BgJ9=F7=citrix.com=prvs=6472a2412=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qsgSN-0000px-LK
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 09:33:44 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4089dca7-6cd0-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 11:33:40 +0200 (CEST)
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Oct 2023 05:33:33 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MW4PR03MB6508.namprd03.prod.outlook.com (2603:10b6:303:127::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Tue, 17 Oct
 2023 09:33:30 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::17e3:6cff:b087:fc64]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::17e3:6cff:b087:fc64%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 09:33:30 +0000
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
X-Inumbo-ID: 4089dca7-6cd0-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697535220;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=pTN/D6AtY46V730ixFe5DlTc0NNdYLZ5g/4ay9Yhkx0=;
  b=hwbnBUGY5a7UJmDWJ1Kho2A/8bRzLMbZVHjU3DarDCG2IngfRZTNLPIG
   7wUqQxafDBf8/gZFBt2YogNHgGlLOIHFAc//biq5UOmULo43ESBIZJmUu
   6WBOs/BpuBD56yEa1BXxqDnmviK4poj/N9Xtcg3RVBRSw4c5SQo/nom0U
   c=;
X-CSE-ConnectionGUID: bg+8Nz0rTbm9XHUByAjUfg==
X-CSE-MsgGUID: cs3TQYeQT1uifc9VfJ4Uqg==
X-IronPort-RemoteIP: 104.47.55.100
X-IronPort-MID: 128576457
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:9L9JnqONgtxeYRrvrR10lsFynXyQoLVcMsEvi/4bfWQNrUorgzQFm
 GEeX2yCbvyPNGrwet8gbYm/8RkAuJeBzYNkQAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CQ6jefQAOOkVIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/nrRC9H5qyo42pA5wNmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0ux4QjFo5
 6QCFDoIPyCjusin6bCGROY506zPLOGzVG8ekldJ6GiBSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujCLpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyj827CRwX6kMG4UPLajrcJTsVCq+jUOCRMdBGW1g6WEk0HrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O+Q+5QOEzKbO5ECHD2wAQzxGQNcis9I6Azct0
 zehgNfBFTFp9rqPRhq11rqStyL0BiETIkcLfypCRgwAi/HzrYd2gh/RQ9JLFK+uksazCTz22
 yqNriU1m/MUl8Fj6kmg1VXOgjbpo4eTSAcwv13TRjj8tls/Y5O5bYu171Sd9exHMIuSUliGu
 j4DhtSa6+cNS5qKkURhXdkwIV1g3N7dWBW0vLKlN8BJG+iFk5J7Qb1t3Q==
IronPort-HdrOrdr: A9a23:OnditK2QRP7EFfgbsmDzcAqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-Talos-CUID: 9a23:2tXvX2PykJdJR+5DUiYkpGgGQtoZeHiM/FftCV6RC1tnR+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AtbC8wA7jrFZkor0wQxvFMCjUxoxj+P+SMXEAqKl?=
 =?us-ascii?q?fpsiKPn1ONRXBsS24F9o=3D?=
X-IronPort-AV: E=Sophos;i="6.03,231,1694750400"; 
   d="scan'208";a="128576457"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrP9OUtvpF59T0mS+9jI0s9yxAGf7rsjdUwo1k3s8bptRDOikuIyD16Tqy4vt08vWV14muf0/46cG3vqTT3TvXysPJMV78840bbYDOh0wVFKYkFfREe2bDDN5Sx9/BJpsqxJoKI46o+5J4oDRCmVvL+brEjMSDFxTitscJajrPJiYkwCjHL7pRC1e8bTOamM+RtxtRdlOAUWzNvRPv0VbbvGNhrL6P4o0CmnbwbAXZhv6UodZpvA27EgBGIP8uDj5yO0AjJyciRPEWWNTAD9w9y9023iMF/mqLajtv5Of5fQ4yJhdRdysvuSiue19eoPZrmZxX+jM6UyWu1+G2/cBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUyiJlry2f3+2kRIedj7PLj+jMMn+Wc3WjU6xAos6WQ=;
 b=SHBnV3UAh30VmKR/Zm2bzla3MWXec6f7gOWN+3QzImiWefb8BI9joTejmCKUFHWHY8b6E2tBGrfcVz/A1ltveHDsAHEkO5Mqyx7EiZSLF0jYaAmb5v0W7NhqXi1AB5b+OFCulr3dbga809DTWrfpAxYrab8e12KAeaaP4mcascbvSHpHZT9G3NDn3tFtFVJ/XlgyRHamEYQRWWqv0zZrSzFU4U3ykbFXWBcZIcpLXgSdeNoLTZz7BuQEQKmsFD/MZdB8SUVYCX1ScPspIftR+UZHN1Iudpd9gdjy4awJjo2AlsTYzK+qZMbe0a8jAdX0ptzsFxpu2JkIX6VEy55mOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUyiJlry2f3+2kRIedj7PLj+jMMn+Wc3WjU6xAos6WQ=;
 b=ultiTwyD9BptQ9UmxKv6bOFxNmwe9ifISwimq2rXYBMJPFvQ5e2akt8ZQDT7ZmSykiSY1GIS8aq4mOOE6sXNWzMfjdxEKuZFbfgiqct/vl6wqg+NPyzJyQ/tDsYxMs5hwgBH27NxRaCKFEm/wHJBvvT4IHf3iRlJ1XQ3EMPNK7Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 17 Oct 2023 11:33:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>, Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3] x86/amd: Address AMD erratum #1485
Message-ID: <ZS5U5MF5MuBK4guP@macbook>
References: <20231013153801.188324-1-alejandro.vallejo@cloud.com>
 <ca7a8bad-4d6f-1da4-b48d-7acbb5db401e@suse.com>
 <ac366b7c-497f-4a9e-873d-a961970c4ad8@citrix.com>
 <ZS5QQ8icFa-EQD4H@macbook>
 <3d043b4e-f6b6-1852-94d0-c0cfb5489661@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d043b4e-f6b6-1852-94d0-c0cfb5489661@suse.com>
X-ClientProxiedBy: LO4P265CA0305.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MW4PR03MB6508:EE_
X-MS-Office365-Filtering-Correlation-Id: 21fd87f3-1c9d-4fa6-5690-08dbcef41f5e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XQnC+9+I+JHNWe+1RZt1Dp33Cr5VwVDUZx5vydOKxY5ym4USbRTiNMcWvmMZD95JJkSgcz+79ZEXS5SlTEkgu0QXcU6CD/yiv8rSVnmdq6cfr6BZYhUK/GIF8TiWYSk/e8XFs2dmhFOozS6HnsAW1kxNaYahqUrFun44XZ8B9BxGVu/AYJe8dYs3nOAX5mBRY/ICvBuv3cY39GlcrknY2gcNEUJFkBLNzgBZ4QbgBep7p/ejmpzHXKD7IqO/y3uDweUMGGXahe2kHy8BLbi0DFlH81AQwg86p+XkdxlWzdKqxp4Vdc6FFnIepFn56hJvkbKp02No/bxTSY4ONW4gxzrv81w30M6ERNSBxC9SXEXZttHQeMorWyPWnpBz9E6hlxr5xrT9DwnpWR6mWBxy7BvjNdLjKjPw5hyQZVGU+b/kB3AENcBYhlnS5CuOsXUx7YWh4uK2Gt9gAr8RUvZzMFb11cUebMHDQCZXkI8904F3sqOIEJDGEqnZw+MvPcDSQ1juoF1fJ7uayCt5F9DAay1wa7HicfOZ7WW7m0QR7C4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(366004)(346002)(396003)(39860400002)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(33716001)(9686003)(6506007)(478600001)(53546011)(966005)(6512007)(6486002)(6666004)(86362001)(85182001)(38100700002)(82960400001)(6916009)(2906002)(107886003)(26005)(41300700001)(316002)(54906003)(66556008)(4326008)(8676002)(5660300002)(66476007)(66946007)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWFwUzAxUzNHaTZiZlJVWnFwUWkySXlPZ1lDZkdKWkZPRVMwNlV3MkJwUWJF?=
 =?utf-8?B?N3hNRjNvaE5zYis4Y3lIWjBuNlFQV2V5cDZKYzFwdjRoblRCTTQ2enFHL0pB?=
 =?utf-8?B?ai93YWtlNE9MM1VuUXBpYy9HRTMwandzaG9hY284SjNVSFFCTmcvendZa3FV?=
 =?utf-8?B?Z3BxdnNWUFcraGZnaDE1ZTRrcURBczFpSmhkZW5GdzBMQ0Ezc2ROMW9yVWU1?=
 =?utf-8?B?aVZ5UHhCM25KWnN1TmtocUQxNEdJT1JiWTdIc2NMT012Q3F2TnpZMTI4dHRo?=
 =?utf-8?B?TGRLMmJiOU1vaXZIUXpnSjcxbTFNWmh6YXBCRHZzOHRhZ2NmMmZnSFJBRElL?=
 =?utf-8?B?cGdvU0N3aGVqMitDUzExUllxY2dTbGZ0T2pwSkFFREdtYzdWa1VwZERRcTVC?=
 =?utf-8?B?VERmZ25QdEcxaVBqNElBM1lhUnVvYWcrTlVTSTgwd3dXVXpPb3JjVFVMVzFh?=
 =?utf-8?B?S2RwSnIxRWd4aE1sSXJSNjFXaWx5VWVLWEFIc09OL3BnUjhKOUVoaGlORFNl?=
 =?utf-8?B?N2lMUWhIR2g3bjlsdGduS2VObExYRVJMWEtVdWZteTg5dnpzNE9LdmI2eUZp?=
 =?utf-8?B?dEFweUNGVkVsR3c3eUs5MzB4K3R2MU1sVFovYVFaWjZNZUlEYVhtNmhKSWIw?=
 =?utf-8?B?dzFrcm5YVFIwd3BsM2xnV0Z5SzBZa2U1djRQMVRESWRFZERPUlFkQ1J6andT?=
 =?utf-8?B?SDRZRlEzODRwM2o3eWJONm9PTUtTNHJkakV5dkV0REkwSEdpT0VNTVdMRUhD?=
 =?utf-8?B?R1NQc2o0b2VRQmhRNC8rSEdob3lLVjdhY3JUUjN6TVJHQzZwT2hVRENNdHgw?=
 =?utf-8?B?ZFZiTU9GM09qQmNQUFR1MHV3RVB3d25RZmlvcDM1YmtDOENiSmRKbnVsK3g3?=
 =?utf-8?B?MFJySVhmREVkcngycmtVY01GbDJ5akd5K3EzblVKRU50cldQc3ROSVFwR1pm?=
 =?utf-8?B?SkVXd2FlU2U1SDdFQlNqS1B1b1VUYmtQNXNhMnBGKy9kSWZlbTVkTlExZ2Fo?=
 =?utf-8?B?ZDA1U3VCb1lLdXpYOVViWFpXOVh5VkIvRGhzMHZtajJ1YWlURFEzRmNTM3ZY?=
 =?utf-8?B?RU5WbDZ1c2c4OHo0bnBTR0dYNG9KU2kxZW9KVW9tOGcveWRSNWYzNldsanRm?=
 =?utf-8?B?NHZJRWFMK3dJbFkyeG9lQWl3UU5VR0taUGhtMVR0dFBEalJldTFxRk5wWisx?=
 =?utf-8?B?LzNCNGUyNEFBMnI2dXRVU3hKM0s1TGxnUWwyL1NPREhSazE5U3B1a3g5SUFm?=
 =?utf-8?B?OGFydkMzUU82c1gvZ0tVTGl6UjUwTlVFOVlKT0svK3ZSUURMS29ybUxFWEhx?=
 =?utf-8?B?NTlYbWZvTmExbzdJbXUwbUxsaGVsUmlOQXdHRG1UdmE5dFU3OGVXNlZqWU1s?=
 =?utf-8?B?bWsvZ2FsNGcwWHRxZXBMMk5MZXpwWU5ZL3BaRDVhNEE2b0JSYnpDb0xLUHJC?=
 =?utf-8?B?SC9IQi9wQ2oreXhPMzNJQ3ZzOTdBYTAwbjJyN3ZsV0hDWVRCemE2clhVRFUv?=
 =?utf-8?B?YkVNT2xDOUVMbllXbFlUZURBU0ZvU0h6bytCektOMWxGTllaT0lmaVJaRWox?=
 =?utf-8?B?aWUzVEJOVDdRRjJVRm1lTXg4bnpCeUFBMDBENU5FWGxPbldndjdlMStLUVFm?=
 =?utf-8?B?VUVFVC9YQW0xZkNTQThLcUxIV0ZzWmoxOWpWbUJPTTlKSHNoaGtOZXpiVVdu?=
 =?utf-8?B?UStFYkM4dGpZVXlxZVRLQkdpOWY3UmJmL01mNVR2emM4WWYzQVlGNCtBdlpZ?=
 =?utf-8?B?MmNtcm16ZXAzQURUMUdoaVduTlZLRXBzcGF5T2FHTVhpV2xOY1lUT1VKQzRR?=
 =?utf-8?B?bnBkcmNKYVhIZkprMG9tYTJiNGx4cnFqQ2swVzRsK0prK0tQcWNDU3lJWWZZ?=
 =?utf-8?B?Zno2WVd1aHpCcXdkNURMd1lKT1FLU0Q1MlVGTTZhbEJaSUpFRC80TFY1RXdy?=
 =?utf-8?B?Zy9GMU5zOElmMlRzVVoxdEJOQWpLSk5XNmlpN1d1K1BIelpBMzkvMlQ5K1lD?=
 =?utf-8?B?VktzSGo3Ynl2M3JhRm4yLzNod3BlUmpST05yVjg4RUROZ0NpTzl2MU02b0E5?=
 =?utf-8?B?YkZlWEwzOFBWWnlsR3ZtUlpweGJzR21YQVUzQzRvWmNlcXhpSWRYZ294TDgx?=
 =?utf-8?B?aGUvaHhTYkIwZi8rUEtjdDU0aWxtQXBxaDh5VVR0cnVDSDduTFZudFh5Q2tS?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/6+yJhQfxmm+bwonrruE1pLIPcVTeUL4m9AsUsEYMqQd0GdefdJjvM0Y8Po9VCbi3D2m0slEYrcpcsgwGevH2enE1ngE4g75BBHZ5YxIvE1x4sElKf1EXSUce6cc5Izo/MWO5LK60IoUu7d7D1eXt5qQ1Jjv+qBVG8ToBvzAF+0PC7qcJLeE5K5aLzBKoRGmNVJPGVUeDdAdREWCiRaTDMJERG/4Jw2mM9xczRzfhxrz1RsKdk6FWm3QqA9BkJwRhiMH/GjUThqSunS+VKnVu8gzF7sXg2LKELVuymL+MiszuuBDhmAgYW4L9vlIt2UThnOv/zSTnaX4Po/741WbrwtprwphdmE6NX7bzuhNMdk6r8xTl53nLQhveekRTW2rCWAgF14CzoZTscUGpvJTXhLiSsBBwPvv61KOCeD7ZwzhOSJVe5cC4ltDEjJweZZgdyPOP6CpHQtoZZFSuib9YE6HEwJS5i83zKVU7gwxkoPY2mxSckQwXN7nPGB9gbz7H9x+ZE550z7Jrdy7sARyexStoO26Uba17bY0mJGPrfHa6KVbItS5S7l0CwhMhbzavVT5+3zLl7YOLZmUm7jrB8kZXmWZGN3g9+NNOh58GFvfJvR9Gf4c7G5Rj9yJpou0JhueO/2cANcGH5iw/m7EUo6uUCbhJcSZxkOejTM3QOsMlBau2f9IYHH95mFgF2RnAOaVKYXBQCJLTOLbKgBjT3uGGI6YEIiV60lWkmA9oW5BVgu8Yze2lYqTah8vWd3WXWCBIGkUs87+X1WW7QDn5bAyblCMEOfrCmTLyd4RMERMfnjiW9rBCXIdOXoro19vm2CMGJrQTPrdzIicaRf4IkMmciYoxnouXaQTZkWJVFKOOLzQLX+crf32xHa1f6dm
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21fd87f3-1c9d-4fa6-5690-08dbcef41f5e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 09:33:29.9192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eo93gpO9FDBPOv7mxZg98+nZgVQEvo9ZHSDUzNHsoimVaZtDeuYNNvYITJn775AOMXln9pVV/elMASWEsvifPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6508

On Tue, Oct 17, 2023 at 11:21:47AM +0200, Jan Beulich wrote:
> On 17.10.2023 11:13, Roger Pau Monné wrote:
> > On Tue, Oct 17, 2023 at 08:50:45AM +0100, Andrew Cooper wrote:
> >> On 17/10/2023 8:44 am, Jan Beulich wrote:
> >>> On 13.10.2023 17:38, Alejandro Vallejo wrote:
> >>>> Fix adapted off Linux's mailing list:
> >>>>   https://lore.kernel.org/lkml/D99589F4-BC5D-430B-87B2-72C20370CF57@exactcode.com/T/#u
> >>> Why reference the bug report when there's a proper commit (f454b18e07f5) now?
> >>> Plus in any event a short summary of the erratum would help if put right here
> >>> (without needing to look up any documents or follow any links).
> >>
> >> That is not public information yet.  The erratum number alone is the
> >> best we can do at this juncture.
> >>>> --- a/xen/arch/x86/cpu/amd.c
> >>>> +++ b/xen/arch/x86/cpu/amd.c
> >>>> @@ -1004,6 +1004,28 @@ static void cf_check zen2_disable_c6(void *arg)
> >>>>  	wrmsrl(MSR_AMD_CSTATE_CFG, val & mask);
> >>>>  }
> >>>>  
> >>>> +static void amd_check_erratum_1485(void)
> >>>> +{
> >>>> +	uint64_t val, chickenbit = (1 << 5);
> >>> Linux gives the bit a name. Any reason you don't?
> >>
> >> There are multiple different names depending on where you look, and none
> >> are particularly relevant here.
> > 
> > Could we make chickenbit const static?
> > 
> > I would also use ULL just to be on the safe side, because we then copy
> > this for a different bit and it explodes.
> 
> I guess the way it is resembles what we already have in amd_check_zenbleed().
> Also it's not clear to me why besides "const" you also ask for "static".

Yes, makes no sense to put in .rodata, sorry, just const.

Roger.

