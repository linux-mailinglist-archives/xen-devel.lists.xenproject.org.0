Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6B831FDD2
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 18:26:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87013.163904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9Xi-0007aF-Aj; Fri, 19 Feb 2021 17:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87013.163904; Fri, 19 Feb 2021 17:26:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9Xi-0007Zp-7O; Fri, 19 Feb 2021 17:26:14 +0000
Received: by outflank-mailman (input) for mailman id 87013;
 Fri, 19 Feb 2021 17:26:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZyFk=HV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1lD9Xh-0007Yz-3Z
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 17:26:13 +0000
Received: from mail-wm1-f52.google.com (unknown [209.85.128.52])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14f4da07-ec77-40ce-b2c9-f2fea1d6109a;
 Fri, 19 Feb 2021 17:26:12 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id o24so8306566wmh.5
 for <xen-devel@lists.xenproject.org>; Fri, 19 Feb 2021 09:26:12 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id l38sm11699513wmp.19.2021.02.19.09.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 09:26:11 -0800 (PST)
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
X-Inumbo-ID: 14f4da07-ec77-40ce-b2c9-f2fea1d6109a
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=TuBoLkcy6c7lcYki0OpGyZY2qotADkjln3ECovhSUvA=;
        b=r3zvaXhay9MUw5a210J5OY4zkeASS/FIJ7yVXtW/04ixi4JBmpbs07Z4rp1ZGpnX0L
         Qagaq9DyMFnylx7L2U2N1S2qbk9Xg2BigkcQTRmMoYk69eRhYGjDNs1/4SGOq6rW7Qly
         n435zla+Mbk0jAfhsfMO28OLi+I9CXZ5wemcS6ejNgAKDpIIzyh9h/No/S6SvaKlT+Lp
         Q3hfNag+8jGWpBTH8q9wkT6H+LEQbXG3exwbQbx4FyAo22ZAPCwajcC26C24uPoWJlBy
         NHlZeGsxCENdZafuJfbCzVj7kOBdtp5aaE/ToPpJqTwtmpksdUlEOx9KlHlgTEeasTKX
         /+jQ==
X-Gm-Message-State: AOAM533nf0ZufP606GyGW0O9KRg1oROeeIBKj1xkO8+TKeiZUtPcxsqL
	UOimhEP7yVkz6ahdlAzID18=
X-Google-Smtp-Source: ABdhPJzbX57P44obtewQ/Q9zlPmY3YFqZUmV2JvJKG6QWp/n2Lh1UezWMkqEh41v4uohPPS05Mg1xg==
X-Received: by 2002:a1c:5f84:: with SMTP id t126mr7347886wmb.52.1613755571721;
        Fri, 19 Feb 2021 09:26:11 -0800 (PST)
Date: Fri, 19 Feb 2021 17:26:09 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH-for-4.15] tools/libs/light: fix xl save -c handling
Message-ID: <20210219172609.xxrmhkcafhwgoa6w@liuwe-devbox-debian-v2>
References: <20210219141337.6934-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210219141337.6934-1-jgross@suse.com>

On Fri, Feb 19, 2021 at 03:13:37PM +0100, Juergen Gross wrote:
> libxl_domain_resume() won't work correctly for the case it was called
> due to a "xl save -c" command, i.e. to continue the suspended domain.
> 
> The information to do that is not saved in libxl__dm_resume_state for
> non-HVM domains.
> 
> Fixes: 6298f0eb8f443 ("libxl: Re-introduce libxl__domain_resume")
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

