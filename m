Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2448193BEA
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 10:32:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHOq4-0008TJ-NY; Thu, 26 Mar 2020 09:30:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BM0P=5L=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jHOq3-0008TB-VP
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 09:30:11 +0000
X-Inumbo-ID: 63c0e592-6f44-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63c0e592-6f44-11ea-a6c1-bc764e2007e4;
 Thu, 26 Mar 2020 09:30:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B694EAF2C;
 Thu, 26 Mar 2020 09:30:10 +0000 (UTC)
To: Miroslav Benes <mbenes@suse.cz>, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 hpa@zytor.com, jpoimboe@redhat.com
References: <20200326092603.7230-1-mbenes@suse.cz>
 <20200326092603.7230-3-mbenes@suse.cz>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a39c8c7e-c793-7ec1-5159-102c824bdada@suse.com>
Date: Thu, 26 Mar 2020 10:30:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200326092603.7230-3-mbenes@suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH v3 2/2] x86/xen: Make the secondary CPU idle
 tasks reliable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: andrew.cooper3@citrix.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 jbeulich@suse.com, live-patching@vger.kernel.org,
 xen-devel@lists.xenproject.org, jslaby@suse.cz
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.03.20 10:26, Miroslav Benes wrote:
> The unwinder reports the secondary CPU idle tasks' stack on XEN PV as
> unreliable, which affects at least live patching.
> cpu_initialize_context() sets up the context of the CPU through
> VCPUOP_initialise hypercall. After it is woken up, the idle task starts
> in cpu_bringup_and_idle() function and its stack starts at the offset
> right below pt_regs. The unwinder correctly detects the end of stack
> there but it is confused by NULL return address in the last frame.
> 
> Introduce a wrapper in assembly, which just calls
> cpu_bringup_and_idle(). The return address is thus pushed on the stack
> and the wrapper contains the annotation hint for the unwinder regarding
> the stack state.
> 
> Signed-off-by: Miroslav Benes <mbenes@suse.cz>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

