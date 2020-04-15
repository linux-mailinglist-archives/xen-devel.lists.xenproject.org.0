Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 577C21A9BBF
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 13:08:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOfty-0006Pj-14; Wed, 15 Apr 2020 11:08:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoJL=57=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOftw-0006Pe-4w
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 11:08:16 +0000
X-Inumbo-ID: 670afda8-7f09-11ea-8a30-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 670afda8-7f09-11ea-8a30-12813bfff9fa;
 Wed, 15 Apr 2020 11:08:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3CC19AC69;
 Wed, 15 Apr 2020 11:08:13 +0000 (UTC)
Subject: Re: [PATCH V8] x86/altp2m: Hypercall to set altp2m view visibility
To: Alexandru Isaila <aisaila@bitdefender.com>
References: <20200413065113.27744-1-aisaila@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <406e5d6e-5dd1-d15a-377b-71e3da83f90b@suse.com>
Date: Wed, 15 Apr 2020 13:08:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200413065113.27744-1-aisaila@bitdefender.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 13.04.2020 08:51, Alexandru Isaila wrote:
> @@ -4786,6 +4787,19 @@ static int do_altp2m_op(
>          break;
>      }
>  
> +    case HVMOP_altp2m_set_visibility:
> +    {
> +        unsigned int idx = a.u.set_visibility.altp2m_idx;
> +
> +        if ( a.u.set_visibility.pad )
> +            rc = -EINVAL;
> +        else if ( !altp2m_active(d) )
> +            rc = -EOPNOTSUPP;
> +        else
> +            rc = p2m_set_altp2m_view_visibility(d, idx,
> +                                                a.u.set_visibility.visible);
> +    }
> +
>      default:
>          ASSERT_UNREACHABLE();
>      }

Coverity points out that there's a break statement missing here.
Which makes me wonder how you would have successfully tested this
on a debug build. Please submit a fix (Coverity ID: 1461759).

Jan

