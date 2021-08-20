Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD07D3F2790
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 09:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169273.309220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGypi-00040p-HK; Fri, 20 Aug 2021 07:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169273.309220; Fri, 20 Aug 2021 07:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGypi-0003yU-E9; Fri, 20 Aug 2021 07:20:54 +0000
Received: by outflank-mailman (input) for mailman id 169273;
 Fri, 20 Aug 2021 07:20:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nWHd=NL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGyph-0003yO-9o
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 07:20:53 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88c18adc-3284-4892-86f8-48ae57bc7753;
 Fri, 20 Aug 2021 07:20:51 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-7-ukEoMIbENaaDRHFNdF464w-1; Fri, 20 Aug 2021 09:20:49 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4351.eurprd04.prod.outlook.com (2603:10a6:803:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 07:20:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4436.021; Fri, 20 Aug 2021
 07:20:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0302CA0002.eurprd03.prod.outlook.com (2603:10a6:205:2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Fri, 20 Aug 2021 07:20:46 +0000
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
X-Inumbo-ID: 88c18adc-3284-4892-86f8-48ae57bc7753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629444050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pRclRdqZMGr2NtlBUe8zp0wzer2UlOTGNoxwPQ/eZrs=;
	b=U9Wu/rE2e5Ok0DLwoHHS4elTioO8sHV/0xV2oKVDjdIhNAni0n8/VNQTvt+ILtZ630D6T3
	igCi1ux8ZWkdNmzmNIqfVur5i5i8DCF0ZcaRdDZJA/IOjWUt0rbRfnxt6qbI6Fx8Dpjr2b
	OqmJyEUz6JyCKYxGMqJSfwYPfxwqXWU=
X-MC-Unique: ukEoMIbENaaDRHFNdF464w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=geMWvJGl58hEk+ajkaByLcZAkG1fEYLCz19NKpH8zTBnJarXQP8owSOE7UFWt3VaU2RF5HNPFHxSrpFkGFuZBlV4axQjnCJ7GPg0+IzWXIcyMzWLR08/g7YA752ku8UiCdVgkoA2QSLFL4cLo/+9RdnIcVB8+P0P4SVZjPfsBAfkSpCDp6rYH2LppB2sFK2/sGaXQ/qpVSZ9a2KBkcIBKG7GX5dgEyVh5n9vuRkVwmucCaN0Cy60wAYeNbDEBaj2m1MaaWbpEqgqurllAepVB94vyT0wjhHPH3zxdEHQ28jouKdXRz6YMQNWioTxUEKR58UlIcMuoPqX9stYrqMw3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yx9O5pcSjDoxiVNVRlYbcCX9Ny92lc/LeG3Tlsaib8o=;
 b=iJgEIEf6eRihi1nGEESTtjVO0NcllNPIPXLhYRTfyLix2Bq/G0uPq0aUEbzRGsd3Azdd1Tikf/nryVKJeVTDglx7ppgaNFNE3+uNXRG7c8WXyuxpyJ43+CIWJZyNcHdjz0BkX2OoiLuonz34oQuvzS3A6QtF+q+UhNJR72YNtVS3uHhLBDWFjHXcFDBgT+8jRDljyq0vyFR3JSOFVG7wI2cQgSlM4++lpHZ4bnkppqZejezft4vC3XgzFqtsyOjNSh0nZLQEqS+1ROo90txOJJi2TNmq92CXECAWYZWaRlM7TYzq7ziarQdU0sLF76crFimF6Lyn7IRUc0sJhJLQ7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: Ping: [PATCH v2 00/13] x86: more or less log-dirty related
 improvements
From: Jan Beulich <jbeulich@suse.com>
To: Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>
CC: Juergen Gross <jgross@suse.com>, George Dunlap
 <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
 <b77e536e-1113-6fc2-55b0-b6b4f7b91b18@suse.com>
Message-ID: <5e55a871-88f3-de22-a1b8-7498577c8d05@suse.com>
Date: Fri, 20 Aug 2021 09:20:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <b77e536e-1113-6fc2-55b0-b6b4f7b91b18@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM4PR0302CA0002.eurprd03.prod.outlook.com
 (2603:10a6:205:2::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bb0c84f-ba12-4c2e-b931-08d963ab07f9
X-MS-TrafficTypeDiagnostic: VI1PR04MB4351:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4351A25ABD1FDBF65D9A34ABB3C19@VI1PR04MB4351.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B1sWIjuveylaF7/hI2P1d49m4G5nQOBhbLhXYf/0JBK+VH98+ASxOuNnNIIl8hT+v9jXzK3Yi7k4iIxcXbqgjc/q5NdUicEs8/9mKTaStefrocdw6QLGCsVNtwYMr8TtCHHkIiFhce3k0f8GdD3onV3WyjnP+44cXPSHPVYLpVCXbgIcmliUmY0Qxa83RKJvSa7mrTUkST4W92AOl1ZAUAEa4smNvPLWODZx4FeAWwaEJgRG7mESpk/ooDDOv5t2C4zOWQNRuE9+Jd3GEIzzafp2sS3XMEYa+K1rCSz8gG50uZOW0li/90pmz3LdbusGkkv0iT08NKKjl/s0wNV3oKmDR3n1PJtS9ZZv+wG5PYckJ8UhKcf2jGBcp8qKQgiw3pJaqacmdaImDuSGpMcrpH2G8nbNhOFxAuMXP7ZHexxcPqV9QWadgvHS+t0KwLRXTNSzcQK3hgfdLCBAv2Z3bCVHVdm0zrvSj+CBarTc8UifGYs844pbD7odwqfEIaOcyzwe3TPAN5+P/KF/RkSvSE5NMfNJLd7yxia/Hb2hUdN3SG26OU/5ZwJGfDEXd7bgY6yZy8HS50hmXUGeoidneBZyp50OrQpxbAKZn6i3Oh/yvbrQI/6S0eqao9to1nnwS5FKDOin31LrQTvKrFV7FFCF7mjQSzKRbubtnwWD4L/qkW2xu95HGLWeMUYD5pofqAzzggvYXvSec1OPLzbVHHpJVsxD75+Lr+dNyUdAU5JeDbJwrgg9AfS1g6XebhIb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(38100700002)(66556008)(54906003)(2616005)(5660300002)(956004)(4326008)(6666004)(66476007)(31686004)(186003)(36756003)(86362001)(2906002)(66574015)(31696002)(110136005)(66946007)(83380400001)(16576012)(508600001)(53546011)(26005)(6486002)(8936002)(316002)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IFA5boJ1++5jwhYA9nkE2tFjE6pdlritqOT/7bhSDXXl94fFVCZYdFHbEBEg?=
 =?us-ascii?Q?RvNasqyH7hH25SKZCo/oB7nbOL0WgEwosbJAB5Yzz9pU5RqJg7V6NTGrcLJD?=
 =?us-ascii?Q?9xwW18QfAOhBBtBtuqgoemKX3JDY+97eezPdrs0h+y5xCPi/7DnFA2vDTHQh?=
 =?us-ascii?Q?cYMaDBvNP4+0qrh2X6/nGUFz1a6voKH1sidB626LzgPGdweil1dVnrFBYHWk?=
 =?us-ascii?Q?84tZQAU9e5BeB8mcC85Q3jMdZIa3zEjXAFWzGFgFlhbNChaPdTDTITJtm5NG?=
 =?us-ascii?Q?tHAa7C5M7QDD0wlirjIDNNEAwHcQBJZxXXRRE/+9eK2ZxAjzoiPK0EUctRCu?=
 =?us-ascii?Q?sAxIRsGS55hkpFpueVWFvZOQdz5V7qkQkop2GpDKHdSWaIMiO/prHB1ze0Ou?=
 =?us-ascii?Q?7EQpFetGOBxbLagTn3MAgWLbk16Es9NobQbEZa3OwkTZ0kYBi2tZI+rGCb0v?=
 =?us-ascii?Q?c1ChcSJWszIHEuQdltpyn4z/2bLmTNd953IwYSw+E13aKr44+JQJoMncUZ3T?=
 =?us-ascii?Q?zSogb26WT15/tjvgd1BCifHZZqaagi/OHqEpZASf7WrfGocZ2lIwR4L2L8bp?=
 =?us-ascii?Q?hZ9doihc4ZcSSZt/SuL2taEuDJMuCI4zLsJR0cDw3y0mhK+v0Tl4Cbxdu11r?=
 =?us-ascii?Q?ece7UoFyg9gpXXD+C3/CX5fdMXHbcIkcGxCy05m1kRtfgYCwE3QZbYK4DBcE?=
 =?us-ascii?Q?6T31K+T9b2mMAjcckHkMx+KV+7DjR8HwKivftgxrYlVTaxYkcfJrMwsblSv9?=
 =?us-ascii?Q?X+U0CGQXKHFYophEBSifovIo5W5qVoNaETJoaPzJb3PnohEiWCx10+aN3wSR?=
 =?us-ascii?Q?TDcdN5Z+dK9aZ8MWEjef45a3QYiQUrJs56XkGqmG2kwXsj/3LH55GWoVw6Ik?=
 =?us-ascii?Q?MordFesVXYlsTicK+w86NwSGsfUwQ5eWoxV5iH6jmYuZh4r48ogjXBddJThn?=
 =?us-ascii?Q?Iv0QLWftC9f1p8DqtsnfFySRSFu64U3Y98T1PojbY9iJ09+M4vzucnLbyg41?=
 =?us-ascii?Q?+vLU6zxx4uGonVrhtiNT/S3TbQepUvoONibrKmbZ5OysR5JehLj+e0+GPfc3?=
 =?us-ascii?Q?XN4ptDp2yIGT85DHJB52bwJNw5sddgjCHyM0Q2ehnqsRLKviudWdG0zO5lRm?=
 =?us-ascii?Q?zWBkyvy//B79m04PgEmDDtQS9ovjyaDNpdqveFFFUOQyJeZXvE7twM6ME59V?=
 =?us-ascii?Q?c/zrxJVF/69t9rIfaTH8i/arv/NfzupFHUQHO8IrNu8OSXVVCj7Na51YJ7FA?=
 =?us-ascii?Q?P5vHoCCVETXPIb5d1ElIITYpgRMZJ8K0fgEXxDltfbC32Q3NJfQ45lpIETVo?=
 =?us-ascii?Q?7pzcPOm0D6q3mIZkm7D891pE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb0c84f-ba12-4c2e-b931-08d963ab07f9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 07:20:47.5908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nuldvvo6MwbQ1yEoqSNfHVN2c0lBfBBE8/L6KT/kPbJQy0jJ43uHS8aqm4864mTxQfLhdA1TPkiVDyf/vPuPkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4351

On 19.07.2021 09:46, Jan Beulich wrote:
> On 05.07.2021 17:09, Jan Beulich wrote:
>> ... or so I hope. This series continues the attempt to deal with
>> the ovmf change putting the shared info page at a very high address
>> (which is now planned to get reverted there, but the general
>> problem doesn't go away by them doing so). There are further issues
>> with truncated value, which are being dealt with here. But there
>> are also not directly related changes, when I simply spotted things
>> that aren't very likely to be right the way they are. And then
>> there are also adjustments to the underlying hypervisor
>> implementation, with the goal of making the returned data more
>> useful to the consumers.
>>
>> With these changes in place, a 1Gb guest which has "inflated"
>> itself by putting a page right below the 16Tb boundary migrates
>> successfully, albeit the process takes from some 20 minutes to over
>> half an hour on my test system.
>>
>> In v2, besides integrating 2 patches that were previously sent,
>> there's one new patch and otherwise review feedback addressed
>> (albeit there wasn't any for a number of patches).
>>
>> 01: libxl/x86: check return value of SHADOW_OP_SET_ALLOCATION domctl
>=20
> while I did get an R-b from Anthony on this one, but ...
>=20
>> 02: libxc: split xc_logdirty_control() from xc_shadow_control()
>> 03: libxenguest: deal with log-dirty op stats overflow
>> 04: libxenguest: short-circuit "all-dirty" handling
>> 05: libxenguest: avoid allocating unused deferred-pages bitmap

with J=C3=BCrgen's R-b for 2, 4, and 5, may I ask for a maintainer ack on
at least patch 2? While I did address Andrew's comments on v1 of 4
and 5 (verbally), he didn't indicate back whether he was okay with
my replies, so some judgement may need applying there when deciding
whether to also give an ack there. Thanks.

Patch 3 remains controversial as it seems, unfortunately.

Jan


