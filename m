Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DA766C412
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 16:36:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478810.742217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHRWv-0005Kj-Lj; Mon, 16 Jan 2023 15:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478810.742217; Mon, 16 Jan 2023 15:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHRWv-0005Ia-IW; Mon, 16 Jan 2023 15:36:13 +0000
Received: by outflank-mailman (input) for mailman id 478810;
 Mon, 16 Jan 2023 15:36:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SJiS=5N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pHRWt-0005IQ-PB
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 15:36:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2068.outbound.protection.outlook.com [40.107.22.68])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fc05366-95b3-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 16:36:09 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8275.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Mon, 16 Jan
 2023 15:36:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Mon, 16 Jan 2023
 15:36:07 +0000
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
X-Inumbo-ID: 7fc05366-95b3-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1AX1cTqKNkhwHZL7oHFI5HSmsQBgCfchiZRTsnR+1npqbuVUKBSVLv4FvYlp+W7W2w6CHixtmQk78vhAG2Zg5/BubjT1u1sk1pLjjn171MTRmCdyHgmlYMpVg2rBysHiIVgR7rYb2MD421kmWiFpXn8D0nSRj+2y3Mkbe86Je5QjpbhRRCgMB8J1S/IZwrka1UfxEi6Pn1O485TjfqpfVgRVrZXsqsy2W3E5sJSRVWHwXyWFm6ILNTHs8E4fCZDJvZHMRVxfESndFyJtzl5g22wKcIc/kcR0smwLOBoS6c7ehnNUJZDnzX6eMcCaqGykMHilys5QikcgIa+I2EHiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxdfyaGjzGOJkQF8K0bSOQVeSIu+/NEkdq2y1PSw86o=;
 b=HMEukcyZG3U1YyDdOBqEX1CuvD3vDUOkHrgDIT0jjoytjPrBm5gjgZ5b2MkhnT6NY6/vHKXVqhg+1XYkkpuL+za7AJa3Wu7TvxlVbCf84HyXKVdG3sSILJvk8RXCKfPaj16yug8uQm1NE/uUvaCNlc/rgoCv8/8CiCGdzgRe+hbTXawraPeDhzDmbOh9TYDq0sBl7ajLzEG8gq76wQac3Qzn48L6FsHzXYdi+uxtFwFtNeviMGqQOjwZ7dujNvjFyjAPhBKhiCADXzW0yIToRRkCJM31WNUyTADqNc7kf87ecNzr94PmDZdkZRQ3ubpFGsSkdogMi0015PWIxB+qCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxdfyaGjzGOJkQF8K0bSOQVeSIu+/NEkdq2y1PSw86o=;
 b=3XTEMdXFbn7BSZO+aMoeoRr5OeE9pqnAX8MGIHvQcZM6GfhV6mn8I4RX23bNpyDOQpR92dwJb6++AJuMf72oeUDpVBL30GPuvo6bqMYKjjYMSuhy2m72v8PXCIDmX8p1s1MKvoXZjsV6wADi+3ETgfqyxuwruKptYoScQZ0sH6X2yFJcNN8HgRM7+nXcbcx3jhXSqRBB+1Ncerp1HnP+4ED9wWEzFqCtSbn73oro4+vGdWL6bTT5YdTbEVuEYWBXAMuFDd8VtHtUQFxcN2FwD30Pkg7XyvUYSQdnMChNou3yuGTN4jR+/wuuLTqkhbs0ka1qWdBpfbHgtiDe/Ual9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3920b910-35a2-f806-dfa5-eaf44475f83a@suse.com>
Date: Mon, 16 Jan 2023 16:36:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/5] xen/version: Drop bogus return values for
 XENVER_platform_parameters
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230113230835.29356-1-andrew.cooper3@citrix.com>
 <20230113230835.29356-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230113230835.29356-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: e19de267-516c-4487-8b07-08daf7d762eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IbMj0hoxr9IgceQwtL4QchC22ER8gjbIWI7MGqakiM/Cpe8AVNpNPVpFxoTzb1Furgo5u4LQHiAdThaxYzWdx1wjir3fYc33G+1XYpr8ttjFJjPK7lgmFSpNyjM9u+nOieEswDiGUR9UCfo6ubBDcSnPv3SjpR6mCNKuLi+BrzpKsWlhS0jU4utBaoqLc2PeAgTiVH59SiTNef0WydWUORDUsUB65W6+1QHKrEq84NnI2Tle2v02SUaUhkgqKiiR3cZKPlo5sTlV86vAdgguOQqM6QL4qkXq/IukWwfavPk1bQc2mGEB3SwitxR/1NUGduB2q9t1pUvSFRAXlKBZ8VdTe0ZA6Cw4xZFis38O9xBStutWDw2bSETxQCKnrvb8n/fOrX7t071UkEu/ET2Lgy3cctQAmuvsdQBpJRrgUAlhQEr2HYK+Q2Yw69Fd1go8mau1Jl59VoSLUyEgFFZ400ldoREmwsMJBmlYgiDiVLW1ePZTuNXxw++DIZyqDK3IgoHG4i+ITGmfkA275uh+V+Vu6LExSkV6U80EW8GAIjtzxrSezFW7dWYcVNe8Dm5bdVDyZBtbzlEFSgBe2vDUSZf0ynGnrF+2yCTtxJPFblfAqXjQFwrUnB9chG/zAcg/AQmHkxY7lG4Seor013bREzcObIddz+pediqxQoYwSsq6eIlyNHbCnEcDSLK/jLPhHeEtXacSb8huLyF2kA133ADv2MnCOpCeK8Olq0EXfrE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(346002)(136003)(366004)(376002)(451199015)(186003)(54906003)(2906002)(26005)(6486002)(6512007)(66476007)(66556008)(66946007)(4326008)(478600001)(6916009)(8676002)(31696002)(41300700001)(86362001)(2616005)(316002)(4744005)(36756003)(8936002)(38100700002)(5660300002)(53546011)(31686004)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnpqaWJuMXdhbldXWHBkcmFxS2loT2xqeFY1cTlieWlJUk02bEp6MzdGK01G?=
 =?utf-8?B?R05SZWJjK2oyL0ZwRmVRWlFuaVFqZm5xUWNXV2tyMlBEMFFycnpuOGJkRGdM?=
 =?utf-8?B?eGpDdVYrRElTby9uQVlNT2FVbkJtWVNYYStiMkE4clN3ZEdFTXVpTGo0UUp1?=
 =?utf-8?B?QlB5UWhaUEp0M21JUEVkM2UyckJIbXhPSTlqSjgyN0FlRkljSUJhTnFpZW9O?=
 =?utf-8?B?d3pBcC9scVV1a29iS3RrODY3aUxWc3p1L1dDVmFGcEhFY01JTlQ1TFFSZnV6?=
 =?utf-8?B?VWdMQk10dGxEYkQ3QlArK2hjOUJCRVpHZjl5cU0rdWFrNHZteTdtREVlYUdN?=
 =?utf-8?B?RCtURTNQamZtMXNSU21td1RoR2NoeWNSWWZpN3RCa2phaFBkdk41N2FabTM5?=
 =?utf-8?B?UlphTlBnRnMrNDN5ZklsTG5rOTFmaEo1YTV4N3c4b0FNU1gwYmdSWGNTVlVs?=
 =?utf-8?B?M2xFNjVPVFZ3dk9BUjFFcHpXcTI1eWcxcGt6aXd6c201VW1EcmsyeEgrOTl1?=
 =?utf-8?B?UFQwTm90T0VKVi9Ed21aVVQ4WE54RTdHY1Iwb0RDVE5IOGswbjg5UnQ4REdE?=
 =?utf-8?B?bkRXVDhwZ2ZhN2xKdFdLU2hkTUh0TFRVT0w1bVY5M1UyWW1xVUhGVzUxdWZX?=
 =?utf-8?B?MkQ2NllJUFJOVDJuZDZGRnBNbkNQZmIzMG9peFJUZ2VMZ0VzSjVycmk5ZEh4?=
 =?utf-8?B?UzlqcVFoT3RwNlU4RHZaSFVLNlp0bmZDMWVnd3ljQ0I5eXhBYUlmUXFSc0x3?=
 =?utf-8?B?am4yUXFEWGV3NkFhSDQ1OGtoYkI4Q1VRVVh4eDFUUndFNTM5T3JCa3F0ZXlK?=
 =?utf-8?B?Vk1mYndTaktXUTF6RmZqWXRzazRBV0VWazJsdjJMbnNCNkpuR0JncnFyNTB2?=
 =?utf-8?B?Zmh0bHlSOE9BQ1M0SlhyWEwrRVFwV0IxSXN1MVd0ZDBUUmFyWm1pTUZHc3Zq?=
 =?utf-8?B?bXYzUit5azIrRTJsSmpaeFc5ckxpaStkTjdud1dUU1pJQTJmV0krRmJrblhY?=
 =?utf-8?B?NFd1bk12eDE2QkpWbWFZR0E0cDg3UXV6Vm1vcGoxWkN4NVlwWnM4bFdmK29T?=
 =?utf-8?B?TXNTdGNMOFZEM0xmQmVZSWtlQXdqVFFkb285QTZUQ0tMYXFiNXN3elptK0xB?=
 =?utf-8?B?ZmdqMGNVYkZrZXdVdWpEYWJOc1BXTEUyKzBxaGFYRE5BTUI5dDZKdjByV0lo?=
 =?utf-8?B?blFiUHFEWWloL0RyRk5MUVhXS3FRRVN1OTM2RWpGdkxYWnJhMElVQ21Zdk8z?=
 =?utf-8?B?c3JaVzB4YzFvRzRJYVIzSEZnWW9vdzhla0UxQWdUY3FscUNQMytlN0VBQWd4?=
 =?utf-8?B?VlNCc3NibENCV281RDlERW9FbHBPYUtIRHR4WUxXVjJ4T3haK1lMOHhmM2xt?=
 =?utf-8?B?RHJab1U0Ti9PQXV5RVQ5b05JNTltazc0cVoyYktVL0xUWVFLTlRGeHFVUzd1?=
 =?utf-8?B?KzZra0hOczhacFFNcmZ1cDFJMDREMGFjYWNESE1KN2NYWS9KUUFxYkl4RUdY?=
 =?utf-8?B?UHZZSnVmbjJNOFpSVUtiRjRzaVVEck4wVlIzYVQyRVZVS3h3bE5wRHZleGtG?=
 =?utf-8?B?TUJUcHRNSjB4K3JDaVBSYVVLWFNMS1dJSGFydHVib0hGRXVFYlJ0WFZTMlUr?=
 =?utf-8?B?RHRXNGhNRVdRZ0xhODNVZk1aYWwwZGRXaVJOVWM5K2FIdFAyMkRFaU92WWk0?=
 =?utf-8?B?TjBBODNpWmhRKzBoWmlzeHFLYVVsL2V1STM5NlJhRUs2d0NkbW9zTE9ST2gw?=
 =?utf-8?B?UmtNdGc4MkoyUlUzTTZWZzRIaHRtV25aeFlnMmtFc0xuUTFYVU1meTZRYWkz?=
 =?utf-8?B?MTc2QjlhN3RHa0oxMXhtQncvTVFab2FLK05HR0ZWcTFZU2IyM1FwcnpQQkJF?=
 =?utf-8?B?YXNFMUVyeWhFQy8wcStoUVNtMlBMb0h4eXVJREEyczBZdWZvWlZsSzZBZDVx?=
 =?utf-8?B?ZzN1czNINHJXblJFSUQ5QmpJdE9LTUdlZ21tZEFSUldOczA1eVloa01xQmIy?=
 =?utf-8?B?ZHJFRDgrVFpsVFNwNkRVbnF6eWcvM0MrOEZUKzZkNWRqdDZYMVBtRm1OOTJD?=
 =?utf-8?B?NUdDVml0UU1KL1pJRDlKalQ1TDN5dkpXOVl0WXB4MHpPT2pYRWJMOUIxNU13?=
 =?utf-8?Q?/ZxOuloxOCpX2VeQObnq0zyUp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e19de267-516c-4487-8b07-08daf7d762eb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 15:36:07.7854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yhV2m7UhAcRdrUdXoEzXGXI8EG298nPQCmghagOyXQ3taL+pj5rxA3nLiv8l15n+y+3eHZJv4XE1joYPtFRJPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8275

On 14.01.2023 00:08, Andrew Cooper wrote:
> A split in virtual address space is only applicable for x86 PV guests.
> Furthermore, the information returned for x86 64bit PV guests is wrong.
> 
> Explain the problem in version.h, stating the other information that PV guests
> need to know.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> The only reason this does not get an XSA is because Xen does not have any form
> of KALSR.

I continue to question this. I think I did say before that even with KASLR Xen
would need to constrain itself to the 16 L4 slots that the ABI reserves for
its purpose. And nothing is being returned about the inner structure of that
virtual address range.

Jan

