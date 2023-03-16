Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AC26BC6F9
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 08:22:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510322.787780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pchvd-0006HF-H0; Thu, 16 Mar 2023 07:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510322.787780; Thu, 16 Mar 2023 07:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pchvd-0006Ee-DJ; Thu, 16 Mar 2023 07:21:37 +0000
Received: by outflank-mailman (input) for mailman id 510322;
 Thu, 16 Mar 2023 07:21:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pchvc-0006EY-5X
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 07:21:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ebe5b69-c3cb-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 08:21:34 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8156.eurprd04.prod.outlook.com (2603:10a6:10:246::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 07:21:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 07:21:32 +0000
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
X-Inumbo-ID: 2ebe5b69-c3cb-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqFqhSCegkfNWbUIfFo54BVRuAxGo194wiboRzs0w/ZGhvS2lQIDaYq1idY44i+olIcPeMFF5YdjtwzDS0EJ57TSus0coua+jtI7hUvxyUUv6iqBmnS8FJlh+A8k/vQv4RWllGppIyxDeOaq+IiOAvH52JqyGRAvVONCvWz3QIxtxYZqYrLEsmWT1wyqLe/qmFy38eH3whoSr+/ghlQME2mCwrhoXeMvhCvE5q0Xbx6AmY2umGOocZB27aHVUOt8l9R6L4/1Bzz3eDLjMTWB0UBmfVhf7v3k8ElObiDep89+1hPnR+akeIwRuSpdIWP8yS6Cps/EqN9PxzZjEdtWPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Ra9nsZr7hsuaRVdoh/9C9JwzoJ5b3wRRX6LQU36pf4=;
 b=S+cg6XddlNjFiTgOkJWKjrub7rRM760AN9MtKmz3POJn3cG1YJT2+h83iqsHT1+Cp4m/VV+TlgP1fWADaBUgpiGI15Nb4JnuCHM9fOzocXkcHdpUFESN+TjL4KodKX0wQp6eF6abE0MhsWXARJpLfvhH9uMnLlGOPbrIFBRN55pePYC/RPyMvVmc+2iTEplF/t4QWvLnSn2b1tRLbCyy7yI5lYnfGjiwCwt0KEWIZJYVkwdZTv30eNzPpjmikaH7g+bGecS5PdfGAzMDcqq3kAiKkGJuX/rWz3g5t3gawuWa6vA0Y4A5GofM3AzgZQ7GPC3Pgty/eH6rDByIOc5KfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Ra9nsZr7hsuaRVdoh/9C9JwzoJ5b3wRRX6LQU36pf4=;
 b=nbjFWbzQi9fWsuTibU1mRM8jB97iMsD8bjPcxOzGrlr82YK3lpCaxvcZGQE11PDHY5XWaSInKf5mMLTDdZlg/SODuMnUmGoV2PRSpBKVUZRjzILNaRgF7YsM9sV3MAYOKa7sY7aItqt+lEnEPj7Y9dr1l39VcVDt3bXhl2+FNMh1VW7jGnYqqUs48mbJhF1iKqAlujV8tKqsiig0gXmRdTQLnYtS1GvIeBnkX9c13cHibvoriAh+vKegULpCParELng+d12M0fnaI/f1lIh54Sqf1xtGPwttLdx5d06e62vNQehVqxn86rF/695BJNZLkkyr69DS9oYU1joWTgBNbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4b50bbf0-96f7-c0ad-2bd4-cb204e8daef1@suse.com>
Date: Thu, 16 Mar 2023 08:21:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] xen/riscv: Fix build with GCC 10
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230315185121.665635-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230315185121.665635-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: fb1cb980-f187-43d3-1831-08db25ef1138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BNA2M6Z1LsEQF8AYVmo1hgKU8uXthnuUKZL+T30sMYAn1oG0NSxlMOj7zLds6pXIc37Jv0VIYXUXd+HBtbzOPVNoCYE8P0U9tZNbITQVEJh1en9Vmeb4SDhG+XRT7jQmPxR7MeKCZiiImZ9eaC+IOQJfynHxIrDUCeGUAWhoPr+ExlTqA+utMGbtvWirb3cyX9gvZtuV9Xq1o4JVBc+u7KsxWn5Gf9LNfsFetP9RsDqrhmegxzHHrDAfWm1fFip4PgVvy1mttEKQrO8Gjt9IB4jFP97iBBvwG6GY/GAIzVxPWt9NZgFkOfylqWKZsmojjAWYHoTQ6X0FKtDumvXfgi7s27qdIN8GQmTLFtlvJAHN6AwffcJJggEVxAIihUIxTUg/Jkc7YNBMGXyN7caX6evTkokPp7jucPeZ15NE97oj5PRuao2gIDSqkKG1CFui/fcCJxCfquj6G4WOupQh34Qbmm0jhTJcgJWOPjhRoEIw1jUnoUEUAvTbPuILk/kVxHkIRELt2PUrMeJvQjwGPuinSTnokzVeTKfvJW40jlXoeySYqcq9ZEvPQEOvfVuJ8CskZkR0kcVfLk1pS9tD/Z9HenGjj4/ETpf6kBimE98Tei3mbM5f9tvYoeWaa86YNSZh3Xgk8KG6wLNovnWNZmNLINpXUdVeZJ1jHLAlpoL+b3L3uytyvpnjYqeQUhIL3CJDHd4T2sgVRXeN8FOHrfymE0dTOAZb3WpMwTnsj/s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199018)(36756003)(86362001)(31696002)(38100700002)(2906002)(41300700001)(5660300002)(8936002)(4326008)(2616005)(26005)(6512007)(6506007)(186003)(53546011)(316002)(54906003)(8676002)(6916009)(66946007)(66476007)(6486002)(478600001)(66556008)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDlBRVJJb0duOG0vVDV5UGV5RnJVZVd3cjc4QVp1a2draWt3ZlU1NHVFOURT?=
 =?utf-8?B?WGlLSGorQThWQ2NvZWlmaytFcGNINWZDUkxlcDZnajNCUklOUm91UlZ4MUJT?=
 =?utf-8?B?OTI2bVN6d25oQ3Q2Z2w3Z3ljazhZYnBhRDBaQ1VkeW1uV080Q0hKcTlCR1g5?=
 =?utf-8?B?djQxK2VTSmJnK3c5V1Q2TmlxeGwyY3Y3MFBROGhuVkJIWHNzaVAvUEc5RjFs?=
 =?utf-8?B?SG5WSy94WEZZck15Nk1JRlpEaWlzK0FUampSYlBBdHBtdmR0VnYrek83czdn?=
 =?utf-8?B?T1o5MkRtNFdIazZ2KzczUWdTSWJqSHA5V0VuM0REMEpNMmUzaVBXZWxyWjRB?=
 =?utf-8?B?a25PZ1ZnaWlyeG5BTXd5RHpmM2FtVTZnVjdxOFdRV1I2T2xOajBTc09UUm53?=
 =?utf-8?B?MkNSVktBZzJ0cVFKM1N1Z2l4TzVwSCs4QStlOTdhYUx4QkZMa0FNd09Dc3pv?=
 =?utf-8?B?eC8rUWFIK3k2WEJUcjNyWXVQd015L0VuNkQ1ampXbFlqQWxoYzBaanJvaENX?=
 =?utf-8?B?RVJlUEF0eVM5L0dOUEZqcmhpV3ozbC9HUnZTT3BYU1VjbWZnWmE5cmJ1Y0Nn?=
 =?utf-8?B?YXNySXloa09Jdm1HOVQrb2hHK1pPeTdmS3J6YU1CNjNKVDRaRnc2OEVUY3JD?=
 =?utf-8?B?RE5HUkgyZEN5SHI1NmV1RW45OEc5SUwvQnN1dUx3c2JLNWExcnd3WmFQVU5v?=
 =?utf-8?B?d3pZVDdWbDZXTWZndXNISzB6MEUvWTlsOFFYK1JEVG8vWnRZQ002QmFDSWxF?=
 =?utf-8?B?T2NVSEtJVm9HSjg0YmpMeWJRRTE3T0MwRWk3cm9xeVZIYmJsSkR2QkRlWlpZ?=
 =?utf-8?B?UmU5WDdjdGdza0I0T1RERlJVWXJuNW04Mmkzc0YydlI2WmtBUFhyblBYZkxj?=
 =?utf-8?B?bUM1M3JBZnFwWGczTzdiTE00cTNyVG93WXdzdWd2bUJnUnJzNFhEY3RBLzIr?=
 =?utf-8?B?SmRLYWNjRkZCWFN0d2FPL3NqcVgreHZRbmtRWkljc1AzZXBqNWYzVytxWVBP?=
 =?utf-8?B?SE1XbmRBbG9WdERrQnovVTZjTTA2TUhQUWZYTUdTbnRDMmxuVFZSTCsxV0N0?=
 =?utf-8?B?V0dmMTlXVlYwWHN6VUFhdXBhK3VDN20wblgxeEx1N2U2R0RJVWxrd1hRV1dH?=
 =?utf-8?B?SGVxd3VNN0NNM3JraGQxNEdHZzMvakxvS0ttVlVHMEV6ZUJ2ZmRsVE4yN2lx?=
 =?utf-8?B?T0Z5SmlYMWd3cVhzTk14S2xCeEFqZG1EVHE1dFZaU1ppdkJxRC82YnVXYnYv?=
 =?utf-8?B?bVZUQ0NoZDBwM09XSHYxYXlLSTN1T1Nrd0tQVEQybERId1VhMHJ2SGNrUTJF?=
 =?utf-8?B?SDJENDE0YlVCdzJlSTVSSVgrcU5oR3lybnNGU2VIVms2NjFLZGFSZWxSQjls?=
 =?utf-8?B?bUFOMDAxTnNyNzExTzNoQkRNaE5IQ1RlRVUvVlBxUDZET0ZXZ1V5Q2pFNlMy?=
 =?utf-8?B?SUgxNnpWckJjU0tXTExMLzY1Z2RpcVJyUDh6cU8rNjljVisrSDNoUlpTWFdZ?=
 =?utf-8?B?enU4RkpBMjJGTlRrMEFZTWJyQ0hiTC9vY0tFYU1zcFhIS0FCU2VmdXlvTjNO?=
 =?utf-8?B?Qmd5ZDJXVDBkSjJjSjIxVVcyT0R0Y1hPMUNyNmQyL2grZTVoVmk2R2J5aDUx?=
 =?utf-8?B?UVgrTTJ1allpQjVGNkRmRWlWQkM2ZzJRUGtXeE5aL0ZZTVFGSDBibEJ3RXFm?=
 =?utf-8?B?M2s4RUF4UlVuL3ZTZEFUL2NaYmZFeWx3dDQwdmJib3pZY0MyRUV2NDRMT0lB?=
 =?utf-8?B?ZUUycVNDUytJRHQxY05LSkdreHZaTXVvRExVS0tYVkRlQkdSQThyVC9lNTR6?=
 =?utf-8?B?TTQwZk52NW82ZUdDN3d3TmVrcmdtMWJweFl1VUFjTFg1OU5uaDJiMGk2cDNM?=
 =?utf-8?B?M0d3OTc4MjVOcGNQR1F1ZkZrTWt0dUdTREFmek8ycWppalJvWGNGWit6UThj?=
 =?utf-8?B?SDVzQjJOVFdqU054dWlPUGpjN2hZTEZ2dWVzUzFiUWE2ZU5TYkF2S0xHSHA4?=
 =?utf-8?B?QUU2UDk1RUtueFRGMjY4QTliV0oyTWw2ZmZIS1FET05pYkxCTnk0L0tVWCt0?=
 =?utf-8?B?c1JBNzFqTDhPTEttK1A2RG1CVUdjZ3VsZGRucDRwcHBqbk82ak1LeTBrL1VS?=
 =?utf-8?Q?mdREuLbQA2aCIlupLjcXeTGuV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1cb980-f187-43d3-1831-08db25ef1138
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 07:21:32.1388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xwqt/VtIDyvmf0MAU0QxwZpsT0Ba1cNWUfCisJR/5yAYVUvDNp/IeaJpDLDaXtMGUXmWTI5wAKhYmYZdZZdSrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8156

On 15.03.2023 19:51, Andrew Cooper wrote:
>   riscv64-linux-gnu-gcc -MMD -MP -MF arch/riscv/.early_printk.o.d -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O1 -fno-omit-frame-pointer -nostdinc -fno-builtin -fno-common -Werror -Wredundant-decls -Wno-pointer-arith -Wvla -pipe -D__XEN__ -include ./include/xen/config.h -Wa,--strip-local-absolute -g -mabi=lp64  -I./include -I./arch/riscv/include -march=rv64gc -mstrict-align -mcmodel=medany   -c arch/riscv/early_printk.c -o arch/riscv/early_printk.o
>   arch/riscv/early_printk.c:18:2: error: #error "early_*() can be called from head.S with MMU-off"
>      18 | #error "early_*() can be called from head.S with MMU-off"
>         |  ^~~~~
> 
>   $ riscv64-linux-gnu-gcc --version
>   riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110
> 
> The binary is otherwise correct, so remove the incorrect check.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'm with Julien here - this needs further explaining: The compiler (even 8.2)
clearly provides this definition with the given set of command line options,
as supported by trying it out om godbolt. So there must be more to this -
could be a bad patch in Debian's build, could be some odd interaction of
command line options which for whatever reason only triggers with certain
builds, or about anything else.

Jan

