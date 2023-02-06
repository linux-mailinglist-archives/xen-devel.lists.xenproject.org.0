Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACB368C242
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 16:53:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490573.759335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP3nI-0007rv-Lp; Mon, 06 Feb 2023 15:52:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490573.759335; Mon, 06 Feb 2023 15:52:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP3nI-0007pZ-IA; Mon, 06 Feb 2023 15:52:36 +0000
Received: by outflank-mailman (input) for mailman id 490573;
 Mon, 06 Feb 2023 15:52:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N+3J=6C=citrix.com=prvs=394ad1b64=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pP3nH-0007pT-7y
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 15:52:35 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42f7adf6-a636-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 16:52:32 +0100 (CET)
Received: from mail-dm6nam04lp2041.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 10:52:28 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB6052.namprd03.prod.outlook.com (2603:10b6:610:bf::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 15:52:27 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 15:52:26 +0000
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
X-Inumbo-ID: 42f7adf6-a636-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675698752;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TO/EOIlXqhwx7p11Bl7KDym+tfvER+7l0E2fOFjUnMs=;
  b=dFWcgbBx297Io08r8h1CUQmoLV0LPBvLpqLwLoFtBrCedglerhBdhYCI
   jMjMPu7UjiyweJYT0cp6lzwr8HvdqXojynfMHWkL2rlAsPVi+lpADS9Ms
   40pB8kwU1M9IDauGa4beo6IsdYXrTFTMR01DoeZBDq366La37PfYWgpJs
   c=;
X-IronPort-RemoteIP: 104.47.73.41
X-IronPort-MID: 96263152
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FPWSsKPzHOv4mYXvrR1/lsFynXyQoLVcMsEvi/4bfWQNrUp30GQFn
 GtNWmGGbP7YazPyeNgiOYm08xxTu5DcnNZmQQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tC5gJmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uxZE2wR2
 NsVEx82fy+CqP2GzZmjddA506zPLOGzVG8ekldJ6GmFSNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vFxvzG7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr6Rx32gAd9IfFG+3vBbiRqoxkUONDofSkL4u9e21E2+eesKf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZDYtE7sM49RRQxy
 0SE2djuAFRHsqCRSH+b3qeZq3W1Iyd9BXQZeSYOQA8B4t/iiII+lBTCSpBkCqHdpsLxMSH9x
 XaNtidWr7ccl8kQzI2g4EvKxTmro/D0ohUd4wzWWiep611/bYv9O4iwswCHtLBHMZqTSUSHs
 D4cgc+C4esSDJaL0iuQXOEKG7Lv7PGAWNHBvWNS81Aa32zF0xaekUp4u1mS+G8B3h44RALU
IronPort-HdrOrdr: A9a23:YXPWfq56u5219POxigPXwMbXdLJyesId70hD6qkRc3Bom6mj/P
 xG88516faZslgssRMb+exoSZPgfZq0z/cci+Qs1NyZLWrbUQWTXeRfxLqn7zr8GzDvss5xvJ
 0QF5SW0eeAb2RHsQ==
X-IronPort-AV: E=Sophos;i="5.97,276,1669093200"; 
   d="scan'208";a="96263152"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iqkmok6GURx0BD6q7jnztJRwPF5/DkSmN72E36K5qKT6PGOAlO5DJrt4sJAWulh1HcNWSBYdUcjhtGJ6XEmu8jxk2yGyhFyEClf5x7E5BIYzvThndq9gX9aOklRfalRfOHhmhUw28zFipWAd0Mf52isZhsZvpJBM0ndP1nCKLx/Uct0ywim6YmVX1ReoQa97dYMmKbOggb1fn+9+c0xWTcXuf2HBvqYHFdxLQRzzPc8JaKQC0P4FqSTXXgKMvNIveTOrzJ2cPthiPG5vDj1/XxN8Z6bTYmoQBSURW/hBICxjj4IEmrn3+NC8ywKmHdTQG3yC1SRH9dZXUHVm5cKK+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TO/EOIlXqhwx7p11Bl7KDym+tfvER+7l0E2fOFjUnMs=;
 b=JMNdBSVdK8IWiqYMVnWvv2ay0JT9BKRA43XHJOImQlJCbKagHMH/x8AACNYVQwhapO67ZslBblw0IBze6URz3P+3Gqlz9VOg92kkkKquGXEFPrFlon7udNt8+dWfMgPQcQih/WlT4edpcGIwgi2VbxWOc5994FRwcFj+Bvr2MRMdVSShd2aBxDOg66U6k1Kzba4n2IVucpCL/0xTbribEh3R+AmEpizTnl9MZAiOSGssaIECEVoZBIrJ5j9nFDCRz/V86xOxoJUC2mA2N6bW3lnfyhMNL5Oc4TkX3Y6TItIR1vEgkkvmvEYWu4XjMutwAUYC32QsjrY2g3UF6pQ7Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TO/EOIlXqhwx7p11Bl7KDym+tfvER+7l0E2fOFjUnMs=;
 b=ciWVMSMq7UVWKjyOdGvA6uXJz0kfaxECeKAOMlZUC0L1o82qD5lZ5ga2pamj18JggIsRf3q49UVe+fAuRpPNmIikW5UOmrLRyqNpYwId1zDVztOdF488dTXqpkND8z+82VwcJV9kKrh5ZRJbXlqHcieFIL5H55/cnG6erFfuHFQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2b41d9f5-b839-4fab-96cc-7548538cd758@citrix.com>
Date: Mon, 6 Feb 2023 15:52:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [XEN PATCH for-4.17 v6 1/5] libs: Fix auto-generation of
 version-script for unstable libs
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <20230120194431.55922-1-anthony.perard@citrix.com>
 <20230120194431.55922-2-anthony.perard@citrix.com>
In-Reply-To: <20230120194431.55922-2-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0383.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::35) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH0PR03MB6052:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d896ecf-0f6f-4e3d-6af8-08db085a24fc
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4tZc0G02HB423EofiyoHx5AzmFVUoPKFeQbuQm5psY7Qur2fLBEpRI+39ColUvVumz0B0RuwgND3Xlz19CL7lddbN2NUmZopj1FGdy3dmlVv+y0gXRGi6GHAstRPkTsdXOCjfye1+6z+FG5ZCBElEIn4QcQ0XT4En6Ysww0Z4aYjWGiPlWYbG+zZfNVNAmwjBMdlFpxzf3bxe4s+BDz128bkr/hrMHOqK7HE0OTYn7tgQ3qPLfUwa8pz9TvVhCUkmM2dDKa/w8BMolsQfi7Y0iw3Fdw7jo/mKwxjT20QtPTsmzwX7YCiuOeN4ej8vOf4Bez7fSEI9YfChJNj627EeNhO9BX/HLpAaGIMmJp3SMgQyDxiPaU3JB50iPrMYSfQRT6TPsvNmYtF63hEDrkrmTsTiPwKSDo7DvCHUoQNv5pdZ7jVcr0gvjebqj+0dEimtsjKJ+xeGEkx9NpoYV0ioBWWwOEA5eG310yGemPWQMTyUyjboLnMjIk7IdQxpq5+jPANreP7mEQumgFhxM7ya16MrekwD+PmwVUzKZ+yJAg6xdCw7IVNMg3y3+8Zh1GqkrMiTEwGPq+DBrgA1/lOGhvXDVdyEqHSVefGIEzy85VSwy28CSZd9sOszQLCxePk0Z8/Xk8sPIbZ0CiARWgAx+Jmn8/1nBURLwZ0ywDaqQCw11lcktRoh7zQo7tjdgEzp+SAIPhGSFemYILFQ0iDCfGaTYtcqCjnjZ2/ylxxAqc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199018)(5660300002)(8936002)(41300700001)(83380400001)(31686004)(2906002)(66556008)(316002)(66476007)(66946007)(26005)(8676002)(6512007)(186003)(4326008)(31696002)(82960400001)(36756003)(86362001)(38100700002)(54906003)(478600001)(6486002)(2616005)(53546011)(6506007)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjBGZzRXVktadDg0NzZqY1N3Ry96VU4vaVNBZVYydEtZTUd5ak83MjBaaFpj?=
 =?utf-8?B?aklISmF4azAvVk1ISVpyVFZnVDFGK3dKNHNhWFNPOG41NVhjTUo2TVh4WTRP?=
 =?utf-8?B?bWJzbDR5aFNQMTZmYlVMU2wzL3RvTklRQy9SdmR5NG9FVXphOWd0cjRTQ01B?=
 =?utf-8?B?VGlVaGI1OG1ibWJRTFU0bklkTGFWR0JVRTVmMlBwSk1JTWRGRVR2RDdKaFdY?=
 =?utf-8?B?RENyVXF2am1tdEdWQk5TcENlb3ZLaGUvVWl4cTBhNG1vMXlvWERJVFFOS0Q4?=
 =?utf-8?B?MVFZRHJwOWprdVBJOGRuamVoYmo4MkR1NERXRnN2YWtpN2IwRFgrdUx1d213?=
 =?utf-8?B?bGpqL0FVRVdXNytzeEpsMHZIS3dZTk8wWlphajVZM2hOZEU2RHRmSTlLVjJ1?=
 =?utf-8?B?R25BZEhhUzVYVnRVUUg3VWhFYmNVUm10NExwb2dTVWtCS0szNzg0MFR1R2V5?=
 =?utf-8?B?S3RxOThrbkVGWW9WcWViV3FhWjgxdGM5SnJNdnBuVkRUUnBuQWRndm9PQnQw?=
 =?utf-8?B?OC9YRk1qbFdzd1FrMmh5UjQxSG9VUEVMbDJFdmdrSFRsZm4xNW1wc2NxKy9P?=
 =?utf-8?B?UktTVmZ0WThaS01vaHRoWkZ6QmgwZndNbW5HVmZFWjBtZkQ3UlRqRlZXbXJq?=
 =?utf-8?B?SnA4cGQzZmdjWmJQOTVOa21zWlcxNCtrWDVCZGZjVVJ3Ni9XUjBrVlJrZ0Fi?=
 =?utf-8?B?SEdWRjREaWhzVnZSVXhXcG1PRkVMMm9uN25kMzhtTFVyKzlQMEwvbk9PV0dU?=
 =?utf-8?B?bmgwR1laN3lSNk5Vc1dYcVF5QTdYU0hWTVRSb0R6dm9IaDcvM1BtMnpUSE4v?=
 =?utf-8?B?NUxxTkl0bW05RjhhemF0TFN2VFRiS0ZSUEx5a2dHaG5SZ1hVVlN5YzcxZEl3?=
 =?utf-8?B?cWhudUE4TWowa28yWE9oeGQydXF5VHM1TVFieGJuVFhqYnk3Z010Zk1VaGM3?=
 =?utf-8?B?aTB2c04wejBrcUhXTVpVVDVFcmNMRVZJYjZrRnBnbGczU1NBczJvMUgrMDYy?=
 =?utf-8?B?N1FiMFV1cmRWZ0pOU1A4T1NCSnAwcnVBMlJramg3MFhydEVkMEpZU1gzbWhm?=
 =?utf-8?B?RDJrZXoyVTNuNWpOOU9hTTg5MTFWc2RuVFVyNEphbnkwS3JvZmRtTEs0dUFJ?=
 =?utf-8?B?VHYrSW01Y2FOY1pLUWhCMzJ0UWtpZHpZRFhnK0E5U0loRTcxWGszRWpwWWd5?=
 =?utf-8?B?R0xIdDdjS1RlNjQ5WGh1QUV3SkdXTDZtM1BrM2NMNFdBU3F4KzVrckFteTkw?=
 =?utf-8?B?TVZiTGcxdkJ1cm50QW82NW1kRUk5eUVvTDVDTHdYTkR1L0FFNWFyWjQ5R3dw?=
 =?utf-8?B?ZU91d05EY0NXdG14MFE1SGlwdDRHSkc4RkZCYVFUR1hlNDloa3dIaW9xTVpW?=
 =?utf-8?B?Q0tpRDFQdnh0UWdyQkRoTVFyeGloVXAzc2hMRlgwdngwTTA5dUhnUnA3dTZM?=
 =?utf-8?B?cTlyU0syWXNVMERWaXBBdEtzamJNUUQrR1hGTk84TCtRbkhJV2srL01GdEpr?=
 =?utf-8?B?M05VNGZqakY1MHZJT3g0N3ZHZWxZd2FtSmJ5b0hFYStBeGV0NkVZUy9HeFVB?=
 =?utf-8?B?SXJicU5HZ2tFMjd3UW5pc3g5WnVzaWJWMVdvc0ZtSFN0bm42YzBPMWoxYUti?=
 =?utf-8?B?cG4zam1YNUJsaFd3SElKbTdYYjBMaG81M3lkODh6SkdPbXVMb0IrNEt5Nm52?=
 =?utf-8?B?WmZwc092a2dJV014NVFObDB6aUViMUdPVFRtK0twOFRscktqUkcwRW9GZFlJ?=
 =?utf-8?B?TWhHOUx0OFd6K2NxRlBZclptdFNnZEQ3WHlkRk8wVjBvTHZPMWxMRnVDTUlk?=
 =?utf-8?B?TzhkS1laMjZXWmpVZFhPaTNvYkMwTW1MQ2dUY2N1MjJKQ25iTytEd2tzY0xy?=
 =?utf-8?B?TU50T3daNnVtV3oySDRxaU5Xb3o2dHV1N2o3ekNsaExaRlpBMXFyby9QbXBB?=
 =?utf-8?B?R3FiSWcrYVZ6dXd1cm1kc3l3ZjNtUmVkWitPUlZyMzF0SWV4aUQ1RkQvaEtH?=
 =?utf-8?B?bUZQWTZyU0M3UFRPc3RFZnRyZlBjNlNMSXNFTDBTNlJWdk1hREhRdGZqSGFn?=
 =?utf-8?B?ZmR0dGpEVGZsc3BHbzdzWW5URE0rdWNlNjlwcWN4Q3oweUtmNHp4R2ZGaEdw?=
 =?utf-8?B?YjFCb3M4MDkrd1Y0Qit2THpCK1daL2w0SmZOcVp1eFZBZEJCWCtTYjIrVm8z?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KXmky5aOitV1k0WK3S4NKy7kvah7y7adferSPkwkVZQE9W8zR4Y/fqlDd4jrXIZgvX2Unn4RMvKDVvHMCNu6i0I2X98jSvs5hzoQQ1fWI7aWWuP1E73XsUFxwfZfcauFleRfq26/BFDWpxZoFW8B+2Rh1PbzEzTKZSNxIQg5gYTvLe4h5YEDR9vFbxLb9H85+GRfU2TeLfqKwLWtjDa9hZFHaEBHMJZcfdbWT4qtePr8sCusY1iuLwqs8GyokonSLjRcUevBUNrovx2aXJB5HSNx2J7mrBGZwJ4JMKtUuOyjULgR2sM0y9/WRuhq8B5OwT9aPFkuO5CQfiwb72EIJf6w8dhydlmvaeU0XdviKWL/7uEexe1JIX4lhQ/FW6KKAdi4CfhHmhXdQ7SLPavXDhvKs11SGL/mv2+R3Lh50G8o0gSc4qqZSNyhLhAmqZAuHKIjnFwRagMsfpH4LcVvRPrYMsONv7ITYmvzoc9EIgdZ1L3GDyZyKYi1y00S5kKWzyLWrxOv94InNgtStr3GzOmXNxJszt0zZbOL0vKcEnep52n3rPLdhD6cOINj1Vmh8tBmR5S4cufY+Y2i0fHi+z36TsWq/mxWcCQ27dk20WeIjd6ddhz+1eVGAVEMCtQgkasxjdDRuJHaxj8Auc84tGGqZudw958H9XFyxTJgQNxjzpIeOuMc7aCyf0or1YY8jPGx2MhQvBqp24otwCGSUhga6ij7Fvg7w8+dMTUHlPK/rYitNKtkMnjpGWVPBJa13yDpZN/2/n8aTqWvOcqWmgoV6hdxnU4UC0OS5sxa9MBhX6lA++95NceILyRpf9i8UIwyJ+tRoxXK4A9IFtd+vL45aDKa6LOxRcqUym2BdWs=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d896ecf-0f6f-4e3d-6af8-08db085a24fc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 15:52:26.7251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f4U1faapnya4El1NfCLWX/qEfncqzrDsZYohPfkvPILqR5tlwbkAZ6UMr29uaoRkwER1u3Eq6Vi3+Khh7k2uSx5WPr8UFWJu3k+JA5IRZKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6052

On 20/01/2023 7:44 pm, Anthony PERARD wrote:
> When there isn't a version-script for a shared library (like for
> unstable libs), we create one based on the current Xen version. But
> that version-script became out-of-date as soon as Xen's version
> changes and make as no way to regenerate the version-script on
> rebuild.
>
> For unstable libs, we only needs the symver to be different from a
> previous release of Xen. There's an option "--default-symver" which
> allow to use the soname as symver and as the soname have the Xen
> release version, it will be different for every release. With
> --default-symver we don't need to generate a version-script.
>
> But we also need to know if there's already an existing version script
> , for that we introduce $(version-script) to be used to point to the
> path of the existing script. (Guessing if a version script exist for a
> stable library with for example $(wildcard) won't work as a file will
> exist when building the library without this patch.)
>
> We don't need the version-script unless we are making the shared
> library so it is removed from the "all" target.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

