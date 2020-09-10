Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17645264335
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 12:04:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGJQs-00043k-UL; Thu, 10 Sep 2020 10:03:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WysH=CT=gmail.com=pankaj.gupta.linux@srs-us1.protection.inumbo.net>)
 id 1kGJQr-00043c-ML
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 10:03:57 +0000
X-Inumbo-ID: e7bc99af-7db9-4bb8-86c7-0e687f23669f
Received: from mail-io1-xd41.google.com (unknown [2607:f8b0:4864:20::d41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7bc99af-7db9-4bb8-86c7-0e687f23669f;
 Thu, 10 Sep 2020 10:03:56 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id y13so6428376iow.4
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2020 03:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y2JcHZ6MFjyHAlvpoNmjBZx8lY6aHDHdPBn5/fOR/C0=;
 b=SHjrnz+amdW+kH6msAJS1SjMD4qKf//Oke1bSThNY6pdCjvbQ+x27OU9YlV9B+SYEj
 x4WGit+P6lzFULpqfB7FM8A7DBakbna0aDoBRBFhMpId+FTvnxVfdSZkL+7UBKf6R7Li
 Qcwq03DQg64ECu81QBftLC7POFMrjdMmsyy3+USM1cM0a37HSojGGcOCLkCDzAtOUwGK
 CIURbhZ42k7j/+YCP7SNIquHjrH+i0bOrZQqdbBLNZOfz6En+Jn7mMcXdMSqXCC+jQZD
 lYjq+VOUPTp8EL0T/MjzHs07HO7C27K2v1VXkWq9+vJ2IE9wwkcgALGw9zQQ/fsUdMbG
 yKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y2JcHZ6MFjyHAlvpoNmjBZx8lY6aHDHdPBn5/fOR/C0=;
 b=Z5XCyKWWqiYKI/809LYCEr3NmFJySslVCyxDB515He+Q1bW/cE8Jh5GzLRBy3jgj3h
 HOjSqCdV7Md1LNdUd0G9QhweKlJKCoKTDxakKn82GATpAP1e8CkHLrB0/6fbfno/EDpT
 cc+of1Jec2c9Y+zZ1M0Jj8SlcNs0amNA0niGO6vcgzz8b5i/Yu5pocqESfnh94cmvQo3
 ox/H0jhDpJFlHk7WDENGRPtMzk5rdmUje1U3/LtAU+t9ReF72gRCiVIhczFvaD811/W8
 U3aFiWnTaPMhqDA9Pgtl427B8gntoXavYO5Q7gsPYMBjp8CqsX5fyJj55X5qZ16O43qT
 P/Vg==
X-Gm-Message-State: AOAM531yea1RLa3Fx3KtyMupu1xLuQ3TU6ia2BwTakA5NSWxQd8+vf7S
 +HUJ+HGXUlxawAMQk3e9VldX4PVJl5pFlGLm2IU=
X-Google-Smtp-Source: ABdhPJyLZcGsxd4Zx+mCdXy45ufEwo0KPMGwBXhtsOyHb64xVG7npyu9cbgFOz4UWOemWTgujXWUOhR54K4+16Md/2Y=
X-Received: by 2002:a5d:8b4c:: with SMTP id c12mr6859868iot.167.1599732236621; 
 Thu, 10 Sep 2020 03:03:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200910091340.8654-1-david@redhat.com>
 <20200910091340.8654-5-david@redhat.com>
In-Reply-To: <20200910091340.8654-5-david@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Thu, 10 Sep 2020 12:03:45 +0200
Message-ID: <CAM9Jb+j=8-Fpyg2fizM_3FenF649y2AKA8rsWaQzwCgX8Da7+g@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] mm/memory_hotplug: MEMHP_MERGE_RESOURCE to specify
 merging of System RAM resources
To: David Hildenbrand <david@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, 
 Linux MM <linux-mm@kvack.org>, linux-hyperv@vger.kernel.org, 
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org, 
 linux-nvdimm <linux-nvdimm@lists.01.org>, linux-s390@vger.kernel.org, 
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>, 
 Dan Williams <dan.j.williams@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Kees Cook <keescook@chromium.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, 
 Wei Liu <wei.liu@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
 Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Julien Grall <julien@xen.org>, Baoquan He <bhe@redhat.com>, 
 Wei Yang <richardw.yang@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Looks good to me.

Reviewed-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>

