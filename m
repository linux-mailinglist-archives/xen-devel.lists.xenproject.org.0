Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3496532D70
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 17:28:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336610.560968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntWRj-0007sb-0n; Tue, 24 May 2022 15:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336610.560968; Tue, 24 May 2022 15:27:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntWRi-0007qp-Tu; Tue, 24 May 2022 15:27:42 +0000
Received: by outflank-mailman (input) for mailman id 336610;
 Tue, 24 May 2022 15:27:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ntWRh-0007qj-8O
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 15:27:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bfeb602-db76-11ec-bd2c-47488cf2e6aa;
 Tue, 24 May 2022 17:27:39 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-PwKQD3DuN4ODNTMmzeTALQ-1; Tue, 24 May 2022 17:27:38 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8953.eurprd04.prod.outlook.com (2603:10a6:20b:408::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.23; Tue, 24 May
 2022 15:27:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 15:27:37 +0000
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
X-Inumbo-ID: 0bfeb602-db76-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653406059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=29N3yclwzPgKiRCnJIOY0AYd2tH9ld7ttxwK87jtz7E=;
	b=DvjbFHDqo6bsNYWOxNeno97GDK50i3g1sJeimWEJkbBCx14OrUWWuqSCJhsX0BlYbcRir8
	CUaxySolA1uCjm0wjH9b/EZP72aB3PhJDGJfUWrcOagkkVi5od6j58UFTv7dNEMUI69Df2
	mjAkZP/0J59r6bVh/NbQnqaprnpQw8Q=
X-MC-Unique: PwKQD3DuN4ODNTMmzeTALQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBP2/fKoEqW24Ugu8yRPkOIlXQqT/X/oVOlMoVvx6OzN2H77wcrJYG5N/rB8wY4Gj3ce5govw/AD0XcgekeCD1Q2Q91X9+uZUNGiI7Y52SGbcyTUlCbZKUBD+Lw6ymb5+U5LoxABvBnhZbrwFre+sW3G3DPzZhz5oa7lDyQhuaawSx1t2wXTCWRLyBtAFbv8hAue5o6Fw8mAFOPMlt4Ti3ahcM5Jq/aTnFNaNXQdXAUoucjA7eBH60+gzfUHemrqy792raK71SLUEww/pN3HbzyorsfIvVXQYW45Lz7z3sSgMgkj7/ttpLvNh/Prnhx9F1vJizYMS9vfCs1Gu/r1/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29N3yclwzPgKiRCnJIOY0AYd2tH9ld7ttxwK87jtz7E=;
 b=UIOMqOQ0VIo7H6kn50k0JYwiE6GuaZZiRxuCMBSxAm596Ra1o6uO2UMuh0yke+lRShQqh65Dsehc//4IsFxHjVgIT/rCxyfI34HwPNYw2TTpGaL1L9qbW3KFkabkK2xac+KL0H6yNRy3nUc/vaMmhyHclaKUgYqCOVy6YpH1+iII+NFdwR+iL+ihSLACJUwySPNHKiHsS4wFyAaINbwRUYk8sgnNWokfgHmB82zaCrL79n25anH++vcdVGqgwr3gBT24eIEo36qF5bjZwR7oaD8fqzZo+fARh/ZknprkTlauZZYDynRnnR761I4Ya76+QQPqIzVqJwUBJLlrIL5qTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1b0b643b-a906-13ba-d414-feedc98428d3@suse.com>
Date: Tue, 24 May 2022 17:27:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] x86/flushtlb: remove flush_area check on system state
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220524105052.5210-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220524105052.5210-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0010.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a559a7c1-1dde-41ce-b372-08da3d99eea1
X-MS-TrafficTypeDiagnostic: AM9PR04MB8953:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB89532DD32D4E38BEE3FC6BA5B3D79@AM9PR04MB8953.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Yo63s0Tq3HX/slEiCnMLO2j7RwKglubXscHs8IMtasa1Ht1KFIRQxoN+zqUmjyLawFChfX82cDGyZ+fSLMxdDoyTGf8EdXpIQ/ZRgFiAMPxLqWJy2ZlXu8ocd+2+BMxw8eVbGnAQ9riWpaT1rxRg553cub1/wPwI0v06Jkbhb5hGTIRFXRi76cCgA8g+2o46WRFgJchKE3zbdSff72iqynwNEvcepgjKxgmWbAiMno0Hf7JJgkF8aq0BlKPSdVTJGW4evh5VHxA1AIQ3kTm1+D7fTJSiTmtKwkYGZZ8tl/yG3aASvKwFHX1C/BkNWdr+XlKT/4JvlpqSAf5Icb6F8RsErDIX/quWZC1k9iTK2UFXvrRngdPNf7nTnQrDrJVHgiDfcRFT8g9ntKrta5EVooaL21v8xqr4yE130omBazPNFst651oMCs7U4gZUlWkUrxVxfAWqaHMqbEmOV+HaN9AZujX+K+jk3liv71gxIWZPxQ6lGPYk3XyHaSm/jRvUj+foDrI1pUb1FipuU+Ykl0oOCQKqBAEETDpbF1rSFi/gMvoBSLx4sXHI4Bgy3B/8joryZfTBFeAmxP2OkFS+3xN6sxqC1yxx+GY8Tw5cKRaqmB6FdlZTJ4KUKWknrz3lB0aDFDe2s7SxtPW+M61XLyWkZYBFDc0sPoQBgGQd/TmRGZ9SGerNbZF+ZTbkb/nyaotl4SmofsgqsGxyROqmR1otVCatcI0z0LeGMHJMXlbcKKzJwYN3ErZewpK52HPp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(4326008)(66946007)(6512007)(8676002)(86362001)(38100700002)(26005)(66476007)(31696002)(6506007)(36756003)(31686004)(53546011)(316002)(508600001)(6486002)(6916009)(8936002)(54906003)(186003)(83380400001)(2906002)(5660300002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUNSRktSdFBwSnNUZnJnRnM1a3h2dzFPSGpUb3ZWS1E1V2lwNWdDU3VqSUk4?=
 =?utf-8?B?ZXN1TWo4bzNoRmR5cDZocnIvYm0zLzh5bXdZdHU2d0pqUE1zYlZyck0rT0U1?=
 =?utf-8?B?eTB0ZEtrQTlkV0l1VWs2VmhEYXU1djBGaWNVdjlTazdSTm5pZjRiR3RCRUsz?=
 =?utf-8?B?dm5CTGhTeWdUT0NTTkdkWUt5UmQrZExaRlJRSzJVanVtaHRBYnVSWjVHcGQw?=
 =?utf-8?B?cllPb0R6aTFnbXVWTndVWTFnV29zWU5UblBzb0xDN1NIeUZkUTZGWmxFK2F6?=
 =?utf-8?B?RmpobHdJdkMvRWZoQzhCZFltaHgrdTcvRURRalAwNEp1VnB2WkJmdTFLbURy?=
 =?utf-8?B?bi8yZzVUWHcyNmFHalpRQXlMdUJMZnloc29wNytWUVJFcFgyRlRQMXpzaHRG?=
 =?utf-8?B?MmtJcEYyMXNNd3RpUXVLelN3aWVqNENGSmlzNHBGY1VXZHZGLzFoNDN3QlVS?=
 =?utf-8?B?N0JOSGxxL2RtTjJsZmRGUS85YzdkQThOdWNDU01zUHVPWWJLZ3B1L2RObUNP?=
 =?utf-8?B?SHJPejEvQlFpVGJOTkNCUzhoSGJmams4RDluaFZaWWxhcnFFN2dEWWZ3STVS?=
 =?utf-8?B?MVZmNUlES3dOaUphNzVvelNBY3lEOTRmMFZjSCtWMnA1eEc5NWlJUXkvbXFs?=
 =?utf-8?B?QkU3eEVWWStuMTU4azZOcUw2UjV6dnJrQjFYMW43dHNkZVUzVERmOFR1eE1k?=
 =?utf-8?B?a2NWdnpCUkp6NlRrVXp4eWZaN0FhWGVsWXd4MjdxZ1YzT2V6MzAzM0VoaHda?=
 =?utf-8?B?cUJaVEMxd0F5Y05uKytQVjU3TFhndm0wOGFrSVBjL3NYN3lyZkxHWEdhaUF4?=
 =?utf-8?B?d3RHSDB3b2hwcGNocTUrTS9vTFFjcXR3a2V6aTBqd0Y2RkJkM2N4NFlMUzdB?=
 =?utf-8?B?dU1IWlQyNUprR2V2VDdJRG9yT3lhRnNLOTBxa0ZXUmpVVEVodkJpZ2pibk1H?=
 =?utf-8?B?TElPZXBORTdpVm11N2lmMmdYcktZdUR1N2RSUFF5M3FtRFZQUVBIWXI0cmJo?=
 =?utf-8?B?bG9nRnZvc2RRSlFRWmwySjdSdU1zdE40SGU0dm1maXdDUzdkV0FvZ2RRazdN?=
 =?utf-8?B?TEhaUDdpWjA2UDNERkVvK085U3lqcmZIbWY5dmZkU3ZvMVg2M2h4STBsY1RC?=
 =?utf-8?B?dzVGdjZhU01BMTZ4di9hMHZ0alA3cWNYMmxQVkVvckh5bzdpTStQNzIwNHlX?=
 =?utf-8?B?VlVxV0c1WUhLMDJHQUVuSDVsNlUvMlFjSWJFenZYcFlzVnpaeGxldmtGemdF?=
 =?utf-8?B?Y2pqMDFic3AxbDhxWnRyMzg2bVdhNHk4eUNnRFZ4TXVrOTh4Z2swNFgzUVJY?=
 =?utf-8?B?Y3p4RVlSWDZIQXlRcjV3T0lnVlJ5SlFWMjQzSTJMSVRpZmF5Z0R6T2s2ZXha?=
 =?utf-8?B?RVlQZHNuNGRTU1RITTNFa2c0YmQ3QWhUUy9TNEsxVDR2bzlwT1dOMlR2WTkx?=
 =?utf-8?B?NDZUeWRMZGxhdXBsTkc0b3UwVzRrbXFoOW9wUW5HMUZhTjEzTDJMcm1sQTkx?=
 =?utf-8?B?NWp5RlQ3UG9SV2U3K3VmQXhtbUZ0ZlJONFZmRDZvWnFYOUV2OTZyVGpqTnpx?=
 =?utf-8?B?N3M2Y3lsdGpucStzanBVREY4c1M5VjBPZllOa2phbmwrTnpoRTdpOHBDV3JB?=
 =?utf-8?B?dkRBNGgyUWxhTDNINjJZemM1cHRaRXFxTkhKWklrbmdobEVyRUFSeXVBbEJx?=
 =?utf-8?B?S0lTRS85RjVlcXB5MFN0U2dHTldpWmcydFZESlpoK1ZsVE8rTjg2bEI3SFNW?=
 =?utf-8?B?bzVXdG1iVGkySURoT2ZqbzdCYUpMSTJYb2VrTXNhRmdJT29ueDcySTdlM3Uy?=
 =?utf-8?B?cjNIRnFUSTlOTGE5UndST0lZTmhmU1laUmx1R2dkekhIZGg5TStEbzJRaCt4?=
 =?utf-8?B?YlMrcWhtT1BJSHVybUUwMVFuRnU3US9BR3lSSFFhUzlTMEF0ZkVFODRFQVBI?=
 =?utf-8?B?SFlYMjlQWHlFSHlIbEdlblhUelNWWW5hbGV1a2FOby9GcEtrYVRwQU9teUdx?=
 =?utf-8?B?bVMwaXJZVkJQaWdvQitJaE1KSEkwYnkvZXN6ZEw2MERzaC9BMGZWSG8zc2NR?=
 =?utf-8?B?ckZEbWV4cnhxQllhbjJzOUU3aGp6SXhTNDNkbGJCTjlOeUFQOXBGeDZSYWNh?=
 =?utf-8?B?dzZRSVhUMkpiazdiaWVXSU1uS2Z1MU1zcExRRGYySGd6OVJ4bER6YlBJLys2?=
 =?utf-8?B?TzRJb1VDREcvbDF1ZVZtREJ3QkNvUnRMSUZPUkxXYUd2cys1dU43cE1tdkwy?=
 =?utf-8?B?aExCek9ocUhRZHFzWGttUTIxYXZvNnBob084WXBPZXpSZnEvRVhuMG9hRGdJ?=
 =?utf-8?B?Nm8vY1BORDF3aGtFV2Irem5UOTZFV1BqZUNDMDk0Y1dDUkIrTytFQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a559a7c1-1dde-41ce-b372-08da3d99eea1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 15:27:37.0617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQBUZMek4jmknDaxW8HWGABoQC9NYTv/Aq7f8IsIfMJmoIJOBH1VSSY2VwC7AJS0vkqbOAFLx9LfowC5/FCcOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8953

On 24.05.2022 12:50, Roger Pau Monne wrote:
> Booting with Shadow Stacks leads to the following assert on a debug
> hypervisor:
> 
> Assertion 'local_irq_is_enabled()' failed at arch/x86/smp.c:265
> ----[ Xen-4.17.0-10.24-d  x86_64  debug=y  Not tainted ]----
> CPU:    0
> RIP:    e008:[<ffff82d040345300>] flush_area_mask+0x40/0x13e
> [...]
> Xen call trace:
>    [<ffff82d040345300>] R flush_area_mask+0x40/0x13e
>    [<ffff82d040338a40>] F modify_xen_mappings+0xc5/0x958
>    [<ffff82d0404474f9>] F arch/x86/alternative.c#_alternative_instructions+0xb7/0xb9
>    [<ffff82d0404476cc>] F alternative_branches+0xf/0x12
>    [<ffff82d04044e37d>] F __start_xen+0x1ef4/0x2776
>    [<ffff82d040203344>] F __high_start+0x94/0xa0
> 
> 
> This is due to SYS_STATE_smp_boot being set before calling
> alternative_branches(), and the flush in modify_xen_mappings() then
> using flush_area_all() with interrupts disabled.  Note that
> alternative_branches() is called before APs are started, so the flush
> must be a local one (and indeed the cpumask passed to
> flush_area_mask() just contains one CPU).
> 
> Take the opportunity to simplify a bit the logic and intorduce
> flush_area_all() as an alias for flush_area_mask(&cpu_online_map...),

This is now stale - you don't introduce flush_area_all() here.
Sadly nothing is said to justify the addition of a cast there,
which - as said before - I think is a little risky (as many
casts are), and hence would imo better be avoided.

> --- a/xen/arch/x86/smp.c
> +++ b/xen/arch/x86/smp.c
> @@ -262,7 +262,10 @@ void flush_area_mask(const cpumask_t *mask, const void *va, unsigned int flags)
>  {
>      unsigned int cpu = smp_processor_id();
>  
> -    ASSERT(local_irq_is_enabled());
> +    /* Local flushes can be performed with interrupts disabled. */
> +    ASSERT(local_irq_is_enabled() || cpumask_subset(mask, cpumask_of(cpu)));
> +    /* Exclude use of FLUSH_VCPU_STATE for the local CPU. */
> +    ASSERT(!cpumask_test_cpu(cpu, mask) || !(flags & FLUSH_VCPU_STATE));

What about FLUSH_FORCE_IPI? This won't work either with IRQs off,
I'm afraid. Or wait - that flag's name doesn't really look to
force the use of an IPI, it's still constrained to remote
requests. I think this wants mentioning in one of the comments,
not the least to also have grep match there then (right now grep
output gives the impression as if the flag wasn't consumed
anywhere).

Jan


