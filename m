Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A5932D060
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 11:07:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93082.175710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHkrx-0002dX-NC; Thu, 04 Mar 2021 10:06:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93082.175710; Thu, 04 Mar 2021 10:06:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHkrx-0002d8-Jt; Thu, 04 Mar 2021 10:06:09 +0000
Received: by outflank-mailman (input) for mailman id 93082;
 Thu, 04 Mar 2021 10:06:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zd52=IC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lHkrv-0002d3-8U
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 10:06:07 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 612a3535-eef4-4aeb-8cb0-7f4419e93864;
 Thu, 04 Mar 2021 10:06:06 +0000 (UTC)
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
X-Inumbo-ID: 612a3535-eef4-4aeb-8cb0-7f4419e93864
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614852366;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=h4en8N1TlkvCuQbtkvFwBfG0XeJRSLF8028ytPJkADQ=;
  b=Yp6W5hHfTtB1ZfL0UmwSx4oCDX0rPZ4ZYd6QE53VWyWNpBD9OTas4TzB
   wAqw+PwTpWJOLTnuTnhabdowYIfjZ9OleXeFAEgXb1ma7KqGhu6Ln72jN
   D3E+3Zu/DQF/9/IwRwGN8tI1h4/BAzaCDSDcSMpWMIxZO1znrEAs/kIx3
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GGv6lxoxgfneJ55/vwWZpT08loLatW1spWwcI4PxfjWfo021kosvozYae5L4Gxa28IwIcUBs7M
 iK1PhCfyWgSzV6iuF0QTK7KAC3erF1uZpcPSzVi117khqdwj0XUkYZhOxCFyQBDhe9e6ZEFMx9
 P5fJ9YR5ESj8fmKcewoUPkrW7FA8WYjKjHQGfiuykJjATKG0a2fFnmsIYvkQrXFpP3g0vSENdX
 xIOJoVewr7vJqDw4yYDQSrn+Eh/7beIYG0HSx92B3ZEQn2tkDMywzk4hI8DkQOm6SXBCoTBBvI
 sPA=
X-SBRS: 5.2
X-MesageID: 38508494
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,222,1610427600"; 
   d="scan'208";a="38508494"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKcFrz+2w41voW3zxlX536tGiCTBM2mvjUCeLy8VCRZgA7zxw9G9GZiT/r/OAkx/pbbXSHIPkVGtaqzpr3RY947zAHjAGIP5XsqdQfqVzudmHR0XFFoPsmSpj7hoWTVzkffExXsORmrc6Wosx6ZhKSlXeyZZxmyq9c2B1ArlJikQtPw0I+vqjm+QHTAq/S61Sj9my9CQoZIvW9HxDJris5JNz6niEgHcCX7wqFTL8N6OtjTsmH4NFsCk+Wp9lOd6EexE2mh5H+m+gqVlAm/gQuVduCZD6AMbKlTS+M8Njl9mpHdvnNXAfpo78caQd0b2WcYveoo70GiV18AZ3a3qOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fsWI6E6O7DgltfOR5/kTLyqGBQLV+JN0brcn3DTcow=;
 b=AP4ThztIM9RkEvHIgzfE3RC898SxyY4UQnK2QuegoFKNsf7zh/CPYa6qrRUGxifry5d+u2+omZRBZaZptEqq6lcBsoa79A2K1D378kHXWX/xBKnZ5ogIOuTfhGrVpKhtZtR34f5z1lfj/c9C3d+yZ0LKO5b5zv77joDIHAuBuy8U5E7hG1Kh5zom7jtVaR3jyP8LoSahAuU17lajrnSTR/cJZoYIgncQse1t23FMQkRMGvUBHG7to2ukHPkD2R5ZHlyTsGCBPqj4MUhCXJeutL3Turh1EBDeS5FU2xyPtA8H+519TNlc66fLgt92W14BJ1N1CYm38J0Cpjy7LE7YnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fsWI6E6O7DgltfOR5/kTLyqGBQLV+JN0brcn3DTcow=;
 b=lwei6la2aKCmAWrSDNMFutsr5JvqsOF6b0mU6PFUhZsKj/aST8gELy6jzHy8lPFPJdzDNk2cWXpCP2lI71yImIZ7f/1MDbujun3FtIgeNpZPEbY7b/cqNvOXD0FmrHV4dFDQ12ObdQuFQMp49TeaT62EQUl9HE4v6RyfJPZUCdo=
Date: Thu, 4 Mar 2021 11:05:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [PATCH RFC for-4.15] x86/msr: introduce an option for legacy MSR
 behavior selection
Message-ID: <YECw+LsG17x8Jxev@Air-de-Roger>
References: <20210301162357.76527-1-roger.pau@citrix.com>
 <bfd185bf-489f-d858-c459-7630cbe7b462@suse.com>
 <YD5TBSwZWzjlwGxD@Air-de-Roger>
 <62be2084-e5fa-e439-8426-6d129a10c379@suse.com>
 <YD+teWWbeu0XDhqm@Air-de-Roger>
 <e84e84f6-8bc3-6a62-53f7-bf309fafa436@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e84e84f6-8bc3-6a62-53f7-bf309fafa436@suse.com>
X-ClientProxiedBy: LO2P265CA0392.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07e57b7d-1e63-492e-e3ca-08d8def51673
X-MS-TrafficTypeDiagnostic: DM6PR03MB4603:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4603088F093D8E8F277566A28F979@DM6PR03MB4603.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YquV0VxJjTDRddoj25BUaQuh3KmMzJG84MIZ6uhjrQzJKYdiD9GbWk+2KH0gHK0VvAPuCSfBsX+AqQW0QJrq9H4UuPoZUKHA24Y4MQX9Y+3VLsCkr3pW6n5fsumnIGZVTi6obBnVEyp3The7hnRtCSsHb/Qt6/I6nTlt9CWg46fr1OwDtsbz1Xy2xT6/kK3LhHGJUPHlZtLNaJeLjZd178BRjAM1UQDCXii1opwIxlUrWhwKM+a5J6fObTzS3XiKHHziqJrDHMTocXWEoHsOPee7ZEAXXbrI0B7UpDD7OmListQ1NIXxzTvGOKOFX626oOurjjy/c3MJ/EMysJitlIe5hCwk7J8H3he3x0scgNt1qIljKVE6ZOjAeyXJSPCltrtoC+AfAfy1+WlMH91x2prmjyPx6/p5KlphmQE9dr1w0dBaARrbhWP0sSv0glUORjaePrP9td9skzaSKj9DHpS5xh53UfaGt8TtPkAmPlcogNrtztbVbO4CYYZ4LuIyVW8vRs4aNIquhoGVNiiqdwHYUd334dBvVmsauvm83aO5IoJh925/PbBf55eeG/jS40ZKmDDyDPU7qLYMDIWFPfS8Ilocty1aXkHPopxcNpMVo+I475omC+YMKemwpqgtwAevNmTBttLpB9O6qSdQyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(16526019)(6666004)(33716001)(316002)(8676002)(186003)(478600001)(6916009)(966005)(85182001)(956004)(26005)(54906003)(86362001)(2906002)(66556008)(6486002)(53546011)(6496006)(5660300002)(9686003)(83380400001)(8936002)(66946007)(66476007)(4326008)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MXRmTTc3UzRWRm05L0gxeHVxdEYvU1hLMGV4UHlTM0RZMEFydEQzZ3NxbFdr?=
 =?utf-8?B?UUs0c0tMcFAyZmhXRTRHalFtcGRoeHRRYW9zNGRTZ2JXYmlaL2VtYXZ2TnRt?=
 =?utf-8?B?R0FCamhXYTN1NndBMGV3dmNEYnVYMG1renpIU0p3d3ZBN2lVWEl2a0IrcmJj?=
 =?utf-8?B?TmlhWGJMV2c2a2JLWllCMHhaTkZNYWRlTVZNeDRzT0RzbHAwNW13SDFpbXc3?=
 =?utf-8?B?ZSt1bXdXek9DZDJnM0tuS2s4S3NQRStwUkg3djNpbFF4WTRSeVdybDUyTkJE?=
 =?utf-8?B?VzBNeHh4TFFVOElIYy9uTEQ5Zmh1T0hLMXRNa0JhMzdaTW9peUJ1MmdiZkxx?=
 =?utf-8?B?aTZObFZOQWN6eHRkRmZIZXNMQkdLQXc0U0JTbS9TL2MzZFVLSXdpR3loWTFD?=
 =?utf-8?B?UWg5Zk9ZOUVZWXk2TzJrMlV0dkZ6MHNaUjBGbnlUaC9jLytLS2V2NUZJczVi?=
 =?utf-8?B?amNYbkwrTE1Ed0x4OWFaY2I4Qzc1L0g2cEFtNFJFb1pVQm1VVm1VNmIzTEJJ?=
 =?utf-8?B?am9MVmhIdVFPOEpzSHVmRHVyQ3Jtby8weEd2TDJyWVp2NVNiSEV1WWR1ZVV1?=
 =?utf-8?B?QTlqVkpDSWNOTlFReEhtbW11QkRpR0lJcDZ4MksxZUVMWWJsVWcwdXlKYjQ3?=
 =?utf-8?B?UHZIalF3ejFBRGlRYW90VzhvT3NlOFR6V3dqZlNqbzZjQlFpYnVIRHV2bm5Y?=
 =?utf-8?B?R2kzOEp6OTNpQ0J2TUxTMytpUWJZZWdFazNxL0JyNDUvZ2xpTGdadXBPR0lI?=
 =?utf-8?B?WXN2V0hxNXB0T0dML2FnZ08wMzgvNk9OYmprd05iQnFYUVE0NDY0ZFQvemlL?=
 =?utf-8?B?WE9jN0ZhM00wb3BmVGhZYnlTTW9teTVRSDBXVVJBMVdJNnFJclRzVDAwazNq?=
 =?utf-8?B?UEZocHIycGhkUXJRZlZDbDN1QWgrMW9ja3VTWGJtR1hlMEovV3hYQzVta2JT?=
 =?utf-8?B?RGFCR0o0RmtHWVE2V00zQnRKamVPaUxOUFlma2drcExEK3hXZ0J5TXdmUHNU?=
 =?utf-8?B?Wlc3L2M3dGtPKzlPTW1OV2tUdGNNSjBFNVkxMkFOVU1SVzdjdEdEdXJ6Z0xR?=
 =?utf-8?B?MlhpdDFPTVJjNzEwQjRtQ25adExQaGplSEVvVUQxTzJmcUlRVkNodmM1Rlk0?=
 =?utf-8?B?aFp1UU9UaFQwdUVwaW5lSERyRG5yWTJQSzRNZUdvMVIrdlVlRjlTU2l4Mkg4?=
 =?utf-8?B?eU1rNGJ0eXVlbEwwc2ZwNlNPV0V6Wk1sSWFBQ1N6NjFRSC9YbHJsbmFJT3VR?=
 =?utf-8?B?V3hoVWN6ZGdRRDkrMHNGaTl4MUo2bVJaTS80UFpieGZWaEFWa3B3NEpNRmVr?=
 =?utf-8?B?S0daamM1ZHF6VjdJakFXSGxjSVY3Y2QrSzBhY3BhVEJTdmtxU2Q0VUxoREFj?=
 =?utf-8?B?YlkxaDgzQjQxT1BDSHBQZmdhaVcvdEFyM0U2Z2FGMEV1RU9Qc0xSbENlUUkr?=
 =?utf-8?B?akt2d2YxMm1jaVV3c3IyNkF3Q0NyL3lmdnorS0FzaFFhL1lUZVdqSjB2Z3Ju?=
 =?utf-8?B?dmhMTVg4bkNrQ1VMbGNINHVJVDRxMXRCZXFnWWFUN1BqSHdMVnYxUkJaTUNt?=
 =?utf-8?B?TUlWcmxkRGxlUGpPZzJiNGRQb2VnMldnWGsyZEtORi9sTXYra0hEVWdXQkty?=
 =?utf-8?B?OGtJSUwzUlRHYUlON2QvSDg0OHFTL2trUURFOURLS2ZhbU9xdlAwb2YveEQ3?=
 =?utf-8?B?VjVOY1JmUk0vSk81WkZrV3J1Z1lLN0l4V2xYTnNtd0RQMjNiendVcG4xRjNx?=
 =?utf-8?Q?Q+wArj2m1QIi7GExjiFGSeNvIYOb7FbDVBEIVca?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e57b7d-1e63-492e-e3ca-08d8def51673
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 10:05:49.9834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QLuJQJF7n2ERXqLAqoS3YneHiTaByyMYkjA8VUeGzZux9aza/rb90xuUcGt3yFLbgGToukb01fT0qFtBkanRgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4603
X-OriginatorOrg: citrix.com

On Thu, Mar 04, 2021 at 09:48:25AM +0100, Jan Beulich wrote:
> On 03.03.2021 16:38, Roger Pau Monné wrote:
> > On Tue, Mar 02, 2021 at 04:18:59PM +0100, Jan Beulich wrote:
> >> On 02.03.2021 16:00, Roger Pau Monné wrote:
> >>> On Tue, Mar 02, 2021 at 12:16:12PM +0100, Jan Beulich wrote:
> >>>> On 01.03.2021 17:23, Roger Pau Monne wrote:
> >>>>> RFC because there's still some debate as to how we should solve the
> >>>>> MSR issue, this is one possible way, but IMO we need to make a
> >>>>> decision soon-ish because of the release timeline.
> >>>>
> >>>> Generally I think it would be far better from a user pov if
> >>>> things worked out of the box, at least in cases where it can be
> >>>> made work. Arguably for Solaris this isn't going to be possible
> >>>> (leaving aside the non-option of fully returning back to original
> >>>> behavior), but for the old-Linux-PV case I still think my proposed
> >>>> change is better in this regard. I realize Andrew said (on irc)
> >>>> that this is making the behavior even weaker. I take a different
> >>>> perspective: Considering a guest will install exception handlers
> >>>> at some point, I continue to fail to see what good it will do to
> >>>> try to inject a #GP(0) when we know the guest will die because of
> >>>> not having a handler registered just yet. It is a kernel flaw,
> >>>> yes, but they ended up living with it merely because of our odd
> >>>> prior behavior, so we can't put all the blame on them.
> >>>
> >>> My concern with this would mostly be with newer guests, in the sense
> >>> that people could come to rely on this behavior of not injecting a
> >>> #GP if the handler is not setup, which I think we should try to avoid.
> >>>
> >>> One option would be to introduce a feature that could be used in the
> >>> elfnotes to signal that the kernel doesn't require such workarounds
> >>> for MSR #GP handling, maybe:
> >>>
> >>> /*
> >>>  * Signal that the kernel doesn't require suppressing the #GP on
> >>>  * unknown MSR accesses if the handler is not setup. New kernels
> >>>  * should always have this set.
> >>>  */
> >>> #define XENFEAT_msr_early_gp   16
> >>>
> >>> We could try to backport this on the Linux kernel as far as we can
> >>> that we know it's safe to do so.
> >>
> >> I too did consider something like this. While I'm not opposed, it
> >> effectively requires well-behaved consumers who haven't been well-
> >> behaved in the past.
> >>
> >>> If this is not acceptable then I guess your solution is fine. Arguably
> >>> PV has it's own (weird) architecture, in which it might be safe to say
> >>> that no #GP will be injected as a result of a MSR access unless the
> >>> handler is setup. Ideally we should document this behaviour somewhere.
> >>>
> >>> Maybe we could add a rdmsr_safe to your path akin to what's done
> >>> here?
> >>
> >> Probably. Would need trying out on the affected older version,
> >> just like ...
> >>
> >>>>> --- a/docs/man/xl.cfg.5.pod.in
> >>>>> +++ b/docs/man/xl.cfg.5.pod.in
> >>>>> @@ -2861,6 +2861,17 @@ No MCA capabilities in above list are enabled.
> >>>>>  
> >>>>>  =back
> >>>>>  
> >>>>> +=item B<msr_legacy_handling=BOOLEAN>
> >>>>> +
> >>>>> +Select whether to use the legacy behaviour for accesses to MSRs not explicitly
> >>>>> +handled by Xen instead of injecting a #GP to the guest.  Such legacy access
> >>>>> +mode will force Xen to replicate the behaviour from the hardware it's currently
> >>>>> +running on in order to decide whether a #GP is injected to the guest.  Note
> >>>>> +that the guest is never allowed access to unhandled MSRs, this option only
> >>>>> +changes whether a #GP might be injected or not.
> >>>>
> >>>> This description is appropriate for reads, but not for writes:
> >>>> Whether a write would fault can only be known by trying a write,
> >>>> yet for safety reasons we can't risk doing more than a read. An
> >>>> option might be to make writes fault is the to be written value
> >>>> differs from that which the probing read has returned (i.e. the
> >>>> same condition which originally had caused a log message to appear
> >>>> in 4.14 for PV guests).
> >>>
> >>> Read values for unhandled MSRs will always be 0 with the proposed
> >>> code, so we would inject a #GP to the guest for any write attempt to
> >>> unhandled MSRs with a value different than 0.
> >>>
> >>> Maybe we should just inject a #GP to the guest for any attempts to
> >>> write to unhandled MSRs?
> >>
> >> ... doing this would need to. Iirc I did add the write side of the
> >> handling in my patch just for symmetry. I'd prefer handling to be
> >> symmetric, but I can see why we may not want it to be so.
> > 
> > Kind of in the wrong context, but I will reply here because it's the
> > last message related to the MSR stuff.
> > 
> > Jan: would you be fine with modifying your path to not change the
> > behaviour for writes (ie: always inject #GP to the guest for unhandled
> > accesses), and then add a rdmsr_safe to the read path in order to
> > decide whether to inject a #GP to the guest even if the #GP handler is
> > not setup?
> 
> I don't mind as long as it ends up making things work (I have no
> reason to believe it won't). I'll give that a try.

Thanks. I think this behavior would be a fine solution for PV guests
because:

 - It's unlikely we will see any new ports to x86 PV mode, and hence
   we mostly need to care about the existing ones which we already
   fixed in new versions, so this behavior is not to be propagated.
 - The Xen PV architecture is already different from the x86
   architecture, and hence we can slightly bend the rules to our
   liking.
 - It's not feasible for us to figure out what MSRs older Linux
   versions tried to access without having a #GP handler setup. Not
   sure whether this also affects NetBSD.

I would like to suggest to introduce a comment to document this
behaviour for x86 PV in the public headers, but I'm afraid I cannot
find a suitable location.

> > I can modify the option introduced on this patch to always inject #GP
> > on unhandled writes and only inject #GP on reads if the physical MSR
> > access on the hardware also triggers a #GP. HVM guests with broken
> > behavior will require having the option enabled in order to work,
> > but I think that's likely OK as long term we expect all HVM guests to
> > be well behaved.
> > 
> > My main worry with this approach is that we end up requiring half of
> > the common HVM guests OSes to have the 'legacy MSR handling' option
> > enabled in order to work. I think it's unlikely for this to happen, as
> > we are only aware of Solaris requiring it at the moment.
> > 
> > It also raises the question whether we will allow any more exceptions
> > to the MSR policy, like we did for Windows and OpenBSD in:
> > 
> > http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=ca88a43e660c75796656a544e54a648c60d26ef0
> > http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=4175fd3ccd17face664036fa98e9329aa317f7b6
> > 
> > Or if we are just going to require those guests to enable the legacy
> > MSR handling instead.
> 
> It is my understanding that Andrew's view is that adding such special
> cases is the only acceptable thing. As voiced before I don't share
> this view, as it means we're going to be entirely reactive to people
> reporting issues, when I think we should be pro-active as far as is
> reasonable. Independent of any pro-active measures there'll still be
> enough reasons for reactive changes - for example I assume Linux
> would now issue the log message from
> 
> 	if (cpu_has(c, X86_FEATURE_CONSTANT_TSC)) {
> 
> 		if (c->x86 > 0x10 ||
> 		    (c->x86 == 0x10 && c->x86_model >= 0x2)) {
> 			u64 val;
> 
> 			rdmsrl(MSR_K7_HWCR, val);
> 			if (!(val & BIT(24)))
> 				pr_warn(FW_BUG "TSC doesn't count with P0 frequency!\n");
> 		}
> 	}
> 
> since we surface a zero value right now (but I didn't verify this in
> practice yet).

I think we inject a #GP to the guest if it tries to access
MSR_K7_HWCR? As I don't see this MSR handled explicitly in
svm_msr_read_intercept. So Linux would complain from the unchecked MSR
access and the MSR value not having the bit set.

This one seems like a fine candidate to implement in
svm_msr_read_intercept, because Xen needs to return a specific value
for this MSR.

Regarding the global approach to fixing the fallout from the MSR
policy change, I don't see why we couldn't do a mix between pro-active
and reactive.

I think we must have an option to fallback to something similar to the
old policy for HVM guests so that users have a way to get their guests
running after an update without requiring a code change.

That doesn't mean we can't reactively add the missing MSRs as we go
discovering them. I would even print a warning when using such
fallback legacy MSR handling option that you need to report the issue
to xen-devel because the option might be removed in future releases.

Does the above seem like a sensible plan?

Roger.

