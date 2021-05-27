Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0333A392CA6
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 13:27:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133014.248028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmEAR-00086Y-Hv; Thu, 27 May 2021 11:27:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133014.248028; Thu, 27 May 2021 11:27:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmEAR-00084c-DT; Thu, 27 May 2021 11:27:11 +0000
Received: by outflank-mailman (input) for mailman id 133014;
 Thu, 27 May 2021 11:27:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmEAP-00084W-Um
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 11:27:09 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83b0ebba-2998-43f0-8cb3-3684e685cd9d;
 Thu, 27 May 2021 11:27:09 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 234541FD2A;
 Thu, 27 May 2021 11:27:08 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id DA06E11A98;
 Thu, 27 May 2021 11:27:07 +0000 (UTC)
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
X-Inumbo-ID: 83b0ebba-2998-43f0-8cb3-3684e685cd9d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622114828; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BR10Lv3o2g8TOqjBMtoXg4piCGPt5hqgiPINwMFsx8k=;
	b=FEQvsTRF3Cn66NpPKXDNvqzgQUJPqcaz4IpsFdnLwypg/2DPh3rRW5Llrd7SO5EM7NNx1g
	6kctuHTRvuu8H3kXg2llE0TprEVN0BOTeInQIR/FVZdxALVVdq58C6JSKbdmQlgQBLKGLr
	CzV0+F0aIdx0FXBvvWAj48oVVSguvvQ=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v6 0/3] evtchn: (not so) recent XSAs follow-on
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <01bbf3d4-ca6a-e837-91fe-b34aa014564c@suse.com>
Date: Thu, 27 May 2021 13:27:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

These are grouped into a series largely because of their origin,
not so much because there are (heavy) dependencies among them.
The main change from v6 is the dropping of three more patches,
and re-basing.

1: slightly defer lock acquire where possible
2: add helper for port_is_valid() + evtchn_from_port()
3: type adjustments

Jan

