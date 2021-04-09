Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA82735A871
	for <lists+xen-devel@lfdr.de>; Fri,  9 Apr 2021 23:43:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107977.206335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUyuO-0000s1-UN; Fri, 09 Apr 2021 21:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107977.206335; Fri, 09 Apr 2021 21:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUyuO-0000rc-Qj; Fri, 09 Apr 2021 21:43:20 +0000
Received: by outflank-mailman (input) for mailman id 107977;
 Fri, 09 Apr 2021 21:43:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vRME=JG=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lUyuM-0000rX-EB
 for xen-devel@lists.xenproject.org; Fri, 09 Apr 2021 21:43:18 +0000
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e18bbfa1-f682-4200-8abb-947e1aeab59e;
 Fri, 09 Apr 2021 21:43:17 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 139LVFhj138143;
 Fri, 9 Apr 2021 21:43:16 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 37rvasat2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Apr 2021 21:43:16 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 139LVEOt192371;
 Fri, 9 Apr 2021 21:43:15 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by userp3020.oracle.com with ESMTP id 37rvb31wtc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Apr 2021 21:43:15 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by SJ0PR10MB4752.namprd10.prod.outlook.com (2603:10b6:a03:2d7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Fri, 9 Apr
 2021 21:43:13 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3999.035; Fri, 9 Apr 2021
 21:43:13 +0000
Received: from [10.74.96.191] (138.3.201.63) by
 SJ0PR13CA0035.namprd13.prod.outlook.com (2603:10b6:a03:2c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.6 via Frontend
 Transport; Fri, 9 Apr 2021 21:43:12 +0000
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
X-Inumbo-ID: e18bbfa1-f682-4200-8abb-947e1aeab59e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=fAT3JuzA/AGYbhQRQxDvrS7UJL7GIl9dCzvUvrlu6WA=;
 b=RCpCsnDTbwn83WNzsAuSccmh0Ijehtw9AnHxmGVDdWtI7pnOiHBhCabjLbJ1cMS01A4o
 FIuVW3h/+SKsa3Y+Outykq/KXESKYVizlbWeeeV6ME/8KAa+KM6d2Q2L6WuovlghemFL
 wGngSPxGRrNk3CTvjtMZ8t9idp8wtwB1l8raABrZU0vKQ1W/cUBcZhJhpiTOHirEBD7n
 XMTkgHkwdn7sDZ/8YCYI8BgeblGnRaCyVyHwo2Nz6YVhHtxVTns6P+myvdHXwtKYgr0D
 TczEuVTLTBPgLrN1JlmdAZjIQpXtjR3MU8XwNTgk5d113MFthD4Ml1GOC0xba6HcKgCu gw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JIdNtysWt0DKwI3FoS7daUt0OrxjtMzpyHhSQ9Fg6XG30qZCwAjQV2GJJao+VV9+DiiZIrLD9eTupSjw7X0xMlq7PfgcJBoHim3CguaqNH5R1X7I3/Eiv392eO+k/Hh3CYN8BtIUut0oesoZyqPq1t6zjMfVzQKxVdLCEfleaItAHcTumoDGrGLL8TMAP8uor/CZIjQshXgBThnh8DOxgLhsZiAwBgsSsjWwXZqWdlZDTgGLDXe2efMeOw47oXDoGPlO6w66e7Fzza1AGlhpj9v+gTQLluHJ5/nT9AzD9BjJbyiA2FJScWoHmsxWkUm/myogVCAXjf713CothLIAMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAT3JuzA/AGYbhQRQxDvrS7UJL7GIl9dCzvUvrlu6WA=;
 b=Tec0vSwj32qj5axaUZsRIBX3u8BtzSULS1kXHXR9j5r29UjcQ1nTXTzbbo0phfYcKoNIhIdQmZqggBnlUbNz4gyF4tRxpNUffrzTnhTNyt6AvvD4N+t5yP2T57SSfhA6barhy+3ronYOd4yXO7TIOhBqAR+wVvp3fkt3srYoZrgbCjR35c1/oikQihD9V4IDez2guxUHVGdKoZCparX1qykwoI9bMRcVuwVFdkGTBHcxP6OBz7Lt7ddon34Ri5wC8LMnl+AVRAnK6OB6HNzaS+N97S435HN3UhsDqbHxBBjcW2Smq1RtnA4PupMboldYtHeUTkxmin/NuKDR/PKVig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAT3JuzA/AGYbhQRQxDvrS7UJL7GIl9dCzvUvrlu6WA=;
 b=x5VQWlnjCtav+zicFIV4zVf25b4qezgmLrvEc/zCxOXMPcBWIPtA7d6hjqEGZoZJGHvvzI0SGuHqOiH2yu9KsquoJ/Sb7BYye8tZoYpYT6rFqV5UhreLNPw+DenE11gyi+gkcapELoIAfKSyvZgJdUswUb3wSaWCP05EJ1/KtbI=
Subject: Re: [PATCH 2/3] xen-pciback: reconfigure also from backend watch
 handler
To: Jan Beulich <jbeulich@suse.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Konrad Wilk <konrad.wilk@oracle.com>
References: <d2ac85d9-0ad1-71a3-fa3b-b99340b3204d@suse.com>
 <74955b48-80b1-3436-06b4-d8569260aa65@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <a93c66e5-807b-e557-d437-48d7f46f25f7@oracle.com>
Date: Fri, 9 Apr 2021 17:43:09 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
In-Reply-To: <74955b48-80b1-3436-06b4-d8569260aa65@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.201.63]
X-ClientProxiedBy: SJ0PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::10) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8869df79-f58a-438e-0591-08d8fba07a23
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4752:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SJ0PR10MB47525C97FF185BF6AF06166F8A739@SJ0PR10MB4752.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pWnFYC0TVfa3BxeW6/aLWhNhm0JcyHtkJVv4eRNBgi8dzeouvTQG/XJk8IyQ3/WcoG5VeSE42MGkzAhrhq8GOwCD18THRqkKObAnd/eeLJTOzhuJcvAgnpMlC9QYbWmhgURk0rQuFFs9JRze1YGl3QJg4nznwkRUUvY5xKfeRvovd1dMkDjFKOXO4a3b8kpZYxLMydRBWcFPby4v9CpThmApKXXRAfeAMWtNn+mD3yTxei9UkxRLJGXfoxMsSWTjdz72PNBNO1CjsNsBtiqaf5S/c+8PqiymOlH2RrDfUL4rjjeHyLGRdjoDHcwkQFs57TK4Kh2N95T+j0TELBgYmduoayxp+ch6DFD53z9Ktc6XP3C7ns1mjAWZTPDfGcsy2Fk5PSzCOLaVCWiyv7ALAyt9ivckeLrG/yjVJMOHtCVlnHbwoODxF8VF+LQhViDSbUb+EYhH20MgMlG/hsUlDsGAi6aVK2PP8uNZkadgwpK8wt/XRFLfF+dtyF9Z+r9YfKJbQEuiCKp21r1+rKmFhuWS0Rs47kXVtdX22rZLOFlrzigmRfh69XHxbWMVxMFjAXvlSnYvcnzWwfGZ1XKcXZOXIdoBgslOqzRSmZfy7KakRmn4z9IsoWNoPYYf6BbO67ZSCPzkE94WPzz1XL4KOKf4z6f+SxNWrwPIhJeoqev5yMwqLBvvXco1QqNZVGovUI3oEBIqK0mL2ojaVItV7u+3eSt/UhR4EzRRYKvVN9E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(39860400002)(376002)(396003)(6486002)(478600001)(83380400001)(2906002)(31686004)(316002)(54906003)(86362001)(2616005)(110136005)(956004)(31696002)(26005)(16526019)(4326008)(38100700001)(44832011)(5660300002)(36756003)(53546011)(107886003)(66476007)(66556008)(6666004)(8676002)(186003)(16576012)(8936002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Q0NNclZnYm0rS2hjZzJ5UzFmMWw2M1VOL3VuZlFRVmpSaUhKMXcyVzBmUXp1?=
 =?utf-8?B?QW9iNlE4aWw1REhDSzRsREFMQXM3cVJPaDNDU2Zqak5kRnNOYnpQaGc5SkZB?=
 =?utf-8?B?R21mYm8yeWJmUEYrY2ZNV1k5aS9LeVlLRjlPNzlOeFFmNWFhMmRBY1AxSzhp?=
 =?utf-8?B?QUVXVzdSaHRoZmNKNGUvRFZQYnV1b050VlZ2K3FYMWpRY1gvOWFoMVFvYVRq?=
 =?utf-8?B?aWwwZEVicXl3QnpsU0tvMXRJNXE0S1grVjRBWkdoWEt5bkQrbGdMNkRzVjky?=
 =?utf-8?B?bjdyYWZGeTZiT1BQN1VqQ000Y0pPcmkrNHErdkFpNUhidm5SN3JBUXR5VGZX?=
 =?utf-8?B?dWg5RGRuZWtjSkNiOGxHaWhxblMzb1BMejZFWTVsM2diK25PVXhHQVlKUTFz?=
 =?utf-8?B?eU1JUHR5UmdaRFc5UU9PZ0U4Z1lnZ3RMQUF5RHB2T3I2ME5KSXY1Y0h1VS9t?=
 =?utf-8?B?bDFqVmlnQTc3Ky9OYzdYbUk5TFQ5QkRjSHh6N3ZmWmoyOVJLTzNaNkdtWnJI?=
 =?utf-8?B?Z1hzWEtpd3dVT3JyUHVJazFXaFVrNk1OcUN2c21lczJieXFmUW5oeEhQVXRt?=
 =?utf-8?B?c2xudngwYXJreTZEQXZrMm9abWNEVDRXVENUN0lLa1lrRHIvaGxHVkFqSGhU?=
 =?utf-8?B?azZzQ1lXQU95eUNuOENiMmtxY2l5THljQnJYWGhpNXdsSVBFcmwyVXBpT1BK?=
 =?utf-8?B?bDBHK0dWd2FRRWtVNHc0Y01oMVpocCtUYTlmRWJpbVdhd3h3NEhDb1ZtQWYy?=
 =?utf-8?B?RHpnRGVoNmpCTnFyZ3VnRWtsTzdZcTFlRWIzdkRybDFkWkF0Z1NHSjdSQ3pJ?=
 =?utf-8?B?L1BSUUUwSmhiamtLVERDNzZrVWlBUlBodU5qTmpmclBDOXBmZGRuZWl0Tm4y?=
 =?utf-8?B?Z0VSMktPTThjMGhsMUVPYmdRMmhRUlRSdmduZXRuc0lYdy9vTncvWi9KQVFm?=
 =?utf-8?B?ZERSZjVhbkoza25YaG9nVm0zaEtzTjRaQ3B1SE5qSENpZEdTOE9EWkZWMEd0?=
 =?utf-8?B?R3M5T2tMbGN4RnFWTjlvYmFlb25tRDNnRmpWdEJzMU1LN1BNNmJjU0RBajBH?=
 =?utf-8?B?Z3dPdGR6RlFRZDhud1ZkZWVKVlM3dE0rdzJ1UlQzaUJvMUhURHI3UnhYRDIz?=
 =?utf-8?B?RUdpTUN1eXR0WWp0b1IzVVd1bXNnSWkwSW45SHlFVFdoQi9Hc0FNSS9UMlZi?=
 =?utf-8?B?YXBqUk9pNkoxSlZUcThoK1pvTnJRZmtRZzA4bnNJRkFXdmN4VGt0R3JsWFJv?=
 =?utf-8?B?UTNBbk9rWDNIK2p5elgwczlEYVc5VGxjbnFkRS8xaTZRWk54dllnNFJUNVVt?=
 =?utf-8?B?WThsbzVMSFpZMjNUNStZQmQzdElvRnVlZ0I3Ull2MXh0RmptZkdGVW1hcmVN?=
 =?utf-8?B?bTgrbWU1Z1BUZEJBNnZ1akRNWm1GdnZJOUxPSUNnbVJNbG91N2pVd0U2RGEr?=
 =?utf-8?B?Mkkwd1kyNWdTSFBZczJ6NHBmL01zYW03dWhsaVVJbW9ITkRCK3JTQkJjZ1ZI?=
 =?utf-8?B?OHJ0S1puanBobTZRb25OVWI3MUlUZnBZTXpaYzdsRGxRSWlEL3d1R25OUm4r?=
 =?utf-8?B?d21hYThEUHYxM2V6MmhoS2JTMDNkbjRhOHFNOWdFZFBuRVpWZ0pOeit2b0lu?=
 =?utf-8?B?dkhsemYzSlBoQzY1ZDVCVUJxQUVVSXRKV1N4VVRUSlZOcS8yM0hVbkZOb295?=
 =?utf-8?B?SmgvWkRZT1RIMytqYSsxSFZIVER4ZTRsRUZNd0M5bXVsVnRBQXZRZzArUGpL?=
 =?utf-8?Q?aIKIOEuhRbe5y0+PIrYqYsazGc2+yKrty9Glt9a?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8869df79-f58a-438e-0591-08d8fba07a23
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 21:43:13.8178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bLwh3M33lvPKboVQW9v91JqhzCO8fqNslDGPXhqA9KPXhEV9oTSBgGLpH/oR2qp2aAAzQKO6/FK0AMKHGEkWIyeBoHX236O3LuJaiI/mGLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4752
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9949 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104090157
X-Proofpoint-GUID: 6NMF0jPwqHBjhOmi9rZaoBju5Vb8BoJa
X-Proofpoint-ORIG-GUID: 6NMF0jPwqHBjhOmi9rZaoBju5Vb8BoJa
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9949 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 clxscore=1015
 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090157


On 4/7/21 10:37 AM, Jan Beulich wrote:
> When multiple PCI devices get assigned to a guest right at boot, libxl
> incrementally populates the backend tree. The writes for the first of
> the devices trigger the backend watch. In turn xen_pcibk_setup_backend()
> will set the XenBus state to Initialised, at which point no further
> reconfigures would happen unless a device got hotplugged. Arrange for
> reconfigure to also get triggered from the backend watch handler.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Cc: stable@vger.kernel.org
> ---
> I will admit that this isn't entirely race-free (with the guest actually
> attaching in parallel), but from the looks of it such a race ought to be
> benign (not the least thanks to the mutex). Ideally the tool stack
> wouldn't write num_devs until all devices had their information
> populated. I tried doing so in libxl, but xen_pcibk_setup_backend()
> calling xenbus_dev_fatal() when not being able to read that node
> prohibits such an approach (or else libxl and driver changes would need
> to go into use in lock-step).
>
> I wonder why what is being watched isn't just the num_devs node. Right
> now the watch triggers quite frequently without anything relevant
> actually having changed (I suppose in at least some cases in response
> to writes by the backend itself).
>
> --- a/drivers/xen/xen-pciback/xenbus.c
> +++ b/drivers/xen/xen-pciback/xenbus.c
> @@ -359,7 +359,8 @@ out:
>  	return err;
>  }
>  
> -static int xen_pcibk_reconfigure(struct xen_pcibk_device *pdev)
> +static int xen_pcibk_reconfigure(struct xen_pcibk_device *pdev,
> +				 enum xenbus_state state)
>  {
>  	int err = 0;
>  	int num_devs;
> @@ -374,8 +375,7 @@ static int xen_pcibk_reconfigure(struct
>  
>  	mutex_lock(&pdev->dev_lock);
>  	/* Make sure we only reconfigure once */


Is this comment still valid or should it be moved ...


> -	if (xenbus_read_driver_state(pdev->xdev->nodename) !=
> -	    XenbusStateReconfiguring)
> +	if (xenbus_read_driver_state(pdev->xdev->nodename) != state)
>  		goto out;
>  
>  	err = xenbus_scanf(XBT_NIL, pdev->xdev->nodename, "num_devs", "%d",
> @@ -500,6 +500,9 @@ static int xen_pcibk_reconfigure(struct
>  		}
>  	}
>  
> +	if (state != XenbusStateReconfiguring)
> +		goto out;
> +


... here?


>  	err = xenbus_switch_state(pdev->xdev, XenbusStateReconfigured);
>  	if (err) {
>  		xenbus_dev_fatal(pdev->xdev, err,
> @@ -525,7 +528,7 @@ static void xen_pcibk_frontend_changed(s
>  		break;
>  
>  	case XenbusStateReconfiguring:
> -		xen_pcibk_reconfigure(pdev);
> +		xen_pcibk_reconfigure(pdev, XenbusStateReconfiguring);
>  		break;
>  
>  	case XenbusStateConnected:
> @@ -664,6 +667,10 @@ static void xen_pcibk_be_watch(struct xe
>  		xen_pcibk_setup_backend(pdev);
>  		break;
>  
> +	case XenbusStateInitialised:
> +		xen_pcibk_reconfigure(pdev, XenbusStateInitialised);


Could you add a comment here that this is needed when multiple devices are added?


It also looks a bit odd that adding a device is now viewed as a reconfiguration. It seems to me that xen_pcibk_setup_backend() and xen_pcibk_reconfigure() really should be merged --- initialization code for both looks pretty much the same.


-boris


