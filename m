Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19796517106
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 15:54:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318903.538887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlWVE-00042r-KR; Mon, 02 May 2022 13:54:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318903.538887; Mon, 02 May 2022 13:54:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlWVE-0003zU-HY; Mon, 02 May 2022 13:54:16 +0000
Received: by outflank-mailman (input) for mailman id 318903;
 Mon, 02 May 2022 13:54:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9N+v=VK=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nlWVD-0003zE-8a
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 13:54:15 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58fe2fce-ca1f-11ec-a405-831a346695d4;
 Mon, 02 May 2022 15:54:14 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1651499646743167.30787887760266;
 Mon, 2 May 2022 06:54:06 -0700 (PDT)
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
X-Inumbo-ID: 58fe2fce-ca1f-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; t=1651499650; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Bmr94QD4cG10BlBiydOQjyajDBpsSFWvoOd9xJJ+Vx08MCc9XCUOxtZ7rr7FFEqJDvxhTmZAvH8oqy9pszb4knCUXKraQeN/wyhydn/dEgkz/ykMi43psKysQC9WN6a7MJcKZ/GodwPlE6TKX0ir1+NQpsQMH/YSt43HPeG3eRs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1651499650; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=FnYMnVWVfaH0gMtZ3vc/CoRsavdGYhQAWNFcbxlBHn4=; 
	b=CwfmQlmvqPCppccKMhVvXinHvB1ofj6Kv0lfg/5zPN730pGt3hOsgiwUOERgvBlev6zkixoFgzouF641e8hOiwst/qFxbcxqUGorM93YFs+Gk8KAgSW4qLIOk5ODZZvVyTCXW43AaTxZCUMFZI8+j5DoiX8KUmihPEVXK9o1epw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1651499650;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=FnYMnVWVfaH0gMtZ3vc/CoRsavdGYhQAWNFcbxlBHn4=;
	b=V/2L56osNe6j1UZTNnHUx25iobKbvSwqHKGQvuRzg4qlcquvxqEnJyvvHdLj3EG3
	54jjPZq2NzpgMHz2cc1BXzTAMpTekMYgmSjkfXBWom8zRER4blcfgsC2DAoAw40t62Z
	ZTzOOq8vBhbzVLeLOr6mjN22DbRASsPF0wQC2in8=
Message-ID: <15634549-bde3-873b-862c-37ebb891ba0e@apertussolutions.com>
Date: Mon, 2 May 2022 09:53:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 1/2] xsm: create idle domain privileged and demote
 after setup
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Scott Davis <scott.davis@starlab.io>, christopher.clark@starlab.io,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20220502133027.920-1-dpsmith@apertussolutions.com>
 <20220502133027.920-2-dpsmith@apertussolutions.com>
 <CAKf6xptU7VxGzaHe=jVc0O2fbZfQi1Rmf0hDsJzOB-9k7=4W-Q@mail.gmail.com>
 <7db6b050-7ace-406f-550b-d407c57cfa59@apertussolutions.com>
In-Reply-To: <7db6b050-7ace-406f-550b-d407c57cfa59@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 5/2/22 09:49, Daniel P. Smith wrote:
> On 5/2/22 09:42, Jason Andryuk wrote:
>> On Mon, May 2, 2022 at 9:31 AM Daniel P. Smith
>> <dpsmith@apertussolutions.com> wrote:
>>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>>> index d5d0792ed4..b9057222d6 100644
>>> --- a/xen/arch/arm/setup.c
>>> +++ b/xen/arch/arm/setup.c
>>> @@ -1048,6 +1048,10 @@ void __init start_xen(unsigned long boot_phys_offset,
>>>      /* Hide UART from DOM0 if we're using it */
>>>      serial_endboot();
>>>
>>> +    if ( (rc = xsm_set_system_active()) != 0 )
>>> +        panic("xsm(err=%d): "
>>> +              "unable to set hypervisor to SYSTEM_ACTIVE privilege\n", err);
>>
>> You want to print rc in this message.
> 
> Thanks, but now I want to figure out how that compile

Ah, arm which I do not have a build env to do build tests.

v/r,
dps


