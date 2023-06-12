Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF1872C0D4
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 12:54:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546999.854153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8fBx-00061I-JW; Mon, 12 Jun 2023 10:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546999.854153; Mon, 12 Jun 2023 10:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8fBx-0005z1-GI; Mon, 12 Jun 2023 10:54:33 +0000
Received: by outflank-mailman (input) for mailman id 546999;
 Mon, 12 Jun 2023 10:54:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cme/=CA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8fBw-0005yr-CE
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 10:54:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 822653e2-090f-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 12:54:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8265.eurprd04.prod.outlook.com (2603:10a6:10:24f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Mon, 12 Jun
 2023 10:54:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Mon, 12 Jun 2023
 10:54:28 +0000
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
X-Inumbo-ID: 822653e2-090f-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmkudCXnqUSdNV1oow6HsfKb8kVJSCP/PVl0b8cHzIp1pxYYvkPYE93RYrcuaqW6zZx2nLZvo3pNijyNSqJ5jnbMlW7zvYVFzEJpGCqs0vFU9go41cWKQipIgzNFwGNxrtru4Kmi4G18vM3mDTmOOkylfLUPZRgdcJwYAKWatGsPIT6sRhVfOyV15TwkYWjhEhjK/U3YE0sKsUt6CbdPM4UPlCPjpTKUJixOPPQSFpxEKGJTRlbKnttpCfFECmM1tAoDRnoppEvh/jCI6Xq+FseqkVlebDniRq7WAxvKJx68KsOkYJLpHw0PglKIjZanZhFGuIlJhUhqD3F0LDgtnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jm9gLQLuVaj5UWJ70SJbkW9YAKVsO0ndI4ArXyURKs=;
 b=nsG4NsL+auZo+TG/V+0CF1YrfunId8rvtG9NdlwjepntEXa51DLaP/arSJgNaK+6tIw17QPePZlYl+108kJuClpSOVdp4NxSRrmO9IRUgIYcd2MJpU9hXZ5pVf2hdSshdUtl4glw++YF/BcBf+Tqf8UxOP37EqCqRnXDOQLj3sKrGBcNMPFPWSr+ssddtpGyN5e+h8YsXd1LIDUucGBVSZjmrUkBfzSsm2dVjBMBWoy0dg5L4n8F3AWZoNIL58XxWVfZg4XectswfEL8LUX72cGSkdBsFCFoYANwHRrs3WsQd9yXWrGAqazndnd/PqQti3j4N7wklRKlmhTt9US+Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jm9gLQLuVaj5UWJ70SJbkW9YAKVsO0ndI4ArXyURKs=;
 b=KCqdrte9eMC54XBKDUS+vY803XKIVOSjLrO1u5d41FTaTafMrPReObNsz2FV3Dp7r/ifP9ysNLHMEBRwkkaeJXtEssCmTf3n9M7camIucVKg/goEYjNadEipCZ+RjePJI91bPCrMJKU/CvFy1z2W2nn4KkJK2C6W/4EtSwBa91247ytYB3Bjg+bddQ9XchGO1dUUEoeeC38xHp56GG/rNjVbYsGT8UW+ORLlN/GrfGIlopDHfYvqjHi/1rhGtqkp0ljVwAGgMuNDIS0f6KZtc6Qoxhd9xQYBdD0dATRlvThxGBP3lIBiI06na7jMIY4lIsO8Ae52Z2/5R/51EK0puw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <59b7b181-9f31-c3b0-e54f-b5f22b08572a@suse.com>
Date: Mon, 12 Jun 2023 12:54:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: New Defects reported by Coverity Scan for XenProject
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <64859cf3a1e46_712752abb10eab98834b9@prd-scan-dashboard-0.mail>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <64859cf3a1e46_712752abb10eab98834b9@prd-scan-dashboard-0.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8265:EE_
X-MS-Office365-Filtering-Correlation-Id: c29c7faf-f28a-4605-2663-08db6b3364ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5Sr6soanLxLnUcOyXlelfnKnRchssyrTn9zlYpzG7zG2ONHQw66c7Uwz81+8HY8k76EVdZN8Go/FOLcsHJ0cpiyRVY4Vf0RxmQToAbisy3QMHKHHuP6RXs459McrAI27Xf6JBJRZxOJpGFmAPuMbWBYMS10v4a4kxhhzJrxZLh9xCVYk4Vldb3aRemWn678Z/eANA+kRpa9IasD4tLGmsgc/ytDKe6YiB2+MJXwPxYTsgTG6aAkTAwOf5QYAkHxlFJMxzc9HeCSvx9JetZZ9CFWqn4FmZ+Y1B5BTihqJQmKWRPZpSIkGe4Ec5fBLj0FbzgS/EwW36v28f9pZYB2TzqauBMiE7MrQAq3jbyfS15K7pu7HV+wwtSZKQOhroYPa4NlJ11A77ZlGUX8+h/evMRNGkY0ASs+9n/h19+YZpfhFEPXMtIILSLhndp+oypI1g9A8GVsP3nGhJP1T1CokiPlNE0XG639Z4VG3rke3N/wt0NxIa5zWhas5qdizHiWsliNi4zitCEZ/WuylOa27b+kvw1eydokQouPSZMIbbVjb5PtQP9NzRVRo6tB5bj4rycgdiBJAL/sc0KpsO91lFmRLu2/VOtpevHoHq6w1F+l2au+xM8kpJduXrnG4WQFWbZGkrp3Qgp7ZERApzRjC3g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(376002)(39860400002)(346002)(136003)(451199021)(6486002)(83380400001)(36756003)(2616005)(38100700002)(31696002)(86362001)(6506007)(6512007)(53546011)(26005)(186003)(2906002)(5660300002)(8676002)(8936002)(316002)(41300700001)(31686004)(6916009)(66946007)(66556008)(66476007)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWlPSkZ6K0QxRWZwRWF1MTFsb216K2NzSFlkOTc0eVhrOEZXM2NScG5vbE4r?=
 =?utf-8?B?M1FJaWVwWkx0UnUxTGt0ajJoeVE4WGVEYURoUWNpNll4RCtzMk44YUd1T01B?=
 =?utf-8?B?R2tkYmc3bVlscDRrVTIzbUpKZEJHMDIrUkEvRFY0RXA5ajlVSlBwdHhIb1gz?=
 =?utf-8?B?NWd2STlOeE5HMHpzdEJBemtPeERneVJXRWJBUGVrTm1iVlZDTTl4d0NBbFBn?=
 =?utf-8?B?NCtycGhGb0Z2MXEzdUk2WFR5emNNdm00eDB1MmVwalFnZGtidnNkdVNXUmtq?=
 =?utf-8?B?QURLRnRiaXlQSzlESGo2SXNzM25ud0x1NWtockxWRGhRdmw2RUdMUkdqVEhN?=
 =?utf-8?B?dnIvZC94aS9kaHdud0hPMGdIeGZuenpWZTRHNFVBUHpIdWxqZ1BmYmplZElO?=
 =?utf-8?B?Ky93bCtaV0pxM3lhYzZDQkJUTC8rWngvaHN5TTAxQmNKYURvSFgycUMzbG55?=
 =?utf-8?B?L25ncXBrRkExb1Z5dThxNVg3SUVuZytFNXJ3bkJHSThkYS9nYWo0cUQydm5Q?=
 =?utf-8?B?amtnZGxoUmFSL1Vsc3dkUFM2UWVnOGVnUExjQ2VNRFZtQXgvRU9BV1A5aTVr?=
 =?utf-8?B?UGdKQ3hJbC9EcEJNck5CSm9raVh5cGxITG9KUjFmdVh1QWlySXhtVDZjOWVB?=
 =?utf-8?B?RTR1bkJYRTdBNXFUZjVLY004OGF0VHFOTmd2VnhZaEZ4Mmx2RFlNN1E1aW1E?=
 =?utf-8?B?ZXUzSmJ4ZngxWFh0Zzd1SjJBTUNSNHBRZTR1WWtWbTNRcit0OVpHVkgwYVFk?=
 =?utf-8?B?Z2FTL2phb1kyRldQeElSNHNyM296TUp0REp2VktrRXNEbGY1QjUvZWM0ZUhW?=
 =?utf-8?B?blNTVnhDckJoQVpHU0NTa0xIVEZsMVZiTFNYWEdabGFMR2J6NW5MK21ONU0z?=
 =?utf-8?B?OUxDQThYTmtRcEhiRGRpOHlFaEpDcG9zdFlPd21DTW9ML0JndldTYUFPTUF4?=
 =?utf-8?B?MDVPc0dmU2lTdDRXamhtMFc5dU81TkFZVkxncVZseStkbzNWMDhNbHM4YmhB?=
 =?utf-8?B?ZmYzQmFaREpDb1IzZW5vdzJ2aGcyYlltUkx5N1JkYW5jTzdQTGl4bFFKdDdo?=
 =?utf-8?B?NndOV04yY1U0WlV4citEa25qdm9PaC9RUjJtTVBnMlNhU1dkTk94NmFCdDNi?=
 =?utf-8?B?RWpBNTRiV2IzS0NrWEtMd01WZm9zNFRyT2ZOMkVXaVV1TFlkaE5OTmk3dTNI?=
 =?utf-8?B?LzlXK0NVRlY3eEFQZG1WOWNPckcxTUZDNGtGOGxEZnRoRHZucmErT0s4MEVz?=
 =?utf-8?B?cGxFTUs3QlMwMGp1b1g1K0Ztby9mbXNKL09jWTlCbVVUMjVQbTZtWTNzaTB4?=
 =?utf-8?B?SU9JOFk0bm5TeE9jOXRYOUU0eU5ENmlhT05TcFUwMDFYcjVEb2EwSWhtNTJN?=
 =?utf-8?B?K0VDSzBXRE1UYjhxOHFOVjdqcFo5YjcrUVRDamVDa2ozdFJGRDVkdFQreWRv?=
 =?utf-8?B?bCt1d05TMitxb1Uzbi9qUTMyWHVDOHBwTWE2VEljS01WMEROOUs4K055eGpM?=
 =?utf-8?B?aStubHVKQUt0SERkWmVoQk45WVM4SW9nUXVMVFVLa3p4MExxRlpNRlBDSGZz?=
 =?utf-8?B?Z3NMTUk0RW1maTlqUXdrRWlUNUczdzN6TXRmRCtSQlA2S1hybDBoRkpSYmN3?=
 =?utf-8?B?T21Ib21heVU1TUY1d25UWjVkMXVnYmFJR0F6cmZWSGRGa3NVMjg0Y2EvaEVC?=
 =?utf-8?B?endKcE00c0t0ekNGWVRibFkxS0t2VWFKM0Z3TTlhN1hJeEFVREVnWC9FMElU?=
 =?utf-8?B?TTdQSWVlbm5FeVpyR1gyV2RQcXZlNk8xWHlaa3g0bG9VR2h1aDFLK1ROTWZT?=
 =?utf-8?B?dE5NVzgvZU9FUkQ1ME5BNEtKMHcwcE1RcFhoNisrelJjQmZZeG9NeUlNeDMw?=
 =?utf-8?B?Q2p5WXlPbDdwNFk3aUZSMVV2Z3UrUTRGWEVEOVdZbnlHeTZJeWdabGl5eTNV?=
 =?utf-8?B?TjRCZ2MxNUVJSkV1cFlaNHpxVXlreFlpbll5RU5JbS9nMCs1VWF3Z3pkNlRO?=
 =?utf-8?B?ei9mUlcyZlNNZWp0QlV1czk5cWU0SVVyVFo2MFZ4a0RLd1pRN3NwbUd2Smpx?=
 =?utf-8?B?cTlpUWFHZkRDQnA0cmtUcEx6NllaNmFaa0VsWGFxVlpRK0J6QlFCTldWOWY0?=
 =?utf-8?Q?/KwTIu63sycdLQc2mvvnYsm17?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c29c7faf-f28a-4605-2663-08db6b3364ed
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 10:54:28.5977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bScbF/qcx2uakzbtop5CnZ3+fXSbakv/VG+GdUfom9yIVW8PNAROj8XFgR+oOb4aK1NJmAxfX2FAL3iVpMCh+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8265

On 11.06.2023 12:07, scan-admin@coverity.com wrote:
> *** CID 1532324:  Memory - corruptions  (OVERRUN)
> /xen/common/trace.c: 800 in __trace_var()
> 794         }
> 795     
> 796         if ( rec_size > bytes_to_wrap )
> 797             insert_wrap_record(buf, rec_size);
> 798     
> 799         /* Write the original record */
>>>>     CID 1532324:  Memory - corruptions  (OVERRUN)
>>>>     Overrunning callee's array of size 28 by passing argument "extra" (which evaluates to 31) in call to "__insert_record".
> 800         __insert_record(buf, event, extra, cycles, rec_size, extra_data);
> 801     
> 802     unlock:
> 803         spin_unlock_irqrestore(&this_cpu(t_lock), flags);
> 804     
> 805         /* Notify trace buffer consumer that we've crossed the high water mark. */

Earlier in the function we have

    if ( extra % sizeof(uint32_t) ||
         extra / sizeof(uint32_t) > TRACE_EXTRA_MAX )
        return printk_once(XENLOG_WARNING
                           "Trace event %#x bad size %u, discarding\n",
                           event, extra);

Therefore I don't see where the tool takes from that a value of 31 in
"extra" can reach said line.

> *** CID 1532322:  Null pointer dereferences  (FORWARD_NULL)
> /tools/libs/stat/xenstat_qmp.c: 220 in qmp_parse_stats()
> 214     
> 215     	ptr[0] = qstats[QMP_STATS_RETURN]; /* "return" */
> 216     	if ((ret_obj = yajl_tree_get(info, ptr, yajl_t_array)) == NULL)
> 217     		goto done;
> 218     
> 219     	/* Array of devices */
>>>>     CID 1532322:  Null pointer dereferences  (FORWARD_NULL)
>>>>     Dereferencing null pointer "(ret_obj != NULL && ret_obj->type == yajl_t_array) ? &ret_obj->u.array : NULL".
> 220     	for (i=0; i<YAJL_GET_ARRAY(ret_obj)->len; i++) {
> 221     		memset(&vbd, 0, sizeof(xenstat_vbd));
> 222     		qmp_devname = NULL;
> 223     		stats_obj = YAJL_GET_ARRAY(ret_obj)->values[i];
> 224     
> 225     		ptr[0] = qstats[QMP_STATS_DEVICE]; /* "device" */

At least to an uninformed user like me the tool looks to be right here,
in case ret_obj->type != yajl_t_array after yajl_tree_get(). But it may
of course be that yajl_tree_get() will only ever return NULL or objects
with their type set to its 3rd argument.

> ** CID 1532319:    (DEADCODE)
> /tools/tests/x86_emulator/avx512er.c: 1826 in simd_test()
> /tools/tests/x86_emulator/sse.c: 1324 in simd_test()
> /tools/tests/x86_emulator/avx512er.c: 1324 in simd_test()
> /tools/tests/x86_emulator/3dnow.c: 1826 in simd_test()
> /tools/tests/x86_emulator/sse.c: 1826 in simd_test()
> /tools/tests/x86_emulator/3dnow.c: 1324 in simd_test()

I'm going to ignore all these issues in emulator test harness test blob
sources.

> *** CID 1532318:  Memory - corruptions  (OVERLAPPING_COPY)
> /tools/firmware/xen-dir/xen-root/xen/arch/x86/x86_emulate/x86_emulate.c: 1987 in x86_emulate()
> 1981             dst.val  = *dst.reg;
> 1982             goto xchg;
> 1983     
> 1984         case 0x98: /* cbw/cwde/cdqe */
> 1985             switch ( op_bytes )
> 1986             {
>>>>     CID 1532318:  Memory - corruptions  (OVERLAPPING_COPY)
>>>>     Assigning "_regs.al" to "_regs.ax", which have overlapping memory locations and different types.
> 1987             case 2: _regs.ax = (int8_t)_regs.al; break; /* cbw */

I was under the impression that reading and then writing different parts
of the same union was permitted, even without -fno-strict-aliasing. Am I
missing anything here that Coverity knows better?

> *** CID 1532317:  Insecure data handling  (TAINTED_SCALAR)
> /tools/libs/guest/xg_dom_bzimageloader.c: 574 in xc_try_zstd_decode()
> 568         if ( xc_dom_kernel_check_size(dom, outsize) )
> 569         {
> 570             DOMPRINTF("ZSTD: output too large");
> 571             return -1;
> 572         }
> 573     
>>>>     CID 1532317:  Insecure data handling  (TAINTED_SCALAR)
>>>>     Passing tainted expression "outsize" to "malloc", which uses it as an allocation size.
> 574         outbuf = malloc(outsize);
> 575         if ( !outbuf )
> 576         {
> 577             DOMPRINTF("ZSTD: failed to alloc memory");
> 578             return -1;
> 579         }

I'm afraid I simply don't know what "tainted expression" here means.
xc_dom_kernel_check_size() certainly applies an upper bound ...

> *** CID 1532309:  Control flow issues  (DEADCODE)
> /tools/ocaml/libs/xc/xenctrl_stubs.c: 840 in physinfo_arch_caps()
> 834     
> 835     	arch_obj = Tag_cons;
> 836     
> 837     #endif
> 838     
> 839     	if ( tag < 0 )
>>>>     CID 1532309:  Control flow issues  (DEADCODE)
>>>>     Execution cannot reach this statement: "caml_failwith("Unhandled ar...".
> 840     		caml_failwith("Unhandled architecture");
> 841     
> 842     	arch_cap_flags = caml_alloc_small(1, tag);
> 843     	Store_field(arch_cap_flags, 0, arch_obj);
> 844     
> 845     	CAMLreturn(arch_cap_flags);

I think this wants to be left as is, not matter that Coverity complains.

For various of the UNUSED reports I'll send patches once having tested
them at least lightly.

Jan

