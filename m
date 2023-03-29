Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 059926CD7A6
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 12:29:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516167.799862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phT2s-0002eL-RA; Wed, 29 Mar 2023 10:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516167.799862; Wed, 29 Mar 2023 10:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phT2s-0002b6-NW; Wed, 29 Mar 2023 10:28:46 +0000
Received: by outflank-mailman (input) for mailman id 516167;
 Wed, 29 Mar 2023 10:28:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phT2r-0002b0-Gl
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 10:28:45 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a3cf769-ce1c-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 12:28:43 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8093.eurprd04.prod.outlook.com (2603:10a6:102:1c9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 10:28:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 10:28:41 +0000
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
X-Inumbo-ID: 7a3cf769-ce1c-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1H6qMJyraKyUvv5yUMguUYiomjcsc+QPF3jyXEQdSouFBMC3Z0YipItSZjc5Wdk0GzZbPKRqA8WCy+H7pwXWDHmSZzKgIcQHYnChDD68WiHIrvI4HC57tHypkLS5oD6QwSwGgRO0CTgW9Orh5x+PDCKeU9P59v6NIOHhFEx3fqy0z7VYnFzL+0Cm4+g4CFIruZeEOu52YTBbb9u9e74uJNh8CLgP5tNp7scpYJc8rcnSvermFmkNyUgo5vgaFxFviH2YkcGBLngGapkhxemZsv8SQAlqJj1bEqB/R+LzdoS85oNGLFaJsDtlYVBH4va1drn1Y6B2UzAKzz7o+EtQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6xRqmJhY1xhZvRzBSlkPEWOc2x0ZWxkS7h9y+lJSOg=;
 b=b0q6Cbca8HuoI2lbnX9IwLxCKGysMSVs5n6FsD/0/yYKYmBvYCFtO54mxp9ML70goZhyDdD0Mewh+lqC6UFDkB6nLYdJYi2rjCnf7pd8oedruPPTI8xm9/CEJlH0MRI9ULz0XRpTJevbLF87eXPIp4ugBJeEEkXd+hdY2p8jTtKmPuv2nx8ypfg4BIMBikehLX1hr0LTWCxrgD3K3YTpR9TvXqCLWCSKeW7WhP9q4pnFQJnMz/jmbr7NH3mMWadlfECHLln05TYLvyHoCwGZ81AP6kdGx65uLYLBQLOdwpsgnhgKMWmV9eMfRQMer4vpTTfwzvajNcZICkUtWBQfAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6xRqmJhY1xhZvRzBSlkPEWOc2x0ZWxkS7h9y+lJSOg=;
 b=GKfdMRU7ol6xCZy4OtvNTrEkgL70as1RPrXew7Ph2xSuIldISfoVcuL3Z980U6T1e2tujM6RbUTf1QJ/GLc91q0qY5s+uZfpEcuVI6b/xgzXMbvFDScsKyQ6B2MrN/044i7WMD6SXPmKpvl2JwjQFUQzO2hOtlKuiIuYpPPT8JWRu9+UL1TxpGZ+gD6cRVQhhRrCcErNUZZZUlmJrRVatPyxQ0wNmet20dtlCtcrBB9x+cC0CGb6nhZXySHDCoOc4IuQJiiXxnIgt/lUat0n9NwpFSrqP54+RAeR4Qry1x5ftDiXQMFG2VYrn8TVJgpPYGgGw11rG5PnoEKQ/+RdXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fbb16a2f-4a25-466e-7f64-7bad99936562@suse.com>
Date: Wed, 29 Mar 2023 12:28:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] drivers/char: Use sub-page ro API to make just xhci
 dbc cap RO
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.0fffd3f3080b5eeb8d22126eda6088734bb0c926.1679911575.git-series.marmarek@invisiblethingslab.com>
 <befefa60ea42a41543bc6dad70a559816cda8b7c.1679911575.git-series.marmarek@invisiblethingslab.com>
 <5cc58e5b-ba23-e7ae-c575-fe8cd713f515@suse.com> <ZCQRMAoch+oq+2/e@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCQRMAoch+oq+2/e@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: 68f87ec6-3fef-4dce-332b-08db30405d89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Cvhr57li3fbAqNgk5+iHvnT8ZVDipfWouBM4VCrMaTZg6pxHpFZqEryMKImQ9RlAGfhquDnE7DgM683KslgdlEEZbGqRrezhESL9uM+1vDCb1V0HBcUtQcaQuZCC2zT0cyDrCTc6OOWAtfnqwdSBP97aWZJTD95gUukbagmlfmZYuik7/qnIvtjORznca2c3a3KMOH/HKoVvBVsZefGrjr+M8SmFATd0lP71CPHcWsdeTV26XOyVyUfp6h5nrez1GEhLNw4h1tMLPT72s4a9tL/mchsKCFH7w261OKskdc8XvNRiAUbWYcRKlrONt82jOilHIc5iBF0WP+fH306WaTpytgo5RwNi94ZY/tW7Yq75oiXdg9+5h+XjNoPcyky0Mphf1htNp5pI2PTMTuMIuoN0pIMKRUNC0MFtBdAEgX6MO7fbRchxZXkjhy8bleQkp8QSi4aSNdO/hx2cJvBJBxbFPH4LpWXaUeSLBAoSTLbyVRFn3+KW2AZ6+vxZFNorabIeaUR4XPomijpM6hHBr3TJhmvIMahvJcDfpyxvuPphTvLHUKzPR5hOWCblc3AEgPL2yYvkAGPuxhd5X1RPasxAKsGMc4FE/3hJAuiaQAFP+grsBzDZDGLB+iTb+eUdb5/Fcyr+diE9nBMcCReXKA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(376002)(346002)(396003)(366004)(451199021)(6506007)(6666004)(53546011)(26005)(6486002)(38100700002)(2616005)(186003)(4744005)(5660300002)(8936002)(2906002)(6512007)(36756003)(54906003)(316002)(478600001)(41300700001)(6916009)(4326008)(31696002)(86362001)(8676002)(66946007)(66476007)(66556008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUpqNXdLdHJUTDhiRi9lNk1WYXEzS1FkZWNDcDdsZVJnTFlwcE5xTEc0a2RT?=
 =?utf-8?B?YWd5ZjNaSzAyK0F5aG9FVjZ5YnVTNTNDYm5FaGsvMVZib0dyTk1SNk1Vd1Zl?=
 =?utf-8?B?YnRnTENjQVFSSkhQa3hZcVQ2QUNOb2pieUJrSC9zd0tIbGhpejFJNUZWM2hl?=
 =?utf-8?B?d3dhVndlNU1BcG10UTVkUXJkUVAxK2dnRHFaY1pXT1hGc09xUE1zS29lMmNU?=
 =?utf-8?B?Q1BMSU1rMmlpSU5KeEVYL3BpdXNZeElvTFlyakZoQjNwcjRnUHV1aHNvRkpJ?=
 =?utf-8?B?aEg3T1UxSkpXM2NubGRML2lwRzBrdDg2S3FXYWFYYjRsWGJuazhTaEt3TlNK?=
 =?utf-8?B?REwvRHFBVEZlK0hZTjcxZDFrMjh6bmdGVENnOFRETnIzbzllNzRDTTl5YmNm?=
 =?utf-8?B?aDVoR1Z5ZG9iZ3RubEUyWG4xK2x6UmFWdUVraDlpR2s0d1NLQWIwT1lsaHNQ?=
 =?utf-8?B?b0U4aW5iVUlVZnVwYzBuSXhFL0tYSHUzTWdLRVBxU1A1eXBJNU9YYWZWMm9r?=
 =?utf-8?B?RW9ObDljRmNYRzVKVk5ONTE5dFNRUnhPUm8xaGUzMnJjM2lNbE1GSnJjeDlz?=
 =?utf-8?B?bytKdEVzaWd6THFCRFJoQlJBZkJKOG82aDRKT3FIVEV6SmNoODRCQXBONUNm?=
 =?utf-8?B?RFZtblMxVTk2cGpKbUNUM0RqdHZxajFTSVB2YnJjSTh1RWtRMEpyN0RFKzVj?=
 =?utf-8?B?WnQvazVlUW13cWxGbE9ENXBDcFVkUjZjb0JRVHIzY3FsdXE4U1ZDUzlldTFv?=
 =?utf-8?B?NDdZK2JLcUs1am9aQjZWYUI0MEFTdXh0KzI0UlpJS1FLR2RnTGxDYmlnUDVk?=
 =?utf-8?B?QWZDR0pEOFg5b2hUWmt6TzZmWUwrd1F6SE0wZXdCQmpiSlR6dU1PckhKaW9r?=
 =?utf-8?B?bXljbHh4YmJQQTJKUktNdG9RNVVMa1pZVnhMZVQ5VVpmSFI2N2ZHZkxzWVVZ?=
 =?utf-8?B?eHUvaDlBelBJdzhzZytHZDkyQkViWTBGVVVWa09hSTBnNlZ3a1ZFYjhEeUNl?=
 =?utf-8?B?MW53amxjVlJ3MmZGeWNRd2krTGd5bzZWcVQyL0FBRkpJcnZEVXE0OWcvQXVU?=
 =?utf-8?B?Nmw0cXdxd3doOU1ORzRMUFROdkZwK1JldE5oTHVuVm5LL3RPWGpVeCt1Sk44?=
 =?utf-8?B?TklFVUp6S1ZKVVVkTHV4d2w5UmwvbTAvem9vQjlsdktQMGRXSTdXd3NUMHgw?=
 =?utf-8?B?UDZOVld3Q2hnUVV5Rk1ReUNCdHRvenFrVm5yQTdsZzRNMlY2bEFJZVlSeXBj?=
 =?utf-8?B?UGp5T0RVL21DMVJzQ0lHVVpXMFk3eE1ienlMWEdoUkpiajY0ZTZXa21VeWZY?=
 =?utf-8?B?bkYyUWxMVUZuZGRqa0ZkSU8xRUZqbzQ1UmZGOFFaMVNwSDhCNWVWUTE5K1Rx?=
 =?utf-8?B?L2M2NDZyMldCTW9qcEpWNzkxVmZIWi93UFV2dUJXWWV4YW81SldMTU1SR2Zy?=
 =?utf-8?B?TFNBTUMxTkpwTi83Mk1zT3NsWC9PUFRyRXBGekFrWGlVQUhqelNsaDI2M2x2?=
 =?utf-8?B?eFI1cXp2Vm83cU1mL2YzeENRajFzZGx2SXBFOHpBKysrMlVDYy9FMmJ5Wnc4?=
 =?utf-8?B?dy90U0xpOUJER2Jhcmhpb1FEUGUyRU1lM2JycUc3Q2pHdDlESXIxTHpaOGcw?=
 =?utf-8?B?OWNsZllocmNtMG9vUlR6OHQvY2dxYi85NVkwbkI4WUh0YTdGRHliT2hsemZB?=
 =?utf-8?B?aTRxak5nWng0TWVRQm9oeHZGNFE5RTduL1pJNThHWGRyUEVJUFkyYTRXWVVm?=
 =?utf-8?B?a09wS2Z4enBKc0pEbnExK05DRlN3aGhEckFwbUdESCtJbXZKQ1VkTWo2Wlhz?=
 =?utf-8?B?bVhpeU5KVGtCUjlrbkd5WkVKMUFDbkF2cGFaNExzKzhjNlFGb2NTOHRyZit3?=
 =?utf-8?B?NDE4cEhubkk3N3dkVFFmZ3dXVjFNK0IvYllsM0Z1UzFvRUI3M0t6Zk9MZWpi?=
 =?utf-8?B?VDRtNzBwRkt5amlaZHAwSVFxRjE2STM2dGZlaG1kUWFYZUVoQmtmV1pOTS9D?=
 =?utf-8?B?Z21POEF6UWZ2Zlh2NkVRMmN5RzVjS3BwRnVFZE5PeDlOUDFsa3FCMkswd3Ix?=
 =?utf-8?B?YWswcTFhQVhaRFNDSWlaQ3I2MXFzZXNZMmRCb0tFU2RvQXhSMkJxd0h6MDZC?=
 =?utf-8?Q?Wr/4XoUeHmHf1XodumNLglGhQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f87ec6-3fef-4dce-332b-08db30405d89
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 10:28:41.0343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7Mogd0kaz12+ioLg8/oPJtedxx4qbwHAxAUruZ2Bw4LvSU0M4qBlpfkdD4ymYEn/WZqKw4uBJyBhQqwGz0tGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8093

On 29.03.2023 12:21, Marek Marczykowski-Górecki wrote:
> Making subpage_mmio_ro_add() to call mmio_ro_ranges() on its own,
> together with Roger's suggestion of using ioremap() internally instead
> of using fixmap would make it a bit nicer (if mapping the same page with
> ioremap() in addition to fixmap isn't a problem).

I don't see any problem there, as long as we don't gain many of these
(at which point wasting address space may become an issue).

Jan

