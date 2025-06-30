Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AB2AEDC74
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 14:14:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029113.1402857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWDOl-0007dT-Kk; Mon, 30 Jun 2025 12:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029113.1402857; Mon, 30 Jun 2025 12:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWDOl-0007ak-He; Mon, 30 Jun 2025 12:14:11 +0000
Received: by outflank-mailman (input) for mailman id 1029113;
 Mon, 30 Jun 2025 12:14:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3E/H=ZN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uWDOk-0007ae-0S
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 12:14:10 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9628a59-55ab-11f0-a312-13f23c93f187;
 Mon, 30 Jun 2025 14:14:08 +0200 (CEST)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-453634d8609so30236085e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 05:14:08 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a87e947431sm10312089f8f.0.2025.06.30.05.14.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 05:14:07 -0700 (PDT)
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
X-Inumbo-ID: b9628a59-55ab-11f0-a312-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751285648; x=1751890448; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5ihKzTcbo5RVMrh97KWV1e+2z1l30RUrT8RORTZOh/s=;
        b=lC5J/4IM/IbISJAzlqq7A02AmYgUcnUpTu1Jpe1BCcu8vRffOAnyUVehFP/o52PBaV
         ydNFb72KfenjUKApPcvAL6/UFymEeNlshCBSZ8wBtcubjkl01efZVIFAcby7/3kJgq+F
         hplQZhmk+UWV9DPMVAdAuaWDVFOfroF+S3uo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751285648; x=1751890448;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ihKzTcbo5RVMrh97KWV1e+2z1l30RUrT8RORTZOh/s=;
        b=P4Ff5sqWOKHWVIy+jT/VVmQX/rsyEPl5RXNowKnS4sclvN9ifTUxuTXkGyplOPq5RY
         /SLvVXNOp8mxBI9+e733ZRm+OqhCKmAPYAQ2a30S5Txc+LzBxEl1/5HfZU64t8RYiIbT
         68/TOyeiz40wIw+kRELE8UOh6uNQ4iSYyX+ZPW1fT1Rk1yEur+AT5swDOrWdhrcfGslA
         rYpJGZstVPO+glZ7l7oYdKSq1U+SPaJHxE/IoDrURD11QvX/3+sRCw4Lo4HLfYGi7Qv2
         lz2Ke8r2Wlr9/GfpurJRq/V/D/UFb1L8J+ZylSV/EUMEt8u+oySTTXhdqS8jczbAAOMT
         a2yA==
X-Forwarded-Encrypted: i=1; AJvYcCXJ2nuYMMmyjOterR6zVYb/OiGEPRiCYYJNYs784gOQ5vse2wc+BIWm7AT9FCcakgGOTNwCXPTnKVg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRPa3DVh4NlSGGk1Svi3sPGTcQbblN0h2kQSZu7Ax1I+gnds1+
	/PhWSWfJS2vNIaoGIuTXACDTI4K/Mvlulv5NiyHMttKkKvKy9CI5G6qnvjcHbSLBdGA=
X-Gm-Gg: ASbGncuRPPwXUc0kPbhTbt4+u9uz8s9ge0LAmN4fLi6TsIcuZQbtMcly7Q1rAN6FNlD
	+lwuHfZWfc5w2WO69Oy3bC2/u++MpA0eXPr0XHgtSdfDf0jNpVYlDygLY7oPvIGnVJ/xLvhTfbv
	efoju3+2JztnyrRC7o+8J+gsW8ZcEJbZYtXu6YNah40oj3cpTxKMB5J9q+lMThUeEcQU9AanINU
	VwY7aaIwHbL7RvaKUUbZEYCEcs/kWhE1sxmvWHFcbQ5z2zqhsiBQ7c749RtgmPEwXhiutB5YvOJ
	DjM5v11iruzhun6VYTNrWOcTiiul9OG0p0dYm7iME+ecaoZ/f1otKAReMkuBMc5iy+ZoL9iKArC
	C8q7Ohw9C88BZbktIApQMCr742GrqcNw7tclX8g==
X-Google-Smtp-Source: AGHT+IGC9WaZOgy0e4CwB0JAWGOZM/CD8Hfg7YfH9Lscncd/2y05Bz5vHw5/meD8ChB4DU3dJYPzgw==
X-Received: by 2002:a5d:5f49:0:b0:3a3:7ba5:9618 with SMTP id ffacd0b85a97d-3a8ffccac13mr11757313f8f.29.1751285647897;
        Mon, 30 Jun 2025 05:14:07 -0700 (PDT)
Message-ID: <2a2315c8-4903-4377-b879-c99b95404609@citrix.com>
Date: Mon, 30 Jun 2025 13:14:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/build: pass -fzero-init-padding-bits=all to gcc15
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <a48edc0d-6a5a-4410-974b-a4342fee1387@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a48edc0d-6a5a-4410-974b-a4342fee1387@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/06/2025 9:22 am, Jan Beulich wrote:
> See the respective bullet point in the Caveats section of
> https://gcc.gnu.org/gcc-15/changes.html.
>
> While I'm unaware of us currently relying on the pre-gcc15 behavior,
> let's still play safe and retain what unknowingly we may have been
> relying upon.
>
> According to my observations, on x86 generated code changes
> - somewhere deep in modify_bars(), presumably from the struct map_data
>   initializer in apply_map() (a new MOVQ),
> - in vpci_process_pending(), apparently again from the struct map_data
>   initializer (and again a new MOVQ),
> - near the top of find_cpio_data(), presumably from the struct cpio_data
>   initializer (a MOVW changing to a MOVQ).
>
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

