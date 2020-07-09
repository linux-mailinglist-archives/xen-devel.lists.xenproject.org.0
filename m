Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2373221A9DB
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jul 2020 23:45:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jteKZ-0003TF-EJ; Thu, 09 Jul 2020 21:43:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDeG=AU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jteKY-0003TA-2f
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2020 21:43:46 +0000
X-Inumbo-ID: 4368e092-c22d-11ea-8f22-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4368e092-c22d-11ea-8f22-12813bfff9fa;
 Thu, 09 Jul 2020 21:43:45 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E786220774;
 Thu,  9 Jul 2020 21:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594331024;
 bh=6uwGewJZuGMzlEvaEh3gYRgYTjhsK9tA03tQLqLSXfQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=aakhgkeGgwjspp3hEdLzeY3aOMxyXTjy25PT7sMfE7e6G+PUiFi/7+Rj1TCUJ/s4e
 DXRDxIvCsEhD1VTScBesyLsPwdq00BCO39EsGfauwrMZ0HdNkP3iInMgNBytesM7Qh
 gnRFN5eEtJjkUxUCqvR+8I4749AebmKO0Zjf1Jk4=
Date: Thu, 9 Jul 2020 14:43:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v4 for-4.14 2/2] pvcalls: Document correctly and
 explicitely the padding for all arches
In-Reply-To: <2e0a451e-58be-eff1-0030-be489e5098f3@xen.org>
Message-ID: <alpine.DEB.2.21.2007091443290.4124@sstabellini-ThinkPad-T480s>
References: <20200627095533.14145-1-julien@xen.org>
 <20200627095533.14145-3-julien@xen.org>
 <b7f41be0-f1d2-2c3b-c79f-5d9763dfb5df@xen.org>
 <2e0a451e-58be-eff1-0030-be489e5098f3@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 9 Jul 2020, Julien Grall wrote:
> Hi,
> 
> Gentle ping.
> 
> Is the new commit message fine?
> 
> Cheers,
> 
> On 04/07/2020 16:29, Julien Grall wrote:
> > Hi,
> > 
> > On 27/06/2020 10:55, Julien Grall wrote:
> > > From: Julien Grall <jgrall@amazon.com>
> > > 
> > > The specification of pvcalls suggests there is padding for 32-bit x86
> > > at the end of most the structure. However, they are not described in
> > > in the public header.
> > > 
> > > Because of that all the structures would be 32-bit aligned and not
> > > 64-bit aligned for 32-bit x86.
> > > 
> > > For all the other architectures supported (Arm and 64-bit x86), the
> > > structure are aligned to 64-bit because they contain uint64_t field.
> > > Therefore all the structures contain implicit padding.
> > > 
> > > Given the specification is authoriitative, the padding will the same for
> > > the all architectures. The potential breakage of compatibility is ought
> > > to be fine as pvcalls is still a tech preview.
> > > 
> > > As an aside, the padding sadly cannot be mandated to be 0 as they are
> > > already present. So it is not going to be possible to use the padding
> > > for extending a command in the future.
> > > 
> > > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > 
> > It looks like most of the comments are on the commit message. So rather than
> > sending the series again, below a new version of the commit message:
> > 
> > "
> > The specification of pvcalls suggests there is padding for 32-bit x86
> > at the end of most the structure. However, they are not described in
> > in the public header.
> > 
> > Because of that all the structures would have a different size between
> > 32-bit x86 and 64-bit x86.
> > 
> > For all the other architectures supported (Arm and 64-bit x86), the
> > structure have the sames sizes because they contain implicit padding thanks
> > to the 64-bit alinment of the field uint64_t field.
> > 
> > Given the specification is authoritative, the padding will now be the same
> > for all architectures. The potential breakage of compatibility is ought to
> > be fine as pvcalls is still a tech preview.
> > "

Looks good to me

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

