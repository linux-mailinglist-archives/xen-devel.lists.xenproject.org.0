Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0B632A336
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 16:03:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92397.174285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH6Ww-0006HM-PW; Tue, 02 Mar 2021 15:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92397.174285; Tue, 02 Mar 2021 15:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH6Ww-0006Gv-KA; Tue, 02 Mar 2021 15:01:46 +0000
Received: by outflank-mailman (input) for mailman id 92397;
 Tue, 02 Mar 2021 15:01:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IOGE=IA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lH6Wv-0006Gq-5s
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 15:01:45 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae5133b3-6538-46fc-a092-0a6106e44bd1;
 Tue, 02 Mar 2021 15:01:42 +0000 (UTC)
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
X-Inumbo-ID: ae5133b3-6538-46fc-a092-0a6106e44bd1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614697302;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=C1ctjyifuLgKotDqKZrUYexPmT/bCj8TTpx7Q/FbiYM=;
  b=YczOcuAZ8Q6+U4TFXIr3s654a7m9OFioWErPIwseD2H07ZL1u/R7SaGA
   A000cafwFbSKlb/RXwumNYBSlXMGYcLI2R8UYPrMm1MEnzjGw3xeghw1k
   vdur05tZHQui2hUfNAzgVBnpX3Ukmlmi3Hk7ZYSJjbEHyD5S5yWb1uwFl
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 9PEQjBZwdAHsWsKM1Uk7PhPKBs0L3HLvLbelO+EDykXZ2z+yLBeE1AxVongbTGAa7WXFPFmEJP
 DWbfgCMohd/W4RacT34cCis0rch97U+mm8xM0B6MtBVAoprLRO4mgYeqWXkNxs9IWEKUi7EF1G
 BVdfNlNqM5EDQByWDR6x8jOjNMCgRzRW3HAjvDq5Ll7t/nIUICBpxA2ETwm4Z4Jfwp1vz+Xy16
 sjMp/1UwS7A8k0Fyo5TqnYB5fTWkCNvgFlvbGWVqcFZiyIwQCa05ey8aa76fHlFMI1i/f9C83Z
 0Zk=
X-SBRS: 5.2
X-MesageID: 38710780
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,216,1610427600"; 
   d="scan'208";a="38710780"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VapDLthl+lDC0N7JsGjrjS8kDP7W4qFR3Jg1ZNCg5Da8GCGYSt6dvxCv47CmWniYaoj7TsY4pJkWneqczkwMTEHhusXjOjhkpsb0dQzj6XwwdMXc5zYdo3/uPAuk+NA3EuL5I5UiPc9MaVuwCghf6AzyMhWGRkOkSrop2gV2ubZ50WTt27ZBPlo2iGTXkhtBbIvKH/SIIKGB3ndZxxcot3KlpCmFyBuf2Ldg547omP31qWON7VC8WbDNHC6yQQvJjkLCIsryz5FoSCG7K4bPb0M+yltBbbYV7/tx1DLLkBTLRCaouCUsR9fe/dYiiHP1ll6G7w1lT/rW3SAyY1y38A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6GGem3553ZQJ2A8xBoubF1bosk6d1m7VHnE/mfJrcg=;
 b=KLUAE7xrEk8TKjWtIrhQFcm4f5PCa3O354aYw7eAkAJ3enyPGOCOSN5/wH02vKN5YKD6IB7VUeHLENIbaLYC05Cqbvvv5EPvGSCBx4wkvs+6tQBs0xWNRILX7xKuNMh9miW4VUc4rpyjLkNnq3DuWmoa+hHnPL0iGZHU2LjkfDJXNFhonpEB3p3/UeTDRaMX5ujB8QVMHlCKetC49yLhoPMdGvOjty1X6uaEN6vLJy6Y1LMPyTgiNHdH2AZJ/RmN9U14RU2YGkE2iTMx/LSzvbrOeyGn8VcqcP6MxYO3CuWG+Rt1bsxqO0Qy1Xc2nI6TTBGVEjQh0TyRtipW+/3/ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6GGem3553ZQJ2A8xBoubF1bosk6d1m7VHnE/mfJrcg=;
 b=tYBQECkDzq1xnCAMf5zrGlf4zYd8gIioMOcEAMwsMytl+tyottmB35YruLydZQ3uIXoM5KvAFRJhDPdPqkbmbscHJ1QJ1vLvWxnyQ5Y6TMyPSCK+65Bb0zXCE5eEqaG+Dupte8vO5mPM3SzmPuT1yK9BwRJoXA6xF0mP4afk1/I=
Date: Tue, 2 Mar 2021 16:00:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin
 Tian <kevin.tian@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC for-4.15] x86/msr: introduce an option for legacy MSR
 behavior selection
Message-ID: <YD5TBSwZWzjlwGxD@Air-de-Roger>
References: <20210301162357.76527-1-roger.pau@citrix.com>
 <bfd185bf-489f-d858-c459-7630cbe7b462@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bfd185bf-489f-d858-c459-7630cbe7b462@suse.com>
X-ClientProxiedBy: MR2P264CA0119.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 987de990-3fa3-4b35-2d34-08d8dd8beb13
X-MS-TrafficTypeDiagnostic: DM6PR03MB3739:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3739497FBED3470F5BA8BF9D8F999@DM6PR03MB3739.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pg6NPQMqzUZgBNfFapfaEgogdAsQOjWclHIF3CiSprUO+L1EpyIPYR3+9YG7PWbmy618nhWByLA5w/CQt7DhJbTcyFwiueopqun7fycKxB/0t1I7ECFGH0dTkYfDsJBz5mILlgilvHPa1BsgfmctzmCaBWxN2BbrR1B8X1n5elJg4lAkmkjhVFRkdyZ4vcKoCIv6HNqozd9Xc/uufHHmT9kGgozlWEuqYJnsDKfyd+Tq4lv+BHigEGoigNtd5TPwHkON7EZiiXEH746ZIunYWxickF1xoTOzozkwkR6XR+6Osc6XOA4PiX3NwsM5lQAXcuHSJlx6jMsDUP5p0jls9pBQih/RDl3bGpsIxrdWelPQcucqQKuYzfBut4KhnzMN7BMiJz/GmObI3UxNqUlBHh/czBeAwVnI3R42Om4Y4B0UKgdIHvV1ElhU/7/GY5foZamQWphV0j9gLe0cFjxF6KOiouV1lmCGJicFZEpAXeb8+Y7Ql7OIAETBxLWlVuLgHpn/ASPxDUcnFr+BqDjZ5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(346002)(376002)(136003)(396003)(39860400002)(66556008)(66476007)(85182001)(4326008)(5660300002)(6916009)(86362001)(6486002)(9686003)(66946007)(186003)(956004)(8936002)(2906002)(53546011)(316002)(33716001)(54906003)(83380400001)(6666004)(478600001)(6496006)(16526019)(8676002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NmxUbCtMYUcyU25iTHBUTVM1elNxN1BlV3BNeFZWSzhsWmlOQ3pQWUdPWGZs?=
 =?utf-8?B?L1ZROElnWUhidFZPZnBhbHhVcmFDYmxqazl3cHlkVWh6S21OdWcwcWVmVlA4?=
 =?utf-8?B?dXJ1ODA2cGxnMjJDTUp3QU1SdDBWb2VzY3BIb2lrdnBJUm02bG94L0cxMi9N?=
 =?utf-8?B?eDE5RVlkM3dJUXc2NG1POHgraHZ4ZGtYeDUxWnI5QUoxd3JESFJKRERYMDVq?=
 =?utf-8?B?MEJzVVVNZ0d1bkdVc2drQXRmalZDTzRPanRyTjB0UFFFdWJRUGQyMkRyS0Mv?=
 =?utf-8?B?YkFPYjRwODc0Z2VwVG9aNkNEWWY1TnRlMkJ5Z0N6eEJCa0IrYnZwcUlOS25Q?=
 =?utf-8?B?b09RVXhtb3JFTDRvS25KQmNkMi8ybE5KQU1ZWEVZQXJlUGZ5dW4rUjU1aHIw?=
 =?utf-8?B?SjFZNFlSRm9FRkRkRlViWm9POGRYUG9zdkduNEkwTytmMk5yN09QajlrL1ZY?=
 =?utf-8?B?NnFFMkRzR21peHN3dy9iMUE2bHd1UlFxY05tSkVmV3FncHlULzJKOUErU1po?=
 =?utf-8?B?cStodDhCeThSbEdUb1pPRDNkK0ltKzhXUnhJbTEvVm5Ld3hXOUUxSEw0YURm?=
 =?utf-8?B?VmY4RVprM3ZhUTRWN2JIWWMzOC8vTllFSDZwbjRmOVFQTkV1d3A2cjhURnFI?=
 =?utf-8?B?UWNIa05TOUlBdmVFSzlLVmdlMFAydFZYSkJJNlk4REhCZlFrbDNmL1BTTTQ4?=
 =?utf-8?B?M2FiTi8yQ1I1LzF4Q1hvdjZZQ256ZTlGODVtVFJqVGNYV21XWXNHYTFTVzFY?=
 =?utf-8?B?MVMrSmFlVkhsRjc4V2lnM2JiMjhjYkp4aXpyRTNtZkVuOEhUY3ArSkExS3Mv?=
 =?utf-8?B?VTZxTnZ6MVNQK29NN3pZM3RnTlY3Vzh1blVURURqUGpqM1JONmhNMlZNTWZR?=
 =?utf-8?B?UVhhbXEvanQycVExc0wzUm1QWHA2WmRBQlFSUkRoTmIvQUEzb015TlhwZGJ2?=
 =?utf-8?B?TDgwUGM4bU94RENEQlA5WTVRd2laNTlBU2M3OGdnUHN3QmtCanFPTHBjM0Yv?=
 =?utf-8?B?cXJrZHAyNGxqN1JBenFUTGNSZW9PMnpPbG1JcytjdXJMWjEzY05tZlVaOXRr?=
 =?utf-8?B?NENqWUM0SlhNYm5wTndjRXRqYzlmMnVEaThCSTJOVlZkR2g1Sk1HbVJKUXZh?=
 =?utf-8?B?U09KTEI0L1dzUDNSbDV4QUJUQm9rL3h1UmpCckFaQ202T1pJU0hWa1lGTndI?=
 =?utf-8?B?YmE4dVJ2SDZRcEhGNXMrR0lZZmNWb2hGYVcxSHd0WE1zKzBQNjVlS1dwTDl2?=
 =?utf-8?B?eUV0eVZLeU81UXUxYlAyNGhOdzRlNXZtcXpGKzFOSWdpbFJZQ0tyNDJ4ZEx4?=
 =?utf-8?B?MTFGeFNLd0w3aW5tOVZpZW9maUNYL2NrdGluWDU0UWF3RmZsdkZnQ0llM0Z5?=
 =?utf-8?B?WHpvSFcvTUE4V2Fxb2xZcnpNMjRIdExBR2JtR1JoczQxNnNQNVhFbU1Hbkhm?=
 =?utf-8?B?b0xCZUhzZ0xHZTVnTkZZdnRONnN2T0V1dEF6b2VqdHY3aWdvcVF2Tm5uMXN4?=
 =?utf-8?B?Zis0QXo2Um56NzFoUy9xR2d1c3ZPRWw1TTY4T2ovU2RTWURhOXQvNlZCUG9F?=
 =?utf-8?B?ZWNueXRvTUEraUdzTDg5Si9nSklTN2V0VDVvWHRyNXRVRXZndDA5MG82c3Vj?=
 =?utf-8?B?N0dpVHJTc0pYUW0vM2w3NG9WVXRQeFUrQkVTdmY2eExoMFlYekNPcjRXSHBL?=
 =?utf-8?B?SE5JVzAyWWZsWHdibkRHY1MxYXFqcWJ4dFM3N1NXMEhqYjJlNkNhQWEyN0J2?=
 =?utf-8?B?YlF0SHBGeFJNQmpiSHY5NkVXUkdKaHlkcUJRVXVhS0JSQ2dMemdOelI0V2Va?=
 =?utf-8?B?aVFiY1RMd1NZN2Z6THUzQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 987de990-3fa3-4b35-2d34-08d8dd8beb13
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 15:00:28.9648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qFo9Dwf+e5Kda/A2TiOXDGCWqV73CMU671tj7UghTH1eOxjHFSsDbT1htZgdxVgP86ys8aw8gFJZCBzGwlUlPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3739
X-OriginatorOrg: citrix.com

On Tue, Mar 02, 2021 at 12:16:12PM +0100, Jan Beulich wrote:
> On 01.03.2021 17:23, Roger Pau Monne wrote:
> > Introduce an option to allow selecting the legacy behavior for
> > accesses to MSRs not explicitly handled. Since commit
> > 84e848fd7a162f669 and 322ec7c89f6640e accesses to MSRs not explicitly
> > handled by Xen result in the injection of a #GP to the guest. This is
> > a behavior change since previously a #GP was only injected if
> > accessing the MSR on the real hardware will also trigger a #GP.
> > 
> > This seems to be problematic for some guests, so introduce an option
> > to fallback to this legacy behavior. The main difference between what
> > was previously done is that the hardware MSR value is not leaked to
> > the guests on reads.
> 
> Looking at the WRMSR behavior for PV, what you introduce isn't
> matching 4.14 behavior: If rdmsr_safe() failed, all that effected
> was the issuing of a log message. The behavior you propose is
> better, no question, but it shouldn't be described as matching
> legacy behavior then.
> 
> Somewhat related to this I wonder whether MSR reads and writes
> wouldn't better be controllable independently. It seems quite
> likely that a kernel may have an issue only with reads.
> 
> Additionally I wonder whether it is a good idea to let these
> events go silently.
> 
> > Note that this option is not made available to dom0. I'm not sure
> > whether it makes sense to do so, since anyone updating Xen to such
> > newer version will also likely pair it with a newish kernel that
> > doesn't require such workarounds.
> 
> No, that's not an option imo. It was a Dom0 where I ran into the
> problem causing me to submit "x86/PV: conditionally avoid raising
> #GP for early guest MSR accesses". While I could upgrade that
> system, I have reasons for not doing so. And while I could put a
> more modern kernel on there, I'd prefer if the distro kernel
> continued to work. (That's leaving aside that for unrelated
> reasons building and using my own, newer kernel there is quite a
> bit more difficult than on all other of my test systems.)
> 
> > RFC because there's still some debate as to how we should solve the
> > MSR issue, this is one possible way, but IMO we need to make a
> > decision soon-ish because of the release timeline.
> 
> Generally I think it would be far better from a user pov if
> things worked out of the box, at least in cases where it can be
> made work. Arguably for Solaris this isn't going to be possible
> (leaving aside the non-option of fully returning back to original
> behavior), but for the old-Linux-PV case I still think my proposed
> change is better in this regard. I realize Andrew said (on irc)
> that this is making the behavior even weaker. I take a different
> perspective: Considering a guest will install exception handlers
> at some point, I continue to fail to see what good it will do to
> try to inject a #GP(0) when we know the guest will die because of
> not having a handler registered just yet. It is a kernel flaw,
> yes, but they ended up living with it merely because of our odd
> prior behavior, so we can't put all the blame on them.

My concern with this would mostly be with newer guests, in the sense
that people could come to rely on this behavior of not injecting a
#GP if the handler is not setup, which I think we should try to avoid.

One option would be to introduce a feature that could be used in the
elfnotes to signal that the kernel doesn't require such workarounds
for MSR #GP handling, maybe:

/*
 * Signal that the kernel doesn't require suppressing the #GP on
 * unknown MSR accesses if the handler is not setup. New kernels
 * should always have this set.
 */
#define XENFEAT_msr_early_gp   16

We could try to backport this on the Linux kernel as far as we can
that we know it's safe to do so.

If this is not acceptable then I guess your solution is fine. Arguably
PV has it's own (weird) architecture, in which it might be safe to say
that no #GP will be injected as a result of a MSR access unless the
handler is setup. Ideally we should document this behaviour somewhere.

Maybe we could add a rdmsr_safe to your path akin to what's done
here?

> 
> This isn't to say that I'm against propagating exceptions where
> there's no alternative to delivering one. Also I'm certainly open
> to further tighten the condition of when to zap such an exception
> (e.g. only as long as there's no handler _and_ the guest is still
> in UP mode, assuming of course this would still address the
> observed issue).
> 
> > --- a/docs/man/xl.cfg.5.pod.in
> > +++ b/docs/man/xl.cfg.5.pod.in
> > @@ -2861,6 +2861,17 @@ No MCA capabilities in above list are enabled.
> >  
> >  =back
> >  
> > +=item B<msr_legacy_handling=BOOLEAN>
> > +
> > +Select whether to use the legacy behaviour for accesses to MSRs not explicitly
> > +handled by Xen instead of injecting a #GP to the guest.  Such legacy access
> > +mode will force Xen to replicate the behaviour from the hardware it's currently
> > +running on in order to decide whether a #GP is injected to the guest.  Note
> > +that the guest is never allowed access to unhandled MSRs, this option only
> > +changes whether a #GP might be injected or not.
> 
> This description is appropriate for reads, but not for writes:
> Whether a write would fault can only be known by trying a write,
> yet for safety reasons we can't risk doing more than a read. An
> option might be to make writes fault is the to be written value
> differs from that which the probing read has returned (i.e. the
> same condition which originally had caused a log message to appear
> in 4.14 for PV guests).

Read values for unhandled MSRs will always be 0 with the proposed
code, so we would inject a #GP to the guest for any write attempt to
unhandled MSRs with a value different than 0.

Maybe we should just inject a #GP to the guest for any attempts to
write to unhandled MSRs?

> > --- a/tools/libs/light/libxl_types.idl
> > +++ b/tools/libs/light/libxl_types.idl
> > @@ -644,6 +644,8 @@ libxl_domain_build_info = Struct("domain_build_info",[
> >      ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
> >                                 ("vuart", libxl_vuart_type),
> >                                ])),
> > +    ("arch_x86", Struct(None, [("msr_legacy_handling", libxl_defbool),
> > +                              ])),
> 
> Seeing this I'm wondering whether the entire set of arch_*
> shouldn't be within a union. But afaics this would have further
> implications on code elsewhere, so surely wouldn't want doing
> right now.

Right, I thought the same but I'm not sure we can change this now, as
it's part of the API. Adding new fields is fine, but adding a union
field with arch_arm would change the structure as we would need to add
a 'u' (or equivalent) field here.

> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -852,6 +852,9 @@ int arch_domain_create(struct domain *d,
> >  
> >      domain_cpu_policy_changed(d);
> >  
> > +    d->arch.msr_legacy_handling = config->arch.domain_flags &
> > +                                  XEN_X86_LEGACY_MSR_HANDLING;
> 
> Somewhere you'd also need to refuse processing requests with any
> of the other 31 bits set.

Yes, I need to sanitize the flags.

Thanks, Roger.

