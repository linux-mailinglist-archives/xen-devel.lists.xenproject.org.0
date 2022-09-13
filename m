Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9025B71A6
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 16:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406462.648856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY7FX-0001jb-5w; Tue, 13 Sep 2022 14:50:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406462.648856; Tue, 13 Sep 2022 14:50:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY7FX-0001gr-2M; Tue, 13 Sep 2022 14:50:55 +0000
Received: by outflank-mailman (input) for mailman id 406462;
 Tue, 13 Sep 2022 14:50:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lgvl=ZQ=citrix.com=prvs=24889d1cb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oY7FW-0001gg-1U
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 14:50:54 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7557d3d6-3373-11ed-9761-273f2230c3a0;
 Tue, 13 Sep 2022 16:50:52 +0200 (CEST)
Received: from mail-dm3nam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Sep 2022 10:50:49 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SN4PR03MB6717.namprd03.prod.outlook.com (2603:10b6:806:1ec::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Tue, 13 Sep
 2022 14:50:47 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e%3]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 14:50:47 +0000
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
X-Inumbo-ID: 7557d3d6-3373-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663080652;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=oXgEM/dC8I13s3+hejb49goh+TWzqq46wAWupbDUo7A=;
  b=fPczW612FaArP0iBN0q0s4ppyGLAEHQivVbmEipx7oNUmMxaw5zJKASd
   ec99xKQl+xdVGO3OYIyM3/MNyKGW0qMBErbGnmCjjOpU+ucBzBEUthJAq
   uwnuslTafhjLHu1TKVig1MYZu3XA1C4NUclP7dKH6ukr915uumlL4PgRs
   Y=;
X-IronPort-RemoteIP: 104.47.56.45
X-IronPort-MID: 80398874
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3Axfh5JK5INpBV3DnwmtAKbwxR2vbMJdrFRiYv2?=
 =?us-ascii?q?zbJXl9qXhvvpoCK3Hf2+NmzPBGOoPRMvK+3Egw4zW5/0hKst7Fcx0yhoI2WS?=
 =?us-ascii?q?ZuAqXOia4AVNskEZGj0w74dKT2LAwGZG54l6FIS7U58JRVuLLKfz6SH4CaZz?=
 =?us-ascii?q?6SPDOGfZKtqw15gxh3/zNLIDiuxjggI8MgTerAhRDrBm5LjXdy/ldi28dE3X?=
 =?us-ascii?q?bu9Jea9ntmGP5XvGRBzOo/gGo4notYLlhw30KmXOznNODuBqT4gjlv2ehEnR?=
 =?us-ascii?q?VTgyC06lpGniydkZ8daOAJ224WhO2SUnabrG9ZeJED7o7r8cL5xHgBTOQftS?=
 =?us-ascii?q?3eubJVYRHNqQnxvbVlKtBe+sWRqcQw6uWtAWm1sk16CK5dLsN992zZ6TDNgO?=
 =?us-ascii?q?bZ1NAwgoqyxKixXXzoRZr/A4n8OpWgARHw9di6KvKnLBs7oiTtCQO4e+UnHG?=
 =?us-ascii?q?FMFLayXxFXLOfVa81k54fSzOH0y64x1/A7Q8R3A+Ss+CzDCQkSzm7iaN/Wbl?=
 =?us-ascii?q?9y0J4sjb/Z9nBD7l5yvsCc0ZEaIjjYzlawYoDGbBDl5FClKA07O9vI5ZrewN?=
 =?us-ascii?q?VtC1CRW6oBqISmuPrj/gfHKBXnQke+bHq1e6xBccwqoVKJlvF9k6F5FBBu7t?=
 =?us-ascii?q?nV1x+05KRlbEPlfHcl9XhFX7jef2cAJtqOgj5qv9ZcDyzehsRmsuOK+Q9FrE?=
 =?us-ascii?q?vTWmW5tXAQqAkXkE32RRPC/XjhLULTcdOhqa5kDknMu46SFqsRocx68G0sd2?=
 =?us-ascii?q?UQews34lOBsq/kYI/Q7wcjrX0nBE1oTyjIxRfFsYGFtxcnk3+wnJqmrq9MSt?=
 =?us-ascii?q?LMkVwbkLbS8vNim+dN7K9AEQWImk7U5ZN9onwMO/SscSsFeOzuQOm8SCZMy4?=
 =?us-ascii?q?L/vnIBWqyFhPrLZpK5wjpOoTy2tAzG6vWZXPCmHZ+jUOjbIdnzUvHW5/z1qH?=
 =?us-ascii?q?Tw0bZHlg6PZ5vKDnAYolLtaA+o8YPhTNcoh/DknkEHJpIAINSp2KqRPfEE1w?=
 =?us-ascii?q?Kau/pLRmLU7zr/JhQus8NvBWz5izY8sXMmzg7Swe89H/2JXIs4M2v3Y+oFmo?=
 =?us-ascii?q?iiLTtT40vU7GaaKokIwgkOdhwymjs2csePhxcq07YYqiy55NzTLRKrsoNrgv?=
 =?us-ascii?q?vWldqi/33JZyrYofrVm17QzeyN+p57KI9/KciqXLbOLzjd7Gf7BzLYWhYzGL?=
 =?us-ascii?q?YoObiqMfh6o69X0B0vqRR1M1AOlllgFJR1A1haTjuQUOe0DhCzlztjMy/SE/?=
 =?us-ascii?q?ZUkBaJEisp6BHFNmBxh6LcyNyjQGJICSWgbrpBRM87WK17I5th91qInmkTuL?=
 =?us-ascii?q?DviaWAlkAqeMngvOqJfz/bbcmdkU6hk8VJmzWfcfaQaiCjvS1IOf1Hgpkzjs?=
 =?us-ascii?q?R2K5jk+CSc7wqsvZe/4fgZoDdPMcz38AZv1D5EeuKrElJtAW2NE817J3DB6p?=
 =?us-ascii?q?7wHmsIoX8RVjyQTZTHZYYB9B8+SZbME6FwI7Ii03hC1pCqdTrkweINlN/vC+?=
 =?us-ascii?q?Du8gwd7tkyyXJb9CGFuU88fHYGQOsbggabogxk/zl5NfOdzPOfEn+aDvKigM?=
 =?us-ascii?q?AVzY3tox4oYSorn1Yh7HYlD0/qiq/dKIOOBx1W9h4d9RRPRaXoRPcykeZ4UX?=
 =?us-ascii?q?KUjfvCCVYXcvudSJWiluEpWCLzZLMcVoiKGqFWpje8CRC0CYAkn0lMUP7qU0?=
 =?us-ascii?q?C8HFefkUhTTjEz6uye1rce+BrASIemUNBK1Rv9g2NNHi2rHtGvDLBTIh8euN?=
 =?us-ascii?q?zDfYSiVNE+IhvMM0gTWtw1GbK2yksFAWwjL6+cjyPiXWvCZ+Tg6k8pOOXUxA?=
 =?us-ascii?q?+ZsWcANEeTj5tFPoxtjtsz6NNLu4Cpraq/GWGZ088QUyLli6ZsMzLI+Wp/a5?=
 =?us-ascii?q?a0x8BO06jSU6Rt6ov7ejzGSKjxUe7MIbOH36xVswGPHQ56lx/D2RfFwW5YJh?=
 =?us-ascii?q?u9b4Y8jah/BAPfi04Q2G01ZFvp/izX6tpEeKRoIQDbepRcbwzq3reqlK8bMd?=
 =?us-ascii?q?/UR3b32YdCwx2oh5Ch1ak/bcetjagFU11JZL1lyCKh1wohkUMoUoCz9u8NeY?=
 =?us-ascii?q?IKU1bF4ZjtZFbW8Tk8qKgpZqLdBLAbMJqO1MfhYlm5CbmygYnReQgMnxHTHq?=
 =?us-ascii?q?o4ZrTW+yPdtmahYklXDfFXemAMlZrv1LrqxDfu8belZmNEX4lms6OO6sgF2a?=
 =?us-ascii?q?GL/uJQDOQgPN30RKFj5shQ2dOJ3GvQwf4UvAy+F5DFdgqnolh+nAYO0pzyRi?=
 =?us-ascii?q?N58cEpfnD4UH5ayxPChNu5cbJ0bLxUuRm3DfFtMjUsjgvU5HPQfSP9a3O20R?=
 =?us-ascii?q?M+8HFXi2WtxvydHP0Xp4oghXSeoVtttyhmFzYc6KGhcgr86R0d549TvSo3K2?=
 =?us-ascii?q?WNGFLWZ?=
X-IronPort-AV: E=Sophos;i="5.93,313,1654574400"; 
   d="scan'208";a="80398874"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WtiAaPke35y7gFzu8QoGUuc5RxEM1uIX8YjM+kgDIW8xBQC67vzPY9bCbrIGdETSMCv8zg+rI66kqQOzMzT8/JZY93VQ5F6wOL49baeLx9RuEyWMrj29QLgvFEi8kzSXIDBUlwZZQTTX8VYjioRLSsjKF40O04XpRxyX7Pjg1mdtTW+U5mFhFxcC+EqIuubbpmRzzDABQ9RjI7N7T1XRrutsBOuXtBkJY7rF0p1aPhJFB49N0VQmYDoqPDoRaPADSrwMgiIBy74X+tCj4qoM6Rj7/igAIWxh3A3nEnL6NCHWXXvj6XoQRqG9YS2vz+6B68lBH9eD1x8/0mlf0KVwlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXgEM/dC8I13s3+hejb49goh+TWzqq46wAWupbDUo7A=;
 b=JnojP1ncq8vEN+CnEPFAWTqa+p54TVmlgLf+c41R8od+QIjH3EuhQ0tZ2hvnMXQsyP3N/PfmxzjKQ3icPfrrcV8AGot7TqizJbssXYldVhxG2Y/rpTqu7K42vPGKvfHWzzHt58GsDzHAFayRDVFH6cV9QmN5ddBCy9F8aDdN/a4OCFteTjOEnihy29VYIYSxmY9v+zExdR3zaujJ50GDIbKmntJVHCF9OVQyYuRdD+f8A7iHapn4cPN6EwlwJ0B+r+PTEcBGR2O5bElhL597rM/bm55rpfvH4r7FGhkj7YABq8r5c+E66QVb3RmLClxFMJBaUBlYy/shtlirgbuN6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oXgEM/dC8I13s3+hejb49goh+TWzqq46wAWupbDUo7A=;
 b=Ivh8gOqb3ZkwchpB7c62QDET+cS6azGSk8QpP5w9hYDAFXFFuSfhZkNbL5Lq8jG2bGXnpt2BKZ5KLtMvhnock6gSmPZqsabLMbXSSCbCTt7T/7t2wV0p0ycRVfPVEOvbEHa8im/93LZemukm09vXR7JUN8X3EQijtI6Enrhilm4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 13 Sep 2022 16:50:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: enable interrupts around dump_execstate()
Message-ID: <YyCYw6Hi0jVg0L+6@MacBook-Air-de-Roger.local>
References: <e717897f-980d-ad44-31d9-39f5e7e1c45e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e717897f-980d-ad44-31d9-39f5e7e1c45e@suse.com>
X-ClientProxiedBy: MR2P264CA0033.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::21)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:EE_|SN4PR03MB6717:EE_
X-MS-Office365-Filtering-Correlation-Id: 76e39e84-396f-4440-7f77-08da959757c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aPdVMgBTk6cUEp0ohQ1enrRi8yHa3Jg/oSs0GKdFQ+izMgXnxiePtehYZkMv1Rj04ZgTljrdJBb7splsaHXqgPdG8thk8iFJZ6F1hCqO5QZktJ9ITk0iyjk9Qqwd0D+i9ubnwe+lXHTsMqJjEmIriTNYEaGqAk3HRxeJDUwxlLLJ9ckhV+j5gLxQt0k7Tw9HgdSGGJNj8BfrjM2YkXO3B5zMLrJLvN3dxtFEErBrryerQx1zO3wPRpJJCC76uRXFUjO+Kn2dErQvIMVmv1qRAPXXUXVGzVu0W/T5Q5sbB+Sb/1m8aYYGwslmKDQMQx65BoaVbV9mi3tuZppY4IM+yuzBpgahrAQ/Ma8/++060TYmkycjEPo0BSTep+/68rLrCwq6IqkqzwJierSZiuleuqF0QvFYw74XMqYYg/IR185MZQ07FVTbEK1bJgeJB0Lt3clmPrJBYTIykwOvSWj6PoVf2nZuf3vPjFBCdaya2Wj2AtV0byX0fRggqYa8CTaqAAXoJCumIFGbcqfbugYqwFKXc5+rvAI6G/JLg0bGMOl/2RWbyn+3+bgL2mpXRgCmKDkeNyxgULltsOmr1oQJyOgcbZVJac+Wzg6okQMPjTa8VW9mBw0MPfk2VgOtYG6xlrx2qrRxD+zwz9WoJsKgF8CcTJh63Fn96u++bQI7DWvHp4m8Edbkp4UklZtoNUXxLsffnA0YDOHY9LmVjDz477zSIpc/pii4LSBMpdUJnFmcfGuZlzJSx3hVomqtnMel0lRUREKUr2gSF3zVDu+lRQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199015)(6916009)(2906002)(66556008)(5660300002)(86362001)(8676002)(6666004)(478600001)(66946007)(316002)(26005)(4326008)(82960400001)(6486002)(54906003)(186003)(41300700001)(4744005)(8936002)(9686003)(83380400001)(38100700002)(66476007)(6512007)(85182001)(6506007)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1cvYzhyREF1QUJJMTA0OEg1QmtLN0V0RzBGR1EvSU05UGpFNU5xbmttQ3hi?=
 =?utf-8?B?ZGRucFNsV3NZQmIva21QcVhvMnBaYWJ2ZCt5QXcrZlBtcEU3WXRDZjVOODdG?=
 =?utf-8?B?NXZKMGJ1UnpQTy9JY3JybjVweXp1bk50ZStCQ1ZLK0RtWi91aW5yVHY0S0Zk?=
 =?utf-8?B?OWlYcTFpOFdpNll2a1pZTHFjY01ybmxSaTB5b1pQdGZpb1gxMG93WHYxcjFC?=
 =?utf-8?B?ZGYvMlZid1NhS0pLZDhPemU2ckFjS2xNUkdvQnFVVkxaVjFvdDgwMTJ5V09r?=
 =?utf-8?B?STdMaFdZa0Y1NkVLU29jUEYrRHc1QXM0VDU0UXV5WFhDR3B1eG9yV2JJUFg0?=
 =?utf-8?B?Q3hpRGtwUWljaVluQ2NGYkJNbjB6UVBXUjBTbE9zdDliRnlWZEdldkppVFR1?=
 =?utf-8?B?ajNHVFc2YkxMSTVjWTlXY1FDcFMzNGY4Nm9xUnlYbTlkQmhGb1ozdE9MakRj?=
 =?utf-8?B?TjBZQzFtSm9ZQmhhRTF4MTVqWVFGa3dVQ2FyQWF0ZzlSVGRTSTQxdCtUbWoy?=
 =?utf-8?B?eDdjTU9yaHUwaTJrcUV4QnRuT1A5U2RrSTQ4eVNGMmRFZXhodFEwSDhEZ2NY?=
 =?utf-8?B?WlAwZXlXVjV5VWtRbTAzUmluRE5odzJVSWdrUzlPdk5EOEZVR0M4VDJldjBx?=
 =?utf-8?B?SmFMbzlSdXdtMlVpNjBhMEpRS2R4SWVJMW1rOUdWOXg5MXhtNkkzK0hSdmNl?=
 =?utf-8?B?MExldDIybjlqUEM2Unh6V3NsK1VDK3Jsa2V4R3JRMTlxajFkL3B3cnhTclo4?=
 =?utf-8?B?MDFxSERmVEtpMzZCODNoMWg5YUhBUHBGSE96T25vWTBDVkNhNWJWSDhKaytz?=
 =?utf-8?B?eHdoMjI5Zk80NnAxcitMbHBOem1URzB3OVNzbDlJRlNBd2RIV1dEY0gwOXlv?=
 =?utf-8?B?czNXdkxQYVo4NTgrbnhaeHEvK2cvUjIvUDNuQjBxYWlQYm5waUNhQUFobkp6?=
 =?utf-8?B?bFh4dW5KUVdmbFFleEd4NVAvb0p1Nnk2NkMxLzZPU2Via01xSWN1Tlo4YjNY?=
 =?utf-8?B?OG5nMThXbmR4T3BvWVZxdS9jRTVjUVREWUdvZUh0bG81NlZCanU2OWNjdnFl?=
 =?utf-8?B?aWVwcWNyZnRFR2lzQkxnZG9pRFBnQm11dGcvL2xPQlUzcVN2N1RTSGpqdUpL?=
 =?utf-8?B?d1REK3VqZjBZSlQvZXY2UGEyQXNZL3NpTGJyUXF0eGNvMXFJRGxWN1RmcDBn?=
 =?utf-8?B?K2FFZHg3OWc2SElaaUJJVDVXeG84QmdpZDRpR0REQWV5eStVMWtjK3Zra3Q1?=
 =?utf-8?B?RWpIdVhuc3paQi9Id1BCYk9wSFBkeGFhcEJ2TklBUXJzeDNEUTE3Sm9odjFO?=
 =?utf-8?B?ZkUyNEtsa1dGbEtUNnZ1c2lGcTJ6K3lTL29MSCtRNzVtR0JndVlrKzZtWHdU?=
 =?utf-8?B?ZGVHTFJ0dWY0N3VZVXd6S2g3UjBpMVZLUE5sUzNIMlhEMXBpUWhZdUJnSUp6?=
 =?utf-8?B?encxM2doWFZ5YXRPMlg0M0VSMm1FV2JJQks3ejlNNkJHNERkWVNvbjRtRlVT?=
 =?utf-8?B?bHhyNU82N2VxeWlGZk9WMWdoc05CMTFTR016ZERTQlRXUWluTUpldGlFdmdR?=
 =?utf-8?B?ZjAwblFyWHg1dFBuMUduTmh3bUZXWUk5a2w0RysvSUV4Y3grNzNmSHVlQVVa?=
 =?utf-8?B?d2xaR2tsMCtBOXFReWRldnU5OTJEUDY2SUdTUjZjVWdZS2NsWDdIOHl4OXZl?=
 =?utf-8?B?WG0wakVhUmxMaGVmMlNiVk8zUU5nM3g4bUJRZlNNbVVDQ2xROHRwc2VkOGxm?=
 =?utf-8?B?SFgzY2xMdTBHaU1QclF2eGhybjlDQzRzQ2tSZk9jSFdTSG0wNC8xejJZZFZz?=
 =?utf-8?B?WGxCUzJyVWFJQ0F5UGZPUlhRYVFOUThOcWp4b0JCOWtrOWFOWG5zNWhZMnVs?=
 =?utf-8?B?emNuUUxVMDdTRktDYkdjMEtWMDRDQnVJMTl4d0dzYzJwUGw0WE94RWhSeHZF?=
 =?utf-8?B?M3gyUWlnSFh5U05KdFlxMjNsUzJ3UFFyUUwxcHk1QXNYSlpqazd2S1cvZ0tK?=
 =?utf-8?B?RTRuNm9CNkR6bFdKeGMzeXIyUERxZ1VMOEc5SVBjdUFvUjNYQXpvQ2hhYjhG?=
 =?utf-8?B?UU5kV2FrYmk5ZnRoRnYrTVo5MmdoUkN6Ky9TWHk5dlovYnNaNXA4K3NZVXMv?=
 =?utf-8?B?d3Bib3NBQk8rU3lBVmFNTmhXUm56U2Irc0lGWTE3c2NvVHZUMUY5MXNrOVh4?=
 =?utf-8?B?MHc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e39e84-396f-4440-7f77-08da959757c7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 14:50:47.5388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eyNnqIbv4Bc6RoP5Rs0xrTGbng7uPp6VyvCk1Sq1LOQ7jZ7B0osBFu1Ibg0CdoogcHxR6IljF6RaGLhLA4MuMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6717

On Mon, Dec 13, 2021 at 04:12:55PM +0100, Jan Beulich wrote:
> show_hvm_stack() requires interrupts to be enabled to avoids triggering
> the consistency check in check_lock() for the p2m lock. To do so in
> spurious_interrupt() requires adding reentrancy protection / handling
> there.

There's also an ASSERT(!in_irq()) in _percpu_write_lock() that will
trigger when trying to acquire the p2m lock from spurious_interrupt()
context, as p2m_lock() -> mm_write_lock() -> _mm_write_lock ->
percpu_write_lock().

Thanks, Roger.

