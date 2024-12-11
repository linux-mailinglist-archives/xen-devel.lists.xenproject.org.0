Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8B39EC0A1
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 01:20:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853467.1266913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLASY-0007lH-E8; Wed, 11 Dec 2024 00:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853467.1266913; Wed, 11 Dec 2024 00:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLASY-0007j8-Au; Wed, 11 Dec 2024 00:20:10 +0000
Received: by outflank-mailman (input) for mailman id 853467;
 Wed, 11 Dec 2024 00:20:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n9G/=TE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tLASW-0007j2-Jx
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 00:20:08 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id accc2136-b755-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 01:20:07 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a9a977d6cc7so910977466b.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 16:20:07 -0800 (PST)
Received: from [10.0.3.247] ([62.212.134.114])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa68770c481sm378332366b.110.2024.12.10.16.20.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 16:20:06 -0800 (PST)
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
X-Inumbo-ID: accc2136-b755-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733876407; x=1734481207; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oE3UnuNvh6vbg3Berxt4tcutNImUfhA+K8+EG0UGIms=;
        b=SJUhtgMVT8IgALgtFYH6O3jgIVSuyzRRGvveaLD0voZVMNYmV2Y+esT5Yowlec7Nri
         YmvVf/6wLPBZ/KFwqiTi2fRERjfFL4xvUHOgWpRnxyFVSjPKi4Owwh3N2ciKLncjQbrp
         o1jQYL6ANniQqynYGaVkXLfcd8UZf0jPpqBQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733876407; x=1734481207;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oE3UnuNvh6vbg3Berxt4tcutNImUfhA+K8+EG0UGIms=;
        b=DwzVpUi6sxto+sIHQLYuI0QbOutwtaaaGuapkasjFLKRmmqAOFkzo6jubOU6kfo4dE
         9RDH8Wu3hHQ304U1JUihrLmll0Om1SKU9KjOiX2n/HF03EVOHQhZAa4JN1kyvuu0/sQw
         hFVPaXWjrY9eHFEsYW3JikjY57xPzkDR4TXG7V4qgEg8DZj0YKbzfsQ50Bk9SCahFS5n
         9/Wuc72R9xGjMR2F3OZG2bJaBki3B5BjkLRegAWdcSAyuCgjz7wKQM6Fiw79RxO0ALbM
         /Cg3oyNbfm/GD/GJDnfgoBrwSKGvxUGrY6enJS1b8aExRSRiPwx+0FqrknK3QT/LP6LG
         aIug==
X-Forwarded-Encrypted: i=1; AJvYcCUfwA6x9d6mQyKRCh9ot1XNOVpgaoH497ZJZXHU9XB2+gDOpnwHYoqdHmEfmO+SaQNBXcqqkxqMgbY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVNc8AV4DMdT1KdL1PR/3oqJ+rcPnMQdd96Qp2/dCithoQaLqf
	2YpssaswNRBWCH7T12Ya0sKunwjE+8vHA7fkdHkmb0Xp1s6C6i+++p5uT8bBXEw=
X-Gm-Gg: ASbGnctnjaLU+AoNS4WTuF8Zpy7EqMM7iqjF44CYjryG2thYtR/Ff9QyC/I7RHGIVQ1
	UP6ZW636i0ir/LbIdUjV5lQXkZIvWyi+X1ordycVZWnTR2S8VgD2PMI+xtD95xlBuhPYvrBbOVi
	Xj0QPHDn3gz7zYU6nci1sGKxfgr2Ck+URAmw0vg4R14DrfcmD+Q0LEzbeos2/zLmppCmVj9RhTC
	txDZ3+t+/4FpHrXOtOZ/DedDtTaxsLdt7WODx4UhkOcFFOmDOOLWzgKJZCKQLZX9w==
X-Google-Smtp-Source: AGHT+IFKmU1uMKO53LmLI93NLSsoRYmL5ZqeM82YXKwxnVSN4L3c3a+wNsVlvKYhDWb+aN6ejYyfcA==
X-Received: by 2002:a05:6402:3806:b0:5d0:abb8:7a3 with SMTP id 4fb4d7f45d1cf-5d433035673mr1865241a12.6.1733876406725;
        Tue, 10 Dec 2024 16:20:06 -0800 (PST)
Message-ID: <dbba9290-58ce-4b21-b56f-825d598d5f16@citrix.com>
Date: Wed, 11 Dec 2024 00:20:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add Anthony, Michal, Roger to THE REST
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: kelly.choi@cloud.com, anthony.perard@vates.tech, michal.orzel@amd.com,
 roger.pau@cloud.com, committers@xenproject.org
References: <alpine.DEB.2.22.394.2412101558000.463523@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2412101558000.463523@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/12/2024 11:58 pm, Stefano Stabellini wrote:
> In recognition of their outstanding work and years of service to the Xen
> Community, please join me in welcoming Anthony, Michal, and Roger as
> Committers and REST Maintainers.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

