Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DD22D0E91
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 12:00:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46239.82048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEFw-0003Hu-PJ; Mon, 07 Dec 2020 11:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46239.82048; Mon, 07 Dec 2020 11:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEFw-0003HV-Lw; Mon, 07 Dec 2020 11:00:36 +0000
Received: by outflank-mailman (input) for mailman id 46239;
 Mon, 07 Dec 2020 11:00:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0970=FL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kmEFu-0003HQ-KQ
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 11:00:34 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb5a5591-d6fe-459e-8111-bd9ddd651234;
 Mon, 07 Dec 2020 11:00:33 +0000 (UTC)
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
X-Inumbo-ID: eb5a5591-d6fe-459e-8111-bd9ddd651234
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607338833;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=isKOUVHnsa5KV7Tz44a53pthMVBId3gu8Mv+BK1A/ZU=;
  b=ETdabGdYSPlrUCS7bFt6mQVp+9XupNy1Pfw2Z1TdtCyTx7wvWSbJb0ge
   KepuDs/KjJvEIU5GPeEPNP7FnqdroQOlhxq+iAkXEjId+/eJHseJeLO3B
   /WzUUkrVd7Ddlve0RnjOFYmakaJoYwFaAMX0m8zRBZvCPJoUPM98uChvA
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: UWgHT1byJ2MCL2PvYkIGiQeqvCqk+S4SenuGvUJ6xfT8EEcOYh2TVlGZU8evLXXKL1/3fWc8XN
 MMCSpIA8babvd4kOCDDdb4WW8rlNCJ/q8lq5ij/Sn8qh2JWFbl+8exaXaxRnFo0RAIWKUQ4rYn
 vGVnCUQu7LQVQmLT2Bn82E1vq/5uzhynNWQm/I0M68HgmGLLG8SYdyDuGesd8Sn5H8Z3PWHATD
 MnIKYiYrKf5+UbsgNtHi6HzKuGzCjr47lmvoQfxDRzcHQORQ5SALaQVwB3fJvEvNeyh22i8AOG
 qGs=
X-SBRS: 5.1
X-MesageID: 32632340
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,399,1599537600"; 
   d="scan'208";a="32632340"
Subject: Re: [PATCH] x86/vPMU: make use of xmalloc_flex_struct()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <89357ce5-6a2b-9abf-0655-6bebced091bd@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d62d0948-61a1-aa10-91a9-6f8d5033fc77@citrix.com>
Date: Mon, 7 Dec 2020 11:00:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <89357ce5-6a2b-9abf-0655-6bebced091bd@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 07/12/2020 10:50, Jan Beulich wrote:
> ... instead of effectively open-coding it in a type-unsafe way. Drop the
> regs_sz variable altogether, replacing other uses suitably.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

