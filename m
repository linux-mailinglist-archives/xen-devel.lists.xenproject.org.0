Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3312A3F6AE5
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 23:13:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171717.313324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIdiA-00011T-Cj; Tue, 24 Aug 2021 21:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171717.313324; Tue, 24 Aug 2021 21:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIdiA-0000yd-9A; Tue, 24 Aug 2021 21:11:58 +0000
Received: by outflank-mailman (input) for mailman id 171717;
 Tue, 24 Aug 2021 21:11:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QsuA=NP=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mIdi8-0000yX-Tj
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 21:11:57 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b01e1e0-e542-4da7-a89c-f44498b5d763;
 Tue, 24 Aug 2021 21:11:55 +0000 (UTC)
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
X-Inumbo-ID: 0b01e1e0-e542-4da7-a89c-f44498b5d763
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629839515;
  h=from:to:cc:references:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=T6v+2Lyo1ApN6cq3QtB54simKp4JIjfio3pXIGIPTRs=;
  b=BL4XGdEcAhAIubfG4lJWqd+8XqJJ5jl7J79S4ussFisgcv2O7T3Kjizj
   8NDjUVkmUHPU6dmD1MiaVoMkuo26gelECNl+BzFni0Xbt77ochGgKNO73
   as/m8K8O108GBlHrMEB3GRzYwT09LMdXY7JkWi9vBmKD1k3CE5f4S84QS
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0jo70kKppi8+0oJ20If2HQbaH3yP2W7/OJ4zWXkjHkxY+RV4eSNSYFN2dpCRF8tmw/yx6nCjRe
 a2Us8MhzSpJekrBKOmo7Fa+XDhlcXot09dT+ve/vAqILw8uVRdf9AHGWXdW3Tp7ct3H1mf5Yam
 +WmrhZxJs3Wm3QboUJhxXyWBeRJQpK84Pp3e3QPCgBt5eDtYMh94JRksbo3cD9xAj3/gwM1e4U
 FyC7owtlheSDESmIUUK6qO3efiO2JhVApp4E78gD5uxRUSDucPzEqtXgFfdzZ+HEhHgJ3cAiDH
 oBRDFgaekT2oLI0moO5qDaHM
X-SBRS: 5.1
X-MesageID: 51599958
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:/7yIvqPe6LmZcsBcT0/155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/exoS5PwPk80kqQFnbX5XI3SITUO3VHHEGgM1/qb/9SNIVydygcZ79
 YbT0EcMqyBMbEZt7eC3ODQKb9Jq7PmgcPY99s2jU0dKj2CA5sQnjuRYTzrdHGeKjM2YKbRWK
 Dsnfau8FGbCAoqh4mAdzY4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4k3Ez5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 fxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72yeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJlNXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbVrmGuhHjTkV1RUsZuRtixZJGbBfqFCgL3U79FupgE986NCr/Zvx0vpnfkGOup5D+
 etCNUiqFgBdL5PUUrRbN1xN/dfMVa9NS4kBljiaWgPJJt3Tk4llKSHl4ndxNvaNaDgn6FC1K
 gobjtjxCcPkgTVeJaz4KE=
X-IronPort-AV: E=Sophos;i="5.84,348,1620705600"; 
   d="scan'208";a="51599958"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PkoOPctKzPGh4p0vKPourGX7Pr9jhv7Ih3JEmh8jsRWPcEddgbtNqBDX3vY2fD8LyOHmhsq1dfl2+NdvCUsIpVYCYYGdmMFK2tRZcUfb3yPVDafcqaICLNY2WH8MPmHeUwgq1fu463DIQhSsfACvZW5P8QFPUGL341qm0lSAS7mhOZbCqiY8dRk1yabzcV8JGmrUhkbt75LvBrk7J2K0ZOqfdLdWiNgSx+Ar2GbzC8PXlNt8n+NE15X3qAuSFNDrGFmLvVbpIUSAwboHlmXRHNiLu8we04gllMWKixRYOt4aCqH81IF5kAfBPM3ICj1S/2WnvNirZtOM6nQnfMz7zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D51h2qHY2OK/DVylJ3RtXiH4c0xJ/8VDp2bS2TibvT0=;
 b=JUQlRMwG7dcUcpGyppY1sPZJO3SiFjSI+y3zkwhfazSYz4nSwOrLo8I0B+FKPkLDfzJ7r94Xe/otoJ15ztWSZQwmUUzjgJ26wpTyI9dqbw0BRKydcAyWo1a+g4maH1vlyrK9iuMXlpcNPRjFApgvqiNa1py9finZiJYKOb0G3nlRdKlTTJriCLCoUdRpvfvZ0PHRoQiQ3HD2PvpI6IZjXXlo0hz+B8fKLCGIfYpnstWnZVHdhKa6S1N0EbH0Ux30XUgI43pydrheJKD40f4jDSdvuoVnSzzWMKMMGxzkng/aHj74quODHEVN/yxN0gdld00k6TauU3aYw6ggNPH/xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D51h2qHY2OK/DVylJ3RtXiH4c0xJ/8VDp2bS2TibvT0=;
 b=RI/MsxFa57pIMQ1J71QRSBF9HDH2KMdm//1UJ3yKOr93Ap6kJ5vXW6v3ibZFTZcqZEX23jSo9CzO6bLfM82RDDSmEunq+iEtXAFMp2wYvCS1Q1CdXVwNAdOKETXYK2QU5GVQXQ2kOQYHSRHAa5m3bbczMfkVx9JdKbBD+p+iHis=
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20210818113017.454251-1-marmarek@invisiblethingslab.com>
 <45de5185-b514-8c52-6922-4c587818c698@citrix.com>
Subject: Re: [PATCH] x86/xstate: reset cached register values on resume
Message-ID: <3125583f-b965-7746-d833-c197857cd7d7@citrix.com>
Date: Tue, 24 Aug 2021 22:11:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <45de5185-b514-8c52-6922-4c587818c698@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO3P123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d538f6b9-30ee-478d-dd61-08d96743c8ca
X-MS-TrafficTypeDiagnostic: BY5PR03MB5032:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5032AE25D4155DB45FF787C4BAC59@BY5PR03MB5032.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vvRmSfq8lHbQc4CKrDDbGkGXgs8Ig0/5Km4AIg6/Aj2qml1uEeFAgl6pNqjaQeQjDo85lBMPP8JEuvywFtTvu3PSGo58e5zcDtuYWt1ykg3iH6YLxph3fFQIbUgLsnaCJ8rINI8ps8LzVZKVrTRW06wUkTrfK5Kb0iypwGtb6hyuccVfoaQPPwiwH3bociDW80exj4OTsDsbJ0PBCDaZQ5heCeHx1BNvWVUmBvIhSIkygDlVXnkCzGXxd+mk0vdkuWhjG0sbGPJCz7voYN8JapIYx0AyMMet5aMG2LgiIjkv+G8ZE+LTTfLmL4EvKqQ0qmiqlrptqeIEAbbH2iBNKf2SnjOM5MSh6tM/VQM9bLbLYiomLc4rvA3yzgM5261XrUkhhCIFKW3hXPL8ToMAwrMSquS6UKtCbbUB69CZPlGauzNjAHZ/TsyRDCjEHYwYMK2LGBLWz12DAcd8z9MeHvDR47pPBL/TkH2/3JsJ4q0BWbfFjhO8Swk881H+myj8EangpvEig1Ne11TKDRrIymqJ6LTSPuIE/hgMOM2dpeq9xvsBnz102MrESiuhfx/g8tTvPVb6o//NArAc+PuRK2t4pYaqqEuhMO2Hh7mO3S86ezAHwdVi88ngS7sWfN7FzwhIud+OJkPLmBHDVT+Z/pmCwQ90k/mYHk+clI7gK88DCHwz2yytETnfv4sFIFy+NLFQcSzopKNK7tJ859UBh7VUzjHPhTAZ8p67nEXjQ34=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(36756003)(54906003)(16576012)(478600001)(4326008)(6486002)(83380400001)(55236004)(2616005)(956004)(31686004)(86362001)(6666004)(38100700002)(66476007)(66556008)(31696002)(53546011)(8936002)(8676002)(186003)(2906002)(5660300002)(66946007)(26005)(316002)(66574015)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1ZMN2lUZXJlWWNEd2llY3hjQzJybWhVOGNRbmF2Y0JmWlRBWVZCajdRRTJu?=
 =?utf-8?B?Sk9nN3lzelFFVFBURTNKZUVFa2xzMnBkbTJLSGdSazNDZXVVRWZTRFlpbWNF?=
 =?utf-8?B?WHZ1N2JQcVUwRmlyU2RtK3FBU1BzR3pZdWFzTlRpZitBaTZwYnBValJQVm5q?=
 =?utf-8?B?YVlob1hNZ3YwdlBSNkhMeDZMY1lVVDl5MHRNMUhaUzlVd09md0p6cTVpVnY3?=
 =?utf-8?B?K2VzQTllWGRNc1lLWkVhaERpTGh6Y0E0R1JHdldaNjNyVXZTbzRsWFkvMGh3?=
 =?utf-8?B?d1FDYm9MRk9WWWR0UGhqNFNaZi9QbFZibUV6Q1Y3VXZxbThZRTZNbzczZFpx?=
 =?utf-8?B?akw1TE1KejJtZnVKMWhJOG1yS1ZrT08zRk16QUl3OHRTcGFROFFaaEhMU0px?=
 =?utf-8?B?K2pZUFY0c3ZmUUY4ZGlOZTM3V1Z6VEFEYXFhcGpna3ZlWHVSUURtWXNUTjRD?=
 =?utf-8?B?aTMwZWl6eFAwaDJZV2F2dzRzU000MmpUd0RUT0hNUWJvSHhUZWxUVkluUmFX?=
 =?utf-8?B?M1I0NGFROEdmcmdvWm1nVzB3S3MvMVZGOGhldThtSzlOQU9FdVE3Uk9ibXIz?=
 =?utf-8?B?UUdKLzlpTGx6c2dVODhyMXY2eXFOazZwZTFyaVlLbHVmQXJVdFgxWmptbXpm?=
 =?utf-8?B?a3UvaVlFTS8xNXQwaXlsamJaWFRmd0d6blpobUpocjh1Z0xtZVNHUi9DWlNC?=
 =?utf-8?B?TXh4WUhuV0VsYXZwbmZMcjJwTUlWejBZYzVKaXlXMlc2cWhBRnJySlJQN21X?=
 =?utf-8?B?TUd5S1FhSFRObGR3aUpqN3UydHczNGxvL2tMc2NuRkZVWDFBcDBKZ1YvZW9F?=
 =?utf-8?B?ZHQwQjBRL2p0TThZazhKYkJrMVdqQVRpWGZDU1NTNURGUlFxckdlYzJiazhM?=
 =?utf-8?B?blJXK3Y1bkVxZU45d2N0Sks0cG8yMkc3WkdCVGk3R2NEWjRwU2FBSHFMZVZH?=
 =?utf-8?B?ak1LWmJVRGpha0hTSTU3ajdIMC9qRzErTFdjNWdpWllRUXo3YmR1L2Jtd0tk?=
 =?utf-8?B?YlNaSW9xSnVrU1daR0lIQXpHMVhnR1FIcitNNGR3cUZ4K0hPeDhqNG5QbDI3?=
 =?utf-8?B?aWFKWjEzRWpya3UyZCsrMTNNL2xCWHRXZmU4ZmJuR0JOZitmTkY3aXhFYlZB?=
 =?utf-8?B?M2xmYnJQRGxEOVQrQ2U0NTA3UU9BUTV1N3AybHN4QVJOTEdzRUZrWVRKY2Ur?=
 =?utf-8?B?ZGg2Yis2T0o3V0NBd2VLU3g2Q29RM1psclJEaS9zeHlNQk5sM3FaR1ZZUUJo?=
 =?utf-8?B?UHhTWkRWVGpPWTJqL3hNZ2YrNEZLS1MzY296SEJ5eUV5MVM1Rm5HQTJZNVhD?=
 =?utf-8?B?eFBsTk9SQ3M2ZTNTWjNJMTJPYVY4eFY1QWQrYjA2QVlsd2xEWUFBcG1uaHAr?=
 =?utf-8?B?UVpSb0RHL29UaVlSZnRvck1LZlB2VXlDM01Vdk9rOEErcHF5WnNQT2cxVHNv?=
 =?utf-8?B?UXZEV2VZUWZSa2JHalNqUEIxaWw5bFFEeVgvRFFyWGpuc3F3aDYyamJvWSs1?=
 =?utf-8?B?eG1yYzR1dG0wN3BicElLWHhWWndaekFZQTdFcVA1U1pqdkdoL2FLNUZtWG5L?=
 =?utf-8?B?dXpYczVDVDdkbWVjN05aNWprdFJLbmQ3Slhxb09xS2s3QUc0dzloQVozZGxF?=
 =?utf-8?B?bG91QVFZbkFGVnQ1SWgxemowZkNTRmxHK0txYVFlRzdITlJNLzQvZ3Fkd2Fz?=
 =?utf-8?B?VFBLVHhsYmRIUERWTDFOOHAvbVcyclBEa1NJd1E1WU9KUWZLdEJxUlJUU21r?=
 =?utf-8?Q?AzyYA+Ff97srcRru6YAYr05yyunMReQGsQIF7/A?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d538f6b9-30ee-478d-dd61-08d96743c8ca
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 21:11:48.2231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vd85502NCsZDFoxuqtwwGanDqUF8RmTwvjR1IK2/yJy9uK4U78B/L0C9ZvMCAM277SEsepAiRGm5Ew7QL6LdUvVgBIjhxs/mXGKXRF1dXEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5032
X-OriginatorOrg: citrix.com

On 18/08/2021 13:44, Andrew Cooper wrote:
> On 18/08/2021 12:30, Marek Marczykowski-G=C3=B3recki wrote:
>> set_xcr0() and set_msr_xss() use cached value to avoid setting the
>> register to the same value over and over. But suspend/resume implicitly
>> reset the registers and since percpu areas are not deallocated on
>> suspend anymore, the cache gets stale.
>> Reset the cache on resume, to ensure the next write will really hit the
>> hardware. Choose value 0, as it will never be a legitimate write to
>> those registers - and so, will force write (and cache update).
>>
>> Note the cache is used io get_xcr0() and get_msr_xss() too, but:
>> - set_xcr0() is called few lines below in xstate_init(), so it will
>>   update the cache with appropriate value
>> - get_msr_xss() is not used anywhere - and thus not before any
>>   set_msr_xss() that will fill the cache
>>
>> Fixes: aca2a985a55a "xen: don't free percpu areas during suspend"
>> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethings=
lab.com>
> I'd prefer to do this differently.=C2=A0 As I said in the thread, there a=
re
> other registers such as MSR_TSC_AUX which fall into the same category,
> and I'd like to make something which works systematically.

Ok - after some searching, I think we have problems with:

cpu/common.c:47:DEFINE_PER_CPU(struct cpuidmasks, cpuidmasks);
cpu/common.c:120:static DEFINE_PER_CPU(uint64_t, msr_misc_features);
msr.c:35:DEFINE_PER_CPU(uint32_t, tsc_aux);
xstate.c:36:static DEFINE_PER_CPU(uint64_t, xcr0);
xstate.c:79:static DEFINE_PER_CPU(uint64_t, xss);

There is also:

traps.c:100:DEFINE_PER_CPU(uint64_t, efer);

which we *almost* handle correctly, but fail to update the cache on the
BSP out of S3.


For the APIC, I think we have issues with:

irq.c:1083:static DEFINE_PER_CPU(struct pending_eoi,
pending_eoi[NR_DYNAMIC_VECTORS]);

because we don't defer S3 until all pending EOIs are complete.


I gave up trying to figure out the MCE or power governor logic so we may
have additional issues there.


Additionally,

flushtlb.c:34:DEFINE_PER_CPU(u32, tlbflush_time);

really does need setting appropriately, although I think the only
fallout is a few unnecessary TLB flushes.

~Andrew


