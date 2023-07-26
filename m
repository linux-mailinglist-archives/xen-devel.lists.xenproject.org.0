Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5037630B1
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 11:02:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570207.891782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOaP6-0003u7-75; Wed, 26 Jul 2023 09:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570207.891782; Wed, 26 Jul 2023 09:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOaP6-0003rw-4N; Wed, 26 Jul 2023 09:01:56 +0000
Received: by outflank-mailman (input) for mailman id 570207;
 Wed, 26 Jul 2023 09:01:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOaP3-0003rl-WE
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 09:01:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f407675-2b93-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 11:01:51 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8525.eurprd04.prod.outlook.com (2603:10a6:102:210::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 09:01:48 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 09:01:48 +0000
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
X-Inumbo-ID: 0f407675-2b93-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h5zfiGEdYOd1osWf4uyX0WXtvNSzzQgx6Arhkgrrs3k5Qh9iG7ta3ZTbG5oPhxjI3mNDTibOMDiU/fECuaBG546kQfqSoSxucF4AnzkoLGnvBk+6UXKqV+mEx/ljz08WgHd3Gg3xVb+kFGnZkz2biCd0j87aIJytK4PzNR3MOxzi9uRgs99Ghlz/haDImAGcH5aYNLfkk96RX/mX/8WKVQP6UXFDfuSNQru4TEH8ujJ6QwrGu+Fwt0Y8zeYZJrZAVoR2y6Xms767gVElyxbc8hs0noh+S8u7MgrTlEVf59dDCDkQ7CaBpILF9SrF5JuPDdFRmCMrfkera1JOvGbjrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eerz2M6E3rou8hNyM7yvUbjxsnb1T8UVB51DrYTxpTg=;
 b=VL1+ypIl3gUkdcXbUCRmApEoDGgr8lb3HrHC0Cndcar0tQujJJBuFxmp0S1MXUa4rFvWy53oWnrINsi2ERcETjfA9iirFEJFSjOFCF931eWRVUwiMnZ31o9WQ+saq5HCfQhz3FJjEQLiw2zpYgvxewrnd8iWsmPalDam6wKgmh4CwDUkAzo7koFChh9Z/CFJFmUvrHgrTsba5VnjLfozjIpMhOQdWW+tEo0qeh7MPcrtD/wgb0fk86DAcxUmHFw1gb/0UO1RSsavzsehyVjhdgIdPd2PP9UE6Qp+kgUb7OrmPlyZYdiVNfm7Rmb6D51VBbaTXJNvlUV378aKv6CImQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eerz2M6E3rou8hNyM7yvUbjxsnb1T8UVB51DrYTxpTg=;
 b=Vo+ecHzP+rEMeKZcOkqm7IbhjhBUML7ndKWQl5ahnXYfWvXqbJkBy2idewF1wdLktbgqXNBg0/lzyB7Y5cv6SgnFIYnds3MUxrRuW7UBXqXMHvb5n1Q2e8Um6cNjb2stgp6M3l9fi0GE8+UBl2UcHJDonxrkRpsBDO+48uDPF3dJOCN0kLKityHJ7Oubape+KLrIBPmH1/F8mxFv+SEyuQluaEwHYroyHKevLgyJDbSveTP0tcnWnLhuvEBEkVydjeDLrZ/Klf8ZPBWRKndMjkQ7swBohSom3c+SiIkPozz+N7pvKD3S+Mvs41eBc3qdo4FU+dtbOYyMIcre01da0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dabe1210-486a-3ee9-f568-77d651e7ef85@suse.com>
Date: Wed, 26 Jul 2023 11:01:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] xen: use parameter name 'mcs' in
 arch_do_multicall_call()
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cf380b972333d56858b10d6dd61b6033d3782fce.1690355367.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cf380b972333d56858b10d6dd61b6033d3782fce.1690355367.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8525:EE_
X-MS-Office365-Filtering-Correlation-Id: 120a2221-9848-4c04-f995-08db8db6f1c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Df+qxvnfA8+gtK3bCIjitLA9pFQxGq7h4Ry+2oTN+PJ7I+83Y9b7KX5uy4Uw8Kvp7yFa9HrzKGz+aUgx/+B7sSbosf0DI6LBwIbHJVuQTM1zTtQ8vUV9+m8LgfcWsd5tkJZKs8n5VBFMXRLACfxY5+YtfxCf8xLEOhHHE+tf9GxinbncN/qY1YGl/TTNOJo3l8ALByELEto5ey7R03AsbYHxx2WlyQiWxIA8lnvRWlboynksC52f2YYkP9VWV/1ZenrwgWtjqCVdSDh79wMi9Aj2QtsV2p/pgaY1pTVzE7G3slJIko9XLHuRXJz2RgDFYWQx3k5XP8Onv+Hr3cSB54UTXQPyohwj1qm76KGMykdN13JVFY++BOat4HIUpw82hy89Oih/S3mRhLRH3IExA3iiafs5m/hSkI02O/r9ki7nTxgVboHJ0fP4/hSQZwE8Wdeio2qeE+CeS4+39PfKkLkq90iFFBW9vtz8b4s7zW6fvCGDrYN0qEIs4ATT9rkUMeRWdD+omZhCab9RgqBFZyzuoO5ghZrBFFCbTwrVnD3wDyO8WUl7Wu5wGV+PDQkJXHL615YCzxUCszOphjz50EcTvSiUonEIookuObB7sPsogor0dcIZXdG+bIvoyRkGEPwlkuhoDfMUhB+Z8o9lzg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(376002)(136003)(39860400002)(366004)(451199021)(31686004)(186003)(26005)(2906002)(6506007)(4744005)(31696002)(86362001)(6916009)(7416002)(36756003)(8936002)(8676002)(316002)(54906003)(6666004)(6486002)(4326008)(6512007)(478600001)(38100700002)(41300700001)(5660300002)(66946007)(66556008)(66476007)(53546011)(2616005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2pSWmJzYm1sZWdQeHBCVDdNYUdnTVdNbUJaVHNJa2tuRzFmc3FTL2d0VGVt?=
 =?utf-8?B?QlREUkFYMC9jdDFORkU0bFdCYzRxRks1WlJTWXhsRlRUTW9vdHN6K3UyUnJ5?=
 =?utf-8?B?V0x0Vkk5WERwSklTWXgzV2o2NnZlQUg3cXB5WnBlSGtQdzFtTE5ib3ZiM1pZ?=
 =?utf-8?B?V1Jybi90R1NlUm4vNUhaR0ZrZy9rY3l3TVVKWVdjRzJyT2lsY3ZhME5yb2oy?=
 =?utf-8?B?TEVRWHROQkplUHZmYTFXV3lYa0pIV1NiWW1vUmcrNHhJVURFczlkOE5wVmVQ?=
 =?utf-8?B?Y3REZzFmV1FvM1dBcDcrNCtlWEtDMXpJZExRS3dzcHdlWUFydGFTamZ6MFlK?=
 =?utf-8?B?ZWlNMWV0UTJ2bkIwSWxQTE9RbmVCOHpLVGtTVTYwTUJlTUJlak50SWFYRk5R?=
 =?utf-8?B?RkxxaHZFamhMU0Z1c2VrZnByK2lJaVlad0RKamFWYXhaUU5xVG1rTzljdmNR?=
 =?utf-8?B?T2JyeC9TZG9xYVRueWZOaUtVTTNIS1ZVTlBTdFBVemJ5R3VpOVc0Ri9Rakpv?=
 =?utf-8?B?MXlvekxoSzhyS1JGcnRGbVR3ay9EMGJpUmRtL0NZMXBNZzdONFVJdTV0RmtW?=
 =?utf-8?B?VFE4c3VzU1NDajNBVVpoMWQ2WHl6ODN2ei8vSEQrc1VxSng0bkRFeDh6dnpU?=
 =?utf-8?B?Y1h5bHlSZnhRVis0LzJYSmY5cVRwTnJjbXpnWWxIODAwSGN3SGhOUlJRZXZB?=
 =?utf-8?B?Q0NuRTA1SzZEd3NkcGYwT1NFR002UnVNRk1YbEVJRW0zczU5K1c1T2NWZTRn?=
 =?utf-8?B?U0trYUxieXBQcG5TRlowbnJ3a0psMlYvRS9hK3ExMVB3MmxueXpUeVN6L2Iv?=
 =?utf-8?B?NEdua2Vzd1pkWEtCWENrWXhtT3NrYjR1YVMwVzJFU2JkYWVsby9JUS9MNUdn?=
 =?utf-8?B?eHA2Nk5vd0VaK2dOeE82NGsxSUhSbGM0LzNzVkViT2FUTTBRQzdXRnhnY216?=
 =?utf-8?B?bVVOeVgrQmN4RmxPYTJxTDlCbnBsRVlkVitiMVpRZUpOd2NDNlE4bW5XQjNh?=
 =?utf-8?B?Wm1VYW1CdXhQUFJOUUpaRnp0M0JzTzBPK0IyK3NnMjB4c09PQjJDNGRWV3Vs?=
 =?utf-8?B?b2k3cnltTlhpQWV0V29tUnVXOUtianViQlJJd0FWQnJCUnBPQkFWY0Z2S3Ix?=
 =?utf-8?B?SGo4L3ptaXk2TC9rcm0yaVFPNDZqb2g0Nml0MTJqbW84UXRIRGhsTDQwVENy?=
 =?utf-8?B?T1N4blNUekZzMU5uYnlnUWtpdXM3L0U5dXVDNk03K3dVZUZ3WU9oQ1l0bmhG?=
 =?utf-8?B?b3VGc3pPeklSancxQ1NVbG1yaTRsdk1xdGNIcGxxZVBna0laTVZSVXZCYTZQ?=
 =?utf-8?B?TFJzYThMbStsZ1ZQM21RdEFaN0JIeVU0MG95UFhNbm1OTDFnL2hOc0gwbk53?=
 =?utf-8?B?WHdSU0NaQWtXamlLTzJ3dThRZGo3NzlHTndLZXo2d2NydXZibnFXeHFES0xy?=
 =?utf-8?B?QlRPMVZBcUpHQ0FTY1pWYXZuc2FaTXBSZGZtQ1RtV3d2bzUrT01OaWZDTVVz?=
 =?utf-8?B?NGhqbmtFbk5IaGNlbGVic3hLcWxuSnpJTURUMFc5R3J5UDN4MUdPZEJLcjVj?=
 =?utf-8?B?dWxWaGw5clpmS0kxa0FBckJ1VmUrdGxYalZaRzdYeTdBUEVkWUVBOG81Q0h6?=
 =?utf-8?B?ZkxnT3ppaURQdUF0UXlucnp0OFFKL0dkSFFPVnNrdDFFMmxiQVcvcTBCd1Uy?=
 =?utf-8?B?WmRVd1I1NGd1RngrYStseGNmV3Zxd0Q4ZUJHOEEyVVBRaVpJalBwNHhaRHAr?=
 =?utf-8?B?aWRkVXZFY2NnOVcrT05HcWlsbGQyVU9TSFpWZjU3cS9mbFIzOE9WL0RsN3F5?=
 =?utf-8?B?b01BWE1wWThIMDZLRWcrYmlJTFlnbFlxLzJTekRlOTFGWHBiZmpHRFprL0s1?=
 =?utf-8?B?VDlqT3F3bnNsbi9aVis5OTNpdVRTZVhjd3A4Z3V2ckNKRXM3MmtwSFVNK1Rt?=
 =?utf-8?B?NUNVOGpJKzJWbHlIN1FKalp4NUhPWnc5Tjd5K0FhTGRRUmczS1ZLVG9FUk1J?=
 =?utf-8?B?OGMzeG9OdXNVbXA5NVcybEUzVC91WWZldXlDMjUzbmFPOHdxVTN4RTQ4VlBh?=
 =?utf-8?B?MVoyb0hOQ1BNd2ZZVVIxb0NaZXdyb0N2Y21udXFXWTlsUnpucU52VGhWeU1H?=
 =?utf-8?Q?jLy4jGmu2wu3Dgl8E21vUKxlD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 120a2221-9848-4c04-f995-08db8db6f1c7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 09:01:48.4683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1tPt6y3e5e6LcM0nuO4wtw2ZmF3xOCIRH1PcWxsn5ld9w0+W8BV8/Xdoh+5qH0QTUSNvMmZoHVJFeuIFRVyAwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8525

On 26.07.2023 09:22, Federico Serafini wrote:
> Make function declaration and definition consistent using the same
> parameter name ('mcs' do denote a pointer to an 'mc_state').
> This addresses a violation of MISRA C:2012 Rule 8.3: "All declarations of an
> object or function shall use the same names and type qualifiers".
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>  xen/arch/arm/traps.c        | 4 ++--
>  xen/include/xen/multicall.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

What about x86'es function?

Jan


