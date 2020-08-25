Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1003B251B9F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 16:58:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAaOM-0005Ue-4z; Tue, 25 Aug 2020 14:57:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+30z=CD=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1kAaOK-0005UZ-Bu
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 14:57:40 +0000
X-Inumbo-ID: 346f1c55-07c6-4c9b-ad2a-a912853bb5af
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 346f1c55-07c6-4c9b-ad2a-a912853bb5af;
 Tue, 25 Aug 2020 14:57:39 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id y65so2702791qtd.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2020 07:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Bg86s3rQXHj/4ekaiPSknhtQbmsLJ2g3/BQsKyD5Vs8=;
 b=I6mQ9BJqWPxKLQMyoFDksQ+tKc2BiKjOqQeIQ0LjcvYd6eBXxPck+kIRAKTr+Ovu0O
 pNY8XJtZ5JUcGtqd8eKH01WkpJ2Vpn8pbnhG3FN+JzuJib8wbIWi2M/BPf1f8t4NyNa1
 DZU6UUYLn0PCTYtcbrtZrEqKvVZplQmldXAFu2QFRk5LOs4MGzaJyGOwKRMFjFB6CEpH
 lhU4ruTzuEyaJNFDqaOxu3fTG3Pm/rXqImD4pCFk28FaUJfcwEejgJ4Jzsk90ZElCM2K
 HkhDu0Lf1Hif7BRgRt6ihBeNfQKXDChpiQyshRojDXN6RFpVPttrvqDeqwr5/3QWmtIa
 EVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Bg86s3rQXHj/4ekaiPSknhtQbmsLJ2g3/BQsKyD5Vs8=;
 b=PsqwW07jy/wPjbWPnG3ykWboiq3uB6PBULA02tIL0LySMp67gtoWFfCT8CrdoeUXgw
 C/EYTr6TLUMHr0NfMkAAOFiHAyPiUK/swr1PiQgqEj2AomRXqZrD4UYJ4U5RIwfnMLwB
 JQxHk75xWLJU0NOAFOn/Wng0t+nluqe0W2XJyhkAoVGrKRbJrHqQtRLkwTUg2GNuJOBq
 hdOqMygCJZo+3RZ8XwHnmL36MKAhtKY4sNyNwAS/Q4qnjiSwB/53IUO3ArEMj+iTCkt0
 sA5phiz9xEcFCYlMa4f5CIyGBRij19vnoR0/ExL1l5w1++QAWt5sN1naW/E214u2giwc
 DxnA==
X-Gm-Message-State: AOAM530fNYFMN7MY7+qDFbKIQQ25E+Zg71peCEREf9Kn0sCE+n6e70S2
 cIhq1R46WUq9kJDJcbYgtv4=
X-Google-Smtp-Source: ABdhPJypsIseaJz3monOLs5Z1nNvVxZv7/feC1rbg1vneq2JXfdovAgrq//7676Kqxkxte+fqMbhwg==
X-Received: by 2002:ac8:5205:: with SMTP id r5mr7691341qtn.108.1598367458679; 
 Tue, 25 Aug 2020 07:57:38 -0700 (PDT)
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com
 (209-217-208-226.northland.net. [209.217.208.226])
 by smtp.gmail.com with ESMTPSA id m17sm13436187qkn.45.2020.08.25.07.57.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Aug 2020 07:57:37 -0700 (PDT)
Date: Tue, 25 Aug 2020 10:57:34 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Subject: Re: [PATCH] libxl: avoid golang building without CONFIG_GOLANG=y
Message-ID: <20200825145734.GA3697@FED-nrosbr-BE.crux.rad.ainfosec.com>
References: <0deed4c6-ca87-09d3-a19c-ac0c00003cb7@suse.com>
 <20200804155043.vq7aupbrvmmcgzlv@liuwe-devbox-debian-v2>
 <12790d2b-020d-b6fe-4924-2233a4e93d83@suse.com>
 <20200804155707.rrtzkksrle2nojbj@liuwe-devbox-debian-v2>
 <43f706e4-0292-5758-eb19-9fbb99b1337e@suse.com>
 <CAEBZRSc=xUjYq7ao9Rv-EEJsjiBkt5mio5QofvixErZj_SJUcw@mail.gmail.com>
 <289981a3-9baf-bf6a-abbd-e4d613709f2a@suse.com>
 <20200824145849.GA8275@FED-nrosbr-BE.crux.rad.ainfosec.com>
 <3e6858f4-bb63-5533-c523-cffd13503f2c@suse.com>
 <B99E1A82-FBE8-4EE3-943A-4384BA504184@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B99E1A82-FBE8-4EE3-943A-4384BA504184@citrix.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Aug 25, 2020 at 10:37:09AM +0000, George Dunlap wrote:
> 
> 
> > On Aug 25, 2020, at 7:47 AM, Jan Beulich <JBeulich@suse.com> wrote:
> > 
> > On 24.08.2020 16:58, Nick Rosbrook wrote:
> >> My understanding was that you were going to use move-if-changed to fix
> >> this for now (it seemed everyone agreed this was the quickest short-term fix).
> > 
> > A technical and a non-technical remark:
> > 
> > Thinking about this some more, I'm no longer convinced the
> > move-if-changed approach is appropriate here. It is typically
> > used to avoid updating files with a large set of dependents
> > (all of which would need re-building if the file in question
> > changed, even if merely in its time stamp), and where the
> > cost of re-generating (and comparing) is relatively low.
> > While I can't really assess the cost part here (I know too
> > little of Python to be able to compare its use with e.g. a
> > shell script), I don't think the "large set of dependencies"
> > aspect applies here at all.
> > 
> > On the non-technical side I have to admit that I find it,
> > well, unfriendly to have a person not only run into and
> > investigate a (recent) regression, but also make multiple
> > attempts at fixing (or at least working around) it. I'd
> > rather view this as preferably the responsibility of the
> > person having introduced an issue. In the case at hand it is
> > quite clear that I wasn't even remotely aware of the
> > requirements, and hence determination and testing of a more
> > adequate solution would far better be done by someone
> > familiar with all the influencing factors. (Things might
> > yet be different if an issue is difficult to reproduce, but
> > I don't see that being the case here.)
> 
> Yes, this has been sub-optimal for you to have your functionality broken for several weeks.
> 
> As an explanation, there are a combination of things. You proposed A (remove the dependency), Ian proposed B (use move-if-changed), but we’re hoping to do C (have an external tree) before the next release.  I haven’t had the time to look into either B or C (nor, unfortunately, to review Nick’s submissions to other parts of the code — sorry Nick!); but I’ve still been reluctant to go for A.
> 
> I think basically, unless someone is ready to tackle B or C immediately, we should just check in Jan’s fix (or probably better, just revert the patch that introduced the dependency).  It will be annoying to have to potentially fix up the generated golang bindings, but that puts the incentives in the right place.

Yeah, that's probably best. I for one do not have any immediate plans
for working on option C.

Jan - I apologize for the confusion, I certainly did not mean to be
unfriendly or hold up your work.

-NR

