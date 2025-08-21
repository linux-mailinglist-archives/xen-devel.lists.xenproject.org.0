Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF82B3031A
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 21:43:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089231.1446874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upBCC-0004Bn-EY; Thu, 21 Aug 2025 19:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089231.1446874; Thu, 21 Aug 2025 19:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upBCC-00049q-Bn; Thu, 21 Aug 2025 19:43:36 +0000
Received: by outflank-mailman (input) for mailman id 1089231;
 Thu, 21 Aug 2025 19:43:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZwFA=3B=intel.com=sohil.mehta@srs-se1.protection.inumbo.net>)
 id 1upBCB-00049k-O9
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 19:43:35 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dd330ed-7ec7-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 21:43:32 +0200 (CEST)
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 12:43:31 -0700
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 12:43:30 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 12:43:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 12:43:29 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.56)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 12:43:29 -0700
Received: from DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14)
 by PH8PR11MB7144.namprd11.prod.outlook.com (2603:10b6:510:22c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Thu, 21 Aug
 2025 19:43:26 +0000
Received: from DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::9105:2b7c:b256:7a6c]) by DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::9105:2b7c:b256:7a6c%6]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 19:43:26 +0000
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
X-Inumbo-ID: 1dd330ed-7ec7-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755805413; x=1787341413;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UezUvJD77DHHUtbqSHXmgIfV6qphTLEb2ZVO2HkrmhQ=;
  b=UDfxGK9Vo/yKoMt7SiRpdxOZhFfc5umoV3PiFhSgsyDAhcksMYh5bwDO
   vPmruBoTS9/kfzfkVwhNjL/JwMm5lLybE6OA9KdoPZWi5O6fABpmGyVsz
   9IrX/bNX80F8aQmi86QuZ2ilSy0Gh2AL6Ner+Rzv+JGkeLeRb7OcHlJZ3
   Ipo6i7MLov5M1aWGH3T+ZS0d+HmkxRVbPekKfdAwsRafj7+2Ssi2kRorC
   WUluV6QZdVR4y7CG9aBKmdkkkncioOkXe5k2cmJa6eAwDf76oV75wPcIj
   3j5Id5EamJbR52hw1iFn6NbwfrAxoM8Fe0/8xAn1p3zKNQnFwxjiPxtbF
   w==;
X-CSE-ConnectionGUID: 36ZheUruSWmzq3ppKMQgew==
X-CSE-MsgGUID: rbbSPIliR5WKDOO2K4p7Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="80705543"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="80705543"
X-CSE-ConnectionGUID: Gb2FbW09Q6ypg3XzdyPvlA==
X-CSE-MsgGUID: BIoRPSQ2R4K/3QvVASyMqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="172758982"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jrhG0DEOz5r+JbXrizzuogo9/yVE29CVk2kmMmUha9inyy8UqKTxd2NpRyKxmRhOd2uBYMAHSt/79RwuC4hJc7MypTplgjrSNAvdIKAUpuTlomcTcviDZ2C65H7q6+T5orr+MNGrCQpNKPTq0EofcYLLUoPg54EmP5us3vpJ6V5BSSA64rOmjlEVNDHlH21GGYAjs4lpS9rbxo0oxs+RH5sSJN61OGvSIMF4g5JQRDc8/rmthMRvwgjXBBGlILqVYWsBsck9SxW5MausQZxLppXcfSUNBToJRNJGEBolNiklK8Vvm9kw5jUFRA0EdPBpSC3rzd3G7YKk1jPFbz/T5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nr05bLjlWJosBkfTQyCNa3sUKJzs707uKsuVP3upeSw=;
 b=uyWqSnaoiloeCxu+2uEcX7RtDlPHnC0axbKl84gYeM5qgCOCntQ9JHgFbG4h6dIx5oIiiKU8ujAGGYxm03R+8GPK9w0EllUmqEGZeY/SV4Ko8DW0oeC/NkJdoZu+Iq98Few65F5stf3tpYZIJ4MzZRKz9MZacB9U2kjIeU5QFQwUtl8zEOeqOf2uE0RZkUcp5DNMw/tKT5STGNenYlLBh2cK1Uh9P8Q+99mYzPxCwQexP2RmJpzb0CspuoWvS0YSy4VOA0oka4xNKrGYZuIDhslg26wfRIgdjBfeg6MqOx5Uqw+o62XA4MBvWCeS/fPKGCIiJZIroniLfcmYNCu/ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Message-ID: <5f5f1230-f373-469c-b0d9-abc80199886e@intel.com>
Date: Thu, 21 Aug 2025 12:43:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/15] x86/cpu/intel: Bound the non-architectural
 constant_tsc model checks
Content-Language: en-US
From: Sohil Mehta <sohil.mehta@intel.com>
To: David Woodhouse <dwmw2@infradead.org>, <x86@kernel.org>, Dave Hansen
	<dave.hansen@linux.intel.com>, Tony Luck <tony.luck@intel.com>,
	=?UTF-8?Q?J=C3=BCrgen_Gross?= <jgross@suse.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, xen-devel <xen-devel@lists.xenproject.org>
CC: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim
	<namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
	"Kan Liang" <kan.liang@linux.intel.com>, Thomas Gleixner
	<tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin"
	<hpa@zytor.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown
	<lenb@kernel.org>, Andy Lutomirski <luto@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck
	<linux@roeck-us.net>, Zhang Rui <rui.zhang@intel.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, "David Laight" <david.laight.linux@gmail.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>, <linux-perf-users@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <kvm@vger.kernel.org>, <xiaoyao.li@intel.com>,
	Xin Li <xin@zytor.com>
References: <20250219184133.816753-1-sohil.mehta@intel.com>
 <20250219184133.816753-14-sohil.mehta@intel.com>
 <6f05a6849fb7b22db35216dcf12bf537f8a43a92.camel@infradead.org>
 <968a179f-3da7-4c69-b798-357ea8d759eb@intel.com>
In-Reply-To: <968a179f-3da7-4c69-b798-357ea8d759eb@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0168.namprd05.prod.outlook.com
 (2603:10b6:a03:339::23) To DS0PR11MB7997.namprd11.prod.outlook.com
 (2603:10b6:8:125::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7997:EE_|PH8PR11MB7144:EE_
X-MS-Office365-Filtering-Correlation-Id: b1e5e17a-ef84-40f3-b5a1-08dde0eafec5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlI3MmgvTWg4aDBJY0JSa21EZWxPM083M004WU1id0dmZVRoeENpTktnN1lq?=
 =?utf-8?B?TERXNmhFd3RBQXhYTE5KQTA3cmlSb0NFMnNNY2RCaDVhZTFnb3RJL3U5aTYv?=
 =?utf-8?B?N2VWdzdJdE9VT2xLaEUvRVVVTVN1UURuaDhhY2l1V0prQjlTOUhSUXpoRDVG?=
 =?utf-8?B?VTdmRHVJLzRCejljZjJoZVE3dFZ0aE1vcjJKanlnWE1qZVpOcm5IU3h4WkQ1?=
 =?utf-8?B?ZkJ0R0lqVUVNdkFEUGdRUUg5a0N3NTVDYVNyVXhjS3RKUW0wR2hzcUI2Y01P?=
 =?utf-8?B?eTVrN0dLditVbkhQdWRwL2xBWmlBM2tzK3FCeW5saFhidFlTV21IRDgxWUJY?=
 =?utf-8?B?MmpSWER2bWNXelRESE1ubmx4ZkR5Nm1YdmpkZzZEY0NBSWRKVEhoMWxCMFls?=
 =?utf-8?B?T0QxT2NoOERxdjFscjJ3ck9SYzA3VzN6YzJwa1REMld5SXQ2ZU9FWTZ3dnNH?=
 =?utf-8?B?a2pDU1Z3Mk92T0FvcGx6SnVldkxnQ0o0b2dLblZxNTJpZEJpakNtSHNXTnhm?=
 =?utf-8?B?ZVV1RGhwdktick4yQlBCNzVGamM1bkVaRFlUOExydXYySG93V2d2Z2p5TlUz?=
 =?utf-8?B?UVJqMW9RUE0yemRZOWNBUTdDOTVmMlFMSVlRSWFKazAwZmFjM2p6T2JXSm5k?=
 =?utf-8?B?NlM4dzlKUGkrNHZZMHE1TDZrcjNEd3lGVWJIWERXdmpGUVpSdHBlWEhtNGhq?=
 =?utf-8?B?ZVNwL25JTHZMOGtDSHFTSzU5T3o5d213VUt2a0JsSWEybHVPSDhJQ054elBy?=
 =?utf-8?B?L3B3blcybXFqOUpZbjJCRGIvZ3I3NDhmU1RNcjh4M0wzQlBXRmtkbDZ4dWpP?=
 =?utf-8?B?YU5sNTQ4OFJDQStGT1ZqU2tvRy9nbkhKK2pzaHdiU0hQSDJCelZ1RXlLQXBj?=
 =?utf-8?B?N1VDTkFhOVJ0TjJKbDQ1d1Z6OU9FdnNCMTNBTVJEZFVlaFVSbnI1cGNkQjNl?=
 =?utf-8?B?bXpuV21mMGlYVW95SW1wNmh4NGNkL3gwS3FNd2RxQVRZTy9uZzlyQ1NSQmk1?=
 =?utf-8?B?eWg4NUs3eW5lSnRKZHB5TEFURjYxbzA5Tmo1ek52b1dtWHhFT1p3WTZSTUto?=
 =?utf-8?B?Wmt4NVA2Ym82SGJZTjB5R09VMzlDb2dQckp6SVcxbHZRbG4vbitYZlpaVDFM?=
 =?utf-8?B?b3ZxTC84Mnk3YzhtK2RBb01CT2xtOERnQnhibkpLU2dZWVlmOC9JTFF0UHhz?=
 =?utf-8?B?dklDKytqMm5wQzFHTDJDM1hETjV4Zm9ockxNOXFOVnpmYnBSRWtLTm0yWnkw?=
 =?utf-8?B?OStrQzhDSmdEVGMzYkNCcE55RDlNcWoyRXhBZkZKQzdSNUxIU0JtL2pLRk1W?=
 =?utf-8?B?dWI0V25lSDZkWEVHeFNQckJldWpaR1lsYUlwUnF0Snh0QTV3YVFDcVBiZlhn?=
 =?utf-8?B?KzQ1cjJ3VnZpTjhPYlkzVTJVTHR4alBwc3dsTlFwcmxhanVzNVBOblIraUZW?=
 =?utf-8?B?WXplZExDMXhwYjhQSFNrTXFNbWRPeEc1QUlka0l4UGI3SW0ybkthbnBBbmJW?=
 =?utf-8?B?UEh5TlErTUEzaENBNDZLdmpOcm1DaGw2QnVGNWhQSkxSSEZjZGUyY2xUYW5F?=
 =?utf-8?B?TzA0ekc3STc3aWpycFJqeGRkaDBNTUhyRFo1THpSUmFrdzNyUmZmK1hqVmpO?=
 =?utf-8?B?ZHl5Y01SR0ZMV3FRL0RCSmRrUEF5UTQxV0RBa2ZjRTZiUlFLRnBNNkZ0RjFJ?=
 =?utf-8?B?WWxxdGtyb2NKekhlc0xlL0piVDAvWUlTZ1oyZ3pHRWZ1bCtEL2VrSHYvdnc5?=
 =?utf-8?B?VTlCNGgzOW0zRUkyY29mMS91YWJMcHZqWUdOSGF5V2phdXQ0ODljRTljd3Vv?=
 =?utf-8?B?eks0OEU2NUdKK05TTnpkNkQycmRGc2VOSS9GVHowWFFocGpnd3RhNEdES0Y4?=
 =?utf-8?B?ajhUYzlSVVdDQlE3ejJvODNMZW45U0VNVHRCZ1JGRXBNV0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7997.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGlLTUZrTlM0ZGdPSnY1RGFRdmI5YXJwWnd5M3Nsc2loN0xEWGpMS0pMMTVn?=
 =?utf-8?B?Z2s1Qm1OMWcvbGRJcTBiaUs5SVNicFBSamllYm00QVhrK053andCeVNjSGpZ?=
 =?utf-8?B?TGNXQUROZXcwZE5DUzl1YXVKWllwdXo3NkFlWG81SXdYTU5tcXUzOHR1WGNo?=
 =?utf-8?B?VEZIdHVpaTFkcG9zSTgrTzNKSTFPUFhPaDV0dW9OYmorbUNsUG9UOU1EV3E3?=
 =?utf-8?B?UzFHMDg2ek8wSkdHK3ZrdWtjRmZlRU1XS1dYd2Fmd2t0TnBwT043RmI5YkF3?=
 =?utf-8?B?aC80cHExVS9EdzdPa01wbU0rLzFsZGlPZnpDcVp6RzVKdjhHS05tWWVNSDRn?=
 =?utf-8?B?U2FOdVBWbEZvZ01VMlBONG9lSjRxc1BFTUxwRG5vai90NXQxWXoyU0R1MUov?=
 =?utf-8?B?WmdSQkgvREYrTzdVdzNsbms2OTJSYXNjQU5tK3Qrb1QwNjd1VFR3WDhkdWRn?=
 =?utf-8?B?YXdEOU5CQ2NQWUZBRmoyblNzM3BWT3RpZE11TFVNc3ZZK1MxS0ZaZGkwcUty?=
 =?utf-8?B?T0lQcXhCbEFGdXJwbDVTRVNTcEJkcWF5MFFuMEh3Wk1mTGVrYXA2T0VBVFRF?=
 =?utf-8?B?OVFiODRreEFzQ013Qnp0RWs0OVpRWTlWd1BlOWZWMWZvUUlmak9WKzJUOWFE?=
 =?utf-8?B?c1A0YUFyczVLYVhwZk5LVUtoYkVqakYxQmNZUFBDWkZya2ltcVl4dXRidWow?=
 =?utf-8?B?aWNvYmsrMVJBaU5ldmdHTlYrWHZEYWJtQTZYSWNGb2o0MXhqdlNWN093Ujhl?=
 =?utf-8?B?YStqRVJRZEZqS0JwbXFxZWNGaFBQeStweUFOOTZwUTFRWnFuOUpCbVVQL1FV?=
 =?utf-8?B?Y1prS3ZLcmpac1NneGUvNUVESkg3OWdja2E3NEtjbFRqK0crR09xUEM0ZDVC?=
 =?utf-8?B?UFVZQlRCS3NrMit3ZHVZbmtuNmJENFM1b3dJd2VBMi9yS21RVTlDMHc2clZV?=
 =?utf-8?B?bUxqWkc2NGY1clhDWkUzcDl1TUppSmRYOWZmZy9WKzRoSVRzVUhTaEMvV2ZQ?=
 =?utf-8?B?cFpwY0FOU2U3RjBrbEJUK2V5MEJCcWdNT0FkdzVMd1BIVndELzFOQ3owMU9r?=
 =?utf-8?B?R0lsRzZZTjhEd3RFalV3SG9ZVlJnbDJMcENVQlZOZllqaVk4ZFZKTEZOQ1Fi?=
 =?utf-8?B?dW9DRmVlL1k5dW1TaUxlTmZadmdNQmpzZE9wZ00xK21WbWhiNUFYKzAwK1lQ?=
 =?utf-8?B?QUluN0JrbzRFeTB4VFlnNmlsSCtVSUN3UldmTG5zcTJnSGsvcHJGcmJkY2wz?=
 =?utf-8?B?b3V0V1U4c1VnWThOaitydEY5cGRCdDJKSWRFWExGZUFuYm96OFp5aUw1QlMv?=
 =?utf-8?B?Mm1CYmJVR2c5Zk9DQ09hakd3YS9kVHkwY1J6ZVl6cmZkeW1paGpQc2VmRi9v?=
 =?utf-8?B?UUJ0UnErT0svcnRzL0IxcUg5SkxENUJMVFVqZUxFNnc4MzhOSzgxNlpVa0da?=
 =?utf-8?B?WmhFMzJrK0tPOWJkK21ibE9heUdCTVpjdFlaTXZDZHRzcTdpVnRSVTN4ampv?=
 =?utf-8?B?cExYV2JhK3haN292V3JOam9xTDlJRjMxOTU3Wk1MT3RXeEhnSjI1MU9iUTFH?=
 =?utf-8?B?Nmo1aVUxazhMU3ZaS0hDbVZmNHl0WTh6dzRYVHB3M3kxL3NhcndyajkrdUFh?=
 =?utf-8?B?U1ArT2YzaVpZYzNlLytqZjZpWXl5VGVoZ1FJOHhhN0lOYXNqVWFGUDQyemdn?=
 =?utf-8?B?clJEQ3dOU0s4bktGNWd1c1JrK0kzTW9uVHZKNE5XUFpwZ3NyZVl3TmxmU2Mw?=
 =?utf-8?B?SkFvaENmOWsza016cXZVR2pUK051MDBrVzU5eEtua2hlTy9wektTU2hmalZJ?=
 =?utf-8?B?Mi9iVjl5TU9iVDhTV2hjQnp6eHdDeWNqN1pPRlBrbnpZcVFGTmxJa3prbzEw?=
 =?utf-8?B?RU1ENkpqWnN1YVMybHoxU0RvVnpEZTVRRktyZ3RQWndpNTY4akU0aGVYcDZF?=
 =?utf-8?B?MlZ6Z05rL2JWMEM2dytpbGtqcElGTWRIZE5tcEVxa0dqaEdmMVZWVTg2YmZm?=
 =?utf-8?B?WlIrUmZuOWorT21PaEtJNlFCc2hSSkVHS3RSOVBaTWN1cWxOYmFZQnlJMkV2?=
 =?utf-8?B?RnB0SXNaZDA0VFd5Z25GYUd0M0xETGZ3SStEcnFEbkp4eXNlUnpGcDQvZVBy?=
 =?utf-8?Q?UKQ86GIGM4QR/1N5iZnosuhaf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1e5e17a-ef84-40f3-b5a1-08dde0eafec5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7997.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 19:43:25.9099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QOxDB1R5ZlkFuAaMst16OrsKaIUoLQTxPCG7I/NWPH5VAPo7snEPJMgAIZ27mDD3MnAkM8UtBUSAVYwIB0z3IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7144
X-OriginatorOrg: intel.com

On 8/21/2025 12:34 PM, Sohil Mehta wrote:
> On 8/21/2025 6:15 AM, David Woodhouse wrote:
> 
>> Hm. My test host is INTEL_HASWELL_X (0x63f). For reasons which are
>> unclear to me, QEMU doesn't set bit 8 of 0x80000007 EDX unless I
>> explicitly append ',+invtsc' to the existing '-cpu host' on its command
>> line. So now my guest doesn't think it has X86_FEATURE_CONSTANT_TSC.
>>
> 
> Haswell should have X86_FEATURE_CONSTANT_TSC, so I would have expected
> the guest bit to be set. Until now, X86_FEATURE_CONSTANT_TSC was set
> based on the Family-model instead of the CPUID enumeration which may
> have hid the issue.
> 

Correction:
s/instead/as well as

> From my initial look at the QEMU implementation, this seems intentional.
> 
> QEMU considers Invariant TSC as un-migratable which prevents it from
> being exposed to migratable guests (default).
> target/i386/cpu.c:
> [FEAT_8000_0007_EDX]
>          .unmigratable_flags = CPUID_APM_INVTSC,
> 
> Can you please try '-cpu host,migratable=off'?

This is mainly to verify. If confirmed, I am not sure what the long term
solution should be.

