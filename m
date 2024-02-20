Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0686585C338
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 19:00:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683645.1063250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcUPG-0008RC-6Z; Tue, 20 Feb 2024 17:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683645.1063250; Tue, 20 Feb 2024 17:59:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcUPG-0008PQ-40; Tue, 20 Feb 2024 17:59:50 +0000
Received: by outflank-mailman (input) for mailman id 683645;
 Tue, 20 Feb 2024 17:59:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bzUj=J5=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rcUPE-0008PK-WE
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 17:59:49 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d61bbf68-d019-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 18:59:48 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a3e91993d73so365980366b.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 09:59:48 -0800 (PST)
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
X-Inumbo-ID: d61bbf68-d019-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708451987; x=1709056787; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j5a+NGR/JG/kXWxFoWSe7UwRlrGp+vtqbaGZKpx+uOY=;
        b=HFOGVp75bYG6B6j5hiJZnxrrc1pn8yIoISA9sdpkJYNgJc2FjNHPSkrrVLne2sVPF6
         PVWwueBSMZ5btzZ6GGGMP+LAzF6FU/0LZ0oFM9j53QAInDA5zOpAhk3YlxPC3X6NAah/
         she/Wt94Zavmu0fZu48ehA8D7sZYmID5OQchw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708451987; x=1709056787;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j5a+NGR/JG/kXWxFoWSe7UwRlrGp+vtqbaGZKpx+uOY=;
        b=NAYApUqU/6lrlcoIcj9/CaC7FeoTTJNwsl9j3tjjnmj1dXk0zYRmLQjIYccLbIlWVf
         mp0ujMpMOFyDztOH9bFcMdUDEhJhuOW56o97SyX3tqNfKNVT7okO1BcWrD/EK/Ghljvq
         /7AzOMBfgepGXonv4fhWBbw/suYUpvvipulUA8p5GtcHY3FPJ6tX5RdWvQogAQEQSdg1
         t0ywqv+3xluAY64MtDQjZWGZwQauHd5G4XTdI+Jmn7waHzxsHquiOudgNHaGFDBgysdQ
         SXjg8QvotdeSY7ru5w4yf0mvLIqFd87Goh+EOxL52kx5ux1NlRDNMSI/VeiKQJK7oVd6
         Fm4A==
X-Gm-Message-State: AOJu0YwZf48JV405MrBY3gp10XrSPXfR+sLIpPKbqF7nhXiyjTIzQI0v
	9Jo5GZ48+EpBwVf5rSRLtcryivaT/Z2lB32bEsL3GFPot60KJTwJqJCuv1ez7snpp9vnOBEenUZ
	OgPt4L4DKp9yk+kyn+cd/4pTxFy1nlJClXTlo+LfWPpwDotqCppZFMg==
X-Google-Smtp-Source: AGHT+IHQSZn5aaQ5eQ/FxjNfqR3eGv+Z5c06xzYKrW0ziAWdcJxsF1IXMqXwFR70eIexjF9BypBbGuU9tOtt07D1pzQ=
X-Received: by 2002:a17:906:c7c4:b0:a3f:1192:723b with SMTP id
 dc4-20020a170906c7c400b00a3f1192723bmr1281268ejb.70.1708451987052; Tue, 20
 Feb 2024 09:59:47 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Tue, 20 Feb 2024 17:59:11 +0000
Message-ID: <CAO-mL=wkWuin=yy-TUfs86sD8x55v5wb-ttgB1os_Xo=UYbp=w@mail.gmail.com>
Subject: XEN SOCIAL TOMORROW (21st Feb 2024)!
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000cdfb090611d3f942"

--000000000000cdfb090611d3f942
Content-Type: text/plain; charset="UTF-8"

A reminder our Xen Project social is tomorrow!

Connect with the community and your fellow peers - Food and drinks will be
provided.

*If you haven't already, please reply to me directly if you're interested
in attending to anticipate food orders.*

*Location:*
The Portland Arms
129 Chesterton Rd Cambridge
www.theportlandarms.co.uk
<https://www.google.com/url?q=http%3A%2F%2Fwww.theportlandarms.co.uk%2F&sa=D&ust=1708179900000000&usg=AOvVaw39V5Gc5y-9wOaDF__Bwsv5>
T: 01223 357268

*Getting to the venue (more information here
<https://www.google.com/url?q=https%3A%2F%2Ftheportlandarms.co.uk%2Fwp%2Faccess-info%2F&sa=D&ust=1708179900000000&usg=AOvVaw2OZgE_3TLKdcLGYks6qbUW>):*
There are pay and display spaces (free after 5pm) on Milton Road to the
East of us or opposite on Chesterton Road. The nearest bus stops are:
Chesterton Road, opposite the pub outside Hing Hung restaurant, and on
Milton Road, near Westbrook centre, Citi 1, 9, X9 and The Busway. Cambridge
North rail station is 2.3 miles away and Cambridge Central station is 2.4
miles.

Many thanks,
Kelly Choi

Community Manager
Xen Project

--000000000000cdfb090611d3f942
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">A reminder our Xen Project social is tomorrow!=C2=A0<div><=
br><div><div>Connect with the community and your fellow peers - Food and dr=
inks will be provided.<br></div><div><b><font color=3D"#000000"><br></font>=
</b></div><div><b><font color=3D"#000000">If you haven&#39;t already, pleas=
e reply to me directly if you&#39;re interested in attending to=C2=A0antici=
pate=C2=A0food orders.</font></b></div><div><br></div><div><span style=3D"c=
olor:rgb(60,64,67);font-family:Roboto,sans-serif;font-size:14px;letter-spac=
ing:0.2px"><b>Location:</b></span><br style=3D"color:rgb(60,64,67);font-fam=
ily:Roboto,sans-serif;font-size:14px;letter-spacing:0.2px"><span style=3D"c=
olor:rgb(60,64,67);font-family:Roboto,sans-serif;font-size:14px;letter-spac=
ing:0.2px">The Portland Arms</span><br style=3D"color:rgb(60,64,67);font-fa=
mily:Roboto,sans-serif;font-size:14px;letter-spacing:0.2px"><span style=3D"=
color:rgb(60,64,67);font-family:Roboto,sans-serif;font-size:14px;letter-spa=
cing:0.2px">129 Chesterton Rd Cambridge</span><br style=3D"color:rgb(60,64,=
67);font-family:Roboto,sans-serif;font-size:14px;letter-spacing:0.2px"><a h=
ref=3D"https://www.google.com/url?q=3Dhttp%3A%2F%2Fwww.theportlandarms.co.u=
k%2F&amp;sa=3DD&amp;ust=3D1708179900000000&amp;usg=3DAOvVaw39V5Gc5y-9wOaDF_=
_Bwsv5" target=3D"_blank" style=3D"font-family:Roboto,sans-serif;font-size:=
14px;letter-spacing:0.2px">www.theportlandarms.co.uk</a><br style=3D"color:=
rgb(60,64,67);font-family:Roboto,sans-serif;font-size:14px;letter-spacing:0=
.2px"><span style=3D"color:rgb(60,64,67);font-family:Roboto,sans-serif;font=
-size:14px;letter-spacing:0.2px">T: 01223 357268</span><br style=3D"color:r=
gb(60,64,67);font-family:Roboto,sans-serif;font-size:14px;letter-spacing:0.=
2px"><br style=3D"color:rgb(60,64,67);font-family:Roboto,sans-serif;font-si=
ze:14px;letter-spacing:0.2px"><b><span style=3D"color:rgb(60,64,67);font-fa=
mily:Roboto,sans-serif;font-size:14px;letter-spacing:0.2px">Getting to the =
venue (</span><a href=3D"https://www.google.com/url?q=3Dhttps%3A%2F%2Fthepo=
rtlandarms.co.uk%2Fwp%2Faccess-info%2F&amp;sa=3DD&amp;ust=3D170817990000000=
0&amp;usg=3DAOvVaw2OZgE_3TLKdcLGYks6qbUW" target=3D"_blank" style=3D"font-f=
amily:Roboto,sans-serif;font-size:14px;letter-spacing:0.2px">more informati=
on here</a><span style=3D"color:rgb(60,64,67);font-family:Roboto,sans-serif=
;font-size:14px;letter-spacing:0.2px">):</span></b><br style=3D"color:rgb(6=
0,64,67);font-family:Roboto,sans-serif;font-size:14px;letter-spacing:0.2px"=
><span style=3D"color:rgb(60,64,67);font-family:Roboto,sans-serif;font-size=
:14px;letter-spacing:0.2px">There are pay and display spaces (free after 5p=
m) on Milton Road to the East of us or opposite on Chesterton Road. The nea=
rest bus stops are: Chesterton Road, opposite the pub outside Hing Hung res=
taurant, and on Milton Road, near Westbrook centre, Citi 1, 9, X9 and The B=
usway. Cambridge North rail station is 2.3 miles away and Cambridge Central=
 station is 2.4 miles.</span><br></div><div><br></div><div><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr"><div>Many thanks,</div><div>Kelly Choi</div><div><br></div><div><div st=
yle=3D"color:rgb(136,136,136)">Community Manager</div><div style=3D"color:r=
gb(136,136,136)">Xen Project=C2=A0<br></div></div></div></div></div></div><=
/div></div>

--000000000000cdfb090611d3f942--

