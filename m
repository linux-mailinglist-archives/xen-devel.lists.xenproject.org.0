Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C2478BE7F
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 08:34:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591950.924539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qasIT-0005f2-14; Tue, 29 Aug 2023 06:33:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591950.924539; Tue, 29 Aug 2023 06:33:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qasIS-0005cQ-Ub; Tue, 29 Aug 2023 06:33:52 +0000
Received: by outflank-mailman (input) for mailman id 591950;
 Tue, 29 Aug 2023 06:33:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mPBx=EO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qasIR-0005cI-Gt
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 06:33:51 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2049.outbound.protection.outlook.com [40.107.13.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03273229-4636-11ee-9b0c-b553b5be7939;
 Tue, 29 Aug 2023 08:33:49 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7889.eurprd04.prod.outlook.com (2603:10a6:20b:24c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 06:33:19 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 06:33:19 +0000
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
X-Inumbo-ID: 03273229-4636-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KU760dnonwk7a1wR64d4XX+lp8rTJ72GrssphIvH0IUNTAYt5Ehi8c/j34BdrDV64cyyXjLOvZAG3frdlJtQewXM3aGn0yfGmcDXhAPPvHrztNwVWSL/TRPxTZdQ2/QXDGLZjVUoTYIdt4LUDZ8ogeKjKXJeVid174Sjk6+0irYMfRCWDNY8XVYp3+uhmpNcdzAy6z6AmqR8E/532HGxxFTpHKoqWa8FcEtSZGd5G9cPvW4/trwaIDIWPaubGy1rcIMkgzbOdpwcJiy8i/88xZRmMhZ/GNk4LSZyR2naM6dBnxJOe89gJFRdWLSb5+qO4c4XJqSaAtu2G2+OcdNtPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wraxawlFXa4UDAs47ZVS3qMRmmEP8Nfh6c5M63BYFV0=;
 b=RDPAyuixwL6AiBSczfBLnVvvi1XO2AaxIolm0ChiXY83TStMwXJIUPZEe0r+mI39Ov5KikYvLyRwqEeOg2vDNEtU2NeCSntqfmXjENL6o2PGCVVcMAxHj4XFd38WJjFJM+5LJUw4YiotaDbgCZrPvnm3wWimaYrUHtOhKy/hJTrev3kVlpaUD0AJsJ8sHwaRusCh/y/j1X67FL9fRHCAqmBO0PCQNwecRQUW9KKPedM7ZqDTjkeGYo4Sx8ZQaX4JrNwgbtLvs5mniDg2eICN8uRkcC1s699hhsDT57S5kSD44R7jtD5amabz6grkNDHCpJnp9AvM5NmlYdlHJgfgug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wraxawlFXa4UDAs47ZVS3qMRmmEP8Nfh6c5M63BYFV0=;
 b=b2/8NX12hXwETGQJQUk/L95huPA/dvlZ/y2Gps3cZlQ/04oyZ8QlsDU98BzUJqPvf4UhAgwzJ/zgyJ1CwIN9+1WoVWCCcfBKFPEseasZCEI3CIZy41uQNed/1+26MQ4V+HslN3L9pdc+1vRX+LWHdIKYFogyTqs1iuwZyiedng2UVPOdR2pOwPnkkYFSAQhoXaNNrvv/Zecz1NxBWv7MrKnDewklbeJpcZbqwWnqnMRXEU3opI03ZaNTj9hDD6yvzAiKDUGj8B592pGPJ1EcJnugNY2pWoc9dm51XL71k2KLxvjFc3JJj2IYRNdogZDrx90OE/YBjLs7MvwpYR21xQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <25c0c12b-c851-d688-28c8-19eea756fef1@suse.com>
Date: Tue, 29 Aug 2023 08:33:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 01/13] misra: add deviation for headers that
 explicitly avoid guards
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>, sstabellini@kernel.org
Cc: consulting@bugseng.com, Doug Goldstein <cardoe@cardoe.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
 <9b8165105c28f8e684844f56814726498e34c46e.1693228255.git.simone.ballarin@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9b8165105c28f8e684844f56814726498e34c46e.1693228255.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0217.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: 30beff00-36df-4eee-8084-08dba859d5ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ACqEpfXZLKS91wx/xozKFJR0fUXlglF5Uh5qQ9KqkVEgfSPRifp7mNki+BNKpz+cPY6bhsa9hdxmWC4e1kQJPQkJ29MUeAKDhV8uGjwFu9Vt5AJOS72hlu/CfXMvJcriOQL0nsqKrqO7yYp+6aNPCpaO8/se5Ja+aCBXOEM7TxkqCR9+wLh6Le4tIsjpoKL3+yGPvwFpUQA/JUiVd8Wee8SajidiQ+jH1PZFkH4URLN6ShKWYERZZA1QBJZC/T0XalLyRcmE8Mzm6AR7m59mi7npwwdln4HOkTLDeNkQ+CPlYhk3ePOD74jwCUGqevCZ56WTG9+4JRTBCOJCDQalfwuCSX6nH4HKpbHAZmkqmZL7dVPyi4LnUeIKwyC4xqhug7hnGDHKLuGKuC4lr5fSmpJpVw9RKYcGIffo0Xg/vwqMZvL59JIjhO3SCQzdI7qyU84EoVUBtJqoLfUBq7AXWhulq0zAnoDIMzhWxad2qYJ4pulSWQtXbmyNfC4ywiLfLLFsX2RrwKhU/UHnwwWEQ3OIdC5/i4MGgeLq6LNIi7aFaGaWKhJHPlS2MO2EnxEhrV/RdFhSGJbM7rnua+Tfzqpd/aM0KMZdjG+VwYsJZvNWG1i8POGYM3gMuqkPvihVvub+hsKXSL7nmcXG9YVX5Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(136003)(39860400002)(376002)(1800799009)(186009)(451199024)(31686004)(6512007)(6506007)(6486002)(6666004)(36756003)(86362001)(38100700002)(31696002)(478600001)(83380400001)(4744005)(2906002)(26005)(53546011)(41300700001)(66476007)(66556008)(66946007)(8936002)(8676002)(4326008)(5660300002)(54906003)(2616005)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVhSalZYekJqeWtybFp3R1VXZGRKN2FSTUVmNWE4SU8vZ1Q0SU1zOEVkak1h?=
 =?utf-8?B?TmlEQXk2ald6QUQxOEdzSU1XQURoTUlTQWtJdms2bjZKYTkxVWVnQUx0RkF0?=
 =?utf-8?B?ZUZSSk8yZWFtY1hoYXFQUkNON0o2S1IyU2lmcEc2K05XcjljYzljQ3pIR082?=
 =?utf-8?B?NHdFT3N6bXAxZnB3VzYzTDMvbnJ3V1hDRDIvMldQNlZ3S0h2UVVuZG9uM3B2?=
 =?utf-8?B?MWc5UVNia2thaEx2djZyRnM3NWRMQUZ4R3czTXhzc0p1bUdjaUVuaGp0OXZl?=
 =?utf-8?B?UzJFcHJ1ZmM3SHdxQWxqM3ZrU1NsRjUzdUlCa0ZtdVpKTjE5Q0pZSW9ubEhs?=
 =?utf-8?B?NWQzTlc1SFo3QS90UDJpRm1welIzK1RuYmFCK2Z0K2pwcC9vLzZMa3RIc3Vy?=
 =?utf-8?B?RlgvdVI0MjZ3azRaNzdGbW8zVmplbVd3VFFINEp1UEdwRUliZ2xiaUZGL3Nt?=
 =?utf-8?B?N01UOU9kMjNvUlVPUUEwZ3JRTlhTZ3NkUm45OTZxbGl6SVJ3Q055dUh1R3c0?=
 =?utf-8?B?bzExNmwzck9EQ3I1Ukp5SEEvd1M1Q0xJWDZ5MmlWTWd6Z1QreEJlbGtVZ0U0?=
 =?utf-8?B?ZmUwNjVFeUw3MUMrWVdXNTZRaDluRm9WV1RPNXlGQk5TQ0VsZnJVOEYxZjBl?=
 =?utf-8?B?U0luUVUzNjNGQlZmYS9HNWtZZFNJdlVrMmtnNk1NVEdSOHAwS09ZU2lZMTdh?=
 =?utf-8?B?QmtQZWhhL1RLQXFJdmd3SDRCcDV1SW80R0hMZS9PRUVPSzNqY2kzdnh0RHBK?=
 =?utf-8?B?NzM0eUxqTGNMc01OaWc3RWp3R3lVU0ptN3VQSTdZY1FrMDdDYm9UN1RvaG01?=
 =?utf-8?B?dTJpS0hGc01JRXMrZnF0Ny9LMFBkQW5SNzg2cmV1ZWR2SHlLR0FnZStPYTFU?=
 =?utf-8?B?dmY0R3dPdEROcDZUeTd3blRhcUx0OUVDS1E1YXNoNEhXcE9uc3BORjFBVzB5?=
 =?utf-8?B?YjVaNzU1WTFGTW12QWoxSndQRlpuZDdFWGVNbXN3amhvcEoreWpBU2xCSExh?=
 =?utf-8?B?ZWRjb1JFTzA0MEduTENZWHB3WkNsOWR2UTJac0dmTXEyTm9kRTRkQitZMGNS?=
 =?utf-8?B?U3o5b3ZNUjNldmV1Umt3VE1DaUxGb0FRcG1MaUQ4NGlQR29oMDJWTkRNYXlM?=
 =?utf-8?B?QmFHMk5UQkhmU2xkV1pjUU5MOFVXM3pwR092K09sTHIxV2xTb29KOEx5WWVk?=
 =?utf-8?B?cmw4U3J3UUNROWs1NFlZODQyWk1CSmp3czl1VlgxSTU0QnFveDJFZWwrNzJO?=
 =?utf-8?B?bnlabVZvMnhpZnNZUHFQbmlURHJyWVltaUFJK0c0aHVIbUhlRmdubllZUlpS?=
 =?utf-8?B?SVQ5Z3FRdEIvZVhaTlNjSmhKVHN0eUdxSisyZnhlRXU5NSttZmNMc2pVZDJC?=
 =?utf-8?B?MTdKQk1qNUpkelpoUTNyYWtLS3FtblZNbjBuRkdMb2lnSXFjd3dWNFJMN0lL?=
 =?utf-8?B?OTJtZlpmRTVGVTgxdUFrcUhudUt5T0p0S3JweGV3VCtQcWEvK0dzZFh5cGE0?=
 =?utf-8?B?RnZhdFBRdmV4K1AraHdwQy9Qa0dsNzc3dHlhQ0l0SytjL1NveG84L0pyeHlz?=
 =?utf-8?B?K1U3S2lsYnJsMlFFMXJNNXJvREVMSjliLzJGdytMbzRDbGZzRjZWUVNSMlJL?=
 =?utf-8?B?em1EZnk3Y3JzcVVyaUh0dStjZ0RpdlVGNmxtdHEzbThJVzJwNHB2Y1BBSDlB?=
 =?utf-8?B?Lzk2UWVyNXVWeUMxaFVlYWpiMEVJUHZ3bHMvZ1VlR3F4d0l5Q0Q1Rk40c2RH?=
 =?utf-8?B?VkNqL3BVcGE5Z1FWSi9nb1dxLzFlUGNDN201YWVheDVyUmh5WEVXSWxjYWRp?=
 =?utf-8?B?T2piMk9BVDZhZExpbHVzeE1wY0wxN1JUNnltNTVOdmkrbHVXVzRMekU5eEFo?=
 =?utf-8?B?Q29oUi9lTUxBd2N0L04xYmZTVytWb1Nxd1BHS2lCSFRVRGVGV3FPVll2MmR0?=
 =?utf-8?B?a3BaZUthNjM2T2pma1cvN1RodjJPSG5NdVJuQ1ZKRnJnYmFxRDd2eU4vcllF?=
 =?utf-8?B?NEZUb1NjMVUzSG8zQ3lGUW5TbVQvNEtya2k4cm90eUpYZXJNeWFQTWQwNDZR?=
 =?utf-8?B?TlpoMTQ4NGZzZnNRMFZ2S0ZtdGNJRm9ybUlVSzZqM1RKRUZVeEZoRXMzQndV?=
 =?utf-8?Q?K9dr8yElOzhFwiVrQaXT1iJvo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30beff00-36df-4eee-8084-08dba859d5ce
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 06:33:19.7207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x4TNsRx7Ho9+vtaHcsRcrJ6DIHiLSrgGE33n+MKEY4U7j7x/ybR0Ah4twfrIw/OhqjfhICX4HoUmBVm8uqNGZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7889

On 28.08.2023 15:19, Simone Ballarin wrote:
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -60,7 +60,8 @@ maintainers if you want to suggest a change.
>       - Precautions shall be taken in order to prevent the contents of a
>         header file being included more than once
>       - Files that are intended to be included more than once do not need to
> -       conform to the directive
> +       conform to the directive. Files that explicitly avoid inclusion guards
> +       under specific circumstances do not need to conform the directive.

Nit: There's a "to" missing near the end of the added sentence. Can likely
be taken care of while committing, since Stefano has already ack-ed this,
but I'd like to still raise the question of the utility of this statement:
How is one to know whether omission of guards is intentional?

Jan



