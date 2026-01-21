Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Fl2Oy4KcWmPcQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 18:17:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AC35A68E
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 18:17:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210036.1521881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vibok-0001Ay-9c; Wed, 21 Jan 2026 17:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210036.1521881; Wed, 21 Jan 2026 17:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vibok-00017u-6l; Wed, 21 Jan 2026 17:16:30 +0000
Received: by outflank-mailman (input) for mailman id 1210036;
 Wed, 21 Jan 2026 17:16:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZBm=72=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1viboj-00017o-FX
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 17:16:29 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea45fbff-f6ec-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 18:16:26 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH2PR03MB8088.namprd03.prod.outlook.com (2603:10b6:610:280::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 17:16:22 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9520.005; Wed, 21 Jan 2026
 17:16:22 +0000
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
X-Inumbo-ID: ea45fbff-f6ec-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFpTqrYhsdbUQ9QB0upGA4uwLJCzEyim0Fu3PDvDHc6iKCMurnDkkCKvesUDoJDf6vJ341Oqspi+mDC+zc7vixPUGwNjUCxCPYPopV4M80MQ49KcmcjEfNBSctzt/aMwpEcEcksfU8VYhmk9y6LFIfMeN5iT8xpUM/JOEFaLKOqPE4qXT5YyOF+5EYxV8cKQ/AL4vxc/n6nDsRCKGg/CuNYtwhdPJMQMiSz+lsSMn37UBoZgQfxJKRDDzoHWREfy0CBugwWwhSecleEgwhjaKGHVp3OeCG4WCtKG24p1YDY1yK92WgYYDtS0BXkXmEiugkGkR4hV69l74e9HKWum4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLbjfQE4Klx8uy2BarYQguK2zlMlRWrgXo0OPhjiZo4=;
 b=V83xloAjqhcI87Mv/JABp/mo3WUDfV3GrcrNnhg6WFQE2qpjvXEAmnIrSUZEOcaOEpuPbhYsohlhvhupMlsShcCniMJRlW3CnxyhyjwaNRnI+FZdYBdqGK3jUhUU3qEMblTdI9n4FR6J9lw7Ci1pqZ8hEpq6rGKyewaJChzZo/E59fDeXY7UVaPyWJuLwlXmQzlzT9dFIwwTXfhH0T3efjgIZc5ZSJghsHUe8p+ilYBKDBLaiKvRl0TrbnmrPCUC/0/941bwjVTiVhGSWP59adVQsVwtjhvqYkwpH7zN+A3SCwsXEE02a9wGx4e4/iXErx7WGjGZAOoxntyk6PHgmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLbjfQE4Klx8uy2BarYQguK2zlMlRWrgXo0OPhjiZo4=;
 b=eeyyRaSA6A+fJ2nPF5DSVqdI/u9ccjdJx+a+7mIaT8WwKqu0R/97RLikjaIkIKJhSOZ5z1uLCvRBr6EUtYKGXbztsb20V3F8g9bg3AHCx2o63J2CjTru5Y6rR0tHVJqfLauM+c2FeunB62/7Pszg2aQp3/vP53FRurhWesxQxzE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 21 Jan 2026 18:16:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] symbols: don't omit "end" symbols upon mixed code / data
 aliases
Message-ID: <aXEJ4jGCLVCG1q6U@Mac.lan>
References: <9dc297d2-08f1-460a-b513-91deaecbd2d4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9dc297d2-08f1-460a-b513-91deaecbd2d4@suse.com>
X-ClientProxiedBy: MR1P264CA0022.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH2PR03MB8088:EE_
X-MS-Office365-Filtering-Correlation-Id: b6182846-20fa-4bd8-d7ce-08de5910cc94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0FLZVl0TkZaMXVpck9PZmt5TUhUeGVsZDVzSVlXMHJ4YWlUMjFaMFhkZWk0?=
 =?utf-8?B?ZUZTdjdBaUs2VGUzZXlYSkNHY3NBaDFPbU5tYVUrdmRZZnhDc2VZNTRxOWc5?=
 =?utf-8?B?eHRrR3lCYk1RRE1RdSsyTTNOOStzWDJEU2Y0ZUN3bFZFNnBtaXNOVXlnMVA2?=
 =?utf-8?B?bk9FcmcvWkpMN3FyUWpJUUxSM3RQMlhnSllrSko5c1pKN0puTXpJUy82OVRy?=
 =?utf-8?B?T3FEc2MxMGx0aVJjWmlGbWxCMUJublpvdHR6UWU4WThTQkFFYmd2eXg4Yi92?=
 =?utf-8?B?NStUUVJORTJnSGk1NGthSklCdlZDVFd4THBNaUNudmkrUzZtejlQTkU0dFZq?=
 =?utf-8?B?am8wL2xUWEx1TElhS1YramdEQ242NGc5dnJDdmF5NHhyb05OVy9weWg3TnV2?=
 =?utf-8?B?QXdVWm9pektRYWNlR1hVTk04TFNodTRod0R5OFY4YktlSXN2WGxaNTZVazcw?=
 =?utf-8?B?UU5XWm82MzZmODkzdEN3N2NYUExidG1tSURNcHRya04ycG9oRXhWazltaEFT?=
 =?utf-8?B?bWs0ZFhkNy9nQUM1SmRvbkpGTEhUelkwWklKbFFiN0QrdzVSbERNeTFnUTla?=
 =?utf-8?B?YVNFOVpRVzJSVUZ5V0doWjFpZkRVd21qalY4dDBLN2QyS1U2clFZcFZCc013?=
 =?utf-8?B?TnEvTGtqeFVpbXdzVC94UDVFZ1UrTU5qZk14bWpzeTByck5sdVNFeFRXME5R?=
 =?utf-8?B?cVJ3T0RIYmNZMHZobGhqUTc1T3lUVit6anZOYUFteVU2ajlQSkc0Sm03NDBl?=
 =?utf-8?B?WWZFSkVobGRkOTlMQzhaeFRLTjVBQmlPdFlJbWhGU2tjcDRDL3UwQnhlcXl2?=
 =?utf-8?B?UjZOSkROS3F0TGRuc0tDQ0plSUwxTFhEei94bGVZUjVrbFJCTE5iSUtTYUI1?=
 =?utf-8?B?TG1NR25MVFJCNlRDZElQSHpvaHlrOUVXRXFiTGZvOWlaYzJ1OHlKZzE5S2lH?=
 =?utf-8?B?TmRDVkVWZnd2ZHVPUm5UQmdWcGhSS0o3R0FxQ1lzZ2g1TXRQKzFiQkNEVEZk?=
 =?utf-8?B?RXh4OERkbE9xdHRNZXJ5NzVxRFlzUXVvN3JLazZNcStncjlUOVk2REZwRFpw?=
 =?utf-8?B?Y3BWdjRrRzF0c3pLYldrVEtpaWNoUUhrakRhVVZJbUp3THlBR0Yvbzh5aVVv?=
 =?utf-8?B?akYrZCtmSEgwQ2JaM25XMktpQUxCSzN6QnE1YkJBVGpUc2VhT2t5U2tnOTRt?=
 =?utf-8?B?bW0xUlpnSlpCUE1FZTM3MkpvdThwRytvODlJaEEvM0lSLzUxMTR4YUQvaEIy?=
 =?utf-8?B?UkJ4aVk0YlE4Wm5IWTJzQklKWlBGM0Z0d3UzbmR1Y1ZvYzdkbHBVcUdmTWNz?=
 =?utf-8?B?aEthYUhnUEM2MFExTzdCZzJXeXkyZzhtbkVocDlNQ0JGN0hSc0NNQzBzU2Mv?=
 =?utf-8?B?R2JlM1VnN2s3c3BxajRidHlSWllhcDBYVE5EMHIrMFNEMmxJYldtOHFOcmVP?=
 =?utf-8?B?SkhkcW9EeHhRMnVXYmcrOXRRVlRlNG9Eb1AreURyQUxuamJjcGhKcDFmYmpv?=
 =?utf-8?B?dHMra1FSNVJ3c1kxWGtETVZCampsZ1JjQVcwSk50WGtPMVFIamgvQU1yNHM0?=
 =?utf-8?B?QU9NV0dDanFYeU5MYiswVGpLbEVHYWh4anlrR0hPSUE1aVhLZzluMEQwODJB?=
 =?utf-8?B?aUQrcWZqTmVKYWxJOW4yMFZ0ZzlLQjY5cng5Y1NrREUrTVVMZkliY3dZRWRN?=
 =?utf-8?B?bE5VeVBlMVJ1N1pIWnFVSTBFVERZZkxHR3U3WnJnWXJlL2RDT3dNWDFyM1pl?=
 =?utf-8?B?VGxoc3I5eTc0a1NObnNjc0I5cG1Lc2ROaEd3VTBnT3hqdVB0TzNhbFo1RXNi?=
 =?utf-8?B?SXk2YXVPdGJkdDBoVktRUGZKRzk3UVgyVDJXMHZFR0RHZStGM3pvdUlwRWti?=
 =?utf-8?B?K043THpTeS9QZzJNc3p5c1RzamdmT2k5NVJPd1FCU0NhSmN3all5TkZFTnB5?=
 =?utf-8?B?d3UyV21zZEt5dWRaMi9zMlZnZjZ6TElSNUcyUFVYdVhlc0F0ZWMxcTU1M1lW?=
 =?utf-8?B?Z2dlVHhWT0ExUnRjTjV5SDBjSlI3QTB4dEl1WXk1ZWR0N3c0UkJYUUV2TTE3?=
 =?utf-8?B?SDFSZ0pIUkdOVnRaQTAxUlZ5clU1UFptSTVyM3B4TFhmNXZKY2VVaUREWW9O?=
 =?utf-8?Q?6z4c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGdVVDEyTGZMQVJROU5wYXk5K3JvVGNGSTE3a2hmYUp6SHdzbnFpcGtOZjJP?=
 =?utf-8?B?NzZLZVhXWFV2OEFWRWlFZDFsa3lsVzc1UGp5VXI1Y3NHbHBZN0lrclV0d252?=
 =?utf-8?B?eUVNQnppaExJbEVZNGYxbzB5OVBJS2kvWGdnd1NDcGFZMHRCdWppaG5FSE0y?=
 =?utf-8?B?QktrVDRwdnNTeWFXTFBEZ21tN3c0Q1NLcVdUL21ET0dxVHN4QjZ4R0Z3ZFhH?=
 =?utf-8?B?RWVmam1oS3JlNHNud2RwaDFoY3h3OGxON29QcGZqV2MxelhYUzFUeGNZSlRN?=
 =?utf-8?B?Z2VacWNJclVhWFUzRXg4M3FCUFplOXV2MWFPc3c0ekZWeFVpVXBFVkxjQkNx?=
 =?utf-8?B?Wk9BbHpWa1ZOb0NmUU51V2dkYnBTOUtCcFpYelVLdm5NUnI1Q2xTUHdOSDdZ?=
 =?utf-8?B?YldDQldSVzVPMlFjY3R4TnR5L3RHNTFET1lPZzd2ck05eUxTeVVsbmR2R21a?=
 =?utf-8?B?NmZLanhCUzE1Y0c1QTJMV1Z3NGtZR3RwdUMweENtaUtFK1h4dTZQNHhMejlY?=
 =?utf-8?B?aDdTc1hncU5mVnY1SG54KzUzcElacVk3a1NHMDdnUG0zSmtnQUVKcDYzdEx3?=
 =?utf-8?B?TnA0QjJpUFpwZU1QV1lKRU5MTDZlQVdzT2VFRU56Mmp4SUNsU2lBTkl1N24z?=
 =?utf-8?B?eVpuUWxqRmhpSkxickVRUTlTd0VzVU05OTlGR1ZScyt0WnFSV3VzS1pjNkNs?=
 =?utf-8?B?ZmZSbDRVYWhmUVR5WDBBajdqQ3NJUThmRDg2SExFZTYzeFVESFpmRE56bk5V?=
 =?utf-8?B?cnIxeHgyZFVnTlRNZCtGYXVvQm9wTmhPR1JBQitldFhJRDRFQXZ2Qnl0ZlF4?=
 =?utf-8?B?OHlkV2taOWhLc3VIVnpnMHJKSFNqUEVaUzU1ZWxpWk90VzVCRG44cGNCSU5F?=
 =?utf-8?B?bDhISkd0dEVSVzA5RFZJRkFsOVErOUNrZUFaTlh5d0FpWENnbHgxYkpCa0c0?=
 =?utf-8?B?VkNvbWU4bnU5T2pnVUR4TlBUM2NSL0I0eUphWHZkMHdGdVZMUnlPYWJQaEJw?=
 =?utf-8?B?bDFCeW9kd3NmMmplaXY4NEpTSXR5ZFN2NHBzUTRhVUQ1R0hPN3lyK3VjR29J?=
 =?utf-8?B?U2JLaUs1c3o1bGZ5NWhrUFppTHkwb2tKc0s4OTFhUndIVG1DcTNTTmN1d29m?=
 =?utf-8?B?ZHEwUTcxS2xhS0FjNjlzQnRNSnB6VlFQZWRRdmlKZnI5Wk9MdU1kdEVGMFhx?=
 =?utf-8?B?NGtpd3NVM2NsUnBzQkNqSUM4aTY0YWZOSVA2SnAyMFNuS21aekJxaGRGM3E5?=
 =?utf-8?B?Sk1EZjhKVm1yTkxUSUxuQXZtL0pkSmxFZzU5RlJDMHV0T0V4cTA5Z2w3Z1Zy?=
 =?utf-8?B?WjZjWHVpT210U3BDTG0rTTROSlord1RuUTVzdyt5NEtXbVhoczU2Rkl4YU9N?=
 =?utf-8?B?Y3ZpZVNDdHYxUUR0ellUaXpkTkk0MDdXRGR2WmNlN1hFd2tYSVhqaWJ4cmZV?=
 =?utf-8?B?RUJJaGN0L3NkQUlvcXFGT1hidG11Tno3VHVkT3JpYlpUQUYvQnFRc0F2Y3NH?=
 =?utf-8?B?b04yRHhWdGFJSkE0d1lvNFN0UmFHS0ZIbGZtbjgvVzdkMzAxaGtxMWQzOXp6?=
 =?utf-8?B?bElISXJRdENPL2xkOXpGSVUzNUJDSm9CTFN1U2pQdnM3c1NocVNhcjAxQzBr?=
 =?utf-8?B?NWtDQUJSRDRuQW1FNUd3Q2h0NVlVVVpTOTFVMVRTWGdCL0JGUWdoYm9aTUth?=
 =?utf-8?B?T2dTOHB3NThGaVY5Y1VlaTI0dWhTRG8rNzlseHpLcGNLQndKazRiRDB4c1N3?=
 =?utf-8?B?MmU4aVlLWjlWMXlPVmNWQVA5TUFUU0xKQ0ptOWE0cjBQRUpTdlpUNkU1enhD?=
 =?utf-8?B?WEJuaFdla29UT0R2WDlnc3dMbWFwNFBsYUZ5TXI0OVEvZDJOQTJPSldBNkc1?=
 =?utf-8?B?RVFCcUM5a3E5YXNwMmx5bjRsVEEzcE9hSEZGd3FtU1FCd0tidm1VbXNDL2c2?=
 =?utf-8?B?cEpHZm56b1lwakNtN05kajVHZVZ0bjc0UlBoSGpKQW82NWEySHU2OFlGOWw3?=
 =?utf-8?B?NExlanJBUGFMR2lacHlDc1FaWk1xSytranFGb00rSUE5NkF6V21uNFdYK0NR?=
 =?utf-8?B?YmFTRHRBdldDUS9aUFFuUytGSlRodHJxcWVCRjhRMDBqQkRWRm9sVFdZVUpw?=
 =?utf-8?B?ZnkrZUN5L3BaNXo5SUlwLzc4dSsrWEorS0lINy8yWG82TzVMOWQ0S1MzQ293?=
 =?utf-8?B?NHZRM2xHQlA5c1R3Y1ZJWk5DTElOYzZEOHhHMS9vcVdQMkJJYUE1SUtGRDli?=
 =?utf-8?B?S0N0bkpKZjZ6S2h3Z0t3dHByNm1RUmZpNFVqTUpMblV4WW9HR28zbHJWTmt6?=
 =?utf-8?B?eDdSZnNNcVNYWkl2QmdnM1ZmY0JaYXk2RzJtNUEreitLZEhCcWg4UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6182846-20fa-4bd8-d7ce-08de5910cc94
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 17:16:22.0989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Ig9k7OvRZcLnu4s2/yU8c75bVmxao94wHB+TNEih/4+EDJ1SZboD5CAN6HR79sBlAH3F/lt3dghh0MLc9sEkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB8088
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,Mac.lan:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 50AC35A68E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 04:26:03PM +0100, Jan Beulich wrote:
> At the example of _sinitext - that symbol has four aliases on x86:
> __init_begin, __2M_init_start, __2M_rodata_end, and whatever the first
> function in .init.text. With the GNU toolchain all of them are marked
> 'T' or 't'. With Clang/LLVM, however, some are marked 'r'. Since, to
> save space, we want fake "end" symbols only for text, right now
> want_symbol_end() has a respective check. That is getting in the way,
> however, when the final of those symbols is 'r'. Remove the check and
> instead zap the size for anything that is non-code.
> 
> Fixes: 6eede548df21 ('symbols: avoid emitting "end" symbols for data items')
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> Roger, just fyi that I think that this change would mask the other issue
> that you reported, without actually adressing the underlying problem.
> Hence both changes will be wanted.

Yes, it does indeed mask the other issue.

Thanks, Roger.

