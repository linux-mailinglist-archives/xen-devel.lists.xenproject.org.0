Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EDB28326A
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 10:46:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2886.8250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPM8H-0002O0-BQ; Mon, 05 Oct 2020 08:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2886.8250; Mon, 05 Oct 2020 08:46:09 +0000
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
	id 1kPM8H-0002Nb-7f; Mon, 05 Oct 2020 08:46:09 +0000
Received: by outflank-mailman (input) for mailman id 2886;
 Mon, 05 Oct 2020 08:46:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rhq4=DM=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1kPM8G-0002NW-7N
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 08:46:08 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 34f71a15-1c89-4622-8b0d-ebf576159665;
 Mon, 05 Oct 2020 08:46:07 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-xSozUxOdPWql-gTzyKxVVQ-1; Mon, 05 Oct 2020 04:46:03 -0400
Received: by mail-wm1-f72.google.com with SMTP id 73so1499626wma.5
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2020 01:46:03 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:2e86:3d8b:8b70:920c?
 ([2001:b07:6468:f312:2e86:3d8b:8b70:920c])
 by smtp.gmail.com with ESMTPSA id h17sm13109068wro.27.2020.10.05.01.46.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2020 01:46:00 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rhq4=DM=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
	id 1kPM8G-0002NW-7N
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 08:46:08 +0000
X-Inumbo-ID: 34f71a15-1c89-4622-8b0d-ebf576159665
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 34f71a15-1c89-4622-8b0d-ebf576159665;
	Mon, 05 Oct 2020 08:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601887567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=okCrQkGxtnHZPZ8SiAzTpzb/xJBxhBwvy+wvdWPVABI=;
	b=DPM5ylCcFJAzFpHtYDZoHwfHx8QUrs8qQuWgE/UGK4lp59cy1pZwibjyviry/1hP7czkE2
	j+EthcMOkoq73/Da9qn01Jy9taNEaxzvs2bQayJjxjcMTRNW8Wy0LBKmRjHbkP1mUBHjV/
	RvhuIlifv3uEyC24DgEFCpmMhQLuvaY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-xSozUxOdPWql-gTzyKxVVQ-1; Mon, 05 Oct 2020 04:46:03 -0400
X-MC-Unique: xSozUxOdPWql-gTzyKxVVQ-1
Received: by mail-wm1-f72.google.com with SMTP id 73so1499626wma.5
        for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2020 01:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=okCrQkGxtnHZPZ8SiAzTpzb/xJBxhBwvy+wvdWPVABI=;
        b=TUVa1nTVEv08Kh3vOMKcYsZN7XGXL8KRX5iqJ6FhA9ViiJy3RsqBQnPHGh+QZccYJN
         XZjwqOqH46XYzL6mD0t/AycKg4Ujm/alV/vGf2+S2olZjXGTTjWR2sMyFIH6LP3QhuWe
         Y2RzkfNviEB8n/Yz+kGj4qy+fD3a657ggdc0Z2uUXorezYu7dbrc7ie6BBnbs2ud8wOI
         uCD+2Mm8v/IYgV41dDNlW3n0AsA/EoMhgZVoVjQlelDpPVI0Ce10gsa3SJnqZM3nZYXf
         FMzGCylRnvrY1C0SgFupruPa2qIuq8LicDEC2M6WvUr9hAN087s//leRzhkOJtQ9qAAQ
         UTmQ==
X-Gm-Message-State: AOAM531n8LLTBLgq1EKeEZf3pbFHgEtFFqP5QqFLyYWKUxUWJuygu6ME
	MmBRw7xMVUTebmGeq/Q2NDkUsSCnpj22aj8wYbabC9Y6I8Z6yIQlpCBDSyGoTQVtE6wqHZ8EYKX
	7lsa+7epNuZeO7a1VNqOfhNA5LJ0=
X-Received: by 2002:adf:e407:: with SMTP id g7mr10330885wrm.349.1601887562083;
        Mon, 05 Oct 2020 01:46:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwL7iy8SyjTNcssIenIDbDU3EPy6FirqSaU/6oIe+Yp0UOc3VHOKrxtGPaaIZvrooguFHlONw==
X-Received: by 2002:adf:e407:: with SMTP id g7mr10330871wrm.349.1601887561841;
        Mon, 05 Oct 2020 01:46:01 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:2e86:3d8b:8b70:920c? ([2001:b07:6468:f312:2e86:3d8b:8b70:920c])
        by smtp.gmail.com with ESMTPSA id h17sm13109068wro.27.2020.10.05.01.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2020 01:46:00 -0700 (PDT)
Subject: Re: [PATCH 0/5] qapi: Restrict machine (and migration) specific
 commands
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Paul Durrant <paul@xen.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <rth@twiddle.net>
References: <20201002133923.1716645-1-philmd@redhat.com>
 <87wo05aypg.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0c54aa06-372c-ab81-0974-34340adb7b55@redhat.com>
Date: Mon, 5 Oct 2020 10:46:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87wo05aypg.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 05/10/20 10:01, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> Reduce the machine code pulled into qemu-storage-daemon.
> I'm leaving review to Eduardo and Marcel for PATCH 1-4, and to David and
> Juan for PATCH 5.  David already ACKed.
> 
> Can do the pull request.
> 

If it counts, :) for patch 1-4:

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Generally these patches to remove code from user-mode emulators
fall into the "if it builds it's fine" bucket, since I assume
we want the "misc" subschema to be as small as possible.

Paolo


