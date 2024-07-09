Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9821F92BCA9
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 16:16:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756315.1164885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRBe6-0002PH-1Y; Tue, 09 Jul 2024 14:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756315.1164885; Tue, 09 Jul 2024 14:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRBe5-0002NH-UA; Tue, 09 Jul 2024 14:16:41 +0000
Received: by outflank-mailman (input) for mailman id 756315;
 Tue, 09 Jul 2024 14:16:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7TZB=OJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sRBe5-0002NB-26
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 14:16:41 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbd36e3f-3dfd-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 16:16:39 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2eaae2a6dc1so75581401fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 07:16:39 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f736939sm43643785e9.37.2024.07.09.07.16.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 07:16:38 -0700 (PDT)
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
X-Inumbo-ID: dbd36e3f-3dfd-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720534599; x=1721139399; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lvEGfOFFHNrrKM0QkQGSTaQxFAfHL0jf/PrpM9vaCfU=;
        b=NXDYFBqy+ak0Jo5iKUADVCp0n9EFpvVOw1Y9UUe+faY3MnCVQVojBrlsabO0EZTQ3u
         H3vNy7c5qJaClzY947M06Z/UXsCet0DKGnc2eCQjtRJiuj1mBxTEyBi0xOiflhISoBnr
         KNGXtIy7IWr6Ktv6opWQqlKDp1Egs/lZGIYEPu66b3iv63WuN4qStgXgP8xiofzwGocG
         TeUPZrcxuzZFs2WvTJZnzAp5YhDICj5M3N6jdFMjLZEFQGL6HTMBadwP+BBmuKjpLSTT
         T7xNlPn1esZ1jGWs01GZqUB48is062/4oCPzPoiMNOmwpXbo8iPmD88vV4InN/uRI6ok
         jSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720534599; x=1721139399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lvEGfOFFHNrrKM0QkQGSTaQxFAfHL0jf/PrpM9vaCfU=;
        b=FiotrMhfvzUipRjJaSu0KbIIXAdcsDO+sMdqJOZq4yNoD4Uxscvxeq0MPVgU5J70Bs
         G1SByHHW9nPOBUct5cDAzn/woshCLjv38+vySkt2+xz4sJrT6JTkKXJ/N2QphQKYa/ge
         981Q4ozujtgorsy7/+O2TkIZ6L++vhxLkHvyrDizECEEYAgTpeFvitH32Zh2eHUSfXj9
         zmTf6oEvTDmRZJFMkNE+nrXzNUrFGV2immfErWVPKS4i8WIccKpXkdNpvdAYGA3vNSVx
         sBSDTxym6po2nnP4ro8QT6/DShuL/sfKRXd26cbAi4mR74MjfV91FyAhL7RfWMV0RXA/
         sn5g==
X-Forwarded-Encrypted: i=1; AJvYcCXLNcYgsZwLNzCaF54MvVvzK8M6TkLbpR1tb/kqIX9rE36nHVp83ZoMs+N7R1eyIZlj0XRINegy1JjG9p2130mzQ9R6rPueZlMuqIL9FSc=
X-Gm-Message-State: AOJu0Yz83Dk+Z8xODhrcBcslz0w0RFIAscvgiyQgQEcQ+5PKRFfJXyRz
	SIOs+TBSCU6O/NkOLsd84rgPM57ivO/OQqNlysHTKkOy5utG4/PsC2G2gU60sjQ=
X-Google-Smtp-Source: AGHT+IGpr9knB4AbdAVZZyCyZkoeyI+5+/BqzPGWUigUXq5xHrOtDZJtXgN6ohL8SC0uabT3J3MtMg==
X-Received: by 2002:a05:651c:23b:b0:2ec:56b9:258b with SMTP id 38308e7fff4ca-2eeb316b00amr23444721fa.33.1720534599107;
        Tue, 09 Jul 2024 07:16:39 -0700 (PDT)
Message-ID: <e1d345fc-cb88-4aed-9d57-7cad4647d161@suse.com>
Date: Tue, 9 Jul 2024 16:16:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19?] stubdom: Remove more leftovers of caml-stubdom
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240709123907.2400138-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240709123907.2400138-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.07.24 14:39, Andrew Cooper wrote:
> Fixes: e536a497545f ("stubdom: Remove caml-stubdom")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

