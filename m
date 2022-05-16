Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E61528C25
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 19:39:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330232.553593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqegj-0001VV-55; Mon, 16 May 2022 17:39:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330232.553593; Mon, 16 May 2022 17:39:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqegj-0001ST-1c; Mon, 16 May 2022 17:39:21 +0000
Received: by outflank-mailman (input) for mailman id 330232;
 Mon, 16 May 2022 17:39:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D7/h=VY=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1nqegh-0001SN-KU
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 17:39:19 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c189eb4-d53f-11ec-837e-e5687231ffcc;
 Mon, 16 May 2022 19:39:18 +0200 (CEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24GHXLme019520;
 Mon, 16 May 2022 17:39:08 GMT
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g241s4195-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 May 2022 17:39:08 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24GHZcqY005434; Mon, 16 May 2022 17:39:07 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3g37cnwjj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 May 2022 17:39:06 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by DM6PR10MB2554.namprd10.prod.outlook.com (2603:10b6:5:b3::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Mon, 16 May
 2022 17:39:05 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::125:f19d:8eaf:b8e4]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::125:f19d:8eaf:b8e4%3]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 17:39:05 +0000
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
X-Inumbo-ID: 1c189eb4-d53f-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=hNy9d6PYaYBd8YZrX6TQ7fwsF64yJdIXLXKJZErnogI=;
 b=mu0NBtu7Hn4cLlchgfxDRQqYBP3pwRwF20XQqMJ7/jWsC51Ng/XJXldI4315v1sCJcTL
 6jP1wGWjIvlXXtIo6K5TOvSrddvU/YWnZ1MB3/oXiSdEh01+AxLfOcknz3Rc/EWzjvFH
 DZN2m+Of2TyZelKFaL1/Xryq+XrNEVzKP18Obt7zfY8YwW5gsxFp/6aD0gapX49OAI0O
 RUaG11hYfKuK3jz/bHYEwX9e0aPzP43GWM3w9MuCXi8rTjdZ8+rU18+pozU9y6IrYZTq
 9ys8LdaQ2Ti2HdvizwWlNo3nalFu4/CNXoTFre0FXVqtf/x6wxe+LkqXuS+vo+Sr4dyC Kw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pg0lfYklU87fjcUZKCBKAuky4qL9E0iRId/t/4Y4GnhVpbO/DgjerJ8WdkIGEj1c2WiRdsFdTO6ZDWjdOsRfTudC7Rw7Fq0Lm7jP8HIHZ9cD9zNMbk54wmyz6N54NxyMEyXIwDavEtXe9wiruXobhBWOUPsqx1Z9h10hyVRfiFXng+01ZWgJjcd99Kqfypf0wAr4G9UpchJ9Ov7SfuSHPLRqfehhbQeE90o8NOzCeB4I9NDyhTunm5/gbYlKgoJMK3y+KeLb3gj5j98ZhdW6q6F0fKtDEe3hJPgx+/JprLVSHL2bCBrR42DMR025ym1GuSfBBc0fYkt2rl9U1GXjJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNy9d6PYaYBd8YZrX6TQ7fwsF64yJdIXLXKJZErnogI=;
 b=e0AfUbWcCksHd7yPsXCz2qgXtjvCWgEbXTVciy0wKwByYFLAJI3QcIGY74/cixHjz8lCBOCKChvWXlqn5PDvcYKbdibAJL0UXrktYcMj6spPeWsMiPnga8OTbQTxEVgWDYo8CN3q2kkum7aXqfIiwqgFAcWwoeYSIAG89wiK6FypxJDZTxBUVcH11pKEuMOU/r5CCUOdFBBBB2N2kVl1DOciMDGfv3kr8LKat5V6ZsKPsiZ5Lg0N/NRqwkotKKJ8liazdz3sA0lLdqjC9NTX/4JTfjd4VXmUtY/8MCurkDBjqqwhL+zWwzJ44i1wJtWmdod6rlI9IRnxtQ9KtyxiDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNy9d6PYaYBd8YZrX6TQ7fwsF64yJdIXLXKJZErnogI=;
 b=B37khgUksddnABLe+y1vkQTbpohuLJF7ypyk407BWqjBRZJX6XkTesxuQV/fULY72bJntW21nXv9XP+rqIpWnWk4Yyj56ZlCuYusqr3CbGz6Lxm6TPafid+rlVzCsyQ9d+lxz+DTSdaAEf32hHlg2uJ1HqXgrgwt1OF3JNxfwew=
Message-ID: <545549ee-ac0d-0fdf-7c57-6fa895e91293@oracle.com>
Date: Mon, 16 May 2022 13:38:59 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH LINUX v5 1/2] xen: sync xs_wire.h header with upstream xen
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>, jgross@suse.com
Cc: xen-devel@lists.xenproject.org,
        Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.22.394.2205131417320.3842@ubuntu-linux-20-04-desktop>
 <20220513211938.719341-1-sstabellini@kernel.org>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20220513211938.719341-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0187.namprd04.prod.outlook.com
 (2603:10b6:806:126::12) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cacbfc9f-b9ee-41fd-495f-08da3762f8ea
X-MS-TrafficTypeDiagnostic: DM6PR10MB2554:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR10MB25544461CB3C00A486B68E7E8ACF9@DM6PR10MB2554.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G5JFJV/Q1ylFeArULFLmWhkMYaGjQENC3QlWEIVRJ/vk3BiFe2ST23IX+c6KFiDU/9trMxTZ55Kheb1Tya2nUM6Vk08bBPpTZ0yUie9iXQO5uOPIDKv/kO3NEprPdc8LatMjcNrRjI/3OWJuDI4vOoeVtIyzJCtAWFTaqdc9crSlBG1tvonDOGW1ddg0A2X1GAaCUSwNg5Ta7sN8ljJTTZkNRvYZmB0Vw0cE/ms7P+q5sQlYXFHmc2Wm4ovYvAyKde/xZrzBFUI8BIpxhOMo8ffQrXmRkTpQu+Ephu6ZRmHATJkItHGQRgyy1U2lVumMWgpIoMLXx/sIicg+n+FCj38i3jYLWuHFO3+huY9oWEDNkY+bQHl8oq5qSAe9WOvp5kDTg4qN7Q24HdnQdc7gZEUhZdAFUzKYaq7stoiDjXFHI3Phf6rDgpoGpqeghP1ANf9ko5oy2oNfV2cPZEWbzOz4I1BPubLpxZjiPBk/eD1BFwm0FeoTNic323fxX0dvpQ4W7X5dVGH5/GFGjx7V6mmr+1RcfU9FKTAVl4bo/LhSo3jKVjM7L1uMPQBGFK7LHLFzc3GAtRQpOS8oeuBx3mikMGqsjbo5DNBOKy980SacDQ4i/RaQuvX4FZ5iLA6a27PlDvHUh7YcA0KKOFMyj71kn1lSK6yR3mURO520b2toDKClARwbef0p/kAeJbkBq7dIfHKa7DMmjaQbNDlNdebBIM3h4GlT/WHUeOSQbCCdpkAumIlJxCh3ijGXxlA4
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(508600001)(6506007)(38100700002)(44832011)(4744005)(2906002)(6666004)(53546011)(26005)(66946007)(8936002)(2616005)(5660300002)(316002)(186003)(4326008)(31696002)(66476007)(66556008)(8676002)(86362001)(6486002)(6512007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q2xVSGc2d1l1TlhPeXZKUlVoMWorVmloaDBPSlhNNU8xb1ZZSjB4WC9OWk14?=
 =?utf-8?B?MGtzYW9BQ0N6aXlDRC9JeW0rbTZQZlJUcTE0eHlTZi9RV3YvazZTQ3lZMmoy?=
 =?utf-8?B?dlQ3a3JmSG9OL2IvY016ekcvcndwczllWi9DMDAvQllrVjQwVFEySGIrTnEr?=
 =?utf-8?B?eHFJSGR6V3VQc2w5eGgrTCtlSm1vZ3RCK0IxVE1kN2V2NHZHWm0zT1VTSWFp?=
 =?utf-8?B?TXNXc3k5Rm9CNDh5anBjbUROMHliVS9hWUhwKy9IZjVwUzBSL3V0QWd0QXgr?=
 =?utf-8?B?V29lZlF6M2RwMWpsVmd5VUlla1FuUExWVGsyd2pqaUlrZ0p3NjVsM2VrMFJ6?=
 =?utf-8?B?MDlxdnpSeGxyVnRoV1hIWTBuRHJrR05JWU9vYTdyd3pFc2l5eXR0cEpNaFhO?=
 =?utf-8?B?UGVRcTNGRVQweEZDRTZUZHdZU0U2M21EUXZZNStUSWVkdDF2MkRDb2pHdVZo?=
 =?utf-8?B?U1prcG0xSittK2lkazBndzlMaG5SQ1FqS3FidEt0bjZZeXQwdUYycFBIY2Zp?=
 =?utf-8?B?NnRpbTM1SVhORnZGN0thR3E5ejRqWjFvNVRVNFBtU3BYUkQ3OWlWbExCSVVS?=
 =?utf-8?B?dTZWeFc0K0I4blhiU1FZRFliRUVQWkFLZGF2aUFmalJmSlczdVZzaVJsRWQy?=
 =?utf-8?B?T25YSUVEMmpSdWROMFhnWE9QRDRTTE54YW5vS2k1eThNMTd5b3hCMDBqZjNB?=
 =?utf-8?B?bFdQNzE4dkN5eFZFQkNmeUpYY3RUM3U2czU4MEluVFc3UWJPcEdzWWZ6Z0tp?=
 =?utf-8?B?dlpEempSQXpzdXRpRVU1RzV6VklKWGxUMGFUaFY2djFUOTRNQmVsMkMvYitn?=
 =?utf-8?B?OFhtMElMSy81YUFTQnBITVJWb0VHb1dPbUMvVnJjSnZBZ3NiQ1ZwTTVxMDZi?=
 =?utf-8?B?VnJ1UFZUWTBOa2ZXRnhVQktBNXg0SFlESjVtTWh2bmg0UkdOOFN6cmRrNkNO?=
 =?utf-8?B?K0VoZ3R0S1F6OUQ1aUYzNEZld21MYmhPcVc0TktDVGxJVjN3cDlIQWxEb2FO?=
 =?utf-8?B?eE1xR1ZNUUhxSFpmbzNrSGJKQ2J6cUpRZ1JjS25uRDdaNzlxRG0xS0FQUE1j?=
 =?utf-8?B?YmRMQm14eHE5NVdmdkJ4WGZFN3EzVUNERVQ2bFJWN2xyWDFlbXF2a3FIdG1q?=
 =?utf-8?B?OEkydHVYVCtJaFFKNXpMc2FIL3F0NjVRMktFSXdwelQrUnVhSXJWUnp6N1RM?=
 =?utf-8?B?cFh3LzdocEJHM2FrbDAzdDI0N0gvWXcyQnUrSlJ0cGNKYVRONm84RktjMzNQ?=
 =?utf-8?B?cS9ORXVOaTI1dGVZOXVvcXVZWnpaN2dpbDIrZTA2L1V1RkxmMCtkSnhnMVdm?=
 =?utf-8?B?aEdZUmRiVUR5YmNMMjJPaGhDT2JNQ2RXNUdNczVIVm9aYTRUZk9UeXJyV0g4?=
 =?utf-8?B?b0FSdUwwVzN4MTVwenJ1MEJFRHJtRkNCWUhVY09LdllkNG9JeU10dUdOaU9i?=
 =?utf-8?B?SUxzSnlqRFhzTmlwRFFSaFRscFEyMWN2NStRcWhaZ1RXSWtsOTZSZXgvYkh1?=
 =?utf-8?B?NkRVQ0E2S003Z3Y5ajd4Y3U2d3lYUEVmMEhXVWVnVVFaZ05YelE5cGNZbVRQ?=
 =?utf-8?B?Q002N2xrK1VrczFXS0FvaVBrWHRNSlFIZjRLY2NLc0pHVXV4ZWZ2TWtPZWt2?=
 =?utf-8?B?bEp0N1RzYW5lMDVOZEZYZXFXSkJhdk5Dem0vV2l1VDJicFNHcFlBMDA2Yzgy?=
 =?utf-8?B?amR6UWl3ZVI1Z3hIbkxqMGg0aEEyU20yT004M0ZhN0FEREkrOEhrc2ozYjhI?=
 =?utf-8?B?UVU4Nk1kNk14Y0xTeTRpLzl4WWYrUGQ4WkxObjRBcEN5UUE5bERBRkdTalBs?=
 =?utf-8?B?eEZiTHVmTWJCcDZ2b1prN2FlbUtKWS9EaVNYNXFYRHdXV1V2RWMvVUNZMlps?=
 =?utf-8?B?NmxjdGJGZE4vU1hsVFlhMHFLVnNYbFBnZnc3aDVuZU41V0pBaWRwRFF0TGZx?=
 =?utf-8?B?SkxiZFZRN005cDkzS0lvOEF1VXRqVERiQ1h2YTUwbGRLOVRSNFM0bHQ0WmxF?=
 =?utf-8?B?U3BhYzVZSjR1UGNmSGZVTEtCSlE1d21rWHAxWnBNL2VjY0JVYzRQVGZOQnYx?=
 =?utf-8?B?UVYwT2VJdmtaaUt4NE1NT1ZmZWRKYW05T1FocmRuYURaTUlqZXJRdGUvZ1BX?=
 =?utf-8?B?VnhVdmlwaml0Q21hNU00TWZGRi9kTVNZZHhpRm9tUWUvREtRQ3d2SlU0TERQ?=
 =?utf-8?B?M0JoaE5ra2JmdVQ0MVRuQzZ2ZGJIcFNZTHMzanBtazU5VFJnQ2M0R2pXdk5o?=
 =?utf-8?B?RHhFTjczbFJGMlZ1aGVCL3NVL0ZtekZlaVRwTCt1YjZpVStQTGtxYkVDQytC?=
 =?utf-8?B?Q3liVTJoZ01FaHBWa0h5S0ZxNVhVVlVOTTRFcUkrNjdpbDNsK1RVbndnRTgy?=
 =?utf-8?Q?s/vQVVrxklllzcfw=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cacbfc9f-b9ee-41fd-495f-08da3762f8ea
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 17:39:05.0335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eZkmD/uRKpFb+eispC4FfVdYfmUDNgEAfMVdS5zKzYtuNdZCkEP5ok42v2qysYgdwSkxW8DIhle4RaIi+PcXfk6omokIIRhOKIYfmMx0pqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2554
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-05-16_15:2022-05-16,2022-05-16 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205160096
X-Proofpoint-GUID: QucM697BXxBM8RShIpoO5kDsJLHQbrZB
X-Proofpoint-ORIG-GUID: QucM697BXxBM8RShIpoO5kDsJLHQbrZB


On 5/13/22 5:19 PM, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>
> Sync the xs_wire.h header file in Linux with the one in Xen.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>
> ---
> Changes in v5:
> - add XSD_ERROR(E2BIG)
> - Boris gave his reviewed-by but due to this change I removed it


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>



