Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEBD4876A5
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jan 2022 12:40:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254394.436208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5naT-0004f5-NI; Fri, 07 Jan 2022 11:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254394.436208; Fri, 07 Jan 2022 11:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5naT-0004c7-Ia; Fri, 07 Jan 2022 11:39:13 +0000
Received: by outflank-mailman (input) for mailman id 254394;
 Fri, 07 Jan 2022 11:39:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X4Ee=RX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n5naS-0004c1-0h
 for xen-devel@lists.xenproject.org; Fri, 07 Jan 2022 11:39:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6dbaf948-6fae-11ec-9ce5-af14b9085ebd;
 Fri, 07 Jan 2022 12:39:10 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-ZDGaYLUxM5aDaVBMJRwLHQ-1; Fri, 07 Jan 2022 12:39:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6479.eurprd04.prod.outlook.com (2603:10a6:803:11c::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Fri, 7 Jan
 2022 11:39:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.017; Fri, 7 Jan 2022
 11:39:07 +0000
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
X-Inumbo-ID: 6dbaf948-6fae-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641555549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M1zjI04GaNM4Mrwch5EF57OuPazFIFaAQ0/DuVxq9p8=;
	b=BaFimHSDuGjTIpXeeXXaOYZwjrf/+XRZZQgMflIYmsNnJSAX1B4sDMiVua/vlcBbzn9eoW
	YEY69ZGuf2gcppBW5BcKoqhI17k4rQhqP748iFVXCikxM7ISLaDHQh1uVVjAA0eTdTsqA3
	lb4D8V62tXu/MWUoS08KJ4Lf51QBaws=
X-MC-Unique: ZDGaYLUxM5aDaVBMJRwLHQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EF0lzXNugcM4ZRROG8bToeEfSS7TlQ7CToCxK6rfOhXJQe1Cep+I7bJmYFl6ojS1466utE+GzS64PsmJJ3NWIkIxX+Ftax+C6Z+2zd16b06IRsJ9XLjac+S1XPV4feZFdoUCk+gY3oY8sDwxGcj1gF8hONcPg7dRboC4+wIEVJPZ19ydic8WfoPIXCqB/JmbZHmwptiCPokXLnNRuNaN+KIEoP6z6rAzJhg62L1MdPJFV3uXXGR2hHfMfGPRxekPPmm7T+gXidCbuTo/mqriCs5JAchWCSMpqUoU3wWYTuUD6DBTRV4IlPaN54hkTQsHLcgoPbUydR47QMSl6njM4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xH358gyXzX8lozl4zMBj0IKdgwO2qbrmtnYPx4puQX0=;
 b=ggZsdx9XH3lOUNYHnm8VIYG8NfVhZc14ohbKX6fPQ9IuyqdVsMNRuQ+Oq6uqdQmCaBnIaFsJM2hWBcnWwsZrURXbeHHUNNyHcfNiLc10YrpVvqZcGGAOqYNgms4B7HruxKIt4qBobUtAdN/ozEFSABcuWbLjEPqduowC6KNOC0+zvGnVCd1oGbI5S6nlikYuuvBOgQ0XWPfg4/iYitOmx7/1Dx/aTnu7Yay/UhtQmqqiT5dY8u4Nrd3L5Vyl7VwebmrQXACHmdzsVgfppqlEte4Eq5ZKZ6cQ43Mr6LPSBjTcJzR4CbtKgTrqFuxfgyvPRXghpexhkAe73SgOu/hP4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <78540c18-c54e-07e8-c099-d7bfd29bea91@suse.com>
Date: Fri, 7 Jan 2022 12:39:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: xen 4.14.3 incorrect (~3x) cpu frequency reported
Content-Language: en-US
To: James Dingwall <james-xen@dingwall.me.uk>
CC: alexander.rossa@ncr.com, xen-devel@lists.xenproject.org
References: <20210721092958.GA2502468@dingwall.me.uk>
 <c9c6778d-9823-4b07-fb48-604acef1f3de@suse.com>
 <20210726123332.GA3844057@dingwall.me.uk>
 <06be7360-0235-3773-b833-3e0d65512092@suse.com>
 <20211105152501.GA485838@dingwall.me.uk>
 <20220106150809.GA856484@dingwall.me.uk>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220106150809.GA856484@dingwall.me.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR08CA0021.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c60fd961-4956-4609-c3f7-08d9d1d2508c
X-MS-TrafficTypeDiagnostic: VE1PR04MB6479:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB64795E43984CB769295C4135B34D9@VE1PR04MB6479.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fES68r+mzOlF21JtdAnjsaAEaXR9xZWO+txBVVIGeR3j68Yz3ffL/ki4SoYskOvmouU0vP8ob3OZg6HMS/N8cQkAfYCFG3mZajN1Scg4+TZIyp5fgmeMI4/kKwq/4xDaVWi+4dlbB2wSFzH+pfZBZRUljC/YArof4vJGP6Xd1eG+d/MZesnEvodAnxNPhmC96yTzgyh9XIVMzPPwA0OtYiDit/GvhWuqL8v3CAGEVtpmbL3wtoW//TZVGAa2dKBvc0wrKIwDXtu02YPEsPV2iPLKSm+/Iw7MK78y274lsijxWMFcXP2j+L0UxMSwTbmtFhb6q8d6AG5RM0s38YFKcA14P2EqDT20/6rQ5XbP3br0KUD0zRHS+hOZLorOMz/FJYbfudXuGeoLD2msZ356kC+a0+YdV90vpfrhHwt2+S4rjKq8DuyOQLKcgUB5rpNUGDtd/q4cr18zQWCwkKpWlsUx1SZcqZI5CByFVo4UmkOFD9knC+aftwzJ3+2EMpMW8EL3rEk2K4od8cq+KSuc1aTm9NGasUJ6SQjv4kipZbCYfiDpRu0ABPHCxKvxWSzfiq1MNXVLxjhEw3kB6LTrVR7mZJNWP/prdVc6JtIq3Q/thAphZn0T0Garurt9jZNRkjPVRamIVb/kqJlOHyDxlQGaIu2L0oUDpY5dkpyxQ6yx6J3+R6zmEWEcaZ/XC5dYtUh8s2JBemQvx6tceWlqVcdKpuyC0lI1Qp0ehod2fFI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(2906002)(6486002)(66946007)(66556008)(53546011)(66476007)(31696002)(508600001)(86362001)(31686004)(36756003)(6916009)(83380400001)(38100700002)(6666004)(316002)(4326008)(2616005)(6512007)(186003)(26005)(8676002)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VSGZaUhbvMl06qHfWrqsBpp98RSXJSh8QIKImem+OEipB+rF7tioAYkeiKEe?=
 =?us-ascii?Q?bW6RXMji2rLAENr0odTGiULhvND84hmsQ8N5KzxdbjOm4cqb2E93+CB8rwTj?=
 =?us-ascii?Q?yhIY5aXmf8UZSmBPntCNs84SlO4lYcjyCbcjv86yokseuYv/WqmO+en+OAsR?=
 =?us-ascii?Q?wDpAdsJWBBJTtJXgRl5OFPLyt1TfVHAu81w9wXCHkmidBmKdVUHfA9g2D5sC?=
 =?us-ascii?Q?vjbUryPS7t2aDnyv1xcjwCAZb4yMITr1yyyKqsWFWqQuWTeD3f20W8oXJoGD?=
 =?us-ascii?Q?2s7iHZO21I03zVXUMofVNXtICSw3taOamK2MKcMCsJQTry28AgcAjGw13+kU?=
 =?us-ascii?Q?lDiD6+AVyugHUcSfC04ZOmbK9GCK7yNf+ovFwgtzifYldXMHFWngjlx9y6rT?=
 =?us-ascii?Q?Qp+DmfeUPcZKNxR0DxTAHU8dqMgbrKlfu28pmPk0CZTyF2r/WbjK/8TxvEfd?=
 =?us-ascii?Q?0Ti1/8d8UAkoxJ/L2ZrNHw6c4ZFroDPGfdVWCAds6GQCAtAKMzPXCoI0SO7k?=
 =?us-ascii?Q?VbjJYdxU3U+Ib4SKSr6TU9e3Hc36FHMbCy0ZXqwdCTZQ6+V5cutETnyqyZRN?=
 =?us-ascii?Q?tdeB9qDGcn3IIPHQDqPNMoaeAxSwsQPx4GDtDRNI7BL4wljP+BgIZDTfGQUp?=
 =?us-ascii?Q?1NLTZUzOPJxW35/8mYY9gmF1cOceoZcR22yDN+dYLI15gGMRKg05eZous/+0?=
 =?us-ascii?Q?sLUDVLoqkqdkkcb1wzD3hklQRYYjl1fdE/rgNkPM7KMlDbvPLMIiIAwf03Tu?=
 =?us-ascii?Q?Kzazxc4PyO+jh1LmfZIUUy78zKGm9R5OPfw3F2lIaYzTE1AgHjKwbptXpOdc?=
 =?us-ascii?Q?JiCjH+iVbYeB2U682zxGHlEiPJf92z1XdADA8rn94D7Oac1yUB+YloZ1r0Ex?=
 =?us-ascii?Q?ARWZheqVI/Tq+UyN3ZJCMCOHuhoXlcAQGrFQkxkkGLynCu1W/CagKqfIR/tg?=
 =?us-ascii?Q?7N3Hd0mak+e5MNCCGNPQUMDwVn3AkO/BbWgOuSleJO/k+J3GxSC3XQI7rG/o?=
 =?us-ascii?Q?Pr1xf3YF8SyPjk95piOWOsU/2ojagd/9PL1fI+BsKu3aaO4x7sidl1TnkisT?=
 =?us-ascii?Q?0D605HyUrD9e1FLwBExqfUaBa2QZ5x+MEtn4Myt6Ytwvx/ceOWRJP4vuzigV?=
 =?us-ascii?Q?TKVIT66I2vi7gBV8i2EF1wyC3EogwRpq9JTmlvGfV1d/Ht8Kkb7zhIW+yCSu?=
 =?us-ascii?Q?rc1cRyDFW2HCaFwfQHxnx2CB2Gn889TX+TdBaQzz2PaANrZvPT+Le4ojO8GE?=
 =?us-ascii?Q?JHDBBJDvPl+pfrOR/Snjz82h6oLwQO/bb1JVyaBTX8bZiTwpcukMSJJwr7DL?=
 =?us-ascii?Q?Gxlh0cqrewxhVSjyO23t+BV80WeiEqbIE6R0KJO9D66PO3ja+p/oS3xSPaV1?=
 =?us-ascii?Q?Pw7/zc115PShP4QXk/yNNIeOi1+7Yx2r11+f8mx1l4AnbwdgUQWKIXxQFUMy?=
 =?us-ascii?Q?ASnbP4HH5LYK2BJMkldM38jM6PeoYwATqZi5Qw8S370ZJD3Zzm3DmHzQ0mdv?=
 =?us-ascii?Q?tDQ6T+S1maUMTcOUCmoj4rCdrkWBW8l6XuevJ+CvMxBtuwZZrvCxKMeNRfjS?=
 =?us-ascii?Q?OsBrtp8VOvx1oFZGKhJ8c2AUJ4+1Ol1PC7gawmgJsj77kg/h3K9rrjKXfZyz?=
 =?us-ascii?Q?c/Bp5LE9ELDKet8oQQIpwm4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c60fd961-4956-4609-c3f7-08d9d1d2508c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 11:39:07.6764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gy5xTqXXnIO/w0HyzyP3gAhMe/lVMNgN/bxIgcuhBdkttLe8O2f4TDKJii//1TMGDDYNuuoHqQOhvmvTXpS4vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6479

On 06.01.2022 16:08, James Dingwall wrote:
>>> On Wed, Jul 21, 2021 at 12:59:11PM +0200, Jan Beulich wrote:           =
                                                                =20
>>>> On 21.07.2021 11:29, James Dingwall wrote:                            =
                                                                =20
>>>>> We have a system which intermittently starts up and reports an incorr=
ect cpu frequency:                                              =20
> ...
>>> I'm sorry to ask, but have you got around to actually doing that? Or
>>> else is resolving this no longer of interest?
>=20
> We have experienced an occurence of this issue on 4.14.3 with 'loglvl=3Da=
ll'
> present on the xen command line.  I have attached the 'xl dmesg' output f=
or
> the fast MHz boot, the diff from the normal case is small so I've not add=
ed
> that log separately:
>=20
> --- normal-mhz/xl-dmesg.txt     2022-01-06 14:13:47.231465234 +0000
> +++ funny-mhz/xl-dmesg.txt      2022-01-06 13:45:43.825148510 +0000
> @@ -211,7 +211,7 @@
>  (XEN)  cap enforcement granularity: 10ms
>  (XEN) load tracking window length 1073741824 ns
>  (XEN) Platform timer is 24.000MHz HPET
> -(XEN) Detected 2294.639 MHz processor.
> +(XEN) Detected 7623.412 MHz processor.
>  (XEN) EFI memory map:
>  (XEN)  0000000000000-0000000007fff type=3D3 attr=3D000000000000000f
>  (XEN)  0000000008000-000000003cfff type=3D7 attr=3D000000000000000f

Below is a patch (suitably adjusted for 4.14.3) which I would hope can
take care of the issue (assuming my vague guess on the reasons wasn't
entirely off). It has some debugging code intentionally left in, and
it's also not complete yet (other timer code needing similar
adjustment). Given the improvements I've observed independent of your
issue, I may not wait with submission until getting feedback from you,
since - aiui - it may take some time for you to actually run into a
case where the change would actually make an observable difference.

Jan

x86: improve TSC / CPU freq calibration accuracy

While the problem report was for extreme errors, even smaller ones would
better be avoided: The calculated period to run calibration loops over
can (and usually will) be shorter than the actual time elapsed between
first and last platform timer and TSC reads. Adjust values returned from
the init functions accordingly.

On a Skylake system I've tested this on accuracy (using HPET) went from
detecting in some cases more than 220kHz too high a value to about
=C2=B11kHz. On other systems the original error range was much smaller, wit=
h
less (in some cases only very little) improvement.

Reported-by: James Dingwall <james-xen@dingwall.me.uk>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: Do we think we need to guard against the bizarre case of
     "target + count" overflowing (i.e. wrapping)?
TBD: Accuracy could be slightly further improved by using a (to be
     introduced) rounding variant of muldiv64().
TBD: I'm not entirely sure how useful the conditionals are - there
     shouldn't be any inaccuracies from the division when count equals
     target (upon entry to the conditionals), as then the divisor is
     what the original value was just multiplied by.

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -378,8 +378,9 @@ static u64 read_hpet_count(void)
=20
 static int64_t __init init_hpet(struct platform_timesource *pts)
 {
-    uint64_t hpet_rate, start;
+    uint64_t hpet_rate, start, expired;
     uint32_t count, target;
+unsigned int i;//temp
=20
     if ( hpet_address && strcmp(opt_clocksource, pts->id) &&
          cpuidle_using_deep_cstate() )
@@ -415,16 +416,35 @@ static int64_t __init init_hpet(struct p
=20
     pts->frequency =3D hpet_rate;
=20
+for(i =3D 0; i < 16; ++i) {//temp
     count =3D hpet_read32(HPET_COUNTER);
     start =3D rdtsc_ordered();
     target =3D count + CALIBRATE_VALUE(hpet_rate);
     if ( target < count )
         while ( hpet_read32(HPET_COUNTER) >=3D count )
             continue;
-    while ( hpet_read32(HPET_COUNTER) < target )
+    while ( (count =3D hpet_read32(HPET_COUNTER)) < target )
         continue;
=20
-    return (rdtsc_ordered() - start) * CALIBRATE_FRAC;
+    expired =3D rdtsc_ordered() - start;
+
+    if ( likely(count > target) )
+    {
+        /*
+         * A (perhaps significant) delay before the last HPET read above (=
e.g.
+         * due to a SMI or NMI) can lead to (perhaps severe) inaccuracy if=
 not
+         * accounting for the time expired past the originally calculated =
end
+         * of the calibration period.
+         */
+printk("%lu -> ", expired * CALIBRATE_FRAC);//temp
+        count -=3D target;
+        target =3D CALIBRATE_VALUE(hpet_rate);
+        expired =3D muldiv64(expired, target, target + count);
+printk("%lu (%3u,%u)\n", expired * CALIBRATE_FRAC, count, target);//temp
+    }
+}
+
+    return expired * CALIBRATE_FRAC;
 }
=20
 static void resume_hpet(struct platform_timesource *pts)


