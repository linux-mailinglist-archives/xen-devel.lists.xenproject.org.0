Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F6FA5C2CC
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 14:33:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908147.1315298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trzjj-0004je-1f; Tue, 11 Mar 2025 13:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908147.1315298; Tue, 11 Mar 2025 13:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trzji-0004h1-UJ; Tue, 11 Mar 2025 13:33:34 +0000
Received: by outflank-mailman (input) for mailman id 908147;
 Tue, 11 Mar 2025 13:33:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5FZT=V6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1trzji-0004gv-7p
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 13:33:34 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2412::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69ca5d3c-fe7d-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 14:33:28 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CH3PR12MB7763.namprd12.prod.outlook.com (2603:10b6:610:145::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 13:33:25 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 13:33:24 +0000
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
X-Inumbo-ID: 69ca5d3c-fe7d-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NCKHTEe4y/QJQbJQ1lpSg/J7opKOkoWPutFr9wNtQ9kA/Z1XHfyWgnig3Ph+ZSA0GugN1OeVc2v11Fal9WgXWS41+EfXTZmhYRXRT5fj67ju4l/WfNIN8rRjEyfjkgSvjDN8WkAL3ZqJgddmWhnl2B/oJA0TDH0U9fUR52+KfGOh5bsCQR5h9QKf9qiIzi58izL/TRP9OqZ5bpckLn+vuP0gqeTNW/V9CUn7G1iTyWk91GE+tcVkiF4GolqTc41Y/1MnHaXVna8OEBhUoTXdevvayJSy6lS2xdv5IH6FID1uriIkLebnpXzbvAqp9A8cSbdsqvIGjRyeLTZosGM4kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XDHAVDN9PSSrx3B66DflA08/kQ1c9upqiB4ay8GMFIc=;
 b=jPZovbdDUXYVfNNsCJzimgCSq+pa6WzqQWDnHpZk9AdB3S5/DyZ8gse1Fj5lDYNI5mjw7CEsnnI66lwBu6M9keAA31SgFg4gqVmn09fuVxfsuYnWj/KDaEazpB6idnEH1hyvR2RlxWe1H23CTHmM6CEgjVlQ3RgwGPEhNqMsg39neYIPJ6yWd8i5BVHSZbm2DZBoNrILQa+In8bQ9V0drvZDM7zps+Haxr5T+ueepXg0LPkOIV9l5M0ByL7Sa/1Vwx5fuRPZvW6+aFih94kfucCK2vC1XYT3B9N7+xDyIPDxSu+YamRmr1bOlz8ib6cWpQu/voqy8MVwfDSKprx9Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDHAVDN9PSSrx3B66DflA08/kQ1c9upqiB4ay8GMFIc=;
 b=GXM1aM/p/YA2ixvus/oGbRD19Z7Q2ReqFQqDAQOmTRL4W63RxLJMGPfPaYZltIeI5e8GMgUcZ0tA5HNVvTaAB+mBkJP7HQu2up6ztGt3UHzHndc3zOY0tmYbugxmG+v9dYUoE6LJfZb6w3sPhpZZkn8fgKdTiSlSa8TE/3Ss+tE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <df198c67-afa2-405b-bef6-dd4a444dc320@amd.com>
Date: Tue, 11 Mar 2025 14:33:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/arm: Improve handling of nr_spis
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250311090409.122577-1-michal.orzel@amd.com>
 <20250311090409.122577-2-michal.orzel@amd.com>
 <69E0A550-5B43-4AE4-AD19-0456AA280871@arm.com>
 <2d66e9e2-e6a4-4552-960a-2e8d95555ff4@amd.com>
 <17173844-577F-44C0-AA74-984ACAEBABC3@arm.com>
 <8b06403d-02c9-49d1-a5d9-5aef57dde3cc@amd.com>
 <69752546-1957-4515-B32F-DB541391AE8F@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <69752546-1957-4515-B32F-DB541391AE8F@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0262.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::8) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CH3PR12MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f827dbd-3e25-4e3b-3708-08dd60a14c99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWVCWUlFTE5qK3ZPRjR5cExGTHRIWUo0YVA0SXNhSGpWTjNpK0FleWpPMmgv?=
 =?utf-8?B?bHVtcW1BNlJEa1lGNmRKbCtzS2RSd0ljMkI3WGUzUjRCcklzRWM1TWZyVHlV?=
 =?utf-8?B?WWhka1lhMWdlNU16a2NNVURORlVNOEFHVXhoV3c2S1JjVURiaDFEbng3Qjk4?=
 =?utf-8?B?WFROUWtCdm1lUnUvTHlKRDhBcWh6UzFtTkYwMjNqcU45QkdzSThUTmIrL3ZL?=
 =?utf-8?B?MVBtd3RvZjFuem5aZFJ6UjgxSzJKTm80VWdUYkJUTjJJMEdlcVB5em9Tc3hv?=
 =?utf-8?B?OHhBVlcvQ0RwLy9WK0NmSjFsT0prSlhBbkVYaThURVA2TzBtZWovZXRVUGJZ?=
 =?utf-8?B?ZFdBYmNxTUFieEhaQXdadlp1bk14Z0dwbjJOQTZIU2s5dDZlTmw5aHBPNXNI?=
 =?utf-8?B?cmRKL3JKVXV2S1VmTmVhT1Z4VW05T1RtR3E5QWZ4VWJLVEduc1FXM0xjeno1?=
 =?utf-8?B?ZUtSOFMzTTBLaHk1b3ZuT28wV2QwZ0F0TmJYako2S0l3K1ZZZE55b0xpdnA2?=
 =?utf-8?B?Tk40My9iSmovRTBSUG41NDNEWHUvRHNkTlovM0t3c20rTW1XZzNaa0J4VmRl?=
 =?utf-8?B?S2F2NDFPY1lXUmNpZkRxVjByN080R3FRcUJxTEQ1QXJuYmt5TmNEcGJNTWNi?=
 =?utf-8?B?aUF2UjRTekF1SnBsSDIvY0FFUHBSd2d3WjJWZDBiNUNzcUNzdFBwcnVoVGVl?=
 =?utf-8?B?Wmd5RnhzZzRheWNUK29IV2o5TEd1dWtXZHJJNEZzaFFReHA3dzZtcEtUTXBU?=
 =?utf-8?B?MGxKbkJMSEpESmJtOGZiRmFFeDUwT1ovaFU0VUNJekZjNU0rQlhsRHpOZmNX?=
 =?utf-8?B?eFVsM1Rzd2UzQlV0Vmk5ZEszZmxsbVFEVlZyR2VjSzB4anlEY1RHL1dxTTZx?=
 =?utf-8?B?NHpZdzVDYjVWcWt0Z2RlV0ZIMHFvUytqV2EveFY3bWdZc29Za0hYMkxMZXRW?=
 =?utf-8?B?WU0wdlJyMnM1aDl0SXNMd08yak9YZTBpeEtQLzYrK1RIeDlOdGRqa1NpY29t?=
 =?utf-8?B?MW5QUHdoTUNmRm1aeXFVUklaY3VnZU9NMlFEaFoyWnN6bGZBdlhUUnd4Vytx?=
 =?utf-8?B?YWg5aVo4WkZkVnJwWTl3VEd2MjV5Q1E5MEtGb2VwYjJiMGtBWEZERm1FRmRV?=
 =?utf-8?B?bkZDdmlieTQyOTFEeTNDc1JQVjlXeEhhdWdSWVp1WExNdHlhQnMxWnVpSzRR?=
 =?utf-8?B?M1BuajRtaWhxaHh1bUZyQ1pZK3JraUpQa0VOd2pLUWJSY0w3anhETWNsRDNO?=
 =?utf-8?B?bVpwTlBxa09GZnQzTVBFd1JoSjBtWnZXRmc4cHRERnp0ZGlTK1JCZEpOWEhK?=
 =?utf-8?B?STN6elZzNzQzTEZEWkNMaXRlU0xLTWRkOUNwd2ZVclp0YUhPQThkS21ucEQy?=
 =?utf-8?B?d2k1OUN4WEptckdxT0V5dklYUjNReXNnd21sc0tsN1NhV2tQMWh4WGh1bjUz?=
 =?utf-8?B?VVBSOU9sWm83MldXUUJJMG9jUlA5MjFHRE13TCtRN2dLYjgvR0hjeWE3bVQ1?=
 =?utf-8?B?WFB3VWFTZkpDNzYvMks2czVPS25kNU1TRmJUQU1sTVBWanlMc0o1amdrNXho?=
 =?utf-8?B?QlVVYTJCb04rdTFTdkhKMitMTk96L29DckFYTGVqajFtdy8zSE1LNmxnVXd5?=
 =?utf-8?B?Zlp1RGpuT2prMVNkcVQxaHAzblUrMXVGUlVFMHFsQVFuSnpFWkRTbWw2S2FS?=
 =?utf-8?B?dzE3eW5QOUx3SkxFT2lBNzBEcmp1c3NjbzU4ZkFSNUduSzhxTzNUNXVnK3Fa?=
 =?utf-8?B?ODVONC81ZHpQS0RycjAwNXdXWEJIWUNyZ2RKc3FDNjN4dDJFYy9FUnRJZm9F?=
 =?utf-8?B?dlFVbE5vV0hFMjhsSnJyci9yRnpTQll6c3dwdmJvZENhWmt4M0p3TTY3d2dS?=
 =?utf-8?Q?g7TybdWpNZASG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3FsamRsaEVxSGVCUy92TVAwcWpiNWNUalJEbndSMUgrOW9tdDNZeUVjOW9U?=
 =?utf-8?B?cE9YQWJEMFQ0dTZ0ZG1WMTA4Zmd0TEg4WDZ4Q3FmN1JXQk93QmxDcUJjdm16?=
 =?utf-8?B?M1U2UXZCalo1cWp2dy9lcFJhSFM1d2w2dUNXSlRieTVlZVVOS2M4ZzNzeG9T?=
 =?utf-8?B?UHNTMHdyenpZelBwMXF1bnBFeUQraXllbXV5TmE5aEdWdm54QmRBSkE4aGcz?=
 =?utf-8?B?a2VNY1VUUlFQMUFlWUF6ajRmOEN0cDZ0ZFFYTjlvcFEwTE50M1JhUmt3UXJu?=
 =?utf-8?B?T2RTR2g2U3RpeG5jdUZlUlVMQ1dVT0NiWDUwRVZ3cktXa3JJMFp1alN2ZVVT?=
 =?utf-8?B?Mk5zNHU3TWlkaWRKZDJ6Z2YxWitkU0dwNnhiMUVUYWFlZnNyU0RsbytuQTEw?=
 =?utf-8?B?L0phbFFpZGpBeTJyQ1NqT0xOb3dJYnhYU0h6MEM4dzBoT0IyVGlEbFlnM2tK?=
 =?utf-8?B?VDczeWQrTk1TdDZFZDh1Y2ZKbHlZVDRDTlZuTllVYjJzUENLcEJlVkhRYUV5?=
 =?utf-8?B?L1RvRVNjQzRqYVR0OHBjcHFrSkZhN1kwRmJ0cmlJYVg2YzlialhwdUI3VE4y?=
 =?utf-8?B?Wjd1azdJbjNUb3NhbHN3V3M4ZkJSOVBmK3NnbkN5V1dGVU8zenEwUzVHc0Jo?=
 =?utf-8?B?M1ZiNk52NWI1MHg3V1JzQXBWcUpLTWVYdkdOaE9LRXlNeGtDazh2ci9PcTZy?=
 =?utf-8?B?dTZHbUhJQ1JkY3FwQ2pwbzAzTjZtaXFpNis3bklPKzBFeU5iODNNNDJqV1VM?=
 =?utf-8?B?MTNibkNaS3MvdzJOZlpJWGhxdCt4STdGZ2kzOFpKeDZ2WTB1RjJGYmdyYkJJ?=
 =?utf-8?B?SkV4RXJmWXJERUdaQ25VWWRRblA0bTR6c2RBZU1DMjA2dExPRlVPUWpvODlo?=
 =?utf-8?B?UVUyQ3VBbFpOdWpPQzZiem1IS2N4WXFWUWk0VWxta0lyd0NGUW5hb1Z6eTJO?=
 =?utf-8?B?clFIODAyWi9oUHp1SS91SCtaUGt3MmNHRmdWWUNORmE3anFjR0RPQ0lvN3RT?=
 =?utf-8?B?NHNycVJyK2U0QmRmampyWlE2cVRBaVVtMVhRRFNiNTgrUEd4MHcrM0ltL1M4?=
 =?utf-8?B?OUhDRUx0R2RMMWwrelUzT0VScGhGTHRqR1hBb2dzTTAxSmp4Z1pqaFNsck5V?=
 =?utf-8?B?UTV6VUZKblQzREhHVmQzbmwxUFhMc0RGQnpDK3FSdmNISm9Wc0o2azlabW9S?=
 =?utf-8?B?SHBvYUlKUmhwc3pwbXB4NDIrK3MxUlJUUVQ5Q2M2aU45VEJhRjQvWFF5U21O?=
 =?utf-8?B?MEdKZVpLRzgrcWJZTVIvNG9VMENYUjdVSEoyWTV6VG9wa01lR3dOR0QyeXQx?=
 =?utf-8?B?V1NEMjBwaXB6REtjSjROWUQ4ck4rNENVdzgzUFFHaDI2Z1FWZFJrZmFFTzlq?=
 =?utf-8?B?cGQxbjdqclhJYkxlN04yYnpEUFZEZXBodzVsQlI5bXlPcUNWL1ZUUnk3ZEFa?=
 =?utf-8?B?aVJKOUlvYUgzQ2lVYUF4dUN1VFhpTkF4dTdRZXMxeFUrZVN4dEprSlNzOUt2?=
 =?utf-8?B?QWw0TU9WMlBheitTWGY3MytRekNCQ2VuR1NPTlViTUU0S1p4VUJlMFVaTzVv?=
 =?utf-8?B?NjdBM0ZBZnl0WU5RVWMyQnRNbTEwd1ZESmNkTDdXTXNMbFRZMVJ6OXphTm9p?=
 =?utf-8?B?UGRYSC9KYWs0UGdqMFN1WFhrNmpnYzJlMXNRVTVtMGQ1MWF3QWdxL0RXamll?=
 =?utf-8?B?QkZ5ZlZNNEQxWExnUVhFUXU2OUhTVGZZSGoxTHplRXEzRHVQV3ZHclI3d01R?=
 =?utf-8?B?TklQL3RmekNielk2a0lrZkUyckpsNzJJbEVCelpUZUQ2SWMrZk5HQlp2ZmI4?=
 =?utf-8?B?NldpTTBleXJkNUgzTnV1YnlzK3psU3VHSDNNVU55NlFkTEVxbDNvNHl4ckJh?=
 =?utf-8?B?b05jbXVUa09PK1F3djdyWENCK3F3NzJ3S1IyMGU3enV2Q3IzTFdpRTlncmJo?=
 =?utf-8?B?TkNPLzJlTFJJbWVBci9mUWxFdXNxWU9ERE1sZW5pazc1UFlvVHh5NUUvNUEr?=
 =?utf-8?B?M245am5CQ2pCNjE0Zm1GMXpnOHR2MkQrSVdDUVhxOUlEb0h5dUQvaXRJekZS?=
 =?utf-8?B?UlF5OXZ4SWZiV0w0YWNrRi9SblFtWUVqWkJaRHlJdXFwNWo2cTNwL1A3eDdE?=
 =?utf-8?Q?4800=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f827dbd-3e25-4e3b-3708-08dd60a14c99
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 13:33:24.9366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0CBlwERSZzRMATtux3nn9kLhzB8Vf84xZl6nFcIsQYWCJYKsgM10LSAtyyqomXD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7763



On 11/03/2025 14:26, Bertrand Marquis wrote:
> 
> 
> Hi Michal,
> 
>> On 11 Mar 2025, at 12:06, Orzel, Michal <michal.orzel@amd.com> wrote:
>>
>>
>>
>> On 11/03/2025 11:12, Bertrand Marquis wrote:
>>>
>>>
>>>> On 11 Mar 2025, at 10:59, Orzel, Michal <Michal.Orzel@amd.com> wrote:
>>>>
>>>>
>>>>
>>>> On 11/03/2025 10:30, Bertrand Marquis wrote:
>>>>>
>>>>>
>>>>> Hi Michal,
>>>>>
>>>>>> On 11 Mar 2025, at 10:04, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>>>
>>>>>> At the moment, we print a warning about max number of IRQs supported by
>>>>>> GIC bigger than vGIC only for hardware domain. This check is not hwdom
>>>>>> special, and should be made common. Also, in case of user not specifying
>>>>>> nr_spis for dom0less domUs, we should take into account max number of
>>>>>> IRQs supported by vGIC if it's smaller than for GIC.
>>>>>>
>>>>>> Introduce VGIC_MAX_IRQS macro and use it instead of hardcoded 992 value.
>>>>>> Fix calculation of nr_spis for dom0less domUs and make the GIC/vGIC max
>>>>>> IRQs comparison common.
>>>>>>
>>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>>> ---
>>>>>> xen/arch/arm/dom0less-build.c   | 2 +-
>>>>>> xen/arch/arm/domain_build.c     | 9 ++-------
>>>>>> xen/arch/arm/gic.c              | 3 +++
>>>>>> xen/arch/arm/include/asm/vgic.h | 3 +++
>>>>>> 4 files changed, 9 insertions(+), 8 deletions(-)
>>>>>>
>>>>>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
>>>>>> index 31f31c38da3f..9a84fee94119 100644
>>>>>> --- a/xen/arch/arm/dom0less-build.c
>>>>>> +++ b/xen/arch/arm/dom0less-build.c
>>>>>> @@ -1018,7 +1018,7 @@ void __init create_domUs(void)
>>>>>>       {
>>>>>>           int vpl011_virq = GUEST_VPL011_SPI;
>>>>>>
>>>>>> -            d_cfg.arch.nr_spis = gic_number_lines() - 32;
>>>>>> +            d_cfg.arch.nr_spis = min(gic_number_lines(), VGIC_MAX_IRQS) - 32;
>>>>>
>>>>> I would suggest to introduce a static inline gic_nr_spis in a gic header ...
>>>> Why GIC and not vGIC? This is domain's nr_spis, so vGIC.
>>>
>>> yes vGIC sorry.
>>>
>>>> But then, why static inline if the value does not change and is domain agnostic?
>>>> I struggle to find a good name for this macro. Maybe (in vgic.h):
>>>> #define vgic_def_nr_spis (min(gic_number_lines(), VGIC_MAX_IRQS) - 32)
>>>> to denote default nr_spis if not set by the user?
>>>
>>> Yes that would work. My point is to prevent to have 2 definitions in 2 different
>>> source file and a risk to forget to update one and not the other (let say if some
>>> day we change 32 in 64).
>>>
>>>>
>>>>>
>>>>>>
>>>>>>           /*
>>>>>>            * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
>>>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>>>>> index 7cc141ef75e9..b99c4e3a69bf 100644
>>>>>> --- a/xen/arch/arm/domain_build.c
>>>>>> +++ b/xen/arch/arm/domain_build.c
>>>>>> @@ -2371,13 +2371,8 @@ void __init create_dom0(void)
>>>>>>
>>>>>>   /* The vGIC for DOM0 is exactly emulating the hardware GIC */
>>>>>>   dom0_cfg.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
>>>>>> -    /*
>>>>>> -     * Xen vGIC supports a maximum of 992 interrupt lines.
>>>>>> -     * 32 are substracted to cover local IRQs.
>>>>>> -     */
>>>>>> -    dom0_cfg.arch.nr_spis = min(gic_number_lines(), (unsigned int) 992) - 32;
>>>>>> -    if ( gic_number_lines() > 992 )
>>>>>> -        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
>>>>>> +    /* 32 are substracted to cover local IRQs */
>>>>>> +    dom0_cfg.arch.nr_spis = min(gic_number_lines(), VGIC_MAX_IRQS) - 32;
>>>>>
>>>>> and reuse it here to make sure the value used is always the same.
>>>>>
>>>>>>   dom0_cfg.arch.tee_type = tee_get_type();
>>>>>>   dom0_cfg.max_vcpus = dom0_max_vcpus();
>>>>>>
>>>>>> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
>>>>>> index acf61a4de373..e80fe0ca2421 100644
>>>>>> --- a/xen/arch/arm/gic.c
>>>>>> +++ b/xen/arch/arm/gic.c
>>>>>> @@ -251,6 +251,9 @@ void __init gic_init(void)
>>>>>>       panic("Failed to initialize the GIC drivers\n");
>>>>>>   /* Clear LR mask for cpu0 */
>>>>>>   clear_cpu_lr_mask();
>>>>>> +
>>>>>> +    if ( gic_number_lines() > VGIC_MAX_IRQS )
>>>>>> +        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded\n");
>>>>>
>>>>> I am a bit unsure with this one.
>>>>> If this is the case, it means any gicv2 or gicv3 init detected an impossible value and
>>>>> any usage of gic_number_lines would be using an impossible value.
>>>> Why impossible? GIC can support up to 1020 IRQs. Our vGIC can support up to 992
>>>> IRQs.
>>>
>>> Maybe unsupported is a better wording, my point is that it could lead to non working system
>>> if say something uses irq 1000.
>> Actually, I took a look at the code and I don't think we should panic (i.e. we
>> should keep things as they are today). In your example, if something uses IRQ >
>> VGIC_MAX_IRQS that is bigger than gic_number_lines(), then we will receive error
>> when mapping this IRQ to guest (but you don't have to use such device and in the
>> future we may enable IRQ re-mapping). That's why in all the places related to
>> domains, we use vgic_num_irqs() and not gic_number_lines(). The latter is only
>> used for IRQs routed to Xen.
> 
> So you will get an error later such an IRQ is mapped to a guest. Tracking why this is might not
> be easy.
I did check and we get a nice error that I find good enough, e.g.:
(XEN) the vIRQ number 260 is too high for domain 0 (max = 256)
(XEN) Unable to map IRQ260 to d0

~Michal


