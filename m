Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F5549E00C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 12:01:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261412.452598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD2WF-0004mN-SX; Thu, 27 Jan 2022 11:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261412.452598; Thu, 27 Jan 2022 11:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD2WF-0004iO-P8; Thu, 27 Jan 2022 11:00:47 +0000
Received: by outflank-mailman (input) for mailman id 261412;
 Thu, 27 Jan 2022 11:00:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CHyz=SL=citrix.com=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nD2WE-0004iI-Rx
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 11:00:47 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ecf8640-7f60-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 12:00:44 +0100 (CET)
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
X-Inumbo-ID: 5ecf8640-7f60-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643281244;
  h=from:to:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=7hbu8lTlU7Xu0v3B/Qae/O0uH/1D+H9aSehcBzrrA+8=;
  b=RGwm2EVftAJR3lBEJAfNzH3mzkW+tjqKQFJ6gnlUMWO6HbSWKPJUBXDy
   9eYieiB2p3JiIJfUijeQdGOEX8IVW9Xt1+yciFoEIA6EhTIUuGQnKlR2v
   yEIWi0QlG6G8F40nSqDY3YTptzq0ysyTs14kSKZFoa4wwQWs2Hoq3gwGF
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: JKCgzxunG7qY4c8V8sNyPf3gABmf/qyMBu1E7ZA0KrRjRNUjT5UCAQLsUfV9S2qrHm60/cEWZj
 E1+fmR40qKJMDz/2gHSZWSzvaOWMUF8NofQKztPsO0r46n2MpSGtyTfqD9KRAENogyng0HgyzK
 rWC77+N0QQ2eAxDXPiiN4iYPCx0ioyoTZ5Sew51ooerqdxD9WJBh61yLNScAwdOImnhtmmhF/o
 8DMz+xqcn4SbBrkpzJ7KM9awFgkJSbiif209es5khnO+qBe+JzCIH99OyDQ+Yp/PSTzm+N+2N0
 qofSagjLow4MFuN0CFoiibpK
X-SBRS: 5.2
X-MesageID: 62880735
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23: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
 fvDyN464o+mAnuC0g2McA31uVS7Q2Ptwjg+toI=
IronPort-HdrOrdr: A9a23:Yi+CXa6NYYgk9CK4oAPXwXmBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc0AxhIE3JAbi7SeS9qADnhOVICO4qTPuftWjdySGVxeRZg7cKrAeQfREWmtQttp
 uIEJIOR+EYb2IK9PoSiTPQe71Lobm6GciT9L7jJhxWPGRXgtRbnmBE43GgYylLrWd9dPgEPa
 vZwvACiyureHwRYMj+LGICRfL/q9rCk4+jSQIaBjY8gTP+ww+A2frfKVy1zx0eWzRAzfMJ6m
 7eiTH04a2lrrWS1gLc7WnO9J5b8eGRi+erRfb8yvT9GA+cyDpAV74RHoFqewpF5N1H3Wxa0+
 UkZS1QePibpUmhOF1d6iGdoTUImAxelkMKj2Xo2UcL6PaJOw4SGo5Pg5lUfQDe7FdltNZg0L
 hT12bcrJZPCwjc9R6NruQhx3lR5zaJSFcZ4JkuZkZkIP0jgX5q3P8i1VIQFI1FEDPx6YghHu
 UrBMbA5OxOeVffa3zCpGFgzNGlQ3x2R369MwM/k93Q1yITkGFyzkMeysBalnAc9IglQ50B4+
 jfKKxnmLxHU8dTZ6NgA+UKR9exFwX2MFrxGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhN15c2kI
 SpaiItiYfzQTOaNSSj5uw7zvn9ehTOYd228LAh23FQgMyNeIbW
X-IronPort-AV: E=Sophos;i="5.88,320,1635220800"; 
   d="scan'208";a="62880735"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XxRAVKaDVzdzdnYU/3iaxlOFmdCo7/pnXPX2Im1fvkvKGBrYwUZ2CyJtHX58mWsCAYsGeb5LOWPVilWvR4sC0vbsg2xFo8VoR4+gDY6hEWPafKWlx6sDMx6zBpdv0nY6xH/oxlRhD2q5mJcgA7dirkQVF42Wz0aIhp5QrWG4mN3MjxTK891kJZDQZgK3Wz+L787ENRL+nJGjAtRcUJ5QEpPG/QM++vaZg16sX9P0W+8M1E06gaHLZukhN/afGcecRwRqXSUVSz+rQT0HZJGJ/5v5funYAD9OXI4/96yjQdnVnJeXpru1x9uoHcJkHJm7pgMnj+lsy1231WL/n4yiGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hbu8lTlU7Xu0v3B/Qae/O0uH/1D+H9aSehcBzrrA+8=;
 b=ByjRruPlBcnSaz5+Zd7GFt/Q3zXxQN9pbbc/XTADEvVSdHr6X/aEhtjEw4g6ncqi9QVJUcIrXla5/J4k2YK1gp1yQ/L6aumdqoJmx6Xs80emlh0xfrx5Hxd41jgOB66RibNoAJifC4NRho/4LghF7Wf4EtWO5ZnmHfbyfsi5UGz4x64KRbV3s5Qg4bUbY2u1ak90ylDYxModeVR6emkvs2pI6IRbph2z2o8uqoWBKp0I0iPFohUpuP4MfHZAF4tQew37flsj3i1YHKhGVuQZGRzigU6tARh7W8H3YKwTqoaHfyPpfDINLu0KfltXiQ1pwb7eAD+aTr+Z4+OzJbqidg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hbu8lTlU7Xu0v3B/Qae/O0uH/1D+H9aSehcBzrrA+8=;
 b=mqRHwmyduF9F5TMs1BbIQ6dTvADITaeLpZP5L7gXQmREMm6cf+x7hAMNxBm7Y4or/dNycaoGMcH32IK+phT+2O9sbOE6fW4cgw8o1DBaS816DBTrib34WOFrwDyum8jc6EAGS7D3Nec6ZzI7Th8Yjr4ldexBb2+Ho4t3lMmYxkk=
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>, Tamas K Lengyel
	<tamas.k.lengyel@gmail.com>, "intel-xen@intel.com" <intel-xen@intel.com>,
	"daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
	"Christopher Clark" <christopher.w.clark@gmail.com>, Rich Persaud
	<persaur@gmail.com>, Kevin Pearson <kevin.pearson@ortmanconsulting.com>,
	Juergen Gross <jgross@suse.com>, =?utf-8?B?UGF1bCBEdXJyYW50wqA=?=
	<pdurrant@amazon.com>, "Ji, John" <john.ji@intel.com>,
	"edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>,
	"robin.randhawa@arm.com" <robin.randhawa@arm.com>, Artem Mygaiev
	<Artem_Mygaiev@epam.com>, "Matt Spencer" <Matt.Spencer@arm.com>, Stewart
 Hildebrand <Stewart.Hildebrand@dornerworks.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, "mirela.simonovic@aggios.com"
	<mirela.simonovic@aggios.com>, Jarvis Roach <Jarvis.Roach@dornerworks.com>,
	Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Ian Jackson
	<Ian.Jackson@citrix.com>, Rian Quinn <rianquinn@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLRG91ZyBHb2xkc3RlaW4=?=
	<cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, "David
 Woodhouse" <dwmw@amazon.co.uk>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQW1pdCBTaGFo?= <amit@infradead.org>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLVmFyYWQgR2F1dGFt?=
	<varadgautam@gmail.com>, Brian Woods <brian.woods@xilinx.com>, Robert Townley
	<rob.townley@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQ29yZXkgTWlueWFyZA==?=
	<cminyard@mvista.com>, Olivier Lambert <olivier.lambert@vates.fr>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Ash Wilding <ash.j.wilding@gmail.com>,
	Rahul Singh <Rahul.Singh@arm.com>, =?utf-8?B?UGlvdHIgS3LDs2w=?=
	<piotr.krol@3mdeb.com>, Brendan Kerrigan <brendank310@gmail.com>, "Thierry
 Laurion (Insurgo)" <insurgo@riseup.net>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Deepthi <deepthi.m@ltts.com>, Scott Davis
	<scottwd@gmail.com>, Ben Boyd <ben@exotanium.io>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: [ANNOUNCE] Call for agenda items for 1 February Community Call @ 1600
 UTC
Thread-Topic: [ANNOUNCE] Call for agenda items for 1 February Community Call @
 1600 UTC
Thread-Index: AQHYE20cy5jWYSei1EqhhPoTiZmPsA==
Date: Thu, 27 Jan 2022 11:00:35 +0000
Message-ID: <32874B66-E1C5-469B-98D7-FC50392C0F79@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5088dfdd-c23c-4d83-b3a5-08d9e1843eda
x-ms-traffictypediagnostic: DM4PR03MB5998:EE_
x-microsoft-antispam-prvs: <DM4PR03MB59987EA165F121957707D83E99219@DM4PR03MB5998.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EbwupPKmTUkeFUBAdvkxJJWk3u+UXgQpbKQbrujfykic9Toc7g20cDRlZnX72a7OETnB6nWmJIH84f9D3VmYvZRcO0LsQdExqSMyIQjtefDkVzHc8EeaPGRyyJyQm17p8+tXB1zuibum3d0VCgbBK7MvN+c3GibU9p6rOw77Fpq7CaNwcwjUnpBbXbKX1H1S5xB4uPue7gwahojzEMbtJEYukiHmLaICwulduCy1e2tnOJauLEbQnOMScbGXGBOndciVbAC4uU7qsRMjJonemFWwrdpRj8brW7PIddn8BXyJHqbPx6nOyRIKs7eSoayeZEW/yiaIHvb0kzx9bH9u/YbDjvL8U46WNUQWSqTuzpDShZx3MTlh7XnBaHLvHROZtHJWjswtbhMYY6R3fAn5H4aQqpChhb5rVBfb2OTnO/cEyaYYtPBj3oHv81oxJr0DN1GorXo3rAMpfhqrIxuiEtmq1Z1x6+vbeth4dmKllRlzc+SNaXAfG0PwD6/Y3Et2fz8UKEmxELraj+oa5YfMPlRhbLi76LfpawZTor6o1w0VYQR+gEOWKFY3moC3+DgnJsNvpr968Twq+0+MJNSTPZ7Y13fp+n81MbJM7FcevdrZHqkLQJAbQ5S/ZsjklmMbV6FvN0QkDh43TlJdVYV50DqDpWiZ0Cy53Y8LtwfZ96k40k1JSQcgqcvclMItT6KKgKURNKOIT9z5hIP0KPeWJKqBSPe3NGIzZ0YePUKMm2DGA/lFtBslfSxxKmT1LZCDEXQckMWzRLh7pQI2jnvZXGZ5GesAluFLTsc7ngTNSgesf9NY3r7iZ8T2Yd09ZaNFqTIb++G5L9XVKOsngSkWwQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(110136005)(2906002)(6636002)(2616005)(26005)(508600001)(186003)(6512007)(7416002)(7406005)(86362001)(5660300002)(966005)(6486002)(36756003)(91956017)(76116006)(66946007)(8936002)(8676002)(66556008)(66476007)(66446008)(64756008)(83380400001)(316002)(38070700005)(71200400001)(921005)(6506007)(82960400001)(33656002)(122000001)(38100700002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVlmL2JmWWZuSWFVYmhPdGd3RDhKNmM5RDBhbDZkVm1YNGpObHYyTzZhNUlu?=
 =?utf-8?B?V3pJazAyQ25Ua0VFNWdhYWhLL2hlWFVHMDRGVkJ6a1pURGcrdnRqZEo3d01W?=
 =?utf-8?B?bEh5ZVJ4TjVIa0pZL3B5SSs2dnhRTVRYOURQQWh4U3dxNUVPSE9wYzk4ZnRY?=
 =?utf-8?B?cG5vUXVSTlFWL3R3QjcwMUx6Z0t2T29rOStIWnV6OFdRWmREZWkzSUFmcGZJ?=
 =?utf-8?B?L0lSZnpudGpIRkZHUWd4RmU4U2tCUjNFKzMyeVdlc21yL0NTYmlMaGRzbUU4?=
 =?utf-8?B?U3o1bjlrakJwd01Vd0I0c25oR3c2ZTNMZjE1L0ptelpiOHdzaVJOTmlFQ3cw?=
 =?utf-8?B?anRkTUc4c0wxYU03OFNHU3FCMm5kOFB2QXZoQ2NBNlE4elNzcjBlT2FkTjRt?=
 =?utf-8?B?c1QyclgxU2FCR3Q0d1dLQU9kNnB4WWJyQ1prTlBRd2p6bXJ0cU0yNUFkNGNE?=
 =?utf-8?B?a3duZnRSSitoWU9vbGpmSUtRVkpvMGkxZFVPT0t6RDh4cnY0QkxvZEZsTDQv?=
 =?utf-8?B?YTZjRWRUa0E0Y3RyakJDTGZNZGJWeXpSVVhsWWppZnA0ajJWL1VBYk9kZ0N5?=
 =?utf-8?B?dUJiWnBoR1dGT1lHL3F6a1BORnp0N3RuTXhMN1hTU3BOWnZCWjlkMUdVTElC?=
 =?utf-8?B?MWdTYU5sd1JOVzdjWHpZVEF5blpHMzhJOEphTFRzeGVLdkhmR3JJcThoYTVI?=
 =?utf-8?B?L1F0L3FNY2ZReGpTTGxrMHRhbmpnNXRrNUYxdjFhZnZVbi9vYVAwZTkzNXhl?=
 =?utf-8?B?ajNTeGRwMU5CdWZuNEZtbVE5UE85N2w2SlA4TktlSSs2MWFKZjcyOHdBcGhE?=
 =?utf-8?B?MGhwaXVXMHdMU2I1MTR2b3NLenVkcDhFVys4OUhSeWtkS1BDNHcwSDgyWng2?=
 =?utf-8?B?WWNrTUw2dVJrYklDdkUvdDlRL09QbHh3ek4yL3A2UHZEdzY4d2o4bXZtNkpP?=
 =?utf-8?B?QUZselZaNHFBMmZOSjZSZVY2K3p1Szk5bTdNZlhPN1RQQ3lLTnNiM3QwN082?=
 =?utf-8?B?ZmxvTHNTVjFhQ3V3dWdCbjBKbTBnMklxemlYa0hpcG05ZWdWSEZSbXBRZDFN?=
 =?utf-8?B?b0Y4QXE3RExnY1BDc1dsblZyQlYvL3UxSGhkN1h3eWVBaGhrOFRPNytsanJj?=
 =?utf-8?B?byt3UjFtayt5Qm5OWElqZFNlcXFRcTVqL3NTWHhKR0VJeXlTZ2hjbkNYVUs3?=
 =?utf-8?B?bmhvUmpwbVBhaEJQMGdWYzFSbngyQ1prK214cEpVUW02R1FTNzFPYk1DTnh4?=
 =?utf-8?B?K29jRlhJNm1NUzFoeXpUdjJxVTIrcEVDUE9IOXdKMG9JalBSdDQ2TFdjZkxS?=
 =?utf-8?B?bitLRUZub25LR2hyR0lwVkt6RzkvZEpkY3BHcjNqaFFTbDVhYmpFUktDM1g4?=
 =?utf-8?B?WVlheWliME9WNk45REpnZzd4OHB6U2w4dHNlWW12U0V3YW9KNzU2WjBTSlht?=
 =?utf-8?B?QURDOGdTZjhnaDFPS0NpV2xyYmZtdGo2Tk9aUUJzWFdDSENaTkxWNHkrUm5P?=
 =?utf-8?B?MngyeEpzTXYvMkkxQVRRZkpkaXZiTzNjYTlqaUJERkRWekRROFlXOTFKcllP?=
 =?utf-8?B?WjJQL2g0MzNrMGJRQTVab2UxM1htV1hUblgwMXVjeFkxQzV0TUc0b1VnK0JW?=
 =?utf-8?B?UmlNOElHTERWRWphOG5tdHk3cW1NSk52NzJuMU9PZ0NrMnJYRlFRWURjb1B5?=
 =?utf-8?B?bWhQczNwaVBPNTFjQ1NNdXkvc2puWnB6UVN0clp1ek5Bb09CSCtjUUlPOFpT?=
 =?utf-8?B?aitrcC8zcGc4RmQ1SUlTRjRXcm54K3JSdllJaEpmZFk5SjR3QTE5bTJxV3l2?=
 =?utf-8?B?TFpaclh3czNsSGpQNE5xMFJSR3FkcUcvczRRNXJWSkMzM1RkdXNiRWNITDdk?=
 =?utf-8?B?UlRMVGNPYWJ2cUs4UWdCT2FDRnJDOVliaG5xZUthbEtMYWpMSjZxeEcyVEpi?=
 =?utf-8?B?L1pRZURLM3lGcjdYaG9vbXRJeHREdDFNS0lmUzI3SEY5em5XWDhiazB2SWsw?=
 =?utf-8?B?ZU9OQ3YxMW0rcHRPVUNTRCtpYnNsd2UwQWtiakJFYkFaK05NZzdFNW44TTgx?=
 =?utf-8?B?UjRmNmVmcEY4TEEzMXBWcFliQlRmSnAwa1RvN3JFR3BINVlPbGEzSDArNXlq?=
 =?utf-8?B?OGZNYmlzQnRRT1FIZXFXalcvdWw0SXJBMVJLQXo2UzUyVnIvRzlFMUJVMWpH?=
 =?utf-8?B?UG8yQWIxYXFZTkVSaDUwTlduSGxJMzZLNFpyZjdSTi9MT3hRWk1HWW9VcTNO?=
 =?utf-8?Q?gFMTxooBIeVeu7MycC5pimSrzD9QjibF6n5OnR9atw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <63AD173B395F5D499241D602A4E42EBB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5088dfdd-c23c-4d83-b3a5-08d9e1843eda
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2022 11:00:35.4057
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JMtl2yJnbGF2tse10zzkXL42WWdymityAYV/94MKGUoEIlh3e5dtHzYl81dThAr78ROIMmLA5lie0gY2GJMlnaKtsaF4TUK1LfWkuu17gO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5998
X-OriginatorOrg: citrix.com

SGkgYWxsLA0KDQpUaGUgcHJvcG9zZWQgYWdlbmRhIGlzIGluIGh0dHBzOi8vY3J5cHRwYWQuZnIv
cGFkLyMvMi9wYWQvZWRpdC9JT2VNKzk0SWZ0RFowQnl1LTBhUjluMEQvIGFuZCB5b3UgY2FuIGVk
aXQgdG8gYWRkIGl0ZW1zLiAgQWx0ZXJuYXRpdmVseSwgeW91IGNhbiByZXBseSB0byB0aGlzIG1h
aWwgZGlyZWN0bHkuDQoNCkFnZW5kYSBpdGVtcyBhcHByZWNpYXRlZCBhIGZldyBkYXlzIGJlZm9y
ZSB0aGUgY2FsbDogcGxlYXNlIHB1dCB5b3VyIG5hbWUgYmVzaWRlcyBpdGVtcyBpZiB5b3UgZWRp
dCB0aGUgZG9jdW1lbnQuDQoNCk5vdGUgdGhlIGZvbGxvd2luZyBhZG1pbmlzdHJhdGl2ZSBjb252
ZW50aW9ucyBmb3IgdGhlIGNhbGw6DQoqIFVubGVzcywgYWdyZWVkIGluIHRoZSBwZXJ2aW91cyBt
ZWV0aW5nIG90aGVyd2lzZSwgdGhlIGNhbGwgaXMgb24gdGhlIDFzdCBUdWVzZGF5IG9mIGVhY2gg
bW9udGggYXQgMTYwMCBCcml0aXNoIFRpbWUgKGVpdGhlciBHTVQgb3IgQlNUKQ0KKiBJIHVzdWFs
bHkgc2VuZCBvdXQgYSBtZWV0aW5nIHJlbWluZGVyIGEgZmV3IGRheXMgYmVmb3JlIHdpdGggYSBw
cm92aXNpb25hbCBhZ2VuZGENCg0KKiBUbyBhbGxvdyB0aW1lIHRvIHN3aXRjaCBiZXR3ZWVuIG1l
ZXRpbmdzLCB3ZSdsbCBwbGFuIG9uIHN0YXJ0aW5nIHRoZSBhZ2VuZGEgYXQgMTY6MDUgc2hhcnAu
ICBBaW0gdG8gam9pbiBieSAxNjowMyBpZiBwb3NzaWJsZSB0byBhbGxvY2F0ZSB0aW1lIHRvIHNv
cnQgb3V0IHRlY2huaWNhbCBkaWZmaWN1bHRpZXMgJmMNCg0KKiBJZiB5b3Ugd2FudCB0byBiZSBD
QydlZCBwbGVhc2UgYWRkIG9yIHJlbW92ZSB5b3Vyc2VsZiBmcm9tIHRoZSBzaWduLXVwLXNoZWV0
IGF0IGh0dHBzOi8vY3J5cHRwYWQuZnIvcGFkLyMvMi9wYWQvZWRpdC9EOXZHemloUHh4QU9lNlJG
UHowc1JDZisvDQoNCkJlc3QgUmVnYXJkcw0KR2VvcmdlDQoNCg0KDQo9PSBEaWFsLWluIEluZm9y
bWF0aW9uID09DQojIyBNZWV0aW5nIHRpbWUNCjE1OjAwIC0gMTY6MDAgVVRDDQpGdXJ0aGVyIElu
dGVybmF0aW9uYWwgbWVldGluZyB0aW1lczogaHR0cHM6Ly93d3cudGltZWFuZGRhdGUuY29tL3dv
cmxkY2xvY2svbWVldGluZ2RldGFpbHMuaHRtbD95ZWFyPTIwMjImbW9udGg9MDImZGF5PTEmaG91
cj0xNiZtaW49MCZzZWM9MCZwMT0xMjM0JnAyPTM3JnAzPTIyNCZwND0xNzkNCg0KDQojIyBEaWFs
IGluIGRldGFpbHMNCldlYjogaHR0cHM6Ly9tZWV0LmppdC5zaS9YZW5Qcm9qZWN0Q29tbXVuaXR5
Q2FsbA0KDQpEaWFsLWluIGluZm8gYW5kIHBpbiBjYW4gYmUgZm91bmQgaGVyZToNCg0KaHR0cHM6
Ly9tZWV0LmppdC5zaS9zdGF0aWMvZGlhbEluSW5mby5odG1sP3Jvb209WGVuUHJvamVjdENvbW11
bml0eUNhbGw=

