Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF9B7F5F91
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 13:54:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639711.997363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r69Dg-0000xy-9q; Thu, 23 Nov 2023 12:54:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639711.997363; Thu, 23 Nov 2023 12:54:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r69Dg-0000wE-6e; Thu, 23 Nov 2023 12:54:12 +0000
Received: by outflank-mailman (input) for mailman id 639711;
 Thu, 23 Nov 2023 12:54:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XtUW=HE=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1r69De-0000w8-IK
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 12:54:10 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64ac9cb8-89ff-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 13:54:09 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-332e3664665so317459f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 04:54:09 -0800 (PST)
Received: from [192.168.13.100] (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id
 x12-20020adff64c000000b0032dcb08bf94sm1590693wrp.60.2023.11.23.04.54.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 04:54:08 -0800 (PST)
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
X-Inumbo-ID: 64ac9cb8-89ff-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700744049; x=1701348849; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HZIchAkcO0//9C5nqftIicLiV2zh6+6vSKtm2NieiM0=;
        b=l4JJ+/wB1VyhIiklMq6sLnZaauqfGg25Vqo+JJ4NrLdypgtxvE6CB2hGG75r2go2Sz
         LZxuskjMXYyFGrka27gxN0TdePO9mEbhBRVbDzS7GG0nN8i5GxN0c8PHuNtMBXn5uQa0
         SlqCSuy/B1Ipaytu6BEJHvuaslL8z+SQc51aJgy1CjYNBno85XyQiOfq5QUCd1XpIirj
         9h1YN8lm/EdKPGVVFy2i61NoriVepC7fG4oxc9au9EqpMO0Opx0GMhCxjzV5CLy2V2QR
         lGtegi+6noy5RYyDhVNiRl24khXYRq3qzaGp2HlZY1dG+/xU8CWzZjdFoxXjrd9PgeeP
         d3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700744049; x=1701348849;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZIchAkcO0//9C5nqftIicLiV2zh6+6vSKtm2NieiM0=;
        b=HGec+b51RAO7Fx7L2FbEc/nz5Z7KTE/W3kH3J/zazHt3R+Cth8IjAeEBcgM9WFKOHV
         upkQD2+WVV3MBb2X9nknxu6ZfbWUSIUBt0yEUK3zzmmsyImjs09MJCiee4IUfVN18l6P
         0OOMQ5gJCrrc4qKVCrhvlJc0JPFNrI7gJeqnXUayw6nB7AKxfn9wJqubuwqfgRilZTCN
         7RVBceBz8VQqywvSQmu9lOCv0VZuC9BEPjQAyiHVtZqPcU+4qa4gP96knqfTTsdCvlpO
         PnNT0y9wtfz2YOgIe0s/bg3xAxOpLPB0kTyAsP+4b+NhAl031EGQwP5L8zPU3pqh6Y57
         KSCQ==
X-Gm-Message-State: AOJu0YxP+pMOdu/hicJ61wU6JYzWXnkJEhXSC5YBk+zmU2rNUYTboZuQ
	zJu6LMueu/dA2wE1ldbTkxk=
X-Google-Smtp-Source: AGHT+IFujjuk0/ucGpYUlc6IACHFhCshwdqxfv5BZ3tZlcL7bRzD1bBfZyNAYEFctx1owHEK4qc5Hg==
X-Received: by 2002:a5d:5983:0:b0:32d:5870:8b8a with SMTP id n3-20020a5d5983000000b0032d58708b8amr3092264wri.56.1700744048752;
        Thu, 23 Nov 2023 04:54:08 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <ef7bed62-03b4-4759-8366-730ec6f3004b@xen.org>
Date: Thu, 23 Nov 2023 12:54:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 4/6] xen_pvdev: Do not assume Dom0 when creating a
 directory
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Julien Grall <julien@xen.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
 <20231121221023.419901-5-volodymyr_babchuk@epam.com>
 <b04daedc-ba6a-4109-8e23-fbcd023bcfec@xen.org>
 <alpine.DEB.2.22.394.2311221428570.2053963@ubuntu-linux-20-04-desktop>
 <ce719f35e72a9387fc04af098e6d688f9bbdca4e.camel@infradead.org>
 <alpine.DEB.2.22.394.2311221508270.2424505@ubuntu-linux-20-04-desktop>
 <a4e6a62a7cfe756344a1efcb8b2c3cfb1e50817e.camel@infradead.org>
 <alpine.DEB.2.22.394.2311221515010.2424505@ubuntu-linux-20-04-desktop>
 <87r0khz6zj.fsf@epam.com> <87cyw1z61i.fsf@epam.com>
 <dce4efb0-4fdc-404c-8e5d-c90ed732eb8a@xen.org> <87bkbky9bb.fsf@epam.com>
 <5941AF2D-71E7-4A5B-A519-25F87F90DC05@infradead.org>
 <87v89swtmz.fsf@epam.com>
 <C2DEE963-41CB-4377-93FD-BD9FB500926F@infradead.org>
Organization: Xen Project
In-Reply-To: <C2DEE963-41CB-4377-93FD-BD9FB500926F@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/11/2023 12:27, David Woodhouse wrote:
> On 23 November 2023 12:17:57 GMT, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com> wrote:
>>
>> Hi David,
>>
>> David Woodhouse <dwmw2@infradead.org> writes:
>>> Which PV backends do you care about? We already have net, block and console converted.
>>
>> Well, this is all what we need, actually. Even console only will be
>> sufficient, as we are using QEMU to provide virtio-pci backends, so both
>> storage and networking should be provided by virtio. Are you proposing
>> to just drop this patch at all? I believe we can live without it, yes.
> 
> Yeah, I think you can drop anything that's only needed for the legacy backends. I'm tempted to make a separate config option to compile those out.
> 

I think that would be a good idea. The other legacy bacckend that we may 
need to care about is xenfb... not so much the framebuffer itself, but 
the mouse and keyboard aspects. The XENVKBD and XENHID drivers expose PV 
mouse and keyboard to Windows instances so it's be nice if we can avoid 
the backend withering away.

   Paul

