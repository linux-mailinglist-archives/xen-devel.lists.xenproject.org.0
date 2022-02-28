Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 683134C63DA
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 08:36:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280180.478026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOaZj-0005Di-DA; Mon, 28 Feb 2022 07:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280180.478026; Mon, 28 Feb 2022 07:36:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOaZj-0005B0-A2; Mon, 28 Feb 2022 07:36:07 +0000
Received: by outflank-mailman (input) for mailman id 280180;
 Mon, 28 Feb 2022 07:36:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A4HT=TL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nOaZi-0005Au-36
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 07:36:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14a9ac3c-9869-11ec-8eba-a37418f5ba1a;
 Mon, 28 Feb 2022 08:36:03 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-27u34WfMPP-nNFKI0Jy9sw-1; Mon, 28 Feb 2022 08:36:01 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0402MB3500.eurprd04.prod.outlook.com (2603:10a6:7:87::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 07:35:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 07:35:58 +0000
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
X-Inumbo-ID: 14a9ac3c-9869-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646033763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7L+4fGJdLSsPnTKFR1c8paHCpzUNNRpMEQoSnfZBlUQ=;
	b=P25d5xb93z3OQP4n/Q1hUTHHvWrvmonNFKqu42kEioq8mc1B0tItAOgyHvlAVLSAJdlUGP
	u2RiMHdcIpeeq4WNI8zSDfVnWLWdNYMgmV3fbJ14Bvc+ljI9c9m2JmjbgiBklJLw9D8zAM
	5S0CSz9d+7vqmB8m2AwxVsKrmV/iFkI=
X-MC-Unique: 27u34WfMPP-nNFKI0Jy9sw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MErZwVDWS/FsMxcpc1QOfGKEZrErCBexjSOVbW1iPvOiqFoEkYXMoMx7bKN1y7iqR0qbJDH625s1EZOYNo9nrNLwdGKXZX28o8VpORPQUN8RNvY2RyFKlCERuQSwRZ3wUel9EbPqcEcJDh4XOUkPTwrVWNyc1XSplnfmyaxPiRtXkZoH0ss+hnq6dtDUgF0TNWEcFUinZ6izurJA8ZTdU9gpHazKMVQRmQuyB7v0aVAwUHV3iksSlvKRrkwwNlJeecXIjuPMOL6Q45UlqNu8IGgJBOTNbfkalhpjGil3AcszCDmrNYmK/SpjYpsURyg5s+6SX8sp92edG6Gyle8Zlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQl0y/cY6I+hCBgQO+PVjS03gmBWQks8OM1Zvf8d32Y=;
 b=oUECcyXi2XhguxQh4uhDef/xhaamB4rLa5w6Y7inZ25WyofwlPpiCiNlH6swQH26DhPfSrxZkXUo06LZwDws3kIb6m2KVQEGX64r2kahk96vFwPWfp7pB65QdS8zG1BxwuNRam/bSBCRgnJpBBmBIGtM5IhTJ5Ia6KiyOxjRwttgAukeg5PHkoqAtUOCsPDAorljvfCYFoPy8IsbC0q2gUha8aeJPDVccYwHgaOOka5maLs36WLBlcwq2rVxCXBk+FokoTJP1SS/fupTTt1+qg3YdO3J+ITTDz745gncvFlZuPfqvWk+k8QNKdW7bCfU5ocjIsnINMRJbkF9PnQyOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2e1dcfb8-20ae-26b2-427d-9c19bd8c8add@suse.com>
Date: Mon, 28 Feb 2022 08:36:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: x86/vmx: Don't spuriously crash the domain when INIT is received
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Thiner Logoer <logoerthiner1@163.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220224194853.17774-1-andrew.cooper3@citrix.com>
 <20220224194853.17774-3-andrew.cooper3@citrix.com>
 <12d8b90b-15b0-c094-71e5-35cfdbfe72b4@suse.com>
 <51ef6bd1-bcd9-9a3a-e902-887d42d7dd7e@citrix.com>
 <bb4b4106-f49d-2b50-1eb9-eb450f6b24fa@suse.com>
 <965e91fa-1f1e-7c57-5a71-a09b170a7d9f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <965e91fa-1f1e-7c57-5a71-a09b170a7d9f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR1001CA0022.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5901a70f-330d-499e-e8e0-08d9fa8cf65e
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3500:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB3500DB324AB1CA13B01043D1B3019@HE1PR0402MB3500.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qzZY95p2gNgUrwVd3eWhx7ianOo5PvRuS4E/xFsV/GQEDTodiRxLxO4i0FE5qk1HQBLhMYQQV5BqB1X1QPTXS34m4TvAwsxF1c0B1qQDFTvoSnxkIjMnwA9nh/vwjHMrO89yuOilCZ7r5dpcSBzBhd5GS4qrh2TaAxXhLhj/g8nEbAugS2Fr6oxvEJXF+s/gxmJatGF2AilXG+SFtbTg3HC3tqh/t4pSMY0yfk1QyGRYmlzT3os4UTFWhpdaiihGh/e2h+gBGRFylnFWkQUJ4dnP7EJyjGPo2gnTBd087Hoy+WSb1c3h7jbEc7+7RuQ/8aH9q+QdRonDmBJ3O8iEMbPGaxrzDmp23LYCS3ReIUuMRxguyhfXtNa208pL/3OKQjKHTiR+yi92deFWYCD7QgBaeCkJSUrzx86KqjpHAV75pyLNjWtwj2biRMa1FqiHk0ojGhi5RzkDzQDRl0YxS1+GHuFneBgrwiCUiB38FMTImW3s/d4lW7AcNzgB7SBaPRU94bE2GQ8R5HWcmy0gzh9/kkpCe9+mM1fPEKUkJEoxqMUmumRLozmVQCl7OtEPsi5ORk+whnYdFnRYh1lq9j95XcUHEfr+WMyN5jdTKXQtQxblvFKyVgSm2sZCp0JmtBL9cvujju4X9v0yP83SEHbLyQ4VenFeeCrT4d1Hcm4ic16MzR9yn0+AJC5Y3EjF2vBGKNPZZWoNfINVPHqGuBF33hMb11f4LFx6Ecssfyk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(8676002)(66476007)(316002)(6512007)(66556008)(8936002)(66946007)(4326008)(26005)(186003)(6666004)(6506007)(54906003)(6916009)(2616005)(53546011)(36756003)(508600001)(31686004)(83380400001)(2906002)(31696002)(5660300002)(86362001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tMAQwxx9VA5TVAcs0xLBRKby8PgCXal9o+uyfxROQtRpyXHiMGgqZIb0/XKS?=
 =?us-ascii?Q?7BGLdOyP8Q/VZt3bJFTLfAIPhNm/BkgzYwLCI7/CHdj0RFLtpDF/j+PdZnRm?=
 =?us-ascii?Q?JT2NfjHxxUme0L8AnZreOzl9LHjmUZ8bhZB7/QhakvOK4UZP9WWm8vHAZ9tc?=
 =?us-ascii?Q?QgN6HT3vLflbx1YL2h4aOsBRH7Ul85v+fMS8CrSRzLw3D3dpmtK6chgFQAdU?=
 =?us-ascii?Q?4FpiYPbeigKaHqhvDZv2Ii6URpdJJhnMpasFldv6PJYGIr8C4VVS97kX3Vgo?=
 =?us-ascii?Q?rI8r1S1maYKrjp6T3HplCX1Od4BLWfPwCacveKQgCjQBtv5ctQ0lq8Srf3dh?=
 =?us-ascii?Q?H6ahVVGR/97UsvljSxHQlEGegB0Sjy/ufw2JIwNmksXKa5fzEy4ycq9PoDbW?=
 =?us-ascii?Q?e91BBNFLxp02UyIJeD2N852mEThxcpvPFcElDyCHxTgT5lvL9XsN/d1fwR/n?=
 =?us-ascii?Q?xa2mwWrBBvtoKwe3T3bO+UfCY4/Mpcefr0mc5DU/fcFtzT4puSpoMKRM8yPO?=
 =?us-ascii?Q?NIzISSdJEC9MdoRUejUawUkPkSN3C+wMuVX1J3MbdQiAC/lbUCVEuNlH3zlq?=
 =?us-ascii?Q?C0NpzyLQa1WMq6Ma3CSNgPu1GIXrKPUz0eZxS5TZjk6GJ3fPvQ0ASK/FtB53?=
 =?us-ascii?Q?SvbtxSyXosot+egCN2X8TZ7u+4e1A+DvICsWTd1A5QJ6YpclQAMuHnUNib39?=
 =?us-ascii?Q?mk28qf4p/brbst7TAZWGCzcCjwxvp/twi0ewEwuatBX+eLkvfquQIjEp8NYw?=
 =?us-ascii?Q?A7UCvdyVgUBReHRT12w6eNQ3qyRFyzCTX6lE/fyObzJlotyk4vorrB2Bzx8e?=
 =?us-ascii?Q?d2hMiYmxoI8GmALuBsilU/FyMs7uQwxpmqgrLZEv6HER969pNMDLramWdmxf?=
 =?us-ascii?Q?D4d5TdGUd1Uxwqe53PUn7Hrp7P7KOJKjglQp6VKw57rPRMzNgKZqbYyvk4zS?=
 =?us-ascii?Q?s3ZDD5fPlx0J29XfHSdh75EWtODaUXC6Mr8eWtpGpWM8AnU3KoIDWcjHxj3w?=
 =?us-ascii?Q?RF8EFHM5/Bd3W0q2UU+5DQcKeSjJ9Kw6I2m9t9/W4PmudOxK21MLWF3uOt58?=
 =?us-ascii?Q?7HYKkQ1/WWq7myX6EroT1m0YIHjbawcNmBz0wo81BR9Nm1ARXNxgft+SeCeH?=
 =?us-ascii?Q?jWN9DRYRiGx6Nrj4fRB/2+KDhRz6jHaqrHYv6wTj80okEPhIdx1chpPQeCUk?=
 =?us-ascii?Q?NxmvuepxymBskSXjG0tM5Qr5cHgS3LGfgDPfCudkziQjgqA3kjkMbIXPGw+O?=
 =?us-ascii?Q?73eMp+nvWSi5NpH3OhDEPM8hoLv/6yIfD6azValvNnJDX97FufWGK7ydhtco?=
 =?us-ascii?Q?pKuVyNK09lOPsGSRdnSh1Q/nfZVhq41SLeVlqT/9IgKzkinN04aiTLJFj/zd?=
 =?us-ascii?Q?ifDKzVx+nScjYKBFArKIMDSi7Kost8t00vn4CUiKs92cnw5mi4FgACtW6T8e?=
 =?us-ascii?Q?i5pbXbH0NoCrAsOBDPku/mxZ10HLn+rl+1IXIVEk9DEm/TiG2xXzFxh72o4e?=
 =?us-ascii?Q?IgItoRViGfKx53dwCO7/ZRitV8w6hGqLYiZNx3HalmGDAaCh4ePJelD20XKL?=
 =?us-ascii?Q?896FeaOoT0YhEZMywcKHliRRQbhsb3dUujBQJjFxvQDeDfcMkLyOWBrntWHN?=
 =?us-ascii?Q?+1ALL0IWIHNXLLCMbYQfhrM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5901a70f-330d-499e-e8e0-08d9fa8cf65e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 07:35:58.7135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/kVp8HKn1UUY9geRrF9f8yRFgctMqJhE6mV/n6HnwceKClVbAjBScX2qVwxghzIHE+d+pJ80/6hSYg0bKGnqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3500

On 25.02.2022 18:11, Andrew Cooper wrote:
> On 25/02/2022 13:19, Jan Beulich wrote:
>> On 25.02.2022 13:28, Andrew Cooper wrote:
>>> On 25/02/2022 08:44, Jan Beulich wrote:
>>>> On 24.02.2022 20:48, Andrew Cooper wrote:
>>>>> In VMX operation, the handling of INIT IPIs is changed.  EXIT_REASON_=
INIT has
>>>>> nothing to do with the guest in question, simply signals that an INIT=
 was
>>>>> received.
>>>>>
>>>>> Ignoring the INIT is probably the wrong thing to do, but is helpful f=
or
>>>>> debugging.  Crashing the domain which happens to be in context is def=
initely
>>>>> wrong.  Print an error message and continue.
>>>>>
>>>>> Discovered as collateral damage from when an AP triple faults on S3 r=
esume on
>>>>> Intel TigerLake platforms.
>>>> I'm afraid I don't follow the scenario, which was (only) outlined in
>>>> patch 1: Why would the BSP receive INIT in this case?
>>> SHUTDOWN is a signal emitted by a core when it can't continue.=C2=A0 Tr=
iple
>>> fault is one cause, but other sources include a double #MC, etc.
>>>
>>> Some external component, in the PCH I expect, needs to turn this into a
>>> platform reset, because one malfunctioning core can't.=C2=A0 It is why =
a
>>> triple fault on any logical processor brings the whole system down.
>> I'm afraid this doesn't answer my question. Clearly the system didn't
>> shut down.
>=20
> Indeed, *because* Xen caught and ignored the INIT which was otherwise
> supposed to do it.
>=20
>>  Hence I still don't see why the BSP would see INIT in the
>> first place.
>>
>>>> And it also cannot be that the INIT was received by the vCPU while run=
ning on
>>>> another CPU:
>>> It's nothing (really) to do with the vCPU.=C2=A0 INIT is a external sig=
nal to
>>> the (real) APIC, just like NMI/etc.
>>>
>>> It is the next VMEntry on a CPU which received INIT that suffers a
>>> VMEntry failure, and the VMEntry failure has nothing to do with the
>>> contents of the VMCS.
>>>
>>> Importantly for Xen however, this isn't applicable for scheduling PV
>>> vCPUs, which is why dom0 wasn't the one that crashed.=C2=A0 This actual=
ly
>>> meant that dom0 was alive an usable, albeit it sharing all vCPUs on a
>>> single CPU.
>>>
>>>
>>> The change in INIT behaviour exists for TXT, where is it critical that
>>> software can clear secrets from RAM before resetting.=C2=A0 I'm not wan=
ting
>>> to get into any of that because it's far more complicated than I have
>>> time to fix.
>> I guess there's something hidden behind what you say here, like INIT
>> only being latched, but this latched state then causing the VM entry
>> failure. Which would mean that really the INIT was a signal for the
>> system to shut down / shutting down.
>=20
> Yes.
>=20
>> In which case arranging to
>> continue by ignoring the event in VMX looks wrong. Simply crashing
>> the guest would then be wrong as well, of course. We should shut
>> down instead.
>=20
> It is software's discretion what to do when an INIT is caught, even if
> the expectation is to honour it fairly promptly.
>=20
>> But I don't think I see the full picture here yet, unless your
>> mentioning of TXT was actually implying that TXT was active at the
>> point of the crash (which I don't think was said anywhere).
>=20
> This did cause confusion during debugging.=C2=A0 As far as we can tell, T=
XT
> is not active, but the observed behaviour certainly looks like TXT is
> active.
>=20
> Then again, reset is a platform behaviour, not architectural.=C2=A0 Also,
> it's my understanding that Intel does not support S3 on TigerLake
> (opting to only support S0ix instead), so I'm guessing that "Linux S3"
> as it's called in the menu is something retrofitted by the OEM.
>=20
> But overall, the point isn't really about what triggered the INIT.=C2=A0 =
We
> also shouldn't nuke an innocent VM if an INIT IPI slips through
> interrupt remapping.

But we also shouldn't continue in such a case as if nothing had happened
at all, should we?

Jan


