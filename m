Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9E7473E1F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 09:18:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246419.424956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx30e-0001Y1-Go; Tue, 14 Dec 2021 08:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246419.424956; Tue, 14 Dec 2021 08:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx30e-0001Um-CF; Tue, 14 Dec 2021 08:18:04 +0000
Received: by outflank-mailman (input) for mailman id 246419;
 Tue, 14 Dec 2021 08:18:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pVj/=Q7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mx30c-0001Ug-Ko
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 08:18:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59d6287d-5cb6-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 09:18:01 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-vXCM7EHVNoaFqNMoPRoB3g-2; Tue, 14 Dec 2021 09:17:59 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2959.eurprd04.prod.outlook.com (2603:10a6:802:8::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Tue, 14 Dec
 2021 08:17:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 08:17:55 +0000
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
X-Inumbo-ID: 59d6287d-5cb6-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639469880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1M1jZEk8y/cZ4cSseQogy/PTToa4wa29DPrFL1OXdX0=;
	b=DAXRW3cJJRiv/iR8vl2gNcoeN6T2PJKj/VbsOsZAw5HgLYlGoQYpVLfT0Z/x68+n5FTw3k
	fz+aq1uUl0htG2TpiLLZDbL9jzONGWFePBtl3NsnjdtqFDV6q9aMyvnp3Y7b4PqtD1UJ6B
	Zsbwpo9wsAEPvVpo6VRUH4p57dS7hD4=
X-MC-Unique: vXCM7EHVNoaFqNMoPRoB3g-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZMalv9Vih9Lo+gi0Ir52NYo78yYwniSRvULX7Celnft0r3LTilzuUsFFwjb7YN2a+WjjP4wa5ocSLVR54Lif2srjKKZ9zkNXyUYRD2Lu5//5wdiImb0CjDo89eP9U8lAQffkwVQAR4rnmhGPYFTlsvPF5IW/uTUmoL+En5/l3xGs5f6h2fhXGTjJUiGJkNdhijlx9r3Bdxv2XO0wEAaGOpPDePm4KayEUTWUpajIB2+m2s880gWGkeqm27pQbGdRY0WXgVs9RjxrdduQ36HevCynLWD89IqCFLuQHGyD9/bEHzXdEnagz7CA1bC0wGCmlmXlL46o/8L1LbATrNfu/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1M1jZEk8y/cZ4cSseQogy/PTToa4wa29DPrFL1OXdX0=;
 b=ZoBJviMsbeQ3SRj0X865tVNoWIs3KbFgtXV9/+a6GUN5ZZFb/8OXxH2fbEucWDdTJq5FDoivyf1lZ6G2lO4nv947bjjZQNQ9Zlg5kF9Y+kBo0lpxFh69Fm6LCxbWikpky1xfcfKP6ggJvXdjtgBjQAaTaUwwiQuFsi6q728gLhsvMaVhnsHe5sscPhbbp6LvyZOMjbIhJPLOoRbK6XvElNzJqsCBCcdWmjzYXdV+6TkNBbEZkJaMciiUk7dorQqPjYcLoaD2oy8m29aJQQb1N5JF+/jHBZwPX22VHKP07rmwx/BQyiAus/npRfCOKzTF5W+3ZXGEjF6k7MKO9WBW0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <76367980-c0ff-13c6-4a86-24be90f28f8d@suse.com>
Date: Tue, 14 Dec 2021 09:17:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] tools/libs: Don't recursively expand MAJOR ?= $(shell
 ...)
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211213190449.4830-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211213190449.4830-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0502CA0058.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33ea8d61-7e1f-4c89-5cf9-08d9beda3b13
X-MS-TrafficTypeDiagnostic: VI1PR04MB2959:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB295976B20549C9F85F864BC0B3759@VI1PR04MB2959.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qZCe7oOGc248AlakioHaWluCRaiP5nblcZgoTpw9cpdKYqz+uJNJG//qm7gs1m88ZiihIzx2isgGX1OKIw18Dlv20M6mqnkbgfJJr3m+Zv4U6/UTmh/WzY6cgE0QY0xOX4hN542dsCjOQzGZAPSCitmu8pi6fflTgIo0PU+I7WNTRkvq2/j1jTdoVfiHMS0gGU7yVRrAwFUuV56IcXVpZVP3dv6ant7zWWqPg7s1aSI5rKyAs0ST4X3Lzc7+T7APs2PUt1DnoN0nfPcorK5bNiMneOIhWZoCJM5QZT944lgV66kcAu1Zs27n1G6WI4elSdBbMA3qf7Q+iTN/y9Z2DRV3hm1FG/lHpqQQ3IhKr6GmMcRr4Q3ER60mjJiw56zL0K9mnKMBVu1UrzF0VH/O1eHpXkqvJOhYZimQ3Xrq5eBrGcHk7IX3lCWM5sI0LPQJ6jAgAFqoIg1Enj/D9hcngF4TEYEdBIQu2OwZDpz7Lv6mYg/BWWFQoTfeTJ49+Sz+vOubRpni+hZt4Rd2wMmG+xiUr32ek+QgjCa9GqBH3/NqKdnTV44SLcH0gZo7wGHuETwASnvHlqlI1eQw5rFpyK7B7Uof5mXoA422BylURRu22KIs6U3gzlPQso7VJqUef2I8eyD942DZmHcQs40v53aauxF9Sxju4PDaYK59c7TJWOhLyCJfHchEfd0slBmgs2kYQQuv3Q75Aa8luCZ5azNuu7fzgpYDCF1AL5vuE4bR93JJK/Ad1mBAZMB9kk6X
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(66946007)(31686004)(508600001)(36756003)(86362001)(54906003)(5660300002)(6506007)(66556008)(2906002)(53546011)(8936002)(6512007)(8676002)(66476007)(38100700002)(4326008)(186003)(31696002)(316002)(6486002)(2616005)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHNiN0tWK1ZrTDVpOXE3b2h3YXhRVnBTbG5NV3QrZGVBOElTaEVYZTg2ODQw?=
 =?utf-8?B?VWZ4WEdZa2RvSG5WdDBwdnI4dEl3V3ZGSmtGMW5IUmVFeWJXTk1zMmtydHFM?=
 =?utf-8?B?VWs0ZHoybGU4ejBoOHc0VGZmME9yKzBkSzZwRFdtRk4veldRTkJSd003cGo2?=
 =?utf-8?B?SWIvc1JnYm9ZelYzOUZFQ1ZkWFU5L3paa1dXRGtQNkZTS3ZDREVYSlYrTzlM?=
 =?utf-8?B?MUZROXI2cm5ZMHVreVA2WkNEUVpiUjNFZkczb094ZjYyOGhCY3BRUWRsQ2l1?=
 =?utf-8?B?OTRnQ2JtYW1WYTJvWThValdoU3QxcVY0SXRyOVM4TEc0L1FsU21mbmxRazNp?=
 =?utf-8?B?SjBjZXN3eUwzR3RlamZXdUJsdkZKTE1TRDIyaEpVL0czNVF4MGRhSVBLQ1JV?=
 =?utf-8?B?R0orcUtCREkrSDhPM3FnS1JGZTdUY1B1cmxTZWVEUml5eURmcUhwR2FzVjFO?=
 =?utf-8?B?OXV1c1ZJMGtXKzZXb2ZOc1IwTkV4ajJ6K3VSODBHeEliV05ldElvanZ1UjdV?=
 =?utf-8?B?TW1nQTRJNE03dnBWeG10bTNZR0YweUg2UnNjYXVFelhsRndYTDh6Q1kzQU9T?=
 =?utf-8?B?Und2SGd2Q3pQSEhXZ1lHdWZqK3U1R2JsUzQwMklvaFhobjNZZ3c0Y0xWZ0tF?=
 =?utf-8?B?MG93TTEvWUJta1h1dEZlOUpCSFA5Nk1kK2Y3U3VUeEJNUTgwMjhjNTVQVmls?=
 =?utf-8?B?TWxFUWlBT0Q0eiszYWlYRUlnN1RQNkY3MklXcHVzVnp5aHpkOG0zQTNjYmZF?=
 =?utf-8?B?WUtRcXd2a2pYK0ZFY2JXTkM2dGtwVTZKYlVROXh3UTkzcVlkajZ1dWZ1a1ph?=
 =?utf-8?B?NzJLSDArSkwwV29yOXdIZ3RxRFM3NFFNbnJBK3h2MWQwU095NDR6TFMzVEx5?=
 =?utf-8?B?RExWR3hhZmIxaXdTSExyZitoV01uMGVmbHowdVIxWHhwSng5T3NSdVZ4VDdW?=
 =?utf-8?B?SzY5VHBieEdIODFhZmlEdXRKcko1RTcrbmdGTmtZeUg2NGcwWGpOTExkMXNO?=
 =?utf-8?B?TjdpMWJmOUh2Q0RZRHhKUU1kT2VVVVZZNC9HVWV0bGtuU0xhd0tPVjJrRjMv?=
 =?utf-8?B?MDJUSnA3VUFtalNxaHhLOFVhQlhzRVNJakZiWkwxNHQ0NVJYaW1rT2tGcHhw?=
 =?utf-8?B?UnVRNHhlK1R2eFV4cTk5Snp1UWxnbUltazBaVmlCVkpxdWtGTVFxeHFOZHQ5?=
 =?utf-8?B?dkd2c2lla1Y1eU03cTl1cnVsdzdFdUdNYkZZREh5Wk9nWmZYamRPQ2tJRXor?=
 =?utf-8?B?ZzZ5VVN3QWw1Zmt2NmFNcjRzYmdXaUlsRCs5ZDdrRnJoeCtPM2dMN0dxcSs1?=
 =?utf-8?B?V0NCLzBtbXhuR1Awa3VRTm1pTmJ1TmcyTFRQVVBEb0ZKOXJFNkUxSFJnL01J?=
 =?utf-8?B?Z1ZmS0h4SnRWOThDN0hjWmNra1hUZG52TXEyZUo1Vnp1R1RxMkZMT3BBSjdY?=
 =?utf-8?B?NlNXYVBVOTZTL2tyc2xCbTdGajZEMDB6WHl1TkJSejN3TmZ0TkRzRTVaUGZ3?=
 =?utf-8?B?RUhpTGtOenJYYWtDRnRTMlJzYTByRjdQY3AxWVNrdXpzNWRseUFmNnlFSTdY?=
 =?utf-8?B?eWNtdEZnYVhTdzMyVnBSVjhYZ2U5NWFJUUYzazlkUTRybTZRMHJZakE4bnJ1?=
 =?utf-8?B?N2RZaVlGZE42K0FiMVRYVXFqZnVaTC8rdjFIaDJvSU1Ic1ZXQ0lEMWpPenM0?=
 =?utf-8?B?RW1RT012VnkyQldReUdyUE02emlFQ2Z5K3kxYjBZUDVrYzZpSFBZN09KeWt3?=
 =?utf-8?B?UjNnTVhreFFnLzlhdDZzTzhieWRYY2FKekxHUEhRRGxtVDFMVy8wNkR4RlB0?=
 =?utf-8?B?SVgrb2M2MmpkU0dJOU1DQzZoaXNySW1JUERTNGpMVFB0VHdCVDFQWWVDb2tZ?=
 =?utf-8?B?TFRvWUova2ZvZ2IrdzUwZTdocGRHZDhsK1htUzFnTnlQYnFnUVZMRUVXMmhl?=
 =?utf-8?B?b09TUGRDYytGQ285VFUwQ004TG93ZDBiNDY0ZkxvMjNkMkMycFF0VXNkSjky?=
 =?utf-8?B?RzIyNWwxSHZsdkRQQlpxcjhHUmJFM0lEU1I3VDAwVVl4UzdmenN4aGZ5akcv?=
 =?utf-8?B?MW56TzFJZi9oT01scFM5eVVpRGVBQWVEVGRHdGttN1graFQwRjJ0NFdFWjlZ?=
 =?utf-8?B?eEFaMG4wV25NSG03dTNVYng1TkpySC8vNWIydGJUWUpVZDFKdFJleHJTaGZH?=
 =?utf-8?Q?xofPZNyswE4+XUhI81yYjQQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ea8d61-7e1f-4c89-5cf9-08d9beda3b13
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 08:17:55.4347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7W9gII1rJBdZgohy+OnBKLWDB+UNXjEmL1n55NVxQU/Wv153fkpOgelZ6E9te1MAIf5eg91Ln6D5/4ReibtHfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2959

On 13.12.2021 20:04, Andrew Cooper wrote:
> --- a/tools/libs/libs.mk
> +++ b/tools/libs/libs.mk
> @@ -6,7 +6,10 @@
>  #   MINOR:   minor version of lib (0 if empty)
>  
>  LIBNAME := $(notdir $(CURDIR))
> -MAJOR ?= $(shell $(XEN_ROOT)/version.sh $(XEN_ROOT)/xen/Makefile)
> +
> +ifeq ($(origin MAJOR), undefined)
> +MAJOR := $(shell $(XEN_ROOT)/version.sh $(XEN_ROOT)/xen/Makefile)
> +endif
>  MINOR ?= 0
>  
>  SHLIB_LDFLAGS += -Wl,--version-script=libxen$(LIBNAME).map

Wouldn't it be better to move the "endif" past the setting of MINOR
(which then could use := as well)? Libraries with their own versioning
would imo better specify both rather than relying on getting 0 from
here (which at present none of them does). Would require an
adjustment to the comment at the top of libs.mk, though.

And further, since you're switching to $(origin ...), wouldn't this
be an opportunity to avoid stray inheriting of values from the
environment, by switching to "ifneq ($(origin MAJOR), file)"? Or is
there an intention of allowing such control via the environment
(which would then override the versions for all libraries not
explicitly setting them)? In turn I would then further wonder
whether command line overrides are intended, but I guess people
doing so ought to indeed get what they have asked for (all libraries
versioned identically, assuming both MAJOR and MINOR get defined
that way).

Jan


