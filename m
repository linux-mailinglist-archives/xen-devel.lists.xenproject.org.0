Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D4DCF5A6C
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 22:22:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195770.1513684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcs1r-0004gG-R2; Mon, 05 Jan 2026 21:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195770.1513684; Mon, 05 Jan 2026 21:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcs1r-0004ep-OL; Mon, 05 Jan 2026 21:22:19 +0000
Received: by outflank-mailman (input) for mailman id 1195770;
 Mon, 05 Jan 2026 21:22:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XtAc=7K=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vcs1q-0004eh-Qf
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 21:22:18 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c7dcf94-ea7c-11f0-b15e-2bf370ae4941;
 Mon, 05 Jan 2026 22:22:17 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV8PR03MB7446.namprd03.prod.outlook.com (2603:10b6:408:186::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 21:22:14 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 21:22:14 +0000
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
X-Inumbo-ID: 9c7dcf94-ea7c-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nKVLnwngFUc1I7H2MILi89KbeFt3beJqLhtxwr6q8xO7aaRVYdxPXNPX5m2N2kgnY6NCe4MEWJFXCzesXTxmRwGifLgKrP1F9ydhr6RRkfuiuzuwReHqsD1lTB2ZCBNnER8uH9co6Y/Gr6Lrr/Epj7x5L68mUrFeRs0Xd2v1klio9fs+8XEn4+pUpiqelLDtsHicW1j8YqLnvzOuM41cBU1Iv0sbN7uZo+zuFH0RkBYtzBAKb3HQQnyxsm6P1aDiuDGxb9QG2/r3unk/1pB0hxD37UAlUVZuacd3732oJysMjYupzUiou/tySKNUrHg6cxZdSKSOq6VSev/bO6nqag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOVC8T33nshyLW1CmKwEyFz8Ud/d/fwuAsHfRhc7jE0=;
 b=F6LHpco/0GJF89PsZB9af/oAo8jsu+Y91HSJxSxWnAu3VTWuDGW7mwAiM3wgg1SOwAwyCslUPD8adpUYdXXK4/KcWL/7F3hvPtcAa4sXMwIteJ/y5ybXnGC2ZEYr5tIwgPRlhRTWGrkOAWaAxEx5HT6r5Y2JsoY+IOaX/4vVkJqyULnloZrvNAEt8XsfGh7sIIcE/Rpne4puW466ifEDas5cd0u7KUhub12I8p6Stafobg6vlEmaYwd5MAyZSEkWv9P5t1U7BDQgKHkpgWD1ygMAziUNu4sBzAaRYqO1Kub+GCvtcC2TfJFk3PwBuB/wEjU5liYTXlkuIE+4SctUDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOVC8T33nshyLW1CmKwEyFz8Ud/d/fwuAsHfRhc7jE0=;
 b=dEKJT5zFWJVbTcOrVXehBil6BufPMoFa2i31Q0toYwArJgDOHHHA87dKH1sdNcdiUuTDmmLJvlHmEBn7vx8h4MidINHsdmBMkRonrG7JG84MrUMtcN7zcnYiJleXFWkkzJWNXqiJFae04E1nDPqGAop4jW60OkuSe6XFMq/SfzE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ab22b6fc-dd9d-41fe-8d30-dbd331ac84d9@citrix.com>
Date: Mon, 5 Jan 2026 21:22:10 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Subject: Re: ARM64 notes: Re: [PATCH] CI: Extend eclair-*-allcode to enable as
 much as possible
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20260105122436.555444-1-andrew.cooper3@citrix.com>
 <82d99c52-c39b-4fbb-bbb2-0e952df91673@citrix.com>
 <6609d3d66bb3522770967265f50cdd0d@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <6609d3d66bb3522770967265f50cdd0d@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0137.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::29) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV8PR03MB7446:EE_
X-MS-Office365-Filtering-Correlation-Id: c14c63dd-57b4-4e8d-44f5-08de4ca07f1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tlp1NG96NEE4OEZUTWRqdWVPMXBjOU5TMk1XR2RvVnYxaUQzaHFEOXRWMFdJ?=
 =?utf-8?B?VENhZ1FSQzlGVGwvT1dOMXV5dFlEcDE4MFdaYjV3L0NjNUhxTFliMmRmTjFn?=
 =?utf-8?B?NGR0dFdnZHVTSElzenFhNjJpWnd3Szh1ZmRrZUxLaHRaUUVKT0FQQStJVXRr?=
 =?utf-8?B?S0hYRENTUEV4VDVYNGh5aUFMZUVDcllnMDBYaUVDOFoydzF0aXFHZTFMWEZ6?=
 =?utf-8?B?WU5tRjNEOUxCVFhxRnVqM0hvcEpJeDA0Wm9BV2pCK1Rwa0FUV1ZSblVDbmNN?=
 =?utf-8?B?M21hSFRWQjJTdzUyZkJyMUthNjJmMEZ1MDk3MXJVSHRtNElTL3ljVEFKUkVo?=
 =?utf-8?B?QkkwYXpmeHhXYTF3RmlzS3dRRzJMaldpbUNOSDNKclJhVTVFWGRWYU1JQkZ5?=
 =?utf-8?B?TkZrcHdES0l6M1cvOVpKM3I2cTNOU0ZBVjJlUjlrVXZERnQ4Q0RNcTFCUHZK?=
 =?utf-8?B?QW9QSlBDQ1JkQTVHN1Y0cDRCQW0rSkFBdkFKY3dONWRQb2lORU5nbk9ac29h?=
 =?utf-8?B?OHhGS2pKd05aMldJRGtTTmpNcHFseHc3L0lPT2Q1SU5jM1NUTWhIRWdmRVN2?=
 =?utf-8?B?eFFIa3hSeHpoOGhCMjUxV1QvWUpkc2VXQzlWK2xkaXZITHpKZHc5dVBKOG5Z?=
 =?utf-8?B?ZU9OWkw4NzRneG4wSDVqSU9aUkZwTTNScVF1VjVQN2tmYmVrYUFOS3p2YU55?=
 =?utf-8?B?REJ6eXhvNTlFWGpMOXRBdmh6cTZuMzVlUjZVUmtBa1BPMzN0WUtGcjc5OWhw?=
 =?utf-8?B?MERSczZ1cnB4am56RDBvYTZhNWU2U2xGdGRvQWoyTnN5WStpRlFrQW94dmVH?=
 =?utf-8?B?L3RUNHNzL2FiMWUzbVhuS2kzeFVJRWhCSzE5WXhyVTQ1ZVVDTkNVcUJ3Wldj?=
 =?utf-8?B?aXV3WW5yYnpvVElueFlqTm56cHZrU3YyblU0VkhEQUE4N3JhUHgwUnoyVVZR?=
 =?utf-8?B?UlhiMW9YYUlZNmlVb3V4YzRzVVgxdEEybVhqc2lxL3pTeHM2YVpXZlYxQnZ2?=
 =?utf-8?B?MW5ITE1tckxqSVVtSlNJN3VkalE5aGlpaHdrREw3Z2ExeUh4Nng0em1KeFQv?=
 =?utf-8?B?ZGRsUHJVRlh1RWNJUjVmMTR2YjVtdHZzcFREZWxZbWR4TWQyQTVFRStOL1Iy?=
 =?utf-8?B?OHZYWUs0Nnkzd2VPS1Z1VW9ZL2lvQ0tselQ5a25GVDkzQmJ2N0IxWTV3RklY?=
 =?utf-8?B?WU5ObHRYaWtzbkxNdDdQVDNEQzk4eWhuT2NCYTVqUmpndzFUQk5mQU1XVzdU?=
 =?utf-8?B?bTBnU0l5RVhMeitPSUdkbHNzRXEvWDRPK3VsbCtDRkgxZjRUYlFjTkU4dERG?=
 =?utf-8?B?NDg4bURJYkFJb2ZVRTI2ZmNScXRVTS96SDNZYnArNjlQSzNicmxKcHJZeWpt?=
 =?utf-8?B?NWxId1hDbHphNjFGOU12RDB1K3JCbWZ0bk5vMlNVVm1MaUdMMG1NM1JUMDY0?=
 =?utf-8?B?Um5RZVNadlRQNUhWVk4xS0lZL3dlVnRzRG8yMlpBVWdkcWFQN0ZVaGFVZnRl?=
 =?utf-8?B?WTk2TkpzdWIxcW5XZEpySVU2VXc4dFEvRExzZjNwOFh1OEpHTkR5eEdmVXpY?=
 =?utf-8?B?Y1Q3WGhuN1J6bFR3QWErUFU3SHJoZ0xvRXJPazltdVpWUXBRMXNpRHMyMW5z?=
 =?utf-8?B?WHNvRGhRY0VMTllwY1hWR1IvZmg5dXFUSEdnRFAvNXNXd3JXVDY4Zm02TXlo?=
 =?utf-8?B?WEZJakl0YnRTcUIzc3JPdGxJdVEvSmMxWWQxNG8waFFEWFJVWjFpYis3ZktE?=
 =?utf-8?B?YzlDcHlWaVlpNTYxNnN3L0JoNVYrWVlLVWlqeXNWcy9PaGc1VEJJMkdhY2U0?=
 =?utf-8?B?dVZQM0ZPWUptUm90WG9YaFBkZW96SXlwL25Qc0tWNXQ5eFZxY20rRW5hMGFQ?=
 =?utf-8?B?YTZuWUhlQ3BEUmRPMFJHOWppNGswQndXQWJ4aXh2NHFLNFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnA3eldvR2JnaXU4WDhIZ0tMYy9lZUZRN09aUjVqWkN2QjdQOVBZMlFFaEZF?=
 =?utf-8?B?SkhpQnlxQmdFWFQ1ODNtNkZlalc2VTdSSURCZEFBZzBySFBzeHpyWFp4anZ1?=
 =?utf-8?B?Uld2c2FnV1d0Z1k5WC83bjJMcEdWV045dzcvdGN3eU5mTy9lQTdWU3FEbHBa?=
 =?utf-8?B?djlkZzZ6ZlkzcXNoYTV2NlAyTHlIYlpia3A3TnlZc1VpU1NWUm10UlFqbExH?=
 =?utf-8?B?OG1peXJlWXBGQ2pXYThOaEJoUzZsV3F0dFI5RTlubFF3SThpck5ES2l2RU1P?=
 =?utf-8?B?TnlPend5M3puYlNieHpFYk55ZzNIZUw2eXFJTnI3ay9qOUJPcVVsVksrK25V?=
 =?utf-8?B?a0ZaNkZha0M3NFFpMGoxbzJLdkpYNzBrK284d01wU1Y5eExseTlsYjEyQTZo?=
 =?utf-8?B?amV5c2ZpL1dOWXJQaTZSY0dCdmVEM0RTakI5bG9oMFkyVHdaRC9BaW5JZldm?=
 =?utf-8?B?YzI2VkpHNmMvUVFOYlhzcHpSZzBKKzEwVjBPZ0pzbGcwTkQzcWV5UGFKVzlD?=
 =?utf-8?B?UDZuelRvVWZDNk8wbCtzNGFUMDd0bVpnTDhKZnB5YWdEWG5GbDdTTUxiVS90?=
 =?utf-8?B?bzJZOE1TN1FjOEJ2ZlNpbEdnL0QrTXF1NGJZNkNBTXo5T2IzM09Nb252dDFO?=
 =?utf-8?B?TTdkUldlZTNsUGFicEdzUjU1d2NqZ1htRmVxK2tDYk1xREl4NEt2NVNuMUxn?=
 =?utf-8?B?TVZGWWJzTzhWcHJyNDd5MnFreGlIRE92d3l6ZTE2emkyc3Axekp0R0NwNkMw?=
 =?utf-8?B?YnUzdW5pVWxQb0tRSytKRGU5bTZGU2VUYyt4TEtWbzdTdStvT0ptaXJac3pN?=
 =?utf-8?B?VVp1VlFvcjhSWWZDaVZMTFVOZXdaeWxBZjFkS3o0YXoxR0dpU3BBR1JtS0Q5?=
 =?utf-8?B?Uld4aXZYeVhvZ3krckxEYjNtanNpK3FQMDcycUFJcytaODdKV1FTU3BaWFVr?=
 =?utf-8?B?MUQwYzFKUVIxWVdMeU0zbnd6YjBvdDcvM2wrd2RWTzlrOTZPVGsvNlkyVkxt?=
 =?utf-8?B?bzhYWDkwZXJjS3gvM29ySUJScTk5Y2ZXREc4aWc2cUpKUlMzdEkzempZMHcw?=
 =?utf-8?B?U2t1Ui9xMkZHS1ROcXBCbndOem56eDVjS2RNQUhVZ2hFd290VmVub2dwN05W?=
 =?utf-8?B?dGR6YXB1YmJRZjdsYlBIeWtiVGxKUkVHSkpHSUwyR3BHQzlGZGdjVHpZWGFK?=
 =?utf-8?B?N0UxQTgvaG5UUjVPQlVUTmc3dDQxRHlXZ3pEeVdMMWtyRmtUZS9BNzJ1N01u?=
 =?utf-8?B?aFI0TUlSK1lja0k3OFgwZ2VPUmF2U3FMczFsYURYOTd2YUZIZ0ppMGJtQzk2?=
 =?utf-8?B?YzJ6OFdZT3hsd294UERwVk1US0FqWmwwZVh3b0FnVnowcXo0Qjc3UHdWeTNX?=
 =?utf-8?B?cWxvNTAxUXR5RlY3V0FqaXlGODlZVFdFdWppd1puYXRjcUR5WkZMaVZYeUR5?=
 =?utf-8?B?RlBMZ0VhRTI3QVc3OW53MTc4YTJQdmZxbWNMaCtHc0svY2ZYdjduS0dBSUsv?=
 =?utf-8?B?UEI4NUpNSCswdjlpbkJ3RlFycDJvRE1xYjJzUFF2Y0tDRlMrUXFlY1IxRzM2?=
 =?utf-8?B?VmpjakRKbDZOeUcxaEZmQWkrekRDM3htVEdIU2QxeFF6NVdGSlE1S2dpRVlt?=
 =?utf-8?B?UG5zRlFVNzRIMm41Z0JXbytWeE5yZjJFWjdaa2UzYTVSbWxmdm1wZGJpWXNK?=
 =?utf-8?B?UDlxRzJlZTVWVW8vZnNlNzVaVkhNa1VnWTMzTk94bnRaNFQvcGJ4Qkllb2RB?=
 =?utf-8?B?Sk1WSUp4TnYrNE9EbFBXWVNueFpyYzUzcVFybUJ6QmZCMGx5SHZ3cksvdXor?=
 =?utf-8?B?ZVVGbkhBRDZ4dDhSYkIrSzdtY1RoRGJ2WWE5dmVJbUJsN0dEazRXL3FVcTJl?=
 =?utf-8?B?Vm1YdHdLL0xYQ0p4NXpPSWJNNE9uNXZTRXpZdTlQNzROa2ZJV1Z0bmRZcFlU?=
 =?utf-8?B?UXIvZHJCZ3VVSmtmcUp6aVdaN0hQR1g1WFZVZ1J6TVM3anZIbkZRQWpmRFU4?=
 =?utf-8?B?c0c3OTl3VlV3MXU0eWk5TThQYUl6WDNDeDhMTDhkbDlmZWtqREF4b25RSXll?=
 =?utf-8?B?WUtRMGJtZzNPWE9YdmExeUcwNFo4L01jU2ltTkwzNjNPa3JYZGdNY01DaCtO?=
 =?utf-8?B?QkdZanNEbXducWt0Y3RVcXY1ZjdDeWFhZzRtVnRtdG0xY1kzbzNWM2tRQzYx?=
 =?utf-8?B?Vk1tWkVtbmpDdktjRGg5d0NOaHMwTWlFUmt4UjRkLzlJMXpRSlpqSVF1ZlRx?=
 =?utf-8?B?T20vejFldkxtTXI0RjVpcFQzRmVGTUtXS2U2VHM5NkFSN2d5cVVpemhtMW1v?=
 =?utf-8?B?cDdsT0EySUwrdmZtTittNVg3MUpVcXdTd2JpYVdVV0JSaGxQYlVYU3FoZ3VW?=
 =?utf-8?Q?nhSQcASpy3AJLFpA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c14c63dd-57b4-4e8d-44f5-08de4ca07f1e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 21:22:14.6571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qpKvn3f9xzT2jqrSZfoDAEHWS84NlBFFBlSF3LSUd6xWPDDfo1c+azcJ5ZQCVpAMU0YJCjZqNku7vYOrcT1ATusOIYUWGOXute+UZZpNWFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7446

On 05/01/2026 9:12 pm, Nicola Vetrini wrote:
> On 2026-01-05 19:14, Andrew Cooper wrote:
>>
>> llc-colouring.c uses binary literals.  These are safe to use now since
>> 4.21 with the updated toolchain baseline, but the Eclair config wants
>> updating to allow this language extension.
>>
>
> Yeah (though I don't see a strong reason to do so, for a single
> literal); I can write the patch.

A separate discussion happened about starting to use binary literals
more widely.  It's a capability we'd like to be able to use.

>
> Also xen/arch/arm/acpi/boot.c could use __func__ as almost everywhere
> else in xen/

Yeah (although I considered that not interesting enough to discuss.)

>
>> ipmmu-vmsa.c has a git:// url inside a block comment, which is
>> considered to be a Rule 3.1 violation.  In principle this ought to
>> fix it:
>>
>
> Indeed it should.
>
>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> index 7dee4a488d45..8f5fc6c93bc5 100644
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -60,7 +60,7 @@ removed by the compiler, the resulting slowdown is
>> negligible."
>>  
>>  -doc_begin="Comments starting with '/*' and containing hyperlinks
>> are safe as
>>  they are not instances of commented-out code."
>> --config=MC3A2.R3.1,reports+={safe, "first_area(text(^.*https?://.*$))"}
>> +-config=MC3A2.R3.1,reports+={safe,
>> "first_area(text(^.*(https?|git)://.*$))"}
>>  -doc_end
>>  
>>  #
>>
>>
>> but I've not tried it yet.
>>
>> There's a R8.4 violation against __stack_chk_guard.  I think this wants
>> deviating locally, because it's a fairly magic construct.
>>
>
> ack.

For the x86 side,
https://eclair-analysis-logs.xenproject.org/fs/space/verdesse0/XEN.ecdf/xen-project/hardware/xen-staging/ECLAIR_normal/andrew/eclair/X86_64/12595699289/PROJECT.ecd;/by_service/MC3A2.R8.4.html
shows that we've got the same problem with pvh_start_info_pa and
early_hypercall_insn.

Like __stack_chk_guard, these are external because they're accessed by
assembly, but don't need/want to be declared anywhere else in C.  What's
the recommended way of handling these issues?

~Andrew

