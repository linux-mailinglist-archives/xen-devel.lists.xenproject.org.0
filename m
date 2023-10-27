Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC147D939F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 11:26:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624307.972771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwJ6I-0003ZJ-IX; Fri, 27 Oct 2023 09:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624307.972771; Fri, 27 Oct 2023 09:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwJ6I-0003XA-FN; Fri, 27 Oct 2023 09:25:54 +0000
Received: by outflank-mailman (input) for mailman id 624307;
 Fri, 27 Oct 2023 09:25:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eEfT=GJ=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qwJ6H-0003X4-C9
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 09:25:53 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2648ba7-74aa-11ee-98d6-6d05b1d4d9a1;
 Fri, 27 Oct 2023 11:25:52 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4083ac51d8aso14355675e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Oct 2023 02:25:52 -0700 (PDT)
Received: from [192.168.10.177] (54-240-197-227.amazon.com. [54.240.197.227])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a05600c45cd00b004083bc9ac90sm1171371wmo.24.2023.10.27.02.25.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 02:25:51 -0700 (PDT)
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
X-Inumbo-ID: d2648ba7-74aa-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698398752; x=1699003552; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=omznWtzf1XKHmZ/Z5NbQjoHVHixpWX6ejbkUDaU7VuQ=;
        b=An+8iWYnmEgESrY2xdERkZJ4Gqc/5VBdRjyjp0ozNlRvIfXLFu0TOk17VNDx55XPmA
         eP/RMusI+pKvDeeLM3mlPXOPqyNps8LcgoQk8F8G2wSDLRcYpcOK8ryoeyGR754ockvm
         Hq45A4oPTAUMrkTfWtKhq6Co7GTW59+10Uo2lqA+YAJfRNDojzv0JN3Ms/iyWBa3quw8
         mBr2PjQ9tMGM+sTUGXl4XYS582i5pcNCWW+fFm5xEMNfjO6e8CmmMi7WzGjIsNU/uaXy
         w2HLRFJmexBaEBqW3bYCPpD9bnGVoMbl6NZ1n8tc5++Y002v5642gv5gXuaUXUGAE1G4
         9xpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698398752; x=1699003552;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=omznWtzf1XKHmZ/Z5NbQjoHVHixpWX6ejbkUDaU7VuQ=;
        b=WM9NwZXix8dflY7oZLLiimUYENKZ3lakUB6F4ZVObJoh0IsZkFdR7jLNan/GtrF/hZ
         6WtLbyUV8IBKocFtDxs45tpGj1LZJdxXKl/VXX/VT9GRXo2xnH79AjWrmowZ+zZ9LNAM
         yrlqhIaXRrsTYcOdPr2/VdThybw/S6mg67a1t8FszxJ0Vet91oOz1I0hOcbzEaCMB8Kt
         oVKwMhLFrqG571IS9tn032YjmbuUQqOSy3ntwE+5AnJ4djy61/Xb4XkNZx9Ns1BYDWRO
         MPRND07w4C4YJP3xLVdFx35tGMTT4NFrA7S1svS9I45LvuzCyD+g+j59fuLnzG3Z8BTi
         Ae8g==
X-Gm-Message-State: AOJu0YxV4AgCl6zMDos1x3+tQYnuxghLHO7ofdmyo18SS582Gt5bM82u
	XwWyXtVp1IjPLz03rxzsMV0=
X-Google-Smtp-Source: AGHT+IHJSsP+G8xwzCbhqRxELYFim76cG7KxRmQWj9AASSXVf0gXlQDLn+wC5l6TMdiRtV9QnIFltg==
X-Received: by 2002:a05:600c:468e:b0:408:3739:68fd with SMTP id p14-20020a05600c468e00b00408373968fdmr1901178wmo.6.1698398751572;
        Fri, 27 Oct 2023 02:25:51 -0700 (PDT)
Message-ID: <e4bf8f7a-9635-4315-b0e1-6dfb6c524631@gmail.com>
Date: Fri, 27 Oct 2023 10:25:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v3 22/28] net: add qemu_{configure,create}_nic_device(),
 qemu_find_nic_info()
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
 <20231025145042.627381-23-dwmw2@infradead.org>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20231025145042.627381-23-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/10/2023 15:50, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Most code which directly accesses nd_table[] and nb_nics uses them for
> one of two things. Either "I have created a NIC device and I'd like a
> configuration for it", or "I will create a NIC device *if* there is a
> configuration for it".  With some variants on the theme around whether
> they actually *check* if the model specified in the configuration is
> the right one.
> 
> Provide functions which perform both of those, allowing platforms to
> be a little more consistent and as a step towards making nd_table[]
> and nb_nics private to the net code.
> 
> Also export the qemu_find_nic_info() helper, as some platforms have
> special cases they need to handle.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   include/net/net.h |  7 ++++++-
>   net/net.c         | 51 +++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 57 insertions(+), 1 deletion(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


