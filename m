Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E99D92DBEE1
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 11:44:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55174.96081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpUHq-0004n8-My; Wed, 16 Dec 2020 10:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55174.96081; Wed, 16 Dec 2020 10:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpUHq-0004mn-Jq; Wed, 16 Dec 2020 10:44:02 +0000
Received: by outflank-mailman (input) for mailman id 55174;
 Wed, 16 Dec 2020 10:44:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxtY=FU=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kpUHp-0004mi-34
 for xen-devel@lists.xenproject.org; Wed, 16 Dec 2020 10:44:01 +0000
Received: from mail-wm1-f47.google.com (unknown [209.85.128.47])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 140776f2-1109-438f-9718-a6b4627d2729;
 Wed, 16 Dec 2020 10:44:00 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id q75so1968433wme.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Dec 2020 02:44:00 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id i7sm2717598wrv.12.2020.12.16.02.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 02:43:58 -0800 (PST)
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
X-Inumbo-ID: 140776f2-1109-438f-9718-a6b4627d2729
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=UIVKPr/2mLPS/umOv8iGKxHMJAeouS0XlPgcBGh+KpQ=;
        b=HpR+bLCssSPC64wpd0nL3W7Fcp216O6ZF+HPuhQDMmb3t1hoq1SjGq+Asj9WU5SmHS
         leDCA4/cJO7PNcoVC6ChzllYzqHH65A8kh41uXll27jhi65JSRlPcNeV8npUVA6uK47s
         8VXCzM9thRN3sjea7d+HQg14hhD56QxxOIkMEoYqaJigdLEUQUy4dlkgx2iptiTEgly+
         7ZwSzCgxxhFY00igOoyXvBUfNL0rh7dyFUIdX7D8iMWJknH5EOsG0M4oWp/rhOuYC30K
         1TYw8HFoq+MF9WpYQDXI/XFOlMna6smBQ+F10yjBn8/UaflOnHWocxY7XZwJAGFifQPp
         tUrQ==
X-Gm-Message-State: AOAM531l8RjDTPOyomjHgJo3MaWtzqbrSRMXd52Z3UM49zlG9//6g/zO
	OJhf+KjBw7ioHg1E1VuZ6DA=
X-Google-Smtp-Source: ABdhPJyRoSP2do49kmkWuSY3GUsaW1I6ApEZZNiW5I+ZqaBvpQXbc16JI35LdThmJM9pziN7bAXcxw==
X-Received: by 2002:a1c:43c6:: with SMTP id q189mr2688586wma.7.1608115439309;
        Wed, 16 Dec 2020 02:43:59 -0800 (PST)
Date: Wed, 16 Dec 2020 10:43:57 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
	xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [xen-unstable-smoke bisection] complete build-amd64-libvirt
Message-ID: <20201216104357.wcggzckdii76d4iz@liuwe-devbox-debian-v2>
References: <E1kpMXk-0006zb-Jk@osstest.test-lab.xenproject.org>
 <19ed8894-23f7-0f9d-f3c4-1d5ea5bc0c02@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19ed8894-23f7-0f9d-f3c4-1d5ea5bc0c02@citrix.com>
User-Agent: NeoMutt/20180716

Paul, are you able to cook up a patch today? If not I will revert the
offending patch(es).

Wei.

On Wed, Dec 16, 2020 at 10:17:29AM +0000, Andrew Cooper wrote:
> On 16/12/2020 02:27, osstest service owner wrote:
> > branch xen-unstable-smoke
> > xenbranch xen-unstable-smoke
> > job build-amd64-libvirt
> > testid libvirt-build
> >
> > Tree: libvirt git://xenbits.xen.org/libvirt.git
> > Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
> > Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
> > Tree: qemuu git://xenbits.xen.org/qemu-xen.git
> > Tree: xen git://xenbits.xen.org/xen.git
> >
> > *** Found and reproduced problem changeset ***
> >
> >   Bug is in tree:  xen git://xenbits.xen.org/xen.git
> >   Bug introduced:  929f23114061a0089e6d63d109cf6a1d03d35c71
> >   Bug not present: 8bc342b043a6838c03cd86039a34e3f8eea1242f
> >   Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/157589/
> >
> >
> >   commit 929f23114061a0089e6d63d109cf6a1d03d35c71
> >   Author: Paul Durrant <pdurrant@amazon.com>
> >   Date:   Tue Dec 8 19:30:26 2020 +0000
> >   
> >       libxl: introduce 'libxl_pci_bdf' in the idl...
> >       
> >       ... and use in 'libxl_device_pci'
> >       
> >       This patch is preparatory work for restricting the type passed to functions
> >       that only require BDF information, rather than passing a 'libxl_device_pci'
> >       structure which is only partially filled. In this patch only the minimal
> >       mechanical changes necessary to deal with the structural changes are made.
> >       Subsequent patches will adjust the code to make better use of the new type.
> >       
> >       Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> >       Acked-by: Wei Liu <wl@xen.org>
> >       Acked-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> 
> This breaks the API.  You can't make the following change in the IDL.
> 
>  libxl_device_pci = Struct("device_pci", [
> -    ("func",      uint8),
> -    ("dev",       uint8),
> -    ("bus",       uint8),
> -    ("domain",    integer),
> -    ("vdevfn",    uint32),
> +    ("bdf", libxl_pci_bdf),
> +    ("vdevfn", uint32),
> 
> ~Andrew

