Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6576995F643
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2024 18:17:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783514.1192832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sicO9-0007mq-5P; Mon, 26 Aug 2024 16:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783514.1192832; Mon, 26 Aug 2024 16:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sicO9-0007lI-2O; Mon, 26 Aug 2024 16:16:17 +0000
Received: by outflank-mailman (input) for mailman id 783514;
 Mon, 26 Aug 2024 16:16:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=89gm=PZ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sicO7-0007lC-HM
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2024 16:16:15 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82b0b463-63c6-11ef-a50b-bb4a2ccca743;
 Mon, 26 Aug 2024 18:16:13 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1724688967152238.96509307609676;
 Mon, 26 Aug 2024 09:16:07 -0700 (PDT)
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
X-Inumbo-ID: 82b0b463-63c6-11ef-a50b-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; t=1724688969; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BHUpdCv4xtLvallcq39ehOgYx81BGwSyNnQvYXM9OjDBSBqHaoJk9SUQYD3Ez/I1CHwKRWVcqmImjBLmMfjQTiJtWIYGRvm/DfXSEUWcBe03T7NREHoOdcxJdDCO9IHY3K8WzdNGcgVakU2/onsKUfQjSQ7gL13TV5/qP7R94mc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724688969; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aRn/Ig+uSKFwm9mRQX3/lTYc6Z3i4A++N191Oel+154=; 
	b=XTamXXWgSazumGrX/lvnv/YeEPnnSXgzl39gA9H2VJM/xBEW6AgZ5pvVqboJOX8oJ/jRf5U66Q5zT/HceulvRgMqd+Su5TXVnk2IhF5tQFrbLUW77Fe+Cx6SsPA1rRoDZw58ec0Rz1l7HbDeKwoSZJ/RQ/3rbnaM3ADcsV2WUeY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724688969;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=aRn/Ig+uSKFwm9mRQX3/lTYc6Z3i4A++N191Oel+154=;
	b=dhZb9gWfSdKLeAzVBinbCkaty05DSENge3ncxWdqIO7aQ5m6GLT47qJ0FW7KO/3g
	fwVRKB01XDTgNU6JokvrBpEfnZLEndokisnt3OivwotM1iyEbn/s8KL2U7D4VOyuvZG
	jlFBwYW0sLngKJPdQ8/a7cfmZGNnWFWexGTeTmYo=
Message-ID: <8304166e-cc8f-4811-95e3-3c4414ef7726@apertussolutions.com>
Date: Mon, 26 Aug 2024 12:16:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: PE/COFF image header
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?TWlsYW4gxJBva2nEhw==?=
 <milandjokic1995@gmail.com>
Cc: oleksii.kurochko@gmail.com, Nikola Jelic <nikola.jelic@rt-rk.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Milan Djokic <milan.djokic@rt-rk.com>,
 xen-devel@lists.xenproject.org
References: <2b747d672eeadc1150d3b84f0303e1d288311133.1721391876.git.milan.djokic@rt-rk.com>
 <728bb10e944a7ec28a67c2e9e62910632eb2366b.1721758832.git.milandjokic1995@gmail.com>
 <1e898a3c-b881-4ca8-99f0-48f51ed28098@suse.com>
 <CAKp59VEM6UWHM1Yu9NToFu9T4GfJpgKiXdAzA096KMVcMRqEsg@mail.gmail.com>
 <a84aaeed-6310-42fa-97e9-b391273c0132@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <a84aaeed-6310-42fa-97e9-b391273c0132@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 8/19/24 11:39, Jan Beulich wrote:
> On 19.08.2024 17:34, Milan Đokić wrote:
>> On Mon, Jul 29, 2024 at 1:42 PM Jan Beulich <jbeulich@suse.com> wrote:
>>> On 23.07.2024 20:22, Milan Djokic wrote:
>>>> From: Nikola Jelic <nikola.jelic@rt-rk.com>
>>>>
>>>> Added PE/COFF generic image header which shall be used for EFI
>>>> application format for x86/risc-v. x86 and risc-v source shall be adjusted
>>>> to use this header in following commits. pe.h header is taken over from
>>>> linux kernel with minor changes in terms of formatting and structure member comments.
>>>> Also, COFF relocation and win cert structures are ommited, since these are not relevant for Xen.
>>>>
>>>> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 36e4fc57fc16
>>>>
>>>> Signed-off-by: Nikola Jelic <nikola.jelic@rt-rk.com>
>>>> Signed-off-by: Milan Djokic <milan.djokic@rt-rk.com>
>>>
>>> This looks okay to me now, but I can't ack it (or more precisely my ack
>>> wouldn't mean anything). There are a few style issues in comments, but
>>> leaving them as they are in Linux may be intentional. Just one question,
>>> more to other maintainers than to you:
>>>
>> Are we supposed to CC someone additionally for approval?
> 
> No, you did Cc the right people afaics. You may want to ping the maintainers,
> though.
Should this not be submitted as part of a series that makes use of it? 
Would doing so not also address what declarations are actually needed?

v/r,
dps

