Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5A77EB372
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 16:23:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632806.987258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2vGI-0000qc-FG; Tue, 14 Nov 2023 15:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632806.987258; Tue, 14 Nov 2023 15:23:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2vGI-0000p0-CU; Tue, 14 Nov 2023 15:23:34 +0000
Received: by outflank-mailman (input) for mailman id 632806;
 Tue, 14 Nov 2023 15:23:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vqel=G3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r2vGG-0000oB-OA
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 15:23:32 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c458bedc-8301-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 16:23:30 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c83ffcdbe3so34754711fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 07:23:30 -0800 (PST)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 8-20020a05600c22c800b0040303a9965asm17365332wmg.40.2023.11.14.07.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 07:23:30 -0800 (PST)
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
X-Inumbo-ID: c458bedc-8301-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699975410; x=1700580210; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BgH2tbSj8sbMNRKA4UI9KZ0X7Pr5mYyMKji28bWbBlI=;
        b=SWMjfbiDu5GjjOhSctl7eWMbiqMsvLj1EeJ9ENh0dVZ3xJ0fl7OZUF9SUQxK2qKBeY
         ELrZWaJDUx8NUT2vqKWUYeLOjd5srBRsj1tG2Ng6yb1g7G1aCugfVk3fHgh2GvmNeS+v
         UQaTWoek44aIMlsRf8PBjcpNOmLhHUvdzIFio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699975410; x=1700580210;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BgH2tbSj8sbMNRKA4UI9KZ0X7Pr5mYyMKji28bWbBlI=;
        b=exSy/kQ9bGMEn2AlyfyyeIy9Ag0P5e8TLd9XitcSkzhQyt9qa4RxKu6a61CF5JpEl9
         62WXpszb5JTT9kYIRvWFBaJBmCbMne8ik95kTSrmxEcoc47GgxdQs/x91AUT5ZzOn2bw
         F58oXgYN1DWpK1XXp0ykKylcT21foaGjCNMCUaQlEV49EHbm+sH055EZmqxVo32g5djQ
         MmKUGhxydcAS7ryzGywKq4jKNZ0PViN/qxL43XxYxXgfWwvHEwPZE8GDz+zLWVxLF++I
         V70K0zISS9LqbD931Dtc2GuqkZpjnTh7Ki6/bsrK0LITvuFqP5RFlkMIHpca1GIgfC/1
         /jig==
X-Gm-Message-State: AOJu0YzMip2RA2r5mz/B9dEEqOoZ/QS8cAHtHjcFDLU+tF1+arm+JP+S
	sX5Zv+dwAersnUO5V7TDV965kQ==
X-Google-Smtp-Source: AGHT+IFIPuthyGIXGprgIblLGsjrV9Oj4CsViDKksbNIuPSo0B77C1Y8UN1Jl1Um1WZpxN3fDBkm6w==
X-Received: by 2002:a2e:b74b:0:b0:2c5:12ae:adb3 with SMTP id k11-20020a2eb74b000000b002c512aeadb3mr1845576ljo.44.1699975410372;
        Tue, 14 Nov 2023 07:23:30 -0800 (PST)
Message-ID: <655390f2.050a0220.ff9eb.207c@mx.google.com>
X-Google-Original-Message-ID: <ZVOQ8H1JJNFADK42@EMEAENGAAD19049.>
Date: Tue, 14 Nov 2023 15:23:28 +0000
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <Michal.Orzel@amd.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Clang-format configuration discussion - pt 1
References: <174FCBBC-3C2F-47E9-936A-F1399DD9AFFB@arm.com>
 <930d7aa7-7573-97d2-e146-ebe68214c0aa@suse.com>
 <7235E3F4-8387-49D7-A3B6-0EA93CAE408B@arm.com>
 <30a94519-c622-6017-2cbf-35690114d49e@suse.com>
 <31A47242-54F9-42D4-B804-6D0A0392650C@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31A47242-54F9-42D4-B804-6D0A0392650C@arm.com>

Hi,

On Tue, Nov 14, 2023 at 02:59:35PM +0000, Luca Fancellu wrote:
> 
> 
> > On 13 Nov 2023, at 16:27, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > On 13.11.2023 16:20, Luca Fancellu wrote:
> >>> On 13 Nov 2023, at 11:31, Jan Beulich <jbeulich@suse.com> wrote:
> >>> On 08.11.2023 10:53, Luca Fancellu wrote:
> >>> --------------------------------------------------------------------------------------------------------------------------------------------------------------
> >>>> 
> >>>> Standard: C++03
> >>>> 
> >>>> ---
> >>>> From the documentation: Parse and format C++ constructs compatible with this standard.
> >>> 
> >>> Since I continue to be puzzled - iirc you said this is because of lack
> >>> of availability of "C99" as a value here. What's entirely unclear to
> >>> me is: How does this matter to a tool checking coding style (which is
> >>> largely about formatting, not any lexical or syntactical aspects)?
> >>> 
> >>>> This value is used also in Linux.
> >>> 
> >>> Considering how different the two styles are, I don't think this is
> >>> overly relevant.
> >> 
> >> Ok, maybe I understand your point, you are looking for a reason to declare this configurable instead
> >> of not specifying it at all?
> > 
> > Not really, no. Here I was merely saying that with the styles being
> > sufficiently different, what Linux uses is probably not very significant
> > for our own decision.
> > 
> >> If it’s that, from what I understand clang-format will use the default value if we don’t specify anything
> >> for this one, so it will take ‘Latest’. I think we should put a value for this one to fix it and don’t have
> >> surprises if that behaviour changes and seeing that also in Linux that value is fixed increased my
> >> confidence.
> >> 
> >> However, if you feel that we should not specify it, I’ve done a test and not specifying it is not changing
> >> the current output. I can’t say that for a different clang-format version though or if changes happen in the
> >> future.
> > 
> > It's fine to set values. All I'm saying is that at least I would prefer
> > if it was also clear what exact effect the setting of a value has,
> > especially when that does not really match the language we use in the
> > project.
On C, allegedly, none. It ought to control defaults for things like
SpaceBeforeCpp11BracedList, SpacesInAngles and other C++-specific things,
because the C++ language sticks syntactical extensions every other Tuesday.
Alas, whatever it does (there's no full list). I'd feel a lot more
comfortable knowing it won't change under our feet.

For reference, clang-format's docs state as an example:

```
c++03:                                 latest:
vector<set<int> > x;           vs.     vector<set<int>> x;
```

> 
> Yes I agree, I think Alejandro’s reply to this configurable reflects my thoughts about it.
> 
> So if we all agree that we should set this parameter, do we all agree that it should be the
> value above?
> 
> Do you have other concerns regarding this or the other parameters in this thread?
> 
> 

Cheers,
Alejandro

