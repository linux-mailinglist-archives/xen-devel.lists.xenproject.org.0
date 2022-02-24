Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E973D4C24C6
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 08:54:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277917.474784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nN8xB-0003aX-0O; Thu, 24 Feb 2022 07:54:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277917.474784; Thu, 24 Feb 2022 07:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nN8xA-0003YR-T4; Thu, 24 Feb 2022 07:54:20 +0000
Received: by outflank-mailman (input) for mailman id 277917;
 Thu, 24 Feb 2022 07:54:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bEeT=TH=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1nN8x8-0003XH-VT
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 07:54:19 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7724bf7-9546-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 08:54:17 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id s13so1618065wrb.6
 for <xen-devel@lists.xenproject.org>; Wed, 23 Feb 2022 23:54:17 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:b013:cd66:72b0:92c8?
 ([2a00:23c5:5785:9a01:b013:cd66:72b0:92c8])
 by smtp.gmail.com with ESMTPSA id v7sm591707wrr.41.2022.02.23.23.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 23:54:16 -0800 (PST)
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
X-Inumbo-ID: f7724bf7-9546-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=P/QdCt/Tgr1NhGv8Wt2qx0d+ksy5gHYVcGOQ9sIcJi4=;
        b=FC1gu07hwptBvAiJyvyQlIWguTtl6iYIN+0yCgXNTS8HoKUXnb0lI7ElLjogLeRCrJ
         nyyndEgk+C2pAA1WJTMmQluBDA7+WKtQYmpr+7PVQffjR+HSjvY5W5xN/ubBgu2JuT6k
         fnvE2+w0d8dirZbj1nl2o9Xe4ZQ6/lfFmmV3nrvfOQaQ0Hy6+3GxjD4yTNSs7lv/FECs
         /sZ6jQj7Cb3dCNq/dxlZrW77WfG9jNlC/t8oWdrGTimv80iIHkh015FByHVRFiVEK7i+
         LBolPGJrQdcUswi/xfW9kC5Cb+O9fxLZdwU8hjKG7tAvaE5PwU3YZRC4t7NyIwtScsgT
         fZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=P/QdCt/Tgr1NhGv8Wt2qx0d+ksy5gHYVcGOQ9sIcJi4=;
        b=S1BjQQZEsLb8lUTi7KPvq+lCaNYPCds0aATc6AhAvMTzssYv4sacFULDTw8ZSjzAh+
         h8vtiCGdS7bEQKwP45IN7tIB/U0Gmi8bXUvYRRU8suMtSO4cyj9k5nQOxFOWAcQGXF2g
         9elcn4kt2E+o4YVwoDzm1doW7y9vkIlIP227m/n+mmNsS7xXiVa0V+n1530C/DKTxmjB
         wkV0Z49GzxaQpkNNrWUWZwE0Jnj4cT/257TN5I/P1T0kLV54mvtnze9VDUvg0BTMKRHM
         nKFmrD3plSFzOp8iZoDREptPWRxD2YB8VDeAjn5f25GEpvc1/8rSc2AuuKlp04wy3epb
         fcCQ==
X-Gm-Message-State: AOAM530p782+N/VifEqzpQf9Z8a7XJLqoxxtqLHOVGRn0TY2GUjBHrZv
	teEhE38ij65pol9bHcytZaA=
X-Google-Smtp-Source: ABdhPJy1SdIn3EKk8TBCGbyeJk5RfTnMOzot3SLzXajRYRUsTBYg6N0saeU2O/sDUJjf2kIWIm0WTg==
X-Received: by 2002:a5d:64c6:0:b0:1e8:ee04:e8fb with SMTP id f6-20020a5d64c6000000b001e8ee04e8fbmr1172924wri.518.1645689256968;
        Wed, 23 Feb 2022 23:54:16 -0800 (PST)
Message-ID: <dae477f8-1593-4eda-adb1-fa6845e5f993@gmail.com>
Date: Thu, 24 Feb 2022 07:54:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 1/2] Revert "xen-netback: remove 'hotplug-status' once
 it has served its purpose"
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Michael Brown <mcb30@ipxe.org>,
 Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 "moderated list:XEN NETWORK BACKEND DRIVER"
 <xen-devel@lists.xenproject.org>,
 "open list:XEN NETWORK BACKEND DRIVER" <netdev@vger.kernel.org>
References: <20220222001817.2264967-1-marmarek@invisiblethingslab.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20220222001817.2264967-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/02/2022 00:18, Marek Marczykowski-Górecki wrote:
> This reverts commit 1f2565780e9b7218cf92c7630130e82dcc0fe9c2.
> 
> The 'hotplug-status' node should not be removed as long as the vif
> device remains configured. Otherwise the xen-netback would wait for
> re-running the network script even if it was already called (in case of
> the frontent re-connecting). But also, it _should_ be removed when the
> vif device is destroyed (for example when unbinding the driver) -
> otherwise hotplug script would not configure the device whenever it
> re-appear.
> 
> Moving removal of the 'hotplug-status' node was a workaround for nothing
> calling network script after xen-netback module is reloaded. But when
> vif interface is re-created (on xen-netback unbind/bind for example),
> the script should be called, regardless of who does that - currently
> this case is not handled by the toolstack, and requires manual
> script call. Keeping hotplug-status=connected to skip the call is wrong
> and leads to not configured interface.
> 
> More discussion at
> https://lore.kernel.org/xen-devel/afedd7cb-a291-e773-8b0d-4db9b291fa98@ipxe.org/T/#u
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Paul Durrant <paul@xen.org>

