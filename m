Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 426C331654D
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 12:35:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83567.155800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9nm0-0002Ec-3P; Wed, 10 Feb 2021 11:35:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83567.155800; Wed, 10 Feb 2021 11:35:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9nlz-0002ED-W9; Wed, 10 Feb 2021 11:35:07 +0000
Received: by outflank-mailman (input) for mailman id 83567;
 Wed, 10 Feb 2021 11:35:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/zh=HM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l9nly-0002E8-I8
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 11:35:06 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3a92d67-3b54-4a1b-979c-b609e0de3677;
 Wed, 10 Feb 2021 11:35:05 +0000 (UTC)
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
X-Inumbo-ID: d3a92d67-3b54-4a1b-979c-b609e0de3677
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612956905;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=cPSsm1PTi7ikS4ZFh1cZo1XySe6RyeCug/hia3cTN3s=;
  b=KC5weaiFWVaRsjgwQFQLw/cvuM/9/j7jCOP0wTCoHbN6R0iw/Z6NtePf
   Ro1r5OpONSYqHLI4vFB3BXQEl70vsS8Sfr8OuvsN4iQRXcQS99RPtsHlu
   l9rn3dXA0FmHFurDk3HBgKVlUfQi2xX5cPZtNaPmH4IZGiu2kXWHoHUBP
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: y4W28styJ7zUg9W1wrkYS9Wu7IQwFRs3hDEp6qddv3y6P+nWQC/exe1e3UAX8mRbpnNMWt9g5z
 e2xWzb8Ijoq2mKDiy6MxO1B1gXomOG4gjfh1hUcoCmtCikVSaGt0XjqcPwyPqMhNBPRXX+v9IB
 L/pAQA5rffTBTDAhdRMcEwYNqwumDuhc4dgs0HnYNTqsqy8Sz/7yPB6Yoocl3NRvJ3ELHbvj26
 MJBHtXpz17GG8sVqtbQfCm4RTBrkd3VJByStcXxwqsQ/Fm5B41GHQZVeNym62sdkOD7H5/HitV
 u78=
X-SBRS: 5.2
X-MesageID: 38299202
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,168,1610427600"; 
   d="scan'208";a="38299202"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KxdPddOXRJllKSyhL1lYZHd4PqYTR0sojJD0FC5Z61hmvMyjkn+VjkT0Dds7Q1XoqD8Zs2pkFDh/BujaOic/nEcDofV1FpVze0wf7m6Neo9DB8wyLjJWazRDQiH1bo9EzGePRPZ+Zry6HM1cWH/nHkA1Eez9lnnnGOOs3BN/spgDe7Dgj46m5UIMCfAzUKTSTEoZAUbdUcePMraPF46KrKXCgLpkTp0sKSho1AVB2TRIngWfX/ElvA2r24SfcUYGvQ5RcgTLP7sxKZpqVnqUCCwbtqPOmyM/emKcEZNEfcaNvBD2byCAG1ZY8/2F8CoHIXfKU6Po8H0KotwEoPbUMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBPUQwNO59+m/qq75DvFxWl+Mqnh1M7vO6RzVX0hR/Y=;
 b=HnM3L0tCJMEiwxEtI4ivUjbQKpUzow6nZFIjhh6i8qu/6s4LXxei6aePWahveZCX3+HkvCeUGNB4vl7roXN25NyYeLgbBhLUul+CjngmsbqyFeRcuSYFWU57Hyj1ZGpPSC4NweD8wiOUSVK1mzhGSAObWycKtkBvpBIhmh3ShkF1NlL2aqrVbPsUqx8q6x+HTBvQAOV7jXVDTT/nrSP8SmJbqGNguCXhRPAesEgCPIG0GS3ifPdWdbS6c0vBh3iTmjrB9aNKE1hHab6t0GpsVGbAfWNgy+vT3+INctl7vcNfUJ3vZlp8m2IjeiU2MWCiOZRpO5CcaOErRHQfeJHbUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBPUQwNO59+m/qq75DvFxWl+Mqnh1M7vO6RzVX0hR/Y=;
 b=pinDsuYyAEeuZNB3rJuIyiyFCHWHNJf+d4kVPZHE2yEmfVJN+7SkMFpKRz5ImnQInUGMswMEr6qKwtbiH8YgvJHzdYc59zExaSZaUxxPk86p0vCCbCwAWdzJdOx7VS5AqmU04ZMW+6I8F1hkyOpPZKYmUahC33krm2VFzKqDqv0=
Date: Wed, 10 Feb 2021 12:34:41 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, <hongyxia@amazon.co.uk>,
	<iwj@xenproject.org>, Julien Grall <jgrall@amazon.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: Re: [for-4.15][PATCH v2 1/5] xen/x86: p2m: Don't map the special
 pages in the IOMMU page-tables
Message-ID: <YCPE0byWKlf/uOFT@Air-de-Roger>
References: <20210209152816.15792-1-julien@xen.org>
 <20210209152816.15792-2-julien@xen.org> <YCOZbNly7YCSNtHY@Air-de-Roger>
 <5bf0a2de-3f0e-8860-7bc7-f667437aa3a7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5bf0a2de-3f0e-8860-7bc7-f667437aa3a7@suse.com>
X-ClientProxiedBy: MR2P264CA0055.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9836e9c1-64af-4103-c58c-08d8cdb7df0e
X-MS-TrafficTypeDiagnostic: DM6PR03MB5067:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB50675A8E219EA9AC5289F2608F8D9@DM6PR03MB5067.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mX6PEM9RkZxsZO8SNK+qJUX2kcoA8ctSiKBaJurlNM2W0OMfa3eRXpjmkGmQQ560JI5uDT54Pd+LjGHoBJN0Q1MM7ejV8FO4O9U31ncNW6adE7A4hJiTWkLGIqLwCNuELsJQhtH9cU+Zu6B/Aby8egJ0f6rR2pjJo92gHC4P7TufUR7aWstsdqaqIdDYA/LwBkFWJ2CKjMn/2GrUJ+SA3OnCLYqO2axAMv3Ohphtrjpnz8pD+82DfwDcbf2g04NGMwm/5Bguj8qF4K+w/RpX/N/uxPBmOuXaj9rqIF9szGJOuBYEtL7GPYAnpSGTA0zTv9KC+zM2/wo4u3pj2Xd26DIJPdim/RfobaQeyPzMZpHX3BbG9BzNOrEp6umDF3xkshtlQI+sZ4co69nEK5nPn2k4LYAmbSyyCOKqSvID7XRVsuSOuJ+fcYw77Z06ixSBtW4TPd8fHn3HHWG0fIMR8Vl0+Af8o0v96Sou5xyX4FHaLVTQ+niNT8GCSV0zSzgJZr+70cgK1475xo+VNwmYsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(136003)(376002)(346002)(39860400002)(396003)(956004)(53546011)(186003)(16526019)(6916009)(83380400001)(478600001)(33716001)(26005)(4326008)(2906002)(9686003)(6496006)(5660300002)(6486002)(54906003)(316002)(66556008)(66476007)(8936002)(66946007)(8676002)(85182001)(86362001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R2t5TmRHVnpHcFNxY2c2M05IK01YbXNxTVd0TGhNU1JkWWl6ZWx4Rk1RQTNR?=
 =?utf-8?B?QWNMQU50MlczMUswUHBLaU96ekJZRnB6cy9EaWt5bmFqc2FXSDArKzVPM0pP?=
 =?utf-8?B?czJXcTdmd0RTbEpodFlwUEZZb0V6RDNjcGNxbVVSSDgwMDBGME9XRjVLTWJn?=
 =?utf-8?B?YlArQTlPcjRwTmt4YXFjZWpiRlJ4bmd3U3JUSXA2SVM5WklVTmZOL1VHeUNl?=
 =?utf-8?B?Vm10QVFJMVFjWjBFUGpYSnZNQ1hKVytzY1VYQk96cXR1K2hlUzRhNERFM1o2?=
 =?utf-8?B?K0pvR1YyZEpQQUMyMlZWWnlJOUx1anhBdGYrU1kzRmRWY3lqQXdQNFdQbm9j?=
 =?utf-8?B?b29vTHFSNCtXc3NJa2cxTzJUdzlrQzQyazVoSXNlSVlhVU1wbjdVbWpMWHVy?=
 =?utf-8?B?dlhiSnZPcEY0RVIyU2E1cDhhcEFIU0JrS3l5Nm40Ujd0UzNwbGtXV1VxNGFw?=
 =?utf-8?B?TmpSWDZHUitaNGdHaFF0cm1RZnJaS0Q5bnpKWEd1djNoVTJ6QWpBbU1mNmRn?=
 =?utf-8?B?SmR0QmdRemcwMjd4U2ROOGpHbDVST0NpN1A1K1Nhb2tsdDJRbERPOVIwaHVS?=
 =?utf-8?B?ZzNVQlE2VWVrZ3V4R1pBM1o3NUpnTDVXQmV4NWFsRE56d0Y5SWxXVG42UCty?=
 =?utf-8?B?VThXUWdMME50Mk5mR1hkYkNud0xIQTd5L1B2eSt5WTRqR2FkeU91VkRITUFY?=
 =?utf-8?B?ZmtxbHlUWFg3aVZLK2hMQ24xclZVdWx0WWcySk5VYjJNbFhSOWZ5elN6emZj?=
 =?utf-8?B?ZkV5Qm4vejExMnFDN0N6WnBoV2V2cWhURTMrYXZOMlJTeTVQU2dCN2c4KzE4?=
 =?utf-8?B?OGU1eVY1WTI0bW8zUnZZVWppK2w3VjBhTmpYclRMNXJHc2dYYUQ5YUhQMHdW?=
 =?utf-8?B?cGd0R1J6aXRudnFmOU8xbFk3WWdENm5hTVRmeE9BcEMzZHkxNjFhN21JK0F6?=
 =?utf-8?B?UHFOS2RaVU9GcmV4S2lFU2RISmtGemhZbW0wVFZnZDdRZ1ZrN2ZyZkF3TkNJ?=
 =?utf-8?B?OEZrbGxHTWRzRmFNSG9EWkxid2Z5VGJlNVJ4RXRzUHFlMVBNWHdiakpXWE9U?=
 =?utf-8?B?THgyNFdydkN0YTg1bFBjYVBPakIzbXVPT0Z0OU5ZdDg0U1c5SnlWNXc0dnlU?=
 =?utf-8?B?Y0g1LzRQa2g1ZzZna0NjK0JKWlN4SDhDaGd6dGdkOTJIYW04V1lkYWI5WWN2?=
 =?utf-8?B?ckxuWUhWelB0d2JGWVBzZ1RWczhTVXpRYlVpcmJJLzFVR1FMUm5EQkl5MUxz?=
 =?utf-8?B?VDVSb01MRll3T2d1bXl5Y05oQWhWUXNJYURhVmhQS2xYaFh2REgzSmVFSCtR?=
 =?utf-8?B?b25SUmExSU9ZUWszeSthNXQrWWxFUFY3OTZpRzVONm5Mem9CNUR3enVkclQ2?=
 =?utf-8?B?SHVpUXNMc3ZVVkNGUjd0Y1hid29oWjdUZ0pBck96NERWQWxGd1p5MFVGV3BN?=
 =?utf-8?B?NlBXSVk3cVNXT09mSHlyOVJYZEMrakJ1MUk4aXBNTmJKbEVZWkM4OXM0ZXRm?=
 =?utf-8?B?MENwSGI2TXQ4VTR6U1BManp4YTQ2ajNQbElyNVg0aFRYZWNMdnlMb011SmNs?=
 =?utf-8?B?Q1dqSk9CamRyKys2Y2lKRUFYZzFGVURCUFNOT2lNMVNZYll0a0FTcDFFTjFI?=
 =?utf-8?B?bWhuNlpqOVBkSnAxd3paVktEZitXU0s3K05NRzAyblZERTNIMmhmZWlVLys1?=
 =?utf-8?B?djkrUGhVZERGVGlBTVkyYk9FcElMY3BTZTg4TWVwRExUZVQzOWRTRi9mYU00?=
 =?utf-8?B?WjFTeXE1UktncTBKOHdBU2JpazVab0trb2pKMi9zVmMya05SWHZEd0RhVVds?=
 =?utf-8?B?OHJ6TlNQdHU1YVlQOUpmZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9836e9c1-64af-4103-c58c-08d8cdb7df0e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 11:34:48.0211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7zrYFQkmMQo9jDt9yyFWaYguGTJPgbr2RvZKMdplzQah9TdjpS2JstlXy27UJYlU6UpqrLefaW1FWwhIkKPYNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5067
X-OriginatorOrg: citrix.com

On Wed, Feb 10, 2021 at 12:10:09PM +0100, Jan Beulich wrote:
> On 10.02.2021 09:29, Roger Pau Monné wrote:
> > On Tue, Feb 09, 2021 at 03:28:12PM +0000, Julien Grall wrote:
> >> From: Julien Grall <jgrall@amazon.com>
> >>
> >> Currently, the IOMMU page-tables will be populated early in the domain
> >> creation if the hardware is able to virtualize the local APIC. However,
> >> the IOMMU page tables will not be freed during early failure and will
> >> result to a leak.
> >>
> >> An assigned device should not need to DMA into the vLAPIC page, so we
> >> can avoid to map the page in the IOMMU page-tables.
> >>
> >> This statement is also true for any special pages (the vLAPIC page is
> >> one of them). So to take the opportunity to prevent the mapping for all
> >> of them.
> > 
> > Hm, OK, while I assume it's likely for special pages to not be target
> > of DMA operations, it's not easy to spot what are special pages.
> > 
> >> Note that:
> >>     - This is matching the existing behavior with PV guest
> > 
> > You might make HVM guests not sharing page-tables 'match' PV
> > behavior, but you are making behavior between HVM guests themselves
> > diverge.
> > 
> > 
> >>     - This doesn't change the behavior when the P2M is shared with the
> >>     IOMMU. IOW, the special pages will still be accessibled by the
> >>     device.
> > 
> > I have to admit I don't like this part at all. Having diverging device
> > mappings depending on whether the page tables are shared or not is
> > bad IMO, as there might be subtle bugs affecting one of the two
> > modes.
> 
> This is one way to look at things, yes. But if you take the
> other perspective that special pages shouldn't be
> IOMMU-mapped, then the divergence is the price to pay for
> being able to share pages (and it's not Julien introducing
> bad behavior here).

Since when sharing we have no option but to make whatever is
accessible to the CPU also available to devices, it would seem
reasonable to also do it when not sharing.

> Additionally it may be possible to utilize the divergence to
> our advantage: If one way of setting up things works and the
> other doesn't, we have a reasonable clue where to look. In
> fact the aspect above may, together with possible future
> findings, end up being a reason to not default to or even
> disallow (like for AMD) page table sharing.

I think such approach is risky: we don't likely test VT-d without
sharing that much (or at all?), now that IOMMUs support the same page
sizes as EPT, hence it's likely for bugs to go unnoticed.

> > I get the feeling this is just papering over an existing issue instead
> > of actually fixing it: IOMMU page tables need to be properly freed
> > during early failure.
> 
> I take a different perspective: IOMMU page tables shouldn't
> get created (yet) at all in the course of
> XEN_DOMCTL_createdomain - this op is supposed to produce an
> empty container for a VM.

The same would apply for CPU page-tables then, yet they seem to be
created and populating them (ie: adding the lapic access page) doesn't
leak such entries, which points at an asymmetry. Either we setup both
tables and handle freeing them properly, or we set none of them.

Roger.

