Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA4B4D147C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 11:13:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286683.486298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRWqB-0002Sg-CT; Tue, 08 Mar 2022 10:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286683.486298; Tue, 08 Mar 2022 10:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRWqB-0002Pp-90; Tue, 08 Mar 2022 10:13:15 +0000
Received: by outflank-mailman (input) for mailman id 286683;
 Tue, 08 Mar 2022 10:13:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWwI=TT=citrix.com=prvs=059ab6e88=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRWq9-0002DX-RC
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 10:13:14 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59d5763a-9ec8-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 11:13:09 +0100 (CET)
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
X-Inumbo-ID: 59d5763a-9ec8-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646734391;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=d/pgkxgBWKvVPHZTeceLs/Le0/poXA6ZmKca8w/+3+k=;
  b=AwS5JTvcfrnNUsgW0eMeJJt37uQaC71c9qhj/yioLyhCUa+Yi34nTWe/
   JWnSapU947/2jF3hai9QTu/lqduh3/dkxvyGxOhM+D+EMlMyE3sMPkoaP
   gaguim/vkILQ0sfOzpAOHIMZliFZxyS/DKVTon+REYY7nJ/Vq9XVZmka6
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65621790
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:iH5Pwq3zR5QMrMepTvbD5cVxkn2cJEfYwER7XKvMYLTBsI5bpzQEn
 WAWCmiGb6zZN2b8fIh/PI6/9UhXvsDXyoBhSQY5pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tUw0YDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1Jlt+CURZ1HJbMleU3C0RVTRskNpBJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u254URKmPP
 6L1bxJsfFffeg1+HGsUI80bh8mNnljweA9h/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 nLL+SH1Dw8XMPSbyCGZ6TS8i+nXhyT5VYkOUrqi+ZZCglee22gSAx0+TkagrL+yjUvWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKalho/GOhIArEY0wGAy4CMvgvHPDIPczEUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/4+SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFROdbNi2+AswGzARN8wGCxFAHpU
 J8swZT20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4Mvm8hdBoya5ZZIlcFh
 XM/XysLv/e/21PwMcdKj3+ZUZx2ncAM6/y/PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1ulAv7GMGgpzz6gOX2WZJgYepcWLd4Rrtit/3sTcS82
 4s3CvZmPD0DCL2uOHeGq9VPRb3IRFBiba3LRwVsXrfrCiJtGX07Cu+XxrUkeod/mL9SmPuO9
 Xa4MnK0AnKm7ZEbAW1mskxeVY4=
IronPort-HdrOrdr: A9a23:BXEa7q+Cl/QPWCpu2t5uk+E8db1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYVYqOE3Jmbi7Sc+9qFfnhONICO4qTMuftWjdyRGVxeRZjLcKrAeQfhEWmtQtsZ
 uINpIOd+EYbmIK/foSgjPIa+rIqePvmMvD6Ja8vhVQpENRGtpdBm9Ce3em+yZNNXB77PQCZf
 2hDp0tnUvfRZ1bVLXxOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mJryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idhrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT1/DRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amHazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCS2B9vSyLbU5nlhBgt/DT1NU5DXCtuA3Jy9vB96gIm3UyQlCAjtYkidnRpzuNLd3AL3Z
 WBDk1SrsA9ciYnV9MPOA4/e7rDNoXse2OEDIvAGyWuKEk4U0i936Ifpo9Fo92XRA==
X-IronPort-AV: E=Sophos;i="5.90,164,1643691600"; 
   d="scan'208";a="65621790"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESclIgUAhyEMriVMMZbXKbAx9ebTh8S2l0uwwlL7Nr+vMkNSVwPtqbCyyBJtj2JaDTL4eZUXOnd2uLiyJ+aEd7CPPQqjOEG/6s3CWpH10CVQCg2vCbwX5B/ctG065y/uxMf6rRHpTaqTj1r1AlneShJqt6up4AtHrgGAEXIKY30w9Kc/lD2rYsjmjNArUGRSKOOrz4e36V0PjtdIwAdi2IWvwSKrYGLO7iO2pHnoC2zATTVR2jaiwUi6M2cmUEIcYCHHtRYAWOZivVVxrmB1pJx8y78NJoTRusRKHosreyapzdD9/uV9CFlGo4ikQAzP7wWaPVzWbtngPYbUuJbkjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zfdpb/i6GfctBoPXNLrBBbStHRD2B0CfueJsk5WpLLQ=;
 b=I/Vxusjm06eIQNRdkp7PEMc74fAKIiZwWxbIQ8bJYe3DMwGsMZoe9HwMZZ0KSl5Q45xHehdhk2eHEoXM09TSLsHzf7IrlVBnzmU+i4aB3E9ACl8g5xLYZS5MASihLvxwkBe5Juxv07j5JPmDixTVB2nr9FP3uYg1BBmTo5P7bDApNTdAGCan77B1VJCTWl9vZged71xwkkkD9y3bsGZBaPlvlArk6T8IC6OdGESH99A+nITw4V5PF0KVDhScy5h+jSNVXV6MINt9TVhEFnsItJ+3Ff4ezdvanwH7xP4OfuAQbO0yFmFb65+0Dbj1I+AfN+5fxCNysjT/fetQIt8kPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zfdpb/i6GfctBoPXNLrBBbStHRD2B0CfueJsk5WpLLQ=;
 b=ZeJaOstPdW/itnNzIB5UeXN9meRKtvZvsSNNmmdzrnddVw9G+MnEqNTNKl78H2Zu57vjgblPygE4X23qyk9I1HscUqdiuKynbO7VQH51bfV1ndRafMF2eqZ6IdnjF+/3xXzf2MVwXXY3EvLCJG7U6EiojSPP6O5kMC45uzVXDUg=
Date: Tue, 8 Mar 2022 11:12:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86/build: use --orphan-handling linker option if
 available
Message-ID: <YicsK8xqdcGZYaIn@Air-de-Roger>
References: <289684f6-fa73-bf02-137c-680ad8891640@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <289684f6-fa73-bf02-137c-680ad8891640@suse.com>
X-ClientProxiedBy: LO4P265CA0034.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 879f457c-b55b-490c-ab8f-08da00ec3c42
X-MS-TrafficTypeDiagnostic: CO1PR03MB5875:EE_
X-Microsoft-Antispam-PRVS: <CO1PR03MB5875F280FFB8B51B41D26F958F099@CO1PR03MB5875.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n7Rg7N3J8UPOP+s4frJ8kAZK2j2susHInnBwldf5sVpSeJOjylYjlBq/didxIGa/PYnGsMcbbmOAdLs/dcHS32Unsp4TUbOMZhJRj/VLq69Txlimtrkpgt+p5xMFURUVZjSJBnCPD2NI5ZKDfbw9qRInEiMr7R5QQVBACxXoUZkQrIGp0xQGB5PT5zbjb9TOfEyPX82JFeYWUEfdP4LuoBDJ8hk60XxkwOlzlA+Q7MNrWCeqD5eShlde5IrErMfleHdz1LTk0bFQoNTIhsXfJ3UEEwWsjhraMaqXNL2LNrAIQ1xwkAbUl/9tTRe/rkLYfBJXXCiU/0mX1n6tklKNcRTZCZEGe9k34/vHdpnze1Ron9eyUl9RFCNxtIWOlv4deBdMXkjJLit5JxvqFJ4jdFnpgZ68Y363fnZsMLPvkNaK00zkqV+53W9803q9fJ0S/m9uaMzFhUBUEJUAV/2nQKnsW3Gj7ajurdN0iB8XdpRJcDh7qsfLO0+bx8BUDuFPNmB5+N9UyJiRUhcAxb25KEZNy/R10qUYvXbBFN1k4BhTBcsRKxDgYDZ7rEuQ0vMBEccO4dtrhYRFWsWP60PrRRBfVCR4Vci3rDUHaaGjwMUPc7jtFpu0Qw0x18Wu2+EJIxa2ufoi/5Em9/3GNWf5UadMs8CkVRKoIhyUy82GBzjkMS/i2yy7AGF5AgxPkNCdPQNZiF7IjZWzBmVbYe3b/vdYwYs5+kmUPHqQ4Xa5uHY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(2906002)(4326008)(86362001)(186003)(8676002)(83380400001)(33716001)(6506007)(9686003)(6512007)(66476007)(66946007)(66556008)(316002)(85182001)(6916009)(54906003)(508600001)(38100700002)(6486002)(6666004)(26005)(8936002)(966005)(82960400001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ampkU2RVd3JOdFJEdWxybkdwWjJXNEVFT2ZVaE01NUF1ZmIyOU56ZEU3U2FE?=
 =?utf-8?B?dm1NMWF3cjVzSW1QMllHYXhDU0V2b2FYZ3drVVZndWRaYmhyUXAxZ2hIcVJ2?=
 =?utf-8?B?RVpkcWRGQ3YrTU5DMGhta2I0Wjhkc2IrV1NxS25Vb2lNRVRnRkgwR3hpdFY1?=
 =?utf-8?B?NzE4ckROODRUNlpGeUc1N0d3WU5EN1dMSVRObEg1R1dUdkFqNGtCZlIzN2p5?=
 =?utf-8?B?ZHFndFJBaTdoRTJMckxHOVJpMHJib0VNcE56ZU1RaWt4NkUwTmlvZWZxSGJs?=
 =?utf-8?B?UXZ2ZGlGNGJrQ0FwZm9mclJjLzZpdkxnaiszcU1ROFNUZUwwTkIwaVpkdldj?=
 =?utf-8?B?L2IzclRBMFY5ZmhhK1ExVFUwM1ZOaExIM2R5d0NKY096VlV2UVRjY2VmaFdW?=
 =?utf-8?B?WWtXSnhZTC9EK3RrYlZyVVlyWldGbGN5bmtWUURadUUvaDV5OWJvNlZ2VVVS?=
 =?utf-8?B?dW1FY2hxU0ViSmhZcTROcnZWYTZNOGtMZVFyV1ZrM3RRSXN4WXBnV1MxWG9M?=
 =?utf-8?B?VFhkQWRxREF1ZGc5NXJNckxlcEVDWFdCUTVzTGpsb1M2VFowU3ZaZkYrblR2?=
 =?utf-8?B?K2VHZTVvMFpaWnFnNGY2ejJPanRZd1JMQWh1ckdoQThLOWV0TVNiY25xSVY5?=
 =?utf-8?B?ZzZvRWtqYnJoQ1hyS0tlR3lYM3pxcy9nTWtCSFFOVFJXSnp5ZVF1TEwyR0RB?=
 =?utf-8?B?aC9zNGxtUkpwWVNUU3lKeVh5bldhOVJXMU5IU2hxa0NXd2NXNVMwWm1HZ1c2?=
 =?utf-8?B?TVVLRzBBeEVmYk1JRGo3Q1hXMEIrSDZ5NndVN2FzYys0SkxSWlRuZWhCR2c5?=
 =?utf-8?B?NlBxbE5LMDFmSm9ma1RpWitEMUJNeXc0bHcyYVZhZklwVWdqTHlmLzIySjhD?=
 =?utf-8?B?K0NMNS92Rkdxak5WQklNYmhreEY3ZGVRekFrT1Naa0xhSmVYa3dTbzZoSTFh?=
 =?utf-8?B?ZHIwR3diMStpd0tGTlNZcXNFa1RhN0p4Ylk2bUlleGRMci9lZXZYN1MyRmhx?=
 =?utf-8?B?dFFvYnoxUEJDdlpJY2FzVmNYOVQxY2FRZlVjOHhzNjNTdXZqK2JqVG43VWIy?=
 =?utf-8?B?M0tZTkQwd2NrNno3dHR3VVFYRk1BbDUrSGMxeUovb2thQ3JPb1k4VUJteEY2?=
 =?utf-8?B?ekRxRU4rbWJoenpSbU8rT1FuTWZKbE9DSUZKenV2M2JXOWUrcjhpNTVlaEdj?=
 =?utf-8?B?KzNwLzlxYzMxWEg0Z0M1WHJFZi9lMHY0YWUxVkpqbmJacG9JU3BiTWxqSERM?=
 =?utf-8?B?UGpEcWpFSWN3VkZKbVlDM0RRbExVR2NQZVVoTHF2UlpERnRlNFpzVTFjTnRS?=
 =?utf-8?B?SWFvWmFoeUJLeUV0OW4wakxldTVXYlM3THcwYUcrQzJzYnN1L2VhZDl2THZk?=
 =?utf-8?B?QlR1NkhwV1BqbHQ0WnZUNlFuNlJxN1hyZ2tzMmhpemZKUFlWQkpqc1FidjZQ?=
 =?utf-8?B?Z0srU3pMU1NPbEtyOVpDTFpVZDdpbnZBd1o3T1QvQk90RTF6RVl0VkdoYVBy?=
 =?utf-8?B?QmIzc2YvZ0JlY1RkZUVFRDY3NmxSMmIrbGt2TWlQT053dXZmOWF5RkRDYkt3?=
 =?utf-8?B?VHp5Sm42T3Fvb2RRbXVRTDc2dllCRlRkeVlWRlB1alN4WlVrdzVpV0JSbjRL?=
 =?utf-8?B?WnRzUnFIN2QyWFhkNHlFSktrM3NTMDVpOHYwdWp4MmcvVlRlamNtYVVTUlFK?=
 =?utf-8?B?YjgwVFRjZE5MSWJkTWpUQnArbGhDcVdKT2hBdCsxeFQ4Z0MzVm5aVm1kUE4w?=
 =?utf-8?B?K3dRRlg0djFyOFExS1FaRTNCdnh3SXVGQmk2cVo4dFZuRmpLak42UUhzRzc0?=
 =?utf-8?B?ejdPYTM4ZUM4L0YwNGtac1lDMHdYMzBrSXI0eExZbGlUYS9JdWpIU3BQKzFF?=
 =?utf-8?B?bGl4WXd1QWdsOEdaQm5hMFhCck5YcWFSQjNOTGFCOTRkODFBc3IwZ1RVbXVt?=
 =?utf-8?B?Uk5wNEV4Rks2bFdrN3BoQTVVaHhONzFNTTdMeUlVazJJVHBmVFJ3aStST0dD?=
 =?utf-8?B?TktiOVZTV0hyK080Vkl1amxyMXloSWdzbldnUU5uaCsvVVgweENHbXM2SG1Z?=
 =?utf-8?B?a3l6RHo4NUtxTnlNdjFPRnJjSm1yTm84NldyWVFVQ1FyUzZmcEJTU1J2YytN?=
 =?utf-8?B?WFhZUnFQYUlNc0thMGZ0YTBSTXZFZmVQVzF2dmxSaGROSVRLZGI2TTNVbURY?=
 =?utf-8?Q?K1OvzGu8Gcw/eoWiVyT6CQA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 879f457c-b55b-490c-ab8f-08da00ec3c42
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 10:13:05.1510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n3X5oeGyIn7G7kgfLikM9yT+RFiKC/gyq7uQ1d3B8zNJruSyi2PqFHr+CY7RxR1DbQgW8gObTlsdQpkvzccbjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5875
X-OriginatorOrg: citrix.com

On Mon, Mar 07, 2022 at 02:53:32PM +0100, Jan Beulich wrote:
> As was e.g. making necessary 4b7fd8153ddf ("x86: fold sections in final
> binaries"), arbitrary sections appearing without our linker script
> placing them explicitly can be a problem. Have the linker make us aware
> of such sections, so we would know that the script needs adjusting.
> 
> To deal with the resulting warnings:
> - Retain .note.* explicitly for ELF, and discard all of them (except the
>   earlier consumed .note.gnu.build-id) for PE/COFF.
> - Have explicit statements for .got, .plt, and alike and add assertions
>   that they're empty. No output sections will be created for these as
>   long as they remain empty (or else the assertions would cause early
>   failure anyway).
> - Collect all .rela.* into a single section, with again an assertion
>   added for the resulting section to be empty.
> - Extend the enumerating of .debug_* to ELF. Note that for Clang adding
>   of .debug_macinfo is necessary. Amend this by its Dwarf5 counterpart,
>   .debug_macro, then as well (albeit more may need adding for full
>   coverage).
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

LGTM, just two questions.

> ---
> v2: Don't use (NOLOAD) for ELF; it has undocumented (and unhelpful)
>     behavior with GNU ld there. Also place .{sym,str,shstr}tab for LLVM
>     ld.
> ---
> I would have wanted to make this generic (by putting it in
> xen/Makefile), but the option cannot be added to LDFLAGS, or else
> there'll be a flood of warnings with $(LD) -r. (Besides, adding to
> LDFLAGS would mean use of the option on every linker pass rather than
> just the last one.)
> 
> Retaining of .note in xen-syms is under question. Plus if we want to
> retain all notes, the question is whether they wouldn't better go into
> .init.rodata. But .note.gnu.build-id shouldn't move there, and when
> notes are discontiguous all intermediate space will also be assigned to
> the NOTE segment, thus making the contents useless for tools going just
> by program headers.
> 
> Newer Clang may require yet more .debug_* to be added. I've only played
> with versions 5 and 7 so far.
> 
> Unless we would finally drop all mentioning of Stabs sections, we may
> want to extend to there what is done for Dwarf here (allowing the EFI
> conditional around the section to also go away).
> 
> See also https://sourceware.org/pipermail/binutils/2022-March/119922.html.
> 
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -120,6 +120,8 @@ syms-warn-dup-y := --warn-dup
>  syms-warn-dup-$(CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS) :=
>  syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) := --error-dup
>  
> +orphan-handling-$(call ld-option,--orphan-handling=warn) += --orphan-handling=warn
> +
>  $(TARGET): TMP = $(@D)/.$(@F).elf32
>  $(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mkelf32
>  	$(obj)/boot/mkelf32 $(notes_phdrs) $(TARGET)-syms $(TMP) $(XEN_IMG_OFFSET) \
> @@ -146,7 +148,7 @@ $(TARGET)-syms: $(BASEDIR)/prelink.o $(o
>  		>$(@D)/.$(@F).1.S
>  	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).1.o
>  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
> -	    $(@D)/.$(@F).1.o -o $@
> +	    $(orphan-handling-y) $(@D)/.$(@F).1.o -o $@
>  	$(NM) -pa --format=sysv $(@D)/$(@F) \
>  		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort \
>  		>$(@D)/$(@F).map
> @@ -220,7 +222,7 @@ endif
>  		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1s.S
>  	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
>  	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds -N $< \
> -	                $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o $(note_file_option) -o $@
> +	      $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o $(orphan-handling-y) $(note_file_option) -o $@
>  	$(NM) -pa --format=sysv $(@D)/$(@F) \
>  		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort >$(@D)/$(@F).map
>  	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -12,6 +12,13 @@
>  #undef __XEN_VIRT_START
>  #define __XEN_VIRT_START __image_base__
>  #define DECL_SECTION(x) x :
> +/*
> + * Use the NOLOAD directive, despite currently ignored by (at least) GNU ld
> + * for PE output, in order to record that we'd prefer these sections to not
> + * be loaded into memory.
> + */
> +#define DECL_DEBUG(x, a) #x ALIGN(a) (NOLOAD) : { *(x) }
> +#define DECL_DEBUG2(x, y, a) #x ALIGN(a) (NOLOAD) : { *(x) *(y) }
>  
>  ENTRY(efi_start)
>  
> @@ -19,6 +26,8 @@ ENTRY(efi_start)
>  
>  #define FORMAT "elf64-x86-64"
>  #define DECL_SECTION(x) #x : AT(ADDR(#x) - __XEN_VIRT_START)
> +#define DECL_DEBUG(x, a) #x 0 : { *(x) }
> +#define DECL_DEBUG2(x, y, a) #x 0 : { *(x) *(y) }

Would it be helpful to place those in a 

>  
>  ENTRY(start_pa)
>  
> @@ -179,6 +188,13 @@ SECTIONS
>  #endif
>  #endif
>  
> +#ifndef EFI
> +  /* Retain these just for the purpose of possible analysis tools. */
> +  DECL_SECTION(.note) {
> +       *(.note.*)
> +  } PHDR(note) PHDR(text)

Wouldn't it be enough to place it in the note program header?

The buildid note is already placed in .rodata, so any remaining notes
don't need to be in a LOAD section?

> +#endif
> +
>    _erodata = .;
>  
>    . = ALIGN(SECTION_ALIGN);
> @@ -266,6 +282,32 @@ SECTIONS
>         __ctors_end = .;
>    } PHDR(text)
>  
> +#ifndef EFI
> +  /*
> +   * With --orphan-sections=warn (or =error) we need to handle certain linker
> +   * generated sections. These are all expected to be empty; respective
> +   * ASSERT()s can be found towards the end of this file.
> +   */
> +  DECL_SECTION(.got) {
> +       *(.got)
> +  } PHDR(text)
> +  DECL_SECTION(.got.plt) {
> +       *(.got.plt)
> +  } PHDR(text)
> +  DECL_SECTION(.igot.plt) {
> +       *(.igot.plt)
> +  } PHDR(text)
> +  DECL_SECTION(.iplt) {
> +       *(.iplt)
> +  } PHDR(text)
> +  DECL_SECTION(.plt) {
> +       *(.plt)
> +  } PHDR(text)
> +  DECL_SECTION(.rela) {
> +       *(.rela.*)
> +  } PHDR(text)

Why do you need to explicitly place those in the text program header?

Thanks, Roger.

