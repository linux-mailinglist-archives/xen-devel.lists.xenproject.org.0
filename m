Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2B86C0C9E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 09:57:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511776.791009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peBK7-0007Ma-T9; Mon, 20 Mar 2023 08:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511776.791009; Mon, 20 Mar 2023 08:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peBK7-0007Kg-QU; Mon, 20 Mar 2023 08:56:59 +0000
Received: by outflank-mailman (input) for mailman id 511776;
 Mon, 20 Mar 2023 08:56:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peBK5-0007Ka-Lq
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 08:56:57 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a951ff0-c6fd-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 09:56:56 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7252.eurprd04.prod.outlook.com (2603:10a6:20b:1da::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.30; Mon, 20 Mar
 2023 08:56:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 08:56:50 +0000
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
X-Inumbo-ID: 2a951ff0-c6fd-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cMw4EV5VcqHVxDbx29OfYNWNHW+Kjhou1F2pdxzJo0gQbXDOqGEOddHb+7Zbcg/S8qcxWFtdciraAvus2GI1f4prD+Hc6KFd6FKegRAFN9ansEERDbUTZua8LcKYQ0LGIQYCgaszh/Z4GxmDtCmxNkzW7Lnodqm/XWVetX8npbw6At/bZ49IdUWGZPpmj5wVcDWzWWb+JEmKOS5c/W/SeWMB9OkRNeJzrn9lVsZu4MY2HE85svAjZ6pgk6L3p2d4LBvOIfWmfg6Azhh5zO/bsVqZc9EHlppKhS3Mnf5yq+XwvQ2tkQO5ubF9yAJduZxCb41ZHjCHv/M62DkZOGrIGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6PTzaf9u4xx5ygtYcxNBmdQSHSEboNcOLlvMIeyAJ4=;
 b=YfT3xidtpoLDOEBl1QRFba5wy6PwNFm17HwsV9mMzwzOnC3D3OrA1WB1WRhfgHYFEWwZZFmkFBs5e579llHlDET4TDrnHipcd6fFF+v4vMVv0RivgwtzP7T5j0nbe2ZH0ncDw6p0zRZ6FXXuHikUnwricrPH6Uh+WmJ81QCHnqtu30Ig/Y1wOgsfouJd+EYxU3JMfutAQfeYtxU9yojafjj4o08mDsqJV5j0FQ1dD2YSzm3pUUFZd4QeOwkUvPx4ON5f9+cs/4hcTbpNq0oUpm/ROdSn9DpaJFAzrOCyPVS+5q03m9LYBM0nMtWIu4IvtH+f1QlDDmeqPtbw1yO0qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6PTzaf9u4xx5ygtYcxNBmdQSHSEboNcOLlvMIeyAJ4=;
 b=r9Biw8xegHtyTVoEpci8YDW/ndo1iHYvO90UQObjltAAt74kcjcsY06jnur14AeGudJzkol4ae5AcEsiJaGAm0sxkdrtZd9a2Q7sjDCZT723XPua+lLt+dVZdLvHaaj+5iuT2cVSTb4L5/ar1b5KuRHcUVY0f82TbkvDB61n+c8SmuMMc1VYnPdXEfuN6J4r9bJmlspKcY20GVONRIHK0rwip7KdDcYgrf25ISTYsBLR2sOre05TOvUYTlee7bp3JXchmt5d8KP0laeET6pIfe0Kc7Ugs0dlQm/rrfENAaIoX56KkVlmXv8f7FMQoYt9Z2NxU2bwqUo4vRm33HTrWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f945860e-6a82-7070-3a1b-2e73a53040de@suse.com>
Date: Mon, 20 Mar 2023 09:56:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] x86/APIC: modify error_interrupt() to output using
 single printk()
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1679084101.git.ehem+xen@m5p.com>
 <4db49e192b6829e520cf497481a51deef227b23b.1679084101.git.ehem+xen@m5p.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4db49e192b6829e520cf497481a51deef227b23b.1679084101.git.ehem+xen@m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: 821f6393-d537-4bd7-a11a-08db29210b3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OpXzA/+3hKhB4a1vZun7u2yMJcT5vHDOA7Trd5V+zavS8RDVlyEYIpjZpyzGjg1iXhhznEqQyoXCsXWVisa+mmK0wKW1hBaRAazYsDbFE5g0bQ0tjkGVLREnQPmg4ckf7f6ImCFnjfTmiHBYweMMjCiFYuSBc9hZrfCgbdhjzZ6M0MhNW6IOEVLOqPAwzpD+ybwiWpYpH+X+QS5tYmr1c+uNAy75RKV4oeDBpGT+pEylgbE0/uI+16yYgHynHvzuFwrxBTqBw1ktSQjM7H2mWJc78ss0N8ShmDcaKfWgyKSPdgTW59J/DUk1EoVVqrwW3N5OTNoECpF2LOgr9CUCuhUvFkSM3BxFt7vdV5gshMkgfq4CGdMw7Icdd9+17/ubbAoNUkk+D2in2rXOEfsyjmrYPT6QgAPHa0BEQ1n7HJIXOe8ZhHFZFHLRYIhyvfRRc1jiNGL7sUFnD+Rd3rmC8QnCrlyr+RyNr+P4ciejfCtnXyC66fRh//Is/+WbqfOL4prx1ex3El8knbTUUWmRQDzHnW3NA2ptFXD6FfjIxULxehUnRvLendCxA71tidhnb/Hi5BFimyZbOjmbguUo4AzBYZ97OIbx+HmVP1MXakNdNEf2XbR565UiV2A8L7q27M50zcCf3GHzdoh15jNQccHkOE/jB2IURgvK6bjsLZD1JWvam4UsLPMMr6kDclHBZuPRRlVXoQfsW5oK7DsOgXgUHCNZWFLyDGOZpJLlm7E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(136003)(39860400002)(376002)(396003)(451199018)(5660300002)(8936002)(4326008)(41300700001)(86362001)(31696002)(36756003)(38100700002)(2906002)(6486002)(83380400001)(478600001)(2616005)(186003)(6512007)(6506007)(31686004)(26005)(54906003)(53546011)(316002)(8676002)(66946007)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUErN1dBK3J2RW15Z2UycnBsWE5CdHoycFZzQ3BjdXE5YmZSM1R4U2NBSU5U?=
 =?utf-8?B?Nkh4VldrcTE3K2wzcHd0RUFvemFaUG9MR0N1TGQ0WlhPWUEwM0p5WjVibDhE?=
 =?utf-8?B?ZU5qTlBIdWlaR3hPZzI5aXJaVjZYbDRZRWlncFlSZE1vVjh6cDhEdk9NRWxj?=
 =?utf-8?B?ZnpMd1g4dS8wQjMydVpzbkN0MjB0b2F4UjRtOWRBak9qK3RPQ2R2cnBTVGpQ?=
 =?utf-8?B?SVhldCtQNDNkdVd6MWtHS29KbFExNHMyaEVTcE5zMU04S0VsK0luSTRYWHRK?=
 =?utf-8?B?a21iSXBkVEhJQU9wNGU4K0l6TVE1MEplYkY3L1ovdEx4SXRmUXA2MGNqTmR6?=
 =?utf-8?B?RmdmWVZ0Yi9Lc3d5UXdxSXJVbVd0a2NHd3kwb0RtcDFaNndWcUdJaDFZOUI4?=
 =?utf-8?B?YVF4T0FsNEQwOTRUUEx3Qk5PdFhHWEdQT3h4OElYT25henNtVXhYQ0hZck9Z?=
 =?utf-8?B?RXROZVBIMngzNHZPYXhIaTcxN1R6VTBqdFovUjBMY3NhQllCbCtnSmxabS9x?=
 =?utf-8?B?RlJMVDRwTXB6THB0aVZxNHJLdVB6ekNPMUFybmR2VHo3cjRQUTV2UVdzYTVq?=
 =?utf-8?B?eHdvZ0ZEc2NJMXhjUXAvQzRxcGw0d0JLVmpPd1pEbzZzenRrRFNicXlML0oz?=
 =?utf-8?B?b3FxWE9UL0NOWkdtYjBoU3BScHBVaWpqa2o5R2ljSFNYQWkzY09MWE10RjZJ?=
 =?utf-8?B?cjBwK250OFpDeDNSYytMdDR5U09NNUREMzJCd3ZlanhZN2Y4aXdYSFpmb01T?=
 =?utf-8?B?K2dGenJxUFRwN0pVOVRoM1FUbHBFUGNJRm9TR1FSaEJmeXdwUHdpZU1qTTB1?=
 =?utf-8?B?b2xrWEVJTDFra2FhWXpwenBYT0lQNkYvN0RXYjV6VEVPNE0xL2lMWGlsY2hB?=
 =?utf-8?B?Y0VQaEVVLzdCdHdmbndINzVXNDlaSjNrYVJYczZTSEtVaWJpQnVWVVQ0eTJ1?=
 =?utf-8?B?eTFUTzNPQjdOU3RPR3h1YkZ4bWNVR0pSNlUwMWZCTWFWc1BpYUgwZU1hZkpn?=
 =?utf-8?B?TktFeFM4dk10S2lqMVNpQ2VPWG9yMHBnM0FDUDBwQllFQlpyYzFRL2hZVEJW?=
 =?utf-8?B?SjhnclhNY0pya3d4bHJyOFhEZnQ0VnNrR2tKZTdoOUI2T0VTUEpsekRlRERC?=
 =?utf-8?B?VjVQcCt4ZStUYndpRThUVzY1VGF4K0JHRkhLYS9BMk5VTWo3NWVIcXNpcUkw?=
 =?utf-8?B?Nm5BNkpkUmdtUUc4czdyaldoUGFSVnhQNTE2UG9DRE8xZzB5VmtTckUzR1Ix?=
 =?utf-8?B?eEFtdnVnVld3YlZuZ0JEL1Fnc1FmTkxkbVQ0L0c5WWFQWnk4UVFSbUJLd0pl?=
 =?utf-8?B?ZmkyNTVKQmd2bmgrTmFlejhnYWlVWFl0S0xYa1M5bWg5Sys5LzF3RW4xVnM1?=
 =?utf-8?B?K3dBcHY5SG03VjQ1cWk5S1F2dWpiL0pIWFBocmlRMlhRalY2dUxPZDIrWmFV?=
 =?utf-8?B?S0RoejhKcUFnZCtRcU1RU0hJSllMK08zYm11TWp6VXVSZ2poNVdORlpWTXRx?=
 =?utf-8?B?bEhwQ3FzQzlaRXlnYjMrM3VUWG1zQmw2ZjNoeFZEdm9HNjZ2YXZGVVdmcTZk?=
 =?utf-8?B?RTBHMkhDNzllZXBtR0kxdnBwUGJXdU9VejhkUnNvbGdYemY2OUlNNXdNeklq?=
 =?utf-8?B?WDBzNitESlBEa3NuTGJCNWtmQU5oNzRXTlp3VzQxcmdwNEp3a1oxS0FMcC8y?=
 =?utf-8?B?VnZxVWdEUklEM1ZPSTdmNFUzdmhDV21ESTFyUi9ZTFcyQ0tadElrd2JYUGlP?=
 =?utf-8?B?a1VSUy9Jc2E1Z2xJeWlHaTIvcUZ1NVBrOWEzY3hwTGtHaG5pZmdDeHBnT0Ft?=
 =?utf-8?B?RkcxMDRENjZIK3lZclpMdHlrdDNrOXJEK2R0MStjcjkvN21NU0VVRCs3N1dZ?=
 =?utf-8?B?c0NickZnU1djU291eG5GTWdaMFhyOEJNbnRCRWhRd3NtRGFwQkpWQ3kzblJB?=
 =?utf-8?B?NTJCaExlN2lXVDVZem8wQVIvZ0hJczNSQlBIODFTRnRtYmYvVWxUOTV6ZWJq?=
 =?utf-8?B?eExubVBSNHM1V2tJU3NjbGJpYy9sM3R0WlV1b25nbDg0a083S2lpbGtDYUdu?=
 =?utf-8?B?OVlYVlNsVmNheWtiM0o5NU5PTDZ6bmtocklJRjlpTk1MVVhQeVBvRUtEOEZ4?=
 =?utf-8?Q?WI8zV3u2JWnL2RBV6bnMu6dkR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 821f6393-d537-4bd7-a11a-08db29210b3d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 08:56:50.4336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7miZOmczhixps9a+zndaYBMAi0r9AE/al9UNYicMUYYK4UyawH0SsnmAFu8cfvqjPcUmw/d9mgaQtMDMK0kRrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7252

On 17.03.2023 20:53, Elliott Mitchell wrote:
> This takes care of the issue of APIC errors tending to occur on multiple
> cores at one.  In turn this tends to causes the error messages to be

Nit: "at once"?

> merged together, making understanding them difficult.
> 
> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

Here it becomes clear why you're making the change in patch 1; as you say
in the cover letter these may better be folded (or else, as said there,
patch 1 needs better justification).

> @@ -1419,12 +1420,12 @@ static void cf_check error_interrupt(struct cpu_user_regs *regs)
>      v1 = apic_read(APIC_ESR);
>      ack_APIC_irq();
>  
> -    printk(XENLOG_DEBUG "APIC error on CPU%u: %02x(%02x)",
> -            smp_processor_id(), v , v1);
>      for ( i = 7; i >= 0; --i )
> -        if ( v1 & (1 << i) )
> -            printk("%s", esr_fields[i]);
> -    printk("\n");
> +        entries[i] = v1 & (1 << i) ? esr_fields[i] : "";
> +    printk(XENLOG_DEBUG "APIC error on CPU%u: %02x(%02x)"
> +            "%s%s%s%s%s%s%s%s" "\n",
> +            smp_processor_id(), v , v1, entries[0], entries[1], entries[2],
> +            entries[3], entries[4], entries[5], entries[6], entries[7]);

Two style nits: Indentation wants fixing here (it was wrong in the original
code already), and the stray blank between v and the comma also wants
dropping at this occasion.

Jan

