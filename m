Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B335B710C3C
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 14:42:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539563.840571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2AHl-0001kx-4w; Thu, 25 May 2023 12:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539563.840571; Thu, 25 May 2023 12:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2AHl-0001iO-21; Thu, 25 May 2023 12:41:41 +0000
Received: by outflank-mailman (input) for mailman id 539563;
 Thu, 25 May 2023 12:41:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q2AHj-0001iI-6t
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 12:41:39 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c70573c-faf9-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 14:41:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7264.eurprd04.prod.outlook.com (2603:10a6:800:1b1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 12:41:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 12:41:34 +0000
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
X-Inumbo-ID: 7c70573c-faf9-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DB8avvGHhgigVOD0qvuktE21DXIQg0fRZE+nP7TswJfbi73AeDjTFylgp6JQ3xSFS4u/LHrO72yvPpxJF1eBQP7xupRklBDco1NB3OYSN+xWaeF5ZwlDKrj7oEd+SYHbUzpMjhcEIrqoSWLq+EDj8I2vZnMdweMEkh4UtGou/LFKLbgR+nI56TgqLVZVYB1PQdZgYYRRDEmDpwW4cgvyW/jfVkqT5REwAhPSO1uFOiQTnVl3bdfIehxIVKRk9FESv7IxI922dZ7N1yClCX7/KoYhMjgK7e85gdhiqVIuIHhh5E2Sld1rIWmkrXvuNKDfE5e7vP7+ZxfqDT7cZ0DcDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/byRGCDO8LzARuzkYb9wlOh+PDPQHqVhTGXLw4lF+qg=;
 b=EBlQG3xqw89DvfPgYd4WwNq016EpwmWWO+iDZt3Ns17hG824jJ8p/ef5pxmMmBlydJPRx0/Meug5m9WUlK+QiYd9RpDEZNb+wUElsXyIha/YvzGB47NADM1PAPGkx9Z9pwEJh52tWcU+ihz6mjsUl1oUi/dCA9ZUF0ctrdLhAvdBrkZfv3MY6FSLq4N727BCU2OcT0e+EwAKzSgHG/u6MmaBL6gOPVGShkwU4xFpbZsqZydlPXjxaRajY5rDFGIR4yHfTz7NkMldU+Vgs9y+KmQtxoKwNz3+b4DBJd+a9JoX0xm5JcAUuZaunJEMGMTt8M+gInz2MAZMqQ0L+f5Nuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/byRGCDO8LzARuzkYb9wlOh+PDPQHqVhTGXLw4lF+qg=;
 b=kfzkBsK7l2eMAz5bfHweQTD1AgZdfFbwHFJVCfKcsNgb46CNPLoFp0OoTpGhgpafJ50jsK0WKm1xvow2+16ARF//8B1yP4hc7sR4MFFhfXtcNVcvZHjBs21MeEyur5Sh7lIVsq/ixtwXnW7KCjzSrfsxJ45kecqjXm0VMNMvf7VE+ihzWYItlTknklx331kj2JXHQcJvZLRv+VPK3eCfZKBikfOBFboaUgGwLDWHINJiFhVyxNrnELx7xdMVSA0uvdwJYQLyFF3RzxhebGDTL7Gu8MIrWuPFPgA3+OfwRK3gCaRRnIvDqA7Pw/aVf9tJHvxo74nfWTNqx9JsV16TMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3586c7b8-38a7-5eee-4a19-8c0ba12d4fa8@suse.com>
Date: Thu, 25 May 2023 14:41:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH 12/15] build: avoid Config.mk's CFLAGS
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-13-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230523163811.30792-13-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7264:EE_
X-MS-Office365-Filtering-Correlation-Id: 286f12fb-30ff-414d-380d-08db5d1d5f71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yG3e7Rz5MySgxmVhn/2zQu2p1KwMegTq1yol1U41rQXooynUBvEObKKZu2cUyBsnVx5DpY9iEYhxTdramxXWYQhNtANlCmwFzEpMwQWIp7AZKtWKfA33kUn16kkKUKUvwdV2+AMqNbGJmbDKwYFZ2VLN+vh757xJMqXgdHMGWy2eecMWEl9i9Nj+9R9xMPpx7pF6GQ6hEoSLBB4Td89RAnOuso4uNRx3INj4CJ6rAfgKmd3314qcDRtiHQXU8begAbYCmusGNFbbe6zUmUQe1mlVs7FA6Ztlmr3k7U0uwNQVob3ShPDr8FNfRQ1IKwxsR2j7xMtMfIr+AcL2NFH0xq83uDhr1cVIJ3F+JapG+s9n0jIIyz8QkA0tvNanX5b7+qqgf0SYI0DCAFdwvd8yobBMHARFjSfXnLcw/fbBgy1B4gvUfG6y1pZoebi+pqbN6IBj6yUBFLBuFqhUthHoGL+ie0/s6xx1B4qwoqxs5uSXNAPEURaw2E42mYrDYOFrb1e8qZsj1i9+lFwfyO/Jp4sm5R0qzHU6yiR7FejRj7Q6qoMgzQvmaHOzJ25h9ZImwl5Ckq/tQ970TLO10Iu+4cSbemaWE8f7Nqk/RMWuYAhqD4nsHsB2dMXoOu1D2cL41Smhd7YYif3Xi/pvkbYu7w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(136003)(39860400002)(396003)(451199021)(36756003)(86362001)(31696002)(54906003)(316002)(4326008)(66946007)(66556008)(66476007)(6916009)(478600001)(6666004)(6486002)(8936002)(8676002)(7416002)(41300700001)(5660300002)(2906002)(38100700002)(53546011)(2616005)(6506007)(26005)(186003)(6512007)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blpqY3NkdzZHQVFlTjVwc29JMWl3ODZKbUVHcUZQSGpKdmg3cmxiaHM1c2V5?=
 =?utf-8?B?NzFScFd0ZjlMc2dHZFJRVkU4Y1VkS2ppMHpFdGxwZlVMZVVJVGhva3pEcklo?=
 =?utf-8?B?cjdkUG13SUh1b3JLcDNjSEcvUXpxSllkell4azlQQU5qOXg0bmhVK0x5amtK?=
 =?utf-8?B?cGdhcmNxN3lDY0QvNmJSR1BSMk91SHNyMWJaK2NpMUFUMVJ6V2hQdFI5Z1lJ?=
 =?utf-8?B?cktDeUNlZHZPUFp6YlRMcUd6eGpuUEtvSndvVnhzYlludDZuUHE4SVhzc3ps?=
 =?utf-8?B?TWhZM0MwYk4zMzk1cnU1VVY2NU8xSmkvajRDcFNFWkNOQ01vUWc5bmtOS3V4?=
 =?utf-8?B?S21RS3ZxMDVwRS9nK2lOMnpHSFEwUjl6dGNFdXlaQWh0VktiWU45ejhvSUhk?=
 =?utf-8?B?QzFJSTlZWGRXU1ZoKzdIUnlGWUxZY1RQZHF3STZFNU8xRTd4d2FCbUhyYUlB?=
 =?utf-8?B?TlNwVmdSUkVLOGlrR3NLQjZqc09HWUZTS2dkUXJGRXVlbmlMcXBOYkhhdTZ2?=
 =?utf-8?B?U05mM1F1MFRNYXowcEYvUmJtZGdRNDVDTHRPMVM4OGsyTmRwQVJ2TU1qMjN3?=
 =?utf-8?B?b1ZtU2NRSUxqK0hNWmZHMEVzdkxlMDllVExzWUgvcGw2UFNXUXRwSWFqR2JL?=
 =?utf-8?B?UFVZUGNReFdKdkN0eGRuUUg4ekhIYzB0byt1VDBJVTV4S2hKSTB6ZVNqcTRZ?=
 =?utf-8?B?ZWxNeXpVQnJ0WStXVm1yVzJYenhhczNxY3dEQ0NtQlVpa2gyUzd4OVVvVnR6?=
 =?utf-8?B?a3JEQXZJOHRuNGVYRkUzMlVkZFJjRTZWY0U5TFVYa0UwQVlqNmlidUZ4OFE2?=
 =?utf-8?B?K2owOGJXRWVHNitiZGJPVi9pOXVocDhyeTFBV28yREphL0lOT0tNU3ZuR3dJ?=
 =?utf-8?B?MngxQ29PeThvdy94SzMyUVQvWGtqanRyKzFCNk5td3dEZVVhaUVnMjFUTzRF?=
 =?utf-8?B?TVBJcU53M29pU28wQTJhaGRpZ2pqSnluZE5Jbk5pZ2pyZjRzTnJoeHFPc1l5?=
 =?utf-8?B?SGVESU5Cd1N1WUE1bDluR3JwL1BJSVVoTVpmWG5yVVJ3ZzFKeHQvWitLdUJj?=
 =?utf-8?B?bE83ZEIvT21ZUnNoVitLbzdwUG1xZHJUbkZQNHU5ZnJ2eisyTkJrc05VejBp?=
 =?utf-8?B?ZXk2dmlPZk9zN1ZvYXU5eVlLL2p0SjY0dGczUnZVQ3I3ZVB6dCt1ZzNsdjdI?=
 =?utf-8?B?RnlPWUhSWG90YnJpWmJuUUM2Z1pndlArWGR3aytORUd4QzRnaGE5K0pZS2dQ?=
 =?utf-8?B?NGZ2anJVVzZnYjZrUzJRTkJwb1lqTEJOVHlMZGx1b3psMkd6QXh4RnRlTm4x?=
 =?utf-8?B?aGpWekhNWFgzZGtwNm8zdzYxbXRtNC9TT1k3Tlp6cE16eFNQYlAxM2pqT0RZ?=
 =?utf-8?B?YUpQZ29FU01VMTBPWjI2YnYzbHhnSGdqWHd3TjJpYmp5MnJyaHhhZVBidEdk?=
 =?utf-8?B?OExVL1V0a3JUK0pXWmptaVdzRS9IdURQSUptSHNRWjExMmllTnNUMTRyODJ4?=
 =?utf-8?B?bnlRdHFIMzZEWHhKd0JJTkluMEZ2eDkyb2Z4cXByb2krUDJ0czlPZUdIMVE3?=
 =?utf-8?B?c1dUQTlqTVpXanZSQTBVMmdLYnNoMktZM0FMeWpCRjF6UHdJSzBnT1pTVWd2?=
 =?utf-8?B?TnVyMnhnMjNHb3Y1dFUvQ0dveFlMZk5Fd1pDUjZ1YUJjMG1Xa3RHS2wrbk51?=
 =?utf-8?B?YitIaHZuaWFienk5aDU1Y0RHeEdVazdyaEFQd3BreE1WMndNNWU2cEV4MlJ4?=
 =?utf-8?B?bFJ1LzJENFdHWDFBb0RTM3FFc2k2TmJhMzVLTXBuMUNGR3JmeEhLNkdWOHN6?=
 =?utf-8?B?ejZoWUIzVytWNjR2TEFZNFB5NmFEeHpvK0N1cDFZR25TejR4dTlSSkpwdUF0?=
 =?utf-8?B?alEyc3FkYksvNlFCODZnYzhGN3FmWlMvLy80MUZ2bWd6V3NQcVE1SlpEYkcr?=
 =?utf-8?B?MHd6L0FYY2RvRTlJdjArSVY1K3pvYVJYTUFYdndrODI2K2ZDSXRzWXA4eTZI?=
 =?utf-8?B?OG9vSmwwZUN4YytEYm04MG9pMHVzd1dKZFloNXowQS9Ka1VRSHVpQ0xJTGI2?=
 =?utf-8?B?Uk1WOXZqWDRGZEdySlhjc1lsWEdIRUFQVWF5d1RaeCtwWXEvVlYwSlkxSnN5?=
 =?utf-8?Q?1dYEzpAi5wpqlHTjkCNFcM/sO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 286f12fb-30ff-414d-380d-08db5d1d5f71
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 12:41:34.1075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RfouYWiKti57dVgMH7++k14OmXx5rY8Q7ux0iwZ/H0aBqObgto0pznDUSiiXwWbryF8XPK/l8ZkHcHAD6TTSxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7264

On 23.05.2023 18:38, Anthony PERARD wrote:
> The variable $(CFLAGS) is too often set in the environment,
> especially when building a package for a distribution. Often, those
> CFLAGS are intended to be use to build user spaces binaries, not a
> kernel. This mean packager needs to takes extra steps to build Xen by
> overriding the CFLAGS provided by the package build environment.
> 
> With this patch, we avoid using the variable $(CFLAGS). Also, the
> hypervisor's build system have complete control over which CFLAGS are
> used.

"..., apart from $(EXTRA_CFLAGS_XEN_CORE)", as you say ...

> No change intended to XEN_CFLAGS used, beside some flags which may be
> in a different order on the command line.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> 
> Notes:
>     There's still $(EXTRA_CFLAGS_XEN_CORE) which allows to add more CFLAGS
>     if someone building Xen needs to add more CFLAGS to the hypervisor
>     build.

... only here.

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -259,7 +259,16 @@ export KBUILD_DEFCONFIG := $(ARCH)_defconfig
>  export XEN_TREEWIDE_CFLAGS := $(CFLAGS)
>  
>  XEN_AFLAGS =
> -XEN_CFLAGS = $(CFLAGS)
> +XEN_CFLAGS =
> +ifeq ($(XEN_OS),SunOS)
> +    XEN_CFLAGS +=  -Wa,--divide -D_POSIX_C_SOURCE=200112L -D__EXTENSIONS__

So this (and the arch.mk additions) duplicate stuff we have in config/*.mk.
Such duplication isn't really nice. Setting AS, CC, etc also happens there,
and hence I expect you're going to duplicate that as well in a later patch.
Can't we massage (if necessary) the config/*.mk relevant to the hypervisor
build, so they can be included from xen/Makefile? That way all such basic
settings could remain in a central place, which has been well known for
many years.

Jan

