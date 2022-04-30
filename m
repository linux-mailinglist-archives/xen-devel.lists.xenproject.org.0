Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D3C515967
	for <lists+xen-devel@lfdr.de>; Sat, 30 Apr 2022 02:39:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317901.537437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkb8d-000874-7P; Sat, 30 Apr 2022 00:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317901.537437; Sat, 30 Apr 2022 00:39:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkb8d-00083b-3Y; Sat, 30 Apr 2022 00:39:07 +0000
Received: by outflank-mailman (input) for mailman id 317901;
 Sat, 30 Apr 2022 00:39:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ySBZ=VI=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1nkb8b-00083V-Nl
 for xen-devel@lists.xenproject.org; Sat, 30 Apr 2022 00:39:05 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eea57611-c81d-11ec-a405-831a346695d4;
 Sat, 30 Apr 2022 02:39:03 +0200 (CEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23TMK76T032115;
 Sat, 30 Apr 2022 00:38:58 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmb107ava-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 30 Apr 2022 00:38:57 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23U0aF4k017882; Sat, 30 Apr 2022 00:38:56 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2047.outbound.protection.outlook.com [104.47.51.47])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fm7w8k0vv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 30 Apr 2022 00:38:56 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by DM6PR10MB4396.namprd10.prod.outlook.com (2603:10b6:5:21e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Sat, 30 Apr
 2022 00:38:54 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::4455:2c02:503:a182]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::4455:2c02:503:a182%8]) with mapi id 15.20.5186.028; Sat, 30 Apr 2022
 00:38:54 +0000
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
X-Inumbo-ID: eea57611-c81d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=ecMtXW53/xzCpVSwp4tjdVjzK/KMTTlyprf6mBmeHCk=;
 b=FSMtcORG55gUE2qLXV0k3x92AvXgMIXLBfXcQrABOuOlUjSxtBeqIwcY0LnCFmLz+vt/
 Fde5/c0YsYqRzDT28Mcu5IV96wIxsofaZrmS1tg7wZZvEclEPHIFVB5Y3w+X591sd/wh
 ga56gZeDs3ANUPXDOfBbpxVaQd3AP89ymcb2Qcuy/f2gncZpd7lZGJ+UShhX258VPBPF
 DnE2kFGfND3PzutqPfocz+U2waUy/ltwVVObf+cjJ/TUfQt/9GK5FDPBHvrLXuA7sQRk
 ciighKhShBlsM0/+4dStaGwsdKScCGUQ6JfyzpowcbuBWJoy/F8aZR0B455NcNHIIRP9 RA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSnQMKCrPdgJ54bqZCK47nHr7qx7eXIC0ijD+JWs5LrJ4Kt+Yqv5WEwuQGC0qY7VvVGTnfkmslCYO0kLIo8sXOBl9locPXWexz3qyKEgUWVyMbW3+1XrjHaU63DNZu+EL580is73E5IPFa1A23NpzcrB8IIg0d5sxRPVvN0C1ffNlSPHAnBei28Olpm5x3jJbktrle7kt94Zw1xaHj2MhroQ3VeTnqi0CGOxzY5q96ruTBy0PDt2f5wd3fJphXBWAfnupkiMOvb4kVcxtHeAXCVdlYLmsa0FpXYKiKjkgDQ50IuLt14UjMdvVxraG/J+2ruZnT4SmqM4i/ugiHPU+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecMtXW53/xzCpVSwp4tjdVjzK/KMTTlyprf6mBmeHCk=;
 b=FYeK0CKYzLwEZTkPS60+jK+1uDIXHlzFuHkWTXRAajHb0/JvXm/lXB/d9uJRZrhb+f06rw/ySjG9sjIMMvJfx8HcUPFDfO0/MgeQEXMGs7EbTzpe0cpSAE5wGlfe/w8rns6UmKpXFCBf+5Zta0y5lcJ37BFXtNvBtl6YbHM7cizqJcJ9Zsj9flKJY9bQLQpC6LZoe2yEvN4ev9zA5rgvYp+20XVX4/BsaDbxL9v1I0C3VOmkREMxEKDWaWccn4TIzLLTnSIZxx8OffT53+pVupJQjOlc+fqlaK6JFw5OOR0G0xloB4uMBi31XukX0S5AQW5U3r0Zc+2DokNY/nRLiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecMtXW53/xzCpVSwp4tjdVjzK/KMTTlyprf6mBmeHCk=;
 b=TlA+NaQ1v3t0TFm8499o0u9t/JyZbKWf3o2ofEsldhpt7+Fs27Wdse224aCmonktGu5JCTgS4ozW05kKAJyYlB4rUIyRfLoI1vY47hy4sQ8q8H/z1/joI8a3+zXXD6DJw8xlcWirk+FEw/S9XBAiZvgjaD/PvsjBeyWpy+oJYJU=
Message-ID: <e9c87df2-3677-52a9-1a17-1314ee3d9950@oracle.com>
Date: Fri, 29 Apr 2022 20:38:51 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [LINUX PATCH v3] xen: add support for initializing xenstore later
 as HVM domain
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
Cc: Luca Miccio <lucmiccio@gmail.com>,
        Stefano Stabellini <stefano.stabellini@xilinx.com>, jgross@suse.com
References: <20220429211027.2034134-1-sstabellini@kernel.org>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20220429211027.2034134-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0137.namprd13.prod.outlook.com
 (2603:10b6:806:27::22) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c15e123f-4f74-4be6-193c-08da2a41cdf5
X-MS-TrafficTypeDiagnostic: DM6PR10MB4396:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR10MB4396D4D34D61E9D683785A268AFF9@DM6PR10MB4396.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	za8RO77W8xI9olIDpWnSloZgHvR0x3B6vEVifNgL8gI0e3N8K/YH4B7jokBeSwIeedehBU+nObA2QRtE7LPajkqI4FyGwdB18G7Lp+t0wUwMpMHhxopRNjl+IOCmW6WwYpLO1gU/J7XKq7neO4OZrg/DCAVHXMK/6Y5J4mJK4zYpfIqH0dw4RRuiT+AKokqG5cE+G3A0oAS9zja2RwKJ8oDgwFF0DRzWJc9lL2NSpULz9DNxYfIciNju1PTqdLXc2picdV/V/awyHoPa7l9OFI5dUOsdrhAxUHE8ePj6LxrRoOQV8oopfzWX79DFH3L8Yb/RDUo0puMP6fgG8y8IbQVc2p9d2Uw0hqju/p5a6mj3HpZo0tS8kkoUzvtI0h3/aNGR+dtwzrRHqy2p3Q32Mg7iZ5nkJbn2tZisHWGUm4MfR+mOIJaCGX0Zpz2fXqDUbxQvaunxjVhLaMCo7SKf/mFEMjQhopLT3NSHP9UUlRFTcnQgTp+FsrTyRDaTl4ERSlk5iJ9jCM1t+7ssGjhsRg08X4FaIosNhpFxUEosAL868KqhKpzf8uWR/tqzpV99XWCswIvwzroYNkvB9KalUWmoXR3nXYvAApSfeVkZWEyT8e6FyIjm17f1SB3SfyBOSUd8S3fF1zexmT+kUUqqF3EboBBUWhuCD82nSGQ43B3jw/VVF1/CRCa6Dwd3EWWZVYgqjmF8ANuDo4WY78vMZyyjAc5jwSApmSWeFOVfnfLDC2BewGUODjN+9lVdUQRI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(6486002)(508600001)(2906002)(2616005)(6512007)(6506007)(53546011)(26005)(38100700002)(6666004)(66476007)(316002)(31696002)(186003)(66556008)(66946007)(44832011)(5660300002)(36756003)(8936002)(54906003)(31686004)(83380400001)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RWxLY3pCZXBDV2FXWlY2ekk2MGtZbkhuNFp3K3FKbnVwd2EwbVJFWU5xcitQ?=
 =?utf-8?B?OWVnc1puc1VpMktzcUhwZkg3b0oxZ3ZEeFl0QUFHZGtWMzRQbXMxTEJqUnEw?=
 =?utf-8?B?UWVtTGg3NDRSWE5rMk9GOHNEWnZVMUFWSVYrVEJOcFpYaC8vVS9IVmpyZHll?=
 =?utf-8?B?LzFNTkU2ejBrdmQxNEk3WkMremhnK0NGVEU4RGREWFJ2WWNCMjg4TFhuanQ4?=
 =?utf-8?B?VFJEVnNvbzJBVXppTTJCdmpUdEpneTlMUWt5Z1J3aW5ZbXRnWTBUbmt6S0ts?=
 =?utf-8?B?WTdaeW85bTBLQnZRME1DNWRYQjVZMkIrUUcvWGJXOWlySnZnbFJjMDBYWXhm?=
 =?utf-8?B?cGVzdkJMcXIrQlFOekxoYnBLREd4Mzd4Q3hPVDN5TFIyb2RNQlJKYkFuVUJ3?=
 =?utf-8?B?S0tkRG5Dc0k3c095N0IrV2paV0hJOGVkRXYxY0huQ1hyUWx4SWZLaVB6NkNp?=
 =?utf-8?B?UDZjcG5lQitWQ0NjYUFxcVlYZmFKSXRVeHdRRUIyK2FMY1MrS2tlQUZYczhl?=
 =?utf-8?B?UGFwWCtpdExhaDRCY3ZkZmJ4K0pjRk1FZWduQUJNbTFGb3Rha1ljY0dXQlQw?=
 =?utf-8?B?OVMzNE9nWWNhSVFoZTZ0UU1OK3lzUHZodHVwVm1QNGlWUE1WSkxtUFNhSXdx?=
 =?utf-8?B?eEFzTmtJNThha245N29PV05jVExEQVZmeDFDQStFWDlWMmhWTHlSdVZCcnV5?=
 =?utf-8?B?alJ5bEMrejYyL0l6ZXdEYWlVem1KUWV1dVZFVzkya3dtTXBRVC85UG95YmF1?=
 =?utf-8?B?anZIa1haRGdwbksvd3QwU3dHTE9DK1ZpNTR2MHE2bnpLR2ovaEFBWFpnd2Ra?=
 =?utf-8?B?eC9RVjFDWWhRQXhMNklUWkVwNnA1R2IrMk1Ccmx6NC9OWjZzazBSOUtZVWY5?=
 =?utf-8?B?YjZhRUJRMkNEZU0ycVozUXJndlpSSGEvU1BuaTlxTUk3TzRUaE4wd1FTUzVk?=
 =?utf-8?B?bWVTVC9RYXVuTG5IaWZDVkE4cnBKM2Y3eU5tb0hCSXVIN0hJMXFqVkhEWmor?=
 =?utf-8?B?T1gwb0M2eVhmVEZIVEx0SU8wNGtWMTNKRjd5SmVydGlpMUxoVENQaTZUU3hF?=
 =?utf-8?B?Rm0zVGJjTHpFVVY1Mkt4eEMvU0ZWdVV4aGlkYXRpVEZpSkFvZXZickFteGZH?=
 =?utf-8?B?UGdvajlwd1hkTzY4LzNXQ09QUkJJQnlMRUZadUxndWw1bU53eld0bFNlb2Rh?=
 =?utf-8?B?S3RJVEJiWTZ5QlM0RkphMnkwTmxncGVYK3N1QXptTUNsUHNnV0NoR0pJWlRp?=
 =?utf-8?B?YnVpelVMRmU0bk1rZTdoaDh1eEVjQU10VjRyaXQ0bDFJNEFkNEFUNmdOVEdQ?=
 =?utf-8?B?U3VjSG1NUERzTTg3dVcrRDN4d3RFVDZyaHZINm81RG96RVlsdXNBdUI0UkY2?=
 =?utf-8?B?cFgvM1pRbXQ4UlRqZXptVFEzRmNucUdmTWRDNnlEeDhhQmlPcUZJbllnbjVQ?=
 =?utf-8?B?RjhHY29yUTl5bjRkOXhGd3JGSkFiSE81YjZZb2FkUnozMUNLSDVhbjU3eGtG?=
 =?utf-8?B?R0JMbEtaNjY5QUFQTzJRTzE4MEZ6UkRjc0RhV241TTRsb1RGQS9QTzAwMk9z?=
 =?utf-8?B?UDhnU3NtZDUrN0xBRWJQSVVpeDhKbUNXcHR1WlJHSHQrTWdGazFKRUJ0VldQ?=
 =?utf-8?B?UTBqVXRNT0lRcWkrUmxid3l1TEpjb2xXZUVHb3oxTzNwaGxiUDlIZUhWcDZK?=
 =?utf-8?B?a285d01JK3FUWlVhVlc4WDB3MFc4aGZaSGorS2lETlVuWVpod29PcVRGRnU3?=
 =?utf-8?B?SzlDUWdrQ2lzTWhaM2ZrbWNla2tJVGNrcEdkUTBOUXM5NHN5blZIMm1ZeTR6?=
 =?utf-8?B?blh1bFpTK3kzWHRRTmZEVE8wU2d5aFI4L0NITnZ5OTdjdk5td2prcUlKTWZU?=
 =?utf-8?B?SkpHVUxzVkdpOVlMcFU3bEE1b2xTRWY4aGNVN2U1NDkvdXpjM3k0U0hvUUVh?=
 =?utf-8?B?cjYrazE2bk82U2VtZ21ZQ0ZTcnhOUUlORCt0aWMxR3VCblJRUUdGc0dHWHhB?=
 =?utf-8?B?NTBXaVU2QjlXN2UvcktHbHVoTkEyVWJOWk8vK2JBeWRHL2o5MjJjN0NFd3Ry?=
 =?utf-8?B?eld0alY1Z2hTOHg4VXlqZkdxR1ZGZnhOb1JBTDNPYmtFYW8xd2NHREowTXNv?=
 =?utf-8?B?QTJmUU8rNEJYaUdlYkVpeDNOUzN0UWRPZWU4R3RJaXdRYjhFWWFwMXFmaUFO?=
 =?utf-8?B?cUFBQlc5ZDh6bi82eUlMeXNhWGZ0RFVZMExtMk9oYXFZNlZvSFBQVGkvMktx?=
 =?utf-8?B?RUdPcW9JenZKd2N1SGtVbVNtSnQxZTdKWTh6TEdCS0hvU01GZzN3b2RMdFFj?=
 =?utf-8?B?L1JiamN5Ulg5ejJsa29TM3F2ZnpxSnV0QUIvVmxQMGxtdkRoSWtjQmhRL2Rl?=
 =?utf-8?Q?31waSiV7SBqMXK+o=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c15e123f-4f74-4be6-193c-08da2a41cdf5
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2022 00:38:54.5634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F3YzCs8WDU75MGtVeisZA0cS/JVnHbtXz4Ql8Bj9A4IPCf6kiaf7z+WInCzT9Z1sCysE3cngkCILul4NBg1ZOkwIipYE/zpxJaooDpuoxpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4396
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-04-29_08:2022-04-28,2022-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204300001
X-Proofpoint-ORIG-GUID: wtwt_kdt8th5nc_GX5aj7igiOhrKcPxJ
X-Proofpoint-GUID: wtwt_kdt8th5nc_GX5aj7igiOhrKcPxJ


On 4/29/22 5:10 PM, Stefano Stabellini wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
>
> When running as dom0less guest (HVM domain on ARM) the xenstore event
> channel is available at domain creation but the shared xenstore
> interface page only becomes available later on.
>
> In that case, wait for a notification on the xenstore event channel,
> then complete the xenstore initialization later, when the shared page
> is actually available.
>
> The xenstore page has few extra field. Add them to the shared struct.
> One of the field is "connection", when the connection is ready, it is
> zero. If the connection is not-zero, wait for a notification.
>
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> CC: jgross@suse.com
> CC: boris.ostrovsky@oracle.com
> ---
> Changes in v3:
> - check for the connection field, if it is not zero, wait for event
>
> Changes in v2:
> - remove XENFEAT_xenstore_late_init
> ---
>   drivers/xen/xenbus/xenbus_probe.c  | 86 +++++++++++++++++++++++-------
>   include/xen/interface/io/xs_wire.h |  3 ++
>   2 files changed, 70 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
> index fe360c33ce71..dc046d25789e 100644
> --- a/drivers/xen/xenbus/xenbus_probe.c
> +++ b/drivers/xen/xenbus/xenbus_probe.c
> @@ -65,6 +65,7 @@
>   #include "xenbus.h"
>   
>   
> +static int xs_init_irq;
>   int xen_store_evtchn;
>   EXPORT_SYMBOL_GPL(xen_store_evtchn);
>   
> @@ -750,6 +751,17 @@ static void xenbus_probe(void)
>   {
>   	xenstored_ready = 1;
>   
> +	if (!xen_store_interface) {
> +		xen_store_interface = xen_remap(xen_store_gfn << XEN_PAGE_SHIFT,
> +						XEN_PAGE_SIZE);
> +		/*
> +		 * Now it is safe to free the IRQ used for xenstore late
> +		 * initialization. No need to unbind: it is about to be
> +		 * bound again.


This assumes knowledge of bind/unbind internals. I think we should unbind.


> +		 */
> +		free_irq(xs_init_irq, &xb_waitq);
> +	}
> +



> @@ -959,23 +988,42 @@ static int __init xenbus_init(void)
>   		 *
>   		 * Also recognize all bits set as an invalid value.


Is this comment still correct?


>   		 */
> -		if (!v || !~v) {
> +		if (!v) {
>   			err = -ENOENT;
>   			goto out_error;
>   		}
> -		/* Avoid truncation on 32-bit. */
> +		if (v == ~0ULL) {
> +			wait = true;
> +		} else {
> +			/* Avoid truncation on 32-bit. */
>

