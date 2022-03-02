Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14ECD4CA96F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 16:47:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282385.481079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPRC8-0001SQ-4G; Wed, 02 Mar 2022 15:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282385.481079; Wed, 02 Mar 2022 15:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPRC8-0001Qa-12; Wed, 02 Mar 2022 15:47:16 +0000
Received: by outflank-mailman (input) for mailman id 282385;
 Wed, 02 Mar 2022 15:47:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LB9Y=TN=citrix.com=prvs=0530a50c4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nPRC6-0001QU-Dz
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 15:47:14 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0615fc1c-9a40-11ec-8eba-a37418f5ba1a;
 Wed, 02 Mar 2022 16:47:12 +0100 (CET)
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
X-Inumbo-ID: 0615fc1c-9a40-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646236033;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=eWoL7UDnr+ihWShPPBPohlYN5Bdv4KC6XwMw/0KfhW4=;
  b=OTbRdJNRordlgdoQRdNrt3uMey6RdsZAdb7tv5JpN1jAbRT5pxv29RzL
   U2A+JldKtV9Qugpxk3foqTKrEl5ET3nS+0XQHs0OfmVf+ypCNOhSFIkux
   r1oSQ7zVAI+UdXbO1/yfiB3tgSKOaXPvL0C8Y3i8pmO9b8bchJtuapw+I
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67627776
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4fp476vUfLCwsjqhOvP3UxnaPOfnVKJeMUV32f8akzHdYApBsoF/q
 tZmKWCDP66NZmL0L9x2aN628U1VupDRzIBnGgNtpXw0EiwT+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jV4
 4upyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8FHrbov88PVyVFGntwfpIX1o3KIV2W5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 JRDNmUwMnwsZTVOJ2VOOYw7g9zyqVj+Kw9ktE6xnoUetj27IAtZj+G2bYu9lsaxbc9YhFqCr
 2TKuWHwGAgHNce3wCCAtHmrg4fnoyT/X44DEayiwdRjilaT2287BQUfUB2wpvzRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4DOkS+AyLjK3O7G6xBGIJUzpAY9wOr9ItSHoh0
 Vrht9H0AT1itpWFRHTb8a2bxRupIjQcJ2IGYS4CTCMG7sPlrYV1iQjAJuuPC4bs0IezQ2uph
 WnX8m5u3N3/kPLnyY2X3UvjpBm+oqTUR1Q7pTqGcFCo7iZQMdvNi5OT1XDX6vNJLYC8R1aHv
 WQZl8X20N3iHa1hhwTWHrxTQejBC+KtdWSF3AUxR8VJGyGFpib7Fb289g2SM6uA3iwsXTbyK
 HHetgpKjHO4FCv7NPQnC25d5ilD8EQBKTgHfq2MBjatSsIoHONiwM2ITRTKt4wKuBJx+ZzTw
 b/BLa6R4Y8yUMyLNgaeSeYHyqMMzSsj327VTp2T5035jeTHOibNGOlcYQHmggUFAEWs+l+9H
 zF3bZbi9vmieLemPnm/HXA7dzjm0kTX9bip8pcKJ4Zv0yJtGX07Cu+5/F/SU9cNokihrc+Rp
 ivVchYBkDLX3CSbQS3XOiELQO6+Bv5X8CNkVRHAyH71ghDPl670t/xBH3b2FJF6nNFeIQlcF
 KFUK53dWa0UElwqOV01NPHAkWCrTzzy7SqmNCu5ejkvOZlmQg3C4Nj/eQXzsiIJC0KKWQEW+
 dVMCiuzrUI/ejlf
IronPort-HdrOrdr: A9a23:MHZ7TavR6tTR/bbOMn3acnrp7skCmoMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtVD4b7LfCZHZKTBkXCF+r8bqbHtmsDY5ts2jU0dNT2CA5sQkDuRYTzrdHGeKjM2YabQQ/
 Gnl7Z6TnebCD0qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPwf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0amSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7tvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WjAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 RT5fnnlbhrmG6hHjHkVjEF+q3tYp1zJGbNfqE6gL3b79AM90oJjHfxx6Qk7wI9HdwGOtt5Dt
 //Q9RVfYF1P74rhJ1GdZQ8qOuMexvwqEH3QRSvyWqOLtB0B5uKke+z3IkI
X-IronPort-AV: E=Sophos;i="5.90,149,1643691600"; 
   d="scan'208";a="67627776"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mF9FOsK0xUCvHfsMQVgfsaPZso9/WzbZRHGTB+Ta58SKhtg28NRQ6ZY9fFa0n9btDZ1DN3AO/KYnFUO4zMQ/TpbYSOe14vzuIzR9it9ElAhUWrIL19ki8xJjX3/aBHOW4z2z/8LuEYBfg/uD01OwWjHWz/ZTlAc0/9kf/PgiqkhQPZh7s/nkK7kQWNn2rTvAjJoUpjVrMRJx49E5xElM19rPm1QGJYsRDB4AfJr1zfSWW0JZIiXwukXEjbOv4LWYd+BEXNTJRjSMo9s1PqzIlgO7xFzfqszud/Spo4/dmx33LfOB7eD0fwiAEMKbvMxVVCemhxq5XvJdTjM89cr8hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXEjprna9Jcvu5WW2tEEXwGRoTegWZp6yiwvPEdU6Uw=;
 b=AjTn6PXVxRylaOObRJ73zk64z/mqjYSXgYkQWTd/BIoFBUcSfY44RSSB0HyqEANeJUcE2sz7g2iT270fwACuvsM6laxBA3IE7Gg52exlPLTe56KWDpkclgAnsgfoqSzWNCrqWpWZG7XSDqVPiTR6yswDj8goOw8VBCJnRmh2PQf8KPht6B+SUc0SkasPtj4pb4EKRk6L1V/cHnMcKp5t3kWXtbJTMqZVZ9pJYSz8QJ3VZaacjZYaw4M2qu1CUxfJtZTqLoTnsGyoVIVedvJuyJ7D3Urhi1JleHWZNGZHiYJDen30hYLVsCwfMnbhc0LF61uVF1TAtiRe9+0Atv6Qsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXEjprna9Jcvu5WW2tEEXwGRoTegWZp6yiwvPEdU6Uw=;
 b=SmgHrNdp6aECngpBf0wvcGfrDoL3kC8i4jTkr6lltZWnod83vBtkzAZ3JhCM70ktN7BC75tB4ZOsAkaufECWkeEJ7yQj8GD+mD/EPEGo0G3/PAydXJcatf0YA1ynRDOKhUTlVmWJr+r/oUN5UVjD5uNRS6kp0vYESWaYqsoKQkU=
Date: Wed, 2 Mar 2022 16:46:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] livepatch: set -f{function,data}-sections compiler option
Message-ID: <Yh+RcFLjrtLk/ixx@Air-de-Roger>
References: <20220302134425.38465-1-roger.pau@citrix.com>
 <f67e599d-4dfc-c98e-75ee-8510237cd527@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f67e599d-4dfc-c98e-75ee-8510237cd527@suse.com>
X-ClientProxiedBy: LO4P265CA0073.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aaaafc78-43fd-422b-b748-08d9fc63e4b8
X-MS-TrafficTypeDiagnostic: SN6PR03MB4032:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB40323E91C90E668B6B69C1BA8F039@SN6PR03MB4032.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2vJa8OynzevG/AMoJx9f8PbTrsjiy77X07V7n7wt3nXQL3IlgXq7Fg/883K/Q5WPKinqFoICVXfzhMWKxoF0Pu7WZObedvZ+FoJeOo3F9BSH941I3c5MQJd3wBrbtwrIfTw6TYQ6bM4fQdx3TTBnPUThsQAqkuhWBEakbJj72v27XYi3mXN/NrGMOGK/yI+gT+AgQonT30X97PDF+t51EOyQChi/JzJL5iWIrZitYKysSnKKugrEOxBKmIABNVSsaWvyiJ/Kx9qBeeZVGJoGCg6cIEPljJCh4KWRjECB2ZdmfVhC4MMDkM8YrYkDtY0YWx/fB4dehMTXGzXtnon8sGdfoXUE6iijggmwfYENWbYE0/nKZBWAM6LwVT8/aZ9fyT7Qt4KYy+7Uw4CJN8dkqXa6eHegPHXMiszINf7r+C76WPxdgmizF51YsKKjB2tpktcJYOOI9Cmu3oIGhbyihh5gGhbWxN0V4nDzkjCxMRlfT2DUbn2XwC5cEMkApN0wFoPcCfFtJPH4xf7rV2vg77PfhlmtdES0k/dWe2No/tjJILIENZrjkZ+vdhhLzOEYKQj8ZgkUhSuBjEhPwQZQgbJSSL5lhms5wfs6QBeI0rkIqLo6TguwNvAVNTh6NysLgVcwtBzpbwWNdjJAcS1UDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(8676002)(66476007)(5660300002)(2906002)(66946007)(66556008)(8936002)(26005)(186003)(85182001)(83380400001)(6486002)(508600001)(6916009)(54906003)(6512007)(9686003)(82960400001)(33716001)(53546011)(38100700002)(4326008)(86362001)(6666004)(316002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnE0SHJZc1NxWjhLRXowT3NEdzVOZ1k0bmZ6TmwrYVZJUjhxeDB6S0h4Rm5i?=
 =?utf-8?B?anZCWWxEKzNyLzFwYWgvZ0MzaUwyallwN21vcFBFSy91ZEx4TVBsSm9CWlhw?=
 =?utf-8?B?dEZXa2MvSWVaUHV3Q04xaE1MeitmTW5ZWE1DR3RtaGVsS2Z1dlB0aEZKQ1kz?=
 =?utf-8?B?ZDdEQnpkaUxVUFh6VHBoT0dPdUhrdmZqUndjcHloNnhzMndNSXhzRWdzWkQ5?=
 =?utf-8?B?K3ZPWjZLdVpENFROeUY3L3A5emxpMHBTQVJ2c2pNeGZ2VGtKLzJvTi9qOExD?=
 =?utf-8?B?THhUREZWckUrc1huRDJvQU9ZK2xyUUJqdHAwK2VxaVdocjVOU3VSRngrSnlR?=
 =?utf-8?B?M3FXVWI4SjFPNXFRN3R0ZkE4eStrdWxWL0NDNUMycE8wZDc4a0RkUU1pS1Vl?=
 =?utf-8?B?czRPK24rcFhLY2pwVVFxSU0zRGgxR3dZMHU1TkdQcHJsVisrR0ttSE1EYjJz?=
 =?utf-8?B?TFhCeEJZaENHTy93ZzIwNlhWeFMrNmpEY1JsNS8yUVg0VnpDVmhjTXhaOGIx?=
 =?utf-8?B?VHhSSEduMzA2NTdBMm5CYmpoT1hNbjVQdnMyc0t4d1lEeGRmK1ltaWdob2VS?=
 =?utf-8?B?WTVDTXpZZTdIMGRyNTVETFgvWnJJQWRONE9LaUlUdFRsYUtQbXpuREVGa2F2?=
 =?utf-8?B?RWlxejlKR2FOdTREYkdHc0d2cENzOENIOE5uZFFpdEFWQlZ3WjN0U0EwRlZt?=
 =?utf-8?B?OUlYZitMNDZCdWNSR1JET1lEaTFGb1A4cDR5ZzdxV1IrZzg2UTYzQlM4Q1Mx?=
 =?utf-8?B?ZmlFektocU8wRFVmQlpsZXNOVkVLT21ZUWZldmMxcHRUZml5RTdWUUVEYTN5?=
 =?utf-8?B?cEtPOENpNCtMOVd0bEgwZDBMTWhKK3g1dHVSSE5zWXdXTFpsS3hONVRreG0y?=
 =?utf-8?B?NjVCTE14RkU1MmJHd0x6NDdHeHRUMUFQeTJLMlpacmdrSmxvSUt1YVlwSzNK?=
 =?utf-8?B?RzZuU25JRFRycjdCS2J2QWd0M21RaTBTV2k1WG5PcU9GUmpKd0RQclpoVXl6?=
 =?utf-8?B?S3BrTWNROERrWE1TYnN2RCtlMkRaODQyUXlLY2FUR2RYQUJEU2pyT2RTUWc0?=
 =?utf-8?B?R1FGaENQblN1Z0JjOVFaa2FHYjZnUXJHTGdpVjFKR0k3YitRem8vOXdrcVA4?=
 =?utf-8?B?NEI0WDNRVXVtcGE5TXlZRzl0SHBEQ21adDJUM2pVdTJXeDJwMHY4R1Z0WEtX?=
 =?utf-8?B?LzJPTFZYZUlpNWphcUkrVmRHYkVkZnMxc2daTVd3NmMyMndxNXRoWENRVmJ6?=
 =?utf-8?B?R2dNSFdqOWFvd1lOWGcvLzVYRGZXSVQrTHZSdkpwLzJ4QkNYUEs0Yzc5Q3V3?=
 =?utf-8?B?czdFNGVmV1JPaHdSd1BNQnlZRTRkaVZ1RFVDYS8yekwwbVdReUtYSWs3ZnNR?=
 =?utf-8?B?ZXFzU0pXR2dhSGhHRHRKbHFPVUd1QlQ4cm4rYnV0eVZRdWM2TG81a1dTSDM0?=
 =?utf-8?B?aURjTzBKTEpLQ08vd2N5ZGJlakxhQjAzOUxVQWtINGo1SDdHWlRpRDVyWXdT?=
 =?utf-8?B?QU5UR3NNU1VZbVY1Wklzc2I5SEx4S3I5dUt6QU1WSE9HaDFiRWJMN204MlJn?=
 =?utf-8?B?VzFoeWlnLzhPTFN1UVg3Q1Bmb1p1QmhDdmlpbjl4cy9aNFJzTmpUNVZpVzhF?=
 =?utf-8?B?cndJQlBrVmpad1ZFdEtVbHdQRXVPKy95V0xZeU5WSmx6UkJWdkVTeHJpV1dT?=
 =?utf-8?B?TGFvVmlVU0hkRnZUZndVQTBiTkM5RlBYRlBwWGRyUzBJZzdhS3NVUU9iVG4y?=
 =?utf-8?B?NmJoQUQ3ODFDMmw0Tkxrek5PSVVBNkJSOUdWdTJGU1JIK1dZQ1pBZnMxa2tt?=
 =?utf-8?B?cjQrMzFuWitObHBXbHlSZVNNaml1bmc3R28xZEpqSVU1enBVa3VOUzRGUW9D?=
 =?utf-8?B?bHdzMjFqc2NyOWhRb3JObnljNFRZWTJ3Q0crNjczV1ZjWUlrRExFUGg1dmgx?=
 =?utf-8?B?Q2tDRGhOcHM3QjRoa201YkgxbDl0OXZYMFJvNU5QVXdORE5BcUlnQ2ZjbGVO?=
 =?utf-8?B?Rnl3bjJoUG54Q2ppakh2WTdxc3Q5OGs0OUlGQkJsZ2RGcTNYRTZMZHpPY29D?=
 =?utf-8?B?Rlhqd1JHaGV6aUFkbHBHUG11VVdBVzZwUmZua1dHVzFQZk1LUFlObWp3N3dw?=
 =?utf-8?B?WTlKeXNWYjJ2aGZmd0hjeHBjYU44YlVadjlBaU90eDJuWCt3UmZtcnA1TFdM?=
 =?utf-8?Q?8Qr9cVz1T5rYWRs87ip/DsE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aaaafc78-43fd-422b-b748-08d9fc63e4b8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 15:47:02.0158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gdDqZvfxT1jZBKV4kSNl2E0/ZO4Qseb3ooAEAcXsGRORoVGlv/Uia6Ard8RMOIWhWLt/wX9Vl4GjyDzDeV0rUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4032
X-OriginatorOrg: citrix.com

On Wed, Mar 02, 2022 at 03:41:21PM +0100, Jan Beulich wrote:
> On 02.03.2022 14:44, Roger Pau Monne wrote:
> > If livepatching support is enabled build the hypervisor with
> > -f{function,data}-sections compiler options, which is required by the
> > livepatching tools to detect changes and create livepatches.
> > 
> > This shouldn't result in any functional change on the hypervisor
> > binary image, but does however require some changes in the linker
> > script in order to handle that each function and data item will now be
> > placed into its own section in object files. As a result add catch-all
> > for .text, .data and .bss in order to merge each individual item
> > section into the final image.
> > 
> > The main difference will be that .text.startup will end up being part
> > of .text rather than .init, and thus won't be freed. Such section only
> > seems to appear when using -Os, which not the default for debug or
> > production binaries.
> 
> That's too optimistic a statement imo. I've observed it appear with -Os,
> but looking at gcc's gcc/varasm.c:default_function_section() there's
> ample room for this appearing for other reasons. Also you don't mention
> .text.exit, which will no longer be discarded.
> 
> > --- a/xen/Makefile
> > +++ b/xen/Makefile
> > @@ -269,6 +269,10 @@ else
> >  CFLAGS += -fomit-frame-pointer
> >  endif
> >  
> > +ifeq ($(CONFIG_LIVEPATCH),y)
> > +CFLAGS += -ffunction-sections -fdata-sections
> > +endif
> 
> Perhaps
> 
> CFLAGS-$(CONFIG_LIVEPATCH) += -ffunction-sections -fdata-sections
> 
> ?

Sure.

> > --- a/xen/arch/x86/xen.lds.S
> > +++ b/xen/arch/x86/xen.lds.S
> > @@ -88,6 +88,9 @@ SECTIONS
> >  
> >         *(.text.cold)
> >         *(.text.unlikely)
> > +#ifdef CONFIG_LIVEPATCH
> > +       *(.text.*)
> > +#endif
> 
> This coming after the "cold" and "unlikely" special sections and
> ahead of .fixup isn't very nice. Also from looking at the linker
> scripts ld supplies I'm getting the impression that there could/
> would then also be e.g. .text.cold.* and .text.unlikely.* which
> you'd want to separate.
> 
> We may want to put the entry point in a special .text.head, put
> that first, and then follow ld in putting cold/unlikely stuff ahead
> of main .text.

I can give that a try.

> For the reason given in the description I can see why a conditional
> is warranted here. But ...
> 
> > @@ -292,6 +295,9 @@ SECTIONS
> >         *(.data)
> >         *(.data.rel)
> >         *(.data.rel.*)
> > +#ifdef CONFIG_LIVEPATCH
> > +       *(.data.*)
> > +#endif
> >         CONSTRUCTORS
> >    } PHDR(text)
> >  
> > @@ -308,6 +314,9 @@ SECTIONS
> >         . = ALIGN(SMP_CACHE_BYTES);
> >         __per_cpu_data_end = .;
> >         *(.bss)
> > +#ifdef CONFIG_LIVEPATCH
> > +       *(.bss.*)
> > +#endif
> 
> ... are these two really in need of being conditional?

Will drop if you agree. I didn't want to risk introducing unwanted
changes in the !CONFIG_LIVEPATCH case.

> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -353,7 +353,9 @@ config CRYPTO
> >  config LIVEPATCH
> >  	bool "Live patching support"
> >  	default X86
> > -	depends on "$(XEN_HAS_BUILD_ID)" = "y"
> > +	depends on "$(XEN_HAS_BUILD_ID)" = "y" && \
> > +	           $(cc-option,-ffunction-sections) && \
> > +	           $(cc-option,-fdata-sections)
> 
> Is this for certain Clang versions? Gcc has been supporting this in
> 4.1.x already (didn't check when it was introduced).

I've checked clang and it seems to be prevent in at least Clang 5,
which is likely enough?

I've added the check just to be on the safe side.

Thanks, Roger.

