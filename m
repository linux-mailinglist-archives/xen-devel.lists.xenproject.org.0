Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C5231A57E
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 20:37:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84429.158350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAeEV-0008G0-Al; Fri, 12 Feb 2021 19:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84429.158350; Fri, 12 Feb 2021 19:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAeEV-0008Ff-7a; Fri, 12 Feb 2021 19:36:03 +0000
Received: by outflank-mailman (input) for mailman id 84429;
 Fri, 12 Feb 2021 19:36:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o46S=HO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lAeET-0008Fa-C2
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 19:36:01 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 484e50de-db2c-48db-8d81-41cf6074c5f9;
 Fri, 12 Feb 2021 19:35:59 +0000 (UTC)
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
X-Inumbo-ID: 484e50de-db2c-48db-8d81-41cf6074c5f9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613158559;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JLB/N6vyzFsgB8EuuJagPk41G9hnHiknEi9TCRPI1GA=;
  b=bZjStSUHCeE4cclXrn/eWcS27m9lwO1b0W50P07WoCYE9mXxAok4qbYl
   JS24ARlFJGuE5IcJXwsHrTAmCl1+LQQMaoxyS3XhUrZcjoJjkRXiHAkjY
   aA9P6gNObk09hBLJ8fufhg65Gz9zdnj8y8SIR0aLlL4LGV1Yk+0sFUpgJ
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: A8QwpC+iga+gRWHwRpliqUFyDXuq907TblMdGliqZGio+xmdnNqVvU495jcbYxm3u2gm1d1xDp
 pb65gXsKZTjJp0J9rJBIRhIEuBqBKo8G9skbag90FNNefHbCOCR6oXZ59RVezxVQp3mS/995p8
 EWuHuNEo8j1nwb/BGUiNatBMrAYhYPHRBEJEYKiQtQy2H9FDWypQerD7NrfCiAuRUe5PflS6lX
 A40Zsy/NDXl8X0RlXfg/8Hchd+Z4X50vLGm14np11gVnrxgELunmD2lHRPR9BJEOz1y0TF916V
 /3Y=
X-SBRS: 5.2
X-MesageID: 37104963
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,174,1610427600"; 
   d="scan'208";a="37104963"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYYVIoizhj5lhw8fojnVOx1bAIbE02ffPYtbY05UTi7HGrFlm8RnUpE5o2Cn9EFI0YUDVIdndviPdfwp9mJxtriQNbrRSpcXoYpJhoqZbKyX6x1KuyKEbZ5KnBg48jsodv1dDPWgnSo1Mgkog8c1aVWyXBnIBiIXnj/GjNjhlU1OZPBBDS40puNsxNjoDip8tf98Ji1H9n6OqQt2DwFUpWhaP1w56UU02tCmb81/pHChDf5sl4GvksIVOg3FnKLjxqiFyQj9eIdzx5/cmEH5MxVr9ggm2hSx1G8Jxc1UeSvtXOUVGxalYXLCwX6NbbfvEWQLO4UnRfOcxcfo7HuWDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLB/N6vyzFsgB8EuuJagPk41G9hnHiknEi9TCRPI1GA=;
 b=FSQLgRPWSBl0diNYK7dyaCMFlBY5LyRLbBABcyDFVbRJQ1HP72SpTgvWL7AsI6t3wxHP+ORtjVkHhk8AldTqjns3cL3emmKKloss2oTHaD9o0Z4pnww8/P0uoaw3FXC43edMRDuaUits22naziZpX5NfAE42Bct5tomwJzH//IeeBLTX8YoYMBGDvaYK248smJ4HRijs5fJkkmgjBWOil/pke0BJTt3eifYnFGzJQxCaXY8XZ+tL+hf9014mIGp3Lm2FQBgR0iyBcElZ3QqaVDLlOXiF4MrmQc7+IQ3jiuWIafN2ZPfwMOtZHm7KQmiPyXMm7oLudWavOA65FcpwAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLB/N6vyzFsgB8EuuJagPk41G9hnHiknEi9TCRPI1GA=;
 b=ZL5vHXQnByWxkzV4z7SGErgzHe8L7Xqz2A0iHQLSG0/t1TIiGZC44slgTSTY+aeXbEKsQgA76Ffz3BQwztspd0pbRySf3uj7RcbohRdiN37mFPPkAZFtam6dsesQuLF+0oQrJFhI2tvE1tWFT8qf9WkCk/LtE9+KRZiTDmmMAo4=
Subject: Re: [PATCH 03/10] tools/libxg: Fix uninitialised variable in
 meminit()
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
 <20210212153953.4582-4-andrew.cooper3@citrix.com>
 <2437c26c-2bb6-ec43-37bd-3051b97eff56@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2747d0fd-888c-6de0-fe6b-77a7b00ab46d@citrix.com>
Date: Fri, 12 Feb 2021 19:35:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <2437c26c-2bb6-ec43-37bd-3051b97eff56@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d23a8cf-7af7-4898-7c28-08d8cf8d697d
X-MS-TrafficTypeDiagnostic: BY5PR03MB5282:
X-Microsoft-Antispam-PRVS: <BY5PR03MB5282DEA6482DD0613F80F320BA8B9@BY5PR03MB5282.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: INgpMd3xWnz6ptvTriKgxhtPkZOhUd2i352wltAD7oMty6T6vjUcto4xjWH/kVB7ujycyPVK3Kysr2GDkTXvowqjI67uhhRy02E3foMbpN6HfCrbAiCnhr0f+vOxeAKKqGXiSgq21nNjqutNm8qd18V1KVBiyzxf69DXFWX9b8DbbZ38np55uOgC8lo0mgF7bLdWSNG+FK8ZhKHKoa5/sML1cGpDrqjoLkjqtGwO3SHon7DxWOGOeUTWdllIPXz5oYN1USGdcUENKoQi/HLqUi3O9cDQlLhXaHdgQoOBbYe7n+RTkZlJz4U3I5lZW8LcV306+KlvYTCvijMZuozeSAzsfV3tQLaJWwEjH0oZIoL5KFh0LLKeOgXsDrcKA6T1wDkVBre1PYZywr4R5eilYpWNdQ1skithDXdCV/Rg7Vlnw/mPTPAUPRKOnexvRJ5IXB4p36PxbNA5fKTTJVBvaoU5r46S0FrLahF8VMKDy3PDgmU/UKt2mxJD2KxFIACOBdhX5boaWHWUTVCk2s7fKhuRej9+Fj7Xfc2DcGSDDM4mWkDBJJQD7s4a4XZUqDJib7pnXiPqlb+Hbmgji5kJhc6xqKrHHoqspDjPWG8Jlp4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(6486002)(2906002)(36756003)(186003)(4326008)(6666004)(8676002)(110136005)(31686004)(8936002)(16526019)(31696002)(478600001)(53546011)(2616005)(16576012)(316002)(86362001)(83380400001)(956004)(5660300002)(26005)(66476007)(54906003)(66946007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UFNXWDVxakhJMUJCYTB3QzVWa0lMVWdjZmZ0OW9UVVlET09VSU9QcHEvVEF4?=
 =?utf-8?B?L0JQNVJPdXMrczlsOFZLVkNsbU5LWjdRTmthcVNwTmI0TGhEL1lXbEZuSTQ5?=
 =?utf-8?B?Q2xtSUZvWU1PcG5EUXE1MWpTajFocjFFY0xGVUhPYUoremttQ1R3R3NXZlNQ?=
 =?utf-8?B?WGhxYnlRVDZwSE9YQ1R4bU1TZmg5M29PN0NqbHJSWW1acGowT2QvaEE1S21h?=
 =?utf-8?B?WkxYYzUrellOSlh6ZGRmejlEOWh5TWRHZXdFbzBWZWhBdVV6NE1aOElEdlJz?=
 =?utf-8?B?RHl1VWtqeDlBcXA1WXErcGpmb0hzUEplUnJldWJDdkFNbFd4aERCYVNzUVd1?=
 =?utf-8?B?TUtPc2NRWXl6MFVIZ0RsNFVrTVdkZWdZaE1sUERUTzI2cTU2OWdlcjBacDVF?=
 =?utf-8?B?c1Bhcm13VlJ5UlY2MkdHb3Zzdm9sMGJEb2N4OEt2QmhqeFFNQ0htenR0b2lI?=
 =?utf-8?B?cEFuU1I1OG9PWXpIaWtxVW9xQ3hPRUJyQXNIalJxbmJ5cDV0emxVVDFOYnNR?=
 =?utf-8?B?ZFh5dlFUbkZrdThvQ0JZWDl3M0crR0lOWUNGWXNPQmdsOENjdDNUN293dVlF?=
 =?utf-8?B?WDJEQXYvZlQzNlR6VEV6bVRUTUxVcm5GWXlDTXR2dEt5VlVyNjJNUnY3Y2l6?=
 =?utf-8?B?WG91Rmw4blB0dGp6YzczYVhpU3crNkFhem5uUmd0SGpQRFBzTlZJMVVYb3Y1?=
 =?utf-8?B?WjNYY2oyOEFzUi83allwSFh1NVZrUVFjc2hIc2c5WlZhemxtWmw3NzZtUXpm?=
 =?utf-8?B?cWh6WmZMNnlyT1ZWZ045WFk5eEVTK0tKcVE4cGdlem5NUC9kdGFVb0F3emNs?=
 =?utf-8?B?ZldFT2xCeTZMOGs2bHBkOVpiSk5lVHVFWmRjeGF6M3dTTzRmZ3gvOE1HWDVa?=
 =?utf-8?B?VEhrK1FBR014cWRBK296YUhGaVNmd21EdUlRbWpVaXVkMnZvZmpndWxmemha?=
 =?utf-8?B?KzlHTXpmaXBETWlxOUh1eVNDd1Foem5zelEwY2F3NzlPbVA1TjcycDZtZUxt?=
 =?utf-8?B?VXBUN1dBa3Z3Y3JGTVYzT1VaeW0yTTdBWEREZG91dVlVZ2xxRGdKQWxsRk84?=
 =?utf-8?B?RVZmdy9kSU1OdkFVMkVoc25OMWJnaThiRmgwejFBZk9aQ2lScUd4OXBYNzVM?=
 =?utf-8?B?b3R2cVZQUXJseDFzMTNHd1Zjcm1FbkxWaVB5aHFYa0U4V1JBVHltTkduNkQ5?=
 =?utf-8?B?M2ZKTlZCcng0Mk9STXFlbjlSRUR3YlJlZ3htOG5EZTAyeHNRS25SaGtXOE9D?=
 =?utf-8?B?eUNUNGo3VEpncC9LaVJxYUs4VjZwd3JnbzVBZWhuU1hPR0pPTGRLeU1zRHp6?=
 =?utf-8?B?SDRiUk0wWlloWis4aXBKTzE5YzVrSGlITml5UE5jN3RCSWZmRUFQZXJQUHJQ?=
 =?utf-8?B?cVVsODdjcEhjQVJlenNUTHFYeXJPU25KT3NVSkNxYW83b0JXaEFBTlF0V2ZE?=
 =?utf-8?B?dGFYZG1zT1ZqbVNZemZJd3hmdlg2ZldKQXlic0RTT3JaMlpFVy9aS3ZjQWVF?=
 =?utf-8?B?dFhhbk9LeGJOT2RoK3A4YVNXTWJjZlhyOUpLWWRMWmErTWdqYTlpQWw0TU81?=
 =?utf-8?B?ekhPb2tndkZFck9hMFdwY1dLRjlKcVZPQ3VHSHpMejhXdjA0bEsvTW05a2g4?=
 =?utf-8?B?eTdSTkxoZXdjalBlblN0YWJiQ1lUK3BFNk9jSGxpQ2IvWVJSVVllUlIyeXUw?=
 =?utf-8?B?ZDhtbFRsLzNOdUNzaGJVTTVoTlRjWXpJekhMaVVWZHBhaGJOZ25rZmk3akR4?=
 =?utf-8?Q?iTQ2sYnL6+/uRZvA3aplESP2O8Au6+iNqmrh1jR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d23a8cf-7af7-4898-7c28-08d8cf8d697d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2021 19:35:54.8979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PvrwqNHmUVcNUMr0of6lam2lr+UEVX/Ez1w4tyeNWm8GzuFLyqK7pMCAi2EutEfcBwebLfujvBmBEKV3wa+am6OdOyk6KnI70DJfk45Hv2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5282
X-OriginatorOrg: citrix.com

On 12/02/2021 15:55, Julien Grall wrote:
> Hi Andrew,
>
> On 12/02/2021 15:39, Andrew Cooper wrote:
>> Various version of gcc, when compiling with -Og, complain:
>>
>>    xg_dom_arm.c: In function 'meminit':
>>    xg_dom_arm.c:420:19: error: 'p2m_size' may be used uninitialized
>> in this function [-Werror=maybe-uninitialized]
>>      420 |     dom->p2m_size = p2m_size;
>>          |     ~~~~~~~~~~~~~~^~~~~~~~~~
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> This was reported nearly 3 years ago (see [1]) and it is pretty sad
> this was never merged :(.

:( We've got far too many patches which fall through the cracks like this.

>
>> ---
>> CC: Ian Jackson <iwj@xenproject.org>
>> CC: Wei Liu <wl@xen.org>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Julien Grall <julien@xen.org>
>>
>> Julien/Stefano: I can't work out how this variable is supposed to
>> work, and
>> the fact that it isn't a straight accumulation across the RAM banks
>> looks
>> suspect.
>
> It looks buggy, but the P2M is never used on Arm. In fact, you sent a
> patch a year ago to drop it (see [2]). It would be nice to revive it.


That series was committed more than a year ago - ee21f10d70^..97e34ad22d
- and tbh, I'd forgotten about it.

In light of that, I think I'll just delete the p2m_size references
here.  It's easy to prove correctness via inspection, and removes a
dubious construct entirely.

~Andrew

