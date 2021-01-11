Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 186AF2F0F27
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 10:33:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64723.114382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kytZt-0002Lt-4s; Mon, 11 Jan 2021 09:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64723.114382; Mon, 11 Jan 2021 09:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kytZt-0002LU-1F; Mon, 11 Jan 2021 09:33:33 +0000
Received: by outflank-mailman (input) for mailman id 64723;
 Mon, 11 Jan 2021 09:33:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ekcf=GO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kytZq-0002LN-Sb
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 09:33:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cef59463-cbe4-4dae-ba2f-01b2154ee0bf;
 Mon, 11 Jan 2021 09:33:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3C4D5AE40;
 Mon, 11 Jan 2021 09:33:29 +0000 (UTC)
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
X-Inumbo-ID: cef59463-cbe4-4dae-ba2f-01b2154ee0bf
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610357609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PkvVtBbM0CZRHOZiwBqhW6FK+qkS3P/q0oJdKVbwvlY=;
	b=KUR9V/84ECyT2Hi1canAV3qbRRtu6gWL5aEXFZWgDffNInDwZRJXNOFbODdxuj13s1xFbm
	j6y/cTX+wtq7bDj9ION5dNlrcFJT6d0IhRrITFsqlacVLBIptv2qjdi64vbnVPWOiZDyoV
	BzIun/UVgz/8JZAs6ZWviL5mnYBILD4=
Subject: Re: [PATCH] x86/acpi: remove dead code
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210111092640.98423-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fe2bcd17-f51b-4b0c-ff60-4a09d3973ad0@suse.com>
Date: Mon, 11 Jan 2021 10:33:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111092640.98423-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.01.2021 10:26, Roger Pau Monne wrote:
> After the recent changes to acpi_fadt_parse_sleep_info the bad label
> can never be called with facs mapped, and hence the unmap can be
> removed.
> 
> Additionally remove the whole label, since it was used by a
> single caller. Move the relevant code from the label.
> 
> No functional change intended.
> 
> CID: 1471722
> Fixes: 16ca5b3f873 ('x86/ACPI: don't invalidate S5 data when S3 wakeup vector cannot be determined')

I kind of consider a "Fixes:" tag contrary to "No functional change
intended", but I guess Coverity considering this an issue warrants
the tag at least in a way.

> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

