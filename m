Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C963F84A8
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 11:38:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172814.315345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJBpp-0007JS-Au; Thu, 26 Aug 2021 09:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172814.315345; Thu, 26 Aug 2021 09:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJBpp-0007H5-7J; Thu, 26 Aug 2021 09:38:09 +0000
Received: by outflank-mailman (input) for mailman id 172814;
 Thu, 26 Aug 2021 09:38:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJBpn-0007Gz-Vd
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 09:38:08 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 501c6b24-0651-11ec-a9de-12813bfff9fa;
 Thu, 26 Aug 2021 09:38:05 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-hRVukigTOOy_zi9h8OS7JA-1; Thu, 26 Aug 2021 11:38:03 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5902.eurprd04.prod.outlook.com (2603:10a6:803:ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Thu, 26 Aug
 2021 09:38:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 09:38:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR05CA0029.eurprd05.prod.outlook.com (2603:10a6:205::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Thu, 26 Aug 2021 09:38:00 +0000
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
X-Inumbo-ID: 501c6b24-0651-11ec-a9de-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629970684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ra5a9QMr+rJyeF6xti4JKgDr2uxYteWIHuSlUrh0bTM=;
	b=Tgxc/Y+i3BWaYAEJuFtDeIUAV4j+lQb8S30jAauDDJSSUfBDBwhEW4O7/+W10yzEQCFMOG
	jNR1soqIj7EArvNXT5kJbeRjTzcJ2Nv8jYVfBLOY7q2y8Zh6UjSe4diqV5fzEN4ThyE8pM
	j0okzU7ftXbWX6HzsMQcBoY8483kBKE=
X-MC-Unique: hRVukigTOOy_zi9h8OS7JA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nkjpVOfWH7a/w1dqKWBk6w14VEaab4SKsLS8h61vMwO1yC/JHgmgodfVjFBG4GszvMiRW8mO/Pwd6DK1DUK7ChK6ssY5QpBzSjyHHGr2crrEs/n/1WWNoEMbTw2XYm3NnHHrXJZW8Dx44aghzPFz3QkpCG4B4k6sc+f5WWMEoW7GKnHTzHmcncXLmXnWt5V4045d0fO3kiEWbl0OeUlsBi34g76mzQXcDOxIk2lCH11g3jZFce/dFGPP8stqnzewUws7nPJ7Gl0sF23b3HzHhFo/FDSdAuqs2LqrV3Pcn9X7ZPvfor7MKPdGrI/2+F8WVVUMVjIavaizUzs53tt3HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ra5a9QMr+rJyeF6xti4JKgDr2uxYteWIHuSlUrh0bTM=;
 b=OzBPL6/eL5DJq1BRd2kXkIR/VivqkfpzOQirzX2BSmxwmLWj8pEbMhnOKqWaWUGG6p2yTzyYtJX/5MVJVkrEml7bjtp03TwsrLiCXAp2Vu7qgTC2a/u49+olN3PydQIqaQxHI7b7lSs5pHJwUEib58gjaoxomBZjmoAxVPjRRt3ywa0raQ7cl7fGqILoq+kMhGQ+YP4TkMjdnia8NXk61etAr0nqjxWU7DKjlaNTxaP0L7WdHfOA9pdUulq3i8ovOf4FzaTurhTa+FZsgrpMIfDPJt6+RzvrwXHd7YTBocwooTX3jGbF8y1d4rSyepwS3JQxWAmk/ZGR2aqO0D4VyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 7/7] xsm: removing facade that XSM can be
 enabled/disabled
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 xen-devel@lists.xenproject.org
References: <20210805140644.357-1-dpsmith@apertussolutions.com>
 <20210805140644.357-8-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bf13f9a0-dff6-033e-3632-8fc4f0533a20@suse.com>
Date: Thu, 26 Aug 2021 11:37:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210805140644.357-8-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR05CA0029.eurprd05.prod.outlook.com (2603:10a6:205::42)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf051657-ed12-45b2-9309-08d96875326a
X-MS-TrafficTypeDiagnostic: VI1PR04MB5902:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB59025543BCA1C173AFEDBEFAB3C79@VI1PR04MB5902.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x274vVpeFiul74EsEII1x8RKOZg10NobBmQidWo47HrxWAaTwie45noR7MM65kOOARQocxCBNZ4LqRyXYV90/jwaCVir4FE/psSmolGLeVCtruW6f2pRWC90InYVaXG1KwsX99iFZjd4JNPzxOlR1DBTuy0oXzPbUknfr/bF5/bur18lbsGljUKCjOvBjtmsNVklmqyBcxkporl8rFOhgO5xt7EkMhNNiUwC+IJu6gJsZcadrA+JzYCUJ2HH0jIsMor2IPPVPK0BvVUaX+6fZBTLmhE/pNKEYjwmof6HBjtvfPOJJ7t+6Ls6FQOCq3ZOujMncjYzcc/kg/Zvz2agKLY/pWEXMtK3VbW0lNi4bPTc0YMLW3qSYQj/jcGoiJQ0Jjt4T3eK5baNwEUdtSBZATdL8K7zxqqwGEcaqCv9OeN8UvNZn841eESREanUV+hXp9Hup2V69uIpX0KqzJ4WM92qonYqJw68Ooz4ixVIIPyebvYSQhNQwPa66i5b7oefhUaCRVw8i2pqgHnPkvQwkOLDLUcEwCwhG0oG/pGEdbrj92+2ofrQ2XZexNTgOc4UgWhX240YcSR6EPKYuTRyzSFJLEap62Qs5Ftg/fYMzZ7MdvXUQFtiLr4k03+P5JkXBr0Sv0MoUfWYJkREEZZq40YBqLnQp55Fkj8YQ2r8Z3Oyk+LDLtSTPxGoajpo+OrOlltz5Ljsf+PHG4iUpUX+M3iFeB/DmRFfeqQ2ivJaa/+KT+8z+rcXCU16abcofSC0AqXD7k4dQAijpxTxTLBqDoiigo26K7KVPKDPs80J3i1PKKf7iqRrzj6gVO0tx+ys
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39850400004)(376002)(366004)(136003)(346002)(38100700002)(4326008)(83380400001)(6486002)(54906003)(31686004)(16576012)(316002)(26005)(8676002)(66946007)(66476007)(66556008)(8936002)(2906002)(6916009)(36756003)(956004)(53546011)(2616005)(186003)(30864003)(31696002)(86362001)(478600001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q00vdWhXZ0t0NlJ5eXE0SE9lbExhSXEvWkZhbTUxdWhBMHdNeFpaOEEyODdp?=
 =?utf-8?B?Tk9yQmpMQUkwOXdvL1VzT2tCWjhrbVUxVVFUNUphTDU0enFjbUcvWms4dVRq?=
 =?utf-8?B?NTFYS29CakRwcWlodE5ETnpKOCswSTVVQ0VkK21rNElNKy9VeTUvUk1QTU1S?=
 =?utf-8?B?dVN4RGRHdmJnby9QdlJ3ZkJaLzhLNHpTZ09pWkZiaFV6R0EyOVh2ZGYyR2Rq?=
 =?utf-8?B?TElndXJlK0dGZ2x6dVRGaTE0MlErZ242cFJWQ0t5SlYxa3pDUVNFeFlvM2U1?=
 =?utf-8?B?M09IZkJFUmNDQXA1eHNnUXVXS0J2UjBCaVpSSzF1SjBGZG5zdHhvQ2U0UGVE?=
 =?utf-8?B?L2ZENThLVkQ4a3AvRzlGVWdJN3NPRWxNVWh1NG9VbDg3UFQvemNZQm0rNko2?=
 =?utf-8?B?YkwrMjJHdkZSSUdmZEZNUmc5cVBjdEV3eVJmTlhac3BHeGtONUoydWNuanM4?=
 =?utf-8?B?LzRzZ3dYbXFFZE9ab2FhbFQycnpaaFhTVW9SdDNIWUxFYS9JWklhL0hFSG5J?=
 =?utf-8?B?L2tseU5hS1VlUjBGUFo5TFRMdndtb3YyR2gzS2x6ZXJpWGVWUlJEZ2tteHpX?=
 =?utf-8?B?YVlZcEFzcnBtTTIrQldtb0ZvR2wvTktmMjQyY1JGQ29NVnlHQkJhUUwrZG1R?=
 =?utf-8?B?MnprNDROYzNyRjN4MXlaU3hhVkM5WG9lc0s2US9icTE2ZUtjM0RaNVVhSnkv?=
 =?utf-8?B?OXBxQTcyRzdDcDZjWS82d0NQeTVqZnBPWE9RbWpMVUtmL1NCejlCd2ZzbGRH?=
 =?utf-8?B?UC96N3F6bXVqQVd1Z0I0SDlQYi9TcjJVbndjRWEwS2Q1YmFoYS9oT0ZuMzdE?=
 =?utf-8?B?NDZsOUsyU1ZyM0VtN3g3eHlBb1I4RXRkYTRrZHB0NkxxOERmN0dCTDNWZUt3?=
 =?utf-8?B?dWFVSmlaYlZocjFtb1lBenNvMGNvdm85dUs0VXNCL2dONmVEV2ZxR2pqbjlH?=
 =?utf-8?B?cDhFMXVwU3B2S3E3WG9BdVZ6VVRGU3kwQXJCN0VZcEZKNGhNUi9JSGRpcDRU?=
 =?utf-8?B?QWdNdU1QYlpRM0U4YVozMnJvZklXOVphVzRTWXkrSEdQeExUM1hlOHVYMTVQ?=
 =?utf-8?B?WXk1ejl0T01sQmtSNkwxQXMyVEdZNU5tSWFza0krbktEQmRBbHFJR1VkU2R5?=
 =?utf-8?B?RWpNZlpFVmhQN2grcHhSMDNJZFdYVkhsT3Q1SjBuTUthUGlDLzl4ejEweS83?=
 =?utf-8?B?Q2N5SER0NjZ3OWJzM04xRTI3QmVuWitYd2h2MDBDSVQ0eTVCVnQvSjRhY094?=
 =?utf-8?B?MkNDS2Q2TW0rWVNwSDJEa0NLTEIrdUxhSHpjbU1zNDJEcVg2ZGtPODIzUE80?=
 =?utf-8?B?SCtrVDFyT2RMcUhsY1ZyZWw2eGU5YlZkQ0lvckRPeUVYL1Q5ZVpNS25wM1Fv?=
 =?utf-8?B?YUdteXN4UldMd1RtT2EvMklJU1IvTXh1WTB2S0tSRjVCUUJCd3FrdDNFZXRP?=
 =?utf-8?B?WTF3L0ZTVjRHSlBmRlZ0eUg5UmM5R1Z0Q2lYQUtzYlN5MzBKOVVPRjRsN3Nk?=
 =?utf-8?B?eGtHd292VkRvTk9rMWhuY25YaXdWUHVVUkt0S1NSdWRvTkJhZ3NhV2d6Z3d5?=
 =?utf-8?B?UjUrTDZqNWxWSVZ2U3BlSGRDOXR6bVBRSXBwNVFDSUJFOGk3QU1Pd2pxL3FW?=
 =?utf-8?B?QzhldXNBOUhJVGFZVlVnUG5XTnNBTWRjcUowWjNVWXN5UUo2cDZoQXBqMUtu?=
 =?utf-8?B?UFpFZ1NxMU8rVWJrditSMVhTRlBubXJRVTJ6WElacE5ISzdxRlQ0YjBxUzYr?=
 =?utf-8?Q?9REUNIUW1M2PDDxNS1k6TpMzhVOVbAJHapTz2Wd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf051657-ed12-45b2-9309-08d96875326a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 09:38:01.7092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tfum5fr8cQLnaMWSHGbvGuUgUjNq4v250RLO2bfX+IBnoKn1P63/mCxZEfDxTw1l5SHXzT6KUrc7Sm/vxD3Oag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5902

On 05.08.2021 16:06, Daniel P. Smith wrote:
> The XSM facilities are always in use by Xen with the facade of being able to
> turn XSM on and off. This option is in fact about allowing the selection of
> which policies are available and which are used at runtime.  To provide this
> facade a complicated serious of #ifdef's are used to selective include

Nit: It took me a moment to realize that the sentence reads oddly because
you likely mean "series", not "serious".

> different headers or portions of headers. This series of #ifdef gyrations
> switches between two different versions of the XSM hook interfaces and their
> respective backing implementation.  All of this is done to provide a minimal
> size/performance optimization for when alternative policies are disabled.
> 
> To unwind the #ifdef gyrations a series of changes were necessary,
>     * replace CONFIG_XSM with XSM_CONFIGURABLE to allow visibility of
>       selecting alternate XSM policy modules to those that require it
>     * adjusted CONFIG_XSM_SILO, CONFIG_XSM_FLASK, and the default module
>       selection to sensible defaults
>     * collapsed the "dummy/defualt" XSM interface and implementation with the
>       "multiple policy" interface to provide a single inlined implementation
>       that attempts to use a registered hook and falls back to the check from
>       the dummy implementation
>     * the collapse to a single interface broke code relying on the alternate
>       interface, specifically SILO, this was reworked to remove the
>       indirection/abstraction making SILO explicit in its access control
>       decisions
>     * with the change of the XSM hooks to fall back to enforcing the dummy
>       policy, it is no longer necessary to fill NULL entries in the struct
>       xsm_ops returned by an XSM module's init

It would be nice if some of this could be split. Is this really close to
impossible?

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -200,23 +200,15 @@ config XENOPROF
>  
>  	  If unsure, say Y.
>  
> -config XSM
> -	bool "Xen Security Modules support"
> -	default ARM
> -	---help---
> -	  Enables the security framework known as Xen Security Modules which
> -	  allows administrators fine-grained control over a Xen domain and
> -	  its capabilities by defining permissible interactions between domains,
> -	  the hypervisor itself, and related resources such as memory and
> -	  devices.
> -
> -	  If unsure, say N.
> +config XSM_CONFIGURABLE
> +    bool "Enable Configuring Xen Security Modules"

Is there a reason to change not only the prompt, but also the name of
the Kconfig setting? This alone is the reason for some otherwise
unnecessary code churn.

Also please correct indentation here.

>  config XSM_FLASK
> -	def_bool y
> -	prompt "FLux Advanced Security Kernel support"
> -	depends on XSM
> -	---help---
> +	bool "FLux Advanced Security Kernel support"
> +	default n

I don't understand this change in default (and as an aside, a default
of "n" doesn't need spelling out): In the description you say "adjusted
CONFIG_XSM_SILO, CONFIG_XSM_FLASK, and the default module selection to
sensible defaults". If that's to describe this change, then I'm afraid
I don't see why defaulting to "n" is more sensible once the person
configuring Xen has chosen the configure XSM's (or XSM_CONFIGURABLE's)
sub-options. If that's unrelated to the change here, then I'm afraid
I'm missing justification altogether. (Same for SILO then.)

> +	depends on XSM_CONFIGURABLE
> +	select XSM_EVTCHN_LABELING

Neither this nor any prior patch introduces an option of this name,
and there's also none in the present tree. All afaics; I may have
overlooked something or typo-ed a "grep" command.

> @@ -265,14 +258,14 @@ config XSM_SILO
>  	  If unsure, say Y.
>  
>  choice
> -	prompt "Default XSM implementation"
> -	depends on XSM
> +	prompt "Default XSM module"
>  	default XSM_SILO_DEFAULT if XSM_SILO && ARM
>  	default XSM_FLASK_DEFAULT if XSM_FLASK
>  	default XSM_SILO_DEFAULT if XSM_SILO
>  	default XSM_DUMMY_DEFAULT
> +	depends on XSM_CONFIGURABLE

With the larger set of "default" lines I'd like to suggest to keep
"depends on" ahead of them.

> @@ -282,7 +275,7 @@ endchoice
>  config LATE_HWDOM
>  	bool "Dedicated hardware domain"
>  	default n
> -	depends on XSM && X86
> +	depends on XSM_FLASK && X86

This change is not mentioned or justified in the description. In fact
I think it is unrelated to the change here and hence would want breaking
out.

>  	---help---

As you're changing these elsewhere, any chance of you also changing
this one to just "help"?

> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -19,545 +19,1023 @@
>  #include <xen/sched.h>
>  #include <xen/multiboot.h>
>  #include <xsm/xsm-core.h>
> -
> -#ifdef CONFIG_XSM
> +#include <xsm/dummy.h>
> +#include <public/version.h>
>  
>  extern struct xsm_ops xsm_ops;
>  
> -static inline void xsm_security_domaininfo (struct domain *d,
> -                                        struct xen_domctl_getdomaininfo *info)
> +static inline void xsm_security_domaininfo(
> +    struct domain *d,
> +    struct xen_domctl_getdomaininfo *info)
>  {
> -    alternative_vcall(xsm_ops.security_domaininfo, d, info);
> +    if ( xsm_ops.security_domaininfo )
> +        alternative_vcall(xsm_ops.security_domaininfo, d, info);

Here and everywhere else, when !XSM_CONFIGURABLE you now needlessly
force NULL checks to occur which are never going to be true. There's
then also the dead indirect call and the associated patching data. I
think this wants hiding in another pair of wrappers, which simply
expand to nothing when !XSM_CONFIGURABLE - perhaps xsm_vcall() and
xsm_call().

>  }
>  
> -static inline int xsm_domain_create (xsm_default_t def, struct domain *d, u32 ssidref)
> +static inline int xsm_domain_create(xsm_default_t action, struct domain *d,
> +                                    u32 ssidref)

It would be nice if you kept on converting u32 -> uint32_t as you did
in earlier patches.

>  {
> -    return alternative_call(xsm_ops.domain_create, d, ssidref);
> +    if ( xsm_ops.domain_create )
> +        return alternative_call(xsm_ops.domain_create, d, ssidref);
> +
> +    XSM_ASSERT_ACTION(XSM_HOOK);

Any reason not to put these assertions first in the functions?

> +    return xsm_default_action(action, current->domain, d);
>  }

Since

static inline int xsm_domain_create(xsm_default_t action, struct domain *d,
                                    uint32_t ssidref)
{
    XSM_ASSERT_ACTION(XSM_HOOK);
    return xsm_call(xsm_ops.domain_create, d, ssidref);
    return xsm_default_action(action, current->domain, d);
}

won't work, and since integrating "return" into xsm_call() also would't
yield a sufficiently clear result:

static inline int xsm_domain_create(xsm_default_t action, struct domain *d,
                                    uint32_t ssidref)
{
    XSM_ASSERT_ACTION(XSM_HOOK);
    xsm_call(xsm_ops.domain_create, d, ssidref);
    return xsm_default_action(action, current->domain, d);
}

(as control flow would be unobvious), the xsm_default_action() invocation
likely would also need integrating into xsm_call() then.

Unless there's some obstacle, this would eliminate a whole lot of code
redundancy.

> -static inline int xsm_set_target (xsm_default_t def, struct domain *d, struct domain *e)
> +static inline int xsm_set_target(xsm_default_t action, struct domain *d,
> +                                 struct domain *e)
>  {
> -    return alternative_call(xsm_ops.set_target, d, e);
> +    if ( xsm_ops.set_target )
> +        return alternative_call(xsm_ops.set_target, d, e);
> +
> +    XSM_ASSERT_ACTION(XSM_HOOK);
> +    return xsm_default_action(action, current->domain, NULL);
>  }

While benign because xsm_default_action() does nothing for XSM_HOOK, I
think there's an inconsistency here which rather wants correcting (in
a prereq patch): The default hook should have been passed consistent
arguments, no matter whether used because of !XSM or because of the
module in use left the hook unset.

Of course such anomalies are much easier to notice (outside of review
of patches introducing such) with you now placing both invocations
next to each other.

> -static inline int xsm_evtchn_interdomain (xsm_default_t def, struct domain *d1,
> -                struct evtchn *chan1, struct domain *d2, struct evtchn *chan2)
> +static inline int xsm_evtchn_interdomain(xsm_default_t action,
> +                                         struct domain *d1,
> +                                         struct evtchn *chan1,
> +                                         struct domain *d2,
> +                                         struct evtchn *chan2)
>  {
> -    return alternative_call(xsm_ops.evtchn_interdomain, d1, chan1, d2, chan2);
> +    if ( xsm_ops.evtchn_interdomain )
> +        return alternative_call(xsm_ops.evtchn_interdomain, d1, chan1, d2,
> +                                chan2);
> +
> +    XSM_ASSERT_ACTION(XSM_HOOK);
> +    return xsm_default_action(action, d1, d2);
>  }

There's another anomaly here: The first argument to xsm_default_action()
typically is current->domain in similar functions. Here d1 gets passed in
despite always being current->domain. I think the unnecessary parameter
wants dropping (again in a prereq patch)) from the wrapper and hook, to
avoid giving the wrong impression of both domains potentially being remote
ones.

> -static inline int xsm_evtchn_send (xsm_default_t def, struct domain *d, struct evtchn *chn)
> +static inline int xsm_evtchn_send(xsm_default_t action, struct domain *d,
> +                                  struct evtchn *chn)
>  {
> -    return alternative_call(xsm_ops.evtchn_send, d, chn);
> +    if ( xsm_ops.evtchn_send )
> +        return alternative_call(xsm_ops.evtchn_send, d, chn);
> +
> +    XSM_ASSERT_ACTION(XSM_HOOK);
> +    return xsm_default_action(action, d, NULL);

This again looks wrong (and again is benign only because XSM_HOOK means
xsm_default_action() ignores the other function parameters), wanting to
follow the usual

    return xsm_default_action(action, current->domain, d);

pattern instead.

> -static inline int xsm_evtchn_reset (xsm_default_t def, struct domain *d1, struct domain *d2)
> +static inline int xsm_evtchn_reset(xsm_default_t action, struct domain *d1,
> +                                   struct domain *d2)
>  {
> -    return alternative_call(xsm_ops.evtchn_reset, d1, d2);
> +    if ( xsm_ops.evtchn_reset )
> +        return alternative_call(xsm_ops.evtchn_reset, d1, d2);
> +
> +    XSM_ASSERT_ACTION(XSM_TARGET);
> +    return xsm_default_action(action, d1, d2);

See xsm_evtchn_interdomain() above.

> -static inline int xsm_grant_mapref (xsm_default_t def, struct domain *d1, struct domain *d2,
> -                                                                uint32_t flags)
> +static inline int xsm_grant_mapref(xsm_default_t action, struct domain *d1,
> +                                   struct domain *d2, uint32_t flags)
>  {
> -    return alternative_call(xsm_ops.grant_mapref, d1, d2, flags);
> +    if ( xsm_ops.grant_mapref )
> +        return alternative_call(xsm_ops.grant_mapref, d1, d2, flags);
> +
> +    XSM_ASSERT_ACTION(XSM_HOOK);
> +    return xsm_default_action(action, d1, d2);

Again (more similar grant ones follow).

> -static inline int xsm_memory_adjust_reservation (xsm_default_t def, struct domain *d1, struct
> -                                                                    domain *d2)
> +static inline int xsm_memory_adjust_reservation(xsm_default_t action,
> +                                                struct domain *d1,
> +                                                struct domain *d2)
>  {
> -    return alternative_call(xsm_ops.memory_adjust_reservation, d1, d2);
> +    if ( xsm_ops.memory_adjust_reservation )
> +        return alternative_call(xsm_ops.memory_adjust_reservation, d1, d2);
> +
> +    XSM_ASSERT_ACTION(XSM_TARGET);
> +    return xsm_default_action(action, d1, d2);

Again (more similar memory ones follow).

> -static inline int xsm_memory_pin_page(xsm_default_t def, struct domain *d1, struct domain *d2,
> -                                      struct page_info *page)
> +static inline int xsm_memory_pin_page(xsm_default_t action, struct domain *d1,
> +                                      struct domain *d2, struct page_info *page)
>  {
> -    return alternative_call(xsm_ops.memory_pin_page, d1, d2, page);
> +    if ( xsm_ops.memory_pin_page )
> +        return alternative_call(xsm_ops.memory_pin_page, d1, d2, page);
> +
> +    XSM_ASSERT_ACTION(XSM_HOOK);
> +    return xsm_default_action(action, d1, d2);

This one has the same issue, but is more interesting: There's no
similar hook/check for unpinning a page (nor does the same check
get re-used there). Plus it's x86 (more precisely PV) specific.

> -static inline int xsm_map_gmfn_foreign (xsm_default_t def, struct domain *d, struct domain *t)
> +static inline int xsm_map_gmfn_foreign(xsm_default_t action, struct domain *d,
> +                                       struct domain *t)
>  {
> -    return alternative_call(xsm_ops.map_gmfn_foreign, d, t);
> +    if ( xsm_ops.map_gmfn_foreign )
> +        return alternative_call(xsm_ops.map_gmfn_foreign, d, t);
> +
> +    XSM_ASSERT_ACTION(XSM_TARGET);
> +    return xsm_default_action(action, d, t);

This one is also interesting: There's no check at all here that
current->domain has any permissions towards d or t. Interestingly
even flask_map_gmfn_foreign() doesn't check this.

> -static inline int xsm_console_io (xsm_default_t def, struct domain *d, int cmd)
> +static inline int xsm_console_io(xsm_default_t action, struct domain *d, int cmd)
>  {
> -    return alternative_call(xsm_ops.console_io, d, cmd);
> +    if ( xsm_ops.console_io )
> +        return alternative_call(xsm_ops.console_io, d, cmd);
> +
> +    XSM_ASSERT_ACTION(XSM_OTHER);
> +    if ( d->is_console )
> +        return xsm_default_action(XSM_HOOK, d, NULL);
> +#ifdef CONFIG_VERBOSE_DEBUG
> +    if ( cmd == CONSOLEIO_write )
> +        return xsm_default_action(XSM_HOOK, d, NULL);
> +#endif
> +    return xsm_default_action(XSM_PRIV, d, NULL);

Same implication of d == current->domain here again. I guess I'll
stop enumerating further ones.

> -static inline int xsm_pci_config_permission (xsm_default_t def, struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t end, uint8_t access)
> +static inline int xsm_pci_config_permission(xsm_default_t action,
> +                                            struct domain *d,
> +                                            uint32_t machine_bdf,
> +                                            uint16_t start,
> +                                            uint16_t end,
> +                                            uint8_t access)
>  {
> -    return alternative_call(xsm_ops.pci_config_permission, d, machine_bdf, start, end, access);
> +    if ( xsm_ops.pci_config_permission )
> +        return alternative_call(xsm_ops.pci_config_permission, d, machine_bdf, start, end, access);

Nit: Line length.

> -static inline int xsm_pmu_op (xsm_default_t def, struct domain *d, unsigned int op)
> +static inline int xsm_pmu_op(xsm_default_t action, struct domain *d,
> +                             unsigned int op)
>  {
> -    return alternative_call(xsm_ops.pmu_op, d, op);
> +    if ( xsm_ops.pmu_op )
> +        return alternative_call(xsm_ops.pmu_op, d, op);
> +
> +    XSM_ASSERT_ACTION(XSM_OTHER);
> +    switch ( op )
> +    {
> +    case XENPMU_init:
> +    case XENPMU_finish:
> +    case XENPMU_lvtpc_set:
> +    case XENPMU_flush:
> +        return xsm_default_action(XSM_HOOK, d, current->domain);
> +    default:
> +        return xsm_default_action(XSM_PRIV, d, current->domain);

Urgh - isn't this the wrong way round? (Luckily vPMU isn't security
supported, so no XSA would be needed.)

> --- a/xen/xsm/Makefile
> +++ b/xen/xsm/Makefile
> @@ -1,6 +1,5 @@
>  obj-y += xsm_core.o
> -obj-$(CONFIG_XSM) += xsm_policy.o
> -obj-$(CONFIG_XSM) += dummy.o
> +obj-y += xsm_policy.o

Why would this now need compiling in all cases?

> --- a/xen/xsm/silo.c
> +++ b/xen/xsm/silo.c
> @@ -17,6 +17,7 @@
>   * You should have received a copy of the GNU General Public License along with
>   * this program; If not, see <http://www.gnu.org/licenses/>.
>   */
> +#include <xsm/xsm-core.h>
>  #include <xsm/dummy.h>

As already mentioned elsewhere - where possible please arrange #include-s
alphabetically.

> @@ -124,16 +122,12 @@ static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
>          break;
>      }
>  
> -    /*
> -     * This handles three cases,
> -     *   - dummy policy module was selected
> -     *   - a policy module does not provide all handlers
> -     *   - a policy module failed to init
> -     */
> -    xsm_fixup_ops(&xsm_ops);
> -
> -    if ( xsm_ops_registered != XSM_OPS_REGISTERED )
> +    if ( xsm_ops_registered != XSM_OPS_REGISTERED ) {

Nit (style): Brace goes on its own line.

Jan


