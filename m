Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BC4192A78
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 14:55:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH6Ri-0004uv-Mb; Wed, 25 Mar 2020 13:51:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=grKZ=5K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jH6Rh-0004tp-An
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 13:51:49 +0000
X-Inumbo-ID: c587b54e-6e9f-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c587b54e-6e9f-11ea-b34e-bc764e2007e4;
 Wed, 25 Mar 2020 13:51:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8D113AD48;
 Wed, 25 Mar 2020 13:51:47 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200323101724.15655-1-andrew.cooper3@citrix.com>
 <20200323101724.15655-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d37aeda3-8eea-db72-51ae-f154dd3aa944@suse.com>
Date: Wed, 25 Mar 2020 14:51:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200323101724.15655-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH 5/7] x86/ucode/intel: Clean up
 microcode_update_match()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23.03.2020 11:17, Andrew Cooper wrote:
> Implement a new get_ext_sigtable() helper to abstract the logic for
> identifying whether an extended signature table exists.  As part of this,
> rename microcode_intel.bits to data and change its type so it can be usefully
> used in combination with the datasize header field.
> 
> Also, replace the sigmatch() macro with a static inline with a more useful
> API, and an explanation of why it is safe to drop one of the previous
> conditionals.
> 
> No practical change in behaviour.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/cpu/microcode/intel.c | 75 +++++++++++++++++++++++++-------------
>  1 file changed, 49 insertions(+), 26 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
> index dfe44679be..bc3bbf139e 100644
> --- a/xen/arch/x86/cpu/microcode/intel.c
> +++ b/xen/arch/x86/cpu/microcode/intel.c
> @@ -61,7 +61,7 @@ struct microcode_header_intel {
>  
>  struct microcode_intel {
>      struct microcode_header_intel hdr;
> -    unsigned int bits[0];
> +    uint8_t data[];
>  };
>  
>  /* microcode format is extended from prescott processors */
> @@ -98,8 +98,41 @@ static uint32_t get_totalsize(const struct microcode_header_intel *hdr)
>      return hdr->_totalsize ?: PPRO_UCODE_DATASIZE + MC_HEADER_SIZE;
>  }
>  
> -#define sigmatch(s1, s2, p1, p2) \
> -        (((s1) == (s2)) && (((p1) & (p2)) || (((p1) == 0) && ((p2) == 0))))
> +/*
> + * A piece of microcode has an extended signature table if there is space
> + * between the end of data[] and the total size.  (This logic also works
> + * appropriately for Pentium Pro/II microcode, which has 0 for both size
> + * fields, and no extended signature table.)
> + */
> +static const struct extended_sigtable *get_ext_sigtable(
> +    const struct microcode_intel *mc)
> +{
> +    if ( mc->hdr._totalsize > (MC_HEADER_SIZE + mc->hdr._datasize) )
> +        return (void *)&mc->data[mc->hdr._datasize];
> +
> +    return NULL;
> +}
> +
> +/*
> + * A piece of microcode is applicable for a CPU if:
> + *  1) the signatures (CPUID.1.EAX - Family/Model/Stepping) match, and
> + *  2) The Platform Flags bitmap intersect.
> + *
> + * A CPU will have a single Platform Flag bit, while the microcode may be
> + * common to multiple platforms and have multiple bits set.
> + *
> + * Note: The Pentium Pro/II microcode didn't use platform flags, and should
> + * treat 0 as a match.  However, Xen being 64bit means that the cpu signature
> + * won't match, allowing us to simplify the logic.
> + */
> +static bool signature_maches(const struct cpu_signature *cpu_sig,
> +                             unsigned int ucode_sig, unsigned int ucode_pf)

I guess you've lost a 't' here and really mean signature_matches()?
If so with this taken care of
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

