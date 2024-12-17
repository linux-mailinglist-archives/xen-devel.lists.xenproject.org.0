Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDD89F4C28
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 14:28:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859153.1271300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNXcR-0002nE-I1; Tue, 17 Dec 2024 13:28:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859153.1271300; Tue, 17 Dec 2024 13:28:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNXcR-0002kz-FS; Tue, 17 Dec 2024 13:28:11 +0000
Received: by outflank-mailman (input) for mailman id 859153;
 Tue, 17 Dec 2024 13:28:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=92kI=TK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tNXcQ-0002kt-N4
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 13:28:10 +0000
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1c91b73-bc7a-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 14:28:09 +0100 (CET)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-385ef8b64b3so4685141f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 05:28:09 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436255800f6sm171026905e9.18.2024.12.17.05.28.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 05:28:08 -0800 (PST)
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
X-Inumbo-ID: c1c91b73-bc7a-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734442089; x=1735046889; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=By+xU+4yaylIQcLr96UYPAPlnIkFPxS7w0WVWkZnN6o=;
        b=NBGWJdHM8UbxniT+f0+Fo0FNoErfNbEmCpriHp2ERIGuOnkDGJ+awJQu5tPUWQ6wBa
         unYopjGHY40z1eVxPXmy2B3fZ+yyzG2br2MoYejHIMBBXUniP0Gb0eTBRrNaA4Fw7xAN
         xoo6KINI8PgY1thvEPEtQqnDFfZmt/Bt0xqbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734442089; x=1735046889;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=By+xU+4yaylIQcLr96UYPAPlnIkFPxS7w0WVWkZnN6o=;
        b=M9klhRoqZhgUoF+x/Wq1BeoZLJ2o3gkn9vXuzgM/wftuRZfysF1KpCi6WMzPzVljHS
         S69T2WVNjPxtw8v+RqOFuAxc3krI/vu2Kl8Xeu/jislvt5UnoZVIdvDyQu6covBSiRBT
         mLeKj5KpSUX3FCweRbnrR/lZEin1ene0spcttUT8ablhnJ7HimMmhOmGtlKx3Cas+3Sr
         QEnJiPQnWvljk0xjZlOBnebo/p34VtNwH6J8H44zxMLo7UWXUVi3blfnpGHwV88eLq03
         QfsRSUy182R51C4l7bQwApyD/cYHTdvfoaol0IlLUFVZjj2p4niGNpcPShdK91dOsA0w
         4aew==
X-Forwarded-Encrypted: i=1; AJvYcCUOaAZBmgt4LrggXtxMwzAYQ/WpkbJAXV8e7m+hBUjUeb4Fl6Mq439jx70KjkFJkVA237D8hYUClxw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6FVqhcnkrytjBZokG65fSDuTBdyFJQaF1CY4nKiMYYHEYlkIK
	8grZwxQsVKEFw8Or/sHRKzAkpR/bTN6oaq40L08RQwvNVxdTnV21DA84M8C9x+NqnKarbhTFi7i
	GOnAq9g==
X-Gm-Gg: ASbGncukeBrTz6uJxUtuegOSIrPIwdQf3fL3oTu7Q/lpi5ZD6/ng0cWdr973dTt5k4P
	PlWVrl+QBp/8LInko+2dXJXsdMvqPraCR8zMSXWJ+Qf5LsphjyHOoy7lOFDvQAYApF9cfiOeDHC
	UWSamI8jqh3B4iuTxrEf/abn//S6R33UqnBRh858EcMBgGRzZJ5zqaT105Bl7X6j52FuVxwPXVM
	Pt/wh7wBprL/WcpUWLrq/lHnQFf+lVQzz8VcVstXbHjdy2lmgAWoBGOKn0DQrFDNrXqvmg9jCLS
	Q8mMokf4fiHsbxoZ3EnO
X-Google-Smtp-Source: AGHT+IHMAQWMtU+j+z1XP4jFAFdAmRnb8+tXD0bYZ6RLRB6CDTknczo1COThemPew/XiPwCBnNR/wg==
X-Received: by 2002:a5d:588e:0:b0:385:df63:4c49 with SMTP id ffacd0b85a97d-3888e0ae5c3mr13574150f8f.25.1734442088963;
        Tue, 17 Dec 2024 05:28:08 -0800 (PST)
Message-ID: <bf575c2c-97d1-477a-9bec-21e8fc4340d3@citrix.com>
Date: Tue, 17 Dec 2024 13:28:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen Security Advisory 466 v3 (CVE-2024-53241) - Xen hypercall
 page unsafe against speculative attacks
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <E1tNWXG-00E268-2p@xenbits.xenproject.org>
 <96775ba9-19c6-4467-848a-5b4625c70583@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <96775ba9-19c6-4467-848a-5b4625c70583@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/12/2024 1:21 pm, Teddy Astie wrote:
> Hello,
>
> Le 17/12/2024 à 13:18, Xen.org security team a écrit :
>> Xen guests need to use different processor instructions to make explicit
>> calls into the Xen hypervisor depending on guest type and/or CPU
>> vendor. In order to hide those differences, the hypervisor can fill a
>> hypercall page with the needed instruction sequences, allowing the guest
>> operating system to call into the hypercall page instead of having to
>> choose the correct instructions.
>>
>> The hypercall page contains whole functions, which are written by the
>> hypervisor and executed by the guest. With the lack of an interface
>> between the guest OS and the hypervisor specifying how a potential
>> modification of those functions should look like, the Xen hypervisor has
>> no knowledge how any potential mitigation should look like or which
>> hardening features should be put into place.
>>
> Should we consider adding a interface to know how to the guest is 
> supposed to make hypercalls (what hypercall instruction/flavor) ? Such 
> as the guest can have its own hypercall implementations but knows which 
> one to use.

Better enumeration is coming with the hypercall API/ABI changes, but a
guest already has enough information to correctly issue hypercalls to
the current ABI.  Hence why we didn't make this fix in Linux depend on
matching change in Xen.

~Andrew

