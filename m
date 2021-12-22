Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1CB47CF28
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 10:25:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250700.431748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzxrX-0002y1-Rf; Wed, 22 Dec 2021 09:24:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250700.431748; Wed, 22 Dec 2021 09:24:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzxrX-0002wG-Ny; Wed, 22 Dec 2021 09:24:43 +0000
Received: by outflank-mailman (input) for mailman id 250700;
 Wed, 22 Dec 2021 09:24:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mzxrV-0002wA-ID
 for xen-devel@lists.xenproject.org; Wed, 22 Dec 2021 09:24:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mzxrU-0000Tp-8x; Wed, 22 Dec 2021 09:24:40 +0000
Received: from [54.239.6.186] (helo=[192.168.17.226])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mzxrT-0000CO-Vg; Wed, 22 Dec 2021 09:24:40 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=ShCX8Blbu2ASvBNjG0vJiMeXe/DTX9QpPIUyR5Y8JJw=; b=c5IcMGu5PWcohBDfAdUGBWWasB
	A7CX+GUynNApIQahfdGESqnzoN/l0J5twbECLxlauCSSW1L5s/rp6kLdsuVz18SoiD+K1sz34d99w
	KpWsfwCcTIBFQxgqkENLl4aqo2QWTfJUSZZic1eXxmCwDmTBXikI7kmQ6hn+8yt6ebn0=;
Message-ID: <bc6d7529-337d-a4e1-664a-dddd68ecf5cb@xen.org>
Date: Wed, 22 Dec 2021 10:24:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
To: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 Oleksandr <olekstysh@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <4469cdf05051bd691a8adff2657d27f6a5f0cefb.1639472078.git.oleksii_moisieiev@epam.com>
 <b1c27f70-309d-bb36-3228-32836063fd16@gmail.com>
 <20211217121524.GA4021162@EPUAKYIW015D> <YcHol8ads22asXGF@perard>
 <alpine.DEB.2.22.394.2112211330310.2060010@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2112211330310.2060010@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefano,

On 21/12/2021 22:39, Stefano Stabellini wrote:
> On Tue, 21 Dec 2021, Anthony PERARD wrote:
>> On Fri, Dec 17, 2021 at 12:15:25PM +0000, Oleksii Moisieiev wrote:
>>>> On 14.12.21 11:34, Oleksii Moisieiev wrote:
>>>>> @@ -1817,17 +1858,24 @@ static void libxl__add_dtdevs(libxl__egc *egc, libxl__ao *ao, uint32_t domid,
>>>>>    {
>>>>>        AO_GC;
>>>>>        libxl__ao_device *aodev = libxl__multidev_prepare(multidev);
>>>>> -    int i, rc = 0;
>>>>> +    int i, rc = 0, rc_sci = 0;
>>>>>        for (i = 0; i < d_config->num_dtdevs; i++) {
>>>>>            const libxl_device_dtdev *dtdev = &d_config->dtdevs[i];
>>>>>            LOGD(DEBUG, domid, "Assign device \"%s\" to domain", dtdev->path);
>>>>>            rc = xc_assign_dt_device(CTX->xch, domid, dtdev->path);
>>>>> -        if (rc < 0) {
>>>>> -            LOGD(ERROR, domid, "xc_assign_dtdevice failed: %d", rc);
>>>>> +        rc_sci = xc_domain_add_sci_device(CTX->xch, domid, dtdev->path);
>>>>> +
>>>>> +        if ((rc < 0) && (rc_sci < 0)) {
>>>>> +            LOGD(ERROR, domid, "xc_assign_dt_device failed: %d; "
>>>>> +                 "xc_domain_add_sci_device failed: %d",
>>>>> +                 rc, rc_sci);
>>>>>                goto out;
>>>>>            }
>>>>> +
>>>>> +        if (rc)
>>>>> +            rc = rc_sci;
>>>>
>>>>
>>>> If I get this code right, it sounds like the dom.cfg's dtdev property is
>>>> reused to describe sci devices as well, but the libxl__add_dtdevs() does not
>>>> (and can not) differentiate them. So it has no option but to send two
>>>> domctls for each device in dtdevs[] hoping to at least one domctl to
>>>> succeeded. Or I really missed something?
>>>>
>>>> It feels to me that:
>>>>   - either new dom.cfg's property could be introduced (scidev?) to describe
>>>> sci devices together with new parsing logic/management code, so you will end
>>>> up having new libxl__add_scidevs() to invoke XEN_DOMCTL_add_sci_device,
>>>> so no mixing things.
>>>>   - or indeed dtdev logic could be *completely* reused including extending
>>>> XEN_DOMCTL_assign_device to cover your use-case, although sounds generic, it
>>>> is used to describe devices for the passthrough (to configure an IOMMU for
>>>> the device), in that case you wouldn't need an extra
>>>> XEN_DOMCTL_add_sci_device introduced by current patch.
> 
> I realize I did my review before reading Oleksandr's comments. I fully
> agree with his feedback. Having seen how difficult is for users to setup
> a domU configuration correctly today, I would advise to try to reuse the
> existing dtdev property instead of adding yet one new property to make
> the life of our users easier.
> 
> 
> 
>>>> Personally I would use the first option as I am not sure that second option
>>>> is conceptually correct && possible. I would leave this for the maintainers
>>>> to clarify.
>>>>
>>>
>>> Thank you for the point. I agree that reusing XEN_DOMCTL_assign_device
>>> seems not to be conceptually correct. Introducing new dom.cfg property
>>> seems to be the only way to avoid extra Domctl calls.
>>> I will handle this in v2 if there will be no complains from Maintainers.
>>
>> I don't know if there will be a complains in v2 or not :-), but using
>> something different from dtdev sound good.
>>
>> If I understand correctly, dtdev seems to be about passing through an
>> existing device to a guest, and this new sci device seems to be about having Xen
>> "emulating" an sci device which the guest will use. So introducing
>> something new (scidev or other name) sounds good.
> 
> Users already have to provide 4 properties (dtdev, iomem, irqs,
> device_tree) to setup device assignment. I think that making it 5
> properties would not be a step forward :-)

IIRC, in the past, we discussed to fetch the information directly from 
the partial device-tree. Maybe this discussion needs to be revived?

Although, this is a separate topic from this series.

> 
> To me dtdev and XEN_DOMCTL_assign_device are appropriate because they
> signify device assignment of one or more devices. We are not adding any
> additional "meaning" to them. It is just that we'll automatically detect
> and generate any SCMI configurations based on the list of assigned
> devices. Because if SCMI is enabled and a device is assigned to the
> guest, then I think we want to add the device to the SCMI list of
> devices automatically.

I am OK with re-using dtdev/XEN_DOMCTL_assign_device however there is a 
pitfall with that approach.

At the moment, they are only used for device protected by the IOMMU. If 
the device is not protected by the IOMMU then it will return an error.

Now, with your approach we may have a device that is not protected by 
the IOMMU but require to a SCMI configuration.

I don't think it would be sensible to just return "succeed" here because 
technically you are asking to assign a non-protected device. But at the 
same time, it would prevent a user to assign a non-DMA capable device.

So how do you suggest to approach this?

Cheers,

-- 
Julien Grall

