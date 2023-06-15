Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CF173211A
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 22:52:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549847.858641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9tww-0007Wv-N5; Thu, 15 Jun 2023 20:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549847.858641; Thu, 15 Jun 2023 20:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9tww-0007PY-IJ; Thu, 15 Jun 2023 20:52:10 +0000
Received: by outflank-mailman (input) for mailman id 549847;
 Thu, 15 Jun 2023 20:52:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q9twu-0007L4-AT; Thu, 15 Jun 2023 20:52:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q9twt-00077m-F6; Thu, 15 Jun 2023 20:52:07 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.16.225]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q9twt-0002hC-9Q; Thu, 15 Jun 2023 20:52:07 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=KOAJoufzK5XHN3vfthVNiFM+xUJh2FnvSnd12rpZ5so=; b=riSi35tQKqUrysCpwXLy4MUOWi
	DDKxPzaWytVc1hE/ATcTc+oRV/Aa7BROUgobn34hf8dTreMIiSTaaUSWlF9knBO8egProSKhH4HqH
	9J9F2bUTfAmGau0gxsgL+OSjZRB7gW5DfQuqyOS1hGdq29KQF4Rb56rtmS7Rbo48whUo=;
Message-ID: <e3f54279-db7a-973c-e792-712dc2b19eb7@xen.org>
Date: Thu, 15 Jun 2023 21:52:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: Asking for help to debug xen efi on Kunpeng machine
Content-Language: en-US
To: Jiatong Shen <yshxxsjt715@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-users@lists.xenproject.org, xen-devel@lists.xenproject.org,
 bertrand.marquis@arm.com
References: <CALqm=ddiMwWvdYMgyCtaKMocUEkEJyTgSQup9wJiXm4PrcDuVw@mail.gmail.com>
 <alpine.DEB.2.22.394.2306081537590.3803068@ubuntu-linux-20-04-desktop>
 <e729d60e-b290-dec3-e35b-65c24ffbfda6@xen.org>
 <CALqm=ddc3BhqRQmPDjnZ3TeMEXPTMUDfj7JCSj0QEDxnMaKLvw@mail.gmail.com>
 <78899eac-9de8-3626-8f40-98f993984f95@xen.org>
 <CALqm=dfrudbnsy7RdP9GdSmyO2m9JN=8mKD7wQvz2WBv6afJhQ@mail.gmail.com>
 <CALqm=de+zGitK2ofX=gExMX1mVUbN1S45fMtf5a9iBR-WBZpcw@mail.gmail.com>
 <CALqm=dcn02oe=nrL_SEo+y5aTJX8SD3OB3fccFyEwPch6fLfDg@mail.gmail.com>
 <CALqm=deNDzc83QEAUqTE5iKb7g106V_k_F6AEJc19R=W-0TDsw@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CALqm=deNDzc83QEAUqTE5iKb7g106V_k_F6AEJc19R=W-0TDsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/06/2023 02:07, Jiatong Shen wrote:
> Hello Stefano and Julien,
> 
>     Could you provide more insights for debugging? I tried to connect to
> serial console through ipmitool sol activate and enabled ACPI, I do see
> some logs but the machine is still stuck. BMC video screen is still not
> responsive and black out.

Looking at your command line, you want to use console=hvc0 on the dom0 
command line. Hopefully, this will enable more logs from the kernel and 
give you an idea where it may be stuck.

Cheers,

-- 
Julien Grall

