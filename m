Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F84950D388
	for <lists+xen-devel@lfdr.de>; Sun, 24 Apr 2022 18:35:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312188.529389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nifC6-0003Cd-KK; Sun, 24 Apr 2022 16:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312188.529389; Sun, 24 Apr 2022 16:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nifC6-00039x-H3; Sun, 24 Apr 2022 16:34:42 +0000
Received: by outflank-mailman (input) for mailman id 312188;
 Sun, 24 Apr 2022 16:34:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nifC5-00039r-MR
 for xen-devel@lists.xenproject.org; Sun, 24 Apr 2022 16:34:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nifC5-0006Iu-7D; Sun, 24 Apr 2022 16:34:41 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nifC5-0005KG-1l; Sun, 24 Apr 2022 16:34:41 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=vNm9+PyVSLS5gX8C8VhKLW5scel3z5mGkUEUfPXaQ/8=; b=jpc/fTU5AlfueZPxiZ+EyDrqHT
	oaLyJpFc0T+RrzqHLHPaEr142CQUQwSeMyiWMQbzdxAVDqVVLga9Mol/N2ILdIoy7ua1uJBYXxYHc
	9cb7kL5Ewd2rfOos+PCFwZ5JpR/jCWx1f8tX6egsoF3PbnI+TO4so3VLNE9GroouVIsE=;
Message-ID: <95926460-c332-8ad7-9430-c628705b21d5@xen.org>
Date: Sun, 24 Apr 2022 17:34:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
To: Paran Lee <p4ranlee@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: austindh.kim@gmail.com, xen-devel@lists.xenproject.org
References: <20220419154619.GA3136@DESKTOP-NK4TH6S.localdomain>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/device_tree: silence ambiguous integer casting
 warning error
In-Reply-To: <20220419154619.GA3136@DESKTOP-NK4TH6S.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 19/04/2022 16:46, Paran Lee wrote:
> GCC with "-g -Wall -Wextra" option throws warning message as below:

s/warning/error/

> 
> error: comparison of integer expressions of different signedness:
>   ‘int’ and ‘unsigned int’ [-Werror=sign-compare]

Can you post the full log?

> 
> Silence the warning by correcting the integer type.

IIRC most of the code you touch below is from Linux and had very limited 
changes afterwards. So while I agree the changes are good, AFAIK they 
are not (latent?) bugs and we don't build by default with -Wextra.

Therefore, I would prefer if they are upstreamed to Linux first and then 
backported to Xen.

> 
> Signed-off-by: Paran Lee <p4ranlee@gmail.com>
> ---
>   xen/common/device_tree.c | 31 +++++++++++++++----------------
>   1 file changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 4aae281e89..402e465c7a 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -79,7 +79,7 @@ struct dt_bus
>       const char *addresses;
>       bool_t (*match)(const struct dt_device_node *node);
>       void (*count_cells)(const struct dt_device_node *child,
> -                        int *addrc, int *sizec);
> +                        unsigned int *addrc, unsigned int *sizec);
>       u64 (*map)(__be32 *addr, const __be32 *range, int na, int ns, int pna);
>       int (*translate)(__be32 *addr, u64 offset, int na);
>       unsigned int (*get_flags)(const __be32 *addr);
> @@ -569,7 +569,7 @@ static bool_t dt_bus_default_match(const struct dt_device_node *node)
>   }
>   
>   static void dt_bus_default_count_cells(const struct dt_device_node *dev,
> -                                int *addrc, int *sizec)
> +                                       unsigned int *addrc, unsigned int *sizec)
>   {
>       if ( addrc )
>           *addrc = dt_n_addr_cells(dev);

Technically, the prototype of dt_n_addr_cells() is "int ... (". So now 
you are casting an "int" to an "unsigned int". AFAICT, dt_n_addr_cells() 
will never return a negative value. So we should propage the "unsigned int".

> @@ -649,7 +649,7 @@ static bool_t dt_bus_pci_match(const struct dt_device_node *np)
>   }
>   
>   static void dt_bus_pci_count_cells(const struct dt_device_node *np,
> -				   int *addrc, int *sizec)
> +				   unsigned int *addrc, unsigned int *sizec)
>   {
>       if (addrc)
>           *addrc = 3;
> @@ -737,7 +737,7 @@ static const struct dt_bus dt_busses[] =
>   
>   static const struct dt_bus *dt_match_bus(const struct dt_device_node *np)
>   {
> -    int i;
> +    long unsigned int i;

This should be size_t.

>   
>       for ( i = 0; i < ARRAY_SIZE(dt_busses); i++ )
>           if ( !dt_busses[i].match || dt_busses[i].match(np) )
> @@ -754,7 +754,8 @@ static const __be32 *dt_get_address(const struct dt_device_node *dev,
>       u32 psize;
>       const struct dt_device_node *parent;
>       const struct dt_bus *bus;
> -    int onesize, i, na, ns;
> +    unsigned int i;
> +    unsigned int onesize, na, ns; >
>       /* Get parent & match bus type */
>       parent = dt_get_parent(dev);
> @@ -797,8 +798,7 @@ static int dt_translate_one(const struct dt_device_node *parent,
>                               int pna, const char *rprop)
>   {
>       const __be32 *ranges;
> -    unsigned int rlen;
> -    int rone;
> +    unsigned int rlen, rone;
>       u64 offset = DT_BAD_ADDR;
>   
>       ranges = dt_get_property(parent, rprop, &rlen);
> @@ -857,7 +857,7 @@ static u64 __dt_translate_address(const struct dt_device_node *dev,
>       const struct dt_device_node *parent = NULL;
>       const struct dt_bus *bus, *pbus;
>       __be32 addr[DT_MAX_ADDR_CELLS];
> -    int na, ns, pna, pns;
> +    unsigned int na, ns, pna, pns;
>       u64 result = DT_BAD_ADDR;
>   
>       dt_dprintk("DT: ** translation for device %s **\n", dev->full_name);
> @@ -966,8 +966,7 @@ int dt_for_each_range(const struct dt_device_node *dev,
>       const struct dt_bus *bus, *pbus;
>       const __be32 *ranges;
>       __be32 addr[DT_MAX_ADDR_CELLS];
> -    unsigned int rlen;
> -    int na, ns, pna, pns, rone;
> +    unsigned int rlen, na, ns, pna, pns, rone;
>   
>       bus = dt_match_bus(dev);
>       if ( !bus )
> @@ -1134,7 +1133,7 @@ unsigned int dt_number_of_address(const struct dt_device_node *dev)
>       u32 psize;
>       const struct dt_device_node *parent;
>       const struct dt_bus *bus;
> -    int onesize, na, ns;
> +    unsigned int onesize, na, ns;
>   
>       /* Get parent & match bus type */
>       parent = dt_get_parent(dev);
> @@ -1169,8 +1168,8 @@ int dt_for_each_irq_map(const struct dt_device_node *dev,
>       const struct dt_device_node *ipar, *tnode, *old = NULL;
>       const __be32 *tmp, *imap;
>       u32 intsize = 1, addrsize, pintsize = 0, paddrsize = 0;
> -    u32 imaplen;
> -    int i, ret;
> +    u32 i, imaplen;
> +    int ret;
>   
>       struct dt_raw_irq dt_raw_irq;
>       struct dt_irq dt_irq;
> @@ -1354,8 +1353,8 @@ static int dt_irq_map_raw(const struct dt_device_node *parent,
>       const struct dt_device_node *ipar, *tnode, *old = NULL, *newpar = NULL;
>       const __be32 *tmp, *imap, *imask;
>       u32 intsize = 1, addrsize, newintsize = 0, newaddrsize = 0;
> -    u32 imaplen;
> -    int match, i;
> +    u32 i, imaplen;
> +    int match;
>   
>       dt_dprintk("dt_irq_map_raw: par=%s,intspec=[0x%08x 0x%08x...],ointsize=%d\n",
>                  parent->full_name, be32_to_cpup(intspec),
> @@ -1737,7 +1736,7 @@ static int __dt_parse_phandle_with_args(const struct dt_device_node *np,
>   
>               if ( out_args )
>               {
> -                int i;
> +                u32 i;
>   
>                   WARN_ON(count > MAX_PHANDLE_ARGS);
>                   if (count > MAX_PHANDLE_ARGS)

Cheers,

-- 
Julien Grall

