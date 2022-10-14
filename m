Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FCE5FEC6B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 12:16:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422674.668862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojHjl-00012J-Ei; Fri, 14 Oct 2022 10:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422674.668862; Fri, 14 Oct 2022 10:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojHjl-0000zQ-Bs; Fri, 14 Oct 2022 10:16:17 +0000
Received: by outflank-mailman (input) for mailman id 422674;
 Fri, 14 Oct 2022 10:16:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ux67=2P=citrix.com=prvs=2791c07bb=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ojHjj-0000zK-DU
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 10:16:15 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ad9b528-4ba9-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 12:16:14 +0200 (CEST)
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
X-Inumbo-ID: 3ad9b528-4ba9-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665742574;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jQLaiJm3SpCLNIkC9bypqQU9EPoKcDb3PoId3J3oczA=;
  b=fkK7E/HwEohlopFFAPpjDDlpetVbF83EsA8aCTvftbGn/Km0H9WDlOps
   ToZsxLFcgbKAvmwQN4pUHFWrjuoGNdIFf+ZGRXuMpSE6k25R8irzTVLU5
   iaesYAx+paYMvPDyJ925nSZF/Dd6rsiOnnreh+1Xw/8VCdXBLnVfLDC/5
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 81844070
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:B/H7oa5N7R7PmkTGmVeUVgxRtLvHchMFZxGqfqrLsTDasY5as4F+v
 mVNXDuDO6uDZGP9e4h0YIy38kJTsMWGmtJiSQVv/3xmHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvymTras1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPewP9TlK6q4mlB5gViPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5sE1hqq
 PgyCApdNBGRqPOVmOOQF6pj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpPE+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUozTFZkJxhnAz
 o7A1zXAWQMfO8ek8muM0n+BgMX92gngc7tHQdVU8dY12QbOlwT/EiY+V1ShpuKiolWjQN8ZI
 EsRkgIyrK0a5EGtCN7nUHWQomOAvxMac8pdFas98g7l4qbd/QuxHGUPST9FLts8u6ceSDgn0
 FbPgt3oACB0vaOcYXWH/7yQoHW5Pi19BWMafioFUQst6sHuup0ulQnISst/EamzlZv+HjSY6
 yCHqm0yiqseieYP1r6n5hbXjjS0vJ/LQwUpoALNUQqN8QdRdIOjIYuy5jDz7/xNMYKYRVmpp
 2Uflo6V6+VmMH2WvHXTGqNXRujvvqvbdm2H6bJyI3U/3y+/wlr+eapw2mEkJVVGI+VcKBS0I
 0CG7Gu9+6RvFHetaKZ2Zae4BMIr0bXsGLzZaxzEUjZdSsMvLVHapUmCcWbVhjmwyxZ0zcnTL
 L/BKa6R4WAm5bOLJdZcb8MUyvcVyy833gs/rrirnk38gdJyiJN4IIrp0WdijMhjsctoQy2Pq
 b6z0vdmLD0GCYXDjtH/q9J7ELzzBSFT6WrKg8JWbPWfBQFtBXssDfTcqZt4JdI4wfQLyr6To
 yzlMqO99LYYrSSdQThml1g5MO+/NXqBhShT0dMQ0aaAhCF4PNfHAFY3fJorZ7g3nNFeIQpPZ
 6BdIa2oW60XIhyeomR1UHUIhNE7HPhdrVnVZHTNjflWV8MIejElDfe+Ile3qXdWXnvr3Sb8y
 pX5vj7mrVM4b1wKJK7rhDiHljtdYVB1dDpOYnb1
IronPort-HdrOrdr: A9a23:I7/FP6H2RusG4lL0pLqE6seALOsnbusQ8zAXP0AYc31om+ij5q
 eTdZUgpHvJYVkqNE3I9eruBEDEewK7yXcX2/h1AV7BZniEhILAFugLhuGO/9SjIVydygc079
 YYT0EUMr3N5DZB4/rH3A==
X-IronPort-AV: E=Sophos;i="5.95,184,1661832000"; 
   d="scan'208";a="81844070"
Date: Fri, 14 Oct 2022 11:16:04 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Christian Lindig <christian.lindig@citrix.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, "Tim (Xen.org)"
	<tim@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>, David Scott <dave@recoil.org>, Julien Grall
	<julien@xen.org>, George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [XEN PATCH for-4.17 v5 05/17] tools: Remove -Werror everywhere
 else
Message-ID: <Y0k25FFsREuri6Qx@perard.uk.xensource.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
 <20221013130513.52440-6-anthony.perard@citrix.com>
 <b38e17b3-a4d5-c95e-1cbb-71b5ede8c51f@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b38e17b3-a4d5-c95e-1cbb-71b5ede8c51f@citrix.com>

On Thu, Oct 13, 2022 at 03:13:32PM +0000, Andrew Cooper wrote:
> On 13/10/2022 14:05, Anthony Perard wrote:
> > diff --git a/tools/debugger/gdbsx/Rules.mk b/tools/debugger/gdbsx/Rules.mk
> > index 920f1c87fb..0610db873b 100644
> > --- a/tools/debugger/gdbsx/Rules.mk
> > +++ b/tools/debugger/gdbsx/Rules.mk
> > @@ -1,6 +1,6 @@
> >  include $(XEN_ROOT)/tools/Rules.mk
> >  
> > -CFLAGS   += -Werror -Wmissing-prototypes 
> > +CFLAGS   += -Wmissing-prototypes 
> >  # (gcc 4.3x and later)   -Wconversion -Wno-sign-conversion
> >  
> >  CFLAGS-$(clang) += -Wno-ignored-attributes
> >
> 
> This hunk introduces trailing whitespace.

No, but it would be a good opportunity to remove it, I agree.

Cheers,

-- 
Anthony PERARD

