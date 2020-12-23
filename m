Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD242E1854
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 06:20:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58160.102098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krwYO-0002Pb-CT; Wed, 23 Dec 2020 05:19:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58160.102098; Wed, 23 Dec 2020 05:19:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krwYO-0002P5-7R; Wed, 23 Dec 2020 05:19:16 +0000
Received: by outflank-mailman (input) for mailman id 58160;
 Wed, 23 Dec 2020 05:19:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xcbs=F3=redhat.com=jpoimboe@srs-us1.protection.inumbo.net>)
 id 1krwYN-0002OV-0I
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 05:19:15 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b18f1904-582d-4fad-a97d-4e30598e20e5;
 Wed, 23 Dec 2020 05:19:12 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-lUw8cNt-Px2VJC9L_UNyAQ-1; Wed, 23 Dec 2020 00:19:08 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEDE3879500;
 Wed, 23 Dec 2020 05:19:06 +0000 (UTC)
Received: from treble.redhat.com (ovpn-117-91.rdu2.redhat.com [10.10.117.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C619719D9C;
 Wed, 23 Dec 2020 05:19:05 +0000 (UTC)
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
X-Inumbo-ID: b18f1904-582d-4fad-a97d-4e30598e20e5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608700752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vW2cW4TjsKdveYtKoF4OGqFRdopX+oDho5T11toLq90=;
	b=R+u/HNNFiYVHnQ6q7UENI455AlwHevhyYeatzR03hQDCHcH0nxOLBaiuiRffOUL3oYfs9i
	6dj0lY7yehHnLu/hGcGLX34ohKloDEMtRkVciFGYwLaEejNzIS9H77UZeQPsI1Ig+NX02G
	oMQWhR3eK7YxS4OFi2q2euw6OXp5Ffw=
X-MC-Unique: lUw8cNt-Px2VJC9L_UNyAQ-1
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Miroslav Benes <mbenes@suse.cz>
Subject: [PATCH 0/3] Alternatives vs ORC, a slightly easier way
Date: Tue, 22 Dec 2020 23:18:07 -0600
Message-Id: <cover.1608700338.git.jpoimboe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23

These patches replace Peter's "Alternatives vs ORC, the hard way".  The
end result should be the same (support for paravirt patching's using of
alternatives which modify the stack).

Josh Poimboeuf (3):
  objtool: Refactor ORC section generation
  objtool: Add 'alt_group' struct
  objtool: Support stack layout changes in alternatives

 .../Documentation/stack-validation.txt        |  16 +-
 tools/objtool/Makefile                        |   4 -
 tools/objtool/arch.h                          |   4 -
 tools/objtool/builtin-orc.c                   |   6 +-
 tools/objtool/check.c                         | 190 ++++++-----
 tools/objtool/check.h                         |  22 +-
 tools/objtool/objtool.h                       |   3 +-
 tools/objtool/orc_gen.c                       | 308 ++++++++++--------
 tools/objtool/weak.c                          |   7 +-
 9 files changed, 315 insertions(+), 245 deletions(-)

-- 
2.29.2


