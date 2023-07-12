Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDED750B1A
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 16:34:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562575.879318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJavP-0000la-1w; Wed, 12 Jul 2023 14:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562575.879318; Wed, 12 Jul 2023 14:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJavO-0000jE-VJ; Wed, 12 Jul 2023 14:34:38 +0000
Received: by outflank-mailman (input) for mailman id 562575;
 Wed, 12 Jul 2023 14:34:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R8Q3=C6=citrix.com=prvs=550b2c143=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qJavN-0000j8-Az
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 14:34:37 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37ce9924-20c1-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 16:34:35 +0200 (CEST)
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
X-Inumbo-ID: 37ce9924-20c1-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689172475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LG9LqQMdV6J2PUCymKn3Aox/gbkTEDTWztzIR4DCS/E=;
  b=OsT6C5pBggjfprhx1cq9gzMZ6L9FvHd7C5CReHbujskU/V4FoKYV7Gdu
   uX7caFkL1pOOIurA6yKWBDXCw4lyviSD0BOD+gO+pYnqU/OFYW1NfPPVy
   bfXV8Jy7uRuuQ9sDX3Y5+TJsvHuCgxXVYDdmoDoE7/+PUX2hfhxc5s+xj
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 114690188
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:1Whm7aD3HtDf8xVW/zzjw5YqxClBgxIJ4kV8jS/XYbTApDIkgTQBy
 WYeCGyBa/uONmameNB2Po7gp0JUvsDcyd5kQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GxB5ARkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwpPsnIEFH6
 KEhBG4qQg2BrLrn+IywRbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4XWG5QNxxbIz
 o7A10PXOAEYOZux8jum9V6xpemRjRP/CLtHQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFabujYMVtwWFPc1gCmPxbDT+B2xHXUfQ3hKb9lOnMYuSCYjz
 FOhg9LjDjspu7qQIU9x7Z/N82n0Y3JMazZfO2ldF1BtD8TfTJ8b0A+fb/ZqDfOMooPSNSzy6
 GjblBY1iOBG5SIU7JlX7Wwrkhr1+MiYF1Jqt1mHNo62xlgnPdD4PuRE/XCetK8dd9jBEzFtq
 VBew6CjAPYy4YZhfcBnaMEEB/mX6vmMK1UwanY/TsB6p1xBF5NOFL28AQ2Sx28zaK7ogRezP
 CfuVfp5vfe/xkeCY65teJ6WAM8316XmHtmNfqmKPosXOsAsLFHbpnEGiausM4fFyRhErE3CE
 c3DLZbE4YgyVMyLMwZat89CiOR2l0jSNEvYRIzhzgTP7FZtTCf9dFvxC3PXNrpRxPrd8G3oH
 yN3a5PiJ+N3DLevPUE6MOc7cTg3EJTMLcqu8ZcIK7HffVUO9aNII6a5/I7NsrdNx8x9/tokN
 FnkMqOE4DITXUH6FDg=
IronPort-HdrOrdr: A9a23:5rn3V622SldIw3nNjupOKAqjBJkkLtp133Aq2lEZdPU1SL38qy
 nKpp536faaslossR0b9uxoQZPwOE80lqQFg7X5X43DYOCOggLBEGgF1+XfKlbbak7DH4BmtJ
 uIRJIObOEYXWIQsS8j2njCLz/7+qjgzEl0v5a4856wd3ATV0i/1XYCNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3A+dTrdmoG27WBjb0WqvNo55bmUZ44Ilz9xWqNGmP?=
 =?us-ascii?q?mLkp0SpbNGGeu86wxxg=3D=3D?=
X-Talos-MUID: 9a23:POLyrghEAvOsUpK6q5Y1K8MpE+lS86ajT242kLYBl9SnM3JgCzPNtWHi
X-IronPort-AV: E=Sophos;i="6.01,199,1684814400"; 
   d="scan'208";a="114690188"
Date: Wed, 12 Jul 2023 15:34:23 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH v2 1/6] libs/guest: introduce support for setting guest
 MSRs
Message-ID: <45c89e03-fe3d-43f0-9f2b-de11ae4fd539@perard>
References: <20230711092230.15408-1-roger.pau@citrix.com>
 <20230711092230.15408-2-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230711092230.15408-2-roger.pau@citrix.com>

On Tue, Jul 11, 2023 at 11:22:25AM +0200, Roger Pau Monne wrote:
> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
> index 5b035223f4f5..5e5c8124dd74 100644
> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> +static int xc_msr_policy(xc_interface *xch, domid_t domid,
> +                         const struct xc_msr *msr)
> +{
[...]
> +
> +    rc = -ENOMEM;

This `rc' value looks unused, should it be moved to the if true block?

> +    if ( (host = calloc(nr_msrs, sizeof(*host))) == NULL ||
> +         (def  = calloc(nr_msrs, sizeof(*def)))  == NULL ||
> +         (cur  = calloc(nr_msrs, sizeof(*cur)))  == NULL )
> +    {
> +        ERROR("Unable to allocate memory for %u CPUID leaves", nr_leaves);
> +        goto fail;
> +    }
> +
> +    /* Get the domain's current policy. */
> +    nr_leaves = 0;
> +    nr_cur = nr_msrs;
> +    rc = get_domain_cpu_policy(xch, domid, &nr_leaves, NULL, &nr_cur, cur);
[...]
> +    for ( ; msr->index != XC_MSR_INPUT_UNUSED; ++msr )
> +    {
> +        xen_msr_entry_t *cur_msr = find_msr(cur, nr_cur, msr->index);
> +        const xen_msr_entry_t *def_msr = find_msr(def, nr_def, msr->index);
> +        const xen_msr_entry_t *host_msr = find_msr(host, nr_host, msr->index);
> +        unsigned int i;
> +
> +        if ( cur_msr == NULL || def_msr == NULL || host_msr == NULL )
> +        {
> +            ERROR("Missing MSR %#x", msr->index);
> +            rc = -ENOENT;
> +            goto fail;
> +        }
> +
> +        for ( i = 0; i < ARRAY_SIZE(msr->policy) - 1; i++ )
> +        {
> +            bool val;
> +
> +            if ( msr->policy[i] == '1' )
> +                val = true;
> +            else if ( msr->policy[i] == '0' )
> +                val = false;
> +            else if ( msr->policy[i] == 'x' )
> +                val = test_bit(63 - i, &def_msr->val);
> +            else if ( msr->policy[i] == 'k' )
> +                val = test_bit(63 - i, &host_msr->val);
> +            else
> +            {
> +                ERROR("Bad character '%c' in policy string '%s'",
> +                      msr->policy[i], msr->policy);

Would it be useful to also display msr->index?

> +                rc = -EINVAL;
> +                goto fail;
> +            }
> +
> +            clear_bit(63 - i, &cur_msr->val);
> +            if ( val )
> +                set_bit(63 - i, &cur_msr->val);

Does this need to be first clear then set? A opposed to just do one or
the other.

> +        }
> +    }
> +
> +    /* Feed the transformed policy back up to Xen. */
> +    rc = xc_set_domain_cpu_policy(xch, domid, 0, NULL, nr_cur, cur,
> +                                  &err_leaf, &err_subleaf, &err_msr);
> +    if ( rc )
> +    {
> +        PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, msr %#x)",
> +               domid, err_leaf, err_subleaf, err_msr);
> +        rc = -errno;
> +        goto fail;
> +    }
> +
> +    /* Success! */
> +
> + fail:

Even if this label is only used on "fail", the code path is also use on
success. So a label named "out" might be more appropriate.

> +    free(cur);
> +    free(def);
> +    free(host);
> +
> +    return rc;
> +}
> +

In any case, patch looks fine to me:
Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

