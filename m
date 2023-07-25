Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF5F761E0C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 18:07:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569822.890948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOKZV-0001OI-C5; Tue, 25 Jul 2023 16:07:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569822.890948; Tue, 25 Jul 2023 16:07:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOKZV-0001Lu-8r; Tue, 25 Jul 2023 16:07:37 +0000
Received: by outflank-mailman (input) for mailman id 569822;
 Tue, 25 Jul 2023 16:07:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A3G+=DL=citrix.com=prvs=56320e048=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qOKZT-0001Lg-9j
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 16:07:35 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c9362df-2b05-11ee-b23f-6b7b168915f2;
 Tue, 25 Jul 2023 18:07:34 +0200 (CEST)
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jul 2023 12:07:31 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH8PR03MB7269.namprd03.prod.outlook.com (2603:10b6:510:252::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.30; Tue, 25 Jul
 2023 16:07:29 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6609.031; Tue, 25 Jul 2023
 16:07:29 +0000
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
X-Inumbo-ID: 5c9362df-2b05-11ee-b23f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690301253;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=AUxdY+yMaqXwLb/PqgCbDwmaoqHnadfaQ2wNhDTrHy4=;
  b=PlECX8bjeAm7AuVUyTgfp9mNfa3IszxMgSM+KS5YLx/C9QrvzsmQ5LJb
   8iFFz1RZLNkVl52vHTRtWwOPLpsC3EKXEU8CgQ/EiOnpjgx4cU+y3O5iE
   U0CmqWoiBGZoTLdoQ3a8flUzqaErhVtz4gqMPsc7M/qauozOrcnh0I7CQ
   U=;
X-IronPort-RemoteIP: 104.47.66.48
X-IronPort-MID: 117410037
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:KffMHqB7Kx1WrhVW/wziw5YqxClBgxIJ4kV8jS/XYbTApGh33zAFn
 DQcDTvQOvmMazP9Ktkkbozj80xQ6pfQyIVqQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GxC4wRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwpdouOUxPq
 bsiAW42ciKegdmPzL7rY7w57igjBJGD0II3nFhFlGucKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTL++xrswA/zyQouFTpGMDSddGQA91cg26Tp
 37c/nS/CRYfXDCa4WPcrS713reUwksXXqpKT6Pi+t0toGeomGMvCCJLFgSy+sOA3xvWt9V3b
 hZ8FjAVhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xGWwsXjNHLts8u6ceRzMw0
 USSt8j0HjEpu7qQIU9x7Z+RpDK2fC0Kd2kLYHZeSRNfu4Wz5oYukhjIU9BvVravicH4Ei3xx
 DbMqzUig7IUjogA0KDTEU37vg9Ab6PhFmYdjjg7lEr+hu+lTOZJv7CV1GU=
IronPort-HdrOrdr: A9a23:khY9IqtnIF2MwFLJ0Aq8SXfG7skDXdV00zEX/kB9WHVpm62j5q
 WTdZEgv3LJYVkqNE3I9eruBED4ewKkyXcX2/hyAV7BZmnbUQKTRelfBO3ZrQEIcBeOldK1u5
 0AT0FIMqyVMbErt63HCdGDYq0dKQO8gcaVbDrlvhBQpN1RGtldBtlCe3ymLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3Au60Uu2gfoKTMe2SncVSOEUyktDJuLUGE9FrRfwi?=
 =?us-ascii?q?CIDhSVI+IT2Sp9K80up87?=
X-Talos-MUID: 9a23:efKW1QhQ0qk1SM8xoAgvuMMpbJx2uaiNT2A3qssJh8m7aG8vMmyntWHi
X-IronPort-AV: E=Sophos;i="6.01,230,1684814400"; 
   d="scan'208";a="117410037"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iheyAoISehwLSc/ZSxwn5jfio3chab3tTyJqU2dGDdzwEK1NaXzBTmX5OlbHukekj6Q8mERoXWSTNCEBddSXDRg046NCXpHpX7H4xtGiPaFB7bZRWftPw8VbYhrmt4W/bm6GoWII+zHCeqNj79QlI5k06IOeC9JwcZh2sp7s1RRR7kq0r56xxS6/ayiZ0N8xWp+uXQURIzLz9IZ04mehDqurnX3+52rjTvKlz/rBspsp04JBh8C/SLwHMfJCvFT1GDMZKrmzqAOU0IK2TLMU2eKDsvXZ6nsbVvrBNAQioMuYWpiyNSkm+v4mIa6eSyQRoAONH9C6WMdcJ0s3UzwRUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWt6rW5kl9y6UOoEZ/2TMh97gnV/HRaeV3GhylKQ9U4=;
 b=FpAJxSN+c061y6p83Hmf3LxG19LHUuh6OGawC2jpkaY7erg1G2UVMIuhUGF6MCcpTY7xAciKw5sLGWWvadxZk5jRJt+75rRpuY9aHP4OB6MEv+1LXLxvn57elTQZDWdkEtT2V6SAJnzJKkVyygYMaOI/yF6q9uouSlK0dBBulLmgdTKHTGBZ0AZzY7SqkksS58Hve+tXMwDQwFz79BexmHmY9aZ1Q5H3I+okwbAVLU/sqn9oe7e8mbKxvi1BmwPyLmAnH0qCe+RkcR3V+ge+RFF9IdQaR5aneGVPSTRLxx7t+3n/Bf+5NeITm73T1W28TVZcMLjA84sbT7ES6bBDyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWt6rW5kl9y6UOoEZ/2TMh97gnV/HRaeV3GhylKQ9U4=;
 b=WStA4hSFVWI2gPRpNlbQrSQ6nwlm84cbMS9ohVbrYrvBADXDPI174tNqIn5Tb+Mo19O3kMvFg7hmQbW+rvl86dLNVm1Q+WR9qUwDsMTjCPPjTw9L5LMDifBZrqvMIbJY0YPFAx7+rftrM/tQC5kn0xr6MOj0nVo8ynJLGh0RbHo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 25 Jul 2023 18:07:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 3/6] libxl: introduce MSR data in libxl_cpuid_policy
Message-ID: <ZL_zO5AqlldLYY3A@MacBook-Air-de-Roger.local>
References: <20230725130558.58094-1-roger.pau@citrix.com>
 <20230725130558.58094-4-roger.pau@citrix.com>
 <e906e798-fc5b-49c5-bf18-f2e07912a7a8@perard>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e906e798-fc5b-49c5-bf18-f2e07912a7a8@perard>
X-ClientProxiedBy: LO4P123CA0277.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::12) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH8PR03MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: ea9fcfb9-d4c9-4411-657e-08db8d293e9a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pbrE4roUkmF/yjcA50tNPuyiBgUPsDN3s6A4QnfjH6icIH02cR7G+0PqfEFYbJhDDYrlH4TBSp1gHviZRT8DowrThQdAj5TPKaO7R1wrsbkWkrTP7zAB8vVPazqMB9ab2IaP8qbAzu00BLo0rnKL7aS5iroejH1c69OUgfHQPmIiPSli7LPgKroWWfnPET26vQEqjz66PFWxlXF1wJM0CXB0BxSPn9cZ/o6rJ79HKNuzJogiIQXV1vE2Fb0iwgZVj+whwkcITcf/P9jXKUEVbXDVD8OPMTf4L//P0+w4LLQxgKPdO8ocOaAVjWxC+gY6IzfQb+iAPhbvgp02S708VqVYChsR2cAZ1h7xCr5C+T1str6UhZhd2I2PWoeylw1F/yTPceISWskfiJ4A0ZRfbEG609Lwro8QDxv+xj7Wslnm6n+a8A0XxoLCdVS9GdtP/Hruj+8tvcmSrodvePbsZJ1Zt16WqIYC98/LfbrBRbqEm3q0IlYOr+aYq6BleLm0YD1JORfXBojO18OcizJ4OFRdaGTrLtvkWqHw6fTlHsSARyiAsYJFBk+tX0O5kbQ0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(38100700002)(85182001)(82960400001)(86362001)(54906003)(2906002)(478600001)(6506007)(26005)(186003)(6512007)(6666004)(6486002)(9686003)(8936002)(5660300002)(6862004)(8676002)(316002)(41300700001)(6636002)(66476007)(66556008)(4326008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTdGV0FnanVPcnFPTnhuU3JkUERkM3RYcC9WRXlZNUp1ckJLNFg3TU9aUE4y?=
 =?utf-8?B?Nzg2U3M5Mk5jRWpxQjlMK0tKTVZuN2syeFp4MHhVOS9BQUxxZmxCWWVkTHJW?=
 =?utf-8?B?M2w4Zisxa2gzYVB5Tzkzc3hiZGpia1FzbllsU3VrREhubWZOa2l2OFlJWklh?=
 =?utf-8?B?b2ZycjVJeFlKZUdQeGRIcFkyNi8rRlB1U1VqZTBsT2QyeEVFOW0yYlFzU1I0?=
 =?utf-8?B?b2p4MXZHL3lvOTN5SVgwZGVzaWNxMlViSFVQTGNSRytnNmZnN0l3QVplcHZ3?=
 =?utf-8?B?bktwZlMxTGVWRWo0UGVJRU9YZFRLaC8wUE5jdWhSOVB2b2t1VCsyWjZYZU5J?=
 =?utf-8?B?R2EwVjJmZTdMY0VwbzRPNHFZMGZCYkU4WXFPR3FlRURTUWF5NHJQbWZEb1dF?=
 =?utf-8?B?aUdwVUVXQ01zeEhMRE0zTVpMR2d4a25TU3BvUnllN3dqUXByWmNZYWx1VnMy?=
 =?utf-8?B?RXBxNmttaHJqQzJ2enIrdVJaM1hCNmNSMWdhdkZVVDlCRFdtZzZFM3FpZytN?=
 =?utf-8?B?ZkNQdCsvS0ozMmFKUUwrTG52amNOVDBSTVAralA3SDV1WXFxRWlCdlJLcmV4?=
 =?utf-8?B?ODB1bzNFTTRsMmxmU3JhS09IVVBpWCs0dk40RERBSE5FckdhTTNEamdxSkhO?=
 =?utf-8?B?SGVxTEdWOVJzdzBjQTV0anJQL01nakwxVDhGTVlhUWJwNXdnZHF1a0orUUNQ?=
 =?utf-8?B?R0lvQ1RLWUNHYm9KUHp1bllWa3RMNWpaM2ZaK0J6aXp6VkhiT1F2TDBiUkFu?=
 =?utf-8?B?Rm5Gczg1eHNjQW4vbDU0OTEvOVM4c0V0T09SU1U5MDJQb0ZVc3hKUWNYSlFk?=
 =?utf-8?B?cndrR21DTnB4b3Y3RVJTczBRc2R0bitoSnRUSGc2VEt4MjV2eEE4WHBHRTFU?=
 =?utf-8?B?UHY3TDJ5cmJYZDdITi8zNzl2WlVQamFGdzY1NThjZ3JWLzJEM3cvak10V0d3?=
 =?utf-8?B?bHRjWkIzL3RjNnN6NVpubC9CdGhWVlhRMlJSa2hISVZGd045bkI5NEQ0ejZ0?=
 =?utf-8?B?S2YwdE5zdmRkRXBLRHZNRURVL24zTUZyNWVPMEQ0Tk80cUlrOVpPQ3RJTytp?=
 =?utf-8?B?WXNCM0FIU1NpS0duZ3FkUGZNTHBwQ0dFWE1hWjRlWXlwdG8zVmlFUjIrb3Mv?=
 =?utf-8?B?TitOV3ZhOTk3UTNOOThpeW1kYlFYYldnNmg2REhWeVNrOEltTXQ1S2w1Z1RR?=
 =?utf-8?B?alBxZXVtMnRpbUZHS1hZVHNQb0FQUk9NVEM3TkpFUmx4WGVPcWxBNk41ZFhK?=
 =?utf-8?B?aGdCSytyTjlPSHVjcEVCeWhsU014RU5sOU5CNjF6U3ByaUVFaWErSDA4NlFT?=
 =?utf-8?B?U0lYV2IrdFdVa0lqUDBESzRHY2I5UzU1QzE4TlFHczh4WkxmSzBpamFablpL?=
 =?utf-8?B?S2VhT1ZhOEUrTGw3WG1xalhMNUJwSVhzbWkxWVpyTUJHRHh4b0s0bTRnK3Yx?=
 =?utf-8?B?MDdMVG95Y0lJbW9lUURld0FqUXlEalFReEtZeHdQd2dhZWVsZm1hMzJJMThm?=
 =?utf-8?B?bHN0eEVzRmtvWVdORHZ0bmc0QnhJOFFsM1I4ZEFySE5UUGhza2k5U042bm9M?=
 =?utf-8?B?SERUWkZNZFRHNVlpQ0FQNzRKQWJQTGYvMW5TbTZ4UkUrUVM3VWNvUDZWb2lW?=
 =?utf-8?B?WStaV3J2eDdIMGNtTHRMMGpvcGNreWV2SjFCRkJYQTR5TTZWOHV2ckNHNDB5?=
 =?utf-8?B?a1k1RE05K3pQWWJodm5ZSXZTek5Ic0NDcWRzTTcvZEVtakVzYkpoajNabFp4?=
 =?utf-8?B?OWNRUDJvTThhUnNBa1UwYldRd1B6L3RTSU82bnFhWWVPaU9ENVdYN2VkVlFw?=
 =?utf-8?B?a0UyL3JadjY4SjRWRm9GSXlsdWo4U2dLVWFJRkgxL1BJOFEzL2ZmVVB4aFJI?=
 =?utf-8?B?RmkvYmd4MW5XSHJDYWNpcTlPT2wzL2pVNE9UNVFiVGpxMzBBL0VlNThpVGRp?=
 =?utf-8?B?OGtwTTJuN3RHUXp6MGVDOGEvQ1dPUFJCdXFEc2FnWFRlRXF4K21DQkFDY3Yv?=
 =?utf-8?B?MzRRckFpRGRVVk13OEdoS01QakFSMURuZ0NySUhJcmRsR21DUFYrSFB0Qk1x?=
 =?utf-8?B?T25BMUFKN1g5bFg2NlkzQWVoSWRBS0F1T3FjZTYxbWlCTmhjKzVmMzRLUWo1?=
 =?utf-8?B?dktmQWZUcGtXQnk2aTlTelRZMnZqR1dTamJUeFlWWnU0MmhGcDdpUnJtS0k2?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kLmJn0XyOdEIykQGwcMkMYIZPK1DirOrSWvvxY3i9mWxYK2jHPRk7cQ8poaRCWgKp9cKOTxfeZh4cqBiXZQckc2U1BgJbcNqM9WR6Yu7RQbUeYj2BKznTgn1rV3RD/1u8qOu3wjvinhN2I44cZuGmj4SGD3MOqs1kVbc394MIUp5soHDGRWuoF8J1+K+rrSfDynhj/r6+Fxvqx0xfjZHZ2tPTwacCKrF5ETBpQKZOKBFTYrHWoIhFz/YKLYLlf06pvt5aC6p0t5zOuZlh+vRkEnhw7v9O7Vhd5tE11btrU2oijBrjTMOMJ351WMWjZwgsDLaSb9lbWicUYwaeEQx3T4xdZqfiu1s5aoNF0/L1yD8+49AJfGL+Pit2m3KHQzFe/heMMx7VR5uLJzfsdbxP5zvRTcCQvKTzqFsymgaMedSK6l5dQQ3n01Lgcnu2UK4WuklQT1NggliN5aPg4mtU8ioGjOTAzBfMCRrV+B8XtyQ9ecwsmB7WKV9oAahcqvs2HP8l++/54Vz+s614w4PizXBSqARwhjSx5Ru4yumkyuu/1Kk/DkDmNbB99NNrk7dcNJHDzbL13QAhY+eNWedhQ+acPH4BSVWwI6yL4e1ZOcGfSRme5RPFku91zye7bP5/woyPGFK9mBhnsm0uXJi3eHQJEesTmQbaGGYVyrlyPKRH4AzUCnyIYlh75U1bmz6EJcKXaLPZUip0yPzcpAC7JleY9hkdn+8CqV6t3mbsYocDga3r2cwftNqN06F61IapTru/8OvJqFTmmgO+F6PjQYv5x4AN1chvW+iT3qZ1AzUJ6EsCeAnQlvy7KtI3sfR
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea9fcfb9-d4c9-4411-657e-08db8d293e9a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 16:07:29.3546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RqwoA8bi+KSvmYBk6nhJ4o7ZX2Nd+qSQHBntcUeu7AAoRDUsXel9KcnpcqhIhO4vFSKcmOwmt2HXYr0rsDeeSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB7269

On Tue, Jul 25, 2023 at 03:44:29PM +0100, Anthony PERARD wrote:
> On Tue, Jul 25, 2023 at 03:05:55PM +0200, Roger Pau Monne wrote:
> > diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
> > index 3c8b2a72c0b8..dd97699bbde7 100644
> > --- a/tools/libs/light/libxl_cpuid.c
> > +++ b/tools/libs/light/libxl_cpuid.c
> > @@ -592,17 +641,32 @@ int libxl__cpuid_policy_list_parse_json(libxl__gc *gc,
> >  {
> >      int i, size;
> >      struct xc_xend_cpuid *l;
> > +    struct xc_msr *msr;
> > +    const libxl__json_object *co;
> >      flexarray_t *array;
> > +    bool cpuid_only = false;
> > +
> > +    if (libxl__json_object_is_array(o)) {
> 
> I think a comment here would useful to point out that we are parsing the
> format from previous version of Xen.
> 
> > +        co = o;
> > +        cpuid_only = true;
> > +        goto parse_cpuid;
> > +    }
> 
> Otherwise, the patch looks good now:
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks, will add and send just v5 for this patch, as a reply to v4.

Regards, Roger.

