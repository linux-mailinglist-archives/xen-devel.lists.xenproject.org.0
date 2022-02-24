Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D644C2B7A
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 13:14:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278200.475362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nND0a-0003PO-4L; Thu, 24 Feb 2022 12:14:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278200.475362; Thu, 24 Feb 2022 12:14:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nND0a-0003Mw-19; Thu, 24 Feb 2022 12:14:08 +0000
Received: by outflank-mailman (input) for mailman id 278200;
 Thu, 24 Feb 2022 12:14:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nND0Z-0003Mq-E0
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 12:14:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42f07dde-956b-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 13:14:06 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-3mQ9okiAO5y3IQ7vVgFEGQ-1; Thu, 24 Feb 2022 13:14:04 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB5368.eurprd04.prod.outlook.com (2603:10a6:20b:9c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 12:14:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 12:14:02 +0000
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
X-Inumbo-ID: 42f07dde-956b-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645704845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iFcbKiV7pDgtimIQ5qREMlAmdkexDbuSeafI/p4F8GQ=;
	b=L2HHDF+GIGnEXaeo2Y+dvCUI4WEOd1nyaqtbTJH2HszIq7uzgCPm+N6vN8HidraAt1EYq1
	v52uLdnGmShMyOGTs+FuBAo9XjgzyINqycJpgGJY4tC9zrfiDVWxESQNQZlW8OqHOD67A/
	4H35k6yeBWzt3Fk98KJz/t+P6MGwe0A=
X-MC-Unique: 3mQ9okiAO5y3IQ7vVgFEGQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZ3JLovKXemRbOocRmVLgAV28HXH1mb0jgciHb/pxJYtUIl7mriXxwr2qJhJoWVaoDcdcjjsn8ja+NLJwZhO/k2CIB026cKIRmd8rH+96w5J1KMhAZ/r8wrh0NxTpwRv5PSPJEUrzuoqFGCJnR9xOV6ZNDHtahBimTdAVW5jQKrQV9mParGpNWC2GtBXd+1YyYHIoDd9ZY/tfT+o9Ya44ojqr+Wp9fjx2qHriaCImz+V2BffDAktN+QQQPhYf5naYNTwPGIXNs+VcYrmhdXiuRXTGtyVZBZUVE78+OT1TCqcxQYLTz+BJ9ybvq5kWC1vphQYZ2xbh0x+p3bzjTTHHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDRMnn1WlVPsQo4HiQVGtzR/ZsNf/YV2+9KXlUXXe/A=;
 b=aqlogofA7RPnGcSZupZPakcLovhXFU5v3vKgCLBOXKLq7RXoeyEtEu7KVr32qEnAEIx+PevklG/Gq3XDtK8p3AVynjsQwJzovkCsZ91moRidlGP5u+ILuYDM4nAsxL2KgfSbuHf9IB1O+8fkAK4JZ3ruejzcSKO3uTg9rObGLg4AIeZEzeKGYKg+T6+dbi347+qs58Ub4gsv62XE2aeCX8s9yPp7dS4JWaMnkfCcGInxB4puxbjt9Az4ywZw/jSzPmVZm5i7c+TiTmyLrH0BdL3C7F96/9tQm5nRtHQQOvoHGy9mFJZSav6MlNIzH6r0ztIW8XpQlYQVdNO9k2Y4QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2c977e0c-9a9c-74a6-df20-a804ff3a9b6f@suse.com>
Date: Thu, 24 Feb 2022 13:13:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 3/3] x86: correct fencing around CLFLUSH
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <91935ffd-a270-f1a1-28f1-645fa4167fcd@suse.com>
 <7026f7df-1f70-0018-a6eb-b7e043b279d8@suse.com>
 <e81ea521-b0fb-e1b8-5db8-025d35077cc3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e81ea521-b0fb-e1b8-5db8-025d35077cc3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0046.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5286f17a-1e92-4ffe-9c46-08d9f78f24c5
X-MS-TrafficTypeDiagnostic: AM6PR04MB5368:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB53682229FC9F78F56CBF49FAB33D9@AM6PR04MB5368.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZifrYQTxYw92XJHI4syMJGJSzjPitg4lfGwqCjFWN88Avxny0aOXPQTMc1bx/N/xe8Erp3kTbQMFkqzO2oXcSNDDbnIODgnbi0f11mjnxqEBRnHLVbCBZa8J95147BD512ehBmg8UsMea7fh9O8ZsOkD16PH84IuKgBm96vtdNlDsFqPTl5mLhJ1uzZMEXmWZ9HBqxX3ra3tLTMkSy0FXgyhRbEdWsSYdNNMWZGEq8IKUnEyTv7vHlOeOj3Dx1+YD6/BD1Z3QZqL/9Ew428QsHbsOM5IXPgTfe7yr1qiVchv69/Bef2E4LevMbRanKotM2WithqaKnMYQujiUXQf5aZB/JZ9/gzPaXqpcYAh/bqfeX5vQamg8uq+5azN2ZBYIlD6P+QhXLVfjggNeHkmBcoBx0ltT1SR1TuIgaSYEM4RM/1VwLlVz++p5cKvWu0hdp3lOfop1kmtjD6AEl10Xlwp8w+2Np2vIB9Y3C1ZVPDKGBfKId2agXTkCmjCYEwkJyKriWMymhsJJqTA7SQx6u4D3aY07vmpNZLc5WL99F1EaRUFS99bMb6KFq2OrBU81eg0F0AH/kUeCG4ggOL9bLFlaC7c5m5J1X3T/9N3OQ6+2gjP6K9v+NiJKBIGF9lrCrw7f4YFdfKNpCay7EvuViuY7+Yq0rtC/SAlhKtfwms6XQuDOCQ9OEjTet05bOHHhmbzsxb4ehEOXMabK08M0Tx5zRGXwFFRueAqjT4+BR8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(26005)(316002)(6916009)(6666004)(5660300002)(83380400001)(66946007)(36756003)(86362001)(8676002)(4326008)(6506007)(53546011)(508600001)(6486002)(8936002)(66556008)(66476007)(2906002)(38100700002)(54906003)(186003)(6512007)(31696002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qMORDpr9Wna3JwZZZQlRmStI54pWbIxLYgQZgnrtluCUDLuyj6FOA4k7nJNO?=
 =?us-ascii?Q?IO+0lS9P3wjZHPCmNp33GV929KNVyAPVIw8IPcSYFErZnQbb2sJa/yb0/T7E?=
 =?us-ascii?Q?4IaSwF52VFimaB4hZk83ivDSH21OoJbWfkuWv2AKy4tK1PL2fDPjSxn5160m?=
 =?us-ascii?Q?zPTLT8lQK03D4g/5R0JwVOjKopNrHKQFkuskVtzN6pD/0PYW+baXX0wa0San?=
 =?us-ascii?Q?YK89JVXiuFNgSYdVV/YcY64tfxUma4rP0/t1LTUTr0qiKKhkONO9GNFnXjBU?=
 =?us-ascii?Q?644mLC/4w0mMIe1QJHFegaFcQsWN00QpDyp6IKQhGkQ8nYfqU7N21lZCUXKf?=
 =?us-ascii?Q?5lHKxw0xp9RLiqCihLv0k/uzocU2ZcTAxfKVVa9kDcEZnSQYO+6Vx0U0lBkQ?=
 =?us-ascii?Q?6OrO/Rf5znBJeYQZghLobzK29pccnAxGtVav6mLLixVsfLz6XRRezbdNmoLe?=
 =?us-ascii?Q?PFhbgF7AJqG1DUS3UnoeEc7QdU+m6cyrdcuYOaN75HP3BvE71sF5oV9AKmcm?=
 =?us-ascii?Q?B7pAkMtFE/I8P3ZLCOaOUZY5ciITx0hbl939OYsGOn7nvqQRBo3LN0MIhqg4?=
 =?us-ascii?Q?Es2wtGsWiOX/Y4KAjpQnV75KCTToZ3Bb/EYfJmqnQPsOOmHJygUizac2+ael?=
 =?us-ascii?Q?QM25lPzr37J6v25wXJ6F0a7Kg4BkVyDkMazuxpo8Bf5v3/69RBIpUQsoRIEz?=
 =?us-ascii?Q?K1NOxr/++oisOG2DWipAjQlA8Hf0rP3jnRL8P1A467aqW4eppT268Sv8GJUR?=
 =?us-ascii?Q?VC/vGRK2xmITszCMvn+Jbf9VCN2pY3D7xsMfOh04FZLkjAcjHVvkH9zdFfi/?=
 =?us-ascii?Q?hOFWuenejfQGeiDqFeRtyFX0cNFHNgQVtU3HcDo36aa0DZPhofMg8pY9Ys9h?=
 =?us-ascii?Q?W/EW5OLp/FAi608331pbNuaj7qm/ttNfIxroJiO0oy5H4lIgLMYcmVCv8n+j?=
 =?us-ascii?Q?dFI51CjxD+AJgZkzn5Sc+LTNzOWGXDzPm4yEa+tAedptqro7gg1cabSGXDL9?=
 =?us-ascii?Q?WuINRT8sfpEjvP1uDO58WT7w7VYLtF2n1JkQIpIkHrIEU2lNZ6MX4iq9EChF?=
 =?us-ascii?Q?5ETnmEmV+0BIbdD7DDg1MWx3Fd3Z6JGfvrb57XNnTvVT2y0uSYHohZliUYZG?=
 =?us-ascii?Q?Hk+XenPy3Srq/4xZdaiG/7bI92jiLFg5zXHDXqfssFOlDqPYTApnTMpxHfu7?=
 =?us-ascii?Q?0dgJBOBJjtylGs9MmaSyLCJaN0HdSdhae88eC4vA7fLodQEQv1LViYfB4Bf9?=
 =?us-ascii?Q?Asv+AY7M50jdW0TCyUdOXxanZmZYItFN/vBHTehV+EcKJbjKpomkDUTfl1X4?=
 =?us-ascii?Q?63v5XPsYZXpdlqucR2T0OexS8zc8mKV96wNQWAUHQ4HaMDZdt+KTmtxKfM4n?=
 =?us-ascii?Q?GAq5V7DnYLsrzwosC4jZ+juWs+EoE2J31nZmEWXLTYGzVRpt+UI2Ne8ryUYT?=
 =?us-ascii?Q?erFP7VmjXW79Fp0EQUWoG/AydhNUt3ZMNSrsJVEpJGrUxuzxtQiK3AKdAOSq?=
 =?us-ascii?Q?phdXfTBntyBLiApFQHZd4z3m9Gv6+JH45CFLryXWI90iqBCsS0fIxQ/AHsfz?=
 =?us-ascii?Q?wR9IV+RInWFrKqC02cDb6eWgxkUMmYF7xC63e3fdyu0mhhOXQd2uw7/AIedI?=
 =?us-ascii?Q?gC3dSoDRbbPywzMv9+xvOgY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5286f17a-1e92-4ffe-9c46-08d9f78f24c5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 12:14:02.1450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PMggpYv9Q5djykgrCA16qzKsoXJwq++8J8ZcS0lkTTtChmybs3gdbTOO8mEZ7OPp52CdTrbzdZ9Bf2yHvGvRxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5368

On 23.02.2022 13:33, Andrew Cooper wrote:
> On 23/02/2022 10:13, Jan Beulich wrote:
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -346,9 +346,14 @@ void __init early_cpu_init(void)
>>  	       c->x86_model, c->x86_model, c->x86_mask, eax);
>> =20
>>  	if (c->cpuid_level >=3D 7)
>> -		cpuid_count(7, 0, &eax, &ebx,
>> +		cpuid_count(7, 0, &eax,
>> +                            &c->x86_capability[FEATURESET_7b0],
>>                              &c->x86_capability[FEATURESET_7c0], &edx);
>> =20
>> +	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
>> +	    cpu_has(c, X86_FEATURE_CLFLUSHOPT))
>> +		setup_force_cpu_cap(X86_FEATURE_CLFLUSH_NO_MFENCE);
>=20
> This is somewhat ugly, not only because it presumes that the early AMD
> implementation peculiarities are common.
>=20
> It also has a corner case that goes wrong when the BSP enumerates
> CLFLUSHOPT but later CPUs don't.=C2=A0 In this case the workaround will b=
e
> disengaged even when it's not safe to.

You realize though that this cannot be taken care of when alternatives
patching is involved? Are you suggesting to not use patching just to
deal with an asymmetry we don't really deal with anywhere else?

> Most importantly however, it makes the one current slow usecase (VT-d on
> early Intel with only CLFLUSH) even slower.
>=20
>=20
> I suggest inverting this workaround (and IMO, using the bug
> infrastructure, because that's exactly what it is) and leaving a big
> warning by the function saying "don't use on AMD before alternatives
> have run" or something.=C2=A0 It's quite possibly a problem we'll never n=
eed
> to solve in practice, although my plans for overhauling CPUID scanning
> will probably fix it because we can move the first alternatives pass far
> earlier as a consequence.

I've switched to marking this BUG, but I'm not sure about such a
comment: It really depends on the use whether it would be safe
without the MFENCEs. (We also aren't aware of problems, despite them
having been missing forever.) Furthermore it's not overly likely for
anyone to look here when adding a new use of FLUSH_CACHE. I'd
therefore rather consider it best effort behavior until patching has
taken place.

>> --- a/xen/arch/x86/flushtlb.c
>> +++ b/xen/arch/x86/flushtlb.c
>> @@ -245,12 +245,15 @@ unsigned int flush_area_local(const void
>>               c->x86_clflush_size && c->x86_cache_size && sz &&
>>               ((sz >> 10) < c->x86_cache_size) )
>>          {
>> -            alternative("", "sfence", X86_FEATURE_CLFLUSHOPT);
>> +            alternative("mfence", , X86_FEATURE_CLFLUSH_NO_MFENCE);
>=20
> An an aside, the absence of "" is very weird parse, and only compiles
> because this is a macro rather than a function.
>=20
> I'd request that it stays, simply to make the code read more like regular=
 C.

To be honest I was half expecting this feedback. For now I've put
back the quotes, but I have a change halfway ready which will
eliminate the need for quotes in the same cases where the
assembler macros don't require their use (as you may guess: by
using the assembler macros instead of maintaining redundant C
infrastructure). I guess at that point it would become a little
inconsistent if quotes were present just to express "empty". Also
if I'm not mistaken this isn't the only place where we make use of
macro arguments being allowed to be empty.

Jan


