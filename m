Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8639AC580A
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 19:40:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998673.1379405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJyGr-0006ut-5v; Tue, 27 May 2025 17:39:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998673.1379405; Tue, 27 May 2025 17:39:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJyGr-0006sK-2c; Tue, 27 May 2025 17:39:25 +0000
Received: by outflank-mailman (input) for mailman id 998673;
 Tue, 27 May 2025 17:39:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xrmh=YL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uJyGp-0006rR-Lm
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 17:39:23 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 865fc468-3b21-11f0-a2fe-13f23c93f187;
 Tue, 27 May 2025 19:39:22 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a367ec7840so2692381f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 10:39:22 -0700 (PDT)
Received: from [10.81.43.171] ([46.149.103.8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4dc1172ecsm5711170f8f.48.2025.05.27.10.39.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 May 2025 10:39:21 -0700 (PDT)
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
X-Inumbo-ID: 865fc468-3b21-11f0-a2fe-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748367562; x=1748972362; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QvXF0o55WDzckzvMIu7yAb1vLxPpKzgHIIhlrrwMM70=;
        b=fLIEGMu6opAH4jzJLqFXnMfFbfvppqMQR3UEyCcM680TndXg5ZccDLuIfJPmNQHYJ3
         zbmmlh/OcnJjMLpRDNT1X+CRD3AeXCBXpxXxY5j5YnGvFUU1yEzJzKzJ3Qg6kUOqJ4aq
         2ToivHDj0p0aqv9vMVMwHd0zv00wCsEFxF008=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748367562; x=1748972362;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvXF0o55WDzckzvMIu7yAb1vLxPpKzgHIIhlrrwMM70=;
        b=D4Ub+U3TXzU/5/o6oMMr8MKkW42+YN0UuuSaIIFaneZbt3WbigSXTpxZRDlbADgTJK
         RmBd8WgM+9bgWHs0B9MykRYcrRDesqtdlcalnYpeuVpHbR/zkpsmDipqlUtSlu2J6OLI
         MYR/JPv/CI+yRmA3fALay94SWPKA3NXWkKRtEFqxROYZv5PNz0+aBPGpaG9N60DCI6K5
         WoNsVUpOVOsnEEm6pEQwOa0uSavfKhomCiCKkxjDqeoI1/nM4ZTRDNKveGZIvZZUizC4
         tjlCnvqsOrKvUH8hJAvP0f+L6zBbBLh/JoQk7+sPVK/VSA/BalLn475hY2EPU3h6TZvW
         jxBQ==
X-Gm-Message-State: AOJu0YzGm9RozNe23zUUWP9tcK1PDeZCvUmnY0sn8qySMh+CGJQXqmSV
	bXKzrFTHf6gcC2KwbWi1jCQkx3bjtGqOfTWnG6sgCFBuAmKaSWqDQWOrTUYwBRMx1FE=
X-Gm-Gg: ASbGncvAl7/BfXyciZx3iGaEkU7J7iJVIePjPTefT1dpeUWOEqkjF/y6DFeN//JFrKA
	sp+FClcAfm0lZ4o8N2KfiUwGUmd6BJXSW7Ihw1bKs1+ws/YlSc6SEXzTclgiQdE9ZSlb1kwshtx
	yCZroqR+J5vFnja9EcHFtVSUYLmUURbXP4kYCL6rDH+/PU8ZtKrzVgE+MTGHqXt14NXFas2HS3p
	MZG97qEBEc5jwnEtQjTgzPNklJB4JbroY6OR56KacLm9q4b7npKbZaQRe42anA9QIx6hTzc8NZI
	h533qCLjfAXI9MpKl8xd6wQ4gI689ZS50exzAIJx+yv1qZ5v3nimlorlOXP1
X-Google-Smtp-Source: AGHT+IFGP9Q9Ra0qDS6F9YtZKKUK7gp31Xom7HJcchn2POZnvWlQq1OWJJsv1FTEWbuIMCg2h7kXSQ==
X-Received: by 2002:a5d:64c5:0:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-3a4cb4c6b6amr13879968f8f.52.1748367561719;
        Tue, 27 May 2025 10:39:21 -0700 (PDT)
Message-ID: <9dc93703-7758-42a1-a4b3-49fa35b881ae@citrix.com>
Date: Tue, 27 May 2025 18:39:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ACPI: move scheduler enable/disable calls out of
 freeze/thaw_domains
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <974033e9ff0df3ce8a74efaa33f1cee1dcbdb030.1748340071.git.mykola_kvach@epam.com>
 <b19800c6-ef39-479c-a320-f2eabf546bf6@citrix.com>
 <CAGeoDV_Ees1hUbuZm0rGncOQB-5rHR9DaqYoSoL3MGVtFXBjvA@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CAGeoDV_Ees1hUbuZm0rGncOQB-5rHR9DaqYoSoL3MGVtFXBjvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/05/2025 5:17 pm, Mykola Kvach wrote:
> Hi, @Andrew Cooper
>
> On Tue, May 27, 2025 at 3:53 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> On 27/05/2025 11:04 am, Mykola Kvach wrote:
>>> From: Mykola Kvach <mykola_kvach@epam.com>
>>>
>>> The scheduler_disable and scheduler_enable calls have been removed
>>> from freeze_domains and thaw_domains, respectively, and relocated
>>> to their usage context in enter_state. This change addresses
>>> the concern about misleading function semantics, as the scheduler
>>> operations are not directly related to the domain pausing/resuming
>>> implied by the freeze/thaw naming.
>>>
>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>> FYI I've kicked off a run with this patch:
>>
>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1838715729
>>
>> which includes the real suspend/resume testing on several pieces of
>> hardware.
> It appears I made a mistake by failing to mark this patch as
> containing only non-functional changes.

x86 suspend/resume is sufficiently fragile that you only have to
threaten a change for something to break.

But yes, "No functional change." goes a long way towards helping the
reviewer.

~Andrew

