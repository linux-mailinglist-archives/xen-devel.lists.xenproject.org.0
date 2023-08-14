Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8041177B1C9
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 08:45:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583191.913259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVRJf-0002KO-3t; Mon, 14 Aug 2023 06:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583191.913259; Mon, 14 Aug 2023 06:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVRJf-0002Hn-17; Mon, 14 Aug 2023 06:44:39 +0000
Received: by outflank-mailman (input) for mailman id 583191;
 Mon, 14 Aug 2023 06:44:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q53I=D7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qVRJd-0002Hf-2l
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 06:44:37 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe02::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 081a893d-3a6e-11ee-b288-6b7b168915f2;
 Mon, 14 Aug 2023 08:44:35 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9178.eurprd04.prod.outlook.com (2603:10a6:10:2f5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 06:44:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 06:44:33 +0000
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
X-Inumbo-ID: 081a893d-3a6e-11ee-b288-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D5Eo8G/fl/B4uwCKYEwkF+H5IjSn22zTaF24hICrp8jzNk3Fw4kMTu/BwpHPuWTJp/hrC347OGLT7qoZ4bhoB1zIbbRyPVKnXMsntaqIwZ6EK2EDmwWkGqNpR1uNaeWuRF9bW+A7hvOfb4GAsbsfbVk1Is52XzS+BM3DXuDW9vVWCK4cB2N1uACGK3KZSIcWU62v2rYY7KXaZuIzur2kyDKwqXogOf/ZU/gaotDSTqEtgh03ihNPim7fLhx8UQSolFNX2CM38XifD+O8Z20YqNbdR0fqfwqLsbgDOIOSNsgPkckmBb7pwRJAR5MhiB/rj7DhxYZQIWjj6H6eU/Zzdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JmztOBmdaISWMnJO/1SPl2bcLligfuvd0lOQEiLCnHM=;
 b=DnCwsXH+amwka50Rzn8Hw35b6hPN15jldcivCKtI85fxgcvNiHHjRJF3lCefHbslY2sAIzJH/qWr/uRobuaT7FlYy9JWJjSvi+GFjTqqIE6avH4eyCEJ6PZ6xD+jo7eX5b16QCVwOJw/ifl9pttRibJgHwDwJ+iamsEhNzlrojI5tpTNFBUMuYFKFksaZH97nmASuZV+qhSYoUbSYzfaPrAMw3ZS1d5CFmXov7+z42Ct927spoqp1lIGcCA1SfC4A+8tPMPyndnLcii2DO9fR+qfWyiOuI/WeNP8hsq+ZBGPRy7fmsqHfna9/h4R9Mtx1892MECn6na22VUJFoi42g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JmztOBmdaISWMnJO/1SPl2bcLligfuvd0lOQEiLCnHM=;
 b=FsO/r1Q5tv3guh2cwPF5k319YADdbGyUol7E88ybCxxWFd/TlszxpurioiByp8ohPfS18SGjyLyc2NnTviTzWi2KPiZJD+AMaVqd+BpYnJbq9AfQiKpx9EZu8uKwOk7UIYntC3qVa4uWyBRhkxP1bwzRxwpEc/tsdRtgQV8xTxzM2wN2C19thA9mem4syPcDf55XQxC5wgfBpvdMtBQ9keGwtQMDiUNPndzSnQyDvC2iidpWmjaB9VWSoKQqObzOM1Y6Xi6tfX7uWiX0gv+aasslk1fgem/zJWno4qRLGvPsNKK3XUhY18mtdE/INU2b/nxskWdRiBLFV8izajWIHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9d86f0fa-fece-fccd-aafc-9d14008b146c@suse.com>
Date: Mon, 14 Aug 2023 08:44:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 3/5] x86: allow Kconfig control over psABI level
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <10ce72fb-4fb7-67de-41ec-7291dbac0038@suse.com>
 <3c819879-d113-facd-b025-b062e68bb6a1@suse.com>
 <810a0e2b-0cb4-4b48-ad3f-dff323efd20c@perard>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <810a0e2b-0cb4-4b48-ad3f-dff323efd20c@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9178:EE_
X-MS-Office365-Filtering-Correlation-Id: b607e4ba-6201-4343-93e1-08db9c91eaeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dz3G+2Wss6NG0FImCx9oaiPV5eHUYyS8tBtcSydrqB5va+BhRhNQImwHcvA7Tcciunc7yFl7+3UWI+KUaINJ6Or+9ciEiMQT29YXfWlw4sWZkr5usQE1dwAtWtL0ZjhR+Ta0pSoGVyxYpaiMmgKekYye+J5ORF0X+RVZOPhjEMzy+fIPGdblsmMoDwHjgAFWBd863dioAWz+wk4Q3GSMglOXQmUEs31xSmtZgS0+f8x0HPdBaCWwJb+YkoGd+EFh6L86buSQTeNIR7uaShvzWuxnH3IsVtF2Dr9HDF7tyo3xw/GoA/9JdA1Tk71eirft4eLSZPWc0rlI59FPut++Rp9FbPE7goFyO7zmZ8NoecTAcvc+2enBMD/WBWfCCLlum6nlbO6v7JcwyS5orBzCe3+b8F8oyM3CnAOtjGMRw1NY1bFYG6AhZrW1UDUbbu40zuNFF9h7ECfq4sR8MHNBMwvEADZjW/9mCHDzX2Vyiz7P2wWLvz8cWhQv/1PmCwcCI6zj+FM7mBq2Ii3XIitdXFDKVN5wBIzmxC/xswGHV5R4bFFhD4LzlewcQ23V66+5whvDCaMdmlXENVNdPQuw3Ek8/ACnd0aJ2oKiPxnHkQJrJrQP/5qkGKd/7RQpmbiQqHkEOxjsnhEIJkXB4VqY+g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(376002)(346002)(366004)(396003)(136003)(451199021)(186006)(1800799006)(31686004)(53546011)(6486002)(6506007)(6512007)(36756003)(31696002)(38100700002)(86362001)(83380400001)(2616005)(26005)(2906002)(478600001)(5660300002)(66946007)(66476007)(8936002)(8676002)(4326008)(54906003)(41300700001)(66556008)(316002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3c4bFVpUzF0THhSMjExM1B2eDV1MXhHTmhZWm1FK0o3SFFvamRGVzZSQk15?=
 =?utf-8?B?UXlXWUxiRTlVbEMyV1hYaHkxM1dwVUdnQkpXYmV1TWRrMDk4NmtZZmdGdzUv?=
 =?utf-8?B?enp1M2ZoV1VrcUpSY2hNdTR5RkJjaXVXQk9MN01LODFKaDBHZm1UZ3hVWC9P?=
 =?utf-8?B?MWRlL3Q1bWgxQkFhaUJkSGZ6eFVUeVAxTDhYczlHMWtqQVJQYUhqZjF5QXlk?=
 =?utf-8?B?WUNmeUlad2QyZmlKOWR5bHVPdzFGSnd1b2VQbTlNeTlqNDZtYVR3dE5RMEw0?=
 =?utf-8?B?SWh6djQ2aWRvUHRYc0VNNTJsWUVkVDdoN3ROdVNIRjNWZ3JmYnk1aVlmbVIr?=
 =?utf-8?B?dWZoMC9EUHNLSjUzVGpCTzlrUTgxTHdFYTNwRVQwQWxwR2tZZlBXRXJ6TFgr?=
 =?utf-8?B?UEJ2eW90eWpjS2Z5MUs4UHN0UW1vU0dRRFhtem4yc3oyZXl2WEdjTjlRayt3?=
 =?utf-8?B?STJnVGlnQXFLNkxiMnB2eGpWK29sSU9kZjRWMHhDdmcyUU84UmRBTjh3MElo?=
 =?utf-8?B?OU5VajJoalFJeXB5SG84MXJZdHhTaHNmNlNTTFV2UlFFRzBWRkQ1NEw5VzRL?=
 =?utf-8?B?U2IrTTRXbllKYThTRGpxbEpHMjllV3FzZVZPcHJtTGN3bWYzUVZBMmRsRjh3?=
 =?utf-8?B?dEEzZGhwenhUQ3cxbi96TzlTU0dsK0wzNk4yb3dIbEtueC9DdGxZM1NyQ2dw?=
 =?utf-8?B?bVdDVUt1Tko2dU9YeVR5NnNuV0dxUFI5VENRQkRTeVpEQVhYcGo2bmIwSm8v?=
 =?utf-8?B?QWlzSWtMZDB1eS8rYm9zUU9SenpxY1g4RXJoWlkwZktqM2I5Qk1kSS9rOVc2?=
 =?utf-8?B?UWhlR2QycE9oa09xTUc3VThXVW9KT2pvSHdCSWV5VnVXSnordVdzcHJvU3o4?=
 =?utf-8?B?cUZCVGRQdTA5MGJkSHp0OEV2blFHWXVxN2JGTDNFR0cvK2c3Zjg5b29oWU5T?=
 =?utf-8?B?bDdYOUJjZXRrQjdMOURHejNDdU1qNEZuVlUrTlNrRHhlNW14dUdDWnErSVpI?=
 =?utf-8?B?bklqQWRWdmNmSWRvWXVQQlgwM3ZpV1ZZenF3Wms2YmluemZqcmRsTDFNb2xy?=
 =?utf-8?B?TDhpYnBlQmhNQVJ0WDlxREVvVUhUQzltNUtvaHp6MFBNVFdNY1dXK0JZWUNH?=
 =?utf-8?B?Sm5nOGxuTVBJd1pTVHVYMDhjRG1OT1NUOFY1OGMyZjZVc004RTR4cTVwSmZG?=
 =?utf-8?B?OHBIeHo1SXlPSlB3WW9pUzB6MDlVWko0K2o2TU5yTGtNMWVrdmFzdnFuVTAv?=
 =?utf-8?B?MTA1UFdHQkxmbWQzM2I3MHRYWUxpS3BCUUs5SnNheGNrSEFISkJEeTFmbGlP?=
 =?utf-8?B?TmRoTzZERWkyTFN6QXRZc25SSUpmKzZQUU1ZZ2FMdkhVOWtIV1ZWVGNlZUZ4?=
 =?utf-8?B?UUNIa2pLSUVBYjJDME9tMTZJMEJpNlhseTluRnZISEVNL3hxNTZnVklxdFgy?=
 =?utf-8?B?bXQxWHg4R3pqSU5BeHVReklTWTZ5R2JiVDBIQkRXZUdTQXYvdjBua1NkbW9w?=
 =?utf-8?B?UWtpc2tZc1NFV0RKRnBuRXUvQ2FMaVNVa0dIUC9RU0pobnBPeitzNkl6bU9a?=
 =?utf-8?B?emk3OUVBVTFoakVPVEVsdjkzMmlwdjJEMkZVSWZORCt6U0lId3RYUTNMTHBi?=
 =?utf-8?B?NldNdWVjYTdMb1loOXhRQVhWeXN5L0J1Vmd4c1ZWelY0bzRJc2FjclY2YjZu?=
 =?utf-8?B?S0R1L3prZ0p0czA3T2o5WUN2TVBDd0RSWHVac3ZmWUxEaVltVU5ndkx1TUtp?=
 =?utf-8?B?dmxHbkJITHR0ZTc4VHV2aFdvSlJ4K3I3OFhUL0oxaU93UGY2VHl2ZW1IWGNC?=
 =?utf-8?B?a1dLakltUVNSS2hLVHRYUGRNV21iZllMOFI1dS83TEpLWGNOSnRhNWllc0NB?=
 =?utf-8?B?WUdpYm0yUEtCYzMzY0VBSlJORlJjS0VreWNqTVdoSWVlSHI3Y0NadzBVWUls?=
 =?utf-8?B?Ni9jK0Y1UWhaZXFkS3BDV041bnc3ZHJYbE03em4vU3BqUVFJa1hOZ0FwS2Fv?=
 =?utf-8?B?M2pwWG1ZSVBWWmdlSXJUVXE2VGdQYVMwbnIzUkFiRlprR1M3UzIyL0R0c2VS?=
 =?utf-8?B?djRDUkVLMXZnK25wa2dsdnF5eS9OVHhPMkkrd0d1ZDFrSUpHaVRUNTJDQUxY?=
 =?utf-8?Q?otv2yu11Ao8oVf3SZBk3jlBps?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b607e4ba-6201-4343-93e1-08db9c91eaeb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 06:44:32.9805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z4fIDRR64zo7YlLa8Sc+hM4lkUMhMyL6KrBG5xHiXfus4m94FmThwgw0pXeEwQnh7U/YBDS0fuYGnXCJl+0wRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9178

On 11.08.2023 16:59, Anthony PERARD wrote:
> On Wed, Jul 26, 2023 at 12:34:15PM +0200, Jan Beulich wrote:
>> --- a/xen/arch/x86/arch.mk
>> +++ b/xen/arch/x86/arch.mk
>> @@ -36,6 +36,29 @@ CFLAGS += -mno-red-zone -fpic
>>  # the SSE setup for variadic function calls.
>>  CFLAGS += -mno-mmx -mno-sse $(call cc-option,$(CC),-mskip-rax-setup)
>>  
>> +# Enable the selected baseline ABI, if supported by the compiler.
>> +x86-64-$(CONFIG_X86_64_BASELINE) :=
>> +x86-64-$(CONFIG_X86_64_V2) := x86-64-v2
>> +x86-64-$(CONFIG_X86_64_V3) := x86-64-v3
>> +
>> +ifneq ($(x86-64-y),)
>> +CFLAGS-psabi := $(call cc-option,$(CC),-march=$(x86-64-y))
>> +
>> +ifeq ($(CFLAGS-psabi),)
>> +# Fall back to using the subset of -m... options that are of interest.
>> +x86-64-v2 := -mpopcnt -mcx16
>> +x86-64-v3 := $(x86-64-v2) -mbmi -mbmi2 -mlzcnt -mmovbe -mxsave
>> +$(call cc-options-add,CFLAGS-psabi,CC,$($(x86-64-y)))
>> +
>> +ifneq ($(strip $(CFLAGS-psabi)),$($(x86-64-y)))
>> +$(warning Options not recognized by $(CC): $(filter-out $(CFLAGS-psabi),$($(x86-64-y))))
>> +XEN_CONFIG_UNSATISFIED += X86_64_Vn
> 
> I think I understand Andrew's point on the previous version of this
> patch. Here, we barely just print a warning if the compiler isn't
> capable to do what we ask, then do the build and maybe print something
> after the fact. So we can end up with a build of Xen with an embedded
> .config which says X86_64_V3 where in fact it's only a build with the
> baseline ABI.

Which isn't really a problem, is it? Even if passed the respective
option, the compiler may equally choose to use none of the thus
available insns. (It won't typically, but it still could.)

> Can't we just fail the build right here instead?

Whether to do so is not the user's choice (see patch 2). See also
both post-commit-message remarks there.

> I don't see any need to let Kconfig know if the compiler can do
> x86-64-vX or not, beside only presenting actual available options in
> `make *config`, and it would override options selected by editing
> .config directly.

I'm afraid I don't understand what you're suggesting here that I do
differently.

Jan

