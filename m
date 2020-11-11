Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C872AF455
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 16:03:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25025.52577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcret-0006by-Vb; Wed, 11 Nov 2020 15:03:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25025.52577; Wed, 11 Nov 2020 15:03:39 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcret-0006bZ-SL; Wed, 11 Nov 2020 15:03:39 +0000
Received: by outflank-mailman (input) for mailman id 25025;
 Wed, 11 Nov 2020 15:03:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nKbA=ER=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kcrer-0006bU-LV
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 15:03:37 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20067034-93a5-4f23-8e31-ea0f002f5abc;
 Wed, 11 Nov 2020 15:03:36 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nKbA=ER=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kcrer-0006bU-LV
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 15:03:37 +0000
X-Inumbo-ID: 20067034-93a5-4f23-8e31-ea0f002f5abc
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 20067034-93a5-4f23-8e31-ea0f002f5abc;
	Wed, 11 Nov 2020 15:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605107016;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=+G4UFofyIJQuFMHtvIO7Gci3X1f9UHSZ1LVC+e/3zpQ=;
  b=iRvYWBybUbwhB18fB5M4M72JC/VTk/w8ZVp1sS+OOh3jCO2ZNBbRndcu
   Q22esWVZMik5OCgpGo1ioTDVEZ7oDzG2Az3BmmMWUf8pjKX/XiTYWGuW7
   K8JsSkt6grAjFPcyeHNfCWWi+R6hgozNraKjuMK3mFcnohVtanepWN7mA
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4h6IwsyPdVDMcNBgZCEKOqENnunstA9BpifI2XHLgNhYyASY6d5ovV+c1rAfQ8MlAAdgJiJ+jt
 y1Sxlb3Q3yCcn3Y+nZ0pIlWqAF095xtvKVSXif/kY3VgcCX2SGbTwmbY8J3ZhmJPv4GecK+vT5
 QH8pkmpAmOB2f5j3KNycQxsrP8ygTETh32cgkmRedLQDKUfLj2Jf8XrdVy62bvfMhxwxX4k4P7
 9dCya7Q9Z9yQrvTB5fwd3+7qTISfeqlGVgiq+5lQ3ARfV7v/gsZwFkrcBKAyCqGNIuzrBYHLd/
 E2Q=
X-SBRS: None
X-MesageID: 30981712
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,469,1596513600"; 
   d="scan'208";a="30981712"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jyvan3vHa4UaqiObbABMYi0o4eJJxgMcsiUFG2ZSUHC83KEHcyBi04TXZjwZfuAX7nTJF82HhKLTrUKrfAazRnDecs8RVh7XUzetGdsA+Xy1n3ZK9PsGqT2UyE83cNCcY1Y0vM+Ti074qTpUbDOcgsA69VUBhrpXwevkThGLm9G9BetWXuGZtw1ytDJNSWimbm7GbCgH4f0JWfvgiOoJeE33huvP5zGiqNZqonkXgcCmczaEGJyUNjZ+jUKa1eUcE4LvSBX/o9/abPsGaLCgx62OElfBH4f91mnp6CoF42V9NHcfA6WnvF8qB0RNQIWkdsAEJuP6laxMqPnD5/8eHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXVqu6XMKSzoC832hSQGLGFgOtmCssn910dE3tCovKc=;
 b=f48dXWMII3VkkZ7XHgO5Viap5w09nZ1JF8cDA6opKNsZqLPxiTqANQUBJ4RWnVA/raUXib/lfMdma4l5K13YMFs5ojet5zcCbN/h8FHSzveJ7e/sajtQ9+nH33Et3DQ1HLi3NuU8sbamQERayvjKV4Ynj4X/WeYTgcuqJFQjmJVQMgdMXLyaEdE9bUBw0qsHD9xyfo2NpX7Xk6eVNFMsuQq0sWipQPtvQwV1GYQlzBOZHBFWW8rQ/FmWlcCO8eFYxS42J+Y/9cgMBNcqqAxKulRyZqQ2rc3igkF9zNqdp4PTztjQHMARJiwQMzNiE2M7/lT55dJxrs+12//CdD/ceA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXVqu6XMKSzoC832hSQGLGFgOtmCssn910dE3tCovKc=;
 b=hc0/GkWIArGK0DU45F3IQ04BhuiNe/1viLNQd/ToZzGAtYSBtIT4M30VvZNHi77sC8QyGSPvXd6Lorhu4nkAS1Gu4RYZUES34ArOHEUZ65ByF00JNIGUCFVfts84gsKFm7Pr+DAc6isO2BaFJTGJ+EkE3M2W9DSAXPxHqsPEcxw=
Date: Wed, 11 Nov 2020 16:03:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Oleksandr Andrushchenko <andr2000@gmail.com>, "Rahul.Singh@arm.com"
	<Rahul.Singh@arm.com>, "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
	"julien.grall@arm.com" <julien.grall@arm.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH 02/10] arm/pci: Maintain PCI assignable list
Message-ID: <20201111150310.2wo33lr3f5xrd6sj@Air-de-Roger>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-3-andr2000@gmail.com>
 <20201111135311.6jhskiss2qswm3zp@Air-de-Roger>
 <03d6a75c-075d-6c57-1d66-2514ef1d0cb8@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03d6a75c-075d-6c57-1d66-2514ef1d0cb8@epam.com>
X-ClientProxiedBy: LO2P265CA0486.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51eaec14-9e88-4f04-c1bc-08d88652ec17
X-MS-TrafficTypeDiagnostic: DM6PR03MB3673:
X-Microsoft-Antispam-PRVS: <DM6PR03MB3673D4C709F235840DB9D73F8FE80@DM6PR03MB3673.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dUPnXZq1OdZz4TovXiHKjriuSemv//DuSSf5Edqc0z6VAOqNdPzwHQXFi4Y6+VIMkeFSmd6eHbYHYSGCYBQnO9JqotrUJHoj7Pnhyxg5PWix2jw3I6FClhMQ41mz/LSEW4ehO+fam+YtUxby/JhRq7PwVkVjKSsIDPG2wOQmgQQ63GqXfaRSZ6t9nUDYP5KXbVmmSSGvI/IGynmXVXOhv1gvOjrEYHUAwpKiPo99izRIbesMsjfXdhgucadcSWhlOR+EX4m+V0nOzKQ/bjkue1KkQSpHTGIyS2bLO81Awfpu3f4QQt8pvXxqMGgBUEsr7x1jgnPGGV46d0CI2f2b7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(9686003)(1076003)(85182001)(2906002)(5660300002)(86362001)(6666004)(54906003)(66946007)(66556008)(66476007)(6496006)(956004)(7416002)(316002)(6916009)(53546011)(6486002)(8936002)(478600001)(186003)(16526019)(33716001)(8676002)(26005)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: zTKJzh3iUeWb6CLprWKXIkfd8m+0iiouCfPyf1LVjQ0oeqImY8sotPJ9okUYMYWMK+OkLp02zKJUKMFxenUjXxZSHkSQ2LsayO3AbUnaaL7Jyt8q7nXW1lTS+p3jOJA5fZLlQ4v7tnCma84HqfeoKeDkUTqAysezCRpOVMVMew2OmwmSgNcezhbqMjTrFR5dzWKsQ6eFt6UbEbg2+FxPo64xiUlbKORgKsJ5+72mphMCG/b+G01Snlvc6MZJzjTitv55jQL0BDxi3rwnGaTX2KibGKQajCCCQwByi1GCtCLxcrX4irm4vdGUdcHBe4t0LwvB0dDpH53eAVBG5A9psGo1v/NOkJD1XNaJJYAHHaNxQYvQz0L6LFdtV74JFF3rtjgaqpfVmnCRNCaEhaui3j491LZpM8gX5Gcx3+FrO2ogXkVRTKlu23TSV4kx/LMBuwP8womlJl6s7PsACUgd6ZbHKR8Mo7idBbbGdJR62TE6QDtG2vBtvsspagIRC5h2vKAhKFXvYK9LtzNNKvWN1liQhMaltw91hcAUQEr3OVd03lCEHSnpJIM/VkL3Q+43WqRGWnGGe7lGgzI08KByAqG8hrO6e5jPkkccqIr8YSrGxauUPyxMXkFygTcfDDECYjIaNgWAk6XMveAkPsfo2toxF5WauL071H038oITzwaBx4U4t/Rhz4Pq5w6hour19eD2SfvsC4E+HURbk7X10ze4A4w5hgEaBMTsIkH/9c32PMPGcddvvxXXrl57QtAME1XxRZ25tcLh+4K8kVhgWrSXl4d3vxNhNaKltMoX2V1gqqMLYEsdaSdARcpfQHysVUV5QtjIg9fQ9g7QMD0V17lWn1UJWI0aHTys+c0VbbngFKdyVw1z9oukN/HVJqRYAysRUYJrEgScehEH1ZTe7Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 51eaec14-9e88-4f04-c1bc-08d88652ec17
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 15:03:18.1485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k0Y9ED9ixZgCQc6ew62ZCKuYAWimS2FuOMSA5ydtCud8f57RfQqbxDYVQkSDpd7vuVvb3Rq6rQqholvs67XZyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3673
X-OriginatorOrg: citrix.com

On Wed, Nov 11, 2020 at 02:38:47PM +0000, Oleksandr Andrushchenko wrote:
> On 11/11/20 3:53 PM, Roger Pau Monné wrote:
> > On Mon, Nov 09, 2020 at 02:50:23PM +0200, Oleksandr Andrushchenko wrote:
> >> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>
> >> The original code depends on pciback to manage assignable device list.
> >> The functionality which is implemented by the pciback and the toolstack
> >> and which is relevant/missing/needed for ARM:
> >>
> >> 1. pciback is used as a database for assignable PCI devices, e.g. xl
> >>     pci-assignable-{add|remove|list} manipulates that list. So, whenever the
> >>     toolstack needs to know which PCI devices can be passed through it reads
> >>     that from the relevant sysfs entries of the pciback.
> >>
> >> 2. pciback is used to hold the unbound PCI devices, e.g. when passing through
> >>     a PCI device it needs to be unbound from the relevant device driver and bound
> >>     to pciback (strictly speaking it is not required that the device is bound to
> >>     pciback, but pciback is again used as a database of the passed through PCI
> >>     devices, so we can re-bind the devices back to their original drivers when
> >>     guest domain shuts down)
> >>
> >> 1. As ARM doesn't use pciback implement the above with additional sysctls:
> >>   - XEN_SYSCTL_pci_device_set_assigned
> > I don't see the point in having this sysfs, Xen already knows when a
> > device is assigned because the XEN_DOMCTL_assign_device hypercall is
> > used.
> 
> But how does the toolstack know about that? When the toolstack needs to
> 
> list/know all assigned devices it queries pciback's sysfs entries. So, with
> 
> XEN_DOMCTL_assign_device we make that knowledge available to Xen,
> 
> but there are no means for the toolstack to get it back.

But the toolstack will figure out whether a device is assigned or
not by using
XEN_SYSCTL_pci_device_get_assigned/XEN_SYSCTL_pci_device_enum_assigned?

AFAICT XEN_SYSCTL_pci_device_set_assigned tells Xen a device has been
assigned, but Xen should already know it because
XEN_DOMCTL_assign_device would have been used to assign the device?

> >
> >>   - XEN_SYSCTL_pci_device_get_assigned
> >>   - XEN_SYSCTL_pci_device_enum_assigned
> >> 2. Extend struct pci_dev to hold assignment state.
> > I'm not really found of this, the hypervisor is no place to store a
> > database like this, unless it's strictly needed.
> I do agree and it was previously discussed a bit
> >
> > IMO the right implementation here would be to split Linux pciback into
> > two different drivers:
> >
> >   - The pv-pci backend for doing passthrough to classic PV guests.
> Ok
> >   - The rest of pciback: device reset, hand-holding driver for devices
> >     to be assigned and database.
> 
> These and assigned devices list seem to be the complete set which
> 
> is needed by the toolstack on ARM. All other functionality provided by
> 
> pciback is not needed for ARM.
> 
> Jan was saying [1] that we might still use pciback as is, but simply use only
> 
> the functionality we need.
> 
> >
> > I think there must be something similar in KVM that performs the tasks
> > of my last point, maybe we could piggyback on it?
> I promised to look at it. I owe this
> >
> > If we want to go the route proposed by this patch, ie: Xen performing
> > the functions of pciback you would also have to move the PCI reset
> > code to Xen, so that you can fully manage the PCI devices from Xen.
> In case of dom0less this would be the case: no pciback, no Domain-0

But for dom0less there's no need for any database of assignable
devices, nor the need to perform pci device resets, as it's all
assigned at boot time and then never modified?

Roger.

