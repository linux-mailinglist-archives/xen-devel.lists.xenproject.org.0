Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FD27F876C
	for <lists+xen-devel@lfdr.de>; Sat, 25 Nov 2023 02:16:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641027.999890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6hHG-0001PW-Is; Sat, 25 Nov 2023 01:16:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641027.999890; Sat, 25 Nov 2023 01:16:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6hHG-0001Nr-G0; Sat, 25 Nov 2023 01:16:10 +0000
Received: by outflank-mailman (input) for mailman id 641027;
 Sat, 25 Nov 2023 01:16:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tn7F=HG=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1r6hHF-0001Nl-Dk
 for xen-devel@lists.xenproject.org; Sat, 25 Nov 2023 01:16:09 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31743bc2-8b30-11ee-9b0e-b553b5be7939;
 Sat, 25 Nov 2023 02:16:01 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 3AP1FZEH047548
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 24 Nov 2023 20:15:41 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 3AP1FYj8047547;
 Fri, 24 Nov 2023 17:15:34 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 31743bc2-8b30-11ee-9b0e-b553b5be7939
Date: Fri, 24 Nov 2023 17:15:34 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Henry Wang <Henry.Wang@arm.com>,
        xen-devel@lists.xenproject.org,
        George Dunlap <george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
        Neowutran <xen@neowutran.ovh>
Subject: Re: [PATCH] x86/x2apic: introduce a mixed physical/cluster mode
Message-ID: <ZWFKtrBl2kpdvjBC@mattapan.m5p.com>
References: <20231024135150.49232-1-roger.pau@citrix.com>
 <ZT/Cs+MsBPibcc9D@mattapan.m5p.com>
 <ZT_LWjKgQxOE9lpj@macbook>
 <ZUqRfgAmzJRImW4O@mattapan.m5p.com>
 <hqj6xjxb7r5lb52biejbzzue2jth3rcth3bouadya4jwarll4l@oswerq2ejbli>
 <ZVgp0wshHg3ZQ/Md@mattapan.m5p.com>
 <81f6bbd5-0487-461a-af1a-dbb6ead47cab@citrix.com>
 <ZV1Rz+FmmyWFHiM9@mattapan.m5p.com>
 <ZV8d2ZiiiBBNySgc@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZV8d2ZiiiBBNySgc@macbook>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

On Thu, Nov 23, 2023 at 10:39:37AM +0100, Roger Pau Monné wrote:
> On Tue, Nov 21, 2023 at 04:56:47PM -0800, Elliott Mitchell wrote:
> > It was insisted that full logs be sent to xen-devel.  Perhaps I am
> > paranoid, but I doubt I would have been successful at scrubbing all
> > hardware serial numbers.  As such, I was willing to post substantial
> > sections, but not everything.
> 
> Can you please point out which hardware serial numbers are you
> referring to, and where are they printed in Xen dmesg?

I didn't confirm the presence of hardware serial numbers getting into
Xen's dmesg, but there was a lot of data and many hexadecimal numbers.
With 4000 lines of output, checking for concerning data is troublesome.

There was enough for alarms to trigger.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



