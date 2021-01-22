Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C53300B85
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 19:40:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73048.131688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l31Lv-0007V6-2L; Fri, 22 Jan 2021 18:40:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73048.131688; Fri, 22 Jan 2021 18:40:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l31Lu-0007Uh-VL; Fri, 22 Jan 2021 18:40:10 +0000
Received: by outflank-mailman (input) for mailman id 73048;
 Fri, 22 Jan 2021 18:40:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1HJv=GZ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1l31Ls-0007Uc-On
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 18:40:08 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e787f41-4769-4128-a7e3-3a18c7f0f504;
 Fri, 22 Jan 2021 18:40:06 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10MIOq0x183313;
 Fri, 22 Jan 2021 18:40:03 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 3668qrnjcm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jan 2021 18:40:03 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10MIOxLN024163;
 Fri, 22 Jan 2021 18:40:02 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by userp3020.oracle.com with ESMTP id 3668r1ep9d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jan 2021 18:40:02 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by SJ0PR10MB4477.namprd10.prod.outlook.com (2603:10b6:a03:2df::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Fri, 22 Jan
 2021 18:40:00 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::fcc2:62e8:e4e1:b4cb]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::fcc2:62e8:e4e1:b4cb%5]) with mapi id 15.20.3784.015; Fri, 22 Jan 2021
 18:40:00 +0000
Received: from [10.74.97.144] (138.3.200.16) by
 BYAPR11CA0093.namprd11.prod.outlook.com (2603:10b6:a03:f4::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.15 via Frontend Transport; Fri, 22 Jan 2021 18:39:58 +0000
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
X-Inumbo-ID: 7e787f41-4769-4128-a7e3-3a18c7f0f504
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=CB4e0nrpI7LxnTBH+KBrvWF/9vlpku20zCf+917DNjQ=;
 b=Ss4UnyXs4D4PqMu6qXbooUwC8TBpbVAPD8m/ZjmB5IKDVQEb47RQ+kdgTxrbdqFfYvnJ
 UfLSKLFDTMRtQCG4RsVOljlHIvLD8c1hEJaRmDuxZscAzfSMg0Lin8s9yK0UIjklmtWo
 Gx1+yMEt7zEnTrV+zH6DsigwO9Gd5ZGS7LYfGwh0q5NbtFq42Gq8RKyECGGiw3NdE6dE
 2qcleWC6mntqa0TA8W10z3FPY4Dm/gzekoXYJ1Si7Cwdaqm3ZADgfHl5uUiIkiBe+olu
 d0SWxMt0IU5uLBdVyJ1quQhJBZgE75x93GZBToT0BpY+CdH4syIWLHs3Pv1bA8hL9KIC fw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VrYjhMDT/nqZblI7R6+piHoR1zijGRXooI4OJ+sr8TS4OH5OGwCjWnyxcOBKuAsOWL3CencMCZYenrE7v6fQFLBG+OjCUAJX9ouL3j3EctEXPVvK3cFKqdvFLjgYqLoUOSlZHZ/+GUF13ebUZ+134I+gIZdscCmL9tO4//pT/09rHlVqF8jLUGfoA4ZHcWXFwzoZaUU0adxmGqCJVJOx007c+oSNRu2yBX9H2dDNk1VsjZjcgNVlFaVhUALcRWU2xb3mSxV1vvAvGSBfYx0NqbtB8QzkTfLbOZ16s3HnCvuEWIyYv2aLv+PR5Ow+tUNylYLD9jHcJFWcP1alovLAVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CB4e0nrpI7LxnTBH+KBrvWF/9vlpku20zCf+917DNjQ=;
 b=F6hNi0dalJRLmbG6OJIHRaLIHdklNwfCxJ/BRrQZeNT8F446XWB7++fWQSPQKT5gQIPXgcl6erA86FPoa3jq0CENYRNbGWQNlZKdQNJPTWlWTQl/y4uBL1C+FCgd5f3mQ0vESoNnJ84WVAVjqmlzs82WRZW9xJxlyaVQVyWZyp1B9THG6fW4iLJ87J1avK9kON7CBM4KNPqIQCuNFXP0mPsXxKoY4JN4oXsNRPdexLcnigBG85L4p40g0vIF9UIna5AVbuz+GFZlM/+rThCq/z4pf2Gr/ZD43ifv2VIJbDiWzg29oUC1wmBZr5RsfOiKm8BwsCDN6OaRywq6wz2HBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CB4e0nrpI7LxnTBH+KBrvWF/9vlpku20zCf+917DNjQ=;
 b=ZUDp8imxZopkXnrE28b7GyHBUb0RcLEetsOvpznOeSkprb41vckPviAoasN6J0sd8ffrYLXFeBFPZN0lZjrR5mBW8NdqO/AcWannrdirxOU57FxkthE2/fYYF7mdQFw2giol67vqvl347Al/inaxBDXu9OhytrrOu1zDhGGMyQ0=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH v2 1/4] xl: Add support for ignore_msrs option
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
        jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
        jun.nakajima@intel.com, kevin.tian@intel.com
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-2-git-send-email-boris.ostrovsky@oracle.com>
 <edc67950-7d8f-5551-23c6-7b4a398ec9cf@xen.org>
 <189bbbab-e3c6-c7d4-84af-63e568f23dd3@oracle.com>
 <c7db8ca5-cb14-353e-0745-617482b77bc7@xen.org>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <77df7ce8-fc8c-ca9b-9d79-2335f459be13@oracle.com>
Date: Fri, 22 Jan 2021 13:39:56 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
In-Reply-To: <c7db8ca5-cb14-353e-0745-617482b77bc7@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [138.3.200.16]
X-ClientProxiedBy: BYAPR11CA0093.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::34) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d99152c-8f2c-4928-56f9-08d8bf051f8d
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4477:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR10MB44771E8B06275B0AF2E4DBCC8AA09@SJ0PR10MB4477.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QaZV3fWW0P5rhpnwAnOV5P1NegbWVCxm6drlX1HKI9ikKsOJL0KEmpUVGCrVwW6KmCIyDhHSmUheyrx8ohwEv+89zBGMHYszDNkLNri4QJxHL28Hl73q4PMp2zW/OGIsBBiuSZ28+FWKKdmPzvKDE1kbtnuk8CqcTjDfFNrxR6Ud/64MNTbUJ7+H8RhA1JuxKbhDT9Fg0bTW+ICO3U8Iz2x7Yle0lSlgOtuEmp+SO4j9IsRAx9iFwSDXY2KaGCE8E9Y48SiQ72LJPDMEpq9waArovLDCkgSoWgONzGzKEyUctKGjRHvkZL0LPapF4H4YViXn8jRTpHsjlJOgg3M8IPJZJBo0KdnTjaYSaPUQ8XdhIaf5HKmzQUm2Q9UxrwHlUO1PilxmQ2wX8E0yrD3ZT1e8iN/THR7UQSdXVjCCUTqFSVfaBAtX+jJkMFdMEhu7J5pAFZ3TPCAaelfuwDg6UHnQeLHMUDtwNTVA6z/RRX0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(36756003)(5660300002)(4326008)(7416002)(66946007)(66556008)(66476007)(4744005)(16576012)(31696002)(86362001)(31686004)(2906002)(8936002)(83380400001)(956004)(2616005)(26005)(186003)(6486002)(53546011)(498600001)(16526019)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?aWptd0NBSFlDUVoyUEsxcmd1TktpeDhyT0ZUd1hnOVVWK1hpWElYNTd2UzMv?=
 =?utf-8?B?TG5NOFZiTUhHK3h5WHZ1bFEvcjFHcEZwcjZJQnNUTW1YSlpXV0MzYS9HbnBt?=
 =?utf-8?B?YTFqeXh1RUZNdHcwZDRpa0NYRUk2RGZtVTVwd3FEcSt3QWxpNUFydjJ5cEw3?=
 =?utf-8?B?cWFMOU9yOW85NG9wNmg1TEh2b1ZVSkNOK2dEK290eUVnTEt1OWsxNy92R0FO?=
 =?utf-8?B?V21JcUU1TjhBNlpUUHRsTjdBV01VMUNzckZIN1NrdEtSc05lMmtqU09lV0dM?=
 =?utf-8?B?dnFST0hNMmN1YUM0VytDVEpNbHcycFcyc1lXcGIwYTdzLysrNXRzN3liL3Aw?=
 =?utf-8?B?QVl1RmFEUWkzNXhWQ2VlUEJiTlJXNW9wYXFpRmxORVkwUDdERmFNcDR5cnZt?=
 =?utf-8?B?dmxNTWxnZzk0UDFFZ3hIa3Exd3Ywb1JLZC9sK3pDbTVacUZOQWtOUkpRLzdP?=
 =?utf-8?B?aU44REhDTnRxcDYxcTZLTXhpcDM2MTdrWjhtNHc0czdNekh5VENCMzVTaTQy?=
 =?utf-8?B?aU9OZjBkV0t5QTZOTlUxUUdXTm5JbG8xc2dtZG8yd3dISXYyMjVSMG9lRVhL?=
 =?utf-8?B?WWZHNnFzR2hHY1hVa1VkUGJMNW40d3YrN0Nwd1FjVlo0K3gxa0h3RFZxREpv?=
 =?utf-8?B?OTMzOVFubXNId3ErbGU1TDFQc3pMcGZxMThxVnpkaDBNL0xLa1lEbDBteTFD?=
 =?utf-8?B?SG5FUDB2ejlKc0Q2dS9jMTRDbWxYNngwbVhNaENxSkNDekNhT2VXek0zWVdl?=
 =?utf-8?B?WHovVE5pWERTaC9UbCtzK29IYkpGNU1GeGVYTFpuVDMvZkVyRFAycVJaRlZB?=
 =?utf-8?B?Wk1vaks5OUxUcU9sVEdJdEYxS2M4TkpKM2tHSVQ0VUNvK3JPblN3RlZTeTVN?=
 =?utf-8?B?K2dsc1hOVzlXNzdqSXp1UVJFL3FYc1h1RUgrbXJ3amxjc0ZFdy8xc0QwSlpD?=
 =?utf-8?B?UUhJR2lPbWs2NzFJYnpVRFZSVi9ZQnNBYlBZU1kvK0NBbzduRjZWWCtuUGdC?=
 =?utf-8?B?UmxUZ2lVRklkdi9GQlI5MzZJTE9tTEdqZ09IRW8ycjVZOUhhSE9WZmZFZ2Fs?=
 =?utf-8?B?ajJLaXdEUm9ZSWxFTW0velF5WmVJVUlhRk5QYkFZcTV4RFpCc3NxS1N5VHVS?=
 =?utf-8?B?WXFMY3k1ZVFab3AwLzZPbkxaQ3FNa3dKcWVhdVM5MUFWcFNnYndtcTdWdXZX?=
 =?utf-8?B?WW11bnQ3Q3QyQzVlVnJMK0tVT3RzeTBZbFR1WkRURWV2bFpObWNTR0FKTUk1?=
 =?utf-8?B?Ui9XblZVUjh1MksxbUxPdXZSWDZ1alk3L0NyUEQrRG92Uko2UXVKRWQrd2FH?=
 =?utf-8?Q?X++eK3qNKnAGb/dSCQjG8qmzk+sZNFFoUP?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d99152c-8f2c-4928-56f9-08d8bf051f8d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 18:39:59.9322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +7CHB5Ezk2uWdwIK/zBAihIFAO65jpBnzTNhVoUwOSNsKDzJruGyHJSZIkMhoHa+0iPNAnIYUjTDin1QmpsYWkFhdSnx/5bt29YgKdYjpag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4477
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9872 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101220095
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9872 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101220095



On 1/22/21 1:33 PM, Julien Grall wrote:

> 
> Thanks. In which case, I would suggest to move the definition of ignore_msrs in the idle to an x86 specific structure. Maybe "arch_x86"?


I did consider this but left it in common area since there are already a bunch of fields there that are x86-specific.

If there is desire to create an x86 sub-struct then we should move all of them there.


-boris


> 
> I noticed that none exists today, but we could duplicate that "arch_arm" one.
> 
> Wei, Ian, what do you think?
> 
> Cheers,
> 

