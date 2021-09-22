Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9487A414BD5
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 16:25:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192843.343528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT3Bw-0007SC-Es; Wed, 22 Sep 2021 14:25:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192843.343528; Wed, 22 Sep 2021 14:25:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT3Bw-0007PI-BE; Wed, 22 Sep 2021 14:25:44 +0000
Received: by outflank-mailman (input) for mailman id 192843;
 Wed, 22 Sep 2021 14:25:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DDUS=OM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mT3Bu-0007PB-8J
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 14:25:42 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6987e74-1bb0-11ec-b99c-12813bfff9fa;
 Wed, 22 Sep 2021 14:25:41 +0000 (UTC)
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
X-Inumbo-ID: f6987e74-1bb0-11ec-b99c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632320741;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=mAvN3MvZGLtEfzpBndf/tMrJ5CEJZjjWPXJeTRw9xEc=;
  b=PqP9jG3tiBWfxQHoATZmDcYX9cpvdkhpqiveYXzJV40B6khq5mOjy6pu
   tSB+EovuSUX6HNVLEqwgTqLzDKjgY/gcb9BT3YnYotBWXKd1OqmdHrTkU
   QaRi13BwtUOHsihkMoTigu16GOo/aOLr8MKcW/rwTLTENkmwtH69ykNAi
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: s1IPJNiHDDrx9cLO9DTU8tY7ZohhHHOzobLNRBMxzDRdlSw0BjrjeW0YGogQDvMLOUbz4IpGPN
 MntcdJgb31Px5fbbWT9bNNPtZmN+naPhxJP0tm19a+PwSYRQJGmRgkTLjBjBe0AXWD1YTZk9Nt
 8eYIHtDk53xED0g88QbuTXtUxM2ZfBI+5pKiT1OeWr+rcSZq1b6C8oRbF2RKbp3ct53qesteKt
 4WoRLuQiS97DjUMDG14VKcBJp0pcFUYkR7h7w7qR1oyCUUNtEELZF1C7mhVDPstkHIY1xT8yeQ
 xujiozI2hVwNBnadgMrJY5TQ
X-SBRS: 5.1
X-MesageID: 53322525
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:cyW5BaI+lDUd9GiOFE+R6JIlxSXFcZb7ZxGr2PjKsXjdYENSgmFWn
 DccXm3SPKmJZmr0eI1zb4Tl9R4Fv8DVzdBrSlRlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZ0ideSc+EH140UM5wbZi6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2zn/xf8
 clE5aCdQCgPYaiStcseCSRxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2XvoQChmpq26iiG97FW
 cQlSgVmXS7wbjFyNFkpNLxng+i30yyXnzpw9wvO+PtfD3Lo5BBw1ZD9PdyTfcaFLe1Fk0Ddq
 m/Y8mDRBhABKMfZ2TeD6mirhOLEgWX8Qo16PL+y++NugVaT7ncOExBQXly+ydGmjmauVtQZL
 FYbkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcUA6C2j87bdszq0D0ciETsfRfMl7vIfEGlCO
 kCyoz/5OdB+mOTLEijEpunI9Wra1Ts9djBZNHRdJecRy5y6+thi0EiXJjp2OPPt1rXI9SfML
 ydmRcTUr44ai9ICn46/9ErO695HjsmUFlNpjuk7s2TM0++YWGJHT9fzgbQ4xawZRGp8crVml
 CJf8/VyFMhUUfmweNWlGY3h5o1FAspp1xWH2zZS82QJrWzxqxZPg6gJuGwWyLhV3jYsJmayP
 R67VfJ5z55PJnq6BZKbkKroUJ9C8EQULvy8Dqq8RoMXOvBZLVbblAkzNR/49z28yyAEzPBgU
 ap3hO7xVB72/4w8l2HoLwrcuJd2rh0DKZT7H8Gjk0v/jurAOxZ4i94taTOzUwzw14vdyC39+
 NdDLcqajRJZVez1eC7M9oAPa1sNKBAG6Vre8aS7r8aPfVhrHn8PEfjUze9zcoBphf0NxOzJ4
 mu8SglTz1+m3S/LLgCDa3ZCbrLzXMkg8SJnbHJ0ZVv4iWI+ZYuP7bsEc8dld7cQ6+E+n+V/S
 OMIepvcD60XGCjH4TkUcbL0sJdmKEawnQuLMif8OGo/cpdsShbn4NjhegezpiACAjDu7Zk1o
 qG61xOdSp0GHlwwAMHTYfOp7lWwoXlCx74iAxqWeoFeIRy+/pJrJir9iu4MD/sNcRiTlCGH0
 wu2AAsDobWfqYEC79SU17uPqJ2kErUiExMCTXXb97u/KQLT4nGnnd1bSO+NcD3QCDH09aGla
 bkHxv3wKqRazlNDso46GLd316MuodDoouYCnAhjGXzKaXWtC69hfSbajZUe6PUVy+8LoxayV
 2KO5sJeaOeAN87SGVIMIBYoM7aY3vYOlziOtfk4LS0WPsOsEGZrhamKAySxtQ==
IronPort-HdrOrdr: A9a23:sZjylqiI0IeDYUEnsWFeKC7HW3BQX0h13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkCNDSSNykFsS+Z2njALz9I+rDum8rJ9ISuvkuFDzsaE52Ihz0JdTpzeXcGIjWua6BJcK
 Z1saF81kadkDksH4mG7j5vZZm3m/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTtj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZtA+1Dr1fqOk2lqxrk3AftlB4o9n/Z0FedxUDupMToLQhKQ/ZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIfwsCrDv1nVMS1cooy1BPW4oXb7Fc6aYF+llOLZsGFCXmrKg6De
 hVCt3G7vo+SyLaU5nghBgs/DWQZAV3Iv/fKXJy/vB9kgIm0kyR9nFoh/D2xRw7hdUAo5ot3Z
 WMDk0nrsAJcie6BZgNcNvpevHHeVAldyi8Rl56EW6XZJ3vBEi92aIfwI9Fr91CK6Z4hqfbpv
 z6ISRlXCgJChvTNfE=
X-IronPort-AV: E=Sophos;i="5.85,314,1624334400"; 
   d="scan'208";a="53322525"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EXWqVtxN4NynKoY2ZrdAo/KULQBHGFWQTD5u2XPRqSVsj1LU9weogo0thUkrnHDz48VtenUBOpbpkW8lVJrm9n95lD3nwrRpte1au6srjZY6NTwH/9az29W5/NYlO1rppPJGtyOdtcAJYhtP6LUBzlRCVzH8ilpbcL5kmvRAXnZZAzF/Eoip3/EqtS4rlb3YB3DI41TfeVsHfuUX6CF+3HViUGGmclceQbnt4GbE2oWRLiGhBZfzimlPkSKaHkQBmMtkcbau04nv1TQt8p53H/MauNCQU1l8U0seSCK6kgpGSht74LzBgey2Vrte1W5kjYxkWvY0ZiCEKvGTqL9Xtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=qaDVag6CDTsAPeUnT5m77AzpkBzJ1YXqzl4R5UjmxmY=;
 b=aDU7mkS1c3wkbdBfKOCEnMjgzD3uVIuwYsYr4Q88QDzFyJacEPFMQtfXl/kSt3iV2u5g0/HPkntdNfKqXpC+bwgk0HZHQQcXm1oHtRRQPyDyDdzNspYBA/rVOnJeiic9eqdsrhOCznXFvkH7vh95hkYNBjfZXg8Nu0CLqjHEeYXCcZIXdVgBONDbD4tQaBjOZLlBYduS9lPXfPnJYQ8hUetssYaPl2FYAhOZvBEopoqslXuOOzgvp3mx0DCuDDwL86utY/B5U5IKXv8dLj9H9UoXSGHeiUhnKW9IJPgoqP2AGNl10LBtDnRzL3suYw4Rgikpj2GBY65uTyksOuwjTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaDVag6CDTsAPeUnT5m77AzpkBzJ1YXqzl4R5UjmxmY=;
 b=gPtsaQqOM2WeWY8H4SiIiIH4Plzmzy0/Qkc6i7P/OtYx5uJ+3l/2xXo0b/Hdpl7LOvj5TZFm+DJSU83Mt/kcM60snXlx+ZlgnzuOwYjuRzbM+NGjzJcKXqMu+f7rMTZJS/vYiWdKnLKOs1bqJKCbl8g/teOcTW0Uh9oR0et6Lbc=
Date: Wed, 22 Sep 2021 16:25:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, Tim Deegan <tim@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/9] x86/PV: properly set shadow allocation for Dom0
Message-ID: <YUs82i7S0fd8r1uX@MacBook-Air-de-Roger.local>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <25958e72-40b9-30ef-a348-6ac9ef02b261@suse.com>
 <b2a2fd30-225b-2b79-f160-8ed2e4ad439f@citrix.com>
 <8c1ab98a-8fde-3d9e-5250-c5a40af70453@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8c1ab98a-8fde-3d9e-5250-c5a40af70453@suse.com>
X-ClientProxiedBy: LO4P123CA0100.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7826b663-48eb-4612-daef-08d97dd4d73e
X-MS-TrafficTypeDiagnostic: DM5PR03MB2971:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2971397D5331E0223E5B54FB8FA29@DM5PR03MB2971.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eSWDmI0MMdA49WU1nOeA+smL9vcRD/zYEIMa+S7Lj0WjKRGTm2fl5stnhRyhzI34F6aSlFRkU1PqZMuh7JWoi16xeGZF2il+gW4Rd+Q9W8mOIfXSLMyIJeO81qK0zdTwJB4L4y8+8FZEeKGOP1I/zCc2A93DjF2Tx0saArDu6e2e8iWSez9bvjF1N0XKjWvTkPzP6y1zJONOs6uwXeHMb9sucXs8alBUxpJBw8ptQNAjYeKV112AUZ/KVX+ADK/8QivICQO5qwVbt6s3g4YzaRZYHh1lClXikhlN+bnyjeyZuVpMb35dMlLQ7siyVoTJDhGRpWdJVgpafsjT5OQKESlL9n2AAWpu6JHykvEnO2ZLyhve/7Nd8rzpoHzqWuqD21QuvbTUhFcRI/RBrJJT0kUkfUBBD66uMjcyvofLGsTNDV4hCEfyinQv0ybTpGvgCawq+yedqSOc/rM1XYhMDDp3VRk56txioxFGCp3rCn94+ycF9DKRgyqkL2q7Dk4eQzKkDJkpRzCK52nSPxkm/pvBftN7lglVO2rgsvHn4sGA3SMQoqMjgXBr63Lw6I16PVUvxemH/QAGuP+N5YOSFcY4XTbBeRdYRJbH9YPadO3Nd0zS6f8Xg9NbUnnOlZ9w3fAiRA6o7MRkPKlPUa3wElq/NUy6RRhB4uuxQ1aoeqhKA+T6ent5mb2Kw7dCMt3Cf432zNxQX6H5qsQQJBR+KA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(83380400001)(6666004)(2906002)(53546011)(4326008)(38100700002)(186003)(6496006)(5660300002)(85182001)(8676002)(508600001)(6486002)(8936002)(316002)(9686003)(110136005)(54906003)(66476007)(66556008)(86362001)(6636002)(26005)(66946007)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1BOTG9pNGUwTGVtSDNMMlFXaGloOFVUTkhPRS96NkhPejFJTjNZdWtJMGtF?=
 =?utf-8?B?cEJNbWpZcWxYeHYrOUlLaFNDbkU1KzFPZDIrWlgwQXhhSmhISEI5RlFNMWtL?=
 =?utf-8?B?OFdQMHRGbVJqK2JBNnJXTHo1enpyYUk0azA1SVNZZUZPQjYwejIzandqMGRa?=
 =?utf-8?B?enhSVVFMSzdKTDRTbkx0ek40am16ZlNmam52UDVjWFNtZER0Q0VwMVo0Vm9B?=
 =?utf-8?B?MnRHaG02bjY1d3lUaVlZdm9FUDdDMi8xWVh3MVd2TENOWUxzZEc5TStPbkNy?=
 =?utf-8?B?K3pjOTFQbXdmSjd2b0M2ZW9PbGlGY2lKTWJ2Zk05aEhSVjQ2WW9nTEFVRXFS?=
 =?utf-8?B?b1J2ZGFFT0Z4RzdUanZGWVBOZkw1Smt5Q1MvRHRhSGRsczNhUlkvMjZzQlhE?=
 =?utf-8?B?UXFDWGhXTGlzRVg1TEwvMWhEcHBTejlXcTFKUlFhb3hNYnlWejFwT2Z4Mnlt?=
 =?utf-8?B?V0EvR2EvMnRxYkVGaVVPRWF2bXhPb04vWXhQSDFqTnlNWUdmZnRGcDN4YTkz?=
 =?utf-8?B?RE5tUnFaalUyL2M3R0ZiSTVlaVZHUXVzUGJ1TUpiYTRyclFUTlMraWpwRm9X?=
 =?utf-8?B?aEY5VTdyQm8zcXFRZkFsaUhROW90NVBWSmtpOXRWMVFGcXdjWEVtWXNrVi9W?=
 =?utf-8?B?akdBOUIzOXNIYklMUjJxTTd4bG9QcndDeGFZOUxObThickVNcUtwNjZpMXE5?=
 =?utf-8?B?L3JWWkxnV2N6UFUzR1ZLV3ppM0lKamxlNENLZlJ6YXVIbXlGbnJCeTV5UUt4?=
 =?utf-8?B?Yjk3L0VnQ3BtMWwva25sbkRVYWdpTmVFc1QvY0dRRWtyYjNoSElWV0xRVGpT?=
 =?utf-8?B?Qkp5aUM0TmJwMnJwbG8rN3pBQzhZV0tZczAxZzVTZHRRUG9tM3RjNHZJOEFL?=
 =?utf-8?B?WUZaU1p1Vm45bG40RmExUFJHYTVCQ3RVNWdoVnhmWWdDRTJmWWIvb2FqaVZv?=
 =?utf-8?B?M3l0WkVSNFBReGxHVTZRd2VWZkJoRkk0RjI5bXZobjZMeFdnMU1RdkVjN3Z5?=
 =?utf-8?B?Y2tOZ2ZMMDZSTXZ5bkx4S0hhT2NjSjE4MDF5dXFQM0JrZXBCc0krcmFnamhP?=
 =?utf-8?B?d1FTTEU0L2thZHVMcDQ3bDZmNHF4dDBHUHNmVTlVNTM5UjhUSVJyL3ZLaG1p?=
 =?utf-8?B?TGlkN3ZIamVYSzFOOGdpS1ZlamtKa3ZweG9kUisxbVdDdTZlc2VlcE5vOXcz?=
 =?utf-8?B?UWFRaU9qMktnNzlvS0g2Q1BaM0h0UXJkMXVzM2U1dFJFNjNCcVRZK2FLSDhp?=
 =?utf-8?B?SElvY3FrTUdHUVZaYmNIeXFnNkFPZVlBV3gwN0JFUUdGQlZYUTR4ajlhL0J5?=
 =?utf-8?B?RVB2bm5WaTRDeHBJMkxkQWtSYlVEOVE1cWZ2cForaVVNRU9FUUUrZHRqbzYx?=
 =?utf-8?B?L3FuM2xqdUlrdFFOQkU5UXhOZ2pYbGdkU0NMWHlObnRNQnJ3TGpMd2h1THd3?=
 =?utf-8?B?djVzZUZudlFOVTFEUElPTjhXL3FVUDFLQW1UL0RiNUNYWGsxRjZua3poSHBV?=
 =?utf-8?B?cE8vN0VGT2R0bFgyQ2NxS3BQVXRaa0V3MmhVck1zeDJKcnZUMnFYOTdlb2Jq?=
 =?utf-8?B?Q1dOVlRSTmNJbTdMaThmRnV4R1htcy85anV0S0VLcHVnT1crMkRWaFZ5WWVi?=
 =?utf-8?B?WkQrN0V1OVY5OUt2bXJkMVFobFZGYmgyU1J4VDQzcjhTZ2NqNkJoaTFYN3Zm?=
 =?utf-8?B?Z3pxQkRRbVk4eXRXbWhHc3N5V0RPV216S1JJTU1EeGtHaUhtNHhaa2wyaHVW?=
 =?utf-8?Q?65lOEuTQFl7swpTFmidCS7fTG6qjLjO8Wl8la9j?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7826b663-48eb-4612-daef-08d97dd4d73e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 14:25:34.9585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5TNqALlWl8irXftYBzZdoK3HJ/OOmx+Ps9nc1QSby1IiNG+adC5Z04/80J0eUXc69dBnX0nfGsHESBlUv9RTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2971
X-OriginatorOrg: citrix.com

On Wed, Sep 22, 2021 at 03:50:25PM +0200, Jan Beulich wrote:
> On 22.09.2021 15:31, Andrew Cooper wrote:
> > On 21/09/2021 08:17, Jan Beulich wrote:
> >> @@ -933,7 +934,18 @@ int __init dom0_construct_pv(struct doma
> >>  #ifdef CONFIG_SHADOW_PAGING
> >>      if ( opt_dom0_shadow )
> >>      {
> >> +        bool preempted;
> >> +
> >>          printk("Switching dom0 to using shadow paging\n");
> >> +
> >> +        nr_pt_pages = dom0_paging_pages(d, nr_pages);
> >> +
> >> +        do {
> >> +            preempted = false;
> >> +            shadow_set_allocation(d, nr_pt_pages, &preempted);
> >> +            process_pending_softirqs();
> >> +        } while ( preempted );
> > 
> > This is still broken.
> > 
> > The loop setting the shadow allocation needs to be outside of this
> > conditional, because it is not related to early activation of the l1tf
> > tasklet.
> 
> Well, I'm not sure what to say. On v1 you already said so. But then you
> didn't care to reply to me responding:
> 
> "Are you suggesting to set up a (perhaps large) shadow pool just in
>  case we need to enable shadow mode on Dom0? And all of this memory
>  to then remain unused in the majority of cases?
> 
>  Plus even if so, I'd view this as a 2nd, independent step, largely
>  orthogonal to the handling of "dom0=shadow". If somebody really
>  wanted that, I think this should be driven by an explicit setting
>  of the shadow pool size, indicating the admin is willing to waste
>  the memory.

Maybe an acceptable compromise would be to allocate the pool if
opt_dom0_shadow || opt_pv_l1tf_hwdom?

opt_pv_l1tf_hwdom is not enabled by default, so an admin opting to
enable it should also be willing to reserve the memory it requires in
case it needs activating during runtime.

Roger.

