Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 474E7BA9D1E
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 17:42:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132991.1471189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3G0V-0000QQ-Li; Mon, 29 Sep 2025 15:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132991.1471189; Mon, 29 Sep 2025 15:41:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3G0V-0000NX-Ho; Mon, 29 Sep 2025 15:41:43 +0000
Received: by outflank-mailman (input) for mailman id 1132991;
 Mon, 29 Sep 2025 15:41:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M4Dr=4I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v3G0T-0000NR-VA
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 15:41:42 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9eeb587-9d4a-11f0-9809-7dc792cee155;
 Mon, 29 Sep 2025 17:41:39 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b0418f6fc27so685986766b.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 08:41:39 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-67-38.play-internet.pl.
 [109.243.67.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353e5d168dsm970071066b.4.2025.09.29.08.41.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 08:41:37 -0700 (PDT)
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
X-Inumbo-ID: c9eeb587-9d4a-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759160498; x=1759765298; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJJjl9X4f5zstmqMmUJl4SeXx33I5cLkKaLg7u6XmcU=;
        b=QdCHsIxolSMkQGZsIGY0WVB24b+fQTLI6u2htEKI/gvWUvsiD3ekt0XAAuFkFj/flA
         hSm9FNu32PSxF/wnmloW9mam9TIEQLHb//pPZztWwCTJlSqma6BXhfiale9PodVt24Nx
         akUvvC+V4nI7nUUQ/GPKPPnCuaxEACk4Xm4/43oWZrI1oV65drwcDVWvgvgXU90hpj6s
         ZrahgccX2h7Noyxmv1MqOvmc0nTKGgc068N8J8KAu+EJ6dMeiq888y3+rvBbdI7920cx
         kDlo6HX+6dxVmAF+xgdoyULsl8VDflkT5BHcbdjAv+phS7QxoQn5iMm2ZRr5+k5CpvRT
         szQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759160498; x=1759765298;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JJJjl9X4f5zstmqMmUJl4SeXx33I5cLkKaLg7u6XmcU=;
        b=TYlEP8k+29FTc288YwSG5WrfHeankr7TX1+ipr0Bq3xohjDDGYxDxUlUEPd7FIr20u
         IU96mwxygfx0gYr3Mhg5K7XaIZsXjBIOvz95+ZzhRPqKcyZ04+/fODmY0C2DUa9SXxh8
         82UukT1gBXTFjJTNDoMMRWcdyyr2w+IApPtJji1Xg7S3EJ0jMo6XuRKWCoyScNm+j6zr
         J1iBDm/rPtVnGXeknIibkI01PjkZGMVHJBEA+j5v4WZhXy4KJbTPcd2mb3hvITPOg9JD
         ovq9gGjtkSb93dxZ6qDiEodieQXQHCB0D7wJiHw1QBeyqvDEcxDpraitPqvT/O2hlSCJ
         nXow==
X-Forwarded-Encrypted: i=1; AJvYcCVcuvq0FBrujbXBR3r1h5TikFBH6P8NY7HpdvmUz0qHGQGjnD4DfskLkWuRtwzChXoH4Prf96XIjDo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0b6xpNzBDoovwqpUaR/h2QJ+e+JCtbBE9S+ZHgjLLckbVdFWF
	as4RrKPMszhxVsgF9Pj7FQJhrK2m9nqLXhe1to8sUJ9Oz6/UZulocuEq
X-Gm-Gg: ASbGnctHK2TWDdwGo8ZGxoibraEyVExd+gSSxIlcUSZZUdEOIujiedEJ57lwwRqSKDd
	3p0vJqW3GqUS7OVGF0/DJsFXgHZ4nyQwamdU6JsjZg8Hfe3wU0dtDQTcHQGuJx8YQPUwfZlSvpo
	61+00X2WqDF3wc5ZaFLGSpAPzhdhlnguY+0MKrdbqSAk2XII7X4+TmRl1Txd0aaQXGUk/4WEu/s
	9kVdJVenmYu54IGGvUKDaT7XM62VSbhryq6c7oyvzHzErLDhusLYDYOI1nTYNKVsjx8QZ5m2tyw
	oNy0EsM/HyXw0eBp1cCOhACuxT0eWVa64Ju0thDT6P/EDOtohtPi8ZUZoDz+++bkMUqiGOsCemI
	E6sMk+H93VC1Bga7WjnIRkEUWW00TuhpB44t13zbrtb03ymZzO2h29JMjO8ykYG8K7Shfx58Ieg
	RtsxlkOow=
X-Google-Smtp-Source: AGHT+IEI3ZtP4UJcMxmXtVsEmNNvwRnBEhvRevQfIQBU4V/51Gaz9p1mdOZldFWYre3zxjNQI/HNXA==
X-Received: by 2002:a17:907:6093:b0:afe:6c9b:c828 with SMTP id a640c23a62f3a-b34bd93b2e9mr1805028766b.61.1759160498250;
        Mon, 29 Sep 2025 08:41:38 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------X7Xm0A6ykrh0qtygjMNPUvqM"
Message-ID: <d0d36b5d-5e4e-437d-a4ae-e5796599a471@gmail.com>
Date: Mon, 29 Sep 2025 17:41:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/26] xen/domctl: wrap xsm_getdomaininfo() with
 CONFIG_MGMT_HYPERCALLS
To: Jan Beulich <jbeulich@suse.com>, "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Andryuk, Jason" <Jason.Andryuk@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-19-Penny.Zheng@amd.com>
 <a8b93dcc-c003-49a6-8a78-5fb890cbaec0@suse.com>
 <DM4PR12MB8451BE98219C343F8F62482AE11FA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <66b43c3b-c74f-4c18-b91a-bd7b56a62eff@suse.com>
 <DM4PR12MB84518B65027B6A355ED4D246E11EA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <af57c032-541d-4956-85de-269066c50cd3@suse.com>
 <IA1PR12MB8467188458BA8FAF348AC538E11EA@IA1PR12MB8467.namprd12.prod.outlook.com>
 <a5224376-f89d-4a2f-8a74-e5256352f754@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a5224376-f89d-4a2f-8a74-e5256352f754@suse.com>

This is a multi-part message in MIME format.
--------------X7Xm0A6ykrh0qtygjMNPUvqM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/26/25 9:14 AM, Jan Beulich wrote:
> On 26.09.2025 08:57, Penny, Zheng wrote:
>>> -----Original Message-----
>>> From: Jan Beulich<jbeulich@suse.com>
>>> Sent: Friday, September 26, 2025 2:53 PM
>>>
>>> On 26.09.2025 06:41, Penny, Zheng wrote:
>>>>> -----Original Message-----
>>>>> From: Jan Beulich<jbeulich@suse.com>
>>>>> Sent: Thursday, September 25, 2025 10:29 PM
>>>>>
>>>>> On 25.09.2025 11:41, Penny, Zheng wrote:
>>>>>>> -----Original Message-----
>>>>>>> From: Jan Beulich<jbeulich@suse.com>
>>>>>>> Sent: Thursday, September 11, 2025 9:30 PM
>>>>>>>
>>>>>>> On 10.09.2025 09:38, Penny Zheng wrote:
>>>>>>>> --- a/xen/include/xsm/xsm.h
>>>>>>>> +++ b/xen/include/xsm/xsm.h
>>>>>>>> @@ -55,8 +55,8 @@ struct xsm_ops {
>>>>>>>>       void (*security_domaininfo)(struct domain *d,
>>>>>>>>                                   struct xen_domctl_getdomaininfo *info);
>>>>>>>>       int (*domain_create)(struct domain *d, uint32_t ssidref);
>>>>>>>> -    int (*getdomaininfo)(struct domain *d);
>>>>>>>>   #ifdef CONFIG_MGMT_HYPERCALLS
>>>>>>>> +    int (*getdomaininfo)(struct domain *d);
>>>>>>>>       int (*domctl_scheduler_op)(struct domain *d, int op);
>>>>>>>>       int (*sysctl_scheduler_op)(int op);
>>>>>>>>       int (*set_target)(struct domain *d, struct domain *e); @@
>>>>>>>> -234,7
>>>>>>>> +234,11 @@ static inline int xsm_domain_create(
>>>>>>>>
>>>>>>>>   static inline int xsm_getdomaininfo(xsm_default_t def, struct
>>>>>>>> domain
>>>>>>>> *d)  {
>>>>>>>> +#ifdef CONFIG_MGMT_HYPERCALLS
>>>>>>>>       return alternative_call(xsm_ops.getdomaininfo, d);
>>>>>>>> +#else
>>>>>>>> +    return -EOPNOTSUPP;
>>>>>>>> +#endif
>>>>>>>>   }
>>>>>>> This is in use by a Xenstore sysctl and a Xenstore domctl. The
>>>>>>> sysctl is hence already broken with the earlier series. Now the
>>>>>>> domctl is also being screwed up. I don't think MGMT_HYPERCALLS
>>>>>>> really ought to extend to any operations available to other than the core
>>> toolstack.
>>>>>>> That's the Xenstore ones here, but also the ones used by qemu
>>>>>>> (whether run in
>>>>> Dom0 or a stubdom).
>>>>>> Maybe not only limited to the core toolstack. In
>>>>>> dom0less/hyperlaunched
>>>>> scenarios, hypercalls are strictly limited. QEMU is also limited to
>>>>> pvh machine type and with very restricted functionality(, only acting
>>>>> as a few virtio-pci devices backend). @Andryuk, Jason @Stabellini,
>>>>> Stefano Am I understanding correctly and thoroughly about our scenario here for
>>> upstream?
>>>>>> Tracking the codes, if Xenstore is created as a stub domain, it
>>>>>> requires
>>>>> getdomaininfo-domctl to acquire related info.  Sorry, I haven't found
>>>>> how it was called in QEMU...
>>>>>
>>>>> It's not "it"; it's different ones. First and foremost I was thinking
>>>>> of
>>>>>   * XEN_DOMCTL_ioport_mapping
>>>>>   * XEN_DOMCTL_memory_mapping
>>>>>   * XEN_DOMCTL_bind_pt_irq
>>>>>   * XEN_DOMCTL_unbind_pt_irq
>>>>> but there may be others (albeit per the dummy xsm_domctl() this is
>>>>> the full set). As a general criteria, anything using XSM_DM_PRIV
>>>>> checking can in principle be called by qemu.
>>>>>
>>>> Understood.
>>>> I assume that they are all for device passthrough. We are not accepting device
>>> passthrough via core toolstack in dom0less/hyperlaunch-ed scenarios. Jason has
>>> developed device passthrough through device tree to only accept "static
>>> configured" passthrough in dom0less/hyperlaunch-ed scenario, while it is still
>>> internal , it may be the only accept way to do device passthrough in
>>> dom0less/hyperlaunch-ed scenario.
>>>
>>> Right, but no matter what your goals, the upstream contributions need to be self-
>>> consistent. I.e. not (risk to) break other functionality. (Really the four domctl-s
>>> mentioned above might better have been put elsewhere, e.g. as dm-ops. Moving
>>> them may be an option here.)
>> Understood.
>> I'll move them all to the dm-ops
> Before you do so, please consider the consequences, though (I said "may" for a
> reason). Also please allow others to chime in. (In this context I notice that
> several REST maintainers weren't even Cc-ed here, and hence may not have seen
> the earlier discussion.)
>
> One thing seems pretty clear to me: This work likely isn't going to be suitable
> for 4.21 anymore. Hence we're back to considering alternatives to address the
> still pending build issue. (My take on it remains: Revert the tail of the
> sysctl work.) Adding Oleksii to Cc as well.

I agree, the patch series is still quite far from being ready to merge.
So let’s consider it for the next release.

As mentioned in the earlier (related) patch series, reverting the tail of the
sysctl work is still, in my opinion, the best option.

~ Oleksii

--------------X7Xm0A6ykrh0qtygjMNPUvqM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/26/25 9:14 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a5224376-f89d-4a2f-8a74-e5256352f754@suse.com">
      <pre wrap="" class="moz-quote-pre">On 26.09.2025 08:57, Penny, Zheng wrote:
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">-----Original Message-----
From: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
Sent: Friday, September 26, 2025 2:53 PM

On 26.09.2025 06:41, Penny, Zheng wrote:
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">-----Original Message-----
From: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
Sent: Thursday, September 25, 2025 10:29 PM

On 25.09.2025 11:41, Penny, Zheng wrote:
</pre>
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">-----Original Message-----
From: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
Sent: Thursday, September 11, 2025 9:30 PM

On 10.09.2025 09:38, Penny Zheng wrote:
</pre>
                  <blockquote type="cite">
                    <pre wrap="" class="moz-quote-pre">--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -55,8 +55,8 @@ struct xsm_ops {
     void (*security_domaininfo)(struct domain *d,
                                 struct xen_domctl_getdomaininfo *info);
     int (*domain_create)(struct domain *d, uint32_t ssidref);
-    int (*getdomaininfo)(struct domain *d);
 #ifdef CONFIG_MGMT_HYPERCALLS
+    int (*getdomaininfo)(struct domain *d);
     int (*domctl_scheduler_op)(struct domain *d, int op);
     int (*sysctl_scheduler_op)(int op);
     int (*set_target)(struct domain *d, struct domain *e); @@
-234,7
+234,11 @@ static inline int xsm_domain_create(

 static inline int xsm_getdomaininfo(xsm_default_t def, struct
domain
*d)  {
+#ifdef CONFIG_MGMT_HYPERCALLS
     return alternative_call(xsm_ops.getdomaininfo, d);
+#else
+    return -EOPNOTSUPP;
+#endif
 }
</pre>
                  </blockquote>
                  <pre wrap="" class="moz-quote-pre">
This is in use by a Xenstore sysctl and a Xenstore domctl. The
sysctl is hence already broken with the earlier series. Now the
domctl is also being screwed up. I don't think MGMT_HYPERCALLS
really ought to extend to any operations available to other than the core
</pre>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">toolstack.
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">That's the Xenstore ones here, but also the ones used by qemu
(whether run in
</pre>
                </blockquote>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Dom0 or a stubdom).
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">
Maybe not only limited to the core toolstack. In
dom0less/hyperlaunched
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">scenarios, hypercalls are strictly limited. QEMU is also limited to
pvh machine type and with very restricted functionality(, only acting
as a few virtio-pci devices backend). @Andryuk, Jason @Stabellini,
Stefano Am I understanding correctly and thoroughly about our scenario here for
</pre>
            </blockquote>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">upstream?
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">Tracking the codes, if Xenstore is created as a stub domain, it
requires
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">getdomaininfo-domctl to acquire related info.  Sorry, I haven't found
how it was called in QEMU...

It's not "it"; it's different ones. First and foremost I was thinking
of
 * XEN_DOMCTL_ioport_mapping
 * XEN_DOMCTL_memory_mapping
 * XEN_DOMCTL_bind_pt_irq
 * XEN_DOMCTL_unbind_pt_irq
but there may be others (albeit per the dummy xsm_domctl() this is
the full set). As a general criteria, anything using XSM_DM_PRIV
checking can in principle be called by qemu.

</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">
Understood.
I assume that they are all for device passthrough. We are not accepting device
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">passthrough via core toolstack in dom0less/hyperlaunch-ed scenarios. Jason has
developed device passthrough through device tree to only accept "static
configured" passthrough in dom0less/hyperlaunch-ed scenario, while it is still
internal , it may be the only accept way to do device passthrough in
dom0less/hyperlaunch-ed scenario.

Right, but no matter what your goals, the upstream contributions need to be self-
consistent. I.e. not (risk to) break other functionality. (Really the four domctl-s
mentioned above might better have been put elsewhere, e.g. as dm-ops. Moving
them may be an option here.)
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Understood.
I'll move them all to the dm-ops
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Before you do so, please consider the consequences, though (I said "may" for a
reason). Also please allow others to chime in. (In this context I notice that
several REST maintainers weren't even Cc-ed here, and hence may not have seen
the earlier discussion.)

One thing seems pretty clear to me: This work likely isn't going to be suitable
for 4.21 anymore. Hence we're back to considering alternatives to address the
still pending build issue. (My take on it remains: Revert the tail of the
sysctl work.) Adding Oleksii to Cc as well.</pre>
    </blockquote>
    <pre>I agree, the patch series is still quite far from being ready to merge.
So let’s consider it for the next release.

As mentioned in the earlier (related) patch series, reverting the tail of the
sysctl work is still, in my opinion, the best option.

~ Oleksii</pre>
  </body>
</html>

--------------X7Xm0A6ykrh0qtygjMNPUvqM--

