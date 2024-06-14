Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B429080FD
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 03:48:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740305.1147351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHw3W-0002jf-FY; Fri, 14 Jun 2024 01:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740305.1147351; Fri, 14 Jun 2024 01:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHw3W-0002gy-CG; Fri, 14 Jun 2024 01:48:42 +0000
Received: by outflank-mailman (input) for mailman id 740305;
 Fri, 14 Jun 2024 01:48:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OutG=NQ=oracle.com=martin.petersen@srs-se1.protection.inumbo.net>)
 id 1sHw3U-0001dt-UA
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 01:48:40 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3801bc9d-29f0-11ef-b4bb-af5377834399;
 Fri, 14 Jun 2024 03:48:39 +0200 (CEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E1fX4B029893;
 Fri, 14 Jun 2024 01:48:20 GMT
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymh3panfb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2024 01:48:20 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 45E1VxwD020526; Fri, 14 Jun 2024 01:48:19 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3yncayatnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2024 01:48:19 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB5755.namprd10.prod.outlook.com (2603:10b6:510:149::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Fri, 14 Jun
 2024 01:48:17 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7%4]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 01:48:17 +0000
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
X-Inumbo-ID: 3801bc9d-29f0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to
	:cc:subject:from:in-reply-to:message-id:references:date
	:content-type:mime-version; s=corp-2023-11-20; bh=ohpvYIYQ5Y0rSx
	gbAlfez/Hw2+CM5J1pX2W9CzsjH5w=; b=J0Jki9/Wre9po1SfHT2rp3jbyNr7ko
	IDhjR9lZqhtbUECDHx3bULd3zR72iR53QNhDrUTbaZNeY/407YCTFAZAkqfS7KMF
	v5N9xjWQWTffzxlP977S7/D+UF1t5VZGDZn0DzGWPxaCNiHmHyrnGJIFL7zJStAY
	5zm4azP8DHe2GzYqS8og6dnW7EemRcz5syzkpFQynj8QMZPMdD61sMs4Tpq4hb4f
	3lZwVEtXhJ4Lwq7Cf4L5zE/exWwBtextwTcIjTIG+GPhUcSJgN4dJeBeH/m7/dDF
	RBPq3zcmYZacUmvc3wDPAPyX8H9Zem1Va0fB20QXgTGHcaTUyEtOdwjg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxbP85PzWyZ/7IA4Ug/QIIvhmCkRGOxCdhaNgBDsLlAOhfDdTiUcTvFMLGfrnC87PxGf5wezA2Q58USSpxNbEUnHo5sjUjyBwqDQ0BTkX6ksuCpSfPzkiNCn+GGx3h7sESGXryJZ5BFRAVxWqAm1QlwPzvveM4BTDQvm7EL4bX/GbNfA7Zr5PSZmNZ0AT5n9T70m6wYgcocpqfwHIuO9Fg1qOT37KX4D8ntPMAc2KseeWlSxAII7wTuB+blrDceAOTLOB3i5zG2f6D3YAS/Jf093HSy918u3pusS25nUjCzZ0dCyuKUWjNR1n0eoOIoKmd5hhDbQHNQhbf7AGUEfmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohpvYIYQ5Y0rSxgbAlfez/Hw2+CM5J1pX2W9CzsjH5w=;
 b=HzT2sECt6435M5L/LKfVYgeberuuILMyFGgG+pCBCtn+N6Leuhz1nRQt/tI1+O0eekH+S98+gwdzc6oWIy89qoK7OCbxQU+pWnQdHd5ltMPuhHuZbKiKfMAsdHMeNoJzMtm0QLWitFUhF7jjCt/vrx7gP02A/Rexww76ijf1FdXTNi84wlj+i7mMg+3LazFAg4dUYU/5glJfKTJPCrwfpWlDwjkhR5NvDH88XweIPMuW7UMXIUtUaonf6yaEz3//IBmaZIM/f2IeGUbvxl0r/nicPQpP9hg5r78E5x4KgWahohP0wIQhxxkJFxv47vjP6Qh9lX9w26hnNejP9Gr5Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohpvYIYQ5Y0rSxgbAlfez/Hw2+CM5J1pX2W9CzsjH5w=;
 b=jI6bfMd9Dnf6P2YbHi/7+rC8sMOyR7KNaNR6xgptKB/CnRhgKtSHXrh1p8uHl9c7VGJOE24MKJcdvg6QfaUXGvRNT/3FWAP9rQEBWY54ha1OlqetMVG+5rJoUNJrfi4ZxQNeypT2/ji6ndMGVkf4EAycc37608zi0FD+2brAZjI=
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
        xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org,
        Damien Le
 Moal <dlemoal@kernel.org>
Subject: Re: [PATCH 12/14] sr: convert to the atomic queue limits API
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20240531074837.1648501-13-hch@lst.de> (Christoph Hellwig's
	message of "Fri, 31 May 2024 09:48:07 +0200")
Organization: Oracle Corporation
Message-ID: <yq15xucs3bj.fsf@ca-mkp.ca.oracle.com>
References: <20240531074837.1648501-1-hch@lst.de>
	<20240531074837.1648501-13-hch@lst.de>
Date: Thu, 13 Jun 2024 21:48:15 -0400
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0080.namprd03.prod.outlook.com
 (2603:10b6:208:329::25) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|PH0PR10MB5755:EE_
X-MS-Office365-Filtering-Correlation-Id: fe24db9e-b4a8-48b7-155f-08dc8c140fd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|1800799019|366011|7416009|376009;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OWfCm7UBPM8DG8Pfe8ib4K3jd8JVHQYvJgGArVv3hNKtCAFxrp/XSfkzZWLJ?=
 =?us-ascii?Q?32i7yokaK5DiX19R2NkpKisTzYLfiQHw4+HFe3rd6HUsFnhtxmwzzIGdEnYp?=
 =?us-ascii?Q?6Vr3GB3L9hcQE3OMXbyfDFMmzv0br3iQoNtnduoE3d4M2Id4yoSK2+f1877j?=
 =?us-ascii?Q?vMdEo8OsadqFrJPL23yhag4Y+JAlXmK7KOfe+pEMBEz0iMVLnNaNzUH4hipR?=
 =?us-ascii?Q?JDA4M/M7R/8OmgUntKa9uLm7AgkvGu79Ozd3wl9LeoD8ApVGf+UQbLoiFcsV?=
 =?us-ascii?Q?douv2NEkjcEelgID6F7w+sNhgttNCFul5kquUntIw18i/v67yxubQM+G5ynX?=
 =?us-ascii?Q?MmqO8gd4Uc6NgMfnQcqKHw+lgU77pzNpQ+fzDElE6hF/Omc9Hdyv/8I9K3ut?=
 =?us-ascii?Q?Xf5RFrA6+lDx3TWpdCld9tDZAmdS8gBdjewJeEfFLbdFtZ4MNFMQSyRaDfYB?=
 =?us-ascii?Q?1rFGu2HBYx3NBuhHguk0i3vtQs37r6LoldMgQAA3i6MpVeIBofIGNcr3VRQh?=
 =?us-ascii?Q?GDqJ5qwxwyqJo2VnkR1bJMeXQBegWHcjF6UOg6+pqylZocxpsGqyeSJllAkq?=
 =?us-ascii?Q?FIGphwvndEXzuLe70E6szlQ5UDYH8AvqVZI4YXoDwD9zh2VC2bq4p5uoeV3/?=
 =?us-ascii?Q?RLdRORlGxoCMQUjLwlIOLgt0jdDera5M48crMrrOcNL1X/pw485LAxarGsHG?=
 =?us-ascii?Q?GYSLbheUIGbT/Ndr00j5Q3d00Gq01ZsuCaBaQMNsNHsu76AVfXR9vAe544m1?=
 =?us-ascii?Q?fNRLAlnAEmJAJRr+fD6CI9pCmRHzZN/WU3cAZian9G5WuxaPfAQ3cqILFPHd?=
 =?us-ascii?Q?if6YROIaf7sL0qEpc6iirU0JwvOq7vsI0z0vTzRpmTRwKbNsFYi79z63gpex?=
 =?us-ascii?Q?d6XmmH8EmhjSt0zbSpCWFC8o2AHU6Jif58eqCYRlCHxbdE2RkqVcpO10Tv35?=
 =?us-ascii?Q?ftf66YIHF/tmJa2KlqIyaRocbGEbjmEYxynmq+u7slA0PIG6usWQZ/ZkOgP1?=
 =?us-ascii?Q?n50HX+xw3af6HfgljE6Z3wKsXBHvv3CyKgsp9nELrm5+P3R/9TX4QbFjXhOO?=
 =?us-ascii?Q?74KfWJlIgLqqfVmRcUvybn4Kl1nxci1MT1AiWDlkhn4Dissf4qSf7yKlQjsd?=
 =?us-ascii?Q?dwkfNpwQr8XZ0+bYHdXSMCGqrQN49x36mACxDSkO3EWXgh2WoUkJbG3NgH0k?=
 =?us-ascii?Q?gL2MBAEPR1ZylQuX7Z6/IzeixQERoJqyWLV2ba+xMA3YN3Gz9RiCeD+L07oF?=
 =?us-ascii?Q?o1qnVxfQXgt5He9g6Sj9kE7sM/jnoZ68CSIps333VVpQdMvMBrmr89fvyiHk?=
 =?us-ascii?Q?ClaSWx9ltghOKuRsTmDJz60J?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(1800799019)(366011)(7416009)(376009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Sj/o6BSjsPpq/MCTgy8XPEetesO3ZygJX7qeMnIHcNiwHP33e3M57zKrV9gA?=
 =?us-ascii?Q?hWjItlJ6x9uOLlRSamVFdAUq44TN1YFUgIKMdtvYUdtXSoDNj7YRCMn0zPVA?=
 =?us-ascii?Q?+T6X/osZfIyk0fN5Ou/2Ah9rQhBGESrmjcq+6N4VXZ2KVu/g0pGK/CBsaatq?=
 =?us-ascii?Q?RVuJ9wTbX8Wlsb3XEihNq9SUQqW7T+q6R/Qv6Ot4lutqJMWRp+3Uv8lk8Liu?=
 =?us-ascii?Q?mjkymcOf5qaokdTfnWOoKQIm/dqjOBw1q8BryqdiX+C7C2ez3K6xvwoNGKUx?=
 =?us-ascii?Q?cofLojRc39Q5hTCQAQ29/dLUwX74U73vgNPXbsoLXbDFxXBebp7fyWaa8WEf?=
 =?us-ascii?Q?yF/REFss0qzIxCsI2fzn8iPG6sJNJY/b0g7zGtc56Nj4hzlUTKqo6aB5ieZY?=
 =?us-ascii?Q?JXfu5ELBZCcJGBeDwUD1mZNSOd5Am0v5/+vThZrhLP+3dVDF2aSYxqn+HSmY?=
 =?us-ascii?Q?iyHHYJqeJEBTUpKD1BUQ3XQnqDdRI2QWOkV6kSk6CXwzo2Z0zhI9FeN8GqDX?=
 =?us-ascii?Q?RUpYhqVU7ZmnGxBRZ2Et9BftkaCH0/VEUjFWdGtoJjTkOn+IPjqpAbx1D3vs?=
 =?us-ascii?Q?wyAP6w+wYueENMP5+UuZmaQcwjy9zGP4IOtPNzl8hqTP4CgHqXax3f5pbkQw?=
 =?us-ascii?Q?/gd1+3z8w45SnSYtpv00gwF4Db5V+K9VGewD7ggbgY98dyz7H000Vp7X/7eM?=
 =?us-ascii?Q?D16SdX5grtXYdQID5QtnOHNb6WGehlCWdupotk7W4upf+8aIidXBr9GcrmAV?=
 =?us-ascii?Q?rCOt/UPvU82dKXBZn/bD2aaHvTg8/Uyg0k56IVX5EXSm5BUzzAqLm0Mvw17X?=
 =?us-ascii?Q?QP3pnPUh7vnbffIrZ3oEKlfYTviXZ9axYzhGPj++G6vjtG5XhWwpYfjlCOHb?=
 =?us-ascii?Q?lyftZBgvB4kK6ZjlPJldP6CT6iE3VxqxpG0DVeKWVXMI2FkY8XZ7AhtnbRsQ?=
 =?us-ascii?Q?vt80Tiw+eOgkjLewP/zhc1NpAGuRfn9FPVpsSLtdJkKedltsiwpynHlDDnIs?=
 =?us-ascii?Q?n6+gNn4o/CbnT5D7HlUWdgSS10x/jGyRvb2URR5kNO1mdLKJz2fywO8p9YAx?=
 =?us-ascii?Q?xMABzsl5aa0eBHThXIRoi+rxkvxriivwd03cAdWjgX22FbFFm+yKoRkH5Ioo?=
 =?us-ascii?Q?LNKavTU68K/agkJtL1UPu8D4nYEY38jwkvD3QIif2c3B04hNVO4AtzfplOVB?=
 =?us-ascii?Q?cdunnhsJdvm5UX//CTV0HzvQ8woBeZdZui7bvow9QOn+boXC4EijozIUifgz?=
 =?us-ascii?Q?gsDrMFtUpurUDIc+j50ufe2wnjw831iIIcH/hL23Bd7wmdYuYz0SGYAQDWrl?=
 =?us-ascii?Q?NR6apWsfMQ9ncuJrzpFpZN8Upa9hdYLB0q6pJklmGNnFUuMosVg1bx067Z33?=
 =?us-ascii?Q?s90H6BEqr/hinc0XFs0kTQD6W8XlXOESHMxiSTdw+aJLNGMIcQBczhrVr2ag?=
 =?us-ascii?Q?ZhVLz3BJ2wgmLNa7gHQrid90DJQT4YtfEdwbh/FoPClxO7acokZabzAp0Q48?=
 =?us-ascii?Q?4lebyIyuv6jBtL5+Q4xNX9H4Gh/vVGRX5PHOX0bHZCKKKFpp0vCJ4oR+gdU7?=
 =?us-ascii?Q?Prji6lw5QEZ98ugdWugYBWYQKV8bqWgBx1gf3DmSQ7PaUetMmLVf2MncA9RG?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	MbpD4eiClUMzRM+aAWx9fHOuDDDOiWGbW0051E80tgtENvFA5sHk47RBiGJzbtqArE7l6iL3ZaUsj8+mQUiwCAUAL7v04oC7KztMXZwf8pqDu0NAtcf7mQ0aLPRn+JPA9/SX/S5a0lulHGDL3Rbkvj/m9AjsCrn0T//+TH6cLtfJNvaCYFvKlznLdZvlm5Ruf4tbsuQTbzixB6yFAIFv5XooS8M98qcrnQ6uItomEfZhgcxeJaESYEi5ZjfiIxzYlglDGHsQQcluIJPZeu0O+aKOudccCZa1bd5+EsS7GPtNRgpGd3V6W/kZyuOC3T2CfTtHvkocTKdQ625Tp332cq019J/s1a8ogXdqUmklKvazVnLCwp0NppdH3ZCevoVUsC/6gzS0hgxPN0WgB8ktdlIBQJqKotMEbi3v/at/vnOE6L2wJXmLRRzJMuOd595ix5rVjamWUlKF0Vg2VbVAClfytjPGPRGxnvAtGvIqm9w+Kop8yBjK9c7TKIxL+zmNIGcGpPkZW1RjYFOivjuAQkwk3/wWzrsiOmZhOTXVKusmtwYgswz98N67GLFdMNrQlZXAaYeuwa74rwsMZv6F9IzT+sR/jKwrgknQhu+9xKE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe24db9e-b4a8-48b7-155f-08dc8c140fd4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 01:48:17.3419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NffmYyIziCYS4phZOecb+IlCnXGO9+m8ol9VCc/2Sbk4/jGK4P3qR9rfnVdk/wWB9+Yp1XhkGYX8N4vXrpRpBSwqmYIJ9S7vEfSYp6anLFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5755
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_15,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406140009
X-Proofpoint-GUID: lU4zMv3_ZY9DHk9lG_Ex9-ZAo10cCLgm
X-Proofpoint-ORIG-GUID: lU4zMv3_ZY9DHk9lG_Ex9-ZAo10cCLgm


Christoph,

> Assign all queue limits through a local queue_limits variable and
> queue_limits_commit_update so that we can't race updating them from
> multiple places, and free the queue when updating them so that
> in-progress I/O submissions don't see half-updated limits.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering

