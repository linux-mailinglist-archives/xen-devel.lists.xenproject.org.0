Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5798674A15B
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 17:47:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559923.875368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHRC4-0005BV-Gb; Thu, 06 Jul 2023 15:46:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559923.875368; Thu, 06 Jul 2023 15:46:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHRC4-00058E-DC; Thu, 06 Jul 2023 15:46:56 +0000
Received: by outflank-mailman (input) for mailman id 559923;
 Thu, 06 Jul 2023 15:46:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/0J5=CY=bounce.vates.fr=bounce-md_30504962.64a6e1ea.v1-0e73e11d67d545b69f274766bbb5033d@srs-se1.protection.inumbo.net>)
 id 1qHRC2-000588-U5
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 15:46:55 +0000
Received: from mail145-16.atl61.mandrillapp.com
 (mail145-16.atl61.mandrillapp.com [198.2.145.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5351ce93-1c14-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 17:46:52 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-16.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4QxgrC14Xpz8XRsZZ
 for <xen-devel@lists.xenproject.org>; Thu,  6 Jul 2023 15:46:51 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 0e73e11d67d545b69f274766bbb5033d; Thu, 06 Jul 2023 15:46:51 +0000
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
X-Inumbo-ID: 5351ce93-1c14-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr;
	s=mandrill; t=1688658411; x=1688918911; i=yann.dirson@vates.fr;
	bh=7iebBR2+WFMMCXpGZS2CNAoG6BhDktl65DqP2Xa1wrE=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=BxnmuFNjQqFrZn9kIYwzwozBZ0wpVXHoNGgu+GnwH2qtdE60cX1bjpkMukE619nC5
	 CGs0Y/dZguS7OY6QpRko7cmi5HVBzbXkUZvRRBnaVbaqxc1LIEq6mtM3C95rIn/C7z
	 DhToPQhKnc+CTPy6nCe+mjqDmOhy/OmbmAe2gFSY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1688658411; h=From : 
 Subject : Message-Id : To : References : In-Reply-To : Date : 
 MIME-Version : Content-Type : Content-Transfer-Encoding : From : 
 Subject : Date : X-Mandrill-User : List-Unsubscribe; 
 bh=7iebBR2+WFMMCXpGZS2CNAoG6BhDktl65DqP2Xa1wrE=; 
 b=E8ZKrPzx9bwMJJdgGQKuEeh1jgFX7b/rGv8x5LitfxjVkNchpdfruxLJGK1zqTTC9GWUdV
 ZiWwJa4wHNMdap2WbK33PXsTFvVsRyNOq9GrozOLbjFJxz1CamAOX6+u/uY0RrZ9C1EXlFnh
 IRKNApdvdMvHRW/uA1Qaodm40bN48=
From: Yann Dirson <yann.dirson@vates.fr>
Subject: =?utf-8?Q?Re:=20Detecting=20whether=20dom0=20is=20in=20a=20VM?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 39f1d088-dab6-450b-998d-f0ee110bfa80
X-Bm-Transport-Timestamp: 1688658408944
Message-Id: <87770379-a53c-cfe4-3809-4dfce4787894@vates.fr>
To: xen-devel@lists.xenproject.org
References: <CA+zSX=Y4MwsDSd9oSG1NQyt==YAw9SeRdh=eJxTUhhOx57ihWg@mail.gmail.com> <4ee01a0f-063e-ef93-ac24-da387d5b3438@rabbit.lu> <a680ae62-7765-aa51-1edd-9a1a7e39e449@suse.com> <20b1a79c-23c1-93bc-2090-8052f143422c@rabbit.lu>
In-Reply-To: <20b1a79c-23c1-93bc-2090-8052f143422c@rabbit.lu>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.0e73e11d67d545b69f274766bbb5033d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20230706:md
Date: Thu, 06 Jul 2023 15:46:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 7/6/23 17:35, zithro wrote:
> On 06 Jul 2023 09:02, Jan Beulich wrote:
>> On 05.07.2023 18:20, zithro wrote:
>>> So I'm wondering, isn't that path enough for correct detection ?
>>> I mean, if "/sys/class/dmi/id/sys_vendor" reports Xen (or KVM, or any
>>> other known hypervisor), it's nested, otherwise it's on hardware ?
>>>
>>> Is that really mandatory to use CPUID leaves ?
>>
>> Let me ask the other way around: In user mode code under a non-nested
>> vs nested Xen, what would you be able to derive from CPUID? The
>> "hypervisor" bit is going to be set in both cases. (All assuming you
>> run on new enough hardware+Xen such that CPUID would be intercepted
>> even for PV.)
> 
> I'm a bit clueless about CPUID stuff, but if I understand correctly, 
> you're essentially saying that using CPUID may not be the perfect way ?
> Also, I don't get why the cpuid command returns two different values, 
> depending on the -k switch :
> # cpuid -l 0x40000000
> hypervisor_id (0x40000000) = "\0\0\0\0\0\0\0\0\0\0\0\0"
> # cpuid -k -l 0x40000000
> hypervisor_id (0x40000000) = "XenVMMXenVMM"
> 
>> Yet relying on DMI is fragile, too: Along the lines of
>> https://lists.xen.org/archives/html/xen-devel/2022-01/msg00604.html
>> basically any value in there could be "inherited" from the host (i.e.
>> from the layer below, to be precise).
> 
> So using "/sys/class/dmi/id/sys_vendor", or simply doing "dmesg | grep 
> DMI:" is also not perfect, as values can be inherited/spoofed by 
> underneath hypervisor ?
> 
>> The only way to be reasonably
>> certain is to ask Xen about its view. The raw or host featuresets
>> should give you this information, in the "mirror" of said respective
>> CPUID leave's "hypervisor" bit. 
> 
> As said above, I'm clueless, can you expand please ?
> 
>> But of course that still won't tell
>> you which _kind_ of hypervisor is the immediate next one underneath
>> Xen.
>>
>> This then further raises the question of what use it is to know the
>> kind of the next level hypervisor, when multiple may be stacked on
>> top of one another ...
> 
> We need an answer from systemd guys, but the commiter expanded on the 
> reasons why the change was made [1] : "the detect_vm_cpuid check was 
> returning a VIRTUALIZATION_NONE result on non-nested dom0 (checking the 
> log from back then I was getting No virtualization found in CPUID), but 
> would report other CPUID-detectable hypervisors when dom0 was nested, so 
> we still wanted to check it for this case".
> 
> Systemd is using this information to not start some services when 
> nested, like SMART/smartmontools (which have 
> "ConditionVirtualization=no" in their systemd unit files).
> As the check now fails on baremetal dom0s, the service is not starting.

Is this really wise?  With any passed-through device the user likely 
wants such a service to start.  Are they not misled with this effort?

> 
> [1] https://github.com/systemd/systemd/issues/28113#issuecomment-1621559642
> 

-- 
Yann Dirson | Vates Platform Developer
XCP-ng & Xen Orchestra - Vates solutions
w: vates.tech | xcp-ng.org | xen-orchestra.com


Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions
web: https://vates.tech

