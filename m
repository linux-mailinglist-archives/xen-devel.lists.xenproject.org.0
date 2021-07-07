Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 608893BE577
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 11:20:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152088.280983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m13j3-00016R-B5; Wed, 07 Jul 2021 09:20:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152088.280983; Wed, 07 Jul 2021 09:20:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m13j3-00013P-79; Wed, 07 Jul 2021 09:20:13 +0000
Received: by outflank-mailman (input) for mailman id 152088;
 Wed, 07 Jul 2021 09:20:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tWQe=L7=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m13j1-00013J-2S
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 09:20:11 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7519f33-4e13-451a-bf73-816322d3e93f;
 Wed, 07 Jul 2021 09:20:09 +0000 (UTC)
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
X-Inumbo-ID: b7519f33-4e13-451a-bf73-816322d3e93f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625649609;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hbhz0vWcDwiMVjASxJ4gmFHOVfH4B8EUakOfo0REJFE=;
  b=YYiEzXcQklIUUUE3Y+OcrIrqvT4k65jiqdIRyQYkBx2TecgyCDO/fkDt
   pdiWTxezcGgzdbFHM32Fi4gymp0UPIaEG0zWrXfofb5gZY7/aa/B/0ma9
   YxoQFEklymF1sFDdkKeDmvrh4y/xysDIZ+8RZliTZQsQgB/9mMNkXVS6T
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: cGpv1Ff2vhUNJRdV/njLrvXtShothn+oHQheEfrvSN9ieCrmgPUJFfbUEr5kIYLoVx2PBdwyiH
 1jtx4lJeha0n+nw180rS2ukw2LWYuL0wPkiYqSzL6HEBNg9JJYV0b4+SnUo30VYSBRD6MRNp13
 5atfgZErQxMZOzlgvd9E8cznn+srFC7DaTJJFirlV72lAlPzHjBBcgwjdKvlzIq9d/+PMM3rWI
 N/qhnyh7/f8AhcyfOISQohhHuhOnt3FTp4NszzJWa9C7wQ0sHhX0/IONwMugGmi4f+3syW1akp
 8GY=
X-SBRS: 5.1
X-MesageID: 47708780
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:vDrVFKuRTWoEUbXNij2daIDe7skDjNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd0ZJhEo7q90ca7Lk80maQa3WBzB8bGYOCFghrKEGgK1+KLrwEIcxeUygc379
 YDT0ERMrzN5VgRt7eG3OG7eexQvOVuJsqT9JjjJ3QGd3AVV0l5hT0JbTpyiidNNXJ77ZxSLu
 v72uN34wCOVF4wdcqBCnwMT4H41qf2fMKPW29+O/Y/gjP+9Q+V1A==
X-IronPort-AV: E=Sophos;i="5.83,331,1616472000"; 
   d="scan'208";a="47708780"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGXbgSef0JOG33UNVBuH0UE9Ap6IUIez52Cq48XyR0YOk8uSEHNiRyV7kkrF3NkLh3Z6uU70gPk6wTRr1IImDGOCaSsmeSCF3cecD8ko848BCt5nvFiNNMWP+Aifx1WD3jv53J8jUMU3p/S2bHLNT+VcIvilNWdVGvr7Ht4EEVzjaHd/3GsvQAgJagLx7M+DVA0IphpZfVvhoevxLs59V4aQe4qErdwZfnePe8W9xMWuA/dGEfd58aMB88OW3ppIUgBJf46UT6yWHJYEzpQifHv6x8scDwoPqFWSIuVVY71orWwousRPB+hxhjKnLMyrzpi+B+n32Tv6e1oMGUde6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FTMHFD1RoYL5CmN4L4VOuAQCePYv4TCiZzsGfakQJ0=;
 b=PES9280cHRlcxXguWKUzNy3j3z4RHptlevm0Zje52mvGx2zAH2hpO8ZTacD9nTfUvDm74ZtbAXL10G3fho0IuJ2ewXIex3qAzokeZGipbAzDlQfONA834FOCLQYnXWcmDcU41NA3ptQ2Z9Ttm8j8UCP0JKi9dff16HT5D/cDJt0AGZkJ0wvBs4To86HyOxb6A3MGMK+b6ALIIJuFnPnHceKJJvQBfbSAa+LEgBcGwn7ryZTj1swyA92i85AOU6/h6dCROWMzaXstuX0mSucInOctCf5d2KUK16KBZVKekF7F883NPr6QL8rFaRe6ldlSceaH1FuSTjqEXv6Ho21vvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FTMHFD1RoYL5CmN4L4VOuAQCePYv4TCiZzsGfakQJ0=;
 b=fIyMy0legAZLMTtRskfpUiZVe8elDzvzH4VDVY2/xuZUIsCs99m8lOoAzDnqcgpUSiPImAGXGtp5V3toa7lQ0YOq0J6+FtmL6aNKZhJORVTNVJ+W/5Liuvr3N27hm6bbZDQRqx0mPFLseQtxZy8U2X0mT1+XfwHZrfo1FD/Ryzw=
Subject: Re: [PATCH] tools/libxc: use uint32_t for pirq in
 xc_domain_irq_permission
To: Jan Beulich <jbeulich@suse.com>, Igor Druzhinin
	<igor.druzhinin@citrix.com>
CC: <iwj@xenproject.org>, <wl@xen.org>, <george.dunlap@citrix.com>,
	<julien@xen.org>, <sstabellini@kernel.org>, <jgross@suse.com>,
	<christian.lindig@citrix.com>, <dave@recoil.org>,
	<xen-devel@lists.xenproject.org>
References: <1625619764-23537-1-git-send-email-igor.druzhinin@citrix.com>
 <56e4d04a-dc79-ecc2-5ed0-0afef09077e7@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8567bc8e-27a5-2f56-2765-e9b249764aff@citrix.com>
Date: Wed, 7 Jul 2021 10:19:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <56e4d04a-dc79-ecc2-5ed0-0afef09077e7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO3P123CA0016.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 213f3bed-bb6f-4535-b069-08d9412868ec
X-MS-TrafficTypeDiagnostic: BYAPR03MB3992:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB39924B065F2D8BD613D77E7FBA1A9@BYAPR03MB3992.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: urdWJVZKqRkgkE1wo+Y8TL7qoZSz6oBALTTU8y7RMblGtIRv4HSlZ+iuZjG2gwumKLqqbSFBdGgjdTCeVCS2UzIfyHIYpAMVJG7GGU51xM6kIceVOJ/vYFb7qpoImvjfb0crhHLKM0tyLGk9RVgoT4sdZce2VOe2QyU6RbNBYzgqh4YGETgYrUNso4efdd8Vuq7AufxrzCAi/i4s+UZBMIAk8wV17hpuv8DfT1CAizSMvktKASFjkdePl0QBLEs7YzOGY7poh4Tc8dJpsNCtVjWJA79QlrgLE1JnVlHL1pE9OSKIuQjsPhliu4zZbjunwon8CL232lItADh7VjBtB3XWZ9gBXh57QphwyJvH8sFeh+eFBI9V91nZ388+a19Oe8LQg4VHl1HgtB1zrkh8GSe3t8M/5vt7heHdXRoEsdy1/fGeNcXvbCJSjpmBNGGM3gjJFkaC1tk5G7eCso3BtGialL7W3HpiqTzT9iFjaS/tiG2cgKGcE1mzrqDFAdw9txttL+nuOn0AwXUy+hy/fotprGCAOfXTAe+Kml2mXvM8jDWZRqufdIgZjuNi+2A0tAjii0sA8A68a8MwgyRhha3BkjdOC1EeN1Y4L64X497HX/aOThSXQmbgpjJi2frNMh5NhRH5J/rdfWYqcs1JxxwARzK0OPWE1Vq7ZN/W4GeZ0R70oR+DkQAYGeKDOoLKopxZ6qfwNc4kgGirj/syweaHC9m3Jhg7XLfUK59kXsY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(2906002)(16576012)(186003)(110136005)(4326008)(4744005)(31686004)(36756003)(83380400001)(38100700002)(8936002)(6486002)(53546011)(316002)(66476007)(31696002)(6666004)(478600001)(956004)(66556008)(66946007)(26005)(86362001)(8676002)(6636002)(5660300002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akVGNU5QVUU4bzd4QWhqNHVoMElQTjc0NGFoR0ZoWlh5aytpaG1WV2NhU09y?=
 =?utf-8?B?bmZzTCtIUDMwSGpRZDhqZFdsWW5Vd0hORkdYMkp4YW5MUWQ3RjcvQWNVTFFO?=
 =?utf-8?B?cDR5MEtVaDhvM1M1bEZ0OHVDcjZoaU5wRWpOU1RqOFRWOHNPWUprTkwwQisx?=
 =?utf-8?B?am9ZZUdvWkJGb2hzcVBMd0JETVNISjkvSktXQXR3bW1SVEMyTjdQSldJYzBl?=
 =?utf-8?B?VFFQbll4VzFaUEFyeVRKMDJmS1JBdTRTSWp5c3V2VS8weURoUGRHdVMxcm5Y?=
 =?utf-8?B?RnlGNVA2cG1PWnI0OXZ5cUNXUUlxQXA0UTFoMkJrMEViL2tGTGRtTUpqUzc3?=
 =?utf-8?B?ejVHTmx6c1Zsd3R3ZGQxZnA0NlhNNzBmSmZPYlh1MHVueXU2VnZsZWFmTWdF?=
 =?utf-8?B?YVZrNFEzbkJVTDdBMGV3Z1liK3E1UzBMamp2bDRXSW9nZ0NVTHdnZG9kMEFK?=
 =?utf-8?B?RytkYXJHc0JMb0IvUGNPUzFhenZnUFRhYndRMm9ZcVJ2RFMwNHhURDlBMFlG?=
 =?utf-8?B?WHFHd3BnVTdXVVA4aHlEalFaU2NESWorVi90Y0p6b0ViV2pmMjNSTVZvN21R?=
 =?utf-8?B?M1ltWWpqbmRuK2RDSWVGeE90WC9RN1JJcHoxbkcvTFo5VVNqVDMzY1RqRlBH?=
 =?utf-8?B?ZjlhZzBNc0l3Z2pacTdOenNYNmJ2QzhHNW5nOXg3LzRTdEROQjNJR3JrMmR5?=
 =?utf-8?B?Y2VSRFlPWHoxQlE0dkVkM0lRZ1JMVXplUHQ4VnA3TjZNTGh5cFllczkzWnh1?=
 =?utf-8?B?K21aemJXQWFkeklxNEVzd1dKczE0dDlPYXl2Mkh5Q0p2OUpNZzd3NlZYV3dK?=
 =?utf-8?B?ZWlCelJPQjNGc2ZnZjhvWU9TOGQ5bjk2eWtwS3NsamJiN216ZWNNT3hlTGtw?=
 =?utf-8?B?L1RPZDk5a1RGMFJXWXdlUENPSTFYMjVtQncvanhpTExnZ2tGdWloOTFVWlFq?=
 =?utf-8?B?TkwzN01HMUpORGZtZitCSVhNTzNhTnQ4dnI1Wi96bHV2ZTZrdTNyRHRuSlZr?=
 =?utf-8?B?OVprN1l2SHl6cVdVNVZBV3hnTUJxRFdKak50aW11dlg4OEFCQTlJSHVlNUtP?=
 =?utf-8?B?MUJQKzRWMGJob2dzQ2Z5cS9MOU12a21MUW5VUERMYXdtVlUrY3lzY1JScHZW?=
 =?utf-8?B?Y2xjUlMrYjdzWXR1MDlWWk53b3o5U0ppLy94biszUWZPT05kK3UzNkhHQmpY?=
 =?utf-8?B?bHZZSmRHdHVPd1N4STNIUWxqUXBxRmVxSzl4NHFGMDVUY040dDlkWGN2ZDNT?=
 =?utf-8?B?dkNLRW9kc1BMd2NHVkxiTFFmRFFOcFVyTjUwMUw0ZUVCTVpIR2UwWHgzZWR3?=
 =?utf-8?B?SkFadnN2SXUyMjNMNm1wQ28rT3pzcHA5NkpUaklPTDQ4M3VnMkc0dHYrR2hG?=
 =?utf-8?B?b3lXNUhIYXQ2S3A5TEtBMFFuMkw4dkFoVFoyQmhRMWJnSXBWaEU2RVdIUmxZ?=
 =?utf-8?B?Ni9zcDZVTzlzU3lFN2Z0ZUN5QllqSzM5YnNta3dXbkxIdDc0QmhXU1ZPd3Vi?=
 =?utf-8?B?ZFM1bzlTckkzYWpMODcrSkRYYVVtdVlHREVUR25URWtncWcvMDJ6MUo1MTNU?=
 =?utf-8?B?NFcvVzlWOHQwNW9aQVNRQlNJRGZOSVhEZEQ3d1llanl0S29UK3RSNVVOdldR?=
 =?utf-8?B?R1ZCa3JqWjlJV0xaV3hCRVZwVGI2ZEk1clNPc3V1bitXa0x5UFdxbTN0K1B6?=
 =?utf-8?B?OURZRmhoV2dadFI4OUswNkxyVTlYU2JnckJia0NSY0xzdEdjZTE3YVpSQUNi?=
 =?utf-8?Q?/ItepIMSkCvHjX+sZTNDbKJ7XrBt2W52xQCZPcp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 213f3bed-bb6f-4535-b069-08d9412868ec
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 09:20:06.5924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q4TCGJ7s4eV4pHxfyaYHnh1tt2UyOCHSIKdxv7zkscsJnmnUIbGrwYXg3b+/omjZ6rw12R7Y9IcQ+GN9pcuTUPmJdiUE9T6dIA1P/s4Je1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3992
X-OriginatorOrg: citrix.com

On 07/07/2021 08:46, Jan Beulich wrote:
>> --- a/tools/include/xenctrl.h
>> +++ b/tools/include/xenctrl.h
>> @@ -1385,7 +1385,7 @@ int xc_domain_ioport_permission(xc_interface *xch,
>>  
>>  int xc_domain_irq_permission(xc_interface *xch,
>>                               uint32_t domid,
>> -                             uint8_t pirq,
>> +                             uint32_t pirq,
>>                               uint8_t allow_access);
> Take the opportunity and also change "allow_access" to bool? Or is
> use of bool prohibited in external interfaces?

We've got bool's in the interface already.

~Andrew

