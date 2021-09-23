Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7D741607C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 16:05:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194279.346087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTPLI-0006YS-8V; Thu, 23 Sep 2021 14:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194279.346087; Thu, 23 Sep 2021 14:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTPLI-0006Vv-4l; Thu, 23 Sep 2021 14:04:52 +0000
Received: by outflank-mailman (input) for mailman id 194279;
 Thu, 23 Sep 2021 14:04:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fO2a=ON=greensocs.com=damien.hedde@srs-us1.protection.inumbo.net>)
 id 1mTPLG-0006Vj-Kj
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 14:04:51 +0000
Received: from beetle.greensocs.com (unknown [5.135.226.135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69583e72-dbba-46a7-aec2-092201a0bc3b;
 Thu, 23 Sep 2021 14:04:48 +0000 (UTC)
Received: from [192.168.15.189] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id D292D20786;
 Thu, 23 Sep 2021 14:04:45 +0000 (UTC)
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
X-Inumbo-ID: 69583e72-dbba-46a7-aec2-092201a0bc3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1632405886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UkbynlnCvJheMvgy5KHKY+xz6gcpk1nQXV5B9mUjOns=;
	b=JWNmS1MG18oEUFGyOIkmMRUIIqV+LMdU6sw4WjnCt8zL2ND+/STJkQcO4LdS33T+zi+The
	pA9rPdNQYqWx0fnxDCONrjEK8TrHMHIt18UppwpNxwrp/CIE//fy8rM3L8EFzSG3DVonuE
	xq1U1TRyGPL0wijjmNi/1ar9ll9PUxk=
Message-ID: <b14de602-9a80-cb44-9ae0-5a39a9dde5cd@greensocs.com>
Date: Thu, 23 Sep 2021 16:04:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH v2 10/16] qdev-monitor: allow adding any sysbus device
 before machine is ready
Content-Language: en-US-large
To: Ani Sinha <ani@anisinha.ca>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 mirela.grujic@greensocs.com, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, mark.burton@greensocs.com, edgari@xilinx.com,
 Igor Mammedov <imammedo@redhat.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-11-damien.hedde@greensocs.com>
 <alpine.DEB.2.22.394.2109231628280.630@anisinha-lenovo>
 <alpine.DEB.2.22.394.2109231723060.630@anisinha-lenovo>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <alpine.DEB.2.22.394.2109231723060.630@anisinha-lenovo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/23/21 13:55, Ani Sinha wrote:
> 
> 
> On Thu, 23 Sep 2021, Ani Sinha wrote:
> 
>>
>>
>> On Wed, 22 Sep 2021, Damien Hedde wrote:
>>
>>> Skip the sysbus device type per-machine allow-list check before the
>>> MACHINE_INIT_PHASE_READY phase.
>>>
>>> This patch permits adding any sysbus device (it still needs to be
>>> user_creatable) when using the -preconfig experimental option.
>>>
>>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>>> ---
>>>
>>> This commit is RFC. Depending on the condition to allow a device
>>> to be added, it may change.
>>> ---
>>>   softmmu/qdev-monitor.c | 9 +++++++--
>>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
>>> index f1c9242855..73b991adda 100644
>>> --- a/softmmu/qdev-monitor.c
>>> +++ b/softmmu/qdev-monitor.c
>>> @@ -269,8 +269,13 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
>>>           return NULL;
>>>       }
>>>
>>> -    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE)) {
>>> -        /* sysbus devices need to be allowed by the machine */
>>> +    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE) &&
>>> +        phase_check(MACHINE_INIT_PHASE_READY)) {
>>> +        /*
>>> +         * Sysbus devices need to be allowed by the machine.
>>> +         * We only check that after the machine is ready in order to let
>>> +         * us add any user_creatable sysbus device during machine creation.
>>> +         */
>>>           MachineClass *mc = MACHINE_CLASS(object_get_class(qdev_get_machine()));
>>>           if (!machine_class_is_dynamic_sysbus_dev_allowed(mc, *driver)) {
>>>               error_setg(errp, "'%s' is not an allowed pluggable sysbus device "
>>
>> Since now you are adding the state of the machine creation in the
>> valiation condition, the failure error message becomes misleading.
>> Better to do this I think :
>>
>> if (object class is TYPE_SYS_BUS_DEVICE)
>> {
>>    if (!phase_check(MACHINE_INIT_PHASE_READY))
>>      {
>>        // error out here saying the state of the machine creation is too
>> early
>>      }
>>
>>      // do the other check on dynamic sysbus
>>
>> }
> 
> The other thing to consider is whether we should put the machine phaze
> check at a higher level, at qdev_device_add() perhaps. One might envison
> that different device types may be allowed to be added at different
> stages of machine creation. So this check needs be more generalized for
> the future.
> 

Hi Ani,

I think moving out the allowance check from qdev_get_device_class is a 
good idea. The code will be more clear even if the check is not generalized.

Thanks,
--
Damien


