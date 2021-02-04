Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F06030F12A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 11:48:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81230.149698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7cBP-0007B9-H8; Thu, 04 Feb 2021 10:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81230.149698; Thu, 04 Feb 2021 10:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7cBP-0007Ak-E1; Thu, 04 Feb 2021 10:48:19 +0000
Received: by outflank-mailman (input) for mailman id 81230;
 Thu, 04 Feb 2021 10:48:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YP8j=HG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l7cBN-0007Af-Ak
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 10:48:17 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ae49649-cb8f-45a9-9cf5-67330b142d6f;
 Thu, 04 Feb 2021 10:48:16 +0000 (UTC)
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
X-Inumbo-ID: 4ae49649-cb8f-45a9-9cf5-67330b142d6f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612435695;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=YZ5jaHuvxJMWRhh8dTRMp41b5389EhRwtULzrdCF8cI=;
  b=WWkYKj+yro5rfZrGZ+iTEbh+Y0ioTRHR3dGpX9Jhp52DbJHy945Rm0a3
   /MO5ySU5HYiZjxt+a7Aos9eu3Ul1oZ5BYQTlJdc9IsgTERQO/zKqNZ6IS
   6aApmbCNv3RM4LD4RDj+6E/2qdVldzSIXudcLA4wJCdTlWaki0n5Cvkch
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: z6PTq0dhPH8pBPi1dLnC5vRBrvTNK4wgnYjP8WFO9zjNmqMAYwZmACVYBxsakNAv+dEGxidaWF
 5UTqbsnEuTCmorerPcGD9V6GXxzfIZ1QHueu1sx0cChnwJrhCgbe9WJ2eOHvZFAKHcKWNtvQWx
 /pEbHGOl45vFeXInREzHTArFyb44+o0JfFQyeS/HdU2mVaQSHd3JA3dnt4JwWtJaI8S5nqv4m7
 cJvADIpPIP3+HDDDhOWg21zo7v6SlMLWpWKNEY3azcnC4Zta1nS24wU8t9CnKDm5ytlIxcF/H2
 /i4=
X-SBRS: 5.2
X-MesageID: 37880706
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,400,1602561600"; 
   d="scan'208";a="37880706"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STjRF+LbkoUCpnv8Fki8bBlgAE/XUW5DRgubGXaZe2V6s8Cwh88XeHJF74PCWFOU6U7Y9rpOyw6lNyJOUbNjWrwDyl4LEpS4fMXvnhpOnfbVSxGJjGQBUJIopF6uKYldqdEveHZHsuZHqjgqboIIxf6DWjN3qUwmL9z2S8pNQFfraC11aNHlqa+M+oXFPIrT2EsxOlefnWkjSDrFG1cxeVES0A6j2bcN20PAy8Pzdj9VToIpoa7CqF1aOuI4+YOs4BhmRe7npiujJtcDm6l9XH+ZHwuN/Or07iFNLA0MWOiTzawUneaP/3l9YyfGM2U/BYtIDpy0t7DHkjuLX1gRBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DCLPw0EZVdmn6tpWD9PAmPRAJ5PBP0XB9YN0Xc3Qwc=;
 b=NwumBXOWBqIhQcerh3lPwQCbMxeHJXZnrTKRacc1C85h8XC/3yLFu79SHffPqy3MMBxkwd5Lq6CWO4Q+aWlbvNNZBqeW4gHh0jE+sYxKFlbhxtnH9AhEI5RDBJEA0HXQb/XKauzEocuqVxj68Hxk8nsWt2U6j04GScFxY3C8yRlCFSPBv9hPAejf3oMAYYu4EgTF/1DYhzDzPhRvczzL066tgUd5xqmqlWOrEqt5qLShA/XbvzakOUlYRu/wffviwfKgv1wTRNv0hq8kJ0SqOOdZAGZORaMc6QZiWcs0lxEIXThxwvNLihigRuT2pKsWDVyL9XjxGWFdMa54b07zZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DCLPw0EZVdmn6tpWD9PAmPRAJ5PBP0XB9YN0Xc3Qwc=;
 b=f7R91ftlH/reuFR5arpuoPFdLllxQaBQPyAT9GeSyWt6Ew8RaCeHtn2YEv4Oz+9ei9oPCZhw7yrVRMNUCbHENptyuQ0MOg9pXN875xug5HDJglP2vMUmhDO/Jn+C/ANxr9+lfmioMGwN/mIVPvl2F6qrP6F19uzppqVwsnS9GSE=
Date: Thu, 4 Feb 2021 11:48:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.15] autoconf: check endian.h include path
Message-ID: <YBvQ4/mFiiVJNvaA@Air-de-Roger>
References: <20210204093833.91190-1-roger.pau@citrix.com>
 <26522f21-4714-c29d-5ca4-baf012c51ac8@suse.com>
 <YBvFbbnje+Dt7CfD@Air-de-Roger>
 <0e3576d3-4565-9898-e954-4a888b21d92f@suse.com>
 <YBvKwNiIopKKZx/F@Air-de-Roger>
 <10e334fe-eb02-e771-8404-cbcda9534383@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10e334fe-eb02-e771-8404-cbcda9534383@suse.com>
X-ClientProxiedBy: AM6P192CA0077.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a18a994-ab21-4ac8-d95f-08d8c8fa5c9a
X-MS-TrafficTypeDiagnostic: DM6PR03MB4057:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4057C306A2E5CC3BA5EA7C2F8FB39@DM6PR03MB4057.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SJ4lJWIa9VJtbX4K7sfj2L7VsQdPVavCd4qmx3qWslXttbUjLtpyrFcEk6AFfCgn90BhL726hO+nP96pqRWq2lPUuEadYJFAf4fzua3TEQauRVCIbi1iYwZwWRRs4YfeR7STTBFwV8RcP5V5QUleOCP1H647+KThVdzh6WOXfkaxRMZX3cCklubK7Rd+R9DfBT6mdlc9J9TFcCIHDGl5WN2AY5Pyrwe4qVRsqyRiARUBhsRNZjA5PV5BKqDFDsECoJI3v6VABJzZyap6acQfD2YgI36PEqzH05V55wgvA3jTtEwoi5ANlwn5IqxFlq54FU+NK3w2M97kb9eV7PnQYLU5Kd40NU0yVmqYKhGyogwsIgeYGI0rTPpzLysqBr621EkyYLQS5Tre+6GOHxO5Nb8vnboCaF7gGpJ/BvuUuRq7dWcqjgUtQUdG0ohxFTUavrkGfSpe/K2TMqOnn3wZwni7sLayGCouVAIM9QnVin2wNIATk3IOQrRllsTIr6utj/cHS/+mHQ/XeSVdpD6N4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(39860400002)(396003)(346002)(136003)(376002)(16526019)(186003)(26005)(66946007)(6496006)(66556008)(5660300002)(54906003)(316002)(53546011)(33716001)(8676002)(2906002)(66476007)(4326008)(6916009)(6486002)(83380400001)(956004)(8936002)(85182001)(478600001)(6666004)(86362001)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aU1TQXdEeWtiNTNVblVlbW5VRFBQWXBwWi9DVkxBbkJyaVlIVkJhTk9SRG1R?=
 =?utf-8?B?SXp5Zy9XR2lSSkZCSjloMWt2Um9HR1ZGWTJzNVhSbVovSmVHSDF1Rm9yODEw?=
 =?utf-8?B?YkQwMDV5TmdQa0pDWEdIV2lTc01neS96clkvTzVHd0xjS0Zya0tqYVVaZGln?=
 =?utf-8?B?cHh6bXJFNm1VYy9lL0FjeTZybU93Y2JXSG1wZENpSnl2czhYRFNDUU4yb3cy?=
 =?utf-8?B?Y2Y5ZDFCbVNiQlBraGUyUm1QNW1PYVlCWDI2SnZaZjFHNmFRQlRrdCtlcXVD?=
 =?utf-8?B?YTF1clRtMFltdksxU0RNS2NybUNTMTZWZk53Njd5UU1MOXZ0a2o0dGYrTHZT?=
 =?utf-8?B?VS9UVC80dDhjSmo5TVNYRkV2MGdZMHJ2blRmaElZVmFjSnRyc2xvUldnaGha?=
 =?utf-8?B?L044NnhUbjRSNUVyall4QnNjelc4cVNGbWVRTVdEL2RVOVBrTnMyZnFRTE51?=
 =?utf-8?B?dnZkOWdNeXlxUSt2TzJGTnFuRlJFcDY5eVJEQUxXZGdnMFRGaEhIeVFodUlt?=
 =?utf-8?B?Z1FYT3lpMmZPbSswaVozcXVPeXBVMVFFN1o3YUU1NWRhdW4xWGEzY3VQZXhn?=
 =?utf-8?B?bVB6RThGYWV4dVV1YzVNSloxL2tkSW5jK0lCUStLeVh0Um5ncUdESHVycURn?=
 =?utf-8?B?WWVsTEpTRS8wTWhVK2lHZ3RvRHUzVmp2MlQ3TnpHVFRyWnpERm5oajRIOFFY?=
 =?utf-8?B?VmdUWDhQTVJtR3RpejFXWUVTajlUSlhxT3ZVY05YUVBZbVVDaUlGUUdhZmh1?=
 =?utf-8?B?WTUxUTFkblV5aTVudlluenM2bmFFcVZHZ1BHbXVCYVI3dG9NUWhIdWtRU0Ex?=
 =?utf-8?B?YVc5emR6SGV2cFpjU2hZS0lCZVZpU1ZkM1hTNXNxVHlxUmVlOUljOFEwTVM2?=
 =?utf-8?B?RWxHejRWQzV0dFBJNmQxd1NnQ2JWVjRHcThocXBoZCttcVRhd0ErUEVYbUE0?=
 =?utf-8?B?NVlCS05UU1kvZW11QUJwK05UanVhVnFYTFBGYVlxQW5MbVpUNXFRaXhsY29r?=
 =?utf-8?B?L0o5ZnhMTUt3TG9CVlJYZ1M3eEl1cUFtblNoV2dKZ09rNG9VelI4UEp5UTJG?=
 =?utf-8?B?VWQ3TjFGdFFVK1hzQjBrZVMvMEQ3ZEdqM2I5OE9BcnFrRjVHNFlTaTJCRVpO?=
 =?utf-8?B?c2RFczVYcElPUlovcW4wWEdWeDJiS0M0Z2hTejZQQytBSUF6QjBuaFVJSGdG?=
 =?utf-8?B?azh5UUFVa2lXOWJtVFUrU2ZCQ3dpLzY4cEQ1ZVUrUnRwblNYU0ZuMzZLTHZZ?=
 =?utf-8?B?NnEvb3VwY0J5U1FiSGZtdW94ZWIxSWp3TnkydUd4U2ZlQVJ4UE5wK015Wkdv?=
 =?utf-8?B?dWJaZENUMkFKYTB2cDdreVZGanpjclRBeXE3dmJNK0dLdUFmeHM2bmkzRUFZ?=
 =?utf-8?B?eDJWVWEyUGtMTzd1dTFZZ0hnK1RXUEZUU3I5cHQ0N2VXMnlCYWFFVzhYbGEw?=
 =?utf-8?B?dVhlZmFuUzM1WnRSejdjMTREcElURzByb1Bhdk9LdTc3MEowb2JVRm8xV3V2?=
 =?utf-8?B?S0dsYThuRkROQWFkWFl0ZnZwT0lEeGRPaXNHdnMvZC9xcEpxb0s1bTRTZDh1?=
 =?utf-8?B?bWExbVVLbCtxTklLSnQwYXVRZDYzbWlEWjh5MEp3cUpsMTVpOUtQdG5jKzZT?=
 =?utf-8?B?bmE0bG0xVHpWZEhMR2xYY0dDUjBjcTFLblZHSmUyVXVkNVhLTEVqTnJMOHNj?=
 =?utf-8?B?NUpCWHNHK2k5MUNrd0t3MTU5M0oxNkdRRVFzVzZnMmRXRUVKZ1F1NnBPZWVz?=
 =?utf-8?B?ZEZwaW9Mbm9TSnpkR2hYVXJVejQrSEVORzEyVDdQYkxDcnpubmt2OXNxWmRG?=
 =?utf-8?B?ZVpUUklPcmxTUk9YWnAzUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a18a994-ab21-4ac8-d95f-08d8c8fa5c9a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 10:48:09.5937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ss9b5K5AljyK98h0Uhf4C4/YvrjdupWw6M4D+LLrWHsShQVOzAKGMx/nNMBK1RvFJhqAFX46qTIkJmQE4OTUVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4057
X-OriginatorOrg: citrix.com

On Thu, Feb 04, 2021 at 11:32:41AM +0100, Jan Beulich wrote:
> On 04.02.2021 11:21, Roger Pau Monné wrote:
> > On Thu, Feb 04, 2021 at 11:13:43AM +0100, Jan Beulich wrote:
> >> On 04.02.2021 10:59, Roger Pau Monné wrote:
> >>> On Thu, Feb 04, 2021 at 10:46:58AM +0100, Jan Beulich wrote:
> >>>> On 04.02.2021 10:38, Roger Pau Monne wrote:
> >>>>> --- a/tools/configure.ac
> >>>>> +++ b/tools/configure.ac
> >>>>> @@ -74,6 +74,7 @@ m4_include([../m4/ax_compare_version.m4])
> >>>>>  m4_include([../m4/paths.m4])
> >>>>>  m4_include([../m4/systemd.m4])
> >>>>>  m4_include([../m4/golang.m4])
> >>>>> +m4_include([../m4/header.m4])
> >>>>>  
> >>>>>  AX_XEN_EXPAND_CONFIG()
> >>>>>  
> >>>>> @@ -517,4 +518,6 @@ AC_ARG_ENABLE([pvshim],
> >>>>>  ])
> >>>>>  AC_SUBST(pvshim)
> >>>>>  
> >>>>> +AX_FIND_HEADER([INCLUDE_ENDIAN_H], [endian.h sys/endian.h])
> >>>>
> >>>> Instead of a new macro, can't you use AC_CHECK_HEADERS()?
> >>>
> >>> AC_CHECK_HEADERS doesn't do what we want here: it will instead produce
> >>> a HAVE_header-file define for each header on the list that's present,
> >>> and the action-if-found doesn't get passed the path of the found
> >>> header according to the documentation.
> >>>
> >>> Here I want the variable to be set to the include path of the first
> >>> header on the list that's present on the system.
> >>
> >> I was thinking of
> >>
> >> #if defined(HAVE_SYS_ENDIAN_H)
> >> # include <sys/endian.h>
> >> #elif defined(HAVE_ENDIAN_H)
> >> # include <endian.h>
> >> #else
> >> # error ...
> >> #endif
> > 
> > I think having to replicate this logic in all places that include
> > endian.h is cumbersome.
> 
> Right - I would further encapsulate this in a local header.

IMO encapsulating in configure achieves the same purpose.

> >>>> I'm also not certain about the order of checks - what if both
> >>>> exist?
> >>>
> >>> With my macro the first one will be picked.
> >>
> >> And which one is to be the first one? IOW how likely is it that
> >> on a system having both the first one is what we're after vs
> >> the second one?
> > 
> > Not sure, but the same will happen with your proposal above: in your
> > chunk sys/endian.h will be picked over endian.h.
> 
> Oh, sure - the two points are entirely orthogonal. And I'm
> also not certain at all whether checking sys/ first is
> better, equal, or worse. I simply don't know what the
> conventions are.

I'm not sure either. For the specific case of endian.h I would
expect only one to be present, and I think we should first check for
top level (ie: endian.h) before checking for subfolders (ie: sys/), as
top level should have precedence.

I really don't have a strong opinion either way, so if there's an
argument to do it the other way around that would also be fine.

> As a result I wonder whether we shouldn't
> check that the header provides what we need.

Right, that would be a step forward I think. I'm not opposed to it,
but I also don't have plans to implement myself. Just checking the
path seem to be fine for the purpose here.

It could be expanded to also use AC_CHECK_DECLS to check for specific
declarations once the header path is found.

Thanks, Roger.

