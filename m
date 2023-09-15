Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D91E7A1270
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 02:40:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602798.939555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgws7-0001nS-4T; Fri, 15 Sep 2023 00:39:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602798.939555; Fri, 15 Sep 2023 00:39:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgws7-0001l2-1M; Fri, 15 Sep 2023 00:39:47 +0000
Received: by outflank-mailman (input) for mailman id 602798;
 Fri, 15 Sep 2023 00:39:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9T1c=E7=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1qgws5-0001ku-RE
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 00:39:46 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b1242d6-5360-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 02:39:41 +0200 (CEST)
Received: from [172.27.2.41] ([98.35.210.218]) (authenticated bits=0)
 by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 38F0cx0w3629046
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Thu, 14 Sep 2023 17:39:00 -0700
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
X-Inumbo-ID: 5b1242d6-5360-11ee-9b0d-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 38F0cx0w3629046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2023091101; t=1694738342;
	bh=Yoa4ZMiBLAyDfdX9HHdeF8UrASEf6ZDgmuoMlIr4Wlk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V/5PwyV/E8csxXz6rtYneFFVtOBWMsVzU2Mg/Wgs3Dr0XDNzkBz/ZFAw/skVnCBBu
	 pIX81Kk5tOxjoHoHEboQ2vuQ8rbszdcv2meKkW38C4Fpsv6lbqTJOWxteQVsyxuMV+
	 N0x88IFTW0/iHUVnQRWy7QnRIyb+uLWCXwjVOPJcS01dEDvnV1ysdbLMRkUl8Xs89b
	 ZcefnQDEvbvnoxJ49fMSGYwXr8lIlAANDyg1/g4z9ndf07KJSlAj5idi2GE44ZXoYe
	 z7lFKDrHOhCcUgZ3oZxgazX52p1YHjmuUZWWY3SOVdnLUpcnAF9ptss3dUaGqF5cAN
	 VOwKYyWEwLGSQ==
Message-ID: <5cf50d76-8e18-2863-4889-70e9c18298a1@zytor.com>
Date: Thu, 14 Sep 2023 17:38:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v10 03/38] x86/msr: Add the WRMSRNS instruction support
Content-Language: en-US
To: andrew.cooper3@citrix.com, Thomas Gleixner <tglx@linutronix.de>,
        Xin Li <xin3.li@intel.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
        xen-devel@lists.xenproject.org
Cc: mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        x86@kernel.org, luto@kernel.org, pbonzini@redhat.com,
        seanjc@google.com, peterz@infradead.org, jgross@suse.com,
        ravi.v.shankar@intel.com, mhiramat@kernel.org, jiangshanlai@gmail.com
References: <20230914044805.301390-1-xin3.li@intel.com>
 <20230914044805.301390-4-xin3.li@intel.com>
 <6f5678ff-f8b1-9ada-c8c7-f32cfb77263a@citrix.com> <87y1h81ht4.ffs@tglx>
 <7ba4ae3e-f75d-66a8-7669-b6eb17c1aa1c@citrix.com> <87v8cc1ehe.ffs@tglx>
 <50e96f85-66f8-2a4f-45c9-a685c757bb28@citrix.com>
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <50e96f85-66f8-2a4f-45c9-a685c757bb28@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/14/23 17:33, andrew.cooper3@citrix.com wrote:
> 
> It's an assumption about what "definitely won't" be paravirt in the future.
> 
> XenPV stack handling is almost-FRED-like and has been for the better
> part of two decades.
> 
> You frequently complain that there's too much black magic holding XenPV
> together.  A paravirt-FRED will reduce the differences vs native
> substantially.
> 

Call it "paravirtualized exception handling." In that sense, the 
refactoring of the exception handling to benefit FRED is definitely 
useful for reducing paravirtualization. The FRED-specific code is 
largely trivial, and presumably what you would do is to replace the FRED 
wrapper with a Xen wrapper and call the common handler routines.

	-hpa


