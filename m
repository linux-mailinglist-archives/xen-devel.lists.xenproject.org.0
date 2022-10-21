Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDB1607D7A
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 19:26:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427920.677541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olvmV-0002c4-9d; Fri, 21 Oct 2022 17:26:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427920.677541; Fri, 21 Oct 2022 17:26:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olvmV-0002Zb-5f; Fri, 21 Oct 2022 17:26:03 +0000
Received: by outflank-mailman (input) for mailman id 427920;
 Fri, 21 Oct 2022 17:26:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1olvmT-0002ZT-Py
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 17:26:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1olvmS-00085s-JC; Fri, 21 Oct 2022 17:26:00 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.29.168]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1olvmS-0003qB-By; Fri, 21 Oct 2022 17:26:00 +0000
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
	bh=AsxB9Sl6mZH8WBJEcs4TjcSIZKpYwIPbeEV1vL6bZKQ=; b=x7vlH/fbpH/cFM++IGY/hpv0Nb
	4SL6i3pBqIu6MOS0qpLArGO4r4vSSZ0vZ9PL6Cm/6gCgmLa6VVwote/ibBMveuOPu10vIz6K23GFH
	AnkgOdeMNCtcxFww8MrUggWnHqzrQgpgT4tYfVbjqXPE3LzCsHeIEHqyesL5jZjRDmU8=;
Message-ID: <b800a6a8-97da-bfb3-81bb-230592ce19e1@xen.org>
Date: Fri, 21 Oct 2022 18:25:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH 02/12] xen/arm: add cache coloring initialization for
 domains
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>, Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it,
 andrea.bastoni@minervasys.tech, lucmiccio@gmail.com,
 Marco Solieri <marco.solieri@minervasys.tech>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-3-carlo.nonato@minervasys.tech>
 <fe58de74-8bf5-50df-eb32-2d479758bfd8@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <fe58de74-8bf5-50df-eb32-2d479758bfd8@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 26/09/2022 07:39, Wei Chen wrote:
> 
> 
> On 2022/8/26 20:51, Carlo Nonato wrote:
>> This commit adds array pointers to domains as well as to the hypercall
>> and configuration structure employed in domain creation. The latter is 
>> used
>> both by the toolstack and by Xen itself to pass configuration data to the
>> domain creation function, so the XEN_GUEST_HANDLE macro must be 
>> adopted to be
>> able to access guest memory in the first case. This implies special 
>> care for
>> the copy of the configuration data into the domain data, meaning that a
>> discrimination variable for the two possible code paths (coming from 
>> Xen or
>> from the toolstack) is needed.
>>
>> The initialization and free functions for colored domains are also added.
>> The former is responsible for allocating and populating the color array
>> of the domain and it also checks for configuration issues. One of those
>> issues is enabling both coloring and directmap for the domain because 
>> they
>> contradicts one another. Since that, Dom0 must not be created with the
>> directmap flag.
>> The latter instead frees allocated memory.
>>
>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
>> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
>> ---
>>   docs/misc/arm/cache-coloring.rst    |  7 ++--
>>   xen/arch/arm/coloring.c             | 56 +++++++++++++++++++++++++++++
>>   xen/arch/arm/domain.c               | 11 ++++++
>>   xen/arch/arm/domain_build.c         | 13 +++++--
>>   xen/arch/arm/include/asm/coloring.h |  7 ++++
>>   xen/arch/arm/include/asm/domain.h   |  4 +++
>>   xen/include/public/arch-arm.h       |  8 +++++
>>   7 files changed, 102 insertions(+), 4 deletions(-)
>>
>> diff --git a/docs/misc/arm/cache-coloring.rst 
>> b/docs/misc/arm/cache-coloring.rst
>> index c7adcb0f1f..345d97cb56 100644
>> --- a/docs/misc/arm/cache-coloring.rst
>> +++ b/docs/misc/arm/cache-coloring.rst
>> @@ -13,7 +13,7 @@ In order to enable and use it, few steps are needed.
>>     (refer to menuconfig help for value meaning and when it should be 
>> changed).
>>           CONFIG_MAX_CACHE_COLORS=<n>
>> -- Assign colors to Dom0 using the `Color selection format`_ (see
>> +- Assign colors to domains using the `Color selection format`_ (see
>>     `Coloring parameters`_ for more documentation pointers).
>>   Background
>> @@ -109,4 +109,7 @@ Coloring parameters
>>   LLC way size (as previously discussed) and Dom0 colors can be set 
>> using the
>>   appropriate command line parameters. See the relevant documentation in
>> -"docs/misc/xen-command-line.pandoc".
>> \ No newline at end of file
>> +"docs/misc/xen-command-line.pandoc".
>> +
>> +Note that if no color configuration is provided for domains, they 
>> fallback to
>> +the default one, which corresponds simply to all available colors.
>> \ No newline at end of file
>> diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
>> index c010ebc01b..2b37cda067 100644
>> --- a/xen/arch/arm/coloring.c
>> +++ b/xen/arch/arm/coloring.c
>> @@ -22,6 +22,7 @@
>>    * along with this program.  If not, see 
>> <http://www.gnu.org/licenses/>.
>>    */
>>   #include <xen/errno.h>
>> +#include <xen/guest_access.h>
>>   #include <xen/keyhandler.h>
>>   #include <xen/param.h>
>>   #include <xen/types.h>
>> @@ -211,6 +212,61 @@ bool __init coloring_init(void)
>>       return true;
>>   }
>> +int domain_coloring_init(struct domain *d,
>> +                         const struct xen_arch_domainconfig *config)
>> +{
>> +    if ( is_domain_direct_mapped(d) )
>> +    {
>> +        printk(XENLOG_ERR
>> +               "Can't enable coloring and directmap at the same time 
>> for %pd\n",
>> +               d);
>> +        return -EINVAL;
>> +    }
>> +
>> +    if ( is_hardware_domain(d) )
>> +    {
>> +        d->arch.colors = dom0_colors;
>> +        d->arch.num_colors = dom0_num_colors;
>> +    }
>> +    else if ( config->num_colors == 0 )
>> +    {
>> +        printk(XENLOG_WARNING
>> +               "Color config not found for %pd. Using default\n", d);
>> +        d->arch.colors = xzalloc_array(unsigned int, max_colors);
>> +        d->arch.num_colors = set_default_domain_colors(d->arch.colors);
>> +    }
>> +    else
>> +    {
>> +        d->arch.colors = xzalloc_array(unsigned int, 
>> config->num_colors);
>> +        d->arch.num_colors = config->num_colors;
>> +        if ( config->from_guest )
>> +            copy_from_guest(d->arch.colors, config->colors, 
>> config->num_colors);
>> +        else
>> +            memcpy(d->arch.colors, config->colors.p,
>> +                   sizeof(unsigned int) * config->num_colors);
>> +    }
>> +
>> +    if ( !d->arch.colors )
>> +    {
>> +        printk(XENLOG_ERR "Colors allocation failed for %pd\n", d);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    if ( !check_colors(d->arch.colors, d->arch.num_colors) )
>> +    {
> 
> If we add xfree(d->arch.colors) here for non-hw domains, is it possible 
> to make this function have a complete fallback process? And I know 
> currently, this is handled in domain_coloring_free.

arch_domain_destroy() (and therefore domain_coloring_free()) will always 
be called by arch_domain_create(). So here you will want to use XFREE() 
to avoid a double free.

However, I would just rely on the free() in domain_coloring_free().

Cheers,

-- 
Julien Grall

