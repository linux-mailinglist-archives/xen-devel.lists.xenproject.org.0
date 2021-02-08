Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C5931398B
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 17:34:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82969.153546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l99UG-0005rh-9W; Mon, 08 Feb 2021 16:34:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82969.153546; Mon, 08 Feb 2021 16:34:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l99UG-0005rK-66; Mon, 08 Feb 2021 16:34:08 +0000
Received: by outflank-mailman (input) for mailman id 82969;
 Mon, 08 Feb 2021 16:34:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=atCq=HK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l99UE-0005rC-RZ
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 16:34:07 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4fc6ace0-0521-4e7d-a924-fa1396796465;
 Mon, 08 Feb 2021 16:34:05 +0000 (UTC)
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
X-Inumbo-ID: 4fc6ace0-0521-4e7d-a924-fa1396796465
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612802045;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=A0Em8e96lo0tVUoTLXM6uyiy3YUTBFOlmfCCVcq8k00=;
  b=fVv4ireRSjdT1+hYJKR6GIUSofRyE3sKWgpOXsIi9MdpPjAqeqRIx7pw
   61gibYfygfgnO6TW4Wd4PeVdqxAFN8sQf82Y37GSmDvyTjFfO7xe+9Nsp
   lWb+lfZC69UDLfLgHlAescikV0ZfqVbk+mDCU+uxI45nCvZj3/HH2Nr8m
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: te60TKIPCi4bvwd05rkVTextz6J+Gb36KbzIn78tXkB8j0nCEFZmJdcfgXqaCYIcm+3nOHv873
 IVPcXt3H4AsZmzNgBo71KvX0/N9rhcQwd6rhbsWD1k73fpV+EBy76GpiWmVMsRUqbkDQ2iKmXY
 JgBfImg0KNSkBGWUxjNHb1dxb+zVUb51PwO+W9JQOclHNrQ2lLb5aKACPEG4WXl8EhKEW8hD6M
 2GuBnofMEmUcbpy/G0ETK5mmK8jbkrVWtZ+6iOq8l+fCYtcOncHoNPKDdhr2J7Oup7+IG4lUHf
 KfA=
X-SBRS: 5.2
X-MesageID: 37161291
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,162,1610427600"; 
   d="scan'208";a="37161291"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amSSSO763ZmBPu4zYSBLKjao6pbErrWas+OXuQyYsWG3ezqBUn4zJINov4dtRlfUZ0VWlGBdFum/kkJ2aEc8xcuKNqTkVO7pP0urGDKe7Pf6rsQq/JUA0n5qhYtf7SSwtINuFCUaNRa0U3MGYO1tWgjUh/ebdKuSUW4Cy7Bi3s5xJcIbbgMzU3nenV7Sa757HFyP0cKQDSnAUa6Amx/Tjnmz7Lu3sPul8cX7DnTZhaxXJW5fy8RnIMIjz0njw+L5fDBnZ5uPba2ohoIDSiNLUP5Z/+ulqSrNgMhB4MWBSW9gFJVCOG3LA9w8J+bR8nyfLdhkQrzGZz6RzlHgViac1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLypsmW5q1e6Ayo48trqI8SIWhmV4lmtJWvBXiMikZg=;
 b=CnEZ1RnoeALfM/M0UNx/SOQ83wVQxGZ5zb+cR9IjuXfgefnQXTNBg+sYuJ5F3MMQGCYFGphhZaGJUQsUSFxP+xrHRlAVRWC6UE4uATQpB6ggUjEfktPrXVHTb0eGyuMwcmcgUG4ODvesn2/xqIzJQTNAhpOirp/Dim0CRUgX38u8Ar0vziRxd90htf3usWdx2H8oaCkMb2Bd8wSebS6UNtjLkO8cMkr2Jh9XNmDQrZooJn4elLlwLD7Z/IgWMpOg103wXv+N2aHlIF6kA6oN8OObwnwge/M90XvU5Fyu5RfQJSTHrljTI46vzTczprkGuku7ZzlMB5jOM3DKlDbOdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLypsmW5q1e6Ayo48trqI8SIWhmV4lmtJWvBXiMikZg=;
 b=qtokz6wMQkAlXNtYIcajiPwo9TIst+5x4xl0zk2BN5vD/J7rc5HWKFNbo9nAERScv6Hu1YCsxV6HjaCoyCPQXmK4lWZbFR/8DGTFkEmCsjnNWex/1SGsIM7Rfa1O0uVRXBZmxaOCEyy33mdrtyhyANk81iuQ7aYzm6aaQByMdwg=
Date: Mon, 8 Feb 2021 17:33:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Claudemir Todo Bom
	<claudemir@todobom.com>
Subject: Re: [PATCH v2 3/3] x86/time: don't move TSC backwards in
 time_calibration_tsc_rendezvous()
Message-ID: <YCFn8Uy2B+tiQj12@Air-de-Roger>
References: <b8d1d4f8-8675-1393-8524-d060ffb1551a@suse.com>
 <80d05abb-4d53-3229-8326-21d79e32dfe4@suse.com>
 <YCEGshHDEH9bJU7y@Air-de-Roger>
 <ae8d8e02-9d2e-a26e-9321-cae0640a0dee@suse.com>
 <YCE6XlA14A2Qsq8H@Air-de-Roger>
 <391c4c6f-6213-ac7a-8871-a0c138f6b29f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <391c4c6f-6213-ac7a-8871-a0c138f6b29f@suse.com>
X-ClientProxiedBy: PR3P189CA0075.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f614b2ff-4a03-4011-6fd7-08d8cc4f563b
X-MS-TrafficTypeDiagnostic: DM6PR03MB5084:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB508483C95A3C1559E441E4768F8F9@DM6PR03MB5084.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ATBtp/YwWVPMkDMbRLjQ8wsnqT+XCet5vvfMXCCj3mwHlCtXh5SsKCVXkfTW2UjCF2ZAUp0XZmyjxlXvda8U3YhflOaIK+D5AenMb/4S9cnjGkbnU079/ASfQqGzXHpbSMzv12VVMwv2E3Wev4QROP4zMpik2LD95CS5QYlFcA5DG7gP9HxlVT8/7+y4uuNMFtxJ/uVFqOHe1zj61Q6W9F4E7yeXgrMwaojX3qZ3UkBJ+Ycb5pHUE793RPh6DJx/lyLVbyU2luUWcfHeVLzldVH4YnCLRkgTNC9wltc4CooSbMAvnxrqttOjbNJYg8GxNOpuvLX46twuLPzylOQKn/1VQezimuff8diFnrfldWeUGr6IFyrKbUQPRC5NuJRd1qtyIMLUpRT8tCc1shOh+voB2mu2XPKEyXeY9/a7qU2Zl9ozQpSpNonuobWTyEfX4Yu+H1KoUkJudKFK/waA/hOEnuPHIlSJPtaNuBctnwYm/+i9R4uVtEHd9ylYeDe5swDfh72UryxC4SoNRHJUAWmUXQSHPhK9fPqdLzAkNGK/KCR9phj/pe28kMHa19zH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(956004)(2906002)(16526019)(478600001)(66556008)(186003)(4326008)(86362001)(33716001)(316002)(26005)(66476007)(6916009)(54906003)(66946007)(6496006)(8676002)(53546011)(83380400001)(8936002)(6666004)(6486002)(9686003)(85182001)(5660300002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OTlmU3lhZVdsQjBOMVRNRHpOL0dyNzFBR2JpendoOFByeHE4bDJhU00yZFBq?=
 =?utf-8?B?SWRJck1JTmNRRFpwdk5HRGlxSldvSzRGK1dBVkZKUUM5c011bm5McG9Dc0lV?=
 =?utf-8?B?amFsVkJPaWFKd3RURDQwczBjSlRyRi9uNk9qWGZheWJDbERKRk84eFEwVWFi?=
 =?utf-8?B?UjB4eDgxMW9leFdFa0RSQ2RSYWxxSEM1Y0w1QWxDMlR4RmQ0aW5uYVBoS2lP?=
 =?utf-8?B?Q3pkRjl2dFN3cnZBREI4cGRhdE1WNHpVUXRtU1hoOWI4TktuN0FQcEZuQTM2?=
 =?utf-8?B?bkxBOHZZb3B1Y1VOaTltSlFWTnNXVllGaHlLaWtDNE5BK2hGYUxkaVJPTzZC?=
 =?utf-8?B?SHZMc085MzdoN1lBbWNEZWlJQTUxNUY3OUtFVmFQZ3NLVnFYaFB5R0h6YjM3?=
 =?utf-8?B?YU9HajRtSTZyb3ZZRXFDZXA0VjkxaDRHUERBQWFaNExMMnlYM3ordTFaTDJR?=
 =?utf-8?B?ZTNuNjdCOWJnMCsxUGhOUFhUZzB5RVExeUFtNzRXWTJsTXdlNjM0WVhsWlUw?=
 =?utf-8?B?eHpmZlhld0NQUDQ3UjE5bU9IRmNHZTM5U3pZZHpldk5FMG5TTEIvM3V1OXp6?=
 =?utf-8?B?TUtTZm9WMS9oYkw2NE9CRllDaTVPMVpZakptTCs5elExMkh0VVlUU2tabjlQ?=
 =?utf-8?B?NUdEOEtwclRmM3ArQThRbGVtZll5L0Z6NlhmS2kyWjkycjB1VVlwcVUzd2xN?=
 =?utf-8?B?anVnQkN0UmhKR3grMGJUWFVsUVZlQTlHYzB6WDQ2U1RzUnZBZjExSmJvNHVT?=
 =?utf-8?B?MjlaMkRFMHJmWDNBZURMQ2tjNmJrUnU1Q0tBbXZsTFNydjdzMDlMVkFsOG50?=
 =?utf-8?B?SzJTam1FOU96djgxR2RGdkVmOU4wRlNkUU1XUUREV1VxQjgzdm1hTWR5RTlw?=
 =?utf-8?B?UEdNM3VYOHR3aUJGcWhMQlY4Ukx6bzAzRDVFVjhhUEh5WGs3L1poS3V4cW9K?=
 =?utf-8?B?Y0Vxd1hlN0oxY0k1YjEvZHNIWjREUFNaL1hTbkt6bkJiY2NOQkY0a2I3cWJl?=
 =?utf-8?B?eWtGeFBXSy9CNHVlemVWM085SXlpZStadkdLYzlyOTJPbVdHREdidFhoMjhs?=
 =?utf-8?B?TUJPcVlvVFh6R0NTY3hCZUZrNHFTdlVJQ3o4N3NxSmwweWplblRkazJGS0Fr?=
 =?utf-8?B?NkFlamJyOExkWXBZVHZENnJmN0twcmpaQ0dHL3VrTXlDSjJXQ3NYTXVGS3do?=
 =?utf-8?B?R2p2Y0EwdzRFOGF1Z3dhazhyV0tWT05pVlM1Vm0rOVFycVdMT1pRZ2VxRG13?=
 =?utf-8?B?bE9JcjEwQjFJdjFKbnIxNEpwL3FGYUNBbTNNVERyQmVnOE1mNWpqR3h6ZXdT?=
 =?utf-8?B?MThCSmFNMDBpR0JFL29TMU51dnVzcTFuKzQ0RHd3T3h1UDVXdlA3QnFJY2tw?=
 =?utf-8?B?R1hRcVNuT1hpcWhuWGpmQmp1bjZHYlo5R1ZkWTdtdVVQNDZSL2tUei9IekRD?=
 =?utf-8?B?emlXYVlDZ2hWSnFyRWE3Ni9nR2ZuN1dZR3NGdkNNWEhERG5JUGZ5Q1lNMHpl?=
 =?utf-8?B?enY0eW9xUm1CWjdvQnB5NUMwNGQzUkc3cXFVaGhVc01wdFhFenlwWWZpdFdl?=
 =?utf-8?B?K2JNRW1HdjZFWWNYbStYRDJDWGl6SWUyNGp4bDk4MjllOExmT0NWREdvUjVz?=
 =?utf-8?B?VFhtK2d3WXN6RElWMFhCbTVPRGZ0cE82bFA3dS9teFdvdFVuUUpzYkdZaWZa?=
 =?utf-8?B?VGlrY21GZjAxSm5nYU1CSEJxNlV4dDZnOHJRN0RxNFNKNkh5ZVR4a3BUQ0VC?=
 =?utf-8?Q?YrcTGo4AcAdn4+UKecwrlVfB3qJSC7AMK9wvYtu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f614b2ff-4a03-4011-6fd7-08d8cc4f563b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 16:33:59.6244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f8q98QUpiok1p6l252ElplFY4dXvPSIL7x5iDHEzpm3VjOzrJdkXfbL9eyPgh+tOcaAP5VKwXTYpRhA9oskwTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5084
X-OriginatorOrg: citrix.com

On Mon, Feb 08, 2021 at 02:59:55PM +0100, Jan Beulich wrote:
> On 08.02.2021 14:19, Roger Pau Monné wrote:
> > On Mon, Feb 08, 2021 at 12:22:25PM +0100, Jan Beulich wrote:
> >> On 08.02.2021 10:38, Roger Pau Monné wrote:
> >>> On Mon, Feb 01, 2021 at 01:43:28PM +0100, Jan Beulich wrote:
> >>>> ---
> >>>> Since CPU0 reads its TSC last on the first iteration, if TSCs were
> >>>> perfectly sync-ed there shouldn't ever be a need to update. However,
> >>>> even on the TSC-reliable system I first tested this on (using
> >>>> "tsc=skewed" to get this rendezvous function into use in the first
> >>>> place) updates by up to several thousand clocks did happen. I wonder
> >>>> whether this points at some problem with the approach that I'm not (yet)
> >>>> seeing.
> >>>
> >>> I'm confused by this, so on a system that had reliable TSCs, which
> >>> you forced to remove the reliable flag, and then you saw big
> >>> differences when doing the rendezvous?
> >>>
> >>> That would seem to indicate that such system doesn't really have
> >>> reliable TSCs?
> >>
> >> I don't think so, no. This can easily be a timing effect from the
> >> heavy cache line bouncing involved here.
> >>
> >> What I'm worried here seeing these updates is that I might still
> >> be moving TSCs backwards in ways observable to the rest of the
> >> system (i.e. beyond the inherent property of the approach), and
> >> this then getting corrected by a subsequent rendezvous. But as
> >> said - I can't see what this could result from, and hence I'm
> >> inclined to assume these are merely effects I've not found a
> >> good explanation for so far.
> > 
> > I'm slightly worried by this, maybe because I'm misunderstanding part
> > of the TSC sync stuff.
> > 
> > So you forced a system that Xen would otherwise consider to have a
> > reliable TSC (one that doesn't need a calibration rendezvous) into
> > doing the calibration rendezvous, and then the skew seen is quite big.
> > I would expect such skew to be minimal? As we would otherwise consider
> > the system to not need calibration at all.
> > 
> > This makes me wonder if the system does indeed need such calibration
> > (which I don't think so), or if the calibration that we actually try
> > to do is quite bogus?
> 
> I wouldn't call it bogus, but it's not very precise. Hence me
> saying that if we wanted to make the problematic system seen as
> TSC_RELIABLE (and hence be able to switch from "tsc" to "std"
> rendezvous), we'd first need to improve accuracy here quite a bit.
> (I suspect sufficient accuracy can only be achieved by making use
> of TSC_ADJUST, but that's not available on the reporter's hardware,
> so of no immediate interest here.)

Right, TSC_ADJUST does indeed seem to be a better way to adjust TSC,
and to notice if firmware has skewed them.

> 
> >>>> @@ -1719,9 +1737,12 @@ static void time_calibration_tsc_rendezv
> >>>>              while ( atomic_read(&r->semaphore) > total_cpus )
> >>>>                  cpu_relax();
> >>>>          }
> >>>> +
> >>>> +        /* Just in case a read above ended up reading zero. */
> >>>> +        tsc += !tsc;
> >>>
> >>> Won't that be worthy of an ASSERT_UNREACHABLE? I'm not sure I see how
> >>> tsc could be 0 on a healthy system after the loop above.
> >>
> >> It's not forbidden for the firmware to set the TSCs to some
> >> huge negative value. Considering the effect TSC_ADJUST has on
> >> the actual value read by RDTSC, I think I did actually observe
> >> a system coming up this way, because of (not very helpful)
> >> TSC_ADJUST setting by firmware. So no, no ASSERT_UNREACHABLE()
> >> here.
> > 
> > But then the code here will loop 5 times, and it's not possible for
> > those 5 loops to read a TSC value of 0? I could see it reading 0 on
> > one of the iterations but not in all of them.
> 
> Sure, we can read zero at most once here. Yet the "if ( tsc == 0 )"
> conditionals get executed on every iteration, while they must yield
> "true" only on the first (from the variable's initializer); we
> absolutely need to go the "else if()" path on CPU0 on the 2nd
> iteration, and we also need to skip that part on later iterations
> on the other CPUs (for CPU0 to then take the 2nd "else if()" path
> from no later than the 3rd iteration onwards; the body of this of
> course will only be executed on the last iteration).

Oh, I see. Then I think I have no further comments. If you agree to
adjust the cmpxchg please add by R-b.

Thanks, Roger.

