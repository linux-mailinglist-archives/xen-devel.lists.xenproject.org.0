Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4C842DAF4
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 15:57:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209379.365816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb1EY-0005CS-Sl; Thu, 14 Oct 2021 13:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209379.365816; Thu, 14 Oct 2021 13:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb1EY-0005A2-Pd; Thu, 14 Oct 2021 13:57:22 +0000
Received: by outflank-mailman (input) for mailman id 209379;
 Thu, 14 Oct 2021 13:57:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i4ou=PC=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mb1EX-00059w-KY
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 13:57:21 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5c34330-2cf6-11ec-81c3-12813bfff9fa;
 Thu, 14 Oct 2021 13:57:20 +0000 (UTC)
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
X-Inumbo-ID: a5c34330-2cf6-11ec-81c3-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634219840;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SobMgfbFqDHgF5S1k7yQoTAmQrOd9zZNrSDAWuk7E4g=;
  b=QOOZwz4MyZkWcSBEb14LJnnh/kqF5dcYkoucuxcj33c+J68YlEV58fUF
   Nv6eagBG+yA2R+awsigu+vlm9HdSTIGoSTgSn8hHLSUWXNUuxPDquXMG3
   wGV+rkvT5cafe2Bl2QDW4DnE0n2a3t0PMbjoK8IL2DFRwmV+jlbrVrGPX
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: E9yhL4SXmmwIacL4V16UWfqVkEZ1Kc6EKPVaJ37cboxbuZVJfTicpTu5PM5ZHmTgWMAIDya07O
 1HPocQkoOw9Rjhad+ueYukiKWwYmOm0RXAE/r1Yc8YD4VfISe8AOs5A6Hs/+sISz9vQbsjUo+X
 F8wPKzIsn69ddRSnDV4qOYBEv1hlLjdbxsXeKsAft7mqn/y+bYjrxBjpZz8j4EH1u54+4uOKT+
 xZicCi72E9wPK+Oetnxti14KDH+qyZrsQhvjtO/69XigT+RVfYVVRHXkmEjrY3xql4DGXQxerb
 As9u5+KlmKKZi7AvdUaB60Fg
X-SBRS: 5.1
X-MesageID: 55178428
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:wSMxVKwhLQDoLbcTCvF6t+e6wSrEfRIJ4+MujC+fZmUNrF6WrkUFz
 TNMX2zXOKnfMGKjfNgjO42+o0JV6pSBx4JjHFM5/iAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s6w7dl2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt+Bx1
 NhdtJOIcyZ3A/yQnMIzQQhhARgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY250XQqaCP
 ZpxhTxHbybmfgV0ClYrIrkkgtqo2GfxTxR1gQfAzUYwyzeKl1EguFT3C/LOYcCDT8hRmkeep
 0rF8n7/DxVcM8aQoRKa9lq8i+mJmjn0MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN80igkoLU29UerZsLgRBD+q3mB1jYdRNh4A+A88BuKyKff/0CeHGdsZjxcbN0rsucmSDps0
 UWG9+4FHhQ27ufTEyjEsO7J83XiYkD5MFPuewc0TRcI89jsmLsS0C+eEtJFPrykt8/MTGSYL
 y+xkAAygLAajMgu3qq9/Ezajz/EmqUlXjLZ9S2MATr7tlIRiJqNItXyswCCvKkowJOxFwHZ5
 BA5d96iAPfi5H1nvBeGR/kRB/mX7vKBPSy0bbVHTsR5qWrFF5JOe+ltDNBCyKVBbplsldzBO
 ha7VeZtCHl7ZybCgUhfOdPZNijS5fK8fekJr9iNBja0XrB/dRWc4AZlblOK0mbmnSAEyP9kZ
 c7GKZjzXChEUcyLKQZaoc9GjNfHIQhklAvuqW3TlUz7gdJymlbEIVv6DLd+Rr9gt/7VyOkk2
 91eK9GL231ivB7WOUHqHXooBQlSdxATXMmuw+QOL7LrClc2SQkJVq6KqZt8KtMNokigvrqRl
 p1LchQDkwSXaLyuAVjiV02Pn5u0Bs8k9yhlbXJ8VbtqslB6CbuSAG4kX8NfVdEaGCZLl5aYl
 tEJJJeNBOphUDPC92hPZJXxttU6Jh+qmRiPL2yuZz1mJ8xsQAnA+9nFeArz9XZRUnrr5JVm+
 7DwhBnGRZcjRhh5CJqEYvyY0F7s72MWn/h/XhWUL4ALKlns6oVjNwf4kuQzf5MXMRzGyzbDj
 1SWDB4UqPPjuYgw9NWV16mIo53wS7l1H1ZAHnmd5rGzbHGI8m2myI5GceCJYTGCCz+kpPT8P
 b1YlqiuPucGkVBGt5tHP4xqla9utcHyo7J6zxh/GCmZZVqcFb49cGKN2tNCt/MRy+YB6xe2Q
 E+G5vJTJa6NZJH+CFcUKQcoMraD2PUTlmWA5Pg5Ohyntip+/b7BWkROJRiczidaKeItYo8ix
 O4gvu8Q6hC+1UV2YorX0HgM+jTeNGEEXoUmqooeUd3ihQccw11fZYDRV33t65aVZtQQakQnL
 1d4XkYZa2iwEqYaT0cOKA==
IronPort-HdrOrdr: A9a23:QBmQuK1KeGS8Mh7WPxni0QqjBL4kLtp133Aq2lEZdPUCSL39qy
 ncppUmPH7P5wr5N0tNpTntAsO9qDbnhP1ICOoqVotKPjOHhILAFugL0WKh+UyDJ8SUzJ856U
 4PScVD4JSbNzZHsfo=
X-IronPort-AV: E=Sophos;i="5.85,372,1624334400"; 
   d="scan'208";a="55178428"
Date: Thu, 14 Oct 2021 14:56:58 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 27/51] build: introduce if_changed_deps
Message-ID: <YWg3KuoqXBuSHoxz@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-28-anthony.perard@citrix.com>
 <4a1fc8b7-b915-2092-19bd-89a58cf3f232@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4a1fc8b7-b915-2092-19bd-89a58cf3f232@suse.com>

On Mon, Oct 11, 2021 at 04:20:36PM +0200, Jan Beulich wrote:
> On 24.08.2021 12:50, Anthony PERARD wrote:
> > @@ -400,7 +407,7 @@ $(TARGET).gz: $(TARGET)
> >  	gzip -n -f -9 < $< > $@.new
> >  	mv $@.new $@
> >  
> > -$(TARGET): FORCE
> > +$(TARGET): tools_fixdep FORCE
> >  	$(MAKE) -C tools
> 
> Shouldn't this include building fixdep, in which case the extra dependency
> here is unnecessary? I can see that it's needed ...

Indeed, we don't really needs "tools_fixdep" prerequisite because the
first command of the recipe is going to build fixdep.

Thanks,

-- 
Anthony PERARD

