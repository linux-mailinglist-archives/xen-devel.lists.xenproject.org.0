Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 149711DD347
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 18:47:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jboL4-00048p-EG; Thu, 21 May 2020 16:46:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2WPz=7D=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jboL2-00048j-LD
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 16:46:32 +0000
X-Inumbo-ID: 9f341300-9b82-11ea-b9cf-bc764e2007e4
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f341300-9b82-11ea-b9cf-bc764e2007e4;
 Thu, 21 May 2020 16:46:31 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:39364
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jboKy-000WUp-Kv (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Thu, 21 May 2020 17:46:28 +0100
Subject: Re: [PATCH v3] x86/PV: remove unnecessary toggle_guest_pt() overhead
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <24d8b606-f74b-9367-d67e-e952838c7048@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d7840278-b999-65fa-40bf-2b78e5266837@citrix.com>
Date: Thu, 21 May 2020 17:46:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <24d8b606-f74b-9367-d67e-e952838c7048@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05/05/2020 07:16, Jan Beulich wrote:
> While the mere updating of ->pv_cr3 and ->root_pgt_changed aren't overly
> expensive (but still needed only for the toggle_guest_mode() path), the
> effect of the latter on the exit-to-guest path is not insignificant.
> Move the logic into toggle_guest_mode(), on the basis that
> toggle_guest_pt() will always be invoked in pairs, yet we can't safely
> undo the setting of root_pgt_changed during the second of these
> invocations.
>
> While at it, add a comment ahead of toggle_guest_pt() to clarify its
> intended usage.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I'm still of the opinion that the commit message wants rewriting to get
the important points across clearly.

And those are that toggle_guest_pt() is called in pairs specifically to
read kernel data structures when emulating a userspace action, and that
this doesn't modify cr3 from the guests point of view, and therefore
doesn't need the resync on exit-to-guest path.

~Andrew

