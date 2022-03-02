Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB734C9FD9
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 09:51:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282099.480670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPKhE-0000qk-UA; Wed, 02 Mar 2022 08:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282099.480670; Wed, 02 Mar 2022 08:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPKhE-0000ov-Ps; Wed, 02 Mar 2022 08:50:56 +0000
Received: by outflank-mailman (input) for mailman id 282099;
 Wed, 02 Mar 2022 08:50:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPKhD-0000op-NO
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 08:50:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de36c30c-9a05-11ec-8539-5f4723681683;
 Wed, 02 Mar 2022 09:50:54 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-G16L7S_qOj-x9ubuqs-uAA-1; Wed, 02 Mar 2022 09:50:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7085.eurprd04.prod.outlook.com (2603:10a6:800:122::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Wed, 2 Mar
 2022 08:50:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 08:50:52 +0000
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
X-Inumbo-ID: de36c30c-9a05-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646211054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ph1jqQjQ+iHkLFanw2O34MPA/R256UiuFBkCKVgbnfg=;
	b=B/q7hmiuNqWlChFN3KqqTztC13xUv3dmhX4JJAQdOtD98Sjb2RcITja0edTx0Bh6+KBbtx
	p/6QB9vY1ZqSI8wCK7eDM1zmEijTDNBRxF3D2xNValIWaSaozTsNDNFv91CkX8m0R2l9Go
	VBXGceFQ/RsACAyH09YsjkzBPoNjXlg=
X-MC-Unique: G16L7S_qOj-x9ubuqs-uAA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJ0kvufu/B5fFzDYMrIdIha2ItQosEjTSwhJlSpoAZ3z52dwJX1QF3TmKaR6F9gNcA9hn0sn+z8YX1EY1t67lNANVvqA58+xSQJl4W8GRy5wRksNcBZJX7pZc6xtI2YwEwuy/DAws4XR+dYnCjZCqX1zcD8eTMTyTl01d5s7TjVH59a4ppharV1vLKOlfKt80fCZoC+zboXXg5q5JQmrCEYxMUtGO5NRUFFwMoKNWBXHVry1yKcfDbuiEVKUc8TW9s9zP41hPKYDuUQaMgGlCjZpc0/IhvGtZvPmDlxUP4ICO28grPTsz9as5MpwKZwNhqu7CALbkmp3vAg4BWR72g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ph1jqQjQ+iHkLFanw2O34MPA/R256UiuFBkCKVgbnfg=;
 b=IdkADF/tK290uX/mEwXJZrjmXZRRGW1w4wG2ZU8uqLVE7me4Nyb/n2w3wSB2cCTs5D9wvkX0v3RVJq/uPc8QkHrIqupLXXSbvs6ThM/PpdQdidd1EArUYNgxuwG0IUcrsBgWxySoqVLy7aNC3fCNHW92uud2DF89wBJmcMoO27YU5j8ibP67sK9atCQjmdQNngUrXD2gQr4UjfSfvsh435/ibeP5OpEMK12t045OmVcgVczd6w2PbqJX8Mj9kF7CeNTa+si6suYse4e21Pns5l/GBiTDWJ92zwHVMdunwDi8LUyyaXzlIUGw3aaV3UpPo6FN7GqvsWBHURkb3IcXMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4726b683-3739-f96d-ff74-45894865a6e0@suse.com>
Date: Wed, 2 Mar 2022 09:50:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] x86: fold sections in final binaries
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <03851bd4-9202-385f-d991-c9720185c946@suse.com>
In-Reply-To: <03851bd4-9202-385f-d991-c9720185c946@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 259644de-1d6a-4ae0-b80a-08d9fc29c195
X-MS-TrafficTypeDiagnostic: VI1PR04MB7085:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70851AEE0C34286D82C13C9FB3039@VI1PR04MB7085.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HqVTkQevpFKyE0UFY/o8IbWUBHcO5v34MP1JIE9idnLdeYj1APlGkRrArRY9H043O7Z4quAJugdKf3nXMvkBY9eoXK1L/OiqgzodivSEFF1R5PRDNEbEVfQbxK7O71IL3vB2XzDiXss+eVCUqStj+aKEhEVSyOuUY1j08bKLL+wQxPmJLX72AMqO/MyXrR1fYCLUln6ln0G02NvA0696SjNMXK/AxlWVasHAYGW7r3LqLiXQiTLsGENSbv9NBiI/8IOH5+fpG8js6H19xJMs4GzVSRZXcUWQ8BSTTvp7Lpe/I4Lt63CCZeaOJvI9qJ4lyRomYv2BBbjHDxhL2RagGLHI/j2OQLAB9OtfneQgRc1bDieAZecccn1HBwCLLqJAIf8cIH/u4lLf36ALurG7TBZtZCPiQ4yMrUA+r8Rbcn5cQENsLgSfAmC5zCvYC7lGTMtLZgEMfTuXs1SDPW/DHL0BkQH37W+w4IYFgWvuWg3z7rmMDe9MLLs4z2pOIpHfdPWr3+FjYDvfNTA0eNe42GwbaDQol1BZbScXvlUnATXxZwMm9GpDuFav6dX3NhgTKW+vuGSifScfM++lAzbuE5IJsoGCELQ8J3r+tLp+ULocqf+R4zmkmeWZ0eP4X4VcPm8TSrxGyB9mQDgWSFzhp0TtJ1xix0AYRmKXj96Km+osuysLPOC8kpnTZfCdjaDk6c1pcK906lkQqe0G+IQudAZ1atDMTXltURszj4SMoaU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(6506007)(6512007)(6486002)(31696002)(8936002)(316002)(6916009)(508600001)(54906003)(83380400001)(86362001)(5660300002)(31686004)(2906002)(38100700002)(2616005)(66556008)(66476007)(26005)(4326008)(8676002)(66946007)(36756003)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0xoaE9wdWh0RzEvUndkUFZ3disrS2ExZ1U3NUhqMWxKMkkvSWJYalhHbDJO?=
 =?utf-8?B?dW9QMmFONm9nVG5xNlNhNUNtU01WNzV6bzdRb25vVXowRXFqRnhzdFJzODVN?=
 =?utf-8?B?MXFqaXBnd1QwcXdKb0xBWnR3b3Q5b2tIcm4rL01EWHJ5eVRBUFRZWEJGcjZE?=
 =?utf-8?B?Z0VEUHA3SG9jODJwY2xFNjJvLzVGbEJvMytRd1BVeFVoWFk3cTFjR2gzeHBX?=
 =?utf-8?B?T3BmN1pEbktmUzBSSzZGMkxGaFZXZWNlOVpCenMxalVBdGZ5S1dsbE1HMTRh?=
 =?utf-8?B?dnV5cG9BcGtjWDhVRDNPaEx5NXpCc0tGbEZkZHFlWnhoMWpmWVdxdDV2dCtS?=
 =?utf-8?B?U3dwNGVFOWNPZWJWQUlUZ1YwL3NlM1RuL3RRRjVFdmR5c3o5RjJ3YUxEWVhn?=
 =?utf-8?B?YkVhQzdQLzdLU0NGbGZqSW0vTDJvM2VUTEpyd3ZqVXF0dE5nWDRBeGZ3aEtt?=
 =?utf-8?B?V1o0QTJQVVRtS1gvSUxTcHM1Z1F4YTQ0UzM0K2s4TmNybStFajJGREhDZGNT?=
 =?utf-8?B?MmlsajJRRkRET3pJL0ppTDhlVGRCNnVMUHVNMEZUMW4zYnBWekNsazJ5TkNs?=
 =?utf-8?B?eE5BMkFkNWFHbGZYQXNVZjRBVVBaMXlvSmx5UVFnZEc3Y2RsNEIybnIrMWVR?=
 =?utf-8?B?Zm1ZSnZBRmIrcXR3eFUyL3p5L1h3TnNTaHQrZnllUXhsRUdhdVpQbndlMU9x?=
 =?utf-8?B?eit6dXhuc1gxSkZBMVdwYlRoQ1VHTElIYXh4NFRYRFFoMWYrNjd2bStmRUtD?=
 =?utf-8?B?ODJnMGdEUlhFVlByZCtoZWNPRzZVVXFGTGJPWm9lUGtiYm1YQzhUendoRVlh?=
 =?utf-8?B?NHJEL0RsSjNlVE5qVTNyUHN6T25pczRURENhNFJCUzB0NjRsczNheCsrSWZy?=
 =?utf-8?B?MCt4R0JLV0ZYeURmaFpZcXRjRy8yTGErZDF1dHdNTC9TZ05Sc082blhGZU9q?=
 =?utf-8?B?ekU0S1FzRnFzT3FSNGZLUjgrNjg5bHd3UGZOOFJlL2NCNWMzMlpNSmczN0tG?=
 =?utf-8?B?ciszbjhOZ3BUUHlnc2RWM1pjQUp6b3h6T2FuK01WUEF3ZWYvWndsa3lCYmJM?=
 =?utf-8?B?K2RYVHp4ZVVrdGVrZ2lqbHlhSjBVZVdpaDVGRStPbHdGcDBxSFlHYkZmUTJm?=
 =?utf-8?B?Yk9UTHRLN3BSZTY4Sm05OHE4YXJhWlVRelN5ZkFpWTdVSXViL2ZEaGYyMWpY?=
 =?utf-8?B?VTEvd3RjdEwvQUkreVpsbFVaR0VPMEw3Uk9qTGZISW9JZ3pocFVEZlEwUDNI?=
 =?utf-8?B?dERTUnU1RHN4cjBuelZTRk1jTFNoUHZBMUxTK3ZHTEZEYjNJOXE5ZTVWSGZq?=
 =?utf-8?B?WGtmUllIc1N0T1JyL2Ixd2hNenNSc3pJTk9FZmgzSTRNdmloWmQwZmJyaWYv?=
 =?utf-8?B?YmNkSnhMYUoybUplYTI2ejNsaUc3b3RjM2hzYUZWaUs1eENyalk5cWtSU2tz?=
 =?utf-8?B?N3lUSlNxZUh3NVZNQ0RxeUU2WXdNalFtclhDVTJiT2VFQVlRR2h5T1RWVHpk?=
 =?utf-8?B?djFIbE5YUmNaTUxVV0pSRUF5djM0R1V3akZFVndxSkh2a0ZVMXZ2TEFRUGxv?=
 =?utf-8?B?VkpJK25qT0pXbmJwMHkwNzVJTkdXakhnNDI2dEk3QllLeGhiYkl3b0N0TkxW?=
 =?utf-8?B?dEtJWk9JRXRKd3picHRBR2VnYTFlL1Y3QkdEUEFCM2NoSUU3L0ZjemdqdmxK?=
 =?utf-8?B?amp2MytvTzA1K2h3OWRoNjdranAxa1NlbWZNWk5vczZIVkdYQ3g2TEdPUzY1?=
 =?utf-8?B?djBMbUVWcWZGQ2hNcFR4d2RpVUtrWDJkSWtuR2pEZVI4VUNXQklVS29JN2RW?=
 =?utf-8?B?YTJpczRIZjhjblVTbmZnQWZOUmltckhsZzUxTTB0cFdWeGxDUE5rYmI2QXdj?=
 =?utf-8?B?aEMwSEh1cW5oUEhiWGwxVnNMejZzZVVWeDE5aUxPQ1lQL1JjeVB1aDZXN2xJ?=
 =?utf-8?B?dDVWR3lIbDU3ekNpVjYydTFMelRFcmZ6Y3BGZ0ZrTWp4eVFpZDJoakpjeHpz?=
 =?utf-8?B?eE82Sy80MjNlc2htczUxaHptRUdtcGN1aW1nKzVBdTAxcDVPb090OW4wa3FZ?=
 =?utf-8?B?VUswQ2V6dDJlSVg2cnVRaUNRcENHSFYvNkh6U2pSRnVxbXRWVHVzSGIxdmI2?=
 =?utf-8?B?NkVSeGVWYXVVb1pqcnNNdjk5ZzI3cUYzMHNsZm1OL0JDOFRMdy9JZDJkZUVY?=
 =?utf-8?Q?8TsQMuHynNNflhC3Igp+q04=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 259644de-1d6a-4ae0-b80a-08d9fc29c195
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 08:50:52.3965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EIbffbWcUgh0wbNQEJ2rTBKrORwBun6ACGMrSTNH9qkmqTJ4QcuFW/MpMXwBThC+ZajkYNeiSQnd8lVvYbuLKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7085

On 01.03.2022 09:55, Jan Beulich wrote:
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -194,6 +194,7 @@ SECTIONS
>  #endif
>         _sinittext = .;
>         *(.init.text)
> +       *(.text.startup)
>         _einittext = .;
>         /*
>          * Here are the replacement instructions. The linker sticks them
> @@ -258,9 +259,10 @@ SECTIONS
>  
>         . = ALIGN(8);
>         __ctors_start = .;
> -       *(.ctors)
> +       *(SORT_BY_INIT_PRIORITY(.init_array.*))
> +       *(SORT_BY_INIT_PRIORITY(.ctors.*))
>         *(.init_array)
> -       *(SORT(.init_array.*))
> +       *(.ctors)
>         __ctors_end = .;
>    } PHDR(text)

While I did commit the change with Roger's R-b, on the basis that it's not
going to make things worse, I don't think what we have here and what we do
in init_constructors() is quite right: For one .init_array and .ctors are
supposed to be processed in, respectively, opposite order - the former
forwards, the latter backwards. See e.g. gcc's libgcc/gbl-ctors.h. And
then both variants also shouldn't be intermixed; we ought to expect only
one of the two kinds, and aiui for now it's always going to be .ctors.

The processing in wrong order looks to not be a problem in the builds I
can check, as there's only ever a single priority used. But we're at risk
of this breaking down the road ...

Finally, if we consider .init_array might appear, we ought to also
discard (rather than leaving orphaned) .fini_array.

Jan


