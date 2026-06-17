Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UksIIjEtM2q3+AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 01:26:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F40969CCC3
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 01:26:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=kWe43PmR;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from list by lists.xenproject.org with outflank-mailman.1340717.1601528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZzdU-0007TB-VV; Wed, 17 Jun 2026 23:25:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340717.1601528; Wed, 17 Jun 2026 23:25:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZzdU-0007QK-Oj; Wed, 17 Jun 2026 23:25:32 +0000
Received: by outflank-mailman (input) for mailman id 1340717;
 Wed, 17 Jun 2026 23:25:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <matthew.brost@intel.com>) id 1wZzdS-0007Pu-4x
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 23:25:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZzdQ-00APfu-7B
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 01:25:28 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <matthew.brost@intel.com>)
 id 6a332cc9-2eae-0a2a0a5409dd-0a2a450b86ce-30
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 01:25:26 +0200
Received: from [192.198.163.9] (helo=mgamail.intel.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <matthew.brost@intel.com>)
 id 6a332ce4-212f-0a2a450b0019-c0c6a309480f-3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 01:25:26 +0200
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 16:25:24 -0700
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 16:25:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 16:25:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 16:25:23 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 16:25:22 -0700
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7200.namprd11.prod.outlook.com (2603:10b6:208:42f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 23:25:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 23:25:17 +0000
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
  t=1781738726; x=1813274726;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=PUP8Xk+POfnNk2DPSMVRsnCCdejbOoDjfDUaMs34lQQ=;
  b=kWe43PmRUwsjRGP+o4PfSN8zTYfObmc+ErYT1vDxXpQKSZ4Dxq5RjZQU
   ajYT60TgqlS6TkJ+NrpDBmv+uTv5oiD4qJIoySi1LYsRZCgaOLEWqWBhj
   PWDJ0GYgJ5f8tEn8L1OBXm6bGXgj9Yf2NKY5jRDu3FeSiqsSHCX5b/O3+
   NpSDoxUaHDr8auSHkcxKeKYXC7CrF0TPUlQaCCQ2SQZRtNm3p7hnRAe1k
   2/d6MoWGzrFfMO27UB56NCpHWOOALvb38hRKKxS+3k/HklBtMR4jD9zFF
   0tmlUUNcyX3lKPjb0CZrslrwfsMzQOg6L3Kd7TdIvGA8E9QphsGApX+Jt
   A==;
X-CSE-ConnectionGUID: fzLviaLUShe9AvNGOAl4nw==
X-CSE-MsgGUID: GvVJB9FiTcSQQ4Wuiu7rfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="93214573"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="93214573"
X-CSE-ConnectionGUID: +zCGc8uMQyOLj+AjpNldgw==
X-CSE-MsgGUID: 8fnz0ggISM+3HxF3heEHFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="250092492"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HDlDXxLDyg6taO52RczRUc/aTCHULCCg4cRmEjYenp4cj79hf1aJAnSm/7FthWRH24/1AKJV9mSdTlKv0FGPRweS7fT6XctBuvR6Mg7CdPPxzmcsP+/N+h2hu6F2DbKVBLBYg/689aar6RPtRJQS6PlZlZl3rnBNh8FBC6xGHUJ1VXy5PIElXcShxUk7B2/gn5BzxCibCgR1ju4ZQ5mKui+czYvokfKgdw+a0GeU3aJMNNmaK6tJdhJQSF9EmpBG3nVE0wB8sRqUTjgt5ku4KwWz3GigU7C63BMncQPow60FF8qI5EpV4PHVhCuhUZel5H3tLP08MVjR3CxmKaxYxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BG3A3CkzGTMuen7COKjcQq3v9Bpnh/ScFfSKda4UkQM=;
 b=bJdo9W99fI8PfQUIMSwL/v8bLU6y43gBuZ1GetIEVRoGseIlw1LKuvudAR76hgCs/Hymz8crTij2mR3dhYPGuVoLn/ZbediBGeYklm0ajly4oBBHe1wBnYRJ4N++eTl+NCWWJXqAbtoDr89r3GlfkAtwtIt7HdoTV4FKPK1hwn83CMvsEmRx5Nb7cDEuQAhl9OUxcW0WWjhfcNFtupzy3ilYXDG5KV2JH58rKJy8/iFGm7pYHF95SX32zeWU/L8LS78Ct6b2NRkOQKIjQLwsMLO0RBtCBXNm3yy5HdOf3A6w2n0xAWjN0DSAkEF6zsDFRyVHkX5m3OldPc/Dk3POUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Date: Wed, 17 Jun 2026 16:25:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>
CC: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, xen-devel
	<xen-devel@lists.xenproject.org>, <intel-xe@lists.freedesktop.org>,
	<jani.nikula@intel.com>
Subject: Re: Graphical glitches (not refreshing?) with Linux's xe driver +
 Xen 4.19
Message-ID: <ajMs2lkXmTppifK7@gsse-cloud1.jf.intel.com>
References: <aYtznP_tT6xNPwf-@mail-itl>
 <aY3ttvtxGCPTNgsj@Mac.lan>
 <aY58-gyarcVoBS2a@mail-itl>
 <aZ3KoSlIzru0Uumu@mail-itl>
 <aaVyKFaCSuhJufW2@mail-itl>
 <ajMD0Jsml3ytlWOY@mail-itl>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ajMD0Jsml3ytlWOY@mail-itl>
X-ClientProxiedBy: MW4PR03CA0065.namprd03.prod.outlook.com
 (2603:10b6:303:b6::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7200:EE_
X-MS-Office365-Filtering-Correlation-Id: 61520303-c59a-4b46-ba9b-08deccc7b0f2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|56012099006|11063799006|5023799004|6133799003|18002099003|22082099003|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info: pw/hwjn541NH/hgmDNmpI32jgm33DbA+8xpFUnKHQuRiVxOoBcr4C94jokd/NjKdjr4mnXIh+zFllRJ2nfUW52ZYitCBNDlPiUKy9HYbuGSqTy0x/uBbeeAftfHBPvZiwjI1MMAGGKXpaxYgVHdBONBxKRoqP1vctYhxijT5zCMNJHV1/YycUHED+Qpfe6Bl9aDrXmlIz11hMzcyelgMFqOrGAab4SVkdXV5zLfZdYG7yjlpB0Ldwe99Id+ZnVsncM8XJMzVGQ1DNhy/OX7Q5jvAsB1NQM/3bwrqPnWZOua4g/mgzib3DUnxEBjk09ePhDHbmkSmIdldk38qET9iWAdNyw0y1kNRtiS7EwcMYYx56bWajhjLStNSkhp+j0HhtI+s/83/fTceLO8fzd3r2L7u0SWh7aNKk0a5GrAiHp4WVu5aVQjgOvEmgVuFW6Lq8LESwnLEFpiRDnix6ZWMEiqlr7f6jSF3LXw70t49y8d2M6iagssj+DlQwxwLcT3VG4U8KziFlXdcR+haKmeTcnpGABMUxyO6WbN5YvOk53w04NcEOlLp4rR+KAYxggU8t2mVnq3T/CcgwvrnlmOx44ax8cYrK8qO9bmc824u6Z0j2dLJZaB2g4r0JIogRySwz9vK5jbg2VjsHlYAFDsuuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(11063799006)(5023799004)(6133799003)(18002099003)(22082099003)(3023799007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?lAstnVsl+5iCN9g5Ao5R61mo+mNtgWE0q9W1PcIfFbED/uls/UJQbeneqi?=
 =?iso-8859-1?Q?fEjTB0yMWT0LmMPW2rzhGfE9BQeUKtVCx0j1xGvcoNXAsgvlB8XUhIQDeE?=
 =?iso-8859-1?Q?3A2VauIalTOZqYxrM7PY7i9S/IKdw5awo1srpib2KB659ht1gR4XiVxewU?=
 =?iso-8859-1?Q?K320IMJqy0Mm0FabgIrH2l7jQGt1jRsl/OQTYw6iQng30fGFIeCKg821tG?=
 =?iso-8859-1?Q?XI7cIzB3RW4O0cmaBnSA27zNUs59bsfXkBjgn7QlETdjlzwmPf6oqCJNgH?=
 =?iso-8859-1?Q?m+rKgvMK//yxjNi4nxBXvO0Va+24wz7+Tb/AO568GWuotKg6hmymgwCPGT?=
 =?iso-8859-1?Q?YOi4c4n+24fZRmRAoOkMYG4LDQV40WXWcha+r/iIthnKUROlPi+CYfCDA8?=
 =?iso-8859-1?Q?s12xhk6Gv6L/q820d+z9ZZv3fcoD5sdC4Q7xkXbwsXar4YfZUj3hgNmitX?=
 =?iso-8859-1?Q?WAurjmKG6fMU9v4ZMbPkCHY7a6D6p6zQm+VLhC5+WDpoCtmDM8xyulT6E5?=
 =?iso-8859-1?Q?eIYUSAnW6wO8qFq4usb9ylEZkRSry7OlpL9XMzJ2FPp40/qyQrfgC+nkQh?=
 =?iso-8859-1?Q?Hqjg1RaW/Cz9BwEoVeplU0HQBaLwhlDoDs83bU57UT6D2YjILPyEvtX19e?=
 =?iso-8859-1?Q?1xAUOae/ISP+n7VvJ8dhOBrdtKKe2tiz8Pp3/cU3tiHhJQE+DaoEAxugg3?=
 =?iso-8859-1?Q?pCXAAO/jAk0ku2rEVOoqNYfSMgoxYY0wHaRl0bkeXsaccNnWim1l0of187?=
 =?iso-8859-1?Q?afXze7Q8PsLGtg9d0tRDpZC9P76ycp4cnnzuUh+i4dPPp8MiWJRWJkeVUJ?=
 =?iso-8859-1?Q?hU7TxUxXMnap8yUrAZZJqo2Pk2ScORpwfZk4ogC/jxbEZlLixkTiQjLatW?=
 =?iso-8859-1?Q?RpU88z0rn4YxcddARoGNQ6oCYUTMlYVdjeaSd8oohDbcGVc4F1qoXo4ICj?=
 =?iso-8859-1?Q?nK2tljVde1ZWP/Dv2ovTLbn5v4DizHdn2SIsaAWXbQ+EFRpjPjAnhyNUkc?=
 =?iso-8859-1?Q?H5WGwdyBek4LIBlQgbiVwwXGmvkVyLXy+Zpd3BTpELpKOdE3zu9r7HNToZ?=
 =?iso-8859-1?Q?k2vQxiBIpoNxaq+HWqbdMd1MB8ILKHO4YsuNiExmzxNwWLFSWQmzo5cBWE?=
 =?iso-8859-1?Q?Lzx/aE0DtpiZ7blczNhYcHgUxwpT8TkQpnoIyp6n5AVysAHH2aravJgOj/?=
 =?iso-8859-1?Q?x+zMQaBzbdOY4BZVjac+qKmB49YX6tjG25Jy6XNUpJJDcoqEeclrE3bgfh?=
 =?iso-8859-1?Q?B0efOATR7V2QiEEeJP1EX/4hX0BNW3yDCINrejiPPoMyV24/yTU7Hr+Nv8?=
 =?iso-8859-1?Q?xKsH3232YBUPURrm8UsfHUHB2xnRyeyDNFeKPMZ/ZYnJzUQ2GlFbBaBb/O?=
 =?iso-8859-1?Q?DnpztGggBzRMU9bgGwEuHjr0VJG4BwAsgqt/JQJ1PTX54cNWwQ3lB4fCn3?=
 =?iso-8859-1?Q?SHMrwqGAj+S2KpZQJBicSIpaWRL1NHv2U5uoG4PK3ZLMPXaahvUzfLUjl0?=
 =?iso-8859-1?Q?v7JFDwVGDKB1Taj11Lewej4XjcDTUwnDI1bRijMMXkmkkioDuD7UoSy9l3?=
 =?iso-8859-1?Q?rTaFzbvvi3X7ZvLQ8+nLwyAhzdgcFD08AuH76oAZ2Letgvw+QTl+RlSEIQ?=
 =?iso-8859-1?Q?2upxnmvuUYYK2hkCkOUK38MrgZi4lvTrjMQ23SwSAhS9foYMN/Bqmr9w04?=
 =?iso-8859-1?Q?1kY5lMOkC6pJO68HdeALFl1bDgXyvP9Vb8uPRZDiKrieTu1KI7AywkY1TD?=
 =?iso-8859-1?Q?O46r62CDvQAJMB2e78n6NQBImzo6Aonr/SfR/fC9VBvdGIGpg3jTQu7wdA?=
 =?iso-8859-1?Q?TmwwrWDjUw=3D=3D?=
X-Exchange-RoutingPolicyChecked: ldPGRdyep0hIlDFA+C4EN5V7KVBz4kJXY+iNHUCODg7cWtN3Q8CGAmZIzYSO1Cx0a3rcYHIXyy3YpQUIwD50sHQ7wRz8+eDT7xhvPvjNE08mIHJVsUwGvo/43yKZRO9Djag5/UcZumWdmgD4XYRhP+jxzockF/R4h/XRraEB5tUfg3U+IcZFNlVK53CYr29oLnKF/cyY1EdC8nkwpx4701KGDe7bvyRZfW5xdU1ZNrnW/lh/faJ2wGGc0FerR1M8FelJXusZy5737x5WyMMikw+R7569lE59R00DgUIpQXPVTsOk+fc3H7rTP6qcJeTYBvrZmmSMuRP5W3yUoIKX2g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 61520303-c59a-4b46-ba9b-08deccc7b0f2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 23:25:17.4276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +vW9/dQpAScRBISoBNuN63pP1rFHcKScuhNSfwrz/XeNlXZx5FVNurQOWZ96iNk8LO7VNQcWpjW26iIoSj2NkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7200
X-OriginatorOrg: intel.com
X-purgate-ID: tlsNG-42698a/1781738726-21D85F3B-362221A7/0/0
X-purgate-type: clean
X-purgate-size: 8146
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,qubes-os.org:url,gsse-cloud1.jf.intel.com:mid,gitlab.freedesktop.org:url];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:intel-xe@lists.freedesktop.org,m:jani.nikula@intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[matthew.brost@intel.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[15];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F40969CCC3

On Wed, Jun 17, 2026 at 10:30:08PM +0200, Marek Marczykowski-Górecki wrote:
> On Mon, Mar 02, 2026 at 12:19:04PM +0100, Marek Marczykowski-Górecki wrote:
> > On Tue, Feb 24, 2026 at 04:58:25PM +0100, Marek Marczykowski-Górecki wrote:
> > > On Fri, Feb 13, 2026 at 02:23:06AM +0100, Marek Marczykowski-Górecki wrote:
> > > > On Thu, Feb 12, 2026 at 04:11:50PM +0100, Roger Pau Monné wrote:
> > > > > On Tue, Feb 10, 2026 at 07:06:20PM +0100, Marek Marczykowski-Górecki wrote:
> > > > > > Hi,
> > > > > > 
> > > > > > Recently I started testing compatibility with Intel Lunar Lake. This is
> > > > > > the first one that uses "xe" instead of "i915" Linux driver for iGPU.
> > > > > > I test it with Qubes OS 4.3, which uses Xen 4.19.4 and PV dom0 running
> > > > > > Linux 6.17.9 in this test.
> > > > > 
> > > > > Not sure it's going to help a lot, but does using a PVH dom0 make any
> > > > > difference?
> > > > 
> > > > Ok, now with the correct Xen version, it's better with PVH dom0. At
> > > > least on the login screen and few applications (from both dom0 and domU)
> > > > I don't see the glitches anymore. I can't do a full test, because PCI
> > > > passthrough doesn't seem to work with PVH dom0 on Xen 4.19 - and I need
> > > > it to start most VMs.
> > > > 
> > > > So, if the above test is representative, it's only about PV dom0.
> > > 
> > > Some further observations:
> > > 
> > > 1. My initial impression that Xen 4.17.6 is not affected is false.
> > > Apparently I got lucky and didn't waited long enough for glitches to
> > > appear. Unfortunately this means I have no way to bisect this...
> > > 
> > > 1a. Updated test procedure - either:
> > >   - start Qubes OS in full (including default system domUs) and try to
> > >     open an app in one of them (for example file manager or pdf viewer)
> > >   - start Linux up to lightdm login page, log in, log out, click on a
> > >     few lightdm menus (session type selector, poewroff menu etc)
> > > 
> > > The second version works even if toolstack version in dom0 doesn't match
> > > Xen version. If no glitches are observed after doing either of those
> > > procedures, assume it's good.
> > > 
> > > 2. Xen staging is affected too. As well as Xen staging-4.19 without
> > > any qubes patches.
> > > 
> > > 3. After enabling CONFIG_DEBUG in Xen, the xe.ko fails to load firmware:
> > > 
> > >     xe 0000:00:02.0: [drm] Tile0: GT0: Using GuC firmware from xe/lnl_guc_70.bin version 70.53.0
> > >     xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: load failed: status = 0x40000056, time = 0ms, freq = 1850MHz (req 1850MHz), done = -1
> > >     xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: load failed: status: Reset = 0, BootROM = 0x2B, UKernel = 0x00, MIA = 0x00, Auth = 0x01
> > >     xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: firmware production part check failure
> > >     xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: Failed to initialize uC (-EPROTO)
> > >     xe 0000:00:02.0: probe with driver xe failed with error -71
> > > 
> > > CONFIG_DEBUG is the only change between "xe.ko loads fine but there are
> > > glitches later on" and "xe.ko fails to load at all". Full console logs:
> > > https://gist.github.com/marmarek/47b5e62a2cdbae6678c2aecc5283cd3f, there
> > > are 3 files:
> > >   - CONFIG_DEBUG=n
> > >   - CONFIG_DEBUG=y
> > >   - CONFIG_DEBUG=y + iommu=debug
> > > 
> > > 4. Updating to Linux 7.0-rc1 doesn't help, for example:
> > > https://openqa.qubes-os.org/tests/168119#step/desktop_linux_manager_create_qube/11
> > > 
> > > Generally, it does feel like a bug in xe.ko, but I can't exclude some issue
> > > on Xen side too (especially given point 3 above).
> > 
> > After waiting some time (Linux 6.19.5 this time), Xen CONFIG_DEBUG=n, I get some timeout messages:
> > 
> >     [    8.122120] xe 0000:00:02.0: [drm] [ENCODER:204:DDI A/PHY A] failed to retrieve link info, disabling eDP
> >     [    8.148476] xe 0000:00:02.0: [drm] Tile0: GT0: Using GuC firmware from xe/lnl_guc_70.bin version 70.53.0
> >     [    8.803845] xe 0000:00:02.0: [drm] Tile0: GT0: ccs1 fused off
> >     [    8.804208] xe 0000:00:02.0: [drm] Tile0: GT0: ccs2 fused off
> >     [    8.804556] xe 0000:00:02.0: [drm] Tile0: GT0: ccs3 fused off
> >     [    8.822426] xe 0000:00:02.0: [drm] Tile0: GT1: Using GuC firmware from xe/lnl_guc_70.bin version 70.53.0
> >     [    8.827140] xe 0000:00:02.0: [drm] Tile0: GT1: Using HuC firmware from xe/lnl_huc.bin version 9.4.13
> >     [    8.829478] xe 0000:00:02.0: [drm] Tile0: GT1: Using GSC firmware from xe/lnl_gsc_1.bin version 104.0.5.1429
> >     [    8.852923] xe 0000:00:02.0: [drm] Tile0: GT1: vcs1 fused off
> >     [    8.853513] xe 0000:00:02.0: [drm] Tile0: GT1: vcs2 fused off
> >     [    8.854090] xe 0000:00:02.0: [drm] Tile0: GT1: vcs3 fused off
> >     [    8.854706] xe 0000:00:02.0: [drm] Tile0: GT1: vcs4 fused off
> >     [    8.855310] xe 0000:00:02.0: [drm] Tile0: GT1: vcs5 fused off
> >     [    8.855904] xe 0000:00:02.0: [drm] Tile0: GT1: vcs6 fused off
> >     [    8.856495] xe 0000:00:02.0: [drm] Tile0: GT1: vcs7 fused off
> >     [    8.857079] xe 0000:00:02.0: [drm] Tile0: GT1: vecs1 fused off
> >     [    8.857675] xe 0000:00:02.0: [drm] Tile0: GT1: vecs2 fused off
> >     [    8.858272] xe 0000:00:02.0: [drm] Tile0: GT1: vecs3 fused off
> >     [    8.975881] xe 0000:00:02.0: [drm] Registered 3 planes with drm panic
> >     [    8.976586] [drm] Initialized xe 1.1.0 for 0000:00:02.0 on minor 0
> >     [    8.980882] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
> >     [    9.033754] xe 0000:00:02.0: [drm] Tile0: GT1: found GSC cv104.1.0
> >     ...
> >     [ 1218.319232] xe 0000:00:02.0: [drm] Tile0: GT0: Engine reset: engine_class=rcs, logical_mask: 0x1, guc_id=3
> >     [ 1218.319890] xe 0000:00:02.0: [drm] Tile0: GT0: Timedout job: seqno=9883, lrc_seqno=9883, guc_id=3, flags=0x0 in Xorg [3245]
> >     [ 1218.320736] xe 0000:00:02.0: [drm] Xe device coredump has been created
> >     [ 1218.321140] xe 0000:00:02.0: [drm] Check your /sys/class/drm/card0/device/devcoredump/data
> >     [ 1222.285626] xe 0000:00:02.0: [drm] *ERROR* [CRTC:88:pipe A] flip_done timed out
> >     [ 1232.525685] xe 0000:00:02.0: [drm] *ERROR* flip_done timed out
> >     [ 1232.526280] xe 0000:00:02.0: [drm] *ERROR* [CRTC:88:pipe A] commit wait timed out
> >     [ 1242.765717] xe 0000:00:02.0: [drm] *ERROR* [CRTC:88:pipe A] flip_done timed out
> >     [ 1253.005696] xe 0000:00:02.0: [drm] *ERROR* flip_done timed out
> >     [ 1253.006248] xe 0000:00:02.0: [drm] *ERROR* [CRTC:88:pipe A] commit wait timed out
> >     [ 1263.245599] xe 0000:00:02.0: [drm] *ERROR* [CRTC:88:pipe A] flip_done timed out
> > 
> > The glitches appear much earlier, though.
> > Would content of /sys/class/drm/card0/device/devcoredump/data be useful
> > for debugging this?

Yes, it would. Jobs hanging can be a bug anywhere in the stack (e.g.,
Hardware bug, KMD bug, UMD bug, application bug, etc...) but the
devcoredump would give us some hints.

> > 
> > Full log at https://openqa.qubes-os.org/tests/168813/file/serial0.txt
> > (warning, almost 200MB of those errors...)
> 
> The issue still happens with Linux 7.0.12. Current log (quite similar to
> the previous one):
> https://openqa.qubes-os.org/tests/184602/logfile?filename=serial0.txt

Hmm, the 'not started' messages in the dmesg are a bit concerning as
this really shouldn't be possible to trigger even if user space is doing
something wrong.

Can you file a gitlab issue against Xe here: https://gitlab.freedesktop.org/drm/xe/kernel/issues/new

TBH, I have no idea if running Xen / Qubes OS + Xe is something anyone
at Intel has tried out, so please include instructions on to how
reproduce and we will see in someone on engineering team can take a look
at this and if issues in Xe KMD exist, try to get these fixed.

Matt

> 
> Not long after GPU errors, nvme driver fails due to full swiotlb.
> 
> Any ideas?
> 
> -- 
> Best Regards,
> Marek Marczykowski-Górecki
> Invisible Things Lab



