Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1877EB1DB8E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 18:21:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073301.1436205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk3MY-0000Tv-1k; Thu, 07 Aug 2025 16:21:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073301.1436205; Thu, 07 Aug 2025 16:21:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk3MX-0000RN-VI; Thu, 07 Aug 2025 16:21:05 +0000
Received: by outflank-mailman (input) for mailman id 1073301;
 Thu, 07 Aug 2025 16:21:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oMMd=2T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uk3MW-0000P0-JQ
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 16:21:04 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83315e01-73aa-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 18:21:03 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ae6f8d3bcd4so232740866b.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 09:21:03 -0700 (PDT)
Received: from [192.168.1.17] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a076409sm1336478166b.12.2025.08.07.09.20.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 09:21:01 -0700 (PDT)
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
X-Inumbo-ID: 83315e01-73aa-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754583663; x=1755188463; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXpXALJthCDztrIM1HZ6qPaFkCMLZCF9ZUT9163fWQc=;
        b=X0UK0UsAMBZS5IdPH9xUajhV32qyu/EuIIDqbbY390WVFUmB62YbqL6PL3LHIPdl+n
         Ljta3hiNz3AXRq0ID+HtYhpF0CzxG2BwM1oORvH/AZ7RC7BHcx8qCr1ZyJMsR2OmE2+O
         MUFowxQWq77qVtJ8czudrSNd2ID6GBvaSvfEUSlU/WxJkr4YG2tORzSLtCI4e/cZsrAt
         h7/K5e90LhmzTHAtJodsxsmcCHLFHqnb7K/XPW56Z5Q3mth//l+t+dmMqWAsbiOpxsuS
         3OPNjKvKgHD3gOEaW7nRkvTn/iXZRnT2LfxU8W0pBrE67z3QN4YqqIbPCYse8rUDNL8v
         JMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754583663; x=1755188463;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yXpXALJthCDztrIM1HZ6qPaFkCMLZCF9ZUT9163fWQc=;
        b=pr7diUP12xaqCtujvSrXnNfE6HosdqFsWTj3fuyrNad4lLSM8ag9ODkazplz4pS5c7
         pUKrAwy561TPOAEfrOUbDy5moiBFd/ZzMLC9y1m+tR76gACitP4oaKW9LgirH5+6pO1/
         eX5PxLcgdvWOZfTdjayfq5BsK5oeSmsnBcp/wzdAL4i5MdkUnz45FbzYDEfjDZ3VX7TZ
         1HPRZ4Ca93p++g8zJXCReg+WvOs4HMtqZIEs8iF2ewE9m18S60AYpkVEnYU9lKj9mz1l
         652gRZ/Ef39dKHyWv1jz3n0RUtjDNjCjxGMuA731Rp/WZRaSAwOUFuTGTT2HM6wpdQmQ
         t2Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUxxMfaKHU5AZaR3bE/zSwqJGHQOp4ezRqYnHit7FRhl05oLdbRxgBIMfJyJPD08pUgZn4AYRZ0F1g=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5xolgFRJ+rwcC1+L95wwErfnFM8aW3B365uPEfFFJIRwOJuco
	/duRP1eaxqnki5AYzb44XGdbkICdnbDgfHtqW3GhyexgyOuFkJivQ4QC
X-Gm-Gg: ASbGncv4rM4bpYkCiX4FJWYBrgbqbsk/BJ14Z/P9PByCYPlfHWiTYRerguufZiu44PP
	qMElcV74NIJfEm7NGSGUbdNLB58vvqRE4ycTq8HW4y8KsIaOhts6AsKFBgrcL7/fxJIbAZPUsxU
	kmCNdjdsQhVZOs4t4gaaXFgTboPi3rDUT/ctK7GOqjL8UJcbQncO3NhhYYvu+2xAH/csKAF6Q4w
	hB6o6ZB592zGxzJuaBFp4uTQXDBzLghK5YCrS3TSefMeBWq43wGeX0lxeCpfBeQGSkWu8Vg2sF+
	EP+U73v5mlNUlrhppq4ER4T+D5SCAx/72CaOdUOY9+rP2p0VVzSM1fqf+oQvMu7wVnmfrzmvdP4
	ZEOc+eLV/BJDVplRRJFRrf90L8mjiwYGncZX/qeslQiDY1I8jW3OklAcbE1vF2pLXe+wjI6M9fT
	vvBZLLM3c=
X-Google-Smtp-Source: AGHT+IErTAAJRpKGM3EAgdyPLEqWgtWj1uR/OhrGbW4M8r5Q7TITK6VbtIjGRAUja8HVJrzFFz1LOA==
X-Received: by 2002:a17:907:2d9e:b0:ae0:df46:abd1 with SMTP id a640c23a62f3a-af9c1e07ce6mr57683466b.45.1754583662317;
        Thu, 07 Aug 2025 09:21:02 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------GKNNIPSOQSz7Xh0KKKHrbF0A"
Message-ID: <a664643e-bf54-4518-83f9-497d2b9351f9@gmail.com>
Date: Thu, 7 Aug 2025 18:20:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.21 Development Update [June-July]
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,
 "committers@xenproject.org" <committers@xenproject.org>
Cc: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>, Juergen Gross <jgross@suse.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Luca Fancellu <luca.fancellu@arm.com>, "Jason Andryuk,"
 <jason.andryuk@amd.com>, Sergii Dmytruk <sergii.dmytruk@3mdeb.com>,
 "Penny Zheng," <Penny.Zheng@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki=2C?=
 <marmarek@invisiblethingslab.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, dmkhn@proton.me,
 Mykola Kvach <xakep.amatop@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Grygorii Strashko <gragst.linux@gmail.com>,
 Alejandro Vallejo <agarciav@amd.com>,
 Community Manager <community.manager@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <ae2c2e35-72df-40ed-bffe-391f3c11b826@gmail.com>
 <242a93cf-20f7-4fcd-8eef-6945af5d864c@suse.com>
 <03a1d0b8-facd-4c02-97c6-45fa694da0b6@gmail.com>
 <f07b7bf9-8e9a-49b6-824e-0c3b346bebd2@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f07b7bf9-8e9a-49b6-824e-0c3b346bebd2@suse.com>

This is a multi-part message in MIME format.
--------------GKNNIPSOQSz7Xh0KKKHrbF0A
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/6/25 10:12 AM, Jan Beulich wrote:
> On 06.08.2025 09:45, Oleksii Kurochko wrote:
>> On 8/6/25 8:05 AM, Jan Beulich wrote:
>>> Overall: There are very many items on this list, and it seems entirely clear to
>>> me that not all of them will make it. I think it would be quite helpful to strip
>>> down the set for 4.21 to some realistic subset. Maybe something to discuss on
>>> the community call later today?
>> Good point, lets discuss that tomorrow during the community call.
> Oh, right, it's only Wednesday today.

I had the Xen Community Call marked at 6 PM in my calendar, so I missed it as
it actually took place at 15:00... I'm not sure if a recording is available
somewhere, but based on the notes:
     Call for major work items for 4.21 or 4.22
         Please make yourself known if you are intending to work on major items
         PDX compression.
         FRED, AVX10, APX, and AMX support (x86)
         Host UEFI Secure Boot
         FF-A 1.2 Support (Arm)

I completely agree with the first point — it would be great to receive feedback
from the authors of major patch series, similar to how the team at EPAM does.

As for the other items, I assume this is a list of major work items that are
likely to slip to 4.22, correct? From the looks of it, PDX compression and
FRED-related work might still make it into 4.21.

I also wanted to ask this during the call, but since I missed it,
I’ll ask here instead:
What should be the criteria for continuing to track a patch series?
It seems that the best approach would be to rely on feedback from the series'
author. However, obtaining that feedback can be challenging. So perhaps the
only practical solution is to keep tracking major items throughout the current
release cycle and drop them at the start of the next cycle if no activity has
taken place.

P.S.: Andrew, could you please provide a list for FRED connected patch series,
I am tracking some of them, but wanted to be sure that I'm tracking all of them.
Thanks in advance.

~ Oleksii

--------------GKNNIPSOQSz7Xh0KKKHrbF0A
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/6/25 10:12 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f07b7bf9-8e9a-49b6-824e-0c3b346bebd2@suse.com">
      <pre wrap="" class="moz-quote-pre">On 06.08.2025 09:45, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 8/6/25 8:05 AM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Overall: There are very many items on this list, and it seems entirely clear to
me that not all of them will make it. I think it would be quite helpful to strip
down the set for 4.21 to some realistic subset. Maybe something to discuss on
the community call later today?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Good point, lets discuss that tomorrow during the community call.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Oh, right, it's only Wednesday today.</pre>
    </blockquote>
    <pre>I had the Xen Community Call marked at 6 PM in my calendar, so I missed it as
it actually took place at 15:00... I'm not sure if a recording is available
somewhere, but based on the notes:
    Call for major work items for 4.21 or 4.22
        Please make yourself known if you are intending to work on major items
        PDX compression.
        FRED, AVX10, APX, and AMX support (x86)
        Host UEFI Secure Boot
        FF-A 1.2 Support (Arm)

I completely agree with the first point — it would be great to receive feedback
from the authors of major patch series, similar to how the team at EPAM does.

As for the other items, I assume this is a list of major work items that are
likely to slip to 4.22, correct? From the looks of it, PDX compression and
FRED-related work might still make it into 4.21.

I also wanted to ask this during the call, but since I missed it,
I’ll ask here instead:
What should be the criteria for continuing to track a patch series?
It seems that the best approach would be to rely on feedback from the series'
author. However, obtaining that feedback can be challenging. So perhaps the
only practical solution is to keep tracking major items throughout the current
release cycle and drop them at the start of the next cycle if no activity has
taken place.

P.S.: Andrew, could you please provide a list for FRED connected patch series,
I am tracking some of them, but wanted to be sure that I'm tracking all of them.
Thanks in advance.

~ Oleksii</pre>
  </body>
</html>

--------------GKNNIPSOQSz7Xh0KKKHrbF0A--

