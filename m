Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4B731EBD6
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 16:53:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86696.162939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lClbe-00011s-RJ; Thu, 18 Feb 2021 15:52:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86696.162939; Thu, 18 Feb 2021 15:52:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lClbe-00011T-O3; Thu, 18 Feb 2021 15:52:42 +0000
Received: by outflank-mailman (input) for mailman id 86696;
 Thu, 18 Feb 2021 15:52:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gXm/=HU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lClbd-00011O-Cr
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 15:52:41 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da28f838-c329-4f6b-b398-6ba171ec62cf;
 Thu, 18 Feb 2021 15:52:40 +0000 (UTC)
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
X-Inumbo-ID: da28f838-c329-4f6b-b398-6ba171ec62cf
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613663560;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=twyTTeoclOMZv6TC1+k9zhbDS+Y/mNLgV8KCOu/lapw=;
  b=bS+8KJoVOxU+io8Kotf/n9Yn7w2lNHX1sTdXi4CoLjyroyvByEJcfCKp
   U1wMosD/jeAoBy7oquY7IgQGGONESCycHrJscLs9HBr1OutuaqFh5QoI7
   uZubzOhUN6lYJjp5IT4w3ZxNiGN0jA/MIL8ZL5Jdk5FQo5wk1jJI5ff8x
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rKXZRHjwaaIRhoggsqCHTbfcZmRVABR7nLazA2LEssiCakesJYU5T6OTgPjv2W5oKOcGol/IGh
 rMdysEnVrjNbEXqaZp9rsOSJiDih+HxK/EjQkwKDHcGWgqf18V1x9eJ9naZ2Bc13e2YhvBFLKC
 aEGGkhvwL/CM9Tc7RjjNN3/7VDi8ha6pyidaxBKoJtx7vIl/eCX1V+uxvZgYI7e3x0t0jjmqcD
 TO5tztHSN683CYcKsyQEGKLd6P4w1hLz9VTHBhoR9RuLCQspRXSMvT3WYp6Me/Gx32t+HA3iFN
 Lr4=
X-SBRS: 5.2
X-MesageID: 38902774
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,187,1610427600"; 
   d="scan'208";a="38902774"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COKgsJgTBQTP2lcSwsWRb/1sy20DRLCpUrh5Wvp8r0ADa5esiu6EnKwqQsMTkUjsFtDNkMEK4cxKakbMD7YyZfqw9FLpSKczQLTlPd/Hr8NK4fYm34HSs6OldAJQbahNtguZcqizUbpm9/p1gJLyvd4qpEpMWiWaiLuiLKuAscwhehsGvpJGI9AR+Hchb5TVg3Skkp+Npi/89mpYORCIx8XE8uyCj4v7D+E6iDbC+VpHWUVMgR4Eqkp+fXvIhUOkE4T/zTOGqykh1HpJSG4r42sNeNC0cD2BEJbxmQuwm1k/8aEHWlX8ELmEOArUQax0zEkFTy8ifBT6qjjBbEFBhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFSM7SXcOrlix1cTLQ7haTv07XVezgiuCtOfOD8r7Yc=;
 b=oJ7Eb4Rp3CVjDkeovP+FAvXJiO5jF+WfdMOOrnHwXvfuewS7V8tTfuQdGU59vIqLn5vymCDWrZzjhTmdKXU7ryp0nf4Bj5sTyOCmNdVvpjLCl1MlRWk2sueKzJ/t/H+xThRPJEVRB7AzB2i3sXsI1OqTi67PWEcLfevSMJ3YOVQc+pnJSbiUhtVB6HVdKRlldfcHlEPBbzH16DX4/Z2mqsMyyv4OzH1c6zxsz4FBo41J6mCuKcSSTtc0T6j85IMZgqJ58t0qbcUukLB6FgCEY33NEfDgXDLrYyVDyb3HeNndEv6MAcNcc3E47uo0pUILkzclVhvBJVGmA7uUL4ywEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFSM7SXcOrlix1cTLQ7haTv07XVezgiuCtOfOD8r7Yc=;
 b=MN/Usc702do5KWcmeeUE4QsstO5pLLaEskg6CSj1PvXPx0HpDej3olU8dUcCt5zohsBXZqWxTdczcQwYP5kwMx1F67/0FQ2gXpIDp9VVpn/zJuXTjZue/jPdAh7PwN0yBqZ8q3ZHajmxOkhL6iqlvCZecPuLq7kXzQnYHWFifL0=
Date: Thu, 18 Feb 2021 16:52:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, <iwj@xenproject.org>, <wl@xen.org>,
	<anthony.perard@citrix.com>, <andrew.cooper3@citrix.com>,
	<jun.nakajima@intel.com>, <kevin.tian@intel.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 1/4] xl: Add support for ignore_msrs option
Message-ID: <YC6NPcym62a0Nu0M@Air-de-Roger>
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-2-git-send-email-boris.ostrovsky@oracle.com>
 <YC5EitRCZB+VCeCC@Air-de-Roger>
 <a78a4b94-47cc-64c0-1b1f-8429665822b2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a78a4b94-47cc-64c0-1b1f-8429665822b2@suse.com>
X-ClientProxiedBy: PR0P264CA0273.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c28ddce7-6982-4adc-cec1-08d8d425361d
X-MS-TrafficTypeDiagnostic: DM5PR03MB2633:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2633EF9901667548DE5D07898F859@DM5PR03MB2633.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c6DUu1+q5aLdwCKeloBH4WYRps2rIN2OGaY9j1EElK4k4uBFHtVtjtcQ4PmKJI7GAzaBOrir6H9Y3dtTAHC2RA/XQdhWDpyZgRyOT8m9CJVq2jl4mnp8wzjNdUDt/71kf8Wz6xPEfc6ltwUd+nTm4CjHQ6Fy7CORLOSfKuSQVipVGQcXncKRIyQONDx4WE066EonpLrJYOPDLyHXZR4bb4igXmE2fekZB0TMbVWV52U9V71xRx8OuVJ57ZBrZoSYT7ngItXf+slEFVQJH1MBLxs5oKOn7ZTedR3wIepU4VeXERinvfh+tt3GwRymf6uUoaCgQ5+fLF0oIhptcga8/Va8qMXUYF1kUSitEsu/wLVmINEvhrYNGzC+SFbCOOVw3Yrjq1ynB7qkM2HMXPygs4N8oOO7Iru4Vn4B6k0ZFrc/vhmRo/lJPPOkBsUZccuGP3fXkQ5X2gJ6uZHYGRMsTXaT0A/TsVQlDCeSSzTn1r4qilrNphFzf1NoJMEhTv4FmK+BJdmAm38Pd9kSF/T4Pu1PON967B/wO3+lTii+3REPhyUeyalLkni9xHxcNugCuTeqeXkMmkZ6bNklz/MiRomIpkONIqQv5pzqGGWYGj0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(366004)(396003)(346002)(376002)(39860400002)(9686003)(85182001)(6666004)(8676002)(478600001)(8936002)(6496006)(6486002)(5660300002)(83380400001)(45080400002)(33716001)(66946007)(316002)(2906002)(86362001)(16526019)(956004)(4326008)(6916009)(26005)(53546011)(186003)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bE0wTDNkMnBiSUlsSVJld0NCQjV1OU9yVG5TZHF0TXNRbkY0dmxQdHRtc3ZN?=
 =?utf-8?B?VHFTdjNDVmRQZmIwVm9FcjBMdWx1TVp4ZzRWNlgvZzA5SHRsdjB6L01TSCtQ?=
 =?utf-8?B?YjRpLy91b2pIS0w2UFpLeituMnNQNGVBbWQ5aCtJNnExMzgxSVdBSURrSTNW?=
 =?utf-8?B?cUpSK0o0dlJrMURJd3NQK0FvNTZUbjF0TXBsRy8yaC94R0RHMWFua1B4K29Q?=
 =?utf-8?B?WUVJODFtdGFLbG5TeENRVU00K3F3RHpEcWdMY1VPOEk3alpnZCtLckN6NmVF?=
 =?utf-8?B?TWJGMDRSaWVQZ0l2NnFiNmk4Tm1Uam5VczE4OVlxeTlGbWVGczJTREpEZCt6?=
 =?utf-8?B?bHRtajBuUjNQVVNmaG1WdVdkUW1WVElqZEd5a1Y0Um5DTjhQSkYxeW5WMndt?=
 =?utf-8?B?WW5vdGhXSmFDK2RYSEsrb05nSzlMQXpHOTJJTXU4ZW9qdGVzN1FIaHdpMnox?=
 =?utf-8?B?Z0k0TFNVQXp3dlFIUE5oNUJkQ2pTOGEzeE9Cb2NDVTd3R2dOYTdwSmx3T2ZV?=
 =?utf-8?B?S0YzN3d5Q1p5bTlKcWJsNWZieGkwKzNzcWI4OGxIc2NBcjh0TFplTWZVc0do?=
 =?utf-8?B?WXpmM3VqVWpERUJ0eEhHWm5lUGJzbXU4WmtNQTFuUzdwRzcxbFV1MU9XMFJj?=
 =?utf-8?B?cEdGRTg2L2QreG9tanM0UzZvU21pVDNPMGVGbVd1dE1ZdFVRODJINWlWcjlF?=
 =?utf-8?B?T0VteU1WMUp0S3h4QlQxWXRZVWMzTFgwYXdMUWFHb0o0SFRpaVkxN050TWZV?=
 =?utf-8?B?aC9zdWlQS1hCQ1JBNmRJSjVMS3cvbnQ4TGpLT1VPMnp6eExLOWlteExQcGJ4?=
 =?utf-8?B?dmhrR0V6THJKdmQzRjBGSWlOeGJISFl3RUM5OEVGQ1RDK3R3b3l5UXE1MTdv?=
 =?utf-8?B?UjIzUXRPQm1zWkdoTVorVjFFVlpud1l2M2ZuaWVhSDRwbFBoYVl1b3VYUERT?=
 =?utf-8?B?S2doaStpdHlGNWVKbFpOMFhnUWtLdnRPMzZSeVpCSVRpdFJldGtXbmdSc29W?=
 =?utf-8?B?V2h0NnBjRmVMWkF2K0Y3MnNFUi9ydGluaWlmZHdUNk1wU0ptUCsyQ2xCQjUx?=
 =?utf-8?B?ZDV3U295QnpjbGlHcENUbENBa0ZQRS91L0VpNlluSWRFTUhHOHB5UWFqZzUr?=
 =?utf-8?B?MmpORHVuQmozL0xrZlhDZ256T1JpLytpZ2FacmFxZEZZYUkvS1JVMXhXUklt?=
 =?utf-8?B?Z2xHZnpsR01vSGtiR3ovR3JNbmVya1haZndRREYyMzh0UkFKMVRmTWlrZi8z?=
 =?utf-8?B?dVJ2MldkakZnRVNRL3pzOE5aNUxZaWZxa1pWcm1JQ3ozTmRZTFhoQTd6dzJT?=
 =?utf-8?B?enhVTC9hbjdxbk5xRDVqWjNVa1hPcjVnK1FseVpWSThSd3YwaUw1aW52K2Yv?=
 =?utf-8?B?bFM5Z3FWdVZKaTRxbktWUUVIWGVGTG01cVJWV2Z5cEowZW9KY0VJT1pQdjhQ?=
 =?utf-8?B?MERlNmxDbHVhS2QrU3VwaW5UNm51TUpFQ1NXNXA2ZWZGdDdUOWpWVmVaRXZp?=
 =?utf-8?B?ZW9OeWIwNktSQkM0QmJEb2dLc2pUd0ltRXEyVlhZbXM1V0YzQTY2ZXZKWWFD?=
 =?utf-8?B?N29mWmpUc2RiV21GZ2xzb3ZMM0plZlhnL1VuQzJlSnUzTnNHZkp6Tm9Da2gw?=
 =?utf-8?B?djdISVIwV2N4ODNsdXZBUXNjZWxyeU4rVkZzOVd3djhQeUdYK1lOcmV5N1ZM?=
 =?utf-8?B?RnlQNzdXaUQzbExHRjMvd2k3N0REclpoNUsrUm9rNHRyQUZDYlBvSFFhRmEr?=
 =?utf-8?Q?NsT2onfYZVE74RtlvzKT0fgnZhoTGGHz7BAlXdN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c28ddce7-6982-4adc-cec1-08d8d425361d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 15:52:36.1479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3iyqD9ht2GbOM2MD5+4iQTnAdxSE8TYB8gyLZmzMxQlRxUesocbu1HDkRQqptniBgHRcQJ0OwXQkNnpEtg6Jgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2633
X-OriginatorOrg: citrix.com

On Thu, Feb 18, 2021 at 12:54:13PM +0100, Jan Beulich wrote:
> On 18.02.2021 11:42, Roger Pau Monné wrote:
> > On Wed, Jan 20, 2021 at 05:49:09PM -0500, Boris Ostrovsky wrote:
> >> This option allows guest administrator specify what should happen when
> >> guest accesses an MSR which is not explicitly emulated by the hypervisor.
> >>
> >> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> >> ---
> >>  docs/man/xl.cfg.5.pod.in         | 20 +++++++++++++++++++-
> >>  tools/libs/light/libxl_types.idl |  7 +++++++
> >>  tools/xl/xl_parse.c              |  7 +++++++
> >>  3 files changed, 33 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> >> index c8e017f950de..96ce97c42cab 100644
> >> --- a/docs/man/xl.cfg.5.pod.in
> >> +++ b/docs/man/xl.cfg.5.pod.in
> >> @@ -2044,7 +2044,25 @@ Do not provide a VM generation ID.
> >>  See also "Virtual Machine Generation ID" by Microsoft:
> >>  L<https://docs.microsoft.com/en-us/windows/win32/hyperv_v2/virtual-machine-generation-identifier>
> >>  
> >> -=back 
> >> +=over
> >> +
> >> +=item B<ignore_msrs="STRING">
> >> +
> >> +Determine hypervisor behavior on accesses to MSRs that are not emulated by the hypervisor.
> >> +
> >> +=over 4
> >> +
> >> +=item B<never>
> >> +
> >> +Issue a warning to the log and #GP to the guest. This is default.
> >> +
> >> +=item B<silent>
> >> +
> >> +MSR reads return 0, MSR writes are ignored. No warnings to the log.
> >> +
> >> +=item B<verbose>
> >> +
> >> +Similar to B<silent> but a warning is written.
> > 
> > Would it make sense to allow for this option to be more fine-grained
> > in the future?
> 
> From an abstract perspective - maybe. But remember that this information
> will need to be migrated with the guest. It would seem to me that
> Boris'es approach is easier migration-wise.

I'm not an expert on migration, but I seem to recall there's already a
libxl blob that gets migrated that contains the domain configuration,
so having the MSR configuration there seems like a sensible thing to
do.

> > Not that you need to implement the full thing now, but maybe we could
> > have something like:
> > 
> > "
> > =item B<ignore_msrs=[ "MSR_RANGE, "MSR_RANGE", ..]>
> > 
> > Specify a list of MSR ranges that will be ignored by the hypervisor:
> > reads will return zeros and writes will be discarded without raising a
> > #GP.
> > 
> > Each MSR_RANGE is given in hexadecimal format and may be a range, e.g.
> > c00102f0-c00102f1 (inclusive), or a single MSR, e.g. c00102f1.
> > "
> > 
> > Then you can print the messages in the hypervisor using a guest log
> > level and modify it on demand in order to get more verbose output?
> 
> "Modify on demand"? Irrespective of what you mean with this, ...
> 
> > I don't think selecting whether the messages are printed or not from
> > xl is that helpful as the same could be achieved using guest_loglvl.
> 
> ... controlling this via guest_loglvl would affect various other
> log messages' visibility.

Right, but do we really need this level of per-guest log control,
implemented in this way exclusively for MSRs?

We don't have a way for other parts of the code to have such
fine-grained control about what messages should be printed, and I
don't think MSR should be an exception. I assume this would be used to
detect which MSRs a guest is trying to access, and I would be fine
just using guest_loglvl to that end, the more that it can be modified
at run time now.

In any case I'm more worried about having a big switch to ignore all
unhandled MSRs rather than whether accesses should print a message or
not. Worse come to worse we could always add a new option afterwards
to selectively ignore MSR access, but that would be confusing for
users IMO.

Thanks, Roger.

