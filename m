Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4113A6CB8
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 19:06:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141753.261742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsq2c-0005HI-3I; Mon, 14 Jun 2021 17:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141753.261742; Mon, 14 Jun 2021 17:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsq2b-0005FQ-UC; Mon, 14 Jun 2021 17:06:25 +0000
Received: by outflank-mailman (input) for mailman id 141753;
 Mon, 14 Jun 2021 17:06:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EgT/=LI=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lsq2a-0005FK-Ot
 for xen-devel@lists.xen.org; Mon, 14 Jun 2021 17:06:24 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82592fde-6a8d-44fa-a0f2-d0d36b5c89b5;
 Mon, 14 Jun 2021 17:06:23 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15EH5fAm155348;
 Mon, 14 Jun 2021 17:06:21 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 394jecc431-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jun 2021 17:06:21 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15EH0tMg075761;
 Mon, 14 Jun 2021 17:06:21 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
 by aserp3020.oracle.com with ESMTP id 394mr6y44u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jun 2021 17:06:20 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB4224.namprd10.prod.outlook.com (2603:10b6:208:1d1::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Mon, 14 Jun
 2021 17:06:18 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::78a3:67d:a8ca:93cf]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::78a3:67d:a8ca:93cf%7]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 17:06:18 +0000
Received: from [10.74.101.149] (160.34.89.149) by
 SJ0PR13CA0147.namprd13.prod.outlook.com (2603:10b6:a03:2c6::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.9 via Frontend
 Transport; Mon, 14 Jun 2021 17:06:16 +0000
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
X-Inumbo-ID: 82592fde-6a8d-44fa-a0f2-d0d36b5c89b5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=pOhayWF3jHa74pK6+doXkbZAgoBrEXaNbZOgZRCzPEQ=;
 b=islfppfPep/x6R1Q083IL22mQAzI5i28ewD8jiSjieH6evSFrj0yY09y2rK0OeDS9wCf
 B7X318L5YcGQ556dcNAZunpFHVl4pdlIinrf+onGY035tj8YVRCms4HWk13iGIeCd8+Z
 yj0SbUsYOuy5hWKnMKa5BJlvuBavvSdMBIH/SwJySn9BpMvyln13Qw6eGS0f8IW1q5+i
 oHemsjuQYRwuyw/u7GjDMhTBDuw8DvUV9O1O4lxoDbbSuQrIeL0+mqduQ0VofWzi8uWv
 uLawpkJ0KFlaFJVeyBuWeJ5bmtjJUTBpZn1mDoLP5Q75kkHO9YRNZgGKv4d4BfUjxspo wQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0bGJeqWhUWj9y3a2e7ISHHwBJideCpoxz6o9YCVqeDUA2cdd5JKRk6VfkXIgWDdUlNdC/wjRdP6XE3Lbh15jhCnAGEWFw8hYSqd9eWGyfiaCyjvhiCcLMDPuVilH1CbCvDucgTI5T8JKbtDbXtCU1kCXPSg3ka9GCWF0Vy3ciLpwJ8crZz7fkzThIRwwtn0NDMmoNiBfzy0LCJ5t+R0h7vuf0eNX2WcGBAMPMViBSBAlWwt1ABq1Sf3Esll4HvCwiX+xuA4sU5+XhZdx+62VUwQjD2zRSvA05o5LnQ22Ax18kDWxcqfCNPbC5PXZ0xewW7lsR8UGvO/gXsJFAsPzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOhayWF3jHa74pK6+doXkbZAgoBrEXaNbZOgZRCzPEQ=;
 b=jdc0ksrfuwWKwGz2bpOjEhdxln5hr34e9uUiwpS4TU87u1nzCZt7484rIjk4V0qjVQJCd3CBQsHwVEuzOOkC61OKhm68cfNZ1oBu6p1TBl8pL6QB8JQ/rT3wsa6GoECjC/7RWNAdHt7AQ23v4nQ1i3td/Z6Il9xx0PyojJ7A5AxDXN+vSRjFq66w5L2xeV3luYpesWLIE3lSFHNIBMS/I+xeHoM6Q5k+5zVLVf3NPwetPIcxOy+0XfrlYZAEnEvWwaZ4eoc2GEYxAXNHprJcJ4NmHcomrH5h4JkPedmS6c1eyr7WHggMJvlNBFZP9x8UO+J1wIAPxlEhvLqrrGJ+Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOhayWF3jHa74pK6+doXkbZAgoBrEXaNbZOgZRCzPEQ=;
 b=grQ2fgzAQ9+XhB9PYmHa2qAvlY8si+GAb6yPrQIeThL89SBTPeRbSUoleXljxRL2ujgo2YHXBy773gtVUFlgxzp5UHIqKB+4j6JZTGv+nvxvvWbo3T8UN1PyLCuVtZebth0Gv+2z6HlxRgRMALN9iVsIYZ7270bX0XKoZMrrA8Q=
Subject: Re: BUG in 1f3d87c75129 ("x86/vpt: do not take pt_migrate rwlock in
 some cases")
To: Andrew Cooper <andrew.cooper3@citrix.com>,
        Jan Beulich
 <jbeulich@suse.com>,
        =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xen.org,
        stephen.s.brennan@oracle.com
References: <0efd0099-49bb-e20c-fe8d-fb97c9de2b63@citrix.com>
 <74378af9-5d04-f95e-3957-918cf5c81ded@suse.com>
 <YMdZKuKOnFKpQ3sg@Air-de-Roger>
 <3e9f4ea8-2fca-bf66-6345-0b73b960cba7@suse.com>
 <a7ec2d98-465a-9691-ab73-bef5b45a6cfd@citrix.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <45cd516b-326f-a0e6-325a-fc0debd48571@oracle.com>
Date: Mon, 14 Jun 2021 13:06:12 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
In-Reply-To: <a7ec2d98-465a-9691-ab73-bef5b45a6cfd@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [160.34.89.149]
X-ClientProxiedBy: SJ0PR13CA0147.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::32) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 943b8ecd-145f-4bc8-485d-08d92f56b9ae
X-MS-TrafficTypeDiagnostic: MN2PR10MB4224:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB42249C9B36F92564AFFCE6AD8A319@MN2PR10MB4224.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BpZXFAD+wvgLogMdG5XIXQJ6Icnhmr9LYWfC7INehCjVyyJJ4yosLXgAP+GVzIS2eJpajm+TKjgwSzFYBYIgK+rJKHGiMQqwJScij9C4H2IN4/idaHns5DTYoZh6pKTfkJetLqKIGX8dLNXjJoLQFYF9dQcdd+FJKAPIHH4uF8oZ38gNFIOYoi+NThNBJ60oNOFJQC9jfSLuPhqzMNHG5IC1GPf4JN53xNe3Fgn7qDAU9wFPoVfzkvu2hpCMiUA/yqwh7A3UCljbY8jKHe45ELFmpjOrAnyO85OYxfyywTzthLPpHWq0KBmweyMi49GVRfv0tOiDbV1Tkv4W91PkOlDUVrwduxbqDJNX03h/GLYF5wLq8kMDevDM8Z0jm/xPUCp4GQcta8dvo32LqNX0921zmDqm99Apw7cVVsAoTSAdV9fqGA0jlY5303++J7q0lXou4io772yGqltT1WIvk0BI5MrsAGcKnRfKDFU0wKBDjP4J03Yh3cc96koYc3HLyNm/28colAaKNdkbZMgEyahhUQNyBY1M5HvOoQLHYz4OtFGbub4o+ubSkGYXlbRRbBWHSGxywcOokb+vyiQEkkMwWcD+iWpHCouEWjCjG/PfEpeLjBoZKx0IFBM6kE32Q4oa+H09CVzFkxat5pOklersySoBuJn5/8PCVaM30fTbYxl4awBmLZFHzjdXfL/f
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(376002)(136003)(366004)(39860400002)(2616005)(956004)(5660300002)(478600001)(6486002)(83380400001)(44832011)(186003)(31686004)(31696002)(16526019)(38100700002)(53546011)(4326008)(107886003)(26005)(36756003)(6666004)(8936002)(8676002)(86362001)(316002)(66556008)(66476007)(16576012)(66946007)(2906002)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZXhDZW84eTcvSTE5TEpqSDg2SHZCY1A2UTRCZGtoZ2pUcmxPMXlvMTA4L1hz?=
 =?utf-8?B?WVFzUHFsNFhWTE5sQTNXSERxLzJtdjBNVDF4OXI1OWp6aXBQMUxkSFBDL05M?=
 =?utf-8?B?cExOd3h4SGlXY0p2TFROMjRqM2dNRG9TYTZEcVRPUnRTb0VQTFA5WWw1QTND?=
 =?utf-8?B?dGwrL3BPSjRkaFV3dURLMU41eS9DdWNndFVCcEZpZkhuc2pmbSs4RXFFb1c1?=
 =?utf-8?B?MC9rVjkybGxBNUpoa3NVTmlQbk15ZVZHLzQwQkZJZmgwZUNUcU00R3I3eXY5?=
 =?utf-8?B?blYxcUh4MjV0bjExNXFVM1JwQWwzdGhudzZkam9PMnI5ai9XS2NqVWxQdEhG?=
 =?utf-8?B?Y0FZbUJpZTBLcTVjYTlIQTZDelJybGlNVjM0aXkzK2hja0dnWnE0YTR2RWU3?=
 =?utf-8?B?VFcyWTJBVTZCSE9sYmp6TnRPemE5dUpkQUZYNVcvNldiVmp5THkxRW9EWU1J?=
 =?utf-8?B?bEYyT3A0Qnl1d3NUNWpKRHkxMHVQT0lzL25pbDJDeS8zSW1BNnFOK1AvTDJB?=
 =?utf-8?B?ckhraVBSVWNvRmllbVV4ZVBkNmgxbHN2TzkyTllvMEVSdkNOTnlDbkJCK21I?=
 =?utf-8?B?SDRkeFJCUFJkZWFEbWhxa2Z5blRCRmtGcFcwYTBDd2tUVFRvbjlUSDhnL3By?=
 =?utf-8?B?YWlZNU5YS3pTZmJYSFZ2bUlXZFNiK0NXOWplRCszNUVuelBSc0U3NzFqcnpP?=
 =?utf-8?B?RjdXUFkwaHArcXlpdTFiTStoWERjTzJvNjBjZnZYSzRlTTNyMlcrTjcvVFRk?=
 =?utf-8?B?K29XS2tjUnVxdXNWYkdILzJ3RnRWS2tBTWtwUVBSMUc3TC9FRk14WGtLSDl1?=
 =?utf-8?B?Y0VHbEZaNVFJUHA5RkgyQ0ZPODRuT1NSMDZNUlN5ZHhIdkdVOUtwSm5jNEpl?=
 =?utf-8?B?V2dxVThnR21pemNQZjF0N1BRSDdoci9JM0dXMGk5OEFTVGtrVDV0aXRkMHpO?=
 =?utf-8?B?b2F5ajFKb3dWakZxM3pvbzdHMUNZdDYxaHR2RmJGMnlFOXBFdmJxWGVnOXpW?=
 =?utf-8?B?eXFsMWQ5MzdUdThxb0NGWGx2ems4RnFXL0gwdnd3YzBFeXpjQWZuQWl1QzMr?=
 =?utf-8?B?QXk2VXhlRUpRVFNURHNqVk5VZVdmYVJDdjRIcDh1ZTJOamx1R0UzUmVjV3Nx?=
 =?utf-8?B?M0x1bms0YWRGQzlkbGdkeU0zRDFTam9wVHNwclBxRVdkbnFNRWZaN25wZzJk?=
 =?utf-8?B?cGYweHZUTGFHQ2hnRWQwSXl6VFJjVmNzc3prbmNQN1dZL3Fyb2hVQ1FNMVow?=
 =?utf-8?B?T3ZGZEJ5UE1vdjV3N1RCbWpWR0dtemc5SGxDNlZSMmY1RjJsaDJ2MUdZWXp3?=
 =?utf-8?B?dXNxQVJnMmFkRWtTcWQrL0FrSXl2akd2YUd1OEROWDhiQjdvS2QyczJ0ZHAv?=
 =?utf-8?B?SWROZTJjTWpUcjdSS3l5MVJTdXk1djRtWlduTy9zZHcwNmRhdERTOXMrUDlB?=
 =?utf-8?B?Wmp0Q0E0MkZRb09ZU1lHbDlaWXZvWVNKdy9jM3ZLQ3hYQ0F3ZVI1dWNZV3Za?=
 =?utf-8?B?QVpQUTBqcmpxbmowT3hiUjh6RkFhb3FpK1RmdVNMdjN2YnBHem9MS2dOUFZJ?=
 =?utf-8?B?VXRDUm12a3U2SFJHdkFzOTdubkZ0d3NOTGZOY0xCZ242MGRqbXJMd0p4dXlW?=
 =?utf-8?B?SFM3U3RLTVEyOG03WDV6T3FaMVI5SVZzTk9kbzdZa1NsOFRxYUVlV3lLQk5S?=
 =?utf-8?B?eTNtMlY2bDk4TmZWSnR5Q2swQTNUb3FnRktKYS9leVlyZmEwcS93cFdYeFZG?=
 =?utf-8?Q?u8ZMYGzi70nlxk42YyTKNWuO3IFgXzYH/tJmvXD?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 943b8ecd-145f-4bc8-485d-08d92f56b9ae
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 17:06:18.0566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uLcWn4S7DEExEVBozerTBKEVAXxk6R7Ifbq3fuB67uzyMEsydLddvsKKEbsm6IYBlEyxjoeTNJlTNIMjSxjNfjIFt66s2hLdW3fJ9DO+1RU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4224
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10015 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106140108
X-Proofpoint-ORIG-GUID: AgmiMJrp3skUPeKHQaePqYe0CObT7eqU
X-Proofpoint-GUID: AgmiMJrp3skUPeKHQaePqYe0CObT7eqU
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10015 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 phishscore=0
 bulkscore=0 clxscore=1011 mlxlogscore=999 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106140108


On 6/14/21 12:10 PM, Andrew Cooper wrote:
> On 14/06/2021 17:01, Jan Beulich wrote:
>> On 14.06.2021 15:27, Roger Pau Monné wrote:
>>> On Mon, Jun 14, 2021 at 01:53:09PM +0200, Jan Beulich wrote:
>>>> On 14.06.2021 13:15, Igor Druzhinin wrote:
>>>>> Hi, Boris, Stephen, Roger,
>>>>>
>>>>> We have stress tested recent changes on staging-4.13 which includes a
>>>>> backport of the subject. Since the backport is identical to the
>>>>> master branch and all of the pre-reqs are in place - we have no reason
>>>>> to believe the issue is not the same on master.
>>>>>
>>>>> Here is what we got by running heavy stress testing including multiple
>>>>> repeated VM lifecycle operations with storage and network load:
>>>>>
>>>>>
>>>>> Assertion 'timer->status >= TIMER_STATUS_inactive' failed at timer.c:287
>>>>> ----[ Xen-4.13.3-10.7-d  x86_64  debug=y   Not tainted ]----
>>>>> CPU:    17
>>>>> RIP:    e008:[<ffff82d080246b65>] common/timer.c#active_timer+0xc/0x1b
>>>>> RFLAGS: 0000000000010046   CONTEXT: hypervisor (d675v0)
>>>>> rax: 0000000000000000   rbx: ffff83137a8ed300   rcx: 0000000000000000
>>>>> rdx: ffff83303fff7fff   rsi: ffff83303fff2549   rdi: ffff83137a8ed300
>>>>> rbp: ffff83303fff7cf8   rsp: ffff83303fff7cf8   r8:  0000000000000001
>>>>> r9:  0000000000000000   r10: 0000000000000011   r11: 0000168b0cc08083
>>>>> r12: 0000000000000000   r13: ffff82d0805cf300   r14: ffff82d0805cf300
>>>>> r15: 0000000000000292   cr0: 0000000080050033   cr4: 00000000000426e0
>>>>> cr3: 00000013c1a32000   cr2: 0000000000000000
>>>>> fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
>>>>> ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
>>>>> Xen code around <ffff82d080246b65> (common/timer.c#active_timer+0xc/0x1b):
>>>>>   0f b6 47 2a 84 c0 75 02 <0f> 0b 3c 04 76 02 0f 0b 3c 02 0f 97 c0 5d c3 55
>>>>> Xen stack trace from rsp=ffff83303fff7cf8:
>>>>>     ffff83303fff7d48 ffff82d0802479f1 0000168b0192b846 ffff83137a8ed328
>>>>>     000000001d0776eb ffff83137a8ed2c0 ffff83133ee47568 ffff83133ee47000
>>>>>     ffff83133ee47560 ffff832b1a0cd000 ffff83303fff7d78 ffff82d08031e74e
>>>>>     ffff83102d898000 ffff83133ee47000 ffff83102db8d000 0000000000000011
>>>>>     ffff83303fff7dc8 ffff82d08027df19 0000000000000000 ffff83133ee47060
>>>>>     ffff82d0805d0088 ffff83102d898000 ffff83133ee47000 0000000000000011
>>>>>     0000000000000001 0000000000000011 ffff83303fff7e08 ffff82d0802414e0
>>>>>     ffff83303fff7df8 0000168b0192b846 ffff83102d8a4660 0000168b0192b846
>>>>>     ffff83102d8a4720 0000000000000011 ffff83303fff7ea8 ffff82d080241d6c
>>>>>     ffff83133ee47000 ffff831244137a50 ffff83303fff7e48 ffff82d08031b5b8
>>>>>     ffff83133ee47000 ffff832b1a0cd000 ffff83303fff7e68 ffff82d080312b65
>>>>>     ffff83133ee47000 0000000000000000 ffff83303fff7ee8 ffff83102d8a4678
>>>>>     ffff83303fff7ee8 ffff82d0805d6380 ffff82d0805d5b00 ffffffffffffffff
>>>>>     ffff83303fff7fff 0000000000000000 ffff83303fff7ed8 ffff82d0802431f5
>>>>>     ffff83133ee47000 0000000000000000 0000000000000000 0000000000000000
>>>>>     ffff83303fff7ee8 ffff82d08024324a 00007ccfc00080e7 ffff82d08033930b
>>>>>     ffffffffb0ebd5a0 000000000000000d 0000000000000062 0000000000000097
>>>>>     000000000000001e 000000000000001f ffffffffb0ebd5ad 0000000000000000
>>>>>     0000000000000005 000000000003d91d 0000000000000000 0000000000000000
>>>>>     00000000000003d5 000000000000001e 0000000000000000 0000beef0000beef
>>>>> Xen call trace:
>>>>>     [<ffff82d080246b65>] R common/timer.c#active_timer+0xc/0x1b
>>>>>     [<ffff82d0802479f1>] F stop_timer+0xf5/0x188
>>>>>     [<ffff82d08031e74e>] F pt_save_timer+0x45/0x8a
>>>>>     [<ffff82d08027df19>] F context_switch+0xf9/0xee0
>>>>>     [<ffff82d0802414e0>] F common/schedule.c#sched_context_switch+0x146/0x151
>>>>>     [<ffff82d080241d6c>] F common/schedule.c#schedule+0x28a/0x299
>>>>>     [<ffff82d0802431f5>] F common/softirq.c#__do_softirq+0x85/0x90
>>>>>     [<ffff82d08024324a>] F do_softirq+0x13/0x15
>>>>>     [<ffff82d08033930b>] F vmx_asm_do_vmentry+0x2b/0x30
>>>>>
>>>>> ****************************************
>>>>> Panic on CPU 17:
>>>>> Assertion 'timer->status >= TIMER_STATUS_inactive' failed at timer.c:287
>>>>> ****************************************
>>>> Since this suggests a timer was found on the list without ever having been
>>>> initialized, I've spotted a case where this indeed could now happen. Could
>>>> you give the patch below a try?
>>>>
>>>> Jan
>>>>
>>>> x86/vpt: fully init timers before putting onto list
>>>>
>>>> With pt_vcpu_lock() no longer acquiring the pt_migrate lock, parties
>>>> iterating the list and acting on the timers of the list entries will no
>>>> longer be kept from entering their loops by create_periodic_time()'s
>>>> holding of that lock. Therefore at least init_timer() needs calling
>>>> ahead of list insertion, but keep this and set_timer() together.
>>>>
>>>> Fixes: 8113b02f0bf8 ("x86/vpt: do not take pt_migrate rwlock in some cases")
>>>> Reported-by: Igor Druzhinin <igor.druzhinin@citrix.com>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> Thanks for looking into this so quickly, and sorry for not realizing
>>> myself when relaxing the locking. Adding the timer to the list without
>>> it being fully initialized was a latent issue even if protected by the
>>> lock initially.
>>>
>>> Provided testing shows the issue is fixed:
>> I guess the change here is needed anyway, even if testing finds there's
>> still something amiss?


Yes, I think so. Thanks for finding this.



Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


> We've put this patch in for testing, but results will take a while,
> because it only showed up in our weekend stress testing.
>
> ~Andrew

