Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D375A9862
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 04:36:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5hZj-0002rN-8t; Thu, 05 Sep 2019 02:32:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=sH3W=XA=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1i5hZh-0002rI-SK
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 02:32:41 +0000
X-Inumbo-ID: 6eaa3738-cf85-11e9-b299-bc764e2007e4
Received: from mail-io1-xd41.google.com (unknown [2607:f8b0:4864:20::d41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6eaa3738-cf85-11e9-b299-bc764e2007e4;
 Thu, 05 Sep 2019 02:32:40 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id h144so1201574iof.7
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2019 19:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=/vgmu88P4px60rJRfsb/xtAygFqxrBW7gcKKeQAWvdc=;
 b=arsD8Wa/MOngJoHIGSE6xWQfNylRmZ4SZt1tvGMXypkBNywmqIL1wir3/XUqJ37VHq
 wcKfnPIEVpS9B+0vvpBeP0Ba9LWPbKprh1Mb4kqZ3GjWl8bYrBjfWAUPDVs0f9bdDt1l
 gH0lrF/iqYbIbbuGhf/6CwzZPEv4jpNh+ehA2LkPISCKWj3xFZTehe6C5gUgktVuaNPn
 yaY0nwmg9Ynqd6tJG49anbKSwQ2UGo+aR+J3gJYYwFHZUdV56hR7tpJC7rhMvw1QKlZ7
 tQxfRmeoaWl8tkhwyOTw7Yh7m22BKzebfpeBevuvDOr9nNQ6AjpFoxJBDN27Pebb3XsZ
 NE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=/vgmu88P4px60rJRfsb/xtAygFqxrBW7gcKKeQAWvdc=;
 b=dKvd/b5Bvj2nmGDYTuU8XiyhQ7g20Cn/7cgmCgxU3Kdd1/OOp6taKWqqXrACTchr+P
 VHoXUlfW9HfEGUJznCfpAvDFbSqn0nfepPYy/5q4MVSb/I6LMmkNY9hT9pbvfBg9OIeJ
 lQaPxsXsRdkM7KRgM/aFjFcoEC2fgeYx8U1DM1OY2D8CbeT6VMeWuSnlb4mIPtMP59m4
 F1r8NpnlFdxJDK0RdIXrTh936tAUUmwo5t3+Q2/Dk/WLEZXXEFJAgYMKELhDC1dvyVu2
 EYn42/7J9FXBHAne4d3TCBTh0liwdMdyXJINFm2y5FYpoyJxc+tCMtBX0UkvTNaN4DID
 jK3A==
X-Gm-Message-State: APjAAAXyzbgReIBUY/rrfctyYy5smqrKArnw8RCO9rnw7LV4iCtoU6L/
 ZBW15YHaSWFIO4o1R2wh4DY=
X-Google-Smtp-Source: APXvYqwQ2p2A41Zxnk4wMOk6y19qr5qj6V/ku82magNDr2dpGh9idSFkdWU00REHU/iLx0gued03YA==
X-Received: by 2002:a6b:7807:: with SMTP id j7mr1484545iom.224.1567650760178; 
 Wed, 04 Sep 2019 19:32:40 -0700 (PDT)
Received: from [100.64.72.214] ([205.185.206.122])
 by smtp.gmail.com with ESMTPSA id l13sm598125iob.73.2019.09.04.19.32.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 04 Sep 2019 19:32:39 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPad Mail (16G102)
In-Reply-To: <6DA859DE-62FD-48C1-BBEE-C7A63D751B3E@citrix.com>
Date: Wed, 4 Sep 2019 22:32:38 -0400
Message-Id: <E8BC34C9-934A-4383-833B-B9AE6C9540A9@gmail.com>
References: <6DA859DE-62FD-48C1-BBEE-C7A63D751B3E@citrix.com>
To: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [Xen-devel] [ANNOUNCE] Call for agenda items for September 5th
 Community Call @ 15:00 UTC
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
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Doug Goldstein <cardoe@cardoe.com>, Rich Persaud <persaur@gmail.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 Matt Spencer <Matt.Spencer@arm.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, "Natarajan,
 Janakarajan" <jnataraj@amd.com>,
 "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, openxt@googlegroups.com,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Rian Quinn <rianquinn@gmail.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>, james.mckenzie@bromium.com,
 Paul Durrant <Paul.Durrant@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>, Juergen Gross <jgross@suse.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, "Ji, John" <john.ji@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============7063307454060300863=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7063307454060300863==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-9C4FD1DC-650E-4FED-95CE-E43EFB1D82A8
Content-Transfer-Encoding: 7bit


--Apple-Mail-9C4FD1DC-650E-4FED-95CE-E43EFB1D82A8
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Agenda item:  Domain name service for nested virt and disaggregation=20

(text based on draft by Daniel Smith, who will speak to this agenda item)

If a future, minimal "L0 Xen" hypervisor can be optimized for nested virtual=
ization in greenfield deployments (i.e. no requirement to maintain existing h=
ypervisor-guest interfaces), then PV driver mechanisms other than grants, ev=
ents and xenstore could be considered.  This was discussed in a Xen Summit 2=
019 design session:
https://lists.gt.net/xen/devel/560973

For some OpenXT use cases, we are in the process of further disaggregating t=
he platform.  We need a name service to enable the disaggregated service dom=
ains to discover the other service domains with which they need to communica=
te.  Xenstore is not sufficient, as we would like to use Flask to control th=
e data flow, as well as applying mandatory access control to service calls.=20=


We are reaching out to the Xen Community to elicit input on approaches, such=
 that we might be able to submit an upstream RFC based on our early work:

- For a communication channel we are looking to leverage Argo, which is curr=
ently in experimental status. Its predecessor (v4v) is already being used in=
 a similar fashion by Bromium uXen (https://github.com/openxt/uxen), which f=
unctions well across nested hypervisors.  uXen v4v includes a mechanism to c=
ontrol information flow.

- An open question is how to address the domains. Xen domain ids are reused a=
nd have no guarantee for uniqueness.  UUIDs are available and can provide be=
tter guarantees for uniqueness. Another approach is to use the name string w=
hich allows the ability for punctuation characters, eg. : or /, to create na=
mespaced names for the domains.



> On Sep 4, 2019, at 10:05, Lars Kurth <lars.kurth@citrix.com> wrote:
>=20
> Hi all,
>=20
> the proposed agenda is in https://cryptpad.fr/pad/#/2/pad/edit/xwUTm6b5f5i=
jPTQcF9IFgkBg/ and you can edit to add items
> Alternatively, you can reply to this mail directly
> Agenda items appreciated ASAP: please put your name besides items if you e=
dit the document
>=20
> Apologies for dropping the ball on this one, I forgot to add the CC list t=
o the earlier mail I sent
>=20
> Regards
> Lars
> P.S.: If you want to be added or removed from the CC list please reply pri=
vately
>=20
> =3D=3D Dial-in Information =3D=3D
>=20
> ## Meeting time
> 15:00 - 16:00 UTC
> Further International meeting times: https://www.timeanddate.com/worldcloc=
k/meetingdetails.html?year=3D2019&month=3D9&day=3D5&hour=3D15&min=3D0&sec=3D=
0&p1=3D225&p2=3D224&p3=3D24&p4=3D179&p5=3D136&p6=3D37&p7=3D33
>=20
> ## Dial in details
> Web: https://www.gotomeet.me/larskurth
>=20
> You can also dial in using your phone.
> Access Code: 906-886-965
>=20
> China (Toll Free): 4008 811084
> Germany: +49 692 5736 7317
> Poland (Toll Free): 00 800 1124759
> United Kingdom: +44 330 221 0088
> United States: +1 (571) 317-3129
>=20
> More phone numbers
> Australia: +61 2 9087 3604
> Austria: +43 7 2081 5427
> Argentina (Toll Free): 0 800 444 3375
> Bahrain (Toll Free): 800 81 111
> Belarus (Toll Free): 8 820 0011 0400
> Belgium: +32 28 93 7018
> Brazil (Toll Free): 0 800 047 4906
> Bulgaria (Toll Free): 00800 120 4417
> Canada: +1 (647) 497-9391
> Chile (Toll Free): 800 395 150
> Colombia (Toll Free): 01 800 518 4483
>  Czech Republic (Toll Free): 800 500448
> Denmark: +45 32 72 03 82
> Finland: +358 923 17 0568
> France: +33 170 950 594
> Greece (Toll Free): 00 800 4414 3838
> Hong Kong (Toll Free): 30713169
> Hungary (Toll Free): (06) 80 986 255
> Iceland (Toll Free): 800 7204
> India (Toll Free): 18002669272
> Indonesia (Toll Free): 007 803 020 5375
> Ireland: +353 15 360 728
> Israel (Toll Free): 1 809 454 830
> Italy: +39 0 247 92 13 01
> Japan (Toll Free): 0 120 663 800
> Korea, Republic of (Toll Free): 00798 14 207 4914
> Luxembourg (Toll Free): 800 85158
> Malaysia (Toll Free): 1 800 81 6854
> Mexico (Toll Free): 01 800 522 1133
> Netherlands: +31 207 941 377
> New Zealand: +64 9 280 6302
> Norway: +47 21 93 37 51
> Panama (Toll Free): 00 800 226 7928
> Peru (Toll Free): 0 800 77023
> Philippines (Toll Free): 1 800 1110 1661
> Portugal (Toll Free): 800 819 575
> Romania (Toll Free): 0 800 410 029
> Russian Federation (Toll Free): 8 800 100 6203
> Saudi Arabia (Toll Free): 800 844 3633
> Singapore (Toll Free): 18007231323
> South Africa (Toll Free): 0 800 555 447
> Spain: +34 932 75 2004
> Sweden: +46 853 527 827
> Switzerland: +41 225 4599 78
> Taiwan (Toll Free): 0 800 666 854
> Thailand (Toll Free): 001 800 011 023
> Turkey (Toll Free): 00 800 4488 23683
> Ukraine (Toll Free): 0 800 50 1733
> United Arab Emirates (Toll Free): 800 044 40439
> Uruguay (Toll Free): 0004 019 1018
> Viet Nam (Toll Free): 122 80 481
>=20
> First GoToMeeting? Let's do a quick system check:
> https://link.gotomeeting.com/system-check
>=20
>=20
>=20
>=20
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--Apple-Mail-9C4FD1DC-650E-4FED-95CE-E43EFB1D82A8
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><span></span></div><div di=
r=3D"ltr"><div dir=3D"ltr"></div><div dir=3D"ltr">Agenda item: &nbsp;Domain n=
ame service for nested virt and disaggregation&nbsp;</div><div dir=3D"ltr"><=
br></div><div dir=3D"ltr">(text based on draft by&nbsp;<span style=3D"backgr=
ound-color: rgba(255, 255, 255, 0);">Daniel Smith, who will speak to this ag=
enda item)</span></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">If a futu=
re, minimal "L0 Xen" hypervisor can be optimized for nested virtualization i=
n greenfield deployments (i.e. no requirement to maintain existing hyperviso=
r-guest interfaces), then PV driver mechanisms other than grants, events and=
 xenstore could be considered. &nbsp;This was discussed in a Xen Summit 2019=
 design session:</div><div dir=3D"ltr"><a href=3D"https://lists.gt.net/xen/d=
evel/560973">https://lists.gt.net/xen/devel/560973</a></div><div dir=3D"ltr"=
><br></div><div dir=3D"ltr"><div dir=3D"ltr">For some OpenXT use cases, we a=
re in the process of further disaggregating the platform. &nbsp;We need a na=
me service to enable the disaggregated service domains to discover the other=
 service domains with which they need to communicate. &nbsp;Xenstore is not s=
ufficient, as we would like to use Flask to control the data flow, as well a=
s applying mandatory access control to service calls.&nbsp;</div><div dir=3D=
"ltr"><br></div><div dir=3D"ltr">We are reaching out to the Xen Community to=
 elicit input on approaches, such that we might be able to submit an upstrea=
m RFC based on our early work:</div><div dir=3D"ltr"><br></div><div dir=3D"l=
tr">- For a communication channel we are looking to leverage Argo, which is c=
urrently in experimental status. Its predecessor (v4v) is already being used=
 in a similar fashion by Bromium uXen (<a href=3D"https://github.com/openxt/=
uxen">https://github.com/openxt/uxen</a>), which functions well across neste=
d hypervisors. &nbsp;uXen v4v includes a mechanism to control information fl=
ow.</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">- An open question is h=
ow to address the domains. Xen domain ids are reused and have no guarantee f=
or uniqueness. &nbsp;UUIDs are available and can provide better guarantees f=
or uniqueness. Another approach is to use the name string which allows the a=
bility for punctuation characters, eg. : or /, to create namespaced names fo=
r the domains.</div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><br></div></=
div><div dir=3D"ltr"><br>On Sep 4, 2019, at 10:05, Lars Kurth &lt;<a href=3D=
"mailto:lars.kurth@citrix.com">lars.kurth@citrix.com</a>&gt; wrote:<br><br><=
/div><blockquote type=3D"cite"><div dir=3D"ltr"><span>Hi all,</span><br><spa=
n></span><br><span>the proposed agenda is in <a href=3D"https://cryptpad.fr/=
pad/#/2/pad/edit/xwUTm6b5f5ijPTQcF9IFgkBg/">https://cryptpad.fr/pad/#/2/pad/=
edit/xwUTm6b5f5ijPTQcF9IFgkBg/</a> and you can edit to add items</span><br><=
span>Alternatively, you can reply to this mail directly</span><br><span>Agen=
da items appreciated ASAP: please put your name besides items if you edit th=
e document</span><br><span></span><br><span>Apologies for dropping the ball o=
n this one, I forgot to add the CC list to the earlier mail I sent</span><br=
><span></span><br><span>Regards</span><br><span>Lars</span><br><span>P.S.: I=
f you want to be added or removed from the CC list please reply privately</s=
pan><br><span></span><br><span>=3D=3D Dial-in Information =3D=3D</span><br><=
span></span><br><span>## Meeting time</span><br><span>15:00 - 16:00 UTC</spa=
n><br><span>Further International meeting times: <a href=3D"https://www.time=
anddate.com/worldclock/meetingdetails.html?year=3D2019&amp;month=3D9&amp;day=
=3D5&amp;hour=3D15&amp;min=3D0&amp;sec=3D0&amp;p1=3D225&amp;p2=3D224&amp;p3=3D=
24&amp;p4=3D179&amp;p5=3D136&amp;p6=3D37&amp;p7=3D33">https://www.timeanddat=
e.com/worldclock/meetingdetails.html?year=3D2019&amp;month=3D9&amp;day=3D5&a=
mp;hour=3D15&amp;min=3D0&amp;sec=3D0&amp;p1=3D225&amp;p2=3D224&amp;p3=3D24&a=
mp;p4=3D179&amp;p5=3D136&amp;p6=3D37&amp;p7=3D33</a></span><br><span></span>=
<br><span>## Dial in details</span><br><span>Web: <a href=3D"https://www.got=
omeet.me/larskurth">https://www.gotomeet.me/larskurth</a></span><br><span></=
span><br><span>You can also dial in using your phone.</span><br><span>Access=
 Code: 906-886-965</span><br><span></span><br><span>China (Toll Free): 4008 8=
11084</span><br><span>Germany: +49 692 5736 7317</span><br><span>Poland (Tol=
l Free): 00 800 1124759</span><br><span>United Kingdom: +44 330 221 0088</sp=
an><br><span>United States: +1 (571) 317-3129</span><br><span></span><br><sp=
an>More phone numbers</span><br><span>Australia: +61 2 9087 3604</span><br><=
span>Austria: +43 7 2081 5427</span><br><span>Argentina (Toll Free): 0 800 4=
44 3375</span><br><span>Bahrain (Toll Free): 800 81 111</span><br><span>Bela=
rus (Toll Free): 8 820 0011 0400</span><br><span>Belgium: +32 28 93 7018</sp=
an><br><span>Brazil (Toll Free): 0 800 047 4906</span><br><span>Bulgaria (To=
ll Free): 00800 120 4417</span><br><span>Canada: +1 (647) 497-9391</span><br=
><span>Chile (Toll Free): 800 395 150</span><br><span>Colombia (Toll Free): 0=
1 800 518 4483</span><br><span> &nbsp;Czech Republic (Toll Free): 800 500448=
</span><br><span>Denmark: +45 32 72 03 82</span><br><span>Finland: +358 923 1=
7 0568</span><br><span>France: +33 170 950 594</span><br><span>Greece (Toll =
Free): 00 800 4414 3838</span><br><span>Hong Kong (Toll Free): 30713169</spa=
n><br><span>Hungary (Toll Free): (06) 80 986 255</span><br><span>Iceland (To=
ll Free): 800 7204</span><br><span>India (Toll Free): 18002669272</span><br>=
<span>Indonesia (Toll Free): 007 803 020 5375</span><br><span>Ireland: +353 1=
5 360 728</span><br><span>Israel (Toll Free): 1 809 454 830</span><br><span>=
Italy: +39 0 247 92 13 01</span><br><span>Japan (Toll Free): 0 120 663 800</=
span><br><span>Korea, Republic of (Toll Free): 00798 14 207 4914</span><br><=
span>Luxembourg (Toll Free): 800 85158</span><br><span>Malaysia (Toll Free):=
 1 800 81 6854</span><br><span>Mexico (Toll Free): 01 800 522 1133</span><br=
><span>Netherlands: +31 207 941 377</span><br><span>New Zealand: +64 9 280 6=
302</span><br><span>Norway: +47 21 93 37 51</span><br><span>Panama (Toll Fre=
e): 00 800 226 7928</span><br><span>Peru (Toll Free): 0 800 77023</span><br>=
<span>Philippines (Toll Free): 1 800 1110 1661</span><br><span>Portugal (Tol=
l Free): 800 819 575</span><br><span>Romania (Toll Free): 0 800 410 029</spa=
n><br><span>Russian Federation (Toll Free): 8 800 100 6203</span><br><span>S=
audi Arabia (Toll Free): 800 844 3633</span><br><span>Singapore (Toll Free):=
 18007231323</span><br><span>South Africa (Toll Free): 0 800 555 447</span><=
br><span>Spain: +34 932 75 2004</span><br><span>Sweden: +46 853 527 827</spa=
n><br><span>Switzerland: +41 225 4599 78</span><br><span>Taiwan (Toll Free):=
 0 800 666 854</span><br><span>Thailand (Toll Free): 001 800 011 023</span><=
br><span>Turkey (Toll Free): 00 800 4488 23683</span><br><span>Ukraine (Toll=
 Free): 0 800 50 1733</span><br><span>United Arab Emirates (Toll Free): 800 0=
44 40439</span><br><span>Uruguay (Toll Free): 0004 019 1018</span><br><span>=
Viet Nam (Toll Free): 122 80 481</span><br><span></span><br><span>First GoTo=
Meeting? Let's do a quick system check:</span><br><span><a href=3D"https://l=
ink.gotomeeting.com/system-check">https://link.gotomeeting.com/system-check<=
/a></span><br><span></span><br><span></span><br><span></span><br><span></spa=
n><br><span>_______________________________________________</span><br><span>=
Xen-devel mailing list</span><br><span><a href=3D"mailto:Xen-devel@lists.xen=
project.org">Xen-devel@lists.xenproject.org</a></span><br><span><a href=3D"h=
ttps://lists.xenproject.org/mailman/listinfo/xen-devel">https://lists.xenpro=
ject.org/mailman/listinfo/xen-devel</a></span></div></blockquote></div></bod=
y></html>=

--Apple-Mail-9C4FD1DC-650E-4FED-95CE-E43EFB1D82A8--


--===============7063307454060300863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7063307454060300863==--

