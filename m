Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 834BF5AF6F5
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:37:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400066.641672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgFv-0001k8-RE; Tue, 06 Sep 2022 21:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400066.641672; Tue, 06 Sep 2022 21:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgFv-0001fk-Kw; Tue, 06 Sep 2022 21:37:15 +0000
Received: by outflank-mailman (input) for mailman id 400066;
 Tue, 06 Sep 2022 21:37:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVgFt-0000Cs-Dd
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:37:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2058.outbound.protection.outlook.com [40.107.21.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cf15d02-2ded-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 16:07:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB6383.eurprd04.prod.outlook.com (2603:10a6:803:11b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Tue, 6 Sep
 2022 14:07:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 14:07:19 +0000
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
X-Inumbo-ID: 3cf15d02-2ded-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2Mydo6mFl4YSH4geYRiIB+6IzNVsWosx7YsVjqSmrfuBLSgv35ZP1aiFeS1sGj9u1X3xQn33qOxSN9xixrEDnMewucadncaVzCzm37Z/5xG/1wdaMMOY/gznGspTAXLy5syBe2/46HVxhNYtk6ziIsUvNlVhmudSczZs6XFXlDVHiyFvZTVi4F+sBGPX/2Ey8/K0Y3/xRj71XQrs4yQBm1KLrm3HJBe/MmDfnvVeJZoNY+teAkC/Y5jyGTa2fHBd506IHzRwO333s7WqgJyF8m8bVo7FsIIqR7idYotEgkdQQ5dLSVMBEB610q4C/LrMF0FAbigdjV+hbXJ5DY5EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IsibSvCp7VNwwiXz4RMjfBGywk5CPpJX+sjS0XubjwA=;
 b=FKVLH80hWkxvdfjKBYDiXpN6LlDNSSQRxWKegj6uIZnI2GMwnTCVJ5d4/sZFz0kTsSF1JOZ6bwwKNej2T8Iyctli2tTro+yANC8hbESlkyRzQsVlXJXp9drUER/iirD9oGyuXpntHh0sU9RsOEY/mv3473oL7Tox6LAdlFINX38VG0rtI1NWqtGDnxQzl85Dm94iQUeQ5LOobxohVciBl2GM/8FqC9GSBVmj1VC7JUMar8l95Jt48zMGnDgaXzNWIpZ7bUuLKATE6+g8W98gqw1xj+xwnnOViBtm6Am5+56yET9QROuriufwZPKCJZFl/d7bvWt+IdXzdigkDEoM6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsibSvCp7VNwwiXz4RMjfBGywk5CPpJX+sjS0XubjwA=;
 b=CthVjGGAHayxla+N6JWhIGVp966rY0VsBFm73V5YCeVR2Ltrj5HfoByTum5ySNQursNrN1E4xDd7cegorOwK3Wh+dw6OJb0NyD1aYWWE5PhNAgcO1LL4f/GHN74AE01C4n28bxoGnEnGqobazvp5VpWJCOdtctPOErbqPb3IkFnY110mnTRiP9JMgHfgXpoDE9bqazZlX2cD0E8Vgt9OzXOmtC0BFq/ys7Zhs1AbR4mCiibxLkT2/HOzEbdITgPAzNe2GxDiDTrD3cxV5ASaRC7BMEz7sNgHStJ4j9RqDiF8dtOUI+/SGMhcuNmn9OJ09XTKzljVl3db1lheffbFGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9af0809d-ab7f-09d0-3fa4-5b73fb605fd6@suse.com>
Date: Tue, 6 Sep 2022 16:07:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2] x86/public: move XEN_ACPI_ in a new header
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <c869f79901968de2d71ab56e1bbb5d43048baf5d.1661420219.git.bertrand.marquis@arm.com>
 <7dbef184-7e55-51d7-27e1-93153b5f0bc9@suse.com>
 <AS8PR08MB7991B63FCB602B85E3E0618C92799@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB7991B63FCB602B85E3E0618C92799@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de1d297d-a96b-4525-f936-08da90111cc5
X-MS-TrafficTypeDiagnostic: VE1PR04MB6383:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N6y+v385j9B7jCtFaanAZ6xvsq2fwO4d40t+KvFIDmAmDZ3vd0IzEpLhLKbIvzL2KkAXUPPPv7R+gl7xLxlldpl2zHEgYCsfhKuvDAPcSbipi95I7F6kqM5a4DcC7F9197wXc/4bAET4/PjIlLw/bZpZexhuwiqk22DdiEMx9UfY62uuHvEJFlpCMIZDoKWui6q8dcYYOdEJaHtM/HCB2hwkmOXzISmYEmQdQPp6+fppQMIj7O8RvVCytH3RZIuq2B044feN0EelK5A/DsavSBzKGupH+W8gL3JBBUbEDZljtcheVp4Exszt9hfSlyys3T0acu9PVZKfqgjmx6iajf63eurR/Pu8c1iaHS9XYs7lksAjj6NkNkoZPQZgaVTJtaQCqTxxN5U+i6z+Q4Y8W3icf/05VDmVSE3Gjh7Gj+1feIQyKYzqliIJhQCAztEPv3nQIeOFA0oBxYQuT9SL2qqwWIjR1vAseoRR4NdA+mQxm8ZEOnR+jjfbiLUF/w+CEf9RoBFcJSPHIYR0SPmePN5WQBfB7uVfYFqkPzG5SGMjrXsWK7BhRDYa5kaITlRdNDVzg1RKcT5RiORXg9lmzwH8+vbPNJZPo7aOb+kfAX30Xq7gEn2eMX02oGZEcJ13Xjwq3vjFK8iNvmPthR51ryj1eDkyPaoX8WAQ5dirREiU1FhHUCn4aOjnsJgunBOkCbl8lqF0ZKoC+Vkf9xoI//w2wq3IhrgXCCt+q+l1LhQV+V8BpP/1hqYzZz1jsYeG1FLM1N7XnsJ2/vB6rsovq6egwRkiJit81qX+HABeKrg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(366004)(346002)(136003)(376002)(66556008)(31686004)(2906002)(41300700001)(31696002)(66946007)(86362001)(66476007)(5660300002)(8936002)(6916009)(54906003)(316002)(36756003)(8676002)(4326008)(26005)(6486002)(38100700002)(186003)(478600001)(6506007)(53546011)(6512007)(2616005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDREbjl4VGNqc0FYZkhud28yQ3NjemhMUnpFaVFQOTdGSVlBNWtMN3BSVk0z?=
 =?utf-8?B?di9wcXdDOU8rNElLM2M5Q0VYOHAweUpnN0QvU1EvM3A5V0NmcTQ3VnlERFdo?=
 =?utf-8?B?TkRHVU1SRkU1VzB5WHZUTURaUXN5UFNwRjRTV1BuMitUMHhhWmg3U29ud3Bk?=
 =?utf-8?B?RXdVSE1Rckc0SXk2ajFuNHpxK1c1Tkl6RTJNcTlFUHY0MTZtVGtKcDVORGhi?=
 =?utf-8?B?QkVhWTVySCt2K2FXbTZnaVNiOXpvRWJKa09FUVZxZXM5VFZBLzBkSlVoSkk0?=
 =?utf-8?B?dXpldmlYRVFSSnFWWkJIS3E0UHFTdDcwYzFvNFFEMzJRS3FFZWVsRExjT2gv?=
 =?utf-8?B?ZWZPSXEzVmlvS05oS0RzazRnaFZ0d25JZmp1WThoQ2dTd1JuZGZqc0xMYjBr?=
 =?utf-8?B?Ky9SVE43akx2RGZ3OTlrWkYrZFQyLzNnOXBwUGtWdXZVUitWcEE4MUYwTWs2?=
 =?utf-8?B?bk4wdkgxcm5STEh0YXl1eDhhVGdMMHFrbkQybDlpRDJYTWdWOVpiTnkxWXBD?=
 =?utf-8?B?Rysvb1ZmeGlYcngvOER0MmVQK3pwRm1vamFVdWRnejZtNDhZY0JsNHpPQVMw?=
 =?utf-8?B?TzdrZURCc3JuOWMzL1BVMng5TytUc092ZGZQbWRsZGRkdlFBSGZNUDhoZW0z?=
 =?utf-8?B?QU5ZcHlaYis0SklEYzRENjBZRFZTb2xkZC91YlFOLzVPL2RzK2lEeEN2WnpD?=
 =?utf-8?B?TjF1M1BUM2ZFZXBGdWlidDl6bjU1V3JrZlJ4QUtwRXJFMUpIdXNIMGxNRDVh?=
 =?utf-8?B?T3duM2gwMGdZY2JHL2ZGSXdvQ3ZXZ0RMN0lNTitobUNIb0t0SjY5TkNBVVkr?=
 =?utf-8?B?RGNuS3hJMlJEMU14MXJWNGl1dExVaEovS1pmS0FoaUlYZUV4WDlGbDVDSzlH?=
 =?utf-8?B?N3o5Y2JzK1ptOGpLc0pDak5ZYy9valZ1Ti92OXFlTFZaSktxeWhiTU45Tllw?=
 =?utf-8?B?UkUwVjhORGhJaWc4dkM4R1RUenh1VUVCSXdOa3BLSVZPVjZxeTU0NkJqem5K?=
 =?utf-8?B?aGsyeUM3dVZtMGx0ZXNBNzdvTG9vRE1mQU5FL3YvQ0h4UG5kLzhzWjlySjYw?=
 =?utf-8?B?K3h1cjNuUE9KeFlMcXJoWlZFRFZxQ2trd1JPdDRLck1sOTdWcWtEcUdId1Q4?=
 =?utf-8?B?a2lrbURDbGg5alhCeTdyZ3d0UVEwMUpTOXlPRkdPNUxIUkFSZlVZdnJqTjU3?=
 =?utf-8?B?R1cxVzJiK3pLdWlpMVp4cUF6M0dLWUJWWmxuYzNZcTdBbkV6VFkvWEt4SFNJ?=
 =?utf-8?B?RzRzbVB4RXpzakkyLzFGaVBqNTBaMzFZbUo4TThocmY2QmREQ3BEdCtXZ05o?=
 =?utf-8?B?NkZINHRZbXpLZmFBQURVL01mY1lhTGNXcXdIUDRWYjJEZ2JFdkNRcStkR2E4?=
 =?utf-8?B?bjh6T2JIVDhrbnVWWGZlUzhVK0pGSWJMbm1tTjBCTTFIei9rQUpOdVpnM3Za?=
 =?utf-8?B?RUNyUWg5b2Y2TENXQnlBMlZhOVdBZ0dQSEhQZXZweUVsK2VPclVFSXJ5TVpX?=
 =?utf-8?B?NmhkS2ZYTDVVMk9RV2pkbUNHUkhGbzVYbnYwcE1PRElIWERRdm5GMmx0a29r?=
 =?utf-8?B?Sml5TDN4NjFwNzduLzM4V3FDckFQU2xNM2pnTU00T2VsTXA1alB6R0pmZWkx?=
 =?utf-8?B?VnpqcGpHc2pCc1pud2JzS2NQb203aVdzZTBZTU04ZXRnRzlBajZYSjlUa1dE?=
 =?utf-8?B?TWtscS9HekJlMEN4NUdTSzExLzVxSUZnQ3lrbXltUVprMEtaUzc4MCtuRFlE?=
 =?utf-8?B?NzlHREN6blgrNXg0S0lNRWZacElySXZSZDJLVXNZZGt2WWpja1ZVckJMRC9i?=
 =?utf-8?B?L3BOZlVjakxXcmVZMmlKQjE2WHY3UnRoS2ZieWVUZU1SWlAveUE0MkZMU2RH?=
 =?utf-8?B?eGZHVUMxbWVqck1pN1RyMkFSMU96dkU1aXZ1aHJIOG1yOExyaDhuZWlmd3c2?=
 =?utf-8?B?THNJUUw4NXVjZU9mRFlUMURsS1FSSFBFMndxR0dIQlg0VXdzR3FLb2tTdk1i?=
 =?utf-8?B?bW1hVkZvcVhBTllZS0RmNXM3TVhFb2RPTmpkMlU4UmpXYktIUXladllkUmNH?=
 =?utf-8?B?cWFUN1RoV3YwN0J5L1czOU03dEpvcjQvcTlsZXV2NkVTeGZwZ1owMlBnZmRB?=
 =?utf-8?Q?8Z+9DfU1936zKAbweQxu6WxMb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de1d297d-a96b-4525-f936-08da90111cc5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 14:07:19.9020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: djdkx0TLDdoX6OfRI0tacIQSdIyhio73T+KiOhplgAgE50G50DOViUBwsp/2ejcNBhBGsjFi/UDqPj8roKXHHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6383

On 30.08.2022 02:52, Henry Wang wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Subject: Re: [PATCH v2] x86/public: move XEN_ACPI_ in a new header
>>
>> On 25.08.2022 11:48, Bertrand Marquis wrote:
>>> When Xen is compiled for x86 on an arm machine, libacpi build is failing
>>> due to a wrong include path:
>>> - arch-x86/xen.h includes xen.h
>>> - xen.h includes arch-arm.h (as __i386__ and __x86_64__ are not defined
>>> but arm ones are).
>>>
>>> To solve this issue move XEN_ACPI_ definitions in a new header
>>> guest-acpi.h that can be included cleanly by mk_dsdt.c.
>>> Inside this header, only protect the definitions using ifdef
>>> __XEN_TOOLS__ as the defines are not used anywhere in the hypervisor
>> and
>>> are not expected to be.
>>>
>>> Previous users needing any of the XEN_ACPI_ definitions will now need to
>>> include arch-x86/guest-acpi.h instead of arch-x86/xen.h
>>>
>>> Fixes: d6ac8e22c7c5 ("acpi/x86: define ACPI IO registers for PVH guests")
>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>>> For the release manager:
>>> - risk: very low, the definitions moved are only used in mk_dsdt and
>>> external users would just have to include the new header.
>>> - advantage: we can now compile xen for x86 on arm build machines
>>
>> I'll give it a little for Henry to possibly release-ack this, but since
>> strictly speaking this is a bug fix, I think it could also go in without
>> (as long as not actually objected to, of course).
> 
> Thanks for informing. Yeah definitely no problem from my side, so:
> 
> Acked-by: Henry Wang <Henry.Wang@arm.com> # For the 4.17 release

I've translated this to Release-acked-by: (as was used for earlier releases).

Jan

