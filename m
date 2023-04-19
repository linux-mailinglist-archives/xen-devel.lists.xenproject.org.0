Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2226E7B66
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 15:59:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523509.813614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp8Ke-0000gr-6P; Wed, 19 Apr 2023 13:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523509.813614; Wed, 19 Apr 2023 13:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp8Ke-0000eL-3e; Wed, 19 Apr 2023 13:58:48 +0000
Received: by outflank-mailman (input) for mailman id 523509;
 Wed, 19 Apr 2023 13:58:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pp8Kd-0000eF-Cq
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 13:58:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2087.outbound.protection.outlook.com [40.107.7.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c54000f-deba-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 15:58:44 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7202.eurprd04.prod.outlook.com (2603:10a6:20b:1da::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 13:58:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 13:58:14 +0000
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
X-Inumbo-ID: 4c54000f-deba-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JvkVzzgEX40RyCYQC7DwySOsW9q4aCmN00JptROe8BO62uPeZQqYt+NceVf9NydLvqglHaDxb7VPwqMlVlPNslq3DeTwowJR64zT5O4NFHnHtiaUxXTX0ECCR9OcC7faRObF9rA/Po7Frsx0IK05iXLH0/wT/fC5cHiEJ3SAzomq+GZ5zRo89C+15baWp8qu73d2m3nukU6PIjWZiC/7EHs4ZjpqatbB+XtEI4VXMfgj+eF39sHVW6QIKpIoczIHvMfWkqg/Khl7fvvzi+8ULpBNiDO4siv5TmBfezdHwRrnvQzY3Hth1uPtAn8E365BEuh7W99pGBD+Y9yeoOTNSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXoozgBKkSgVlPp0MUaOUPD90sQ/DqpzpY6sdL+4jPE=;
 b=na6FG7zkh9CGwA9hZs3R9ZM1833xL5ieUxvvRWhJHKFpTWPZkbBmDtjQ4RJ13S6H3jQP3kbJROebO+Vxe3zJNPSvVrYQJ1Yre1birT2L95GCE9Php8wq80PgHaEkb4etnoHxxf00mO14U4UCg4AypqLI/2qolrp6zSN/JN0n7m96JvbuA12E6ZfG7XDctmiTMxOFx58pTSCEPajMQmOmoZ8jYX8ZLB45IXPHIZEjPA5OGLwWZ7ihdtREIzFro8z9aWN0uvX+XoT19WulgH8OQA+odnbZxRB1GVCsI7fu1OVhzW0MC26k4Z8CZ/UBb+rJjZ3LrRL+KKokEpwlGVV6gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXoozgBKkSgVlPp0MUaOUPD90sQ/DqpzpY6sdL+4jPE=;
 b=Ve50+zB42YxQipWJUzk+R5VWpL3dqWrCqx6pcrCfhjGboFpH1PbhpveZOHW/4lNyZrHWFqT0QrulO3ETwcIGC/+FnKBRQCOshpUf3iLNExc8unDb9MmDufBnbkP61kbL4K7DKhn+/JLvDGldDUxKLiXE3e1374/OS+hYNuTLN0ALztKAArGqL9mVJ3igNZNRdbHezrwnJXuq5XWkeS4ZepmobwNo8Wg1m/jUaLHH5P2qZ4wdMsQOvqFK5LV2TKrQnwpZBvVvyFmScYdKSvDnryQIxwdp5ovYhI1twrbjgpcwjY9LlKckTyUaDqPjTq608gYtXmnmSoWKKfsl09ek4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c736271f-96ad-dfdb-48ae-b8e9cc002d9b@suse.com>
Date: Wed, 19 Apr 2023 15:58:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v6] x86: detect CMOS aliasing on ports other than
 0x70/0x71
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <116bb94f-955c-4c46-f16a-d7a5e1cc72b5@suse.com>
 <ZD6AejXJxQxAyrx1@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZD6AejXJxQxAyrx1@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: 2012ae58-2304-409b-bdde-08db40de1e32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2uQwgkL+mGkqNA5WyEw/t/8uqU8989x7Cv9Bz5VDobRrEC2x6bwZwSnB9tAhyDJz4SsE6X7cGS9UXUM+gUqT/kk0J8KJu1pL7AKUubGRSr1EfUyu5Ugnudkj9nbMiQkG/a7KFeBDdcVhXIw1cL2lMX8azoMPKOh7IqlkEsQx1F6vwB5XAkzI/dAJY64FBM5JyR/lqhk2bmC6kU9k8lt+8yYkPvL8XysfwbsNdwfBrc1XuXaGVlj7gdyN13wS0NYOZ2PajKb8dAxK6rK+iv5i43FeDUwHDESdHquvha8X+ikX0Ss+9LucYfL20EW4uXt8Oi4Y8heoZYwD8GBFQRErXeXyuX6rfzOUGBz+zuFjMjAXpYeGA2cTTyY/pmx2SRzm2CnU5YFKOyG0gwzUJBpe30fftBe16CNvxdKO6saFLGiDQhRw6VpwNaqtMh9oAH0e3aD5vHH4iD7SFJ3+Tz62YXla2bXDn2sy3M+P0PyCcXE6oEtoFaAKptuMvPV2QZSnkN+SZj9n99v6H/rGiIJO4OFTmZLVvLFpGg25YIdR0JUjgRG3oQU4K+wzoXFaoUwJEjgQwUmwN9T65Djt741cLV3scobfak+KPG+29Ba1udMYWgP480tFcUzUozBi/4k4LJgog8eE3DOfEAn8rbwP9g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(136003)(346002)(39860400002)(366004)(451199021)(31696002)(66899021)(38100700002)(2906002)(31686004)(478600001)(6486002)(6666004)(2616005)(83380400001)(26005)(53546011)(6512007)(6506007)(86362001)(186003)(36756003)(41300700001)(316002)(5660300002)(8936002)(8676002)(54906003)(66946007)(66556008)(6916009)(4326008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzBDbDdtQWdpT09TelEzWENLSklDSDA0WktteW1YdGhzUGJnanRMdTEwcDRk?=
 =?utf-8?B?QUJnSDc0REF1Ym91bEtlN0JKRnVreTZvS0VyVnRCRUZ6U0JBZ0QzU3VMNG5J?=
 =?utf-8?B?YklLTXdxWnQxZm9vbEVBTFRFV0w2azB4Sm9IT3RrN1NJWGFwNVFESmlvZDRv?=
 =?utf-8?B?Q1k0VE55S2pEUUowczEvV2QvcmRJaGpONHlXd2RIZmJKbzF5Z29RUHV6YU9D?=
 =?utf-8?B?ckQ0Q0Q0Sk1wWFpyR01la2Y4K1RVS0hodjBvWDZEYXNWbnRpUXBDalA2YzBF?=
 =?utf-8?B?Z25HWGNVM0J1MWxMWWE5UStHSjNpNzVscHhwVWVPdEd1bTUyMnFTZlFKUm9w?=
 =?utf-8?B?V2EwTzNkVXdIcTRUK2dkNDNydXNBSlpjSXhrak1lUW5Ka3puREdFMEtIS2dw?=
 =?utf-8?B?aVZpQWpxdHcyRVNKbmVhZGtmaFhsdGk5Z281RHlZY2hrRGt5UHM3dTlhekda?=
 =?utf-8?B?ZEVTUitNa05HOVJ2RXJOblF1UXdZQVRoNUNLcmgwQ1hTWjNWWXVWdDUxZE5h?=
 =?utf-8?B?eHZkeVhDOXA3bCtCYnNraXVCelZpM3FNYTVOazdmbi9DT3pRb0NWQnBESlBH?=
 =?utf-8?B?WmltRU1XQ0lDVVl5VnVrdGFZcHhSVXZONDZvSEg1RTNtbVNUSWFsTWJSa2hN?=
 =?utf-8?B?TVZxemt0dWMwam13QlFjcytqU3VYbWxPdGVNcWZCOVhKcHArS0g3YVE1ZE9D?=
 =?utf-8?B?WCtaODUwalEvR3Y1Zms2US9sREZacTA3ZUowY2JnNDBJbi9Pd1FmVFdVVkty?=
 =?utf-8?B?UGVxNnRzOEtKVnFHT2R4aEdQS01jOW1nRlJjc3FLL2ZvUzY5SXhwVkdJY2Jw?=
 =?utf-8?B?R1ppM1lZSXBIalM5bTdVUnIydUtkRjFSNWdNOUNTWUZkbzE5elBibmVrOFI5?=
 =?utf-8?B?ZjN6aUhOVDIwVFM4amhZc2gvL2lyMVZqMGlrT1h3WnBYSVJRV0RjTFkzeDVi?=
 =?utf-8?B?c0RKTFFtNFRIYXROdE9lZHkyMlVUUThIMmpqWEVJbTVIdENTYVU5TnZycUVo?=
 =?utf-8?B?ZHFyWU5LcEMzSUhZdVgwdU8vRDhkRG90d2duZXJaTHdmb21ZUlFvMDhWQWgr?=
 =?utf-8?B?OENhOFBHeVh5V28ramlnbHJXbVNIVlZTb1ZGMVlrOGF6NXlwUDc1b0ErbDRC?=
 =?utf-8?B?bitOSHJTQ0pBKzhYMk1tTXBJTkd2YW5KVEFjWU9JK0ZQdW9nK0dtM1h6M3F0?=
 =?utf-8?B?WlNQOFVIM1F4VjVibC8weXM0RXo4YTZGQkNnYktVcjNlQ2FwWTRMRHVNRXll?=
 =?utf-8?B?YzBjdGNjbnRUaGZGNVBFbmJlVTlZalpoTSt4endnMEg5aEJuOGZTbjRTTkhw?=
 =?utf-8?B?SkRYc2M0Rk1QVUhyZmRKWEdsdmlUdFl1WjhwOGVPblVoVkJlSjFLTHFINGVB?=
 =?utf-8?B?dDdSbnZXSFZTUDhoQjNWYXh3enNibVhoQmFkOTJNQ1MyN21MSksrYi9qQlZ5?=
 =?utf-8?B?bWI0UlRiYkx0Uy9vQXVjcWJnTzdnSjNSa1JReUdXSTF1V1ZZSmtPclBpOGNu?=
 =?utf-8?B?MklhcysrOEFwQ3drMjdLM1Z2U3BOSnpJRnF3blJlMFN0ajNiZFlCanp6Y3BC?=
 =?utf-8?B?UkJTSjExckV2RGQ1Q1hWMHZVZzhya1RDdCtsT1BWUmdlZzRLZXRYYVZZazAw?=
 =?utf-8?B?d3BUOUIyaHdiempPbklFd3dGY0RreUU1dVNKRTQxVlo3amE5RmY0OUpubCtU?=
 =?utf-8?B?enpBblU3ZXhjMnh5WXZ6OFIxMXRhSm9Pd0RxL25VblBNM0R4OFRUbGl2NnF1?=
 =?utf-8?B?ZGVBbWlFdlFCZkp1WXdKUE5oUTV5TEJlRHBEV1YwRFVYUEd3czZETUtLSHJ0?=
 =?utf-8?B?NU1FQnR5U1JkeVFxcHNJNUFBb3RBeDdNbHJGTGFwcU80ZVFkUDJRVXR1U3B0?=
 =?utf-8?B?NUtLYm1rYzI2TUJPVDQrdWhIQ01vOVFpZmRrdHdRZDdsMldTQTNiakpzSjB3?=
 =?utf-8?B?NWxvUS9TZlU2d1QvVHBqWjUycmxKc1NCaS9JVzVXRkpCckZ0TG9PSGdYdGVJ?=
 =?utf-8?B?M3p6MW5kTjBmY29oMVBNazU0aGNmcExqZXJkdDVHd2JLNmh5cnpOTXlzOGlS?=
 =?utf-8?B?ZWUvc0s5bFFKcnFZdnFraXhyalB2SDZZbmFjM1NzNDJxem9TSkNKOHNZQjMr?=
 =?utf-8?Q?GEh4vXmFW0NVpoVsHlENetHDk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2012ae58-2304-409b-bdde-08db40de1e32
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 13:58:14.0161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GCW+hFpSNbLH+i5sOU85ebwWONI9SSB/SO5YhOJCeRosgtwTX6JnuxEu4KqXDTGR9ZLNDrnyuz1MxeEyPPbLmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7202

On 18.04.2023 13:35, Roger Pau Monné wrote:
> On Tue, Apr 18, 2023 at 11:24:19AM +0200, Jan Beulich wrote:
>> ... in order to also intercept Dom0 accesses through the alias ports.
>>
>> Also stop intercepting accesses to the CMOS ports if we won't ourselves
>> use the CMOS RTC, because of there being none.
>>
>> Note that rtc_init() deliberately uses 16 as the upper loop bound,
>> despite probe_cmos_alias() using 8: The higher bound is benign now, but
>> would save us touching the code (or, worse, missing to touch it) in case
>> the lower one was doubled.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Before committing I went back to read through doc and earlier comments,
in particular regarding the NMI disable. As a result I'm now inclined
to follow your earlier request and fold in the change below. Thoughts?

Jan

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1305,6 +1305,13 @@ bool is_cmos_port(unsigned int port, uns
 {
     unsigned int offs;
 
+    /*
+     * While not really CMOS-related, port 0x70 always needs intercepting
+     * to deal with the NMI disable bit.
+     */
+    if ( port <= RTC_PORT(0) && port + bytes > RTC_PORT(0) )
+        return true;
+
     if ( !is_hardware_domain(d) )
         return port <= RTC_PORT(1) && port + bytes > RTC_PORT(0);
 
@@ -1342,6 +1349,17 @@ unsigned int rtc_guest_read(unsigned int
          * underlying hardware would permit doing so.
          */
         data = currd->arch.cmos_idx & (0xff >> (port == RTC_PORT(0)));
+
+        /*
+         * When there's (supposedly) no RTC/CMOS, we don't intercept the other
+         * ports. While reading the index register isn't normally possible,
+         * play safe and return back whatever can be read (just in case a value
+         * written through an alias would be attempted to be read back here).
+         */
+        if ( port == RTC_PORT(0) &&
+             (acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC) &&
+             ioports_access_permitted(currd, port, port) )
+            data = inb(port) & 0x7f;
         break;
 
     case RTC_PORT(1):
@@ -1378,6 +1396,16 @@ void rtc_guest_write(unsigned int port,
          * ports.
          */
         currd->arch.cmos_idx = data & (0xff >> (port == RTC_PORT(0)));
+
+        /*
+         * When there's (supposedly) no RTC/CMOS, we don't intercept the other
+         * ports. Therefore the port write, with the NMI disable bit zapped,
+         * needs carrying out right away.
+         */
+        if ( port == RTC_PORT(0) &&
+             (acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC) &&
+             ioports_access_permitted(currd, port, port) )
+            outb(data & 0x7f, port);
         break;
 
     case RTC_PORT(1):



