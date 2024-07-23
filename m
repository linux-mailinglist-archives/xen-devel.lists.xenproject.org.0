Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7631F939FB6
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 13:23:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763068.1173301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWDbU-00017w-05; Tue, 23 Jul 2024 11:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763068.1173301; Tue, 23 Jul 2024 11:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWDbT-00015l-Sq; Tue, 23 Jul 2024 11:22:47 +0000
Received: by outflank-mailman (input) for mailman id 763068;
 Tue, 23 Jul 2024 11:22:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BZ+O=OX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sWDbS-00015f-VC
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 11:22:46 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1da59a1-48e5-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 13:22:44 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a728f74c23dso56568166b.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 04:22:44 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7aa49f3dfdsm14028066b.145.2024.07.23.04.22.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 04:22:43 -0700 (PDT)
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
X-Inumbo-ID: e1da59a1-48e5-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721733764; x=1722338564; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h/XSk6ltUMQMPtPlqVGntKFT4nYu/hIlLTTW65/D/x4=;
        b=WkNABcJ/g+OfIhVUxUrKMjlj9SOAyUgrYDkuSOWZ7QT40fjsFOiiL+jS/5g0SczsxH
         eeP1fxXyNv/hcx+kRyamCCadY6+BxFqBmz7OyxbZPozttCy1FQMGcuwU0faAdCTxDt6M
         rBS9Y045jfPaGyuRPtuTrXIB5nK6cN0runAyYDDrMdLnjdZ+DibKYbGBVWsNcp8xRkro
         9yvwU9PzDx9XDViekmj6dPcI364Me1HM6JcqHg05B+iNTeCkcRiWBOXJVide3nvMKB1Y
         49z/kzDvepDeS8m4+wfw2oDtXCaSlzIGidd63nsFfK9r8uHcbaoJMkXZ6lwhWs/b/r4g
         Vf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721733764; x=1722338564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h/XSk6ltUMQMPtPlqVGntKFT4nYu/hIlLTTW65/D/x4=;
        b=em3d+j1MqSwzkZ7nAAcOaP/YfeNg2fWHTUC1mMKXAL11dBDDMmnhf15y1umB0rEKy9
         BELmGuDTXvyYNHZG2ou4GIZATY222yQbM0Hv56U7qf1N2hzz9Xcl9cmaxEYXDc70FIZ7
         VHSI7aX/RULMU6qSb0M5B3D4jlutyYubEyRoz0GinX+qLPp2J9cEW7rklKxA7+/2XHkm
         u++BnpdQbFkgx/1dE8ygXsgHNk/qn81qVe/6I0UVd1ba6ct8VElmU+Ghk0lXKpPLvdHC
         pEZTGubsJtpRDvcGfhlNSjVAXFetb/35R/6IMkcXtdCz8DnaLP1zowtScuLHOSP/cLOV
         0tlA==
X-Forwarded-Encrypted: i=1; AJvYcCUD3mbRnWD1NDCoQylFbPyu7XGf0LzXKu22OdbXLSUZPzqph6eQLTC2S3hImEuQBYlnMReecr/jk4U9O/5p+XOMWkDpfUzQVKlKAAWQVgo=
X-Gm-Message-State: AOJu0Yz4wQj6aUew4/IpY2w3HbyB8wzzqNBbqVin4SvLrLGNq7ij2Pgt
	rwgv2TaiLwuOpkfzD1WUBsOdCQEEeCKTY8zkhzqLeyeNioJ2d1grz+uX3UtB/aViGYkWwwwL6mN
	L
X-Google-Smtp-Source: AGHT+IHN6GVVorTX8tdmNr525szLLZQrL0RxzAbw/OsWAlCxAMj5JnbXGOXSHKYDjLGD/46TjZ443w==
X-Received: by 2002:a17:907:d18:b0:a77:d441:c6f1 with SMTP id a640c23a62f3a-a7a4c1233bamr648918466b.33.1721733763950;
        Tue, 23 Jul 2024 04:22:43 -0700 (PDT)
Message-ID: <596b843e-43ae-4094-af3f-000b36a4d58c@suse.com>
Date: Tue, 23 Jul 2024 13:22:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] tools/libxs: Stop playing with SIGPIPE
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
 <20240718164842.3650702-7-andrew.cooper3@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240718164842.3650702-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.07.24 18:48, Andrew Cooper wrote:
> It's very rude for a library to play with signals behind the back of the
> application, no matter ones views on the default behaviour of SIGPIPE under
> POSIX.  Even if the application doesn't care about the xenstored socket, it my
> care about others.
> 
> This logic has existed since xenstore/xenstored was originally added in commit
> 29c9e570b1ed ("Add xenstore daemon and library") in 2005.
> 
> It's also unnecessary.  Pass MSG_NOSIGNAL when talking to xenstored over a
> pipe (to avoid sucumbing to SIGPIPE if xenstored has crashed), and forgo any
> playing with the signal disposition.
> 
> This has a side benefit of saving 2 syscalls per xenstore request.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


