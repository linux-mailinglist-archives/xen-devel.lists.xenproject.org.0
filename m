Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD1F23071B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 11:56:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0MLC-0005Lx-He; Tue, 28 Jul 2020 09:56:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YMeI=BH=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1k0MLB-0005Ls-0k
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 09:56:09 +0000
X-Inumbo-ID: 8ec4cd5a-d0b8-11ea-a888-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 8ec4cd5a-d0b8-11ea-a888-12813bfff9fa;
 Tue, 28 Jul 2020 09:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595930167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aUrAS5QUx7aJBq33EdKIen4hJEFhAfzXF11a+eBiMWg=;
 b=OVkNmgQBGoh0fDpQ165MEYJgj3c4nB2sPnlB/6Wsu2l+ghY0cxHYgletVURa1u8FOSEusB
 NyC3X9p4Ut7yZclUP+SlAADfKANWGnD836KzSMcboPS6rCyVsQwsQY8MSazBuxUu/748hW
 G3JtqUyXTxFjp94Q32XoP6pAAJYoYYw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-4vRTAGzJMJeiAoKdcKJLvg-1; Tue, 28 Jul 2020 05:56:05 -0400
X-MC-Unique: 4vRTAGzJMJeiAoKdcKJLvg-1
Received: by mail-wr1-f71.google.com with SMTP id d6so3549775wrv.23
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2020 02:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=aUrAS5QUx7aJBq33EdKIen4hJEFhAfzXF11a+eBiMWg=;
 b=gtO+6xJ/rEOcVeo3XQUGLhC9+8hK2aU4+hmFymulPcmS9VuQO//CDqpdorCFdWOer6
 eyHhkqTsRGdRHWmVKLdQ7MpwC37GeSfuHwFVRRcvcQyZlnBlJmb/v2Maf0/nelEbD5tr
 Au0YkfgiJtSe/w0TzjYSOL+BAHoJOTm4FQZ4QutNaUYVFgmVsd2RtgOYT0QppxYCyfYT
 /WilE6CKJzmQWt8TJSxOc0Z1+yl5RwJgmqZ1cEb6Q6GgUabtR2HF5OSwxXo63X7hU9R/
 Nkopc/SLQmuZZdSYhkm8rDlte9cdQRJCnDTVsyx5Thm7o4yAm43tjuliVd9XJPEGMQqi
 +z1g==
X-Gm-Message-State: AOAM53379WOABCJlfF0ww3NvLsFzNhdJmCGSTjy0yA5G8JzrtuNGSYVV
 CNZwTSPhjMdi8Ku1hcesdkNqhsVKdGYpo3f7ksFtVS4bKStQVeXlc5moGykbVR2fVBB+y03F43E
 b47grJXL4tKc7eweZ8mfl0GFBYO8=
X-Received: by 2002:adf:bc07:: with SMTP id s7mr25860876wrg.254.1595930164761; 
 Tue, 28 Jul 2020 02:56:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPTniTmO93DbdEYYgW3nFfiWgEddHrB861exzX5lhYD6rzP5MEcd1ayoqZ2y2R89ir2LKEvg==
X-Received: by 2002:adf:bc07:: with SMTP id s7mr25860863wrg.254.1595930164627; 
 Tue, 28 Jul 2020 02:56:04 -0700 (PDT)
Received: from [192.168.1.39] (214.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.214])
 by smtp.gmail.com with ESMTPSA id x4sm17624541wru.81.2020.07.28.02.56.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2020 02:56:04 -0700 (PDT)
Subject: Re: [PATCH] configure: define CONFIG_XEN when Xen is enabled
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200728091828.21702-1-paul@xen.org>
 <CAFEAcA_wKTFWk9Uk5HMabqfa6QkkTAdzBotmnrA_EH1BR4XjYg@mail.gmail.com>
 <32ad0742-bff2-1fbc-2f7a-d078980eb171@redhat.com>
 <CAFEAcA84fH3aGpbrJoA6S3qJ-FjD3NZMoj0G7jqvRneH_pS6=A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <a09853d3-5c27-893f-54ed-63dc461bfacb@redhat.com>
Date: Tue, 28 Jul 2020 11:56:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA84fH3aGpbrJoA6S3qJ-FjD3NZMoj0G7jqvRneH_pS6=A@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Paul Durrant <pdurrant@amazon.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 7/28/20 11:53 AM, Peter Maydell wrote:
> On Tue, 28 Jul 2020 at 10:51, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>> I'd rather uninline xen_enabled() but I'm not sure this has perf
>> penalties. Paolo is that OK to uninline it?

I suppose no because it is in various hot paths:

exec.c:588:    if (xen_enabled() && memory_access_is_direct(mr, is_write)) {
exec.c:2243:        if (xen_enabled()) {
exec.c:2326:    if (xen_enabled()) {
exec.c:2478:    } else if (xen_enabled()) {
exec.c:2525:            } else if (xen_enabled()) {
exec.c:2576:    if (xen_enabled() && block->host == NULL) {
exec.c:2609:    if (xen_enabled() && block->host == NULL) {
exec.c:2657:    if (xen_enabled()) {
exec.c:3625:        if (xen_enabled()) {
exec.c:3717:    if (xen_enabled()) {
include/exec/ram_addr.h:295:    if (!mask && !xen_enabled()) {

> 
> Can we just follow the same working pattern we already have
> for kvm_enabled() etc ?

This was the idea... I'll look at what I missed.

Phil.


