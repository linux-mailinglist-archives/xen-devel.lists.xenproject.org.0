Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD76D9080C1
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 03:37:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740243.1147241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHvrJ-0003Ip-ON; Fri, 14 Jun 2024 01:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740243.1147241; Fri, 14 Jun 2024 01:36:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHvrJ-0003Fo-Ld; Fri, 14 Jun 2024 01:36:05 +0000
Received: by outflank-mailman (input) for mailman id 740243;
 Fri, 14 Jun 2024 01:36:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OutG=NQ=oracle.com=martin.petersen@srs-se1.protection.inumbo.net>)
 id 1sHvrI-0003Fi-B7
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 01:36:04 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 735c0eeb-29ee-11ef-90a3-e314d9c70b13;
 Fri, 14 Jun 2024 03:36:00 +0200 (CEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E1O6g3009650;
 Fri, 14 Jun 2024 01:35:44 GMT
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymh7ftmy0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2024 01:35:44 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 45E10hg6027051; Fri, 14 Jun 2024 01:35:43 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3yncdx2hsp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2024 01:35:42 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4709.namprd10.prod.outlook.com (2603:10b6:510:3d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 01:35:40 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7%4]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 01:35:40 +0000
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
X-Inumbo-ID: 735c0eeb-29ee-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to
	:cc:subject:from:in-reply-to:message-id:references:date
	:content-type:mime-version; s=corp-2023-11-20; bh=D3TQNM/YrayATk
	bTiRqKOtaetKIPFB5e1u1n1IPb54k=; b=WLTYZYi3KunjKyXR52g3FfhX352058
	OIW5NdUTkoriWAR362rWmaRMMrWXiQ2o7MvNhIxzHn+V5S2fDlajJ5yWo2+WbGga
	mP/OU5jWDrrPxgjSu2OBLIIbH4QkIiWjRL1FlCew/CA9K5GxekTOrvPv915o2sc4
	J8f9fMOECjm56KDWJIvFNjCx7RWvxKk8F2UbkDHPpTZf0QzteJpRNQvDaEmcrFUf
	GOzsVSVP1z/xVYDKaArHLi+fnKPGXlCgO3EFg7V7zc1xRggrO62SKRxxDpTPq+EA
	bHctEseAKeUkl19RrxuChuhjAZiSGPwLrI4bDQWv3Awh3B8/dFFKSAtw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MaT2oBTB4m8FqXfKWda+CFJ6LwcMIpBH2dzgkCl69uP9wdiUO0Cuvrlb8cf6ut5ZATB5nj//FyB1OY+PxsjxTM79I4bG2CKpARnabKNSWYY8tmwo+emk7BV5Lg4/PvotN0/sef5dX9fOBwGZKNs1zC2d4+VDTnxvqvnLpl9GLz/k9aieI4Q2nFRyyFFusfiDiP56icx5gqIA0cIAocPRp4TU1xjgtVNmPogaXOi4xCg7ySHtSh5r969wT+YI2fzhN2sNKInlUQ27c2VGo00I8BkhyGQ0HXMpEhZKD9IqRnDuNdaTHzmfM4OQC9pNRLFIs1rSOJDQ8q2//+7hUfFM/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3TQNM/YrayATkbTiRqKOtaetKIPFB5e1u1n1IPb54k=;
 b=P8pLWQiqxEBZKk6rRTTsGBKc2WEGu8xWBwroaqnCcDUokDQrhn6UaqcqOR9i8yHuryP5/aolu9JSfs4tePZ4Yeliy/yGjbEdgWTkpDClvGu5BwyKIF+zC5JdJ7COeD4yZ7bcWdW5z57xJSCtdDpnhpjbjGyYKOD3jRywCCDnVw018IhHS0jLdGXI2WkidrOzSQQ9iRTfKxMhpSEIsXTVXr0lrQZV9IZivnVy2equxHU0dpquHo5XbwbcqmNuJReqOwxW/r5i/nauqczIW6177SFLvvJccSGZ+mHYtuf17uKTbq+DjYXiV6psN/ZVuIXSZs3Iq04Ztnvf8qqVpudwBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3TQNM/YrayATkbTiRqKOtaetKIPFB5e1u1n1IPb54k=;
 b=TD9vkaDtpl7hT7fLz5trnODOSTgLorxA2D7DWEvMDmHG6X3m27O9EBeQ3yneK2qgw6tf5HUANT8Qhdv5vB6f+lGRqcJTqbebd6JLRwS4tCZzShgI1oKbXNZsO7Pd4nv+xk3oYzBLN2/zFkw9FnFLXwKySZLnhjitXsG+GLQBzHk=
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>,
        "Martin K. Petersen"
 <martin.petersen@oracle.com>,
        Richard Weinberger <richard@nod.at>,
        Anton
 Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg
 <johannes@sipsolutions.net>,
        Josef Bacik <josef@toxicpanda.com>, Ilya
 Dryomov <idryomov@gmail.com>,
        Dongsheng Yang
 <dongsheng.yang@easystack.cn>,
        Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger.pau@citrix.com>,
        linux-um@lists.infradead.org, linux-block@vger.kernel.org,
        nbd@other.debian.org, ceph-devel@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH 01/14] ubd: refactor the interrupt handler
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20240531074837.1648501-2-hch@lst.de> (Christoph Hellwig's
	message of "Fri, 31 May 2024 09:47:56 +0200")
Organization: Oracle Corporation
Message-ID: <yq1wmmstih8.fsf@ca-mkp.ca.oracle.com>
References: <20240531074837.1648501-1-hch@lst.de>
	<20240531074837.1648501-2-hch@lst.de>
Date: Thu, 13 Jun 2024 21:35:39 -0400
Content-Type: text/plain
X-ClientProxiedBy: MN2PR14CA0021.namprd14.prod.outlook.com
 (2603:10b6:208:23e::26) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|PH0PR10MB4709:EE_
X-MS-Office365-Filtering-Correlation-Id: fc9434ca-65c2-487f-2600-08dc8c124cdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|1800799019|366011|7416009|376009;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6tKH6/yUNz2JZ0R9YXERUAfL9Y1IMPBkQotKmP7CsDUHiL78yt0X31Ocn+Kn?=
 =?us-ascii?Q?W1+oPR1/DGwi4gFr6e0pj1eh2rY7oZXsrUwWtRX9fkblsRuDOkICyqecMzkC?=
 =?us-ascii?Q?i+cZCqc3KvUAO2SQtnlQ81nlPC4zeRBkhCfyhIdCTBy6Mr/1mppo36w9sjW9?=
 =?us-ascii?Q?/TNwXuw9aPu7JGFel98qs+DSlg7PFOGsbEP/40BeW8tRn+IaDZ+eLLpwYc1D?=
 =?us-ascii?Q?X9AXJkQSu4Ixqgg+rvOuhdkFsetbVO3WJs7t+rW7/xNPmIye7kV8OPDzH/H2?=
 =?us-ascii?Q?dOEJ+07Xh7EfCHy/QC36hKZNYGx6w5/2zNexoqFVZu0xM6wiHQ7zvNNgWB5A?=
 =?us-ascii?Q?REjXcDZ0xcJTjLDhMTQsskvSwQTtZssMseypzluOn26vtDlIIGzINrlPkece?=
 =?us-ascii?Q?JoDF+r4sb17yLlN3Sm4Tp4PBn2h8OnZVGydz7AAjhiLF5k9zNTkadwl8Su6M?=
 =?us-ascii?Q?nVhXNF+naCEGc4BZOSpNxk33kNDyM5l4ao+BbCUVq0KGHEc9TKQ+gw8nTIiZ?=
 =?us-ascii?Q?blMMgwxdFRIapODr0IoOsNrzRADzUY5t28mRo4Q9DDB01mkzbLIbqIDpSzEp?=
 =?us-ascii?Q?QeKE82lbpUZui3Hc0CihQtFWc+YJXWXEWhW0aWEc+5ezN9vNYeaTDMtLbYax?=
 =?us-ascii?Q?ZK+58vj1vlf3B+aSTK+iKgCf5ZksOtcppf+qWaObUGtAqZ/kDU2Lc5EQ2xut?=
 =?us-ascii?Q?WHcy9QrF1GGrLZ62EAGoTe5HaORkr72+IcDeb5PRI2tf7WnHNmN1hOExwmzt?=
 =?us-ascii?Q?0imEv2RVd2iqfFr0kB+KocaTftIUFM2MKFZXXa9O3t95hG3U1H6uFMehey18?=
 =?us-ascii?Q?LKSNcl69iem8v5x1rvqDXrnM2JmOn42Be9oCzfCSRqMQJqlXzXcWt/j8lW6y?=
 =?us-ascii?Q?JRnXB+2+wF1fsfiplxHo2uR81kYBEnChQsbuosfWCMUNDd/uyLcWAKcnG5VI?=
 =?us-ascii?Q?Yu1/ViHdlkp/RScaJ8EGeZBSDxVOeHj2TjAG+rXk5cRCNHMwRGddbKz0d+08?=
 =?us-ascii?Q?ryMLWTE2I3VFX5TCUcF8D2AnX/8J5xmdSuryLvE9dm/3lnKxD0K23Q6JmPsO?=
 =?us-ascii?Q?8QhpWMa1B6oAdFsmkQvhfsY+ohPJC5ah3PY/Z0FqV0Z+Fk4amGxS17E/rrnj?=
 =?us-ascii?Q?7cF/OwpoCWcbt+nvVXfF3xxkieoxWGNUnU7siWgYzrLgw4bUvTU7XDq7sCjv?=
 =?us-ascii?Q?aiWQb8IoVrAeDAnttZH28f6TypGi64yKGCEG2ytbT1S/DW4dhXx+tOntJLPh?=
 =?us-ascii?Q?fY0csFyVPM9Iwm8QhFzcT36bnTPWR8Bq4y0NJcbPIaI7a1D4RO7WZsh+ExBz?=
 =?us-ascii?Q?GPV5oCOcpmzCVW2x1ex/phLT?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(1800799019)(366011)(7416009)(376009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wPd2cFjO4jpNz/ACotIhIWnC7N5h2V5YS1aDOiru0MzGiOhNXkmUh+QcodM/?=
 =?us-ascii?Q?BgX2LVAQpFDCThWbEZ1mLPv/vRH1Rb7thkGntgdZqbAb6Baqc5qCUxvB7SPY?=
 =?us-ascii?Q?T4D1TTmk5qRyE9tk1BIIVDMroceXf9Di3oHHbY2Fcl4JT00ja+b+5Vs+qc/C?=
 =?us-ascii?Q?LDSkLEdE6poPBJyw/zteJqGZJ48qqGXSyG9ujQFQ8ZrBu9XZraJDapBKVvP1?=
 =?us-ascii?Q?mO9pwAks85xrE5VkvMCQmtS7DLiRubC1HcEWsnaFZfFAhiPXGgLKIWL3seXX?=
 =?us-ascii?Q?5gxCd6XxJajRXL6M35WXQw1ppbPTiXy2+ytYh6U4MRtd3SQR1L0bkk+G18Bl?=
 =?us-ascii?Q?64s5mtsPjzk+Ulci0jT6RnnZa0FiCrXMUEeW0Ug/qgMfq/Ui9CR8CXMfFFxG?=
 =?us-ascii?Q?8KzCQRSlIw7e/X5F/d2tLRbAmSIwSgisEEsbM/cM+QlIYvz3qZEl6ieHpgUw?=
 =?us-ascii?Q?R9x4JWnmE/3HVoyS6NhGP3Gw/0OZNjn3qg0o1Do8SnTvgeAyXfjjDhB73T9l?=
 =?us-ascii?Q?VAb1Ht5tqx06NXRr/SSSLMxFssRdYEepPniAWe1Cojr2beIyrdOTy/4KWHLa?=
 =?us-ascii?Q?nPfBXM7XtB+e9xnEkJN0xskNtTZnnCE3wTbIQvjxxT1a54RWy4sxrH8BperY?=
 =?us-ascii?Q?9X8PCFCRjea7k5jE1xb98/AOOlcctNsKVjCGiDKPeVZqVwJ6+LfaT2dU0Ssr?=
 =?us-ascii?Q?V/QN1lHF2ejlsrEe4TUgoyQ0FiuCzuzkjb92HegkeEsAoVpUm1UKwIUd+wf/?=
 =?us-ascii?Q?sb3UfxUpl4GzrI2DWWqjF594zUUtyBNU2QTC9mAiqPyZPZBvLikZoj8gJx1w?=
 =?us-ascii?Q?ot0azQhPzhQ0Hh5XpXsj866lEyqY6+QveAexoAQsiAFjDS+ZdbTvusHIBQnV?=
 =?us-ascii?Q?ldawLnD7immCU07qjlbZd0Yc1fZWX8kGHLhbGfSpM0Sk58YmBY6KQrPR1Otv?=
 =?us-ascii?Q?G0sgJ12elIsymU5VUrlDjrh6Sl+GxMGB4AXxL/mgPqwkxOX1oLC7r4hLWa5u?=
 =?us-ascii?Q?6ah+7u6/yhk1mtgOGd+l0Di7i8JnFvTVNVOs5PbmrylUULuD/V8qO8buhBPA?=
 =?us-ascii?Q?C6nhdSOpjEdJOmDJxTz8DxX2xXf3CjZUZSuvADJ1a96Ra5OBlFJVxe4D85CG?=
 =?us-ascii?Q?nBm2gOeIca/6jRtypiQwizHV+56MClieArPVCoXO8y3ktAKSahDfgFcrqdCC?=
 =?us-ascii?Q?CdkGXN64xuYM4LYZuicoEL9Cpn4eorIw9xBTNmbCsil8nzHtYdmWUWfrBmfz?=
 =?us-ascii?Q?cAHkGRPt81zwy8a52QzTZ8SM5NqLu9k/tVkZN+h7/Daiz7h0CV/QONRKQ5yK?=
 =?us-ascii?Q?lN09U9UP+igoZaJV9HIdX5q/mQuQUgG1Hj2rlZIsWsDyp4uydb+vsuqA8dDw?=
 =?us-ascii?Q?SUE0i0qdowteAXUDIhYHACax7aE1RXE7/LTMCc5Fqe0tO0j1Iuc61tHSgjm9?=
 =?us-ascii?Q?FAadpTq8ChjoEAoGFRyCTEa1m/niF6eqtCqUnpAFwPhza8AT25gNt2i47mW2?=
 =?us-ascii?Q?1pD2KkhmC9sdb0HaJbVY3jCGsjE/Vr84x1trUEBdupHHty8S1vJSeI4Ogf6Y?=
 =?us-ascii?Q?Xo5AUXR6CO/hik1TPIt7AJfnsnVE0hoeT3m+zBuVFUyYYgvWN/sxJMiSBxkJ?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	+Z0TBsuAxjbiJnXauGxjW+HJugc0tXmrA/+RtqtSJl9PZZoEZJsyEosL3j/jnY10EXxa+BWsFoin48Y4Zv+Xka5kBgUPLX3Cd7oOlZwJkTB3Kyj0kW1VzGYVGZPBsk1RkrB3OBxjIe+yI/XvPmB0/+R25uzfHy7tQ5voZYJzdqRuSAD6oJQCYUkz+et9LZPVQ6IVtYcUubCHJKoKbkEhIAvzwfhnziYpHcTC2v+z66y18lN4zQn3ZV+QNA+//Ltf/yB214ZQHTZWYF0i1gtYQ9olFmCZ3Qp9+RMWrIFH2CV7UvHfzzTBFVLX+K3krLMSpaxdZeKJlkkcAU/nLK8Yl/PltPXJmDw9xYM15TL1XTQI3lJujZbcb9EBAqYRH9tMHhLbFR+BuwSHLvKwkrI6nX7O5n5rVRjSXKDoFX1nA9MEFgNUnOC8o4aTZHztoyKTZTBkfpv4wCOY44/Yc+1Y7fEFrdgWcFfPGyKeKdRCVr7eIHnBeyl2BaDDjKRVr6NbrFS9ynYGPCH2YYTu4l8hUYU9qiuYc7AgVYaV3HBDiLooc4voeiRKM2tfLqeDucFrsagwYRirrFqqdf7eonXoso/97RADDWDa2B6MXySRil8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc9434ca-65c2-487f-2600-08dc8c124cdb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 01:35:40.7410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oHShx3j6L42uWoFgenETXJXt2qriiNrZ/IuZ9rq/5sXVzotePpXy28mfWb1ZFxp/nZiyQNrG7/uu8xWHwZ0yGJh9PSMtGD/o3loENmehoPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4709
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_15,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406140007
X-Proofpoint-GUID: dmXeuSBTYY4HSrcKvdYaxwCtng16SnEJ
X-Proofpoint-ORIG-GUID: dmXeuSBTYY4HSrcKvdYaxwCtng16SnEJ


Christoph,

> Instead of a separate handler function that leaves no work in the
> interrupt hanler itself, split out a per-request end I/O helper and
            ^^^^^^ handler

> clean up the coding style and variable naming while we're at it.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering

