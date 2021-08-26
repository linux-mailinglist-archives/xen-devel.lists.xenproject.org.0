Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFEE3F86D9
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 13:58:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172954.315598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJE1B-0001OM-2U; Thu, 26 Aug 2021 11:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172954.315598; Thu, 26 Aug 2021 11:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJE1A-0001Lx-U7; Thu, 26 Aug 2021 11:58:00 +0000
Received: by outflank-mailman (input) for mailman id 172954;
 Thu, 26 Aug 2021 11:57:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q24O=NR=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mJE19-0001Lr-AP
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 11:57:59 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dabe89e8-0664-11ec-a9ec-12813bfff9fa;
 Thu, 26 Aug 2021 11:57:58 +0000 (UTC)
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
X-Inumbo-ID: dabe89e8-0664-11ec-a9ec-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629979078;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6OIeHmCXGd3cZETkQYZCD/HejpGdbKLaSceHvX0G5AI=;
  b=felocombpPR/tIms3PMoEwFHKyNeA4Mu7R08JmoAM1iPRke1vVI3Y+CZ
   IdduwyOiX6dM2vEl1eWwmrKqY9hm/YmiVWItuCU0dcYikF4tjTJtvH9+R
   beZ8Lb8cAFMjIeiEIaEDdgKX9fTiPHudHaER425jmmGzAGmK4KSrV9Xp6
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: YI3Hl2UGxYjr8dNhEb+1v/auC0rvJOhvHgSnaL/SBXc30YrfBFwNNOO8tGSD1FQPiMCH7uOJsa
 fiWyjWF7Jh5SlHdHWzKHhQOJ6/C0XiH+2lueWcwhD2BnMhQbZLX3MTPFwac8GPUoytZpShP5cC
 1fQa/WL18s9ewdeXc3s+CIV+qGfdjfxqEMucAqN9Q/QPXIWhSdraiNJikVg1Ef6QmDRYFMwLfz
 cT1+jgdXS1ydCdoE+rZ2YVd9Vea3iVxodWkqo5xlHOUlqrGMnAm5H3WElBHFh5IE2eeVTdYkpU
 BnJmNUxNtObMfnFisDPovI7B
X-SBRS: 5.1
X-MesageID: 51356675
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:vbvRyaMtjAzJbcBcT1b155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/OxoS5PwPk80kqQFnbX5XI3SITUO3VHHEGgM1/qb/9SNIVyYygcZ79
 YbT0EcMqyBMbEZt7eC3ODQKb9Jq7PmgcPY99s2jU0dKT2CA5sQnjuRYTzrdHGeKjM2Z6bRWK
 Dsnfau8FGbCAoqh4mAdzU4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kLEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 bxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72zeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJlJXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbZrmGuhHjXkV1RUsZiRtixZJGbAfqFCgL3V79FupgE686NCr/Zv2EvpnfkGOup5D+
 etCNUhqFgBdL5OUUtHPpZ0fSKAMB2Fffv9ChPmHb3ZLtBxB5vske+83Fxn3pDmRHQ3pKFC7q
 gpFmko7VIPRw==
X-IronPort-AV: E=Sophos;i="5.84,353,1620705600"; 
   d="scan'208";a="51356675"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fNtDMpEj/HWoFZ+ygrYRyjMfLHtbKlrjuEs3AZ9oqlEnV+TgXucSsiSyeiAIDs5emmZPgS+yPU/Pnu5/nX2GkUIIWt0LQctCVtvQNgZvEA+HlqoaemFOhawap9mE1rOOCUs5xBw3KRXkiJlZtKNE8E3feOjrqeIewOZtoVz3n+MOqpKEXbITKvd2qfZNm5auamEb4hhXR8nqzUcG+YiNUUVGcI7t8R61H5Xda/oVrynzHerPElSUtlcG0pv+xJhrRwhGW4BXbUvIBNDQobkat/kEN5oeeSuYmAUzI8sWRpIJ3HOixLrm5KFn3mfD6Ulqwyyt6uS0Gc5vUfUfE2a7WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OIeHmCXGd3cZETkQYZCD/HejpGdbKLaSceHvX0G5AI=;
 b=PEaz9Eq1tBde7umfm7Xcvk2bFL+b0EUUUzTU5G0kTTNEswN6QOrc/SA6w/hloNWy6AaDuQWd468FL1SrwjUBS3+6ytUD3cyRt+jAoGk4h2ylJKgP3brONrFlk5TdRWDeq57QKR4o6HymPVZ8G64mxwyIyKJPO3WfTwF0YDCDcqBjRu8hEDxis9ZoRaxK+V2dRmpPKZR6LK2MV3pfV5g3+Kqik8oOCefMoc+ZRFxNPcx3K11xi+zxWoaKvDHLJe73F3a/Kej/GVTvVG71tEAUPL4hOsLM17GbP5UiA+rVid1MwdL0z6pWrS3ShogUSy56mKGBZ66pnEkWqo2ZSAx8TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OIeHmCXGd3cZETkQYZCD/HejpGdbKLaSceHvX0G5AI=;
 b=TJ+Yisc7dNNJz30Vyzh75gW6yuffhdP0vETziaMwzNtzsZaNRannLJ3vSbFg5wUgio/X3cz6p6FqY0OtrdBkMYSf5xWksjxHuqLznDqD2P7ewlQJjeIzs6umaNdMKyk0ZOz2YpajEDW6MlPp52hA452iZ9y1Rf/uHKmiZzPwEQs=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
 <5d6e8360-7ba8-487e-0ac8-7f517e560520@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 07/17] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
Message-ID: <42aa8c24-7f23-deec-6103-f2d556e4a9f9@citrix.com>
Date: Thu, 26 Aug 2021 12:57:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <5d6e8360-7ba8-487e-0ac8-7f517e560520@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0329.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f587c8c0-467c-44c9-c49d-08d96888bcf2
X-MS-TrafficTypeDiagnostic: BYAPR03MB3799:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3799BD36D183578E404F130EBAC79@BYAPR03MB3799.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TsbVTsiM0eMZkGKmGD6XCM3X0doFZRscQZ/ggo6G5GRT/oZMQPHYmXRtbRPiVOgCMYlYvShrgfyD9hQUn6ykyQwWFtyn9AIyH01mXPQLYIb7oZ5Ay4tChaNGpeOC8T62yiwUBLALKQIlga1uhSGrwd/zLWZDGsaMNIULOJkkmukIzni8tCuAvutX9GnJi8GuOeK7QB8ica2xl55twZQZK4Ubh9pCaORfy8AW9lC8M4Jg96is8V7OqCnKORJ2Fw5cJh9xbHu2IlfC+JlleyxYvIrSR1CiflPMv4kdcd+RUpO9y/4PDH9Y0QoBF976rEHGWa/mc8BwUTgh+zCv3ym0FQeO+XaIvIlQUulW6COGVER0KzhJFjwsdyfuRM48Vx1+xjIUxxfk2Horxl32EJRzpKecZ5biJOtYxdqyNU5WVkyN4WWFHnbEfUEsIenRQNIjxq2BhYVgEz2RY6dXX+KH9LwKTA5iBhaL/fCTygBhumNelcpJ5K1GtZsbmo8JD79qaRI9DPHgxc5F+IVwjcouTgY/2zM15+D1De4ZS0/X6xWVb4w0sHhxm05i1zee3MStWN6csJi5VBwlFapLzah4on7Db7MwnoR46JXS+9DTX8ZgHV4P90OupqCj1v3UaVEnLCEfCmq5kBj7wwcvBitE+OWlbNsnKINFn6i4tnQJR2EOhhc9ttV1YtCB8bGFIrQ1Ix+S5JoZh9zD7rDkQIUuEQshq2Sw8HBIb/9BQWDACiY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(6486002)(478600001)(26005)(38100700002)(2906002)(6666004)(53546011)(186003)(36756003)(4326008)(55236004)(316002)(956004)(66476007)(31696002)(66946007)(2616005)(86362001)(66556008)(110136005)(8676002)(5660300002)(16576012)(31686004)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1hwK2drck0xUHpPbllBSjN3eVdybDliWVpsL2FQSTVsVmVOT2R0MndnN2kv?=
 =?utf-8?B?UC9sb2xFRVpPbE5vRys1V0M3NU9VZTExOUVPRUFwZTJNWG54dmhuTmlsYmJT?=
 =?utf-8?B?ZUFla2hGcEppcFFFZGJ2eExyM1g5dHdwNmliOStoWWs3TmNudkhKUG5VTjlQ?=
 =?utf-8?B?VXpMNUtZQlBNRW9nK0NpOWwrSzhzK0o5T1IwSkRrU1lHRythMzM5U1J4RFE2?=
 =?utf-8?B?aFBPT3QyV3RoRVRvQWg2RTNPYTNoeUR5QmEyTDZWaXl5Y05wd1FISk1IMkZj?=
 =?utf-8?B?ckVpcjdvRUE0S3hudVF6eFQyZHZsUzljYlBXNjBaekVnenA3MTg5R1FCMEYw?=
 =?utf-8?B?Uld1Mkk4S3pkRkxvTS9zaUNQQlN6RzJSRXR2UTdrNkFPM3lxVEwwNm13RHFo?=
 =?utf-8?B?RmdCZDVyVUVwWGRPT2JnSmxCM0FTZjNKK0N3V3hGUE0zK3pNRW9hNHVsNnhH?=
 =?utf-8?B?alBFYWJtVS9nQnJDUTVPSG1LSFlUdWw2SVRsQSt2QWJsQ1lONWtXWEZTZ0ZT?=
 =?utf-8?B?cWtFSEdDeGFEaFJScUFRMXlnT2g0VnlOWEdYbmlyVzl3TjBqeXpHWGZEbU1L?=
 =?utf-8?B?S2UzMHI0NG5hRlQ5TW5nNG5hbHoxTjNoYWVkaUlySkdLTHJJQzBzZGlMM1NC?=
 =?utf-8?B?dXpxQWIvbmVqdzRBdVJGTUtMejRYcnlPSDZHczlCOFlnSXRQM3dYSWR2aDBt?=
 =?utf-8?B?R2tsZGtoRzNlbGQyeHFZYW0vbzhqUWVaUWRDR1FETWtkZkVYT09jOWpjME9M?=
 =?utf-8?B?eHVKbXd4OUp5SEF5emphZ045ZU1qYzU1VmNqdElWVzFCVmViUzhBM1NkdkFq?=
 =?utf-8?B?NmtvRmh3elZMdERRcXRuWFUxdFdobThNMVVxcVFkb2xOV0NpdWxkQk5PdEJi?=
 =?utf-8?B?VDlJcVJMVloyU1lVb1djTEhhQ3lNcEF6YkZiZm5wQUdRY0hSbk1sSWpkMzl3?=
 =?utf-8?B?bDBEQ0twNDIxTDB0QUtiNXBvak1CaXBlNzluSUJRcFcrMEFGelZjUEhYM1NL?=
 =?utf-8?B?bXJFVkxZd0tRMzhoZ3hYa2FJSEpsSFRnbzJPVzUwSjU3eFgwbUlvaVFycXk3?=
 =?utf-8?B?RjA4NnViOWE5RGFWeGd4T1VJZGpuYnhSaVdYZDN6ZGhIQS9Sb2tCVStCeENy?=
 =?utf-8?B?V3poRVA2ZVJIUDdZK01nT1VrNmRsdVVob1YzNW1zSXBZWkRTdTFoaklSSXBM?=
 =?utf-8?B?Z3hOZTU5LytxZFpza3ZkcEc3aDFhWFVHWngyTGhJeGNtVGxaMFBVVHh2L2hn?=
 =?utf-8?B?VXJQb1huU3ZpOXJiVnpNbEpaeU5Pa2Rka0ZPSGpTVUR5T0dwLy9WbXF4b1NL?=
 =?utf-8?B?d3A0akk4NktUZDN1QW1VUWorVFh4MU12NEZXMTIvdXp6bEoyVEJTNWdjcTVs?=
 =?utf-8?B?YWQ1M3VFYUQyOXNmaks3SnVPajU2OWFsKzNoejdvT09xMDlQQURqUS91bUxF?=
 =?utf-8?B?MVRzd1NhVm4wNk83NlNxRFVsamtaeUxRNlM1OWxVeUZXQ2gvUDZCblc3R3Iw?=
 =?utf-8?B?ektkeU1hWXcrOTFhOFJwd21mV2pBeS9jQW0vRE44L2M4NXVMOWVjU3NqS2pB?=
 =?utf-8?B?cm5HVmhzcXFIQ1dlazFUM0N6d05WZnlMRnkxcDF4K0UraXhmVnhIbXJIKzhM?=
 =?utf-8?B?RU4wU1VlZUhpeTNGNzFVeTlyRUNlQU1ZM3JuUlBOalBlaFIwV0tJOXFhbXU3?=
 =?utf-8?B?SUwra1FZZVlXRzlaaHUwNmNCZzljMURGRWorUWFpVUJCM21rUk5mTWtNTU0v?=
 =?utf-8?Q?RQYs8H4zq3NeBtOoG8SLTgVSBgPWj2to78go/2J?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f587c8c0-467c-44c9-c49d-08d96888bcf2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 11:57:54.5562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dt6vQ+kwIz4cUUGYkyxLgoTQYcnpSeKffrQ3d7NzmIZ5On1scoLp43569yL/HwYprvxLa4fq9P6GqrvFVpwMXTt9XBzQ20nhQMm6RyXSkfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3799
X-OriginatorOrg: citrix.com

On 24/08/2021 15:21, Jan Beulich wrote:
> While already the case for PVH, there's no reason to treat PV
> differently here, though of course the addresses get taken from another
> source in this case. Except that, to match CPU side mappings, by default
> we permit r/o ones. This then also means we now deal consistently with
> IO-APICs whose MMIO is or is not covered by E820 reserved regions.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Why do we give PV dom0 a mapping of the IO-APIC?=C2=A0 Having thought about
it, it cannot possibly be usable.

IO-APICs use a indirect window, and Xen doesn't perform any
write-emulation (that I can see), so the guest can't even read the data
register and work out which register it represents.=C2=A0 It also can't do =
an
atomic 64bit read across the index and data registers, as that is
explicitly undefined behaviour in the IO-APIC spec.

On the other hand, we do have PHYSDEVOP_apic_{read,write} which, despite
the name, is for the IO-APIC not the LAPIC, and I bet these hypercalls
where introduced upon discovering that a read-only mapping of the
IO-APIC it totally useless.

I think we can safely not expose the IO-APICs to PV dom0 at all, which
simplifies the memory handling further.

~Andrew


