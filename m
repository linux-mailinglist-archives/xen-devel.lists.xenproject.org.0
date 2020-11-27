Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E31FC2C6726
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 14:47:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39377.72260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kie5X-0002FV-14; Fri, 27 Nov 2020 13:47:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39377.72260; Fri, 27 Nov 2020 13:47:03 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kie5W-0002F6-UP; Fri, 27 Nov 2020 13:47:02 +0000
Received: by outflank-mailman (input) for mailman id 39377;
 Fri, 27 Nov 2020 13:47:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kie5W-0002F1-3q
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 13:47:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37eb4911-a61d-4333-97d0-805bc0880c2d;
 Fri, 27 Nov 2020 13:47:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 965C0ABD7;
 Fri, 27 Nov 2020 13:47:00 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kie5W-0002F1-3q
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 13:47:02 +0000
X-Inumbo-ID: 37eb4911-a61d-4333-97d0-805bc0880c2d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 37eb4911-a61d-4333-97d0-805bc0880c2d;
	Fri, 27 Nov 2020 13:47:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606484820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AH8MLbQO+xGAs2wywTgpXKp3VgDz6169LTuoob1JGIc=;
	b=Dv1Zs2bVsDa3vvJuHpPqTcJRLGCzPYwSI9W3Yv+T8NuKXjSBR0gnYcCuOyQ/I+4Pp7MhnR
	nSrlgnOY3IBHPpa+PXz8jHCwWyLmWI9TDXGhP6yrbwjeiYTNoKXBL26ba5+pgvb4XIHHS5
	YZRMmLOp0ZCRFcIstuhcFCqShOX+ub8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 965C0ABD7;
	Fri, 27 Nov 2020 13:47:00 +0000 (UTC)
Subject: Re: [PATCH v4 2/3] xen/pci: solve compilation error on ARM with
 HAS_PCI enabled.
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>
References: <cover.1606326929.git.rahul.singh@arm.com>
 <2ce402cfae6d90433626bcdc6314e5ee5dda103f.1606326929.git.rahul.singh@arm.com>
 <AF56CBF8-CAE2-4296-BEE9-0DED2CD6A648@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <24926459-3f9f-0481-c5a3-9d6f36401346@suse.com>
Date: Fri, 27 Nov 2020 14:47:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <AF56CBF8-CAE2-4296-BEE9-0DED2CD6A648@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.11.2020 10:05, Bertrand Marquis wrote:
> 
> 
>> On 25 Nov 2020, at 18:16, Rahul Singh <Rahul.Singh@arm.com> wrote:
>>
>> If mem-sharing, mem-paging, or log-dirty functionality is not enabled
>> for architecture when HAS_PCI is enabled, the compiler will throw an
>> error.
>>
>> Move code to x86 specific file to fix compilation error.
>>
>> Also, modify the code to use likely() in place of unlikley() for each
>> condition to make code more optimized.
>>
>> No functional change intended.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> I guess the small typo fix could be fixed by the commiter directly :-)

Indeed, and with it
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

