Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CED5375BE07
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 07:52:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567337.886238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMj3p-0004HR-Ho; Fri, 21 Jul 2023 05:52:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567337.886238; Fri, 21 Jul 2023 05:52:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMj3p-0004Ef-Eo; Fri, 21 Jul 2023 05:52:17 +0000
Received: by outflank-mailman (input) for mailman id 567337;
 Fri, 21 Jul 2023 05:52:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMj3n-0004EX-Oj
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 05:52:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7d00::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd0a6b61-278a-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 07:52:12 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9416.eurprd04.prod.outlook.com (2603:10a6:102:2ab::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 05:52:10 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 05:52:10 +0000
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
X-Inumbo-ID: bd0a6b61-278a-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+Gc6HG5tQvk3UAdJyc+/NfhSC76frJ3Mhu88e0QPUpi9uk6KB447zMUPP8cfZ+q6GATdmrspQbuP3I3waUHAXe5WbDd2NhpCwzLE2TKDr0lraKC8UpEYlj+GvG2/qoPU23bz+vqrtGlapl3T/JALT+M5s/NFn2pp6UC2lFlWLpr3Zg5fXKS0AmrOZ4FkBQxSHwSyCYsuIUBRsy7J9F0sumynvc6lA0cAm4j7kAwKayUF8kS++yFSzXFMgNdkRNb9YQbgLWy/zuAnnfkRjIgMZ8T+jyaBY/JE3JqPug2lhIMv3Af9hMyNVwvgmfnrxNcVfVZXXM4pJAlWqL97VR1ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qItS7tULWpEoXGK8qSfHuaaQHSiXsvIKMSCmCACX/Vk=;
 b=neke5Wcc9fQnBgRoAoJ/91zGKwpmyKgGgHrzqLNTOkpZhP/vdyOYD5sEuH7YqzfZrqSO91IjMn5f/zfXIjCa7t1hiCZEwlzhsbUs4MzLGWMp0oWKBklbFMTjHm++Uax8CDCVx4GQ+FiEmBKHN3fyidXxxgdxFSTI9uPuCA4Oa3TvBqTdzAXnOuSFTnvRNfiF/CaOEiyp7EXe5G78NDL2KnUSQ+Ty+TvsuRX/miLTcNxkHfr41tTzQ8o57UU0dbpK9gpL2G6MmKHRjVg2uED6zBggvAiGSgGNqQuMCjlRc3X044VqmVxIWnlLuYTCjj0tFeMBLZEzEmmYSM38EwUwTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qItS7tULWpEoXGK8qSfHuaaQHSiXsvIKMSCmCACX/Vk=;
 b=ruhCYCYzrujmBOieXc+elfzydEUeYK3SG4K/l7mTyPbA7Bj/pX8a8H6wAkBGy39O/X/BR20uLJaqCnw7IrUM8MaFAWkpv4OM5NliIqao/4fKuULB/seOVTbgstBnkksDNeOtpNwYsN/p0V1/xr2d16y/0UnkaQ3Ao1l7QwVEcBDZhGiHJFABly2Ie4kwjPdsE7yzkRtg6esH+WFTcD3ZzVYO+nOVui7jlvXhsLXc0kVk2Ssmf0YXXjjrU7xNpRuyEaUQfWMAWhwk5vFk9NPhX82eUdtXdrdc4KnOeMwWpiEsY9GhoTOBzdj/55FXfXtRN/yLM7RuTvhaF5+UWlSTXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <85494c1e-b56a-7d10-9526-69ad54862bd3@suse.com>
Date: Fri, 21 Jul 2023 07:52:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/4] build: make cc-option properly deal with
 unrecognized sub-options
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <dace10da-f108-fbe5-da4f-0e4497f512d9@suse.com>
 <b2c0b9ce-7919-8571-cee5-5ee68b7db63c@suse.com>
In-Reply-To: <b2c0b9ce-7919-8571-cee5-5ee68b7db63c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9416:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f60ef38-e1f2-4547-52e1-08db89ae9fce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	burHLunSJu8vwz/bzk5ypxKUwSo3lbm5m0E571eAduT5l96HoCLPKpbv7lh66RMrlK3xt1UKpf1n+V6nBPGl/JRu7/qkoKqa7zoekIP/Gu8dnAbOJLTLWBAnskAZw9MuS7rW2EViXdlEEGiLTUTI77cMGOBsoPg1iWX6UXACwOTDGHNfSqYO9GPhBo+SVOMrBZ7gR8JebbmKXGTncUiRPyT+6+kuWGSvNEP+W07qR0+OjSgIjaZpl0Jd4DBkAWyzYIK7efnzfxuxFl4C1F1NeFfYz6K4qsHNmsibjpLyUlUgy/joQUu+KwON4jhm9UGBEP+JR7TtsS9X2CIIfcAFd+h0+60IX08rT/P7zCxJFSyiKwAnH0B6tO/r2U/rD3jkccMGf5Femdrhs41CQhpUGTd/JVNZ8emUhXTZd9HjwZKyUkuOCYuM0yyD4R8rcms4D5f+NpNcnhQ5Ikqrk4TX35ej2UkJO7Ds4C9embBxgPFtvmkZXS0eN1fi2j9Wr7lnjzab1qtZGC7FpmHAJ9n0xXSxYst0Kj82cO3ejxpb23qFEYf6OLrDVJmGlo1PjuyawlxU2iCjSWGNqbdfUGvV/gTIpHemIa6s2bAhTa6yYMp3kVMEM8af0CvFkqAFTXSi5Mbcg1GdwjupASaa7qeiJQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(396003)(346002)(366004)(376002)(451199021)(38100700002)(2616005)(36756003)(83380400001)(54906003)(4326008)(66556008)(66476007)(6916009)(2906002)(316002)(66946007)(6512007)(6486002)(478600001)(6666004)(186003)(5660300002)(26005)(41300700001)(8936002)(8676002)(6506007)(53546011)(31696002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cW1QRHByWldCV0xsdVFWS09wVWlaZWFnTUZDNmlCcUdyNGpjaHdSZlZPcTY1?=
 =?utf-8?B?NFdFaGFoN3k0WU9HeDF4YUt1NXZwdHNydjBsTkM5SjgybGdndTIyVlhWRlBM?=
 =?utf-8?B?N0Z2aDRzemEremFmaEc3dEs0SnB4N28rcUdMNjdaVDU4OHBQVHFyR0hOazI3?=
 =?utf-8?B?Yy9VcHBzQXNhU2RQZ1o0eHBJTm40SW5DM2g4ZmNKWk4yaXBqVHhyNVNVZlV2?=
 =?utf-8?B?MWlpcHFPeVhEWUxTL09yejhZZURKWjliTzRHL1NaVHlHZ1REZ08ydXl2S2tS?=
 =?utf-8?B?c3ZDY3JSa3g1S0R2eFVxNTNOK2d4UGJDRVRhamFRNVVRbzVnVnNONXRkb2VU?=
 =?utf-8?B?bjErSFdiSmZpZUkxR2wyWlBGYlhXbG83cUdYaHdRVk94N05MNzFpbHM5Vk5Q?=
 =?utf-8?B?a3dhYnl1VTZSMDBWdzhKdEprV2VuM29BQmh6S2k5YzJQb2pKc2h2Z21nZnk2?=
 =?utf-8?B?SkVnYTV5ZDZNeGpFUTN3aHpDSDc5VUgxSG9ieWM4TVMyMFNYK3VYK3dmS2RX?=
 =?utf-8?B?TVhEckxkOEtZUFlpTmh3T01sZlBhQTJYNnhCTkdnMXN0ZHhhM0JQd2MyQkJa?=
 =?utf-8?B?VGRSSEpESnhkTFpsVHlXS1NqRWlrZi83d1pZMlJhaU1DM2ZlZXVkYWJUZ1dt?=
 =?utf-8?B?WEhHdDNDWWIwVVdJNGhKOE1Ed3NMSlhJenNneVFrRlNFcFRCR1BxQ2NVQ203?=
 =?utf-8?B?M2ErNzNaNURXZG9QOGFSOEl5cDdlTXk2QWZHOGphS3pyQVBSdk8xSHFQbFcy?=
 =?utf-8?B?M0RoWWNkY0ZCNEZQb01ubmFpWFBwYmo0MGo2NDVCdEpLbnpiZkd4dVlpdnlC?=
 =?utf-8?B?Y05vQXkremFwWGNnNWZleGFqWDF3Z0xEUDg0RENuNGJiWEtCeG5PQ2FxanM1?=
 =?utf-8?B?SVcweTdNMzA4TWtUeTV5QjdxRUJFbTM0c2l3L05GbTFQeXVUNzBJQVNFaURJ?=
 =?utf-8?B?L1QvRGVWMFd6YUpMWUhKYUFILzQwTno4Vnc0djQvN255aU1zSHVlMUxhVC9Z?=
 =?utf-8?B?T2J2dDgxWUUrcVczY3krcW1HT0RKaEdrdEwxWEpQS3NFdzJTUjhGVGppWFRq?=
 =?utf-8?B?bi9TSTVSUm5kTFdBMHYvY0hqZUVZTTZRTjhpMVJSWVBMbjJuc2lwRFBxTXh2?=
 =?utf-8?B?WkUrcG1XUEp3N1ppaW1QRTBBZVlGN00zSE5aSnN5ejIyVG4yR3R4MUxSSEdU?=
 =?utf-8?B?RlR2eitFOGd2cWNUWjJKSlB6ZmlBU3JOZldpR0lZNFBVRU05bC9tYTZpaVZr?=
 =?utf-8?B?ZG41c2xUUXA4MXpZcVA3Z0xqUjFYV3E4cHJBeGdlNTRKdklmZ0REYlpHeWpa?=
 =?utf-8?B?Ky82eTUyL2tBa1lUTU9udkZWYzVVQm9LditVSllpNmdITzU4Q2JhMmF3VVVT?=
 =?utf-8?B?NitkRVFsYmdSekN5cUZhNGFKOGQ0M05Xd3k0Yk4zRW81Rmk3QksrenVOTnJv?=
 =?utf-8?B?ZGU4NVlvS2pjQUFkdUcvd0JJMzQvQjdxbCtWN1h1NG85M3h4RnErMllPQUtn?=
 =?utf-8?B?ZTVlN1FtY3J2b3dyRjFEbm1EaEFxZENCS2V1UVczMEZqQkt4emJnMTZQNFIw?=
 =?utf-8?B?SkE0b2h3ZzNOZjZOWHJKMm9oYVZTRmZyaXRod2ZjcWVYaElvWlR2d1Q2Z1FB?=
 =?utf-8?B?MzV1d0ZQSmVzWFVkNk1ibW00cFoyUVB3ME5GSTJtcXdpck5ocDdoUlY4cXhu?=
 =?utf-8?B?eXVVUlRmUU1ubklrUXRaRVc5OGpSSVhQQ3AyVXlJOWtMelpYN0E2akdYOFdv?=
 =?utf-8?B?K0Erb0F0eWNHOThaM25qT0svdklkNGFIM1RNcDc1N3JFY2I4NnM1RGM4cVRm?=
 =?utf-8?B?SGgvZzMyWDA1MFFzd2IvQURZZXVUa2g1RFczNStPM3k4M0VpR0pMcVJRa0NH?=
 =?utf-8?B?TEd1dmlCV0UxSWRHVkxRT0grdEZpd1hkbnduanprbkxCZVhZOWtvL0c2MlJy?=
 =?utf-8?B?WVZqQW14dlFnZzIvTXM1R1FNWUZCaGhaWkFaU0RyRXorOElSdEl3ZzRSWC82?=
 =?utf-8?B?TEdIUEpoYnBHenpybktrTE9WdGhOZGJISFJ3eks0N3laQndoRGxyUE5waXli?=
 =?utf-8?B?aWtNZ1Y1K1NRQ2VvOGxHRGxseGlLbVdnWElmdHUxdkxOcDlmTThDMTFYbVFl?=
 =?utf-8?Q?qRXKzGHgXFBRk3dkV03zfAJDq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f60ef38-e1f2-4547-52e1-08db89ae9fce
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 05:52:10.3219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4tfyww3glCU2kjul8H8q6/hblFT5NeCDh9VdjKMy2SpkBxN6Ba7TJ6RBartYAuEu5VGANMCMdHRw1bi8zbtaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9416

On 19.07.2023 11:43, Jan Beulich wrote:
> In options like -march=, it may be only the sub-option which is
> unrecognized by the compiler. In such an event the error message often
> splits option and argument, typically saying something like "bad value
> '<argument>' for '<option>'. Extend the grep invocation accordingly,
> also accounting for Clang to not mention e.g. -march at all when an
> incorrect argument was given for it.
> 
> To keep things halfway readable, re-wrap and re-indent the entire
> construct.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> In principle -e "$$pat" could now be omitted from the grep invocation,
> since if that matches, both $$opt and $$arg will, too. But I thought I'd
> leave it for completeness.
> ---
> v2: Further relax grep patterns for clang, which doesn't mention -march
>     when complaining about an invalid argument to it.

I wonder whether it would be sufficient (and a little less lax) ...

> --- a/Config.mk
> +++ b/Config.mk
> @@ -90,9 +90,14 @@ PYTHON_PREFIX_ARG ?= --prefix="$(prefix)
>  # of which would indicate an "unrecognized command-line option" warning/error.
>  #
>  # Usage: cflags-y += $(call cc-option,$(CC),-march=winchip-c6,-march=i586)
> -cc-option = $(shell if test -z "`echo 'void*p=1;' | \
> -              $(1) $(2) -c -o /dev/null -x c - 2>&1 | grep -- $(2:-Wa$(comma)%=%) -`"; \
> -              then echo "$(2)"; else echo "$(3)"; fi ;)
> +cc-option = $(shell pat='$(2:-Wa$(comma)%=%)'; \
> +                    opt="$${pat%%=*}" arg="$${pat\#*=}"; \
> +                    if test -z "`echo 'void*p=1;' | \
> +                                 $(1) $(2) -c -o /dev/null -x c - 2>&1 | \
> +                                 grep -e "$$pat" -e "$$opt" -e "$$arg" -`"; \

... to check for only $$arg here (which will be the same as $$pat when
there's no = in the full option).

In either case there's likely going to be an issue with options taking
very simple (e.g. plain numeric) arguments.

Jan

> +                    then echo "$(2)"; \
> +                    else echo "$(3)"; \
> +                    fi;)
>  
>  # cc-option-add: Add an option to compilation flags, but only if supported.
>  # Usage: $(call cc-option-add CFLAGS,CC,-march=winchip-c6)
> 
> 


