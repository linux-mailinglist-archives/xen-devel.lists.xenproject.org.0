Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0762A4376
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 11:56:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18226.43166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZtz8-0004ro-Nm; Tue, 03 Nov 2020 10:56:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18226.43166; Tue, 03 Nov 2020 10:56:18 +0000
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
	id 1kZtz8-0004rP-KY; Tue, 03 Nov 2020 10:56:18 +0000
Received: by outflank-mailman (input) for mailman id 18226;
 Tue, 03 Nov 2020 10:56:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kZtz7-0004rK-Og
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:56:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id cb50a6d0-afb3-4660-b2f5-dc039872bad7;
 Tue, 03 Nov 2020 10:56:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 202A3ACC6;
 Tue,  3 Nov 2020 10:56:16 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kZtz7-0004rK-Og
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:56:17 +0000
X-Inumbo-ID: cb50a6d0-afb3-4660-b2f5-dc039872bad7
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id cb50a6d0-afb3-4660-b2f5-dc039872bad7;
	Tue, 03 Nov 2020 10:56:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604400976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DSYgoCWg+O2ARrh9htTTAYEpYfiAsuVOPNb70f//H6g=;
	b=s9Bbik8yGbntPDPFJ8VUPmUuRKNRuIEOCYWZsvuqIgaELjQRoHeS9yZ/ecGduHlfTW1bX0
	M6caXtlTchlls2cy4SPMZmyIwIuJ9u0S3U3fPFu+eH/qbS5N6T0kN+g7nu/bDI/ouhaJ3T
	7P7pDMZe/LS/eLaSsevLDt6yas55ouY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 202A3ACC6;
	Tue,  3 Nov 2020 10:56:16 +0000 (UTC)
Subject: [PATCH 1/5] x86/PV: consistently inline {,un}adjust_guest_l<N>e()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <10a01f61-197b-7df4-192d-917fe135df70@suse.com>
Message-ID: <686d7f09-6313-6dd0-2133-8646308aea5b@suse.com>
Date: Tue, 3 Nov 2020 11:56:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <10a01f61-197b-7df4-192d-917fe135df70@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Commit 8a74707a7c ("x86/nospec: Use always_inline to fix code gen for
evaluate_nospec") converted inline to always_inline for
adjust_guest_l[134]e(), but left adjust_guest_l2e() and
unadjust_guest_l3e() alone without saying why these two would differ in
the needed / wanted treatment. Adjust these two as well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Actually I question the need for always_inline here, for two reasons:
1) All that's guarded are updates to local variables, depending on
   merely the values held by these local variables (really: function
   arguments) on input. As a result it would look to me as if we wanted
   evaluate_nospec()-free variants of is_pv{,_32bit}_domain() and alike,
   to be used e.g. here.
2) These functions don't act as predicates, and hence the concern
   expressed in said commit doesn't apply here: Callers wouldn't observe
   misplaced LFENCEs, as they don't use the results of these helpers for
   further (direct) code flow control.
---
So far I've observed only clang to not inline the two functions when
just "inline" is in place.

--- a/xen/arch/x86/pv/mm.h
+++ b/xen/arch/x86/pv/mm.h
@@ -99,8 +99,8 @@ static always_inline l1_pgentry_t adjust
     return l1e;
 }
 
-static inline l2_pgentry_t adjust_guest_l2e(l2_pgentry_t l2e,
-                                            const struct domain *d)
+static always_inline l2_pgentry_t adjust_guest_l2e(l2_pgentry_t l2e,
+                                                   const struct domain *d)
 {
     if ( likely(l2e_get_flags(l2e) & _PAGE_PRESENT) &&
          likely(!is_pv_32bit_domain(d)) )
@@ -119,8 +119,8 @@ static always_inline l3_pgentry_t adjust
     return l3e;
 }
 
-static inline l3_pgentry_t unadjust_guest_l3e(l3_pgentry_t l3e,
-                                              const struct domain *d)
+static always_inline l3_pgentry_t unadjust_guest_l3e(l3_pgentry_t l3e,
+                                                     const struct domain *d)
 {
     if ( unlikely(is_pv_32bit_domain(d)) &&
          likely(l3e_get_flags(l3e) & _PAGE_PRESENT) )


