Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4066891473A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 12:19:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746475.1153535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLgmo-0000cy-HA; Mon, 24 Jun 2024 10:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746475.1153535; Mon, 24 Jun 2024 10:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLgmo-0000aT-EI; Mon, 24 Jun 2024 10:18:58 +0000
Received: by outflank-mailman (input) for mailman id 746475;
 Mon, 24 Jun 2024 10:18:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jLHn=N2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sLgmm-0000aL-MU
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 10:18:56 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28f560f2-3213-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 12:18:54 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-365663f51adso2876263f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 03:18:54 -0700 (PDT)
Received: from ?IPV6:2a00:23ee:1630:2367:cdfd:357d:df51:2d81?
 ([2a00:23ee:1630:2367:cdfd:357d:df51:2d81])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366383f6777sm9670790f8f.21.2024.06.24.03.18.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 03:18:53 -0700 (PDT)
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
X-Inumbo-ID: 28f560f2-3213-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719224334; x=1719829134; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lPI2iq8iDxnnEIYGr+y3RMlzH7xQgs2dCQgmLpydl30=;
        b=if/ZvATU6b+uzIyJBhksQU6SGV8pHFCcT7RjDFSrycyT0oUfbERbJYwOOK+ZGpycGw
         UDrhW2Ns/rgd4duRrjigZBl70KClBeqW9WkUNUFqOHlS4i593f3TT3hc8m+gKMqEU+zT
         aSHxkM0EtOKktZei/Xl4uesmACKCde8VF7P5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719224334; x=1719829134;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPI2iq8iDxnnEIYGr+y3RMlzH7xQgs2dCQgmLpydl30=;
        b=teQ0LghQoUi1FQ5dYdXGeHf0qVusQ243sxU8XSnLNRkd8vyAj+Ns4dvqQzoRyZi5sG
         9F4n4cLndtZSOKxsRkM+cu9H5gAG9wqz+mzTb8QLOt+EJuoDn5nAQIkMroKiMJoNwRH9
         K/C50/JNziPusxTGV37MVrqppuV0Ly+Ihjy7B68ahzDVB/Sx0FOvX1D/k0x+B31Hitxd
         QjzSv3k/XEQjpxRhaA2I8pJZ4mqchXETynhw826jl2WePOM0owK8OedrLNNTbShC6RLm
         PNv7o/H0+RQEeWcsSYSR3AgLySGzeq8gZI3iL4SIU9i5+4dVZnsUVYMhBusw90xV7+M6
         +WfA==
X-Gm-Message-State: AOJu0Yzel1yv4B8l2nxlVE3gzj5L0PZUpmA8WVB8L22mfWbLLDLd/hXa
	wglIOvCeKleuWi/b3C4jW+SjjmUcPEG54zbfDiVPal97xqbwbKN7mM+TqG9IrEM=
X-Google-Smtp-Source: AGHT+IGRz9OP+pBzuBn5q0CP5hnuYz8phF9rEA6YYRTqy1pQc35NEkbOCDQvUxr54bjjRPkV+oInmQ==
X-Received: by 2002:a05:6000:1448:b0:366:e586:9131 with SMTP id ffacd0b85a97d-366e58692bdmr3925885f8f.16.1719224333913;
        Mon, 24 Jun 2024 03:18:53 -0700 (PDT)
Message-ID: <a93f8078-a4df-4395-b7ad-61d2fc38e18d@citrix.com>
Date: Mon, 24 Jun 2024 11:18:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 v2] tools/xl: Open xldevd.log with O_CLOEXEC
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240621161656.63576-1-andrew.cooper3@citrix.com>
 <ZnWwbJiD6eG85VY9@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZnWwbJiD6eG85VY9@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/06/2024 5:55 pm, Anthony PERARD wrote:
> On Fri, Jun 21, 2024 at 05:16:56PM +0100, Andrew Cooper wrote:
>> `xl devd` has been observed leaking /var/log/xldevd.log into children.
>>
>> Note this is specifically safe; dup2() leaves O_CLOEXEC disabled on newfd, so
>> after setting up stdout/stderr, it's only the logfile fd which will close on
>> exec().
>>
>> Link: https://github.com/QubesOS/qubes-issues/issues/8292
>> Reported-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Anthony PERARD <anthony@xenproject.org>
>> CC: Juergen Gross <jgross@suse.com>
>> CC: Demi Marie Obenour <demi@invisiblethingslab.com>
>> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> Also entirely speculative based on the QubesOS ticket.
>>
>> v2:
>>  * Extend the commit message to explain why stdout/stderr aren't closed by
>>    this change
>>
>> For 4.19.  This bugfix was posted earlier, but fell between the cracks.
>> ---
>>  tools/xl/xl_utils.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/xl/xl_utils.c b/tools/xl/xl_utils.c
>> index 17489d182954..060186db3a59 100644
>> --- a/tools/xl/xl_utils.c
>> +++ b/tools/xl/xl_utils.c
>> @@ -270,7 +270,7 @@ int do_daemonize(const char *name, const char *pidfile)
>>          exit(-1);
>>      }
>>  
>> -    CHK_SYSCALL(logfile = open(fullname, O_WRONLY|O_CREAT|O_APPEND, 0644));
>> +    CHK_SYSCALL(logfile = open(fullname, O_WRONLY | O_CREAT | O_APPEND | O_CLOEXEC, 0644));
> Everytime we use O_CLOEXEC, we add in the C file
>     #ifndef O_CLOEXEC
>     #define O_CLOEXEC 0
>     #endif
> we don't need to do that anymore?
> Or I guess we'll see if someone complain when they try to build on an
> ancien version of Linux.

I double checked, and it turns out it was an FD_CLOEXEC, not an
O_CLOEXEC which xl was using, so we don't have a pre-existing example.

Therefore I've re-added this at the top of xl_utils.c

~Andrew

