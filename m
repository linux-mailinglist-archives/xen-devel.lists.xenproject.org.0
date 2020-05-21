Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A511DCEEB
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 16:06:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jblpK-0004KP-L1; Thu, 21 May 2020 14:05:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q4aB=7D=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1jblpJ-0004KK-1l
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 14:05:37 +0000
X-Inumbo-ID: 2382a374-9b6c-11ea-ab12-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 2382a374-9b6c-11ea-ab12-12813bfff9fa;
 Thu, 21 May 2020 14:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590069935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WuW4LhQZmtRPxOdsGv0UfenYyJdURtJzEmFBQoF1B8A=;
 b=YUfTJero3p2jdhnnMks/cpQ8zrPzYHOSEwEI8zHN5nrMmB9jRnJ8S6C49HgB2hpmttNGa+
 bK8ONEb2kNpbJAmUxdcSOu5OCG2zIrLmVeA5IEMDXs0F/9DskWTnpGnuX2MjVHlG9AVOpx
 P2ucfdzAeQBRy0i67seZCj8g64jPNPg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-FFKfPPF2Mm6lhDgX6Ek3FA-1; Thu, 21 May 2020 10:05:22 -0400
X-MC-Unique: FFKfPPF2Mm6lhDgX6Ek3FA-1
Received: by mail-wr1-f72.google.com with SMTP id x8so2966982wrl.16
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2020 07:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WuW4LhQZmtRPxOdsGv0UfenYyJdURtJzEmFBQoF1B8A=;
 b=arP8bO8HnPvM7nRnSCs3TVUxB+8ag2+Xzjy+q09WfuIz4tNY2nZCrQ4Y4uyRcwLrU9
 jQQug0vhGSkXvcGuKHnUSxh1XU0qb7tFIQvjwC7cJr24nPOAlAl93CwvuLUFx8j3xWHb
 SFaBf5Pt6+35uUhsCRFjsPj/06p0+VHf/5r9jWkmWIH8sFLOD6ZpfFpyJgxdpnPQD0mZ
 UoeJodOTHvSkuxh0Qo7qxyqLa6gxdElY8jvF80FDAT8i8IpdO6LbhWLmIfJl5YHBOA26
 vdMc2E7Jf4V25R2O43CzJRfATn4BvvhyN2keRplpf2KQUedaqSHdTXL2+n9ZHWZQ/L9O
 +sfw==
X-Gm-Message-State: AOAM532ByhzWCogUNstfIqGbGw8RH2iI1QoIU2B5y23U5W0cdvWj9p6B
 i1kznhP21Q6OfwJbSHf33cxiqloAzDN56JT+Ix8XzAIwEvn1V7YzyVaxGPimp4q9bqsZHxIealA
 07e9UXc7heGrILijtW+IzVnF5Vi0=
X-Received: by 2002:a7b:c205:: with SMTP id x5mr9562688wmi.135.1590069920835; 
 Thu, 21 May 2020 07:05:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+9vDo+k5k5h2/AhbhlgqJeb0CrNG8dWFa5E8+nrQcjn7Lroo1lNJb24UV5jL3E+o+6JSXCg==
X-Received: by 2002:a7b:c205:: with SMTP id x5mr9562654wmi.135.1590069920578; 
 Thu, 21 May 2020 07:05:20 -0700 (PDT)
Received: from [192.168.178.58] ([151.30.94.134])
 by smtp.gmail.com with ESMTPSA id c140sm6952309wmd.18.2020.05.21.07.05.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 07:05:19 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] various: Remove unnecessary casts
To: Markus Armbruster <armbru@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
References: <20200512070020.22782-1-f4bug@amsat.org>
 <871rnlsps6.fsf@dusky.pond.sub.org>
 <8791b385-8493-f81d-5ee3-cca5b8559c27@redhat.com>
 <87imgt9ycp.fsf@dusky.pond.sub.org>
 <2f4607cf-90a9-ca9a-4ef6-a8358631cdf0@kaod.org>
 <87k1187dbo.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ffae374d-9429-5bdc-d415-053aaa1b033c@redhat.com>
Date: Thu, 21 May 2020 16:05:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <87k1187dbo.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19/05/20 06:34, Markus Armbruster wrote:
> Cédric Le Goater <clg@kaod.org> writes:
> 
>> On 5/18/20 3:17 PM, Markus Armbruster wrote:
>>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>>
>>>> On 15/05/20 07:58, Markus Armbruster wrote:
>>>>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>>>>
>>>>>> Remove unnecessary casts using coccinelle scripts.
>>>>>>
>>>>>> The CPU()/OBJECT() patches don't introduce logical change,
>>>>>> The DEVICE() one removes various OBJECT_CHECK() calls.
>>>>> Queued, thanks!
>>>>>
>>>>> Managing expecations: I'm not a QOM maintainer, I don't want to become
>>>>> one, and I don't normally queue QOM patches :)
>>>>>
>>>>
>>>> I want to be again a QOM maintainer, but it's not the best time for me
>>>> to be one.  So thanks for picking up my slack.
>>>
>>> You're welcome :)
>>
>> Could you help me getting this patch merged ? :)
>>
>> http://patchwork.ozlabs.org/project/qemu-devel/patch/20200404153340.164861-1-clg@kaod.org/
> 
> I have more QOM patches in the pipe, and I may well post another QOM
> pull request while Paolo is busy with other stuff.  I'll consider
> including other QOM patches then.  Non-trivial ones need an R-by from
> Paolo, Daniel or Eduardo.

I queued Cedric's.

Paolo


