Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B972CED1A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:34:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44564.79857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9Lt-0003ss-8h; Fri, 04 Dec 2020 11:34:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44564.79857; Fri, 04 Dec 2020 11:34:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9Lt-0003sT-4e; Fri, 04 Dec 2020 11:34:17 +0000
Received: by outflank-mailman (input) for mailman id 44564;
 Fri, 04 Dec 2020 11:34:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl9Ls-0003sN-9C
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:34:16 +0000
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c26a945-301f-4e69-b624-a910d7422574;
 Fri, 04 Dec 2020 11:34:15 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id h21so6746392wmb.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 03:34:15 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id g78sm2725202wme.33.2020.12.04.03.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 03:34:14 -0800 (PST)
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
X-Inumbo-ID: 6c26a945-301f-4e69-b624-a910d7422574
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TAwsEZkVakWz2W8UPc1EIi7gA6bN724STdrEp/845nE=;
        b=KfBz8rRlSfVNfT8th08YIZBu8F1CH7V18mPLu65fgMSapcS4C3De0uk78IfuIRbpPi
         cGEv1jQmxpJ8eDThrk6JiNuqkwkqHwKdQ6lxE0sn04hkKwkPjrDKpZ0jj6PRnvqsSBt9
         sHnaMGlu8tKxH2yYo8sgMRkYRJ5tY8GLTt9u/K6eB9AeI5NgOSn2GZFy07Ds9dHuuahJ
         FW+LbEOWpAf6g92Sh7qKeHsYmFRqG5PaT1lxvSKbqGc/KiXFsC7ULNcJlyFUFcp3aicr
         GzhXs1qtVtZJJ+nRAE1d8pZ/FqyQ4kViCqzn9u0kxAtfJt/2lPeJERapDjTDlHaK7aaE
         x09g==
X-Gm-Message-State: AOAM533kwW3075fbxKUgqqiWJSap7KLQFv//otC8E8xFfyF3pjZ2BPYq
	f8Z2T0x+5SyHI+02+XRNy9o=
X-Google-Smtp-Source: ABdhPJyorZyReJqJvksu+ExEcJqObTA07fyhtu+2Z7T6CoqTZ7UFaphKvCuLyBl56JPvLzeaZ0CD3A==
X-Received: by 2002:a7b:cb84:: with SMTP id m4mr3658343wmi.157.1607081654841;
        Fri, 04 Dec 2020 03:34:14 -0800 (PST)
Date: Fri, 4 Dec 2020 11:34:13 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v5 18/23] libxlu: introduce xlu_pci_parse_spec_string()
Message-ID: <20201204113413.iebyf2ldzq6rfpsg@liuwe-devbox-debian-v2>
References: <20201203142534.4017-1-paul@xen.org>
 <20201203142534.4017-19-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203142534.4017-19-paul@xen.org>
User-Agent: NeoMutt/20180716

On Thu, Dec 03, 2020 at 02:25:29PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> This patch largely re-writes the code to parse a PCI_SPEC_STRING and enters
> it via the newly introduced function. The new parser also deals with 'bdf'
> and 'vslot' as non-positional paramaters, as per the documentation in
> xl-pci-configuration(5).
> 
> The existing xlu_pci_parse_bdf() function remains, but now strictly parses
> BDF values. Some existing callers of xlu_pci_parse_bdf() are
> modified to call xlu_pci_parse_spec_string() as per the documentation in xl(1).
> 
> NOTE: Usage text in xl_cmdtable.c and error messages are also modified
>       appropriately.
> 
> Fixes: d25cc3ec93eb ("libxl: workaround gcc 10.2 maybe-uninitialized warning")

I don't think d25cc3ec93eb is buggy, so this tag is not needed.

> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Acked-by: Wei Liu <wl@xen.org>

