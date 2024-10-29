Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A83D9B51BD
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 19:27:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827826.1242580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5qvW-0004Px-1P; Tue, 29 Oct 2024 18:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827826.1242580; Tue, 29 Oct 2024 18:26:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5qvV-0004OQ-Ub; Tue, 29 Oct 2024 18:26:45 +0000
Received: by outflank-mailman (input) for mailman id 827826;
 Tue, 29 Oct 2024 18:26:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mpqm=RZ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5qvU-0004KP-Jg
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 18:26:44 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5779c074-9623-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 19:26:40 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a9a26a5d6bfso886719766b.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 11:26:40 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b30c7adadsm502134666b.175.2024.10.29.11.26.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 11:26:39 -0700 (PDT)
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
X-Inumbo-ID: 5779c074-9623-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmMiLCJoZWxvIjoibWFpbC1lajEteDYyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjU3NzljMDc0LTk2MjMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjI2NDAwLjkwNDY1Nywic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730226400; x=1730831200; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6JrJRDM7bg2hJrU/89bqF5ROISm6zgfOMVlqD8j/Hc=;
        b=Trbq0BiQFdaSvc8SKidoLjK7HUBn48UaJ1RWlZHyPTo6T9spfiFgXLTnptQc/+OQLM
         F5H7iffvfxnTGIPqIciCFonWjkRucEe3a5Q2InqifWQIc3T+fIg0pWw78Jnw7YVdfjzH
         f7L9cQGrwwey/9graG4piLLK3vjx9fhbGywnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730226400; x=1730831200;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q6JrJRDM7bg2hJrU/89bqF5ROISm6zgfOMVlqD8j/Hc=;
        b=LVOqeKQvGtTzAjjpiykZUbV2WkQN4dEVfbOG+7ud+EtYAGbbVjVT6BWdHzsWMG1diI
         WLqOzWAxCC+ZnkoS3OFwr+DCLjN+vMvX/CexwEZaww1Xx8Lte4lfjeQLZDNMO8E5lPvz
         3wCuCAT4wbFmkkYBXKELXo9RBK8LD3FddNS3AZdZeJUXgXWXVELGWv2WEoeHU1TyDMcz
         7nrtzKE5H331YNw4M7xcwqkqzsMKsb44uyZ/OoGXgjHKu/LU9bTYg1t3rZzi53bIYgw9
         QuqpPJwuqPwDdS+g4vQr/BgWH9EvbMkFm35tS2c83NawaMuHrHHBf5BFh19negogGfND
         tP+g==
X-Forwarded-Encrypted: i=1; AJvYcCWl8zA4Vluek563gMC+ptzDKilWoN2ptt7V0biPiROIdbod72UR38PyFTuDw6At8i4fog1SGyHrve8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzcti0hq3KWakLqur51dxstu6WGe8GhOKdYMo6l/1I4MprTnue7
	ZdbOv1mBpY/OIr/ZaNUxHL8VVdletUQJos8IRpdrf585BirsVTu/73DN1xw1lyA=
X-Google-Smtp-Source: AGHT+IEG96jJMLVa/zEsvtbB49D2/vxji/KujMcIpX5443FvnaMMYS3mf70tEmQ5kkAIISmSa7Msog==
X-Received: by 2002:a17:907:3e1c:b0:a90:df6f:f086 with SMTP id a640c23a62f3a-a9de5c9f32amr1106527166b.11.1730226400272;
        Tue, 29 Oct 2024 11:26:40 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Oct 2024 18:26:38 +0000
Message-Id: <D58I2I9IY2VV.FGUNJOWYNQ7U@cloud.com>
Cc: "Jan Beulich" <JBeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/cpu-policy: Extend the guest max policy max
 leaf/subleaves
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20241029175505.2698661-1-andrew.cooper3@citrix.com>
In-Reply-To: <20241029175505.2698661-1-andrew.cooper3@citrix.com>

On Tue Oct 29, 2024 at 5:55 PM GMT, Andrew Cooper wrote:
> We already have one migration case opencoded (feat.max_subleaf).  A more
> recent discovery is that we advertise x2APIC to guests without ensuring t=
hat
> we provide max_leaf >=3D 0xb.
>
> In general, any leaf known to Xen can be safely configured by the toolsta=
ck if
> it doesn't violate other constraints.
>
> Therefore, introduce guest_common_{max,default}_leaves() to generalise th=
e
> special case we currently have for feat.max_subleaf, in preparation to be=
 able
> to provide x2APIC topology in leaf 0xb even on older hardware.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Cheers,
Alejandro

