Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F083477284D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 16:56:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578580.906149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT1eK-0003uY-F0; Mon, 07 Aug 2023 14:56:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578580.906149; Mon, 07 Aug 2023 14:56:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT1eK-0003sI-Bc; Mon, 07 Aug 2023 14:56:00 +0000
Received: by outflank-mailman (input) for mailman id 578580;
 Mon, 07 Aug 2023 14:55:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qT1eI-0003sC-Ra
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 14:55:58 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 835b0b33-3532-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 16:55:56 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8622.eurprd04.prod.outlook.com (2603:10a6:102:219::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 14:55:54 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 14:55:54 +0000
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
X-Inumbo-ID: 835b0b33-3532-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJLJLsVPFpIikUtDG6pMbqUJiEikE1JrqcAQuLouSBUueHHouQi6MJAlqugipgJkTnTXJF+be/hCf24HlqnT0nyIIellnOOBzVAWPJxckWRIW+LSP1UKNNB8pkE1AJrVMXhxLoz1PUzCkGaZhSaYKf3HGUPLJTI/oU6PWqKBNikymMmlEC3Vr0BWy81ziaq6uiRlvJywrOlnlQf7qH768aK+ilcp3Tthg2SI/fUcIb0RyUHLsd00tLHVFp+ocZlRxeSrAcVHhGN5jzJVJC3Pb/0PiEiiSOHUgL1cu4AfODYmM95RzXAUs7GCFtQ0fb27q0Kos5TedEDv92rX6NeApA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGn/cAoqOUISw54luILiQN/Pji42DpLD5bwIJ0SGs1k=;
 b=ZxiyJjeKXCgj2Ie73tsCKXhPhIhjq6g+hmE3s3FtHysuj+QsjDfKBt+5P/68b/gcx0KB858+Tl8KpIqxMH1KWn+8fnDjShx7OTMX6y8WvC2v+NhAvOJGsDqibCDuRt0tesYSCgGWNmoqlCgExFkJYh2qxQcMfyx2UeeOraruVpdwR+CnZqrXeaWIiMZPkB/3K8Sa1RFytji2fyWPVjDDa3RJvOGHjvQ5nCjvbG9ETIQQ85GFYtj8CTUbRzmomTiF5OawZJtIi2azHPOJ9RderEJ72lit3OaBIJyWF7vg9MG61iRkJT9sMb5LH5kbXMJWZgw5nDYNmm66T8aqGwftdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGn/cAoqOUISw54luILiQN/Pji42DpLD5bwIJ0SGs1k=;
 b=Fh2mm00TN0jqx2C6n+YXivpvxClRhJX2uEHTNQ/H7AcQAsQLdsVCbZhqw45ogsNvqMvzTfU/sOx/KrhDNcJCmIykLVU5m8rE4SvFmpelIJKfm16DWaW/FZGSU0Rt7PoXIQPxfUDOCDZefiTOekktz+pJHO7/nmTQueOcMyuLjtSloMGHjsb8T50XXhdoqEeAzO/afSOF6nkBbSyeoRXSiG0cdkWByO3ciJhhuxpMUUeIv5WMGoP+wbtIH4ROVM+sy83LBDL2ks/vE5aFM4tujk33ee7q1A428p4nMufd5FMJpMrfYWTiaAR7WMj5Eryhjrbn//WH1WWMQ2eI6fr7jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f9119e57-45c4-abce-4a47-0403da7b83e0@suse.com>
Date: Mon, 7 Aug 2023 16:55:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/4] xen/ppc: Add OPAL API definition header file
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1690934409.git.sanastasio@raptorengineering.com>
 <398ef92c0103fbc70f53b26403fa6596ac73ec0c.1690934409.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <398ef92c0103fbc70f53b26403fa6596ac73ec0c.1690934409.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8622:EE_
X-MS-Office365-Filtering-Correlation-Id: fab3745b-7cf1-4631-c873-08db9756667d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bGUgK4zgI3cWrYj7ZJeq/qpOZBNh+LpTtOtJQXksqBCuSgc2qcAk0EUEM3dNKsdT+KPBvQyI/YJLIHtqsmF8p9X0ysnpZbASjJ67b0oQ3F763Tdm1+xwaldF1okaREwG+gHS8pMiGZnXKdHfR8gtCyT+grZGImKT0/pjDMDn/F+vP9m5SqwFR7jVbmrS+xBbrNe7kQkSIvJ56gfeoXiNiuVOcKifh1DJfvNuI7mws1GE70IRCtzaR16kDOx9ZrH0Va1Wl2BmmB+BiOq2gmMjH76h88r5rF9hDad8AJTpHI0YGsW2HMo5FLj8WEH9SVPsuji0195H5mt5dErHVyfe4ChqV3YTbMCxx4kUjhNgLqcmhuq8ep/VAO+81jKrTAQZFdHBvwMw7+J5fUD5vIY2QELILbFIgrGy0FKrrAxR73wSuRbDKnhL5+wdkOcp5ftIcuXtQ6CPpCUi+RlZsinEMeqOC8kzt4FZDOzNc5A+3KfxQllaTEVwj0yQmX9NlH+qNlhK/orUqw1grtpSGwYFYxK2h8dUo+H4xChuiVyC97R/GVrcN3d4JpQnW56BpDsKcnBRn8UXnFsVHA2ISKVTXnTWl1yXfWs3rk0AFhbrXrIdorMhGjGGwze9QalhNANpsVnN/17oozLnamXDRFbW4w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(346002)(39860400002)(376002)(136003)(451199021)(1800799003)(186006)(478600001)(38100700002)(54906003)(31686004)(2616005)(31696002)(86362001)(6512007)(53546011)(6506007)(26005)(36756003)(6486002)(6916009)(4326008)(66556008)(66946007)(66476007)(2906002)(5660300002)(8676002)(8936002)(316002)(41300700001)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnkyYU02WW9hdUJsaStWMnZPK1gvNUk4VlZ0OXZEb3VrUklxZ0VjQ0xVK0dP?=
 =?utf-8?B?TUZrOEMzMDFRbG9kbTBOM3BvTiszYnh6SXlFSmdhVXJNK2pSU0ZGTnFhKy9I?=
 =?utf-8?B?ZzFZaW9nNTZRUDhtU05sRlZkbmcreWlUcUlrMk51S1B5OHlycCtYcmI5UTkz?=
 =?utf-8?B?UGZyVS9sSzFOcEFZUGZmWWpmc1hOK1pZWkovenQyRi9QZ2tRRlJ1dUova1NW?=
 =?utf-8?B?UTdJYVk1RCtoaFlzMUlzamczdERueG5RNjdhTElMbWlsckFaUE1BandMNCsz?=
 =?utf-8?B?eFlMeFF6ZUY4QThMek1DVU9HdkVBbE5yaFVnbmdVS3d3eDhSM3lXN3BoLy9Z?=
 =?utf-8?B?QXVlWXl0K0tmOVNMTEYvMHFESnpCTk44RFdWWXFTVzJ1MkZMekVvbGlxN09O?=
 =?utf-8?B?bkFGSHAvNDVwNEFldlJvclpoVUE2MWNadVZidStsQ3JzZ0pFRjVkbzAyQVFK?=
 =?utf-8?B?ZzhPQzgxMEdKTkpXT0lJb0Rub2FnOUJQZ0pyaENPUEwxTWZseEZoNktleFU0?=
 =?utf-8?B?NmpRTVVDbzMvOCtEVVROVXovdUpRaWs1bnVXVlpkUVRKZDFJUk1kUHdFVGNn?=
 =?utf-8?B?cEdkL1h2TEQxRVp5eUdtZkFEbmJsTndUdk1VclVtRHNpZmdFa0Vxc2ttRThM?=
 =?utf-8?B?V3Q5d1F6MHpsdVM3c3RkRy94M2h4S1ozdWpjT0lBbGhjQWNBbU0zQW4yWFVP?=
 =?utf-8?B?cGFWU0xsWEZOR2ptL3ErQ2dra2IyNW0razRBMG45RWJPMDVmSkhSOFp4NjI4?=
 =?utf-8?B?WVFMQjRrSUtQSk52clRCSHU3ZEE2Qi9jZHlYRmdsWTV6UUNKbzlVZGtTNCsr?=
 =?utf-8?B?dzFsMWdQM2FnNDBid2ordzdVbS83MmVHQ0tEM3ZiZW5Oa3JNd0hhSXREWFkr?=
 =?utf-8?B?NmhscmNraU9mVm44RW9Ya2grMmU1blQxUzhHMW13UTBrci9sNUVxSzNzZXdP?=
 =?utf-8?B?bys4WnhoNzM2bzJJOWpDSFhUdUZzV09oVGdlUlZuQmZjVklvRXMydFVZMExT?=
 =?utf-8?B?K0pIRWlmeW9tZmVTRld6bjJNVWFtRXorTnBPeWJhb3J1K1BrbWhrQUtmUC9G?=
 =?utf-8?B?ak5kUThWeDhqa1o2dU1qZ3pkL01YejlKdnZpaHdUSkM1cVdjNGdKSlg4dWJt?=
 =?utf-8?B?YWk0aXhhOWRHL3IySFFoM2p0MDFxMlVwQ0JrUDEzMy9sMGVycEhKT201aVpN?=
 =?utf-8?B?WmFvOEloTVdJb2NvRkJIeEtyTytuQmpYWWU4T3lacCsyK0dsREdZbEtuU0Yx?=
 =?utf-8?B?T3dBbDlxa1lyeVFoMVRBaHhRZ1lWdk9FQ2Q1dEVUMm1HOHhiNmVLNEd4bVBQ?=
 =?utf-8?B?ZFJPcHNVNnhtdEo3amtzYjdxTW14TGRiY2I5Y1lJOEVKUklaYSs1N0M2MGt6?=
 =?utf-8?B?WjlUS0srWlYvNWZ0ZWptcU5IdU11alJQR2s3MjRiME9HYXE3OUR2VzBPQ3cy?=
 =?utf-8?B?a1hoellrcVFOVG54Z3I5SGZQNUVUenFXa1FVS0I4M3lrWCtHVS9mc3ZpUHl1?=
 =?utf-8?B?anBCUzh4a3lyd01rbG5WYURpWm9HMVovbzlWNWtmZlk0eFltUjhueUVETklI?=
 =?utf-8?B?NU5BeForMXNXL1dMWVRSd0o5bno4WUtQQ2JMRmgybUlxVkw0UmZwWGJ1bzJT?=
 =?utf-8?B?MGxpNEtIZDd1aVpEbFVkMDZiTUIxdzN4TFozV1RqOUFYbldsOWNHWWp0bHZJ?=
 =?utf-8?B?T2NqQzB2V2o4MUdoQ08rb2xFb1NhSzdXSStGNTVWMVF5cFFrSkxURERzYzQy?=
 =?utf-8?B?VGQ3VG15QWkzNjlUOGw5ZXZYSkFKWk9rUEFLbGkzby9DZUlpRmkxaHNjL1gw?=
 =?utf-8?B?K2dhS0RGVnpRVGd5MWlvczMxRlpOeklWa0R4RHFOK0Nwamt1djRSMDVOTVZh?=
 =?utf-8?B?YlpGOXo2akNSNDloa3oxRGdDalJtZkF3SkN3dTNEZkVkWThwYlVhTVpxRExa?=
 =?utf-8?B?WTVHSG1UQTNveTFDdHlSVUZ2U0RZZ0Nwa2JtZEdkci9rdU9DMDlpRFNVTTE4?=
 =?utf-8?B?NkhsTkFObTY0WnlUcldRRW1OY3F4dEU0Qm01eDlGaEcrWDROamE3S3NyUFVG?=
 =?utf-8?B?MzJKSjJxSlowSzJkNVpVV2hpMjBIYjE1Z2haeGs3YVVmUGVLWkZWQm51RmE0?=
 =?utf-8?Q?G8zG/Lur0cPpWVQeF02uHuMQT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fab3745b-7cf1-4631-c873-08db9756667d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 14:55:54.7348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Bk29mMUk+c6LIadDUskiOVnZgj3b1LZrcV4JxRxgFpAHcZRBvvsOmaz5zUL0maWFMDl8mUeLdutS3YQb64XxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8622

On 02.08.2023 02:11, Shawn Anastasio wrote:
> OPAL (OpenPower Abstraction Layer) is the interface exposed by firmware
> on PowerNV (bare metal) systems. Import Linux's header definining the
> API and related information.
> 
> From Linux commit 5321d1b1afb9a17302c6cec79f0cbf823eb0d3fc
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Albeit (like perhaps most of PPC) that's probably already an overstatement.

Jan

