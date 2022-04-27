Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDE45118BE
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 16:25:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315136.533528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njibU-00025d-Oc; Wed, 27 Apr 2022 14:25:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315136.533528; Wed, 27 Apr 2022 14:25:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njibU-000235-KT; Wed, 27 Apr 2022 14:25:16 +0000
Received: by outflank-mailman (input) for mailman id 315136;
 Wed, 27 Apr 2022 14:25:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XTkK=VF=gmail.com=raphning@srs-se1.protection.inumbo.net>)
 id 1njibT-00022z-3U
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 14:25:15 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7dbc0a6-c635-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 16:25:10 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so1301478wmn.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Apr 2022 07:25:13 -0700 (PDT)
Received: from [10.7.238.41] (54-240-197-226.amazon.com. [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1cf403000000b0037d1f4a2201sm1694942wma.21.2022.04.27.07.25.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 07:25:12 -0700 (PDT)
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
X-Inumbo-ID: d7dbc0a6-c635-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=jnHRrtGDsL9+LlxuZjl9mC6I9iUXKYvIZLxsWqLj9cA=;
        b=mZ++LJ22sII79BMcErUQy3ijGBJ+i6fVy2n2IgY3PhU725JQHTdxhi1X0XJWd7yC9V
         jWnewu2Dqwg1Osvanr/Gj3uXx8vzbPAI7s+hCJFl3ZC/vvnPX0OwKQaKUQUeiHTspbrE
         R+Wd1BLgfuOXjW7bQPhudRRuH+0BQzJupBUYEAkapvF3B2slz5GYpREk7aXT9kcw0n6z
         7i8TRzqg0VrmU9ZSyRb/PQBpIYgd9RnxlayZqHcxnersZlW6f2rLgptwcHScvVBXwSkr
         PLT5WVW9eh6+eq9dP64XEllxWQdHARiV+ExY54JoWBPhDyVFP0xd1PNLLSVxmSeYbGs3
         wkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=jnHRrtGDsL9+LlxuZjl9mC6I9iUXKYvIZLxsWqLj9cA=;
        b=cTMIg+GABMTPuOzRmcaTZVHBaloChNdohne30GwiDCWqc+OM/gGrlTiLmPk9BLBSls
         e9+i4LQDOSNLT5B5QQS4Mo8onDkRyhyZ+Wix6UR98yLvaJPLvdoKY/Rpl8PnoQrxuVwY
         Y9Bm5pJE1QuVrqaw6l/BYqCOpM56jODFw03EycBXKFeE1V3wFhB9qWzJVOztTMp+qYSN
         WLXJxkkfSrFWfKYLBsBCqrB+gRldraXyHfhCb69dYSMhPQx4jYwKhgOS04icGJHepx9L
         qmW/s2ps/EHEwG93Awl5/oRR6vrTSR2nRZY8wVeP1TNl8jEokaJAN/Sc3dk0XfYCrp1d
         UK3g==
X-Gm-Message-State: AOAM533TutUB47NwPQhuYHvpnPashcjDnXkVGfqUUB3oKz6bwok852g7
	SY0bxQ+te57TcfrHya0Bqyp3c+NmA9nDxg==
X-Google-Smtp-Source: ABdhPJzoRVecWsHbvj1dwHBzggipZdmFQutDgrnzyz5JF6i1f/PT/FWXpO79JH1mR+rgJ12CKFNLdw==
X-Received: by 2002:a7b:cb84:0:b0:382:a9b9:2339 with SMTP id m4-20020a7bcb84000000b00382a9b92339mr36297816wmi.91.1651069512775;
        Wed, 27 Apr 2022 07:25:12 -0700 (PDT)
Message-ID: <a95fafbb-1910-7e3b-43f8-d507fcf162e8@gmail.com>
Date: Wed, 27 Apr 2022 15:25:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH] tools/xenstore: don't let special watches be children of
 /
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20220427135156.4605-1-jgross@suse.com>
From: Raphael Ning <raphning@gmail.com>
In-Reply-To: <20220427135156.4605-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Juergen,


On 27/04/2022 14:51, Juergen Gross wrote:
> When firing special watches (e.g. "@releaseDomain"), they will be
> regarded to be valid children of the "/" node. So a domain having
> registered a watch for "/" and having the privilege to receive
> the special watches will receive those special watch events for the
> registered "/" watch.
>
> Fix that by calling the related fire_watches() with the "exact"
> parameter set to true, causing a mismatch for the "/" node.
>
> Reported-by: Raphael Ning <raphning@gmail.com>


Can I ask you to use my Amazon email instead:

Reported-by: Raphael Ning <raphning@amazon.com>

Sorry about the inconsistency. I work on Xen as part of my job, but I decided to use Gmail for posting on xen-devel, because I heard that it's a pain to make Amazon mail work properly with external mailing lists.


> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  tools/xenstore/xenstored_domain.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
> index ae065fcbee..80ba1d627b 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -231,7 +231,7 @@ static int destroy_domain(void *_domain)
>  			unmap_interface(domain->interface);
>  	}
>  
> -	fire_watches(NULL, domain, "@releaseDomain", NULL, false, NULL);
> +	fire_watches(NULL, domain, "@releaseDomain", NULL, true, NULL);
>  
>  	wrl_domain_destroy(domain);
>  
> @@ -282,7 +282,7 @@ void check_domains(void)
>  	}
>  
>  	if (notify)
> -		fire_watches(NULL, NULL, "@releaseDomain", NULL, false, NULL);
> +		fire_watches(NULL, NULL, "@releaseDomain", NULL, true, NULL);
>  }
>  
>  /* We scan all domains rather than use the information given here. */
> @@ -495,7 +495,7 @@ static struct domain *introduce_domain(const void *ctx,
>  
>  		if (!is_master_domain && !restore)
>  			fire_watches(NULL, ctx, "@introduceDomain", NULL,
> -				     false, NULL);
> +				     true, NULL);
>  	} else {
>  		/* Use XS_INTRODUCE for recreating the xenbus event-channel. */
>  		if (domain->port)


Thanks, the patch looks good.

Reviewed-by: Raphael Ning <raphning@amazon.com>


Raphael


