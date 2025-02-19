Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E208A3BBAB
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 11:29:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892583.1301546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkhKb-0003GT-Ht; Wed, 19 Feb 2025 10:29:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892583.1301546; Wed, 19 Feb 2025 10:29:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkhKb-0003Et-FB; Wed, 19 Feb 2025 10:29:29 +0000
Received: by outflank-mailman (input) for mailman id 892583;
 Wed, 19 Feb 2025 10:29:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CKsl=VK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tkhKa-0003En-KR
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 10:29:28 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6530579b-eeac-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 11:29:27 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-439950a45daso10588815e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 02:29:27 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b439dsm17299925f8f.8.2025.02.19.02.29.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 02:29:26 -0800 (PST)
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
X-Inumbo-ID: 6530579b-eeac-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739960966; x=1740565766; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cGN63ssQSQ1fbWR9S0dHqJwvk8cMALoIER5e3ebUXYA=;
        b=PSzGTo79pD46Tb6O18R29XV5p1eLHthSF4F9q8GI4FE5eVxGKDWwL8TakS3iSTYQSh
         h/Q+hKGqgCJpz0x8WwwuB/2sEtvUun7R12eoUMMJggsAQ3en++2uA0BhC+fTHjSzv/dN
         0kCn78wNPARNxgnHBLGREnh2ukqrLzkrx6CIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739960966; x=1740565766;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGN63ssQSQ1fbWR9S0dHqJwvk8cMALoIER5e3ebUXYA=;
        b=qF6L0qpJC5+8unJG46cHbprae0a9jffgiSebBmKYF3a8F/hiNeTOHneSqIHtzeGKZT
         Hl09MLfUSRBqEMfyMZuwUJthj1tNO6cb9I8/vuW8UTv/SrDK8tS6UjVb5X3MVbtPnkiF
         uTw3KDhIw9k0ByhGzPrIZ/otfd5EWO+KSYifxb6ZNLH9ygtmQAp56NXOBwvYYFtOx5bi
         uLWfC3tPDig4qCA73X/GMhBMD46IWTzXSyvAQ/CK0XWh7i4+yRTQADwDV4tSJV0S3MPR
         Li3n5l8Lkil/kv2eFoFZ7ZZy7e6NZ2ycW2RsK1YtDEhYlw7C/WKENH5MCo9asMpWKHRE
         uMvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIZjVC6CT9b4wNYLY7zQwFKQni3ja0TNszGyrXZuU9mXKBE/Z3inbewf/jKc/3ehKUr7YTf5xkIZQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4M+3XRgCHfn8/4vKYmvUGNnoZu1CR1QsdyKd8PbVw6rWT4Yyf
	SF8smv39/X4nXECBAHQ+qEtduHaRIQnlKwGAI/5yc5j7aKRz1JoYp7DyBmoyJzM=
X-Gm-Gg: ASbGncs4ryYOgJH08YsX08QTwlGYAGDcchUiXXGRkt4Yug6TtLIzSO4hdogHKJFfHtk
	qpQkbHx5L6MMRplnNicsFCs3RBgzhr5xsWQoSbMh+KMnpKpi031TI1GvdrsdZfLTpsCeGRaGYcv
	axIqyjcxgz/60D5bG7iG7QDHALpPSKRuRh8w3d1aqOYLzJB2iv7qnve/otX/edxWuVZtqy7gIC4
	EC9SlKId0k9KeV4AnQFbX9Hy0EG6EGhnYqCZ0CAkvw0NBKlV/51O1fHCzlx4UQvdn+dcYN6aCxP
	LKM+PW5LF7+obPF46lWq7o29pUUZ5EsAxOip3Hrym889bFmUFVP9N8c=
X-Google-Smtp-Source: AGHT+IHWurD4GqlmMAIL0zYFdro4vJmQ1viWu9WlBAMqk4/Yzl5Ww+ODZT04E48dJj8PTQM5Cn36wQ==
X-Received: by 2002:a05:600c:470a:b0:434:f5c0:328d with SMTP id 5b1f17b1804b1-4396e752a98mr156622975e9.23.1739960966571;
        Wed, 19 Feb 2025 02:29:26 -0800 (PST)
Message-ID: <dc14cb80-29db-47ca-b03c-e8fa370279d3@citrix.com>
Date: Wed, 19 Feb 2025 10:29:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/PV: don't half-open-code SIF_PM_MASK
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <42688c2b-9f11-4c52-b83a-607374a858fd@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <42688c2b-9f11-4c52-b83a-607374a858fd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/02/2025 10:02 am, Jan Beulich wrote:
> Avoid using the same literal number (8) in two distinct places.

You say two places but this is only one hunk.  I presume you mean
SIF_PM_MASK as the other place.

In which case I'd suggest that this would be clearer if phrased as "Use
MASK_INTR() to avoid opencoding the literal 8."

>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Preferably with some kind of adjustment to the commit message, Acked-by:
Andrew Cooper <andrew.cooper3@citrix.com>

