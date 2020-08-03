Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6642B23A8CD
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 16:48:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2bkd-00044u-Tg; Mon, 03 Aug 2020 14:47:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k2bkc-00044p-PM
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 14:47:42 +0000
X-Inumbo-ID: 485fd780-d598-11ea-9097-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 485fd780-d598-11ea-9097-bc764e2007e4;
 Mon, 03 Aug 2020 14:47:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 59A39ACC8;
 Mon,  3 Aug 2020 14:47:56 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 00/10] x86emul: full coverage mem access / write testing
Message-ID: <97ca3d9c-7540-c7b1-cf84-34c75c9127df@suse.com>
Date: Mon, 3 Aug 2020 16:47:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

... and a few fixes resulting from this work. This completes what
was started for legacy encoded GPR insns in a rush before 4.14.

There's one thing I'm still planning on top of both this and the
EVEX-disp8 checking: For all encodings we produce via general
logic (and in particular without involvement of any assembler) I'd
like to add a kind of logging mechanism, the output of which could
be fed to gas and then some disassembler, to allow verification
that the produced encodings are actually valid ones. See e.g. the
first patch here or commit 5f55389d6960 - the problems addressed
there could have been caught earlier if the generated encodings
could be easily disassembled. What's not clear to me here is
whether this is deemed generally useful, or whether I should make
this a private addition of mine.

01: adjustments to mem access / write logic testing
02: extend decoding / mem access testing to FPU insns
03: extend decoding / mem access testing to MMX / SSE insns
04: extend decoding / mem access testing to VEX-encoded insns
05: extend decoding / mem access testing to XOP-encoded insns
06: AVX512{F,BW} down conversion moves are memory writes
07: AVX512F scatter insns are memory writes
08: AVX512PF insns aren't memory accesses
09: extend decoding / mem access testing to EVEX-encoded insns
10: correct AVX512_BF16 insn names in EVEX Disp8 test

Jan

