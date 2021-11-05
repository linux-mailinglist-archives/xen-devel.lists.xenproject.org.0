Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C26C5446342
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 13:19:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222234.384324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miyBN-0005aC-2N; Fri, 05 Nov 2021 12:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222234.384324; Fri, 05 Nov 2021 12:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miyBM-0005Xm-Ud; Fri, 05 Nov 2021 12:18:56 +0000
Received: by outflank-mailman (input) for mailman id 222234;
 Fri, 05 Nov 2021 12:18:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HFAl=PY=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1miyBK-0005Bj-UK
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 12:18:55 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89e9ee67-3e32-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 13:18:53 +0100 (CET)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A59xV0U014276; 
 Fri, 5 Nov 2021 12:18:51 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c4t7k268p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 05 Nov 2021 12:18:51 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A5CBlQ7051575;
 Fri, 5 Nov 2021 12:18:50 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by aserp3030.oracle.com with ESMTP id 3c4t5nk7fu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 05 Nov 2021 12:18:50 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BLAPR10MB4884.namprd10.prod.outlook.com (2603:10b6:208:30c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 5 Nov
 2021 12:18:48 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329%5]) with mapi id 15.20.4669.011; Fri, 5 Nov 2021
 12:18:48 +0000
Received: from [10.74.104.120] (138.3.200.56) by
 SN4PR0401CA0006.namprd04.prod.outlook.com (2603:10b6:803:21::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Fri, 5 Nov 2021 12:18:47 +0000
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
X-Inumbo-ID: 89e9ee67-3e32-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=+1n0aW1qRjyd2dJ1wc6zCGKxwvh8PrkR5DsZCsxE/yg=;
 b=Tpb398Q58F3UvaKlXDZ3LjmVr/1SeHv3RJg7dQ2vIY4MYe361f00iMMefdi3AQimos3H
 xUhZrhFZ3Y4sWk4akUYWNE93oMo0KSdR7dmeo53UkVhk6YPI4zxSCTZ5zI4gz/yH9APn
 hMNpC9hGlIM+KOKyaOd/vUymsFBk4OMCdOdP3qkGDR6STRxZAuX05IMfGPsZs3tZdjJl
 ELcxdWLDkZuxb2Cqt+s4P6qVKlfHN+ejz6vS0ZxycOLcI/ZD32W7DtoBQ3CqWn84WaKK
 0bUxdosXTde5/cDNFeRySDfLsSX/xs6TOpDvg55dJGUSeK/vx8Np8yybFr1itfioJndo EQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIfPZC2jQ79SNDKx26An6CPYjcX366y9VFv9rVluftyZt6F1E0dHaDLNOVX8P0SjjCe1ak70iOWCKFH8i52nFCToQgMBK4mEGgEcJM5KeCFrn1Q4Qo6bcCIiOB8PzUAy9OwTfZKfrjFN+2dUZ5dmVxMcKrWVXYpx/dHIgkz/OgU59rIAtPUz+piQgCi6zBJx+PCDj0HxigUfyHNNQ7AC5/of+2g8JjeBDDMK0x+4aVnmle4WRqWlURlE7MBUP68EhqNLzxP8n3g2y7kDLR9XaMDxq6gPcYkEiYQxAb3s+scEd8UnchQzYchEa7kirAvfpbli3VH9/0Bk8nJg6SvoeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1n0aW1qRjyd2dJ1wc6zCGKxwvh8PrkR5DsZCsxE/yg=;
 b=S38a36J/UYPwPWkGSoghDJzOxAoZTUXzkzF6wG3iwoXiUnXmO3mjpR+bA+ni5Il1tDK5Ex1UkNn2GxNXmBqS6N9vMqu75NEYm/fqow75Wr6wcTl47mzOPLRpxRS1HImbymKVKj2awvdBIs9F05zxrGG+F7L/Au8bMQv9oI05rADhHUUWyNVXLJR2PMH5rrqB/BdmtTeUVZcUSz666J//h/nImg2qQRgg4EIB3BHGMvoDhNLbmIBhAGBrbrwJZvNDNm3cJA6NOSm58qo7ZEgKWQAxrv8tIAGyuQ464jJrVgGllHw3hwHPXq+Zu2V6T/N1pcQFNepbTc1RnoYL/WEyvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1n0aW1qRjyd2dJ1wc6zCGKxwvh8PrkR5DsZCsxE/yg=;
 b=PSuo4W+ti9TE6iJDrUjOgrG+czn8IW41tLDQUD16n5kD2DisV4lalHh0MFqo0xJRj/AMxohEr+mpzpywXR/Pc9J4gN/VIZzqnrjJzJikPeGN/bEEauzMptcvgmCQfaphowEIyMO73KbNB8Jn6k2UlvgovFSJFJIe+byGUID/U9A=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=oracle.com;
Message-ID: <d4784df8-ca54-5a9a-6422-386e508947c5@oracle.com>
Date: Fri, 5 Nov 2021 08:18:44 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH v2] xen/balloon: rename alloc/free_xenballooned_pages
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>
References: <20211102092234.17852-1-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20211102092234.17852-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0401CA0006.namprd04.prod.outlook.com
 (2603:10b6:803:21::16) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15ab1160-79d9-4ca2-9cc3-08d9a0566b90
X-MS-TrafficTypeDiagnostic: BLAPR10MB4884:
X-Microsoft-Antispam-PRVS: 
	<BLAPR10MB48843E784FD089EEDBBC98958A8E9@BLAPR10MB4884.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F8vIjgFmoXTo/O5nyvIovKT67V3o4ElZEQccBUNJy1Us4f8zPmwfT5HJMjKwoLoSNZdM8dKjujMeGPOMPa0fiI8oSoEHuOotxei252zzWqKibVFG9hPmhZvJ7JIG/YU/zjZfLJKpTyishfuDOSGBip1NqznfU3UIssmlheCDXhWK7//SQ8NQ0BGTbOWrkhEuJGdDaJoj+oy2EKDxpGXChpxwNccXrOdVsX82hQwu09dUcOpYC1aJL4rZXnme6QIrnYUY89Pd7y+6+K/GnfkLj71N2qYEKcJ0OL1a7i0ELKDoUg1Yg9/2vskAV9JZvC6lGSDr4MwrmseLITZQEEbJ6GwwBJa6VR8qkA5AOH/FaJ1UQ41URbTQN4g6afys2jAqziXyJnfiG8YsSmkE+e+XTfKyaJSm86alLJNrsTRMow5XO7jPNQKSEYrbKPVeEbX0iuxlBjzQKLVn9xWTB/cXQprZAOdvyX+9OHAuIfXUar5Yl63gsZvKaLVaDUWJCLH0yMcQ5szCr9wtSlh/O8M3A6lWiVxhDRgaP6/WErQTRfbFmwoHHUIzXXkcacc0kQhLrNktvklBVubIDluTrWzT1+PlADLRsLiUgNP14+T+cdr0AQdxfrwD3F8sh5znkbm8QBZbijcTtHNpiJ4tDq14YzsB0DguC5TSnkphiK8txSk48i3Vc95xaxw0y2FSPOCxk7XpLOe4cfwJbe8UuPaPG3AYA+EK21ir+iGYhB2PmcrUQ5g4/OSEZxPYZu1ZQXUa
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(956004)(31686004)(4744005)(26005)(186003)(16576012)(38100700002)(8936002)(36756003)(2616005)(8676002)(2906002)(31696002)(6486002)(508600001)(66946007)(6666004)(66556008)(5660300002)(53546011)(66476007)(44832011)(86362001)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?emdldjZHT29iTU9paE1lQUw2Z2dsSm1USW8xUU9ObkdhbTBuQitUT25uWHRR?=
 =?utf-8?B?b21Ga3lRMkV3U1hXQ1ljdTRjU1paYzNPUVFkQXBOSTlEMzcrcmNReE1VTElT?=
 =?utf-8?B?R2VmYVU2V0N1U3BzMmM3NjAwMnF3YTVodmhKRlZtN2tNeFUwQnViWUZoWDFz?=
 =?utf-8?B?SzJtZlc1RE45UjhudTMrZnJsL0Ruc3BlZGI5VGtvYnlQYVBET0c5WmhNUllv?=
 =?utf-8?B?Zk93TVRHSE11NXgyNGsyak9Nc3M2RzNaMXlHOTN2NUd3TzVzTW9VQ3k0SUJ6?=
 =?utf-8?B?WHVSeG94TVZQRjc3MnozWndXd2VjVjlGcnFkeXVIS1JXNzFWV1hBdmJsVU9W?=
 =?utf-8?B?dGZhVm5MVUhET1FEYzZrNWgzSXFrUStUM1kxeGhDQlQ1YmlzdUFZeWw3VGlE?=
 =?utf-8?B?dnNoSW1iN1RaWDBxMVZuVGwrMjNSYXVvSjlaN3Q2aFhpYVdHUXhIZVhsMUdJ?=
 =?utf-8?B?Q2F0VHplUGtqWU9EMTJUT3pIcWJlendvUWhXSUl2NnNObkt3MFlRMmpNaEg1?=
 =?utf-8?B?NnBkdzROZEtsN2hqMkJTR3RtUGtUNWJTZHhLcnRuc0tkekNZa1g4QThraU4r?=
 =?utf-8?B?VDcrRmVoTlBtMFMxTTF6bS83SFB6ZzBoL3FENjM4WDZMaDlocXo5Um9kMU5p?=
 =?utf-8?B?S2pjbitCY2xNVllFS3p1VSsxZ3N5eDVXb2lCaFdnOXhBZGJ3bVFHZWxWRXVW?=
 =?utf-8?B?ZVdtU0hNQ2JTRy9QN3NodUI5MHlCU0ViZnpTTjc0blRPM3lDVmNZVmFLU0Fn?=
 =?utf-8?B?VnF0YThLc0lJNXlFODNMam9Pb2M0RTBucmtadjhETHhuTDNQc1VTK3ZVRjJz?=
 =?utf-8?B?aE9DRDViU2dkZnpsQTJOZ0JCOEN2cEFHQ0d2YlVHS0JpdG1vbVdYK1lleURN?=
 =?utf-8?B?RVFTbHROSlU2UHZTK2JNOTlzNjJrZkt1UjdvQTlpeXA1WFhLNVZRaHk2eEgy?=
 =?utf-8?B?L3N5MlErc3ZNeUhleU1VeHdrMGpDVnlpS3BQK1hMSjVZUXlVQkJwNVhaNklt?=
 =?utf-8?B?TC9OeGJCbGx1UU5CUFY5bXE5YkFINUxsVVJoQS9QWkYxeFdON0p1bDV5MVJV?=
 =?utf-8?B?eGE4dWR6MUlCc3c2RU9GbnNKRmNJdXVRTGkvRldjMUZINlFoWWVnTGxhTWtI?=
 =?utf-8?B?cEFvdUhvWndOcnlvNld4RmEwWDF2bnJIUjZuR0F2RGMveVZMZytpeTc1K0hK?=
 =?utf-8?B?UFFPQWl0dmZha2tmSmFXRlpLdkVmMGc3Vk9rYUk4NEJ2em9od1JHVjN2ZVlK?=
 =?utf-8?B?VVBpL2h2eGVibE5ZaStmUUFRenU2SzlGcnRFMitpRHUxSUpla0xNdERJRm5M?=
 =?utf-8?B?eFFJa1ZjeExtQVNKK3F5T0kwYWV1OFBINVZjcmIzODQrZERtSk1MT3MwTjR3?=
 =?utf-8?B?L1JZd3ppajlVR0xlOXExNFo2QWhjQndaS2J2NFRYdEpzMVBiS1lxd2Y2ZDdv?=
 =?utf-8?B?K3RwUzRwTXhKbExDNG5leXlYeXd1MkxMSXFUNXRaWk1UWWc4WFV5eGpDQUhv?=
 =?utf-8?B?ZTVwMHdHQkhhYngxOTZKT0JqKys2NGNvbnJWbmtHTjRYVWxnbGZlQ2lpbm5V?=
 =?utf-8?B?d0VnSExRVmkxMk9UNEtsbzBRbG1WRlV5MDNtM091YUpJWkVncHNBYjBMRy9q?=
 =?utf-8?B?aUc2UDRMQS9CUmxMZVZ4Nmc1OUx6NU5oN3ZkaSswMUVUd3dDaGowQzhraC8v?=
 =?utf-8?B?d0F1RHpRc0ZzSmo5a0tGdm1nZVg4bE93Mlc2Y05FcWdrMmpRcEJQTk10VkpY?=
 =?utf-8?B?VitneTZ6cGlLVjROS2pVcVd5Q1EwT2J3YjViTkkyelRhcFVGS2RCYWhkWlBn?=
 =?utf-8?B?aXpOejMramErSnRmNlBGWkd1NGd0My8rRmFFdjZBR2U2cDR6V1U4Q0twdURK?=
 =?utf-8?B?aUFIM3NEd1djbHllNnVzYU1ET3JOOEgzU0FVOXFOSmI0bkR4L0lGUE5ybklr?=
 =?utf-8?B?dUhHYUM1UlYvYmxGVjdWNW1JV2Y3T2JvcURVQzZKSW1KOWJ0bUlRbkdiSU1q?=
 =?utf-8?B?S2pGQis0UEJJL3poWURUeE5GRWZraElRUndtcytFWmVXN3hheDFYK0dJL0ky?=
 =?utf-8?B?OGcrTUUrR3N6STlaTi90dmJkSUlZK1FyWDZpNkM2TndTZTBpZW1UdWJsNFlC?=
 =?utf-8?B?MlJvVzJBQzJWTkx5ZGkrSVFWdVVmMjQzNFZrTFpwQmphSFpDYUl3Sko5Q0Rv?=
 =?utf-8?B?Y1JxR052bS9MK2g5STZxaFRldGVKTHl1aWw3Mjlwb1hPdEJMUVp6UUpJY1cx?=
 =?utf-8?Q?QbYZrbu3JhrNX5ieB0IBFN9XHq3njP2AaLzmjT/hU0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ab1160-79d9-4ca2-9cc3-08d9a0566b90
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 12:18:48.5212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IhoFlncXnMDd/b/rKZAtckdGrA4x53axN0C6LI1ovuIGV5Mb6nU6Zw4afQb90nT9e9WdKiOCan05xoeuLd/R8uNBPwWgufEFBW8VoQkWjFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4884
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10158 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 adultscore=0 mlxscore=0 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111050072
X-Proofpoint-ORIG-GUID: sdyWVEPLMy0y0LWnBC2Fn0GVmVBO8pu9
X-Proofpoint-GUID: sdyWVEPLMy0y0LWnBC2Fn0GVmVBO8pu9


On 11/2/21 5:22 AM, Juergen Gross wrote:
> alloc_xenballooned_pages() and free_xenballooned_pages() are used as
> direct replacements of xen_alloc_unpopulated_pages() and
> xen_free_unpopulated_pages() in case CONFIG_XEN_UNPOPULATED_ALLOC isn't
> defined.
>
> Guard both functions with !CONFIG_XEN_UNPOPULATED_ALLOC and rename them
> to the xen_*() variants they are replacing. This allows to remove some
> ifdeffery from the xen.h header file. Adapt the prototype of the
> functions to match.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>


Applied to for-linus-5-16b.


-boris


