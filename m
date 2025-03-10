Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EE4A5962B
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 14:24:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906470.1313893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trd6o-0000b9-0Y; Mon, 10 Mar 2025 13:23:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906470.1313893; Mon, 10 Mar 2025 13:23:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trd6n-0000Yy-Tj; Mon, 10 Mar 2025 13:23:53 +0000
Received: by outflank-mailman (input) for mailman id 906470;
 Mon, 10 Mar 2025 13:23:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hcpv=V5=eik.bme.hu=balaton@srs-se1.protection.inumbo.net>)
 id 1trd6m-0000Ys-6W
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 13:23:52 +0000
Received: from zero.eik.bme.hu (zero.eik.bme.hu [152.66.115.2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e731152f-fdb2-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 14:23:50 +0100 (CET)
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1B5624E602E;
 Mon, 10 Mar 2025 14:23:49 +0100 (CET)
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id XvkD-BHqHTfr; Mon, 10 Mar 2025 14:23:46 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C9D5B4E6029; Mon, 10 Mar 2025 14:23:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C787874577D;
 Mon, 10 Mar 2025 14:23:46 +0100 (CET)
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
X-Inumbo-ID: e731152f-fdb2-11ef-9ab8-95dc52dad729
X-Virus-Scanned: amavisd-new at eik.bme.hu
Date: Mon, 10 Mar 2025 14:23:46 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org, 
    Palmer Dabbelt <palmer@dabbelt.com>, 
    Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org, 
    Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, 
    Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
    David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>, 
    Paul Durrant <paul@xen.org>, 
    "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
    =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
    Anthony PERARD <anthony@xenproject.org>, 
    Yoshinori Sato <ysato@users.sourceforge.jp>, 
    manos.pitsidianakis@linaro.org, qemu-riscv@nongnu.org, 
    Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 00/16] make system memory API available for common code
In-Reply-To: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
Message-ID: <f231b3be-b308-56cf-53ff-1a6a7fb4da5c@eik.bme.hu>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

On Sun, 9 Mar 2025, Pierrick Bouvier wrote:
> The main goal of this series is to be able to call any memory ld/st function
> from code that is *not* target dependent.

Why is that needed?

> As a positive side effect, we can
> turn related system compilation units into common code.

Are there any negative side effects? In particular have you done any 
performance benchmarking to see if this causes a measurable slow down? 
Such as with the STREAM benchmark:
https://stackoverflow.com/questions/56086993/what-does-stream-memory-bandwidth-benchmark-really-measure

Maybe it would be good to have some performance tests similiar to 
functional tests that could be run like the CI tests to detect such 
performance changes. People report that QEMU is getting slower and slower 
with each release. Maybe it could be a GSoC project to make such tests but 
maybe we're too late for that.

Regards,
BALATON Zoltan

