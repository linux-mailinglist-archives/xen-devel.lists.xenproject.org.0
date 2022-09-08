Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B525B1C22
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 14:04:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403272.645326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWGFk-0008LF-V3; Thu, 08 Sep 2022 12:03:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403272.645326; Thu, 08 Sep 2022 12:03:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWGFk-0008Ik-SE; Thu, 08 Sep 2022 12:03:28 +0000
Received: by outflank-mailman (input) for mailman id 403272;
 Thu, 08 Sep 2022 12:03:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56Vh=ZL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oWGFj-0008Ie-3n
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 12:03:27 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80070.outbound.protection.outlook.com [40.107.8.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e522c1f-2f6e-11ed-9760-273f2230c3a0;
 Thu, 08 Sep 2022 14:03:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR04MB3079.eurprd04.prod.outlook.com (2603:10a6:6:a::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.18; Thu, 8 Sep 2022 12:03:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 12:03:18 +0000
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
X-Inumbo-ID: 3e522c1f-2f6e-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IET+Yr8IXtBSmpo9TzcsnvHtcKdPcGkZ4PHKR1zwB8ZvbJf5Xx8gp1y99i0mgzJIDoZZv5cafBINH58AYKWXOVTxFu9ElZ/JZEAIrpcgg8hYC0suKd2A9+nLpYLyoPYnZ1m5HZA3UYQE6SUaM0EtdGbPyvZA132v2FUW6gJAwiHW+d6NRPYREgL6Eq/R5bI/9t2Twwacv96PbOqdrORbv3qOkmCBKccqWJkMfvm96Fp7JGmZgHgHS/8WNL516jcImHAo6bvItOBDf2zS1EmIpAUZ7Fl1AVcBlVxaeZCKSOJkWlzcmYIeIRneO9lFeHu8eXTYdCc4lz8B3t7hTXiJ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ls0tyWDGIiSaXCFVTZ2tvhL+UWOC5u+M/W4tE96CDQk=;
 b=irv1/f3RKQ8mJOCtdNHuarbWDfzqf2UaBrS6W58xAPSOcbVyOoB55/2932Yw2FOv81/swoFj4/25805XKIYUkUFTLQK7XyMkb9UZczVxeobgky+hs9b7zFSyfCf33VR3SzV8iyQEZJj75qghnLWwMc2pFnv4YFbXqDS4Ad6kHqi6BhF0xqXg+tDYSbLRk4EvNDnlWtBTNAM6xvm2Zv6JeoYDMBaPX6hQKZJICJyFd/VJSlHKWP1hcI8wMgZWiIq91N5BpLTtDD9au20U/3CJk5hlpNO1ycSwwUaHcfm+Vvpj6V7SXCxluw9g+NgV6g8VY7OMQ4sU2GNezYBRaUdA1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ls0tyWDGIiSaXCFVTZ2tvhL+UWOC5u+M/W4tE96CDQk=;
 b=01M5y8WxIDHU6WT7R9f/iRY1jaO5pBFnqO/YqpE6RapzrcqnWeKs4Sbj0uP9A6/12vG1Psan379k34m94E9Orw4R4Y8XsjBzcli/ApD7e/L/J+iDaAoolPQqQ9Lj2/HsJuUtJrWtHT6++5UFbRm7hFYYtmD5X8e/c9MepyhTYlzxE5otYfKKLntvTOj6CN7nhmu/XXGrO2bnQW/+lgvYva/Ni0+K5jqE2yNUTtoMEud1/INW4w7yeiomHDHiEGBycE3+hlKrVH1bEHi9OdnOb2T6xgdzC9YFnIGBYNw5X5hl0TnVUBJg0Q+uaeOrCwLaSsXW4EcxTPOco5KPsY5q4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5db80611-c968-34c7-7181-41071636efca@suse.com>
Date: Thu, 8 Sep 2022 14:03:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v5 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1662637415.git.rahul.singh@arm.com>
 <63a0010c1e0f6ffb86fce35e188d66bf4c0d57e7.1662637415.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <63a0010c1e0f6ffb86fce35e188d66bf4c0d57e7.1662637415.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB6PR04MB3079:EE_
X-MS-Office365-Filtering-Correlation-Id: f8c87f24-aa81-4f52-7fac-08da91921dee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OY19xLXoU/ex4hHzYCkDwXGlz21yvpHaGDumodrAi/8yKoWnJVhoKuhjd02XXmmxqcg5MBDTDNwkTfTMw8fNaXNrJLvbVLFODiQ32MBmYFXRVC5uxIGKEZEhSgAiPGRgsL0k5y4fldFNK+9yZK9MTyzRoScH1n4GFDRLeLg6BljKpbvYergjzYBbTSf/7p1kFStpOaTxLgF19t9OBTpw13Se2OBoZK3sbcuirXOaRTyMSGR+elUO/V5FP+gIUoWvIF2wOitrcQoaFiXAK70/fHUlhloC45ZUblfJOJGbFI9mgWDekBifFo93CKczdFga736Il+nr0Lbdb1P40ljmGHDqKLycuLy4lWO5hB3s9bp10ZHqjVdC3aVGbFxBkicPzpQUj1mVBUdeSRfRAt8Ffj+Cn7m1lgDr9Es19A5QL41B/gd5+ySJ/yUg2vlBh4vkNiIDGXHH/isdRsEleamg9K0yvj/hQw4iBfnTBmcmseFKUL9s7j5fCFLCMDAD1KyCM5m8Ahq3X9hVJMnDUkp635CflIe4NNk6UR+qBFZQnFNCv0/sWDvu7gIvduYk9WtBoUeXjkHXdWu3O4YFzDow4oHMutI5Hjv0WVrIvESwgVmP3JR7CKw3FpllJPobmtObYpfOxwAJh6M+ydNuQOXm3UhuccFSLmjok5V+eu8wDNLMNZm3iicqQPQQIgKr5+Ha3QIijfgk0UNe551SjxFFx5dvaGyq85GnSVJUWlImZM2M6OtJlBF1VqAKzvbcplBfu5ornHdKslqj8oMOogXX6p12esF+oKAvOQZ9e4ztB1s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(366004)(396003)(136003)(346002)(8676002)(66556008)(4326008)(83380400001)(66946007)(66476007)(41300700001)(54906003)(110136005)(316002)(31696002)(2616005)(186003)(86362001)(36756003)(31686004)(6512007)(26005)(7416002)(5660300002)(2906002)(53546011)(38100700002)(6486002)(6506007)(478600001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0ZYU05yMXZaNU1CN2o4VWVqeHdCVGd1aEdNdmMxNW13VFBlSEtJblAwVHpt?=
 =?utf-8?B?cXNndlV3L0RBbmRPYjFJcWZyQ0ZreVMwQjE1MXluVHVhL0N6bDFMTDJycWcy?=
 =?utf-8?B?WlZ6UDNNNm43aFNIT3dOMFY3NEoxeWhyRlJCaUErdnJMeHpIa2xBZUhSai9O?=
 =?utf-8?B?OXNlTVdTYlhBK1JRWXVHaFc3QVZSUmhsV215ZEROOWtnSlZUQWlvQXIyR1hX?=
 =?utf-8?B?SnFadjdCcnVKOFppVWhiell3aGhKWklzMitUaXJVY1ZWbk9CQ0NTVHBtNVNZ?=
 =?utf-8?B?SlVmRDRUT1Joa2JrMlRPOHRScVpiQ2xuWDU0aW15L1ZTdTJ4T3FHQWVkaEtq?=
 =?utf-8?B?cENUaTlFZEFSYTFwZlNoWDRxVUxkOEszeUU4ZjhGQlJZVkhSUGtJV1ZIbm50?=
 =?utf-8?B?MDM0d3RUazFZcmRIY1pmeDhWTW5qZGJlemYvdHZjZTdRemxRdm9aNmxIcHBM?=
 =?utf-8?B?T1VmNjJNT2pSNmFhMDZGS1dDOUdoc3hwUVJOTEFsQVl5bnAzd0dkTUJSTlNK?=
 =?utf-8?B?LzBBZGNrMnNwSzNjUE1rSmwra3d2UU1EWlh1R0ZzcTNHQWFOZlY1QWpYdTdr?=
 =?utf-8?B?M2tFemt2RmFjbFhXNlY4dnIrT0dlSWdpTXFZUFZ6anlXRGROQ3NjQmJINHVl?=
 =?utf-8?B?L0s5ZklmdTYxTktzZ2Fxek0zSTNyTGRubFQxMkVPcnRTNUpsYWtIY0x4Q2xI?=
 =?utf-8?B?dUF1eU9HTCtQTEhmK0FTSk9iWWc5SVQ2TG40N2srbVBJTVNROU1kYU90dUky?=
 =?utf-8?B?UWYzTzY2cm40VUJienY2MDkrZWlRdDBPWU45NWxNdzNYVnVrcytaOUxGWW1i?=
 =?utf-8?B?dFkrSkFjYm8rM1NZQWFEYUF0ZmFza2lDc2JpaVlRZzR6RGhGdVZhWmM0RFVI?=
 =?utf-8?B?bXg0dUxtMDlUTGkveWFpVXQ0aUU3MGw1UHFMMm1VZzA4U3M0Q1pCQVp6ZkpD?=
 =?utf-8?B?YmE2V2JYVG1HMVhwRVIzL21LRHhVbVRhQmFwaW0zNCttZVNIaDluOVBsY2dB?=
 =?utf-8?B?d0tBRW96S050WHFNWElLMkVFM1BJbnphblE3cGRvN3NISDhCYll5THlqczRW?=
 =?utf-8?B?Rk9SVk5jR1EyQjlRcGZTcFhXOFNxbWNOL1hGWnJmRHlmYlZZYWFIZG9CT05W?=
 =?utf-8?B?bjhCUG14ZHV4cGJ4cXMyYkZPVW5XbUhMQ3NMSWFlZnlvUEJiODJKdCt3cUo2?=
 =?utf-8?B?dkovR3hzMWpNN0JzL2cvQU5xQktSMVlyd1V3bXVtenlMVDJpMmQxd0prZ1ph?=
 =?utf-8?B?dGlCcUlNWitBNkNQbFNsOGM1Q1BUUENEZCtyblZ3RUtiQnJGYmdKVTBodXhF?=
 =?utf-8?B?VFJsaysvRmNhUFVjcS9pR2xPSEsrMGlxTUVVcWZaWHI4QURlUDhYa0YwWExX?=
 =?utf-8?B?bWhmQzNXc2tVaXZiUHlwTjQyWi9XMGVuTUtlc0hYNFp1bnVMYnY5YUYxTlls?=
 =?utf-8?B?OFR5ZzVjS2JERHpyZTJ0ZEs0VkZnbmVBaHdjYlNiZzBLbjFISitrODhpeWkx?=
 =?utf-8?B?SzI1MkVXaWk2b1BsbVBjTmZCTFJmbWd6ZWF0VHlPN2E3bTFpRndhZXlaYXU4?=
 =?utf-8?B?Rm1waUdxZysyZEpreXhmN2dGaEdWM0JSeVo5ZEZ1QXRBNEZ1SnBzcHVQYmNJ?=
 =?utf-8?B?dy8vdTBMVnY5d0p2cHhpa292SGRHNy8rY3RrS3AvK240cTdXVjB4aDhyNXhq?=
 =?utf-8?B?dTdoZWxvNDhtcURuVk8wR09FMWx0cklrNkw0N0xNeFVFWE81dkFoa21OaTAw?=
 =?utf-8?B?QmtmR0hScnpHVTN4UXJnK1gxZEJVaW5kek03cURzNHdBaUF2MEFWTm54SXpE?=
 =?utf-8?B?Ny9PcFVNelhJekx5aW9BK2VJV2VXWFVZaGRCcTk3QUFCUGExR041V1d5aGVa?=
 =?utf-8?B?WTFSRVk4WFRSOGVDczczekwvNWwvUjRFZ1RLWEEyMXpKdnNWVWVvQXZHLzlk?=
 =?utf-8?B?WVIzWm5HQStaaHN4b0FjZUhaUFMxbnVvRE92NldJQ1ZzbldSa1dKaXArNFN3?=
 =?utf-8?B?N2g3TDV2WkdabmswbVVkN3VyNlFwRnBBTDVnM3ZjUXVZdzF0emZHUEF0cVRa?=
 =?utf-8?B?dGx3S2pEWHVOam5GSnQvYUJnbU5ZK2FwUWVUZXhJTmx2eVNIQWZCQVZLd2Rm?=
 =?utf-8?Q?gi1W7bsPgf6HvMmimY6Xk5ADI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c87f24-aa81-4f52-7fac-08da91921dee
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 12:03:18.1799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZVDljnHgyfWtPPqnQjqw0vt/O32o8q+vOEisHb9auJDWRTjoAiz+5w0tTvbDZ0IafisJcrQV+QglqQ5Hqp6MDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3079

On 08.09.2022 13:49, Rahul Singh wrote:
> is_memory_hole was implemented for x86 and not for ARM when introduced.
> Replace is_memory_hole call to pci_check_bar as function should check
> if device BAR is in defined memory range. Also, add an implementation
> for ARM which is required for PCI passthrough.
> 
> On x86, pci_check_bar will call is_memory_hole which will check if BAR
> is not overlapping with any memory region defined in the memory map.
> 
> On ARM, pci_check_bar will go through the host bridge ranges and check
> if the BAR is in the range of defined ranges.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Acked-by: Jan Beulich <jbeulich@suse.com> # x86, common

FTAOD: I object to this tagging, and I did not provide the ack with
such tags. Quoting docs/process/sending-patches.pandoc: "The
`Acked-by:` tag can only be given by a **maintainer** of the modified
code, and it only covers the code the maintainer is responsible for."
The doc provides for tagging here, yes, but such should only be used
for the unusual case of an ack restricted to less than what a
person's maintainership covers. Otherwise we'd end up seeing overly
many tagged acks. (Recall that tagged R-b is also expected to be the
exception, not the common case.)

Jan

