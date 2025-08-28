Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A052AB398BF
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 11:50:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098089.1452215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZH6-000126-Ky; Thu, 28 Aug 2025 09:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098089.1452215; Thu, 28 Aug 2025 09:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZH6-0000z9-HG; Thu, 28 Aug 2025 09:50:32 +0000
Received: by outflank-mailman (input) for mailman id 1098089;
 Thu, 28 Aug 2025 09:50:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tukF=3I=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1urZH4-0000z3-Qz
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 09:50:30 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e8a72ee-83f4-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 11:50:30 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3c79f0a5fe0so400137f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 02:50:29 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b6f0e048asm66453795e9.11.2025.08.28.02.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 02:50:28 -0700 (PDT)
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
X-Inumbo-ID: 6e8a72ee-83f4-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756374629; x=1756979429; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AowjuzowhAVvFqRe//4JCE/JkahUZ56c3z60l+dexI8=;
        b=tvrfgTcEjfHi8VLFh4wWAUOyRDejwvPTsPx8HMzKPdjkmMSUTj9QS/v7//zMUwJy0i
         flPFQUdl4Hd2AlysrNCh6rhj/Yq/geFakb9rg/OwipGrXt9JFS+cnmlNzv1ccxclSw4X
         AFdw3XHKPXO1B785dJioYqhAaxVTge8opNnD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756374629; x=1756979429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AowjuzowhAVvFqRe//4JCE/JkahUZ56c3z60l+dexI8=;
        b=u4XJvnNuhxvTBXdzyERuT6D+V4MZtURC/r1n/+qVbXCt7WOCMawpkD8S6vSgoyUmol
         iVSMNfNx49Y34YTc2B3O0DsEfxenP5Z9zwdPDGoDkm5rCz4DFa8uWkU8MTUZhQUygdnm
         rhUN74l6mVSCCbiU0QR/3jhWAOgEKNb4FdgP6nazJIj3t6UY2QC5XpomtuGl8mCaMGii
         Llz/OiYtlYJPOqXH0/cwK2rLJdEQv8xdxBI8bujAyjXUXyu+drwIyEj6WahSs3koCSgX
         iBE85+VXN0pWrhcuKxN3rCpmncmYgL73rs3NA7JP0ZPdjpoj8nE/sa4V1Chl9GJoANWw
         Q1mA==
X-Gm-Message-State: AOJu0Yw8AyWQDBpbt/E9tPQa+AB6qDTwEby7490UXLqmedb+oVLsNgZ+
	ubkMQGGZxaqEOudJyvmr7w/EojS+BRTCNXwa4yRRD8ZslKtATqbreOnfoZnHdquaAF4=
X-Gm-Gg: ASbGncswtRbslsT+eJtYIeIBWAms+j7xE9jjw2m1ACz8AAccY7fzYjN4kvPdgNU6+8w
	6XJv4FZ3BTvzKdYF65K7/E1kctT3OHDPvDHm3t0FQ3mmrsG3ws3OskfAg2ytXG73n89ageG4A3R
	0OUGxmSj3HgY8CuqVCr69V2UDXuOCottpAtiSdxeARfA5W+HUJC6GL/jj88AHkLfIfUPpmBjpN/
	BQf22PYTYxo2hd39v/hrY/ZuAVDf/rQ8oUiN90aHQ2UksQUeKehQtKeH612VdYdTeCoyewMNXz1
	kZhk9yKYxa6+8ZZUnpCXwJaMKh7lhadSCkZWbDhDIRRDPfRtEctnBuNYRyvJ80FryuGeENdFRvI
	8JyovPeSNV8UNHJFRrY7ebVyghDcUpHTYA08EnoKn1GPRxN4PUSl4+i6KpxuIyYrLxo2zS8mKNZ
	4a
X-Google-Smtp-Source: AGHT+IFx6+x07A1dt1I/iL7cZYWcqUFQHEzA+dKpdJWwLb6V3G0UHxhAO9Xbz8Dr82ejZiw7uz5JKQ==
X-Received: by 2002:a05:6000:1788:b0:3cc:8a73:315c with SMTP id ffacd0b85a97d-3cc8a827ae2mr4623333f8f.31.1756374629282;
        Thu, 28 Aug 2025 02:50:29 -0700 (PDT)
Date: Thu, 28 Aug 2025 11:50:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: MCA hypercall with PVH
Message-ID: <aLAmZGDn9QsBZWrb@Mac.lan>
References: <318f8ef3-aa52-421b-b9cb-6cd6139e1dd1@amd.com>
 <c011bc78-4ce0-4c43-9638-f03aee41816e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c011bc78-4ce0-4c43-9638-f03aee41816e@suse.com>

On Thu, Aug 28, 2025 at 10:48:49AM +0200, Jan Beulich wrote:
> On 28.08.2025 03:22, Jason Andryuk wrote:
> > The MCA hypercall, do_mca(), is only available for PV.  That is, it's 
> > only added to the hypercall table for PV.  Is there a particular reason 
> > it was omitted from PVH, or did PVH dom0 just not exist?
> 
> PVH Dom0 didn't exist back at the time, yes, but it's more than this. The
> hypercall, in some places, deals with MFNs, which aren't "visible" to PVH
> Dom0. IOW enabling it (perhaps just partly) would need to be done with
> extra care.

I think there's also a question of whether we want to use a PV
interface here, or try for Xen to mediate between the hardware domain
and the native interface, possibly exposing some kind of partially
emulated view that matches the native interface, and thus avoids
having to use a PV driver in the hardware domain.

I've opened a GitLab ticket long ago about MCE:

https://gitlab.com/xen-project/xen/-/issues/101

But didn't look into it.  I think we need some prior investigation to
figure out whether it would be feasible to expose a native MCA
interface to the hardware domain, as that would be the preference for
PVH (rather than re-using the classic PV interfaces).

The main barrier here is the disassociation between the hardware
domain physical memory map versus the host one, as the MCE/MCA
drivers will need to operate based on the host memory map, not the
one used by the hardware domain.

I think (some?) of the MSRs also contain CPU specific status/errors,
and hence using a native interface would require the hardware domain
vCPU count to be equal to the host pCPU count.

Nit: I've just taken a quick look at do_mca() but it looked like the
sharing of the data would be better done using acquire_resource if
possible, as to avoid repeated hypercalls.

Thanks, Roger.

