Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3BC351514
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 15:22:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104451.199752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxFr-0004Tt-90; Thu, 01 Apr 2021 13:20:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104451.199752; Thu, 01 Apr 2021 13:20:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxFr-0004TU-5q; Thu, 01 Apr 2021 13:20:59 +0000
Received: by outflank-mailman (input) for mailman id 104451;
 Thu, 01 Apr 2021 13:20:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Onq8=I6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lRxFp-0004TN-6P
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 13:20:57 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4392d44-e5ca-496f-b9c7-2de643c40e69;
 Thu, 01 Apr 2021 13:20:55 +0000 (UTC)
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
X-Inumbo-ID: b4392d44-e5ca-496f-b9c7-2de643c40e69
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617283255;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ot1NR4kkHo35XY5Tw4cWLBaToELK32ub+ZiUd8PP1KI=;
  b=d54GNFsppOz9iFHg08pv6V/dB+JoP5Y6mo/ZLuy8JXUkUq54zBckJKot
   osvIlYn0YR+YvpvPkS4I7E6nOGA8eZB7nyT6yr+B8uxsfc/Vn7DQn/wKv
   dE9Q5hmJP+zv1+1dfVifR5UNomDDWLbVXN0i790tzkFxCvwLtmOlMSsHb
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: mJryrkgdok5c80cSLcrSnpJOC0vh7kSpkZiFqGFwkqi6UvK+L7hed/H4KxM1CzmKEufEEf/X5j
 TzdBC9jX1y/NT9z9G+mQp1mdnA7f4rqHuO5d8/ACH6bC6LhX62nOPGs+ek2xBULTZk33UNQtq1
 7DDpYICwWd6xqi79VcmEX1xJNyJNKKonPIM66fKbxrKi38eTVxa12AIXrtw3EBTFrpN0ZKJyNM
 Yi48d4COgGHn08inHlZudWHDcMJrvLG5X/CQkmd+xvf0xcQ6KEhIbDVbZjmTFo4YzPSCoAR5xI
 z0E=
X-SBRS: 5.2
X-MesageID: 40555887
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:/rmui6vkQ73CWQaucu7UOrth7skC2YYji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOj7U5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qz6Y
 5JSII7MtH5CDFB4frSyBWkEtom3dmM+L2pg+Cb9Ht2UQR2cchbjztRICzzKDwTeCBtA50lGJ
 2Aou9OoDS9cXoaB/7LeEUtde7FutHNidbaehYAHREq802jijmv5b78HXGjr2gjehlIxqov9n
 WArhzh6syYwo2G4zL/90uW1ZRZn9P91sBObfbstuE5Iijh4zzYH7hJdKaFuFkO0YeSwXYs1O
 LBuhIxe/l0gkmhA12dhTvI903e3C0163nkoGXo80fLhcDiXjo1B45gqOtiA2PkwnEttt19z6
 5Htljx3/E8YGKi7UaNk+TgbB1kmlG5pnAvi4co/htieLATdaNLqsgn9F5Vea1wbx7S0pwtE+
 VlEajnlY9rWG6dBkqp21VH/MahRTAaEBuAXyE5y7ao+gkTtnV4w0wE/dcYj3cN+bksIqM0l9
 jsA+BGkqpDQdQRar84LOAdQdGvAmiIeh7UNnmOSG6XWp0vCjbokdra8b817OaldNghy4Yzoo
 3IVBd9uXQpc0zjJMWS1PRwg1HwaVT4eQ6o5tBV5pB/tLG5bqHsKze/RFcnlNbli+kDA+XAMs
 zDeq5+MrvGFy/DCIxJ1wrxV915Mn8FSvAYvd49Rhanvt/LEIv3rebWGcyjZ4bFIHIBYCfSE3
 EDVD/8KIFr9UawQEL1hxDXRjfDYUr60ZVsELXL3uQaxYQXX7c89jQ9uBCc3IWmODdCuqs5cA
 9VO7X8iJ62omGw4CLp4gxSS11gJ3cQxI+lf2JBpAcMPU+xW60Eoc+jdWdb22bCAhd+SsjRAT
 NOvlgfw9PwE7WggQQZT/63OGOTiHUe4FiQSY0Hp6GF7cD5PrQ1E4ghQ640MQnQDRR6lUJLpQ
 54GU85b36aMgmrpbSujZQSCu2aXcJ7mh2XLcldrm+ak16dq8EpTn4yRCWvTsaTvAYrS1Nv9x
 hM2p5apIDFtSekKGM5juh9GkZLcn6rDLVPCxnAWJ9ZgYnxeAZ7TX6DgBuTjx1bQBuyy2wiwk
 jaaQGEc/DCBVRQ/lRVyLzj/l9PemKBRE5ocXxhvYphFWPJh2Zr3YawF9+O+lrUTmFH7vAWMT
 nDbzdXGA9oytyt/DO+mTqJFxwdt9gTF92YKI5mX6DY23urJoHNqLoPGOVM+o15cPr0tPUQbO
 6ZcwiJDT/xBu8zwTaJrnI9NCQckgh9rdrYnDneqESo1n82BvTfZGl8T7YAOteG8izKQe2L3J
 gRt6N8gcKAdkHKLviIxqHcY2Qddlf9oWuqQ/oprp4Rl6Qor7d3F4TaVzyN9Hwv5mRJEO7E0G
 clBIJ86/T9H6UqWeo4USdQ5EAom9SCN1FDiH29PsYOOXUWy0bGNNaI6YfSobUhAke9tBL9UG
 PvhBF1zrPgZW+/zrYUBKI7HHROZGU94Hpk+vmed4e4MnTiS8hzuH67OGS6arlTVeysHqgRtA
 9z57iz7qOqXhu9/ADbpj1gJK1St06hXMOpGQqJXcpF6cazN1jJoqyk5qeI/XjKYAr+T0QTno
 tec0MMKuxFlzk5lYUylhGIdZafmDNvr3JupRd9llDs3YC64GDUWWF+WDep86l+bH10KXiHjc
 PM7O6C8m/yiQI1gqX+KA==
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40555887"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLLnjO1dPcifTSOHaIGs8xIisJ7GBNJ4ftASX4+aUadtB9ZIWhr/XmwRd6BSMqG7BQMzfSCjrsiI8lNuSqdxLqbqLG0sHmJGf/DPeczg1h04Wi8CpRvoq9qKFwMxS9C7uPvKJkGgzamTAAyc8v+bUtWdYW8sCnHPoy52Z/ZIP7yHztBbq2VvUNaEQmLbGI8fnqzalRXOCrCpojgEHLY9N9hXZwL1iKvaVxXrCRvNdesfu4gYxSGppnAUIaUTtNq4jZMCxRxhorefWIndERRzN75UmVEw8Qpr3u/94BVcprJ537JwbgFPkjfk9P3EEd308+dlwM0zH4LWgxiJI4v9Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/OyQ2vrdQax1SqwU6XUja7IVbjW+nUkz7HxDGveAYrc=;
 b=ZPg2PrUgUKNdBUlRz9V2R1cw6lUe+cjYllO8p22jeIH8HoXcALQ5BLi1/xOS3EcoX5iAV9k9fwkHMH4DUG7kIZwxsiR0zdT6MkpYNCQ0MxRdon9SvwvSt27HEFc9iYOWq8on3zD46AQZYUXzDoMd//shEdMu7R3XwFps2ywYOgg7uhR3H/CX8+aYhdVDkPEvPmdbHfpi55Z+IfSjkAg+8/xy0UPE5VdV5pqYP9LtOHQPMJOXd4IS53NhSmR+KQBM3mhdI8dUaKcwpPpdQqb+vuoEwkeNFW99hrySUN/Cxt+G0YHKgQ7HIGNVML5ZbCu1XRDRV2fZkhbkXXDl+P0fhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/OyQ2vrdQax1SqwU6XUja7IVbjW+nUkz7HxDGveAYrc=;
 b=lKaGnBY74GKP9LpFkktQ7jDV2UcqY+FJ9vDfhFkKX4uHSs6J7rauxiv+m3JQmttTvOSPWzOBqOh/fA25aYG5yGNsXdgKJGyMbU/ud9SacYSk8TCo/9YOz87sWYGWpSv3V3CCv84mEpsS9fgPyzn4A3dVnbTFWk8FiFhLrQv+a1w=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210331133125.7072-1-andrew.cooper3@citrix.com>
 <95d8688b-2e54-ae02-09ce-45203959e08a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/hvm: Fix double free from vlapic_init() early error
 path
Message-ID: <ac94721d-1741-5523-e70d-1eac15c23603@citrix.com>
Date: Thu, 1 Apr 2021 14:20:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <95d8688b-2e54-ae02-09ce-45203959e08a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0053.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::17) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be416b3d-b446-40e0-1cd2-08d8f510f8cc
X-MS-TrafficTypeDiagnostic: BN8PR03MB4801:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR03MB4801F7551206D9C3F5926C98BA7B9@BN8PR03MB4801.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7rKxCIc/bbBMVgebxX/S4RSdj/vHo2dOVL5DBrcrSYn2zYSdiquQ2g22u5QzDZpoTItgMz+yDMoJO11XnJuldXEZfSe05sffKBDpdBStng00v4Xrn+nN8kS++xbUU5f/NKSLPdL/8dnJThMk3pD+jE41W2DMMeqa5fgTwKzA+wtRtsPdETzSwHBzDUoZmWtERj4gKdn68QpJWK98hu9aH/2qZ38X94doUbvXx7L1hHuemstiA4uye+8PyTJ6kOdWkcFtpOOExXl2w2R0OCh7ojrvdYJQc4uWxKKIOCCKhthjkfuSc6vbLAGYSVgd3GkSw1mk/NMeoVUJjQWIuPsA1hqic4I+tLeD94QBZH5kSrxDmFyKylwbe4NJ8F+1WqaOifWnGfQRbg6bW1NJV3aJVB6Y1/cVMmvMsDhHZ6WLGGkcQH9VaJxZS0t6pSt5ewoI96YlHfmnwrlzL8E/uw3+kUumqMv1kc+FLxwISxmkhV5YogivetPlJ0mJhIBOw7cKPFjC3gFmDN8VEa5ycQLp+YeiQaLrM3k1lNNv8TouPKl/16hzhc4Vu4KaG80m86gCoy2d4UW1aPKRG8cPUVpx8qtSMTSrIWKBsiRpOa1DBj3hKHOL9EBa+pxCPI4VE4WgWw4rJ4CGLM0AM9j4e7HPBBLPSMq9i9LlVyvd0sfOjSycidcYk8XYdvEnbf35Vv49YLn5FtZsoJ8F0TI32hXKs9ZifNiwoWgGZOtEUUw6IpA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(2906002)(6916009)(86362001)(38100700001)(66946007)(6486002)(186003)(16576012)(316002)(54906003)(83380400001)(26005)(53546011)(16526019)(66556008)(5660300002)(478600001)(4326008)(8936002)(8676002)(6666004)(36756003)(31696002)(31686004)(66476007)(956004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dXc1aFlZMm1YYnViTFRlb0h6dGlVdUxOeDh0WnJaWGI4VHNsZiswN0JYN25J?=
 =?utf-8?B?eVhyUWxRS2drL21jU082Vk1md0cyOTZoYnNLRzVjb2ZXUEU4cUFzRGkyVW9M?=
 =?utf-8?B?TStlNzRkOEZWblpQWjExN3VvSUl2bzQrSEp6Z3lWNFN4TUlHQU1ZUjBOVzBF?=
 =?utf-8?B?SGZiMS8xM1JuaGthb0xHZ0crSFpNc1NUU2dVUTAzMmpmQ055MkNreW9DUHpT?=
 =?utf-8?B?TFZrYWkxWml0ZS9DYmRhMXpZYVRJMVl1VXA2UUFRUUZtMkdXdFB6cnNGYUhw?=
 =?utf-8?B?cHJDN1RoSSthVldxZFZUNlJvdldoTHIxNmU3WiszTzRDbFJPMDhib2JlYVkr?=
 =?utf-8?B?Ujh5UXlqRHJyb3l1QVhNZGhrbTQ1dGNlejd1SmpsY1NHcU1XY3JPMGxjenlC?=
 =?utf-8?B?SVhmK1YxeWRESjlTL2NoNTZYVTBCejZmbFM4MVpScXREMDdnVEE1VXlyUnNX?=
 =?utf-8?B?MWpFQlFQV1NQUm13Y3BkV0RzLzRnRGxGRUNPbzlia3hjc0dRNE9ZYnJjeGR5?=
 =?utf-8?B?ZFFHMDdocjVnQUtKUHRzd0thU0NtMVBTM0ZOZ3RZREZvQkNzOFVqL2FUMUYy?=
 =?utf-8?B?ZTA1OUlMQVBqSTZXZVBYSFEzdlcvV0txTGVLSkRTNVRGb3J6ZmxrZlRtaVRN?=
 =?utf-8?B?UGc0QXBOTFBNMjdqaEdLK1pwL1hzWVh1NHUxK3dpUjNNVjM2VW5GWVEreW9O?=
 =?utf-8?B?WE5LTE1VbEtvZE5tbHRxeU9lRThPVkJHMGNPUzljb2gvenpKRGljcURNdVkr?=
 =?utf-8?B?aDZLNjZ0cENNb2I4RDRRVDhvdEVLenUwYXNCUm1NSzRETzVzY0paa1B6dHJr?=
 =?utf-8?B?TkNsa3R5VFk0Y0VqUE53UXFTN2dvS3BnOHBpSXNQWndUNDBueEk3R003VDht?=
 =?utf-8?B?N3N6amRaVklsRVg3ckZQWVZyU3hIblVucDZweFZrYUswNHp5SjlCVFJOYjM4?=
 =?utf-8?B?MWR6cWdpU1FiK2dScVJJbkpTUVRMNTIyZno3OXdzZ2lEbXl0Z1dTQytGOGNO?=
 =?utf-8?B?Z3FtMHJrMVNSU3ZpcXd6UTJPbDJyRG8xV2VwT2ZKOXFaOGg2SXdWU0pLdUFY?=
 =?utf-8?B?bnd3ZldVaytmRmFhMHhUUGlVb2JncEV6d3lKR3llbERqdytyd2VGU25zTTgy?=
 =?utf-8?B?NGdBQUlMMWM2V3F5Yk9rTXdGWGh5dWk2OWNlVW9UUi9PN1BzKzFRTGc5T05G?=
 =?utf-8?B?bHFITm9wZ3dCb0lFMG1sakU3N1F6MXhDQktlOHljU1drSGpYdGk1VUVsWEly?=
 =?utf-8?B?S1Y4eG1xb2tzY3A1d3lMRFVPR0p6dk5tNWIyb2JuSXdhMHBpOFpsODBFSGNL?=
 =?utf-8?B?bWpTeEprNzhmTHhNZXlLTUV6L3h4RW12cWtkMlhLS0V2a2xBV3BHc3kxY3Bs?=
 =?utf-8?B?R3dyNzZGaGozVnVxYkpLRytrbEthQkxLUkN1RW5HVkhiMDhZSlFEMEZ1VkdG?=
 =?utf-8?B?cWYzWkh2WGZzWGVYWC9mSGZsOGYxZVdBV0M5R2VTYUpweG1DVHJqZ3l6dVJ3?=
 =?utf-8?B?ZFIwaXVuR1p5OTJQakRDY0JyWXhxcWx3TGM0UUNkUmdJWXYrblJhT0M1S213?=
 =?utf-8?B?WTJmYTBvNStPYVBOYlhaeTdmdnV5OWdkSkdmRU14dkJMWHlJcUZHQVBKZThx?=
 =?utf-8?B?WnYzR2VOZEFYeFVMUHkvT21iMEZpT0hZMCtsYTRjdWhJYm0wQTVGaHppU1Rv?=
 =?utf-8?B?TlNGaHBKbks3ZE9iT2dGQlJTdlRQU1AvbjM2QkJzR2RoWEdNU2JuMm1SQkRX?=
 =?utf-8?Q?Xsjy9LQvKFfenZCqH/dH5qrVX961SuImBUrwlpO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be416b3d-b446-40e0-1cd2-08d8f510f8cc
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 13:20:51.7871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BwZbrG6EGFslqxZX/eMZYk6zbW9ARDlZglLfX9oGdFywGrrTVgC4OSnNPNYaoHSqzsVCRrBCOSXxrMGPwUtM91J8MMtB34Xr8B495yAjdM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4801
X-OriginatorOrg: citrix.com

On 31/03/2021 15:03, Jan Beulich wrote:
> On 31.03.2021 15:31, Andrew Cooper wrote:
>> vlapic_init()'s caller calls vlapic_destroy() on error.  Therefore, the =
error
>> path from __map_domain_page_global() failing would doubly free
>> vlapic->regs_page.
> I'm having difficulty seeing this. What I find at present is
>
>     rc =3D vlapic_init(v);
>     if ( rc !=3D 0 ) /* teardown: vlapic_destroy */
>         goto fail2;
>
> and then
>
>  fail3:
>     vlapic_destroy(v);
>  fail2:
>
> Am I missing some important aspect?

No - I'm blind.=C2=A0 (although I do blame the code comment for being
actively misleading.)

I retract the patch at this point.=C2=A0 It needs to be part of a bigger
series making changes like this consistently across the callers.

>> Rework vlapic_destroy() to be properly idempotent, introducing the neces=
sary
>> UNMAP_DOMAIN_PAGE_GLOBAL() and FREE_DOMHEAP_PAGE() wrappers.
>>
>> Rearrange vlapic_init() to group all trivial initialisation, and leave a=
ll
>> cleanup to the caller, in line with our longer term plans.
> Cleanup functions becoming idempotent is what I understand is the
> longer term plan. I didn't think this necessarily included leaving
> cleanup after failure in a function to it caller(s).

That's literally the point of the exercise.

>  At least in the
> general case I think it would be quite a bit better if functions
> cleaned up after themselves - perhaps (using the example here) by
> vlapic_init() calling vlapic_destroy() in such a case.

That pattern is the cause of code duplication (not a problem per say),
and many bugs (the problem needing solving) caused by the duplicated
logic not being equivalent.

We've got the start of the top-level pattern in progress, with
{domain,vcpu}_create() calling {d,v}_teardown() then {d,v}_destroy() for
errors.

This top-level pattern is also necessary so we can remove the need to
put partially constructed objects into full view of the system, and wait
for a subsequent hypercall to clean them up.=C2=A0 This series of bugs is
still active, and there are still a load of NULL pointer deferences
reachable from out-of-order toolstack hypercalls in failure cases.

We've also got some subsystems (vmtrace) moved into the new pattern, and
some minor parts of existing mess moved over too, but the end goal is to
have exactly one create() path and exactly one cleanup path, so its
impossible to introduce mismatched duplicate cleanup logic.

~Andrew


