Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7A766211D
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 10:12:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473440.734050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEoCn-0006Uz-Jr; Mon, 09 Jan 2023 09:12:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473440.734050; Mon, 09 Jan 2023 09:12:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEoCn-0006ST-G7; Mon, 09 Jan 2023 09:12:33 +0000
Received: by outflank-mailman (input) for mailman id 473440;
 Mon, 09 Jan 2023 09:12:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pEoCm-0005wZ-HX
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 09:12:32 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2052.outbound.protection.outlook.com [40.107.8.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be1d729d-8ffd-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 10:12:30 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8321.eurprd04.prod.outlook.com (2603:10a6:20b:3ed::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 09:12:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 09:12:28 +0000
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
X-Inumbo-ID: be1d729d-8ffd-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pbreo01RYKT1B/6AAl0X9Vg0gaD/l5PDs/zR0o1gvkZrIBQNm6I2jxU+WXmwJs8BHrlhAzs8K2ZXdBjnS7HM17u6Z7ocJyi0EkczE9m1nlRg3f1e6mJFqinZ3zHjxlN6TSbTPnRHhp/Ssk2MN86Vrct3lNUXMJvzEP5v1aH+7YY00ziPkeqYJbV+eElPgis60DVSM/QzRFbDRfIEy8sWj/dkDt4wJ8188buMM/cHrJSKn+lJLZl6xWzGGca5csOYRr9mNpEJ9qL8RqxUkBtAGW3j8txOlFVhC+ArOBtJkx2HRNxsGKoS7Jd/NODDPC7/hug+9+syHiWBBOqhxobcCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zltIqmOu9avvin4Lknq+ZL4sWOJEvhYdePJIffPVP0w=;
 b=gp5xerPkiY0IkV/+dzXIA/+IkhemAt/WGddun7+YZEoy+zd1XHm2wBvtYYF/pmKWRR2po0Y6k8SknIODwl4jsRfVua/2ZDPdjGHPzt/Eu8C1QQLJCrONMJ4cjqqgZAwa4I4NKLswzKv4RVRpyUKAVe6S6igf8410QtgQVj7V4iBx25JLosIwchPSN2MvRtpvyIEmHD7Rxvrn12DZztJVtoStDqYtqcBHVvsxevpvTqMlG1lJ+7jzBY/mY2vdzdjJltAAwFumv+CbNMaWOodt+VJblnp7z0lPIeo8Ql7F2tzLWn3JWD60xPPTffFWkHyqNW5F+UYQjoTTYqqo0UPKOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zltIqmOu9avvin4Lknq+ZL4sWOJEvhYdePJIffPVP0w=;
 b=AhCd43YETew4/jDGg1+tay8E0hhTfuVEMY52CzFH5NKmlPJ8L/CrgVCCyAcWKsymFEXcLlH41DggFGdYeLuP5Rz4QgeP50FaNwm5aQPzog385k3tZ6vgPR8Z2Aa+xFirMtDz8wvFRI0Du2EziaUJQ3HerqKumJCeJ9GH6I1eDQQGZJIhKXoxfYxO6voYkf+STbsLD/Ms46qeFaEhJ0IGzUKDM3lzsY0NsqY8vMmkTX57+MX15TKUkDTCtV7Q+2SXrUJn493drvci1PNbduI3KTS85tb4qn8JSJjguuYcahP0qI83ZXgIj4tyF4sS7o+lsVEmS2w0L07x1HhfjErErA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <50fe40ce-56d7-4184-7677-53bb1f1cbf22@suse.com>
Date: Mon, 9 Jan 2023 10:12:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 07/11] x86/shadow: L2H shadow type is PV32-only
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
 <2743393d-852d-b385-9eba-e22806b1c4af@suse.com>
 <a3b7631c-07e7-455b-3531-c33ce435521b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a3b7631c-07e7-455b-3531-c33ce435521b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: 47c39ab3-7ee9-4cae-9594-08daf221a14f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oExBowF7lkbTFfyXp1B72R/6rGJ5XyTz88lAjhVgqt1OGEKY3/Q6JA0WNFjeJfrJUnhPsdHi7bNE1+h5dTEhwyKt0H7yPak64M/n2QFtLi2hAsMx1IXWCxA3LiR6cnk+8Dda8aQrjcIA4b5It+zshYvAouRY/oymmr25c3TVMMullemoI5UJ252Vf84VuyiShEdqJuWWWkqnerr2nJc9FBbGEz23phMkZnVfS/rd+iReimL2Kq1AxyQRP2z+oBTJbvFQdQZTqBeMRN2bz+4j5CNoKqJ+ErUF2iyrngsWO1cCgHF9YhYTub6hqe0BWAIAtCejyQuEjK8lqhssWd2j869gRytmOR30zRkrU8p8d9oeZNnVdXEaYQap3JWMQgrnl8tb5y+lauOzrnsj+S9xk7WGupMO4Q5NNmzk2r1VhpAerS6kTkQF/6DSpaca1MXToQqneUCJY8MhGQeyVu7m9Q1PUQDY55HS5K3L1qbICdqZr81ViKcP033YTaFI4SYVEOzcAt8IrjAhD+YkiB0MnJPhCJWijAaflPlwwAnTthA4qw4ShAcGddd+4re6GlMkKHo8KUA5AoQyDH4LFF7NCiuDd8tfQy6BCA7Bpd3MNDOhkDScTaRMucSrbawFBZRqCLIZQfG5S4LZWw/45u/ZA1XxAj+vitWSrwXkzyfSBXhnnXth/Zt7s4Qeb+L6IrAsl8OX17g2Zuf087XZaZy1209aou0PcQgAZy+KnizUj34=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(346002)(136003)(396003)(39860400002)(451199015)(2906002)(83380400001)(54906003)(2616005)(66476007)(66556008)(5660300002)(66946007)(26005)(186003)(53546011)(36756003)(8936002)(6506007)(6512007)(478600001)(38100700002)(8676002)(41300700001)(31686004)(6486002)(86362001)(6916009)(4326008)(316002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzBaTVdVL1hRK3ZoSkxLTDNtenAxWjl3cjVQU2ZlUUZYbHR1eHlZaHJXRlAx?=
 =?utf-8?B?UisyQWFwUzlvUTExR3NoVGo1S1lWaGswdjF4MUZCTUYybFluMks5SmNmTzVy?=
 =?utf-8?B?NmNyMmZjZU5tajduSzRJSThlbGFTMFhVS1BlMFU0Yi9xOXFPZENOaVhDcjBT?=
 =?utf-8?B?cHRNOGVFMDljWUs2eWxnWTlkZkhZVDZ4VFJ3cGZoWjZ1UVpVZEtKb0pwNVI5?=
 =?utf-8?B?ZmUrVERuQnJEY3Fvekh0cG4wQjJaYUJOcGtURlA3ajdGMFJjQjI2bGRVY3Zo?=
 =?utf-8?B?S00wMGVrRDJiZytzdlVjT0wyQ2ZIdmJxRFUyNCtPWk1nQUlXbm8xSmxmY3ZJ?=
 =?utf-8?B?eXE2VmRGaEUxdXVuTFpsVUkyT2loK2tIYlVZK1RGZlpJTUlaRVhUNnBYWHZx?=
 =?utf-8?B?d2VDRUNYaXlRbTVMWTc4VVY5ejJNZVRPaGdLdHJVbldyZkZidXJuWW9SMkYx?=
 =?utf-8?B?aFROSlBhQ2RBb2JCY0R4c1Fhd1huVit2RlEwcnJWTzFnSkR1OEdPVWpadVFm?=
 =?utf-8?B?ZzR2bEtGWDFnd1FYTzVieGZnM2p2UnBLcy91Zk9lNzJad0tHaEt4NEdnVUFk?=
 =?utf-8?B?WVpnZmMwZ1Y1ZGZIK1h0dXhzTWJKeUh0ZVFLU2twRDdnSS9WTDNyYWd4TVpx?=
 =?utf-8?B?QWN3dkVoL1lXQlhObmRIZDZqenk2aDltZWRhREQzY2NMbXFYS0p2ZnJaQmhm?=
 =?utf-8?B?WVY0VDVuNVFrS2Z3UitKeml6Q0t5bVk1dFlpQTMwRFh3UWFRTlJORStGRXZx?=
 =?utf-8?B?MXhDeWJyZXgvUVMrdDd2bUMxUHR2NTUrZUlUWHJSNndZTlNZV1RoeWRmbThj?=
 =?utf-8?B?SVJFNXpUcGd3NW9QakxqZjFEa1lkZEJMeDQvRDVlN2RmZXYwdHJidCtXU1dL?=
 =?utf-8?B?SFlkakg1NExkR1ZvdTVzMHhJY2h3MmRxZkEzRmtGcndQeERCWVAvWVgrY2NU?=
 =?utf-8?B?RW8yOVR3ckhaeFkwNXFMNWNVbXNIVy9zS0hqcjltTytnMEJ3cisxTTk1SHJS?=
 =?utf-8?B?OEl6aUdBOW94U0ViSGlqNEVQQVZ4NCticXpJL0J2ZEdibHRSTlBiejlielBU?=
 =?utf-8?B?ZlY4QUhtdFNTZkd5S2FGZmpTUyt3WVg1dXp6cnZKYnp4azF1Y2hDQWJMSXhw?=
 =?utf-8?B?c2paRWFwU1k4S0k0UE45dS90eHdkdXZ5ZkQrYkVhUW93U3pLTXZIS3RPeEgy?=
 =?utf-8?B?VnFudG5QdmlHeVlkcjhMVFVtaGR3a2J4bWliaUVmcXdyVlJVL0RIRm56TFpl?=
 =?utf-8?B?MFZLbjEwLytCaTJ6QWlQQU41ZkRzd1NmdXlkeTU2RmZvZXRzZFdLd24yOXlu?=
 =?utf-8?B?Rjg1OXpvWHdPOWxseEFjbC9wYTFaR2JLVi9lRmRiUGUyUU41eklNbGZmemZu?=
 =?utf-8?B?Y2ZmTXp0VWNlK25sOTBoWFhMZ2ZHckQ5WFpqUDdKWkFubUs5V3Q5MG1yZm8r?=
 =?utf-8?B?WFQwc2dZbG1hSnVHM0RGb3BOYmcxRjBBRkExWTBnNWpXZ3dwdy8vTS81RGpV?=
 =?utf-8?B?S1JuRjVjdFJici94dGN6a2ViRXJKT2lZdzdaamxJcTcvK1M3MXdxN1hCSmJJ?=
 =?utf-8?B?TjhMb3l0Z3Q3Znp0RVY5VDVTUzNvSGM3bzRvVmJqeTNBWlQyU2hINWd3d3Js?=
 =?utf-8?B?S1NVN1hZVVp3NkJHdnlZVzM2VzVIbG5oR0EwVXhiMW93NkFidVNyYmZnVWFp?=
 =?utf-8?B?cUpoQ2xScUtaMW5XZWFyR3hTQ3ZiRFVIK3dpN3hkb1FRc1B6THh1K1JhSU13?=
 =?utf-8?B?bDk5TnprZzdnOEhPT2QxWW9aNjkzQUZORmpwcndML09zb1htbE9iOXpDYk9F?=
 =?utf-8?B?ck5DQzc1cXV0b1ZybCswZzZobHlMa1cxMlBjK1BCVVQwbURsOUljV2lpU2Ri?=
 =?utf-8?B?R1FNUkZoVUo5a3BISUFXV3NlczBLNGEvZytTdTdORzdoenFwbFRxN2NxNC9s?=
 =?utf-8?B?bzZKWVhZaUVVY3dHNmxCZnBoUlZMUTE3NG9PVFVzMDM3bTg5SWFjbDZxaDFR?=
 =?utf-8?B?a1psRTRBSWYzOWdxSUMrZWQ5RU04aUlCUXRnRkJuZXBmelhWOURyUlFjMWtz?=
 =?utf-8?B?dC9KQUh4U21VUFVrVTNCUUMyVCtJRzBML1BLK3M0Sm1GTmlQTDJvSWZYMjVI?=
 =?utf-8?Q?12XGZvdo/iJeoJRS0+bwVecjE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c39ab3-7ee9-4cae-9594-08daf221a14f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 09:12:28.1786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mk9kXQR+QIKXjj/mnalL+ehT36gcfeObZE3KVMFvwbMxQ+6uwMKOo9PJ+t0XYz67shrWsTJFUx7fk+1QAAQJBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8321

On 06.01.2023 02:31, Andrew Cooper wrote:
> On 05/01/2023 4:05 pm, Jan Beulich wrote:
>> Like for the various HVM-only types, save a little bit of code by suitably
>> "masking" this type out when !PV32.
> 
> add/remove: 0/1 grow/shrink: 2/4 up/down: 544/-922 (-378)
> Function                                     old     new   delta
> sh_map_and_validate_gl2e__guest_4            136     666    +530
> sh_destroy_shadow                            289     303     +14
> sh_clear_shadow_entry__guest_4               178     176      -2
> sh_validate_guest_entry                      521     472     -49
> sh_map_and_validate_gl2he__guest_4           136       2    -134
> sh_remove_shadows                           4757    4545    -212
> validate_gl2e                                525       -    -525
> Total: Before=3914702, After=3914324, chg -0.01%
> 
> Marginal...

Talk wasn't of only size, but also of what actually is being executed
for no gain e.g. in sh_remove_shadows(). I think "a little bit" is a
fair statement.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I wasn't really sure whether it would be worthwhile to also update the
>> "#else" part of shadow_size(). Doing so would be a little tricky, as the
>> type to return 0 for has no name right now; I'd need to move down the
>> #undef to allow for that. Thoughts?
> 
> This refers to the straight deletion from sh_type_to_size[] ?

Not really, no, but ...

> I was confused by that at first.  The shadow does have a size of 1.  Might
> 
> /*   [SH_type_l2h_64_shadow]  = 1,  PV32 only */
> 
> work better?  That leaves it clearly in there as a 1, but not needing
> any further ifdefary.

... I've made this adjustment anyway. I'd like to note though that such
commenting is being disliked by Misra.

The remark is rather about shadow_size() itself which already doesn't
return the "correct" size for all of the types when !HVM, utilizing that
the returned size is of no real interest for types which aren't used in
that case (and which then also don't really exist anymore as
"distinguishable" types). Plus the connection to assertions like this

    ASSERT(pages);

in shadow_alloc(): "pages" is the return value from shadow_size(), and
I think it wouldn't be bad to trigger for "dead" types, requiring the
function to return zero for this type despite it not becoming aliased to
SH_type_unused (i.e. unlike the types unavailable when !HVM).

Which makes me notice that with HVM=y shadow_size() would probably
better use array_access_nospec(). I'll add another patch for this.

>> --- a/xen/arch/x86/mm/shadow/multi.c
>> +++ b/xen/arch/x86/mm/shadow/multi.c
>> @@ -859,13 +866,12 @@ do {
>>      int _i;                                                                 \
>>      int _xen = !shadow_mode_external(_dom);                                 \
>>      shadow_l2e_t *_sp = map_domain_page((_sl2mfn));                         \
>> -    ASSERT(mfn_to_page(_sl2mfn)->u.sh.type == SH_type_l2_64_shadow ||\
>> -           mfn_to_page(_sl2mfn)->u.sh.type == SH_type_l2h_64_shadow);\
>> +    ASSERT_VALID_L2(mfn_to_page(_sl2mfn)->u.sh.type);                       \
>>      for ( _i = 0; _i < SHADOW_L2_PAGETABLE_ENTRIES; _i++ )                  \
>>      {                                                                       \
>>          if ( (!(_xen))                                                      \
>>               || !is_pv_32bit_domain(_dom)                                   \
>> -             || mfn_to_page(_sl2mfn)->u.sh.type != SH_type_l2h_64_shadow    \
>> +             || mfn_to_page(_sl2mfn)->u.sh.type == SH_type_l2_64_shadow     \
> 
> Isn't this redundant with the ASSERT_VALID_L2() now?

How would that be? ASSERT_VALID_L2(), when PV32=y allows for both l2 and
l2h, whereas here we strictly mean only l2. The sole reason for the change
is that the l2h constant simply doesn't exist anymore when !PV32.

> Per your other question, yes this desperately wants rearranging, but I
> would agree with it being another patch.
> 
> I did previously play at trying to simplify the PV pagetable loops in a
> similar way.  Code-gen wise, I think the L2 loops what to calculate an
> upper bound which is either 512, or compat_first_slot, while the L4
> loops what an "if(i == 256) i += 7; continue;" rather than having
> LFENCE-ing predicates on each iteration.

I'll see what I can do without getting distracted too much. (I also guess
you mean "i += 15".)

Jan

