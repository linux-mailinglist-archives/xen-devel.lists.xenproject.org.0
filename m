Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DAB3DB912
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jul 2021 15:11:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162548.298066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9SI3-0002ea-Ox; Fri, 30 Jul 2021 13:11:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162548.298066; Fri, 30 Jul 2021 13:11:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9SI3-0002c5-La; Fri, 30 Jul 2021 13:11:03 +0000
Received: by outflank-mailman (input) for mailman id 162548;
 Fri, 30 Jul 2021 13:11:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M3Ze=MW=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1m9SI1-0002bz-Rb
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 13:11:02 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5158a132-744c-46e4-a598-ff3005f1e0b7;
 Fri, 30 Jul 2021 13:11:00 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16UD2ckd032278; Fri, 30 Jul 2021 13:10:36 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a3qj4ubj3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Jul 2021 13:10:35 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16UD5e4u162852;
 Fri, 30 Jul 2021 13:10:34 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2043.outbound.protection.outlook.com [104.47.51.43])
 by userp3030.oracle.com with ESMTP id 3a2359h6ex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Jul 2021 13:10:34 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BL0PR10MB3443.namprd10.prod.outlook.com (2603:10b6:208:74::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 30 Jul
 2021 13:10:31 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f10d:29d2:cb38:ed0]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f10d:29d2:cb38:ed0%8]) with mapi id 15.20.4373.025; Fri, 30 Jul 2021
 13:10:31 +0000
Received: from [10.74.103.140] (160.34.89.140) by
 BYAPR05CA0009.namprd05.prod.outlook.com (2603:10b6:a03:c0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.9 via Frontend Transport; Fri, 30 Jul 2021 13:10:29 +0000
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
X-Inumbo-ID: 5158a132-744c-46e4-a598-ff3005f1e0b7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=4gQK7yz2rYJRe+DBdflQhp9yL6kRKrOi1x+IYoHTzZo=;
 b=xr9xVWMWimclCGcLzrSNVDSBke4WXn6D8aaFFAnYguTN7Cu6PeU0hvv0xXwz0p0+oCQH
 pXTs3F2eZ5QMxh5jT21Ek6UGAfPia9Wl2bG1WfAIpyLNd0Y9PZ0/J+6MYHgpbeGJYvuF
 oAUVTHBWKYnMUHEs9cBusIQSq7llKbtfSfAVCowGpqy8cC2R7xV64nRN0DKHfwlS8A+P
 Kwf2YZqrrmQD9spGK0X7iEGpVCmZxtUWh6MwefuASSB7j2sDzooFsdimm17ooiwBeOJ7
 Uw8RLWif/0fYFlLBgTHDTqsNPT590LLdeHizP1A5P9p7Dr4C/F08eRf3Xy4GeWvikhsI Jw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=4gQK7yz2rYJRe+DBdflQhp9yL6kRKrOi1x+IYoHTzZo=;
 b=y4/ZYBdgQWPjQ7S0U2G9EhqCPY6ElhDZlTLWWdgY10iJjImxPv9h7Stezq3NNZk3++cO
 L3xpoKqrQWNI0TjRY8kwgAXPV6J013XoVKGQ9kg2BGq5X+Fhvca0kI9vmLBPnt6qK/Ex
 ws94x3j6JB9CZZ1/dVixZsLKwQWguUk9l5olXGPMW1bPP/ndbWEXihlx0BxKELFMOlww
 OdH77hURbSgswFfvrrTasquZipsUAbDBAd0/9EqRukRxvjhbiJ5XX2G2yXpvG3ythQbB
 6fEpJJO4ZpeNUzl05MZMQ5RUpAwr0jes0L3oXZUSqsCEXlakns1qTYuqQ+48SA4BvX+L WA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSAc90USAQv1ATBRg6unaqimeG5cBV1UOz5jLhO/yFJTS7X7EIG1XU+evrAc4bqMuePVI9RdXChtWTLkJLXgwGx2nFZ6DcQOoDj9aGVIB5DImazCu5K9cYOrDjrMb3djfXzQKR9RNWLV1zmcbY6l11ct7qet1BuAs4BA8t57CiDW+gb9aqK8HD4T5w6zqDMCSYpnqL1WCCBa1RrQxATgO8SJ+mVR8acfsbXvnQ0udlM06ZFQKEYjUuIAsAQ6+myWt79i86aBAGApidyfLzEmluBn+2Kcg4gHm/50GOIdlLJM7nl0e+eVdkaIm/C/1mCB3gbwmKtQK1AM5YCN5qOIrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4gQK7yz2rYJRe+DBdflQhp9yL6kRKrOi1x+IYoHTzZo=;
 b=MTnLeOEamO13mSF6Oaah8ny1fQhuWliWiT29WELB1E7hrbXlQwoXnkblS62iiYk/MYwBWxeAOX2SbjWLrF6HbywE9pG8OCbzXrev+2Ei66Lf4P7PqFAaq83zAd+hhOPBzRB47E8ibSl+qi6prGT+ReINjXk/k1/qmWtS/rL9An/5pMYrCuMnPv7FVnKN92OkoxwnZWTI1sxUIE/6a3IKYHR2XLB3R0Z0/CtTnkV8XXzDjFt4jnWNHwIyWVZ9bBo7SZQuxzrJnDdLRGUMz65m1bOCYLXV/6K3z63XQqDmscKolZnVm6nN3BMySQK+L32TRJl4Y1tV3NDbz+ZQG8xLKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4gQK7yz2rYJRe+DBdflQhp9yL6kRKrOi1x+IYoHTzZo=;
 b=iVfpe/VrEJfv4H9qibbY4aqN0p1575PhfSLMrUxeeJhYmLZf8ccz8psYPDWgNP64PsH/bOUztCmjmy04nyCT94FvIhwSCQIJA2pamKDSCDEyIC5K82MyTsAQl7gIIzmQxUNqL1Fka2sEyVUYMdYDvr4jI/UnVBkGeQq08dLFCGw=
Authentication-Results: zytor.com; dkim=none (message not signed)
 header.d=none;zytor.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH v2 0/3] xen: remove some checks for always present Xen
 features
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org, x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
References: <20210730071804.4302-1-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <9025ef6a-6be7-ee63-b528-735f5a5e6d5e@oracle.com>
Date: Fri, 30 Jul 2021 09:10:25 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
In-Reply-To: <20210730071804.4302-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: BYAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::22) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7bff916-3b2e-41b7-8f5c-08d9535b6881
X-MS-TrafficTypeDiagnostic: BL0PR10MB3443:
X-Microsoft-Antispam-PRVS: 
	<BL0PR10MB3443A7CBA356F53EFB982BBF8AEC9@BL0PR10MB3443.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ecI22R2k4xthLAOvTGJmPsBuwsUrie/jEBpAhOcjKniWgmQIUDaU+S1A+DTPx7CjGjjjjxhLPd55Tq4WdCpwmcL2P6wYbrxV6Ao1uxvrCTUtyXOJzFxl4oXnrQ7ewvQILSMA9fKmnjss6FXVfTFo6ZxiLTJ0txL7RDdomah8qUk/i3LtUpmrrDpwQlqoPViwBBY3BfIpZp4T/t6n6O/UTVQ3OfVHfTaaWY6IHOMtaSHaKWDsFjbMlFwTfCCre6K/zseoJSAAq1DvsknsHj0ZCKTdwRuNtXRQJH0F47rr12IBhBDdb8ICGlw6WhY9HF16xYgSpegdrXE8STn8uGl87ZI0YE/BwMUJEyPTlvy/gLu55u+oHG2vw5hJGdpfv6H/RB3/ri5oLIoLqbWVunQmJMoOHSCyD1aNRoiJNKamYEjn1HMyH8QTrjJ0RR80IhtGCbE4ekz+wsQMabpYThKNLe6ZIVyMxw0/9D0LwyJmqPxwBeBUh01goe39m31ycKdguFCizRT4irli3EXingzj6hqJYCBKEw3LBT1s+wszdhXgxpBnqfYR4NzaBtVwONJEJbc12jikI27dfcAi7hYrSHrvlIUMMQS7/qc/yMf9SHp3TPgNacCJZSjhEr8wUueeNoIEVyNxL53Y6jwf9KzaEtiQ6OjPOgykISEqCS6ZboyBOgo6KkHTegBgwSVhOIFd43por7546QYfwPTzJ94yzRjeXGHkOYuvlRmVNgCNvwg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(376002)(136003)(396003)(39860400002)(6486002)(316002)(5660300002)(66476007)(956004)(86362001)(2616005)(4326008)(54906003)(186003)(4744005)(44832011)(6666004)(16576012)(26005)(83380400001)(2906002)(66946007)(8676002)(31686004)(478600001)(31696002)(66556008)(38100700002)(36756003)(8936002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZmwxK3FZdzMrMjRUU3hWL0daUXphZjYrc1NoZDNWcFRTTUgvMVNtN09EY2dQ?=
 =?utf-8?B?eVJZNGxaZ29mUUlveHp2OC9FTFBVNEF3OEFmYmdHb3VVdUluZTVici9TY1Q3?=
 =?utf-8?B?QTV3SU15T3M3Z0piaEdVL01pZUJqRDRwaDM4dWtCRHBjQ01EYjFKaG5KcldU?=
 =?utf-8?B?UmZ4M2dMc0VpS0d6MlR6aFFTejhjZWs5M3JuV0k3Uk5LbFBOemRVc1JUN3FC?=
 =?utf-8?B?cFoxR2gyTUN5YzhybUZFalhlVk1IaTM3NzJwSElqZEkzN2pzZlZVcU56amVI?=
 =?utf-8?B?NDhNUjJ6bS8rVTcyMHgvZWIzNENtK2hsQlZZejFTZHdqREtTbUw5dmhqcHF3?=
 =?utf-8?B?YXNLdkpnUjlBZXdQK1hMYkpFR3hnajMzKzNjd1RGbzduRGErN0I2TnZGdURu?=
 =?utf-8?B?VFBVWXpYbHIzTks2TGxXa1Z5R0ZqaHErU0RLZDdKeTRnblB5WUNGYmUyZmJo?=
 =?utf-8?B?VTIyaHUvWElxQVMxVnJycTVEN1VaVWZLS1JvRlROblhyZmJ1Y211b241WGUw?=
 =?utf-8?B?ODVBd20vYStIcnF2L2lYbERuK2R0N01ISndDYlYzOFp6Q29LYmM2Y2tIR0lB?=
 =?utf-8?B?UGFxczhBQ3ROR2tuRll0NUZOY013NDFiUi9sZThWYWpzQnQwRFdIRFhJcGJh?=
 =?utf-8?B?Uk1jZ2xvOWQ2aE5pUkhuSEJ1citMaGpOLzBkYzMydGRxKzEwRjFiVjhjazBK?=
 =?utf-8?B?V3dOWEp6WlRaTktCd2s1anhaeHYxT1VMSVp6R2tqaU9QVERNdGJnZGIvdTQ1?=
 =?utf-8?B?UXBSSE9TWkk2dEhwTEZXL0x5RkRya1Vta2VXSHJYUGR6ZTZDWnZaYjZreVRl?=
 =?utf-8?B?TGZBZFV6Yi8xbkpWRkVrVmV1NWx3cXpqWE1mZUNxL3IvZnNWQ3gvbTNDM2Q3?=
 =?utf-8?B?N1orUU9yNG1rQnhGYzdOMHVLS24xdEhmL1NHdXB5TXg4a0psZ3dIU2d0TUN3?=
 =?utf-8?B?ckRqVDFMR1FWdXRMM0RmWXRBZ21vcjNWNGtsQ1hnRVUzVjlQNmE5d3pCV0kz?=
 =?utf-8?B?M1hxU3ZXUExRMmMzMTg3N3Z6cExaTzFORFoxZkRlcWNzTUtzV0RZLzhMNk9X?=
 =?utf-8?B?WllTY3QvYzFRb205Q0dweXowb3lTRHkwNk0wd3hrVkthMmRjYm9Hd01WeUNz?=
 =?utf-8?B?MEVUbGJJbFZraGw5QkhhYnJxbW9ieEx2R0c4cW9kOWs4NStXQkFVTnpDL0E4?=
 =?utf-8?B?MGJValRGeEk5L3k5Q2lXRFZYaEVEWDBFMVBSQTk3TWZ6QWNpN05aOVdvSmlK?=
 =?utf-8?B?N2YxQ0YrOXlEU3VRWERQRGlIRnAvN01XbDMxRnc0VWNBaXJkNk9SZlpCeTUy?=
 =?utf-8?B?UzBhQ1F4T0U5WEpDY2I4UTZ3NnhqeGlVcjFCcHVmSTZnRWRaQ005YnVNOVpC?=
 =?utf-8?B?Uk1vNFFJL2JWYW9DQTY5dk54K3U5Tlp3NzI2NXoxVTVSZUtLVll2c3VSN0lI?=
 =?utf-8?B?WUxjNitXeDh0QXVvb2dsWWZMeUZYekxvOURvL3NHWHk3eXFMVk5rdnFyYXk3?=
 =?utf-8?B?ZFA3ZHVrZVA2U2Ztdmtub1JqMTZib3A5UVRSSnNjVmRLNmlaYXNjbXEzV1Vx?=
 =?utf-8?B?bkZpSitxUWV1U2JkNEhGYjg3UXNKQUgxV2lpM3BPUCsyMWw5bU43aW50VWFq?=
 =?utf-8?B?SjVIK05YNEp5VE8yQUdzZlBoeXlZMEdKeDFJeDc1MkNSZWZlTHpnaXFMeGpI?=
 =?utf-8?B?Umo4RzdnZFJsSG5MZFppT0NaaUZqWVVpSDhZdEdsdStTQjIwZ2g1OHFBaWUv?=
 =?utf-8?Q?xluIX1jzxORMCDs68HHbwULnIX2TWI0pYq5A9R9?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7bff916-3b2e-41b7-8f5c-08d9535b6881
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 13:10:31.2466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +4VR2aFaFJiaZw+QNw2O+J8oXOIa3ca+HTXnhOHYfmJsAGkVo4Gc/B4ySEpaOI2ljBdVnTLNDH37NkxhttzXf//nb/qKptjuyvcuQf0ycQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB3443
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10060 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107300085
X-Proofpoint-ORIG-GUID: VsVhOOAEoNbe3wfe0WD-zmjWSomFRI49
X-Proofpoint-GUID: VsVhOOAEoNbe3wfe0WD-zmjWSomFRI49


On 7/30/21 3:18 AM, Juergen Gross wrote:
> Some features of Xen can be assumed to be always present, so add a
> central check to verify this being true and remove the other checks.
>
> Juergen Gross (3):
>   xen: check required Xen features
>   xen: assume XENFEAT_mmu_pt_update_preserve_ad being set for pv guests
>   xen: assume XENFEAT_gnttab_map_avail_bits being set for pv guests
>
>  arch/x86/xen/enlighten_pv.c | 12 ++----------
>  arch/x86/xen/mmu_pv.c       |  4 ++--
>  drivers/xen/features.c      | 18 ++++++++++++++++++
>  drivers/xen/gntdev.c        | 36 ++----------------------------------
>  4 files changed, 24 insertions(+), 46 deletions(-)



Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


