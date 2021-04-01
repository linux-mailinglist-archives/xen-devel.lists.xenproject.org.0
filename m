Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B79935146A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 13:22:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104381.199631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRvOz-0001Q2-HF; Thu, 01 Apr 2021 11:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104381.199631; Thu, 01 Apr 2021 11:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRvOz-0001Pd-DZ; Thu, 01 Apr 2021 11:22:17 +0000
Received: by outflank-mailman (input) for mailman id 104381;
 Thu, 01 Apr 2021 11:22:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Onq8=I6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lRvOy-0001PY-9L
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 11:22:16 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b080904-f558-4b1e-b573-df4b48063e9a;
 Thu, 01 Apr 2021 11:22:14 +0000 (UTC)
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
X-Inumbo-ID: 3b080904-f558-4b1e-b573-df4b48063e9a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617276134;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LGh3DD7gLPUnzQejmmgzvkBX3QsisjgN8KoXuZurEcA=;
  b=Ro+oGmZFS5D39AgXiD9kBLQcimK45712P+G45N/C++QcZC8Qz0gdgiie
   a5LpOhNvKuJZodUJOnaSMYKakRXLfwGYslUO9GdW+zQova1LJhFtq9n+v
   y4x/vrAyNxVmF3qxIDFgL+RKBH3DiwPD8EM+1GdiZzceXu9psdRiSIqLz
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: WKkRGSlnfElOu1aBUu5IHveLyYJt2jwzLc4+qdwKPtR028rKFpTleEoyzCy4WX8eppJHVKCFKE
 m0sCYspzl1YAtNe01cjzHt2TNnqDJx8/wcvvLaD+46tcfjA36dbQ7zqTLG/0kUftgk8HchwU+f
 GuypLwt45RxREaOvmjplzhR3skhxcJCIwajjHe5xoB4FmZ2r4RPQfTK0OY6FfiouWmAnAdeH2F
 yWk48Dn5gPilb1pAoAYmAJYqkaVNaCh6H1sxjMD28OhfimAvsEK7dESnCvZ8ujpW0R7BUhq5M9
 18o=
X-SBRS: 5.2
X-MesageID: 41060203
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:tXhx66x48NM+CQH10lH0KrPx/uskLtp033Aq2lEZdDV8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPsfVr3//dOgbU5F7GkQQXgpS+UPJhvhLGSpwHINg/f0qpm1a
 lme7VjE9GYNzJHpOvz/QXQKbkd6fad9qTAv4nj5lNMaS0vVK169Qd+DW+gYyhLbS1LH4AwGp
 bZxucvnUvCRV0tYs62BmYIUoH4zrWmqLvcbQMbHBli0QGSjFqTg4LSKQSS3RsVTlp0sNUf2F
 XC+jaZ2oyT98uV5zWZ/G/V4pRQlrLau6Z+Lf3JsOc5AHHBjg6pYa5oRrGNuiskydvflGoCoZ
 33jDoLe+h19nPNbkG5yCGdpDXI4XIVxFLJjX+enHf5rsTySFsBerR8rLMcSDT1wQ4EnrhHoc
 V29lPcjbV7J1f8uR64wN7yWxRjhiOP0AEfuN9WtVNze88jcrNLxLZvmn99IdM7Mw/RzpsoK+
 VqBNG03octTXqqK0rUuWRi27WXLw0ONybDRkADv/qc2CRNkEZ4yFMFxNcekm1ozuNEd6V5
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="41060203"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9h7pw2zNbAsz/CdRPAjpmCfRK5K9FCdODfDVCLVphBM6N9jCCiqOcRxVoOdg/fa4Z+aRsoGYjowE/85mVgTs8T6/2DCFCFJpdWOikQhhOa5aEvjoBjl8p5uS9Wg0sTabwWh6uEWP+u6xFrsZCV+4pixssU+kslON0lAeiD1UaqzNDSUgr7pqB8PRTK6AbPfqP58hX32VKWqcEKQ/6CB0EgIBzV7frAqC2att3n5hN0sq1jZbpCjB/R6EbfEQWD9CGvjXwx4UCCRmqpOjQtGVJxI/n5GoUNETO84hOMrWe3m+NkRRY5OeMfGVO9QpQUyd/sGI81nIs/SWvEhTecRnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGh3DD7gLPUnzQejmmgzvkBX3QsisjgN8KoXuZurEcA=;
 b=Q1LSSeRxrd/6+iKa5iVBGgpPJUAuM8ud+l7W3hWPH+ZvAXG1qme3p+uBx4k4/mB6rMXMgp0nt3VEI+ZubfJggsA0o1R2ZkBAl7zNIaqVjpYXJrmPuo78JS6z20N3UgL/oGyBXze28xDczeoRImjGsNHml+9qP+p7/GKYhSh4z3cxJbBDKawA+CGjz6S5CcHEGL4GcM4WlwHyXAkv56ocQ/JdcsonO3x1n6f5Onh8x0F3IxocdGUfMK+TqRzho6GTM2IJuPyzk5P3G5d1gh+m0v9PwA44A7R8AOCmz5XhqjL4cgaKJptSRcnl29g7X3SmXsWaFxUL0oyahTkSDNZv4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGh3DD7gLPUnzQejmmgzvkBX3QsisjgN8KoXuZurEcA=;
 b=JnIC6n+Oe5pqsIErywgNLHBbNMMtWf5mks+oCL1CLSDKwqy7kWKJuhFMBPeShU0TbYkOf/GA/GyQx5TS255LY0iGzvOfsVZE2DwanO+jqC6PprNef6aV0mC7Q147eES08Htdq7d961lfZxlzGz9TEHVhLRVDsalvgmmskXCailU=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <a236ef77-e6ef-5cbe-60a0-49c8dcd9a208@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/ucode: log blob date also for AMD
Message-ID: <b715a61f-c3fd-3886-2b30-7d74ef931f0c@citrix.com>
Date: Thu, 1 Apr 2021 12:22:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <a236ef77-e6ef-5cbe-60a0-49c8dcd9a208@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0268.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::21) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3621977b-01dd-4342-1d50-08d8f50063cf
X-MS-TrafficTypeDiagnostic: BN6PR03MB2769:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR03MB2769FD70C2527D28878B5F6CBA7B9@BN6PR03MB2769.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /FlB4fnuzrBtZv0d4/xOt5SHzNV+lPkr8Cb17QyyyX0saf95rt9dA7JGsBHU/HRq1rgRXWN+GnFnBjlMsmYOEsdyWz62NptIKm6xoA19i8tW21nC0iQ+WqeL5XmvYmhbw1D+YA8cMtRmhkwtioWAcjUkpXoIP7v3nU4NIbwr0u2tgMSGHVM+QZgWwhLw/VtKX24GdYgQwDp89sOzqOFJixC7KV+9UDlPRO9JXNEOwp74Nz1fpRtMx6Xjsb4OldbYUyHbOZfnsM4uehPlBU9nqA5JSwQVGXVPlJPLsgGtHywpqu4aR5eot6pPiGrwSPNEopkU2G4wFS2Hd7/wklleKZHtOvGPjGSNZ+h8LEs8A7m+SqNY9CeBEkI/oBts+HbVDVd3oIlB4sLocmIxnl6Htzr6Z03bG4yxtWyRCEQ8pU2tWcs7uyKm47sLkRxkpfa3mtJLGEQHIus3LVf6a+3Yhu4vEWMeCO3lyg8W7Fayx2dU9obsDieE2cmo7GmpViZWxRwW2tn1aq/+9c+qhtwFItjJI7D///KezCku+lBngc3gVtltgtzxCSk1G4CdPjY2c21oM+YmH8+HWv+ImCihtR8N6zhIkwbTT2zWMQZFTgUFZyOis8ZyCFHpLSC788YAOpLhfuF/Pd6ARy/R2sX4ezbTRwguKAMaDM8XiM5/q9zAZozqcnLCCT3+BIXn/8OFhqwqyKA9NdP/t8UNiyzahLvHhO3qn8Ew1zLUQDk0hTM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(53546011)(36756003)(956004)(107886003)(4326008)(66476007)(66556008)(38100700001)(6666004)(83380400001)(26005)(16526019)(186003)(66946007)(31696002)(86362001)(4744005)(2906002)(2616005)(54906003)(110136005)(16576012)(5660300002)(316002)(478600001)(8676002)(8936002)(31686004)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UWppZngxRnlyOGl0Ym9NV2RRSURLeTIxZmE1c0UrRjRUWG9MRURUaGFOaEt6?=
 =?utf-8?B?RUJwVWpzc3JYVWd0OGZnYThDeUs4QkFFWFlCTDZFbXBrWTd0QU5ybVM5ZEs0?=
 =?utf-8?B?VzZoZlBoem1qU0gvODhIZ1dEbUUzOFFQdkJYdkhlNWVpSU9ReEl1U0pNS25s?=
 =?utf-8?B?bzZKRTJYaFhnY1pGTWdJQkdVTWZaZHhHcHZQMDE4bm9FVTBLMWZjUjBOZGRU?=
 =?utf-8?B?SDJ3SktQeitkamVWZmczUTFSSnpKK2czQXlrWG1tSEUwWXRoRjcyWUY5eisv?=
 =?utf-8?B?Tm01MGk5MUcxTStyTzlBc0o4SU1WaXBkNXMvY3AyRU9ZdFJFQW5tR2VUWEY2?=
 =?utf-8?B?RkxMQW02R0FTQkhYMFZOeXFHQk1haVh5dEhoN3M3NWErRFErMmpqRDVQREpu?=
 =?utf-8?B?ejZVY2Z6cDRoVTlFQ0wvZWc4d01rUW9oSndjenVINWZLM1NhTW0zOWhoUktz?=
 =?utf-8?B?VVdOZTl5Yk5GOFlNaktETHpxM09VZTluNUI2NFhvTjQ5R3RDNTNwaG1rNGpQ?=
 =?utf-8?B?YmI1Z25GYkt3Wmp1TTJvVXdpYjBhT2lKNDZjVzZqYTRVMlNYRUtDaHZJb0Zm?=
 =?utf-8?B?UzRoNno2Y0Nqakw2ZHBwWjVENmpsNmNrcjdvTnZjYkxpc2U0NHBlVlU0bldK?=
 =?utf-8?B?VnFBQ1VEWm5Dait5TUxzQysvQk5tN0RjeTg5bktEbWtsSCs5M3hkY1B6eE52?=
 =?utf-8?B?K1l0Tnl3aW9peGpvWkU1K1BuSnRCRjZ6bDlTZHlYTkowenAvVElrL0hiUEEx?=
 =?utf-8?B?NDZIbCs5eWVacnZKcjcxNUZUNmVXdUtIQUNPcldFdHJGdzJFOW10Q3JLVE1H?=
 =?utf-8?B?OXM1MWJVNWY3NXdkelpyY0MvRXdxZlg2UFAvOGc4LzExT09ia0dhV1pNc3RP?=
 =?utf-8?B?MmhtdWlxRFdQZFRKSXcxUzRIcSsrMmNxVjU0OW9BVjhKVnR5VHNkRzJXVllp?=
 =?utf-8?B?am1UVld2YnNwd3JidVpWWGUyYlY2ZERzamJvcnRXSGhWeW05VE9JNTNxWWIy?=
 =?utf-8?B?cDlOa0R6R3l5dVExMjM3ZDBMTzkrSjdQR25iYlc4SDl4TzFZYjh6M3gyT3Zl?=
 =?utf-8?B?V1djNTgvY1hoaTA2QUt1bGNVVnpSK3RGYVl4eUV0WWZUSm5oM2diZjFBeTVz?=
 =?utf-8?B?YThQdlN4U2M2WmkzaHRzUU9WbElob0VEcnhHMW8raHplVzNlVlJCZGthQ0g0?=
 =?utf-8?B?VWV1WjVBTXl4OEt6amJPdDEyNUE4OGxnY1JseGVuM05DZml5MGI1YVliWHdF?=
 =?utf-8?B?M2R1SzBiTmJqOXpwdkpOV09pQytFYU5BbllsckJtMkFoMjVuZzlWN2F3ZE5P?=
 =?utf-8?B?b3NVcm15djk3aXdtQWJFV2hMMDBWUzF2M0haalNWZFJ1WEovakZTQWdmVFIw?=
 =?utf-8?B?NW55Y1lqUzdBM1VvaDdWTFMzUmZCR0E5d0xRNVJNOEFheEMwZ0VzZlZFNHY1?=
 =?utf-8?B?S1VlYkF1OU1WcTM0ZU9TNkkyVWk1VUtJMVZ6NkhaTEZNZFdkY1QyNmFZaHRE?=
 =?utf-8?B?VVJXTVJYeGt0K1hFWmwxejRzdTZPRUlWM1RVT2Fmai82MTRTZERYSE5yTXJS?=
 =?utf-8?B?bVRZTERncXVGUE5jT0Z3blo0VFhjdytoQW1HRENpdUJ4WnBuajk3cjRiWDEv?=
 =?utf-8?B?NktTclhiUzJpcUNJY1B5eVNic2xxalljOVV6bjFqOGcvbi9XclZKMVAxRVZE?=
 =?utf-8?B?RXVHS3ZlZHUwd09wdGJraVBsb2IrNEJnayttSnFRQ282dnlZdjY4UUt5RnBh?=
 =?utf-8?Q?ttY7r+4f4NVOBMenkkOWFvaEdUL/zr0PE1cEf1V?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3621977b-01dd-4342-1d50-08d8f50063cf
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 11:22:09.8017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0WbkVD42CzCAkWpqx2iD3JQOnqhZXA25c8Oy+4P/6xszB3XMGQK5v1H4U0NMIkkqi2l1fCjGn2GlK7XDGDd6TwQ9mnmVXf9LSvstXsJ6lEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2769
X-OriginatorOrg: citrix.com

On 01/04/2021 09:28, Jan Beulich wrote:
> Like Intel, AMD also records the date in their blobs. The field was
> merely misnamed as "data_code" so far; this was perhaps meant to be
> "date_code". Split it into individual fields, just like we did for Intel
> some time ago, and extend the message logged after a successful update.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

This was on my todo list, but I'd not got around to it yet.=C2=A0 There are
several legitimate microcode blobs with incorrect dates.

One has a date with a year earlier than its predecessor or successor,
and two have day/month transpositions.=C2=A0 One transposition is obvious,
having a 13 in it, while the other is ambiguous and guessed based on
when the ucode was available.

I wasn't going to bother doing anything about this, but it is something
to be aware of if we get queries of wonky looking dates.

~Andrew


