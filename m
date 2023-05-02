Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE166F4005
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 11:23:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528394.821485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptmDq-0000vi-0C; Tue, 02 May 2023 09:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528394.821485; Tue, 02 May 2023 09:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptmDp-0000od-Rj; Tue, 02 May 2023 09:22:57 +0000
Received: by outflank-mailman (input) for mailman id 528394;
 Tue, 02 May 2023 09:22:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OyLC=AX=citrix.com=prvs=47975177b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ptmDo-0000jF-P2
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 09:22:56 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8d30504-e8ca-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 11:22:53 +0200 (CEST)
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 05:22:45 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MW4PR03MB6348.namprd03.prod.outlook.com (2603:10b6:303:11f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 09:22:43 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%3]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 09:22:43 +0000
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
X-Inumbo-ID: e8d30504-e8ca-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683019373;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=KCDk/0A8ZabYB6hXuyuxQS2zkZwTzSsysD0WyLMx1Tw=;
  b=VWf4lLapOIvDzCKx1+Vd3ij4fAS0zOnmp7uudB5BF23R6v60bK89Z4vK
   YzLChJIRjYvST0Lnqd+gWXgmJn3pUbNl30JpkwXE425fNApkRiukTwJq/
   z5f02g0406sUkOWQj2dJaRz+rsTAthHayZ0CbZR/TAAEFVHZ0IKBfYN6/
   I=;
X-IronPort-RemoteIP: 104.47.59.176
X-IronPort-MID: 109990342
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4m+MZa3wP7j/nkcxJ/bD5fVwkn2cJEfYwER7XKvMYLTBsI5bp2EEm
 jQeCGzQOqyLYWP0fooibYi2/UNXvZTcm4Q1QQZopC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+XuDgNyo4GlD5gFmP6gS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfG2tBy
 OE8dykxbzPYm+3s6ZyddPlAr5F2RCXrFNt3VnBI6xj8VKxjbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsi6Kk1IZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13r6ezHugBNh6+LuQ1681rhqa4HQqCzoSW0qnu8O/qhS5cocKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZjxLZcEitcQ2bSc3z
 VLPlNTsbRRwtJWFRHTb8a2bxQ5eIgAQJG4GICMBEw0M5oC5pJlp102RCNF+DKSyk9v5Xynqx
 CyHpzQ/gLNVitMX06K8/hbMhDfESoX1czPZLz7/BgqNhj6Vrqb/D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:0SmS46NZuixqWsBcT7r155DYdb4zR+YMi2TDGXoBLSC9E/bo4/
 xG+c5xuyMc5wxwZJheo6H+BEDtexLhHP1OkPss1MmZLWvbUQKTRekJ0WKI+UyCJ8SRzJ856U
 9qG5IOduEZZTJB4foTi2ODfOrJD7O8nZyAtKPm6zNIcCkvUqdn6m5Ce3Om+o8dfng2OXL8fq
 DslfauYlCbCAQqh7+Adx44dtmGncTPiJXlJTYeHnccmXGzpALt0qf+Dx+bmjwDUzZDqI1SjV
 TtokjC/6C+tPP+7RfZ2wbonvJrseqk8MJHGMuPzu4KLTn24zzYHbhJavm5pTUop+Pq0nYG+e
 O82CsIDoBI8nbMeWPwmxf3xAX69z4r5xbZuCWlqEqmm9X9WDU5T/VMnphYdByx0TtcgO1B
X-Talos-CUID: 9a23:EfXYsm9gMpCVoNSATz2Vv1QeFf04ViLE8HbzeFO3U09HboOFZXbFrQ==
X-Talos-MUID: 9a23:iSJOBQY0mwiBSuBTlm6zqnZrEt9R4IOqBlERi68Am5ODHHkl
X-IronPort-AV: E=Sophos;i="5.99,243,1677560400"; 
   d="scan'208";a="109990342"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0U0ilJDWosDcWjLN/xie8ZJzC7K/4HzRPuDd6ViGpiN2hFMsqob9BUPIP5qNRl1Yfz0NhuN5gVNlBnyMXkB8Yh7TISkYZcQQIu2+clV2Xq/0bmcZlGZt6HZFzzT71o4cQhH0/LY8WCwgBYi+AXKF7sGdk3iXRXKTFANP6HeNimrmkmQFfSdkcnnp0b3jE7nu2lVz7HECJvGUXQIgJnegi1IvB/RkuELgZxGBAexSttGK8cEQ57cNVAfQfuJJ8wXiyt4ITnQnjzoRrsiuQjmYdSH74crbYc1y4VXMx/bRiXx3I0XiDJ54/Kvpt3u2DrmmPceMTqKQKSsuzyu7ELv8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLYLxraJZq+IGvhK6ipB1M7FD/OD6TDsXKINBErQQ+o=;
 b=PpUcnT3/eM9DD4GHTPL4ILidlRrtk3Am01eCYUuGtdy2ko7DBDLG0lFmMhLGUYv1a+bMBGq+y64Gtu9YJpO8r/DyRuVDlO9oPLlKM+ZpzQuLSzYzOjwgclB/x2f0FguAj67U31caVNWmipJz+lsbTO9wpElesbbq85ReafMmWWMq3iyj+dGSGAbK5gRlgtA5xMFUnV1PGh6FwIWlzxvPcnCQg17XbelIQGJoXCGChLGk45N7MQO498GhJk9CwSmgMwjJlm+n5wqZD7KSPHL3Yn1cvwDIV5S6aGD8S3w3qKgNqu6EURyfRZJv/P0097VMGwm3D0tVXcS7uhu3CaMgMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLYLxraJZq+IGvhK6ipB1M7FD/OD6TDsXKINBErQQ+o=;
 b=Ii9WJTut60dHHnfrT60yM5gipP6tkkijMUWqNjda1jKpTNKoS0+uJaVXSrvsmnY9GC+r/iWg+aT0Uwwj5Z3rl3Pn5FOO2nQLy7VIaB8GfupC3zCrsXLAFmmJ5IJABuD02rtar1xwf4fAz9SzSfXlzuvjF2BXVwQURQYnrACHba8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] x86/head: check base address alignment
Date: Tue,  2 May 2023 11:22:23 +0200
Message-Id: <20230502092224.52265-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230502092224.52265-1-roger.pau@citrix.com>
References: <20230502092224.52265-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0229.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MW4PR03MB6348:EE_
X-MS-Office365-Filtering-Correlation-Id: 1797c685-169a-432c-c6e9-08db4aeec892
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O+4GvYXoQJM46MFGq81QyV6z4VrDr1ddsGQ75IPSBQu1Bp74mpFBxC9VURMw50728U/vejmdkVsK4jBTq83DQf4dHnTtZmUShpg7G7MHebVa3XJGy6RV64GIEFScYBvaIHPa9XKLzTM1KXr5s7ZU8X9MINBGnSGMt/CraK2RdcLY2R11VY+b2tXQOqX0EJ+Yuz78isxGK682E2MHd5iFymjF+uKXjQwCTUjnXH5uoNN82JGGYQCubA69tVdbttiFR/AJDS9z8XorHQabCuJ/W/YCKa6MeK+vQXfCFjkQisRSbggngNy3ySlAj8SCYT9ManB4klZbuqg0gilIMxrYKrpbTQu2enzD6ZEea4ArGGUf6253d4DzytIFny8bJzET2qa/5KnoPsfFRH4AdwT1OjRm54JnbNY1kBAbJPMsZ/Sqz/d5ugCfTezOZ0yEDrBYXSMhP2nXcTf/Eak419MtLdubLX3PCQIojHKERcLvfmpLPfLt+9mHaMBE9oGkPq1c98Yk9/aRMl9SF6nByKMB7IOCIfLEpMbimjqvnI+UKKMgKI3wTD2VeHzCx2M3TU0T
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199021)(83380400001)(26005)(6486002)(6512007)(6506007)(1076003)(6666004)(186003)(86362001)(54906003)(36756003)(478600001)(2616005)(82960400001)(66946007)(316002)(38100700002)(41300700001)(6916009)(66476007)(4326008)(66556008)(8676002)(8936002)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0RJdldZbktFNDd0QWYxQ1VWNzhpMDJWdzZUWExQWGptbkNiSCt3VlY3MlF3?=
 =?utf-8?B?OC93endHWnJEYlZ4ejhNdy9ucXdEaDIySmN2c1oyVi9MUjZzNzBjVUtIN3hv?=
 =?utf-8?B?Y1h4SDh3NUZWV3FMMm9tZ3EzT01FNjUzTDdPY0ZjSHdJcW9GZ1BEbVlnOW12?=
 =?utf-8?B?L3prUXlNeEo3SHNndVB4MnNUY1VObXJSb1BlQjFUdUw3cXpReS9XcmdRQWNG?=
 =?utf-8?B?aStvV2p4NVNaN2pnbm9Fd055WTdLeitJdmpFT05NMnU4UkR1bW5PRHRCMVFt?=
 =?utf-8?B?a0JURVp4VTZ6TjRBWFF2RjdBY0dlbm5tUk43dklIRjVkRi9YZTR3QTVTcit0?=
 =?utf-8?B?cFlyZmluZGtob0pDNXRlRWw4d09ZaTVQdDNFMmpNN1o4UWx2eCt0SGRQb1NG?=
 =?utf-8?B?dGo2dTRvZzlmWFBNOEVnLy9XbnJiU0t4ZnU5MVZ3U0QxenVNenJyRmtxcDVk?=
 =?utf-8?B?c08zcmpFNGRxQ3J4NjROK2lBRk9pVTEzM2pNVWk3UDJGN1RQQlpidGwxWTE5?=
 =?utf-8?B?RFFMME1oUzVud1JqTjVMeEtQNHNqbHZPVEt1bmU4azRYeWp6OGR2V2E4eWhr?=
 =?utf-8?B?ZEc3alF1N0Mzb3h4Q0NwTkRKQ2tWYmR3OVpLWVNKbjQ4ZDR4RDZrTU9RL0dx?=
 =?utf-8?B?MGZITUVIb05mODhVd21qZEdoOEVyWnFJOHNCaTdQRnFDeFl4OFoxZkF2Q3Nw?=
 =?utf-8?B?RWVuM1Y2TEdZWHd2Zm1XU09QUzMxWFFUSzJuUGgxaE9EY2k1dEFPTWZQRmtq?=
 =?utf-8?B?Zzl0Sld0SjNLZldxa3dnNzJraDJLK0ZGSGZEYXJ0MmdsOHZEYUVzZGJ5MEVU?=
 =?utf-8?B?V1ZTanNOQnkrR2FXVlRwSzcydkpScGh3NHpUSlpQcmttUjlxOHNCdXVPL0g0?=
 =?utf-8?B?eGhCbzNvV3QvUGZKMTFlaVpnaUZIQWtMcUJYa1hENGQ1MmhQcTUzUERJM0NP?=
 =?utf-8?B?RHMrQXJ2WjJaZnlIbDA3K0I5L2NwME1FYnhTbUVSdkRlSjUrK3FJUGlQOHZ6?=
 =?utf-8?B?QlBMRzVsNGtuZG0xR3JQb2FlR2V1Q0lMT2Y4c0NrSWxtL29KSUVScjQ4d0VZ?=
 =?utf-8?B?NkhKYS9FMHlaVGRBNGdrWW9FNkZLOTAzdlJUL3JHNjFCeWZxLzZFRXZWWVFy?=
 =?utf-8?B?WGo5cVBaN3crNG5FeUI1ZDdlQWxNdW1PSXlnbkI1S3o1RkFxVUplaU1sREVE?=
 =?utf-8?B?NFNDTHBHNlkyY3FYUFd6bW1xMXBnT01DSkZxVDFab20yN0M2UHB3eEZiNkps?=
 =?utf-8?B?bXUzSlFlWWZFMUFKcmpMVUJHRU9tc1ZzNEd6a0NodnBCMUpESDNLTkl5ai9J?=
 =?utf-8?B?cGtqRXJkTG85WjBOTW9rSkZWMmZKdGlGc1NiOHJiMzdMaXI1aXRHNzRYRk4w?=
 =?utf-8?B?Y0lyaGptWEM5Z0g1Q3E4Nmk5TGVuUDg1NU9ZTTViRVZFZ0djcG85NWp6UXVF?=
 =?utf-8?B?NjVNbyt4dUViSDIwZnpsdXVkVzJEUTQ4aVdYemF6TC9NQmFEQkpOT3VNVHJx?=
 =?utf-8?B?aVdlaG9HRjJMYVhzc1gxVGNITWFwc1ltNWl3a2FLZ2tRclpqUE1zZ2lKU1JJ?=
 =?utf-8?B?RTh6U3NibldHQVpmeU5UV0FTZndYQVVaTGsveXhzVUhmOGNsVEk5YWsrT212?=
 =?utf-8?B?b2UwQnRWQ2JZME9GOXI3MG1QbXRnUkpiM3c5Yis1ZzVUVFN0RjlWc2VmalBG?=
 =?utf-8?B?MVpzcXFoZ0hnaHZyM2tvNE1KOG11VlUwSFhXRnhiZEZJZ2Y2R0Y2V25vWHJH?=
 =?utf-8?B?MGZzZXI5SE1oU2hHS21YZEZ3V1RHQUx2cWpleURpZ2w0RHVQM1Rlb0FZakdP?=
 =?utf-8?B?cVZDclJGaG9yNDU4M1ZRWWpwbG0zdGMwYW9zaHlEdFhyT1pUaGpUUXd3NW5k?=
 =?utf-8?B?NUxWa3R3K0N4YXpNYXJiZ3lKdXhHQ1VTTnY4Sk5zR3pKL3pXczRHQ3lPbWFQ?=
 =?utf-8?B?eWZ1UEk4SVJ3RDlCb2pRU3pzU0lnSk9XMUNZaXVQSnlVWWJOaUtPRjhJSFJB?=
 =?utf-8?B?RjY2Y09qMjYvU2ZpTmJLblBTQksvdU9vNmRUTWJRQUVKSUFrbm5rSjJ5ampO?=
 =?utf-8?B?My9JdWI2NERZbS9Wb241bFZ2VmQ2TjUrQ3dlaXdnOEpucXFxcnNEZjJFSDB1?=
 =?utf-8?Q?qsv+0ijMYTguMPbTnsAmXu5Fw?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CicFLLOOzW5DBHm2mp76zNtJNAHpJJGRvQsBmCg3mpmMw1EgXrmw0iEc30SB1OGxq/7SGTtLDV8UQp8AZsAMhTx5XNmVecygd4gRmpfk5+/zKAYwS2nsUH6EOHRaZpzo9lbavvclHpa0v92phvYPQQkVkTmKxKc8ZL7B9GQWmZ7Ol5ze3UE+lQjfwEbqbY3UzbHtGm9KspIB7A3jQt6xRFmXENLTaxqr3hadW1KHax0rg5jrb2osCW65Zu3hnbvC045eG2FE1dNrtvQnn967/m5kdenV9/Wg+tKlOrUOutdM5pgPnxFXmb9l0Ob/i+OD7dr5eWTxfoLX2Drem3A2kIfhwhOcS5XlCZzfrY8MdsCFGhKcARs6YYtwqabPvLZyezOz293pGbKHHUYBDcCpKCFlN5Nf3NQXJiZlPnsIFLIHWpyKb9y7yoaP2k48//VOoLg+9NO1hN828Gf4QONO1yTKM8Ozq8L174XXYYQBM+NOZnHWyOyKMjYgGWFzYuPj44ESkkhmpIh0iOgwmt6aONBqvaGyy0lSeKbzjwH91hNLFO+8LB5xsEuYZCNr3PAAFBobsk8JsfnrQcjHtIUF3HWCioTaX7wYhpo6pwJXNqh9HfFBBeduoV9m4eBTpIDaKY+uBspPkcmfiJV1NFS9EJ8SOM/+0QmhfvTJ15zeytNfU62yrnbc4iTCDgY/GtjUoxlm05ixLulQlOzgA3UEUcu+L008NxPsk8FH6iHpakyalQQWShsWAN+MscmlhWncRyQVQdMXmXX+GG2pD9N9gLRLESdYMG//WLYkgBv7TDrYxP5w4HtniPtLFv5J+teT
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1797c685-169a-432c-c6e9-08db4aeec892
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 09:22:43.3618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9fs8zdPV0c8QrTHn4LxWf/ivDerT69E0d5JZYH65023SADAyWTdXBt6Anf6saefWdvVxgrrzfFuwFl6CWs9Q5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6348

Ensure that the base address is 2M aligned, or else the page table
entries created would be corrupt as reserved bits on the PDE end up
set.

We have found a broken firmware where the loader would end up loading
Xen at a non 2M aligned region, and that caused a very difficult to
debug triple fault.

If the alignment is not as required by the page tables print an error
message and stop the boot.

The check could be performed earlier, but so far the alignment is
required by the page tables, and hence feels more natural that the
check lives near to the piece of code that requires it.

Note that when booted as an EFI application from the PE entry point
the alignment check is already performed by
efi_arch_load_addr_check(), and hence there's no need to add another
check at the point where page tables get built in
efi_arch_memory_setup().

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/boot/head.S | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 0fb7dd3029f2..ff73c1d274c4 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -121,6 +121,7 @@ multiboot2_header:
 .Lbad_ldr_nst: .asciz "ERR: EFI SystemTable is not provided by bootloader!"
 .Lbad_ldr_nih: .asciz "ERR: EFI ImageHandle is not provided by bootloader!"
 .Lbad_efi_msg: .asciz "ERR: EFI IA-32 platforms are not supported!"
+.Lbag_alg_msg: .asciz "ERR: Xen must be loaded at a 2Mb boundary!"
 
         .section .init.data, "aw", @progbits
         .align 4
@@ -146,6 +147,9 @@ bad_cpu:
 not_multiboot:
         add     $sym_offs(.Lbad_ldr_msg),%esi   # Error message
         jmp     .Lget_vtb
+not_aligned:
+        add     $sym_offs(.Lbag_alg_msg),%esi   # Error message
+        jmp     .Lget_vtb
 .Lmb2_no_st:
         /*
          * Here we are on EFI platform. vga_text_buffer was zapped earlier
@@ -670,6 +674,11 @@ trampoline_setup:
         cmp     %edi, %eax
         jb      1b
 
+        /* Check that the image base is aligned. */
+        lea     sym_esi(_start), %eax
+        and     $(1 << L2_PAGETABLE_SHIFT) - 1, %eax
+        jnz     not_aligned
+
         /* Map Xen into the higher mappings using 2M superpages. */
         lea     _PAGE_PSE + PAGE_HYPERVISOR_RWX + sym_esi(_start), %eax
         mov     $sym_offs(_start),   %ecx   /* %eax = PTE to write ^      */
-- 
2.40.0


