Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 437B83AE37A
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 08:46:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145338.267407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvDhC-0007E3-Uq; Mon, 21 Jun 2021 06:46:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145338.267407; Mon, 21 Jun 2021 06:46:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvDhC-0007Bx-Qn; Mon, 21 Jun 2021 06:46:10 +0000
Received: by outflank-mailman (input) for mailman id 145338;
 Mon, 21 Jun 2021 06:46:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f9W1=LP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lvDhA-0007Br-PT
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 06:46:08 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc3889f7-9395-440d-8409-b443aa24051d;
 Mon, 21 Jun 2021 06:46:07 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-QhOCkrwBMtu2MY5681cn0g-1; Mon, 21 Jun 2021 08:46:04 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4605.eurprd04.prod.outlook.com (2603:10a6:803:65::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Mon, 21 Jun
 2021 06:45:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 06:45:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3PR09CA0024.eurprd09.prod.outlook.com (2603:10a6:102:b7::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Mon, 21 Jun 2021 06:45:58 +0000
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
X-Inumbo-ID: cc3889f7-9395-440d-8409-b443aa24051d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624257966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xSQMHhMMdiUqJiddxuM4o3Ct4MjvlySw4cuAZxLnN1k=;
	b=gYw41w7HDtT3clBbEPg9EcfdpnY470hLHDNv1vIDMdLABacR4bIthSgjc7Gnzf1Mbn9asQ
	OouaAhzTZYOTflmhQTXrGHkZYBBx7xuL4HhcsuNnUXwKnHoxAv2hU0kwt4w2+ki60tS5On
	fWqLnhjR55T+NF+HgMcMJZxhLjTaiek=
X-MC-Unique: QhOCkrwBMtu2MY5681cn0g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ia5xDHsetaCQq9q3zD4Wtk/yJs3zxQkDzPaqoidy1z0lqOhxCIJYCxffhiQvJP14YhTC+KV5r88Wq/pkw+YzBYRDGPEgKEtXJkbd7pw/zpJ6y/cow2LiDOD2apKXnpMwSHgrmGp/9DCvQPZEbyhwo1ZB2rvW4+zU9IHTQnAj2kmtfIyDp2ok3M82jk5/D4RhKnd7ijiWGcdJsBEkLNPqIdlQnBn1XBwtMV34NMU5OYHvmazDmTWh6HuajL8bZVWUGI8hEiwwB84arj0bk/1EAEa+9bE1vLDWFkSSLhGRHETvmd4+0ODIopPmit9CVPQIud5+bxcrERoNP0vtMQibDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYihzVTM/ol/7ZMKdyazy8gVhEp70auxUpIFfoun3mk=;
 b=LsXlKquva0duqY5gJtpWJPTxfJzpVjQMdabJW/9yovEfIKVCQa0Vz69X4p4AQE0cKj/5g6R9dgdoSZA20832gb4wVlrxAiWKwHrJooKnq6jpd4ckGEEq+t97Qov73o9E11BQK0bwdkVoo4mGONMshLu8DojyIknQ+zAOodCZ9ld3emfzDkLFFN9nLFN+p/wKglBB2mE6uJ4n1WYRSd087hrEqMTHSslBaO9UyOMR269yDwqQ8/fJ8Q4fuEeMNn3e7GfHwOL5U14USjy8IjfLNaDIlKkiNRZPQel0xqDvW1mMWu4QWUg6GIdTkmOnDsCEuvyKKYhXeRkWC736G+rLoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: apertussolutions.com; dkim=none (message not signed)
 header.d=none;apertussolutions.com; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 0/6] xsm: refactoring xsm hooks
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Tim Deegan <tim@xen.org>, Juergen Gross <jgross@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Dario Faggioli <dfaggioli@suse.com>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, persaur@gmail.com,
 christopher.w.clark@gmail.com, adam.schwalm@starlab.io,
 scott.davis@starlab.io, xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <7219a9c8-f6c0-a86c-bf47-5b38c579170b@citrix.com>
 <b921c150-84f7-3ab3-1e4a-89d00725d9da@suse.com>
 <6ed12320-f454-2751-1a41-014eaa835762@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <529179db-ea47-72a8-ed71-604b1da2b4cd@suse.com>
Date: Mon, 21 Jun 2021 08:45:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <6ed12320-f454-2751-1a41-014eaa835762@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3PR09CA0024.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efa67176-11a1-40b3-a58a-08d934803a8a
X-MS-TrafficTypeDiagnostic: VI1PR04MB4605:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB46053415C5F8C557020AEB7FB30A9@VI1PR04MB4605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5k4+nixlEzZR+CIC9FsrIx/2UBI6Cyg7sNoI6nzs95pOZFGc+2MlWEhgnWCHEilIDBtK2K+xPz7YEzKAZ9DqaG6/JyEkzCOdUzOKf9ievhZrINXOWTToG0f+wkytD5nj3wXh7cgqPiWrN4VEnGOGJQQFLOb1MUFPXANBTPL2sKFKOVVAcCHha9Q4GFuxxvIsGHZp0+dpSRqEnun5rlxNF/IuQSKe248upFTf7xNJQpUT0SEDNm0t0USz3xwebF0hh/dUxMPUgwam/+iC6Eae4WmCeqgwVa3Z6ZaKSml29q9bkG72BSKjbfoeN92A3fdG6NCWGS3lGlW+UWWThWyH2icgnHS6N0hxI5zf5oM/nUe3xtc+xjaJx501N+tKReAL8Ak+xFOnU0lORgS4UqNVK7ENNYHGKaRNGoziZnNN0+X2bwry/fZHpKdc92GtMk5o6S12N1QrgI2zHPCo6pFgLgwVKAgbSn8ldjU4zPP+yWvvDHdttQwiDwRtYeREduv7FVq2xToFb9QHXzWKzaPOjPIvXNQBbIdBcR5fZ2Kr/nZ+/GlGXiutfoLtYd2qkBW5p76VwHnT9OoQJERWrLpeKQWJLw2KxNxY5KQisPhxheHbk0mpabpbT4JGwnpnvKisfYjDXDSkdoQsRZD6vR5u0ahxFkTu3IadprQs9EVDp8ghx2DENZ1gCSNG0qyjfuRL3LFViF3ltY7/LIax6C8RkceXPJmfOAkV3WzFfLkNSgl0frgvBYy6IwC2toH3oxGtAdOhpbanjbBKgN4rClxp5lLiEGXKGwfWE16f15L7ltlUdV2wHNrUKixbl91RurD2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(39860400002)(136003)(376002)(366004)(66946007)(66476007)(53546011)(38100700002)(66556008)(26005)(2906002)(6486002)(6916009)(2616005)(956004)(5660300002)(16576012)(31686004)(316002)(36756003)(54906003)(83380400001)(8676002)(86362001)(31696002)(8936002)(478600001)(16526019)(966005)(7416002)(186003)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GZf9VTvPLBMYRnKXTf9eSGvnJ1a9c+u3I0jIL4y4JApnN5K8A8s22KWMFoXC?=
 =?us-ascii?Q?JkHEI7vxpfFt+dQee2JDxpJwA5PuxirwKz3kbVozG8Twk/Nfb0Jd4Q/0SeWM?=
 =?us-ascii?Q?pxqj10IP6nHtuK8J2bQGMgnVEqyfwJ1Pzs6CFzp/IIGJ4vAVDCf8G0UQp5lh?=
 =?us-ascii?Q?E3V1bJt9m/8SDmDXQaw3HyXKSbgj+nUYfD+boY3hu7u9uDyhnpIil/9A7/dZ?=
 =?us-ascii?Q?sDTyEI8ZgH+OC1rPzJ9HyZpYcIHUxA+N0CYpTmB9E8/Y2MLs6ly1Fyyi28ck?=
 =?us-ascii?Q?U9cXYas2its13cCZMImftf+i9uAE9cyy0GLLtssozE2mTbzMK8DOOT9WRmvS?=
 =?us-ascii?Q?oLQyWitpbeoBcmQ3RP9c9wRMW8ePeVghlypvhBv0MldMbrn/v0q1xZfSfT50?=
 =?us-ascii?Q?Xf6r+E3/7YyozZatkriR0tD/EbGY2CtqPIfeV111jjDrWgxZKcgQC2luZSD8?=
 =?us-ascii?Q?0UZD3dABftJKh8KivUA67+2tS5WK23x5xDentuc7nuag8hfHBGpMPgWv9XyC?=
 =?us-ascii?Q?7TG/mkt/hdjDt/BkcHtny+AxI0FwomedA4LU6va7Xi+/xHiy5erY8bHQL4yN?=
 =?us-ascii?Q?CXmYyKq+jXRQDflgKZgbK6BRS1gn7PrXngVj4DzKVtOmQvpwryR36F/ADpE7?=
 =?us-ascii?Q?ibKUqwbIuLmKYjhyuZmF6rlK4UBZDne+cVvBdQjhR/bDkbbKSpPnFjzyyNEL?=
 =?us-ascii?Q?vBzI5gr6AyCFf+QHmTZvh/T+yaDfcRF6vJWVorzg4SRauz+xJ86mgL3+8hRI?=
 =?us-ascii?Q?NW/5tchvPn8u3lpg1+cCTdFezYJYdkNce4cXyfcoaK8K4z3WoYUEobeMOAv0?=
 =?us-ascii?Q?ukpOD36L9sOJkw7D6owaoZ3xxl0z8VeR3ziTo5UUZMR9LWlNuGFX63/aeYmi?=
 =?us-ascii?Q?aFcA3HvgOxhslzS+yVNTjQkeKleaNDgjKfgdgBCioekgTkRYJQs4wKrUSk+t?=
 =?us-ascii?Q?vKAQ7zkMswytF51OO45/XZ4eH+4PtVFhsPvAHxiirDsxHz7D2uLmfuSpEwhN?=
 =?us-ascii?Q?3BsAijUKXAuPW9yV8S/6Gy2lHS73qd+3kAfULmw8ZQEaPlVlflMaTuNER95u?=
 =?us-ascii?Q?hLVMvW1toFDclwks6INcxxkJaQRkvsOXXJ4x5Q0NwNcg0oLJkHxkit3H4b0K?=
 =?us-ascii?Q?ld8800F8hsjr1KgtxJMlqivk94tJHmgqbzDTu/SfI8DrrJOySXZjStQ46rzT?=
 =?us-ascii?Q?sQg2NZKD8wJ3eWtBbWz3crnz3+woe4N87E58Tv4lnXiL7XdTxTeIi/Ly6urQ?=
 =?us-ascii?Q?ctCmBAt12Z5i9ypxYN7dFGZp4HOQEkNC0OugZICpvDEKqKeUjhN7z9oW8ZC1?=
 =?us-ascii?Q?87qGHvhcjU9UBJ1nXBFb3X0+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efa67176-11a1-40b3-a58a-08d934803a8a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 06:45:59.5137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iyU8BhMzv63k/7yhQmWdkQFcDBg1M1Gqa9FtDxI3Ckcb+/CENgly/gTxWycprRQ8asuOPCMZmtGBdKLV4Vskfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4605

On 18.06.2021 23:21, Andrew Cooper wrote:
> On 18/06/2021 12:48, Jan Beulich wrote:
>> On 18.06.2021 12:14, Andrew Cooper wrote:
>>> On 18/06/2021 00:39, Daniel P. Smith wrote:
>>>> Based on feedback from 2021 Xen Developers Summit the xsm-roles RFC
>>>> patch set is being split into two separate patch sets. This is the fir=
st
>>>> patch set and is focused purely on the clean up and refactoring of the
>>>> XSM hooks.
>>>>
>>>> This patch set refactors the xsm_ops wrapper hooks to use the alternat=
ive_call
>>>> infrastructure. Then proceeds to move and realign the headers to remov=
e the
>>>> psuedo is/is not enable implementation. The remainder of the changes a=
re clean up
>>>> and removing no longer necessary abstractions.
>>>>
>>>> <snip>
>>>>  51 files changed, 1309 insertions(+), 1413 deletions(-)
>>> The diffstat is great, but sadly CI says no.=C2=A0
>>> https://gitlab.com/xen-project/patchew/xen/-/pipelines/323044913
>>>
>>> The problem is that ARM doesn't have alternative_vcall().=C2=A0 Given h=
ow
>>> much of an improvement this ought to be for hypercalls, I don't want to
>>> lose the vcalls.
>>>
>>> One option is to implement vcall() support on ARM, but that will leave
>>> new architectures (RISC-V on the way) with a heavy lift to get XSM to
>>> compile.
>>>
>>> Instead, what we want to do is make vcall() a common interface, falling
>>> back to a plain function pointer call for architectures which don't
>>> implement the optimisation.=C2=A0 So something like:
>>>
>>> 1) Introduce CONFIG_HAS_VCALL, which is selected by X86 only right now
>>> 2) Introduce xen/vcall.h which uses CONFIG_HAS_VCALL to either include
>>> asm/vcall.h or provide the fallback implementation
>> A word on the suggested names: The 'v' in alternative_vcall() stands for
>> "returning void", as opposed to alternative_call(). It's unclear to me
>> what you see it stand for in the names you propose.
>=20
> Urgh - yet another reason to prefer the Linux static_call() infrastructur=
e.

Which iirc wasn't there yet when I wrote ours.

> Would a general alt_call name be acceptable?

Well, it seemed a little terse to me at the time, but I'm not opposed.
There's hardly anything else the "alt" there could stand for, I guess.

Jan


