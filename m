Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3066D4C36
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 17:43:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517527.802982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjMKg-0001jp-1M; Mon, 03 Apr 2023 15:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517527.802982; Mon, 03 Apr 2023 15:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjMKf-0001hC-U9; Mon, 03 Apr 2023 15:42:57 +0000
Received: by outflank-mailman (input) for mailman id 517527;
 Mon, 03 Apr 2023 15:42:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W/KQ=72=citrix.com=prvs=450b71a79=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pjMKe-0001h4-NC
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 15:42:56 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 324d790a-d236-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 17:42:55 +0200 (CEST)
Received: from mail-co1nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Apr 2023 11:42:51 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA1PR03MB6451.namprd03.prod.outlook.com (2603:10b6:806:1c2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.30; Mon, 3 Apr
 2023 15:42:49 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6254.026; Mon, 3 Apr 2023
 15:42:48 +0000
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
X-Inumbo-ID: 324d790a-d236-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680536575;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=cChx0o5A6ihLKB0t4My2IL0j6fZQVRc+OjMz0/qhwpw=;
  b=JeMOsYKwn9K0ausFtgKOGnCXYicNJHPEIXmzMsQJNAfWJMcnCurpsFqY
   1isuyFtt6yU+biNEvunTynwTUmNQ/TICl4Gl9E+H1vjc1qsCe62+8yaAp
   8gT/V1g5iBNdTIcfHk8My4qw3IWHabkgXsQppDzLhVF+JJ+BFCS7+KaJ3
   c=;
X-IronPort-RemoteIP: 104.47.56.173
X-IronPort-MID: 104555926
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:9F6dDqOe06JvaVzvrR2DlsFynXyQoLVcMsEvi/4bfWQNrUoihTQGn
 DQcWDzVPv/fazTzKtFya962phxQ6J/czoMwGQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tE5gdmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rh5JTFr1
 sY1ExJOXimBrfyY2pefa+Y506zPLOGzVG8ekldJ6GiASN0BGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PRxujeIpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyrw27KSzHmlMG4UPIPh0fVP2kyW/Go4KE0Nf0qBn9v6r0HrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/I+wBGAzOzT+QnxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+pQSiaPCEUKSoJYnYCRA5cut37+ths1VTIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRPuZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:bxvKQqpWeu/ob/KOw+k0SfQaV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-IronPort-AV: E=Sophos;i="5.98,315,1673931600"; 
   d="scan'208";a="104555926"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJQQkdjP0C6CNvu1vXY5tc9Prfzh1TH2o33xtHDOrhsaaBajTxU5F82wsMJVu//yVJClo7njpoo1S2/UwFe8bqYxANvmIJAoOJkcWzPF4jU78YOs32Ew7pDGtCLiSj4GxyFFZJ56MpjbvLeBicPF6TL/pxz5HHKPLAOHLRdM0m7JD96lHrRiLQHpwruNLJJHx2jHp55+OY1ysHFA/94PFAzd5AjYFqlrq+bnKLHqNv2Mj3JITydirMstJp/kBydUZUQJLGnYtTYKuf0pPyt2K4qyC58t2RuHVEK6d0DNwxLBqEFvrlWqSQj/0ZPo3P4sa6OIPANl2jVrCw5z1xl5Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFq82okmVOxlJdIrhlenhySNz73COmJ8btmugVasD6Q=;
 b=QiTbQtcQ8uILdiIkU7DgC71hPhl8skOam18jXFneve6EYA9+cbQeCbXfnW+GOJFcbi/Seb0CbGQezxFDJXDVCnTecECxbM1adyPg2bsgRb1aowQrExCDs7jonbPygeYK4ZbAD1mExvcS0DHiSMZQiH5o9yay49d7NALZ066AIOkbOrRChIKN9o12fSawRfqffi8j428bX8AHbsjf2hBRzwm6VeFCNYUf7ZN0hLBcZ5Xi62O2NtDg5alsImWO3dl5XrQCLA/BnFzFWvEk+ZuvF1C7cgaSXsJj+nAE4AvqyJQNudBxZDnYXyDeG68fhqBTNJSBlZdsmeQlTSjroVB2AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFq82okmVOxlJdIrhlenhySNz73COmJ8btmugVasD6Q=;
 b=ZSs4yxRWK6gauK0Dqq+7WX2gLMBEj1fN5J4kUcpKdUQ4qPfjJUsPcp4b6jIjkFUre2K5f4mdaR8YVMXG21d0qLJqwg8/FWnIJXUWtI7pSS09pYfDhPQC664NpemTpRSDnFRUu9KchkfDCJmJ2cZK3czluvcb9GlDYEEL/z50ndI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 3 Apr 2023 17:42:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH] x86/p2m-pt: do type recalculations with p2m read lock
Message-ID: <ZCrz8kDM6EB8t0Le@Air-de-Roger>
References: <20230403101449.93323-1-roger.pau@citrix.com>
 <8d976d34-8a1e-95ad-3bc9-3cb704c1fae7@suse.com>
 <ZCriYs9y6JU1gat9@Air-de-Roger>
 <5fc00c1a-11ea-905e-49eb-d70caaf71041@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5fc00c1a-11ea-905e-49eb-d70caaf71041@suse.com>
X-ClientProxiedBy: LO2P265CA0207.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::27) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA1PR03MB6451:EE_
X-MS-Office365-Filtering-Correlation-Id: e22b7550-ec20-4828-d277-08db345a13c3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KxxinPzUXSqjEuC76OGZL6FAFFvaBFMpu6qvp20IK5pyPUbdzZ5/UWXsZYhOjutGqSvtuJZLtisIZ1RtLXuQ2psY+Ee5iwaeukG3dtpAVEuMEfh8kdhFmJKna+uQ0xw/9DldsHO09lYnVEDZmBy+5elRFm0MFOQVkrgSTI+9iBz+k4MoK1dI1moWNr9zDSIbuih38T30+4pLxk81Bue6KB3cbtuiBSyvIV/5wP5YOaxFdCeKIsTR2MvFK1AT662sqayV5WyKLWi3pNK35O1EZv/vKYf2jnmv7IRfm2XQGUJ7DKEogRSzbJEKddnP3dVZR5gGt/6wcp+AtFVs3BjJTTm9A4JsaIO93lSx/8fuis1xY2JZHyieS/EP/5BEcezOH5xJ0dvUFmgKyxu9T2Cox7ZXJMLE5djAjpn3dmQg2Y3BvnTwthZ2uV/EO3eKofuAIlqIJOp6gkg6VD2TBrq1s+xaoW9psy5aLxYSVcpvdsTS59RjWYcCyJYbYulqktlEd+PL80BGl2los0BKua2eQahJ7fMLZVe/L0x2PeDqmBXPmXyMxRo0TJVHJ9RiR4iV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(451199021)(41300700001)(4326008)(8936002)(6916009)(33716001)(82960400001)(26005)(316002)(5660300002)(86362001)(38100700002)(54906003)(66946007)(66476007)(8676002)(66556008)(478600001)(2906002)(83380400001)(6486002)(186003)(6666004)(6506007)(9686003)(6512007)(53546011)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGNUNjVmZTRsM091d0VzdENuRjFWaWhCejBxOHZhSExVeTFMUDcyR3NQakFw?=
 =?utf-8?B?WUhldVVkZCtLaEFSRGg0WEwxd0VVQnE2cTF1dWxIODRsN1FNQTV1S3FpdEJR?=
 =?utf-8?B?THQrVzlBaU5IVXNyS3BsUkZ0MUw2Tk81WFU4Uys4cERWS2xFOUc4V3VwSGty?=
 =?utf-8?B?WDI0VW0yb2FBZ2RDNUc0K2dBVzdrRVdZc0RiUGhYS29RT01GVURQUTc2UEZR?=
 =?utf-8?B?UXc4RHcraTVIelJJOVR0NGdKL04xMUEybzZiT1NZc1NaRUV5ZjBhV3JjbnZW?=
 =?utf-8?B?MWpiWUFuVWE1VCtiRlhwQXkwNmdiS3pDZXhjLzA2d2NMcjhFY1p4MXFGYmFQ?=
 =?utf-8?B?OUZjZlpsUFhZUUpwUUlHeGNBeHdhTkFwc2RYdVFLVFQrd2dPeUZnai8yNzRx?=
 =?utf-8?B?K2RJVWJzNmtoT3NBSk5hZnpGYWVjZWhiZzB2K3QyMFF4N1RLUFh0SGpERTY2?=
 =?utf-8?B?bnl0MFNrbVgweURTa2Z6WkVZNE9yYzEyeTI5NERZRFJlcUo2RldFN3I5K1lk?=
 =?utf-8?B?V09ZK3FETkttVDl4bDg0NjZjeWhGSURrb1dmNkF3d2tESGVadTRDTVpEck1H?=
 =?utf-8?B?M2dKOTlpOXM2QzZOSTN3ZXowY2t6TVVqVVJGYkZML2MwOGhiWnhDandrSXFS?=
 =?utf-8?B?YUlSUzZ3WG5sb0Q0aGROQzJyN3cxM1FyMnZJRGZMV1FKOFRrWnhlNTZUVmxB?=
 =?utf-8?B?SWQ1QzBTbzczVHE2RmgzSXZSbGdGVjhpd1R5NDlGRCs3ODRxRjlpVHhkZU5n?=
 =?utf-8?B?TnBRQ2k3dU9JcHl0SmdmejdQKzMrcHVLVlA2YUNyMzV4YnNDWWRMOVUrTXYr?=
 =?utf-8?B?cTVYWjBTR0RKZzNqYXptV1IxN2lFK0pnYXlpelozeE1FamRDVmx4NG8zRmZ2?=
 =?utf-8?B?amNBWWhuZWt4amR6OUlGTTJHQXJqZ3NLQURNSVh2K2tGUGhvQXZ3MldodEc2?=
 =?utf-8?B?QnZ0Vk1EeGtneHpzR1dOYVJZb3BhdkkwamRpd2hleFJnYU1sOW9qRE5sSEpQ?=
 =?utf-8?B?T3NGZzJ4aE4xM1o1Qlp4QWdET2hxLytQRUI3UFdkZWpTRk8yR3RDQVZ1aVRk?=
 =?utf-8?B?SE9HYlZ1NXFlN2VhL0p1OGRCb20wUC9DTkFzMnVwNGl1cHJHZkhoYVdsUDdJ?=
 =?utf-8?B?QTJJYUJHWndGbGUzdmVTOGlFdnp6dEoybFN4NmdlUzRWZlA2ZEZwS21xOWlU?=
 =?utf-8?B?SHpLM25EL0xHOG9tQ0dYU1dRS2Znd1Z2WmFaRDZlNkFQbVE5aVR6dHJrN3Iw?=
 =?utf-8?B?ZXZ1dWtaVFIyS2NmeThEc0FEd25OLzRLSzlzQ1o5VGpjelJ2MkcyTzB2ZTZO?=
 =?utf-8?B?WnBFNDRHeUM1bzAxNWE3T2V0Q05oZWNHS1UxVU4yMW54ekkvaTZncUMyVWcz?=
 =?utf-8?B?TFhzRkwraGF4WXZhZFByRXFzRXk2cHVFMHhDV3JLM3NTeVFUQTVvOVp4Wm9q?=
 =?utf-8?B?WS9xMldIa2JIWnNVMDFGUStPUC9BV2FiVUM5REFJd0VTMkE4REsrV1FwNnRq?=
 =?utf-8?B?VnRXSi9TelZrZVpRcGg2Tk9HRDBuRWpYNlByL1REbUY0cjQ0Zk9EQXdma0Nk?=
 =?utf-8?B?a3RpczZtdWEyS1JWaDFSWEdmWUtlekk0bStTcUxJaDU2aWQyUHdpeTJnd0F1?=
 =?utf-8?B?d1Q0dFdpcllHajdTaVBjMHd3Mnh6R3R0MVBhcDd1ZTdiakoyT1Y3STZQYVl6?=
 =?utf-8?B?TjVCRkh2S2pTMHBOUjhBcnRmZWc0emNtTTFXT09jZGpsa1RNb3ZiZitoSW9j?=
 =?utf-8?B?UmtwZWFDL3lrczJ5NDg4YzI1RFF0R1JqRjJTNkgzL21ma2g4R200eHMyZmxH?=
 =?utf-8?B?VWFLN2xWM2RtWHZpY1V3NXFJZTlXTENiNEZxNE8yZm1OblB6Y0ZsRUJGYU1j?=
 =?utf-8?B?cFlTc25weWVaZklJd0hnZ0cvajRSWmhpUDkzRzc3UlBIUmYydWtydUpnaU1L?=
 =?utf-8?B?UzZhS2NjZWVaSlNwMEUxV1VmV2w4TW15bzNsK21rK1RMOXdITzNSUUx2cG44?=
 =?utf-8?B?eWNONmlmRk02OWJmdGYyS2M2aU9pdmRRZ0hGSncwVGNaN0hXY2VQelBrV3lV?=
 =?utf-8?B?WDNXQ25PTXo0cGEvWGZoOGIyQk5kY1dQY1M2VTQ3SFVnRmFxbUZjQS9DbDVh?=
 =?utf-8?B?RUUxd1pUT1Q5eEszSkVzSzZOci9mVlIzc1NYTnNxemZOdCtqNDVxQlhPQkZG?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OkVL0yPGPTneFK7N0QYEdvgmeRNuVCM5aZJ3AyRHCZpiZZloIvzJzM0QCNHJ2BF1lsSgjoYyWFePpfKFqJkpa9KVzKnuq1RpikHjySyEOQz+t1UFNLg6fDxR6NOcLaB4ZdNyaSGkSbkbIrlmtDTGNFIOLKagGTNjxpTfs2dpjtZGF55qN+mNKM6NxDhWb8LWrwado9+Re535V2J0BDV89ojqx3nWOdFh9220sIvChhq5vbXHSLlbp35BzfsZbX5g5h+FXANO5guOQPUqdhKCPKK0gqAVHpGitO6ZrNpxWF8PAI30gLn5H8oGxzJIKGdM6R3T+NLf9hz/hahL5tthu9ZpBryPUasN0lgwloyVmwpqVdWXEE8jMRgOBwoqr5v85HT/2qNWEozJNoGfbGUrvL8svdFWxmsFNBNjLEiQ7L2SqTa1FjVMX8QYMlNYNq8K0piOIWM+XWozTxDJWw+IQ92d/mhZwMxizJX3mBPXnl6HroJw4hwtxGMSzsOqiHdG+d+uNobi+enqCHyd1A2trSRi3z14tEqK/LYF/8/hXlRl235eZXMPHeulkZ6RANQg1RXkZvdWP8vcVANK9McCePFJEVifs7Xzhqy9LcbEF0rc55ymmljg/AMBlzpZsCy9PTb3fNkNVRTQH6yFB8XdHYfAKNuM78MNxXQVF46gfXXrwf0EO6Z3T0GHAcfUvedziFkSercDxS0/SwOMRn6hdNkQtM+71Gldc8f690qEqfDFucwf9H04gkqRovQ76ET7shjCTkSWxZ9U/IcWzXhOG3LdKIfO1mh1B6InnT+hUZ+cgMDMnktxbMW/4AJjFVzd
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e22b7550-ec20-4828-d277-08db345a13c3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 15:42:48.8089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uRSk4ZxCuQuAGy9bTYrPotnMIvsZCAZztTLkllVaZ64sHvKpZjDtxx37y1TC7/FdbogQj3oJoWH6I7q4q1w4Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6451

On Mon, Apr 03, 2023 at 05:30:37PM +0200, Jan Beulich wrote:
> On 03.04.2023 16:27, Roger Pau Monné wrote:
> > On Mon, Apr 03, 2023 at 02:39:08PM +0200, Jan Beulich wrote:
> >> On 03.04.2023 12:14, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/mm/p2m-pt.c
> >>> +++ b/xen/arch/x86/mm/p2m-pt.c
> >>> @@ -486,9 +486,6 @@ static int cf_check do_recalc(struct p2m_domain *p2m, unsigned long gfn)
> >>>          p2m_type_t ot, nt;
> >>>          unsigned long mask = ~0UL << (level * PAGETABLE_ORDER);
> >>>  
> >>> -        if ( !valid_recalc(l1, e) )
> >>> -            P2M_DEBUG("bogus recalc leaf at d%d:%lx:%u\n",
> >>> -                      p2m->domain->domain_id, gfn, level);
> >>>          ot = p2m_flags_to_type(l1e_get_flags(e));
> >>>          nt = p2m_recalc_type_range(true, ot, p2m, gfn & mask, gfn | ~mask);
> >>>          if ( nt != ot )
> >>
> >> I'm afraid I neither understand why you make this change, nor why you
> >> then leave the other use of valid_recalc() in place.
> > 
> > The message can be bogus if we allow concurrent do_recalc(), and I
> > did miss the previous one.
> > 
> > I missed the one at the top.  Originally I wanted to send the RFC with
> > just changing the lock to read mode, but then I though I might as
> > well fix that (now bogus) print message.
> > 
> >>> @@ -538,9 +535,9 @@ int p2m_pt_handle_deferred_changes(uint64_t gpa)
> >>>       */
> >>>      ASSERT(!altp2m_active(current->domain));
> >>>  
> >>> -    p2m_lock(p2m);
> >>> +    p2m_read_lock(p2m);
> >>>      rc = do_recalc(p2m, PFN_DOWN(gpa));
> >>> -    p2m_unlock(p2m);
> >>> +    p2m_read_unlock(p2m);
> >>>  
> >>>      return rc;
> >>>  }
> >>
> >> How can this be safe, when do_recalc() involves p2m_next_level(), which
> >> may install new (intermediate) page tables?
> > 
> > Oh, great, didn't realize it was capable of doing so, it's more hidden
> > than in the EPT case.  Seems like this will only happen if a superpage
> > needs to be split because a lower order frame is being used as an
> > ioreq server page.
> > 
> > Do you think it would be safe to try to attempt to perform the recalc
> > with the read lock only and fallback to the write lock if there's a
> > need to call p2m_next_level()?
> 
> Yes, that ought to be okay.
> 
> > Do you agree it might be possible to do the recalc with just the read
> > lock if it's updating of PTE type / recalc flags only?
> 
> Technically this looks to be possible, yes. Question is whether we do
> ourselves much good by introducing such a special case of permitting
> a certain kind of writes with the lock only held in read mode. The
> latest when we find a second (more or less similar) use case thing
> are likely to become difficult.

Yes, it's not very nice.  I'm open to suggestions of other ways to
remove some of the contention.  If we go down this route it would need
to be clearly documented.

Thanks, Roger.

