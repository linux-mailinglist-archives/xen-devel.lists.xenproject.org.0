Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 890C3519EC2
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 14:01:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320645.541484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmDh3-0006Op-5p; Wed, 04 May 2022 12:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320645.541484; Wed, 04 May 2022 12:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmDh3-0006MG-2n; Wed, 04 May 2022 12:01:21 +0000
Received: by outflank-mailman (input) for mailman id 320645;
 Wed, 04 May 2022 12:01:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XlRM=VM=citrix.com=prvs=1169e63e3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nmDh1-0006Lv-Fy
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 12:01:19 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e68d06d4-cba1-11ec-a406-831a346695d4;
 Wed, 04 May 2022 14:01:17 +0200 (CEST)
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 May 2022 08:01:15 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SN6PR03MB3567.namprd03.prod.outlook.com (2603:10b6:805:4a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Wed, 4 May
 2022 12:01:12 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 12:01:12 +0000
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
X-Inumbo-ID: e68d06d4-cba1-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651665677;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=kRLMZ8GgmoIEtLb+5OhcyKbjXL0yGW8xba8e9ur84eY=;
  b=cMPM/bGZLlImiAcS9sw4lJNl1/eAAUtmU0ckMZIm7aD7rwCq9BWMx0hm
   giOad7Je0Q7p2FCZU68Pb0fMdfzY1CfZdjVpUsXDvHIV2thwJliF/EG8c
   Q0gRN+SCDI7PDZlEkk9lllPzfqYZWkrmWxP3rtBd0+oxveOWRtMcyXjgm
   Y=;
X-IronPort-RemoteIP: 104.47.57.172
X-IronPort-MID: 70566273
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/8vTMKutygN25hroqjIeDUruyufnVCBfMUV32f8akzHdYApBsoF/q
 tZmKWvUPPuMN2b0KIp1a4vgo05Xu5bVz4BqT1Nvq3g8QXlA+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW17V5
 YuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8PeYDug98kcSNUGh5aJqBg8aP+PFSg5Jn7I03uKxMAwt1IJWRvZMg037gyBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4IHmm5v3KiiHt6HD
 yYdQSBoYxnaJQVGJ38cCY4knffujX76G9FdgA3N+PRpuTeIpOB3+La3GdDccdm1edVynByJq
 lDdzmjnKChPYbRzzhLAqBpAnNTnnyn2RYYTH72Q7eNxjRuYwWl7IA0bUx63rOe0jma6WslDM
 AoE9yw2t68w+Ue3CN7nUHWQuHeZujYMVtwWFPc1gDxh0YLR6gedQ2QBEDhIbYV/sNdsHGNwk
 FiUg9nuGDpj9qWPTm6Q/auVqjX0PjUJKWgFZmkPSg5tD8TfnbzfRynnFr5LeJNZRPWscd0s6
 1hmdBQDuog=
IronPort-HdrOrdr: A9a23:MxkFRK44Ewq53WoaGwPXwVqBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcT2/hrAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCZSWa+eAcmSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AXV0gK1XYcNu/0KDwVeOEQbqBJaa
 Z0q/A37gaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGA9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9AwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgvf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQi/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpLzPKN
 MeTf002cwmMW9zNxvizypSKZ2XLzkO9y69MwY/Upf/6UkVoJh7p3FosfD30E1wsa7VcKM0lt
 gsAp4Y6o2mcfVmHZ6VJN1xNvdfWVa9Ny4lDgqpUCfaPZBCHU7xgLjKx5hwzN2WWfUzvekPcd
 L6IRlliVI=
X-IronPort-AV: E=Sophos;i="5.91,198,1647316800"; 
   d="scan'208";a="70566273"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkAPHt22NMIJx/QVZ9icgkGvKrqHjk/fRNta77S0IVI24iuXVNu2TKhC2I9SRSYw2hcKMiEBvy9Z4SMyIJ0WFpyjJW366IEEep4MvdUEbwlI91DouJPF1mTp9kZxey8yldu2F4cS6ojfl6i7H8bWSGUGl+pSEf4U0enDzIJL52h2Q8nkdYVBC1+QVcYN35nAzFmGfxr4fBOybJ3hRMYkGdvHnbytcx9ywldZ6mqhY09pwldqe5k7K0lP4kmDr1S6nHxJQKFYlgFuaSRzi+DMGiFBtJVDdhWZjOR4o8D+lWg8i8hbwLHRjDMm6EM0Owub4SDyfwQKQ9Szcc3AiERpYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqE6FbiLFOhEI0kMWqQB55i1XJ4lYeJnSAw3hJjs0qY=;
 b=WuxfI4+Gxax+xOL7Xsarn9UFog7sFtRl7XZh+Zgd072QWBnD3j2kiI4KA9u0i8ec0/68xdy6fd/4hv5HX/xI1K8GZaBfdxDwCYqGGkELSELnw2IatqpFhwQYSDlM3B1FgvN6ecEe4rEEZ2l1fZEpR2boRBgcxPoH2jHW3HFRtkTwXxcwz6FH4P/NxyeyZ1/f3W+wO+lpN5GOBvgCycxv84+IJYhO5zr6X3+YJO0WkdLn23pXFpEkSndZNMUd+CmUeQuuWvFaCCWyNha9FkkzJRLrS5l8T25++vQK8y2UjqtrTmIZM3uwBAgodNqp7mOy8lXRWeSpf9gMoRDrFHXuvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqE6FbiLFOhEI0kMWqQB55i1XJ4lYeJnSAw3hJjs0qY=;
 b=HYvG+gzMZeNbcYNRKmOsM+wlSxv1yE9MYmLQZEsru+KGeolZlAdgftoAWTPdbdTakI/7WDkHsdJ5qgQSL2l6w86XhVIlm2y3MUh+ZWB+u1+hriYEfd0sIkwbWN9Qj+CCeEjVr3CKSywailzpQBVLYi+aDHvGaQ8F5VLTfHVrGk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 May 2022 14:01:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v4 05/21] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
Message-ID: <YnJrBNkGl8Em0gTN@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <5cb4dc1b-f6b0-89cc-e21c-a27a5daf0290@suse.com>
 <YnEngsDG9BiiyzXj@Air-de-Roger>
 <6ffd48ee-9356-2f22-415e-03e172eabb55@suse.com>
 <6f45248b-2f49-0834-e801-d298ea680a33@suse.com>
 <YnJV3EYq7E+4ajPN@Air-de-Roger>
 <e40d5b56-e52c-34fc-fcfb-ebf136135271@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e40d5b56-e52c-34fc-fcfb-ebf136135271@suse.com>
X-ClientProxiedBy: BLAPR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:208:32b::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f929019c-3aca-46cb-5889-08da2dc5c7ef
X-MS-TrafficTypeDiagnostic: SN6PR03MB3567:EE_
X-Microsoft-Antispam-PRVS:
	<SN6PR03MB3567FABFC1B7BC427C5E75E18FC39@SN6PR03MB3567.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7f33z0GLHrp9WB3Aj6BPHIpm8c69OLSU0N3bUVwFVWpOZ0Zx44KU7c41iUVlnhB4G5UOj5v2Rk9adrK7HmNMYN/puEZOPp9kn6BIdgRUB7svoUu3vPswjB9WY3mV4VFZ5pWFvtZ/txxLa5YowMAe06SD3ksRuB2Pf7aLJMzVe1elGtsok7zIAGi2j5Lodas1OPWdOs0GLcDguGiCEq9Yc603x9lxHII/ti34UpYh0Taf8939EihvviIKqEWjDs1jkUyeUqCQ3HE3qcVzP+KPs2H3jm3wBA+XyK684IwcXYxGw0iNeaUN2KSkFZW2eb5kRA5Oc1kqJCvnc9trvHIsyBZ2jQMXw6y43YJwGjS9bQ/8bbxWMwiwIfSTDSM3yKuAgy0McQp5z6rUArgILa0h7KVNMyEDCUra/eMSulfY0amwbVqcmfxUwBN92R0l09cEkRi1/UMed+tiWcP7zyI0yC7sEWcZvB3wBARuMLrmbxkZK2twE2BNRkPwlprh+z2ysJ6viEtdqKh+c1Wk+rylTlepnxp2Ca57QawMwPR7YPdzsucxhGZ2RXaEZhwChCchWu8JIn/ng//JE/c+hfWt99z0SyAQ8If/wLTsIqGunwIB3CEh+ateFLzipxNs6wfG02MBKjf/adlyaa02ci4kug==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(186003)(6506007)(26005)(53546011)(85182001)(6666004)(9686003)(6512007)(82960400001)(86362001)(38100700002)(8936002)(83380400001)(33716001)(6486002)(6916009)(54906003)(5660300002)(508600001)(316002)(2906002)(66476007)(8676002)(4326008)(66556008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1JjRlhrajF3WlVZQ1lMRndZdWR4T3l2dFZ2WnQ0bjlzYyt3dDE5UzBoWity?=
 =?utf-8?B?a2NqRjdxeDlkME1ZMXc1ZUt3WktoRDk4NWIxOG5kUXVFSmpYMFpTSlNPeTN0?=
 =?utf-8?B?RUs3T2VlenhLZDFHRDJ2VG8wUzg3dWtTK0xaQ3UxSy9rdW1CNU1aVzNhSnA2?=
 =?utf-8?B?YjVOdlBia0IyZjBIZlJFUjRoYWs2ekZWRnlxb2VVbGhqNm5SVWFvMXRsRzJa?=
 =?utf-8?B?T0xkSEhrcUtOVmRsVEtDT1Rzby9vN3VvK1NIVWFIcWFPa3hDWFh2OXZ6NHQw?=
 =?utf-8?B?dUtkaFQrVzg1b3Zsa0h5OGd5d2FNQ3hsREU1cEpiendhcmxTM0Y4ejJvMC9F?=
 =?utf-8?B?UHV3U3dMTDdIRnp0b2tZTS9VRm1xWkFkOTdTMlp1b2JNVVlaNGlnUC9nTi9M?=
 =?utf-8?B?ZFU0blFMc0VHZkJWRm5NSk91VDB2NTFsMUJVekNIMUIwYUlBNzE0RldSV2la?=
 =?utf-8?B?RlpaYWhnd2tFZFJFZHE1RVAxaFRpZmZxbm9XaDg3NHl4SXphUFREQUNGNTR3?=
 =?utf-8?B?b01taEtUeGdGYTNrM3hYa1VXc2RTUWcwS1RHVXM0R3VEbSszK05tVG0xcGxQ?=
 =?utf-8?B?NFUyamYrOWgyZmVONFFVQWd4MTNuK3dtNGhKaDBmSDNUN3hmV3d0WllMQWlO?=
 =?utf-8?B?Y3MybEhjVzZuVkE4WEFXbE9hN21NaWdCSDBGbWRiZFF3cHhFb0t5Tm1XNzhQ?=
 =?utf-8?B?Q3V5ZENNVEttWm1naFg5YnBsUTdYakM3RGE4ZGVkMDZqcjdKRkFlRTlGVUJS?=
 =?utf-8?B?TEFFZ2hLRklYUThpN3hlSnMrTmgrYTU2eDRLbWdmQWZhZHNyaXNVaVZnY0Fj?=
 =?utf-8?B?Z2NKdGVzanFrQjEyWWhYblc1aGNqUXo3UGJEU1RXMDFxcXMwRUIrcU80bUQ1?=
 =?utf-8?B?NkVPUW5ObjBMdENIOXV4Y2NPTmNXMjE1dDdMMGZRNEtLcnNaVUpjc2JDVUtN?=
 =?utf-8?B?YXNGWHhrNlpGcGRDQkVDSzRUTkVjU3JyUE1jbUJxRHBOb1NvdGhiTDNWc25U?=
 =?utf-8?B?NWxqbEhDSTg1REY4Wng1dWt4Sjk5T1VTRVNwSnYvS3k3VFo1Sllab1MxMEVF?=
 =?utf-8?B?SlYwbVBDaEErT1JmUTZvanVpZnQvaU11U1JBcjBXK1lqaFJKV2RBS3QrdURq?=
 =?utf-8?B?SEVYQjJTSHAvYUdNQXduTytHMVVpaVgwdU8wUmNzWDd6SW0xdzgvQTRxNXk5?=
 =?utf-8?B?dG9CKzV3eHU4MmZXOUxIQnA4QTdIMHRzYXVOTVY1V1gxaSs3T1FDOE5vUFVB?=
 =?utf-8?B?NGN0dkhUTm85VkJ1alBHN0hBM3ZaZW1aUWR4cEdjaDhCOGJMckcxakl2am5I?=
 =?utf-8?B?OGF5aURjRUZkWFhFMUR4d2s2Ri9LTlc1SHQ3SlNDU1RITnByR00zTUN3SEtJ?=
 =?utf-8?B?VnVmckVCd2NLYWw5VTFIZzRhbTVNQXNDbTVmcW0wdGtLWnZ5WVJlSlA5ekNt?=
 =?utf-8?B?WStMMlJIZHR2VU1mUlViVnhKV0tqdjdFNGNMcm9naWdpOUg3ekl3azJNRWtl?=
 =?utf-8?B?QUFKbXFzVzJuRVEyTEJMUTJNNWJWMElnaFFwT2taNE1UeUxTTnF4cGQyZlpO?=
 =?utf-8?B?cHByMnVKTmtiNWUxK3YrU1ZPUExnOU9uRkJkKy9IUzRpckdvdUVaM0pkSk1Q?=
 =?utf-8?B?T2pGNWhjc05UWExqa1ZqaXFKVkNNM1RRenFsUEpnWEV1VUNIdHFIcVpBd1Ar?=
 =?utf-8?B?R0d2ODEyd3A3R2dSekY1dWwxS0pMN1F5dXM4dHNEekxYNjBhbjBhTEpoa05G?=
 =?utf-8?B?Q2doYkh1aXNlVFJadEhJdGJ5S2NqSERjZDRUUnRaSGsxSkJvcG9BZSsyVUow?=
 =?utf-8?B?UnhibXN3bURIZVFUeHVteUdlWnJUT1dreWhoNGFUejZzZTNMMWtJUFIrYlJQ?=
 =?utf-8?B?b2NnU0hqZ05OMEE1N0pHaDZCMkErVDVUTWxGT3IreG50QkZWY1RXbnlYRlg0?=
 =?utf-8?B?aHE4MUYzR0VQbGdYeVRkTUtseFJITkR3Y1lZbEdPK3V3WTVjQmZVWVpwc0pu?=
 =?utf-8?B?bkY5Ujc5bnhVN2dtUUpLbkZYbDc4U3Q1dFFIVUJUVlBmVlZZYllKbEgvQU1R?=
 =?utf-8?B?VS9lZ3VzK1V5cXJnODArRFRUQTUvYzNLTmZCSk1TKzBGZTVDakhXN3FPaVhL?=
 =?utf-8?B?VUcyU05Ta093LzVoYVp1bGFzYjE2WXU4eGx5aXJqQXRscEVxT1djUDhPWmdo?=
 =?utf-8?B?d1p6akczOHdrMTJ3eGtqcHE4eWdybi9kdVhoU1lPblhPaWxuSkN0S2N3U2Zu?=
 =?utf-8?B?TWFnWCtEMXUvUzlUSVVIVllsL1loRlhiajRqeFcyV0ROZWY3aFlqLysyOEtk?=
 =?utf-8?B?QTB0Y3lucElmdFdtWDlWREVVL1BHNFNhYmpoK1cvTEJmZTlDb1hXYlRWdFJP?=
 =?utf-8?Q?CS8LBCFb8AAYNTfY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f929019c-3aca-46cb-5889-08da2dc5c7ef
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 12:01:12.4057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8J2+Qj1IlyqCQbew8cq+swqVhPz86VMI/2mjiNOwn270v040TJVT8a1RSjPtovwZ65rExmvE5DD2u/ixmkgFiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3567

On Wed, May 04, 2022 at 12:51:25PM +0200, Jan Beulich wrote:
> On 04.05.2022 12:30, Roger Pau Monné wrote:
> > On Wed, May 04, 2022 at 11:32:51AM +0200, Jan Beulich wrote:
> >> On 03.05.2022 16:50, Jan Beulich wrote:
> >>> On 03.05.2022 15:00, Roger Pau Monné wrote:
> >>>> On Mon, Apr 25, 2022 at 10:34:23AM +0200, Jan Beulich wrote:
> >>>>> While already the case for PVH, there's no reason to treat PV
> >>>>> differently here, though of course the addresses get taken from another
> >>>>> source in this case. Except that, to match CPU side mappings, by default
> >>>>> we permit r/o ones. This then also means we now deal consistently with
> >>>>> IO-APICs whose MMIO is or is not covered by E820 reserved regions.
> >>>>>
> >>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>>> ---
> >>>>> [integrated] v1: Integrate into series.
> >>>>> [standalone] v2: Keep IOMMU mappings in sync with CPU ones.
> >>>>>
> >>>>> --- a/xen/drivers/passthrough/x86/iommu.c
> >>>>> +++ b/xen/drivers/passthrough/x86/iommu.c
> >>>>> @@ -275,12 +275,12 @@ void iommu_identity_map_teardown(struct
> >>>>>      }
> >>>>>  }
> >>>>>  
> >>>>> -static bool __hwdom_init hwdom_iommu_map(const struct domain *d,
> >>>>> -                                         unsigned long pfn,
> >>>>> -                                         unsigned long max_pfn)
> >>>>> +static unsigned int __hwdom_init hwdom_iommu_map(const struct domain *d,
> >>>>> +                                                 unsigned long pfn,
> >>>>> +                                                 unsigned long max_pfn)
> >>>>>  {
> >>>>>      mfn_t mfn = _mfn(pfn);
> >>>>> -    unsigned int i, type;
> >>>>> +    unsigned int i, type, perms = IOMMUF_readable | IOMMUF_writable;
> >>>>>  
> >>>>>      /*
> >>>>>       * Set up 1:1 mapping for dom0. Default to include only conventional RAM
> >>>>> @@ -289,44 +289,60 @@ static bool __hwdom_init hwdom_iommu_map
> >>>>>       * that fall in unusable ranges for PV Dom0.
> >>>>>       */
> >>>>>      if ( (pfn > max_pfn && !mfn_valid(mfn)) || xen_in_range(pfn) )
> >>>>> -        return false;
> >>>>> +        return 0;
> >>>>>  
> >>>>>      switch ( type = page_get_ram_type(mfn) )
> >>>>>      {
> >>>>>      case RAM_TYPE_UNUSABLE:
> >>>>> -        return false;
> >>>>> +        return 0;
> >>>>>  
> >>>>>      case RAM_TYPE_CONVENTIONAL:
> >>>>>          if ( iommu_hwdom_strict )
> >>>>> -            return false;
> >>>>> +            return 0;
> >>>>>          break;
> >>>>>  
> >>>>>      default:
> >>>>>          if ( type & RAM_TYPE_RESERVED )
> >>>>>          {
> >>>>>              if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
> >>>>> -                return false;
> >>>>> +                perms = 0;
> >>>>>          }
> >>>>> -        else if ( is_hvm_domain(d) || !iommu_hwdom_inclusive || pfn > max_pfn )
> >>>>> -            return false;
> >>>>> +        else if ( is_hvm_domain(d) )
> >>>>> +            return 0;
> >>>>> +        else if ( !iommu_hwdom_inclusive || pfn > max_pfn )
> >>>>> +            perms = 0;
> >>>>>      }
> >>>>>  
> >>>>>      /* Check that it doesn't overlap with the Interrupt Address Range. */
> >>>>>      if ( pfn >= 0xfee00 && pfn <= 0xfeeff )
> >>>>> -        return false;
> >>>>> +        return 0;
> >>>>>      /* ... or the IO-APIC */
> >>>>> -    for ( i = 0; has_vioapic(d) && i < d->arch.hvm.nr_vioapics; i++ )
> >>>>> -        if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
> >>>>> -            return false;
> >>>>> +    if ( has_vioapic(d) )
> >>>>> +    {
> >>>>> +        for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
> >>>>> +            if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
> >>>>> +                return 0;
> >>>>> +    }
> >>>>> +    else if ( is_pv_domain(d) )
> >>>>> +    {
> >>>>> +        /*
> >>>>> +         * Be consistent with CPU mappings: Dom0 is permitted to establish r/o
> >>>>> +         * ones there, so it should also have such established for IOMMUs.
> >>>>> +         */
> >>>>> +        for ( i = 0; i < nr_ioapics; i++ )
> >>>>> +            if ( pfn == PFN_DOWN(mp_ioapics[i].mpc_apicaddr) )
> >>>>> +                return rangeset_contains_singleton(mmio_ro_ranges, pfn)
> >>>>> +                       ? IOMMUF_readable : 0;
> >>>>
> >>>> If we really are after consistency with CPU side mappings, we should
> >>>> likely take the whole contents of mmio_ro_ranges and d->iomem_caps
> >>>> into account, not just the pages belonging to the IO-APIC?
> >>>>
> >>>> There could also be HPET pages mapped as RO for PV.
> >>>
> >>> Hmm. This would be a yet bigger functional change, but indeed would further
> >>> improve consistency. But shouldn't we then also establish r/w mappings for
> >>> stuff in ->iomem_caps but not in mmio_ro_ranges? This would feel like going
> >>> too far ...
> >>
> >> FTAOD I didn't mean to say that I think such mappings shouldn't be there;
> >> I have been of the opinion that e.g. I/O directly to/from the linear
> >> frame buffer of a graphics device should in principle be permitted. But
> >> which specific mappings to put in place can imo not be derived from
> >> ->iomem_caps, as we merely subtract certain ranges after initially having
> >> set all bits in it. Besides ranges not mapping any MMIO, even something
> >> like the PCI ECAM ranges (parts of which we may also force to r/o, and
> >> which we would hence cover here if I followed your suggestion) are
> >> questionable in this regard.
> > 
> > Right, ->iomem_caps is indeed too wide for our purpose.  What
> > about using something like:
> > 
> > else if ( is_pv_domain(d) )
> > {
> >     if ( !iomem_access_permitted(d, pfn, pfn) )
> >         return 0;
> 
> We can't return 0 here (as RAM pages also make it here when
> !iommu_hwdom_strict), so I can at best take this as a vague outline
> of what you really mean. And I don't want to rely on RAM pages being
> (imo wrongly) represented by set bits in Dom0's iomem_caps.

Well, yes, my suggestion was taking into account that ->iomem_caps for
dom0 has mostly holes for things that shouldn't be mapped, but
otherwise contains everything else as allowed (including RAM).

We could instead do:

else if ( is_pv_domain(d) && type != RAM_TYPE_CONVENTIONAL )
{
    ...

So that we don't rely on RAM being 'allowed' in ->iomem_caps?

> >     if ( rangeset_contains_singleton(mmio_ro_ranges, pfn) )
> >         return IOMMUF_readable;
> > }
> > 
> > That would get us a bit closer to allowed CPU side mappings, and we
> > don't need to special case IO-APIC or HPET addresses as those are
> > already added to ->iomem_caps or mmio_ro_ranges respectively by
> > dom0_setup_permissions().
> 
> This won't fit in a region of code framed by a (split) comment
> saying "Check that it doesn't overlap with ...". Hence if anything
> I could put something like this further down. Yet even then the
> question remains what to do with ranges which pass
> iomem_access_permitted() but
> - aren't really MMIO,
> - are inside MMCFG,
> - are otherwise special.
> 
> Or did you perhaps mean to suggest something like
> 
> else if ( is_pv_domain(d) && iomem_access_permitted(d, pfn, pfn) &&
>           rangeset_contains_singleton(mmio_ro_ranges, pfn) )
>     return IOMMUF_readable;

I don't think this would be fully correct, as we would still allow
mappings of IO-APIC pages explicitly banned in ->iomem_caps by not
handling those?

> ? Then there would only remain the question of whether mapping r/o
> MMCFG pages is okay (I don't think it is), but that could then be
> special-cased similar to what's done further down for vPCI (by not
> returning in the "else if", but merely updating "perms").

Well part of the point of this is to make CPU and Device mappings
more similar.  I don't think devices have any business in poking at
the MMCFG range, so it's fine to explicitly ban that range.  But I
would have also said the same for IO-APIC pages, so I'm unsure why are
IO-APIC pages fine to be mapped RO, but not the MMCFG range.

Thanks, Roger.

