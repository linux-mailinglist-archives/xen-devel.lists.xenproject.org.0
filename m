Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AC5515859
	for <lists+xen-devel@lfdr.de>; Sat, 30 Apr 2022 00:26:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317837.537359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkZ3o-0000gA-Ti; Fri, 29 Apr 2022 22:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317837.537359; Fri, 29 Apr 2022 22:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkZ3o-0000cb-Pw; Fri, 29 Apr 2022 22:26:00 +0000
Received: by outflank-mailman (input) for mailman id 317837;
 Fri, 29 Apr 2022 22:25:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GAsh=VH=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1nkZ3m-0000cV-IM
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 22:25:59 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5591541a-c80b-11ec-a405-831a346695d4;
 Sat, 30 Apr 2022 00:25:56 +0200 (CEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23TI2Xuo032179;
 Fri, 29 Apr 2022 22:25:50 GMT
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmb107740-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Apr 2022 22:25:49 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23TMLWUc034181; Fri, 29 Apr 2022 22:25:48 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fp5yqp12m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Apr 2022 22:25:48 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by PH0PR10MB5625.namprd10.prod.outlook.com (2603:10b6:510:f8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 29 Apr
 2022 22:25:46 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::4455:2c02:503:a182]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::4455:2c02:503:a182%8]) with mapi id 15.20.5186.026; Fri, 29 Apr 2022
 22:25:46 +0000
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
X-Inumbo-ID: 5591541a-c80b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=5F9bg2FC7c56ALiLt08UT5vmAe5mNv6uzmnEuIJ9B98=;
 b=A9W1amgm95nznP8j3nFwuHPjUE43aUCSg0CP3TQSEYE6PLaJ+yOauNmyxwyVU2uHsdtd
 cXwzbKfzqhTQQ/HfJT2JOTgEwupZk7c2f39gYm4R+r2kYi8Rp7TQXdXbQcf8IR0jq+NB
 DRNUdpIjdneNY0CwSOZDV+Mwt8jCL09zj4V4xw0kT2LL/2fYfKaJRUJmEspPw5mkOqN0
 RFO4oe1fqS/BbiGORbYO7lToSdPAfHnHhO/M2DoinbaHKiOSRP4oF3R/B97bRgzvRbDj
 sqSU1VXOViSC7o2nLfVUgHJa2lzBeAC2t2nR2Ee3FoVbBoLAiEX4QdkYhy0nDG631dHQ 6A== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cghBGt2BK49uTEYKeHlBWOwMygurdTtTAE0FIm8S24o/VkufzbuE3cYOOlTMTAamv7WOfVj4aoN4FKIruY200PA3Iqh49c3Jo7WNv+DUi8T1+/rnNGbtj4BTVxoDLLgTfPO/TnbAcbJXUyjeVymFergkmRVKyIkLDjCMtNL09g0W6UV8kyoFhLk9NAlzyKY/iAodw1TGxzbCfR8uzx/u4gJDuLaICnOxxmlZn1U07K8v9ZfjUSe8QjqjcxHlEXg2B+lS010izRno7/5QvN/W8WsvS5GkndqaVx3UmisCiiO3TtHYK/vA6eV/QcNiBEvWL2bHftsidC7UVGTnLAzOww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5F9bg2FC7c56ALiLt08UT5vmAe5mNv6uzmnEuIJ9B98=;
 b=mMnU8KYdc8oNfw4Qas3m9I8Q48ddaM8fwA5CMQAr44EO8ORhqsYLAY9Watb5wncAXqcjA/ve919MSZuKbMsIWZ3Sd0eWXoYX4zQYK3Jrwz3fMX9+kTCbsfEgHl7zhOx1x8e21oIi/oadJGEiO0JAn3mOLhT1ZhW/m1+qMtHvb057d/7g0S8Jvj2In0ziQsNodyrCCkdAwRM/YftwE7lL9U3X4DBpfnZZL/ZkXjAd5VEcLNPXFf6CK0Mirp9g7XgU48hWrc4GihaOGlc4e0WubCWdsUb1wA6AnvphR4VdrIXWl7+VVk+BXoBTlOrN8/++D2BFhWVdLL2oa1q5Pz0Mdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5F9bg2FC7c56ALiLt08UT5vmAe5mNv6uzmnEuIJ9B98=;
 b=UALCwT4NSvmU5KJxUcTQXM5sh06yX0aZoDvdRR1UhQjfN1iW6tpwBIIL/v05A8wpzSmsp8UkudyRvSQgv6JdYzXZgRxByna4DXVXI/bNySUTH4C6mCC8nIMGVxgGDDI63ILLg2DphQNpewV0yNbcqw1DvPGnte15iwU6IamQRzg=
Message-ID: <fdb13c95-acde-ebac-9864-e661d7daeeb7@oracle.com>
Date: Fri, 29 Apr 2022 18:25:42 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH v2 0/4] xen/pv-scsi: update header and harden frontend
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
References: <20220428075323.12853-1-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20220428075323.12853-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0071.namprd03.prod.outlook.com
 (2603:10b6:a03:331::16) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 779b4171-c5cd-4402-fac5-08da2a2f34c7
X-MS-TrafficTypeDiagnostic: PH0PR10MB5625:EE_
X-Microsoft-Antispam-PRVS: 
	<PH0PR10MB5625E112099D6B6F7F9EE3458AFC9@PH0PR10MB5625.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Gu6j0r+Ek6iOY7p62xaec9GBCmduokHhW6tMv28qh1HMmwUXjEZrtZAm1t0oGmNHsmp6PpdDK6I6V2RUgJLv3KGEsckjhvBI7t3llaOYjYlUKt7Vih180iIno8dzj80RKwBu35s1vzzhW2pbr4Rrmgtodxal150Wm7aSGvXKQSpxwCtDwlCVgqJvFDJ0/0mh4diKCD3XvnOoC7Uvbu4Z9Lv65voTMP3PAsGcMOB1Q4XvT5i3PqNFiw2XgjkfoNrXob+8W5lzX/D+T+IPvBUAb7oewVaF3LSfjmZssNOF7HVu5AUmyALPhitsHC05ndaZ5yICHc8sQ8CosGLAAOIEEx9xYAUgP2SFPNjVvSNI/30gqGHMYf5S8Y50NxYAr7CWYdZfakibWxUghQHdzX1mD9bfCw7qT1eX7jttcgWXJELkk/isQhjs9Ah5gcBwM3RFQeX1njzAyEMYbmcdu6o79rWx5Tcot6zJ3GHD8NPCPbpMYeNvU9dgj1B+d5+LxbtLhRi/FquwSbxsyTs1xKJvYkgJtWieOPNFouxwhYQU0JAiHCM8l5fgqh8TPqh3hLmUuvVkn2mAx4DoWc25qcGLxXD7EIeYmPPVzjK8bGDzCqstW6YVFlpXDZYm6g1eLw64AkRF41EsC1Ultl+TqU+U4YutW9RpPOnkFOtGDj/uTiwLlurdV3bhfR+cNMhJlq+DzaFg3MWx3WkRsAKnfwqpc7JbRpu7Uch1UW2r5tH/PaX87HXRpujPRIkQpZ2pk3fZ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(8676002)(53546011)(6506007)(15650500001)(38100700002)(44832011)(2906002)(2616005)(66476007)(66556008)(107886003)(66946007)(26005)(31686004)(4326008)(6512007)(36756003)(4744005)(6666004)(316002)(54906003)(5660300002)(6486002)(83380400001)(31696002)(8936002)(186003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WVVCWUltK24yS1A1Nm1QUUFOazNPRWRlZnlIdU5WbGp1bnh0MjhZc0ZDS1Uw?=
 =?utf-8?B?SlFpeW9kT0VkSEZVQWlTY1JKK1NyblpIY3dPa01Gd3p1ajNTQ0Y5V1VnQmRm?=
 =?utf-8?B?MHh2Z0d1KzE5ZlNIaVR5T3FUeUQxM2s4THZOMGpQSE9zRUk2ckttUXVvaHhZ?=
 =?utf-8?B?SDZLRkJQTEVWRkRvWmZUdldJNXBrdGl0b1lLQ1lwYVdkb3NYZ2xvRjRJeVJt?=
 =?utf-8?B?ZHVPb1Y2Q2xxR09tVWZyUDcrTktkME1uenpRcytSUHcvMk44S2J1VE9tczhj?=
 =?utf-8?B?dGFGZ2xPd3d6ak1jMmlOajNQQ1ZaWWVhaUVUVDhHTXQrbEVyZlMyb3ZlNEhU?=
 =?utf-8?B?STA2RjM4VXV5V3hGRTZCNWNwM1hvbDJ6eFVaN0NqejY3VktHUVFkK1MxSWR0?=
 =?utf-8?B?M25XaWZDVS9zTHEyUTVDUkp1NjV1ckIxWkxsaHdxaE1ZZ2pXNzY1dEFzQkl0?=
 =?utf-8?B?SkVlNXhmT1RZeTUzUUJjcW9hZ2JHMnpXWUU4bmV6c2phSkgrMDRRZ0NvWTk5?=
 =?utf-8?B?bFhqNnU4UGo5N1dQbjFUYlR5YnhRL3JFMmx1TkYwb1k5aVUwZnVFL2pYbEVS?=
 =?utf-8?B?VUxkbEdsT1ZEK3E2a1dWaVd5WGlvLytKTlVkUG5ZMEtvYkMyQTM5NS94am9x?=
 =?utf-8?B?QTRaVng2U2pCQzhlMnRQNzdBNE9SMG9qMUVidWdoMzZ1WHBjWXpvdHZPVG5M?=
 =?utf-8?B?S3AxYWJRSzJHa1l4dVBiamNIMHFhVE42NllzMkVqd2dQaXNycENkamdQeG5T?=
 =?utf-8?B?K3hHVzM2ZUJJVk1vREwvRFh0alRZWjFmQXBwTm0rZGhCdkVPdE8zM1pWQkhM?=
 =?utf-8?B?VFNwb3QyS0JHaFMzRmRXQnpmK0lBTWpxbUVDSEpnb0c1TFVVeEVWNUhQZTFZ?=
 =?utf-8?B?allGOVlDWnJGVjBZUGxVUi9DR2JwV3BXN0YrektNTFprbWhNMis3THlST0Mv?=
 =?utf-8?B?S1Jqak41UlBxR0hJbkpKTXM1QUhQREpON2Z2Q202dXZiTnQxMDdiWTk0TlJl?=
 =?utf-8?B?Qk1MejFCbEhIZVlVU3BkYy81ajFvQUZPdllsdjZYU3RKWXlvbi9CQnF4QmRS?=
 =?utf-8?B?eUFTa3ZmNktPQmhyQ2Vua3BlTEUvODdmWk9KYmJiUmlRKzEzeVFPK3pvd3Qy?=
 =?utf-8?B?YUZXTnhFOEs1ZFZXaWJmRzM3bjNlYXFSWGxiQ09hUWtSa1ZKSE92c3hHVHVL?=
 =?utf-8?B?Y0x6dVRKdnNKRTJKKzBpb3VaTkxCYU5XM0V0OUQ5TXQ3bVpDZXZiZktSK1Bo?=
 =?utf-8?B?akFVSTg3NlNIbHlxdnAzalFIenZMNkFjNElYbklZUzNWRVdnUFJNWGJjUnBs?=
 =?utf-8?B?S0RQQytkWDhXZG95MUNoS3JYdGJlL0E2V3laelZiWXZyU1ZFQ1NQMjdRUVJt?=
 =?utf-8?B?ancvQUFJakZscUR3bmVkYlkvamtOcWwvRkpQRmdVK3FYbE5rakJaeHJ5Undz?=
 =?utf-8?B?L2xwRGhBd3NLcXF2YUpwOC9peXoyUUxqdUIyTjlBNlFUb3VnNFpNYXhETHE1?=
 =?utf-8?B?Y3RtaDNqRkUybUNxeHRpOWxuZW1qMVRXT0I2dUNjUjU3bVlzcmFGV3lJL3ln?=
 =?utf-8?B?Mi9DY3BtUmRLbFN5Nk9KRUF2YU05ZjNmbFFSN2FJS090bmRIaThPdkVmWnE2?=
 =?utf-8?B?TG83bTJjM2lrR3cwRmoxanc0K0tvbmJFL25aRHVaSEZmem9YSzJRd09KR09Q?=
 =?utf-8?B?b3FIbUljOUxXM3g1TVVaQWNpSkIrUmwzWTVEVWhOK3JreXBXYmF0ZmFFbTVV?=
 =?utf-8?B?SHJhSmNNQlNkR29UK2pkNmMxUXdXNjExdEtlRHJCTGd1RS9VanRvNnEyYktp?=
 =?utf-8?B?TndpUUNnbW9pUkpuWW1rNUI0MTd6eXUyWG5YL1FWdjk3SmpEcERsTWJnbk15?=
 =?utf-8?B?aWhHeFlraEhnSFJqUFN1eUhubkZKUlRXemRtVG0zcVdWeUREbGRUekFmcjRT?=
 =?utf-8?B?Y2lZMGlTbUNvT2lZcW9rN0R3OFB2UG9vTi9KLzJXZHdkeDRJZkJZM1NObkFJ?=
 =?utf-8?B?TUJFMmtya1BUNGxIWi9hNmwxY0FjNlplTzBDWXNSVkViSjduQlFTdFAwRlVH?=
 =?utf-8?B?YUZhNURYVnE5Mk1iRVdkSEV1YTdCOWw2RmZDZ1NDZUEzVkhLMmpkMmpSa2lw?=
 =?utf-8?B?SG9PS1prR1E4bzYrV1Y4RWRhVDFCQU1MMmVNbE92SUNqMVhzU0FkR2xURGli?=
 =?utf-8?B?aVVuVStveU5TQ1NQdGVQa2YyNWhocHREa3R4R0NidUk3em5ZMEhjd29zODVs?=
 =?utf-8?B?S0liQW1rK2h0MURRa00xLzZUTS9jVXlXK3hjbXNNSnJ1SmdnbG1CUHNJK1Zs?=
 =?utf-8?B?cXE5V090NVFLSW9rSlVWdU1Pa0E4bDBlSUJQcGVtcXZqSmNvRjlOSFdHb2pw?=
 =?utf-8?Q?xJBkuFt7PY/ReJqU=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 779b4171-c5cd-4402-fac5-08da2a2f34c7
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 22:25:46.4946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O7lEWRXoqGSzGscaMZWLhdpSem2r176eqqtQAiFnWjDAgGNra/wmAuZTz4ZKwPLdmOyJ1jPDnj6Q3oD/WoHz3S5cZ5ApNgzo4EmuJVpNQrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5625
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-04-29_08:2022-04-28,2022-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204290119
X-Proofpoint-ORIG-GUID: n6uDPHv0HCE4EXJNLMHQXfznGGp7wYD0
X-Proofpoint-GUID: n6uDPHv0HCE4EXJNLMHQXfznGGp7wYD0


On 4/28/22 3:53 AM, Juergen Gross wrote:
> Update the Xen PV-scsi interface from the Xen tree and adapt the
> related drivers to use the new definitions.
>
> Harden the frontend driver to be no longer vulnerable to a malicious
> backend.
>
> Juergen Gross (4):
>    xen: update vscsiif.h
>    xen/scsiback: use new command result macros
>    xen/scsifront: use new command result macros
>    xen/scsifront: harden driver against malicious backend
>
>   drivers/scsi/xen-scsifront.c       | 168 ++++++++++++++++++++++-------
>   drivers/xen/xen-scsiback.c         |  82 +++++++++++++-
>   include/xen/interface/io/vscsiif.h | 133 ++++++++++++++++++++++-
>   3 files changed, 340 insertions(+), 43 deletions(-)


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


