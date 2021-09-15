Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ECB40C185
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 10:17:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187298.336107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQQ65-0005fr-GG; Wed, 15 Sep 2021 08:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187298.336107; Wed, 15 Sep 2021 08:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQQ65-0005dg-CV; Wed, 15 Sep 2021 08:16:49 +0000
Received: by outflank-mailman (input) for mailman id 187298;
 Wed, 15 Sep 2021 08:16:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQQ63-0005da-OH
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 08:16:47 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c6fb6b5-e8b3-4ee3-ac00-99e385e32d58;
 Wed, 15 Sep 2021 08:16:46 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-Lkv8nHc_MQS5zaBK1l5jag-1; Wed, 15 Sep 2021 10:16:44 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7087.eurprd04.prod.outlook.com (2603:10a6:800:12a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 15 Sep
 2021 08:16:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 08:16:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P195CA0027.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Wed, 15 Sep 2021 08:16:43 +0000
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
X-Inumbo-ID: 5c6fb6b5-e8b3-4ee3-ac00-99e385e32d58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631693805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xtYTEz4egySuYKDee2kzOyxpiadVw/pEzzeIm62TtmQ=;
	b=CZUuHhFejkQx8cbN4fdNRgCiF1O8B4reJtDLhoezcePaC9qot+Sc1TgYfsYMaBE0btoYeN
	r7VyE1NdkytBgTE3ubIIIg/Uq+qTatH/zogv6IFj2t1siYp2eLm6i4TugzQ+/I7JBcc6P1
	h+cp5rovwyww4tzgkl9oSgwa9vTPzXg=
X-MC-Unique: Lkv8nHc_MQS5zaBK1l5jag-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NneLDN7yQzu0YqIqW2FH7NtgM3BIZdAYCuVH8uc2XTl7cuOIVvk5WtFTsA6KHbCAlYzGrkUobP8b9OD3cx2+TDjeyj8N5Ug3Vn4gZHu60rhC6BO4X0MQCyPCfcQyk+9mXDb/UTXxGckjZsOyMQWNuXz9tMCePUOi7RiwyVcTIIYFsXsxyub6Mp7bZaJ7FjEUOPAOf/EQcp3qnSA/aoGaXi541fV0H6ens77vkj24hap8r0HogpiBNK9fPRsrXIFqUiTVANSq/6VHt+axmp0s+Byn+1TkglVdmx5TTqkyxlkhAWs/g3/mrc/UGnIqepVSTMbKMSSefuODgKdFGo6izQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=xtYTEz4egySuYKDee2kzOyxpiadVw/pEzzeIm62TtmQ=;
 b=nD8sVxD1d9jNVf5LHVFJTvf8jS7NVBWXGRAj5eixHl3PllU01B9SrG94+lUys7aWFQbO9hgosqp7erwdjrD5DDy+Hpu7e0rW2cCoEFJFVKPAIG1l1xRDWiDy+/e/XtNYzcYJVok42HdCDL9M3nJcxe1PjJbSfhsf+3S2PEeuJD6FzFgqqy8MWgfn2bMbyRaFj8U1OuOtdAOKCNXkt7avAT/6qbbelxZ4p+K2ujwC0+m+1rEM3QLmALkqyaa/njiALu2MKnlX391XrPeoSUWHRMIhFrE3eFRuS9Ng9FVpShcITEtZghaaGH4q1GuvlTb+CLrIbwb8kRu7cYG8bKuf2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2] x86/p2m: fix xenmem_add_to_physmap_one double page
 removal
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210915080342.21346-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1d70ff4d-bef2-1865-27c3-27d17c15d17f@suse.com>
Date: Wed, 15 Sep 2021 10:16:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210915080342.21346-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P195CA0027.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd279e79-082f-4e72-a10c-08d97821270e
X-MS-TrafficTypeDiagnostic: VI1PR04MB7087:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7087A99ACBBCAEC78CF53DAAB3DB9@VI1PR04MB7087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fZoP9+2IIk1sam/J0GuiLmskhu3K4fkE3AIUULbE4VQnck6rg/aZW1KWSq0oqjbuUdfQYkebHoTCI0ffMy+Vzcm38AxSmmoo23H1mWj6BL5zr/es8zenXmdgp4wro6WOA1/903a0ILaXc5BYsM+CfcVtxEn4dUQsmBt+ChlCiGCWN0P++lbwPWe24RCKgmLeUkkJw6DumAvbFm3Et2tDcvyxSFtlp+Kzpo1f1Q9a+RKH7faBlbuNMowj8ILFbWh2F50GBYMtnZGzWnQg6NbTnHMaOP4lANCHkWziLNvtR8b9w4uYH50D4Xj1YUR/NHlD0Pyc/mXIJR8uCmexAbuYvOXAL/h5jMHibzMIOytXAXh73pAFHHKiIvP/FUM/tcO5P+aDToCZfMHrWn8gVp6h5B1murCxh0BC3TXPOJ9L9JwErQMD8ZXdOJQKxmyNMu0kR8VCxodKNUfD1eGq+pGPorUjG05ATioRurApUq70iIOvD3Kqb3qta0tZwT12GnZsCEgJqoCffFRnSfloXMWSEn7cqqZmJppxAqQy1meznbHiAsil3KWekZy/SyMHM6aEVoHKDzdQV56y5rGUtM5l20b4anrK/9VJwr6vm0Pwfyrob0SWMzg/F++q5hCTmqdfrChf9cwyptDrIA8kX/ztQbTbPw76pPq8ZHyyUeo/eFP6oiUhuLGHwuPsHsKNBHBRLCaEie999V3YOEplXnY5KrXMe0O0xvF4K6YJnkVU+uIKGQpP7wg96Esf6q9Ym+jE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(136003)(366004)(346002)(376002)(186003)(6486002)(36756003)(5660300002)(31686004)(8676002)(2616005)(86362001)(4326008)(16576012)(53546011)(316002)(66476007)(66556008)(2906002)(6916009)(38100700002)(8936002)(31696002)(54906003)(83380400001)(478600001)(956004)(26005)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0RNNWlpUTUyMFU2N2N5eFJaaUljS2E3a2NVWENUK1JJcEdmUFNvdDlkQ00x?=
 =?utf-8?B?emE3WUllcGdmNkg3MFVPWWg4SjBja2h2cE96d3lNL25lUEZEdTZROXVyRzBW?=
 =?utf-8?B?RXAxQlU4YnREZzI4eVBvSmxZK3NJWDJXUC8yVEJ1ZE9LbGlWd211c2JpZzBU?=
 =?utf-8?B?T3BrRENEQTEyNDBZSlhmampvMGg0akhISC9tVG1pa0VGTGN0ZG1YTHVDZ0J1?=
 =?utf-8?B?cmJRN2k1MlowVVZ1N2YycFlMUVRQVThxdXJwQnR2Rm5wSmxONm9vZGMrMEs0?=
 =?utf-8?B?NjM1WW1yVXlBMlFLWkdkSXZ5TkpqclNMeFprMkc0MjYwYkwxSVpIRkpoeko0?=
 =?utf-8?B?YlF2VTlBRmdNVVJVWjlCak1KSVdJbW43QmNkOXlPVTVnMHFqMjg2c1ExZXlJ?=
 =?utf-8?B?dHRndkZDT0h3aCsyM0tEQXZTTU1lSitHUXhVcXc2YmdwOWQ5QWd6NG5Yb05P?=
 =?utf-8?B?UmxETUt3emJuSVZZNWVZVExYZlZpSW9SK0Z1K1ZLd3dUbHFjLzlVdm9xRktX?=
 =?utf-8?B?bkZDOXVZS0dJc1RHZ3dwR2dxNWVzWFk5ZHdnY1dMa21vNVJkZURmYklTbTI4?=
 =?utf-8?B?ZkZFUERFdC9NaEtCSDhybWp0Uk5QS3VZdnhrNThnY2xKNHVQZ2E3OFcwb3RZ?=
 =?utf-8?B?bnFyVjJLQTlFN3poWFR3dzA2a1VZS1hJam93Wk8wV2JTTUFvNndUeXMxTmw1?=
 =?utf-8?B?QS82L2NIWUVna0NUeE9jc2psK3crNEs3UDA2UE1SblkydDd3WklHMlZ1Zm9x?=
 =?utf-8?B?N2owVDl3bDJ4Y21EbE41L25kMUcyR2J4QlhJS2JRaGJDRFdBOFN5TzJGdjE4?=
 =?utf-8?B?c1RBeEw0ekhUUEpzUlJsRmZHaE12TUh5NkN0emZOUERySU1xREZudERlOE41?=
 =?utf-8?B?WS9GQ0Z3Z3E2b0xDWUVxMHJJbDN5MklleE50Tm9VVXlOM2s3alpCbExiR0tN?=
 =?utf-8?B?S3lKS1FJYTVCOWNLZmh2NHAxV2kxNjdwWnh4YnI1ajROa25XTGJmWnVtc3lw?=
 =?utf-8?B?V1M4K0tZb3RtNzdNS25tWFlIbk9SZGE3YkRmZDdxUFBhZU5iK21xS3UzNHl0?=
 =?utf-8?B?ZzYvb0NHQUJMWklkZzlwR21TV2t4TmxyQzFEbk1FN21JNmswblZ2THRFWEFs?=
 =?utf-8?B?V1VXaDZodmFBZUg2WHlMalhyRlp2Zmk3ekIzYUFuS1RBM0JiaTh3dFNLeUdW?=
 =?utf-8?B?Um1iY0o0bEp5eDNzSEF1dnJZZ3o5RGFGKzMwTjgzZEFjSllka3lJcDRxdG5H?=
 =?utf-8?B?U3E5bXhGSmtzeHdvaWVsODRoODJLUnVtYXp4emd6Y01oMjdwbkZZYTdRd3Fv?=
 =?utf-8?B?NDZhYjNVM0hWY3Q0WFl2c01UdFJZdVhMWjZmNW1wczlIeUprMVFpMkVIU3FU?=
 =?utf-8?B?QWFJRWVSR2trZDNmNjc0ZUVTaWhVUm90Wk1pR3BsZDU5MmxDZ0hDSnVoWWx1?=
 =?utf-8?B?cmp6dVpYQXpYb0tQUE1CcVRDaHZMVkZ5NWgrbUN1cVViVStoaUFvNzZEVTBF?=
 =?utf-8?B?RDdTMWU2b0lBL2tlTjVqOTB4TnBDd09TSnZDRUlJYzhLMVBLalJwRjR4K28r?=
 =?utf-8?B?VTIzTERhSkVOTFRMbVQySXRHUGExYk4zbWprOENUTEw5aE5IRzRJT2NncTBC?=
 =?utf-8?B?dC8xZFJBUmRGaTZneUU1RUlYRTFxaXVQM25yY2ZFN0pJeFBiYjJMY3c3enAr?=
 =?utf-8?B?VjVzMXFmOGdlYWI0WFY5cUpxcHJkYlRwYXJXNVNDQTZoZm5UUzVnc0g5Z3ZU?=
 =?utf-8?Q?qiwpHcruAunhvYWZ7d2bmhSiWRCppU5s9NYQKQW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd279e79-082f-4e72-a10c-08d97821270e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 08:16:43.5009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mUWtoqU5EyzWEL/iixc/bG94fNcdrflUau2fU/9IrgofYG6wW00LDsL/wSfhXrwQoE2srQQQZkypr43kM1cseQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7087

On 15.09.2021 10:03, Roger Pau Monne wrote:
> If the new gfn matches the previous one (ie: gpfn == old_gpfn)
> xenmem_add_to_physmap_one will issue a duplicated call to
> guest_physmap_remove_page with the same guest frame number, because
> the get_gpfn_from_mfn call has been moved by commit f8582da041 to be
> performed before the original page is removed. This leads to the
> second guest_physmap_remove_page failing, which was not the case
> before commit f8582da041.
> 
> Add a shortcut to skip modifying the p2m if the mapping is already as
> requested.

I've meanwhile had further thoughts here - not sure in how far they
affect what to do (including whether to go back to v1, with the
description's 1st paragraph adjusted as per above):

> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -2799,6 +2799,13 @@ int xenmem_add_to_physmap_one(
>          goto put_all;
>      }
>  
> +    if ( gfn_eq(_gfn(old_gpfn), gpfn) )
> +    {
> +        /* Nothing to do, mapping is already as requested. */
> +        ASSERT(mfn_eq(prev_mfn, mfn));
> +        goto put_all;
> +    }

The mapping may not be "already as requested" because of p2m type or
p2m access. Thoughts? (At the very least the new check would likely
want to move after the p2m_mmio_direct one.)

I've also meanwhile realized that it was a different form of short
circuiting that I had been thinking about before: XENMAPSPACE_gmfn's
idx == gpfn.

Jan


