Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2B75FD917
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 14:18:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421942.667665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixA2-0007Ju-Ez; Thu, 13 Oct 2022 12:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421942.667665; Thu, 13 Oct 2022 12:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixA2-0007Hx-B7; Thu, 13 Oct 2022 12:18:02 +0000
Received: by outflank-mailman (input) for mailman id 421942;
 Thu, 13 Oct 2022 12:18:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0LZ=2O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oixA0-0007Hr-DF
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 12:18:00 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2082.outbound.protection.outlook.com [40.107.20.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 076602d2-4af1-11ed-8fd0-01056ac49cbb;
 Thu, 13 Oct 2022 14:17:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9356.eurprd04.prod.outlook.com (2603:10a6:10:36a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 12:17:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 12:17:56 +0000
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
X-Inumbo-ID: 076602d2-4af1-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wi5MTCxbGA/TgCG4juV/wO81k/vJGicc6l1BE+5h+pKcg0+2GtA3UEq8XoPcjHtLkFVZWOT3PB5HoBulISsOJ22MuRNiVANmtonDU9ql5Qj3x9qxEa8rOjyvBUtXVes7PgfkmfyWjICW1x+TcHrMKz18l1oYEi7QsEQxeTpSjrfxXPJjbCPvVmOq0pZiJCKTFgap9h1BkLvlXb2pN9ImGQkQfEhcBPyhEnHfEt1EgbslO1trmLiWKpxjWn/PMZLvZHxhwupd38sMQq/fkp/0yDxpUGqbWoWtzL1p1/r5qCkAUsCmFEj5crEdWWfF+Lh42YHE8klmpT/nPQHwcKEe5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XK8Fk/3t/RkI2EIMqnqBUnpyCz21P1JM5Ws4hQDBe5M=;
 b=lny5LzQ+3Q9XchrBIbZKI5UFr3u0oIpskXlEzHxzLEueqCeJsOpKJwl7CF46knl11zSOFGAFIH3Nw+Jci3h605haw1Qk8rBnmBVSBEbFA8WiuY1oJ1SfXMSPcP76yJt+FdMy5L1UcwZGrbV6WJvuWq16APGoOkiRIr+iWugmtlZqoeYY2j0ALcCajBmLg5Ix6Ez7wGHgx0Rx6GWEQ7+jEyjZvzoFhDoNNzKXjzqjmXheiULFfoappnc7kckvJ0CwQa5RYT40yKdCvZo+T4u/gebKAwVQzR8I/nErXsrM+0imDNSRLDDFC5fjCjfIvzKE1pqYqa9BaEOz7F09xYGoyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XK8Fk/3t/RkI2EIMqnqBUnpyCz21P1JM5Ws4hQDBe5M=;
 b=KmHVJnlMyndUE1ZMz/sxyw/mVeqSeeXBexDPh0LXxZ+E8QlLo3FWHVkanTALW7wcn+aEVwTYPMZT4LOvI0rylEkWp+P/tu+WikNd8Pc1F9nMM+BL4xSHGpt6ZA1Su/Fmqptc4GiZAPD3P3sNKlTYIxOKt483Gb4ntSzLZ7mL91NJQ+C5NhTSk9tGBjdXFvHb4Aev3bGEzQOLeLDCwn4JuflnLpV/KI7LAokqVW6/KPRT8ElyP7O/PUItXEQpsZ5pt9C33urkHh7yUf5KaiU4Vepwc3pRCCXjGfscNC1LE01qEx+ufhzMaY9jVqmxxxjPx8Koy7ULh+I3BJHZkROquw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1867142e-ee46-daa7-c05c-04045460ba52@suse.com>
Date: Thu, 13 Oct 2022 14:17:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v3 4/5] x86/mwait-idle: disable IBRS during long idle
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
 <38839202-426f-eb31-2997-ef557ab1583e@suse.com>
 <Y0f+gL1PfB5lzlDj@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y0f+gL1PfB5lzlDj@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9356:EE_
X-MS-Office365-Filtering-Correlation-Id: c476a1ee-caf3-4842-b399-08daad14f5fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7P+qqHB/GpV55NXeMdCFFyuHSc51XvxrhRX2pdfb1UTVR31FKyk9gYW93+0FqlTthA5nYIhJLmayHZYu1ygp1X35DY6Ld5hfO6Z6TDOoLqBaZ+8BykNlM+BYDglzY8+VFO/4TT0O6fb+0DEtFisjeetKOWS7TJYA3H27WnRlpAo0o4g6K4SHRFdFONKPvkcXu1OunWONAF1tUjI4HRIF7tVwaME13HQhNgygEYzBWFAmRtzc6lFnQvnEcPaJceX3DCtnqVEY1FQNOMVCa7exJx6vyivJHpgP1jL2mP9GI0qyXNFCAeSyRtSnXlQ6DIaZoV5U8MDd3mdZTmqtu0saMgjQFtJMap9ms2irDNMcUPh/DpuA1k+JBXVKh8YRFLAU3D5RfRaJNoDRJYWVBAFDlAfQOYHQ+a6uCEmPyzF4YrP8BN283V7wBucuNlRjhO5cpqjHZS6Ds7m/pCvZqFgxLKdU4e0+WrIC+jbT7TAeEZxxmXhGeQRWMejldNjHwVh7BwhypycySCIyc2GgGlBfO+GaeF4LWvC6YwN/mnY7pLuJnMvhLTwsxkUk+9g1b+eU9Ol1XA7xp61AU0a/S2Ltl6mfFw5o+pQLjQ+49mHdf/9WdONdH7DxVfK78SpwoLUuqc18SraOUBKtJ61ZdcRPi/+gin96xhijnnoYAumXfqHysKqLHZWe5UUshV3MRrHX/3dYl9Ns31cGPnHJ8to8B4W75sThiR2tiPzA8WoKUueMN06SSM2FfbML0f8wAxqmFUbI4nrm0plZuv9hNUHouLuCb9klMY1dvozaMj6PaFk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(136003)(396003)(346002)(366004)(376002)(451199015)(31686004)(8676002)(41300700001)(4326008)(66476007)(66556008)(66946007)(38100700002)(83380400001)(86362001)(316002)(6916009)(36756003)(31696002)(5660300002)(8936002)(54906003)(2906002)(186003)(6486002)(2616005)(53546011)(6506007)(6512007)(478600001)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHdHSVZPanFkRFp4K3lFVVVqeHpackhXQm9KL1JmS2hCTjl1VDYyd1BRWjBS?=
 =?utf-8?B?UVpVc21xQ1gyTzdhWTJiaEtHL1VJb0FsNnp6d1liWnptVi9lTWJNbnlLSW5u?=
 =?utf-8?B?Y2ZDaS9JZUpMQVhXU0tOTm9WQ05lUUliVG9pa0N3cEpKZUJRWFFaQUxQMjAz?=
 =?utf-8?B?dEVPVDRqRVNjbzJSUHROY2UrTXRIaTZHZ3dzV202UUZxd3FqWlpEc2pwODdv?=
 =?utf-8?B?WlY5eXJVYXFOdmE0ZFVyWUNWS1NCbUlQUVk5QTYxcElCYm1wZ3Nyc1Yvb3Ru?=
 =?utf-8?B?SEVOc2Yxby9xQXVFSnBmTVpDWWZsd1RzUGM1Y0R6UGRpTkJHd3lIbWY5K1VT?=
 =?utf-8?B?MWxYL1hROVNudlBNMWtwZ0JnNm5mdWtyOWNtVEtoRC80c3BVTlZ5b01tNGow?=
 =?utf-8?B?MzVENHlsOWJFVmdwRFhmM2VWamZ5ZXFzZWRhbU54eTc1djk2czFwRC9jbVB0?=
 =?utf-8?B?cUljYitWSi9WTWJzVFRtemNYM1JXWkEvT1lXZkxjbEREYnRzRFd3eE83dSt1?=
 =?utf-8?B?M3VObk04U3pCYjRlZnk4V2Z3M1plZ09vYWVIcjJ6OW1ZYUpkTWxmTDF3blFW?=
 =?utf-8?B?WjJGYlpOSGtWVTJPd3FCaUpRYm1qdDJxb01waFRMWEl6WUtIdDJjaWdkblcw?=
 =?utf-8?B?NHY1Z2picXdOZGRiMEROck1NNWQwajZLRlk3a1RzeDZWSUR3b3cxQkRLbWhr?=
 =?utf-8?B?THduMndHYVVQek4wL2JLdEFDd3BTL1YvSEhUZ21EYVZ4dDJyTHZUYzhhczht?=
 =?utf-8?B?cE1Pc3pHWGxqUmkyR3Bhc0V0cGxOMDNZbG9zZXJPZ1FWS090OTI0aTMzbFUr?=
 =?utf-8?B?TFQ4elpYYU5CMzdPemoyZWpCaTRXUzVqcUtUdFhNcWRGMUFOVkRtbFVneHdv?=
 =?utf-8?B?QWc0VU1kQVE2ZDhDRmlGMUlIWHM4am1DNUhwMUljTzZpSVRSTzF6S2orajIw?=
 =?utf-8?B?QWRqRGtiVUxiVGdwM2NFdzlGU01jUS9nUDVLM1NNbFJGc3ZaUktZVGtkVFYr?=
 =?utf-8?B?RUlrZit0WE8vVk5CeUlCdThkTi9lckNETjY4L2FTa1FhQTFYSGdxTWhUeVBx?=
 =?utf-8?B?aXJQcEpXeU42Nis0dmN6d3Rra051czBtS3BMdlRjSmFla3VYcENmSlhTdzlk?=
 =?utf-8?B?R0hMZlhTTnZkRnVmeUdlbE9tcWVReXR5emV2VGxEeWxYWHRWNUZuTkhRblVu?=
 =?utf-8?B?UHJnREVveXFUbmdvWXhmUGVJOWJGcUtWci9UN081MU1tVGNjV1FuT3IxWkdM?=
 =?utf-8?B?RHF5eWxDMW5HMGhnNmNYK3hLQmQrRC82YlpYeVVEbExsWXlROEpvanZlWEZJ?=
 =?utf-8?B?ZjFRdmNsSmZpR2F5dHJQcnNmS3BiQ3YwWkdMWjZ5QTlzazhpeklCeTlzSFBL?=
 =?utf-8?B?b290cmhtZDdueE1nSHAzSEl0R3AvUEhHcXBsZTRLbE01QmhjRGRUVHNoRkk2?=
 =?utf-8?B?VnNRSHVmZmZjZFR1cmFxeXIwcXYrSDhyZ2grWEd6RWNVV2NUNHpvbHQrVlJi?=
 =?utf-8?B?S1IxVUp6d1dUVHMvUG5aYmIwWWlySERrYWFENTJQSUJGTFJNYzFJVVpVRzV2?=
 =?utf-8?B?TFdER0FDbEJqUnZwcmYrNEJsZnA5UjJZZEV3WVUwRzNPeUN6b1YvNHlMVEJ2?=
 =?utf-8?B?bWRmYTgwQm1DRkRBc3VOOUM4QklHUmEyUVRQUFpQMUVHOTFtaTVJR1hQWFpu?=
 =?utf-8?B?dVRWM1REY0hsTXl5RGxwZS9FWTN3MDdIMlY0TGZ1M0pCTkcxSHdrZ3FiVjgz?=
 =?utf-8?B?K09jTzBZUUg2YzdDR2hMYTJmN3pNWXNscXlQWHkyYk5kaGc0MTR4ZklYMnpt?=
 =?utf-8?B?R3FPcUtlc2lLWVc5Vng3dkZRWWlEd0FSK2MveGYrbUhkMGQrN2NrUDMvRzhj?=
 =?utf-8?B?QXk0VXpQcVlsRHhZOGtOQ2RnbzEzSlNXNkszcmRwaXBNUzdwVGZOdHJoZlBF?=
 =?utf-8?B?REl1VHZtZDQ2bUdVSUZIVkpobWIvVnBxZFBMOWpRUUlOS0I5YkwzY21UZWJa?=
 =?utf-8?B?UE11RXFGMmFTZTlTNTZGMW96NDJsNy95OWlaYjBHUlE5RTQzRHFjSjdSbXVl?=
 =?utf-8?B?TS9hZVFzN25nUDVjVngvenBFek1tejNxK1h0VEhWclNsZGx2bWFGQWpEM3FT?=
 =?utf-8?Q?M7RYXMfSjhg8JOPn4/OJXreRv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c476a1ee-caf3-4842-b399-08daad14f5fe
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 12:17:56.6595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nc+iqkEywo8/GyV39rUhJ7HGIHUb0vjiouoxvbx5gNa0mV1H/BU/F0peUZktgoVddcTmel/P8Om44Nb3XCAafg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9356

On 13.10.2022 14:03, Roger Pau Monné wrote:
> On Thu, Aug 18, 2022 at 03:04:51PM +0200, Jan Beulich wrote:
>> From: Peter Zijlstra <peterz@infradead.org>
>>
>> Having IBRS enabled while the SMT sibling is idle unnecessarily slows
>> down the running sibling. OTOH, disabling IBRS around idle takes two
>> MSR writes, which will increase the idle latency.
>>
>> Therefore, only disable IBRS around deeper idle states. Shallow idle
>> states are bounded by the tick in duration, since NOHZ is not allowed
>> for them by virtue of their short target residency.
>>
>> Only do this for mwait-driven idle, since that keeps interrupts disabled
>> across idle, which makes disabling IBRS vs IRQ-entry a non-issue.
>>
>> Note: C6 is a random threshold, most importantly C1 probably shouldn't
>> disable IBRS, benchmarking needed.
>>
>> Suggested-by: Tim Chen <tim.c.chen@linux.intel.com>
>> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>> Signed-off-by: Borislav Petkov <bp@suse.de>
>> Reviewed-by: Josh Poimboeuf <jpoimboe@kernel.org>
>> Signed-off-by: Borislav Petkov <bp@suse.de>
>> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git bf5835bcdb96
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> One unrelated comment below.
> [...]
>> @@ -932,8 +939,6 @@ static void cf_check mwait_idle(void)
>>  			pm_idle_save();
>>  		else
>>  		{
>> -			struct cpu_info *info = get_cpu_info();
>> -
>>  			spec_ctrl_enter_idle(info);
>>  			safe_halt();
>>  			spec_ctrl_exit_idle(info);
> 
> Do we need to disable speculation just for the hlt if there's no
> C state change?
> 
> It would seem to me like the MSR writes could add a lot of latency
> when there's no C state change.

HLT enters (at least) C1, so is a C-state change to me as well. Plus
we may remain there for a while, and during that time we'd like to
not unduly impact the other thread.

Jan

