Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C3C25A989
	for <lists+xen-devel@lfdr.de>; Wed,  2 Sep 2020 12:35:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDQ5v-0004p6-7s; Wed, 02 Sep 2020 10:34:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Eot/=CL=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1kDQ5u-0004p1-6H
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2020 10:34:22 +0000
X-Inumbo-ID: b5bc94fd-b0d8-4b83-8a6b-cb34f8157334
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id b5bc94fd-b0d8-4b83-8a6b-cb34f8157334;
 Wed, 02 Sep 2020 10:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599042858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PXBhtaRI8GbK37HD3MQj1XXzIUWZBG4uV41KUm49E4E=;
 b=La2nw6dKIM8JtZ/24FhiFmisMYwlFLwOxvB0sLN/v2DWCKoQxl4+aI1ws7hfPG2TCqtmqb
 u7HCM3TmzGx/8IhqfuKt00Ryu3Vr0docFfMcW4RUuIZ4WwStd4o9fWldlRCeIq8cGioQCv
 VPFbCGA3JNaiynmY4zxPGV80bjO5tYU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-4zAZvYo_MbGmNx4sLDPZtQ-1; Wed, 02 Sep 2020 06:34:15 -0400
X-MC-Unique: 4zAZvYo_MbGmNx4sLDPZtQ-1
Received: by mail-ed1-f70.google.com with SMTP id r19so1992414edq.12
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2020 03:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=6YbE9ocgSEbs212dC/3NaXleeyro7z5HehKfcKWSbBA=;
 b=Q5XkOOYfHCz0nqXU7dvj7OdHQMhg6gBUtiOcTuZHAUVwx8u5wksicYNLYqwdOrwMc7
 IvNGF0SZn1z9SN1zovLX/MDo4U9XVAwSj+J0vIiqoUOnoSP4aZjfi2qYvEWEvhed7iz0
 ySRuj7v1jmmQKvviHVm3CeIuDPNjADxzgy5w70tbGCEURyurW67hwnXW+urZ5shHHccN
 DkomS3Dz2VdDK25lmkN7vSzxjSMnf44vvEARTJXaDZEtSeBiet71cmWcGi41EoS1KX74
 Grp58JF7+PpPMu05p9GGjfnkwlApjaUHj6md/bq8zmO3Yx3pvkheNKg81j2d7jAbW8f4
 ULuA==
X-Gm-Message-State: AOAM5330PBMoNQ0ibGFevq2NN+qufnpI60ECRlch6wL1PPr3CmJ/PEra
 MFwSzVeP8bFLs7lXQ6GLJNxSHoT66xkeKei5a7nhJfxjY0L/S14lWiqmtS9LIQZK0YO9q9PIj4x
 CaFw9nVMA+2SbnsKulGmK23PgEcM=
X-Received: by 2002:a50:8e52:: with SMTP id 18mr5951893edx.28.1599042853960;
 Wed, 02 Sep 2020 03:34:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyfvB2OEfbLYHiQ0iuRWX5RnGHRm0NO4ryqac7O6KtUoD1XTteJLc6sk4G2sRZytr3cwXHFA==
X-Received: by 2002:a50:8e52:: with SMTP id 18mr5951872edx.28.1599042853725;
 Wed, 02 Sep 2020 03:34:13 -0700 (PDT)
Received: from ?IPv6:2003:c2:2f12:bb04:81d3:a22d:db7e:2eac?
 (p200300c22f12bb0481d3a22ddb7e2eac.dip0.t-ipconnect.de.
 [2003:c2:2f12:bb04:81d3:a22d:db7e:2eac])
 by smtp.gmail.com with ESMTPSA id x1sm3831470ejc.119.2020.09.02.03.34.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2020 03:34:13 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v1 4/5] xen/balloon: try to merge system ram resources
Date: Wed, 2 Sep 2020 12:34:12 +0200
Message-Id: <24371321-8A12-4EBD-864C-A2B50E886BF7@redhat.com>
References: <226413fc-ef25-59bd-772f-79012fda0ee3@suse.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Baoquan He <bhe@redhat.com>, Wei Yang <richardw.yang@linux.intel.com>
In-Reply-To: <226413fc-ef25-59bd-772f-79012fda0ee3@suse.com>
To: =?utf-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>
X-Mailer: iPhone Mail (17G68)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0.503
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> Am 02.09.2020 um 12:15 schrieb J=C3=BCrgen Gro=C3=9F <jgross@suse.com>:
>=20
> =EF=BB=BFOn 21.08.20 12:34, David Hildenbrand wrote:
>> Let's reuse the new mechanism to merge system ram resources below the
>> root. We are the only one hotplugging system ram (e.g., DIMMs don't appl=
y),
>> so this is safe to be used.
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Michal Hocko <mhocko@suse.com>
>> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>> Cc: Juergen Gross <jgross@suse.com>
>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>> Cc: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> Cc: Julien Grall <julien@xen.org>
>> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
>> Cc: Baoquan He <bhe@redhat.com>
>> Cc: Wei Yang <richardw.yang@linux.intel.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>  drivers/xen/balloon.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>> diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
>> index 37ffccda8bb87..5ec73f752b8a7 100644
>> --- a/drivers/xen/balloon.c
>> +++ b/drivers/xen/balloon.c
>> @@ -338,6 +338,10 @@ static enum bp_state reserve_additional_memory(void=
)
>>      if (rc) {
>>          pr_warn("Cannot add additional memory (%i)\n", rc);
>>          goto err;
>> +    } else {
>> +        resource =3D NULL;
>> +        /* Try to reduce the number of system ram resources. */
>> +        merge_system_ram_resources(&iomem_resource);
>>      }
>=20
> I don't see the need for setting resource to NULL and to use an "else"
> clause here.
>=20

I set it to NULL because the pointer may be stale after that call - to avoi=
d future bugs. But I can drop it.

Ack to the =E2=80=9Eelse=E2=80=9C case.

Thanks for having a look!

>=20
> Juergen
>=20


