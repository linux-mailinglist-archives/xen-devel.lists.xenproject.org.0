Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 674962FB7A3
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 15:27:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70405.126342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1rxk-0006XY-55; Tue, 19 Jan 2021 14:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70405.126342; Tue, 19 Jan 2021 14:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1rxk-0006XD-1p; Tue, 19 Jan 2021 14:26:28 +0000
Received: by outflank-mailman (input) for mailman id 70405;
 Tue, 19 Jan 2021 14:26:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U8Ox=GW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1rxj-0006X8-9v
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 14:26:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f59fb818-6a32-4092-8696-5ef8bf3a33ac;
 Tue, 19 Jan 2021 14:26:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 20000AB7F;
 Tue, 19 Jan 2021 14:26:23 +0000 (UTC)
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
X-Inumbo-ID: f59fb818-6a32-4092-8696-5ef8bf3a33ac
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611066383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JZWoTzRfLq/a8dPVa0/OPYmNqREJZs51ZkmuyGygh7A=;
	b=HC7yEoT7zJCq0uRtWf5jUn9Jpkjt0cO0RUHNG8S0HCszRDddwbzdIDHAM26A8u7fdRTeCH
	MgYIPAS64mUiPPyU8YUhUYLwTioHNXdRRJNwJPgK84KIB9+vBCrJOFvgFRMMv6X4M5MvGQ
	V6njywO31DELHTqzr5R8HJx8AeFxbus=
Subject: Re: [PATCH v2] x86/CPUID: unconditionally set
 XEN_HVM_CPUID_IOMMU_MAPPINGS
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210119130759.98296-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <064729d2-1fe2-3169-4f4f-7c04a73e3984@suse.com>
Date: Tue, 19 Jan 2021 15:26:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210119130759.98296-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 19.01.2021 14:07, Roger Pau Monne wrote:
> This is a revert of f5cfa0985673 plus a rework of the comment that
> accompanies the setting of the flag so we don't forget why it needs to
> be unconditionally set: it's indicating whether the version of Xen has
> the original issue fixed and IOMMU entries are created for
> grant/foreign maps.
> 
> If the flag is only exposed when the IOMMU is enabled the guest could
> resort to use bounce buffers when running backends as it would assume
> the underlying Xen version still has the bug present and thus
> grant/foreign maps cannot be used with devices.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

This time for real, I suppose.

Jan

