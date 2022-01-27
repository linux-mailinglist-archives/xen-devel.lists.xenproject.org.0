Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA3C49E6C9
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 16:57:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261584.453063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD79M-0004nv-NZ; Thu, 27 Jan 2022 15:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261584.453063; Thu, 27 Jan 2022 15:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD79M-0004l2-Jg; Thu, 27 Jan 2022 15:57:28 +0000
Received: by outflank-mailman (input) for mailman id 261584;
 Thu, 27 Jan 2022 15:57:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD79K-0004kw-Qa
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 15:57:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1d4e1d3-7f89-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 16:57:25 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-fYtRUNyFNmeCBbb4bB_MRA-1; Thu, 27 Jan 2022 16:57:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR0402MB3553.eurprd04.prod.outlook.com (2603:10a6:208:1b::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 15:57:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 15:57:22 +0000
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
X-Inumbo-ID: d1d4e1d3-7f89-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643299044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FKgbRvQCixbeZjZFUvP4FhD/a0fIyYo+VXIWTBUenJA=;
	b=f+Re6tJcfiNm0ksDpytNH1Abe8qyYoRkRyS3+SE85mqt1i3jY54JuTh9KQduwU24wqc2zc
	KEPsysaHWNLHNm9gNvMB1cZzR16I8SptugAvlCphX/HCCKOt8vakaQQFbQysLvf+S9Q2Fs
	xyHiBmVbKT1pjq8iow6eYcFYmB4cBAU=
X-MC-Unique: fYtRUNyFNmeCBbb4bB_MRA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ctxoE/v6SlinSiTXdzyh58ZP/RrcVOY5wtb0PNF0Iv4Y/xyGDZbuF9xDVxYjMpmsTH8biWbiibjkKyfM/RBn3XRUDKHKuTcFpxE8H7iVDt9JA7/Ji4PoISo05TW1kqef8LVOI+qCGxzTNzQVnjGIz6waS3cg8vQUNTRaIh0XYLwv+yFAZTI9FGe6G00kMUulsJ8i8el5o71iIeQgWmoWN4myxxkwUvj07u82j8PyIIyPBccva6un+9VcZxf15y/4+Eqn9u5Jfriput/6WrWpng+4LADKfQ4IXDDH5QjCAHuWAYQiBUBJH5OQ0lGynK4IJrHrRnb4Sdm+xDdS6pF3ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKgbRvQCixbeZjZFUvP4FhD/a0fIyYo+VXIWTBUenJA=;
 b=bW8Pm2wBFZuJK8Bw6ubhbXy+ojpziQJUsqOHy9PycI8aPrsdZkFYn+SMgiD9zGsodVoiJ+TwtpKoqmtGhyHC5N022X/uqrv+Sx5scROLfxAgk7HWxD1fn9E2fwDzsExpMjNtzTou5UWXUDc7nI3SyIecfsc5JEYNxYHUvJUtOQuVgTOYaryJ2TJNrB+1fSP/1k85w5RGSUZ4oGdxZePNHEjneIeBm7VsnEJ3LKv+dDZkaDQjZJ4KAG1RGTf5QHlX8JdJ3PyoqKuwK9u/B8zVipXOh8SITI33EFCRluvvGZYRSvZUj3Vme234st6Zy2xeoxBsrnLn1kKZycnL71HfQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <708a1723-7b01-e82b-f2c2-d031a33ae55e@suse.com>
Date: Thu, 27 Jan 2022 16:57:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v9 08/30] build: fix enforce unique symbols for recent
 clang version
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-9-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220125110103.3527686-9-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::14)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cdc9226-ea1c-43fb-f571-08d9e1adb439
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3553:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB3553FB74D95610F7F0D0711BB3219@AM0PR0402MB3553.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	silJ3bH1R+Ro9S8LJlGLLfYDPDVHOzULnD5U+X8uf/u/lFKm6YNOJgHqwQmRDQOXJ9XHxUsdhBHBx20zttkD69CKnW73QUCK744ouIHrC+9WngG7sPCCnEX5mr+upXu2SKdzUpLHwok2ZwauIVx5rKNi1zslnErUk1DAxpeuCxguyaeLU9+aFLg/8JGScUNVeFONBdXqy2GXATRcNxJWo6bEAdPSz9oaKgl5EJoLYjbcEjMDGR5mm19Lyyna7+SV0GYs9JC+HFNHJ85wyezQ1dqkCKxqa5NWEuksTkdvl7eOxSOBn75fdoXvsxVjC0/yaGWCkIWF918UP+Ffdpb/V9OrnqKE4lAUmxYdeTBWuS8eyuY1T5tk5PMg28x3zE28FuP23StS7137TKTDgcUHupsZykwQq/7qK4EZAd/m5Rcj2Ihvn9l1I5K/7V6ny5oRRrpVe9pj5/mQyqIGuIItxUI5308Qp/KXC0b/DoAa8FPDE7x4lwzwKcKDY6uuP+D/nWKzCpKPgxl3iwsK86CxOU6KlbkmL9pF/GBkYAjM00bnN3mfqzuggoNm+3qvlcRgMwHEC8z1MzK/zoGvwtB/VloRWCuJPzMCxmxIc/51ZkQDnVKighCtlYZdkTlcD3K5svzsL8fycSSV7l/nUwhqpb/Jc1BkyRd8ZmjkLnftvScv5ZhCtnKicxXvGETMzHdhb32OKmSvuhQa+onwuQH2RSLns7+pMMcz5Xz5lOcjOGj/+QwNLpjsilM8kzZBkYqZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(66476007)(4744005)(66946007)(66556008)(8936002)(8676002)(110136005)(5660300002)(316002)(508600001)(54906003)(36756003)(4326008)(6486002)(86362001)(186003)(83380400001)(31686004)(26005)(2616005)(38100700002)(2906002)(53546011)(6506007)(6512007)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2NqUGR3VkhBalkyckg4T0lKb0RZdEFTZGc4SkZsMEdzamhoWTZTTGNSVWRJ?=
 =?utf-8?B?TGUvYlJjZDdRMFl1bmtTQk90OVZvYWttOEpFaHNCYkIwaVdpaU1Bb1N6S1Rw?=
 =?utf-8?B?U1Z5MmlCd0Q2KzNmVE9IcHpjei9COVZLR3ArNEc5UWl4MmZhc1dDOURqbWVn?=
 =?utf-8?B?VEJYd2VFTXdrRkZFR0tRVHpFbFBwcjUzNlZ1VXZ3Yk5YTktNVXY2ZUY2clpN?=
 =?utf-8?B?OWNOQkNyTHJzamFJbEJZRThYMDBFeEZ2ckE5VjVoZHhPS1d1MllJVnA1Z090?=
 =?utf-8?B?ZlMwVDdnQlZobGJiMnBjUmpZRzE3dURsZjN0UmZvMityTHZMU243S25hZml3?=
 =?utf-8?B?QWk4SHJDVURUWmFGdTd3ZmdnWXQwaXFqdHZvYWprRFlwT0F0bk9wb3ZPajIx?=
 =?utf-8?B?TG9wUG0ybW5hdEFKQ28wNXdFVXIySUV3QlR3UitOTTBqaW9WM1BIdE5uNVpa?=
 =?utf-8?B?SnRXaFVZaU1ZNEV2UTdyREE3Vmc0UVNmUEJITDZLMHJZZnBnT3ZlU2g0NUpL?=
 =?utf-8?B?a3VBTG1KVlQ2Q0I5Y2lTWEwrSWVoOTRJNFBIZFBnYTFsQy8xMHpmTFl2RFhn?=
 =?utf-8?B?K1ZFL0E5eUtJSW1May9mVUorbkZRdm9rbmM1VlVDRHlMaWozc3hZZEs5TFFn?=
 =?utf-8?B?SmlyRlVwRmtxQ0lkRDR4N1Z4U2QyR3NuWXhpYkZ4Z3hyaEhEbExaL3R5QW1j?=
 =?utf-8?B?UlNPZ3lIN0Y1MDR1cnZYMzMwYVlKOWJvY0pTYm5ta1d1SlhKcUw4eFUvRGFm?=
 =?utf-8?B?ZkhRczJyeXpJcWRFZ3F5aUJvRXhJdHYwN2lDYi9jd2xxbWkzdUg0cGtNVlZs?=
 =?utf-8?B?enJ3M2pGd1RSMHExbytkZDdjb3VMY3BhcVYrWjJJb0UxREZEU3pHZEdmSjBN?=
 =?utf-8?B?QmI5T3pJS3dlbDZybUVzcFI4OHovN2N1V1gvd1B6NnEyYXpZejFQL3UrbFFh?=
 =?utf-8?B?aGJCQnF4NTlsZWZyZGxhS2hmWkttVnZmMTQwdEIveUpNRk5NZjlQajJpaFls?=
 =?utf-8?B?dWZMQ0hpT0JPalgrQmxFUTFiRUY2VjFscUJHdS9WNU5sK2kyd2oweVFHdlNG?=
 =?utf-8?B?bVNoUGR4OHZrTnRWUUxobG91WjJxYUVnc0cxdm4xL0RhVWNSdEk1NE1BSk5T?=
 =?utf-8?B?ZEtuWkJKVGJVMGVuK0JENXdNc3pzLysydDdIRlJldnllek04eTViY1hJbFRm?=
 =?utf-8?B?b1Q0TkVOa1FqZTZCMlNrR1daaDNpUTZUd0VYWGI4YUpCbFVvNDVPR0pnUFZN?=
 =?utf-8?B?ODdIU0hISUsyQTR5bzdxcTM3blhWd29KZmJLeW9uT3VoanZqSW1xdGVvU2Ns?=
 =?utf-8?B?Qk1vVkFHTkk2ZDJSUnpsaE96QXZ4eVRWOXpHY0NuZWdIZm1YU0VOem1LRFBF?=
 =?utf-8?B?L0JBZkdWRDQxY1hadEhTWWtmQ2tBOTVRTXJwenRpd2RUZm5INi9SYzUxOXdt?=
 =?utf-8?B?ZTlXZ1ZrakZ5TGk5bjZNNkljT3l2KzNac2VQTWNCaHEyd1FqTkk3SmtqM3F6?=
 =?utf-8?B?dGl1b05qS3Q0N2svSW0xT205WTNOM3ZqQmVoSFl1MHUzRHZlcEpDeUJyTWor?=
 =?utf-8?B?QVJyRzlKTHU1TTdhSGlJRWVuS0d6Undub0dGQ1BXeFNjVDRNNDhBU0FBWlgw?=
 =?utf-8?B?N0FYNEZ6UnplOUxWbWFDRWJPdVFsa0llbjdTQllkNGhqQUdkSE5rVTRBWGVY?=
 =?utf-8?B?T3NwQWhyZ0dQbEVEdklEY0JMUDgzZDRqdWcxcE1iNmovd0N3NHl6Y0lJd2tH?=
 =?utf-8?B?djdQZ2k2NjlaejhraWdhR3JHNSs1VklqQVJHTWlrVHViV1Urdm1OVjRabVBa?=
 =?utf-8?B?WWR3YjlyT0RkSkFYVTJydWwrVVdPV3kzNldBVENpZ1hMT3pFNjhQZnhSdFIr?=
 =?utf-8?B?NU5paC92WFlTR2lVRjB0VmM0MVNta1RWWjYzczVxc1pBMnM5d2lMRjdxWTV2?=
 =?utf-8?B?V2ZKVmhCeWR1V2hGSlZlRmVVUmtlYkVlaXBjbkkrbDZodjBOTmpDRFI0MytY?=
 =?utf-8?B?dEZBNmFyYTRjbWpUWk1QR29mS0NKUmtjMkNZNXpudm13Q1hSVDhMaXBBa2R5?=
 =?utf-8?B?MnZzNEY3NHBJem1jQ21ncDRNNXZnWFZ3bFVOWnFtSnBJUkpYOFNDWW44WEdq?=
 =?utf-8?B?cjN0SjFFZlBrVWJIYW1uaTdxNmhxV0VVNDhKQ280MzFMSU9qWVFHcEZ5Wkh3?=
 =?utf-8?Q?9CDQdxv7s4+NYl4h72bHPaw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cdc9226-ea1c-43fb-f571-08d9e1adb439
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 15:57:22.0643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UokzUO25U+eYzQqTGN9VEOMa4LKpnRwItYlMXks/Enwh4Mqx2i6Z9exJNjNMHayai9l7uIARJiqevHOYRysD8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3553

On 25.01.2022 12:00, Anthony PERARD wrote:
> clang 6.0 and newer behave like gcc in regards for the FILE symbol, so
> only the filename rather than the full path to the source file.
> 
> clang 3.8.1-24 (in our debian:stretch container) and 3.5.0-10
> (in our debian:jessie container) do store the full path to the source
> file in the FILE symbol.
> 
> Also, based on commit 81ecb38b83 ("build: provide option to
> disambiguate symbol names"), which were using clang 5, the change of
> behavior likely happened in clang 6.0.
> 
> This means that we also need to check clang version to figure out
> which command we need to use to redefine symbol.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

The "likely" in the description still worries me some. Roger, would
you happen to know, or know of a way to find out for sure ("sure"
not meaning to exclude the usual risk associated with version
number checks)?

Jan


