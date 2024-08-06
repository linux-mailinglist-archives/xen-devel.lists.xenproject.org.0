Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDF2948C2C
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 11:30:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772632.1183087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbGWA-0008Lu-Ur; Tue, 06 Aug 2024 09:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772632.1183087; Tue, 06 Aug 2024 09:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbGWA-0008Iv-Qu; Tue, 06 Aug 2024 09:30:10 +0000
Received: by outflank-mailman (input) for mailman id 772632;
 Tue, 06 Aug 2024 09:30:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nfQe=PF=inria.fr=fonyuy-asheri.caleb@srs-se1.protection.inumbo.net>)
 id 1sbGW9-0008Ip-1m
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 09:30:09 +0000
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 773fc3ee-53d6-11ef-8776-851b0ebba9a2;
 Tue, 06 Aug 2024 11:30:06 +0200 (CEST)
Received: from zcs2-store8.inria.fr ([128.93.142.6])
 by mail2-relais-roc.national.inria.fr with ESMTP; 06 Aug 2024 11:30:06 +0200
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
X-Inumbo-ID: 773fc3ee-53d6-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:message-id:in-reply-to:references:
   subject:mime-version:content-transfer-encoding;
  bh=rLZbUJ6tcbgYc+05/z/Y9OMSrr8l7UrrM/xvDeuwQnA=;
  b=Qm1hG+q/yFN7x4NqPU+r7dxLXMGtfzdND8blFNojHa0bDFM7nN3Bbd9o
   3BPwAzdI3+DDdmbGBYMtrEB9sTaW3wcDWb4Ga2mliL8fPbfXnAwl+MhCR
   IwtcQBLZ9EvQxckmjI9NNM6fAQ2BCaOp3byZotvDTaUALCPoEzj+Q4pI/
   c=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=fonyuy-asheri.caleb@inria.fr; spf=None smtp.helo=postmaster@zcs2-store8.inria.fr
Received-SPF: Pass (mail2-relais-roc.national.inria.fr: domain of
  fonyuy-asheri.caleb@inria.fr designates 128.93.142.6 as
  permitted sender) identity=mailfrom; client-ip=128.93.142.6;
  receiver=mail2-relais-roc.national.inria.fr;
  envelope-from="fonyuy-asheri.caleb@inria.fr";
  x-sender="fonyuy-asheri.caleb@inria.fr";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 include:mailout.safebrands.com
  a:basic-mail.safebrands.com a:basic-mail01.safebrands.com
  a:basic-mail02.safebrands.com ip4:128.93.142.0/24
  ip4:192.134.164.0/24 ip4:128.93.162.160 ip4:89.107.174.7 mx
  ~all"
Received-SPF: None (mail2-relais-roc.national.inria.fr: no sender
  authenticity information available from domain of
  postmaster@zcs2-store8.inria.fr) identity=helo;
  client-ip=128.93.142.6;
  receiver=mail2-relais-roc.national.inria.fr;
  envelope-from="fonyuy-asheri.caleb@inria.fr";
  x-sender="postmaster@zcs2-store8.inria.fr";
  x-conformance=spf_only
X-IronPort-AV: E=Sophos;i="6.09,267,1716242400"; 
   d="scan'208";a="178240269"
X-MGA-submission: =?us-ascii?q?MDGCX/YwVCsCaCjliXTFRyqUkKj5kqX9zv8Bpc?=
 =?us-ascii?q?ZbXXYaVPchyStRePOALyqhuOn2GjtnhDKqOe7ei7NOEDaim81aMojCAV?=
 =?us-ascii?q?iA8c6NAwZ5PdG/kJANT7u0gFCpFQyr3hzMi2sPrDARN+N09pjMEaUAdH?=
 =?us-ascii?q?SgaoPngNf+3hhfEsmrGfhHHg=3D=3D?=
Date: Tue, 6 Aug 2024 11:30:05 +0200 (CEST)
From: Fonyuy-Asheri Caleb <fonyuy-asheri.caleb@inria.fr>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <349786242.15991470.1722936605909.JavaMail.zimbra@inria.fr>
In-Reply-To: <c4dac0ae-a8f4-4121-ad2e-f7cd61b6e3a8@suse.com>
References: <60751777.2038091.1720694327760.JavaMail.zimbra@inria.fr> <1557490999.4048664.1721029086794.JavaMail.zimbra@inria.fr> <77f1ff6e-a7dd-45c8-b706-429674b559f2@suse.com> <ece26efe-c1af-4fd2-910d-01a33beda5cc@citrix.com> <120712863.15929301.1722927890402.JavaMail.zimbra@inria.fr> <0f69e94a-5720-4f1f-b51d-b4fb2c6bbe0b@suse.com> <674914344.15937452.1722929654769.JavaMail.zimbra@inria.fr> <c4dac0ae-a8f4-4121-ad2e-f7cd61b6e3a8@suse.com>
Subject: Re: Help with Understanding vcpu xstate restore error during vm
 migration
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Originating-IP: [131.254.23.3]
X-Mailer: Zimbra 10.0.8_GA_4611 (ZimbraWebClient - GC127 (Linux)/10.0.8_GA_4611)
Thread-Topic: Help with Understanding vcpu xstate restore error during vm migration
Thread-Index: t3nof4WF/XMpfunOjNBJQ79sKvEaFw==



> On 06.08.2024 09:34, Fonyuy-Asheri Caleb wrote:
>>> If what you say in the earlier paragraph was the case with upstream Xen and
>>> without you restricting what the guest being migrated was able to see on the
>>> source host, then I think that would indicate a bug somewhere. Yet you don't
>>> provide enough details to be certain.
>> 
>> Sorry for not specifying. I am still in the same context as stated previously.
>> I haven't made any modifications to xen and no restrictions on what the guest
>> can see.
> 
> Wasn't it the case that previously you observed AVX disabled, because of
> GDS? With AVX disabled, AVX512 would be implicitly disabled, too. Then

In my previous setup I wasn't able to confirm the GDS status because at the time
we mentioned it in discussions I no longer had access to the experiment environment. 

> migrating from an AVX512-capable host to an AVX512-incapable one would
> of course work. Yet of course this is only an example, because I don't
> know whether AVX512 is what your new inquiry would have been about. As
> indicated - please provide sufficient detail so we actually know what
> you're doing and what you observe.
> 
> Jan

Seems there's more to this than I think. Here's the entire information about my setup. 

Source Server: 
   Processor: Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz
   Xsave dependences(based on xen gen-cpuid.py): 
                     'fma', 'avx', 'f16c', 'avx2', 'avx512f', 'avx512dq', 'avx512cd', 
                      'avx512bw', 'avx512vl', 'xsaveopt', 'xsavec', 'xgetbv1', 'xsaves', 
                      'pku', 'avx512_vbmi2', 'vaes', 'vpclmulqdq', 'avx512_vnni', 'avx512_bitalg', 
                      'avx512_vpopcntdq'


Target Server:
   Processor: Intel(R) Xeon(R) Gold 6130 CPU @ 2.10GHz
   Xsave dependencies: 
             'fma', 'avx', 'f16c', 'avx2', 'mpx', 'avx512f', 'avx512dq', 
             'avx512cd', 'avx512bw', 'avx512vl', 'xsaveopt', 'xsavec', 'xgetbv1', 'xsaves', 'pku'

Operating System: Debian12 (on both source and target servers)
Guest OS: Ubuntu 18.04 (PV)

Xen version: 4.18.3-pre (commit 01f7a3c792241d348a4e454a30afdf6c0d6cd71c)


So I have the following which are available on my source server but not on the target server: 
'avx512_vbmi2', 'vaes', 'vpclmulqdq', 'avx512_vnni', 'avx512_bitalg', 'avx512_vpopcntdq'

Per my current understanding, I would expect more xstates on the VM than supported on the target
server and hence a failure with xstate verification when restoring CPU state. 

However migrating a guest from Source to target works. 

Note that these extra avx512 features are all visible to the guest I migrate.

Caleb






