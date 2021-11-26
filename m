Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF1B45F310
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 18:39:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233286.404687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqfBN-0000X8-Px; Fri, 26 Nov 2021 17:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233286.404687; Fri, 26 Nov 2021 17:38:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqfBN-0000VK-ME; Fri, 26 Nov 2021 17:38:45 +0000
Received: by outflank-mailman (input) for mailman id 233286;
 Fri, 26 Nov 2021 17:38:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MiPh=QN=antioche.eu.org=bouyer@srs-se1.protection.inumbo.net>)
 id 1mqfBM-0000VE-Ci
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 17:38:44 +0000
Received: from chassiron.antioche.eu.org (chassiron.antioche.eu.org
 [2001:41d0:fe9d:1101::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1c8c173-4edf-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 18:38:42 +0100 (CET)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 1AQHcLjA006188
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Fri, 26 Nov 2021 18:38:22 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id A68632E92E7; Fri, 26 Nov 2021 18:38:16 +0100 (MET)
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
X-Inumbo-ID: b1c8c173-4edf-11ec-a9d2-d9f7a1cc8784
Date: Fri, 26 Nov 2021 18:38:16 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>,
        Simon Kuenzer <simon.kuenzer@neclab.eu>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] public: add RING_NR_UNCONSUMED_*() macros to ring.h
Message-ID: <YaEbiOXjCKpgeAuN@mail.soc.lip6.fr>
References: <20211126065547.22644-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126065547.22644-1-jgross@suse.com>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Fri, 26 Nov 2021 18:38:29 +0100 (MET)

On Fri, Nov 26, 2021 at 07:55:47AM +0100, Juergen Gross wrote:
> Today RING_HAS_UNCONSUMED_*() macros are returning the number of
> unconsumed requests or responses instead of a boolean as the name of
> the macros would imply.
> 
> As this "feature" is already being used, rename the macros to
> RING_NR_UNCONSUMED_*() and define the RING_HAS_UNCONSUMED_*() macros
> by using the new RING_NR_UNCONSUMED_*() macros. In order to avoid
> future misuse let RING_HAS_UNCONSUMED_*() really return a boolean.
> 
> Note that the known misuses need to be switched to the new
> RING_NR_UNCONSUMED_*() macros when using this version of ring.h.

AFAIK NetBSD is using RING_HAS_UNCONSUMED as a booleanm so it should
be fine with this change

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

