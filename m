Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FB12FB62C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 14:01:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70354.126232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1qcY-0006S7-FJ; Tue, 19 Jan 2021 13:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70354.126232; Tue, 19 Jan 2021 13:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1qcY-0006Ri-C3; Tue, 19 Jan 2021 13:00:30 +0000
Received: by outflank-mailman (input) for mailman id 70354;
 Tue, 19 Jan 2021 13:00:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d268=GW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l1qcW-0006Rd-VW
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 13:00:29 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18a90e99-e084-4c0a-80ba-03f64dfb8de5;
 Tue, 19 Jan 2021 13:00:27 +0000 (UTC)
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
X-Inumbo-ID: 18a90e99-e084-4c0a-80ba-03f64dfb8de5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611061227;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2VZ4mHQwwiw14h12pSvq/+xn9f9lJvFFb2tMqJrKJLw=;
  b=btFCu+bjhx2Tuuzhal4Jd6hrGI/3OzUuXFCpxu9rFcg6OLLgJvDiIuek
   2WgMEPxJBova4zwqztPG+F+UiIr9I1k7ndJvp5/Tk2/9VoiLlhEfYOP8N
   Vv/sJ3aDHCNofEJAdfisyHyrX8fKFCURQXIUVlKou5ocb1RbKIoEdIAS7
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: pBUg5Net9nev7HeIRlsObtniz8049RmZWgU9MVCtfO+mdC5S9Xwp5oPFfFUzrcqg1Xjmq4BSVw
 cy4W/n/Rq7j7m8GzyArmOsekyCtPd6sQD0v+E8+ZxQAcVhIc3DJmAsOV4Iplhf13+om0bux4k9
 AHBcyt+tkfIGjuGUenPq4Pqgbfok4A0fv3fF/Lbs1nS4qskJAnmPYXs9JRL759LYJ3RJHSTaZ6
 1g3mWd02rqYLZeMmp6/mG2x4+Bbu87NYO00cqw9xUXuRD4nUX/yon0+bAsLwRUaGxwbXPUSwnv
 G4Q=
X-SBRS: 5.2
X-MesageID: 35353654
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,358,1602561600"; 
   d="scan'208";a="35353654"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1GGF5fki23zEmZju6Ibihh2kZGIaxt/cpD7ASNItzpiFYrfzdmNcxdDdhgHIAGDJlq90gKUmBk8y1gyU1iYFJUQenoWdZBwUldwruYP0p9+DGI5J0tJQGhO0sHM7p55oOoQH6/Ol+Tc1Uh+9jZwx0JLZRyUCSnlOq+l3puD7K0Vm3e4R5YdngH70ZIFfZytnaKTJvNymDvgJfmRIYN+kczuMPSUi2tHg7m9/PwlibMtgTIltdikmWcofovSzYS0eVo9dIXSF539+iGQgZSqxmvfWdHUEdHBzQ4USdlhBcS/pf29kMtselsAgn4vshjjkl03YiyC8xvpF0aVQaCgtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xdXf/3NsJXv8d6KfeCB3uRCCVAKXbruqO1bYRwSTlDc=;
 b=CC/kJSlqxtu+vYsscHNM+MCQFeZgKSyhphUerRNfJbEeVZqHkuLE7RrK2C4rsDSwrhsGfkSGtrsT6ysxLSG8FtomZBf38GIA+vnPsK1DGg/7DzH6kqGxy0OqXeMgbTtFjUKgScgXI3BfjHgKHxUE4sW77vfXfGPhag+5AIu1pQXpEVjN+H6ugiiadONex42tjEN2dI9re2DwtRzhqEOe0vhtihEVSkKEuqiR0L0GILtZlNzwAnHN05DCS50XxYkoez8jtFfYuTenWVy75j5tp7wOb/5T4XGQ34xl8zYqSR42Z1BabhGeAEnSXVYFrFMQL/7fxzZJfL3yZoU2dF5sFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xdXf/3NsJXv8d6KfeCB3uRCCVAKXbruqO1bYRwSTlDc=;
 b=fYSPP3ka/+Zyqoib1lei1niGAAOwLvxcGHFZJ9WWLie3dKyq2fttcTpwI0kjphBX2rrjwACxvz9sBmV3L7dyw/r8gHB+hTfDvgPONsZZJt8bWQRw2s4TohULWPKSYvyKreum0gjkrNgo6EKnwA/Od6Yz9EKa7Dc4oXpRCXhPF8w=
Subject: Re: [PATCH v2] x86/mm: Short circuit damage from "fishy"
 ref/typecount failure
To: <paul@xen.org>, 'Xen-devel' <xen-devel@lists.xenproject.org>
CC: 'Jan Beulich' <JBeulich@suse.com>, =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?=
	<roger.pau@citrix.com>, 'Wei Liu' <wl@xen.org>, 'Tamas K Lengyel'
	<tamas@tklengyel.com>
References: <20210119094122.23713-1-andrew.cooper3@citrix.com>
 <20210119122756.27772-1-andrew.cooper3@citrix.com>
 <010d01d6ee60$f958b620$ec0a2260$@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <54992081-4537-d225-bd79-e17f43598bd9@citrix.com>
Date: Tue, 19 Jan 2021 13:00:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <010d01d6ee60$f958b620$ec0a2260$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0293.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::10) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78aa2570-5613-4741-e608-08d8bc7a2e90
X-MS-TrafficTypeDiagnostic: BY5PR03MB5064:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB50644913D7849252167A90D7BAA30@BY5PR03MB5064.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:338;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Wtud1oorthAWhd4jyoXPVI0RRaqz/19HMNnO/3aNqjtJFOEtRHpuX/EqG3mKHbwuLXeP7ZxXbUY7exoNSZS5DwT8hwA2rkPZkpE6UM9/7AHgE0escY+2NxmaAQQTUtA/HRllPm/LmvzreKeIRSfyV4/IDr5RtDXOsB7OzAoK/z/lmd4D5v3V7DsgCNSyeFOkI6/jye5DqTrXlyAGbp3I+HdYppvO2NBJG7NdzXCgkb0HYWSKXPS+PIaK7xZb/u/7+bzUin14Qh+3MORNHPfetznesg5anPCobHlw+dIOCxkHqRmznMMduiyjfg8SmbfpSvxw0D187xlgqMFbegHfXQMP54YuhtG8I2aELCA1i23/B8gXeahMXOs+CqS2wjaWxnj8+t1fhCmk0ApL09/0iC3VbRV8CF7SsDjROrJpmMiS/w5MtKAeq0CDPRZOxZSr32S4DDsnk97JgBBjB+TuKD0W1V0WepWNk9npKINd3EwFxXHv17hKju7vyy3aP7o1Ll8cNQ6yU7+xA2F8jPRfCXYyHY9+BOXllD7skWtwc3ppz+vZYZed7dQqp9bQWk+i34pTmZjRpMwHu16wlPzdouD83dKsMKSaRknsI1EREE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(186003)(478600001)(4326008)(83380400001)(66556008)(66946007)(31686004)(66476007)(6666004)(8676002)(5660300002)(2906002)(86362001)(6916009)(16526019)(54906003)(31696002)(6486002)(316002)(53546011)(26005)(956004)(8936002)(16576012)(2616005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TDJoWVd4ZXZucWMvOWpjRHlkeXdRdkxRRWFnUjVnbUJyd0tGbkRyN214K3pH?=
 =?utf-8?B?VGNBU2VpQzJHTWhLNCs5MkNlNDNLeW01aHlvQ29jQnY3cENUVGttRXZWa0NL?=
 =?utf-8?B?N0IvYVdwMlZDMVFWOC9CYkdjNHQ1NWFiVkQxNHExcVUzZXV0VEovcUx1bklE?=
 =?utf-8?B?bURYdlIyT1N1Q09qdC9Va1p2ZlpXZ2s0MWRybVAwYUJvU3RQQkdsbWNGcjJo?=
 =?utf-8?B?S09rZXkxU3Z4ZEgzM2lxb0NQdnpmNTlxai9Vek1QazQrL0hJMXFFeXdpa2xw?=
 =?utf-8?B?R3JtOGFTa1Y3OEg1ZStHMWJCcXc0U09qSDRkSHIrZEZXZVYrcldHdjF2Nnhk?=
 =?utf-8?B?Q1NuUllkeTR6czFZUXA5Y1VLbC9EQ001S1c0cWNLNHl6NjBGdG9ubGZRbkVD?=
 =?utf-8?B?NDJzTUcvbDVJblBEejVrRVAyaWJucUFzSVVXK2IvQ2cxZE5CMXEvUVczaUtO?=
 =?utf-8?B?WU1ZeXJKUUVqamRkUERtSUdHZGN6by9BYmpoK0dvL3VvY1BON3hPUDBCU0JO?=
 =?utf-8?B?TXo1Q093dzhOUHgyUzlIRjU3VzJvYUtkOUZXTUd3Um53U2pSR08vNDRZMC9W?=
 =?utf-8?B?SmhaY290WjRoUDNHMStZWUdGNEZibXR2ZHZJKzBoNjk1Y01XL0RVNDFiVkIv?=
 =?utf-8?B?RTRqcDdqdmJFNytMK3NCT1RmRXEwUVpnU2JtYURoSmxxOW85WXJSS1FjV1h0?=
 =?utf-8?B?cXJTOStqeGEzNjBad0lkNmtIKy9uYmlFNkVtNXJIaW9GY04rYzdsUjh3aXNi?=
 =?utf-8?B?TE9pVW5DTFNnYXlxVnhwL25OK3JEbDY3WHMrUzRkaFdRSWF2TEJRM2gzSTBt?=
 =?utf-8?B?b01zSGx4cUZyNVVjaEZSTnFFTjI2WnVXeUJiTzRMZHlkUFEzUHVaSkZNRjhH?=
 =?utf-8?B?ZTRCMXVDWXZiTVVxN2crWWFzNzZmYjhNYVFRM3U5b0xza1Rxa0VsTnhXOTlB?=
 =?utf-8?B?eHo2YnpnRzZQT1lRbFdHOFIwRGVEZkY5WkFUU3VXLy9NZXJCVXM3QWlwMWJm?=
 =?utf-8?B?OGJQSGpybkU2a2hXUTJJTTIxejh2VmdWc3loTTh3QUZUNktSUDFlZHpXTFB0?=
 =?utf-8?B?OWxSQmNtVnhQZ3JsK3cwbFlDOFN2U2VDVm1WVmRyOFhZNmJwZy9Zd1pHVTla?=
 =?utf-8?B?ZlpMVk12cmI1MnNob2p2cGpXemZIWGxEa2w4MWhQam1rNmxoQUtueEJFZGVT?=
 =?utf-8?B?WG5ybURwVWJTN2pCemdobFhtNWVWTWNWVEhnNGVnMEljSmRyRk1XbEtRRzR2?=
 =?utf-8?B?b1FQSENVQ1hCaXJ3RzBFRmMwS1RGQ2cvRDZZakc0bGRYOHNyQ1NsdnMwSm5W?=
 =?utf-8?Q?1hKENG0DSJ53oT/Ug6SWDsIGFO4Ou9ES5G?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78aa2570-5613-4741-e608-08d8bc7a2e90
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 13:00:22.7874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8SaRHKh4j3LauXJiXStW1QPY1vB8MEgKycpOi9IyvolBhwe38xy0WkerY/TTMayY1eNDHvG4rINc4VSfPDkwdfJ06FY6zHCz/Y7GjO/gJZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5064
X-OriginatorOrg: citrix.com

On 19/01/2021 12:45, Paul Durrant wrote:
>> -----Original Message-----
>> From: Andrew Cooper <andrew.cooper3@citrix.com>
>> Sent: 19 January 2021 12:28
>> To: Xen-devel <xen-devel@lists.xenproject.org>
>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Jan Beulich <JBeulich@suse.com>; Roger Pau Monné
>> <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; Paul Durrant <paul@xen.org>; Tamas K Lengyel
>> <tamas@tklengyel.com>
>> Subject: [PATCH v2] x86/mm: Short circuit damage from "fishy" ref/typecount failure
>>
>> This code has been copied in 3 places, but it is problematic.
>>
>> All cases will hit a BUG() later in domain teardown, when a the missing
>> type/count reference is underflowed.
>>
>> Don't complicated the logic by leaving a totally unqualified domain crash, and
>> a timebomb which will be triggered by the toolstack at a slightly later, and
>> seemingly unrelated, point.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Paul Durrant <paul@xen.org>
>> CC: Tamas K Lengyel <tamas@tklengyel.com>
>>
>> v2:
>>  * Reword the commit message.
>>  * Switch BUG() to BUG_ON() to further reduce code volume.
>> ---
>>  xen/arch/x86/hvm/ioreq.c     | 11 ++---------
>>  xen/arch/x86/hvm/vmx/vmx.c   | 11 ++---------
>>  xen/arch/x86/mm/mem_paging.c | 17 ++++-------------
>>  3 files changed, 8 insertions(+), 31 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
>> index 1cc27df87f..0c38cfa151 100644
>> --- a/xen/arch/x86/hvm/ioreq.c
>> +++ b/xen/arch/x86/hvm/ioreq.c
>> @@ -366,15 +366,8 @@ static int hvm_alloc_ioreq_mfn(struct hvm_ioreq_server *s, bool buf)
>>      if ( !page )
>>          return -ENOMEM;
>>
>> -    if ( !get_page_and_type(page, s->target, PGT_writable_page) )
>> -    {
>> -        /*
>> -         * The domain can't possibly know about this page yet, so failure
>> -         * here is a clear indication of something fishy going on.
>> -         */
>> -        domain_crash(s->emulator);
>> -        return -ENODATA;
>> -    }
>> +    /* Domain can't know about this page yet - something fishy going on. */
>> +    BUG_ON(!get_page_and_type(page, s->target, PGT_writable_page));
>>
>>      iorp->va = __map_domain_page_global(page);
>>      if ( !iorp->va )
>> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
>> index 2d4475ee3d..8e438cb781 100644
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -3042,15 +3042,8 @@ static int vmx_alloc_vlapic_mapping(struct domain *d)
>>      if ( !pg )
>>          return -ENOMEM;
>>
>> -    if ( !get_page_and_type(pg, d, PGT_writable_page) )
>> -    {
>> -        /*
>> -         * The domain can't possibly know about this page yet, so failure
>> -         * here is a clear indication of something fishy going on.
>> -         */
>> -        domain_crash(d);
>> -        return -ENODATA;
>> -    }
>> +    /* Domain can't know about this page yet - something fishy going on. */
>> +    BUG_ON(!get_page_and_type(page, s->target, PGT_writable_page));
> Does this compile?
>
> s/page/pg
> s/s->target/d
>
> ...and similar below is needed AFAICT.

Urgh no - missing the delta in my working tree.  Fixed both.

~Andrew

