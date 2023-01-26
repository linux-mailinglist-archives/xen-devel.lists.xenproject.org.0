Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB0767C69D
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 10:06:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484841.751678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKyD2-0001Rx-DG; Thu, 26 Jan 2023 09:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484841.751678; Thu, 26 Jan 2023 09:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKyD2-0001P9-9u; Thu, 26 Jan 2023 09:06:16 +0000
Received: by outflank-mailman (input) for mailman id 484841;
 Thu, 26 Jan 2023 09:06:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=71dA=5X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pKyD1-0001P3-I7
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 09:06:15 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060.outbound.protection.outlook.com [40.107.105.60])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae13157c-9d58-11ed-b8d1-410ff93cb8f0;
 Thu, 26 Jan 2023 10:06:12 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8595.eurprd04.prod.outlook.com (2603:10a6:20b:426::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 08:50:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 08:50:15 +0000
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
X-Inumbo-ID: ae13157c-9d58-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X04Xvx0HrJ8yXtwKoMTUZwiMYwpDd0g6nHtrUxbGuij2Uv0MbJuH41N+++kYD3epQyO+IWAlieXnKrTK3f2CgtL6khOfAcRA61ZR2DJZu8x8PPukOvEns2tzulUomVTfy90yQJmaHyjp2bbD5nZp96GJvQbzodRyO3uOcWrH2/SFV/mrYaZW9RFYyDoy/+0olr1QzV7nHAxSEByeFtNgu/ncEsZF1PmYZLhAVLAv1pINeu5AxszKGW96Ucx1a+bv+yT5r5cGEFYzanmGnJnkDrmgeoGcgdg+4VvvuACMqt4mLX4ROvG6xNgEFqyCjOwYYXHlDv07p92SeaHchk8ybQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07Olfahwhy/F/0iLY3tr63GquYMtGeh2XTGyUOO8lLA=;
 b=RB8Lgx8K0w04+x4cBc34vjT9xdvEewjzQF+ApS3oEs/f6h3uGFMo8HYu8ViqlUDAVN97+316sC9+lXyfbnobmU3irQenZUjBHK8tHfDIb5fS21BkX4ypdH7x4iyRYGFkjLoMKveg4D1wobj0qu4qqeA1U9Nb4uwO+j9ahSghZt2qViKY7APv018T2pZ4qq1HMMGyQdov7GzZWf/YtE4yGBqa0d4VhwQfYx9+e9j6WAUTDyVhab7p1iIF1GI8pV24RO0SYrAfGgU/AHtpSprluRAtadKcvKN8PYOnKtgSFTnBrizpUEKa1Ri5+kaGr8bdTyFjLZDUzlqGPKsPIxx6Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07Olfahwhy/F/0iLY3tr63GquYMtGeh2XTGyUOO8lLA=;
 b=u9k8dz/zKz9PqJcm/t9rnXKNfoT8UoijVVVAY3Aqvg+49Qzm6tDpQZfqkExuQFGvixxhzScZWBirX9cZGxuubATySu8gzLJc8ugqTrarGCEa0u54kiaLykHYm0iW4oMI5uUSNhxkR0vuPyDu/J5eMiK3oF/dr49MPchYPMaoLLQQ/xZAoZBVuCxoMUiDxxSytWm77OFQNr9s/QO9cFgaNpJ6MsNMjIBlzR8nHsa2IlWPQ3YPY+Nzfs6OcNo9TovVXGXx39UD43cj0/vQvHISsgxM19JVzaAToOxgpgYa/Rw8VP6rlUSo92oCFN/tReJv75eo7QwsKzbbHU8x/WkwBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a5ba3821-37fc-c724-d015-6e9dc8cf65fd@suse.com>
Date: Thu, 26 Jan 2023 09:50:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] x86/shadow: Fix PV32 shadowing in !HVM builds
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230125165308.22897-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230125165308.22897-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8595:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb4b5a9-877a-4f59-1f10-08daff7a57a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	glKRW5peAxo7/Y+zPJU4TG/MxSDSj3YVSUwyOH1YBSi7vSeKtnYKo8xdPKewPEs9Hfb3Saquk5wXvQ8Zgq5yc+traC3wrCINSZPgvPcGN6SlDMeMhXhLHzC3R2nDeDSVwTy2a6C8y6wMcATKvUbzfQ9nZ0S4bhd9y8qvQXl1voMJ+bQeXPmebpcfrzlbJ7DsU98Y1YfwRnjCFZE1PzYXD5v/IC1wTqyWq07dkFoGrbt0qHDKYpxS20bZ+o+9Rj4/xNgTnAwC0NcbQSj7RP2UARXQUY1T/zCCqNbY1DPV0+TciRGCMp0xU6muDTjkgzQrNBATRXr1+Yfid/QAs/DMWL8zcJ9M8QMmQD8sf5VJo8vNR8iNK4lOwKJjWZv5Kfl+9FuKs9jtmndepDEWTs5P6tjI8sDIr5lSFrleylnieq6/R3zVAFOuug//LKpnq+PSpRQ54u/jDHxBTacdAW/ZjAd6rb9AujtlG63nyQPycSdxmr3/wJj1mmfiTBGkm/YqrYHL9cFO/ONxWSwHY76EAm+kJLMMXlBrf3xyfqtwuxSEYsCNXrlfBCvC84i8EZD2W4Sq6Gmt5fatD7RnzID9+Bxe8EAdZcTWr0hS77PyHCA71+Ss9vdJ6mUL6WQZRG6QCwaDPt39zgaASHIp/ny8gD5x533+Pmom/TFTsX7kJpf8BovXNDPBXrDlIy3BnTtod2FnQk//5iW/jUgavLFEUs8H7Zta7AIIrCD1D3cQT3I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199018)(2906002)(66476007)(6916009)(66946007)(38100700002)(66556008)(4326008)(5660300002)(2616005)(31686004)(41300700001)(8936002)(6512007)(26005)(186003)(478600001)(53546011)(6486002)(6506007)(8676002)(54906003)(316002)(86362001)(36756003)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUN4VjZWbThQeFpqY2JHRDBJRlY5bTV0MFRMUE9tRUk2cFFoaVVkVENmaUNR?=
 =?utf-8?B?YnZ4VkZpWUhjMGJ4Y1A0anJNN0x2YVErcDVNUkZxNXg1L05GZWtuYXU1cnFu?=
 =?utf-8?B?emRieVl3YUJDYjJqZktNaWNkUExTbUcxZ0ltWjl1NnhQUVhjUHhRdWxuVU5Y?=
 =?utf-8?B?S0w0YlhBSUNQa1pmYnhseFNhbGVSNFdwMSsrQkFyZ2d6TjlUd0JxWU5sUEto?=
 =?utf-8?B?TG95RG5YdEVPeFlPS2VFd2VMYVZib1ljMmY2eS9WbjlGYUFYOEczSFFrZW52?=
 =?utf-8?B?YmF4cG5JU1FTdlBnKzhSSExyK2Z0YkZMYW1rM1JYZmZ0WHRBRWxpYVNNTkUx?=
 =?utf-8?B?MUpzdjF1elFJVkhWeVQ1cTZqOHh3UTRRdytvaGZrclV3d09pMDhNaFg1TDZp?=
 =?utf-8?B?WFNNbm5pSUZQZWpxOW1EUzVScWhFdHgrWEZXNlU0QnUzTXE2VnFIOG42bzFP?=
 =?utf-8?B?TjBIRUxXWkZVNUhpTml2aVdOcEpPdFRGMUlIQ2dRLzV0dEY0V2tiazBwKy9u?=
 =?utf-8?B?ZXU4am9BeVg5M0lIbi9GMUpxS2dWd3EyWTFDS1JvSHdWeUJnZWF0aWxNRUYz?=
 =?utf-8?B?eDBCeEN1a3pjdDl5dUhlbVd6TG5mNko1dmJQS0JucysrVXRYQUxkaTRUbVZM?=
 =?utf-8?B?VzRhM0pBdGFUcTlIM2lTbWxmU1hiS3pxczFsUDNCU29CVmxhZmlkR3pCeCtl?=
 =?utf-8?B?UVNpUGRheXlDVWtkcGtOUnpFZEY1VThxTmdnZ0k5U2tiWlBrREZCMHJVcDVh?=
 =?utf-8?B?bndpUktrRm1LZXNMbEVTb0lrbHk2TllscnZzWmc0aS8rY0drdkFtSWZiZ0lw?=
 =?utf-8?B?aUJHRDhvN1lyNkIzRmpNN1g0V3Y2c0w1YjFyaEsxRHA0Q0VZcGJwVWxQY1BL?=
 =?utf-8?B?azlCaG04ZVo3M1RETXJCb2IxeUtnc2dmc3ZVaWVZZGNCTTBLMS9VY1Fvd2Vw?=
 =?utf-8?B?MmI1ZGl5UldYRDUwS1IrQjM1YmpBRCtzcG1pTzRzV1FYcUlXNVF1NTlJcHV1?=
 =?utf-8?B?MkVKMDhzbHlURzFPNjR2VEdEUG03Y0JjVS9hcS8wTWhWOWY3SmVwSHZnNFBa?=
 =?utf-8?B?Q1dqcVQvelAxNUVLbkFubFZVS1B3MlBVK1ZHYnFMVlJUZXlHUFlGelhQQlRv?=
 =?utf-8?B?ZWxVNmFuK2JkSEM4TmM3aFhXdWMyTGt0eG5PSUthZFA3bHpNNjFCeXQrMTNO?=
 =?utf-8?B?SDhpbUd5R2tWSkQ0MHc4aERuU09aQkNmdnArREdxN3ljR09nYnFmVTZKR2F1?=
 =?utf-8?B?bExCVlQxMUtNYmZaUkxMeXhhNXppdzVTemxyYTVNNFJyOUFIMkRVMUwzSzRX?=
 =?utf-8?B?S1Z0YlF2bmttN1FBTHljQThPektBeHN4QytrRFoxQ21ZWkdiNXgwNXVlQzlT?=
 =?utf-8?B?MTFDU2N6M3l6TTBJRldrN05OWEpSN3JWM3JMMFN0WTZwSU1GbytjQjlqc1lw?=
 =?utf-8?B?aVdEaGFIR1pFSWtUSEhEWlhqZFF1TFkvN3V6VGRsaGJsdk05cVB2UXlCQVlm?=
 =?utf-8?B?QVFHa0w4S05DWkxJdXc5NHlselBBcmdZNlIrNjdGbUluVWpYc1Q5WmRqWXlC?=
 =?utf-8?B?UURGY05iUk9sSTlaK0FhbHdmdHF4aStZS3RYWkV1Tk4yMFF4RHVHaGd4UU0v?=
 =?utf-8?B?OTd4c1JNMU9kbW1sTkVJS3grK0U5dyttRFllT1M5K0taQzhkcFpLT1ovSnZa?=
 =?utf-8?B?UC9ua0ZaNDVNYTJtellHZkcvMmJrcDRtdnNBYUk3Q3pNdS9sZWk5S25QTTNt?=
 =?utf-8?B?ZlZ0dUxnWnFFZ2NkTUFhQWYrbGxLVlRTUWFTMmhqYzk0Q2VORDhHVkphVXpZ?=
 =?utf-8?B?VXhjVE93eWQ1cEU3NXdYclByTldwWGpjYXJ1YWI4S1p1NlVIbzg1ZWs1MVhQ?=
 =?utf-8?B?N3pzeWREbi9Bbm4xbjRJQ2p6T3lKSFFsRnRzR0NaRUlwR09GUmJtU21QTS9i?=
 =?utf-8?B?Sll5OUFhUlNqZVhFVlIrZ290RUtLYjZvbVBBMnNvS045MHBjS2dGR1RvR1pn?=
 =?utf-8?B?bk1NMVcxemFlVXRQQVlnbmkyUkNFU0dNaUw1NDVlY1BleEVvbkhOM3JSN3J1?=
 =?utf-8?B?Y0RoenZSTW9udkVPbnF5S256M1ZEcWxBVnVqSU12Ukh5Q0hRc0tTZkhiVTdN?=
 =?utf-8?Q?y9Xs6X6r5I7bnpLzjfjDevjdr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb4b5a9-877a-4f59-1f10-08daff7a57a7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 08:50:14.9728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yDB+5zA8N8YtxnLeiu0FPHD5VuxVIEJDVrma8BiTmLfAfkdVPvI2CWGrJb6w9xqm1O894XFR5NN9g75TWgwqIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8595

On 25.01.2023 17:53, Andrew Cooper wrote:
> The OSSTest bisector identified an issue with c/s 1894049fa283 ("x86/shadow:
> L2H shadow type is PV32-only") in !HVM builds.
> 
> The bug is ultimately caused by sh_type_to_size[] not actually being specific
> to HVM guests, and it's position in shadow/hvm.c mislead the reasoning.
> 
> To fix the issue that OSSTest identified, SH_type_l2h_64_shadow must still
> have the value 1 in any CONFIG_PV32 build.  But simply adjusting this leaves
> us with misleading logic, and a reasonable chance of making a related error
> again in the future.
> 
> In hindsight, moving sh_type_to_size[] out of common.c in the first place a
> mistake.  Therefore, move sh_type_to_size[] back to living in common.c,
> leaving a comment explaining why it happens to be inside an HVM conditional.
> 
> This effectively reverts the second half of 4fec945409fc ("x86/shadow: adjust
> and move sh_type_to_size[]") while retaining the other improvements from the
> same changeset.
> 
> While making this change, also adjust the sh_type_to_size[] declaration to
> match its definition.
> 
> Fixes: 4fec945409fc ("x86/shadow: adjust and move sh_type_to_size[]")
> Fixes: 1894049fa283 ("x86/shadow: L2H shadow type is PV32-only")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Now it's time for me to ask: But why? Your interpretation of "HVM-only"
is simply too restricted. As said, "HVM-only" can have two meanings -
build-time HVM-only and run time HVM-only. Code in hvm.c is also
expecting to be entered for PV guests when HVM=y - see the several
is_hvm_...(). They're all bogus though, and I have a patch pending to
remove them. But that doesn't alter the principle. See e.g. audit_p2m(),
which simply bails first thing when !paging_mode_translate(), or
p2m_pod_active(), which bails first thing when !is_hvm_domain().

Content of hvm.c (and other files which are built only when HVM=y, or
more generally any other files which have a Kconfig build time
dependency in their respective Makefile) simply has to be aware of this
fact, and hence the data (array) in question is quite fine to live where
it does.

I continue to view my 1st patch as the better approach. And in no case
do I view the 1st Fixes: tag as appropriate.

I guess we really need George or Tim to break ties here.

Jan

