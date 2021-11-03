Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE44A443F90
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 10:47:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220682.382040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miCr2-0003Te-O7; Wed, 03 Nov 2021 09:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220682.382040; Wed, 03 Nov 2021 09:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miCr2-0003R9-L5; Wed, 03 Nov 2021 09:46:48 +0000
Received: by outflank-mailman (input) for mailman id 220682;
 Wed, 03 Nov 2021 09:46:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1miCr1-0003R3-Eb
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 09:46:47 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61a5624a-3e48-4a10-b535-186fb0c2c41e;
 Wed, 03 Nov 2021 09:46:46 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2057.outbound.protection.outlook.com [104.47.1.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-Lujn4JKZNDCQEmWo5tuqfw-1; Wed, 03 Nov 2021 10:46:44 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6479.eurprd04.prod.outlook.com (2603:10a6:803:11c::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Wed, 3 Nov
 2021 09:46:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 09:46:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0601CA0034.eurprd06.prod.outlook.com (2603:10a6:203:68::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Wed, 3 Nov 2021 09:46:42 +0000
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
X-Inumbo-ID: 61a5624a-3e48-4a10-b535-186fb0c2c41e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635932805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RyFH3m2z3koFwkumX+a/T7ah10X3tSzEHSnHjLv/4hU=;
	b=nwbPEhY1Rsr7ls+Os5whIUw/dn/NL1kYvRlqqNiEOHs5klrELtvweeVhgah/xySW65TGEJ
	/arjqFdqbvBOQ58TKUWhquWjUM5styxoCmnnOmzZuhHnJmY8gnQWhJGMGyf1qWmvZLKNZN
	jEtjil//Fffp+F+obi5Dhj5a09Z+VCs=
X-MC-Unique: Lujn4JKZNDCQEmWo5tuqfw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9JNdBF1267VDnn55wn4QqbLGugDE14+oGJg4BVy/Uib6H7hLOkKUS+Ge6GFFvZ0PlcMDk12IDhFuIpAIEgeMrFiHi/tnc5w2aCTtSU50RAcymwo6rLttk0b82qg1jHP30I5pYOBxWlWVJtydi8OgLgg0A0YPAAhLpPba4YiM18Gm2re58X49tNvSkAlcJ8VuAK3/MqK6761m3zZc/P+vpzNN4mjp2kddgE06kL0ePahGKrChScHtE+6mnIBOEj5ZeDXx1IkjLNquBngmcme0T2Ps/hiUYukGnsqbEE8mziElwiXF30UQ7bpBU5Ud1goFe7AG4BgwatYKEPZ8whUYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dvNV62STTwPsY+cIkyXn9ZEE5IKaq1cOsNMugFm7rKk=;
 b=h4Fe56yFaZzMtuUbXZwSwuWHL8RbC7L5eBNTn4FXckb5S/xdaDr/MqfH9BlkdN59YxmLE8pJsBa/6nqgfEwIH0cXzgwL8+VyIckMtsDy8JwlypSpTBh+q59JYhJefp8ireC2hUmCe7ytKdroRzahuPb2Y8ueANOkbK2SLt/VHijNLf3001xa6Qa0YNvlMJErNUm8h/DDiOEAySQbpfgYOUpfPLtujpK5G0ikj0dno6/nuRQcQ/b6oxlxje8sJG53kUNWKYWk/Qyx6bU2HCKCXYvINCXnKZFQIYBmVxzU6GR39FLBUwNC9IYtXSv52R7j8RNNwtYL2GlDe0NfDoB4Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bcaf1547-98ae-923f-5be8-50156e318bf4@suse.com>
Date: Wed, 3 Nov 2021 10:46:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 3/3] AMD/IOMMU: iommu_enable vs iommu_intremap
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <09137aa2-649f-08fb-ba68-75f8eb16fc63@suse.com>
 <ff7b68b2-5bba-2927-e3f0-f3062862c466@suse.com>
 <YXaGxX3J1aB39mSG@MacBook-Air-de-Roger.local>
 <dd2929fc-dc1a-1c16-5954-6894766d9dda@suse.com>
 <YYEa6HQGR1cHJBw/@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YYEa6HQGR1cHJBw/@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0601CA0034.eurprd06.prod.outlook.com
 (2603:10a6:203:68::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91bc3d28-a619-44f2-21c1-08d99eaed7d3
X-MS-TrafficTypeDiagnostic: VE1PR04MB6479:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6479C767381B2899E7230AF3B38C9@VE1PR04MB6479.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1lO/TYDpTK5KaT2x2JZix7xYgE/y60pRfss9RHTreAeK/AyrtET1sJ2pGBl1ChOGO7x5OspULPn6Bz2IVyONx6E2lweFP4/b9ruk7rhpidTfSYGAOr4jqfUUWMmX9eGWR65ZYRuxz6IZZuL2+ZUJcxRnqnk/Tdje82YSOCLcCoOesa56vlyzINVuB/4BT5oFuQL7vse2YOc+Y6GaMJEmuTcuzVcEnvVwtnAqQXQLQeX8U4u4BqtYaYLaR7EzyFbDYeRikbKeEhIhNsln5nRIDs84FChHNCunIR8dXTvbu+8RdKIBHF+v3hW7uzbm9PsrGoXoQ8apgBSzkE86rCWmH9u1c5AXywEyKoR9LSoPLk5i5HZ2PtH/1a3T6a8DCB5rGe0CHfsZdRf+96VmVxOpof8aRF5dWhN6nBLXlh5AG99I+Vbn8fQOdNYA5uW9MOJWrBO+RVzFML68NOw/oGHmqX3r5FW+SgdvYe3rTVV2GjvEb3XzGLGS+wUeW7gXypgq0pZ2Ic5gOWtT34I8Zu+nEIYBIek1zej8KXaH0Ec2yGUSf/pkTM5lK2QMa6XvQ8GstQrXaWXce1u1U6Xgv0HwsrkL6e5im7Bd3zbhd+TEnwtXAG/hBp0SX+I6/SIqd9PLtP8jE713Zuf3+Yi+aVHovxuQDVZMB1B0QYbGyrmfW4ndq6fpYQ/IR5nm8/NZVRON6BeuHByqqYCM0tZU+UQPeQNR7JM5o4u7otM9PG3oFf8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(5660300002)(54906003)(6486002)(86362001)(316002)(83380400001)(508600001)(66556008)(66476007)(66946007)(4326008)(6916009)(36756003)(31696002)(16576012)(956004)(2616005)(8676002)(38100700002)(26005)(8936002)(2906002)(186003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xIx27/qGSsCQOslJREVidy67vLKsFf3HlmR9xAzpXPMaUD6f6g/RAe8l2THq?=
 =?us-ascii?Q?4V4KqxNDIEZTh9QEwwdrhK38mKgGDM6nlubNXsoW49v8hghR8b7JP0J1euPs?=
 =?us-ascii?Q?GO66DBlZnHBGvUOEat3AI0fya7O6bdSKHxXreUBOEsSTcSAPgZlHo+G7ul0C?=
 =?us-ascii?Q?JUUQaI90rZZx1uo3IB4g1/ZtcVh3ZmvmhCWzMuuZNMtWvctw0lzQCLG5Mo+K?=
 =?us-ascii?Q?e3gXKqnfdSyJdcAXC1QW5u19ENHnwT61T9CeZ0otfWBllPKSVTUnSUny2XSF?=
 =?us-ascii?Q?yo7SadUl6b9KaiVeUsezHXk749QFNGCKE2xo0Auwr0zHE3P0bMdiVAJzuWzd?=
 =?us-ascii?Q?d+tybftogLc0TH+KU7fg5NVOg+F/UlKgFj+GtSz+eJTzGqlAXdBbYBbWvksd?=
 =?us-ascii?Q?bVOY+w5E1Yj8jbovigKs/jviTm2G8+a1dYjbN2ZadNnBw6uGkqp1xQaNyH5I?=
 =?us-ascii?Q?+1AE7Y5bs98ixrxwSL4etof1wAxiTeQn4Tda33WwBQfzA+hSH3mPjtPc4R3o?=
 =?us-ascii?Q?iPI0sOtfFmp+T2/bSFI74Yh1nFl5mMFi0xwZT+BBLcWF6+itKxRbZmLKx01c?=
 =?us-ascii?Q?R/VplOQ6AGcVjuA1tU7YVkncMgGyqCmnI7ItKA7Dm8t8Wo6lLvLMvqTT/us6?=
 =?us-ascii?Q?GC95vbog8weoimwLUgy7wLMw+GvsOaUB5ZKmdYERj0jD8XXDzCGcvAvnd7xm?=
 =?us-ascii?Q?cxtCFejFBVC9D1LHBN/MsF2vq9OgK9jxdNILZAkrwbW7WxJw77MTNvbmk+59?=
 =?us-ascii?Q?dLkHzkqBgeTgaefNQ21Hz3RYdtIG/7syIv+MehutFznLJK4Z3yLcdnGsmadR?=
 =?us-ascii?Q?DNcYM0UwkJZki9P37p0pcVhMYMvIE94uSbRRhpGDnky1Xj5R1bH6damQ5Gi3?=
 =?us-ascii?Q?8w2UlK1+HYLqJ6slHt133TBytMgMOig3Hd3/Ut0yoY88qm5+ckyD8hgx/917?=
 =?us-ascii?Q?g9FPF45kfBWLO0uNj+2E9dYhuMKju3/KLO9kV3YAu6616djLNuKVVlG0587c?=
 =?us-ascii?Q?wnbGXV6S46shJaKZh+JyiGniUjN0p29248zYlK3OBn8Zu4GBYHExI6xqiFce?=
 =?us-ascii?Q?xlINQDACUX1Ls1R9a20SvEokOoBgMuN5XtqYFlwr6aifA+6KyQu7zRSiYatU?=
 =?us-ascii?Q?LtkjCdj9/25UHMzu+CaTLm9xmjujJC4bFAV5eeXYMuYBL05q5EpIMN9A4Mvb?=
 =?us-ascii?Q?hzk6eSzK3FPI5gJUFGh8TkIjZBlU99Vr+e9ihZjghZ5/y9aY1VYDUo3Juh0X?=
 =?us-ascii?Q?FInwwHKaCbyZfmmZMF6CE08xQMbATaquW1avBuvU1lzPEWrWmKwRPLdheoVQ?=
 =?us-ascii?Q?dzE5Q+Av9xLWHGjea15XzaP/9zkzyiOWCbaOUyjzQF10rxTv+pENe2Ammf+J?=
 =?us-ascii?Q?6J0SddQoWktAxGf90lR+s2x1uyeduwBIzxWiiH5igztKH6WmJ8AIveBs9HzE?=
 =?us-ascii?Q?LoTodiX0ZFcU+2CX5VR0rnpY3UerVZ+zEjzMiRhM5R8Ir7D0a6aylfyL3Aby?=
 =?us-ascii?Q?7ngjJSBfpgmKcT/87ub5zjZaInZLXXpi0nHMpd4HNN73SfLsgfUb7kOLwy/j?=
 =?us-ascii?Q?+cr8Ue5hLKGQIvi39R4YvMt/0lZhLmUzMcisMNL2TBLtauPsw85fT8IY6RYE?=
 =?us-ascii?Q?Yjwd+dsYXhY9pkn4zBtcWv0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91bc3d28-a619-44f2-21c1-08d99eaed7d3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 09:46:43.3691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cqnLKhoFKaGU7THdFECjJdi2PYbFKt+fOmxq8vtotFxzZySsBzHmDXrRf4xBomUUI5ph8Jt2CFMeSrlCtUl2UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6479

On 02.11.2021 12:03, Roger Pau Monn=C3=A9 wrote:
> On Tue, Nov 02, 2021 at 11:13:08AM +0100, Jan Beulich wrote:
>> On 25.10.2021 12:28, Roger Pau Monn=C3=A9 wrote:
>>> On Thu, Oct 21, 2021 at 11:59:02AM +0200, Jan Beulich wrote:
>>>> The two are really meant to be independent settings; iov_supports_xt()
>>>> using || instead of && was simply wrong. The corrected check is,
>>>> however, redundant, just like the (correct) one in iov_detect(): These
>>>> hook functions are unreachable without acpi_ivrs_init() installing the
>>>> iommu_init_ops pointer, which it does only upon success. (Unlike for
>>>> VT-d there is no late clearing of iommu_enable due to quirks, and any
>>>> possible clearing of iommu_intremap happens only after iov_supports_xt=
()
>>>> has run.)
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> In fact in iov_detect() it could be iommu_enable alone which gets
>>>> checked, but this felt overly aggressive to me. Instead I'm getting th=
e
>>>> impression that the function may wrongly not get called when "iommu=3D=
off"
>>>> but interrupt remapping is in use: We'd not get the interrupt handler
>>>> installed, and hence interrupt remapping related events would never ge=
t
>>>> reported. (Same on VT-d, FTAOD.)
>>>
>>> I've spend a non-trivial amount of time looking into this before
>>> reading this note. AFAICT you could set iommu=3Doff and still get x2API=
C
>>> enabled and relying on interrupt remapping.
>>
>> Right, contrary to ...
>>
>>>> For iov_supports_xt() the question is whether, like VT-d's
>>>> intel_iommu_supports_eim(), it shouldn't rather check iommu_intremap
>>>> alone (in which case it would need to remain a check rather than getti=
ng
>>>> converted to ASSERT()).
>>>
>>> Hm, no, I don't think so. I think iommu_enable should take precedence
>>> over iommu_intremap, and having iommu_enable =3D=3D false should force
>>> interrupt remapping to be reported as disabled. Note that disabling it
>>> in iommu_setup is too late, as the APIC initialization will have
>>> already taken place.
>>>
>>> It's my reading of the command line parameter documentation that
>>> setting iommu=3Doff should disable all usage of the IOMMU, and that
>>> includes the interrupt remapping support (ie: a user should not need
>>> to set iommu=3Doff,no-intremap)
>>
>> ... that documentation. But I think it's the documentation that
>> wants fixing, such that iommu=3Doff really only control DMA remap.
>=20
> IMO I think it's confusing to have sub-options that could be enabled
> when you set the global one to off. I would expect `iommu=3Doff` to
> disable all the iommu related options, and I think it's fair for
> people to expect that behavior.

It occurs to me that this reply of yours here contradicts your R-b
on patch 1, in particular with its revision log saying:

v2: Treat iommu_enable and iommu_intremap as separate options.

Even in case I receive a release ack from Ian, I'll try to remember
to hold off committing that until this apparent (to me) confusion
was sorted.

Jan


