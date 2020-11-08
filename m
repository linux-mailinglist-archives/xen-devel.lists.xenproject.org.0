Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CD22AACA8
	for <lists+xen-devel@lfdr.de>; Sun,  8 Nov 2020 18:46:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.21779.48140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbokp-0003cA-0Y; Sun, 08 Nov 2020 17:45:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21779.48140; Sun, 08 Nov 2020 17:45:26 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kboko-0003bo-TU; Sun, 08 Nov 2020 17:45:26 +0000
Received: by outflank-mailman (input) for mailman id 21779;
 Sun, 08 Nov 2020 17:45:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q0OR=EO=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kbokm-0003bj-Qj
 for xen-devel@lists.xenproject.org; Sun, 08 Nov 2020 17:45:25 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 96ddb8f4-49a5-493a-8b15-31ab39ee9fa3;
 Sun, 08 Nov 2020 17:45:23 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-C17h6fKmOOWAQOCwoYEU-Q-1; Sun, 08 Nov 2020 12:45:20 -0500
Received: by mail-wr1-f72.google.com with SMTP id r16so3183054wrw.22
 for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2020 09:45:20 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id i33sm10548606wri.79.2020.11.08.09.45.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Nov 2020 09:45:18 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=q0OR=EO=redhat.com=philmd@srs-us1.protection.inumbo.net>)
	id 1kbokm-0003bj-Qj
	for xen-devel@lists.xenproject.org; Sun, 08 Nov 2020 17:45:25 +0000
X-Inumbo-ID: 96ddb8f4-49a5-493a-8b15-31ab39ee9fa3
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 96ddb8f4-49a5-493a-8b15-31ab39ee9fa3;
	Sun, 08 Nov 2020 17:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604857522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pKcr5vUXMJh6j6z/E1BNk/wJeVOexwL5vSDM/421TEA=;
	b=Jq2OLlC63QglC4/X9yYUMjCeNiO9TxP9lMfb95AMNxWufrS4ecytbD/o2ofoc7IoKvjLQx
	ndthC5i6xK7ttz6Woxcq87uzOXZiEElG8zIy5/MtV8+QrwvVEFfpxFVIFb2tNIFePfqdm9
	DnDRg36eLepmlmFAqlEM9fG+LHhTNuU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-C17h6fKmOOWAQOCwoYEU-Q-1; Sun, 08 Nov 2020 12:45:20 -0500
X-MC-Unique: C17h6fKmOOWAQOCwoYEU-Q-1
Received: by mail-wr1-f72.google.com with SMTP id r16so3183054wrw.22
        for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2020 09:45:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pKcr5vUXMJh6j6z/E1BNk/wJeVOexwL5vSDM/421TEA=;
        b=gZC7A/BJzjHwJFw1peV0P3DAVykVtjklmJ2M0tV8ILqAgqoaCBK3wBdN++Ii6BRV46
         FOXp+nfWk4zxNN+zZCK67eZDJl1G8/tIyyWYYoilgxVlQragI6SenkCCvUkpumKDU6mR
         d3BUNuLBp0/cXXfEQYzrwIjev28pKfYByoV7KbDdHlJsCS99pqpN5x5qRtRsStCgxa/n
         ydSKkFuyA6pzi4ND/HJYm5H5+mx4ODrtu79Zfn+1mzRrb8Tu3pPYIFcYmCWa7QN/hkka
         C6uMjLYw7cx/6JV4Pxu5OFhCDJxgQwOcRRJZznFWPA86mMizNjm8iorbySbK+Vhjr7al
         s09g==
X-Gm-Message-State: AOAM532oJCxZoQQxTY+WC6tiDDPot+UwNZAlXMQI9ebrYPBGTUti7DDJ
	nFsJoDDUrgYTH9HhsYx2FGxNPnwHJgWcPfTSVjV7vM9ACVNGBWEtI5tSAOtXBdc9IR//FjpDzsh
	NV5EMVF72ueN5j74QiwL8Ah3ogNA=
X-Received: by 2002:a1c:6302:: with SMTP id x2mr10602933wmb.56.1604857519835;
        Sun, 08 Nov 2020 09:45:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1+MmTs2lallUAly8YG6ttAFAIc9qc4UR8osQBdD9ziPolvVhuWzyWw6bD4azHYpnqWfdQ3g==
X-Received: by 2002:a1c:6302:: with SMTP id x2mr10602917wmb.56.1604857519689;
        Sun, 08 Nov 2020 09:45:19 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.234])
        by smtp.gmail.com with ESMTPSA id i33sm10548606wri.79.2020.11.08.09.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2020 09:45:18 -0800 (PST)
Subject: Re: --enable-xen on gitlab CI? (was Re: [PATCH 09/36] qdev: Make
 qdev_get_prop_ptr() get Object* arg)
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Alex Williamson <alex.williamson@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, Qemu-s390x list <qemu-s390x@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20201029220246.472693-1-ehabkost@redhat.com>
 <20201029220246.472693-10-ehabkost@redhat.com>
 <CAJ+F1CKqo3D20=qSAovVKWCGz4otctaWnGC0O5p-Z1ZG9Pj_Mw@mail.gmail.com>
 <20201030113516.GP5733@habkost.net>
 <7645972e-5cad-6511-b057-bd595b91c4aa@redhat.com>
 <e35c50b6-e795-d901-61e4-4879c5eadd61@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e3e3d331-fd4f-7365-1e2f-bf8bfdb11396@redhat.com>
Date: Sun, 8 Nov 2020 18:45:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <e35c50b6-e795-d901-61e4-4879c5eadd61@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/31/20 11:25 AM, Thomas Huth wrote:
> On 30/10/2020 18.13, Paolo Bonzini wrote:
>> On 30/10/20 12:35, Eduardo Habkost wrote:
>>>
>>> What is necessary to make sure we have a CONFIG_XEN=y job in
>>> gitlab CI?  Maybe just including xen-devel in some of the
>>> container images is enough?
>>
>> Fedora already has it, but build-system-fedora does not include
>> x86_64-softmmu.
> 
> Eduardo, could you try to add xen-devel to the centos8 container? If that
> does not work, we can still move the x86_64-softmmu target to the fedora
> pipeline instead.

On CentOS 8:

  #6 10.70 No match for argument: xen-devel
  #6 10.71 Error: Unable to find a match: xen-devel

Regards,

Phil.


