Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3B79C6D35
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 11:56:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835354.1251220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBB3C-0000ej-SW; Wed, 13 Nov 2024 10:56:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835354.1251220; Wed, 13 Nov 2024 10:56:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBB3C-0000cx-Pd; Wed, 13 Nov 2024 10:56:42 +0000
Received: by outflank-mailman (input) for mailman id 835354;
 Wed, 13 Nov 2024 10:56:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KbMU=SI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tBB3B-0000bU-8d
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 10:56:41 +0000
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [2607:f8b0:4864:20::b2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4e3e008-a1ad-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 11:56:38 +0100 (CET)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-e2bd7d8aaf8so6753526276.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 02:56:38 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-462ff41b8fcsm86562781cf.32.2024.11.13.02.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 02:56:36 -0800 (PST)
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
X-Inumbo-ID: f4e3e008-a1ad-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjpiMmEiLCJoZWxvIjoibWFpbC15YjEteGIyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY0ZTNlMDA4LWExYWQtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDk1Mzk4LjkyNTcyMiwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731495397; x=1732100197; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+34MSF7eawbg2sXn0MebRKRymDiWF/kEQszYgHe7G6c=;
        b=JyuSuj9dm0ILbStplOS5ci14HA6Q1OGPCzgSyHIFJCT4XVq0mR3SN4SuQmX0b0I2NS
         oBcCr26x14oP/4AfVcwnCbqL0081bI64wfFFxN+Br+jdPFAh9XbSh/1x7WK3rC86baZs
         F8eZDhPJD4n/g5I8N8LkV/r1rVh1kXljp4CQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731495397; x=1732100197;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+34MSF7eawbg2sXn0MebRKRymDiWF/kEQszYgHe7G6c=;
        b=eOIpeAYnlKqSPCCKJjSCbrdwCvbmCIMhsCM7BDf+KGg4C16biHY60VByOyMcBMKA/Q
         ZvnroUT1PkGtiS8+a85QY4uuHzbEKOqE/kE1W0L/ZpcUjojw3mTTu0xRRRio/iDvYzs4
         jad6lNJMMeYRhHN975gH7LjZLkBNAr1W5ZDSp1qRemBV4iGjOme3Tzt9Ei5B52P1yGtG
         dlosz8AuneUUhP/W01u6PvO6t0f8M/Gg6b0Gp6i9woRYEfIKixOLWc3AF8OlHyrimziR
         5wA1A7o0E94Xlc+d8gkSfzGW9Dprp6aEcaAivq+sbA//cnO+wFmfWFc68AZL82FSR0zx
         n5ng==
X-Forwarded-Encrypted: i=1; AJvYcCV4NEseVDTezoWOwBGDWsPl3/hivR03dVBg3LpP5IoqSZQxaFO98JIh+YcTlfwza4OhqAy8oGezBzY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpKm8nXQipunhDKCQbIHw+wmGLRCUX1UicQGxLh1r5stJTBwjo
	aUW1w2lYOKbIK6Km4yOfV41GnORaynWbsQRpxDpyhBY1hwNlg47lNHzC4LLoEJsGlFDs4Gm40i4
	w
X-Google-Smtp-Source: AGHT+IHQF1AQZf6NhJxqq2HjEQZTpBLVmd8tUpZ6yasgZuq8gJes3nm3iarMuhZaGW52PEt/9ZA25A==
X-Received: by 2002:a05:690c:620e:b0:6e0:447:f257 with SMTP id 00721157ae682-6ecb32ee40cmr26536947b3.22.1731495397571;
        Wed, 13 Nov 2024 02:56:37 -0800 (PST)
Date: Wed, 13 Nov 2024 11:56:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] vpci: Add resizable bar support
Message-ID: <ZzSF4es4NJnd3-JP@macbook>
References: <20241113080027.244240-1-Jiqian.Chen@amd.com>
 <ZzRxqO3_GEgs7W1I@macbook>
 <BL1PR12MB5849AB0F258C07AD72EFDB29E75A2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzR_wlY0wXjqec8T@macbook>
 <6adc29fc-c6a6-460b-b034-62400e8c193b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6adc29fc-c6a6-460b-b034-62400e8c193b@suse.com>

On Wed, Nov 13, 2024 at 11:36:46AM +0100, Jan Beulich wrote:
> On 13.11.2024 11:30, Roger Pau Monné wrote:
> > On Wed, Nov 13, 2024 at 10:00:33AM +0000, Chen, Jiqian wrote:
> >> On 2024/11/13 17:30, Roger Pau Monné wrote:
> >>> On Wed, Nov 13, 2024 at 04:00:27PM +0800, Jiqian Chen wrote:
> >>>> Some devices, like discrete GPU of amd, support resizable bar capability,
> >>>> but vpci of Xen doesn't support this feature, so they fail to resize bars
> >>>> and then cause probing failure.
> >>>>
> >>>> According to PCIe spec, each bar that support resizing has two registers,
> >>>> PCI_REBAR_CAP and PCI_REBAR_CTRL, so add these two registers and their
> >>>> corresponding handler into vpci.
> >>>>
> >>>> PCI_REBAR_CAP is RO, only provide reading.
> >>>>
> >>>> PCI_REBAR_CTRL only has bar size is RW, so add write function to support
> >>>> setting the new size.
> >>>
> >>> I think the logic to handle resizable BAR could be much simpler.  Some
> >>> time ago I've made a patch to add support for it, but due to lack of
> >>> hardware on my side to test it I've never submitted it.
> >>>
> >>> My approach would be to detect the presence of the
> >>> PCI_EXT_CAP_ID_REBAR capability in init_header(), and if the
> >>> capability is present force the sizing of BARs each time they are
> >>> mapped in modify_bars().  I don't think we need to trap accesses to
> >>> the capability itself, as resizing can only happen when memory
> >>> decoding is not enabled for the device.  It's enough to fetch the size
> >>> of the BARs ahead of each enabling of memory decoding.
> >>>
> >>> Note that memory decoding implies mapping the BARs into the p2m, which
> >>> is already an expensive operation, the extra sizing is unlikely to
> >>> make much of a difference performance wise.
> >>>
> >>> I've found the following on my git tree and rebased on top of staging:
> >> OK.
> >> Do you need me to validate your patch in my environment?
> > 
> > Yes please, I have no way to test it.  Let's see what others think
> > about the different approaches.
> 
> I'd certainly prefer your simpler form, if it's safe and fits the needs.
> 
> >> And I have one question: where does your patch do writing the resizing size into hardware?
> > 
> > dom0 has unrestricted access to the resize capability, so the value
> > written by dom0 is propagated to the hardware without modification.
> > 
> > I would be wary of exposing the resize capability to untrusted
> > domains, as allowing a domU to change the size of BARs can lead to
> > overlapping if the hardware domain hasn't accounted for the increase
> > in BAR size.
> 
> Question is how the feature is used in practice: If it was a driver to
> request the re-size, I'd have a hard time seeing how we could make that
> work without intercepting accesses to the capability for DomU-s (implying
> to expose it in the first place, of course).

Question is also whether the capability is required for guests, as in
OS drivers requesting it to be present for proper operation.

I haven't given much thought about how to expose to domUs.  The
current patch doesn't attempt to expose to domUs either, as the
capability is not added to the 'supported_caps' array.

Thanks, Roger.

