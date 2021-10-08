Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A10D426AF7
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 14:37:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204708.359872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYp7U-0008B4-Dy; Fri, 08 Oct 2021 12:37:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204708.359872; Fri, 08 Oct 2021 12:37:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYp7U-00088n-AX; Fri, 08 Oct 2021 12:37:00 +0000
Received: by outflank-mailman (input) for mailman id 204708;
 Fri, 08 Oct 2021 12:36:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aYfl=O4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYp7S-00088c-Nw
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 12:36:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 167717dd-3fa8-47ba-b5b7-ff344e15a229;
 Fri, 08 Oct 2021 12:36:58 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-9cABBLOWOsGjGZoNYm-CzA-1; Fri, 08 Oct 2021 14:36:55 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5901.eurprd04.prod.outlook.com (2603:10a6:803:e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 12:36:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 12:36:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P193CA0095.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Fri, 8 Oct 2021 12:36:52 +0000
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
X-Inumbo-ID: 167717dd-3fa8-47ba-b5b7-ff344e15a229
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633696617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VfxpZeqp5AUa9f4Fkfs+nFb4Aff3huHPoYuFV/AnIBE=;
	b=ap0l6NEtan509hzwUVX5hAA7RqZL5yNymARbpnQNG0Q1g4i5NYQDtbGSCDDOgwB3Wd6Z94
	1fXK39026CYYhVmAiK/cW/2PNHLjk6/7F/QLXQf1P72QXxmIuXaDJ4T24leZFC3gIZSkn1
	I2aSqD2pUN2/XOp3wC5TdfCe+c9IX+Y=
X-MC-Unique: 9cABBLOWOsGjGZoNYm-CzA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+KA7bbTcs8CRoah83UZCcTh+YGXB5xUDPKjlxbEXxVpV6W9yxVZrmm2+tc64KJOMTmg4MS7uZ/mE9UTyC5icjij0snIb/Loarq+oNSE4BEG4wdhHWC4Fxd4Red3TISlmsvVbX7ph+L6LVCZwlnBC1SRQYy0+YE0VWLwwKNfBRXv7gZrnkwHd6IFOOex0Zl910NUjl3jtteCa/SwbFi1RwWLKPW6xZ9izosSy9XQBC6Z2D82aszbyLdtBEtDm4NKiXP6EjQl0VjZ1EQg/0Uz1vyJEGV9Yz3ZeexzyeVvuURgkXwgS5ddtJSXoYwy+l9MrTbl+rX8THfg+lMT+PqlPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfxpZeqp5AUa9f4Fkfs+nFb4Aff3huHPoYuFV/AnIBE=;
 b=ki5jyW8grS6T/0OO65KnQ/YrlgPW+9tGpD2Ybpo7l9jkIEPb/U8P03Acnsk5E7aEIk+I/JzDX+mUJzmsUsKXAXguYd2/Rf7jUFCtilhkIhNS0SxZWIetGqPd26RPVDOkh2qcKzcO2jNyeRpDmU/GBZS2kZ7gwnkdMp/nhsy57gsMZaSHOrxKt0WVAyxeFoH8BdVRVt5Vo40uRJhw1CZ0ZVtGdVshW2cQ2mkwBNv0SZ2Ndi6JGXJC/q9x+TDXle3Ea/PCJhZbNYz2he2FXQO9U2hIxvmRKUqwnw3BzCbz9jgOK/0JeCYjGdhoSW8KNv9BNu7s46Y1XEyorvJRvFJPpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH V5 1/3] xen/arm: Introduce gpaddr_bits field to struct
 xen_arch_domainconfig
To: Oleksandr <olekstysh@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com>
 <1633519346-3686-2-git-send-email-olekstysh@gmail.com>
 <68cb29bb-7d84-dc27-eead-4a079b9caf68@suse.com>
 <e77eea6f-163d-0920-2e90-fb9f3a602743@gmail.com>
 <ffb40f3b-2394-7747-2c06-955e2aa87cfc@suse.com>
 <387608b9-c7b2-e814-7fa5-a262acc0c73d@gmail.com>
 <ae852345-66ff-7bcf-f68e-2161e23933a1@suse.com>
 <alpine.DEB.2.21.2110071311450.414@sstabellini-ThinkPad-T480s>
 <b8e868a2-9af3-de6c-0683-4bb2ff7821f3@suse.com>
 <b36e5fb7-6ed0-dc7d-5ed3-c3c9c9ae70b5@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ff760c65-1041-aac6-40ed-981f0b900678@suse.com>
Date: Fri, 8 Oct 2021 14:36:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <b36e5fb7-6ed0-dc7d-5ed3-c3c9c9ae70b5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0095.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ef715b3-46f0-450a-3d08-08d98a584ec5
X-MS-TrafficTypeDiagnostic: VI1PR04MB5901:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB590123BE7D58901643C1D121B3B29@VI1PR04MB5901.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	45mWF8ttt+ydkrVtIANsC7caQk2YkLccwyeY7R6JjR7X7fWRtmgFJYhiwUfkRRDbw36kX1zMpdlv25kayuc8+r3epzvtLlIpbBzM1ygo+bQ4Td6SpZhPN1rE4htmtKy8wZnD5+f9i/8OhS2e/ZvZWDdAk//BSF0TLaK9PeF6p7NJEKgbHzrIplZMorRN6bvuAAOts7scWrGzXquCzrrX9WCgM90AGZSJg3FAIbrYkAdMftMGZFSRrDE7GsIUTTVkIO19t8FVynnDudO9b6/zkAIPap+tjmLeTgdZGUg4YSOpMp354E30FdaBfCdrcE23x961x7s9juFdz0yQqPn2s3I7jsXl9PLx4vkC45W+IPnsTAml3jl23PIHNXvVCu7qXVa1zzS9PjVfMUIOtuPN+ULuAnxBt3DMSAarZSd/dgJ5T+eZa+mmqlRzSq0rCALTvyFPsf8rpMyiqQWqJp8EWc8Sjkhvz8BPYIYMBvnudijlfEV0MNFs4sTXOfWpVREdhdjkC4u5ygVWY3f18ex3fet/M1YttHLRLGP2l3aKR/6lG4zYSAisHx2BkeoftQX+qAP8MEna4zvi+nYn3iXyRGZvMcxilgeeUnzwQSpQFvwHp7a4T6+Ja3FzvO6WiFFOEGAbkqp2DPopP5GkyF2mG+XHUoeBKYZrYLED5He+XyC0m4FOHW+Zn5f5ybll2zQIKm5Qn9ClsRWK+UJ0qB+wVA+NFMbXmIWUcgqpVa7DVAF3YnftPUT5C4frjOHUP6gn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(31686004)(31696002)(38100700002)(36756003)(8936002)(53546011)(5660300002)(956004)(8676002)(4744005)(186003)(26005)(66476007)(2616005)(2906002)(54906003)(316002)(16576012)(6486002)(508600001)(66556008)(7416002)(6916009)(4326008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVFibmVQNVRLOHZjWFV0a2RJeW5velVCcWMreVNGbHJqNEtBdlE4N3FISVk0?=
 =?utf-8?B?MFdkOTkvK2xUcG5LU2trc2FpY2NCUkF5MjgzcHNzRVgyc29tekY1YUgrMDBy?=
 =?utf-8?B?WWpFcFBuL3BFa2UzSU0zTGF4VzBiQTE0TnFNeU1VMk5LR0FOK0d0QitaTkd3?=
 =?utf-8?B?THFhcVBnSVMyZjlCM0JJNmR2aXVlS083dkZvL1lTQlRwRVpRS0UvN1V4TU1F?=
 =?utf-8?B?Vy91NFF6SzQ1VUhIOHRaOG95Y2xPUVI5enA4VjFGMnZLWE5RQnZQczdhTzg2?=
 =?utf-8?B?bURFcS9VTG9rRms3OWZTUGgwTDhSdjFDRGF0ejRybkxSOXdVekFTVzYxOUVF?=
 =?utf-8?B?cmtYVEFRbCtiWU9EaE11YkhoK0VIUXRQU2dpYVhQTFdGZG1wQ0RRU2Y5elFI?=
 =?utf-8?B?VWVpRGw1MTFkSTU5K2wyVXFrM2RZdStsUzZ4SStncUpwckZmWjdIbzZIaWt0?=
 =?utf-8?B?VTNTeVZOWFl0WTRIa1kySFdiaUZ2L2RmU2FZUXNsd1J3QWhXalVVWlhvb1E5?=
 =?utf-8?B?VkVNS3JsWWlwcjIvZmVVWVBVUWsyYWNLbkV3TXNYVTZjb2UxTXlVYXlBSisx?=
 =?utf-8?B?Q3loQkc1ZFZ5anRSN000QysrZVE1ZDA5WXNUaUxCRmdBM2xmQ2Vmb0lSMFFu?=
 =?utf-8?B?ajhLaCtkdU8zMVErS2x0TmNlZHlxZStyVTZObUJET2JFcVRHd2NpTXErQ2VB?=
 =?utf-8?B?WTArOWdlMHRwQmhDTE80YjA1alIvZTJJZkE4eWkwNU8xQTBCaldHemM5cmFk?=
 =?utf-8?B?cGQ1SW1yZzVxTnlqbWp4d2d6bHZpblZGREJhRUZKNENaSXR0VmJpQzBlL2Nn?=
 =?utf-8?B?WmZJTllTUVJVcXUxVkVhbFhwMnVLcDFCWWtMMHhqY0EzVWIwVEJJZ2x6cTJO?=
 =?utf-8?B?T2lwd3MwY2Z1S2R3U2pPTm15RkFobUlPU2Z6all4RXlRNng4OEViVjVnYTlw?=
 =?utf-8?B?VXV2UldtUkkvNC9URUpTaUpUR1RRSFZsc2FvdnBWR2k4RnJPdTgwdnF1Nms3?=
 =?utf-8?B?Tkt6aVp4cVZGaGtIN0dqcFVDZTV6anMzakVDYUtVZUdLQkxwTU9NV0ZFS01i?=
 =?utf-8?B?TFJ0c3p0bDFIa0JQT3pDcVM4ejhxOENDT3pqNk5yZ3J3MWxwM3I1L0hwekpK?=
 =?utf-8?B?QVM2R3ZSNXVLZGJSZ1ZkMzdRaHlOaTVFaVEyQ0Nadlo3TUdJeEgxRWZFNWYy?=
 =?utf-8?B?amlhWXJFS2VaQkQ5L2hIWVJvREhraHRrWUdNVFVZQUdXWTFiWlhVWTJYYjVJ?=
 =?utf-8?B?RGxuYVpXRmtreGhvRzRJenp5UzdrYmtPMGozcUJhSHBzNjF4YTEydUZkSW5j?=
 =?utf-8?B?UFNIWWRZSXZxUnprcWh5V21yeEduRHFkNHpNY2ZMQVFsLzdZczZ4NElPS0Z2?=
 =?utf-8?B?a0lQb0RXOTkyOG1YaVVRa1ErbkxJUXpyMitnLzBPUzEvMEhXSGN1VVdrOFN0?=
 =?utf-8?B?RW5KZEhQbnZUaE9CVVV5VFpyL3NNZHRHaEw2RGt5UytFOENCNTdzMFNJZUU2?=
 =?utf-8?B?SFBZaXhBaXIySU52eG9lV0dxOW9DZzFpaElzZlJPUGM3a3hoelB2L3VVVm50?=
 =?utf-8?B?TUhSNXA1b2xaT0huWTdWTUZVM0NhWXNUN0tXODNDYzRwOVFtVDMyd2s1WC9s?=
 =?utf-8?B?UVg2YWV0a1lFQWVRZy9FdlhSYUxaSmdkZEt2QSs2eUZWYlliTmRmMFJhd0hI?=
 =?utf-8?B?NlZ4R0MzMHpLWHNCUVkrSnNlc0VlamFsNTlpa0F5SFpKZEF5ckQ0RVpPNG5o?=
 =?utf-8?Q?oztOZkeSjZ8kqKnT2eRvTc3S70qNTvPDLskP+JA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef715b3-46f0-450a-3d08-08d98a584ec5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 12:36:53.3909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckloyyuMdVo66Tu4DZMQqsDSS5Ld0Td8D8pJLamWW6fPkknM0ToUSReGqf7djaD26fCdKyOnrsdbi6Yvvf9kgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5901

On 08.10.2021 12:25, Oleksandr wrote:
> Just a quick question. What do you think can XEN_DOMCTL_getdomaininfo be 
> reused to retrieve gpaddr_bits? I don't see why not at the moment, but 
> maybe there are some implications/concerns which are invisible to me.
> 
> I see that arch_get_domain_info() is present, so the field will be 
> common, and each arch will write a value it considers
> appropriate. This could be a good compromise to not add an extra domctl 
> and to not alter domain_create.

Technically I think it could be reused. What I'm less certain of is
whether the specific piece of information is a good fit there.

Jan


