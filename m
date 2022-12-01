Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D491963F2B9
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 15:23:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450766.708201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0kSn-0000b6-MY; Thu, 01 Dec 2022 14:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450766.708201; Thu, 01 Dec 2022 14:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0kSn-0000YB-JD; Thu, 01 Dec 2022 14:22:57 +0000
Received: by outflank-mailman (input) for mailman id 450766;
 Thu, 01 Dec 2022 14:22:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmm5=37=citrix.com=prvs=327587bd7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p0kSm-0000Y4-5m
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 14:22:56 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a467092a-7183-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 15:22:54 +0100 (CET)
Received: from mail-bn8nam04lp2043.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Dec 2022 09:22:51 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5935.namprd03.prod.outlook.com (2603:10b6:a03:2d6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 14:22:50 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 14:22:50 +0000
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
X-Inumbo-ID: a467092a-7183-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669904574;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=aNs7/LTaElDmCxfc7+lCH20vWS9USDw/JV+/wAZvdWU=;
  b=RWgj36nmmcXMYxZdzn62+xzHlNLIB8e4IPGZG4eawxvXFKziSBr3TNpx
   BGyuqXzgesh4SVEYJmbXfR4RuXOALbd3+q0F/4vAKT39jXDUR+asnhJX/
   puA6xgdeWJMWrNhDP5/g0A/n2s79IMzQZNNKe4SE7aOT57JqSUcISE/LK
   0=;
X-IronPort-RemoteIP: 104.47.74.43
X-IronPort-MID: 86062709
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:by554qmL7wnIYHONF6vIzxXo5gycJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJDG3XOfjcN2T1Ko12Ot7ip0IEvp+Hxt5nSVdt+HozRiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kR5AaGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cQaNTFObx2EvsO3moKZS9NTqOQZc/C+aevzulk4pd3YJdAPZMifBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVk1A3jOOF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNJMTOPiqaY76LGV7jEyKB0yWUXjmue0iRSwdZFxK
 0pO9BN7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc6TCIn/
 kWElNToAXpoqrL9dJ6G3rKdrDf3My5FK2YHPXMAVVFdv4Klp5wvhBXSSNolCLSyktD+BTD3x
 XaNsTQ6gLIQy8UM0s1X4Gz6vt5lnbCRJiZd2+kddjvNAt9RDGJ9W7GV1A==
IronPort-HdrOrdr: A9a23:wdyOd6tEswTGIkBuFCkg82GM7skCXoAji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKceeEqTPqftXrdyRGVxeZZnMffKlzbamfDH4tmuZ
 uIHJIOb+EYYWIasS++2njBLz9C+qjJzEnLv5a5854Fd2gDBM9dBkVCe3+m+yZNNWt77O8CZf
 6hD7181l+dkBosDviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeF+aP3CB+R2zYZSndqza05+W
 bIvgTl7uH72svLiyP05iv21dB7idHhwtxMCIiljdUUECzljkKFdZlsQLqLuREyuaWK5EwxmN
 fBjh88N4BY6m/XfEuyvRzxsjOQngoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx8+L
 gj5RPbi7NnSTf72Ajt7dnBUB9n0mCup2A5rOIVh3tDFaMDdb5qq5AF9k89KuZDIMu60vFjLA
 BdNrCa2B9kSyLdU5kfhBg3/DWYZAV2Iv5BeDlbhiXa6UkMoJkz9Tpk+CVWpAZ9yHt6cegF2w
 2MCNUXqFkFJPVmEp5VFaMPR9C6BXfKRg+JOGWOIU7/HKVCIH7VrYXriY9Frd1CVaZ4u6faoq
 6xJm9wpCo3YQbjGMeO1JpE/lTER3i8Ry3kzoVb64JisrPxSbL3OWnbIWpe2PeIsrEaGInWSv
 yzMJVZD7vqKnbvA59A20n7V4NJIXcTXcUJspIwWk6IoMjMNor239arOMr7Nf7oC3IpS2n/Cn
 wMUHz6I9hB9FmiXjvijB3YSxrWCzjCFFJLYd3nFsQoufsw39d3w3koYHyCl7G2ACwHtLAqd0
 1jJ76imr+npACNjBT101k=
X-IronPort-AV: E=Sophos;i="5.96,209,1665460800"; 
   d="scan'208";a="86062709"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MiYWyjTcusNh+mWf7rYP/+4rRtmNNfDRzBh2NTQetdHrOv7Y2d1BGiyuIFhSeXbATreUevedRxpVXCV70mMAiYZuEAjnWPxc6bjuMGb7mY7+meZQcQyhHNyQYfpnVrtnflFPOCly0Px3M7DKoZwyq2ZreVNY7twjR0Zczg2dPnRuIrLkV8PjQrq750KHmqibBeE6fKGpyTZEoD8Sb05Ej1eehFciWgE0ZpI8VmH9zQhr57A41sRM+FU8eQAXRpCcIPnHsKB+4alepdCjB4kbxzaeOTwFgzlriWafA4uagrMNnMrysUR3H7vmtejBHj/hK3AJmmqCMowTDD0b3Rm7Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNs7/LTaElDmCxfc7+lCH20vWS9USDw/JV+/wAZvdWU=;
 b=P1KMnx6yvwekkOhsFArGbATtw3OnubM+Neg5S/ysMYKr+1TOULmPp4yjFJ14KCAgdq3/Clwa+8F7ZzqaEkM2h8AU0+UITe6O4KUzxdDW9lqWW7zgJd6ObWWaG10zsDKkvWl4UerKmcFsXp0D+mvYf1pjdEqhPUqr5GEqY39phP9cbVviDnz0YqLWbTJLyUzUky3J3Xn0/9b2FqvceyA3IYzIh5dIljBKqu34C5n1+rFiWPwWFmFcmjiiwhIMVveJX6Sh6CfRdjdLVCDZlxbSRz+2bpInMZoYhX+Qqh+rn+AQq1BZxyYRqQqDIb+waarFMWaZmgw2lX6xbvpI2IZe/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNs7/LTaElDmCxfc7+lCH20vWS9USDw/JV+/wAZvdWU=;
 b=wb+QxeNgapN0xBZwYweFflOK3CdTCwfgvBIvpbX16yqd6QI04iWn6rCFPWEWO243ylySXGgd+TTt9jQZwuDrT9TwV6TDVsloB0HUET4kmBgBTvJT54wsEKKxOQNgQQ3ysfaNf2/ZAoM2GnO/FqEWQQkHbgxwAS4Z/LE7INkpgwk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Christian Lindig <christian.lindig@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>,
	Edwin Torok <edvin.torok@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>
Subject: Re: [PATCH v2 5/6] tools/oxenstored: Rework Domain evtchn handling to
 use port_pair
Thread-Topic: [PATCH v2 5/6] tools/oxenstored: Rework Domain evtchn handling
 to use port_pair
Thread-Index: AQHZBNyGN5BP0zs1Y0yrWzYQCqLnUq5Y7uIAgAAoLIA=
Date: Thu, 1 Dec 2022 14:22:49 +0000
Message-ID: <b94f7928-c420-43ec-5ed5-8de004ac8f3c@citrix.com>
References: <20221130165455.31125-1-andrew.cooper3@citrix.com>
 <20221130165455.31125-6-andrew.cooper3@citrix.com>
 <B01EB9B0-2E59-460E-9F1B-04F2406C788B@citrix.com>
In-Reply-To: <B01EB9B0-2E59-460E-9F1B-04F2406C788B@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5935:EE_
x-ms-office365-filtering-correlation-id: 42f847a9-e950-4bfd-cedb-08dad3a786bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 VZup6EJ980WIgln8HbKaxystMK4kv7CExs+5u5L/lzNCEKsFp8zq9A6/KhV/oIzUQf8Ijyl18OeI7NiiA7IxFCSSXilVtm1gE02xkntP6DvEF/oaNLnd/M8iLnZw3QaOEv5tdF8GHyLmdlARnVwEtCNXvAp+CuzV4+5ngG+UruNQiciIjgZpJ5hLCXyZB4EH7Ixzgg4sR6rebMnk3xxaCZ+003sab5s+tLIYzhj+OZrP+z5ygVpan3/LfbAz7LcBmUcgPgGHFhVWQNOk6s+5cYlUdbTVFCIsb9ZW12qJ1uANHIPG3FTCgyahO8h26cbtb3iDLv56GC0FpCeoy5m8stS861qEqCG2FoAMbhlR52UD0ty1t0CyTcjhvPiDB6f7HiAzU00gX0isVbgQvm0FKMyzkSpWRNA1wcgZTWhU/i/LqYt5FIX2uPTlfcXMfq1IMjpt8a1i+z4tiTqzNgsUqQ0RsFyU8+7OEdylSV1jPuMlIcbwByDmULL/ZyiLjc+cEV7AYlB8Ch7UJxqjGqgYmySJ6A/8Kh1wO1LVeYcb9ijLuiNCNwfg/LY2n0qLSAQXuY2lzq5qccKEPcb0R3pnZcmgn52JVGZyq3OkB7L0v0ppNgX6ng53kbcrKhgFPoevzUU1o9eWCgDuX+E7t2VCbifQ6bMMv9wHJ9eUeN5B4/voQAzNUByupzccHc2030lNAqLcQEOSoQEVVWt6li0lO4qBuFFJmC+zTDU9XWE+CP2kMMI9pBY+vimE+SohBKZDSulHJjWkFsvaCSStySoveg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(451199015)(53546011)(36756003)(86362001)(6636002)(37006003)(54906003)(38070700005)(31696002)(6486002)(316002)(478600001)(71200400001)(2906002)(5660300002)(91956017)(8676002)(66946007)(66446008)(4326008)(66476007)(41300700001)(76116006)(6862004)(8936002)(66556008)(64756008)(83380400001)(38100700002)(122000001)(107886003)(82960400001)(6506007)(6512007)(186003)(26005)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UWZvREY4QUNHNm5ZQ2o4b0VVd3NuVXpPbXlsRCtLaG1xT0ZLdnFBR2xRV2dU?=
 =?utf-8?B?R2hUdzM0S0pSQVN4emFTb2pPWmVhNW9OeXlGOXRVVkFJbUIvQ0FWZlJ5dnIw?=
 =?utf-8?B?ZXcxMEY0UXRQdEhNU3RrWVEvNFVFcm9HSGxkOVlERFJnd25venlkS1ZyK1cw?=
 =?utf-8?B?d3Y0WHdoSjJlSVJ2cFRpUEI2ajUzN0lpMm9uRXowb0tZaUJxWko0bWd2YnRF?=
 =?utf-8?B?YStURkI0ZVNrc2U4ZEtZYWxQYTl3UlNJSnJoaXZFdElFemI3M05uUS9pWjBz?=
 =?utf-8?B?RG9iRUNmT1VCdWNKV1NKMU5zSjE0N0RUaElHM2VHZTcwK09PZFNxczdGL2l2?=
 =?utf-8?B?WmZZU3RpZEJrazJpekV5WVNsbDRDTmpmaElPZ0N1NE5EbVptL3Zyb0NzZDhj?=
 =?utf-8?B?ZUI3ZXhmRTRYQUtCcUJKWWpHdWk0dko0eHJnZVJmWXJ4VSt6Q2xrM2x5Q2wr?=
 =?utf-8?B?UW9rRnd3OStYSGxyWFNybGVLc2hJdGo1MS8yKzdCbUQzS1c5UUM5Vndkd1Y0?=
 =?utf-8?B?M1JZV0ViamlhREI2eVVjUis4WWl6NEtmUWJ2TEJFR0I3NU10bElBcnRsYkk0?=
 =?utf-8?B?WHV1L1F3andLdEp5MnlaVG5pblpzWHpwWDVWSlUrb3BZcWJyVWIrODVrdXpX?=
 =?utf-8?B?ckx3cHBaL094MWcxNUE3MGxVa0piZ25xRmdLaHdEeHJSRjkyS2NRaE03elpk?=
 =?utf-8?B?YmNMUDV2UEYwRWVNODhQZ3doNEgxOHlJL0FqcVNObHUwUUcrZXUzYW1Nb2VG?=
 =?utf-8?B?NUlqeTdPOEluMGpxSUROZWZhMlFDL0lmb1cwTy8rVVYwenYyWWQydWozSHZM?=
 =?utf-8?B?K0ZlSlZyemZEeXp3RzFQQ25MTmw3aklxblQ3TExESURqRkhLclFncTh1QUto?=
 =?utf-8?B?QjRiNTlNOXpKdmEvemVUZ3NpRUU2SXYzKzlrUm5hSnV4N28vZ01GcVBMM0My?=
 =?utf-8?B?MEJVVmpWVFNOa0JXdjlsT3RtaEFBS1JpTnRhU1hHYTFFSU1vRlNGekpUeXBj?=
 =?utf-8?B?bkJIMDdUZXpIRzJOU2d0UXpLZG5sYzFnWVBvSkRtQ3VZODdtSXNzUGZmSWZj?=
 =?utf-8?B?NnpJZFRYM0dmRTF4N05ITm1ibmpJdTBoS2R0SHRhWGF1VHRwOFRGbFh3VWpr?=
 =?utf-8?B?MUdSc3ZEZGVpbDI4ZlRpSGlTSm9vUGVXbmg0RWU3anFlYWZrT1R2c0c3b0Yx?=
 =?utf-8?B?djkzQThhMC8rNXFwLzU2NkYzcjJrcXRaNWVvK3dHTkVjall3eDQwM2tsemtE?=
 =?utf-8?B?K1Avb0xpRHhBTU1ocGRQV3QyditlaTFVZ0hnVUJPVEVkUDdiNC9oTlpsRmlP?=
 =?utf-8?B?M0NVUk9wUTRZdGVYdDFzb0VraEpSR1NYWUViQVA1MHJYcmpub2plTC9tRmQ4?=
 =?utf-8?B?aFRVU2J5WElrOC9RY1lCdVRUS2VHcWIyNHY2SGVDOVE2UkQyMjZsYjYzSzZX?=
 =?utf-8?B?a3Y0MytqN1pGMkVsWWUvSFBBaEd0QXE0Y3dNVGJXVzAya3ExU1FGRzBJTXJu?=
 =?utf-8?B?Sm5UeWR4TGxjM3FIcWF1V21xaWY2MzVDNTVuaGRwdXNYS2hGUjlCem10d2sz?=
 =?utf-8?B?QUxBa1VpZzJqR3hvNDhGV2VBemhXWnR5UjRkQk8vZTFPTmhtU05CZm9YMUMz?=
 =?utf-8?B?NmZrZ2U0dEJkQ3lmSlRZZWI3MkpGdERwSlBlTlNzMVNMd2FDNlp4dWdNanN3?=
 =?utf-8?B?Q1dwaVdiZHhsVEJYcUhxeWo0YWtmWEtxejg5bElNQk9Sdkc2M1dXT2xweUZS?=
 =?utf-8?B?bHoyNXBOQ2kxM09SeEJWS1FJOTZTMnk4T3hLVDdZSDNPUXNZNmp1bjdBOTJx?=
 =?utf-8?B?em1ISjdBMVM1MlBzdE90SDNpSlZXMitpdFFBV1ozc2ZOZENJRkZUQ0RPdTdC?=
 =?utf-8?B?dVdVTzFOMFZRVWp1WGt1Nms2MG9SM2FBNmtyK2lwMWttalRZcVdDNmMySENG?=
 =?utf-8?B?MmkvdnE5ZTZNb2hXdi9VTTkzSlVzbm9xQnUzNUtJOWtNV2pLR3owdUFxZ1Bn?=
 =?utf-8?B?c0JYbVNXQWNteHMzK0pIMklBcGw3bFM5bUFxeGtSSzB4NUpuNUdSUkhzTGxV?=
 =?utf-8?B?OW9IYnRNM0ZSN0JmbnBrcVNPTFp0bWdxTU1mZVo5SVhJWmNiQ2xIRG1mYmVI?=
 =?utf-8?Q?7dM0pPmKhF4Xsdz/bM5CcXgkp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1870847999697749ACF71426459CC515@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bX2xXAkHpEjbdajpqJIHU/NGRL1e0hH5eqwQ27KSzt+BhmutTphbn8GKd8HIXIkV1UyyM57yqkFQXrQwcsrEzlbNDxuiGZwZRAg++SY5xzrj+xVsFaRa8ACYkBdYQkZdmoRKk2BYPR95trhU0Asn9uIaZEfyR2ChtMk2juJmE25Yjbrm/Bc6hzbpWIBc7XAvMzdqTITXYJyM+1bxJRYbOULjN5iLLGskX6Q0zEK9npjdBE1/oC/R3mkjhBzX2YPsolA8bbi8tiD0hZ4Rn11DF9jsIht8HzatKwxXsmo+W8u8Rk5tbRnt+VqlG4sFVVPU7RGAlWUQCTOb15GXmyqmtbp1zTDIWHKOwzumYqgWALcO//tZ/34b+bEs7fkhrovU8Ro4eKvT+Y1c6el/mHSeZ/oO8NDDzXqgWo7OP269TcOWHlLrSbR5pqyNphnjO4pzKZsI/2l8iXXAOkpBM7jWM2ARfBxbwfds96H+gjQUxskAZbH2Io8iP0eD9sfIwU0ofQRXI5YZRZz4rwnV1CHU3/fRUX94qvq6p2cT6Eo+tcDiZz9GzxZg6nuA/u+zOJOe+ArKu8OnXN9ga6beMi2zGrlGJxShtOHR+O33sM/yIs97gmg7Uh/O5cwJO2QYkWui+vvzvC3QPyVcQVs7SNJWwbSgAt3ZAMvuGqAvvhYN8QE9pl2aR7K75pSEB/RkDXr4Czs3sPZu2FuAuGGDnDDPJpoNrauYSYG4ug+V4+dD89eCAcMV7HMkqaMI6WOHK+5ep71TBrzPyHjgBcgQqFtLD1T3jHhfgSC4HjOGm9y+egiMKOHl0+8g2LxsBn43oEaK
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f847a9-e950-4bfd-cedb-08dad3a786bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 14:22:49.9594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pYIBXZGATuajqzNeWDown9dJluJkz3IW9poc0hOt3XV6lMnuiQqLlp263lH8PFaB2y0C9Wxv8bU8+v7X8cfHLNPYzLzl8wosMhli7LrXnjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5935

T24gMDEvMTIvMjAyMiAxMTo1OSwgQ2hyaXN0aWFuIExpbmRpZyB3cm90ZToNCj4+IE9uIDMwIE5v
diAyMDIyLCBhdCAxNjo1NCwgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNv
bT4gd3JvdGU6DQo+Pg0KPj4gSW50ZXItZG9tYWluIGV2ZW50IGNoYW5uZWxzIGFyZSBhbHdheXMg
YSBwYWlyIG9mIGxvY2FsIGFuZCByZW1vdGUgcG9ydHMuDQo+PiBSaWdodCBub3cgdGhlIGhhbmRs
aW5nIGlzIGFzeW1tZXRyaWMsIGNhdXNlZCBieSB0aGUgZmFjdCB0aGF0IHRoZSBldnRjaG4gaXMN
Cj4+IGJvdW5kIGFmdGVyIHRoZSBhc3NvY2lhdGVkIERvbWFpbiBvYmplY3QgaXMgY29uc3RydWN0
ZWQuDQo+Pg0KPj4gRmlyc3QsIG1vdmUgYmluZGluZyBvZiB0aGUgZXZlbnQgY2hhbm5lbCBpbnRv
IHRoZSBEb21haW4ubWFrZSgpIGNvbnN0cnVjdG9yLg0KPj4gVGhpcyBtZWFucyB0aGUgbG9jYWwg
cG9ydCBubyBsb25nZXIgbmVlZHMgdG8gYmUgYW4gb3B0aW9uLiAgSXQgYWxzbyByZW1vdmVzDQo+
PiB0aGUgZmluYWwgY2FsbGVycyBvZiBEb21haW4uYmluZF9pbnRlcmRvbWFpbi4NCj4+DQo+PiBO
ZXh0LCBpbnRyb2R1Y2UgYSBuZXcgcG9ydF9wYWlyIHR5cGUgdG8gZW5jYXBzdWxhdGUgdGhlIGZh
Y3QgdGhhdCB0aGVzZSB0d28NCj4+IHNob3VsZCBiZSB1cGRhdGVkIHRvZ2V0aGVyLCBhbmQgcmVw
bGFjZSB0aGUgcHJldmlvdXMgcG9ydCBhbmQgcmVtb3RlX3BvcnQNCj4+IGZpZWxkcy4gIFRoaXMg
cmVmYWN0b3JpbmcgYWxzbyBjaGFuZ2VzIHRoZSBEb21haW4uZ2V0X3BvcnQgaW50ZXJmYWNlIChy
ZW1vdmluZw0KPj4gYW4gb3B0aW9uKSBzbyB0YWtlIHRoZSBvcHBvcnR1bml0eSB0byBuYW1lIGl0
IGdldF9sb2NhbF9wb3J0IGluc3RlYWQuDQo+Pg0KPj4gQWxzbywgdGhpcyBmaXhlcyBhIHVzZS1h
ZnRlci1mcmVlIHJpc2sgd2l0aCBEb21haW4uY2xvc2UuICBPbmNlIHRoZSBldnRjaG4gaGFzDQo+
PiBiZWVuIHVuYm91bmQsIHRoZSBzYW1lIGxvY2FsIHBvcnQgbnVtYmVyIGNhbiBiZSByZXVzZWQg
Zm9yIGEgZGlmZmVyZW50DQo+PiBwdXJwb3NlLCBzbyBleHBsaWNpdGx5IGludmFsaWRhdGUgdGhl
IHBvcnRzIHRvIHByZXZlbnQgdGhlaXIgYWNjaWRlbnRhbCBtaXN1c2UNCj4+IGluIHRoZSBmdXR1
cmUuDQo+Pg0KPj4gVGhpcyBhbHNvIGNsZWFucyB1cCBzb21lIG9mIHRoZSBkZWJ1Z2dpbmcsIHRv
IGFsd2F5cyBwcmludCBhIHBvcnQgcGFpci4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPj4gLS0tDQo+PiBDQzogQ2hyaXN0
aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPg0KPj4gQ0M6IERhdmlkIFNj
b3R0IDxkYXZlQHJlY29pbC5vcmc+DQo+PiBDQzogRWR3aW4gVG9yb2sgPGVkdmluLnRvcm9rQGNp
dHJpeC5jb20+DQo+PiBDQzogUm9iIEhvZXMgPFJvYi5Ib2VzQGNpdHJpeC5jb20+DQo+IEFja2Vk
LWJ5OiBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+DQoNClRo
YW5rcy4NCg0KPg0KPj4gdjI6DQo+PiAqIE5ldw0KPj4gLS0tDQo+PiB0b29scy9vY2FtbC94ZW5z
dG9yZWQvY29ubmVjdGlvbnMubWwgfCAgOSArLS0tLQ0KPj4gdG9vbHMvb2NhbWwveGVuc3RvcmVk
L2RvbWFpbi5tbCAgICAgIHwgNzUgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0t
DQo+PiB0b29scy9vY2FtbC94ZW5zdG9yZWQvZG9tYWlucy5tbCAgICAgfCAgMiAtDQo+PiAzIGZp
bGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDQ3IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRp
ZmYgLS1naXQgYS90b29scy9vY2FtbC94ZW5zdG9yZWQvY29ubmVjdGlvbnMubWwgYi90b29scy9v
Y2FtbC94ZW5zdG9yZWQvY29ubmVjdGlvbnMubWwNCj4+IGluZGV4IDdkNjhjNTgzYjQzYS4uYTgw
YWUwYmVkMmNlIDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMvb2NhbWwveGVuc3RvcmVkL2Nvbm5lY3Rp
b25zLm1sDQo+PiArKysgYi90b29scy9vY2FtbC94ZW5zdG9yZWQvY29ubmVjdGlvbnMubWwNCj4+
IEBAIC00OCw5ICs0OCw3IEBAIGxldCBhZGRfZG9tYWluIGNvbnMgZG9tID0NCj4+IAlsZXQgeGJj
b24gPSBYZW5idXMuWGIub3Blbl9tbWFwIH5jYXBhY2l0eSAoRG9tYWluLmdldF9pbnRlcmZhY2Ug
ZG9tKSAoZnVuICgpIC0+IERvbWFpbi5ub3RpZnkgZG9tKSBpbg0KPj4gCWxldCBjb24gPSBDb25u
ZWN0aW9uLmNyZWF0ZSB4YmNvbiAoU29tZSBkb20pIGluDQo+PiAJSGFzaHRibC5hZGQgY29ucy5k
b21haW5zIChEb21haW4uZ2V0X2lkIGRvbSkgY29uOw0KPj4gLQltYXRjaCBEb21haW4uZ2V0X3Bv
cnQgZG9tIHdpdGgNCj4+IC0JfCBTb21lIHAgLT4gSGFzaHRibC5hZGQgY29ucy5wb3J0cyBwIGNv
bjsNCj4+IC0JfCBOb25lIC0+ICgpDQo+PiArCUhhc2h0YmwuYWRkIGNvbnMucG9ydHMgKERvbWFp
bi5nZXRfbG9jYWxfcG9ydCBkb20pIGNvbg0KPiBJIHdvdWxkIHByZWZlciBIYXNodGJsLnJlcGxh
Y2UuIEhhc2h0YmwuYWRkIHNoYWRvd3MgYW4gZXhpc3RpbmcgYmluZGluZyB3aGljaCBiZWNvbWVz
IHZpc2libGUgYWdhaW4gYWZ0ZXIgSGFzaHRhYmwucmVtb3ZlLiBXaGVuIHdlIGFyZSBzdXJlIHRo
YXQgd2Ugb25seSBoYXZlIG9uZSBiaW5kaW5nIHBlciBrZXksIHdlIHNob3VsZCB1c2UgcmVwbGFj
ZSBpbnN0ZWFkIG9mIGFkZC4NCg0KVGhhdCdzIHN1cnByaXNpbmcgYmVoYXZpb3VyLsKgIFByZXN1
bWFibHkgdGhlIGFkZC0+cmVwbGFjZSBzdWdnZXN0aW9uDQphcHBsaWVzIHRoZSBvdGhlciBoYXNo
dGFibGUgaGVyZSAoY29ucy5kb21haW5zKT/CoCBBbmQgcG9zc2libHkgZWxzZXdoZXJlDQp0b28u
DQoNCn5BbmRyZXcNCg==

