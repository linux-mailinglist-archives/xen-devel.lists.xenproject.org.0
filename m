Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A568923ABE
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 11:53:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752177.1160317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOaC6-0006tM-Ub; Tue, 02 Jul 2024 09:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752177.1160317; Tue, 02 Jul 2024 09:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOaC6-0006rS-QV; Tue, 02 Jul 2024 09:53:02 +0000
Received: by outflank-mailman (input) for mailman id 752177;
 Tue, 02 Jul 2024 09:53:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Tas=OC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sOaC5-0006Mf-Em
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 09:53:01 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd99214d-3858-11ef-a59d-41c015c667e1;
 Tue, 02 Jul 2024 11:52:59 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52cdbc20faeso5710678e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 02:52:59 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab3b21esm1750630e87.285.2024.07.02.02.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 02:52:57 -0700 (PDT)
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
X-Inumbo-ID: dd99214d-3858-11ef-a59d-41c015c667e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719913979; x=1720518779; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SOpZdXuXKegN/w3QmLeYdMRDXF8OFepEE3JBiJYY1Y0=;
        b=Mi1DKyVHrtPXKhR6UxwU+agWJrtCIt/TYEdlv9LWZ0lA6M3p6HdfBZ0elXzpvw+MAR
         +iwUl8p5h+CVNgAKsXYorpVYQooH6BLIS7Fr6NEPF6W7PSHzmyIxuBeNGVYaRovWawvV
         0V4COogJlX0BlmlRi4XWqDb+Y2DuCCrDLmywv/wN0hdeVIctzhcL2N9IMuu57Pzk885K
         9BkkkQCW6KvbY1tKhkVELL4zigzM0KGLEglXsArYmR1xNGPitZDu68+FrF4PZImbBtM0
         OcR7L6IIyvqYbwOY7WDNqEH/s5u70b3cErO45+rCYKtGmL10dmz1aSb3GtP/MEQNN2YW
         Ii9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719913979; x=1720518779;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SOpZdXuXKegN/w3QmLeYdMRDXF8OFepEE3JBiJYY1Y0=;
        b=HWwi/2BTCpbveJSHVssIb0FdBXOLh09gmrmb5jTigodJLhT1fw+JbdmMoWo6l7yLxc
         1O1yKWH0KuPABFL1J1DzYzR1tTUfgBd17QZ9pKmpknbzXjdW1zbbBgbulQyvow3BaTz4
         pEwUTWyD6puC1E4FxRUcN5K7USywKvW3PaQLvzgfJiFP5C1VyJGkLsiIehZMB0UgKZFh
         zIxRYgn201mwOGcH1EOa3kEG6au1we4SF3tzf28uWmAP/Jq9cPl55qWfvPnQqqlPrb4W
         buss+3bcAFnLJNHKmR1YSwJHFDAn/oaS7F+36ZjwjT7ADLGaycVhT8/qAhmROlI3JKVz
         R4QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYnZuD+ycE6mcsNuDdRgWcM4jpfb+mpdIlxGTNHOiKPffJ8iTerJJ7Dq0IhlK4FSer2FznRcPqFwA5TuLdBDAh4AS0vpOgok246BSP94I=
X-Gm-Message-State: AOJu0YyGnU4vg1rmugAVeJCcXp4+dcemFWh9vnGqpeDAVSjDpqRAFuJy
	CY/Poii8Ye3ZZ3XgvhHQZsmT7a/zj7Kg2yd6IksFRsS9L5hAy/+A
X-Google-Smtp-Source: AGHT+IH3Ou6I+bA0F1KXq5LY0AsOVjQ6pyZ4xwe+KZqzhGb5sh6gRsezm0YKuSzcqIdfRk6c7nnqZw==
X-Received: by 2002:a05:6512:3d08:b0:52c:dcd4:8953 with SMTP id 2adb3069b0e04-52e8268884amr6644800e87.36.1719913978081;
        Tue, 02 Jul 2024 02:52:58 -0700 (PDT)
Message-ID: <f3a735be19793ebd42f181e650f959e6b32919cd.camel@gmail.com>
Subject: Re: [PATCH for-4.19?] xen: avoid UB in guest handle field accessors
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>,  "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
  Stefano Stabellini <sstabellini@kernel.org>
Date: Tue, 02 Jul 2024 11:52:57 +0200
In-Reply-To: <0ef2392a-0da8-4cf6-b795-7a704e2ff396@citrix.com>
References: <d0b9a1e0-5c70-42c5-9c63-2e3af82487b2@suse.com>
	 <0ef2392a-0da8-4cf6-b795-7a704e2ff396@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-07-01 at 16:36 +0100, Andrew Cooper wrote:
> On 24/06/2024 1:28 pm, Jan Beulich wrote:
> > Much like noted in 43d5c5d5f70b ("xen: avoid UB in guest handle
> > arithmetic"), address calculations involved in accessing a struct
> > field
> > can overflow, too. Cast respective pointers to "unsigned long" and
> > convert type checking accordingly. Remaining arithmetic is, despite
> > there possibly being mathematical overflow, okay as per the C99
> > spec:
> > "A computation involving unsigned operands can never overflow,
> > because a
> > result that cannot be represented by the resulting unsigned integer
> > type
> > is reduced modulo the number that is one greater than the largest
> > value
> > that can be represented by the resulting type." The overflow that
> > we
> > need to guard against is checked for in array_access_ok().
> >=20
> > While there add the missing (see {,__}copy_to_guest_offset()) is-
> > not-
> > const checks to {,__}copy_field_to_guest().
> >=20
> > Typically, but not always, no change to generated code; code
> > generation
> > (register allocation) is different for at least
> > common/grant_table.c.
> >=20
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii


