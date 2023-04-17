Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 869A46E45D3
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 12:57:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521982.811048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poMY1-0003vh-0g; Mon, 17 Apr 2023 10:57:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521982.811048; Mon, 17 Apr 2023 10:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poMY0-0003ty-TJ; Mon, 17 Apr 2023 10:57:24 +0000
Received: by outflank-mailman (input) for mailman id 521982;
 Mon, 17 Apr 2023 10:57:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poMXz-0003ts-1j
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 10:57:23 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2086.outbound.protection.outlook.com [40.107.20.86])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0c46102-dd0e-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 12:57:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7658.eurprd04.prod.outlook.com (2603:10a6:10:20d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 10:56:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 10:56:52 +0000
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
X-Inumbo-ID: a0c46102-dd0e-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAmmz3V54Mo6fDuixo7GmIxftmUA6O+DwSQMaRHa4CdJ/HHNFwbHBnOVpEC+mc1p8ZeQJ++vTT2iEZGHh0IA0mA6eVzd/VL3grAC3HeRbCv1R+DJMDAdKcldwfoPMtSFzzc0StjGEAm45LyoGuSm7BsaTEN2OUDfiCACjz4p03B4oCIiDnOHPujiFj8w+TExEyYy1gHSSn6VhOxAnRqdg2IxE9boVxXXNaZYkQukSDnKbodedyTkaZ2OcRZFXtMXKLCpTggdhzbOjCP7DpZnYfUd628Ov9dukFNGm19Y9lkjLwZbjVzUKMSmPi5WdCFHAPyTYK3NYumiZbvJly0vjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDwUViNCltR1eT6y/vXEAxozoz8xQXzv0Ckl8vOSrHc=;
 b=JEhjF2CWo7iWSFhGSspV4b1oD7igYSy5sh094aqS+HSueiXVnoWASKhlN8Gr4j9c7WoLzy29UmBYpV6MhTDIDhFuTy0l82JLqxDRoclmLiaMl6rzFWWo1Ud3OSpQBan0hAQsHafHFV/wgz6BUE4Njkn3MLDjj9mSCdi1Nwf4Ea/hkqzRDhoOnNaIONJpiA6qX/ANPCCOdCH5ldhKfC1AOykd1CLPX/hraENzlN6WXGJCOGHMj1mn3Lp/ftYZk9nH2RsrnMEgibyHrdITkxbXa5ALAnIuAuTQUGbTyeTfvEuTgNZtO2nvAUL2NcUHWMrrzKUxE2rNwX/HAuM4og4Mwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDwUViNCltR1eT6y/vXEAxozoz8xQXzv0Ckl8vOSrHc=;
 b=DrXiv5sBXylrfBR0ae+jde0ycB/JUeoOqQ6lWpg1Zu36HqzqZFHWXQOkTQsKv4hH8olZsrWH1UkWlv/wwWHQP86A+d0lW/EQ7GZC5Vsv4FvfK0NmN4nvgq093nUxf5hlGSTtKqZg80fV42fNjn3mlF4DOz54HASy/GKX6hKSu/sR0MsX8hb51eiId6XrPjdHsQ9MDlgAaFmYPojBu2F08qAu2BkHyjDd6iY/Ayb9ZFEi54cphoCAuCnIp7atLCUSmNNvwueRqDPex4bbJ6GLj3sVxv6ZfwuCHNf6nbij0WQL72Q++TLG17wmJBa4Di/3lFc/ZqrXj0iAMOCX6XNkYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <56a62f69-8340-9d29-8fe3-fec84e084af0@suse.com>
Date: Mon, 17 Apr 2023 12:56:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 4/9] x86emul: support CMPccXADD
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
 <7fdf882f-0667-e0f1-8183-2dc1a344f4fb@suse.com>
 <c973ddcf-506b-8318-07cc-bb177541619a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c973ddcf-506b-8318-07cc-bb177541619a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 438e1e33-10cc-41bc-d28a-08db3f327374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ObP+YetEAp5QRrRsdRUI/faVuBq/+no6cYS56gFKzV1kzk+/woSlAub8MjOtVv4ZNFMZyLe+HSVyZoffApb0AgG3OMVH7Tt4pkruoTGtK51wLMoJFV4+ZPp8x8P1xrOpTeS8Xots8VVkGRE4owHae4FDZpSSUkbHl9tjjANqh9SlD1/4/WVlQgyHkvxLz7qbt7gDHj0F62WVWtrH50ETIPPVeJePBFcFkFbFdx+ZV0EcZ2Jb+WBy61pU8mHdT/n/c6Y/o4x2mHLIQLFOC53GUE27R/e2n49iQIEf6/20JZcLsnfgwSk0AqahmUsxgfaWDzDsNLs/jlJiB1EfdMJTIu8jz6+ki8Pqn+YEddAwfpEajbnth+tv2zqSqXPvzweH3m3w7P0vwlSEsvQIYR7aUaAHRluSrbwrzmIaibysvN/0+g/u5MqGw3CqEAgj7RJ75aTDizeRhH1y5kIXextSA3Jhc1EMjMhuuO1dXU4nNLa+X+u3R5tGvfxPQYON9i0MEkIhCQB4GKLD2Zemclf8lXoFtccS5+pJ9uUv/Rq5ymVAjTiZO5ssFP0yoIWdyWZzUGzFIbm/ZP5/UV4pYlS68iaB3H9CCzn5x13VO43y7lwNFXZWIfvdFVA2TcgoMlsajpCM69OIAZdCgzG3znIHSP+RiNhq8aos4v+1ah6OVkA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(136003)(39860400002)(366004)(346002)(451199021)(6486002)(86362001)(478600001)(31696002)(2616005)(36756003)(83380400001)(26005)(6506007)(186003)(53546011)(6512007)(38100700002)(6916009)(66946007)(66476007)(66556008)(316002)(2906002)(4326008)(8936002)(8676002)(5660300002)(31686004)(41300700001)(66899021)(54906003)(87944012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzgydExIS3YvNEtxdEdNUDRSNXc1Rmh0UjU4RWh6ZFRTeEY5NUZDUjNVSndO?=
 =?utf-8?B?TmpWQ2RTdy9CMXpNUUxobzUwczFZOVFnVzVwN1RuM1VIYWZBV3FsOUE0aXlY?=
 =?utf-8?B?bUNyVUxwNUxZSlJDYjliUzBRc0MyRFBEYUJ4dno3VjV0NVpJZFEvYmQzVUZy?=
 =?utf-8?B?MzluM1VDTndNd0ovbFA3YUJzZGVQNlRBN2NESGRjMXg0eWpBcCtpd1VtQ1Ev?=
 =?utf-8?B?WjZjZWlXQTJaZXVIOXV6bHQ2cFR0ZUZTaXQ2MEZhZGdpcmZUYnNCNHVjQkZD?=
 =?utf-8?B?L0Z6QlkrdGZCdkN1UGx0SjloRnZmRVF2ankyQ0l0RWlnZFFmRXlrQ2NJcEtt?=
 =?utf-8?B?OGp6WkRrQk5wSmRDaW5ia3RjWmh2aHBLdnNCT2xxVnUvb3hkNWRaMlhZYTlS?=
 =?utf-8?B?L0R0MFFsR3ljK2NXRzNGdEZxa1JkT0hRTHZIRGs5TkFqcytBYmNoTGg5NEc4?=
 =?utf-8?B?Wmp0Wkd1a3VjRlB3S1NqR0xod09Ja2VWRHc3aUprMWhYNXRXK25oL1hNZmhQ?=
 =?utf-8?B?U2JwNFpuVEtOaHpMSUpQVHgrS050b204WEFLWkREaEFSczVCeUE4UjU3L05v?=
 =?utf-8?B?V0dSN3ZCRXN1cVFOZm1TK3E0T1JrdTIwNlpIbFNOeldlSCtqVFFmc3Y5bllv?=
 =?utf-8?B?eDVIeTlPRU5tcGwxeFArWTJPRUM2SVh2TTdmenR5VXZWU2tvcE0vZmYwODNr?=
 =?utf-8?B?aTFZVDNSbmYrM3gwdFlNZVVza2gwaGwwRlZtTGs2cGhQUWJSeHM0bHNPeWRt?=
 =?utf-8?B?QVlHMUR2TmpyK1E3WnNxcjh1VWNiRzBLbE15Q2krODgwZEFSMHc3S2prd216?=
 =?utf-8?B?YjVPb2FaSGpNMVBGSVpKV1R6Z3dYSU5hMzdyOTdOaEp2VE1uS3ZlcWIrNlhv?=
 =?utf-8?B?eExYSXNucDY2d3YwRmZqRFhER2hnMTVqc2JnK2gySFI1VXBtQTYrRjNRMWxU?=
 =?utf-8?B?bnM3YnhqNkpGVUJ3UlBlRUg3UUNzSzBFOG9oZ2ROYVcwbGxNdEszdHdxOGM2?=
 =?utf-8?B?S2ZaWDdldFBuZWFML3hibm5GNUJNdkxKOXpvVWJLTWpLYXJRTXNpbmF6U01q?=
 =?utf-8?B?enRSUHBrWlE1YlpkVFpTS0VETmltRXk3bG40WnpTQXMrSDM2anlvUDJWOXMy?=
 =?utf-8?B?UjRzKzA3eDd6RkZYQWdNTElYSzhjMDRYSi9iaFpQWmc4dkVlMkN4dE8yL056?=
 =?utf-8?B?U2NmaUsrUGRQV3N2aFNnZ2lKcElyWUF3UHp0MVpMRlhxR0w4dzBBRE5KSUlZ?=
 =?utf-8?B?b2p5SkFSdUkxdjBqNlgwRkFoaTRyZ3ZPeGhtZTZuU2ZJT2ZYVjRtTVovMVFw?=
 =?utf-8?B?cUIxT2xhVnBWMjAzekJSN1hTRkZGRjhmbzFRTnhXaTBwekM5YTRUVHV0L2x4?=
 =?utf-8?B?VllXN0lZMWliU1k4M1JlbHRLZTlEcTd1aFVHRENtYzFTQk5PZnVYTUNGUDdF?=
 =?utf-8?B?QVJUNEFTQVFTT0s5SWc3WHQvZzB2V3Ruem5HTFlaYmlYQjcwU3ErNW81R2hE?=
 =?utf-8?B?VkdGVmtDU05DcHdjVDJFVVNtR042TEtCbjR4M3NFQ0hiRUEvQVd4dElqU0tt?=
 =?utf-8?B?YkNvQVZWc3h0Z0toeTFBUHgvMm9uVlRFcUhsaGFmaCtTMzZoZDJFN0tEK0tp?=
 =?utf-8?B?N1VLdTE4ZkhKQ01oSmFwSjhaRnZ3dVBWU3g1MmtxUXgvdUthSTduZFlRSmwy?=
 =?utf-8?B?TURXTVZibldRSzR1ZTd3YnpEby90VnVkYkxVRVo4cDlhUW1ZSTRrRldjb2xQ?=
 =?utf-8?B?TFFoNENFWHRhNzIzbG5CT0kxUGI1L0tsWEFMblU2alJBZ2xtVldEVTVFUXhS?=
 =?utf-8?B?dWo1UFkvL2VEM0htckszelRJNUxhMGVDMTFNK3pkS1UwZi9PNUo2Unl4cFZo?=
 =?utf-8?B?c01yK2RYQlZYa2J0WGNidk92TzA0QTVBZFAyck9EUkNOZ3ZNcGxkRVlMOFdX?=
 =?utf-8?B?b1dUcmFxdHZSbzhjZUt5VDUybGZmdEdNdjFWVEh1eTFPb2lHcGl1RHZnN0tq?=
 =?utf-8?B?Q0U2TEdpd2tOT05NMzF3bVl1a0w5OEttSmFteDI3bFZ2RmZhWjJtWGtwaFRq?=
 =?utf-8?B?clpXT2lwemorZ2RHZVg5RWcvc3RZWTRIL3ozNFFJSzFmQkhsQzF3S3pwL1d6?=
 =?utf-8?Q?KQag6QVX0ZX47FZJwuMr0BCNG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 438e1e33-10cc-41bc-d28a-08db3f327374
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 10:56:52.3013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /C+5ygCdiH+zsmsqHhgEKuCPg6k9Azd0cKn8uCAk1MrJaWlYWgxzqL6uvQ75vFQlqS/soJU5oytwTsg5FY7DHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7658

On 06.04.2023 21:28, Andrew Cooper wrote:
> On 04/04/2023 3:52 pm, Jan Beulich wrote:
>> Unconditionally wire this through the ->rmw() hook. Since x86_emul_rmw()
>> now wants to construct and invoke a stub, make stub_exn available to it
>> via a new field in the emulator state structure.
> 
> IMO, patch 5 should be re-ordered with this, because it removes one
> incidental change that's not really related to CMPccXADD.

Yeah, I can probably do that. The order here really is simply the order
things were written; I did notice the potential for the subsequent patch
only when already done with the one here.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> # SDE: -grr or -srf
> 
> The ISE makes a point of noting that CMPccXADD is implicitly locked,
> like XCHG.  (Unlike XCHG, there isn't a valid reg/reg encoding.)
> 
> Right now, the xchg emulation overrides lock_prefix, but I have a
> feeling that's stale now with the rmw() hook in place.  But it is
> dubious that we let xchg fall back to a non-atomic exchange if the rmw()
> hook is missing.
> Either way, I think it would be nice to clean that up so we don't have
> differences in the handling of instructions which the ISE at least
> claims are similar.

We can certainly revisit this (independently).

> Tangentially, what about the RAO instructions?

With the infrastructure we have right now, I don't see how we could get
their exception behavior (non-WB -> #GP) correct. Hence while I have
these on my todo list, I don't have immediate plans to deal with them.

>> --- a/tools/tests/x86_emulator/x86-emulate.h
>> +++ b/tools/tests/x86_emulator/x86-emulate.h
>> @@ -934,6 +935,8 @@ decode_0f38(struct x86_emulate_state *s,
>>              ctxt->opcode |= MASK_INSR(s->vex.pfx, X86EMUL_OPC_PFX_MASK);
>>          break;
>>  
>> +    case X86EMUL_OPC_VEX_66(0, 0xe0)
>> +     ... X86EMUL_OPC_VEX_66(0, 0xef): /* cmp<cc>xadd */
> 
> I know the style is a little mixed in the emulator, but
> 
> +    case X86EMUL_OPC_VEX_66(0, 0xe0) ...
> +         X86EMUL_OPC_VEX_66(0, 0xef): /* cmp<cc>xadd */
> 
> is more consistent with Xen style (because it's somewhat of a binary
> operator), and more readable IMO.

I don't mind; done.

>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>> @@ -278,6 +278,7 @@ XEN_CPUFEATURE(SSBD,          9*32+31) /
>>  /* Intel-defined CPU features, CPUID level 0x00000007:1.eax, word 10 */
>>  XEN_CPUFEATURE(AVX_VNNI,     10*32+ 4) /*A  AVX-VNNI Instructions */
>>  XEN_CPUFEATURE(AVX512_BF16,  10*32+ 5) /*A  AVX512 BFloat16 Instructions */
>> +XEN_CPUFEATURE(CMPCCXADD,    10*32+ 7) /*A  CMPccXADD Instructions */
> 
> Given the non-triviality of this instruction, I'd prefer to keep this
> "a" until we've tried it on real hardware.

Hmm, yes, probably better.

Jan

