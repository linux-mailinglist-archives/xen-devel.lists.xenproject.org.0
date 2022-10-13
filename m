Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3AF5FD89E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 13:48:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421899.667604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiwgt-0001IR-NQ; Thu, 13 Oct 2022 11:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421899.667604; Thu, 13 Oct 2022 11:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiwgt-0001GT-KG; Thu, 13 Oct 2022 11:47:55 +0000
Received: by outflank-mailman (input) for mailman id 421899;
 Thu, 13 Oct 2022 11:47:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mzGh=2O=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oiwgs-0001GN-Kf
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 11:47:54 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dde866bb-4aec-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 13:47:52 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by IA1PR12MB6329.namprd12.prod.outlook.com (2603:10b6:208:3e5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Thu, 13 Oct
 2022 11:47:46 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::cde6:a05b:5dc7:836]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::cde6:a05b:5dc7:836%6]) with mapi id 15.20.5709.019; Thu, 13 Oct 2022
 11:47:46 +0000
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
X-Inumbo-ID: dde866bb-4aec-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DwkRU0fIxBfOtIXYXPBnOL1ps62i71kOd4TWmabXXW8VG/JvHBnIM1dlwpEiPHOICwJpUCKLk3gbfGZLr3PlTXy5uMRCpcIdoNA/DDUtm2IsvsMaD3fFsaFd3LxKFfW3jZMW5M86sn3+h/zYUEE9h0st6eFMLx+TVoZ8YRjkpdejcMXz/MTKtfxMdNzfe4DFkH8oh1DsOkWhWcxOh+xcJQ+dnykrnv/JJyDaz2spVsdMGZjGvlkq7zmvtGcwaLwI0pUdh7v/aUpjEkks2d1ngLmpCJoledMuq9E7R2Jxr9mZOJdQ4Hhz3Bh7Bd/4UfmefoTimfJXmcG5MC+xyoyO9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q51t3g8JHDy475L9KMyzHLlrXzyn638WimG9W/daC24=;
 b=Fd8RGOU3ocI84wuSuStxPtGjgIm28Z9AtT9hcCLkvsSdhp4Io2OcwLqF1GMwWhAxq6XQAOJfKcGEHgxPFeOfSzBaDfuewzQ6aqRR+RbJCynWcjy+/n/lYRJA2U2a48Av2KyXdi/VdqaBdEKg2Ao36f/adnEJXZ91A2ByDwW3iNuTFMkh0KYfVizNpnBQA6KJ9kVNHEuh1oheQ+4Gmbgw7rnurFNZVAuvom7B1E5FqQhu40iz2ZeIHcTR80yfUqzh8DR58eJsPooC+KpB8TS+VtMj3arMIq3HOKRI5x+MOWsEjE0qnKl/9AVm8upC3znWvZcc1mOaC88VA8CEWFowdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q51t3g8JHDy475L9KMyzHLlrXzyn638WimG9W/daC24=;
 b=LjlzzPVuIFCjuAzI2Xk3vL2VM98AniGpxCedcy6PwU5N3U5ccCY/mUHYvnQwXZx4cr26ZY6uM0cRS9kooHXPIPpMPjaBVXyuve0HzidzEyKoVji482waukdLu2OGHB7ummJA0rAEmFSVU5fjN1K25i6VRMqGZFHVk9j/xtRLVXI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e2d041b2-3b38-f19b-2d8e-3a255b0ac07e@amd.com>
Date: Thu, 13 Oct 2022 12:47:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
To: Julien Grall <julien@xen.org>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, Penny Zheng <Penny.Zheng@arm.com>
Cc: Jaxson Han <jaxson.han@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
Subject: Need guidance to support reading GICR_TYPER (64 bit register) on
 Aarch32_v8r
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0434.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::7) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|IA1PR12MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: 628ff111-5860-422c-a641-08daad10beea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YeXROy1EX2LbzROMJSaQZz0jx2dcQg5D7sxGE60tgXK+8YsoPUijpuiDQna758p/1RhG9jqlx1wAJSlxapXQZGFGdDGxvacYc5MKIad1JKtCXw/kiE+rzcQ6jtNmzK/hbxoTO6DKUCGhChUt2KLfPjrdYEHiidHI9tk8DsDbXvHA5T9u2gc1WHbeR8b/S3WpRnLiINCzhev142Zi7lNFVCgFIrdSsWhTES1p+ruYfCI/2craeMDiZ0Zk1USnjWKyO7Eg//6yAfLii6JKxlLUzaS3Xzj9aMDshOeoeImG1kiqD8S5yRA2zGKHWfsiUUV73kIH+o4VSySbC+nV27f2USvKm7L+Agqc1covLt7SpVHFKT1T0JKzyhNzcxdmFHjc0kc9X3de66i7HBBapLX4hNRjfhnAIpuAvbM2778AFjT6cOkhVfWsGOMBdjFYeV10zSUgAP++62lLYBf5XReePkjKKv/J+jwLvfJ4VaWEW6Zyzr4EWfrGemehJn+eEL8Pv0tI4jFWtozQoDhXeOD78agrOsVx6kYVcot1txL5vr//n8czhnTrTCcJWiYBN87E3bANSBwVgfRj3+tR8o+sB3gCtvlqnJZadQxdsZ6lXvX26axTsHjgefkSS8546M48GVFXEUlLBsNFHqxH8GpDM8FkaKD556u+nod8Nz65MyHtRgShACcms8+Pll1WYkyrH+trt/Sdt5BslYpCvOrqAkITNGeYz4rGEvYh2hASnP9r+zQWmb08K3E5cHjwPLd0aAYIU7Xg9mltKaTbXgvbuF+zJccA954Ppc4fA/uf+4Bl2h9Cr0+QqoNVqT4iBYZjUfAO6HUYMxC8FImzl51y+w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(451199015)(38100700002)(4326008)(31696002)(110136005)(54906003)(966005)(6486002)(4744005)(66556008)(478600001)(2906002)(66946007)(186003)(6506007)(316002)(5660300002)(41300700001)(36756003)(8936002)(6666004)(66476007)(2616005)(8676002)(6512007)(31686004)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1YrbjBONUVXYTlXL3lvc1pheXljT0M3UTNNbXJSUkgwK2JQOHA5NURNaU5H?=
 =?utf-8?B?SWtUeW53Y3lhSkkzRzAwWmY1Q3dycnk3cXNEamhqdUx5c3FkZzZzck5DNHV2?=
 =?utf-8?B?a2JYSTVSbHQwMjRoRVB0dHIzdFg0SmhYMzZub3V3WEZIZlVhbC9zUm45SWZz?=
 =?utf-8?B?ZG5YL051UVhLNFlRaHkyOGt4MEkzZUJ0L0QrSkVVYmlhZ3ZDM2Y1YkxyV2J3?=
 =?utf-8?B?dmlCOWVnSUtFQ0xhU2ZtcG5CVXcrQnI3U3JScmtSTmhMQVpwRmVpQm9BRVZC?=
 =?utf-8?B?N1k3MWptVW1RNU1GcnY4ZkcyNDJpdFVuR1p6NGp0c3MvRlBGbm9BRzFGUmlE?=
 =?utf-8?B?ZzFSTStoeEV4bjRZT3Y1VTdmbUxneG4xVExDaUtMMUM4SVBUWDlVdGlIa3RD?=
 =?utf-8?B?RVZGd3lIbEVYbG1hZTFKaVNNdUttUHRzREFZeDdWUlVMQ3E2VklQVzQwdDgr?=
 =?utf-8?B?RDNsTzdPZ094QUZLbS90SlBraFp4ZUgybEhuN0VnQ0hnWlFtc3dDQnZ1Nko0?=
 =?utf-8?B?bGU5dkdpcHNSWjdlM1N4SVFTcXRid0lPZHhYT09pYVpaVmNOMmlXdVVlaTB1?=
 =?utf-8?B?WW1VWm5vUkNDREtZcW1qckpOekVIZ0ZFUEQ4ZFZBQjZRc21CRWJaa29YNS9y?=
 =?utf-8?B?ZXNKU3UzcHIvSnp2MC9oT2QzYkszaXNJWHEvUEJ3LzBiYkFpakRUMkh5QUVF?=
 =?utf-8?B?VWpvRWc0bnFOT3gxYU1IVjAxQVhvQ0VqZGZBbllTOXBwWDhZR2VLOUgvd05O?=
 =?utf-8?B?dEJxWUdVT0x0emFubzZoSVNMUjVyL0NzQXdoNWlBbVZkUTRXYTFaM2x4SC9z?=
 =?utf-8?B?L3hjaWpHK0duR3RsMVBoSXhRU3BFOFJhMUVESUliNFRIN0FFd05vSjNkWlJY?=
 =?utf-8?B?SFZmaTVEcUdjMGxHdUk0bWFWVWhVaHZ6TzNYWHpzM3NjbVo3ekpnOWViUWk3?=
 =?utf-8?B?eW9GQU1aOFc2TE9wWUNIdm93dVJlMGJsOVozR3RuR0QyY3FrcU1jT0s3Z0xO?=
 =?utf-8?B?RkJqSHAwekdnWVU4T0VIYitlNGpOWURoTWVwcHV5T0hhZ2poMXhKOWVJYUp3?=
 =?utf-8?B?eFZhRG1CTk9mSXE0SDRjRlVyQjZRL29MTDgvakgzZ01KdVpPQ0QrdHc4bmdC?=
 =?utf-8?B?YXNJVUZrZitrT0FaTEJBV0FudmVickNpMWd0RUdNbHB5NW5ZeFViWitCUStZ?=
 =?utf-8?B?MVdOSmhNbm1qZzV0R2wvbzJkNUpZMW5yR0ZzVEJuM0NDcUdVNldMeDdHclM2?=
 =?utf-8?B?NEErK29EaEFEL0czZDVDaHJMQU9GZnZCVlpwSUNNVjBkbTZXMXJiS3JFc2NV?=
 =?utf-8?B?SnBaWDJTSk1kVWtpZm1yZVlVNCtySFlZeVN3SHhiajk1VmdUQ0tnSGwyT21B?=
 =?utf-8?B?dlNzSDh6dzZNWWxEUTZqdTNreExNSE54Mkc2ckxKV0w3SVNuRG5zVjI4L0hr?=
 =?utf-8?B?WEV1TTFmaTVZTWh5dDJUY0xHYnlMaGJGWnExUnNsbG5xN2VFVFJaMUtoajBu?=
 =?utf-8?B?SE5ud1Nsd040TFJHZWs0djIrMy95UmllemNVWXRMZkE5eHJsT1Q2M2V4TWJR?=
 =?utf-8?B?dlpCN2VHaTRUMjYvbGFXSVgzczBZSW15dW1LUzc1aUVjWjZjaG9RQjJGRWVa?=
 =?utf-8?B?S09Xa205OVU2L1FrTHRraDlWTU56NGFYNXpvT2YwUFFuZThlejBpOVR6SkUy?=
 =?utf-8?B?ZThQQmQ4NzhuRGtIVHNqSkVlT0pjRVU0TUNOVFB4U1NPM3gxWG9mTTRnaXdJ?=
 =?utf-8?B?ZURuUGZ2Wm1GT2pFSkp6aGRhSlhaUk9EeGhyRnA1NTlrUnJCWnl5N0VjU2M2?=
 =?utf-8?B?M1dLWklxWUpBZno5MDZHaUQvdlY4VWl5a25PRkRQQldLU2x1czh3QTFDTGly?=
 =?utf-8?B?bHFZWE02OENWdGFPbEhpcWk2dWg1UUlkSXJaaWJQWDNIb1Nyem5BelZlTzZm?=
 =?utf-8?B?WlRrOEFFRXRuZmpaRWtLUGlsMEh4cGNTcFdXZm1XOWhZQ3NVa1A3NHZrRkM1?=
 =?utf-8?B?anlvSHdDOXNhSXI1MmR1MnMzcldLaUJDVzFLamU1MG54eFhraUFCMnliMkdm?=
 =?utf-8?B?UHZnM0JuZEtpei94RlVzaENpRVpyWjZoWWo2WHJvRHVZTi9LSzhmbXo0SXBM?=
 =?utf-8?Q?yIiRV/GMmYWwtHcbuUGjl3O9P?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 628ff111-5860-422c-a641-08daad10beea
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 11:47:46.2508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ObfgA64/Qya0GrSVMAS5NuU0Rg5AwFLUOtZJuIyewTyJJ+DrOmbwAgZwL1YNXMdcyZO664BpGl67Aw/q/y/qUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6329

Hi Arm mantainers/Folks,

Please refer to the discussion 
https://github.com/zephyrproject-rtos/zephyr/pull/51163 .

We intend to run Zephyr as a domU guest on Xen on Aarch32_v8R fixed 
virtual platform.

Zephyr is trying to read GICR_TYPER which is a 64 bit register using 
ldrd instruction.

As GICR is emulated by Xen, so this instruction gets trapped with HSR = 
0x9200000c.

As ISV is 0, so Xen cannot emulate this instruction.

The proposed solution is to use two sys_read32() on GICR_TYPER to return 
the lower and upper 32 bits.

With this, HSR = 0x9383 000c, ISV=1 so ISS is valid.

Now, for Xen to emulate this read, I have proposed the modifications (in 
my last comment).

1. Does the proposed modifications look sane ? Or could there be a 
better alternative ?

2. As there is no 32 bit variant for GICR_TYPER, so does it make sense 
to read this register at all ?

Kind regards,

Ayan


