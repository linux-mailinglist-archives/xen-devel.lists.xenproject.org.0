Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2458D46494C
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 09:10:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235638.408746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msKhH-0000qO-Bk; Wed, 01 Dec 2021 08:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235638.408746; Wed, 01 Dec 2021 08:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msKhH-0000oH-7o; Wed, 01 Dec 2021 08:10:35 +0000
Received: by outflank-mailman (input) for mailman id 235638;
 Wed, 01 Dec 2021 08:10:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msKhG-0000oB-1Z
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 08:10:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 279e5ba9-527e-11ec-b941-1df2895da90e;
 Wed, 01 Dec 2021 09:10:32 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-M4IfLnmOMtu9f1FbiNipow-1; Wed, 01 Dec 2021 09:10:31 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4382.eurprd04.prod.outlook.com (2603:10a6:803:73::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 08:10:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 08:10:29 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR0202CA0063.eurprd02.prod.outlook.com (2603:10a6:20b:3a::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Wed, 1 Dec 2021 08:10:28 +0000
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
X-Inumbo-ID: 279e5ba9-527e-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638346232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eH/WZPnoCVjz/Y0ISwhQODDksANkbevXxED+MVLmilc=;
	b=mXyzHgHhDE54LppmS7e3w7FW+LtNmYtsijGjdis2mo0xMEdBbe+wU3Ovng0JRHhIaaDOf9
	eo4K97s8p07CgdvJaufLhEwkqHxNHl9BgjPSR8qjy8N9ImG9KCQo1DrVAariqrSK6NWJHq
	2iTX6pxLtz9k9+y/ZKsqaOPn6YPxhYA=
X-MC-Unique: M4IfLnmOMtu9f1FbiNipow-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1OQatTMRxjrJId4RtKwT7QQYXv0p91ypJauCbdYUlu+h2aiX7xpIu8rUPXRoLv4mKVIfYsTdyHn0Ryvs4l2sFQ+kXn2qci8olCUcX9tFvdML+NPyPuB/05a/tkuBTDap0P4HcY3nwjE0Vak2bBLy0veMjzLQ/sC296jhxJ0LKwKBX+oeniwJIwvcPBFcadJ9OJf7riHPlyQVSKftTq8RWOFF15LdasxXvDmcFpILo6adKaR+bu9BdmSCrN6ub4pacY2/RIzq3H+KPCgTEs8wTy5XOyARMIF9eGIybgoTlijTrX4fLzVGKnaxU4/xaIfYVObVrSpsFGb2bmTpBHG4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eH/WZPnoCVjz/Y0ISwhQODDksANkbevXxED+MVLmilc=;
 b=oOO93rmjFlszZTkfQMNnFfjANvcPMVbBvCIpBpjYo0YK6QJkVkfiLUEFbruKlrLKSXkXTs+tHlGEScFNoCpwLolLn4BVEnrzF8IlpZzpSp+d7O72w3wNCRblstMmanwyRHZtuHFB3LrY2AXhkItISmnXEJZ+osVm8hDy5BH/1RKbVVsu2jrP4OMeABJg+aA1DGFTsWboFpNP4Hqp95uFNDH15OrFFNjyINJRooDwYX5pdmw6wLk2WKWW1KlITFC6h/T/3BBasUIjOQJ94ZgXCXsWjzSEKQFyjun9/tHvUCi2QhwEabtiiv3O5kkCcpm71nXlY4NqAMdh7jiymPeTDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e3bee553-9443-2f3c-095b-4d6151a07c5d@suse.com>
Date: Wed, 1 Dec 2021 09:10:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/4] x86/altcall: Check and optimise altcall targets
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126212258.7550-1-andrew.cooper3@citrix.com>
 <20211126212258.7550-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126212258.7550-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0063.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd3c17e2-cc7a-4269-2115-08d9b4a209a3
X-MS-TrafficTypeDiagnostic: VI1PR04MB4382:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4382FCF6B0DED070154125E4B3689@VI1PR04MB4382.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pCt4ncXK9zE2BXDfYKBJPd47sTEfA2CuNHuZmjrhbU9HNYaJxbNvJzBjsE3X5sxeY6B7E3Q/+XQZMN3AIfcAy6nsd4gBCL33H7XOUzefR+XXfPV97RvwBnvpdPUvQW7oSZByPC3HRPVxTd7ne9HR56M+dj6a0ZzF2ROENhO7n9FzuEm9CIPKCiXOnJvVP9VVcWAyk1k+/37I1dQHgN61act5XyFLIr+ZG9pfAV/njwt+r+A9KtIg8Jz1ldaUOb2M2ejq7BfPoVlEC7hgAkfpgBJ/7135akxMlYJk6XbwlW6S3Kor57DNXWZBDBNVgFbIwwaV5X+MnMZCN1EHrxIxAXPr7esNQUDTZEK10xguSb6cyjymeWWsYbHEek6vJgbm3vJj0FtsuSebwMK8MuOWDKKYMQZqGwLariZRi/DKb66CZD5QIJs49wjjMO4JjwPuyXqL7L3FSIs6D1fk96cEFPVgPA8n+1I6RvaUFg+0uJgO5txHGnD7AVTvdxjjG+LfaNtGpzE6Bnaf93Cp8Lb56TNd12h5l8eCxT/sm+C8T2aQkew4sA9H0/if9oz2z8ANlgM0vef5P9nVgPFTf2LzgQ+faLUP0736XuyTRaNZV1M5UNh/Bgty7Lwn27sJxeiND9jdPZ3aFZehOWjEdDZLhZA8t3b/0/Y3PObXpj1MtSss6bvOUbxPG6SJkmU5NM6wb2JY7AQRN80eGz7wPz9VrpsU+zXX2J/4ZuYglFrZrQh3VGw1IgZrcglsxiITD8AS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(16576012)(6486002)(66556008)(316002)(66946007)(53546011)(66476007)(8676002)(5660300002)(4326008)(26005)(4744005)(186003)(2616005)(83380400001)(508600001)(2906002)(8936002)(31696002)(54906003)(956004)(6916009)(31686004)(36756003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnY4ckJ1enhzWEx3c0JONEFicEwzVGpnZUl4MFMzbmFWcTBXOXIvSDNRM2ll?=
 =?utf-8?B?ZFB2aHdxcjdBQ2R3K05xbmZsSG9KaGJmTFMxZVNXYzBESTI2NllFQ0JMOTNY?=
 =?utf-8?B?Zmp1RFYxVTc4VHk3NDBtdTBOLzNoSUdJVXQ4Q1FmR2JFSXpZMUZLcUxFYi9j?=
 =?utf-8?B?SnpjQjVsano1cXMwMXhBMlhuQnJmb0poTW1EN3l2Z3BkenZnN2w2aGhwZHly?=
 =?utf-8?B?VEU1RzExNDFEVlNGVHExQThuK1dsMFRvQU1WWXhrUkt2ekUzN1IwTXl5ZkRz?=
 =?utf-8?B?dUhLQkswNmFjaE54YjhVWVdZWjgvSUY2WWNodGlJY1YzWXhZdEJMNElBcUFo?=
 =?utf-8?B?R1Y4WVBYaU5uUkp3dk5HaExtTjZmcDZzVXBsVnpvL0hQdCtCeS9IWHl6Njhi?=
 =?utf-8?B?UDVoMVk2V2wvV3NPSHNLRk42WE4vNk95ckJJb1ZVNm9FRkZzdjc5OVZvQ3E5?=
 =?utf-8?B?K2RWdU9pTVpuZXNhR1FJWUZiSjhUeVRqUGhLWm5hT2NJSmcrN0NZbncxam5G?=
 =?utf-8?B?SXdCOXNOTVFtZFhCUHlIL2RLbktxNThVRnZtU0RwcTBMUGI5eW5lUkRyYnhv?=
 =?utf-8?B?QmE2WC95Y25yVkRQOGlJVmV6M1pJYy9SclFoektLaThaYVd2MWFSejhtbGF1?=
 =?utf-8?B?bWNPN3pRZzI0T2VhV2hyaXBSdVVBclcydUVJZzBvcUI1QmNPUEpzTTJhTll5?=
 =?utf-8?B?VFhMbTlSaXlOelRvS3JMMFViblYzMmlsQlJOVHAyZnZBNDdSRmtXdUNnRWVT?=
 =?utf-8?B?Q0ZLNXhCdVhuTGZMZUxzUDI5OTBYZGc2SGhsUWRiNUdSMHN3bUR0cVpKZHZY?=
 =?utf-8?B?UTBJT29ySGxSYXhFN3pDdzBIby9WTVQ3NGFuYUgxaFVZdEpSa1BvRjl6dHZY?=
 =?utf-8?B?UXkzWFd3Q0dRcnNvZHhIUndDNmtVbm9idENlZlZaQ1g1aTQvZUtqN09yMDAx?=
 =?utf-8?B?ZFdVd1JtVGd0WkdFMHpZV0ZvQVRiUDdTaEJEdWpycXduZWg5RTJzcTc3RjRL?=
 =?utf-8?B?Y04rQnVKWTBrVG9ZSDd2NnB0MUFSZnBiTjBCenlGVjFaenZ5RWZDUHJlYm1Z?=
 =?utf-8?B?R2ZEV1d3cVkveDM4TExJaFczcG9aWkQrQk5XMTEwTnpCd0V4c2tnempob3pz?=
 =?utf-8?B?SEY3eU12djVSR2UremE1YzZ3U2ZHSjQ4aXVhSStaeCtmcW81cGNqTUhjQWtR?=
 =?utf-8?B?MVdUeFRlalBySnQ5SFczQm9hTFFzK3NvVE5NeDdMYWdlcU1UR1lsejZqZldN?=
 =?utf-8?B?UXBYT0xDbDZwUlllSjFFMjZ1cmhENjdsTEc0Tkd6bEZvcTlEYjVmN2Z3RDlr?=
 =?utf-8?B?bWlMRWlGdWd1UjUyUEZnaFFDc0FVZkUvcEx1UGdTVVFiVkF0ajhlUnI3R0t2?=
 =?utf-8?B?SjRGM1NDcVh3SnhST1hhQk1CVjlsVzUrVjhBTm5LbDFhcXlRWTd0SDM0K1Nn?=
 =?utf-8?B?dmV6K0d0RzIxL0twMmZoSUgxUDRzdGNwRHRPNVdYb1E3N2swQUZGMkdqUWFK?=
 =?utf-8?B?bHBiUkZRMnc0Q1R1YTk0RjdvTlI1dkcrVytVVnNrRTY4MUZLVE0rNGJ0VFJC?=
 =?utf-8?B?aUx0L1h2QWpBdGFIUkNNVHZFT3E4UXluR3NnMzlWaFJCd1FzOSsrWVRsNUwx?=
 =?utf-8?B?MTlWSm9ERGJKVUZqT1cyVm1IZWJNYUtTbEYxMWZFZVB3ZjB6UzlpL3JMMWlM?=
 =?utf-8?B?OEh2OEN5bXNnL09OSGxPZjBEc0NOcENVdHV5WVFtMUhVK2RFanovdEx4TGdR?=
 =?utf-8?B?ancxSTR6algwV01ycVRuc3Z1UjRMYmE1OUtrU1ZQUHBwaGVOS2lGVlpNNVZh?=
 =?utf-8?B?eGIvNjV6cHkyQUVqcjBtWDJveDhkTEZBWmx1eGlXOHRVQVJ4NFgxMHdUekNM?=
 =?utf-8?B?dDRaN2hVTEdkYTF5OHhFNTdEVEtwVWNuRisxK2xMUUVqSG9HQ1NjZk1lS25w?=
 =?utf-8?B?dU0rdCtjVTlZYmtKNG93bFRhMmF6OGhES2k5Qk0yZlZhYXRURUM2R2ZwZk05?=
 =?utf-8?B?Y2JpV2ozckNxc1hwVFg3aWovNG1BZ2cxTmQ5NExwM1FnUU8xc0tYWXd6QW5Q?=
 =?utf-8?B?QzFndE0rMy9sRVlicWE2MWN3VDBnazdhMmY3dzRHZlZwSVZqYUNURUpEWHlG?=
 =?utf-8?B?c2NSZWlyL1QzUU9IZUFRVndGT3dhN3BFK1JPTlpXZnJCOG41ZVJUL1ZITHBV?=
 =?utf-8?Q?HrUYkfBFgJtpng4PpwQTJe4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd3c17e2-cc7a-4269-2115-08d9b4a209a3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 08:10:29.0642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4kLkwclmlSchDr4pOa4LNMjTCULJBwpUBoB7PQl24rv4ix+yU69K4424qgurtmUyOReXT1QnL56ILgr/eK3Jnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4382

On 26.11.2021 22:22, Andrew Cooper wrote:
> @@ -279,6 +280,27 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
>  
>                  if ( dest )
>                  {
> +                    /*
> +                     * When building for CET-IBT, all function pointer targets
> +                     * should have an endbr64 instruction.
> +                     *
> +                     * If this is not the case, leave a warning because
> +                     * something is wrong with the build.
> +                     *
> +                     * Otherwise, skip the endbr64 instruction.  This is a
> +                     * marginal perf improvement which saves on instruction
> +                     * decode bandwidth.
> +                     */
> +                    if ( IS_ENABLED(CONFIG_HAS_CC_CET_IBT) )
> +                    {
> +                        if ( is_endbr64(dest) )

I would have given my R-b, but I don't see where is_endbr64() is coming
from, and you don't list any prereqs here or in the cover letter. I'm
afraid I don't fancy going hunt for it in the many other pending patches.
Hence only on the assumption that the helper has got introduced before:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


