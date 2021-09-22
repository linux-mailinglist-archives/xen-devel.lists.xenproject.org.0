Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F67414BE2
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 16:29:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192849.343539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT3F1-0008Gg-TR; Wed, 22 Sep 2021 14:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192849.343539; Wed, 22 Sep 2021 14:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT3F1-0008Es-QE; Wed, 22 Sep 2021 14:28:55 +0000
Received: by outflank-mailman (input) for mailman id 192849;
 Wed, 22 Sep 2021 14:28:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mT3F0-0008Em-EA
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 14:28:54 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 68a0cfe4-1bb1-11ec-b99c-12813bfff9fa;
 Wed, 22 Sep 2021 14:28:52 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-ZqTC2YS4PS-a4ce0LXXQZA-1; Wed, 22 Sep 2021 16:28:50 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6672.eurprd04.prod.outlook.com (2603:10a6:803:127::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 22 Sep
 2021 14:28:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 14:28:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM8P191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 14:28:48 +0000
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
X-Inumbo-ID: 68a0cfe4-1bb1-11ec-b99c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632320931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cVE+9S/hRl9E3YbcJWPwZcWaGRqaBlv07SKEMwIJtM8=;
	b=gKac/pnYXD4bkBpy6AKiMuI+wyM8j+eMMfVVvn+kI4QsFRMl/PO60iXSLImOy925KkPBHS
	HlJGRQPd2WxTzR3fWLDv8ejNqobKcaA0QU28BGoUQGzbrMYieKds1qckvaWqJRWVBKz4K+
	Z0J+gSvqftZurChaSsnbw1uuXS7kN74=
X-MC-Unique: ZqTC2YS4PS-a4ce0LXXQZA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KuWgZBbYNQrZxonekWRi1lLS6coj18ejGkjfTTqvMcpc8Kq9Waszfctwu0JO2wo3ry4rWBaxu5YcYaVspB5CBzfsTvemVe09lzxzGpOJJs4kUQldN1CapevoySWPSPVE7AkY/qicSCcNYOvOmIUOAYz/RTrYJaCQegV4vd92Fers6uPFeWHJyZey0UU7BEQCBpxtBMnEBnLKmZyGLGc/gYOEBps/P/8dC8rFoISEKcOzFS1m8M9QmJwN9qGQMfRbSskDXCF74O6SWd39rs0S7Z2zdx+uU/4I+KsrDXP832n9W6MgobHRtf6+YECgE6b+SNBDgQTs2zBzgP5m2DMkNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=vlLwpVbKdDGidk/pmbCgqtPtVvafgbou6IhVrWQQ+a8=;
 b=ZXoKzjvzSCkA4UZd6lqtYX2A3BZTGqo9b8VOfyZ1NLxACTi3P4M82bn4WUt2u/TK0GJb9uoydIaXQHAGf/NUo1Dkpyo5PPrUqT6ihOvTQ3m7M7v8q+/alWo2g0nmogEHCiowhF8zHaVJIdOFnICwTAeLgnsn0KGUELkSNPq30OnkhY7JQW4k/d6wAsIvm7uti5SqCvd7bb93D2+Y5kWsIsv4VFjEWIYwB2P5HwZ8v70Gae56hwayLueY0sjqpiU9fb0Kvz6aIG7vIENp2yMxyzp4sXNzi4yhmxb2SUNY9PsHO5dPKHArI8yE7v9rRnjLNYq90aGLYSKm/UUJ1azTKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 2/9] x86/PV: properly set shadow allocation for Dom0
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <25958e72-40b9-30ef-a348-6ac9ef02b261@suse.com>
 <b2a2fd30-225b-2b79-f160-8ed2e4ad439f@citrix.com>
 <8c1ab98a-8fde-3d9e-5250-c5a40af70453@suse.com>
 <YUs82i7S0fd8r1uX@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a214deb4-be70-bf84-356f-5f6569224c95@suse.com>
Date: Wed, 22 Sep 2021 16:28:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YUs82i7S0fd8r1uX@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM8P191CA0016.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e04a0599-edf7-4176-334a-08d97dd54adc
X-MS-TrafficTypeDiagnostic: VE1PR04MB6672:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6672010B71DB41AF886755D6B3A29@VE1PR04MB6672.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LFs/bU2wgpu9ueA+TZpmoCQB3UxsV0F2zWW+YLrqv2e0Gh3QtAeORh3e+mcHuJyvjDtIhzxZXQJihsuUcJxPCRlH7vXdAY7dHyinT3+rRtqSoKimwwYwNSX18QVZBrKUfPH9nRwhlA818fRQf896Avt+NptxFWB0Pii3xR5y+jIho3inCYB5LlL+G3Jj+rzn2F3G0bZhGrs3aCewuLQFWjnF2lilO7w+hnLPwOeXUmodj+xWyqFrxQll0EhziBcmwDAGx61WAZKdf7lSXMkW4wajs85agrQpG2+zIf11EjyHlAsOyVvMYkw/eSluw6nc5Eo8LGhgWXmhbpZYVPYASr396pR1nkvoS4cPn6ukEVzb7/12qW4v59mZb5bx6GMnfYhoZRGlArHe6IP7bnik17lZ59oK3MQ631VQXpvDNmHWwLTzOzFwLDBxLCXDhobCcNknwO5z08JsJFj9zEP2xsfuHz3B28E/io18xRR49dANT421EZnpD3WKE9U3/3shzxF/RPIlNeyo5BCWG0QmlLLseDnXKBlrT1D3Z1QdO0E4JSUZqR7Q339khUJzfO0Z854A5VixU5r7ksl7zbP4PhcOyC+tPcm4HP1y3Lpklo7Xzxc/7oBEALhKZ2ryaS3K6o6aVwmKsNAvyQ7m3w/hpXbD321F7NQJ8Rn6B92kQH0d62We39efrX80hb89LSQCV39kl/gGMdunr1WWsQdtAvBvQKyqJF6wR+a0nwTXNlyfRLgMhj53InoCyXJ+kne7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(66476007)(508600001)(186003)(2906002)(36756003)(4326008)(66556008)(38100700002)(86362001)(8676002)(66946007)(83380400001)(53546011)(956004)(31696002)(2616005)(26005)(110136005)(16576012)(6486002)(31686004)(316002)(54906003)(5660300002)(45980500001)(43740500002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nj0PZIsDFCfX9zeuLLIYoYkK5UeoIiYF/XxCJmfOflHASL1gzwmPN9Cd+/qb?=
 =?us-ascii?Q?DZVE7xVoGM0/Rgzoll4RuLxkeLRbHwi+K5WPRnLlvYq3ssiS9OmdVnlMH7Bq?=
 =?us-ascii?Q?WZz2GOF0QzAW6vUgqDKL59HsLdefwVmL2AUIxiI+izNR9Xp8grLODF9uI0Jj?=
 =?us-ascii?Q?p4BB9gTdy88MA2E1H9ddIYan/AJnub8YIphIH1JQOuf8dnIEUd9/ggCpkiP/?=
 =?us-ascii?Q?vhZ59dHLcO+25j6qOiefcz+feXOllPqi1xWekVFowq4b7xRe65Bnd3RM5ash?=
 =?us-ascii?Q?cbLJlhbktJmz1Bm7mLnbjN6Gb/N8zS2OxnoLWyR2QCFi91Oliipx+h8I2N0I?=
 =?us-ascii?Q?qr9JU6+i4n3fOB8qV87RbGra06yRGkYLi5wPZosEghCFnVKXi1Br+sEEs0kg?=
 =?us-ascii?Q?7aTIjHiTiAhGqIzeomKr0BtQenSKmmreNRB9322LcoBUxApuBmxqR8kJwiPy?=
 =?us-ascii?Q?JS3HQORg3hIcHZVqmKJzNNP5S5oFrvGa+HtSvgH6f3A5KDQrur4st2wbficq?=
 =?us-ascii?Q?+eVMoFnf5ngYIor1RewoefJAJTm9z65fsVDOBuZKRGqMet6+pNJGaz3m1W1x?=
 =?us-ascii?Q?sTrQzE2XRRUR7RH8Ms5xAZdH68DjrmXp4pjdNDnmmn/cVLLQ8/k9IPuahsm8?=
 =?us-ascii?Q?uXa1Wf1TthD8Rj0yhMBg8tKpHSyBf65JsOiD8lB/ynDEaetaHeuZ1l+vZELu?=
 =?us-ascii?Q?ENGnI1G9VlXy3DRhsGYc7v/pmb1BND3l+LJr3NCxJailxB3K5kFNowgp2HUl?=
 =?us-ascii?Q?L3CM0X8sb2qFWzSCT81CgrLrDQbt08jVuEJJ7zuzhOWUrDVowkjhDlPq6wrX?=
 =?us-ascii?Q?PQ3vmuRhtKLo6hvZ68UORDg+wqFEyNl+yWR4e7Cf7vmpM9vYGqUGePUAf+mK?=
 =?us-ascii?Q?bmsITr6qcxJpADNErrPNlSmEzHtevPX1wOmJl4wpQ+0AGkvXpsshZ7dtm6O1?=
 =?us-ascii?Q?RSNaGxtuDSVU1jBO6wdd5J1mgsDQnbql1M1JDp0gpPFlptffvlqWAOlhmhyv?=
 =?us-ascii?Q?G8M06wOoE3zcs21qQz43rqPswjG+sWUwPHUtATeiwXyWOhnx4kwu1/R/q6KE?=
 =?us-ascii?Q?6xxZy7HmmM49+AWGyPtFcDgPRqbFQgZB7i6d1Uz/y3E/j1ye6CwMS08M0rw8?=
 =?us-ascii?Q?oCadOpu5iJZg8pHdXRS/QDNp0D/u5PcJ7t74oGFivS3IjzuiS+p3/gDrweMs?=
 =?us-ascii?Q?xhJq3JQ+sTob/aEeHvTpHwWfUm9ms/4T4fIsU7MEtyETLJVM47IJQiZqGv5l?=
 =?us-ascii?Q?9pKCgSYdh+sXKidOg5IS3mpT6cEzRMc1gq9YA0q+LrEL+rjxeAb6rPu3zIrp?=
 =?us-ascii?Q?BFMN9sdS6ci3zaJBpLbVLk0e?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e04a0599-edf7-4176-334a-08d97dd54adc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 14:28:48.7776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 85CxnU0vNhEGFvta34bdUTTye6xPte2vHW5LWhm/wRqYM1cy+X/wEmbcj1CrCvHJ1DXE0/8aExUwzCkfe/la+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6672

On 22.09.2021 16:25, Roger Pau Monn=C3=A9 wrote:
> On Wed, Sep 22, 2021 at 03:50:25PM +0200, Jan Beulich wrote:
>> On 22.09.2021 15:31, Andrew Cooper wrote:
>>> On 21/09/2021 08:17, Jan Beulich wrote:
>>>> @@ -933,7 +934,18 @@ int __init dom0_construct_pv(struct doma
>>>>  #ifdef CONFIG_SHADOW_PAGING
>>>>      if ( opt_dom0_shadow )
>>>>      {
>>>> +        bool preempted;
>>>> +
>>>>          printk("Switching dom0 to using shadow paging\n");
>>>> +
>>>> +        nr_pt_pages =3D dom0_paging_pages(d, nr_pages);
>>>> +
>>>> +        do {
>>>> +            preempted =3D false;
>>>> +            shadow_set_allocation(d, nr_pt_pages, &preempted);
>>>> +            process_pending_softirqs();
>>>> +        } while ( preempted );
>>>
>>> This is still broken.
>>>
>>> The loop setting the shadow allocation needs to be outside of this
>>> conditional, because it is not related to early activation of the l1tf
>>> tasklet.
>>
>> Well, I'm not sure what to say. On v1 you already said so. But then you
>> didn't care to reply to me responding:
>>
>> "Are you suggesting to set up a (perhaps large) shadow pool just in
>>  case we need to enable shadow mode on Dom0? And all of this memory
>>  to then remain unused in the majority of cases?
>>
>>  Plus even if so, I'd view this as a 2nd, independent step, largely
>>  orthogonal to the handling of "dom0=3Dshadow". If somebody really
>>  wanted that, I think this should be driven by an explicit setting
>>  of the shadow pool size, indicating the admin is willing to waste
>>  the memory.
>=20
> Maybe an acceptable compromise would be to allocate the pool if
> opt_dom0_shadow || opt_pv_l1tf_hwdom?
>=20
> opt_pv_l1tf_hwdom is not enabled by default, so an admin opting to
> enable it should also be willing to reserve the memory it requires in
> case it needs activating during runtime.

I'd be fine making that change. Andrew - would that be sufficient to
address your concern?

Jan


