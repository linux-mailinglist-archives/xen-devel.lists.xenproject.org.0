Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EBD8C7898
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 16:47:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723431.1128290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7cNe-0002Db-Ha; Thu, 16 May 2024 14:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723431.1128290; Thu, 16 May 2024 14:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7cNe-0002Ah-Ee; Thu, 16 May 2024 14:46:50 +0000
Received: by outflank-mailman (input) for mailman id 723431;
 Thu, 16 May 2024 14:46:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O3ow=MT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s7cNc-0002Ab-AD
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 14:46:48 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1eadd530-1393-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 16:46:46 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a59a387fbc9so366977266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 07:46:46 -0700 (PDT)
Received: from [10.80.5.21] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781d350sm987052566b.23.2024.05.16.07.46.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 07:46:45 -0700 (PDT)
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
X-Inumbo-ID: 1eadd530-1393-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715870806; x=1716475606; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jsp98pY2/VuhI4d3314NHm3LuKttPruFuyIFk+c0kVI=;
        b=ih4nwJhYQpuRiPnwUi/4YX0QzR3zexxM21PIkTYmLx8eZa1eChTDoBUNL+mjMI5fG/
         +7HVod6C/crScqGqE0vQ6150+qtiQH/2GtEtrylGqOwySo2Z+Dw7ZxzBu3IfkjQhzubW
         Bu+XOaKd5FyV5DNYY2zaAemt6Pr+5r1g+hu3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715870806; x=1716475606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jsp98pY2/VuhI4d3314NHm3LuKttPruFuyIFk+c0kVI=;
        b=G+MxYFBWWYyCGVqr6qehvNVOYdfcSLvV093WfuMTy95P8N6VYhKbWzw6MtZgPgVEP7
         vZsc4B8I7sdzhXnkOstb0PJeKw/uhPYEA2HmuGSQRjlC3oFZjfZvBI3RoiDUB/SSnslR
         c7WLKoAQDCMXy0Odk0QIvPSyrDN/LJUA5jkjdCGCQln4cMkmptF5dGLq9TcF0LayjWwp
         KWv8sfBvh+J/ja0hbSwKK3Wv1hwrI+JfZrb6OpSNMxDL9t2FEuB7y2ZqAXcI43N/VYqy
         y+iPS4cdEs70dSAzEdBekfU0HH6rpF48JZDNJjzFIDwKv9GyEYfDHSSusoAPuTHJwhww
         ecsw==
X-Gm-Message-State: AOJu0Yx8cNNO619yOJ7mVlZkhcYIxckeM8klV7RgeFlFyUH7QXqEoJea
	6Q1OBiu7cFd5+xskErNmwokcldeKDKrbSMwsJ+dUR6TYDnItSpDFS5jF2LLXC+Q=
X-Google-Smtp-Source: AGHT+IHSWvC31JTUtyx26mZPc9St04wgzrLKBoXO2cvY7dolOMcBeSskSOlZ0Qz1XrTL4uVePPjykQ==
X-Received: by 2002:a17:906:5fd5:b0:a59:c28a:7ec2 with SMTP id a640c23a62f3a-a5a2d5d49bemr1145265966b.41.1715870806228;
        Thu, 16 May 2024 07:46:46 -0700 (PDT)
Message-ID: <26f1627c-4325-42f0-bbb1-0bd9be35bbce@cloud.com>
Date: Thu, 16 May 2024 15:46:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools: Add install/uninstall targets to
 tests/x86_emulator
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony@xenproject.org>
References: <20240516110710.3446-1-alejandro.vallejo@cloud.com>
 <ZkXvdWf2mVkPW458@macbook> <7965ba74-9177-44b7-9253-7ab5a77fd88f@cloud.com>
 <ce573d24-1d52-48a8-b3f0-8636dacd5c9b@suse.com>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <ce573d24-1d52-48a8-b3f0-8636dacd5c9b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 16/05/2024 13:37, Jan Beulich wrote:
> On 16.05.2024 14:29, Alejandro Vallejo wrote:
>> On 16/05/2024 12:35, Roger Pau Monné wrote:
>>> On Thu, May 16, 2024 at 12:07:10PM +0100, Alejandro Vallejo wrote:
>>>> Bring test_x86_emulator in line with other tests by adding
>>>> install/uninstall rules.
>>>>
>>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>>>> ---
>>>>  tools/tests/x86_emulator/Makefile | 11 +++++++++--
>>>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/tools/tests/x86_emulator/Makefile b/tools/tests/x86_emulator/Makefile
>>>> index 834b2112e7fe..30edf7e0185d 100644
>>>> --- a/tools/tests/x86_emulator/Makefile
>>>> +++ b/tools/tests/x86_emulator/Makefile
>>>> @@ -269,8 +269,15 @@ clean:
>>>>  .PHONY: distclean
>>>>  distclean: clean
>>>>  
>>>> -.PHONY: install uninstall
>>>> -install uninstall:
>>>> +.PHONY: install
>>>> +install: all
>>>> +	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
>>>> +	$(if $(TARGET-y),$(INSTALL_PROG) $(TARGET-y) $(DESTDIR)$(LIBEXEC_BIN))
>>>> +
>>>> +.PHONY: uninstall
>>>> +uninstall:
>>>> +	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/,$(TARGET-y))
>>>> +
>>>
>>> FWIW, should you check that HOSTCC == CC before installing?  Otherwise
>>> I'm unsure of the result in cross-compiled builds, as the x86_emulator
>>> is built with HOSTCC, not CC.
>>>
>>> Thanks, Roger.
>>
>> Right...
>>
>> More generally, should we do s/CC/HOSTCC/ on all compiler checks? I see
>> no particular reason to do them on $(CC) rather than the actual compiler
>> used during build.
> 
> No. There really is a mix here, intentionally. Anything built through testcase.mk
> is using CC, and hence respective checking needs to use CC, too. That said, I
> don't think the split is done quite correctly just yet, which may raise the
> question of whether having the split is actually worth it.
> 
> Jan

I'm a bit puzzled by this. Why do we compile pieces of the test binary
with different toolchains?

At a glance it seems inconsequential in the native case and
fully broken on the cross-compiled case (which I guess is what Roger was
hinting at and I failed to notice).

Why the distinction? What am I missing?

Cheers,
Alejandro

