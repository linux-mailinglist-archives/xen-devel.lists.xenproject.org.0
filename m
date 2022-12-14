Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1390764C753
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 11:44:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462044.720205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5PEs-0002va-FK; Wed, 14 Dec 2022 10:43:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462044.720205; Wed, 14 Dec 2022 10:43:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5PEs-0002sn-Ch; Wed, 14 Dec 2022 10:43:50 +0000
Received: by outflank-mailman (input) for mailman id 462044;
 Wed, 14 Dec 2022 10:43:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yf7=4M=citrix.com=prvs=340718c6c=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1p5PEr-0002sh-61
 for xen-devel@lists.xen.org; Wed, 14 Dec 2022 10:43:49 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2eea8bf7-7b9c-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 11:43:46 +0100 (CET)
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
X-Inumbo-ID: 2eea8bf7-7b9c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671014626;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1A/lYC6mWSeu716cMPT47BwZjdznzjCKDHUOkVRzajQ=;
  b=e34ZJCW6Jr45Bb16smM0RNjxxolrqJ7gDwM/mIpNCifA66hJLAi1awd6
   Qtop8yp8ZV0E190v5oHU8XCWo/UaR7pxVwagCH2Vuf8Bj5OhrSqkFCdoT
   GbWRaV67PGN71VhVrP3SVOfb/2X6WVQMrDgiB/abZ7+3JGJZpNR2S7ieZ
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 87286841
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KEQRVa5xy7tpKIQ5h4mR3QxRtD3AchMFZxGqfqrLsTDasY5as4F+v
 mdODWCGaPrZYzehfd52b4u1/UNU6JKGyoRrGwc4+S82Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKoS4AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mz
 OI6NR4KSTe5tsm2+oKpZdtFi8QkI5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJU0UUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0FwRzI+
 DKapgwVBDkDN/OzkBnGqUi9pfHRpAmhQN8VSZSBo6sCbFq7mTVIVUx+uUGAiea9ol6zXZRYM
 UN80i8vrqV09EuvS9Tmdxm5pneeuVgbQdU4O+gz9AGMx7eS+wGYHGkJVBZFadovrshwTjsvv
 neLgtfoCDpHoLCTD3WH+d+8rzyoPjMOBXQffiJCRgwAi/HzrYd2gh/RQ9JLFK+uksazCTz2h
 TeQo0AWnKkeg8cN0OOg4VnNjjaop57IZh404gTRTiSu6QYRTIyvapGs6FPbxe1dN4vfRV6E1
 FADn8Wd9/wfFpGlmymEQeFLF7asj96bMSfRml4pHIQk/i6F/3+ldJpXpjZkKy9BO8IJaXnjb
 UnVtA554J5VNWGtK6htbOqZENgwxLTnDpHpW+78acILZplqaBTB+CBobFSXmWf3nyAEj6A5M
 pqdbYCjEHcGFaN75D63Qe4H1vks3C9W+I/IbcmllVL9i+PYPSPLD+deWLeTUgwnxJqaghj79
 PF4Dfqhyy9vQsLMSyTX9oFGeDjmMkMHLZzxrsVWcMuKLQxnBHwtBpft/F8xR2B2t/8Lz7mVp
 xlRTmcdkQOi3iOfdW1mf1g5MNvSsYBDQWXX1MDGFXKhwDAdbImm98/znLNnLOB8pISPIROZJ
 sTpmvls4NwVElwrGBxHN/ERSbCOkzz17T9ixwL/PFACk2dIHmQlAOPMcAr17zUpBSGqr8Y4q
 LDI/lqFHsJSGlo+UpiGOaPHI7aNUZ81wbIaYqc1CoMLJBWEHHZCdUQdccPb0+lTcE6el1N2J
 i6dAAsCpPmlnmPG2IChuExwlK/wS7EWNhMDTwHmAUOeaXGyEpyLndURD45lvFn1CAvJxUlVT
 b4OkK2sb6RczAwiXkgVO+8D8J/SLuDH/9dypjmI1l2SB7h3ItuM+kW74PQ=
IronPort-HdrOrdr: A9a23:MNl/UKvGQ8mOc90ztJIBDWuH7skDgNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd2ZJhEo7q90ca7Lk80maQa3WBVB8bBYOCEghrOEGgB1/qA/9SIIUSXmtK1l5
 0QFpSWYOeaMbEQt7ef3ODXKbcdKNnsytHWuQ/dpU0dMz2DvctbnnZE4gXwKDwHeOFfb6BJba
 Z1fqB81kedkXJ8VLXCOlA1G9Ltivfsj5zcbRsPF3ccmXWzZWPB0s+AL/CAtC1uKQ9y/Q==
X-IronPort-AV: E=Sophos;i="5.96,244,1665460800"; 
   d="scan'208";a="87286841"
Date: Wed, 14 Dec 2022 10:43:36 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: Oleksandr Tyshchenko <olekstysh@gmail.com>, Jan Beulich
	<jbeulich@suse.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	<stratos-dev@op-lists.linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>, Mike Holmes
	<mike.holmes@linaro.org>, Wei Liu <wl@xen.org>, <xen-devel@lists.xen.org>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH V10 0/3] toolstack support for generic virtio devices on
 Arm
Message-ID: <Y5mo2DujvfnhxL6V@perard.uk.xensource.com>
References: <cover.1670994930.git.viresh.kumar@linaro.org>
 <47096c1c-4b03-2e3d-c28b-c8920b7d31f9@suse.com>
 <20221214083456.4w6raz7wop3ajtve@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221214083456.4w6raz7wop3ajtve@vireshk-i7>

On Wed, Dec 14, 2022 at 02:04:56PM +0530, Viresh Kumar wrote:
> On 14-12-22, 09:21, Jan Beulich wrote:
> > On 14.12.2022 06:19, Viresh Kumar wrote:
> > > This patchset adds toolstack support for I2C, GPIO and generic virtio devices.
> > > This is inspired from the work done by Oleksandr for the Disk device.
> > > 
> > > This is developed as part of Linaro's Project Stratos, where we are working
> > > towards Hypervisor agnostic Rust based backends [1].
> > > 
> > > This is based of Xen's master branch.
> > > 
> > > V9->V10:
> > > - Swap I2C/GPIO compatible strings, they were wrongly added earlier.
> > > - Arrange tags in timely order and add new ones.
> > 
> > The affected patch surely needed all tags to be dropped which weren't
> > explicitly indicated to remain valid across the bug fix.
> 
> Hmm, since it was a very small change (only fixed the compatible
> strings) I thought it would be okay to carry the tags and rather harsh
> to the reviewers to drop them, since they invested a lot of time
> reviewing these. Though I do get what you are suggesting here.

I would have carry over the tags as well in this case.

If the tag were dropped, it wouldn't really have been an issue for me,
it doesn't take much time to review a patch series that I've already
reviewed. I usually look at a diff with the previous version (with `git
range-diff`, patchew can help as well[1]), and my previous comment if
needed.

But dropping rvb tag of non-maintainer maybe more "harsh" as you says as
they may not have time to re-apply their tags before patch gets committed.

> Should I ask Oleksandr / Anthony to provide their tags for patch 1/3
> again ?

My tag is still valid. Thanks.

Cheers,


[1] https://patchew.org/Xen/cover.1670994930.git.viresh.kumar@linaro.org/
    Then look for "diff against: v9"

-- 
Anthony PERARD

