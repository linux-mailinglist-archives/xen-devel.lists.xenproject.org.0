Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA749372DF0
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 18:20:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122576.231192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldxms-0005bZ-H6; Tue, 04 May 2021 16:20:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122576.231192; Tue, 04 May 2021 16:20:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldxms-0005bD-DO; Tue, 04 May 2021 16:20:42 +0000
Received: by outflank-mailman (input) for mailman id 122576;
 Tue, 04 May 2021 16:20:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Poa=J7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ldxmq-0005b4-Nv
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 16:20:40 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc2d8228-76ae-4fef-b6ec-ff6481e970ea;
 Tue, 04 May 2021 16:20:39 +0000 (UTC)
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
X-Inumbo-ID: dc2d8228-76ae-4fef-b6ec-ff6481e970ea
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620145239;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KsnMXnRy/pU1+QexvNN9831BNueRCcEbO329Kx33PUQ=;
  b=XnViGN3xajh6eJsyQahj686xwFSSgqF8CRahBw1mSj/9BS1GglI9ahrx
   1WZqBU8E8Oszua4Ke3ZOKH3fSV45wHzbkDpfiHa4pay46DgXny3as9lNN
   d0DU6Wg+4lp0O7KwIQsOKd+QCtGqhYA1lm6OT1H5fqtRqqkWFjII1Tqzg
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UGLBQrAe3JPA13tvpVI7R0BaKLKDBAIQs4ARy2Mj69sBrV6D4BAjaOVnGGxK26Qed8/BxBXxZx
 xc0zqeuuVKWk3m9VIonrXbPPPG4TWB1PsFaMhnzO8PlA7r1D12SG7HPdd696EOwQ8EzgGmZFMW
 S9DUvWLRU5ps8ciHQyJyZjNw0KFf9FPt6qrhnIlYRR3BLq8I/U7VsF5cfWNirpqyQBEyx9NTnT
 y2ugJaDbaIZRCO5N1Qg9WeEDLdt6qwSRcg/9yhF7rYzYBH3ccKx49qLg2xJUDAqMqyFY5NfwjB
 /vY=
X-SBRS: 5.1
X-MesageID: 43154837
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:zrNUaamtzybtDjpdPrvLEZaSca/pDfOBj2dD5ilNYBxZY6Wkvu
 iUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLN/AZ6LZyOjnGezNolt4c/ZwzPmEzDj7eI178
 tdWoBEIpnLAVB+5PyW3CCRD8sgzN6b8KqhmOfZyDNXQRt3brx7hj0ZNi+wOCRNNW17LLA+E4
 eR4dcCgjKmd2geYMjTPAh7Y8HoodrXmJX6JSMcDxk85wWUyR+u4rj2Ex+Xty1uLw9n67Ek7G
 TDjkjF9ryu2svLtyP0+k3yy9BtmNXnwsZeH8DksKYoAxjllwrAXvUYZ5SspzYwydvfjmoCsN
 6JmBs4OtQ21nW5RBDOnTLI+y3NlAkj8GXjz1jwuwqRneXcSCghA8RMwaJ1GyGpknYIh9133K
 JV02/xjfM+Znmh7UeNkuTgbB1kmlG5pnAvi4co/htieLATdaNLqsgn9F5Vea1wbB7S0pwtE+
 VlEajnlZRrWG6dBkqp21VH/MahRTAaEBuAXyE5y7eo+gkTtnV4w0wE/dcYj3cN+bksIqM0lt
 jsA+BGkqpDQdQRar84LOAdQdGvAmiIeh7UNnmOSG6XW50vCjbokdra8b817OaldNghy4Yzoo
 3IVBd9uXQpc0zjJMWS1PRwg17waVT4eQ6o5tBV5pB/tLG5bqHsKze/RFcnlNbli+kDA+XAMs
 zDe65+MrvGFy/DCIxJ1wrxV915Mn8FSvAYvd49Rhanvt/LEIv3rebWGcyjZIbFIHIBYCfSE3
 EDVD/8KIFr9UawQEL1hxDXRjfDYUr60ZVsELXL3uQaxYQXX7c89zQ9uBCc3IWmODdCuqs5cA
 9VO7X8iJ62omGw4CLp4gxSS15gJ3cQxI+lf2JBpAcMPU+xW60Eoc+jdWdb22bCAhd+SsjRAT
 NOvlgfw9PxE7WggQQZT/63OGOTiHUe4FiQSY0Hp6GF7cD5PrQ1E4ghQ640MQnQDRR6lUJLpQ
 54GU45b36aMgmrpbSujZQSCu2aXcJ7mh2XLcldrm+ak16dq8EpTn4yRCWvTsaTvAYrS1Nv9x
 9M2p5apIDFtSekKGM5juh9GkZLcn6rDLVPCxnAWJ9ZgYnxeAZ7TX6DgBuTjx1bQButy2wiwk
 jaaQGEc/DCBVRQ/lRVyLzj/l9PemKBRE5ocXxhvYphFWPJh2Zr3YawF9iO+lrUTmFH7vAWMT
 nDbzdXGA9oytyt/DO+mTqJFxwdt98TF92YKI5mX6DY23urJoHNqLoPGOVM+o15cPr0tPUQbO
 6ZcwiJDT/xBu8zwTaJrnI9NCQckgh8rdrYnDneqESo1n82BvTfZGl8T7YAOteG8izKQe2L3J
 gRt6N9gcKAdkHKLviIxqHcY2Qddlf9oWuqQ/oprp4Rl6Qor7d3F4TaVzyN9Hwv5mRIEO7E0G
 clBIJ86/T9H6UqWeo4USdQ5EAom9SCN1FDiH28PsYOOXUWy0bGNNaI6YfSobUhAke9tBL9UG
 PvhxF1zrPgZW+/zrYUBKI7HHROZGU94Hpk+vmed4e4MnTdS8hzuH67OGS6arlTVeysHqgRtA
 9z57iz7qKqXhu9/ADbpj1gJK1St06hXMOpGQqJXcpF6cazN1jJoqyk5qeI/XvKYAr+T0QTno
 tec0MMKuxFlzk5lYUylhGIdZafmDNsr3JupRd9llDs3YC64GDUWWF+WDep/Kl+bH10KXiHjc
 PM7O6C8m/yiQI1gaX+KA==
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="43154837"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4QvWJaqolRFPvp/7w15Oe2Nqq+rEl22lJd9kz+P0n9JSL4gZEQIwCmghrelsxtKD7zqCcDnIEuGHNDydLpzK2ndnSlQUyqd2MmKfGjMq63aG+JnM+3xjP4+YM9TMQ7l62OfciCV56WRxieyJ10YZY4cQmM8lqSMc1Gleke1lqZyzrggD2U1p0sChUQNes95lTBnkCVScxM9a88gdAyWdIO25/0SaWt3oVF+m66FmP9AD1FXzmMyZ6VlHBKj4QUiJ6U637Y2I3ApzPedw6XyhuJ5mkJ1yWCeShRJmohpaA16rQkqpLUg/MSDAvmLQO858D9OjqfVrovkUy3/q62y2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsnMXnRy/pU1+QexvNN9831BNueRCcEbO329Kx33PUQ=;
 b=UYAkEyE4oHC4K4X+7/dt5puk1Qrxiquj+onec6yki4ZsfB7yWAj6ZHOxVVAUFILwUlLpNFP8M/UvqLqTLUHh2y4tM5jvIfP0nNdj02pq70s+dYLUnTe6Zadnn/DQogqvAhdbL40ZcPJJhACjSz8o86igNHWSu5Dj9UXBAeGDhTKT3mGpyVflsKdxIO5CVV4g76sLV5aOwZ7ZLdk4Kyv7z7jj2VwgzIsjm9yJlVQaJI7zmGqHPffHHwfvN779wEhy9GrVojp6QnhcXATTnlWjAWOaNwaBPASWZju7AU/BIK4puIxGaL0HoigQJeTwiFc4Si0MoTvxSgZuULqgBQtRlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsnMXnRy/pU1+QexvNN9831BNueRCcEbO329Kx33PUQ=;
 b=rej+UlM5tjEOCDRSJt7IS6BhgOadVZi0Ed/KeIvqXFRLPcy7f4fA+Jri4lKgvqoDnj38DTbMci9kFPB36ETg0CxHJtrS4Rz/4PLq+ucU8hEEgnB9sDIhu5LTuIQqifPybHUvjVCxG3GhmCXOS0O8Y6dMmpyYTV9dFAoFiJhIlQQ=
Subject: Re: [PATCH v3 05/13] libs/guest: allow updating a cpu policy MSR data
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210430155211.3709-1-roger.pau@citrix.com>
 <20210430155211.3709-6-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <361b3f93-09c6-7eee-e231-bda07167f06e@citrix.com>
Date: Tue, 4 May 2021 17:20:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210430155211.3709-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0097.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f432d402-ec42-40f0-90de-08d90f188688
X-MS-TrafficTypeDiagnostic: BYAPR03MB4166:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4166F11663F59141B68B1947BA5A9@BYAPR03MB4166.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l8OmF/tBybPqFL5bf0KCI7m8Atb9QvwLQu+s6NLcozBJDDgy+RO2KCgaKGqni87JKwV+dkq5nwBW62kK6QntRWDy1NPXsYJXo6Ylbaq9VRNG1SUFbaWrdck/uoTIpq0EUCuRpjJbCZqVHNHt3FurRGZ9gS54v4U3QJrGT+bOgqlqPBS2RQP4aWiRMMZMcyDCbhRnG8GRZ5dxsXmVcr7ZOym4Pu6ANF2fZIrDLngkeM/oz2QmhNZYVWqbac3hJ/dVn5feI4rPM56ymdAvEbyuTEYZ7s2Hdci5Cq+B0UbYz16QnN0Dvxy1FuRWRkmY9e6EypMQx4xVHgZX4L7E0pAYZ1rayUvVGVSiH9Y7BseBkND/mWJlT7q57MtMbdQhEukfghqgnDEG6C57HhR05UOm2rvH+AwcrPPv5Ov83P3J/tc8nZJ1wbglX7ctpXlDhxHrN9194lJYTxNE38ArbwImB0Dm5yS1QqaCF0sJRTgmuiqMR2OZ/wfTDEsUFYMrs/XmiCFPiJSgDqalBfcEkcc+u2yvMQGHA4NH2C7fQzYn6hUbcbkNAftSnNqXUo/F0bE3PA77rUFNpSvSBwIav09/dAZZ+vSDDDnDfHcRHZ8kX+nz0t+zMTw/sNhKXwQHOzKvEkSmFsxRBI2UkIFzLWGkmJimdKsbF6qSBcovMB8kXTUixzoadlxfH15xj/CtGA8e
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(2616005)(956004)(53546011)(16526019)(31686004)(478600001)(6486002)(36756003)(66476007)(6666004)(66556008)(4326008)(54906003)(186003)(86362001)(4744005)(5660300002)(8676002)(316002)(26005)(66946007)(31696002)(16576012)(2906002)(38100700002)(8936002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UGFXVEhySmZuVWVrbE42ang4c2x2YjNpZWEwUFdzTlZBOERqYUxTS290VldV?=
 =?utf-8?B?S1YwbDVkNlVCcnBpVyt0RnZYMGlHT3VmUlI2VmlSMTRUL1RwdDMyZlptdTNR?=
 =?utf-8?B?VFQwS3J0ajUrYUMxUDY4YTlLNFVKM1BzbWhQZjdYM1djUXQ1MlhFTHJsY3VS?=
 =?utf-8?B?YlFWbUxDNFRVTjRBYU5MeVk0Y2huQXNRNFhySXB5UzE4cW1wUVBJT3EyUDJZ?=
 =?utf-8?B?bFRSOG5ld1o2SHkyRVZqMVp6Z1BPWVR2YklFa1VJUHMySnZoNUp6R08wYWNt?=
 =?utf-8?B?TUFlZVl4RWloRE9HZFR6ek1pOXVTRnpkUWI5VjhvZDlETUFCZDdhbkptYmVs?=
 =?utf-8?B?WlE0SDJOUFAvdXljUnYxUzFYWXdRZFFPUU9EL2ZTaVVEUUgvd0VHNVYyWHFF?=
 =?utf-8?B?YTdkUnFyR3Q0SmloMkptT1crek00RUs2WFRWWkNzUDNVbUZMTENHTW5wRWRm?=
 =?utf-8?B?dWlkYldibjg2UUNEQ3FKY2FwbzgxZitDd1djcy9UaTFsOXFoUXBuMHllVHhr?=
 =?utf-8?B?Q3FZbjhtUnFhU05SQTM1S0RuajdGTC9SbjkrYkkzZXFNaHpMcm5rVlZuNXd3?=
 =?utf-8?B?bi80TVF2Y2JHeVFGdzV4Qytab0VEdDFJQW5GUGJyaHZlaUNOWDhmalJWU25a?=
 =?utf-8?B?QjFCTTNtcHpYVjQwNW02c1pjWmVJK25ydFF5dWpMTGtZNGQvWFZOT3BNbXZx?=
 =?utf-8?B?cExqdDMxWXFHNmhmZmJ4VS8ySmp6V2FwN1F2Umk1OFUrMXk3UmFQWWh0U2Zu?=
 =?utf-8?B?a2l0M1I2TXN3cWhWdm0zTEF2azJwR0NCRFVuYWJtY0l0VS92aW1lWVVyRTJD?=
 =?utf-8?B?YTQrMmVuWm1nQm1lMXhKOGtLQ2FBL2VmQ0dwN1JrNGI3amV1MFRPZTlaVzBz?=
 =?utf-8?B?QmtPWHJiaFI5S0hjNnkycGtrU0gxR2xwdXcrU01sS0oxODU3OXg2dXpKRDZl?=
 =?utf-8?B?V1dmdklVMy95NVpQOW1VM0dEbkZZWlBlR081d1FRMFNUNVBRZStRTFhCcnFa?=
 =?utf-8?B?WXlxanpJWk1ET0UrZVd6RGJwejZEM0xDVXVnaDRSNjY4emFJQktBL2FEZjdl?=
 =?utf-8?B?ejV1ai9qWGRMOWkzUE5rcWZjRDRoOWtYNWZjUHNmb0dHN3dEM2dWWEdaUUlz?=
 =?utf-8?B?eDJoYXFjdUZlRmllT3NYT1BEQjB2MVFNT2ozQVZKNUtaM3VKZW1tM2Vja3ds?=
 =?utf-8?B?cDhKUzVDN2MwbktYMm05MU9MbHZkTmZEaTFqRkpUSnRENDk5RUNHUUcvRFhS?=
 =?utf-8?B?ZUlabjZ2YUVIYU1ab1ZoQ0xWR3I5NGFsUUJyL3JvbUdCTHdjWWlHaStJNjNM?=
 =?utf-8?B?M0lnblpjTkxGeGo3QUxzOTlGRDhQNkJicDE2YWFrVkYwMnUzOS8yOXZFb2ow?=
 =?utf-8?B?QUlCSmw2ZWpwOUxDb0U3V3dHV2JXVU1YT2MrN1ZudTJpNjdnTTNpRHBZcWlR?=
 =?utf-8?B?TGFLQmRkTkVuVHhTRXlraWlLRVdySXZ0TUV5T2V5eWpWYkVVeU9HNk83U0tK?=
 =?utf-8?B?Z0hrUUEvM0VKOU9yNVFUMlJ5ME5FSU5ZOW1RbXpiLzVyaUUzdEdZQ240aFRS?=
 =?utf-8?B?VENCNVpnbHJDZDRwUkhnd25nZmdwZXRsRVFuQnViYVR0Vnc2RDR4VnM5cDZo?=
 =?utf-8?B?YTFBZHdncFcyVXFYeTJxL3B4djFQQ3RER1hoWTMvcmMvYzB3b2tHMGJ6aldT?=
 =?utf-8?B?TWE4bCtUNTMwVnQ2ZFVGODVUN2Z2dHhZdjNhOVRRc01lVFNEU3RzVVliY2dZ?=
 =?utf-8?Q?3sRBcdsLhq1t1ZyaqqXtRMOtjucZZ9jB5ujTT4y?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f432d402-ec42-40f0-90de-08d90f188688
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 16:20:26.3242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fs23i83ZiyoswGdHhPrplaPtNWUW6m1U5cY08VOiH6IMLeLLvToXKdXlvEYwNlkp0CrxLol3MaQg7Q2CxHfSAslI3ztIcE4vp8o1QD9+6BE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4166
X-OriginatorOrg: citrix.com

On 30/04/2021 16:52, Roger Pau Monne wrote:
> Introduce a helper to update the MSR policy using an array of
> xen_msr_entry_t entries. Note the MSRs present in the input
> xen_msr_entry_t array will replace any existing entries on the
> policy.
>
> No user of the interface introduced on this patch.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

