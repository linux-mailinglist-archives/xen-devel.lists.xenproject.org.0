Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0B2756657
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 16:29:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564636.882196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLPE8-0006Xv-0M; Mon, 17 Jul 2023 14:29:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564636.882196; Mon, 17 Jul 2023 14:29:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLPE7-0006Uv-Sq; Mon, 17 Jul 2023 14:29:27 +0000
Received: by outflank-mailman (input) for mailman id 564636;
 Mon, 17 Jul 2023 14:29:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVQe=DD=citrix.com=prvs=555fa4c0e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qLPE5-0006Ui-Te
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 14:29:25 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51deded1-24ae-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 16:29:23 +0200 (CEST)
Received: from mail-mw2nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jul 2023 10:29:04 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MN2PR03MB5359.namprd03.prod.outlook.com (2603:10b6:208:19f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 14:29:02 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 14:29:02 +0000
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
X-Inumbo-ID: 51deded1-24ae-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689604163;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=hvOqyatdiCgk7nvsXNlhH6UVzhaeOHf2sURXN/jW8vs=;
  b=Cjo5zpkxqkQKJVoPnjYsBJ5FML5raFWpsZOBNQfv6UPEQrxYSTVeo1ZL
   1fzinTkdxJRWtBmcA8RW0QcnPLSpuRJn3vUnsncb4ZN0pWR71wE61UEPd
   6FxbAJ4RmOGuGbVe9RQ71dP30TjitGk3oItXylkv2R1FOoq9o6pIVIZmI
   4=;
X-IronPort-RemoteIP: 104.47.55.102
X-IronPort-MID: 116897425
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:UTkfrq/agI2Bx7HGSOi4DrUDpn+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 GpJDWqGOfuNNzehc4oiaIznpkxU7ZDTmNcxG1Y4pCA8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks21BjOkGlA5AdmOqkU5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklK6
 tJGeB8tYCmegr6R3e+xZ+xqms4KeZyD0IM34hmMzBn/JNN/GdXmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUpitABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraWw3OqB95ISdVU8NY7vE+KykIhDCQYXHWDpP7oplS8Wetmf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpd9gOpMIwAzsw2
 TehndzzAid0mKaIUn/b/bCRxQ5eIgAQJG4GICobFw0M5oC7pJlp10qVCNF+DKSyk9v5Xynqx
 CyHpzQ/gLNVitMX06K8/hbMhDfESoX1czPZLz7/BgqNhj6Vrqb8PtLABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:wD9Ab6yvQbix3fn/gi+/KrPw2r1zdoMgy1knxilNoHxuH/BwWf
 rPoB17726TtN91YhsdcL+7V5VoLUmzyXcx2/hyAV7AZniAhILLFvAA0WKK+VSJdxEWtNQtsJ
 uIG5IUNDSaNykfsS+V2miF+9ZL+qj5zEir792usUuEm2tRGtBdBwQSMHfqLqVvLjM2fKbQjP
 Cnl7d6TzzLQwVuUu2LQkMrcsLkvNPxmJfvcXc9dmIaAFnnt0LS1FbieSLopCsjbw==
X-Talos-CUID: =?us-ascii?q?9a23=3AEkOjymgQ9K5hN+Df9vsxB34TTjJudmLzkif/A0G?=
 =?us-ascii?q?BFGM1b6DIQ3KV/r9uup87?=
X-Talos-MUID: =?us-ascii?q?9a23=3A2M7fcA0j1P28Gkn6qyXvG9TmKzUjspi8EUwjo5E?=
 =?us-ascii?q?/tcCqDSl3ahuHjjaOe9py?=
X-IronPort-AV: E=Sophos;i="6.01,211,1684814400"; 
   d="scan'208";a="116897425"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5RnHSANWcIxHKBTkTmYjQcpNaZcqsBbzx8z+SBeJaY5iKKAtcJJ3sEcWurGplwHC5OQegTop9T6ea51m3BiWKn8fxkj2sDA2Bphb+h+RdUW7nzcTqxZGdtvYVez2BvDX6+K5yL2y4yH4LeKq1+EXp8WSnDjlLrn4gYycTtJEslOJUfyKf+SAFljeOlbxvEFgTW8uM8h/xaEcBeuFHnYy37nGx6ObhxmQZrhlV+mjKBJQDwNLcXS5o+L6vBkm1ZDbgleP4nME7679fbMUVR77rIiyrLuD1c1LdlThMeZ+4OokCP+vj5htARoJrb8V5gVuQIC/I4P8LKa5w/3tvpG3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJ1w9wuX23Q+6WKucGQPqKdzXJcPHrWF0OGteN2yJD0=;
 b=VWDkBNj1bzHqK1NxmGd9nOt2tGLSEgwGjhBOC0PXk+GbS2uYcPpKm8m7R5orBrIrynLMoEkhrzJp2TGt5bJLccH4BeqTb6vcosH6gFAF17hIOTPLkFQCdjkOaxUcGXMCyGX9x+IDQjeQ5FOnkzLEpOFxT6qOaFhiHq2HSsOfZ37GgllAg8Sd/yCmIuyozNu4OUhmhSRPFz93tIgl9ocnwlD5uGvE6cBRjGpoAxDtOEVeYmARcS2E0Qi17VBcdAqZnn0qw/nGpUpIKtyL9MEIaD+FKuCle8P3DrOAaAOUKXEiU0BI5LlUnDLpiklU1hAbfKc3Y/Ck4l8Ad7mUPY4tTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJ1w9wuX23Q+6WKucGQPqKdzXJcPHrWF0OGteN2yJD0=;
 b=rw2dUE16sDjjcTUDPR98Y2W7GigZTJoSY2Ab0dr8S7uWb6dVQXVAZj32pAndMNPwZhJvj57bpWiHB7bVD0l9ENX//m7sz3UmJKdM998d8AQCFJnDLL7VTo66nfZjeEJwN56fniL1KxkncWEa6VizOJpnPLfceQHBVhmhe2983gQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 17 Jul 2023 16:28:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 2/6] libxl: change the type of libxl_cpuid_policy_list
Message-ID: <ZLVQJghZ-ZAIHeUJ@MacBook-Air-de-Roger.local>
References: <20230711092230.15408-1-roger.pau@citrix.com>
 <20230711092230.15408-3-roger.pau@citrix.com>
 <c4df983f-d53a-468b-8ee0-f6f4d048d6c0@perard>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c4df983f-d53a-468b-8ee0-f6f4d048d6c0@perard>
X-ClientProxiedBy: LO4P123CA0273.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::8) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MN2PR03MB5359:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ed7dc6-dc16-40a7-2f7d-08db86d2291b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Om47qhYKJrDBxlM3+sJA34vwfrkNnwDFlb+bmWrQgUTREidRvbGwJFIA/RJKYYl2AVC5W2rpq6kYk9HwlZfLxKZj7lHRqZ1LNgy7pXgWH6znmH8PYwlgjasJN8SzD8yPimYeG0FecG3FHV/EeAXoh2y2hbinxROF69fI8D+/PMmqYLQWQVluORIRrAfj1mGMVKM+Gy4OuwX9dd9Qe1jgRyi5ozeJn8rctZ9nzUDx46Zt574cnLe7Uxw/QKPGjDMUdW7Ap05STRgeq5rH/Fx1SlUomfagueF+PI952vEGnq7cnBZZwiH4xCSgugP7x3gZhTBUuuFnaGzd0mL3/B1RA765cP++OwbtHWKEvjuh3e2pXs2hVHmWE0YcxFuyeanps9OhDDXlHNCI3FUPqrGgUo4kdE0RvW3viP8b+ZjLUCTX/Bs68oKO5131/zLuDUPcSpyk8WID7r53Xq8wZtQJmjc9VWVLZxHwbBi6YAIm55Z7SuRRfV8KX3J1X+3xKLzmfjTH1Nic7WscDEpmIV8JBUCtQ0WIrm4UxRVbYBe8vfNlUzkHVgPIbFBzba4YQGPb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199021)(54906003)(82960400001)(38100700002)(6666004)(6486002)(41300700001)(478600001)(6862004)(8676002)(8936002)(5660300002)(66556008)(66476007)(66946007)(316002)(6636002)(4326008)(186003)(6512007)(6506007)(26005)(9686003)(86362001)(85182001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUM0V2xBbUlRNXRtZ0xvZTJ5ZkV4dzhqbnRBcG1TNEkrZzRhaTJEdktNdGhC?=
 =?utf-8?B?REt1Tzh2aEJ2UjFtQVIwSDNrRHY5Wk9zU1k3SnZObjdsVlJnZksyN3kveWZF?=
 =?utf-8?B?aE5HYStla29XTjFEUFVnVTFOMTE5Y3BuWXhnZkhUMkx5WU1iWFRLVEdFYU1h?=
 =?utf-8?B?MlJ5YVNraUdIRzgwTnVsZFNjNUp1SjZqVC8yUURlMWVMRnE0MDkrQnUwZm1t?=
 =?utf-8?B?QVYwQjBtVzhGSkFjRElaQTdxd2o0SStJdkQ4MXhJdHFxWGkxdzMrcnQrZXZs?=
 =?utf-8?B?LzVpY1h2NS9HeXJFRWtIVy9jZUNlb3JrSjJKNlNOTkl4bktObE1QM0R1dlZW?=
 =?utf-8?B?UzB5cGtOa2VmdWJXaEhoczhPQitsWldTT0x3RDA4M0RMNFZLZnFDVXc4Rk9I?=
 =?utf-8?B?ZUJrSXRYNXFHbFFWUFUrODhJcHMySHFCVWlCa05NOU5XaUxxWVF6b0szRWx3?=
 =?utf-8?B?UjNEQ3NUS1JnaU9UVS9iQ1ZUZUd0bFBIQUR5cUFIR0dtVFdBb3hWcENqYmZz?=
 =?utf-8?B?VHVTazNncTNwVTFWMzF0cjFsK21aS1JjdmlnakIzWHV6VWJZVWthbHl4TmVM?=
 =?utf-8?B?eHg5dEJ3TW1BZENCOThDaUhuWHhVbGNCelFHcHJDZXh1dktIb3hGd3VXQ28w?=
 =?utf-8?B?Y3czTjhyeFN6cUZzTnB5U29TL3BSWjJXTVFWd21wMFF4bW1yVnVqNC9LUExa?=
 =?utf-8?B?a0x4WUhSekZYaE40aURxeWpLcDZvRlFydVFydGVlM2gyMjY3TzRSL01VRFlL?=
 =?utf-8?B?eXIwc28ra1M2VlBtSWpKRTUxVGFYR1YvRUVZbHlxUjF5THIzWExIQXdBTSts?=
 =?utf-8?B?NDIxckdXQWs2ZDZyTnM2NHBvczF6eTg2c1A3cDdVR2h4eFpQQkd1WWQwWEg2?=
 =?utf-8?B?dUR3UDN1WGhJR3NFaEdJUk9SU3ZhcWhBUHljZHRzcVVpbkl2ZUw4VzRNU2FL?=
 =?utf-8?B?TVBwbXMzWER6WkNyek4zSWsyaWRYeitOT2lHVVB5RlNBYmd1V3FWTC9MREhG?=
 =?utf-8?B?YWFGRFlZNnR4T1l1V3Z6NDJieEdvWVJnQVIvVWpiWkJRazdWWjhGclF5K1Uv?=
 =?utf-8?B?UjNWNzRtL1dMdkdtMXM3eGFyd2pnbU81ckV2RmNkRzlSSHJoWUo0VGxWbnBl?=
 =?utf-8?B?UEpQWUlwR2VTZGl5SGJITEVGWEU4cE9LUW93RS9OTU1kcUd5S2dCZWhxQ3dD?=
 =?utf-8?B?bEVKU05hS2hReE1DMUVaUmtHZkhlbEI0YmNvZDhhbm52WVZPNCtreDArTlV6?=
 =?utf-8?B?aTVSMVdHVCtteEgxbGFBZVVQaW11a0xKYkdVbEIwR3FaMHFYZ1ZQQU9JbHJK?=
 =?utf-8?B?UnFXVURiWmdkWHhWcjFzTTRnRWZyZjJIcmVLYUxTNmFEVTJ0Zy9SWnVURm9r?=
 =?utf-8?B?czlKeUZtdmRGWkt0dWgxMVlGY3FlaXpWMXEzK2FFSmRHL3VYM3R2eElCOEhw?=
 =?utf-8?B?aVlHQjdLQ2tUZ0loVGkwWVprb0xlNWE1dzRhM1IvUzhURU01WFl2RjEvc2Ja?=
 =?utf-8?B?cWlBNU9OZ3hHUkpWQVFvc2dTSUgrUFdFYW14U2N4VGZBS2U2R2JhczVNLzRO?=
 =?utf-8?B?Sk52cnNoM2dKU2dWU1pROXVVcTVMbWJrVEQ0enZOWS8rcjB4b1pzWVhVN0pw?=
 =?utf-8?B?dHhqaG1Yait0N29qdVNTZDJvOFoxNk14VEJLWDN0ZlpuemRNM1NWL1NpdTdo?=
 =?utf-8?B?VllnZXpnY2JUTGpiUnJOU05xWWF2VjZnZHpLaGN0UXZNVVpBeFFxSERqWmI4?=
 =?utf-8?B?L3VKV0w0N3J1Z1JXdWRZSFNFaHRqZlE4MXJuRzdpMElZUmhhR1J2WG9DUHZ3?=
 =?utf-8?B?Wld5TjVmVVo0WHZFSmN5bjNPWC9iRms5elZnUkNrcHFSbStybkwvdzFFOTl6?=
 =?utf-8?B?Y0JGbm9WdDh1NFZtOWVLOGwweHFVUDJmeTZIamhENG5KVWh3cVNOVGVKZU4r?=
 =?utf-8?B?NzlacEc1T2cxWnJ6eUxCampEOCtBMkhqMEFZcGhPR0FmeHFwOGZWM1NJTFNr?=
 =?utf-8?B?dEozeW8xbGpENzNtRUtjclByeVlOMWNaMTgzaTk4UmNzc2d1NWR0UWlvK01z?=
 =?utf-8?B?SENWa1V2K09sN25hTUt2cW8vUTNDbmJENkNqYy9xeGRnRmhCZVU3U0kwdnI3?=
 =?utf-8?B?ZU0rOGZYOFFBR2JVN01nekI3ZUZLVlBFZWNubFZ0d3ZURlZlWkpRMlEwK3NU?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mBhISW3v0hLpjtQiyz44wGCYRm8STGdKoC2/ykqmdILTWWggrvEm4881KhIrdofZYr3910DI3MiPDfaCCzMutpJ/jv5j1z8fLHBrfCDrmiFO3JTjLtMI87iZ9EyJXCtUER5owwj6pqypdkJ+0qkV/4qcVJXo+05GAtYmVNj5vek/kmZTK9GRgWSzX3dczk3DEOVfTQ9E2t4pXo3CcpMalE+SMOx99iQlODK4UPPNrvLysx9okH070Q/yfj5x/lBM8OE3GV3jw3mnwPAZJ3Ig2N0/CsrsIyv0RH3V3l0UqCO3q3gcsWwZr8zuGUmqFSNE9iqOYsvWYH823mFDJ5ttIv7BJ9PHWudcM02yrfxmdv3+l4u1ES/VNNpuwD4WxcOD11LvBgwxmcvurxlT8VIzHWLt88Ac8Myldg2wqNdLoaHW75jhPfMozPUF6WlzKNPenAF/Wp2tRVmLkdtGRQwJECSgsjBDfzYOB0HGo5oAXDNg8wB675hFq4O2D3j+zNhH9gT7GbcREfCEtYAPj2drzab7ef1QIlXt82yZ7s9CMC2GrVKcrEmTAbHwgQxAOo5dVMmREgJNw1teAnf/YA0lNbc7f+M36fOvJi0jvW13n/axWw7y3vaOYziAvrTr9BZiX/HSvUtaSuAL9cVG3sohYOX60aWucn2L9RLKVf1xgZSvrLfCWMwY1Yl+ehXX3QlaFc5lxLVhscfyv2yRlXAi3X65lPNOBJf4fErBS4u8gvfM3ru3sd/guDqJXroKqBbKGs+XiDoNXUbPudhD6bMohAd1kiF0LwCjEP7v87t2+G8XS+AY/jLM50y3oLrUvgb+
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ed7dc6-dc16-40a7-2f7d-08db86d2291b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 14:29:01.9967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJUNl3k38P7Zq8hLautBUmw49ZzuSHUCmC449HmUSE+WxE4pQ8K/cWaAVktXBTNIS8oUJdo9btxoBilU69i+KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5359

On Wed, Jul 12, 2023 at 05:02:03PM +0100, Anthony PERARD wrote:
> On Tue, Jul 11, 2023 at 11:22:26AM +0200, Roger Pau Monne wrote:
> > -void libxl_cpuid_dispose(libxl_cpuid_policy_list *p_cpuid_list)
> > +void libxl_cpuid_dispose(libxl_cpuid_policy_list *pl)
> >  {
> > -    int i, j;
> > -    libxl_cpuid_policy_list cpuid_list = *p_cpuid_list;
> > +    libxl_cpuid_policy_list policy = *pl;
> >  
> > -    if (cpuid_list == NULL)
> > +    if (policy == NULL)
> >          return;
> > -    for (i = 0; cpuid_list[i].input[0] != XEN_CPUID_INPUT_UNUSED; i++) {
> > -        for (j = 0; j < 4; j++)
> > -            if (cpuid_list[i].policy[j] != NULL) {
> > -                free(cpuid_list[i].policy[j]);
> > -                cpuid_list[i].policy[j] = NULL;
> > -            }
> > +
> > +    if (policy->cpuid) {
> > +        unsigned int i, j;
> > +        struct xc_xend_cpuid *cpuid_list = policy->cpuid;
> > +
> > +        for (i = 0; cpuid_list[i].input[0] != XEN_CPUID_INPUT_UNUSED; i++) {
> > +            for (j = 0; j < 4; j++)
> > +                if (cpuid_list[i].policy[j] != NULL) {
> > +                    free(cpuid_list[i].policy[j]);
> > +                    cpuid_list[i].policy[j] = NULL;
> > +                }
> 
> This looks like a lot of work. We could just call
> free(cpuid_list[i].policy[j]) and that's all, as cpuid_list will be gone
> right after the loop.

I wasn't planning on changing the code, as this is just indentation
movement, but will do.

> Also, please add {} for the second "for ()" loop.
> 
> > +        }
> > +        free(policy->cpuid);
> >      }
> 
> Beside some the coding style pointing out, the patch looks fine:
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks, Roger.

