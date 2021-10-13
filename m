Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B0642C332
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 16:30:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208572.364754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mafGl-0001a4-9N; Wed, 13 Oct 2021 14:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208572.364754; Wed, 13 Oct 2021 14:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mafGl-0001We-5Z; Wed, 13 Oct 2021 14:30:11 +0000
Received: by outflank-mailman (input) for mailman id 208572;
 Wed, 13 Oct 2021 14:30:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nKHt=PB=greensocs.com=damien.hedde@srs-us1.protection.inumbo.net>)
 id 1mafGj-0001Tw-Jm
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 14:30:10 +0000
Received: from beetle.greensocs.com (unknown [5.135.226.135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28e2b0bc-891c-47e7-a1d7-fe1a1f44caf8;
 Wed, 13 Oct 2021 14:30:08 +0000 (UTC)
Received: from [192.168.15.165] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id D0C2721C32;
 Wed, 13 Oct 2021 14:30:05 +0000 (UTC)
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
X-Inumbo-ID: 28e2b0bc-891c-47e7-a1d7-fe1a1f44caf8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1634135406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z6HgMh5IMSwLEmZN5256moVuZUZTLWR6X/E7D989GAM=;
	b=1v5ahRx7kFy03JQEDgOMnsn6lCXMTvv/S4+cDS/eYY03VM2Fab7wi/9CaK/uJ+1vtCgm0H
	djgb9bc2m613XpLeGkEmpMC45AEY450QTrKfNQkbp7R8rGkXeXJIUrvGXVoFt5dFaeY82p
	KtyNyCsawGqJgUOc6OJpIm0RPipPZhg=
Message-ID: <11aa7a10-62ec-ebde-030c-5919e36ec34d@greensocs.com>
Date: Wed, 13 Oct 2021 16:30:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [RFC PATCH v2 04/16] softmmu/qdev-monitor: add error handling in
 qdev_set_id
Content-Language: en-US-large
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, mirela.grujic@greensocs.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "open list:X86" <xen-devel@lists.xenproject.org>, Paul Durrant
 <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, Edgar Iglesias <edgari@xilinx.com>,
 Igor Mammedov <imammedo@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-5-damien.hedde@greensocs.com>
 <CAKmqyKNWBYpq8CbhtGyw9=1Gt_LujZZrtD7J_Ye2FyyVA6eqcw@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <CAKmqyKNWBYpq8CbhtGyw9=1Gt_LujZZrtD7J_Ye2FyyVA6eqcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/13/21 09:10, Alistair Francis wrote:
> On Thu, Sep 23, 2021 at 2:29 AM Damien Hedde <damien.hedde@greensocs.com> wrote:
>>
>> qdev_set_id() is mostly used when the user adds a device (using
>> -device cli option or device_add qmp command). This commit adds
>> an error parameter to handle the case where the given id is
>> already taken.
>>
>> Also document the function and add a return value in order to
>> be able to capture success/failure: the function now returns the
>> id in case of success, or NULL in case of failure.
>>
>> The commit modifies the 2 calling places (qdev-monitor and
>> xen-legacy-backend) to add the error object parameter.
>>
>> Note that the id is, right now, guaranteed to be unique because
>> all ids came from the "device" QemuOptsList where the id is used
>> as key. This addition is a preparation for a future commit which
>> will relax the uniqueness.
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> 
> Alistair
> 

CC'ing Kevin who integrated this patch into his series about
"qdev: Add JSON -device"
https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg01826.html

Thanks,
--
Damien

