Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 866C834D493
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 18:12:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103125.196771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQuVN-0006iW-Vh; Mon, 29 Mar 2021 16:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103125.196771; Mon, 29 Mar 2021 16:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQuVN-0006i7-Rr; Mon, 29 Mar 2021 16:12:41 +0000
Received: by outflank-mailman (input) for mailman id 103125;
 Mon, 29 Mar 2021 16:12:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HZ2U=I3=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lQuVM-0006i2-3m
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 16:12:40 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7142a48-95c0-44bd-8759-051e37ae6e09;
 Mon, 29 Mar 2021 16:12:39 +0000 (UTC)
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
X-Inumbo-ID: e7142a48-95c0-44bd-8759-051e37ae6e09
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617034359;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=coNzvORoqGn9hwB4y6YvhJ8eq94OcLQZfb+UQ3GcuL0=;
  b=NlZLDBxRzACn+5Uf/DBeGlUb5qxmZvX9qNWglKyn+wjcMO84zMM8KT8S
   X201iQs/PjN4HCfcbtutnkaKgBlF6BEZPNDWQCUXpo+3Kznf/LVBfoxBJ
   upui0KsUkPyrVWektxo6UT9ox5raN/pmtvlITJaifB6xxq0YP2x3c0/4O
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: a8xsoUYfnZdf+cfrQl4T9/wnXb4JPttpwATSdMYDEcljV3Ic9Dqmga0jmV6sol4gnjG9wydyg/
 DUt8zTqT+s8lb1m33IZ0NkLcbjKTP3SQwKbMsgbBx3R+CKjBQuc50NwoYSbw24iHYHFokP3zH4
 zaHfv1xk5Lg9p1Ad/f3hb1SAaGYyQgKdKbafBXCwEezmVD9Gl+1snXJYc5rqfgIgTZ5OEKGg5A
 9lqA6sbDi0k6EPl5r08g0FlB4nzIHQ3Hab5M01qOvIRlwOZwVHK8YPqngoMbERsVHL1y7vYgRH
 AcI=
X-SBRS: 5.2
X-MesageID: 41809436
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:iu5znK2x5ThIEUSV7StSlQqjBc92eYIsi2QD101hICF9Wvez0+
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/BIyKErF/OHUBP9sGWlaLtj44zr3iH6F0TFmdJ1/Z
 xLN5JzANiYNzRHpO7x6gWgDpIEyN6I7KiniY7lvgtQZCtBApsQiztRIACdD0FwWU1nKPMCZd
 uhz+BAoCetfmlSS8y9CGUMUeSrnay1qLvNZxkaCxk7rDSUhTSz57LgVzSe1BESUzRAqI1SsV
 TtuQr/+6mlrrWH2gbRvlWjoah+tfnA7p94BMKKgtUIMTmEsGeVTaloRrHqhkFMnMiB81Av+e
 O8wSsIH8M20H/Je3HwnB2F4Xic7B8Ly1vPjWCVmmHip8uRfkN4N+NkiZhCehXUr2oM1esMq5
 5j5G6Su5pJAR6opk2UjLKkN2AIqmOOrXUviuIVhXBEOLFuEoN5loAD4FhTVK4JASOS0vF7LM
 BVEMre6PxKGGnqCEzxg2h1zNSgGlQ1ExuWK3Jyw/C97jlMkHh1i3Yf3cwU901wkq4Vdp8s3Z
 WgDo1Y0JV1CuMGZ6N0A+kMBeGtDHbWfB7KOGWOZXz6CaAuIRv22tzKyYRwwNvvVI0DzZM0lp
 iEekhfr3QOd0XnDtDL9IFX8yrKXH62UV3Wu4Rjzqk8noe5aKvgMCWFRlxrudCnue8jDsrSXO
 v2H55KHfn5Ly/LFZxS1wPzH7leQENuFPE9i5IeYRajs8jLIorluqjwa/DIPofgFj4iRyfxGX
 0GUD/vJNhR70yiV3Pi6SKhHU/FSwjax9ZdAaLa9+8cxMwmLYtXqDUYjly/+4WKJFR5w/ULVX
 o7BImivrKwpGGw82qNxX5uIABhAkFc56ilV3tLoAQNIl7laLprgaTGRUlimF+8YjNvRcLfFw
 BS435t/7isEpCWzSc+T9S9MmybiHMXrGmQT4gVn7CC4cuNQOJ+Mr8WHIhKUSnbHR18nghn7E
 1ZbhUfe0PZHjTyzbm+gIcMH+HZfdlkiAKtKcpZwEiv7nm0lIUKfD82TjSuWcmYjUISXDJSnE
 R26LJaqqGHgyyTJWw2h/kYPFVAZH+MOq9PCB2Iaexv6+rWUTA1aV3PpDSBzzkvZ2Lh9iwp9x
 LcBBzRXcuOP31wlTRz1L3w/FZ9a2OHFngAG0xSgMlaDmTJunF6zOmRQLG8ulHhNmcqyv0BMT
 3DfDsZKh5vwdfyzxKOhDOeDxwdt+YTF/2YA7I5f77J3HSxbIWOiKEdBvdRuI1oLdb0r4YwIK
 6iUh7QKDv5Du8zsjbl1koNKW1xqHM+l+nv1wCg5G+k3GQnCf66GiUte5gLZ9Wd5XPjXfCGzd
 Fwis80p/K5NiH0ZsSdwa/aKz5FJRW7mx/6c8g47ZRVt7k1rr19At3SVibJzmhO2FEmN9jv/X
 luCZhT8fTEIMtibsYScyVW8h4gk8mONlIitkjzDvUldV8ggnfHN7qykvX1gKtqBlfEqBr7OF
 GZ/SEY5fvDUieZ3bMRCq47Iw1tGQMBwWUn+PnHe5zbCQ2see0G4UGzNWWldqRBDKeCArcdo3
 9Bkqe1tv7SczC93g/evTF2eP0Tt2mmRN6/GwKKF6pD9cegNVGFn6ut54qygV7MOE+GQlVdgZ
 cAc0oaKtlHgH0lioY81yCpUKz5ok4/iTJlkHlav0+o3pLj+XvRGEFNLBbQjZpXVyRCK3Tgt7
 WxzcGIkHDmpCVf0ZbNFE1MbshDFtgZQI/wNTpvI6ErzcmV1rtqhD9CbhcoB3M9jz643/oO58
 bK5Mnv
X-IronPort-AV: E=Sophos;i="5.81,288,1610427600"; 
   d="scan'208";a="41809436"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csvkRLWttUbw0P14gg7vq/ujg3tXtfSZt2V4SWmX8QlaAqYLSEBOO44UD0tXtGd+2cODrlKwHrVoZZApOjrdUs73uCPupc1rF4FVxmyk32mOnE+bG8Vl6yzUslZlg23uw7yj6NLngf5SfQo8GTi4dqISZse75oF/MpaH81Jk+wDv17MFyuBQSfZL4B4IB9/YqeLmYHFLNG69Am/Rt4sdhJqiseD4yUhCwqYDNapxK5Hc5xbA8lC+jDTar5uDa/pluoruQi9gjUZ4lon3Ue1aAubg9ircOSkSG0XK/W1CVh/Mcs7dx+YCtztsgZykK2wXKk3ZRS7LP0abk/9ADZICBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBAMyQM4ILBRtbIPngkJISqa3U7nUEjmKwKcrPSlr7Y=;
 b=ZzIC9uRbusIg0hJtfvMYE8Il+pumZZo/nCTeMG+HS10qCXBi0b0lS34WIhLraW3bKywfiTLX9p0i/NgCxeqQqYAtkqqJREneGII3uJE9rx01CxiW+qIwbEdmulmg0Dl4bvB7UCnBId2x4Bxqcnppv/P8Z2/8xllBeHUbEDheqSSjs5aTX2rixDTTDa/0VdkqQIdyuioHTkIMf9EMqwiGekk3/1OB3YpUGz/kaup8uJvuYonbGBB+9HJ1zd4kE8aj8n9sW/PbwLnQJHStHZuniP7HN+8waqzb8LnPpmbPRYsmtHVZUmunuZg2km0NXU2b+IfSB3atarZmnxE12T+RmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBAMyQM4ILBRtbIPngkJISqa3U7nUEjmKwKcrPSlr7Y=;
 b=M5jqz0+u6/+2q/YboDflPGJCSr+khyA39E6Tpn8lgzbyAL2kz+q8p7zdx99enEAVWNB02NBWUkG0DSAT1DnKRhAjoqsS5c9ytIi/NnsJul3wgZ/B7YQqbnFpP1+9DKNq3wTrPQs/2RKYg3n+rgFT8Dqhq/tHrdsQvSAwgZLSHA4=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
CC: Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] CHANGELOG.md: Make PV shim smaller by factoring out
 HVM-specific shadow code
Thread-Topic: [PATCH] CHANGELOG.md: Make PV shim smaller by factoring out
 HVM-specific shadow code
Thread-Index: AQHXINLTS489UfL61EKD4pjlwXnfbqqUSZCAgAbMCwA=
Date: Mon, 29 Mar 2021 16:12:34 +0000
Message-ID: <FB9CBC51-5793-41DD-A331-5274E6A82AF4@citrix.com>
References: <20210324172608.302316-1-george.dunlap@citrix.com>
 <f41680a0-9415-ea2e-c1e3-db8b0552823c@suse.com>
In-Reply-To: <f41680a0-9415-ea2e-c1e3-db8b0552823c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a2d5849-19b2-4268-8369-08d8f2cd76dc
x-ms-traffictypediagnostic: PH0PR03MB5751:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB57515678E42910CE1A8779FD997E9@PH0PR03MB5751.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y8MyxVFEPMP8tBcuPWNZeJ+0ukXbS/sG6ypr0koP+F/niFrTZrdySswXhLjLdzvJyYn8FC7dyh45a18oT0nOMHHruceq8WgU1RB3Gb8eawAj9zc4lgq//CHmYEYQIHXTx49cukAM0p7dFtc6/yY0VEvA0hwzIcQi+ZBI9nGBy3WzlcPWqSOlt4XzvIn2ja1E0sPXyVLA/XKpGn2wNxl097+hokmGb9/u6/R5yOvIvijcmQ0wLRPKpuX44+ztZ0zMW/94VQ/k7m6BbLWYt+Q8+V0l3a5dgMhI0g46sEQV7GOp9GkroKFF7UMMn7wENfk7XxXFJw6p3pYVHb5NgqCijg8lcSrUO7tLqT39Q/IP/5GHzVwussIYgkZFA8QH8C4ZgMFzuSqwcnusNsiQH5Q1QK+YSNbDyXdH6fHSKiEEHnpWJ02yDLpFzIGB646pKI0M2PnY/HFyXx1Fp6G48pDp5L+AKU60QciSwxzUX/g4dykM01Q7qLqhQ1+kWRlzcWLQbLi6UNTmquijiRPuAuJO5OSxkeNCyNfVsc5LVBZlPPyuEQAd8c6DHjWFB87lT8Fqm9BTS0SBhHVFprZNanBJ7b8uOQ4N5jrHKtcyBTnmolLx424LTIbo5C/D23CyWQs2R30IWJPCUF1MSHBCAjszsj+jqgYs3g+LsH5ig5S/j0KbDbwBtZwY/yjvOvCU/oQiNTx48lHKJzmJIH7RWXAacJ44rnHA8LArfQD3mxzU1+JqbWnb5J+7bwRxBpBxVJo84XuJWPzydrgIRkJ7kuI9u1RLVNN86y6RN9FGzzDBQEZe+vixW4JIGjU3D5CQmqeB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(136003)(376002)(396003)(71200400001)(4326008)(26005)(6486002)(2906002)(54906003)(53546011)(478600001)(33656002)(4744005)(6916009)(36756003)(38100700001)(316002)(8936002)(6512007)(5660300002)(8676002)(66556008)(66446008)(66946007)(91956017)(2616005)(186003)(66476007)(64756008)(76116006)(86362001)(6506007)(207903002)(219803003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?BZQo2ZSnSdvekv69k/PVydtNEd/n3cRnOXAyRk8y9Kko3Xn9EPonHozsENcD?=
 =?us-ascii?Q?rxiFMIbIFoTZDHXes6Ry1+kIEuToiJpd/s7QPggbxIr+gEAxfCf7/WV8LKIq?=
 =?us-ascii?Q?9Ltji/Ed0IiE87l6qbehRzQQ4e+tK3Ihn3aqmhMM1fC/tJ1XeJAbgelMQSZr?=
 =?us-ascii?Q?sXRvvTPIplMn3mKUgtvMXKlUR7ki9aALsIaQEekjh1ughFVNYlMyYe8eV6Pp?=
 =?us-ascii?Q?xZj3OSBcsW0uLs+Fk41rzwoefq0WSSiCp05K+gPge3eHWiRkZ0PVLk8fOB0f?=
 =?us-ascii?Q?YjBdDfgJa75EXwFlGoavE3IyItM7Q85ynZKYMKcks9o7AcoZR+ELVunh9+rx?=
 =?us-ascii?Q?vTm6MUoXrbf0XA6e7k1SQ/8JiZICpqz75SZHf6VUJx+psManqeAwIjqsjWHk?=
 =?us-ascii?Q?xzYAKK6Md6bP/mzyF/guaiuAnwo2PFxHx9BZJ6hd7M/TTneok5qX8/qr7nct?=
 =?us-ascii?Q?qj7F4PnrdtHvNZYRYOHOiuUEAHgiLBcDXX7LgrGEZ4zEgWlBYNK09HKp3Q71?=
 =?us-ascii?Q?aBETFy0z7RISPPNgd9+TGCn8RGxdnA9K3+u+YIKUaQfi8F/iAgHn4+wxCFiy?=
 =?us-ascii?Q?OWHu+EVe7Qem2pk/d/XLJsB8v1aI4iN/++n0Il5zqY7vB9xZhl1Mgb9LfnQx?=
 =?us-ascii?Q?09Jmkt0T1heIICjJC6cBLJLwtSvBSjg3RL9yPGUI5Ryrx2HIVMumOa6UHJBK?=
 =?us-ascii?Q?bY27CNtuQ3MhebR25XE9FFcccsKrfMW13PwQpzHOngpBcnDwiUSZgJ2qn+ru?=
 =?us-ascii?Q?dE6/9jyAuf3uCpOQ7rBu8e2sqUNfWQOt5O76/xJ7aQ5WzUNA8xBqlTAbz/4d?=
 =?us-ascii?Q?HdOhrfqWSaBtBOB8jaFSuB9JujxbJ67T1Ya7dH5L/A7ftNcA9m3HjFitCtpG?=
 =?us-ascii?Q?N5SmUcAr4GQT/QZv6EL7XcYbpOIHvN7eH6pPUdVFUMbKCkyUDzmep+lhXYNG?=
 =?us-ascii?Q?irxL2gMf11Vc3efMFsK8paVFJKM3YzdfTC1RInycQdsUYRC3NUw0odhKQSjt?=
 =?us-ascii?Q?3D3v2p4dDcUhLzqdgnim5hVqt2cX9AuQtNlLkQKkLAva1qEpJn+mu5YQXddM?=
 =?us-ascii?Q?0tKZHq3of9c4nRp0oT9NATSBIjkHYJz289hjuYND9eUg/g9w12PUD024dquL?=
 =?us-ascii?Q?AwMZHLiT+Ru8mdiAr7xbbdBzhMpVkKM1r+I9ZRE26z+idznmdSnoZ4T58YtU?=
 =?us-ascii?Q?wTba57aDminrJMi0rZ+yygIjvRo0vaoSMljhxEg+tgELQO0X+kgf0AZ9v6BF?=
 =?us-ascii?Q?SvBORIQuh4eFZieFjCCAUpxHE0XDE8tS3RuIuxgUk+UA6iGAT6WPl4IRyy6h?=
 =?us-ascii?Q?g/m7DkDd04iHOvxgGk63gjLujdtesPrA7A3fycj/4WWUXw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4C72B132AE96A8419AFB7EDB5186102D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2d5849-19b2-4268-8369-08d8f2cd76dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2021 16:12:34.7911
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SxxvEmFeKMFDNTsC+9rdWTLQj9XZ5/O11sCrvhGZ0trAGHBrciqad5AXAGeMPrT7a/3218vnZDO1cI005GqLOrNkLEN/h5iygeScfm88WMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5751
X-OriginatorOrg: citrix.com



> On Mar 25, 2021, at 7:08 AM, Jan Beulich <JBeulich@suse.com> wrote:
>=20
> On 24.03.2021 18:26, George Dunlap wrote:
>> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
>> ---
>> Missed one from my list when creating the other series
>>=20
>> CC: Ian Jackson <ian.jackson@citrix.com>
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Roger Pau Monne <roger.pau@citrix.com>
>> ---
>> CHANGELOG.md | 1 +
>> 1 file changed, 1 insertion(+)
>>=20
>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>> index 15a22d6bde..49832ae017 100644
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -18,6 +18,7 @@ The format is based on [Keep a Changelog](https://keep=
achangelog.com/en/1.0.0/)
>>  - x86_emulate: Expanded testing for several instruction classes
>>  - CI loop: Add Alpine Linux, Ubuntu Focal targets; drop CentOS 6
>>  - CI loop: Add dom0less aarch64 smoke test
>> + - Factored out HVM-specific shadow code, allowing PV shim to be slimme=
r
>=20
> But shadow code doesn't get included by default in shim-exclusive
> builds (and others are unlikely to disable HVM).

Can you propose some better text please?

 -George


