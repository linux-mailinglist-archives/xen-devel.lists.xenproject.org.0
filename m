Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FB779DFE7
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 08:19:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600968.936837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgJDL-00042n-AE; Wed, 13 Sep 2023 06:19:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600968.936837; Wed, 13 Sep 2023 06:19:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgJDL-0003zg-6n; Wed, 13 Sep 2023 06:19:03 +0000
Received: by outflank-mailman (input) for mailman id 600968;
 Wed, 13 Sep 2023 06:19:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgJDK-0003zZ-Iq
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 06:19:02 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7d00::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e474fe9-51fd-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 08:19:01 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8965.eurprd04.prod.outlook.com (2603:10a6:10:2e0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 06:18:59 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 06:18:59 +0000
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
X-Inumbo-ID: 6e474fe9-51fd-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EY+6TRDF6Owg6aEfuR7bhvavtP0Tec5qx3nwey6gQ+GOiHARhM5jWyHMMIq8/hCfpC+DkI9cpIwAGdqaQBe8BGz2+2IkBUuIP5UtX0gEWW8+LuiogtwnRLkdrMQpUf178zR+3fEuIMhHT/gVHHwFFEQKLLvYN3+99x+yPjrvI0EEJbSLsF6oJUnM4uHb1w5cPCcDOlqQkOi2k7q31x38k3Ffwdd7fWQUzCBleITgmCQSj3/q/Y1y/iZB22BbPUyxtHlEu6x6pvcsaywPcUPjghRSDZ8r6Lzf9bUaETNjBNoGJUHFxhWKjdatfCgCf2JJP4o1+1SdtjigR3+0UzmDdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKeRxAGAmMi/1vTc4qJyW5b1V/FPSZ/ubQxG9sGyjoc=;
 b=SKhYP/wMsbrQvAwlIix8+foXALXNsMSjSs0SmbAhOerMfrLDNsD6FutvUVINUUkXIbjiZRCUOG27tbNHNVSdeNrSZ2tyR5OsnWFKPqRHiYpMa59Hu2UwAQIDoZA774ypjMeT1nQWEMPHj08c/7H7XBBeP0/KT9Emw0atmRZuXU1Gen7WwK1sEVVvP+cipWgQTh/ZoC1pUnyzebLDBJDeFLQeNhd0Kbiz/22EAf99uAvJ8DBtDVQmWwB8sn59RkwKghS/+hidEIAQMHfkzKK438JJUKDflzteSlsBat16wNlTSGfFlnGH0IovA6gdFn8Ujp9I6SlYPpAoMNCOG3tilA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKeRxAGAmMi/1vTc4qJyW5b1V/FPSZ/ubQxG9sGyjoc=;
 b=a/vhKgrJceWRTdWimT3IjMaGcfDrq+LTipM6EMbdMwLm/CmeCVXl61p4k8bJQDOJTo02bVHClWJLVg6V8Hn7zswbyEskobl8cSjfhEwAMyyZeniiZ1Y9867w1+cU2OQ6tORBsw2iQGJXXzbn4XV8/jxPaOcgAEERMfIxs6sZpKevpVzMFltigtPR52zbBlNtZn6pOkTQdwUaqXL+lPQbVSV9DDT3PacvPZBcA+DEingZiUbhlBb3j2tRAFDlZxbvN+38X1r7TtfXQv2TEIUQb+KGf6ZyqUFM2FTtWIV04d7E5S5f8Deb+MbEjUjNLzkS8YrSMU8fnju3hOZ5FURZRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2cfcda8f-bd51-085b-997a-0ff31434d460@suse.com>
Date: Wed, 13 Sep 2023 08:18:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] x86/amd: do not expose HWCR.TscFreqSel to guests
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, solene@openbsd.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20230912162305.34339-1-roger.pau@citrix.com>
 <fc91c802-5f71-4ec9-8c11-68fd2c4ae672@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fc91c802-5f71-4ec9-8c11-68fd2c4ae672@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0222.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8965:EE_
X-MS-Office365-Filtering-Correlation-Id: dea80c2c-21f5-423f-face-08dbb4215148
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fayTWgAhYhMQNFSZVeqUmxP1+XyZn2fyrXMrz5h0GkksoODA/l6wiHYYZWpO/pLsn4yXJONuvIlerfMz7Ag0GUPuqzLUJWDw8T6t7xzpZs4i27kqIbnkbDaTBC62uymhlgYmy82O+mgrzTn4W8mw26NcfpwFQvNpKJZuKH0S/Pwmc/8LIe1i6BflUCsWuUyZlw0y+t+pyIQbTG7Me+5uyphGpDNN8KkDJNSRkjcwvVFsJxtEfEATJNlv1Ph76z0FpnpHA84o/D70Da0+k4mefRavzXX7LwTq5DjyCDO1Ljkfxic7sHhx3oItyfAWg69BNHe25mvQXLpbft61kWAd9kA5MS4AASAW9VN7fOy+P77VlQJpiny5xArgTYVJ+0h/gBKdSZNE27eltQ6gfrac9dZgeTIn0MKYYseNnxLNYVOd7ag3sHdLgrHydvwh+KoyY0uxyh4d00TzQbQfnDSbXVR+ebUTAOnFzCfSGCYbEe5ehaEaTlWSmdXvqYqu46NxgdVRVKY9O7isd9a67ixqt2rbJA/yfx1xAYuNNCTZ48uAhzjtk9pjOvjE5s6XBCqNZvgWWE3tlm1rBo6/P4Zf1OO3FTMa0FjZdhb+c3nhwoGGpKdNEorSfL7tDovoyB1mQKEG6J3Yk2vBF9aCH9ybUA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(396003)(346002)(136003)(451199024)(1800799009)(186009)(31686004)(2906002)(5660300002)(8936002)(4326008)(8676002)(41300700001)(66476007)(66556008)(54906003)(26005)(6916009)(66946007)(316002)(478600001)(53546011)(6486002)(6512007)(6506007)(83380400001)(2616005)(36756003)(86362001)(38100700002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWtYNGZRUnRJcnRDQVlyUzl3K2FHZUIzMEpXZXFmaCs2ZXRwR1B0VStNMk14?=
 =?utf-8?B?RUNObjI3QWpuRDgrYWFNVDZCRzNHUlZDdWZ0UVVwQWw5V2loVGhOb21YZk9E?=
 =?utf-8?B?Y3B0VXl4eHIrei9aWUdhT0dPbTNaR3kyWjZGSlhSckdScHRiZmVuaVFCS3R4?=
 =?utf-8?B?NnlyVHlDMkVEZFRDNGgydlh1RWtBWm93ZGJkRmNTSFl0Rm5SSURiSm1WQjJl?=
 =?utf-8?B?TmFuaUFpNXZnTUtINjAxWHpvUkgvSHRZUzFORDRud29qZGttZzhoSUJOK2FO?=
 =?utf-8?B?S2lRamNIRHlEME16cmlVQng2UG5OdlBDNEltYlFCaUx4aUJXY1QwZkE3ZEk2?=
 =?utf-8?B?cnd5SGFucFk3ZEx0cEUxNkJDVzNOSmZzMmkvZ0ZHMWRVMUJxcVRDUE5GOTJ3?=
 =?utf-8?B?K1lkREw5bHYwU2pxZXE3ZkdRZVdkME54cFhLQVJTNnBMNU0ra1JNdjJVdnJk?=
 =?utf-8?B?em5WTFAzeHBTVUo3M3VqdUwwMnBoY21udlBnTmg3WVdzZXpOWUM1aWh2eTAw?=
 =?utf-8?B?UDNpRmJKeGgyeHVMVGc0UlA0dEFKZkJNbDBSYU56Wk10Tm1lVXVENHRDZVp0?=
 =?utf-8?B?akl1eDdTMFM0L3Y2b3N3eVZlMmMrU1FwcVJiQkN5b2w5ZlJEV2J4RURSN3ZU?=
 =?utf-8?B?QlppSDBuNWtFdWxkS0RiSTFPRGJwN21lMnEveGhnTFpOU0FyYmRjc2o4SUpC?=
 =?utf-8?B?ckxEdTZnZnNpVkp4Ukt0TFpVWlZZRExoREdVbDlKdTFuSCsxOWNMWGJScCt5?=
 =?utf-8?B?dmg1SGR4c0N2VmtmejV6eWF5YlJSSlBMNE42ZitIN3hqSmp3dHlmN1QycFQr?=
 =?utf-8?B?RnBUZWdQNmVrWTNYSEI3SGxVMVkrbjFjaFZCZXMxemdsSjJSUGU0SExOK2h4?=
 =?utf-8?B?RFRJamU1VmNCSnRnLzZSbXpHWDMyajlXT2JqNXM5VWxLSzFQL2VvN0poRXB6?=
 =?utf-8?B?eTFIaVYxNXBSTENJUXI1NnV1MTkrN1U5bVNna0lUNUZSNzJsdVNHN3RHTytJ?=
 =?utf-8?B?aU9VekFRMnE1b2RGTDVQdG1qcUNrbmdzRHJjbUJtdTk4SC93ZTJtVzFpcTlF?=
 =?utf-8?B?Y05RNnhnMFUwVXh3NmlDU0l4eG1HSGxkTkRzT1NEejRONnlJc2dmeUJkVVdI?=
 =?utf-8?B?M3R6THdadVZKbHBrZURvbEVTb25GNDZCblk4a2k5TEZQd1lpRWM2U1o5bHBO?=
 =?utf-8?B?Z0lXV3UxMnJwOGRzckFadGl5UC9lNklhM2I3eFk2SjFBa0FEUXVxR2h3eHVr?=
 =?utf-8?B?SEVmQmhlOXdXZnFsTUYxZ0Vpd1BtaFkvYUxGOUpxN3RHV1dCNnpVM2JPWDQr?=
 =?utf-8?B?RHVFdDNDVXVUTEJpL3hnTmMwNi9NdHBqcDhZVlFNeTVxSU81MlZwSy9qQnV2?=
 =?utf-8?B?WkJxR1RhYzJIU1JaL1FKS3BPa1kwZFlzcU9NdXVWVWwxVi95dk9meHFmbmww?=
 =?utf-8?B?NkdOdVlrbGYybEkyY2s1K3NlcFFxZ1pteGJEbExHcU9kZjYvQ1pSSnE5akE0?=
 =?utf-8?B?VXVXYkk4T2daNDB1cGdHZFRvajBKVlkyd2pVbXFIeCtHekhWTnJEQzM2a0I1?=
 =?utf-8?B?R1VBOTUzUEpYTFVuUXVYRVIxWjRSM0dEMUZEdTNuQ0RxelN5OHFKN2d6aTdk?=
 =?utf-8?B?TTRSaTA3ckdHSGhuTTQySFM1Qi9xaGdZZzRnbWU3eCt5VEkvZ0xTbXA3eFQ0?=
 =?utf-8?B?azcyMWVlc1FvTk8wTDIza21HWnF4Wk0rWGUwZzZNeno1NjNvc2RWUmwxZ1ZV?=
 =?utf-8?B?SEdyV0NTbEg1WFNaWmtHMWJzSHRRai9nMDFCVU5SU1lQOGF3cWhsWk9zZmhl?=
 =?utf-8?B?akd6akJRTHFUQlMzYkpDWGZjMEVWNk9xNEN2Nlo2c01vR0dhY3NLbXJFQXpJ?=
 =?utf-8?B?K2FEeVNSdmluajdVY0tsblM4bHBPNkd0QW5Mem5mc2VhdVRVcGRHakZ3K05u?=
 =?utf-8?B?V2oyZ1dlSEtpMEV3bWtmd1J2blRwWnZOeGhJWnROTzJUbjdYN1MrTVY5ay9Q?=
 =?utf-8?B?dCtJb1hGVzV4WURJc1krNVd6eEc2YlEva3JhS215dTVKVXVTeEdvdk04OEMv?=
 =?utf-8?B?OTZpbS9YczNBdmZUWVMvV2JWRUE0V0QzT1dDRWY2M2xyY3RVSGQwVXY5anNR?=
 =?utf-8?Q?c5rJ+fNuDpcLqnjBIjC8rP+UP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dea80c2c-21f5-423f-face-08dbb4215148
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 06:18:59.4753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r0ah18erOJeJSy3mnOv072fFwM3muw69+QNTZoPnAPdPOVf+zsu4I0B5g5krAF8RdTgR0UBn/iZ0iV8Tp7DaBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8965

On 12.09.2023 18:35, Andrew Cooper wrote:
> On 12/09/2023 5:23 pm, Roger Pau Monne wrote:
>> --- a/xen/arch/x86/msr.c
>> +++ b/xen/arch/x86/msr.c
>> @@ -240,8 +240,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>>      case MSR_K8_HWCR:
>>          if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
>>              goto gp_fault;
>> -        *val = get_cpu_family(cp->basic.raw_fms, NULL, NULL) >= 0x10
>> -               ? K8_HWCR_TSC_FREQ_SEL : 0;
>> +        /*
>> +         * OpenBSD 7.3 accesses HWCR unconditionally if the TSC is reported as
>> +         * Invariant.  Do not set TSC_FREQ_SEL as that would trigger OpenBSD to
>> +         * also poke at PSTATE0.
>> +         */
> 
> While this is true, the justification for removing this is because
> TSC_FREQ_SEL is a model specific bit, not an architectural bit in HWCR.
> 
> Also because it's addition without writing into the migration stream was
> bogus irrespective of the specifics of the bit.
> 
> I'm still of the opinion that it's buggy for OpenBSD to be looking at
> model specific bits when virtualised, but given my latest reading of the
> AMD manuals, I think OpenBSD *is* well behaved looking at PSTATE0 if it
> can see TSC_FREQ_SEL.

I'm afraid I'm still at a loss seeing what wording in which PPR makes you
see a connection. If there was a connection, I'd like to ask that we at
least properly consider exposing PSTATE0 (or if necessary all PSTATEn) as
well, with zero value (i.e. in particular with the valid bit clear),
rather than exposing a r/o bit with the wrong value, upsetting Linux.

Jan

