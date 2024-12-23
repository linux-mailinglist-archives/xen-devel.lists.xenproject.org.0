Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DACF9FAD84
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2024 12:12:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.862869.1274405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPgLN-0006iO-0q; Mon, 23 Dec 2024 11:11:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 862869.1274405; Mon, 23 Dec 2024 11:11:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPgLM-0006fF-Tp; Mon, 23 Dec 2024 11:11:24 +0000
Received: by outflank-mailman (input) for mailman id 862869;
 Mon, 23 Dec 2024 11:11:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j4VI=TQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tPgLL-0006f5-0A
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2024 11:11:23 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3c6be30-c11e-11ef-a0da-8be0dac302b0;
 Mon, 23 Dec 2024 12:11:21 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-54025432becso4281582e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Dec 2024 03:11:21 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f6089sm1238049e87.40.2024.12.23.03.11.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Dec 2024 03:11:20 -0800 (PST)
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
X-Inumbo-ID: a3c6be30-c11e-11ef-a0da-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734952281; x=1735557081; darn=lists.xenproject.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aADORoeSZ5P/X9QlciiUFxdsMhSfUKXl+bCcdeuZmrY=;
        b=PrYqTCkBvYbJEkmf4W75gx/mI2OqiftkXq82eWSkDCYPsxcnx9HBY9e/tJF+jzfMYG
         27PlsYtFL88qWBcPLQEeGIwkdpV+GRW1N+j+E1BpwFM/MoQWzJ7T8yDFP6OkKkrPUSsR
         2kHVweISYgjmI5X4XN0bFkxRxSYNwIiSKUg1Ig4yNqVYZFnLQL0KJEuPCdrQz2hE4aa8
         2kHNnWYqFs9FjQs8lse7sTlfjM7ojY/fY1qY115rlIGW+BnoQ7gMb2jmwnNhWPgr+VCU
         IuO/YYUCqsFOgf6pnQG+QXu+pFI4yhx1xyonP6gNdJLv+MxziN8If5ASU9ubfO2sBL4a
         QU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734952281; x=1735557081;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aADORoeSZ5P/X9QlciiUFxdsMhSfUKXl+bCcdeuZmrY=;
        b=E8bSJYopduI//I430yRRhs5EfL+2gzek03785fnDti/ZJzsKEVs/hotuao+aARGUk+
         r85W4xllVZCNOFgFXJ+XrBppgH76nE3ljEH6oZBSrF2rK5EraY86FOhV++ZN+MCFqkkg
         y3gKOn8nSSHr02m7HETelk5e+lRIJqdzgCribySzlf8L+tbw/Y2qwfrTRyUgDx9+m5jA
         TZeXg+zwzbrOc2XVBm0tFRF/Xa8VwGOOTxiiCB6m4BlQmIdUp5rxb9gQuvbdYC1oM4V4
         i1ZXl2N9ofUhAJBC1gxWIIMkN0I79jRQ6fOuizoA6bhIY7SpKUdXQd1VU+b1VZS+3sSD
         m1gg==
X-Gm-Message-State: AOJu0YyksLkSouaQ5xBLwLrq6nRLcxBYXJ5e/uoMJAR5/U67kSlZ/JwS
	aNyi1/M3WjYf5EUztxLSmQazpyBEq5MPvtN0rtvQVKi7vfkYrgyknA8bYO22
X-Gm-Gg: ASbGncsuKxVuwO88DSX8TlbQlqVuakEQvglOXzbSLZbAxQkuG33i9Jby3xx0va+ggXW
	hnGD574xCqN5Q/q6LITJGLQrD7MbHT1I80sGQ47JkJp3RGfJiHUg0NvqDUbObvrYUIirn2/Yi6Z
	pWxyiCvG+1REfUYdEi3sbqm/2ofojc06WCaTLacdOLW0uP0fRM7ODhhS5h8Nbd9+MgE4y6zLGKc
	yMoI2NcS4X7k0azfg1NP4lNLtr7Ynkuhs18oYBHhKmpaNiJrA7g0NLIMqm+2Ux1ToeyMQ==
X-Google-Smtp-Source: AGHT+IHmsP3rC5aP/PQCVV1cWTCP7n2djNeR+NJo7/3X74+RCSp9gu5ftq2bozGxSIYLtbncocd1Rw==
X-Received: by 2002:a05:6512:3c83:b0:542:2e09:637b with SMTP id 2adb3069b0e04-5422e09638dmr2380126e87.11.1734952280428;
        Mon, 23 Dec 2024 03:11:20 -0800 (PST)
Message-ID: <73ce787b-5424-415c-a063-d996daab44ed@gmail.com>
Date: Mon, 23 Dec 2024 12:11:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Community Manager <community.manager@xenproject.org>,
 committers@xenproject.org
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Code freeze date for Xen 4.20 is January 17, 2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone,

The code freeze date for Xen 4.20 is January 17, 2025.

Straightforward bug fixes may continue to be accepted by maintainers
beyond this point. ( No release acknowledgment is needed until the start
of the hard code freeze which is going to start after January 17 )

Thanks and have a great week!

Best regards,
   Oleksii


