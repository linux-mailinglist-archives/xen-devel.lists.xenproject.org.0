Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C22446DAF
	for <lists+xen-devel@lfdr.de>; Sat,  6 Nov 2021 12:47:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222714.385051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjK9E-0008Al-Az; Sat, 06 Nov 2021 11:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222714.385051; Sat, 06 Nov 2021 11:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjK9E-00088M-7n; Sat, 06 Nov 2021 11:46:12 +0000
Received: by outflank-mailman (input) for mailman id 222714;
 Sat, 06 Nov 2021 11:46:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yfqQ=PZ=redhat.com=quintela@srs-se1.protection.inumbo.net>)
 id 1mjK9C-00088G-2d
 for xen-devel@lists.xenproject.org; Sat, 06 Nov 2021 11:46:10 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c5e19c4-3ef7-11ec-9787-a32c541c8605;
 Sat, 06 Nov 2021 12:46:02 +0100 (CET)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-l9HxVa9XPHqeru-QZjFeIw-1; Sat, 06 Nov 2021 07:45:58 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 g80-20020a1c2053000000b003331a764709so2152705wmg.2
 for <xen-devel@lists.xenproject.org>; Sat, 06 Nov 2021 04:45:57 -0700 (PDT)
Received: from localhost ([178.139.230.94])
 by smtp.gmail.com with ESMTPSA id t8sm8541831wmq.32.2021.11.06.04.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 04:45:55 -0700 (PDT)
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
X-Inumbo-ID: 1c5e19c4-3ef7-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636199159;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cnxx2Tj189dc6BUL6LWLlDG155Pqih41c6nmxkCVYvU=;
	b=dr9fx3yBFOkxmPfV62Leflen+5xwbDeT0MiPU/NxycPNz/5yJTQFqGSFeSqkwIW9+bM6/i
	b4kpwMfMNpjkCICYgk99pmb7iJdp+Ae+BFSWvQK9lT7WuPXZ5/r/Ulvy8AYH8ts+VdN0pi
	E6OZdSf1vs9Iid49JB+swZgjhvFjubo=
X-MC-Unique: l9HxVa9XPHqeru-QZjFeIw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
         :user-agent:reply-to:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cnxx2Tj189dc6BUL6LWLlDG155Pqih41c6nmxkCVYvU=;
        b=wz9RYnKGwoQABZTWiEGgf71fVRSw6pga8LuWz5VPrLqk/Zh1kshK+9FCwryAPQJ07b
         m8AIsWwW4AgAcUWnNcdlJQaGkDkm7gUzlb0RbHyIp6hzy/TzSvTS6Msbn5VYRjM/EB9I
         Kb3jpSnTz5RtgOFmHPYIdLS06DxjtF3qv2797u1ah6oNG/oEJI0DK2oPtGJK3TPc7mfB
         8ffx/3Cy1uV6gcG1wG19O7jZnDuZpE8n010wcpqjdWYzwAywJW3P7cND2wVtK/wtsNkE
         5nYC7p0kbciw5Cgjfx1HpAQINDp5QJZERB266/LWIag1XRiRkBJgYuyhl/s4JZbrBdVc
         gPBw==
X-Gm-Message-State: AOAM531St4wCyPRSMyNrqR+jLJVWw6AgBXYEg/NsaX/uY/bdxwkO8CHe
	V2Ce9D5HK0RBHkhmau0oSqdBgkZ5m9mNic90ErRHJDBvNF7YLAIm1Fmd9h8zDEr2aFbr4AMtNzR
	sQwtsPUgW0LiFDjSgc/kZ88RjTfM=
X-Received: by 2002:a7b:c4c4:: with SMTP id g4mr36521073wmk.93.1636199156729;
        Sat, 06 Nov 2021 04:45:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMxAvhoUUm4X8ECxWpBYCM4doPEZ8ec3FX/83U4znN+uCwNPGfmTfYrdtDKUB/9dwB/eM1YA==
X-Received: by 2002:a7b:c4c4:: with SMTP id g4mr36521035wmk.93.1636199156503;
        Sat, 06 Nov 2021 04:45:56 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org,  Laurent Vivier <laurent@vivier.eu>,  Markus
 Armbruster <armbru@redhat.com>,  David Hildenbrand <david@redhat.com>,
  Eduardo Habkost <ehabkost@redhat.com>,  xen-devel@lists.xenproject.org,
  Richard Henderson <richard.henderson@linaro.org>,  Stefano Stabellini
 <sstabellini@kernel.org>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
  Eric Blake <eblake@redhat.com>,  kvm@vger.kernel.org,  Peter Xu
 <peterx@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
  Paul Durrant <paul@xen.org>,  Paolo Bonzini <pbonzini@redhat.com>,  "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Anthony Perard <anthony.perard@citrix.com>,
  =?utf-8?B?SHltYW4gSHVhbmcow6nCu+KAnsOl4oC54oChKQ==?=
 <huangy81@chinatelecom.cn>
Subject: Re: [PULL 07/20] migration/dirtyrate: implement dirty-ring
 dirtyrate calculation
In-Reply-To: <6f8b30c5-d93d-882d-cf1a-502592e4bcf8@redhat.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 4 Nov 2021 23:05:14
 +0100")
References: <20211101220912.10039-1-quintela@redhat.com>
	<20211101220912.10039-8-quintela@redhat.com>
	<6f8b30c5-d93d-882d-cf1a-502592e4bcf8@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Sat, 06 Nov 2021 12:45:54 +0100
Message-ID: <87pmrdfqx9.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> Hi Juan,
>
> On 11/1/21 23:08, Juan Quintela wrote:
>> From: Hyman Huang(=C3=A9=C2=BB=E2=80=9E=C3=A5=E2=80=B9=E2=80=A1) <huangy=
81@chinatelecom.cn>
>>=20
>> use dirty ring feature to implement dirtyrate calculation.
>>=20
>> introduce mode option in qmp calc_dirty_rate to specify what
>> method should be used when calculating dirtyrate, either
>> page-sampling or dirty-ring should be passed.
>>=20
>> introduce "dirty_ring:-r" option in hmp calc_dirty_rate to
>> indicate dirty ring method should be used for calculation.
>>=20
>> Signed-off-by: Hyman Huang(=C3=A9=C2=BB=E2=80=9E=C3=A5=E2=80=B9=E2=80=A1=
) <huangy81@chinatelecom.cn>
>
> Just noticing in the git history some commits from your
> pull request have the author name (from + S-o-b) mojibaked.

Didn't knew the term.

I noticed that after the fact.  Still have to debug *why* my setup
decided to break some of the patches and not the others.  Obviosly, I
have no clue about how to write/read/whatever anything that is not
latin1, so if something breaks, I got in a difficult place O:-)

Thanks, Juan.

>> <7db445109bd18125ce8ec86816d14f6ab5de6a7d.1624040308.git.huangy81@chinat=
elecom.cn>
>> Reviewed-by: Peter Xu <peterx@redhat.com>
>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  qapi/migration.json    |  16 +++-
>>  migration/dirtyrate.c  | 208 +++++++++++++++++++++++++++++++++++++++--
>>  hmp-commands.hx        |   7 +-
>>  migration/trace-events |   2 +
>>  4 files changed, 218 insertions(+), 15 deletions(-)


