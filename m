Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D1541BEF3
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 08:07:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198613.352183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVSk8-0001ki-32; Wed, 29 Sep 2021 06:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198613.352183; Wed, 29 Sep 2021 06:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVSk7-0001ik-W9; Wed, 29 Sep 2021 06:06:59 +0000
Received: by outflank-mailman (input) for mailman id 198613;
 Wed, 29 Sep 2021 06:06:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=arYX=OT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mVSk6-0001ic-6C
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 06:06:58 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7374e0a6-20eb-11ec-bcde-12813bfff9fa;
 Wed, 29 Sep 2021 06:06:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6F422613CD;
 Wed, 29 Sep 2021 06:06:56 +0000 (UTC)
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
X-Inumbo-ID: 7374e0a6-20eb-11ec-bcde-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632895616;
	bh=WDCuyF8HnhujNqB8M39oQRzxnY7gu7he4k0+FNDp5vQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=R92ZdSeHN7R+LPwpLesX5enwZh9lWhV2619w3Rx0ILTsnePXyXNWzMRt5aRTi5fb4
	 Sih69sRklSVZOZV0/+EeU7Xlnz6rxf5LxhTtniqq+UJuo2WXlelJrdmjhV1HlEy/AN
	 dcy7AQiPF1eYjAKtVtHOoobUGUqj0wyjBq/WpbAAVZ5cxpb9YmrCehbomwW6rMVzcG
	 XwQTAXjJKkkOS1/I4aRPhnHBGpjIcYTHSzkVZL/BOWD6SGm8zp+5KzEG+AovM9FJmK
	 wXN97uXRu8jQRObrMVAq3dR5wa0P9qHr1YH7ZX+EKjKaiG0ovBt7cswuenQ/KFxAoh
	 qsAZwwFJiE2Tg==
Date: Tue, 28 Sep 2021 23:06:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Andre.Przywara@arm.com, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 06/17] xen/device-tree: Add dt_property_read_variable_u32_array
 helper
In-Reply-To: <9dba5f3457d9ead9084ac73297bf5a65e665a8d9.1632847120.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109281615260.5022@sstabellini-ThinkPad-T480s>
References: <cover.1632847120.git.rahul.singh@arm.com> <9dba5f3457d9ead9084ac73297bf5a65e665a8d9.1632847120.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Sep 2021, Rahul Singh wrote:
> Based Linux commit a67e9472da423ec47a3586920b526ebaedf25fc3
> 
> Import the Linux helper of_property_read_variable_u32_array. This
> function find and read an array of 32 bit integers from a property,
> with bounds on the minimum and maximum array size.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Change in v3:
> - Modify commit message to include upstream Linux commit-id not stable 
>   Linux commit-id
> Change in v2: Patch introduced in v2
> ---
>  xen/common/device_tree.c      | 61 +++++++++++++++++++++++++++++++++++
>  xen/include/xen/device_tree.h | 26 +++++++++++++++
>  2 files changed, 87 insertions(+)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 03d25a81ce..53160d61f8 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -208,6 +208,67 @@ int dt_property_read_string(const struct dt_device_node *np,
>      return 0;
>  }
>  
> +/**
> + * dt_find_property_value_of_size
> + *
> + * @np:     device node from which the property value is to be read.
> + * @propname:   name of the property to be searched.
> + * @min:    minimum allowed length of property value
> + * @max:    maximum allowed length of property value (0 means unlimited)
> + * @len:    if !=NULL, actual length is written to here
> + *
> + * Search for a property in a device node and valid the requested size.
> + *
> + * Return: The property value on success, -EINVAL if the property does not
> + * exist, -ENODATA if property does not have a value, and -EOVERFLOW if the
> + * property data is too small or too large.
> + */
> +static void *dt_find_property_value_of_size(const struct dt_device_node *np,
> +                                            const char *propname, u32 min,
> +                                            u32 max, size_t *len)
> +{
> +    const struct dt_property *prop = dt_find_property(np, propname, NULL);
> +
> +    if ( !prop )
> +        return ERR_PTR(-EINVAL);
> +    if ( !prop->value )
> +        return ERR_PTR(-ENODATA);
> +    if ( prop->length < min )
> +        return ERR_PTR(-EOVERFLOW);
> +    if ( max && prop->length > max )
> +        return ERR_PTR(-EOVERFLOW);
> +
> +    if ( len )
> +        *len = prop->length;
> +
> +    return prop->value;
> +}
> +
> +int dt_property_read_variable_u32_array(const struct dt_device_node *np,
> +                                        const char *propname, u32 *out_values,
> +                                        size_t sz_min, size_t sz_max)
> +{
> +    size_t sz, count;
> +    const __be32 *val = dt_find_property_value_of_size(np, propname,
> +                        (sz_min * sizeof(*out_values)),
> +                        (sz_max * sizeof(*out_values)),
> +                        &sz);
> +
> +    if ( IS_ERR(val) )
> +        return PTR_ERR(val);
> +
> +    if ( !sz_max )
> +        sz = sz_min;
> +    else
> +        sz /= sizeof(*out_values);
> +
> +    count = sz;
> +    while ( count-- )
> +        *out_values++ = be32_to_cpup(val++);
> +
> +    return sz;
> +}
> +
>  int dt_property_match_string(const struct dt_device_node *np,
>                               const char *propname, const char *string)
>  {
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index b02696be94..1693fb8e8c 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -366,6 +366,32 @@ bool_t dt_property_read_u32(const struct dt_device_node *np,
>  bool_t dt_property_read_u64(const struct dt_device_node *np,
>                              const char *name, u64 *out_value);
>  
> +
> +/**
> + * dt_property_read_variable_u32_array - Find and read an array of 32 bit
> + * integers from a property, with bounds on the minimum and maximum array size.
> + *
> + * @np:     device node from which the property value is to be read.
> + * @propname:   name of the property to be searched.
> + * @out_values: pointer to return found values.
> + * @sz_min: minimum number of array elements to read
> + * @sz_max: maximum number of array elements to read, if zero there is no
> + *      upper limit on the number of elements in the dts entry but only
> + *      sz_min will be read.
> + *
> + * Search for a property in a device node and read 32-bit value(s) from
> + * it.
> + *
> + * Return: The number of elements read on success, -EINVAL if the property
> + * does not exist, -ENODATA if property does not have a value, and -EOVERFLOW
> + * if the property data is smaller than sz_min or longer than sz_max.
> + *
> + * The out_values is modified only if a valid u32 value can be decoded.
> + */
> +int dt_property_read_variable_u32_array(const struct dt_device_node *np,
> +                                        const char *propname, u32 *out_values,
> +                                        size_t sz_min, size_t sz_max);
> +
>  /**
>   * dt_property_read_bool - Check if a property exists
>   * @np: node to get the value
> -- 
> 2.17.1
> 

