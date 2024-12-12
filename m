Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BDE9EE973
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 15:57:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856101.1268835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLkcO-0005YM-7N; Thu, 12 Dec 2024 14:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856101.1268835; Thu, 12 Dec 2024 14:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLkcO-0005X2-3d; Thu, 12 Dec 2024 14:56:44 +0000
Received: by outflank-mailman (input) for mailman id 856101;
 Thu, 12 Dec 2024 14:56:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ohRn=TF=redhat.com=pabeni@srs-se1.protection.inumbo.net>)
 id 1tLkcN-0005Ww-DY
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 14:56:43 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b24f37f-b899-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 15:56:41 +0100 (CET)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-TSb6-2JgOC-gug9412_iXQ-1; Thu, 12 Dec 2024 09:56:38 -0500
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4359206e1e4so7171515e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 06:56:38 -0800 (PST)
Received: from [192.168.88.24] (146-241-48-67.dyn.eolo.it. [146.241.48.67])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4362557c457sm19247805e9.15.2024.12.12.06.56.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 06:56:36 -0800 (PST)
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
X-Inumbo-ID: 4b24f37f-b899-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734015399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oL7oDzf/iu+owBEyFgADY3KtJbecvvlrXRMt6TBS380=;
	b=DeTuY93Gl+QN/i3NSufXohDh5kzQ5U46yxaBzDTGmmFpqioerQwohfCtNBrRf2YVQ/A/vf
	qHL0U/1TkrRuAVqYAU8oYfXmndUGM9+yJUKR7Kv1C++pqgQuajeQMr44mBK3YR/gHRwuZO
	ZEMNOE1WcmHFTmkM2nVLdSgErhzaYbk=
X-MC-Unique: TSb6-2JgOC-gug9412_iXQ-1
X-Mimecast-MFC-AGG-ID: TSb6-2JgOC-gug9412_iXQ
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734015397; x=1734620197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oL7oDzf/iu+owBEyFgADY3KtJbecvvlrXRMt6TBS380=;
        b=AXbltwZn+fWbNJqGxs/5OMBdP0altejP2yrfHVSfqctd1iEByg0es46hJk/QtVBdFE
         Yp3jbB8+zeUigo4+Mdy2H7oLLKYYAWYveVRDOM9spaFH351uQQen4YJZwGeVDV5JGDEq
         JNlCc88BPPelmBqT3Wkb4Gg6vVq8T0JlaWc1KWg4mC4UnkLpQoUnFS2QhdLof4aVaHHi
         7rgf1PKr7CUWct64BEhuc+o4Y1xQ5ttxfks846fVT49+vDz0HsPsqfb9ojM0+c7zfMNO
         Z4mj5a/TveVsAJkmaEonYs3KHDjvUNTMR7T37NNRX9TxCVCXELLGch8FfdbogkGn71vW
         vtqA==
X-Forwarded-Encrypted: i=1; AJvYcCUBcguf2PNgHmPFWL0DiVaK6eTXYolmVh6ZcbBWK16jVzUYpAlm4ENALoi9Cd3g4ZlJRm+qMRPtPMY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy53wtpPVdUGQJJvN2AHqlruyDNvXCaRkUIPlFC4P02AaCkMrS0
	VLlLBxtkSZ6rNZ2/Ai7xdGRP6PmPT8aMFSkRzAuO6eizbROatpCNMn7i1Q3StxJ+TxMMpc5doKC
	fYpAx73GNM/8GtW50ZLcOFYswoUFbrDd98G886alOUHrb41kIUIysP3EuzLD0DsRV
X-Gm-Gg: ASbGncvLYviR/CZRTjOl/8EHAAUGTTpRQTN20TzBM/zihSIHkTgW200pt1X+ZLUZCKM
	gnFRuu7O43ZeYeAFP2K+RWTC6khdCwJtKx9RxjeChFrDVT1+lMtLzc6H3b1Ac1ZfYmvNgBFBftK
	wry/Z5sQWrDXhTV8GriSIO/lR+B4k8VNIxXSTbG1T4c6yHb+OSnpxoRC36GdcGpD7+pDFvmiYOz
	7+SkaTCWTngXHFzuOncbznYq0lrMAZUCM3tT3JZ1dwqhqnqfgLTIw7k8wGFAZ9ZF75MG2n6OWmx
	gcN1cCU=
X-Received: by 2002:a05:600c:34cc:b0:434:fbe2:4f with SMTP id 5b1f17b1804b1-4361c430b5cmr63302745e9.23.1734015397016;
        Thu, 12 Dec 2024 06:56:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6jT4MvcNP0dxPJ6BKwDHdX4PrfqhYHXR4TAbgRNM6khL6oXpHiVnh7UfEpSYX/vLofOsSxA==
X-Received: by 2002:a05:600c:34cc:b0:434:fbe2:4f with SMTP id 5b1f17b1804b1-4361c430b5cmr63302405e9.23.1734015396688;
        Thu, 12 Dec 2024 06:56:36 -0800 (PST)
Message-ID: <8ee0cf91-c215-4015-90fc-32be6f22b7db@redhat.com>
Date: Thu, 12 Dec 2024 15:56:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] net/ethernet: Use never-managed version of
 pci_intx()
To: Philipp Stanner <pstanner@redhat.com>, amien Le Moal
 <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Dubov
 <oakad@yahoo.com>, Sudarsana Kalluru <skalluru@marvell.com>,
 Manish Chopra <manishc@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rasesh Mody <rmody@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, Igor Mitsyanko <imitsyanko@quantenna.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Sanjay R Mehta <sanju.mehta@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>,
 Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Alex Williamson <alex.williamson@redhat.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Chen Ni <nichen@iscas.ac.cn>,
 Ricky Wu <ricky_wu@realtek.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Breno Leitao <leitao@debian.org>, Thomas Gleixner <tglx@linutronix.de>,
 Kevin Tian <kevin.tian@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mostafa Saleh <smostafa@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yi Liu <yi.l.liu@intel.com>, Kunwu Chan <chentao@kylinos.cn>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Ankit Agrawal <ankita@nvidia.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Eric Auger <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20241209130632.132074-2-pstanner@redhat.com>
 <20241209130632.132074-5-pstanner@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241209130632.132074-5-pstanner@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VFg-QPmEhin6PmWLz6IcEXvTPCg1zMDoHJWWWo-lkIA_1734015397
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/9/24 14:06, Philipp Stanner wrote:
> pci_intx() is a hybrid function which can sometimes be managed through
> devres. To remove this hybrid nature from pci_intx(), it is necessary to
> port users to either an always-managed or a never-managed version.
> 
> broadcom/bnx2x and brocade/bna enable their PCI-Device with
> pci_enable_device(). Thus, they need the never-managed version.
> 
> Replace pci_intx() with pci_intx_unmanaged().
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

Acked-by: Paolo Abeni <pabeni@redhat.com>


