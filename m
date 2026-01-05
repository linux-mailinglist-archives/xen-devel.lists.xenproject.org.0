Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EBDCF49B6
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 17:14:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195588.1513520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcnDs-0006P5-3K; Mon, 05 Jan 2026 16:14:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195588.1513520; Mon, 05 Jan 2026 16:14:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcnDs-0006Me-08; Mon, 05 Jan 2026 16:14:24 +0000
Received: by outflank-mailman (input) for mailman id 1195588;
 Mon, 05 Jan 2026 16:14:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lzVw=7K=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vcnDr-00067T-9I
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 16:14:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98af01af-ea51-11f0-b15e-2bf370ae4941;
 Mon, 05 Jan 2026 17:14:22 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 23D2D4EE0742;
 Mon,  5 Jan 2026 17:14:22 +0100 (CET)
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
X-Inumbo-ID: 98af01af-ea51-11f0-b15e-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1767629662;
	b=QXW0oDlusUnRnrE2n1yHvyxNBi3PklygDKM2BFWyX+wg8cRZH1SioBd0O2gCoGUSboNs
	 HeDrDDO7lrkbfTZyQiXQ53i66tuNpM8XhRJ7OMqzr4b9Nt3BmLBVfXt3ZXTbnha+m50j9
	 bfyOOl0exnX5i6PV9xKGr3LgeELYrE5x/XEYQVfP3caqXcBt8+lVfRQnWWdJa8DQnz+xx
	 S9G4J5MoD3m8zifTWCX42wF9/Uqv+7Vrs8T6AuG3YnklDNeW6AVBIudvGh6VdcmZ6bD2L
	 +t2E9Pf87EQTY2uM+hmI0iJfBJ7NCmQ6NtkgueJ+w8FIWlNFna9oQRMmJNMz0nZ3zSj7W
	 zHripiVfTjcoOFBLfbTUWbJS4xLfXZwOSkbh4Qee75h7UllFHbpMNd/ev1geRVEqvV67p
	 jhom1tJneit5Jn0w7fxBE3w06ELFgLIfM418Vm/u22UdcG50HNUgdmUAgioo1LFbkIsdb
	 sHlvAvyfRjhpMkgR9jLl4NvTZH9AvBh1RK2Q17LL6xnwaJ/pWpPvpGEkcVOZed5DEMHMD
	 ynHitU7nePbBE/77VrZd1RsIf2BBsy2H99mKdG/rrkAV+f/nQfZ/CSUjgNM8yCLDBQOmk
	 IPxWAKdYBT6TTKB4xRaxmJzpQaulhHxyiazVMFXLUohGuOExNCqHY56tn62WU74=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1767629662;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=IRShN447taDVIf8Z0vC2iX4D5SbpGvJAylpvDAXXMaU=;
	b=L1qPjv9dS+7SBCt7pcv7Ok7uOqznSkYuy57XUvyInoUZr2z6g1AbwS78kYNEMuI2fdd0
	 6a3MNHjTt2/HugJOBoXz/ky1DvRjTTVm7V04+yczmct22J3rrKfGXotvJTQq1K9A4UHEX
	 5TWMbuafVhwfy1WQE9qxNPodO2aZEaq+cyKcndFl/2URlAFTsqG41X99bA2/pbmsoIz/d
	 k4YfasMQwafJh9NfYVZPiohBy5T/YrubKi254+LaLuXE3+U3OEKQZIdHqrQnnax/VBYRG
	 dnGZ35E4hLO5sfqDgi+SskRCfcvFt8uqO4FqX5jSz1tkF9sr/zh6CdspuXtmJ2X28/7/g
	 PZo4k0P5Z2JbRjDAC7wxPWCXbZr35179qPVPw6VtrExAdeMd9GwkKTw0FpKgxSb5bAYaE
	 yFw5z4wNg1UvsipSAXin0kslBZsN3dynG47Df7r5vTkBB8G7zAPC7vN/+Zyjw7snuX3KO
	 RCQtFiB8nbIydXTo8TwX53V3qAIPtcDXvs2raTEpym1zMo7U+EqvmqZbswMvH5u19K24U
	 ElJj+QQkwR39/g38RsKrHPD0Afp9ZfF+pArqNNaTvsXztpcdSZkDDa39zJ+RkFlhHAj2/
	 QN5SnF2jcyJWIA+D3J3XBQh2tWZ/UnyjCg3dQ+gylzk3994lvf9rxTZkBxieB64=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Mon, 05 Jan 2026 17:14:22 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, sstabellini@kernel.org,
 consulting@bugseng.com, Doug Goldstein <cardoe@cardoe.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] xen: rework deviation to address varargs MISRA
 violations
In-Reply-To: <cfaadea1-62a4-42b2-89ce-8b016ec030fe@citrix.com>
References: <d2ba22d6a36a4f2b952a80712aac2cfe632e8609.1767174251.git.nicola.vetrini@bugseng.com>
 <b05b3746-6611-4aaa-820c-b45e9c6a8ed6@suse.com>
 <cfaadea1-62a4-42b2-89ce-8b016ec030fe@citrix.com>
Message-ID: <33ee7e20703de4f6b7a4c2d49dabece2@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2026-01-05 15:58, Andrew Cooper wrote:
> On 05/01/2026 2:55 pm, Jan Beulich wrote:
>> On 31.12.2025 12:22, Nicola Vetrini wrote:
>>> --- a/xen/common/libelf/libelf-private.h
>>> +++ b/xen/common/libelf/libelf-private.h
>>> @@ -84,7 +84,9 @@
>>>  #define elf_err(elf, fmt, args ... )                    \
>>>      elf_call_log_callback(elf, 1, fmt , ## args );
>>> 
>>> -void elf_call_log_callback(struct elf_binary*, bool iserr, const 
>>> char *fmt,...);
>>> +void
>>> +__attribute__ ((format (printf, 3, 4)))
>>> +elf_call_log_callback(struct elf_binary*, bool iserr, const char 
>>> *fmt, ...);
>> Just one tiny, nit-like request here: If already you touch this, can 
>> the
>> missing blank ahead of the first * please also be added at this 
>> occasion?
> 
> The parameter also needs a name.  I have both fixed up locally.
> 
> ~Andrew

Thanks

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

