Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E01347DBCDA
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 16:44:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625223.974292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxURD-0007zO-TR; Mon, 30 Oct 2023 15:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625223.974292; Mon, 30 Oct 2023 15:44:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxURD-0007xE-PG; Mon, 30 Oct 2023 15:44:23 +0000
Received: by outflank-mailman (input) for mailman id 625223;
 Mon, 30 Oct 2023 15:44:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxURC-0007vv-7M
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 15:44:22 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7d00::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 319b389c-773b-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 16:44:21 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8554.eurprd04.prod.outlook.com (2603:10a6:20b:435::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.15; Mon, 30 Oct
 2023 15:44:18 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 15:44:18 +0000
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
X-Inumbo-ID: 319b389c-773b-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDVQfblLVApXbf0UJs9uBAoBkCzIsF5vMApWGEwxKWXBvUydszGPbs9hbqjpjFLJVIhiB4BUkionRujjsTDZlwpzXZP7IB+ss3wnqbCM9Pgzrs9YXZh9rrbAbB1eWoiNuVofB+RZftb9cXGyh8CICO/WPDH2eK6aJBaLtDy3e22dPQDqCLHoEj01dmA/AJlG8sL99DX4S3RMOicspCq7yCRJKrHWyp3ax+yAxsREXRowy7rf8ObfXoRmWZ1A0ubOuGTBWJIscfEmR6nZUj8StZuDCJ/9lOPijlV9pu/MQaHYNpYcrQ0dQgnQ5EGUfCh6fyZwfuoZrd/faDdhucMjGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSsiBBz0NKVnwVvQLWQ5dOmjEcYbD1xFhZ+UcxN7ENY=;
 b=Z9DVxFa7LYht22qktTYk08emTfDMaxc59ZrGbpkEKpOJaYmjT7MoTQniWgq15GHCDg+mfOAVMcTGoa7RQ3+VVrBm//q/gOa9hTEFeYFYtN2j7Tlz9nc+sZ/XDhJ4th9KWeBTvG9WnUyrf7IdpOTMeuGGfY3iiuk7SUWIh7LZHrwEt2ZNkyZZQ4jiYzLeaTS/M/mOjVENltv3wU5nUUuzHPMu64p3Z2+6HfjlO0Pm/pd3FAUYskMKxLU1H3K+istalbdGtjOP7BmW1ntWc6yBvuBUqeftK7s2XuKkzEi8I+jDT3E4XV7FgzZkh96mp4M1rrdORhHHjz5jRPP6Y45Y5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSsiBBz0NKVnwVvQLWQ5dOmjEcYbD1xFhZ+UcxN7ENY=;
 b=jgYTOZbVqbmUgIsvcyWZzrQkTt7vgGLKcLvUO5INuCbvOJ0YxapueQxXauTA2SHh0Ww9GK1KvN3OTMOfGRLmO5v3j4h+TH9r7CRyLukm0/cLEzWf1T7/e37LT+6QyfAOFt50sAEsadSvxKBgVSQp7fodLLGZI4kdKOl7+GHiMvx2zndXxWpP0dzotMlzz2UwrjVGcbt5iqwozIefY8WKLRp/EOsK8JZ3zPMR3veGTVkra871fLB/PcWv2pgDrSxPD278YO2rAsCd0fk2l7ErJLbZOwx+VYd2r81596kEPYg5UEn5g6I/K7pStZgqooKZKVQxI100Umu8ecq+WwXvNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c58421c7-898c-ca00-a8f6-f91819130310@suse.com>
Date: Mon, 30 Oct 2023 16:44:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v2 2/2] xen/iommu: use ISOLATE_LOW_BIT to
 wrap a violation of Rule 10.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Paul Durrant
 <paul@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1698413073.git.nicola.vetrini@bugseng.com>
 <6a1590b0d002641fe8dc53a2368ab8c2973e4bb3.1698413073.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6a1590b0d002641fe8dc53a2368ab8c2973e4bb3.1698413073.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8554:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e9b645e-2cca-4e98-c947-08dbd95f13e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BxnGEGsMm3VYtedUzokoT5hyeC3QHbTmupzIZxpcEDtZhTGjldKiFy9+1hNcCKKRq/jvlhO84ycaSJN2kRmB+jy8tJnHEvdhUoRM13Hv7LCjrgcHTxU+1yHyqB/HNAK3YgedqDusceDNHgmLph//kbMavKDp1gGeHaFx2n52R5vK9KLXytXbjurkeDLrVjmmAnbgM1LdXmXkvDt5UBvRzNRwVDEmlr7tSLugTCPVsoC/TvVs06VPDYKNuv443vqiqu+94oPaF6/xC+oi8k/9dY7Vl3WbwFONGGCF5ALAs26P/Q5S6f6F/P5MSodKDFoMobKOtKwwAcOdVeOapHcg0S4idMAsM6qz5pz1JVbAkV84os1XCfRSFgzRzVO17TCq8MtODmx4iTH3J6EcXucpk9lRs+f8rSTSIcxm0APICeCiKG0ToAel0BxFqWbMI/8o1dI/8GVVa2GjBgWkDKcOTqt3rFaDFQVrp+seznyuw4jeoj5koIuhm1lwBI6/6R14J61/LCrjLqiD46q56mcsq9eecvaAZuacEhk+wNSBNdf7tYiOi3KxDF6X3VOu9ZRUDhmFPmvhlIBBzxcHLmreWyY99/8InJqg88LqnQld7KVXENqjhGjhO8oakBxTFL/qDawKo272KWK1P0QsRcIcKg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(366004)(376002)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(2906002)(316002)(66476007)(66556008)(6916009)(38100700002)(6506007)(53546011)(478600001)(6486002)(5660300002)(66946007)(6512007)(2616005)(26005)(41300700001)(7416002)(4326008)(86362001)(8936002)(31696002)(8676002)(558084003)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWkydjcwV2g5RUlEckhhWGtrenlJMUtxU2N2bzNhd25CNE9mUVZEbW5nUXdr?=
 =?utf-8?B?WEpaa3F0eXVqajRFclZvSUczWHFtdUhVbWluOGNINkxFL25RT0lpRFFoYVZR?=
 =?utf-8?B?eTBuZkpGcURXY2MvR0lhZEVTTEdKa3AvRzVta200RnZFcC80SW10SnJuWFNs?=
 =?utf-8?B?QkZaRG5LZWZPZ1dGVmxHMUptUDZMU3BZOHpBc09LdENkdTZvbDA2V3hMV3N0?=
 =?utf-8?B?Q0k3bldQV2g1K0RvNzc2bWltT3h5VzFHU0dpVXE2eko3Vk5pb2NOeElzWjdY?=
 =?utf-8?B?OGRRdjU4MWU3SGs1SEhLMHJKUFlWZHpLWHovb1JBNWppbUwvNWJVQXpsaHFq?=
 =?utf-8?B?TGVFRWJ4MVpkcEROOXovQW9kZjhISlE0R0RHbEVTOFdjTEVmanhsbDFnRDdp?=
 =?utf-8?B?M0NMRlZWeGRJR2x2aGM4amdpemZIOVdQSnEyWWFvRnAwaG1Ob1cyS0dyTHhD?=
 =?utf-8?B?bDh3Q2N5NnFnSzdTZm1vbEhxY0xTS21pVFk0T0l6a3BqMHdmUGhmYWk0RUVG?=
 =?utf-8?B?enZQY3V0R0N5ZXJZOXIxa1JvNnlJMWR6RlE5ZWFFSzE2dVo0a04rVDBxQldi?=
 =?utf-8?B?WVlTUm9BWGk1Y3BSQm4rVGE4MUxjdWFUL1FaWk04TVAzc2FQTVlxdkhPbVRX?=
 =?utf-8?B?ZFRZTnU5L0RNVlYzakhxOFAycktVbXFYVW52V3ZkYWE5VHh5bVdVSWMreUFP?=
 =?utf-8?B?bk1ZR2JrTStPMlVzMEEzUkc4VmFWN3FRZG90cUVibzN0QnpJUmYycERoTnUy?=
 =?utf-8?B?MkZzTStWcEVNUWV0Y3oreDhSSkt1VVVESVo5K3Y1U2lSMVRVbEhMSWtRUUxZ?=
 =?utf-8?B?amlhUXVLK3p4YkxEb1JHdjM1R00wNDZqTHorRGcycUhKcDhXMDFUMGpNZncr?=
 =?utf-8?B?cStjYS9MUFpzUWxLUlgyZFlrS3VnNGN4UnVUK3EvSlJSNTIwWkRmd0hDMjR6?=
 =?utf-8?B?RWU5S2dlWDVzN3VsaEpiMXM2RUpEdHRLd2w4YVQ5a2dHWC9nclYwTW1vTlF0?=
 =?utf-8?B?TnVNeHM2bnlvTU5UU2o1dGhtM1VMN09OMER2UEFFMnd2Y21xWGdoNTNxWWw4?=
 =?utf-8?B?WDZHQjhROWZYUGlEbHdvS3hGR1UrS2MxaWJCUVlRb1BUUGI1RUcvblRRWkNT?=
 =?utf-8?B?TkFKSEhqR3MzOWdPZVUrMVRFcXBGcDF3QmFxVnRlcmtZYVplMnBNd2VteVVa?=
 =?utf-8?B?bzgvSS9KdWYzU1hrNVN1Yy9FeVZvRHNpQU81VVFSbHFkYjJzMVpDR084STkr?=
 =?utf-8?B?am9SZVFQN1BGbFo1UmZvblp6WTYrclB0V1UzcVZnOEZGY3RzSjFHNmMyWlNK?=
 =?utf-8?B?Rk9FN3M5TFl1SStjbkR1Z0kwTHpETy8yOTRYUlY5aE9NTWhrTWV3NDF6c25B?=
 =?utf-8?B?Y0hKSDNybXlNTDdzNkgraWF1QjFRc3VaVUwvQmNEd3NucTFxYW1NM0NCWDB2?=
 =?utf-8?B?TzFVNC9FNTZrN3hkU1BQU1FvVURkTkJpUHNpV3BKM3dYeVh6dnhiTVRyeVRY?=
 =?utf-8?B?bVVycmtyeVlndDc3MnYxSHRVWE1vUDU4N0RnYnMvdkl1Ykxpa2x4WG9kditv?=
 =?utf-8?B?VHRxUnlYU1hXSm56c2tnQzczSkZjYk9MRmRTZEZXNEJCNmFDamFYdEt2RXFH?=
 =?utf-8?B?UkdsN2FRbGsva05JT1BHMUlTYkpPMjVuN2FHN2UxT3hGNUJycHo2MEoxM2Fo?=
 =?utf-8?B?VTFaMXlQMGlYeXBTcFFnTEhoOVpKaEdYWjl3VnIyZytQcnd3YUpmcDF6YWhN?=
 =?utf-8?B?bHBuSWdWVnkrdXVyR1RubzdldHNLcXZldjNBaXdQZlZ1Rm9JckZtVHRzcm85?=
 =?utf-8?B?Mmg5VzVnSTVxbG84V0FTd3lHaXk2RFVCS3hkRDFOakFaY2JOUDVjWmhiOExu?=
 =?utf-8?B?a0VNbGlJSWRCTWJLOVZ4OFlZNVlzaGI3M1Q1UHNXWFF2SmFUWUtxWU5KaXNl?=
 =?utf-8?B?alA3c0ZsamJhNTFrdis1SDJWb0c0M1dtZ1VoQ2szVkk0NS9Zc3FrWHQwdGsy?=
 =?utf-8?B?WW4rSGdSc1ZMT1JneStMdEJCalZkT2tuckFRQUNYaUxpcTAyOHBnTE1oMXpN?=
 =?utf-8?B?RVpaOHN1elpXTVMvRndoTU45NVF1MjVWVlQyelBRaytJQ2hhdXcyZXlKVG5x?=
 =?utf-8?Q?1ZumOPx+NljtqA+jLpGLkTSrs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e9b645e-2cca-4e98-c947-08dbd95f13e7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 15:44:18.3761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MXQYxucybSpQWPxc0kH+UGKbGBasrpJZOQZ3rxWVMAlvzmTeo/C5zIctrD6ZZjJnO/1VhhhZoBbbrHGgwgHxdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8554

On 27.10.2023 15:36, Nicola Vetrini wrote:
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>



