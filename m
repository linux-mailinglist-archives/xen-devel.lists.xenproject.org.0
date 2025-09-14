Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC4BB5669C
	for <lists+xen-devel@lfdr.de>; Sun, 14 Sep 2025 06:11:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1123711.1466543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxe5V-0005Vy-KL; Sun, 14 Sep 2025 04:11:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1123711.1466543; Sun, 14 Sep 2025 04:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxe5V-0005UB-Gb; Sun, 14 Sep 2025 04:11:41 +0000
Received: by outflank-mailman (input) for mailman id 1123711;
 Sun, 14 Sep 2025 04:11:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lLjW=3Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uxe5T-0005U5-UH
 for xen-devel@lists.xenproject.org; Sun, 14 Sep 2025 04:11:39 +0000
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [2607:f8b0:4864:20::1036])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e885823d-9120-11f0-9d13-b5c5bf9af7f9;
 Sun, 14 Sep 2025 06:11:38 +0200 (CEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-32e1288eb0cso476216a91.3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Sep 2025 21:11:38 -0700 (PDT)
Received: from ?IPV6:2601:646:9e00:b920::2bf4? ([2601:646:9e00:b920::2bf4])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7760793b65dsm9376593b3a.9.2025.09.13.21.11.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Sep 2025 21:11:36 -0700 (PDT)
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
X-Inumbo-ID: e885823d-9120-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757823097; x=1758427897; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sksv9cuJpSxQMGAkjPHpmVpw8OJEWIXA+fog+o/4DNE=;
        b=C3do8tBeLdIqkSocaLeYCtyMvRMEF++yvbckh3A6Xsw7CItBaGLgiqlpVKlFWP0KyS
         ZLBDV48IdgX0AFCSPMYVpTOtJI2ySgKiY+VaSmSlETa+w4em+/Tffqxr+/9CdUn3NWRH
         +2IqIVPoUej/uOQcUVRnUkC1WkwtmuO9jbbbE0qizBl7/32MiIoIbGR0yrlogEtpoVjM
         vWif4R3rfyosFvrW2bIYzy+Lcwg2YyNY+ImB+hIhW3pJVAaLM/IAizvJs4r4a+2MHPiR
         QwGLvJxtRQrttZDzxPoFc9OhR6NxrsKCy2Z+Ac+A8zaxMKppPb0QZ4KoSp1RLxTLIy4Q
         epgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757823097; x=1758427897;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sksv9cuJpSxQMGAkjPHpmVpw8OJEWIXA+fog+o/4DNE=;
        b=F4vROxWVxWrBkBUx+NvRwvkOYnP8aA4yA5XBo7Gg7ffKVLTjlzKFzp74HuH9KHjbzB
         9KaVVIaDc6yzkDZQRqI03BGLydxUzvHyITThLto7kdbf25eV28H7DQzWyxI1EO+769s0
         wgX8i1nGZ+4epnlPISPaRUoiQaR1/swQ+Eoah4LFbNmcrOAJC3GtuK3PJdWT6OxKLg5S
         HnkMtM20rpDKNCMF62sQHUjSIySEoat3SdgwA7gqh8bOwoMYqS6I/5JYTw8+ohmyiwDN
         GBCYrPCqH4XOksRIDRgwLBhVjSoG++8p+79B9AnqHd09I6I6FiOCCfj39bFRNSP2K41K
         8mFw==
X-Forwarded-Encrypted: i=1; AJvYcCVXHWcUTCnIZdP05IuldxxA0h9MiLL6eiVUgdTbV9EW1YjUgJZTl+lRTH6qiMZLDBBtzQbkpeBN17Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8ss4ZajKbnQ56Db8gbXyn+GnW9SDWr3fceFjZWQxZjM1M8bmL
	EN4XFurjva3cbFTp6Y4GezQpHydKurQgAqxwzhZzOOER9zOBGwVnG2ARFcMrXfZW
X-Gm-Gg: ASbGncsyDrLYI9AbZxLPcUkwMP+13pEFFT26gwNl7q5rDKkS+gRtX4dWYzljYccpJuX
	NyX3N6uG8CQj8uWxZyiHwoMAbRQsjt1hPm8R/aq9SDWp7dH1lKRI3DqLcSUN58M6jEeFd9ZowAB
	26tXtX8BoS6XvZf1e08cnNQCPhOhDGE8elqeRApA+bqX3iDvh+KPC5TYFLTOnVrgn7X86f2PLjz
	IQ+dNDnJN6uD0HbfW25j5R7Prr4MFZIRRIZeX8iRzZcJDC7yL2wLUGy9x11qzcB9mYKZn4dzk7r
	LzbowAVqr7oTjSSE4eEhtupgKaAY0CVA77MU9sThDaxPNsVb70GlBsmXQ/Psk0ntrdY+DqxfMJ8
	k7qH26F0+6GTZ1OSFh/3tG/tO8avCxbyNA39fhPnIAWjT60EYtWwaGzbjq9p/AvVN
X-Google-Smtp-Source: AGHT+IHjgh1wqqQn8YLgOVA3pN603Ez/HqF6uPzCVy8ssLqsgqRpavRpB0oc6IK4aE3X/+4XytPrCg==
X-Received: by 2002:a17:90b:1d47:b0:32e:2798:9064 with SMTP id 98e67ed59e1d1-32e27989209mr2668119a91.35.1757823096818;
        Sat, 13 Sep 2025 21:11:36 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------rz1mpetzxbwWGK7PgvjqWYzI"
Message-ID: <6b2c6641-38ac-4ed5-855b-e79a1deb4b9b@gmail.com>
Date: Sun, 14 Sep 2025 06:11:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] xen/arm: add generic SCI subsystem
To: Julien Grall <julien@xen.org>,
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <cover.1756995595.git.oleksii_moisieiev@epam.com>
 <3e237c5256054a88b1c099d85d8bd1a602bba230.1756995595.git.oleksii_moisieiev@epam.com>
 <c68f1d0e-8a0d-4d8e-a98e-7617c548337a@xen.org>
 <e1291003-0738-4c42-83ae-1da575a00f9c@epam.com>
 <1715e68b-fef3-4846-8db0-5cbd49878f27@xen.org>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1715e68b-fef3-4846-8db0-5cbd49878f27@xen.org>

This is a multi-part message in MIME format.
--------------rz1mpetzxbwWGK7PgvjqWYzI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/12/25 11:38 PM, Julien Grall wrote:
> (+ Release manager)
>
> On 10/09/2025 15:49, Oleksii Moisieiev wrote:
>> Hi Julien,
>>
>> Thank you for your observations. You're absolutely right about this.
>>
>> Currently, the sci_relinquish_resources call doesn't perform any 
>> operations
>> because the single-agent doesn't implement a callback.
>>
>> I'll move the sci implementation to be positioned above the tee
>> implementation
>> and prepare a patch for this change.
>
> Thanks! I think this change should go in Xen 4.21. Please tag it with 
> [for-4.21] or similar.
>
In one of previous replies we already agreed that it is fine to have this patch series in
4-21. Just to be sure:
  Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> CCing Oleksii Kurochko to keep track.
>
> Cheers,
>
--------------rz1mpetzxbwWGK7PgvjqWYzI
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
    <div class="moz-cite-prefix">On 9/12/25 11:38 PM, Julien Grall
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1715e68b-fef3-4846-8db0-5cbd49878f27@xen.org">(+ Release
      manager)
      <br>
      <br>
      On 10/09/2025 15:49, Oleksii Moisieiev wrote:
      <br>
      <blockquote type="cite">Hi Julien,
        <br>
        <br>
        Thank you for your observations. You're absolutely right about
        this.
        <br>
        <br>
        Currently, the sci_relinquish_resources call doesn't perform any
        operations
        <br>
        because the single-agent doesn't implement a callback.
        <br>
        <br>
        I'll move the sci implementation to be positioned above the tee
        <br>
        implementation
        <br>
        and prepare a patch for this change.
        <br>
      </blockquote>
      <br>
      Thanks! I think this change should go in Xen 4.21. Please tag it
      with [for-4.21] or similar.
      <br>
      <br>
    </blockquote>
    <pre>In one of previous replies we already agreed that it is fine to have this patch series in
4-21. Just to be sure:
 Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:1715e68b-fef3-4846-8db0-5cbd49878f27@xen.org">CCing
      Oleksii Kurochko to keep track.
      <br>
      <br>
      Cheers,
      <br>
      <br>
    </blockquote>
  </body>
</html>

--------------rz1mpetzxbwWGK7PgvjqWYzI--

