Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8895B517BBB
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 03:51:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319145.539253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlhgq-00025q-Cn; Tue, 03 May 2022 01:51:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319145.539253; Tue, 03 May 2022 01:51:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlhgq-000231-6o; Tue, 03 May 2022 01:51:00 +0000
Received: by outflank-mailman (input) for mailman id 319145;
 Tue, 03 May 2022 01:50:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=STGf=VL=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1nlhgn-00022v-Vo
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 01:50:58 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 775fb837-ca83-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 03:50:54 +0200 (CEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 242MZb6Z026110;
 Tue, 3 May 2022 01:50:49 GMT
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruhc4nub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 01:50:48 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2431fmrg004581; Tue, 3 May 2022 01:50:48 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fsvbkx41d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 01:50:48 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BN6PR10MB1475.namprd10.prod.outlook.com (2603:10b6:404:44::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Tue, 3 May
 2022 01:50:45 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::125:f19d:8eaf:b8e4]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::125:f19d:8eaf:b8e4%3]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 01:50:45 +0000
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
X-Inumbo-ID: 775fb837-ca83-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=wQW2wD7NFcfGazO8HUUSdyAhxwbex56NYFqrnyb5eJo=;
 b=sDcxCdkA87S/uqC0d/KOC/7oBVjMKAY/47yN3kiTPveTmDsR41cso4CrX1vXcBrKILlo
 uDczA1cERqJG/HDnALlxzCaijIc92Lg+QMvMGOnaiqsu+VlQsTKzyrZtzN2Q+W40MLXa
 prSM8uFRbIFzOCupX5VFz0PR6QjXFK/dqpEuGCvw2XDJa08q18pMHb9hdP6J2xK7Zse5
 Q2QN3yKgBEUioxcnYt3UfqRN9REbkFxcrMSpxduLXXczw5BJMx371WodY5RtvwlSjzxm
 gjTdqUh4dsQEKsWUwwvLy+gcKBCX2PRtLS2Xr0xsTuZBswX4SgvITp//eZ7Yj9iRT9mo QQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FO+xsOcRFQ64WWNoy6SPgol4/CEtu0WNqnUA1sWLUdUV62eDFy1PgTMDr+/wRYoQkqjOzHi6TSk2PyNuNgLQbNETe7jLbsEN1jr9ME8fr2X0NS+JreMoMtJyx6/d/4gkZQWE3ESvy7Mox/fGscJDiorSWMvBVLEuUNsIYUEk/26mj1JMR5Md6yhy5YoCJds/2zwnqRsTb+h4h8Li/LiMh7UutGNGMh63lLd+x6CK8ZJSsr+oBYYa18nvXRXqHw7xflKhHWrpnv7gjdppY1wZXTbjs2NuwRYG8POddx2aSfA4nKQlpUW7GUl/0zlXpGrGkMVd2YzdFyRxIP7HixbZbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQW2wD7NFcfGazO8HUUSdyAhxwbex56NYFqrnyb5eJo=;
 b=DVMdVZhLdDzWfe8JaBGkINQapZWNL9CGiE6T0bqy7QW06/tPtY6ZIqjaIaGFoL/9q1xdFWyDQSTJ913VGO8713JQ+Aw96+683df0lYUH9JqPELunm51C18jR8HsjweYXXAZd5jur65v65qfnGreR/tyZhKWKiqnB/K3ItW1qZdsdfGsPolw7jBvSkc/izmaz4CPj2rtc7vKp9HgAUC0v0szoiPytd8/uPBDTdBD9utdL8BCKu5bamNV918Hnh9nMt9k9/lwJS8gSZM3Jcta4M6OaB11FhIZZ611KsYaV8wkx5ST9eV7ocMQPD5hcywPCVWuFGuGmUcxVPEvOB9lqAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQW2wD7NFcfGazO8HUUSdyAhxwbex56NYFqrnyb5eJo=;
 b=hnlbX04dKIIIEg26HxaUk3fOTa8PCFOE4SzQIDTVnVjpqAuCS7/S0hsPmy+OrsAPvATazmlUqTgMmpdzLW5wqSj34dtEMCHaJ6GTuKpxJnVvaaDtWfEJdzTwhOmopK5Mh/IkkO4VPw5Z6iSv4pAsAFoheSJib+ZPIrnLdDnt0Ek=
Message-ID: <c3c4fad4-378d-4982-899a-7c127328625a@oracle.com>
Date: Mon, 2 May 2022 21:50:42 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [LINUX PATCH v3] xen: add support for initializing xenstore later
 as HVM domain
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Luca Miccio <lucmiccio@gmail.com>,
        Stefano Stabellini <stefano.stabellini@xilinx.com>, jgross@suse.com
References: <20220429211027.2034134-1-sstabellini@kernel.org>
 <e9c87df2-3677-52a9-1a17-1314ee3d9950@oracle.com>
 <alpine.DEB.2.22.394.2205021728520.2819275@ubuntu-linux-20-04-desktop>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <alpine.DEB.2.22.394.2205021728520.2819275@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::15) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e09e3b83-7625-4602-23ca-08da2ca756b0
X-MS-TrafficTypeDiagnostic: BN6PR10MB1475:EE_
X-Microsoft-Antispam-PRVS: 
	<BN6PR10MB1475B145C10483852405DA528AC09@BN6PR10MB1475.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wBKklxB1CEdznIjDPJ6Y2Sy2GDto/YG8VuMBXQ9x3rZm2S2gZLEs7aXr37sUGcf1tlSDRyTSVnThRRqlgL0yUWAiVBi4NAUzbqMY8ddOq6qoLk/J1iwhOsXQc/ra0hblkQBzIepzDWZV99a24bMpjo8pOgX3LTiQv0dvQCaVnBfsHZYaVZ/ifyiQU4GUGtafO4hlW2Pqi6qotNp9dS5Bx4qG34VG468RLCkECxGTZbwzx0yaqLl1+YOBIAP2PL14OaWm1ixDTJaYTLUNTpQ1772Xh8InfAeGCya4msDJW+WQh++hAw0cr6dfoQJAu2TJHvUA/EVS0m3Zux10lD9igVJdLZcpXKazBR0X7nKubw8NzgiWfDHgLs0P4usbLvlWOURW+RJVmMNBNbdcTGSeDfb7VUvdwlBaqnES7dHVgJc8ew1tWbLyUA++fEFLUYzLzgzbHUJLLBN70AKLC40vC4adMuECCHchJ4bX/hrZqULydELhb22EkmAZjfLct3ka9fgrlvSsqWrnNCxdKUlJC/dai3ntJ6g9kmIlT2ok83/v+Yc07GpMQF5JKyUa5LC42MrknMzt+s570rFQvsDyvU3o9NDoYmtE3v0EZ2fiJznfrila9YIS2NKfHe0uToiWkw20YX1FGZ9axlEBJtv/axY67lEoFyLXcuxxBN9dRrQqj6A/tGyZp9ffcSMYphxX8EBaqI0XuF1cYIdkK7ylbKA+8y4yXSqiz9G+5kgotC8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(83380400001)(26005)(31686004)(31696002)(66946007)(66476007)(66556008)(44832011)(4326008)(6506007)(53546011)(8676002)(86362001)(5660300002)(6666004)(6916009)(54906003)(2906002)(316002)(38100700002)(36756003)(8936002)(186003)(2616005)(508600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NDZTUDEweFhUalIvbkluUGticm5wT0ZqMHBYaGRYQzZuOFJ4VEJuRTJwQnpQ?=
 =?utf-8?B?YWJuZTdXeThWdXB2ZEp3bVBaU2dmZ3hZZG5jekhtMTdRQXp2OHpqdmxQOC9Z?=
 =?utf-8?B?SVJ5cnpobkxyWVFNSHltMXhwTWcvazJ1U3NPUjdjMkhWU3crVmlmQXc0aVo1?=
 =?utf-8?B?c3V4RnRXY2pFWU9JM3diYTMvM3R3bXF0aFRsMDdLVTV5Z0ZYaUlMbWZrcVBl?=
 =?utf-8?B?R1pIdGQvTHVhWHZ3aGt3cTUzT3Q1Nk5VekRBVll4d05RQ2lKNjJyZWhzMjVs?=
 =?utf-8?B?NnVPNGdUOXByUVFHL1VwakNWSEtPb2xFYmpyQkxOMHRBOVlMOENtNWhabmJk?=
 =?utf-8?B?K3VMWkEzdS8rN09BbnhQVnFHOU51c1ZhclFtQnRSQ2ZjYWRmRzg1eWdYckJJ?=
 =?utf-8?B?Mi9ZU0pIT1IyN0lUL2dTRURZdVc0NkFINGd0Sk5yQjdqZEpJUG41N0VhWTQr?=
 =?utf-8?B?MEJ5VXNaVy96MTJNL0FyejRhYVloNGhRdER6TFpjbTVKbVozV3lONmFIYnYw?=
 =?utf-8?B?UkVTQkJJVlNNREQzbDVEQ2U2eEF0L0ZoVDZoUVVHWldhaWR1LzlBZGdWTHZz?=
 =?utf-8?B?VnFYckdTUWdXVGRVMEVHNFo2dnFSOWg0a3BNTXQ0V3VoSFRaTUVGczBRb1F6?=
 =?utf-8?B?K0V0bGcrelYxTThYSDV5UjEwaHp5RFl1NWtSZDYzY0NwcWh5TnJxcXJnT2Fz?=
 =?utf-8?B?a0ZIcnNlWEY1UXlZWXNkeThWSFdIakJLQVhVZXZjTDRoUlR5WnhTWk9vdllW?=
 =?utf-8?B?U3daNmlPNDBFbXlpQzFGWnk0d1dCYXVrRnlnMHdUV0JWZllSMm9BSHZSejR3?=
 =?utf-8?B?eVpvL2p3QVMvUFdrTis0UWRYV1FmUDhkMWM1WlBYTXFJeWxpa2tEM3BZSFg4?=
 =?utf-8?B?V2puVHJaOWJEc3NuMDR1SFNmMkxueHFtVUlBa0YyY3ZMVmtTc2wyTjJkQlEy?=
 =?utf-8?B?NEN1SGlWZE1FUUhMM2RqSUFLK2ZOeTVIY3VUbC9aTUh4UDdZcUhES3U1SkFJ?=
 =?utf-8?B?SWp0R2R3UTcvR2w2TnVSd2taTHVEcmJjQnd4eVg0eFpxN0lrWTllY3ArNUFa?=
 =?utf-8?B?UjB6SVpvL2hveU9RWTlEbGF1aGFaK3E4ZDdFQXQ0a1lNZXJRNlV1TmFDVndm?=
 =?utf-8?B?WTQ5ZG45VlYxb09PQTY0MHIyWW1WSHpkdGppNnViNFFodUUrbTYzUk5NR1p2?=
 =?utf-8?B?MlZURktWY01wNmpzdlBuRG1JQ3BNdGY5MkpvVjhSNm8yc2tBVnBJQWtvbGVV?=
 =?utf-8?B?UmIvaFdLS3VwMEtHQ3orRHdPd2FFVVRFU252WU1nWjNqeWpQcUY0WGU3R0RE?=
 =?utf-8?B?bDVBRkhlYVBhVGFNSXJLSFFpbW8yUUZXYkJUVzFUNDN0ZUJYWW5OckJTTHN6?=
 =?utf-8?B?SWRaTFk2NDBtcVVuMUtNd3BHM1JQOE9rQmNmZDRPTitvWUJ3WGwyUll3SlND?=
 =?utf-8?B?NUpZS1Y4S3RlWlk4V1JXYXptTEtZWU5SSDlDSitXTklGTXdHZjZCeDh1OWdP?=
 =?utf-8?B?T2JDSG4wOGZ2Qjd2M0lwRS9ZWk9LWXpyaTJBTmRWdHU0RHJKWlQrRGxmc2hE?=
 =?utf-8?B?YWY3dWNNYmtyckd3TVFnOWg1NURMTzl0LytQMnJVWDBaM0lPVzBLTmQydERh?=
 =?utf-8?B?bDdFVTNha0d2WVo4N1hYUUREVjQybUlzYkFPT2ZGRWRiVnZqRk5ZMDlHSjkw?=
 =?utf-8?B?SjhEUnZNQUtSMFJXRThMZkJMTUdEM2NRSVJOZmNpb0hPZnBER2hmTzNRbDJ2?=
 =?utf-8?B?bk1EcDJ3VUF6bE1FUnN2WjlZU3QyTkZBdWlNNFJQWW1JTE5HZjZsdCtpUi94?=
 =?utf-8?B?Vmdxa3pxNkhOdjBKendXbllHamVoeExKVHNCNU1NemNsbWozUC83TmxJd2dk?=
 =?utf-8?B?cHFvK0RiQjhpK3g4bFJUcUswdXBuL3ZkaUZvRG1BdGlTa3VwVllRTitPNEVa?=
 =?utf-8?B?S0NhZ0loaTErc1h2T1o2d2V3cUp1dEVCaGRVL05leW5ORytrOUVhWnkyMERp?=
 =?utf-8?B?TW5ZSGVlUk8xYTcxWS9XRGU3ZVo0U2JqQVgzaDc4ay92aU5uL20wdkhKNmFG?=
 =?utf-8?B?TUdVdGRpeEo0c1E4YTZMOWRHNVZ3TUN5enFrSU5iWFRVT0pPZ0hqTVIwTWlE?=
 =?utf-8?B?UEpKWlJMZVBzMHhuTmV4Y2wva1ZZVmExR3Q5eW5sZUpRY3JGbUQzcDFGMUhy?=
 =?utf-8?B?ZDZ0Y3pvRkZlWnpzQ0tKSk9jQ0I2YmZVY3ZwQ01kY0JEbFNvR2tCdHp3THN0?=
 =?utf-8?B?R0tCRzlmc0swbE9PQ1FlVkMzcTF0QUJpNmgzU2F4U3d4bHZmdm85ei8xWi9P?=
 =?utf-8?B?Nm00cDdQREtic0Jsc3hOZ0piUHMyc2xDa2xWd1VPT3JpWHA4VW4wTlcyTUha?=
 =?utf-8?Q?ua04Rv82Ddkzh+bQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e09e3b83-7625-4602-23ca-08da2ca756b0
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 01:50:45.3453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4luSmEj3J25dN/cMyp+AZElt8rFzXnmmIRhuz2pxLREJ5k0CIwvUdPQyRWZ+ljW4S9m4smpszcvFzfUgEvQF+Kkw27mQvS7DGTcMO4EGIOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1475
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-05-02_08:2022-05-02,2022-05-02 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205030011
X-Proofpoint-GUID: 2CS48yCfPDzohwtxyh1_xU74Pcqlw7ac
X-Proofpoint-ORIG-GUID: 2CS48yCfPDzohwtxyh1_xU74Pcqlw7ac


On 5/2/22 8:36 PM, Stefano Stabellini wrote:
>
> I gave it a try and there is a problem with unbinding the IRQ here. If I
> do that, later when xb_init_comms calls bind_evtchn_to_irqhandler, the
> event channel doesn't fire anymore. I did some testing and debugging and
> as far as I can tell the issue is that if we call unbind_from_irqhandler
> here, we end up calling xen_evtchn_close. Then, when xb_init_comms calls
> bind_evtchn_to_irqhandler on the same evtchn, it is not enough to
> receive event notifications anymore because from Xen POV the evtchn is
> "closed".


Ah, yes. That's unfortunate.


>
> If I comment out xen_evtchn_close() in __unbind_from_irq, then yes, I
> can call unbind_from_irqhandler here instead of free_irq and everything
> works.
>
> My suggestion is to keep the call to free_irq here (not
> unbind_from_irqhandler) and improve the in-code comment.


OK.


You could add an argument to unbind_from_irq() to keep the event channel open (I in fact am not sure it should be closing the channel since bind routines don't open it) but that looks pretty ugly too.


-boris



