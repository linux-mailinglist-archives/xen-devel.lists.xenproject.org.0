Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EB143E094
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 14:12:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217960.378203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg4GP-0002ny-N8; Thu, 28 Oct 2021 12:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217960.378203; Thu, 28 Oct 2021 12:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg4GP-0002m0-Jn; Thu, 28 Oct 2021 12:12:09 +0000
Received: by outflank-mailman (input) for mailman id 217960;
 Thu, 28 Oct 2021 12:12:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dsiD=PQ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mg4GO-0002ls-Jl
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 12:12:08 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4b335d9-6488-40e5-9ac1-c14e431a9521;
 Thu, 28 Oct 2021 12:12:06 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19SC1lDT027005; 
 Thu, 28 Oct 2021 12:11:59 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3byedajse1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Oct 2021 12:11:56 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19SC04fV073886;
 Thu, 28 Oct 2021 12:11:55 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by userp3020.oracle.com with ESMTP id 3bx4gsng66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Oct 2021 12:11:54 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB4255.namprd10.prod.outlook.com (2603:10b6:208:1d2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 28 Oct
 2021 12:11:52 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329%6]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 12:11:51 +0000
Received: from [10.74.110.188] (138.3.200.60) by
 SJ0PR03CA0204.namprd03.prod.outlook.com (2603:10b6:a03:2ef::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Thu, 28 Oct 2021 12:11:48 +0000
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
X-Inumbo-ID: e4b335d9-6488-40e5-9ac1-c14e431a9521
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=wP+ghV8psSDE7JiAbtNWhkDPkpAJ51NPcm+xjXzme74=;
 b=g3wikDzDlANve7TOzcdyZ5dFtUc/sUeHA0vG2ds5QfJL3bj7lQPSxOiq3ui8dyW7Fl5/
 SLwa7BAAD6w+tvpfRCYb9TBuCyGNCc4q13IpLCDmMcqwQ6gNmbpVYEjrdgMU4F4Zp3Bg
 LFWrmm/XBvpMlhekQ+n2vdFlgX8GPXRcdBOgNxB2uDOhil9KOVg9cDNconFtZV6uOlZZ
 gyXnUaM3rr9AzbARTraLmd9OnSHsJwMzMis4e8YbxxcHw36sqlT3atl35zElhd1xwE5Y
 6OTubdxb6uBDUsWqSQueg22X8DAtel1vcsIe/tHcDjIlEtJ9+L9dwnQMreV73FlsaLu2 qA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRp7qr62M7tlDbfsPDUv+s61PnVZtcTuO3p9a+jcvQfGAOI3CI7T1y21cWDujp91Dil2tT80K5Lg1K5swAWHmXiDwUpzY8yaMTnaNH+hBhlAPSJqtvRQMiuvS2Ff05L+mrEbKShUJuENZUqSvYLiesTrRC22Mitu7g+Dgo+S8+F2erGyL0eQW2Rx4jcuvQr/IkgWIku4RUKJQPJZjHdiikYmKYv5MH46e//4791btl/6kTIWhRlSt6o6v8fxQ5LX1tBUssDztwqX/CpZkAYPBIspr1ye8ftQqH0LnYA95O6UBQi8hhqdaR73JMe/wbwe//+W5NnrDyL3mQTG7kmh8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wP+ghV8psSDE7JiAbtNWhkDPkpAJ51NPcm+xjXzme74=;
 b=Lzhy4Uxj+f80E8DxJmscTO31uKosLKeHLgisqc+GdqyJmE5tRmWp0UyoCwtjI1zbzSYuRwNlpCOCQj0vU8TWk6Gy5A/lIWtgX1i6SVfekYYX1WMhwR0BE8jmxu5mjKo8LZ53sYliEUJeB55JZMN8uv1nrO6XV0NP84IObyE853up4abiSsjvjzjMVRlmTqhnPwCjIBfRRyVl5pxnfnF7oC79XP4uvPdeUYTvBOpHHQ4a9XmN2xqAEme9fT74oDDslJkGy5PYdsgyimZ9QDMUJhgicQwqMmyPiogXVRyRTnYwWV9WpuVge5nsr7j4EjhHyHbKo15Oy2yJp/SOcE2gFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wP+ghV8psSDE7JiAbtNWhkDPkpAJ51NPcm+xjXzme74=;
 b=g389OYwqRhdHWtkOfuoAILdni1i+dR4+a2mzc2KbQuDRkySnIkw/pVHrIc3qOZMpfD/TA51vv2J4RnelbTDgHJypx0w3T/cxLpmBw6hGBXqZa5mC65H3gpTUrPOIsHDAz3vmtsCe3SheI8o+0Zs0hKCWAZqLTwLTqR4Fat5tFIU=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=oracle.com;
Message-ID: <8b60b1ce-b65c-6136-fffe-5c8a043b0ffe@oracle.com>
Date: Thu, 28 Oct 2021 08:11:45 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH] x86/pvh: add prototype for xen_pvh_init()
Content-Language: en-US
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
        kernel test robot <lkp@intel.com>
References: <20211006061950.9227-1-jgross@suse.com>
 <5164486e-b6d5-035d-5eb6-ec03a04284d0@oracle.com>
In-Reply-To: <5164486e-b6d5-035d-5eb6-ec03a04284d0@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0204.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::29) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b516f82c-818c-4f85-10fc-08d99a0c1f76
X-MS-TrafficTypeDiagnostic: MN2PR10MB4255:
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB4255D32BC0236EA9CA3CA2028A869@MN2PR10MB4255.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/4ZnXPhc1y0BsbCEMVUM8fR0r4kJvcAIp6UFw1na6KM69g7HLpMGVYbsP8lrTDXscqiPczCKqXKqhCyjKQs7RkNU3+umIq5He5GZxSPBbgQIzedgWqxOUjgrzjFteITxrG7BHvWaEAkAzhNoCrMXhUCb/OINeS62MnUDgeLOda9xG1YvgDc2G5MFqdHBnMTVhUFFrd6phR/3UUdk9Wl8wN8Gct5y4DHOI3X709z6MQncJrLJg/TUiyyun07QpvE9mcH4V6SNVIXJyI8s3BhpdMwcp1jS7C84hU8cEa4e1IlAX251z7B/K3h8/Ikitk53N6lXCrBa2adkTtHQHndeJCfgRIkkhmu70GSxcZFu2Kn3mtBZ3r7GWFIbEMlD9k5S+VnJlnIXM6GFVbdEyFxanYt79pYK84hsEhMsA4eHJdX9ALWCavj3URRymLKZNSv2d3SUwSX1fn8qC0QIH+m57OFt2Uh8n64jjwZq4T/EMWzFAYbSMqwWOdsds6pw5yGjz4I35GVTX+n6UDY7nZsIB0s2+LAmRrXPxHqg4B2HtPX58ycgzIZsvuQqINzGJxKkcyiPdRtmB0Vru8nQF77KgBO0FS8MmUE2Vxtj1DGQ09WhqRb7cXovlKfTzJug6Pp22S2jyvatDArUFCjKqIYBqWvg+utMw80PgYTU3zum+WYvymmdPFeJedhZDGQ3pWFJIFFPhbLO5wEy31cP2NErgJwWlvlyDPmxREkedMGo9bo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(31696002)(4744005)(16576012)(5660300002)(53546011)(2906002)(6666004)(36756003)(8936002)(7416002)(8676002)(86362001)(6486002)(54906003)(66946007)(66476007)(508600001)(44832011)(66556008)(2616005)(956004)(31686004)(4326008)(186003)(38100700002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cjVhV0QxQjBCUUdlZ1dWV0RYVWR4U2ppakxBUzlwWnlLaHJVZUp1amtKa2o5?=
 =?utf-8?B?enJKMDF0ajlMbVEwaGlKR0Q1WGhwc3FWZ09SV0JUNnd1Y1JxQmMzMjJOUDZl?=
 =?utf-8?B?SHMxUHROajA1NXdEdU12d2F0cWJreTRJVEU0VllhMTBpNThIeTNTNldmV2pF?=
 =?utf-8?B?eUJrZkUyTTlOaUt2R3BZcmxmSDh6bUVjUXFueWZxRHkxR1c0K29kMUxlRUJu?=
 =?utf-8?B?bC9WOU5jQmFjZkFHdlZ6UXRuWGdEU2JrUlVIMThBczc5ZmNSOUhMNnFMNHZn?=
 =?utf-8?B?R1NlOXJnakgzTS9xNXV1THQvNlJnU2dtVmhRdDlTUDVpRngyb204L0lKOTVn?=
 =?utf-8?B?d1BzNTVCeUtheXkvQjFsNGMvR1BqTVowV1FjUWJsbXlnRzhBY2lEZnU5bUFI?=
 =?utf-8?B?dlBIWXJiRnpZOHRWa3hybTdJa1FzZDNmRTVBVmFYWGJDYzdZWWt4WnZDM25U?=
 =?utf-8?B?M0xTMUhVRktwRUplQys1ZmZySkgwd0NvNDRJR2N0cTg2b3gxRnVCLzdGdVo0?=
 =?utf-8?B?bjdmSjIyM3d0YTFJb0tDeTYyVmZmeFZDQk9VWXZnRjVPRFFucFRCUnQxbUxR?=
 =?utf-8?B?YjJ3dWxoSXpxU0pWTGk4SkN2b3VMelZHNnhXZVYzWWJ1UkhreDdsWDNsbjd6?=
 =?utf-8?B?bnVuWEF3eXlhZ2dKdEJKQU9keE1wRnpIK25WRjRGNG1VMis4Y2tnRllKRFJN?=
 =?utf-8?B?WThVa2tZVzZseENNOFEyV2Rqb0dIWENYQ2ZVN2haQzhNM0pBV1REZTA1bzZ2?=
 =?utf-8?B?aTRZa1Y4QkFxNkxwL094eDlDNVBFM2RLaG1vemVmYjBsbE14MXRlTkFqRTVQ?=
 =?utf-8?B?cVl1YnAzd1RxMmJ5R0NlK0h5bnhKY1F1YStjMHV6K3kzM0lFUW10QWVUSCtG?=
 =?utf-8?B?MjJCMm5XRSs2U0d5dkwvT1FPKzg4Nnh3YXZYOU52Q0d0ZHp0ektzazZ6RlVY?=
 =?utf-8?B?VjdteHp5OHYranRyd1FWMUo4cHZOUTlsM05CTWI3dEU1VmFpTzRwT2x1cHRa?=
 =?utf-8?B?L0llVzdaL3RXYU93NWk2SXFOU2pNN0pvK0ZvdElxVlFqNmsvTU1tZThweVM4?=
 =?utf-8?B?ZHlYcnFjUDY4MjJqK29qVU5zVlppU2NJcTRGYTBoTStKeVdRQm5OUFlHSXZ5?=
 =?utf-8?B?TlZIV095N1VjUHVZM1BkaGJBSExzdmxMVUdFRUx6TDR4d3U4c1M3MUowaFIw?=
 =?utf-8?B?eGVObWl2T1FXb0xFdE8vNEtNYnZCZCsvWDkyblJKMG1nTDdOMFRnT3dHSEh4?=
 =?utf-8?B?TjBZaXVlVnB5K2RMOFd6Mk1mSXRPcUdFdDVMODZGeUJGTzJocDljNkhpR1V2?=
 =?utf-8?B?R1VCR2JHbjNtT0g4UW9DZmdWekpET0tPbnh5a3V3VkQ5cXF6d2pyLzNpYWhW?=
 =?utf-8?B?TkpNZXlRRTluZHA2K2dTV2p5b2pCTmdCM2cyNFlnYWJZMDB4V1I3UkNFRTky?=
 =?utf-8?B?MGRNWWw5NGI5dmxzcktTa1o2QzQzejcxVE9QY1czckk0NUZuYVMwMENESnpW?=
 =?utf-8?B?SFN0MURxYlZ0aXVsSkZPMS9HR1dWYWZQSThyRW1jNW1KSUZaajZOYmY5S3gz?=
 =?utf-8?B?UlRCRHdnQlhpSGpGdExuMDg3ZTdYS2NLaHBDMW9OMVdaRmhKR0dSMGFYOWJ5?=
 =?utf-8?B?eHA1UHkybFZoc3NhelB4aHZFaVhaekJZMnh6azhzdE9BQjE1VU8vWFNhYWNo?=
 =?utf-8?B?dlZKUVBORkY2VUwwVlRhWmpxa0szYTNjVHdYeGt0S0NFRG1PZjJVcm9USEpI?=
 =?utf-8?B?dlp0dHFreEp3U3NOMm1tWUhaTUJuMGd6Z1czbjJSVy8rcitvSjM1WGxiTTh3?=
 =?utf-8?B?ZkxSSHFUeHJ6ekRQWTNwMEViMTBJQW1Iais3WG9WM212TnZFMGJuK3NPSjgr?=
 =?utf-8?B?T2VEZVlxU1NWbFlZbjVTMXIrNzhHREZHY05ldFpydGc3bDA1WkRjSWYrS3ND?=
 =?utf-8?B?ekxWYXhkOVkyanlYcFN4bTBrR1NJdGNjK1Y3Y1NiTFI3TDNGU0FRUnNveUZB?=
 =?utf-8?B?bmJoNDNBN3FVU0VYWkhVWi9ScDZ4UHdvaTFuc3dTc2lTakZvUXpyRS81L3pE?=
 =?utf-8?B?OWpveUxhY3VUTHpCL0ZaTkJtVW5ORDFiWlF6akQvK2RYdzd4aThpOUYxVHhY?=
 =?utf-8?B?V3pKUGJSejNMeGJSWmE1TFVEL1hYcTZSWlQ4a2RHRUNBZFYyekllTlFOeTcx?=
 =?utf-8?B?ZFE0OVdGWm01VGJZQzJjbFpwY3FreDJ4MTRDa1ZRekh2WGRBMWEyMWZYMUlM?=
 =?utf-8?B?RHVxVnFpWk84elRsSDhveWpuT3R3PT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b516f82c-818c-4f85-10fc-08d99a0c1f76
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 12:11:51.0888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VgCJ4LTI2z5Fi/B5mdWri0GTqPmfydntsAggvjck5xmvEQBBL1yc8A7M6DOr5g02nq6BLjblT0xbOirnY97991ItbZA9pq9Z/17P65Si7B4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4255
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10150 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110280066
X-Proofpoint-ORIG-GUID: Abo1nBc04FO2WEdmdM8RJg9wW9NfTYSs
X-Proofpoint-GUID: Abo1nBc04FO2WEdmdM8RJg9wW9NfTYSs


On 10/6/21 8:43 AM, Boris Ostrovsky wrote:
> On 10/6/21 2:19 AM, Juergen Gross wrote:
>> xen_pvh_init() is lacking a prototype in a header, add it.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>
>
> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


Applied to for-linus-5.16


-boris


