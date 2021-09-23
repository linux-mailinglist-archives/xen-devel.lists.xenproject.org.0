Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3900D4160CB
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 16:10:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194309.346143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTPQn-0002M1-58; Thu, 23 Sep 2021 14:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194309.346143; Thu, 23 Sep 2021 14:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTPQn-0002KE-1K; Thu, 23 Sep 2021 14:10:33 +0000
Received: by outflank-mailman (input) for mailman id 194309;
 Thu, 23 Sep 2021 14:10:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wGVh=ON=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mTPQl-0002K4-GG
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 14:10:31 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 020b33a6-1c78-11ec-ba47-12813bfff9fa;
 Thu, 23 Sep 2021 14:10:30 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18NDqZN7007034; 
 Thu, 23 Sep 2021 14:10:08 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b8neb2bnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Sep 2021 14:10:00 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18NE73cx147870;
 Thu, 23 Sep 2021 14:09:59 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by aserp3030.oracle.com with ESMTP id 3b7q5dsfre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Sep 2021 14:09:59 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BLAPR10MB4931.namprd10.prod.outlook.com (2603:10b6:208:331::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 14:09:58 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f520:b987:b36e:618f]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f520:b987:b36e:618f%8]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 14:09:58 +0000
Received: from [10.74.119.142] (138.3.201.14) by
 MN2PR16CA0019.namprd16.prod.outlook.com (2603:10b6:208:134::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 14:09:57 +0000
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
X-Inumbo-ID: 020b33a6-1c78-11ec-ba47-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=jkDtPb1T0sU5FbY+CiYBQbSOYKSIUZIPL2BFDe0J36I=;
 b=wD9yLZp7FnMvrwHZf+j99va+yc52085wMo4aDFnsrSxbNG9PJgzG9TVSeaHgoC+r5R+/
 P/4ZlVq8v+1/o4yC8e88KgLajeXclXwoiWJ+W/mjrvaAKsomOGXyTiNZ359BVpIweTD8
 Yu0lcpuiO/1NL8nkasjNgMseRRvtaF+mMeAEmnfPme+sxMMpOM8WXbHjKRJia82WNk2q
 6msJVMBxI2Z1XvFQBfCrOSPS36sRxfxvBKCfgdg8dWbxBs0QPFYsfEwHIvDWBgtu9oKU
 tCKMVfgJaZgrr+Hp4i9MUGQ9L0BQnMWey9hk1VcLq130t1OW/u+8DIJeJjt/g8b8ZXTm Mg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZrSV/1aAySU3Z21yZRq3db2wvQnABx6rJeBDeXDPu+0JaG5ahHdwTxR5Uf+/Vm9C+HZB7QoMlMJY9FnttiawI5A84kwxN+ik3pF+RDzRk2GCl14T1aM/uUZYxKHj5j9t8nT8IOZgJJh9g6Cw+8EFiIM8PDOvaSiObaN8jy3WzlTU++LjBXphuH2JY51glF7/IkEAMNgVZ/Xm4YyH+DWCeY1vImskYgwbVi6aZSmtQjT0Hv87lKqDizfkRs65tYC8I/iEjRj7RyP/nSxjRYhfvA0CjrlIuQ0B5B9fwdYQr/9l7O9LTbCbhM012HQYbyBKvfP6VnHJaWUzmmFyLVjInA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=jkDtPb1T0sU5FbY+CiYBQbSOYKSIUZIPL2BFDe0J36I=;
 b=M8SjOf+KMU9W7gKJeusdvDMT8lARc0zkiJE/4cDw2W8VTrEs9ci52yV1Jr5CBfgXnMIlMzKyEPYbpKn3yZr9gIoX7btIdMJ/32HLen5+BDHStJJLFc3JEeVw0rH42QeBvRwt0GcvwEfzAz2qjqc6haQdXkjDctmBCvjRyyhZ384XEKXEir8oIzcDzE1JXRIkHhE2pFWw5J5rW9XrF13cekm4DzuVF2ewITR2eSlH4FcLqDAQx7us8ga/c/ayiVShTzbe7RwClqzSYecB1J5fo6Rw3J4dd+WeVSC3Wc/4JWRcGm0Txu2APhsVAU+KV4fKwxvFUfphy3RkAiGj4aV03g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkDtPb1T0sU5FbY+CiYBQbSOYKSIUZIPL2BFDe0J36I=;
 b=eaVXRq9cifzhamMPpiDUXbOEqTaw5/J36X5+3IZ0smQ2o28ItsUH0ylrlkRAzCppsl0EEY0yoHEz3xw6FM4zND1g4qkKRDXZfEpvev5HFaeDR4INAhM2bhnsUWEp04y8ltpjMQBJJp1ZWOxGyLbuHF1CD0U9fqwDZAERbEzpRIs=
Authentication-Results: zytor.com; dkim=none (message not signed)
 header.d=none;zytor.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH v2 1/2] x86/xen: remove xen_have_vcpu_info_placement flag
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, Stefano Stabellini <sstabellini@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
References: <20210922103102.3589-1-jgross@suse.com>
 <20210922103102.3589-2-jgross@suse.com>
 <212d31cd-650d-27c6-b523-fd4f686872d1@oracle.com>
 <7de79902-e31b-899d-44bb-f9daabb2ecf0@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <154d8fd5-1c31-97b2-8d8e-d50c9ff7a51f@oracle.com>
Date: Thu, 23 Sep 2021 10:09:55 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <7de79902-e31b-899d-44bb-f9daabb2ecf0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MN2PR16CA0019.namprd16.prod.outlook.com
 (2603:10b6:208:134::32) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2074d78b-faf8-4d84-dbe3-08d97e9bd33d
X-MS-TrafficTypeDiagnostic: BLAPR10MB4931:
X-Microsoft-Antispam-PRVS: 
	<BLAPR10MB49316794D3EE8C2DE6A090B28AA39@BLAPR10MB4931.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:336;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zifko0Ij+HI9t6Fq9bvXLNGjo8c7p2qbhzaqpgRIOo9DFxybwXWbQ2tfj+auvm++aW49q/Fe9cO1frGe2tga+ALTu3LpZUmBDmW9JZSXPZwk6B9iR3rVlSa0Uyd47L8cSDF4eGz5j8od3Qw0jEK3ufl4jyQ55fXbQsscr4cWwJjyYH0Y5a7C80b2sJSxLIJLiLXcFiDum59LoGtUNASRmchGyAQRE65qwXe0t0yu0zUO5oTfx2+Zq0k6iV9klW9S1YICcyLlyoKHRwmlYjrTTI9LaIum5iw2Makb/zMFxHtomt+ji+Dy5suHdv7OyAZuBETZGivajnPN3mdxBwKxjgJh/dMpSO/dP485ZGrLBDeKYxfSGouuf/4Ym8wvxcLTiKW2mAeN483QkgvW4TzYF+/BNDMDklsAFTyisoUKsngBSZei1ncqLJQk1NLLc91mRUw+/B9PdB2HEs2HrG/RgESqPlLkj7fJM7WWzSUZSR2gG/9rWt327z2Etf8vL178/hiclFr/TTzkZM7ahMXhpIlDwfr/1YHm/l7VXisZfrThP1rxNS+n6WQ5e3D3zLYwx4Q0mN+RjfrNyth/SfULHFiRIG+GhTweuot8dCUYopy2W6SP+qbTqvBjMh6oqIC+E+7Zk3iRhyw1Jxd2SZ3Jk6HsM0VpK9b+vWA0A4XWrDUkfDoSlDzyJQi6qr/os60Rp0andWuY6QlRuoNXtt92H755jVE+CoGc4fBP6NY/rWKxzQJ3mtv/zD15F6rVVtPQ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(2616005)(4326008)(956004)(31686004)(186003)(508600001)(4744005)(26005)(38100700002)(44832011)(316002)(16576012)(7416002)(8676002)(6486002)(5660300002)(8936002)(54906003)(2906002)(53546011)(66476007)(66556008)(66946007)(36756003)(83380400001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?enFobldFVUhrWlcvRlhkRVZKVThPdFZqUGpRUnduOVp5bUhZa2IzS0tEMHk3?=
 =?utf-8?B?SVk3eGcvbjlQVEdzZStFM2ZFc2phTDQzbG9xZWpLbzZLRmdRajN0azc5dFN5?=
 =?utf-8?B?M1VWck4zaS9JNW5YRFgxRVRoOGYxOUF1SDRISEFDdWZaWk56ZEF3Tm8ycGx1?=
 =?utf-8?B?OE9HSUdtN0ljK2FFRm44VEh3anF6eHAxdDMxbk1oMmNsNTdNWGpwVmZ0cUFn?=
 =?utf-8?B?N0N4SCtZVC9JYnlQZnJINytNMVp1MlBPTTVaSGc1VHN5TDV2ZGpDVjVYWlF4?=
 =?utf-8?B?V3ZBUHNaYjNkT2VqSTl0NC9yeE9Bdng4Sm9QWXpsbi9nSXJvc3pBN1J4elZ3?=
 =?utf-8?B?RGNZdTVKNjYwNVJQTGF2dzk5bVRvM3VnSmRmWUVJMHgyeVl4MWZEbnBBK2lW?=
 =?utf-8?B?S0l6Rk1zZU1TN3pVQjVBRlhNSnE0TTIvVnM4R0JvbFMyWkhXc25GdU4rN1kw?=
 =?utf-8?B?VGVKQWxRTzJGc2orRmdERmV6eWtFYmhkeW1GelRVZHBrVEJjUkJJcUpZM3J0?=
 =?utf-8?B?bkJzSzA3R1A2N09zVTRIZmxuUHdpckcvKzVzTGg1SGRDZ3BsVlY1VDRiOUtx?=
 =?utf-8?B?UG5uT0V5Njl6eXpaK1ZrOG42cmgzbDVrOVdRdDZJblZ1MjVFa0p4dmpjRW11?=
 =?utf-8?B?SlRqdExqTjNMbllaNnZYdThSN0kzVlB1by8wKzQxM0t2b0d0S0RLMzlpRWRq?=
 =?utf-8?B?MHQwTEUwbHIzS0t4cTRKUHMyQjM0a2hyTUlJbm1VczdXNFFxRU81aGxnUENh?=
 =?utf-8?B?VTJrejBTOFZRVFVZUVZBZFJuTjFuUkZ6YUIva2xvK2Q4OGFnN2p3dzduM0k3?=
 =?utf-8?B?VlpSMkZnUS9YNkMxR0x3SDljUUJ6Mk1GQnhrMFFocEdRZUhaQS9rVkFiQ1RC?=
 =?utf-8?B?N2lJcGFXZkthTG5CbnowbFlYT0pVQytNdjBnQVc4RDFlajVUQ1RBMFh5OG41?=
 =?utf-8?B?eCtXVm82SGdlS0I5SE9vQSswTHhaSVJVS1JzV3AwYTFwalk4N0oxYmlmeDNN?=
 =?utf-8?B?QlpwcUJVYWJESVlsaWtFTWRmaU1oQWIrcmw1ZFpHazNGcWt1YU5jL1VzMkU3?=
 =?utf-8?B?amZDSkp2VkU2UE43UzZtWXlmZTh4Snh0ZmVGL0hBY0ZGZDl4RkwvUkhhOWRJ?=
 =?utf-8?B?VGNTaktmWUluWkhIZ3RlUE0yNkYzUTlkcnRGeE8vRU12WHd4WS9WWnhrZmRX?=
 =?utf-8?B?Tmk0aHBqTHUrTU5DNytLdkswd0V4d0cwTExPWk56bEVqb3Bob240ZUZPSm9w?=
 =?utf-8?B?NGdPQ0FXem16Z1IwMWhlUzZiaVF1aFlUZXhLOUExWVgzRXVsOXJSbi8yK2dW?=
 =?utf-8?B?QjJBL3JpbXUvbEtLY3pTVitIbXFtVHNGZWFUK1RtOE5XbG80VVIzZVAwaEM4?=
 =?utf-8?B?bGZDeWsyOGdsMGZhc2JiU0Zra3B2U2FBa2xjZ0N3QVlGbU1NV2tnd3pGaStR?=
 =?utf-8?B?d3l5K0toaFBEZlN3N2tNRmdZekdDVHFCUVY4U3BIcDFKcWFFaWlXWTJkZXJz?=
 =?utf-8?B?ZGRrYlhnV1F1RVZwUExHQTZSdUJHVTVLU0doM2libndpZno5ZnhYb3ZYcGhQ?=
 =?utf-8?B?cTZJRmNiT2N5SGtNNE5selhlQ2c2ZDl5MUZWRHlxT2xuVmxTQm9CNFp4QUVi?=
 =?utf-8?B?SGNTUlIxc3l2RTFOQ1JiQnk3b3ZoeFdIZkhlTzNYNWZUOXB5NFJNVlVBSjA1?=
 =?utf-8?B?NldYbnRlS3FDVzVIcjlEclAwclZjMFNhdm9HdWNFODdhTkwyVFh0RmlscWxm?=
 =?utf-8?Q?Ez99+r0C/qy66BlCrFnW/vcFp7Z3Y1vOpdss4qu?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2074d78b-faf8-4d84-dbe3-08d97e9bd33d
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 14:09:57.9877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bu+XPjhqin/BmTfvFLj6R9eBrA0umBVK/zZpZ5nPyXW7Gh9ub8BHt0E/7MDMgiDCb2yo7QkuurQYNCfulysrNNoIAPpNpvYwH7x9y53eA6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4931
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10115 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109200000 definitions=main-2109230089
X-Proofpoint-GUID: CedxHG7Pz8_Xx3hoSw6Mr5tVO9aQ9zRo
X-Proofpoint-ORIG-GUID: CedxHG7Pz8_Xx3hoSw6Mr5tVO9aQ9zRo


On 9/23/21 12:44 AM, Juergen Gross wrote:
>
> Hmm, maybe I should have been more explicit saying that the hypercall
> was introduced in Xen 3.4, and only reason of failure is either an
> illegal vcpu, an invalid mapping specification, or a try to reissue the
> hypercall for a vcpu. None of those should ever happen.
>

That last sentence -- famous last words ;-) But yes, sure.


Assuming both patches adjust their commit messages and the typo


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>



