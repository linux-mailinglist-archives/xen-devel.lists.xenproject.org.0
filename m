Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 063AD332752
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 14:38:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95407.180076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJcYn-00030Y-6N; Tue, 09 Mar 2021 13:38:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95407.180076; Tue, 09 Mar 2021 13:38:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJcYn-000309-2y; Tue, 09 Mar 2021 13:38:05 +0000
Received: by outflank-mailman (input) for mailman id 95407;
 Tue, 09 Mar 2021 13:38:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eWC+=IH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lJcYl-000303-1v
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 13:38:03 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f49d382-7adb-4f8a-b1c9-e472c7737615;
 Tue, 09 Mar 2021 13:38:01 +0000 (UTC)
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
X-Inumbo-ID: 6f49d382-7adb-4f8a-b1c9-e472c7737615
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615297081;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=3bEL2A+MLwTW/Y798A+cGhhf/Al0mXULZFYe4skDu4I=;
  b=CYGYiwZxGpXJY5SfxMYOhTSuDNOQ2h+ZpmDrjbpg/K4QIiWSORFojBj2
   uawZIRfalLYs9hMNbgXVdViVG7T4IJX3fI+pt4F3pczbys75agVxbeC+j
   76t6yDChoXoQViAataVUxXhR+DBV+RlU1/nNcoQmtFDbsRhtjTGxiwTOx
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: BwlrfIMfHzlx/G5kgxfLelN8RvCLGyOU3tf3z3K+kHyJUl9fz6fTuQ/w8tDILtKXZoFoR2p/Za
 lpm6Sc5bex84shIsQcpX5bwuITUzZGzVtBPQEQNTTTi28x77d2PdzlXI8KN3YQ2GCSXXri5VkN
 9n/8nQqJOk44ljfgdl74+LokvBtHSwRv8snP/4YJEINykDChv+TqftBotIJY1ZeeobxQIeJSfx
 YFTgFkohX5PFBoLyimMj/K5QIFboiuVXejt5+s1cTvp8lE6imJ90wIys8/IhHgwQ1WSaiZ+cmb
 r+Y=
X-SBRS: 5.2
X-MesageID: 39225112
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,234,1610427600"; 
   d="scan'208";a="39225112"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7PevGmM8R7+5UPLV3+278jdZmUCAgOWeV9c/jgpe5lbV2wjLQOS9yjVoI6HaeKkTK2QhfOkiXdlqBlReEkWOi+E3FkwPOOj6Okz8JJ/d9JpjPnwdbVzEb2ervVDfM17CD9mck975TfsGkUAD3o9z/9vv3rcJ2vfih39N+HNWVQDKNIREqD8IqTPGRycadGRCxwfwlHSGIKBmJUAgacYUt8Hs25ai4dTqYuaD6MpxEIrkiM2nyNJ/2sQf4Jhf4JYoIu0D7Kl3SqOQiHWGmlHvluQPOkEOE/WbDMhvG++ojtJrxqhCx+QD43BdzrMxdMoVcnjGQOvsSEEXkOqbAlBwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alF45HQ5axwzrc6bUdHsxP5DQ6FffPvfjqmYhZ4KiCM=;
 b=g9Om+sgdmZVEcoy/vUVlnXbmFhdyOVqprxKjEAKtKgFXppRdkkJ+1ctsn/tw4vjbkO8k9EcY3GWUoSpW9kuEf64Z3FqOoPNQ9TKo8oMdUe4buQt/sOxRRLy7OrQzLY1gszlWRhqpBHaB43og83TiwYjDQSfXwRf58VPc7fUCSGlzHCe67qGMjYzBQDvCuTF9lhftG3aD7GNHHpXqfgy/Pl58XS4+m+7MokzEwbNhVnPj2oSalFtek9H83viIK9ukKxZO7YzVO2YgacecRimHbkiKGxNKn7kms6AepKddKD3tMg5i/ermZfEy65Y8TBT395KxD78fJp1Is5scznSY2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alF45HQ5axwzrc6bUdHsxP5DQ6FffPvfjqmYhZ4KiCM=;
 b=GaMVL5rFwUsXi5fNMIJaSN0SZNqDXLXnzqA//8xMl810XdpQYROSujvwZcekz91yLkHAFj2zeGDzG+2r6NX2pUkGZMZAPyEpU8Lyucd8SuzjG3MogatuEXakPhRPulOnhK+nTKzaZD2qGC8JL1q3R9/bqDLtl2icAwP73wwBjdY=
Date: Tue, 9 Mar 2021 14:37:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [PATCH v2 1/2][4.15] x86/PV: conditionally avoid raising #GP for
 early guest MSR reads
Message-ID: <YEd6GTXJqRIjijl6@Air-de-Roger>
References: <f5f17207-b601-2909-8a5c-55276e734272@suse.com>
 <d794bbee-a5e5-6632-3d1f-acd8164b7171@suse.com>
 <YEXmvp02UvvY8Fve@Air-de-Roger>
 <1f19ced7-183b-8f08-3a90-c06039e053a6@suse.com>
 <YEYUbGw5J1VMnuxd@Air-de-Roger>
 <b8ab7ac3-036b-d226-dc82-c61bf42f13d6@suse.com>
 <YEdLO04upNrxNTmI@Air-de-Roger>
 <204d73ec-a46a-6cef-9bc4-4219a7d00350@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <204d73ec-a46a-6cef-9bc4-4219a7d00350@suse.com>
X-ClientProxiedBy: LO4P123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a61d2e5-25e5-4221-000f-08d8e3007f02
X-MS-TrafficTypeDiagnostic: DM6PR03MB5084:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB50849358D81BC88AC5AF83E58F929@DM6PR03MB5084.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oQB58O7KZOJJPA3GMmcJ3ejghv5hAr815+AEt7eZyo+R4wK07KhjeZkJpl7i/4FQO62QXB/9CKK4HKdO6Dcu5CFbs9DkAzeuLYtsb7PfnZH565K5B2mv8rTy/3ji39cmy1P8ot4jg9c/fed1moDmc+8kSZoxSzAI+bujyi2VL6G9pj5BqP7yZFvnkvXplHGwfONzeFjGLJT/Jkx3nR0AJgrTE6ptvT/8eUdczWWbx//zJ1pYZMkj72NAXy4wavzhKUMY8u+m6+2P2WsPxRRtfx1UgVmFao96bX9mRgcn/AVCkG+7K1kk0VfRsfmaMD2V5r2ECopBUdKGJKrhH/bLPCu5612+GLKW+N1rjxu5GKvZZhYI5GBcH2WnyKvfcIaGZ/uDhAJcjFLkpYuCxjknIh8hey3U2cUcWp9een6FIS7vO1G9AdclKluy7jwG6ynh2UsUIcx7CaK4gUG6wj0Ur6O5YwX6HN0kmi1IdOe7GXTT6Wni1SlZP9LwaQvWsRAkmakHTL+efFtqaHbekWzhyg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(39860400002)(376002)(396003)(136003)(366004)(85182001)(5660300002)(6496006)(6666004)(66946007)(66476007)(478600001)(66556008)(86362001)(53546011)(54906003)(8676002)(8936002)(6486002)(4326008)(9686003)(16526019)(186003)(2906002)(6916009)(33716001)(26005)(956004)(83380400001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZGNmb2xSdk03SmoxVmdzRnA4bHZBcGlramFUY2VKRDRxTUd5TVc1cGVINDlO?=
 =?utf-8?B?TVhYS3luclVKVVZKL2tKOXN1WVV1blA0YUhQb054TlJmYmdST1FBU0pRcFZw?=
 =?utf-8?B?d3NFclJxQU1lamJxVzVveVg1bFBEOUFWcFM2MWtvZlRENUg1a2RuOXZyY1Mz?=
 =?utf-8?B?WHQ4dkNycTA2ZWpLY05TNUxEaFgwYVBVelBYbVVNWlM1N1J2Z1dUWUt5S3Rr?=
 =?utf-8?B?UlFZRUNPd0ViNXZkd3VRQU1sMlgvY1loRzE1UzFTa2RWNEtqMjFJYXNISkdh?=
 =?utf-8?B?MnMrR0tNY0IzRlU5U0lsdG9TT2FXaEMxRlBKVk5OamZJVTdJSlYxenM1Szh1?=
 =?utf-8?B?UW1FQU5abGF5Y3AvNnAyOVdFTFV6blRLQ085N2hKNjBFZENHYjA5My9EZTdw?=
 =?utf-8?B?TEFRRFovMCtCSVJyQmVpVHV5Ym05OHdRanpLaU5GQ0ZOeWNLY2gyRGwvZ1pF?=
 =?utf-8?B?bmdNY293aHZHK1M0TzNzM2lXT05iVkxYUlpTSVVXM3pmVWFIOGI1NUZIaUp1?=
 =?utf-8?B?QSt1M0FXamh5MGVTYjIxTHJPb2htVUljYUZudDBnc2t6dDRYOUxtN21tN3JC?=
 =?utf-8?B?cDcvQlJGVWVyTXZZL0pOWGxoalk0cE8zWmxRTWpLMmpOZTJRV0tMVVlkK0JJ?=
 =?utf-8?B?dkN4RGhObWI2Q2YvbkM0SUtMUG9tMTlxR0ZVREUxcFhmQUo2RjdQM1lVY0tN?=
 =?utf-8?B?cWpuUW9NZ0NLQm56ZUw1bUhFTWtkREhaRSszaGNqWkFhcEgwaTJKVWZLT251?=
 =?utf-8?B?Nm94a1ovVVU4RmdNMnR6anV0a1AxZm9UZUQ2dFFqSmFRWDRFM29pSWh1Zkdy?=
 =?utf-8?B?ZlZiVXlDdmJwb2lxQlNzZWlKUEtsUWFtY1NBYXVQQ2FhUERscDdVWGU4RmFp?=
 =?utf-8?B?YUcrN0FLTUl2ZDZMNTFxZU9qYnJZek1GWmhWZXVGbkdKTEtYdUxOZnFIQ2Qz?=
 =?utf-8?B?ZlYvdnVpZWpMM29OVVo1TDJKSnlwakhtL2xLc2xFcEVlMmFTVVZha01kSTQw?=
 =?utf-8?B?NDU1dEtSR01qNDVhYVhRcysxVW1JWnFxUXJXSERDeUlHOTh4OGxBQzhpaDBs?=
 =?utf-8?B?eUtMdkpNa1c0NnhlNzI5NllwdHhBb1FKQVN0RnBrUzU3S1BrSUoxbGs1bDNU?=
 =?utf-8?B?cEp6Vzk4S2pPUjBYcUp1UFBFWnhXRDdoYnI4eUlWSmNkaWtWdFVETWRuVWV3?=
 =?utf-8?B?TFRxbWJldm9PYWkrbU1IL3RuOEJiTGRrWGszeWRXcGxhMWZsa2M1M3BITWFD?=
 =?utf-8?B?Vm5yNnNlajhWV3M4eDlmRE1Ec3BlUkxIa3hyT1hsaEFxSTZGa2ZKMnlVaXIz?=
 =?utf-8?B?b21hYjhFUCtRVWVaczNnWDYzRUJHLzVROU9nSjVYQlFKaTBKekhjWmRsOWo3?=
 =?utf-8?B?M0tCSk51WHlLQkZ4MFY0TjlIMUVnd2ZEWWNWOVRKZENJME0zMEh3YWN4ZTc0?=
 =?utf-8?B?Y3U5M1lNaTJYVk9YSGZSUzVhQmZlcE5JcFZWM1liYUEzR2x5bk5LdzFPY3J6?=
 =?utf-8?B?Nlc0N0J4ZXlyTUttYjN0WmhObFM0blpPNmI2RDFYRmsxRHhZaUlFL1dwVnVo?=
 =?utf-8?B?bkc5NkVlUzYrTThpUFpzMzl0dU01UTNPb0wwQkZ5Wm5HQWdMczNsYlBWK0Fp?=
 =?utf-8?B?d21sSWZ6UDNlRHZpVnpYWlU1SlAwK2U4NkRNMncwZndhMHF0WmhTR1Nua3Ny?=
 =?utf-8?B?d0hnVkhkMlVqa3dnUUIxTE1QRkttK1RDell1OWt6eXdHM2N5eXFQWXVwOHlu?=
 =?utf-8?Q?EutVJyGEQK5vSNzIdTCtBS2giPQTAa86Cc2dOWZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a61d2e5-25e5-4221-000f-08d8e3007f02
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 13:37:34.4771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PoTn/fflc2rFrYqZA2riOCQmFS9RJ0gj6BF/Rh2zYzwe/maXZsSMBin00ttR4br29kNEcA8jkif0Gq5/SXf4Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5084
X-OriginatorOrg: citrix.com

On Tue, Mar 09, 2021 at 12:16:49PM +0100, Jan Beulich wrote:
> On 09.03.2021 11:17, Roger Pau Monné wrote:
> > On Mon, Mar 08, 2021 at 02:49:19PM +0100, Jan Beulich wrote:
> >> On 08.03.2021 13:11, Roger Pau Monné wrote:
> >>> On Mon, Mar 08, 2021 at 10:33:12AM +0100, Jan Beulich wrote:
> >>>> On 08.03.2021 09:56, Roger Pau Monné wrote:
> >>>>> On Fri, Mar 05, 2021 at 10:50:34AM +0100, Jan Beulich wrote:
> >>>>>> --- a/xen/arch/x86/pv/emul-priv-op.c
> >>>>>> +++ b/xen/arch/x86/pv/emul-priv-op.c
> >>>>>> @@ -874,7 +874,7 @@ static int read_msr(unsigned int reg, ui
> >>>>>>      struct vcpu *curr = current;
> >>>>>>      const struct domain *currd = curr->domain;
> >>>>>>      const struct cpuid_policy *cp = currd->arch.cpuid;
> >>>>>> -    bool vpmu_msr = false;
> >>>>>> +    bool vpmu_msr = false, warn = false;
> >>>>>>      int ret;
> >>>>>>  
> >>>>>>      if ( (ret = guest_rdmsr(curr, reg, val)) != X86EMUL_UNHANDLEABLE )
> >>>>>> @@ -882,7 +882,7 @@ static int read_msr(unsigned int reg, ui
> >>>>>>          if ( ret == X86EMUL_EXCEPTION )
> >>>>>>              x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);
> >>>>>>  
> >>>>>> -        return ret;
> >>>>>> +        goto done;
> >>>>>>      }
> >>>>>>  
> >>>>>>      switch ( reg )
> >>>>>> @@ -986,7 +986,7 @@ static int read_msr(unsigned int reg, ui
> >>>>>>          }
> >>>>>>          /* fall through */
> >>>>>>      default:
> >>>>>> -        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);
> >>>>>> +        warn = true;
> >>>>>>          break;
> >>>>>>  
> >>>>>>      normal:
> >>>>>> @@ -995,7 +995,19 @@ static int read_msr(unsigned int reg, ui
> >>>>>>          return X86EMUL_OKAY;
> >>>>>>      }
> >>>>>>  
> >>>>>> -    return X86EMUL_UNHANDLEABLE;
> >>>>>> + done:
> >>>>>
> >>>>> Won't this handling be better placed in the 'default' switch case
> >>>>> above?
> >>>>
> >>>> No - see the "goto done" added near the top of the function.
> >>>
> >>> Yes, I'm not sure of that. If guest_rdmsr returns anything different
> >>> than X86EMUL_UNHANDLEABLE it means it has handled the MSR in some way,
> >>> and hence we shouldn't check whether the #GP handler is set or not.
> >>>
> >>> This is not the behavior of older Xen versions, so I'm unsure whether
> >>> we should introduce a policy that's even less strict than the previous
> >>> one in regard to whether a #GP is injected or not.
> >>>
> >>> I know injecting a #GP when the handler is not set is not helpful for
> >>> the guest, but we should limit the workaround to kind of restoring the
> >>> previous behavior for making buggy guests happy, not expanding it
> >>> anymore.
> >>
> >> Yet then we risk breaking guests with any subsequent addition to
> >> guest_rdmsr() which, under whatever extra conditions, wants to
> >> raise #GP.
> > 
> > But it's always been like that AFAICT? Additions to guest_{rd/wr}msr
> > preventing taking the default path in the {read/write}_msr PV
> > handlers.
> 
> Yes, but the impact so far and the impact going forward are different.

OK, I assume this is because we plan to handle more MSRs in
guest_{rd/wr}msr?

In which case those newly added handlers are not likely to inject a
#GP?

> > If #GP signaled by guest_{rd/wr}msr are no longer injected when the guest
> > #GP handler is not set we might as well drop the rdmsr_safe check and
> > just don't try to inject any #GP at all from MSR accesses unless the
> > handler is setup?
> 
> Well, that's what I had initially. You asked me to change to what I
> have now.
> 
> > I feel this is likely going too far. I agree we should attempt to
> > restore something compatible with the previous behavior for unhandled
> > MSRs, but also not injecting the #GPs signaled by guest_{rd/wr}msr
> > seems to go beyond that.
> 
> I understand this is a downside. Yet as said - the downside of _not_
> doing so is that every further raising of #GP will risk breaking a
> random guest kernel variant.

Right. So given this awkward position Xen is in, we should maybe make
the lack of #GP injection as a result of an MSR access when no handler
is set formally part of the ABI and written down somewhere?

It's not ideal, but at the end of day PV is 'our' own architecture,
and given that this workaround will be enabled by default, and that we
won't be able to turn it off we should have it written down as part of
the ABI.

If you agree with this I'm fine with not injecting a #GP at all unless
the handler is set for PV, like you proposed in your first patch. IMO
it's not ideal, but it's better if it's a consistent behavior and
clearly written down in the public headers (likely next to the
hypercall used to setup the #GP handler).

I know this can be seen as broken behavior from an x86 perspective,
but again PV is already different from x86.

Thanks, Roger.

