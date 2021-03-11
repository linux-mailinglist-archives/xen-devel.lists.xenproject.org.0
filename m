Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C41E3375D7
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 15:37:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96629.183009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMRW-0006Pl-SO; Thu, 11 Mar 2021 14:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96629.183009; Thu, 11 Mar 2021 14:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMRW-0006PM-O2; Thu, 11 Mar 2021 14:37:38 +0000
Received: by outflank-mailman (input) for mailman id 96629;
 Thu, 11 Mar 2021 14:37:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QxnR=IJ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lKMRV-0006PH-Lt
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 14:37:37 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 822958ce-4c90-4443-ab8b-5e535ed50479;
 Thu, 11 Mar 2021 14:37:37 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12BESl2E146795;
 Thu, 11 Mar 2021 14:37:35 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 3741pmpsh8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Mar 2021 14:37:35 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12BETWHN122781;
 Thu, 11 Mar 2021 14:37:34 GMT
Received: from nam04-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam04lp2055.outbound.protection.outlook.com [104.47.44.55])
 by userp3030.oracle.com with ESMTP id 374kp11wry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Mar 2021 14:37:34 +0000
Received: from MN2PR10MB3293.namprd10.prod.outlook.com (2603:10b6:208:12b::24)
 by BLAPR10MB4945.namprd10.prod.outlook.com (2603:10b6:208:324::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Thu, 11 Mar
 2021 14:37:32 +0000
Received: from MN2PR10MB3293.namprd10.prod.outlook.com
 ([fe80::b87b:5cdc:87f4:c465]) by MN2PR10MB3293.namprd10.prod.outlook.com
 ([fe80::b87b:5cdc:87f4:c465%6]) with mapi id 15.20.3912.030; Thu, 11 Mar 2021
 14:37:32 +0000
Received: from [192.168.1.195] (73.249.50.119) by
 BL0PR05CA0012.namprd05.prod.outlook.com (2603:10b6:208:91::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.10 via Frontend Transport; Thu, 11 Mar 2021 14:37:32 +0000
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
X-Inumbo-ID: 822958ce-4c90-4443-ab8b-5e535ed50479
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=3NS4yUqw+3HoqkMmybE3gAKIvPDqi+pADhxYp1kKi28=;
 b=xvD30eAj0p+whvR/ietWMy9guwR5l34Px/fNG2S06aQvWcXxA9w3Cfsoqh0UDCZf6ji4
 u3lvHyy1bpb1zFNM1Qp8GNOgV5jnVid9gOKog3ZGIxauyrWCxQO90V0Bn7T/nnE5RM/C
 Cq/XlMQmheZGrrAcxZ560OMSbpk5UlV5+vZEuWGLyKUkvddpdc8uE+n5zfr2qfEfAjZp
 LLUrvyCvP+zDgLZVf5rfvJXmkHtEH7v5eou3KNPDxOuVb6FT35/TaoMc8bcEDqhHjOgP
 DaIzUV6kVET+/S0mL3BEIJNDLQEB2a+CUZP8HHef+y6JHhKPxLlLoSx1lctZ58a72NhE Mg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P96evmk9CE3qXZNNDnnWW/k+U8WHvXCz5ftpqWVY8IV7WcWatx8QntOVSlOr0aG/a9eXYzbQc2F+8VzfCm7ZbkpPce/QHPOediAqSgTjH4wJQkRwj70fAF2a3guWrvu6FT3Ljo2jcdR8zZN8fHSQN0g7He+JSFEBkgEUFn7sAglbBHKGzOfLIwtDyMDhCtMb73n7tBkIsANKIQkx1tvgG9ihUupo9bd0zCXvwV3HQt2MiQ+pCYwIIUhkVUgwUbuv/20uoCqw5kN8SPx74F08SZE7oEcbEtQc4wY+JlBRQ4hXrM+DfUV1uasPPbxPPhZccinJ9+18jjItfwMBgsIG+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NS4yUqw+3HoqkMmybE3gAKIvPDqi+pADhxYp1kKi28=;
 b=h/sAsjjF5XU87m9yJPZeksnUoWQ8qlZRjnfTjqemgtMN155Jwt4iTtXEg5FBivPYjeY0tcZhe3WFYxUBIE7I5bj3OcMU0JVtNyNrYWJwwGSrRsmEZMnN5pjZZLONOFahL4a1UtU+EVzQ+nRAIIXpZs7oWVsOAIEHzwegtMm1Kf9mAVh7n+RCMqTsouprW8vubTk2f9gC8ilWDAKDFviYkGAlgk6E/N3kDIEOCw7xX4bKH/t0PH/Sook+Gy0edlXaD8MfXPqd9rGmzd6lPSOLIHSdAqg6Ud7J3m3MAtBduo07+78FlEqsTbk9Py2fGFraKgLMiWVsLGzLnaGKeyipKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NS4yUqw+3HoqkMmybE3gAKIvPDqi+pADhxYp1kKi28=;
 b=qnSO2Ls/k+IVld9mD8Bqc/L1zx838CRDHTpvzgRdHnum5ktB5WHlrtn5lsOUdaiIzXmax5awKJSBgSikQjkDNMMZVKy+jGUn6z7jmzbnwN4jVzR1Iv558VH2yPvJb1ydRhNbnHoFrBir1zpy9+Bt/GiyaLAjvsMSxhrH+5wopCU=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
Subject: Re: [PATCH] Xen: drop exports of {set,clear}_foreign_p2m_mapping()
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <746a5cd6-1446-eda4-8b23-03c1cac30b8d@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <063d7e77-c38d-7eb2-c129-ba5a0950c985@oracle.com>
Date: Thu, 11 Mar 2021 09:37:31 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
In-Reply-To: <746a5cd6-1446-eda4-8b23-03c1cac30b8d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [73.249.50.119]
X-ClientProxiedBy: BL0PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:208:91::22) To MN2PR10MB3293.namprd10.prod.outlook.com
 (2603:10b6:208:12b::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4c0eeff-19a6-49b9-fae9-08d8e49b345e
X-MS-TrafficTypeDiagnostic: BLAPR10MB4945:
X-Microsoft-Antispam-PRVS: 
	<BLAPR10MB494576364B32A11B6157F9B08A909@BLAPR10MB4945.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tnq+nQFCnk7uh5KUcTpg7hHfTIOJT4dFOu4gZSVzJNQWlIe/wEs8ut+sTn1fCQ4Dzudmdwu+TcNPCUywj3mj4lVyn3sHnkPh6U75BbVqWsZV+Yy+sin4XMFbZbyEYeXvpabi77hU10/0HzhX0wPsAa3NJbkzA6VpDESmriLmEcO/Dd7RYg9ZH3AuEoWdZu+WoNiSE7hg6YdK1fcSwo/4wfqZl3WWmYCO4/jgyGznEjlpcDEU2EGRhPcDsWhrCmoVlcvZaFI9f9CZEcXQsbHe17f7MlQL2P6Bt9DgYHeSPS95zyLUtXyuWOQuD346+V3pnOozbi++z7FdWF1NDSJY2wkkrkZVmJrcoFTOmMCE7zGHET9mvYc5rr7Ovn/dnJFPEAQwyn8r35zGoReJbP72bNw94QF9ygjUnibaNakeDOfE9sQtHqAbRoWTnS1v2wp55Y6eiQjG293r9MPU6+mdikYVgC9TcRFKTCbb+BDRGKQ1GE19jxwiUmhXKJMoFRbOZ87Y9RJFpSz+UHGiGarXBgrYaYW7YEB56OBkW0CLg0PSah6aT7NmL+6PF/30aHurnDsSHyeaS9kq6w4EIKDwf9qmfv89sVl5EcZZlb/Pem8u+9ctc4BNWO2la+QfnDFZoFkn8NWX/ePm5vSoTv1ZiIZpbzAy1/MC9h4SJpkhQbVtgA6Crx3l71/sjf8GyRqd
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB3293.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(346002)(136003)(396003)(39860400002)(16576012)(316002)(8936002)(31696002)(36756003)(44832011)(4326008)(4744005)(86362001)(6486002)(31686004)(186003)(5660300002)(478600001)(53546011)(110136005)(66946007)(66556008)(26005)(956004)(2616005)(8676002)(2906002)(66476007)(16526019)(70780200001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?YWtWR3hObUNndmdFZnJuZjljOGxGVFJQZkJicld2RjRBMnBCOXdiRnNhamRq?=
 =?utf-8?B?Mk1sRFZhQXBjeE5YZ0pQaFdJakhBRkhwbmtxaWdEN1lsdzNZNTc0VkFuWG44?=
 =?utf-8?B?T0psakxSaG1UWGNEdnFLYTA2YmkwOTU5V2dCWWp1TnhyVHBDVm1ldElWNEJX?=
 =?utf-8?B?WGNUVlExbzUrcE81Uk1rYS9sT2o5Qzc0UkJYQU4vWmg4L1p6RGRSeThQYzBH?=
 =?utf-8?B?K240blhKRUR1RTN0RzllcEVXMU9EYWR5VUxkQXo0NlNyVWI5UXBuRnltVnZ4?=
 =?utf-8?B?RE9OM3NrenpiSEJJajQyZmdyRmxTMnZrN1krL0swell4QTB0d2pFdmFhMUVO?=
 =?utf-8?B?dHVmeVNDTkxMRGNvMmg5cW5ZYnk5TlZCRFZHY240c09NY003MFRjbDdyRlgz?=
 =?utf-8?B?OU5wS3ZoeElqeVlydVk1bTljQTBWSSsvYlBmZ3FsajNtTHJUOVBmNUREd2o2?=
 =?utf-8?B?RjhiODA2VXZITTA3ZFRmcktxRmJTNzc1RFFOZkNtbXpZRlpFd1lhakFVWDR4?=
 =?utf-8?B?TGdFcVNjcXJPQnNBbW44TWFGNG9Jcm1rU1o1aGRqd2cxSG9HR1VKcGN4Y1pB?=
 =?utf-8?B?alQ0dmZ5T2N5bXErb2lJMCtlMC9rQVdLTzdhZDgwcnQ3R0RiUVJna0Y1ODF0?=
 =?utf-8?B?NnlZL2wzUXl5QkxGUHk3NmJpckZHbUptVXRCVVZSVlhibVA1S2Y1YTd3cnRL?=
 =?utf-8?B?K2hTaWFtU0p5cXV4RE9IWjAvNU5MU0pWMG9ZY1F6V3VTOHpxTS8yZUszenlx?=
 =?utf-8?B?bUpMUnZQM3k1aHpXbzY3TEQyRDA0UHVncW1CYkZkemFrbWk1blVlQXlMbWh0?=
 =?utf-8?B?Ulg5bFRuV016WU1YRjlTQ3JOTml6Z3d4NG5CRmE5T09Ldk5xNmNRK0xDbWFV?=
 =?utf-8?B?LzZEQUVHWUlNRVFia1Z6akozN2UvN3E2WFJIK3IvRU9LZ3JBVndkMFUySlRW?=
 =?utf-8?B?dXU1WTd2aEJUYXovQmwzbFZiNUJKUGQxQ3NPTWx5c1BkWkF0MGsyS2pFb1hv?=
 =?utf-8?B?UUFUQmNvNHZyQlNtWDF3QktRaWREeVlzWDV3SFRGdXVvR3h3dm9TWmdLaXd1?=
 =?utf-8?B?QzAzUXZsODk2TGVmSGxlanJYVy9KeGhsbU5aSGdHQVRSdnp1c0RvTXR5SmRM?=
 =?utf-8?B?YXlYTk55cjZYY0x4QTg3M0VQNUVVMW1UYlNsL0lFWHFDOXZBR1ovelp3NDN5?=
 =?utf-8?B?OTV2Mk1rY0Z1WUo5NExIQnBuNXl5S1RZVHplVFhRSEszUjF6SDZoemNWMXYw?=
 =?utf-8?B?SUxiWTVVWHlhSml2SllZSDc4dEpqNy96WmgxSGZvdVFkZXZ1eGxqV2kzZkhk?=
 =?utf-8?B?MExZdExzQUdXZXQra3hBT2Y4SVI0dnR1YWFEZVBGNFpGT3dDV29nL2hZcFlH?=
 =?utf-8?B?Vzc1WHF2anpqRktNc2J2ajhaVGt6M09RemVmY1pNdjkrNVBNbzExQWRDQm50?=
 =?utf-8?B?TXRpaGZ6SzhTeHp1L2c1MmNYU0dPOUZjSUVxaHFVczA2RkxzNVlVbXhkVkJZ?=
 =?utf-8?B?K2E1NEp3V3Azdk0vZmFuRzVLSEZxSFIxMWl1cU5oMjBQSGVaOEVRekRGT1JC?=
 =?utf-8?B?dTBoTWc5M1VYSjhSOVlJS0YvL291WVpGZmZVSDBmallaamNtb2VXRUNTYkhu?=
 =?utf-8?B?b3pPdkpDbXZnK3pTbGppRTM3b1cvTkN6K1FmOEJZMmYvRjl2ZXlGME1ud0NY?=
 =?utf-8?B?OGRMcjVWZHYrdldBNjdmelI3cWhsbGRWT0dTcnJTWTlCRW40YnEyRlQ3ZUZ3?=
 =?utf-8?Q?3ys9DzJBDhW49lrVRe14VB5KSTvSTgXJ3/Vm6WR?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c0eeff-19a6-49b9-fae9-08d8e49b345e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB3293.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 14:37:32.3618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7wwkME50rLcLfEILxkfEZUitNCzO3Zb+HCSJRs4Ed+j4y3a3xmfmChVnRhBCXkqpKxhsIARRn/WjDjnwVGx9G+zSPPyi3kP02DlfFIwHFC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4945
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9920 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103110079
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9920 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103110079


On 3/9/21 12:00 PM, Jan Beulich wrote:
> They're only used internally, and the layering violation they contain
> (x86) or imply (Arm) of calling HYPERVISOR_grant_table_op() strongly
> advise against any (uncontrolled) use from a module. The functions also
> never had users except the ones from drivers/xen/grant-table.c forever
> since their introduction in 3.15.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>


Applied to for-linus-5.12b


