Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A1637B2B0
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 01:39:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126074.237321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgbwt-0003S3-KJ; Tue, 11 May 2021 23:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126074.237321; Tue, 11 May 2021 23:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgbwt-0003PN-H3; Tue, 11 May 2021 23:37:59 +0000
Received: by outflank-mailman (input) for mailman id 126074;
 Tue, 11 May 2021 23:37:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GEoi=KG=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lgbwr-0003PH-Qa
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 23:37:58 +0000
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b04d6228-ef1a-47ca-8df4-e0f983b9bf6a;
 Tue, 11 May 2021 23:37:56 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14BNTmml132625;
 Tue, 11 May 2021 23:37:54 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 38dk9ngd8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 May 2021 23:37:54 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14BNYfMe123177;
 Tue, 11 May 2021 23:37:53 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by aserp3020.oracle.com with ESMTP id 38djfa7752-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 May 2021 23:37:53 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BLAPR10MB5203.namprd10.prod.outlook.com (2603:10b6:208:30d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Tue, 11 May
 2021 23:37:51 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::78a3:67d:a8ca:93cf]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::78a3:67d:a8ca:93cf%7]) with mapi id 15.20.4129.025; Tue, 11 May 2021
 23:37:51 +0000
Received: from [10.74.101.70] (160.34.89.70) by
 SN6PR01CA0014.prod.exchangelabs.com (2603:10b6:805:b6::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 11 May 2021 23:37:50 +0000
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
X-Inumbo-ID: b04d6228-ef1a-47ca-8df4-e0f983b9bf6a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=irCO4qVBrM4lVCwQYKC+QoX0RJqaChwsrUA4h8A5Qqo=;
 b=RY9C9vjQeNi3CEArAhRB3IiJ4my6kG0BLxm9IfNaamE9RdH8i5f+nN8EqQyOWphAqrQF
 FJJBsXDFe4WLdLzwkBrSqA+CoqEMPNAhWH2PaNSZJvVnB7StC4lDQtKU+cH4hopKfG86
 kkLLxkHxbuOQVuOw1skpx/wYQR9VDDw5kVX4q524To9uCqN15K4Mumaokw3+W4z+NWH0
 NdegfunNkypw7gr2r0l+lAUJ1GImdEPZCSjihh+yafeLrTpRU74qqVU/CjiHFYbPmGYv
 7nO7ZuEkFS627MNRw1y1eczGtIsF7mm30SP9GLNwE4r/gYOAXHC9L2E0br3jvnSVH69y OA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQfoalej1RPBYf91mJTpvVqadzgkICCP495QHoDxLx7eHr5JLIvc2c8X18zxcx8NS2vqARAgsLkhkUcZ5oU9HGK6vqYg1yGgYd6algiorog/v4yDX7t5+foEzMrtDGyAnP402r+cG96nAFHlL1zczqe9qNk4fP/Q7EH1uBs09f6wGO7S6ntghlFc6MScVsuHtUX+WvGmHIzmJMUgBwFgoy/ZvDNCk+2WMeMuOCnceMY7DZI+XcZyo7/A63pW91nSjQMeXLbN+LZZ8rBvbx6pfZ+gOUdWPZ+zohwnkk3MBOPcYb8y1uW4Y6Q6hTbHeNhvk4rYUH7WVeO0dV1EsdkVYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=irCO4qVBrM4lVCwQYKC+QoX0RJqaChwsrUA4h8A5Qqo=;
 b=WzUO2Pj8iCpMFeaRU69b3o6PUuegbozSUwgJl5ioawyuQhhyZmNOQU19fosIxvAsCNJ2Zqu0aEWdqN3BJM0qx+CYxcW2/Xhptgg5ETVSCQSgmS19YRaKeLjZxBxdWMDCaanEYLbcD7INfuD/6GjPXISkoDq8tuY43k74+Wf6TY80r9Q385TfFka0deRJft+MA/ZbPQCGjIWrmoRGKiyDeagU9jHZsqS4DxJFPjo3qOcoQD5U/eTE0KFNAU3MLFzqEHROuooni1f5BBHw8HdMspNvOQ0VOCEhMfSmbBRAsC6Ist+X7MVCzcPamGQz8nkj+jcI6lj/tU7WishlzXrg4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=irCO4qVBrM4lVCwQYKC+QoX0RJqaChwsrUA4h8A5Qqo=;
 b=pP9iJ8s2hgcnXcQxsKpcZwHjp7c3ISaTQHhaK5ck9xka6mGypd/TGvGa5C/WURpXDuL2QDcxfhZ1ox+fTDKImyZDIPjrHgyd2YKLokQ3Uzfv5TEHUFDVnn1cgutMcK2rmyjjDJGZEHfNsSC7LFVBWKEOJgWBoKCIfAhIRCqfzT4=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH 2/2] xen/swiotlb: check if the swiotlb has already been
 initialized
To: Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
Cc: hch@lst.de, linux-kernel@vger.kernel.org,
        Stefano Stabellini <stefano.stabellini@xilinx.com>, jgross@suse.com
References: <20210511174142.12742-2-sstabellini@kernel.org>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <2e5a684b-3c74-5efc-2946-8ca002894ab4@oracle.com>
Date: Tue, 11 May 2021 19:37:47 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
In-Reply-To: <20210511174142.12742-2-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [160.34.89.70]
X-ClientProxiedBy: SN6PR01CA0014.prod.exchangelabs.com (2603:10b6:805:b6::27)
 To BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cec55a77-a621-4bf3-8fe9-08d914d5caac
X-MS-TrafficTypeDiagnostic: BLAPR10MB5203:
X-Microsoft-Antispam-PRVS: 
	<BLAPR10MB5203BCD00D78563F0CF982A68A539@BLAPR10MB5203.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G5MqafTlTjzjlSDUk6SQtohQAGOm9+0w4W/EgVgYQnHDkGyuzVwvQv/4lBqEKIDB0GpDmgL7OcfS15pD8fJfneatMzEemxXODT/fifR6HXKMINRnmNKVQtXSKwswnZkGRJncLf/GKYd7P86zr+5Rg1SUoIJ0sDr1luG/bv6ZiREw+dbRg7x6KOL7ja8IBJY8u4tQ/83dIf3TTlsurrzZFOaWF7gf0qkJRijcRTbn0S+kKG0jgCHVJC/DwyRShXzmKYSHciGKF6ldis/2/y+9M5FMQX6cUnPL6H4AX2vcYHg0tpP6kNcy9tZ2U5mqWTIfkO9RR601BusroAVXX/a4UoZebGT/ETQslg8P/pyh05C59SnOfpbWzAReDQ8Go8RaY3HWdHyVVmkGuJwwB83OqnPs/RrbeeUbFIehjKbbZab1U5HA8Wix4jCdejA4R8RdEtsVguW/fUmdZzIv272RnERBaHQOZMRiSgJImKJNwwLJmkkmT+dW17VMyCjurs7llFWeRgG+g+LiJnH7MEGxdmWRVNjC2GVkjy8M752kfJo/3dNjHrtWqIX0dhlG3JMiep0AL5LqNazUOJgchg+1Zu/6tdGXrQ/GMDaPIAmEDeiYOxaD3sTVzRN4GBRivwLuIZZCo7zutxZOPB02zvqo8Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(366004)(376002)(346002)(396003)(6666004)(2616005)(16576012)(316002)(83380400001)(38100700002)(478600001)(53546011)(2906002)(86362001)(26005)(8676002)(8936002)(186003)(4744005)(956004)(16526019)(31696002)(5660300002)(36756003)(44832011)(4326008)(66476007)(66556008)(6486002)(31686004)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?a0pJdzBPc21jWUJPM0p0YmlzZTJmRU1jeHY4VkxZdkNSeHdtekNJd3JCRDBV?=
 =?utf-8?B?Q1crWmlWdFNFMVZJdTlKQy9zeVNvZzRYdWlGUHV0MG1ZZkhNVFpMajhveDkv?=
 =?utf-8?B?dHQ3Z3UvMXIvdzhoYUJSWWZZQ2Y3U0JaV1BHOGhtYmVKVDEvWDNIVSs3ZDlv?=
 =?utf-8?B?T1h6SncyMnFvM3ZZOHhjQTI5MFlBOStibFlwTFpGSkhFOXlaMGgxaHJtZk8y?=
 =?utf-8?B?cGZqS1VhZUNyQ3hxNGpOZUxLUnpQUFAwVFFjamJsVGMraGZpSk4wa3l0TEsv?=
 =?utf-8?B?Mm52eHlpdFN5bm5jNFVQbkJBZFMvTWNCU1NFclNTakJSN2dGN3h4T2NzYW50?=
 =?utf-8?B?TytyKy95S1hqNkZ2M3RHcnByWGFYbXJNMlNzVWpwRDgxbmE1ekpRRzkrc0tH?=
 =?utf-8?B?TXFickkxMXhMc1kwVnVheUg4SjZremNCclVRQXI2RjlGTHptK2Q0Z2FSU3ZI?=
 =?utf-8?B?NjRmckVnVTBCNFkvamNOQW9mSURLeWhQbVZpcVhzY1huK2ExLytPQWlvZTdR?=
 =?utf-8?B?U2J3bUViemluaHJaVDg2ME93S0ZyUStmYkQyc2RiUjdJM3U4allKOG9OUnZo?=
 =?utf-8?B?TmhUVU5UMTZVQm1BbUl0SjdEaWZ1NjdDS1U2eXEwbEZ5bndINE5OUlVEellO?=
 =?utf-8?B?MzlTKzE1bVhzK3d5TFlzTmNpbTEvb0pqTzlLZ0tCNzJObDFUMzdvckVlWkM2?=
 =?utf-8?B?ZnB2VG8zSWVjS0oyS0Z5TWQ3UFYzZ1U0eU1TQm9TRXhNbTRCTFgvRVpUK05X?=
 =?utf-8?B?T0ltQ2lCNzBraVJ6NFpBcncyMkhqNnJwMXBneHFTSXRHWStlSW54Mjh4Zm5I?=
 =?utf-8?B?WGRxVHNtNHRYSitHbVJub0YwaU5adDhvZVI2SmZ4SkVnMWFNbUlqclVjS0hM?=
 =?utf-8?B?ZWUxL3ZJQXJHU0YyaWJEci9DeUVpS2trRm9QaVB5Q3lNVTlvVUhiK3JtU2ht?=
 =?utf-8?B?Y1lHd1NZd2s2eGVudnJlWlg4MkRyYUFqU2syV0hxOG11ZWhwVThEa3pQelZR?=
 =?utf-8?B?bER5VFZoeFZrRVdDN09uclRPL1paMTh3NXI0Z09TVVhKTzhabWRqVUhpaFht?=
 =?utf-8?B?UkJDaGE0eExzY3kzNWdFUXBVRUJ3ZjFsMmc4RnMxcENRK1c0YnZhczUvc2Mv?=
 =?utf-8?B?Y000Y0RBZXBPVkkxREtwa1JlUXhRZ0xTNURQbDVWRFZhalU5S3BiVDA2UFor?=
 =?utf-8?B?dG0xVzN1N0dybUpmNDU4NDdMR3NFMFRkcHExRXJWN0ZhV2hrVHA1NS9MQm02?=
 =?utf-8?B?QVYxVUFET1JGRkEwM3BRaUdkbTZBODFlRXFNWUpzLzhUcHoxVHFQMnBOL0V6?=
 =?utf-8?B?Unp3SEhZVXhraG9HeTdGbFV3ZTNTKzhVTFkvc0psMStSSXViYWNiWmk3Slpx?=
 =?utf-8?B?NVdXWlUxMGlSOU9uaW1CMDNuaytRRENZMy9NSFU0emthWUFpbzhoRGRTay82?=
 =?utf-8?B?amVWWjI0dmFwWGV1UDB0L2ExM3oxYWNIZHRHbWZKa2hoVEpIUGNzSHFiUGow?=
 =?utf-8?B?MFBZTkl5UDFwdEEraXlJckIwaEp4T1dxRkExMUdjNDhKSnRoMmZqdDNpUHNK?=
 =?utf-8?B?NDRWelNBRTJ1L3k3Y0k0OGlxWEV1MWUxSkdlc2Nod21wcEUvMkJmV0hWdjY4?=
 =?utf-8?B?ZkZKcFdReFp6dW93NmJ5azV1UWVyMUYwUHdGOTNXTkJsd1hoVXZDTnpGSEJm?=
 =?utf-8?B?VHFQeEZwN0t4SlFoS0llRHJLelFUY09KTnBCbEoreHJhQXdkczNSM21VaEZ0?=
 =?utf-8?Q?MiaLvFGcerii1s6W4q5WdUz/5GRIcAjm5Ac/KZs?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cec55a77-a621-4bf3-8fe9-08d914d5caac
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 23:37:51.3170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/jZDIUll8I0QBETjgtHdFjKDxvEW51dCqPQrGrmWSbXqYohrzzBYfN02cA5zYqziDa1lL8CPNXmTa1yUzGQLdr4rMowPqy9zhQJ/RsonbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5203
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9981 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 phishscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105110163
X-Proofpoint-ORIG-GUID: KWfdH2ZqUXOLnCS__Dkg-fvavUPeYhp-
X-Proofpoint-GUID: KWfdH2ZqUXOLnCS__Dkg-fvavUPeYhp-
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9981 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 adultscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 clxscore=1011 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105110162


On 5/11/21 1:41 PM, Stefano Stabellini wrote:
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -164,6 +164,11 @@ int __ref xen_swiotlb_init(void)
>  	int rc = -ENOMEM;
>  	char *start;
>  
> +	if (io_tlb_default_mem != NULL) {
> +		printk(KERN_WARNING "Xen-SWIOTLB: swiotlb buffer already initialized\n");


pr_warn().


Reviewed-by: Boris Ostrovsky <boris.ostrvsky@oracle.com>



