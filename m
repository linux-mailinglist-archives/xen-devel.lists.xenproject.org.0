Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5484D11DD
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 09:14:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286586.486152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRUyZ-0007ac-5J; Tue, 08 Mar 2022 08:13:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286586.486152; Tue, 08 Mar 2022 08:13:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRUyZ-0007Yl-19; Tue, 08 Mar 2022 08:13:47 +0000
Received: by outflank-mailman (input) for mailman id 286586;
 Tue, 08 Mar 2022 08:13:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWwI=TT=citrix.com=prvs=059ab6e88=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRUyX-0007Ye-CF
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 08:13:45 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa04d1b0-9eb7-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 09:13:43 +0100 (CET)
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
X-Inumbo-ID: aa04d1b0-9eb7-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646727223;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=J5+YHmJ4AyZl7vAJ36YJwHUbaaRquqGnq4TZPhZ+MwI=;
  b=DMUU0N8oMh4S3uc7GJ6kjB/h4WCtDrpqLS0wpy8L7YHQ8o5TzMAN+J3V
   hXDZpzUdzSaqLANQfVlxvZsleNjMoK4ULVchru9YyHmH+O9gxROikLddy
   z6kyzuTrrIDZSDKFsL9v0SQqct6d9tsH40B8unwrp8tDLjXMnu3ssR9cu
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65690194
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:q4sBOqs8pvv8O6UNnZFg8ffAL+fnVKJeMUV32f8akzHdYApBsoF/q
 tZmKWqAaKneNGv2eYt1Pti2pB4O6pfXyYJgTVNv+C9gESpG+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jV5
 oupyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8CHfT8peZeeSIHFg9iMu4c35/1HEmW5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 pRIMWM+MHwsZTVoMEs4VLIfnNymg3jOXXp08HOvprM4tj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKhsXLsCFwDyJtHelnPbSnDjTUZgXUra/85ZCvlqXwWACDQwMYnGyq/K5l02WVspWL
 gof/S9GhbMp6EWhQ935Xhu5iH2JpBgRX5xXCeJSwAOQzqvZ5S6JC25CSSROAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BW0IaDIATAAFy8L+u4x1hRXKJuuPC4bs0IezQ2uph
 WnX8m5u3N3/kPLnyY2Q3gn3vjDvjKOWSyAp6UaNeUKX0zJQMdvNi5OT1XDX6vNJLYC8R1aHv
 WQZl8X20N3iHa1hhwTWHrxTQejBC+KtdWSF3AUxR8VJGyGFpib7Fb289g2SM6uA3iwsXTbyK
 HHetgpKjHO4FCv7NPQnC25d5ilD8EQBKTgHfq2MBjatSsIoHONiwM2ITRTIt4wKuBJw+ZzTw
 b/BLa6R4Y8yUMyLNgaeSeYHyqMMzSsj327VTp2T5035jeTAOy7IEu5VbQDmggUFAEWs+l69H
 zF3bZfi9vmieLemPnm/HXA7dzjm0kTX9bip8pcKJ4Zv0yJtGX07Cu+5/F/SU9cNokihrc+Rp
 ivVchYBkDLX3CSbQS3XOiELQO6+Bv5X8CNkVRHAyH71ghDPl670t/xBH3b2FJF6nNFeIQlcE
 6FVK5/eU64UFlwqOV01NPHAkWCrTzzy7SqmNCu5ejkvOZlmQg3C4Nj/eQXzsiIJC0KKWQEW+
 tVMCiuzrUI/ejlf
IronPort-HdrOrdr: A9a23:GagXMq8mAdZxiCzh639uk+AJI+orL9Y04lQ7vn2ZLiYlFfBw9v
 re+MjzsCWftN9/Yh8dcLy7WZVoIkmskKKdg7NhXotKNTOO0ADEQO5fBODZsl/d8kPFltJ15O
 NYaK55B8T3DV9myejHwCTQKadH/PC3tJmyg+HQ1nFsShwvTZpBwUNWNia3e3cGPTWvI/ICZe
 GhDw581kKdRUg=
X-IronPort-AV: E=Sophos;i="5.90,163,1643691600"; 
   d="scan'208";a="65690194"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bbj/nbEoXhRgsGx+G/bIQ0jXvlhx93gB/5xHR96gX5nz04594OKf2aIP+SnsQTPcgWTgOUjbUQKLPD+kKAyGUOUdQSLMJfAGMDzYX6H4TSNP14AoTF0LBTcieJXgialYZkUs0L8zynt/qlx8asE7rdkGidrTFKpd2nKsWogmjgHt6lxIrYbl8wPkshcQ0xwYvSxNXr2oV87AE9bjbRCijV1rFUsc/q6KSdPBUcDwKO7yxCWtSAj+Y3Lg7xi3sEb4R9IOUJMTRJuDD5Qs+sgognzDs1A2HAjid8CZXYYIM7tghp+DwWwr8tB4jR+yCdtw7FKm9XT2Ejg+qN2IqOYKMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmdmBT8xwaAp+5PvvSMSf2AOX8Aw+VXBSXod15KL0aQ=;
 b=HSEg/dNeOWQE/Teq97y7urPxKdjLFTDq9UMtDFO9JSV410K0ebubsaw7YgZ4mQ/l2NT/HT5zXlTvGWiQamFGaczR7FoUcsjsFaq5bYUzvhUVmdCdV+A013vtENjbxfeBhPWKwMnvF8CCt/Crqla1Vbr5CPk/KRyAWhjTY4ZmY5c6qpAlW+bTD4v//jrFY0nn//cLx13dqrt9HgkTahtJwd909ehqzy5EET0LEwCVJ7xOtNzLBJJ/bWCRg5tpPC805TVAe2im439HvncTNhh8xh5VSruYEOmB51dZz4j+faHNFUOLh5P+63ZOsnSMvWqO5czNGTjiUkdLTRlLKOIafw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmdmBT8xwaAp+5PvvSMSf2AOX8Aw+VXBSXod15KL0aQ=;
 b=VPm9i2ZSjXxjLeyJnkur0xABSwYc7it03cLjY5lbcKA+njX00k0r//pZB84W5snTrrsNKdQtyQ3IvuQUKSUAr06Mc6DbkfZ6HY8V584X0n8xxRSz3H1duDvE6nbj3dnCS3StatC0LEDkDUUTqV3SJEw1/1klwkUhKNG4s3GFunE=
Date: Tue, 8 Mar 2022 09:13:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] livepatch: set -f{function,data}-sections compiler
 option
Message-ID: <YicQKoI8H3DJlqF2@Air-de-Roger>
References: <20220307155558.72876-1-roger.pau@citrix.com>
 <f6e3f58a-ca7c-6173-815b-8bf300df33ed@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6e3f58a-ca7c-6173-815b-8bf300df33ed@xen.org>
X-ClientProxiedBy: MR1P264CA0007.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be79ba40-28b7-436f-217f-08da00db8b33
X-MS-TrafficTypeDiagnostic: PH0PR03MB6723:EE_
X-Microsoft-Antispam-PRVS: <PH0PR03MB67238496F73DF2BCE7007EC78F099@PH0PR03MB6723.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1WyiyBMvzQqPNBMa3gpsRbRhLCMZXdfUIDvgnx9KPujpOHRZ0FLFAPbN4NqIw450Q2gvXw9YdSr76WzRhHj2wohAZv+K+I35pq3RFc/BJ/EQ8YENPJBLS8FiLFZzXpYp8d2f7kph/xSWNTjHC2ztSv/Fe+7S5MINiZuWyGX4wa9ai4MjkOr/yRMcO3OtQmDOF6Pl08lT4dLceswdbXSk3oSRyJHs+TStQebVYUvPJ/MBTsCKUjQfcIRthVd8UjmVDk3ADwR5mSpAY4fK0yKZjpm6irl/K9rZOInxsi/QHTraP2OhCfIqnZMJgUFAkrD3AXg+fHvUVEh7hnFk/pm30hPyiYiuMZ3TNQpZU5iCrbrfG13d+Q6iUqEJRbA4Dk9O2ALgmXrLGZrusodYJcWZYFwri29BYujLWlIRJUR6lH6OVN7/i7FpjTgZEnMcs1Dj3eXioMrPO+eWoJBepeqkaVlTPOXprT2vZTLNa8JX7X9cIa8K/bDeUAATczecrJaHYWmXDLi0IPIHZRY4UWrDHzrv1nmAb8S+NYrsrE+A471o2e6cakFbiuv86M1zXdyZps70d1aqFfVWr2dU5IhSxYnlXMdvZu9uQN0yQnv2YH3/d7usMhAafZMIe3KOWmJ7Umrz7YReoHzTjp9dt3ZhAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6486002)(508600001)(316002)(6506007)(86362001)(6666004)(26005)(85182001)(6512007)(186003)(83380400001)(9686003)(53546011)(66556008)(82960400001)(4326008)(33716001)(38100700002)(66476007)(8676002)(66946007)(2906002)(8936002)(6916009)(5660300002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3lYa1lQM2RibWQ5c3VQeDVubVA0RzUrMDFhLzBEUUg1dmp2L3lOTnpXZm5D?=
 =?utf-8?B?ZUdZV0hXZzNUSE9nTW5rVXZ4MWFrOEthWU96aXRnSDVGdldpVy80ekJDa0R4?=
 =?utf-8?B?VmJ3MThkRnM4SEFlTmRPaUZ5L280RSt2TTY2UWhBSFhLdExvVi9GZlZLQi9Q?=
 =?utf-8?B?dWUvZWM2ZXlzNXUrcStjdmJYQ0JKTUNaOVJ2U3JwTzcrakNObXBIeVNiQjZs?=
 =?utf-8?B?QzZ2bVltbmhTL3gxaW1iWnhUc2lndVNPdW5hMGV2R3dKSldNUmJ3TjhhLzkz?=
 =?utf-8?B?ZE94Zko2K3dLMmVMZjM3OEdubFJyMFhpZXNMYjErNnBJeXNYeFBhL1NBK1l0?=
 =?utf-8?B?VStsQ2wwNjZiUVRqZUNaT0JqdDQwNTNOMXpKd2w1ck4ybEwzRTd4NWZVNHNL?=
 =?utf-8?B?VllMeS9CaktHQTFIZnc3dUxTSW5yeTAxdCs2aGE2Z0o1WXhQR080ME9BczQy?=
 =?utf-8?B?bUNnQ3NRcGFkdDl2N1Q3KzhHNlNvbVArVU42dzlmR0ErcWRDSVRGRWVBSktu?=
 =?utf-8?B?QTJMV2pmTklCaUZ2eEhFZVhGbldqcnNMQ0EzUmlEbmhvcUNiSXYzVjZkR3lI?=
 =?utf-8?B?TXRwTGRIMUNkQm0wL05tYjJ1THAvbHYwSmFNRlMvanNWT09BaCtEeGJTYjhZ?=
 =?utf-8?B?aURTQm01b0VCME5SbTl3SWV3azhyc1BxaGRPOEZWbjNRTzJvMFQ3YkR5MlNt?=
 =?utf-8?B?UDJRM2NNQWQzbVQzcWpxNnIybE5WZml3d1dUNE96ZnN6MlNNSWJLTzV1cHJr?=
 =?utf-8?B?dSttZ2xaNGdzQ0hEbEF5QUZuSTNQR3lqL0cwb0I2WEpGdkhtaTRwNkJIYzdh?=
 =?utf-8?B?RjhFOWpMdGdWNGduU3duWHU4bmxmVVpQcU4zTHJ4QWY0Q1ZVSHpKMS9MRjU0?=
 =?utf-8?B?N2p6K25KUGFnNm1Pb1BNZ3kyWmhZQThDUndOdXhkNm5xS2d2UEpjQzIzOVVV?=
 =?utf-8?B?dnJDS3FPZmlIMW0raXF2QXdqR3lYelNFRVFpTy90eFk1WU5kU0F5V3k4Qk15?=
 =?utf-8?B?LzFqbVkxSHVaNkgrUy8yNnAyU0tzbUprSXBaRDh0aHVoVkkxWHdsK3dNUG9w?=
 =?utf-8?B?dG9BNUdPdXR2L0xwc1pmWXdES2g2aVhZbGNveEt1S1UvSHNiR1VxaUpkejNY?=
 =?utf-8?B?QVQvUk14ejVGMERMU0xZT0tnU09XcndGRVdlR3NHanhUbDVML29UeUVRVEsr?=
 =?utf-8?B?RVVYbGREWmVYcFRWdFVkT01tZEFxbFJDNlNrcmVMa1E2ZDdyUHBWWFAwNHJX?=
 =?utf-8?B?NVFnN20wS3pCQjA5ckllZkQzVlBPWnhsUVUvRDZmNUxBVmFTSWFOWTF2YVJo?=
 =?utf-8?B?S0RoSFRNTkw4OThya3JCa0pJTHBXZ05LSS9qejNFbS9UeUxVMjd2NzhHOVJ4?=
 =?utf-8?B?YUoxbGhjR3VkS25ldkYzMGM2R2pEYUpONExsUCtKWGtZMVVudTRzcXVGbTI0?=
 =?utf-8?B?YUM1QVIzVmQwVk9GenByWUdBVFdEN0lveVlRVGExbEpvTVlRL0lOaTdHazRN?=
 =?utf-8?B?YU9sa1BHQldSRnpxckgvWWdTZUd6RCtzdzZsekV3bUJhL2JCL2o1YU01WWdr?=
 =?utf-8?B?b2N3K0RaVXpnKzJtZ0NoYUxySzVNTDRiWXE3Z2JKekNPakRjd0hpNWpIY1ZB?=
 =?utf-8?B?VDcyUnB1MXAvTnNwc3pXYm5sc2ZBZ2ovK2FoNEcra1I5MHpHeTJxdEhpVTR6?=
 =?utf-8?B?VE9vS3ZGUk4zRmpXSy9vRUFpenF1S243N0JvTUdwT1I3c2lzelg3Yk5QenhF?=
 =?utf-8?B?Ykk4WU85MHcvUVhqdGEzWUVCN29SWnpXeFA0UVBSRWdIUHpCNXJhWU9LRnE5?=
 =?utf-8?B?R290M1N2L3JzK0NTTnI3SEZGclg2N0I2T3ZKMEJaZEpqYlppZHhjUmZWNUVi?=
 =?utf-8?B?cVREbE5DMFVKWUlNTmNZMTlDYnUyUTJDbGs1cXdwdlByMFgrWlV1UVQySWNp?=
 =?utf-8?B?KytBRXYvTkhLQVppS08wU3JUbzFJcnVSUG5CeUhDd2VXbysxMTc1bEt2Tm02?=
 =?utf-8?B?NWRyWjdmT1gyTjkxTWZvaGRpSWNyb2daSFBnajBVUFJVak55UWZ4K2FycEFJ?=
 =?utf-8?B?N0Z4TlZQc3JsWm9iblB3bE1WeGFNNTJhSnNRMFJtVU5lQk43Z3YydVo0dy9u?=
 =?utf-8?B?RVFLUWRlR0JjS3NqZmVjVXpiN2ZmU0NybFBPYUFkdFBrNHc5enduaENzRXo2?=
 =?utf-8?Q?Wu9SPYFBVbEKpAz0eyFRiLU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be79ba40-28b7-436f-217f-08da00db8b33
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 08:13:36.0348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtw/lz4GAuWzCQ3htALMTz6J4R0T5cUXAj5qMNyLea/5HHIr0QDmcUeWGgVwGiw9F7/6xjhfvy0DIUDnhEKZZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6723
X-OriginatorOrg: citrix.com

On Mon, Mar 07, 2022 at 05:19:53PM +0000, Julien Grall wrote:
> Hi Roger,
> 
> On 07/03/2022 15:55, Roger Pau Monne wrote:
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
> > of .text rather than .init, and thus won't be freed. .text.exit will
> > also be part of .text rather than dropped. Overall this could make the
> > image bigger, and package some .text code in a sub-optimal way.
> > 
> > Note that placement of the sections inside of .text is also slightly
> > adjusted to be more similar to the position found in the default GNU
> > ld linker script. This requires having a separate section for the
> > header in order to place it at the begging of the output image,
> > followed with the unlikely and related sections, and finally the main
> > .text section.
> > 
> > On Arm the .data.read_mostly needs to be moved ahead of the .data
> > section like it's already done on x86, and the alignment needs to be
> > set to PAGE_SIZE so it doesn't end up being placed at the tail of a
> > read-only page from the previous section. While there move the
> > alignment of the .data section ahead of the section declaration, like
> > it's done for other sections.
> 
> This sounds like a bug not related to this patch. Can this be split
> separately?

No, .data.read_mostly needs to be moved before .data so that the catch
all .data.* introduced to .data to account for -fdata-sections doesn't
end up also including .data.read_mostly.

> > 
> > The benefit of having CONFIG_LIVEPATCH enable those compiler option
> > is that the livepatch build tools no longer need to fiddle with the
> > build system in order to enable them. Note the current livepatch tools
> > are broken after the recent build changes due to the way they
> > attempt to set  -f{function,data}-sections.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v1:
> >   - Introduce CC_SPLIT_SECTIONS for selecting the compiler options.
> >   - Drop check for compiler options, all supported versions have them.
> >   - Re-arrange section placement in .text, to match the default linker
> >     script.
> >   - Introduce .text.header to contain the headers bits that must appear
> >     first in the final binary.
> > ---
> > Given that now the header is explicitly placed in .text.header, it's
> > likely possible to simplify some of the ordering of the object files
> > for the prelink.o generation, as arch/x86/boot/built_in.o no longer
> > needs to be the first object file in the list.
> > 
> > It also seems on Arm the schedulers and hypfs .data sections should be
> > moved into read_mostly.
> > ---
> > Tested by gitlab in order to assert I didn't introduce any regression
> > on Arm specially.
> > ---
> >   xen/Makefile              |  2 ++
> >   xen/arch/arm/arm32/head.S |  1 +
> >   xen/arch/arm/arm64/head.S |  1 +
> >   xen/arch/arm/xen.lds.S    | 49 +++++++++++++++++++++------------------
> >   xen/arch/x86/boot/head.S  |  2 +-
> >   xen/arch/x86/xen.lds.S    | 22 +++++++++++-------
> >   xen/common/Kconfig        |  4 ++++
> >   7 files changed, 49 insertions(+), 32 deletions(-)
> > 
> > diff --git a/xen/Makefile b/xen/Makefile
> > index 5c21492d6f..18a4f7e101 100644
> > --- a/xen/Makefile
> > +++ b/xen/Makefile
> > @@ -273,6 +273,8 @@ else
> >   CFLAGS += -fomit-frame-pointer
> >   endif
> > +CFLAGS-$(CONFIG_CC_SPLIT_SECTIONS) += -ffunction-sections -fdata-sections
> > +
> >   CFLAGS += -nostdinc -fno-builtin -fno-common
> >   CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith
> >   $(call cc-option-add,CFLAGS,CC,-Wvla)
> > diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> > index 7a906167ef..c837d3054c 100644
> > --- a/xen/arch/arm/arm32/head.S
> > +++ b/xen/arch/arm/arm32/head.S
> > @@ -120,6 +120,7 @@
> >   #endif /* !CONFIG_EARLY_PRINTK */
> > +        .section .text.header, "ax", %progbits
> >           .arm
> >           /*
> > diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> > index 66d862fc81..e62c48ec1c 100644
> > --- a/xen/arch/arm/arm64/head.S
> > +++ b/xen/arch/arm/arm64/head.S
> > @@ -133,6 +133,7 @@
> >           add \xb, \xb, x20
> >   .endm
> > +        .section .text.header, "ax", %progbits
> >           /*.aarch64*/
> >           /*
> > diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> > index 08016948ab..836da880c3 100644
> > --- a/xen/arch/arm/xen.lds.S
> > +++ b/xen/arch/arm/xen.lds.S
> > @@ -30,9 +30,16 @@ SECTIONS
> >     _start = .;
> >     .text : {
> >           _stext = .;            /* Text section */
> > +       *(.text.header)
> 
> With this change, the changes in arch/*/arch.mk to order head.o looks
> unnecessary. Can we remove it at the same time? (The .text.header and the
> update of arch.mk may want to be done together in a separate patch).

I had a note below the commit message about this, as I didn't think it
was strictly necessary to get this accepted. I will do a pre-patch
then with those added.

Thanks, Roger.

