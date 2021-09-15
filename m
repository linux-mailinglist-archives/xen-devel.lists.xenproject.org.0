Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD6640C2F3
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 11:50:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187416.336266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQRXn-0005vl-PR; Wed, 15 Sep 2021 09:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187416.336266; Wed, 15 Sep 2021 09:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQRXn-0005tk-MF; Wed, 15 Sep 2021 09:49:31 +0000
Received: by outflank-mailman (input) for mailman id 187416;
 Wed, 15 Sep 2021 09:49:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQRXl-0005te-Ts
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 09:49:29 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 374727e2-160a-11ec-b4f0-12813bfff9fa;
 Wed, 15 Sep 2021 09:49:28 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-TR9Ib79VM-iNZFqqfQwUKA-1;
 Wed, 15 Sep 2021 11:49:26 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 09:49:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 09:49:24 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0240.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 09:49:23 +0000
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
X-Inumbo-ID: 374727e2-160a-11ec-b4f0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631699367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YVYF1+4759JGKnDVGjvlOJsaq7w4NBqK3wjGpNJ2IXU=;
	b=hDWFh0UqxY6lmlN0Ai44zR6kWBbxn3VUSQRqfKu4bmzosa1J3WYPYmURA5PnS7wihtm30t
	dJziJoOYhBza4sTjiGMev9HfDgk4dC9m7xfagTqFGWf1CRLN2DgcMGHmQll7sfBD42NseE
	jsN6sD1n/36GmVXSpZuHaGCnKpoe5Ro=
X-MC-Unique: TR9Ib79VM-iNZFqqfQwUKA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PUXmSFaHrVpiQa7NM4thzhP7jpU3cWYR8y+0CRYFfY0BM5mIfD3dUnGWbJXCPMsN9VKzMj1Dyfu9tgSSYJYysZ2zHiOhPHDutGtaDCKw2M14oUqa1Fa/ZD6tktU81pcwyAheNElpK6Lf1dUCnmrTI2aRW0SESMdPS3aaLJNTGCl58Cf4ojx8wL5X5EJBPQbJ2KBzBlf5xpP5R48u7TIaXpsQbFxz4fyuJ1lD7/CSIuhTHlgZICi/huqejX5B1Rf0blo9X7bEW33adbdyc5SGpFpjPfarh0mMqUANZ+zs2TS6XX+lZsWnTen6pwDFezt9e6gH7sw5NfnBn7GS7Niv7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=a2AgMpcRbS959oxBQSIAFBZVmflgjKd8eH6KLnV2Gxg=;
 b=FZecZNIZNrsBOn9rZn0Kuy6AGqxXen16n9Qth8JEaWvCAkNsQ8vNpWbdzkqnPxTOz4r9d+vmILTfsYYNAmANWX7Qzp0AJ2bfaJIcx6y3SFxRXijIiAGluQ+v9DkFAHSiPc8LIx8bbB4bFhkA2lK72ZRIBpVVM0Bplz/RYeR1jioBbAhyHBTPX8uoERQhaAt/aAsp746RUQ3L3qdcA6mBerl+S4m+mrpstcDQT/F8DqgVFeqZ8lZZk8PMSuFyse9vxd48nfzwgTIXeQz1Qp75GcETv5kiWndRaoMYi1/zfyR+UCHpsZbMtI6hfeHfJQYFrgg8f6N6I7o9EqPsvXAnAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2] x86/p2m: fix xenmem_add_to_physmap_one double page
 removal
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210915080342.21346-1-roger.pau@citrix.com>
 <1d70ff4d-bef2-1865-27c3-27d17c15d17f@suse.com>
 <YUGyhk0uZQMf9c4s@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <98dd86d5-a864-a95d-6fa7-f0c70abb5a84@suse.com>
Date: Wed, 15 Sep 2021 11:49:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YUGyhk0uZQMf9c4s@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0240.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec6e1760-1189-423f-1e41-08d9782e195a
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB233536AC87C3A3438101B4BFB3DB9@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n+v9q9qc2GkhUH1SkkY2HgKmQ/oV2HW28q+ntFN4yQv07d/DFIcwmc7IdCvtUC7We2/JszzffuLf/Sdez9rgG1kimdGXEoP5nxgqHks5C6qVVfBnLvIiCHqcFSyRcgdroXW76G5Vcnt7P1yV1Kr5JnzqM2u+EFIe3x56MLWDsOeUj2PhUrfzZjs0npNTjRLbc9BUH5QGWsRTEcSrNvC983AYOsXuM1ySS3c4PkVgJtaJGsZI5ykCFl4lAZa264gxmpwP1ei33tV7/oetgWT0JbbLZXxxhUDghJtwJyAxLu85PKUPVcrnz5M2TJIpdZFZ9n8Oc8T4SXKJAJDY3QpSnT1ALQBcCabvpPTyg7TGa/hpdATD4QbQlrKJhGoVj72X99R89LyuYrfwWM8CCvTeos0OJEYTYYphOm3xnUQ8Z2yVoADEpty+jWLCXqM9AsSXJh0R+8/wTWZF1fC330Uqinu8/fIfj1N2NUOUa79tpihjEOAvjbUMcn9jpziR7sNp1w+CTdXWueIub07lbL/hOr6VFFAOMHZJfpHz6BNu2ADiuu1FRCFGkNpez+Lbu8vvw58BEShmqk2dlEYfr19eU8gDmIUJPQySjzRT0/ZkVIL3Y2kD3NcF034SQGMNU5MuLSSRg/4Ht/jug5BnOjrzWFHnWwchTObvn6V5uUVghk5WzdjZvOt3+8NQD6K3+h0AUzFediUjBnw2BwQ8+Q3wTVavePC5RnlwdRbHTO0wfP4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(376002)(366004)(136003)(346002)(5660300002)(86362001)(83380400001)(478600001)(186003)(4326008)(66946007)(956004)(66556008)(66476007)(54906003)(8676002)(2616005)(316002)(16576012)(6486002)(26005)(36756003)(53546011)(6916009)(31686004)(38100700002)(31696002)(2906002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E0QaFGKZjS80XmiVMoFJ/jVhTdzZ9HE21dW9pKFjPudlV6St6gvg8Rx+qGNy?=
 =?us-ascii?Q?WMZOWMm1Z8BqquGWsvOoNjnLvq3fRPcN2lsWH47LMYh1UuKcsU0BiAqkznJL?=
 =?us-ascii?Q?V6AMYHGk4XlyM2mDVLuriLw7bvyp6Q7sOxA2Z1AZGGIaN6l9g5e4YZkUxQpi?=
 =?us-ascii?Q?UGZTIeU1hazwcs8zO+mjxP2zFfPUEt0pkLNK2xP0N+xI1LeLwD2HFhH8jiSW?=
 =?us-ascii?Q?Opg/1qyRe2Oauw6NXzp2RRy0vbY5GwSfAxJnanE+CSQ/t2F6KDmdGTBCGccB?=
 =?us-ascii?Q?MjcNPcsmOKIuuQpQ0d0yRVkUm0e0UQ3zSfbBB21mJR7NS12E2V7+Iw+nvKIj?=
 =?us-ascii?Q?8uHo2IS84yv7ijb1LVFBjeRWweC0R/7pxMdIG/FzYw6bQcNpWRHnWF7xvMH8?=
 =?us-ascii?Q?i3enEgmDrcTKnSiPcF0z/uMS+J0knvjR2wL0kLYKFgUaOj3fHAvClhBYOXn6?=
 =?us-ascii?Q?oCqgQcE+ILq1JeGFAvro1mEpu5nMP+H0Q/YEB4iOx4r0kG04Ah0j4YEXMDgX?=
 =?us-ascii?Q?FMfHchPz8Ig1M9dsCPksBoPBX1Gypvo0KapDW9eUsehgSmmKp3TEtp7CrYUx?=
 =?us-ascii?Q?GEoerFuMzLtQTsHA4JNUtyNYQHDXB9u86qaljBYMnQynsLaWotlBc9dF+1oX?=
 =?us-ascii?Q?XtFdz3d9LmFpLJV94pw8thQtuDFU10G3sHD4Z3laR+DeZ3moLZJt2TZ7tbzv?=
 =?us-ascii?Q?EkJ76isTi38/tXziGHHbJYwkCG5thGPA/N4YwpiucdgV7I2BVGmr67Kyop31?=
 =?us-ascii?Q?DuT8FaVRtYnTf3OVBwh6ckzNZSbBVI8iqZOxWWVg4VQ7NZIioh01lTNjcZnc?=
 =?us-ascii?Q?6fezkZnjYgsGkBrsO5b2S4/hbDpUuW+D1RjVpHOElgIKRKjNtMWBG+m2HW3v?=
 =?us-ascii?Q?1ItQ+98PilbAAfc/+4fcvWCDuAx9RrrWybhxDoFR1viQ2wVmj1FMgDs5l8HT?=
 =?us-ascii?Q?rzh01nxQNj0f6wiuYkbuHhk3QQidxZ2qa2WHbx+4XL/ZjNs0LqGqOnBRTt+x?=
 =?us-ascii?Q?EvKh8DQOwQWsxO9H62Ry+yc0ITfR7w3dQZHSVF5EPAP1uiT8dmI1Gc/bChM0?=
 =?us-ascii?Q?DQcTzkaD6GiSH+/PNUB9jvHSJqVhhGi4u3jkZRWuayXbCzlGS021qlT3do4S?=
 =?us-ascii?Q?Kr1iIx16j666ZFGuLOb/fQaCmnEGb4kdtWKipIf+PTDxl+FJqGrfW5jyHZlD?=
 =?us-ascii?Q?1tuBCYMgAvdo0J2u594u8ko/LUOYNj+zLFtsbqEmdtxAu5Wp8wpQqZcguhTY?=
 =?us-ascii?Q?GYLY3zTNqT8So99b9DdpuMT6vki/wbHyqyYtWCxiQN2EPmup+TI+zeZ6soSm?=
 =?us-ascii?Q?vZphxjePCAi1d2n10s8s79Og?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec6e1760-1189-423f-1e41-08d9782e195a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 09:49:23.9980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HjnIvA3/8BcfGFpqf9PAGIRwQWiClz9RdGV1iEeLwQAYfydl9f88XoMc0WK47D0as9Dm3PddPlAPGIWkhlZJCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

On 15.09.2021 10:44, Roger Pau Monn=C3=A9 wrote:
> On Wed, Sep 15, 2021 at 10:16:41AM +0200, Jan Beulich wrote:
>> On 15.09.2021 10:03, Roger Pau Monne wrote:
>>> If the new gfn matches the previous one (ie: gpfn =3D=3D old_gpfn)
>>> xenmem_add_to_physmap_one will issue a duplicated call to
>>> guest_physmap_remove_page with the same guest frame number, because
>>> the get_gpfn_from_mfn call has been moved by commit f8582da041 to be
>>> performed before the original page is removed. This leads to the
>>> second guest_physmap_remove_page failing, which was not the case
>>> before commit f8582da041.
>>>
>>> Add a shortcut to skip modifying the p2m if the mapping is already as
>>> requested.
>>
>> I've meanwhile had further thoughts here - not sure in how far they
>> affect what to do (including whether to go back to v1, with the
>> description's 1st paragraph adjusted as per above):
>>
>>> --- a/xen/arch/x86/mm/p2m.c
>>> +++ b/xen/arch/x86/mm/p2m.c
>>> @@ -2799,6 +2799,13 @@ int xenmem_add_to_physmap_one(
>>>          goto put_all;
>>>      }
>>> =20
>>> +    if ( gfn_eq(_gfn(old_gpfn), gpfn) )
>>> +    {
>>> +        /* Nothing to do, mapping is already as requested. */
>>> +        ASSERT(mfn_eq(prev_mfn, mfn));
>>> +        goto put_all;
>>> +    }
>>
>> The mapping may not be "already as requested" because of p2m type or
>> p2m access. Thoughts? (At the very least the new check would likely
>> want to move after the p2m_mmio_direct one.)
>=20
> Is the type really relevant for the caller? If the mapping is already
> setup as requested, I don't think it makes sense to return -EPERM if
> the type is mmio. I'm also unsure whether we can get into that state
> in the first place.

mmio perhaps indeed can't occur (because of the earlier
get_page_from_mfn()), but in general the type might very well be
relevant: The seemingly benign change might e.g. change logdirty
to ram_rw. Whether that's for good or bad is a different matter.

> I'm unsure regarding the access, I would say changing the access type
> should be done by other means rather that replying on
> xenmem_add_to_physmap.

It _should_, yes, but there might be callers relying on it
changing as a side effect here. (There might also be callers
abusing the call for this purpose.)

> v1 was indeed more similar to the previous behavior IMO, so it's
> likely a safer approach.

Okay, I'll commit v1 with the slightly adjusted description then.

Jan


