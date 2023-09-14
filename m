Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 258E979FBC1
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 08:17:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602050.938401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgff7-000301-Op; Thu, 14 Sep 2023 06:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602050.938401; Thu, 14 Sep 2023 06:17:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgff7-0002xI-KP; Thu, 14 Sep 2023 06:17:13 +0000
Received: by outflank-mailman (input) for mailman id 602050;
 Thu, 14 Sep 2023 06:17:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgff6-0002xC-1g
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 06:17:12 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56839612-52c6-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 08:17:10 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7133.eurprd04.prod.outlook.com (2603:10a6:800:126::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Thu, 14 Sep
 2023 06:17:06 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 06:17:06 +0000
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
X-Inumbo-ID: 56839612-52c6-11ee-8787-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MsTo/8Uz3SYJKTkRCl6rQCIjuR9FdWtrXKrrKQMVvT4OG15XQYDnytCM/pJ0ySFhdRx/oXHB0GShHRzBHGB7DCwc8qOICu2yEdnR8gCkqI+URyxPNj4Lvl2qYFaWIcGr38+SV8FJaaaXMa9Ka9y9xlMUQ5IrllAKpF6dpQ7uOyFmYWBBerOz2s4G4DMAWhqlt6IazOOSv/mMjGO0BT39UvMHq1NkScDEnoXdxJ8tv5EJKB19PFf7y8q3iw1j/zpf/v+6wl+QfJCLxEHWhZDATh2f+lY/37sYkpgs9qAOxcnx0RUR4Z7ZGZlnIfxfdOuaqkZzsWYFba7/1mQu+sUdOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCWY16LZ9szYfxyEFTv2gL0s6+BdULHoi9aOvCMqcsE=;
 b=Q/k9fNXx9ui8Zm3oquOtlGHM94sRPYekjQEPy6LcwQNNzI7gsnzFF9+sljxGLarYL3hgWuPLP/MM+4iaEzysGqV2GLP1II0bamjGUE4/v/bQ4pbZVtqe+xnfW6D0AFc/OKqBRQCC1/BO551jmglmjnzmoF79ujUhPv11bErpqMGDGny9G61EyaDOxlmCU6/CsGRSuMXlfuKdkW1tf+9ZfWBu7eRk9EAArnAYaYrz1vMQom2EoQresO0UO2jnf5fuwWcKZ8HElZEyBCrOQjufK5+LKzcBy7wvv9Nbj8FkOkz9oN3T5DoyC2AGPAYE0Ya5R6KsEYV9HQK0xoyjE7/TnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCWY16LZ9szYfxyEFTv2gL0s6+BdULHoi9aOvCMqcsE=;
 b=cDmdK7FpwRA02Ky3ugQYzs7AuA6srJBUNejzZVp3VoTY3/Ax6itQ1dff5tI6DDLrB5DdQNwSLLeiWPqjsch7Cb2EiJgxoGOWK9H/9b1+MqsT+cTxuY1ECiPcBCFtHQiYQSvciGO16ci9E6g5zCGlmx3wShcq/1COJPJglvm/3iSqCXa75V8ZMGbCEezgzcWfpKo0AhpvlTQsjjUxA0ondDrSI+PnQOsPaki9dQ72FHFC0VVnp2jF6oxl/dFjQN+GHzVebevbzZkF3c7FFOlUAn/SiGMaau97Dgl8B1zd+EpfaWs19Nd/VQUiTaV2BU89HKvUO5LFtext/UexCPdmVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <412b4c0f-e947-1a3f-9e81-d00a13aa440b@suse.com>
Date: Thu, 14 Sep 2023 08:17:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] docs/misra: accept 11.7 and 11.8
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org,
 george.dunlap@citrix.com, bertrand.marquis@arm.com,
 roberto.bagnara@bugseng.com, nicola.vetrini@bugseng.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230913231617.2638735-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230913231617.2638735-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c350d96-a09f-4bff-2aff-08dbb4ea3865
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nbpf8/BztynhGFJYvkUwFbJJUvnF5Lw+O6/kCyTML+VXR0DtpmBc7obySUrjoGCOeGC4HATk/JpifkZ35ZTkUALbOFsEc2LzufTh+5PrIUDAkR0DVeTQiDX0wXHUKS8vRhwXPFIgADYV+UVebyp0dv5O4ceR8WE905KC7HQsDKzV0DXtUDLRW7zjUwJUdKXCPD2uzVATNljpHt9K/Jsm5u5Pn0rfZp8yw0wjNLj1uTJ4UOGirQBBkRggPj472hsie9XX7Jzw/oysPLNH2Qbfqmpn+rqap5YHJ/6BMnmjPZKAM/tTX+mgfjNjWrSULU0iRU9ESe52nC6ztzr5v+NFQducLM2azWqiCQJooNb+QwINP06pOMw/pfY7ob5GL35HamkZuWzVZjPONsF7WU7qxDduQUtCXU3Xwster2xnLtRdeW0u7p2Qln0SOnvtA5dkuu8YPz/PjoMuj1kR5hrEM4xiHJd6hLl2qSCm8VPgMa9+MoSSYVUfOfc3piMawTmVYJXpkPHz3mzijSIcnKxvlI3zZJb4XP4zkjEtCRMB4SrjNDGPoXW4mEuSEB5/TEPyrytOohhzCq57Hrp6LWYcs0cFoqe4Bh+MBmRLhK9jNH7uu3hzrMXaM4f/RDUDxaAm48F2fNDohW0IvXVgwQ8dLA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(346002)(136003)(366004)(396003)(451199024)(186009)(1800799009)(4744005)(2906002)(7416002)(5660300002)(8676002)(8936002)(41300700001)(4326008)(31686004)(66556008)(66476007)(6916009)(26005)(66946007)(36756003)(316002)(2616005)(478600001)(6506007)(53546011)(6666004)(6486002)(6512007)(31696002)(38100700002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1FFdlJ5TUtkbHVIbzN4NlFYeG5yN2lEbXpteTlURm54Ync3K3FSejlEZG5S?=
 =?utf-8?B?dU1YdmtNMThlY2R3Ri9hdlc2Yk1EbXNWSTBsQjd3Zzh4c2Y2Zk9TWXBZRVVu?=
 =?utf-8?B?WVVwYVR6bFU3ODRXdEFyY1ZzZkc3QnFvUnFoalZQZXJ3SWVkaitsTjBJL1kv?=
 =?utf-8?B?N2t3Q1VvbEFHRXpDaTI0VitETE5mNTNxQXF3Q1pvdGZwa2dpOTBUNVBXanZi?=
 =?utf-8?B?VlFESDBaY1BjdjVVbFJyMEVpUVJTRTJmMEpuMWRqMzFxK2NJb3pGWGxtb1A3?=
 =?utf-8?B?Vm82d0gxdmRPWEhHMDZ2QlZzUUxlZlZJR0VJVmtHQ0VGWTg0am9YN3F4NHU0?=
 =?utf-8?B?YVhQeXo1RW1Zemx6UndBUWFoV1RPR2xFWE1XK052cmVPdkMzcVdUTjY2Wlp6?=
 =?utf-8?B?OTZUSTY1NU9JclFPdWM2TFRxamh2eExjbXF6M0JKSkltWk1rLzdZVW8wSDh2?=
 =?utf-8?B?U2tpd1V0Q0lQTmxJN3A1YS9WSnRnTlo1QjF6cE1CcDhGREhTUGpMSjNFNWlR?=
 =?utf-8?B?cmJjUFBtM3p5R0xDaFhPYWNnR3liUnhoMHFIdHZER3lLUGtmMy9MSnBpZVhw?=
 =?utf-8?B?UXd2SVpJVXpnNTZ2T3p3SkpLYW93RHpkTENkKzkyNjg5UkhqNEF2Rm9zNDNk?=
 =?utf-8?B?WGVoTlVBdGg4T2JSZmtDUVlSeVBZTVc4aEsxOUxzRjBBcU5lY3NpcjFXaURq?=
 =?utf-8?B?OG5PbHpTdVN2bzFFcjZxOFVNNFp4dVBSSVdyU2tmS25KdkRUbU0rY0Eycy9o?=
 =?utf-8?B?cGI5YkZiODQ0OG4zMlUxZ1lhTW96cWg5YkxjUHBZdk1JN05LQ1ZyTnVoV25H?=
 =?utf-8?B?dVRKSTd4a0p0aHV6Y0wyUlRPeVN4Q2xrQjlLNmR1VkFNeFRQZkN0NTBITUVy?=
 =?utf-8?B?SkVldEFkckh4VGNseTRoTC9zVDZlT0tnUXd2N00vOThodWIyd29wMktIMW9P?=
 =?utf-8?B?bXZ6T0piQzYvRE9TZ1dYa050NG1ycWMrcDE3Z0h4elJySG56NU9OTnIvK3Bs?=
 =?utf-8?B?bjRoYWVJTGpraWdKOXJYMUp4cmFOeUdDSGNxY09HUFhwWGNiSm9PYWYreVJ6?=
 =?utf-8?B?Tm11TjVmWHFiMzBhM0krRDAzUzA4V0cwa09vZlZhYnJMR3U2YUV2RVNwc3FJ?=
 =?utf-8?B?dUVWWVJvSWl4M3NVdDhrS3cxeEQ2SEVZdnlIbVZHcElFQXlUcnVOYnBhcmlx?=
 =?utf-8?B?c3Q4c1EwaHdyVk9HU1U1bFFsd3RzRW5zNENVZHRZdmdrR1VDRjdad2QzMHNu?=
 =?utf-8?B?YVZPZDN4UzQ2NldzWlJja040QVIrS21pUU5ySkxhNnpKM29GajVrZnYzWmtF?=
 =?utf-8?B?SHZISGUyaUVnMXN4TmNNY3hhMG5zMXFoSGR4UzhQanB3Um1FbVZWaldZc2pD?=
 =?utf-8?B?NnRLTlZSM1B1TDRCT2FFQ3FOR3RPUXpleWZleXVxY1ROcFdPMWp4Z2ZJbjFh?=
 =?utf-8?B?YlU3SjExZEc1bWF4alZ4TUVrYlNmUmUxb0JNRWtCTjdKTnlzUDFCdUdsUFZF?=
 =?utf-8?B?QkJvZC9ORWp1emR0SHRhNHo4NUFpb2FMREYwNmtsdjNUM3dIV1UzNzViemZa?=
 =?utf-8?B?YndOTGNKRjAyN0QrMXZYTkNiL2tGRFRkSTNnSVNubkFTOS84TDZvSUdtVXY2?=
 =?utf-8?B?bDdPek5XNDh3Q29kbHkrOW1ab1R1OGJYYWtqRkJlWWdiTXFyOWJSQ3RORlVY?=
 =?utf-8?B?aGZuc3k0VFNZSTFuVVZwSnZiTlFnWGEzRU9zNmpVWms0cHJmNnVFUjlxWDdF?=
 =?utf-8?B?WExmVXlBTG5ONWFuWUdPR3F5cVFVWStFeUdZVU9qNERyaGZRM1hsTlZESXVQ?=
 =?utf-8?B?Z0FHZHppR3lMOHA0ZEpQMndkM2s5bjgvNS9qV1lhWW83YWoxR0RNZnVmVXJ0?=
 =?utf-8?B?U1pjcll5TlpWekZiUFdHOU1hNjQ5VGJOZHZiVzU0dVBRWEFZT1BTcWtNaUtW?=
 =?utf-8?B?Z2pXRVphdWFxeGtSOER1a2dnTmpCUFVWZnFjUk8rck9FZWdMNXE5OVBNUnBK?=
 =?utf-8?B?SW9JSWwvYUZ2aVZYUWlsS05Vc3k4TzFyVlJhTVpKUVdwMTFIcWFONXd0VjN2?=
 =?utf-8?B?NVJQSlNRcHRkWDB1SGhPRVptM2hZeGdUYm9ubmt6UXBXZGRySCtqMjh1Ymh6?=
 =?utf-8?Q?hETQHDSiERZEN0EFSei82iSeQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c350d96-a09f-4bff-2aff-08dbb4ea3865
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 06:17:06.6216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDsBcg1R+uN4UDQZyYRE7n0LSw4vqhAwRn9fF1Sz+sQsJn87w6i85xijiZ5Jw8ChFWHwVvud0GmiEC3OS+5CjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7133

On 14.09.2023 01:16, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> As per the last MISRA C group discussion, let's accept 11.7 (for which
> we have no violations) and 11.8.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



