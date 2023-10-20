Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 197307D11DA
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 16:51:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619809.965491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtqpa-0004L6-Lm; Fri, 20 Oct 2023 14:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619809.965491; Fri, 20 Oct 2023 14:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtqpa-0004I2-IJ; Fri, 20 Oct 2023 14:50:30 +0000
Received: by outflank-mailman (input) for mailman id 619809;
 Fri, 20 Oct 2023 14:50:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nVdZ=GC=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qtqpZ-0004Hq-G7
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 14:50:29 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00b4fa49-6f58-11ee-9b0e-b553b5be7939;
 Fri, 20 Oct 2023 16:50:25 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-408002b5b9fso7403415e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Oct 2023 07:50:25 -0700 (PDT)
Received: from [192.168.13.103] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 o12-20020a05600c4fcc00b0040775501256sm2342656wmq.16.2023.10.20.07.50.24
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Oct 2023 07:50:24 -0700 (PDT)
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
X-Inumbo-ID: 00b4fa49-6f58-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697813425; x=1698418225; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1jRwNvQ3o6tcreojDyKypiRUSOV5yfFCWNDl/FiZPCs=;
        b=aDBPeIEA8QXqRWegQ1Eydru8ieihpyvSX3unBhySyfWrjYCRlkrzje+3SBTmtrMhwu
         iKMkU2CkOfhfCzcSGQ24B+EUKhiyjInx3O5RMB+tlr9mhMs4QUGvwvbsqeT44znGywAu
         OUAuLJdOPAuSmHsEEisO7h7JmEkPmf1vZeB8XmIO26HuDaUhVptD+EKhPFabLjWQbLAj
         ygs4TEBjmsOO4NTcXU9F04lTWvabmQ+5JJOtIX2b4vFY5PfPlxUcgBzoJ2wiqv5G4X4m
         rLouocdvFFyvOk0CfErQ0i9BLJhnwK4e9WJ0taGWIu6pKlOMHsa5l2Sr0vTvPEP2yzWs
         Vgzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697813425; x=1698418225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jRwNvQ3o6tcreojDyKypiRUSOV5yfFCWNDl/FiZPCs=;
        b=AW5NXVsCnPRhIfzcNVAbpTUR9pZz59TU1GVNBoQJKqD0QkalOadEvjC1S5ddk4efaM
         Hr7tDQFruzCx1Ma2r8L0WvytLqXQZtqbI4SQTwhKNmYxw2MT9S0hGY6WuhA79VpCE4/z
         jCxGIzYif3v97IdT/fkrkUUZQqoGDuxw4/QZdljLnsQ9ORSEg3eRfgVN81IVvOqOpaHg
         eaU8T+G/C2CgUQfDnxHYABqJ5kpEyV/7FhEU3o1hCVSujiWYsPdBKzJR72oozw7G/jSs
         1ZnrVAODuuKLn51wiG3/SwgrwHJt/W1SRpxz3RFWwaw/e1X7QngbI3Z7ETx2hbSyFHJ7
         TPfQ==
X-Gm-Message-State: AOJu0YwODAO5Joz/2zw9L8bFduWAODzpypOVFFN70gDEJzwnxzIPIsF3
	QmM1Z6jViHxmYK3GLrZ2NGZJ0sd8Z0SdXDLL
X-Google-Smtp-Source: AGHT+IHjO4Aw9nXybugHdrEZpZjqso7sqE90kmQFIek/t3HWdPLur76S/E/sl2K05C1pzhFbYZT0Gg==
X-Received: by 2002:a05:600c:4506:b0:405:dbe2:df10 with SMTP id t6-20020a05600c450600b00405dbe2df10mr1678680wmo.35.1697813424777;
        Fri, 20 Oct 2023 07:50:24 -0700 (PDT)
Message-ID: <0c2f1fd0-22d2-419b-8fc3-4788563fe9f2@gmail.com>
Date: Fri, 20 Oct 2023 15:50:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH] ns16550c: avoid crash in ns16550_endboot in PV shim mode
To: xen-devel@lists.xenproject.org
References: <de07d56188f13e222ddaa1b963c20f8d7d61350e.camel@infradead.org>
 <14914ea1-2d2b-46e2-9933-2b7414acb7ba@citrix.com>
 <f1ea054608f4ae38293f89bcd84c6937538f245b.camel@infradead.org>
 <f5603457-8bee-40b9-9ea2-d604abe4ee53@citrix.com> <ZTKAqBILUBNelYCS@macbook>
 <7e1fb34868adfa51f1a48eb8d77f4b92643db85e.camel@infradead.org>
Content-Language: en-US
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <7e1fb34868adfa51f1a48eb8d77f4b92643db85e.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/10/2023 14:37, David Woodhouse wrote:
[snip]
>>
>> [0] https://elixir.bootlin.com/linux/latest/source/drivers/tty/hvc/hvc_xen.c#L258
> 
> I'm not convinced I believe what the comment says there about evtchn 0
> being theoretically valid. I don't believe zero is a valid evtchn#, is
> it?

gfn 0 might be valid, but I'm also pretty sure evtchn 0 is not valid.

   Paul

