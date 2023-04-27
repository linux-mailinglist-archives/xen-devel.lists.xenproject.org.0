Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C326F0CDD
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 22:08:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527071.819283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps7tk-0007Fk-Nr; Thu, 27 Apr 2023 20:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527071.819283; Thu, 27 Apr 2023 20:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps7tk-0007Dg-Kh; Thu, 27 Apr 2023 20:07:24 +0000
Received: by outflank-mailman (input) for mailman id 527071;
 Thu, 27 Apr 2023 20:07:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=81si=AS=citrix.com=prvs=47455b11e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ps7tj-0007Da-FA
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 20:07:23 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c0aaac4-e537-11ed-8611-37d641c3527e;
 Thu, 27 Apr 2023 22:07:19 +0200 (CEST)
Received: from mail-mw2nam04lp2172.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2023 16:07:16 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5881.namprd03.prod.outlook.com (2603:10b6:806:11d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Thu, 27 Apr
 2023 20:07:13 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%4]) with mapi id 15.20.6319.033; Thu, 27 Apr 2023
 20:07:12 +0000
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
X-Inumbo-ID: 1c0aaac4-e537-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682626039;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oGkNY0Q+NnWyGPPLZkgocnvJltkWbQ8KlFQUNknQAHA=;
  b=hl1M9MxOKmGCLFyZx0mELpdbnFeklYed5/9lhR5NV9l/TmykB6K31Lbt
   fvMQuJli/OFNGmQVr5TBv37buBlbKS4qxHAk5xx6cbo3Ia7n8rRb5h4YZ
   a+icOFug7V5CtbMHQS6fYlqLp0t+9SLyVYq1H0zALls21sAGcUj9whdpO
   s=;
X-IronPort-RemoteIP: 104.47.73.172
X-IronPort-MID: 107539113
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rVa2l6kkFjD4/Sifm8Whlg/o5gxIJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLX2nXO6mJZmrze9wiO96zpx5VuJGGnd9nTFFo+Xs8RCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aWaVA8w5ARkPqgX5gCGzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 awJCm4Dch6vvtL13rKxTNlcu9QScta+aevzulk4pd3YJdAPZMifBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVk1c3iee3WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTOLlra8z2Qb7Kmo7FT0oDEaf/sGCkGGgdshAM
 HQTqjs1sv1nnKCsZpynN/Gim1aAoxUVHdRZFeY37AWQ4qPO5kCSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaMyUPMXULYyNCSAIf+sTiu6k6lBeJRdFmeIaqg9yzEjH9x
 RiDti14jLIW5fPnzI2+9FHDxjez/J7AS1Zp4h2NBz3/qARkeISieoqkr0DB6upNJ5qYSV/Hu
 2UYn8+Z76YFCpTleDGxfdjh1YqBv56tWAAwS3Y2d3X931xBI0KeQL0=
IronPort-HdrOrdr: A9a23:LO/qEqhL1PgzNToDV7fD7hTGbnBQX7x23DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK7yXcH2/h0AV7EZniahILIFvAZ0WKG+VHd8kLFh41gPM
 tbAtBD4ZjLfCNHZKXBkXeF+rQboOVvmZrA7Ym+854ud3ASV0gJ1XYHNu/xKDwSeOApP+tfKH
 PR3Lskm9L2Ek5nEvhTS0N1FtTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y1zwoTSDRGxJYl6C
 zgnxbi7quunvmnwluEvlWjoqh+qZ/E8J9uFcaMgs8aJnHFjRupXp1oX/mvrS04u+am7XctiZ
 3prw07N8p+xnvNdiWeoAfr2SPnzDEygkWSg2OwsD/Gm4jUVTg6A81OicZwdQbY0VMpuJVZ3L
 hQ12yUmpJLBVeY9R6NrOTgZlVPrA6ZsHAimekcgzh2VpYfUqZYqcg68FlOGJkNMSrm4MQMEf
 VoDuvb+PFKGGnqJ0zxjy1K+piBT34zFhCJTgwrvdGU6SFfmDRDw04R1KUk7wM93aN4b6MBy/
 XPM6xumr0LZNQRd7hBCOAIRtbyInDRQDrXWVjiYGjPJeUiATbgupT36LI66KWBY5oT1qY/n5
 zHTRdxqXMyQUTzEseDtac7vCwleF/NHggF9/supaSQ4tbHNf/W2Gy4OR8TevKb0rUi6paxYY
 f2BHpUa8WTWFcGV7w5mDEWYKMiWkX2YPdly+rTZGj+0v4jCreawdAzI8yjUobFIHIDZl7VJE
 clcXzaGPhgh3rbKEMQxiKhF0/QRg==
X-Talos-CUID: =?us-ascii?q?9a23=3A8cVXDGhUvR+j7+rt8tB30PPfnjJuImz/knnMLWO?=
 =?us-ascii?q?BOSV3SLeTeW+t6JI6jJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AeOnXLQ+UXQlSrxtjT6M61QKQf9pI3f2zLB81qo8?=
 =?us-ascii?q?ppeSeKjdIPGeMlyviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,232,1677560400"; 
   d="scan'208";a="107539113"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WKZltyeyLy1HTwThCCjicI5ya+QDVhFkZ5K03voTjdZQesDYGV+9JP5vX+4pj7LkgmNokj9jia8QN2qyq4nAjlMJGKm3FvQevbWoYdjJ9DXrjUpHeovwGD3RcWkjmEYruzpRq3E763VLIlBkZgdRHYv3ehFitu0dYaSO4mywz90q+8iiBme6YKFywAxJLzf0j3zWJPO7SrZmh4nIJVf7rPvpPGxAOIq1JsdfK9vuNJ+Vc/2kgt13SGdQtQ2/umjGWTAumER4iMHqgiIaVj2gq7/YMCtHwUc/2g4dzzvflyUTKGGAMJelgEOsLx+jJ7yon3g7O5/sEnX+LLUvuvcycg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AVOa7NBV5cC/pxdxzos/UkaHUaqLqsFBVe53H07fLg=;
 b=JdRZcMEazuIBlQr65mygBro5JY87/Q1yv+1J8M7LT84sLplnWpMowR4Gx/jGHHz1S/QFHkjhHFuGkxHvT8pea8BQrKD15MTaMSS3Yo/MztcFIcBldpU0ix3hFlQ1ftPizDbXcH57IBp7XuMR7nlHkVGpqjMGdVCj7n1CMNM2HgFLTRaDAuQNXeJbbAkGZnTtABHbqGyRHRYNFyOyDSQWSRd4y/2KlfBas+RAPqNgSpxRXJftBrjxxsx73qhrWhCw+5eOL0ipoZZxqhDLLxwVC2jmXHM3LGNnhWfzX3AutqCECtauB1fPwVV4YqGQhji9YLjbFpLhe/LWdQJ6ZItlpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AVOa7NBV5cC/pxdxzos/UkaHUaqLqsFBVe53H07fLg=;
 b=NvlAsO13KmXbWaiESij8UzV2gsrK2Fv952XuZ0aUZJLA/Yl75TTdcc67/SNjgkJMtCV+0uZC5cYq7OK80t6LHXru1Kfo5GwvVmHyGWaX1U7iCM5Mra2XBZY2/dKq4DKBX5ypquRRNrVKU3pBtRMOxqpv8VaLzFKgIwI92C/vk5g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <29317463-a5de-2a5d-e217-498d3250ceae@citrix.com>
Date: Thu, 27 Apr 2023 21:07:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] xen/misra: xen-analysis.py: fix return error on
 PhaseExceptions
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com
References: <20230427132559.14712-1-luca.fancellu@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230427132559.14712-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0251.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA2PR03MB5881:EE_
X-MS-Office365-Filtering-Correlation-Id: 41c6c73a-b5f0-47aa-f086-08db475afcd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wBRhdky4C3DAwPWCfKAvkbFZnEjT0DZLqupzqazTXmBvQVK/RXW8LLxUR+ZFuxkBsGisJKX3CdxobDq7j4sZxrdbmGKyqcjFpmrLrFl0ZZpLDoVg9r3FamJfexN/XkiQTRJJCt4U+aBhQH6a6C+7ylqti0eb8CLhlfEiOuN2XfxW6llRM6UdV4XDreKZbTXNdPIg6ovyrmzB8Ff8/8tFQg5WD4rZKazI0Pm+6LS33pyYmErZg7Q4/pl1OvnHHUgW+XAttA8HEkDssxLtPNoqh+hvs9OXws6hH14fQETsBxA4PhgQC7q0h82HX0nNsot+DssLUQ1RfXrjlayhZBW+YsD+lNKaP68PtRGYWSgSXHGbDRvN13MiNjZCuot5CasJg6n+HGHNaN4xTiuvoROK3xkpY5i31tGD5It4/jtUnWD8hgdFd3VjBBdT21PnVjfRtyJKgZsA7gG8DmPUQNh7xP+T+1wPjhFQjmEXZ5xOJXZfR1GDa93IM4CKfg5UclJKSO1ZldUTecVt9pFdmUKLq+0lkaFQP7c0meemrHALLRzUr+MwrgiqxGG3jO2SEhVGsmxxHOYgJ7sOgw1B3U0mX+otsIPYAu/vdY/wm6+lEy/otY5HinjIdI8Y3y8rAa3uiVmA13ja0aJwZ31pbjCArg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199021)(86362001)(53546011)(41300700001)(26005)(6512007)(6506007)(2906002)(5660300002)(8936002)(36756003)(8676002)(31696002)(83380400001)(478600001)(6486002)(186003)(38100700002)(6666004)(82960400001)(31686004)(66556008)(66476007)(4326008)(316002)(2616005)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlZWeGV2QUlCSFpySFYwM1dzazBTaEkwcWEzV2RSU0ZBcWhqTlF3ZmN6RHFT?=
 =?utf-8?B?bE9oRytXeEFObklMY0pZb0JPNDZrU3lJZUZDbDNZUGNXMElzWENFdjdadkVm?=
 =?utf-8?B?dmJmZ2RwcHJldUk4RGJLbGRueXNJbFNtZ0U1SEtDaTg0SFhaMFFvNGtLOUVP?=
 =?utf-8?B?Vk5Uemh4bzNOUXh3bVlnMDJnUFV2VUFnUk9MUWhQSlpCS0ZvNzd2b2RVUEpG?=
 =?utf-8?B?NUllcmkzSnN1U3BpOEJLQlNlbFBvUkpxcTBsMmpBQnpWc1o0ZzQ5OEtiYW4z?=
 =?utf-8?B?QUJzQUYrSVdmM2U4NDMvUkFUTHNEb2EvRWwyTkgzU1d4RStuYkEyRWtvZjg0?=
 =?utf-8?B?dXQ5MGNBSGlvZXdDelJ1SHQ1Z0YzK2pJU1FKbi9ydFZGNHlwQmE3SlZTNlB1?=
 =?utf-8?B?MjFzQjNwMUZsSG03SzhINm8rREF6QWt1dG1RR01yem1kKzRoQ1RTamdlWUox?=
 =?utf-8?B?bitpYTJDQXFpNFBaREowaTRwSG0vdlRHVHFidGNrZlh2V0ZFZTM5VFBtN1ZV?=
 =?utf-8?B?UXBGTXlia2FtaGIveGFmWG5kS0Z0QTNFTEt2eHRMVVZOQ0tzODVpKzk3NGM5?=
 =?utf-8?B?Vk95OUVuSnQyajlLY2ZkOVZTMVkwd1J3aDRPYzBFWFlzQXBBSHBHUlhZSlJl?=
 =?utf-8?B?WFBWVy80dG9hd0M1SFBnRlI2eDhZcWgxaGxaN1VQeENVbU5lTEFKc1dCNzQx?=
 =?utf-8?B?ZzV0VEFQY1k1d1NtTnQreFNwNm5QdG1JUVZYVXhBWTA5U1U3YzRDNVpvN0Za?=
 =?utf-8?B?dFQweG4vTitYOHBWY0hBWGJVQURlU3M3ZU5TNVFaSkRXL3lqdGIxZFEyaXRS?=
 =?utf-8?B?b2tmNjdOdGpKZ0ZZOUhlYnBSaUZucDl1SGk2MzIvdHA2VDFkQkdnZkFTTk1E?=
 =?utf-8?B?RE9pVUswOGhEOHJMKzlxNGYxK2VrdkJ3d2sxdkxjdWowZ0FCRU56RkZZUXhy?=
 =?utf-8?B?c2l2UjIxSzlWVXlSUitHbXJrQlpvQWRRREpiLytsN2tSVHRWeU5kVkJzZmNB?=
 =?utf-8?B?Zkc5YjliVkFSVjdVeXlLYlkyUkdtWHB0TWJjUlpnZmhncHZNcEFmMkRLeno0?=
 =?utf-8?B?VUJNcWRIdXJyY0IzZlUreXZ5OXFTRGNoTEUzaEVGOWZraHdJSE12WDVWZit1?=
 =?utf-8?B?MFh2dUhhN212L2ttdVN1aHltSFlpRitGTnZYOVNjQ3VxdnIxeGJMZzRTdGl3?=
 =?utf-8?B?bEFYbFIvc0VKV2U4Vlg0YnZHeUYvblBnU2xwRWIyRWJNUUhuUVpKTWhqVm43?=
 =?utf-8?B?b1FKNXlyTnVzUHRmZU9sL2l0dVByQ2xBSUxYVGhhbyt0d25yNE84amRGc0Rk?=
 =?utf-8?B?Q2NpUnllZFZ0ZlVBZG1CdGFpQXp2MjhYSm5EVm1ZWFhGcVZGc0RkcW5XV3A1?=
 =?utf-8?B?dERTcHhrL2xhZlowc1hjQ09ManY1Um9PRXZ1M2doajcwTWgwQ2ZBYmVhelA4?=
 =?utf-8?B?YUNJMGlEVXJOVE9OUjc1NjJMR3A1blJzYk9MNDJicU9pVjdTVGNHT1JDcktr?=
 =?utf-8?B?bm5meDRBTlhUTzF0VmZDNEJ6ZlFuSjYzTmFrSE42cTdoZ1pQSEtNd0w5Z0o3?=
 =?utf-8?B?M3d2M1hNSCtCUE1zN3pPcWpFQW4rUmdZdmZlZkQvK1hQN29MOEliRDZDTVdh?=
 =?utf-8?B?WHlZM2piSmZTTjFJUlRTV3U0WHRFbkk4dXU4UCttV2dsRWV2bW1XNmovT09x?=
 =?utf-8?B?dDlZRDU1ZGJBMkduOFJaZHFrUjNZUVlENjNDWXRvV2xuMlhia1FNWURFdXBJ?=
 =?utf-8?B?ZzA3R3dQS0F3WjcvdS9aTkkyUXVGYXNLaTIraC90U3I5dGV3b0xvdUJUcFFq?=
 =?utf-8?B?NWp0bHliWWFuc2lsZldWTVNKRVFJN0ErZ2FFWlNoc2gyY3YrMCs4RnI5b2Fq?=
 =?utf-8?B?K3ZkUzYwUlFUaFA5Z0VkeStzZW9YOEdCbmRYM1hUdE9LSXlwY1NHMm40ajVO?=
 =?utf-8?B?WWp0UGVEK0QrUFZDNVI3Y2FLWS9VUWFBcy93WGNTNHB0VFRQWmtER2dCWjVT?=
 =?utf-8?B?ZFFXblRkeXlzMmlnb2NTM0xZUk40dUhyUTdhZWVkbHVyQW5JMHB6NlJyOUo4?=
 =?utf-8?B?ZEFJYnN0MXdnNUZjMkw3TWo3d2lHVlc0MVBPVjFvQ1VjcDdRRWgrN252cldl?=
 =?utf-8?B?L3c3UDNkRE4rU2dXOGJmdkFNTFR1TFNiaDN1Zk1WalQwNVRvc21SRk5yQmUw?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aAn3CAWI6LF39Q4s3Upzi+OoE4aNsvkgLL7yKem6LbemTiHtIvd2yi/rXqn6yy41plvibTaEQhL7sXIPxrHEm73y1Waz4oW+Ig+T8sVaTrht8bzaodsndN4HjyxaJGeq7ddQ2BjjF2mkVG1/otJNOhlhSgMJm/hRsDTyd5bnGyRHy+uPNynRAkphBczyegb1zFo+D63jEy4cNkzOQAdyv3sNFTk2iso6T/TgufH11dn3Aj+pmGcmpsWbMr5fxlcq/tKhsCRgJIAMPT961PFM+BNfdr71xZgf3cfbEnhW7BJ5jGYTc+acK9b+KyIrcx6gWM3k4a8xgAszvtqwKVw1RlE5oLIril476+nUcoKSdYxNGbtTgzxr2jOLAIVaAolXS02tJI+DmIFc6ol99LBaOEhq/4wlnYpJrCwhr5t0ncT84f0WTkqbiWbJdZ0H9zGTgpZgTsOsbBItmhd1kBMCkqm9o9Qj+SJal//7h7uDIFfo8u/D6cRTmy9th81Zdl6DwCKr5Cq65SqqPJsbA2n2gqHqnSD9b6qCj6xRoCBhWAPkqqoz0PI65ranx3R6wlGcmfiqZgbmqdTR2kYfS3A6T/L4pzR2nTFO+YwZhNxIbWbr953BmptEmjgUaadAiLEPEIPIWFoFXzs9VuZNpQVyMTyg9YePoYfgH9kIqJSCL4hn3SOv7D0GcXtlFQgVjHJvwPnRrhB7g1zKjCOrJkjP+Yn0Cgy/r1RStAs8o1qjIsgj/FqxadushtL6f2AdbTKMQZj5Bgk7ZgUfOSeB1Cpb4JasLJST1O2S3CVh4EElAEg=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41c6c73a-b5f0-47aa-f086-08db475afcd4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 20:07:12.4348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oCSHQvhbr07IB1eriWkW5fu5C1Z/FeD2NDNBZe/FkFVi2FvDY9TVM3+d7/EeqmhYxIVK0W8ovK5SKK3VxM32xAGSFFTSPOEn4DrplzZyPdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5881

On 27/04/2023 2:25 pm, Luca Fancellu wrote:
> Currently the script return code is 0 even if an exception is
> found, because the return code is written only if the exception
> object has the errorcode member.
>
> Fix the issue returning the errorcode member in case it exists,
> otherwise use a generic value different from 0.
>
> Fixes: 02b26c02c7c4 ("xen/scripts: add cppcheck tool to the xen-analysis.py script")
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

> Change-Id: I1b76b8fa4668bef49da3282339fca3052e3379cd

although this doesn't look like it should be here.  I've stripped it

~Andrew

> ---
> Changes from v1:
>  - use getattr() (Andrew)
> ---
>  xen/scripts/xen-analysis.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/xen/scripts/xen-analysis.py b/xen/scripts/xen-analysis.py
> index 8e50c27cd898..5e8f2910cd72 100755
> --- a/xen/scripts/xen-analysis.py
> +++ b/xen/scripts/xen-analysis.py
> @@ -26,8 +26,7 @@ def main(argv):
>              cppcheck_analysis.generate_cppcheck_report()
>      except PhaseExceptions as e:
>          print("ERROR: {}".format(e))
> -        if hasattr(e, "errorcode"):
> -            ret_code = e.errorcode
> +        ret_code = getattr(e, "errorcode", 1)
>      finally:
>          if settings.step_clean_analysis:
>              cppcheck_analysis.clean_analysis_artifacts()


