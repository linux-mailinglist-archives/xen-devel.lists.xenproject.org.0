Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 728E66817E7
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 18:45:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487098.754570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMYCr-0002eE-Dt; Mon, 30 Jan 2023 17:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487098.754570; Mon, 30 Jan 2023 17:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMYCr-0002cI-As; Mon, 30 Jan 2023 17:44:37 +0000
Received: by outflank-mailman (input) for mailman id 487098;
 Mon, 30 Jan 2023 17:44:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5/WO=53=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1pMYCg-0002cA-2I
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 17:44:36 +0000
Received: from black.elm.relay.mailchannels.net
 (black.elm.relay.mailchannels.net [23.83.212.19])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad933b8d-a0c5-11ed-8ba2-5fe241e16ab0;
 Mon, 30 Jan 2023 18:44:02 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 8FDFC88158C
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jan 2023 17:43:58 +0000 (UTC)
Received: from pdx1-sub0-mail-a304.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id EFF7A882328
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jan 2023 17:43:53 +0000 (UTC)
Received: from pdx1-sub0-mail-a304.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.103.24.61 (trex/6.7.1); Mon, 30 Jan 2023 17:43:54 +0000
Received: from kmjvbox (c-76-102-200-71.hsd1.ca.comcast.net [76.102.200.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a304.dreamhost.com (Postfix) with ESMTPSA id 4P5Fsj1Ml6z2P
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jan 2023 09:43:53 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e0034 by kmjvbox (DragonFly Mail Agent v0.12);
 Mon, 30 Jan 2023 09:43:50 -0800
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
X-Inumbo-ID: ad933b8d-a0c5-11ed-8ba2-5fe241e16ab0
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1675100634; a=rsa-sha256;
	cv=none;
	b=A7g7aFtspdV/+GooRiJbYxTM3Vkh1VvJ/Ll9R9MdOueS2Zy2I9SFi0VM/hio+Q4+kMTLll
	L9+cmO3zFB5i+FUeMxdSvveGyKcWp2q6N2nDo3bkgHVWJtpJKd1SntTHqS+P7omfeTsbTa
	ztZJuBsjb6LkurG+Qyoe7CCdQeNSP+l8qJfJX8nwGZTFSOMRiTDSUzsvIXCm0fYmtN7djm
	93QHQesFPuvEU6P71GZHCZ83cDgdt0uTsbm8GbvrRzoIVgxfHqeFjTNaVC5/YJcSKCDsEx
	+HTHQx/mVa5JpthCwU32mB6djnG5YUWlIMpFUEAf8BY29LePjmi7xRY+7zfp2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1675100634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=I0x2MZ7pHTEySJdwNZX7i0oTJQoYVYraWHS7W6F0g8w=;
	b=Xg6hBNKIq9HRcS1bYCZHmHwnTK8+jPRJ37TbSx1A1EBmdpBR6SiWUe60bGdzjo3TcCPZq3
	IrwbIJurXPiGk4vSkwGaqaRNZ/iacJhE0QOLwpNNLOyUS2aYLDUsmQaZNHU/ju1moKsyTn
	dqFj9MleUhkmcniKwKXLL5q0NBW9YA3CBBj1jsF/SjGIzvEu+PHgiZ6gOWBlOCR8pzjKNc
	Su/8dN6KvXg5ycd32TuJPgtEgq42wbRfX3bAwjf3fZvExzfPacxxdiDBxeBQm12hAiGI1k
	d0q6dVHLoIx5LGJ5RhZOZObJLfwsYodOZEB6tsjzs3Fy9mhPj1ZKCp6Rjgernw==
ARC-Authentication-Results: i=1;
	rspamd-544f66f495-mkpz8;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Chemical-Stop: 651fe4aa059b81d3_1675100634391_747117249
X-MC-Loop-Signature: 1675100634390:1605748642
X-MC-Ingress-Time: 1675100634390
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1675100633;
	bh=I0x2MZ7pHTEySJdwNZX7i0oTJQoYVYraWHS7W6F0g8w=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=Xh28BsH9//NDU6RcT5oS22zFUueB3Pbl7FcUACWwhylISEakpnoupwmT3zngNrLME
	 rS1x5quAzH62jDpwrMLQ0ZnpRaGiqHsE0qWCK7r1WzOK2XzoKabPmrHwQvYJUEXCpH
	 yvWI+JhBMu1XSUWDJFD4saMYW8lqW8XYA9Y0osfE=
Date: Mon, 30 Jan 2023 09:43:50 -0800
From: Krister Johansen <kjlx@templeofstupid.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	David Reaver <me@davidreaver.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] xen/x86: public: add TSC defines for cpuid leaf 4
Message-ID: <20230130174350.GA2001@templeofstupid.com>
References: <0c4eb4ba-4314-02c7-62d5-b08a3573fcc2@suse.com>
 <20230127185103.GB1955@templeofstupid.com>
 <bfccbe22-e5e4-40d3-aded-639d812bfa08@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfccbe22-e5e4-40d3-aded-639d812bfa08@suse.com>

Hi Jan,

On Mon, Jan 30, 2023 at 09:22:11AM +0100, Jan Beulich wrote:
> On 27.01.2023 19:51, Krister Johansen wrote:
> > --- a/xen/include/public/arch-x86/cpuid.h
> > +++ b/xen/include/public/arch-x86/cpuid.h
> > @@ -72,6 +72,15 @@
> >   * Sub-leaf 2: EAX: host tsc frequency in kHz
> >   */
> >  
> > +#define XEN_CPUID_TSC_EMULATED               (1u << 0)
> > +#define XEN_CPUID_HOST_TSC_RELIABLE          (1u << 1)
> > +#define XEN_CPUID_RDTSCP_INSTR_AVAIL         (1u << 2)
> > +
> > +#define XEN_CPUID_TSC_MODE_DEFAULT               (0)
> > +#define XEN_CPUID_TSC_MODE_ALWAYS_EMULATE        (1u)
> > +#define XEN_CPUID_TSC_MODE_NEVER_EMULATE         (2u)
> > +#define XEN_CPUID_TSC_MODE_NEVER_EMULATE_TSC_AUX (3u)
> 
> While perhaps it doesn't matter much with the mode no longer supported,
> I'd prefer if here we used the original name (PVRDTSCP) as well.
> Preferably with that adjustment (which once again I'd be happy to do
> while committing, albeit I'd like to wait with that until osstest is in
> a better mood again)
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks for the additional feedback.  I'll send you a v4 that makes the
requested modification.

-K

