Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJTUNTCej2nbRwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 22:57:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAB8139B0D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 22:57:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231916.1536841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr19Y-0006up-NK; Fri, 13 Feb 2026 21:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231916.1536841; Fri, 13 Feb 2026 21:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr19Y-0006s8-K1; Fri, 13 Feb 2026 21:56:44 +0000
Received: by outflank-mailman (input) for mailman id 1231916;
 Fri, 13 Feb 2026 21:56:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9cwp=AR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vr19X-0006s2-II
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 21:56:43 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id deb8e4f0-0926-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 22:56:38 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9D7DD6001A;
 Fri, 13 Feb 2026 21:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 783DCC116C6;
 Fri, 13 Feb 2026 21:56:35 +0000 (UTC)
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
X-Inumbo-ID: deb8e4f0-0926-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771019796;
	bh=ApnKDW/C9ceLNi28JGt4sWG/r+kvsTuZZlW0Yx461hk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LWlytEOmdCGiAAOKZLOS7ooW/EcpT7tNiEnwpxfSanQYFm50Ajz6TTEHjT4d/8azK
	 X8ffosQAycz1kdxBjgU+p4XAQWwhZYOWeqZ32rhHYH9dzUOvXOzpR3200BybyTlRre
	 afSVh50htHIk48rOxjabZPBb54lAdYduiy2g9oI8kytItAceBpksaSU2Wv+f/iQ+LE
	 cs8F2A+FFuQ/U3RLbORH181RLPL7QJZrmAZZ9R0JXaW2VKXw2Ocw6mR0dx/OhH6hG3
	 +0bjzRgx7Iva97QnvPszcX/6lwBSsBTixKYKdgwz+oJDgH1vcXRFm7xo8eZ6Y8HCWb
	 6El3aRJtONOLg==
Date: Fri, 13 Feb 2026 13:56:34 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, jbeulich@suse.com, 
    andrew.cooper3@citrix.com, jason.andryuk@amd.com, 
    alejandro.garciavallejo@amd.com
Subject: Re: [PATCH v2] x86/hvm: Add Kconfig option to disable nested
 virtualization
In-Reply-To: <aYnAGQa56yvDoN0M@Mac.lan>
Message-ID: <alpine.DEB.2.22.394.2602131350040.6031@ubuntu-linux-20-04-desktop>
References: <20260206210554.126443-1-stefano.stabellini@amd.com> <aYnAGQa56yvDoN0M@Mac.lan>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-324736620-1771019588=:6031"
Content-ID: <alpine.DEB.2.22.394.2602131353150.6031@ubuntu-linux-20-04-desktop>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:stefano.stabellini@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8DAB8139B0D
X-Rspamd-Action: no action

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-324736620-1771019588=:6031
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2602131353151.6031@ubuntu-linux-20-04-desktop>

I address all other comments


On Mon, 9 Feb 2026, Roger Pau Monné wrote:
> > +static inline int nvmx_msr_read_intercept(unsigned int msr, u64
> > *msr_content)
> > +{
> > +    ASSERT_UNREACHABLE();
> > +    return 0;
> > +}
> >
> I think this function is reachable even when nested virt is not
> enabled:
> 
> vmx_msr_read_intercept() -> case MSR_IA32_VMX_BASIC...MSR_IA32_VMX_VMFUNC -> nvmx_msr_read_intercept()
> 
> I'm also confused about why the function returns 0 instead of an error
> when !nestedhvm_enabled().  We should probably make it return -ENODEV
> when nested virt is not available or enabled.

I agree on the way of thinking but if we return zero it will goto gp_fault.
So I'll just remove ASSERT_UNREACHABLE.


> > +static inline int nvmx_handle_vmx_insn(struct cpu_user_regs *regs,
> > +                                       unsigned int exit_reason)
> > +{
> > +    ASSERT_UNREACHABLE();
> > +    return 0;
> > +}
> 
> Same here, I think this is likely reachable from vmx_vmexit_handler(),
> and shouldn't assert?
> 
> It should also do something like:
> 
>     hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
>     return X86EMUL_EXCEPTION;
> 
> So it mimics what the function itself does when !nestedhvm_enabled().

hvm_inject_hw_exception cannot be easily called here because it is not
available at this point in the header. But actually this function should
be unreachable because when !CONFIG_NESTED_VIRT, CR4.VMXE is not
a valid guest CR4 bit, so nested VMX instructions should cause #UD?

I changed it to:

ASSERT_UNREACHABLE();
return X86EMUL_EXCEPTION;
--8323329-324736620-1771019588=:6031--

