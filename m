Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B51DA00AE3
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2025 15:55:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864596.1275810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTj4S-0003Dx-Ax; Fri, 03 Jan 2025 14:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864596.1275810; Fri, 03 Jan 2025 14:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTj4S-0003CU-8C; Fri, 03 Jan 2025 14:54:40 +0000
Received: by outflank-mailman (input) for mailman id 864596;
 Fri, 03 Jan 2025 14:54:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o5mg=T3=inria.fr=fonyuy-asheri.caleb@srs-se1.protection.inumbo.net>)
 id 1tTj4R-0003CO-3U
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2025 14:54:39 +0000
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a71144c2-c9e2-11ef-a0de-8be0dac302b0;
 Fri, 03 Jan 2025 15:54:37 +0100 (CET)
Received: from zcs2-store8.inria.fr ([128.93.142.6])
 by mail2-relais-roc.national.inria.fr with ESMTP; 03 Jan 2025 15:54:37 +0100
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
X-Inumbo-ID: a71144c2-c9e2-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:message-id:in-reply-to:references:
   subject:mime-version:content-transfer-encoding;
  bh=Bu869Luex93ZoeuFnvK8aXOZYRKKj35Bd+lBf6FveB8=;
  b=DiayYoe659NYrMqJCIpm8zrEC7Y4KIUr9bwodVTFn6a8tJP6I/gJT3k/
   eLDPWHt3QQaM9BBOch/CxS1tww8KlxLbanafNNa8reVdxuJJ+SQeZbZB3
   URnlgfyegy/2e8JH9mk/XlO1G5fZicTsXPfZWOcNJntUF+2PbqZH0BBg/
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
  ip4:192.134.164.0/24 ip4:128.93.162.160 ip4:128.93.162.3
  ip4:128.93.162.88 ip4:89.107.174.7 mx ~all"
Received-SPF: None (mail2-relais-roc.national.inria.fr: no sender
  authenticity information available from domain of
  postmaster@zcs2-store8.inria.fr) identity=helo;
  client-ip=128.93.142.6;
  receiver=mail2-relais-roc.national.inria.fr;
  envelope-from="fonyuy-asheri.caleb@inria.fr";
  x-sender="postmaster@zcs2-store8.inria.fr";
  x-conformance=spf_only
X-IronPort-AV: E=Sophos;i="6.12,286,1728943200"; 
   d="scan'208";a="201343816"
X-MGA-submission: =?us-ascii?q?MDElzuM4PrhzS2CJFIM9ZGhE6T6c51W+nIwVpu?=
 =?us-ascii?q?6HTW7IXVLUzcKTCnBHi/5gnp93PzBbAIx88T7DwQRr/UMb4Z5p8GAVBL?=
 =?us-ascii?q?U7uEmiOfGGR26CQaVsAoYXZLT81z/1I3bogKUXsR4NmrUxiKhcWx9Hjd?=
 =?us-ascii?q?xpanalxVWwXbe2U1F/qCe/tg=3D=3D?=
Date: Fri, 3 Jan 2025 15:54:36 +0100 (CET)
From: Fonyuy-Asheri Caleb <fonyuy-asheri.caleb@inria.fr>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>
Message-ID: <708460948.6067319.1735916076826.JavaMail.zimbra@inria.fr>
In-Reply-To: <41b0f409-6bb3-4338-86b5-0d91dc82294e@citrix.com>
References: <944938302.6053932.1735914346495.JavaMail.zimbra@inria.fr> <41b0f409-6bb3-4338-86b5-0d91dc82294e@citrix.com>
Subject: Re: Help With Identifying CPUID faulting logic in Xen code
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [176.180.88.57]
X-Mailer: Zimbra 10.1.3_GA_4699 (ZimbraWebClient - GC131 (Linux)/10.1.3_GA_4703)
Thread-Topic: Help With Identifying CPUID faulting logic in Xen code
Thread-Index: 4vCuNNMKP2rZVnEZw6zI2pCjBVj3Aw==

Thank you

Caleb

----- Original Message -----
> From: "Andrew Cooper" <andrew.cooper3@citrix.com>
> To: "Fonyuy-Asheri Caleb" <fonyuy-asheri.caleb@inria.fr>, "xen-devel" <xe=
n-devel@lists.xenproject.org>
> Cc: "Jan Beulich" <jbeulich@suse.com>
> Sent: Friday, January 3, 2025 3:35:43 PM
> Subject: Re: Help With Identifying CPUID faulting logic in Xen code

> On 03/01/2025 2:25 pm, Fonyuy-Asheri Caleb wrote:
>> Hello,
>>
>> I am interested in finding understanding how xen handles CPUID
>> faulting and
>> VM exits in general. Please can someone indicate to me the concerned
>> files?
>>
>> I want to know how xen detects the execution of the CPUID instruction an=
d
>> ensures a guest only gets the features defined in cpuid-autogen.h file
>> depending on the guest type.
>>
>> I started looking at the file xen/arch/x86/cpuid.c but don't really
>> know which other
>> files to check next.
>=20
> https://xenbits.xen.org/docs/unstable/features/feature-levelling.html
>=20
> has a reasonable introduction.=A0 Being nearly a decade old, it's slightl=
y
> stale.=A0 AMD now have CPUID Faulting capability too, new in Zen4 CPUs II=
RC.
>=20
> LCAP_faulting specifically is the constant you're looking for, in the
> Xen code.
>=20
> ~Andrew

