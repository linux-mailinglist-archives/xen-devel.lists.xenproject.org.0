Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BADD793171
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 23:58:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595863.929496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qde40-0008OI-1T; Tue, 05 Sep 2023 21:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595863.929496; Tue, 05 Sep 2023 21:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qde3z-0008Mc-UY; Tue, 05 Sep 2023 21:58:23 +0000
Received: by outflank-mailman (input) for mailman id 595863;
 Tue, 05 Sep 2023 21:58:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rZRj=EV=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qde3y-0008MU-Gs
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 21:58:22 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53bdf52b-4c37-11ee-8783-cb3800f73035;
 Tue, 05 Sep 2023 23:58:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 373C6828589F;
 Tue,  5 Sep 2023 16:58:20 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id kBsS9qQE-Whb; Tue,  5 Sep 2023 16:58:19 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 678C68285BDA;
 Tue,  5 Sep 2023 16:58:19 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id eCbTsi8njBLC; Tue,  5 Sep 2023 16:58:19 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id F0093828589F;
 Tue,  5 Sep 2023 16:58:18 -0500 (CDT)
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
X-Inumbo-ID: 53bdf52b-4c37-11ee-8783-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 678C68285BDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1693951099; bh=4GMVTYQepYNE09Uj10ENke0DdRuzsOylQKmMxm0GlBE=;
	h=Message-ID:Date:MIME-Version:From:To;
	b=NwjUztGWb8OkVHUyMLMxNZtr2fYv14vfWx1yjkgZ4jqVI8UFQXwafVz3LZrkt2LTh
	 5Z7Bpv+KGtgT9q9eAdvqyT+6fIJbE8WCzX++dns3kg7TPXRbQOE85J3onKDyUIXyOI
	 XBbuG4OtBtuPh0FaIjQGy2Af+25fntUiz4hk0l1k=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <ee4a88cb-3692-a0b2-1389-b60080de0bd9@raptorengineering.com>
Date: Tue, 5 Sep 2023 16:58:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 0/5] ppc: Enable full Xen build
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1693590982.git.sanastasio@raptorengineering.com>
 <332a7462-d0cb-154e-415b-e7f40b9b1421@suse.com>
 <7f0582cf-e78b-a62d-3f1e-b446acc82cf6@raptorengineering.com>
In-Reply-To: <7f0582cf-e78b-a62d-3f1e-b446acc82cf6@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/5/23 4:02 PM, Shawn Anastasio wrote:
> On 9/5/23 11:07 AM, Jan Beulich wrote:
>> On 01.09.2023 20:25, Shawn Anastasio wrote:
>> Another thing I wanted to ask: Would it be possible to configure
>> whatever mail client you use for sending patches to send plain ASCII or
>> UTF-8 text, not quoted-printable ones? At least for me, so far having
>> shoveled in most of your patches, that encoding gets in the way of
>> running a pre-apply-test with plain "patch --dry-run -F0" on all
>> patches (from a script I use for committing). I can help myself with
>> plain "git am", but sooner or later some patch will end up having a
>> collision with something else having gone in, and then I'll need to
>> manually clean up after the failed / incomplete command.
>>
> 
> If I'm understanding correctly, it looks like git send-email's
> --transfer-encoding=8bit [1] should do what you're asking. I'll do this
> for future submissions.

I've done this for my latest series dropping pseries support, but it
seems the messages that reached the mailing list are still encoded as
quoted-printable, despite git reporting that they were sent as 8bit.

I suppose my SMTP server is mangling the encoding, then. I'll look into
this some more, but hopefully the quoted-printable patches I send in the
meantime won't pose too much of an inconvenience.

Thanks,
Shawn

