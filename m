Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD614557495
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 09:55:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354525.581672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Hga-0006a1-I9; Thu, 23 Jun 2022 07:55:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354525.581672; Thu, 23 Jun 2022 07:55:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Hga-0006XN-F5; Thu, 23 Jun 2022 07:55:32 +0000
Received: by outflank-mailman (input) for mailman id 354525;
 Thu, 23 Jun 2022 07:55:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRa/=W6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4HgY-0006XD-Mh
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 07:55:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2041.outbound.protection.outlook.com [40.107.21.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d973d83b-f2c9-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 09:55:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7949.eurprd04.prod.outlook.com (2603:10a6:102:cc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Thu, 23 Jun
 2022 07:55:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 07:55:27 +0000
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
X-Inumbo-ID: d973d83b-f2c9-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZAnf3Wtpq8OuIx/C3sxvcDcWKxGGaeQKKGhKwkbiMFz+GUnGFHjcFsTiXxHOzewSB/b+dteXvhOv3wisRqefYU461g/8Sdfb1yzroUCcHQcSnfziPWUlugoesCjGGemWqy5xUab0vS7BBlGzfeWhXXcwrtNPonW56ApJwGIrVkrJMyQINc2c8/K/vYrfzzAQK+3vve7t2TgoMHLNQpKbuNtFC8/P4g7lGjsG4hbvoPRQqsirbkWHA4vhz8vxna9sfdQL3WWMbeI0Wt2Uwg+J4oOaggV3MjgPJvcTyOZfUyKhbOgXmt6778ZBlEq5XEGDmUdi59Z3/Gatj3yX3ON3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Bo62bnXYwnaQMPoWppPDTRVPRld4i9FNVCzazkNfGo=;
 b=UBYlr1lpvcWjxYtTI7B+3G0Xi9z86aKIZ+PAjjTnucGV/felE4FbtiFL5KABR7Kq52+ONPdfmNaZpA2Kg0aR8OHl7x5CE/9Q7Svot4Otq74K09S54yQ9IKlnTmLRSBPKwZy8GALMAZTJS1FKHkFmmbQbFtiQdmEqvPk3X797HKT7JMoCjse1xxPmekwo3H27h/sALyrOjCS6FMF+aaBThkZIyfn2r78CG9zDkdEmwl/guGg4rkLc8kil2CvhD6gBjRcAQb6F2hWgMXo0oXp7EWMmUalgQYQwF0Qc/y6Md9o46l+NtajrdwjOp+gVtOFCCyI2eZgY40ZLfajNN/rMpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Bo62bnXYwnaQMPoWppPDTRVPRld4i9FNVCzazkNfGo=;
 b=ZolwweOKXZIA9UhyuV82ToIA9DJHPTnNEtgopvznd4zenGhhS6bDblaS0Zy4Fi2hAzmsvXSRCm4LLSqg+HeNHHQmRc03F74POIgbTdBNAdxK3gLN51WjQifu2hKGfqUEonfratXVrhhzahbh4+bWOe2MlSrUq+KpOmQG5bmjLT5RsAU+vr6Qsn+zL01qIdSSjs36bMi4svMrauQVK75foxRrlT/yWIFLsTwoXdJYtLKfVP6MCWfLq5n2HTO45TOUyWOqE/OOlvGHS/r8CGg39Nw6CxdFJwxI44y7xzjADmYpukknX3IwjAhoLCfJv2yCqgYzfXMQb02/N/ff+QpUAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <922ee651-c211-6e46-7986-6d0f74164e57@suse.com>
Date: Thu, 23 Jun 2022 09:55:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Problem loading linux 5.19 as PV dom0
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
References: <5c396832-3102-ff5b-c198-c037ee87d83f@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5c396832-3102-ff5b-c198-c037ee87d83f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0035.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1dc014ce-3e86-454a-af20-08da54edbc5f
X-MS-TrafficTypeDiagnostic: PA4PR04MB7949:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB7949D0822FEAACA02922590AB3B59@PA4PR04MB7949.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qeDgoj/7nDELIQCRYTLyN/r0RWg4lbUcDRFR9ZBDAwwNihwFwLfEdeDHfQGwaBDO844x96LVimZ3ZTAnQ+5LmXRxVdAj5Kq+92bjFrq5jovrMnjlrNRt6fGpNShFm4XCT6ZP898pYfJ/8T4mTfoXWhB5ZikntAdgTxPtR2unq4oVpHDdYWu5b/o+JV9FBiZOm1ydOgpIXsMyidPfl67yciAwmBv/WqUOQg56kOOGVIVFjl+rQuW2S6LOk1+R3v9Vkvprzh89UpmFiQHrROPfX1hDskaFXLihXf6N+zJX3gxQOI9ij7joDvfRAB4Md9r7TclSzPugXXAmdISHskAgid7HLy7CMW5jQTX4Ue/D0TLcceZsJbFy6hDpVLp4DUlnMbI1/O5tz7x6NVcndE4bL8aPVc0AO1hA+HIWb3LALvFi3P5LL502lEo9HQGphVwrrQeFqfXZ7/feZwZZTFohiDrEfIidtpXHLMbPYBYJdOL9KwFp8Cs5iUPgD4BbgNSh5TPKAcp0NJ2Qoqtjhsc0GtxgtA4+VA9Xb3m5OZ2RO8rUC/kbrqUODQB0XK48/vBKMR7fIAfnjCma4QHdl8Yp6AumzrMY7T26lO8mxORjMZXFSQgsRwnoXr5i+FHCpfbJfyq6shOwQeS5lf0zM6eoAj/FxJTsDl2LM8SGdW14Oe7BcOJPraMJGXZ3SzcQ4NvdMagGd5nTB0MVchsWauXEmttkz8dah/wCc7oh8RnTlT6wXS4tGcER9iuQZUVxguYPraY4gpsneVdBgmI9h1mKOeuqO7xifwTkenHx5ENwrf0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(346002)(396003)(136003)(376002)(86362001)(31696002)(8936002)(5660300002)(6862004)(66946007)(66556008)(6512007)(26005)(8676002)(2906002)(478600001)(4326008)(316002)(6636002)(186003)(37006003)(31686004)(41300700001)(36756003)(38100700002)(66476007)(2616005)(53546011)(6486002)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjFZTDNkWVVQQS8zaExENEQ2azA2cGRXVjB6VzVxcll5NHZoM3l1dVIrU2tx?=
 =?utf-8?B?dVdJcGV5bUFJQnNhUkNSdlhRUjhSNlAwK24rRVhMMDZsNXpDK0M0REVldmUr?=
 =?utf-8?B?OFdHNVNrRFR6TDJSYmZZTVFqQ0ZuYmtheUh4QTA3aGlCc1ROZXJzVUJOTHJl?=
 =?utf-8?B?S3d5TVExR1FraHJCaWhCeERhYlhBZmZOaVYxV2N5MWxsV2tkYlRjUXJ3ckJl?=
 =?utf-8?B?c01VKzFaQkFaa0RIR3hqbWoxZ3hWcGllS0VLclp4QjlRdWNYV2s1WGpQOHp1?=
 =?utf-8?B?THVzRllBUnVRN2xncXB0VG51Q2VydGdScGhjK0ovRFJJUm52dUM1bWgyNy9w?=
 =?utf-8?B?bldlYzltNmRINWJNQU0xMGFiNHJ1b25jdERMNWd3c3VvUHl5OWFQWFFyU1Nq?=
 =?utf-8?B?STlsNG5mbjlZcnJ2N3d2VzJ3YzBOU3Rwai9rRmRuR1VzVkJNbU5CLzk3R0ZB?=
 =?utf-8?B?Z014b0EwUkFScHZsNmpIZFNvUlNtOXhBU1kzZndEK0p3czQvdFRLNzRKcHBl?=
 =?utf-8?B?OFFJcllTOE5MUkZ3TTN3SkN6K0g5OS9pV3d0eXhJTmVxTnhkNThEUVFDWGVx?=
 =?utf-8?B?NS9vajRDcThLSTNVVSsxd3dZc2kvb3g5a3RKdTBpYWxOd1ZXdXB2VmRBV2w1?=
 =?utf-8?B?WGhwZkw3amt3bFZVcWlKUnpqbjhhM1ZOKytwRWdnZ3ZIMjVkaXJCQlV5WkNV?=
 =?utf-8?B?VlNtQlgvUnpmL1cyYzh4MFFYRVRXOVlkT2ZZMnVkL1EvUy8yR3NOZUtJYzZp?=
 =?utf-8?B?QWU0YUhUYWRyVlN0SytVaXVGRmwwZEcyTW9SNkZVSzV3NDd2eEswaW5QSGFx?=
 =?utf-8?B?Z0pjdUkzRk1EOFFBNHFLckRqUXBsWVNqcnFMOGhuMWxrdndpSnUvWEloWDlK?=
 =?utf-8?B?OHU4Ry9SeEw1QWRJQVduNFBoU1MwRU84MFJsNGNTcFdMK1ZNUzh3dlFuQjBK?=
 =?utf-8?B?c2ZOZ1F4MHVFM1I1NXFNc1R1OVFqRlNvZVQxcWFnUkZtd1R0MGhlYXpoZDNi?=
 =?utf-8?B?VytxelVuUjlvVUVkYUhhN0ZMK2RyUEpYaVZJYnZVdEJhVnFmcUtmUEN5VVNt?=
 =?utf-8?B?RjBYd0NPQjlpc0Z1SzcyVk9rZDNpcFdZb1Z2UkpwN00yWU5VcGl3bEZrSnhR?=
 =?utf-8?B?NkpRTHBFS09rNXFwVGEzb01yejRhV2NHWFZydFJTU0dNcWc1SDZRYzVyNFcz?=
 =?utf-8?B?RVpwejBiZkU0RUZJM05FQU1yMnVlVFdKOWlOZjcyYi9lc2xvZGFSUHY5MWdP?=
 =?utf-8?B?MFpVbUYxRDFRckdVZm8yR1pFSTljTC9mbldUU3AwQW80RkRVRDZZMG0rNVlp?=
 =?utf-8?B?cUJNTzRwSGt5SDJEWmE3MmMwdUtDQi9OZk9zYXNiZzFvNHRKdWJrUjV5ZWNW?=
 =?utf-8?B?WnZnYTRiMWRKNklpdG9jenVMeTZIS2dURHVDMVVSMHZBbGhYU0tkaGwvSW5R?=
 =?utf-8?B?V2ZRbGxjWENnR0ZsOHNYVGJEM1AzMjcyVXN3TXdIa1UvWDNSRHlXYXh1ZUN2?=
 =?utf-8?B?WFo3R29pNnFzL3kwaTZvQWxxclhqeVFuNDJsZ1VweVhpT1p2NXZSRklacEZj?=
 =?utf-8?B?Y2NudFJBcXF4WHgxdWl2ejU5L0tUU2pLc0c4Z3JFSEFyZFMwbXM4MStUTDhG?=
 =?utf-8?B?WWpibHVIajU2S3IvaWNkazFxU0h2cWVaNzhKZlRDMjRRa2pkc0FYaE1lVks2?=
 =?utf-8?B?VEg1L2U4Q2VhQlZBbGtBWWlkTHN6eE9PenFvQVJlMjhJZ0hCczNzbGh2SmRn?=
 =?utf-8?B?N0hUWVlNbTYyN21uVUxSZS9OOFQ4TjVhaTN6VGlEYnRTaWljNlhjc1dlUHlh?=
 =?utf-8?B?Y0dZaVJ4dS82aElIOUQyRWZjSHg1ZTRQRWs1bmNBalZYNldnSWp5c1g0OGlm?=
 =?utf-8?B?b1c2VlRFSEl1UEJwOUJkVUpydUxNa25sZGsveVBqeG0rNE1CLzhhdk1rcC9t?=
 =?utf-8?B?TDlUell3Q3ZGOHMrbkd1ck5hOHVaRTdZeCtuMmJiZUN0SzhCVVEwa1YzSTFs?=
 =?utf-8?B?TlRETCtTK2pXZXNpUlZjZURUSHROU2VpQnVqQ0NDMmxYVEE5anVzb01JcVAr?=
 =?utf-8?B?cW1Id0IwR2NoRnpzUlBSTE1uSnlBRHZrcS9HQkFaZ3Q5bllMeUVmMHIxL0dJ?=
 =?utf-8?Q?5Y0x/a4s9QtdW6QkEMSm0wfPV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc014ce-3e86-454a-af20-08da54edbc5f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 07:55:27.2434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uHzlVRPZmaNe8vQX08LxyVnIIZBeUgUHAwi3hH6rEmpdb4evwnYbaOz66Cjf6/fr07L2uqFFjco1Cdr2agiXeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7949

On 22.06.2022 18:06, Juergen Gross wrote:
> A Linux kernel 5.19 can only be loaded as dom0, if it has been
> built with CONFIG_AMD_MEM_ENCRYPT enabled. This is due to the
> fact that otherwise the (relevant) last section of the built
> kernel has the NOLOAD flag set (it is still marked with
> SHF_ALLOC).
> 
> I think at least the hypervisor needs to be changed to support
> this layout. Otherwise it will put the initial page tables for
> dom0 at the same position as this last section, leading to
> early crashes.

Isn't Xen using the bzImage header there, rather than any ELF
one? In which case it would matter how the NOLOAD section is
actually represented in that header. Can you provide a dump (or
binary representation) of both headers?

Jan

> A workaround in the kernel would be to always add a small
> section at the end which needs to be loaded (like is done
> with CONFIG_AMD_MEM_ENCRYPT set), but I don't think we can
> put this burden on all guests being capable to run in PV
> mode.
> 
> I haven't tested yet, whether unprivileged PV guests are
> affected, too.
> 
> 
> Juergen


