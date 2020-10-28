Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A77129CF2B
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 10:21:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13416.34026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXhdE-00054E-7b; Wed, 28 Oct 2020 09:20:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13416.34026; Wed, 28 Oct 2020 09:20:36 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXhdE-00053p-4G; Wed, 28 Oct 2020 09:20:36 +0000
Received: by outflank-mailman (input) for mailman id 13416;
 Wed, 28 Oct 2020 09:20:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXhdD-00053k-Gh
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 09:20:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87249370-37f1-4a88-a3c4-122a90584149;
 Wed, 28 Oct 2020 09:20:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5A1FFAE55;
 Wed, 28 Oct 2020 09:20:33 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXhdD-00053k-Gh
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 09:20:35 +0000
X-Inumbo-ID: 87249370-37f1-4a88-a3c4-122a90584149
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 87249370-37f1-4a88-a3c4-122a90584149;
	Wed, 28 Oct 2020 09:20:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603876833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lYdSBZ4GqDWpjsgCkyHXRTUKdyPlmdwYdDzfWbdn6vg=;
	b=rFAfa3UcQLC2ivGNOd3yK47deNhW+ZTM5tpdAdWtFGH/QMlCHq6fpSWwoWe6onLqAUrcMO
	nq9VylGNKl7mVXs6cjcurTZYhBb3KnRjobuQxsri5t3EnudUv5MpKhYh8UbmStHUK1sffN
	lXHPKGscCk1fan/zX996JhvpdrMripI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5A1FFAE55;
	Wed, 28 Oct 2020 09:20:33 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/5] x86/p2m: hook adjustments
Message-ID: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
Date: Wed, 28 Oct 2020 10:20:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This started out with me getting confused by the two write_p2m_entry()
hooks we have - there really ought to be no more than one, or if two
were absolutely needed they imo would better have distinct names. Other
adjustment opportunities (and I hope they're improvements) were found
while getting rid of that one unnecessary layer of indirect calls.

1: p2m: paging_write_p2m_entry() is a private function
2: p2m: collapse the two ->write_p2m_entry() hooks
3: p2m: suppress audit_p2m hook when possible
4: HAP: move nested-P2M flush calculations out of locked region
5: [RFC] p2m: split write_p2m_entry() hook

Jan

