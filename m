Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB5B948C5C
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 11:47:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772663.1183116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbGmg-0003zO-Pw; Tue, 06 Aug 2024 09:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772663.1183116; Tue, 06 Aug 2024 09:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbGmg-0003x3-Mo; Tue, 06 Aug 2024 09:47:14 +0000
Received: by outflank-mailman (input) for mailman id 772663;
 Tue, 06 Aug 2024 09:47:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nfQe=PF=inria.fr=fonyuy-asheri.caleb@srs-se1.protection.inumbo.net>)
 id 1sbGmf-0003wx-Dw
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 09:47:13 +0000
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dab1fa26-53d8-11ef-bc04-fd08da9f4363;
 Tue, 06 Aug 2024 11:47:12 +0200 (CEST)
Received: from zcs2-store8.inria.fr ([128.93.142.6])
 by mail2-relais-roc.national.inria.fr with ESMTP; 06 Aug 2024 11:47:12 +0200
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
X-Inumbo-ID: dab1fa26-53d8-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:message-id:in-reply-to:references:
   subject:mime-version:content-transfer-encoding;
  bh=uOSTUW0wHH91foBefCbjh4fKrhLmcHTnW4FvTxJ5R4A=;
  b=ubKS+EaOQt+jkxyL8CjJ/bkczytPnddeI1wpxVBrLcrtimHZF4jWIgHs
   mw09vXiwuWXVJftOPh0rcysG4dhOQiAwmPyQTQ5KRMUiIstuYnG2keZDC
   wBzEf4HfOBMqQmnoe2vdBu3FPdYb34X+DNQMVvoqacGy2NrdDsrPaMNvv
   0=;
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
   d="scan'208";a="178242627"
X-MGA-submission: =?us-ascii?q?MDFuSmj7JEU5Woa2C/8y4gk1v8IThNGwkaSFBl?=
 =?us-ascii?q?OrcnrD1wNtKhT0DQ46mozohXnI4VLu3RCcdTRlyFPNQ1HXT9nqAjRt8g?=
 =?us-ascii?q?oEGDoGJVznurPoGF66fvsT3K99xk1TwzaMFmUD6fkAzbJQe0d6yJQF4d?=
 =?us-ascii?q?edwkGuIUP4rtf6HHjuTLsCuQ=3D=3D?=
Date: Tue, 6 Aug 2024 11:47:11 +0200 (CEST)
From: Fonyuy-Asheri Caleb <fonyuy-asheri.caleb@inria.fr>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1386943432.15998792.1722937631752.JavaMail.zimbra@inria.fr>
In-Reply-To: <01c81e66-a921-458c-bf9e-fe1bd9054936@suse.com>
References: <60751777.2038091.1720694327760.JavaMail.zimbra@inria.fr> <ece26efe-c1af-4fd2-910d-01a33beda5cc@citrix.com> <120712863.15929301.1722927890402.JavaMail.zimbra@inria.fr> <0f69e94a-5720-4f1f-b51d-b4fb2c6bbe0b@suse.com> <674914344.15937452.1722929654769.JavaMail.zimbra@inria.fr> <c4dac0ae-a8f4-4121-ad2e-f7cd61b6e3a8@suse.com> <349786242.15991470.1722936605909.JavaMail.zimbra@inria.fr> <01c81e66-a921-458c-bf9e-fe1bd9054936@suse.com>
Subject: Re: Help with Understanding vcpu xstate restore error during vm
 migration
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Originating-IP: [131.254.23.3]
X-Mailer: Zimbra 10.0.8_GA_4611 (ZimbraWebClient - GC127 (Linux)/10.0.8_GA_4611)
Thread-Topic: Help with Understanding vcpu xstate restore error during vm migration
Thread-Index: P/6vW+qQTpVqGWdsVMUUezzCcOoSng==

> 
> None of these require extra state (i.e. registers), hence ...
> 
>> Per my current understanding, I would expect more xstates on the VM than
>> supported on the target
>> server and hence a failure with xstate verification when restoring CPU state.
> 
> ... no extra "xstates" (as you name it).

I see. Makes more sense now. So if i understand correctly, not all these features
have states and hence are not all taken into account during xstate verification. 

> 
>> However migrating a guest from Source to target works.
>> 
>> Note that these extra avx512 features are all visible to the guest I migrate.
> 
> Ah yes. While that's a bug, it's a known one I think, awaiting further work
> that Andrew has been meaning to do for quite some time, yet always getting
> preempted by security stuff and other emergencies. For guests to migrate
> safely, I think right now it is required that you limit features visible to
> them on the source host.

Noted. Will take that into account when evaluating the impact of unnecessary 
features. 

> 
> Jan

Thanks again Jan

Caleb

