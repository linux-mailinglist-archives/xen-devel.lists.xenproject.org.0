Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C737E2D558B
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 09:39:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49005.86712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knHSv-0007Kw-AF; Thu, 10 Dec 2020 08:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49005.86712; Thu, 10 Dec 2020 08:38:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knHSv-0007KX-6o; Thu, 10 Dec 2020 08:38:21 +0000
Received: by outflank-mailman (input) for mailman id 49005;
 Thu, 10 Dec 2020 08:38:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e+LE=FO=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1knHSt-0007KS-TX
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 08:38:19 +0000
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07be165e-77c2-4a9c-acf0-df531ba2b6da;
 Thu, 10 Dec 2020 08:38:18 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id r14so4542859wrn.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Dec 2020 00:38:18 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-145.range86-183.btcentralplus.com.
 [86.183.162.145])
 by smtp.gmail.com with ESMTPSA id y2sm7910390wma.6.2020.12.10.00.38.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Dec 2020 00:38:16 -0800 (PST)
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
X-Inumbo-ID: 07be165e-77c2-4a9c-acf0-df531ba2b6da
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=hWism8dAra/zqrZqphMYnl0UaABicIgYXXykcRXnLqU=;
        b=X2xnoBVLs+HgZ8kKHCXL9qWLnPnb6AgH00At0ZiOgUAhSO7aHNojIiMca5WYBk9qvY
         cJ5WLuOEDbcQmQSu9UF1ihTD7a08DBjgrjSjRD+KpFStRAT/YgOgg2Gyb/VsWJCzOpkB
         NePdwwWA9dpqyW2nDTd1h2D8j1GsfZrlQUZwy1VJI5GClVAQdnLcaTDaAo3nNt3vRszG
         CKSgj2F1V0I/UUBmLLieGdlJr2eUQibAxVDBDVCI+jf8JBvVlu+UFwxOP/2/In4N8m43
         m8GsOJ5YO+8OC/+TewPprL9Vf7UhR23eMdLtX42Lf5rPucz9ojnYfUhTNzKvknqMINaJ
         uBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=hWism8dAra/zqrZqphMYnl0UaABicIgYXXykcRXnLqU=;
        b=UR25DyHTU6Eh6+fcIs2PgP1GwDrOp2f26uhYCVBrgIz/cBxBY3UcVQrZCwYQPYu0eP
         i3bXzL6iLRMta34w7TStlX4d2eN+XwQ9YNO+VX+7FWeEwCH1JY5b94OmnBG0ejQmU5RL
         Dt3gXDb3oc0AukyQ7a0ThzTNG81hoi1tSZtIeZ9qdD0C41LD2bKVKB5rt5yKh+tyN1Wo
         KCe4WJi1NEcjH8RcGUv0x8KS4rPdfPOED6i9P2Ex55F9eeVueAE47H2xuBqlaQOBB9wz
         O60Cid2UZnKePFDnqGWO06jgJPUNCEZcQyEl4yitkTGChmqhEz19mvZOWoM7HOAvO/XI
         uZBw==
X-Gm-Message-State: AOAM530jK3GuZ9tAg+0cHc9SzsIHyYWAvtwcntjZ6KzFOvPEkdK6TcKD
	OHO6+elckTLF+/zFz83VA7U=
X-Google-Smtp-Source: ABdhPJwEbVCylVa5C70bKwkavxNmoAgvQCZ2K8i+uMODl+5/Th+YllX6SnLsdYEze4drM9dIqXtVQg==
X-Received: by 2002:a5d:4ccf:: with SMTP id c15mr6941235wrt.237.1607589497574;
        Thu, 10 Dec 2020 00:38:17 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr'" <olekstysh@gmail.com>
Cc: "'Jan Beulich'" <jbeulich@suse.com>,
	"'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Volodymyr Babchuk'" <Volodymyr_Babchuk@epam.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Wei Liu'" <wl@xen.org>,
	"'Julien Grall'" <julien.grall@arm.com>,
	<xen-devel@lists.xenproject.org>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com> <1606732298-22107-18-git-send-email-olekstysh@gmail.com> <3bb4c3b5-a46a-ba31-292f-5c6ba49fa9be@suse.com> <6026b7f3-ae6e-f98f-be65-27d7f729a37f@gmail.com> <18bfd9b1-3e6a-8119-efd0-c82ad7ae681d@gmail.com> <0d6c01d6cd9a$666326c0$33297440$@xen.org> <57bfc007-e400-6777-0075-827daa8acf0e@gmail.com> <0d7201d6ce09$e13dce80$a3b96b80$@xen.org> <96b9b843-f4fe-834a-f17b-d75198aa0dab@gmail.com>
In-Reply-To: <96b9b843-f4fe-834a-f17b-d75198aa0dab@gmail.com>
Subject: RE: [PATCH V3 17/23] xen/ioreq: Introduce domain_has_ioreq_server()
Date: Thu, 10 Dec 2020 08:38:15 -0000
Message-ID: <002401d6cecf$ce472710$6ad57530$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQKk0D4Qme59XF0a0h96d36zIOxDhQIE/k2jAQvf44kCfV5qfQHp2KBNAqVQolsB+TCoJgKL4LaZAk9ZfyOnzG/cYA==

> -----Original Message-----
> From: Oleksandr <olekstysh@gmail.com>
> Sent: 09 December 2020 20:36
> To: paul@xen.org
> Cc: 'Jan Beulich' <jbeulich@suse.com>; 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>;
> 'Stefano Stabellini' <sstabellini@kernel.org>; 'Julien Grall' <julien@xen.org>; 'Volodymyr Babchuk'
> <Volodymyr_Babchuk@epam.com>; 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'George Dunlap'
> <george.dunlap@citrix.com>; 'Ian Jackson' <iwj@xenproject.org>; 'Wei Liu' <wl@xen.org>; 'Julien Grall'
> <julien.grall@arm.com>; xen-devel@lists.xenproject.org
> Subject: Re: [PATCH V3 17/23] xen/ioreq: Introduce domain_has_ioreq_server()
> 
> 
> Hi Paul.
> 
> 
> >>>>>> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
> >>>>>>> --- a/xen/include/xen/ioreq.h
> >>>>>>> +++ b/xen/include/xen/ioreq.h
> >>>>>>> @@ -55,6 +55,20 @@ struct ioreq_server {
> >>>>>>>         uint8_t                bufioreq_handling;
> >>>>>>>     };
> >>>>>>>     +/*
> >>>>>>> + * This should only be used when d == current->domain and it's not
> >>>>>>> paused,
> >>>>>> Is the "not paused" part really relevant here? Besides it being rare
> >>>>>> that the current domain would be paused (if so, it's in the process
> >>>>>> of having all its vCPU-s scheduled out), does this matter at all?do
> >>>>>> any extra actionsdo any extra actions
> >>>>> No, it isn't relevant, I will drop it.
> >>>>>
> >>>>>
> >>>>>> Apart from this the patch looks okay to me, but I'm not sure it
> >>>>>> addresses Paul's concerns. Iirc he had suggested to switch back to
> >>>>>> a list if doing a swipe over the entire array is too expensive in
> >>>>>> this specific case.
> >>>>> We would like to avoid to do any extra actions in
> >>>>> leave_hypervisor_to_guest() if possible.
> >>>>> But not only there, the logic whether we check/set
> >>>>> mapcache_invalidation variable could be avoided if a domain doesn't
> >>>>> use IOREQ server...
> >>>> Are you OK with this patch (common part of it)?
> >>> How much of a performance benefit is this? The array is small to simply counting the non-NULL
> >> entries should be pretty quick.
> >> I didn't perform performance measurements on how much this call consumes.
> >> In our system we run three domains. The emulator is in DomD only, so I
> >> would like to avoid to call vcpu_ioreq_handle_completion() for every
> >> Dom0/DomU's vCPUs
> >> if there is no real need to do it.
> > This is not relevant to the domain that the emulator is running in; it's concerning the domains
> which the emulator is servicing. How many of those are there?
> Err, yes, I wasn't precise when providing an example.
> Single emulator is running in DomD and servicing DomU. So with the
> helper in place the vcpu_ioreq_handle_completion() gets only called for
> DomU vCPUs (as expected).
> Without an optimization the vcpu_ioreq_handle_completion() gets called
> for _all_ vCPUs, and I see it as an extra action for Dom0, DomD vCPUs.
> 
> 
> >
> >> On Arm vcpu_ioreq_handle_completion()
> >> is called with IRQ enabled, so the call is accompanied with
> >> corresponding irq_enable/irq_disable.
> >> These unneeded actions could be avoided by using this simple one-line
> >> helper...
> >>
> > The helper may be one line but there is more to the patch than that. I still think you could just
> walk the array in the helper rather than keeping a running occupancy count.
> 
> OK, is the implementation below close to what you propose? If yes, I
> will update a helper and drop nr_servers variable.
> 
> bool domain_has_ioreq_server(const struct domain *d)
> {
>      const struct ioreq_server *s;
>      unsigned int id;
> 
>      FOR_EACH_IOREQ_SERVER(d, id, s)
>          return true;
> 
>      return false;
> }

Yes, that's what I had in mind.

  Paul

> 
> --
> Regards,
> 
> Oleksandr Tyshchenko



