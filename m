Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A57E9BC5773
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 16:41:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139828.1475052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6VLp-0007AR-Ax; Wed, 08 Oct 2025 14:41:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139828.1475052; Wed, 08 Oct 2025 14:41:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6VLp-000785-8M; Wed, 08 Oct 2025 14:41:09 +0000
Received: by outflank-mailman (input) for mailman id 1139828;
 Wed, 08 Oct 2025 14:41:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bWZK=4R=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v6VLn-00077z-Rx
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 14:41:07 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1efc3e7-a454-11f0-9809-7dc792cee155;
 Wed, 08 Oct 2025 16:41:05 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46e6a689bd0so58589955e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 07:41:05 -0700 (PDT)
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net. [92.22.57.86])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fa9c07a83sm45134455e9.6.2025.10.08.07.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 07:41:04 -0700 (PDT)
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
X-Inumbo-ID: d1efc3e7-a454-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759934465; x=1760539265; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HZVp7ACU99LamnB5LXLHsbzeB7bF3mcAoDiI0sNj7IQ=;
        b=kRl2fFIeqvx0ChUgLPOhIf4x3M2btxF+fuE6lt1EEK4ygpj1kmR7AVaMqda8W5ewoL
         hzwL19AqdxkKfWd1EGrVZuZ1BJH+u/gmUBtDy9jH5joL9lxZBF6TqGuq4L5BFixHxzp5
         C0Mr+BMnlWIJvKwXePWCfl2CWLikqKicagndk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759934465; x=1760539265;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZVp7ACU99LamnB5LXLHsbzeB7bF3mcAoDiI0sNj7IQ=;
        b=L3/UwAc+U+4UAvH63erWMA+v1jJ7QtVeOwcwfYRpP9GCZJQe1sfRymnpFm5jo3UMO7
         Pr1r11NacjWgZWwM2oufxqSwqD2vPduybvQieu/0kJ9Pcvn6Lc1veMKBvFbTKABt14Xm
         Cc2XEsrhKlklHAHCijHQp38T29sKD3ufLSNzqWlFacFyjV2BxFnq/q3j9zukrl8GGKzb
         RG9B8AdNG0SG093Od18dmIitXeK4shaBIwpfK5Gkqd2n51DzGhGwt2m9X0gvbeOBpY/a
         oCBNwGdy1muqteDWaG73SGc1OLfmP6I4tp7mQPPibha++pbhFnu4NGQZ002nj4dM69j/
         qceQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuZMwDJWXuwMKh8cjJqbT+creRwayJS2jZWtk22cwU+uHB5LPi1Sj9vXxg5P+TeHtrMuiUhuqB2Tk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwN290EN42WXIvOmqTM1HeMLbfUzu5nJXjfEoqaOJiYF6sIOg2e
	sYLagnxjbBpxu6gb6JThyy2X3vUo+DYRtF1J4LUZlFtJEt6CO7LfsRhqdlGJ3IeclAc=
X-Gm-Gg: ASbGncuz4MKdiN1Bz+G3hbbMjgsrDY/k3mTx9TvJpR+4lDme2b8+EQd85u+d8S6JRCe
	qxb2RLll4qZVBzZ3kakZMTXPL5VFuFj3m3SgM+dAMJ/U36CpzRqfinaYDwV7/LmSMpF4G3TxvEE
	GsjW0c0DKunoW3Inu4fjQI//NbyxbEKx932fqHvVdlhzOkpt6vjyC2NN1Xu2NVhRpIYoKKC5xDP
	KQZwL3FckNvTden0Cd0j7vbMS57FlSSDgYqa3M5pnXTcpoS9qow5EQ+0+uT1B7rBV1eh2lf2M/8
	jbOF+sLhiVVfx/gp30kCVaQKkErUcPXXlkbYsegVoCLBDHgH9fPnLEDZmoLQEuZZbOjnxyETKd1
	8caXo4GNlezFV8TbiNmllayiMCMKTGYEIc56HwI9Xl6ztTTtpsSka/OEFvV2C7eUbswb2DjBplO
	AXAqArsaAlFuIX
X-Google-Smtp-Source: AGHT+IGOoiXgFg+ombrdNHbJGnF/RN2ldAACioB6TNjWuV/9d/iv0tOA0+NQZqwabHQbJbLm6M7s5Q==
X-Received: by 2002:a05:600c:4750:b0:45f:28d2:bd38 with SMTP id 5b1f17b1804b1-46fa9af3095mr27932845e9.18.1759934464932;
        Wed, 08 Oct 2025 07:41:04 -0700 (PDT)
Message-ID: <6c9b2e4c-bf13-4f26-baab-13be9947c377@citrix.com>
Date: Wed, 8 Oct 2025 15:41:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux xenfs vs privcmd
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <e1627855-e7f4-4fe7-8079-68c3a0d488fb@citrix.com>
 <af7a1b15-ddfb-4dd9-8a5a-31e5dd2d2952@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <af7a1b15-ddfb-4dd9-8a5a-31e5dd2d2952@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/10/2025 3:08 pm, Jürgen Groß wrote:
> On 08.10.25 15:33, Andrew Cooper wrote:
>> Anyway - /dev/xen/privcmd (and /hypercall) shouldn't be tied to xenfs.
>> They should be SIF_PRIVILEGED alone, should they not?
>
> I don't think they should be tied to SIF_PRIVILEGED, as device model ops
> are handled via the privcmd driver, too.
>
> TBH I have no idea why there is a direct connection to xenfs.
>
> Did you try to modprobe privcmd without mounting xenfs? I guess the
> connection is that the capabilities in /proc/xen/capabilities are
> tested to
> contain "control_d", resulting in the privcmd driver to be loaded.

modprobe xen_privcmd in isolation does cause /dev/xen/privcmd to appear.

~Andrew

