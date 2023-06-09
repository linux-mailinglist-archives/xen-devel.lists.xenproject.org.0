Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4304D7296D6
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 12:29:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545857.852478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7ZMG-0003nI-Fy; Fri, 09 Jun 2023 10:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545857.852478; Fri, 09 Jun 2023 10:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7ZMG-0003lb-D4; Fri, 09 Jun 2023 10:28:40 +0000
Received: by outflank-mailman (input) for mailman id 545857;
 Fri, 09 Jun 2023 10:28:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H16Y=B5=citrix.com=prvs=5170a5cbe=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q7ZMF-0003lV-8R
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 10:28:39 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 646c78a1-06b0-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 12:28:37 +0200 (CEST)
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2023 06:28:35 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5087.namprd03.prod.outlook.com (2603:10b6:208:1ad::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.31; Fri, 9 Jun
 2023 10:28:32 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 10:28:32 +0000
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
X-Inumbo-ID: 646c78a1-06b0-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686306517;
  h=message-id:date:from:subject:to:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=zYiIxoTTutRV8T/eRdOJYgCN43AZgVhW4YINiX3cz20=;
  b=GjJdgrTkPg8mxLTfxiWGHDhmXxqtjfbm3SkP2dp1J6TvEAwiq9cSWg16
   NKKr/8/u5e4YZt7WGKDqV4TwT2vhb4wXPehw6dwi+u1akpv9KkXmA7WRh
   kGEbQ3ZsPZue5BgfJO6gbTYdpeE8GAjH+nLfS5WFKL+h/JtkUkULqFKJK
   Y=;
X-IronPort-RemoteIP: 104.47.70.100
X-IronPort-MID: 114710646
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FahFb62dS6gekdzeX/bD5d9wkn2cJEfYwER7XKvMYLTBsI5bp2ZSy
 jAdDD+Ca/eDM2KnLox2Yd7j/RhS75aBmoBmQAE6pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gJmNagQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfGE9Mq
 q0zEy82RBGOlqHmnbCiabhwmZF2RCXrFNt3VnBI6xj8VK5ja7acBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouy6KlFQZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqiBN1LTOPkqJaGhnW/x3Y6WDsuBWKqnvSFl1W3dNFAN
 lItr39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QbWNQeQDUr0
 hqDmYzvDDk26LmNEyvFrvGTsC+4PjUTISkafygYQAAZ4t7l5oYukhbISdUlG6mw5jHoJQzNL
 /mxhHBWr90uYQQjjs1XIXivb+qQm6X0
IronPort-HdrOrdr: A9a23:2FVMRq0bjNectQuREtHMlQqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-Talos-CUID: 9a23:b8Eq4m+/y9+ZCgOxqu6Vv1c6GJ90WUbC913RLl77WTtrUZ7EVUDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AyTXB6AxO+278aBsX2LO0Uw1BT/SaqIivEmldt61?=
 =?us-ascii?q?Wgti7OBBtID6yjyuqXLZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,228,1681185600"; 
   d="scan'208";a="114710646"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMrgCGn7PUoLNX2i6GG0640ndJPoW3YXP9q0bz7lpYcW79aB/dgxkvgHjsyVBWkNltO/0/3/lubmVCbjTDf4Tacmc4gpuczUw0LMcmiqed9spDbLUtxbFRiJE2oOosRPavm8IDQMNsN8b3Qt++CyNU6B4jElP3Wp+Bp1JzPgpL6ZyN2btC084AHOYFiJkff4XiM5O/YLIN+x1vUfo2cKinkx7uMcUrIbZKyHaClGUzAT3H9EIIYj/iOo0OOGjIwlRabhX4E7Z6IrGxTSV3z2uOzWPCguiWXmpJ3HvT/GLSoIIYtpfKlVpuajSusghk895IzY41za2vv5dSfyGTqskw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yWwgl+C/+cuopAVZm3p6v7vP6JdZ5AE0al17UA70W8E=;
 b=LA8KV/Elrj5dCTLWUu6IftI2n8XDSTqoA/kvdkHMyJdfOQZmojpXjBW2TTpqUHliKfDir5U92sgHarDqYkyZEzN/1dcwuA8t47oYQEAVI+y7aQ+DUYgnRKTX4f9yLUFvgC745FQZwj+sqZ2r+08fBoKu1YGmPEYmLbfn93O7iYgqEb0JMlPJCKu19SUdkV7lGk9uMysVBbxer958/cZ3k6DmEyL37EDzAONcEAYGORhW26dOK/mIKh6bWpK9sL7AIFxiksxDqyFQAf+M+Wr+wgjjGQq4nl5CJLaQtWqFljqvR2JQqsjawxmJ10h8MT345egKRarz72XrCULhawgC3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWwgl+C/+cuopAVZm3p6v7vP6JdZ5AE0al17UA70W8E=;
 b=M297VQf3wnM7tt8LwXSEfihd40DwFL1UfTQnpbYts9FFmD0t8S3DVL9XRxZZ7MowTrYl3ghrL8C5Yc/SK1nNX50udrR1aGi1I6KMFL5DLcyHJeqhKwmSOhni0qyDir8AkUrJIOfSxT9gaiar17GcAiP5wNVAoIJnKA/r0sHt33w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c7c56308-dd21-cb20-f651-5c11e3b6148d@citrix.com>
Date: Fri, 9 Jun 2023 11:28:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] tools: Move MASK_INSR to common-macros.h
Content-Language: en-GB
To: xen-devel@lists.xenproject.org
References: <20230609101105.2585951-1-andrew.cooper3@citrix.com>
 <EDB3F031-CF9C-48A9-8E95-E4C5252FA7CE@arm.com>
In-Reply-To: <EDB3F031-CF9C-48A9-8E95-E4C5252FA7CE@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0038.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: ce8ffdbd-050c-4b72-f730-08db68d44606
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lmUlOIgGNgq+wRAV81BTCIKz7/I5mlnfmpVAGbq70D3GhfEl/XNQrcOKEQR57LvuUTxVDqH+ypqh9XoMvQJvhW98pGchCsqhQrcBD8eF9/yWjLnrQjT4MBptnGHkDmt0jOptbf9Bduke7/KwjexoO3Jel35mOfkyLpvhPXid6QQPkXd0qSL86PVBo08y8z60uoic4kQWa+FD9ph4yB3dkTgAgdgLs+tD+DFOlp3J7+2gCSyMYntbJNQ+GECOJZ2xiR+uDf3HSEnRPUip2M0rmxUgFIPHCfs9pkxB5P9DUPpIxjdSd6jIGr0TWlcrzf74JehOV6Agxphoz3/9gMrKO/3C75fxdth41ESuGVLin5JlvoDy/de2bz3EfglmIjNVoRZvsW5SEeW1R37lTsPfqBr1ufOvUAmClihRzfpx4RVvm0RB3yy3Aih9JTVsJTx8SE7WEnNQfhZzZH+9/ZkHGx5A5cGuYt2nje0qtJxQqkS0oKlYkODZTTXV+D0JKBWr4mtMOcYXuOCZlFHW1nn+iDENjiZ5Or/4y49mOO6FZJoVIKCn/e4vM/7k4DtQt7RKP1x2vccxqeM1IBiyAoMQpaU0evPGVfvf+5l+4HfofWW14Rb+M+H8abXidO6M2vRfJAkAfizceN37NUGwraxQng==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(451199021)(82960400001)(6666004)(478600001)(5660300002)(8676002)(8936002)(36756003)(4744005)(86362001)(31696002)(2906002)(6916009)(66476007)(66556008)(66946007)(316002)(38100700002)(41300700001)(26005)(6506007)(6512007)(31686004)(53546011)(186003)(2616005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnF1c2swRnR6clByeklIWk1yai9saTk5a01Ec1oySUpROHVEbndJdGllTjhj?=
 =?utf-8?B?MXRMTzkxU0hKT3hqNzJJc2d2ZzZhSHB2dzFrTE9xTi9Ic0xZNnA3SVI5RGFI?=
 =?utf-8?B?L0ZiblZkVmFoU1h1R00rcUpqV0c4M09WTlNGbDVoNFZ6UStlSUVKaWtYbytU?=
 =?utf-8?B?WUhNenlaRmhlWDdHd0dsaWZER0pLOWJRcEdvU2YxMkZXQXVTZHNNR2dCRXFa?=
 =?utf-8?B?OXhsak9SYS80OGo1MkkraXVPWXR3YXcwSThoSGQ0WU41K1lmUE5vRDdJSUFu?=
 =?utf-8?B?SjkrVkZJdjJPb2xLT3VyUHJwVmJsU0Y1NDRzSkcySUVidEgvU1VsZFByS2h0?=
 =?utf-8?B?T0VWek1jRXg2akJ4WUVkRXo0aFYxYnNEQThKR0M2Z2FTcG92Kyt1di92aFFU?=
 =?utf-8?B?bS8vR2FkZFhGL1BxTDlHVGlER3dTOGFjdjNpR0lUUDNvaVB2T211MDRya3c0?=
 =?utf-8?B?MDVtSjZkb1RIYnJyYTZkQVJleDNYUUV3ZTJNOU9Ycit5MzZ2SlNWZVdBSTZF?=
 =?utf-8?B?Y1VvRm53b3ppeFg5TDFJVXpyR3Yzdk5rT3M0L0lZWWYzRWR3c2FSZyttNzhh?=
 =?utf-8?B?aloyek9YU3lsVUhFeGJSREZsQnB2dDlsTXVSY0RYcHZ5b1p5aGE1SC9ZR2Fs?=
 =?utf-8?B?UnlET0x3T1BVbHFZUDRuck1aNDNWaFhuZ2lrditVcFR2dmxPZHR6UG9BTTJ1?=
 =?utf-8?B?S3lWYW5rQ2hPeWgrMTBhRXZKTjFIQXNmeWJweXMrK0x0ZjBoQkdneThIbWx4?=
 =?utf-8?B?cWxwQU50MzU2dTVhWHEybEVJS2ZINEpaUzUyMzgwa25sYThEcEdQVzRZRG5r?=
 =?utf-8?B?N1VoV1lldDV4MUhSNnhvOC8vTzB3ajg1UHJULytKcGt0N0M2MEg0VnQxYTVz?=
 =?utf-8?B?NlFFZGxJdnVkOTRacDZUeVJ2WExzdWVDNStCU2pudENUUEFHNEtVMlF0Qmk1?=
 =?utf-8?B?bFJXQWJWR3BwVFJIOU5HK1d1RThtOTVZa2pQaXlOZDI2aUFqNEJjejFBUUh1?=
 =?utf-8?B?eEJXazFCU0xsTkdUOXFxUGlhOUlwKzVraXR0dVhSRklGc0FqTXhzSG9kcWNX?=
 =?utf-8?B?UUFGKzFneW5hVDdieDI5VElBT3lVdXBrSTh1TE1NR1ozNlBSR2ZDamhpc3p1?=
 =?utf-8?B?VGcwUmxuVUx0S0Y3ZWd2L1Z4dUlFemRyTXJEcVNQdTdpdklVb1pmaXZuUWFt?=
 =?utf-8?B?UUswa2dvUzZsaUI5a2sxckVPTGR5aWF1Z3p3M0ZabmIycTZPWEdrWE5UU2dq?=
 =?utf-8?B?cUxFNUNpcitENnRWZTZtMndsZUJWTGlwL0loZXpibUhtWGdGZmF1RFhGbjRY?=
 =?utf-8?B?MzlCRzFpQ2g1SkVZNExXMVcvL2g2bmdRYXoyTzROYkZybTlCZzFkTHc5WnVx?=
 =?utf-8?B?d1VXUWttRVpQYXZ0a2trQXRWYjRuZ1NEbVBJMkNOdnVtMEpyZ2NDSkRqcFBj?=
 =?utf-8?B?QW5qZ1AyRGFQYTZTSmFOMXE3RUIwc2dUMkFxWDZ5WjBnYThENGtHRUwraWZr?=
 =?utf-8?B?NUVvekZ3M2tZckpnNnpnS3RRTmJnc2VQUUtPa1FReU5uN0gzTlRTalQvNksw?=
 =?utf-8?B?WHQzV3Vwa2t1dGxNS3hPekJEWEsram9WMkMyVTBkL1ZJMTdjZWN1VEo4N1BO?=
 =?utf-8?B?a3RzNXUwRGZnaStkcGtGeGlJcGxNN3NvUm9iT2FQQlVoM01FczhXcHB5clQ0?=
 =?utf-8?B?U0JJaGNYUXlCcVZkc0JuVDBTUnpnTEgvOFk5OVlMUzJkZUxDb0RTSlJOUkxh?=
 =?utf-8?B?VTBVVm0vTTgwYzlYb1Jlbk4ydzdNZ0xEREZmQXhZRS9jbHpEQndKK0ZSOGpq?=
 =?utf-8?B?a0Z1Q3JnMXJNY3lBbFpnMzhtUVZXbE9IYzBYbGZ1SzZ5aHdUU281bjd0UExM?=
 =?utf-8?B?cGQ5aGppVXUrcFQyTjdreFYzNnRCQVcxTzhCaFBNNDF2aURxMWxSRUg4MTIr?=
 =?utf-8?B?WnZUdEhJMEh4eks2VTRsQmNtVTNPcG9MSy80WDRYRDNIaVAyS28zeFBVc0xh?=
 =?utf-8?B?SStvTTNKbkhLVnRuTngydDVzY1FDcEZjZGtwSHBhaWJwTGxOSzludmY5YTZp?=
 =?utf-8?B?WHBEMGpKNFArOXZtbFI3MEFVcWdiTWQxNnp6UmkxbmhFbHB1QjVFNkFlYUN6?=
 =?utf-8?B?SFl4L2FmS2xsb1VtdEw0aGEwYllUOVl5OHZCUWpkMnhQUm1qcmEwRTZqSVpZ?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	57BQ3QlpOIeZwbn0KvGyaB88mvxq/Log1IiVSetiipiDSuWCMEiv1SE3tJjJMgthsKiZ3o5b0ToLNAG6ygnuplZkMHyv8AeTMbhwVTgR95XR3//W9dqt3H6QJ6/0P3d62wfcyAMg3TwSOn/4AYpgQIVxlTLPIhQnCY5IH4vJBvUwqelXHFncO2P/Xazt9a7KtU9mdtcA5uwaeeoeZ10zoS14MikUcGLyeGvnEcVSex+eq1DGyiGj3MyPwMjLy4GQ7YZvjsgEXkPMIHtlIKjP1VGBLPPKIVQAsLyKwCxnYJzwVeOya9MvHervngSfe/44g9bPi9qLW3n/R8OhIk63F729VeJKDTJ4a9ryDPeUUQ1/tA9n2ry90lbBp0d3wxrNI1umjajEETwh8VMjZNGyJSdcZiE6dMv2nHGTM3k7atkQcINcK9FToY+NSwUhvySinuienOCNjUhpNKl1dL2Rf+rz/tMrpTG0KP0gEA4jlp6oAGLRCEZfZI1aJAsN1hpqk8nl2tA92yVJD1Eu3V+Is6mRQFsSjU+vErsH0GaxDpe+mtDFw/GIH89B+wtviCToio4lkCAfd/R1ONctAkriJRXDdNekk1aQLqUSqvRoVikNKULzXYnLWwqtnJP6Df1RQsJS5vSKAWxJNqnlwNKQodKk/2gXxPAGBwmR1gCaBs337fop9WR13C8lk3YpWnc3Cw5M+uR1KZSITyDTN8jB/V7IsdTYgbZgw00tq8Quf9HAvAiwHa7JRfYAx8k/PTrq66jkHOukMiWn9MryRuwQkg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce8ffdbd-050c-4b72-f730-08db68d44606
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 10:28:32.3179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s2OCkxgWPuhV7x+FOoa+uklRiCXYvENmYdSX3pt4QUNPkXsVMEXXSzRocEdUp0dPO9Yb3oLpUmJVanEKRtP7+n1spgoRH0InJRN11mcwHEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5087

On 09/06/2023 11:22 am, Luca Fancellu wrote:
>
>> On 9 Jun 2023, at 11:11, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> MASK_EXTR() and MASK_INSR() are a matching pair.  Keep them together.
>>
>> Drop the pair from x86-emulate.h which includes common-macros.h.
>>
>> Fixes: 56a7aaa16bfe ("tools: add physinfo arch_capabilities handling for Arm")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> I think you forgot to retain my R-by:
>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

I did.  I'm very sorry.  I need more coffee.

Thanks,

~Andrew

