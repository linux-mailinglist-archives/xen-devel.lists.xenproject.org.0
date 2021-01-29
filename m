Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EE430878B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 10:47:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77850.141298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5QN3-0000CW-Tw; Fri, 29 Jan 2021 09:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77850.141298; Fri, 29 Jan 2021 09:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5QN3-0000C0-Q6; Fri, 29 Jan 2021 09:47:17 +0000
Received: by outflank-mailman (input) for mailman id 77850;
 Fri, 29 Jan 2021 09:47:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDuN=HA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5QN1-0000Bs-UQ
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 09:47:15 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11416e6f-cfca-4928-bfa0-114b773f23e3;
 Fri, 29 Jan 2021 09:47:14 +0000 (UTC)
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
X-Inumbo-ID: 11416e6f-cfca-4928-bfa0-114b773f23e3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611913633;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WcnF21aI3bwaq/9jkK4GV3Srxzsv/BC5enPhEzQ8hR4=;
  b=LH9FY/7UKpYornk16oiiv3BxEKk99ero4ApItsnrgZjBs/2+S7LpfGd5
   Afl+uxr52AL/7OwxsraW6yjZGbBc/jX5MXdlbV3QupeDtk60u020Gt1M9
   FV6JlgIlQ3LKheyO5na5Z3NAEJnSuhxoJHZ8rlg2a07IwgVNZQMzmkn6+
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: SycWBVuaDPk79vex/U/e5vbQVcr+8qYMEhtcYkVDGjeLFdOxzFFAjtHbmQwpmpG/Z8CKlFhBBV
 4VtkYQRyDnvdhZtrw1UVfjewCUbphLpUGKJAAfJ+i7esKJv4PpMAWXCH03qXU7diWS0rFMYuAB
 YAFfh2Ilc9BE+LM5iZqu9R3Sek7YDiak/rHHJ049VqT7hwvntDCoxCUpj15D2aEXzjTdthK3CE
 cQRryoacq20sV7Ks7RZ7OMBNlLIVT+9vDfwFooAe3lBHfPkV8YYE93hUkXoDHWbWvkZBNB1peJ
 eYM=
X-SBRS: 5.2
X-MesageID: 37462314
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,385,1602561600"; 
   d="scan'208";a="37462314"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jtvDCOrXmj1vFqfly4geySrNDJF24RGzwxpU8mnGBKgNwH4ZhnGame+0UxUiFCntzirjR5e/1rUmhTwjQEMvM6WnrFx0+NPkCGJaPzcMmEmRDbpzr9ugN4hiRd35qbulqEpeIaHylMNN0PbjbMp4ZPggJ91yIUfTNYpmOq08Vn5laO1jnDVDNCarSzviw/09aRd/qPw3tEiuNJJ2/V9ZuhBS7l/R5UkAAUyLujjoF9ZYxGAGvGkExhOrRGwru0VoqxUvjqH4A4XJU22yayYdi9xspYNvo/l1DSOV38rLi0V/pt4/ruFPSR8y+gaUnPFzE6f38uc/GyMmssQzywo9eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGsQPYwrt1ewXAnFI6kp+vAPC40PetQEqJ/Y4YRcI4U=;
 b=AyrJfRS4eHZC1EqcjNNfuIGu7YH0xnQBdU6gh1EtTJAKx/6X1wzmC6Zci5L43EW1+Ntqocg92IWTsQWH1xJYcg2hsUFhiydhGN2dAfWVqLEeFNIzGCpTSfhPiQXgFwQFY2TF/2Mxl7AxI8aUcxDp166QRcl2EGXeYQDnn0SnR55KhrtQbN9FcE1LE/KfMXK6kjxkZTLy4E9P5Zbvegg+zmeHqD5BYOF5p/F3dy0TrhCzXf23k19v3a+AIRoXKxFnwiAXRBnHahAaJ5ix6KXkn8s+5H5H0Y6wrLQnlWHc87Mz3OHidY8wcQzAlesn02c+fGHZ+0Suy50N4dhaVCS4vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGsQPYwrt1ewXAnFI6kp+vAPC40PetQEqJ/Y4YRcI4U=;
 b=hGwAB1PqrDXBEegl3dkXFCRYo9cBLo/1bK2JEa9auk3Z5Nr80ZOqvB5ktfP2NERoEQHyjAUO1fTOyVwaSMtOrLcs/P5AADYDYlBezKiTIPc4PUaDbkjwvSQSFDBs9UJp/np41iuODGKX33wJoToLD0jKCWU3QmvNoER3fO3xt+o=
Subject: Re: [PATCH] xen/memory: Reject out-of-range resource 'frame' values
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Paul
 Durrant <paul@xen.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
References: <20210128160616.17608-1-andrew.cooper3@citrix.com>
 <9879dc3b-5c00-b9d4-c74f-51177580ae7d@suse.com>
 <c31e3d04-6c01-95fd-af51-bbcbf0f450d3@citrix.com>
 <73e7ec42-12be-5b03-7c91-14e3132d3324@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0c574f20-9d92-ba86-37fc-eaa72c3e3d16@citrix.com>
Date: Fri, 29 Jan 2021 09:47:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <73e7ec42-12be-5b03-7c91-14e3132d3324@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0065.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::29) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 430ea330-200e-4a47-d961-08d8c43ad7e6
X-MS-TrafficTypeDiagnostic: BYAPR03MB3782:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB37829A6D8C50DEF8CD7D5E3EBAB99@BYAPR03MB3782.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K4sPG/aMbq4c63IxKObKs4DvoOJvA2gzyrQiXoGbhJ49KesVi2jxF72KAdo8zj+VlfjFVpJZUlDVZ0T5QmWpQSJWBjItQIiwkFho8GC1IA+xYQ69oMHH/HB6RaVT1UPKfM4IX7RDqY7akR6jj9MNy6QcBXfu3YWj5qsz1yUuKOVVTKbEotquPMlvdHhAiDi1VV2Qn6rfP8qBngN20Ka413HVS+BxvKsKDaVxExHxfx16wnzphRx5HDpeou9ch3ZTUfwEOLRH9JEbScCN72S9f0bs3G257ldGyah0dqOE2+7YA4Hw7x/+2mZewH/ymHilSxxh626ISDUosMA2g/aIPizoINWwiPtBkGNlaeQUBeUPYVyXLaMkeCahN6zYlTGDcM/cyGopMJFmbe4eQNeKdcvtOSMwue6qCKDKBdPqZMfbb285jW1WOl6OXkH16dPhJNiq07JbccrkEzcNb9AxT8H6Y4/Wn5lGw1pWejlQ1Kt+rObti9JdVlFTh0OrAOEY6206qSZ4GDJ/JvrzLD6cNhWAxy09Ta3AqUmzKI7Wd9XBD9SWj5c2o3bLCzBSXH3E2fKG45OyvzrcbRU03UoRS3+BBid6NbnVUSc4Va7PYfw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(2616005)(478600001)(316002)(16526019)(53546011)(54906003)(6666004)(83380400001)(186003)(31686004)(4326008)(5660300002)(8676002)(6486002)(31696002)(6916009)(26005)(16576012)(956004)(86362001)(66946007)(36756003)(66556008)(66476007)(2906002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b2F6OWcrRU1ZQ3l1MFpmU0VHbzAwYnFINnB5ZDZZK3lQR2FkQWZZUkZGVTRR?=
 =?utf-8?B?UmJ5bWJxTEtMMWxrcThrRnhBaFFMQjNrSWluZmNVVWNGZjBoL2cxaEVTaE95?=
 =?utf-8?B?N3QremJuaWQrazNvSUFpTlMvcFY0ZFJUdEVoZm9MY3AvTFpoVDZxVTNOM0Ro?=
 =?utf-8?B?cVA5WHE1ZHNiNjRnZXN2NmtFRGsxelBNbzVxOTRTU29yTzNLUjlOMExKMm50?=
 =?utf-8?B?RFMvWmZVcjh6YmZqT05Ga0hrNGxEUDhmL1orenVzWUJUS0puVTErb0QwVmg4?=
 =?utf-8?B?eVlxV0Evd1hLNlJqdXE0b0hPenZmVUxadkpXQWxUUFBuZVEyL09JT3VOazRy?=
 =?utf-8?B?WkFKdU1NenEyZTBIUm5FUTdOTVplWWlZSllVR29sWDkxKzFvM3dkR0E2Rk4y?=
 =?utf-8?B?ZnRLL1RkZ2RacGM5YU82cWtJdXVkT1dFaTJ2SHRiTHhiYTQ5ZnRKQWVYd2RY?=
 =?utf-8?B?azJRZE5qcEc5Q3NvYytxUlhhOWdCWVIweU1EV2MwNU5TSTF4blI2R0xhVzhp?=
 =?utf-8?B?VVNwaFA3NWwyQzN3VjArcXZUbUtrb2xDSFhlMnpyN1ljU3lud2dScUFSRGIw?=
 =?utf-8?B?OFJQWFFBeUh1ejdBSVNnVnlsY0pzUkQ0TUYyckx2UUFQZ2JTNHZWbTZ6V0x0?=
 =?utf-8?B?MUZPNVBJWGlnQXE1U3h2WjNuK3V2RjdQRHNxN0lRN2g0KzdsTzVLZENNdU02?=
 =?utf-8?B?VXVSdW5JanRMU3kvNUdETkRrRHl4Y1RtNmIvVUJDcVkvam9IbXVERGx2Y2Nn?=
 =?utf-8?B?TVh6ZHJpMVBMYysvVytNeDQyL0oxaVA3dXl5QkREUzdyODdDUTR0ODFOSHM2?=
 =?utf-8?B?UHdkNlBhSGZzUzBLdnhRZDNuRnZhY3RBSzlIRXhzZzZiS1lTSzBBWFErVzM2?=
 =?utf-8?B?RUNjQnNvU3pCZmlrNDFxNXhacFFXS0xaZEJhMHMyTjZ2M3BEUWxtRkEyejBQ?=
 =?utf-8?B?dmV6c0tFa1Y4VWc2dFFEM3dtTjFIQW9Bdmo4VGdRY01zQTQ5NVFYMmtnQjFN?=
 =?utf-8?B?RzJ6NzNlU0NGRTBTaUFSYlZ6dlBOZVIzUEZZOWpqeFpJOGFmMGQ0RFN5N3pZ?=
 =?utf-8?B?NDJiTHZuMlZXYklFczllaU9tVUJha2R4R2d0S2pPd1UzandqOWdwb004ZGFE?=
 =?utf-8?B?a2dYK2xHT0oyb2hCaHp6VkJ5Y3RMZGVOOENieWliNUpWT0ttWFVxeU1KNjNk?=
 =?utf-8?B?TkpRa2RzdDIyRTdyVUVYUzIrMmlSYnd5d0NnQ01LK05oYWhWZ1E4c3dENUVG?=
 =?utf-8?B?RzZPWFhrTk4xRHNwbFlqdEZvSUxKcTh3RnlzOGJsUDluejh6TWlTUmpPbk9G?=
 =?utf-8?B?OWliTzFFalJTN1NRSXFMQzR3WmJ5Kys2MkFTWHdCT0dOeDRaMmRISGt1YTNa?=
 =?utf-8?B?L1pMdDVGcUI1S25OVXB5dWQvNDlWeE1CNHRBZE1BdEtBTTIwNFRHV3R0b1Mx?=
 =?utf-8?B?VXBYVksxRHA4dXNFMGxQYzdlVktTL21xYlBFU3R3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 430ea330-200e-4a47-d961-08d8c43ad7e6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 09:47:08.3632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8cOl7T1I+x0UqqQVwBAfBxQ2aOIf/f/KTOdkb3bCWKoNpPNRCIZZG9HWD/LMMy5YQelwtOCYve+0+6n5K76/Gj1Ovoxeewvkk8cWPZ4Aw0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3782
X-OriginatorOrg: citrix.com

On 29/01/2021 09:40, Jan Beulich wrote:
> On 29.01.2021 10:32, Andrew Cooper wrote:
>> On 29/01/2021 09:15, Jan Beulich wrote:
>>> On 28.01.2021 17:06, Andrew Cooper wrote:
>>>> --- a/xen/common/memory.c
>>>> +++ b/xen/common/memory.c
>>>> @@ -1054,7 +1054,7 @@ static long xatp_permission_check(struct domain *d, unsigned int space)
>>>>  }
>>>>  
>>>>  static int acquire_grant_table(struct domain *d, unsigned int id,
>>>> -                               unsigned long frame,
>>>> +                               unsigned int frame,
>>>>                                 unsigned int nr_frames,
>>>>                                 xen_pfn_t mfn_list[])
>>>>  {
>>> Doesn't this want carrying forward into
>>> gnttab_get_{shared,status}_frame() as well? Of course further
>>> cleanup here can also be done at a later point, but it leaves
>>> things in a somewhat inconsistent state. I'd like to leave it
>>> up to you to commit with Paul's R-b as is, or extend the
>>> adjustments and then also add mine.
>> In the series, those functions are deleted by the next patch.
> In your submission you talk about a v8 series, which I took to
> mean the vmtrace one. I understand here you refer to the other
> series, presently at v3?

The two combined is v8 because of the dependencies (and that's what I'll
post all together), but yes - I did mean the thing presently at v3 as
posted.

>
>> What's the likelihood that you'll choose to backport this?
> Didn't consider this aspect yet. I think I wouldn't have picked
> it without anyone asking for it to be backported.
>
>>   I can extend it if needs be.
> Well, if that deletion of code gets committed in time, then of
> course there's no real need to fiddle with it here.

This specific patch fixes a real bug on arm32 which will cause unsigned
long + unsigned int to truncate together and permit certain values.

If you want to backport it, I should extend the change all the way down
the call tree.

The rest of the cleanup really depends on the libxenforeignmem change,
and ioctl fixes in the kernel, and probably aren't suitable for backport.

~Andrew

