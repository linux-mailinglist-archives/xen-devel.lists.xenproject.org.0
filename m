Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDEF4F9567
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 14:10:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301483.514509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncnRZ-0008L7-CB; Fri, 08 Apr 2022 12:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301483.514509; Fri, 08 Apr 2022 12:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncnRZ-0008Ik-9G; Fri, 08 Apr 2022 12:10:25 +0000
Received: by outflank-mailman (input) for mailman id 301483;
 Fri, 08 Apr 2022 12:10:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ncnRX-0008Ie-H0
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 12:10:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd41b40d-b734-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 14:10:22 +0200 (CEST)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2057.outbound.protection.outlook.com [104.47.10.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-O9aD-cxePJ-giWz5iJNmIg-1; Fri, 08 Apr 2022 14:10:20 +0200
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9)
 by AS1PR04MB9558.eurprd04.prod.outlook.com (2603:10a6:20b:482::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.25; Fri, 8 Apr
 2022 12:10:18 +0000
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd]) by AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd%8]) with mapi id 15.20.5144.021; Fri, 8 Apr 2022
 12:10:18 +0000
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
X-Inumbo-ID: dd41b40d-b734-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649419821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E1wo0fTsh9XaUvBpjxJPWlSeZ+zKv59QP8OYwsrKzjM=;
	b=SnphM1FMrDXslBrtTDVQ4hYsPJXU6CjoGsJzZszDJ4qXK9hODS7D74YKP9hhK9tONPxaqE
	aTZylft0T5li5WQ5v+o6dV6mdl3solmZck2ZF2tQsNJKlavIBCeDP3gJC4AUlGDZIj85+W
	j4MqMBxNS+1G5RsbGUikArgVnBboL3c=
X-MC-Unique: O9aD-cxePJ-giWz5iJNmIg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CiYjx7CXFjngRuxI7SBMdDAxWKbB0hp6mN0yXNrXc8adq1uG92jm+II0uUums26uxQPjSjLh1sWFMyUcWR27DhGAxDhlH0RDa62VsGWS7/ORjvH9T/sgnOImX1BHrG9iiZo9Rbwrbgi0XVNrYQCI0pMqxeccY1NZN6OjuDpHNeMvLdc+OYoqr4jQ8wCPfvohA3DuLGul4VqIqrUDqvVaufZG8YqR2m5OtZ9Y9/QQWGsXbqDeSNUKqCgMk4v8WkGoRoOFPvg4jD3D5AvBla05dexC+9eV3XlOi56XKPoU2CdcNqS9c920Tn96foIJLsT0LUYi6ksOyYjIIpi/K++W4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8gUcpW0Qi4HwGdRb/eVY8/nLnpxDLjctSbhndvAeNI=;
 b=lPeQLH9DsqpRdkAsIjhDLs7rTDv9gkAHC/VO6Qx9mpzo8aFySjQVBQwXWPHs/avw25/VXykMEM+UfHdl0LYUofZM/I86nNhE5OB4Ioq3PZD3mufZQToyTlYvnYj19etTA2r1YqpmqT7axyhtBKs4h1fddmCp7xm0Aq+K4pmMrQMNFlfJv/hMuAlghf/dVfkINiRsxBL+Z12FiEH+QkfQlMY9nh2lSU2u7wHZDWUYi+swCAhATtMZ9HLqOA3vhAjT8OgZNsPljB0WHt2NitVhLB3prT9Pr6/0Gb7PEl6O6mpugDfU1Lmiqc8e1rvO6BSYiB4pWZc1UbFQCA85bSaDIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0a85f239-dbf8-2e06-0158-75a1c1c40a4c@suse.com>
Date: Fri, 8 Apr 2022 14:10:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 5/6] arm/dom0less: assign dom0less guests to cpupools
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Juergen Gross <jgross@suse.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220408084517.33082-1-luca.fancellu@arm.com>
 <20220408084517.33082-6-luca.fancellu@arm.com>
 <d8c2e194-be59-f7d7-fcc6-9ef7a06ffd1c@suse.com>
 <16C482BB-BC45-4BD3-8357-87AA942F4D14@arm.com>
 <cacbaa1c-8ae8-9314-9364-97e5a53d876b@suse.com>
 <61DEEA58-E570-4FEF-9B71-27316C7F8D7C@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <61DEEA58-E570-4FEF-9B71-27316C7F8D7C@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0065.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::10) To AS8PR04MB8609.eurprd04.prod.outlook.com
 (2603:10a6:20b:424::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71528621-ff1a-4d75-a9ef-08da1958bed3
X-MS-TrafficTypeDiagnostic: AS1PR04MB9558:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AS1PR04MB9558858A096BE4EABB61883BB3E99@AS1PR04MB9558.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CZRVIw2rq7n5TiJlLX2v1dEe0iJZ6ptdsHMk6qtsbL8xCjvkpweOlDfgjEp+NQ26ot0DRtoWxQRD8RNjdMGTwHh+DahpXvvXqdVSgK+ZUfJtDpiK828HlyNoAgoCd0w2Z2dCK4KR1e1i9lRGO78BC9GoT6xF5LBxCnzvl8JvUrf0TDJkks04+5YhhyIMCpluh63ybaPSXKbfGrRoL+rHHXxzMhWHUwdJFRLMblIEiiJzfmyTz7DeyuIlyXOVeiJI3YTAVNEXWZf6eOZtGN5qeA1YpUl3SNIfbRA+lHAp/EqVhddFoaNlRUttTKTrdnVGUh3Gn/C0jhgtgNYTjWATGQqhZhvKwkNquW3QfkAu6AK4jNAh1cbAcaOkz77hbrg6o1Y5XcNw/2HsWrlx5KFGf8b6m1xYzSAtYDIVc51Y/e8+ghPhrdiViDhyY8tvW61ImoPTcZciPW7ul7tXf0K8P3xUJdxmJGFY8Cvu4cKm0RWL1fJrRfv4TL6rnG8/glq5dAhGbHsuOz+E/jqOMJJE6ABPI9bJA2R4pyEKB5rkhJcsdT/jYxCt2xe5oA5ytQKN8g0gu1hPp831WFrC2lTYMhW1goHAiRG0N20S7kZMvSdMm8kXOkQRdn75DKAlhsG9DgSEE9DU7YSuxtY1WHVwV5BwL3JKJupiMXSpx06bDlBx4RJtRGgv9mTOKq/bVv0czJ/k233N6+l+c0oWse9BKMiC+keh0Q68unrRDRiso/yjiJEzj2n/GYsvwYGcbhKeYP+AXEoKwrWelR6ELEtoUw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8609.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(66946007)(66476007)(83380400001)(6512007)(6506007)(86362001)(8676002)(31696002)(6666004)(53546011)(6486002)(508600001)(26005)(186003)(66574015)(316002)(5660300002)(36756003)(38100700002)(54906003)(6916009)(2616005)(4326008)(7416002)(8936002)(2906002)(31686004)(32563001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x6FsDLWujKTMZKBFBer6Kvbcnwzdn5If21cDxMIdBH4/xrI7lpPpxTgFIed7?=
 =?us-ascii?Q?f0ph9iFWK72afkfi26lbafbUOiwb3y6pyYliCzK+FBOqvKBPaDa1RFXiaIQl?=
 =?us-ascii?Q?rIrkWR49nF70P8Pz5tR3tLoSlJx4IvMYAw2WqhEjjEVZgMUgiy1PaCrKU5ER?=
 =?us-ascii?Q?R4fhEulxllBb1wKym2BBvVLE2FNaq1b3urhGYpMip1HdmxzddsssNkHwd3ja?=
 =?us-ascii?Q?/FuKZ0vbWLFL5y/fIv/zfHW4TdZFx40Xn37LquUHHmB1UQswO+xeddzYfx1e?=
 =?us-ascii?Q?JK+8OAtsI9EZHX6FZcyJwD6aTF+Ss3EI5pFLQ2uu+OI5tn/XRWH1v0AAL9qA?=
 =?us-ascii?Q?m6FF3qK0teyhpeFLJfD96W9HJ9N3wUvYvRKrcWx/a0hWJpxYNqk3D6Q+YMHC?=
 =?us-ascii?Q?xn0VZYhQyte9pWvHTqmdg5RpAq4GpJ7TSFZv2oZbahfFtxwBGG3rIaomMSbB?=
 =?us-ascii?Q?s5disUHinZMWFZ9r0/+xAlUG0LlbKA/dJhd2bzT6F5hEyKlX6XerUYAyDG02?=
 =?us-ascii?Q?19AEMl00crthPSCesyWkkUOq6/sN2j1ut6mrdlM9ss9RfrGUBoyIzn6jrQ/j?=
 =?us-ascii?Q?8XFZi7htBBZDyId+MZRdPI9fHki8KkRtpi8Hr8GXhJNocylWhxxBroJlz5R6?=
 =?us-ascii?Q?Fj6JvzrL6T5xsLpYymGaBshLuXjj3rBbF/Z+MTnZJ/eLDf9G35glSbpA5E9T?=
 =?us-ascii?Q?JViE0p4reShq1GFrHaEu7P1dwKmfUj/uQp4YDRRT7USIU/+mEr+Mnn6NDbNh?=
 =?us-ascii?Q?Ep0ejGkRM4ekQMrhT8QDnTeuYJ+PlPD15p3iGt77tuVOTNN0rVrSXSalaNkL?=
 =?us-ascii?Q?MhB2qaBXuKgR3I1JTPPBhIGbEUg1hiLyyoQh9LxacFYX/863YccNin4/+fnH?=
 =?us-ascii?Q?rR0ZEFl0odoaK3DdGD0z6GlRYZDYItzz8KWYZMoXZYVoNYS3PXDDu/P07t94?=
 =?us-ascii?Q?9cjlS6Dp7D1BUXRSw8gvOcCwCrRaah2Mm20leIc0WiPpGkAkmHxkL2tOIZDM?=
 =?us-ascii?Q?sGGpXBsJMSRhrt2fQsN+GEpb50gvZpZ4Q/VEOuETDEeqRKCC2RbL9UCC3LFx?=
 =?us-ascii?Q?r86Pje7KejUPi/6VOGEKMTg1ZkHispP2mIpV9/b90kOo0NeCR89/sMxuT0+T?=
 =?us-ascii?Q?majgNMbkKJ9A63jHB4qtzWGsOg/iC/yuVS0iarvIOJP8k4l+yXZgDQ9ak1mz?=
 =?us-ascii?Q?PFT+CVYuyLvtx1Q7FeCpmrJqVllUvxu74A+Fx0o77yFQTx8ThiJDcopQqh+V?=
 =?us-ascii?Q?eoIuGVcZCe+mHuB1NmAdzj9iEWqvvFI6BhaWsmOLDEJM0uYR9i3pHrCrUKa9?=
 =?us-ascii?Q?ye3lESTi4UV9pwYqQj5su+TaSpi9/KADSjDgK9hgPy/2uXzDX0iiE7yVGx99?=
 =?us-ascii?Q?/ECU9eYai+FvXrN2ipvJyDnVOoLKxqRnS4QOd20P3nfC45Ay7k0Jssn3vqYc?=
 =?us-ascii?Q?Vrwa7VYud1eBdSuclpJ1oyQ7jVukxSDjv7G7uqPK1SOMf7T580BCAyLspVaj?=
 =?us-ascii?Q?Zw/PrmMldsUSYiyLnzgHJhlby26m0v18u06SqOPkVZ7p9iBsLX7kgaeqceI2?=
 =?us-ascii?Q?EnQY0xsLrL82xMnF+E5hd5eKusMRmV+XZ4m0dqO7/W1o9EJUpdLYnpPI9oL/?=
 =?us-ascii?Q?t8bAI9U8fJOVr7YEWJ1d3L3T9Y/gW+b48WINRtvqs/g2KPxwCSO+r1Mzbds8?=
 =?us-ascii?Q?xM+0W+GBWC+KpggauIkhnF6JgKY2uRPfsgrXKYCKw5WEX3lKXgZhkZ2GfYg8?=
 =?us-ascii?Q?X1xtrmWc3w=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71528621-ff1a-4d75-a9ef-08da1958bed3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8609.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 12:10:18.2423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xB3xcSqgKxQCZpoV2T7FbpRs+yNj0wTP+Uw2Nepx/2ag+BgKZ4KT3BeTAxI1N2OVxapsxsYNkbTEK4b6btdu2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9558

On 08.04.2022 13:15, Luca Fancellu wrote:
>=20
>=20
>> On 8 Apr 2022, at 11:24, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 08.04.2022 11:39, Luca Fancellu wrote:
>>>
>>>
>>>> On 8 Apr 2022, at 10:10, Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 08.04.2022 10:45, Luca Fancellu wrote:
>>>>> @@ -106,6 +106,8 @@ struct xen_domctl_createdomain {
>>>>> /* Per-vCPU buffer size in bytes. 0 to disable. */
>>>>> uint32_t vmtrace_size;
>>>>>
>>>>> + uint32_t cpupool_id;
>>>>
>>>> This could do with a comment explaining default behavior. In particula=
r
>>>> I wonder what 0 means: Looking at cpupool_destroy() I can't see that i=
t
>>>> would be impossible to delete pool 0 (but there may of course be
>>>> reasons elsewhere, e.g. preventing pool 0 to ever go empty) - J=C3=BCr=
gen?
>>>> Yet if pool 0 can be removed, zero being passed in here should imo not
>>>> lead to failure of VM creation. Otoh I understand that this would
>>>> already happen ahead of your change, preventing of which would
>>>> apparently possible only via passing CPUPOOLID_NONE here.
>>>
>>> Pool-0 can=E2=80=99t be emptied because Dom0 is sitting there (the patc=
h is modifying
>>> cpupool_id only for DomUs).
>>
>> But we're talking about dom0less as per the subject of the patch here.
>=20
> Domains started using dom0less feature are not privileged and can=E2=80=
=99t do any operation
> on cpu pools, that=E2=80=99s why I thought about Dom0.

It's all a matter of XSM policy what a domain may or may not be able
to carry out.

>>> I thought the name was self explanatory, but if I have to put a comment=
, would
>>> It work something like that:
>>>
>>> /* Cpupool id where the domain will be assigned on creation */
>>
>> I don't view this kind of comment as necessary. I was really after
>> calling out default behavior, along the lines of "0 to disable" that
>> you can see in patch context.
>=20
> Ok, could this work?
>=20
> /* Domain cpupool id on creation. Default 0 as Pool-0 is always present. =
*/

Hmm, I may have misguided you by talking about "default". There's no
default here, as it's the caller's responsibility to set the field,
and what's there will be used. Maybe "CPU pool to use; specify 0
unless a specific existing pool is to be used".

Jan


