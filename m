Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE85C89910B
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 00:12:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701020.1095022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsVIk-0005y2-HB; Thu, 04 Apr 2024 22:11:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701020.1095022; Thu, 04 Apr 2024 22:11:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsVIk-0005wM-ES; Thu, 04 Apr 2024 22:11:18 +0000
Received: by outflank-mailman (input) for mailman id 701020;
 Thu, 04 Apr 2024 22:11:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AdTa=LJ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rsVIi-0005wG-Bo
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 22:11:16 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f896a1d-f2d0-11ee-afe5-a90da7624cb6;
 Fri, 05 Apr 2024 00:11:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 101DF8284D55;
 Thu,  4 Apr 2024 17:11:12 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id PgeJihelWa6m; Thu,  4 Apr 2024 17:11:10 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 96C6C82858BB;
 Thu,  4 Apr 2024 17:11:10 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id OnLbWvYSvfCl; Thu,  4 Apr 2024 17:11:10 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id E54968284D55;
 Thu,  4 Apr 2024 17:11:09 -0500 (CDT)
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
X-Inumbo-ID: 3f896a1d-f2d0-11ee-afe5-a90da7624cb6
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 96C6C82858BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1712268670; bh=0K5yuHbzyq6JnoikLvw1G15Z/yoGv0sFVQarsfrWIg8=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=P+iItqLrRMLMs5gDO8ceOS4q6wd6zfWLAof9r80VUQSSa6v0dB6pTbiXjOxhJ7EE0
	 UjMNads/0JGDjhMNM15is7U9I2u3msTFMkHGMpMURR6ak0TMFJXxKOXPaUnwEXVrx1
	 JqKn0kfbWQn2Zsvt/AxBr1wLvQ9qXN6Os8haIqZs=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <d7227c0b-ff3d-4e83-8240-160e5d4e5053@raptorengineering.com>
Date: Thu, 4 Apr 2024 17:11:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] xen/asm-generic: Introduce generic acpi.h
To: Jan Beulich <jbeulich@suse.com>
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <794e46b16475c0b4f482cdc8560ebb2f37875715.1710443965.git.sanastasio@raptorengineering.com>
 <a6147b83-97e8-4c73-982c-221178b951f5@suse.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <a6147b83-97e8-4c73-982c-221178b951f5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jan,

On 3/25/24 10:19 AM, Jan Beulich wrote:
> On 14.03.2024 23:15, Shawn Anastasio wrote:
>> Introduce a generic acpi.h header that provides the required definitions
>> to allow files including xen/acpi.h to be compiled. The definitions were
>> largely derived from the !CONFIG_ACPI parts of ARM's acpi.h.
> 
> As said a couple of times in discussion with Oleksii on his work towards
> populating asm-generic/, I view a use like this as an abuse of this
> asm-generic machinery. Instead imo said !CONFIG_ACPI parts from Arm's header
> want moving to xen/acpi.h, eliminating the need for asm/acpi.h for
> architectures / configurations not supporting ACPI. Much like was done
> with e.g. xen/numa.h.
>

In this case I'm not sure I fully agree, since the definitions here
aren't really stubs but rather more-or-less fully complete
architecture-independent implementations of these symbols for the
!CONFIG_ACPI case.

That said, after you mentioned the other route of modifying xen/acpi.h,
I found that going that route required fewer changes, so I'll proceed
with that approach.

> Jan

Thanks,
Shawn

