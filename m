Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB247D941B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 11:47:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624319.972801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwJQa-0001hV-Md; Fri, 27 Oct 2023 09:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624319.972801; Fri, 27 Oct 2023 09:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwJQa-0001fG-Is; Fri, 27 Oct 2023 09:46:52 +0000
Received: by outflank-mailman (input) for mailman id 624319;
 Fri, 27 Oct 2023 09:46:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eEfT=GJ=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qwJQa-0001fA-04
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 09:46:52 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c042a7c5-74ad-11ee-9b0e-b553b5be7939;
 Fri, 27 Oct 2023 11:46:50 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-32d895584f1so1291498f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Oct 2023 02:46:50 -0700 (PDT)
Received: from [192.168.10.177] (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a5d5949000000b00326f5d0ce0asm1389222wri.21.2023.10.27.02.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 02:46:49 -0700 (PDT)
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
X-Inumbo-ID: c042a7c5-74ad-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698400009; x=1699004809; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jzLwa1GntXahp5+i4Iu7OMe0oRp7S0Pb5ddkQlqpbTs=;
        b=ORVlg30SiJho88o4kbi7H8axlhkWyjCgDcMjH6DvwB2fdOThqw9h7l+kf2yOzFj3dY
         MwXNBESUX7SXJUt1lEa21Ej7ilp2sDxIKEz/n2TxNxJ6J226IeOi14HC5Zc+9+BQYDvZ
         r//677E+reOTJihWkUzdJyxQ5wLK5j2WXs1WwiKGvLOzWeyxkx46CV+kP82k+EeHNCKo
         6D6ezDQfmPZSyyCMUr0e2gPPtZ29KCqW31P6OYrAsOnLcdyzp5qYHCWlH8gy8eAPW/Bi
         NWCAbKUACaUHW5V+zs6z/UE0poiUP3+yraQv5qJ3pdyCFpBL/pe4UgfDsCj+MJrdKHq2
         456w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698400009; x=1699004809;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzLwa1GntXahp5+i4Iu7OMe0oRp7S0Pb5ddkQlqpbTs=;
        b=CfCwf9Ug/bAOEYYxZwpxhBzz7JWmyw8ThQo6KisOv1LJdQYdFtuLn5DCvBU4qjGQh+
         AHbsS8mfZ/rpWIcx9dBAIi/h04kOxqAMYObhC5ipMswQ7OqjLmDbP1oy+ET2A5ku/j8x
         zuQTmHGaTbmvtmHmbJpP9mb0qfEvRqS/OaCpELxgoPMRDa9bYig1FA6nEsrDwi3epm1D
         rsz5cmgVHQsLBSHtVuToVWZqKJQqFW4Gq30/Hh0TUqaqkrXIrhbtvBDtiozsVC5ZhdQK
         aem2r2oTYBibdZkiFk/rSHng3RxJ09JdmX48CaftcOND/C7rB7OBJ7k2f7YexIMY7EoZ
         f2mw==
X-Gm-Message-State: AOJu0Ywpl1Pat5tfqXcZz7tiZ/5aRYejKjh4S0mnhplh6/XiI9gv0blC
	45S3PjglDXIZjMYUJ3MOjLc=
X-Google-Smtp-Source: AGHT+IF+xd8cuMtFJ/cywAMdwJALH04PvtMGn/mtI5e9KZNkVRA1ttigVPEIA2v+rqX3cz0pRpds5w==
X-Received: by 2002:a5d:68c1:0:b0:32d:a022:8559 with SMTP id p1-20020a5d68c1000000b0032da0228559mr1762750wrw.47.1698400009412;
        Fri, 27 Oct 2023 02:46:49 -0700 (PDT)
Message-ID: <b6cb24e3-d736-4951-b2dd-2a90562fd768@gmail.com>
Date: Fri, 27 Oct 2023 10:46:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v3 25/28] hw/pci: add pci_init_nic_devices(),
 pci_init_nic_in_slot()
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Bernhard Beschow <shentey@gmail.com>, Joel Upham <jupham125@gmail.com>
References: <20231025145042.627381-1-dwmw2@infradead.org>
 <20231025145042.627381-26-dwmw2@infradead.org>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20231025145042.627381-26-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/10/2023 15:50, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The loop over nd_table[] to add PCI NICs is repeated in quite a few
> places. Add a helper function to do it.
> 
> Some platforms also try to instantiate a specific model in a specific
> slot, to match the real hardware. Add pci_init_nic_in_slot() for that
> purpose.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/pci/pci.c         | 45 ++++++++++++++++++++++++++++++++++++++++++++
>   include/hw/pci/pci.h |  4 +++-
>   2 files changed, 48 insertions(+), 1 deletion(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


