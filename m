Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D934C4DFE
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 19:46:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279564.477305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNfbb-0006BF-Qr; Fri, 25 Feb 2022 18:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279564.477305; Fri, 25 Feb 2022 18:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNfbb-00069P-NT; Fri, 25 Feb 2022 18:46:15 +0000
Received: by outflank-mailman (input) for mailman id 279564;
 Fri, 25 Feb 2022 18:46:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nFiF=TI=oracle.com=dongli.zhang@srs-se1.protection.inumbo.net>)
 id 1nNfbZ-00069J-5u
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 18:46:13 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30eceaf4-966b-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 19:46:08 +0100 (CET)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21PIihhK027454; 
 Fri, 25 Feb 2022 18:46:03 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3eexj89tky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Feb 2022 18:46:02 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21PIjx2X096196;
 Fri, 25 Feb 2022 18:46:01 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
 by userp3030.oracle.com with ESMTP id 3eanp0jud2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Feb 2022 18:46:01 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by MN2PR10MB3408.namprd10.prod.outlook.com (2603:10b6:208:127::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Fri, 25 Feb
 2022 18:45:52 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::a0d5:610d:bcf:9b47]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::a0d5:610d:bcf:9b47%4]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 18:45:52 +0000
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
X-Inumbo-ID: 30eceaf4-966b-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=8BYp7TpMiW9tihYA5bt5W0jmwZZ4fgvseB/F7Eosde4=;
 b=cuKu8XT6hoS0eZbVteECJm0ViF4DrpCnHpkyGa/UVF4AtTA4DLw96LoT0rlQDmQOFnFs
 MMFKjfToFsXpRSYJxwaET1i2q1r7EOJS3gOcOzmGAX6H1b1Wn9OK8wyqNRh+fY0tdhNq
 iwYjY0HbezZEz3hx7EDTq8R/DfWhw1ifujEkeFs0KedK3s64pQTfQn/fCz+5QGcU0Nfk
 9rB5q8SG/l99vKDK5uNhxs24HTcYfi8W2DDZcnQc5zUoztwt5Td08kJ+c7OmK7DvtcHe
 LPWdXUchiT/9Vy3gA6SS6uKDS0fzEsYMIqmq3nW1sWTR0NoMBur2AZOrgwLlD1nyZU8m fQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNdG51b2tVLtNJiE1RXPJEc0lsXhJ5SausI9ttisMPoWN7hVQXTzSL4Keq3Q78lCheESaFs+6fioWll9Eewct2EhZw5JgX68IxGjIpM1k/+qXSjs7hn2l7K/5fZJCd+lncy1K4IrarAHHEesA1cv7cbQo4Z2nlAel+i8dp4u1/s9NDB4EYLH4UofmlaHpWDsixywuuBHiOVasXxzKXQI2RnZ6eGlt4baSXbBTonXWVNSMtPme4UqbenH32bgV1i5tazcxaah9C7JT48MLkbtQzLHiJDdV6rMn3PRGzX+9cIlYcgGYIuo0UGG04nDvh/IRExgO5jJU8Bd3MWFWkpAOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BYp7TpMiW9tihYA5bt5W0jmwZZ4fgvseB/F7Eosde4=;
 b=VwW6NxUtkSw82vtn5qFkNc1WwT4Kqh1O7ih+jSHBYP9Lq9GbsrGMl55E3m5b7NBzWmRj0sAZv5CkKYG7Pkk1nUkA3wLX87LVCN4+7DvIMOGx7SkoDIfJyLNI/bVMotUFROKp11ar2kqP3NShM85xCBX6jA+yqZ05P0q62MqERGSKPj/pZVaMsfkPhbFYQeMQZ6wXjIuu/Cb3C594TuXe07LRqd4PT2fKtMV/YSw0A3Rk2aSUAumn42EFXd26+X19zcNI5JnwdDAE8JH3VK7KFqoB6NVcwp0wvK6Y2mYypEqINdZ4vXpMM+Ddg9o0jKV9POxSyPzWKeBpPt3dP3shvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BYp7TpMiW9tihYA5bt5W0jmwZZ4fgvseB/F7Eosde4=;
 b=tzWxefiCN0qChMcoFuhzqETjP/jGYlRqzpbi9Vpas0DfMMw2Y8ZaYr8TK7thH/FO7otAcCzEQnnuzmh5RiPiYhcOpoQG5V3bGIxEhxWoe93hF4Yvd6jukPfWYvlTMuNq8xgHKFE6P9i1vmUxC5fYcl8uroO8RNpFWBlCS6NDTns=
Subject: Re: [BUG REPORT] soft_reset (kexec/kdump) does not work with mainline
 xen
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>
References: <BYAPR10MB2663BBE2CEECCC4C6504B190F03D9@BYAPR10MB2663.namprd10.prod.outlook.com>
 <d3814109-f4ba-9edb-1575-ab94faaeba08@suse.com>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <7ccbf308-2a30-e6ca-ea7f-4c2ad2c85c8d@oracle.com>
Date: Fri, 25 Feb 2022 10:45:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <d3814109-f4ba-9edb-1575-ab94faaeba08@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0181.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::6) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: febaa07f-2ca0-4ea0-e3ae-08d9f88f0c3a
X-MS-TrafficTypeDiagnostic: MN2PR10MB3408:EE_
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB34087DD27DD13269414AB02FF03E9@MN2PR10MB3408.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JWyRYHb3+P2BJIhJSm31npPH4yY0jOpHv7I1MEDg+bxw4fe7BjXULrvYi8/jUiqvZSofzE01Sw5lT3Z34hjmcxXgRuPQy28vS8L4jY2+zCb18To2oId+bfhd7uaOyaj5G0FcoL9FWr1/pAUaqTf4q43R7Ua7je9Djbg8kxIMK/6mQn3L+98P7+Ij0Du0md5jpOe2PJvN5iWGun7k8jhB7zzMwXrQArHPcl+5XKRXQb6KHrgNkDvS73Ydso5GgHS1T/0ETqRzCXpggYOtfIJ5tVptkBv94qh/umWMRj/qO0BMkwbhYkEszLhgTkiyrE/FKJEAKGGNpBOEEC9nYzWqSm27obwArGLpPIksXWQEH21vBxzOviLSYG5s00kqM/XF27uJaysFEVcn7Ps+RDPYjd5rCy26a7iedQ5jvD3Fxdh1eDyJIMxmi4t/CE9jCgEQP4Ei3TSDf0FafxjxkafUu8GSHquYKRvrowsZlbZVB0BWoEERPDLnxfUy7/D0xVISMu24Os+rvNpvg8xxJ+Y1V9qlVeZjnCAnWLiMExd/XQhegAM7TCMTIqSSfMDaOBsUommjdYP2o/O39B6PAggdCCZOFPhMqVXcqqftVXBiSMKMkXgpkqYuZ+v17XVfEuTX85Za6Y7osZJDgsv6mLw1OVD5O/Q7Dy0Mpzu6w3qn9cLSEt3QyEAP2zirzSEN6uGgip7w5+Wjalr7d1yDy8RLvxAQGHQO8Tv65+FMYGUEapc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2663.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(8936002)(44832011)(86362001)(38100700002)(31696002)(6486002)(83380400001)(66556008)(66476007)(6916009)(2906002)(316002)(4326008)(66946007)(8676002)(186003)(36756003)(53546011)(2616005)(6512007)(5660300002)(31686004)(508600001)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VWxqSnl2NG5lNVpoUUtGckg4bDlrNWJCenAwS1V6Vy9aQ2JyZzdiS1Jxd3Jl?=
 =?utf-8?B?NjY1OWN6M25MUEhEQmxBdVhYZWZDbFFrbTl6UmowZm1sUmRGZFF0ZUhIdEU5?=
 =?utf-8?B?OGNaOW5FYnlBbGJSank0OWJtUnZXTElvd2hYbFJ4bHBxWWd3NHhza1BPWEth?=
 =?utf-8?B?Z01hazFQUm9SVTZRRVdtUlNTQWI5ZGtSNEdoa3lYNjBBaWNrWk1iY0pDUnJt?=
 =?utf-8?B?TnJicThjazlEMmlaVFZ5Y0JNTmRDOVcrSFdGZnREcVRxUW9idFlyYjBVd2Fk?=
 =?utf-8?B?UzQ0WmlHMUVzMjdPb0xpWm1mZFRqVkpCejBIS0tWSEh2VjVLL0puZlZVcEJx?=
 =?utf-8?B?OGp6dmxGYjlDaXdBbWc4S3FnTjFjK1NaejBmcDIvQW9hbTBnTlUxSnBUSGF3?=
 =?utf-8?B?eDd5YUZxMTNqY3NtNEp3RTExZ1lhSzV3ekIwbDV6OWVzVUdxWjNYQ2UxY1NV?=
 =?utf-8?B?RW1YQWdNb3o5Zi9kU2JoRFI3aXRDUTRad3RRVVJVOTUrajFBR0drSXdwcE5O?=
 =?utf-8?B?THVVTERCSzVwU2ViNnZIbFJnemhIWWJqYXpKQ3hHbHNoNkdMWHN6Ni9peWlr?=
 =?utf-8?B?ZDRHUTQ3UE16cFVwMzVQUzlTMEFpU3J2MGJaUWd1aURFTGV4L0NhQnkzNlBH?=
 =?utf-8?B?N1YwODVoaVQ0eUQrUjljYng5L2pJTVlCbnRJYTA3dEtrWllwUFVWV2xPY2hE?=
 =?utf-8?B?VmcrU3lmdkh5S2FkeHFQRTdPd3NQcVRzaUNzY2d6Y1lIQVNGV0ZQVnRqR0FM?=
 =?utf-8?B?Nm9pTWRJZHRjV2tZNFdua2JNUmtEbmpBKzl4RG95cFc0d0loOTE5VFVxSFpu?=
 =?utf-8?B?THYzTnNKV0dJeGtBck9RV0QySTNGcEdSZUx0SkNzeW45TmUyYXR3WTRYc003?=
 =?utf-8?B?V21mcnZvNW03K3lLWVpSaVc0TDd0b2RudTZkcnJBWmE4VHBqUUNCR2ZnbmRG?=
 =?utf-8?B?S2gyb25pMzkzMjRlc3I2ODVzYWpxME1YQlhtU01YejVuK2J1RHpTWFBLTE50?=
 =?utf-8?B?SlJyZFdYVzZsaUdsWmEwSXFSY3p4by91N0hHRDNUZ3l1ellVYkMvZnhxSUM2?=
 =?utf-8?B?ZVZBNUVkYmY2bkg5SUNIN0o0T3cvaXRSbEhxNWlwb044a3I2SUh1a1VTN3lW?=
 =?utf-8?B?QlVqK0VrR1pIaGY0SWhVT2hETkNCNGhJaFRKQXZPN3Ezdk11K0VINjhNMUcz?=
 =?utf-8?B?RndTbmMvNGJYdnBkajlsQysvbld6WUZqaTExVkJsd3F1cWNnZ0JCZUpUd3Yw?=
 =?utf-8?B?dFdMZkZ6QjRiUWlDYmo5L21LQnE4dHkrVUFZMVdEMW9jSFZaYVNtM0N1ODhS?=
 =?utf-8?B?eW9TYVhhRWw0NlAza29QU2x4L2JqZ0Jha0FnRnJ5Q2ZzSU1MNEJ0T2ZBNVB4?=
 =?utf-8?B?ZE9tV0poQVdWZDQ5TWJ2WXNZWDlCa2tUWFVrL3J0SkRQYXRWNXVYUkpTYlZH?=
 =?utf-8?B?SjhKY011QXpybnFRMkRVMlZFRmVmV0QxY2IzTGRQaE1kQ04ydmJoUWkvenlM?=
 =?utf-8?B?TjdQMFNpbFBFNnkzOWIrakJtbmNMU0dSTmNoZHBtWVNTQ0QrWHUrMW8wdWRo?=
 =?utf-8?B?anBycjUwV3hLTkZYM0hVMlNpbTk1Z1VmRWo3U051RHplY2pVcjJEUVRSTXU0?=
 =?utf-8?B?R29VS0lPN2RTZ3o5K3hpa0dBVXVuQS9wMWxqMW5NeFMzbnJiR0plMFUxWWJk?=
 =?utf-8?B?TG1WR1BzZmFHdFZYZ2dTS21idzByYU5ZY2F1cTJLckRDd1VvclExZUJwbklm?=
 =?utf-8?B?ZnRhYTZPZlJyUWFMOURVdDM2dWxkOGErNnZKMWFnajl0WG01dkdQNWQ1YWpj?=
 =?utf-8?B?NS9KTXpuZHBlU0twditubDJQOVlDM3o5QnhlV0p3L0w1aHVYRUtUeGdlZi94?=
 =?utf-8?B?MHFNVXdoMlJzVkFySnRGV1hUSUxIeSs4M0VSK1p1clJ1NGFrNmg3dEdnUWFS?=
 =?utf-8?B?S2dURFJ6OGlsell0d3kycklabEZtTXVjaFRGZ3dDWXlyTURzaTNnaXhaajRH?=
 =?utf-8?B?a3NpQkZmdHFRUjBaOFMrM042eUVwbXVuMytodzkzbTU5YkVOalV5VUduRGJk?=
 =?utf-8?B?VXc4WU5uU0RDSzdnbXZQK3lnNXZGaDRrRVkrL2tzNnNENlFlREExWjdEVkty?=
 =?utf-8?B?VkppUktKL2lTNUI4UTFSUVFYdzk5L2F0OVlwc1ZOR1pJaUNNandBeFowY1FT?=
 =?utf-8?Q?RqxBc/gmf3QHNOreXu8KY+w6K/T9MTPSNV+JXRj+OVh5?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: febaa07f-2ca0-4ea0-e3ae-08d9f88f0c3a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 18:45:52.1489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GvevdDBvckd2wCPDaNHX+7XjA7VtFT7Ml9qrUZqSOuBokvBa5w913oiAkCpedkq70vlszXCiFylhmj+EjlBVzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3408
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10268 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202250106
X-Proofpoint-GUID: AE2VKIPTP_2Z4er74D-sCD2Oq7BGhSl6
X-Proofpoint-ORIG-GUID: AE2VKIPTP_2Z4er74D-sCD2Oq7BGhSl6

Hi Jan,

On 2/24/22 11:15 PM, Jan Beulich wrote:
> On 24.02.2022 23:27, Dongli Zhang wrote:
>> Hello,
>>
>> This is to report that the soft_reset (kexec/kdump) has not been working for me
>> since long time ago.
>>
>> I have tested again with the most recent mainline xen and the most recent
>> mainline kernel.
>>
>> While it works with my old xen version, it does not work with mainline xen.
>>
>>
>> This is the log of my HVM guest.
>>
>> Waiting for domain test-vm (domid 1) to die [pid 1265]
>> Domain 1 has shut down, reason code 5 0x5
>> Action for shutdown reason code 5 is soft-reset
>> Done. Rebooting now
>> xc: error: Failed to set d1's policy (err leaf 0xffffffff, subleaf 0xffffffff, msr 0xffffffff) (17 = File exists): Internal error
> 
> I don't suppose you tried you track down the origin of this EEXIST? I think
> it's pretty obvious, as in the handling of XEN_DOMCTL_set_cpu_policy we have
> 
>         if ( d->creation_finished )
>             ret = -EEXIST; /* No changing once the domain is running. */
> 
> Question is how to address it: One approach could be to clear
> d->creation_finished in domain_soft_reset(). But I think it would be more
> clean if the tool stack avoided trying to set the CPUID policy (again) on
> the guest when it soft-resets, as it's still the same guest after all.
> Cc-ing Andrew and Anthony for possible thoughts.
> 

The soft_reset on HVM is successful after I reset d->creation_finished at the
beginning of domain_soft_reset(). So far I am able to use this as workaround to
test kexec/kdump.

However, while my image's console works well on old xen versions, the console on
mainline xen version does not work well.

I connect to the console with "xl console <domid>" immediately after the domU is
panic (and kdump is triggered). I am not able to have the syslogs of kdump
kernel on mainline xen. The same image works on old xen version.

Thank you very much!

Dongli Zhang

