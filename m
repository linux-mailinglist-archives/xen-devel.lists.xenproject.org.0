Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A8F90E3FF
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 09:06:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743446.1150348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJpOA-0007zy-Fm; Wed, 19 Jun 2024 07:05:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743446.1150348; Wed, 19 Jun 2024 07:05:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJpOA-0007yT-Cs; Wed, 19 Jun 2024 07:05:50 +0000
Received: by outflank-mailman (input) for mailman id 743446;
 Wed, 19 Jun 2024 07:05:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hxBI=NV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sJpO9-0007yJ-Ix
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 07:05:49 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a33ff5c-2e0a-11ef-b4bb-af5377834399;
 Wed, 19 Jun 2024 09:05:47 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3609565a1bdso2501738f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2024 00:05:47 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36262f77ad9sm3040467f8f.109.2024.06.19.00.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 00:05:46 -0700 (PDT)
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
X-Inumbo-ID: 5a33ff5c-2e0a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718780747; x=1719385547; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FnJcbZR1wadcGo0ka0WGG6S+d48KhFZlkXZKoDcxjHY=;
        b=fQgfrs4Ybv9PwJ8eJMtyShTPAIxRmCHiUx/3RHGNl/BCIeSf4sOIIHMDVPkWTOJOge
         3YXZjTRkKovMfF0zShFP3KwPyWkGnm5vpbx0LuSq9lmy8KL1jGuT4p3kKmXnFwLPzX/u
         RZGm1YbCk6Bg2SBDuer+HQCVBnv2LbuYvODkYn0PPeeUZ8fCuhG5p+qqkYLq7k93xfHp
         HjHx2K47P39pzA4/bx2hAoiAbHPB+jDIAVx8Di5Im4IAyc4/mlj0bWZ+jId+vwCgvDiw
         duEHDQdr+uKD9QrKVLom6Oe6BQXM5L3tm4XzakBz24oyBSLGKav2tVuqfRTIB888JsdS
         c17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718780747; x=1719385547;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FnJcbZR1wadcGo0ka0WGG6S+d48KhFZlkXZKoDcxjHY=;
        b=dLDW65HGRhNSXaDIVB81Y/N2g6dA4DAFePAK7r7MPV9K/Izl5Esm2IFeYyUaW6ZQbk
         dFlH39kprI59A3TV1Mkoa3/IAzsGdvuLRb0YJUdhCh6BE1K5xvpPyVmjV/famUe98fS0
         pia8wCATyKq0558w9ygPpkds4qGY9leW4uMF2/5DhwQKMNSxOxTwQ9595UEJejznznsL
         h7dMer845wpfNsV4nEnx1VQGyXGlakOTabyOCilb1uCi6sP1AkK9Qa8Dnn56hh37SUGA
         QK79d3AcAG+YBRXDENB96jayw7pQvVI0IBFPmQBRPaoRC1S10eyg8W/98W3Dcz8IfcpT
         zoNA==
X-Forwarded-Encrypted: i=1; AJvYcCUw5O/kVfLIBigT6G7ulVTE6LNhvYH/RENrdfhS4o2F43TPEFD7h8uKwcPBEMz4njazQjhYzoC2V9eT+xqYd+Wfii65ypxL9jE4VVbwaS0=
X-Gm-Message-State: AOJu0YzPRMRDUhwR0pBOB4M0KPMtwap8AzBJ+QHR0lsDXo9td1v1LnnZ
	qOltFwYLv9yqr2vI0jv9auCfxFI1CAjJpu53uHC2K239teZwjZMM
X-Google-Smtp-Source: AGHT+IEvlIuV/yjWjqeb0415ez2uvAKwDu1mpzkxvSfuMYRY3iOg7nnQUpCWwhaDVyQF9p38G+pHVw==
X-Received: by 2002:adf:f48a:0:b0:360:96c5:fdfd with SMTP id ffacd0b85a97d-36317c7ee07mr1159993f8f.30.1718780746606;
        Wed, 19 Jun 2024 00:05:46 -0700 (PDT)
Message-ID: <ecc96961b27d45ac6a5ca7a761f4d8c801c26d5e.camel@gmail.com>
Subject: Re: [PATCH for-4.19] avoid UB in guest handle arithmetic
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>,  "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
  Stefano Stabellini <sstabellini@kernel.org>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Date: Wed, 19 Jun 2024 09:05:45 +0200
In-Reply-To: <13a5650d-8623-4fec-9383-ef04023257ff@citrix.com>
References: <227fbeda-1690-4158-8404-53b4236c0235@suse.com>
	 <13a5650d-8623-4fec-9383-ef04023257ff@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Tue, 2024-06-18 at 14:24 +0100, Andrew Cooper wrote:
> On 19/03/2024 1:26 pm, Jan Beulich wrote:
> > At least XENMEM_memory_exchange can have huge values passed in the
> > nr_extents and nr_exchanged fields. Adding such values to pointers
> > can
> > overflow, resulting in UB. Cast respective pointers to "unsigned
> > long"
> > while at the same time making the necessary multiplication
> > explicit.
> > Remaining arithmetic is, despite there possibly being mathematical
> > overflow, okay as per the C99 spec: "A computation involving
> > unsigned
> > operands can never overflow, because a result that cannot be
> > represented
> > by the resulting unsigned integer type is reduced modulo the number
> > that
> > is one greater than the largest value that can be represented by
> > the
> > resulting type." The overflow that we need to guard against is
> > checked
> > for in array_access_ok().
> >=20
> > Note that in / down from array_access_ok() the address value is
> > only
> > ever cast to "unsigned long" anyway, which is why in the invocation
> > from
> > guest_handle_subrange_okay() the value doesn't need casting back to
> > pointer type.
> >=20
> > In compat grant table code change two guest_handle_add_offset() to
> > avoid
> > passing in negative offsets.
> >=20
> > Since {,__}clear_guest_offset() need touching anyway, also deal
> > with
> > another (latent) issue there: They were losing the handle type,
> > i.e. the
> > size of the individual objects accessed. Luckily the few users we
> > presently have all pass char or uint8 handles.
> >=20
> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> There wants to be a xen: prefix in the subject.
>=20
> But as for the UB aspect, I've checked that this does resolve the
> failure identified by the XSA-212 XTF test.
>=20
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> CC'ing Oleksii as this wants to go into 4.19.
Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii


