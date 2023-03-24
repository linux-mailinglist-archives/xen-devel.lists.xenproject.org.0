Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 141856C7932
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 08:46:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514186.796206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfc86-0006cG-LA; Fri, 24 Mar 2023 07:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514186.796206; Fri, 24 Mar 2023 07:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfc86-0006Ze-HQ; Fri, 24 Mar 2023 07:46:30 +0000
Received: by outflank-mailman (input) for mailman id 514186;
 Fri, 24 Mar 2023 07:46:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n250=7Q=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pfc85-0006ZY-Dt
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 07:46:29 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb50cb7d-ca17-11ed-b464-930f4c7d94ae;
 Fri, 24 Mar 2023 08:46:27 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 07:46:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 07:46:25 +0000
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
X-Inumbo-ID: fb50cb7d-ca17-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xpqx8jUAf2XyniWTdN19kh8i26Po6G2dActTBqQo3/0xIn7caZoSZI0BfwJUrkZF3dFngRZqbLSuWiKoh5UZbdc+0sfBYmX/syL661zZK3TWhkv6KDmhqpfkm3e/KTj+F48G9W44jsm8OG1qovQMVtrZxyURT2JXU9SKohW8zzguTfBZOsJjo20RuYQSi5WxlVuW6i6rP0mcdimUj5wylDLnG8+4embjPL3cBf/soK1uhps+guOm4seCkOjwBBuGwckNB29DthZ8+2hLvRTvDW6z4Cq1/XK2w4nMVZyoeONYUMb+c9COb9/I5QMiKgwR1iPMTV4oW+ZAW8gZGQ+oIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEg5eojzvBf84PNwAq18/Bpsi16ZJEYO4AY5sRXDxQc=;
 b=Urdw/Base4vEI3cPFOrM2EAO6l3t7+8tRSfi2RcjX0jyE59RSBslDAiGQ5sbimn4QUUNx/D81DX37cPfEsvt/ZwtUKxK6Zda4UnIKAu9MADRPCaFTLTgWXw8B4jlS6OTRu/wBIN0vCVl+fvQeez9SVyT9OwD+dsjHQzpCPR6bSAhp7hHW54br03PAS/s5t/rlceMO2LNI1hGLKOUkYCblULXd/91J630Kb3AdzbTcn9ofMukJlLLdpeOonF+r0oYkTqbWuzMwsM+oPSkcfMyr4pkQZV4xTchP1PQNNRHZrEfRU7G09D4mbL3D2tMt4suVg7I+LVb+fxHokIenLLq1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEg5eojzvBf84PNwAq18/Bpsi16ZJEYO4AY5sRXDxQc=;
 b=VK3oRNP8yiVkJ2i172khwlDPwHbbFrHVOX8Kxef0SIGSeNi37ZspTG28CR9xO+61qBCxbfpsguRMNNmyI7kasg4g4fXS4F6BNUO+TaEctDW5fhaaYjvWRhaiJzqzCvtp/QQx8W6WFPjXNsqrlAe6NnjoatIMfDi/1XX0y6DBGM9F7IdlVGPNMXcC0VQB13gvZytEswKL4D1Y34BeF1mjgV4JUyTKbal2wM76oSkUGMrJbbOZN/ZS9QawWJfoiIH0/4rAmb6iirYDr34NedIvE53bFIpRDZvRkeqQoJqZN/d8H29wTmMlM+o3WkPmvniyYkivW2qv8ptmgmRXqH4CNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <145d84a7-b3dd-f578-3c8b-10a5aba53491@suse.com>
Date: Fri, 24 Mar 2023 08:46:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [adhoc test] 179901: regressions - trouble:
 blocked/broken/fail/pass
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
References: <E1pfV8U-0006eX-2p@osstest.test-lab.xenproject.org>
 <0b1181a1-5a96-b3e8-ffd8-6f256ebbceae@suse.com>
Cc: aperard@xenbits.xen.org, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0b1181a1-5a96-b3e8-ffd8-6f256ebbceae@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8788:EE_
X-MS-Office365-Filtering-Correlation-Id: c00dec27-17cf-4108-9e72-08db2c3bde68
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9uC2JDRNcBYFsHfQN3bM78iG8AyS+m3oh5NkTFAyD9L45I5eSSzjkxmipWBj1Lrjr8GVjNsT/yCniH/XN4bFYzGXIf9XoL3QcU8JpWWUutIjerroWqttuGC90zNua/w+6oztYMnupSEVmlCYHSmk1BXQAMdF9Af6YlzVMtpnZsc9cTlplGb8FG9wG6lBmA/r2LBZf1hK1/bZ+Iqqrh4bSaaO3ALXmwS9sNTYgSWEIdcJPywUU50XQKKtBLnIMZOJit0ZTI97ZejZng3vC6p+YfrYDS+mM/448z7XwijZT0LrxdK26tCwgSRjvqwn5SUGCu0cpN0C0roXgrnAQCYgJO+CuoRD/H8/aTmz0qVi3MVxAs134pdZoHTJGMEUuuyJLFjL5XgZREoroqEGeI85JyRszLAmKyNWd+g+D1dIE7dG1oFs1r3n5TvgP6vEYWP5bBAnnrfnZOs6TyY8h7V1ilQIQkq98MiT7X/q1uZ5Q2XK7TP3/jwc1hZ8ie130tggaDQ7BV0uHgr0NfApOLKJxOcI4e4xpRWsginWnpAYWIxTyOnzbA8ugoC8hr6dopN0fJO1aVGNDwhaCsjQ63K/JqR5kp4LdSipYdtruCdn9YMTtq5fi9qabEdgASUp2bxd4yL7YXbcjjoJUUtf3z9CKA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199018)(86362001)(8936002)(6862004)(2906002)(31696002)(6512007)(6506007)(26005)(36756003)(37006003)(6486002)(478600001)(966005)(316002)(6636002)(4744005)(4326008)(5660300002)(8676002)(83380400001)(15650500001)(66556008)(66946007)(31686004)(41300700001)(186003)(66476007)(2616005)(53546011)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWRxNHJCd2l2WHlRUDlobDdYRWVaR3JLR3F1dGxZRWRPTG5DWUM3ZE15dXNG?=
 =?utf-8?B?cml6d2pDQnM3aTN6MXVyQlhiNUFaak91RG54TVc5QUo3S1pxNHFoMmlpTEZE?=
 =?utf-8?B?aklhTWx5UkE4SkJuZ1RJeC9zYmVIQytNMDVnYitBbVhJR2xvYlI5Ym1TY1k4?=
 =?utf-8?B?RXRHVG9qN3BLTjd2aUtjZFY1aERQNzVvNGlOWVNVaUQ3aWdSSGs5ZnlUeXR5?=
 =?utf-8?B?eENmU0FSQStIcWx3Qm9hSjNDbkZkVm5tTWRGdDVibmkyamxqc3J1Q0tLckt2?=
 =?utf-8?B?Zmx6WEcxNW5DbW1hZFZxTjl2bmNlMmYzZDlDOUQ4LzlhSFZESGlQQVYvV3pX?=
 =?utf-8?B?NnhsM3Uvd1JOTjJVWTN3dmUzbzVTaXMzNGYrc1ZZU0wvYlBIMEFZTHVEemVY?=
 =?utf-8?B?Njl6QWhuOW9YQnBlKzV0SlNzOEI0eWdZWWF2SWRmYVJORVJpUFpJQit1akVl?=
 =?utf-8?B?blBvYnJNMjg5aHNNRnpkVnJIVWlablNvVDNmMVpTd3ZueUVzMVBpK3JEc2ZJ?=
 =?utf-8?B?encrZ29Ja040UkFXTGhidCtabFNlWG1wYk9Sektla2VMNE1odTk5d0pQYWxn?=
 =?utf-8?B?VndrYlNLZUU4WU94Y1llamJWbkZ0YXppSnFBNWpYQVZ4akxKVkVRT29HS1FC?=
 =?utf-8?B?TjFqcE1BOStTN0hEajlNcjZoNk1Vdm9ESkpucUlEbnZGbkQxY3hDWTRxUU9k?=
 =?utf-8?B?RDYweHBKeDBsckNRazZxMk82M3BHRW9oL3hHNCtYMENxeE9RQjhVaWxCemV4?=
 =?utf-8?B?SnZSSmZGUXZmeHBOUHJPam5LWGw0RkxXcVdibkJZRk1sbXF0TlVKNEFiTnp1?=
 =?utf-8?B?MDdRaGxYM3FQQWh0Vm54eXkvWGx0V3ZkUjlHTlZIMnd6UCtmZjI1a29wV1kr?=
 =?utf-8?B?eG83MjREVzJTYmw0T3RIOWg3bU9hMUlia1JYRTBQTjVBOHRPT2JZcjF0Sy84?=
 =?utf-8?B?bGQvMHRvOG5rVGtPbkNwRDl4c0VQalJVa2FreVdML05DT041U0dGanE2SmRu?=
 =?utf-8?B?T1lLOUlOOUVCYVl6QlhDQXJ4WjhhekFHbW5BUVErMURidzFRYWx1SnZLN3FU?=
 =?utf-8?B?UnVoQmtDNVRnQitVUytOTTBiS2tQNXJGenFQUlRjdzNGcEQrSFhZTDg0cEUr?=
 =?utf-8?B?aWZucmdsNDZmaVlGM0xDQ205cm1lTDB3NzM0SThnWTRCZFgrRURncnRHZnVZ?=
 =?utf-8?B?bDU1UkxFTUtzMTFjbmJkSDN6R2xNR1U4eUVQTUdPRmJ1Mm1MeDRzS1E1UWY1?=
 =?utf-8?B?ZkVGemNGUm1kYWR1VTJlNW1IWVRwSEFab1FSbUs5Mmx4N0M0TXRRNVRHM25C?=
 =?utf-8?B?U2JsZzRkTTVjT1FzZnVPcDVnejU4M1dWVExhYkxWdlFUT0RuOW15TDZJWERD?=
 =?utf-8?B?c1lKNDVDQ1JPb0QwaktwVSt3bnVDZDZrd3lFLzcySm83NzlqQk8wdUtvWHox?=
 =?utf-8?B?bmU1ZkhQUVJpNXNrRThxZ3U5YXdmVXNDWWJZQUVKQ0pVSDZ4QVllZHhjWFhX?=
 =?utf-8?B?MnU3ZFFBTUhaYWRWcU1xRWZZVGluRURhdmR5MDZyclA4S0JiTTVYM2RCcExh?=
 =?utf-8?B?R2hHejQvbHdtMmp6Y3dEZXF5TlRBM2J3WkY0QkxZZnRGbk0yelJiVkJaYisv?=
 =?utf-8?B?WDZmd290NHN1Um82YzdCSmFmNjBQTktDQ2pxVHprTlluaHR6SFF2Yjc3dTNu?=
 =?utf-8?B?bHZWbE96QnBmb01mQXk3emVzUGJscU5RZVYyNW04QUo1Nk8xaEhZcHgxZ2di?=
 =?utf-8?B?bjl6V1pMbGJSNE5ZYkxsamlLb3ZJdlhNc3J2dksxN2thTTVzSVpvYU9IUEhL?=
 =?utf-8?B?eGREL2pJKzd2dHZ3YnVhR2YxbkdmTkFUN2IxcVdSRW11UmdxYUszTlRxWVlX?=
 =?utf-8?B?aTVsdi9ZV0RtOXBFTHREVFRRUkd0NTNma1dNQnFUOWlkU05GdXRCY0hjd3F2?=
 =?utf-8?B?K20zeDdTVnhGeSt5eGR2S1VHRFMzUVdod0txU0dTUzdlOUs3TzVGVkFmSHZQ?=
 =?utf-8?B?UzNzdjBuNWd5QjBMRy9PSDc5YWhMWEZOWEowSFlWMXhrNTlzYjNRQ1A3U3BJ?=
 =?utf-8?B?TXd0M25tUGFwdnErdEljK1c0L2Jxc1FxQkhGVlFWMExabGVHWkRveEdGRGxM?=
 =?utf-8?Q?3CqkrF0pkQHIM/vARph4kymB/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c00dec27-17cf-4108-9e72-08db2c3bde68
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 07:46:25.1022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mMl7qSGtqbji2mcBRqRtHmwLyNMITxs0xra+fE6iPEO4NKSqRvLv9yH2MjFBJpV/LT/KhjL8pad3w9u9a14WIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8788

On 24.03.2023 08:07, Juergen Gross wrote:
> On 24.03.23 01:18, aperard@xenbits.xen.org wrote:
>> [adhoc play] <osstest master /dev/pts/16>
>> harness ed1d8de4: PDU/IPMI: Be less aggressive with IPMI commands
>> 179901: regressions - trouble: blocked/broken/fail/pass
>>
>> flight 179901 linux-linus play [play]
>> http://logs.test-lab.xenproject.org/osstest/logs/179901/
>>
>> Regressions :-(
> 
> It seems the grant copy failures are gone, but the tests are still failing.
> 
> I have spotted:
> 
> [   18.258030] net eth0: Response for inactive request
> [   18.258080] net eth0: Disabled for further use
> 
> in 
> http://logs.test-lab.xenproject.org/osstest/logs/179901/test-amd64-amd64-xl/elbling1---var-log-xen-console-guest-debian.guest.osstest.log
> 
> This is clearly an explanation for the failed tests. I'm looking into it.

Right - xenvif_tx_check_gop() now sends two responses for the split copy.

Jan

