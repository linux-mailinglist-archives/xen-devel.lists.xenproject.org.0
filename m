Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C873755B7
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 16:33:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123602.233159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lef3O-00084E-3m; Thu, 06 May 2021 14:32:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123602.233159; Thu, 06 May 2021 14:32:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lef3O-000810-0a; Thu, 06 May 2021 14:32:38 +0000
Received: by outflank-mailman (input) for mailman id 123602;
 Thu, 06 May 2021 14:32:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YkD6=KB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lef3M-00080u-O1
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 14:32:37 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93fff602-a754-4639-90aa-719ba1a9daef;
 Thu, 06 May 2021 14:32:35 +0000 (UTC)
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
X-Inumbo-ID: 93fff602-a754-4639-90aa-719ba1a9daef
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620311555;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sdRPK8q8efr0Xe/39l8foRLnAZqcI/oQMMPRnx/wias=;
  b=hqmRRrCgx4MwriDUWJn2BhYMD/o9QPh7jz18FmVt/oZqSENrIYPHVI9n
   sRq+TfNlmNICWRD8UPZLtCEej6IFhTzOXOKGgwGUZhlZ1GElxxv+xxF7+
   wooFdb/v4nwoD9NJELBIZ9Gmx+2tdtStKo/gMZq9iIbxJlFe7dkclnLQU
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: zJO1A1rdFC/aAU1yWCBTnNnbjTqoGuCBWMcgXPRQ9rV5KDY5/IbUz/TcmLuU5QqjwmIz3ETBpJ
 jYmS2/XLOV4bOz7ExKz5R1KezeetTsT6/BR/w4UvvN7w89d6fi/2jWAQuErmrNB419mqqj0y8h
 JeTPezdV+nOF4VtW8AW5zny8cAFiRyVVuYOEy02XAR4hSkBg1jQsHHAkJU5RdIJuZsUo7X/0zj
 UdokDf6s/wE/iZfihB66GbLEKQSGSqrPOSCrPFq/cIGjsi41RfGSIp0lVaEougiuTc83Af0bOp
 w/M=
X-SBRS: 5.1
X-MesageID: 43213090
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:bbd0yqP+BrhcGcBcT//155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/exoS5PwP080kqQFnrX5XI3SIDUO3VHIEGgM1/qY/9SNIVyZygcZ79
 YcT0EcMqyDMbEZt7eD3ODQKb9Jq7PrgcPY55ar854ud3AMV0gJ1XYLNu/xKDwOeOApP+tdKH
 PR3Ls8m9L2Ek5nHvhTS0N1EdQqyLbw5dPbSC9DIyRixBiFjDuu5rK/OQOfxA0iXzRGxqpn2X
 TZkiTij5/T8c2T+1v57Sv+/p5WkNzuxp9oH8qXkPUYLT3ql0KBeJlhYbufpzo4ydvfq2rCqO
 O85yvIAv4DrE84JgqO0F3QMkjboXYTAkbZuBqlaSCJm72heNpSYPAx8L6wcXPimgcdVZ9Hof
 p2N8/wjeseMfr6plWK2zH/bWAhqqOFmwtUrQcttQ0XbWI/Us4ckWVNxjIbLH8/dBiKo7zPR9
 Meff00oswmKm+nUw==
X-IronPort-AV: E=Sophos;i="5.82,277,1613451600"; 
   d="scan'208";a="43213090"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Or7wzHy4xluRofA06Z838MGWy9jwkt88BAjNb7GZvICJWgJ8WqM2H8SD462koImB1pdVsD8WEOPIDHtJYzJaFsyt45AfMQfGxuNkK41yMIPMIJTw0HrUdW0KVysOI28Zqk3yZNBJORlWMidPcvQVY16vPh3Gr/L+BrOIpJedDj/9wzdQ2ebgHkMW66OPoO3RIa9svBjF7KQU66O7rr7Wl/3lkMKNcZ7lpijpA6GfhvVMfqwDJ1brlaQGyPmi7p3nHTU1YUw11dfomt3/2X8TVa2N/yRAuvITA+Svtj3+4mdY1S9IiBSb1nNsLzn6GHKzo/xfGbzZfok9Bdn63sDWCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FNwnAB3vIXhH5Kj/Dmqd51S5dHgDYQhMWt3N+k9sfo=;
 b=ICESqaqrTEkTLsLLnrTYV6ofxkXrshz1TdoOeLHKa5WXVtERpE4VE/FtcVdewyd3RHgGF8aquQ3WyBU/H2/dybLOTbEpd8dMX8wOhmufQt4CiZIFf1wyXJujSsaghB1m2A5PLVkTG5yGQAOyY5fXLtrNucPawCeSBZtrt2Y0OScQRE8A2qeSW99FLziIAsztGUBJ3zHLxwghJJ+pg8RuR0ObpjMfXwcs8CU6Bg1ZojMyRF5w+G8gv+Km4OB7AyEXlLzP2z8/S0SZ03zA9zqbCEvySqTDcbD2s9YyTs5PYAMxDUnJPKxWffnIRykS9pKAW8ESLU8JkJyXAKCy4f2Hfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FNwnAB3vIXhH5Kj/Dmqd51S5dHgDYQhMWt3N+k9sfo=;
 b=NyWUmzLyqe94lA1asmwApo7AUiuIdAj3FTGJl4pRIw7t/fVh82vnALwm//WHaqKWeeYYroIOqvIflFuNHApF/meVPetU41Ab3o7IKeZs+nIIVlMcuLtS5+UUww7EzfLbh81m2rENfzlo5nPa/Bvkyrzo4S5abyXD9fviBAB1Qpw=
To: Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>,
	Anthony PERARD <anthony.perard@citrix.com>
References: <20210506124752.65844-1-george.dunlap@citrix.com>
 <acd695c1-dc04-4606-5212-5fd993e355b1@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] SUPPORT.md: Un-shimmed 32-bit PV guests are no longer
 supported
Message-ID: <5b4c9bce-9335-b5f7-0c90-e47ae264d896@citrix.com>
Date: Thu, 6 May 2021 15:32:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <acd695c1-dc04-4606-5212-5fd993e355b1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0252.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::24) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64c10801-6e7e-4812-44dc-08d9109bc7f9
X-MS-TrafficTypeDiagnostic: BYAPR03MB3989:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3989C7B62153874F204E6BC1BA589@BYAPR03MB3989.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xtc249su7DCuBwOA9xMR/7XMNzehdZhVAig3qZVa18OdkzFWgsrb1M0nqXR9eaYXbZWEkLlq62V96IvFs202guR6yhgB/GKak4upXDslIrhbCgLB8oqbgYYHf538QY1qr1KhEyIelQqbyFhPoNKgnl+rQlvQ6KEY1e8uy57U/t00e3vY4unB77s8XHv7O98bqEKPolTX64ZohM4W/c04WnPwGDqlIsbnyWxvA05pvhhd1X32/KAn037gh50wmTnyQAenK0HyyRxwHoijYIVY8Gtvu5+1W0wtcokH64JQ0L4Hhe1vmX+70sTDDTLLBhzzTXzo+YRvvq/EWRnRFvjRXR6eQNpRHaEQUVUiEbrfJ9T8A2wy2RHhO4dggy4vUur6E+KCtWQCsu2xbhHowubd+3RAs3uNAIMN9lPPwz1/YuUk1wOR2bLFbUSljHmDanRL8nqEM1YNmIxjjylVsskKzzK5weMZGtpapPcJ99dHizE4I4b9W7bJyF37GVrh889nm0GOE7MiAxfAYGJ0MUM8Ywllb/MvAyf6QvQt6s/6JWwoaI5aBlAdacRBRTdrSGINXKenA4m5v0/WFBFTbYZdV4UHUR+C9kngmr87r2AS7bwfqCihHMGxkUruMlhtc2ru5m2Toy3jZtEAIyigUPHdeAtvHAYT1RjFD8vw0hD5B4KVzO+y2Ssnv9shui+eIIYx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(478600001)(66946007)(6666004)(316002)(31686004)(5660300002)(31696002)(53546011)(2906002)(2616005)(16576012)(8936002)(26005)(8676002)(6636002)(4326008)(66476007)(66556008)(107886003)(16526019)(83380400001)(36756003)(6486002)(86362001)(54906003)(110136005)(38100700002)(186003)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dnBIK3h1RitDdS9ibGFLWis4RE5ZVll6QkpKazZKd2Z1TGJBREtIWWplUDRW?=
 =?utf-8?B?Ulc2ZnlGR1hHOWpHZnM2bS9UTitVZ000ODd4cFUxZmlJU3BjOHFsakRMQ3No?=
 =?utf-8?B?cXAwa0huaFFNck03Q0ppc1ZxQW1Dd3N3Vi9mT0dtN2xxcHREN3pPVUtMekJ6?=
 =?utf-8?B?cDQxTEN4U1l5ekVBRUhmdlBrQnZ0OC9LYTdzMVJNQnFEdzlLQUplR3dKN1B0?=
 =?utf-8?B?MkJwTEljMFQwcmFUZEZKdnBQcnZycXNkMTVoV3JPZW5XRDlkMDd0TjJ1Unl5?=
 =?utf-8?B?QUw0RWNaMlNSdmpQcjdzRGxTR0g2YjR2dDFTaS9aMzdnSzZieFhqdGh3UnVq?=
 =?utf-8?B?THFvVWlQVUQ4Tnp6eGlwWThYYWcrVTRjR0dzTDU2MnQrZ1gvYTVPSjVpdXZR?=
 =?utf-8?B?SVBuZjFiQW94L2pCd0FPVG9nMGJ5Mm5DMDVUNG8rU3dYMmZrcWs3TktndDBZ?=
 =?utf-8?B?bmhaZEpLVExkQ1NhSThFNEw1WWhHZmZrQU0vS0xYUGdIUGphTndJNHpjY1dV?=
 =?utf-8?B?TDhLbFFhc3ZxTE83N0phK0I1MjROVE9DYkNqZ0crVUlCbnRIczloNHlPY2xp?=
 =?utf-8?B?WW5Tb2tKTDlyUFlwWTNOMVNmV1pIT2hDckFURllEamNjRkMyQ1lNclFXZDNl?=
 =?utf-8?B?SExNRFI2Lys4WUNIL1VPOGJmWXJnVXZHaXZ2V3FDUUxrb3NaREhkN0FJT3lJ?=
 =?utf-8?B?VHdFelpLLzF6Qy9pdnVhUmw4UzdHdElJUFNHRGlOdDd3bFk2MWIzeXRyZFdt?=
 =?utf-8?B?dFFoSU1oRlp2YjdKbEh6V3dIYlFzOU44ck5ZQ0g2WDR1UWJ4dWVMbFZ5aHMr?=
 =?utf-8?B?Y0JHVXhPN2M2a3pMaXIvOW5haGw3QWVGdjVWdHBzcHJPSFJFOGd5ancydDF4?=
 =?utf-8?B?UXBxUlJISG0rUE95dGJ1OTBHeDErZm5zNU56VlpVM0pMOGpjdTZ0Zm5XQmhC?=
 =?utf-8?B?a1paN0p3ZEJ4Si9MM0ZCb1g1R2RkMy9pRkxQWDh3WXlsOXI3U3R3dVhhcmJG?=
 =?utf-8?B?YWVuNWNPQWxWMng0b1M2ZmNUZStmTi8yck5SUWZrQkUxaVdQZDgrVmpSTGQr?=
 =?utf-8?B?Z0xYbi9vdmNiQjFOVDR3L2lGQ3A3RjBBUjYyUmFHVE9MUjIvd3B3d2J2T0Vq?=
 =?utf-8?B?ZTEydVRaVjByZEJrY25qbW43SnlTUkJhOTR5VGdHNWxrNTZNUkhuVkNZYjdF?=
 =?utf-8?B?QWVFVXh1ZW5Rai9BYlEyV1ZoNldyMWgwcUV2akd6SlRwVUpjdEpYZjRsYVdy?=
 =?utf-8?B?b1F1ZGtyT1Z2RGhZRHdvcHVIUzZXZ2ZydkpjdlB2eFZxdHRGcWhJMWVrWXdY?=
 =?utf-8?B?VU15ZmJvWnhQZVJLUkNyUnh2VVZjOCtON091d3czWk5uU2dibXJLMmF6UHh6?=
 =?utf-8?B?a1k5aUxhamNjUWdaTzk0ZGlielZhZ2UxazkrMUFXZHl3ZUNQakhxNmp5SnNR?=
 =?utf-8?B?bFpaN0Y0WlZRVEg4WFE5TUlUYk4vZHI5cmxXWGdlN3k0ZjcvVzNkSngzOUtx?=
 =?utf-8?B?anNaRG5Ib0RBcG9hNlg5TXlVbnQ0OU5rdTFxZWFIdWZONnhyUDR6QVV2MXRQ?=
 =?utf-8?B?eFJWUkFuSnlFU1RhNU1kK3FGSTJzUWdJWTZIM0pUSTd6MWRFNkN1T3htR2hM?=
 =?utf-8?B?MERza2JycFZtcm14cUoxZFhWWTVPVUlPdFgyNzlNS1diTEVUcWlQbFZIazVj?=
 =?utf-8?B?YXV1cDVWNzQvL1p4ZXhqOTFwZHVhMWVJVnQ4cHFRdlBRV2JtU1hWSXBPVmxR?=
 =?utf-8?Q?tjExxmrtOwpSaJ8cbolRbf9s0wkZCeG3u0hb2sp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c10801-6e7e-4812-44dc-08d9109bc7f9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 14:32:31.2921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +G763cEQ7XZs3E1mmn9BPfkuLLpNAy0yWjSJOWOZwbjxUlGxICZjnJdzJoCIJMSMq/gKiAuFmT3H2EPn6+9qe37BEAxtYUDJxIXUD6JQly8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3989
X-OriginatorOrg: citrix.com

On 06/05/2021 14:09, Jan Beulich wrote:
> On 06.05.2021 14:47, George Dunlap wrote:
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -55,7 +55,7 @@ config PV
>>  config PV32
>>  	bool "Support for 32bit PV guests"
>>  	depends on PV
>> -	default y
>> +	default PV_SHIM
>>  	select COMPAT
>>  	---help---
>>  	  The 32bit PV ABI uses Ring1, an area of the x86 architecture which
>> @@ -67,7 +67,10 @@ config PV32
>>  	  reduction, or performance reasons.  Backwards compatibility can be
>>  	  provided via the PV Shim mechanism.
>> =20
>> -	  If unsure, say Y.
>> +	  Note that outside of PV Shim, 32-bit PV guests are not security
>> +	  supported anymore.
>> +
>> +	  If unsure, use the default setting.
> Alongside this I wonder whether we should also default opt_pv32 to false
> then, unless running in shim mode.

No - that's just rude to users.

Anyone whose enabled CONFIG_PV32 may potentially want to run such guests.

Its easy to avoid issues here by not running 32bit bit guests, or not
running untrusted guests, but forcing everyone to reboot a second time
to specify pv=3D32 to unbreak their environment is downright unhelpful.


Perhaps tangentially, xl/libxl needs some remedial work as a followup,
because:

Executing 'xl create -p tests/example/test-pv32pae-example.cfg'
Parsing config from tests/example/test-pv32pae-example.cfg
xc: error: panic: xg_dom_boot.c:121: xc_dom_boot_mem_init: can't
allocate low memory for domain: Out of memory
libxl: error: libxl_dom.c:586:libxl__build_dom: xc_dom_boot_mem_init
failed: Operation not supported
libxl: error: libxl_create.c:1572:domcreate_rebuild_done: Domain
3:cannot (re-)build domain: -3
libxl: error: libxl_domain.c:1182:libxl__destroy_domid: Domain
3:Non-existant domain
libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain
3:Unable to destroy guest
libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain
3:Destruction of domain failed

is what the user gets back when Xen has correctly reported that it isn't
pv32-capable, and rejects the switch_compat() hypercall.

~Andrew


