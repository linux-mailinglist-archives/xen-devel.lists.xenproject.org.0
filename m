Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B449E2556C9
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 10:45:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBa0y-0002iM-RS; Fri, 28 Aug 2020 08:45:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8pf4=CG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kBa0x-0002iH-HZ
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 08:45:39 +0000
X-Inumbo-ID: dc72f9a1-3340-4c9f-a900-5729be04c880
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc72f9a1-3340-4c9f-a900-5729be04c880;
 Fri, 28 Aug 2020 08:45:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A95D6AC37;
 Fri, 28 Aug 2020 08:46:10 +0000 (UTC)
Subject: Re: [PATCH v2 6/8] x86/pv: disallow access to unknown MSRs
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20200820150835.27440-1-roger.pau@citrix.com>
 <20200820150835.27440-7-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f1d4b0f2-9e00-e1d1-71cf-aacff2bcc186@suse.com>
Date: Fri, 28 Aug 2020 10:45:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200820150835.27440-7-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.08.2020 17:08, Roger Pau Monne wrote:
> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -972,9 +972,10 @@ static int read_msr(unsigned int reg, uint64_t *val,
>          }
>          /* fall through */
>      default:
> +        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);
> +        break;
> +
>      normal:
> -        /* Everyone can read the MSR space. */
> -        /* gdprintk(XENLOG_WARNING, "Domain attempted RDMSR %08x\n", reg); */
>          if ( rdmsr_safe(reg, *val) )
>              break;
>          return X86EMUL_OKAY;
> @@ -1141,14 +1142,15 @@ static int write_msr(unsigned int reg, uint64_t val,
>          }
>          /* fall through */
>      default:
> -        if ( rdmsr_safe(reg, temp) )
> -            break;
> +        gdprintk(XENLOG_WARNING,
> +                 "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
> +                 reg, val);
> +        break;
>  
> -        if ( val != temp )
>      invalid:
> -            gdprintk(XENLOG_WARNING,
> -                     "Domain attempted WRMSR %08x from 0x%016"PRIx64" to 0x%016"PRIx64"\n",
> -                     reg, temp, val);
> +        gdprintk(XENLOG_WARNING,
> +                 "Domain attempted WRMSR %08x from 0x%016"PRIx64" to 0x%016"PRIx64"\n",
> +                 reg, temp, val);
>          return X86EMUL_OKAY;
>      }

There some odd mix of whether or no 0x prefixes get logged. I'd
advocate for dropping all of them, but imo at the very least all
three messages should be consistent in this regard.

Jan

