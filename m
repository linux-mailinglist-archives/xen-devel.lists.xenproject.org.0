Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA63332A35
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 16:20:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95571.180483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJe9y-00086M-8j; Tue, 09 Mar 2021 15:20:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95571.180483; Tue, 09 Mar 2021 15:20:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJe9y-00085x-5N; Tue, 09 Mar 2021 15:20:34 +0000
Received: by outflank-mailman (input) for mailman id 95571;
 Tue, 09 Mar 2021 15:20:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eWC+=IH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lJe9w-00085s-Ez
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 15:20:32 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2aeffe8a-e08a-48de-b98b-60365ea7eee0;
 Tue, 09 Mar 2021 15:20:31 +0000 (UTC)
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
X-Inumbo-ID: 2aeffe8a-e08a-48de-b98b-60365ea7eee0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615303231;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=5eqYwwTw8+8cXgkxk+1LpRmI5JBbxRCPC/sHmN34/MM=;
  b=JcPAT6pZCm+oww55l3V5iovehhzVDpV3RngiyfynoLsvEJXqOfPrbisN
   3HaWchBAR70Jayvos4JSKyOWembga1jkkrIBHo4UZgKinjjJREasLqAAo
   xjKMhR457xS8WPFipBSmHdkpB7ncmCZoAQfsKLJn63OmwNxYxCGlSQfLm
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VEh+9U0UR5jGyEmPWgm3Iui7EzmcZyYEaV59nL2sQFxd3qGPzEaXjUeOStJVfoAatz+WLJqqvK
 geTi+uVlxbUFbjOouMSS4yf6ENSq1XQROqnfN9zyZoJ9VAPXD6sqzUpC541B67JHg60aoUveKE
 xnjNDcH+e+RG8OpIL/OoCTEBInIcH46xZszfhcFXN4V6dKJqnksBhRqaWMq2jgjEed2LBpj3Ba
 lCCvmrvqaIobSGfLGqylEH7gTYqVm+k+o21d5pWm0IPCzz4s3Ot8Gw0riNhAzo5sQpuVodcI+z
 jtU=
X-SBRS: 5.2
X-MesageID: 39048698
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,234,1610427600"; 
   d="scan'208";a="39048698"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bQYg72yswjZ6tzcCWpIgVB3MqgYTmfsh/FqqZbg2zGcXb1L7l10fVXeSpWiRtTz1OPttQVeAwK9juqjC4TstIY6n59wLrDV/GMI0lM7YZghQYqEvxuDkghqNCwF2aKA5LEEzTCNK7lIPuE1SJn1vzbFLJxFj+yBxH/f0XcreqGLt5xusT7MfXLWLEUCv7W2jRWBpbHqkK25FpkOzR/qMhqGXXA6Q3/iYcaqC4LNpRvX9a533Q5YfQU8tRvIKPnKoZkFQ6Pm6U4sD0TJgQazhBG4SaZnNqBxTg6oPkWzf4nc1DOzKhxD5uIvxemUNMcFlGVMwGe8iplcmPdjN1TxoNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npees4kHXq3PWMRyCwKaEoO1j0QyshxvMpdEqL2Aa2g=;
 b=nNwAeqKgkhP+il5wJGNOMIm1tuxjKbDjzAzs2Qn+DR11WKaRdW5GeoGUOLGCpPoxpBYujKkfjTnDGZRZ1n9X6hPFOfmA3/vmq+VTnVoxhEq//x2MDMjh0yo9qeaPd3Vj89OU+nBdJafsUx9u5A0qEm9o/WjjFS442nJi9GrhQAvjA9aiqJ8APeK+R8X+8W8iLkgTXRMhUx+90EpPf7/WOUmGr5u0Ut1khY+jZJb1mWwysFcM0PS1SiGlTOwWN15sLTZGEg+Ntq6jWeZjGqS4QjB7VCpgZHgkK589QfksguOKhRqojzhjHoN0GGFzIiUSg7JSftj9Fnll+6EOBexyqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npees4kHXq3PWMRyCwKaEoO1j0QyshxvMpdEqL2Aa2g=;
 b=SsFB4t+i+NJOmVuLutrZJRG318gJ/tr4DbsyhJWySgIkGa4pMfk3IngSdKgwbv9OYSagW/hVyvMd/sDShu+z/gaCSDAXtu3gPqBAS5Qt78YuANWU6SxPH8O/W+iIw3K/ufHf2+KGDpv2RNlyJ1BWTMxThMbzoSOl0qIKa8YbVrE=
Date: Tue, 9 Mar 2021 16:19:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [PATCH v2 1/2][4.15] x86/PV: conditionally avoid raising #GP for
 early guest MSR reads
Message-ID: <YEeSE0oWzY4jUN6G@Air-de-Roger>
References: <f5f17207-b601-2909-8a5c-55276e734272@suse.com>
 <d794bbee-a5e5-6632-3d1f-acd8164b7171@suse.com>
 <YEXmvp02UvvY8Fve@Air-de-Roger>
 <1f19ced7-183b-8f08-3a90-c06039e053a6@suse.com>
 <YEYUbGw5J1VMnuxd@Air-de-Roger>
 <b8ab7ac3-036b-d226-dc82-c61bf42f13d6@suse.com>
 <YEdLO04upNrxNTmI@Air-de-Roger>
 <204d73ec-a46a-6cef-9bc4-4219a7d00350@suse.com>
 <YEd6GTXJqRIjijl6@Air-de-Roger>
 <6dd26887-4246-8c5d-bf94-de03657230c1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6dd26887-4246-8c5d-bf94-de03657230c1@suse.com>
X-ClientProxiedBy: LO2P265CA0266.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37e6a16a-da19-4ac5-486e-08d8e30ec90b
X-MS-TrafficTypeDiagnostic: DM5PR03MB2636:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2636F3EAB742FFA867D6C8BF8F929@DM5PR03MB2636.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1bc88QO49bflcuw1RSN4VJG8WtfzmUkHcVvR4aPMn2eTi/2CXVgyiCDdZunpLqNDZVWYA7UGbNb+0gsEQ1KAv+Sj0tQQ5QBBLqHA/6/Nx8+PBlm+Qirq/zWNWTLSugrRZVHuTWKlLJUYcfWcNFGenWMmni0MbM/9VkRB1Y28aK9kgb+BjCz1OSlYL//sk7pR5Sck3O6B0LNwD4SwdR5UsZNux6o/rD06qZj1CJyoT6nA31NUmqgp5mR5yR61USMa5DUKntJl5xjuPpSWEsf3MtsLxUo7dv9uxrGGld0qurkJ4YS6rW9Rl0dg/hSfpo6F+IuUAOEIXhernpLzr9AtDfmPVhS7gvOPnc9yL1OxXlqQNcW8AHDPdo3IjnAjB4FS/7PoxP5qpo3iIz4IHw+GLiEzyILLhfyNkhrjU3hlhecnzWp2uX37HfFuVIv7OnsJXVUF7P8knQEBGnCm/PKMAI0uV5iwzGmW9+H7RqhnBvBD/io6gtKE3tjJ7WoIumvurf37qG/GqKLMr/AkVxBClQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(39860400002)(366004)(136003)(396003)(346002)(6496006)(66476007)(316002)(8936002)(86362001)(186003)(16526019)(6486002)(54906003)(6666004)(956004)(2906002)(53546011)(85182001)(5660300002)(26005)(4326008)(33716001)(66946007)(8676002)(478600001)(9686003)(83380400001)(6916009)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UWQycytvak9iSXhPcFoySjRLN2JqSnlNa0sveHpFWnRJOXpHVG1uNk1yTmRt?=
 =?utf-8?B?Zm1tMjBYRTlxamlhWTduZlp1S09xNVN2K0c2NUp4dWpWZkJRYWNiVmhHUjR0?=
 =?utf-8?B?K0gxcmZTU2s1Si9MMzI3b05HaWgyOUlGYmUxSFZHWm91S2tXZW5hdDBGZy94?=
 =?utf-8?B?VWR1ekdEZGJ5STNHd0FTYStwYWJoSGdxZU13YTUzaFMyc2N3S1hXZG9ZYW0z?=
 =?utf-8?B?R0NoTmd2bGwxNU9MV3I0TG5Vc0FsV29zeSt5ZTNreWFmZ3lGZzZUSTRhSlFr?=
 =?utf-8?B?bUVtSVFHZEF6ZkdZZHZjZEx6SjB6M0NGVVZSNU1kSzI1YXVHaWFZUXhiSHZV?=
 =?utf-8?B?U0lFOTA4eUFCVDRKaE8vbG1JL1ZkQXBtMGo3bS9tUXd3SW9lTGc2QkhIL0sz?=
 =?utf-8?B?TXNZUDJrSzRSWUx1U3lvZHgwRHpOL28rbzFkc1ZCbU9qMnZQaWMza1h4cFJr?=
 =?utf-8?B?aFJiZzZYY2c3VVJDMndqTDFBdkZVajNiTm55VnFQMnRUUHJqWERBelQyZG9q?=
 =?utf-8?B?UFhhbzgxVWlQaE10Z01mTUoyUGVVRUs2RkhtZ3JXMnVZY3Z2dkliRHhRbUhY?=
 =?utf-8?B?cDJGL3hQUmVHNE5mSHE0cmxaOFpTQjBuRjRoanlvenBicTBUaU15SEFwTkx4?=
 =?utf-8?B?NEtJRDMxZ21BNnFzQ1lxd3k0ZWVJZFpPeUdiWU15dmJTY0RpU3hzWnV6MXFs?=
 =?utf-8?B?Rlhvc1NBdlZGYnl5NnpBbEdwb0R1YWlzWFB0Y0JvQ1ZKUzhteDdVNXdoUk9W?=
 =?utf-8?B?K01nK2Q2R2p2VndRTmhyRVNTMDZPMlIySDJrcVpMQkF3N3hQczlCQnZ4V0gv?=
 =?utf-8?B?aGdTdGdRaDJheS9CeUZPdjNGeWw2eXRxb1I4UXZoeVFyM2VsZGZadGorbVFo?=
 =?utf-8?B?VTNrbktrV3VLaW5YTG9FMWpSRkJzK05VZ2dXaTlMUVYzaHpQazNSbUZORlpn?=
 =?utf-8?B?VG1LekJGQk04OXJ4ZTZNZDgzdXJSQTdLMmUxWjNtVUFWZmJYampXeHVIR3Ew?=
 =?utf-8?B?QWo1RTNiUXZ1bEkvei8vM29nN21VNUtNdm5SRS8vRmE0ZzNKSTlVdVk3TzBw?=
 =?utf-8?B?c2FMK1BqZFhTMFV2a00zUWYxNGs4UHFDazZ2RXRtWk9RK1dIMXFEYjU5Qmdh?=
 =?utf-8?B?aWNCakNkMXo2WnVvNzFVTG1aNDlWWnFwZEU3ZFlTQ3ljTmxJRjhXTkM4TXNh?=
 =?utf-8?B?Z2VLcSsvYnJORXd3Tk1FeTBFem1pcnJjemE3akhhb3JQN01qSFlSV1IzMXRH?=
 =?utf-8?B?Qzlxc3Q5d3NnelZrWlpreEdXSHAxalJ0b05iVmRnN05JQ1lrRUVIZEZYclky?=
 =?utf-8?B?enR4S3hhb2ZURm9sNytzMVBnZnNHR2FpZkF5TUN4TUQ3MEd4UWg0bnpOZXJU?=
 =?utf-8?B?ckx3a002WUlvdFQveXlhM0xEUnJLZUNUOGlrWDh2UVQ4c1R1M1RFYlZzODlH?=
 =?utf-8?B?NzZ6UFRqRUF0K1FPQWdyekp2dW56NEVQWWxvOGUwL0w2dDNJUmdYbWVYdk1n?=
 =?utf-8?B?SGFXcGxTNHdBYUJwMm5OODJPSXQ4SjV0QVJ2bEJlNy8weE9uamVFSmE3cVo4?=
 =?utf-8?B?UEo4dy9qSEJQb3pyK0tWNCtQQTRibjhlWWNYdkFURW1CSUtRcldBb05lbGZB?=
 =?utf-8?B?MnkvRlgrdVZPSjh4bGxLSHhlOHJOeXU4bDBVMVQvNGxvN2ZyWEswQmVOYXVv?=
 =?utf-8?B?N251ZUhRNUxQcVhRZDgyN3NFa2t0ME1mWXo1QVFGZm9KOW5sR2xWdFl3bGdo?=
 =?utf-8?B?Rk1VTFBMQS9wTTZ0VUc5TjFSUmpQNzFwSk5zWE9pTG5HblY4VnY3MWhxUC9F?=
 =?utf-8?B?ZVo4VmJtUXpCTHVKQUFOUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e6a16a-da19-4ac5-486e-08d8e30ec90b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 15:19:51.6485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PBL4UhTeAXASJC4RFkMCtwZxtCb2X8NpjpKpxGIGbfO3lInvkisvC16gNvFi96pPBT+bb7NxAnF02HgHCJnBAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2636
X-OriginatorOrg: citrix.com

On Tue, Mar 09, 2021 at 03:50:59PM +0100, Jan Beulich wrote:
> On 09.03.2021 14:37, Roger Pau Monné wrote:
> > On Tue, Mar 09, 2021 at 12:16:49PM +0100, Jan Beulich wrote:
> >> On 09.03.2021 11:17, Roger Pau Monné wrote:
> >>> On Mon, Mar 08, 2021 at 02:49:19PM +0100, Jan Beulich wrote:
> >>>> On 08.03.2021 13:11, Roger Pau Monné wrote:
> >>>>> On Mon, Mar 08, 2021 at 10:33:12AM +0100, Jan Beulich wrote:
> >>>>>> On 08.03.2021 09:56, Roger Pau Monné wrote:
> >>>>>>> On Fri, Mar 05, 2021 at 10:50:34AM +0100, Jan Beulich wrote:
> >>>>>>>> --- a/xen/arch/x86/pv/emul-priv-op.c
> >>>>>>>> +++ b/xen/arch/x86/pv/emul-priv-op.c
> >>>>>>>> @@ -874,7 +874,7 @@ static int read_msr(unsigned int reg, ui
> >>>>>>>>      struct vcpu *curr = current;
> >>>>>>>>      const struct domain *currd = curr->domain;
> >>>>>>>>      const struct cpuid_policy *cp = currd->arch.cpuid;
> >>>>>>>> -    bool vpmu_msr = false;
> >>>>>>>> +    bool vpmu_msr = false, warn = false;
> >>>>>>>>      int ret;
> >>>>>>>>  
> >>>>>>>>      if ( (ret = guest_rdmsr(curr, reg, val)) != X86EMUL_UNHANDLEABLE )
> >>>>>>>> @@ -882,7 +882,7 @@ static int read_msr(unsigned int reg, ui
> >>>>>>>>          if ( ret == X86EMUL_EXCEPTION )
> >>>>>>>>              x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);
> >>>>>>>>  
> >>>>>>>> -        return ret;
> >>>>>>>> +        goto done;
> >>>>>>>>      }
> >>>>>>>>  
> >>>>>>>>      switch ( reg )
> >>>>>>>> @@ -986,7 +986,7 @@ static int read_msr(unsigned int reg, ui
> >>>>>>>>          }
> >>>>>>>>          /* fall through */
> >>>>>>>>      default:
> >>>>>>>> -        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);
> >>>>>>>> +        warn = true;
> >>>>>>>>          break;
> >>>>>>>>  
> >>>>>>>>      normal:
> >>>>>>>> @@ -995,7 +995,19 @@ static int read_msr(unsigned int reg, ui
> >>>>>>>>          return X86EMUL_OKAY;
> >>>>>>>>      }
> >>>>>>>>  
> >>>>>>>> -    return X86EMUL_UNHANDLEABLE;
> >>>>>>>> + done:
> >>>>>>>
> >>>>>>> Won't this handling be better placed in the 'default' switch case
> >>>>>>> above?
> >>>>>>
> >>>>>> No - see the "goto done" added near the top of the function.
> >>>>>
> >>>>> Yes, I'm not sure of that. If guest_rdmsr returns anything different
> >>>>> than X86EMUL_UNHANDLEABLE it means it has handled the MSR in some way,
> >>>>> and hence we shouldn't check whether the #GP handler is set or not.
> >>>>>
> >>>>> This is not the behavior of older Xen versions, so I'm unsure whether
> >>>>> we should introduce a policy that's even less strict than the previous
> >>>>> one in regard to whether a #GP is injected or not.
> >>>>>
> >>>>> I know injecting a #GP when the handler is not set is not helpful for
> >>>>> the guest, but we should limit the workaround to kind of restoring the
> >>>>> previous behavior for making buggy guests happy, not expanding it
> >>>>> anymore.
> >>>>
> >>>> Yet then we risk breaking guests with any subsequent addition to
> >>>> guest_rdmsr() which, under whatever extra conditions, wants to
> >>>> raise #GP.
> >>>
> >>> But it's always been like that AFAICT? Additions to guest_{rd/wr}msr
> >>> preventing taking the default path in the {read/write}_msr PV
> >>> handlers.
> >>
> >> Yes, but the impact so far and the impact going forward are different.
> > 
> > OK, I assume this is because we plan to handle more MSRs in
> > guest_{rd/wr}msr?
> 
> Yes.
> 
> > In which case those newly added handlers are not likely to inject a
> > #GP?
> 
> Kind of the opposite - because it's not impossible that some
> addition there may want to raise #GP.
> 
> >>> If #GP signaled by guest_{rd/wr}msr are no longer injected when the guest
> >>> #GP handler is not set we might as well drop the rdmsr_safe check and
> >>> just don't try to inject any #GP at all from MSR accesses unless the
> >>> handler is setup?
> >>
> >> Well, that's what I had initially. You asked me to change to what I
> >> have now.
> >>
> >>> I feel this is likely going too far. I agree we should attempt to
> >>> restore something compatible with the previous behavior for unhandled
> >>> MSRs, but also not injecting the #GPs signaled by guest_{rd/wr}msr
> >>> seems to go beyond that.
> >>
> >> I understand this is a downside. Yet as said - the downside of _not_
> >> doing so is that every further raising of #GP will risk breaking a
> >> random guest kernel variant.
> > 
> > Right. So given this awkward position Xen is in, we should maybe make
> > the lack of #GP injection as a result of an MSR access when no handler
> > is set formally part of the ABI and written down somewhere?
> > 
> > It's not ideal, but at the end of day PV is 'our' own architecture,
> > and given that this workaround will be enabled by default, and that we
> > won't be able to turn it off we should have it written down as part of
> > the ABI.
> > 
> > If you agree with this I'm fine with not injecting a #GP at all unless
> > the handler is set for PV, like you proposed in your first patch. IMO
> > it's not ideal, but it's better if it's a consistent behavior and
> > clearly written down in the public headers (likely next to the
> > hypercall used to setup the #GP handler).
> > 
> > I know this can be seen as broken behavior from an x86 perspective,
> > but again PV is already different from x86.
> 
> I'm certainly not opposed to spelling this out somewhere; iirc you
> said the other day that you couldn't spot a good place. I can't think
> of a good place either.

After looking some more, I think placing such comment next to
HYPERVISOR_set_trap_table (in arch-x86/xen.h) would be fine.

> Furthermore before we spell out anything we
> (which specifically includes Andrew) need to settle on the precise
> behavior we want. I did suggest earlier that I could see us tighten
> the condition, and there are many possible variations. For example we
> could record whether a #GP handler was ever installed, so we wouldn't
> return back to the relaxed behavior in case a guest zapped its handler
> again. But for behavior like this the immediate question is going to
> be what effect migration (or saving/restoring) of the guest ought to
> have.

Replying to the save/restore part: this is covered by my patch. Any
restore (or incoming live migration) from a source that doesn't have
msr_relaxed support will get that option enabled by default, so that
guests migrated from previous Xen versions don't see a change in MSR
access behavior. That applies to both PV and HVM guests (unless I have
messed things up in my patch).

Thanks, Roger.

