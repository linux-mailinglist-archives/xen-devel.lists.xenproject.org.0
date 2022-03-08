Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AB54D1D24
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 17:27:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287199.487074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRcfZ-0000V4-5c; Tue, 08 Mar 2022 16:26:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287199.487074; Tue, 08 Mar 2022 16:26:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRcfZ-0000TE-2O; Tue, 08 Mar 2022 16:26:41 +0000
Received: by outflank-mailman (input) for mailman id 287199;
 Tue, 08 Mar 2022 16:26:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWwI=TT=citrix.com=prvs=059ab6e88=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRcfX-0000T8-Ku
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 16:26:39 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8695cd4c-9efc-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 17:26:38 +0100 (CET)
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
X-Inumbo-ID: 8695cd4c-9efc-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646756798;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=rIcU2BgkZRl8fRY1ndnEecmqWTiybJTozKJpdvtqfN0=;
  b=eobtiV7LHxh+PEm/IExFKwzmW56wfHqRRqUkBEvXILJ3cCx4iYHn+5cU
   jAOf3MTGOputkTroGeljXPGFe3nv7DHuOElpUDV+t3arKn1t39TBqSMFq
   uQ5IN2tkADZEo8gGtc+7HK6xyDrpcktfug7b6JpBS4sLpQB+FvgRXjgsM
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66122386
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:B96+wqLlufQZb2FAFE+RAJUlxSXFcZb7ZxGr2PjKsXjdYENShWYBn
 TFKUWnSbv+IYjGmKN5+OoSz8kpUu8TRytExSldlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh2dY42YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PtWjbmhVCUxBLfNs9pNWgZESg4iIaITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glu35oURqaAD
 yYfQWtWSwaebRpEAQgOErAsu8vwhF76LxQN/Tp5ooJoujOOnWSdyoPFNcLSetiDTsZ9l0ORt
 GXAuWj0ajkZM9qFwDbD7XOohcfIhyrwXI9UH7q9ntZ6jVvWymENBRk+UVqgveL/mkO4Q8hYK
 UEf5mwpt6da3ECsQ9PwWzWxpXeWuRhaV9c4O+8w5RyJy6HUyx2EHWVCRTlEAPQjt9IeTDkjx
 FiP2d/kbQGDq5XMFyjbrO3N62rvZ25FdgfueBPoUyMr+OHGsZwRlijVT/1dQKeqkoTaRS3/l
 mXiQDcFu50fissC1qOe9F/Bgi6xqpWhcjPZ9jk7TUr+sFonOdfNi5iArAGCsK0edNrxokyp4
 SBc8/Vy+tziGn1keMalZOwWVI+k6P+eWNE3qQ4+RsJxn9hBFpPKQGyx3N2cDBoxWirnUWWwC
 KM2he+3zMULVJdNRfUrC79d8+xwkcDd+S3ND5g4lOZmbJlrbxOg9ypzf0OW1G2FuBFyzf9hZ
 sfGKp/8UC1y5UFbINyeHbx1PVgDnHxW+I8ubcqjk0TPPUS2PhZ5tovpwHPRN7tkvctoUS3e8
 spFNtvi9vmseLaWX8UjyqZKdQpiBSFiXfje8pULHsbeclsOMDxwUJf5nOJ+E7GJaowIz48kC
 FnmARQGoLc+7FWaQTi3hodLNOu/Dcwh/ChgYUTB/z+AghAeXGpm149GH7Mfdrg77u1zi/lyS
 vgOYcKbBfpTDD/A/lwggVPV9uSOqDzDadqyAheY
IronPort-HdrOrdr: A9a23:HmNl/K5f4pGbT34BeAPXwSqBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwX5VoZUmsj6KdhrNhQItKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkDNDSSNykKsS+Z2njALz9I+rDum8rJ9ITjJjVWPHlXgslbnnlE422gYytLrWd9dP4E/M
 323Ls5m9PsQwVeUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZpzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDl1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9kfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWz2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 gjMCjl3ocWTbqmVQGYgoE2q+bcHUjbXy32D3Tqg/blnQS/xxtCvgklLM92pAZ1yHtycegA2w
 3+CNUaqFh/dL5nUUtDPpZyfSKWMB26ffueChPaHbzYfJt3Tk4l7aSHpIkI2A==
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="66122386"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDU2SmatGVXB6RI5+S8x2f9VFpYcpd5Gv6EuHpmP98QITNV8UbkknyLkug2hIxhyQ1uHXF4WfMTwwtHBSUEMghy+XmPII8ZwkGLlgcfoao10AdNMN3tUHL3NZmYgdD0e0NiFHW05ZdYcMsmqFttGELx0jioIF6RpLQjOHVC0GDlUH+5kMrX/mpPNgtL3jcpF+owChQlfxev44Lgzuv/RzOEVRft7venIkzDUrTznZunxYrxFaATClQTiFvKApv1hRsrI/dB70qTz6mJt7XV5UP/FQHQyL4zRDiMsX8L316D/qsOrR7swKqzlYCwU/BMBxs0dxiL/GKxGQoI1wdJv3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Oq0OdXfVksZyvOggS7TMo2kZKfvcx2V8FsRAvDgCj4=;
 b=FwPXILRc11VDYizwdAYLytJYMl/3N2HZJmFMZBPqUA9gYu50NMMPrapZL4I2ZlJuI1PRB3Kb3crJ5WJ23Fv5hqCb52gnAfT7bvYAA3N35xRzklZZqGUSsOcHRjQYCiOrSFD6HE83bp+SeCBGqqOo1ksv1JLIHLag1Wr8Okn6sKEvLJhMT2161/jwG9YbfDiHtwJqcJRpmurvgeMGrpBICk7sv+BgeFpFH7cqpwP3uMaAhP9nanckS4uQ9zX7eKm0NUA2OSz5aJ67YV38d7rzqq6JLP+/L0ciM9gsoa3GJ3YShXp66vixuHf3aZjge2sBzn0srY5CVSu5YQ14sDP0sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Oq0OdXfVksZyvOggS7TMo2kZKfvcx2V8FsRAvDgCj4=;
 b=K2k+iqspEp/TIey2r0acLcvjcbOxE5NtJ8FHqV2WkdSwI1FNTS5IqCByzjbK3IfPHYVjtH2Wdbt/DSUkYzqb5JftAfziEprYG4g4oIMkRkBGdhaFrhoR6sYl3D9KuCYGTsG0rfZdbH9LIX38ga2HliXLsacyQByaCtJIRb4zF7Y=
Date: Tue, 8 Mar 2022 17:26:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bjoern Doebel <doebel@amazon.de>, Jan Beulich <jbeulich@suse.com>
CC: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH v1] arch/x86: Livepatch: fix overflow check when
 computing ELF relocations
Message-ID: <YieDtMqn+z5Aydkp@Air-de-Roger>
References: <b74a68b038c31df4bb94a5b5e87453f5a249cfe2.1646753657.git.doebel@amazon.de>
 <c625d90c-ec0b-a2c3-cf93-08c99cc2f3ce@suse.com>
 <YieBJTHJBiUUqMCU@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YieBJTHJBiUUqMCU@Air-de-Roger>
X-ClientProxiedBy: LO4P123CA0064.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 320d3e94-72c7-4a9f-aea7-08da01206858
X-MS-TrafficTypeDiagnostic: BN7PR03MB3924:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB39243BDE1FDC503B11AE66C38F099@BN7PR03MB3924.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OOhmZQRS4CFacxIgrFLRHikWT9LrKVgx5Xm+P03UPGxXd2CEwz/+fUuz8NBX1YmIlyh/enWj38he9BxanLvTaSqHsXrY7tUFQKdKPJH6e2RGCpW9zZCw9QDJxlIpFLbWsMawp0OWUCDJK8FJ9FxuHbl1g7jw18K6ALRTsNU6rvqiYC48uJd7Eo+9w/WdQQNVSz9J1oPqNS22EKh0KnBV8iW6EonxBFbeQi36xHVrtDdLpSOxQvhjqr7u4/EVb9s+NyRVzMr3AapRQKPVUfF/OqSeACkcCq5X1wRnuf7lDCP6nt7ltPSLXQ/IN3TJSuxvYChB6VXYjrJHAsFQ9z8IpJotAxAFOX+BapR9Hx8hhODCGFfKoDU8WCT0xCYPTKLLAa8bk9KrXh72grQwZW7GNhwk5rtm+8xJkScnjpG3RKvesGGghUb0DewbiQMvJbkV73oBjTtXiXf6VZtrC/lc3vFiQLNPP8lT2AXCE6HIxBCqFHps/nFKYOS9oJZ43J4M4t6282APuNwkHZSEWGvYlVzsZVBa31yl/vfg7jb/s1UUuMb4br+b7RJu7U6MKvFd0t6sAIo1fQtNhfDB19oIMKROIK2LVgtcDfGUC9BHXB3EvmWQuQxLIylceB5HzrZBvvWv3VgNkJi3TxPcDZS4kwlEp1XGe6qHJv1N+Y0dVU6QMqAYTHZaEA8lNmZZmJ/YL0wdMoKtqDaS+wVATS7SzQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(33716001)(38100700002)(66946007)(2906002)(53546011)(66556008)(82960400001)(8676002)(66476007)(4326008)(54906003)(110136005)(8936002)(5660300002)(86362001)(508600001)(316002)(6486002)(6506007)(186003)(26005)(85182001)(6512007)(9686003)(83380400001)(6666004)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHcwU21MSE43L0ZxS1JPYmVvNy96aFpWVDVxWDdYeHEwcWhPTk5tOU01aDBY?=
 =?utf-8?B?a0E3b1ZQdkxnRmFwSXlaWGZuWGdGdmdxTjRQSWg0anNOVEIwckxpMHdjcVAy?=
 =?utf-8?B?ZEN1M1ZWSGN3L0d4bWc2dEpPcUtxeW5GM1hwRGhSUHZjUFhlU01Ua0toOWo4?=
 =?utf-8?B?TDNJbU9HTkpwN2hoWXdpeHdFM09tdkdWVWJHbWNyZEx6SVdEbmtjVUtWOHZh?=
 =?utf-8?B?NHpLM2hDZmxCWDkveEg2MEwxYlpobDZCaHNHODRoYWkzanVUblNMSG1ObXMz?=
 =?utf-8?B?NzVvSXMvV09ZUTlDR3pLZUxEVko4eE9vdlVDRkZTdnl3ck1heGpsSkhIaHBJ?=
 =?utf-8?B?RmVUa2tTOUZMaytZZE1wb2c5bmNIMmRrR0lPRU9TVGdNNy91TDhhQXRhVGM1?=
 =?utf-8?B?d0JaWFlET0s3RWJJTG9Tc3BNOEVBbDNibFU3WDh6eVdXS05BTVA4RlFqVXQz?=
 =?utf-8?B?TWdJT05VZUlDd2I4enBpSWREU0U2UXZ0a3RDKzF2OFFXcStyMHRUa3BFaUFu?=
 =?utf-8?B?dkREekl0Tm5YaXI0WHJQcjN1ajRSbWJIMGhDcE5pOXFxN2NhRjJDMURqQ0dV?=
 =?utf-8?B?VVlXaVV2WXV4emxoem91K1RDNTJHUmpsSWN6S0xtT3NpYVZtZDFISE5KU29u?=
 =?utf-8?B?cXZRUWpZeS9qRmJCajlTeXVlVllGT2IrdWd0d29UcmlGc0F4dVNEMzA5dXJQ?=
 =?utf-8?B?Ly8vaWFFQXRYR0E2bWphOEFyZnBvb3NLZitjOVRZR2dTSmRLdWhFYVpxcklY?=
 =?utf-8?B?dUhTY1plV1J3UEwvQ0MxVVB3SytNTkZnNU8rZzNmY2k5VmVsNVByQXQ3dFNV?=
 =?utf-8?B?ZHNOSGEwOFBIMXFpcjJqM0pSQW9EeHhjeU50TUlpdXhVUVN6STMrMEpZZDBE?=
 =?utf-8?B?azluNk56aTNHL09jd2xvSjd2Qy9EWmtkQTB3UGp6ZjZtSHNCekhFM1RaaTZq?=
 =?utf-8?B?MVUvNUd0V214R3BYZVRuWWczbzhzbHFURUUwcTlERXBTMVFycnFTTmgxZXQv?=
 =?utf-8?B?bC9yT0czK1dXU2V4NVJpc2dYV0puTklieGgyaGhrVi9MamIyYTI5cXZnbjBV?=
 =?utf-8?B?dm9sUzU0K09BVWpqUThCN21hUGtzZldxeGZuaXdHMDA5MnJLS3czWldmRGll?=
 =?utf-8?B?S0FKd0MvZVF4QkJSR29UMXQzOE9EaVlmTkhLSjdmSEdZSlpkUG5DbGxudXVt?=
 =?utf-8?B?Z3RobXlFODNVWEpnN08vc3ZxV2tmTzJudzNPZDZreEpCUlNlVHJaYW1aMVZR?=
 =?utf-8?B?MUtMMjQzTkptOFFydEd3bTdXdzVtT3kzQUhSdDVKemxCeWtBcmVjSXRtempp?=
 =?utf-8?B?V1hhalppWmhybnc2T3NRdk5qODdlTTkzT2FoODBCKzNFU1RFVXloeHV1VFIy?=
 =?utf-8?B?NWJtNC9Kak9tMHd4S082RnQyTUJUbmF1WlRoSjBKV2pPaHlBcFlsaWxaMmJL?=
 =?utf-8?B?SS96alpiYUlYckJnWWptOW9FRTBhTzhoTnRVWXNUeFI4TnNSZlVqV0NvaUdR?=
 =?utf-8?B?RDNERE4wam8wcjZRNzZlYmVRbWNNTTdrUmh4ZGxhTVllN2VEY2tsWDNMSDlq?=
 =?utf-8?B?SHJkQnFSUFYrTnR1Y3BtcnV6dWpsWEh4RjZUWnpDNWxjZXpBVTk2VUpTMlhq?=
 =?utf-8?B?Sm5mN2VROGJjK2dGbkFwRkVzN2NGYkxQSjltV2Zyd0lydWdhQng4UVFmYmhV?=
 =?utf-8?B?SHNoSkp0SWI0eitWaFVnS0g2RXNjU1Qva1RKZGR2T3pJUEJBY1UyV2M4NkdZ?=
 =?utf-8?B?ZUplenVhVlFnVWhnaW9Qc3QvS2NHYitHanJJeHlaemVnUVcvMjNLT2EwT2t1?=
 =?utf-8?B?dFN4Z3pwYlZNZFM5WkhiRHZEQkthWkoxSG1GZFE0KzcvT2c4SWhwUnpJNEFM?=
 =?utf-8?B?bkoyVzFudWw0aiswZFpCT2J5UC96TU05T080NllicVVsbjFQeGlkakNhV05i?=
 =?utf-8?B?RnhvOHQ4bWhaYzRGSEhoa3RHbGJ4RGJqVXFuN1lBUnQrM1hHMm5Xb2Nva29v?=
 =?utf-8?B?N0g4YndJaVRaZU9ZQ214azIyaW1KZ3RzeXc3QjJINituaFFOdlI1Z2xYTU4x?=
 =?utf-8?B?bnNOOExvSG1STjJ0c2p6M1h4clBaR2EyQVpEL01ZMWZrZmQ3a0tUTThYUzR5?=
 =?utf-8?B?dGZudUQ2ZjZSWkVmN2pGZFJsNkFmS3lRZVdMaEYrZmRuazQ5NitrcW4wbFU3?=
 =?utf-8?Q?5JdslpFv9mbe9nhiHRt2Bbw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 320d3e94-72c7-4a9f-aea7-08da01206858
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 16:26:32.9601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eus65RRF3R6xDZTVHc6vAg/QcjA+mM0DeV1cP/U/IUypf6Iz2eApfejCjLK6WcWpoNGoq2ZJ+/wGS5dgyMryyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3924
X-OriginatorOrg: citrix.com

On Tue, Mar 08, 2022 at 05:15:33PM +0100, Roger Pau Monné wrote:
> On Tue, Mar 08, 2022 at 04:45:34PM +0100, Jan Beulich wrote:
> > On 08.03.2022 16:36, Bjoern Doebel wrote:
> > > --- a/xen/arch/x86/livepatch.c
> > > +++ b/xen/arch/x86/livepatch.c
> > > @@ -339,7 +339,7 @@ int arch_livepatch_perform_rela(struct livepatch_elf *elf,
> > >  
> > >              val -= (uint64_t)dest;
> > >              *(int32_t *)dest = val;
> > 
> > Afaict after this assignment ...
> > 
> > > -            if ( (int64_t)val != *(int32_t *)dest )
> > > +            if ( (int32_t)val != *(int32_t *)dest )
> > 
> > ... this condition can never be false. The cast really wants to be
> > to int64_t, and the overflow you saw being reported is quite likely
> > for a different reason. But from the sole message you did quote
> > it's not really possible to figure what else is wrong.
> 
> It seems Linux has that check ifdef'ed [0], but there's no reference
> as to why it's that way (I've tracked it back to the x86-64 import on
> the historical tree, f3081f5b66a06175ff2dabfe885a53fb04e71076).
> 
> It's a 64bit relocation using a 32bit value, but it's unclear to me
> that modifying the top 32bits is not allowed/intended.

Urg, I've worded this very badly. It's a 64bit relocation using a
32bit value, but it's unclear to me that modifying the top 32bits is
not allowed/intended and fine to be dropped.

Thanks, Roger.

