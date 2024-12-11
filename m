Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8FA9ED05C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 16:50:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854932.1268005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLOyX-0003Ug-Q6; Wed, 11 Dec 2024 15:50:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854932.1268005; Wed, 11 Dec 2024 15:50:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLOyX-0003Sg-NM; Wed, 11 Dec 2024 15:50:09 +0000
Received: by outflank-mailman (input) for mailman id 854932;
 Wed, 11 Dec 2024 15:50:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbUB=TE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLOyV-0003Sa-Lo
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 15:50:07 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96eff7c2-b7d7-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 16:50:06 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1733932198330521.808700040406;
 Wed, 11 Dec 2024 07:49:58 -0800 (PST)
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
X-Inumbo-ID: 96eff7c2-b7d7-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1733932201; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hO5jdAoh7s6+2XYrGfHwetCAiwBcyJGNScpc1+cIiRQe1qYtZivX9te5Sn60oSib9uKICTOQuz913brDCc/UADCQqwl+oIsOPn72S6u5TmmYDQYvPA6OY6WaZyQzdB2MOgbj8mQ2Uf77Whvq9dvoPiKNAJgPngxaUUsbaienpd8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733932201; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4mNkgdDLw9V4heCgs6q03+jt8fQN8SUF8+4WfCQLRMs=; 
	b=Arg85pjk9G9nR6gwu8Y9D8I8NPE55+VrM8tSHK2LPScIiWph2P8T+VdP5YX/mfjUETqNdChNFSSP7oX0Yy7r4bqTec8kGvFEdDBy2DNW62YdmjYPcP5nUCV224bC+BhY1pJg80KNUFSJVT6GK5Wka2JCvaY+xoW/My2duIzRjt0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733932201;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4mNkgdDLw9V4heCgs6q03+jt8fQN8SUF8+4WfCQLRMs=;
	b=Xe/4HAz8bKWe3oZbmXncwwVe/bxw6dZhUdDFwXxXqFMqnbvutdEIubsi4GPiJZiI
	8CmjX4yeYiU6oKq9WX9t5jIhlFwwu7xbySlidjIkZWz4ojjOFwz/aDvVN8s3MXNKf3J
	UQKzr41xOdaL2yaWjzRESmnJB/STMnp8KAEjvDT0=
Message-ID: <c7de8d61-b550-4a93-8bd4-cfb07d52c124@apertussolutions.com>
Date: Wed, 11 Dec 2024 10:49:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/15] x86/hyperlaunch: locate dom0 initrd with
 hyperlaunch
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-11-dpsmith@apertussolutions.com>
 <4fe95739-1873-401b-b253-5d13c13abc9d@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <4fe95739-1873-401b-b253-5d13c13abc9d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/25/24 18:34, Jason Andryuk wrote:
> On 2024-11-23 13:20, Daniel P. Smith wrote:
>> Look for a subnode of type `multiboot,ramdisk` within a domain node. If
>> found, process the reg property for the MB1 module index.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/domain_builder/fdt.c | 25 ++++++++++++++++++++++
>>   xen/arch/x86/setup.c              | 35 +++++++++++++++++--------------
>>   2 files changed, 44 insertions(+), 16 deletions(-)
>>
>> diff --git a/xen/arch/x86/domain_builder/fdt.c b/xen/arch/x86/ 
>> domain_builder/fdt.c
>> index f8ddb11b339e..bc8054a80ec1 100644
>> --- a/xen/arch/x86/domain_builder/fdt.c
>> +++ b/xen/arch/x86/domain_builder/fdt.c
>> @@ -152,6 +152,31 @@ static int __init process_domain_node(
>>                   if ( ret > 0 )
>>                       bd->kernel->fdt_cmdline = true;
>>               }
>> +
>> +            continue;
>> +        }
>> +        if ( fdt_node_check_compatible(fdt, node, 
>> "multiboot,ramdisk") == 0 )
> 
> I think
>          continue;
>      }
>      if
> 
> should change to
> 
>      } else if
> 
> ?

Yah, I can make it a nested set of ifs.

> Also "module,ramdisk"/"module,index"?

Yes, will be updated to new format.

v/r,
dps


