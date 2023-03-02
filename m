Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC656A7DE4
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 10:38:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504806.777201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXfNw-00065A-PW; Thu, 02 Mar 2023 09:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504806.777201; Thu, 02 Mar 2023 09:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXfNw-00061n-Mt; Thu, 02 Mar 2023 09:38:00 +0000
Received: by outflank-mailman (input) for mailman id 504806;
 Thu, 02 Mar 2023 09:37:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qSkR=62=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pXfNv-00061h-5Q
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 09:37:59 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20618.outbound.protection.outlook.com
 [2a01:111:f400:7d00::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea282a45-b8dd-11ed-96aa-2f268f93b82a;
 Thu, 02 Mar 2023 10:37:57 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8442.eurprd04.prod.outlook.com (2603:10a6:102:20b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Thu, 2 Mar
 2023 09:37:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 09:37:55 +0000
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
X-Inumbo-ID: ea282a45-b8dd-11ed-96aa-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRKqIzuUbZmY3Iis9/QOxqKv+x4LHXiODCP9N8P9V8a/T+lOTvqwqV+iZ20AUkPRUT0wAFCFnrr/Uq/WcqZENOoaaX0WQBAd2UzD7c3GThRLbJuZLKz/dja0bypxeDShRAzVSfd3Y9s0JDxxfxPIy7kB8jYsUzDlJ6jZmzw2HfAo/c9lgdKnyJMpP5ISbbDJANMv+cgmzvkg2knN5gRWRjY4zI2uTHPi+sDZ9rO1/IiNVTaOFYmX7zt0s50olDyFFW1Vsmad3XTzSFc0Gr80QdS40rHam+z6PaPRwh+ltgtweySC3pu44N9JlSrg6+x7o9t99G/WFKzs8q2Mch6JWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgIYHpzlVQY+EEwzlL4Wj+xWF+RXYB4tpjaGp5CPxH8=;
 b=Qb8sT6aqtcl0enuyirbhWna6SlsT+qEI61LOba0nmd4A/nR4p5XpYTMP/bDPjIpo4KL/WHHVVxfAxAntggfLDaOPYHmkskP1ErkgAHPzfXKdsav2HoQnkNvW51Krnuj2LaFjMcAuSrKeoz82MlDJsiRsNAPazCRZ+dDHEYw3jFyk6TlVP2eiMpdxfmTOysEA84FxDFCnn92IVtzz/m/geA3mL/uRj/9e4sBAOW+azcoEbjt/62v3NnukgSJHTa3lAsE9/mpMRr+cLDwzXadwwoKBH0+fKuZUzhufm7Ph3NJwdpJy1ZAaQ9SBJFgdDAIk6Lq67pv/3v8Em63JNN32rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgIYHpzlVQY+EEwzlL4Wj+xWF+RXYB4tpjaGp5CPxH8=;
 b=GIt2CIU9y5V+soRS4tRZXpEjfNZC3+mk1USnrANXhsCVxPveP/UfhY0yQz+YH7ovGloIhjrscDX+5xyEFm8R0mVfTiQJAcOcx1grP++ct9Ebfokv+aP0JvwoltYOnMckCg+Fe2G/e1Sh7J39h/0bsofpCtQmbolenxWgn8y5MQQjr/r+IIDyrifP6RDr0ejAZ1TRvAgMZUeEjZEhNwrZLK/oPd8FpppaXZABzkOwUFYiKsWPeBKHD//u39oIpVXderDfxQ0d9FUmEAxp4z2sF2ljdU1EYIH9H7JC5pKN/3djAp+yMNNxyPeFQHAJWxvXDe4cKyLTpzSTuh2jjuDL+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <86e64c27-43c6-6c19-0fc3-5980418fbb0e@suse.com>
Date: Thu, 2 Mar 2023 10:37:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] x86/SVM: restrict hardware SSBD update upon guest
 VIRT_SPEC_CTRL write
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <30a79d1e-c638-9e74-52fa-4cce53cd12dd@suse.com>
 <28cf4512-c92e-ee84-1c02-6af242b666cc@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <28cf4512-c92e-ee84-1c02-6af242b666cc@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8442:EE_
X-MS-Office365-Filtering-Correlation-Id: 111b58fe-5b5a-4c0a-5c5b-08db1b01cd30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+M/aGVcN22+o/uZjvdEdGgnPUD+jNL6O0K/7Fr4faQtxQ8jLqR3fNw3kwuqYDtLfgzIX5FhzWsK3YJDeziWoxqnxtxfrCoo3wII6lH/8EA+UhS44B0yhzQlwD744IWHOFzSsrLi9COqVLhk52dgj5qSBe022mDqKoOfxgYRqm78bU1dcsMtj9Fh7ti87twI56YeF8FRD35zCHgt3+KM2VkDu2QoGoCgYTRV7F4P1vCJApu0e9jsNX92CNJAZLbzEO+xv9TCgTsSQfhXU5/glUaRo8LqTmf8ta1Xgh+xELcLft+1nBpFa35UZAqDApkh4GbmRjFbcUdtmsRcnN7tXw8jAl3WG+rkGE+5QvC8E9FB5Olrj//h84no/0aX92nCGITaoAJTY7HceZQXMizhP2jnc87tLC+CUuhjQ+zytj95hQxmudzcL4bJDxDqIVOJ6xsVnwWN7fm5K7Gb+SE52QgFpDAOUKyYLwGVxb3jqu4k7kqGrh3BnPR7VhfOVb42BTZL8B7HjTc8N5L4VaNkzb2mQHTmTPSUP7e0UXgKPl9V5iKxj5zc6bwPElyTBkKjpvYlo1CXpk44d4BsmsC1gLFu0Ep42Z/gSXEAdgywJ3O4ZvPOUJpZejswsQszKLBdpyhfaYlYZG/NzKFLltd+EM0RVfrXV5Qjx0fsq6y7ADaMSnWeEXRkpvnTVNNeEKlkzc4RUV/D85plKsQOQKEDVgCZauk0cV803Lq1I02ovlW8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199018)(36756003)(6512007)(54906003)(316002)(2616005)(478600001)(5660300002)(86362001)(41300700001)(2906002)(8936002)(6486002)(66476007)(66946007)(8676002)(6916009)(31696002)(66556008)(53546011)(38100700002)(26005)(186003)(6506007)(83380400001)(4326008)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2NJczQvVGxIMk11MnFBdHJiWUszcVZkcTBEMUQ1ZU9mOFRXVjYxc1AvTGVy?=
 =?utf-8?B?NmdFbDFJQVRhdVlXN09Mb3NOU1A2eFovaWpzVTVOdm5vQlByamQxcCthWDkx?=
 =?utf-8?B?UzVRVVFPZVN6OXdtVmJsQ0U3M2FYTnFIcjM4YnNlOHIzU2pjZzdEenpockti?=
 =?utf-8?B?Vzh3dXBpZTlKYkF3VjlicVZMMDBrcG9CM0hrN2tubzNxcXFlY0FxdlM2Vm1j?=
 =?utf-8?B?ekJVRjBVdWtHaUZxVmhXVlZxSURQTGUrUmFoVlVhMHZaT2VLRURZb3E2ckda?=
 =?utf-8?B?SU9GR2VMeTluaGthL2tNYWoyejhNNXdsNi9JOVhCaEwxeWNnM3FCaUhCdW9F?=
 =?utf-8?B?L3dIaERoc1RzOW9nTzI2UitXK242dk13UnF3N05UZk5rMFF3NGFmZ3hUa3A2?=
 =?utf-8?B?akVPcEEwaVRrMExOMDczNGVyME00ZEVheHRhbDIrWDJMZ3E0Q3VCQnZQWXNn?=
 =?utf-8?B?SUFJUXY1WG9wUm5TcTdRYU9hLzBVbjlCbjFJUkIvNmhkcDhvYkpsR0ZzcWVZ?=
 =?utf-8?B?N1ZkMU4ySFBWRVJxaHlzb0ZiZ3AxRnRFNCs2U1ArankreWRwNFFkSDRjMzEx?=
 =?utf-8?B?ZHhsVnBSSU5zUXB1M3Vqb016dEQrckMvR25mMEttSTdPcGpoQ242WStxV1ZJ?=
 =?utf-8?B?eERnOWNtYk9zU0crNkZwa1Uyc0V5dkhSVmcvY3BFcmpCanh0NTZoeFl4bnU2?=
 =?utf-8?B?bGRiWE5MR2twdHlmczYvYVQvbnM5WnJ6WllxZnR2TGgzdG56OUp1UUVNSUFP?=
 =?utf-8?B?eXB4KzJSeldpalUvcGJCZS9Ob3RBVzRkUTdJdFI3TlVJWDYxS1lMaXJKWmtT?=
 =?utf-8?B?ZjZGWVNwWGlId3NPZldsYXJjT1o1RTAyWUptR1VXVlV6LzZubjNjOTFzSWtE?=
 =?utf-8?B?eVpVSXdoNFd2UXg5WkI2Mlc0OGZQd1RJMUVVU1NSY3hhRUl4OTV1YVB1OG1s?=
 =?utf-8?B?MXVNYjFob09vc21nOWl6azVMY1RIeTFPMTVJamxiVUVDKzhUWTlic0ljRnRO?=
 =?utf-8?B?a3orKzRsZ1RBNnVXakRzd3A5ZThGSWNWWXdYeGk4dld2UGl5RnZZTDJleGxv?=
 =?utf-8?B?T1huSm1ObWtuaStXQlgrcEdYT1RUUS9hVS81WU8xZkZxMlJDcUV0L1RYSWdo?=
 =?utf-8?B?T1ZaSjhDem9kaFQ1cElwd2NneVhUd2ZNVmc1UEJtdjJxaEJLYitHajdGZFRL?=
 =?utf-8?B?d0NBS2Z6N3JZYTBSSGtMOWhoNVUwclM0cGpKc3h4YndsTUpPelVpNTZVT2xy?=
 =?utf-8?B?eUNKK2JSTEF3eVlOYnhSS0xIck9pYytkcHR6S3dMZ1kxc2lqYXNPYUFraUxi?=
 =?utf-8?B?NlBrN3NHTk5OdmQ3bnV3SHNXWUlDaG16c3lvdm1uakpuWnNqSStsaWpnZjd1?=
 =?utf-8?B?ZGxURk9uemVRNTBlVUUzdlo1QkZ2elN2b1hrOXNqbDFLTFF4U3VzWDlqOFJ5?=
 =?utf-8?B?YzZsMDlKeTdtR0VmeDBXT1RiZmNIN2lnZzAyYnJwcWNJSmZRclh0Z3pzQ3JV?=
 =?utf-8?B?REhBb3lPaUpKYmhwUWgvT0Jpc2RlUlB2OHUwWkcrajloc2xuQ2xpbmEvVURJ?=
 =?utf-8?B?TVRUQzJaNFZMUGkwMitibVBlcC8vVlg3Q1hUWFhNVEhEbUZjV0VycVFrdnY0?=
 =?utf-8?B?QzlmTkxSK2J0SFVXbzUxb25DUnF1Q2RrczVZNXhBUXhzdmdIenVQSlMrREhM?=
 =?utf-8?B?K0p1bmg4dnE2U1Vrd09lSnZWd3JYbDR3WXpOUjBqTnpLNE4ycW40QlJRRFhi?=
 =?utf-8?B?aHMzaDR4R3J4dXBlTldhcGRsUnlGc1dYUTM5RU1pOS96bWNEa1hQWnBSaGlu?=
 =?utf-8?B?TGFnR0dvYk1vNTIyVEQrZU13c25Qd2R3U2pvTEk4UVVtRDR3UVdnL1YvWXRp?=
 =?utf-8?B?Umphb1FBQXl3V1R4QjkvTS82WWpzTW0zWHV0YmgxYWlBK2gxV1RlRnpuNTRI?=
 =?utf-8?B?cTZpREEyYk5OSG95QTZhWmcrRG1yOFVQS09QMDVzZjg1UXI0enUvZFU1VDQx?=
 =?utf-8?B?bDBaV00yT1BwTWdVZGtkTkdlclhDZWRMa01RcURhcEFWd3UzazBXTTBPd2E2?=
 =?utf-8?B?Z2tGUzZKRG5yTEJNUjhoU1JycVRoUktnVmQ0RmpndGN1aG8vSXRpNHVKakx2?=
 =?utf-8?Q?kVHKsYm4eRgburdniE46+6+1h?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 111b58fe-5b5a-4c0a-5c5b-08db1b01cd30
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 09:37:55.6191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gufsd9e3XBGWEDQUro2fK4WxvYr7XMH8B3otNDzfoEVJd8TNfL0/tYSoMaXhj+KDY1FdQBIMwYeROoL9yLb8cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8442

On 01.03.2023 21:55, Andrew Cooper wrote:
> On 15/12/2022 8:20 am, Jan Beulich wrote:
>> core_set_legacy_ssbd() counts the number of times SSBD is being enabled
>> via LS_CFG on a core. This assumes that calls there only occur if the
>> state actually changes. While svm_ctxt_switch_{to,from}() conform to
>> this, guest_wrmsr() doesn't: It also calls the function when the bit
>> doesn't actually change. Make core_set_legacy_ssbd() track per-thread
>> enabled state by converting the "count" field to a bitmap, thus allowing
>> to skip redundant enable/disable requests, constraining
>> amd_setup_legacy_ssbd() accordingly.
>>
>> Fixes: b2030e6730a2 ("amd/virt_ssbd: set SSBD at vCPU context switch")
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> This wants properly testing on affected hardware. From Andrew's
>> description it's also not clear whether this really is addressing that
>> problem, or yet another one in this same area.
>> ---
>> v2: Change core_set_legacy_ssbd() itself rather than the problematic
>>     caller.
> 
> I think this patch will fix one of the errors.  I've lost count of how
> many others issues I've found now that I've looked at the code in detail
> for the first time.
> 
> However...
> 
>> --- a/xen/arch/x86/cpu/amd.c
>> +++ b/xen/arch/x86/cpu/amd.c
>> @@ -744,7 +744,7 @@ void amd_init_ssbd(const struct cpuinfo_
>>  
>>  static struct ssbd_ls_cfg {
>>      spinlock_t lock;
>> -    unsigned int count;
>> +    unsigned long enabled;
>>  } __cacheline_aligned *ssbd_ls_cfg;
>>  static unsigned int __ro_after_init ssbd_max_cores;
>>  #define AMD_FAM17H_MAX_SOCKETS 2
>> @@ -757,6 +757,11 @@ bool __init amd_setup_legacy_ssbd(void)
>>  	    boot_cpu_data.x86_num_siblings <= 1 || opt_ssbd)
>>  		return true;
>>  
>> +	if (boot_cpu_data.x86_num_siblings > BITS_PER_LONG ||
>> +	    (boot_cpu_data.x86_num_siblings &
>> +	     (boot_cpu_data.x86_num_siblings - 1)))
>> +		return false;
> 
> ... this is nonsense.  There is no such thing as an Zen1 uarch with more
> than 2 threads per core,

There's no guard anywhere here against us running virtualized ourselves,
and hence this extra check was to guard against anomalous topologies
which we might be presented (just like we present bogus topology to our
guests).

> and attempts cope with it (as opposed to
> rejecting it outright) makes ...
> 
>> +
>>  	/*
>>  	 * One could be forgiven for thinking that c->x86_max_cores is the
>>  	 * correct value to use here.
>> @@ -800,10 +805,12 @@ static void core_set_legacy_ssbd(bool en
>>  	                      c->cpu_core_id];
>>  
>>  	spin_lock_irqsave(&status->lock, flags);
>> -	status->count += enable ? 1 : -1;
>> -	ASSERT(status->count <= c->x86_num_siblings);
>> -	if (enable ? status->count == 1 : !status->count)
>> +	if (!enable)
>> +		__clear_bit(c->apicid & (c->x86_num_siblings - 1), &status->enabled);
>> +	if (!status->enabled)
>>  		BUG_ON(!set_legacy_ssbd(c, enable));
>> +	if (enable)
>> +		__set_bit(c->apicid & (c->x86_num_siblings - 1), &status->enabled);
> 
> ... this mess even worse.
> 
> I am rewriting the legacy SSBD code so that it is fit for purpose.

I'll take that to mean that there's no point in me trying to make a v3
then. Let me know if that's a misunderstanding of mine.

Jan

