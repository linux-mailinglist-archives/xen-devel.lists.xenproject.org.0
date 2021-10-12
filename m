Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A989742A34A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 13:29:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207121.362864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maFxc-0000Y4-OD; Tue, 12 Oct 2021 11:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207121.362864; Tue, 12 Oct 2021 11:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maFxc-0000WE-Kw; Tue, 12 Oct 2021 11:28:44 +0000
Received: by outflank-mailman (input) for mailman id 207121;
 Tue, 12 Oct 2021 11:28:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P4MT=PA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1maFxb-0000W8-TQ
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 11:28:43 +0000
Received: from mail-lf1-x12f.google.com (unknown [2a00:1450:4864:20::12f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed2dff2d-0ca7-470f-9229-f74c6e40ae8e;
 Tue, 12 Oct 2021 11:28:42 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id y15so86438037lfk.7
 for <xen-devel@lists.xenproject.org>; Tue, 12 Oct 2021 04:28:42 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id m7sm411639lfp.267.2021.10.12.04.28.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 04:28:40 -0700 (PDT)
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
X-Inumbo-ID: ed2dff2d-0ca7-470f-9229-f74c6e40ae8e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=GizbPFZSmmKg7ldAcUWwq8rUYFgjC85kABZ+tHbiFhE=;
        b=VVcOFNK+qVSNCqICDk856pBQr1TB8EeNUL4Pcc+TGL/ZRFU1PXHxmzJs5nSWc6hbhy
         VExZM8Eo9NUXaI7TD5//hsUf63IEd0Sz/ImlyWMCgaY1aC2nKa/uuSW+zXKrgqUtBKYC
         nlcSIw99zQ7G7tiRtWgYVdJUCeg/X4mSoOzzi+jKVObvS7WLNavDBdK5EgbNt2MmVlaA
         My51nVEHsr2irXLATEsXg2id+N+TahebJ0VREc4UFEqT2iwCCFfSCvKSdeiXYYLfoZIo
         Jt/YwzbDThrD101+k+MU5uY4PnvL9R0df07g1IG/YG8gD6MghlekfNLSnWJftO44AXGB
         RD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=GizbPFZSmmKg7ldAcUWwq8rUYFgjC85kABZ+tHbiFhE=;
        b=R9UieBUK9cRLBNHBHIiGtosTsSZ3mxNbBi1hsiBTt9l5DDj51zGrbL1IQAOeFsECEj
         AI/U1d8uMVspZ3h5wB2uOmivwhKSFQ9V1bfELivpI1fhEek6FihQS0GEWOJCKNL77olo
         UbTE8YdB5SHbXuMy6einGQ+yoiniBdfVJt4tyk4WrBL52ZL7NKQy+qu916qZXQxzeM+b
         3qOhiWf3cKc2dD7yqKzzAG8SmaZ9nmWWbdqVNlS1AtMq/0LqMERQRqTLiknblIa7xUSC
         Vko+azVxlsxxJa7V4fB8/IC1rDPHz7A1buSY3DctmHDHfiod/0fqmYOqVUyX9fhWbxNc
         vIIg==
X-Gm-Message-State: AOAM532ap0F0/9gphFTikx0MmFVqqx6qT+P+NTGvvv5Hs67Gx4bD4tPu
	DgqawGQcXWaSbGzNeHzGxXhg3LRd8ag=
X-Google-Smtp-Source: ABdhPJxU4fhbrFAWPwry9gKeASVMd7RN0Ffk3pItBzcRtJnWCV3BmfU1yYbhhdpbmY8dbU7wLvDGCQ==
X-Received: by 2002:a05:651c:b23:: with SMTP id b35mr28179082ljr.166.1634038120881;
        Tue, 12 Oct 2021 04:28:40 -0700 (PDT)
Subject: Re: [PATCH V6 1/2] xen/arm: Introduce gpaddr_bits field to struct
 xen_domctl_getdomaininfo
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <1633974539-7380-1-git-send-email-olekstysh@gmail.com>
 <1633974539-7380-2-git-send-email-olekstysh@gmail.com>
 <1466e946-d247-2380-6d7d-cda405a2f255@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <68213f79-2cbc-e0cf-3181-bc487f0a5eff@gmail.com>
Date: Tue, 12 Oct 2021 14:28:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1466e946-d247-2380-6d7d-cda405a2f255@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 12.10.21 12:24, Jan Beulich wrote:

Hi Jan

Thank you for thorough review.

> On 11.10.2021 19:48, Oleksandr Tyshchenko wrote:
>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -38,7 +38,7 @@
>>   #include "hvm/save.h"
>>   #include "memory.h"
>>   
>> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000014
>> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000015
> So this bump would not have been needed if the rule of making padding
> fields explicit in the public interface had been followed by earlier
> changes, as you could have fit the 8-bit field in the 16-bit gap
> after domid.
>
> Furthermore this bump is only going to be necessary if your patch
> doesn't make 4.16. 4.15 uses 0x13 here, i.e. a bump has already
> occurred in this release cycle.

I got it, will remove the bumping.


>
> Otoh, because of the re-use of the struct in a sysctl, you do need
> to bump XEN_SYSCTL_INTERFACE_VERSION here (unless you fit the new
> field in the existing padding slot, which for the sysctl has been
> guaranteed to be zero; see also below).

Oops, indeed, will bump.


>
>> @@ -150,6 +150,7 @@ struct xen_domctl_getdomaininfo {
>>       uint32_t ssidref;
>>       xen_domain_handle_t handle;
>>       uint32_t cpupool;
>> +    uint8_t gpaddr_bits; /* Guest physical address space size. */
>>       struct xen_arch_domainconfig arch_config;
> On the basis of the above, please add uint8_t pad[3] (or perhaps
> better pad[7] to be independent of the present
> alignof(struct xen_arch_domainconfig) == 4) and make sure the
> array will always be zero-filled, such that the padding space can
> subsequently be assigned a purpose without needing to bump the
> interface version(s) again.

ok, will do.


>
> Right now the sysctl caller of getdomaininfo() clears the full
> structure (albeit only once, so stale / inapplicable data might get
> reported for higher numbered domains if any field was filled only
> in certain cases), while the domctl one doesn't. Maybe it would be
> best looking forward if the domctl path also cleared the full buffer
> up front, or if the clearing was moved into the function. (In the
> latter case some writes of zeros into the struct could be eliminated
> in return.)

Well, I would be OK either way, with a little preference for the latter.

Is it close to what you meant?


diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 46a0c8a..9bca133 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -69,10 +69,10 @@ void getdomaininfo(struct domain *d, struct 
xen_domctl_getdomaininfo *info)
      int flags = XEN_DOMINF_blocked;
      struct vcpu_runstate_info runstate;

+    memset(info, 0, sizeof(*info));
+
      info->domain = d->domain_id;
      info->max_vcpu_id = XEN_INVALID_MAX_VCPU_ID;
-    info->nr_online_vcpus = 0;
-    info->ssidref = 0;

      /*
       * - domain is marked as blocked only if all its vcpus are blocked
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 3558641..a7ab95d 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -76,7 +76,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) 
u_sysctl)
      case XEN_SYSCTL_getdomaininfolist:
      {
          struct domain *d;
-        struct xen_domctl_getdomaininfo info = { 0 };
+        struct xen_domctl_getdomaininfo info;
          u32 num_domains = 0;

          rcu_read_lock(&domlist_read_lock);


>
> Perhaps, once properly first zero-filling the struct in all cases,
> the padding field near the start should also be made explicit,
> clarifying visually that it is an option to use the space there for
> something that makes sense to live early in the struct (i.e. I
> wouldn't necessarily recommend putting there the new field you add,
> albeit - as mentioned near the top - that's certainly an option).

I read this as a request to also add uint16_t pad after "domid_t domain" 
at least. Correct?


>
> Jan
>
-- 
Regards,

Oleksandr Tyshchenko


