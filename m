Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 726726E2076
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 12:13:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521088.809385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnGPi-0004dq-28; Fri, 14 Apr 2023 10:12:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521088.809385; Fri, 14 Apr 2023 10:12:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnGPh-0004bY-VH; Fri, 14 Apr 2023 10:12:17 +0000
Received: by outflank-mailman (input) for mailman id 521088;
 Fri, 14 Apr 2023 10:12:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ClDU=AF=citrix.com=prvs=4618bebc7=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pnGPg-0004bS-1I
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 10:12:16 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d17f5c1b-daac-11ed-8611-37d641c3527e;
 Fri, 14 Apr 2023 12:12:13 +0200 (CEST)
Received: from mail-dm6nam04lp2043.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Apr 2023 06:11:16 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM4PR03MB6016.namprd03.prod.outlook.com (2603:10b6:5:38b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 10:11:14 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::bb8d:7344:7172:6ee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::bb8d:7344:7172:6ee%3]) with mapi id 15.20.6277.038; Fri, 14 Apr 2023
 10:11:13 +0000
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
X-Inumbo-ID: d17f5c1b-daac-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681467133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PFzL6PE3tO1+kG4mMgi3nA4szToEfZC1w+ZwpnUL/M8=;
  b=M+GyGvr4b/lahC4qGVh7+NhPmfNxsdCdS4X3HMw5rlnOK1Lkw4NdO6xu
   UGOVqRkunntDd8bSSBRUOd5X1fe+k4XstXqKuHkpQ7OUgP/ScpvWqOatS
   8Npz0jX8oKvan/5qCx8W7M9T6m2iEgTDvhpzER1f0wJ3LP6qOU2l7yt4P
   Q=;
X-IronPort-RemoteIP: 104.47.73.43
X-IronPort-MID: 105910295
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:G8vb4aMGxV6OetjvrR2klsFynXyQoLVcMsEvi/4bfWQNrUp01zcBz
 TYdXWjXMviKa2uheNkgOoi08x9Su8fQnNZnHQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvPrRC9H5qyo42tE5wBmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vZRHiZWq
 vE1FD4ITxDTpOK/3LPja+Y506zPLOGzVG8ekldJ6GmFSNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vFxvzO7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqi/937eVzH6TtIQ6T5OWytFI0H6v1mEvFTYqdVW+sN6DsxvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxO4QfZjtIadhjuMpoQzUvj
 gONh4mxWWcpt6CJQ3WA8LvStSm1JSUeMW4FY2kDUBcB5N7g5oo0i3ojU+peLUJ8tfWtcRmY/
 txAhHlu71nPpabnD5mGwG0=
IronPort-HdrOrdr: A9a23:cMdDRai5a5e7VIBUSy6ubG1Bv3BQX2V13DAbv31ZSRFFG/FwyP
 rPoB1L737JYWgqNk3IwerwQpVoMkmsiKKdgLNhd4tKMzOWwFdAQLsSiLcKzgeKJ8SczJ8R6U
 4DSdkENDSYNzET56uXj3jaYrQdKbG8geeVbIzlvhBQpHRRGthdBnBCe2Cm+yNNNW17LKt8Ob
 +kovBMrz2mdXl/VLXjOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPsf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFctcsvy5zX4ISdOUmRYXee
 r30lQd1gNImjHsl1SO0FrQMs/boXMTAjHZuBulaDDY0LDErXoBerV8bMRiA13kAgMbza9B+b
 MO0GSDu5VNCxTc2Cz7+tjTThlv0lG5uHw4jIco/jViuKYlGchsRLYkjTVoOYZFGDi/5JEsEe
 FoAs2Z7PFKcUmCZ3ScumV02tSjUnk6Ax/DGyE5y4eo+ikTmGo8w1oTxcQZkHtF/JUhS4Nc7+
 CBNqhzjrlBQsIfcKo4DuYcRsm8DHDLXHv3QSqvCEWiELtCN2PGqpbx7rlw7Oa2eIYQxJ93g5
 jFWEMwjx9HR6qjYvf+rqGjMiq9NVlVcQ6duf22vaIJy4EUbICbQRG+dA==
X-Talos-CUID: =?us-ascii?q?9a23=3AWoxKjmhg+iAhTCpKrGp/B7TGOTJuYlvCi2+PLmK?=
 =?us-ascii?q?EB2NISO22SVaM+ftFnJ87?=
X-Talos-MUID: 9a23:RrXPbgvXWFIIAH+yNM2n3x9MCOhKs4eSGE0xjL46m8eBJAtKAmLI
X-IronPort-AV: E=Sophos;i="5.99,195,1677560400"; 
   d="scan'208";a="105910295"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CYBc2yf3qLsbeRFSjIXzZL5drvCdX5zf5eCMoBx/ZmcVFwi/ZwR2sWU7UzzgOdPRzYWanJQDU98FUMEtYpPd2zW5eTUd1ruYGmRVDxc88CxVhhy+/0PEkOnJIpf+I2v03E8KfubsLfJ7FMPgpdTpF/TYIcz3N6Zuorlll6fDbJD8NvOfW0EZ7KsAXuVFXKwvjQ72oSORY7YRSB6mZ7Bks4/8I9ToRRy0u+YdBeln2exOdxVqjrdmTvbBBGzdScdN3PZVRNv+kkXLmnkmRrDNQsIT4puZWQ/PqNuSAWJzJJdhU+r1ybCAVNnV3zJu/hQ3QvkOeJc4PNOLEOabjL++1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFzL6PE3tO1+kG4mMgi3nA4szToEfZC1w+ZwpnUL/M8=;
 b=Rvpv1aWSs4louvQAmCXKE6gAZfauPHvo7r9dW/kYjjmWWI3ep4m9ZfAFxuaSH/qSgEcq2/3ma5Cvi61FxodSHgbmbzRfWpJL+dogGCSKMX2ZPxdYNZlyo+zg2Ead8wGt4fUemGmvEoFib/aXsrjEG2SdPcos6DWwjQAhIuYoU1vP4AiDV4j0/DUrvffVNmxBqL7gbrWRwsSwxLem7cOztGnjyibU4soCHRpYcELH6eXrZTjNoTW4ntOfzsCGYQpoj2G+CkPmaon3mzCRlFk8MW/cblaw5CKAkW2Kq8gY7DHaLUsOqv/BCuUpCzfDuhWU8mLlxqqwkKM7SMqO/+NEew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFzL6PE3tO1+kG4mMgi3nA4szToEfZC1w+ZwpnUL/M8=;
 b=gVnzKdamybghucgIsk/kzjMJ3gtl5m5XVubf+lW1Bb2wdVWj6+2Z3KgTYxA2EVES50qxxODEd72sjrL0DWTORgVQZqdDz72uBzvv3Uupluq4HDYNHVQEIEgCaQqTBa2wtGlcizqEChYdaIU+01IqufpsSSZOiMtNGPl4gPZjygc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 14 Apr 2023 12:11:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>
Subject: HEADS UP: re-adding the armhf boxes to osstest
Message-ID: <ZDkmu0mgy23ypaL7@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-ClientProxiedBy: LO4P265CA0078.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::7) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM4PR03MB6016:EE_
X-MS-Office365-Filtering-Correlation-Id: cef0a9ef-0637-41f6-3ac2-08db3cd093a2
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aQ86P+FbCCghPJS6gVwaoLIv5fLm+Fa+1b5lnxY9gvF1RkFi4/hZg9sx51Nv38DPQz0lf1lPH/wv+k7trAUc/Ha+GVUGOrB4Dk1u511AQNnwz+L3mnjaI6RVdKhPd1hh+9hN2NvqvTzhBZpZrjUgk99WAaCXRoz3ic8cHNBabE+IGDc+E6JFHEsoWySkJxSLIt+GGIU1rP+p/4xFfl2WK6X77D7PtmtvWRqClvo2JKpB+brniYjjhe14a+nr7kyz2PmFFmtXaa0gIXQf4inpGnEOmTcKd/Danefg2+YCPGKS78WODFbNuD9zzUcbT1+GunyLf1jnDaTiEFZa8INkjbatSHgLlwMk2H7lIzwNLlGoMeW/wmFc0EAGb90hjfzHwD1lsVq7FpMhml6sRqj4zsoj+lFnsG5uu0mk8Gl0V8MmHMOHWh1YmevNORoJe2IEdWGfoK0xXrOrYmN6vR45+UpZfLXMqI3EUSssEAQUdwYXKEI2GJ5odBwitCcDAissNf+GaV96qqA0rJ8s69i+kMIVzIsjGqfz+V0jeu7XeCbVPWVlhDgqWN3emHOh/xTL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(396003)(346002)(39860400002)(136003)(366004)(376002)(451199021)(6666004)(6486002)(4744005)(6916009)(66476007)(66556008)(85182001)(66946007)(4326008)(2906002)(33716001)(86362001)(38100700002)(41300700001)(82960400001)(5660300002)(8936002)(8676002)(316002)(478600001)(9686003)(6512007)(6506007)(26005)(107886003)(186003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjBFNnB1aitxalB3SFAySjFaTUYxSzhWUHRVZTkwdFZIQVh1cWhNUXJ2dFFa?=
 =?utf-8?B?VDR4RGZqRkFEbmk0REFVRi91Zk0wY0xkYURrVlNmNWl5R1F6RU5DeHRiZERH?=
 =?utf-8?B?NXVVbmxRTzNHdTFld0cxb0cwWnl6dTZVOUhhZDh3U3drYXI4Y25QelJhdEtZ?=
 =?utf-8?B?WnVJSFRmcjhHOEZwWEI5bDAwMGVvWnBkTzVmYWtGZERaaGoyVnZqMDAwOFVM?=
 =?utf-8?B?dXdPV1ZCWW9OOVc4RUpLYlV2WlhxMjE0eXoreWJRekFpMHRuWWozcTYwcWY4?=
 =?utf-8?B?M2xWbXRxaWt2YVZ6MEdrR3drdCsrdDhKL2hUb1p5YUJyY05hTzlkRE8rd2Ew?=
 =?utf-8?B?cnhrcVZ6VmJuSVJnai9HSVNVYWFUVkNCczlYZ0tlei9Pekx3SThiV1l2ZHAy?=
 =?utf-8?B?MGFIblNDN1hCTDN3Q0JvaDZ3TDZSM0cxalVrWXBLVENpMGxiK3ptR2xmVzNs?=
 =?utf-8?B?c1VnVGJLeEtsdzR0T3JzRHNzVGNHYWZGNEEvR3ZkNk9pNjJ3M1JVSFZibzBo?=
 =?utf-8?B?a3JPd0xFZFM5YnIwU0dtRTFmWjNsQXdCaWcxcWExQTFVWDVaY3BnVU5aS29I?=
 =?utf-8?B?cUJCVjRtdmpCeUFyL2o3bGJGamtZNTEwTi9hSmtnOVhJdStwMFdFa3VuMjNF?=
 =?utf-8?B?a0t4VkxNR1pHMFVHQTlLREVMWGF5cnhEamdsdlp1a3RtUU90VzhPeEU1aGFU?=
 =?utf-8?B?ZHlEbEhVbEt0dm90TWZEKzNlZGt0azRCUm0zWWdJRDZLN3FOYWFBcXpES1hh?=
 =?utf-8?B?UjFqZWhjNEREQjdnakhZd09YUE44TnF3b3pOMDA2WEtNdjNsNk4zQU9lOFdh?=
 =?utf-8?B?cnUyQzBHanM3STlRSllhQlhIMWpFWFN1ditNTzl4MnZDTnVhMmtXdGJxdmls?=
 =?utf-8?B?eGdXQ044TldnN3hzMCtKUTF2MldCZHdWVzFTOG92RzVoZTZtc3lLSFoyUDgv?=
 =?utf-8?B?c1BHTktrbm51dGZ0MnI2SjBOaHVxSC9BVmZmK3AwTFB4Vmh0Ym9KK08yTFRI?=
 =?utf-8?B?bDZXMnRYb29EU3VYWFhQeWFGbmkrODdwQlVGT3Q0K3YrN2w3c1RPVFhGNUp4?=
 =?utf-8?B?Vlk5cGpjU2Y3VHZtOG9GOVFkUThQWEc0V2JxTFdCV1dvWWFWcDVQMFBTcHJF?=
 =?utf-8?B?UU1KWU9NUStybS9LNXlGRURJSzBSczQ0cHZySjF2WWw5Uk1haWZwWE9hZG9C?=
 =?utf-8?B?bkEyOWw0cjZvaytVelI0bTFtT2ZzOEZTbWhkcW5IQndZVjJlTzFWNlVPMVps?=
 =?utf-8?B?NDk0YlFYcWI3Tk1MSU41SFlSUStNcW1GVDBoV0FkdVJ5RHk5by9XcVlJUUlN?=
 =?utf-8?B?bitXSFZLT0Jrd3ZlbkdPbEhScVRkcXczalJHMkgzRlZnd1Q4cllPbDUxWW8v?=
 =?utf-8?B?KzNKMlRZd1pTelBUNDhLdG9lbjRpeHhqekVIcFIxYlpKWFZHS1hod05ydVZV?=
 =?utf-8?B?Y21BR3VZSXBaVHZSV0JRRTk2Nm1pd2s3d2lvVXFjVy8vS1N3cjZjaEpuSFZF?=
 =?utf-8?B?dUxUc1ZlRHpydHRwNnd3aGJoMGdmczdUY1hWeUJUUkw3c1Z4bVNJOEVMZXZ3?=
 =?utf-8?B?dWZTK3BKUS95VXdxTE5vNG9YeWN1Nmp2LzJqUG9aVkp3R0pVYmJOeGRtVUE0?=
 =?utf-8?B?cFpLUVc5SlZUK09OcjhFaTlORXRRQ3ZySERCY2NsT3VnUWJSaEZES3lFbThU?=
 =?utf-8?B?MzBlTmQvQzZlWUN6cHRJemVyT1pBK0FWYnlGdndQR2JJa2tvZytrTGNRWDJv?=
 =?utf-8?B?MGZiTFppTVYrUGtTanZEeGtxRVIvSWJ2aEpRcEQ3MFJWSHJpQjRBZnh2Z1Jk?=
 =?utf-8?B?V05GNVhRSVY0bi8zSTBXNmhySEtUR1dHa1E0ZHRxMElSSFpBTFBMZEh6bElw?=
 =?utf-8?B?cGthcDdiZVZSbmNYci9LTjVLcVIwQU9mZWhlYkQvcW9KcHdCK3UwOG9mSUly?=
 =?utf-8?B?MElXa0MrTHRDM2JYOHEvYjlhUEFCOXZZR1ExQk1iM0FBL0luSStmclBTOEpE?=
 =?utf-8?B?aE8rakR5ZWUrWkxlKy90aFJqSndPUzQ2Z0VLWXkzd1I0SVJGRzVDcVJtNkds?=
 =?utf-8?B?RThQeGpOWlBiTnZWRXNFSGVYeFkxWndqbmNQLzZWMFR4Rmtlc2M4V0s1M2Zl?=
 =?utf-8?Q?4Llk46QVnDBpceISOzdZNc6If?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fa+ib7boHG9ZCXXBmlkJRPeA6G6nETkNDnHNNUsrYPaY4MY8/3sA/Eq1Yg0Hte6a7kuLQrBR1uy+Nstyg6djs7I/VD2uSbed/COlvPDI4xFE9YMkJwIVPxAgEJD8LRFRgIT+bKiNK452wYDXlWMJ+kxWqDL/RgIxYqInCI6ThoHC23Tqmj9B3lAXXFp2Qr0reFQm77AXcrdoMtl7qgUKO0Su1iZdXPge2qKWS8NPfS4fkvHJ7/aKQjORiHNIbx0OYtelj/9QauQurJlwcb6F2rb+N8K04FlRiIiNs4DOjJmviDFQu+kprCibrcDJeKhLN4ajjDBUX2d3dIACu/XYWc6D5uVok1kASXL5JYvelE1+64ILavo9FWTyQrot7wT63gnA/LtKDWWt+aIffIxnmB+QRgGhLARFkj4eVwJXillI55BfA9FoCkDLldUAafQ1mIS84VUDAvYgypiZ5jeocB+LPGEKWPlN0/dDbeyxhDI1IARWx54rw1irIlHMQzLvisEFttJjmP9CgwvXTv6p2BKaZKpg6xJAfSrrXZ2TrefbCqObnRuIuFS9FpS20+z/xWza62XIp5sqQtPPJSCmTAtyojHZwL1aBvpDw8Oi+XO97E63VPZ10O403UxWn0nsLKcE92k4SxlAhB55UN3/Dsjd0yC5JXoCOovfK04wsFIirvMKJbLkg75yvy2QPFzu5aVbQvcmMzQU+iAVXvukLeAZTSSrsBGz8E4SD7pQPHxG4BnA+BjpjOS/RFFwdYe4kDdkoj62tTpRlwEGrYsFlQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cef0a9ef-0637-41f6-3ac2-08db3cd093a2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 10:11:13.2042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1yFHiG6UAsedNJmCX8IBSYQJi4nS6cee7EPaY8oNJxz/FCPYsKkmkjrQALXk8gjBYMigCu3B9cVbYw2CQ2AhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6016

Hello,

We finally had the broken PDU replaced in the osstest colo, and the
armhf boxes are operational again (those are the arndales and the
cubietrucks).

I've run some ad-hoc tests on them and they look fine. I plan to bless
them before the end of the day.

As usual, keep and eye on any failures that could be caused by the
newly added boxes.

Regards, Roger.

