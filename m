Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF57B38E6F4
	for <lists+xen-devel@lfdr.de>; Mon, 24 May 2021 14:50:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131746.246075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llA1A-00025L-Bk; Mon, 24 May 2021 12:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131746.246075; Mon, 24 May 2021 12:49:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llA1A-00022j-8J; Mon, 24 May 2021 12:49:12 +0000
Received: by outflank-mailman (input) for mailman id 131746;
 Mon, 24 May 2021 12:49:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JxRd=KT=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1llA18-00022d-Hv
 for xen-devel@lists.xenproject.org; Mon, 24 May 2021 12:49:10 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44020933-42a3-4b56-8c84-e982bb47f04f;
 Mon, 24 May 2021 12:49:08 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14OCiWQk172610;
 Mon, 24 May 2021 12:49:01 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 38pqfcaytm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 May 2021 12:49:01 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14OCj3r0097080;
 Mon, 24 May 2021 12:49:00 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by userp3030.oracle.com with ESMTP id 38pq2t96pf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 May 2021 12:49:00 +0000
Received: from CH0PR10MB5020.namprd10.prod.outlook.com (2603:10b6:610:c0::22)
 by CH2PR10MB4133.namprd10.prod.outlook.com (2603:10b6:610:a6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Mon, 24 May
 2021 12:48:57 +0000
Received: from CH0PR10MB5020.namprd10.prod.outlook.com
 ([fe80::6cb6:faf9:b596:3b9a]) by CH0PR10MB5020.namprd10.prod.outlook.com
 ([fe80::6cb6:faf9:b596:3b9a%7]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 12:48:57 +0000
Received: from [10.74.98.132] (160.34.88.132) by
 SA9PR13CA0037.namprd13.prod.outlook.com (2603:10b6:806:22::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.12 via Frontend Transport; Mon, 24 May 2021 12:48:56 +0000
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
X-Inumbo-ID: 44020933-42a3-4b56-8c84-e982bb47f04f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=HZm3Zn4yc2TvaiF4iqcad8aDOxnOocQRYrztVPiJ4U8=;
 b=VUSP8Qk9qxOfIe6WghE3kaW8NLr0it12hlTTqtmXnJ/PNCWiKBwnipS86ukwbnLRpmd+
 5A7npgxkSUo78JrVKCEX4F92xy8qD45C0bMzc06RJcGaLBblaRUekkqYCJYXj0Nv3vRs
 9tDU9brgpl+xIHYO2CCeLHRpmve3CW5bgjunj++gC7agSNPNTM7dCGrY+/YEQxwGJi1a
 s+sWGGgn0eDpkrUA9e/36JE+YV0k3XAZisyK0VY5EhhDvmP0llOqCnR4UN20w8Yitje1
 kMIjvvqaW67ycM+j6MdORuE9SdvwGvYR6EBww1lKDhkaPzhhCSbag7WakbnKfDKvImKk SA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWqaQWmpaHE0pwX7k3K4bNFsYKDNshlb5Yc7I5582blSSlJyCfTIjROgggQKNDBamMZ1UqrY4JvQrL8s9mzw38tCjfVgehvBGj9kjtQgdeQQl2UECpiogamQbUPyDUGj+2knND+A2AqMYSluuwFpJyS3BfszBukYocsB/WR7c+sEvPYDsDF7G5gyVAe3C9GlN6O+4QaEAKpUBXaeHWByfxdccqaQ2dp/E+V1IxYnpPm5C8Q6vsX338LOsDZ3OkEAOD+50rY0Kg+1+Mole0Nc++WPPFiPEGPX3s49IYMmwhMVy/+qZ4mEtiECj3tpgmWRZlaGXQbexFIgUrxbn24KLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZm3Zn4yc2TvaiF4iqcad8aDOxnOocQRYrztVPiJ4U8=;
 b=At8/A6Rux06cXVHJMPxSXWkSu/NZ/9yeAH2MDDVWsi3/r+HVmNuQ57y8HbH1QazDsyBXXweRJ1uN9IUaGzBVHa7ZjfKUfDV69mg94xH+nokhqWKVAUc+ZMXkUkqUPuSl77DeXN5mW2IEdUUmaoGr/FBlHrUUbTIa32lkkfkwOQboWVe97diU+olvfgWoJZalBLY8Wv1rPzDcd2BUXW1ntPpmM2xI8AlHVsZRrDf2AN68jk8aBTmjqIrbf6Bwk85HyfnJC8JKQ4767BeZnn7gnrYrGblbOykfaaHluuLC2S1xzWYIaHOwRdDY29FIJXLPMpbW+B6XCrZGVZF0ktQQzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZm3Zn4yc2TvaiF4iqcad8aDOxnOocQRYrztVPiJ4U8=;
 b=s2FHAmdqczzmhENZEYdRq9Df3tscgYyJFA2XUT5UPDi7Yx1K2cmMf4vImgQF+jc/J9buIEOWHR3gY6oua6GpgiKXc8Yn/q4XE7ihbO4wi5+3ytGDRE4BXVdz70Af31j2WQgpKUhww+RggPI58/bWpcvXE8p3SiEhyw70RteDM5I=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH -next] xen/pcpu: Use DEVICE_ATTR_RW macro
To: YueHaibing <yuehaibing@huawei.com>, jgross@suse.com,
        sstabellini@kernel.org
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20210523070214.34948-1-yuehaibing@huawei.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <c27b37e3-7d4b-1ed1-2b8c-1fbde6e30c3b@oracle.com>
Date: Mon, 24 May 2021 08:48:53 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
In-Reply-To: <20210523070214.34948-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [160.34.88.132]
X-ClientProxiedBy: SA9PR13CA0037.namprd13.prod.outlook.com
 (2603:10b6:806:22::12) To CH0PR10MB5020.namprd10.prod.outlook.com
 (2603:10b6:610:c0::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c420616f-ea22-46af-88da-08d91eb24b7a
X-MS-TrafficTypeDiagnostic: CH2PR10MB4133:
X-Microsoft-Antispam-PRVS: 
	<CH2PR10MB41331DBFFA0916826EB820C58A269@CH2PR10MB4133.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2ZIizDPRSbtEVrx5faFrCXQEqEnpQWNtevF27hiXkZYtVQySLskGcekVUzIb+SFT7hjVaSW7BeyK6kAldvqKKVUYdmGVzbVu4nbSNel82QbYlEhheii3S1/Ja/pi+uA0nwX30DV4ilQgy9qLFwCF5yEc9rILxFZR7RldOfdCVKG0t2VN05CsXcEjo7oxGD6RWLoalfp+dhdOawMHxC7Q/awoKgTg5YcdrLmPHru25K4ovVmxGv1RPx7lqX1+/1NMH4R1sBHMuq/HvD4pDHhJ8L85Hs/h9cJ+tEA60Q2CI+2icNJ7z2Qj2hrccWQborQwVf7PldqKHzRiB1+3PCR7SJBplHvx9R5tx4/CPA7Hy+fEaQ5OV3Ub7jKdiYTT2qcVTf9Vj0S25NeSCpZo8X5PWgkpluU3I5bnHSz8pTg0+u0WmT+sZVvX1oCAGwzDhw4Ecx1Cxzhlk3HF5E+s9TBXBlOc/qA54VTnY82SNytCBkqyfuaTU3i5SLe3wNZav55wmDSHuaF+weqd23ROFutPCtbhBOkRzcvZ/CZlBa5+sb5waqcmsJqJowA3Lrh0i6+qM3T6xsgmNmrzL64WrTgfiSHUcSKW50ob1/dahMhzE6+vLqFKeN3RzPVQFb1KgBIZeIMssratclEMCKkCWd4KxKSYeJY5v+/o579D7//d2Ktst9BQ+U+NQyXEaVchxaaD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5020.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(136003)(39860400002)(346002)(376002)(44832011)(86362001)(8676002)(2616005)(478600001)(31686004)(31696002)(66476007)(66556008)(66946007)(956004)(316002)(186003)(26005)(53546011)(16526019)(8936002)(5660300002)(6666004)(36756003)(6486002)(4326008)(2906002)(38100700002)(16576012)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?QUk4Mit6a3QyeFQ0clh3RlBXcGI1c0QzRVpRbUh2QitEdU5HTnd4Rndqdks0?=
 =?utf-8?B?ZElRR0szVU16ZC9UcDB0Z1ZnaWNOQnNPS1U0em9zcWRJN1paeDR0TXJDV2ht?=
 =?utf-8?B?RFphdVVMb2pmYmRtTUZMaHNvanJWMlgyVjIrRStwc0YrenZrREJNbWVtODhQ?=
 =?utf-8?B?VlQwaHRKRGhkcGlOWHMzVWZvNm1PSmtvQ3FKRE9pSVNJNG40TExwTU1hNy84?=
 =?utf-8?B?VkxtVUZOV2xybnFPc1MrMDR5bFBpL2pIUm4rc2NaZTZxNFZaUGszWk8waUs2?=
 =?utf-8?B?YnlmeHBXWjRXQlJZNXJ2cWlmTUtwMlJGblZHRVd6VTVuQkdJT2duMktJQ2Jq?=
 =?utf-8?B?UGhiaVR6VFlqNVA4VDJ2WlJEK3NGUDFFVWRJYlM2QW1rYkZvS3h6TVRRemtk?=
 =?utf-8?B?VlNSNnR5UVNBZWw2M25MK2F1cGJreGJzOURzNTRDNkxPdEtXMWE5Z2hOMFlD?=
 =?utf-8?B?WThXd2lnNTNwYVlIZXNYbVNib293a2pXRWNIUzhSa25FajhlalVhdFB6ZUlL?=
 =?utf-8?B?OEo2STlvV09ZVTNSNmtxSnNPd29YUm5jaFFGYjc0eHF1dE9FemRyd1NkRElr?=
 =?utf-8?B?cDFic2hIclpPeEtxZnlmbWUyZnFuZGdQcjFwRkM2K3FhZHNQQW5GY2pmajhV?=
 =?utf-8?B?Rzc2RTlBaHRCdWNMZ1ZyaGwreituZ0IwMUtySWtzNFB5YWhUUEhvQzEzc3Yz?=
 =?utf-8?B?Wk5Da0l2azBtVFBTSkJrZlBHa1Q5c3BYUG9vUzFheGVFQ1lUUDdESkhKV3lI?=
 =?utf-8?B?ai9JR0dhSElLeFE3aHdRd0xrekxMRERIR2Z6SUlKV1Z4a3U3RHlIVGlaQ29v?=
 =?utf-8?B?UlhvUEpiZlJHeVpabkRaUXJwYjVGWnZlNWxMejJvYlVSYUJtem1CUDh4Nmhl?=
 =?utf-8?B?VFpSeGZENG9lV09nU0pQWW5JUkV2SS9vcitpMVVHZ2pCcDhEK1MvNjBwdUg5?=
 =?utf-8?B?Wk5RYUNPMktiV0xKaEU1NVllRlN6N3FDMXRwZ1RINTBPbHNLdk5aRTJRMHNp?=
 =?utf-8?B?WE5iSHA0VE8xVEdWUXFDMXNsclBzbWlBbG5MZjg4V2w2NG5KTmhhdnlOMCsv?=
 =?utf-8?B?RnlLVVQwQndtdndzbHJ4NHVPRmNsUVdmNDQ3Y1RkM2RxdWZReDllRjgwUU1B?=
 =?utf-8?B?cVh1RzErcGY0MzFKTzNhd2Y0cFJmbGFGcnVFRGltQXVPa0lXM2V1L2NqWFVr?=
 =?utf-8?B?UVVmbjBvSWxWNVcvVnNqZCt2bS9qc1VGRWR0V1ZRa2FrRjRCa1pNZzd0K3BI?=
 =?utf-8?B?SnJqMTl1OHk0TEl6T3dBU1hhK250VnhlMm9DMHgrZTdHTllCOXBiVzR6SEtF?=
 =?utf-8?B?aEJCUFh1Rkd3WXJ6YzlOREk2Rzk3SEFWVFNGRVVacWpCUmZvQXlDMUJuaWk2?=
 =?utf-8?B?K25ISWtROW9UTVB3dVZMNTB3UjdEaTBMTjlMekR3dkI3ZzdaWlgxYkF1Ymg1?=
 =?utf-8?B?MlorVDVyZDFvdjcxZy9FdzVldlcrYS8yRDZXVDhYZFpOOUQ0cFFsS3MzemNt?=
 =?utf-8?B?MmcrUHNOQy9QZkR2czhGSlBkNHZGYVVjUFM0aUhjQnJOdU95Zk5HTTljMndj?=
 =?utf-8?B?b0lLN2t6UW05Y1NJS1cvSzUzYU0wRWNlSzk2UnphVFJVV1hyMmV1TEhIZjVa?=
 =?utf-8?B?dDlMRHY1QXJFdjJqQ0Q3TlcyV1NWOU14ZWEyYUt2NXgweVh5ODBZdDE0N1I5?=
 =?utf-8?B?d3FDRkxSM0JhVG5IUEZFcEtxRlMxNDJ1aktCOXUxak1RWEpGb0tUa3NLek1x?=
 =?utf-8?Q?Zr2O/JjxcrI8YRuU84zsVnZlvv0x1T7Yd7UeugY?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c420616f-ea22-46af-88da-08d91eb24b7a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5020.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 12:48:57.2195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LlwFnVuVrZFwTdXUMvWktk1XyM8NWD6Bi8hGDIhHdDYFpo9e5IE9CGnFv+O98H1TWgjsR5HPhN+tSeRU9M9LKupaH/Iafj22KKZaWhRNyJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4133
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9993 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105240083
X-Proofpoint-ORIG-GUID: 9N6i1w6HVHdfrVWS1x4Olg2NYGIUA5Gc
X-Proofpoint-GUID: 9N6i1w6HVHdfrVWS1x4Olg2NYGIUA5Gc
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9993 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1011 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105240083


On 5/23/21 3:02 AM, YueHaibing wrote:
> Use DEVICE_ATTR_RW helper instead of plain DEVICE_ATTR,
> which makes the code a bit shorter and easier to read.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>


Do you think you can also make similar change in drivers/xen/xen-balloon.c and drivers/xen/xenbus/xenbus_probe.c?



Thanks.

-boris


