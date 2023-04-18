Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CFA6E5D6C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 11:31:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522688.812205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pohgB-00045j-3g; Tue, 18 Apr 2023 09:31:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522688.812205; Tue, 18 Apr 2023 09:31:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pohgB-00043n-0o; Tue, 18 Apr 2023 09:31:15 +0000
Received: by outflank-mailman (input) for mailman id 522688;
 Tue, 18 Apr 2023 09:31:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUq5=AJ=citrix.com=prvs=465f4c9e2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pohg9-00043h-4U
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 09:31:13 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c038a8b6-ddcb-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 11:31:11 +0200 (CEST)
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2023 05:31:05 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB6514.namprd03.prod.outlook.com (2603:10b6:806:1c5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 09:31:01 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 09:31:01 +0000
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
X-Inumbo-ID: c038a8b6-ddcb-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681810271;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ZDsajIU8iR14slYM81FilTBlNuBK4bFHte6iNbW1qTk=;
  b=YCeYtCTZNMVbo3Zy1XJAPnWf+kY6baRB64CrQ4Cce5ZFSh+yQNzPZOuk
   h5Pi7oTXUfZ/aY9bEZPZafldXppt3uKODXkhV8Iw7YkNw/9WurTNIYvG5
   dkStt8Ivc6Bu7IhN34QDHN+j8AgVRARDt6tIGTUkETFoAFqqKrn2eeSI8
   c=;
X-IronPort-RemoteIP: 104.47.55.109
X-IronPort-MID: 108368436
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JMFh0avTXSyCGKu4Em3q6V0UUefnVHBfMUV32f8akzHdYApBsoF/q
 tZmKWGHMqqPamSkeIxxaoy+o0JTvcfRyNcxHABp/3s9FykQ+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Vv0gnRkPaoQ5AOHxyFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwNBoQVBC82cKMyuybbs5cmcJzJs3vFdZK0p1g5Wmx4fcOZ7nmGv2PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60aIu9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiANJJSu3kraACbFu74UAuTydNR3qC+LrosX6aQPh8O
 xwW9X97xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqC8p+EoDX0PjIaRVLufgcBRAoBptz8+oc6i0uXSs45SfbkyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CBhRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:ejBFwKOJUUp6zcBcTs+jsMiBIKoaSvp037BL7SxMoHluGfBw+P
 rAoB1273HJYVQqOE3I6OrgBEDoexq1n/NICOIqTNSftWfdyQ6VBbAnwYz+wyDxXw3Sn9QtsZ
 uIqpIOauHNMQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AC0XNZWtg21zEe1qXXpimeVj+6Is5WGDnzEiOA3W?=
 =?us-ascii?q?yV0ZNb42KTw+a/KdNxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Ak2w3ug60TTDuB2Z373UEejtYxoxPz5npMhsfsKx?=
 =?us-ascii?q?f+Ji/BQhrERSN3Da4F9o=3D?=
X-IronPort-AV: E=Sophos;i="5.99,206,1677560400"; 
   d="scan'208";a="108368436"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V69n4NIWYQQZctgTPCZQvh2d8JAUt0cuHyasPiOLdpdkA6ElYIUtdkfyK/idS/zEoq1xWpkRgyz8Z1COOD4xaZh9IS/0okEsMcB7xWTt7ooyA53+ltfgIgmO2LTCQJ1zW0s7y+QU71EOPftylE1ic36QZuj6s29iOmers7JHMAjxSf3dOGU18rr8nmKVeyRFm3/lqU/yKdWEQzDKyUcMjx8X47rAyJA5PC10e4mShVYXe7SvcP/cZw/rps2zehdrVQ2FdDOIT+4vWZIY/cqmSFsQPWRGDjxQCz6hsP2C4l9CRwnpoO4IucKLn3QEtY6JzX6jDvBSr46juHOp94lUgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLSBuNUz2YRkFh5WhmdJDM9ZFjV5lt5FDeN8iDjoiUI=;
 b=Fl9iqnD3rBqTvFZklw9WonrJWe48XagEfDw8+B6aYYtT7eLo/bY1hofcVa7SnqCw+pKhrhoqzMHVUoJA018xO5SBJzDOAiOq9LsdXUFGhx5JmrGblrtlf5FMjA0mJFZ9OS1n8fOEwsogQdDQDenK5zKjh2K41QxPQY9Es16xXyjuIGKGu1d9UgJD1JGxCa2mtW2GVCHDCiKaw7cYNJxw8WWQv8aMBtrpivk1FySKg4RuoWKBEvN09i57sWmHrBbXKQoeLXDfxHqNWZUsdE2NdtlKV8636O+SwnPM12wJ+99pyGZOkUM8O6ULeRFeesEEATp32akZJIVxGYGd4eh7LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLSBuNUz2YRkFh5WhmdJDM9ZFjV5lt5FDeN8iDjoiUI=;
 b=gx5Nb8ku99TA562YV6A9u6bSMG08UpXxN3EbnE5OU4AAN2kByFMj1GazSvxI0uTDTThDgZKcV2YesRIhbrIw8SWWZHSAis5evSqnM+n4JemQddm5FTwYIO7JDF4ys1cW6KlG6i3k4V3sDFMXy/B6qIPk8PyhDoL3MBJf0Zne1x8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 18 Apr 2023 11:30:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH] tests/cpu-policy: fix "run" goal
Message-ID: <ZD5jT/F8b82ZkGxo@Air-de-Roger>
References: <80a02af5-9154-8289-4e92-6016c0948a61@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <80a02af5-9154-8289-4e92-6016c0948a61@suse.com>
X-ClientProxiedBy: LO2P123CA0085.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB6514:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e43946f-621b-482b-702c-08db3fef9fa3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HQkJf3IjZwKwBjQ1PL1sJugtPXYV0WBfLdUDnnpuhz2Sas09yWqfd/Ud/7EUQX6ivnnvGk6FO5TRbrUQQfUztuEz3xEqU+GNjYlGdd5BJIjyRHCSMK8o/oSLSBqIwRcM0qCa0WsgcTSnlvc4FOXRWO48af66yfH90Q+VQpbzpiCStXSs6yAJvsoLc85YKcwkBUCdILqjavbtH4kV77gzb5yuydztWE9uoKdR4ObEHsH3fCV3hOZIvC8w/zq2gA7kWRDpzT/6LwwEbbqbnm9+tFoWs74rdca2vopjSa4XpjvsysC/3LPkOnN01ICnbBd1oxaCTblj8qTzPDRn6ZbnQFyksq3IVFAr4BLxGKFQWUGB90RUrpOs9Xz0ladIMfjQm6e7ObrQ9ZxLN72UJYJQ0MZWf3ocSOz2r2/9UUacuPDyq6IvViVF/Thmn5uz3CAgzB2tcPHd7WobJXIi8RslPv+Snz+CszzxYrDYDstBQqVy6DN1z60L0OZiFm1ZslflpmgiuiCrDp1i3WMreev0TtR2py/v626cTSBssdHBt+d55rbVdXVhWcst0drL7P41
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(136003)(366004)(396003)(39860400002)(346002)(376002)(451199021)(2906002)(54906003)(316002)(86362001)(9686003)(26005)(186003)(6506007)(6666004)(107886003)(6512007)(82960400001)(38100700002)(33716001)(6486002)(478600001)(66946007)(4744005)(8936002)(41300700001)(8676002)(66556008)(6916009)(4326008)(66476007)(85182001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Lzd3aTgvUXczSFZDdk1kcnNUeDZydDZscDJJcmQzTUNKaFhDRHZDZ1liZmU5?=
 =?utf-8?B?aUdFNnN6NVd0SXRFT0t4TG4vR1d5bE1ZaUE5b3FYRG11NXJaNnBmS0hoNm9W?=
 =?utf-8?B?OGc0aTV1MEF3elBicnp6V1VONFI3ZDhGb1F5dUZDWGdCYUMvcUw1WGE3K1pP?=
 =?utf-8?B?YzVKanZFQStESmpETlQyT0hKYzVEd1BaWTFBenlRKzRvblBtd1ZOOXB5Q0N4?=
 =?utf-8?B?OTF0anR1RHRjb205OTg1QjZDS0svVm9TWURUVEhmYkJWcjRVb2NVaU83UzhU?=
 =?utf-8?B?UWlPSkIyQ2RvRkh4Y2J5aEtiSnZnbHJ4MDMyalUyV1U3QXBmdjRTUytFR0Fl?=
 =?utf-8?B?bGRZZWd0QzhJeDliM2JZK0d4MDhNanNvcFFpWFBQZUI5OVo4TGExa1NxZm1w?=
 =?utf-8?B?TlNLWmFwNmkyV0lmWU96Z2lJVDJRdVUvNkdFcDRWd2kwRStFd25QSnFTTzRE?=
 =?utf-8?B?UjVXajJyd2dqS3V3WjMzUk9vZVJDaldud3VVQ01KcmJ0VnVWc2VycHVlMFYv?=
 =?utf-8?B?UXRVS2paRzV6VjhiWUgvS21wem9yK2xtenorT01qb0dxRFhVMDdrUkNkdnpq?=
 =?utf-8?B?bkRwRmhVTXZtZC9sbGFuY2h5U0xVL0FxMEJVYThyU2doMjN0Y3dxNThlRWVK?=
 =?utf-8?B?dVNUL3RucjdUdlNFZmlPWVFHdUMzR1hORVFacEhCb2QwWTNNd2t0NDdRTEZS?=
 =?utf-8?B?bnphVjZ6RUtBejlSZnJSRkM1eE9WaFhaeHh4a0NpQjdkWVd6MVFFMWZmSktn?=
 =?utf-8?B?YTRMTVBXNU9FY1Z0WktwQTFEbVFuSTFaRktaQU40MDZFSDJrU1R0a0lCQjJF?=
 =?utf-8?B?VGFVL3RadzI5WEdLVThzOEhQcmprV3dFN0VOaUE1bWdwYzNwQ1JZckhPRkdj?=
 =?utf-8?B?SnR4c1ZuWkpOUFp0dy9DWS9GMEJoanVmZkd2VStiaVp6OFhTYk9RQjJjdGll?=
 =?utf-8?B?dVEwNDEvaUFGUzBTcDkxYzA1TFRKdXgyN3YxZUtXVE1ZS3RBNy9nY3IxRGY4?=
 =?utf-8?B?eEJUY0pHRjlHZmc1SEpLL3ZyNEY2WUx6Rk5Neld5Y2FZSWJXdjVSdGFNVEVQ?=
 =?utf-8?B?SzJyejU1WGdGSEEwMnVKODhwQmgxdGZBa3A2WEpXd2kyWFZYQ1UrbkxrcXRH?=
 =?utf-8?B?V1A0YlZuWW9VeGVmMjFmaXRibFlLNnRwWXRKeVpKbEsyUng5dElzR1VZaTgr?=
 =?utf-8?B?QmJsc0xYVkFEUUY0eklYaXgrMTh4OEpPczltUndwWkljbmZ6UzYzVVVlZXVo?=
 =?utf-8?B?MTlDODNrWGZDam5QbjZkQ0RNZTFTZnVsdVhWaGhMNlVmU3lsV0ViMm43RmhB?=
 =?utf-8?B?blkvZUpRUG5pbUVTd2JPRGpXZ0Rmbmp3YTB0MDJMZ0xFNUM3OXNqbE5raUVi?=
 =?utf-8?B?dVF1bTNONmZQeDVXSWNWWXc0L3FYd042UnNQbUVSZ282b3YwUDBZTkU4TWhn?=
 =?utf-8?B?ZG5VNU1xWWQ2dWJJV3FEU1FpOVIxb0xnV0svWm1SVnBCRzh5Rlp2anpUSVc3?=
 =?utf-8?B?dlExbXYwVnVITm45YVJCbzQySEVZbDZuSCsxVWRCSzFid3lNeXNWNFFpbTJr?=
 =?utf-8?B?Z0N3TTAwWmIyLzhlUGV5NFBMK2RKdjIzY1hBSnZRSjNoOVhzL1YzakZWMGk5?=
 =?utf-8?B?cTBMeU1EZVN6UGY3RFpEc2hpQ3JCZGdWR1N0M1lJY0NjQWlWR2RxUDdSVGYz?=
 =?utf-8?B?MjRBNkNCZitCYWZJOG0zdVBWaDVTYWVSQlhHWkt4ang4NFQzVEw3eEEwaFgv?=
 =?utf-8?B?UkZpM0pDaVREa1haQlhZZkw5VElrbWw1MHJzTlU4Y2l0TUVlWHZxS0JXUmk1?=
 =?utf-8?B?eU1FY0RkWEVIQzBsbXdkM0U4RnFpeHpVbFN6blZOWUpuYnBCWFBNQkh4NTBT?=
 =?utf-8?B?OXRKaC96c2dYWkQyVUFKV3NxYUErNjlwOEU1ZEVISEhPZzBEMDlaN01EallW?=
 =?utf-8?B?UmNrSEVnRi9XU2Y3OGFOcTVhTmRWU2FWdUJMK1NSenFndjk1c2RYSjZjSVU4?=
 =?utf-8?B?MVByUW9XTzEybXBWSkxiUlp3QkJCYnE1VEJMQkhxbE9DZk1PUEtmZzZIc2Nn?=
 =?utf-8?B?cGZYc3JGMEluaWw3d0R4MlJaTzNzRWE3SVBpNUNHUjhxWkFNemV5RUlUcTRr?=
 =?utf-8?Q?4TYyKoT1+9CE3MNBwv6aefsl6?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Qizajy3uyDuZ1mwNpoM9u0CujQ9b/fHXd9ISO5TKBAr8nrCDu7NxgH7FCK9WvppNV3lCfnw51Z4sVM0K3nlOBc/WpUnBjtdwJHDLtXL32VR2rS1vzF53mPA0NStS+fhHGs3DfD2VEgPtjGKE+MKQvx7adbXhHJdMUf93pkwb5adIb/Y01uEjvV4UR68mD3ZL010CSCYdVTjsPDD33f3bvisXGZiXDjMkojeLxDudWF1drguftGTKYBQhNpbLwiqLymyPJSgEB7AKvhC6JkJgEQ3Aw50ZDuhBezzGkUzUefN2YN3Cn2Nd/5zjtCCT6eHI5MGssC12N+Fdu3owB5bckQ9P7T8KouevM279voe9zSE/R8VR2C21oBZTWrpN2NzgPeuiZ4b57sxekMfysxo2P1Sk+EJTf27Enrq3k8sxnNq3DOvR8IYt3Qj4GnKJ1xpnpJVJH1FrGB+VZJHx4o1/0M6SfuDarN/9ysr3xRD0ukNVTWqLjjuCvT/7U3XCHjj/lVn8q59CLvdSmE3Myf6pcZ64f7BkQIeU1I6YVdJsDffSuAwrb+O3ycryUBrnCupSptzWzdRM0+2L8XxEj70Ru2odtIUL6EkB3S3aWm6vu+Qr5cxDtn6290jPWZVBC5q78oVNiLWKNktubX7ysPpK50wRFTbQw711ut2ERGqkDIDooXFynL+K6m1uoh6cU+26tvcqQ8UHvDeA+eBs7LKoG/gT9PUx87FV/Jyj8YpvGQV50HcfbS6ABlIeP3aDcfBslifvAp1/tKNyw1oOqGi8tuXgLRVcCSvfTc1lmAHgeC0k6tI9Ac3qGiK+fBdNXGR2
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e43946f-621b-482b-702c-08db3fef9fa3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 09:31:01.1974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11A/YYVtvoAoJPSwlhCeX1/tA07kuzTRCg3e1+/Ke85837xv5ajh6g4aB4OQbshwr9acrTl94MoTJ5G97NYcag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6514

On Tue, Apr 18, 2023 at 11:01:56AM +0200, Jan Beulich wrote:
> An earlier change converted TARGET-y to TARGETS, but failed to replace
> all references. Convert run's dependency, but use $< in the command to
> avoid the leading blank that += inserts.
> 
> Fixes: 6a9f5477637a ("tests/cpu-policy: Rework Makefile")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/tools/tests/cpu-policy/Makefile
> +++ b/tools/tests/cpu-policy/Makefile
> @@ -16,8 +16,8 @@ endif
>  all: $(TARGETS)
>  
>  .PHONY: run
> -run: $(TARGET-y)
> -	./$(TARGET-y)
> +run: $(TARGETS)
> +	./$<

Since it seems like TARGETS can contain multiple outputs, do we want
to have a for loop here?

Thanks, Roger.

