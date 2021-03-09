Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4DD3322D0
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 11:18:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95299.179850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJZRN-0008Uw-9A; Tue, 09 Mar 2021 10:18:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95299.179850; Tue, 09 Mar 2021 10:18:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJZRN-0008UW-5v; Tue, 09 Mar 2021 10:18:13 +0000
Received: by outflank-mailman (input) for mailman id 95299;
 Tue, 09 Mar 2021 10:18:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eWC+=IH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lJZRL-0008UR-8f
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 10:18:11 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dad942d1-01af-4a81-8329-eea4e3ff7314;
 Tue, 09 Mar 2021 10:18:09 +0000 (UTC)
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
X-Inumbo-ID: dad942d1-01af-4a81-8329-eea4e3ff7314
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615285089;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=2SmMOMh5PE6zfrq1kMmA8Ir2i0/rJaSlomgGCaZOBXk=;
  b=Jj9bizXvJ+Lqn9Or1gQQLJ1rO68E4UoCx0kS8bpsr6otyUCNkwBnY1hB
   VqvaeumgPc3YzvHIY95bvJfqv5bjZbYtlaVNIEMfOlr24NkCQ3Sbbakbz
   TVxjurh9Xqw/bAi101BNOQBVT42Ydu9LKQt96j+z3RC/OoexteQmUo3NH
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LlU6w+mFcUlqOArpTWbH+wwiBhr0UBqk+EIpJxvn7HoSOb+NJQisxKei1wspMsy2BIC6p9k5uU
 bLFIZXPgGdJ3rMFLdibUs3iIeZQ8Vdh06qfOPQ4AUs3gU2SBg5nlrPH7/BV6arckcLNV3sO1Ew
 AirtPfebFTgv1kxPcfmoKUDkEAV7uGMDm6ZwlwvT6iUN9/X4GM22w/9kjZgEK3f+bC3+0Ec9Kx
 nFeP4o0LSePkntgQE9XOoxLJSRZvRO5v/Gmi6HqpCiwte8gEA5L3KMmiBqfhJNGkr6i4hHF6yV
 tPc=
X-SBRS: 5.2
X-MesageID: 38860305
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,234,1610427600"; 
   d="scan'208";a="38860305"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kq5mwoTcKbyz4AGnYFJCoj28HUeksPtPHkpWUnoHTvSEDcPZwwbnuAqb3dv9U4N5o8DUw+F0/QIFN5TAOXnbsZOgLLpc+1RI+t4R/+MroTuM4w/dygPYKHJ3TRt3SXdQYIYJPvfos0kcMDDfVm/xEVuS+nUu1rR4BDiLn7hwtQ21OltYgqenl0E5al5EjJ+ITNW1puvgjZM/W5JC697REBkiP1iFyOEHivH3Oua4cOAekcft4sKeyBK22ydk8DHhb74AJsTcoQbVBWd5eKZ+EtmbrFdcWgaN5k4zHF+FXHk6Avab8Nldbq5CTvPStsUeaH4em5HHLb8dYLZHlEMbfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ysQDz0JtYjuWpyf2eObItyAVOvfmBWKEK5gpJuJOCkc=;
 b=Sk0+xOFPvlWkw+O1rGMk1lUwkhhVAm0u6jXH4ifUuVM1owcgK2ri9MEJvpQ75eY3CllOkOPAFWXCECgRlJKbf9/fl/MIvl/GCd/y3ZhS1a73M5q/PQm6HRysOYEane/k9eM2JJWYNN6p2F5LtWc7yM87zXuJbaowWV/cRH6heMS9VODTORcj7mUD1NMcTQqwMQ9SvIPU5lo3l6Q+24Rzhb3QBUJwOrrMREGUeh+fm0bA6YkeQbPTRjDeY0b1+t4+oHRFLRmfBkGakd9Ro7nJPTxSgLURMbm4YGL51oXyuIHT2IZKEvSPbKiPtCBSeHtIF3kBvopO81lE6uo3KsFpSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ysQDz0JtYjuWpyf2eObItyAVOvfmBWKEK5gpJuJOCkc=;
 b=mYun50+0Bwvxbf4xPrH2hBau1O2X3hhc1Ziy2zoUEEFP6vEodCHMLKqHWyxEcQnA/sYph24KyibIIfwdg7DhORTUVJxNN2aDmEYALWk5HDotb++GnRne1702+rAtYHXCQn8vViaZLY6Bi+dsXThLK6+lg7rwxBZun3+W7CU40Rw=
Date: Tue, 9 Mar 2021 11:17:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [PATCH v2 1/2][4.15] x86/PV: conditionally avoid raising #GP for
 early guest MSR reads
Message-ID: <YEdLO04upNrxNTmI@Air-de-Roger>
References: <f5f17207-b601-2909-8a5c-55276e734272@suse.com>
 <d794bbee-a5e5-6632-3d1f-acd8164b7171@suse.com>
 <YEXmvp02UvvY8Fve@Air-de-Roger>
 <1f19ced7-183b-8f08-3a90-c06039e053a6@suse.com>
 <YEYUbGw5J1VMnuxd@Air-de-Roger>
 <b8ab7ac3-036b-d226-dc82-c61bf42f13d6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8ab7ac3-036b-d226-dc82-c61bf42f13d6@suse.com>
X-ClientProxiedBy: PR3P192CA0021.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c21a998d-2d45-421e-0b46-08d8e2e490ed
X-MS-TrafficTypeDiagnostic: DM6PR03MB4970:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB497085B0AD265836DD265ADB8F929@DM6PR03MB4970.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9df1swE02EmKjWSRmEma6VTCBWJJ/1T4rfzSWxJvUX2JWkTH682vpmKW30bdnV4wCpbL4o8uSnUtZl9eOE1nOAcOAZt8DWcopX54zAXJoB+Iu2e4TxllCvT+7PweIrvu1LzrypjOoZB0Vb8JvWQyNYu94SVmBQ4/bO9CVjpwqyZ4XTwALCqXa7HRTxDahtGo5rRZDK3d2pUYwoWklb64LuIpQGBaib8e4yqOflWxgKlEPJNBMC1+82k+hnl14yXddDzo4nFjB1boNy2djgyNJnKFglRdT281Ikuvtn7u7qEtjsYmJeBHjjNzM6Kz2FRzg+5UXtF1+GXGmBg0DOZ5EYH1VpprCi8Pijy/yz4F+6WUaAi4DBTFxple4QJx/9GlO8ZXkgMjUj72q4tbJ1PZtRiFb9c/c2DpmTwPcLikaLkgYBaBbvqf9cN0afdEa8BpUbUO3gJGkHmQg30eYLhLyPQCaqAhax32zuhXdx8Kys1pg0VvAZZe0D565V8RShMcd85JivHrxBgc3pskFekwBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(136003)(39860400002)(366004)(396003)(376002)(86362001)(6666004)(6496006)(66476007)(6486002)(54906003)(4326008)(83380400001)(66946007)(8936002)(478600001)(316002)(5660300002)(33716001)(66556008)(186003)(26005)(8676002)(6916009)(53546011)(2906002)(9686003)(85182001)(16526019)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Kzk4WjZSTmpZNHF2dWRYWDJxaXdvcEc2RGxXUlZCbFJnL3VhUEhDUEFOMWpU?=
 =?utf-8?B?Tm5DcnFXK3gvQVk1enY5V2lsc3RyYjNOSVMrV0dMSm1ZRTh1anJpWUZuOUU0?=
 =?utf-8?B?M3RqdWlLWU52N05mdDBGb0hNTDQ0T2xyaDRxUWQxUGRlZXVNTkp2eWlZa3pC?=
 =?utf-8?B?ZE5pbnVadEw4aEU2SFZ2b2VoRVA1RnlMS0gyc3JoQlVHa2IxWDdZc3I3eUJ5?=
 =?utf-8?B?MVBmTk1YSUUvK0RINzlpVVYyYnFQQXJLZEpxNTFRQ1kvS2xGVU12ZUhoTkV2?=
 =?utf-8?B?UXQ2TEhrRTJpQ2I2NTdKUU1QU24yTFRCZTZ1NDJmNzFqVGlsN2c5NDR4WU5v?=
 =?utf-8?B?YUV2c1ZiUU9vbUxRTkJtTHdXeTVGYVV0VU1YM3h1V1BLbWNPWmFTNURqMng2?=
 =?utf-8?B?K21iWHBYMXYrUVJzTXhPdUlrN3V4RXU3WXgwNWZLYVNZVUdvR2c2WUsyYUFM?=
 =?utf-8?B?ZVlxWnhBWnBCSjBWZnFOWUlTRStBS2I1aWlWUlNjZFViclAxYjhQMnZlS2Za?=
 =?utf-8?B?c0xSbXlobitYamlDd2d5ZXBWbEZhZXVYVityaCtmM3dWQUwvNVFvWVIwTlli?=
 =?utf-8?B?aVY3UkJ0bzRGWlAwNytUWWNsNUVYbGxWOThNMUQzS09WRzFkd3Z3MkJhUlla?=
 =?utf-8?B?d1dUODFOWFNqaXZZTHFyL0FpcWFtM0dmendsOWJVUThOdTNNYXRKNDhKVjRt?=
 =?utf-8?B?eks2VS9TN2E0cmMyN2kzSXU4ZzBBT2pUSlkxdURIdDNDd3Z6S015WTN1eDdu?=
 =?utf-8?B?NnkrU2VsbVl0ZzQ3RjB5OG13VVZZOGgwTWNUclVrMXR1c09JTVdhbU5TOGh3?=
 =?utf-8?B?Tk1oWG5XTVNQb0treTErS3pvMEQ0V2dUWENhcE5ZTVl3Tlk3eFFYQTVwTUZm?=
 =?utf-8?B?MXpCMlRjL0RUTzhLWUgxaHk4OFNsOTBlcENTdW9OcTdTcjFHaGErcEt1MG5C?=
 =?utf-8?B?T3YvN1o0T3gvU1htNGhVZkpwZElXUVBwdG01WHh0STBYQ3pWUldyeis4Y0ww?=
 =?utf-8?B?S05rQzFscm9yQzc4Umk3ZlJhNVpOTFlWSlorU3N2Z1p5YlUzSkJ6R1ZYcS9Q?=
 =?utf-8?B?YjREalZ0bTRlRzZnclhmdmszSldxMlZQeUxaQUJTN0FIaGorNkNTellXYWZJ?=
 =?utf-8?B?Rll2WVV5SGlQd3ZIREgvVmFid1BNRzYxYmR5MnhrSWRMRmZyRWx1bDNtdTdj?=
 =?utf-8?B?Q0ZKdXQ0eEVnUUt6RkV0VG4rYlJqVm9STWRIWlpnQjBNWEx3VTUrUG5TMEQ4?=
 =?utf-8?B?YWRrQXBJMmZDczFkU05qbmtDak9XZTRPN0trR28xTlRnWWgxaEhuTzRjOUR3?=
 =?utf-8?B?dnFzZXl5YzU3RVBwZ0pGZXFVb0JpTzY2eGFkcDRXTWRKREp1Rm4vQmNJZ09y?=
 =?utf-8?B?YTluNDBReUhvMDU3NTlLVkFDWERLK0xOOWdvN3U3RHdMQ2RFcWZlWmFlV3l5?=
 =?utf-8?B?S1YrTVlQRmZHVEM2U0ZZYWg1T3dueTQyd2FJT2VlQmZEQXBpcm1PTmxXSWRL?=
 =?utf-8?B?U1JZZWRITXhOM0MybDZsNU81VjR2azhFaXFlZENiSjRIZVJ1azdzelZ1aGc4?=
 =?utf-8?B?dEJoWm16K21DQWRSWVQvRVVvbjhRZGlER0oxY3FlVm83cGM0STc1bFRFQjlt?=
 =?utf-8?B?RndEUW95RG05ZjJuSldvUVN4eEhrbTdWandmbEV1T2N0K1RaRHVBT01ScmQv?=
 =?utf-8?B?emR3N2thSGZTcGNqaHhieXdGYUtKUGhpTXBRRVd0U0VQZ2J6TmdWZFR6MW5E?=
 =?utf-8?B?OThLOG44VXZSQ0NkZUZ2U0tITC95b1ZoeitWR21pSDZIY052NndZV3ZsTldm?=
 =?utf-8?B?SmJTaWJYTVczMGVIc3Mwdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c21a998d-2d45-421e-0b46-08d8e2e490ed
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 10:17:38.7637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1Ooi17JwW3FWT/quopJzFLBFQz5zxrPueafHCb3JTx7UIlb2Q7IiQgJMkvWH+LR/nhzkehEeCKODaVFGmP2zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4970
X-OriginatorOrg: citrix.com

On Mon, Mar 08, 2021 at 02:49:19PM +0100, Jan Beulich wrote:
> On 08.03.2021 13:11, Roger Pau Monné wrote:
> > On Mon, Mar 08, 2021 at 10:33:12AM +0100, Jan Beulich wrote:
> >> On 08.03.2021 09:56, Roger Pau Monné wrote:
> >>> On Fri, Mar 05, 2021 at 10:50:34AM +0100, Jan Beulich wrote:
> >>>> --- a/xen/arch/x86/pv/emul-priv-op.c
> >>>> +++ b/xen/arch/x86/pv/emul-priv-op.c
> >>>> @@ -874,7 +874,7 @@ static int read_msr(unsigned int reg, ui
> >>>>      struct vcpu *curr = current;
> >>>>      const struct domain *currd = curr->domain;
> >>>>      const struct cpuid_policy *cp = currd->arch.cpuid;
> >>>> -    bool vpmu_msr = false;
> >>>> +    bool vpmu_msr = false, warn = false;
> >>>>      int ret;
> >>>>  
> >>>>      if ( (ret = guest_rdmsr(curr, reg, val)) != X86EMUL_UNHANDLEABLE )
> >>>> @@ -882,7 +882,7 @@ static int read_msr(unsigned int reg, ui
> >>>>          if ( ret == X86EMUL_EXCEPTION )
> >>>>              x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);
> >>>>  
> >>>> -        return ret;
> >>>> +        goto done;
> >>>>      }
> >>>>  
> >>>>      switch ( reg )
> >>>> @@ -986,7 +986,7 @@ static int read_msr(unsigned int reg, ui
> >>>>          }
> >>>>          /* fall through */
> >>>>      default:
> >>>> -        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);
> >>>> +        warn = true;
> >>>>          break;
> >>>>  
> >>>>      normal:
> >>>> @@ -995,7 +995,19 @@ static int read_msr(unsigned int reg, ui
> >>>>          return X86EMUL_OKAY;
> >>>>      }
> >>>>  
> >>>> -    return X86EMUL_UNHANDLEABLE;
> >>>> + done:
> >>>
> >>> Won't this handling be better placed in the 'default' switch case
> >>> above?
> >>
> >> No - see the "goto done" added near the top of the function.
> > 
> > Yes, I'm not sure of that. If guest_rdmsr returns anything different
> > than X86EMUL_UNHANDLEABLE it means it has handled the MSR in some way,
> > and hence we shouldn't check whether the #GP handler is set or not.
> > 
> > This is not the behavior of older Xen versions, so I'm unsure whether
> > we should introduce a policy that's even less strict than the previous
> > one in regard to whether a #GP is injected or not.
> > 
> > I know injecting a #GP when the handler is not set is not helpful for
> > the guest, but we should limit the workaround to kind of restoring the
> > previous behavior for making buggy guests happy, not expanding it
> > anymore.
> 
> Yet then we risk breaking guests with any subsequent addition to
> guest_rdmsr() which, under whatever extra conditions, wants to
> raise #GP.

But it's always been like that AFAICT? Additions to guest_{rd/wr}msr
preventing taking the default path in the {read/write}_msr PV
handlers.

If #GP signaled by guest_{rd/wr}msr are no longer injected when the guest
#GP handler is not set we might as well drop the rdmsr_safe check and
just don't try to inject any #GP at all from MSR accesses unless the
handler is setup?

I feel this is likely going too far. I agree we should attempt to
restore something compatible with the previous behavior for unhandled
MSRs, but also not injecting the #GPs signaled by guest_{rd/wr}msr
seems to go beyond that.

Thanks, Roger.

