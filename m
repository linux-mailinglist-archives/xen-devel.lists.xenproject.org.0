Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3D8609AB4
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 08:45:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428734.679185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omrD3-00047x-Hl; Mon, 24 Oct 2022 06:45:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428734.679185; Mon, 24 Oct 2022 06:45:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omrD3-00045i-EI; Mon, 24 Oct 2022 06:45:17 +0000
Received: by outflank-mailman (input) for mailman id 428734;
 Mon, 24 Oct 2022 06:45:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ny4u=2Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1omrD1-00045c-Aj
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 06:45:15 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60078.outbound.protection.outlook.com [40.107.6.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6989e557-5367-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 08:45:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 06:45:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Mon, 24 Oct 2022
 06:45:12 +0000
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
X-Inumbo-ID: 6989e557-5367-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKkkkjPLMd4OdqLmfhSnGTUAxGF/hY3l3dwCfPFWivutOUMOk0h5IOcTFgdSlQNYavQwPoGbZyJdmr5RObYN/ngpQNqN+C4lT3HrIjBjCsrO5xW0HnvW91OAGEjRbh72ek7SkztqgCZCFEmxpgzy4eG+j0doUT97lgd5ebx2h7sysO1WRcpZugumQOkiMfR7V+EFGE9Yj8CNYlo7hBxGWLj1AYcB0gFKKabudA81l4k58p3kZB1wbo6oSe4oSoprO8MVHjOaAVL7Vfq6+OFWrANird+xCAwyZgn1Znw6sYMgjJZYlpr4MpWUuoNQ0KzFm154PnLb1BOZXTsC9oPtdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jmy7+wzwZM2+j3JxQJ8Ata5ltaguYsH2KHmX7vWAQMk=;
 b=DOnpr+kkbE+FhOP7n7dOMKIOofZJyC5/bhGe1ERcF5267e5LJb94rW3vgHS2gzuq5/q5uHwjceQE/L7ssBN6bUy7o9AQcELduMiYM2wYC7NvDSnbQUVFRcNls9BoLbufWZgeIZ88xQTNhTg1tehekMV24jh+BHMKC7WNiNHgU9wzGqL/xA6lwY6Uk4QpfuCoyEBP1ouFH9hT3hbk7+901wkJUlZt24xj8nhewn0okZ8otvPkznofTSSF/7ilx00NtUHtguKF3T2PeasN1/nIQls/FmuOWrVKObQQlqrhsfgBLHOHyQ515z8RRAaNTeYmGN2rtEKCiwYMLDeDBuPOVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jmy7+wzwZM2+j3JxQJ8Ata5ltaguYsH2KHmX7vWAQMk=;
 b=N+wjsZPUzbQkAxcwXDpF1xyn4GjHAwFyrQtyJx7466ggnppgwyNsSq9ilVIak6fwiGOsbdDYRfW4Mkb5EwaIEE6TONLfYFicQ/GyEM++7EdfZgyH2BrAnMlEdNCOwW+WLf9Jie8K8qn5KP3Lqaq4LGcJAjzaA+C0pX26zkwB3Q6/pwsqBK4//LahlCLQGKQdVKp2h0TNtkn7ZghweV6ja9U/mzhFSdzOU1OdYuWpShV7LpLFz8jFBD/D5V8e1GQXnf9qSEsi4S+laROpXRfjzVrVknb16P4pNo2V/kZQTVxpBBlA6B5vfd8q8X/sKhHDRdDWZs2BwliI4aqd+ellsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <435610e2-4fc4-6a9c-3fcc-c6d6ab42cdc1@suse.com>
Date: Mon, 24 Oct 2022 08:45:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: Intended behavior/usage of SSBD setting
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <Y1Eqk6D0dBDR4m4u@Air-de-Roger>
 <8c7de7ed-6242-f444-55fc-9eb16084b7bf@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8c7de7ed-6242-f444-55fc-9eb16084b7bf@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7930:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b8060a9-aefc-4694-db10-08dab58b4cce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JrKXQu///44o19u19y9ZIxB7MkJbqN7lL41iEdClaKokqQcxPXA+BTFJEg8R1d/YBOFuma7+mhwfIx3fUjIXAkX2SzhS4MGl65MYj0dKs9FjdLJ2K18YjmFA3L8LEOotZnT/UJ3TKE0+JAU6NBSDiNoGeuqSAb9zd6/0QHELzd9qXxhD1lERiecJP3DoCy5yXMib9lAgmAowiKOVPgeIYyzuRx2h6Wa8X0vW+OdYFb3aj7XhFFX295iCjcMd2fT+Di1TNA8/M66HleKVOHyMzzgMBOpEFYXUjt0nTl5HorHZzpWhzBMvvnk0rM4G6TvydePrueTiySoZrhfBnMdh/1wMvymKwaF+mDuv6mB+kFiLb4W+CZpMDJq5MLd4MUIYrD5xMUHnhoq/PSqCg34wk/z+tTEUZ0xGkKSCAClbs6b4teakeJnhIscZfh5uU/R+DehZgzQxUlKJuorvULdmM5jCB/EbOsepSwIXpEcbVkQfoNzM7cMUT8DPM+w/Fjd3juVPURBOb7krEZLI+S+iCSlnNSg41NfC+t8lUaf7fmACIzIh53FJmg5QZgEs233SY02TuewkV1l91yEiNobrPDrW9UfZAQsb4K9k9RReUNcNlbs47IFgbOYWDiYIgrIPhR7PGqOBmWpr4+p2wws3Y3zuR3q5TAX/w1A0sF2xFw9w1i6FwMjQunkqg7t0wFifMjUF3WMji/s4giSp5ASmdAxpFYGsRu6sv7sxvKPx+oXGLynJqqBx+k+Any25egImhrMJQS3cp5KStD9TaarKzCMUC9VHR0c8Kj88HaDG5eNm0nvAUe+XRBEn8tIaUWV59n4SCGDgJ872gLB1+iSs+Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(366004)(376002)(136003)(39860400002)(451199015)(31686004)(66899015)(53546011)(316002)(6512007)(26005)(54906003)(6916009)(36756003)(66476007)(4326008)(8676002)(66556008)(86362001)(31696002)(66946007)(41300700001)(8936002)(5660300002)(2906002)(6666004)(478600001)(6506007)(966005)(6486002)(83380400001)(38100700002)(2616005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUxRQ212elc5TkRDQXZORkZHVnVkNDA3TFUvZy85aGtXbEJVZjFDQXNRRlZi?=
 =?utf-8?B?ODZSM0ttbTRzcjhVU3AzQXl4WUpOaGtuZllJV09kQ0FHRVR4WHgvUjJPVVNj?=
 =?utf-8?B?eGhJODdQaEZubEYyMHB2T1Ewc2R2VlB5VWxCbjZrT090NStCN3g5UW9KZXhy?=
 =?utf-8?B?ZGF6WU5DTXhKbHZadkZuaFNpakl6WDBRbWVNaW5XMUdlSVdVbHhrMDBPeXMz?=
 =?utf-8?B?dFk3Y0xlYjlnT1Fra2llRUdYa2ZPb2NJS3ovaklZY05nalMybWF6UVpWYitr?=
 =?utf-8?B?NC9wc2dSOE0rd3oza0pWbCsyVzM5eEFCVDRZdnNXV1dabGdQM25mS2l6MTZa?=
 =?utf-8?B?ZTQ4UXViM1ZJNE5tU3Q2amdVSndOTHBFTGZSeWdlMmtQUEdWMS9uTTN0SXFY?=
 =?utf-8?B?eUNLbjRtbUVLc0ZEVFFpdXdpUXh5bTZlblUzaUhhaWtUOENlcElSR0FFclYy?=
 =?utf-8?B?S3NuMGlmNVdmb0thTmR1UFJQenlHc08vMk40bnJyaTZQWEpDRU1RRmZXVUVW?=
 =?utf-8?B?ZHZMUXludWtOU3A1U2w5UzBIWVcyaGZYVXRiRHdMdFlmbVF6SFhTTXRycFdu?=
 =?utf-8?B?SlN2UG56UEpIS0ZDa2VLZ1RYQ0FwZWJxaFRsM1dGV3VCQXlwNUc2d3BrSjh4?=
 =?utf-8?B?UEErWFJHaS9kVDZjNFR4bENURzc3dGsvZnFBZm90SDN3SWp6SkttR09GS1Yw?=
 =?utf-8?B?RFlDSGVDZngxUWZGYlVaek0zRVh5ZmNWdWFWU2EzNktSVFA1RzdxbUJJcWdU?=
 =?utf-8?B?R05XOVgxVWsxRlN3N2t4eG14WFN2bWlwWUhrQk1nc0krd05KODFGN2JCZGJj?=
 =?utf-8?B?V1JHYldhRHl3REhDVGd4ZE83OSt5MW1lNnpOWXZaTlBIUDBkbk5wMk5WWENn?=
 =?utf-8?B?cExaeld6RTM3Y3NXb0RyQ21acGhBM1k5V3BjSzhSY1FzUW9zVEtaY2cveUc2?=
 =?utf-8?B?Q0VrVjg0WFRzdFRacXNiT0ZWcnUybGVsakxrVmVzOWhkalJmNkdRM1oxOHkv?=
 =?utf-8?B?TFp2T2VtL1p5L3AvMzMzNWswVEwyenJ6dGk2R0wyeCtLMDFsa1lDTGpPUEth?=
 =?utf-8?B?WC9mcUZSMHRZOEc1NUlRc1FSbThKWmRaUW9CMTNCVmdLSkk5NGVrRzI3eEZH?=
 =?utf-8?B?Rm1sRDlZQ2I1UzFGVDVNUW1zZE01TVhZT2IrTDNCQllHaDh6Wk1GcG1MY1Rj?=
 =?utf-8?B?OU9ybVpZN0cwSElQVngzT2pDd20rcXBiK0F5dDN2QUZoMkJMOUtXWDBYaFZL?=
 =?utf-8?B?OS84Tm04WktSYXVQMXQ5a3dsL2EwTkQ3N2VKQ2Nqd21wTEFMOHZraE4vZE1v?=
 =?utf-8?B?aWhSMlJBUjVjQ0E3STlMYVNlS21SaEdZYko4Z3ZRRlVTZWNOU0pmRHJQK0s4?=
 =?utf-8?B?VEFLVThnczQyM3gyZlNtVUtING03Q0ZrbVBzNkJOa0F5UkhGRDJvMGhISzM3?=
 =?utf-8?B?MnpWem1sTmNLSk9jN0hKdDFVamxDVER4ZXlTMXZsL0FPeDhaZUhEVTk0cFNy?=
 =?utf-8?B?dWVmTmJ6NER0bE5qb2loZ0tiLytjdnZsSVBVYzR6OFA3aUp1K1E3cnhrVEZQ?=
 =?utf-8?B?UFRhUVVib1V3UEMySlN2WEZYRkVEMGFNdWd5WTdaMFBDMTRSNU9VaXBOdUIw?=
 =?utf-8?B?dHVEZjNJcHA0VzFUWDZUQWxjS3NHWU5KVm8yMWZTTUYwejFsUjkzWFhicURR?=
 =?utf-8?B?aTVrREpvN3ZPWmxrT3BOSldONzRyRm83VmFHSDhTdWRDaC9MSGlad08rNnJY?=
 =?utf-8?B?ajhvVDhyUTlJUStTazJzSVZjTEJmUHIvN1JHWUE1RFBvU2lDMWhQUGdmWHpH?=
 =?utf-8?B?bVdOd3ZPaC9JWjlzMXE1TEx5bnJrUkxUWXhDOEEvQis5Z0FJYVZGMVRteUxv?=
 =?utf-8?B?RXhyUUw0UWhIV0k5NDZJdm1sK1NTR2JkbVJvTGN3WWdhdWV3dGpLa0VkeXlH?=
 =?utf-8?B?U0hRc0gxWGhwcEJqTThRQStsTFdvUy84Ymd1b0V1dFZrWDlhR2E0NTg2elNG?=
 =?utf-8?B?SENxVFVrN214Y0IzaUE5bHVrdDRRRnkyeStJc1J0d25tQnhzUUZ4ZjVJNVlK?=
 =?utf-8?B?ZUpINWNoTWU3elIxVFYxdUNnV3JPZS9VVVhaQUx0QnlBNTVzWnc2TFVlWVZS?=
 =?utf-8?Q?OBIt5BvBbL++i6n0MwsPyNfxw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b8060a9-aefc-4694-db10-08dab58b4cce
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 06:45:12.1146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o44lrPBeHm1I90dVtAQpVu8NsUN/I25D9Oyh6Ee7eqNBvQlpzT2cjXdUi/jyktjm+Gx9VyhdR5scucqbO8wvpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7930

On 21.10.2022 23:54, Andrew Cooper wrote:
> On 20/10/2022 12:01, Roger Pau Monné wrote:
>> Hello,
>>
>> As part of some follow up improvements to my VIRT_SPEC_CTRL series we
>> have been discussing what the usage of SSBD should be for the
>> hypervisor itself.  There's currently a `spec-ctrl=ssbd` option [0],
>> that has an out of date description, as now SSBD is always offered to
>> guests on AMD hardware, either using SPEC_CTRL or VIRT_SPEC_CTRL.
>>
>> It has been pointed out by Andrew that toggling SSBD on AMD using
>> VIRT_SPEC_CTRL or the non-architectural way (MSR_AMD64_LS_CFG) can
>> have a high impact on performance, and hence switching it on every
>> guest <-> hypervisor context switch is likely a very high
>> performance penalty.
>>
>> It's been suggested that it could be more appropriate to run Xen with
>> the guest SSBD selection on those systems, however that clashes with
>> the current intent of the `spec-ctrl=ssbd` option.
>>
>> I hope I have captured the expressed opinions correctly in the text
>> above.
>>
>> I see two ways to solve this:
>>
>>  * Keep the current logic for switching SSBD on guest <-> hypervisor
>>    context switch, but only use it if `spec-ctrl=ssbd` is set on the
>>    command line.
>>
>>  * Remove the logic for switching SSBD on guest <-> hypervisor context
>>    switch, ignore setting of `spec-ctrl=ssbd` on those systems and run
>>    hypervisor code with the guest selection of SSBD.
>>
>> Which has raised me the question of whether there's an use case
>> for always running hypervisor code with SSBD enabled, or that's no
>> longer relevant if we always offer guests a way for them to toggle the
>> setting when required.
>>
>> I would like to settle on a way forward, so we can get this fixed
>> before 4.17.
>>
>> Thanks, Roger.
>>
>> [0] https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html#spec-ctrl-x86
> 
> There are many issues at play here.  Not least that virt spec ctrl is
> technically a leftover task that ought to force a re-issue of XSA-263.
> 
> Accessing MSRs (even reading) is very expensive, typically >1k cycles. 
> The core CFG registers are more expensive than most, because they're
> intended to be configured once after reset and then left alone.
> 
> Throughout the speculation work, we've seen crippling performance hits
> from accessing MSRs in fastpaths.  The fact we're forced to use MSRs in
> fastpaths even on new CPUs with built in (rather than retrofitted)
> speculation support is is an area of concern still being worked on with
> the CPU vendors.
> 
> Case in point.  We found for XSA-398 that toggling AMD's
> MSR_SPEC_CTRL.IBRS on the PV entrypath was so bad that setting it
> unilaterally behind the back of PV guests was the faster option. 
> (Another todo is to stop doing this on Intel eIBRS systems, and this
> will recover us a decent chunk of performance.)
> 
> 
> SSBD mitigations are (rightly or wrongly) off by default for performance
> reasons.  AMD are less affected than Intel, for microarchitectural
> reasons which are discussed in relevant whitepapers, and which are
> expected to remain true for future CPUs.
> 
> When Xen doesn't care about the protecting itself against SSBD by
> default, I guarantee you that it will be faster to omit the MSR accesses
> and run in the guest kernel's choice, than to clear the SSBD
> protection.  We simply don't spend long enough in the hypervisor for the
> hit against memory accesses to dwarf the hit for MSR accesses taken on
> entry/exit.
> 
> The reason we put in spec-ctrl=ssbd was as a stopgap, because at the
> time we didn't know how bad SSB really was, and it was decided that the
> admin should have a big hammer to use if they really needed.
> 
> When Xen does care about protecting itself, the above reasoning bites
> back hard.  Because we spend (or should be spending!) >99% of time in
> the guest, the hit to memory accesses is far more likely to be able
> dwarf the hit from the MSR accesses, but now, the dominating factor for
> performance is the vmexit rate.
> 
> The problem is that if you've got a completely compute bound workload,
> there are very few exits, while if you've got an IO bound workload,
> there are plenty of exits.  I honestly don't know if it will be more
> efficient to leave SSBD active unilaterally (whether or not we hide
> this, e.g. synthesizing SSB_NO), or to let the guest run with it kernels
> choice.  I suspect the answer is different with different workloads.
> 
> 
> But, one other factor helps us.  Given that the default is fast (rather
> than secure), anyone opting in to spec-ctrl=ssbd is saying "I care more
> about security than performance", at which point we can simplify what we
> do because we don't need to cater to everyone.
> 
> 
> As a slight tangent, there is a cost to having too many options, which
> must not be ignored.  Xen's speculation safety is far too complicated
> already and needs to get more simple; this has a material impact on how
> easy it is to follow, and how easy it to make changes.
> 
> It is the way it is because we've had 6 years of drip feeding one
> problem after another, and haven't had the time to take a step and
> design something more sensible from having 6 years of
> knowledge/learnings as a basis.  There are definitely things which I
> would have done differently, if 6 years ago, I'd known what I know now,
> and part of the reason why the recent speculation security work has
> taken so much effort is because it has involved reworking the effort
> which came before, to a deadline which never has enough time to plan
> properly within.
> 
> 
> So, first question, do we care about having an "SSBD active while in
> Xen" mode?
> 
> Probably yes, because we a) still don't have a working solution for PV
> guests on AMD and b) who knows if there's something far worse lurking in
> the future.  Sods law says that if we decide no here, it will be
> critical for some future issue.
> 
> But as it's off by default and noone's made has made any noise about
> having it on, we ought to prioritise simplicity.
> 
> Given that off is the default, but we know that kernels do offer it to
> userspace, and it does get used by certain processes, we need to
> prioritise performance.  And here, this is net system performance, not
> "ensure it's off whenever it can be".  Having Xen run in the guest
> kernel's choice of value will result in much better overall performance,
> than trying to modify the setting in the VMentry/exit path.

My takeaway from this reply of yours is: By default run with the guest's
choice, while (I'm less certain here) you're undecided about the behavior
with "spec-ctrl=ssbd". Please could you make explicit whether this is a
correct understanding of mine?

Jan

> Sorry that this is a very long and somewhat open ended answer, but it is
> genuinely the level of complexity I grapple with on every security issue
> in this area.
> 
> ~Andrew


