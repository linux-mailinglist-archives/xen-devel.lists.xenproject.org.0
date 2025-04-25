Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D563A9C995
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 14:55:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968034.1357748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8IaT-00061E-M8; Fri, 25 Apr 2025 12:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968034.1357748; Fri, 25 Apr 2025 12:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8IaT-0005zl-J0; Fri, 25 Apr 2025 12:55:25 +0000
Received: by outflank-mailman (input) for mailman id 968034;
 Fri, 25 Apr 2025 12:55:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AYju=XL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u8IaR-0005fg-Hk
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 12:55:23 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cdf432c-21d4-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 14:55:23 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ac2ab99e16eso483771466b.0
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 05:55:23 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ace6e41bc36sm133973866b.33.2025.04.25.05.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 05:55:22 -0700 (PDT)
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
X-Inumbo-ID: 8cdf432c-21d4-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745585722; x=1746190522; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dDAQtEeaCdNJWUkmGBO/iyPhlfbQ0PELgLWmxIlFM04=;
        b=MokC2rvHBiQz/Yt+yy8pPlVRPAL59FE7pyw4qt3Y6PVbfH8TMJm8ZWjP0aZTfBKVx+
         rsYQOuK9HZ0sq18BdqgjnZpan780zSK+cEnhfmUnWhxQunB1JdO+SbHYggsK2/mKJlLS
         DAdB+e/zCFg8e/V53P6gQE8TZMr73au8t7RSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745585722; x=1746190522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDAQtEeaCdNJWUkmGBO/iyPhlfbQ0PELgLWmxIlFM04=;
        b=tkameTbfTQZNziTjQApaYmjkua+WJERi/xp/4OHMaK5BZzGA6NlyShoWrxlrW1GePm
         qSd46SHV/rKySkvp6mxX0z34bzOTQzT2UogMOkfws2jJOxJYSiNn45G4ICWnMOAGaQal
         bDTDK2fdGVwTeeWD6O4u/ggtQC+barHlLF5MXob8FG2A2UTbDuwdocfJ5k9/VpzjveaD
         oQo3p2UWS66PbPsJbDiGPgLG+J6IvcVvnHbh1WgHo7yfLj+wbuPQdykogCL6wf5yTjb/
         8x3OcATOyo6GueCAaTo+0Z/H6So1Vn8RNnR9r7TnuyVFrc76utwjKr6yL7YvCjLR+kXK
         lRpw==
X-Gm-Message-State: AOJu0YyKxP/rpwaCMc+LlbMs3nQ2hSxiY3VwOfmCTD80k3vTf79d5yA3
	nYsKxyDAp9fNV3/XGL/UFX/u5vpfJZt+83d1TTFE4Qc823/Oh83KbW+qbfV24s8=
X-Gm-Gg: ASbGnctyutXI1U2tkiFqcPk86Vf3xIE9usfxd65g0Uqw4zYzWiCpH8aVuCWLzr/K8fs
	njs1/ws3e2HJyKUZOsGySPeRiMWwFyFxBW+UDk1P5NPKiFs9hkQsdJHb7V2iLvrE9tO5QhffPoB
	/g5h36PgYY3puTPFbQO0jcvxJJ7Z/QP7plRP82Wa5H1jmEz21x5XCWErHfsZj+n6oWVSy82W0KZ
	Q31t0ogOcfd9PzrGPS7DysiqtvCh/BJRyKAGCy6b2wg18JM02yJf5qY9uvilTSC0gJpOd2S1TJu
	HOr+FkN3hXHn7VAgB2ge7cqDz+jAatfolxKJ5NgPXH6PQw==
X-Google-Smtp-Source: AGHT+IFpqtLrQeC6vZ554o6lti8v8FTI/l303cv2y1NRrymjBT+Pkk32hd+owQfs8oJYt5K7ClU0ZQ==
X-Received: by 2002:a17:906:4795:b0:acb:6746:8754 with SMTP id a640c23a62f3a-ace7111ef01mr206925766b.27.1745585722329;
        Fri, 25 Apr 2025 05:55:22 -0700 (PDT)
Date: Fri, 25 Apr 2025 14:55:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <agarciav@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v2] x86/intel: workaround several MONITOR/MWAIT errata
Message-ID: <aAuGODoMFfZ2fEx-@macbook.lan>
References: <20250423113215.80755-1-roger.pau@citrix.com>
 <D9FQ3JVWGOSR.1F6NIIEDCUP16@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <D9FQ3JVWGOSR.1F6NIIEDCUP16@amd.com>

On Fri, Apr 25, 2025 at 01:36:42PM +0100, Alejandro Vallejo wrote:
> On Wed Apr 23, 2025 at 12:32 PM BST, Roger Pau Monne wrote:
> > There are several errata on Intel regarding the usage of the MONITOR/MWAIT
> > instructions, all having in common that stores to the monitored region
> > might not wake up the CPU.
> >
> > Fix them by forcing the sending of an IPI for the affected models.
> >
> > The Ice Lake issue has been reproduced internally on XenServer hardware,
> > and the fix does seem to prevent it.  The symptom was APs getting stuck in
> > the idle loop immediately after bring up, which in turn prevented the BSP
> > from making progress.
> 
> Ugh... so this is what it was... Awesome having this madness fixed.
> 
> Do you happen to know if Linux has a similar fix in place?

It should have now:

https://lore.kernel.org/lkml/20250421192205.7CC1A7D9@davehans-spike.ostc.intel.com/

> > This would happen before the watchdog was initialized, and hence the
> > whole system would get stuck.
> 
> That's nasty. It was the misassumption that the watchdog was already
> running that had me going in circles thinking it was a lockup rather
> than a livelock. Oh, well.
> 
> I believe the kudos for finally being able to reproduce this goes to
> Frediano?

Yes, Frediano managed to get it to reproduce reliably in the lab
(maybe 1-2 hits per day), and afterwards we pushed the rate up by just
rebooting in Xen itself after AP bringup, once we knew the specific
hardware that exhibited the issue.

Regards, Roger.

