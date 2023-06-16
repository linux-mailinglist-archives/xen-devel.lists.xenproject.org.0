Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DF77331E6
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 15:11:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550179.859147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9Eo-0004IH-2D; Fri, 16 Jun 2023 13:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550179.859147; Fri, 16 Jun 2023 13:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9En-0004Df-Uh; Fri, 16 Jun 2023 13:11:37 +0000
Received: by outflank-mailman (input) for mailman id 550179;
 Fri, 16 Jun 2023 13:11:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uwsx=CE=citrix.com=prvs=524b7acb3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qA9Em-0002qy-7N
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 13:11:36 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50e18efe-0c47-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 15:11:33 +0200 (CEST)
Received: from mail-sn1nam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2023 09:11:32 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB6547.namprd03.prod.outlook.com (2603:10b6:806:1c6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 13:11:31 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47%2]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 13:11:31 +0000
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
X-Inumbo-ID: 50e18efe-0c47-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686921093;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=hliZfAPo88FD8LfVDnai3HNz4jmGABT4LkpZwEyRO6Y=;
  b=EIMS6GEIOE+cnHYYTPOeiChalUDMos5guk+Itdt+AcXMCRKwBPASnegh
   ilQQVm65cyr6nth9u8MH2XQO+VnFnH2Wywc5Cl1BMPpAFv62LO1DweZk8
   zrUK/VYUHVNlkkfTUJ61DxIBK5urt+dso9T8/Y1xsjBDxwHor6pwYCAKE
   A=;
X-IronPort-RemoteIP: 104.47.57.41
X-IronPort-MID: 113085936
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:PXMC7qKm3KyjpAKmFE+R9JQlxSXFcZb7ZxGr2PjKsXjdYENS0jcPn
 2sZWmmFP6yOMWfwfoogPdjg8UNSvZSBxtZnGQVlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4AVgPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5WI2N3r
 8MzMAoSZ1OCp/jx/qCicvZF05FLwMnDZOvzu1lG5BSBV7MdZ8mGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dopTSKpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyv33r+SzHilMG4UPPqR+vlxkV6v/UMsIgUUf2rmqMecqGfrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAbShZRZdpgs9U5LRQo2
 UWOhMjBHiF0vfueTnf1y1uPhTa7OCxQNmlbYyYBFVEB+4O7/Nh1iQ/TRNF+FqLzlsfyBTz73
 zGNqm45mqkXiskIka68+Dgrng6Rm3QAdSZtji2/Y45vxloRiFKND2Bw1WXm0A==
IronPort-HdrOrdr: A9a23:VMB4m62i4+RO2J16MZc04wqjBH8kLtp133Aq2lEZdPU0SKalfq
 eV7ZEmPH7P+VQssR4b9exoVJPufZq+z+8X3WByB9aftWDd0QPEEGgL1+DfKlbbexEWmNQy6U
 9hGZIOcuEZDzJB/LvHCArTKadd/DGemprY4ds3Vx1WPHlXg6cL1XYfNi+rVndYaSNhHpQDGJ
 +V9qN81kGdkSR+VLXcOpEdNdKz3uH2qA==
X-Talos-CUID: 9a23:vDazD2FcCfusHHI6qmJG1kwtQP8OakfCxTTRA1X/N3RwcKK8HAo=
X-Talos-MUID: 9a23:+eCLNwXTJT9FG5Hq/HjFiDZ5JcRU2IuRIlgPu6RbsvehFwUlbg==
X-IronPort-AV: E=Sophos;i="6.00,247,1681185600"; 
   d="scan'208";a="113085936"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNlbY7Ytj+srlNC9JMF8R0olvHsYR5/re/Oj8HZbJXk+plfwgMhbzGakGiTTkubm5TtF7EPGdivF1ds1ifNE7ZgAWqC3xaIvmGiaDt11woFo5bn3OKRxcg8zrKOQxZxSGTgpgjRNMbMi/EuucWiuF0M9dIbMiQvw3DtQ1+6VC18hXts2B7PQyAgqh1XokuenoTy85W7cJVjg9p5LseKrbRWTMjpqyCWhKkwJyHXYyNCuWtmjw8GgWeRhlRAtp3v4KNV8voyRhQe0ZVJP5cObyLCwRXsPLD5VYGELiWbF8T02/LRdYhcgzkaNQiAMAzMBk1Axfj4nNTQ87fthSXDvQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGF4NgKbdLxi9cAWht352jpRnufL5F1NEQpFr1PckI0=;
 b=N6Qu0J84U68sbzZi8DpVt9rJ6+atK+uO0k7jL4dC12CoZpPxcV9OsdJwT+hvPNYFr64XKTEF1gRjd5EUNo2m8giiM+n7mcfb68M5hojKDydsfGfZSKZew6vrtJgbP2CIPzM1Dy3VsZSAU3Z4JUaj6EWPH+5Fk1HLM2/E7cy5O8zAYVRSqp2zfVrXo6Q1AvnANdwkcWACUyRf596iNLyhJHjn+ZFPuPgHprzoSVREVGaMGxZrc7GaZzs8thdnsd9TOOOh126oGTUumBGBI8Y9Y2hl8zB6ookHKlrXDrt1uHVQZ80V7ouAMd2Z0eb4yCwH944RVSAinNdd+VilAXKIpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGF4NgKbdLxi9cAWht352jpRnufL5F1NEQpFr1PckI0=;
 b=OaDR7hxIj8EsvyfH+EsdLfuDUz640mApD3aHdTOQ0cCdjshq3Fmgs8RcgqhkVux6QHwnx2PnjvyXnnhUDt3Cx9pcEhUcRdmaE1HxS3/KySoeYGhg4HvRu8XR7Se5SvfLUnkjuO6pfYdXu63lh9fkhrX3jBkJ0z+T6vF7Q/oLn4Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 06/13] libs/guest: replace usage of host featureset in xc_cpuid_apply_policy()
Date: Fri, 16 Jun 2023 15:10:12 +0200
Message-Id: <20230616131019.11476-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230616131019.11476-1-roger.pau@citrix.com>
References: <20230616131019.11476-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0265.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 540acf58-dbd6-4f56-9352-08db6e6b337f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w+mFrfrLQ9hqQcZHzwtMGBSmXDkm8G3jttn1kx9vfjJRi70Lm6tqjlfadrrz0koPIBwhVjBHSXGlnKOjBoEpGH1JkUFL4S9niohLnC1Gb7IfcTfmDFB1my4nY7w2y65rVQWmaymV1tUEAXXmXsrHkUdN+zii1AZ7hJkUjqhE0ba8u+dtL7lC5+YLIiGgSsk9E0dp2tYtMqLdOc+PqzKMCC7RrwLhz7G+FWLj+gNtFtLVsZVre2UOIaxrw7xWzzWHuT5JmOuOXJOjfAqfVqVBp1TNc5VCa0L+89eN/b6mqeuPBUnFzN4VeZNqqyR/WPW89ZV69GeG46rQXsrnm9js7TuhquZ3nY+d4MgYvAJ/ni2mAw2pLQGEL3k4OnizWy+//EYJPLK6sWJXGmfCXQCMh8qFmH2wUIYZsQrP45jdcCFPT4JmN8xmSSOl4XuG+fDR58beOIHjLu8fBJQhc2gex5EJKf/Oo+p9tkWltcgXTb3CEYvVXlPr5Zk3wWVuST8YdKwLttOByVU96sVuJdQ8hiqzmYlib4qLH0NRHSiahKCQVDL7pOB17qSaU8+RQ1ee
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(86362001)(38100700002)(8676002)(5660300002)(82960400001)(316002)(8936002)(41300700001)(66946007)(66556008)(66476007)(6916009)(4326008)(54906003)(83380400001)(2616005)(186003)(36756003)(478600001)(1076003)(6512007)(6506007)(26005)(2906002)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUVFV3d2elN3VHhjMTd1eFRQUzJXdjNGYTJWcXlaNGQza0pHRU9ZdDZHZHBR?=
 =?utf-8?B?UlJWVXJMc0dFZUd0SzR3Qk5kK2pPOFV4K05DRlpmMmpNa3N2M1cxYWw4Q09C?=
 =?utf-8?B?OXYyUUJsbXYrREVGeVJvMHBhL2ZSNU9HR0l3WTcrRjU1MFNMM3dlb1FhVHRC?=
 =?utf-8?B?V1RwbkM5QlVYQzVtRUE0RFpCcFAvdFJvbW12dFlyUDFjZFUxVXZHeU9uTlNn?=
 =?utf-8?B?NFJaVm5rWjdTZk5KSTh1RFlYa0J6T0lieElYaDVCaEtwQzJqMk95MXRBL1do?=
 =?utf-8?B?NFQyRG1mMHpWNzdNYjg1VTR4bHRHOVJCM2R6aVN2Q2RjdEtBL2RKaVBzSmZq?=
 =?utf-8?B?Mk9RR1hJNFI2RXNueVFGSm1KM243ZGtObmN4Q29nNEVDRFJQSUFLZWMzVUdX?=
 =?utf-8?B?MlE1TFdKV1BvOVdaaDRPODg3NlJVZ2lMb3JIMWZaNVo4WlVMNlVMTDc3K3hT?=
 =?utf-8?B?YlZUdWhVQnJSQ0M5YkF3VVhuakRlOEtLVEVkVFZjTFhaQmRYYXJSVUhiVjBO?=
 =?utf-8?B?ZUVjNnJpdUxtbmVoNU1OOHhSajNtdlIvQ29adnJjajZQN2hCeUp4emYvMWNu?=
 =?utf-8?B?bHB3aTZzMTdRcU9vWk96K1IxK1NPYllUK1FIZGNCOFB4TnhJMGVVd01ITzFO?=
 =?utf-8?B?ODFwMW9qd0pqQlEzZEpJUmxoWlNOVnlROWM3MDFyclVETE1JcnNVR01wYVpP?=
 =?utf-8?B?S0JjUlRFbXFJWWZTUjlwcXUxT2x1OEJYMjFuZkFCUlFLSURjYzNGOGx2WnJJ?=
 =?utf-8?B?dEl1VFBkVWU2eXVoYWxQWXpPeTNVTHpFMXN2Um5FclM1WXZTcEZFYTdReDNx?=
 =?utf-8?B?SVl3R0w0Tk53YWVjL0ZHNzBwbVhiUGo5UC9rM2t0d0FCN05BR1M4b2lxUHNT?=
 =?utf-8?B?YlRXOFptbzBRSDBGUjYyUHpzcmpZb3VJd0o5K29xSnRsbTBYRThHQ0NsbWZT?=
 =?utf-8?B?ZFdwcUxCZ1JwMHphbDg5SHJ5NzVsSlpHL3FXalVWMVRvQWd2bFMwamRlQzFT?=
 =?utf-8?B?NWlod0V5dHcvYUNsbU9BcFIyYWtEUzVNWXkxN01ueVZLMXhzMGUySXFHYnlE?=
 =?utf-8?B?RkRyL2VVNmxmYkwwaXdZaHczMXY2S3d0M3FtNHBjRmNWSGhiTXVycWtCZkV1?=
 =?utf-8?B?Z2FqcVo1Y1JKTVhrZ2VCbVduTnNjQ21MVlBVUGtMcmx4VENqQ3A4Q09Hdnh5?=
 =?utf-8?B?L3ZpWDlKN0JhUFVBaDNJcUl0ZHJMZlJXRnJlZUFJVkg3NEZZZ2xUWW1LU2Fs?=
 =?utf-8?B?UDBZc2VlU2R2NVEwMS9ZV05WRm5xOXR4eXJmeG43cDFkRlg3M2RWOThYeFlN?=
 =?utf-8?B?enNZdTdMUVU0SXZPTG5vUkRxS082K09iMytKSjBzTkpEbWEyRzVWZ2EwZk80?=
 =?utf-8?B?OXlhZ2hybmJ1L1FoMDNqcTBHT1BNMHY1bzJGdWtDcmxLL0JJTmZrVDFjM1Ja?=
 =?utf-8?B?OXpoVktMaHZrRW5RbGhBZk9nTktLY1BXdlE3UWhic2M0M2NuWERURlZwSjk2?=
 =?utf-8?B?UnZEeitnb1BRc0lOMzZYK1ZTWGlPSjV1WFlsUXZqd0ZHR1R4WGFSa3A3NWlk?=
 =?utf-8?B?bEtxNTZwV3hpZTRtMlpnRFkwRTlwaUxOYTBFVmdEZmcrZE40c2hsdUZKR0VZ?=
 =?utf-8?B?QkJ3dGJjZDZUVTFkR2laVmcvNEthb2JPV21pWkVpT0NBbXYrWG9TOERNM0Uy?=
 =?utf-8?B?OEZ0dUNMTVNxTElnZ0lmU3N2RU94TCtoOHZhQnZTR3JrMnFpeXdxZ2VWdEJv?=
 =?utf-8?B?MVlGVXZTWlFtMjhHUzB2SFdQV1ZLV2gvWHZBR0V0bkNCTURhOURzQ1dFZkh3?=
 =?utf-8?B?NjhCYmNrSE5GZU9pWVZvTDVNdTkzTW96QkNYY2NtZUYxUHpKRmx5ck1xS3RJ?=
 =?utf-8?B?K2JGdEVqZ2ZQZktGdkRKSUJZTmJtVjVWQlZzcTMyYjBVcXBidjAvSVR1MTdX?=
 =?utf-8?B?QXpBUjFGbmdZVkJVZVJhUnZIOVczZzE5a2R3WktJcGZ0aGVwU255YkpJV1hi?=
 =?utf-8?B?ZUhGTHp0U2ZNK1EwZVQ4V2RDR2xnN3J3ZElKN3Q0MjJpdzQ3M0t6MXVHcXlu?=
 =?utf-8?B?aXcxT3FUanBtSzVPb0RST3NkM3lXUFFidEorcXdJVjBaMG1memVBU3RHanB4?=
 =?utf-8?B?VFZmZnlobHZRSWozN0tkZUNweXdRUDlsYi9OcEdlZkg5bnVaNFlQUlgreStj?=
 =?utf-8?B?ZkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WYmnaNAMWKIeaI9LqVwxK+pQz+k+YgLLUxgoqcD+ikKPoRnTYZo1JCl+a3rfZfMbr3fYKjpudNfXxAEtftt+ZJNjNytX5O0Ou+lwWRUU3r1Y6IgfdyFfxBAcihocWDJliHovM3gbYbyaYJ4rLjmNxHlnJ42/jL+OUqVWrP4byb2Y9vkxZAqBpT915r7TjiE9Y6YVFGaPKZol5UMQMCdp5zKhqdFZWkpCrbEWi+HxbRF0h3cVGs07OWeZu22NRpwif+oBWLALXOxg0A7z4o4LZL5zfxTT+Is+qgwLLxWzvWm76D+fMFR+eI7+TWAYb5FUBDrTcb10eTfYd5WUrlN2T2j7JIMkVc9DL5ssN+XQdsmsOtALJF8AfYoeiPHyelzU4pa0PL/vV62+jjOkJjhgB4ydPTIQo4uBQHD1lV1SMlW45sNiLl/npgx/tbPmhIA3grQsDIh96BdHocpzdivR2psaGUE6sIsg4aQm+gvz3mQcg0c8xYULQ71W8JKZZoOFB2zhAH87Ax9I4tFLrFggy9ImQHvqR85h2AqMd+nda4ci7N9u3FYwFbabNLMLXfL2hWWoNP3Lv0fF8RR5zkD+RDSsXpMD/tJml3Mor0zWOH6vDwMGg3Opq8qjgIHYTUiKYKv6d98srdGRYtapwuaMCx8/fNKjVRGnH/dHRT0ztW20F+VKJJpiNgX/UgbloobKlaNKY5V0CVrKnG56bjaqZyn3KeTMerkyzRtirK66j0/cGvbL8MKGuf2Q+RvuS6dDjV6ufn2b5Bf7XRVeb0k8y5Si4BXNkbY/a7KCuGpvnE1iznR/i2aMVUmBefwc4hiA
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 540acf58-dbd6-4f56-9352-08db6e6b337f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 13:11:31.0398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a7JYpF5c2J7HQrkbEzZRm0RLw0pIF6wMU0MfiYbYp2XTH2jFmLCvU7iCxuqI8/bqmR4njXUtjmxSZLOASnig8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6547

Further changes to the function will require a host policy, hence
switch usages now in order to avoid having both a host featureset and
a host policy in the same context.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/libs/guest/xg_cpuid_x86.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index c67e8c458f24..1e532b255c21 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -432,10 +432,8 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     bool hvm;
     xc_domaininfo_t di;
     unsigned int i;
-    xc_cpu_policy_t *policy = NULL;
+    xc_cpu_policy_t *policy = NULL, *host = NULL;
     struct cpu_policy *p;
-    uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
-    uint32_t len = ARRAY_SIZE(host_featureset);
 
     if ( (rc = xc_domain_getinfo_single(xch, domid, &di)) < 0 )
     {
@@ -446,16 +444,14 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     hvm = di.flags & XEN_DOMINF_hvm_guest;
 
     rc = -ENOMEM;
-    if ( (policy = xc_cpu_policy_init()) == NULL )
+    if ( (policy = xc_cpu_policy_init()) == NULL ||
+         (host = xc_cpu_policy_init()) == NULL )
         goto out;
 
     /* Get the host policy. */
-    rc = xc_get_cpu_featureset(xch, XEN_SYSCTL_cpu_featureset_host,
-                               &len, host_featureset);
-    /* Tolerate "buffer too small", as we've got the bits we need. */
-    if ( rc && errno != ENOBUFS )
+    rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
+    if ( rc )
     {
-        PERROR("Failed to obtain host featureset");
         rc = -errno;
         goto out;
     }
@@ -485,13 +481,13 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
          * - Re-enable features which have become (possibly) off by default.
          */
 
-        p->basic.rdrand = test_bit(X86_FEATURE_RDRAND, host_featureset);
-        p->feat.hle = test_bit(X86_FEATURE_HLE, host_featureset);
-        p->feat.rtm = test_bit(X86_FEATURE_RTM, host_featureset);
+        p->basic.rdrand = host->policy.basic.rdrand;
+        p->feat.hle = host->policy.feat.hle;
+        p->feat.rtm = host->policy.feat.rtm;
 
         if ( hvm )
         {
-            p->feat.mpx = test_bit(X86_FEATURE_MPX, host_featureset);
+            p->feat.mpx = host->policy.feat.mpx;
         }
 
         p->basic.max_leaf = min(p->basic.max_leaf, 0xdu);
@@ -560,8 +556,8 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
          * On hardware without CPUID Faulting, PV guests see real topology.
          * As a consequence, they also need to see the host htt/cmp fields.
          */
-        p->basic.htt       = test_bit(X86_FEATURE_HTT, host_featureset);
-        p->extd.cmp_legacy = test_bit(X86_FEATURE_CMP_LEGACY, host_featureset);
+        p->basic.htt       = host->policy.basic.htt;
+        p->extd.cmp_legacy = host->policy.extd.cmp_legacy;
     }
     else
     {
@@ -635,6 +631,7 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 
 out:
     xc_cpu_policy_destroy(policy);
+    xc_cpu_policy_destroy(host);
 
     return rc;
 }
-- 
2.40.0


