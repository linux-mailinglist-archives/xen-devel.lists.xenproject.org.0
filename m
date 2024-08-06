Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1485948A2C
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 09:34:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772537.1182984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbEi3-0001Go-Ir; Tue, 06 Aug 2024 07:34:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772537.1182984; Tue, 06 Aug 2024 07:34:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbEi3-0001F7-Fz; Tue, 06 Aug 2024 07:34:19 +0000
Received: by outflank-mailman (input) for mailman id 772537;
 Tue, 06 Aug 2024 07:34:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nfQe=PF=inria.fr=fonyuy-asheri.caleb@srs-se1.protection.inumbo.net>)
 id 1sbEi1-0001F1-Nh
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 07:34:17 +0000
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 480b0395-53c6-11ef-8776-851b0ebba9a2;
 Tue, 06 Aug 2024 09:34:15 +0200 (CEST)
Received: from zcs2-store8.inria.fr ([128.93.142.6])
 by mail2-relais-roc.national.inria.fr with ESMTP; 06 Aug 2024 09:34:15 +0200
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
X-Inumbo-ID: 480b0395-53c6-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:message-id:in-reply-to:references:
   subject:mime-version:content-transfer-encoding;
  bh=Z98VQ38ku/mETtiGB8IuvHlvVOg98ozTyb7LHbx4RxU=;
  b=aCG2bqa5jGiTodO2MOkV7DJjY5PD7AXOxUIcYkN2szTq1Gi1D4ZtVHMT
   eEnBDYqdUktZgaMSI+G0oFsaNYkxaJhAiaNRUfmTbTuwWI+nFXa7QzzvY
   uRnPjo7bX9tZZIpSVG6P+yUr9tK+rZgxEdfyV8qLRbH4ktXsKUyo7AKx+
   w=;
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
   d="scan'208";a="178222819"
X-MGA-submission: =?us-ascii?q?MDHR/ed5Kbr4qX5PXdcufXevXQAZicie2cFOtX?=
 =?us-ascii?q?YzaKMgm9OfddYtK/og1zuPF+12RJotuigNXDjH3T5JlP6ZALRY/42Xb2?=
 =?us-ascii?q?aAdQ12zPKUgco0dD4zlzyv+3F5bXviErKAv33BlKYFPkmoQnh6JczY3q?=
 =?us-ascii?q?Qh1jpP8LWLongX5yxh7hLHuA=3D=3D?=
Date: Tue, 6 Aug 2024 09:34:14 +0200 (CEST)
From: Fonyuy-Asheri Caleb <fonyuy-asheri.caleb@inria.fr>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <674914344.15937452.1722929654769.JavaMail.zimbra@inria.fr>
In-Reply-To: <0f69e94a-5720-4f1f-b51d-b4fb2c6bbe0b@suse.com>
References: <60751777.2038091.1720694327760.JavaMail.zimbra@inria.fr> <1546743760.2065506.1720696161057.JavaMail.zimbra@inria.fr> <8f8dac21-92fe-4760-8578-2fbfde2f2c14@citrix.com> <1557490999.4048664.1721029086794.JavaMail.zimbra@inria.fr> <77f1ff6e-a7dd-45c8-b706-429674b559f2@suse.com> <ece26efe-c1af-4fd2-910d-01a33beda5cc@citrix.com> <120712863.15929301.1722927890402.JavaMail.zimbra@inria.fr> <0f69e94a-5720-4f1f-b51d-b4fb2c6bbe0b@suse.com>
Subject: Re: Help with Understanding vcpu xstate restore error during vm
 migration
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Originating-IP: [131.254.23.3]
X-Mailer: Zimbra 10.0.8_GA_4611 (ZimbraWebClient - GC127 (Linux)/10.0.8_GA_4611)
Thread-Topic: Help with Understanding vcpu xstate restore error during vm migration
Thread-Index: /VtbDF+0QHvdhs3zRGnfQg/mywn+Ww==

> If what you say in the earlier paragraph was the case with upstream Xen and
> without you restricting what the guest being migrated was able to see on the
> source host, then I think that would indicate a bug somewhere. Yet you don't
> provide enough details to be certain.
> 
> Jan

Sorry for not specifying. I am still in the same context as stated previously. 
I haven't made any modifications to xen and no restrictions on what the guest can see. 

Caleb

