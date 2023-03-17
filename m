Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 685F86BEDC2
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 17:10:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511158.790085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdCe0-0007tI-5j; Fri, 17 Mar 2023 16:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511158.790085; Fri, 17 Mar 2023 16:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdCe0-0007rA-23; Fri, 17 Mar 2023 16:09:28 +0000
Received: by outflank-mailman (input) for mailman id 511158;
 Fri, 17 Mar 2023 16:09:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=001K=7J=citrix.com=prvs=433d55c46=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pdCdy-0007r2-NC
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 16:09:27 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13bcddcf-c4de-11ed-b464-930f4c7d94ae;
 Fri, 17 Mar 2023 17:09:23 +0100 (CET)
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Mar 2023 12:09:10 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB7067.namprd03.prod.outlook.com (2603:10b6:510:2a0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Fri, 17 Mar
 2023 16:09:08 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%9]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 16:09:07 +0000
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
X-Inumbo-ID: 13bcddcf-c4de-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679069363;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=X2sKJvW4hpd77VYJBVmKkhwbGMZw3ljxNbAGQAEa3y4=;
  b=ep7FYp4hyDgcKs7vTOzG1rqiFI/DYxMtL79bPOwlw2nks1TTjwSOjT+a
   zPjwcTyUdJw+zKbzAcVgGFP8TK1gyfXxD7rDj+4eF3BUyDU8RTk+j8lEr
   XFxmzSSiDjCg4PCYuWUYD5YNuFe8cWK8n5/3xSdufG2ByjuaAGYzjqubK
   E=;
X-IronPort-RemoteIP: 104.47.55.109
X-IronPort-MID: 103718518
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:DyklaKOQauIRplTvrR1xlsFynXyQoLVcMsEvi/4bfWQNrUoigTBRz
 GUZXmGAb/3ZMGD3f9gjaY3koEoGu8TRydFmSQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tD5wNmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0ulxLkts0
 NsBEx9ObEuKoMSL246FVuY506zPLOGzVG8ekldJ6GiBSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujCCpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyr32bafwHqrMG4UPJac6tVEpgeB/WIKJxoaDnWpotifhUHrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBGjhHoLCTD3WH+d+8rj6sOC5TMW4LYwcFSxcI55/op4RbphDSSJBlGa28jNzwEBnxx
 SyHqG41gLB7sCIQ/6Cy/FSChi32oJHMF1Yx/l+OBjPj6R5lbom4YYDu8ULc8ftLMIeeSB+Go
 WQAnM+dqusJCPlhiRCwfQnEJ5nxj97tDdEWqQQH80UJn9h1x0OeQA==
IronPort-HdrOrdr: A9a23:wi/TMKjaLnK9Gy04s7HjjEAk53BQXiAji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPE3I/OrrBEDuexzhHPJOj7X5Xo3SOTUO2lHYT72KhLGKq1Hd8kXFndK1vp
 0QEZSWZueQMbB75/yKnTVREbwbsaW6GHbDv5ag859vJzsaFZ2J921Ce2Gm+tUdfng8OXI+fq
 DsgPZvln6bVlk8SN+0PXUBV/irnaywqHq3CSR2fiLO8WO1/EuV1II=
X-IronPort-AV: E=Sophos;i="5.98,268,1673931600"; 
   d="scan'208";a="103718518"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j74Py65T+Ef+HJd17j025ed/EfaxizPfmASdw4nr1L7tRa1BErXrYhg+/afB5S9f5olKB1kC5frJZCtuQNsgNkKgndSIOQShvf/KwD9xmgTj6DU8W8AfY5QlksP9gk+YSNius/2MHBi2J7HcnRdzF37w2hUBWWBq516moD0YFG4Uujy3kpgGYcTg2PJlhNFieJPf0gC11FMfBGynxdKQ2DHF+VirGM0O4Eb8jG8ApcM91JvFoGDVOy7JmnhjCvB9e13wXLXvpCAvRQn6T7GxT+5/rTybJyLsm5PHmF0uVWYbtDSo/NQuE9VmTzrQls9nd1PRk61i++CDKZthomc0gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxVYceOxp4b7SJlHcui+eVM5fXAkbBRqOIRY0fvjGuA=;
 b=bVIiU8ecYVHVGvHkysW46zarBABTJwKrVmQqzD3GfHTvYlyvHCJYvLw50MvSQpaJvsHTcBxySAUwQNO7b9XfEGDuJEeGGfWytX6C5JeuhQ30xKyLDE2ryzAullL4cj2asPa38R0CdY8LHjSWm86kwClj1tZko+bhvYV2ZibqpPl3MCMR4RUruDU5NR0TUGoT99dqbIdRZXF55W/cbWA2Cb/JVwq/L0xj+HSaasC4tz4m0xDL5ii46ivv/hAdZYnjuyDynuu+ViUUP6TGOz9TX+NqVXo7HyRfbKYWir8ZIijru0h1Lq6LH5HNenIvhdLZdGiM237/Xz9Bi+rrM8JXxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxVYceOxp4b7SJlHcui+eVM5fXAkbBRqOIRY0fvjGuA=;
 b=KvR+0sMHFzfXsm/5Fe1hhDs/+dUN4dGcKUcN4F7ZGDToWbT3r9DHJnZ5fyy6wVvtKgLjjd8E491C1wcjglbHwXb8kOKa9yYy3YgpEf+Ltpikh04AjOwWG88h7ves9ypcl+eaEl+Q1E/y4EjwZWIgt3p+KXArX6uKcZ6UHru8Dyc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 17 Mar 2023 17:09:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH v4] x86/HVM: support emulated UMIP
Message-ID: <ZBSQnFpf89uEwXif@Air-de-Roger>
References: <581a90d5-a168-5445-6a6d-ab20cc43b944@suse.com>
 <ZBR5T57tSqs2o/Sl@Air-de-Roger>
 <a77ec0d5-0f97-409d-e954-0f28c30cf28b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a77ec0d5-0f97-409d-e954-0f28c30cf28b@suse.com>
X-ClientProxiedBy: LO3P123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::23) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB7067:EE_
X-MS-Office365-Filtering-Correlation-Id: 82704a9d-d472-4799-3bb2-08db2701efa1
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XXF0+2LwCSJZCQjfyIpBa5Wdpot/u688onFKBXHqn21ci1wuDnnfildXZ6wl5JrPVMqlDDyxG9dFbZe4KIt16vk+DTf0AS6fA0ZtK2DFqaMIPocE8v+jhCMrKFYTF5AyKmhq5JPeu5k2lxZkSpZ8RTT/winwbytFduFW0ue3eIVmnLBKc+WEY3W9Fa5brKEVf595LTXxd2M6dev3mfLJSglNucl2EFbkWkEtJaVewWC0FbuYkHYmT5c+Q6n7ex/DFOJT+rbzPvrS/rTjAlYe70lYeKTqDkGL7rQOqQse1r73aHNDpnOoREBrGsI3DX4eVbnBKQZhMO0dzmoHMkQjPR/k6MxxdwSipECCxTJDHnRtPPCHRLz9+ruiNtcIMIdMujPdWdbOd9gkESvSDxlH/eXEsjRltp1WUPyTQoV8jwLHUPzeIsZgCmHZAhigS0AmOkh8+XI7TnZf4zwcHoCFHdC9KIp3Weun9B5q4/doj4X8ldazKlB3wksRe3cyhAcJmXGGSC4rSH/SE46tZe75jxXHsa6quTUFBRvtUO8cAyxlB1QKiIwtKcci5WoqIW99g5gbhVv6yER/k+P9BKT7IhPDQ9y0/VZb5Bjwd5Cu1EuecGXtS363SDwTh6v84JWExyfmn0t/d6CGTkag0JqgVA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199018)(9686003)(186003)(53546011)(6512007)(6506007)(66899018)(33716001)(8936002)(6666004)(41300700001)(2906002)(82960400001)(6486002)(26005)(5660300002)(85182001)(316002)(38100700002)(66556008)(8676002)(66946007)(86362001)(66476007)(478600001)(4326008)(6916009)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UERZQnM2Y09WTWdxN1c4aUxFRFhZUlpwVVJQYzBUVkNGSjh1MWk3bkd3WWZN?=
 =?utf-8?B?cElNT0dvc0E1aG92K2hkNk9HbFhjZlk1UFVCd041aVhrblhJZWxlTGxEM29D?=
 =?utf-8?B?R0tFZDBCbFRtcTZIbXNjQS9YVXM4MTV2QlVFY0Y1YTdRWC9vVE9JcEpyV0Rn?=
 =?utf-8?B?WGpQUmNRVjhuR2lkTGdaUVNOeGo4cEJtZTR4bHFUaXZUTEVkYjVqN2M3aUVH?=
 =?utf-8?B?aVBCaFBMTkRLbnNHR2lkbFNkYjI4N2R4aitDUGxDL3VyMTZVVjA3U2NFVG00?=
 =?utf-8?B?L3k4eVp5SjhXaHR4RkVYQ1V6aDZENW85cEFJUmtncHY3QnFDRWNkdmN0TGRy?=
 =?utf-8?B?UU5VTmJ2Y09Iek41UjBwNE5wa1hCV2t5M00relFyb2VIVlJjZWIxMlBmVE1Q?=
 =?utf-8?B?aU1rL3RPejF6L2hYU3l6VmVzQ0JOOEV2OGJMRVlrK3ljRm54dnNPaUVtT1JC?=
 =?utf-8?B?ejBYUVQyVEhra1NjZFFJaGNyTHdBamdzbXpqbUdhcXZ6WlFidWJGRjY5SitC?=
 =?utf-8?B?Vm5ZTHRFN01OeWNkbE5yN2xwQjZjMnJZUUFOb1FydkxTZ3dGLzJpOTBya1Jx?=
 =?utf-8?B?ZnF3NysyL3VydGMwSU1hSmx5Zk9BVGRNOHJSU3l0NHFUQlVvNUIreEhVandD?=
 =?utf-8?B?L1d0Rm1WSWRJTzNJaElqbG8xOXRWNjh6ZlFGbWZ6anVMMnI4N3FGZEN2Q2F4?=
 =?utf-8?B?V283NnNBSzdhaEUyUEs2RVl5TmNCMFVjUFpkNUxQS0ZiS1hPQ21xZTlMR3Nm?=
 =?utf-8?B?Sjh5V21kQ2hZVHJGOFh3YmJmT2lLcmIwZFh1dENpWnZUeGRLVWlkYXlYQ3Uy?=
 =?utf-8?B?LzgzSWhGdDNvTE9CWjhEcFJrS09tQ0NDNlJ5bWJGK3N3bzNhU0c5ZXJ0d0hD?=
 =?utf-8?B?VmpRbkV1b3JSYkp4dHFuU21hRkRldTVEUWd6eGV5NG94ME5XL2M5dmtHUWlW?=
 =?utf-8?B?OElBaGNWQkszU3BsMTZRUU51bk1qTU96ZTJxcFVXTDFNRUd2dmZ6K3RPc3VL?=
 =?utf-8?B?QWJNZG10bGF0OStKOU9ub0dvTE1FKzdOUE43UTBKSVd6aVA4UVVtUXpiZmhP?=
 =?utf-8?B?RnY0VlB2em9CM0pIcVo0WGxuL2YxYnJOYzJhZ3IvOXNiY1I4cW92cTJ5K25Q?=
 =?utf-8?B?Q1hLVm9ZRkpIRXp1SUZQYzRPM2hKYnlpMytLNG1wYjFKVDUzQ2UyT0NiR1Bq?=
 =?utf-8?B?ZHBVeWt0bFBBOEhBNTJhWTJlU0VRS2tvaHY2cjBrekxPcFQ2ekFCZTFWUWZD?=
 =?utf-8?B?ZXVYK2lvYmQ5MWFwN2FxeWltSHlwSS9jRXJXRXVIRXZkTlE2ZWw5U1IzRUxF?=
 =?utf-8?B?OFdEdEtLMEtyS0J4STAvMEpVNldVd0cvL2YzTXlPRkN3YlpHeTd6SjRyQndI?=
 =?utf-8?B?OW5SZXFGZ296UUk2NDE5S3BZNUNORWVUbmhZMjZQVy90dFV4T0E0K0pka2Zp?=
 =?utf-8?B?MnlVSEN5NERqaE9UZWJVNTc5aktXb1IwRi93cXg1MG42dEVGOVNrL3hJcEhw?=
 =?utf-8?B?VXdvcmtCYm5weGFYMUQ4VUFHckwzOW5vNlczN0ZqVGNTUDJxOG1hc0Z3TEpU?=
 =?utf-8?B?R0pIZWhqYU55S1dFakVzVXhMODRCVUJLalp6V2hpblVhQ21TWDNWRUw2MW1F?=
 =?utf-8?B?dUpydXp0emZzWHFDZlc3NkRFb3Q2bkVzNjJkSlFTbDhsdmFyR3JkQ1pUQmx6?=
 =?utf-8?B?ckRWRDgvN2lWMm9CTmR3VjdveTk5enEzSytGVTVhNmgzak8xNEpvZ1NKMnR2?=
 =?utf-8?B?UDR6OUlPSGx4ZTFwa3oyZklTZDdMRldXV0dpOTlZNjUzUFZ4UjZYZUhMYjhr?=
 =?utf-8?B?KzZmYURqTWhYc1A1SStYcnVaVGNuQXg2TnRYcUR1cWZhQW1WbHI1anpXbDBH?=
 =?utf-8?B?Rmd6YjdaeUtFRzZiYVBPYzM1cmJKSXZjdGk3bkNGWGdtaGdDN0ZrQWZIRzU1?=
 =?utf-8?B?UTVjS0ZBR3VIS1ZyVkd0UDJlZFhkYnhFaVd4U0Z6WFFnc1NTa3pjaUJPNmtR?=
 =?utf-8?B?Sit4cWNsSGp0Q0ZlUlBGRWIxTlh0dVY0dVRJdzFmQm1FWk5jVHhXNW9Uc2Fq?=
 =?utf-8?B?YXFNWXBoZ3FhTEJTMXJ3RHRSZFF3anpzREg5bklmSE9TUU5PREpWY0tTQith?=
 =?utf-8?B?eEFSUTUwZkVVRW9vZEFrMUY2U0NkNFRiRXhrbXZEdmxLVHhLeHordWUrOHVa?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UtnX+iRuS1dXYP6eCLySmI8Gp3ISrdZ8qRXUflmsy5Tr7CSVjwlP+4E7YNo5F+6TV5LkZTL9ws3TAy6IpVfEoOvVA2JVYeGdTCJpXRB/99hnaEDcX1iuiqwgqLEWs2vztpAgdECXHlsbx2b9Li4O44JtTBYlpc7bHerfkeDw7oWE2AnquSXTN55DAaReN8u7NlubksyOdvWLqptDF6WqJylGsIlQiTlZcJylD6NRLAQD/6AE4hFUlv5p/q/aw3XQChFHbzDk6MxJn6CY7Atss7tsFHJOjG3ZwcGo3Zh4TWfZDpsmUf0isX+kGisMLiBWTtF5jD0UscD2YSvIUU5v9nsW84NdQBrG/glWhXwLuxAmM3pg/yNPt7w7mbCPMCvjFIOwzxrCL+FcyFZ0fQJNTNDgygeTyRZ/AjViyKXTNjDbzcrbNot9mhCGCXLjhTxNIggidwckftJ/f78IT+VPIwnkXR3QkpKHHaym1iWI5z5COIycQ1pMPEmyeWI3PN7LPLbFvyXvXyQGb3dxZekQ8op4xyG/GpUZOlsTF6DqOnBKVs1bPOIvxVauvUp6eEx1N1jH+g/8KTLILXjQ9ACm0LLU2LWPTahX/5ofXT8Z1j+Gw9DuzAhbIZYgBq3Aj7YUDA5JljrBVCCQUIfGvL7q7x2mBIElBDGznRvJ25xIo3rdn94BmvczvyT7XaRq25YzB0vhEle1G6Awl55faSsbbU9AGw0urFbMwrD2vK8PeF7Szi6vc4dTLDV9cRoaJ5rbHy22UrJLwyvWakd/H1Ci0Okl3n9QLgwWPi61p6ZURnx+5JBVcRNjf8X1z1CIF9CtJ3Cf3yUzeh1OtExODqU8yM077WFSxkTq6aTLAN/bqe8=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82704a9d-d472-4799-3bb2-08db2701efa1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 16:09:07.4953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEPYWjIw9h4nUvDEBPry79mbIrl3CNy5cJDRoJZ2lcsN3kjvZ2PpX9eKaKByRpqCOIOyLeKGddw2KZ4izrztNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB7067

On Fri, Mar 17, 2023 at 04:01:59PM +0100, Jan Beulich wrote:
> On 17.03.2023 15:29, Roger Pau Monné wrote:
> > On Thu, Apr 15, 2021 at 11:47:42AM +0200, Jan Beulich wrote:
> >> There are three noteworthy drawbacks:
> >> 1) The intercepts we need to enable here are CPL-independent, i.e. we
> >>    now have to emulate certain instructions for ring 0.
> >> 2) On VMX there's no intercept for SMSW, so the emulation isn't really
> >>    complete there.
> > 
> > Then I'm afraid we can't set the bit in the max CPUID policy.  What
> > about domains being migrated from a host that has UMIP to an Intel
> > host where UMIP is emulated?  They would see a change in behavior in
> > SMSW, and the behavior won't match the ISA anymore.
> 
> Right, but that's the price to pay if we want such emulation (which back
> at the time did look at least desirable, because the other affected insns
> are more important to deal with). Not setting the bit in the max policy
> is as good as not having emulation on VMX at all then.

It would need some kind of justification at least on why it's deemed
worth exposing in the max policy (and thus made available to incoming
guests) even when not compliant to the specification.

Could the non-intercaption of CR0 reads and thus no #GP on SMSW on
Intel lead to software malfunctioning as a result?

Thanks, Roger.

