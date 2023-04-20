Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 634B76E9424
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 14:21:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524228.814991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppTHM-00026D-W7; Thu, 20 Apr 2023 12:20:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524228.814991; Thu, 20 Apr 2023 12:20:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppTHM-00024W-T2; Thu, 20 Apr 2023 12:20:48 +0000
Received: by outflank-mailman (input) for mailman id 524228;
 Thu, 20 Apr 2023 12:20:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R7xv=AL=redhat.com=quintela@srs-se1.protection.inumbo.net>)
 id 1ppTHL-00024Q-KJ
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 12:20:47 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c65612ca-df75-11ed-b21f-6b7b168915f2;
 Thu, 20 Apr 2023 14:20:46 +0200 (CEST)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-WzpQVsNqN96718_HY60feA-1; Thu, 20 Apr 2023 08:20:43 -0400
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2f8c2258b48so218832f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Apr 2023 05:20:43 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 w9-20020a05600c474900b003f17e37ce60sm5241991wmo.47.2023.04.20.05.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 05:20:41 -0700 (PDT)
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
X-Inumbo-ID: c65612ca-df75-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681993244;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=tl6voZ2jHwhB9nV9y4cRkZPhJXFytEfPJKXZLTHgxaY=;
	b=e9FMSmItkzUaxRkfA7IZufTuoElvL7FRCm1YMXJIKRd5JH3Va26vhiUyPqd+uqgNdRMzbL
	rIfCvXd/1SOJ8uw0Gf3Iv4FBjs8vDKgdCXSYjnE93rhunmLpLDdZN+IdopmmHv5amx/W8Y
	DqR9rbBqXC1dn/jl7yf6eJzWq0HO3u4=
X-MC-Unique: WzpQVsNqN96718_HY60feA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681993242; x=1684585242;
        h=mime-version:message-id:date:reply-to:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tl6voZ2jHwhB9nV9y4cRkZPhJXFytEfPJKXZLTHgxaY=;
        b=hGDlqUGi8QqY77sA39oTXrjr2QXDZj3AtMLmaVmhZLN0Lls4J8EisjuJGDUnqklbC9
         Kfe4oSEwSnsH1c7mERFKIvSxAByynUId2Blk40ROPSUoh/wx+j1/wbNjxnwhHVQFzSrc
         6jMj5xgIMvp5N7+KIbkFwbCT85VWtU9NZk22CJhxXxRdEsQ9Dtj2xcD2XDaXKoNqH8E6
         u5h5KteZqpLZDjzRJjC9k+R5I2egUkE8inzib7ksDz3Jsy2/u7M+1usGWoccL/DqOS/2
         raKMXBakV+SHql0AomsD0QcpYqfwPyZoqlQ+mjQKjkxUg2ZtJKllJyPsbDinC4vzmkqQ
         ATfw==
X-Gm-Message-State: AAQBX9dgZpGg+JMExWltNR0D1E01UKo/+V/a0Fu/BEkDQ5x/J9UuVgy5
	lyqOd3gJxt8tY1GZGf2Ot7vn6bG4OKw33yxFc1NMT7coL96pzaIdMnzDAwcw59R9ejsJUe449zm
	4mJDSOgE9RfEUEpHNgWj38aYD1Ww=
X-Received: by 2002:adf:fe45:0:b0:302:1b72:b951 with SMTP id m5-20020adffe45000000b003021b72b951mr963595wrs.26.1681993242613;
        Thu, 20 Apr 2023 05:20:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350aDAVOfKI9kohboQVeUsjo0MtZrf//nMbnob2NhGWz6dOPqHPY1GQOzVqmYbUEd0harlhNaRg==
X-Received: by 2002:adf:fe45:0:b0:302:1b72:b951 with SMTP id m5-20020adffe45000000b003021b72b951mr963566wrs.26.1681993242210;
        Thu, 20 Apr 2023 05:20:42 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Eric Blake <eblake@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,
  qemu-devel@nongnu.org,  Stefano Stabellini <sstabellini@kernel.org>,
  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  Fam Zheng
 <fam@euphon.net>,  Julia Suvorova <jusual@redhat.com>,  Hanna Reitz
 <hreitz@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Coiby Xu <Coiby.Xu@gmail.com>,  Paul
 Durrant <paul@xen.org>,  Ronnie Sahlberg <ronniesahlberg@gmail.com>,
  Eduardo Habkost <eduardo@habkost.net>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Stefano Garzarella <sgarzare@redhat.com>,  Anthony
 Perard <anthony.perard@citrix.com>,  Kevin Wolf <kwolf@redhat.com>,
  "Richard W.M. Jones" <rjones@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  xen-devel@lists.xenproject.org,
  qemu-block@nongnu.org,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Peter Lieven
 <pl@kamp.de>,
  eesposit@redhat.com,  Aarushi Mehta <mehta.aaru20@gmail.com>,  Stefan
 Weil <sw@weilnetz.de>,  Xie Yongji <xieyongji@bytedance.com>,  David
 Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2 16/16] virtio: make it possible to detach host
 notifier from any thread
In-Reply-To: <CAJSP0QVjFcicweDxVvLyhijmdQqQPTN_uhzP2wU7ZS4ZXxKkEQ@mail.gmail.com>
	(Stefan Hajnoczi's message of "Thu, 20 Apr 2023 07:29:12 -0400")
References: <20230419172817.272758-1-stefanha@redhat.com>
	<20230419172817.272758-17-stefanha@redhat.com>
	<msjl3ep44f2dxpno7xw3zxjrkuh5iegyieszertt6ppkhpk62q@xxi7a5shhkc2>
	<CAJSP0QVjFcicweDxVvLyhijmdQqQPTN_uhzP2wU7ZS4ZXxKkEQ@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Thu, 20 Apr 2023 14:20:40 +0200
Message-ID: <87edoeycbr.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Wed, 19 Apr 2023 at 14:52, Eric Blake <eblake@redhat.com> wrote:
>>
>> On Wed, Apr 19, 2023 at 01:28:17PM -0400, Stefan Hajnoczi wrote:
>> > virtio_queue_aio_detach_host_notifier() does two things:
>> > 1. It removes the fd handler from the event loop.
>> > 2. It processes the virtqueue one last time.
>> >
>> > The first step can be peformed by any thread and without taking the
>> > AioContext lock.
>> >
>> > The second step may need the AioContext lock (depending on the device
>> > implementation) and runs in the thread where request processing takes
>> > place. virtio-blk and virtio-scsi therefore call
>> > virtio_queue_aio_detach_host_notifier() from a BH that is scheduled in
>> > AioContext
>> >
>> > Scheduling a BH is undesirable for .drained_begin() functions. The next
>> > patch will introduce a .drained_begin() function that needs to call
>> > virtio_queue_aio_detach_host_notifier().
>> >
>> > Move the virtqueue processing out to the callers of
>> > virtio_queue_aio_detach_host_notifier() so that the function can be
>> > called from any thread. This is in preparation for the next patch.
>> >
>>
>> This mentions a next patch, but is 16/16 in the series.  Am I missing
>> something?
>
> Good thing you caught this. The patch series was truncated because I
> was in the middle of git rebase -i :(.
>
> I will send a v3 with the remaining patches.

I saw that it was not migration/* stuff and though that I was done O:-)


