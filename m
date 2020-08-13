Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2F924397C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 13:51:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6BkD-0001Lp-Gs; Thu, 13 Aug 2020 11:50:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8kwl=BX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k6BkC-00017q-8W
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 11:50:04 +0000
X-Inumbo-ID: eacb256c-5773-4b54-bf3e-f22d946918a5
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eacb256c-5773-4b54-bf3e-f22d946918a5;
 Thu, 13 Aug 2020 11:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597319403;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=3h/6h+TTqGKylhQfVOCm+hm0y70vfCrsuo7GmI/Wim4=;
 b=d7BQ4mibi6KE8L2PRaYWY9Eq9KpwKQ3/E4wjUIxzW+XDI/7/VzpjZGUW
 GfBwb+yv8s6neDUa85KF0/VD9mG1uyX9upjciCl005Mi8lyQfDxBScPpG
 63JsSD6NDHdE6jvQ6uoiTjjsmyxaQSiJlVY3DQ/oOLFCBWi9f8QFe6E/3 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: DUNXeUGO06MIRp2Tw/BGWknJp44X6Gsva2WE3NqbY+5yaCheiXiFG7qdvqpPDAiITFLG6U4Ul6
 9K3Ka7HeY129/GjHneAaUDIxiiTk5KOU2saNuT+1UcFUC76kExLEoyuL96WUPrqUkVLlah2VqR
 MHskUxdq/7UdbwNVkjdb7pdWtXZXFhCvYbCiPIgfEax+ADjBAbdQ1dgEo1oSPDrzZGc+tt1YJP
 KWRH5XYC4OYba/I5Ka8T8cnpYO6aSMcSt3lpbt9TkuUc2cL78unhS/DzwlV2VYCzx6eh1MwWMo
 dyc=
X-SBRS: 2.7
X-MesageID: 24780374
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,308,1592884800"; d="scan'208";a="24780374"
Subject: Re: [PATCH] arch/x86/setup.c: Ignore early boot parameters like
 no-real-mode
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Trammell Hudson <hudson@trmm.net>
CC: Xen-devel <xen-devel@lists.xenproject.org>
References: <On7D3GbE8WWWH3f-1bSvUFQDxFcHP3yg6NdfvffgKqPRjQmJKsPBKsPgCCEEHbt9r2A3yxvf3gARonkKF9M_n1f3UfLEFpnZ29J2-Jc35ls=@trmm.net>
 <c7afab8c-291c-df0d-7269-084093975ea0@citrix.com>
 <iEyldvHWFXZA_7Xpgqaa_FADQCBGEu--Ab6oj2vDM3rLGKbCYcCWFl5q_GfZBHRN3IP77IQLLPzEFqupHvVwurwLMVQeBScoabJtROhiMbw=@trmm.net>
 <c86b1b58-9e52-a466-84b0-8d6bc230f607@citrix.com>
Message-ID: <e95185e4-e1b0-6bf1-6cfb-f3b184e5a65d@citrix.com>
Date: Thu, 13 Aug 2020 12:49:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c86b1b58-9e52-a466-84b0-8d6bc230f607@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 13/08/2020 00:35, Andrew Cooper wrote:
> On 12/08/2020 20:06, Trammell Hudson wrote:
>> On Wednesday, August 12, 2020 8:16 PM, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>> If you want, I can sort that out as a prereq patch, and rebase this one
>>> on top?
>> That sounds fine to me. They really are two separate patches.
> I think we're fine caveat wise.  I'll try and find some time tomorrow.

So the __UNIQUE_ID() plan doesn't work, as a consequence of the logic
inside ignore_param() to shuffle the string name into initdata.

As everything is in .initdata, it doesn't actually interact with LIVEPATCH.

I've committed this patch with an extra note to try and prevent
TEMP_NAME() being used in wider contexts.

~Andrew

