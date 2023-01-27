Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CEE67E871
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 15:38:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485707.753109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPsA-00083Y-Kf; Fri, 27 Jan 2023 14:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485707.753109; Fri, 27 Jan 2023 14:38:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPsA-000815-Hv; Fri, 27 Jan 2023 14:38:34 +0000
Received: by outflank-mailman (input) for mailman id 485707;
 Fri, 27 Jan 2023 14:38:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N8iV=5Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pLPs8-00080z-Tc
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 14:38:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062.outbound.protection.outlook.com [40.107.20.62])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44f3c0eb-9e50-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 15:38:31 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7718.eurprd04.prod.outlook.com (2603:10a6:20b:29b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Fri, 27 Jan
 2023 14:38:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.022; Fri, 27 Jan 2023
 14:38:29 +0000
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
X-Inumbo-ID: 44f3c0eb-9e50-11ed-a5d9-ddcf98b90cbd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wt0I0hi+jjNKJMCjnzU6WZUofTVJTzzLxEopDiKZrrM2DsVUqID+pojOoDQJM0juCRrlrz7Cd9PDaTUYByIuOCl0PBGeGHNR0qhmoK4/j/XC4o6LYWQfbxekrzxe6pOLvpa1P+Gxu7k47Y5/b1NJp+TWU7DIj+d51fvN7PPS1bLC9+jArL4BlDK3fp9KlUWnMgMVUSkN4vVw4pmGwc90lyq25o5qUJZkvTXfWxyv7JGO0bChmfP8EGQAhM/h3eRNInYDPfN6yjrsTGfU9yEBX/PlCRLGZee98cm/GaWjGdqrRshxn2+Y2TAfV4Y+L9vltDV74HLelAG3bPE0c2O5yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QvJmfmMFfgX9QdUHG4DTivp1ERMM0wHykiRs3uyy0gc=;
 b=EZGUJTrdisPLHg1xXNgL8yYP3TY3oaE2xJBVbIwMKbPxE7tXVmLP1hjgg0eJdnz7Z7o+udAZCyZ2nRgvkpwV2fN+KnTjL0uXxZJDysvLWfgMPiRrwvq4tIU1IIPDXss+aZtwOvsm37E6WtDM4SdaJOXbnqVjuQAavAKXSiCiTaj/a2ffk5ut0eRYa5oHmSOE1S7A3TG+RasK/XP9roQpgp+UXIldueGPbhIBhXlAzYkL6lfFF3kr4Q4UFLtbKoKThLWM8+FmKhiC6RapZaHzIQJ7U77rx/vfWg3W17u644scFr9Ier5X3DQsnSygzPxBrF9UvqfqJqdpI/ifAYkKHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QvJmfmMFfgX9QdUHG4DTivp1ERMM0wHykiRs3uyy0gc=;
 b=Io6yVOqrGYajrJOOhSsr4FSunkEwoueu3T5Cc/hU0YRZi72RZw8FQYVk6zCr0Mme3r/RP/bqELIrd0KAPSwX9xpZ/IElx9bU+bdMrx6YeFkIuwR05tjNt8qxcvlKuw3M/+c/kU3V8A9sDQctvJV5yj+sSozrG7Z5nY1J00smm7SXuH9zmzcwCXqW7EXCVoNRXDglYfiNNDWLNPoNobyF3JMS1KQs5atvtOw9k0zgPsiNVHUdLlyv8mfgkY9dDoaW0iiKmDAJ88Hy5W2Dt3ZTRb3CcO+yW3YuCAn6/3rdRumNejdsYXUIAVftDOsOqLV+T1rdj9KDx4WvMRM+EIjHkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <13f10201-6d81-3ed3-96bd-15996d417855@suse.com>
Date: Fri, 27 Jan 2023 15:38:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 12/14] xen/riscv: introduce an implementation of macros
 from <asm/bug.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
 <06c06dde5ee635c6d1ebf66a8cff9e7e1f4fbf5c.1674818705.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <06c06dde5ee635c6d1ebf66a8cff9e7e1f4fbf5c.1674818705.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7718:EE_
X-MS-Office365-Filtering-Correlation-Id: 59fb678b-4c43-4dc8-357c-08db0074285d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2kEoJ5Ei9oSqbwtBvA7yiI2sh4vHa+4gZnsadjwEHiYrgHdRKe4jIR9ds9KUJ9+qcbmpiSv+M+KhXKIACUY/D3TUty9aAQ2x9TffQLc9hmahMmemZmTe21AyvFc39iWDoJfxsvCLd6rIEeWEX+JXKP1ART6NkYFm2jcOnyjgXw10luBqqrEF25IkrVgFAZKzlKEI7k8msVxaDHh1RoHIuoVLBzACxGmQFD1WaKqldqYXdX7/BgOEkoWqPbzrB0kwlBtdYBiN0ZZDFGQZexKh24nXls+MVfwpVqC0syvBCEJviBCh81102e7DTXW1I2T8xZR7gfs6i/vt/aksmvJlqcIypiEBGPHnC1Zi1o/aoE7oc0rU3g4n04qfJzJ6+fRNj2uV85NZ4gWlk84H+LkPyNCxaBy/n4dDCdFHtC8n80sYhR0w9IufvpJpr43hq0szQHYNK3jssKtrUe1wBmi3vqUx8P3BFldCnH20AiJdSXI0ubq2bHPa/rH12wOTHK4vjzfRTtjU/qBSnP1NEo+hFboHbsl8ayPXX2UnadY7JNr8eYeTcaLQTrrOfgliS8R4h4RIRLoPIP+4z+Bq1c4UjjcHo/s3ZWZNQHCKy8r6KzCxFuBcKg6kLVm8243M6csVnErq6eMwVMakHNNICY3bk0ogKD72ZWNCAD/q7eVdwf4gPWqiCakMPJWbs7HXPsqTwSno/QnDe0xSIWYfev8kxpjZ8rPom6sTdlixyldHj8M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199018)(31686004)(2906002)(36756003)(4744005)(5660300002)(86362001)(31696002)(38100700002)(4326008)(66476007)(66946007)(6916009)(8676002)(66556008)(41300700001)(6512007)(54906003)(83380400001)(53546011)(6506007)(2616005)(26005)(8936002)(186003)(478600001)(6486002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RE02dDZvekluOWlWZmNUQ3dieVBaem1BV1cwVXNIRXE4S0RjbWRreG1VVXVJ?=
 =?utf-8?B?eGI2dHc4TDJHZXJUM3dWcFViU0hrODNPUTVVTjFLeTJ6cXdzZThUcWVqRldM?=
 =?utf-8?B?eUJjV1FydGdOdFVtYlc4azlwNTRkclAyVmZhMngvUDBkNEZ1aklYSWd4ajZP?=
 =?utf-8?B?MlVYMFRtSGsyWS9sMlhSZzRWZGVPM3ljeFdLWlAzM25wdEg3cERtcmppRzhj?=
 =?utf-8?B?MHJ3N01walFRb1JSM2VnRko4ZTBzdzhHcGEyUkNQR0FWZlArVnRUUHBxSWZr?=
 =?utf-8?B?NTRzcFdobkxGZnl0VHphRkcwUHFxZ3YxNlhYTVFVZVJRV0hMWEpsWU5pK1po?=
 =?utf-8?B?MlZDbkpvNmo0RHF2bWx3cWhyaTR6TXBlMUFrb3VZL0djblc3SDBZZ1ByNEdt?=
 =?utf-8?B?SEJoTjBFcXZZOWtNQTFkQ0QrSEZhS1dBRXlKVSt0TGJ2VC9zRDFOcDZSbnVP?=
 =?utf-8?B?T1JqWENNeUM4Y3pNRERrNzJWQ2N5Vi9kTjNGUHBWRitwTTFCTUNQWkc5NlJx?=
 =?utf-8?B?cVN4akN2WCtxd0NDRzlGcWdPS0pHNGI4Q3V4SnA1Ymk4cHg0NEtUU2tBVTFY?=
 =?utf-8?B?TElYREFMNml3NGJqN1c3am9KT3JmN09XNnY4NmJESHdJVnFuRXREd1kwNXFh?=
 =?utf-8?B?VDZjZUUrbjJQeTd0U0VoVUQ3eDI5SjdqTmZGTlpobUN6TUFoYmJ2VmI4YWN3?=
 =?utf-8?B?NlUzRk9nTy9FSi84YitRNktJbWJ6TmpnQWZySFBiTUZHdWdLbWszTDJMVTVt?=
 =?utf-8?B?YmdoQnJLN2dGNTExditrVUl3TFpSZ0lMMzhiNFNydjEwOElKWkdUV2NmbWpi?=
 =?utf-8?B?Q3o5ajBialMrS0ovSlJpelJocmlDSHk4S1JnclZINnBiaUdLeGVYeTNpOHRh?=
 =?utf-8?B?UVBueE92NjF2ODFYUUl6VDdOQ09VZk5XUmpldkdlcWpBMk0wa1FZM1lmbS9q?=
 =?utf-8?B?MU5wZ01rV0J0MUtZMXh3c3plb0p0RlNMOGovNXNLTkFxSFNIQlIyRFlkM2pZ?=
 =?utf-8?B?dnNhSU15UVB6UW5rOTVhWTRoUW9SMGFqUmo0UE1UbWpSdkdLSCsyWUZzbkIx?=
 =?utf-8?B?aEZZbUxtU1Frd1IzdFFvd1h4dlFTbjFwVVZLTGlPTE5iMG52L3BxbDBwN29p?=
 =?utf-8?B?SnA4QllZVFNra1Zua1ZMR01IVUd0eWw3RlpNMUhVelh5ZG5DZXYxUGxaUkcr?=
 =?utf-8?B?aytyNWRTbnlBRFg2Y04wYWRWVVV5OW5OQ21qRDk5MlY2VmZOMHJwM2gwaGVl?=
 =?utf-8?B?UGo2OFhYZWMyc3dUWmgvaEV0c3BNMmJDMXVZY3hGSVlhVHVuNlNncURoTEty?=
 =?utf-8?B?QUdRL2J0eW9razNYaCtmUU5GcXhnT1ZxYWVRaG95bXlUYU1RNTVFaTdld2pC?=
 =?utf-8?B?eU5HUXNmakwzamZQaXJOZjlWSDRqWDlUSExJZ1daeHgvSHhzYUk3WEFFcGJX?=
 =?utf-8?B?SHpIcnJWOW56NjlWWEhiVEhhSHZSVWNWb2k2dTdBZHJ4VmFpeFZhMkhKendq?=
 =?utf-8?B?S1JQQldMNXBlY2xrUzBmOVBlM0ovUlE5bUxXUm1ZN2FPbURSK1crc0Q4OHdm?=
 =?utf-8?B?ckRaSzEveVJIVTNBKy9VT3R5Y1YzaVlsaklUL3lGTGNKcklKR09WUExkMTZq?=
 =?utf-8?B?WDhtb2UyUjR0dFpOVitRaTBzOWxMWFZLbXRxSjVNTXo2ZHhmd0xhVExLWjJ6?=
 =?utf-8?B?L05yVUtETG9tMzdza2ZNbHh0bW0xVjZ4a0ZORWNhaVQ5SS9qbnlHbnBTRXp6?=
 =?utf-8?B?Y2lkdGJ1dXRHOFNFaXhnK3ZvSUc3UDBQR052WFV1QnVIbTVpenBqVWR1eDhU?=
 =?utf-8?B?QUd4eWlmNkVuVlNjQVZvaStZMjNIRGxVREVYeTg1MlduL1E3MmFLdWZvd1ow?=
 =?utf-8?B?SG9DZ3FuQXpJOURoOGt3Y2hDanVYWlVQOWJEdVIrckx2S1IrUUlicUExNk5I?=
 =?utf-8?B?VVUveWNXZXhpWWFNOHQ3ZzgwOVdxVExvaTBrM2g4OGMxOHRqbDVsTkltTi9O?=
 =?utf-8?B?RnFMdVJNT1ltZjRrZ1d2UFBneFRqbGtmSkMxSzNVbDNQUG1HT1lER015SER2?=
 =?utf-8?B?WUNPNHV0dXFWRW5XSVhYaFhINTZjY2dGQ3Foeis5Nk0waklhWUhsMHFhY1No?=
 =?utf-8?Q?sRw4D5Er7mxs95jmgLoaMSyIn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59fb678b-4c43-4dc8-357c-08db0074285d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 14:38:29.8023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WAmAtHvm9Kx5unO5lMN7LSNrFXv8ynkcL0F3ODD2S5bZGSkKcafuIAkGUmYmjQxbVpVp82Ikf/c1iVMnCrcEtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7718

On 27.01.2023 14:59, Oleksii Kurochko wrote:
> +int is_valid_bugaddr(uint32_t insn)
> +{
> +    if ((insn & INSN_LENGTH_MASK) == INSN_LENGTH_32)
> +        return (insn == BUG_INSN_32);
> +    else
> +        return ((insn & COMPRESSED_INSN_MASK) == BUG_INSN_16);
> +}
> +
>  void do_trap(struct cpu_user_regs *cpu_regs)
>  {
> +    register_t pc = cpu_regs->sepc;
> +    uint32_t instr = *(uint32_t *)pc;
> +
> +    if (is_valid_bugaddr(instr))
> +        if (!do_bug_frame(cpu_regs, pc)) return;
> +
>      do_unexpected_trap(cpu_regs);
>  }

One more remark, style related: Even if some of the additions you're making
are temporary, it'll be better if you have everything in Xen style. That'll
reduce the risk of someone copying bad style from adjacent code, and it'll
also avoid people like me thinking whether to comment and request an
adjustment, or whether to assume that it's temporary code and will get
changed again anyway.

Jan

