Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 977EA86C620
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 10:56:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686914.1069528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfd9O-0008PD-7o; Thu, 29 Feb 2024 09:56:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686914.1069528; Thu, 29 Feb 2024 09:56:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfd9O-0008Lg-4l; Thu, 29 Feb 2024 09:56:26 +0000
Received: by outflank-mailman (input) for mailman id 686914;
 Thu, 29 Feb 2024 09:56:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ot4I=KG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rfd9M-0007IO-Vi
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 09:56:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb959490-d6e8-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 10:56:23 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id CBA3A4EE0737;
 Thu, 29 Feb 2024 10:56:22 +0100 (CET)
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
X-Inumbo-ID: cb959490-d6e8-11ee-a1ee-f123f15fe8a2
MIME-Version: 1.0
Date: Thu, 29 Feb 2024 10:56:22 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
 consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 2/2] xen/cpu: address MISRA C Rule 17.7
In-Reply-To: <alpine.DEB.2.22.394.2402281437470.575685@ubuntu-linux-20-04-desktop>
References: <cover.1708680104.git.nicola.vetrini@bugseng.com>
 <dd4ac0e670a2ad7ecb5eb435e5e3b4b313b1e0b6.1708680104.git.nicola.vetrini@bugseng.com>
 <33342a17-e71c-4752-a16f-da5c0ef77b51@suse.com>
 <alpine.DEB.2.22.394.2402261619210.247676@ubuntu-linux-20-04-desktop>
 <2178731a-ec81-4505-ba8a-2f945bf85133@suse.com>
 <7a8e610e-913e-4a56-8ce1-6dd6abd894f4@xen.org>
 <4bee79ca-7a7e-4bcc-ac97-5a5a57ec2c91@suse.com>
 <alpine.DEB.2.22.394.2402271808410.575685@ubuntu-linux-20-04-desktop>
 <6af04933659178b3ccabc5caf646273c@bugseng.com>
 <bcae31fb-856d-4737-b780-f41b3e24cfa7@xen.org>
 <alpine.DEB.2.22.394.2402281437470.575685@ubuntu-linux-20-04-desktop>
Message-ID: <ee30028d5c53f3b90acad005147b56f1@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-02-28 23:38, Stefano Stabellini wrote:
> On Wed, 28 Feb 2024, Julien Grall wrote:
>> Hi Nicola,
>> 
>> On 28/02/2024 11:09, Nicola Vetrini wrote:
>> > > I asked Roberto if void casts are an option for compliance.
>> > >
>> >
>> > void casts are an option for sure. The rationale for the rule explicitly
>> > lists them as a compliance mechanism. An interesting aspect is what would be
>> > the consensus around void casts on functions whose return value is always
>> > ignored vs. functions whose return value is sometimes ignored.
>> 
>> If a return is always ignored, then the function should return void. 
>> For the
>> second case, I think it will be on the case by case basis.
> 
> +1
> 

Ok, noted.

> 
>> > > In any case, I don't think we should use void casts in the specific
>> > > cases this patch is dealing with. Void casts (if anything) should be a
>> > > last resort while this patch fixes the issue in a better way.
>> 
>> +1.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

