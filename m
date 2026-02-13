Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHB1Ag6vj2mqSgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 14 Feb 2026 00:09:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6809F139EBE
	for <lists+xen-devel@lfdr.de>; Sat, 14 Feb 2026 00:09:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1232086.1536941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr2HI-0003fR-Q7; Fri, 13 Feb 2026 23:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1232086.1536941; Fri, 13 Feb 2026 23:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr2HI-0003e0-N9; Fri, 13 Feb 2026 23:08:48 +0000
Received: by outflank-mailman (input) for mailman id 1232086;
 Fri, 13 Feb 2026 23:08:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v8h/=AR=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vr2HH-0003ds-Q4
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 23:08:47 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2657452-0930-11f1-b163-2bf370ae4941;
 Sat, 14 Feb 2026 00:08:46 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BL1PR03MB6120.namprd03.prod.outlook.com (2603:10b6:208:311::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 23:08:43 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 23:08:43 +0000
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
X-Inumbo-ID: f2657452-0930-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LnBWtelWEmnkRZh+4rpTgVTjBj8iiqZ9WnqreC5A80EtTG3RqSWUK+EiSqpYyW0qgiJ24/xQv446KQFE54ulKh26My5HGTuHrL4WWGU0A7gwxboheFhYzHCNWdJGudoWVYi1oKvEykJZNSOejsfAUdsFtgvYIEtM6UQoh5KJYcb1w1hLOuBUVHikV/fH4TkFEahfngflR4WTukTGAbUHoq6dsrXnUvsme8x2W4Zy2tdF7++yVUSfeAXftrtv18JgvHO/lfXsJ1lZfFznz8QHhBoPpJdvke9xoK5+QaYIrpUasSh/NPwB5Uo4EZU91NRmyaSeaFKSW2IKEQtbseP64A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hWE1K8RYaS8edjK+lxXn1O3S8TYeBEC9+BCY6ocqsU=;
 b=RAlzsyn8Dz7R8dIb80MQkmRCu64Uj5Cfm/KIYyvfBF+Z6RVywvu+gAjWUu9t0uc6v3Ta23X9iin+Y52/QYkSpvH/GFqcrHWqyojFDpSdW+GZ4+TkWAd6UuEZclHBYJiNM9YLbCbDjtiTmxsrv8exUJCr4sl3PUTLHIK74B0GH+kpkPfpmCKu4YAz5/o5jcxZsDX4HbUqmfP22Yo9Gop/fqPwVMTRr9rt2vc9rvVYN04I8ojrTxpA/qJHGyS9BjuZ2kBMOzXAUTWsiMw1m+xK/c9FzGr8nkQA3pJpZ6rQbRtBXq3rGFAqDRMCC+6znlHw8yxIt+xOycq2MIuIVonzmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+hWE1K8RYaS8edjK+lxXn1O3S8TYeBEC9+BCY6ocqsU=;
 b=WaglyPDIptc2OHeBaozb4HjsN7bO8sq4UpAnYrWV/pClYzNty6/OYUjzk3v5ldrrM+VxU5U+EZrnevBeQis/N+hGdqn7VjZ0fhmduyW3TOH9+fEOMxdua4fc2Uo+aROTSOxOMA2eVmbRNDjg0oGdbmEaXDwyAIhzNFuo7OeGTaA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f045fd55-5f3b-4652-b318-6d590d4daadf@citrix.com>
Date: Fri, 13 Feb 2026 23:08:36 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, roger.pau@citrix.com
Subject: Re: [PATCH v2 1/2] x86/svm: Add Enumerations for the SVM virtual NMI
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1771016301.git.abdelkareem.abdelsaamad@citrix.com>
 <01a922d2018cf657f842dbd325d0fdf819078aa7.1771016301.git.abdelkareem.abdelsaamad@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <01a922d2018cf657f842dbd325d0fdf819078aa7.1771016301.git.abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0202.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BL1PR03MB6120:EE_
X-MS-Office365-Filtering-Correlation-Id: 83543a82-a20d-4c87-a5b4-08de6b54d553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UnV0Z3NXUWZLVnM5YjRudjhRT1dxMml5M0lqdTEwVzdYL09hdnoyMENLY0Fl?=
 =?utf-8?B?akEwUDk0b0VSREQ4a1R3d1ZlcTZvWDNVTnBUeTdYejNqMDQvV0FvckIwYXl0?=
 =?utf-8?B?NkNDSUkrT3FCWEZqZUFCQUtUM3ZhcHZoZXVkRDZkTUZPVks3a2dpMjYxWTgx?=
 =?utf-8?B?NkRtcGkxUVJvS2t2bkorWGMvQjMxSE0zTXRDdEFiNm9XVjR5VkVVZHhPenY1?=
 =?utf-8?B?dTd5aUUrOFpyOG9JS1RJajhCZURVelNLckNiVEczU3RScm1PYjl6R3dCSlhL?=
 =?utf-8?B?WEpJdHRYNWRnOW5YYVJoRXVpY05XV3lFdFAzekt1N2RsMnB2T3pGeDVGbFNu?=
 =?utf-8?B?bDJQQmVFQ2RScldGL2o5N1NSUnFFL2JYZEF6M2RCTHFwWjBMY0crRlhYRmtT?=
 =?utf-8?B?bjVvV3Q0dEtlTlplVnV3YTJPU3htb3ppNE9Sc1lacTRuUFRIZ0k4MThqem5r?=
 =?utf-8?B?Tmx6N1RYakdPSWp3VTFqTzRJSGkzdXg2bmdjUk9HakFYT29sTHNHQ2ljdWps?=
 =?utf-8?B?Q2tDYmNzVVlhWnpWWVF0QjFoYnIzZ3FUU1Y3WDEyUW8rYmRjZlhkQlB5anls?=
 =?utf-8?B?eFdnOWJ3SzdkTEpKZUU1WHZ3M2U3TExPVGtaVHFkNEhheDdlKzZaU2g4VldX?=
 =?utf-8?B?VktIWTNpL1hMN2wxczQ2UXBnRzgrQXgxYXhHbHBaSXJtQnFPOEdDZ05QRVd4?=
 =?utf-8?B?SEFJQ0FNdDhaWWhtamdTV3owNkp0cXA5cTAzZzFLeTVNVUxRU0s3YzdQVWFk?=
 =?utf-8?B?NHIxakx2NHZZUnNTVzRrdG9CVzVkSHk5My9PRlJQQkVEMUxPZmVVVlhacUUy?=
 =?utf-8?B?L2hhSGI3Yjhva0g2ejNmbnFDWEVlSFZMMFd6UU1RWmRoT3NrTmFOcS9BQ0w1?=
 =?utf-8?B?dHdIaFdpWkJwN0swRDFVa0VPNW9CL0Rhc1RoOGsxNHJxMVYvYnQ1VG1kVE9x?=
 =?utf-8?B?ZloyMmJqdno4VWFkd1Z2VXpvNTR6QUE3MlljRlZlcUJEdmpsenZLRlRkeSty?=
 =?utf-8?B?RmhmbWlxL05mMEpDbHI3RDJzU2dnYTFNaURtNDZwaVFzenNzVjFSVjdzQmhn?=
 =?utf-8?B?KytEYlJnYzNzSXFra3cxSWVNWmR0SEg3L0ZpUkR3V1RZck9oL2txWFM4UU5K?=
 =?utf-8?B?ejRMandpU0dqdEpUOUJEQUNPVlVQcDhZUkkxc1pxZHpqeWQxL0FJTDNNbVNK?=
 =?utf-8?B?Y2hvZUMwd3JhbTF0S2NncElvYnZ2VUd2d2o5Y0t6RlFtZ1IxdmFZM0JDdENL?=
 =?utf-8?B?NFNqQUE4b1lHL3JqdnlicDVvUXFsWmw0ZUpaNndtbW5OQzBSZkdJaW9FNG9O?=
 =?utf-8?B?cHg3c3BDNExkaEVvdUw1Q09TbGN5R2pOK2pqNENwQmdhR3BKVkZsUTR0YWR6?=
 =?utf-8?B?cjhLelJkMytRQkphUU1PZ255bXhIYmVQWlBIdVd5OXREOGk0eGIvUXdHR3lS?=
 =?utf-8?B?MkcyK3kxSVBqUC9rbW1UVVhlL2I1S1h0WjE2dzZnTDlBZ29Mc1NocnYyeTVh?=
 =?utf-8?B?VWtDcW1zTUl6MER0L285OFllM0lsMXBKeHlpbVRzMEdEWEl6d09tbkRSUGlm?=
 =?utf-8?B?L2swdHNaQlA4SkVQdFFWRWY5UHh2cG9yYmt6OVVHZnN6aGJha0l3NE9xT2hz?=
 =?utf-8?B?MjdmdTIzQ25VRTlUaWNzWU1HVkxXeUdUNVVwNTJ5WTF4bXB5UnoyQkVIcUtk?=
 =?utf-8?B?MDV4aTdxSW5kRHBYeXVLSkNoTkh4Z0pUSGE5bmxtQXJPanhWcTZ5c0tVSTJp?=
 =?utf-8?B?TFl5Ny9UQ0Q2Y2xydE5lZmd3OXR0MkFlTEVielhDc0JKYTduZ0ZyeXBibDNF?=
 =?utf-8?B?bWlPOUFXZ05xUDVMSE1ZNHAyVGVWaEN0Y20yZjVURC8rMU1sbUxjQlRHUWF4?=
 =?utf-8?B?S0JwQTRRUG5FUlV4TmYyZkZhZ2ZWRlBJbkxWRHZkbHJFdmYraHhObTYvM3Ax?=
 =?utf-8?B?MS9BZy9FL3cwWmlsdzdnRjBrUERKM01GOUVCeVpaT3lrV0FBK0JRbStnZFpI?=
 =?utf-8?B?VW9zK0N3MTBNMDNNSlF4U2ZwL1RRQXlONzJpS2ltZUtEMWc1eUl0cDdHdHZI?=
 =?utf-8?B?QUJZN0FIQ29QcU5wVEp1a2RhN054alBmbU9MSFFwOUVIQVFEb1Irall2QXpS?=
 =?utf-8?Q?7pAQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0haQ0ZhNlpXNmZMSVlUWDJhMTcrNGgraDhleUYyUEIvTmRmMTRyTFczcjRm?=
 =?utf-8?B?T0pLS2xqdFo3cTNaV3dhcFhIUXhMbm9vajZwSGpWa0MyT1VEZ0w4Umo4S05C?=
 =?utf-8?B?dFc2dFZaMWtkNmFBS0U4aXlSTnVXU1k2dlJUYzBWYStiL0FFRVJQZFZ6OS9Q?=
 =?utf-8?B?VmwvMlo2YnBQVnQ1ZWRTVGs2OE5XWkI2WnRtS0k2b1FUUGpCZTNSYWJCSi8v?=
 =?utf-8?B?Y1E2eExBZDZBcEZ4b3N6bFJyUVFPOVd5VjZxUEVsT3IvK2VIMUpKeU85Umdv?=
 =?utf-8?B?UWNxZDVUUytCRmpjdnFYVCtWdnZHN1JER1FrNU43cGNJOWhWYlNCb0QxNEp2?=
 =?utf-8?B?MEhSQmpKd3Y2cHBoY2NJNklFTzEwSlVheTN0Q3VFOEw5RTZ4MndpSEpKcStu?=
 =?utf-8?B?TDhjNldRb2ZiYXpsalozanhRVi82VmQwWW1jb3VyOStIQ01TdVU1aVo4Q3BP?=
 =?utf-8?B?cWJ0dTdzZnZnMnYrcTN0OHBmaitUNVp2VGRZcU11SVF5dW5vQzUxRDducDB4?=
 =?utf-8?B?bFhKV1h5QjhPVXZHb1dKRURLZzZjS0w4OFNubis4cTBzOHo3T21rWlEzSG90?=
 =?utf-8?B?V0N1cEZSQjA0TmQyZ2hSQjNXUTFabzdDbEtmbWJmalhUQUFxUjk5cGpYTDNT?=
 =?utf-8?B?SzBuLzgvamNYQXY3bGltbWQ1T2FMMm90Vm1xclRHY1JGVGRYbG5GME9lR1ly?=
 =?utf-8?B?UHNRbVk2QnYxYmRVWEtCWVVYWGpueDdvS2RhYUppSk5GZHdVVGJWc0VtQVdi?=
 =?utf-8?B?cFhQcWZTRkkrdVQrTmdFU1l3ZHY5Y0ZPdE9qL0FiUVlqc2hXSXFDaXpienFQ?=
 =?utf-8?B?NFBwMHM5Z04xc2lQbjkwNjVSYmdHYm9Kc0hnTm1Jck5USEZFVlV5UnErOVpJ?=
 =?utf-8?B?eEtXaS80d3ZSTjRIcHRaSXBUUFZDeHNYVkwxMEhHb3EzQmwwOXYyOThZNllm?=
 =?utf-8?B?SExRKzdRWExhWVB1NmUwMFdQeTVCL3dreEoyUGJLTm9zQnQ5YVhFSDRaZHU3?=
 =?utf-8?B?RHZuMUl0NTQvZnpuMUNEbzhvUW9SODlMd2kvbEhtczliOG83THBVN0UzWjRT?=
 =?utf-8?B?YTg1d2xlYlIvaFRxS25qNHdQeTBFSjM4QkZWeE9IUUFxVUtlQmNIU2xLQlgr?=
 =?utf-8?B?OFZCTlRqbGpxZFZhbTZRSHIyQkxjZEMzSnk3clQ2VzhCbW80dW5GRG1qYjdD?=
 =?utf-8?B?VVZTUVZEdnBEbkZlTm5xakx2K08vaENlRE1iMmRQQUN0NTBlWGtxd3ByQnZE?=
 =?utf-8?B?TjVsdTVnNkRlakhmMTd2Y1VhdWN1Tk5uNmlOaTdNTFc0TnB5Ty9XQ3RwZHBn?=
 =?utf-8?B?Wmd5N2dpMWtjYmh5N000MWdYdTNXaVBqMnlISkFlZlBMcm90RU5HYXo3Y2hq?=
 =?utf-8?B?RkNRNzlDYnBsNnRxNStUd2RhalRDTFZOLzMrWUNPSkt4U0tOaWhXaGhNSzhr?=
 =?utf-8?B?R1dYMTJEWHZubHJ2K1NwTHRYaHh6ZFI0UkFwcjJ3SEo1OVFrcnZScTd0VEtF?=
 =?utf-8?B?a2oxWkMwYkZZQXIvbDVUSE1rYWxGeG1NdHFDWTdpN1d0RjZ2M3kxSWg4TEw0?=
 =?utf-8?B?ZjROLzZkN0JtOFBYdndpTEV1bVc5YXYzUVhDV3NuckVoa1QwY0xiaW5lcDB0?=
 =?utf-8?B?U0VEY1BXQlRsaXJJM3grSzZQb25tN1M5YkIvazg2elplZ3k5bDQvWm14N0xz?=
 =?utf-8?B?bnJ5dWtxQVpaWHhsdkU3ZmJidHdNK3FvTHFZTDNDNkwrbERoUThZSVV1anFN?=
 =?utf-8?B?c21JVU5KZlBjNllqR2lwQ3AzaDV1bW9YRGRQQUVXM3RicFIvR2taVktUcXlW?=
 =?utf-8?B?cURFMWlZbWUvcFhZQ09jSVVFcFAwbDFoTlRUWXF6a2hIWm1YcStVckRPZEVa?=
 =?utf-8?B?UnZ5US9xRytlM1VPcWgraTJoR0QzTGZhNDNYclBSNkhBbXRtcVdMUVkxdXk5?=
 =?utf-8?B?TVVETXNkclZDUVp0c2hPUHl3N3VUV1RKdWtuL08vZ0JwQkd2YnRKb1RNSTMr?=
 =?utf-8?B?S3daaldNbXlpbmpmbDdYVEVNZ2h3clJWOUc2WW5FRlFFTHJPTmdPbE5LcFoy?=
 =?utf-8?B?ZG5rM3EwYXk3UEt3T0dYc2FIa3o4dldwUVNtMUttZGI5Qy9YTEFzcTBnWjEw?=
 =?utf-8?B?YzlwNEVoUmxBSEhhVW4zNE8wVmZVbS83ZGQydGQyOEEvYXZuVTBYY3BvY01S?=
 =?utf-8?B?NS85emg4QVZyK3g4cXdvalhqL29yMVZjTHhYb3ZDMytVbFZ5RS9pRk5vanJy?=
 =?utf-8?B?TzY0MkxnOGJDVXRVM3FqanJITmcyZW1vU08vK3NJWlZCbWo3OGhLN2N2ZGpK?=
 =?utf-8?B?ckV5Mlc3ekVUZ2VRV1cyQ3ZRaFRvc0JWTVNZM1ZWdC8zZFdHNWh0UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83543a82-a20d-4c87-a5b4-08de6b54d553
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 23:08:43.4269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+Lgi4+p3troDLn8LLzFkGVwwh3VvKsiBRI9ZDWevX7kMRbhZ6JTKINsvXfOaJ7H0H7clOIsZWhScxjr2njPkt5DQnLINlyek6Q+xyvV5C4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6120
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:abdelkareem.abdelsaamad@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6809F139EBE
X-Rspamd-Action: no action

On 13/02/2026 10:44 pm, Abdelkareem Abdelsaamad wrote:
> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
> index 7d9774df59..ad17ea73e9 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -115,7 +115,9 @@ struct hvm_function_table {
>               virtual_intr_delivery:1,
>  
>               /* Nested virt capabilities */
> -             nested_virt:1;
> +             nested_virt:1,
> +             /* virtual NMI support */
> +             vNMI:1;
>      } caps;

As said previously, vNMI is local to SVM, and needs to not touch common
HVM logic.

Specifically, delete this vNMI boolean and all 3 hooks you add in the
next patch (i.e. all changes to hvm.h).  They're all layering violations.

~Andrew

