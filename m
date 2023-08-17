Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E65E977F12F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 09:29:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585188.916232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWXRV-0005iA-AP; Thu, 17 Aug 2023 07:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585188.916232; Thu, 17 Aug 2023 07:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWXRV-0005gT-7G; Thu, 17 Aug 2023 07:29:17 +0000
Received: by outflank-mailman (input) for mailman id 585188;
 Thu, 17 Aug 2023 07:29:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aH5n=EC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWXRT-0005gI-Kn
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 07:29:15 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe02::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c449c441-3ccf-11ee-8779-cb3800f73035;
 Thu, 17 Aug 2023 09:29:14 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9045.eurprd04.prod.outlook.com (2603:10a6:20b:440::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Thu, 17 Aug
 2023 07:29:13 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 07:29:12 +0000
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
X-Inumbo-ID: c449c441-3ccf-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C2Jz5QHbxO1kqfYfhaZwH98cRBUWCOitAVdoPnrnjmr46TiEZT4l5m6OUKuieJPkiC+wUxqqJBQXn4Xb8Zya2S22aTV1WAzDZMVX7EAS0L3uhMvw4r8CR4V5DniNGx1CO1Bu6vd2VrfEPGMjCjl9ysf8GI2Yk4gwgIVK8YI08aljsk3YTlPIWrdfrlUGeMeTXKTAOleU6zGczBZjF/tkcRz6+ihjdchAwyPedcxgYulJxyUnF+8EiFBh2sAupwTKiHsoPwPHjtNBj1NsiM5w3drg5J2oRjp+/R0Im4r2Xp52CEW05Nd0m8kQHUrBPmMVQyThgiycBMrNe7q7ak4WkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJjTBGqemckn23wQCNIxxZBrUtQYdxRuFxvcsDzXO/k=;
 b=T8ZtP2Iljf4hGwwo7HHwtI6AYrzrqBr9oou+y9I3jk1QIz9uhKAcPK/Gydf/5o/SgoHsP6YwHsOPOgxHIi49ofniNNwQlvjFC1ItUMpzz7F6IWRvLBUgB8Yjh3zo1NNT7Pyfh9q6AzcxbUbyY6Lx16QzxcLQXALw+P3jddeNUrDyEqbRp2ficevpg9cVjyR9MFFLQVF7jOcuy+A6PLBlvN3vk4kA5IBg4aRq2rxtx8JVCPX6qTr0DM9z8kNgQjUy5wddxKbPIJlW/DGx6cFtyUiHN/nZT2TbJAz0ul0CwmQ4Be6hmupcFuqe6mlsCZ+iS3V6qerJqJzFtPwvETbdJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJjTBGqemckn23wQCNIxxZBrUtQYdxRuFxvcsDzXO/k=;
 b=zgF/j2sgNNBcnpTG6OGQTk6+gRwOlcMpch23F/0tyIIdw5hsg7wDRRfKCYUTPlfB+Rpu/2Z+iMKMRkZsSMTK7JwT2EndHzYlZ8m23pDPNxz88GkeDjsnCpKmKCzkwDFtF8TEF68O6a7wzL1COQf+AQt9Uawh1MmKuNjOno/52mC6ekXVRWTDISXd1RBeG9mbGFxUU7BmchkSfaeNAmFq5KPgcNdTlkFwaYoQ378gcFrzIEeanN8wfnfFSsKD56q4aLASdnqAkiNbA84CyBpJogFKwaS9FG3KWmU0KLuFAM33352BQ3xeA8f1ZLY2uevvyPfWRVuG1G6f/KrrNNJBbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <825e7d82-1487-b946-94db-7dfac30305c3@suse.com>
Date: Thu, 17 Aug 2023 09:29:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC PATCH v2 2/2] xen/vpci: header: avoid cast for value passed
 to vpci_read_val
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230816185035.82994-1-stewart.hildebrand@amd.com>
 <20230816185035.82994-3-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230816185035.82994-3-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9045:EE_
X-MS-Office365-Filtering-Correlation-Id: f9f79747-f9cd-479b-5b3d-08db9ef3a75c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bdwI1vKjtAWneRttq0kDoMR7ziE3/il+g17YDZUEQEuzzueVszPR7d2prooKpahgwy+Zjn8MBaWX4OOvPj4/kPiKCmiBDnGsqcCpZfrOHc5rZBx3LwMDOW64FddlbH8JHjRmjQa5tk2fCfZ3d8JFxZabpiAA2PeVQMdN8AXYz0UM0MoTwQvvGWAzf+en3bKTbHqw4YrFBxCV12cvzQBsNmbZcdFx2Qyv9yMFPd4i28SOL4vD2nCeEpt9BgEFRp83Bf3wkz48NrWMexjnaRwmVIqzY3DO1VRukqFPZnA+7dvorxtgRu84RThLv4Bc3FPQzBJuEUmsBCnNdX7ij3WmXLI2lo7k88Cq97tworuW0qgpSt1z49f9CK+SF7Rl8CiBB8+xHp1PQA01W9lcEiY9rtUnPhuiX+7Qir3wfq7F4/+oGDE+wBqGUdyH2GK1DWo8myM1S/OsamtvE7nuu5zEOumpSjn+pVpvC13RcUpzV99OrZ4rLjzblayQQNjZoklWumf9GnyghSfzQ4jn6pCk6H7Kdq/OCvjvDu4qxdyu/4SiMloDoropxU0c96kXcFK1vzNSjQVMiDTHYJlhFsQoLkxBC8COu6zthZiO2TUfbEfVWtjydhnaDwi1dVevnJk2MJw8uMIULW95tq2Z5SzeSg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(376002)(39860400002)(1800799009)(451199024)(186009)(2906002)(83380400001)(4744005)(26005)(86362001)(478600001)(36756003)(6506007)(2616005)(6486002)(6512007)(53546011)(31696002)(5660300002)(41300700001)(316002)(66476007)(66556008)(66946007)(6916009)(31686004)(4326008)(8676002)(8936002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVZkUHFHT0prekt3NXRRWWxaVHhTdXE4SHRaZUtyb25ZWU96RjNQMlpuNHpu?=
 =?utf-8?B?djc4RHhxNGpNTUFnNzN4WXEwZmVkalQ2aUlCVFlkRE1rNlVKdExVMGpkUjVP?=
 =?utf-8?B?L0RWVks0M0ltRDJQaURyUmp4VHVmWXYwNnZsYzlhdXhNY2pya1dIaTcyc1dz?=
 =?utf-8?B?NU5VYUlLd0F5Z2phUlRLeXJZOFJJYkRuRitFTm43anV2WXNLR3ZpcXdDYzU1?=
 =?utf-8?B?Zm51K1A4M09MdWF4SmZOSk14OVNHd2tvS1pETkFUM1hyZlRRVVFJakcwYVdw?=
 =?utf-8?B?SnpuTFp6WmF4VS85dzhKUmpQZ2R5SkZxNTdVRjgvN0taUnNrTm9oWXpUUDdK?=
 =?utf-8?B?QjV1YkU1cG5QMWFocWdvSmp5UHh0TklKUUxqekVCbktOMERhdzVIZ1VUV2F0?=
 =?utf-8?B?SW5hY2VFVEVEVnZSN2ZZZ0d2OEcxOXIyM2JmdDFTbE1ycmZEbUcyeTVaeWN3?=
 =?utf-8?B?ZnB2MGdGSWJpZ0Q1NE5Zb0Q1dzAzUDdLbHBoWnZrZW9KaWM3RTVUSVFvdHB5?=
 =?utf-8?B?T0dINUNnemFPRVlBU3U0dTBTNFBKY0tVcWhlbTNNaGJoL3BUNXVkT0p4MzlC?=
 =?utf-8?B?RHN4K2l1a2VJUGdQNndoTmlOdjNaRFQyMURhWktEVUxJSHVxRUlyb01SMFUy?=
 =?utf-8?B?WU04SVRyamlKQUlMd0ZwRkFRVkJ5RVNKZWR3UlZJWXl5WGFDU3hNUkdDdlFx?=
 =?utf-8?B?d1FKd0hmYnV4Zmw4c1BTUWZOcHVMZlpnVjQxaEhWVlBlQmRPMTQzbk9MOFF2?=
 =?utf-8?B?VHJGYzB5QUFmTDQ2V3lwd0NmYzY4WjN1azJxM3ZuWEY4cytJYjBWcm1rZkMr?=
 =?utf-8?B?M2kvREtQbnlleEl1b0hkYkhPMUhwTkkveHEwZzJPVmlIMGdMSFdUR2w2bVhu?=
 =?utf-8?B?NnI4cXVmcGhSaDl2Q1RLUFYxZXBqRVQzUEVQVE9lUzBIaGorcFF2T2dEUElT?=
 =?utf-8?B?TlBSelEwcWkySWdGS1kwamxFSGRHWWVxV2p6SU1kN0ZONU55bWVzc0c0M042?=
 =?utf-8?B?VTRWd2FucEpGYUNNV2lmaFdvU2VJbTlxQmFsV1lnTXdBQjVPdHN2WjUrbjRs?=
 =?utf-8?B?RGVScUkxekREL1F0L0VNOFQwQjJGdktodDc0RmZWQlFJeUE3RlF4ZmVHQUw4?=
 =?utf-8?B?MmtteW53dXJRdDN1ZHp0bTZ0TFZOM0RhMkJYOGlrQURlSkhONWMzZ3pJL3hT?=
 =?utf-8?B?ZVdSZFFRcDNUTHhoZGpNQStUUTlZcVcyK1l4QnhKSFFZZXp3NVRsVWd0WTZU?=
 =?utf-8?B?Q294aUxTcURGcWdFcUdsd0c4MTltWlZ3RHE2NU9GQUNnODZiZmk3VndpQ3JQ?=
 =?utf-8?B?TFVFOXY3cGxRdFRxWFBsYTVtNjQrdHQwWTh5ZjhRQnJNa2NPNjRPYzFVZ2l3?=
 =?utf-8?B?YXJ3dUREeE45Q3pQV1hTYU05c1hnSld4WFp3UGtxQzQxMnVwRHRhVTQxT2hD?=
 =?utf-8?B?SEh0STNYQ2E0dXhaRHMrOUZqcldaK1VxWW1WSWpHQ0JaK2dJQTVsNjBvZ0Fk?=
 =?utf-8?B?WmY0SEZ5Zkw1YmtCZGkyT3p2NENTNkp0NmxWQU9BYit6QldONjFVY0pYanE1?=
 =?utf-8?B?c1Y4UmdadDNpeU9tQ2g3NHRQRU16ajMzdnBjOXovcTNnVHFRNTFuaXlqUHIw?=
 =?utf-8?B?ZFpKR0s2YzQ5eVkxZk9FQXVoZ21pRkVrNE16aTdMTXpUSHAra21XSkU2d0dm?=
 =?utf-8?B?bk1wUmd3QWsya0pUclg3UXZKQWhoaStIY1N3WkZjQU1yQVZEMXRzL09HYU82?=
 =?utf-8?B?T0ZJY2sxVnhML0JuODBFNHROMC9iRWZ6NGhzb1JRMCtCejFEeE10THltOUkr?=
 =?utf-8?B?V1QxL0tHMGt0d09NcVlDbGNJQzBpR0lvT0kzbUxvWGZLNk03MHhLeEp5MlVu?=
 =?utf-8?B?dHdDQk5sMXVjdXZHckRhTUFRZUM4cm9TRDFXSGVKcGpLSUxYT1V4US9NY0w1?=
 =?utf-8?B?dW51aHViZXZEU3p3a2IwV0hOamFKZUpmT2M1ZytjMmpJcW9ESUZCUVJ3cTFx?=
 =?utf-8?B?azhmSUEzUks4cTRXZVp2OEJZNVFCdEVjN05mVG5wNjE2QTNMdlFrMDlJYTlQ?=
 =?utf-8?B?SnlUSjdIbnNidkprQ0ppUE5kVjZPZU8wZlZYdzVkL2dYcHZmK3pZOGxIWms4?=
 =?utf-8?Q?GagNiJWY31/f84mmR/rH09M+4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f79747-f9cd-479b-5b3d-08db9ef3a75c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 07:29:12.8766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E1nqTYiy7Fbt1KDVeXCt6dWzwFL8pUGXdfpe9jgLJecoANOYzGn9umuDf/Jc4gJuIP6KPOcW7lJB0K9WF+NlHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9045

On 16.08.2023 20:50, Stewart Hildebrand wrote:
> The only purpose of this is to give an idea of what it might look like to
> introduce a new memory allocation in order to get rid of the casts for the value
> passed to vpci_read_val. If this is deemed preferable vs the casts, I will
> squash it for the next version of the series.

I would say this isn't worth it, but it'll be Roger to ultimately judge.

Jan

