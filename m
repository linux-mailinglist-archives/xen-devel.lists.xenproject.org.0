Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A51FA105C9
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 12:45:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871266.1282303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXfLg-0000U3-Oa; Tue, 14 Jan 2025 11:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871266.1282303; Tue, 14 Jan 2025 11:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXfLg-0000SN-Le; Tue, 14 Jan 2025 11:44:44 +0000
Received: by outflank-mailman (input) for mailman id 871266;
 Tue, 14 Jan 2025 11:44:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcbX=UG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tXfLf-0000SF-At
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 11:44:43 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0f9a7d5-d26c-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 12:44:41 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-3003d7ca01cso49389341fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 03:44:41 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff0ad5c2sm17625801fa.16.2025.01.14.03.44.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 03:44:40 -0800 (PST)
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
X-Inumbo-ID: f0f9a7d5-d26c-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736855081; x=1737459881; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XaYozwTqETsYJe+znD0F5gJuDUetVDR68XOLvdpS2Y=;
        b=JHxFiUI7hT6tp3l0zXsmE0mJR1Uv1kJErsfdSQ7bu32IgZ3jYwoLp3hKrm0jc+3CPa
         axz1LDaRJvQHTQq9qYCtXYw+jAj+qO25cLAEQbBIV5S1FuVV/8LjRx03TxDXMHxVTM/t
         dhiI70MC6U574BWd1OvDvwebWikFtp8g+VdqCq7eQzab85Arj6BNYjY6vhfHIsbwYm8Q
         UnOQXj4OS5aLVwbJjq+Z52CWiOahmjwqCa4A9gIBMvgYHAUb8DNeY4bN4JZwbvaQ4mqU
         OqEHt9icaSKQneQ59z+oXAm0AVhRqpXSIrs2S++4QtX0sb/qqnLXx2RcuvIHHJaVy/ox
         kiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736855081; x=1737459881;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+XaYozwTqETsYJe+znD0F5gJuDUetVDR68XOLvdpS2Y=;
        b=GrOQSl+G1j59z205cT+hQ0JjQ4Op0S85g1RYUP0Xp67xN/cAUH5/8YAjHVLknMSQ1f
         bCbGbb9hQXLBeo+bt3cZt+TD7K0P+MxSNcYpGdJMPY2DiWY6tz6+DUzkXeCXlFYJo97o
         RkScPzN3H9ZrBweCwXHff7U47D7jgiJRrX73CLrnNais70ureNMV4iQWdMq9Nqgm1y1h
         u8bKnaqTQzfJoVxUuy8KlErcf7xGYeFVkdjM7Glqj1OfeXaNEWc49DScMbiXgOdXFaqA
         f/D/x5IFPb56RtKUBbDBRnSb6Tqn4VkZPLzDiW9o/dbkiH+3qBSE05PfDRk1KVxnlvNd
         MdeA==
X-Forwarded-Encrypted: i=1; AJvYcCVh8HU4TQ6A6GJ9YafsjN7BzKN2rTPQB1go8nZWurEt/gOBw6JC/gilJBKgYVnwNl/81Tw55g29s1c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOBqLbOaM3oKgWlqBmP/7wNUmPfX0fdpMQwCLIT56oj2gtorL+
	wetdUfY9vFOshME0T5uOXfL/CkYVWjF/wJVQHbN9iRM7kOcvtJR2
X-Gm-Gg: ASbGncsjCq/Tf4odgb7yjh1oT7cRG0jnvaGh5haJX4bpHtjkaDknm2QZodYlAYzoPhg
	N5n2GzjisP4w3hZ0VzJurGinYm6Ju+ZFWSg0rDCm4rEXxEWq9Y3GcKmWnPDL4CcFwMvgdpYCmCf
	oqF/66Y4YaZ8Ye5lttPSqHgUheSMeDe98OWkujJgYTcxdEX3yRd62jGKkJks9aEH4Zim68LO2yp
	wnKavc5IuNz0KLEd7DzSO6KovmOj1T/Nd6uBbNckq38NBkcorkSQ3JAY5XvID4DWHXFfQ==
X-Google-Smtp-Source: AGHT+IE3pamJWMiWovbwxdVKpRaABanA9UlGG+eT1TWdP0/jWI7KjAkNYqYLNsajKUIyD7PdmjvkaA==
X-Received: by 2002:a2e:b8c7:0:b0:2fb:58b1:3731 with SMTP id 38308e7fff4ca-305f452ff17mr76337251fa.6.1736855080619;
        Tue, 14 Jan 2025 03:44:40 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------swl03aAHTgQxmDA0OzwO8T1x"
Message-ID: <9288f0de-945f-4056-9934-16b2b1704fb1@gmail.com>
Date: Tue, 14 Jan 2025 12:44:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] x86/time: introduce command line option to select
 wallclock
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240913075907.34460-1-roger.pau@citrix.com>
 <20240913075907.34460-2-roger.pau@citrix.com> <Z4U6WxtmaqGkqOqe@mail-itl>
 <Z4VS88REbzn5uasy@macbook.local>
 <49a2404f-0c45-4397-9094-a4189131832f@gmail.com>
 <Z4ZKINmJXw5T2dsM@macbook.local>
 <78e09ccb-65b7-4022-b9fc-7874e34c1a99@gmail.com>
Content-Language: en-US
In-Reply-To: <78e09ccb-65b7-4022-b9fc-7874e34c1a99@gmail.com>

This is a multi-part message in MIME format.
--------------swl03aAHTgQxmDA0OzwO8T1x
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/14/25 12:40 PM, Oleksii Kurochko wrote:
>
>
> On 1/14/25 12:27 PM, Roger Pau Monné wrote:
>> On Tue, Jan 14, 2025 at 12:12:03PM +0100, Oleksii Kurochko wrote:
>>> On 1/13/25 6:52 PM, Roger Pau Monné wrote:
>>>> On Mon, Jan 13, 2025 at 05:07:55PM +0100, Marek Marczykowski-Górecki wrote:
>>>>> On Fri, Sep 13, 2024 at 09:59:06AM +0200, Roger Pau Monne wrote:
>>>>>> Allow setting the used wallclock from the command line.  When the option is set
>>>>>> to a value different than `auto` the probing is bypassed and the selected
>>>>>> implementation is used (as long as it's available).
>>>>>>
>>>>>> The `xen` and `efi` options require being booted as a Xen guest (with Xen guest
>>>>>> supported built-in) or from UEFI firmware respectively.
>>>>>>
>>>>>> Signed-off-by: Roger Pau Monné<roger.pau@citrix.com>
>>>>> Reviewed-by: Marek Marczykowski-Górecki<marmarek@invisiblethingslab.com>
>>>> Thanks for the review.
>>>>
>>>> Oleksii, can I get your opinion as Release Manager about whether this
>>>> (and the following patch) would be suitable for committing to staging
>>>> given the current release state?
>>>>
>>>> It's a workaround for broken EFI implementations that many downstreams
>>>> carry on their patch queue.
>>> Based on your commit message, I understand this as addressing a bug ( but not very critical
>>> as IIUC downstreams have the similar patch on their side ). Therefore, if it has been properly
>>> reviewed and tested, we should consider including it in the current release.
>> IIRC at least Qubes, XenServer and XCP-ng have a patch that achieves
>> the same behavior as proposed here.
>>
>>> IIUC, setting the wallclock to EFI should align with the behavior Xen had previously.
>>> It might be preferable to use that argument as the default for a while, allowing others to verify the "auto"
>>> value over time. After that, we could consider making "auto" the default.
>>> That said, I am not particularly strict about following this approach.
>> We cannot really set efi as the default, as it would break when
>> booting on legacy BIOS systems.
>>
>> We could take only patch 1 and leave patch 2 after Xen 4.20 has
>> branched, but at that point I would see little benefit in having just
>> patch 1.
> I don't see a lot of benefit of comitting only the one patch either.
>
>
>> I don't have a strong opinion, but downstreams have been complaining
>> about Xen behavior regarding the usage of EFI_GET_TIME, so it might be
>> good to not ship yet another release with such allegedly broken
>> behavior.
> Agree with that. As  I mentioned above I consider it as a bug and based on
> that several mentioned above downstreams have the similar patch I could consider
> that as tested approach so ..
>> Let me know what you think, as I would need a formal Release-Ack if
>> this is to be committed.
> ... R-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>.

Sorry for the noise.

I missed to add that it would also be nice to mention IMO ( that now we have wallclock parameter )
in CHANGELOG so downstreams will receive "notification" that Xen provides a workaround for the mentioned
issue in the patch series.

Thanks.

~ Oleksii

>
> Thanks.
> ~ Oleksii
>> Thanks, Roger.
>>
>>> ~ Oleksii
>>>
>>>
>>>> Thanks, Roger.
--------------swl03aAHTgQxmDA0OzwO8T1x
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
    <div class="moz-cite-prefix">On 1/14/25 12:40 PM, Oleksii Kurochko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:78e09ccb-65b7-4022-b9fc-7874e34c1a99@gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 1/14/25 12:27 PM, Roger Pau Monné
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:Z4ZKINmJXw5T2dsM@macbook.local">
        <pre wrap="" class="moz-quote-pre">On Tue, Jan 14, 2025 at 12:12:03PM +0100, Oleksii Kurochko wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 1/13/25 6:52 PM, Roger Pau Monné wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On Mon, Jan 13, 2025 at 05:07:55PM +0100, Marek Marczykowski-Górecki wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On Fri, Sep 13, 2024 at 09:59:06AM +0200, Roger Pau Monne wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">Allow setting the used wallclock from the command line.  When the option is set
to a value different than `auto` the probing is bypassed and the selected
implementation is used (as long as it's available).

The `xen` and `efi` options require being booted as a Xen guest (with Xen guest
supported built-in) or from UEFI firmware respectively.

Signed-off-by: Roger Pau Monné<a class="moz-txt-link-rfc2396E"
                href="mailto:roger.pau@citrix.com"
                moz-do-not-send="true">&lt;roger.pau@citrix.com&gt;</a>
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Reviewed-by: Marek Marczykowski-Górecki<a
              class="moz-txt-link-rfc2396E"
              href="mailto:marmarek@invisiblethingslab.com"
              moz-do-not-send="true">&lt;marmarek@invisiblethingslab.com&gt;</a>
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Thanks for the review.

Oleksii, can I get your opinion as Release Manager about whether this
(and the following patch) would be suitable for committing to staging
given the current release state?

It's a workaround for broken EFI implementations that many downstreams
carry on their patch queue.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Based on your commit message, I understand this as addressing a bug ( but not very critical
as IIUC downstreams have the similar patch on their side ). Therefore, if it has been properly
reviewed and tested, we should consider including it in the current release.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">IIRC at least Qubes, XenServer and XCP-ng have a patch that achieves
the same behavior as proposed here.

</pre>
      </blockquote>
      <blockquote type="cite" cite="mid:Z4ZKINmJXw5T2dsM@macbook.local">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">IIUC, setting the wallclock to EFI should align with the behavior Xen had previously.
It might be preferable to use that argument as the default for a while, allowing others to verify the "auto"
value over time. After that, we could consider making "auto" the default.
That said, I am not particularly strict about following this approach.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">We cannot really set efi as the default, as it would break when
booting on legacy BIOS systems.

We could take only patch 1 and leave patch 2 after Xen 4.20 has
branched, but at that point I would see little benefit in having just
patch 1.</pre>
      </blockquote>
      <pre>I don't see a lot of benefit of comitting only the one patch either.</pre>
      <p><br>
      </p>
      <blockquote type="cite" cite="mid:Z4ZKINmJXw5T2dsM@macbook.local">
        <pre wrap="" class="moz-quote-pre">I don't have a strong opinion, but downstreams have been complaining
about Xen behavior regarding the usage of EFI_GET_TIME, so it might be
good to not ship yet another release with such allegedly broken
behavior.</pre>
      </blockquote>
      <pre>Agree with that. As  I mentioned above I consider it as a bug and based on
that several mentioned above downstreams have the similar patch I could consider
that as tested approach so ..
</pre>
      <blockquote type="cite" cite="mid:Z4ZKINmJXw5T2dsM@macbook.local">
        <pre wrap="" class="moz-quote-pre">Let me know what you think, as I would need a formal Release-Ack if
this is to be committed.</pre>
      </blockquote>
      <pre>... R-Acked-by: Oleksii Kurochko <a
      class="moz-txt-link-rfc2396E"
      href="mailto:oleksii.kurochko@gmail.com" moz-do-not-send="true">&lt;oleksii.kurochko@gmail.com&gt;</a>.</pre>
    </blockquote>
    <pre>Sorry for the noise. </pre>
    <pre>
</pre>
    <pre>I missed to add that it would also be nice to mention IMO ( that now we have wallclock parameter )
in CHANGELOG so downstreams will receive "notification" that Xen provides a workaround for the mentioned
issue in the patch series.
</pre>
    <pre>Thanks.
</pre>
    <pre>~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:78e09ccb-65b7-4022-b9fc-7874e34c1a99@gmail.com">
      <pre>

</pre>
      <pre>Thanks.
</pre>
      <pre>~ Oleksii
</pre>
      <blockquote type="cite" cite="mid:Z4ZKINmJXw5T2dsM@macbook.local">
        <pre wrap="" class="moz-quote-pre">Thanks, Roger.

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">~ Oleksii


</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Thanks, Roger.
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------swl03aAHTgQxmDA0OzwO8T1x--

