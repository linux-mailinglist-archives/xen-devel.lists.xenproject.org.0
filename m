Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A984A2BC0C
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 00:39:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVODG-0006l9-2Z; Mon, 27 May 2019 22:35:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XAIW=T3=gmail.com=jlpoole56@srs-us1.protection.inumbo.net>)
 id 1hVODE-0006l4-H8
 for xen-devel@lists.xen.org; Mon, 27 May 2019 22:35:24 +0000
X-Inumbo-ID: b6a3c49d-80cf-11e9-8980-bc764e045a96
Received: from mail-pf1-x430.google.com (unknown [2607:f8b0:4864:20::430])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b6a3c49d-80cf-11e9-8980-bc764e045a96;
 Mon, 27 May 2019 22:35:22 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id z26so10216412pfg.6
 for <xen-devel@lists.xen.org>; Mon, 27 May 2019 15:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=4u6iEKYsuk1XVWRmPZki3JUUqRLckew6zkBqK4h1cHs=;
 b=RMgOR5272AOFktaGjhQd+dyT+xQgHMcXTeeknswQOQxnX1tw/tUmKyT4ZYOURp7TgO
 /lHUZ1Bpf3f+gTPZZ6dlST/gxblBZZ0VAY2E4ptLi/cuiwTHNCbaJ+UVLvbi2uKif9Ma
 8CN2OAYLRPwoSnmadVHpwExRiXb4KZn0EXs/4I5S8kD5db1SansOc0S+7vAcknlAwA49
 Cqf+CrJppx3cFNL9S5LgqQTXOK72rE6IVtGVDGzu8jv7U2bvLs/EcimIhc8056gbRHjt
 qujo52so/48f3n/7qmaHDeIVoqXRON3xUSRcTy43sYg5Bgw2MzCIpp9YvLFelsNQyH28
 WlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language;
 bh=4u6iEKYsuk1XVWRmPZki3JUUqRLckew6zkBqK4h1cHs=;
 b=P4jb8tzQ6sfz+Zi2+bZ2mtje+8v9BHXRtWIQTlxZacK3hDjamATuvzf2Pz3R5AF2lH
 fiDYbt/DQpsXqG+z1upJrIr7/7O9y/jmzfQ7yyJl5fwmkpBZu++GnN21y6IND5PysDWw
 njLNO1etvEv05FArZVnmVPl7VXijvuvF6leHCCUPO0sEm0mWlf/wI/Eq0wePTa8kdoj/
 1pVL8Dlg0pOAQcf+VYna9fc2T9pBkGVXt7ozyIsiGerzunUQq8JBNbMSFrx+AKaa8gs5
 VUlBxaESHpSLnbC5Yia9ZVa/I7pPZTYJx/vyP0uraRChK514BNt1l5/nY/d3sNebtgW5
 zsoQ==
X-Gm-Message-State: APjAAAVnXu7m6li1KpmelQS1okIvuH7mpt9Kfq79EprLHUbwFlhP+9MB
 f8238yOwpGIi1Y/nI4RnHMauoDcV
X-Google-Smtp-Source: APXvYqzrapZF7tlP61Wwel6LcE6PPVCvJTyy2DA/XYzSVYrlu84TEDmCu88Mne2HdCbDghlK+FOMLg==
X-Received: by 2002:a62:8c97:: with SMTP id m145mr37908820pfd.62.1558996521736; 
 Mon, 27 May 2019 15:35:21 -0700 (PDT)
Received: from [192.168.1.2] (96-65-223-86-static.hfc.comcastbusiness.net.
 [96.65.223.86]) by smtp.googlemail.com with ESMTPSA id
 u11sm11624179pfh.130.2019.05.27.15.35.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 15:35:21 -0700 (PDT)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <9288a3b8-8c59-c80f-68f3-14aaca9272d4@gmail.com>
 <5C99DD160200007800221D00@prv1-mh.provo.novell.com>
 <25b66cdf-94ad-6af1-de5f-e0f5369ae000@gmail.com>
 <5C9B30D002000078002220F5@prv1-mh.provo.novell.com>
 <1fccf915-9d0b-52ac-4d6d-df16194dabb0@gmail.com>
 <5C9B86FA0200007800222232@prv1-mh.provo.novell.com>
 <daff9af3-5008-42ac-1355-ca8ef94fadb5@gmail.com>
 <20190429120238.b4kjlmkpk5l2t6yb@Air-de-Roger>
 <f4f4007c-4643-aecf-6ab7-811c00156fca@gmail.com>
 <20190429152734.qy34zz56e43pawvf@Air-de-Roger>
 <20190527161832.arry25rh4chyxkio@Air-de-Roger>
From: "John L. Poole" <jlpoole56@gmail.com>
Message-ID: <b00833f8-22a2-3f1e-65f6-7a4178377ee1@gmail.com>
Date: Mon, 27 May 2019 15:35:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190527161832.arry25rh4chyxkio@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen 4.12.0-rc Hangs Around masked ExtINT on CPU#
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: jlpoole56@gmail.com
Cc: Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xen.org
Content-Type: multipart/mixed; boundary="===============1139027853598050043=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--===============1139027853598050043==
Content-Type: multipart/alternative;
 boundary="------------93230702A7A3F237FA18D691"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------93230702A7A3F237FA18D691
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/27/2019 9:18 AM, Roger Pau Monné wrote:
> On Mon, Apr 29, 2019 at 05:27:34PM +0200, Roger Pau Monné wrote:
>> IMO it would be better if you can build directly from the upstream git
>> repository [0], that way you could use git-bisect(1) in order to figure
>> out which commit broke your system. For example:
>>
>> # git clone git://xenbits.xen.org/xen.git
>> # cd xen
>> # git checkout RELEASE-4.7.0
>> # make xen -j8
>>
>> That should give you a set of Xen binaries in the xen/ directory, IIRC
>> you are booting from EFI so you likely need xen/xen.efi.
>>
>> If that works, then you can test RELEASE-4.8.0 and if that fails to
>> boot you should have a range of commits that you can bisect in order
>> to find the culprit.
> FWIW, I've been unable to find a box with the same CPU model (C2750)
> that you are using. I've found a couple of old Atom boxes using
> different CPUs but they all seem to boot fine using latest
> xen-unstable. I've looked on eBay for that CPU but everything
> containing it is server-grade and >200$ which I'm sadly not going to
> pay.
>
> Unless you are able to bisect the tree and give us the bad commit
> that's causing your issues I'm afraid at least myself I won't be able
> to progress this any further, sorry.
>
> Roger.
I attempted to work backwards and ran into a nightmare with Gentoo.   I kept
getting compiler errors which I suspect was a result of having a newer 
version
of GCC and other things.  It's not an easy thing to travel
back in time in Gentoo because everything keeps getting upgraded.  I just
cannot make the time now to unravel this as I have some demands on my time
and will be engaged for the next four to six weeks.

How much would it cost for you to obtain the machine you need? I may
consider paying for it. I bought this Atom server just to economically run
Xen so the machine has marginal value to me if I cannot run Xen on it.

John



--------------93230702A7A3F237FA18D691
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/27/2019 9:18 AM, Roger Pau Monné
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20190527161832.arry25rh4chyxkio@Air-de-Roger">
      <pre class="moz-quote-pre" wrap="">On Mon, Apr 29, 2019 at 05:27:34PM +0200, Roger Pau Monné wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">IMO it would be better if you can build directly from the upstream git
repository [0], that way you could use git-bisect(1) in order to figure
out which commit broke your system. For example:

# git clone git://xenbits.xen.org/xen.git
# cd xen
# git checkout RELEASE-4.7.0
# make xen -j8

That should give you a set of Xen binaries in the xen/ directory, IIRC
you are booting from EFI so you likely need xen/xen.efi.

If that works, then you can test RELEASE-4.8.0 and if that fails to
boot you should have a range of commits that you can bisect in order
to find the culprit.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
FWIW, I've been unable to find a box with the same CPU model (C2750)
that you are using. I've found a couple of old Atom boxes using
different CPUs but they all seem to boot fine using latest
xen-unstable. I've looked on eBay for that CPU but everything
containing it is server-grade and &gt;200$ which I'm sadly not going to
pay.

Unless you are able to bisect the tree and give us the bad commit
that's causing your issues I'm afraid at least myself I won't be able
to progress this any further, sorry.

Roger.
</pre>
    </blockquote>
    <div class="moz-signature">I attempted to work backwards and ran
      into a nightmare with Gentoo.   I kept</div>
    <div class="moz-signature">getting compiler errors which I suspect
      was a result of having a newer version<br>
      of GCC and other things.  It's not an easy thing to travel</div>
    <div class="moz-signature">back in time in Gentoo because everything
      keeps getting upgraded.  I just<br>
      cannot make the time now to unravel this as I have some demands on
      my time</div>
    <div class="moz-signature">and will be engaged for the next four to
      six weeks.<br>
    </div>
    <div class="moz-signature"><br>
    </div>
    <div class="moz-signature">How much would it cost for you to obtain
      the machine you need? I may<br>
      consider paying for it. I bought this Atom server just to
      economically run</div>
    <div class="moz-signature">Xen so the machine has marginal value to
      me if I cannot run Xen on it.<br>
    </div>
    <div class="moz-signature"><br>
    </div>
    <div class="moz-signature"><font size="2"><font face="Verdana">John</font></font><br>
      <p><font size="2" face="Verdana">
          <br>
        </font></p>
    </div>
  </body>
</html>

--------------93230702A7A3F237FA18D691--


--===============1139027853598050043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1139027853598050043==--

