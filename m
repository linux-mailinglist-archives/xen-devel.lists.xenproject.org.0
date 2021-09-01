Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 185F63FDD1F
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 15:22:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176400.320999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLQCF-0006VW-5r; Wed, 01 Sep 2021 13:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176400.320999; Wed, 01 Sep 2021 13:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLQCF-0006Te-1k; Wed, 01 Sep 2021 13:22:31 +0000
Received: by outflank-mailman (input) for mailman id 176400;
 Wed, 01 Sep 2021 13:22:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gczT=NX=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1mLQCD-0006TY-LR
 for xen-devel@lists.xen.org; Wed, 01 Sep 2021 13:22:29 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf2850d5-6dd5-40f8-bffe-1da694fcf464;
 Wed, 01 Sep 2021 13:22:28 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id t19so4487310lfe.13;
 Wed, 01 Sep 2021 06:22:28 -0700 (PDT)
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
X-Inumbo-ID: cf2850d5-6dd5-40f8-bffe-1da694fcf464
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jaFQ1dJz/0jVDnUJDux1CudavpmIQDH+qRgNmOHy2kw=;
        b=V08N3wY0tEFQVk3cnI/b65MC6y/NleF6UKnkKSF4FljmBjrUCVrMazguZLA7LdjAmT
         +ukjleA/aXsaghg8GdsMYuAgm5c+MPEAreIaSQmdzDGpoYxtukbwGOq6AUzSQwEpTY7+
         AeRpjO4diPCC57slSCKz6Up8XUfN5G55R75Z0ghi/XJHYQzGmDGp0k5rosewss7I0J/f
         I3lzZ16I+iwkRH8e8zHzRSxcJ5rmOUhqIQSEZfM6y6/Rh5VlbXhlnuTgeV0C1Ud4mU1N
         SF3wfplIkh8EJ7NydDk2HhzRMfGvJ4zuckdXpFbwpiK3mBrr//Kfse12BEWAhzVvi6fQ
         5kXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jaFQ1dJz/0jVDnUJDux1CudavpmIQDH+qRgNmOHy2kw=;
        b=JrpFxVaBMe8DrcL/LAJ8shCaXJ4Ue23W3hoyGVRIfapRy/ZvbNVLLlSjeZSgktxEDL
         Vh2Sp7eI/S1m6J+aOzTPhK/OjKSQv0DUsS8VLE/ER2OXJb5e7DrDEUAfcWFKgCUWBIJ9
         s/Kla6Em+S3TDU16XXV5I2ZSffiv70n7ZR6GPpIqH7YWe4QeKI1cBHkGYPUgPG9WhT98
         qUpcueZVT0jFl0KmEqCN6AjuV272lFqDw+t4pBkERk2Z1dpyDJJF6Upf9ouXhwuLQxhT
         NxWj42tEw9w3UQ1iaCguh0upNstAu2iIOjf088UvzbfhRVoDPW5yNR+VLsjcSeD6swWs
         81Xg==
X-Gm-Message-State: AOAM531FlJMmjORy+uaUxkviFED/ekdPu42SfqE9CgrRoMpouTj6ERDZ
	+BbtjZgMJBUCUdkKkArhpvZNhTj6cG5Ld3/jo3Y=
X-Google-Smtp-Source: ABdhPJzjhjRenLVlNS1HJ0Z1WF422vUK6cSHDYkcons243OdgRRX3wOE4F63Tq0W2CKrBteyFQ6T9OAR2SBTJbX1W8Y=
X-Received: by 2002:ac2:5d4a:: with SMTP id w10mr26376733lfd.529.1630502546778;
 Wed, 01 Sep 2021 06:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <E1mLMZy-0006TJ-Rw@xenbits.xenproject.org>
In-Reply-To: <E1mLMZy-0006TJ-Rw@xenbits.xenproject.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 1 Sep 2021 09:22:14 -0400
Message-ID: <CAKf6xpsAz7oPX+PdZokm+BAqreqL8rnrAd9UYvdz=F0M-bcMUQ@mail.gmail.com>
Subject: Re: Xen Security Advisory 378 v3 (CVE-2021-28694,CVE-2021-28695,CVE-2021-28696)
 - IOMMU page mapping issues on x86
To: "Xen.org security team" <security@xen.org>
Cc: xen-announce@lists.xen.org, xen-devel@lists.xen.org, 
	xen-users@lists.xen.org, oss-security@lists.openwall.com, 
	"Xen.org security team" <security-team-members@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 1, 2021 at 5:34 AM Xen.org security team <security@xen.org> wrote:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
>
>  Xen Security Advisory CVE-2021-28694,CVE-2021-28695,CVE-2021-28696 / XSA-378
>                                    version 3
>
>                    IOMMU page mapping issues on x86
>
> UPDATES IN VERSION 3
> ====================
>
> Warn about dom0=pvh breakage in Resolution section.
>
> ISSUE DESCRIPTION
> =================
>
> Both AMD and Intel allow ACPI tables to specify regions of memory
> which should be left untranslated, which typically means these
> addresses should pass the translation phase unaltered.  While these
> are typically device specific ACPI properties, they can also be
> specified to apply to a range of devices, or even all devices.
>
> On all systems with such regions Xen failed to prevent guests from
> undoing/replacing such mappings (CVE-2021-28694).

Hi,

Is there a way to identify if a system's ACPI tables have untranslated
regions?  Does it show up in xen or linux dmesg or can it be
identified in sysfs?

Thanks,
Jason

