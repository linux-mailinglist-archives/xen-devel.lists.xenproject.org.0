Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 798D031FB7A
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 15:57:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86910.163485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD7Du-0005Mv-Kr; Fri, 19 Feb 2021 14:57:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86910.163485; Fri, 19 Feb 2021 14:57:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD7Du-0005MV-Gl; Fri, 19 Feb 2021 14:57:38 +0000
Received: by outflank-mailman (input) for mailman id 86910;
 Fri, 19 Feb 2021 14:57:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rPBP=HV=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lD7Ds-0005MJ-Fz
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 14:57:36 +0000
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4304c511-87e4-4737-a6b1-2e42ccef9ead;
 Fri, 19 Feb 2021 14:57:35 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11JEt72b050821;
 Fri, 19 Feb 2021 14:57:31 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 36p7dnsp06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Feb 2021 14:57:31 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11JEuF56176290;
 Fri, 19 Feb 2021 14:57:31 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by userp3030.oracle.com with ESMTP id 36prq1ypxy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Feb 2021 14:57:31 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BYAPR10MB3654.namprd10.prod.outlook.com (2603:10b6:a03:123::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Fri, 19 Feb
 2021 14:57:28 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3868.029; Fri, 19 Feb 2021
 14:57:28 +0000
Received: from [10.74.102.113] (138.3.200.49) by
 BYAPR06CA0037.namprd06.prod.outlook.com (2603:10b6:a03:14b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Fri, 19 Feb 2021 14:57:26 +0000
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
X-Inumbo-ID: 4304c511-87e4-4737-a6b1-2e42ccef9ead
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=cdkCO4q8WDY5V2H9ToXTzu8WfAE5LQu8USvb4eEJaFo=;
 b=kkial8LvkvIfrrDAcETElmu2k2XipGLT+ukdJ3lJkORJNDMfTR5ioo6CEJBR9O6Db7qO
 crukLskcMYG4qTSejXCTSZsBOc7b5BH5Zn8Yq768j8ZcFrx7QhM69dZbTYVNNdo0jNsc
 69X795kmQbLG+rs7shgNtXb9xpcvD00ZdWLbYw+weIqsHpVJbXelSmqcdKN+xv1sTmeu
 1QRzcN6Rh96jh81yoxpW+jJF7y6K/wo2P+fBVUJzUctbAo8TCBycnDB54v1RvZRi0lFv
 Ws1TP4FTh2PzKv4lwEyeZdhK2CexJSbmq1CXvPEC5ZuWtjIPhJR7iqj/PL8eNQsRU2B2 iQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fI4FWdURaF9Xwi9s/sVAtlSb42wqBnogNxAfDNmUbtHGarHGN4tNrK7uYu58HejjAyF46oh5oJ+ts8Jf7EEo/m0uYX7mn6gY9Cx1z/jOtfA/CfnPE9otpFzL8pfw9DhhDqMJQztPIdkRDg0uaWwnxDB+/dBHAQNatolH9inV/M4eZWkJp0ICHjQtl/frDnXJdrqNjaVa7badyUrzD2jaPsmPPXDZodEUp6DiKGOKwi9HcC1ek9c0GSZBHPKee8g89uAD3P8b6YLZZeTrzbOQuRYJoZ24DPrW0QUe0QT4WR0W638cbtN6Hi7/ELH30f7/oLKPD7F7qsGPh+J6FDu7XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdkCO4q8WDY5V2H9ToXTzu8WfAE5LQu8USvb4eEJaFo=;
 b=lxWnZpFL0rBEoU1clsYcRZ5Uhjs62OiCqoudVm2NKSCBWiP9WS4pffawHDMnSCuFQuzUBWvDGDYUHsI12qh/gfO2TXcxYyP1K82+DOCjn1GtKrJIH/Gkr50wEV4AbBUa+QP8rQXWUJeGKy1MbKRvm30Dx6vGOVwaFCi1ylVSMLFhWQOqsCY5EylBOIDcWpclKlH5Hi4XEPKQBU3gWbL5Ec5iHCSRTDLEMKWIMdZpfkEP5ao4PT1dR4AFHC3jZP+dEFdcZK06CwYU/57/fuUpwmZMJTFMp5zHcaBbNq6M2vlFc/vuYEQHJDzjyf0ApK5bqyreIEXz5IZUjrWcP4wRXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdkCO4q8WDY5V2H9ToXTzu8WfAE5LQu8USvb4eEJaFo=;
 b=fNIJRJYXH14LpIq2vjPMUowi00jWT2B4nDXndsXm75RqE1UEXxxoxnRBvmO5xaLilfFjo5ELV5Dy23hGTlXkV/x9waIp0geYhLjIlUeJZRgIw+ChCHw8g4XPkO9BKfCC2ItzK8e06o5ppC+KuLhkW/Qlg7WG4xISFeeTfSBWn80=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH v2 4/4] tools/libs: Apply MSR policy to a guest
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, iwj@xenproject.org, wl@xen.org,
        anthony.perard@citrix.com, jbeulich@suse.com,
        andrew.cooper3@citrix.com, jun.nakajima@intel.com,
        kevin.tian@intel.com
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-5-git-send-email-boris.ostrovsky@oracle.com>
 <YC5UEzGwoqmLvh0n@Air-de-Roger>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <8138cad1-248d-c5d5-4fe6-9c30016cfeae@oracle.com>
Date: Fri, 19 Feb 2021 09:57:24 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
In-Reply-To: <YC5UEzGwoqmLvh0n@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [138.3.200.49]
X-ClientProxiedBy: BYAPR06CA0037.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::14) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7da2df8b-0129-4ed3-fc1c-08d8d4e6ac4b
X-MS-TrafficTypeDiagnostic: BYAPR10MB3654:
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB36541522D9D1279DD94FE3F08A849@BYAPR10MB3654.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FTEdCJp0LlObAvudFCNYGOedBDhO5qzPNxogAjGz7vabzvuivGRN2xGql39rcd27wQ2C9+9IQKcYaE46cOJY23njBC5qZWXEfWIKHhT/fvTj1uyVoHQqjbkR/1ajWdjwD1CKcnXAzbjhi0pNmFNeDY7u0BTn2N7u+V/eCTaRkZOo1BysCnjgozp2M68kN6oMOvBOLcSjPvwnYota9HTH5uMikfwtw3RCU+a4hBx6lX+ZcFz8DCSiNaw+ffnZsnYdbGFWkXSQiR55IcnFEFc0GWWMqMeQ1g9qUbYoUZNc/k2ulpWodi025hxpvFgePEfaElwU1vFbSbW4rcMXUX18fKxHTo14axCKk9cm/0BCtq04trlaar+04P46WXRsoqxBSkggRCnYcYRSj7cwr11Hy0sTHfB01sndLTMcXZqwqmWmS2ZJhbCfmTIWonr9a8iHGHLjQKcLhB7QlGC4l3fDHsjT+6vkResFKbwbgK84qMJGZycO+x/AkDsWndItNXg1LkIvFVNaz9tGY1pGZ7FuhDBIcyCezWkE+AKdNcjmONm71gPH1fFWNJihmXwr4+dX0LNoIxFg3PiJUjlJo2r/crSf/W2eM+M7YetO/APXpUg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(136003)(376002)(39860400002)(346002)(66476007)(66556008)(31686004)(36756003)(5660300002)(186003)(6486002)(4326008)(53546011)(4744005)(44832011)(2616005)(478600001)(8676002)(2906002)(956004)(26005)(316002)(86362001)(16526019)(8936002)(31696002)(66946007)(16576012)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?cVVBclhvSDJteFNWNUxPeWtwSUFzSEZock1VSHB4Q3Y1b0tKeUVST2tJemNG?=
 =?utf-8?B?WDBHUWpVVlFFczd1YW1kRDEwc011MXV6aTNGRXNnUEdSbU5ZUkcvTm9reXgw?=
 =?utf-8?B?MDhQVzVzMUtwMkZ0WUhZZUd4LzhmZFFNN212RklWM3l6K0pUa0Myb3gvby94?=
 =?utf-8?B?cTBoN04rL2llUTN5Qy9zbkpGZVNVTkIrbmxZUnRKRk5LQ3gyclFCV09FY0lp?=
 =?utf-8?B?VTAxMXYvL2FvaTJHYnh0MnJoN1pDMzlrMjluVWZhMFJlcUl4YzNDNVRKbWpv?=
 =?utf-8?B?N1Vsczk5MXRWRERkLzREd3NUeE1ndnVCaXMveXlOWnExSjRaU0grWkFOK2l1?=
 =?utf-8?B?OEZRbG5wMHJOTG1KWDBDbG42SEpNMFJ0TjRNQnFEVlZ3cExoYXN5OE5hN2Qz?=
 =?utf-8?B?eU9jL3dWa1UwQ3FvenM2MmtVMEMySXFOc1ZLRjB0ZnIrRWd0cWdWOVQyODY2?=
 =?utf-8?B?eFN0TUxpZ0tQTm9RVWNCeitGL0x5OUpGRkpHK3VkdEl0emRhc1pjdTJCL2Np?=
 =?utf-8?B?RHBYeUgxYWNUQTJSOS9iMUh0Qm1qZEZjblQ1Y1JobEFldllLY0tSekp5dWFx?=
 =?utf-8?B?d3NzMzNmbSt2YVpSSUZQYysyZFZjKy9KdXY4a2R3NnhNQjJlY0w0T2xwQWpH?=
 =?utf-8?B?K2dyaHdqbnlwbURHNy9kU1lzK2FoVzM2K2xVczkyTEhtY1VWeU9Lb3k5c1lB?=
 =?utf-8?B?TjNhNEY3Q0hoRXNHaWVFTFJXdU0rc3lqTGgzbVc1THB5bm1sMlJQV2RNZjQr?=
 =?utf-8?B?REJDOEVrQmFaZThNeVhZOGoybTV2OWMzUTlGMUM2ZE5RT1BRaEhvLzBOYStK?=
 =?utf-8?B?TmsrNVM0VkhvSm9MZExnUEZZckx5Z2dmdm5RK1dOUnkyekh2RC9PSlE5T0Jm?=
 =?utf-8?B?RDZQNkkzWGtxWkRXV3V6SDFHbmF4MWFrd3JIRFFoZHk4bFlYZEdqNVY0U0Zh?=
 =?utf-8?B?eTFYVFFzU0ZvUmRtK0dVcjc2c0x0cCtZakpoT3NHTE9qSG5aRDQ1MlNLbUlm?=
 =?utf-8?B?RFhLdytoRmU4eGNtUXBQVFZzdW5LSzlPTUFnc1NhcERZMnI3SkRHanFIMytz?=
 =?utf-8?B?cU5pdjlNeXZyL2FNd0hqR1lmWTBQYlpDeUFUbWZZNFVtN29PcDBIVWJFSjFs?=
 =?utf-8?B?UWlGUSthM1hqQi9pMjQ3YitDcG1VUlJUT0pZQ0E1cVFKT1pNUHFWUDdueVU0?=
 =?utf-8?B?R0gzS0RKRzIrUm1lcEppTmZnaGw4bWJLYWY4RGphR1NJNGlpQUwxWitNNDhB?=
 =?utf-8?B?aUNyeGNrRGVUaHk1Z1BjYjN4RzdrRERqNnhkZDNDbzh3VDdvb0VMa0lBVitG?=
 =?utf-8?B?M0NuMGJZT1Q1OEF0V1ZnSWgxaml6cmlFOS9tTnJSMDZxdWx2RDBXd2pxQ0Fu?=
 =?utf-8?B?VC9abjBROUJUQU9reHEvRVp1cnZhLzNYeEpuWDhCeVJHSzYxZ1JocTZNeW1P?=
 =?utf-8?B?ajJUOWQvTXR6cEh3eUNoM1ozV3JVR0FJUUhLdWtXbWs2a3JZREIzM3Z3MVpv?=
 =?utf-8?B?VDZtTFVSMkFiZzF6YnBqUjBtWUdLejlaTGVmNmIrU1lTb280YWd2dVVZRmFJ?=
 =?utf-8?B?T2NERHJtSnR5aENDNUVMR2V3ZEt2aFVZSUJLMFM2NkJON1IydkR5eXpqY3c2?=
 =?utf-8?B?RTNQRHhFNjJhRUlsYlJ5YnlnZTBPOG1GUGcxbUtJeW5WSXBOZ3dLdnlaNVVr?=
 =?utf-8?B?SlhJbTRvdVNZdkhiazR3dDZnUTdPSGFydDZWZEJtemd1cnk2MGxvMUFFeXdF?=
 =?utf-8?Q?01X1qNyp+k852FdLE1JYeYg9s8vM2uof9W+lT7b?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da2df8b-0129-4ed3-fc1c-08d8d4e6ac4b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2021 14:57:28.0337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i02c3iVO0Zy+JioJTyl3moUQaVQk7+Th4aAAlP/QiZ/vQpp0Ph4XRpP164PVS8gfloKHQxzx+SFIMfMp3N5d6Cb6cRemdDr61oOHCFu80mQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3654
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9899 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=904
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102190121
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9899 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102190121


On 2/18/21 6:48 AM, Roger Pau Monné wrote:
>
>> +    /* Get the domain's default policy. */
>> +    nr_leaves = 0;
>> +    rc = xc_get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
>> +                                              : XEN_SYSCTL_cpu_policy_pv_default,
>> +                                  &nr_leaves, NULL, &nr_msrs, msrs);
>> +    if ( rc )
>> +    {
>> +        PERROR("Failed to obtain %s default policy", di.hvm ? "hvm" : "pv");
>> +        rc = -errno;
>> +        goto out;
>> +    }
> Why not use xc_get_domain_cpu_policy instead so that you can avoid the
> call to xc_domain_getinfo?


Yes, indeed.


-boris


>
> It would also seem safer, as you won't be discarding any adjustments
> made to the default policy by the hypervisor for this specific domain.
>
> Thanks, Roger.

