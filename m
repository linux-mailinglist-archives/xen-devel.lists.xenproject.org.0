Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4632530B946
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 09:12:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80392.147072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6qn7-0007fH-LL; Tue, 02 Feb 2021 08:12:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80392.147072; Tue, 02 Feb 2021 08:12:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6qn7-0007es-I9; Tue, 02 Feb 2021 08:12:05 +0000
Received: by outflank-mailman (input) for mailman id 80392;
 Tue, 02 Feb 2021 08:12:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IB5w=HE=unikie.com=jukka.kaartinen@srs-us1.protection.inumbo.net>)
 id 1l6qn6-0007en-0X
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 08:12:04 +0000
Received: from mail-lf1-x12f.google.com (unknown [2a00:1450:4864:20::12f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ae982b5-e2d2-40f2-8c3c-abf95db9ca2c;
 Tue, 02 Feb 2021 08:12:02 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id e15so6489830lft.13
 for <xen-devel@lists.xenproject.org>; Tue, 02 Feb 2021 00:12:02 -0800 (PST)
Received: from [192.168.1.76] (91-153-193-91.elisa-laajakaista.fi.
 [91.153.193.91])
 by smtp.gmail.com with ESMTPSA id i2sm4236978ljn.39.2021.02.02.00.12.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 00:12:00 -0800 (PST)
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
X-Inumbo-ID: 0ae982b5-e2d2-40f2-8c3c-abf95db9ca2c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mBeMdGCzCotqagX+j+uVvuRd6wPgDYEDThhCzjwhkKk=;
        b=zVkG3XPssK5AwfuM4qaZRznpmwf9bN7Ncsd8o8+OZ2sCEhSraA02l2u9/yF48Y7KfB
         53Mzkgxz6pZmQ9WSGI8L8shP1bMIrvlNy/VHOROE4gBPk3ynVWITWwpupSos6p2nfDAu
         IE5YJtR3tKUporJx5CWcIf/LpmMPpaGveEf+roedMEAgdraPejuNQeRnhnKMOoYvPQfT
         Rf4NA1yEzfyDmmYBzTkwRQqoAKAH64kHBBlfWf2HR7KMj5my1geLgvufWlsVncmp8m4t
         K1T/bGz5KHWvnV44YA6EsO5lAL2R+GfJqfqYNFYqqz8IyTN87GKJuoPt2R+UDY6S4rDv
         MgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mBeMdGCzCotqagX+j+uVvuRd6wPgDYEDThhCzjwhkKk=;
        b=p6gATpfto6RpZMLtZi6wx2WZ61rHY4DZ3ngIALfh9GbFPhtMZLU3WPc/0SYrHc3Df7
         lGZjmLJeDOLWNVX58M5m3SNpTQTAl/vRs3PsM0JfOLtE99hYIJC1pD36B85uCSMgwme7
         d8dFwoopSafPF9LcRQAbNYR2KxGmrcDEG6RJvxks8lvvcwNmuZgZpwdPK6HHW2yTUaGc
         uRmm4WTwbjCv9xW8PeWlYP6Ay3G3R3jUzJXJK0sEoSu/jfWU6VZqGg+KOzHHJXMaWAw6
         ht3rXK/ELulg3dWK/RU8fk249ta+tpIQxiEmWtPPCAUnaMF2znB04KIYAXXEwaHr9leO
         Zm8A==
X-Gm-Message-State: AOAM532j0VcH0411LsBcoQSSRTh3Xnby7nk02FlwTfyNOHToYvpor9yQ
	sdHgF5VqA5l5naFcrne/2KnxsQ==
X-Google-Smtp-Source: ABdhPJyyjJgzZxu+y0g66+uj+Jn1Ixix1LE7vHy8gVURNnNn70/dxYOIg7d/0E1x8Swwya18iDiyVA==
X-Received: by 2002:a19:54d:: with SMTP id 74mr10585440lff.258.1612253521340;
        Tue, 02 Feb 2021 00:12:01 -0800 (PST)
Subject: Re: Question about xen and Rasp 4B
To: Roman Shaposhnik <roman@zededa.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <CAFnJQOouOUox_kBB66sfSuriUiUSvmhSjPxucJjgrB9DdLOwkg@mail.gmail.com>
 <alpine.DEB.2.21.2101221449480.14612@sstabellini-ThinkPad-T480s>
 <CAFnJQOqoqj6mWwR61ZsZj1JxRrdisFtH_87YXCeW619GM+L21Q@mail.gmail.com>
 <alpine.DEB.2.21.2101251646470.20638@sstabellini-ThinkPad-T480s>
 <CAFnJQOpuehAWde5Ta4ud9CGufwZ-K+=60epzSdKc_DnS75O2iA@mail.gmail.com>
 <alpine.DEB.2.21.2101261149210.2568@sstabellini-ThinkPad-T480s>
 <CAFnJQOpgRM-3_aZsnv36w+aQV=gMcBA18ZEw_-man7zmYb4O4Q@mail.gmail.com>
 <5a33e663-4a6d-6247-769a-8f14db4810f2@xen.org>
 <b9247831-335a-f791-1664-abed6b400a42@unikie.com>
 <CAMmSBy-54qtu_oVVT=KB8GeKP0SW0uK+4wQ_LooHE0y_MZKJQg@mail.gmail.com>
From: Jukka Kaartinen <jukka.kaartinen@unikie.com>
Message-ID: <3ec2b0cb-3685-384e-94df-28eaf8b57c42@unikie.com>
Date: Tue, 2 Feb 2021 10:12:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy-54qtu_oVVT=KB8GeKP0SW0uK+4wQ_LooHE0y_MZKJQg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Roman,

>>>
>> Good catch.
>> GPU works now and I can start X! Thanks! I was also able to create domU
>> that runs Raspian OS.
> 
> This is very interesting that you were able to achieve that - congrats!
> 
> Now, sorry to be a bit dense -- but since this thread went into all
> sorts of interesting
> directions all at once -- I just have a very particular question: what is exact
> combination of versions of Xen, Linux kernel and a set of patches that went
> on top that allowed you to do that? I'd love to obviously see it
> productized in Xen
> upstream, but for now -- I'd love to make available to Project EVE/Xen community
> since there seems to be a few folks interested in EVE/Xen combo being able to
> do that.

I have tried Xen Release 4.14.0, 4.14.1 and master (from week 4, 2021).

Kernel rpi-5.9.y and rpi-5.10.y branches from 
https://github.com/raspberrypi/linux

and

U-boot (master).

For the GPU to work it was enough to disable swiotlb from the kernel(s) 
as suggested in this thread.

If you use Xen master then you need to revert the 
25849c8b16f2a5b7fcd0a823e80a5f1b590291f9. Apparently v3d uses same 
resources and will not start.

I was able to get most of the combinations to work without any big efforts.
In case you use USB SSD U-boot needs a fix if you use 5.9 kernel.
The 5.10 works with the lates Xen master but then you need one small 
workaround to the xen since there is address that Xen cannot map. Some 
usb address cannot be found (address was 0 if recall correctly). I just 
by passed the error:

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index e824ba34b0..3e8a175f2e 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1409,7 +1409,7 @@ static int __init handle_device(struct domain *d, 
struct dt_device_node *dev,
          {
              printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
                     i, dt_node_full_name(dev));
-            return res;
+            continue; //return res;
          }

          res = map_range_to_domain(dev, addr, size, &mr_data);


