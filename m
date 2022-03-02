Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1974CA818
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 15:29:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282300.480969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPPyv-0002Yk-K3; Wed, 02 Mar 2022 14:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282300.480969; Wed, 02 Mar 2022 14:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPPyv-0002VG-Gk; Wed, 02 Mar 2022 14:29:33 +0000
Received: by outflank-mailman (input) for mailman id 282300;
 Wed, 02 Mar 2022 14:29:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LB9Y=TN=citrix.com=prvs=0530a50c4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nPPyu-0000Xm-Aw
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 14:29:32 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b7d3436-9a35-11ec-8539-5f4723681683;
 Wed, 02 Mar 2022 15:29:31 +0100 (CET)
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
X-Inumbo-ID: 2b7d3436-9a35-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646231371;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=F212JEjE8ExwUhiwnl1J2kabdh8N5NeS+VZ3pk+r8zo=;
  b=bLlF2pyyxeLHpuqIPZWdGIi24F0wDHdE/8hfv+LwYQDgpYVgcP4SxSzL
   /eH+Qx4FJe8lAhr1uLlJcDK8n+mFRO/Khub5rO5OhbHxNWDQhRCrhn2g0
   7XAraAYhrbM+uJFij1kd1A669twZ+lU13i84pEjGqJYLi8swUy8QYdHT0
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65714265
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lj14xKvZPaFo725k3SNvI1tLtOfnVHxeMUV32f8akzHdYApBsoF/q
 tZmKWqEParbMGL0KNB3bti/pEoGuJ/Uz4A1Sgc4/y4zRCMU+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jV4
 4upyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8UJo7Cp8lFDyVfFjhTM4Rl5bzEHnaW5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 pVANWAxMXwsZTV3GWgnV7sdtdyti1PvKx9AqleR/ZIOtj27IAtZj+G2bYu9lsaxbclSk0yVo
 krP+m3rBRdcONH34TiY9nOhgMffkCW9X5gdfJWo+/gvjFCNy2g7DBwNSUD9sfS/klS5Wd9UN
 woT4CVGhas18laiQp/iXhm7iHmetxUYVpxbFOhS1e2W4vOKuUDDXDFCF2MfLox93CMredA0/
 mKRvN3WKGQzjLqQUF+T35SJrjCNNwFAeAfuehQ4ZQcC5tDipqQ6gRTOUstvHcaJszHlJd3j6
 2vU9XZj3t3/meZOjvzmpg6f31pAs7CUFlZd2+nBYo6yAuqVjqaBbpfg11XU5O0owG2xHgjY5
 yhsdyRzAYkz4XCxeM6lHb1l8FKBva/t3NjgbbhHRcNJG9OFoSPLQGyoyGsiTHqFy+5dEdMTX
 GfduBlK+LhYN2awYKl8buqZUpp2k/G+TYy0CKmFNLKih6SdkifdpkmCgmbKggjQfLUEy/lja
 f93j+72ZZrlNUiX5GXvHLpMuVPa7is/2XnSVfjGI+ePitKjiIquYe5dajOmN7lhhIvd+Vm92
 4sPZqOilkQEOMWjM3a/zGLmBQ1TRZTNLcut8JI/my/qClcOJVzN/NeKmeJxI9E+xv8N/goKl
 1nkMnJlJJPErSSvAS2Ba2x5aaOpWpB6rHkhOjcrM0ru0H8mCbtDJo9GLPPboZFPGDRf8MNJ
IronPort-HdrOrdr: A9a23:mFplOaFAi9Ew1VsBpLqFDJHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HmBEDmewKiyXcV2/hsAV7GZmjbUQSTXfhfBOfZsljd8mjFh5RgPM
 RbAthD4b/LfCBHZK/BiWHSebtQo6jkzEnrv5ai854Ed3AaV0gK1XYeNu/0KDwTeOEQbqBJaq
 Z0q/A37AaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uHg9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9gwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgnf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQy/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKp7zPKN
 MeTP002cwmMm9zNxvizytSKZ2XLzgO9y69Mwk/Upf/6UkSoJh7p3Fos/D30E1wsK7VcKM0ld
 gsAp4Y542mcfVmGJ6VfN1xOvdfKla9CC4kY1jiaWgOKsk8SgbwQtjMkfII2N0=
X-IronPort-AV: E=Sophos;i="5.90,149,1643691600"; 
   d="scan'208";a="65714265"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRW+ahLuRH0wQAbwrnfdTFFqYrpkmDWxASA2uB825eLaCdboj3tQsJmd0QoxdVUCaIX3xK19RcvTdETXJJFDR1et7+tUiBs28sV0FIijI3oWRkkHSmDIsnkUtUwiK/VKQYDvxAIS/jYTLmPeTR5SyKewh8t3qjrtFwYmdrJ1aq0JCv5yO2nQkF8BW1LZHCTOJatHYXvoHv+sXesoyamWY8ZPyR6Tt2Bj8Wh8F3dCBr4fV+/QiKCbwKE8Dz1SZreuhwBJAh1QPGF2iwgTUNkjGf5OKU5AG1eufnWXjRCYJe5g10DTr2LSeI5gdgPZdeSt9RXzsUlUUKkL9sUjNUDmUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ju2JmzDTMXMnNqshHl/210cGfKHE694TMbi1tFP55XY=;
 b=NyB64aYXGKLnKkx+C2kzmiRtLDNJ4ii1w9rKRK5mQchD2wEVoZ6WhaMtBPumvbE5fh0aR8gOPwilNjT70qvvict84fhPm3Lkgcalqd4ZM4SfrLqVTMoodcPUZaIwrmSNSGsQqM9yxpPiEjbBZqrRq/p3wVAcRNS3xaPiHLahKVArB9GBWlZlEwM6WcjahNYCa+qpWeZ7xHth6VrftRAuuaWpJQTVHs5Tcp6O/7JvFbmOjfyHLNxcP6PnMpuZyUX7zCRtWIBn9T1qR0T0ZwW/Zceva7n5rh5XHGcxPXmIbrh4ofZHb0mMCQSObxQBBHpP+tOR8iNn0CNTv2boqxeaVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ju2JmzDTMXMnNqshHl/210cGfKHE694TMbi1tFP55XY=;
 b=QNc2Q0GbP7TEKhy4HBRVKhpZYkQy/0SeXUgFcDwbE5C4mt73DxyIqKrCzcdB4EniEnoYpsgNa3bbZvYxv667L/aTmw3TiHLWyhjfSlAo2PJoLiKQEEeqOuvgXHZbB83PlIq2kGI9HYH6UKp7a10j9dkanVb5E4fLMKjMn59wswo=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <ross.lagerwall@citrix.com>, <konrad.wilk@oracle.com>, <doebel@amazon.de>,
	<julien@xen.org>, <Andrew.Cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: [PATCH 4/4] livepatch: differentiate between old and new build systems
Date: Wed,  2 Mar 2022 15:27:11 +0100
Message-ID: <20220302142711.38953-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302142711.38953-1-roger.pau@citrix.com>
References: <20220302142711.38953-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0086.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ca53acc-a8a0-4fc0-4ac5-08d9fc590189
X-MS-TrafficTypeDiagnostic: BY5PR03MB5111:EE_
X-Microsoft-Antispam-PRVS: <BY5PR03MB5111343C3129ACCA0B47ADB28F039@BY5PR03MB5111.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PBi1/X1DU4N/wu046ziwigGuxdf4LUwvJr4s8SyJR5wxuzreL7c16TTH0Bww3qJxGks/9tCFNui8Psiu2Z287Pgbbeu/g2UykZ8SMG65Q7dpxjm6MxblnGh2/LnbITVvax8M06wu9zJdr7SSYaRuyYbPx8aRHeH+71yeVISOdt8/bjTkganefUA4HQGb9eLUJeIwnTPcTddJq7dvIuADupfa4j37ZziQtyb3BhuKA0APD5x0+oUGflDEPu0BlU7I78irxEDs/NlIHOVjX8iNnprHtTFV9Ivx3OUk9RvJOdHSg/CQwZlf5FqC9KKIjJ4CZ6x4cUqbwSxaB8WZw/IEXtdUR7n4duFUhLxNvQpoQ8nuPY2QW3erNghk3Jz8SMmBkySGlQITX2eqMUFt/Y/4dPPfoC1XvZ9l+iLTLyACi6dJQWti76wqRow6sBJODD1OCkCr/txZ96kOmcrl/jfmDhXo/5QJvRhEcsdqyW8uUAcSf/MRJ/LLRtRfRH6GS7/zMNUiSwJc+nOQR7jdMzbKbPWViyITkBuH4brIUgAkX513bFJAmjpZwkRfjlwHV/LiR/fsKvhbNx9hk3Wig6JvnbIHhLi/afjRnoaT4CiXe3yq1W4Z2Ka4PfzvG+zNdPMZWlGVDt0maLL3q5nkV1v/xQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(2906002)(6512007)(6506007)(82960400001)(83380400001)(186003)(2616005)(26005)(107886003)(6486002)(1076003)(36756003)(508600001)(4326008)(6916009)(316002)(86362001)(8936002)(8676002)(66476007)(66946007)(66556008)(6666004)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVN0RE8xRndyWFpuQkhNUXA4V3FwcVFxTFh4cm9xVHZaa2Q2WWVhSm1HQ3ll?=
 =?utf-8?B?aUJ2UnV3blBjVk9hM2JNbEF0QXpibkl6OURjcGtzNG9adUtEbXRmcFh5MytD?=
 =?utf-8?B?bEo5bmpIZW0ybEpFajJPeUFoVFBKVE9HbDJXdUtvODlIbFg1RXluRVpYcnVN?=
 =?utf-8?B?UmZGTWVwQ1N2VGcyNkltMXhEaUJPV2VsTnRVck1NTFprTXhYU0oyY0ZML2tm?=
 =?utf-8?B?UjFVZUZwL1dKNUdPNVpMS0g1YmlpVVUxNytudk1LL2cxYkFvZEZUbmd3dmJO?=
 =?utf-8?B?TURFQmpma3VTSUx6di9IZWpVWjNwamQvZU9RMmgweGZlTERtc005UHJNZ2V1?=
 =?utf-8?B?MEV2NUlwRVZ6dmQ4VkdIdkNVRFNmdWtleEE4c0oyVitSa3M0Rk54OGFKK3Zn?=
 =?utf-8?B?ZUR6VGJKZTJ5OXBtOWkweC9sT2FoQWtuVG04RTZkVEFFbHhuWTRoQUZ5MG56?=
 =?utf-8?B?QTg1dDg3K3ZRcUZ1Z3hwMGVjZkZFOUZaaDQ1enlmblU2ZFdFMzZaVGhYRUR5?=
 =?utf-8?B?djZmdTk5OVM3NWhsdmk5U2hkcjVZSmhJS2ZTSmw4cVA5ZDJuRXJZUFlvTzJa?=
 =?utf-8?B?UU9TUzdoVE5LT25Dc1VlcTlDZGNwTWhaWllTYlIwZWxKcnNPekNReFgvQWM2?=
 =?utf-8?B?SlJ5cGFtKy9rZnFZVytXTWt0dTdpOHJNNDl0OUtHbjJtcW5jWnROcnIwcmJi?=
 =?utf-8?B?ditqcHNwaHlZUVZvVmxtSUgvdUl6RTNLUkthSFptYkE1aVdBUGU2cDlIaE1G?=
 =?utf-8?B?M2ZxT0hVcU1SZkw3ZGdpSmJvZnhXOTZGUW9zbEJhTmtKdjNGbFpoWllSYzd6?=
 =?utf-8?B?MlVIRStmWjh0Nm5XVkVnWVNaSnZ1d21pU3U2VFBweEdVM0VscFpRYXhuVE9v?=
 =?utf-8?B?T0VFclBvdmFXZXlJYjQvT2Z6dnBxNFEvUjJsTlBzUXovK3E2WVRaRDQ0VnM0?=
 =?utf-8?B?QnpPdUlBUm1Nb1lqQnJMbmQ5SEJiTmVnYTMxakZUS29kcnhqYU4yazhCMU53?=
 =?utf-8?B?SFFtSm9UZS84VkpaczhxdjJuTVBoU2FQaXRHdGdXZ2RkQ2ZGeE1vT0NwcXRi?=
 =?utf-8?B?a2VqSndKaG9MSmZvRDZ4ei92Qk5RVlpFZ2VybEZwNTBmSUU2L2dMa1JENXRY?=
 =?utf-8?B?YzNUMEFjVDRhTEVZS2NYT2poTmRQbXRMN2V0UGZQU29XQUg2U21BdTFYcGw4?=
 =?utf-8?B?ZG5nUVcvMkdRaEF3M2RBRWpIcE9sUjJZc1R1YjBiV2pEYWxUMVg0SmdndzVy?=
 =?utf-8?B?VjU2cFZudnhpRXJpTmFneG5VdHNvTndudmEwZEU5bDkrWG5Wc0tlUXdNUHY1?=
 =?utf-8?B?M1dwcGFEVHZvcnhGV1B0UkdteUdwc3lyMisxcnQ4Wkx6cU0yTWhLQitPc3NB?=
 =?utf-8?B?eXMyRVJvRWNCK0dFNjIvMlR5d0dRSFQzSEs0Qy9nWUp0V3BLcEFwbnQ4YURG?=
 =?utf-8?B?bWRVcGRpMXRHblRzTGhtYnYwQWgzaFhUU3p1R1A3eFJlaW0zMVQ2ejhrOC9D?=
 =?utf-8?B?Ny81aHRMSFRGc3ZaZFRBMEgrWXh5T1ZYdXo1Yy93cWgrTGI0Y0tuZmt2MW1y?=
 =?utf-8?B?cGVwL2R4TDlpR2xzYkg2KzdNN3podG16VUMvLzNLdlI1MmlZeTEyZnJLOFhL?=
 =?utf-8?B?QjJicHU1UEY2WGcxL29CbkVncytkTE9TYmpZWTFPQ3lTMC9VNkFUMXV3Z2ts?=
 =?utf-8?B?SC9DTUNrS0IwWFBzbFh3d1VlSGVnck5BMUN5dm42SUVOYkliUlpiTjJKZHRW?=
 =?utf-8?B?bTBWRUpDb2Q1NU0vL0M3OFRnbHczeXhKU3RMY1E4QUJJNmNFSHJEQm5OM0ZU?=
 =?utf-8?B?bnZMcjVnYWRJb2xuZ20zUUJoVHlucVJOU2ZMb3cyanhNOHd5YktObzRYMXlX?=
 =?utf-8?B?a0F0VzM3UWIrL0NlTmoyVVozbWw2RDZkcE5Xc3VuU2pUMmVKb2xJNGdIU09I?=
 =?utf-8?B?YWRIQWN3dHdHVkVQa3hiZUI2Wnl2VEJ1ZWpYOG02RmIxZmh6R0svQkRSU2RO?=
 =?utf-8?B?MldBaUlOQXRham9UOTRISXFSeHVrVTBQdXgxWXJSbng0eUhyQkt6MzZRaHJq?=
 =?utf-8?B?YlVFMjNseitndXhLUktNdFNXZVRQcWE4TnpiQ3RJcDZxaE5jOXgrK29USGts?=
 =?utf-8?B?QTdjQUd3eW9KNzd5cGxQWm1tZFp6WEcveFo4SEVLY1RwOTM1OHNaZVZLNDEr?=
 =?utf-8?Q?+Rvq3IVCIylmN2BvQEWKOBc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca53acc-a8a0-4fc0-4ac5-08d9fc590189
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 14:29:07.0533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LjS7dSGqpEwBJn5id195MVJBByNLwPl0f7nY7yYVWw/v3RytnRUYeFkwdgcs2iox0+xhgM1wiPyjdVgocipsfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5111
X-OriginatorOrg: citrix.com

Do not attempt to modify the build system if CFLAGS are not set in
Rules.mk, and instead rely on CONFIG_LIVEPATCH already setting
-f{function,data}-sections.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
This depends on getting the patch to add -f{function,data}-sections
when using CONFIG_LIVEPATCH accepted.
---
 livepatch-build | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/livepatch-build b/livepatch-build
index 38a92be..656cdac 100755
--- a/livepatch-build
+++ b/livepatch-build
@@ -98,14 +98,20 @@ function build_special()
 
     # Build with special GCC flags
     cd "${SRCDIR}/xen" || die
-    sed -i 's/CFLAGS += -nostdinc/CFLAGS += -nostdinc -ffunction-sections -fdata-sections/' Rules.mk
-    cp -p arch/x86/Makefile arch/x86/Makefile.bak
-    sed -i 's/--section-alignment=0x200000/--section-alignment=0x1000/' arch/x86/Makefile
-    # Restore timestamps to prevent spurious rebuilding
-    touch --reference=arch/x86/Makefile.bak arch/x86/Makefile
-    make "-j$CPUS" $XEN_DEBUG &> "${OUTPUT}/build_${name}_compile.log" || die
-    sed -i 's/CFLAGS += -nostdinc -ffunction-sections -fdata-sections/CFLAGS += -nostdinc/' Rules.mk
-    mv -f arch/x86/Makefile.bak arch/x86/Makefile
+    if grep -q 'nostdinc' Rules.mk; then
+         # Support for old build system, attempt to set -f{function,data}-sections and rebuild
+        sed -i 's/CFLAGS += -nostdinc/CFLAGS += -nostdinc -ffunction-sections -fdata-sections/' Rules.mk
+        cp -p arch/x86/Makefile arch/x86/Makefile.bak
+        sed -i 's/--section-alignment=0x200000/--section-alignment=0x1000/' arch/x86/Makefile
+        # Restore timestamps to prevent spurious rebuilding
+        touch --reference=arch/x86/Makefile.bak arch/x86/Makefile
+        make "-j$CPUS" $XEN_DEBUG &> "${OUTPUT}/build_${name}_compile.log" || die
+        sed -i 's/CFLAGS += -nostdinc -ffunction-sections -fdata-sections/CFLAGS += -nostdinc/' Rules.mk
+        mv -f arch/x86/Makefile.bak arch/x86/Makefile
+    else
+        # -f{function,data}-sections set by CONFIG_LIVEPATCH
+        make "-j$CPUS" $XEN_DEBUG &> "${OUTPUT}/build_${name}_compile.log" || die
+    fi
 
     unset LIVEPATCH_BUILD_DIR
     unset LIVEPATCH_CAPTURE_DIR
-- 
2.34.1


