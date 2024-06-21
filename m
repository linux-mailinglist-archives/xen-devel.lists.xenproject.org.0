Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0273D912C01
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 18:59:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745417.1152554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKhbT-00053f-Qw; Fri, 21 Jun 2024 16:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745417.1152554; Fri, 21 Jun 2024 16:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKhbT-00050h-Nf; Fri, 21 Jun 2024 16:59:11 +0000
Received: by outflank-mailman (input) for mailman id 745417;
 Fri, 21 Jun 2024 16:59:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FH9a=NX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sKhbR-00050b-Dn
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 16:59:09 +0000
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92bdb3a2-2fef-11ef-90a3-e314d9c70b13;
 Fri, 21 Jun 2024 18:59:08 +0200 (CEST)
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-7955e1bf5f8so141669785a.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Jun 2024 09:59:08 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79bce89af16sm101789985a.2.2024.06.21.09.59.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jun 2024 09:59:06 -0700 (PDT)
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
X-Inumbo-ID: 92bdb3a2-2fef-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718989147; x=1719593947; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oLkshFS3LRs1A7FC6l5i5G7juFdfY0j03SZUdzSQzuk=;
        b=W0BReziIvnrtwwbR4yZo1zneKbd5zNoAuNJ49Ci70jGmhUr7CV5sBHMHKXM8EkEaIl
         F38i82gATmuJws+QqEX6FoUwfdIDnbE7FyOWPhJqWbFsampGoKOGt4HjVlPtNEed5buN
         MGf9EgI4pOmDseVZLmW3ngClGhqYrA18h2jg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718989147; x=1719593947;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLkshFS3LRs1A7FC6l5i5G7juFdfY0j03SZUdzSQzuk=;
        b=ofOdRr58x5VGDa0CHhQ5reQn97R2ruw0izLx0T/suq21Vtjgi9iNh3rZEkEdePqcOx
         8Ofjf1urMuxXjwvdre/wVOiDk/sJNeNKN11qotwmGvG36HJlp/NidEYtCXiEfAHbwpqZ
         k8dyTU+uyIql3hqk+GQ2DOsY1nC86e7m/GnkdsxF5+HOmKFNSZnB4+2AjEsQsd+1yxGO
         fHqTx1Cc0o2dfdl7filvYw2eYLEwhNWxq8wK+zpEnaRqXtKuhUSIV3yV8fPtttL5eNjR
         6Rt8GqBv2KXOskD5ZFj51/U2w9RgRgGNEiIz+DM7j9G+3PanCzUho7u35eKuob8+1+45
         HtRA==
X-Gm-Message-State: AOJu0YzAbcyp8887Nph8gtGh+xKYE6JjYoiGEhF+3zcxIPmUcWjfeDm1
	Bfy3CTv0bUoVven8yd/0DHWBCpf/83rWPVF7LWBYxxk96JV0VKK4eMqsoJdquFc=
X-Google-Smtp-Source: AGHT+IE9TwKM16z+70T4ot2UcKfB+6/9rE9/UvcrdS8OB2Ch7Bvr+8KCFcjZG3uxMdmPq2jKuKExQQ==
X-Received: by 2002:a05:620a:4056:b0:795:75ae:b9e4 with SMTP id af79cd13be357-79bb3e1198amr1044819585a.3.1718989147173;
        Fri, 21 Jun 2024 09:59:07 -0700 (PDT)
Message-ID: <e6262049-21b4-4eb7-9f29-6d5983bfb212@citrix.com>
Date: Fri, 21 Jun 2024 17:59:04 +0100
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
>
> Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks.  I did originally have that ifdefary here, but then I noticed
that this isn't the first instance like this in xl, and I'm going to be
using that as a justification soon to explicitly drop support for Linux
< 2.6.23.

~Andrew

