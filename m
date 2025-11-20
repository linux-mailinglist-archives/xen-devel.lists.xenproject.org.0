Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E01C7307C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 10:09:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166625.1493137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM0ff-0001lv-6j; Thu, 20 Nov 2025 09:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166625.1493137; Thu, 20 Nov 2025 09:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM0ff-0001k1-42; Thu, 20 Nov 2025 09:09:43 +0000
Received: by outflank-mailman (input) for mailman id 1166625;
 Thu, 20 Nov 2025 09:09:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vEGo=54=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vM0fd-0000Wn-3m
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 09:09:41 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a482e377-c5f0-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 10:09:40 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MN2PR03MB5072.namprd03.prod.outlook.com (2603:10b6:208:1a7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 09:09:37 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%5]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 09:09:37 +0000
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
X-Inumbo-ID: a482e377-c5f0-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IbHuRuNfSX3OdGCYRSZHbPKTt26yQVAUmN/GR3RgWGXuwR2RgVfBga/VPTtGRQBTDFFhEJ4BIq2yMnTEvsim19FNMU7/0BzFqeBro1hD7JD99xfpbq7YTmvr9A5rGtF5NWcKwbYuR5HzqnLF3RErpFZzrx1cCxD+Hd59yTc6tL4G0fzx0tmchXv4HcSEFGuVdWHu1LX8sTaDLJjrllkEgPW0y6ZWlvGcYsbZ8NWPCAfCwQkydLhHY40NNEKMCQFm5W3WxNaHA665JRKTZPBwD54VVGo5TUI7pnm94hxj5N6N00liMtC3CJvjEGWKGVCyWEZiV3ouungPNRzwVAONkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVC8ah353fCaq4FQWmc0+WOQ82jU240QoCVXUnFWw9g=;
 b=IMrbMIl59qJh9Xs0Fo7XAOcjTSnTG6r7Gb0ypNL9qHC+UhyFUazbVcQFZLzDkBeCQhjgm16Oo22ek4zxeael5K39254fbfuY3wlCdPvPz+A/MfUYUnLc0Go8X3pjI0K8tfa0aBP18wP4p25Ipw3v8/wh5FT2rMU4CCCjaDDXPteAqZVrfqsENn2xYXQOcb0J+bsG2xhciqiRa0UZwNygrvLpLfhP5cgGIzxrT3Ebwy/yxqWDu+Hi1nji4ZA9igYgGXclGzOOAeVZpSSk+9MeDtA1Ib2sYu+requAknlMSEygQ61UQro9jsS/6cQz4xUaKw8bj3unbxyhDC7f2yzAZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVC8ah353fCaq4FQWmc0+WOQ82jU240QoCVXUnFWw9g=;
 b=lYncggR8WeZOU8opDcRDoOsmJQpdvNJ0IngCBxEaavoZMbw+wM/4QL25EHxKL0Dl9TzhLVaOLgA+AO5RCBdQvhBlNZ96Yz1i7rg6J5WodDdyGIg6IV6mz83rwfOBG+ToRR7TizzemtThh7Bmj+kUPY5sn52Nu5IWzhlsbCzqAuI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 04/12] x86/irq: set accurate cpu_mask for high priority vectors used by external interrupts
Date: Thu, 20 Nov 2025 10:06:29 +0100
Message-ID: <20251120090637.25087-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120090637.25087-1-roger.pau@citrix.com>
References: <20251120090637.25087-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA2P292CA0029.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::19)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MN2PR03MB5072:EE_
X-MS-Office365-Filtering-Correlation-Id: d39c0f22-fdf4-4edc-e2d6-08de281487d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTltazBITEQrdHFUdDZaaERUTmEzN3RUMUNqanJ4cFV0b3k5UytJQlhCNDV2?=
 =?utf-8?B?dnpWQnVZTlQ3ZkZWQ2tVa3h6YmdrUFVuL2dtUHdlL3NXSG1IYUlPeHJiaGFj?=
 =?utf-8?B?L1FCZFlKOUo0WG5lNXBhWlJIanF0bktCNUhQQmhWZVNpSXNzU3JEMG5CdEZq?=
 =?utf-8?B?ZmhOVXFBdFNHVzgrVzlyUkM4VVBCNzQ5MWxMUXM3dFZ5R0tGalNVMngwWUYx?=
 =?utf-8?B?R3gwckdJSklNRnVaWThiRC94ck9Kc2JyaG5RdmQ1QU91c0hESUQ5dEdCS0Y2?=
 =?utf-8?B?aWRKUTdSOGJqRUJSTk95TGVxdFFxM1g3YXJCaXRkQjROcFNxaGJTQjlxT05t?=
 =?utf-8?B?b1FHT095WHkvSlNpdlgrTytpbTNITTRpYmI5djd5YVRJUUdjbG8vclJxSUJN?=
 =?utf-8?B?M0tCbWQrcm9ac1FBTEtyL1RnWVlycXZtc3RoWkNOekpGVGhXZ1B4RkNtM0dI?=
 =?utf-8?B?NG1URk5sWHQyd21EemYwOG9TbWtXOGhkSzdOS2FNdWU4a0tUck5kdGE3czZQ?=
 =?utf-8?B?ckFqYmR2MUdPVjlZeXRpU1llZnRDVURDTDkxaHFZQmVCaUFPUURMTHMwZDFK?=
 =?utf-8?B?VUhhYjVJdE5tWmpBRXdqSk9EdGJXRUJBcXltV3M4U3V6cTVlRVB3cUkwbVNi?=
 =?utf-8?B?NENKRUs5K05qY2xPYkU0NnU1T3RRMDRFM1ovUmRwWlZHN3RmeWlIQWp2akNU?=
 =?utf-8?B?SWRQckgxUDhPbVJXdnl0R2cwdmM1YXdETm1Bd1kxQWxZTnlyVkEyWUhqNVNE?=
 =?utf-8?B?bTdnaUZDSWtBM1Q0dXIxSlpyT0R1MnpPWEIzRGcwWkNNM0tZc08zNkZaZ1lX?=
 =?utf-8?B?aGdyRmRyWFZ5K3Y4UzNraXFMcHlxazBIa2NJNE90c1ZGS1hRcGIxRnZLR3pl?=
 =?utf-8?B?YWoxTnpnc2ZkN3haRUNvWW9CYm80Skp5Q0xGTVhpaG84SDBrN2QvdVhMRnBH?=
 =?utf-8?B?L05BNWdFUnh6Z2NJYmRvWW5iZ3V3MWNmUFRaRXU2VVpsVnovb3dudkpPUG9y?=
 =?utf-8?B?VE9zdGp2QUdQMkhselM4Mmd0ZDJBRUFHRVBIZEZqaWtKcTlkdTkvK2lDRFB4?=
 =?utf-8?B?UVppSEpIZHozMlF5ejl4YkxTd1hCdGhlbGR2TW1talFtdkQ2bGc2NDVYSFUy?=
 =?utf-8?B?Q3QyK2pwQ1Jhd0FibHZFVVNYRlpLUzNLaHFKams0WXJ6Skt0VVJ5NzdIUm1M?=
 =?utf-8?B?WkdqdkdRanBPYlB0UE1LK1lrdm1ad01wMURmc3E4NHlkNGt1SzA0bGtpTC9U?=
 =?utf-8?B?b3U1MFZKUTYzeDAybmFqbk1qUzZBT2ZOSGJ5d0VRQjdqNDl0UlpMdkxCUFdZ?=
 =?utf-8?B?QmFuSXJlV3UzVStrTzFKOTc2NWM3V3ZJbXBadkc2eDBPTTFKWHppc3AzSEtQ?=
 =?utf-8?B?YW1Ha2dZMXljNGNXdmxiSVVJMTh5RWlhM1V0TURnTnp5Y0h3amluYTNqc3lF?=
 =?utf-8?B?SWZ1LzdYYjZ5eitlWmdaaXJ6cE9HRytOT3gwYUVsWW82N2ZsMXJlV1E4WXp5?=
 =?utf-8?B?aFM4NEZWWVdNRDJLYjlQVno2bWJBU0tyT2pLL2F2UG5YbDNma3NmQTNDSEd4?=
 =?utf-8?B?aVNBaUoxRXFPTUtRNXFHNk1pR2tIdlFhK2d3OTk2Z0htQVFQdElFMnBBRnVm?=
 =?utf-8?B?NUNtTisrWmo4d3hCeGhVcUhyUDRlN2FycFJ6NWM0U2RBR0g3cnIrQm1WVEtY?=
 =?utf-8?B?dlcrNzF2cDA2bEw3K1Y0b0N2elhaWFdIbFlmb0lQVENoTXZDazR0WTAvck9D?=
 =?utf-8?B?RWhUeWVMWGExK1ZrbkY0aWw5TUdPa0k4NStQOXgwQmdMQVRYTTJRRFNlZHJL?=
 =?utf-8?B?c1kwZ2pLa29iQXBwOEpEWE1YajJPOVFPTStqZFZSN3lGRVNoSk15NTQ5Tkt2?=
 =?utf-8?B?WEZhMENTOW9PUmRTSk55ME5XRzhmbWJnMjdGd01ISTI1bUtXY3UxZ1habHlW?=
 =?utf-8?Q?tV6DzGPKbjltYEUWwDHJFMwC6aCNdorz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UE9WanJ2N0M0cEZtcVlqYUpzYVRKN1ZRYy9reXVidHZGVFRzVVJ3Uyt6SndN?=
 =?utf-8?B?NTNIM1o1VzIveUVDNnluZlZZRE85WDJETzBJaDZZQ1VuYnRSUEZRbUE2Qmt2?=
 =?utf-8?B?T0ZKZThoQ2VRWkpRVW1EWDdVYnVvaHVLU1loZXRJUGo0SzFWbk1Nbk9hSG5G?=
 =?utf-8?B?b2d4N2dyeXJWZG1EcmdJbFNxcGFmdEYxaGk1U2ZiV3RLQU4ybkpNazNUajI5?=
 =?utf-8?B?dGNrN2tqS0NkVWtmMTN6Skt3OFJKWjI4TEh2WjBDbGtQSkJ1RlpBaTdRaUJw?=
 =?utf-8?B?c2QrQnBPZGVmVk1CZGdmWUUrL3NiWmMrT0IxOGk1V0ljV2Npd3gycGVBOG1O?=
 =?utf-8?B?VGs5TGtnNWk0SEFIRld1R0ZBT1dvZm9VaE01ZnR6WW9GNi9xRmR4NFpBRitv?=
 =?utf-8?B?TjlRZEFLVWtOeFFjc1krUGhiNEhYY2xScDhWejhmNm9KaVV4M2tJSld5Vnl3?=
 =?utf-8?B?ejA4Sld6ajR6bVAwcitlU3pBSGZoM3RMdEF2cStuVjNaSHFON3VSZXFzakFU?=
 =?utf-8?B?REJIYUdBK1I2M2pMYk5Xcytaa09COGJEdHIyMUdCK3NRcW05bnRXdG4xdlJG?=
 =?utf-8?B?M21yY0NsWkkxcThzZkZqNFNQRmpaU1BGUklRbGdTTHNPa1RsOHRIK2NSV3N5?=
 =?utf-8?B?VnMwQzJ0TUFDczdhQmYzQnlSN0cwQjhtUm1IMWNPbFBFSVdFbFVhekt3WEpG?=
 =?utf-8?B?d0pjTVJmWU0zM2tmcGZ6SmFHTk9nd3gyWGhhOU4zUFNaZHo4YndUZmJMWkpn?=
 =?utf-8?B?WjNZVmYzbFp1V2lUOTlJMWNhcFVpVkZEMlhYek1melJLdUFKaVUveTVoZzcw?=
 =?utf-8?B?ZlF3a0E5WUpGN3JWN3AwRklKc0NUb1NHOWVQK2ZyNklIK1NpdTBNelNQVU9R?=
 =?utf-8?B?M3grMTcvYkE4R2pFaXF6Q3QrK3gvZTQwc256N1U0aEs3bERabVVnSDBSeXd3?=
 =?utf-8?B?RGJmRzltUDhjcEF4YUkyNkdRRkhBc0FKaTcvZldKWW5RKzE0Vm00T21sQ0E0?=
 =?utf-8?B?bmI0bXFWdkh2VERZay9mUHdhK1VvQTh0WDlzN2Vtd0R0K05RMStDN3JMMjho?=
 =?utf-8?B?ak5TckJWQWN1NTZXczdEMldnQnlzMFNoVmtLU085QTdoVlFscWJoNGNzTVcv?=
 =?utf-8?B?Tng0WmRRSXAxT2ZWQ0ZzNXpaK0c0STJQQWdlb25vQkhmQ3FKQmhLVFR5ZGtW?=
 =?utf-8?B?WG5waFlhZ2pxSDFqY01LVHlFcGtmN2xPWlRjR2VrUFpjV3NFKzk3OXFlT0Ru?=
 =?utf-8?B?NXE5SHNNUUxvbWVxeFdkNVNXOWRQd0p0VVpGTGkwbUtQenpCTjVXZWxxWGRN?=
 =?utf-8?B?NjlTbFZyRWFzNzVnUzlKK0RKSEFCY3Fpd1UxT04yZ1lCR1ZNN3NJeFFlRENl?=
 =?utf-8?B?M1VMTURHTi82aTErNSsxM1FGVFJ2dHcxeGtxZ3B3N2FBQlk3ampCUUptbDNO?=
 =?utf-8?B?aEtuS1czcklRenBEcFhXQkFwc3k1NTRYRE01N3NMSVVkTFlwM3FJYi9NSXp0?=
 =?utf-8?B?WEdkTmV2VEl4MVRZREJjS3JJd1BaUHlvU29ZWURjQ05mTEpWc2tJQkcwanRo?=
 =?utf-8?B?WS9wVGkycXlsVHFqSHFVaWRnQVVPMUwvR3ZaQnZTV0YyYXVhVkpoMklxcG0r?=
 =?utf-8?B?T0RuWDIydG9yZWRFUjVIcENkUHZ5dEZvUFNuTStiY0ovSkVsaTE4ZFZwQjVL?=
 =?utf-8?B?dGh0djIvWW5Kb3k0ZlQrb0RiWjhQOCtHVnQ0OWxCNXJQcWxhRUtQUDlla1Ru?=
 =?utf-8?B?dlQ4TVRzM3paeDNZaERzY3FuVmJ5VXdyZHlJSGRLUEM3S2RTeFBUODlFWGpX?=
 =?utf-8?B?TDVhZzFVOXhEd1pnWEtiMXJub3pIUWJzQytjMVVVNWdxczFkSmZNZmVBcG1G?=
 =?utf-8?B?ZkdheEx2d09RS2s5dFdhL2hIZkQ2Mzkva1lKcnk3bXYyT2J0SnJ6K2d3QjZF?=
 =?utf-8?B?cGNHaVRHSUEzNi8ycC81OFdvTGVuSUo2bXRiOVpCQUExcjB1QUt3NWRFa3Jl?=
 =?utf-8?B?dS9VdVZlbTNuYXZSa0NrcWw5Qk5CYUhXWkVjbTZEaG9zQzJzMWJZTk93aUo0?=
 =?utf-8?B?ZEQ1K1lHcThLTE4zMTM5dWFWbFRZZ29GL1VJSkRiZ1Vnc3pQQW9keVE5Ymlt?=
 =?utf-8?Q?Ivz7MMr5M3FUXMOHfpvUzAqYj?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d39c0f22-fdf4-4edc-e2d6-08de281487d0
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:09:37.7868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NGYWDWLSxVIPKISpwS7HJt4kQs5NmmFQbvGGP6/SRzknWmjqoK2NuV+dRcrNMycGOGdo1C3ema7mb14QTxSxOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5072

Setting the irq descriptor target CPU mask of high priority interrupts to
contain all online CPUs is not accurate.  External interrupts are
exclusively delivered using physical destination mode, and hence can only
target a single CPU.  Setting the descriptor CPU mask to contain all online
CPUs makes it impossible for Xen to figure out which CPU the interrupt is
really targeting.

Instead handle high priority vectors used by external interrupts similarly
to normal vectors, keeping the target CPU mask accurate.  Introduce
specific code in _assign_irq_vector() to deal with moving high priority
vectors across CPUs, this is needed at least for fixup_irqs() to be able to
evacuate those if the target CPU goes offline.

Fixes: fc0c3fa2ad5c ("x86/IO-APIC: fix setup of Xen internally used IRQs (take 2)")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/irq.c     | 24 ++++++++++++++++++------
 xen/arch/x86/smpboot.c |  3 ++-
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 7009a3c6d0dd..5cd934ea2a32 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -547,6 +547,20 @@ static int _assign_irq_vector(struct irq_desc *desc, const cpumask_t *mask)
         cpumask_t tmp_mask;
 
         cpumask_and(&tmp_mask, mask, &cpu_online_map);
+
+        /*
+         * High priority vectors are reserved on all CPUs, hence moving them
+         * just requires changing the target CPU.  There's no need for vector
+         * allocation on the destination.
+         */
+        if ( old_vector >= FIRST_HIPRIORITY_VECTOR &&
+             old_vector <= LAST_HIPRIORITY_VECTOR )
+        {
+            cpumask_copy(desc->arch.cpu_mask,
+                         cpumask_of(cpumask_any(&tmp_mask)));
+            return 0;
+        }
+
         if (cpumask_intersects(&tmp_mask, desc->arch.cpu_mask)) {
             desc->arch.vector = old_vector;
             return 0;
@@ -756,12 +770,10 @@ void setup_vector_irq(unsigned int cpu)
         if ( !irq_desc_initialized(desc) )
             continue;
         vector = irq_to_vector(irq);
-        if ( vector >= FIRST_HIPRIORITY_VECTOR &&
-             vector <= LAST_HIPRIORITY_VECTOR )
-            cpumask_set_cpu(cpu, desc->arch.cpu_mask);
-        else if ( !cpumask_test_cpu(cpu, desc->arch.cpu_mask) )
-            continue;
-        per_cpu(vector_irq, cpu)[vector] = irq;
+        if ( (vector >= FIRST_HIPRIORITY_VECTOR &&
+              vector <= LAST_HIPRIORITY_VECTOR) ||
+             cpumask_test_cpu(cpu, desc->arch.cpu_mask) )
+            per_cpu(vector_irq, cpu)[vector] = irq;
     }
 }
 
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 7fab5552335b..69cc9bbc6e2c 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1464,7 +1464,8 @@ void __init smp_intr_init(void)
 
         desc = irq_to_desc(irq);
         desc->arch.vector = vector;
-        cpumask_copy(desc->arch.cpu_mask, &cpu_online_map);
+        cpumask_copy(desc->arch.cpu_mask, cpumask_of(cpu));
+        cpumask_setall(desc->affinity);
     }
 
     /* Direct IPI vectors. */
-- 
2.51.0


