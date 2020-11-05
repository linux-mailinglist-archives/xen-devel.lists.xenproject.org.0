Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 320CD2A86DE
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 20:16:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20125.45766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kakja-00017B-FY; Thu, 05 Nov 2020 19:15:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20125.45766; Thu, 05 Nov 2020 19:15:46 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kakja-00016m-C9; Thu, 05 Nov 2020 19:15:46 +0000
Received: by outflank-mailman (input) for mailman id 20125;
 Thu, 05 Nov 2020 19:15:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=68sV=EL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kakjZ-00016h-Ob
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 19:15:45 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 92944e74-fcaa-49b9-ae41-4da99521ce84;
 Thu, 05 Nov 2020 19:15:45 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264--Qycz7d2O0O_BAs5Y70g2Q-1; Thu, 05 Nov 2020 14:15:42 -0500
Received: by mail-wm1-f72.google.com with SMTP id u207so997472wmu.4
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 11:15:42 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id l1sm4338333wrb.1.2020.11.05.11.15.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2020 11:15:40 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=68sV=EL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
	id 1kakjZ-00016h-Ob
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 19:15:45 +0000
X-Inumbo-ID: 92944e74-fcaa-49b9-ae41-4da99521ce84
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 92944e74-fcaa-49b9-ae41-4da99521ce84;
	Thu, 05 Nov 2020 19:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604603745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zfHkRg9lIDVW7VftAA3B1DAo0AYHo0uxnJbSHZqoR04=;
	b=V0hk9erb1nvkoLwAuWFXHvfTvWotDuxHioT9V0YpPg8SjrZNUvAWPDlvpSlP8w0SpcfP08
	EpcIluhuRGg9R5+qaQ1lHQ9Ac+Z7Ytcbmo+6Sc+ciOuFM/2MdtCL+HvknQGdc5KhPrELoX
	+2cNM4IcY+7QfhcMhcGh9fJKxN3afzg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264--Qycz7d2O0O_BAs5Y70g2Q-1; Thu, 05 Nov 2020 14:15:42 -0500
X-MC-Unique: -Qycz7d2O0O_BAs5Y70g2Q-1
Received: by mail-wm1-f72.google.com with SMTP id u207so997472wmu.4
        for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 11:15:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zfHkRg9lIDVW7VftAA3B1DAo0AYHo0uxnJbSHZqoR04=;
        b=EBEBmjtAH/Rf5QXE754QOgoHiw94LpuAvSQAMZqficOYTkefVthhHo3CXqboO2haKu
         /TLlEwiwSe5r6vlrhf9UIx5/Oj822y2PDJ7pVwhPvxR9/cUpD9/H7jFJKzW7jYckqTsb
         d4b2+/HzgG0iXxrQlkLzEV6RgjBvrWKtKN3jSf1xYjp3f4qUqbpw3fFYEnOohKVHFJix
         DHQED81EaVL+rI0qLK38ZZpGOIBwIFg2wMColQkwCo4QSH5HfGN08c/uLM/Tz30hta1r
         gnA3EVTLgcpEsAEUieZtEsT04zuUfqbr1H02IVeTyfN2haAxAq850dHjZsjtkTEMR5n7
         ksdw==
X-Gm-Message-State: AOAM530L3TRB46YnexCxdS6XPBZu2myTb9cmCMcT3GyPjDC6tPysxBJz
	Fb9iEUaas8F46rKZCNodOdleXnrsfGcFDus3r3LIZ7+11L+Av6gL/P7gkkGqphOItlbnbSzbAqE
	zxwo7x3grYIkhF4bi07ibHJC3gAM=
X-Received: by 2002:adf:ef45:: with SMTP id c5mr5021781wrp.117.1604603741631;
        Thu, 05 Nov 2020 11:15:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjKHKzVkbOCoUNiT6e3SRf5UgENSEyZ68H6dNtmYVGkBBAE0Ev1sUGISelLf4x7w4/vZM17g==
X-Received: by 2002:adf:ef45:: with SMTP id c5mr5021766wrp.117.1604603741443;
        Thu, 05 Nov 2020 11:15:41 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.234])
        by smtp.gmail.com with ESMTPSA id l1sm4338333wrb.1.2020.11.05.11.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 11:15:40 -0800 (PST)
Subject: Re: [RFC PATCH 11/15] include/hw/xen.h: drop superfluous struct
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 masami.hiramatsu@linaro.org, Paul Durrant <paul@xen.org>,
 andre.przywara@arm.com, stefano.stabellini@linaro.org,
 takahiro.akashi@linaro.org, Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 stefano.stabellini@xilinx.com, stratos-dev@op-lists.linaro.org
References: <20201105175153.30489-1-alex.bennee@linaro.org>
 <20201105175153.30489-12-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <43ed2ab8-abee-fc88-46cd-ff8d531753fa@redhat.com>
Date: Thu, 5 Nov 2020 20:15:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201105175153.30489-12-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/5/20 6:51 PM, Alex Bennée wrote:
> Chardev is already a typedef'ed struct.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/hw/xen/xen.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


