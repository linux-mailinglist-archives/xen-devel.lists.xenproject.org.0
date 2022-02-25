Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A70B4C3ED2
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 08:16:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278755.476129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNUpo-00080p-FR; Fri, 25 Feb 2022 07:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278755.476129; Fri, 25 Feb 2022 07:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNUpo-0007y6-Bb; Fri, 25 Feb 2022 07:16:12 +0000
Received: by outflank-mailman (input) for mailman id 278755;
 Fri, 25 Feb 2022 07:16:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNUpm-0007xz-HC
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 07:16:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c982be19-960a-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 08:16:02 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2057.outbound.protection.outlook.com [104.47.2.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-UGmoo5HzPbizNbkA-Hhh3A-1; Fri, 25 Feb 2022 08:16:00 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DU2PR04MB8646.eurprd04.prod.outlook.com (2603:10a6:10:2dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Fri, 25 Feb
 2022 07:15:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 07:15:57 +0000
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
X-Inumbo-ID: c982be19-960a-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645773361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6psnJpzd9Jc7hs0y3CIABWWV9FExx0g5VblraM77pcE=;
	b=AHCVGh88XpfLZCKO7wJrCMeKx7IlSSKZDuGh8LxsNnS+4iLtRbN7s2Cl820vYPrRFuZfNl
	qtwhqlS7B26t2z5clP4p5C5ab4Wk/AIx+9x0VNWEOa97oJHNpJ5dtbjWds1cja3o+qSvHl
	r2N7DcEcHlfxKivEGsrqNA0Hnmgtcs0=
X-MC-Unique: UGmoo5HzPbizNbkA-Hhh3A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AyOa4jennSvY6JH7GL9DMFYCMUPYylXOAHiXQPxK+EdzFTdQNjKmPkYduGr3+JC9l82lxu2T/vExBeZnVndoPcd5xCIZfJNBPaZWOyk5jN8QAakgBCrE3kQ2K1uJn1N0nUcScS/dPvqk5zYV10mXMm3PcEO3//rWKVBTMbcD6McHPfVzlyUp0caXDVLuP2omre97v88LoMLdF26my5PY3G4pNkHdjg4o+72XHl4/rB/DxlcvoNIPn8NVabevVGn45MS+nGF7GNeZLsbeCsAZsrs84LYXVTVhD0Zvn392uhsP9SkVKoDj6sKM4uQTHy/nKAR/9RSpTJF34vj/l4Ujzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6psnJpzd9Jc7hs0y3CIABWWV9FExx0g5VblraM77pcE=;
 b=h3xdHdx7L0uc5Vn7SAWrGBafPIW7DAQuVY6isFzPzGLc4koh1ITbcOcCgx12c/RKG3l97ezWJQF1S9JeZejd03wpa7diAKD3ScptdbmL9Qwz8jj9+Js0OLjdvJha14OOsmkEvevI7LnkTf51J1Tv7u2t4QbRVK1pnzJhWkiNYfbSb1gyjvh8DKXQfp/fGdsYIdemLIJrSyny1S/c289rOu8XsTP3VuQKt3FYdtZqa6EwBRwrJdZyIWy7FcEzgy15gylT8lQ+2DnnMkVMDA6lxXGHuMhi36Zg267+8joxPuz94xhUK+44d0L0rj73gWwdXypM3WZYfi7HoSToM7S1Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d3814109-f4ba-9edb-1575-ab94faaeba08@suse.com>
Date: Fri, 25 Feb 2022 08:15:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [BUG REPORT] soft_reset (kexec/kdump) does not work with mainline
 xen
Content-Language: en-US
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <BYAPR10MB2663BBE2CEECCC4C6504B190F03D9@BYAPR10MB2663.namprd10.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BYAPR10MB2663BBE2CEECCC4C6504B190F03D9@BYAPR10MB2663.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0415.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca35854e-4d2f-41e4-79bf-08d9f82eab41
X-MS-TrafficTypeDiagnostic: DU2PR04MB8646:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB8646D77D332203B482C73CC2B33E9@DU2PR04MB8646.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IEsDlJ+YIvAxlEnEPhrWQQ0iM1rxVCVB3CnDyHfRDcfuwvQoETzeB0LOsyqXTK+Io8c4LANl3QPe+ecqW73hFvqc8KSUUUkhm3YXTV/J+AfbC9yTQqXfW9RZPjahKzAv7mL9aj1RUBDCsFh7PbLF4YxOE6v+8eNvGsivF6Z9DHox40Prcq0a9BzYVHaUYBAc9lH8ZY9mOl958uORAPbOcr/41NrIXOTrolYsteagmMs2pmTGjtUZm2aZaKRbKaFjl5ebBgCsY765p/0Lxedv54MjNOYSVmr9ENxsgVKgzrQuP8KXd+VjXkcY/LPC7/2g84TE4ldQpuHe/d2MrYmCNmsXP/WyG/+v3hoQm9jqnV/2vjYtlk1xin1yt9jETddF2FctrDvPAJxsH0JmB6h1GkoWF9NFQH7DWv5hltrwPU8o/DdPIAeM0I/rdB80KIvN/p+D+DnwfpnMu1mtJOXidKfhmc25c07v6tXeAM9TdcotFUk+bZRqc8qFjiniIjYP69xP9isieA5EYdYOyfMjxP2JQ3slU9zdgo8TQojIHlPS7tEo1Tdyb5WH0tpK5joBHreUS5YhbVjNulfiL4zSJkdAlxS/RJhpP+/eXTVaMpGbTNU0Z9ImZaKuO6r2fyoXUYKC9Cb+ykEzwNpiEofCZXvv5BFwi4K9o9kLz9NZpHzC+PpAzEvf+XoPrFtA9SOFYyTM8mhQ3c6bpliHe2jGUs8O0RlENpZ9/4SAnO01Mo8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(38100700002)(31686004)(66476007)(66946007)(86362001)(508600001)(54906003)(186003)(26005)(36756003)(53546011)(66556008)(8936002)(6916009)(5660300002)(8676002)(6506007)(6512007)(2906002)(6486002)(4326008)(316002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEtQVXBBUzZLT3RFM3VpYnR3MGhsTVBZR1hLeWtIZHcvQklYeFF6U2VEcWdh?=
 =?utf-8?B?MGRBTFdra3hGM2FpM3BQeVpzOTdDUE4rU1NrWUlMT0UvKzBJUjU0NFZtZDdy?=
 =?utf-8?B?Ly92S1lHdERrNzRDdWJXUjhsMkl1MHd3c0NKMkVlOEVoM1hVR1MvM2I0WlBj?=
 =?utf-8?B?cytSaXJQN3NLZTBPZjVhZ0l5ZDZZSUFrR1NSaUtDaGVzL2FPRXVhU09CSVFE?=
 =?utf-8?B?bEcrWDE0ZEkxaXE4dHdoeE9PVUQ3K3NVckRNSDV2Sm5wQ2IrbjRobU9CMnN4?=
 =?utf-8?B?TmZpMTNKemVvU0IrVVM0WExlVSt3LzRxYXU4UFU2RFdzNncxakUrRXlaTVEz?=
 =?utf-8?B?Sms4YytWMjg1eVdzK1B3d3ZjZDhzT05TSm1zZlFLTHFPU2ZGRnFQTjJZT0dm?=
 =?utf-8?B?RlloaU9tcit3TlNYT2JmVURRWnRudXF6NVFmNzhYb0Q2cHpSRmFXOW5BVTlB?=
 =?utf-8?B?VzVHRmFUMGlqbEhQbHluOGRjU09KSXV0ZjRuaEtkZ0JsWDBSSlRGQzdaeWNt?=
 =?utf-8?B?NjBUeWZYOTlaOHIyODhXUHJSRzF5bkF6NE9TbmhnMGxrYzFyUUdTSjNlTDJE?=
 =?utf-8?B?dExUY25RVXROU2FqTEVNdThhSTJIZW05SWtEdW9NSFFXSGd3SzZGVHFtQUdu?=
 =?utf-8?B?STBVa21JUXlxUUtxRTNBbWZKSzFiV0hDaDFtMHFjTHVaMWd3V1ZQSGp5K29t?=
 =?utf-8?B?WDdyQ2RGb3kvVWRIbk5aV3AyTUNhQjlUL2FmcEhFUFRiT2hQNXFrcUwrMkxR?=
 =?utf-8?B?UGJTYnNEQ3BHeEZQazRIWStVWXNFZHlnZHBOYktGNlhHVU82VWVUYTI3ZytD?=
 =?utf-8?B?RGhEb0htUHBUZ3QrQ3V1QThBOWxDdkdsZUZkK2RMeG9NMGZnMVFpUlY3Y3ph?=
 =?utf-8?B?Q1djaWQ5UzRxTWp6d1k4OGdzZUpCc0VFRDk5b3FYR2VVM3lPMmpPRkVRZ1lz?=
 =?utf-8?B?KzNzenRudkFKQVRRVTBncmt4RXl3cEt5RTJLUFJNaU0wN2ZLUDBYNFBKRmpZ?=
 =?utf-8?B?Qlg3aVZzTzlJV1JoYkRqSWdhdHprQXVidEcwckpXQzFNdXhNd3dtdE5YaEdH?=
 =?utf-8?B?QVh5eCs2cXA1QjZIQVhyTC8yVDNGMG0ycFFJaXl5cWsxNUNSK0grNWY5dmdo?=
 =?utf-8?B?MFAzNnVTYmtVdk90bWdKU0ppRVRTTkxhZFRDREJKM0tRRTBldkZoMUtZbStK?=
 =?utf-8?B?NmxRalVsVDJUM0FDMVluRzNCM2lhZUlyVHlvRE5ENjdWK1B0Q0QxaGl5dHpm?=
 =?utf-8?B?alFQT3pvdi9QdjFobmxBNzB6di9DTHJaSGJpNlpVTVNKWFY2MDlYajNxeXhv?=
 =?utf-8?B?Z3cvQmpoM2ZrTVdOSTEyWTBuY1dBclJHaHVRTlFvUUNwVW5ZaEpKRno2amlq?=
 =?utf-8?B?ZzNoZDZObVo0Z2pNUGhmM0ZYNnVxWEhVS1B2ZmJ2R1Y4STZxK0ZNZG5GUi9I?=
 =?utf-8?B?TWhJL3N5dDEwVDUySENjT011Mnp3RnJrL2xiUVR0TzYwRVJ0eW85K3h5STJs?=
 =?utf-8?B?YU5YbllUWC9WS01PQTgrQ2l0Y2FOb05mbHh2YlJISEVmaXZEdWdOUnpLR3JI?=
 =?utf-8?B?R3ZsNEZhMDkzNjc3cmMwOC9SZm03dmJDbU5jUDkvVXRoWlZtNkhFUGptano5?=
 =?utf-8?B?MHUxZVNEa0I5N2QyM2p2N3lzMlBlb3pHNVNXZG8xTFVQa3pNbE45RGdMZzhh?=
 =?utf-8?B?bW9GVUZGc0JpUTN4ZlBBVUJJajZZUmxhdnFsQlBkTEFqWU9kT0NaL2NJdndC?=
 =?utf-8?B?T1J1QWs1d1JtNEltclRZUWFoL1pvNnh2aDA3US8wdkVZY2FvODNZdllmVW1n?=
 =?utf-8?B?L2RpemorbVRCRGRubTlMVlBWQlB2Q00xOWE5Y09tWElNOWNVVXkwUkowSHNG?=
 =?utf-8?B?MCtndys2REFSYS9vUEF6dksrNXVEVjJhRXJaS09GYkh6UjN5VmRKbGdjWGZk?=
 =?utf-8?B?dnUycEI4MW55cU5aNVdBREVTazI1SCtTL3Vsekh5bTJpUzdaME5NNnIvbkds?=
 =?utf-8?B?c1RYRzlOdVNwQ25icEpINWRZY0pQQ0xPQStTZGM0ZFV5VUc1dHhQQTFJekdD?=
 =?utf-8?B?Zy9DTEsrVyttWnYzazM3QWRtUjhsOEwxQjFORFY5aDhPeC9ZbWRJU3JxK0xN?=
 =?utf-8?B?ZW8vZVlmRkdEMkYyUVBhVW95OEFjVUxDZDNKT3pRek1jd2xzVkRlUXlIVGhD?=
 =?utf-8?Q?zrFINNflLaxmziyjDfL8yxc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca35854e-4d2f-41e4-79bf-08d9f82eab41
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 07:15:57.8139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rrsuk+B8EKLmuA1MYRHo7yBq0EthvC538dgv7IWVWHtdvC+nNAYFc3GFWHoem8LbPFx2/SeXjcPPDiwyngisqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8646

On 24.02.2022 23:27, Dongli Zhang wrote:
> Hello,
> 
> This is to report that the soft_reset (kexec/kdump) has not been working for me
> since long time ago.
> 
> I have tested again with the most recent mainline xen and the most recent
> mainline kernel.
> 
> While it works with my old xen version, it does not work with mainline xen.
> 
> 
> This is the log of my HVM guest.
> 
> Waiting for domain test-vm (domid 1) to die [pid 1265]
> Domain 1 has shut down, reason code 5 0x5
> Action for shutdown reason code 5 is soft-reset
> Done. Rebooting now
> xc: error: Failed to set d1's policy (err leaf 0xffffffff, subleaf 0xffffffff, msr 0xffffffff) (17 = File exists): Internal error

I don't suppose you tried you track down the origin of this EEXIST? I think
it's pretty obvious, as in the handling of XEN_DOMCTL_set_cpu_policy we have

        if ( d->creation_finished )
            ret = -EEXIST; /* No changing once the domain is running. */

Question is how to address it: One approach could be to clear
d->creation_finished in domain_soft_reset(). But I think it would be more
clean if the tool stack avoided trying to set the CPUID policy (again) on
the guest when it soft-resets, as it's still the same guest after all.
Cc-ing Andrew and Anthony for possible thoughts.

Jan


