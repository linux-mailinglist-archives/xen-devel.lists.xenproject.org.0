Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5981CA63D
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 10:40:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWyY4-0007hZ-Bl; Fri, 08 May 2020 08:40:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lkD8=6W=redhat.com=quintela@srs-us1.protection.inumbo.net>)
 id 1jWyY2-0007hU-DA
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 08:39:58 +0000
X-Inumbo-ID: 7f74bc16-9107-11ea-9887-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 7f74bc16-9107-11ea-9887-bc764e2007e4;
 Fri, 08 May 2020 08:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588927197;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=reH0qvTpLHYW8AWLzCTVWmAxiqSUgDgGOqWacJWsPL4=;
 b=F+nOJbNywZ4BQzzYq65k49vgj1uoOxf1jyuXv21l7fgfGP/Tjwg58PVgpZQhEeynCw97iy
 KEqmVXDOpqGK4YslgEXhc5mXRd2Z8sTb+VAwmqJ/ekIq5JZiyU2oVGHQGFaPRbKmUrk4tE
 ue3CzrfVxCqCrcNTIzpslDOL8A8g/Ao=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-AUDqd_F7NLqPCzLpAlygWA-1; Fri, 08 May 2020 04:39:55 -0400
X-MC-Unique: AUDqd_F7NLqPCzLpAlygWA-1
Received: by mail-wr1-f69.google.com with SMTP id e14so543258wrv.11
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2020 01:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Oums1JEin6yJ+Rlwcse4Oz5sWMkUJewVQwCMYJIC6+w=;
 b=GBHxfgFjLHbpC3I6EgtKjXh2xZ1fecmDT8+IK9xxnrx3rOemTljvQJncKjlq4OBIs8
 4z0NhUJpz0cdNC3plWearNgmG1PwOG2EFk301PE/mzibSX97MtBj/1tHos6VNOHNioop
 a4kPw2fdfeexDkFyXvndRNpMPTPOO5zDY1qC45Wut3kgYNiqxY25EESk3y4DGdgIlrNd
 uG1TsYjdSflhsYZkd3+htjJmh23wstMx0Do6OUEi/sxvsV54y957+Ko673H7A1d5zbw+
 AVTeUZSOKw14EiCnhtPbKloJsDbPOHoEgxLFZn0GVvzgXjsMs6BbfMoHaZubTl5hmeTD
 fM6A==
X-Gm-Message-State: AGi0PuZjTA3fUaj3COV9UljcUZZhVbiEnLrRlAY05hcRJXEiOYVr9kr7
 WQF1pje7MZhMEHhTBcaRwgqIbD7EFlBgQqTyXEWIsS7sdfGijKHnaVEYMmXOKogETT5IGbkd2/c
 Vr4hh33g8Lx5IMJD2NyyKhAKpg3w=
X-Received: by 2002:a1c:3985:: with SMTP id
 g127mr15211426wma.102.1588927194301; 
 Fri, 08 May 2020 01:39:54 -0700 (PDT)
X-Google-Smtp-Source: APiQypIGZvQSiAVo/M2tuOGa6PEpWsThKAvLNEB70YMcWK9+Ce3x+uPZMGBN2OqDydYDc6Du++rEkg==
X-Received: by 2002:a1c:3985:: with SMTP id
 g127mr15211401wma.102.1588927194082; 
 Fri, 08 May 2020 01:39:54 -0700 (PDT)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id m6sm1808275wrq.5.2020.05.08.01.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 01:39:52 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 1/2] exec: Check Xen is enabled before calling the Xen
 API
In-Reply-To: <20200508080738.2646-2-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 8 May 2020 10:07:37
 +0200")
References: <20200508080738.2646-1-philmd@redhat.com>
 <20200508080738.2646-2-philmd@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Fri, 08 May 2020 10:39:51 +0200
Message-ID: <87wo5mes6g.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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
Reply-To: quintela@redhat.com
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

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/exec/ram_addr.h | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
> index 5e59a3d8d7..dd8713179e 100644
> --- a/include/exec/ram_addr.h
> +++ b/include/exec/ram_addr.h
> @@ -330,7 +330,9 @@ static inline void cpu_physical_memory_set_dirty_rang=
e(ram_addr_t start,
>          }
>      }
> =20
> -    xen_hvm_modified_memory(start, length);
> +    if (xen_enabled()) {
> +        xen_hvm_modified_memory(start, length);
> +    }
>  }
> =20
>  #if !defined(_WIN32)
> @@ -388,7 +390,9 @@ static inline void cpu_physical_memory_set_dirty_lebi=
tmap(unsigned long *bitmap,
>              }
>          }
> =20
> -        xen_hvm_modified_memory(start, pages << TARGET_PAGE_BITS);
> +        if (xen_enabled()) {
> +            xen_hvm_modified_memory(start, pages << TARGET_PAGE_BITS);
> +        }
>      } else {
>          uint8_t clients =3D tcg_enabled() ? DIRTY_CLIENTS_ALL : DIRTY_CL=
IENTS_NOCODE;

I don't object moving the xen code to accell.  But I think that this
change is bad.

On the following patch:
- You export xen_allowed
  (ok, it was already exported, but I think it shouldn't)

(master)$ find . -type f | xargs grep xen_allowed
./hw/xen/xen-common.c:    ac->allowed =3D &xen_allowed;
./include/hw/xen/xen.h:extern bool xen_allowed;
./include/hw/xen/xen.h:    return xen_allowed;
./softmmu/vl.c:bool xen_allowed;

This are all the users that I can find.

And xen_havm_modified_memory() is an empty function if xen is not
compiled in.  And in the case that xen is compiled in, the 1st thing
that it checks is:

   if (unlikely(xen_in_migration)) {

That is way more restrictive that xen_enabled().

So, I think that it is better to drop this patch, maintain next one, but
just un-exporting xen_allowed.

What do you think?

Later, Juan.



