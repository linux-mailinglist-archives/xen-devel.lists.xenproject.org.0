Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A7832185B
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 14:20:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88046.165394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEB7T-0002Dq-89; Mon, 22 Feb 2021 13:19:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88046.165394; Mon, 22 Feb 2021 13:19:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEB7T-0002DS-4u; Mon, 22 Feb 2021 13:19:23 +0000
Received: by outflank-mailman (input) for mailman id 88046;
 Mon, 22 Feb 2021 13:19:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V+0I=HY=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1lEB7R-0002DN-8r
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 13:19:21 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 247dde78-34ac-4b7a-85a6-69aaca5549ff;
 Mon, 22 Feb 2021 13:19:20 +0000 (UTC)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-7SJOOPFgMHu-GualZedBhQ-1; Mon, 22 Feb 2021 08:19:17 -0500
Received: by mail-ej1-f72.google.com with SMTP id yh28so3985705ejb.11
 for <xen-devel@lists.xenproject.org>; Mon, 22 Feb 2021 05:19:17 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id kd13sm6734645ejc.106.2021.02.22.05.19.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 05:19:15 -0800 (PST)
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
X-Inumbo-ID: 247dde78-34ac-4b7a-85a6-69aaca5549ff
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613999959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qug2RTu/T1uSQ745n8lC2c0QqoReD0ieGgc66jNB2QI=;
	b=DP5MsoxPqZr6RjnVFpMb5qSgPTT6REsm0tdYzTax3iVGEq4Zg4xCcDtXb8Z0+YfMHgQJYn
	OOKkgW92WwYuoPy0vaIbPn59IZT9PgMdwF+rohSJgqZlU8W0GwXvWeYtkZbu8EoPH4aIww
	Cwh77KpCGW8WNcxi7aNwmYcCW/pU16I=
X-MC-Unique: 7SJOOPFgMHu-GualZedBhQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Qug2RTu/T1uSQ745n8lC2c0QqoReD0ieGgc66jNB2QI=;
        b=d8xUNjHWwdEpFzNoD3YY+rWrWRkQry9JuDashrhYkop8bz+e7ue4mr9RjeXCUsm9nj
         Wyok9dvdmOP4/SuPTFT6WAHINN8BpZovDUP/AoxfC8+3mObYMrfGIsNDGmHRE88ifag0
         shTImiEWArFAhUsA3oqSM9O9xO3bcLkvK5oFsmynUrlviSz0IQv+/B+SwC4E0K5v8n5j
         gEONyFgBD7oefqaJis8UozXQyFk0vatzPCpNaK5oHxI8PcJDQ+FlYCP30qYsniN5mIAt
         3FRe1Y4b0TKHeYhaPjnoYt569d0IEIn92S03BKxt/S++gwTEMtbMGfU1M5D9GtfvVG/l
         d7fw==
X-Gm-Message-State: AOAM531dd0QThIxub6WUAbqR90FrW3JFjrQA1af8euDYLc9gzhdY7b7f
	aESwfm4ld2H4CpBJguYdT77WAQ9R5LM+CiC8MmUg3Xv5OSV2i3gMIR5hUFzJ4yd8X3y0d9MrUuR
	Dol7Mo/nwjIoWLV/g99IPHP/VFaU=
X-Received: by 2002:a17:906:cf8f:: with SMTP id um15mr5937389ejb.455.1613999956676;
        Mon, 22 Feb 2021 05:19:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvbw/PgfA0F/25nHKxn/HTOW5jX2GdrY67Z+Yez2DT22kLFPNtBmQLRjUdkVjUL1EidwLbmg==
X-Received: by 2002:a17:906:cf8f:: with SMTP id um15mr5937362ejb.455.1613999956555;
        Mon, 22 Feb 2021 05:19:16 -0800 (PST)
Subject: Re: [RFC PATCH v2 06/11] hw/ppc: Restrict KVM to various PPC machines
To: David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Huacai Chen <chenhuacai@kernel.org>, xen-devel@lists.xenproject.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Leif Lindholm <leif@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Alistair Francis <alistair@alistair23.me>, Paul Durrant <paul@xen.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Greg Kurz <groug@kaod.org>, Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210219173847.2054123-1-philmd@redhat.com>
 <20210219173847.2054123-7-philmd@redhat.com>
 <YDNIQiHG0nfKXNR8@yekko.fritz.box>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e28dc7fe-3a78-6b24-0034-830909f71f8e@redhat.com>
Date: Mon, 22 Feb 2021 14:19:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YDNIQiHG0nfKXNR8@yekko.fritz.box>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2/22/21 6:59 AM, David Gibson wrote:
> On Fri, Feb 19, 2021 at 06:38:42PM +0100, Philippe Mathieu-Daudé wrote:
>> Restrit KVM to the following PPC machines:
>> - 40p
>> - bamboo
>> - g3beige
>> - mac99
>> - mpc8544ds
>> - ppce500
>> - pseries
>> - sam460ex
>> - virtex-ml507
> 
> Hrm.
> 
> The reason this list is kind of surprising is because there are 3
> different "flavours" of KVM on ppc: KVM HV ("pseries" only), KVM PR
> (almost any combination, theoretically, but kind of buggy in
> practice), and the Book E specific KVM (Book-E systems with HV
> extensions only).
> 
> But basically, qemu explicitly managing what accelerators are
> available for each machine seems the wrong way around to me.  The
> approach we've generally taken is that qemu requests the specific
> features it needs of KVM, and KVM tells us whether it can supply those
> or not (which may involve selecting between one of the several
> flavours).
> 
> That way we can extend KVM to cover more situations without needing
> corresponding changes in qemu every time.

OK thanks for the information. I'll wait the other patches
get reviewed (in particular the most important ones, 2 and
10) before respining including this information.

Regards,

Phil.


