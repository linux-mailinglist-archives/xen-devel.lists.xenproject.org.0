Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAA63D25F6
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jul 2021 16:41:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159777.293818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6Zrh-0006U7-Fn; Thu, 22 Jul 2021 14:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159777.293818; Thu, 22 Jul 2021 14:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6Zrh-0006Rm-Cs; Thu, 22 Jul 2021 14:39:57 +0000
Received: by outflank-mailman (input) for mailman id 159777;
 Thu, 22 Jul 2021 14:39:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o0YX=MO=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1m6Zrg-0006Rg-Ie
 for xen-devel@lists.xenproject.org; Thu, 22 Jul 2021 14:39:56 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id db36ad5d-1cfe-4223-b02a-708d7846a59d;
 Thu, 22 Jul 2021 14:39:55 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-VzxSYzibOVqmhsRiWiqfQQ-1; Thu, 22 Jul 2021 10:39:54 -0400
Received: by mail-ed1-f72.google.com with SMTP id
 ee46-20020a056402292eb02903a1187e547cso2892343edb.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jul 2021 07:39:54 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y11sm9574659ejr.14.2021.07.22.07.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 07:39:52 -0700 (PDT)
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
X-Inumbo-ID: db36ad5d-1cfe-4223-b02a-708d7846a59d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626964795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cqQ6xN3WrK5HyDDkUWHeq6CnrRxEF9ZrWlGfcVc0UGs=;
	b=Uyf4RRjSUzDEsRLJ2Iu1EEr7aNoeiu7kyOi7KDB2ifwVwBeyRqrmeNLCG4pf9sKVCcrK8D
	LMdBwCKn4UMDzQAwhkOQyPIsPuXWqOS18SDTuJR+JmauCQd45gmQ+z4Fh3RDR0BgNPp7wu
	SL42jRKxsNwFGSQhhw3CpOLs669k7/8=
X-MC-Unique: VzxSYzibOVqmhsRiWiqfQQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cqQ6xN3WrK5HyDDkUWHeq6CnrRxEF9ZrWlGfcVc0UGs=;
        b=pBaRjF4dPyDrmq+zaDbSKOM/wCPP2N3XdVno1BhX2F3qxKEyQNE+GygxDPNd/Os42G
         fP6+wN1S+YNtXSnDb7XDXHWRyGaguXPGEdy4PqM13xT9bAlAm5mizQ3IIYcSfgBEBsTI
         50bp1/1+DcdtxYuU8vPwSSbgQZ9qxO/WPtF8Xt+J/X6JO45R/uPflcgLJm4J29eg0A5W
         qSSNHrfhN3Eorx3AFT9TOHTrVhgpr2MTOpSx/RL7pYPlFjWrQSuSe2Ian8MrYr5gAqvA
         XxJ3UF7DAsY7Dqo1QBlAY7th7f019vKZ2OPSfjnp9RdO0kbjYyLgxKOHPLf5JWBiHUTQ
         lMLw==
X-Gm-Message-State: AOAM530Ct6yHDOaaWDFCQL0xuxIwx4pa4CxCxuPYyyhSZMQ0FpbY6Zj0
	4xv9SU/2O0a12HM96vJunfyPSu3YZwXdLK0+8VCpYNWUYZJwIc8ThD0td80I6Chh+dRS3YvAnTN
	QKZ8jkIyZVWLg+sJGiUfG2iUtLsUp3KzAjRSuIzTbJk77WLpkIB+OA3Zyza2o66YEBUCNvdCmRP
	rb/GA=
X-Received: by 2002:a17:906:63ca:: with SMTP id u10mr194557ejk.411.1626964792870;
        Thu, 22 Jul 2021 07:39:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyv1FDFnJyJh3QY4FeAo6zw+kkyVNlrl6aHdi1VelxkTVLPGdsZcVwrfhNr8p3jw/nEkSjnKA==
X-Received: by 2002:a17:906:63ca:: with SMTP id u10mr194541ejk.411.1626964792691;
        Thu, 22 Jul 2021 07:39:52 -0700 (PDT)
Subject: Re: [PATCH] vl: Parse legacy default_machine_opts
To: Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
References: <CAKf6xps07sbk7MnehPTKes52sst0UyaHiHjjSdEX0bFjT+E_ag@mail.gmail.com>
 <20210713021552.19110-1-jandryuk@gmail.com> <YPl80YnsDpLI8gtN@perard>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2f532fad-9c74-04b5-58c7-5f9d5464340e@redhat.com>
Date: Thu, 22 Jul 2021 16:39:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPl80YnsDpLI8gtN@perard>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22/07/21 16:12, Anthony PERARD via wrote:
> Reviewed-by: Anthony PERARD<anthony.perard@citrix.com>
> 
> I can't find a different way to set a default "accelerator" to a
> machine, so this patch seems necessary.

I agree, and I'll be sending a pull request shortly.

Paolo


