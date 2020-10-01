Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E4A27FD3C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 12:23:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1176.3889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNvkQ-0005l4-6v; Thu, 01 Oct 2020 10:23:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176.3889; Thu, 01 Oct 2020 10:23:38 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNvkQ-0005kf-3d; Thu, 01 Oct 2020 10:23:38 +0000
Received: by outflank-mailman (input) for mailman id 1176;
 Thu, 01 Oct 2020 10:23:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bOcq=DI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNvkO-0005ka-6Y
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:23:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a095e3c1-577d-43aa-bb6c-fb77c3437125;
 Thu, 01 Oct 2020 10:23:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6848BAC2F;
 Thu,  1 Oct 2020 10:23:33 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bOcq=DI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNvkO-0005ka-6Y
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:23:36 +0000
X-Inumbo-ID: a095e3c1-577d-43aa-bb6c-fb77c3437125
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a095e3c1-577d-43aa-bb6c-fb77c3437125;
	Thu, 01 Oct 2020 10:23:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601547813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0XKbdNlXp2ozLMoGydc/k1xhOaAQYLPePup+XqkVwjo=;
	b=tj7IaousHeu17VcXsmkFV86bDCBgpdXFeBxWYQeQwkqm1gPsCfmN1glwyxSGkYrxjO79+O
	0WcAOgZyuvye7ba44mIgRTZXfmSReuebQTtxecg97ZaNPvrauxoovBAyMl45QcBE4IT1fA
	CR/lH35g/9olbY8+NWDMgvnSs8dPZnU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6848BAC2F;
	Thu,  1 Oct 2020 10:23:33 +0000 (UTC)
Subject: Re: [PATCH 3/8] xen/domctl: Introduce and use
 XEN_DOMCTL_CDF_nested_virt
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 Rob Hoes <Rob.Hoes@citrix.com>
References: <20200930134248.4918-1-andrew.cooper3@citrix.com>
 <20200930134248.4918-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <32a955ad-9995-6df2-3d7b-6b3eb7b1d656@suse.com>
Date: Thu, 1 Oct 2020 12:23:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200930134248.4918-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.09.2020 15:42, Andrew Cooper wrote:
> @@ -667,6 +668,12 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>           */
>          config->flags |= XEN_DOMCTL_CDF_oos_off;
>  
> +    if ( nested_virt && !hap )
> +    {
> +        dprintk(XENLOG_INFO, "Nested virt not supported without HAP\n");
> +        return -EINVAL;
> +    }

Initially I was merely puzzled by this not being accompanied by
any removal of code elsewhere. But when I started looking I couldn't
find any such enforcement, but e.g. did find nsvm_vcpu_hostrestore()
covering the shadow mode case. For this to be "No functional change
yet" as the description claims, could you point me at where this
restriction is currently enforced?

Jan

