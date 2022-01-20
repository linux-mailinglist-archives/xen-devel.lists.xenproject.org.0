Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E01F8495236
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 17:18:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259139.447069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAa85-000746-7z; Thu, 20 Jan 2022 16:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259139.447069; Thu, 20 Jan 2022 16:17:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAa85-00072A-4L; Thu, 20 Jan 2022 16:17:41 +0000
Received: by outflank-mailman (input) for mailman id 259139;
 Thu, 20 Jan 2022 16:17:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFdd=SE=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nAa83-000724-T7
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 16:17:39 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c37ab4d-7a0c-11ec-bc18-3156f6d857e4;
 Thu, 20 Jan 2022 17:17:39 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:49140)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nAa82-0004Ql-6x (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 20 Jan 2022 16:17:38 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id E564A1FB2F;
 Thu, 20 Jan 2022 16:17:37 +0000 (GMT)
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
X-Inumbo-ID: 7c37ab4d-7a0c-11ec-bc18-3156f6d857e4
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <5a8228df-b3f9-609e-e7fb-d0f8a5ed5413@srcf.net>
Date: Thu, 20 Jan 2022 16:17:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <08b293b3-e04a-9230-e7ec-dd7da9d198b1@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] x86/time: minor adjustments to init_pit()
In-Reply-To: <08b293b3-e04a-9230-e7ec-dd7da9d198b1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/01/2022 10:36, Jan Beulich wrote:
> For one, "using_pit" shouldn't be set ahead of the function's last
> (for now: only) error path. Otherwise "clocksource=pit" on the command
> line can lead to misbehavior when actually taking that error path.
>
> And then make an implicit assumption explicit: CALIBRATE_FRAC cannot,
> for example, simply be changed to 10. The way init_pit() works, the
> upper bound on the calibration period is about 54ms.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> Really I've noticed this while considering what would happen if someone
> specified  "clocksource=pit" on the shim's command line. Unlike "hpet"
> and "acpi", "pit" presently wouldn't be (explicitly) ignored. While,
> aiui, right now the only error path would be taken (due to port 0x61
> reads being supposed to get back 0xff), I don't think we can build on
> that longer term: Seeing what we use port 0x61 for in traps.c, I think
> sooner or later we will need to have some form of emulation for it. Such
> emulation is then not unlikely to continuously report 0 in the bit in
> question. That would leed to an infinite loop here.

If we're not already doing it, pv shim really ought to set the FADT
hardware reduced bits.  There should be no need to depend on heuristics
around ~0.

I do suspect that the emulation for port 0x61 is obsolete enough for us
to consider dropping.

~Andrew

