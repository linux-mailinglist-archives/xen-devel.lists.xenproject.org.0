Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2728A3D245
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 18:30:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hajbN-0002ZN-2O; Tue, 11 Jun 2019 16:26:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TGDt=UK=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1hajbL-0002ZI-2h
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 16:26:23 +0000
X-Inumbo-ID: a5d9b86e-8c65-11e9-8980-bc764e045a96
Received: from mail-yw1-xc41.google.com (unknown [2607:f8b0:4864:20::c41])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a5d9b86e-8c65-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 16:26:21 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id k128so5542188ywf.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2019 09:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eiM4phSguLXdvPbEA7c+A5rrppKSW8BpWA8lHWl/PEA=;
 b=DT7/yn98Afi9A8YEg6mZOH6Ds3cmQpRCvahMSaKumX6I8XJT7VK14nI36NTZ4dXGdm
 mo8c4KJswHEeG0Ef2BFkMLkNaDok7l62S4tnIGUIj11gKXhSV8JXv7t7kRgVnsj7v0Hz
 li87ySHXaR6npH8M+zmBDVzf7SprKEVwAu7AY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=eiM4phSguLXdvPbEA7c+A5rrppKSW8BpWA8lHWl/PEA=;
 b=QcKaMEQb3QYTMGAYCjm53yt8kyTFVNGlJnxUKfaTJ7vWvZ2nnUbKJ8Z30mrRDb0owx
 6y7SzEGsouFsrZjJuFls8kYkvTYvKM/WfDIwV5BnDjsggQtDDIGaP9Vy0vmGnQ8vSnK1
 Q6cubjCMWs1DKI1Xucve9Kvwxkh1RWrVipQH4x/4722U/DI5M4uLAuRZTRnY1EWN6+WE
 5472TdItedLgLj7kpy1cNoN9XpD1IOrphCVNIsworRWHHyqEz+AmLOeEXIrJNL5L6MPC
 7aEO/67N74lyNtBMMZYQFUq6LTB1CfqqyyNJ8EID1Q2xn/W3Qy6PATQ9Y/AioKfZOY5K
 Lltw==
X-Gm-Message-State: APjAAAWzaf20b+1iytHEPecQz3Yi2s0q2rJW/EIxRITs9yNFULBdiiwq
 EpsNzvZrcVOZ58rxp9FlD37+uQ==
X-Google-Smtp-Source: APXvYqyH1gcGbry+9r9rHoXQw5JpX2jzORnOyqVG8UZ+LX/9F7acfvBpLQ8riSX+UKxBR7cyyq2/5Q==
X-Received: by 2002:a81:3c47:: with SMTP id j68mr42958663ywa.293.1560270381096; 
 Tue, 11 Jun 2019 09:26:21 -0700 (PDT)
Received: from doug-macbook.localdomain
 ([2600:1700:7b90:52f0:e5d6:4195:f4e7:95a5])
 by smtp.gmail.com with ESMTPSA id t125sm3880849ywa.2.2019.06.11.09.26.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 09:26:20 -0700 (PDT)
Date: Tue, 11 Jun 2019 11:26:20 -0500
From: Doug Goldstein <cardoe@cardoe.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190611162620.hltfb6yt2ajes274@doug-macbook.localdomain>
Mail-Followup-To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
References: <1560250596-26821-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1560250596-26821-1-git-send-email-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] automation: Fix CI with the fedora container
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMTE6NTY6MzZBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBBIHJlY2VudCByZWJ1aWxkIG9mIHRoZSBDSSBjb250YW5pZXJzIHN3aXRjaGVkIGZy
b20gRmVkb3JhIDI5IHRvIDMwIGJlY2F1c2UKPiB0aGUgZG9ja2VyZmlsZSBpcyB0YXJnZXR0aW5n
IGxhdGVzdC4KPiAKPiBVbmZvcnR1bmF0ZWx5LCB0aGUgdmVyc2lvbiBvZiBpUFhFIGluIG1hc3Rl
ciBkb2Vzbid0IGJ1aWxkIHdpdGggdGhlIGRlZmF1bHQKPiBHQ0MgaW4gRmVkb3JhIDMwLCB3aGlj
aCBpcyBibG9ja2luZyBhbGwgQ0kgYWN0aXZpdHkuCj4gCj4gU3dpdGNoIGZyb20gbGF0ZXN0IHRv
IGFuIGV4cGxpY2l0IHZlcnNpb24sIHRvIGF2b2lkIGZ1dHVyZSBicmVha2FnZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKQWNr
ZWQtYnk6IERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
