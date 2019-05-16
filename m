Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E19DA209A4
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 16:29:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRHJy-00052t-Cd; Thu, 16 May 2019 14:25:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N6Wg=TQ=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hRHJw-00052d-6m
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 14:25:20 +0000
X-Inumbo-ID: 6de238b6-77e6-11e9-8980-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6de238b6-77e6-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 14:25:19 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id a10so3285176ljf.6
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 07:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IroyXnj1P0Ja58DpYQ2aqYAiqdcmUUO04mOpz/AHOSg=;
 b=As/T4WdYYPMI/knJ9XySRQ6vHUWnT00PIoc9xVbjShcZSwwrm5ujSdhgWf0+IbdTJY
 0SsqoYZPiopupfHKlKIchr5XXl/mgBluJHmrJim4t+LCjTSzWHb9KkZhiS0Z2edIoIQS
 CosNqTFdNrEF9tcLJeLt+9BWu6EgungRI6p9UrwW/hQgdkOzJ84dmG9I/kobNOAsWtbD
 lEpkAm638xU+JuQIlkDabri8qGJkTkfHyJ2gERlN28GPdWBuqLAni1QP6brre24jV6xA
 ubQQxzKn5wFJc7E+4a7LH8pQxl2BZq+MnEq7ympb6zsGIH36AB+VxTYsOQNgf25dqesI
 GeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IroyXnj1P0Ja58DpYQ2aqYAiqdcmUUO04mOpz/AHOSg=;
 b=Dtk3ubOWWZ+Z3le0RUMwF4zl3dyJG9nhOUPYAnFZU0nVBc+czfniZ8a8MZXiF4i4Ef
 AIK7MuwvRVATyP8eC0t7U9OSglBhOYylhhM4cWsIW+AF4V/UrwoPcK2pAoTErzOW6t2K
 7/74HPqqQx/5GIA1ze9CFp62PFAEZPbehVWSv1aEJ/oSBOGGbNlZZYhXUpTKxBFvtSRM
 N8Yk+nKXgsLBmg7O/mD5IcRH5aK15BjIGDOQB+2TsXtX7ERb6IQc0rg7yUHxSZVmeZdX
 pha8Uk03FGfIj73zrf3o5+PzvGvvALHHyVTqnD2MZ0BWlEWRLa9FQHu0IscXNGjh7sKK
 ZPIA==
X-Gm-Message-State: APjAAAVk/AjNChSlgJhx6b/XR3TDvK7PCXPrlLotWiGp7OdFFtnu/pTV
 7/YaBbnQmPuhXfo5OMOr0p4=
X-Google-Smtp-Source: APXvYqyBy0VtAkErKX6Q7tPibfnnSwv1Nf+W+Gko3J9cWcgWnEZPkC11mA4BfUItmdKggCv6f/3agg==
X-Received: by 2002:a2e:844a:: with SMTP id u10mr24502343ljh.41.1558016717529; 
 Thu, 16 May 2019 07:25:17 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 u13sm973078lfg.71.2019.05.16.07.25.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 07:25:16 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <5CDD52F1020000780022FA14@prv1-mh.provo.novell.com>
 <80187476-c972-7d88-d6f7-09c04d96705e@gmail.com>
 <4912f9e5-860a-04ce-92bc-99e1abe700a1@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <0095c6f0-531c-3794-991e-662a9a1283be@gmail.com>
Date: Thu, 16 May 2019 17:25:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4912f9e5-860a-04ce-92bc-99e1abe700a1@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen: implement
 VCPUOP_register_runstate_phys_memory_area
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSnVsaWVuLAoKT24gMTYuMDUuMTkgMTY6NDgsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBU
aGUgbG9jayBjYW4gYmUgY29tcGxldGVseSByZW1vdmVkIGFueXdheS4gU2VlIG15IHByZXZpb3Vz
IGNvbW1lbnRzLgoKWW91IHN1Z2dlc3RlZCBraW5kYSBzaW1wbGlmaWVkIHRyeV9sb2NrIHdpdGgg
cnVuc3RhdGUgdXBkYXRlIHNraXBwaW5nIGluIGNhc2Ugb2YgZmFpbC4KVGhlIHF1ZXN0aW9uIGhl
cmUgaXMgaWYgd2UgYXJlIE9LIHdpdGggbm90IHVwZGF0aW5nIHJ1bnN0YXRlIHVuZGVyIGNpcmN1
bXN0YW5jZXM/ClRob3VnaCBldmVuIGluIHRoaXMgY2FzZSB0aGUgcXVlc3Rpb24gaGVyZSBtaWdo
dCBiZSBpZiB3ZSBuZWVkIGBydW5zdGF0ZV9pbl91c2VgIHBlciBWQ1BVIG9yIHBlciBEb21haW4/
IE15IGFuc3dlciBpcyBwZXIgVkNQVS4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
