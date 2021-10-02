Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 101D941F8CB
	for <lists+xen-devel@lfdr.de>; Sat,  2 Oct 2021 02:41:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200884.355448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWT5k-0005pT-D9; Sat, 02 Oct 2021 00:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200884.355448; Sat, 02 Oct 2021 00:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWT5k-0005nV-9W; Sat, 02 Oct 2021 00:41:28 +0000
Received: by outflank-mailman (input) for mailman id 200884;
 Sat, 02 Oct 2021 00:41:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zBmR=OW=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mWT5j-0005nP-6q
 for xen-devel@lists.xenproject.org; Sat, 02 Oct 2021 00:41:27 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38c8f25f-2063-469c-955e-2fac1e3377c3;
 Sat, 02 Oct 2021 00:41:25 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19200osO012501; 
 Sat, 2 Oct 2021 00:41:24 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bdevvj1bb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 02 Oct 2021 00:41:23 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1920eYUZ069980;
 Sat, 2 Oct 2021 00:41:22 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by userp3030.oracle.com with ESMTP id 3bechsgtmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 02 Oct 2021 00:41:22 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BL0PR10MB2835.namprd10.prod.outlook.com (2603:10b6:208:31::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17; Sat, 2 Oct
 2021 00:41:20 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329%5]) with mapi id 15.20.4566.019; Sat, 2 Oct 2021
 00:41:20 +0000
Received: from [10.74.98.147] (160.34.88.147) by
 SN7PR04CA0220.namprd04.prod.outlook.com (2603:10b6:806:127::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17 via Frontend
 Transport; Sat, 2 Oct 2021 00:41:19 +0000
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
X-Inumbo-ID: 38c8f25f-2063-469c-955e-2fac1e3377c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=jOA1OW3f4FLdi3yHgOlrFGlyDwX0rJiFhNEb9s9/Nbw=;
 b=W5ffz/Yl9S0w35Xi+P24nXqLDo3Uu+pdmYnRwlrwQN58ULWTNLBGjusRLMK2o/mD6T1l
 NJlPO1JdwDijXZF9EfIXMWggIIYx1ld2yqlT4m9KnKF12DTARzo8gM+qaYzsoX+Nugp8
 k2eMd2An4rVkqgqP+QDLtDHe3OG3QtehyDcF2yv6l+IXDWiL3pa2rGbYGwaMPC/yBvMz
 iAVg/9Z2O/NP3TfRMYZfbaaFtUZXncvdoQ8o+KIAGdxYIUn6fjlMsZ5byLTXZI8b9Jn4
 ORiXMl4BbHUWSlYszOSE/UfmfxIVcjx8cd7yBJDOU+smDyXw2PuSKQ6DycV1kvb57WFM 5A== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8OXQaF9Axm0jZ8VQ20wEzE+hpV+VfuqG4MIGIrLiFl4ADsmHv2+983QFNIojDDVnyoF+qGeza4vvDQWeeFtQrC2fnxGJP/TfR++LYKAGMG8RZSTqxlaMIph1S6K113s//hLIJ1XKRPrDdaIARQKs4OjusByWTZCmZKvaXeg3WMN8vG4Ub81++Kxr423z+JjFCF8K98JSxE//xv1ED7c89QRX/bSYZrCNRNxEeho+0yBgsAFxEdaJ35RHnZyd/Z8mcSYjJgUB2RDTaNB1W9NzoG4JJvosZf11H0/uEIQMk2P8GuSOGWXGBryqCY53u2AZUOLBlbDS7Vwt9CxGYFxWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOA1OW3f4FLdi3yHgOlrFGlyDwX0rJiFhNEb9s9/Nbw=;
 b=Qgm0zyEJK1U5VZTcTRToJDsi612ez7i2KW+JxecMx+z7qRMS1nNYLfPAu+yD/HsUyWbC89EsA2O2K2ZarrCsaNUUWoDnmMEjLMMuCZ6eL2RBKtMhxG6J1muEVcNZ2aQZ7Clf4k6gE66hXkLIsXKV2Ehwlpndm8qoF0j5OAwp6MQFi0e033Tc5uC+XDO9fkE9PsyqnGBaUvR25F7to61C+0AQe6+ykhQqBNFIq6ZRHrXZh7y9m+3ux6aZMN9pl9hiqUJhWucCJFFeXiL3d6+qI3Xs6wNU/pLTAHP6f2Jl2AVMYiY/k127+bLTSakcyXHXJ29BJLA+PJ8ahilPtIH+oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jOA1OW3f4FLdi3yHgOlrFGlyDwX0rJiFhNEb9s9/Nbw=;
 b=OjeKvNV9q9xu5dPhK/AusHmZ9HN/sKn3g8bqnE7MgcfCpqBVW5UXknxcdR8ZlxGbzGvmvCTcG9+8RylaroZksRpZafmcvqnKucLGy0upDfN+d/Ji/4AoHBmNClb11i1JqUze2oODsXkpa5m0p9odFHd8gEO09Cuw0xZtkTTNu64=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH v5 1/3] usb: Add Xen pvUSB protocol description
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>
References: <20211001150039.15921-1-jgross@suse.com>
 <20211001150039.15921-2-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <e13367e4-2152-c99a-9b98-05d424019322@oracle.com>
Date: Fri, 1 Oct 2021 20:41:17 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <20211001150039.15921-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SN7PR04CA0220.namprd04.prod.outlook.com
 (2603:10b6:806:127::15) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6722244b-3698-4062-2887-08d9853d5a5c
X-MS-TrafficTypeDiagnostic: BL0PR10MB2835:
X-Microsoft-Antispam-PRVS: 
	<BL0PR10MB2835F75988731904618589628AAC9@BL0PR10MB2835.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BkwpCcilQB05rBdtsmQ9D+qdlOdLKWMuS2FBGtwNsZM8MzVTnQjEa3oh8BLBoZUIWrYgJOWPDNS+5PoBwddmNgIi05UZwU9iy15IxgCda+j+x2ms9UfLhGdPPxTJZ9YXIb3q2tZqxe47grU0ZF/2BRPwr4yyACH/J8loAYxiUN78t3Wgbpx970JscMxhDobdhiaiLIv7GDj3TpWt5vvGDLz9cMjToFmHgyJBQKhOkYvbQPVTB2lJc2WDaxscsgMDqio1mNNgx2qBGz3geGxrty55dy/FoFL/JIuhIKc/4yuchh9fW4h4ZbY+hy8l3voe3T5nQvmtupl/h0FXxOJuadm9Rl5oJgOy3AXLT1jnasmBcPxhAKzm6wXrZXhS+nVaIrNHyPf2eXm4r03rjBLHFgr8jWBjEwq14Cch/91FnWotjkujI0nW0d+0yI29kmZVD0SJybJklL2ghhSr9WoZjV9RiQy6aVhmjSvuR2quKo1bc1F0ENTipw5ANi7kPSyhM18rjDdFnJ12Q8pN7V2j298e9OWPrm14iBbRqmV5F35EEeGUyGWhL5vTds8IWxKp9smccepNd1OS1hzPBWriJRH9rZS5lyY+f/DnbekTsG/YJDV5iW36ZG8uDLaXDEFVa0G4LndpGJMpwKSSZaBr3V4WxEWOvz9BSjO2apPu6DBh4hc8OtNNxvfpLEV+tvmiTXgj6fJ+Z9zrXQUNSd191OUIzsNlyS77bGUKzw6DK9/cJo9HwbcSbDQ0HLrumBR4
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(44832011)(508600001)(8936002)(31696002)(956004)(6486002)(86362001)(2906002)(66946007)(4744005)(53546011)(38100700002)(2616005)(66556008)(26005)(16576012)(31686004)(8676002)(36756003)(4326008)(5660300002)(66476007)(316002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dnZwOGU4Ym9scHI2Q1NVSFRkb2duYms3S2oya3lWbkVQa2xXWWZRbDhwZzZ4?=
 =?utf-8?B?MC8zV3FpOEVSYzU3RVp1cVJDU1RwVElGekdQMjRWWHFOaHdxL1RPMzg3WEZW?=
 =?utf-8?B?bzJJYk5FaG5SRGtyWVQ1OWdPN1ZCTUpxWnpCanhVdXhsLzVaZmtiWjlBbUlQ?=
 =?utf-8?B?dFhUSDg1elVsWEhJVFdqdHFwMS8rT3ZyN3d2MlV6Vi9JTzI2ZWlGL1hSN0to?=
 =?utf-8?B?SnRSOG5QMUluV1IwNStiM3RzeS9vaCtRRjY3ZFJCSDM4NzJLMWpENXhuRWpX?=
 =?utf-8?B?djJBazFzVWFteHYvVkNyVGNZeVNOQ1pjUGRKYnh3MmZ0eDNXZEw5bWJoSGNC?=
 =?utf-8?B?Vy9NSENlaGU3R0lUN29wZWhHU1F6YU1qa3RUZkQwVWp6dEhPR3gvVEFoYzlV?=
 =?utf-8?B?alJrMHhUMUJKbWQ3R2YwTy8zZXFuVEd2emI0bnpCcUlSUjNZU2VUV09FOS9C?=
 =?utf-8?B?Q2QvN0p2c081ODAyRjd1Rkx0S0crN2dteGw2WUhhTldZbEdibExDV1crdzFs?=
 =?utf-8?B?cCt0UVRLZFE1R0drczhOMjROdUc2OFNjdWliait2Wkg0OFUyL3JRbDN4TVNo?=
 =?utf-8?B?aVVPWVh2cEVjYkE4WGJrYW5LWllrUEhGYVRtZWowNzVVU3BwcFRKMyt4MWps?=
 =?utf-8?B?UUFkTXI2ZnZWVFNicFVaUTdyRUlCQ1Y1ejI4VjZzWGJENitISjNhOUdCVVgz?=
 =?utf-8?B?d29SN0huUmNOeng2SmJUVTBld0I5NFFzMS9zRHRmcGJKS1NlRXFZOGVRWUpn?=
 =?utf-8?B?TC8rREVkWDdHNVVka2JHMkZlbmdjQ2pPajFSTUM1OXRKd0YvRndTYjJ6eTZS?=
 =?utf-8?B?T1NHOW82QUljL3pjNmNTK3V6R2FWVWErOUVJNkEwenpVWldLVmhTK08rSFRN?=
 =?utf-8?B?S0E2TW1nYnlQUDJyR1hLWjVOSllEM2Q1VVAxWG9VTVNXMXpacG4xaTh4T0Jp?=
 =?utf-8?B?bWd5eW5McjJpOXlIa1B3TDlMUk80TXFPTWhBYTd4U3dqYlQ1dEovd1NHWDdT?=
 =?utf-8?B?WUNGcHdVdm5YZ1RoZE9nbkhHa09FYTk3V0hrc3cvWGYxY21kREhMek1VT0xR?=
 =?utf-8?B?YTZyLy9KaDdXcTZvc01USWwvMjlGZkd5eW1wdFpFTGt6YW9EaEJ3YTBIaG5I?=
 =?utf-8?B?L1Zkano0Q3B3UGdOSm9zeUJ6R3hzTHZVOHlUZnZCaFpoV0g3dVFGYzRGSWsr?=
 =?utf-8?B?cnZXQTQ1RGh5ZnJ1Tkx2QTk0UGtrTGphVDlGNjBreTNMVnF0akw4cmhtYlRX?=
 =?utf-8?B?TDBBTUFVK1ZmdGdFYUh3TUxwV1ZMaWRaa3hmSDdyeHFuZXJjNEZnOEFUdDNE?=
 =?utf-8?B?dDZhSWwwU1l2a3E4SnorUVh3T1p1T1NiUDdla0NBNy9pL1JLZjg1UEZlY1E2?=
 =?utf-8?B?SUVsdmg5OG1Qbm8rbVRyQzNtdnl5ZW42aTdEV3lwR3BJbmNzenBDaG1tWmRY?=
 =?utf-8?B?aHlpUVB1bUJMSnpJekFPQVl1RzkvN0RkWWVLdGJzTWVEOU5hSW82L0JhaU9G?=
 =?utf-8?B?TVFMQXRDbnpQTC9rMEZtQlU0ejBOOStRNllCV0ZlaGJOeU84N0ViaVM3Q3R1?=
 =?utf-8?B?ZDB0Y0NaZ2FFbHVmZ3JHWHJ0R0NHbndtM25VWmRLeWJpL1pxWFh3R3F2NWEw?=
 =?utf-8?B?cUFIcE1oRkhlcGpoTTM3anJ6VFl2SjB2YTB2Y2FYaFdFcG5GTlJVMXNvL2RO?=
 =?utf-8?B?SUtxdHllbFdCcnYvSnFTcDNCYm00OW1nRkx6SGFoWEFZUU1jOVVwMTFpTGdu?=
 =?utf-8?Q?2+zDcegdcNJShHfoIVhAK85Qw9NoIvXXoGXimfg?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6722244b-3698-4062-2887-08d9853d5a5c
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2021 00:41:20.6478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rDhLROxoAdXP6X/9Q36TszibltVr0lXN8u6q8aUgWF66J0Ok1oXi+mG832zIOtgjAAXKauRE1tCI08eifSmFS7CqIQfDhNBzOkA/9PIrmYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB2835
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10124 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110020001
X-Proofpoint-ORIG-GUID: 2qMlHNNWSjhRUMUzUrM4TsP0pIE-2QlV
X-Proofpoint-GUID: 2qMlHNNWSjhRUMUzUrM4TsP0pIE-2QlV


On 10/1/21 11:00 AM, Juergen Gross wrote:
> Add the definition of pvUSB protocol used between the pvUSB frontend in
> a Xen domU and the pvUSB backend in a Xen driver domain (usually Dom0).
>
> This header was originally provided by Fujitsu for Xen based on Linux
> 2.6.18.
>
> Changes are:
> - adapt to Linux kernel style guide
> - use Xen namespace
> - add lots of comments
> - don't use kernel internal defines
>
> Signed-off-by: Juergen Gross <jgross@suse.com>



Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


