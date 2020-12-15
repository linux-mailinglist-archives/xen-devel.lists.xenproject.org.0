Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA5E2DB1BA
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:45:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54654.95136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDSJ-0001X7-Cg; Tue, 15 Dec 2020 16:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54654.95136; Tue, 15 Dec 2020 16:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDSJ-0001Wi-8w; Tue, 15 Dec 2020 16:45:43 +0000
Received: by outflank-mailman (input) for mailman id 54654;
 Tue, 15 Dec 2020 16:45:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kpDSI-0001Wc-0I
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:45:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kpDSH-00039m-NJ; Tue, 15 Dec 2020 16:45:41 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kpDSH-0006bJ-HZ; Tue, 15 Dec 2020 16:45:41 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:To:Subject;
	bh=9hPQXRVwV4EQwXQe2iL5b6tNmVUdHl4SUU3kkYA7bFA=; b=7DGp+3/xnuCcGK6GRfbnWRTqSv
	E+9QVDcXx6E4TD08u0JEzBrFj7eXtbqSvIH7j2JM+XpNIqxh4oCWDuZMIyneHGsezllhCdSAYiw34
	37N/xQIoRviDVMt3k6vudzAduwwQDCkBi8/N2O5Oe6GtZLXpfAcuAI71CsjABYz97nQc=;
Subject: Re: Xen-ARM DomUs
To: Elliott Mitchell <ehem+xen@m5p.com>, Roman Shaposhnik <roman@zededa.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <X9gcZu5uJpXx8wNn@mattapan.m5p.com>
From: Julien Grall <julien@xen.org>
Message-ID: <82c684ad-6c33-7608-9424-3bb46f58ac9c@xen.org>
Date: Tue, 15 Dec 2020 16:45:39 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <X9gcZu5uJpXx8wNn@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 15/12/2020 02:16, Elliott Mitchell wrote:
> Finally getting to the truly productive stages of my project with Xen on
> ARM.
> 
> How many of the OSes which function as x86 DomUs for Xen, function as
> ARM DomUs?  Getting Linux operational was straightforward, but what of
> others?

If you are interested to port an new OS on Xen, I would suggest to read [1].

> 
> The available examples seem geared towards Linux DomUs.  I'm looking at a
> FreeBSD installation image and it appears to expect an EFI firmware.
> Beyond having a bunch of files appearing oriented towards booting on EFI
> I can't say much about (booting) FreeBSD/ARM DomUs.

I wrote PoC a few years ago to boot FreeBSD on Xen on Arm (see [2]). I 
haven't touched it for quite a while, so you may need to use a different 
branch in that tree.

Cheers,

[1] 
https://events.static.linuxfound.org/sites/events/files/slides/Porting%20FreeBSD%20on%20Xen%20on%20ARM%20.pdf
[2] 
https://xenbits.xen.org/gitweb/?p=people/julieng/freebsd.git;a=shortlog;h=refs/heads/dev-arm64

> 
> 

-- 
Julien Grall

