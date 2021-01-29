Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD553087DE
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 11:38:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77931.141517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RAN-0007DU-Kj; Fri, 29 Jan 2021 10:38:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77931.141517; Fri, 29 Jan 2021 10:38:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RAN-0007D3-GK; Fri, 29 Jan 2021 10:38:15 +0000
Received: by outflank-mailman (input) for mailman id 77931;
 Fri, 29 Jan 2021 10:38:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rFjR=HA=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l5RAL-0007Cr-MK
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 10:38:13 +0000
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 943f261f-b70f-41f0-8ce3-ac7512477571;
 Fri, 29 Jan 2021 10:38:12 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id c12so8323028wrc.7
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jan 2021 02:38:12 -0800 (PST)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id x11sm9146058wmi.4.2021.01.29.02.38.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Jan 2021 02:38:11 -0800 (PST)
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
X-Inumbo-ID: 943f261f-b70f-41f0-8ce3-ac7512477571
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=tq+zMzUEeXxWMyiP6wnYhQPJtlzxCxPGWdyOibOcWC8=;
        b=L3Hd8d9CqX8Qg2ag4wQZgjYibPwLwC04Q2q+IgqmCHWCiDpN8e2yJlZGZdDy7R5XXx
         paoOhn7qrKudHTPFF6KXRtOTYuA7PDEnCk5pRPC/Ixxbo2C5BxWK5fukY+tmdyulQ6gs
         ChdZCl0S4FMz2WXkwSRyqhpM0eItZe3OsZFvWmG3EaOS47wj0pnjb2zaZhfDAMtU+IXS
         G4z9wlQd9yGjlUWBY5F25bJqlRC84MNIEjVgjHWksa6EGXAO08vtWWhMuW6cDLChaPCJ
         AAr6nOALhg6fHoR4XQkPKenBRm7IcQuuXAdHvRNfPpd0ojm7UuB1vBR2/Jca73Ktb2Pz
         rtyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=tq+zMzUEeXxWMyiP6wnYhQPJtlzxCxPGWdyOibOcWC8=;
        b=ZU1S2wOAyEnCiRD5e3qUM9xYYI1T9/iXUH0ef4wpNr8U9itShlUYP9lBmbtWGCs/l7
         m44mB03XujnR+H6ft324kQMC48jVoMZBOuFEslHjZeIiijheav8MdXE1uzXfI1IWQ0yz
         l//KIxe8HFqBJkFMVBuuOVMkeSOdWmDLgYIFty1cQmY9oDIxCtUNxiZ3ILTvOJAFdB5f
         ru5h1E7ViDKyP0pGungFZtR7jIVyP5tP0y4KyJr9Z45XPaiPNR7UgEIkSnCmq+7UBwEI
         ZplxZIhPVFJIMa8jEOhfzkoz/IxidmgV3aPxPAyyRkoJhgSlr1Q3eWSSBQPe3LP5emgv
         0+LA==
X-Gm-Message-State: AOAM533QCTMZh24Cs5Xi6C38tgX5v3mngJ0AJeCym27APGzNhWKz5gG+
	mMURIeGr+yRxKuCTQ/vHHSg=
X-Google-Smtp-Source: ABdhPJzLO7ennEvx3/xxTI4c5sHsfDOz/9DDu3WIj8aL9UO8sif+J60pouhooLSczBdecjnAWOFI4w==
X-Received: by 2002:a5d:4d86:: with SMTP id b6mr3817856wru.152.1611916692177;
        Fri, 29 Jan 2021 02:38:12 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<iwj@xenproject.org>,
	<wl@xen.org>,
	<anthony.perard@citrix.com>
Cc: <andrew.cooper3@citrix.com>,
	<george.dunlap@citrix.com>,
	<julien@xen.org>,
	<sstabellini@kernel.org>,
	<roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>,
	"'Igor Druzhinin'" <igor.druzhinin@citrix.com>
References: <1610425048-990-1-git-send-email-igor.druzhinin@citrix.com> <396e7b8d-444a-d67d-e0f7-f6b85052dff7@citrix.com> <9f421029-1abb-2aa8-2874-b6eb41b70d63@suse.com>
In-Reply-To: <9f421029-1abb-2aa8-2874-b6eb41b70d63@suse.com>
Subject: RE: Ping: [PATCH v2 1/2] viridian: remove implicit limit of 64 VPs per partition
Date: Fri, 29 Jan 2021 10:38:10 -0000
Message-ID: <030101d6f62a$d763a760$862af620$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQNSytsssxWJzcTJyJyBVC30FTjr4gKeKETEAqH2T3CnHL7vAA==
Content-Language: en-gb

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 29 January 2021 10:31
> To: paul@xen.org; iwj@xenproject.org; wl@xen.org; anthony.perard@citrix.com
> Cc: andrew.cooper3@citrix.com; george.dunlap@citrix.com; julien@xen.org; sstabellini@kernel.org;
> roger.pau@citrix.com; xen-devel@lists.xenproject.org; Igor Druzhinin <igor.druzhinin@citrix.com>
> Subject: Ping: [PATCH v2 1/2] viridian: remove implicit limit of 64 VPs per partition
> 
> On 25.01.2021 16:37, Igor Druzhinin wrote:
> > On 12/01/2021 04:17, Igor Druzhinin wrote:
> >> TLFS 7.8.1 stipulates that "a virtual processor index must be less than
> >> the maximum number of virtual processors per partition" that "can be obtained
> >> through CPUID leaf 0x40000005". Furthermore, "Requirements for Implementing
> >> the Microsoft Hypervisor Interface" defines that starting from Windows Server
> >> 2012, which allowed more than 64 CPUs to be brought up, this leaf can now
> >> contain a value -1 basically assuming the hypervisor has no restriction while
> >> 0 (that we currently expose) means the default restriction is still present.
> >>
> >> Along with the previous changes exposing ExProcessorMasks this allows a recent
> >> Windows VM with Viridian extension enabled to have more than 64 vCPUs without
> >> going into BSOD in some cases.
> >>
> >> Since we didn't expose the leaf before and to keep CPUID data consistent for
> >> incoming streams from previous Xen versions - let's keep it behind an option.
> >>
> >> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> >> ---
> >
> > ping? Paul?
> 
> Paul - I saw a reply by you on patch 2, but not on this one.
> 

Oh sorry, yes. Done now.

  Paul

> libxl maintainers - both patches would want to be acked by you.
> 
> Jan


