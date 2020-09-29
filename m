Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 127BB27D094
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 16:05:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215.516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNGFy-0000K5-J6; Tue, 29 Sep 2020 14:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215.516; Tue, 29 Sep 2020 14:05:26 +0000
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
	id 1kNGFy-0000Jj-Es; Tue, 29 Sep 2020 14:05:26 +0000
Received: by outflank-mailman (input) for mailman id 215;
 Tue, 29 Sep 2020 14:05:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F2Z1=DG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kNGFw-0000JQ-Nm
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 14:05:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 352f15c1-4391-4550-bdbd-b1e507e160f6;
 Tue, 29 Sep 2020 14:05:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7C1CCAA55;
 Tue, 29 Sep 2020 14:05:22 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=F2Z1=DG=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kNGFw-0000JQ-Nm
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 14:05:24 +0000
X-Inumbo-ID: 352f15c1-4391-4550-bdbd-b1e507e160f6
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 352f15c1-4391-4550-bdbd-b1e507e160f6;
	Tue, 29 Sep 2020 14:05:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601388322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7DI+IGMvO/uWu30YJ7l8J0a1yYDas0nsL9d7RhPfe/s=;
	b=lzVqSMdVxP08841DQJIMsewFfVUTfXtm12aC526V2sznxJLqMu9b5EwyDIfPyGunv34yEP
	cPUh2s+3+oYO9KJWMv0zvB9YqeSNYqwI/6PMIX+kbPM4M3mhJqiA33ZGKtCh75M/K28ksW
	1oFncXbMz77x3nRqH31TV+T6EZJw2MU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7C1CCAA55;
	Tue, 29 Sep 2020 14:05:22 +0000 (UTC)
Subject: Re: Kernel panic on 'floppy' module load, Xen HVM, since 4.19.143
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Denis Efremov <efremov@linux.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roman Shaposhnik <roman@zededa.com>, Thomas Gleixner <tglx@linutronix.de>
References: <20200927111405.GJ3962@mail-itl>
 <26fe7920-d6a8-fb8a-b97c-59565410eff4@suse.com>
 <20200928093654.GW1482@mail-itl>
 <fc9c3b03-bb2c-f80d-0540-7456fc0821b2@linux.com>
 <20200929124126.GD1482@mail-itl>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5115e96f-f054-f720-b718-ceef1950f038@suse.com>
Date: Tue, 29 Sep 2020 16:05:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200929124126.GD1482@mail-itl>
Content-Type: multipart/mixed;
 boundary="------------78FF30275CAA2E51DD18BB77"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------78FF30275CAA2E51DD18BB77
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29.09.20 14:41, Marek Marczykowski-Górecki wrote:
> On Tue, Sep 29, 2020 at 03:27:43PM +0300, Denis Efremov wrote:
>> Hi,
>>
>> On 9/28/20 12:36 PM, Marek Marczykowski-Górecki wrote:
>>> On Mon, Sep 28, 2020 at 07:02:19AM +0200, Jürgen Groß wrote:
>>>> On 27.09.20 13:14, Marek Marczykowski-Górecki wrote:
>>>>> Hi all,
>>>>>
>>>>> I get kernel panic on 'floppy' module load. If I blacklist the module,
>>>>> then everything works.
>>>>> The issue happens in Xen HVM, other virtualization modes (PV, PVH) works
>>>>> fine. PV dom0 works too. I haven't tried bare metal, but I assume it
>>>>> works fine too.
>>>>
>>>> Could you please try bare metal?
>>>
>>> I don't have any hw with floppy controller at hand...
>>> Booting on what I have, it works, loading floppy just says -ENODEV.
>>
>> I saw that the issue was bisected [1] to commit
>> c330fb1ddc0a ("XEN uses irqdesc::irq_data_common::handler_data to store a
>> per interrupt XEN data pointer which contains XEN specific information.")
>>
>> I have hardware, but I've never worked with Xen. It will take me some time
>> to set it up and reproduce the problem. I think I will do it in a week.
> 
> Can you try to boot 4.19.143 (or any other including that commit)
> directly on the hardware and make sure floppy module is loaded? We do
> know it's broken in Xen HVM, it would be interested to see if it works
> without Xen. Even better if you could use the same kernel config:
> https://gist.github.com/marmarek/1e6a359c9a99af3ed8fc16af0f36d8a6

I think it is not directly related to floppy, but a more general problem
for HVM guests.

I'm suspecting an issue with legacy IRQs. Could you please try the
attached patch?


Juergen

--------------78FF30275CAA2E51DD18BB77
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-events-don-t-use-chip_data-for-legacy-IRQs.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-xen-events-don-t-use-chip_data-for-legacy-IRQs.patch"

From 35b71ae9cc69cdd151cc3a4d587f67eb8d86007d Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
Date: Tue, 29 Sep 2020 15:47:21 +0200
Subject: [PATCH] xen/events: don't use chip_data for legacy IRQs

Storing Xen specific data via chip_data is fine, as long as this isn't
done for a legacy IRQ.

Use a local array for this purpose in case of legacy IRQs.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/events/events_base.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index 90b8f56fbadb..6f02c18fa65c 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -92,6 +92,8 @@ static bool (*pirq_needs_eoi)(unsigned irq);
 /* Xen will never allocate port zero for any purpose. */
 #define VALID_EVTCHN(chn)	((chn) != 0)
 
+static struct irq_info *legacy_info_ptrs[NR_IRQS_LEGACY];
+
 static struct irq_chip xen_dynamic_chip;
 static struct irq_chip xen_percpu_chip;
 static struct irq_chip xen_pirq_chip;
@@ -156,7 +158,18 @@ int get_evtchn_to_irq(evtchn_port_t evtchn)
 /* Get info for IRQ */
 struct irq_info *info_for_irq(unsigned irq)
 {
-	return irq_get_chip_data(irq);
+	if (irq < nr_legacy_irqs())
+		return legacy_info_ptrs[irq];
+	else
+		return irq_get_chip_data(irq);
+}
+
+static void set_info_for_irq(unsigned int irq, struct irq_info *info)
+{
+	if (irq < nr_legacy_irqs())
+		legacy_info_ptrs[irq] = info;
+	else
+		irq_set_chip_data(irq, info);
 }
 
 /* Constructors for packed IRQ information. */
@@ -377,7 +390,7 @@ static void xen_irq_init(unsigned irq)
 	info->type = IRQT_UNBOUND;
 	info->refcnt = -1;
 
-	irq_set_chip_data(irq, info);
+	set_info_for_irq(irq, info);
 
 	list_add_tail(&info->list, &xen_irq_list_head);
 }
@@ -426,14 +439,14 @@ static int __must_check xen_allocate_irq_gsi(unsigned gsi)
 
 static void xen_free_irq(unsigned irq)
 {
-	struct irq_info *info = irq_get_chip_data(irq);
+	struct irq_info *info = info_for_irq(irq);
 
 	if (WARN_ON(!info))
 		return;
 
 	list_del(&info->list);
 
-	irq_set_chip_data(irq, NULL);
+	set_info_for_irq(irq, NULL);
 
 	WARN_ON(info->refcnt > 0);
 
@@ -603,7 +616,7 @@ EXPORT_SYMBOL_GPL(xen_irq_from_gsi);
 static void __unbind_from_irq(unsigned int irq)
 {
 	evtchn_port_t evtchn = evtchn_from_irq(irq);
-	struct irq_info *info = irq_get_chip_data(irq);
+	struct irq_info *info = info_for_irq(irq);
 
 	if (info->refcnt > 0) {
 		info->refcnt--;
@@ -1108,7 +1121,7 @@ int bind_ipi_to_irqhandler(enum ipi_vector ipi,
 
 void unbind_from_irqhandler(unsigned int irq, void *dev_id)
 {
-	struct irq_info *info = irq_get_chip_data(irq);
+	struct irq_info *info = info_for_irq(irq);
 
 	if (WARN_ON(!info))
 		return;
@@ -1142,7 +1155,7 @@ int evtchn_make_refcounted(evtchn_port_t evtchn)
 	if (irq == -1)
 		return -ENOENT;
 
-	info = irq_get_chip_data(irq);
+	info = info_for_irq(irq);
 
 	if (!info)
 		return -ENOENT;
@@ -1170,7 +1183,7 @@ int evtchn_get(evtchn_port_t evtchn)
 	if (irq == -1)
 		goto done;
 
-	info = irq_get_chip_data(irq);
+	info = info_for_irq(irq);
 
 	if (!info)
 		goto done;
-- 
2.26.2


--------------78FF30275CAA2E51DD18BB77--

