Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E19312D78
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 10:39:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82660.152629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l930g-0001IU-9C; Mon, 08 Feb 2021 09:39:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82660.152629; Mon, 08 Feb 2021 09:39:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l930g-0001I6-4w; Mon, 08 Feb 2021 09:39:10 +0000
Received: by outflank-mailman (input) for mailman id 82660;
 Mon, 08 Feb 2021 09:39:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=atCq=HK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l930e-0001Hy-W9
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 09:39:09 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ce1e02c-5ccd-4ee5-a133-d4280913eebc;
 Mon, 08 Feb 2021 09:39:06 +0000 (UTC)
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
X-Inumbo-ID: 2ce1e02c-5ccd-4ee5-a133-d4280913eebc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612777146;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=nSM6ADTd5b+CQTsgH7WSGLswgVPo6dJOBg75zfbU2+0=;
  b=WqDgb03i95NltYe6ArCBjl1LQPc9vlUqqlqcFkQihh2TssnNyg/7NkAM
   kSPM75tB/8dJtOoDiZvdgb+qmlQmP9Ta6O0PyL3hHDPgiGvwvmNRDrlrn
   ya9p0zYtzQbyQOjz+WxqkRZ/d46MAY9d0cjY9cVEA1aq6YDTb+itbc5rj
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: XbaO5SN1pumLcMYO50PiMWGTIURoI0NGLwT/oun//Sg83ZtDBePyXefsxon9Mtt37cnSuuvEFD
 HwntF1g5d5NFp96XhqpbmZkm41O1ZiLY2jltV5dE70SBbb+KIZUMsHmaUK8k0A0zE9dKvrWB+O
 aZ6Au8TTNjAnVMygtU6xgzQpfYH5RN0GPyeeUCT3V8unio73mAz6+1Ne3KadhdUnpHnL/03DD2
 nMH4V3TeTRipDNAP/p1IUSIryT6NT88GdZtLHzlkkeI1v3FDdMDefNA/Q+msex1jRRBkyyQGrO
 9xA=
X-SBRS: 5.2
X-MesageID: 36701346
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,161,1610427600"; 
   d="scan'208";a="36701346"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQmf9JddjhhK0aswZCGs4kp0V3vVTw3mk5R0tNPFvkeWl81baYZ79CSJ06QdGpRreaORq0Ujf6N+0vQRUxtnwGlcdds5UuNjlGbLaBntRhuNUdHo5p0CLtMP/Eol7PtERBnq6YO3UDSIz4XksC2g4AqGel6PwZTPJgVgGSq3X9RCHiFEQGEmP4KOip08v5axBcD91A8yoYIul+sGH5NmoAuENSRmn7utwXA0HWoisBZFPK9J/Ubl/M8++qnvhV8ffcRcbgzs9PotncgFexBHAzmQsM3lz/Npc/mYg8V29Axsm4LQEPbOnsUrnVbzXjdaIxQ2Ab2s0vv35wGPP6r4uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxQUzOQovPq+4OVo/Jsj2TfPDsijD3JtXeQggZxcGwc=;
 b=VK3W/YP0WiDdE+Ob3xQ0au2uxtZWW3bSK8g6fPl9c+1nXzqbXiYnWPM1MXxYEAP+fFMCQDdP6LLt8YjPrmp7LBAxOayOur4R79O/zo2ftzfT8u8GAENyLO+k/qibwcN/ZoVev2P78Gt/jCypAfgINzz0QsL01ud4AIR2n0vTsEzTdGKs8BPEbQxX2owpnP8quTY/kjPVN3zvY036UopszlWEkugxfinYxIHmlPdzkuD03rcGvHe8mfYc13C7dL6UrDpl9fEJEPvvqbP4oKzuE4sDavEuG8XVEEgz6GVdBgtFNcRxjWP6+NagTwy4bVQ+ORaYiQTNMvwDj4J+2/85Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxQUzOQovPq+4OVo/Jsj2TfPDsijD3JtXeQggZxcGwc=;
 b=vLWn71cTdNP/jWzl+1ImipIcPB5Yb9eDkT6tFb5QM9qyWU1oM3M0Gfcamkj6z91jOyj2myXKWO0OFDblKgVoYPoewFGl6Zkxn+PvYkDfQ5nseFVPbqM4Oxd9Nu0FRuagvOPRVehC3j79glLrzsv+N4DsPUC7I81ghbdiuK97Ksw=
Date: Mon, 8 Feb 2021 10:38:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Claudemir Todo Bom
	<claudemir@todobom.com>
Subject: Re: [PATCH v2 3/3] x86/time: don't move TSC backwards in
 time_calibration_tsc_rendezvous()
Message-ID: <YCEGshHDEH9bJU7y@Air-de-Roger>
References: <b8d1d4f8-8675-1393-8524-d060ffb1551a@suse.com>
 <80d05abb-4d53-3229-8326-21d79e32dfe4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <80d05abb-4d53-3229-8326-21d79e32dfe4@suse.com>
X-ClientProxiedBy: MR2P264CA0150.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9afb7208-f6ad-404c-0b28-08d8cc155f21
X-MS-TrafficTypeDiagnostic: DM6PR03MB5324:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB53245470C79D61175367B3C08F8F9@DM6PR03MB5324.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: auFZXBLtBwOZTBghv4qFEHRp0qNWHo7I8QFox3ek88otYnlM5T/dknpzjiMAFyQ0yYTF/qm5HSsWB7Aw2jjtSkJwk0Iu1UHsP3a1V61K0Xss7UR45US9nGj17ZoQPc0p+f9NY1G+jXG0arODZ8Wi9g3tV8alUQTvStL4Vo1U2i1LQqQ2hbfCrO1uB+jMIlfG7lDZqfg2SlDXD9OJ+uqFIJPqPLEEYn8yBBx8qJcJY8uPqk897loNCmcK5ch2KJcyeee15qqflWlG2OCGa7LRCFElf8OJHkCzQTrhtSr1SSpp6ClBYb5j1MyGNGAo9AVVP93PNfg/nj6nIEbj+2MQZ8m3dx3v+YXKIlRGEWLV+JN00NrSyt1pU64FfyJYKgplms2Ex/VIYTWBg7jrThaNVA1ixNIhLoEUqHGZPPgHg1agclharGku4NR6mDR2K3hPfXvaYfFiunPnAPSyGUHCN291kdipgROFjU3da515IUVwEKeosRa0NFe58xuqeUv3WRRx2RSeV8P+MPJ9mCBWNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(4326008)(6486002)(8676002)(8936002)(956004)(16526019)(9686003)(33716001)(86362001)(26005)(186003)(83380400001)(316002)(6916009)(54906003)(66476007)(6496006)(5660300002)(66946007)(2906002)(478600001)(6666004)(66556008)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T2g0cjB2dERTdmVYUXJNMDNKcG5Uc3JwWUJueXgzaTkyVThRbURlOE5veFE2?=
 =?utf-8?B?UU1HbVFyVE5KYTRMeEd0azc5a3Zkek52MC9kK2FEOHJZNkdReTJZOWtXY0lo?=
 =?utf-8?B?dUZYVUNOT0VnNjFkcW5QemREc0FOMllYSTVoeVdVQnl6NkVoUW05NGpycW5E?=
 =?utf-8?B?NlpPTVBZa0M4VXU2RERKMUNJbGQwUFZLSjBUOHFyVVJtOVlwR2RIdnVpTGow?=
 =?utf-8?B?NUFBK1I3QXB0ckhiQXZXYkpjVnpCa1pGdlB5NHdkZkcwV25vbXV2VGRPUGZq?=
 =?utf-8?B?b1I2Z1MvQVErNVoyV2hkU1Q1OXlRL1BNMzdER3JZaG9FNXg0REVjRWREdGlQ?=
 =?utf-8?B?ZVJZZG5FMGFuT3FiV0hCdjJTU29VSlpKV1h2clZ4TlgrdEFDb0t4R3k3NTlR?=
 =?utf-8?B?bkVtZUM1Ti9GTVFFWUZZck5WZ1lzMVRrUk5SWW81c2Z5UC9DbFo3OTN3bDFi?=
 =?utf-8?B?WG1JamhaUXpNdGxIVEltVzZWVzM5RFg3Q0l5T21vNEdJZXh3TGM3ZDBxa0Ew?=
 =?utf-8?B?VXo0S1RpUkVnNisybFVFazJ0dkV1Tk1uMk9JRGtJSGYySndzaEFqdzV1VlU4?=
 =?utf-8?B?UWdJVG4rTm0rM1JLSE1BckcvckFsZzdKSDJPRVZKQklXVitLTUpaTnhlQ3cv?=
 =?utf-8?B?bkZVWm9udm54UlpzSmpqUTNMQTBWUnNBTExHUWtOaHhyK2FXcktaZVVRZ2k4?=
 =?utf-8?B?YlFROUduRlByUElaWmZITU51V2lIdWRSeDg0ekdzRWRwbHVULzAyd0YyeCt5?=
 =?utf-8?B?bmhtYUlqZUw2Zkxnc3JWY2x2Z045Q0swZW9PcHA0bng1aDBZRXBhamU1azVu?=
 =?utf-8?B?S21kb3htM2pGTnBmenlWem5nVzdEQnpjaWZWQmRvN1FUclV5OFJmTWpELytF?=
 =?utf-8?B?QThSUVMxcytReFk2aWhjZjNsVnF1bmhZazBvUjczUWZ2QkxqZ3gxMWh0YVBO?=
 =?utf-8?B?YW8zNkRVQ2k1NFZCTm12bGdwTXZEQnlRY0pydGQ2UlJ2L0dtNjFXeUZQVmhw?=
 =?utf-8?B?ZUlOZ1FPalIwSFRMSSs1WktFbTE4d1NNOU9CZ244ZEtsWkZ6bjhHalRoU0Vk?=
 =?utf-8?B?bmpSUWxsUkZwK1d1RFJpQXJ2dHRqNVo5T2RwaWtFaXk3MThRbUIvcEFuSXQ4?=
 =?utf-8?B?dEtRalFQUTc1RjFmNnovc2lIdTV3VjhXdmNXYWdHK1BDN1lqdThFU3ZzOTlU?=
 =?utf-8?B?S29ZMHptQ1VFRk8rd0Q3aVRhWHYyYVdFZlZ5T1hwSlNXN2Nzci9wR3gxbTRC?=
 =?utf-8?B?aUxvd1ljZmtUR01ZUC80LzZwSVlJSjg5OG41Qy9KSHJWeXhYSENibSs5NVZp?=
 =?utf-8?B?S0ovSVI3ZUJYbWJ2cUZ5YkR3LzRNait4ZEt3ZVNJcTcyeGhtanRmbjB0MXM5?=
 =?utf-8?B?d0M3cGxlSlZhMG82VVhzZmVFbWZtbmtrZVJCeGtuYWkxQm5sY205VkdXRlpi?=
 =?utf-8?B?eDJJRDFBNm5iUllEOGdMbWtWNUpvb240djAvd3EyWktROGhocThmU3pKMDdL?=
 =?utf-8?B?c1R5V2pzcWxVUTJ5OTZUMEpRTldxSUFpb2ZjN2dZaVcxbXZrQUxMTjNvNERI?=
 =?utf-8?B?dGVsdm1CdTlLYy9xWmduSUxPcEtJS3lmakExU3pUWkg1dHlvaWJTTCtwcU9V?=
 =?utf-8?B?TEdwK3pMSWhOekhzbFlRZjEzdWQzeC9WTkN5Zk1WYTlLUEhyWlJxazBOM3Bj?=
 =?utf-8?B?dHc2ZmRXaEtYdCtUampMRElLYThpN2RBdnJSNFVNazNpU2dSb3IvZnh3U1NW?=
 =?utf-8?Q?CVWciejCcKIBu4g9Juh+c9eYZzvGenIlxwwrExX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9afb7208-f6ad-404c-0b28-08d8cc155f21
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 09:39:03.7227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TCAQcFOHMA5XzM94PEGbUFSuwxjuU0fvCkiKDg2zS/oJdasgi9VT6O7y7Y43BE7gdPQaaSgNpn1WnAiqNRf6xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5324
X-OriginatorOrg: citrix.com

On Mon, Feb 01, 2021 at 01:43:28PM +0100, Jan Beulich wrote:
> While doing this for small amounts may be okay, the unconditional use
> of CPU0's value here has been found to be a problem when the boot time
> TSC of the BSP was behind that of all APs by more than a second. In
> particular because of get_s_time_fixed() producing insane output when
> the calculated delta is negative, we can't allow this to happen.
> 
> On the first iteration have all other CPUs sort out the highest TSC
> value any one of them has read. On the second iteration, if that
> maximum is higher than CPU0's, update its recorded value from that
> taken in the first iteration. Use the resulting value on the last
> iteration to write everyone's TSCs.
> 
> To account for the possible discontinuity, have
> time_calibration_rendezvous_tail() record the newly written value, but
> extrapolate local stime using the value read.
> 
> Reported-by: Claudemir Todo Bom <claudemir@todobom.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Don't update r->master_stime by calculation. Re-base over new
>     earlier patch. Make time_calibration_rendezvous_tail() take two TSC
>     values.
> ---
> Since CPU0 reads its TSC last on the first iteration, if TSCs were
> perfectly sync-ed there shouldn't ever be a need to update. However,
> even on the TSC-reliable system I first tested this on (using
> "tsc=skewed" to get this rendezvous function into use in the first
> place) updates by up to several thousand clocks did happen. I wonder
> whether this points at some problem with the approach that I'm not (yet)
> seeing.

I'm confused by this, so on a system that had reliable TSCs, which
you forced to remove the reliable flag, and then you saw big
differences when doing the rendezvous?

That would seem to indicate that such system doesn't really have
reliable TSCs?

> Considering the sufficiently modern CPU it's using, I suspect the
> reporter's system wouldn't even need to turn off TSC_RELIABLE, if only
> there wasn't the boot time skew. Hence another approach might be to fix
> this boot time skew. Of course to recognize whether the TSCs then still
> aren't in sync we'd need to run tsc_check_reliability() sufficiently
> long after that adjustment. Which is besides the need to have this
> "fixing" be precise enough for the TSCs to not look skewed anymore
> afterwards.

Maybe it would make sense to do a TSC counter sync after APs are up
and then disable the rendezvous if the next calibration rendezvous
shows no skew?

I also wonder, we test for skew just after the APs have been booted,
and decide at that point whether we need a calibration rendezvous.

Maybe we could do a TSC sync just after APs are up (to hopefully bring
them in sync), and then do the tsc_check_reliability just before Xen
ends booting (ie: before handing control to dom0?)

What we do right now (ie: do the tsc_check_reliability so early) is
also likely to miss small skews that will only show up after APs have
been running for a while?

> As per the comment ahead of it, the original purpose of the function was
> to deal with TSCs halted in deep C states. While this probably explains
> why only forward moves were ever expected, I don't see how this could
> have been reliable in case CPU0 was deep-sleeping for a sufficiently
> long time. My only guess here is a hidden assumption of CPU0 never being
> idle for long enough.
> 
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1658,17 +1658,17 @@ struct calibration_rendezvous {
>      cpumask_t cpu_calibration_map;
>      atomic_t semaphore;
>      s_time_t master_stime;
> -    u64 master_tsc_stamp;
> +    uint64_t master_tsc_stamp, max_tsc_stamp;
>  };
>  
>  static void
>  time_calibration_rendezvous_tail(const struct calibration_rendezvous *r,
> -                                 uint64_t tsc)
> +                                 uint64_t old_tsc, uint64_t new_tsc)
>  {
>      struct cpu_time_stamp *c = &this_cpu(cpu_calibration);
>  
> -    c->local_tsc    = tsc;
> -    c->local_stime  = get_s_time_fixed(c->local_tsc);
> +    c->local_tsc    = new_tsc;
> +    c->local_stime  = get_s_time_fixed(old_tsc ?: new_tsc);
>      c->master_stime = r->master_stime;
>  
>      raise_softirq(TIME_CALIBRATE_SOFTIRQ);
> @@ -1683,6 +1683,7 @@ static void time_calibration_tsc_rendezv
>      int i;
>      struct calibration_rendezvous *r = _r;
>      unsigned int total_cpus = cpumask_weight(&r->cpu_calibration_map);
> +    uint64_t tsc = 0;
>  
>      /* Loop to get rid of cache effects on TSC skew. */
>      for ( i = 4; i >= 0; i-- )
> @@ -1692,8 +1693,15 @@ static void time_calibration_tsc_rendezv
>              while ( atomic_read(&r->semaphore) != (total_cpus - 1) )
>                  cpu_relax();
>  
> -            if ( r->master_tsc_stamp == 0 )
> -                r->master_tsc_stamp = rdtsc_ordered();
> +            if ( tsc == 0 )
> +                r->master_tsc_stamp = tsc = rdtsc_ordered();
> +            else if ( r->master_tsc_stamp < r->max_tsc_stamp )
> +                /*
> +                 * We want to avoid moving the TSC backwards for any CPU.
> +                 * Use the largest value observed anywhere on the first
> +                 * iteration.
> +                 */
> +                r->master_tsc_stamp = r->max_tsc_stamp;
>              else if ( i == 0 )
>                  r->master_stime = read_platform_stime(NULL);
>  
> @@ -1712,6 +1720,16 @@ static void time_calibration_tsc_rendezv
>              while ( atomic_read(&r->semaphore) < total_cpus )
>                  cpu_relax();
>  
> +            if ( tsc == 0 )
> +            {
> +                uint64_t cur;
> +
> +                tsc = rdtsc_ordered();
> +                while ( tsc > (cur = r->max_tsc_stamp) )
> +                    if ( cmpxchg(&r->max_tsc_stamp, cur, tsc) == cur )
> +                        break;

I think you could avoid reading cur explicitly for each loop and
instead do?

cur = ACCESS_ONCE(r->max_tsc_stamp)
while ( tsc > cur )
    cur = cmpxchg(&r->max_tsc_stamp, cur, tsc);

> +            }
> +
>              if ( i == 0 )
>                  write_tsc(r->master_tsc_stamp);
>  
> @@ -1719,9 +1737,12 @@ static void time_calibration_tsc_rendezv
>              while ( atomic_read(&r->semaphore) > total_cpus )
>                  cpu_relax();
>          }
> +
> +        /* Just in case a read above ended up reading zero. */
> +        tsc += !tsc;

Won't that be worthy of an ASSERT_UNREACHABLE? I'm not sure I see how
tsc could be 0 on a healthy system after the loop above.


Thanks, Roger.

