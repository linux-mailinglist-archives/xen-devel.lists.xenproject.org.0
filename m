Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEC242FD94
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 23:42:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211073.368133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbUxS-00057N-Dy; Fri, 15 Oct 2021 21:41:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211073.368133; Fri, 15 Oct 2021 21:41:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbUxS-00055G-9o; Fri, 15 Oct 2021 21:41:42 +0000
Received: by outflank-mailman (input) for mailman id 211073;
 Fri, 15 Oct 2021 21:41:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dS4n=PD=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mbUxR-00055A-2d
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 21:41:41 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9686088e-5a8a-4915-94d4-f66ac5fc7d07;
 Fri, 15 Oct 2021 21:41:38 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19FKOC0G008082; 
 Fri, 15 Oct 2021 21:41:36 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bqbgft74h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Oct 2021 21:41:36 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19FLZIdj014852;
 Fri, 15 Oct 2021 21:41:34 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by userp3030.oracle.com with ESMTP id 3bkyvf3ks4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Oct 2021 21:41:34 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BLAPR10MB4978.namprd10.prod.outlook.com (2603:10b6:208:30e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 21:41:32 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329%5]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 21:41:32 +0000
Received: from [10.74.109.235] (138.3.200.43) by
 BY5PR17CA0050.namprd17.prod.outlook.com (2603:10b6:a03:167::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Fri, 15 Oct 2021 21:41:30 +0000
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
X-Inumbo-ID: 9686088e-5a8a-4915-94d4-f66ac5fc7d07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=37HjO7lmu+6h7FsEWyn6ixoedEAAbr7XvAPKPAdlI1c=;
 b=V9DRmISNZPeGW98Fmk1qRH8N4KYi9WJjJEdsynXd/+DIEMniiLc16BBUh8nW7k3bdMUo
 x6u5NZEqF13f+/emF8B8LvhSNmXaekI02o3+hk827qQ86EWg5navp/IFOdlIM7Ot2qUc
 024LhLprr4QBbJdxCtk3P7Sr2OpzXW2qPNvNcXa+isH4yTvU2zmAs+W1XLoeSvagAveI
 MJ3q49jLB0WpSTMfEsAM4wl667/gvg+3uVrqRnuQES5Kifq9eDuizawY4MOJ5XwD2kqu
 0tdbvzcWEJQVyqpGErmL8yEd14U4YBn9RBD7IKLY3yMdwJDluFCFqxvtbozI4PRkvGqf pg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/8ITHGqI74rVLKl3hWS33Jb6tmCWIxl76YGxLkbeM+mRB4/ybpPKJP+PUCBaNSLsLA2Vs4+RXEWr3Oh/4htuVKjzBWEruoFXbAXsjicOIExCsMVxwoicETZDK1EzS2AIPWk7VA+/3Ys3EAVf0426dCq0YubSY96NJRVCGlWMRrPOQeDSwnKdQYTyAzvuhrNHO5Ie0gm4+n948PdRGZlC46SRMOSE8MuJJs+JwMR3BjTyHOVLDFn+VEo//HYlTejUFXrK+BXFaGPQXXo69KxrUSa0o5UI1pe3FX0lz8+7O9iiN+Zwid8BAo9ES8w68whJjY86wmaUr28exgZlwZmYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37HjO7lmu+6h7FsEWyn6ixoedEAAbr7XvAPKPAdlI1c=;
 b=fIQ0eaWvL/dQHqcjgmjhymsKzB0wb4YR15R7VTydG7RogrRkuqONROQPbHzOlmC93c7A6bDVYE7uB/74wk0//jQB8M2sqYBKKr8UHWTFdO7Me7X8UOfO6RflK/lOk0CiRtCug4t6zo9+LYTdtdhBeQNPe26o94HwXXSVacdJWfSXIDpfiiXdv++jqQ5NCNkws/RFBDz/xeShvd3CcsQBwOl2uqN8W7updTCg1YOiHe+z9bf44B0wGRtMHSNOyCHoOmVYvoc8MAcAJ9DWrLP4E2HjRee4m4TVBdfg4nop0rYQ7WQZqLsbwKHjzkAbKBuWHsHBRtsB2R5LCDffwXmTSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37HjO7lmu+6h7FsEWyn6ixoedEAAbr7XvAPKPAdlI1c=;
 b=epC0NPnOzJY/+FkwLm19f4E8wtx5OPpMmH2dNb6U9msscWRzVRh1N70jMl7/k0YmqI1U1RyvVRxXcMkJRXS8AtlpCgb+2dyhybt5RWLxfULLmKkJBlTAYN4j5PX0XuAcehiRIXyp3fK2sKz/cGHGfaE1w5FbiET+MRyrRUeisOw=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=oracle.com;
Message-ID: <4cbc2abd-fc1c-4283-48c4-42c5a3f05b71@oracle.com>
Date: Fri, 15 Oct 2021 17:41:26 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH] xen: fix wrong SPDX headers of Xen related headers
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Cc: gregkh@linuxfoundation.org, Stefano Stabellini <sstabellini@kernel.org>
References: <20211015143312.29900-1-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20211015143312.29900-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0050.namprd17.prod.outlook.com
 (2603:10b6:a03:167::27) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2c57e13-9328-4121-fa94-08d990248db3
X-MS-TrafficTypeDiagnostic: BLAPR10MB4978:
X-Microsoft-Antispam-PRVS: 
	<BLAPR10MB497875FF29FAF120E86CA4A78AB99@BLAPR10MB4978.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bcl+5DsnXDdZWcPJRtOpP1bzeCkZ8Z6eGHmkBgvPUSAR3qH59dsgt/sc1Jcyi+dt9HTG1TQJPfbyiX7/IxRq5vftUFfJ890G7/jHNazw7voFjwryTqLX0JlWEvP7zvPKMKc0HDUbyTMAX/qAf3jf31z/BWWJ6SKejaQG+hMYukLDKRGI+BDSdNBzM3YsI5e3PKGXFoQDNKfcxO8fZJYbT7PIXorbArkJ45iOLVwxeiTcklvkm3YoS+EoElskvwZ4n/BRTk9MayfvAMWV24vtiNNQj5U5jf90nbXre5VOQMOWIipd65+j4cYFx7OIVQQ7xoTh+PSKDjAI2SFVVLB4ttP21Gu8ZShGO/Ud7AmLQGk6cqT7fU8N937Ilob1OeNBxESs2cj8IwEbI8Gr/IyiMyYz00e0zU45hBsM/IxYROXnj2zB//hf8OGkykm0vD6VdY+63gP3mL2t2jFk0REFjbNyvA9DNQnweiuQDN6m+MY2332gwIodsyerRNQLjhIH3wUqx6dorAsvCmtsnhHKwTEdUcA1EnwrYkSu8MqvcNMHoetqlsAK36gTGIE1LXKiTEXD36HymKkKjcDiu5MRu9BOmFSOThb5Wd7022uOnAy8a27NVgpeIWJZY2qY0sMC4Setf92vTfYK/vf0I70dUbpWMsAJMhwz2IQrfiYYsYpWNGbGKynqbx50tI+owH9kjy7/9kVCVLphrNwtXzP63oYBG0N9sOdet0rsuWRD1Qt+2B2gzc48jsUnwUnHWvlT
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(2616005)(316002)(86362001)(6486002)(38100700002)(4326008)(31696002)(8676002)(5660300002)(508600001)(4744005)(26005)(8936002)(31686004)(53546011)(36756003)(44832011)(6666004)(66946007)(186003)(66476007)(66556008)(2906002)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VmE0RzMvc0FwUlFBUnNvMzdraGN1b0tKVUhicGJDbUl0ZUMyUlNNZHBHZi9i?=
 =?utf-8?B?QncxN0NSVGJ5c09SZUNxak5rbjlQTGI2dzc3Y0dxUVF0MXhJSllMdFhCcUNB?=
 =?utf-8?B?clREbFlybEVKTUVwVEx6RFQwV3RsTlpFV3V2emJaeWloUXVQOVNoRnVqY1cw?=
 =?utf-8?B?SDVZeEVVc3plZEdwRnE2ZWovRXc5N09GWG9XS0RGRElMQUwxTmVNTWxETjVk?=
 =?utf-8?B?Y3I2Uldvc2g0S1ZtdkdzTjdlVEc2VDUxNDNPMUhUTGhtTmZMc1FPZ0s5U0Zh?=
 =?utf-8?B?ck5EZ2NrczRJYldyVG5EaXpKZWtZOUFoSW94SDNMM1ZJS1JuanB1MUYwS2FW?=
 =?utf-8?B?cjViOVV2Z1lnVWJEMzZLZG95VmF4SERDM0hvRVMyQTlkamU5R1ZIRmt2ZlRo?=
 =?utf-8?B?Q3VtQkVDSng4NSt5bmRmclY1VjdRZHlnR1ptZ1BueURZREczZSs5QkJYV0wv?=
 =?utf-8?B?KzhaTm9qS3ZjZ1grNFNGSlpOV3N2Vlg5WVZwYm12UjlnKzVaNkMvOEhIMjBO?=
 =?utf-8?B?Z3Z0Y0YvN3dqOUMweFZsWE4yb1FKY0huc085akNFTEI2T1JjSDA5Slc4cjlE?=
 =?utf-8?B?V0t1YWZsNTJudUdHRmFRZXE0ZldEaEdRM0pXaG82c0N1ejlMNVlTU0VhamZk?=
 =?utf-8?B?c0VFUjhVK3Nsb0tPTzRZR0NYWmdWVlRUaWJ1M2hJNUg1QzVEUVovdmZqV1Ju?=
 =?utf-8?B?S1dBZnVGVG9QK3U0Sm9JMDZwSVMvcFQ3ZFk4WUswUWMzQ1lRV3Y5T0JibHhN?=
 =?utf-8?B?RkRyQk5LWHIzKzdHMXJab0pZZjdpZHBBRWpvcEU1MmZ2RUlNS2F4VkRKSE80?=
 =?utf-8?B?bTR2dE9BeHkrclE1MWIzTkF2akRscDVkWEFBQkY4K202dHkybjZwbS9pekY0?=
 =?utf-8?B?YkJ3VW9OVnN0SXJRUENFcmpkNkVjQ25WSEk1OWJRY1RIdlVmNmhwbng3UUlV?=
 =?utf-8?B?SjFMZ3pzVS95K0hLNU9sM1I0TzhvYUVFSHF0VjFraGI1dGNXQTJRM1JuY3pp?=
 =?utf-8?B?SXd5dkh4VWEzRXhRMWlkVkNnSEx4MWFVTUttR3c4d2k2QVdsRE5BWWlQL3B4?=
 =?utf-8?B?MStNQzhGTVNSM2dmYm96YkFWZkJycndQZ21seGRGcThtUFNrL0VZaGV6NGkr?=
 =?utf-8?B?MzZUYmtkS3ZmZFp3aTJ2dTdmaXR6K240VjU5V0lvT04raWRJeHo0MDNOUlpM?=
 =?utf-8?B?M1RnU29USXdGSC9jS0hYMTlsT1RMejF1YjRsM1JvRldxN05PVTlVUnMrbnMy?=
 =?utf-8?B?MzJkamNSZnpLU3ZVM1V3blNZbVk1b0N2YVdIbmUyUG9OWWhMcnNpSzViT1dz?=
 =?utf-8?B?Y3FPbUJwZzRtU243dnlscHR5M0NwVUlockNjcDJDNWpFM3kxeTlqRkpTVkJL?=
 =?utf-8?B?b0wzaVc0bnRlcVkzNlNxUXltbVRaZDQ5U2xGVTBMMlVUY2hySUVLbFVIdTAy?=
 =?utf-8?B?cGZ6S1pZczg3ZVBuaVNSMTQ0bHljeUZGeDJLU1FUdXA4WGZUUVZ5SnB2cHpz?=
 =?utf-8?B?TGpxV3U5ZnZKVlJVaGRveVM2MnFrdE95eVY3QXowV1A1M3lrNWpUOVkzV1Vw?=
 =?utf-8?B?MmM3SFdTckROTlgwUGd0cW1xdGxXcU9nRFFWeEhiMVZqQWtVRGlwdVNKVGd0?=
 =?utf-8?B?aWlSMTVVdzBQVWh0dzNhd1lNc2xXcHNFaExjUlltcDZnMHh1bmNyMzJFMTJs?=
 =?utf-8?B?ZTJjRGF5Lyt1ODlFSkwvclpuVUtmOHlFV3ptbXVrcWRyMXRwZVJpRTd1WmI4?=
 =?utf-8?Q?ohpHHITfRaaN2tQmW41UteNy7CgBxAmcM4OtL/P?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c57e13-9328-4121-fa94-08d990248db3
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 21:41:32.2341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7vdsR4KgV4VzWjzjXPDWlUDNpkvBoWZYEbKmNBCBdklFJb9llzxuORxAHa98JEtAXn2pt7Fqo8Tr/OIiLK3rskxQ1Y6I+kys46rMcM44VrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4978
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10138 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110150131
X-Proofpoint-ORIG-GUID: ctjq1-Lr_TX2j98_2nPF8ptobKmkHCRQ
X-Proofpoint-GUID: ctjq1-Lr_TX2j98_2nPF8ptobKmkHCRQ


On 10/15/21 10:33 AM, Juergen Gross wrote:
> Commit b24413180f5600 ("License cleanup: add SPDX GPL-2.0 license
> identifier to files with no license") was meant to do a tree-wide
> cleanup for files without any license information by adding a SPDX
> GPL-2.0 line to them.
>
> Unfortunately this was applied even to several Xen-related headers
> which have been originally under the MIT license, but obviously have
> been copied to the Linux tree from the Xen project without keeping the
> license boiler plate as required.
>
> Correct that by changing the license of those files back to "MIT".
>
> Some files still contain the MIT license text. Replace that by the
> related SPDX line.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>




