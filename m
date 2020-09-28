Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBE727ADBE
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 14:28:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMsGQ-0006uA-Cn; Mon, 28 Sep 2020 12:28:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMsGO-0006u1-RO
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 12:28:16 +0000
X-Inumbo-ID: 84b8a98e-e7f3-46c1-813b-53f6c2d65027
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84b8a98e-e7f3-46c1-813b-53f6c2d65027;
 Mon, 28 Sep 2020 12:28:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601296094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hx/A1tGgugHJMfSXoMmOBIRP3qkG5/Eqz9Ku5cwrG7s=;
 b=B9DbmEYAoJ4M3rMqNSC5gHSHM3zmWvCFWd3XwpKco7JVFyUoh84VgaLVqq5fbjzBOHg1hS
 wAuim/YHAblNSBWXpx4lywAVT0fqbRNX97cA4QOKOK/FVAfoX/1af5peU8G+6UviuzRA51
 LBiB2OiCbsidhqr/FqxbOaLiOUWhFOc=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D98D3AD6B;
 Mon, 28 Sep 2020 12:28:14 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/6] x86: some assembler macro rework
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <62ffb078-d763-f845-c4b9-eeacb3358d02@suse.com>
Date: Mon, 28 Sep 2020 14:28:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Parts of this were discussed in the context of Andrew's CET-SS work.
Further parts simply fit the underlying picture. And the two final
patches get attached here simply because of their dependency: Patch
4 was sent standalone already as v2, and is unchanged from that,
while patch 6 is new.

1: replace __ASM_{CL,ST}AC
2: reduce CET-SS related #ifdef-ary
3: drop ASM_{CL,ST}AC
4: fold indirect_thunk_asm.h into asm-defns.h
5: guard against straight-line speculation past RET
6: limit amount of INT3 in IND_THUNK_*

Jan

