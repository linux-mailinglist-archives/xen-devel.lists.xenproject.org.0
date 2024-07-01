Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAF991E443
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 17:36:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751823.1159903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOJ4m-0002IT-U3; Mon, 01 Jul 2024 15:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751823.1159903; Mon, 01 Jul 2024 15:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOJ4m-0002F4-QN; Mon, 01 Jul 2024 15:36:20 +0000
Received: by outflank-mailman (input) for mailman id 751823;
 Mon, 01 Jul 2024 15:36:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ypwj=OB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sOJ4l-0002DD-3H
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 15:36:19 +0000
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [2607:f8b0:4864:20::829])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a83866e6-37bf-11ef-90a5-e314d9c70b13;
 Mon, 01 Jul 2024 17:36:17 +0200 (CEST)
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-446427c5923so30706931cf.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 08:36:17 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b59e5f26b6sm34101266d6.95.2024.07.01.08.36.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 08:36:16 -0700 (PDT)
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
X-Inumbo-ID: a83866e6-37bf-11ef-90a5-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719848177; x=1720452977; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Do2HFC7DM3iiayLzVb3+MIhQmUeBgWluU1vXilLnJJ4=;
        b=f4WbquxHliOEj+GtIybwISTNW8pvIbvrIh0UMi6QSSMvgDziML7lRQLOUv8vToEhnm
         qDIiVAkuj7vAKE55wbPATXaE7BiLGTMLdaekzv+qZjve0GKtkvYhkIg19V9FSbnUiM1d
         E34siwVMt8BrL/U2BWbEDAT83WieiLN7KY+Hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719848177; x=1720452977;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Do2HFC7DM3iiayLzVb3+MIhQmUeBgWluU1vXilLnJJ4=;
        b=YHSOCPWIUeHWKxkdG06vSKPmFr6KQGjvpzTexUCIfcFqJDZf81b6rbKxjwWwJsU9x5
         Rd5IkkeGuKeFzSoDebGfrhpM3KVnOUltpowWl/XidLkPdkLi7M6OstMJFck73IN4t5PA
         URgs6EzUU+nRlLPtuJz/WXOAFyGfbRY9SPbgTLq29+IUCql4+ApTl4M7gJOZxQvorNSi
         3+XitEqxfy2ZYZGiRp50iUPKxkWPLBnLwuYEaN31+wty0sd9KjRcopNrahrHM+F8BKLx
         yOwvAt7a/t60Y4X7jve7tdO9Dfdke+9hkVE5cjrvbQdpZZLZkKtMZQjKhfjDA/nmnH2Z
         nPeA==
X-Forwarded-Encrypted: i=1; AJvYcCUfap+ujixzN30SHO5z04TU6RGmh8HGkGJElEz3rRvLn9AagqcCBOsc2LcclnoLLr7NRLgGZsmf00B/I5x7AfUEDlyS/HKvIvAeEM1LUME=
X-Gm-Message-State: AOJu0YxszI/RPwqk7mnrWiWa2JVvRKO/dZqcI1kAMIImsRpCC8dq8Vn2
	/wgDi8Tbqd4PyG2uZPOKdTWN2qSHxxDfLQzhh81dHks0vKV7sGSaLMNio4W02+I=
X-Google-Smtp-Source: AGHT+IFhHCrbWZg3nltlNQ3mUHt3fbWSObZeoxugNA3GTeH8FCyHRkSblPshB5z3KatkblUrkM8+Ng==
X-Received: by 2002:a05:6214:d83:b0:6b5:9183:b435 with SMTP id 6a1803df08f44-6b5a542f294mr139018426d6.15.1719848176805;
        Mon, 01 Jul 2024 08:36:16 -0700 (PDT)
Message-ID: <0ef2392a-0da8-4cf6-b795-7a704e2ff396@citrix.com>
Date: Mon, 1 Jul 2024 16:36:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19?] xen: avoid UB in guest handle field accessors
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <d0b9a1e0-5c70-42c5-9c63-2e3af82487b2@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d0b9a1e0-5c70-42c5-9c63-2e3af82487b2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/06/2024 1:28 pm, Jan Beulich wrote:
> Much like noted in 43d5c5d5f70b ("xen: avoid UB in guest handle
> arithmetic"), address calculations involved in accessing a struct field
> can overflow, too. Cast respective pointers to "unsigned long" and
> convert type checking accordingly. Remaining arithmetic is, despite
> there possibly being mathematical overflow, okay as per the C99 spec:
> "A computation involving unsigned operands can never overflow, because a
> result that cannot be represented by the resulting unsigned integer type
> is reduced modulo the number that is one greater than the largest value
> that can be represented by the resulting type." The overflow that we
> need to guard against is checked for in array_access_ok().
>
> While there add the missing (see {,__}copy_to_guest_offset()) is-not-
> const checks to {,__}copy_field_to_guest().
>
> Typically, but not always, no change to generated code; code generation
> (register allocation) is different for at least common/grant_table.c.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

