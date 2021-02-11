Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E827318939
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 12:17:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83824.156956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA9xk-0008TU-RX; Thu, 11 Feb 2021 11:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83824.156956; Thu, 11 Feb 2021 11:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA9xk-0008T5-NM; Thu, 11 Feb 2021 11:16:44 +0000
Received: by outflank-mailman (input) for mailman id 83824;
 Thu, 11 Feb 2021 11:16:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=szQa=HN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lA9xj-0008T0-9n
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 11:16:43 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29fb4284-ce13-470b-82bd-2c8e8a3d203b;
 Thu, 11 Feb 2021 11:16:42 +0000 (UTC)
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
X-Inumbo-ID: 29fb4284-ce13-470b-82bd-2c8e8a3d203b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613042202;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=QfSO8XJFp/gqAwCpZEx6So+GBHispVg2IZNXOOHeBu4=;
  b=Rh08ONvQhPIpBD51eLG82AB70Qir3ymUlVHZweBDMx81ZbR0XKiTBNnm
   3aU6guf7rK2+RXRzt2ZrQ/La6T03Ua2zZH2xhx+ddpwjW1TTA5V/rRtRe
   mJRWsBLn75lOZZcc/FLhNzI2X0Zp9QFVYmxjNbCDrFnx61Sw8jjthlCOG
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VLeeqBu2yZQC9vSHLMVfn3QSXhyb7EkZADI7TJ+IrP17SUOT4rt/fBzj/erD6S7mupmajIyKNr
 XovETQ32KM4x7YTuNTss/oCyvTwt6SUxmCB35TDejpv0V1YsgLYOcj7jGuwHhyBLkQa+yOHaYP
 VO9Ekm9bNlnvKwx/wVI9opiK8RAsV2vi09bBK8F7Ne+8Xv/yi1SWbgEWtGDLFWiqYyy0oH37RE
 6fxx4COvFfw/uFZENlGRzrlhJNLk83iZsFFJ3tHDWd2aIxn38p/HnWDlkpU2EbnafTy0R5UsvT
 //s=
X-SBRS: 5.2
X-MesageID: 38387673
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,170,1610427600"; 
   d="scan'208";a="38387673"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ka0JUrxY9VPC0qjTWalL9FWewvVAI+noiDNmVP0PugNXiW5eR58l2SHc3GtEkMbBKNzm5j+WwNbry+dQmIhw2wI1H7X1+bATnGQ/sQJoNdw+wLGhjPpIBtFmKoYCs2zCMbXoTaFsIuwql7ISXiWN2m+KhSc3qzpWk1aGNwsqz7whwZn8gh/74J6Hzal7Oow/72e4LWyE18ftKe9dZoEC5d95FORjuU+Ny5+3MkzhaT3gtrFG6ReA9mM1OwCxawwsZ3VsFXPfcU3J3hnFhwWL6bW4uRz0V0dqXuhZMLVc25AVTxpYko60G2Y0xPdIkR40scWl+ZJy6v9FmvmGo2UbgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tW8yrBgPPNcCOp7Oxg8mDF0D1A6IN1cdlEKzp2AIv0=;
 b=C/t9hnV3Ravgtu55iwVxPP133NzkCiOE4kXnvgshsnp4sR9Nx63p9HBQgSWM+f9EhqYf+MX/HHPHTLDNxzOiJ8/3XexGLF+YoPtkIhIi8Czo9KwFezrkuQsj/DeaEBSGBLScWWLQ7Fmbo0+ThxCQnTpMCFN116+CLMeY7zt9gUjnvSdLHBTWpnk6bNJ0IuSZo0kqeVeiQJNi33fTTaa+PafNwZDgtbf+WGGSLAmhYZ9c4LJDeVZs/Q1XQqYxlsXRCPgSkOlmQrJ/vprX0khfOiNpkz8zp7WBUa3kHFcBv8Js8E+iBBPmUswYb7ntrvc9yx+8y/6ajOyRUvUb8V0S2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tW8yrBgPPNcCOp7Oxg8mDF0D1A6IN1cdlEKzp2AIv0=;
 b=xP2KqeLZW01iYhAQkqAL7ZJEKbeZeB+0IyaLD9qQiFtwXR7NVvAvARx1kUBqdTWwvo2GtJ4hmpm5R1gKO+W2L5edBrpemIxp6kpV5P9QrVj0vhlUK4pz3+LPBH+TimtTu/qxBARALYWB9bwwqUeOL5SQ6evFKVcsAFNLh2Iboqw=
Date: Thu, 11 Feb 2021 12:16:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Kevin
 Tian" <kevin.tian@intel.com>, Julien Grall <julien@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] VMX: use a single, global APIC access page
Message-ID: <YCUSDSYpS5X+AZco@Air-de-Roger>
References: <1b6a411b-84e7-bfb1-647e-511a13df838c@suse.com>
 <YCTuq5b130PR6G35@Air-de-Roger>
 <7abc515b-d652-3d39-6038-99966deafdf8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7abc515b-d652-3d39-6038-99966deafdf8@suse.com>
X-ClientProxiedBy: MR2P264CA0098.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13afd357-f49a-4dad-9f29-08d8ce7e7e58
X-MS-TrafficTypeDiagnostic: DM6PR03MB4298:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4298DFDD894B1BF4F3278D828F8C9@DM6PR03MB4298.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2PojE+xeOpcS4CbV6JrnFrMEXqUSFZklGxcWkjAoZjLVFZnMNJcmXagyxHDEeFFtxjet2KmzRt2jDtHqzW1M/knX38szJwZZT9grsQgzsIOv9SLMvthxbk6y7df8xauJtHmWezHJsxADFcllVjtvOKo558JuzTAWAwuFb4FdcRFevjHEPsE9+emdSUXMksrxRr1Zm7L7Cxr7dYiaujTTlYo45H3lRBw/h4gAAwiOYI0M1+RmlsiL8yStVlcUNncgz4B2MXuPQ9GUWpbUOYc7IjnOMcWHx69uq1v4c1ZsOTAZFPnkybvanZA5/U/CNSkiYOYlZnq9HTjiyR1oZl3UpMg0mvHyyDquEhOoqWJ+ErBlNME4ypop+87n9YfAjRx6fu4R9BczlUP5ft2fmxtYJSx2IVRMB2dJkX8B9fF/6r+qQnRcrn+W6fWqzE+hc0rAQ4NLuzQhAmhyIqMQ90hqHXzeT21M77M352tpShBQXC+SfThxjn9FTgAVJWEZRa5c/QwxkrrQA3EEpp1LkgwZxuIfD1ezwa5CRP2+IS9NMWbJWPwl8TpYZ58MDG/t15a7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(346002)(136003)(366004)(39860400002)(376002)(26005)(53546011)(8676002)(2906002)(316002)(66476007)(66556008)(16526019)(6486002)(66946007)(186003)(8936002)(4326008)(83380400001)(54906003)(6916009)(956004)(478600001)(9686003)(5660300002)(6496006)(85182001)(86362001)(33716001)(6666004)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UzJSNWpsc0h2K3lGR2trazJxOXRYWEN2eFE3cVNGRndLUVJQSk9GTEM1SGt4?=
 =?utf-8?B?OVVpWHllV3NyMk5mWDJxSno1K2ZkOUkvSXhSS3M3Zmd5TWZ1Mnp3Tk9tMTlB?=
 =?utf-8?B?aG5wTER0M2JRWlFjNjZZQ1RvREFDcXVjZjg2RjM0SlF1UnpaUDI5RnNqV3Nk?=
 =?utf-8?B?cUhiaVRrdWozbzRKSFRhWDY1WWN5OE5LRnhNMHAraHZMNlpNNGVuQnFtc1Iv?=
 =?utf-8?B?QTQ3c0luWm5TR1piQk9RNkpRT1I1ZkxBZG9FdHVpSWZ5VmFXU2UwOXpjTHNq?=
 =?utf-8?B?elVSUkJBN21YblpscWlCRTJHeFpPOVRDeXRjOE4rUFREWFBadGtKbUw4UUtv?=
 =?utf-8?B?TzhnRnFibHdDOHFKaWVuWFYxLzlIMG5YNFlaNHJVYXRaZFF0eHQvZlJ5cyta?=
 =?utf-8?B?TGdMWi9QbFVIZi82MGJkZU11VDlUSzlyZVF6TWZLOVJzOW5Hd2Q2ZUtSZFNU?=
 =?utf-8?B?QUFiWEhDNmkzbkxHSlYyeEo3akpxMUFiYm9odlR0Sk1YT2tpL0VSRmdyUWFN?=
 =?utf-8?B?STQwaFFuanNhcWo0aW9tR2owVXhLa2VJVTlRUU9WTnR2a01QUEJPeDNlOFY1?=
 =?utf-8?B?L1N1ek9GdFZxUnE3VFZDWGR0RmI4NXZJVFlUMW5BMTVSYk0yZ1RCMDdtbmVF?=
 =?utf-8?B?cENOeVRTTS94RnN0NlNRaW9rdE9VRStpTXoyR203LzVhbmFtYkhpWE43RjNv?=
 =?utf-8?B?RTlXZFhnK2sreXVLdGpoMWVFREVJNVJEZGFDYTZremhGUzNiTHdadlpYbjBr?=
 =?utf-8?B?bk9yV3NUdHNpUzFmbjVKVytod3IrbGxhN3BUMHlvQXlvRkJQcEJoaGpzZTBH?=
 =?utf-8?B?SGdmVkN2S2tFalBNdG9vL1dSQldTZWJPM3pveUoyS0k2aFBSN0JwNUVzbmk3?=
 =?utf-8?B?UTBXWncrTGxPMzBCUzNWUk1Sb3V3ODFlbnp6aEZBVlppRC9ia2xkUk5QdmM5?=
 =?utf-8?B?dzJCL0UxZmZPcEMyMGVyV0N3cnRUcDNNL1F0RVNRUUN6ZFZ6VDRYdlRWUUMy?=
 =?utf-8?B?MlU5MjZSRWUvV0RBbHcyNFhrdmZUQUhuS2p0RE5DZGExd05rSDVaMm5uN2NQ?=
 =?utf-8?B?V2hVeDNBMkJ5MkZPbzBRV0t5Ylp5cXdhRWdsUjlpV2tSaStpU04rMFQvK1Vx?=
 =?utf-8?B?TzFNemYzNkI1SkwveVU5MmFiMWpPOGdjOEo5OHVVTjZGcy9HSTY4b2xHYjc3?=
 =?utf-8?B?b09QSjJ5NFlBM3paRmwyVFZKU0o0OUxFdEk5RjRrQW1ZRFJ0QXlRTzF2Yktr?=
 =?utf-8?B?TVYxSllJWlQrcWdOazkvbGJlZGdTZGpxUWhmY095UXNCZmpWeWk1VUhQUTRa?=
 =?utf-8?B?T3lwaG9mT1VrdTBlYVJuUStZL1dLdVlKSDRSZHFvV1FrZjRZc0h5NDVHMzBH?=
 =?utf-8?B?TVIybW81MlVCNVNHcytQbHdkY3hRZUJIYzVxSG9rV3FrNHAvaG9wU2JDUHpH?=
 =?utf-8?B?TkdvQlVoL2lzRzdxU2ZrbURJaXpFbEZiZXhKZ1ZQTHZMM29JRFVzdDhlSDhD?=
 =?utf-8?B?dDFkNVRWQnVaNFIzRXovYlVtTVpGbVovbGtLYStkYXk5VFJwOWhNZzJZVlhy?=
 =?utf-8?B?MjJvSnQyL2E4Qnp1NXhoRzFtcEtQNWNoOEtnL3ljc0ltUlFaT0FhOFBrR3l6?=
 =?utf-8?B?K0RGdTVpQVpFMmIyMXpPeUxFcTRtcnE1V0ZJRURGME9VYXhWV2Zzb0djbDdB?=
 =?utf-8?B?eXNhbU5IcmtGWUVuRHBSQ1dtWDhUcmM0ZXplcGVUcGFzcForRmg3azdrd1B5?=
 =?utf-8?Q?ODNCtB+D+Bo85R44lVb3xbCZd6OmL7iyC6De9hx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13afd357-f49a-4dad-9f29-08d8ce7e7e58
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 11:16:35.5227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ocyCiUh5XCIfrm6r7qZUsQJdwTl7z388jUrpqe1P8KbI4UsXwaBFTPNf6YD7HtQpyx4ccdwV2Yowz/ddYqqlwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4298
X-OriginatorOrg: citrix.com

On Thu, Feb 11, 2021 at 11:36:59AM +0100, Jan Beulich wrote:
> On 11.02.2021 09:45, Roger Pau Monné wrote:
> > On Wed, Feb 10, 2021 at 05:48:26PM +0100, Jan Beulich wrote:
> >> I did further consider not allocating any real page at all, but just
> >> using the address of some unpopulated space (which would require
> >> announcing this page as reserved to Dom0, so it wouldn't put any PCI
> >> MMIO BARs there). But I thought this would be too controversial, because
> >> of the possible risks associated with this.
> > 
> > No, Xen is not capable of allocating a suitable unpopulated page IMO,
> > so let's not go down that route. Wasting one RAM page seems perfectly
> > fine to me.
> 
> Why would Xen not be able to, in principle? It may be difficult,
> but there may also be pages we could declare we know we can use
> for this purpose.

I was under the impression that there could always be bits in ACPI
dynamic tables that could report MMIO ranges that Xen wasn't aware of,
but those should already be marked as reserved in the memory map
anyway for good behaved systems.

> >>          return;
> >>  
> >>      ASSERT(cpu_has_vmx_virtualize_apic_accesses);
> >>  
> >>      virt_page_ma = page_to_maddr(vcpu_vlapic(v)->regs_page);
> >> -    apic_page_ma = mfn_to_maddr(v->domain->arch.hvm.vmx.apic_access_mfn);
> >> +    apic_page_ma = mfn_to_maddr(apic_access_mfn);
> >>  
> >>      vmx_vmcs_enter(v);
> >>      __vmwrite(VIRTUAL_APIC_PAGE_ADDR, virt_page_ma);
> > 
> > I would consider setting up the vmcs and adding the page to the p2m in
> > the same function, and likely call it from vlapic_init. We could have
> > a domain_setup_apic in hvm_function_table that takes care of all this.
> 
> Well, I'd prefer to do this just once per domain without needing
> to special case this on e.g. vCPU 0.

I seems more natural to me to do this setup together with the rest of
the vlapic initialization, but I'm not going to insist, I also
understand your point about calling the function only once.

> >> --- a/xen/include/asm-x86/p2m.h
> >> +++ b/xen/include/asm-x86/p2m.h
> >> @@ -935,6 +935,9 @@ static inline unsigned int p2m_get_iommu
> >>          flags = IOMMUF_readable;
> >>          if ( !rangeset_contains_singleton(mmio_ro_ranges, mfn_x(mfn)) )
> >>              flags |= IOMMUF_writable;
> >> +        /* VMX'es APIC access page is global and hence has no owner. */
> >> +        if ( mfn_valid(mfn) && !page_get_owner(mfn_to_page(mfn)) )
> >> +            flags = 0;
> > 
> > Is it fine to have this page accessible to devices if the page tables
> > are shared between the CPU and the IOMMU?
> 
> No, it's not, but what do you do? As said elsewhere, devices
> gaining more access than is helpful is the price we pay for
> being able to share page tables. But ...

I'm concerned about allowing devices to write to this shared page, as
could be used as an unintended way to exchange information between
domains?

> > Is it possible for devices to write to it?
> 
> ... thinking about it - they would be able to access it only
> when interrupt remapping is off. Otherwise the entire range
> 0xFEExxxxx gets treated differently altogether by the IOMMU,

Now that I think of it, the range 0xFEExxxxx must always be special
handled for device accesses, regardless of whether interrupt remapping
is enabled or not, or else they won't be capable of delivering MSI
messages?

So I assume that whatever gets mapped in the IOMMU pages tables at
0xFEExxxxx simply gets ignored?

Or else mapping the lapic access page when using shared page tables
would have prevented CPU#0 from receiving MSI messages.

Thanks, Roger.

