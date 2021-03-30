Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1084834EA70
	for <lists+xen-devel@lfdr.de>; Tue, 30 Mar 2021 16:31:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103554.197525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRFOw-0006RS-Kr; Tue, 30 Mar 2021 14:31:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103554.197525; Tue, 30 Mar 2021 14:31:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRFOw-0006R3-Hd; Tue, 30 Mar 2021 14:31:26 +0000
Received: by outflank-mailman (input) for mailman id 103554;
 Tue, 30 Mar 2021 14:31:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2mYN=I4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRFOu-0006Qw-Be
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 14:31:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3d5c056-aaa4-4211-a677-65f5fcd2a8a9;
 Tue, 30 Mar 2021 14:31:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 98A17B30E;
 Tue, 30 Mar 2021 14:31:22 +0000 (UTC)
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
X-Inumbo-ID: f3d5c056-aaa4-4211-a677-65f5fcd2a8a9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617114682; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ljuuwqZq7fHjy/HZCYWcM8ceacV28zSia7RS3f7Phv8=;
	b=rvebCMpO/dl/+oO6Hhvu9taIOvI8TMDs22PSbLy+dauzoPGcOJOjARHxyOTQJIXHo1DS7A
	xvAPHsc039CaYB4XJbSYj9s5Sz1QJLiY1bZ7IbYV7o9rN9tPReMUZompGxwHkl6gyqnZ5h
	wk3q/f4FiCiDV4cT7YwbTm3bTGZpAgs=
Subject: Re: [PATCH 0/2] Introducing hyperlaunch capability design (formerly:
 DomB mode of dom0less)
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: christopher.w.clark@gmail.com, andrew.cooper3@citrix.com,
 stefano.stabellini@xilinx.com, jgrall@amazon.com,
 Julien.grall.oss@gmail.com, iwj@xenproject.org, wl@xen.org,
 george.dunlap@citrix.com, persaur@gmail.com, Bertrand.Marquis@arm.com,
 roger.pau@citrix.com, luca.fancellu@arm.com, paul@xen.org,
 adam.schwalm@starlab.io, xen-devel@lists.xenproject.org
References: <20210316031814.10311-1-dpsmith@apertussolutions.com>
 <6314f50f-b4fc-e472-4c9a-3591e168d2c3@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bd61f993-f719-ec87-638f-f53d6e983c3e@suse.com>
Date: Tue, 30 Mar 2021 16:31:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <6314f50f-b4fc-e472-4c9a-3591e168d2c3@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 16.03.2021 04:56, Daniel P. Smith wrote:
> To assist in reading, please find attached rendered copies of the design
> docs. It should be noted that due to poor rendering by pandoc, we forced
> the tables to stay as ASCII tables in the patches whereas the attached
> docs have the tables rendered properly by rst2pdf.

In section 3.6 I found "As a result, on x86 the hyperlaunch capability does
not rely on nor preclude any specific BIOS boot protocol, i.e legacy BIOS
boot or UEFI boot. The only requirement is that the boot loader supports
the Multiboot2 (MB2) protocol." I'm afraid the two sentences contradict
one another, as UEFI on its own doesn't provide MB2 functionality. It is
my understanding that you don't require this anyway - what you need is a
way to load modules beyond just Dom0 kernel and an initrd.

I'm also struggling to see how you mean to associate the (MB2) modules
passed to Xen with the individual functions. I.e. I don't see how it will
be ensure that the embedded mb-index is in sync with the order or modules
actually supplied.

As to modules - iirc there are placement restrictions by at least some
boot loaders (below 4Gb). If that's correct, do you have any thoughts
towards dealing with the limited space available to hold these modules?
I've seem systems with lots of memory, but with as little as just 1Gb
below the 4Gb boundary.

Jan

