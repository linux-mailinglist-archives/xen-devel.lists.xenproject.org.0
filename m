Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A04C2710AF2
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 13:31:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539529.840501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q29BP-0007Uy-6z; Thu, 25 May 2023 11:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539529.840501; Thu, 25 May 2023 11:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q29BP-0007Sm-1G; Thu, 25 May 2023 11:31:03 +0000
Received: by outflank-mailman (input) for mailman id 539529;
 Thu, 25 May 2023 11:31:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q29BN-0007SZ-FM
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 11:31:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e97f313-faef-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 13:30:58 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7824.eurprd04.prod.outlook.com (2603:10a6:102:cd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 11:30:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 11:30:55 +0000
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
X-Inumbo-ID: 9e97f313-faef-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSSjR4MfMBZzjWrFClmhnAYK1vlbR7fK5JjzctnArrpl8K1k/fJmCK/2BUdaZOvGgNcJAPer65ZvNmdHACg1/ETkCHmLrrNZcRTzB5sTFF1FwAhd5s4eiY6IIIo+G9IM4/GPArSbGY5mXQlyK16kaSa3bF1gtYTMfUaJfQDFlgFXkjA/MNcQehV8eRQYtJ+Ei++cP0OAe4rbvnXP45/dS+SoK9L1MMPdgX+hS5Aa2CIZrPD6dkjRARytdLC2hZvXi655CbdTLqs9wKlNKC3QT7Dut+uG5AquCW+vL+/OQ28oEF4p/Dk2mmBItJH43OaQHsGfHadBmBbw+7I3Cc/B4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ctiJ9TLrZSYG2xXmKp4mHAkJBWrEYJzMaVxtsSmLrDg=;
 b=SEnqbgYhpltP96T+tD3xpGRY46hx5cHa4wX4FmyOEqQFioU7UoZfgxCMPHBuibRo2V9u+YZOANPXt43gCbBYSuWCj15bZUbkM3Q/kpsNp3Ve3t18g3GH59BZC4GjFOtNRxeRt+Nb0j+fa2KYSECVZbreADVHcUk/liA5cbelLeHZg6Ebcfu9ieAi358op0FqBnG4Z9vZHoCT7mzpmqjEBrKVHUxGqe8LSR/tB0mH8VIZYdCXJaVDPQWdnTqlDJkfk4jK358sLMIkghADPGhIdU/59IRuRgjqPcXEl+GPLYNu9a8dcI7FCvLAuJRKJvcLqiccyqk4w1nFz1+K77hsKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ctiJ9TLrZSYG2xXmKp4mHAkJBWrEYJzMaVxtsSmLrDg=;
 b=5ZjCO/nU+WrZEIdw+xnqL+AocGyURAQUdmjDXB9j73ZnFxi+0TWhMqI7LOigQQxzq5QHe2K6Njh4jthsHieGlyMV26Tgmwz4/ORFAIraLXDEw35yQ/jPBO3DkoKji+KuwZlWPfrtq1yS1Qjt2xOZvFT3RxvqGghoM/tZa1po8IxDURA3ZXSMpvajTbCGS2asUZN5pGI/7uEKK+ne9bNHw4bHF1KxAB85cCGfPtaEIY78vp3cClHkr1ERimfYAAN/A6W5L1V5RIQo0bTtDwpPP1m29emmIwzjlPCvuMOPNLuYaY2xTjx2RSasftr5ZSjyTlmYXMYIvn/0Cx08UCbhdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6790d5ae-9742-f5f3-bd8c-62602ee9cb1d@suse.com>
Date: Thu, 25 May 2023 13:30:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC] Xen crashes on ASSERT on suspend/resume, suggested fix
Content-Language: en-US
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 xenia.ragiadakou@amd.com, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <alpine.DEB.2.22.394.2305181638390.128889@ubuntu-linux-20-04-desktop>
 <ZGzFnE2w/YqYT35c@Air-de-Roger> <ZGzSnu8m/IqjmyHx@Air-de-Roger>
 <alpine.DEB.2.22.394.2305241646520.44000@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2305241646520.44000@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0262.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7824:EE_
X-MS-Office365-Filtering-Correlation-Id: f2740e9f-ae4c-46da-849a-08db5d138106
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VdNd8dqhBs7Z7954MzsOzKqrAOYpt0r0lvHJxCnzshLVeKNbGhzYun9CLwbbXSF7yTHx55/SCH+Dc9xEukoug0QMPcTsoJ4OZn/LLHB0vA2DR/UzMyQw18BI0N4Com8mR41LjLlg815pwIKc3qBzHF6R9KmOSFFmUF7+9GKIT1JeqDMzd0ZPY7tZAJIWQ91yreTHypo58HPG84qqNfGqgm5vRtQVuPZz7A1gHW3KH3kvUmwlEfMIbpLbwyLUg8nWNmg86WTogFEpPwC8N5HvgQI4C5b2CnHuz98YSuK0/NyyMDwpFrq/zQKz9pGFNQOPB2tQvMh+uZa9bpiBQJn16bPC1N0WRE36IHTx/siG1W/FLmdsKSSkyJ4b1AweQhex6mHbFnWNURakb7LBe8M1/Iwib6bCfWMFpkPZHr10lCyRKGZnM5RoFXVjivoBilDEEMissM4DZyxYNCROCgZ4xJP/l0LVBfqlk5oXyKfanybt5AgK3LdrF1HmUcTMd5mSXH+cVWf2rDrYVs6KN1G+wKwcXQVWzNu4ICduId6jzcmSC/CGpyr30w/FtUqveIrEyhqDP5/H2vtWXnk+5Wr2J4bzyyGFarBLRaRYAx9aBZENyoiClGhtSBAJqiJO8a1N0OIEp4gcSxFso1jNabm/uA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199021)(31686004)(2906002)(15650500001)(5660300002)(316002)(83380400001)(8936002)(8676002)(6486002)(41300700001)(6916009)(36756003)(66476007)(478600001)(4326008)(66556008)(66946007)(6512007)(86362001)(6506007)(31696002)(26005)(53546011)(186003)(38100700002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K29CYU9UZ1JudE9GRVArSDhWblVvUVVrdnpIZ0JyK0h4cWhXbmhBRE1jTlZJ?=
 =?utf-8?B?ZFdxMko2dUJMeWd0M0RpK0k0Z3VNMkMxVDhzRUM5WkNsdE05ZkdYaDFuWmp6?=
 =?utf-8?B?clk0alV6TVBlMTk0RGxQWDcxSnJLd0hjK3NkQ2hsUklQNVFCVDVIZ1Q4WGZr?=
 =?utf-8?B?MXZQVHYyaE5WVERoUjVyR1pnUDJVMy9aaUdIb3hEeDlXYlRDRW5qeWovRW5B?=
 =?utf-8?B?bTNESTdCV1ByaG8reFFnRE9ONVFHQUQvUkNlUGdLKy9TRTNkZDA1NkRzVzEy?=
 =?utf-8?B?RlRRc0JrclZZeVVnbkJsM3g3UTg5OFFKbWRmYkI3TU5aZ2dHem8vSXhtMXZK?=
 =?utf-8?B?ZmxKbHh6YkdldzY0ZXdTVDI0dmhUY2JRUlJmNEZ6SzdFVjhST3VTSlBlczlC?=
 =?utf-8?B?TzQ1OUxETS9MY2dUK1AyWitjV0JqQUx2MDJ4Y29sZDlHaldER3NQZHlEZTZq?=
 =?utf-8?B?NEVHbUZ4MmNTMWVqODg2WlJnVXNodExDS0tPZlh0RXoxanVCVnNEZG5aekVG?=
 =?utf-8?B?YUtWNXJxRnA0dVRWM2tqcDhueFExY05iOUlJS1duOXlUNG9IREZQRllGWVo5?=
 =?utf-8?B?SFRXdy9qV2dZWE9XVTJoMG5BOFU5dHJVYWkvSXpVdDRKRStvRzdIdi9Lbmlv?=
 =?utf-8?B?RDVTTVpNYk03R2xZWmJJZDNTaHgvSGxqVHhldjQ0SU51OG1TdnE4aGJuTGZW?=
 =?utf-8?B?QTM1WGhVUjBnSklyY3JkalBVcTBweElDamc0VnZLdThGWnpoRElnazJRdHFo?=
 =?utf-8?B?Q05QK1hMdVZ0VGM4aXVpRGxPS1NReDlWTlpmWk4rUUI2MG1QSXRySmJjZS84?=
 =?utf-8?B?Nkp5a01URnExdzk1dEZHc1RLNGJQN2p3QU5JcmhTTWUxUUxPVGk0czdib0Jx?=
 =?utf-8?B?UzdpcTF2ZjhocndpQ0hseVg5ZkFPWnlqNnBLUzVKYzJZZDhOdHhwc0REcmF1?=
 =?utf-8?B?eHkwUGVTOEdONnR0WTdHV0dqNHhtVktRT0R6WGxLSGJpSEtSckRMSlpoOHEr?=
 =?utf-8?B?OGp5cER6MTVHVnZjeERGa1hZekxwSlNPUzZtMXBEY3B1QUlhZVJqYnF2cCs2?=
 =?utf-8?B?VDlnc3BzeC9zNXRCdHNTTW0zR3MwMjYwWU5INEtORkk0dlR2U1V4V3VmN2Zm?=
 =?utf-8?B?eUFLRnpGUGtoUXBWeHl4MVJ3VVhTcllMZGRhaEZHbTloZmY0c1ZLZ0NBSGpR?=
 =?utf-8?B?YStKbjJIL3QxZzhma2l3U3FPb1BaRzRqd3NzQXdxSkkzM21obWJhdHBSaWUx?=
 =?utf-8?B?T29YYmIxS09WRXY0dnZvdUZRRGR2azhaOUU0ZGhhWnRkRWJYM2hwMEErci9G?=
 =?utf-8?B?VUludUtzWEFzZFdYeWt5TENwbnpWdEJIemMvUERSbUJ1UE56MzZRMEVLeEV6?=
 =?utf-8?B?czlBQjExek1ieTFza2JxWGpvSXBtL3Z2U285RGgxOE9OUmJYR3F2aDdyb0dH?=
 =?utf-8?B?cGFRa2NZRGZKcnZxMy8xT3BhNkpQamJmS1VuZk5XYXh5NTJsOTdtSjBiTGM0?=
 =?utf-8?B?bU1Kak5kOHRmbWxuaU10Ui82L1FqdmJRWlErVkQyRWp5aTlKV0pZMGJFYkUr?=
 =?utf-8?B?eFVDQUk1R2ZwSmJhd2UzTUo3YkIvUS9TS0t2QVpuVER6WTJFdXNWNlpmRzlG?=
 =?utf-8?B?MnpHT3paemRIZXY5WEVqVkp0QmdWU2hxcDdFSmU0UE95TXdDcUZ4SHR0S0JF?=
 =?utf-8?B?UURDS0hoZ2tQSHhBdWEvMVA2SUlpUzIxV3U0cXhkS09xaTc0eFV5SmxMc1Bp?=
 =?utf-8?B?ZnlSOHYrWWVZWUh6OVZGcFF6VFJwOURlQWFtdkVZQ3FRVnNFQ1ZObFdLdUhI?=
 =?utf-8?B?RC9IUVg3bjRKTUU5YnhXVDFXQk94eHJOYXk5cXdUbHFickdTSFUySGFMaXNJ?=
 =?utf-8?B?VDFMOXh4RWtzT0ZxdkphWWQ1eFFVbmVHVUs4ZFFnTGx3SHFtMk1lSWNUdUgr?=
 =?utf-8?B?dm40bklVbkVzSG5XK2ZFVlJibzhSam1Ba2VKV1dTMGpHQjVnN0pVWENLdnVN?=
 =?utf-8?B?QUsxSFd1ZmVDMjY1TGtwcmhTaFMvbXdiZEkzN2s5Y0plYmc1aUtMT01GUnF4?=
 =?utf-8?B?dUgrK3U5aytIMmVwQzFocXd2SHpwYjN1cGRrakRZZkZFRHg0WWJHcVJqT3Vo?=
 =?utf-8?Q?nB8f5W0GN1qdptBGJOOK10VDQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2740e9f-ae4c-46da-849a-08db5d138106
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 11:30:55.4783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4VRaCZy6L5qMY6ePOACZxSoSxVvdyQzkOp4GjE5HVd5OfB9l1rUAG2esgWLAldDVmIF4OpLUrzvS2wxqPfkU7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7824

On 25.05.2023 01:51, Stefano Stabellini wrote:
> xen/irq: fix races between send_cleanup_vector and _clear_irq_vector

This title is, I'm afraid, already misleading. No such race can occur
afaict, as both callers of _clear_irq_vector() acquire the IRQ
descriptor lock first, and irq_complete_move() (the sole caller of
send_cleanup_vector()) is only ever invoked as or by an ->ack()
hook, which in turn is only invoked with, again, the descriptor lock
held.

> It is possible that send_cleanup_vector and _clear_irq_vector are
> running at the same time on different CPUs. In that case we have a race
> as both _clear_irq_vector and irq_move_cleanup_interrupt are trying to
> clear old_vector.
> 
> This patch fixes 3 races:
> 
> 1) As irq_move_cleanup_interrupt is running on multiple CPUs at the
> same time, and also _clear_irq_vector is running, it is possible that
> only some per_cpu(vector_irq, cpu)[old_vector] are valid but not all.
> So, turn the ASSERT in _clear_irq_vector into an if.

Note again the locking which is in effect.

> 2) It is possible that _clear_irq_vector is running at the same time as
> release_old_vec, called from irq_move_cleanup_interrupt. At the moment,
> it is possible for _clear_irq_vector to read a valid old_cpu_mask but an
> invalid old_vector (because it is being set to invalid by
> release_old_vec). To avoid this problem in release_old_vec move clearing
> old_cpu_mask before setting old_vector to invalid. This way, we know that
> in _clear_irq_vector if old_vector is invalid also old_cpu_mask is zero
> and we don't enter the loop.

All invocations of release_old_vec() are similarly inside suitably
locked regions.

> 3) It is possible that release_old_vec is running twice at the same time
> for the same old_vector. Change the code in release_old_vec to make it
> OK to call it twice. Remove both ASSERTs. With those gone, it should be
> possible now to call release_old_vec twice in a row for the same
> old_vector.

Same here.

Any such issues would surface more frequently and without any suspend /
resume involved. What is still missing is that connection, and only then
it'll (or really: may) become clear what needs adjusting. If you've seen
the issue exactly once, then I'm afraid there's not much we can do unless
someone can come up with a plausible explanation of something being
broken on any of the involved code paths. More information will need to
be gathered out of the next occurrence of this, whenever that's going to
be. One of the things we will want to know, as mentioned before, is the
value that per_cpu(vector_irq, cpu)[old_vector] has when the assertion
triggers. Iirc Roger did suggest another piece of data you'd want to log.

> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -112,16 +112,11 @@ static void release_old_vec(struct irq_desc *desc)
>  {
>      unsigned int vector = desc->arch.old_vector;
>  
> -    desc->arch.old_vector = IRQ_VECTOR_UNASSIGNED;
>      cpumask_clear(desc->arch.old_cpu_mask);
> +    desc->arch.old_vector = IRQ_VECTOR_UNASSIGNED;
>  
> -    if ( !valid_irq_vector(vector) )
> -        ASSERT_UNREACHABLE();
> -    else if ( desc->arch.used_vectors )
> -    {
> -        ASSERT(test_bit(vector, desc->arch.used_vectors));
> +    if ( desc->arch.used_vectors )
>          clear_bit(vector, desc->arch.used_vectors);
> -    }
>  }
>  
>  static void _trace_irq_mask(uint32_t event, int irq, int vector,
> @@ -230,9 +225,11 @@ static void _clear_irq_vector(struct irq_desc *desc)
>  
>          for_each_cpu(cpu, tmp_mask)
>          {
> -            ASSERT(per_cpu(vector_irq, cpu)[old_vector] == irq);
> -            TRACE_3D(TRC_HW_IRQ_MOVE_FINISH, irq, old_vector, cpu);
> -            per_cpu(vector_irq, cpu)[old_vector] = ~irq;
> +            if ( per_cpu(vector_irq, cpu)[old_vector] == irq )
> +            {
> +                TRACE_3D(TRC_HW_IRQ_MOVE_FINISH, irq, old_vector, cpu);
> +                per_cpu(vector_irq, cpu)[old_vector] = ~irq;
> +            }
>          }

As said before - replacing ASSERT() by a respective if() cannot really
be done without discussing the "else" in the description. Except of
course in trivial/obvious cases, but I think we agree here we don't
have such a case.

Jan

