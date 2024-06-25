Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DE0916093
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 10:01:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747388.1154780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM16i-0001Nw-5Y; Tue, 25 Jun 2024 08:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747388.1154780; Tue, 25 Jun 2024 08:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM16i-0001Lo-2L; Tue, 25 Jun 2024 08:00:52 +0000
Received: by outflank-mailman (input) for mailman id 747388;
 Tue, 25 Jun 2024 08:00:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SOoF=N3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sM16g-0001Li-7j
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 08:00:50 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09049467-32c9-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 10:00:49 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-57d106e69a2so5300264a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 01:00:49 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d3042fd72sm5700468a12.48.2024.06.25.01.00.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 01:00:48 -0700 (PDT)
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
X-Inumbo-ID: 09049467-32c9-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719302449; x=1719907249; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xMFMveTsrDFu7oHXTVTj4UzyhsFLtc2luN03Iw0FR/g=;
        b=f6FiwLouFpng4m9B9fQrvEEzqEWATcUB/zRRZER9sZCPOkhZ6WcXXaBFjb2Mgwa2vH
         /uJboV9g/QA0oqXqgz03K34myc2Qmw7b6s858EjJG1ZVKap+tnOh8Jxflnpw6pgv7Nnz
         VAPa4ACbJGm85nzn51Fy5m65JeDxrbbN+SnKlLmY9D1cJogGBptY6KVVnzotWAJLNXJc
         jNErax/YeN33hrdSakCY9KIuYlnNTKIOxqqydpuC6DV+LCv+5iilNpQPtoHSSSDvQo+B
         A425QYv3uUzwGjokDgoW0ZA7sEiP8EYGO4MZujXOnvqo1fmVk14tY+Cf8O10avHdOn5G
         AvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719302449; x=1719907249;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xMFMveTsrDFu7oHXTVTj4UzyhsFLtc2luN03Iw0FR/g=;
        b=hDpsfDgkqUT4q0ZmeTr11XzvkCE0ouniuRIfMmQjgbYYxLMXHW0HrxrHvgcw2DLCrx
         yw6/GbkYZyD0FFvnndP5DIrpTXPsWb5N++htqB6qdwY1WoH9TZGfLXYCKK7TH+2oMyDy
         Em0Inbj9JWSeDgLaE6zq0hhlAeHEL4ra/eqsw9mZqbY2HvJBNkMz8j68nQAvgsi9PgeT
         641kXpdLfSYoAdbFQAy9JbL7xPVoEgDOvGeHsY0kFK3D5uQvnoqtkbQifdQNJ1eJTSCo
         eMw/HLdoH19yHhWWWiS1GtKfQiBUYEhTn6xzCZ85yejKssWJtvPSpVcw+PmetpWTfmrF
         P/Rg==
X-Forwarded-Encrypted: i=1; AJvYcCU4dxPt5JXoUF/IPAEjoCYmFaPZJvanwmOCcDkryAIXZptjd/poZH77WNw1m4S2JZNlvOJHMQuyVJN4JXTht4DfO+wQJQvTcNYY6FOyL44=
X-Gm-Message-State: AOJu0Yyu7xFv1kPVB4tS3FPjRv4lDt9reApvoYwL+seHUeYOJgZLa4sw
	we3ORgbIIAIl8q6vYeRUNaXPjkeJSAL09CtGBfyw0AQcV2Xg15uU1ysnfXhuXik=
X-Google-Smtp-Source: AGHT+IEYpOiricPj+BbcZhZeT3mIjC3IS3FsodW93EVTO6yRoNEWydBJkAiXORvze561J4y58bMsXg==
X-Received: by 2002:a05:6402:3593:b0:57d:5442:a709 with SMTP id 4fb4d7f45d1cf-57d5442a847mr5857210a12.0.1719302448864;
        Tue, 25 Jun 2024 01:00:48 -0700 (PDT)
Message-ID: <9ab96725-858f-4b07-bb82-6c52c7ef4d44@suse.com>
Date: Tue, 25 Jun 2024 10:00:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19?] Config.mk: update MiniOS commit
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <a98ab069-407b-4dee-9052-40ab72890d47@suse.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <a98ab069-407b-4dee-9052-40ab72890d47@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.06.24 09:57, Jan Beulich wrote:
> Pull in the gcc14 build fix there.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


