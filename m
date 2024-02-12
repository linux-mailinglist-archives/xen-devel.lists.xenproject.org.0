Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9744B851BE0
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 18:44:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679688.1057297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZaL3-0000fm-T9; Mon, 12 Feb 2024 17:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679688.1057297; Mon, 12 Feb 2024 17:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZaL3-0000eF-QM; Mon, 12 Feb 2024 17:43:29 +0000
Received: by outflank-mailman (input) for mailman id 679688;
 Mon, 12 Feb 2024 17:43:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ADcg=JV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rZaL2-0000e9-F5
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 17:43:28 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a164212-c9ce-11ee-8a4c-1f161083a0e0;
 Mon, 12 Feb 2024 18:43:27 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a29c4bbb2f4so451620566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 09:43:27 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l19-20020a1709065a9300b00a3bd745325dsm415932ejq.150.2024.02.12.09.43.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 09:43:26 -0800 (PST)
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
X-Inumbo-ID: 3a164212-c9ce-11ee-8a4c-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707759806; x=1708364606; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HZrgOrSulvUKIjdRXKdZeWdaJEscFFMgBz2wVCOdlB4=;
        b=OeySRw5LcMGb7VpNl6GkiVLCC7r5PKeYGeb+dCZzdIj1uvwska61My7NCxWZSbBy6k
         EKc+Ij+VLbLcQGAlhex2H6NXL9+lgCMd0HuvJUK6+0EhRIRg55B+fI/WTbjOrvKbKv5c
         Am25I42OWlgi6W8wEzcMYGdkthFwqGjPUhX9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707759806; x=1708364606;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HZrgOrSulvUKIjdRXKdZeWdaJEscFFMgBz2wVCOdlB4=;
        b=EXy1NxrWKjZYzpzeke3kcqk77aIE6C2IFLpOKTo4+oRTxDTHqUyyr/leFa3rAPwZju
         BAcBlBNxcuF6he8VzZIGnXmjH+g8cWuTjHE5p0wYurW7tWjz6LOu6aD3ESc6M1SyK5fX
         MXeyIPAWsblqQ2T01tMd6WvzmuVtlSEoI26u4/ZB7hei7AuumzIekvuVdYDUyUskOJzf
         F23HZ3DvZvLXjatgP6wur7Y3gmFUhnKCxKEGmpY15l4tGjb/p6CpFvnL4p87PyqHdsTd
         W6a4lEYQWTNrG7O5cYrMHu7J4a8HMrDxzVFV1beWuAXdYVFSR+DteMa41lWhZTWFr9AB
         gTog==
X-Forwarded-Encrypted: i=1; AJvYcCWBXVy5g0D1FSIV9bCS1p0kLUy3lWd60A1LPQENPV/qCeJQNWF7S0hiz3wXrdXI46LxK15zo0JGq7q1sZublAJGNG6DKuBeNzzlWo0tiuQ=
X-Gm-Message-State: AOJu0YwKROjMq/U4law6BIHbMYjKJREIdnpDSdFZlK7tRXMLG7WSDIrZ
	FSAiXTp2EeeGVO7p9P3arHroWjVCNwC0+Ug+jw+u0QIucalgCjmpCRP09gJNJYzbRQ/McEm9i4v
	W
X-Google-Smtp-Source: AGHT+IHg4e9KswN9J3Z3eWFwEJk17ArjpbYFyZF6ZN6ntMWEa/S3umpsDbR25BeO+YWZ21lQm9zLMg==
X-Received: by 2002:a17:906:6c89:b0:a3c:5766:58d9 with SMTP id s9-20020a1709066c8900b00a3c576658d9mr3422994ejr.4.1707759806659;
        Mon, 12 Feb 2024 09:43:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW5d7M5KHAcOpPD4tUS3vaMdHSIz0ZCUjfsfhPepDFmU+gj/qeo3A6JodhmTmEg5Te+naFOiz+GvsghylR0PSuQ2PDW/e4vC+MVnrMe7fbBvYM2aLXu3O5s7kcAi+j+gThtAQi1GF7b
Message-ID: <2922b179-571a-4745-b204-7dc7e2beeeea@citrix.com>
Date: Mon, 12 Feb 2024 17:43:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: The "64bits time_t transition" in Debian/Xen
Content-Language: en-GB
To: zithro <slack@rabbit.lu>, xen-devel@lists.xenproject.org,
 1063270@bugs.debian.org
References: <51e993f4-c250-400c-bbf4-017a1dbf1c2d@rabbit.lu>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <51e993f4-c250-400c-bbf4-017a1dbf1c2d@rabbit.lu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/02/2024 5:27 pm, zithro wrote:
> Hey all,
>
> the Debian project is focused on the "2038 time_t" switch.
> So the maintainers of the Debian Xen package must ensure that all
> imported Xen code conforms to the new Debian standards.
>
> I was asked by Andrew Cooper to post here about this, I'll quote him :
> "So I had been idly wondering whether Xen would match up to Debian's new
> policy, and it appears not
> this topic really needs to be brought up on the xen-devel mailing list
> do you have any more details as to what has gone wrong?
> this is something we ought to arrange to happen in CI by default
> but it sounds like there's some work needed first"
>
> (Not answering the question because I'm just a messenger).

xen.git/xen$ git grep -w time_t -- :/
../tools/console/client/main.c:106:     time_t start, now;
../tools/console/daemon/io.c:272:       time_t now = time(NULL);
../tools/libs/light/libxl_qmp.c:116:    time_t timeout;
../tools/libs/light/libxl_qmp.c:585:                               
time_t ask_timeout)
../tools/libs/light/libxl_x86.c:516:        time_t t;
../tools/libs/toollog/xtl_logger_stdio.c:61:        time_t now = time(0);
../tools/tests/xenstore/test-xenstore.c:453:    time_t stop;
../tools/xenmon/xenbaked.c:98:time_t start_time;
../tools/xenstored/core.c:109:  time_t now;
../tools/xenstored/core.h:150:  time_t ta_start_time;
../tools/xenstored/domain.c:143:        time_t mem_last_msg;
../tools/xenstored/domain.c:188:static time_t wrl_log_last_warning; /*
0: no previous warning */
../tools/xenstored/domain.c:1584:       time_t now;
../tools/xenstored/lu.c:160:    time_t now = time(NULL);
../tools/xenstored/lu.c:185:    time_t now = time(NULL);
../tools/xenstored/lu.c:292:    time_t now = time(NULL);
../tools/xenstored/lu.h:32:     time_t started_at;
../tools/xentop/xentop.c:947:   time_t curt;
../tools/xl/xl_info.c:742:static char *current_time_to_string(time_t now)
../tools/xl/xl_info.c:759:static void print_dom0_uptime(int short_mode,
time_t now)
../tools/xl/xl_info.c:810:static void print_domU_uptime(uint32_t domuid,
int short_mode, time_t now)
../tools/xl/xl_info.c:847:    time_t now;
../tools/xl/xl_vmcontrol.c:336:        time_t start;
../tools/xl/xl_vmcontrol.c:495:    time_t now;
../tools/xl/xl_vmcontrol.c:504:    if (now == ((time_t) -1)) {
../tools/xs-clients/xenstore_control.c:33:    time_t time_start;
arch/x86/cpu/mcheck/mce.h:224:    uint64_t time;     /* wall time_t when
error was detected */
arch/x86/time.c:1129: * machines were long is 32-bit! (However, as
time_t is signed, we


I don't see any ABI problems from using a 64bit time_t.  The only header
file with a time_t is xenstored/lu.h which is a private header and not a
public ABI.

I guess we fell into the "could not be analysed via
abi-compliance-checker" case?

~Andrew

