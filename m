Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CFB7C7860
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 23:07:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616043.957736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr2tQ-00029x-QO; Thu, 12 Oct 2023 21:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616043.957736; Thu, 12 Oct 2023 21:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr2tQ-000282-N3; Thu, 12 Oct 2023 21:06:52 +0000
Received: by outflank-mailman (input) for mailman id 616043;
 Thu, 12 Oct 2023 21:06:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WWXW=F2=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1qr2tP-0001XX-PY
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 21:06:51 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42ca38e6-6943-11ee-98d4-6d05b1d4d9a1;
 Thu, 12 Oct 2023 23:06:51 +0200 (CEST)
Received: from [IPV6:2601:646:9a00:1821:7c45:267e:5aad:82e7]
 ([IPv6:2601:646:9a00:1821:7c45:267e:5aad:82e7])
 (authenticated bits=0)
 by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 39CL5pvr1848458
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Thu, 12 Oct 2023 14:05:51 -0700
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
X-Inumbo-ID: 42ca38e6-6943-11ee-98d4-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 39CL5pvr1848458
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2023091101; t=1697144752;
	bh=ysnLFQZInQJMkyXvu4T440l0cKiHTOm5vno6/SZClRU=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=AHDJzDUSaTGeTjCUadg3ZNnOjmq8H9Y1SN0oUYx7EgqWknIFbRo7RTL8IF8AyMoBN
	 o2LqlZzHuVcFFxWmyfvMqXe8Q3oJ+Xfm1sAOUd1S498wB0fpdRb+dGGWjThtwf1aPk
	 uI6N7Jx8GDd10wtIytif9OsRMEY63Ur1nFKx5lrHLATbcdfjRccs1Kn2Z1IrjkAHOG
	 vLwRVNuubYTYXqjPSB/ppZgNEWChRLQuFKHMKLkEk/FWao8pykF5tIFcQfwBkcaYM3
	 oECpqgNucwQlQ6+agy7vQpP+M006/oI3B0Fm3c08A4wuWZi5p+LyHdln2LsXSpeG2a
	 /DrNIikWMSVkA==
Message-ID: <19a92ce0-742b-4bb4-8564-1e20a4dcf2c0@zytor.com>
Date: Thu, 12 Oct 2023 14:05:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] x86/percpu: Use explicit segment registers in
 lib/cmpxchg{8,16}b_emu.S
Content-Language: en-US
From: "H. Peter Anvin" <hpa@zytor.com>
To: Uros Bizjak <ubizjak@gmail.com>, x86@kernel.org,
        xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>
References: <20231012161237.114733-1-ubizjak@gmail.com>
 <20231012161237.114733-2-ubizjak@gmail.com>
 <E2A4E3BD-10C1-43F7-AD6D-1037C7106F8B@zytor.com>
In-Reply-To: <E2A4E3BD-10C1-43F7-AD6D-1037C7106F8B@zytor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/23 14:02, H. Peter Anvin wrote:>
> %fs??
 >

Nevermind, I forgot that we changed from %gs to %fs on i386 at some 
point in the now-distant past.

	-hpa

