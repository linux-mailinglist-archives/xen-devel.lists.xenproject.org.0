Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB52E60D141
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 18:05:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429970.681366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onMQD-0005q1-KC; Tue, 25 Oct 2022 16:04:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429970.681366; Tue, 25 Oct 2022 16:04:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onMQD-0005md-EL; Tue, 25 Oct 2022 16:04:57 +0000
Received: by outflank-mailman (input) for mailman id 429970;
 Tue, 25 Oct 2022 16:04:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1onMQB-0005NK-Or
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 16:04:55 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80050.outbound.protection.outlook.com [40.107.8.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3849277-547e-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 18:04:54 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8448.eurprd04.prod.outlook.com (2603:10a6:10:2bf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Tue, 25 Oct
 2022 16:04:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Tue, 25 Oct 2022
 16:04:51 +0000
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
X-Inumbo-ID: c3849277-547e-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebnVgbaHztPfCylTBZF4YUNsaFC653xSJDc7ddTw8O7P4qo2Op/RKzhP7jRr98wnJaMfKpukM6UXHtBeRMrQWm8zD1jA3IkoMiX7tcZSDyLSMS2hfh3Bg0nv5rC4G9mU1aImmwWlDpeUgiX5dmlnD46nR0AIzbZblgtiIkl3bkTcPWSOUqSAxykl4WYYnv1Sn9/Yv26a4s3HnUtlOQFJMe+jeekrN3zSj8QUX8GNVYiuyRS6Ve9Zbky9lQro//U9h2+gptxuwvePM73AsCKby2SczHxGWjV1UluHPbzgXADFoIceiNBHQFSGyARRwhB6CPVReiDHfivUfWMXDJ/Fog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FEXI0yMFe3oor7kXkJE7Q6mtVECp9cWIjTtiMKzsYQ=;
 b=ipj9ieBwHPmF0jyPDKY0pFfHuUkip/sOXX3RkZZIDUAIHlMuTuwuAQwZoCVfz+g5QwmJrSkkjgJ5uzwNwWE4QLZ1yLjpR0UTFwKLaQL2X2q27KU5bB8v8/FWYncp47Gh9ckE47/wg5yTXGJ0TTGM3uVp7tYEgDHoB3Km6q8O9I4d55fpWele42KzbTjgm5HGlhdDe5Y+G1c2yGc1V2lXg0IAtNDQyRTk9/d8aSgZU6K2dHrz9xQt5/xf1t6L0DgnPNtAk8QrG444w3KmaFxdPLz/yuE1H35icCwhPuLqScaIbtRITcPZ7GrsBkDihILD9DufZe+0XCdv4/bxwXKV+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FEXI0yMFe3oor7kXkJE7Q6mtVECp9cWIjTtiMKzsYQ=;
 b=Ga2YKw3TVSEXWrPdRx6bIRchFWM3UXB4ONbdN5D/qCaZwRsRJjbPLuZK/Wyyh5iKYJFhwtZ2Hs5AtDwxQWn2zOvgXp9mVlpvj9y+lU0eQzPYI6bE6SgyKY7aqyedl4A8l3wXtPu6nmLfcou7EZq1fTkQkGL1OE48ciXHXL+E/ieaOg5BDS/TE0C9Vn4Bo/nY6UOtOaj0kWZrVGTBUlnZxlOB6+DPDbwcidw1Z4VXp/Gxu+iWwYqxb183n5vbBa7jHlBPzi3XBgTScelrtGyXroBvEEt3KPkuWp3+sXskUZgXK6cm5KmSS4nS0u2Tt1n25fkrW0VLHTQUMKLdM+fpBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1780acb3-d297-edc6-3a1e-adf8b28a5262@suse.com>
Date: Tue, 25 Oct 2022 18:04:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] common: map_vcpu_info() wants to unshare the underlying
 page
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <b2382fad-e328-fb03-2860-cca93625f4bb@suse.com>
 <Y1gD7GmclguLZCM8@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y1gD7GmclguLZCM8@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: f79f7f76-23a2-4a2b-891f-08dab6a2a58d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	inzcGmeROUCkwN4pBKFmVYeBpFh7536h0kQmb+F5WWdCmAE2PN7sRxqbFYRAPBY1I7gDASf+W0qM391FKuiQr1x5x8Uj1Ot+P1gdDHcHdapd9HtzooItUR0y5e5fkjF7mkdtqCEaa0X09jeKke8pPC1ntffYrl/lTi9a7azQD/IGxh2Tb4uMku4u2KTZcNnH6t4hGkMbXZJPq6TzFc/IdOtuOkZ8UTWDZVMS4MR365eJBGXt9kjXI5xmadcF34pYPyYBjen0ByXSm/IHPzRGQVzl/Sfnqo9ZFexwm9gd09alNpGQqeT9j8SWMdaTnf72c0TZrRB96Y6KGXsga6u83E0CbU8SqgRyFUV69Q5+rxV6k69LJfm4+EtGReU77LkyMP6rglyJtfQtWtUULzjxYhu3wjiec5UXrHFGGpffwUoFLW5ok66glzRr0MppvyVFndZKztQYGYZn72nffylCVp/OyqBrBN7dspxIC+2T6vP1ap3AIqIh1AxJBdjyuGVuvKjpUXxG3YPTpcAT969HJ3dmhGkeKTFA6mPfZFbnmOkQapKlj2ow5B+FwbttRntKTuYK2Xn8EiV1V+571gpeOkKvrKEMTH0ccYkd0AEocNkd9mM1NakBJd1Qy+Sp3sawehYMSDFFR1WaKnDftt9Ss4Vow+fbP4yQmwuDzRpi0/fnndonrZEcnom5lJCtdC3xXMTtAkhmYzq7ylcnVWwBDCeRNju44NqEszsdhmtgmY+HaQoSuevGBzJS1l10TR9m5UsLrluR7D1XRayLcLO+aUGcVz9x9eBOMN/v7arpQZU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199015)(31686004)(36756003)(8676002)(38100700002)(8936002)(5660300002)(66476007)(6486002)(186003)(6506007)(31696002)(41300700001)(86362001)(2906002)(26005)(478600001)(54906003)(53546011)(316002)(6512007)(2616005)(6916009)(66946007)(66556008)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eCs0UUp1cUlCdmp4VkJoMHV4ejVrdkY3Z0krd1RkLzJ6N3VPTjEzYXpJMGx6?=
 =?utf-8?B?dXNZOXQvam5CaDJEK2RxNUVHK1RwTzdqWjNBekFFZTFuOUVsSmhYb1JEOTlr?=
 =?utf-8?B?NTZCdS9EUUI0cVVsdjhkTlZuMFJxc1FSTlJIZEtuT0JKUmw2VFFVTVZiNG91?=
 =?utf-8?B?a2FLMW5BL3dpcGIyMHBibFhneGtNOEpRSmNLVkV2NUtiSVU5R2JRdXlGTGp2?=
 =?utf-8?B?Rm51SDVsb1RRUHhQRmV0WHRGT2RDalFKNnBoM2xldzRuOEp6Q0ZBVnZzdXFo?=
 =?utf-8?B?VlEyRmdvR2hXY2VIWDdUNmVGbmI1bGVHaWdFeXFsSndRSW5ta3p3WXZ1Z2dG?=
 =?utf-8?B?dnEvdDBRcDIwYnVibktEbUo2QjVnVklIbnpXVU43dnZwWjJJRFZWOFdmQTBJ?=
 =?utf-8?B?L0p2OEJkMlB1d3dNeXJ3dUFyMFFKMUNrWXRLSy9hRUhNeDd6RTAxWEVTdEIv?=
 =?utf-8?B?U1VxYjdnMkR4NmczaCtKdDRrTEsyaFlaZjM0MUR1WUNBdHhtd1M5NzR4b3BZ?=
 =?utf-8?B?MDRvYXFSakM1b2pObjlzaEp1UFd2N24vWG9ITDdoVFRsMTljSi9ST3BUTEpk?=
 =?utf-8?B?VmR3SHhER1JjOVZnWDF4Z1dvSXNHZ3dtbEZuMnNFSVFwVFJXdGMwb2xTV200?=
 =?utf-8?B?cWF5cWppNVJ3VStYSUdHRnNDUkpMbUVYM2xRTWJ1RytsVlRwbHd4SjhVVmRx?=
 =?utf-8?B?SWQxejYwNTJwa3lEdEZXNWZJekpMaHQvdDNvbjhEL0laZmRCbThxdWJOV2VK?=
 =?utf-8?B?aDNUNVhOTTBaanRKRG1sUTVLWlVXM3IxdzM5U1FtRGdNN1dlMFZaaHVKUE0w?=
 =?utf-8?B?dEkzbTB0dEpKU0QwSHNXbUJuSENBaVpYMGc2SkNBeWdqSDNOSDNkWlFDWUMz?=
 =?utf-8?B?SjlJdVhIc0ZTUklrT2l6SFZiemczR1MrSjQxbTNwa29JVXU1c2R6Q01LMTVj?=
 =?utf-8?B?N3ZnaGZtMXAyN1hvMVUzamdHVzQxN2lxSXVSUjJIOFd6cTNuZk4vTHV5RHZt?=
 =?utf-8?B?TjR3MWZETUdNdzJXaThqL0VCKzVPUXZmZEZRbUFvOE5pQ0FXcmZaUi9HR0d3?=
 =?utf-8?B?NzROTklXZEY4NnRqbzBoOEZCWHVUSTV1QTRjRGhYME5QQmtpTGRPNlp4Y2pU?=
 =?utf-8?B?cHBDMEkzMUowa05KTkNtYWxFMXJXSXQyWk81dDVjNUVrSWxnT2gyM2ppRTBP?=
 =?utf-8?B?SmlPR3R3RDJYOG1vZ3A4NXZCUVVQQTg0Rk1adkh4eGFhNUxNLzhsRVI4Zm9N?=
 =?utf-8?B?ckZpVmpia0hlZGtWd0lPU2M4dkVoYWVDZDVVZnQ0RjJCTHBTMG14S0lVaGFV?=
 =?utf-8?B?cnlCZXQxK21WN0tqakxvcEQ0SUVJeFZ0Wnp6ZjlTeTAzbTJCTHM1UklkWFdl?=
 =?utf-8?B?bm9hQ0FXZ1V3WllLeUwxWU4vZG5lUnM5cUNsemd1ekJpVHhmZGlGdlo4WHpq?=
 =?utf-8?B?RVlpRG1hbTFaVjBXZ2FiZ013R3dNK1RjVm50aTAzVVhDMUpqWGwzMFlpUGlh?=
 =?utf-8?B?dlJnL2MxMjRHanFENWprMjU3MFFNczYyQUF6eG1CczVRZEx2QUcrMG9mc2Ez?=
 =?utf-8?B?OEFyWUQ4MHFNVloyaTFROFpabldGcmwxSWVnZHFSWUJtem80d3Y4azJPZXYv?=
 =?utf-8?B?ZTlqdTRVZm5xUEJ5bzF5OThNSDZTd3Jhc3ZxYVF6eDdLcXlpTUJxbTlDVXNC?=
 =?utf-8?B?Q09iVy84cUlPeGs5cE93Kzh2RmZjTTNOZjhhOE00cHpiY0x0ZXk3WjRrSjhY?=
 =?utf-8?B?bE9wbndtdWtiTWloME9nSzc3TVVFV2tvVndCOWVCS1FaUENndXFobGhFUmtr?=
 =?utf-8?B?dkV1UTVsYUpDczhVUE5jWENYRVdmYU4yZlRVRlNKUW5GR0pBSGhaVS9WdlRU?=
 =?utf-8?B?eDRGZTRicHd1cnQ3VkZMM3NSeFNtNEFBMjlTY0x2K21uMUY3dVRxN1RQenVI?=
 =?utf-8?B?WW8zcXdmcnBWbFNuV2lyQ3VjcWhkbDZQTUFPanI4UnJqNUg4TjVtQkdybWQ5?=
 =?utf-8?B?NzdXQ1JndTdPTWxicXRrL1hFaFdPQzRSZmJ5czFqRllhbjBLaUFVbmQ1dlZk?=
 =?utf-8?B?YkxabnZBbDB6QkZNMk5MZkQ2SGZodW9VWTZsNHZ2eG5LSlRqL2pwT3hCbFMr?=
 =?utf-8?Q?daqixem3VKnJTnoNQwcKUqqbM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f79f7f76-23a2-4a2b-891f-08dab6a2a58d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 16:04:50.9662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQcG8CW9DGQtSx2Njo6gukaGNgoQVtVVtPOaRilSKZL9ygjq3ettkAnXzgmNiW2m2gd2SL6bHU4rh2OovSrlwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8448

On 25.10.2022 17:42, Roger Pau Monné wrote:
> On Tue, Oct 11, 2022 at 10:48:38AM +0200, Jan Beulich wrote:
>> Not passing P2M_UNSHARE to get_page_from_gfn() means there won't even be
>> an attempt to unshare the referenced page, without any indication to the
>> caller (e.g. -EAGAIN). Note that guests have no direct control over
>> which of their pages are shared (or paged out), and hence they have no
>> way to make sure all on their own that the subsequent obtaining of a
>> writable type reference can actually succeed.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> ---
>> Really I wonder whether the function wouldn't better use
>> check_get_page_from_gfn() _and_ permit p2m_ram_rw only. Otoh the P2M
>> type is stale by the time it is being looked at, so all depends on the
>> subsequent obtaining of a writable type reference anyway ...
>>
>> A similar issue then apparently exists in guest_wrmsr_xen() when writing
>> the hypercall page. Interestingly there p2m_is_paging() is being checked
>> for (but shared pages aren't).
> 
> Doesn't guest_wrmsr_xen() also needs to use UNSHARE?

I think so (hence I did say "A similar issue then apparently exists ...").
With the one caveat that a page that was already initialized as a hypercall
one (and was shared afterwards) wouldn't need to be unshared.

> I wonder if it would be helpful to introduce some kind of helper so
> that all functions can use it, get_guest_writable_page() or similar.

Maybe. Using check_get_page_from_gfn() would already help, I guess.

>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -1484,7 +1484,7 @@ int map_vcpu_info(struct vcpu *v, unsign
>>      if ( (v != current) && !(v->pause_flags & VPF_down) )
>>          return -EINVAL;
>>  
>> -    page = get_page_from_gfn(d, gfn, NULL, P2M_ALLOC);
>> +    page = get_page_from_gfn(d, gfn, NULL, P2M_UNSHARE);
> 
> I had to go look up that P2M_UNSHARE implies P2M_ALLOC for the users
> of the parameter, it would be helpful to add a comment in p2m.h that
> UNSHARE implies ALLOC.

Same here, plus I needed to further figure out that the same implication
missing on Arm is okay merely because they ignore the respective argument.

Jan

