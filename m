Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FF62A98F2
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 16:58:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20937.47035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb48S-0004LZ-TK; Fri, 06 Nov 2020 15:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20937.47035; Fri, 06 Nov 2020 15:58:44 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb48S-0004Ks-Ou; Fri, 06 Nov 2020 15:58:44 +0000
Received: by outflank-mailman (input) for mailman id 20937;
 Fri, 06 Nov 2020 15:58:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rw0I=EM=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kb48Q-0004JK-U2
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 15:58:42 +0000
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 90e85e44-f582-41b4-a4db-27a57d3e8640;
 Fri, 06 Nov 2020 15:58:41 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id p8so1036299wrx.5
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2020 07:58:41 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id f4sm2790188wrq.54.2020.11.06.07.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 07:58:40 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rw0I=EM=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kb48Q-0004JK-U2
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 15:58:42 +0000
X-Inumbo-ID: 90e85e44-f582-41b4-a4db-27a57d3e8640
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 90e85e44-f582-41b4-a4db-27a57d3e8640;
	Fri, 06 Nov 2020 15:58:41 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id p8so1036299wrx.5
        for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2020 07:58:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=u9/xTj7n0+W7aoDuTIa8HDJqm5R5FIOjh0XtULP6dHU=;
        b=UVvXcJ65fg2mij68JdLHUh+8utERACtQxl/pGIuGZbJh7geWfWq84c60aOrFCDsZf0
         7fuAEoDCCB6bleTTjREz79Aifr6Bnu1EVNPhqDlcbiHgnahcpBgmYS4EHNT+/f1QXlFZ
         vAWeBNW9hSLs9sKPztmPv2JXrx3SMBBeZdeHYVWQvHPK/d3ru3Ljo3MtRbhzfCjfvd6u
         nNDn3pt3q5fZgXmexC9ZgCphzMwH9OUUKpRIxhX6ePlNeZ9rpPmQbHUhCsBZGQ2mE0D2
         77vnQguzV7jHisAQgk9/BK1NKSmuczQbBHlV+zS3bFUCqccCp4nIQvemSEDqtLpvSRdD
         5CCA==
X-Gm-Message-State: AOAM533z7lSQ/LHOOUepcmAG1aJ2QdY9OML4/zMnTnJ7KUp7Esoc8hh2
	qxjUnDf5dlXX++abjRGRwqA=
X-Google-Smtp-Source: ABdhPJxVrNWM590SdX57k+IEurGmDyCe49WRxL2Yto6w97/Z7uA7ZJ5R1xg/IkPSwHDgn7EEKjd2mg==
X-Received: by 2002:adf:fd06:: with SMTP id e6mr3467157wrr.206.1604678321112;
        Fri, 06 Nov 2020 07:58:41 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id f4sm2790188wrq.54.2020.11.06.07.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 07:58:40 -0800 (PST)
Date: Fri, 6 Nov 2020 15:58:39 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Ian Jackson <iwj@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] libxg: don't use max policy in xc_cpuid_xend_policy()
Message-ID: <20201106155839.vnhdqcptbpkbzfly@liuwe-devbox-debian-v2>
References: <4fa05759-24ac-5ff3-3db9-94537f6be95d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fa05759-24ac-5ff3-3db9-94537f6be95d@suse.com>
User-Agent: NeoMutt/20180716

On Thu, Nov 05, 2020 at 04:56:53PM +0100, Jan Beulich wrote:
> Using max undermines the separation between default and max. For example,
> turning off AVX512F on an MPX-capable system silently turns on MPX,
> despite this not being part of the default policy anymore. Since the
> information is used only for determining what to convert 'x' to (but not
> to e.g. validate '1' settings), the effect of this change is identical
> for guests with (suitable) "cpuid=" settings to that of the changes
> separating default from max and then converting (e.g.) MPX from being
> part of default to only being part of max for guests without (affected)
> "cpuid=" settings.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I will defer this to Andrew.

