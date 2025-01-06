Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 945F0A023FB
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 12:08:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865683.1276942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUky9-0001mI-1p; Mon, 06 Jan 2025 11:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865683.1276942; Mon, 06 Jan 2025 11:08:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUky8-0001jU-V8; Mon, 06 Jan 2025 11:08:24 +0000
Received: by outflank-mailman (input) for mailman id 865683;
 Mon, 06 Jan 2025 11:08:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bFJS=T6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tUky7-0001jO-V3
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 11:08:23 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b2a3108-cc1e-11ef-a0df-8be0dac302b0;
 Mon, 06 Jan 2025 12:08:22 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4361fe642ddso149338765e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 03:08:22 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436604e9c2csm565421165e9.43.2025.01.06.03.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 03:08:21 -0800 (PST)
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
X-Inumbo-ID: 8b2a3108-cc1e-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736161702; x=1736766502; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QA+6CnC7STNLyxWzKdvUbKMKyonkRY/6cNTKgnECjIs=;
        b=Ai3r+r1FOZg0g7t7Pwa1irhFDrcOhyDNGI/V08JAepj9bUQP2vhqw3nEReftfsw85D
         enoxgVPWwEH96nXm/UGzW1AFc0uzg2QnQkrcJQaW50NcTTjMJNUp/pFltxGgO9/HAEtI
         cgY3VjMha1s3ab2SoOE8zaVdMJp4OGhDibLsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736161702; x=1736766502;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QA+6CnC7STNLyxWzKdvUbKMKyonkRY/6cNTKgnECjIs=;
        b=THjYMt9gMsWZ20tDDtdtVWH8aXoLp9Jst0rizV8d0J+K4Ho2HRkNPxFkawitcQ0Uem
         I6DaKQ6uQZhOkW+Ru853xgw+0pkR+PXLh1zxJ4KLg6l8QlsLy0BVC/8c72J8Dj7LVq6E
         FrP2clo8OgsS9I+j9//2iqKvKUzI2I9CuYLP7ySNZADMMWpZOZOTC+xx2bkfc8UApAeH
         aKZYAk/808fGYJ21BGsXVGwc4VCaMKcWl4ucQs33r1GXvgAVJY4FBm2qoUgCqPa3E4pk
         tLUqdMqfHyT0DyAfzqqFx4aPmu2e7veX4ENolxgEK6mBpcN3sYoZBdFTRFYQs/cC3rgY
         kqHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWugzMNp+SSXHShTJlMfyLmuAXUCLt/bA3ujWvbMIh3YAtRTuGBQATXXD3eeFNQJoBrZqoDffTkcfY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPmEOjdB7mV5DcXutqxv/FwhhT5+/PzQi+quEynn+dY2QT61Jh
	3Qci3waj+M3CkU+La88LpPebhx8zUiroriNLtUGP+/AbLWA9RGOCx2cRNdqLWkk=
X-Gm-Gg: ASbGncvouspCGAxoGSLJJl4uNoBIJ6u/HkTCWunrqprXYcLlGkvK/dKN2GvlBw/s42J
	MwixB0s23OT9C+0DouIou6WROfOysmCcox1xewcBq4CkHZkyXZHw70xCakXWyTZpGVHFRlv7QZa
	aB502kap6oF4JX0lC9mexntIeVG6ZeMG6MeUGvOutxwjSCDWGGHVfPnQVFDuewPBcLO/zyaN/WG
	jtNWalqRB6xDw+0Ez7InGaieRTvhwi/y7BT+K7lwqPQt8NOvelLsHE3C0F9zVNwn4R0p4WPanMv
	Ax0e9eGG9UGHlHa0XGDT
X-Google-Smtp-Source: AGHT+IHoV+3p3Died5QrJSWa/v+pbt6YKZduD2HMzmgv2QB4df1jM15W7R+pluyBOKowrLMjzvRMGQ==
X-Received: by 2002:a05:600c:524f:b0:434:a0bf:98ea with SMTP id 5b1f17b1804b1-43668643bb4mr508898465e9.9.1736161702390;
        Mon, 06 Jan 2025 03:08:22 -0800 (PST)
Message-ID: <0c8a13d0-04d7-4ed6-a8d8-a4423867fa3f@citrix.com>
Date: Mon, 6 Jan 2025 11:08:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] public/version: soften wording for deprecated
 sub-ops
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <bf8cc342-52aa-44ee-8bce-ce2be6406904@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <bf8cc342-52aa-44ee-8bce-ce2be6406904@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/01/2025 11:04 am, Jan Beulich wrote:
> These interfaces were - afaict - originally introduced this way on the
> firm assumption that the used array sizes would be good virtually
> forever.  While this assumption turned out to not be true for at least
> some of them, this still doesn't really render them "broken": They still
> fit their original purpose, and they are still usable for a fair subset
> of environments.  Re-word the comments accordingly.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

No.

The community voted and rejected this opinion.

~Andrew

