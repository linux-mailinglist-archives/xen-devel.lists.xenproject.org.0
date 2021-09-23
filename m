Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E313D415EA9
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:44:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194086.345724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTO4u-0002Mu-ES; Thu, 23 Sep 2021 12:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194086.345724; Thu, 23 Sep 2021 12:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTO4u-0002Kb-BI; Thu, 23 Sep 2021 12:43:52 +0000
Received: by outflank-mailman (input) for mailman id 194086;
 Thu, 23 Sep 2021 12:43:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fO2a=ON=greensocs.com=damien.hedde@srs-us1.protection.inumbo.net>)
 id 1mTO4s-0002KV-N4
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:43:51 +0000
Received: from beetle.greensocs.com (unknown [5.135.226.135])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e571f165-1c6b-11ec-ba2f-12813bfff9fa;
 Thu, 23 Sep 2021 12:43:48 +0000 (UTC)
Received: from [192.168.15.189] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 14EF120786;
 Thu, 23 Sep 2021 12:43:46 +0000 (UTC)
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
X-Inumbo-ID: e571f165-1c6b-11ec-ba2f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1632401026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=74J5uL4+y3OkwakSUEbDd5pmG2azKhrylHgHqUMTlRo=;
	b=NqrdEZvIHKxKmAWJ08TREruX+6E1zwtjlIzFRKUJ8z/RjI58v7xHMihe/01vIPrVrKra7T
	niGWbOMLvL+/r6m0yCRL3pyfXGhri4PRKFkmCm8kOkiTf9h5mxH1Qh61DdQIQpDW1ISlel
	hpLot1xPahP9abOARHX6kwVUlJhMYeU=
Message-ID: <e3ab341b-3e7a-1485-90ed-dbd9d2e3588d@greensocs.com>
Date: Thu, 23 Sep 2021 14:43:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH v2 02/16] qapi: Implement query-machine-phase QMP
 command
Content-Language: en-US-large
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, mirela.grujic@greensocs.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, mark.burton@greensocs.com, edgari@xilinx.com,
 Igor Mammedov <imammedo@redhat.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-3-damien.hedde@greensocs.com>
 <d27c5829-e28f-4d17-966e-6cb86ebe00e6@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <d27c5829-e28f-4d17-966e-6cb86ebe00e6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/22/21 19:37, Philippe Mathieu-Daudé wrote:
> On 9/22/21 18:13, Damien Hedde wrote:
>> From: Mirela Grujic <mirela.grujic@greensocs.com>
>>
>> The command returns current machine initialization phase.
>>  From now on, the MachineInitPhase enum is generated from the
>> QAPI schema.
>>
>> Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
> 
> Missing your S-o-b, otherwise:

Sorry. I did not realize I had to add it since it was already done by 
Mirela. I'll add it for this patch and patches 1, 6 and 8.

> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com >
>> ---
>>   qapi/machine.json          | 56 ++++++++++++++++++++++++++++++++++++++
>>   include/hw/qdev-core.h     | 30 ++------------------
>>   hw/core/machine-qmp-cmds.c |  9 ++++++
>>   hw/core/qdev.c             |  5 ++++
>>   4 files changed, 72 insertions(+), 28 deletions(-)
> 

