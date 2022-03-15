Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 341B54D9CFC
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 15:08:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290813.493318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU7qC-0007ym-H8; Tue, 15 Mar 2022 14:08:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290813.493318; Tue, 15 Mar 2022 14:08:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU7qC-0007w6-Ca; Tue, 15 Mar 2022 14:08:00 +0000
Received: by outflank-mailman (input) for mailman id 290813;
 Tue, 15 Mar 2022 14:07:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oahv=T2=gmail.com=philippe.mathieu.daude@srs-se1.protection.inumbo.net>)
 id 1nU7qA-0007w0-JL
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 14:07:58 +0000
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 500f3e4c-a469-11ec-8eba-a37418f5ba1a;
 Tue, 15 Mar 2022 15:07:57 +0100 (CET)
Received: by mail-pj1-x102d.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so2508790pjl.4
 for <xen-devel@lists.xenproject.org>; Tue, 15 Mar 2022 07:07:57 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m125-20020a628c83000000b004f7baad5c20sm10671055pfd.144.2022.03.15.07.07.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 07:07:55 -0700 (PDT)
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
X-Inumbo-ID: 500f3e4c-a469-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=n5RJV7EKOnS1kazx80dECSrxKL3JUdNPyUQ+rH9sbVY=;
        b=HJForaCGjZ8+I/OPktEd9hFdMN585TTk+jl0Z7jRfAN/CjsP95sSEv7t3CUHUya9Fq
         cmUxhqCxwnY8Jq9ZkM9jf+mTNdryW8tioEHIGLTnxomd2LGvSvmFeOEFu1+TJUQv/gsA
         YaORRHawDzG1lXX9EHWybS1bRAYDLNtJF2kJHqL54XciTXijv6ZA3GOWFkvtFiHLZ+SA
         4kf26f+rEExuA6NlZ1qB3stka8I1CYBJz/5JQegh/lDX4u2BnNEce4wHmJ5LrJiopGsP
         QZQsfwz8N7g6wzUwgwsojTXJm7WfA39eegwwQBtQsfwcFCsGITjD3GnOhrtFtvdHKflj
         KUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=n5RJV7EKOnS1kazx80dECSrxKL3JUdNPyUQ+rH9sbVY=;
        b=TDPDAQZRqVg0zMTqfwQ+3wwo7gTgkCSQ3ruw1yz7YSyL4HduFGyCLCdyyRd0RD8g/K
         X49UuJgA6SYvvriWzfTBXaGrsMZTVZe75pWMs81jH1gWdS6zPLa+eCot7bPupqM+xheL
         acrphT0uVPyxpfVq5ST0zT6hVT568n0tq5G79bfV8CwDUaPbfzSuFl9hBBqTKaHbO/6e
         H880oTkTjPDbj72gevblPTuhRSd/ZGM+c0YBWMoDrtRRhz7LbZ/7G/OghaNvyg9Vg4gv
         Z6kFsvK68w9v03eqKgjEIJ6iYlehHZYx8hC5KgxhIZ4V1TNEC2xTtY66cVCnDRYOKZy9
         lzxQ==
X-Gm-Message-State: AOAM532modj0hPGj1q8mHvQVrU7oE4J/G0v2BNFozM6sVDv6iKHpReBm
	8h+3jPZIyFWcXUgfsUtUX/Q=
X-Google-Smtp-Source: ABdhPJzx03KXda7KzQgJ08jUr9c6CHZ/lPdQQFMd5dF0oFpdZHS7Vx/Bjs3VhxRjXoejIy7drn4agA==
X-Received: by 2002:a17:902:9b97:b0:153:85ac:abc0 with SMTP id y23-20020a1709029b9700b0015385acabc0mr7132480plp.100.1647353275700;
        Tue, 15 Mar 2022 07:07:55 -0700 (PDT)
Message-ID: <02307072-4bff-dbbb-67fb-ca9800c34b3c@gmail.com>
Date: Tue, 15 Mar 2022 15:07:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 3/3] Use g_new() & friends where that makes obvious sense
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Laurent Vivier <lvivier@redhat.com>,
 Amit Shah <amit@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Corey Minyard <cminyard@mvista.com>, Patrick Venture <venture@google.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Keith Busch
 <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Michael Roth
 <michael.roth@amd.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 David Hildenbrand <david@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Colin Xu <colin.xu@intel.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Cornelia Huck
 <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 haxm-team@intel.com, qemu-s390x@nongnu.org
References: <20220314160108.1440470-1-armbru@redhat.com>
 <20220314160108.1440470-4-armbru@redhat.com> <87y21c401e.fsf@linaro.org>
 <875yofl3k3.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <875yofl3k3.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/3/22 14:59, Markus Armbruster wrote:
> Alex Bennée <alex.bennee@linaro.org> writes:
> 
>> Markus Armbruster <armbru@redhat.com> writes:
>>
>>> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
>>> for two reasons.  One, it catches multiplication overflowing size_t.
>>> Two, it returns T * rather than void *, which lets the compiler catch
>>> more type errors.
>>>
>> <snip>
>>> diff --git a/semihosting/config.c b/semihosting/config.c
>>> index 137171b717..6d48ec9566 100644
>>> --- a/semihosting/config.c
>>> +++ b/semihosting/config.c
>>> @@ -98,7 +98,7 @@ static int add_semihosting_arg(void *opaque,
>>>       if (strcmp(name, "arg") == 0) {
>>>           s->argc++;
>>>           /* one extra element as g_strjoinv() expects NULL-terminated array */
>>> -        s->argv = g_realloc(s->argv, (s->argc + 1) * sizeof(void *));
>>> +        s->argv = g_renew(void *, s->argv, s->argc + 1);
>>
>> This did indeed break CI because s->argv is an array of *char:
>>
>> ../semihosting/config.c:101:17: error: assignment to ‘const char **’ from incompatible pointer type ‘void **’ [-Werror=incompatible-pointer-types]
>>    101 |         s->argv = g_renew(void *, s->argv, s->argc + 1);
>>        |                 ^
>> cc1: all warnings being treated as errors
>>
>> So it did the job of type checking but failed to build ;-)
> 
> You found a hole in my compile testing, thanks!
> 
> I got confused about the configuration of my build trees.  Catching such
> mistakes is what CI is for :)

FYI Alex fixed this here:
https://lore.kernel.org/qemu-devel/20220315121251.2280317-8-alex.bennee@linaro.org/

So your series could go on top (modulo the Coverity change).


