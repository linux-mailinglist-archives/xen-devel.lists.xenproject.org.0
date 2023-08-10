Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADECF77739A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 11:01:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581987.911482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1X3-00044L-Um; Thu, 10 Aug 2023 09:00:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581987.911482; Thu, 10 Aug 2023 09:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1X3-000412-R2; Thu, 10 Aug 2023 09:00:37 +0000
Received: by outflank-mailman (input) for mailman id 581987;
 Thu, 10 Aug 2023 09:00:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qU1X2-00040w-Nn
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 09:00:36 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062e.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e308882-375c-11ee-b283-6b7b168915f2;
 Thu, 10 Aug 2023 11:00:35 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9189.eurprd04.prod.outlook.com (2603:10a6:20b:44c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 09:00:32 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Thu, 10 Aug 2023
 09:00:32 +0000
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
X-Inumbo-ID: 5e308882-375c-11ee-b283-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbHTOcpe8LJ1wO6GjPhhLHQs6iQmVfhvmIHHFum85MyMYpIRdaYAEhavL5yxNEpqbrCdxWjFzGobS5/bBud6a+cptbWG4bcVkKo+YEIMPK23A9K2goOko06Tr8r+VLJS/7tHHJg0BMOArofj2PZUIkt7HKUb4y+g1Eg4kfLU7rFZMFvu0RKV74tjuiZwTlhPoZzoCv3QXF4YUbmprGtayf5OxxMOpuQQ6gTr72j2c/ctLWAU12S6a/f8ML4j6nFwEHMFhDgsuP8d6zZnzin7jbKPZl+Uu/06YDbpgZwP/LDeNtiex7rowhgv5xCA2pksA/zVtHDj8vZ6qp52wr6ydQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=40VPJiKTJTqvfzxYnOBbm5trwHZ4BPF5zYlofLlqvnI=;
 b=c+8Gg3/diZ3B40RQOw90m+OevvRmLMCUbCfnugVyT39ixBEBHO2ZBdSGWShNVPyrtJXopawNsiHk/64tuMOoG/fMb4JkA5cbpZ7eKF8APv7PMZsaJVTpEwRxcP5JxYd5DrH+6Bk/gZIERxYTr5RbyrJWpv2kLf0necyDkfTxKZBHp9vhcPQxjzdnV8cCMCRkLxrUKMHrJwMGudVkLxFqydRqadI796PC00K16PQE44obmYt9GX9RksHa5kgK5nD4D2H4vfIFLv55sdvyGikTZBm9IW84VMnEtxa4VicK82Z7i/6y66+7RBCEE21fFkBgT8JdemtNH3ooPHJfPzeuZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40VPJiKTJTqvfzxYnOBbm5trwHZ4BPF5zYlofLlqvnI=;
 b=ItfDMcp/uTV2gj7zUYTfESiMsTb6M2L4lbJ3xvtK6ycLjCe5bheJT/WKMIfVQlsOKChMPWRpupzY45tJZU8SslrXDR6M5JuGN+iujI1JSAVuLYpHUUhtaPFp7rLj01cAsPKCc79EuSgfzlOeW4hybMSoxXRFqxNXHCDG6qZt2CwPbCLQAKkE516oUSsCZCyE1ele8IzcuWjZVLxiJAs2Xg56AM3/Zgqlw5gZ12XP6HVgwbICw+IBUnwf7E/1Dd5wb9xOooNfCPVJDZ02hyIMit65oMS6VAYgRma5/R2cXVqdXfUfQupIjl4mYPygmzBJWve2vFwR9MBwfy20i8sqqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2e62ccd1-315a-3cd6-fbfb-b86af7177e7c@suse.com>
Date: Thu, 10 Aug 2023 11:00:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v2 1/7] xen/memory: make 'ioreq_server_max_frames'
 static
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Luca Fancellu <luca.fancellu@arm.com>,
 xen-devel@lists.xenproject.org
References: <cover.1691655814.git.nicola.vetrini@bugseng.com>
 <7f0d3f4330a262ec17029b3d82a7a89409215fbf.1691655814.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7f0d3f4330a262ec17029b3d82a7a89409215fbf.1691655814.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9189:EE_
X-MS-Office365-Filtering-Correlation-Id: 95ea19ca-4d88-43bd-b5d7-08db99804091
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5OwFeLlF+yuguhyXDBRiMAqIX4bt6SDlSF2EtLczBk7wTWNghYQShtgjZNvGRE75EtM6l7pjgSbRLe5tyWQlg9PRjtHpOGIwIsRk60SmW2nKFcoB1MmW0h65BpCQBF5HhijVBwrb5NgVLFL0+878F0zzXwYZDO0+0Dg9aVOUemsWg4l3Wn8FESorNiAFqaCYa1X82PZPp3BiGRd1w3P1PHumel0hLF+25JDgUR0u05O5tzfa2a5AbkoFlR1ZQss3vXuL0BQJUbotcxIY9XE4Qj8nRS1ybpU1EI5j40WzFyPwYG+VXs7eGW2OoHacEkRw4MsnRVjan2KgtrQ7IL7g8Uft6EdmCSloK3snOR1b58cb8b3cSextV24JCw2aruhPOR4BojjapMVbk6P1olE683L0rEIdJDOV7x4L9yUBu+8SPp8HjRPydswAlbR21v+JsFCq7kQLMalNiTi/7BBNv7ycJO0ukbjp5WR2fFLr3KAoR2UgMBJVfY9NVRMlwYS2LXO8x/MtBMIk7vZQOBaK24KdNCPFrrNm24U8zvaSXF1sdTUSKVbFqcUwvVJ8LU248YtchFBIMrK1n8JDQ0GB6dXisXyjFJKojAiLYZgd3bRFP22MdqjIFoh+XNEF4bqFl3Ay5mF/HhJQN+zk9iYiKQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(396003)(39860400002)(376002)(366004)(186006)(1800799006)(451199021)(6512007)(316002)(8676002)(8936002)(41300700001)(53546011)(6506007)(26005)(478600001)(36756003)(6916009)(4326008)(66476007)(66556008)(66946007)(38100700002)(54906003)(6486002)(86362001)(2616005)(7416002)(31686004)(2906002)(4744005)(5660300002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0tJZ0syYVp0T21YY205Tm14cnEwaTJUT21LZHBHL0J5by9mNUswT3hMOW5J?=
 =?utf-8?B?a0FlUUtzOTZQM2EzTnBVY2Z2OUt6K0twRG5SODhWRmI3UzVpTHBCVFJHNmF5?=
 =?utf-8?B?dHR2b1dXTUZ4S1FwU003anhCamVaeFU3VGFScHg3RndLL01sZ1VOS3dSR1c0?=
 =?utf-8?B?SnR3ckRwSGtyR1p1b1ZtbWU3VEpuVUcvWnpvZDdNTGdpNnp0OXRUd3UxeVpV?=
 =?utf-8?B?bHlnMHhIbnF4UnRKRHBaUkZHYWQ3MlJkYXFPWUxVQjZicnUyNHM3bk50bnZz?=
 =?utf-8?B?cWFPRzJoQWY3WGhzVU9ud0trMlNZMHlwUStmWVdUNEtRaEQ4R0tCOEdvaUh0?=
 =?utf-8?B?UHgrVDdOTzRlUnA5c0RhdXlHZnc3WlE4emFiN3lQblV1MEhPNExVb25jWjJQ?=
 =?utf-8?B?WWxvak9lbXdxSmFtRmd6UFB0OTh6ZldZWTBKdG0xYWJKSHFSYnZLblR1Z1RR?=
 =?utf-8?B?UWMySDBkOThjNytvMmk2R1J6cmNYMWk1cGJkVDdDZDc0TVRqaS8rWXgrUlAx?=
 =?utf-8?B?MHFxd0FzMUw2WmtsSnUzbGhtT2hSeEpsZXRYMHpQU0p0L2oyY3RaNXEzMitw?=
 =?utf-8?B?M293OU1FV1NZVm0wVVY2YUVROE1LTndCMHRRQUV5VC91b2lEK1NRQzI2aGxD?=
 =?utf-8?B?cmlLbFFERzQrN0FyamtyRHBOdzlRWXFxZERKbUtERnJuUzdHbVA5Yzl6L1U5?=
 =?utf-8?B?MWhJdVdwRThOU0l6UUpqYVhwMCtseFRnbFg4UUp4K1FBRmZCOGNpVHdLV1VZ?=
 =?utf-8?B?YjNKK2YxWDZVd09zaWMzWjIwSVlnRkV0YW01Y3grUVgreG8wRlBLUzBCa1Nh?=
 =?utf-8?B?eGU2TVlRNE05SzMyeU5BNSt6ZlZaUWpaSmRVd2N5U0hHTStJbTVtV1d3OGNM?=
 =?utf-8?B?SXArMDBuL2FGdE5vWGhPbng0UU5Wd29sVVpBNEJKS0xzNU4yeFFsSU1yNVhl?=
 =?utf-8?B?d0srdzAxYVh1VitIT0k0aG1WY29PTSt1cHZobzZ0Wkxad0FRaUh5ZHpHejY2?=
 =?utf-8?B?SzZjVDZZTURRb0NKVzdHMmxSVlNoUmJSUUM0ZFh4QlhiRE1CZExKVnRwOFJC?=
 =?utf-8?B?SmdiQktqdy91dUdJbjF0VTNtMmRibTFSeHhycEdyNUVlNk5scEVSUURKS3R2?=
 =?utf-8?B?SUd0a0hibWYramJaT1hueGxSb1dtYWc2UnZxczR4RUp1VzFYSFB0ZGdCYnNP?=
 =?utf-8?B?c0hRNWZkbEpJK3hoQ0h2ODFyRktmdmZ3c1ZNVEhJY1hkOVNvMmgvdzBlRFZK?=
 =?utf-8?B?ZXBSQXl0S2E3d2FPaHI0R0xoc1RRRldjc0FmSUhxWmdBL0VCdnVnNWZ0a25N?=
 =?utf-8?B?RUFQM0p4SkhMSVlKb1hhQWJMU2N3Vmo4K1FXK3ZVYmkvcW45Vnc2Z1hGY2Qr?=
 =?utf-8?B?WktjVWFCOW9Xa1RDdzUyTW1LSldOdmdLZm92YnNiM2Voem13ZlRpUkE4dVhT?=
 =?utf-8?B?ZWJSekZHQ2xGd01sWEhlbjJYTU5hWkVrVVV0b3BBR28yUUR4MEpkRXB1UlZy?=
 =?utf-8?B?ZXpLTFNYSmtaTk1BaGdDQkRaVmR5TUxyRDlGbFZULzVTbzhEK1N1WFBRMVFk?=
 =?utf-8?B?U0ttckkraHdmVmF6TWJjRERLYnFmbUVmbEprZmd5K3RNN3RVSkcvUzJzb21l?=
 =?utf-8?B?Sm4xKyt5bjhNbE1XSVA4ZTRwUmdyWUFySlREcjkxMEx3VDNnSFRhM0pkS2U2?=
 =?utf-8?B?cDVsT01QVmxMWXBjOExHbDZ4V3BWbGhnZ3lIbk1iS0twUGZDcUFYK1o5Ymdm?=
 =?utf-8?B?Nk52dTl4MW9UdzFleXYyWllkREtWcmpaK2VkMW4vU3dCai9LcWJpa0diOUlQ?=
 =?utf-8?B?QTVHYmpBbE44Y2Zqd2J2UkZNNUxlRGFjdXptVHZOSk0rK01BRTNBcW1rVGcw?=
 =?utf-8?B?K3ZpZUgxN0IwNHdOVzVkM0p0SVhDV2NXNG9PZUxTK1orYWxVUGMrWnB5Tnc5?=
 =?utf-8?B?bTFkRktueFd1Vk9BSHprSmhLOWlvdmpoN254MkRqUFo5bU9rZG9FclFqdXlp?=
 =?utf-8?B?M0pHV3BQTHY1OXI3MXg2ajZwTXc0Nm9ObGloQ2Q5elJZNmgzNFdCNy92SnB3?=
 =?utf-8?B?OHJpMklaT2h1YTdkenlCLzdBVVFNL2xud3FuQ1psbmEyc0JtenBJbnBxWjk3?=
 =?utf-8?Q?iGQ0Oiok8mCtP7MiLH3aP7ciI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ea19ca-4d88-43bd-b5d7-08db99804091
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 09:00:32.2593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B2RCtmZH7a2iOzbl66H04I2I/erBfZ5cUmed16TgyIk57z/Jnx3zgApSCI49bR0OBnkqXtSTV7CmHPImAtdfcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9189

On 10.08.2023 10:39, Nicola Vetrini wrote:
> The function 'ioreq_server_max_frames' can be defined static,
> as its only uses are within the same file. This in turn avoids
> violating Rule 8.4 because no declaration is present.

Here and presumably in subsequent patches (I only looked at patch 2
for now) you're now missing the word Misra (ahead of Rule). I'm
happy for that to be added while committing.

Jan

