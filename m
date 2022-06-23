Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DA9557E18
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 16:48:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355050.582482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4O7F-0007rK-0U; Thu, 23 Jun 2022 14:47:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355050.582482; Thu, 23 Jun 2022 14:47:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4O7E-0007oP-Sb; Thu, 23 Jun 2022 14:47:28 +0000
Received: by outflank-mailman (input) for mailman id 355050;
 Thu, 23 Jun 2022 14:47:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRa/=W6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4O7D-0007oJ-ME
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 14:47:27 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70075.outbound.protection.outlook.com [40.107.7.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65ce5783-f303-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 16:47:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0401MB2272.eurprd04.prod.outlook.com (2603:10a6:800:31::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Thu, 23 Jun
 2022 14:47:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 14:47:24 +0000
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
X-Inumbo-ID: 65ce5783-f303-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IoFH3pZZ4lqrvF+OTrNy8mkkyh1a83NBcXBs+ZNN3W/urGN9xS6UmltavDXOxXVuCVY5NfcEPBtSoN0bF+Ep8l2krF16Dm6fO8ipT0jB8qoaPQhti6an3hNJ8H4Y0KgdNpW0oJPj4AXxtbralwqZ4E40mBjau6y9Ox+CamU9VDDjhpzfNxRlzzi3LVh2sp2frlgEXTZHbHKxXLCfM9ZN8yhKwVffxMRa4YiINq3e5Iv11MQlCOjbv+XpKPAg5iYtoYKu5AJornk70Jqj+QL5CiYuNC1SD3dSQCMUKbGSe8VJEttdsd0UKyQQyZIihbbXtdnDP0E6fHkIkDI7SB+3qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0xYgJsZj8PhxJorQckree2DX8wceOnDYAkphOBDn/4=;
 b=ZKt8aYcgr8YI9cRtntzLXOfDA38prAvtb6ulUoO20T8QxYxW6qDNvX0MIdZIkGdWKUymJJlmHf8qx170gqZpGPfWZwMUYoud46cc5EnlPgxO4MsaMimVFBCBo1SW5gO5Jpx0FepBUvS8kUIhZrlrOq8UNdtZkGVNTlh+ku9uoH/IHjmO87bX4qf8I3tju5/Inhx79Jz9pvBHEBqLBUVvyc/eNRLtPXLW3RDToVqBcsVlsTw5ybWn8DytSDCKTGAZWOqSvUmL5eccVhCpKdGOhfyKPmSMIdPm5aC1Suw2Umgq8P/ygJfAiyie43CHv+uJhLxpBZcdlv3N+Un+5aL7aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0xYgJsZj8PhxJorQckree2DX8wceOnDYAkphOBDn/4=;
 b=h3nkLCB8LVwH76DxHvaqA3PX3bcodV9yAWrKxYktxthFMFlrfzMJsgr8TG8Dn5t2TZOCozz6xtBS00Msw5VHWxDJ2h68L7iH7bn/bJ8gDD1ek9zCxd0Lj8W54YZJmg124Zm9lrD3YnZUp6cYmoNRsGKx15zeCWx5HDRMUoOuBj7XR9Q28cnQi+w6tF3pFrfMo3eDdVM1/TuGKWhxy1wtl4YyZ9Ofp8RrDfIio9+aQM0UXAxHMtMzBY51h+zfgLUrp/cwKb2UUQSA2OBeQn7lqhgFJXY/NJ5fqurFhVa9dAMwSK5hSPHswvU2GtNPRohW/cp2v1siTNosusZ8eI/OBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2a94902e-bc4f-26d1-b47d-abd4709226de@suse.com>
Date: Thu, 23 Jun 2022 16:47:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/6] x86/Kconfig: add selection of default x2APIC
 destination mode
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220623082428.28038-1-roger.pau@citrix.com>
 <20220623082428.28038-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220623082428.28038-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0133.eurprd04.prod.outlook.com
 (2603:10a6:20b:48a::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53ebc130-a22d-46c8-a0e0-08da55274906
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2272:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB22721B36DECA049CD3E9943CB3B59@VI1PR0401MB2272.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9kvMiaCWPMGREeIJOGgpgT3/rDHGN3BqwsT8OFb79rZDUJx+QmuSfmFiR8eew6TH9/norXDsyeYsetUoJj8aruK7kR/ULOCR2n/LB6u1UqXjLFUqZHazZBm8vo9cFw1GiRKHAOl1bEjNrTVKZUPYaAeu7hldErdx3gjE48aLSGOshGdy1yrU1lDZOfbe8QdKM+0YyWR1tqiTHLteeVmFjB0KTbKU60akACKlhTwbBU2IiHBMwt2pqaB8KjL4ZE2D/Mw533TMqHDmsOmc5UASiEDeB4mR1kYZf31pH1ct6VDnG4c5SUYvl/c+X+JR3MjCBr1NFOdKi2Wpursna619HoW+nwJLSy+gI8+zoUW/D2wrJJtSexgEs79N4z6E/fhjZa5fW6R/M58wWs5AqtMp6iyBTe64AEGa4NC4O5b07xBDx4WqgPTkoch4hSpTJ2JRS/gBjnIBgU51vSt8CRCNRttTWzoxd2CUr6POlejIpNIR8KcVN2tGrXGaGd7n9BScFZoXoXs3sNyVSqDyZbKeAgkRXqguyb2rvvhROsP4n11+KdadzcmojClLXCcFG5Xjv7x+xJJhuIEOj+HheZt7gdR662ohrNCi/sodk2FwEZ9IVVLqYS4CGxGm4ZDize9mzTD4YMOpX0aHlcaZS7Sp7ehqemQNCTeAKdONlWxdaEGichxTNj4/O9Nut6Jt952Fn6tRMlblSTg1jLKcxONsSrCE4K3Jx30dHGd+KJgDyvygAgBUHHxapDJ7GL0yDCbbvhZtSzZ/+wIBre4RmQ7zeIzQJPx5s6Ek5KN7+AVhQ04=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(346002)(376002)(396003)(39860400002)(6512007)(83380400001)(2616005)(316002)(5660300002)(186003)(66476007)(41300700001)(38100700002)(31686004)(66556008)(54906003)(26005)(6916009)(6506007)(53546011)(66946007)(31696002)(8936002)(8676002)(36756003)(6486002)(86362001)(2906002)(4326008)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVhONHMrODhKeTh2WlFYTWJGRXFaTzYzVGo1LzJDZ3lJQmR5VVkzaU96ZnF3?=
 =?utf-8?B?dGFDelBsRmw1SzhKUHRKMXlmVjBrS0Z3SlFMQUJCU0dKWW9XZkw0dFl4Tlpp?=
 =?utf-8?B?VDFIemNZZ3VwcXdtYXcvREtjRWZmUVBmMnV6SDFRbXV5dW5uaWZsajBQMnNB?=
 =?utf-8?B?V3RXWDAyRGFRWEp6dDRvL1BmQVcyN1R4R0FOVnhpNzhlZmIwN3o0VnMxajAw?=
 =?utf-8?B?bDJUckwva2hNMHJGdW5RYVhET3htVkNtdUI3Mmg2bC80K3hFWUFqL29DWFg1?=
 =?utf-8?B?UHBDR0xIWHhZYzFUMy9OUmJlYVBPamhBdHFtR0RDRytKVWtyb09OeEF3NUJo?=
 =?utf-8?B?b3YvQ3lEUDNBOEZGZGhDN1A5cGhac0VvMVVRZDFweDdPSTB4SWovVmMyS2xo?=
 =?utf-8?B?MTVySEs2Z2xXQ05iUXNnRFQ4Y0sxbFBhL3diQzd3bWJoS0FHcUNjaHRNdTkr?=
 =?utf-8?B?NHhPTDFoSStQY1pJNG9jVWd5NGY5OHNNbjI4TDFEZUt5YVZLOTNjK2xxTytB?=
 =?utf-8?B?TVV6a21RUUxKSS9nVVplTTZZQ2V4VFFucyt2dHRFNnBNREFtOFlHR0s0ZlBX?=
 =?utf-8?B?YXdtWnkvUG9iRFVzbGxydzlIdjNMRlBYQnlaU0t5bjloOE9uRGtJZnJCbVNF?=
 =?utf-8?B?UDZ0MHBJZHBDekdsU2NRald4d2xrWnF1QmZXTWhyem9IWUQxQUpxQXV5clpi?=
 =?utf-8?B?WEdpN2dEQmh0bDUrbWtmZHdYajRyNkpSakpacHRUbUdLS2syWVZVSks0RjdF?=
 =?utf-8?B?TjQ0STdFeGgySEttRUFLdTlKcWg2aUEyTWhva3gvU0YxeVBCbTNMY2kzclVN?=
 =?utf-8?B?czBGMXhwQVRUZDlzcXMvKzBWN3dKMjZ6QmNBa0Q0Ymd2T3VnWUxNS2lPdW9j?=
 =?utf-8?B?azFyRFhOZFVFdTkyQ1JvY0lnRldzNnNrNFFJUnpCR0RzdGsrdkhrMk9sZElY?=
 =?utf-8?B?OE1MUjhVMm5pNkdCSjRUN2ttVys2N2JzZjBuQ2dvQXJ1YndlMDliNWNvUTRK?=
 =?utf-8?B?cnR6MHp6NmdYczUwREV0TmZMdERmZEgrOWhYb25RNEVPaUowWGxlME1peUZ2?=
 =?utf-8?B?RHRLRjdsVWlYZXo0YkcrSDFHckkxZ3lHVmJVK3ZsaXFLU2FNdml6ZFJKOGxh?=
 =?utf-8?B?S2Vrck5QSjBRemhlaVFHSDh3NlZoZFREVi9HQWo2aEdNNWx6YzYvdE9EZWdO?=
 =?utf-8?B?SDFHbTV6YUZ2R1BaQVFtZENmQmRNVlVlaENjQlRSUGtoTmxDWGFXd1QrNi9M?=
 =?utf-8?B?QXAwRkkxdnNmaWt6L0J6VlNkTHpQeTY3QW9PSncybVkybmNUZEF4S0czMTFO?=
 =?utf-8?B?UlkybGwyVUhKRUZqcmRzTERGaWtFcGdaU21FdWo1cTlNVXVXNmwyMlhxRGdT?=
 =?utf-8?B?U0svK3c4RldXUU85KzVZYXBGQnVNZ2VDRDliYjFhbnpMUjc3THdyMDk5ZGtR?=
 =?utf-8?B?T3NTaHNiWjZmY1ZEOS9uZ2t3VC91dUhjbXRmdkpWejRIUVNBSk5NY0U2VlND?=
 =?utf-8?B?a2llblI3WFMvTnpFMmtjMDNDRHJnVmNYN2FRRDM4cTBGZGNFMDJEZmY3eVMw?=
 =?utf-8?B?aW5YZmF6SU9pWS9XVzJwblVCdGk0cUU2cHhoOU95eHgxc000RU91VXNRK0xP?=
 =?utf-8?B?S1l1UDQzaCs2T09GdHJYbjhpTCtjQ2JyRHp6M0Rld2E3RGhtdld1eThxMUd6?=
 =?utf-8?B?aC95OENFbW5SNmo3Z3JCVzZBWEF1VDdIMEttSXR2LzdSWWRKVnVtMXRlYWt3?=
 =?utf-8?B?R1lyWDRKZVA0Y0U5R0lPSHdtcTZZKzlZVys2NGdnVVF2aEZRcHdRTWUxN2hk?=
 =?utf-8?B?N1pYTnJua3JDbWcrN1JPV3JYY2dCWVQzTE1ZMjFSK0JoS2VLMWJGZy9rd3JR?=
 =?utf-8?B?TVhLR2xlYUtzU09FdGRHNkQxU1FYS2lacVB2TEpSMVp2aW92ZHhGajMwdVJQ?=
 =?utf-8?B?QW1RdURFTDBUT0NIQVc1ZmRzQ093ZGlOMU9EcDJya2FIVE9PdDJCMUxGZ3Ar?=
 =?utf-8?B?YjR3bW9iOHN2Vi9kbURzMFpldWJlbEJTQjRQRExsMW1wYTQ3YlJFZnZOMWVL?=
 =?utf-8?B?QTh3bjk0b3Y4T2c1WHlMSjZFQ0dINGxXQXpnY3A1RUViQ0RmWkt1bGcxYllw?=
 =?utf-8?Q?Tlv7A3A3treg5zYwVS4keoPQq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ebc130-a22d-46c8-a0e0-08da55274906
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 14:47:24.5165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SP3Rc+/KIFhInvcVuNh+mjTgj3g0BkRUYk0hTOJlOBodW52kTN5VIKd0HevUJXzwFGHM+t/krCo0rWUYJ2SEAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2272

On 23.06.2022 10:24, Roger Pau Monne wrote:
> Allow selecting the default x2APIC destination mode from Kconfig.
> Note the default destination mode is still Logical (Cluster) mode.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/Kconfig          | 29 +++++++++++++++++++++++++++++
>  xen/arch/x86/genapic/x2apic.c |  6 ++++--
>  2 files changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 1e31edc99f..f560dc13f4 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -226,6 +226,35 @@ config XEN_ALIGN_2M
>  
>  endchoice
>  
> +choice
> +	prompt "x2APIC default destination mode"

What's the point of using "choice" here, and not a single "bool"?

> +	default X2APIC_LOGICAL
> +	---help---

Nit: Please don't use ---help--- anymore - we're trying to phase out its
use as Linux has dropped it altogether (and hence once we update our
Kconfig, we'd like to change as few places as possible), leaving just
"help".

One downside of "choice" (iirc) is that the individual sub-options' help
text is inaccessible from at least the command line version of kconfig.

> +	  Specify default destination mode for x2APIC.
> +
> +	  If unsure, choose "Logical".
> +
> +config X2APIC_LOGICAL
> +	bool "Logical mode"
> +	---help---
> +	  Use Logical Destination mode.
> +
> +	  When using this mode APICs are addressed using the Logical
> +	  Destination mode, which allows for optimized IPI sending,
> +	  but also reduces the amount of vectors available for external
> +	  interrupts when compared to physical mode.
> +
> +config X2APIC_PHYS

X2APIC_PHYSICAL (to be in line with X2APIC_LOGICAL)?

Jan

