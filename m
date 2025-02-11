Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E3CA30DBB
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 15:06:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885580.1295384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thqu0-0001lT-MK; Tue, 11 Feb 2025 14:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885580.1295384; Tue, 11 Feb 2025 14:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thqu0-0001je-Jh; Tue, 11 Feb 2025 14:06:16 +0000
Received: by outflank-mailman (input) for mailman id 885580;
 Tue, 11 Feb 2025 14:06:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jP5V=VC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1thqtz-0001jY-EH
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 14:06:15 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5851ca2a-e881-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 15:06:10 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ab744d5e567so1089136066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 06:06:10 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7878b18a9sm931203666b.167.2025.02.11.06.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 06:06:09 -0800 (PST)
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
X-Inumbo-ID: 5851ca2a-e881-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739282770; x=1739887570; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YFQx9stmaU3WBlIvnOVEQLak5f4yeuAXt1PhXK/fw2k=;
        b=vINyt72uYzMt8TJkgzARGmi1BdUADc0LNY3ky1p6Jrl467w6nmvB1uYpRvnzrhObLU
         RZq29xIl3voHYQamOdWLlHjgkGIZcDKXlhNWfKntjo96juWBZrL9wzW/oSW4otLn268X
         j1/oQitsFtYfW7KVqCWe3/Y815XHitIQ2VIF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739282770; x=1739887570;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YFQx9stmaU3WBlIvnOVEQLak5f4yeuAXt1PhXK/fw2k=;
        b=JSKmSkUiH64jD26QE7U5xBatITI54dd0duuuBkVb8QadaKnbk4FFhGlqozZqjf3sg4
         wEK3mGY6jjBKpdhat5kGN+9njgrFUg1N3yFCc5b0SApaUufloeGBpPneb1DuLpsL5PUi
         OJXvT8l+CvpSQ6QEvE5UC1Ft/36QWPnTq8JVfjL8diH8Ojk3vuNetRYLNzbYEgJ4EUnW
         dHqtFjEhOIyUJUdTE+Ns1vqOu1dh+Rhjy4Ex8sl9MutylWICEJFTeOCnp4SSMdkmSR0B
         IHybfssHP7VBOz5Gy/v70+Ykiq3mkBnPA1HewkUtbFBpLi4hU8NVXwNpxfDAhaXU29XI
         tuAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSSdWk6kFLjos1pm8jeSP8C0+0diOwX998wpWtrC0xUQCVnoNI8xEoabnXWvKpWNLYTAyuYYQ4KDo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw9Duw9PYsKXw4vVg+Kow7IIhzoeRGDx46g8+KbjRE2W4BiCM5g
	babYUNNpC+n5MtM+2wcuJQZyOXHJkIlhQC+Gv+JuouTr2tCpgIB3UVQs46PROJ8=
X-Gm-Gg: ASbGncv8I3PQCdZ19WNAxRljcaIov7zjrOtrrVJo9iVNvSD9VFSgxbFfHDy9LxYQlOU
	cmjPjVNZdbMg44BBDohPAivxAM6pkyeBJcS0NiZk7ft7NyBk2Rn9WCX5Vp0/1RnZZubRET6DINS
	aTqQeok18EBZm1DJv3fOXZyB3oFxhrp2SE/5AO1AaAfrUO742hqJ9jKLhY5ocfaBWVHTg2mrCz3
	AzvxgjyVUJVEHxV/PkTjMYrRJyUqBLYnntAwEgnwzUdUPmNuqY7WeLeoQTEUHsdvh7dy4SSzNr8
	M/jx7LA4tAbEPcLb1eE9QBk4kw==
X-Google-Smtp-Source: AGHT+IH8EaI9iviDGuZnBCkoTJCxp7hJL2kLYow7eISzAIlJTd2r9VUaWxLn6kNzH2nS8UadaEp5SA==
X-Received: by 2002:a17:906:f597:b0:ab6:eec7:e2e2 with SMTP id a640c23a62f3a-ab7db035f02mr327441466b.30.1739282769716;
        Tue, 11 Feb 2025 06:06:09 -0800 (PST)
Date: Tue, 11 Feb 2025 15:06:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Oleksandr Andrushchenko <andr2000@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Artem Mygaiev <Artem_Mygaiev@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: Coding Style Review and Automation
Message-ID: <Z6tZUKiqYARWuk8N@macbook.local>
References: <5a15f8e2-079c-405a-95ce-92585ac529cd@gmail.com>
 <Z6sR87FrKcOhgEqX@macbook.local>
 <4677686F-97C4-4D35-A113-0D8A1C0BC328@arm.com>
 <55c4d9e0-77b2-408b-9bb1-8efed95891c1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55c4d9e0-77b2-408b-9bb1-8efed95891c1@suse.com>

On Tue, Feb 11, 2025 at 11:19:23AM +0100, Jan Beulich wrote:
> On 11.02.2025 10:10, Luca Fancellu wrote:
> >>> 3) The size of the patch after applying clang-format is huge. Really. Something
> >>> like 9 MB. Even if everyone agrees that the approach is good and we can proceed
> >>> with it, it is highly unlikely anyone will be able to review it. Considering
> >>> that new patches are being added to the upstream during such a review, it may
> >>> also lead to new code style violations or require a new review of that huge
> >>> patch.
> >>
> >> I think this approach is difficult.  It would likely introduce a lot
> >> of noise when using `git blame` (I know, it's just one extra jump,
> >> but...), plus would likely break every patch that we currently have
> >> in-flight.
> > 
> > I think we already discussed this in the past and having some churn was accepted,
> > also about breaking existing patches, every change merged has the potential to do
> > that, this one is more likely but it’s the game I guess?
> 
> That's easy to say if you have just a few patches in flight, yet I'm worried
> about this when considering the hundreds of mine that are awaiting review.

There are also downstreams (including distros) with varying length of
patch queues on top of Xen.  Arguably they have to rebase the queue
every time they update, but a wide change in coding style will likely
be fairly disruptive to them.

Don't take this as a reason to reject clang-format.  As mentioned
elsewhere I think the format supported by clang-format would need to
be fairly similar to the current Xen one (up to the point that chunks
of code using the new and the old style could live together).  Then we
would enforce it only for newly added chunks of code initially IMO.

Thanks, Roger.

