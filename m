Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D21140AD00
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 14:05:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186510.335241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ7BV-0002Bm-6U; Tue, 14 Sep 2021 12:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186510.335241; Tue, 14 Sep 2021 12:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ7BV-00029z-3V; Tue, 14 Sep 2021 12:05:09 +0000
Received: by outflank-mailman (input) for mailman id 186510;
 Tue, 14 Sep 2021 12:05:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V0d6=OE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQ7BT-00029t-Ub
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 12:05:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0daa36a9-059c-4116-909d-2e4c3ec1a0fe;
 Tue, 14 Sep 2021 12:05:06 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-4IjHtp5PPZmW7IgbjmQ6Jg-1; Tue, 14 Sep 2021 14:05:04 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5904.eurprd04.prod.outlook.com (2603:10a6:803:e6::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 12:05:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 12:05:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR01CA0121.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.15 via Frontend
 Transport; Tue, 14 Sep 2021 12:05:02 +0000
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
X-Inumbo-ID: 0daa36a9-059c-4116-909d-2e4c3ec1a0fe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631621105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6iBG0dT/ga0ORRPW+vBvUu3OPQkhNIVEXGDSvBG49Oc=;
	b=YzkdoWZjMU0j19aYk977msuE2rbF78vIXJajtvQik1vzNLjATEDGg5EAFU1Nt/rMFppENJ
	ewyNhkjNN/ovdami9dW7g+TVEIrhTUcgegMuparR22/HdUmhzcOndeGcQw8dWFfZDKCthl
	PJ466KIsqjXuzLDi34NSbke/AnWfBrw=
X-MC-Unique: 4IjHtp5PPZmW7IgbjmQ6Jg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qxc9L2XgCI0K+84fi/NnCVJVu2SxW7Zb8r7TH+HEXozed/0RZOYz13U4/KVgg83ahQR3Bo0Kqm5td8ctVdFf+XaZ3dEJRzuR9JabfQGKZrb+dsIOUiuJqbz8J+u18uuu0fJLop2BKCWuDfnoE4TAAf1qO8UD9ZNBIRVKT42SnlP6v9CiwB5fI6dcVejEe7qM4J/+zztqNRxW3RK6/+w1p3lAk340xr2luLwUBPGgVvM37S4Ac7fMu3PyXuSDYqBvYhpa8YRT36/g1MDfCBoSRc5JrFowM6Z8lHISYX5uOI5iz2fEFEddmOPrrQVOj7uQ8y4rlK62ehPBQGE9WyPDJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=vjJDOYTtIahsSojHg6DggSb0G+WVqbSXp5whCbCigC0=;
 b=Fn3T7OLuF2J+XTKbXSN/9vOEeA19AklD3R/9aMxbwt9Avbpk65ZlIXZgAb7sO/Pi3GyBpJ02rHj0oxl+EwFGFFgqtRdy7zrHWZqX0FqHIhKhV4bKDdS/iu6xbHGcQY+009WsMOUKtstBM+x0y7CKnPR0eR5mN7rWkPoG4W/uMYM7sjrVDJnWepOe7Pdh5rIVL3dT6nhbhs0Pa+TDSp4yDMC6TedN2vcNORVHaoOYkDEcB+M6QyyuwX7NSPfBMG18iC2q2CAVCoysQmtcj/BCTb8SPE7qkoK+b12aZGxQIiQrr7yULuoWUZrlThVQruVb+XFoDa6qfbyPD8jkBdV2Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH RFC] vPCI: account for hidden devices in modify_bars()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6285981f-683f-a043-7025-993613eaea7c@suse.com>
 <YUByvkKO+NlIjB2m@MacBook-Air-de-Roger.local>
 <45e8ef36-3f7a-5cd7-e640-61e1c6d63903@suse.com>
 <YUCFxJnDoaVNgHiu@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <df432c93-b722-6006-c3dc-7f511b377bcc@suse.com>
Date: Tue, 14 Sep 2021 14:05:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YUCFxJnDoaVNgHiu@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR01CA0121.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5e390d4-1ca1-46e8-a676-08d97777e223
X-MS-TrafficTypeDiagnostic: VI1PR04MB5904:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB59043E0EBA8EA28DF3B51953B3DA9@VI1PR04MB5904.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LfSTwb7t0/t3Px5PJ9J482ttlzLkB3ON2UyY2vMyNXg/e0HNEdX14Ab8a6+dZ1k/Lp55RDZYVte52xm4TSd9GpOtPpNU0ICU3iP2QJCXP/ru8UjIIu6HBwFOAskjn/wQRp96YmILzXRaTI3oQRhyxeigBcz7iG6m9XPsHlaa+/lsaYGOyae4y8yCKv6MQBVb2kdH2CqjN9YQs0ludPI4fiNVJNiFy0Db/lN6hVGBxiR0ANe9gVGx9KUkIBv835yQHxNfvN+AE2WfSlmiC96mLkdjXhygbrCHLwpzL8AqFJPsy0A2LykyiwFXZ+RZpgqjSt+Y30Mkw8FCqBagW2RaQJBz8eN82LNdFtBE2B/D5dRrXEHN7WGj+6jwDiU8uCoCQKkYlDLRF+BY38fHfrd0EkL8BXC9rKMHdC12jdx+Ef5B2LFbyTi3Wmlk/H72Q/N0kS1V9ycMIkyTRsobclVnqmzldzx/GqqMXX+S9Du7IMJ0oaEPbJ/JisuFYvDXmTlpD+rJcEF5+MXJgnu6SMBXqSu03mkpualnJE6WmPcGpOdK6hjgSMZKQtdz5HYE/u4y7+YdMNUD8j75JgsBcys8CzHQKvpaL6DZvklf3XdUzNlEFyMBErH3g68LuVFVCXIDABdp1VDQn5Jq+/K8KOOzZ6Vc0tw/+64oRyRsDTiZMy+fEDC3/rbEAi14YuCPHelcIqspGosXaotJ2FvbogXnBw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(376002)(39860400002)(396003)(346002)(31696002)(8936002)(8676002)(38100700002)(316002)(2616005)(478600001)(5660300002)(6916009)(16576012)(66946007)(36756003)(4326008)(186003)(53546011)(66476007)(6486002)(26005)(2906002)(15650500001)(83380400001)(86362001)(31686004)(956004)(66556008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SYvZJIXgZysMxrWTNt7eed5u9qULJJRKgekrRL6UJ4fZtGP3DdSy5zxHctXO?=
 =?us-ascii?Q?fEwU62sP5y1GOvjEi9k9zQszML7cp+LG1fp5CNrZJ6qs7CDrK/JU8XQ3IbBv?=
 =?us-ascii?Q?f5AqgGrR/VOg6ZLz+Y2WboX3ab6rOBa+Ki195AR7Ji/T0U/97/A/fQSA3Ul0?=
 =?us-ascii?Q?2ME5kRiM4KODQBEPdF1RL0rFHKhPDidafxFQ4QJGfMiGoAwYmjXE8TlWfpEI?=
 =?us-ascii?Q?z5XUHPl1dRq4GNfdFMxGd1gkew85W9h3Isz+RVhAdbCk8mQriVwyzGZaJqWR?=
 =?us-ascii?Q?cVxDLoKEfhLLvAICUWBJHkX+HMMv+JF1N0H4Khdsv1inCpI7ptyqmi0q8c3D?=
 =?us-ascii?Q?17V6Q9eoKxvIdg46Ngr7o2o86j+EPBfb8J8G0GQ+VtQqTprvUyEKQE7ECw35?=
 =?us-ascii?Q?O981P2ao+pluh8WG1MWaNTCCaYPQwnPyRr+T9dr/RaTPoje2yNXKTafisWLb?=
 =?us-ascii?Q?Aw0w+1IzQ1+0zirIRzeww/9QDthsox76NhCW3jeRI/S/56fT/OGZx6OR2dyg?=
 =?us-ascii?Q?SQNTgB762XmPd6odSrDe/F1im5eof17U/wOBP3V5s06QgiUhwRo2Do/dwVUE?=
 =?us-ascii?Q?/z39z6d+CL7ox9B+3paGYZVQsTMnlirCXRlJMLu45tbvGdLP5Gfdnm8Wb9IZ?=
 =?us-ascii?Q?kwQxptUbYnlMOVo2m0VoDtW91T3QH5upLAPn4KlVEaGF0+xPEoYlswiZti1u?=
 =?us-ascii?Q?t67OSzVfIjRKFnLOXaqzdmH9jnkDwiee6k4UnlD8BS/fbFfPCSUpMTEHxDdZ?=
 =?us-ascii?Q?fOrIgvTXBMWLf7GcFnbjjAdZQiNYt0G4I3gjpGl7bcXtrEAym1OdpAHAux9Y?=
 =?us-ascii?Q?WqxwA4tWNW6D6YyhVWDH9zm8tDaOQlwAcmsJTtEU+jN+9kVkRI5ngbt/jziW?=
 =?us-ascii?Q?aTQJqZ8Rb8cWFuSheH6nKW2/NS70frBtWANLs0hzWP0wKj3PHc+HVlgoauCI?=
 =?us-ascii?Q?5j825mwc5LsiP7sFopgXv+wkphsy+nll22R+qHZ28r69WflALwb4kFkVW/XV?=
 =?us-ascii?Q?Q7KJ6BCC3giXa3kObwSowvqXJHfZm9qBmU6/wvjztDAlF6WLsxS5Zz5CWR7p?=
 =?us-ascii?Q?jw2lfJv8D843s4lafk4Hxgx4+17Mi6KA4bVBJeFzIklrGlfjbjw7ZgHqlgRY?=
 =?us-ascii?Q?2hN2M4p4TMxGC6vmXbnVb5Q2V7YgdxvNBrU6Or7QipsqnyvY6QyUlPzo+jKc?=
 =?us-ascii?Q?zAsdEDYhQmr61yV9qlaCIZ0Zkvr8UkCOoiVc7nEK2iXfPl91JLde/5vRhiTg?=
 =?us-ascii?Q?/6DGhS9GYEMDk3H2C3NbpIL1lbUMj2vjs6PsHbAEKawUM97phVjw72FSEo8Y?=
 =?us-ascii?Q?R+JZg99mTkhuuMSpIIcxFuIh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5e390d4-1ca1-46e8-a676-08d97777e223
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 12:05:02.9795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mPu8cnB7SqBNt/Usvn/DRxSxAjs9lFClFv3vhO1fC411dpp6NNzIAQVrVUEW7qEqhCT9sj500DSQBYbCOsSLdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5904

On 14.09.2021 13:21, Roger Pau Monn=C3=A9 wrote:
> On Tue, Sep 14, 2021 at 12:12:12PM +0200, Jan Beulich wrote:
>> On 14.09.2021 12:00, Roger Pau Monn=C3=A9 wrote:
>>> On Mon, Aug 30, 2021 at 03:04:55PM +0200, Jan Beulich wrote:
>>>> Hidden devices (e.g. an add-in PCI serial card used for Xen's serial
>>>> console) are associated with DomXEN, not Dom0. This means that while
>>>> looking for overlapping BARs such devices cannot be found on Dom0's
>>>> list of devices; DomXEN's list also needs to be scanned.
>>>
>>> Thanks for looking into this, I certainly didn't take hidden devices
>>> into account for vPCI dom0.
>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> RFC: Patch intentionally mis-formatted, as the necessary re-indentatio=
n
>>>>      would make the diff difficult to read. At this point I'd merely
>>>>      like to gather input towards possible better approaches to solve
>>>>      the issue (not the least because quite possibly there are further
>>>>      places needing changing).
>>>
>>> I have a couple of questions, AFAICT we currently hide the serial
>>> console and/or the VGA adapter if it's in use by Xen.
>>>
>>> I wonder whether we need to add vPCI handlers for those:
>>> setup_one_hwdom_device will attempt to add vPCI handlers to the hidden
>>> device because of the temporary override of pdev->domain done in
>>> _setup_hwdom_pci_devices, but I think that for hidden devices we
>>> shouldn't add vPCI handlers. We should instead block PCI config space
>>> access from dom0 to the device so that it doesn't mess with Xen usage.
>>
>> The answer to this follows (I think) from the one below.
>>
>>> It's also not clear why does Xen want to have those hidden devices
>>> partly controlled by dom0, as it would seem to me that dom0 interfering
>>> with hidden devices in use by Xen can only lead to trouble.
>>
>> Dom0 can't interfere as long as it can only read from the device.
>> Restricting accesses to reads is one of the purposes of "hiding"
>> (the other is to make it impossible to assign these to a DomU). Not
>> allowing Dom0 to read from such devices would lead to wrong PCI
>> device discovery - some devices would be missing (which may or may
>> not be merely a cosmetic issue). If the missing device is a multi-
>> function one at function 0, other devices in the same slot may also
>> not be found by Dom0 (depending on whether it looks at non-zero
>> function numbers in this case).
>=20
> Hm, indeed seems possible that missing function 0 the whole device is
> skipped.
>=20
> Maybe we need a special vPCI handling for those devices that just
> allows reads but not writes, and that doesn't maps the BARs into dom0
> p2m?

Not sure about mapping. They could be mapped r/o. And they may
actually need mapping for multi-function devices, but I guess for
such devices to actually function properly then there would be
more work required.

> Or could the BARs potentially be shared between multiple
> functions on the same device?

I don't think that's allowed (or would even work) - if anything
(like in general) small BARs may share a page, but without overlaps.

> This also makes me wonder why they have to be added to the IOMMU, is
> that related to device groups and the fact that Xen is not clever
> enough to figure whether devices belong to the same IOMMU group and
> thus must be assigned together?

I'm actually not sure whether they need to be added to the IOMMU.
With multi-function devices in mind, back at the time I though it
would make more sense that way. But I may have been wrong, and
hence we may want to revisit this. Problem with such changes is
that they may cause rare issues on very specific systems, which we
may have no way noticing even during a full release cycle.

Jan


