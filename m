Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC7737FEBB
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 22:16:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127059.238724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhHjy-0000S6-M9; Thu, 13 May 2021 20:15:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127059.238724; Thu, 13 May 2021 20:15:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhHjy-0000QA-H3; Thu, 13 May 2021 20:15:26 +0000
Received: by outflank-mailman (input) for mailman id 127059;
 Thu, 13 May 2021 20:15:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U61U=KI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lhHjx-0000Q4-3E
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 20:15:25 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d3db3fe9-445a-43b6-bba2-1accff3a4fd7;
 Thu, 13 May 2021 20:15:23 +0000 (UTC)
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
X-Inumbo-ID: d3db3fe9-445a-43b6-bba2-1accff3a4fd7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620936923;
  h=to:references:from:subject:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=LfhQ/0e+rIfZ1fGhjJDwLaWo5qq8gYKoelOO0M3wLrA=;
  b=Lv85+MiG260QzuLLkSUEYKAFq5PeuqgACAJ7zAcStps66rcKJ9pCnBvL
   fTNeQ8TV5M2jFvkv/rG5VfSiHPWYU6oB4RciQbl997i9ANSjkL6RHTNcF
   4dwULTG3hFg1T6PuBjNPrn4XZmZFqyuXjEaOe8jPm6Q53Y1S1IUkdWdwo
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: pzzQJlzjlKNG8S5e9BF32grl1vO3cxa/jaH9CjPqf5NXxe/Wui6+v3VBQ0lRwIoyIkvnyVYZfy
 9Ci2GvxKYRNQ4Kj4ij9wIwLwPdG/mx/P0U80ZDCX5uDjokddpxYq2OyjX4oCchznjfHoV+wOAQ
 qKuWJhgUjavDOcDfDoKX34BbGiVBsc5roS9JD/5Hz+VPF7TOMhk0mv4gVXRv2QuoHu5EipFu0G
 OauGBUvfDaxD4bEMtQluMVafNvyKHNOjuf3hzO42JXCT5VtNQzoTRBUSk8IpRMc4genok23VGq
 j/s=
X-SBRS: 5.1
X-MesageID: 43555868
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:fx/BIK9LU4xYzXrvXlFuk+Hidr1zdoMgy1knxilNoENuEvBwxv
 rOoB1E73HJYW4qKTgdcBW7SeS9qADnhNZICOgqTO+ftWzd1RrKEGgM1/qW/9SRIUfDH4JmpN
 ldmu1FeavN5DtB/J3HCWuDYqIdKbC8mcjC6YiurQYJPGcaEtAdnnhE5x6gYypLrUt9dO0E/f
 Gnl7p6Tk+bCAYqh7OAdwo4tob41qz2fabdEEM7Li9ixBiFiDup7LLgMh6DwxsSaTNAxr8+7X
 PIiUjc6r+4u/+28wTb3WPI9Zha8eGRsudrNYihm8IRIjXphh2JYJ17W7qelDopoOepgWxa7e
 XkklMNLs5343PUcnqUpQL32w789T4y53jp2Taj8AHeiP28aCMxDsJAgY5DSwDe+loEtMxx16
 hatljpzKa/QCmwzBgUKLDzJlZXfh7fmwtHrccjy1hkFacOYr5YqoISuGlPFo0bIS784Ic7VM
 FzEcD1/p9tAHqnRkGcmlMq7M2nX3w1EBvDaFMFoNap3z9fm20851cExfYYgmwL+PsGOs95Dt
 z/Q4xVfYx1P5srhONGdbI8qPKMez7wqMf3QTWvyVeOLtBEB5uCke+skZ4IDCfDQu1V8HJ4ou
 WLbLpijx99R6o1Yff+g6Gjuiq9CllVfQ6dlP22tKIJ64EVstLQQGm+oG5Hqbrhnx3paverHs
 pbfqgmUMMKZQbVaKh0N0aSYeh8FZFWPfdllurSET+10+P2wvWGjJ33TN/jYInMIBcDYF7SLz
 8oYALPAuFt1SmQK1XFaRPqKjXQk2nEjMtN+ZnhjqsuIdI2R8JxWyAu+BWED++wWHF/jpA=
X-IronPort-AV: E=Sophos;i="5.82,296,1613451600"; 
   d="scan'208";a="43555868"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8TQTEr02zgV4aGE6+AGOYEPzSOpj6ud/i2Qmf3zi+kuDU5rNJLT7iyw33GcHuDj61Uus3ZAkUruEQstBEFBQONCNWebsZa9tri6tQNCYg0azG8BlIyJuYzgGAx3MIkocDPskT63kS6YirbVTKk96vuT9JrYf0nHGYUJcu8QlB/HtycdSMVIuwJoy+asZDI26nbgX/lm0eyrxxM1ZPiCc+RrMZ1nLDGYZ9b5fo7E+6a6kWvYqaNe7+fJU7oq5WCFQv5G+1lBagyWi7d0zTccTY0Afu+EO28NMEm/QreLoCubrLqsOfiVojXfq0DV58fY0HVnFh7xYOEnQ1NRH6D3zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNUPB6RNTND5hqCgZhFxtEHC3q+VgGfoK6l471YuAi8=;
 b=QYtM9BKN+GrSSnlsbzcvbBUmGDBEAozvqMYH8eZ2AxCpkf4Ox5REGx5l71iKPhUtaUeIzPI0jkE8wXLOxf5hZTJ2bpNbUlPs3TGSg6maQgQljABvrPULcNBnmLLonlhKP5H4809PdUJvPGqDJ+SuzVCuRRmL5OtljjKlA4KTymx4j1YvLLG2Fo01GEdoPYFDFMoWw2QkXPiYOnGWVWt7KVqD0NsiL3sliWOfSfBjWv/QH1ftRcKljLjsiiSmWAkpayjg1tPrNxVD8hSig+uBcTUKwOFRthNsxQZIRmJYH9vR/8Y7OtfeAvhjzYUzJ7PZ+NWKZWcAm4uRwVXZbqUj4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNUPB6RNTND5hqCgZhFxtEHC3q+VgGfoK6l471YuAi8=;
 b=hC/52uBPCzBMttboKf61U6A6QV5bQEK1xf/AOk9aLU2fgyLNZ4eymsZAZviI2KMEMWveUx174rwFeR+wAYqnwRf6MVF1nCOs/2oLM6UoUrpFSSuB7x0yMGsG8WXpk1l2T8FsFDp73s6Ht1/pAYfpmgANode/nc6VqRwNB/veh1w=
To: osstest service owner <osstest-admin@xenproject.org>,
	<xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <osstest-161917-mainreport@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Regressed XSA-286, was [xen-unstable test] 161917: regressions - FAIL
Message-ID: <7cfa28ae-2fbe-0945-8a6c-a965ec52155f@citrix.com>
Date: Thu, 13 May 2021 21:15:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <osstest-161917-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0288.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::36) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 004e8a3a-f516-42db-3bb0-08d9164bd2ec
X-MS-TrafficTypeDiagnostic: BYAPR03MB4871:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4871440FB77B82FCC1397704BA519@BYAPR03MB4871.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sPild0zL8dZxCa+rXjOS75ZQTQuDMBO65ZqV8vi7u5DMoy4uLjvTMnj6GoHxvy/xVw0BxGPTsmgEafW5f8Feu/wQIfV1FvahEjTUdQm09icKkA4oujaWKuWAwj1CfgeQo/BOnl/phUbrEwaygoaZLhNl1uhsLtLgqV0GOIP/YLJq9HPDi0vo/wU2TGH0IQcI4dnnCGL4ou9EY64Ukcm6wUq0YNUBGv2chL2N72g3IGOmqPEjQwlsG3j5ookYF7289VTMO2+UGTUj6Xu5mKHtkQi4xDEftEzn9AWd0253rpGSFxTEOoetFgM+QGFt2BSotCUHJQjkJ2+Z3eQyr2d3uY8bjhwLoVj0QkKV6tYLSoUasGZeyET2Xq4/5OzrHesKFwcuLRoiu1i7wTlu2bPOvDc9sKfdm9fdJSXYO9jBZwVrpdvi8JtplbY2DZHGu/zsYXG5INqkrQVRE0KkmApQsFThqkJ9ncUUw+C5J9Fww2C4yXkffigRufkxYRvT4SGPyb36k5IU4TXqYYDtoIagBKnnsvSfkL5czgcgcSGw1rWw32CsqR7pE8Rqv+UdvHd/rdnSPU8+Jj/p3Kaz1Q16YbpU/ttrz52OF6+hbqlOcquou4coFZw3ZeE84Sz/VG36Ovrxi13vZXpFESANuvaiywxw5jdldTkWwTpSsdNWR4g4bZfMVyuBvA8XNQrQOUOQdVGVLCWlom1QyrL6rqeWQHqvPwlyCc5OlEpMn0m2ws+PGl6HybXOT+DC3e0LitCS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(2906002)(478600001)(8936002)(53546011)(26005)(66476007)(31686004)(31696002)(66556008)(2616005)(956004)(36756003)(6636002)(66946007)(5660300002)(316002)(16576012)(38100700002)(83380400001)(6486002)(110136005)(966005)(16526019)(6666004)(186003)(86362001)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Ym84ckdXOEJkNnE3V0pqa0ZLUEd0ZytVeFZ3eTdSSjByT0l2RERaRENWRmtP?=
 =?utf-8?B?VWt1SDlJelUwaTJ3N1ErcDZRTUtjWVRGUzc4ZW1CUFZQa255UXJWcnpxdm5r?=
 =?utf-8?B?ejZLZ2pkTUxhbHdXeFcreWNPSWFkWWtsVGRpbHI3WEMvdlpuUzR4dFI5czBK?=
 =?utf-8?B?amJ2RlNYcVdoL0ZxNXZOTWJiaXkyY2dFZFpnZHlDU2djbmlCT2tXNlRrR2ZV?=
 =?utf-8?B?ak9SRWdUOXpMSVJwSW9TVDgxT0FBRkY5bXhiN1hEa0hYaVdOZzBNd2dUbDRO?=
 =?utf-8?B?Ry9nWHZuSHVpczZhZUt0ZlZkSGpoaWZ6K21NWVBYeHZXV0dQdi9QYUttakRX?=
 =?utf-8?B?Q1BMcGo0SHhsUW56MyszRXBWZWc1WmZHQ1RTRVNJSGxJR2tyRmJVNlhQaExH?=
 =?utf-8?B?RkNZaFJhdFFnakc5Z0tOQ1BFd3pITTRsUy9LLzI2M2gra2pJRjVGUFlrMTFr?=
 =?utf-8?B?eXVZdDVTWVA2REhNYUFVUnora081UnBsSmFJckZlSWFxTUFBR3dodDl5cnNw?=
 =?utf-8?B?cnZTamNGZFNaaTZsRWdpdkc5Zi8zd1FQSUd3WHlSZVNkb0d2R3VRSkN4REQ5?=
 =?utf-8?B?Y1dLRXM1WkE4eEFPL1FHazd0dnJFUGZSZDhtdS92eWsxOVo4WkhpcUw0WmVj?=
 =?utf-8?B?QVpVVEkxQmh3K1pYcXdGaVd5bE02RFlTT0duOW9IbXh6blpETVZ2MFlNbzlm?=
 =?utf-8?B?VFhnZW1SdGJuV0VHeGpNUjJvS0swTW9od0NrcVZPWTlqaTNpRkZqWUlRekhk?=
 =?utf-8?B?ZXpnM2xTdzkvK2FXWXk0bzhFK0g3VE1TTGtRZkpFSGV3aVJGV0pzS0xWd2Nh?=
 =?utf-8?B?Yk5pajlaYktRYnVTMHd4V3hQUHpicGo3WnN3U2toSUtSczg4OVM2MUUyZ1Jl?=
 =?utf-8?B?WDQxQ0g4dkh5MkFEVnpOdUNTMkRNbFRtK3JyMWMvZCs5WER5cCtjWEJ4RWVO?=
 =?utf-8?B?T2lUbmFQYURNbUdha1MwQWsybWNwWEJ6eHhyMThsaHE5eXNQU1FBanR2OVdB?=
 =?utf-8?B?R0JpK1VjRFVKWEluMWE3OWlmU0NXSjZFMkYwaGw0S281dERrekxWNUpXcWhZ?=
 =?utf-8?B?d0gybzk5d2dVNmswYXBLZWtrTCtmci9ONncyVnFCMUhtVGdpUStBcXlDZlUr?=
 =?utf-8?B?Uk1PWU1MMllXUmNmRmEvM0kyNWtNdWFCWVpDTGxhVnVLVllkUUgwaTVDZkJh?=
 =?utf-8?B?ZTFNL01LSUFwa3pHTHFwbk5XRGR4R3RmMzM3R051WjdhUEljYkNYampBVW9j?=
 =?utf-8?B?eUJ1czZjZ0tDakRPRjd6TSs2SnR0OEtFN0Y3NUJhRks4cUluMlJYWjlKVVVo?=
 =?utf-8?B?TDYwOGtIa2FQaDZjR3RXMHV2R1dMaVBWdFhEbTFyS2t3VzdEZnR5K3NscWRV?=
 =?utf-8?B?MEZEZlVyRFh1ZVBUTm1lcDlHQmtZeUJBZlJxYlgvNUxoMkZiSzg4UC93eXJ4?=
 =?utf-8?B?Uk1FYjQvQlczSHpwcDlCZW9BZUNlMDdSRHdGRjFxdXBMaGxmc0QzWUkyK1N0?=
 =?utf-8?B?TmdxeXFudWxDdEdiQVM2cHN2Z2lFSHdnbktuN0VnWExKcGhGV0Q2TjdGOWgr?=
 =?utf-8?B?bkc5SkNZcGtwcHpjK2FYYkErNW5zOG5xbjBieTZ6VWJFTk9UeEY5Q1kyMFQ1?=
 =?utf-8?B?NFR2YjhEL0xCcjQ5NWNtZ0JjYmFOUm4yTE5oRkZlbms4UXJsNE5UcXlyQmk5?=
 =?utf-8?B?cVNPZUhMQkVpZ3hwWjB0T0lEN1Y1NjRwNHpLM2RBMWJ6MmV5Q3B4S3ZpN2lu?=
 =?utf-8?Q?fWITIJh912dh1sxtpRh4W7tzoNIwNE+YrLPdxNs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 004e8a3a-f516-42db-3bb0-08d9164bd2ec
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2021 20:15:17.3547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y385eZs55DRyL0AM3Rnro/c4DXN8bHEt5nSwi/Se5LP2lGkPIV2KZFNp9xEQ9LsSm9PC1XYrl9+rzx//USPdz30l0m0qEuzLNni3mniy+a4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4871
X-OriginatorOrg: citrix.com

On 13/05/2021 04:56, osstest service owner wrote:
> flight 161917 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/161917/
>
> Regressions :-(
>
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-arm64-arm64-examine      8 reboot                   fail REGR. vs. =
161898
>  test-arm64-arm64-xl-thunderx  8 xen-boot                 fail REGR. vs. =
161898
>  test-arm64-arm64-xl-credit1   8 xen-boot                 fail REGR. vs. =
161898
>  test-arm64-arm64-xl-credit2   8 xen-boot                 fail REGR. vs. =
161898
>  test-arm64-arm64-xl           8 xen-boot                 fail REGR. vs. =
161898

I reported these on IRC, and Julien/Stefano have already committed a fix.

> Tests which are failing intermittently (not blocking):
>  test-xtf-amd64-amd64-3 92 xtf/test-pv32pae-xsa-286 fail in 161909 pass i=
n 161917

While noticing the ARM issue above, I also spotted this one by chance.=C2=
=A0
There are two issues.

First, I have reverted bed7e6cad30 and edcfce55917.=C2=A0 The XTF test is
correct, and they really do reintroduce XSA-286.=C2=A0 It is a miracle of
timing that we don't need an XSA/CVE against Xen 4.15.

Given that I was unhappy with the changes in the first place, I don't
particularly want to see an attempt to resurrect them.=C2=A0 I did not find
the claim that they were a perf improvement in the first place very
convincing, and the XTF test demonstrates that the reasoning about their
safety was incorrect.


Second, the unexplained OSSTest behaviour.

When I repro'd this on pinot1, test-pv32pae-xsa-286 failing was totally
deterministic and repeatable (I tried 100 times because the test is a
fraction of a second).

From the log trawling which Ian already did, the first recorded failure
was flight 160912 on April 11th.=C2=A0 All failures (12, but this number is=
 a
few flights old now) were on pinot*.

What would be interesting to see is whether there have been any passes
on pinot since 160912.

I can't see any reason why the test would be reliable for me, but
unreliable for OSSTest, so I'm wondering whether it is actually
reliable, and something is wrong with the stickiness heuristic.

~Andrew


