Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 670CA32347A
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 01:32:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89141.167682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEi5y-0006Rz-2y; Wed, 24 Feb 2021 00:32:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89141.167682; Wed, 24 Feb 2021 00:32:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEi5x-0006Ra-Vi; Wed, 24 Feb 2021 00:32:01 +0000
Received: by outflank-mailman (input) for mailman id 89141;
 Wed, 24 Feb 2021 00:32:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0hR2=H2=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lEi5w-0006RV-JD
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 00:32:00 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7a70535-95e5-4e2c-81c3-ba8c7fe9cfe5;
 Wed, 24 Feb 2021 00:31:59 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11O0TWMB008160;
 Wed, 24 Feb 2021 00:31:56 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 36tsur19xf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Feb 2021 00:31:56 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11O0Qa6S090381;
 Wed, 24 Feb 2021 00:31:55 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by aserp3020.oracle.com with ESMTP id 36ucb02x4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Feb 2021 00:31:55 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BYAPR10MB2886.namprd10.prod.outlook.com (2603:10b6:a03:8f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Wed, 24 Feb
 2021 00:31:54 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3868.031; Wed, 24 Feb 2021
 00:31:53 +0000
Received: from [10.74.102.180] (138.3.200.52) by
 CY4PR20CA0019.namprd20.prod.outlook.com (2603:10b6:903:98::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Wed, 24 Feb 2021 00:31:52 +0000
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
X-Inumbo-ID: a7a70535-95e5-4e2c-81c3-ba8c7fe9cfe5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=DnFK6qS0raf+ibtwUkuL742QqUvL3YLVtxWmmQfm18o=;
 b=RITZTi1MIPQdlqpQyX8zRHpqpijaiiCukPO8L1iW/b/7u0GfcBZZTQu0Pr5iQLwBpMlJ
 2E51Lv/AFvOK3CXzDIkEvjQaqvnBEpFITBunRCNQS+86cU4OROWC6NupmNR4D58/xnH+
 q8pebTnXHy42Di8LDV8kMHV62iLh+I2EF7aIGU/YvcgufQTTfLr6uBLhCZ8dlW1L6vD/
 ji6ppsbGm0zu6AkxQ2NItdK3CbcSohy6Ykt1ErTTR/Hg9C4wu342bKMHjKwz4R0ibA9I
 70WvvKbLbqD51cKrYZXQhjb1eWDnUxQuyvnJ2c7Eas6VlgjPX27u7FqlZnGU+xEGT0Ua rw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S2kAByvtVQ/Sv7us2DBz0EVfqfjbzCsqia7xIuJr8hkkB1t9e6hjLfOcj+6axNV1QaXRbCyj2C6e6eYT3Gn39R4pQylnHKkZdMahyarJwK6wYQObnBvOzgAdoTo8bfeldV8IQHp05bXcSx93pRKj+26Cbb6ejioSWU4ZOws31elLp+UhsXuzxKWOiCPSxZHnFI+zsOMOZz9VpZwin47MrAXszhqSYQ4gB9whXTZSySWBE1UeeHFJQVVR9NN4B23JkqT5GlpgQQsmfKyVjCivFyIuKyYYpgZCfUprH7tmHjVdI0Gz37nyISVsfs/udMTYq9/qQKbxRtmRqaTB87Pv8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnFK6qS0raf+ibtwUkuL742QqUvL3YLVtxWmmQfm18o=;
 b=nS+JrQv9TahF2Drcz1Z4x2VIyj2HGGWNQyvcgPysA6mDtKdYEjPviWU9eGakiV9q4v8RPmbCvcitXV7zxtBIDaUPNHBLqYAQM8BI9eEfE/31qr5QafNuq1wfkyVYi2ACpdd0NTwJNZ3iI/v7MUYOh87pF2jpTsjvXvbNcW7mMhDgVRNXHTIPCED5xBLjI6N4TxvpTvX6ZrvaJM4G9iI5/FkHuJ1yyVCDk9zjfv0RrQTIr1UO45s7UP8oPdN4nX5eUjwcBdwDSKNnNqkCbYE9L6n4WGFKAEvVX9a/PPuLuADRhXKExhFuTfWxQQ36aPjsbtpUhHCeMVAflz0qdk62ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnFK6qS0raf+ibtwUkuL742QqUvL3YLVtxWmmQfm18o=;
 b=VSW6Mr4FfDlZ7dqjHq0jsjxu0162JOPhoKhGhSHsiIUkTw7LD1Ml/p9DVXpRUaWq7yLTyTTniqd6ID3/FCQRnOFvxoKmBCuOCSSC4tPmrjXkqO7aAb0xwiQwDqAuN+waonWCarP+jKI+l/ChXQlDMPDRW6NsUBtxOCX8Jo8Bjc0=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
Subject: Re: [PATCH] xen-front-pgdir-shbuf: don't record wrong grant handle
 upon error
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <82414b0f-1b63-5509-7c1d-5bcc8239a3de@suse.com>
 <75c64c79-7458-19ca-1346-4c0e090cf0f7@epam.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <42f5f00d-f06c-935e-13eb-5facd0b4ed30@oracle.com>
Date: Tue, 23 Feb 2021 19:31:49 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
In-Reply-To: <75c64c79-7458-19ca-1346-4c0e090cf0f7@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.200.52]
X-ClientProxiedBy: CY4PR20CA0019.namprd20.prod.outlook.com
 (2603:10b6:903:98::29) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 942b732f-869f-4057-371b-08d8d85b958a
X-MS-TrafficTypeDiagnostic: BYAPR10MB2886:
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB2886740E7C0593EFFF747FC48A9F9@BYAPR10MB2886.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	j1KxkMwMvut9ABOUJ9RW5c4T+0jdMmcbVqCBcGO0PVneMsnLXAPYbmtxjhjk4fifGzOtZMYeqM+R7CloRy7gl1B6GzYydzbOsw9J1NJD66lrS8wYrSqUB/lq8OQFXBtfA+X3kthvVyungq5bvtqBJyd8JY5oSecOcV2DK5Oemx2ndyXGlBvKHPTaB13+7Ufp668IpMogdm9xNniSZ19qU4B2HW2NroNleyu6XpcYoYfaFo4/jKNPV+HXhL6/lUkKNUYSXfdwpR8UfJwKTTaRrifLH4PLqntqutPCQLbMaIvtfXaxCTVzY9XXI/ofJ817g6tLATzETkZE2vGFbpwPtx+y5uOWdB2OYiSPzFp+wrGHtH68YLeqDtpOjx1cszL8ql6sDvVMdOJrrclrCA9bQyvUANCyrgiKRugvVIatFXFN9wojZnhuVZ5/UpoO0k18xdWuxqruMWcWtv0mpVZYi69ZkYFa07y0sumVk6hm1nE9ibckDpsjAoUzJAV0QblFwt/cGL8pvgTtlcv23yxrR+IaoMkJGBAJ0wB9rcC0oCU3WHGVpJ0fsrx2AFJso40TRg6R4fYnulYLiIb61d9T4HlDUf2ul3lG6spy7EhAwDg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(396003)(39860400002)(376002)(136003)(16526019)(26005)(31686004)(44832011)(31696002)(36756003)(66556008)(2616005)(6666004)(186003)(86362001)(66946007)(83380400001)(110136005)(478600001)(4744005)(2906002)(316002)(6486002)(16576012)(66476007)(8936002)(4326008)(8676002)(53546011)(956004)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?a3lkeXVMQkNoellCZnczVGlnRGtRdzJzUnR2ZjNTWEl3RXdKL096a1hBZE5x?=
 =?utf-8?B?TElhbGlncGZVNUZvU1dnaWkyR2pXYm5rWW1zbklyMlVSNDZoLzdHbzZQSWpa?=
 =?utf-8?B?NmU5SGxYTkpFZ3BvdGhId2R6Qm9JcW45aDVIQUVYOHNDVE9OZ3RmYVZKelUw?=
 =?utf-8?B?R25WQWt4bEdGenRMZWdTM0I2cFlHZWw1VUNvS0NDa1lXcTcxTDVzM0xuRHFy?=
 =?utf-8?B?b3psVXVFNWN2bkFCY29KSXFnd3ByaVdVU1BNc2dUWnp3QWhpeXNFZ0NiUWRx?=
 =?utf-8?B?TS9jbjNlVldOWGVlRytYWDhWaUtud096OWJSRnNBS1B6QUlPSDUvR3hqNTlH?=
 =?utf-8?B?QU1hL1RFRXhxN0FVRFZnNlpFbnRFK08yc2t5U2Zxb1EvNnJUWFN2Rm1WZU1w?=
 =?utf-8?B?eTRMMTdCS3p3QzJYVFVieHRZNVpRMTY4bDZINldMeGpEc2RvVjlGTlAvRVE4?=
 =?utf-8?B?UWllRnVSQUxPSGt4NmUyY0tWNm9PL3ZRWkZBNldWSUZkdXhSeVQ0azFRdXpM?=
 =?utf-8?B?WWZGWE9nVXNjQW9ZcGZFM2xtajllQ1NKbThLU1MyaWpWcjRqOGNXV3hPQm5M?=
 =?utf-8?B?OVpzR0UvUFdyS1RVajJrbHlheUtTRHVVTjA1YWYwWkxTV0NvSjJMaENiV1Bu?=
 =?utf-8?B?RmFWWWZqSk16Umk2NmJtN3ZjeEpKK2ZNcVZYMzNUY2ZKWWErVWs1Ykc0NUpv?=
 =?utf-8?B?SkZjUWZlR1dPdFE1aXA4U0ZweFAzZkhVNUpLUk8xOURBM1ZiR0lZdW9xMjFq?=
 =?utf-8?B?cVNNVG1uTU9Va29SQ3YyVWVQRVpQamR6anp3Tk5BWGx4Z21iWWZ3dWNZNExS?=
 =?utf-8?B?THIwSGpVZ0dMN1VqOWpDSkY1Ky81SG1HeFUvSGRsQnBQL1lUL2IrZkVSMmNQ?=
 =?utf-8?B?RWRoVlFKQTd2YkNNYWpQOGdrQThsaWdYNjNYbCtrYU5ieHR5M3B0ay93MlFs?=
 =?utf-8?B?WEw0MEZvaldmaFowVHU2S2FBVkVRZjB2OElXTkttTm5QRmJVdFMvSDI4dTFF?=
 =?utf-8?B?ek9obTJISWk3OVNqSHpiaCtZSE5sSmxLNzdOSFFyZDFYNk9NbWtxUVFNOXpY?=
 =?utf-8?B?UzBDeDMwUnQ5T2JkdTRVS0VJTkk5QmVJQW1PWlEvL3BpVDQ4a0VSSkhEVnVq?=
 =?utf-8?B?RUZ0NEZLbzk5QnZXeUtxZVhWTnA4R01Ib1JFaHFLYi8rYlpQVEc3Q1ZhMVMw?=
 =?utf-8?B?UVhuMk1kUGFGc3Z1QXNRelpsMXowSkw4SlEvNUtBZEUvNDBWRkg5TzBoR0tI?=
 =?utf-8?B?ajk4K3V6dXdTa0lGOExKREI5WWhpd0ZvQWYyUTBteXBkbFRLWjZ2MGhRRnEr?=
 =?utf-8?B?bVZEMExLaDBpeDEzYzArUmVGd0FtVGUyUmRaRFVJS1ptMGxVbnpPaXdxdTFB?=
 =?utf-8?B?ZWh4ZEdEdWRhdkkxNk0yeVJuU2pFVURpQzlrT1pWdk5ueXBPcitxdnVUTlN5?=
 =?utf-8?B?OGpYbkZlMW4wZ0hNNGt6VVpVdXpyZ0hlLy9jVXQyVkdUN1Bza2VZNkhjWjN1?=
 =?utf-8?B?eXFaT0EwWjNzT1pYM1RIVVdIdmVWTFBrT2taYnQwQWVHSVdRbld5MGpSZ3l5?=
 =?utf-8?B?bTlIVWNXUG1JNzFESmlNYmp3QWk0amorR0RCeUNrY1dDNGZlTm9BanV0VzI3?=
 =?utf-8?B?Uy9EdGU2WkRxRmZDN1Z1VTlSZVk4TXU5bXVLTVRyT1h5aUJHUXpWK2dsdDEz?=
 =?utf-8?B?dkdZY3NNMjNaRE1ydW1yMk9wcUI2WjZvWHc0T0FYUHp1MHBYTENNSUNGQ1Vt?=
 =?utf-8?Q?4GGayXa9iTagCb7Q8DRw2kjTRE3LXLIe3mnvft9?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 942b732f-869f-4057-371b-08d8d85b958a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 00:31:53.9249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2utCAcaWxN31VpxF4QEuh3NPst9V6wicwF9QJt8W3v9kZT2O+5HiNN3QAITQR8i9kH3QQAJv9Ch4ulV7ttCW4cM9AOsmByKrAmBjOcL1P0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2886
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9904 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102240001
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9904 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 clxscore=1011 phishscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102240001


On 2/23/21 1:28 PM, Oleksandr Andrushchenko wrote:
> Hello, Jan!
>
> On 2/23/21 6:26 PM, Jan Beulich wrote:
>> In order for subsequent unmapping to not mistakenly unmap handle 0,
>> record a perceived always-invalid one instead.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>



Applied to for-linus-5.12b


