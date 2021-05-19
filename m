Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A424F388714
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 08:00:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129859.243535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljFFG-0008C4-Vp; Wed, 19 May 2021 05:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129859.243535; Wed, 19 May 2021 05:59:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljFFG-0008AD-Sb; Wed, 19 May 2021 05:59:50 +0000
Received: by outflank-mailman (input) for mailman id 129859;
 Wed, 19 May 2021 05:59:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ihdG=KO=gmail.com=technologyrss.mail@srs-us1.protection.inumbo.net>)
 id 1ljFFF-0008A7-Rw
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 05:59:49 +0000
Received: from mail-pl1-x62f.google.com (unknown [2607:f8b0:4864:20::62f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7db13265-c259-4b87-aa10-5ef375deefaa;
 Wed, 19 May 2021 05:59:48 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id n8so1173373plf.7
 for <xen-devel@lists.xenproject.org>; Tue, 18 May 2021 22:59:48 -0700 (PDT)
Received: from [10.66.100.3] ([144.48.119.14])
 by smtp.gmail.com with ESMTPSA id z25sm15239141pgu.89.2021.05.18.22.59.46
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 22:59:47 -0700 (PDT)
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
X-Inumbo-ID: 7db13265-c259-4b87-aa10-5ef375deefaa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language;
        bh=kiWS2QcDpg5SOw42EK6XFIhDfEh9lFxVSQUCtCUZLqo=;
        b=GJ59tyD6rnzfpvRJlZCQelswEdlVXib6R3AJvi1J7bJWjzDQAJFEM7zdtVWjd13zEg
         93YOs0ySVpZhrCi3qVgsMtZFEpMLa+jdTn2D9rDSGgy72G5WHnei697tvum/Yn4a2ICh
         BL/euVU/J29xX4//p6rttXGdx5PpWlco2V9dC0CZrczte7LxgRZSAbgZJZMUgqzEbbnB
         9rr6pWlcqPQVVn+G3Qy5Ecw4y7iD5d6F9dHBXFEA3lrRwsp+N2Kbp9jxHo/PiuskDBio
         5ev9+smhK4MRfRcLoI4Mu1++4khEhw1wdhtyZSjmcmk2HeXzbCJk7Nix3f8t1xKJXvJo
         w3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language;
        bh=kiWS2QcDpg5SOw42EK6XFIhDfEh9lFxVSQUCtCUZLqo=;
        b=e4On3y4tGcIlO2kHum5HuQxk7fF3QcR0qJpjM8MaayyvmbJam6n0rcyQB4ZLQx38QE
         Iq5+WidzD3EpJ7HyrDec4EiBvxv0ngChGU6P/YIZhiJTG5dGDqe5gykUGoqtdImoD1wE
         30bSzkFyuux+sjKoXEBtH5VsfPFGzpaxJTLJ33lbDBn9B3QoTD1tx1mJB8LahLrjM+m3
         QLvw7ObBLACEnitEwgJ537PVEEkWrLqRAr2Wx8C/aT70blvL+aQARJKypBHC9Ne6EQ7j
         Dv2pI9Zz/lYjEnAwtPPTZzAxpome2E4c9VNcQe2RszM/a3BgTnvSqVOZEYGpw3/CKox/
         XaKA==
X-Gm-Message-State: AOAM533Z0kuuI3gEdZOhFMPJa/IJYHara6gvNPK0UNU6yOJrd1ZGIn0G
	JhqTA+gaRZjXhk0IgFcofrnBO373TZk=
X-Google-Smtp-Source: ABdhPJw3BUdH3TgZG/l6mh5bbgPotDVTwy4WHlHVxgygSTzzld+1c5/g/6U1UwFVWDg8x7zEuSTjPg==
X-Received: by 2002:a17:902:d690:b029:f0:beca:59b9 with SMTP id v16-20020a170902d690b02900f0beca59b9mr8969311ply.71.1621403987890;
        Tue, 18 May 2021 22:59:47 -0700 (PDT)
To: xen-devel@lists.xenproject.org
From: Technologyrss Mail <technologyrss.mail@gmail.com>
Subject: Deploy XEN Project
Message-ID: <4468222a-ac0b-7544-351d-286231a6bc9c@gmail.com>
Date: Wed, 19 May 2021 11:59:44 +0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------1BD072F9CEE4686738D11295"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1BD072F9CEE4686738D11295
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

*Hi,*

I am new user for DEV XEN project on my Centos server. Please guide me 
how to install & deploy XEN project on centos 7?


---

*Thanks & Regards.*

Support Admin

Facebook <htps://facebook.com/technologyrss> | Twitter 
<https://twitter.com/technologyrss1> | Website <https://technologyrss.com>

116/1 West Malibagh, D. I. T Road

Dhaka-1217, Bangladesh

*Mob :* +088 01716915504

*Email :* support.admin@technologyrss.com

*Web :* www.technologyrss.com <https://technologyrss.com>


--------------1BD072F9CEE4686738D11295
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><b>Hi,</b></p>
    <p>I am new user for DEV XEN project on my Centos server. Please
      guide me how to install &amp; deploy XEN project on centos 7? <br>
    </p>
    <p><br>
    </p>
    <p>---<br>
    </p>
    <p><b style="font-size:12px">Thanks &amp; Regards.</b> </p>
    <p style="font-size:12px">Support Admin</p>
    <p style="font-size:12px"><a
        href="htps://facebook.com/technologyrss">Facebook</a> | <a
        href="https://twitter.com/technologyrss1">Twitter</a> | <a
        href="https://technologyrss.com">Website</a></p>
    <p style="font-size:12px">116/1 West Malibagh, D. I. T Road</p>
    <p style="font-size:12px">Dhaka-1217, Bangladesh</p>
    <p style="font-size:12px"><b>Mob :</b> +088 01716915504</p>
    <p style="font-size:12px"><b>Email :</b> <a
        class="moz-txt-link-abbreviated"
        href="mailto:support.admin@technologyrss.com">support.admin@technologyrss.com</a></p>
    <p style="font-size:12px"><b>Web :</b> <a
        href="https://technologyrss.com">www.technologyrss.com</a></p>
  </body>
</html>

--------------1BD072F9CEE4686738D11295--

