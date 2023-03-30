Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3376D0848
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 16:28:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516765.801408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phtFg-0002uV-RJ; Thu, 30 Mar 2023 14:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516765.801408; Thu, 30 Mar 2023 14:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phtFg-0002sm-Nr; Thu, 30 Mar 2023 14:27:44 +0000
Received: by outflank-mailman (input) for mailman id 516765;
 Thu, 30 Mar 2023 14:27:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fiWc=7W=citrix.com=prvs=446b09b9a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1phtFe-0002se-SF
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 14:27:42 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04fc61b3-cf07-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 16:27:39 +0200 (CEST)
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2023 10:27:35 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB6328.namprd03.prod.outlook.com (2603:10b6:a03:395::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Thu, 30 Mar
 2023 14:27:32 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Thu, 30 Mar 2023
 14:27:32 +0000
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
X-Inumbo-ID: 04fc61b3-cf07-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680186459;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=9kCejjtMqF0Et5ss0EUIpsTP+/xrK+qjCpkBhj6gq6w=;
  b=OOtZ7G88rNqgIIbR9f0LX+kCS0jN5L69pcvbqHuWxJDrm/2SDUxDY2jS
   Gu5drkmcIa/AUhHB6JGDq117/eEPr3KvE0aQmR8Yan4CZjT8szL5Pcd5C
   mCFUwCSy8aQc8TBv6FzLPwG4epGl6Hc4wzhfAzx/FtPpl05Iya2tHaiIS
   8=;
X-IronPort-RemoteIP: 104.47.57.172
X-IronPort-MID: 103719457
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Kf0LQq2sqiZwgilUlPbD5fVwkn2cJEfYwER7XKvMYLTBsI5bp2cPz
 TEWCz2FOfmNYzfye4oib4nlo0kB78XRx9UxQVE6pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdlPagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfI15h1
 tIROi8xZSvZicOon+qCe/lzv5F2RCXrFNt3VnBI6xj8VK9jbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvC6Kk1YZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13rSQxHKnBd16+LuQ+d1xpUHP6V0qLDosdH+UrvOdrmCcVIcKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRwtJWFRHTb8a2bxQ5eIgAQJG4GICMBEw0M5oC6pJlp102VCNF+DKSyk9v5Xynqx
 CyHpzQ/gLNVitMX06K8/hbMhDfESoX1czPZLz7/BgqNhj6Vrqb/D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:aSVtlq28JogdetT6jkkigwqjBB8kLtp133Aq2lEZdPUzSL3oqy
 nOpoVk6faQskdtZJhOo6H3BEC/ewKlyXcY2/hnAV+NNDOW3ldABrsSiLcL+lXbakrDHgQ079
 YYT0EGMqyVMbEYt7eL3ODbKade/DDdytHSuQ629R4EJmwHBM8Aj3YbNu+1KDwNeOAsP+tLKH
 Pz3Ls6m9JgEU5nDPiTNz0iRfLfq8fX0L3vYRsbHBI8gTP+/w+A2frdCQKE0g0CFwxC2q0j92
 /e1zH57rjLiYDO9jbsk0nI9Ylbgsak9ddZHsyLjdJQFzTtkG+TFfFccozHmiwpr+Sm71RvtN
 HNphMpOK1IgU/sQg==
X-IronPort-AV: E=Sophos;i="5.98,303,1673931600"; 
   d="scan'208";a="103719457"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kRuSfGJ3VCCu5l1og6AIlMRjnxVrZvyNqI2ega0ljpHGAJuy2ZjZKj4IPiKEoc6KC8FXLQEcLAskenkqAtyHOijFuDT3TZzr2dHlryrVJaNRn1CwEjLRs77Ck5JSALyUtDcUuD3w9DtKwGW93PAyZx8IVQuHuutvtzOrZDobJrHvNMEC7U1LfomRkc5g1oeEulSBvSMcQ9lLaJzotvKf+wFPb95MSmOjBWVl67egggxwXwGL/Vud+WCPV6sF7oeXppqDKamTpviRg6yeeQEflyc82HSZzbJtg5WZzx4iiMdeSjbQD38JimdJ8wJwX5Cte/z0hQjBnW0j1YL+x6TlRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6e9yUkeExtSMix4yJ7tPcifc8tfU+ivlAi1upaQmqU=;
 b=U3kg0N17cRkuB7KN0odRAcGK83zH20Y92659IDniowLXm8lWzVF8Sgl+qlJRxSNB/si5mKMHMN+e9Wao94jKnUbw5xz0OFRUd+MbLyzy2hFobHLhsLlrDZXwwUa2Oh7nJGXfT8CsBqsAvIlHA9PNGtdjIU9K2eDEpaZAMZgSRT0aLxQmqpoEoyrlnI3elgaGXyW24rZvdAqvOEAWk4iJxaIx8TE5u1rY2l5deb523O+KjNBoog0z062UMRKTAwftrRPt+92yDABnhS1+715nseS9juyjon61bGYjtmryHfM1mcL/g0wlt9CPZDp+wKX0DNoNFDfYRK9J0vm9CR9JtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6e9yUkeExtSMix4yJ7tPcifc8tfU+ivlAi1upaQmqU=;
 b=Ji8yoChM8mflsdh44XOhuD7EjN3vPWeaIeukUDpdqi4fxMMF02SUU0WJkSc/aNYCj0LpVt/iIO8FTZZ6EwEYuwPvz/kTzCgz5jC5GW9W0QpPICSrxKkwoBo3vnzv7fMzH+PrdtLE0H9/CiYLYwf01hsjDZnA0VpIuh8gUOVMRgY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 30 Mar 2023 16:27:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 0/8] x86emul: a few small steps towards disintegration
Message-ID: <ZCWcTVLcr02LSLoF@Air-de-Roger>
References: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
 <ZCL3W/HrwLANuE/0@Air-de-Roger>
 <40d58ac1-d0bb-afed-c0ae-c545c7bff30c@suse.com>
 <ZCRIbKcfi8hn1m8Z@Air-de-Roger>
 <600f8643-fddb-e9f8-3d73-41eead3d7cfa@suse.com>
 <ZCVcPQNBS3bjVF+W@Air-de-Roger>
 <6591a671-a71e-f669-749f-c36dcd593cde@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6591a671-a71e-f669-749f-c36dcd593cde@suse.com>
X-ClientProxiedBy: LO4P123CA0520.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::16) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: 71bb6d85-58ea-4026-bce3-08db312ae60b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9fPuU1P5nFnaqBryUJv0r6o8Zo3QldX4slcxNDXIilE0IkSgaUKNSdWPuGwbrgmimtGNZLxQeSyAJlUXNDjsa4BRZvOqqSfo/VC8T8N0ko5y0vz2uLcSTH5F6YpL80hnY6pcdwVrqrI+ctVbLmhHnHw63cjEqERHe8qYWLcAmkAY3WEgJLs3sapZP77rHIVSPfEcvANIeWKGOcax4N/3Y2ZFyqtfUiISNLr+PwO0lk4reyRkY3X5sjZ6I6BjYso47Ty8GbQNWTBxYV0j8o5SGMx/ZobTy95LTXBFfFPaiDIKo6cn5M9MokSD5mxO6Zdy3IbPMFo2ifCiZaEK2fDweDKyOMP/BiSJCgIAyzYTY/zDE189LBgAj+bd0kWisCxopKN93aphws7Z+6MGmcslYhhmVwA2Pxll0yViJyffh0cCA7S15RnW7SJ0bgwUyUWcO1vi5KmAFtTQ/APjMASIYqJIHOmk/UhH97I/i6Bw6kszfsbnGt9hJo4Q3c5OZ1rBlmHlHNhvvq96ZDNDndHJ1ImWwCfi+xf82OeqCw4V4sIdqVezxd6g3ata/v1BMxgA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199021)(26005)(6486002)(478600001)(316002)(186003)(6666004)(54906003)(9686003)(6506007)(53546011)(2906002)(6512007)(5660300002)(4744005)(8936002)(85182001)(33716001)(6916009)(38100700002)(4326008)(66556008)(66946007)(82960400001)(8676002)(41300700001)(66476007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGJITHlwejZCbkhtNHpTMkFMUXduZ0lOZzI4S1k1a0czTFVRNS9pem9TbklV?=
 =?utf-8?B?Z0lFS1FkQU51Ti95TThhbG85UXdlV2kzbWRSMlVUWFBlS2lxbitXcmVKanNB?=
 =?utf-8?B?WGN4R0xiUnpxNmp0aEk1K25QK1o5M1JRMUlnWjd6c1kvdjlyZEVLa1VzbHRF?=
 =?utf-8?B?ZEdtdkt1dExsQVAwRTAwalZyaWkzTTdZRjg3UFlDZVVUdzF4eEU2STZBN1BH?=
 =?utf-8?B?KzJMSnI3VW52MGpCaVQzZXY1ZG94bm9hdlNBRDNCNFdyeG5RdUFUM051MFUx?=
 =?utf-8?B?cFMrS2ZhWEJ2WVBBZytrZ21EUFJRdFFzTHJzZm84RnZNV2dtVVlqcWE4Vm5H?=
 =?utf-8?B?MTZSYVdNai9MRURnY2JtQmhsNlJvcFdIV29aS3lHb1p4MWI5bXNyOE9USHY1?=
 =?utf-8?B?TUNtdGhXeWZ1bVhEZkh3TXErTVYvWGVyeXIyU09xLzN3VU56RlRYeVRnakQw?=
 =?utf-8?B?YkVjdXVVOU5zdEFSRzhyeUtyT2JsYmdTbEM2dVU3Rk5LOTlVcVExTWtnOVdB?=
 =?utf-8?B?V3RZNzVHeS9QRUZ0TGFnMGRKYlZreGozMlduY2t5Tk16ZEdxUzZpVjBaTWRP?=
 =?utf-8?B?T0x3SzM3bFVlTVZ1Tm5qMHo2VG9jVzI2NTJ2TlFvNFJyenUvM0R5dDA4VzdD?=
 =?utf-8?B?Y1VSb1c5UDd5RWpUYkU4TXpDSDlobGVPQTJGMktrVSt6ZTIyd0NnbW5BempP?=
 =?utf-8?B?eUVwd01JV3pwbCtMZTV4dk1WdEt3Nm1NdkZVOXRud1VzSTVYSGF1YkVYTnNM?=
 =?utf-8?B?Qm5vOTk3TmZSVnFoNXNJY01aTUNLMlo4LzJHT01yRlRtRXJMV2F0V3FaaXhi?=
 =?utf-8?B?TzM0dE9VSmZwdXVQTGw2RGlsUkRwZU5aWlM0NFRJeHJYZGFBREtpSWJsOVpu?=
 =?utf-8?B?QjlNVUh1UEJGODF6RTRPNEtDVDE4RUNNZXN2WVRvdy9tUVNiaXhJSUJiV0FZ?=
 =?utf-8?B?Y2FCeWYyaVoxRzBiSzBJL1lMTTFWL1ZjWXk3WmllTlFwOTF5dWRSUG1sTVRZ?=
 =?utf-8?B?RnZudWE4a0RqY2FoY3diZmxDUmw0SnF0bVNCdURNMnBjUituYmRCeVM4SlNz?=
 =?utf-8?B?d0gwVktBZzV2MVh2Q2VNeDVLdDdiMmtFd0R6dEovWm5qdTEzZTFYUDNucnk0?=
 =?utf-8?B?c2o5Mzl1WTlwR1cvWnA4MEhDMG9nSWE4YkovNzUzTmtRYkYxemlGYWVQSXky?=
 =?utf-8?B?cFVjaHU2UWdITWhnTmZ6SWtsZm1GMFNyRzZKeHk5RlRNK3FRaXNJK2FtVFVs?=
 =?utf-8?B?c2trdVQrallKMThFOEwzNS9ucUJLejNyS29XT0tUS1k1OVY3bDBTbmpHdDZB?=
 =?utf-8?B?RU5RUjc0UnNLVm96T09BVFhBckhGQXAvS3ZHa0srb2dGaEQ3RENaWHVkdzFT?=
 =?utf-8?B?QVhvREd3ZXl2TjFScXZNcGFMSnFTdDRyak12eHlBVlM3M2NhK04vdHR1WmFx?=
 =?utf-8?B?MEtVTzEwajM1bDJzZEFnTk1IZDVTWFhhVnBPMGQvKzdiOWh6Y1hPRHVxbisw?=
 =?utf-8?B?a1JBUU5XKzVNSGptS0xNT3dqRTd1UGZSd3JOVU1tSStVZXJ0YmVyMmY5amY2?=
 =?utf-8?B?cjIxcXB3QUlwSmtkVVpsSkx0WVB4Q09ORlpnOWp1TkV5cUluS2c1a3RLVll6?=
 =?utf-8?B?S00xT3I2cENWTHNnYXh0eFRaM2FjY201OGN3Qkd4b0lmN1h6MSttbXE3Zk9M?=
 =?utf-8?B?OGljdGkxZHhhV0d0K2l0bmlUQUlwcnNVZUVNRmYyYmNKMzd3b29Ca08vQ01o?=
 =?utf-8?B?bG5mTUNTZFpRRWIzOTlxZFd6cndkcGJzUFlqdTNxWVdobE9rV28vbkZSV1JN?=
 =?utf-8?B?WnZhU3hlRWh0TDZmdjVlU0RUdWR4a3FrV0FTajlQVHBPVVBGTFYvM2VWVnJF?=
 =?utf-8?B?Y29OVnpCbTRjRVRCcDNrdmlJWURMbHlUVnZlRWNXU2hpYVptZkRSMGRTNisz?=
 =?utf-8?B?TFpsLzhQYmxNWVN6OGQ3ZVhQdklRWndiOHdjNjBmWTJDL2t1cEFuS3pRQWto?=
 =?utf-8?B?SzVJaWpJeWJ3ZWtQT2hYMllkeXNweW9IZlV5eDJtS3BnZ2I3VkJvTzhHL3BK?=
 =?utf-8?B?NGVNNXRPdjh2MWp4L3hTTDljZkNSd3F3YVl3VXRweVROMEFxSEs2TC8wYUxV?=
 =?utf-8?Q?D5ttVN3xWdMudgFZDBspdk+0z?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tnv+6a1A5AzB2qWFaYuWlRe7uw8O6Lx8HR5ePogM/qjD+mJeoOraPJh0S5zIapkDutGcAwp9BjmwOK5jWVdl235YMHiS4Gl7eCYYtm7FuLiRwJvG9tfGJOjWDywX3pkSR9jmEcLOQnNhxBGFMSEnvSrubAV58J06W2Ag89PI3c8FOtGUJ2Co6NJ28rIG2vTkWXg5fAW19v1sDhY5V5b6Dib+H004hN88B+XF7kfQCr9lbqCD07TuvsL0xJvcKdlvxzkYJuws62gdTuSzn+fP1B1ULF/mfjv+Ozc9nOhaxZ57alJO+oHRxFOrUjepONGmviHg7YtRwqvYT5CAoHMkekg2i2OX/BncHzKpEydWkDaLUEaBTmn4GwKdjVYTJRHnQCO61HRWyZDfAiKZ8H2E+BYeyzF+mErAvLuzza1+MYLUCQyC9gLZ57E+DygiJbmJgnFwwsBatrjS4XzdxqBSeW4sXzWGuSaaJACNh/lIacYG1lVu9hRnPUdLOB8sVmJRyFViTrpztm/ro3Q+kaVIWEdg5hSmKWXt2xu/M7QUB+B1JpjMVrZJb64bKe+d7vSx1bWiK6vPmI7EnxMYzhEpPTVgE/rzDjvLz5GJgNZ8n91zsonjjPI/4hDttxgAG2gCKvlMIoMm5ucENq0770G3qB1OFZD+VnfLe8UFIE/kiSKymQ4YFO9iM06jp47ai5QqsyCPSuXTaIGg7FI9tX5A0s9xI5hcbGwf5Pobpx2QSZUeCMoVHFr7U87ni86LMDdxljGO0aSTqamxOh23rmwd+kyn6R/K4agam9HF8WBn6rWxJXvT0ZeEGrnH397Y+Ykc
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71bb6d85-58ea-4026-bce3-08db312ae60b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 14:27:32.3316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xF8iK706TRy8AAeGj5HP6Brj7ybU4oahia76RRzoErF0gw/uMw2DGSfhC+8sU3Xr//3QqVzw+wFhXGTa9nfRKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6328

On Thu, Mar 30, 2023 at 01:40:43PM +0200, Jan Beulich wrote:
> On 30.03.2023 11:54, Roger Pau Monné wrote:
> > On Thu, Mar 30, 2023 at 09:53:23AM +0200, Jan Beulich wrote:
> >> On 29.03.2023 16:17, Roger Pau Monné wrote:
> > Patch 8 I'm unsure, I guess it should be up to the user to decide
> > whether to use -Os or some other optimization?
> > 
> > I expect introspection users likely care way more about the speed
> > rather than the size of the generated x86 emulator code?
> 
> Perhaps. But do we want to introduce another Kconfig control just
> for that? And wouldn't there likely be other performance concerns,
> if performance really mattered in the introspection case?

I don't really have a strong opinion on the usage of -Os or not.  It's
likely fine as long as we also stay consistent with the flag we use
when building the test harness and the fuzzer, just in case.

Thanks, Roger.

