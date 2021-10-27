Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCBC43CCB1
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 16:47:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217027.376859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfkCk-000285-FM; Wed, 27 Oct 2021 14:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217027.376859; Wed, 27 Oct 2021 14:47:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfkCk-00024d-Ba; Wed, 27 Oct 2021 14:47:02 +0000
Received: by outflank-mailman (input) for mailman id 217027;
 Wed, 27 Oct 2021 14:47:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7jCJ=PP=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mfkCi-00024X-8G
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 14:47:00 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bcdfd66a-3734-11ec-8473-12813bfff9fa;
 Wed, 27 Oct 2021 14:46:59 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RDpOZF004972; 
 Wed, 27 Oct 2021 14:46:56 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bx4fj3k6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 14:46:55 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19REPdtZ085047;
 Wed, 27 Oct 2021 14:46:54 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by aserp3020.oracle.com with ESMTP id 3bx4gctbx0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 14:46:54 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB4030.namprd10.prod.outlook.com (2603:10b6:208:1bd::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 14:46:52 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329%6]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 14:46:52 +0000
Received: from [10.74.107.92] (138.3.200.28) by
 SN4PR0201CA0029.namprd02.prod.outlook.com (2603:10b6:803:2e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Wed, 27 Oct 2021 14:46:50 +0000
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
X-Inumbo-ID: bcdfd66a-3734-11ec-8473-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=ez8CdOqAU4YBceY+JgLTkEaT24Hss77HCx0Dmj9E0Yw=;
 b=IMx52jKUpud9sJBFWWmdNECcOoesUg9hLpTmTBRNt1Fs9Suvsdrv4yKVBWIgUJPMnydC
 i/FjipoYq5p7mlrjZQr/e2pHCXFfPjg+7eTGztbhfkTr0MDiiyel62jQIDhx/8PsToEB
 gt1wzbjtk1rUsGRgnWSyvXlZzY0vNZLEi899ZuWqIZ0j+uRqcla659UtLJiUOTPGzaBY
 ldmPxHezWm5OFkOCmC5nVNBNNSwW6rbjCnjkarYVMUbInr1lxGPBg0bDmDT7rJNveSDB
 NNz54u+d5SuJX6IpomMDfaGbLr6BJrifM7ZKOoOCQCQnioe70CFGDELIJ0MEN9WJ9Pbx 8A== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMI9VEJ5L2dA0zOtBnpjN1OAYXACLk6qPVN+w/etCUFzt9Mkk14MlxVqFI/n61EvJ/z8fI2angR8betv2Scw7jJdzSolw6WBUhyRX4DlJJ01UxNXmTgo+Ql1L06AtNoJzK3nBagmf9jsu5wwVPRLVUXV26N8qUd6Av3t1boLSJvpT+RKQWZDByiCbpZBzoRDRWSqrTx22Ac4ZqYQPbzJbYVC4FvNf9Rs6b515XyArHb/sELV9Ijc+2IPSJHeF+sp0pvGxqeB0fZASUwmIaKZ8+0X+6Xp9rLDJuDzLccENdC7za7rRKl8wWPFWnGPtExyD2Cn1m0fYW3ys8NoheJWvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ez8CdOqAU4YBceY+JgLTkEaT24Hss77HCx0Dmj9E0Yw=;
 b=JpPL9gu5kbDXy9IpGEY6ZWquT3CGMMbtfH5nQzZ5xHidEcVzYi+owQ1BAI689udJr3ZKTjxkgRMbErEqkeV3mfV1bnXZOAjZCeXkdp9N8PKLkISpje1JqIyPeA1ZwziRsd8dRdjx0zZSLBwto7lo45bLZ0Jpw94jcKpcVsC+slIVnkkLH5xZOdJmJam8NzU98kQUR+YhgNyt8preNUIBJVPsV2JCPcA4r7haSf5Ux29YkVGY+WFgGQdOOaLh7/evGamPl+fv3QCoP0cb0G0QvgRfxsOmtF54RgYAgQSYvgzx90NHOAO9MM1uP0mSoqlPPOAqjpWgju4NeKQ8WV9F0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ez8CdOqAU4YBceY+JgLTkEaT24Hss77HCx0Dmj9E0Yw=;
 b=BBk5Dqm6TpuDpIJMl82Ugi0pIZwshHpMjYeJvyStsm5V4aqbOoXcKUu/ZaLRlGfqfG4ZDJIgmKhLhfkvIQhD2muBFImOxT6I7ifYx3dQEZNRn/kxCiYrsjR1tVCPxx/KvQkDztu8DTJlAbqKdKO06+uh6hWOwpWY1Kt7a7cLvJM=
Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=oracle.com;
Message-ID: <af42493e-ec31-8673-5532-1f0c8275b2c6@oracle.com>
Date: Wed, 27 Oct 2021 10:46:46 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH v5] xen-pciback: allow compiling on other archs than x86
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "jgross@suse.com" <jgross@suse.com>, "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>
References: <20210928073501.433559-1-andr2000@gmail.com>
 <71ce7c97-1d08-9fdf-b217-53eb914a29a6@oracle.com>
 <a54ab50a-f35c-26b9-3907-20c014a1120a@epam.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <a54ab50a-f35c-26b9-3907-20c014a1120a@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0201CA0029.namprd02.prod.outlook.com
 (2603:10b6:803:2e::15) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0c66ac8-f91b-488e-475d-08d999589d22
X-MS-TrafficTypeDiagnostic: MN2PR10MB4030:
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB4030DD5A20F81A78B799C3AF8A859@MN2PR10MB4030.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7xcGj9Ok/zO7dLjD+ZoTO+FWRsQUZSD7GYOaJGSzaDM5YF7FZ4pQWIvXrg8scNPQRJomnjeFvOqrpLDl2dlZGWYftQVVTWRWMkrhwGj+o1i8R4WaR/Sfh/Grw/Lh2RvI8u7lgI5GN1CirKR1kdl9sCtqyV8kPUzoyRrCqTaFdtPJXe+55dnsUExX2H37Pdex6rO3PjLejDEmNKKU329/75urKgqh177fyQMgELv/15Kmj2RP9oViWZ7xIKz5+FrkpLua3vl3g3fVuzJhRTCgkEfZLlGiUPBzUqsfaUAUY6eXXFsj5ZdRbyazlTlaCXqRusgRpwCMXWGfGXYUBKXk6PkL48RJis1bRqjTj9MMhKjA9IoFNMftlVwRFta05epUhck7mWNak0wh/aAhK3/nuCXRHwGoChOuekU3x1XqDhRoZvMcEcA69cdUG2HXOHD9qG28oIGcSuZHHGpRASOc5l6bGQNVjwWUeH+55vhSlnDNTq8QxLg4T5OP9EXW76MGL5PEybrUds68sAfcF2GboaQzn6uS8T6FBMjPuRqInrIQHqS5UOqiW1WZqyKjImCl5FotOF9ako9duKGS9kKmXuABfym26QGz0lm70Y0Oz+/LyxAfj7kMIdVNbVXEKW/uIDfERu8Iw+PavIN/aJZeT9J6sSRcNykPjaW+FPdXt6mUaEYO2eVJOo/3peUCQH5+JeLvG2PuJosO00PqR563uO+ggJl/SOjX+3oY7tPzOnU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(508600001)(36756003)(31696002)(26005)(66556008)(4744005)(5660300002)(110136005)(31686004)(16576012)(8676002)(2616005)(316002)(6666004)(186003)(2906002)(66476007)(8936002)(4326008)(956004)(66946007)(54906003)(53546011)(6486002)(86362001)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QTdBYXBNd3hiV292cHMxdzFyNWk4OWRhQ3VKUnQwOU5XQmVpVVBTaHJkOER3?=
 =?utf-8?B?SFhyZG0wSWJOd1piVDV0ZUpyMWNiZTEwb3grSUlZUXNsVTNLOTlUMFY2V0RJ?=
 =?utf-8?B?cjVxZzd0QjRCQWRvRlVsRTBickpVUXA1dTFuSGYzUG9CRTF2b0JyemdLV2Er?=
 =?utf-8?B?Zm90NDl0R0ZLL0Rvak5McGl3RHN2TThaWWFBVlVNN29lOG9sZjJnK0ZocWJs?=
 =?utf-8?B?WVRCcGJpY2FnNXlnY3NVUzFmTjVnVGdaOWRkWXdaYVRDM0I0TnpqcnNPN1I0?=
 =?utf-8?B?Sk14c2Ywb0MxYll0VzNZZ1ozMmZNU0NLT09malRUbDRzQmhIUG1yTUczT1pX?=
 =?utf-8?B?MG56SW5lUTJ5elIxdFoxeFQzeDFvQjh0V3pFdzRWajdTUm9VMlRNWVFpZEJG?=
 =?utf-8?B?Y1JnWHNrb3NCd0l1b2sva3ZndjR4c1pveUxOTnJtYmpkMm9wWmh4NE1sQlZa?=
 =?utf-8?B?VEFlT0Vyc3pWdERUM2FUTXRCYUFsdWU5dmROYlVxUmdmTytwTm1CckFYQ3RH?=
 =?utf-8?B?QU1WNFJWbVV4OFAwUGNOcndDb29ocWlRM05EOFVrQkNpS2FlZnlyRURBelNM?=
 =?utf-8?B?dExpTDIrRzJpZWd4OGptZGo1YXZHV1Z5SHFTSHgrdHc2MjZtbFRtYlZtUXI2?=
 =?utf-8?B?ek1iQkNzYmxOVUdrQmdwNjRodm1hbVJQRS9CU2lrZmx5MnAvaDhJQk1UdjNu?=
 =?utf-8?B?R3BNM0NOWms3ei9vNXl0b1dkRlU5N2VQT1FFR0RlWXB0UkdPYkxwRTFCa3VL?=
 =?utf-8?B?M2FkZmJUQ1VnSWFRbGozaFNqTHRoVE4ybmxPV1lDODBTdDBiTHhMYUNoRGpP?=
 =?utf-8?B?cWk3YXFBZXU3ZS9aZjBHeFZONzlsaWVZVmp0Mm9FKzBzVVIwcVN5YldPdFlq?=
 =?utf-8?B?ZFVONkNsdmRsbElwV1pkVXFOM1A4dXBWamJGOGlzQkVqa3hnOUNaUUd3Nkpp?=
 =?utf-8?B?aHFOaDZKQXN3VmxnVDk3QzFTbXpBb2NqSHBocng2cEJnd0xZYU9KWnd4ZVBw?=
 =?utf-8?B?bDMvc2cySWZmSDNVUjY3aUVVci9mVytsVUVKN2w3d3NucVZYRVppMDYvSjlE?=
 =?utf-8?B?S3kzYjlQMEJmT3pDcytaK0xWZzkyaE92R2pTOStzdUVubnZ5NXVwVWl3TWVW?=
 =?utf-8?B?RTErRFMzQk5BZ3pyckRpSWpRbVFIZWRVMHprVTQ4Z3d5aFJkT1ZEVkN5YW9Z?=
 =?utf-8?B?RFdGU0pQMHZKbGJ2cWZKMzR3SDdUREE1aGtEQmlCU0p3ZS9aZFFhVFQ1VFc3?=
 =?utf-8?B?TU9iRTN2K2o0TExFQUF1QUpGTVJ0aUMwZWs2cnVSOXVGbndTd0E5YzkzYURI?=
 =?utf-8?B?QmpOQmxaUjJIWjg3MGZnK1VWdUZRZjhlWk9EdnV1WXFjdnBJRGw0T1lSNzE3?=
 =?utf-8?B?R09zWkRxNWF5ZlF4cnJkTDFXeHNhOC8zVFExNnpkVjJmQVkxY1N6NWZETS9X?=
 =?utf-8?B?aTB0Sjl5MUphdHhUSkRTamlBci9MRzV0MWJsYkxjaVc5ejJESkdpcEQ4Tkti?=
 =?utf-8?B?a0QvUU1NMzZHVFp5NXl3eiszdTAzRmh3TDYybGkxT1RBbm81OU53Ky9aQjlh?=
 =?utf-8?B?eFphMm9IK3QvRnNjVlFTMGFKeCs5MmFRV1hjOVM3MkxheTBKakJscXlLZjgx?=
 =?utf-8?B?aDVsZzN6TXFWQnpTU1ZKSnliNkxIemNYcW9aNFZrMTdXZFVlS0hibjJwZUU5?=
 =?utf-8?B?ajZXTVZoRDY4NUJTd3NCK0ZGVXVqTVROL0x6byttTG5JcjkyY0h1SmdEa2ZX?=
 =?utf-8?B?eDdVbGNwVTFxTCtLbFBaUEx2ZWxZZEJweXhZM2NSTjlrOUQrZ0c5OEtiWUhN?=
 =?utf-8?B?MS9xejNWRU1FWWtrL1dyRkZFR3RhbzJnM01TT05lazBER3pNKytJbExTZS9Q?=
 =?utf-8?B?aWFkeEN2dE5oNzVUdnkrT3JjYm1sbGtERENubTVqZUg2Q2NXRXBxaUJFZTBW?=
 =?utf-8?B?ME5lZnArMkpYUHYyVHRLRkxLZnpKdkQwT3VkekdwMlJYbVJDS3JSK2hKOGVZ?=
 =?utf-8?B?cVMrdjFUbzlObjJYZ0o0YUNzd1JCbldHV1c2bHR0QXlrblFDS2ZkMURFZklk?=
 =?utf-8?B?Q2tVNHlzL3JXUHlBSm1jbEVDakJFRmJMU3J0Vlp5R1hGbEJWdCs0WFNNU05L?=
 =?utf-8?B?S2NvbitHNFpMNEdReDVxUjFnMENycmNTSW1ldVI2ZE9sQkJQZmhsWVl5TEwx?=
 =?utf-8?B?ZUE0ano5cXNtN3FzRnh6ZlFFQ1QrM0paN3BDYzdOMndjekJtVDB5ekpUN1V1?=
 =?utf-8?Q?vjZ1LjDnKn+HxZDGoV1+58r6nj/0uaDXdGeq6Ddb58=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0c66ac8-f91b-488e-475d-08d999589d22
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 14:46:52.3869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tzBQsHnCb+cHUKC9u15eeaajJiEnHeBSA/1mwkXVVesJpssQFNP7aFXCUrdetdxMMUbndSCdDWulhQdgxagOFS5NqVg0XwzkxTyN6v9kvhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4030
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10150 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=947
 bulkscore=0 phishscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110270089
X-Proofpoint-GUID: vkJzeyI5kwAh-EJt2O9nsDqJnLy-YX1V
X-Proofpoint-ORIG-GUID: vkJzeyI5kwAh-EJt2O9nsDqJnLy-YX1V


On 10/27/21 10:08 AM, Oleksandr Andrushchenko wrote:
> Hi, Boris!
>
> On 27.10.21 15:59, Boris Ostrovsky wrote:
>>
>> Can you please rebase this on top of 5.15-rc7? There is a bunch of conflicts due to cae7d81a3730dfe08623f8c1083230c8d0987639.
>>
> I'll try to do that ASAP (what is the deadline for that?)


If you could do in the next few days it would be great. I expect next merge window will open on Sunday.


-boris


