Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DF3752664
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 17:15:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563220.880334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJy1m-0000Pe-5R; Thu, 13 Jul 2023 15:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563220.880334; Thu, 13 Jul 2023 15:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJy1m-0000Ny-2B; Thu, 13 Jul 2023 15:14:46 +0000
Received: by outflank-mailman (input) for mailman id 563220;
 Thu, 13 Jul 2023 15:14:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QZKt=C7=citrix.com=prvs=551b96af5=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qJy1j-0000Ns-Ft
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 15:14:44 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd42a861-218f-11ee-b239-6b7b168915f2;
 Thu, 13 Jul 2023 17:14:42 +0200 (CEST)
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Jul 2023 11:14:39 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6344.namprd03.prod.outlook.com (2603:10b6:a03:395::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Thu, 13 Jul
 2023 15:14:36 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::f3c4:948d:a70a:de2a]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::f3c4:948d:a70a:de2a%5]) with mapi id 15.20.6588.025; Thu, 13 Jul 2023
 15:14:36 +0000
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
X-Inumbo-ID: fd42a861-218f-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689261282;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IPPkEQVeSGFSttT+Zv26DftA4N4vBn0+PGuVY/jt1P4=;
  b=RtpDWuW21GyGKoZmmzf5zQvsqO7TFjT0zXudRdt3y30ecsY5+in1u/QY
   epsB6u3go9jpI8e7QP+KvxVKaW8zj/UDZsiJ7B2y380UvvKMxhKyJ5VV1
   PRLgAkytYiUu9s+/NPgy/jNbsoUFiWb/N2wuKlCy0ZSbHNXhKjOS5EiPl
   8=;
X-IronPort-RemoteIP: 104.47.58.103
X-IronPort-MID: 116137583
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:fOUOyq5FB+3cSmKTvYX2JQxRtBvGchMFZxGqfqrLsTDasY5as4F+v
 jYWXDqBaP/bM2P1fNkja4q2p05V65PSnYBgSAdq+Co9Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPa8S5weE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m/
 vMidisSTRq6u/u75e+CZss3ncIPBZy+VG8fkikIITDxK98DGMiGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEooiOOF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtLSuTjqaM62zV/wEQxDCczTWuEn8Wcg3z5ef91M
 1YK3AwH+P1aGEuDC4OVsweDiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6ceWjgCx
 lKP2dTzClRHsrKPTmmG3qyJtj70Mi8QRVLufgcBRAoBptXm/oc6i0uXSs45SfbuyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CChRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:+wRpPKEoIleCk5nkpLqFrZHXdLJyesId70hD6qkRc20hTiX8ra
 vBoB1173/JYUkqKQ0dcLy7WZVoIkmshqKdn7NhX4tKNTOO0AGVxepZnOjfKlPbakjDHuU079
 YeT0AXYuedMbAQ5/yU3OF2eexM/PC3tJmNwcPi5zNVSwduApsQnTuQyGygYzNLrM0tP+tIKH
 JYjPA31gZIAk5nCviTNz0+Ru3eoN+OvIv+CCR2fiIP2U21lDa177y/OASZ2xp2aUIz/Z4StV
 LdlhD/5OGFu/W2oyWssFP73tBtgd78zdkGItKKhtN9EESLti+YIL55XqGEvnQOgMzH0idTrP
 D85y04Oth16TfqcnqrrQDL0w3tuQxekEPK+BujmH7+ps68ez4gEcpGgutiA2Hk13Y=
X-Talos-CUID: 9a23:Y99ELm2ZvDBjIFDZj9z/6rxfEc8fLGbC733pH1a1LDtQZJ/OUlm80fYx
X-Talos-MUID: 9a23:YJewPQQnKcHmkDTBRXTOgAtHLPdX3ZiLAXJKs7gso9OaEwpZbmI=
X-IronPort-AV: E=Sophos;i="6.01,203,1684814400"; 
   d="scan'208";a="116137583"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g7Ih3mfJgjCtC9X14Uq5eXkAcH5DgZgsV3AQ4GF/f/xwkzZDX27g1jygtcZ+5DW+0bxI6an4b6qfxO8JM6ZSN0NJrqI4U6CciSXXPl+rcO+wUKnYoPMjMoy199dXFhJ46xaZUOaDTNQNYvvZSpifOApNVNuwDFPm26hMWOMKpquo2Nao1BgntP9k6us13rM5SBl8kRG8AIbxYyUw6IdonubwKeG3oTcx19aj/h1idy8zPVASxopHOJyasyPg0hti4gHGwBHh/7YnI7FGe9oJo2KWGVsC6UhyJU/8a3PAz/mMwMDqr/TOvnzjoGhqe//GrHruaxY/UIO8Nc42zLfYMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJsj4KSe5JAhjFlCBYkS2o/CEljs6ul5TGHCIlkNXKc=;
 b=G/x8IRKDG98vRBbiYPtWliED5ahHrm1OyItnjWLcArjRE7OuVwRYEP39eS2BKFI5wpaS6wF+7T2XF7aEWsF1naDuYkqkbWdMG2Oz51sHRF2OgKBqi7YBK7e8Iy+3XIBNMqHaAojBtymXCjTLjA9nONty2tAGaCPchyI3QGLGEHkH7Z/b98i8LXjxVOHCE5WW2G7xBjRizE3+OY40a7xRzAjdJ9MLJGewA5b26xPumVKxd4ZJ0xxxbVZ47/fYnF7uW+YfUlklOSVv0OEEv+E7Hd/0qOq7vX2fukOYYhQ67OOsvNz7btUVWMkzUfgGc2hfifvcQ1rx8MVrYJ1XicWZQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJsj4KSe5JAhjFlCBYkS2o/CEljs6ul5TGHCIlkNXKc=;
 b=qQQJNPIzWMUXhQChBEBd+mnkQ/aIHWQfikn2P4E7/zxrgdDHsSWZb2zxtKTL8+MJQZ8C7fF4TKtd/JayG/8C18owpmsHH7DMTnwV1AdxLLWLcVUJxrgD9/R0OZpRj7ZTHIUZOweloFyEgjhKFbwjbUXM/gxuG4q48uyf+EWGXQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6cb49c4c-b355-38a0-5d96-9ca4938ac145@citrix.com>
Date: Thu, 13 Jul 2023 16:14:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/6] libs/guest: introduce support for setting guest
 MSRs
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <20230711092230.15408-1-roger.pau@citrix.com>
 <20230711092230.15408-2-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230711092230.15408-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0206.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a39743c-6a14-4a1c-1ffa-08db83b3deb4
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y87/z0rUEHtNcPv9hmBjpIO2y0HvljN8XdB64pEweP0Hg52JfGdc6baWxiKzTfT4sS7ZB0lJ4zlZfdT0h6lTc5JYTDNE7UX5PGpJhbOj9dLWVyczr9IsJ6e87inJVyhxcEGusrQB84yGjzANDUQaxUz1SuSP2sbxKuvMlIUmemb68c0ENue/iDefMw3Y51eM84bWWMUCsDINF0gh8rSEjj+oMW3HjMPztBkM0FYrwSTr1+VmUTYpQogmsM9tVSQgqsdTqyKtWg1Izod9vOXouTtPZW5wyoOQWltvIw+zSB8dirIxOHQViRq/59TjG/IQgspNAMELkJhWJoKUFV5dluAauRWJyfJsJ4CC4O4lqGK5NZRjSAmWOd+gWI2d+PyqhdgAsKFvI2yKGKDVrTOQ2oQhZUb9OgjXWhog/C/6GEiozJ2kMs6pu4XqXq0LfYvh3K44dIM7i/5S6TrmE9Y7kfRCk9gN2m7uOUQDtTbS+H+Km/kWiwY8/uyKRIl5jQAvmKfoLJCqr6uPTHTdujcQguUhN7u9YED3ImhC/KXWfhQ2xg4XtwPsHJ0ItdxK5c5n12QrT6tlgk5HUja1dXB5+Ff/io4YUI3mHbclv9Qwx0sYP84z2WNGPmhddkMxf3AphY6AoyPzK1nP32TflcXuPg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(39860400002)(396003)(346002)(451199021)(31686004)(6666004)(6486002)(478600001)(54906003)(86362001)(36756003)(31696002)(2616005)(4744005)(2906002)(26005)(6506007)(186003)(66946007)(53546011)(316002)(6512007)(8676002)(8936002)(38100700002)(5660300002)(66556008)(82960400001)(66476007)(41300700001)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXNpbTQ3dHRxcUhRa0FRdElXaG1PQU83c1VQTUszcm00YW43NXdlZ01EQUNY?=
 =?utf-8?B?dm5hK1NhRUZDWW1MUVdDd29lRVNKS1lnakJ0b3NGUjlVOFUvQyszU3RlTWtp?=
 =?utf-8?B?dW50a3UrNllSYkcyTEd6SzM4UFBPdzhveTQ1UU4rODFMejQzZFhlN01YQTVW?=
 =?utf-8?B?VlJ3WWkxdC9UbmQ5ck1vaXhVSUhIbmZ4bkhwYUZBMHBBUjJ1elVweExTZ0lH?=
 =?utf-8?B?aDU2dEFPZWs4WnlnUlMvVW1CTTloL01qVk5BL01YWVF5SmNVQmhvWFliQmpJ?=
 =?utf-8?B?MFBBS2psalBVT1ZWOW1ZZktTblNKWjBNTm1UOUlzaS8zQ1JDcG96S0FldmJZ?=
 =?utf-8?B?YWcySTZnVFNJTE9zZXI2ZDg2bzcxQ0FoY2d2WmZvVjVXZTd6NENqa3YxTkdM?=
 =?utf-8?B?dU93OGJkTGN6dGw5NHQxUndwSU1xbFVEbVhDZlJQTkRoSHdoUHVFdjEzYUsx?=
 =?utf-8?B?THdjRlFRb2U1VzZGMmRYd2JZQ0xrWDMzendZMnM5eFJZQ080dTFtdkdPUElO?=
 =?utf-8?B?bkFlUm9vYTl5ZklaN2pVcytWbEZYWHdpL0tyMGJPTW9WN1hsaC9CTGoyT1JE?=
 =?utf-8?B?Umw5dXdTbHdGanFwS0tKTHZwSzVTSUN3MXIzVEdaRW1BeTBObFpkL3hvUmxQ?=
 =?utf-8?B?aW5lU1IySEo3L3kxV0xINFV2anh2LzRZUnlLakRyTVJXYnUyeHNONFBmZW5H?=
 =?utf-8?B?MFRrMTVsLy92QWVKM28wQUl0anhuTzUwckZZMFJYZ3pJam1iNm9ndkZ0TU9U?=
 =?utf-8?B?QXFncVpnSlpzK2FaZjJaNndhenE3aFM4SFA2K2M4dkV5Z09QWk1FVmhHSnE3?=
 =?utf-8?B?enNKUkNyeHR0MjB0aW13QmJkdjEvMVF4NUd1QlEzcFJNTnE0a2h5Ymc0VjZl?=
 =?utf-8?B?L2hKTE1oQzNpN1FWdHNTbVlzKy90alo5Wno5MmliVFhXVFlaYTFiczVPVE5D?=
 =?utf-8?B?UUw4b0ZGTklabC9kdVlrZThibWxlTVc1d0JDVmJadFJPY3gvdlNSeTJtc0dr?=
 =?utf-8?B?ajN3K1hjeEZpdzdYQ2lIRVJoR1Y5VmgxK1ZZQkZhMGpoUHhTd3ZPb0Yremx3?=
 =?utf-8?B?RkhtSnk5MlN1ZCt3WjhLZUxheFc5R2lhN0wzbzFsNUQrd2pFc1g0Y3VBZVIw?=
 =?utf-8?B?Qlc4N2E3VzlSZUN1eGVoMTVTVjcvUDE1RHIzQUVtbUFWSUwrSHcxZGNOL2pL?=
 =?utf-8?B?eVAxQm0yaWV0OGNydTNUWXlNWE9xbEg0VTF1UnpraERJSEl5UHV4K1dWSmNZ?=
 =?utf-8?B?VGpsL3B4KzRwK2hTL3pIbHBNWkU0ZWtCK29iYlQ2QU9wMStkQzd2T1UxZTNp?=
 =?utf-8?B?MjgyQ3ZrRWVKTnF3M096Yzh1Umt3YmpPTE1WOHRCNG1BalBYbEdGY3plWXlm?=
 =?utf-8?B?YW1aUjNLbEtxMmFlU3JnNFBFKzNGNUtFMEJPWlpiVVJjWEE3dXBBVHM5d1du?=
 =?utf-8?B?b29VcmpIUFR3dkkrbHJmR1M3bmVOeVIxbGpGekNlU2VSdk1vOW15QURROGJ0?=
 =?utf-8?B?bld5dndCa2FwODlTRHJzVmU4T0ZsWlFYVDBtY0xXN09sYm5rbnl4NUsxT2ZP?=
 =?utf-8?B?eVhsN3FtVy9qNkpFcmlWWnVITElBTUxlN1BZNHZCNDRBMTF4bGlkZFdLcDhy?=
 =?utf-8?B?WS9uc2pGa05JOUZFeksrV0R1NVpQYmtZYjdXdkp3aE9EaFNaeTZWclJpRUYw?=
 =?utf-8?B?ZmMrUUs3OEV4Rmx3d2JndHhRU1dyMURFcmR4R3FjOVk0eXNNVWNEV1dkc0RW?=
 =?utf-8?B?Q2k0Vno1ZGh3ekEzQjNpN1BBZWhNcXZVcytTa0xkRUpzd2ZhUkVsc2p1MHhC?=
 =?utf-8?B?SUZvRzE3U1RJWXpFU0dVNzJIQXExSkE1OHZPcWU1M1pMMDF3Sy9tQTQ4eWFt?=
 =?utf-8?B?U04yd0NQUkFHOGNYRDJUQUp3VWtpK3IyM2JuRFVYQ1BCTnRvK00xT3lGUTNL?=
 =?utf-8?B?d0xTTDhyMTNRczZpZHVVTk5HN1JmajJ3Snd1OEFTaHlFUlJEZEYyQXdBYTNE?=
 =?utf-8?B?UlVlM2tvdlJQeWJkQUJHTzVKYUd4MDRyVGFjVEpINDNwcnFUZUY4K2VyUzhN?=
 =?utf-8?B?akJSeE1nU2w1NFVhb3NHUHlhemtoRUdrSGowelVrNXdKU2lNNk1jTnJaVDdo?=
 =?utf-8?B?d3RpUHRhWmtuaUJFd2pjbG8vdmVBNjNGMmZDWi9mSXdsVnczd001LzFpMVVG?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rK7qZAW/zG3whjcXawMNacZ545Yw5ocwSk5bPMHR+IPef4pD6hWzvTbizIe+/3d6lpRkzrvpSh1Dk+//RQ9GEcTfe6C1MNMDGUE1Z0vB91UDtLLSnuyuWv5aLnfvjoMgTpoOT2oSgaV6o1XZAhskMTZNVZb4VJykdeCswYd6d8TtXGS3b5icV9xKoYss1XVepgALfzGBs6ZNV0eL2/2kFHftO+sbP1LQ9zKhQTQCLitchgtjWM1wzoCs191Jv8hFLX3RCulksufannvNv55ld61+qfO/K2z1sLsl4o3O+HbRzh8M00ee7tEISTF0fQiOnmg4gE/FIWLELEaKLdv7dtJCGKnkNsFnTlWaGfqzTNaKNwj1acnWEZXkbA7RNia/EflGrgyDtvoL7nq21aUcoC7WD57hu5MMFpB7uBcBieo+dgJkXE8w5vRvyCXwscsEbijJkbASMcAT5rAu6kdH5LqzD8Ran/POZkNYFAveWcXkV74Kn3J1NV4pHqN1eSXXrrDe3iuL3nbri0BHQVeLDlvGluVWfoLCmOxQdFXkInxWbvmXi2atMxWeSMJaPI8waLodWpEjltrY6kjKwH+ATPNvqsRq2gofq2aTArewOpLGiw0SeQWwVLzWaOxH39lL3fyufaVVAAS4cyjG6YhX342shv6JrlVYbLLmt7lCoqxBOOmuc0Iyv/vbHMPVuZH1kbRzqtmlrB4SAJZGQD0Dz6gpXKglvMOn780wYEBNgQSsRTUuzVPFEWbkx9QWtskaMT7M0xA+q7VLv5qjrguVdO0pCiepd3FhN489BGtAq1m4+cn7M0gJA8IwKICVA6WD
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a39743c-6a14-4a1c-1ffa-08db83b3deb4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 15:14:36.4579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7VSRx/1u7inW9bAZHH5X57dfstjXSsM5fAXeIW4qnJyocKfSPolK//1/eDMU2MyhWwS9pu9Ek4DAGLorVeELYzRt8mwqJVTlMmQm8rLXABU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6344

On 11/07/2023 10:22 am, Roger Pau Monne wrote:
> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
> index 5b035223f4f5..5e5c8124dd74 100644
> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -423,10 +423,169 @@ static int xc_cpuid_xend_policy(
>      return rc;
>  }
>  
> +static int compare_msr(const void *l, const void *r)
> +{
> +    const xen_msr_entry_t *lhs = l;
> +    const xen_msr_entry_t *rhs = r;
> +
> +    if ( lhs->idx == rhs->idx )
> +        return 0;
> +
> +    return lhs->idx < rhs->idx ? -1 : 1;

The sum total of logic here is just

return lhs->idx - rhs->idx;

(I think.  Double check which way around the subtraction works.)

You don't need to return -1, 0 or 1.  You only need negative, 0 or positive.

~Andrew

