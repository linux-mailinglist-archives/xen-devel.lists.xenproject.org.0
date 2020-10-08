Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8952879F8
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 18:29:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4526.11835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQYmO-0008E7-T4; Thu, 08 Oct 2020 16:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4526.11835; Thu, 08 Oct 2020 16:28:32 +0000
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
	id 1kQYmO-0008Dk-Pv; Thu, 08 Oct 2020 16:28:32 +0000
Received: by outflank-mailman (input) for mailman id 4526;
 Thu, 08 Oct 2020 16:28:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uUpI=DP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kQYmO-0008Df-8P
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 16:28:32 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7941e7bb-7831-4762-8da7-7db0d757b870;
 Thu, 08 Oct 2020 16:28:30 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uUpI=DP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kQYmO-0008Df-8P
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 16:28:32 +0000
X-Inumbo-ID: 7941e7bb-7831-4762-8da7-7db0d757b870
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7941e7bb-7831-4762-8da7-7db0d757b870;
	Thu, 08 Oct 2020 16:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602174510;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3N62fHmZztOzbsPScfZDPlmQCibQFLFqXrLGiviPvWw=;
  b=gDom9NiVXKLDBWqZ+qLdDiGrDki9+Xxci32Va9UolJ+GIKq15m4cxFET
   bqL9pLLV4zvKRlpotnjP0tpfLUcyPfR/Lt2UdrtUs1F9/HcS6fd3CUpDQ
   XSzA0DqOPwERqc0Da5QB1N1EeQtdfD8LzVqGP5uLOlTAZ60fbA8XPZb6c
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: k0o/W4GWV460WRM5Azj6t6ibq/hfQ3CzdGWx7dnMHnQ9lwsnT1bEu4GWac5fG5nBioMjSVQkau
 bxAO83kJ0RRk5iNyK24iKI14GBQbFHvb6p1ZYNX0oU31yzXTnDflnAOT1JqSuxzKAzU5R6RnNt
 LWVrGScrZn2wBO4xRGzq1dtN0QBkY6Jf24WivDO9L9a17g1xmPM6MwShunTB6KJt9Xhsf4ttT+
 PMPZ6974VCq91rT7128q/wWHFb4ExMwEm6psEWS02nlAAdOIHrQVmTafLl/pn9GVkTvzXBZXZ/
 Odk=
X-SBRS: None
X-MesageID: 28856212
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,351,1596513600"; 
   d="scan'208";a="28856212"
Date: Thu, 8 Oct 2020 18:28:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 5/6] x86: guard against straight-line speculation past
 RET
Message-ID: <20201008162822.GM19254@Air-de-Roger>
References: <62ffb078-d763-f845-c4b9-eeacb3358d02@suse.com>
 <fd18939c-cfc7-6de8-07f2-217f810afde1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd18939c-cfc7-6de8-07f2-217f810afde1@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Mon, Sep 28, 2020 at 02:31:49PM +0200, Jan Beulich wrote:
> Under certain conditions CPUs can speculate into the instruction stream
> past a RET instruction. Guard against this just like 3b7dab93f240
> ("x86/spec-ctrl: Protect against CALL/JMP straight-line speculation")
> did - by inserting an "INT $3" insn. It's merely the mechanics of how to
> achieve this that differ: A set of macros gets introduced to post-
> process RET insns issued by the compiler (or living in assembly files).
> 
> Unfortunately for clang this requires further features their built-in
> assembler doesn't support: We need to be able to override insn mnemonics
> produced by the compiler (which may be impossible, if internally
> assembly mnemonics never get generated), and we want to use \(text)
> escaping / quoting in the auxiliary macro.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Code LGTM.

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

See below for the TBD.

> ---
> TBD: Should this depend on CONFIG_SPECULATIVE_HARDEN_BRANCH?

I don't see the additions done in 3b7dab93f240 being guarded by
CONFIG_SPECULATIVE_HARDEN_BRANCH, so in that regard I would say no.
However those are already guarded by CONFIG_INDIRECT_THUNK so it's
slightly weird that the addition of such protections cannot be turned
off in any way.

I would be fine with having the additions done in 3b7dab93f240
protected by CONFIG_SPECULATIVE_HARDEN_BRANCH, and then the additions
done here also.

Thanks, Roger.

