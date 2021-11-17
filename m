Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3473454A7E
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 17:05:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226907.392279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnNRA-0002PJ-KH; Wed, 17 Nov 2021 16:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226907.392279; Wed, 17 Nov 2021 16:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnNRA-0002NW-G4; Wed, 17 Nov 2021 16:05:28 +0000
Received: by outflank-mailman (input) for mailman id 226907;
 Wed, 17 Nov 2021 16:05:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qgGu=QE=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1mnNR8-0002Gi-9V
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 16:05:26 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b6fff35-47c0-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 17:05:24 +0100 (CET)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AHFL8GZ009089; 
 Wed, 17 Nov 2021 16:05:22 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cd2ajhany-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Nov 2021 16:05:20 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AHFxE9F023879;
 Wed, 17 Nov 2021 16:05:17 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2048.outbound.protection.outlook.com [104.47.57.48])
 by userp3020.oracle.com with ESMTP id 3caq4uexup-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Nov 2021 16:05:17 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB4381.namprd10.prod.outlook.com (2603:10b6:208:1d3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 17 Nov
 2021 16:05:16 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::8d84:1f40:881:7b12]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::8d84:1f40:881:7b12%4]) with mapi id 15.20.4713.020; Wed, 17 Nov 2021
 16:05:16 +0000
Received: from [10.74.104.192] (138.3.200.0) by
 BYAPR11CA0104.namprd11.prod.outlook.com (2603:10b6:a03:f4::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.26 via Frontend Transport; Wed, 17 Nov 2021 16:05:14 +0000
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
X-Inumbo-ID: 2b6fff35-47c0-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=XgiTadkq76ZVDpjxNeUJMWZL9Ld8qMmI7T3pK/mN4Mg=;
 b=RBAhfWomCkehhpx8HsBs75zIVGZT/FESLvjTBWInS9/Ibh6dnzxNz/DDLP+Js2KsYcoU
 mtI2FgaOwT7I7qnxONlWKI0cjFsw3yIcbVnFjeQVWfNjRUbkdZVTuzGD8U6JpexTVHUs
 vtJUUX1+c1Ce2qXmXvAE+fnLlT6IbncVkc1M5XejZX5pZ5c2JMvqA17ZpvZHeIlosquC
 JFYog1nAn6drQUZuEI1Vk+Z2L4gsYdbodVCB93W+cBWcnNDw8UIOCKzdL2oIctZHfWcD
 1LmB/U6vO8txHUxJAtIwPpH1IWUv1WkDxr/CYtTJwSwlYfG2M+fO/FIhENpCpa4qnAqP PQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=foXCT52okOASJjhPC0bMVpzsdSIMEX+bE5zY2XlLZR/xqDwyXd2oVhjQxVJ+8HbLIOQcfFbBj6/fCw9C/esRzlLi58vPd6ygssYpRj/kgMPZQcRP8zFr9DoDXIPnvxB8MNw/YXA5lWdb/dimkXDB+mHSuFb22Xel76j026/35n5/a9aKSWQrXqtLz9IWnAmHIXaHw22usgWG4ZrEuGPFvLUUUHjmDjW3aHJEyai/ToqXXieL2kMcmaDygM+H86utO6m7Lqvm8oawyFy2d6sNycjfu3GiztTQD9UidNEyOxtAgaQOWUw4F5rsQhdxQuQ9plN+dHWR8zs4/EgTQJtteg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgiTadkq76ZVDpjxNeUJMWZL9Ld8qMmI7T3pK/mN4Mg=;
 b=YRLVPIcDoSVUiVuzi8OfiuMxMzKvKxj65oG0aNRRpur/jeYxyUPPWPmHX5z3i694rIk38hTyjYzEBawL8B0hPtsXrFOcXBaZHyEtILDLuOGXotoqtqS8Xzv1vCnMd0f0p2jg7wFIQQ1jh42JbWvXySCXkqi64hprCgejPPRM8F6b74yvNVvsYjLgQN4cB6/8lddAe473gZP+vHIeBodboH2sPabKlucpSE32YYjryXvONooegGitEC6xUhRMqDmGwUf5Q+YCRiZ53j6bRNbtsr1yl5zZkamVkLzPrZUj3AxAfITCGxyuK0+0gctB2/1ewSPFf5qjLelHtQd/pgWlTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgiTadkq76ZVDpjxNeUJMWZL9Ld8qMmI7T3pK/mN4Mg=;
 b=0Ep7z0ETs9ic354+VCHPPmQNH87C8F8K/Vl7NAGIodUDSpUjvj8TRPSqd9NTW4aGxuf/0uY01Fmjd4/JYaJwa0GMeadNOJsacp43nfyAbg9g4+49q+pqGCFjPL6IoLmXL9GXk6JaiFPWCXaQcOnsvqD7sipMocWqoZAyJKVz8kQ=
Message-ID: <cb342108-c470-7623-0255-c4d35e2fa73d@oracle.com>
Date: Wed, 17 Nov 2021 11:05:10 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH] xen/privcmd: make option visible in Kconfig
Content-Language: en-US
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: linux@weissschuh.net, Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20211116143323.18866-1-jgross@suse.com>
 <f80f3207-363d-51b7-4ae0-e4b8aeb2544b@suse.com>
 <b155f66d-8259-ba87-62c4-ce8a0f7ed82f@suse.com>
 <c6de136f-a1b9-2643-3858-9cd3d76e6f57@suse.com>
 <f6957992-3431-c576-a8d4-daf4e60832cb@oracle.com>
In-Reply-To: <f6957992-3431-c576-a8d4-daf4e60832cb@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0104.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::45) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10266b62-aa57-408a-30c7-08d9a9e40b3b
X-MS-TrafficTypeDiagnostic: MN2PR10MB4381:
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB4381AAC501363768B7F980408A9A9@MN2PR10MB4381.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4WkZubKHNIjxZtXkw58DhLAk8mQiX2BhumQnkefKR5bPKQcZoAmLmqYORUcNV5jPR3l9s/Jn34Wm6OeojtaA5eqAz2FJpv2zLtDpPXHZGdbky/DzB1Z6WmQGgNCEdfAN5HENPGP5tMKME46ttLSzJ27+2u6MuopsDb1U5uv26WIsOXJKlrelX9qoyunFP2sa/dlSljb++tAZjkqtYbDBY2NMQHj5bM5TLyc0ZxTCJ8ljcAq0TnPWtjVngW+hOV/wpnC/3PZA28BFxXJt2PGMOia4/vFb8cYpmPW3xnLOGZHAojPa4kLB9TMfmqb0g714xRfsab3PNvELUQwIHei7T//x91bxWVCw9F4Nlk93NOB9RCUYJExt3ehNgMngcXtXMeJuGEiGHz2ceOUuFVQUI2qwe0VBZgMhGw2kF7kLthfQXSwt9DYrVu1bnc275j+bF17uDdxzdClUYog12IV/kx3Cn0UtKnd0NkcKy37/r1RGJEgpf8cMRfre254MVmtxoIZdlzSlV4x/pfcsA5h9wZcYnRkhLPiNaVoIm//w00PsLkWcTwN5sSt/exZkMlFfaUqY8ittJnCIcdNiJrBE0mQ8Vo981acXfI8HuMPwj3Q3SybVmCRimHraRDaAOdM8OYQW8FgxT6QcO2HzNhGb2+K+jLX0CdvioZ1pMMeXLMTVfOeZ1AiGmttDh6awHt5MhuosEMuNOwhHoqVNYq4hQ5+tY+WB8dTMj4uc1p2/QsN+fOv5muzgi8JdJrScjMzJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(316002)(4326008)(186003)(110136005)(508600001)(66946007)(16576012)(6486002)(31696002)(66556008)(66476007)(53546011)(36756003)(44832011)(4744005)(6666004)(31686004)(26005)(5660300002)(8676002)(2906002)(956004)(2616005)(38100700002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QldoVW5OdEl5all0SjhrYUFNeWEyRmlDRlRXYnZMaGxERHcrU1NycTR4bFFI?=
 =?utf-8?B?enFEeXo0TURwU1MyZlM2dGJ0cTNINjFBYkY4RENjNTBxcHVDajc4RHlkUmRY?=
 =?utf-8?B?dG5GTE5CZXQ3ZjUza2cwalRZL0ZwMVlISkhoSHVVMjJ1K0VNTFRhOXZkd3Bk?=
 =?utf-8?B?RStrTU51N1NKVC9ROW1lSFZscXhtSXUxQnlOVGdmcUtBQWdvTzYvZ2JFc3Yz?=
 =?utf-8?B?TG1qSnVPTVYySEV6c0FZNUNZSG8xc1hLeHdEOTV3SGQxMnBER2xvNlpYYVBp?=
 =?utf-8?B?cHM2bE9oWDV4QUVKbUdLWlV5djhJUCszSzZocE1QVnppSEpYcXRlWWp1TmVG?=
 =?utf-8?B?TWxMa0hsZm52cFhXa0ZWUTArcGVvZmx2UkpJSjZzaFNVNGJFV1ZDOW9YQ2x2?=
 =?utf-8?B?WFpDT05KanZ4MFRTd1RDNlk3UFUrU1E4bnpFZ2JVc3h5d0NYdW1RMmRVN2kz?=
 =?utf-8?B?dUNwcVBLb1dIcDBCQnVtcU9SbEJVYUQyd0M5RFlQWUNLVzgxNFY3UE9MampP?=
 =?utf-8?B?VDZlRFQyNWUyRzNNTlF4VkVScDF2ZE9HLzk2VU9vUER2TWtYTEpZalYrTmtO?=
 =?utf-8?B?dDlkNVhIUHRlaXBpZ3pIRHN0dWVFbHk3Tm81VktTaE5ZbG5qT2sxbGRCQUJR?=
 =?utf-8?B?eklyYkVRQmJoUlY5RExiRDh1KzI1MnkwSnlHUTNWZEtLaW9QMTRLaXp2azdO?=
 =?utf-8?B?Z2tOVVVGM2JIZGl1dDBzNzh5TGRCRXBUUTIwUWptTk9xQ1JSSGdGSkVZa3RY?=
 =?utf-8?B?Vzc3cTlqZ1NDdWV3aDE0KzVTeWRYUkM2TW5VSnhPUTB3aWpxaDdEcmNuSWNi?=
 =?utf-8?B?L2NJVlRvcm5BbjI5R1JXWEdYL2hCelFWM2VQQ0ZOSjdLR1h5MlhtRHVtVUww?=
 =?utf-8?B?WE1KWkJqaXgwbnJ4RXNFK3JkUndqWFZ6SldlUWRScGE3T3N0Y2xuZnl3R0p5?=
 =?utf-8?B?bFVxelZHWVdEbkdPWkxDcUtVelNKT0FRVVhkZU0wa3IrU0VWd0JESzdMZHpU?=
 =?utf-8?B?bFI3SFdGMFJ6WkVxZEg0b2c3d3B1RE5nWEwvRmZRQzFQckJIY3M1WDkxbk5j?=
 =?utf-8?B?TVVrWjh2SlIrTDJjdjdGNDdoVWVSR3VlS3BHQXJYWWVuK2dXOTI0WEJVbUJa?=
 =?utf-8?B?OTBhVE1TUHVUYWNTZ3F6cXVZSlFycFVobTBXNUJUWTRYQlhqS0llVDJIdlNx?=
 =?utf-8?B?ZTlqOVduK0JQMDFqUUhrNVBxdWhYNzh6c29tRWZSSjZWUFpVUUFseVpvNEpw?=
 =?utf-8?B?QzBIOEJQdmFVSlJUeU83VGgrK0x2VjZvempsSXNjdXZQL2NSOGxVM1ZiQ1Na?=
 =?utf-8?B?TWE0a2lqZlZZMTMwT3FsYXhGZ1NqMHl4Y0ErUGxhMyt4V1dWSzRiUFpFU0V4?=
 =?utf-8?B?bG4wMFZQdHIwUko5aENPQnhMZVpFL3dqVk03TDd0and2bUpoRDh1TUFuUnRm?=
 =?utf-8?B?YkN2OVFWc0FVUUJRZ0J0SG5ybnRmckJ5ZkNuUDFwVCtQZGF1WGY1amNwRHZ0?=
 =?utf-8?B?UVVXajJFck1kclR4aEhuTkxOdzAvMU1jZTVBSnlRK3RkTGtuaVlWcTBkUisw?=
 =?utf-8?B?OG0rdUw2dHdVdGdGVUlEK1dWSTNNR0FEL1l4KzdwekJjQ2cwNGdvR2ovSGg0?=
 =?utf-8?B?YmtLUjFTVlpGcm5UdW01ZHVnMlhSSGxBSzlrTjVYczltTWFxM1R3bWs5Ym84?=
 =?utf-8?B?Yit1d1cyZ05iNWJxZ0ZTdm5WaVdXTUhLWWRjODdzRVF3aTlxU3JOT2xNTitj?=
 =?utf-8?B?aGMvMXNLcnpydTFUV0k5Yy9GRVdnN3c3SlZTbkdFY2hHbm1Jdms0SlI2Zm9h?=
 =?utf-8?B?VmV3ZTd2dUwzTXZzQ2R3SnR3VmV4blhNT2pMK05BSFRwZUdPNGVLWjB2S1I0?=
 =?utf-8?B?bmVGMng1Mndac09BU1JEaGpibzIwOVMzL1NCMnYwWCt2SXVQU3hQQ01TZnZz?=
 =?utf-8?B?bmgwOTcrc3EwaEtVcjV6a251WGdidHJ4d0drTHpoYVREQzRwdkovWlhucjg4?=
 =?utf-8?B?WGkwaE1Va093aXlwUHZGdmxsb05QdS9ISVdkdnEyb0YwTnRzK045YVJYRkRa?=
 =?utf-8?B?aUhDRUFBWTA2T2lrcDJsNzJUdE1PaUNhK1JKRzl3MG94YWx4RUFYaGpqMk4z?=
 =?utf-8?B?VXBXaVRvMjRnakpFYVNXMW1KQlhhcms4d24ydVV4NDBGUENjQ0oxQmZMQ0xo?=
 =?utf-8?B?RjYyRmU3YldjWmwzbXhHQnhlYmFJSDFTVW9USGVzM1g5U2I1Ty9HOVZOZXpK?=
 =?utf-8?B?MXZHUVlCN3U0dm1Nd0c0ZGwvMWNnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10266b62-aa57-408a-30c7-08d9a9e40b3b
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 16:05:15.8967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKDsno5c+JQESyCrAvviu8RjHYafuKznkTPEuiRBkT26TrBmdQoH4DQsE3rPEGtk0bWSzDOTgklG1e+kcrsW50255POpIrgFgwG7J8oSvbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4381
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10171 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=958 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111170075
X-Proofpoint-GUID: bhHq3_WPAsMuGuNvs2bDx6XwEOgb0yV0
X-Proofpoint-ORIG-GUID: bhHq3_WPAsMuGuNvs2bDx6XwEOgb0yV0


On 11/16/21 5:33 PM, Boris Ostrovsky wrote:
>
> On 11/16/21 11:05 AM, Jan Beulich wrote:
>> On 16.11.2021 16:01, Juergen Gross wrote:
>>> On 16.11.21 15:55, Jan Beulich wrote:
>>>> On 16.11.2021 15:33, Juergen Gross wrote:
>>>>
>>>>>       config XEN_PRIVCMD
>>>>> -    tristate
>>>>> +    tristate "Xen hypercall passthrough driver"
>>>>>        depends on XEN
>>>>>        default m
>>>>> +    help
>>>>> +      The hypercall passthrough driver allows user land programs to perform
>>>> Maybe worth adding "privileged" here? Albeit of course that's different
>>>> from the use of the word ...
>>> I guess you mean "... allows privileged user programs ..." (another
>>> variant might be "The privileged hypercall passthrough ...")?
>> The former, yes.
>
>
> I can apply with this change, no need to resend.
>
>


Applied to for-linus-5.16c


-boris


