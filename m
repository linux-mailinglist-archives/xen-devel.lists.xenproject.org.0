Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A05CE40EED4
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 03:36:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188818.338146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR2mJ-0007nm-Dz; Fri, 17 Sep 2021 01:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188818.338146; Fri, 17 Sep 2021 01:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR2mJ-0007l9-9T; Fri, 17 Sep 2021 01:34:59 +0000
Received: by outflank-mailman (input) for mailman id 188818;
 Fri, 17 Sep 2021 01:34:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ysil=OH=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mR2mH-0007l3-QE
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 01:34:57 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 95e6cf11-41ff-43d4-a7d1-739c6f4b18df;
 Fri, 17 Sep 2021 01:34:55 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18GNVHmQ009148; 
 Fri, 17 Sep 2021 01:34:54 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b3s74mq93-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Sep 2021 01:34:53 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18H1Ue6u153268;
 Fri, 17 Sep 2021 01:34:53 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by aserp3030.oracle.com with ESMTP id 3b0jggy9e2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Sep 2021 01:34:53 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB4192.namprd10.prod.outlook.com (2603:10b6:208:1d9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 01:34:50 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f520:b987:b36e:618f]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f520:b987:b36e:618f%7]) with mapi id 15.20.4523.017; Fri, 17 Sep 2021
 01:34:50 +0000
Received: from [10.74.113.247] (138.3.201.55) by
 SN4PR0501CA0049.namprd05.prod.outlook.com (2603:10b6:803:41::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.6 via Frontend
 Transport; Fri, 17 Sep 2021 01:34:49 +0000
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
X-Inumbo-ID: 95e6cf11-41ff-43d4-a7d1-739c6f4b18df
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=1RNWjIRij83DQK3/NgNDTxM5HwLq/MaxDMSD14Y6B0Y=;
 b=rCo1SX7DPP5a1KjkkjcN1nOFkxdMdSuUZRaHYDgncGJbMD6q54UF6GaTqFg/6YkaZS/s
 a6Hhq+8mhCsSMwg95oRC3gQH2Cqy6tem450y9nFG2KC1m/XOnknAVPQXUF3C7DfdOwfr
 OzF4ABxGHqFOQRgPl2aB9kwnR5XrxiG/BTk8EPsRUJY5uG/9vxp0AWWY4vc6P8dXB/tc
 yLzrscbvzKKVfwfed5uz0XDHbqNTHZ85qSmbqk1XfcfJv9A/HE3G4h78FbqG3bn5u8px
 3rEUFufGVmK8Zg3U+IH6Vm2hy1LbmEMtgU77GA/x62W3DsHxaqXzSe/5jFnWxB9D2RxS vw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=1RNWjIRij83DQK3/NgNDTxM5HwLq/MaxDMSD14Y6B0Y=;
 b=Ym6e3ClpPUoFvcHZjUBasKuzb/6ATxF3eX+ZgGQmwYKmK5MXFfjegHOPRmJjGCagbfvM
 PymQrUIX6bIMSR7lSOhqUsLL40sKhrC9JS4/LLjmBO5gcKaYvHGSL6ox5uJSAPy22BYx
 bdSiCf2voxUcfEH4CjGDSlpoqoF/GpppBWPBGUOiSXz/dJbPy60LejLzZIZOCsj06dSQ
 P4KoZiOEvbhJRTg0/9iWkjU81BX4htCKn9aE+Uxl5ho/jnbq7Fk5oOoK6kFiMv4QxwsX
 gI/JZJgKvYuIx2vYgYe/XYdfQenedyzciZT63phTyNWaZRhRDUj/uwO644sbAyPM5np9 FQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZoue0kQ9hS+QxdWfOuNj9YXy2VooSz35ZP76e5DnPV+r9SP1BSq8NCalygQyM7e8URmCxmzyC2kM6oUturdxe9NtmwzyAFPZRCNdkCSChvfmlohpvPYlx7yyXDiNTwAUd/eHEJCnZZbBkvNA5prot28+eEN4s96FQYNPPK8K/0bzUjt8+2W0sOSmW1dxEfh9j4cyScSLCVrU4ai85N1dTTRLjHHf2p0N8xhCjaGxT2jNimHV3J1USZDLBTDVq3b0HDlVzgRwtM7mw5AMTuJ88UBB/FykaQhPDxs9Xocg7X8E4r/8QIA0GUC6rzG3j9uc6I6n71WVaCF3QfkZfiTJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=1RNWjIRij83DQK3/NgNDTxM5HwLq/MaxDMSD14Y6B0Y=;
 b=NVfHi3hRMhIFVLp0heb7wQyeTkNItJuMPomI8o5SW6EFOkVBWdqQqug4GvoiamlWLzmPF6qTbcgVA+CYXlXHGqionhCmYv7UdukEP+zxWR+WKqUju7ERZtZOP28Tnt0IZSAEOEK1aXxXVvl1x2S1OA/CHYlSaPfdfSz7G7gY/v6oxHYOl8/0yVZGVx9VV01nL4lK1os5UKc10SDvbQ2U1HzF8TP5Lu/KpXJaVS3loUrvO3ixC4IJeYu6bt0BMUUE+GyUn7te9bMAlWnTAJ9lumunXd8x2Unz8Nl3nCbeKra7BQkrAGS/ivwKw3izfSiMFp2g6V4mrTva7beg5PJEOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RNWjIRij83DQK3/NgNDTxM5HwLq/MaxDMSD14Y6B0Y=;
 b=SVHppOt29vmUHeL7CGZOlTSnbX2MIA1RnfAKToP986nrrZK75bV6n+0cP1NHD1339D+3pMf7ptjGCAn1/03jhYOWuw1jsmxKm3sThTqVZJouHorbat1EPL42V2kLTDGTIBp1FC6QpZaAU+HgvNWEhR62ivq2WBQfC7FCq5epc2I=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
Subject: Re: [PATCH] xen/x86: fix PV trap handling on secondary processors
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <34898e9c-5883-a978-98ee-b81b22d8caed@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <823f4ef4-f9e5-68cb-d6e9-d079483c1e21@oracle.com>
Date: Thu, 16 Sep 2021 21:34:46 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <34898e9c-5883-a978-98ee-b81b22d8caed@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SN4PR0501CA0049.namprd05.prod.outlook.com
 (2603:10b6:803:41::26) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4f6588c-cc38-4330-8580-08d9797b5737
X-MS-TrafficTypeDiagnostic: MN2PR10MB4192:
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB4192514D1C8CEA483F06AB968ADD9@MN2PR10MB4192.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bLZSPoPbp144LQEoKNV3zMBSWjcIbuSpuGbNgq3AWEJoAm5fbEgvK4O3zO0qFUajYOCM+3WpbkoS/ly2JvTNxv+SUOK9BIz6L6TJKM5hB+enG+h9jTviFmLFKg0lCZRAOjnMdsATVpi2iNngWmFbr84MEMEBU3LUzUD36N9rPrF6qMIqEocFc57Nm4es+hYhzcpVBvMft1Xxht409GAdmC+Ba67oNcVqRduJ3WfwPY9YvgRdfNyuwuQRCQsncjWcCg1MisDcHu5ir2mCUBIOQ1B0MdsbvqnV0WRrcfAO7I4K1L3qh//jxMwWOPGGtDRg9yx78XRtf1v7Y5l3P59iU4Ng99/8gaRPggXmhv9aAJU2N8rkEJ+Jj2mWSvpp7HveOFlXCstU+eZBjbRJh5MDKell3IW7X5G4v0ramdk3w56AWhiKcYlaJSYhwNOIpeV8ri/2wjmgN/PtneL79hLyr6q9fBJ9TwaAwhZC/+ZU/KJm66OhYInkjhZoV+xWYAyYZkw3SpSWlcIjBa7QHPILz0L0mWE2vnQRlITnhH0bPRuGp1oqHKF+c1Ty0L+MckJlWAaHOhOMP/uV0LoTb71gueWCoYg823cveGZtwqPHKXIiV6N0jrU9Ps3k1Li7sRboaOlRyEjN7VerxYfXdN5KnoNelzjmHpK/qOBK2e9qotI5+bT5+IJqZS87XFl+H+iURfVXIXlRlkJa97Hh1MvOgMLONeRUlm99feBg07BRKprvu2JAloWKhxqK7hz3gQya
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(136003)(376002)(366004)(39860400002)(110136005)(38100700002)(4744005)(5660300002)(6666004)(31696002)(8676002)(478600001)(66946007)(66556008)(66476007)(316002)(44832011)(4326008)(16576012)(2616005)(8936002)(31686004)(2906002)(956004)(86362001)(54906003)(36756003)(6486002)(53546011)(186003)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cXI0ZGZGbUZNRWtXQlhkNnVSNldRVGY1NFVFZUppZmdlU0RFbmE5bnpLM3Zv?=
 =?utf-8?B?ODFWS3dNZThDRzdraldpekVOZk4rUWVRdjRsQlp2RkNtQVcxYVhoUm5JeFBB?=
 =?utf-8?B?RkFnbndwVHdMbjNmbm5hZGlFS0FhV3pXRVFKbVNHbDg2ZEdIU2dCOGdJM2xN?=
 =?utf-8?B?TGRsWDFyQjh3RVErS3VMZ1RlbmVFdEFPeEJramFXN0NjTjVCRGFObVErQnhK?=
 =?utf-8?B?blhMYVd5eG9hNS9tazRXMEpKcnAyTnpuRDIxMWo2Mmp1dE5QWXdicnZUUEtJ?=
 =?utf-8?B?RjZra2poQkdaYXdweXZTSU00NXNORXkwOWlESXRjSURhcGJ6N1BHdTJrZU8r?=
 =?utf-8?B?QllRRGpEUTNnNWc5YTZpNE9kUE1QOEtCUEtxVVRXWEVNUkcyNml5UE1LUndQ?=
 =?utf-8?B?aExGRXFlNk4yY0xIVkxSdkc3ZUxjUis0WkhoNFpVRDVsWjNFSFNWaVIrOXVO?=
 =?utf-8?B?d3JmN2IrSk9BNUNDakgyaE8rNERnc1Q3dmphUWpkTTI4VzhkTkVXMTdrSmFl?=
 =?utf-8?B?cG9yRkdKcVdRU3lpSzJYaDQvM3o5anorL2ExSVYweDhtRlE1TUVFZnhJWmhQ?=
 =?utf-8?B?UGVjaXJxRnM3Z2xJcWUwZC9pWWQxK2RPaE1CRUZYYldnSjFuN3VVYWl3emlL?=
 =?utf-8?B?SVNjREpPNHNoNS9zVnF6V0RSTXVVbklRWERRcjRSLzlRZk9jUFl5Zll2b2lC?=
 =?utf-8?B?emdkbWdXZWdVMlRZYXJ0cmN1MjdrL3NkaWRlSno2emtjTERGYWIvdTZvY0NH?=
 =?utf-8?B?TVZwUHhpaklKMEpoVGRMRWhxYUlWRitSU1dtUzVaMnF2aWN5bU5mcEN5eWJG?=
 =?utf-8?B?NExSVjNBeFBSbzVQVlh6ODFHZWhLMEh0Sk5qcU1qdFAra1pVd0NTcG4va3Vp?=
 =?utf-8?B?SnF0SGtWa21YWm5PZUUrUzlyTVYyM1QreGVMeVc0YkNjbUhNb2x0dUw3Q29N?=
 =?utf-8?B?R3V4UG5RSUNMSUtUeTFuT2o4UWxMU0FEdWF3MVZjNjZqeWNXODNnbForNXlQ?=
 =?utf-8?B?alh5MUdlMGZGRTZUaDc4cWNqa1cyUWlMOE1uNnRjMy84M3FCY0RMSmtJZjhy?=
 =?utf-8?B?N1I2WFZCR3BaQkFPZXRiT3BDRU93L21xRzEwRUpsT0JpVUZOZkJxenpWTnVF?=
 =?utf-8?B?UUZ2bi85ak9JVlowc3ZiU1NFRUc0eVJqZURBUGYwM3BXRHdhRVorOSsvS0VG?=
 =?utf-8?B?V2lYWTJoY01FNGM4RXZpM0NkdmcvV0lZeFJ2SnlveHNlRENqb2haY1lhRDFw?=
 =?utf-8?B?QjAyWkRpYWFUejcrOFBBMXUvTmxYMEczZ1l5eUlZeXZ1U0tXNXFJTUY5ajVj?=
 =?utf-8?B?QTdKMkZKRjIybHhWMjloNUlVbDU1K01LQ2ZQWHJVbEs5bVJ1WDZlWElDWmZS?=
 =?utf-8?B?VFVQV3p2ZVFSS0FWWk9HY05jWEpDcktIMWZtSWhsMmxKVGd0S1dlckVwZ012?=
 =?utf-8?B?cE1YVTNJZzRJMVExZlpyUHRRMU5xcFhTMTRoOVhCV1VNLzNHaXNGcWRxbTN5?=
 =?utf-8?B?SS9nV01RR0tqTnhkd0hKeDF4OFB4Y2hJemFFckJScUJvdXU0TnNRWUlkRVN4?=
 =?utf-8?B?c0g4bys0MU84S0VCWnJtN1RVa08rVTZwSkJHNGRJK2pnV3REM3gvQyt4L1R5?=
 =?utf-8?B?WThOOENBZmdieG9pRzF1Q0o0cit4aFZTc2tkQW9PUUVnbjNTOG9NN09jclha?=
 =?utf-8?B?Q3pMbVZPOHc5VUdrNU5IbjRPQXlCTlgwM0thTmdrOG5SQ0doajhRL2UyRWhN?=
 =?utf-8?Q?b3cqGdbMAu0JOJpuXym5mf7FUAnPpc89a35/gZm?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f6588c-cc38-4330-8580-08d9797b5737
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 01:34:50.2971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5VDwvB/jq5c6PXezWaF6Ad72HqmYdRu9wBn5PEW7AStnjADhhnuOxwlvy0Bkf1szHS8lQAeNkEX+/ZnyGFb1Mj6AM36sl0VfepUZltOi0P0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4192
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10109 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109170007
X-Proofpoint-ORIG-GUID: GhWPyo4Tx_KQtWfNAsjXhmxVIymFwbxN
X-Proofpoint-GUID: GhWPyo4Tx_KQtWfNAsjXhmxVIymFwbxN


On 9/16/21 11:04 AM, Jan Beulich wrote:
>  {
>  	const struct desc_ptr *desc = this_cpu_ptr(&idt_desc);
> +	unsigned i, count = (desc->size + 1) / sizeof(gate_desc);
>  
> -	xen_convert_trap_info(desc, traps);


Can you instead add a boolean parameter to xen_convert_trap_info() to indicate whether to skip empty entries? That will avoid (almost) duplicating the code.


-boris


> +	BUG_ON(count > 256);
> +
> +	for (i = 0; i < count; ++i) {
> +		const gate_desc *entry = (gate_desc *)desc->address + i;
> +
> +		cvt_gate_to_trap(i, entry, &traps[i]);
> +	}
>  }
>  
>  /* Load a new IDT into Xen.  In principle this can be per-CPU, so we
>

