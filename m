Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4156318A76
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 13:27:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83896.157112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAB47-0007wR-T9; Thu, 11 Feb 2021 12:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83896.157112; Thu, 11 Feb 2021 12:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAB47-0007w2-Pm; Thu, 11 Feb 2021 12:27:23 +0000
Received: by outflank-mailman (input) for mailman id 83896;
 Thu, 11 Feb 2021 12:27:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=szQa=HN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lAB46-0007vx-3D
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 12:27:22 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a67390c-5cf2-4ae3-9d25-89fa1803bd68;
 Thu, 11 Feb 2021 12:27:20 +0000 (UTC)
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
X-Inumbo-ID: 2a67390c-5cf2-4ae3-9d25-89fa1803bd68
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613046440;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=sr/L0JWRcyvOCP13ACdU9OhXOmz01m6V0otCTCOEMhI=;
  b=WcfO+X8NkdjsZxysTwN041u2x+5WqynS4PSfGZbvNZcPJcXfQljeJEF0
   ERLsdjOZabpLFb4VDhK5GgHyuoxIo7WJ4ZcZN4BX7hTkbWPI4jWA6Z5KJ
   zPdDtnnThinr/TYeY8C647VMgcU0N22Yz/qpD/6bNiuWjv8iy+NAMZAf8
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vXEJ/Jvf5pP9gR8/j2k7ODtnYVvXi+zxKA+VVas4xga3R8JYN2V9hZBSrCzr2Fb4ky/qFy9hZ4
 4C0/lytakRPhDXcV6RyZMobNMe40UqCWhT0n/wybg7IKzsmRJN486H1oGtFutepbHrdFV8EUyT
 rW2poiyQvn+tjTrDiT+P7tb4kNET/QAJSgXD8gPg8lwLxTqipH5bKa2jDriEfHY10FvL/+OeVi
 arBs/kWCcEK5yAdnZKxr6a6V2qieM2c+k/sFSFiwpcgFBnBnfYXF1rFMSbVngsAavPCFGK/+oJ
 yj4=
X-SBRS: 5.2
X-MesageID: 37061421
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,170,1610427600"; 
   d="scan'208";a="37061421"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MbiI+hU53sQIfKgSGQdlGQmBT1dFP4hoSXCAheHf6vKtURnKUGGiO2ywuWmHOL9QpvM2Qf2dTYzCxCvs7y9dC35QAakEOvx4EmvvZt2NWadUqX6rL7nMULEPWYK1tU8KZA/viBOUkm+X/CQmXPIVKjhVDI6hR124Eg7qu6ZysNUVu1ccWLZAeP4+5RB9cuhF6enAI527HWwHf9jni77+gq/IDtVqlASjfVnYd+iqEM4UlS3dZLjFTSu88JVzvMORfVH7ANn7mYypVGoQFCm9nTAR2u+u8qCiqh3YjJPlZmstAbq3PdO/mh6kMRelY5lMXEN6RgduKpf8H7GNgGLSDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWzS16qLjoZIgMyICLB15QDt/8zY+dmYjPfIyRlMRG0=;
 b=PHQfbbmYri3pXydIAvbFhjiALyPYCnZYIN3X0RfAzH2SnC3tN9dXGY09gT7ichJNvpMxG0S0OyixXrthxZdedxT0ahhPZuu1dLHECONa/xQNskffrUk6ksyVYv8AG/yIkuTJ5Hx83QdDjVP8ijGNAvGj2PHBrrD54Ep8axt/obodai8dx2vHuH6mKR/KqpA/khUUB6Dtz0b464erws8OvlRdV+pxYXubZ/n3zH36YGEXjO4NrrOQgzXd4o/smRyHJETIeuHclOMckpGGY2KmZA37++Ni9lBT55lDPg+KhaNE+kWVyne4gpKbpsZ7JWPp9hCEJyf6AUwEcjJgnhyEUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWzS16qLjoZIgMyICLB15QDt/8zY+dmYjPfIyRlMRG0=;
 b=JABZmoH/QPft/vN1BiQPws5wGc2fcp63VpFNtkIa2ZrM6tmNEHX4WmdhDa2nd4edMeFvTXHApG8XHRQgAJEKJQk0J3r0tFp0csLumkIelxWqNhyPX3tNT1XMBrvnF7ZB3rmO9el09CEG7G3pNdU+a0rGCLarK5c4v4Wpi5URlxo=
Date: Thu, 11 Feb 2021 13:27:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Kevin Tian <kevin.tian@intel.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Julien
 Grall" <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH] VMX: use a single, global APIC access page
Message-ID: <YCUiniCn+oT9CFwC@Air-de-Roger>
References: <1b6a411b-84e7-bfb1-647e-511a13df838c@suse.com>
 <YCTuq5b130PR6G35@Air-de-Roger>
 <7abc515b-d652-3d39-6038-99966deafdf8@suse.com>
 <YCUSDSYpS5X+AZco@Air-de-Roger>
 <547b40f2-3b7b-10cb-30f6-9445c784eb0b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <547b40f2-3b7b-10cb-30f6-9445c784eb0b@suse.com>
X-ClientProxiedBy: MRXP264CA0040.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a21749b-8a4d-4984-404f-08d8ce885e69
X-MS-TrafficTypeDiagnostic: DM6PR03MB5324:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5324AED8ACF8D3FDEF1AE4EE8F8C9@DM6PR03MB5324.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jij90P4dt4NrHVqusVOuwUj/KO4WPa1vSHEi/5i911mJfq+mL8zzIjBKHGqeJIYtc1G/uHeLEyIRW30WAp9PSSE2Ju6BsZbxFkP1utFLjesJ44mf4+dUlshPyO8rGSTQIUO4ouJNI1Shc29plI4eRBZugT7kGTMVZUvP9FDO5Iyw9oDLRPWdUkeWR5gkbVOKGmgJwu1MsOgJ92EuNMtT0mowjaJEczzf64+878zh6hretOKdLKm4uJ0vvUAevw9EHdIzY4bA+y4tMSwbm795nOnaXGjzEJ9MXM81KDEaC3ky6spnPHXo2RdubWQbD2yoGojQrhIZ0hwnzVkQzqTDRT07ZkCU3zLuo/v5MASj/3uWWB0Q9ZEsh2gb3L+fjsGjcoUX3G9q+80Rr3Og71vIXkoRo5b42rh8xEH6HBBIstjsYyZJOkfdSRb5gT/ItkScAaeTCvhH3eEjBFaCVGvzgB+pQLjjfl3ksIKoTgsZz5GfPCxbfWjS6VIKh8ZDf8/v0rUMVYVONNjuix/Z2QZgGOwg7mF5eMf0AR+VdQygFHJo5kSNHI5mMc0fMpJBI4Hi
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(366004)(136003)(346002)(376002)(39860400002)(66476007)(53546011)(66556008)(8676002)(4326008)(6666004)(26005)(110136005)(478600001)(6486002)(83380400001)(54906003)(8936002)(6496006)(85182001)(33716001)(2906002)(66946007)(5660300002)(16526019)(186003)(9686003)(316002)(956004)(86362001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Tm8rOVcvVXg2bXptcHYyUVZScWpFam1ScGlqNHdaNVROZzJPSGF1d2I5bXY1?=
 =?utf-8?B?OTNXVGdzZjJwNjVkYmdWZkZENThoQ0dCNUxwZkdnT3FFVnkrZDdmWnV6SkZX?=
 =?utf-8?B?bFA1YzVmdkFHc3VUM3BPaHEyM3Rqb0ZWcThUY3FiNFdESWplajhrdmNHVThZ?=
 =?utf-8?B?YkVKcnhRclJCNlpvb01Ec1BiVXVFb1VqMXgzcEZuNnJZVk9iSW9TdUVjYWdI?=
 =?utf-8?B?bERpU3NsM2xTMTd6NzhmNXcvM1U0dTErME02WTc1REVVZDNJUUxKbXdjV2Jp?=
 =?utf-8?B?RzFielY1UTJ5MUZ2aG5BWFJkSXRMSlY0b2hacDZZU1lvUkhCL3dDODFnQXdF?=
 =?utf-8?B?L01VN0ZVQ2Y3MFQ4VkdVZnJHb3hta3U2aFJVSVc4ZGIyWFBBNWtPQXdZNVdm?=
 =?utf-8?B?Y3FSb1VCOHNWRm5pTUFqZ1lqSUcralg5aU1RMFRFL1FndGQ3cVBSWnJuOGJ5?=
 =?utf-8?B?RDN4aGpFRjB0NTk5T1ZQdER3VHU0bm1xc3B3OG5tK3lkLzNPRWNJSm84M3ls?=
 =?utf-8?B?UXR0MC91TWZDYU9FYWpMTGEydVpWQlVrUytEV1d3ZVUvNldrTHVHS3RKNDl2?=
 =?utf-8?B?bHN5cExOcUlIQm13S1RqU1JoVXlsT0JHS0U4Uk51bzY1U0c4VE11K2tTeVJH?=
 =?utf-8?B?VmU4WXFWQ3QxYzNVZ0dIUkpRNHFWcllvRElTZFArRlcyODJkelZFMXVMNFk2?=
 =?utf-8?B?d1Y0Wkh3ZmEveFNyN3dKMFQvRitBQ0RLR0RudzFkdDNOUTY1VklwQ25xTy9p?=
 =?utf-8?B?Tjk1UzZDcVdCdnNTUFZVUHRLNzdzeURJYktYT1RCTjRkOUZ1VHp5c0N5M0pZ?=
 =?utf-8?B?dHN3WjFxSWlNRFZIZERocEd2bHZJNnFxcTJIaDRrbU1vU3d6Zm9xTW1wQW5k?=
 =?utf-8?B?RlhvZ3hMUFB6ZEdlc2lLVkJVemliT1pHeTRjQlBIT0xldXJNNjIrcWN1aHNq?=
 =?utf-8?B?SHVzU2FIZUlqOG43NlpUTFRjMFNzazl5Y1Q1SS9OT00rK2VnUkh0VEwvT3RM?=
 =?utf-8?B?NlIwaVJmMFJWcWcrM2paZjNjMWl4aWpyYUIyVE4xYXNBcWNFWFBLR2FiZTR3?=
 =?utf-8?B?UTY0QjdpQUdLeXpMUGtzRmVwVUR5aDJUWG5NRC9hbHdVb002YUhob3lENkpm?=
 =?utf-8?B?RzkxZWtCZzBtMXRLRjBDd1dINzczejRZQzdDK0ZWampIUERxaGJIOEdiazUr?=
 =?utf-8?B?ZVRHTHM2OTBvYjZuaytwMURDSW42WmVXQ3ptWWpJQnNma3RWS3dKcUgyazdi?=
 =?utf-8?B?UHQyYnNGMmc1d1pmOGhMdVVyUTlwalNuQWRBTWp2THFFKzlKWTNoa25CQkJM?=
 =?utf-8?B?RXNVYTlpQUc3UHIwdDRMRUJnWlFYNmtCRS9qK015RlRQemtzQWlqODBqclcx?=
 =?utf-8?B?UnVPYXRRTUJ1am9PWDNDeVUwMXFYVytYYU1lQytZbU5HeEQ4Y2FOVGVMMHVp?=
 =?utf-8?B?d1BuYS9obElWMTBnOFkrMWk5WlZKcWExdi9ZOW92VzJkaUZEcndpZVk4WW1r?=
 =?utf-8?B?WFF0WjRQU1k0Q0dRNUxoOGRDUFBMeEdWc2QyQVYvK29NeXdLL2ppTnVXTEhO?=
 =?utf-8?B?Q2h5cXV1MzFoVnZDNFltK043Qk5UL252ckxibzdvM2twMGZmaDdKL3ZLL2FS?=
 =?utf-8?B?b1FkT3V5dFBXYTZXWlRFMFRCWmRPd3BXYmJTaHQvbFRjMTlRckxWY2RvbTZv?=
 =?utf-8?B?YncvQ2xBTVdhS0llajFLYlpmL0k0WnR6bVdXWktlTExSaWs2RUhSTzFIZnpE?=
 =?utf-8?Q?UpWg0lvyQCXk3l1w8OooHbL0t0Yrfv/A7YXIu5M?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a21749b-8a4d-4984-404f-08d8ce885e69
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 12:27:17.0144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lRaLWqQIGhndeWKtzjQBdoaHyXDt55ea8nAfHZyL/nglf+US0sOmxgrpsul+0p4HJ4/ekxNJq7x9bMezZfUmhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5324
X-OriginatorOrg: citrix.com

On Thu, Feb 11, 2021 at 12:22:41PM +0100, Jan Beulich wrote:
> On 11.02.2021 12:16, Roger Pau Monné wrote:
> > On Thu, Feb 11, 2021 at 11:36:59AM +0100, Jan Beulich wrote:
> >> On 11.02.2021 09:45, Roger Pau Monné wrote:
> >>> On Wed, Feb 10, 2021 at 05:48:26PM +0100, Jan Beulich wrote:
> >>>> --- a/xen/include/asm-x86/p2m.h
> >>>> +++ b/xen/include/asm-x86/p2m.h
> >>>> @@ -935,6 +935,9 @@ static inline unsigned int p2m_get_iommu
> >>>>          flags = IOMMUF_readable;
> >>>>          if ( !rangeset_contains_singleton(mmio_ro_ranges, mfn_x(mfn)) )
> >>>>              flags |= IOMMUF_writable;
> >>>> +        /* VMX'es APIC access page is global and hence has no owner. */
> >>>> +        if ( mfn_valid(mfn) && !page_get_owner(mfn_to_page(mfn)) )
> >>>> +            flags = 0;
> >>>
> >>> Is it fine to have this page accessible to devices if the page tables
> >>> are shared between the CPU and the IOMMU?
> >>
> >> No, it's not, but what do you do? As said elsewhere, devices
> >> gaining more access than is helpful is the price we pay for
> >> being able to share page tables. But ...
> > 
> > I'm concerned about allowing devices to write to this shared page, as
> > could be used as an unintended way to exchange information between
> > domains?
> 
> Well, such an abuse would be possible, but it wouldn't be part
> of an ABI and hence could break at any time. Similarly I
> wouldn't consider it an information leak if a guest abused
> this.

Hm, I'm kind of worried about having such shared page accessible to
guests. Could Intel confirm whether pages in the 0xFEExxxxx range are
accessible to devices in any way when using IOMMU shared page
tables?

> >>> Is it possible for devices to write to it?
> >>
> >> ... thinking about it - they would be able to access it only
> >> when interrupt remapping is off. Otherwise the entire range
> >> 0xFEExxxxx gets treated differently altogether by the IOMMU,
> > 
> > Now that I think of it, the range 0xFEExxxxx must always be special
> > handled for device accesses, regardless of whether interrupt remapping
> > is enabled or not, or else they won't be capable of delivering MSI
> > messages?
> 
> I don't think I know how exactly chipsets handle MSI in this
> case, but yes, presumably these accesses need to be routed a
> different path even in that case.
> 
> > So I assume that whatever gets mapped in the IOMMU pages tables at
> > 0xFEExxxxx simply gets ignored?
> 
> This would be the implication, aiui.
> 
> > Or else mapping the lapic access page when using shared page tables
> > would have prevented CPU#0 from receiving MSI messages.
> 
> I guess I don't understand this part. In particular I see
> nothing CPU#0 specific here.

Well, the default APIC address is 0xfee00000 which matches the MSI
doorbell for APIC ID 0. APIC ID 1 would instead use 0xfee01000 and
thus the APIC access page mapping won't shadow it anyway.

Thanks, Roger.

