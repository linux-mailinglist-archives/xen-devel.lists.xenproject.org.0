Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F4E337C74
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 19:24:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96709.183281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKPxa-0006po-0f; Thu, 11 Mar 2021 18:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96709.183281; Thu, 11 Mar 2021 18:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKPxZ-0006pP-Ta; Thu, 11 Mar 2021 18:22:57 +0000
Received: by outflank-mailman (input) for mailman id 96709;
 Thu, 11 Mar 2021 18:22:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QxnR=IJ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lKPxY-0006pK-JY
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 18:22:56 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b75882ae-a83b-49fb-b91b-7531ba52f167;
 Thu, 11 Mar 2021 18:22:55 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12BIBa0w098091;
 Thu, 11 Mar 2021 18:22:54 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 37415rfjcy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Mar 2021 18:22:53 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12BI9YlP116935;
 Thu, 11 Mar 2021 18:22:53 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by userp3030.oracle.com with ESMTP id 374kp1cfm3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Mar 2021 18:22:53 +0000
Received: from MN2PR10MB3293.namprd10.prod.outlook.com (2603:10b6:208:12b::24)
 by BLAPR10MB4915.namprd10.prod.outlook.com (2603:10b6:208:330::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 11 Mar
 2021 18:22:51 +0000
Received: from MN2PR10MB3293.namprd10.prod.outlook.com
 ([fe80::b87b:5cdc:87f4:c465]) by MN2PR10MB3293.namprd10.prod.outlook.com
 ([fe80::b87b:5cdc:87f4:c465%6]) with mapi id 15.20.3912.030; Thu, 11 Mar 2021
 18:22:50 +0000
Received: from [10.74.105.6] (138.3.200.6) by
 CY4PR15CA0012.namprd15.prod.outlook.com (2603:10b6:910:14::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 18:22:47 +0000
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
X-Inumbo-ID: b75882ae-a83b-49fb-b91b-7531ba52f167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=T+KFszDK3IGw1hvZbM6oiEBYTY7rKXeRV+C7FukvB+A=;
 b=CKzvy8KyZDZALQJbj7UtPssvQo2RwylJ8HOX6lNZHQW1+WpuT07tXNGCWcSUvnt70eCF
 ODevmqWYVFp2oeDI20EibixIdxeWVm35dPNJA8KS+PW9zJ9dVx8ciJGgLaOe9jvpoZH5
 kPzDAf3nOTBe114RzWTkeenZ3Hyirl7YfBCgWTtKotTm6A0aGKPy45H6WMS3BqIL5buk
 PfT+7OvRrDj/PEZQCGJYAq0pR4lXcyBWFbGWpjYIEdh75s3lb2N1GdLP0x8THB859agd
 vWkyFvq7B+6caqBu5H+LlbuKHpztRawID91ch8XpX9QoQVE1WHvxtULyUobMrK/wJjnH ow== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWaFYBRG/0u8xMXr4Fz8jx8BVPM0X68NrgErrycb5cfL/0M6Y5ASAXEoh4166qKMs6xvhS95Ec1EkyddeX3VO1eHqwtdhH2WEZE75UVe/7rWv7spjMgBm69vHfUyIaZBUoOHNfsoBIMWjPgL3Kwkn6c9NcPmcLpTOoYVM8JAKHY/ERR89cOVxsyo8vnUYAc0qi6bK6ygT1NQAR1IreJxh9aYN3VtVPTJt+lx31Ip+3WajyogS/SpU/j2SvAxhJsW+WYtjgJAZmAjDTtveqnsW6S81nf3/KH4dfSMOrUf9CTRtU9zUUyecHIIV68qY5ZBglU/W16k2dnRIsFoZF5ZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+KFszDK3IGw1hvZbM6oiEBYTY7rKXeRV+C7FukvB+A=;
 b=Lxi4U8yyZ0IqcT93PGKcauVuCBeN4Eac7h6ow/GXOMvOMxdtUqqt+9XGQSDGlw7QQNEEbPKUzOCDsPb/MDW51wmbrCnKZ15ckKIWaLzRk876YznStQqi6zwaqI1MMvG3Wq6TlFmxuWQ8N9VviVRi8cnMnMnwLnpM6mMyx5D+vqezSTlJ3lMKgW6kfhDaUMfKeRNm3LpBJJf+VgyDHhJWgWF+j1HQkhGlIUi41j5V1CUKWTMxAdJ94ck4Hl7pxxnNFZTQOsErBHGRTDAKSNG5GP255AfDrU6LmeN0vmK7zTticaGqx951ng/81Gh+I5g0hCPyb8+q7WXWyxz/zQjwEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+KFszDK3IGw1hvZbM6oiEBYTY7rKXeRV+C7FukvB+A=;
 b=P2URlzsfJ5zmZiHZ0+y14LWPr+lovDW6Sz7In6N9C20C3dDc+FebZWe49/yp2y14MAk8VysPr3z5oWTTUCsbEjrW0WCxehJBNpoWQwIFNKNd7VJL5jePvinP9xEULo7/AmkkR6b4GrGnCIuLCRYKquabg0iCmivPYksEYj5Yzug=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
Subject: Re: Remaining MSR wrinkles
To: Jan Beulich <jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>,
        =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: committers@xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <YEj39oqZA0y/af0c@Air-de-Roger>
 <24649.6523.991714.489131@mariner.uk.xensource.com>
 <78536b74-2e6e-02ae-6655-d14fd97b3d37@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <766efe2c-2361-9ddf-2ebc-b8ff808673b4@oracle.com>
Date: Thu, 11 Mar 2021 13:22:42 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
In-Reply-To: <78536b74-2e6e-02ae-6655-d14fd97b3d37@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [138.3.200.6]
X-ClientProxiedBy: CY4PR15CA0012.namprd15.prod.outlook.com
 (2603:10b6:910:14::22) To MN2PR10MB3293.namprd10.prod.outlook.com
 (2603:10b6:208:12b::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90ccbcf9-e65d-48f2-0668-08d8e4baadac
X-MS-TrafficTypeDiagnostic: BLAPR10MB4915:
X-Microsoft-Antispam-PRVS: 
	<BLAPR10MB49156A2F54D05A17C9CFCAD58A909@BLAPR10MB4915.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZM9TWrlrkUmsufHXnTaAh/izzo5msJ0wnCywMPyIbFrsNTyRx0vc+F1eUxKOOJ/M8RAvFM6hypNw7G3/oLcac2dOCiQvEArxrH05fvkCrHRDcNFYkJMCcMIwWwL8FjWpx8YOzWAO0u/gRPWupK1taMP46/TaHXksjJNuIeddRGy29ohvEzuL2Fg92JRgnR2Q5kFkj9xHawpV4nOrnmpaanLUr/DML41tsXkIK1w3wR7nex1kHHZejFt488o8AO3wxBYjaUbRdVP3bDMBPo5gSxOiXfukUItpdzFPP9Wj0ka8Jd/foVDTxvyvUWZSBLz/4yz59HyZgoOoTsWCu/hCcZ3UarGH2ACnxkNEIbX+oajOCkwl7spnxoOo06//SIc5r85GQbQByjx7iWFb0okGiHVN6B39gdCruw/RUgKM2TEZBkLxrWXuStxH8+h4wcR5mBV5mQB+UiR5A5noB5gxMyE9/1ZZJqco5s9UyHAVhlLSvewe3Bo5do3mv3eEEiWFM0kJwe8xwML7LYCMzScK9rwkxkp0uYQ7POpglIGR1pslTyIrzJHLaftcv6DQVbWQK6vKOC9dVGkV/HqqNgq4rAv8LcAIjI6Qa6LrLblnO9ra5VZE1xHInZmTSznH719k68Kmz8NvF1V4/jx5BDEnslh5Ua5yRyx/Db3WTLIP1ZC2tl6gmH79q3NjL400TRTK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB3293.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(376002)(136003)(366004)(396003)(44832011)(956004)(4326008)(2616005)(66946007)(36756003)(53546011)(2906002)(26005)(8936002)(66556008)(66476007)(966005)(31696002)(8676002)(6486002)(478600001)(6666004)(31686004)(110136005)(5660300002)(3480700007)(16526019)(16576012)(186003)(86362001)(7116003)(316002)(83380400001)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?UEJaT2U0SE5TYWdrNE1mUWxJcHZYVDduZEVVME9vbUVXbk5udXBWWGxpTGl0?=
 =?utf-8?B?cm5BRG1ET1VveExmUDh5dnJvOGtDeDNDOEtnQU5yWW9YcE0vTWdLVmYxTTRJ?=
 =?utf-8?B?UWs4MXhpU1JRemNlVUlsQ0UyR25zNllrTWx4eGpLTGVsYU1yYzJzT245Vzk1?=
 =?utf-8?B?bjlhZW1vNzVhL2tnbTlzdFRqZnVlejFjankrUFQ1STBXajFucHAyTEVEdS8v?=
 =?utf-8?B?T3U5MlhPVERnMGh0djZrdUIzTkdFWjM5Smd4Mmszc1J0aXVpTytOYXR1eHA5?=
 =?utf-8?B?L1Q0dDBmangrSkFqMTJ5WG8xTWxGMDl2YUJvOW9JZ0YwaDRXSU54TU9Va0JP?=
 =?utf-8?B?V1ZXL3NXRHA3UU5BdzJqTHBxNys2VmhpSmh0LzZ0VkJHWWVqaGxUVWN3RUoz?=
 =?utf-8?B?dFlHZG4waklONmZLK3JrSVN1bjd3cHpaQXYrb2Zoa0lCSDRkbWZZNUlreUFC?=
 =?utf-8?B?UnFKdWptV3MyTmtCOW95T1VyL29GcDNsdFRuY2YzRGZsU3hiRW81Q1czdE40?=
 =?utf-8?B?NmlwdXNKNnA0K3JuM1BhKzlyanVTblQwTHBrSVBPNGlrNGVaL2JpMWpNaG01?=
 =?utf-8?B?cjBrOGVnbzlZbHN5OVFHdC9mbXdKdTJ6NlQvckdvcG4xVlBnQ1hvbk52Tkw2?=
 =?utf-8?B?a041QnUxcHprUGI4T3UyWG5HbUN3NE5vb012VWRFSXhmakNHSFpOcnNvbVlx?=
 =?utf-8?B?d2kxZEJlWXNnSFZVQU55ZE1KdHFWRTNHc0lMN21ZMTdUcGdHY25KQjQwVGM1?=
 =?utf-8?B?WUFhL3pxM3ZBOFIyR3k2MENwZHRYa2Z1Um9mSUh5TXpIWjZtakg2bEdhSVRk?=
 =?utf-8?B?eVZYR0QrRmJNV3JOQjdDNThwc3lIbHMxSTFONzA5TllteUNhazRwS3ViZ3FQ?=
 =?utf-8?B?N09IRGZvNEhRNkx2MkRyVmI2K3ozMnBIdXJwejFZUDdyOXRwcHRNMlhxTHd1?=
 =?utf-8?B?NG13M01FSzh0dTVnVXp4NFB6SCswZG9KT2J2dHlSR3JJbXVHMkFTcUNWZ0pl?=
 =?utf-8?B?TGR6ZitUaXd1WFZoZnJGU0dVMmNpL2FPcDNqVERBdEk2dVgrdXYzUFdaOHo3?=
 =?utf-8?B?RGdwS0d4WFZTZXhqcUhGbWo3aWVST2tnUnJhODJ5aHFDN3BOY1FSejFmMHN3?=
 =?utf-8?B?Tmc1QzNEaVdGcGpyQkJCVHExTFFCMERPbXVXQmVHT1RZSDIyRFRKeHpXbWp6?=
 =?utf-8?B?UDBCSlhHbjdhS21zT1FjQ0dnazNJMXpSTER3ZENJU1BUblIrYTVOUkg3dXR2?=
 =?utf-8?B?SW5GOUVDUEkxVkF3RjVxbVZkT3RiQ1UvRXBGMEw3OHhDRjRZNFNYaFhQKzdj?=
 =?utf-8?B?U2dXV3ZKNjFZMUdabE1SRm5DSksxY3N0TjNtZUxjYmsrNEdLT2xlOTcxREcw?=
 =?utf-8?B?bVNLemlOMjdNVGk5ZjJzcHhSK1Z2U0RPdWI1Q1MxSWVZVGFad09KakhPMGxa?=
 =?utf-8?B?RVRUay9Ddm41Ynk4SlhKaDZBcVY5dS9jMlluQ1F1VWhDZE5LMTltOTNhbS95?=
 =?utf-8?B?SGo5bXErd0NJUGN5YVhKa1VvUUdERjlRaTRiN1BHb2RtRUlXSzRJQ2VlMHpI?=
 =?utf-8?B?SEtXSlJuTHVLeWErN0s1czJpa0FmcmZVYkFiWjJkeFRiQ3NiNnNMakw4KzFL?=
 =?utf-8?B?MWVhK245L1Z0SmdlSWNhL0F3TEZEV0xFOUhSZ1BEakkwZXdtTTdNSTMyYUZu?=
 =?utf-8?B?VWM1czFWNktMbkxuMWc1SnhqUXREbEE2cXhoQVZkVkZQVEVSREp5RmdSaERa?=
 =?utf-8?Q?+OzTf3bh9Spsf6vr8627d95QerT7XdBVkGQG11a?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ccbcf9-e65d-48f2-0668-08d8e4baadac
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB3293.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 18:22:50.2796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iEz2XcpN6YdEuRWvC7fSg5InwJOfHSDhe4SdzrXf98qQHqAUylIMl/i8CDZD6Q2eDsNe46ht6G7wpgnN/8YqdKmO2DfFL/QRe2Q0gChoRJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4915
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9920 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103110094
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9920 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103110094


On 3/11/21 2:55 AM, Jan Beulich wrote:
> On 10.03.2021 20:09, Ian Jackson wrote:
>> (I bounced Roger's original mail to xen-devel.  I hope it made it...)
>>
>> Roger Pau Monné writes ("Remaining MSR wrinkles"):
>>
>>> 2. RAPL_POWER_LIMIT: handle the MSR explicitly to make Solaris happy.
>>>    Alternatively we can list in the release notes that Solaris guests require
>>>    msr_relaxed=1. Andrew is working on a patch for this.


MSR_RAPL_POWER_UNIT (in Linux parlance), i.e. 0x606.


>> I would prefer to handle the MSR explicitly, for the same
>> compatibility reason as above.
> The question is here - we aren't sure yet that this is the only
> one, are we? Andrew suspects if this one MSR gets accessed this
> way, then likely others will be, too. Boris, can you tell for sure
> either way?


The only one that Solaris reads on boot in 0x606. However, a few more may be accessed unguarded if kstat runs, as I mentioned in https://lore.kernel.org/xen-devel/4fc3532b-f53f-2a15-ce64-f857816b0566@oracle.com/ (I have not been able to empirically verify that)


>
> Also, Boris - any chance you could give your Tested-by for Roger's
> patch? It's otherwise ready to go in, but I'd prefer to commit it
> knowing that you've tested this hopefully final version. I'm sorry
> for the recurring requests to test this workaround.

For v5:


Tested-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


