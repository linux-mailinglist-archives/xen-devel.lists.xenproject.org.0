Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9333B371558
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 14:43:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121572.229274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldXuc-0001c4-44; Mon, 03 May 2021 12:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121572.229274; Mon, 03 May 2021 12:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldXuc-0001bf-0j; Mon, 03 May 2021 12:42:58 +0000
Received: by outflank-mailman (input) for mailman id 121572;
 Mon, 03 May 2021 12:42:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TA2L=J6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ldXua-0001bZ-PW
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 12:42:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e1b63cec-e117-466a-ba60-775a669d03ef;
 Mon, 03 May 2021 12:42:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C6E9AAE4B;
 Mon,  3 May 2021 12:42:54 +0000 (UTC)
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
X-Inumbo-ID: e1b63cec-e117-466a-ba60-775a669d03ef
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620045774; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sn4JIu/EvibUbw7Ii7ZRLMZBwS1rfXhrQK6idYjDfV0=;
	b=GG0c4X0hH84sSAVhA6Lz2xfpDopCYF8LYRKIKyeu0nz0565yqPgFuw35PCZFsEtTNIx4Y8
	sw3zbQLDUBbAwUYuiul+q407tV5VzLltXIL8zKn/tbDTk8HshDqy8wxayXrMMsq0tF+v7R
	N4t5ztDjqRhHpELLhhTyw/PQHyK9Hpo=
Subject: Re: [PATCH] x86: Always have CR4.PKE set in HVM context
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210429221223.28348-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1bc9a7f7-0bf7-2894-1272-3eec6dbf5a8f@suse.com>
Date: Mon, 3 May 2021 14:42:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210429221223.28348-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 30.04.2021 00:12, Andrew Cooper wrote:
> The sole user of read_pkru() is the emulated pagewalk, and guarded behind
> guest_pku_enabled() which restricts the path to HVM (hap, even) context only.
> 
> The commentary in read_pkru() concerning _PAGE_GNTTAB overlapping with
> _PAGE_PKEY_BITS is only applicable to PV guests.
> 
> The context switch path, via write_ptbase() unconditionally writes CR4 on any
> context switch.
> 
> Therefore, we can guarantee to separate CR4.PKE between PV and HVM context at
> no extra cost.  Set PKE in mmu_cr4_features on boot, so it becomes set in HVM
> context, and clear it in pv_make_cr4().
> 
> Rename read_pkru() to rdpkru() now that it is a simple wrapper around the
> instruction.  This saves two CR4 writes on every pagewalk, which typically
> occur more than one per emulation.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> 
> It also occurs to me that for HVM/Idle => HVM/Idle context switches, we never
> need to change CR4.  I think this is substantially clearer following XSA-293 /
> c/s b2dd00574a4f ("x86/pv: Rewrite guest %cr4 handling from scratch") which
> introduced pv_make_cr4().

Never needing to change CR4 doesn't uniformly mean writes can be avoided.
Part of the purpose of the writes is to flush the TLB. Per-domain as well
as shadow mappings may be in need of such if global mappings are used
anywhere.

Jan

