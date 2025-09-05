Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2116B45844
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 14:54:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111981.1460489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuVwq-0001wU-DQ; Fri, 05 Sep 2025 12:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111981.1460489; Fri, 05 Sep 2025 12:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuVwq-0001tQ-A4; Fri, 05 Sep 2025 12:53:48 +0000
Received: by outflank-mailman (input) for mailman id 1111981;
 Fri, 05 Sep 2025 12:53:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IfYY=3Q=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uuVwp-0001tK-5U
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 12:53:47 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b8ac6d6-8a57-11f0-9809-7dc792cee155;
 Fri, 05 Sep 2025 14:53:45 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45dda7d87faso4073625e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Sep 2025 05:53:45 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf3458a67fsm4334066f8f.62.2025.09.05.05.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 05:53:44 -0700 (PDT)
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
X-Inumbo-ID: 5b8ac6d6-8a57-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757076825; x=1757681625; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=si9qQCwIJBugiLUvuKF99IHWOHJ6ZkxN6J1JHrdifGs=;
        b=jr5hw1qbw/xHtaTU/PTaKTq/QeaLu3/EbQNjIk5pZacU53mKGvYvLBjQLs/KVjmZoE
         Mgmu+x5mGL8aqGRitujFCWvCFjq/1hK8XHDK7Yyo+iL8ODQnu8itfBD8/vA/QvysVN14
         pGoIaggjmK82lc/Vdg8QvrJdoQD7Ggdw0YSZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757076825; x=1757681625;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=si9qQCwIJBugiLUvuKF99IHWOHJ6ZkxN6J1JHrdifGs=;
        b=tHvRuacOfPzn3oq+2gdniend/GmmQaOzND4x/sK/fno8ynFHJBvaP0TI7+/0Escanb
         X8RRy/USXU0r10QSn9oJrXznYyeEZm9E+9hCxiHfooeFl+PVg/5vtz50ZkJUSxoP5d2y
         QACiDe5o+enqKdRhodSvQ5jVosR3FR0ScGSqlyss0Od/V6LHZXjm2sfk7fW8u02mfvR0
         ge8fmE8fb2OatFbElCFnz/fuVvi4mL04Xr+myEIUOHSZUfHQWB7uNqS+Wklz9BPD/BC4
         LTEwy2wgCRpquhkWeIe4bvLWWjwEZu+nx2l9Lzn24Qo4Z6vK5088uSvLvceoFyytJaC5
         csXw==
X-Forwarded-Encrypted: i=1; AJvYcCX3UfsaYtbLl5oFPGCh06aO3NXUBKDp3sWTXMc9tnnGJZ9sadYv6YL34H/nSzjV24/qFsWqLZF4B9g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxsjfCRKlCqEMH8BvDkDne+f2jMtRfudS9dA0jF1h6Xzizx9YRC
	1De+J94X/Usec83fp4yq/ZewMcMn4H0Ite0ZVSC/VS7XLpZFK89h4/aLMS3FfS1ShoQ=
X-Gm-Gg: ASbGncv+n+vio6FpwHkNvI6mV4aOhRxGQi65clmtXtXWuIums6kDeRxgx11rox5hFK7
	u9etqGqBsjQwuYEUVmJ70SXYnB0Mc+7rqCS+Z9scIH62NJdlFZZdi2UAgp26Rz/j2YF0xp3i2lb
	/TBfX0MC0z7G/UH/xP6QQ3M9AuoH7QtEkB0w5RKM7DcD3x0lR2IX2auCxkTAKzB/CTEfV1q2quj
	dvTYx64NAsqwwLMg6/PhAJbvRnp/XpTf40Zyb3qsXKYVurJVVw64p7s9MeZEwMFzgJXFJKX4CHm
	uStRViO/uPeZvVl+JZZ0SwZt6lbdXEeH8SH411KYEE5OVRdxnaRF6BTchiVqEpSjIpg6fc39s5/
	CaVpiqpPdKxhSyn6YF3aqlwVN1wqRoSoTp8nRuY9B9E5vhXb3eYbmxlpJJZStDpS38vsbWumQyB
	dwn6U=
X-Google-Smtp-Source: AGHT+IEsPmjs/ej6BkUItdPmxuuWxTLBEkcqaSxZgGTtFQEaKELIeZFklcT4NvDNqYp9w5rZLOsf6g==
X-Received: by 2002:a05:600c:1c0e:b0:459:e466:1bec with SMTP id 5b1f17b1804b1-45cb5871c12mr68592605e9.2.1757076824576;
        Fri, 05 Sep 2025 05:53:44 -0700 (PDT)
Message-ID: <bd92ced3-dd1d-4bfb-b4e5-07c2312a935f@citrix.com>
Date: Fri, 5 Sep 2025 13:53:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] efi: Add a function to check if Secure Boot mode
 is enabled
To: Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1757071716.git.gerald.elder-vass@cloud.com>
 <8d66f9ce2c9c352794c0c144f6e00d0a9d465dbe.1757071716.git.gerald.elder-vass@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <8d66f9ce2c9c352794c0c144f6e00d0a9d465dbe.1757071716.git.gerald.elder-vass@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/09/2025 1:10 pm, Gerald Elder-Vass wrote:
> From: Ross Lagerwall <ross.lagerwall@citrix.com>
>
> Also cache it to avoid needing to repeatedly ask the firmware.
>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

