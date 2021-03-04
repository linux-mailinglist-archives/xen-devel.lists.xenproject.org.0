Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D523432DD9E
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 00:10:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93412.176374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHx6k-0001ws-Uy; Thu, 04 Mar 2021 23:10:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93412.176374; Thu, 04 Mar 2021 23:10:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHx6k-0001wT-Rd; Thu, 04 Mar 2021 23:10:14 +0000
Received: by outflank-mailman (input) for mailman id 93412;
 Thu, 04 Mar 2021 23:10:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w4s1=IC=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lHx6j-0001wO-Ex
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 23:10:13 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf5bb71f-6dcb-41cf-80b6-ea5da4d1f702;
 Thu, 04 Mar 2021 23:10:12 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 124N9PvK015877;
 Thu, 4 Mar 2021 23:10:09 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 36ybkbgvh1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 Mar 2021 23:10:09 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 124MpATc108501;
 Thu, 4 Mar 2021 23:10:08 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by aserp3020.oracle.com with ESMTP id 3700038s3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 Mar 2021 23:10:08 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BYAPR10MB3528.namprd10.prod.outlook.com (2603:10b6:a03:124::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.39; Thu, 4 Mar
 2021 23:10:06 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3912.022; Thu, 4 Mar 2021
 23:10:06 +0000
Received: from [10.74.111.75] (138.3.200.11) by
 SN4PR0501CA0073.namprd05.prod.outlook.com (2603:10b6:803:22::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.13 via Frontend
 Transport; Thu, 4 Mar 2021 23:10:03 +0000
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
X-Inumbo-ID: bf5bb71f-6dcb-41cf-80b6-ea5da4d1f702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=QaOVRjFYaGpbRWFnsRMzYv4gz95CwMM4bXbjeMzAa+I=;
 b=tp/X5mQPx0mStgkhZn+zf7Nox3tfTnew8CYFIjuBusMHlPQPPMntCGAXY8tWC0ad+k92
 Z+IgAsvgIM0qTZbW8MZpTNrTfQl0c/6kIomwk5E8v6cGzHdHwDEt3UmRolAU7AokKYNB
 7Ce0nQpYR1eGdpZC4jXptT2Il57191eNa4jBQr6Nrm4Ved7jbrj2+wmGVyrgLalW2ubm
 gKV8kpYlDiDCIuFzDHN0gSbk4sartKCC1Shu1F+7wDTexPxNctmsyl+rIuihNdfTnQci
 PO9ORu8yN5+HwJo2YJ3XDXb4ZpjLt8ANwTxT7rTrWzFZf3ViBC0rkz4ZtVZB9XC2CvZs ng== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZYjvyjhOPiNgZuN5ZXn4WX6tqBkyZJ9OFhCL+TNDvXVMyk4UUV2NxlpWNYJ0szQgfkLtxTulTfl4JOK6g8L8iE/020+7GZEWtXR5A5tBlpHUP9kDocAq2IGs2yQHMRHcx69CeqwBNeRONtk+GuZ6W57em7H/jbJUVVEew/31BQYmWyV7ESwzsrv0exVbwQ5Q64v65SWh4jIzr9n0iIBWa2PO5Bgrcd/hQlXf4T7YAwDlogdIEzutZsGa12YWcfjo2bCf3NuMzuv3rhFVTw3Qtc5Zw4eqtMT/xcU1Ly2Q5y2T66FU0vLcQ9MMF6CUTlapb5T1ulaqCYae0BK4o7EBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaOVRjFYaGpbRWFnsRMzYv4gz95CwMM4bXbjeMzAa+I=;
 b=eOgK2l/tL2no2FnGYEsB9GAfk/sB755urORafWpgh3Hc7IucEyF2OxLGKM+jtSReTKBrr7hWVJr27oFo5iYyMZQJMPwFhCU7mgW2fQi86m0QFsTlpPsBOGOWZXkqNj2OBAVH4Vq5h+cj5dCo9DExMmcSFVP+ae7Xr8G8NiikZiNAeSI10GOAgkqxGMiYgt/l+iiFNjYo+12c/S5n8nIPtFvINeRNOhNiL4c+GILVy54DmfJJtWgT74dMJh7RMy/o1OYK5uWRg8J1xmSdNcxC2Vf/eqRF7Lo/9Y9xTt6mdzkZUBBJ2W9OVM1sVZCJa5qG4twTP8vv91r5RJ83oyUMMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaOVRjFYaGpbRWFnsRMzYv4gz95CwMM4bXbjeMzAa+I=;
 b=KHHYDE8kAT4sgeIkvNo1BTqDGibmxiSPBPwV6No0sH+mNWc0d8Yw6U8G8a821A7ZnI5Ck17kK6cbdjWXkHV6PrNkJNqgAigaJKddZr7z/t7yav3ksLFebI98AiU0vh7siZryxOeWdOiDMm1BxRvLM2uGRCIhVbm3kdNWuxfFqbk=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH v2 for-4.15] x86/msr: introduce an option for HVM relaxed
 rdmsr behavior
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
        Anthony PERARD <anthony.perard@citrix.com>,
        Jan Beulich <jbeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Jun Nakajima <jun.nakajima@intel.com>,
        Kevin Tian <kevin.tian@intel.com>
References: <20210304144755.35891-1-roger.pau@citrix.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <9fa2be52-9d1a-e841-5bb4-3180b4b5b033@oracle.com>
Date: Thu, 4 Mar 2021 18:09:58 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
In-Reply-To: <20210304144755.35891-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [138.3.200.11]
X-ClientProxiedBy: SN4PR0501CA0073.namprd05.prod.outlook.com
 (2603:10b6:803:22::11) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddc55f97-2baf-4867-bfce-08d8df62a687
X-MS-TrafficTypeDiagnostic: BYAPR10MB3528:
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB3528F8B606FF9CEF0665FCBE8A979@BYAPR10MB3528.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GIqT9Q7VDnjp0yti9w49Um1nDTOuA+Jm5ClyVInoNZq5GhYZA3f/4ql/6yqzWZy6jXnQ3e2Jebiz+E4cKVs9v0OgRahgtwT2/CBSlrWvkfDbVtR3XoA0nRKiuPesoLMqkX8sP254ygX1eHm0C6Gq4xd36Tjoo2LvpZnBHvOBV40d7lOV2MSKrsiOfxGNTvVaz1W4BD6ARHe0oOr4ztTeGFXFVkpm3Ns8hv6u8itJDCKdO1/PHGFUbPAu3AaNetCTZc6UQ1pSf1H+TMGN9x3iu2eG94MiosUww0mjF3vGGmrLQmg+/XxjL4kscBYsF93toE6EJQINf3tN5AhbdfKEmmi1cloemNUy96LP3vMgiW8GcNeGxBjP+DpM1d/5yb9Vz14BPskI85nUdC5rUgzwKSEP+nrwyd7VD3VYRyuRsstHEcWvxnF0ESezvItD3EO7jT96uj9PghD2wgMc9S8sTbkXOYXem/5bHqOgA/33W/BR0kJ/1B+b2ZquFagVDb6WgMnXnK+HfwHAO5G3FYlLIy+Iur7a1ABZELriDl2F9q18LkpUmTn+r+s9FtRCX1Qy2G2RSywKDjrY8UnDXJ6DeV5EAoyqHw9m5Qj2VX8D168=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(136003)(346002)(39860400002)(376002)(53546011)(26005)(66946007)(86362001)(54906003)(44832011)(478600001)(956004)(2616005)(8936002)(66556008)(5660300002)(83380400001)(31686004)(8676002)(186003)(316002)(16526019)(36756003)(2906002)(6666004)(4326008)(66476007)(31696002)(16576012)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?eDRiTGYrQzBjRE9mQWV6cVBqcW4yTzdERkhCbndjSnZrS2UrQzF6eFJVL0Zm?=
 =?utf-8?B?VkRjRDhzNyt1K1FwaFl5TGZuVmlpemRVYmtQRW9CdWhyK2g2Qk5sM0xWdDd4?=
 =?utf-8?B?M1k2U0grRVBQbTVnRlFJcUNRZi9nRU5xNWFJZEZXTzI4SkhCYTFJeGdrVFB2?=
 =?utf-8?B?clFkSmt0NVh0dERVRVYvWWlHa3Nlb3F6Z2lQODRBcmFZcVJDaWVTTkViVWUy?=
 =?utf-8?B?dXk2N0Fmekp6aW5ycys1akorejN5clVxcGdEZnJLQjVSdlJqVi84WGZtZXFU?=
 =?utf-8?B?Mlk2Mm93NW91cXB6UDNtditQSDVXbUUxZ0puWVJiSk9DeTZlODNiWWhLVXNN?=
 =?utf-8?B?M1JFaEJ1K2ozRmM4aGdWVU5WelpabW1uU0dyK0huanZERU9vbVVrSnRUU1pv?=
 =?utf-8?B?Z3VRSlJ4TFVCNDF1M0U4YjhPN0c1SVRMNTdKZHQ0YUFBMlVLbmY1OUdNa0t0?=
 =?utf-8?B?ejlMS1ZFWmxiS3BoRit2L3Z3WU5PT20yNHdZbVF2Mm83U2trTGdVMk9tVDJm?=
 =?utf-8?B?U2ZsMG9WNXU0VzVuT2hCYWR2Z0FwYXJCbG9KN1hDaDBzOEZBazMzSXIxTHBz?=
 =?utf-8?B?T0l3a1YyL0cvd0RlSWFXcFlMZ1VNaUZaZncwVUI4bVBuZGc0bzNoZzdqZWRh?=
 =?utf-8?B?Y3UrdjlUYXF3WTlmMDZjdmQ1bUJubXc4ZXZuRWJpbjFibmhqY2ttU3VvUTVk?=
 =?utf-8?B?NjZGTlU2QVlOUkV6SlZWYVpOTnlPZmQ0dW9uZ1YwLzBzcmoweWtEVEZ0YjBr?=
 =?utf-8?B?WXNGMDJjS3h0b2lySUNHL01RVUk4VEw1eFA3c3JJVUkvMUR3bml1QWhFN0VW?=
 =?utf-8?B?b0N0ci9GZDd1Wk9BeDRhaG1lYXhKMnRzT29KUFl3eDJMdFZSQjNURkd2Vzk1?=
 =?utf-8?B?MWFlTUpTNVFwVDFGclBMRXE0aS9KaG51Zkp3R3VBQ1JUeHp3T2ZydGR3bTZi?=
 =?utf-8?B?Smg3NFltOG1QSHVlRGNNdm51bEtNdXd0YkRvN2dHdzMzcG54bldEWXhBakJB?=
 =?utf-8?B?Z20rT2hrY1hWZFRIUCtaajlPTzcyRHBlRmxxTkVSRGR3eWlpYzJBM0x6VFE5?=
 =?utf-8?B?QzlQUjlnTXFyZE9OMlR3ejlTSFVhOWdkdVlRVFN1cWJ1YmRQMG9iZFdydXVw?=
 =?utf-8?B?UmxZN3czRHk1WFpyS2dFSVhxTzFJcjM0Y0pCdE8renV2UzBmNktYV2ZyN2l4?=
 =?utf-8?B?ckFtNmxmNk1vN2NnY1RSUlBLd1pJNUU2Ym1lRGNjYVhYWUpaQmhLclM2YkQ5?=
 =?utf-8?B?SzYzanlqWEk2NXR2TWwzYk0vL0lqTFcyOTNmOFEzUjhNZXFXaVlkc3pCeUN1?=
 =?utf-8?B?ejBHUVJ6bVExMnEvczNabWxkMnpvaWlwck94TW54dFVad2JnQVFoZWNUWUhz?=
 =?utf-8?B?eHE3akYzb0hndUwxYjNCd0g1QlBvTjFuMVNleUhPc1FJU0ZTS25FUkVmSVJ5?=
 =?utf-8?B?b0FHVWdDOVNaM0t3K0hjVDZFTDUycmhodVV3M0UrVUF0UGowUEJXNkxsUzZ0?=
 =?utf-8?B?bVFOclljRThOTWZpYytGNWVhWGk2UXdxR3FyQWFnMktIbkFUZ0JONTZMNXBu?=
 =?utf-8?B?VXVPeGZQcE9wZ2JJcERVenlYZ1RHWktPNTViTW1BaXVockgvaWpMNFFYYld3?=
 =?utf-8?B?UnpjQnI1MmgrRDR3RHFvUlBLc282OVlrR2ZwOWRvSkdXWTBmWnRma2RFUm1K?=
 =?utf-8?B?ZFc5RmN1bUw2QUxuTXlwZ2ZmQkp0TzI4b05nRHpaZHBHYUMvNHhHUDZDL0xv?=
 =?utf-8?Q?/6/pAxMTaQKSSCCNQ+jS6/d/JyPwKfkn4OpDUwq?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc55f97-2baf-4867-bfce-08d8df62a687
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 23:10:06.7787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hnFFpSQShvpEMAwKvo9F+RFBeoQBmMhLo5FRiaw6lg7FZC3WxoEDv0ViTKK0FMx+RjpAk+mNeFEPFcONkyK7w4CpF5CIRDQJ+LAJAaGvtBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3528
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9913 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103040113
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9913 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 impostorscore=0
 suspectscore=0 phishscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=999 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103040114


On 3/4/21 9:47 AM, Roger Pau Monne wrote:
> Introduce an option to allow selecting a less strict behaviour for
> rdmsr accesses targeting a MSR not explicitly handled by Xen. Since
> commit 84e848fd7a162f669 accesses to MSRs not explicitly handled by
> Xen result in the injection of a #GP to the guest. This is a behavior
> change since previously a #GP was only injected if accessing the MSR
> on the real hardware will also trigger a #GP.
>
> This commit attempts to offer a fallback option similar to the
> previous behavior. Note however that the value of the underlying MSR
> is never leaked to the guest, as the newly introduced option only
> changes whether a #GP is injected or not.
>
> Long term the plan is to properly handle all the MSRs, so the option
> introduced here should be considered a temporary resort for OSes that
> don't work properly with the new MSR policy. Any OS that requires this
> option to be enabled should be reported to
> xen-devel@lists.xenproject.org.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Only apply the option to HVM guests.
>  - Only apply the special handling to MSR reads.
>  - Sanitize the newly introduced flags field.
>  - Print a warning message when the option is used.
> ---
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> ---
> Boris, could you please test with Solaris to see if this fixes the
> issue?


Yes, still works. (It worked especially well after I noticed new option name ;-))


-boris



