Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5339080EC
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 03:45:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740288.1147330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHvzz-00010y-Ls; Fri, 14 Jun 2024 01:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740288.1147330; Fri, 14 Jun 2024 01:45:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHvzz-0000ye-J2; Fri, 14 Jun 2024 01:45:03 +0000
Received: by outflank-mailman (input) for mailman id 740288;
 Fri, 14 Jun 2024 01:45:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OutG=NQ=oracle.com=martin.petersen@srs-se1.protection.inumbo.net>)
 id 1sHvzz-0000mE-1V
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 01:45:03 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5e51c7e-29ef-11ef-b4bb-af5377834399;
 Fri, 14 Jun 2024 03:45:01 +0200 (CEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E1g36C023371;
 Fri, 14 Jun 2024 01:44:43 GMT
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymh7dts9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2024 01:44:43 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 45E1MGYk021157; Fri, 14 Jun 2024 01:44:41 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3yncayarj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2024 01:44:41 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB5755.namprd10.prod.outlook.com (2603:10b6:510:149::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Fri, 14 Jun
 2024 01:44:39 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7%4]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 01:44:39 +0000
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
X-Inumbo-ID: b5e51c7e-29ef-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to
	:cc:subject:from:in-reply-to:message-id:references:date
	:content-type:mime-version; s=corp-2023-11-20; bh=+79uwD+gc7/Azk
	WHaz9elwN98+GlpMxUcxT2+tx+VF4=; b=D12rKqv82d8NSbeQ5vtou5ZNnEwecA
	+D4yu3ri1535ZUKULSCEBTJgnhob5Wx6m2WFNhNRQtwlJ/jqbZdKc/PbJPG7oo7p
	4kP4fRqOGAk/LqwGzf/wYWn8R6A6v1CQFuGZccplGmPYMoX5zV9aPlmb75AlQawi
	+Y+6UarVjAeT+xKvxbgAvFvN0V7cA8IoW7uYKAy9YtfBXFYefwv72a3poAERnv5S
	u5AgKyiTLNZseYm4HX5Nnq876XtqgGlbQGM+gsYoApO9Pi4osoEI+lsan56yCe3w
	V8AG/0HN6H7v1Mxp0IL2vK286pfuW0R1mQeU24Oc5SJyN5nLhOqC5Drw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZbr4pqZzVI5DRq8+M6WJ1ANVA1TWpiJoGxkSq8t1ym/Eyw0DDBmmUVgk6zA/mgSxFwJdII+0SUA9qf455l3jQ3/YYJUIvQOgJfAx6ranftCr2EGWHhR9X5fJ97TJLmGxoHwjFVge+EOEUJTUbSE9h4BwZglrpQet+hAYPLOBAtdeouQ8B/PI63SRXwfJ0Ce/LWT8X70aUmiPkquSOaVm6wYEdXXjHpZlf/hohgqPAwCoPo0zxCGKmrN9moMZU0Y+pbWroTQfCOmXoixKtw8JFMw4w07edl7G8g33pEIby2ze7Rv/+2/Nj/v4d6j7StX2ojiW5cQTuVM4Eq3Mt7efA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+79uwD+gc7/AzkWHaz9elwN98+GlpMxUcxT2+tx+VF4=;
 b=bpyeFv4bnpQeTVf7h7/+AlLuUmXtdybdRioxU312w+cQ0vj+s3MuDbNoqeC3MDV833TyNiyru4MjmXQZRIe6iz5D/Zp+zaBHGBQXS0yykAlq7k+zRnpMytSY8XJYOSTherI79mLPG9XxzX9Eisj4xGXsJBlk8Iu7zWzcrIJ5YoK4zh7G3YxRhmpHd7IWOIO3RKntZfVWNjOPtAmf+AJ+JCUozPfgCsmoebK3XBkrO/jZ9lmN3lQW/C1AQJGNQFZe8IDUEA+D6bIPM/QrZMJ6MeddI/ojl+Q0vjC4QEUHngq9FE6aFfdckL05NroNgwaQ+f7CaqZLzCwNJO7HLhB32Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+79uwD+gc7/AzkWHaz9elwN98+GlpMxUcxT2+tx+VF4=;
 b=G1xjlO7v2Ul0QWTppjIp6ElbfkNybUNLWGUMN42OO7YGv99mr0M4Gv4mk9JxOKqfSxFBgPeVtqd0jIHd1QFoHyZYwAeLAQkrPKR5Z+7zedMVQHdpYVn46cYHkhhCj6k3+IOsGJEPT7LdQU8jiqGTJtcB2Nf1sR4j14zEryx1G6I=
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>,
        "Martin K. Petersen"
 <martin.petersen@oracle.com>,
        Richard Weinberger <richard@nod.at>,
        Anton
 Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg
 <johannes@sipsolutions.net>,
        Josef Bacik <josef@toxicpanda.com>, Ilya
 Dryomov <idryomov@gmail.com>,
        Dongsheng Yang
 <dongsheng.yang@easystack.cn>,
        Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger.pau@citrix.com>,
        linux-um@lists.infradead.org, linux-block@vger.kernel.org,
        nbd@other.debian.org, ceph-devel@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org,
        Bart Van
 Assche <bvanassche@acm.org>,
        Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH 10/14] sd: cleanup zoned queue limits initialization
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20240531074837.1648501-11-hch@lst.de> (Christoph Hellwig's
	message of "Fri, 31 May 2024 09:48:05 +0200")
Organization: Oracle Corporation
Message-ID: <yq1h6dws3gj.fsf@ca-mkp.ca.oracle.com>
References: <20240531074837.1648501-1-hch@lst.de>
	<20240531074837.1648501-11-hch@lst.de>
Date: Thu, 13 Jun 2024 21:44:37 -0400
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0064.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::41) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|PH0PR10MB5755:EE_
X-MS-Office365-Filtering-Correlation-Id: 8072246a-2772-4be7-99dc-08dc8c138dff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|1800799019|366011|7416009|376009;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wIi/g6WvZO5F0nxdoz+q1+Mhy7pTC6OP/8vdRy0QPgQKnBaGrBFr0XHCmn7G?=
 =?us-ascii?Q?e8Bn2c4mIY9GHB+rYUKYXVHt+jL/L22pfKFWYocJLicnRmRSo4RCuLB5jIkg?=
 =?us-ascii?Q?S+noC0/mNwr51AaAnNO6W/vI2U31ThwlI9YtzsOh4AL/SeE7MEQvkBNa+h3S?=
 =?us-ascii?Q?AYdgOlFgRLt3wrVO5WUnppU+SKtgpl0MtNnJqmJnNp0ooh3qI1aPmL+T6A0s?=
 =?us-ascii?Q?b2YOOekXZ7snjrWPOROkvqKKFdagJprxCyvh9VhP6p0T6KulWZP6r3VilMmw?=
 =?us-ascii?Q?N0B4sH7Cxn/Rw8ll3fzq4acrw05w+h1l3ssBMAO454vOAgGBQw0DvX1vmBMz?=
 =?us-ascii?Q?6RIgq26g/aBd1x2ojqcqkU/fR4oYEZZ/bwizY7ZqZDYHRx5UYjllX8RFvr6y?=
 =?us-ascii?Q?aTkg5R+oDqZY4nxdTdBojIFv5BH63DbjJ0JIv/Q4pjsZyJYKSFPziag2FQ8F?=
 =?us-ascii?Q?SGu204FNl9DdEGxikNhJOCOL3ooOJyGtC4FqJFjHAFW52E5rSc0gGwhQ1osj?=
 =?us-ascii?Q?OUZQ5Q8hmeBUNMGql3aHBe5UckmvslgMkWRNBwCIbEYH12f4pQGwwsZAk2ym?=
 =?us-ascii?Q?YNhqn3VhLkr/BC47N2cWcUy2y+X2LPzopHlXqtZ664SwsnnVJurzqPKKoQwf?=
 =?us-ascii?Q?felkGDfh2TKQJPdLd01v2zYguL2GRhSPg1m2cOsFe8iNLE9HVxjDsE+ZL/lx?=
 =?us-ascii?Q?NX0+0Vffgg+2F9tbM1Vk/mQUP2r0/MfJphnwvEGK5pFvixv7C5CX+7ooehlt?=
 =?us-ascii?Q?wM22HSDT3woMkdAamRiNWbZtp2+0cJfnYtf+wiTex0XnIA77K3lDuIV7kRlJ?=
 =?us-ascii?Q?vo858TUD6tr3SacqeY/4Z5ndUn95zLCSG0YAFZkqp/IJSN2c5d/g5R2zF2i3?=
 =?us-ascii?Q?TVVSoRQPHgOiHZK/LBHm5BWkj0RRBpamLRE+Mliweup5MIHsADKF1S4vGeEl?=
 =?us-ascii?Q?Ny4FcDE7s43ZOlio1wKPWxXI590AvaTFM+rNoQ+B4RZIlO8n0dQpGB69L++8?=
 =?us-ascii?Q?7agecV000HLba6V9so6NNIhq0AWlkCI989+Qf3mphhvrR/oZoFfsMnC5HX50?=
 =?us-ascii?Q?8qrB+ngJ+zUEhYcxpb9QVVbKp7esHKmMrI6O+pivc6XawCk4l/VXkQHT0H1F?=
 =?us-ascii?Q?jW/u3+rDhkzsC32ScVboxFTcI7gt/fn8bEPkDF/n8u576M/0lJkAbqJlBt7n?=
 =?us-ascii?Q?ehf5gx+bOnlURfudW3jYD3nTZcQHlPcKnXpOHM2GyV2A1Ss57YP5wQJq13b/?=
 =?us-ascii?Q?fbCqwXGEArl5TwJvRbA2xgoLzWQRKswjXXqPOqV3IfIGkJ8Zk6I80RoORs9G?=
 =?us-ascii?Q?1B+Ke8oWO5jIu8y8iW3b0zVD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(1800799019)(366011)(7416009)(376009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tHsFYc0+ma7jnbcYoN1o7LWPuzYBs2dT6uJX5BlzGm3ctn3BBV+2CJkN3CJM?=
 =?us-ascii?Q?71h14bQRXq9YbvwHY0aY0fXhwAjWA3OVzrohpArKINj1pWj92BtwD9sc50pO?=
 =?us-ascii?Q?ufn90G3Nz/J2Jde+ZlNsX8MGQBZtpmaAD6Dy7Mxz13kCgPJD6KleGLBd1ccN?=
 =?us-ascii?Q?JvR2pDLeYe7rKEjZxOOC4BVqw2Q1nAUyMFwwXTGoUBKs+n8aIgCI2k+dw5nz?=
 =?us-ascii?Q?+WwLrnsz0dI5Lqi1Kjo+05gI1GzW4AxCuRpFMbsrGEc2lFc5Fpqb0ZF+os0T?=
 =?us-ascii?Q?xxATboAEc9hqZ+ZfQYGqrWZuk+G9LwbjxuW6FnYV0KdulNOjiiQeBLbUDlZ7?=
 =?us-ascii?Q?FI2t1PSk3ly+bthETuH/Hp05pm5kpGXQRNb8RgyXH/hCps8iXuxP2Lbc5Eu6?=
 =?us-ascii?Q?UbzAXg4G0BazwjM6eaMaWPHFMd26vDaNT2E5it6KMioeUFqtP1HMocFNSncr?=
 =?us-ascii?Q?7+XIz+K5vvTrSwmtHCs4n9YWs1ZA7/6g0bQZUCE7yIetj8E1nX/k9o8KbdOe?=
 =?us-ascii?Q?dlHDWhh6eY3gZmSc3DlsaMpOFkHaAwnD1br+5LbCiD122VS1rrsl6YJp7ITG?=
 =?us-ascii?Q?EZQd+iGpFDkvbpQt0U+134TwqZFmYW2Ew4slzFfu73vJUIsAjxNxeCgd9lnt?=
 =?us-ascii?Q?uGXwTV5w2JnOlTUOz7+3AukJKtwS0fOllTH31DfmgZTjOxnLmI5Emc+egpOy?=
 =?us-ascii?Q?LblY8PgYatOYPnSHAd8MyeqdNaE1RWf660APta9TDYQNEWn3t99o/0DxTMHn?=
 =?us-ascii?Q?4HZKD8ootzRb2v3ElSRls0VBT+/OVeZ47jGFshpB1ISsVnuhivYLNXOKXaU/?=
 =?us-ascii?Q?V39vt0mYCc4fN3j1qKJJcX+hob9L3a88gc+Q4gY8zpTTdTR9iHj5hu3jaYwD?=
 =?us-ascii?Q?T0Ni0UlhpVZMuQS2hMEi8emLX8otDXIUMLGnBmw1q3i/5rA/+F0fWmZboL3i?=
 =?us-ascii?Q?+WOP/4KYaY+SOUMUFaT7vEG8cB5dhaMxEGoKGWWfC8O9zyjYGESBOtjp+sGr?=
 =?us-ascii?Q?JnIBMym1eEtdJcpA5ElYc2SZKd9vUbsDGjSwo+OA3zHhJl0C8Tn1eoS6xPjs?=
 =?us-ascii?Q?Pe36tKJlx2wxiI/BE8YA5HjyePQv258048LImaiuy6rUMrITCYGiS6Dj5cZE?=
 =?us-ascii?Q?M7WT5bH1ISbng741g21l16hLdLGaW7DtGwVJRj7DwcmdIlg9oRSHe3Yxjasc?=
 =?us-ascii?Q?cfT7wA+1fNMJlR/maD85yf82OwQ1TXQ7Y3/n6LSCgTlGWrAfHNbp2F9GhWvv?=
 =?us-ascii?Q?LzgvBt6bMTgOe7VF+PyEZqpwGQ47VRWugrSzR52bLfgmhy2+s+igfHWFRFwY?=
 =?us-ascii?Q?E1R/NiwmWGh8ceSsAJTDICxSUcciUwNej5yEFbEKZEahlqVsr5LHc9UVmHhN?=
 =?us-ascii?Q?Ug70P1M8SnpDSi7NaaVI8nnLA9Qwpf0PG1L8+n1+BvwzXTrwob+3WPRnaurA?=
 =?us-ascii?Q?UCvy78cWTRRffVJRZI8EP+3t0qfL3JWIibuL3qPVpe7jjRoV6/lXbb8QnuQq?=
 =?us-ascii?Q?64nIArzhxsbupVmmckFXcVlg/jyYOW7DgS67kJP3UJNmhxVxnzeLxQymUiHD?=
 =?us-ascii?Q?5XTm3lqwYWSWH6fuMx0ciMOA7KMuqTORC4p6JqCR8oSyOGQe3L5Ju+2GgY2Z?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	e5YnFW6Di41hzp77FO9/RiN0yHTZRxDvmNeB/PbohpYLrcxzP3LOW5JxQJuG4qrpJYYeRbgQ//zi6ZRvtyoo+uJ2arcjUKehW0uuryizO1dKP64b9UQGiyhKVkK+lcK+eX2qzxn48BHZad6VJoZ6D33QpBIVWla5ocCS9r5fxTSQEG4/rj/AA1fHfuzDIEFoh6ptQSCScBC8Sj9Q+C/hs+BcugfbQvAHt7MGIV/H8cT3kIgoFGaJ6A/kbXakOfczcskMeU01ASiuH7Bgsoe/LloyuDHSaHwR67KgN0Hd/Ita+CJD1hYG0ch5/U7h3KLRJ9ZVS048FOc8UcOEoN8IY80SbBdpegBsPVT+P/0jAWuqK6jL9Kd/6JkPgSy3B/TMFxekPkYmhDZJiXQYI8kBjshD77gPWvV5OGljcVR8yKuWxGoQWqV4elj4nmLEibtH6kQ8N+h/SgOGtCAx/w/e4z5yXTHw32UsGIObM9sGPsRbex2OFQpLwiGR529TCw74n/xLgYzqdxul4NOOyRpZMc07C5pjck+Hu8c9sBs27C+kD1x4Fsk/IVk2Hk3qncVkJ0v+FMyXix7dpmdsZXqgVlTFE/vgbb3PaPHd05iGtsU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8072246a-2772-4be7-99dc-08dc8c138dff
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 01:44:39.5285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T3+Df2OYCm1S7pbGhQ8ax7VIQNnQgSDsL6aekB6ZS8AQL2wK0KjG9FDMg4CXfhRIeY1ZhRqdHRzWp8pHytXWnjaLm1qfh2zyKCO30x4usAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5755
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_15,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406140008
X-Proofpoint-GUID: 4ru3HucXwh0S_MuScbVo-YjxuGcgwBhV
X-Proofpoint-ORIG-GUID: 4ru3HucXwh0S_MuScbVo-YjxuGcgwBhV


Christoph,

> Consolidate setting zone-related queue limits in sd_zbc_read_zones
> instead of splitting them between sd_zbc_revalidate_zones and
> sd_zbc_read_zones, and move the early_zone_information initialization
> in sd_zbc_read_zones above setting up the queue limits.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering

