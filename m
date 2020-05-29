Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1E51E7ABF
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 12:39:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jecPz-0000ba-9P; Fri, 29 May 2020 10:39:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hF3w=7L=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jecPy-0000bV-N2
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 10:39:14 +0000
X-Inumbo-ID: a2d6d710-a198-11ea-a88c-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2d6d710-a198-11ea-a88c-12813bfff9fa;
 Fri, 29 May 2020 10:39:13 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: aWzodHWkH279h+ue5cAAG9u/wBMxcfcLiiH/qGcgwM1+ziwlrE/wKRMwoqPYf/gee85sirQjBP
 iOlgz6UnrmGhQvKPAT7INk2K7hUlzjg52oeMIk+WdUBQPAjVAjdIgWbwUNCCdDX7W4spmzWDG1
 8pr8PcVbR1KXT3nXwSXVfCPpvvtowPtJ4KKYHJua6T5Kqi3/zdcPMqpFXa54B7nyhkPdc2TDLm
 O+cb7EPib1XTdV/kl/S6JDUDugy5XdhC1Ztdqj7Uk6wjJ9SLy+CLpX/KsGe5z6C/eJtopCXI0C
 FN0=
X-SBRS: 2.7
X-MesageID: 18744923
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,448,1583211600"; d="scan'208";a="18744923"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24272.58955.340315.479568@mariner.uk.xensource.com>
Date: Fri, 29 May 2020 11:39:07 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xsm: also panic upon "flask=enforcing" when XSM_FLASK=n
In-Reply-To: <c90b70f7-e52e-405c-adb4-1303d7d1c009@citrix.com>
References: <8a4c4486-cf27-66a0-5ff9-5329277deccf@suse.com>
 <c90b70f7-e52e-405c-adb4-1303d7d1c009@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew Cooper writes ("Re: [PATCH] xsm: also panic upon "flask=enforcing" when XSM_FLASK=n"):
> On 29/05/2020 10:34, Jan Beulich wrote:
> > While the behavior to ignore this option without FLASK support was
> > properly documented, it is still somewhat surprising to someone using
> > this option and then still _not_ getting the assumed security. Add a
> > 2nd handler for the command line option for the XSM_FLASK=n case, and
> > invoke panic() when the option is specified (and not subsequently
> > overridden by "flask=disabled").
> >
> > Suggested-by: Ian Jackson <ian.jackson@citrix.com>
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I'm very tempted to nack this outright, lest I remind both of you of the
> total disaster that was XSA-9, and the subsequent retraction of the code
> which did exactly this.

You are right to remind me of, well, whatever it is you are trying to
remind me of, since I'm afraid I don't know what you mean ...  Do you
really mean XSA-9 ?  I went at looked it up and the connection eludes
me.

> If you want to do something like this, prohibit creating guests so the
> administrator can still log in and unbreak, instead of having it
> entering a reboot loop with no output.  The console isn't established
> this early, so none of this text makes it out onto VGA/serial.

Certainly a silent reboot loop would be very unhelpful.  I think if
Xen were to actually print something to the serial console that would
be tolerable (since the administrator can then adjust the boot command
line), but your suggestion to prohibit guest creation would be fine
too.

Thanks,
Ian.

