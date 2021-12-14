Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFE84748F7
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 18:12:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246974.425966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxBLc-0000wI-Kz; Tue, 14 Dec 2021 17:12:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246974.425966; Tue, 14 Dec 2021 17:12:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxBLc-0000tb-I3; Tue, 14 Dec 2021 17:12:16 +0000
Received: by outflank-mailman (input) for mailman id 246974;
 Tue, 14 Dec 2021 17:12:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mxBLb-0000tT-MN
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 17:12:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxBLZ-0004ks-Mh; Tue, 14 Dec 2021 17:12:13 +0000
Received: from [54.239.6.190] (helo=[192.168.26.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxBLZ-0005Bl-GF; Tue, 14 Dec 2021 17:12:13 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=ykFKRdNjX5CVmLmfQ+KGFWC3D32lG6LQeCQYTdB8+MQ=; b=peOnIfVcE0qTWG7WnbyvtHFr4v
	jRLzIlSP2g3hFzT6FrWgUGOu0bP5mlXMN/zcLR+mAFCi2DlDZgNMPGnto/5tMUiQFVMJKbDzYIbUY
	w2HnLSjtbYTm1DVG4DPFsL59h5OpDuCyQtkM5RJ+kUUNX7npKYGv8gGaNLiy/2eYk3G0=;
Message-ID: <c18e0102-86fc-2ba5-52f4-7607c96517c1@xen.org>
Date: Tue, 14 Dec 2021 17:12:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [XEN PATCH v8 01/47] build: factorise generation of the linker
 scripts
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-2-anthony.perard@citrix.com>
 <f9a5844a-6e70-cb10-a5b8-4bdf55751f5f@xen.org> <YbjP3ZBaRVf0s4t6@perard>
From: Julien Grall <julien@xen.org>
In-Reply-To: <YbjP3ZBaRVf0s4t6@perard>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/12/2021 17:09, Anthony PERARD wrote:
> On Tue, Dec 14, 2021 at 04:54:21PM +0000, Julien Grall wrote:
>> On 25/11/2021 13:39, Anthony PERARD wrote:
>>> diff --git a/xen/Rules.mk b/xen/Rules.mk
>>> +# Linker scripts, .lds.S -> .lds
>>> +quiet_cmd_cpp_lds_S = LDS     $@
>>> +cmd_cpp_lds_S = $(CPP) -P $(call cpp_flags,$(a_flags)) -D__LINKER__ -MQ $@ -o $@ $<
>>> +
> 
>>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>>> +xen.lds: xen.lds.S FORCE
>>> +	$(call if_changed,cpp_lds_S)
>>
>> Sorry, I haven't really followed the build system rework. Could you explain
>> why it is necessary to add FORCE?
> 
> This new rules make use of a new macro "if_changed", and we need to
> execute this new macro every time, even if the source file hasn't been
> modified.
> 
> if_changed, in addition to checking if the source is newer than the
> target that make does, also compare the command line used to generate
> the target. If the command line have changed, the macro update the
> target.

Ah, that's the part I was missing. Thanks for the clarification! With that:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

