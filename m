Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B93B2B39F64
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 15:51:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098963.1452896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urd1q-0004wy-CH; Thu, 28 Aug 2025 13:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098963.1452896; Thu, 28 Aug 2025 13:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urd1q-0004tq-8G; Thu, 28 Aug 2025 13:51:02 +0000
Received: by outflank-mailman (input) for mailman id 1098963;
 Thu, 28 Aug 2025 13:51:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q4L6=3I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1urd1o-0004tk-LU
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 13:51:00 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06b3687b-8416-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 15:50:58 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-afcb78ead12so153649566b.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 06:50:58 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe91744c3asm756270766b.91.2025.08.28.06.50.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 06:50:57 -0700 (PDT)
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
X-Inumbo-ID: 06b3687b-8416-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756389058; x=1756993858; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=owzOugVXmwrfQeOMKG+42O3kjCvc3VpLYb1xqovq5Z4=;
        b=iB/vLfOjUF4qJpOtZBqoHsMDlo9fhrJ2f+3mHJLBvSiiauMn5pdRPBbkfYvTPcJhvM
         +P06GR1MF67UlIxd3JocjLr/tNxkMlmMES4D918OC3/rEuKiH+Yz/7y9uqDsWed5/jz6
         pKRs2ye1J4Vpkqz+mcYiRCAKZDVn79GEZxERwk9c1TNmN4iUt1XB49G/CQ+JzRoM30bW
         MAGLSy1OIlRFEvtCdzWCTqsHsA5XQzvcp7DWDYhJHTRTdGxx6wtJiegvietdR2Q/4seP
         K/R+k/i5nnkP+zGiunjRumyX+E8RgVV/LwHBPeGSCrTvCcNpKKPtDz1UtaaHfLS+uQ6n
         FgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756389058; x=1756993858;
        h=in-reply-to:content-language:references:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=owzOugVXmwrfQeOMKG+42O3kjCvc3VpLYb1xqovq5Z4=;
        b=aAk63vktl+jytag3dqXlVjimIWMV1tZ5O3MsOCnZSWq3qGGGUOGvcSFKcRl6Lkarbi
         zYKxPxGOeFDjLa64UehWZx5y1/pkJjl3w52d9lij08xx4dj8btbj/qpekSOf+cEd79X2
         fNBR0pR/baYXU9TQR1jCFEkdT2VAIlIZksmrntuhNAs3Va49yDxK/oq4FWKrbT68xEL0
         5laG0J05XHb6sECejP3GQdBZ+VgjMxKB9XByIvzk4ybeQ225dd3zZ2UaNCfeiHi2qwTo
         XpL1Ql2qsN/6JGER/qd+fwhKsVlaCQ+p/sol00X+ymUftdyUoLobtN4Mg3c4GrxAKmEY
         AxgA==
X-Gm-Message-State: AOJu0Yyv63CWCJE79OAbOLXZlQmPxZQRXbjdqt96KUs6qNT09qfeLl1a
	xKq0wUvjwS+o+YKqPeACwOkxWM4r7zxrY1IcERHBynxXlT0gH2fzal1uqt5muQ==
X-Gm-Gg: ASbGncs06BaW+Nj2NVvXvl/+OsvbZnGFbLCm9u35hgBszdJ28awcCxdejrmqPo/349j
	ciNjbNKXzk9n3aLBw+T5NtzsZC7WuzONR9evIfw8ZfLCwXR5G8okQxVqEfZF52tAeM2rBa667U5
	123zLovJo5LTzDQyFC/sJ2CES5HgY3q3uIySPsx7MxwFYNlUlAQ7OvL0IVcAbocYw6nWZvaGUrR
	85icP4AatnvdKLQt4spdn38A4LYk0IQYEqJwNVON4Z3IcyDCv/T0+DxnXWhL8bkYLhbIy2IG7Vg
	1rsKSh1NLSG/J2J/E/Ni44PSJzYDnALjL1BgVVhQurLrIBzqPeUXl4teO6t1SVLfwn9PiJY+mAg
	hAi2/X1LaTr7w/rYlFfAFHaFQtG8zJjDPUXsaXpTHDMTobuys//YQvf0O5QrP7CQrurvWg5APe6
	KdJgcB9OyvYH38ONKs
X-Google-Smtp-Source: AGHT+IHa9BAqdTXTjlzmBe5Z8BI623r/z2VJ9BbFM3raGCXYSJYJj9UihVjokoDP/hrDCyXmPbCi+Q==
X-Received: by 2002:a17:907:7e9c:b0:af9:8c1f:b290 with SMTP id a640c23a62f3a-afe28f6a866mr1843387466b.29.1756389057602;
        Thu, 28 Aug 2025 06:50:57 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------lvBzz3KMKY0YXl6XLxXq5XHg"
Message-ID: <01e3f4e6-696f-47f8-884c-0f90bf19aada@gmail.com>
Date: Thu, 28 Aug 2025 15:50:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Reminder] Feature Freeze is Fri Aug 29, 2025
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Xen-devel <xen-devel@lists.xenproject.org>,
 Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
References: <07fc7122-d0ac-4dbe-800d-89086a07005b@gmail.com>
Content-Language: en-US
In-Reply-To: <07fc7122-d0ac-4dbe-800d-89086a07005b@gmail.com>

This is a multi-part message in MIME format.
--------------lvBzz3KMKY0YXl6XLxXq5XHg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Community,

Considering the number of requests in this mailing thread,
I think it makes sense to extend the Feature Freeze period
by at least one week, moving the deadline to September 5th.

I will send a separate e-mail with that information.

Thanks, everyone, for your responses.

~ Oleksii

On 8/25/25 5:50 PM, Oleksii Kurochko wrote:
> Hello community,
>
> I’d like to remind everyone that the Feature Freeze deadline is approaching,
> and we still have some outstanding requests from the community for patch series
> to be merged into 4.21:
>
> 1. Enable guest suspend/resume support on ARM via vPSCI [1]
> 2. Introduce SCI SCMI SMC multi-agent support [2]
> 3. Introduce eSPI support [3]
> 4. FRED work: [4], [5], possibly others (?)
> 5. Introduce CONFIG_DOMCTL [6]
> 6. xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE [7]
> 7. Some other patch series I missed.
>
> It looks like some of these patch series still require additional work,
> and I’m not sure there is enough time left before the end of this week.
>
> Could I kindly ask for an estimation of whether these tasks can be completed in time?
>
> [1]https://lore.kernel.org/xen-devel/87jz2vaq9h.fsf@epam.com/
> [2]https://lore.kernel.org/xen-devel/cover.1753184487.git.oleksii_moisieiev@epam.com/
> [3]https://lore.kernel.org/xen-devel/7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com/
>
> [4]https://lore.kernel.org/xen-devel/20250808202314.1045968-1-andrew.cooper3@citrix.com/
> [5]https://lore.kernel.org/xen-devel/20250815204117.3312742-1-andrew.cooper3@citrix.com/
>
> [6]https://lore.kernel.org/xen-devel/20250803094738.3625269-6-Penny.Zheng@amd.com/
> [7]https://lore.kernel.org/xen-devel/20250815102728.1340505-1-Penny.Zheng@amd.com/
>
> Thanks in advance.
>
> Best regards,
>    Oleksii
--------------lvBzz3KMKY0YXl6XLxXq5XHg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre data-start="48" data-end="66">Hello Community,</pre>
    <pre data-start="68" data-end="247">Considering the number of requests in this mailing thread,
I think it makes sense to extend the Feature Freeze period
by at least one week, moving the deadline to September 5th.</pre>
    <pre data-start="249" data-end="303">I will send a separate e-mail with that information.</pre>
    <pre data-start="305" data-end="344">Thanks, everyone, for your responses.</pre>
    <pre data-start="346" data-end="357">~ Oleksii</pre>
    <pre></pre>
    <div class="moz-cite-prefix">On 8/25/25 5:50 PM, Oleksii Kurochko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:07fc7122-d0ac-4dbe-800d-89086a07005b@gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <pre>Hello community,

I’d like to remind everyone that the Feature Freeze deadline is approaching,
and we still have some outstanding requests from the community for patch series
to be merged into 4.21:

1. Enable guest suspend/resume support on ARM via vPSCI [1]
2. Introduce SCI SCMI SMC multi-agent support [2]
3. Introduce eSPI support [3]
4. FRED work: [4], [5], possibly others (?)
5. Introduce CONFIG_DOMCTL [6]
6. xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE [7]
7. Some other patch series I missed.

It looks like some of these patch series still require additional work,
and I’m not sure there is enough time left before the end of this week.

Could I kindly ask for an estimation of whether these tasks can be completed in time?

[1] <a class="moz-txt-link-freetext"
      href="https://lore.kernel.org/xen-devel/87jz2vaq9h.fsf@epam.com/"
      moz-do-not-send="true">https://lore.kernel.org/xen-devel/87jz2vaq9h.fsf@epam.com/</a>
[2] <a class="moz-txt-link-freetext"
href="https://lore.kernel.org/xen-devel/cover.1753184487.git.oleksii_moisieiev@epam.com/"
      moz-do-not-send="true">https://lore.kernel.org/xen-devel/cover.1753184487.git.oleksii_moisieiev@epam.com/</a>
[3] <a class="moz-txt-link-freetext"
href="https://lore.kernel.org/xen-devel/7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com/"
      moz-do-not-send="true">https://lore.kernel.org/xen-devel/7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com/</a>

[4] <a class="moz-txt-link-freetext"
href="https://lore.kernel.org/xen-devel/20250808202314.1045968-1-andrew.cooper3@citrix.com/"
      moz-do-not-send="true">https://lore.kernel.org/xen-devel/20250808202314.1045968-1-andrew.cooper3@citrix.com/</a>
[5] <a class="moz-txt-link-freetext"
href="https://lore.kernel.org/xen-devel/20250815204117.3312742-1-andrew.cooper3@citrix.com/"
      moz-do-not-send="true">https://lore.kernel.org/xen-devel/20250815204117.3312742-1-andrew.cooper3@citrix.com/</a>

[6] <a class="moz-txt-link-freetext"
href="https://lore.kernel.org/xen-devel/20250803094738.3625269-6-Penny.Zheng@amd.com/"
      moz-do-not-send="true">https://lore.kernel.org/xen-devel/20250803094738.3625269-6-Penny.Zheng@amd.com/</a>
[7] <a class="moz-txt-link-freetext"
href="https://lore.kernel.org/xen-devel/20250815102728.1340505-1-Penny.Zheng@amd.com/"
      moz-do-not-send="true">https://lore.kernel.org/xen-devel/20250815102728.1340505-1-Penny.Zheng@amd.com/</a>

Thanks in advance.

Best regards,
  Oleksii
</pre>
    </blockquote>
  </body>
</html>

--------------lvBzz3KMKY0YXl6XLxXq5XHg--

