Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC593A1188
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 12:53:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139197.257459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqvq6-0000KW-4T; Wed, 09 Jun 2021 10:53:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139197.257459; Wed, 09 Jun 2021 10:53:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqvq6-0000IF-0p; Wed, 09 Jun 2021 10:53:38 +0000
Received: by outflank-mailman (input) for mailman id 139197;
 Wed, 09 Jun 2021 10:53:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YCjx=LD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lqvq4-0000I9-FX
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 10:53:36 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba8a8288-9f46-4815-b7d1-15fce8e97464;
 Wed, 09 Jun 2021 10:53:35 +0000 (UTC)
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
X-Inumbo-ID: ba8a8288-9f46-4815-b7d1-15fce8e97464
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623236015;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FvtKM8hZcyiOKUxPEBrh3kQZZTzUXlzcfWC1I/fdj5s=;
  b=AP5lr72YR1FCpRrn8gnZ26KQHVnepzlLbe5XMHm2vZblPZvftybQTilc
   h48xg7AIGGq5mO3XT6ePzh3p8mRbcPk5iC8Bz0PJFOda/MNMQlvkdfGqZ
   WT1i7o97BaDzSb4ZzizPWZrxOoujJPtyZwG7+rKCKeHC5OYe5WljWi5kr
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1kgU9iqzK8ymFuM9n5R/Z4I3cglnAgEhhyfmGIq73u6wBZ408AnlOR+I1oxCWiLa3GSqtGiLZX
 7y6pQCXvK6NzIfvmwaD2MnV7kWyspNuHps0Gyu4xaRFWWlfDO2lQS9a34tX8Qs0v6THQaUOMVv
 htTNY92sNewatbB8p/do7BQCtRC3feYrFwE6MIYr/r4HU6oORy2l9MMhfS5GOLIY16jiWt0N7j
 ZNCcWM9GOMQTQlsgmGoRQ/ohSgG+KcsK5ODdx+stQvISThBaqgoe+0zP/9m1BWJ+XVF72uolZG
 ldo=
X-SBRS: 5.1
X-MesageID: 47290813
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:+FEuc6DhWs+F2FDlHehBsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6LS90dq7MA3hHPlOkPYs1NaZLXXbUQ6TTb2KgrGSuAEIdxeOkNK1kJ
 0QDpSWa+eAf2SS7/yKmDVQeuxIqLLsndHK9IWuu0uFDzsaDJ2Ihz0JeTpzeXcGPTWua6BJca
 Z0qvA33QZJLh8sH7SG7zQ+Lqf+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+SemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lkdFvU2z0mUUnC+oBPr1QWl+i0p8WXexViRhmamidDlRRohYvAxx75xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqrEypunAv+NRjzEC3abFuLIO5kLZvu3+8SPw7bWTHAcEcYa
 lT5fjnlbNrmQjwVQGBgoEHq+bcK0jaHX+9MwI/U4KuomBrdUtCvj0lLfok7zw9HaIGOu55Dt
 v/Q+1VfZF1P4IrhPFGdas8qfXeMB2EffuaChPiHb2gLtBdB07w
X-IronPort-AV: E=Sophos;i="5.83,260,1616472000"; 
   d="scan'208";a="47290813"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=glrVPH/NGipcmYS+hBER8wcgvMafYEc7sTSeNRxka0esobIsIAe4g9Ogp1ior4rBRXhcfnhwl92Sp4pr5EC86aJqWfRZ6NMw3FLd7Sfpph1+HdSPF3LM0tfsUGZlPHukbsg8vc3VLflaTtt+SvypUjMFY7kiK+76ydfgm2qsm3B69PRrxHjTJvMw7pjjfQrUZiGSaTtF0J+6A7de7sDc9fdvLW8OOy2nesNprwCHk0bJSje2SbJtiiH4vSxe6OrRKd54YgdIKzv5zVB+R+nTyyYpMo+iyI30qJDetwfjht71bTQ+q5qyFW3eyMRV7qHLbfjorDBx//ET9nDGFrUsmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvtKM8hZcyiOKUxPEBrh3kQZZTzUXlzcfWC1I/fdj5s=;
 b=LoEBB77bY8uk5mKXG/wNAfN8HHHOAdsV5R1BQmRZHvzhosY5YPikJ2tuAehuT4wR+M4jYmlTMqnyB+nxaKISoB3uWNMMt7o3/S1H1Et5IxozgGRvt8JhOBSkp96t8HxY0IA9dON8WWqXK4UzJY/GYX/m5S39kTfkaTNegNM79xZuozVlCZLDsaqmkt+ldLHx2mtMZzvTF+9bX80kRRdOMMfs2kjn1BdGJf0p/q5McQnzblCN7C84tAYXqBQnF/zu3mp9bSxCx/6pTryAHQhkmS99uf/ebap3lj1lEjX0vFO9bPyG3QtmgClND5xOLqJA7VFrkElWkmaDayeR0OzMaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvtKM8hZcyiOKUxPEBrh3kQZZTzUXlzcfWC1I/fdj5s=;
 b=LkfzBpzyyEUJAWX5MzJltCYcs+lf7BRJDNhR/Rx2nL2PL4cTFgXll3UaGBbeUR70N6HZpdxjgUk2Nz7n9cYGz3p3uQRlq32RCsgmiJcsa8uIAIO7f/XhPCV1bz3h+K9CsWWbMcpONl5+APNUd0DCUHHuVF6Kk7FLzXeKGC9+fQE=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>
References: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
 <da2e161f-5d5e-c4bb-bce4-7b86e9418a1e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/9] AMD/IOMMU: re-work locking around sending of commands
Message-ID: <31dc681c-8713-7ddd-6c4e-3c385586da4c@citrix.com>
Date: Wed, 9 Jun 2021 11:53:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <da2e161f-5d5e-c4bb-bce4-7b86e9418a1e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0291.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97d58c6e-ece4-4763-3e36-08d92b34d231
X-MS-TrafficTypeDiagnostic: BYAPR03MB4247:
X-Microsoft-Antispam-PRVS: <BYAPR03MB42473E8739BE1F6203CC066DBA369@BYAPR03MB4247.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vWGmCXexLoPO6f+8EpUCC+FGhz6D5RRaDiOGpZZOntAIoaulBr1/WKTsCC7vgS/X/X/YHu+v0sKypC/bAJasP4huWY8fNPEiscfI6I4DrB0wISrVkgmwwYnXi5qtd1xTUX1R24YCT3JUhLqRy5DUU0CXXn3QiW8CUHjgjpknd+ARM9EPms8OWkjj0BjfmzJ1apI/HOthH3latITcTw9zhnMhijTJecfRK2Ju7TXibnhyC3SsWPLAMbZ0hCL/xqBiCROJbdDZ2GsNZPYeHVvjBB0A955ptmLsrDztFJqb9xRaCufomWAt1lwVWNe2g+hlhCY8zXRArQc+M5Twd4Vg0450QibuLVbzYkZndnENVS74POcJOro4KPhRbiExDpOEuKNTPiR+tXl0apJeomBK/c/gVg+TDY8YLu1f1nAsgJLY4l4q82IYRnAtCAJbZq3ilUDyVhU5yO1UYFe7ssSEYyUQG9gfKkVhaIQiUyy6dAVJ2XEM1FdYeC9vFjKzzTKsZ8BVmR4JRzrJrGF8R+EaBQEnEXpWVmga2fpm8KL2Ta1nUvh/PvJF7RcQ4hn92gsYVkCtKL1tVtuGbWBFUoId96z6YZaDbAoArPMg4q5axOPo0iFmA1wfDJHhCLgS2amxg2Y4YmsReqysUYrWj8mzJMPdpAgzmSdD3OPhGN+KPBvXjytkG7ik6wsvr39YZRwh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(136003)(39860400002)(376002)(66946007)(2616005)(86362001)(8676002)(66556008)(956004)(4326008)(53546011)(66476007)(16576012)(38100700002)(316002)(110136005)(5660300002)(31686004)(16526019)(83380400001)(2906002)(478600001)(26005)(6486002)(6666004)(8936002)(36756003)(186003)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0F4RFh6NE5acytHUzFaNmxKdWo1WmVkR2dlVFlBM1EyT2VDRnhIUGxVbVRz?=
 =?utf-8?B?TmJWQjNaWExPSFRXZDhvd2hxT1JRRWFRellhRGdOb003K3RYb1pITWIrQTFp?=
 =?utf-8?B?RzhQd3l0ZmFkZmRqazJjSTQvR09yaWI3MEN3OUdkSlZscVoweC9ZdmlGMGFO?=
 =?utf-8?B?WTdqTk44ajgyQU44bTY3Ri96NGYyN1VKZ21GNkduRDB5NEFFR3ViaDViK090?=
 =?utf-8?B?RkJ1SmZ2YUdvOEZqZmk3MmdRNmIyNTZXcW9mc1B6T2twT1Izc050Q1Y1SmpY?=
 =?utf-8?B?Wi80SjBWL1pCenpJQ0NtS0lWTlZwbnV3elRVTFdVQ0ZwRU0xVlZKZ0d1RC91?=
 =?utf-8?B?VkhabkNUWTZ3ZTNoS1c5WFNaeUZ6NFFpLzlhM2hUQ3V4a3UvSTVTc0VFOGpq?=
 =?utf-8?B?ZWd5eUNlV0FQSHlDUWRrV2I2elFLdXNSTEdNRmhHQ0NkSzdncjE0eXk1bUl4?=
 =?utf-8?B?cFNaclpJZWpIa1BieDJ6ZGhEcEdRWE5GQ0xXVFNQRUt4WVFlQ1EyMFdXbkVF?=
 =?utf-8?B?Y2dPMVZBU2dvUmV5MkNyMko5VjdCRDkzdlUvOGYrdVB4NEp6WXFkdlpPcUtM?=
 =?utf-8?B?Ukwrd2FmTGpHVStKQWdUc2F0V1VTeFBxUEJiclNHVDFaQUVhQkpWSzF3aTcz?=
 =?utf-8?B?MnlnN2FwRDhZekFtMVlyVVJ6U3RPdURlZEJ2cjkwdjc1Z1FkRy9HWURsenVP?=
 =?utf-8?B?UEF4Y2Jkem1vMXZEZkZMbHFNbEtla0t0SnFFWVVPZS82NE52YkFlWndVd2dp?=
 =?utf-8?B?SlNFNWdKa1RXNEw4aGZvQ0FvdkVCSERQU09ySU1ZcWJZczhhVDJLSzlydXIv?=
 =?utf-8?B?NTdta2ZDelVoaHpDUHNuSmpoYTlwRUxlUlBNMWphdFB2SnVMWWdSeEZzZHI0?=
 =?utf-8?B?SFhZVTZDYVpCbVhJNXZnZXZmVS9nVUlDYyt4NjFlUG55T2R0QXR0N2RRUURI?=
 =?utf-8?B?Y3VxRXAyZi9SMTEybzlmQkpacStETUhEdW9hd2dQMWRIdUl2Nkpzamd4RTlR?=
 =?utf-8?B?SXdUU3JuSlBIY0ZaS1ZNM1VhaFBKRGdId1kwMDBSc1B3V0xTZFBQQ0RPbVFl?=
 =?utf-8?B?Qy9nc0JoM0xiNC9sRlZoTHlnL2wrODFoT1pOOFNGeFpTWlNsdmdORHBPMGNp?=
 =?utf-8?B?TWIvQ1Q5KytDVUZGSGlmM25Vd0h2ZXp3YmFqZmpObFNsdVQwZzRJUEViU2hn?=
 =?utf-8?B?Y0FON0hHcFpHWDMzVFh3a2RwaE4xUkhMYlVMeU1TSHhCMlpGV2dlU2N2dUtl?=
 =?utf-8?B?OTgzb3JnV3pxZWNwQ0FMMmRuNUpoR3laRTVoVWs4ZC81eTIyTGtNNEVleFpV?=
 =?utf-8?B?UTk3OW1zRVdXY2ZWTitRSXJmTW1XL0ZJWVMwNEZQa2tXd3hYOVdUemZCeGMw?=
 =?utf-8?B?cmM4eFU3a0ZHbXBrMXNVKzJyMFZQZVhzR3ZsUFluT2pjczJjSDBNZjV6Zzlv?=
 =?utf-8?B?b25JV2d4Tk43SldmZDBsWENQSTZna1c3MFNqRzQ2RFlnWXp4aHc1VzBidWx3?=
 =?utf-8?B?LzhRNXk5ZkwwQ1BXL0FvL0ZYZlRwcTZZVXI4NVBwQmhlOVVkWW53WEU5cHNy?=
 =?utf-8?B?WDRqVWVqT0dwT3RYY0w2dm1nT0JLTFA5Q1Iwd0tXNlhzSEQzdHFmQ0pCZ0dt?=
 =?utf-8?B?cWM5QW5vcXVUa2pRN3dIK1lkZzFhTDVuMVVZWmR0N1A1di9pNnhCL2xDam1s?=
 =?utf-8?B?ZnRJK0RzOXVnUEYrR0pVL1ZEa3V3K2g3RlppL0JKUkpIKzhpNmcxeHFNNUVM?=
 =?utf-8?Q?Njtg8AHUvBd7Qw+MSv+6edLMsKVD5vlzi6DRKP/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d58c6e-ece4-4763-3e36-08d92b34d231
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 10:53:31.6021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pTE8WlcVAHSarO+YwcyjisEr0lk70AQYXwBE8bHZvAhC8T66gRWJxft/GJkD2GgH25f7c7LsMvFzORdir81f+muZfh6M0uATE2aVIT0TTE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4247
X-OriginatorOrg: citrix.com

On 09/06/2021 10:27, Jan Beulich wrote:
> It appears unhelpful to me for flush_command_buffer() to block all
> progress elsewhere for the given IOMMU by holding its lock while
> waiting for command completion. Unless the lock is already held,
> acquire it in send_iommu_command(). Release it in all cases in
> flush_command_buffer(), before actually starting the wait loop.
>
> Some of the involved functions did/do get called with the lock already
> held: For amd_iommu_flush_intremap() we can simply move the locking
> inside. For amd_iommu_flush_device() and amd_iommu_flush_all_caches()
> the lock now gets dropped in the course of the function's operation.
>
> Where touching function headers anyway, also adjust types used to be
> better in line with our coding style and, where applicable, the
> functions' callers.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Paul Durrant <paul@xen.org>

Honestly, I'm -2 to this.=C2=A0 It is horrible obfuscation of the logic.

I agree with the premise of not holding the lock when we don't need to,
but moving the lock/unlocks into different functions makes it impossible
to follow.=C2=A0 (Also, the static analysers are going to scream at this
patch, and rightfully so IMO.)

send_iommu_command() is static, as is flush_command_buffer(), so there
is no need to split the locking like this AFAICT.

Instead, each amd_iommu_flush_* external accessor knows exactly what it
is doing, and whether a wait descriptor is wanted.=C2=A0
flush_command_buffer() wants merging into send_iommu_command() as a
"bool wait" parameter, at which point the locking and unlocking moves
entirely into send_iommu_command() with no pointer games.

~Andrew


