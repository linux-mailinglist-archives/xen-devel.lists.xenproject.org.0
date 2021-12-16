Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E1D476F63
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 12:02:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247864.427442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxoWf-000343-Rp; Thu, 16 Dec 2021 11:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247864.427442; Thu, 16 Dec 2021 11:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxoWf-000317-OF; Thu, 16 Dec 2021 11:02:17 +0000
Received: by outflank-mailman (input) for mailman id 247864;
 Thu, 16 Dec 2021 11:02:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d0Qa=RB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mxoWd-000311-T0
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 11:02:16 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e5c35ac-5e5f-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 12:02:13 +0100 (CET)
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
X-Inumbo-ID: 9e5c35ac-5e5f-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639652533;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Fg+uEPbE7VxBG+JbUTGhgFYzYxgIXiJQuP/1CtUFeWU=;
  b=ErAQ1wAFeUXjd8uOz3sexoKYkZdShKfzaj5eVncDD1x64Ce8u11wrU2h
   2tKmOi3zt3V9EJlfhu8v1Mz5emidAxbPlESv+hVUf0Ia8Er23AR2+Ml3d
   8NFHDPAdssVbI6IfKKb9ezHEbwouZIeObFTou0jf9czT8k517tpYov6dd
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: iy+1pHLQXsSOFkeJ7lx+DgCGH3Wcuu6jzTTUmkkv/HCKvziH0qvV+x4Cfreljdo1rf0HHVKeaU
 y8wvQi8dUQhJLSQIsVvMg0fS8oC999B6fjEcC+gRXQgwcE6ja+tt60qGxDhr4Z+Yq4hRTXWsB6
 fxkJnFy3/jEjSEDzMMn6bOSS6XufhIPAv/FtkwX1lq5T5U9iVOo0KSC9BDnLa5hLr9E1SFxrRI
 NPAAIJLcfej2LacaWWp58bi08x/799Q0KtWQ8L997/xfbYgaoyRxC9OLb9aWC4MlQogAWvfs32
 C69GQJ7xpXvKBofUVx9Pzgi3
X-SBRS: 5.1
X-MesageID: 60178179
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:67Af4KzWNeCzVoK+EfZ6t+eDwSrEfRIJ4+MujC+fZmUNrF6WrkUGm
 GdOXGCPMv6KMGP1coh2aI6+9B9T75Lcyt82TwQ+ryAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500s6wbdn2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/tqj
 49jibyVdRUGGbPNqOI+FElpEBgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYEAhWhg358fdRrYT
 /Q0MGR+fTn4XxBWGmcsEMMR3/+vt2aqJlW0r3rK/PFqsgA/1jdZz7zFINfTPNuQSq19nFucp
 2/A13T0BFcdLtP34SGe7numi+vLnCX6cIEfDru18rhtmlL77m4ZBQASVFC7ieKkkUP4UNVaQ
 2Qu8yozqe4J9UqkTvH0RRj+q3mB1jYMVtwVH+Ak5QWlzqvP/x3fFmUCViRGatEtqIkxXzNC/
 nWEhc/zDDpj9picU2uA96y8pCm3fyMSKAc/iTQsFFVfpYO5+cdq00yJHo0L/LOJYsPdMiq3m
 R62jA0ClZo0k8870Yb8rWHEumf5znTWdTId6gLSV2Ojywp2Yo+5eoClgWTmAeZ8wJWxFQfY4
 iVd8ySKxKVXVMzWynTRKAkYNOjxv67tDdHKvbJ483DNHRyJ8mXrQ41f6SoWyKxBYpddIm+Bj
 KM+VGpsCH5v0JmCMf8fj2GZUZ1CIU3c+TLNDKq8gj1mOMcZSeN/1HsyDXN8Jki0+KTWrYkxO
 I2AbeGnBmsABKJswVKeHrlGgOJ6nX9umDmLHvgXKihLN5LEPhZ5rp9fbzOzgh0RtvvY8G05D
 f4BXyd19/mveLKnOXSGmWLiBVsLMWI6FfjLRz9/LYa+zv5dMDh5UZf5mOp5E6Q8xvg9vrqYr
 xmVBx4DoHKi1CKvFOl/Qi06AF8Zdc0k9ixT0O1FFQvA5kXPlq7ztvpCLMVuIuF8nAGhpNYtJ
 8Q4lwy7Kq0nYhzM+igHbIm7q4pndR+xghmJMTbjaz86F6OMjSSTkjM9VgewpiQIEAStss4y/
 ++p2g/BGMJRTAV+FsfGLvmoygrp73QanetzWWrOI8VSJxqwoNQ7dXSpg69lOdwIJDXC2iCei
 1ScDyAHqLSfuIQy6tTI2/yJ9t/7D+tkE0NGNGDH9rLqZzLC92+uzNYYAuaFdDzQTk3u/6Cma
 bkHxv3wKqRfzl1Lr5B9A/Bgyqdnv4njoLpTzwJFGnTXbgv0VuM8cyfehcQW7/9D3L5UvweyS
 3mjwNgCNOXbIt7hHX4QOBEhMraJ28YLl2SA9v8yOkj7unN6peLVTUVIMhCQoyVBN78pYpg9y
 OIstcNKuQyyjh0mboSPgixOrjneK3UBV+Mst40AAZ+tgQ0ukwkQbZvZAy7wwZeOd9QTbRV6f
 m7K3PLP1+ZG207PU3svDnycj+NSiKMHtA1O0FJfdU+CncDIh6Nv0RBcmdjtot+5EvmTPzpPB
 1VW
IronPort-HdrOrdr: A9a23:+LcxyKOYb7suu8BcT1v155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/+xoHJPwPE80kqQFnbX5XI3SJjUO3VHIEGgM1/qG/9SNIVybygcZ79
 YeT0EcMqyBMbEZt7eD3ODQKb9Jq7PrgcPY59s2jU0dNj2CA5sQnjuRYTzra3GeKjM2YqbQQ/
 Gnl7R6TnebCD4qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPsf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aySwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7QvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WXAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 dT5fnnlbVrmG6hHjLkVjEF+q3oYp1zJGbIfqE6gL3U79AM90oJi3fxx6Qk7wE9HdwGOt55Dt
 //Q9ZVfYd1P7grhJJGdZQ8qPSMexnwqDL3QSqvyAfcZeo600ykke+C3Fxy3pDtRKA1
X-IronPort-AV: E=Sophos;i="5.88,211,1635220800"; 
   d="scan'208";a="60178179"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InrnOGRyhI4ELYPL8hYZZroLnBuxwhHv7H4U0aRyGHiNQL4A/n3FExI2ZkdYDi1q6YMQOf69ngDTqwug2FMUDrYg/h5kjHLETMBghkMv1MC86kVAADksL0K7/he2cdm6pzJ9WEAxljmK1slNtdNkIjtzASsIDKo+ayr1LekNpt4yQIdcOfN+adDK9E8OEMIxBcam+atQpqj6V+CkoCyPFgvTFO8I7l6hg8v8jTkHZB1YL2lNjAeG1ywMVgcxMviduKbZon/o877lBfHK6Wc5hSJzlIYoHT3+1RR5CwcJeVx1OQsXBzeBQ8vnqcwHUIrYEr0mO0nvw0DkL9pg4gqgIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RWiGSycncAROXKRaDPiBtui2T+NsU8mFODxhu+cqg/E=;
 b=NwpEH9mPoE+nETjstaIEWqr8VN7OFm1apoGpvdxKQExiDsVEYRM+xG4r3USbAyks95t846SI9XH2fjMKJDvoyQU7RmxvI3PxocUFnIG8r7mpYz8sJtb9TiMfe922pf9i4Vqyq20vGZxL7ThlgQc7IJaomPubtotiG8VJU51lvoO8PFIVNc8wOmE/JXEzpA0vozG3ag+yKiKbtg7I5p6hBP+/UeFrVg6z6XBPK6pax+X6TZQ8XDXfR664fpecFfEdS38o+IixCeLBFc+6ogB7rXJkfgK5tqXoul1+s+NS0CnEaMzBdXQI+OTwOngoswh3u+5rfYAukAmGFCyA2RJuqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWiGSycncAROXKRaDPiBtui2T+NsU8mFODxhu+cqg/E=;
 b=Bcjq7A5Hm1rNwqL6Vl2vmgphTxhoNoXNJMSB76DSlPPj4dsFkHYVH9RRlDQIw76Js90AdD+5Geq7oXdZZUU50dOwZwaaCCWpDCr6W+WRcErRgAir4BwC5jIueWUMQJ7X29qUULs1WMzQKQwhw9cwO4mF1K2ZmUicr7gB6W6KUBc=
Date: Thu, 16 Dec 2021 12:01:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH] xen/vpci: msix: move x86 specific code to x86 file
Message-ID: <YbscoZG/NRP6lMof@Air-de-Roger>
References: <b8c0e550dde0fd80b2f72e9136a94caab2c3d52c.1639478534.git.rahul.singh@arm.com>
 <bfb2b7f282249cee8b6ff15d424a2b7d823ac743.1639478564.git.rahul.singh@arm.com>
 <YbiP7YlpY22llB5Y@Air-de-Roger>
 <621259B5-E5EB-4ED9-A836-B6E17C0D6E36@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <621259B5-E5EB-4ED9-A836-B6E17C0D6E36@arm.com>
X-ClientProxiedBy: MR2P264CA0075.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0375f9f-dd35-43ff-aa53-08d9c0837edf
X-MS-TrafficTypeDiagnostic: DM6PR03MB4394:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB439462600B5355C5CC36908D8F779@DM6PR03MB4394.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HOx6zbdQ8OyWE/x3VlY6/t2Pe29C2y9zLIcrFAw5barGZJbZPVxVCLOzr5UxFhnOYMNaOUfX5Q6A+nVMRf6m1Y2xyTIwiIW87Fhy3wn29A34ytf4xOPXQ7NTX4LYK1dMac9Osplc3qax5zSxdekQOYlXfQzZRTUj+l/Bo+sk1+KeGsP117uDzozp6vsinrxaX0Vfv/dFWLSy6I321F8OKoZypnQ5BvPbQNg08Z+L18EFNwvZhFZo/mbJOT9dUvbddSRLcJNXI+MXLJcK3wN1OfOSfTiqVwETWOvNtvkftwzzdcLhde79g8k7nsGKrey/wonEQdm3F6VGpbF9QB+lKXo+jdSJ1fjxJmAfTpuldsd3Df7QkvM9WAdozb9G+3Ai5RkOS0ukv5WrzROFHJFHmk09jECnRed4qs4tL2MrUZnuiUNEe5bXvTO3ZcM7CgGbOm63PRPqFR07dh2ZXPynpXVM3TES2aaKJyu1sC8JoZZfsqYT/hNhUjBHo76+2lSFuLQSTldcpOsuYHhGd4k9qqkgJFx+IuPCtaVJpHBK7rniSgt9lV66sClFSe0r48KlTL7YtwqqDa8TVhER9IGL4ZMrPnX5xEV/DhI2Mw2BNRiBR7Ee5TWkAEhJjPf2x539soasTtKoc6x+/8DUIHTAGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(85182001)(82960400001)(6916009)(66476007)(66556008)(66946007)(8676002)(8936002)(6506007)(83380400001)(38100700002)(33716001)(5660300002)(6486002)(86362001)(6512007)(316002)(2906002)(4326008)(53546011)(6666004)(9686003)(54906003)(186003)(26005)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmpJalJBMUtQMWVmRHI1Y3JraVV5VkxZL2lxaTFkZXZDK0NLa2E1SXlrLzgw?=
 =?utf-8?B?eHJZc0E4a0prTFZEWGsyV2pFZGJLVVBhVWtoK0YySUVzczJObG51S0dJMlN1?=
 =?utf-8?B?VjIzVnRBSlVPRVZiT0lTQ1NuNVBJaHVXSHR4Ums0Q0wrZjkwNFRoMk5jUG55?=
 =?utf-8?B?VnM3VGNBbUloVW02YlRIOVVFeWVkTUxzTkZ2NzFsNWFWUVh5elMzREluSE9S?=
 =?utf-8?B?Tk9wWEk0dW1lMENEcVhaa1J2aVBHNjQ1cDhSdzY3NE1ubVFrdk9JRFg1ZU92?=
 =?utf-8?B?NFVtZmFjOVR2ZUNuVmtZUTZYdWNrV2NtQ3ovRnVOdU9rbjAwYXQrYkFlK1NB?=
 =?utf-8?B?dmtNQWFLMGlJRzNCdGs3L2Rja0pwUVZVbStQUGhNQ1NVOXY4bXl3bUVDcDdE?=
 =?utf-8?B?MUhrQWJMM3hXaWNKUlQ3NVZ6WHcxSDdsdzJKTndCSk01MlZrS3BSVng1dTdi?=
 =?utf-8?B?NGIrQ1hWOTFnNU8rR240T09RelkvSWJjZ0FnOTNPY2tkTGRROEluaGtHdG1Y?=
 =?utf-8?B?Y3FoS2dkaW5IbXhSd2d6ZkpDbkU3ZDNIVEhmZUppNXljd3c2VUxJb2M4VEVO?=
 =?utf-8?B?YzdmdXZxQUdVZXFYSHNBdG1QU09vclFLWHFGbFJ2bzdKN0pxcDlkQk1xNTZy?=
 =?utf-8?B?MExZc0pRNHVtWmUzeElaTzFNT0pSVWd5aWVYWmdqZlhQSmFsTW9WZlo2ekg0?=
 =?utf-8?B?eFlzTXdRaTFyUHJYYTJyNkV6Q3o0eDdkZ2hocWZSVWdUdEJFM2tIM3lON1Vx?=
 =?utf-8?B?OW5wSk9qbTFnMWFjcS9YR0N0WTRiQWNYcXByS2dqblBWSVVxRG9HdWM1cEsx?=
 =?utf-8?B?RkhrOXVQYnBjV1JuR0RZQURKL2kwY1dobXducEhIanpMMncra2h2bklORy9C?=
 =?utf-8?B?RHl6VCthRGUya2ZXYXBaRldvWHlvWlFTQ05pRjJ5NTlDaDR0ekF2L3lXWkl6?=
 =?utf-8?B?RTdFcUF6VmFpanY1RkVxSUI0bmJLSWFSbDJpSEc4S2s0U0U0c1dSTFdYemVX?=
 =?utf-8?B?dFF6d1lnVTBsMzhPckhTUnNuRXpqRWVHMWxJQy9pdTdiRHluS3hyOEJJQ3dX?=
 =?utf-8?B?Yi95Q0ZTZmxoNVl3SzlBUWVtMG5UTlBrYnBxR3MrYnZtK25ocm82TitGVW5L?=
 =?utf-8?B?anZZeWcxLzQ3dDZpL2c1RkU4dXcxYy9TTWExME5SWkltb1N2YlVHc1RqKzAy?=
 =?utf-8?B?cEs2cEllSExTWDUrRDEwMSt4YlovYm1BTlRyOWY5dFNoQjhQaFpnMVhEOG5Y?=
 =?utf-8?B?UUtBYlJnK0R2SDR5R09XeUF3bUE5Ui9mYWNiNzZBLzkza0NDTExjMFBHbDFX?=
 =?utf-8?B?UUMvTGRFSXN6dk5WUmpaMnppc3RFVnBBN0ZreVFpSm11UjdWczZkOVg0YjFO?=
 =?utf-8?B?QnNqOWgxUlFGS1NWTlhCS3R2aHI3Zk1VaW9xYWFxbytnRW9GTm0zQnY4bkJk?=
 =?utf-8?B?a013RXJ5ZEtFM3VneHZCdGFKb0F2MVpOaU9idzQyY242dVkvWDZCQzhmUmc5?=
 =?utf-8?B?TUJrL0JkWmpkZTdseWU1a2dVZUVHNDJ2V25KQml5Q2dKcTdmeFhRelFVZ0ta?=
 =?utf-8?B?N0oyWVNlUE1CTkgrem5oQjVDVUt2ZkZHNG1SU21XYnB6K0NQbXNPREl0MXoy?=
 =?utf-8?B?OUFGbVhBYWtrd0Jkc3ZIZjhqUXdXUk9pd2hGTFRwRXRGV1FZS1NjTEREeElG?=
 =?utf-8?B?WXlVWjJtY29QSDJIWkpRRWZPR3FNNGxWVjg4VXcwMUd2OTNubmRUd1JxbHJw?=
 =?utf-8?B?VDBDUnQ5OFZlOWhHeTdCd2c3aU91Mi9iV2p5aFhrRk9aTENnRmFvRnJ0RXJj?=
 =?utf-8?B?dGFHMTcvcjJiQ1laYmNKWVNCa3J5ZWR1MFFFK3FjV3Y5Z2xVYmE2d1Z2KzI5?=
 =?utf-8?B?K2F4WDE1cjFCV0RlL3U5aFdMWmlqS0FkTnRGcVdIb1ZONVJ4SHF1NlVaRUh3?=
 =?utf-8?B?N3JyVnJTZmpBcEFxZzUxS0t0cGRoUHduNjV4QXg0eHJFdWVQbmg2KzdlWXFh?=
 =?utf-8?B?REtVWUZuREpDQjMzcjdENnRjbWw3UWFwTTJFWjNRTzJrVGRUcTJFenVsOHpS?=
 =?utf-8?B?NGdFdE5yaWU0R2RoRUFIRWJxMXFVSVVVVEcrVTVjQVZXYy83a0Y5cFdEU203?=
 =?utf-8?B?azFtYWVRZ0NXUFlZYXlZTkw4N3lLRFZrRVBsa2o4SnJJWkY5OURuTGdMZkRG?=
 =?utf-8?Q?8JjGB9Dn79VyPZ+J9PsZijE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0375f9f-dd35-43ff-aa53-08d9c0837edf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 11:02:05.4127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ToVVFlnq7ozeRtIwyJQHitI/EXGCfgUzNNOK2kACxTII16r5CviNT38mA0DuSeIReA2w8BShIFYfeoeB9rIQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4394
X-OriginatorOrg: citrix.com

On Thu, Dec 16, 2021 at 10:18:32AM +0000, Rahul Singh wrote:
> Hi Roger,
> 
> Thanks for reviewing the code.
> 
> > On 14 Dec 2021, at 12:37 pm, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > 
> > On Tue, Dec 14, 2021 at 10:45:17AM +0000, Rahul Singh wrote:
> >> +              unsigned long *data)
> >> {
> >> -    const struct domain *d = v->domain;
> >> -    struct vpci_msix *msix = msix_find(d, addr);
> >>     const struct vpci_msix_entry *entry;
> >>     unsigned int offset;
> >> 
> >>     *data = ~0ul;
> >> 
> >>     if ( !msix )
> >> -        return X86EMUL_RETRY;
> >> +        return VPCI_EMUL_RETRY;
> >> 
> >>     if ( !access_allowed(msix->pdev, addr, len) )
> >> -        return X86EMUL_OKAY;
> >> +        return VPCI_EMUL_OKAY;
> >> 
> >>     if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
> >>     {
> >> @@ -210,11 +194,11 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
> >>         switch ( len )
> >>         {
> >>         case 4:
> >> -            *data = readl(addr);
> >> +            *data = vpci_arch_readl(addr);
> > 
> > Why do you need a vpci wrapper around the read/write handlers? AFAICT
> > arm64 also has {read,write}{l,q}. And you likely want to protect the
> > 64bit read with CONFIG_64BIT if this code is to be made available to
> > arm32.
> 
> I need the wrapper because {read,write}{l,q} function argument is different for ARM and x86.
> ARM {read,wrie}(l,q}  function argument is pointer to the address whereas X86  {read,wrie}(l,q} 
> function argument is address itself.

Oh, that's a shame. I don't think there's a need to tag those helpers
with the vpci_ prefix though. Could we maybe introduce
bus_{read,write}{b,w,l,q} helpers that take the same parameters on all
arches?

It would be even better to fix the current ones so they take the same
parameters on x86 and Arm, but that would mean changing all the call
places in one of the arches.

Thanks, Roger.

