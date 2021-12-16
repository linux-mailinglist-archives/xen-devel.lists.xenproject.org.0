Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 723C7477E7E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 22:11:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248244.428190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxy10-0007MC-3N; Thu, 16 Dec 2021 21:10:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248244.428190; Thu, 16 Dec 2021 21:10:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxy10-0007Jb-04; Thu, 16 Dec 2021 21:10:14 +0000
Received: by outflank-mailman (input) for mailman id 248244;
 Thu, 16 Dec 2021 21:10:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sk45=RB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mxy0y-0007JV-RL
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 21:10:12 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d29fdab-5eb4-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 22:10:11 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47262)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mxy0m-000AoV-nf (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 16 Dec 2021 21:10:00 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 299521FC68;
 Thu, 16 Dec 2021 21:10:00 +0000 (GMT)
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
X-Inumbo-ID: 8d29fdab-5eb4-11ec-9e60-abaf8a552007
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <d75ef96c-ab0a-adb9-ca15-70e1c9c5e27e@srcf.net>
Date: Thu, 16 Dec 2021 21:09:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <20211216095421.12871-1-andrew.cooper3@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 0/6] x86: Support PKS
In-Reply-To: <20211216095421.12871-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/12/2021 09:54, Andrew Cooper wrote:
> I found a spare half hour, and this turned out to go very smoothly.
>
> It's tentatively RFC right now, because I'm still adding PKS support to the
> XTF comprehensive pagewalk test, but the series is definitely fit for review
> at this point.

I suppose it's worth expanding on this a little.  What I've proposed
here is the most efficient option, and it is very non-invasive but comes
with the downside that Xen can't set CR4.PKS.

It is tied to VT-x behaviour, so I've left a deliberate clobber so it
won't engage automatically if AMD add support on future CPUs.


If we want Xen to be able to use PKS, then a couple of things change.

1) PV32 needs inhibiting.  This is likely the case anyway, due to CET.
2) VT-x will need to start using the PKRS load/save controls
2a) Need new get/set_pkrs hvm_funcs accessors to abstract the
VMREAD/WRITE out of common code.
2b) guest_{rd,wr}msr() and pagewalk updated to cope
3) Whatever AMD needs (if applicable).


In terms of Xen using PKS, the first piece of low hanging fruit is
removing access to the stubs by default, to prevent stray writes from
interfering with other CPUs.

Changing PKEY is a WRMSR, so not the fastest action in the world even if
it is well optimised in microcode, but modification of the stubs is not
a fastpath, so this would be entirely fine.

~Andrew

