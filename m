Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C2D1CA73A
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 11:33:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWzMW-0003y4-Ht; Fri, 08 May 2020 09:32:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EkJI=6W=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jWzMU-0003xz-Cx
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 09:32:06 +0000
X-Inumbo-ID: c7d61e44-910e-11ea-b07b-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c7d61e44-910e-11ea-b07b-bc764e2007e4;
 Fri, 08 May 2020 09:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588930325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Fizs/jTz7Evgj0jXTg1CAo/rJD+kXMrBLYhiLKYfrQ=;
 b=Fi8wGB5EusAwDTyYNh1QdRQem4LZFAeCdYJDfmnQNfcuHJv/MfRTXYwYqUJDVaDBNz4N5F
 0SB0nIuCq1GjpbWJoJJ7HQPMAsB2pzJ5sWI6sruMBzcTVohcGGdHCOcfTW3i2SPN3uyQpu
 BlPOD+fR4D7OvJwZkbVNCjniO01TXwM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-ArIIjk-3M16jwpj_FLuLuQ-1; Fri, 08 May 2020 05:32:02 -0400
X-MC-Unique: ArIIjk-3M16jwpj_FLuLuQ-1
Received: by mail-wm1-f72.google.com with SMTP id q77so230756wme.4
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2020 02:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BFoDHna6XRL92Q6uyxjk4+3nW/j50BtcEQYU7yuSZ4c=;
 b=HIC/INYXlbK8ZauqapVE3VFWQjjeaiGIlAzbQ+c2st/x/CeQC1vmWChii+A3SpSr2Q
 4ENASel1pnIljNdT7E8TQ0bUtH6ZseJpyShnJXSRkVzDztoJMoevoG0UDs1FOTQUuJZY
 2aEMK9SPfFve8lsVv/rsI3RvzBmixbXMYwrN6DDgSVbQ9qi5GZ4XLr3y7EyKJlECh/Vc
 q3n22sJf/q46SEOkrqUdzT9mngQ6ZRlRRzXQINZNqomofhq09gOWJEK5K007u1ED6GZU
 uH0Gey2KbPAgDa4mSBi+1SXGX/0XxQDcKHNP5pXmEIHn9XKwXgIY8QC9h1/1hT5uPVI+
 REaQ==
X-Gm-Message-State: AGi0PubMQv5MDs9v3PFwhT5nb81YZwfIBjVHH5mNBkGm/M9H6QbWetzP
 odaSPLxu+jTQPAQCP2dmrPwmWGET4ldPfWnxGwR34wKMAa4iknDP7PUEl/Lzrn+74j8+EI3m2da
 8QqcKXsIpvBNKPuPmvwYPpOtml9o=
X-Received: by 2002:a7b:ca47:: with SMTP id m7mr16080718wml.55.1588930321614; 
 Fri, 08 May 2020 02:32:01 -0700 (PDT)
X-Google-Smtp-Source: APiQypIn9j1oj4Str39MCCMkLIi/fuLFk9d58QkDTA/zKBxxIA1JCsgbH5eufVPx8yt9TWGYgHt8rQ==
X-Received: by 2002:a7b:ca47:: with SMTP id m7mr16080690wml.55.1588930321362; 
 Fri, 08 May 2020 02:32:01 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id i6sm1966693wrw.97.2020.05.08.02.31.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2020 02:32:00 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] exec: Check Xen is enabled before calling the Xen
 API
To: quintela@redhat.com
References: <20200508080738.2646-1-philmd@redhat.com>
 <20200508080738.2646-2-philmd@redhat.com> <87wo5mes6g.fsf@secure.mitica>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0731df30-b0c4-c7bf-6194-42cd6cc90ba5@redhat.com>
Date: Fri, 8 May 2020 11:31:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <87wo5mes6g.fsf@secure.mitica>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paul Durrant <paul@xen.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Juan,

On 5/8/20 10:39 AM, Juan Quintela wrote:
> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>   include/exec/ram_addr.h | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
>> index 5e59a3d8d7..dd8713179e 100644
>> --- a/include/exec/ram_addr.h
>> +++ b/include/exec/ram_addr.h
>> @@ -330,7 +330,9 @@ static inline void cpu_physical_memory_set_dirty_ran=
ge(ram_addr_t start,
>>           }
>>       }
>>  =20
>> -    xen_hvm_modified_memory(start, length);
>> +    if (xen_enabled()) {
>> +        xen_hvm_modified_memory(start, length);
>> +    }
>>   }
>>  =20
>>   #if !defined(_WIN32)
>> @@ -388,7 +390,9 @@ static inline void cpu_physical_memory_set_dirty_leb=
itmap(unsigned long *bitmap,
>>               }
>>           }
>>  =20
>> -        xen_hvm_modified_memory(start, pages << TARGET_PAGE_BITS);
>> +        if (xen_enabled()) {
>> +            xen_hvm_modified_memory(start, pages << TARGET_PAGE_BITS);
>> +        }
>>       } else {
>>           uint8_t clients =3D tcg_enabled() ? DIRTY_CLIENTS_ALL : DIRTY_=
CLIENTS_NOCODE;
>=20
> I don't object moving the xen code to accell.  But I think that this
> change is bad.
>=20
> On the following patch:
> - You export xen_allowed
>    (ok, it was already exported, but I think it shouldn't)
>=20
> (master)$ find . -type f | xargs grep xen_allowed
> ./hw/xen/xen-common.c:    ac->allowed =3D &xen_allowed;
> ./include/hw/xen/xen.h:extern bool xen_allowed;
> ./include/hw/xen/xen.h:    return xen_allowed;
> ./softmmu/vl.c:bool xen_allowed;
>=20
> This are all the users that I can find.
>=20
> And xen_havm_modified_memory() is an empty function if xen is not
> compiled in.  And in the case that xen is compiled in, the 1st thing
> that it checks is:
>=20
>     if (unlikely(xen_in_migration)) {
>=20
> That is way more restrictive that xen_enabled().
>=20
> So, I think that it is better to drop this patch, maintain next one, but
> just un-exporting xen_allowed.
>=20
> What do you think?

I blindly trust your judgement on this :) I'd rather not touch this code=20
but as it happens to be in "exec/ram_addr.h" I had to modify it.

Thanks for your reviews!

>=20
> Later, Juan.
>=20
>=20


