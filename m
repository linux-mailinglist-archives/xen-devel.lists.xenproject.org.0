Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F30414F63
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 19:50:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192988.343756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT6O9-0008KP-BL; Wed, 22 Sep 2021 17:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192988.343756; Wed, 22 Sep 2021 17:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT6O9-0008IL-8E; Wed, 22 Sep 2021 17:50:33 +0000
Received: by outflank-mailman (input) for mailman id 192988;
 Wed, 22 Sep 2021 17:50:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tKcP=OM=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1mT6O7-0008IB-GY
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 17:50:31 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 93f0cb4d-1bcd-11ec-b9c6-12813bfff9fa;
 Wed, 22 Sep 2021 17:50:30 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-2mtzewOPMd60zIYiITAvig-1; Wed, 22 Sep 2021 13:50:26 -0400
Received: by mail-wr1-f72.google.com with SMTP id
 r5-20020adfb1c5000000b0015cddb7216fso2887997wra.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Sep 2021 10:50:26 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id g205sm2940929wmg.18.2021.09.22.10.50.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 10:50:24 -0700 (PDT)
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
X-Inumbo-ID: 93f0cb4d-1bcd-11ec-b9c6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632333030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=324sILhdYxvnznF1+1US9ZnfMNECSzr9WbsW6XTulSY=;
	b=Ou0LoOxFrU8eBBGGiJ8aRjCSz6wah96mL/M/YkR81+qA9EXAtFVRDM4+UxW46Y9a/s7Js9
	41q/50PCBbRB6kA22HL32CB85fRFBVdbIvGcV++7GCmB9WfD9YEb/AmtVYCHB1v63fzYeP
	8D6LdrNEhEPyfJvvUHQ/JQO9FZxAI7U=
X-MC-Unique: 2mtzewOPMd60zIYiITAvig-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=324sILhdYxvnznF1+1US9ZnfMNECSzr9WbsW6XTulSY=;
        b=b/iXN1EOqqXwI0SpFP2O4Uzj63LwdgdIdC1PkAQry/A7cLbLyV5hbQ4ceQ7s01qPeR
         Few0/shJKqO7lrZ8rEPiteiV5ee+lHoT4Qqojcn6nHVAwENRTpum3/1I2T9zBfZ/htmE
         qkCUmrK03LKk/W/h+otrEdH1q3NYciz93VBKLjI3vHR3/zQov7EPuZz8BADbPTNfUOHG
         IAYVMB5UEGRBQWvq7lIC3JTJYQ7JRsV9prpVtICd2rtAqn870xFoN/2UC52hVAMzBnYa
         RjdKGyHF4MygKCqA/V8IrVuNMseFIvG+h47uImz9tuz3aFqKmRpO8ZzsCMdSKfDZHu1X
         XcPg==
X-Gm-Message-State: AOAM530ZH9PGafALYTSIl5GwcXkmtqtCfnApb3Tcw48Drgn2tCuMGrbS
	FcD+IbTixTVMa/1l46LsZ1kNkNxMtXHeFRrx+/ssreC3s7XfhiMAgNRYlmDCGWJc/XGpl80/6R1
	acRQSCeXd5qeilYdxAjx8QZJPm7U=
X-Received: by 2002:adf:d084:: with SMTP id y4mr217248wrh.249.1632333025507;
        Wed, 22 Sep 2021 10:50:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkTAxtj4TUqlJA16lEOK2zxOqi0Lnhv+gZIrdsyM50ICcEZWWLl648/QwzUYzfSBk/7cFBmA==
X-Received: by 2002:adf:d084:: with SMTP id y4mr217213wrh.249.1632333025297;
        Wed, 22 Sep 2021 10:50:25 -0700 (PDT)
Message-ID: <a4debda9-f00b-dc99-7e7c-37ea9b4d7b5c@redhat.com>
Date: Wed, 22 Sep 2021 19:50:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH v2 00/16] Initial support for machine creation via QMP
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210922161405.140018-1-damien.hedde@greensocs.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Damien,

On 9/22/21 18:13, Damien Hedde wrote:
> 
> The goal of this work is to bring dynamic machine creation to QEMU:
> we want to setup a machine without compiling a specific machine C
> code. It would ease supporting highly configurable platforms (for
> example resulting from an automated design flow). The requirements
> for such configuration include begin able to specify the number of
> cores, available peripherals, emmory mapping, IRQ mapping, etc.
> 
> This series focuses on the first step: populating a machine with
> devices during its creation. We propose patches to support this
> using QMP commands. This is a working set of patches and improves
> over the earlier rfc (posted in May):
> https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg03706.html

Do you have a roadmap for the following steps? Or are you done with
this series?

Yesterday I was thinking about this, and one thing I was wondering is
if it would be possible to have DeviceClass and MachineClass implement
a populate_fdt() handler, to automatically generate custom DTB for these
custom machines.

Maybe in your case you don't need that, as your framework generating the
QEMU machine also generates the DTB, or even parse a DTB to generate the
machine... :)

Regards,

Phil.


