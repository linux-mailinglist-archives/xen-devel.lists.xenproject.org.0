Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B53A062D8C2
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 12:03:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444942.700136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovcfS-0003x3-C1; Thu, 17 Nov 2022 11:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444942.700136; Thu, 17 Nov 2022 11:02:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovcfS-0003uQ-8x; Thu, 17 Nov 2022 11:02:50 +0000
Received: by outflank-mailman (input) for mailman id 444942;
 Thu, 17 Nov 2022 11:02:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iQoc=3R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ovcfQ-0003u9-RU
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 11:02:48 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2062e.outbound.protection.outlook.com
 [2a01:111:f400:fe1b::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5df7e22a-6667-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 12:02:47 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6952.eurprd04.prod.outlook.com (2603:10a6:20b:107::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 17 Nov
 2022 11:02:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Thu, 17 Nov 2022
 11:02:44 +0000
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
X-Inumbo-ID: 5df7e22a-6667-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WTtxOlwebTgCSRc+0bk5TEGtt3zwLJZZ+X+SaOv6rfQIDpHnE2hZe7k6wyRyUyWZizVnz0DfoAEHEsLoudusQfK5lPTqGbNSNe51JLEJKzvHZPqolttcOT6JLg6vcnsKnUvS4NUE7MvyAESDpjAwej6tAVxqiR/PjlGTdQciyFOzKGc8J2U+1t6hdajtwTv2uFujrAX2mPP2JriciqLO6DPyPY0ZMI+LLdCw+HKq7VwjTiqvnwro9BMPt/410ng1P1C17OFCgtjhzrYJx8RmefmP/6+Jv6Ew3HFwmh/zw0vx+TnyIACFv1QlS4CjcHisUBMAPQlQk2G/C0SoNR65AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enzpmgm+Wx2zaDFOlTJh3Vae26JcCCV25docySovQK8=;
 b=NZUvasErmmNFS7MRqrUiE4n0rrpXXSeBDQOsTfEzavwkO2riVtf7wNTjqEtGYc8BR/4cAlLKIT9c9jlv6xsHqn++XjOcH+bqbU3gaRfnDnRjkbvG8cYM9x4n+lamWeAhNW4EHHhh0uOj4kjFrWUFJg2r7KBz07MFzSJIzFYCF+q+vHxUG9RtytqVKX99ALY4to0oa2v0vWyUuxaJ5yk/Fc81VjN3Tt2Fv7YNV0b//kQQYLfAtAbT5xhQeJJ9uG7aY070zpjlmgxrrVP71Z3hPJF3K88QtUdeKGDQdY6tLvvrk/XE7QUyPiB5oth6oipAnVO/vwq7qVTJvTqZM5ofoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enzpmgm+Wx2zaDFOlTJh3Vae26JcCCV25docySovQK8=;
 b=cRxghlbvPvJzTaXD1ZvPdCbRF8yQ1mqiEERCdLEUMf9FYx1VMoaL10Di7+WFT4gzuL3gxyefWvkpML8NLKhgHF2JAKkXr/RrEDuyYw7rz3fc5/IV77y3sKOATZ4H9IOCdfHaraLFI54WGMuL/8VpLkV8fh3/H4tcu/tpXdy+lmW/dLdrkzO2H8507zn+RqJjrnxlIi1blT7vkDOkhdmrVhi87NKRYDyWk2FXGc0iZ+zHpk1hjEfmxngFB3/cBToMa5rRWbOkkukaYeSH2G69ZpMJxMHw/Xb7NtSv55nPEOMrmv/3IgEulqtO3dLQ2hV/rr6bwRRjZZD9I/W7J4l22w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <487ab146-825d-37f7-ead8-a510b0c4d6b1@suse.com>
Date: Thu, 17 Nov 2022 12:02:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.15.4 released
To: xen-announce@lists.xenproject.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: ef8ba820-9410-44df-633b-08dac88b4137
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qAopv+CGxvEhc0yVEN6T4zvn3fZ/IlnrSXHYuBYT/2zcH7y8Xsv5Nnegi8+r9wLu2jzfAJB68ieP6d0ruulf+heXSaGrsjfHySCn/dFehDnjdxGpn2n+u0bIIywOOJWEDgBX7yzBNI+B6xc3ehjSj/cnE1Bt0pYUbNKC7CmZfmRQJqIQ4Zyhn6bd5SW2V5opTGiLykLkhd035kKs8z69QxsNfGOW2XzZZhR5u7MhwsrsERpNcTq+d1Rwk5HN6OkWZ9YDMtX6myUwvVDGCOYOs4rPEDNriofnyS+zIg0xHcXXUdXRlrbzcjm74UQn1vYzDp+/onjpwnYirzO98uNoJO0HKbx2Exb5lZihrQk6MfSBfxUF8xxxFiLUqbEvsVO2/LytbviJCkfkmitMYQx9ZTvIXCpWYnryw5DroWOCtLKq5NIUY41hhRZG1KHwIAP4YX0JF3dx/PyNjT0TWpKsHc17Cx7Iby67cxfBdE5Bkn3tjUSHamzPdXK3H0KC8xWysOnW8HHsy3eduolm91DBGpC3H1zc1/7Q9XLR7Bk4SK9AMu2123R1wWBFeR4vgp9iIWbI+kUn82hIS4yEfQ5gukK7gQEQaQaG+deduTzKHDGhm4y8yaBlbI2Xhy883CwXSfOIOYo19ls8/o/f2iipPfJBYP1m1D5nTzg9EfDrJ5z7aBC70yXvqzk9EFksj6jWZLDPWs8c2wnsOybiVz/vTSZUXgFIaZy+wQGHdE2xTAJiJkt6RHI+heISUz+5a3zr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199015)(7116003)(4326008)(83380400001)(31696002)(66476007)(86362001)(8676002)(2616005)(450100002)(66946007)(66556008)(4744005)(5660300002)(8936002)(41300700001)(186003)(26005)(38100700002)(6512007)(36756003)(966005)(6486002)(478600001)(6506007)(316002)(6916009)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzhBN2VKOTZ6Z3FTQUpBcWhlUTkvd2FpcEcxLytIT1hEU2M3OTZqT0U5WkMz?=
 =?utf-8?B?YVpzdlV0bEtUV1lSVC8zRldUTWprNTRWYXVybjJrY082a3VydW05dzhweE85?=
 =?utf-8?B?emlZczF1blFOaVJqZkNLYUF3VWZJYXg3bFdnNVZZcFpaUUhPektqa1ZnQnFp?=
 =?utf-8?B?d2gzUkNrWkJUOFFHc0t0Qi92NnVsZjNrLzdNU2t4T2x1Y1h0M1hJdXo4VlNj?=
 =?utf-8?B?WVFoRWFGUzUzVjFtU0VRQWJZamVmeUZCb1MvblN2eUcvem1ocXduZjNmcjFv?=
 =?utf-8?B?ZjlBS3d4RFdpUEhiYUM1ZzF3MUxUN21MZGRtS3dUdHVWQ3dFOHQvK0Ywdzl4?=
 =?utf-8?B?OXFlMDZUUzJTKzNjVEwzR09SUHgyLzY2UTlWMFRPTElpeUlrYytlNWVKMUlV?=
 =?utf-8?B?cjhhWlZnM3g2YlBWb2h4OGZSQlNEcG1USWxndXpSdm5QeDJpY3Z1b1FuSnlH?=
 =?utf-8?B?ZWp3RldNS3plYUpWdkpNZ0J5V25Db2VnVGVnVkVpVk10OVFCOURvTzVFcDhK?=
 =?utf-8?B?Ukx3T3Y0MEprbXpjc3RBT1V5QUlLc1NoYkFleXo5UVVFa1l3cFV5aERGUkF4?=
 =?utf-8?B?NWY4M2xwbUFmMUpnaitFRnJhblN3aFkrdEltVDJsbk1Bc0tOeFQyMm5LU1Nl?=
 =?utf-8?B?aEk1ZG1hOThJdHVxaWhWSHR4WTNSWmhiYnQ3YmNhK2RaZ3pMS2lnc0crVDhj?=
 =?utf-8?B?Zjh6UkI4bVVVZ3ZLdGRhN1ZxeEN4QjQ3Q0JUdXBKa2dhdk9vNCtYbnQ3Sm81?=
 =?utf-8?B?N0VmWDdYcXFOcU5LRFBlZnhwUG15MVI2V3RNUDRsY0lNVUJXd1lOeVhLYzRq?=
 =?utf-8?B?eGFCeU1DTzN6OVE5RmtpTHlJYnp3cmROT0hIWmUzU09heW9DU3ZxdVdqK3Nm?=
 =?utf-8?B?enBHUjlzdXIwdHRwNDltb3lQRS9SRzYyYSt1S25uQWdPMFBYRVB3M2NTbzA4?=
 =?utf-8?B?dkdqeDhWdkZnYTk5dkUzS1FJTWZXSk85dmZDTzdwWFpVV3BNeXRrK3VyR3Bj?=
 =?utf-8?B?YnE4UlpIS1k5UDdPc2lxUWRKaFFMaUpwRG1ZME15WUJlTU5sSW1iSHR5Q1F3?=
 =?utf-8?B?TVh4alNtQzJyMU5vRFlyRGQ1aUpLWDJSSmxWS1YyMEY1YU5SQmxXMDNZMnVV?=
 =?utf-8?B?dHdWVnozbGFZdCsxcGN0QlNqb3lFdzhDYllRUk90c202QUZoTkJEMXlwNkY3?=
 =?utf-8?B?T0dRM3NPOHp2ZXBsVGFOdC9sd0FqSUtablJ2bFdySFlmQld0ZW91NTUyT3R1?=
 =?utf-8?B?NTdXUmlFL3pKbGxQZDhrUEhocHVHREdTcjRZUjllVHZPd3RFa3VuRGVxcnBj?=
 =?utf-8?B?dFg0ZVZhN1JpbnlONnRYdm5CdlgyN0tzY2dYampPL0l3Vi9SYmF6K2ZzOEdp?=
 =?utf-8?B?dXdDWVF4dlNSOXhLNDFFVzc4SHZVaklEdGtsMkdlTUhkZjNmVDRyeHBjeEUv?=
 =?utf-8?B?NmMvdUNGcWpad0RmcE51VTRrWWpObCtacDZNWHdkQ0pFUU90em8zZUw5YlBt?=
 =?utf-8?B?aWJ2WE1pNkN3bUVYZGlVbnJjQk5YSThLVFh2cy9ydG5ycmRhcCtXQ3I4V05Q?=
 =?utf-8?B?bUpGcE10ZFJhK251eUppOENhaEpuOHFycFVjdzhlZHh5cUtQU2JwMTJDQ2Jk?=
 =?utf-8?B?SndPOTkrTmp0K1VuT3BZdjNQU3hIcHlPTlEvd01uVE1udkYvcEI1dWJpZFRW?=
 =?utf-8?B?VHlxMzVaamp1Sjk5Mmo5VTV2SHRhaFVTRkxxODFvUjBSZHFpdFdxYTRRVklO?=
 =?utf-8?B?Qzc5T1NtNVp1NXgvL0hHTXM2L2hNenhnUEFrOHZCWklqaEtqakRDVi8yUnNq?=
 =?utf-8?B?R2JPc3BqYktDd0ZFT3hnUjQwY0lBZGNNMC9uYUdPMWNWaDZFRm5xUXRoSmps?=
 =?utf-8?B?bGU2L0duZ2l2ZHBPK0YyUkFVYkJUOERYbDllaTZucWxwbnhBZ20wMnlSSC83?=
 =?utf-8?B?emFLR0dBV0pSZjFaa1pKRjJkd0V3ckk5Yk9HR3d1UGpvem1tWlJyQzBMMjM1?=
 =?utf-8?B?MUhtWnlvcVRNV1pMVWdPdWhldnBoKzFoV3Z5cXoxYzNNcVpmRHNvaEhIM3hW?=
 =?utf-8?B?eHMwYjlqamhqYjdxaXRjeFRuOVhOSEc5T1dqK2k4UGtSZkRtRmJvUFp2L2Y1?=
 =?utf-8?Q?qizIh41FJJeURYjKxF7EWphSq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8ba820-9410-44df-633b-08dac88b4137
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 11:02:44.8067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IGFohuTIDR2TtOhF16w8vcj+giC9FKcoR2tXzqjlemY/x+8vyPodshOtTiOCdKS+Ewv6wdHlSh5ECFbPi72RzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6952

All,

we're pleased to announce the release of Xen 4.15.4. This is available
immediately from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.15
(tag RELEASE-4.15.4) or from the XenProject download page
https://xenproject.org/downloads/xen-project-archives/xen-project-4-15-series/xen-project-4-15-4/
(where a list of changes can also be found).

We recommend all users of the 4.15 stable series to update to this
final Xen Project coordinated point release from this branch.

Regards, Jan

