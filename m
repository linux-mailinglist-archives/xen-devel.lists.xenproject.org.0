Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16931BDF3B9
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 17:01:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143749.1477383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v92zn-00014u-EK; Wed, 15 Oct 2025 15:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143749.1477383; Wed, 15 Oct 2025 15:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v92zn-00012P-Bf; Wed, 15 Oct 2025 15:00:55 +0000
Received: by outflank-mailman (input) for mailman id 1143749;
 Wed, 15 Oct 2025 15:00:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T6Sp=4Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v92zl-00012I-K7
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 15:00:53 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdb74cd3-a9d7-11f0-9d15-b5c5bf9af7f9;
 Wed, 15 Oct 2025 17:00:51 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6364eb29e74so11731386a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Oct 2025 08:00:51 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a5c321341sm13601385a12.38.2025.10.15.08.00.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 08:00:49 -0700 (PDT)
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
X-Inumbo-ID: bdb74cd3-a9d7-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760540451; x=1761145251; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iDxNiN9C6zMQJiM64rzA4327Ac9CQAJJbJktWh1s8fw=;
        b=nN15FwPKPL4ysLpWWkW6+N8nHtkMRR4Fh5xPlCZUsHQEMWKn/NFpwTMm5WwPXwMw2O
         ZKT7K8e80wg6Dk6FTRpDkYMSrFDkM9xmu9tm7qKnsX1YQGN3HFl+KezB7sx1ponDhLgf
         btaRqOI4WgVckStSTPDFZoIaia/5La5nU2J9GQe168DAuFMsdK8Npmf0lyh8J5l7yvuT
         TzkIjOf8G50bs56u+VWEj88NZW0oyJ5fkD+nZe9Slvgwpc8rXm/8HMsDqMezRgRxPhb4
         qnw3Oc9qPynZQrHNNr1ug/UBaWnY28+L7SPB/1FqKiUqdrQfpXmxY4Pj/tKJOR0e3ch0
         HyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760540451; x=1761145251;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iDxNiN9C6zMQJiM64rzA4327Ac9CQAJJbJktWh1s8fw=;
        b=RqN6NFA2dGzwHSDGCGR4lypDiZjgr/GKIXBw7rOGPLGg6lXpzV8OE4BOQuF+uirt5c
         KDKnEIFubgoFokWBjriuFErecZ4bykNlNUAUDahrtsxYWl/FkqBxTXyoYod+Re69OjHI
         7iTqa1bKBnqTtxzGK9SrSwlYYNHL/pevwnE6cGWfSWz86yKyCbG5wGKC9DOYQ+0mBfLK
         2yeoArACwuPir36caC33NZH73Kt1rf3EHaNf+79xqo+I96ONFB3fg/DxdobmJiHy1qM9
         dF6QlxKuM8sMGXHzVE9/UeiUn3WaEME0CtV2arNcDi32K0qrMvnTcgXrOAGr1F66yLnO
         Krcg==
X-Forwarded-Encrypted: i=1; AJvYcCVXYnb2lOiPW89O4W3yqmVQUh79hGqCCmrWzLQekK4V1FN/vOM87ideutnvV4795T8QhHJZPKZboK4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFdd7TxRHiCfsZ71kq4eFoXOFWYeDBAEzkj3Hp21vyFYjoIsoG
	fajAqKzg4CGotiwjBXtzbyD+GhINhDMJUr0jC1y+1uVTlqX4rUUMeuaf
X-Gm-Gg: ASbGnct3kkjUfEs/wzKlq8OZ2z2PCex6dRBc7lFHTtii3ZlwXHxc7hpvxdq5krSatl8
	5Jc86Qz7PqhuGQBFmVkSx4sC9Y4eDoHZpTM9yNiQwvxQKACiupcBoLHsPiL4KQAZzzNqp2y/fKs
	ANsnihD0LTtdv1dxVBZqRcCntDpKXm0308DySrc16CXQq8BZ6YcmGigJdpwzrolXJtyYtqa8QNH
	wcsKtxnmvbKhxQS19q0Ek0tgxD9IHKvciuza827Gyvke3BW3xTMpXyuhGyUR8uTEMh6v9SEyJd2
	idBd22B3743Ch4yv39vcYZsGhsbNIMn/Gv+3XOPOfW3vi1KOlpajcupRx1cT9DqigBtR+5BROJE
	bzmgf26VdR8/ehgcZHPuanylGDH7SCX0VEuMOO2SggnSTwpYqBUIKSfM7KwXsT61hqrYg2twyqu
	cVz1NE1Zz3IuZWfrJZA+qP9Eqqj5HvRs/S9gvWQNts7aA=
X-Google-Smtp-Source: AGHT+IGebt7xs0k8eqxBzPl7gGCoWPMamUd8BMhTUgGiZO9pyAc9yw3dtibY7k3TUYfNajLnjsRe3w==
X-Received: by 2002:a05:6402:350c:b0:63b:f1aa:11d1 with SMTP id 4fb4d7f45d1cf-63bf1aa1307mr2216994a12.1.1760540449772;
        Wed, 15 Oct 2025 08:00:49 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------jv5wWLH0JcYCyDm3G1uK00M1"
Message-ID: <41791dda-9b95-41f5-a951-c6be3f15ae04@gmail.com>
Date: Wed, 15 Oct 2025 17:00:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 0/6] tools/{lib,}xl: Coverity falllout from the
 json-c switch
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20251015134043.72316-1-roger.pau@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20251015134043.72316-1-roger.pau@citrix.com>

This is a multi-part message in MIME format.
--------------jv5wWLH0JcYCyDm3G1uK00M1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/15/25 3:40 PM, Roger Pau Monne wrote:
> Hello,
>
> The following series contains fixes for Coverity reported issues after
> the switch from YAJL to json-c.  Those reports are from the internal
> XenServer Coverity instance, as the project one hasn't been switched to
> use json-c yet, last patch in the series switches thegithub triggered
> Coverity build to use json-c.
>
> All should be considered for 4.21.

Agree, we could consider that to have that in 4.21 as it fixes some minor
problems and isn't too intrusive:
  Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>
> Thanks, Roger.
>
> Roger Pau Monne (6):
>    tools/{lib,}xl: fix usage of error return from
>      json_tokener_parse_verbose()
>    tools/libxl: avoid freeing stack rubble in
>      libxl__json_object_to_json()
>    tools/xl: check return of json_object_object_add()
>    tools/xl: check return value of printf_info_one_json() in
>      list_domains_details()
>    tools/xl: fix possible uninitialized usage in printf_info()
>    github/coverity: switch to building with json-c instead of yajl
>
>   .github/workflows/coverity.yml |  2 +-
>   tools/libs/light/libxl_json.c  |  8 +++++---
>   tools/xl/xl_info.c             | 22 +++++++++++++++-------
>   3 files changed, 21 insertions(+), 11 deletions(-)
>
--------------jv5wWLH0JcYCyDm3G1uK00M1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/15/25 3:40 PM, Roger Pau Monne
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20251015134043.72316-1-roger.pau@citrix.com">
      <pre wrap="" class="moz-quote-pre">Hello,

The following series contains fixes for Coverity reported issues after
the switch from YAJL to json-c.  Those reports are from the internal
XenServer Coverity instance, as the project one hasn't been switched to
use json-c yet, last patch in the series switches thegithub triggered
Coverity build to use json-c.

All should be considered for 4.21.</pre>
    </blockquote>
    <pre>Agree, we could consider that to have that in 4.21 as it fixes some minor
problems and isn't too intrusive:
 Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:20251015134043.72316-1-roger.pau@citrix.com">
      <pre wrap="" class="moz-quote-pre">

Thanks, Roger.

Roger Pau Monne (6):
  tools/{lib,}xl: fix usage of error return from
    json_tokener_parse_verbose()
  tools/libxl: avoid freeing stack rubble in
    libxl__json_object_to_json()
  tools/xl: check return of json_object_object_add()
  tools/xl: check return value of printf_info_one_json() in
    list_domains_details()
  tools/xl: fix possible uninitialized usage in printf_info()
  github/coverity: switch to building with json-c instead of yajl

 .github/workflows/coverity.yml |  2 +-
 tools/libs/light/libxl_json.c  |  8 +++++---
 tools/xl/xl_info.c             | 22 +++++++++++++++-------
 3 files changed, 21 insertions(+), 11 deletions(-)

</pre>
    </blockquote>
  </body>
</html>

--------------jv5wWLH0JcYCyDm3G1uK00M1--

