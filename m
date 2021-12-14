Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A69F473F20
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 10:16:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246454.425034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx3uV-0002PG-4O; Tue, 14 Dec 2021 09:15:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246454.425034; Tue, 14 Dec 2021 09:15:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx3uU-0002Mq-VX; Tue, 14 Dec 2021 09:15:46 +0000
Received: by outflank-mailman (input) for mailman id 246454;
 Tue, 14 Dec 2021 09:15:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pVj/=Q7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mx3uU-0002Mk-34
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 09:15:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92e31ee6-5cbd-11ec-85d3-df6b77346a89;
 Tue, 14 Dec 2021 10:09:42 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-DSOQbIZyMA6MgJQ8qvuZ3g-1; Tue, 14 Dec 2021 10:15:40 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3773.eurprd04.prod.outlook.com (2603:10a6:803:1c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Tue, 14 Dec
 2021 09:15:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 09:15:39 +0000
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
X-Inumbo-ID: 92e31ee6-5cbd-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639473341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YD4glZCj4drqvstXxR8/NkCaDF2O/dfIVHVwp/Ydyc4=;
	b=Al9TkKtixmcKOvfWeFlNvJecnQcEeYFrCn2jC287b8diZHBWkqgBWbmXjHQtU4Pj+nZqsk
	W2B2U8O9B1LwBR1eiaqDwnJl86uqlRnhgxaWUOUzo7QNga1SwWBtlbJo1fLc/JjJu1SgZ4
	BKWwEu+fmdnASJTiYEvCnvjOX4uIZ/U=
X-MC-Unique: DSOQbIZyMA6MgJQ8qvuZ3g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=avkMExzUrsMZ4Uj0KufpIDOAc/mMyYrDuenZwmcLhNik25YxeGtUzHi9R3Dv3nkcWUFomZRCy/9QtS759lV82V1MXocvAFgNGx1xcGTy78EqQKhyvQqD/LHwQJI9/d+XCLBFnLAOH1WuN0awnfc/RSOdMn1E6A6gfhXHO346N0wxHPVJX2aevibH5M8u5vcaNk9q+zRhW+FzxAHWZBFJluNIN5pOzDXRAfgGKbXrpvswij34xYIM4TgB2I8uhsM62PpsDLGqIbf7xrZTNJoFKQb3nv096jG7an66VS779nrkwBvPe9iSDr8bXmadouhTPYa6oBkWpWhBOPcf4s2vFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlUCKYbVT2v00ik+CjmWls5ppUwwUQEydRtTRfPPBdA=;
 b=L9dJBhLl3yxiCeg6mYHrF1DLkgf37WO1wYH7zBE/pNDR/S4g8fFXBG9QdTEP8RaZ3R4CsTimfb8Fe15dCkG2ET6QyA/DPzPiIRJbNja3o+lDMkLUvHDKw8Yrub7pIrb9gXwg8DQblBY6JEdach7w2ndudJIl/zQ73wbrgDzteQnU8fC0SbPMGT39x3rGZI0v07ldqM9zXBpWb0IuNOrK87NGTJZezYaMW1vW31V1fa6+ff7gBCv1UwdiiOOBNV9N90sYzz2pZXoC7INO8wR1QQBvRJHdxEjFpTF1Ch5Mr+NHX3JjN0jvk+xGThOew88NyqQySNRgvui2hs9502a/Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <265f07b5-03e0-a8a1-a665-1fe35436f7a1@suse.com>
Date: Tue, 14 Dec 2021 10:15:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 15/18] IOMMU/x86: prefill newly allocate page tables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <2656844d-47cc-70c3-d7ce-7d83967d576e@suse.com>
 <YbdsAy0huMXBjJe/@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YbdsAy0huMXBjJe/@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0325.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd08999a-af0a-4923-9979-08d9bee24be2
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3773:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB37733462C4D68C3C0FE6DB00B3759@VI1PR0402MB3773.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8Xl6MUZ3upMYpepDoS7EhbwEGHOXUS2g2MRpSRYRsST324Y/ckRX2OUPU8mhvGTIiziaGgPMwTs0urrRmxVrr9fFsIVff7Pe8oq3mOrYGwmMFIlhxyev8fVGOUwuyhfLLBEHB1hW6MUUkEtWCRixYYwmmHcQRBur/tNayb3i/VWw99zggUlaMWLZtmqris6cc3z+ERZJeDh0+f4vfi3pRIIEYtwyHKWsof5v+F6O1OeuYaMv12lo1K3MfoafSNxHQHzkTMFJ4EbXjb3QmzOm2pF2Ia8aSPvqfJeEjkC1haJ/CEpfRTfBYkqL/H9KprLwqRJtTeb8oJ1er48HutFvgu2RQsyCR4cDBOoKI/dVog5GV3X1HwgQdedzO4U80NnHIguHJISFilbF/pPf1LlAwXRjg9GlBbbiJsSfaWz69OV/bkrnTirt6uZcbZPDCl4ywaG73JDdj1gtzTJpXrLDXpvhMCV5REyNZGsifpXO1PZ8sV65w9WON3fyM7Z096cA574sB6Aw3P7Kw8lZ04rsYzEE+hd3YG6DQPLNr2h/i0z7/BkqA6FpPBArKeUxDiGrShcoyHUSHnTtPgidZw/mqf0e7P0Vpt41n/6gMMvnMd9zw+ngzywQAPNrHOwdx5t+UEWgFkw08fpp4Q9xfFgmnDpfkc0uSrpvtB2Ef49xRAA5QlZesrbOk6ZXVqq9drsofuuudgKiaVCMq7rXVSTRlBYZWpTee39sbgVS9+bXcwPoo8a5J5RiWAXjNOJceP4N
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(6506007)(26005)(31696002)(53546011)(6916009)(2616005)(508600001)(4326008)(186003)(83380400001)(86362001)(54906003)(2906002)(8676002)(8936002)(31686004)(38100700002)(6512007)(5660300002)(316002)(6486002)(66946007)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mDNvrWAIWZnkf6jBDRmeoeeG53E05N//5OHGGXShsm9FZpdxH3HGRy3YZejh?=
 =?us-ascii?Q?FfSUcQzTYTcVY7ibPJdVbOoWuvJAjfUL3U4QlmBMWGilM7ilpGvB+N1Ak5zB?=
 =?us-ascii?Q?GpQZejHSwnmyG2i9Bu7x5A5dITdkFIsK6DfbkQzm0V7Mm7ffnmScBOGO/8Q1?=
 =?us-ascii?Q?8YX1Oz1yZegh0L2mJjj6tV7lspUxvdszRZFfEI5KBIEbocwQXqdPJJXRN71b?=
 =?us-ascii?Q?AVHQwCR6apGNPJpb80XT6XPec7ilIj1aq8Kehr9F3uaW2MJ2EwwK/lZcLD6F?=
 =?us-ascii?Q?zclsNALCzp7oQ0fwJyJcm+2LlB11RXFkYCO4Itedmw+kJUYFOxBgzovFUPIZ?=
 =?us-ascii?Q?0lVai7782KBXIUGxMy0q45hooVCdF8lsvV/RGd5c/ngFDN4bL0T2MIWZYUn/?=
 =?us-ascii?Q?XHi/xkJA7o0U3XueO3wsFRskOll6h2whhI/hxQJrxbpg4q9Ug+Ma2pKmf/de?=
 =?us-ascii?Q?fIW1ynNsyVTgoxpnsRMf5jV/Tk1iSSr/rWivGjc9NFiYY+EW7k+cm4GoY8fw?=
 =?us-ascii?Q?XLzQFsKxgOu4R2WbPN1MEQzKaaPEUmrucum+HC6F6YW5WhbX2vD8YuLo+udD?=
 =?us-ascii?Q?eIlbLXeJKANl1X8Fn88ZKupB9jpgABJK0ozetHqIFkxHsj7j2lhCygBqUCPS?=
 =?us-ascii?Q?smrx5Gtpn0kJSz2+Tjmw8X2AI73PQlvfOCKMljZsgy6jktIkFi/3awqDElBV?=
 =?us-ascii?Q?XZ8GYnXJ7LL9K5I2KmhK7dbM5qb0OntkS8lUfKnZQGdK1TiPvD5/22RlCTS+?=
 =?us-ascii?Q?znfLzfXrraSZakOrJk2BOzSIwqOxK722J3egMPqbZsNknEwtesBUlwDiSFwB?=
 =?us-ascii?Q?wr/pzF9qGQpRzJnd/4gYDK1NhqfqUM3Crm1HYDN4QINvvUTyHstJoXgxNfis?=
 =?us-ascii?Q?q8VkJmjJUjiJA7ETNZPhjP9sJNWsLw7Mi7dq+cHkJYZYwcFIdwexALdJdAQy?=
 =?us-ascii?Q?qiUTCrDFohOF0/Yhq4Jtki2CGOJYCxca+qv6bCtwlCoLoLkG9IBHiCmUJ4uq?=
 =?us-ascii?Q?0Did5bxCxrJ/ARM6bc9P3xV3MfgYmoag/xXQWEYkmlUstToflLUC2PzMq2sQ?=
 =?us-ascii?Q?B6PV0tcKT11j7qH6uxiDQOseCNLm9Ovrcm5dutiSD4c0oNPodOH5wl3bEe40?=
 =?us-ascii?Q?dlMA+aVyl8SsAa1KhKICgC0cMzHxujXo4QzL4injE/BRAYXuHezgNdq0SYnX?=
 =?us-ascii?Q?CzWhv16R8pm3t2O08kkpooD4zFrRmby5kXc/jv6gTqBsSYHhzDvnjjjk0072?=
 =?us-ascii?Q?i8Pz7Uco3p2syy2PY1TZyxsh+c5kcvxX4hok0MH3xskryu9GsdtJ28rXYdzF?=
 =?us-ascii?Q?PppQ59ItiKcr1aUffznY66NUZvr9eFqj8TODT8kRzlNPZwjDBWkVVRLN1ATK?=
 =?us-ascii?Q?YfFa0cfjCC2X0sIiYwi8q7csIvXSmMc1n+L0dyv5tzhd0/PlEC3qY3tDtOmX?=
 =?us-ascii?Q?Zok+LFiXkCHARBff1gIvWnLV/Om1IFWPpD2DCMzA6hInenLLIS8LA5v9yVnT?=
 =?us-ascii?Q?D0qR9WuxgLlxGPMQY7qdCJTWhRzdRSEddEbmR1RBFmy16cB4gU3I8UoeFwDY?=
 =?us-ascii?Q?kb6s+cp0YcJhLaSdAl9cdpGnasSXLytiNJK+6KI/2xteznCC31r5VjsbBWrM?=
 =?us-ascii?Q?+4XJhqyyxA9qaPEoeJAs5HI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd08999a-af0a-4923-9979-08d9bee24be2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 09:15:39.5693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCEwaWui8NFE8uA296gbC62i8GLTRxxfWrdvLxJf/eS0o+scRRnw3t3jFxlud8ltHFq9cdL2ZsKmAtXal3ZHaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3773

On 13.12.2021 16:51, Roger Pau Monn=C3=A9 wrote:
> On Fri, Sep 24, 2021 at 11:54:58AM +0200, Jan Beulich wrote:
>> Page table are used for two purposes after allocation: They either start
>> out all empty, or they get filled to replace a superpage. Subsequently,
>> to replace all empty or fully contiguous page tables, contiguous sub-
>> regions will be recorded within individual page tables. Install the
>> initial set of markers immediately after allocation. Make sure to retain
>> these markers when further populating a page table in preparation for it
>> to replace a superpage.
>>
>> The markers are simply 4-bit fields holding the order value of
>> contiguous entries. To demonstrate this, if a page table had just 16
>> entries, this would be the initial (fully contiguous) set of markers:
>>
>> index  0 1 2 3 4 5 6 7 8 9 A B C D E F
>> marker 4 0 1 0 2 0 1 0 3 0 1 0 2 0 1 0
>>
>> "Contiguous" here means not only present entries with successively
>> increasing MFNs, each one suitably aligned for its slot, but also a
>> respective number of all non-present entries.
>=20
> I'm afraid I'm slightly lost with all this, please bear with me. Is
> this just a performance improvement when doing super-page
> replacements, or there's more to it?

What I wanted to strictly avoid is to have to scan entire pages for
contiguity (i.e. on average touching half a page), like e.g.
map_pages_to_xen() and modify_xen_mappings() do. Hence I tried to
find a scheme where for any individual update only a predictably
very limited number of entries need inspecting (some of these then
of course also need updating).

Jan


