Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1708930F7A
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 10:22:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758717.1168157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTGyL-0004jG-A3; Mon, 15 Jul 2024 08:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758717.1168157; Mon, 15 Jul 2024 08:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTGyL-0004gx-6g; Mon, 15 Jul 2024 08:22:13 +0000
Received: by outflank-mailman (input) for mailman id 758717;
 Mon, 15 Jul 2024 08:22:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0XWl=OP=inria.fr=fonyuy-asheri.caleb@srs-se1.protection.inumbo.net>)
 id 1sTGyK-0004gr-KE
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 08:22:12 +0000
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 546ec6bd-4283-11ef-8776-851b0ebba9a2;
 Mon, 15 Jul 2024 10:22:10 +0200 (CEST)
Received: from zcs2-store8.inria.fr ([128.93.142.6])
 by mail2-relais-roc.national.inria.fr with ESMTP; 15 Jul 2024 10:22:07 +0200
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
X-Inumbo-ID: 546ec6bd-4283-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:message-id:in-reply-to:references:
   subject:mime-version:content-transfer-encoding;
  bh=kefrEhqeUiPl9ywStuhoSjoYUB+udRQ/ReDa9TSwV8A=;
  b=ssnBt32nRmCOiTKynz/iSpSCGoj4iiZRGwraIYkch7QY8TsngY3UCMwU
   kRa/Hy8j0piQYuVWtpaZeLeAZOzVxzVpp8FL0AL8xPgVaEC5B+gaJjRQf
   QNmXKa64j3qb6/r/0p58qraK3nKjPNB4X+AsPLQroPEKtldF2zWZBvV/O
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
X-IronPort-AV: E=Sophos;i="6.09,209,1716242400"; 
   d="scan'208";a="175453498"
X-MGA-submission: =?us-ascii?q?MDEw5bRhjOiIqX2h/bOVOfxmfmAY9mdREotRsy?=
 =?us-ascii?q?Xw/K673XeMK85qjy2MBuKfhX9hdEqC4JbW9ezeIClecMylBQqUy1DrM1?=
 =?us-ascii?q?+as+OvR/Ji5QudYhdZ61prfq9N7zE69xZF08j33hnyCnrgMqIiJb2Yii?=
 =?us-ascii?q?xvdjDmkBNmztwjVx1NSuidtQ=3D=3D?=
Date: Mon, 15 Jul 2024 10:22:07 +0200 (CEST)
From: Fonyuy-Asheri Caleb <fonyuy-asheri.caleb@inria.fr>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1423184950.4133169.1721031727075.JavaMail.zimbra@inria.fr>
In-Reply-To: <77f1ff6e-a7dd-45c8-b706-429674b559f2@suse.com>
References: <60751777.2038091.1720694327760.JavaMail.zimbra@inria.fr> <94e94a94-14f2-4fa6-bc3b-6c64c1b84b59@citrix.com> <1546743760.2065506.1720696161057.JavaMail.zimbra@inria.fr> <8f8dac21-92fe-4760-8578-2fbfde2f2c14@citrix.com> <1557490999.4048664.1721029086794.JavaMail.zimbra@inria.fr> <77f1ff6e-a7dd-45c8-b706-429674b559f2@suse.com>
Subject: Re: Help with Understanding vcpu xstate restore error during vm
 migration
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Originating-IP: [131.254.23.3]
X-Mailer: Zimbra 10.0.8_GA_4611 (ZimbraWebClient - GC126 (Linux)/10.0.8_GA_4611)
Thread-Topic: Help with Understanding vcpu xstate restore error during vm migration
Thread-Index: mmofZLSCLDeYo1GQiZW01hVVn5Bulw==

----- Original Message -----
> From: "Jan Beulich" <jbeulich@suse.com>
> To: "Fonyuy-Asheri Caleb" <fonyuy-asheri.caleb@inria.fr>
> Cc: "xen-devel" <xen-devel@lists.xenproject.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>
> Sent: Monday, July 15, 2024 10:16:07 AM
> Subject: Re: Help with Understanding vcpu xstate restore error during vm migration

> On 15.07.2024 09:38, Fonyuy-Asheri Caleb wrote:
>>> Perhaps the more important question, are you booting the skylake with
>>> cpuid=no-avx on the command line by any chance?
>> 
>> No. I didn't boot any of the machines with any cpuid modification whatsoever.
> 
> Yet is there perhaps "Mitigating GDS by disabling AVX" in the boot log of
> the hypervisor (which sadly so far you didn't supply anywhere afaics)?

I didn't notice that. Unfortunately I no longer have access to the logs to check since I was 
working on resources I reserved for a limited period.

However, do you mind telling me what this would mean for my environment?

For more context, what I'm trying to investigate here is the impact of xstate 
and xsave dependencies on live migration.

> 
> Jan

Caleb

