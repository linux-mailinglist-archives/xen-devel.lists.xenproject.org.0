Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCCA6968D5
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 17:11:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495262.765573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRxsK-0001BM-Ly; Tue, 14 Feb 2023 16:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495262.765573; Tue, 14 Feb 2023 16:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRxsK-00018d-J7; Tue, 14 Feb 2023 16:09:48 +0000
Received: by outflank-mailman (input) for mailman id 495262;
 Tue, 14 Feb 2023 16:09:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jX19=6K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRxsI-00018X-Tp
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 16:09:47 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fda1c285-ac81-11ed-93b5-47a8fe42b414;
 Tue, 14 Feb 2023 17:09:43 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8355.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 16:09:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 16:09:40 +0000
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
X-Inumbo-ID: fda1c285-ac81-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jy6SqNzSeMQV5UA+VmbK7JrB/Zt0vwwOjDsQpmOIVklrgTFB1nBNNDy8J/fS2a0Rf7WEKwMXUVZsgcpYeqr0kAQmNRJgcBzcFqDzEDCrsJmUdW/H35XZrM7Bo9/dC/NAIuCoVlfDqKVMWT1HCHgoNeyXIhaS45/uAS3Tb4cd9MZC+hly1Jf2SU9XM0RkK35i3Ar71GjRUobnKTHvRHjfQ8yHcE6rJfZAK/Ni7RO4mtDb8+fzl4fdfBhbHe5/+AjaNVxZTxv8rgZAXQ6G0mvAfUMeIFInHOgI2lOJ9xAeCzbNlV5dMJtFfAV6mOy9zV+uJdGpZGBerdDuqx50vGPmfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xprwUPDQPzbG5hi8fYinkuvqBjSbr8pGUFSbo9sYTrA=;
 b=ih5uzeq/w5+2rGsGdPNkLSt95uVmllWI95ljRRzToRLCycr7I2oPOdG3xADucjunx/iZs8l6iggGqWWFJzjdKAHZVPQbeJ5HdA9nxedOQoX5nb1CbKWln93OYwaXlp7CRI4MKYGrmyWdL3E389Flgjhd27Y01nkV6XXcoUO+N5Y0sBKotnjwaR7VJTy3ezpFWZMoDC4Ic6lAEtW75nl9uJW8iLDNb/xpoftOu/FoYL2dSUd4nY/0YLHc7Jz6GCHC5g5gQ3wBLV5yzdzCc9fupgmlEeqCtdd4g0xa8lJRC/DYkzUG7gBu53NhT0YgDGH2nLz8rXbvgMKxx/q8ekVwGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xprwUPDQPzbG5hi8fYinkuvqBjSbr8pGUFSbo9sYTrA=;
 b=v9dj0zSplgzjyoRkp0uy8imYH02sdGE0LoFyX7YPS0ZmP7WxGG3BvVRbFTOAlp4wQlzrb2DHCaWOKjyh+nYpo52zJpzWGZL66JuPhec5T0MqHh2wSRGFU2QfvE+tLeCzXzpBONsPrkcuxQC+NS8w7uqc5DAS0u4E0kGwHSJ98IkBzNAAKIuIf93DX0+VXBzD7WPPd23eG5mlMjpP0zbT66gpJHxkRWTo0tVPvR/2e+mRUofUMoA6MNWBfbGCQg8XP/gKaSe2Id7jDTmW88TdHdunR9NOITvSMoIL5I0VGwq2F3JvPtRY8pNcyCwAuu6jq9iPP/iyz5GajhG/sXsnPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
Date: Tue, 14 Feb 2023 17:09:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 0/4 + v1 0/1] x86/spec-ctrl: IBPB improvements
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8355:EE_
X-MS-Office365-Filtering-Correlation-Id: cd04a135-7368-4549-f2d8-08db0ea5e066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qjOmW5gmJB3pmnZjDDC0kZqe3LD95Zh6nlabVOMwn3zRYRCWsI8Ws38IlENe9OsGwUS4qSp6jWubIgpnZUocg0a75nrzGge7fJ3+GWOCuwaqIGtddTGP3LgcuHRzem4FAgG+xoETFAE9fXaC8SWbD+HsnkoMXExy65ltaWQ7+ukbtCrC8NslSpTtLtzcogtDzhLmcDO9CgdkKDOoL2umKa3lzHoTSUlNgE+pBeajcUl4fuPMqqQskEkV0hAe6okR2IlbXVd9gIr3GJHEUK/j2nTu8Spa2XK43EvlGkxJz42TtF7i1JJOD7+1CrsFPBAgQPH30dUGj2TCRRkDbGUL6k2ESC+nMnHLH4ikKKS3ot046eOLbgVH8K0ilmBmYlKCNMxNVItQiGyL6YJXzGDcY9HLpVEhL/wj43LVvCZ88YZAFaEj+4c/zlG5khNN9yWSZ0WaXHcCrHLhpu/OBNK7vazM1GwXSg3hLNvOXLhEHSLM5VZAAYWCC8Fv63dEgZ+A4+uLftN5sYxteCxZmwzjLwVlM1NrcfJK84w+Mo9VyYbyZWySp4X8oGk83qWdCDfncYap5IenDLvXn4785stnVyTZmyqNAu0FL277fE/qjNni1RiHMxLYbSnG2z3PnLQW2iVM7OpIgJ1Tv6nxsqv6eyrSkh0CA/gIaVYMQkt7K/1RKbsmABMTUTC6t0GtfPUtsD0ZRY279I085TQFG5OpDbEMcM6gvScXghWQ1PtSKYY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199018)(6512007)(186003)(31686004)(4326008)(8676002)(66946007)(54906003)(316002)(31696002)(86362001)(36756003)(2616005)(26005)(6506007)(66556008)(83380400001)(38100700002)(478600001)(6916009)(41300700001)(66476007)(2906002)(6486002)(4744005)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUhLZ0hSblVsVjIxOWxabzVaQkJYTnplNW9Bc0p0ejkwVGxINElOTGFiNzVn?=
 =?utf-8?B?TVYrck1FZ0h4VUdDclBRMkRBZTltYVBRclVLRGRCL3dEV3lVYkFsQzFwRFN2?=
 =?utf-8?B?U0tWMlNWNE9mczRMZlVKWXRGWEovMzhVQnVXSFlqOVRPWW1RVEd6cWs1VFlO?=
 =?utf-8?B?UlNFenFUdVpCUXlqczBoZ2dDRFdtRUJ5eGFpNXlYQTJnRFdvTG9Dd1lTN0Mr?=
 =?utf-8?B?Z2tMbmRMakw5T3ZIUW45Tkp2RUpxNU1uMHFyRHlUbzRoUnh0ekpMQ1VlK0ZH?=
 =?utf-8?B?L2pvWE9nYU1xa3BCMUp1aStVancrTHN5d1RuS2NWbmJobXFuY0NKQVd3VjBi?=
 =?utf-8?B?c2JFa2tIcUp1Nk50SzBPUDc4ZDcvbnBVd2RSby9ZYmV4WldyOWZ0cnVkQU0r?=
 =?utf-8?B?aE8zZ1p1K2FmTDM3d2pMdllySHZKL2NtVVhHQnBGalJNUkQxWFBNT0d1TWVB?=
 =?utf-8?B?c0dtMlBURUovVko3SlhROUNGZ1VLYmsxa2lib1FLYW9sZkR4Z3lJcVh4R0ht?=
 =?utf-8?B?QmFITllRK2xnTGxvSkdhcmNrbW96NXFyZlF0SHdIcU04LzJ1TVBLK2FiZEEv?=
 =?utf-8?B?dWVrRDIyZW42MmdwZWtkVzl0ZHd4N0JnOUh0dzJBcUlOWWp2RjhKSVMrYXlH?=
 =?utf-8?B?SGc2bkt1amhlVnZLd2drZDlxbG55VFc4WW81aUJvcFUwa2ZOejNyelBRYWRq?=
 =?utf-8?B?TXkrU3JONlFaS1VNaUpJUlkzYWN3cDk1QWtjSjJ5Mksxd2MwUm0vanFDb3ph?=
 =?utf-8?B?SjV3VDVnb2IrWFJ4Q0RUY3FEeC9nVm9XaCtkK0V2V2hYSU4yN2RqRlNwN0Vv?=
 =?utf-8?B?MisrenJ3Q1NIdnFKMHc4YTdFNlNWVWVKWW1vMlNtSGE4TTQ0OHlJeUxIMklZ?=
 =?utf-8?B?amlBWXYzMklsOXJSSzFUNEgzNWNOdktEUURMMHZocG1BS2NOZU54N3hWeFdz?=
 =?utf-8?B?NjVzYlVjbW83N2crbUJrYStIVGVOQTUrb2FVdXRqUEZHRDU4SDhXb0RaU25v?=
 =?utf-8?B?dTRBeEFGaTJyOHJ2WFQ1Vk94eUpJRUcxbG50Z0Y4NzJ1b2ZKSVZTdDUvTVV4?=
 =?utf-8?B?akRtR0F4WEx6Myt0ZXJnaGFmTFVuU0ZEem9Xdk1VeHpNbUtUbytLRk9UOWw1?=
 =?utf-8?B?WFhUTEYvOWdSVjBkT1lWd2I1YmlZL3AxTVo4WHZwRUduTTFVTWtuRDRUUHdW?=
 =?utf-8?B?cGloSFIrWlRlNnZYVm40OENibDNFV2Z4TjJOSXFMYVNJYXBLdnVGd3MxL3Y3?=
 =?utf-8?B?WUc2bDlqREtkc3lCRXNrRlJGUS9WT3U0QWxlenpZSTZza2pVNHNrbTdzL2dm?=
 =?utf-8?B?RlFkTXI3RUl0M0VublFUVjJWSWhVaHpGVURGMms3dmNVU0p5dENWcGc3VVdv?=
 =?utf-8?B?RWRHYTV6aXA1K0tlOC9GVEl4eVJsejZidkhISWJBdnljcjVZZ2JDcGFsaDJZ?=
 =?utf-8?B?NmZyTE9NRDhDWWZUNGxUYXBWVFJ4emN0NjBvQkpDTkhBa25ZcmtjWWhoSGli?=
 =?utf-8?B?MlRiUVJQa2FZbFlORTFWQjk0TGc3T1V5dnhSS21mdlowdUJWaE45akJRWm01?=
 =?utf-8?B?MUZQY2lsUHF4NFVoZTVrVE0zU3oxY050d0w1ZXc4MkpDd3pmYkdrMTJPcjhw?=
 =?utf-8?B?RmRMRUk0WDM2N2lWczA1YlRaZGlySThyM0dsNGNSaVp4N3BBVzRSTWpXWXUr?=
 =?utf-8?B?bUhQMVdxV1YyOExxRVBFNzJhM2hlZ1R4YmZPeUowQ0FCb3N3S2F2anhWMFlK?=
 =?utf-8?B?dXBPazFaTm5EU3FyMlpKVGFGS1dldGZSWll6alA2NSt0eCtqVGluYmYxa1gx?=
 =?utf-8?B?Tmx2Zm4zNkRObnRTOFJTRkQ5d1k4QmNZLzZRNkNFc0tJc2tZQlF4Y2VJdmRs?=
 =?utf-8?B?SlJIU0kyU2pLZ1FsU0xvNmFzaHBDOUhFaXU0Sk5HV0xqT2tLelZLSEsyZ0hm?=
 =?utf-8?B?b0VmU1lKVUZoRG4wckhnSjlNQmN1dnMyNTZyVVV3dEJQVWlKKzZ3cmNidmJH?=
 =?utf-8?B?WG5nZng5ei9RSHViT05EN0xLU2JqVFdjMHRTcWI5M3dEQVdhSVFTZHppMS93?=
 =?utf-8?B?ZEV6K3ZpeFEwYURyQklWZjQ4WGRlWVVvQ25vSDFFWUpwbUNJVzdHWGpCbzVy?=
 =?utf-8?Q?1kNovxim0U4Olix+eViCOUX36?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd04a135-7368-4549-f2d8-08db0ea5e066
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 16:09:40.2949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sDxjJ2AYfAEUJdCOcL+CnninMMNpikB7VkjhnIUbjiIS1ADFzvo8uJRY2Rnwx4aIyxOgaLOFRbGtPSasMHRsPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8355

Versions of the two final patches were submitted standalone earlier
on. The series here tries to carry out a suggestion from Andrew,
which the two of us have been discussing. Then said previously posted
patches are re-based on top, utilizing the new functionality.

Xen:

1: spec-ctrl: add logic to issue IBPB on exit to guest
2: spec-ctrl: defer context-switch IBPB until guest entry
3: limit issuing of IBPB during context switch
4: PV: issue branch prediction barrier when switching 64-bit guest to kernel mode

Linux (new):

1: x86/Xen: make use of IBPB controlling VM assist

Jan

