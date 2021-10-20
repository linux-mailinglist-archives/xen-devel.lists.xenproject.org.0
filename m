Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2639434681
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 10:09:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213662.371949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md6f3-0007Ls-27; Wed, 20 Oct 2021 08:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213662.371949; Wed, 20 Oct 2021 08:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md6f2-0007K1-Uf; Wed, 20 Oct 2021 08:09:20 +0000
Received: by outflank-mailman (input) for mailman id 213662;
 Wed, 20 Oct 2021 08:09:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ou1c=PI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1md6f1-0007Jv-Ou
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 08:09:19 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e01e095d-3766-45b9-99cf-de3af101dcb9;
 Wed, 20 Oct 2021 08:09:17 +0000 (UTC)
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
X-Inumbo-ID: e01e095d-3766-45b9-99cf-de3af101dcb9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634717357;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=XPRBa4Xq/3Gk/xNVRMfKa4ZGJR8mMxorgEhLvJ/QwRc=;
  b=UJFXAScXYOeF2EUR8aMBhvKCQJlR+gXxd6TWXQnYLc0W6IYW21eOkoUs
   iQd1wrHTZYu2dWlyiFO9NlO5JfQl6g1MwXaTW6H6MJDP44luSJ7ojPLVj
   AtdP30Js3gBe/wAxxNDUFpFw6iiSDwbTEC/bwnNfrByoj+NJcYEPzrk2/
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 42WFowZyT0ZW7REpZp4ggEO6cV7Fzu9GGTJGDfwLPM6tZz7vQmSIDPDmh5SFznL4zCGZnq8V2J
 0Yo0i25D/wgqDzEmZVgxyLLYuqNQEuUKrfCSywjfIbtVPgcZQsS6SegQLdwkDrzhAlTPLQ9QZQ
 N7gMhe/q/+jvOVNEwlB3lWJYnKRznb4abDvLNEJZHA3TPAvOJQ3dQ+rQvJzeRAi3CivUN8Gn03
 auVww7j+1I0YOkJy9p/7vegX66iEK9r/q3LE5vTQTu4n9B6zg0kMrv4gj9k/ppZoQkSNxHUQjd
 hAnOp02+jh2XrE88HkLdmC4e
X-SBRS: 5.1
X-MesageID: 55170763
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:F2zjuKKyzKKu2+CBFE+R1JMlxSXFcZb7ZxGr2PjKsXjdYENS0mRUz
 GEXC2qDa/mMMGT2KYgnaN619k5XuJTdx4JqTwplqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Eo5w7Zg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2XnNBcy
 YkUpaefRFc2P6L+wbwyc1phRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2XuIYHhGhu3aiiG96BY
 ZobbAR9US3hahd1EXInL5MApMCR0yyXnzpw9wvO+PtfD3Lo5DJ21L/hId/EYOugTM9enlubj
 m/e9mG/CRYfXPSd1D6E/3SEluLJ2yThV+o6Fre16/pri1273XEIBVsdUl7TieGwl0qWS99Zb
 UsO9UIGsqwa5EGtCN7nUHWQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OccSCY2z
 FaPk5XMDCZ2rbyOYXuH8/GfqjbaESkKL0cSaCkcVwwH7tL/5oYpgXrnVc1/GaS4itn0HzDYw
 D2QqiU6wbIJgqYj8KG2/kvOhT62kbHPQhQo/QXcXm+j7QRRaZasYsqj7l2z0BpbBN/HFB/b5
 iFCwpXAqrBVZX2QqMCTaPsOHJyou6+VCxLR0UFuEKt4rxuNuEf2KOi8/wpCDEtuN88Ffxrgb
 0nSpR5d6fdvAZe6UUNkS9nuU5pynMAMAfygD6qONoMfPfCdYSfepHk2DXN8yVwBh6TFfUsXA
 pycbdq3RUgTDaBq3VJarM9MjOd1mEjSKY7VLK0XLihLM5LCOxZ5qp9faTNii9zVCove/G05F
 P4Eb6O3J+13CrGWX8Uu2dd7wao2BXY6H4vqjMdca/SOJAFrcEl4VaSNn+1wI9Y5x/0M/gstw
 p1bchUEoLYYrSafQThml1g5MO+/NXqBhSNT0dMQ0aaAhCF4PNfHAFY3fJorZ7g3nNGPPtYvJ
 8Tpj/6oW6wVIhyeomx1RcCk8ORKKUT67SrTbnHNSGVuIPZdq/nhp4aMkv3Hr3JVUEJadKIW/
 tWd6+8sacBdF188UpuONKjHIpHYlSF1pd+elnDge7F7UE7t7JJrO2r2iPo2KNsLMhLN2n2R0
 AP+PPvSjbKlT1Yd/IabiKaagZ2uFuciTENWE3OCteS9NDXA/3rlyohFCb7acTfYXWLy2aOje
 eQKkK2sbKxZxA5H49hmDrJm7aMi/N+z9bVU+RtpQSfQZFOxB7I+fnTfhZtTtrdAz6NysBetX
 h7d4cFTPLiEYZu3EFMYKAc/QP6E0PUYxmvb4fgveR2o7y5r5ruXF05VOkDU2iBaKbJ0NqIjw
 Psg55FKu1Du1EJyP4/f3C5O9mmKIngRaIkdt8kXUN3xlw4m6lBeepiAWCX4146CNodXOU4wL
 z7K2Keb3+ZAxlDPemYYHGTW2bYPnowHvR1HwQNQJ1mNndaZ1PY70AcIrGYyRwVRiB5Gz/hyK
 i5gMEgsffeC+DJhhc5iWWGwGl4eWE3FqxKpk1ZZxnfES0SIV3DWKDxvMOmAy0kV7mZAc2UJ5
 7qf0mvkDW7nccyZMvHegqK5RygPleBMyzA=
IronPort-HdrOrdr: A9a23:iDtA66GCa5iJcydLpLqFe5HXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HnBEClewKgyXcT2/hsAV7CZnidhILMFuBfBOTZsljd8kHFh4pgPO
 JbAtdD4b7LfChHZKTBkXGF+r8bqbHtms3Y5pa9vgRQpENRGtpdBm9Ce3em+yZNNXB77PQCZf
 2hDp0tnUvfRZ1bVLX2OlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mKryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idkrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT6vDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amKazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCd2B9vSyLeU5nlhBgq/DT1NU5DWStuA3Jy+/B96gIm3kyQlCAjtYoidnRpzuN0d3AL3Z
 WcDkzE/Is+OfP+VpgNcdvpd/HHQ1AlcSi8Ql56Hm6XYJ3vG0i94aIfs49Fqd1DRvQzve0Pcd
 L6IQtliVI=
X-IronPort-AV: E=Sophos;i="5.87,166,1631592000"; 
   d="scan'208";a="55170763"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzNLjj48hRNf7hhSyN7JUh6cuL3L9YelDo84r4X1zXAxb7T/M3rKPNkrkz+mtHhs2ekEq7iRw85E8E8WZuxd5pkPFgpQXUMd9I6e+Hf+3nCkLIILHnCdXIkj8Nk/RmsBYDXL6SvOzyr7ttr34kWSipteYEYgSLPCUPP1Mw7ut58ignrjxBUbfTebA4EInJORGkLF78xn+eTZhjQ+op+4vorSYD3bbB8luMLDmDeTBieA/2qa5PW+EH8dLCl8JfhGmyi4dUl2IJs4y/rS/LGg2jzkAjkY8fsTAJm6eVTv6w736hN6xk1xc0F7roA3yEzjK6WTFA+gMr1hM06Fr8fyzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUeLAbaOP4QSjoUbJ+Xvmssa/tlRf+CiEwTL8sgh5TM=;
 b=M3vb7QWdiT1CJmAeCn602xqCgOJLs/Y9JUF1TcZx1dv/h0nAqHUumyz1m6+MdsR9Apyv0OJTv0a7EeIegzbXlTMSKTGJQTor/vdhDIDg6Js95FZoOkc7/1kkbY8WFiJ2pONe7xt4e0XQqVhKFSrYACLhhB8Qvln8N2CsTSzKqAlp0WlUu0IpKrVsVg4gABvuD5lU2E8JLZF9hUMQG2ibMQ9CvqfFRsK/I3cHvpCu711aJyXuzRiyYz/nYppDGW9njXhtZ4xKi7yd4YyagVvhDtnBZh7kDewcOKtdJ/Ev8HWr5QfnKg5SUyKgqmiF2ueGwH1Km8Oi5jUleeK7Au59GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUeLAbaOP4QSjoUbJ+Xvmssa/tlRf+CiEwTL8sgh5TM=;
 b=VkiLsNUzZv6N7nzrc+T9IL6NZvVDAePMtp6lCy6mHNzHc/8MI45dW37+k+/ScYzXowqAD6N8Q4WbNRAIrkfEgQAXQkZEShvYw5fhAKz1si1NBKwzjkuBeD79krM4ksnNu3kLIuGPeXDvaZWSGgp9rzuEl47Tsq2xjTt0va2z3Jg=
Date: Wed, 20 Oct 2021 10:08:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "iwj@xenproject.org"
	<iwj@xenproject.org>, "Oleksandr_Andrushchenko@epam.com"
	<Oleksandr_Andrushchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH v2 1/1] xen/pci: Install vpci handlers on x86 and fix
 exit path
Message-ID: <YW/Ok38nyeUlneky@MacBook-Air-de-Roger.local>
References: <cover.1634659471.git.bertrand.marquis@arm.com>
 <d788dcce9e344a39f6761633f0e96774ab42c2aa.1634659471.git.bertrand.marquis@arm.com>
 <YW/KDHnZHz72mjuQ@MacBook-Air-de-Roger.local>
 <85549220-AF96-4913-B672-ED6795C91C3D@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85549220-AF96-4913-B672-ED6795C91C3D@arm.com>
X-ClientProxiedBy: LO4P123CA0416.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ee1565e-4f1d-4121-2767-08d993a0dd1d
X-MS-TrafficTypeDiagnostic: DM6PR03MB4843:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4843776382412F2EBE49E9878FBE9@DM6PR03MB4843.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VWSJQgDetG2DmNI6aqqm9l5uxfEfSdcr5AaE6WdvC0m3YQOHnExrt4ZkLJy8tuf+SQezecBf6XFd4GptyNBKpaychsUCD6/MbdKasKYwTWc2I+pEfysTcT2IvVdWbf6qMKhi+wSeQxAONQf0gGOmXPAkP/HkHaTf1MgZECOlhXEtpc4yh4gV7JBLSwvsWhsYxyXZXvWfojHc0Wul6PNDiF8eefrK1WiZvKY4dNb0G3e36JiPm8XCan6WfOTfm+3fYnPB+WdAdFIFRmoDppG//w7X2lowTRfu8aH5eIg7fMKydMR/qzaMlJua9Zi2noWktgCUuIF10WxJXmIq4O8jcW2xN9ih6QLwnSK0DpjQZGqyQXVI4xGtCSVsrWCqAh7mDI2WQH36mSS5NWHl5KB3cs9MAxh9e8ybuS/Hq89ug6DkVayV0bsYJr0r7W/kXjJA/1rFZhUVheKYyA1G62H+W6kN0dj4/rF9iojvj3j5p7L+5XRDBfnBjPtG/zwtwcTl0n5+jc/gGGlwgFGHVBUK+oSiSAagGPqsDv7yp54rb/vpWdssh/zKlyP8k/bZn6f58Oym9+DRX8uh9VVEjn43XCzWJOHZd7ihvWHdb1+pB5iN3M7nSTnb25poetWABdf6AQbbsYpAIf9bqLqJ30BUug==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(9686003)(186003)(82960400001)(54906003)(26005)(83380400001)(6486002)(4326008)(6666004)(508600001)(956004)(53546011)(316002)(5660300002)(66556008)(8676002)(38100700002)(66476007)(85182001)(86362001)(66946007)(8936002)(7416002)(6496006)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGp4Y1VIWk5DVFZ0cmdkaTJWQWV6RWdYMXh2TUxiUzlmUjZBL3NFeFBwYllu?=
 =?utf-8?B?MFdwVDlxZWlGYUtQVy90MUV2bXpMRS81MUp6c05jRUhJNjBPV2l4MStZem82?=
 =?utf-8?B?K1hFWXBKcy9ZVEs1cnhxZ1Rqd3pzTjB6OCtOUjdwY1cyRnBkdzNmenA1YXll?=
 =?utf-8?B?cUJvanN0OFhya3hTdEk4blBFNHNhYXpUQVowcGhYd1NDUWZ4Q0phWjRER3ZB?=
 =?utf-8?B?UlZQR1RVT2FRdWQvQnF2RmpjZG1oTjh1cXV3QnM3NTdhbzN6SFl6Z0JCVFVy?=
 =?utf-8?B?amw0TjlKaWx0cUM3MVE5NU1QNVEvVEw5cFBwR1ZHYUR3RjVMbGl4dUtSZnZw?=
 =?utf-8?B?eHc0MDhQVXJsdk1sZjZSUXZraHpXTElHVHNESWVQY1F0NkJTTEdCVFQreWhr?=
 =?utf-8?B?R0FkdFN1MnZWOU5DYklBU1NYRGFaaFVWVzAzcUtBVzZ4SzZPOU93TzVrTDdr?=
 =?utf-8?B?R25PS3p3MjZiSnN6V1JxQjYrU3M0NWtyalVPbkpid1o5WXJYQ2RWTmFxY2tX?=
 =?utf-8?B?YWlFL0orL1pUQktIR0ZGN2RZK1ZrUWNmRU1uQXhwWHk0RUlPaWRUbHRDVG5s?=
 =?utf-8?B?L0d4dnA5a3E4WTJFc2hlVGtNTFhoeEVTT2RWd1FMVTN6Zlg0K2xFamRpd3Z1?=
 =?utf-8?B?YzZJSDhxOGRsd0lXWjBrMkpjVEpEUm0yOWFwT2Uwa2NISVhyRGZ3VHJyUFlt?=
 =?utf-8?B?dmxDUVREVU9XS3dyejh1RGUyTTdQbXhzOW95S0NPUzV2dUxLSFJSaE13dEtt?=
 =?utf-8?B?RVQ4WFk1UUVVN21Qc1NteHpENVhKVkVHS2xGMS9sc1lhUDRla0dib3lac3BY?=
 =?utf-8?B?THFDTy9wTXFSbG1PU0JuY3EwQzkycUxPR0p4Y0d1UHpHVEZCMXhmVERISDRr?=
 =?utf-8?B?Z1R4ZmZLUGZUMVRocW9tTFcrc3l0UCtRUmtmVytmS2x4SUJCekhKYksyODg3?=
 =?utf-8?B?RmhFNGVTVkhGM3JpL0Z3aTVoaGFGc2loMWJYNVhuV3BMYXNmeFVuNEhLOGFa?=
 =?utf-8?B?QTZWR3VFemd6UTJrVDd6cDRMdGQwbEdJV1pVVFpFYzA1eVgyelRxOUZDOTAx?=
 =?utf-8?B?b1VlR2lraHNLZ1EwV0c2QXo3bmhtL3pyc2RUa3ovMlJFRGZLSzFjZjJZamd6?=
 =?utf-8?B?dUljQXZQWk9xTkx6VWcwSXd6L2lDYVFUYUE5WFNzVXl2eXB2VEJMdUo0RUoy?=
 =?utf-8?B?RlZKdE9neDllaUl6WTJ4SXI2RnB3VFM5eldLUldVVUxraXVrOG5lMk1QTXBV?=
 =?utf-8?B?VXBraEdrbGljdm14eXRUL0Q5bkJEQTRmd280ZTYrK3ZES3FHbHhtZzdUQVNQ?=
 =?utf-8?B?ZzZKeFozWmI4ZXRLNDU3bzh2RWNMbS9wYTRaa2Z2MmZOWUFSMjhuakcybXRm?=
 =?utf-8?B?Qm9UckppVkRGTklVbGIvaVB6Z3BsTTdhcnhBRXRPYmFNMHBCOU5DRUZGS05k?=
 =?utf-8?B?bVoxN2ZybVd2YVJBUGk5c0xYakpJSGRUazZwNkhEME9BV0J6S3kycXEyd3hM?=
 =?utf-8?B?ZGYwY0JPOUo3RVh4aFlPSHQrL1luR1ZjWkxwZ1llckJMZUNob0hLb3htNUl1?=
 =?utf-8?B?cmRhbXM4anlxMjFPbmkxdzk3Q1BYQ3Bia3NsUmRZZ3dpb0VKQXdFU3BCWi9S?=
 =?utf-8?B?a3RqSEJVd1YxNExDQUpGMmFiWTZtN3Y2Yy9vclR2QlpOYnJFcUdreEoxWTh0?=
 =?utf-8?B?RTZSeGlVdlpMSUR5Y282TEpyd3hLditCbmlYMzRhclFSUzFYKytzVGplb0hx?=
 =?utf-8?Q?+phl+HWzEu9/OYDUq+JAKr5kPNxUcWwfqQ5kT9Y?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee1565e-4f1d-4121-2767-08d993a0dd1d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 08:08:56.5412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roger.pau@citrix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4843
X-OriginatorOrg: citrix.com

On Wed, Oct 20, 2021 at 07:57:15AM +0000, Bertrand Marquis wrote:
> Hi Roger,
> 
> > On 20 Oct 2021, at 08:49, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > 
> > On Tue, Oct 19, 2021 at 05:08:28PM +0100, Bertrand Marquis wrote:
> >> Xen might not be able to discover at boot time all devices or some devices
> >> might appear after specific actions from dom0.
> >> In this case dom0 can use the PHYSDEVOP_pci_device_add to signal some
> >> PCI devices to Xen.
> >> As those devices where not known from Xen before, the vpci handlers must
> >> be properly installed during pci_device_add for x86 PVH Dom0, in the
> >> same way as what is done currently on arm (where Xen does not detect PCI
> >> devices but relies on Dom0 to declare them all the time).
> >> 
> >> So this patch is removing the ifdef protecting the call to
> >> vpci_add_handlers and the comment which was arm specific.
> >> 
> >> vpci_add_handlers is called on during pci_device_add which can be called
> >> at runtime through hypercall physdev_op.
> >> Remove __hwdom_init as the call is not limited anymore to hardware
> >> domain init and fix linker script to only keep vpci_array in rodata
> >> section.
> >> 
> >> Add missing vpci handlers cleanup during pci_device_remove and in case
> >> of error with iommu during pci_device_add.
> >> 
> >> Add empty static inline for vpci_remove_device when CONFIG_VPCI is not
> >> defined.
> >> 
> >> Fixes: d59168dc05 ("xen/arm: Enable the existing x86 virtual PCI support
> >> for ARM")
> >> Suggested-by: Jan Beulich <jbeulich@suse.com>
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >> Changes in v2
> >> - add comment suggested by Jan on top of vpci_add_handlers call
> >> - merge the 3 patches of the serie in one patch and renamed it
> >> - fix x86 and arm linker script to only keep vpci_array in rodata and
> >> only when CONFIG_VPCI is set.
> >> ---
> >> xen/arch/arm/xen.lds.S        | 9 +--------
> >> xen/arch/x86/xen.lds.S        | 9 +--------
> >> xen/drivers/passthrough/pci.c | 8 ++++----
> >> xen/drivers/vpci/vpci.c       | 2 +-
> >> xen/include/xen/vpci.h        | 2 ++
> >> 5 files changed, 9 insertions(+), 21 deletions(-)
> >> 
> >> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> >> index b773f91f1c..08016948ab 100644
> >> --- a/xen/arch/arm/xen.lds.S
> >> +++ b/xen/arch/arm/xen.lds.S
> >> @@ -60,7 +60,7 @@ SECTIONS
> >>        *(.proc.info)
> >>        __proc_info_end = .;
> >> 
> >> -#if defined(CONFIG_HAS_VPCI) && defined(CONFIG_LATE_HWDOM)
> >> +#ifdef CONFIG_HAS_VPCI
> >>        . = ALIGN(POINTER_ALIGN);
> >>        __start_vpci_array = .;
> >>        *(SORT(.data.vpci.*))
> >> @@ -189,13 +189,6 @@ SECTIONS
> >>        *(.init_array)
> >>        *(SORT(.init_array.*))
> >>        __ctors_end = .;
> >> -
> >> -#if defined(CONFIG_HAS_VPCI) && !defined(CONFIG_LATE_HWDOM)
> >> -       . = ALIGN(POINTER_ALIGN);
> >> -       __start_vpci_array = .;
> >> -       *(SORT(.data.vpci.*))
> >> -       __end_vpci_array = .;
> >> -#endif
> >>   } :text
> >>   __init_end_efi = .;
> >>   . = ALIGN(STACK_SIZE);
> >> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> >> index 11b1da2154..87e344d4dd 100644
> >> --- a/xen/arch/x86/xen.lds.S
> >> +++ b/xen/arch/x86/xen.lds.S
> >> @@ -134,7 +134,7 @@ SECTIONS
> >>        *(.ex_table.pre)
> >>        __stop___pre_ex_table = .;
> >> 
> >> -#if defined(CONFIG_HAS_VPCI) && defined(CONFIG_LATE_HWDOM)
> >> +#ifdef CONFIG_HAS_VPCI
> >>        . = ALIGN(POINTER_ALIGN);
> >>        __start_vpci_array = .;
> >>        *(SORT(.data.vpci.*))
> >> @@ -247,13 +247,6 @@ SECTIONS
> >>        *(.init_array)
> >>        *(SORT(.init_array.*))
> >>        __ctors_end = .;
> >> -
> >> -#if defined(CONFIG_HAS_VPCI) && !defined(CONFIG_LATE_HWDOM)
> >> -       . = ALIGN(POINTER_ALIGN);
> >> -       __start_vpci_array = .;
> >> -       *(SORT(.data.vpci.*))
> >> -       __end_vpci_array = .;
> >> -#endif
> >>   } PHDR(text)
> >> 
> >>   . = ALIGN(SECTION_ALIGN);
> >> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> >> index 35e0190796..8928a1c07d 100644
> >> --- a/xen/drivers/passthrough/pci.c
> >> +++ b/xen/drivers/passthrough/pci.c
> >> @@ -756,10 +756,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
> >>     if ( !pdev->domain )
> >>     {
> >>         pdev->domain = hardware_domain;
> >> -#ifdef CONFIG_ARM
> >>         /*
> >> -         * On ARM PCI devices discovery will be done by Dom0. Add vpci handler
> >> -         * when Dom0 inform XEN to add the PCI devices in XEN.
> >> +         * For devices not discovered by Xen during boot, add vPCI handlers
> >> +         * when Dom0 first informs Xen about such devices.
> >>          */
> >>         ret = vpci_add_handlers(pdev);
> >>         if ( ret )
> >> @@ -768,10 +767,10 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
> >>             pdev->domain = NULL;
> >>             goto out;
> >>         }
> >> -#endif
> >>         ret = iommu_add_device(pdev);
> >>         if ( ret )
> >>         {
> >> +            vpci_remove_device(pdev);
> >>             pdev->domain = NULL;
> >>             goto out;
> >>         }
> >> @@ -819,6 +818,7 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
> >>     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
> >>         if ( pdev->bus == bus && pdev->devfn == devfn )
> >>         {
> >> +            vpci_remove_device(pdev);
> > 
> > vpci_remove_device is missing a check for has_vpci(pdev->domain), as
> > it will unconditionally access pdev->vpci otherwise, and that would be
> > wrong for domains not using vpci.
> > 
> > It might also be good to add an ASSERT(!pdev->vpci) to
> > vpci_add_handlers in order to make sure there are no duplicated calls
> > to vpci_add_handlers, but that can be done in a separate patch.
> 
> I can do both in v3 (together with the change of in the patch name).
> 
> Unless you want the ASSERT in a different patch, in this case I do not think
> I can make a new patch for that.
> 
> Can you confirm if I should or not add the ASSERT directly in the patch ?

I'm fine with having the assert added here: in wasn't necessary
previously as there was a single caller of vpci_add_handlers. Now that
there are multiple ones we should make sure no duplicated calls can
happen.

On a different note (and not something that should be solved here,
just wanted to raise attention to it) there's an existing TODO about
vpci_remove_device because it doesn't clean the 2nd stage mappings for
BARs. At some point we need to solve this, or else the removal of the
device is not complete.

Thanks, Roger.

