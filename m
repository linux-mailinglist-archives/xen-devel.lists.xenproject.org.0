Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 344C342A852
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 17:34:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207440.363275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maJnO-0001yk-I7; Tue, 12 Oct 2021 15:34:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207440.363275; Tue, 12 Oct 2021 15:34:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maJnO-0001wW-Em; Tue, 12 Oct 2021 15:34:26 +0000
Received: by outflank-mailman (input) for mailman id 207440;
 Tue, 12 Oct 2021 15:34:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1maJnN-0001wQ-8S
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 15:34:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1maJnL-00040w-Im; Tue, 12 Oct 2021 15:34:23 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225] helo=[192.168.23.5])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1maJnL-0005NM-D6; Tue, 12 Oct 2021 15:34:23 +0000
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
	bh=ZbeFZqmFNwlzok7VDP85LVy+9ZNCacj9ZKff0e11BIc=; b=BA/spLaK2AC1KIuwnmjB/MDbL4
	hiDw/29qgOhWUU0X+6CuFS3mxHaDjYOONzw2K3AwY9Ez9Vjd+P80pXl3JnKgDlesgBiZ5mLfdcooI
	SsVzIcoDtCmncbNkqRgZR2aYP1FJA6faLTKgGzieQUSuFubnkn5bndJLvycdH1dBe8SE=;
Message-ID: <eecabba5-9363-9c4a-6b95-6b1f3bbd34e0@xen.org>
Date: Tue, 12 Oct 2021 16:34:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v5 3/3] xen: Expose the PMU to the guests
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 bertrand.marquis@arm.com
References: <20211012081323.14141-1-michal.orzel@arm.com>
 <20211012081323.14141-4-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211012081323.14141-4-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 12/10/2021 09:13, Michal Orzel wrote:
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 317392d8f3..2f1f60c49a 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -256,6 +256,15 @@ from dom0.
>   
>       Status, x86: Tech Preview
>   
> +### vPMU support

There is already a section vPMU that is meant to be generic. At the 
moment it mentions the status support for x86 but not Arm. So can you 
fold the status for Arm there?

> +
> +Support for accessing PMU registers from the guests.
> +There is no interrupt support and Xen will not save/restore
> +the register values on context switches.
> +Disabled by default (enable with guest parameter).
> +
> +    Status, ARM: Experimental
> +

The rest of the patch looks good to me.

Cheers,

-- 
Julien Grall

