Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D47C1C8C131
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 22:45:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173387.1498434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vONJd-0007U0-6L; Wed, 26 Nov 2025 21:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173387.1498434; Wed, 26 Nov 2025 21:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vONJd-0007RY-3D; Wed, 26 Nov 2025 21:44:45 +0000
Received: by outflank-mailman (input) for mailman id 1173387;
 Wed, 26 Nov 2025 21:44:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GqHT=6C=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vONJb-0007RS-53
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 21:44:43 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a7ad91b-cb11-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 22:44:37 +0100 (CET)
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com (2603:10a6:20b:6::31)
 by GV1PR03MB8816.eurprd03.prod.outlook.com (2603:10a6:150:a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 21:44:33 +0000
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4]) by AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4%4]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 21:44:33 +0000
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
X-Inumbo-ID: 1a7ad91b-cb11-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLjNIukgz4ZTzv4wdWU5yx0Hd7lSx/SZjUJ7JFvDjoyfQrl+sNwVEpMs3rHAPtDCbgy6QtsWqBbvA4p9ntpeZcIP/FcNPXkXNUsuB2nRpO0co+2GDMm/wU4fzCLXoy+GoskLyOEfCZ5VQBTSZ0AldW50wBhUOx6c2SNAE6HdMjlNg5vINvmQr84XHEwF7hiK6fqauNBqVLWF9IN5emZIiPuahkdOamp75U4AeNURVrt8gQ6Xg7j2lHW1/2p1ANSIunHiPhO8v0MtRHy1UpgNJDdHQuH6ocIWM+Dza3Vc/iefx9xk4KXsY1pr2y7duMP4fVRNXCikCgKG/aqJxNwY3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaCpp4+7ZvJmSjmH+1MOhVwWuVQ1DaInOI89e3IvGAI=;
 b=bkbfY+frx1/f01mIyg82DhKnBenN24/heBK9gxGotUrhciTBw75TMAdI1fJLWVjeqzBTMd0se0GYZEENQGfp0PTqlmBxPXCX3EQQpj4XpOwWkln8J9v/Cz9asYNG4PTz6Y2RbhWZtYhwp+pGuZyPBzzoBA1CqXXadJOpfLzprfICKejaunc/aIPUDgEH8WelExG6TzWatknAk/ax+d23kt4eCbjYAaLzSBbRY7fPHSiyZouZ7b/0pxWdyihXMSIzidpvCMOgrwPGEi0ob5qNGD31PC1LNMGD4Yp3TNAXHkelZjWFE2eESvYQjo6NcaqfpZFGpzPjT8s0CWtC5Mb5AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xaCpp4+7ZvJmSjmH+1MOhVwWuVQ1DaInOI89e3IvGAI=;
 b=nzjbwI1upH51QgYbjLiXz1PAhNhxXi9v2pUzO78ICLQr0qgzFvAHAFmABrTet+1FurXt//lTupbV3U3M+jWzPl2R5L/0NdXvOo3X/jmV1ge7bSie9SCXdjBYjOt6XRzbBwg0z24f8UX5AyELF+Ic7tDbER7uqVbqzx88uIh4vaa6NoVwJupUgwPwueHAt6iFPklgzXmn4x0z1X8JmvBMwkqt3ocoSHHdmWJ4AHfRDOlfj6KHdFfkTIszfvP2WpuAJKrt/8eXn6EgtISjxIP/QtUEy7wdLroO1vMFGn3QZcvvuS3zZaKZPDrC/WVyhX98QPmdJUip8bGDQLoGmTievQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <64298088-489c-483c-97fa-62206f1a998c@epam.com>
Date: Wed, 26 Nov 2025 23:44:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/24] xen: consolidate cpuid library
To: Penny Zheng <Penny.Zheng@amd.com>, xen-devel@lists.xenproject.org
Cc: ray.huang@amd.com, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-3-Penny.Zheng@amd.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20251121105801.1251262-3-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0013.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::14) To AM6PR03MB4600.eurprd03.prod.outlook.com
 (2603:10a6:20b:6::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR03MB4600:EE_|GV1PR03MB8816:EE_
X-MS-Office365-Filtering-Correlation-Id: 39369520-b0e0-4007-47e4-08de2d34fc9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UHJXVk1MNlR6THg2alJUZmljckloRXhIaFAyZUdzbDU2SVFLUWZOdCtFYUw4?=
 =?utf-8?B?WkpmdUhId2owWmU3REVoSEszcXdJS01yaTNQKzdVRklodFRDdjkveXJlSnc0?=
 =?utf-8?B?bXB1dW1EemJJWW5NR3M1bnI5eUlxSHEwZ2o2OXQ2dlhXS3QxVXNlNGNUT3FN?=
 =?utf-8?B?OEwrZmswNG1NL0dlY3QvRGpGY0JPTkZseWNNUng3TThlQ09iOUR6cHlMdGdm?=
 =?utf-8?B?R3YxSisxbGFSb3FHN1BDY1JFd3UwZllhdUdqMHlzQkxJRCsyQlFKLzZjYzdx?=
 =?utf-8?B?TEo0dzVDdDJGQlIxUFJ2QmUxSmxmelpJUXdCUFYvNDJqMHNIenE2bDU1UjVx?=
 =?utf-8?B?RUFnVXFkR05jN3ZrMHMvSm5tMW4wMWFlM0M4WDUxSW5RTnZYMFRoMzcza1gv?=
 =?utf-8?B?U3J2MmMyR0kvTERpM0lqQ0JQYWtXS1E3SVJSQkkzdVF5c2x3ZHlBbFl2TGtn?=
 =?utf-8?B?OW13Y3FYdGxUTE53VkFhc1VFWjdWRTlwYjdsTWdtdVpBQXJNdUZINkdBeGYx?=
 =?utf-8?B?NndoSEI1VG5QbWR3Unh0M3hpWTlZNUFtSDVYaWE2T2gzd3VJalZLNmo3Vjds?=
 =?utf-8?B?WXFHNE5EanZOTW8wNHh2cXA5S1B5RytxZjljbDhVeHVOc1ExWDF6OHpyOEZj?=
 =?utf-8?B?aVkrNzM2QldnbTRSeVMvdTFWVnBudVVGc21HbHBEZ1UxU2dxRlZwWW5ZWU44?=
 =?utf-8?B?Skx2ZEpXcnRJSWZiV1QyVU96ME05eWRzbUM5OU1wZWM2Q0t4eEZ2MTlIYW1y?=
 =?utf-8?B?MUdFVHB1d1dqTE5iQktGT0tXekc2ckN6NFRWWk5qUnAvbWx4WEVDUklIL0to?=
 =?utf-8?B?aVJSWTNtemFrdThqVXhJcmVvZXI2RU5zbkx1SXY2UHlrM05LRWtQS3NoVHkx?=
 =?utf-8?B?cEVhR1BWQ2dRQzE0M3ZHeFdJS0NhWUtOZU5sYW5oajNrOWJ6WmlFd3dmZy94?=
 =?utf-8?B?TnV6UkZzcFBuYUI4OTcwbk9OTzA5bENtTXhsRFlCSDlvN3k3bUtRcWJKZ2Fr?=
 =?utf-8?B?a3NITkJrVXVkdkZackN2NmxVdC9VSm9sVDYrK3d6aFo2dDJlaFlqWUFkc0tx?=
 =?utf-8?B?Ny8yTW5DYUpCUDI1M0htazBTb0MwWDZzTGZEZm5SYVdpS2tmeDJWbjlUejFn?=
 =?utf-8?B?MG16cGRwanZnQkRMMmFHYkVCSFMzQ2FXMFkxaDNuOUlUUXQrY3FZSHM4S0Vu?=
 =?utf-8?B?NHFUbjBVRXpKR2xzMTFLS1owa3VlWWRZKzE3SUIvN05QZzZCaGlrSDlNSk5y?=
 =?utf-8?B?WmF6ZERiSHlJb2RmWEVET21aN0l5YWVSMytHdFMweTM0STd1TnhlMVpHZFhV?=
 =?utf-8?B?UTlFSjJ2NmpMUkF1Zk9VVG5rZkxoSHVsZThLK3hIMEdxYzVNd0JmRzc5ZG9x?=
 =?utf-8?B?NzJDLzdscW1KVlNjc3JwNDlNSUwyRHM0b3ZHdk9EZW9tZlIzSEM4ditnREI1?=
 =?utf-8?B?bHR5eU4wWkU2L1A3UnFtZzNoQW9oUUdJaStUKzB4Z1JUTHBueXp4K3hxaFBj?=
 =?utf-8?B?TWZucmhVaGJ4ZENNMUQwVWJSL2YvS210NTJuRGt4SkFmSWtnMGQ1a2xVU1pQ?=
 =?utf-8?B?YS9VRDY0aW9zbmZNWHhKQmR3QkxyRkZBanhDYVpOWWd1ZGRtZEc2ZWNzSTJt?=
 =?utf-8?B?NkZGNWhiMHJpWXRsRENCNVNISzBiVnJubHVYWnJJbUhubmxkbEZ3R1JRcTZh?=
 =?utf-8?B?ckc4VnlhRDZIMzRlT0YrT3FlelFFQUdBbkFlRVA1ekQ5aXdHdVlKV2ZyNEZh?=
 =?utf-8?B?RDcxZGM4QTlHK05TN2o4bmJkVFFTTzhjaG1XQUcwODlDaTRrRjdTcmorNzVh?=
 =?utf-8?B?NlovdnhsaVM3a2xuYi8vM2JkUWNnZTQzZ2wxd2dmNXphdFZsbUJXODc4VnZO?=
 =?utf-8?B?MjB4VlNSNHZDQ01DdVF2QngxbGFEd3dZYi9KVnQ3Y2FrWXVtazZLWjg5eklE?=
 =?utf-8?Q?KwGjbJPbZKtXg7kTr+8tBwOwa45Cj2YH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB4600.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHpVWjF3RTllaVBlemxxTDA0UWlzeU85cytnQkxtNDkrQW51bDZzL1pyMmY2?=
 =?utf-8?B?RUt0cUtzLy84OWdDWmx4ZWIrUVpSSlAyd0k4cTREMFNnYURDZ3psQ3pZSnRh?=
 =?utf-8?B?Mklxdnc0Sk45N3ZlMGgvaXlTNlNJNzhtYVM2ZUxUNmRoTHY2V00rQmMvall1?=
 =?utf-8?B?NGJJUFNJRjl3VWxLMVF4L3dnek5LRThDUXQ4VmY2MUtsNDdRdlZCb3p6OUZH?=
 =?utf-8?B?eldBWmRKKzVsdHhuby9IMnhOWFk0eFdYbHdTSlhCek44ck1McVVSTXhLRnFp?=
 =?utf-8?B?NjNVSm1SR3FIZW5XZDNIalIzWXhDVGxMR3lwQjFrZHF0RkNDZ2Y2VDNDd2dz?=
 =?utf-8?B?aTd4TUszeE1TaTNpdUVsZFVUd3VRaG42MnFQdG9xMjRyNWlVaDNMbnhWOHhY?=
 =?utf-8?B?RGo3aGdtdGYyR2wxbGZDdW1yMnJQeVkzdklqK0YyNjFwaXhHZWloZkNBeEJW?=
 =?utf-8?B?dm9CZERtcjZRa25idXdqYmtIR0V3M3BmRnp1TmxvMW42VDFHSEd2ZW5jUXlt?=
 =?utf-8?B?cEN5c0tvWnhmZFp3VmZsVWlsN1NiNHduTkNVT2xTYmQ1dXg5a1VROXliSTk1?=
 =?utf-8?B?NGR2VG9MREJOenNuMlJVblV1b3krdnpVZmNmTk5EZUFhQUJPYm9YY3FRUTJp?=
 =?utf-8?B?emlHMzRydERjWEhPbmxYbVQzdkxIeS9XSEZDZmNPSW9RUTF5bGNPKzF5R2M3?=
 =?utf-8?B?WDZtdGtwblBKeGdTU3pHdUpsRjlIYUl4OEhSazhWZERQMzdOZjB2L2NNTzND?=
 =?utf-8?B?Sko2SG90YitYV05VNmIvbjdWWElOWXhpK0xjSnc2UVoyaGZCejBLRnp1RG45?=
 =?utf-8?B?S1FMcngrSFVpWmhaN29LZjlVb1JlaWNtUnQ2SlA5SVVmUXY0elo3Q1lTY0cx?=
 =?utf-8?B?V3pBZjhsS0hHa1FmU1pySnBJeDZwa0x3N0U5RkVpcGk3Q2hjNGNRbFh0RFh2?=
 =?utf-8?B?L25GUG5Nc1BaTEp0OWtuS09qRHpzQ0QvSEFKTW1ML0JYQW5WdmNabTlrYklY?=
 =?utf-8?B?b3BVVXAwb3ZobjgvVnBqQVBCS2FMSVg3eWVhUGRoNWR0T0hoN1FBUTJxWlR0?=
 =?utf-8?B?eHBBM2YvS0xwYlFvVURISzBGZG50RCs0cTlaOEdPTUxocENhMzZzQmNNOGda?=
 =?utf-8?B?YnFnVkNKcVRGVjBuY2VaNHZ2WUJ4djdmWGt4ckNMdGJPejhmVHJGbHB1TWVO?=
 =?utf-8?B?MUhyNnh5Ukw1K0czVWsrMkNVQVBScU5CWkY2V0VjMm5Pdjc4Nis3NjNqVzg3?=
 =?utf-8?B?VmROaCtNMGN1amc0WmlmbFVmNTFENzZvcDI3RDNsc24xbGFwR3NrMVQwUHRo?=
 =?utf-8?B?NkJFYmtzdnFVS1VBQTZCb0hpWFpscDJLY1dJbmM2MWEwS3l5SkJjcXFOeXdq?=
 =?utf-8?B?ZXdIV3ZPeXZQWjZTNlE3d3RIa2pOYUUzaklZT2U0ODYxTm8rRTNwQ1J5aGdM?=
 =?utf-8?B?WFJLeTY2VHFHZjJWSXRhUjZIdDIzaXptZXE3WEdMeEhIeXpBUmE4NG1NRTNy?=
 =?utf-8?B?Qk5DVXhWaXBpN3dTR1pRUWpoMzUrVHJ3NWI5U2VlTW0rSnAxMHlqSC9vNzM0?=
 =?utf-8?B?Sk15VTVKWTlUZExlZDd3VU9iU3ZoWlM2SWFKdjhJOXRtelZOUFlPNTRPSFdz?=
 =?utf-8?B?UER5OXBWNy9KNlZ6MThWbmRZYkd4aGJBOGFCTzJaTVBFVFpnWXpGaWZ5eWRy?=
 =?utf-8?B?cUpBQnRjUzhzUlBhZ2xwUW1mZ1dWOHhoQThrMW1GK2NkR3lRQmpxNmN6Vk55?=
 =?utf-8?B?bTRqSm5EeGtXSjY0ZUI3dFhDd05MeTh4d2ZiMEREMU9UZnVKd2FBOCtvc2d4?=
 =?utf-8?B?QTlEaTdZV2gzQnpQVEJDTkc3a0svSk5yblZvTDUrbm5yeHc1aHpzWTZDTHVZ?=
 =?utf-8?B?NUpFditPRlZ5MGx0Q2FvZU1XYWU0VTVETXlOSndUcDZYamRPL3FsNjZOZ2VN?=
 =?utf-8?B?Q3ZVT2x0RGp2MTBxQU1RTlhTUHZKTHplallLQU9Cdll2bHNXVWs5STZCRDh6?=
 =?utf-8?B?R21UbTUzby9uMTh6alh6S3o0dVN2SFp3TnUwS0tmc2dKbVNQdldtN2huYzc2?=
 =?utf-8?B?Wnh6MlhIQ0x4c0h6cXY2N0EwY2JUTU1uOU9UTXNJVnhpVnZ1Qk9LakdKcFJP?=
 =?utf-8?B?ZCtNYldMY1NBRGdua2N6K1JZN0NQaHB2WkZVUGNtQU4zWFJjM2JpRy9xTUNW?=
 =?utf-8?B?WlE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39369520-b0e0-4007-47e4-08de2d34fc9b
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB4600.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 21:44:33.4754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I5oUVdRRmarseP3a8X2akVm/aKbET4qqbNLFpVDVT3AOPlqDg4LC8mQtEQJn25AAM2Kgy4HsKzron3g0eT/dUDgglpVbGVOrXCDm+uSEOCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8816



On 21.11.25 12:57, Penny Zheng wrote:
> There are some cpuid library functions only referenced in
> XEN_DOMCTL_get{,set}_cpu_policy-case, and shall be wrapped with
> CONFIG_MGMT_HYPERCALLS later, otherwise they will become unreachable when
> MGMT_HYPERCALLS=n, and hence violate Misra 2.1
> - x86_cpu_policy_clear_out_of_range_leaves
>    - zero_leaves
> - x86_cpuid_copy_to_buffer
>    - copy_leaf_to_buffer
> - x86_cpuid_copy_from_buffer
> We seperate these functions by moving other functions to a new file named
> cpuid-generic.c, and modify related Makefile-s to retain same behavior.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v3 -> v4:
> - new commit
> ---
>   tools/fuzz/cpu-policy/Makefile               |   2 +-
>   tools/fuzz/x86_instruction_emulator/Makefile |  10 +-
>   tools/libs/guest/Makefile.common             |   2 +-
>   tools/tests/cpu-policy/Makefile              |   2 +-
>   tools/tests/x86_emulator/Makefile            |   2 +-
>   xen/lib/x86/Makefile                         |   1 +
>   xen/lib/x86/cpuid-generic.c                  | 273 +++++++++++++++++++
>   xen/lib/x86/cpuid.c                          | 260 ------------------
>   8 files changed, 283 insertions(+), 269 deletions(-)
>   create mode 100644 xen/lib/x86/cpuid-generic.c

It seems this patch is not required prerequisite, at least definitely not for Patch 3.

In general, i think it can be removed from this series and sent as follow up patch.

-- 
Best regards,
-grygorii


