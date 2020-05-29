Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3291E82BE
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 18:01:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jehRT-0003g7-Jd; Fri, 29 May 2020 16:01:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hF3w=7L=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jehRS-0003g2-OC
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 16:01:06 +0000
X-Inumbo-ID: 9a478388-a1c5-11ea-81bc-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a478388-a1c5-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 16:01:06 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: wHREbYpI1PafjnsVZ9jennHF2HPs0u5s5d9EcytBvkkYMcs73pQiQ99yUmYzt7HUP6HMz40wg3
 OMdNGO4JaDMJhCy7hfG4kXmkcw9hHRvG1eeDmr3b79tLpwIvrPtVGlKW13nkhXhBBr83JwjE2c
 +jVdsm2nd+wSFC3N+kmTKUfn8FcV9rTeQLuToUf1+94TjzXapnuK61+PoioUM7byBqhitgAJjr
 pC/uJkCzWw2ywfLMeCAbWU9Le5E54+ciGFfdnnkhp5zU+HesZknSPKv/NDRwX/kmSOi5OVb3vx
 /ds=
X-SBRS: 2.7
X-MesageID: 19519416
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,449,1583211600"; d="scan'208";a="19519416"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24273.12731.894283.390797@mariner.uk.xensource.com>
Date: Fri, 29 May 2020 17:00:59 +0100
To: "paul@xen.org" <paul@xen.org>
Subject: RE: [PATCH v3] docs: update xenstore-migration.md
In-Reply-To: <005d01d635af$0a3e6ae0$1ebb40a0$@xen.org>
References: <20200529113709.17489-1-jgross@suse.com>
 <005d01d635af$0a3e6ae0$1ebb40a0$@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: 'Juergen Gross' <jgross@suse.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Julien Grall' <julien@xen.org>,
 'Wei Liu' <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, 'Jan
 Beulich' <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul Durrant writes ("RE: [PATCH v3] docs: update xenstore-migration.md"):
> > -----Original Message-----
> > From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Juergen Gross
> > Sent: 29 May 2020 12:37
> > To: xen-devel@lists.xenproject.org
> > Cc: Juergen Gross <jgross@suse.com>; Stefano Stabellini <sstabellini@kernel.org>; Julien Grall
> > <julien@xen.org>; Wei Liu <wl@xen.org>; Andrew Cooper <andrew.cooper3@citrix.com>; Ian Jackson
> > <ian.jackson@eu.citrix.com>; George Dunlap <george.dunlap@citrix.com>; Jan Beulich <jbeulich@suse.com>
> > Subject: [PATCH v3] docs: update xenstore-migration.md
> > 
> > Update connection record details:
> > 
> > - make flags common for sockets and domains (makes it easier to have a
> >   C union for conn-spec)
> > - add pending incoming data (needed for handling partially read
> >   requests when doing live update)
> > - add partial response length (needed for proper split to individual
> >   responses after live update)
> > 
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> LGTM
> 
> Reviewed-by: Paul Durrant <paul@xen.org>

Thanks, committed.

Ian.

