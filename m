Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DC9A7033E
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 15:11:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926541.1329380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx4zU-0000PR-W0; Tue, 25 Mar 2025 14:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926541.1329380; Tue, 25 Mar 2025 14:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx4zU-0000MX-T6; Tue, 25 Mar 2025 14:10:52 +0000
Received: by outflank-mailman (input) for mailman id 926541;
 Tue, 25 Mar 2025 14:10:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7VIv=WM=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tx4zT-0000CY-FE
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 14:10:51 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3f77cc9-0982-11f0-9ffa-bf95429c2676;
 Tue, 25 Mar 2025 15:10:49 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-abbb12bea54so758089666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 07:10:49 -0700 (PDT)
Received: from localhost ([46.149.103.15]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efd78e0csm871074966b.175.2025.03.25.07.10.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 07:10:48 -0700 (PDT)
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
X-Inumbo-ID: f3f77cc9-0982-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1742911849; x=1743516649; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WM+wJdnCY8xldekOqKb7GHcXyDh9p4f/i2hWlanZigg=;
        b=X7sQumq0Y7imiheI7Oq8RWLH1T7zHS3cXEN2WNhgLVrMwT/BhL04nPCe19oLzytjVc
         ViXRXUu5JULNt2e2UwZWZ55ESDRKv0YEzik3+c/v8uQyBdqx2Ocg3SYk9JgKC6naGWrt
         3z3g29uZSCoZSzHYW022PkbL6K4y3fwMhYtYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742911849; x=1743516649;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WM+wJdnCY8xldekOqKb7GHcXyDh9p4f/i2hWlanZigg=;
        b=OA25KMNI/HniPsNa04AFgXvvSqpK0Ba0hEIc6wEO+lgR82IibLpw5sQK0HNWssAijr
         luZEMsj6IjmaxMTl3UcSfgNEdn+euZ0+avztnRqUm6wprxcb+cUU2HMOzxZ2LWW+2tAY
         HgAVQD9rpopcRL2LwKbJIllOxQdD6X07d+8tbGwmjQl3MqngMhKmAg/LPjgQS/VSiNqT
         MmfPk3/caPtZWX9JcGTyNONW6iGk1YNZIHjL7EbYaJkAg0BKX5DVpC5hFUZh58s82HVE
         Q9R+1xZ5YbCwei4GB56eMPmyyI02sOwvMzwkFPcaNILwPA2QewRRpnVtDKacktrrpVOa
         eHyg==
X-Forwarded-Encrypted: i=1; AJvYcCWv61p55Bm30butUVXgWMQ8Ndio+WQzS7vZ0sR/+Ti/GdXj++PKQrVYn5ZCR7AKafG746+mjW+BRlw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXOUcy3gxQbacbc+7Yf6rrKmxlbMRDCniybjWPE4W+P0lor/8o
	eQ574ddN+fIJlUqoJpf9j5iL+jJnF6/jx9vhtUkXtqyTlA9nbexq9ugkk1cKnqw=
X-Gm-Gg: ASbGnct25KOMeIfZLf1EjSYDawmQUgmKahvc0u3GObD0DS2NtHE/3x5jDtOSB28JvpE
	UOCdMY+zZ0/uxl2EcXCr8IFtfUNKCdio68VbbguTT7FApX7+4Y83Ui+lbjbcMjrFcm4yKaO64ns
	ebRxtw/2SRzrDWaJJxZDtEj9ZOSmCF7tZb4lAY8vBvJVKdU1sMYYaxbKtkThRM7ka8a0715waw4
	mLT8SGYUI4zNV5X3ZCVolS39YE+CFoYsmQ3GWbsH8g7oOGnMo4LF2an5AhUCLXVcAj/sX0Qb2au
	bPdvhf8GzReY9GakPyDH8kAwRlmTOTGMfljzH0YIZ1mMr5TRJac=
X-Google-Smtp-Source: AGHT+IGEj6CO7sCIEoN+U0iq7I97j4CkWd4oNA+NxZnJyjS8vShWFlE8/K0yOFeMCzZTeb1SGOzG/w==
X-Received: by 2002:a17:907:86a7:b0:ac2:b1e2:4b85 with SMTP id a640c23a62f3a-ac3f20bbdebmr1810462366b.3.1742911848620;
        Tue, 25 Mar 2025 07:10:48 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Mar 2025 14:10:46 +0000
Message-Id: <D8PEOOSAHKDM.24T29QJBK3MUN@cloud.com>
Subject: Re: [PATCH] tools/arm: Fix nr_spis handling v2
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Orzel, Michal" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross"
 <jgross@suse.com>, "Luca Fancellu" <luca.fancellu@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, "Julien Grall" <julien@xen.org>,
 "Bertrand Marquis" <bertrand.marquis@arm.com>
X-Mailer: aerc 0.18.2
References: <20250318090013.100823-1-michal.orzel@amd.com>
 <D8KAQ3MH52YA.1G12M32NDFRJW@cloud.com>
 <17608388-b900-45d2-bb74-8eec04ab1f76@amd.com>
 <D8OLLCXYKINR.3HD274I110XCF@cloud.com>
 <66815d0d-9330-468e-b601-cb8aa6be1c36@amd.com>
In-Reply-To: <66815d0d-9330-468e-b601-cb8aa6be1c36@amd.com>

On Mon Mar 24, 2025 at 3:31 PM GMT, Michal Orzel wrote:
>
>
> On 24/03/2025 16:22, Alejandro Vallejo wrote:
> >=20
> >=20
> > On Mon Mar 24, 2025 at 1:08 PM GMT, Michal Orzel wrote:
> >>
> >>
> >> On 19/03/2025 15:01, Alejandro Vallejo wrote:
> >>>
> >>> Doesn't this regenerate the golang bindings?
> >> FYI, it does not. The bindings are already there for NrSpis and defaul=
t value is
> >> does not result in a change (for verification I checked max_grant_fram=
es that
> >> uses LIBXL_MAX_GRANT_DEFAULT).
> >>
> >> ~Michal
> >=20
> > Oh, good then. Though it does raise the (completely separate) question =
of how
> > correct those bindings might be if they ignore the IDL's default values=
... :/
> Why ignore. AFAICS libxl_domain_build_info_init is called there to grab d=
efault
> values.
>
> ~Michal

Oh, so the default populator is itself autogenerated C with a golang bindin=
g
rather than native golang. Fair enough. The more you learn.

Cheers,
Alejandro

