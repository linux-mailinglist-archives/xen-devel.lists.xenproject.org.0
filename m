Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C414F29D0
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 12:44:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298702.508945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbgfp-0000Lj-OV; Tue, 05 Apr 2022 10:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298702.508945; Tue, 05 Apr 2022 10:44:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbgfp-0000IA-KR; Tue, 05 Apr 2022 10:44:33 +0000
Received: by outflank-mailman (input) for mailman id 298702;
 Tue, 05 Apr 2022 10:44:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPnP=UP=citrix.com=prvs=087021108=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nbgfo-0000I2-Fw
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 10:44:32 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e980f1e-b4cd-11ec-8fbc-03012f2f19d4;
 Tue, 05 Apr 2022 12:44:30 +0200 (CEST)
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
X-Inumbo-ID: 5e980f1e-b4cd-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649155470;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=N1XgIKLIOjf9VaZo6jeE8C1v+YIb124AEkLjeQX02hU=;
  b=fJ4NtinZCim9Br7NxErPelb+H/6HL1RAT+QbcBPFjoeH9rZEM7dE7hEB
   l0187vL6reLKVjC+V6M5C2VAbwJWIH/whRu+cWg12pMQkKSd00pzZWlO3
   5po1Aj7/0NOewG7w2yzK9tSYGUJrA6ysvRz54mXd4xBqLvftZGtbpXf2c
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68436947
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4xG9gaJH09UiduBJFE+RxpUlxSXFcZb7ZxGr2PjKsXjdYENSgzIDz
 TMXXmCEP/bZNGSnKN4jPY7jpkoFvJTWzNVnSgFlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh3tY12YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 MhNkIbhSCAYAoH3ivkXb0BzCXF+E7ITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glg2psQTKqBD
 yYfQQIxVxHuOAJkA3kwVbI5sNyX1yXhLQQN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wt
 m/Aumj0HBweHNie0iaetGKhgPfVmiH2U55UE6e3ntZoilCOwm0YCDUNSEC25/K+jyaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCsox45QYtRNNwGxDqf16Doui2DVmgqUWsUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZow7eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl4iDGJGT9bxgbQ+0RqmBNzEJrVml
 CJZ8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9IdEIumkieRsybppsldrVj
 Kn74145CHh7ZiXCUEOKS9jpV5RCIVbIS7wJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2lnFW7T6CHvjTkkX4uYdykVbIEN/pxnPVNbtnhE5FyS2Im
 +ti2zyikEwFCrChO3WJqub+7zkidBAGOHw/kOQOHsarKQt6AmAxTfjXxLIqYYt+mKpJ0OzP+
 xmAtoVwkjITWVWvxd22V01e
IronPort-HdrOrdr: A9a23:Bfd/56tf0AS7Vubsb+p/IK/c7skClIMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLj2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzE4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kbEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 LxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72PeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl5Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbprmGuhHjHkV1RUsZyRtixZJGbEfqFCgL3Z79FupgE286NCr/Zv3Evp9/oGOu15Dq
 r/Q+FVfYp1P7wrhJJGdZc8qPSMex7wqDL3QRSvyAfcZeg600ykke+D3Fxy3pDvRKA1
X-IronPort-AV: E=Sophos;i="5.90,236,1643691600"; 
   d="scan'208";a="68436947"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBFrKqaVWZ7XKg1GF+gBOYdTSM+UBQAW4FRClbiAZCPycjngaruiN+wa/OH0AaOrdjOMSHaF9+IlxxWZqfXc9u+j4QYpjRN9lgCDh42C/dCEfYAkhr/SJO7GLD6GMbbfbCs1BfenaXDwm7Wdt+uqDX47CENOfggVu2RPBoaBB7FesD+n/66DNjPI9/OHFQfyfefcZWsnIub+mHePCf8dcmLk/+aDd1lmy4yzzR3HU0Bvp6C8Uh/GKOK+i/f0k/7fbAC+t3uEO/lXZ9AMAg7LXuUHmO6vzWDfM+rjWDbGOw7MoOMxIffxfvzym+EKksqd/u41Xt2B4LvPVMeZMvh1PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IghFmqibVUyZz4YriJJws3MRllA3nyrXGsdyhvxCoxY=;
 b=McauyRi27WyXGEzP+6wVQx9QnJ8daXNsU743eljQXuEnSod7O6vSC6YlLs0k6G4x+ehGMrxBUCulEH14k0XVGd+l4QPlYBpSLxh3/raRa6Oe7iv8DQ5WbzJPSVnnmvFFA+NeLnqlAfrHxfpXVdpKOXxk4HOPUycI8Lxu62gb1t6j77Rgo9uFsVw3LLXWy+bQRFLwwiJxZEl4ry2UGmi9VRUeY6KnVukLgBBpbUfs6gC7TClvX0B3m6g5IQggtEPMaNCuuBnIBQL7NR83U1Ipw2lXfkZibrXxcW/YUkq7/Bp3Xk4Bzj4USHHwT9I3tt0yRad/5Pp8HzKtzOuUCpDhgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IghFmqibVUyZz4YriJJws3MRllA3nyrXGsdyhvxCoxY=;
 b=K7UnzMqIrn96iweT0gfk4BtxhY+zGE2zFgb7MpibH+loBcgR1LSE0U7p2Ytghc1AU4v8XdQGAwrzc09z82vcrQPfreAMR2Kkc/DawZNJoWhMd6Mwtxb3xC+whMh/XuHElYQ6+j5wOmLKAeEQ+S3ckdntgvmsEGOEticUQ2QUF5Y=
Date: Tue, 5 Apr 2022 12:44:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 4/8] x86/boot: simplify mode_table
Message-ID: <YkwdgpgWP6t7JwFA@Air-de-Roger>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
 <b2ddf830-e507-9d1d-2638-cd34d3391596@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2ddf830-e507-9d1d-2638-cd34d3391596@suse.com>
X-ClientProxiedBy: LO4P123CA0167.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f6c1410-3122-45f2-2674-08da16f13f2f
X-MS-TrafficTypeDiagnostic: SN6PR03MB4253:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB425371471AB0B7688BC32A838FE49@SN6PR03MB4253.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1RIY2iZ+uyGQL5b+OrioI2Wvia2g4wf4QIpH1sVtLYItI00g7tssULs9dl2rnB1swbCsFa/gJM30Nj6BiLFI8cGOY5XewRwL8sI898oy4ckq1zvNvzzG7U/cU+3EkZOzwNw6PEkEbAnUBZ+RR83+yw1uqQdBWODD73IVW2GzYTbMkeEBw5Q0opmmZzakMhS24TzZ3q0zVHTY1FJ8rYH/syCOuBs//+/L0vD6V0GXtJdDBa7HH8cyohgfZKVQFFllXOve4JgSCnq/dL1REw96+8AqdrUqBiE3yDnqKJ4opwOII8wrWTmdSQxos38dGJLdyRGXvWklu88xhFLM1whD0cZtwD0GgryNzF41PxEIqmf5pCMG9I7F9GZw8NT8qvbzx9YlfV7Kp42PxcLkIzwCBq2R2ZL8cC4sazZxb4eaQfD9WBczqiF+7NnZ9zgVYdl4NoAlkzDv2sZZIVaDBu4+tS3jmEImOb54iY5oHRbbGMVadxtmFgJ+hlEZllVM/X5Rsz+FBsHNvZevVmFuvsAHoqaqcR6+ndAbRI4o2F6BRYxbR+cMCaq6q5zk+kFTxALLCVMS5lsKKkEJcYwbulxrCwaAwOkRbA1zXSiT46WIFJHv9QN1Hn4lCGr7f+KSq/E3SAIaRCzZHV3vDEz75QY+/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(38100700002)(316002)(82960400001)(6486002)(86362001)(66556008)(66476007)(2906002)(66946007)(54906003)(8676002)(6916009)(4326008)(6506007)(6512007)(6666004)(85182001)(8936002)(26005)(33716001)(5660300002)(186003)(9686003)(508600001)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTRmQmd2Vy96SW1KbmJKUWpJK2ticDdqT0hTN2hGK3ZsTjlsaTY1TEVDNlp5?=
 =?utf-8?B?U3F1eHc2Nnk0LzBwOHBGQ2xxNFZPM2pwWWpNQmpqQ1pONlN4VENLTHYxZEVN?=
 =?utf-8?B?NFdGa08vMFYzdERvWW5EVk9lQWVqT1l1UTJCWFRlTXgxUEphS1BURmpoQm9j?=
 =?utf-8?B?RCt6UGhMMjU3TmU0aVFtbnpqbm1IT3E0alB0MitCemRFV21nTm1vUXBvSi9X?=
 =?utf-8?B?MWtCUUVONW9aTWE5WERnSDJlZUxaZEExODhNamxhNXFWTnlSUUozNEM3cXla?=
 =?utf-8?B?UG1LRjVqaFhxNFFLcGJQZTM2S2p0MlRHbklReEpkM282RFdGNGNjMjlESzRi?=
 =?utf-8?B?eDdkVmlZVngvbGhaMVFzME0weG81NVFNODBERlRwTlZBZ2k1Zzc2ZzFyaHdR?=
 =?utf-8?B?WkppaUZHL3Bnb3ZnWnplVkJyQzVtTFEydUlTendkdmRvdzhoeEhmQlFtLzhR?=
 =?utf-8?B?d3czVHNvNGdkYllmcCtURzNibXE2elFkd2FKOU1nU21sVHFKMVByQTdJYVZP?=
 =?utf-8?B?cjFpNUUxejlLWGVQRExTcDdsKzVxbGVSVEsrZGIrZW9lb1NCVHFMb0FqcmhW?=
 =?utf-8?B?dGlYTkE4SDhHRG1MdFFGWUVaUjV0OVlTckxFb0VlUXJvOFI0K1lqN0ZqNWU0?=
 =?utf-8?B?elVBYVoyREIxWjVSRmtyMXNISzFvY1lBYUZNZ0VsMGpvaXVFR0Y4TkplSDc0?=
 =?utf-8?B?NmI4UWdYZy9aa3M1dUhFdDJvOEFsMXJTYVZiajdjbCtJN1RDS0xkYWlYY1Bn?=
 =?utf-8?B?NG5SUTFXSXZVWGlUUXQ0R3J1NVJhNWl0Yi9RZEdISDRpb1hlZmhQVE9Ja3Mx?=
 =?utf-8?B?UFE1OHA3UkZ4dm1EcGN5Tkg0bXQ4WnRQY3BHSitzVmJwMGVYd1NvOVVoWFlV?=
 =?utf-8?B?NjVwNSs5cE5zSTE4b0l3b3Z6YWZCNnpEV0kwU1lUUnAwc1ZqZFNiSlBVdFRC?=
 =?utf-8?B?YjhkalEySDNoN0F6ZnVlZDR2NStCb2Irb2VNOVM4S3JId0tNYVFSMVA1ZmNT?=
 =?utf-8?B?a0RPSjV0c09CQlEvNXpyQU9CMHZTWGxWMlBUMitxY2ZIZ1hMUzBsSVg4NzJ1?=
 =?utf-8?B?VWc0QUIyV012eTVXZGtWOWNKWWNNdjA5SUZJdUNxWk85ZkNSMjRJOWpYaUhX?=
 =?utf-8?B?WWNLZXFvSDBMOEdnbUlSeCt6QUUvVkN6azFmeUJWRWJCTmtIU2pqcWR6d2hY?=
 =?utf-8?B?UzUyRkpSOHZMdS9jdkdZWVJPcjJpd1FWeEMxdkZ4SWlGTjdVcXdwSzFYekdR?=
 =?utf-8?B?Ry9INUtzYURwNlM0eU5uR1FycnVQeVY5OWJyN3IrdEtSUWY5TktZdW1IdUl3?=
 =?utf-8?B?RDBWbTIvbFhhemtxeGg3K1dSSFRQQyt0eHJ3RGpIQmdiVWYyV3M4ektqUlho?=
 =?utf-8?B?Uzl6Q3lJOHd2WnhIRVR4L3lUL0QxMlF0MzZQaW9hZlYvVDc5cDdBdWNyMjEz?=
 =?utf-8?B?ZXR0b0JQU2pQMUdYK3JtY1pva1pUVXFUcUFVMnZ5MlhxOGY1c3JXL296RElq?=
 =?utf-8?B?SjR2VGhKZktETVBtN3E3UVg4bWI3aWYwTjBONG4wVnNodTAvbEZiSXhwOStZ?=
 =?utf-8?B?Qk9teTFmcVMyOENwVm9jRDB6dkFKT28xTjFzRThlM2JlN3RMd212dmJEUndv?=
 =?utf-8?B?bkpDMkJlc1RpYVNjbElTeG5IY0dId3ZWbTl2am5uVVltQ2FGaDViaTIyTStx?=
 =?utf-8?B?eWFtZTllREpjVnMrOTFvaE9jLzM3WElZb1N5YkRGTk53S29BZEF4WWxQZW1I?=
 =?utf-8?B?VXpiWnBMRUZXRnkwS0dkbmZneEdudFJkTGhGaWRrRXZNMXlTS3hCa2NkSGc4?=
 =?utf-8?B?QVFrOWF6SmdETWFuMENMVW8ySTJXWlZlZytFSmVlWFZFWmpmSis2RGZmMkxU?=
 =?utf-8?B?N1NCYkU4QjFqNU50cDZuL0ZQVWFKTlo5QTE5QXVHRzdvakpwQzh6c3hoMzl3?=
 =?utf-8?B?dUdMK2gyemQzNjlONGZqRVBLNzY1d091Q052ZDhMZUhtdEpjUDVpcjlORW0w?=
 =?utf-8?B?b2dFQTR4bmxteVBORTA5Q0dhT3ZCdnhwOFRxWWlnUWxHbmtOWkN2dHpTa0Fl?=
 =?utf-8?B?aUNTQ01qNjlGeWdrTnA3YzJrbFJkRVpzalBDM0xuNkYrVUNQWUV3VnI5MjdW?=
 =?utf-8?B?cXJOM3cyT3VkVjNoRkdIeExyRXBPMlFlY0xFN09tT3l6Zk5XaFphN3czTmtT?=
 =?utf-8?B?aGZ4MHRVS2hKVWNka2hlOFNCdENEcUYzYXNQWmNtc0s4aTd2Y1NZd3hQVGUr?=
 =?utf-8?B?VktwL2NsR0M3T29lK05UUHJyUlFYeWxiSXJLUmZSVnFjZzJGVm03eXVOdjdy?=
 =?utf-8?B?a3BQc042K05iOFZFWlRFMGxoLzIrbDVVQTcrK3JjdnNZNWhJQ1k5TkNVdStq?=
 =?utf-8?Q?qmLMbV7dc7UarV1U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f6c1410-3122-45f2-2674-08da16f13f2f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 10:44:23.0423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zX3d9YSj7v3AfXUj2HMY3AEjZLrLtJoss4ZIkqxWAMirfn/8HRJDDBC8fCHkZEMBd4n/NjeixeZbsz7lZ3H/EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4253
X-OriginatorOrg: citrix.com

On Thu, Mar 31, 2022 at 11:48:51AM +0200, Jan Beulich wrote:
> There's no point in writing 80x25 text mode information via multiple
> insns all storing immediate values. The data can simply be included
> first thing in the vga_modes table, allowing the already present
> REP MOVSB to take care of everything in one go.
> 
> While touching this also correct a related but stale comment.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

