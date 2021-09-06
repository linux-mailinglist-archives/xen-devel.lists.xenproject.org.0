Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32155401A69
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 13:15:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179639.326017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNCaZ-0001y1-Rb; Mon, 06 Sep 2021 11:14:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179639.326017; Mon, 06 Sep 2021 11:14:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNCaZ-0001vE-Nb; Mon, 06 Sep 2021 11:14:59 +0000
Received: by outflank-mailman (input) for mailman id 179639;
 Mon, 06 Sep 2021 11:14:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4nFA=N4=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNCaX-0001v8-AA
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 11:14:57 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aa40d6e8-0f03-11ec-b09e-12813bfff9fa;
 Mon, 06 Sep 2021 11:14:56 +0000 (UTC)
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
X-Inumbo-ID: aa40d6e8-0f03-11ec-b09e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630926896;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oQV7QHWU6OhwydPZsJEIiXObTnGSTwrrzOwsyzrQ4C8=;
  b=CGCwooLj5I3XYEHoqM8dDeJ4sCXe9n+ZgyAgYC6gyk89HPdbeqa5jkJ5
   66ie8t0BcDYJNX0QjB4UpUVwo7ewMD4n7Cv3Q0mDOVTCKssMxTdwzitw2
   92sW+ShPcl2Setz3TsC1wJzPidfss4MlFmC2ktb46Xr+N+51j3vSXd491
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: yyVzsrerJc31Vq4XhX3BSvdEhgA5sZEjHA742tSj20s9+xubdWoiSaMDCSH6hmbZI400VsWs1B
 u//yIyX9p9pGYrSjQ5UnJ3vAqAwN7oaS0f1xvAoW2gCzEQunYN0bvunW+9FfV+7Koi27tqAoMJ
 B4zp6BWdsj/RB8RctWGYdp44K/JkHHmFHrBD1wCv2G+DAzgskNQPbQRfKE1Oat1oc3BPyZXY3J
 tebEh9AXWiSgOWDriF/pvDEIqCiYXLBk5WB9uptuowsUGq8bKLkvfH8HjRbPDSBeZ7CPoFKF0J
 Vfy5+SESMhoBns0iUUAMAzNa
X-SBRS: 5.1
X-MesageID: 53838646
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:aLpIX60KMs9qunmdlIZzSgqjBSVyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJE80hqQFnrX5Wo3SIDUO2VHYUb2KiLGN/9SOIVyHygcw79
 YGT0E6MqyLMbEYt7eL3ODbKadY/DDvysnB7o2/vhQdPj2CKZsQizuRYjzrY3GeLzM2Y6bReq
 DshPav6wDQAkj+Oa+Adwc4tqX41pH2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbdz9U278t/U
 XMjgS8v8yYwr+G4y6Z81WWw4VdmdPnxNcGLMuQivINIjGprgqzfoxuV5CLoThwiuCy71QBls
 XKvn4bTotOwkKUWlvwjQrm2gHm3jprw3j+yWWAiX+mmsD9TCJSMbsLuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBDjCOP0DkfuN9Wq0YafZoVabdXo4Ba1lhSCo08ECXz751iOP
 VyDfvb+O1dfTqhHjDkV1FUsZmRt0kIb1O7qhBogL3T79EWpgE586Ig/r1cop9an6hNDaWt5I
 z/Q+xVff91P5YrhQ8UPpZ3fSKNMB25ffv7ChPaHb3WLtB0B5vzke+C3FwU3pDhRHVa9up+pH
 z+OGkow1LaPXieUfGz4A==
X-IronPort-AV: E=Sophos;i="5.85,272,1624334400"; 
   d="scan'208";a="53838646"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTFVkScVpNPVsclnXnFuj4JvvGK/1s0ApPARsh0d/iWpD8pSSiLkAwf6VIXPHOu3j2aWD0dE4F0hDKP/eRn9xZpaEvT5NUOwsMCMWqVg5CpGAxSbR2fwSTySX16N+KVikuxLzcFEr/u45282oV90Zyyw7Rz2F9O+2qKvB+luH0GeZDtnoeHxQhLRb0Go24e3/2/eQAAaxARPOuWb8hhNGBeL5ehxG76o2n3HibThUIkdMoofuP+kMqr+mFb+kPfvycL0nLECrpLxIRWA0hJgQSZah/EHyMq4ql99iqaxoeApHYSt8hdNKqQdBA1dMBer5ubGvFMHnP1emKCQNVo7TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=8DIosnqOWGFq84M1MwFZbsweglLBrZR4689wCKGnoEo=;
 b=WTHfwF0DMLPA753PCnSHlnYAIx01fG8ynSdC2nMEC2hgmfYwhF1IdpJoyHR7sjX6BuoWpDpZyA6EIwwegF/U8dM1Nzg2wYgVoAUtK0vp2s9zMH5FqPIRWFZ/K9LAXUsuuht/bqiqGAsgVBl+ny1q16n6MYKewc3ZFNbrlgO5yD1Q4mycL3s3ex41h+8rH34E+Bvidopp7Fx7tup/P4dXkOZK19E6w3Kfs1mEbcy6Tsw7jdBtvh2O4tCHN5H17kTDxLAYfkbovMRbCNKfZEGj8yPNZMywwDM6lTOiVlL7sqJs5P8xl3d2f87dZdP/yZe3mhXpY77EggI85YcyWasPAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8DIosnqOWGFq84M1MwFZbsweglLBrZR4689wCKGnoEo=;
 b=tKS3XzxezhVNWqq8dERxaqZinaSdwFM6ZV9z3GkNvtjlaOiCSyD/nGXf4uvdasoaaHqg7GIAuH/36H6x9n2xEO/ANsZ9g7NtDFVWJ0MeR1u18+WUu0tBGohqwUimPVDJNCEGnadaKWQNxHEYikEVVldlZ12NEXc4eDgtB/XdXBM=
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
	<dfaggioli@suse.com>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20210906110057.15384-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/sched: fix sched_move_domain() for domain without
 vcpus
Message-ID: <0006eb7d-a9d5-16a3-1418-a1d28c4c9a92@citrix.com>
Date: Mon, 6 Sep 2021 12:14:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210906110057.15384-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0479.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf2db25f-b70b-40e5-c3cf-08d971278cc8
X-MS-TrafficTypeDiagnostic: BYAPR03MB3991:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3991EF2368100BB28F15D143BAD29@BYAPR03MB3991.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dRMdJT59jD9HEbsbKrDV21D/67nPcMkBsI+56z0WjGfIDNFw7MgVMvf7twq7lmI9hkAPslZnIDy79AhiFxSkeerzWahE7stTGUmaV96GGlqkZgYy4PIXfK8gUUPFQ0Ae9l7Ofm2bH2cBPao3OpcjhjG05eaJZ6dPSTBkKuYpE1VldiqXmv0z52gMeFTObWz5HIfluoViFbBjK3iq/wsCh7jlyisjQaTNcUmpuLTW04j0n6XBJqwPXf4+zQ6F7DtqQS0WQM1HAwbaeQLEZ+6HO75zdyrXFZyT3+1/UgWcvmr+grhCkU5yPht/fWWemGqaXtuA30jIf0SFT2FWYS1PjibV7jYXQ3nsHBND8d1cLTaU2Spvm/AlKaUo45wmN2ECkbWnzmROfAcmkQAd7Hf6wxH2zsMyf6Ik3+an2moUmzfujCj6LYMEu3GMfgxhcor8FvRC1HQ4k9AvEVuEWhaePJpM1NFDK7iLtNlyFJnscuApeJsB9S5/1XEe7HLdaxm0JOvbXQ5FoNL/YWxnpthbfuvU13VNKzIqri8p6wG8EA7/PGVGecz7NyAQanpirPaqG2defy6Gy45v+v8sLVJhHyBII+A3lf3JF9bagp+o0LXF0/iz8gcwEZlUuYSDfcims3kXNIif3DiIQ+PUflmBju2AZX9v+xaDnDYRBlYAiFTHh8qER/4M3/bIRjzk/OWIkOXkwbpKZbJniGhdHWJGBexqjk5tvwR9Pujsdn9UYR4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(4326008)(86362001)(66476007)(66556008)(66946007)(31686004)(38100700002)(31696002)(16576012)(316002)(2616005)(54906003)(2906002)(956004)(36756003)(5660300002)(478600001)(6486002)(6666004)(26005)(8936002)(8676002)(186003)(55236004)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tlg3T2hYTU5oZGR1Z0dub1UySWZDeXNpSndIRGk3VmVMTndDUDBnQ0l3SmVF?=
 =?utf-8?B?bmZxVS9JVUFDSzR2MDNoUkt5TnlyQStRbkx4VVV5Mlh6NlYyMUxrUHlZclov?=
 =?utf-8?B?U29WQWJ2WjlOaDA5WkU1bVJ0c2N3K3lKdGxlNEhKZlZOd0FNWEJNdzlHeUx1?=
 =?utf-8?B?cjZldy82OVNZNnpvVXlBWS9DQ1VyTFdiWHVTckhrZmthRXBkQm90NVhzZEpm?=
 =?utf-8?B?RFh5WEo3NVZwQ3d5MnBkVWNWTVA4a1N1OERBVkpxeWpJZ0VvNlRwRWpxem9G?=
 =?utf-8?B?VjZpb0xEUUhwSGdZVGNmVHRJWkFFM01pOXhETDY3U0F4Sm10YVlXa25jNmR2?=
 =?utf-8?B?UjQzT0hEQVN1MjY3MGU4a2hFR0RLUk5tV01aZTZVbzQvTE4wQkNYbWMwNXBx?=
 =?utf-8?B?ZUsvaitHbEFmZzhEdXZ4ZWVBdHowMnVrY1pZdVFxdGp2MzBmT09Nb1RNQmMx?=
 =?utf-8?B?SGo0TVROckZkS3NRRWxrNjArbEVuQ0NPSUREZFY3L2dBaGxpVmNINUVSWWFW?=
 =?utf-8?B?bG0yQW5VM1BKU2lCQUZoT09ZQ3JCQXRlREdtV0Y2L0pON0t0eEZmQTZhWUlS?=
 =?utf-8?B?Tm5qMkJXRTNrUlpzL0pOOFBIaFI5anp0dzFPY3RGZ2g3Ymx4K3R6M0tBMS95?=
 =?utf-8?B?VkhOeWhKSndITFIxQXlhWkduVnJ5VklyRmNKWmtlamZPMDZHM3lLMzBOVnp4?=
 =?utf-8?B?RFp1SVJtb1J0NkpKcnpiWDRTNFEwbU5sZHE4SVlDN3FYd010d1duS1hVaGx3?=
 =?utf-8?B?b1Z3amFJam5LS1YyYUVYWEFXbngvWi91WHhNWURHVis5TEYyeGh1WER1cy8z?=
 =?utf-8?B?VmFTUUlBQ0dLait6V2g0MEFYQXBMTTM5YjdlYm9qeGJqTlJjN3Irc1VRZDhW?=
 =?utf-8?B?Uk5GU1RycGN6WlREQ0R3UFJ4NGhrL0dPem9WeWlqK0JZYWo3NUlsYWJoZnYw?=
 =?utf-8?B?NS9qRGtyWlp3Y1RyYXo5ZUpTMWEvZkNqdTN5UjlQbENPNXJ6WHh0eXB5QzJG?=
 =?utf-8?B?bkg5ZFJadWh0WWxUN0dLbEhVaHF2U3YxRFBEdnRvcUM0dUV4VFRMOHZ2ZWVu?=
 =?utf-8?B?c1d3Ulp4Mmh0TW1lTzVIeVI0RGg4RVg5WWVHMzFzWTdoR3YyeFdBcTloN2k3?=
 =?utf-8?B?VDNvR3ZITy9UYXBJbVRpV25CRHluUjFiWWRiTHZrMi9yOHNReEMxRzIwaytv?=
 =?utf-8?B?M3orSm9TTUlKaXBzTFJqaUtoVGxHTkdEcE9oWE8ybDRvM2FUNXhsc1hYNmph?=
 =?utf-8?B?TGp2OG1CSXhKam1PYTNxQVdub0VzMmVCS2d4RC8zQkFnckF0TnFLZkdUcyts?=
 =?utf-8?B?bjNJNHREd0JiWUUvY2J5SUhLSkVhYU5IUGI3cEJlcWhNR3hqZTJEbXpDNCtT?=
 =?utf-8?B?YXJHQUhDbWsveHBJM2l5LzZldVgvRy9abG5KR01NVHgrOVhhRTVWMmhENExw?=
 =?utf-8?B?RElra3Y2cktLTEtwaCsrVmVYWHpmQVgvQlRKdUJaZ2R4Qlg3TTdNMWdvTHNH?=
 =?utf-8?B?MFBKbDF2clN2TCthKzZIYkFQWmZaOVArVk9wRVNaT3U1N3VDM25oZ1pKMFc1?=
 =?utf-8?B?U2lUMjBkL2d3VFU0MXpQOFRFN3JHd3hOTkdXZVBoblFjQklKeFMrUyt2Vmta?=
 =?utf-8?B?V2hVTkNqTlNNMWppbjNLcjI4N3NKOTRrSklKd3NhUE9RenRZRzVHSXVjZG1R?=
 =?utf-8?B?bC9sTEljbUl0K0QvbkYybDRqcDNMNjhZd2VSQWkybkxwMjBCZFdXcVBVVDMv?=
 =?utf-8?Q?zBUUJvdpOL/EisBr6qEN0nrQZf2z3ORwgIjAZVd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf2db25f-b70b-40e5-c3cf-08d971278cc8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 11:14:53.1255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fMhuUD/SMf1NFDcp42cw3DqgZen+tXZIJFW8udj0JUiN5rya9nJktGpoElUOeBqcwxmUSY+AaLqChpX6+6wBUG1ZGyE+nSWZgtiPx2+Ln6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3991
X-OriginatorOrg: citrix.com

On 06/09/2021 12:00, Juergen Gross wrote:
> In case a domain is created with a cpupool other than Pool-0 specified
> it will be moved to that cpupool before any vcpus are allocated.
>
> This will lead to a NULL pointer dereference in sched_move_domain().
>
> Fix that by tolerating vcpus not being allocated yet.
>
> Fixes: 70fadc41635b9b6 ("xen/cpupool: support moving domain between cpupo=
ols with different granularity")
> Reported-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  xen/common/sched/core.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 8d178baf3d..79c9100680 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -671,6 +671,10 @@ int sched_move_domain(struct domain *d, struct cpupo=
ol *c)
> =20
>      for ( unit_idx =3D 0; unit_idx < n_units; unit_idx++ )
>      {
> +        /* Special case for move at domain creation time. */
> +        if ( !d->vcpu[unit_idx * gran] )
> +            break;
> +
>          unit =3D sched_alloc_unit_mem();
>          if ( unit )
>          {

I think the logic would be clearer if you wrap the entire for loop in if
( d->max_vcpus ).=C2=A0 This loop is only allocating units in the new
scheduler for existing vcpus, so there's no point entering the loop at
all during domain creation.

Also, this removes a non-speculatively-guarded d->vcpu[] deference.

~Andrew


