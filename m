Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFC53F203F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 20:56:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169107.308908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGnCi-0006Ts-89; Thu, 19 Aug 2021 18:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169107.308908; Thu, 19 Aug 2021 18:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGnCi-0006R7-58; Thu, 19 Aug 2021 18:55:52 +0000
Received: by outflank-mailman (input) for mailman id 169107;
 Thu, 19 Aug 2021 18:55:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hQ7n=NK=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1mGnCh-0006Qx-44
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 18:55:51 +0000
Received: from mail-wr1-x434.google.com (unknown [2a00:1450:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f3ccfc8-3ba9-4f71-b888-27b8c6368d79;
 Thu, 19 Aug 2021 18:55:50 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id k8so10556980wrn.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Aug 2021 11:55:50 -0700 (PDT)
Received: from ?IPv6:2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec?
 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id f17sm3090812wmq.17.2021.08.19.11.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 11:55:49 -0700 (PDT)
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
X-Inumbo-ID: 2f3ccfc8-3ba9-4f71-b888-27b8c6368d79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=beKr+18OVxhdpZsKonr41wMvnFcE0jP4JQYsuR2VgVM=;
        b=VE7vAMAcKNDdrlVka/CeMl3qBXfWD+oQcQ4o23QkI9tcNuSBHR9zdZOeAO0njsO8cM
         SqyMxoVLZ+eo8Nbg+9+eTZF/qkYwts+ZNtI7OkUCrONlHjk5XOglWCYwMr//0djUAiWm
         kxrv7CQO4/AFpE/nwrWCpsb5HBU376sagSxeCBxPoxa0+PvtEcQ/78XcW3zENBzU1aYI
         fOcTnxvuWgdyNYLNG2vk2r6NOwW/CU3dcdnVY0BTUd9EgXIl1jXnMAA7lJDUz7Rqp5Qm
         439nN5C2k2ZsoziD99iz8cVLOht222+6wHJPGOjW+Kk4OVxZtm0I+gUBpKCc6wE9PQ7H
         iuvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=beKr+18OVxhdpZsKonr41wMvnFcE0jP4JQYsuR2VgVM=;
        b=lWfCLTbDMjTMRfuFrILUtFyBzStHzOK+uUbLBk0Y7Kz2b0COWhsChtBHsPnPusjvr8
         RmAzX1+4TCJC2s+0VY00LHdrQty9W9uIDSzuAkJ/4FaifpG/AuNozDLRx/4CFL7KMMxw
         FdQTxo/iJMRf9D7Cy7BQ2BC73ZI/PK2k93JvP3DCUK5umwUwy+nFPKDYfosgahTnxkPL
         HeTwYi2qnkIkYoYnki/tDhDtZM6/TXAcJ2qY1NppaViG7PhIlVfxKQ5ETtr1qmo5Kmjv
         DQbSbGGpCdrENcMYqWfOP6Odjg0jWDwiSYYBPNYOF0qcDn9mWchaOJjBka0TrjoeSOT0
         7jyw==
X-Gm-Message-State: AOAM533tSvVlJeMgAZGRHC3OWim35UhK1nAe3MHECBxExpZgjLyyVWhK
	dC0aGEJ2qFSqIindG8xme+A=
X-Google-Smtp-Source: ABdhPJy1824HRqYGlTjrIIe7nHo674eESKBo/yy1LwOHSy5Zu5JhUIdCnGIaX66c9Dcp5Ao0MKtT6A==
X-Received: by 2002:a5d:6352:: with SMTP id b18mr5506947wrw.116.1629399349665;
        Thu, 19 Aug 2021 11:55:49 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH] AMD/IOMMU: don't leave page table mapped when unmapping
 ...
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
References: <dfc83bb9-66f4-e8da-20c6-e4730e0fecde@suse.com>
Message-ID: <b3ede533-cb06-7ddd-80cb-e98fc28d8cf6@xen.org>
Date: Thu, 19 Aug 2021 19:55:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <dfc83bb9-66f4-e8da-20c6-e4730e0fecde@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19/08/2021 09:03, Jan Beulich wrote:
> ... an already not mapped page. With all other exit paths doing the
> unmap, I have no idea how I managed to miss that aspect at the time.
> 
> Fixes: ad591454f069 ("AMD/IOMMU: don't needlessly trigger errors/crashes when unmapping a page")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 

Reviewed-by: Paul Durrant <paul@xen.org>

