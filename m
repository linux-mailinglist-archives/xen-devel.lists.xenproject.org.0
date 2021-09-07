Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAB6402A3F
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 15:54:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181082.328071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNbYU-0008Cg-VX; Tue, 07 Sep 2021 13:54:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181082.328071; Tue, 07 Sep 2021 13:54:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNbYU-0008As-RE; Tue, 07 Sep 2021 13:54:30 +0000
Received: by outflank-mailman (input) for mailman id 181082;
 Tue, 07 Sep 2021 13:54:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WTX3=N5=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mNbYT-0008Am-EY
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 13:54:29 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1df3285e-0fe3-11ec-b0f4-12813bfff9fa;
 Tue, 07 Sep 2021 13:54:28 +0000 (UTC)
Received: from [10.10.1.146] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1631022862921821.2351718715845;
 Tue, 7 Sep 2021 06:54:22 -0700 (PDT)
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
X-Inumbo-ID: 1df3285e-0fe3-11ec-b0f4-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1631022866; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=V+msD7NyuKPbikIqyuZrQjlfG9rqnXRv+UdGyKeDJcplSHc4nfcPrXg9YnrP0zSY3xG1ALWZkkjuJu6mWHMqR8KTILHXpePtu4CG8Mw80Gkj0H0egAzg8pIzD7WkJSo50PihBB7va5WTgceXaBw1ZKq0j44hb57xabUKLD014zI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1631022866; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=a0yjKN4vFjwtQ5VFXF1O0n7vkyNeAOlsxBb/XzZzYrU=; 
	b=nwnrI5t0OWMYHJN3XD5wL4rfsmMKdxs8901CSG/lgUnqfsGJPj2J7PnTa8YjPg3UU8IFd2W5lfs7/b2HVbP5eac1J2k/M3aSGoV4Wb4JNDbhsrnlUQKqO8BX/Uxx/Z5K2JhgDknLXFeZNFMBL526sv3QXu6voz81mZbd8KMrDfQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1631022866;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=a0yjKN4vFjwtQ5VFXF1O0n7vkyNeAOlsxBb/XzZzYrU=;
	b=Ak7OYVa89Vm+TLZuIxxkztPYzwSakyThdNyxbE+XkDO9LW/NPGk/V5BgKQUrvK6c
	JHm5FYxP6YBQfeXW7+s/EQBLHFwoX8/IbziLo1XYXi0hR4gPIwa8uOO9VVqg+5HNtta
	n4qd8D62m6pmfBnBIuuCAQC24CFhwPjQeMbddEnw=
Subject: Re: [PATCH v4 07/11] xsm: decouple xsm header inclusion selection
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
 <20210903190629.11917-8-dpsmith@apertussolutions.com>
 <17155620-d091-3205-6af0-65e19dfa1bfb@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <786e7f2c-67ce-ee44-bf98-d94772f44921@apertussolutions.com>
Date: Tue, 7 Sep 2021 09:52:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <17155620-d091-3205-6af0-65e19dfa1bfb@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 9/6/21 2:47 PM, Andrew Cooper wrote:
> On 03/09/2021 20:06, Daniel P. Smith wrote:
>> diff --git a/xen/include/xsm/xsm-core.h b/xen/include/xsm/xsm-core.h
>> new file mode 100644
>> index 0000000000..4555e111dc
>> --- /dev/null
>> +++ b/xen/include/xsm/xsm-core.h
>> @@ -0,0 +1,274 @@
>> +/*
>> + *  This file contains the XSM hook definitions for Xen.
>> + *
>> + *  This work is based on the LSM implementation in Linux 2.6.13.4.
>> + *
>> + *  Author:  George Coker, <gscoker@alpha.ncsc.mil>
>> + *
>> + *  Contributors: Michael LeMay, <mdlemay@epoch.ncsc.mil>
>> + *
>> + *  This program is free software; you can redistribute it and/or modify
>> + *  it under the terms of the GNU General Public License version 2,
>> + *  as published by the Free Software Foundation.
>> + */
>> +
>> +#ifndef __XSM_CORE_H__
>> +#define __XSM_CORE_H__
>> +
>> +#include <xen/sched.h>
>> +#include <xen/multiboot.h>
>> +
>> +/* policy magic number (defined by XSM_MAGIC) */
>> +typedef uint32_t xsm_magic_t;
>> +
>> +#ifdef CONFIG_XSM_FLASK
>> +#define XSM_MAGIC 0xf97cff8c
>> +#else
>> +#define XSM_MAGIC 0x0
>> +#endif
> 
> Eww.  I know you're only moving code, but this construct is broken
> (right from XSM's introduction in c/s d046f361dc937), and creates a
> fairly-severe bug.
> 
> It causes xsm_multiboot_policy_init() to malfunction and accept a module
> which starts with 4 zeroes, rather than the flask magic number.  The one
> caller is suitably guarded so this is only a latent bug right now, but I
> don't think we could credibly security support the code without this
> being fixed.  (Again - fine to add to the todo list.  I know there's
> loads to do)

I cannot in good conscience leave a clearly latent bug. Let me see if 
can work a safer means to handling policy module loading.

>> +
>> +/* These annotations are used by callers and in dummy.h to document the
>> + * default actions of XSM hooks. They should be compiled out otherwise.
>> + */
> 
> For the coding style patch, this should be
> 
> /*
>   * These ...

Ack.

>> +#ifdef CONFIG_XSM
>> +
>> +#ifdef CONFIG_MULTIBOOT
>> +int xsm_multiboot_init(unsigned long *module_map,
>> +                       const multiboot_info_t *mbi);
>> +int xsm_multiboot_policy_init(unsigned long *module_map,
>> +                              const multiboot_info_t *mbi,
>> +                              void **policy_buffer,
>> +                              size_t *policy_size);
>> +#endif
>> +
>> +#ifdef CONFIG_HAS_DEVICE_TREE
>> +/*
>> + * Initialize XSM
>> + *
>> + * On success, return 1 if using SILO mode else 0.
>> + */
>> +int xsm_dt_init(void);
>> +int xsm_dt_policy_init(void **policy_buffer, size_t *policy_size);
>> +bool has_xsm_magic(paddr_t);
>> +#endif
>> +
>> +#ifdef CONFIG_XSM_FLASK
>> +const struct xsm_ops *flask_init(const void *policy_buffer,
>> +                                 size_t policy_size);
>> +#else
>> +static inline const struct xsm_ops *flask_init(const void *policy_buffer,
>> +                                               size_t policy_size)
>> +{
>> +    return NULL;
>> +}
>> +#endif
>> +
>> +#ifdef CONFIG_XSM_SILO
>> +const struct xsm_ops *silo_init(void);
>> +#else
>> +static const inline struct xsm_ops *silo_init(void)
>> +{
>> +    return NULL;
>> +}
>> +#endif
>> +
>> +#else /* CONFIG_XSM */
>> +
>> +#ifdef CONFIG_MULTIBOOT
>> +static inline int xsm_multiboot_init(unsigned long *module_map,
>> +                                     const multiboot_info_t *mbi)
>> +{
>> +    return 0;
>> +}
>> +#endif
>> +
>> +#ifdef CONFIG_HAS_DEVICE_TREE
>> +static inline int xsm_dt_init(void)
>> +{
>> +    return 0;
>> +}
>> +
>> +static inline bool has_xsm_magic(paddr_t start)
>> +{
>> +    return false;
>> +}
>> +#endif /* CONFIG_HAS_DEVICE_TREE */
> 
> Shouldn't this be an #ifndef CONFIG_HAS_DEVICE_TREE ?
> 
> And the answer is no because of the #else /* CONFIG_XSM */ higher up,
> but it is incredibly deceptive to read.
> 
> 
> I think this logic would be far easier to follow as:
> 
> #if IS_ENABLED(CONFIG_XSM) && IS_ENABLED(CONFIG_MULTIBOOT)
> ...
> #else
> ...
> #endif
> 
> etc.
> 
> rather than having two separate #ifdef CONFIG_MULTIBOOT blocks doing
> opposite things due to the position of intermixed #ifdef CONFIG_XSM.

Ack.

v/r
dps

