Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6C43A68BA
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 16:10:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141581.261470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsnI8-0002JA-L2; Mon, 14 Jun 2021 14:10:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141581.261470; Mon, 14 Jun 2021 14:10:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsnI8-0002G7-I0; Mon, 14 Jun 2021 14:10:16 +0000
Received: by outflank-mailman (input) for mailman id 141581;
 Mon, 14 Jun 2021 14:10:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGyB=LI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lsnI6-0002G1-Hi
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 14:10:14 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fcdc4a77-a4ae-4632-9581-9e6d9a90af85;
 Mon, 14 Jun 2021 14:10:13 +0000 (UTC)
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
X-Inumbo-ID: fcdc4a77-a4ae-4632-9581-9e6d9a90af85
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623679813;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aSrzooKL9AB4hIavz+SAJag0GVEMeOqq6yM61AU+x0k=;
  b=NBQbM3PPF4aYVoypOKQx2HeLKfXGpgn459LfKReFDvlYrwpDk3+VBn4Y
   Qh45lATlHQcJogIxWdfc95sm7YW3KSozRgaYbKDjfUiYRAObyG50+w61B
   XfgxedMvPHeBhpHBaIol+NmkZeH1nB5pRdUzz/qvZECdJFoBz+YTqRdji
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wPASZuPBYB7ENqapSMODNBlCJUfD6vLLxVVSyuJqieKDb3QUyunkavz7WrL7bp/3A2b2+jCyui
 l3EzmDP1Wsuvo4Afn3+3mpo15U+1NY/k1C7tD3BgShkTI17XhcX+OMKheF9qNyugIGvw1QSbX/
 AH3A/twQIBkYqKZSLyCD3DV4tF4beNMCMNuD9nB05v9A26kIFstwMyBDvzQFtmyZQgsdTAKewE
 DOmsCVNdpKi1sZlqhxEZ4J8yv1SYZ1q8Ynl1cmPJ8D2NMelOrrchWOvtYTCo38/LrTvAsG4EwG
 7/g=
X-SBRS: 5.1
X-MesageID: 46140471
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:cTSrY6gGLH0jzR1dCPaHXfkQpnBQXz513DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmskaKdkrNhQ4tKOzOWx1dATbsSkbcKpgeAJ8SQzJ8n6U
 4NSdkZNDS0NykGsS+Y2njLLz9D+qj+zEnAv463pB0BPGIaCdAV0+46MHf9LqQffng0OXNTLu
 vk2iMonUvERZ1aVLXAOpFTNNKz1+Ej2aiWLyIuNloC0k2jnDmo4Ln1H1yx2QofaSpGxfMH/X
 LemwL0y62/u7XjoyWsl1P73tBzop/M29FDDMuDhow8LSjtsB+hYMBEV6eZtD44jemz4BIBkc
 XKoT0nI8NvgkmhP12dkF/I4U3NwTwu43jtxRuzmn34u/H0Qzo8Fo5omZ9ZWgGx0TtkgPhMlI
 Zwm06JvZteCh3N2A7n4cLTah1snk2o5VI/jO8oiWBFW4d2Us4SkWUmxjITLH48JlO91Gh+e9
 MeVf00pcwmMm9yVkqp+lWGm7eXLywO9n7seDl2hiSXuwIm0UyRgXFon/D2Mx87hdoAoqJ/lp
 L525JT5ftzp/8tHNVA7dg6MIKK40z2MF7x2TGpUBva/J9uAQOHl3eh2sRF2AjtQu1T8KcP
X-IronPort-AV: E=Sophos;i="5.83,273,1616472000"; 
   d="scan'208";a="46140471"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MuFs+8p7qwYDC+3OjIe1CZgfKhurNzQxDN2ixs4YXeUtTDTawrblzZ3GvYlLxzhbJGwwmOrHZQr+f8ntQQyOsXrAJ10nEQq9uDVOUlyrjXocM25OH/8UycCK3oxUDNtziUdkqasjt4ntii7IiKUQJH1ze1Jpw/UbFoopYmXzdwdvXJVQvhbeufp76gdqfEs3ORK+Ql8iSWG63Exv9e8r9GUt+E4cXL3rBQbgJPbzPoSPJ3sbJicPvU/wYhq7Jo8P9gaGPl/E6ZzHCiyR6jwcbf3F4sy7k8blgMolu67FXmV/qexKEiynWrVDGh0nCyEvy2yMEFi2CCeBOddL4fyW2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICjZXqrRU8UXH0K0zEPXPvDmMNtwCUB+TF9uMGEWTzQ=;
 b=Lnues2u/73fGe3F8IriMGaMaaENaZuwlqPSnz5Jm6v92DiIesWBw7yPc0jDuVKD1y31krMNepCygA3p6Vl7SpuqklMNz4doXLesF4ezJrgSobrvVVuJsVJotv9KHcGRoB/Veqp9MyPj4YFHgoLQZ6k936LGVUTx8CJebrWT10VUmVtbzSPEpG7Hopg2Is96p/8KSQs971gUKQOd5DmyIgHuEKNfQVYmVjZWyrSIYKuDkB2ezTp3DwwvyFBKoDIx5JxvhtCX4G4GcLthd+/QVXFYnFrobH2V06ajRa0YTNbiYb+kD1ohaMhoXjphys4uU9dzHHFrHL3Dw+44XmxPK7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICjZXqrRU8UXH0K0zEPXPvDmMNtwCUB+TF9uMGEWTzQ=;
 b=PXwMrhQF7AiDPvbV5/gs4hnt6AdFXDoE67tJvaXQ8ylSTF4KX6NcKcTKZEw6SZnxPTxVWb0VqouFjnpzDuVSkprqr5ht8ReOjUvpMthmm6RuPBxB6gJvnItgm5bXekF8h5lrhkggKDPIN0q6undQlIy8dE9cb0cXGuuWPQGm1vY=
To: Jan Beulich <jbeulich@suse.com>
CC: Igor Druzhinin <igor.druzhinin@citrix.com>, Edwin Torok
	<edvin.torok@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20210611163627.4878-1-andrew.cooper3@citrix.com>
 <20210611163627.4878-4-andrew.cooper3@citrix.com>
 <bcb7cacf-f18d-ed74-00b4-854b403bef2e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/5] x86/msr: Expose MSR_ARCH_CAPS in the raw and host
 policies
Message-ID: <9105e14e-3a3e-4e25-e809-702f72207f11@citrix.com>
Date: Mon, 14 Jun 2021 15:10:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <bcb7cacf-f18d-ed74-00b4-854b403bef2e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO3P265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ce20485-a4df-46ed-91b6-08d92f3e1e7d
X-MS-TrafficTypeDiagnostic: BYAPR03MB3735:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3735FE535C950B38FC26D615BA319@BYAPR03MB3735.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YTbxKgwBCd6NGL8Pb9whBwwo87qeg0z+hYHdNl2t3FEYrsw95qu/nXRMeWcZZ/mv6AaYmWNKeNkuiO1NK714fvH1O2ol1LM1fZ4fTxnYH2ENIEV9UPilTbu55yBZIWYRPKdt4SRWgWKKPBWGXpsTBho6LnYF9FFvI69bMZnEzqla/8rSOTzlSP3P6XMr1lhhJ7/le3nM7g8eyXB11pd3BBDcn3/7VnW7DHnlCuABmXYryEu/Vf7KBsNvITelexW9Az3mIeS6u79YQUne6Q8PePoDB8hPXTeO2bPoaFyMEEaAWOtyzkt850U7IU4FiMwE5nY0pt7s+Hz2heikvHhrSj1km14r4i/80qbsXkcHlZCOBEKPhbyMM5atfAcy2t9glnrdAw1RapBWqJsYg4t1Pa7FVF+bUfPuEqivxmfp2oT7qUO1Ntx8Ls/P5jl9pvQX06MoOq6XMbtHMFStp3NBwR57wrLCXSJ1zd/yQVi7E0fc9TRU74UmqaifLoPQdheg4oEeNOTw8n9Iv6mE/IuGUi4y2JJ4aLWCcAyYu18QGhvFxi5mzNemnYbgI+4W60qnAA1gYz9biT6eAPdk+okfbVYwp567xRpt5dRK7iQ+1RgGV0O0DTfwW8jc2iaGBFbqHpAHO0ySgfDkBc/aredwMhzoBricBfAxU8i6qbomsf0wXUW4NfJ35Gs457uXqMpW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(38100700002)(5660300002)(36756003)(66946007)(956004)(16576012)(31686004)(316002)(6916009)(2906002)(4326008)(8676002)(66476007)(16526019)(83380400001)(6666004)(31696002)(8936002)(53546011)(66556008)(478600001)(54906003)(6486002)(186003)(86362001)(2616005)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkRtcGZQT1pnVElzUGlGdVc3Zmg4WHM0dzVIaVdwRk5od3pONEJ0alVwRGlX?=
 =?utf-8?B?VTFmUnE3dS9LcnNTNXNXUEREamRKU2FCbDlhWVBDUU56Y2J3VHYrYktYYkpY?=
 =?utf-8?B?TVNPK2dOTUJPc2QrcG9TZENvUXFHcWJFbnduUEpzeWpNQUQ5OXRDdnYvNy8v?=
 =?utf-8?B?ZkRlSWVQQmFEdlQ0OU54REluY0t5QmpJdkZaWk5EMHRVcEc4d212MjJtcitQ?=
 =?utf-8?B?VjRVeVJpQVl1UFp4TklkTHNYalExU3o4OEt5WjNkQzVKS212SHdZZmM0Wm1U?=
 =?utf-8?B?ZERMVVI5T015c0U5SmRnR2FFeXB0UW5tb3dOZGx3b1hhcTFyRHkzQnhzRE9p?=
 =?utf-8?B?VWRPazkrMFVMekVkS2NJbndxay9aV2NnM3JyYk5WTzFmVmRWeUZ5dHprMllm?=
 =?utf-8?B?b2wwdHRTL0NST0NVdXE3aG4yamIvcjNyei9NYXc4ZWNkN0F1Q1ptcjhXZDVK?=
 =?utf-8?B?OExCQjRxV3NOT050SG9ZVHFSbEMxMFhGMzdEUHM1c3V0eGFKUXE2YlR3aUtu?=
 =?utf-8?B?amhPY0tZbGcxRWtsOFMyQ2xDVHo1Q1dTMGhCOVJhOGRZK0toZWdvTjlwWjlx?=
 =?utf-8?B?OHlpZXJRaHdET3FOaXFjazdNSmw5QU96MWxsYmwwcnJ1dUZvTEtQMENRdEJ4?=
 =?utf-8?B?WWkwZHgzZWpmMzJGWXRtOXFOb0QxSXFnMjFoOWl3U2xsYXluTlJpWHdUMS96?=
 =?utf-8?B?Vm5tRGhFakhLbis3WU9jL3ZiY0Z5VGR2ZXRxYWRRS1BSZ2dCb0RJUzBKZjFr?=
 =?utf-8?B?N3NvdDUvOVNmaWJDQWlyTEI3MDdqVjVaRlUxSm1YTGtvbWZhdTBCZjM4Zm04?=
 =?utf-8?B?L0hCWDVhU1dReWdqcHk4K21PSmFkaWZuTjFHdFpiQXNYVGVwM2w0emRWTmlF?=
 =?utf-8?B?bWF1TkZiQytlL0VLZ25DSk9qeElTSEwvQ29EQ25mbTh5TWFKUjF4QnU4cE5k?=
 =?utf-8?B?REpYVmtwbkxGNE0vdGZCRlpralR4L3QrRUljZ1cxVjVaSXZtQVZhSFEvQm9X?=
 =?utf-8?B?RWhqQ1E2Nzh1ZUN4OWxNbnVKaXVKZStTK0hNOXFLZkFyYjZNekVTQ2NqNFBM?=
 =?utf-8?B?ZWoxT2ZKRXkySVNkWVI0Z3l6N1ZkcDM3M1YzTkdyTWc5NnYrU0ZuK1VIaXVU?=
 =?utf-8?B?UEFLb0RnbkdPUFRNK1pqMWI4QmNpWDBYTDEvZTBoY1JlTjlEYmhBR0NFK3Q1?=
 =?utf-8?B?ZWViY2JERXMwRGdrM00wdXFNWGtjUXZTdjBLd0QvWHFOTktGUFBnZlBCUnZr?=
 =?utf-8?B?WktPejJUdzMxTldYRFdSc0FwbEQxdlI1OVd3YXJ4eUFjUUJmMFdiK0p2NnB3?=
 =?utf-8?B?VU9SVmUwemNsZnl2WWlncEYvNGE0emFIMWREQmtDcFhybEhpQ1A0dHRtZjRz?=
 =?utf-8?B?ZmVFd3VVYmV5S0h3NmxNcUVUeU5pRGpydUsrTmwvbmxrcFVyWlNiamJwdWJt?=
 =?utf-8?B?NE43ZVJRV21PWk45U08ySzJCaERlcncvRkxabTd5MGIwWjFnR1J6cklrRWUw?=
 =?utf-8?B?RG9reW16WGk0NTdRSUdxbWtuWEFoZU1RaTVzUWhtZUxNaGtub2RKa0VUVUUy?=
 =?utf-8?B?MUsrTWJ6Yys2M29hR2VXTGV0QkZsWmFaOS8zL3RvYlo0RXk1RmprckVHYTJB?=
 =?utf-8?B?TFdGT29UMVpiOEVwcmdWRWtoaTBLYzRSUzJwdDdPVE04TURFL2s3elBJdk9Y?=
 =?utf-8?B?MlVIQzlScDNaTjVnMnlGZE83T0kzeXlZeHJQOEFudlpwZTgyeVVybUZoekZk?=
 =?utf-8?Q?snwDdXWHCwVfM6ZLHK2jHRVpfpv/RxullZLtWYj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce20485-a4df-46ed-91b6-08d92f3e1e7d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 14:10:09.7508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3IqI4g1i7MGePM/gYdYOTLD5e3Aq0M+YkVaDEBbPDmkT9kwSI/Nyk0VoeBdIDt8HzPMMcQnYlX0enDa+iC/ToJrSamza5/bBL3WjNKIuYXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3735
X-OriginatorOrg: citrix.com

On 14/06/2021 13:57, Jan Beulich wrote:
> On 11.06.2021 18:36, Andrew Cooper wrote:
>> @@ -60,6 +65,11 @@ static void __init calculate_host_policy(void)
>>      /* 0x000000ce  MSR_INTEL_PLATFORM_INFO */
>>      /* probe_cpuid_faulting() sanity checks presence of MISC_FEATURES_E=
NABLES */
>>      mp->platform_info.cpuid_faulting =3D cpu_has_cpuid_faulting;
>> +
>> +    mp->arch_caps.raw &=3D
>> +        (ARCH_CAPS_RDCL_NO | ARCH_CAPS_IBRS_ALL | ARCH_CAPS_RSBA |
>> +         ARCH_CAPS_SKIP_L1DFL | ARCH_CAPS_SSB_NO | ARCH_CAPS_MDS_NO |
>> +         ARCH_CAPS_IF_PSCHANGE_MC_NO | ARCH_CAPS_TSX_CTRL | ARCH_CAPS_T=
AA_NO);
>>  }
> Isn't this a little too simple? For CPUID we consider the host policy
> to be what Xen is using. Taking ARCH_CAPS_SKIP_L1DFL as an example,
> we're not using it unconditionally (depending on opt_md_clear_hvm and
> opt_l1d_flush), i.e. there's command line control over its use just
> like there is over the CPUID bits.

But we don't go clearing CPUID bits for features we choose not to use.

ARCH_CAPS_SKIP_L1DFL, despite its name, is a statement of how hardware
(and/or out outer hypervisor) behaves.

It means "you don't need to flush the L1D on VMEntry to mitigate L1TF",
whether or not we employ fine tuning to change what Xen does.

>  Or take ARCH_CAPS_RDCL_NO, which
> we set unilaterally for AMD/Hygon.

That is local to spec_ctrl.c, and a mistake in hindsight.=C2=A0 It was
written at a point in time when it wasn't clear whether AMD were going
to implement MSR_ARCH_CAPS or not.

The logic in spec_ctrl.c will change substantially when we load
microcode and collect the raw/host policies at the start of boot.

> I don't mind it remaining this simple for the moment, but then at
> least the commit message should state that this is currently over-
> simplifying things. If you agree, then with suitable wording added:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

This is "mask all features not known by the Xen".=C2=A0 For CPUID bits, it'=
s
done by the masking against known_features[] (autogenerated by
gen-cpuid.py), but we have no equivalent for MSRs yet.

We're definitely going to have to invent something (VT-x is going to be
a total nightmare without it), but I haven't got any clever ideas right now=
.

I'm happy to insert a comment saying that this is a substitute for not
having known_features[] for MSR bits yet.

~Andrew


