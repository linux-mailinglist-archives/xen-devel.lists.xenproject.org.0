Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8699A2D6D7F
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 02:28:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50017.88480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knXEj-0005tc-B2; Fri, 11 Dec 2020 01:28:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50017.88480; Fri, 11 Dec 2020 01:28:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knXEj-0005t8-6j; Fri, 11 Dec 2020 01:28:45 +0000
Received: by outflank-mailman (input) for mailman id 50017;
 Fri, 11 Dec 2020 01:28:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZKjA=FP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1knXEg-0005re-TZ
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 01:28:42 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3dd4e877-3809-4696-903b-622b26cbd75d;
 Fri, 11 Dec 2020 01:28:42 +0000 (UTC)
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
X-Inumbo-ID: 3dd4e877-3809-4696-903b-622b26cbd75d
Date: Thu, 10 Dec 2020 17:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607650121;
	bh=HNKm2imjIECPStxL3ltFy0qN4phKaqzK0QgnjM0azy4=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=gPWatTZxt0e/qhfCDVAmtEiq9dVUVZ3fgClsFESsuHnu84eMzojkAb0nH3XgzgIFt
	 GHX/UvsafWeUTL3AVw4oOf9p4EDFp1So8joeh1tS832wKG0h9U63P7RdWQgwmWht2l
	 HC3EX+MsGE7lYsDaIAyrfFBnDrkYDTOFjFqu2GuuPiHhbCV/jEuR7k1ScgkOTEqjy0
	 msUspCxoL9eNx7y44xQFfyVg6HzZWBTAqC7J1Km0BFgbOWmZZ08RN0P/M5yuGjMKOc
	 uCGjxTwA7MbLPTUZ3CLxgKou4+kPN33d6+a5hMreeMoxpjkqPzjw27zasZvzu9Y3qv
	 Mfr5wWLoyxk9g==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 5/8] xen/device-tree: Add dt_property_match_string
 helper
In-Reply-To: <2cf4c10d0ce81290af96e29ee364df87c06ef849.1607617848.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2012101539570.6285@sstabellini-ThinkPad-T480s>
References: <cover.1607617848.git.rahul.singh@arm.com> <2cf4c10d0ce81290af96e29ee364df87c06ef849.1607617848.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Dec 2020, Rahul Singh wrote:
> Import the Linux helper of_property_match_string. This function searches
> a string list property and returns the index of a specific string value.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v3:
>  - This patch is introduce in this verison.
> 
> ---
>  xen/common/device_tree.c      | 27 +++++++++++++++++++++++++++
>  xen/include/xen/device_tree.h | 12 ++++++++++++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index e107c6f89f..18825e333e 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -208,6 +208,33 @@ int dt_property_read_string(const struct dt_device_node *np,
>      return 0;
>  }
>  
> +int dt_property_match_string(const struct dt_device_node *np,
> +                             const char *propname, const char *string)
> +{
> +    const struct dt_property *dtprop = dt_find_property(np, propname, NULL);
> +    size_t l;
> +    int i;
> +    const char *p, *end;
> +
> +    if ( !dtprop )
> +        return -EINVAL;
> +    if ( !dtprop->value )
> +        return -ENODATA;
> +
> +    p = dtprop->value;
> +    end = p + dtprop->length;
> +
> +    for ( i = 0; p < end; i++, p += l )
> +    {
> +        l = strnlen(p, end - p) + 1;
> +        if ( p + l > end )
> +            return -EILSEQ;
> +        if ( strcmp(string, p) == 0 )
> +            return i; /* Found it; return index */
> +    }
> +    return -ENODATA;
> +}
> +
>  bool_t dt_device_is_compatible(const struct dt_device_node *device,
>                                 const char *compat)
>  {
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index f2ad22b79c..b02696be94 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -400,6 +400,18 @@ static inline bool_t dt_property_read_bool(const struct dt_device_node *np,
>  int dt_property_read_string(const struct dt_device_node *np,
>                              const char *propname, const char **out_string);
>  
> +/**
> + * dt_property_match_string() - Find string in a list and return index
> + * @np: pointer to node containing string list property
> + * @propname: string list property name
> + * @string: pointer to string to search for in string list
> + *
> + * This function searches a string list property and returns the index
> + * of a specific string value.
> + */
> +int dt_property_match_string(const struct dt_device_node *np,
> +                             const char *propname, const char *string);
> +
>  /**
>   * Checks if the given "compat" string matches one of the strings in
>   * the device's "compatible" property
> -- 
> 2.17.1
> 

