Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDEE3C22DF
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 13:31:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153569.283713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1oih-00082V-Qq; Fri, 09 Jul 2021 11:30:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153569.283713; Fri, 09 Jul 2021 11:30:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1oih-0007zr-NO; Fri, 09 Jul 2021 11:30:59 +0000
Received: by outflank-mailman (input) for mailman id 153569;
 Fri, 09 Jul 2021 11:30:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iqbd=MB=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m1oig-0007zl-Bu
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 11:30:58 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec641b34-1ffd-4df2-af83-9b5f8d1474da;
 Fri, 09 Jul 2021 11:30:56 +0000 (UTC)
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
X-Inumbo-ID: ec641b34-1ffd-4df2-af83-9b5f8d1474da
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625830256;
  h=subject:to:references:from:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=psB2xWnBcPcXhQInXe22j9/v+qsHYQplJW/VaNwSB1I=;
  b=D0p17KDWRxY1WcX7UjFYzVW/MsGBU223CkgQ0P9aMVvXehLqOsAEicEW
   rHKQQMkWtFMItTLIyqqh6Q7Hui5Ax1b/U54H39rCAMv8Tq1jloS+Eb/tC
   2n1paap3RdUq117nIm+TGdPdSjHGRMS/JatlKKDvNZ4L5u5minjEpcIBB
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: uOU7JcjEgkc/3tIGHl3pRCEs2s4YvR0T+OUap/NqQkbDEA+GBhifwdgBMk2qqGMJX9BZRyPcjn
 rq6dA4HWHpAJRFpwc9MKjssbOPc1agpsLy4Rhxd359Smrr/E3+gJKk81+Z04oTcVnNbyk3SCoJ
 9azvZtWT4xxh5HrA7tzD37gnEaBlBsy6AsInmwiLYE8K45SgZlP1ShwttbSg02jiGckOsX9NQ8
 BYRjoNCGe02/em9XseHnSn6l2U4WIpa7cSSr8RMkDbZKnQnp3Q0p5zq0rXPET5CHeonCz6vNBB
 fFs=
X-SBRS: 5.1
X-MesageID: 47918126
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ivwUVquIO/uCIuFkLj6iH2Uu7skChoMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90dq7MAzhHPlOkPUs1NaZLXTbUQ6TTb2KgrGSuwEIdxeOkNK1kJ
 0QCZSWa+eAfWSS7/yKmTVQeuxIqLLsndHK9IWuvUuFDzsaDJ2Ihz0JezpzeXcGITWua6BJcK
 Z0qvA33AZJLh8sH7qG7zQ+LqX+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+qemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lsdFvU2z0mUUnC+oBPr1QWl+i0p8WXexViRhmamidDlRRohYvAxxb5xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqrEypunAv+NRjzkC3abFuKoO5kLZvuX+8SPw7bWbHAcEcYa
 dT5fjnlbVrmQjwVQGfgoEHq+bcLUjaHX+9MwA/U4Kuon5rdUtCvj8lLfok7z49HaIGOux5Dt
 v/Q9NVfZF1P4QrhPFGda08qfXeMB26ffuLChPKHWja
X-IronPort-AV: E=Sophos;i="5.84,226,1620705600"; 
   d="scan'208";a="47918126"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F6RHk4J3T+cj+bsA1yOkSW7qb2jm1nfgyfRRh1kmQZ/iFppX/cgCHshbWHMj73/cJoD7Emn3LOH+CVRAmVFTVepeGSwLyTssVbAoLM+b+EC8dnWf2JP/A/m4HJCDoHSVfXKZobC32akFIAgCTbspU4kdHA18zItLXdilbE7zEbQ6tpIVQro07GAL94/JrM6aYBRnG75yAKrhRqENuIQV5CmRT6IfhpH+m4t2+m9IkE1Gw3BiueHOvOLZMyS7HbK7oyM/tBVnV59bMYQOEjT5QG4vWIaNlN90gvJO01GhJ7D3qbOy40UWXtOiv4nlYFE8UrSx/xg7WNYXOdrxKPw9aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=psB2xWnBcPcXhQInXe22j9/v+qsHYQplJW/VaNwSB1I=;
 b=KiBlTIWCh0y8/n3yXM/btuDxjedWznjmoYC0aI535NYF/zAyJxHYxBoBiJGy72cZpNUAj8XYNr3ejez8AtMjyy3JVdWcbiuKb80qZwy98HXncDyPiOxg5jvdSkwjndw4MUiY5cYVMHc2HzJVvJfbTg1cTyTdvZWh67uxJzrELMNYNmPJM8wysnNeiLLCGkx4eg0bU4WRiWZGxqACoINztcu5vo83HlZ237L3hCOv5AqKvKP0tCdfHmO5CoZJgPipK6Q4x/Eik9BA9oluweBAN+PaslyafKSJtaDQqHpuPJFhGmdA3TmujwRtNhf1CyG4Vli/a+ZCsXUqv42DTOSZfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=psB2xWnBcPcXhQInXe22j9/v+qsHYQplJW/VaNwSB1I=;
 b=pnUBRubCZlT3vI7jTu0VNH2bOpMOfMwltDt9SE9kzDwPu4zOEdFbJ+vltuILIooVBcTCHsmYm09UhR+nyPM3DBcLuNQfXgyGDUrtcwW03nHPvthEZHZPWBeEdkbR1cP5tbdBxJgYvQkxSCz+vYEdidWGDgW2F6vOKzO+u56G6rU=
Subject: Re: fix vbd rd_sects stat
To: Richard Kojedzinszky <richard@kojedz.in>, <xen-devel@lists.xenproject.org>
References: <585c34fd96c6e22847333d9d18843c0f@kojedz.in>
 <522642c6-6ad9-28d4-469e-53583441287e@citrix.com>
 <61970531-A990-44B4-8614-320141E7C2D7@kojedz.in>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4cb7a1b3-00ce-5866-12b5-a7df8f7a878a@citrix.com>
Date: Fri, 9 Jul 2021 12:30:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <61970531-A990-44B4-8614-320141E7C2D7@kojedz.in>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0501.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a0f2455-d830-42a5-37a8-08d942ccfaac
X-MS-TrafficTypeDiagnostic: BYAPR03MB4872:
X-Microsoft-Antispam-PRVS: <BYAPR03MB48721B80861957DBABEE26C4BA189@BYAPR03MB4872.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: djCOa8OneUeHRtVSnSgyijikac5K1/43yBjnuAqub6BYhakv1XufoNq6c+mooXoURa3xg7whBMwHkcaRuiuETVAd6k2I2pJ/mBSVu4cb/YZpOAO1p80Klozhg6Sz9x59MfS8rn1OS4BZGy0sqbSwNUWrelhrKPheZIGAzFof73QUPAR221Yai/jMA+aohl4G5BktYnT45ZU0xHiaYAiswpdqbHb0ywoMGmx7gmeIYbTgd+Urmm83fIaoV52tgHHgvrTVRF+AXOVNAB19DWpT/Zw3Q22DvXHFQzC46NlKiE/7nFOiZRutqCM9P5wO9ZTV/3yLhglPUcg7eyY/gZlvMNkZRWYTVorG8d9BnTfU/gCJvIjaayOJdAK2TYQJdoNHClsAkncJf9k82ifFfAHfZ3TChyWj/2fv6L9EAVAyUNVnQdWMnj9iDCcprxNc1t09epmTOM9J8fD8jWlEhLehm33ak6rG4eSLcYR6N4qqF8f+Kw6PDTvH3i8U0o0nPUSwMJDkeDdP6XgWBRckDbb8KRskb+MVj1RSYgjK4rFNHB7ThJbHHBhtLTEuMM9VBz/iBh6bx2DX9i8p//wkxJvV7lw5idK3pfBwKrwK7X8eZ5u1PWAGrarGzT9r7/inX1Hm/n1K2Pbi/jIEOv1BRUZ2qNSOh+tUHt3A91A47tOKj1tp22v7i8VHYtbsf20jqEN1SRDNV4xHZPGerXiJjY9mnuKFOw82H7SiCYTdCeVVjPYFYOQJlo70TBpbxPgK0KF1cCbxR9ph7yixo+Oq9GzjRzt8zdPQ5ycNVcLdb8O7ZHi7zcKPLS3Ye3iJ61S1J608
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(956004)(38100700002)(8676002)(6666004)(66476007)(31696002)(53546011)(8936002)(2906002)(16576012)(31686004)(26005)(66946007)(316002)(36756003)(2616005)(6486002)(5660300002)(966005)(66556008)(86362001)(186003)(478600001)(558084003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzM4aWMrOU1RUVpVSU1QdkVNZjN0YzY1K0lyYkM0b2RGTmpWWlI2MnQ4SzFD?=
 =?utf-8?B?RGtEdzJ6RmYvMXVlZXVWSHhheXFWU2sxUmptSXhjZHFhUTF5Q2NMZjBidG9j?=
 =?utf-8?B?WVYra3BvR2FVc1RoS2cvcloxMlI0cU0vWVdIcGgra1VxQ1hQb0Z2R2hwMVFj?=
 =?utf-8?B?SWJMdTdaaTY2NjNxR1VtTEJCYVZhV1g4MTdPL3BtOUM5bXB6dmlzMkdyVlRZ?=
 =?utf-8?B?SWpFWEdPNnJXOG5xdFg3ZGNENS9NV3VzM2hDUjE4QVZxM2FXbUdSaWRROXVq?=
 =?utf-8?B?RXZNaXVMb0lqZGJvTmI5N2RrOFBRNnhVZVluM2Y3Rnp1bWkwcHdYNUcrcUxQ?=
 =?utf-8?B?Nk1Iam8rZEd2WlhCWllIalAvQjBNd0V2eWYzVFVOZm5iV0RYUTRndEY0L3dy?=
 =?utf-8?B?dW5COEJNQ2I0OXVQbnI5RnhpRVhjVnNIVC9BSWZFbUVIMUtVNVYzYWlwa0du?=
 =?utf-8?B?bFpnMEZ0RlpzUVYyaGRHaWZXSzFBNnJXL2hWVFR0dmoyR2NYcy8ybHh1RDVR?=
 =?utf-8?B?NHhiV2s0a0xKZDc0WUp1Y2dpVWFuaFlJUXZvYXJZYlNGQ2EvcnpOdUNrKzh6?=
 =?utf-8?B?YlR4S0ZoVEJOc2xqeVRmRmZUeVpGNm9MQnZ2dHU1OHpJclpaV2ZmNW9VWEFj?=
 =?utf-8?B?MzJNYnNEbm5SQ213b25peXNtQXROeFBWRkE1dER1KzNxR200YkhqOGU1Tkc2?=
 =?utf-8?B?dzJyN3Rvb1ZQamQ1RmdpUVR1LzBzcDV5OFozUzJBa0xhWlpWWkVuRnhzVTJ0?=
 =?utf-8?B?ZWptdFN6ZHRtMThwNlZQQThFNW9XN2VOUko2K3A0ZERUN2xxY3dqOXFLNS8v?=
 =?utf-8?B?RG5Bem9ycWtGRlBwa2NIZ281ZDl6VFRRbTNML0d0WTRQNUluRG5rdzJxc1JE?=
 =?utf-8?B?Z2lrZzFkV0M1azc0cjdzcUVqMU9XdTlKckZVTjRBRVREeVV2UExnelQyMC9P?=
 =?utf-8?B?YWVUL0orRzJCRUMvcGFIdlNhZjNKKzJDZG1aNTFSSUtCWnRQM2o5YmU2OWpl?=
 =?utf-8?B?TXBvQ3RHZjZ6N2k5SEZ4bllRSDIrV2RBSjhxWXNLeG81ZEtNd0Y0eDVPY0VY?=
 =?utf-8?B?bXJ3WE44U3U4Q3U4UlQrVlMxQjQxU3V4UlMyelVGbzRBYmlWbzRvbUFJTXN6?=
 =?utf-8?B?NlJLY1g3NFU3UHREb0RLSFAyOW5NM1c1MUp2L21jYTczRDFOOTAvcTVUVSt5?=
 =?utf-8?B?NWZ4N3FLNXJHcGkwWjhyTVM5eGNqVC9Jbm9qNVBHL3hKT1YwVU5TcFJrZmRI?=
 =?utf-8?B?Y2lSaFdSeEtDOHU4d1FoY0I1NlNwSFpjMFk0eU5EdFU5ZzQwZThLT3NLWURx?=
 =?utf-8?B?TXIxUTE1SFJEL3Z2MS9aRklwazJhYTBTODE4bnhQcVh4cGV6Zk5uZ2V5Yld5?=
 =?utf-8?B?aWZVNHJaNXB2WWZ4bGZUMGJXcnFZZHJwVUloRXovSWduQm0yU1l3UkJqc0FB?=
 =?utf-8?B?REFOVWhxbXVvZzY1WW1jQWlwSXVIRG1nSE5WdmMzaStLd01STlByS2xGWFhh?=
 =?utf-8?B?RmNVdTNVWDNVRUlkaWVUSkYxeUVNcjI3V1FvUWtndlBFRjB6MHFHUG1rMmlD?=
 =?utf-8?B?ZVBIbm5YU1dHQ1Mzdk9uK2R5cjl1Q0VUL0JnSStoZWJ3ZHNURU5GQ0ZVQTJy?=
 =?utf-8?B?azBBeGtVanFseVJzZDF2TjgrNEUrdm1kd2tKeVFrT2tBVG40d3QzeEd6MUU3?=
 =?utf-8?B?NWcxMkVVbXJMcGV2UDc3R1dKV2VCVVpmK21CTlVYUDZmd1JEVXBoSTFIN3V4?=
 =?utf-8?Q?Rpl9aGdiXW1q8rRNWE+Mjt7rznN/NgZvQ65jhxi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0f2455-d830-42a5-37a8-08d942ccfaac
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 11:30:39.7826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FWhuS+uePNE4SvMiaZOFy1+nQIj+lX51dA1vJ2Rn0R/r4TU4QCjnC8XyxEjSI0tbz7wsfDRqcqPVlziIbR6cZ0Vh8vCtoz2dxrbV7/LXLQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4872
X-OriginatorOrg: citrix.com

On 09/07/2021 10:32, Richard Kojedzinszky wrote:
> Then please add signed-by headers. :)

Ok.   I have fixed up and committed the patch.

https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=89d57f291e37b4769ab26db919eba46548f2e13e

This will want queueing for backporting

~Andrew

