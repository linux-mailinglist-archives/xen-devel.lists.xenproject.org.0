Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E59AE6CBB25
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 11:36:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515611.798652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph5kZ-0006jr-Kt; Tue, 28 Mar 2023 09:36:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515611.798652; Tue, 28 Mar 2023 09:36:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph5kZ-0006gU-HX; Tue, 28 Mar 2023 09:36:19 +0000
Received: by outflank-mailman (input) for mailman id 515611;
 Tue, 28 Mar 2023 09:36:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ph5kY-0006gM-22
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 09:36:18 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe02::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbc0bee2-cd4b-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 11:36:15 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DUZPR04MB10061.eurprd04.prod.outlook.com (2603:10a6:10:4df::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 09:36:13 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 09:36:13 +0000
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
X-Inumbo-ID: fbc0bee2-cd4b-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqfCpWIAAop3zfWNI6BZjiVLtNYPw+5mMUZraOtUkHxXxQG+esScG3dt99upcOgJlgDkt0Ro/3VYsYwfcqDwV5CQLJTBvXArGYcjKMD2zwt6mV0RHrVMxd8yO/OnD83vNip8c65980LL20De5OxiwFAsApXDw+gucr4LlxcLuv1rG+YX2QmtL660a7KxdTAf/WWUtvx7Awg0JHCstO2pb6g7H7RfwVINeqQHzcwBUUa4wnKm09oh2NLlV0VTQANWTKTJ9U5/7T8tFabGyuZPemCe9ZytAwRwuHJcaLx53YbWSiN0G0JlX6DKeWq8y/Yp4F0ooqZQeFMixHpGrzZFtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuXyElF4pj7hsRw9xnoJwDhC/3+/G/RnYOgwBJdu7mo=;
 b=XlIfkICH/RLAJTjerPRuuxT6ONraGmMuD5wZ0wnX+Y+ICFBbw2Ob8pDSVPaL5ay/746rxPDMnSMV5lDmgeAQxd03aHAFBFksg9YUMLbgtVOC453aRsG1/Z0ts6OaS6S1qQyhs14UBkN2gLOfeKovBbXDcBuT3vVYVxNCGlytWQFCN4z488TkS6nZtJ5fW/pmn1lgb6n0qlTm3hdfzieyIC46WdakK4ML86lWgh7kEQEuPINZeu/DAXJjv0Rm8QXyr9kErgGHzQlA3UNgN3CzWNVA8cOYemX8GXMixJyIODqcj+4gc811tbvHjDQnVotjPqkKnsn/Od2tFTHjsWhtdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuXyElF4pj7hsRw9xnoJwDhC/3+/G/RnYOgwBJdu7mo=;
 b=nfxI5gIQMnf983ItK+FLqJR/9cDLAHKNNdqGTpiKnqhHYNd7Df+nmJ17CBKJ4bBeR5jmY6mngqB/hXw66EpzP9ih3wVoe4lSY0Zl6Dn73xIs8Y9pngBtMyRyH9uefdmlu9NQiztfP3FmVsB2L6qicXSi+ZY4QTagJNkySQD47NQqw0gnktej/OAixbe6ht4LjKXHAAyFl94vtTkZNPR6bFu3MzWRyvksf3arQ4+jLWXT2LY4THk37HHwqRT1kCEgvMn2evFjd/dScziJTxTREa4jItVtoVj7xOqLMuPnZ6yhZtOxbpoi2VLBANztqY8I/v3xNW/dpuWeIzCgEhV34w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <71f3e78a-aa70-a12f-8380-ab8806cefd39@suse.com>
Date: Tue, 28 Mar 2023 11:36:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 02/12] xen/arm: add SVE vector length field to the
 domain
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230327105944.1360856-1-luca.fancellu@arm.com>
 <20230327105944.1360856-3-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230327105944.1360856-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::9) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|DUZPR04MB10061:EE_
X-MS-Office365-Filtering-Correlation-Id: ee5c534c-2eba-4c73-8a0e-08db2f6fdf31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ydd7dalE5PfChT6xATElp2dyxx8ZeKZHGx3tBmu/tBslUqt17rzCun7L2k2ATrUHZ9+VFsjhvzAhl4VCTN3CVE7vvW2QULGlnfWe4A5QfAmmOoywEkUdYR+CKC3AU3xlkYrhTQMRhs4Fw1VXUUk2Vnofe217orlKUf3YvmAF0oJ90RjQKJjONV8Dt+Ik65o+Li4sX2ysx4UpdN7GwR5h8yIJGy9udXfKvzhaAUR4co8UCDcVKfe1uxDd4QsszoK99oEl/xQHUxJttJp9p/ohDlQLVv86zvniw479ur1I8gJfa7fiYDeF2OlE1Jb5SFd9/ep8JtjauY9sfR9cm3arMgtirkmk09srjGJZl/nk6TUdr+HLCpn4v62yuRiZw2G2fBeCxv5TT+l6gQHO6F4EqPHq7qCyvo2mjCZyPZ3ea2m0ZbExdbFYCddbgqkm39lj5C0k/FEVAULm3yhjJiFlndLcLZvzsDWN1YlnkclQ7RjF1irEVnZoNbuUW3qibUeQ8+tkqHeSeXl3xy658h16x1dgJY2iDG8OuNRx7zsL2uksGB4QY7SmUMD2LT+Mk0hV+a/n8O2nnRncUylY79jmKGr3OTRF9/VqLmhdBfcPYD5eNlnz6p8Ic3RauWbfw1ZUCr7ZRVVVucACnDjqM1nXpg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(346002)(376002)(396003)(136003)(451199021)(2616005)(6486002)(53546011)(36756003)(6506007)(26005)(186003)(6512007)(31696002)(86362001)(41300700001)(66946007)(8676002)(66556008)(66476007)(6916009)(4326008)(8936002)(38100700002)(7416002)(5660300002)(316002)(54906003)(478600001)(31686004)(83380400001)(2906002)(66899021)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlRzeDQrYjJ2Yk5BcFRqYkJOSVM1RnFaTVliYnhsbUFhT2dRWDU5NnhJVDVo?=
 =?utf-8?B?M1UwdXlnL0Y2NnREVmV0U0JKT041RVZ4dEhUVVdHU3BCUUZEYlJLS1JsNFZq?=
 =?utf-8?B?UG9yRkhrVDJJMDhhdXQ4aDJ6YlI0WlN2Z281NWZIV212SDczS3B4M05ycUhx?=
 =?utf-8?B?NklmY2Ercy93ZmZDTkh4TjNVa0lycDRVcTJJcytUbkhQUkUzMDJheFRkVWlG?=
 =?utf-8?B?T2ZtM2tNVmhuWG1QWCtxV1VqQ2c5QkY2aFhndTZud1RKUFJXU3ZFWVJjRGUy?=
 =?utf-8?B?SW1IaUYvY2dpSExTSFJQNHNzV3hacGpzOW5SV3NuQk5sRzZJYUM0bXFFWlc1?=
 =?utf-8?B?T2pxcHVQK2pEaTNkYll5SzJHaGI3V0M2cU9rb3RreDA0MnBxZGVPS0k4aDU1?=
 =?utf-8?B?elY2V0pGQU1mTjBOdUZ6QmpkT2E2TCswS0hDZnFyRFBJcWpmZVh0ZzRObjNN?=
 =?utf-8?B?SFRpODk5blh1QXh4b2NrMGJzeE9QRWxtMkkxUFNwZFU0KzhoQ3N4eDlSNHNP?=
 =?utf-8?B?bnBBaW05Q0JvS2pnTy9HbVprYzllUFdRYnJRbWJKQlNMOU5ZdzNHdGRrckNv?=
 =?utf-8?B?U2J2dzRQWjlsZEppM21GQmdvZXBBRVJONFpzMUhib2dnUnpBMks3MUNuVVFT?=
 =?utf-8?B?T0V3VkdmNGVacWlQaWFMeG12WnMrRDRhbGwxb05qMlJWQzlJU0lMQ0N6MVlv?=
 =?utf-8?B?ajNOYUdmS1F1VWUvbXRaV21xalpCbmpFNEFCeUNPdTE0RDRrQm15eXU5cXQ3?=
 =?utf-8?B?VWppZldmVDlsOXZXc3VhSGwxOXlKRmlGYW1KWlFPVzBTY3B1Y3BzN2hiZkha?=
 =?utf-8?B?OG1kM0xEb3lvUWFkN0xtbTAyK3ZKUkpoMXRqcUMrNzdYdnNBSmh6Z01VaTBS?=
 =?utf-8?B?U0xwT0FyVWtBOGZtRE5QNU8wWFc4RDJjYlkycmtOK2VUVE4rM29vclJXTnNy?=
 =?utf-8?B?cS8ydTZiRWtndU8reDlaSWo3MGFpQ3JnZzRmcUQzM004Y0paTW1jbG9lZXg1?=
 =?utf-8?B?RlRGN1JJc21xSlo0cE44N3g0UHhzR1hEYm5EZFcvcURBb21uWXVGZmFHYko4?=
 =?utf-8?B?ZUNzSDNRek9XZ2xxbUd6UlpsbVA1aTVlQWxHRDB2WWFrQWxOSTNHdkIreXNN?=
 =?utf-8?B?V2lsYThna0NSRHNHc0o5ODJieitZeW4xbXBJL1hJd0xUdVhtc0lGM25lOUM2?=
 =?utf-8?B?NnJsbE84cUNjcWlsTjJVdEV0TnAzN2lMQkZBZHZiY21vWkkyTnh3QlJaaThB?=
 =?utf-8?B?VWFKNHgvM1ZOU1pBNjErNUJGQ3UybSs5Tk5EKzdMazFMeUtVUDUwRktWRFJt?=
 =?utf-8?B?Z2FvdUdkQkJ5UUFWbUNaejk1WnB2NXcrUXVtS3VxOXFKcGs1ZHdkY01SOXpQ?=
 =?utf-8?B?ZFBkL25lUmd4VzFhcG1ZS0FHbERNY05DRGJWZmYwUmVrYmFPSEoxckVzemJY?=
 =?utf-8?B?Vm90YkZwOVMwbklrVkxvRUJ1cWhzdmh1R08vWFFISmR6eWoxRUk3K3IzYktN?=
 =?utf-8?B?aTBYUWIvaWhDcENWSkRFeW1wY0EvY0ZSTmJiWFV2TEo3dGxCNDRMcHZjeHlj?=
 =?utf-8?B?dStVMEVnNEk3cWw4MXloVFBOdFBwSU53eXBXS0R1Q1lRTlAwdjFXMUh2RUxS?=
 =?utf-8?B?RlZSRmNoYWhFRXlPMEZ0TUZVejdHZ0tKOHZPdFVDaW9SU3NRaHFHaVJKcXBM?=
 =?utf-8?B?b0doMjBRR2FSMlMrSldGbjMwc2RoU1gwZ2ZxZi9IVGswY2drZEd0dEZWVm5T?=
 =?utf-8?B?SlBnaGk2aFoyZlVBWWJJYmJueExteW9CTTlRdHpPMUxzclJUNGMwUnR5SHR4?=
 =?utf-8?B?cFlveUI4bm4xb2E5QW9VbmluWG5DaS9WbjdseHR6d1BDK2IzazYxRkZEU2ls?=
 =?utf-8?B?L2p1bHR3cHhybUozT2hHc2JwaGhUalo5TlI5NXZ4Q1NDQm9MZlN4TzdFY28w?=
 =?utf-8?B?YVVvejJuMk43bVZnalQrMmdoUmY4ZnBWMzFKRWtmS3I3ZGVqZnlXd3p2cE9O?=
 =?utf-8?B?UERPcWxBdi9ocm8rSW54WFFwNW9TbVdCa0RwOGZEYXFScDV4d3dJRmlkRmpQ?=
 =?utf-8?B?UUdUekxVdFZHMlJ5eStzaHJldzduYzlyY0x0Z0had0ovYjk2U0JzQzlQbVEz?=
 =?utf-8?Q?Ob0k5z4lQTrVd4h0iewJj1EBR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5c534c-2eba-4c73-8a0e-08db2f6fdf31
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 09:36:13.6615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uh8WgwPhcmYigC7O2HmRjPCPWVs/9YsmxmYV8WkztlJroNgAWmGws/P2IkRMk4AgTLAoX3aEmVzPcQeNYuUkog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10061

On 27.03.2023 12:59, Luca Fancellu wrote:
> @@ -43,8 +44,16 @@ register_t compute_max_zcr(void)
>  }
>  
>  /* Takes a vector length in bits and returns the ZCR_ELx encoding */
> -register_t vl_to_zcr(uint16_t vl)
> +register_t vl_to_zcr(unsigned int vl)
>  {
>      ASSERT(vl > 0);
>      return ((vl / SVE_VL_MULTIPLE_VAL) - 1U) & ZCR_ELx_LEN_MASK;
>  }
> +
> +/* Get the system sanitized value for VL in bits */
> +unsigned int get_sys_vl_len(void)
> +{
> +    /* ZCR_ELx len field is ((len+1) * 128) = vector bits length */
> +    return ((system_cpuinfo.zcr64.bits[0] & ZCR_ELx_LEN_MASK) + 1U) *
> +            SVE_VL_MULTIPLE_VAL;
> +}

Wouldn't this function better return 0 when !cpu_has_sve?

> @@ -602,6 +606,31 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>          return -EINVAL;
>      }
>  
> +    /* Check feature flags */
> +    if ( sve_vl_bits > 0 ) {

Nit: Style (brace placement).

> +        unsigned int zcr_max_bits = get_sys_vl_len();
> +
> +        if ( !cpu_has_sve )
> +        {
> +            dprintk(XENLOG_INFO, "SVE is unsupported on this machine.\n");
> +            return -EINVAL;
> +        }
> +        else if ( !is_vl_valid(sve_vl_bits) )

If this was code I'm the maintainer for, I'd ask for the "else" to be
dropped. Please consider doing so, as it makes more visible that the
earlier if() cannot "fall through". (This could then be further
supported by inserting blank lines, here and again right below.)

As to the check - this being the only user of is_vl_valid() (at this
point) I'd like to mention that half of what that function checks is
now pointless, as we're dealing with a decoded value. Future further
users may need the full value checked, but given that all interfaces
are now using encoded values this doesn't seem very likely. Hence the
respective part of the condition there may want to become an
assertion instead (or be dropped).

Yet another question is whether both range checks (against
SVE_VL_MAX_BITS and zcr_max_bits) are actually necessary / useful.
Iirc 2048 is a hard upper bound, so zcr_max_bits being higher than
that value should likely lead to not using SVE at all (if it doesn't
already; didn't check).

> +        {
> +            dprintk(XENLOG_INFO, "Unsupported SVE vector length (%u)\n",
> +                    sve_vl_bits);
> +            return -EINVAL;
> +        }
> +        else if ( sve_vl_bits > zcr_max_bits )
> +        {
> +            dprintk(XENLOG_INFO,
> +                    "The requested SVE vector length (%u) must be lower or \n"
> +                    "equal to the platform supported vector length (%u)\n",
> +                    sve_vl_bits, zcr_max_bits);

Again, if I was the maintainer of this code, I'd ask for the message
to be shortened, such that it easily fits on one line. E.g.
"requested SVE vector length (%u) > supported length (%u)\n". This
would then also avoid the apparent grammar issue of "lower" not fitting
with "to" (i.e. a "than" needing inserting, or "below" being used
instead).

Jan

