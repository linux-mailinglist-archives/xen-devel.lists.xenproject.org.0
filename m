Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DD15EF5C1
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 14:53:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413745.657590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odt2h-00068h-L2; Thu, 29 Sep 2022 12:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413745.657590; Thu, 29 Sep 2022 12:53:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odt2h-00065j-Hu; Thu, 29 Sep 2022 12:53:31 +0000
Received: by outflank-mailman (input) for mailman id 413745;
 Thu, 29 Sep 2022 12:53:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rcb6=2A=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1odt2g-00065d-J6
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 12:53:30 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5f59966-3ff5-11ed-964a-05401a9f4f97;
 Thu, 29 Sep 2022 14:53:29 +0200 (CEST)
Received: from [10.10.1.154] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1664456004116355.737884699642;
 Thu, 29 Sep 2022 05:53:24 -0700 (PDT)
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
X-Inumbo-ID: b5f59966-3ff5-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; t=1664456006; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SbWAnXOxx1ZcwQr/sUhPaorj8/ibOPgLPYg7Njl4qv2d97FGb54Dol3oIrLPgnboFRCVg36ux6mW6z09k92ZDH2S+FiGFtIKT9u0k85GQRvdxDU/0WcVb7VVKYPuS66bFchi8TZylH6vRoshUi+bSwROO98/SpHysB4osh2DGSY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1664456006; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=yFGTgHnFvEN4b6/Gk134JfVTIbDgE+a85Uu/E3nLISc=; 
	b=fVz7rTYoNW67hRXE/4ZXjmpUc4bXtc27O4zTYp2j2K6t4qfhf4sayC7kOs4Sc0WENB2zDmMcIRtTX4tcNLmjQUZoh4xrYwJy8p30U9fBeQHqDVqqKaonw2PYrkqZ8DIAspi6u/syhrZRgTtOy7CL4jxvXZNDd9vXwoir0xZ+DFc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1664456006;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=yFGTgHnFvEN4b6/Gk134JfVTIbDgE+a85Uu/E3nLISc=;
	b=f4/k9VQ0RfmiqEVE8wgijZtbw6MZ5XLos5lHVPBxvJ9SEmSThb7cSdMKDEwRsIgT
	TTnCMtrYQ25y23r2TWVIbrNvKuQGhGjug2mVyKLTN1XXok/NOnWM6dfbFGxXRY+fTFy
	WFe8GaBdWOJQ9RUAENIU+WdWach4coM/csMDLgCw=
Message-ID: <abece4b2-4587-313c-7646-34ea5f961829@apertussolutions.com>
Date: Thu, 29 Sep 2022 08:53:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: Proposal for physical address based hypercalls
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <98b857b8-f36a-e935-8318-f17dfc3457ab@suse.com>
 <9340769a-d3cf-a7bb-f8f4-dc9bde463c02@gmail.com>
 <72674ba2-bc76-9e4c-7591-5588ff0c1f77@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <72674ba2-bc76-9e4c-7591-5588ff0c1f77@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 9/29/22 04:16, Jan Beulich wrote:
> On 28.09.2022 15:32, dpsmith.dev wrote:
>> On 9/28/22 06:38, Jan Beulich wrote:
>>> For quite some time we've been talking about replacing the present virtual
>>> address based hypercall interface with one using physical addresses.  This is in
>>> particular a prerequisite to being able to support guests with encrypted
>>> memory, as for such guests we cannot perform the page table walks necessary to
>>> translate virtual to (guest-)physical addresses.  But using (guest) physical
>>> addresses is also expected to help performance of non-PV guests (i.e. all Arm
>>> ones plus HVM/PVH on x86), because of the no longer necessary address
>>> translation.
>>
>> Greetings Jan,
>>
>> I think there are multiple issues in play here, but the two major ones
>> are 1.) eliminating the use of guest virtual addresses and 2.) handling
>> the change in the security model for hypercalls from encrypted VMs. As
>> Andy was pointing out, attempting to address (1) in a backwards
>> compatible approach will likely not arrive at a solution that can
>> address issue (2).
> 
> It may not be sufficient, but it is (can be) a prereq.

As I stated below, it will start setting the precedent for using GPAs. 
The concern is two-fold, how much benefit can actually be achieved for 
an API/ABI that cannot be used in the final solution. And by focusing 
effort on an unusable API/ABI, how much will that reduce effort/focus on 
crafting an API/ABI that can be used.

>> IMHO, the only result from teaching the existing ABI
>> to speak GPAs instead of VAs will be to break current and new kernels of
>> the habit of using VAs. Beyond that I do not see how it will do anything
>> to prepare current OS kernels for running as encrypted VMs, at least for
>> AMD since that is the specification I have been focused on studying the
>> last couple of months.
> 
> Plus we'd have code in the hypervisor then which deals with physical
> address based hypercall buffers. One less prereq to take care of for
> the (huge) rest of the work needed.

A question I would have is why not just RFC a GPA buffer helper 
framework for the hypervisor since it will get used by the new ABI and 
not spend effort retrofitting the current ABI. Some follow-on questions 
I would also ask is, moving forward would it be expected that new 
revisions of guests using the existing ABI would be expected to move to 
GPAs and how long do people see the existing ABI to continue in new 
guest revisions after the new ABI is adopted.

>> As for ABIv2, I understand and can appreciate Andy's desired approach.
>> Recently, especially with the hardware changes being introduced by SEV,
>> I would like to have considered a naive and more radical approach.
>> Currently hypercalls function using a more ioctl style. I would like to
>> suggest that a packet style interface similar to netlink be considered.
>> There are many benefits to adopting this type of interface that could be
>> covered in a larger RFC if there was any sense of willingness to
>> consider it. As a glimpse, a few benefits would be that arbitrary
>> buffers, continuations/asynchronous calls, and multi-call are all
>> natural consequence. It would also allow advanced extensions, such as an
>> optional PF_RING-like interface for zero-copy messaging from guest
>> user-space to hypervisor. While a packet interface could easily co-exist
>> with the existing ioctl-style interface, it would be a paradigm shift
>> from the past, though I feel ABIv2 was already going to be such a shift.
>> Anyway, just my 2¢.
> 
> I'm sorry for my ignorance, but I have no knowledge of how netlink
> works.

Understood, and you are not the first. A very quick, and very loose, 
comparison is that currently hypercalls are managed as ioctl remote call 
with per version defined payload. This proposal would move to a packet 
dispatch where the packet is a free-form TLV that allows unknown 
elements/parameters to be present. This enables a newer toolstack , 
without requiring a constantly moving compatibility layer, to send a 
packet to an older hypervisor which can reject unknown elements and 
hypercalls to silently ignore unknown parameters. Similarly, an older 
toolstack will be able to send packets to a new hypervisor. And as I 
stated above, this approach naturally enables continuations/async 
operations and multi-call invocations. It is a significant departure, 
and thus would require substantial design and implementation work, but 
there is an opportunity here to do this work.

V/r,
DPS

