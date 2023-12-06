Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3DD8064E8
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 03:21:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648771.1012713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAhXO-0000JV-29; Wed, 06 Dec 2023 02:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648771.1012713; Wed, 06 Dec 2023 02:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAhXN-0000GN-Ut; Wed, 06 Dec 2023 02:21:21 +0000
Received: by outflank-mailman (input) for mailman id 648771;
 Wed, 06 Dec 2023 02:21:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WeUv=HR=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rAhXL-0000GH-Mq
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 02:21:19 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23a22662-93de-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 03:21:18 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50bce78f145so7750216e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 18:21:18 -0800 (PST)
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
X-Inumbo-ID: 23a22662-93de-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701829278; x=1702434078; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GlqQcML8q0/Ao0jUzhCotKCzB5TmYAgodSDGhlIQ88Y=;
        b=CHq0TUB62VwjEC0MoAvV65kPevgDVPZcD1l7EdoqwqCTuUvNe0UwuioL3uuROMljZU
         yigwP4OMY7wWvxfwWVkGoot1XNlGG/xlQnsjABD/OMBwkgfiTJ7kWtTBt/lVpeAPC6tX
         NfQJgkKrk6faNyLzQOmBPVp851xdhmTExCzuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701829278; x=1702434078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GlqQcML8q0/Ao0jUzhCotKCzB5TmYAgodSDGhlIQ88Y=;
        b=XvUfW6pYKcPVEaKTehmhbAsWjpWJc9U/ljv8V3eAmr554fx/d7F+w/gxj5Y22mqF/j
         RN6flQZbxlNfdLGnxxeFlx03LHV81DaLFxxnHfqGH6VYGjT7K8jHJUhgcx7sE6nXINga
         6OZYTon3XnSVeoWblgobgxSEcUXfOVIXlSMR0wSKBCUJUqUPvL+/kB7OiLKmaDXCWil/
         9e602b7lF+L6R7CLho+AzQci4tMzy7qN8vjZa46ONoMeN4u1cM6sZcH/p9D9RjsBpDVV
         t+C+p7IomShbmuVU4gLZ4s/q/kRwz0m15jAXoaWGBLpEima4ZCx/SGIMYpgJDCO0wBoV
         KojQ==
X-Gm-Message-State: AOJu0YxLwBWVfI3edL2R3ftfFUadbkRQE7kNgvtjr1HKAFc5xHN6YSnN
	sviBc6f1vrZ8uBAasjQHdik3w60YmDHbe9p3fDjKNA==
X-Google-Smtp-Source: AGHT+IGYhJ0VsnITntKkUNX0Mbz/vRLhRN/nTaOXucIlkqBZx1kJ6eXsjRBpE5XK3Oe7MGARhPmoTMlIrZXxXGbI1L4=
X-Received: by 2002:a05:6512:710:b0:50b:eb80:e02 with SMTP id
 b16-20020a056512071000b0050beb800e02mr46968lfs.203.1701829277937; Tue, 05 Dec
 2023 18:21:17 -0800 (PST)
MIME-Version: 1.0
References: <20231205181218.74667-1-julien@xen.org>
In-Reply-To: <20231205181218.74667-1-julien@xen.org>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 6 Dec 2023 02:21:07 +0000
Message-ID: <CA+zSX=aUV00BwnNfFTbCE=6PuVNT=UFvE0tnMO3UhwCMh5jmHQ@mail.gmail.com>
Subject: Re: [PATCH] CODING_STYLE: Add a section of the naming convention
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2023 at 6:12=E2=80=AFPM Julien Grall <julien@xen.org> wrote:
>
> From: Julien Grall <jgrall@amazon.com>
>
> Several maintainers have expressed a stronger preference
> to use '-' when in filename and option that contains multiple
> words.
>
> So document it in CODING_STYLE.
>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>
> ---
>     Changes in v2:
>         - New wording
>         - Update the section title
>         - Add Jan's acked-by
> ---
>  CODING_STYLE | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/CODING_STYLE b/CODING_STYLE
> index ced3ade5a6fb..ed13ee2b664b 100644
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -144,6 +144,15 @@ separate lines and each line should begin with a lea=
ding '*'.
>   * Note beginning and end markers on separate lines and leading '*'.
>   */
>
> +Naming convention for files and command line options
> +----------------------------------------------------
> +
> +'-' should be used to separate words in commandline options and filename=
s.
> +E.g. timer-works.
> +
> +Note that some of the options and filenames are using '_'. This is now
> +deprecated.

Sorry for not catching this last time; "are using X" isn't really
idiomatic English; more idiomatic would be something like the
following:

"Note that some existing options and file names use '_'.  This is now
deprecated."

Since we're changing things, I *think* most style guides would advise
against starting the sentence with a punctuation; so perhaps:

"Command-line options and file names should use '-' to separate words;
e.g., timer-works."

And what about adding to the last paragraph:

"When touching code around command-line parameters still using '_', it
is recommended to modify the documentation to say only '-', but modify
the code to accept both '-' and '_' (for backwards compatibility)."

I was going to say I'm happy to change on check-in, but I think with
three changes it's probably worth waiting for a fuller discussion.

 -George

