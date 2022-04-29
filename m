Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F16C7514471
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 10:41:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317048.536189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkMBH-0007cT-OD; Fri, 29 Apr 2022 08:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317048.536189; Fri, 29 Apr 2022 08:40:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkMBH-0007ad-Kz; Fri, 29 Apr 2022 08:40:51 +0000
Received: by outflank-mailman (input) for mailman id 317048;
 Fri, 29 Apr 2022 08:40:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTs9=VH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nkMBG-0007aX-LO
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 08:40:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11fa5d75-c798-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 10:40:49 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-6ypN7JseNmqecmUMUKnU-Q-1; Fri, 29 Apr 2022 10:40:45 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PA4PR04MB8048.eurprd04.prod.outlook.com (2603:10a6:102:c4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Fri, 29 Apr
 2022 08:40:44 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Fri, 29 Apr 2022
 08:40:43 +0000
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
X-Inumbo-ID: 11fa5d75-c798-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651221649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vMvDhquD3XfZHOdvjxFCaGSCwFQ6pAo0esprgo/AOBE=;
	b=ZYkpd7j5RhTNQyLz0A0hFs76cO3Sykh/Z+Ya87IVB8C1TR22ZI8EW/SPbEGJ5S4KhuuA57
	G8TeUiB3IeyVZFcsednPszCbFzc7xkc8QD5+SLwwaK1LgLPSxWeaacC4XOIO/zPSmD81fb
	Ea0Qkk6ZSsGIxsqPQXpjNaoUlUESnd4=
X-MC-Unique: 6ypN7JseNmqecmUMUKnU-Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HeFOc0R6/CBEHcEhgs123FrOc18eBozKovCfv5nK/ou1TVOPhpqdsvk2XKCVLaTVuuxg3Crd1Axi0uofYdonSfrPCGA5fqTBhyy3bWb+l1r9WYIwrUKmpPv+TogzYw3h0IyIfy+F+kUx+zMfFrZaVGAtKLkFXUETKEDOovav6Xe17dfyjKhksws/lp+plP2Opm+2qVBNmX39w4XTnoGOi/aqBOcDuTtUM6lpxQxgSRYpVn6CUwseOcz/ndVMm84L+h1IlKHVvrti5uS5KWsZnT4xLLtrS3GJFJMr7SmWdgaHRNi2GhbG+4noPnH9WwXittfzxEqJV8lae/chnHms6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZZnOsWbaDgbFjkhszMZ2wDIIRO4kUdz62Qo7Hykl74=;
 b=L73xXj/CpYEFVT7bUFRSGSEIf/V181FZi6g4CG0aNTjsV7pf5D1+9gfmnQo3i4ppoCVa86usqGykv0M6Kj2K8tlzAEfOBKqacH1TecfWzwmPZCUTU6nCgVBYEdq/nAQ4WNotZew6lgpDlqMf2SbHxKpG5/2EAeyxuinfBL+JiqOhATIB9enyuDHGgwC28dBAA0QtXKYXyf9lD/NyFRCTBOQHvV9EfUST4Di6bh3CHcYKgTP37JBA5JRWwugndAhYlCEtZGb/UVNBP3jpSQEUJiWc0OIeGGVBbOtJ+IEQkILRs6bRfkmUQSywbCgui+uc2Yh9jZJQz8uohC+NZKZZSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c9a57c65-05f4-b566-10cb-92ce9ffe9e0d@suse.com>
Date: Fri, 29 Apr 2022 10:40:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 3/4] Add a new hypercall to get the ESRT
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <Yl7aC2a+TtOaFtqZ@itl-email>
 <3591eec7-1299-8783-26ad-ffe27bb9fdcd@suse.com> <YmmUtiBkhEYvXHUB@itl-email>
 <901c11d6-92f0-89b9-8500-4947bbdcd504@suse.com> <YmsbD9ktQqB4U33o@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YmsbD9ktQqB4U33o@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0351.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::17) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d97bcb9a-b74d-4c7a-6835-08da29bbf2d9
X-MS-TrafficTypeDiagnostic: PA4PR04MB8048:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB8048F61A575E502C7DCFA550B3FC9@PA4PR04MB8048.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KgJacxSAtM4YyJhtxz3zn434BjjIJsJcVyVY+g9jWFsMfR3Aas3jIbxJzbjEQ6jExhbLeejKE4kzTA1z1l6mpsw/+q9016pHkzy1kxeFwonbijqwpeAwcIvprxFwjmCUZw3O0D4++QFTO3namzNgecM8A9XfiH6THhAWMiesUtDtO+z0oZZ+m8bbPtdGqhGNVAGz4wCA5k392ca4P0V4y/tkejUmltDxpU/7Wp5RNDFQ6TEaq1lAmjnolTYlps/j+vWUHc3InYtqBZYbTRjY8fYhvragedK/KpuTwgbg9+2evg/nzRrYYfvu5775aGTLSqP7024PR9oDjIBlQaNNlvjOEexT4TIkUUPrG2OBbJjU4gCHsQIeO6FExWIkcxxFYDW2QPuyMuzaXclkW1kuzbt/dXiFOLrvo9Elf0TZtaoVsblcsN3fD2Y3M9m6Cbb7eJVGraE6UKUlNOnsGLbsIYlt7L6rkpEOP+RYviVJy7Z6gmHvAxJJu/FF/zLgaemlvRM61AjQhsz2CyYr0WOXq1FTHAQBFWNwvUk6Gg00bZhTPVAUGNnZT7Y7uO/LnH/xtmEdY60TSN3ReFzbsvuzUgPDGf5+CdRsMI0o9f2KcL1BwNfzhPQCqPB4HEaHmQ651wzcFAsYDdBhqS1agToytXOnt5i0YJAeY+cFhoRfjsaO5BdLPvIXM0Oy0ZqCPMjaxLWOYU0HgrlHgSikSPN4WHrOxzXuKS8FME5gDwV5eI/ftG4R0RSKGxJGFnW5lu6/SFhSfZYLVJxIcqWrEs+m8A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(186003)(8936002)(31686004)(2616005)(86362001)(8676002)(66556008)(66476007)(4326008)(66946007)(26005)(83380400001)(53546011)(6506007)(36756003)(6512007)(5660300002)(6916009)(316002)(6486002)(508600001)(54906003)(38100700002)(31696002)(15583001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qUl5Ga+Xx6Ya19nDWHVPYUVpHRyilqnH/AEDU9zY480htB+wC3FcmFOJ3/xg?=
 =?us-ascii?Q?RCgOQ2tL1J1CHd2S0o420XAOWYxi3ZmQM5dLsL0Qoiu85D3QE8dv/Wjd0bir?=
 =?us-ascii?Q?Mk/LI320tHpWaMbaVAnmBY3bw0fUX31vRq74cWbCGiEbpoVBch2omsJTeTGd?=
 =?us-ascii?Q?6xJ3bjt+v82keJavydUORX4ELKqj9Rs3PxQleWoY1U9xn8apxgi3ZC8SOfsB?=
 =?us-ascii?Q?rSShi81gYLOgpFa6Z0MrYGAb7obw+JqIi9cUFzjcgCfWvLBO6DBqzmmtfH9k?=
 =?us-ascii?Q?wtOQHGGJdWImnd+IQkm40zAzBPo8952ThKGcTv0kDsHNeYjdTq/AS5btvoeo?=
 =?us-ascii?Q?gPnVqp9o+Sgvdf/ZN6Xp0KR2d9FPFLxU2FY/7eqb5DKunxDBoq9bDJKpoz0f?=
 =?us-ascii?Q?uSW30lHUu+P+goT5cmtJ48S4xYJsFuLc8QIEqfc4pGtODwlMCVMde12cuL/6?=
 =?us-ascii?Q?wlr7apWMn9C7Sn5DhSC2j4u4RGk0auwYFv5JI8NWGH8DZXNEVERk5cax5vLL?=
 =?us-ascii?Q?mOuOXiKU4a24rSUI1EWauSzIgUBzmAM7asUKwAM6lfOvOlCxYt2mJd+iiBLx?=
 =?us-ascii?Q?rqkfIXU2tu0gLgq4+QVAprpZMjKiId2UeljSnThZVxZJKGXJIRprT5nTy9nz?=
 =?us-ascii?Q?Li69hVoUqobXYOLIlymWogZnrOf+Fm+dj2Ffk5urGpicKZyzmSbiEEVfO/Ib?=
 =?us-ascii?Q?j7z0375GWu8S6DPaKlmACJC8kz49vrFGKe/18YL4HymHhJoRGNx9P+E8hxWd?=
 =?us-ascii?Q?2EpVzxeA7mTTmsb5jGrZjZ+PZJ2qm4OD0qysfTDPdb2VK1KQhaFDU5t+rQPn?=
 =?us-ascii?Q?tFqgmxG6JF2yHXOoyCm54q+GBZmUg3iQWzHPzZKF4NI145jD7/FWYT1RRplT?=
 =?us-ascii?Q?jY6Hy/jcQbZtgLokQ5MUOwgoa5yls5RzmkzNANy/LcEhZimxQk+AFNDoIlyD?=
 =?us-ascii?Q?A+v0hgIxtvysd8O2pJQZIPnTonPv20+L7LF30rPMnBt+orTbNiR5FElNAKz6?=
 =?us-ascii?Q?8ZYVEQwXzCK0mRq4e21a3H9MiRzK09ZOUhV1TQrbaBzYyDZxBwNY2Jtu9flE?=
 =?us-ascii?Q?cgPBhfitxmgAWvntRoPRqKwFiPg9tDYfB4E3UAIJ1bB0yKNCfleX7V7Xxgrq?=
 =?us-ascii?Q?PiUQ56WzI1SsWNlLTc4QkkDPV5kFrQ9Y3dXJ6M2ZyAE+zPz/MJVQl5HmFaaY?=
 =?us-ascii?Q?jQGe4NlbxJDEre9dDAylqA0h8yBQ9cXthGlkTktPwhByq+O70PqEDkiXbii/?=
 =?us-ascii?Q?/M9Li+93AUu9dw0mh64GB1lbVvmwoaYenl6yPUlrPdRRKMxN8bJNbMPkaKzA?=
 =?us-ascii?Q?tF+7wx55KMpjOL+wtU3Xm7a5WiTP2SepZc/kwq2/kajU0KCnhj67vC4zoe5F?=
 =?us-ascii?Q?BERiKZJgCxUUVYyLxyRiSlqLkm4BqH5fZOmtZFmAyEi47KSNEo/CM8kyadMA?=
 =?us-ascii?Q?amMTXTQjdTYP8M5E0ZxGBqnN51lxv/SbJ1mfPQB9rIqctqZTeUnTGPRFhBrr?=
 =?us-ascii?Q?DVh69Ds52bw/O3i6trqs8j70BL20VUzX6aI2pAPm3j4HwgM/0GUUvfVuD9IN?=
 =?us-ascii?Q?WM5R2V71V+O8Vz9tcfOBDZqkA0fQYTZt1RT35RaUfXqjkktJiqaME95j2SGu?=
 =?us-ascii?Q?8Tkjkp9fDz+Dd9f/snMS0t8hjJffsIz3BQPFFScgEbWDq/GlLPVunOJeFzoU?=
 =?us-ascii?Q?LYFeu9KoHxQIH79ZgCrWXvA5Px0H01rlIhr429QXq1VJCAGKcdkxSfijFvsR?=
 =?us-ascii?Q?dUaDRCf+AQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d97bcb9a-b74d-4c7a-6835-08da29bbf2d9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 08:40:43.7553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gxo1/XSm1JKAT/Rp2SCtx8YKtycWwu4FbKh6cuYKn92xtC4KftOaRb9nRRcTXUyXfOPD3B0eaT4ODL4v3Nzxlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8048

On 29.04.2022 00:54, Demi Marie Obenour wrote:
> On Thu, Apr 28, 2022 at 08:47:49AM +0200, Jan Beulich wrote:
>> On 27.04.2022 21:08, Demi Marie Obenour wrote:
>>> On Wed, Apr 27, 2022 at 10:56:34AM +0200, Jan Beulich wrote:
>>>> On 19.04.2022 17:49, Demi Marie Obenour wrote:
>>>>> This hypercall can be used to get the ESRT from the hypervisor.  It
>>>>> returning successfully also indicates that Xen has reserved the ESRT =
and
>>>>> it can safely be parsed by dom0.
>>>>
>>>> I'm not convinced of the need, and I view such an addition as inconsis=
tent
>>>> with the original intentions. The pointer comes from the config table,
>>>> which Dom0 already has access to. All a Dom0 kernel may need to know i=
n
>>>> addition is whether the range was properly reserved. This could be ach=
ieved
>>>> by splitting the EFI memory map entry in patch 2, instead of only spli=
tting
>>>> the E820 derivation, as then XEN_FW_EFI_MEM_INFO can be used to find o=
ut
>>>> the range's type. Another way to find out would be for Dom0 to attempt=
 to
>>>> map this area as MMIO, after first checking that no part of the range =
is in
>>>> its own memory allocation. This 2nd approach may, however, not really =
be
>>>> suitable for PVH Dom0, I think.
>>>
>>> On further thought, I think the hypercall approach is actually better
>>> than reserving the ESRT.  I really do not want XEN_FW_EFI_MEM_INFO to
>>> return anything other than the actual firmware-provided memory
>>> information, and the current approach seems to require more and more
>>> special-casing of the ESRT, not to mention potentially wasting memory
>>> and splitting a potentially large memory region into two smaller ones.
>>> By copying the entire ESRT into memory owned by Xen, the logic becomes
>>> significantly simpler on both the Xen and dom0 sides.
>>
>> I actually did consider the option of making a private copy when you did
>> send the initial version of this, but I'm not convinced this simplifies
>> things from a kernel perspective: They'd now need to discover the table
>> by some entirely different means. In Linux at least such divergence
>> "just for Xen" hasn't been liked in the past.
>>
>> There's also the question of how to propagate the information across
>> kexec. But I guess that question exists even outside of Xen, with the
>> area living in memory which the OS is expected to recycle.
>=20
> Indeed it does.  A simple rule might be, =E2=80=9COnly trust the ESRT if =
it is
> in memory of type EfiRuntimeServicesData.=E2=80=9D  That is easy to achie=
ve by
> monkeypatching the config table as you suggested below.
>=20
> I *am* worried that the config table might be mapped read-only on some
> systems, in which case the overwrite would cause a fatal page fault.  Is
> there a way for Xen to check for this?

While in boot mode, aiui page tables aren't supposed to be enforcing
access restrictions. Recall that on other architectures EFI even runs
with paging disabled; this simply is not possible for x86-64. So
portable firmware shouldn't map anything r/o. In principle the pointer
could still be in ROM; I consider this unlikely, but we could check
for that (just like we could do a page table walk to figure out
whether a r/o mapping would prevent us from updating the field).

>  It could also be undefined behavior to modify it.

That's the bigger worry I have.

>>> Is using ebmalloc() to allocate a copy of the ESRT a reasonable option?
>>
>> I'd suggest to try hard to avoid ebmalloc(). It ought to be possible to
>> make the copy before ExitBootServices(), via normal EFI allocation. If
>> replacing a pointer in the config table was okay(ish), this could even
>> be utilized to overcome the kexec problem.
>=20
> What type should I use for the allocation?  EfiLoaderData looks like the
> most consistent choice, but I am not sure if memory so allocated remains
> valid when Xen hands off to the OS, so EfiRuntimeServicesData might be a
> better choice.

It definitely is. We do recycle EfiLoaderData ourselves.

>  To avoid memory leaks from repeated kexec(), this could
> be made conditional on the ESRT not being in memory of type
> EfiRuntimeServicesData to begin with.

Of course - there's no point relocating the blob when it already is
immune to recycling.

Jan


