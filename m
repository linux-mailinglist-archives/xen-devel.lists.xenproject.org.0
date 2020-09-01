Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B227258E50
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 14:40:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kD5ZN-0000Yl-RT; Tue, 01 Sep 2020 12:39:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0zDg=CK=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1kD5ZN-0000Yg-2H
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 12:39:25 +0000
X-Inumbo-ID: d8236c96-cc44-4796-8a52-2288c3e27cb5
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8236c96-cc44-4796-8a52-2288c3e27cb5;
 Tue, 01 Sep 2020 12:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598963963;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v1OnTYwdZAVOdE4cPskwSFeR5FLEKe36Ia99L1jWdrw=;
 b=GCq5McDQdWamOSC6Ol/PFv44B33EFfb2oG3DqDq0sMEsS1cVFZLraJsu
 Xhf5aIXTN9KBkTTvkzh673Qf+iBKA/lix8YbFQcBZUArzLLl9CKu5uaDx
 1rGsRKNm/Z0vxlvt6y2T+3cMaTOvA8rY1bX5heITHeylaOry0c6euhYzP A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: M5ES8QIa+1iSvmtgqSeHuy61iDsFwPjxCNRO3huw3jspXRJ18HXE26J1fpDzmkSoT+3dTSrCBw
 ZqgMr709uBzmop3HtEKZ2TtIKqDudJ0asJR82uGZweq2x3lNDwxT03fs28srKK9LsC3HAYAw4v
 ge8f9fuKCX9qOG3wHe0gqpPbKPpzoAy+2vrGXmTWr1OeZ7Ef5C0XjbBQl/a9EtdlAFHl2ygvh4
 dTsg1CZV6tCMvjcBURM6IFmj9YBKUtlhxKn1CCVpoX8S4iXAqVMngEIv6TjIRrGG2XPDNs4xzg
 v6A=
X-SBRS: 2.7
X-MesageID: 26065456
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,379,1592884800"; d="scan'208";a="26065456"
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Ian Jackson <Ian.Jackson@citrix.com>, "dave@recoil.org" <dave@recoil.org>, 
 "wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH v4 2/4] Map: backport find_opt/update from 4.06
Thread-Topic: [PATCH v4 2/4] Map: backport find_opt/update from 4.06
Thread-Index: AQHWfJh3uKZDw4ZJUUWej1tdtQi326lNL7ixgAB7CoCABhSSWw==
Date: Tue, 1 Sep 2020 12:39:19 +0000
Message-ID: <1598963959153.45215@citrix.com>
References: <cover.1598548188.git.edvin.torok@citrix.com> ,
 <72b1f39ce900870819630cc7ba5bcb1f6610de77.1598548188.git.edvin.torok@citrix.com>
 <1598603415021.35327@citrix.com>,
 <b94cd2ad099486678609909e12b045c54abb2f27.camel@citrix.com>
In-Reply-To: <b94cd2ad099486678609909e12b045c54abb2f27.camel@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

Thanks for this interesting experiment. My recollection was correct that ex=
ceptions are very fast but only if you don't capture stack traces (which we=
 we do capture). With backtraces the difference is not massive. It still do=
es pay off to use exceptions when they are raised rarely as the it saves th=
e lookup for mem(). And moving to OCaml 4.06 improves performance.=0A=
=0A=
-- C=0A=
________________________________________=0A=
From: Edwin Torok=0A=
Sent: 28 August 2020 18:43=0A=
To: Christian Lindig; xen-devel@lists.xenproject.org=0A=
Cc: Ian Jackson; dave@recoil.org; wl@xen.org=0A=
Subject: Re: [PATCH v4 2/4] Map: backport find_opt/update from 4.06=0A=
=0A=
On Fri, 2020-08-28 at 10:30 +0200, Christian Lindig wrote:=0A=
> +let find_opt k t =3D=0A=
>=0A=
> +       (* avoid raising exceptions, they can be expensive *)=0A=
>=0A=
> +       if mem k t then Some (find k t) else None=0A=
>=0A=
>=0A=
>=0A=
> I disagree with this argument. Exceptions in OCaml are cheap because=0A=
> they don't walk the stack and cut to the exception handler directly.=0A=
> Is there a reason why they could be expensive here? In any case, the=0A=
> code is correct.=0A=
>=0A=
=0A=
Interesting question, it is best to measure.=0A=
=0A=
The answer depends on whether the key is found or not in the map.=0A=
I'll change the impl to the one with find+catch, I think we  might be=0A=
looking up keys that are present more often than those that are missing=0A=
(although the 4.06 series will make this moot, 4.06 version is faster=0A=
than both approaches, regardless whether key is present or not).=0A=
=0A=
To sum up the measurements below:=0A=
If the key is not found then my approach is faster (takes only 80% of=0A=
time), if the key is found then find+catch is faster (again an approx=0A=
80% of the time taken).=0A=
=0A=
I based my comment on the documentation of raise_notrace, which says:=0A=
"A faster version raise which does not record the backtrace.",=0A=
which implies that recording the backtrace has a measurable perf=0A=
impact.=0A=
One could argue that if performance matters backtraces should be turned=0A=
off in production, but I think the value of having backtraces when some=0A=
hard-to-reprodue bug occurs outweights any perf penalty.=0A=
We should try to use exceptions only for unexpected situations though,=0A=
not finding a value in a map doesn't qualify.=0A=
=0A=
See the attachment for a small micro-benchmark:=0A=
$ dune exec --profile=3Drelease -- ./updatet.exe raise=0A=
Estimated testing time 20s (2 benchmarks x 10s). Change using '-quota'.=0A=
=82=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=88=80=80=80=80=80=80=80=80=
=80=80=88=80=80=80=80=80=80=80=80=80=80=80=80=83=0A=
=81 Name          =81 Time/Run =81 Percentage =81=0A=
=86=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=8A=80=80=80=80=80=80=80=80=
=80=80=8A=80=80=80=80=80=80=80=80=80=80=80=80=87=0A=
=81 raise         =81  33.52ns =81    100.00% =81=0A=
=81 raise_notrace =81  19.16ns =81     57.16% =81=0A=
=84=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=89=80=80=80=80=80=80=80=80=
=80=80=89=80=80=80=80=80=80=80=80=80=80=80=80=85=0A=
=0A=
So raising with a backtrace is measurably slower, taking the backtrace=0A=
spends some CPU cycles.=0A=
=0A=
$ dune exec --profile=3Drelease -- ./updatet.exe find-opt=0A=
Estimated testing time 1m30s (9 benchmarks x 10s). Change using '-=0A=
quota'.=0A=
=82=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=
=80=80=88=80=80=80=80=80=80=80=80=80=80=88=80=80=80=80=80=80=80=80=80=80=80=
=80=83=0A=
=81 Name                     =81 Time/Run =81 Percentage =81=0A=
=86=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=
=80=80=8A=80=80=80=80=80=80=80=80=80=80=8A=80=80=80=80=80=80=80=80=80=80=80=
=80=87=0A=
=81 find_opt 4.06:10         =81  49.10ns =81     24.06% =81=0A=
=81 find_opt 4.06:100        =81 115.38ns =81     56.55% =81=0A=
=81 find_opt 4.06:1000       =81 161.27ns =81     79.03% =81=0A=
=81 find_opt=3Dmem+find:10     =81  50.48ns =81     24.74% =81=0A=
=81 find_opt=3Dmem+find:100    =81 110.39ns =81     54.10% =81=0A=
=81 find_opt=3Dmem+find:1000   =81 162.48ns =81     79.63% =81=0A=
=81 find_opt=3Dfind+catch:10   =81  89.10ns =81     43.67% =81=0A=
=81 find_opt=3Dfind+catch:100  =81 160.80ns =81     78.80% =81=0A=
=81 find_opt=3Dfind+catch:1000 =81 204.04ns =81    100.00% =81=0A=
=84=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=
=80=80=89=80=80=80=80=80=80=80=80=80=80=89=80=80=80=80=80=80=80=80=80=80=80=
=80=85=0A=
=0A=
=0A=
4.06 and mem+find take 80% of the time of find+catch.=0A=
=0A=
But of course if the key is actually found in the map then we have=0A=
this:=0A=
edwin@edvin-tower:~/uex % dune exec --profile=3Drelease -- ./updatet.exe=0A=
find-opt-found=0A=
Estimated testing time 1m30s (9 benchmarks x 10s). Change using '-=0A=
quota'.=0A=
=82=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=
=80=80=88=80=80=80=80=80=80=80=80=80=80=88=80=80=80=80=80=80=80=80=80=88=80=
=80=80=80=80=80=80=80=80=80=80=80=83=0A=
=81 Name                     =81 Time/Run =81 mWd/Run =81 Percentage =81=0A=
=86=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=
=80=80=8A=80=80=80=80=80=80=80=80=80=80=8A=80=80=80=80=80=80=80=80=80=8A=80=
=80=80=80=80=80=80=80=80=80=80=80=87=0A=
=81 find_opt 4.06:10         =81  38.38ns =81   2.00w =81     52.65% =81=0A=
=81 find_opt 4.06:100        =81  20.66ns =81   2.00w =81     28.35% =81=0A=
=81 find_opt 4.06:1000       =81  20.63ns =81   2.00w =81     28.30% =81=0A=
=81 find_opt=3Dmem+find:10     =81  72.89ns =81   2.00w =81    100.00% =81=
=0A=
=81 find_opt=3Dmem+find:100    =81  39.06ns =81   2.00w =81     53.59% =81=
=0A=
=81 find_opt=3Dmem+find:1000   =81  39.07ns =81   2.00w =81     53.60% =81=
=0A=
=81 find_opt=3Dfind+catch:10   =81  49.54ns =81   2.00w =81     67.97% =81=
=0A=
=81 find_opt=3Dfind+catch:100  =81  33.01ns =81   2.00w =81     45.29% =81=
=0A=
=81 find_opt=3Dfind+catch:1000 =81  32.97ns =81   2.00w =81     45.23% =81=
=0A=
=84=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=
=80=80=89=80=80=80=80=80=80=80=80=80=80=89=80=80=80=80=80=80=80=80=80=89=80=
=80=80=80=80=80=80=80=80=80=80=80=85=0A=
=0A=
In this case find+catch is faster.=0A=
=0A=
And here is update for a key that is not present:=0A=
$ dune exec --profile=3Drelease -- ./updatet.exe update=0A=
Estimated testing time 1m30s (9 benchmarks x 10s). Change using '-=0A=
quota'.=0A=
=82=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=
=80=80=80=80=80=80=80=80=80=80=80=88=80=80=80=80=80=80=80=80=80=80=88=80=80=
=80=80=80=80=80=80=80=88=80=80=80=80=80=80=80=80=80=80=80=80=83=0A=
=81 Name                              =81 Time/Run =81 mWd/Run =81 Percenta=
ge =81=0A=
=86=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=
=80=80=80=80=80=80=80=80=80=80=80=8A=80=80=80=80=80=80=80=80=80=80=8A=80=80=
=80=80=80=80=80=80=80=8A=80=80=80=80=80=80=80=80=80=80=80=80=87=0A=
=81 update 4.06:10                    =81  79.96ns =81  24.00w =81     17.2=
7% =81=0A=
=81 update 4.06:100                   =81 171.96ns =81  48.00w =81     37.1=
5% =81=0A=
=81 update 4.06:1000                  =81 243.95ns =81  66.00w =81     52.7=
0% =81=0A=
=81 update=3Dfind+catch+add/remove:10   =81 183.46ns =81  24.00w =81     39=
.63% =81=0A=
=81 update=3Dfind+catch+add/remove:100  =81 340.00ns =81  48.00w =81     73=
.45% =81=0A=
=81 update=3Dfind+catch+add/remove:1000 =81 462.89ns =81  66.00w =81    100=
.00% =81=0A=
=81 update=3Dmem+find+add/remove:10     =81 126.06ns =81  24.00w =81     27=
.23% =81=0A=
=81 update=3Dmem+find+add/remove:100    =81 274.79ns =81  48.00w =81     59=
.36% =81=0A=
=81 update=3Dmem+find+add/remove:1000   =81 401.62ns =81  66.00w =81     86=
.76% =81=0A=
=84=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=
=80=80=80=80=80=80=80=80=80=80=80=89=80=80=80=80=80=80=80=80=80=80=89=80=80=
=80=80=80=80=80=80=80=89=80=80=80=80=80=80=80=80=80=80=80=80=85=0A=
=0A=
Here 4.06 is a clear win, and mem+add is faster than find+catch+add.=0A=
Estimated testing time 1m30s (9 benchmarks x 10s). Change using '-=0A=
quota'.=0A=
=82=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=
=80=80=80=80=80=80=80=80=80=80=80=88=80=80=80=80=80=80=80=80=80=80=88=80=80=
=80=80=80=80=80=80=80=88=80=80=80=80=80=80=80=80=80=80=80=80=83=0A=
=81 Name                              =81 Time/Run =81 mWd/Run =81 Percenta=
ge =81=0A=
=86=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=
=80=80=80=80=80=80=80=80=80=80=80=8A=80=80=80=80=80=80=80=80=80=80=8A=80=80=
=80=80=80=80=80=80=80=8A=80=80=80=80=80=80=80=80=80=80=80=80=87=0A=
=81 update 4.06:10                    =81  72.76ns =81  24.00w =81     31.2=
5% =81=0A=
=81 update 4.06:100                   =81 164.69ns =81  48.00w =81     70.7=
4% =81=0A=
=81 update 4.06:1000                  =81 232.79ns =81  66.00w =81    100.0=
0% =81=0A=
=81 update=3Dfind+catch+add/remove:10   =81 133.24ns =81  23.00w =81     57=
.24% =81=0A=
=81 update=3Dfind+catch+add/remove:100  =81 118.76ns =81  35.00w =81     51=
.02% =81=0A=
=81 update=3Dfind+catch+add/remove:1000 =81 161.22ns =81  59.00w =81     69=
.26% =81=0A=
=81 update=3Dmem+find+add/remove:10     =81 156.29ns =81  23.00w =81     67=
.14% =81=0A=
=81 update=3Dmem+find+add/remove:100    =81 122.98ns =81  35.00w =81     52=
.83% =81=0A=
=81 update=3Dmem+find+add/remove:1000   =81 161.53ns =81  59.00w =81     69=
.39% =81=0A=
=84=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=
=80=80=80=80=80=80=80=80=80=80=80=89=80=80=80=80=80=80=80=80=80=80=89=80=80=
=80=80=80=80=80=80=80=89=80=80=80=80=80=80=80=80=80=80=80=80=85=0A=
=0A=
Interestingly here the 4.06 implementation is actually slower and not=0A=
much difference between my other two.=0A=
=0A=
Best regards,=0A=
--Edwin=0A=

