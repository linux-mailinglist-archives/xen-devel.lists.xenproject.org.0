Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 274E564020F
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 09:27:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451529.709287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p11NT-0000Mw-Bi; Fri, 02 Dec 2022 08:26:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451529.709287; Fri, 02 Dec 2022 08:26:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p11NT-0000KY-8w; Fri, 02 Dec 2022 08:26:35 +0000
Received: by outflank-mailman (input) for mailman id 451529;
 Fri, 02 Dec 2022 08:26:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JFaq=4A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p11NQ-0000KS-Vl
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 08:26:33 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 049036d9-721b-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 09:26:29 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6941.eurprd04.prod.outlook.com (2603:10a6:803:12e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Fri, 2 Dec
 2022 08:26:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 08:26:27 +0000
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
X-Inumbo-ID: 049036d9-721b-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJjJxxmE9CdeLp7uACAaPXkwJ+qXoM4fERSqbY9Rhf5UwEOGZqMzVKA5W/hGqzD7mSPTpY8z0of15c+R8O7kkwUNjaqJrrd76bvi6h5+07S2lpxoEWONKE071s4tb8qh7/HBz7cnS5NHh7CfOEMw7ex4HaTCRDMGEq+BBfT9+iW3NTGCuK59nMGUu0eDLXx8O6c4a+2ZUTfOp66FiRZDTDJNF0F1Bpu/YwVK4Ibh88k8Gw5xXWwHd+gAVagaFVdgsRtVLoEBzf6o1ybsSHUB9wT490HfJo/eT2qiruKkTfGTWzzp4USRLzhKq612SRDFz7l+xJesjs+RFVv7489E9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6SRkuwGP7lpuSV2RyWEDI58DW+gF/ch0NtfoWqWS6A=;
 b=iKfKwOiqKA7J62595axq04qpnQ3MkjAIMaQq4LA51g4d4VGXdPPSf11JQ1aMCZVDjt/YwcNm1vzVb5BoSlJtuPauvD/VZWNXSytLDtIJEUeBgcnbsK/2mcE2ao315EU9/Q4mmhXeRnmsbQSYJ3acZQOwK4socGdFlREnjHGY6OoWD3Ee4GcBigP8Ue18fnuAoF5PajgmcWIvUuRkpwlJLIfLZ6TMAPPLQE0Uyvu0GkRdOeTOlkuoRObe0tHsH4FASFp9EYA6L+auZKzUFljoQWuHbO02uHVZvGI497QV2nXq/WbhtQTao/+yJHGbM5IdYoCr9qRqrKcVgSdcgwe9PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6SRkuwGP7lpuSV2RyWEDI58DW+gF/ch0NtfoWqWS6A=;
 b=vsX7jAbTWw7VghoZR4/Fw+9dw0VeqvOzXGv6nI43w7BJb6SJSKohkaTjCOMCKiGlQuuTh38jJo2Kvx4LiKCMhP0fBDZEmuR/binwb9XrA2+WZE/sWvcc9qC0vn25bSEwOK86/z3QhMLs9KStEmmJbMexgXNcmR6QFgmfQsbLKztJ1Tu0OlrzHSS+wgedqRcai/waWJd7Z1iHHiznX4RFBppeRsiY/3YeOoTM+FO+QxGVbkPjA85zBAgNba95pSehU096WsJZhAS72jkAYgU6zDDuZZMDAc3mpF00sOOPYvmZwRItyryjPRvKYKVsT8GI+uHmVTQK+n13ltQreSnNcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d628796e-3b42-5d50-f8cc-039743d23057@suse.com>
Date: Fri, 2 Dec 2022 09:26:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: preparations for 4.16.3
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <2c4c605e-f8c5-abbb-db85-89465b7e10a6@suse.com>
 <7aeec9a0-628f-d1bd-994d-343ab7f8b85f@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7aeec9a0-628f-d1bd-994d-343ab7f8b85f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6941:EE_
X-MS-Office365-Filtering-Correlation-Id: 59c8c636-0c9d-4cd0-f8fc-08dad43ee754
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NjD8HcrZwbagjnLT5q9lJNEvkFAt66shKf+mcIN1ZAmBr2M79Z20mM5tjsTtIOffRisBS0yI3dNCrJAc/s0bt5HuxQG9EwnEHgnTCQc7VEq2/x/AMNNrZVPgXzttx7bA7zLJq+GQy2Py7ixhjtDSx8KMVPGMhVPD3aN2ctSjp6IcDNzQf4bv1eTspdgrqk67ZHtWys4nbZZnL3vl87QdAQvNtVzRU0d1sLcc1hTcN7RBPpqAuA15af7w8KGVFqEjJpdUAzW78uOcqCPAbX6QKZ3+ymkfYPvo6Yc3IbvYt24zKd4L9f5HmbDjqC3SOlSIMqvLx6T/jFd4uPJBOwoUf8RnjzCAvlZo7b3CgpKlUeIVANSY+rWnN6s3q88Ozu5lz0np2bjuGlUlzuV3IRn0s8HEELdv/PatVkk5O3P+4uonwfIIaMjhx2E0k03QobzsrNncT0sORF7rXhINptyprk+E7MvhifhVZ6FuvPG1BOURLWcksxvXcL3erWg6IclnUyi5YSYGMtXoAD0oglw5g4fZZjScr88uLonUWMdJlLFfb6e8s/wgY2tJ5kbPKeMNGO980UfBz1+eiKtRBrvMNsHJtND0ZYydbkxBIjOVx9w9lmxtxI8NNLkZ9YPgKMCfDYOTk9lipj1hNWfAcDN20ghZbsX3oYGzinDb+Aqy8e9kUsvXuYsf0VarxHjFHF5UD4ZFeD7EOGC1zlBdx8rjeABbbKBB5MRLphXaGWe2A5U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(376002)(39860400002)(136003)(346002)(451199015)(31696002)(4326008)(41300700001)(186003)(316002)(66946007)(8676002)(2616005)(31686004)(53546011)(6512007)(6486002)(6506007)(6916009)(66556008)(6666004)(478600001)(86362001)(7116003)(4744005)(8936002)(38100700002)(26005)(2906002)(83380400001)(5660300002)(66476007)(66899015)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlhMRWMvV1NTb0FiSVlOaklFTWZvbjkwSU9SVzkyd3dydmVFcDgvVUYybnlS?=
 =?utf-8?B?YWFGOTZLRmN5ZWZvQmFTUjZyQlFJUmJ6cW5zcXJCWk55TUVOdlA2bWszUTNS?=
 =?utf-8?B?QWJTeGVEYmxuaDdlcVBDOEpmN0h3MUVDU3BaQ0dhV1ZhbnNGVy9qTGFVOUJq?=
 =?utf-8?B?ZVB6QUJsT1F2ME53NHcremxIUzVPZU80NHpVdkw3QklMS05iaU9ENXlsdDhk?=
 =?utf-8?B?R3c5SEFNZUt2RDEzZjdNUTNTSFNHMWgxMjJFWldaOXM4bVpLVis2ZzRkMi94?=
 =?utf-8?B?bG8ydVljcVZrdUFVWUxuV3hmbTBiaXAxYWYveGp4aEErVnplNDFPMENoa0l3?=
 =?utf-8?B?emxiNjRuS0cyWS9Kb0VaWXgyOWczcXBwZ1BGWThmK3VVZ2ljV21aY3p5Y0ww?=
 =?utf-8?B?R2t6Y1BOWjdvY1VZaE1ZLytqMnZIdklWU2R3YnpsU091WElBcE1YYWJCTVdm?=
 =?utf-8?B?djZMdlhYeVV0UVRXeVFTRGpTVUNyeVFCVnk0OFJUUXpRM3Vra3FUQUtLTkNT?=
 =?utf-8?B?TDQ5YTFHSjNtMmFaUS8xUFlOUk9UV3Q3MGxwTE5oOXFmcFBlYW1KaVpncmUy?=
 =?utf-8?B?SmQra1FvcW1waHpUTVNNYnZZSTZoWmd3K3RibGl6SURRZmpYUG9jU0RwTnJK?=
 =?utf-8?B?TUVXNWdBTGhjK0F0OFVlVWxNa2FyS3NaN09vc1V6U0piL0VKVGxyd2dDdHRD?=
 =?utf-8?B?Vk1BUGw3NGFqcnVSbDJwd2c0dEVPSjRIb3N2SWl0dXZVV0tyQ2t3Mi9XaEZ1?=
 =?utf-8?B?T3BoNVVXanNDU0EvcCtnbWdpMG13SFY4S0UrbTVTcU9zY2k5NXNjMEphRE9v?=
 =?utf-8?B?bVlOWDY2MXg2bEJtd1h5L2dNWkJUK09waFdjQk9TQkNpYnhRNWRYTWJ4RGdO?=
 =?utf-8?B?UjAzVmkveUd6RitHYWMweEZDM3ExNWlTY3JSL2ViejcxWGVneW5xRGhBUkpz?=
 =?utf-8?B?Rm5TTm5TQTc1b1NCKytlR0kxczA3alFZR1BpSkQxUFN0ZmNhNy9IUzhEaEpO?=
 =?utf-8?B?UEdPQ2hOVlc2RFBMbmk4NUVhcWFhcmwzZzFHbE5DK05TRFhDWGlMbWhIVnlv?=
 =?utf-8?B?Z3drd3FjUkhEaE1FQTVtT250eW1CTUEwMC94MHZYMzJtUGxvd1VFd2ZNbzVL?=
 =?utf-8?B?dXovZ0FyUmY2M2VnbnFpUHVHUlpocmRyd2pKTm55YjhpS04wZ1BBMDd5di9m?=
 =?utf-8?B?OGxyMUpRVWovWVhUNEh3SjRrU3ExZG0yQ1A5RS82YkhYS1p1QXczbXVRNG9z?=
 =?utf-8?B?aU8xWTF3clkwTWN4VjZpMWlnK01VVHNsV3VlMmxRenRjc09zZkY1LzF3QkJk?=
 =?utf-8?B?TGZ5ZmtMTG9IdkJzMGhZWG91OXpzNE40MUdmbDgvUkdIcUZNL0t0c0ZwTFI2?=
 =?utf-8?B?UTBrT1JXMnY0SW56ZU1DUWRkZ2xqQU9uN3Nxc0NmWENHSXB3V0xqRWxKTDhh?=
 =?utf-8?B?WWhMcGMrbHZtdFVobmZWSjRlU0tKTXdsOGgvY09yaTRvRXBkSUc1ajY0WlJj?=
 =?utf-8?B?eG1RdlQzNTZNOHdXeDBQY2VKLzBjUTVGZktCZHVZL2FFdC9qSkY1N3NSRmZN?=
 =?utf-8?B?QmZuNDl1ZkxkRFNlN3B5c2ZhNXhwNlNVM3dIU1RnNmFpaUFlM1U2MkZlRFQ0?=
 =?utf-8?B?cEdGWlFUc2NYcldHNGY4OGpyeEljaDN1MkJtZklhK21MTEwyYkN4Nm1hMmk1?=
 =?utf-8?B?dVQ0L3VKNmhYOExocTBabCtMdTVqTm1PQWpXbGVaN2JyTndxMDF6aWQ2K2sx?=
 =?utf-8?B?RHpZRDIzQis2a2pQQzRZMExDNlQ0clFHR0NoSTdYUFZCN2JhZlZFMFhVK082?=
 =?utf-8?B?OWVLWVhPSG1xRDdzdy8vdXZBTU9aZ1h2Ukd5L2dpbmU4aEE4VFprUjNTeEpt?=
 =?utf-8?B?TnVjbm1jSlJFUWZSNkVwNktGc3ZvbFVTTmtDaVNwd0EvZ3MwYVFFNzhjL0dZ?=
 =?utf-8?B?S0dZOFBINFJwUGdzdDE4eWowSWd4MHQvSEJJUjRuZk1Nbm4wVmdtNGFodzJQ?=
 =?utf-8?B?cGtDSDRyWEhyR3FTMVdlc0wxaDQ0MExQR2wxc3JjK1NuTU9ReXNqeTJLSkRn?=
 =?utf-8?B?dlRQOXlqZERrOVdSNkQ4QjkzV2RMeWYrcWF6TlBhZjFuTUlabHM1SXpaak1q?=
 =?utf-8?Q?LJ+nXZIABWXrYAE+ftBJtZt2D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c8c636-0c9d-4cd0-f8fc-08dad43ee754
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 08:26:27.0512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kUWHwAIOr1JlSRBJhUf5ywcWbiR3kzCQC8rOJlgeQ/Xa7cWjYG74GvHYBhKLjM/ggpKx+qSkr38NjIY/kJ5KPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6941

On 01.12.2022 14:20, Andrew Cooper wrote:
> On 28/11/2022 10:50, Jan Beulich wrote:
>> All,
>>
>> the release is due in a couple of weeks time; ideally we'd get it out
>> before the year end break.
>>
>> Please point out backports you find missing from the respective staging
>> branch, but which you consider relevant.
> 
> I have a whole pile, all to do with (o)xenstored live update, but
> they're sadly in my pending 4.18 branch.
> 
> Hopefully there's time for those to get into staging before it's too
> late to include for 4.16.3 too.

I see you've pushed a bunch; I can't guess though which ones you would
intend to be backported. Depending on the size of the set I may end up
asking you to take care of cherry-picking. And of course I'll assume
the oxenstored maintainers agree with whatever set is intended to be
backported.

Jan

