Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C17004B700A
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 17:14:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273394.468566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK0Sw-0003hj-ID; Tue, 15 Feb 2022 16:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273394.468566; Tue, 15 Feb 2022 16:14:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK0Sw-0003fr-FC; Tue, 15 Feb 2022 16:14:10 +0000
Received: by outflank-mailman (input) for mailman id 273394;
 Tue, 15 Feb 2022 16:14:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tLD3=S6=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nK0Su-0003BB-3p
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 16:14:08 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c28c028-8e7a-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 17:14:07 +0100 (CET)
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
X-Inumbo-ID: 4c28c028-8e7a-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644941646;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Y/jaHwtNL/OjbjUcd0ZP5dRh8I3SPFyPOoEntw5YDac=;
  b=HFTq1Pa/cFChtTaa3r1gjRHGBxcLpHXqjMSTmqkQ/IO5kzwZbdILsZgj
   bVTeGS51iuLJ3PcZ1nvY5VgBxjNhReTMo1b7+1vgIRHd7efQjftmOeJUX
   PIBmOvWaZEZWYD/YdgqhLdiIobW2e0w/VAv8iR51JApOy+MziYF0yuSXh
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 2w+Q22UDzKXMDI+Rpo8rpp3yWfiGdtl0y4JyFgyZ+LF8LG/CBA7Y77kG8Q/OAdzN6lHWbAFRWd
 T5jjj5bjGMC1MyqJ79q+G1h/XU8jfBRva/+lY2uu3EtP8kyUJVAg06F1mCCUJOgn5cm53SvajX
 nq4jYyMQWeqY8gRI1KL/pbegDnzWyN91BfdbBU0BNmArdmlvZVeNsIkCqus/Uq+GNoWbZByKmn
 cT0gHe9R6Fd6d1M//A3Uf41oOTF8N1rNGUFF2XR7hmqBXmQw9cbGLwsySGtWuk/6pX3bvklt22
 TnkLI2hkY18EYlb0tE6xSvZV
X-SBRS: 5.1
X-MesageID: 64260215
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1Fy6lqNQ5atS2zPvrR2PkMFynXyQoLVcMsEvi/4bfWQNrUol12dSm
 jcYWGGHOarfNmGjLdknb4vj8UNSvZHQnNcwSAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En1500s+w7VRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYozyKm9Bu+
 NhPjJ+1VVoXB7PmssEEDBYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YuBqmsQkKtitJI4Fs2ts5TrYEewnUdbIRKCiCdpwgmtq2JgURKu2i
 8wxUzRINEzvOEN2Mw1NFI9muKCyiX/QSmgNwL6SjfVuuDWCpOBr65D9PdyQdtGUSMF9mkeDu
 nmA72n/GgsdNtGU1XyC6H3Eru3FkD7/WYkSPKal7fMsi1qWrlH/EzVPCwH9+6PgzBfjBZQPc
 CT45xbCs4A790irUenwXSS7pWLZgCcCcfB1CrI1vVTlJrXv3y6VAW0NTzhkYdMgtdMrSTFC6
 mJlj+8FFhQ07uTLFCv1GqO86GrrZHNLdTNqiTosEFNdi+QPtr3fmf4mojxLNKeuxuP4Fjjrq
 9xhhHhv3u5D5SLnOkjSwLwmv95OjsWTJuLWzl+ONo5A0u+eTNT7D7FEEXCBsZ59wH+xFzFtR
 kQslcmE9/wpBpqQjiGLS+hlNOj3u6raYG2B3AY2RMNJG9GRF5mLJ9443d2DDB0xbpZslcHBP
 Cc/Rj+9FLcMZSD3PMebkqq6CtgwzLiIKDgWfqu8Uza6WbAoLFXv1Hg3PSa4hjmx+GBxwfBXE
 crKKq6EUCdFYZmLORLrHo/xJ5dwnXtgrY4SLLimpymaPU22PSXLF+5daQHWMYjULsqs+W3oz
 jqWDOPSoz03bQE0SnK/HVc7IQ9YIH4lK4rxrsALJOePLhA/QDMqCuPLwKNncItgxvwHmuDN9
 3C7e0lZ1Fug2iGXdVTUMihuOOH1QJJyjXMnJihwb1ym7GcuPNS056AFepppIbR+rL5/zeR5R
 uUuctmbBqgdUSzO/jkQNMGvrIFreBmxqxiJOi6pPGo2c5J6HlSb8d74ZAr/siIJC3Pv58c5p
 rSh0CLdQIYCGFs+XJqHNqr3wgro73YHme90U0/ZGfVpeR3hoNpwNij8rv4rOMVQex/N8SSXi
 lSNChACqOiT/4JsqIvVhbqJppuCGvdlGhYIBHHS6Lu7OHWI/menxoMcAu+EcSqECTHx8aSmI
 +5U0+v9ILsMm1MT69hwFLNizKQf4drzpuAFklQ4TSuTN1n7WKl9JnSm3NVUsvwfz7BUjgK6R
 0aT94QIIr6OIs7kTAYcKQdNgj5vDh3Idu0+NcgIHXg=
IronPort-HdrOrdr: A9a23:2PIcVK4+U4y7jruZhAPXwM7XdLJyesId70hD6qhwISY6TiW9rb
 HLoB19726StN9xYgBEpTnuAsS9qB/nmaKdpLNhW4tKPzOW2ldATrsD0WKK+VSJcEfDH6xmpM
 RdmsBFeaTN5DNB7PoSjjPWL+od
X-IronPort-AV: E=Sophos;i="5.88,371,1635220800"; 
   d="scan'208";a="64260215"
Date: Tue, 15 Feb 2022 16:14:01 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: tools backports
Message-ID: <YgvRSZnDqO1CAWzV@perard.uk.xensource.com>
References: <710fd687-16d5-c088-d3be-749851e6eab3@suse.com>
 <Ygo1Hh8RoZfmPOjo@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ygo1Hh8RoZfmPOjo@Air-de-Roger>

On Mon, Feb 14, 2022 at 11:55:26AM +0100, Roger Pau Monné wrote:
> On Mon, Feb 14, 2022 at 11:18:44AM +0100, Jan Beulich wrote:
> > Anthony,
> > 
> > I have a couple of simple tool stack backports queued, which - with your
> > agreement - I would want to put onto the stable tree whenever I get
> > around to applying the next batch of backports:
> > 
> > d9d3496e817a tools/libs/light: don't touch nr_vcpus_out if listing vcpus and returning NULL
> > e62cc29f9b6c tools/libs: Fix build dependencies
> 
> I would also like to request:
> 
> 0bdc43c8de libxl: force netback to wait for hotplug execution before connecting

Looks good to be backported as well.

Thanks,

-- 
Anthony PERARD

