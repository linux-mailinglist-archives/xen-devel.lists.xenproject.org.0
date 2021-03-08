Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 044AD3309CF
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 09:57:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94664.178254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJBhI-0002yZ-Kk; Mon, 08 Mar 2021 08:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94664.178254; Mon, 08 Mar 2021 08:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJBhI-0002yA-H4; Mon, 08 Mar 2021 08:57:04 +0000
Received: by outflank-mailman (input) for mailman id 94664;
 Mon, 08 Mar 2021 08:57:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QSVd=IG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lJBhH-0002y5-BK
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 08:57:03 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id beff79bc-8b27-44b0-82e2-95560a93ea8d;
 Mon, 08 Mar 2021 08:57:01 +0000 (UTC)
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
X-Inumbo-ID: beff79bc-8b27-44b0-82e2-95560a93ea8d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615193821;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=IdQ7wrAR/zUetv/KedEfMfuT3gqU/dQTEm/uBj5pvnE=;
  b=TvqRM3McaJ5hj4+V7ZWgXALLwbTXCBS1m7U0OrZZrZppDJh7XbPHX2zR
   d38KBDVciDE6GCwq7ZDKGXEXMIfJ+FANC9RtUK4g5OW2Wjg9suVv7oG/m
   1KsA4wSKCXMphbUBMkTs0251G7qHHORD0peNDFsi7HvVWZ+buxXrkW31P
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: eU7p9Krc6qFS5UKyFQwMy56T2slhwMHzr2smBbJkqcwu5jFx7c0yovBo/7uQyY4NvcfpWD1xm7
 H/gXv9Q3FBL0V0fyEePm6v/a24pZkzw1SojXWcfoQsZW5qLPY39f+VEz6tCD0LZBwKyDmLN2ES
 OFNFL4GZzo5HAt4UuCoa2QQjNIgE5YJSA3h14ssdFTXc/UD/flQ8GklL8NtvY1fqO4FzR26vWO
 ZWV/aHuw7LpkHrdOr6ZL27sGqc9EJpL2kJxbtcAgaLwqQ74V1gL5+6fhpdf+pF9ldUUyPmJa8b
 ZZA=
X-SBRS: 5.2
X-MesageID: 40159140
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,232,1610427600"; 
   d="scan'208";a="40159140"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XPIsrOcXwOsqqXnVHY0o6kqQo8UPQzqx/5OYDXo/7ODXJtif2d9W14SGVaOyggJkc5W/S85kUQ6fIZIWBwj75l1nuEfTCaseNjdsdNk9waBcmbWEVbuG9GeyiQ/vAgJv18girlHNrtTVCCVP1TmIYrkxxZrfnKutb9O3K6qAGpfZ4YfrocpjQoEaDZwU1BlCoZvryhHLzmegh787qbQ4/EtUCEEPO5OX8WJLLcLYSSGRXa4zvu9nJzl2xLV6C1HPuXhWE0/D6jt9n/OHdwpGwzx9CF7u3Asf/Bh88wuJGOAPJSN/R2e1FDR7FsW+xuLdNd77Rq7UB1XAaq/qhiKnAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmoMTmHAaEu7wpfC+D9vdqtW0NCM9/czu/DoPKCaoNY=;
 b=ZxGCLBTbA85i6l2SKTmj/jxQe2CdUwgIxzTCbhbxsF2MeeGeaGRd3asaJ5okeEnoR60IPsk9xmpBRWlUA/OaAiHZDM+DQ6aLIkVQgZUAvXifWtOhVOUv4md3jcM3by3qJa5H2YJxzUIO8l15J2EWEBij1meT0oUW35Z9bnFGC4oM5cidvYeeggdncRc+JfcaK+4xJ4JxrH+RqcDkgKzx5OrAk+8F2zaKha3420vh0BVgM1As6cg3D+dHgazcdkLD3+tEpBVTw9xS/lBaEdbjQlawZcNXz7Xh05kPwb/U7SiXX1XTWYCKtonUWBDSwkoTnR01sLASB0HyXzOFf24fGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmoMTmHAaEu7wpfC+D9vdqtW0NCM9/czu/DoPKCaoNY=;
 b=gKzWZJxjJfwk1hJZJme9BFnkhX7mXn3wOQFkTSURmfTD5vmQOtQkau1K7xIhHdx6/RIrsNyg86GIoYm65sfX4lbGbnd4AhIixMdOEEm5ZJ1xtfaU8rXUMvQx5aFdtvqzLCGaqFzYdqChcgt9hMqBtQz33doiX8HDyYD7QXVbteE=
Date: Mon, 8 Mar 2021 09:56:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [PATCH v2 1/2][4.15] x86/PV: conditionally avoid raising #GP for
 early guest MSR reads
Message-ID: <YEXmvp02UvvY8Fve@Air-de-Roger>
References: <f5f17207-b601-2909-8a5c-55276e734272@suse.com>
 <d794bbee-a5e5-6632-3d1f-acd8164b7171@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d794bbee-a5e5-6632-3d1f-acd8164b7171@suse.com>
X-ClientProxiedBy: PR0P264CA0134.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e094c041-5f40-446e-3e59-08d8e21014f1
X-MS-TrafficTypeDiagnostic: DM6PR03MB3740:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB374010525E2B87F687D5F4348F939@DM6PR03MB3740.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EtdNyX8LUJ+0S9naDQ+bprnMoUxvWRdItYzJG6TeP+nGJzPtP9fRbZtd+8QoIgxzqX6c8koL5w7isfb/AVhDQUilhWjE2KphefwlhIdAkALlGk6hR3tJB9Kcv+4f5bq1xM/hD7MqZ7tLk0hWF52Uxy3vg4cIHN8ExWzgzKwldjIjpcwpjp2iM5wf7MKVrkEDix+Eoxke8cOAmfp+mCGPzkkEiM0G8IfML8cstTQf7oKQkbn3wQbRNNMPsiZhfEjp3gH91qiwr+Kz5F3XeUz5RzjJ91x7/p38gjBuLhvi+7I+3ouj33x1De9qLfNdXZP0BUYble9ESJZSBlr+pAx0RkyYYUuzqxp0CzXQDKUAdNOhPnH2Kdj9LHxowMRXArJhraoN1ICD0jQBftY7vIgfyl1LyC9ptlOISBtftHAJjjucVMPQwFkdZ/hqENguJjS2UdSQTLNeaMVwYjAnGKZxROff6x/7i2kc0BLgAv6NijvK+vbsOm0kw4t/RJqrHle/RZFIfoYp/cdt+xE9RJ84tw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(366004)(376002)(396003)(39850400004)(136003)(478600001)(8936002)(316002)(8676002)(2906002)(9686003)(85182001)(6666004)(956004)(83380400001)(66556008)(66476007)(66946007)(4326008)(6916009)(86362001)(16526019)(186003)(33716001)(54906003)(5660300002)(26005)(6496006)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cEIySy92UDV3K3U4Ym1mSFloMDMrQXVWRkowSnNFS3NCdytWZE1yNDJ2TmQ5?=
 =?utf-8?B?UjNtZlNNdDlvMVZCWFMxMFFlMVFLTE5NRm4xZDhPc2xwb3crdHNoTjllNkFO?=
 =?utf-8?B?V0xaYUI4MnpZNzRURlI4TFVwVitHb09SRE0xU1g3VWpLTW8xZnlHT2FmbE50?=
 =?utf-8?B?UlRvTS9EazdQUzF4ajJaRXUyd25BQU11cEtaUFhiOTNSK2psSjJhNENQdjI0?=
 =?utf-8?B?Q2ViOHllazdlcXFNbXVQamFOREZrNkF1bUkxbGxCTzFFWXYrOTF6bDFHYVFs?=
 =?utf-8?B?aXR0NC8wczNod282TFhIZU0waTBqOWtRWG9MT0V4c1VQTzlvZDllcEpPaGIv?=
 =?utf-8?B?RnJXYWoxSE5WK2R4VHFwaUZtSkpHZWp3dVNFSW5DMmM5Nk9sRTdqWjZoeEhx?=
 =?utf-8?B?bkJQSlJZOUNXelNDRkozRjdaRk1kNEtiYTBkQncxVjJBSUFIK0E3RHhKeWJD?=
 =?utf-8?B?MjRQcjhJQ1FuZEM0RkZBTDhWL2pDVlVONWhGYkJ2R0pTeVlQaHBLb2c0eStB?=
 =?utf-8?B?UnlpSExKeStwK2NVUHhvZHRWQktuSVZWUUpreE9yTDhoZ2dPOHBTMUh0bG05?=
 =?utf-8?B?Vk5QdW5kTVNnNlBlMHJuc0JsVDA5eUpQZS93RFdxY0hjMFJmMHcrTDYyR3pT?=
 =?utf-8?B?bkVJdFJKSFkzSmhVWDE2QXNzT3ZnRmZHYVc0YnJZRzBQaVhhTkduQ2k1V01G?=
 =?utf-8?B?VFdjWlhXUXZMNk5sTEZZcnFPM2VSZFJVWUZvVFp5b2JnRnFna1hCeUlzbGk0?=
 =?utf-8?B?bnhZM3BtY2tMZjgxQm1DdzdvaFRMSzJwQktzWDZrZXFRaUIzZjRSVXcrS2tn?=
 =?utf-8?B?UUNtVG1Ocy9mQklBMWswdHNzbkRzWEhwNEorOWVpRlUrK09JSkVRSHJ5UmRo?=
 =?utf-8?B?SmtPWk5hck5VZ0dIOUFTNDlvMFZEbEk4NTE1bG9MTWM0RjVyN3UvdUVKWWY3?=
 =?utf-8?B?bXlQT3ppZ1V6TzhuMUVYMkIvK2Vod212UEoxT3BVa3h1SG1rVHBKbmV3N3ZN?=
 =?utf-8?B?S1BjNTEzcngxMWRYU3hsbk5hN3lpdklTYXdqbE9odEMzNXNId3lBcHVwOGRt?=
 =?utf-8?B?SkNKTndjMGJtc1MrSGsvM1VSVXM3Wjg0b3piSzlXWW5Belo3ZVpvYVpsTVNy?=
 =?utf-8?B?alRsRFlOMVhEczlKVGI5aGdoUEtRaXlFUWhJNzFmRFNsa1BhdzB0T0VLdlNI?=
 =?utf-8?B?Wll5N1FaVjJ1VC9HbC9vM2FGekpjV0dQdzYwSG1qZWZFRmswckdwTStidEhX?=
 =?utf-8?B?d1FCSlRjK2psOGpzM3JVR2ltY29lSWFUM21Xb0QvWHhqcE5MNkViSkF4T2Fv?=
 =?utf-8?B?UnNxQzJkZ01KVVdvNUVFVmFQV2hHMFlIK0VMNFdhaWl0R25jZUtrTUFOUm5q?=
 =?utf-8?B?RnVnZnpNYnFvWWlVRFZ4RXNQNHkrcHk4UkpFUjd0bVlUT2dXUHlVVk56VUla?=
 =?utf-8?B?VnVGWlhUblVKdXlkdjFJaGRwaWpRb0J3UGNrWTV6MFF1cUdGQXVPeW0yS3Uv?=
 =?utf-8?B?NUF2eE5mdnI1NW1mbHRGTzd6dTVtZFZxMEVERzhZdTFHRTFPcHo3YWN2dUtU?=
 =?utf-8?B?ZFFXYitrK1RVOUpDR2t6U0tabGYzWE13eTdybmYvNFhMQnNHdHJpbmtlaG5z?=
 =?utf-8?B?bDVwOXE0ZzBzVmR5b0ZFL2NGR2pkNXUrY2dvYStXNTVZaXpCYlBxak5pemFa?=
 =?utf-8?B?b3k1U1Mzd00zSGVkOG91eWhxSFVsdnpJMHVvdDFLQk9NRXhoZ2lVdTN1ejJk?=
 =?utf-8?Q?ryNCZuBdID0d/D1LrJPDC71avr6TV+MHdB5IsOy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e094c041-5f40-446e-3e59-08d8e21014f1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 08:56:37.3047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cqjExO6eszyLJZ5QjM7cuXjrj1C3K9g7WGi+6GUfxboEnQ0V43DszhyuF2f+WfOrYYI/faW+nptNj2s/oTiNJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3740
X-OriginatorOrg: citrix.com

On Fri, Mar 05, 2021 at 10:50:34AM +0100, Jan Beulich wrote:
> Prior to 4.15 Linux, when running in PV mode, did not install a #GP
> handler early enough to cover for example the rdmsrl_safe() of
> MSR_K8_TSEG_ADDR in bsp_init_amd() (not to speak of the unguarded read
> of MSR_K7_HWCR later in the same function). The respective change
> (42b3a4cb5609 "x86/xen: Support early interrupts in xen pv guests") was
> backported to 4.14, but no further - presumably since it wasn't really
> easy because of other dependencies.
> 
> Therefore, to prevent our change in the handling of guest MSR accesses
> to render PV Linux 4.13 and older unusable on at least AMD systems, make
> the raising of #GP on this paths conditional upon the guest having
> installed a handler, provided of course the MSR can be read in the first
> place (we would have raised #GP in that case even before). Producing
> zero for reads isn't necessarily correct and may trip code trying to
> detect presence of MSRs early, but since such detection logic won't work
> without a #GP handler anyway, this ought to be a fair workaround.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Probe MSR read. Exclude hypervisor range. Avoid issuing two log
>     messages (in debug builds). Don't alter WRMSR behavior.
> ---
> I'm not convinced we can get away without also making the WRMSR path
> somewhat more permissive again, e.g. tolerating attempts to set bits
> which are already set. But of course this would require keeping in sync
> for which MSRs we "fake" reads, as then a kernel attempt to set a bit
> may also appear as an attempt to clear others (because of the zero value
> that we gave it for the read).

The above approach seems dangerous, as it could allow a guest to
figure out the value of the underlying MSR by probing whether values
trigger a #GP?

I think we want to do something similar to what we do on HVM in 4.14
and previous versions: ignore writes as long as the rdmsr to the
target MSR succeeds, regardless of the value.

> 
> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -874,7 +874,7 @@ static int read_msr(unsigned int reg, ui
>      struct vcpu *curr = current;
>      const struct domain *currd = curr->domain;
>      const struct cpuid_policy *cp = currd->arch.cpuid;
> -    bool vpmu_msr = false;
> +    bool vpmu_msr = false, warn = false;
>      int ret;
>  
>      if ( (ret = guest_rdmsr(curr, reg, val)) != X86EMUL_UNHANDLEABLE )
> @@ -882,7 +882,7 @@ static int read_msr(unsigned int reg, ui
>          if ( ret == X86EMUL_EXCEPTION )
>              x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);
>  
> -        return ret;
> +        goto done;
>      }
>  
>      switch ( reg )
> @@ -986,7 +986,7 @@ static int read_msr(unsigned int reg, ui
>          }
>          /* fall through */
>      default:
> -        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);
> +        warn = true;
>          break;
>  
>      normal:
> @@ -995,7 +995,19 @@ static int read_msr(unsigned int reg, ui
>          return X86EMUL_OKAY;
>      }
>  
> -    return X86EMUL_UNHANDLEABLE;
> + done:

Won't this handling be better placed in the 'default' switch case
above?

> +    if ( ret != X86EMUL_OKAY && !curr->arch.pv.trap_ctxt[X86_EXC_GP].address &&
> +         (reg >> 16) != 0x4000 && !rdmsr_safe(reg, *val) )

We didn't used to care about explicitly blocking the reserved MSR
range, do we really wan to do it now?

I'm not sure I see an issue with that, but given that we are trying to
bring back something similar to the previous behavior, I would avoid
adding new conditions.

Thanks, Roger.

