Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CF674EAA2
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 11:36:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561697.878202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ9mg-0000sC-1e; Tue, 11 Jul 2023 09:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561697.878202; Tue, 11 Jul 2023 09:35:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ9mf-0000qa-UE; Tue, 11 Jul 2023 09:35:49 +0000
Received: by outflank-mailman (input) for mailman id 561697;
 Tue, 11 Jul 2023 09:35:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B4LE=C5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJ9me-0000qU-Gk
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 09:35:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5089fd09-1fce-11ee-b239-6b7b168915f2;
 Tue, 11 Jul 2023 11:35:47 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS5PR04MB9771.eurprd04.prod.outlook.com (2603:10a6:20b:650::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 11 Jul
 2023 09:35:45 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Tue, 11 Jul 2023
 09:35:45 +0000
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
X-Inumbo-ID: 5089fd09-1fce-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DziXQ+Vctnn3LkJ8lGZErz2d/mQcoMzzT0gSpS02/PIbjCFO1WO+LBBCsNI7/a+7cGE5IaeVJgkzy5BK1LNLxu04reb/6Jqr7Kg997dzsPaclbup++7VRHDLFvqPoEseYW8K9WWq3SO0vNMpehYPwjMi0o+TQDOIelBwsUXayKXmBg8N40MwOiY9kLz6VMXLcRVg5R1UTM2ciWuPpaTyawpJKN3nMD0zEMcc04gFHCZrtdgL0W/3iu5vjp/LEr8TCAAW+cCXr2C7ZMSpXGE5RfOPbzPuZshrUCiEbO6owsZCwhxKAFN092Dxd5b9kVjiUnai8y5h3YV0/6B283If5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5uTfHd6IFNTWnFw2xxzravZEVHJIH7EqQR9Z0POfHU4=;
 b=fU5IeuoIqVZrmo7m/1Msjw7IBPPA/60SajxYrbDEpMoyiwBXyRFwvdnfi53tMoHk9wJwgrEyROjfuMFitWYtoprDUmJ9WvrxigZj0TMcrarEuTeAUdr6kRuXaNjF9LPAtDyjg9d9J6wZ17TVuGCnNPPSl5ADRDfRjpmXyzH3Zayhif0nBkuGWRyyjtgqyWUc+eFYVN5pD+AZvFrz2zf26WYoPOVDsafsJO1PlQ4o64CHUQ5uIWXYLUI1NXgEAefoQ4AU1O42zXABtSLMvuYvx/X1NqXuZL3/+jA4Exis2fD2jYVfVzL/EDiUc2JE1c7hFV0ye+sdseUuCac/pdbVAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5uTfHd6IFNTWnFw2xxzravZEVHJIH7EqQR9Z0POfHU4=;
 b=MVqHcyR98+8LWiKfRuCyamZhgp1t0hbaLQlrOxX1sPkKMViOHe6RUvhRDH6S3WB2EoF6GccOxD9veF2pIgHNF5ahmRY9QvGLLqCbiPN1tKP/MbmZJTMFTYxoZDBGAnrnhbb6J3whMp451Ar1L26rOUisoSysfc/9A1cFQzj1glu2bUAJcR4aB1gvcYmHWiBH2xKj4lgEARZof7DLjNWNo9ZELCC7FZnjAJ7pAmz9sKgp8BzZ66KEMPD+pFrI5CnnYKRGXdXIJd6iEHlyq/I/0tt2KhU8VVqyhuGnI4Wr1L1gNvSL4eW/leVBvE8eA8uSpHvCoeuy9pZbnHeU9JxCkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <40fbc253-745e-4c0e-4f2c-702eb007bbe9@suse.com>
Date: Tue, 11 Jul 2023 11:35:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] x86/emul: fix violations of MISRA C:2012 Rule 8.3 on
 parameter names
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <149e5516d0db712916912fce8ab9c8285023e7c8.1688997768.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2307101408390.761183@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2307101408390.761183@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::19) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS5PR04MB9771:EE_
X-MS-Office365-Filtering-Correlation-Id: 87a5b20b-fd36-4396-755d-08db81f233c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	668HCM/syeX2gTPhRxblESanFiU//Io6w/FW8fDGPovUON/+bAqlrr1XHezNjWBXBJwNGBR5ch64nxwhRhlredKfQMqy9a15ei1uSlkz805Q+56gp7P8AmVSXz5vcTM88T+F8P5ftgMCI+9J3/AizriiRqMPC0Ln9SVIthf1goTNxhaYgRSuxKS45xC+p0Z2+K4XW2yhawsRlt7akeeU1+U7bCvY6KIz+2qysVpnERvbMOXN1QdDe/PGey0nv+IrYFhPvDCA7gyO7J8Qq/MtE5xIDPx56gHuX27B9gKqOk1ZeGqF7rCeHpZXniCv6Yt33ueCl9JMIWTIdgm8qdyGKvHV616xy5jC0R1SB9QA2ZZUZpJDRCS1JMcb8XDn/FTLIOj4GOT/QOTNAaTaKB2+yWT4oQv7yFmXLX+/u/O5SxV1qdpMWwnJQnzUoLtMGtLmKbyMf+bKOTp8fojI65IK4neoMpw9nfuG4rBgsf6Kj7CDjWubmoWAPfT/XKwVLV/fYg8RTjMGG8Ipewi3BD/5jlRHdvMHapeZKv89s2xUNm2bN42vwL1EeWawTnVJnwwVCM7v9Ju4rnVDdTf81Hj+RzkovOu+3a+PHETZFFa0z9Y3IWgtzPxe4uCawRHnMApWfxeIoQfjhg0WXnzB7PU8qQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(376002)(366004)(396003)(136003)(451199021)(31696002)(53546011)(6506007)(41300700001)(26005)(6512007)(31686004)(186003)(2616005)(478600001)(54906003)(6486002)(4326008)(6916009)(66556008)(66476007)(38100700002)(66946007)(316002)(7416002)(86362001)(5660300002)(8676002)(8936002)(4744005)(36756003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXFwUjNWb1NLdDRyaWJwcTNOdEZmNXJFczZjNUhJcGRjc0hlQUZUSENLWGhr?=
 =?utf-8?B?OGJyOE1CT2hGcG5vVnVMQzd4elI3WTk5cnoweDJxNUQydFRRZUxnY0o3R2sv?=
 =?utf-8?B?eDJNK2gxOFRHbVJhVnV4TlBVTDRiYkNhaWtac0hwNUlJYnEzL0VhT09NWldn?=
 =?utf-8?B?clJ2SWRDQUdlZWMrY3dmU2UzODBGY3JSdHIrajhmV3FxS1pEUzN0Q09XMFk2?=
 =?utf-8?B?cFhab3NsdE43SUZ5MUQ3cG0zYXhzdW5SODFvbUt3dWlmREdXeVdKRWJ5WW9S?=
 =?utf-8?B?RTJRelhRN3lwa1YvYncwU0tUM0p1Z1J5RVJVdC9zbjhzc3dlcTZ5Q2I0R1pP?=
 =?utf-8?B?ejh5c2h6SVFUaUoxTld1YUlsY1A2K2Y3OTg1cEJqOHBMaEJKK1A0ZElDYkdm?=
 =?utf-8?B?R3JNQTR5b1JXYUR6WFdsbnRqWnZUdTd4bmlDVFZ0NmZHdWhYcGcrZDYwM2xH?=
 =?utf-8?B?VmVYOUpIY3JDY2ZsWGc0RGlzeE9KV082N2lsRDREekh6cDJpbG9aeExUSks0?=
 =?utf-8?B?OUcyc25QVVhQRjNiM1pUanc5VkYxTUVJRTE0bEVRRkUrSFJrMGZtQk54WVh0?=
 =?utf-8?B?UC8rTVpUYmpFTnlpODhtN3g1RXdrZllFM0lkRzExU0tTUDNCT3QrM1JJVzlK?=
 =?utf-8?B?aGNmcERWalpIR24wcGFMSFZ1cUQ2RDMxYWxaL0kzcmZpdkNTcENPK0JMamhm?=
 =?utf-8?B?elBQOGwyVGx6UUdIaU92QlYvbGh6ck5MZFJmaUNEQ1RGd0c0dWtVUk9xcHNz?=
 =?utf-8?B?cmRvWVRSVTJvajVSTUdVMjhaeWYveEFlK0xGdjNzNG5HN3hvaDJxdXM5Qzdz?=
 =?utf-8?B?V245OFp2aVFaeXNkdTB0d2lTNCtZb1QwTlQ2R3lPdm9TbS9Icll0NkxOOHVQ?=
 =?utf-8?B?elllZU51aG04ak5ERldDMG55TG5KSnc3VmFhNmozWnk0Wi81d0xDN3I1a1cy?=
 =?utf-8?B?dGIxbXRhQTZ4cVFhSzZob0g0aVdPQVFFVnhQUERFNzRBZlVYUlRucHNDd3Jv?=
 =?utf-8?B?Qkwrb2MwQVptVHVCYkR1ZEd6RlR4Q3NwQldsTjFlQ0gxUkNiQ2RkNUlMOTNM?=
 =?utf-8?B?T29qZjBLeWQrbURoZXpYR0ZBaUJNWXFnaGIyWUZDYjBiaHpkVEtQRWh5L2lx?=
 =?utf-8?B?NHBwNVRRUTUwVVUyVnB6aUI4VXl6MWtYWFRWT0pzMXQ2bjVzdkNYU0pqNis1?=
 =?utf-8?B?RWxhSmdyN0xNRGtFbHhmd3JEMGEzTzJsanFES0djZ3B5aG9xSmRNbU9uSURO?=
 =?utf-8?B?RGdiRUp2N29xNndMUE9uMC9Ja1YxdG9GcTdUVm9YTkY3SWRxRVd0TUpOUUxy?=
 =?utf-8?B?R20zQ3NRWGM2OEU3c25wc2JFUUNxakpXOTNGWEloeE4walBxQ3U1aG45MDZL?=
 =?utf-8?B?R0h4MGl5ZUhpSCs4VzVVVi8wMlBSM0syWFQ1SkZybi8xRkdpUktxZjg4RnRJ?=
 =?utf-8?B?a1RlSFJCaWNuekdxTDEzVUMrNkkwMlJ0U1kyMTZhQmJFeFloaWNBRTFZWFJP?=
 =?utf-8?B?cTVNdDgwV0g5WGNQRDM1YWxWZTd6Tktyb3JOVGdQeS9uRUxMZ2R5TFRSWG0z?=
 =?utf-8?B?ZGI3VHU3d25nMzBKZnF4bHhjS2NMenRMQkJ4NERtTGZSancrWWx3Y1FWNXpO?=
 =?utf-8?B?bzBiVTN5MXRsVElBTWI3RlhWaWszR3J6N0NrNVFtU1J0Uk9YRUd0cjkzMVlR?=
 =?utf-8?B?ZWQ5S2xUWm5vZlhySVdkYkZXSjBzRFg0bFJXQlVrQzVnNmd2ZFpRdVA4QWNE?=
 =?utf-8?B?a2w3b09OaHk0aEpUN0kvN3dsWVA2VlRiUi9NTzBOQ3dBNmQ2MTAwVEV0RS9O?=
 =?utf-8?B?QjRpL2YvNk5vSjdmalBEMy9CYjd4dE1xOXlOL2VtcDZpLzJYb3dJSzBQTDdu?=
 =?utf-8?B?YSsrZFAzbWRuSGhxTnZKaWFKWWdNcjY3NTlvd01IT0pvd0plM3pYRTdlR3hW?=
 =?utf-8?B?MHR2MXBUTE81c2QxNWdZdVNYYyt2S3pXVW84UnBpbmFZV1lISWhUekFGOWRW?=
 =?utf-8?B?bHhIRlg2YVkvaDJFdTgrMmNiNTllV0VqWlRubnRpdUZPRFFkMmQ2eGdnVmhm?=
 =?utf-8?B?cFRRN2NuWG8xem56cTBSRHh3b3hoREZ6eVdVZ2tJay9PWDMzeHlXajFjMGVa?=
 =?utf-8?Q?X87ISUKiJBTUmLxr3PkTpKCij?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a5b20b-fd36-4396-755d-08db81f233c6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 09:35:45.4736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVt3X/IVrqK14v+LfDid6/dv4TIX4oBgPmVjzcVK+U4rx+B3xLbtbY2MTX5i06inCcwqKEbPdVN4tWUx5tYN7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9771

On 10.07.2023 23:08, Stefano Stabellini wrote:
> On Mon, 10 Jul 2023, Federico Serafini wrote:
>> The headline of MISRA C:2012 Rule 8.3 states that:
>> "All declarations of an object or function shall use the same names and
>> type qualifiers".
>>
>> Change parameter names to meet the following requirements:
>> 1) keep consistency between declarations and the corresponding
>>    definitions thus fixing violations of the Rule 8.3;
>> 2) use the globally-adopted shorthands (e.g., 's' to denote a 'state');
>> 3) keep adjacent declarations consistent with respect to the parameter
>>    names that are used.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>



