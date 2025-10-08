Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 359E2BC5593
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 16:03:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139746.1474992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6UlR-00072u-5O; Wed, 08 Oct 2025 14:03:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139746.1474992; Wed, 08 Oct 2025 14:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6UlR-00071O-2g; Wed, 08 Oct 2025 14:03:33 +0000
Received: by outflank-mailman (input) for mailman id 1139746;
 Wed, 08 Oct 2025 14:03:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bWZK=4R=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v6UlQ-00071I-0C
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 14:03:32 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91784e37-a44f-11f0-9809-7dc792cee155;
 Wed, 08 Oct 2025 16:03:30 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3ee15b5435bso4483660f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 07:03:30 -0700 (PDT)
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net. [92.22.57.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f02a8sm30566543f8f.39.2025.10.08.07.03.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 07:03:28 -0700 (PDT)
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
X-Inumbo-ID: 91784e37-a44f-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759932209; x=1760537009; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DrTfcgZxCw8+8NdrkWCXD9IbD+w5mehnaRSGVjQ1DzY=;
        b=O0DhEhHeFNR5O0iThCvkn5vqqd+/0+m7UMtllMCl7J7Q1Dc9w+sl+5ShM5GhdAf3wh
         gSaFOffh7f+A0/UomfREkSMtaKu5Hn0mxoTnTXWwB2hiCdRg7PlrDtnguojCF0HUQikd
         ijQcj7wqaZikbkovqL9T50/4xgDoeYuxzZfk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759932209; x=1760537009;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DrTfcgZxCw8+8NdrkWCXD9IbD+w5mehnaRSGVjQ1DzY=;
        b=xUoO+OUMm6r9v55F3O7q389WPchT5jOGSw8/108rKCQ/mG3DM+a+NQZOFz97Qay4sf
         ZzH4pBJLaQowz58PnPQnJu1+4Wvtn/7elCFpace8gMhEncgGkRSHJ56bi3OPiUicH9Tc
         cCDoWq+heAKDJFeFFsUi9RPq+f4wqbigQ5o6bPxYTdkz6GCCeJ1n6v9jwKb1b9CIETLB
         8GD9+QRlCz90aQWbiel2uc93/M40c1NkXtMmiwyFrNhGyuGURIU9VLXn3gp6DKr/4U0E
         G2tL3Lv9Bfuy2RzAg2OPFIrLhVvXBSFjTFY76GXrBpyo4KRNl2pqTbnscV/B43Hh1Ftq
         4HQw==
X-Forwarded-Encrypted: i=1; AJvYcCV7unIuBdUbnK4pRxiMsg5JmXqSWaZ47gu3O+njEtF2zufs2cALlcJMAbSgI4If3pUpQWnw2YtXfg8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx290zizNaD0woS82gIGCeSUOcvdPP03dUuUyuGbHUn6XdQ3mGt
	nvk7ocsb0Gr6g26nbRmG6/ExlCp/fnYcUyAhs6pZjV9NB1KtU9nJkvlfafDsYpIk/iw=
X-Gm-Gg: ASbGncvicecXlCYD4UDjNAOAFkmM6I92PWRIFeNmSuMZvTIMgEN2iSArpzXafFabjZ4
	DQeSdkppRli5Hlfmbkwb9LS6Hx8fWLL7giLzNkRMmn7V2LS2977Bmez6Hr5n2u2Qy83KbQNRHsI
	+eH2ccyk83LJv6V//+IxlRijTU2sFf6bJPzJGz9Z/w3IpQpG/EZdXtvEykPsGzJg+CmeCBgzoL4
	j+LXB5nMZ8PXAr+K+bMMwNcjgvgbdxLJi/sla+0gegqBB1odNUv800cRl4RcaiCpCBAkGGQkra5
	Ia0MXIrWjoTuf6rJ6VfkAgpmb9g0beH8vSoaXsL+vC7IgPOvv219oAZdJfo0BtaXcyteIxvKUZ0
	c/SaABJOFM8S9Nl2CzVp3BpqfodhAzr2sviur34Db5JlLSLhDwLAjjNvOXChApuKNDdOINm72/9
	lxwCZa9a2rDO8R
X-Google-Smtp-Source: AGHT+IH1ZBroHwuzYpfZHXSIg6UpB6w2m+/lrFHVu/p/seanAGTgdiftbsAVS029gS1RsflXXQ061Q==
X-Received: by 2002:a05:6000:2f83:b0:3e4:f194:2886 with SMTP id ffacd0b85a97d-426670835d8mr2109827f8f.19.1759932209275;
        Wed, 08 Oct 2025 07:03:29 -0700 (PDT)
Message-ID: <eaefcbe9-5527-46e2-b8ef-0fd9b8474231@citrix.com>
Date: Wed, 8 Oct 2025 15:03:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux xenfs vs privcmd
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <e1627855-e7f4-4fe7-8079-68c3a0d488fb@citrix.com>
 <4b7b99ea-00e0-4967-98a3-90e876e5cf3c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4b7b99ea-00e0-4967-98a3-90e876e5cf3c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/10/2025 2:54 pm, Jan Beulich wrote:
> On 08.10.2025 15:33, Andrew Cooper wrote:
>> Hello,
>>
>> I'm doing a deployment of Xen on a remote system provisioned with Ubuntu
>> 24.04, and I've found what I'm pretty sure is a bug.
>>
>> In dom0, to start with:
>>
>> user@host:~$ ls -la /dev/xen/
>> total 0
>> drwxr-xr-x  2 root root     140 Oct  8 20:04 .
>> drwxr-xr-x 18 root root    4620 Oct  8 20:04 ..
>> crw-------  1 root root 10, 120 Oct  8 20:04 evtchn
>> crw-------  1 root root 10, 118 Oct  8 20:04 gntalloc
>> crw-------  1 root root 10, 119 Oct  8 20:04 gntdev
>> crw-------  1 root root 10, 124 Oct  8 20:04 xenbus
>> crw-------  1 root root 10, 123 Oct  8 20:04 xenbus_backend
>> user@host:~$ ls -la /proc/xen/
>> total 0
>> dr-xr-xr-x   2 root root 0 Oct  8 20:04 .
>> dr-xr-xr-x 326 root root 0 Oct  8 20:04 ..
>>
>> i.e. no /dev/xen/privcmd.
>>
>> It turns out that mounting xenfs causes it to appear:
>>
>> user@host:~$ sudo systemctl start proc-xen.mount
>> user@host:~$ ls -la /dev/xen/
>> total 0
>> drwxr-xr-x  2 root root     180 Oct  8 20:05 .
>> drwxr-xr-x 18 root root    4620 Oct  8 20:04 ..
>> crw-------  1 root root 10, 120 Oct  8 20:04 evtchn
>> crw-------  1 root root 10, 118 Oct  8 20:04 gntalloc
>> crw-------  1 root root 10, 119 Oct  8 20:04 gntdev
>> crw-------  1 root root 10, 115 Oct  8 20:05 hypercall
>> crw-------  1 root root 10, 116 Oct  8 20:05 privcmd
>> crw-------  1 root root 10, 124 Oct  8 20:04 xenbus
>> crw-------  1 root root 10, 123 Oct  8 20:04 xenbus_backend
>> user@host:~$ ls -la /proc/xen/
>> total 0
>> drwxr-xr-x   2 root root 0 Oct  8 20:05 .
>> dr-xr-xr-x 315 root root 0 Oct  8 20:04 ..
>> -r--r--r--   1 root root 0 Oct  8 20:05 capabilities
>> -rw-------   1 root root 0 Oct  8 20:05 privcmd
>> -rw-------   1 root root 0 Oct  8 20:05 xenbus
>> -r--------   1 root root 0 Oct  8 20:05 xensyms
>> -rw-------   1 root root 0 Oct  8 20:05 xsd_kva
>> -rw-------   1 root root 0 Oct  8 20:05 xsd_port
>>
>> For good measure, I checked unmounting xenfs:
>>
>> user@host:~$ sudo umount /proc/xen
>> user@host:~$ ls -la /dev/xen/
>> total 0
>> drwxr-xr-x  2 root root     180 Oct  8 20:05 .
>> drwxr-xr-x 18 root root    4620 Oct  8 20:04 ..
>> crw-------  1 root root 10, 120 Oct  8 20:04 evtchn
>> crw-------  1 root root 10, 118 Oct  8 20:04 gntalloc
>> crw-------  1 root root 10, 119 Oct  8 20:04 gntdev
>> crw-------  1 root root 10, 115 Oct  8 20:05 hypercall
>> crw-------  1 root root 10, 116 Oct  8 20:05 privcmd
>> crw-------  1 root root 10, 124 Oct  8 20:04 xenbus
>> crw-------  1 root root 10, 123 Oct  8 20:04 xenbus_backend
>> user@host:~$ ls -la /proc/xen/
>> total 0
>> dr-xr-xr-x   2 root root 0 Oct  8 20:04 .
>> dr-xr-xr-x 291 root root 0 Oct  8 20:04 ..
>>
>> and /dev/xen/privcmd stayed.
>>
>>
>> Anyway - /dev/xen/privcmd (and /hypercall) shouldn't be tied to xenfs. 
>> They should be SIF_PRIVILEGED alone, should they not?
> Why would you want to restrict e.g. a Linux stubdom usermode from making
> hypercalls? Aiui this would break e.g. qemu running there. (Whether the
> tying to xenfs makes sense I can't really judge. Without that something
> else would need to make the two entries appear.)

Hmm, good point about Linux HVM stubdom.

It's no secret that I've been wanting to kill xenfs for several years
now.  It's one best examples of the wrong tool for the job that's still
around and causing bugs in the Xen ecosystem.

Either way, what I'm trying to say is that the contents of /dev/xen/
should be unrelated to xenfs.

~Andrew

