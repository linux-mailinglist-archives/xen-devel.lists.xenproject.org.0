Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F75FB15E76
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 12:47:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063788.1429525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh4Kl-0005ID-5l; Wed, 30 Jul 2025 10:46:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063788.1429525; Wed, 30 Jul 2025 10:46:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh4Kl-0005G0-3C; Wed, 30 Jul 2025 10:46:55 +0000
Received: by outflank-mailman (input) for mailman id 1063788;
 Wed, 30 Jul 2025 10:46:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2yBn=2L=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uh4Kj-0005Fu-Ox
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 10:46:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80dc46f4-6d32-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 12:46:52 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 1D55C4EE3C22;
 Wed, 30 Jul 2025 12:46:52 +0200 (CEST)
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
X-Inumbo-ID: 80dc46f4-6d32-11f0-a320-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1753872412;
	b=tq3nHhDury2ZTo5ubF5fotrKRZ91vGKZpTr5fxZYto3shw5eDOi1Ifs4BgRYhX13siDu
	 gdv29mgKtsrw3XcX9dtcT63jxv6r0xV1witU21MHdTA4F6VbLFTmitAbgB/VqqXkl/hB+
	 nQnJTihGg1Ma9VWaL5jxFpEiM6y/6CuQ4xLdo8z/pOonoJEZJ6n3diBaqiStNsLb4YyF0
	 ycSmXk+kJF+eP8DAPVAigYGuXiFK+w+eGyKkpFH5rESS5ex4KKTt68l7OPSipVKCgzjQU
	 djQYBcr36OChGITMru0sYNnliS73nCHiXXpQePvYi7qFHklJJCBQOM7tUFThWIlgM1mo6
	 S5ngMHhYP9dZWzsID2uJl8jPjzoIuCOXHaMi+nZ23/qUoj9luG32p5i4meb58G8y7Re09
	 hiifebCnRLSKOnYhySpxFjwpwv9zBtfX7Fm6BOUSvKTJyLBIrg4FwNYxHbvADEB0ssIIg
	 +f7hj8elewtDqI3TXCZ9W54Msu7xwxXWrxS1MVperRLc5ZKoS6GjA1zfeqaOpQ2XvbpPq
	 IWUllOekgQ716SvW7LIKGYDHYPz1joOw61ltNrchjPCZg5b0JGLVmQ13TCN/NCjxcSViO
	 r9K3OqRu4iPXSD6mFC1uiUg3zl3CvFUg+AUfOVEFACmxrdlTHG5NhNRdvYfwnLE=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1753872412;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=eMkPulg1lsZDNa1xvddMVBylp40dcQUhLrMmeO8hBjA=;
	b=El9uHvAQvNars3yW20piAQKZflb7yJoX2QYF6Frkwqz0atRwMTqLgdWSQgOv/TnVU79a
	 /jfJ2YDcTs+378HzxMyYjMqj/wuC3PZQO7Q3ermzufcF4fLH3M49jJsxuSZpxni/0exXT
	 NOpfTw8qA+fCjIw5OjHfqS6YfhBrRZKwaBY5JcBblpRzj8qE0zMaADEt7EKFxj/lfchlu
	 /8dHJgxD8ZrmQXm4PShjQDxcqZtY+0MX9BhMXlyUwH3wUdofIVnfudbTU+dOxxbrcTHyL
	 6vj/m0ARWTBHW1wBZ94LptcPBlvkd+zCZGe5dY1YI53z4pJp3D/H+rC/S52gEQCtjnxcP
	 YyguuRBtNvyofcyogTM/hDxrcKsCh3hpT6u8/2jUxdCzUesudDbVPvVxZDPKE8RI+1jVT
	 TWjdzzabdj4HwEc1nkjZ9xvMm6kw+j7IYsbFuj1hS5tSmyVOMzf3QgAlDfHgnW3ZQqQdM
	 lAUXHpq7bB9W0pcJVFX+Pmv7EBKeeJ46DcryjD2jkYISTNhxDLRw6mWzfvqg1dwC57WGg
	 a9Tw71Qu13i+4IBazmdi1NwmnI8j5ikmrn7hcWECc0Ajf8YTLweFjhek0LXm1iIJ33t/S
	 qgnqm59cpR3MThUbssCiTkvSh9+GXBHqwOV8LxrSnHnOn8P27iPJEQ0aZlvmWOg=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1753872412; bh=4FVGqWKMc8+DnRIQPrl6kK2CksDzSS98JURbzwsXwqw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nNwRceMisP7FZE2pLX4Ok5VI2ZG0MFEJVQDx9pAeUqAqFhKUvALGY0in194T/V8tW
	 myrgquqQb7sQBHx+gKbEBgbJpmNSk57VGsscgBLNXEf7cib57KQB0QAG7TYsotU1Er
	 n3AqvVrVRYAFtmD1HTkOPXh8oUSkHw0i9dJCLl4L3Q5LXH04uQHpGd1eFv7Go2iBrd
	 8qeAahF170WS74aduSY45aVUojSa1BBnZBeZNdiEjGkYym5eClNtOPZEQqt6ZGkAw2
	 GwB5D9jZ45JdX6jAzuYCDEhgdizZohPw89gW2GdOglfe2QO31+HbAjSxsCUgiwoVvx
	 Lw9xrp32KclNw==
MIME-Version: 1.0
Date: Wed, 30 Jul 2025 12:46:52 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 consulting@bugseng.com
Subject: Re: [PATCH v9 4/8] vpci: Hide extended capability when it fails to
 initialize
In-Reply-To: <562265e2a66b4eae06c4703a836e7d21@bugseng.com>
References: <20250728050401.329510-1-Jiqian.Chen@amd.com>
 <20250728050401.329510-5-Jiqian.Chen@amd.com>
 <8051d388-48f9-4878-8924-8e645f313238@suse.com>
 <562265e2a66b4eae06c4703a836e7d21@bugseng.com>
Message-ID: <e14eaf58cc6da7f0a0e8d75f8b6a8733@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-30 12:42, Nicola Vetrini wrote:
> On 2025-07-30 11:50, Jan Beulich wrote:
>> On 28.07.2025 07:03, Jiqian Chen wrote:
>>> +static int vpci_ext_capability_hide(
>>> +    const struct pci_dev *pdev, unsigned int cap)
>>> +{
>>> +    const unsigned int offset = pci_find_ext_capability(pdev->sbdf, 
>>> cap);
>>> +    struct vpci_register *r, *prev_r;
>>> +    struct vpci *vpci = pdev->vpci;
>>> +    uint32_t header, pre_header;
>>> +
>>> +    if ( offset < PCI_CFG_SPACE_SIZE )
>>> +    {
>>> +        ASSERT_UNREACHABLE();
>>> +        return 0;
>>> +    }
>>> +
>>> +    spin_lock(&vpci->lock);
>>> +    r = vpci_get_register(vpci, offset, 4);
>>> +    if ( !r )
>>> +    {
>>> +        spin_unlock(&vpci->lock);
>>> +        return -ENODEV;
>>> +    }
>>> +
>>> +    header = (uint32_t)(uintptr_t)r->private;
>>> +    if ( offset == PCI_CFG_SPACE_SIZE )
>>> +    {
>>> +        if ( PCI_EXT_CAP_NEXT(header) <= PCI_CFG_SPACE_SIZE )
>>> +            r->private = (void *)(uintptr_t)0;
>> 
>> Eclair regards this a Misra rule 11.9 violation. Elsewhere we use 
>> (void *)0,
>> which I then would conclude is "fine". But I can't say why that is. 
>> Cc-ing
>> Bugseng for a possible explanation.
>> 
> 
> Hi Jan,
> 
> I only see
> 
> 0|$ git grep "(void\*)0"
> xen/include/xen/types.h:#define NULL ((void*)0)
> 
> which is fine for R11.9 of course. As Andrew noted, I don't see the 
> need for the use of uintptr_t either.

Oh, I missed forms using a space before the pointer. In any case, from 
the rule's Amplification: "Note: a null pointer constant of the form 
(void *)0 is permitted, whether or not it was expanded from NULL."

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

