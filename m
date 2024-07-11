Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2187892E820
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 14:18:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757428.1166340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRskz-0006R3-3d; Thu, 11 Jul 2024 12:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757428.1166340; Thu, 11 Jul 2024 12:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRskz-0006Oo-0d; Thu, 11 Jul 2024 12:18:41 +0000
Received: by outflank-mailman (input) for mailman id 757428;
 Thu, 11 Jul 2024 12:18:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NKZT=OL=inria.fr=fonyuy-asheri.caleb@srs-se1.protection.inumbo.net>)
 id 1sRskx-0006Oi-HB
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 12:18:39 +0000
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b24cb4a2-3f7f-11ef-8776-851b0ebba9a2;
 Thu, 11 Jul 2024 14:18:35 +0200 (CEST)
Received: from zcs2-store8.inria.fr ([128.93.142.6])
 by mail2-relais-roc.national.inria.fr with ESMTP; 11 Jul 2024 14:18:35 +0200
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
X-Inumbo-ID: b24cb4a2-3f7f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:message-id:in-reply-to:references:
   subject:mime-version:content-transfer-encoding;
  bh=ZTNEMa1dVPbYt0LEWE9KhUUpLw0TQnah0qLlvb5jf7M=;
  b=m+agkjErrH4784sopdHEg18A5VNvJGuWI5osiF0FJJ2Fbfu74W7gRztZ
   G6aam6pZdKePtlDHp9dOx8CMTczjA7LExi+Nubf8MnvntzhiCMrY7aXgL
   +SJOy/cKMjGjPPr+mfXIrg2qzA2AI0v79IsLRcmD2G7eyKZhR5DbQ8YaB
   M=;
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
X-IronPort-AV: E=Sophos;i="6.09,200,1716242400"; 
   d="scan'208";a="175045716"
X-MGA-submission: =?us-ascii?q?MDHTf3oP72Xjd82dxrjNuhvUG/bUR9z90xtDmF?=
 =?us-ascii?q?Nf2nxmemfci3wNu65S75n1OXw+nkAO1mN/EWMaOtrNVdXaoNhc7rSjcq?=
 =?us-ascii?q?zr1iuFNoKzSfT/bQdTqgVWtNN72IolOwi9YV39g9zl+Tw5V3rOA562Dd?=
 =?us-ascii?q?EAZaBh6dRFyPV0yTzh+S2t8w=3D=3D?=
Date: Thu, 11 Jul 2024 14:18:35 +0200 (CEST)
From: Fonyuy-Asheri Caleb <fonyuy-asheri.caleb@inria.fr>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <71164270.2157213.1720700315521.JavaMail.zimbra@inria.fr>
In-Reply-To: <f0bdd5ca-3f85-4998-9476-18e768352bec@citrix.com>
References: <60751777.2038091.1720694327760.JavaMail.zimbra@inria.fr> <94e94a94-14f2-4fa6-bc3b-6c64c1b84b59@citrix.com> <1546743760.2065506.1720696161057.JavaMail.zimbra@inria.fr> <f0bdd5ca-3f85-4998-9476-18e768352bec@citrix.com>
Subject: Re: Help with Understanding vcpu xstate restore error during vm
 migration
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Originating-IP: [131.254.23.3]
X-Mailer: Zimbra 10.0.8_GA_4611 (ZimbraWebClient - GC126 (Linux)/10.0.8_GA_4611)
Thread-Topic: Help with Understanding vcpu xstate restore error during vm migration
Thread-Index: 5ODoRfBuRBaqAFin9adcTsWizDY8Aw==


>> Please do you mind giving me more insight on the logic currently implemented
>> and maybe what is wrong with it? It will be important for me since what I'm
>> doing is research work.
> 
> See 9e6dbbe8bf40^..267122a24c49

What reference is this please? 

> 
>> How do the values evc->size and xfeature_mask relate to the source and target
>> processor xstates (or xstate management)?
> 
> The lower bounds check is for normal reasons, while the upper bounds
> check is a sanity "does this image appear to have more states active
> than the current system".
> 
> The upper bound is bogus, because "what this VM has" has no true
> relationship to "what Xen decided to turn on by default at boot".

I see. My initial question about this was more of understanding how this information
is gathered. Is it directly related to the CPUID of the VM or does depend on the state
of the VM at the moment of migrating it? 

If it is related to the CPUID, how is it constructed? 

>>> To start with, which version (or versions?) of Xen, and what hardware?
>> Xen version 4.18.3-pre
> 
> As you're not on a specific tag, exact changeset?

I am on the stable-4.18 tag. 

> 
> Not that it likely matters - there shouldn't be anything relevant in
> staging-4.18 since RELEASE-4.18.2 as far as this goes.
> 
> There are backports of 2 of bugfixes, but in a way that should be
> practical change on 4.18.
> 
>> My CPU is : Intel(R) Xeon(R) CPU E5-2630 v3 @ 2.40GHz
> 
> Ok, so Haswell.
> 
> Let me stare at the CPUID dumps and see if anything stands out.

> 
> ~Andrew

Caleb

