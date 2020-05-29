Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C79A41E7A0D
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 12:07:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jebvK-0005s1-7G; Fri, 29 May 2020 10:07:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mY44=7L=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jebvI-0005rr-Nk
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 10:07:32 +0000
X-Inumbo-ID: 35add962-a194-11ea-81bc-bc764e2007e4
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35add962-a194-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 10:07:32 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:51378
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jebv9-000oOY-Jb (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Fri, 29 May 2020 11:07:23 +0100
Subject: Re: [PATCH] xsm: also panic upon "flask=enforcing" when XSM_FLASK=n
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8a4c4486-cf27-66a0-5ff9-5329277deccf@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c90b70f7-e52e-405c-adb4-1303d7d1c009@citrix.com>
Date: Fri, 29 May 2020 11:07:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <8a4c4486-cf27-66a0-5ff9-5329277deccf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29/05/2020 10:34, Jan Beulich wrote:
> While the behavior to ignore this option without FLASK support was
> properly documented, it is still somewhat surprising to someone using
> this option and then still _not_ getting the assumed security. Add a
> 2nd handler for the command line option for the XSM_FLASK=n case, and
> invoke panic() when the option is specified (and not subsequently
> overridden by "flask=disabled").
>
> Suggested-by: Ian Jackson <ian.jackson@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I'm very tempted to nack this outright, lest I remind both of you of the
total disaster that was XSA-9, and the subsequent retraction of the code
which did exactly this.

If you want to do something like this, prohibit creating guests so the
administrator can still log in and unbreak, instead of having it
entering a reboot loop with no output.  The console isn't established
this early, so none of this text makes it out onto VGA/serial.

~Andrew

