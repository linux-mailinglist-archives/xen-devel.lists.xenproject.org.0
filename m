Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2826ECB6C
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 13:35:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525321.816449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pquSt-0007ca-1M; Mon, 24 Apr 2023 11:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525321.816449; Mon, 24 Apr 2023 11:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pquSs-0007Zt-UL; Mon, 24 Apr 2023 11:34:38 +0000
Received: by outflank-mailman (input) for mailman id 525321;
 Mon, 24 Apr 2023 11:34:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pquSq-0007Zn-Lw
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 11:34:36 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe12::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc7add45-e293-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 13:34:34 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9238.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 11:34:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 11:34:32 +0000
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
X-Inumbo-ID: fc7add45-e293-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gWS/1nA0G7bkT+2ZrpzwPIXAKOc5axxRl6seWGVyn4rOoJ/O7Tf9vz5ExSXIcahlEqMaNsFor5sW9nPrbBW1mLc+KtZAvnEYDJ5lYbV3R8JBVAgncGYXc+JelkTQB59aX16AHPO5LNA9zuiBLaZ+bH+5ATs5xyCGq2wOug6CFOqIOT3wbduznMC67aZBqgD2gCANT2iafypAIB1AslkJeLRjtMmZo4j5dKVRDJ8Bs4ahAXhHy8mjQTWe4MDaiQScrzDW+hj+zMY9f0bhV1/Mz7IDsrUymxTxwyalSGI3Y778TvQ2yOm7J20e0Nr8jO7I4QTRhumhqu+/GFSdEHbGcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIkGlrGLB04uWnXxS5IY80jvUApWbQ4Ic4kmXGX/Bvg=;
 b=OCy1nTNuKlI2JHnk+eoOSP28hzyoD2imySUD3jzYRQd6RKhPMFjeEunu5oG5D7/adPnQONx27WaeWPI4JwCzsd4Z2J4fKt6qApaArEFQ7NJ8D3C/q1ZgDskKbH7GwV4DaH/ixt1tJUEJs40NlEi2KPPKf6bQRUpmJPL0GaSgMtFiPP/FZRd6VRZhIDTNAGdd8oSBeivtsqnviv52FbeEcck7R5tVaqml6jwunErCCtPx1mmOP9bDTtGblrG/H4QZ93sdRv+grMO2qnqCfkOQ0yA3f6dbzYn6Heb+raUiGVuaECO7gDLo+xFjtlct+aZY5XGCUaf6yRikjd9dSryHwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIkGlrGLB04uWnXxS5IY80jvUApWbQ4Ic4kmXGX/Bvg=;
 b=0s2lmCfSuvA57UZTqUttFgoeo9aW/AfAfq+I5yNAkLJH6sUcuL94s+UXadx27if4iAHr7zfwVhy03Vz7ZJ6cgFreP1KmrnaEOv75UT684x6thcY4mFjOGlVl5sLAlEEENyVHzI1RjO0T5iSKx3TqSaqpWYE2iZU2y9b0geTi+fM+ty44v+zd4/Gd2cRT0sehXfgAbCyYsXiBSHP+C03rZh3hOKmEpqtdHoHQGQNyRcnKx035Eo/dC7DP0IRXMAyUPwX32iSouxXKbNyLwVa9dH6q+manuE5YT1O+3R0RFNA/jcQNOZV+LqpRVhTt69PIWctu0D1QthPxL/zRLijs/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <589fdeec-a0cf-1dc0-18b2-bd20c76832d2@suse.com>
Date: Mon, 24 Apr 2023 13:34:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 07/12] xen: enable Dom0 to use SVE feature
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-8-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230424060248.1488859-8-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9238:EE_
X-MS-Office365-Filtering-Correlation-Id: 1007c15b-6f4a-45a2-77f0-08db44b7df1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	76FRF24syfw+64KfvgA6G3aD65ych9IKSVkxhsYDdr1ztHLdSqim1PoyknMrDtk8uPFmV2/00E9W5a74iVEQbn/H20PFtBTG7d9bwdJZMCCF4BOioZ8fzFrhdQFEmIRpS0eLQmBSxEZ9GbUPdmdYOUwQuMm7/W3X3WljqBPUqjuebjT7iNj9WAnLEjAXH+MM7YoZSoTlQr7iGqZUfbn3PSmHGyw7P4ys4cAiXyjNFSWr6P4o+BaW1sRE+9gNfP0hjFubgUcxcMFaVBkWjDuvk7QzvJkQIEScGL+H19p/WCTNxHxJTlvZJlzSoOikKaU8y5Sj/UFFw3dLysi9rlcOJOS2SFJ7HKMaQe/FwgIlCtO9dEYAyoZC6HDFkr/OC5B11yQUhEaKar/a85+d/6mb05P957BQvnkQgBdkWQ0vAeQh2vfVZ3JRf7D4Ewxb1I4Ee5WDICQUYTrSmv3L3LX0l1kFBbP8RoLrkXrfrjscO6Vp7sBxx1J3CMJcX8R+do6vfgOiXeXa+T3huvVyQGNXNygrdIcUhDd0Z0EGGtwZKWywKTAfoo2dA6LNmYjMnFE1qIF5fscQj2G+pK1A4fzO/4a9+V4NcppIf7sI0BKFh2WtP1asgqx44zu/Wr5a591LhUccJq9WhcCVuaFwRDhkNA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199021)(36756003)(54906003)(478600001)(316002)(4326008)(6916009)(66946007)(66476007)(66556008)(7416002)(41300700001)(2906002)(8936002)(8676002)(5660300002)(38100700002)(186003)(2616005)(86362001)(26005)(31686004)(6506007)(6512007)(53546011)(31696002)(6486002)(6666004)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzlGRk1lUmJqbzNEOGFDV3RLVFhyZWNoSkxkeU15MnIrMG82OHAyMWxiNXZS?=
 =?utf-8?B?TEh3cGNFVEJOUk40SHkvdjZlUjJnbmZWY1laMFFaMUJ5Wm1TWnVLOW1pYnNF?=
 =?utf-8?B?MmJjWEhrR1RCVmczd01nT1VIY3J0NWNLQWd0WFFhdmkwSjdzM01VSVJ0YWU5?=
 =?utf-8?B?SnBrWjlsOWJwMEcwbzhQdFdJdCtYSEI4M3lYREgvTitYaUgvaTVTMllKTndi?=
 =?utf-8?B?RWRiRFF6MjVMd3g5WnNTamF0cCtjRGxlWDRkUGxZMkdjOUZpVE43Qnd2eTlT?=
 =?utf-8?B?N3ZqaWhiUlNkbE03WUJKbk8xZ05tcFV4YlJGQWs5dk1VeXd5aHVnYzVGQUpz?=
 =?utf-8?B?TUZFdWdyYkNDamYxMzRzUHZLSC8wNTYyd2Vnd2xLZWIwOWdXZ09lQnFVa2xm?=
 =?utf-8?B?Z2Z6RjVHVG9WN2tBQ2ZWVWVqUjc5RVNqMVhnZjBFYzljU3luVHppQ1loOE40?=
 =?utf-8?B?N1IxVE9FcnZSUGF0RlYwa3JrN1MxOGgvcGRkZXpUN3BrNElxZzdFRTNXZG83?=
 =?utf-8?B?M2ZQaVIwanRFWUoxc3hyMUdNVHF5aW5TWW5MM0U1ZVc3VnI4b1c0eUpBQzVu?=
 =?utf-8?B?ODgyL0FZdmNDK1pnRlBZb0t4b2RqeFlMVjMreEhWdUtpdDh0STlYT2xDMEc5?=
 =?utf-8?B?UVQzcjR1eWJRVHphNXUzN0hxNndRMzlYOStIQ0tHK3YvL2FBTUlKSXAxSmJv?=
 =?utf-8?B?Q2dacHU1N0RLTzZJbnUvY29EY3VCRHpmVER5OVBoaktkOHVONEpUVVNRalFZ?=
 =?utf-8?B?eHoxcmdGbDRwQ1BzMHJZNWZtMVloY1dnRHBlMG9HL2luaEdnUWRyaFZCK0t4?=
 =?utf-8?B?NWF3cjU2enM1OW9Ucm1FR21TTXluUnlKWFJJN0xHb2FNLzlTZkpJYWRWYXFm?=
 =?utf-8?B?MVNiVjNaalBoZkJkZy9FNTl4NzdZU2JROUIveGpEWTlLMko5TElvN1BrMUx2?=
 =?utf-8?B?OGIyS2wyQ29uc01MTmNSMG94a1VvWlJGOE8vVmM2RjFkVExmTHB3alc3Vmha?=
 =?utf-8?B?b01qOVQ1em9WeXYwR0pNTGhRVGNOTkxnRXpzNzl3NmlRcnYxMzFBSHI5d0dX?=
 =?utf-8?B?bWE0enlxSmYxem5XNU1sUk9uR1ZkNEJEakswRlF1Y3U5N1RQUnBNWEZqT2sy?=
 =?utf-8?B?bWhYWW9ORHRzZnpSWTNXK2FFYnJEb2QwZHZpZ0taTlFxcUJKc2lHNEdrOTVJ?=
 =?utf-8?B?M2VDVTk2YVFud0pZaXNlRHdqSW5HTmdoV1h4Vng2VUV1bjdRZDFUUFNSVnpt?=
 =?utf-8?B?L1hUL2NXSHQ1UEZjUnR3bGFKTGtIYjZOcGFZNFlJeGVUcWRPM3FpbXNERGRT?=
 =?utf-8?B?V0ZXZzM0Z0Q5aFpqTHhsdDU5OXg4dDhFQU9kL2w4S2JwSURzV2NMRHdpMlAr?=
 =?utf-8?B?QmtzMmhGejByWTFncmJRbUljL0pkc2p4bE5sR0Y1MjdjQXVJVU8wVEdOZ3c0?=
 =?utf-8?B?amlvYzd0VW1BaXlrZDVLeGdDYnJha29rcjZDYUtyT0xMZlordlprQVB5Z0Mz?=
 =?utf-8?B?bFlIbk83RGpIVlZwSSttTHdBRFZqTVo2MTVCdnROcC9tdmdKenBxS0dOUzNV?=
 =?utf-8?B?UHVxK2VzbWJLbmtqWEtkVWZEWVNwVXRQekl1aG14dEYrcjM2bnpzWjhDalVm?=
 =?utf-8?B?TEpZdjJQb1JZWCswY2FXREpiN1FpaGh3dU5DMytlV0o3aE5tL1JhaXBJY1Zh?=
 =?utf-8?B?UnFubDhqMnA3eFd3T2g5Q2JNSlVGMXJCT0hKTjRsOEpCNGovWUVIQWhDM1Vt?=
 =?utf-8?B?TTJhcnYvcDF0M2YxWGhhNVR3OHBoYzlseVdNb3pOanlTUSttSHgwUXJxNW5I?=
 =?utf-8?B?YThtaUZEbndhc012UVI1YnFSQ1ZpRHhta3NkejI3QlJMZVkyNno4aXNLa2J4?=
 =?utf-8?B?V3p4VnhBTHoyUUU5UitscXRHQitZL3kyS2RBMUpMdWZHRC82SkM1bU5yZjY0?=
 =?utf-8?B?amJJeVFIdEpWR2JoeEZ5ak5WU0xkc1kySnpIYVovS3pTM0JUcDErdFN5RXAz?=
 =?utf-8?B?c0V0MHdiVFpFL1ZxSk9EK1gxakJkRFBtMXF3aDRURHdudnVUU1BsR0FtTGJi?=
 =?utf-8?B?c0RkRHVMWkJtOW83QjZJYjU3M0tnZXo5WHViMXpjbkJrdE1xeVEvOGpwckdD?=
 =?utf-8?Q?IPi9R529vMy1Le4OID/Obc6zb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1007c15b-6f4a-45a2-77f0-08db44b7df1c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 11:34:31.7553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ex1LhVyj9k3opO1bXAxayrXN0dQkl0b7TwB3VTcUkpaAOjwd04AZBPZkBjQpD2121i2In7ijpOBmzqN5vIDvLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9238

On 24.04.2023 08:02, Luca Fancellu wrote:
> @@ -30,9 +37,11 @@ int sve_context_init(struct vcpu *v);
>  void sve_context_free(struct vcpu *v);
>  void sve_save_state(struct vcpu *v);
>  void sve_restore_state(struct vcpu *v);
> +bool sve_domctl_vl_param(int val, unsigned int *out);
>  
>  #else /* !CONFIG_ARM64_SVE */
>  
> +#define opt_dom0_sve     (0)
>  #define is_sve_domain(d) (0)
>  
>  static inline register_t compute_max_zcr(void)
> @@ -59,6 +68,11 @@ static inline void sve_context_free(struct vcpu *v) {}
>  static inline void sve_save_state(struct vcpu *v) {}
>  static inline void sve_restore_state(struct vcpu *v) {}
>  
> +static inline bool sve_domctl_vl_param(int val, unsigned int *out)
> +{
> +    return false;
> +}

Once again I don't see the need for this stub: opt_dom0_sve is #define-d
to plain zero when !ARM64_SVE, so the only call site merely requires a
visible declaration, and DCE will take care of eliminating the actual call.

> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -314,6 +314,31 @@ int parse_boolean(const char *name, const char *s, const char *e)
>      return -1;
>  }
>  
> +int __init parse_signed_integer(const char *name, const char *s, const char *e,
> +                                long long *val)
> +{
> +    size_t slen, nlen;
> +    const char *str;
> +    long long pval;
> +
> +    slen = e ? ({ ASSERT(e >= s); e - s; }) : strlen(s);

As per this "e" may come in as NULL, meaning that ...

> +    nlen = strlen(name);
> +
> +    /* Check that this is the name we're looking for and a value was provided */
> +    if ( (slen <= nlen) || strncmp(s, name, nlen) || (s[nlen] != '=') )
> +        return -1;
> +
> +    pval = simple_strtoll(&s[nlen + 1], &str, 0);
> +
> +    /* Number not recognised */
> +    if ( str != e )
> +        return -2;

... this is always going to lead to failure in that case. (I guess I could
have spotted this earlier, sorry.)

As a nit, I'd also appreciate if style here (parenthesization in particular)
could match that of parse_boolean(), which doesn't put parentheses around
the operands of comparison operators (a few lines up from here). With the
other function in mind, I'm then not going to pick on the seemingly
redundant (with the subsequent strncmp()) "slen <= nlen", which has an
equivalent there as well.

Jan

