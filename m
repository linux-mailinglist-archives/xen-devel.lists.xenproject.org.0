Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEA131D66D
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 09:16:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86142.161360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCI0Y-0001UA-Ei; Wed, 17 Feb 2021 08:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86142.161360; Wed, 17 Feb 2021 08:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCI0Y-0001Tn-BH; Wed, 17 Feb 2021 08:16:26 +0000
Received: by outflank-mailman (input) for mailman id 86142;
 Wed, 17 Feb 2021 08:16:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFXw=HT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lCI0X-0001Ti-81
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 08:16:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88919c7c-27dc-4eb2-b48d-ba0d520c285e;
 Wed, 17 Feb 2021 08:16:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B7242AFF1;
 Wed, 17 Feb 2021 08:16:23 +0000 (UTC)
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
X-Inumbo-ID: 88919c7c-27dc-4eb2-b48d-ba0d520c285e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613549783; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wkFJ/b05L0J/NukyWmjGp+kEZkAv1xGr0xeiUNwWK/w=;
	b=KdPnlmPHlzQfK0Wz1c7Wj9W/mNsWgoszF16+GESNvky6Z8/zQcaTd6KrslfsEoHiYh+DRe
	JQChSMjaF63949Ol0LP3oFsxQmp+bBFOvazW0UvKV5hnigOTPj7juPaOlgc6GXh2+BJDS8
	GPZ6q5lIBn0Zad5b4PRd9zEiHNjOUgE=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/8] x86/PV: avoid speculation abuse through guest
 accessors
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Message-ID: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
Date: Wed, 17 Feb 2021 09:16:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Re-sending primarily for the purpose of getting a release ack, an
explicit release nak, or an indication of there not being a need,
all for at least the first three patches here (which are otherwise
ready to go in). I've dropped the shadow part of the series from
this re-submission, because it has all got reviewed by Tim already
and is intended for 4.16 only anyway. I'm re-including the follow
up patches getting the code base in consistent shape again, as I
continue to think this consistency goal is at least worth a
consideration towards a freeze exception.

1: split __{get,put}_user() into "guest" and "unsafe" variants
2: split __copy_{from,to}_user() into "guest" and "unsafe" variants
3: PV: harden guest memory accesses against speculative abuse
4: rename {get,put}_user() to {get,put}_guest()
5: gdbsx: convert "user" to "guest" accesses
6: rename copy_{from,to}_user() to copy_{from,to}_guest_pv()
7: move stac()/clac() from {get,put}_unsafe_asm() ...
8: PV: use get_unsafe() instead of copy_from_unsafe()

Jan

