Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3DF34D3F4
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 17:32:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103110.196747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQtrk-0001u6-Kd; Mon, 29 Mar 2021 15:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103110.196747; Mon, 29 Mar 2021 15:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQtrk-0001th-Gt; Mon, 29 Mar 2021 15:31:44 +0000
Received: by outflank-mailman (input) for mailman id 103110;
 Mon, 29 Mar 2021 15:31:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bmwh=I3=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lQtri-0001tc-VY
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 15:31:43 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 318c105d-9020-4ee6-835c-cad2d3b044e8;
 Mon, 29 Mar 2021 15:31:42 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12TFECxH024427;
 Mon, 29 Mar 2021 15:31:38 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 37hvnm3yb3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Mar 2021 15:31:37 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12TFFYmM193140;
 Mon, 29 Mar 2021 15:31:37 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by aserp3030.oracle.com with ESMTP id 37je9nhcvu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Mar 2021 15:31:37 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by SJ0PR10MB4621.namprd10.prod.outlook.com (2603:10b6:a03:2d1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Mon, 29 Mar
 2021 15:31:35 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 15:31:35 +0000
Received: from [10.74.96.207] (138.3.201.15) by
 MWHPR20CA0033.namprd20.prod.outlook.com (2603:10b6:300:ed::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Mon, 29 Mar 2021 15:31:33 +0000
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
X-Inumbo-ID: 318c105d-9020-4ee6-835c-cad2d3b044e8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=vktUX/LWramEoiCqY3+yz9Yv08/2+qVPBy8xEj2nPZY=;
 b=zqtMdqHKGVpm3M7EmDbwhkOJ2K4e6HvGouVeZUyWL9iZ8A1i5cWqZknwHpX3PaC6cw8z
 AVWgC2SD0zqVhHqx2YuvAwC/qj1qs1p8/IzM5R5aaXMU1wPCIuUpqgP9WUYObLR0GgvE
 ZVYVBF3TqH8ZClGleeZUfFwERgNAG1pl5O8f4iCvMZw5f8yLpglHjxtaegwkxEHNJmnx
 JI3u3tJpVHP0qo+5QBsOzK3ZbpU3I9oRdnDrnjV8PhBSxn8hOrtEr8ZhEVULMHdncCmn
 3Vn/eawM8ewWs24W2fQvRepoXAJuG9wG6uN2H+Qr9M2jbbWefFdwjN35QFJt99a9cATb Vw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wl2fuSxT08N6ouZ75BIswmbGqYaM3CMNXgArTolj+774EOOLT/lvxwNDVMcy7lNoFb3l7GKSM5fcuoVGng75+IThvZX/JIHLMYGlYliBPTN0xsuCITbt3cS0OQooRO9/zegjTvB/Md1FxNXrJ8lFvo2Kv3zOe/sgjSOPLyNH3Z9n7O7dd6kmbZjmBylUKZ3nnkdMW11tvhxX47uygvUOGCv8O8eJVJUCuFVya5SOlfGxAY1C05yztX7JUdLyp8R+6XMYvbw/OG+pI7BtswckN5KZL3FmXCbVwJkSwk4vRkEPt+zOU353ssnaOzQhn328lSGFQGNJ0c1P0jFdgkUvvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vktUX/LWramEoiCqY3+yz9Yv08/2+qVPBy8xEj2nPZY=;
 b=erbmwNUI6n2JbjgBUL67iZz49vRRar/nKi89VcTHB8AhIdV6xtCtacFtR9ANRItBuqERPUAU8Y4ESx0tatZbk8OimrtLNfvZ5da0wZxb5Gy3k2eEjlwoCUFacDcQxYHA6EuthJVQlV3migqSAx8Of0+Au0adQAXlbw056MjUtYDatfK14VDpmVKNIqfWEmG8wn4r2i/cxNlX3OUmL9TYGc9ulhizDUYBBQ6oYBzgPED5lMG15MdaC8Xhv1s5vwTar0nmBJyRga+DQVz/gnHkHo5zmzMmPx6IKORR3oSWwgldPiSj5jlbkIup4y0qQwArmxbkIg1YPByCI2iifR3foA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vktUX/LWramEoiCqY3+yz9Yv08/2+qVPBy8xEj2nPZY=;
 b=Cf5zHZ7Ho22yc8FuS0XqVtxD2IemwTc5ypsBXHYyxxrZySDzIF2QxODktfBdjPrn6HvnvIX2A1xgLz6ARxjYRflaPabaxMxvO1ZSkqmKz+yOwaOh0R7vZzkYmPKbSOeHELjkoAd0HyP/V1wkltgz+6KCR6MzUmKeiJd3leADCX4=
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH v2] x86/vpt: Do not take pt_migrate rwlock in some cases
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, wl@xen.org, stephen.s.brennan@oracle.com,
        iwj@xenproject.org, xen-devel@lists.xenproject.org,
        roger.pau@citrix.com
References: <1616809866-30837-1-git-send-email-boris.ostrovsky@oracle.com>
 <82868938-bf57-25c2-38f6-1ec8e9c92362@suse.com>
 <bd430cc4-4c57-e479-14e0-0b62754147c1@oracle.com>
 <e5776eb6-5093-019b-43a0-167fa7924158@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <318ca597-c7fe-ceeb-df12-2802b2cc74fb@oracle.com>
Date: Mon, 29 Mar 2021 11:31:28 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
In-Reply-To: <e5776eb6-5093-019b-43a0-167fa7924158@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.201.15]
X-ClientProxiedBy: MWHPR20CA0033.namprd20.prod.outlook.com
 (2603:10b6:300:ed::19) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd7ff284-0b29-4f0d-5109-08d8f2c7bca0
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4621:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SJ0PR10MB46213F2F4EBE897B6587259F8A7E9@SJ0PR10MB4621.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	c8f5x2qplcpiksOAs760QXPuGYOgdtyusnFTyBDI6q8+ZNGyZc+DqqjJC0fM4VY83jTWMFUQ9cCEf7kUzOVwOwlx2m4caWTb66zFmO7URTfDaT8d1GNaaIZ43o0LqJ9gE7TOfor+rizHW5bmRRkx0fS7//mjEcsKKxKvPmaqp4ttJy1dUT4GK9aPQqdh/qtCR0N0dSkyLNvyvcnpfBLAIaxw5uFGIygy3BI61nxGUKqxs+kzFEa1/2fnEjVHMZBbt2Rx2WpO/sVGrFCvTwTxZAJF8+c/EBmk4UqQvJ7drmXg/stEIVtxRsnYe60XGXAeCIPtYHZoTC9wAeqzKaQoabQIWM45rODxU2q7a4H/ZEh80N2ijrtRqOlXd7e3jIswq+8heelaZtFwuNz5OhCRohIWhylUdVEdPvJJ2tyt94zSP4+Dt+1EcZ6eo1yR6bGLd1SomC36glefe0jHKju+ldE7xQaI9kWSQZjSaGGZIGFx73wZGw0Zh4tVrTXKU/v0jzoST+RDQ5k7fXinZLaTlCFxj42Vtkfpk2FK861A0jvs4siZ4zuxwrcH2BQ2l/sx1iY7+oWZBeP77tu/Mb1VSjCkb7H4ic5IzrGsxtz8iu4HflNoKwZMc1J51zcmYHIJZVKWYWdDjbLkzbkSxy/Ol5o+1ZL9AodzKuFf4jreI/ZIvWemEio9Z5bWFQ89JqaB7PXXm7V/WIhX3yFqXxvg6g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(136003)(366004)(39860400002)(396003)(478600001)(6486002)(83380400001)(66946007)(956004)(8676002)(186003)(2616005)(66476007)(44832011)(31686004)(6666004)(26005)(16526019)(6916009)(38100700001)(316002)(66556008)(2906002)(86362001)(5660300002)(53546011)(8936002)(4326008)(36756003)(31696002)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?OEU4amRrNDEzaWEyVkkzbkVnL0xJL0pFUDJLNzN2RGZSak13UkI4TWNxdnJ4?=
 =?utf-8?B?dDE3bEdKNXlkY2ZqamNxdU9JbmdzSW1jdVM4OUVuV1ZCamF3eWs4dTk0bnU5?=
 =?utf-8?B?dnZWQXU0NkdKNlpjM0p0eUw4UEhZT3ZUQVYwWmVDSGZpWkhNZEtMSERDOS8w?=
 =?utf-8?B?cDEvZVprNEdmRVNxblJ5N04yYi9PN2t2NXVPSXF0U3hlZnpXUmhLVTJ6c2d5?=
 =?utf-8?B?TkNnN1NiMDNjeEIyZTNtZVRHNlBOVTgzSEdRVktxcHExRHBuN0J4M3BwbkZJ?=
 =?utf-8?B?c0xJZFcyajFYd3lqaFRPYzl6S1RrTkg1ZHZ6ZDM2Zk1QT1NVbG92QmgweUFK?=
 =?utf-8?B?QUl0UFFwQmQ3MGkzNjJqcVRHd3lzR0ZLKzhJWEFyU2EwcStQbXB0UHZZSXAv?=
 =?utf-8?B?WDB5U1cvQzI0d01ObkFmWVZNcVA3MlA2YVl4KzFmM2p0cE52OUN5Y0FTL3lW?=
 =?utf-8?B?czZxMVU0VVRHUUVGVG9HRmZFMmZxYWhjR2JmSSs4ZytydTZFNm5VeDBMOElo?=
 =?utf-8?B?YkNBdUJHUU9jbTZiQjc4UEhRK3lnckxxM3JyckFVMkVLenVock01cExpQ3Rx?=
 =?utf-8?B?V0VMQ2gzdVhjUWx0Ny92RWJTOThKREdjRC9FSTdEK012bG5BNFZYVzM3Z20w?=
 =?utf-8?B?Uktubm9qdktCZjNlY2FYazlHaG04bk4ydzB2ZE9EbGQ1Z1hEeXVKRW40VmZ1?=
 =?utf-8?B?U2VtbTJBdmhoSWlCRUhvL1lGRkZoU1djcmRLeXlpdTlEcXJOSlpkVkdFck5O?=
 =?utf-8?B?OStsVytJSUhBZTA1ODVpYkN5NDF2U3RzOUN0RFl4ZisybmNJbGllRk9HNkgv?=
 =?utf-8?B?dlQ2MzlkRC9VRHhQQWpiRmxnaWV2RVgwVVVKYnNVd0FoOTR2S1p1VnFPeDJy?=
 =?utf-8?B?N1hkQ3NaL3E5QXFqak85QXNyVVhabndRU0FMZVNHaE5WWFNXM2ZyVk95T1JD?=
 =?utf-8?B?TDh0MFo0dEh2TFJ2RG5FY2NQcVNWamh0NEFzUlNEaWtKd0ZmWXFUR3VoK1hS?=
 =?utf-8?B?aS8weEE1bmdUbUtGL1l3Wk9CdEpZWDRFVUJ0VzZDcTZrTnZ6c0pRc1JZd0pB?=
 =?utf-8?B?eXZRSEltajBVRGZyM2JQaU1XclRVT2NlNFBpSnZJMFRnUm9TR3lXcGhZaTRZ?=
 =?utf-8?B?b2ZWeWxLcjNXTGlpQTJaVlg1NlpwdXJSYU4yM2lDNW5YYkNaeHRsbUswT3M3?=
 =?utf-8?B?WlIwTHdzL2FhVVBKYW1NYVNXS1VxbG1vb051NnpYTWxvTXZxdDdvckNyMXVq?=
 =?utf-8?B?bGJ4NVFRbEpXUlhrcTAwMlRvWlFod0Ivb0pIbnA4TmNLT0lsVUNLOXRwemov?=
 =?utf-8?B?bXp6WkZhRkpWdkNyMWZLUXdwUUlsVjBPK1BvdHpEQmpEYVRxK3RNZVlPZUJs?=
 =?utf-8?B?YjQ4U0NqcG5WMU9xdk55OUl6bGQxTU03ZG5QajNneTgxTERwYlFmT1VYOGJI?=
 =?utf-8?B?VlpRMC9zelhpOHlCZzgzZ3d5djllUjNYZ0hTd2FlL0RLVzYvQ0pXejlMNnoy?=
 =?utf-8?B?M3oyV2xkK3lTQkdndGNZMTJ3SFFQRlpLaXNGekMrSjFzb05wVnBuMFBKcEVJ?=
 =?utf-8?B?YW9aZVpqT2VRNFhaSEV2OUJCL2ZxTXBXb2pCbnNGdkFWc2tOTUlVNERlOWZS?=
 =?utf-8?B?aW9tRWxHSlA5RlNhQnhXUW9yc01BUk9XTmdiczIrejVUQVF4YmJGYUJGUGVN?=
 =?utf-8?B?eWgxSkY4TlN6T1kySUhtY3VUeXBGTEdEUFZzQ294Rm5uazZLVm9lWXhwWG10?=
 =?utf-8?Q?7oltK66OnHXz9ZrA74r85wOLvboxDw0Wskqc+Ui?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7ff284-0b29-4f0d-5109-08d8f2c7bca0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 15:31:35.6568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jAazlFvmoFE8dJ1+HWbKS/1mbDAADU4JpCr93gsdg7/s+o7S6kwGABTYyZTsUD1qlbLWWfP8c2nAVwzlD3rRmw3okgco0Syl45H78uoPmRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4621
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9938 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 adultscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=849 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103290115
X-Proofpoint-GUID: 8sxjkmzh6VnHcIEAjg7v2dUPyH21E70b
X-Proofpoint-ORIG-GUID: 8sxjkmzh6VnHcIEAjg7v2dUPyH21E70b
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9938 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 mlxlogscore=999
 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103290115


On 3/29/21 11:21 AM, Jan Beulich wrote:
> On 29.03.2021 17:04, Boris Ostrovsky wrote:
>> On 3/29/21 5:56 AM, Jan Beulich wrote:
>>> On 27.03.2021 02:51, Boris Ostrovsky wrote:
>>>> @@ -580,13 +593,22 @@ static void pt_adjust_vcpu(struct periodic_time *pt, struct vcpu *v)
>>>>          return;
>>>>  
>>>>      write_lock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
>>>> +
>>>> +    pt_vcpu_lock(pt->vcpu);
>>>> +    if ( pt->on_list )
>>>> +        list_del(&pt->list);
>>>> +    pt_vcpu_unlock(pt->vcpu);
>>> While these two obviously can't use v, ...
>>>
>>>>      pt->vcpu = v;
>>>> +
>>>> +    pt_vcpu_lock(pt->vcpu);
>>>>      if ( pt->on_list )
>>>>      {
>>>> -        list_del(&pt->list);
>>>>          list_add(&pt->list, &v->arch.hvm.tm_list);
>>>>          migrate_timer(&pt->timer, v->processor);
>>>>      }
>>>> +    pt_vcpu_unlock(pt->vcpu);
>>> ... these two again could (and imo should), and ...
>>>
>>>>      write_unlock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
>>> ... really this and its counterpart better would do so, too (albeit
>>> perhaps in a separate patch).
>>
>> Are you suggesting to replace pt->vcpu with v here?
> Yes.
>
>> They are different at lock and unlock points (although they obviously point to the same domain).
> Indeed, but all we care about is - as you say - the domain.


Hmm.. I think then it's better to stash domain (or, better, pl_time) into a local variable. Otherwise starting with different pointers in lock and unlock paths (even though they eventually lead to the same lock) makes me a bit uncomfortable.


Secondly, do you want this and the check for pt->vcpu == v in pt_adjust_vcpu() be done in two separate patches or can they go into a single one?


-boris


