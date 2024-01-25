Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EEF83C293
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 13:33:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671489.1044844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSyuq-0001IB-GY; Thu, 25 Jan 2024 12:33:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671489.1044844; Thu, 25 Jan 2024 12:33:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSyuq-0001GI-DF; Thu, 25 Jan 2024 12:33:08 +0000
Received: by outflank-mailman (input) for mailman id 671489;
 Thu, 25 Jan 2024 12:33:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=etx6=JD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rSyuo-0001GC-Jc
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 12:33:06 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e135b7ca-bb7d-11ee-9b0f-b553b5be7939;
 Thu, 25 Jan 2024 13:33:02 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3394dc75eadso1198182f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 04:33:02 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 s16-20020a5d5110000000b0033763a9ea2dsm11685172wrt.63.2024.01.25.04.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 04:33:01 -0800 (PST)
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
X-Inumbo-ID: e135b7ca-bb7d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706185981; x=1706790781; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CHk2G2HmpWq0QnWFnsfk19qLU5bHn4G+1OQlTmFZkQQ=;
        b=PiFyOqFNGZC4/63PymwJImcPPSFg33epyekNVdsWxsuq1YfW9y9b7Z63sFPUup8UVv
         oLL0S1fM748G03h6/hjY5+/JvPch7O1vuYdvw+56x3uYdg0wsIB/vpWsTrGi2Xxo3chL
         6fHBg/F6cBvPd5bPypYo8rHrdjcw9AKH1XWOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706185981; x=1706790781;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CHk2G2HmpWq0QnWFnsfk19qLU5bHn4G+1OQlTmFZkQQ=;
        b=f05oSz+XcGEnlGpwgThIUHBXIB3P1pO7LIy9ctKy81vIjaRQxnH/y0vSnFppjJzJS9
         Cf7//S/vIpMYODvQItDdAhN0WgtUduCGQPWJFB1+aj6WaKf0O2Z9mNQJuoUBm4KvaXvs
         4ecjaXiEsHOXVnKCb3yuSqwd0gaOsVJEWwvC90WJMmZD1VVLk4AAChkPbqKZXSzctTav
         pfagan4swAb5nkpyWvshiDgPMswx+GYJc+NF9lHx9Hhq2dXsvJ1lNnEY0BsrXlMFkTr3
         EudFJESa+UGhzI899r+dWezyxndJwU5KH+3UoUFbnpVeLIG2gs9Uq0rIpxudt7qo0qJq
         +eKQ==
X-Gm-Message-State: AOJu0YxsFIiSCrZUhrkUpqgaVNxLn/4b3j9JzK7GtEK6xtKI0yuP5ooR
	tLTMvzM+C4/zNgjyT75MGE21BNIjj/euXy43aKebCxg1ccaAfki3pWNN1ubnwZE=
X-Google-Smtp-Source: AGHT+IGKPFJL+BAEAkhOjrbfNreMCisrMsZRZtazP8rkkl8Oairdambp4ggHgfG9TNDmVuc+nWc31Q==
X-Received: by 2002:a5d:55c4:0:b0:337:cdc1:b52d with SMTP id i4-20020a5d55c4000000b00337cdc1b52dmr482700wrw.65.1706185981388;
        Thu, 25 Jan 2024 04:33:01 -0800 (PST)
Date: Thu, 25 Jan 2024 13:33:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v12.2 01/15] vpci: use per-domain PCI lock to protect
 vpci structure
Message-ID: <ZbJU_PuYo9EEzyac@macbook>
References: <20240115194309.45683-1-stewart.hildebrand@amd.com>
 <715e40c9-1776-4677-9565-dac1565a2aa8@suse.com>
 <Za_WGzS14Eqt8yZF@macbook>
 <ae7a57f2-2433-4b75-ab45-c8be55d489c9@suse.com>
 <ZbDXXyucJhLJ4u9H@macbook>
 <a3233487-965b-49ae-bebe-e5476fcda29c@suse.com>
 <ZbFOE6kV7NXFrNjb@macbook>
 <fa7df700-06f1-4110-bc76-c59d59e5d887@suse.com>
 <ZbIkVcYkcuT2iF8e@macbook>
 <247df339-e631-4c50-85e4-b6a486235564@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <247df339-e631-4c50-85e4-b6a486235564@suse.com>

On Thu, Jan 25, 2024 at 12:23:05PM +0100, Jan Beulich wrote:
> On 25.01.2024 10:05, Roger Pau Monné wrote:
> > On Thu, Jan 25, 2024 at 08:43:05AM +0100, Jan Beulich wrote:
> >> On 24.01.2024 18:51, Roger Pau Monné wrote:
> >>> On Wed, Jan 24, 2024 at 12:34:10PM +0100, Jan Beulich wrote:
> >>>> On 24.01.2024 10:24, Roger Pau Monné wrote:
> >>>>> On Wed, Jan 24, 2024 at 09:48:35AM +0100, Jan Beulich wrote:
> >>>>>> On 23.01.2024 16:07, Roger Pau Monné wrote:
> >>>>>>> On Tue, Jan 23, 2024 at 03:32:12PM +0100, Jan Beulich wrote:
> >>>>>>>> On 15.01.2024 20:43, Stewart Hildebrand wrote:
> >>>>>>>>> @@ -2888,6 +2888,8 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
> >>>>>>>>>  {
> >>>>>>>>>      int irq, pirq, ret;
> >>>>>>>>>  
> >>>>>>>>> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
> >>>>>>>>
> >>>>>>>> If either lock is sufficient to hold here, ...
> >>>>>>>>
> >>>>>>>>> --- a/xen/arch/x86/physdev.c
> >>>>>>>>> +++ b/xen/arch/x86/physdev.c
> >>>>>>>>> @@ -123,7 +123,9 @@ int physdev_map_pirq(domid_t domid, int type, int *index, int *pirq_p,
> >>>>>>>>>  
> >>>>>>>>>      case MAP_PIRQ_TYPE_MSI:
> >>>>>>>>>      case MAP_PIRQ_TYPE_MULTI_MSI:
> >>>>>>>>> +        pcidevs_lock();
> >>>>>>>>>          ret = allocate_and_map_msi_pirq(d, *index, pirq_p, type, msi);
> >>>>>>>>> +        pcidevs_unlock();
> >>>>>>>>>          break;
> >>>>>>>>
> >>>>>>>
> >>>>>>> IIRC (Stewart can further comment) this is done holding the pcidevs
> >>>>>>> lock to keep the path unmodified, as there's no need to hold the
> >>>>>>> per-domain rwlock.
> >>>>>>
> >>>>>> Yet why would we prefer to acquire a global lock when a per-domain one
> >>>>>> suffices?
> >>>>>
> >>>>> I was hoping to introduce less changes, specially if they are not
> >>>>> strictly required, as it's less risk.  I'm always quite worry of
> >>>>> locking changes.
> >>>>
> >>>> In which case more description / code commenting is needed. The pattern
> >>>> of the assertions looks dangerous.
> >>>
> >>> Is such dangerousness perception because you fear some of the pcidevs
> >>> lock usage might be there not just for preventing the pdev from going
> >>> away, but also to guarantee exclusive access to certain state?
> >>
> >> Indeed. In my view the main purpose of locks is to guard state. Their
> >> use here to guard against devices here is imo rather an abuse; as
> >> mentioned before this should instead be achieved e.g via refcounting.
> >> And it's bad enough already that pcidevs_lock() alone has been abused
> >> this way, without proper marking (leaving us to guess in many places).
> >> It gets worse when a second lock can now also serve this same
> >> purpose.
> > 
> > The new lock is taken in read mode in most contexts, and hence can't
> > be used to indirectly gain exclusive access to domain related
> > structures in a safe way.
> 
> Oh, right - I keep being misled by rw_is_locked(). This is a fair
> argument. Irrespective it would feel better to me if an abstraction
> construct was introduced; but seeing you don't like the idea I guess
> I won't insist.

TBH I'm not going to argue against it if you and Stewart think it's
clearer, but I also won't request the addition of such wrapper myself.

Thanks, Roger.

