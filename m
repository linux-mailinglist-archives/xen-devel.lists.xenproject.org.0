Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2/TdFOOgK2rBAgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 08:02:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A16DA676D7D
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 08:02:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=TjbEeQwh;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from list by lists.xenproject.org with outflank-mailman.1336334.1598120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXuww-0002oT-HH; Fri, 12 Jun 2026 06:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336334.1598120; Fri, 12 Jun 2026 06:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXuww-0002lZ-AX; Fri, 12 Jun 2026 06:01:02 +0000
Received: by outflank-mailman (input) for mailman id 1336334;
 Fri, 12 Jun 2026 06:01:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <oliver.sang@intel.com>) id 1wXuwu-0002lC-EC
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 06:01:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXuwt-000XzX-D4
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 08:00:59 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oliver.sang@intel.com>)
 id 6a2ba086-bab6-0a2a0a5309dd-0a2a4501b75e-28
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 08:00:58 +0200
Received: from [198.175.65.17] (helo=mgamail.intel.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oliver.sang@intel.com>)
 id 6a2ba097-c1f2-0a2a45010019-c6af4111cacf-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 08:00:57 +0200
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 23:00:55 -0700
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 23:00:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 23:00:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 23:00:54 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 23:00:54 -0700
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by PH7PR11MB6772.namprd11.prod.outlook.com (2603:10b6:510:1b6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 06:00:49 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 06:00:49 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781244058; x=1812780058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dXOxR4ijc/NsObkBbhOn9bAZoyECT2/85YxXHngYXzA=;
  b=TjbEeQwhy10iakpDZ4NbFSD7R3e40yLZliMnJiVfPih5JXE1LzYwZSCz
   GEdV/ckXtEkFqpii/tfvYEf+hlVYEnoMyNURp2NVJAXoP6cNN0GZW2iEq
   04MTKAga7PIji61AlFSvSuTb6eiw9HQqdP/dRocg/5yvGnLi10xWPy8QQ
   3BB3tqPtPRpBR71wUYckXyJM0v41jhCUbRGXe2LsOOm8oDiowB/R06Fns
   gm6qsBj2yLO6K/jxhcDrJD38Yne7S8d+/KEdPXdTxiJO6Pe7Xr9TO0sdd
   hPp2U7dMOdwcbt9EGtDt0mTfStrxD+E3rY1QMo9gi7AAGU9JCKgDBvHgc
   g==;
X-CSE-ConnectionGUID: 0rq3TSInT7yTXJTn+5Bc6g==
X-CSE-MsgGUID: u1k9dFDiTNuJmQxoX5Zlbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82077022"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="82077022"
X-CSE-ConnectionGUID: kovWFWvnQS2bWXbQroeznQ==
X-CSE-MsgGUID: 9WF6MeTnQUCEiLuc8JBdSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="242602709"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J1MJvtS2Lg+uRhghw01/yzBDU9mRQ777nxaVL4+HB+s6CbPMJQKABqK2U1bNvsvSzr7snMGA/I9slEvaNXooRNVgTNURve0zVXVtDz7RHPFuK/+FhWglWxDkA3egKKBshSyHB4FWx3u2w7G1ufhub51ub9MUlNBEtKnZ95YBzbmHsKvR5pW0kE80n94w8lTZwkuRIp/3aJH4PKKb/oS/ILeSCQCYDHJf2NU9LBb+gy56oIsnwkcUx7Cevw1aydfEPla9W3FhqT/wwexAiUYV8gX5Rl0/n+NlUpu2BV21wAHZKYfMq9TjVJnRa7RztuGF8bmcqDsMca9nMOj+uqroBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkGhTXsPVJpbYXK8iN6N9ZJWNSb3tIKDqmbH6yviAqw=;
 b=E/zfa1m18EWOIROoPMxafJkg+3mijI/yM1FF+sYP3/CG1CJqH1vrZFhs+syOQTSz7c+iLiEXO5VvacOniyiEc5ofwo03C3zPhdaVXLNVLZRLpKXC8gCWrJcMzWFuMOI/i1nhHVuwDiWqN/QKqyCZvYpLq0a590r1ly2E+NVZ9qg0Yl85jtLviO/7MLpbDMjfwc+STKpUSKUDAf9ReS834aSBkAxTWTbflM4GsxKBqLyK/vOeWo0TvygBRHK07xFtXLli4Sx9iy9R25abTQICm2j8q7FrPIpGgA747SwrjeBnjyqArgeJrq6AxXePpnYTvREk31MrMas3g6gFlWWKzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Date: Fri, 12 Jun 2026 14:00:39 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Michael Kelley <mhklinux@outlook.com>, Radu Rendec
	<radu@rendec.net>, <linux-perf-users@vger.kernel.org>,
	<linux-hyperv@vger.kernel.org>, <linux-edac@vger.kernel.org>,
	<kvm@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
	<oliver.sang@intel.com>
Subject: [tip:irq/core] [x86/irq]  2b57c69917:
 lkvs.thermal_test.sh_-t_check_pkg_interrupts.fail
Message-ID: <202606121325.97b29701-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI2PR01CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::15) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|PH7PR11MB6772:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b5c27c8-68b8-4cf4-7b9f-08dec847f3d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|18002099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: gkICd+ioPGUqdYTqehXlP0giMg7kewVKczEJe0ERMpSQfSiVyQi6qCewiHd4QTwEkDuf082Zix+BFMK0oDMzE1NXvfitTJF4/hd9z9dSFfic9PZI9thFLf3XPyc8iBPLuMlarmtaO0/eWexuljDRtLL5pwwv6AjannQ7+Khxdb0IWuNjfQFZzfYndOy27VkpyCUFfW15FcB8oxEHeGYWfStrQsHAKcb6ROnoS+KlIL6/+A2a07TSfM5AKr3vbt8TMoB7ElOjZKcvS1s13nrqG6KOPvL0eyrsBbsrygJUlBQR3l/oGoLf7rkLR1W93iTzJr0J7RSZ/ePhMSXvIyYbiq+WWdwEysGwXSFHr9fT0RsqJM1hYnHta0IVQdzJtzn+CDDa9PHo9SlbKmN1lC8Y8AuD/becNofCLgGbAt4awXE2kcD6wfn3L/ew3mlV3F0IH5BmJB3gFQCmaC1nurJ2Wu2iojnX+RZ4QLt3eZvAuS/JIVJDcvv92+00XjXPsy/NvMTBuiT7SRljmihgAsoMXB+D4eJge3f9a8J+QtW/4LFu/jfSE94wfo9Z235r9WTC1l0TC8t/vFJJYT4fpItQLikRvkQQwq8H9WPhOFXAlR+WT8fDT5z/GPHUaNJmCj88/0ujasbfSXR2fFKnvyeQVAAdl3WEYuITJSaCscIlsov4yP8M4t5vMHXIR6Hrte425GM8oXrr9Z3zkCX6LDErsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(18002099003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dgZ7CG7VOAcusUztYCTY3o9WUMnMch8TCh+tdFzI6P8teQ7cZUtTAakuD99C?=
 =?us-ascii?Q?y2G0D6+XBws0sFoeyGypc5cOLIjlCObmvDeCuhqLUe/PhqCZfVlwfr3EREKN?=
 =?us-ascii?Q?N7NacnWroetqBZ4kne8uUu/KnPn5JtAzcveut1LtB7QwsTJuLVI+n46dA9dq?=
 =?us-ascii?Q?8ayZOpbMY38738CHdL5zLlsph6kpnb6cpV5+OPEDsJZ9uC7MpPCSDIF5KO4V?=
 =?us-ascii?Q?l5rLdbXkq8CtvMPnRMyZl6tR9cQ8kul+nRNZgGPUt5t/pasPiYYbISEnpWcR?=
 =?us-ascii?Q?nOMajLrIDT/ed7Boadv0MQR2yeKSu9yVf/uLQhX+dbPcMMJ4apb+eVD/A+H7?=
 =?us-ascii?Q?AmffFcP+OCxF38ZJ9tB25nymTZ8qM2/QYnE2Jvvb087Dg7c5stPbjDJS2mcZ?=
 =?us-ascii?Q?2QQqZ/IBhB1VX1VmgaYg25v9GI2FxZQ958Do7hEANa1Oc0aoPgOHCMz4Q2Hk?=
 =?us-ascii?Q?oRmw4q5HyD2eOwJZgMHCGpq7ZvRp6/DJFoBsBxlyvQjy8RfZ58PprsihnKMU?=
 =?us-ascii?Q?ir4K1isqdgpyBV5jMfFYvzsQVKc9pA4kDZdXX6Nd0PuykWZym8cHpmCLoGl8?=
 =?us-ascii?Q?HA87+MeNVMkK6Jtir7phd36DQuJCRKsza6821ndtQjMuOlcBGwlQlzxX620d?=
 =?us-ascii?Q?FoAe0Vut0IlfWejm3Ng6uoVyfiYDXPZV5hf2aSt4hxLzcax/4Ai9Xouylmth?=
 =?us-ascii?Q?aNCCKrgm8XPbBIHKbpw7teVkkDgu/U9mpXd7+BkSbgvvZaSBz6FvGeh03XcG?=
 =?us-ascii?Q?Jvx1jk52Akf4RtVwysGc71daOUkZkJh+JUSyrIyun7qhVVR0AO2HKl4BdpzQ?=
 =?us-ascii?Q?ZXxzRbKEhW6d+IpdevZ+gpIMi4AlwdS06F0G+ax6IxdUZQn07vFjm0tZwiSP?=
 =?us-ascii?Q?hmzodF4g0nKtzaMRqeHLSgOGplVNUT0eDJDYNMTFcGhyXhMKAF+Sxjj2aCjp?=
 =?us-ascii?Q?olxygTfN+p7dAmqKKVJ1RtkQtytZcyV3NcQ6wkBjQtTt9WC5kAYmF5sqnhRe?=
 =?us-ascii?Q?L/oSIfnU81TaEVB5SCACgC75QZIu1Kcn0Kh5mXXEB59ftXevjY1/bID6lTxc?=
 =?us-ascii?Q?IhpgfrTnCXak42vEepF9ZJwdgnW8PsA1a03OHVz3jBzmEfEmejnLwRtm5Ae2?=
 =?us-ascii?Q?7uNhVIiK1V3QT4EfF9J8P74XNd/lpKZyluUo7xQIfRxNMg0OoyNyhIiW+hE4?=
 =?us-ascii?Q?bbBu8iQoQxCQ/Ym7tvT8yAFo6t9XbotF4tqeKpeQEHL8AYnKxNc7oSu9PX+q?=
 =?us-ascii?Q?Jd/ybJgzSOrwx1KX5hM03Tccj2zfnMiKmxCKVUT1SB8WgJMVH0SaEFo/9nJT?=
 =?us-ascii?Q?iO8dtchWC3l7bSmAs5CaIX0eiMgmZsMeO++lnXzzucaf8HjEpwthPW960Q25?=
 =?us-ascii?Q?SwBWAfjzlPNxQTmVe4xX61TxQ5usDrVuJMLnh1+lsRVVfnwQpi45+Sqa4LaS?=
 =?us-ascii?Q?s/Xk8JJ04IBLPHg+qmUPYqHKgoRC3HSTH6Prct77EsViHxOPvop//5C/kAOT?=
 =?us-ascii?Q?JL795aIvKvj2F5BetlgC85D4DAwM1KEb2Eeer7DAJwXkD1yPRodknZNCa+h+?=
 =?us-ascii?Q?vMWCNKdZFnH7acQyYYWgKvjMbbUuH0pCMsVUx/cBmgoZjHO3IRqtlpQHCqGn?=
 =?us-ascii?Q?py7QhcCVjmdcrlrFXL0ckaT3dWJ6SZ2Pht0a7pho4O97rKbOZzGVem2ZEJ6N?=
 =?us-ascii?Q?4PoXSqBdwD+ZSwsxABM4FoJh5mEgKR0/wrEE5TshNs7J7Xl53ZRmSkFt8KjJ?=
 =?us-ascii?Q?a5wAsmY7Ig=3D=3D?=
X-Exchange-RoutingPolicyChecked: qAP9X6vN40Tnr0Nvx5573pbtEi6WbcBp1kXxp3y9hqRjOy7nA+N7XHHeTkl6PjclfIXOfjR/0lphlJAafsqWbD2zSOxQ/Vrnel3tc2gpC/3S5+CAya2i/1lUbwuWB88k+v/JDWmSdI+YnR7B/h7Cwo0tMLRe9YOfYCN2DrWYBTy//RQ3CAWr/3TePk4CV3LvWVhXzLfDIXpVXhXZH0hFR6jCsjOSroWhKWnmCLJ9snBfHQCBxmiU266jMtmbnt14EBsnzLsgGtFg8whf2tanu67A0Un6cRMPcSqMzZo3evVo6ZtCDoBtL8u17jYGLByPKzfPuTpeXvWKgbaOFVl3+w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b5c27c8-68b8-4cf4-7b9f-08dec847f3d0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 06:00:49.3861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4jhU4hUVB+5S1nU6lDyGY0ErDSPXOtyDwfidmHubdros6F2+nR9Hs62j0GmzowaekIWVM2waSZ/UE24ef4IQsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6772
X-OriginatorOrg: intel.com
X-purgate-ID: tlsNG-d62444/1781244058-ADD41FF4-17E5FEE5/0/0
X-purgate-type: clean
X-purgate-size: 2422
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.18 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:oe-lkp@lists.linux.dev,m:lkp@intel.com,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:mhklinux@outlook.com,m:radu@rendec.net,m:linux-perf-users@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:linux-edac@vger.kernel.org,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:oliver.sang@intel.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[oliver.sang@intel.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.linux.dev,intel.com,vger.kernel.org,kernel.org,outlook.com,rendec.net,lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[15];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oliver.sang@intel.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime,thermal_test.sh:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A16DA676D7D



Hello,

kernel test robot noticed "lkvs.thermal_test.sh_-t_check_pkg_interrupts.fail" on:

commit: 2b57c69917eeba3ee657f252257e37f31916ba2a ("x86/irq: Make irqstats array based")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git irq/core


in testcase: lkvs
version: lkvs-x86_64-388e0c1-1_20260521
with following parameters:

	test: thermal


config: x86_64-rhel-9.4-func
compiler: gcc-14
test machine: 512 threads 4 sockets Intel(R) Xeon(R) 6768P  CPU @ 2.4GHz (Granite Rapids) with 128G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202606121325.97b29701-lkp@intel.com


2026-06-10 15:11:39 cd /lkp/benchmarks/lkvs/lkvs/BM
2026-06-10 15:11:39 ./runtests -f thermal/tests
Next run cases from thermal/tests
<<<test start - 'thermal_test.sh -t check_thermal_throttling'>>

...

/lkp/benchmarks/lkvs/lkvs/BM/thermal/thermal_test.sh: line 177: 15994 Killed                  taskset -c 0-"$NUM_CPUS" stress -c "$cpus" -t 20
<<<test end, result: PASS, duration: 41.108s>>

<<<test start - 'thermal_test.sh -t check_pkg_interrupts'>>
|0610_151221.580|ERROR| common.sh:142:die() - FATAL: die() is called by thermal_test.sh:93:pkg_interrupts()|
|0610_151221.584|ERROR| common.sh:143:die() - FATAL: Thermal event interrupts is not detected.|
<<<test end, result: FAIL, duration: 0.786s>>

Test Start Time: 2026-06-10_15-11-39
--------------------------------------------------------
Testcase                                                                     Result    Exit Value  Duration
--------                                                                     ------    ----------  --------
[RESULT][thermal_test.sh -t check_thermal_throttling]                        [PASS]    [0]         [41.108s]
[RESULT][thermal_test.sh -t check_pkg_interrupts]                            [FAIL]    [1]         [0.786s]
--------------------------------------------------------



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260612/202606121325.97b29701-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


