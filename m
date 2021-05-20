Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ABF389A9D
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 02:37:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130528.244459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljWfl-0001su-58; Thu, 20 May 2021 00:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130528.244459; Thu, 20 May 2021 00:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljWfl-0001q7-20; Thu, 20 May 2021 00:36:21 +0000
Received: by outflank-mailman (input) for mailman id 130528;
 Thu, 20 May 2021 00:36:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vYVO=KP=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1ljWfj-0001q1-PN
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 00:36:20 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b4a3fff-4289-4f29-af53-69b76a58a8a9;
 Thu, 20 May 2021 00:36:18 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14K0T4KW168290;
 Thu, 20 May 2021 00:36:18 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 38j68mk598-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 00:36:17 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14K0PJVs080348;
 Thu, 20 May 2021 00:36:17 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
 by aserp3030.oracle.com with ESMTP id 38meeggxd8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 00:36:17 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BLAPR10MB5010.namprd10.prod.outlook.com (2603:10b6:208:30d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 20 May
 2021 00:36:16 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::78a3:67d:a8ca:93cf]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::78a3:67d:a8ca:93cf%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 00:36:15 +0000
Received: from [10.74.100.102] (160.34.88.102) by
 BYAPR21CA0016.namprd21.prod.outlook.com (2603:10b6:a03:114::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.12 via Frontend
 Transport; Thu, 20 May 2021 00:36:14 +0000
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
X-Inumbo-ID: 2b4a3fff-4289-4f29-af53-69b76a58a8a9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=e7JL9BougwBdqLLM7IJdi3SWfPIdq1UHo9tiH7xcB8E=;
 b=0KTutHThn7dsOF4co0D4RmcwAAUVFzbBklu868lXmdGea07llJaCvTRbBIWlsLuz0m2f
 //UxptKhMK7CzU9MD228RPJZVI0eMjH5O4o5HH8E/f2liKkQTKrj0vk3s26U5FzSuFPF
 scOaXnkCfZh938tiuAcNkvCZI5TFZ9Z6gzHKF7EkAsvE0VuOakGhLACpAyUzF55GFtjZ
 QaVydHaTJ911EVNs0w+pknnZDJBkeb+rKBh80GRForY2e0oM58qtk68mB3lhOhNFndzn
 QGykGsIIjqpE21edXeR6NvyfLAqWubCJ7oesbJpJELS1ur0y84Wq3E2gyQoNu0r1o13D GA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmrpvx8eRHSr6+9FnaKhAQJbTHUFj5uJvxecBYtMjm4zrbmTAdjY6m3y4NBf6x4duzgojeL84OCgcLKBBSVrAHep/S25GJvDWWDOHHxWaMAGUWpzVBza7Jcl7/ewHIzhLNphgH7uxAjXdRZzo2qbX791yK95OiPKOI/BOi+pHIlFnoJxr16d6PxhDZXmw1AWpNk4ar1I7vgAL9kJpqgkytN6YBRBGpWL520cyr1Ev/2DXcgIAH0r+K5grsHjULiTXEK39R2esbrhBw4deSiNFhTH1uBQoloDr6R5HIVSrTc8aoymHQVIMX0reZMmMby5IeZg7ZM5GWQuqWVXj1sJAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7JL9BougwBdqLLM7IJdi3SWfPIdq1UHo9tiH7xcB8E=;
 b=aNQvqv0bVlIb3Y3qt73HsUU86Uy1+Qkx4JPBPA+fmEeCh03pB4U32UUIz5MGOX0pr6w4h/hAr8nbuc52pM7Zh6YbX36WUDi3h6Um0n3HKGGAzgfVVKjBK3v0XznL8V5k7+XLtFGJPT0M6Sotj+5bzqOB0CWEp3crkiHQF8xiH7SPhizzXJKSyrtyT9rTy0UibrsYolVdiib7xRmLfTVLMI/kfe7XsDjurQdwEy8pPKmIR3/GzPM9zQIT46NIY+Ry1M1/px83b8U/JskO8kd103Vev8ierlEQC/V1og/c3Pr2jXZEOcPvche+ocY536guPDnLxer/3OrtgURankuYaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7JL9BougwBdqLLM7IJdi3SWfPIdq1UHo9tiH7xcB8E=;
 b=t8kPfHbPd1W1DlJvIiAljZ1XjaJo4eqsz17mtpiddGgrEordzUGKTK5yE9txWUIKxsyRzV7FbB9plLdi9eSOtUVwxzVtWkpkFvbga3/3bRo11QVfoTTdk/lh/Axf4+hpiLeLJm15aHSQANFjSfltO0cjz7CF1StQrcHR3/bfE3E=
Subject: Re: [PATCH v2 1/2] xen-pciback: redo VF placement in the virtual
 topology
To: Jan Beulich <jbeulich@suse.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Konrad Wilk <konrad.wilk@oracle.com>
References: <38774140-871d-59a4-cf49-9cb1cc78c381@suse.com>
 <8def783b-404c-3452-196d-3f3fd4d72c9e@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <87d771dd-8b00-4101-b76b-21087ea1b1df@oracle.com>
Date: Wed, 19 May 2021 20:36:11 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
In-Reply-To: <8def783b-404c-3452-196d-3f3fd4d72c9e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [160.34.88.102]
X-ClientProxiedBy: BYAPR21CA0016.namprd21.prod.outlook.com
 (2603:10b6:a03:114::26) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d902290-9f78-43b0-38c0-08d91b2746d2
X-MS-TrafficTypeDiagnostic: BLAPR10MB5010:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BLAPR10MB50107957122FD224933D43338A2A9@BLAPR10MB5010.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3BdSNU/ep4AuLjUdyPmuSkfX8HBFdJuB79CLl0acLkboJAK2YXy4UAVCKeXgsapIP0iiblm89zdJbCyGg/9FxbIGRaPSCCCyqUzyxOirHjoAtMCcefdvUel6qUg38N3T2kiuALAyWWgp8QRB4MxXTDD2sNq9iPqBD6np/3mMX6ApMnoa0DcV6usnCkiLHvjIAPWzKkZm8R8yY3J9qQ1uys/Dzn2C2VzDxgvVvKczgCS5lgCosB0cILOX0pgKrECEqlmyYkM23fbUr3E4aiZEzpmFNOUQ3lL+7Nn+MoHderew3DDOKahQKjBnnCqx6U1eK5OXBf7ub7/ne10iCYfbyS6HiRUxwkLmkPMzjmNOLAfTGy80P34fnu/2kN7ZLPf7Vn49Nr5gcNHRucZ/PDm0gdIl0/eNtLFphsCZoksqDfCpqnvGuGffewlD0JullLZNkZjPEgjFr6TCYv2GqNipQz7Nven+sTG+nlZ+9/Av5KbiEYkQ8lVP5ErPsFYiyEAqVgIZkRCTJ2Wwq/RydRM3If/gk57OG0/xZ89Inysc944jnpetY8roTz0Tps2UDe+4BTgsMo+vPFw66YfPt69Ta2KN+l3BAFr9t3AqlYXRneZ1bjx6pMUu8rZeqeU0ZPRadhUj6mk/dsVJ3mCwZYybo5UbM9csVQdp/mnETm7VDxdCD98Gpyp8Xetj5YTb/AIn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(136003)(39860400002)(396003)(376002)(16526019)(66476007)(107886003)(66556008)(44832011)(186003)(66946007)(8676002)(110136005)(4326008)(2906002)(53546011)(31696002)(38100700002)(26005)(31686004)(2616005)(36756003)(6666004)(4744005)(956004)(86362001)(16576012)(316002)(54906003)(478600001)(8936002)(5660300002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?dCs2bHJ2SXNlZ2wrUWFrM3NyK0QzUFgxM2RkODJrWjkvN0I0RXk2MHBGbHht?=
 =?utf-8?B?bm5WSVZwWUNHZU1TVU5LSG13OXN3QTdHRy9uRmFLL3JiNFpGSnBXL1diemxy?=
 =?utf-8?B?ZGl2QkFTbC9lc1gxZWpRMnNJNDZsVW51TW5DdENGSVhVOHlhUk53YlRSVHNG?=
 =?utf-8?B?dndndCsxanNDL2N4Mlo1RHJDdWx2aFRRVTlnN2JBeEJ4VFREWUhiZG5NeHB0?=
 =?utf-8?B?OCtOL3Vjb3l4YUtCb29STlUzTHdtTVBockF1SEQyRjJ3MVp0R3VtR2psMisz?=
 =?utf-8?B?UVVXUW9hQUNldTZGT2VmcVdlUCtLbVRxcy8vQVNxWjhQSWJhVTJFa2U5S3pV?=
 =?utf-8?B?UHl6cW9aQUR5MkRCMnVZYWNHV3JCZUVDUjZyOVJoeitPY2VDK1dxa3E5UURq?=
 =?utf-8?B?L21WR3FucXFVZGlUY3YwYVovWlZqNXJvM2FNZHRXVkF4K3g1a0I0Ym9LeU5s?=
 =?utf-8?B?ay93ZTUwaVJ4ZWJWYW95K0xxNkRpSVRNRTEwWGk2aklOSVUrWXRuUFFsZEJx?=
 =?utf-8?B?RFdHOVlKVmtLcEd5aHlOTS82cExZNGpqMmsyL014dFlwK1l3U01VYXUvQ3N6?=
 =?utf-8?B?Nmw2RmIzY0NHbXFUeFh0M0lnd2FZVW83bk1vallFaVlvQ3R5b3Z0UndxTXQw?=
 =?utf-8?B?eW9sNncwOWF2Y1FsZDN4Q3oyUDRWdGxrRjJIckJNUFArUmZoNXJmNHErb290?=
 =?utf-8?B?YWxpNC9xZS9MWXY1M3Q1S2x5OWEwN0F5ei96NnVpNnVkcWdlb2Z2ZmV4cW9m?=
 =?utf-8?B?eE1kOG5ubTFxMFB3Vmo5UnRiWm9MTSttZ3I3cnBHNXBoMmlVMnlHR2grc1JI?=
 =?utf-8?B?YnRtalNpNHR2SGlXZHZidFk0QUx1MHZXeVdqaktXaDl4TTlEUDFQT05LallH?=
 =?utf-8?B?amZPZHRBbkd2RDNvYmk5U09MZkhZYXlMcHZDK1BrS1pRZUFNc0V4a2VUR0F6?=
 =?utf-8?B?a3MxR2ZCaTAwZWsyMXRtM1grMXVZc1IxeStUTmNUSTdmc1FoSGwydVBqYVU1?=
 =?utf-8?B?azQ0MTdCZnlNR2hOa0dlNmVSSGRCYVg2VDl2QmVwVFJXZk1PTjhDV2dKUlFx?=
 =?utf-8?B?cm13NStMSVp4dG1pVEM2ZXJRTXRaVUZ4QXBYYjJUaHQxbnRrMWlqNEpvZkZt?=
 =?utf-8?B?YmNjb0ZwUUM0alR1dWxVTE1KcFQ1UDI1cVNQdWR0dTlQZ29TRzhhMHNGMlNu?=
 =?utf-8?B?NGlYamVmb3lOU1pPUlhERW82Q1dZTmtydklSSGN5bUxiRUxWcktLZmN2QjA5?=
 =?utf-8?B?dS9oY2VGU3lkTEZJaFBNbE9sNnZTc1g1dVRxSUVBTGsrT3Q1eU5nT3dWQ3Vh?=
 =?utf-8?B?VXZIR0UwR3pyZlhqWjhyc3E4dVd6L2xZa2YrRmZ5N0lpdXJ4Sks3Um9pL25D?=
 =?utf-8?B?QW9qWkJOSFRXSDY2Z0ZDNHpGbjlZam5DNkM3UzdEdTdOSnVyQjBtMW1rVXNw?=
 =?utf-8?B?dTFuRi9pbUNSTTh5UzU2anhta1ZPcHE0UXBqM0RxeG5paFJCT1k1NDQ5VXRW?=
 =?utf-8?B?em9GWVJ6ZEsranpZemQ2ODNwYVJsNzJkdnhRT1JnQ0s5ZXN1ZkU4aERYR2E2?=
 =?utf-8?B?djRmWVNrZjhuNHU1TWZuc29KUGlKeURqb3JxWXdTYTJSNlUzRW9KQ2J4YjY5?=
 =?utf-8?B?U0ZjQk5waEJ5NUlmRktXTlJJYmlCdkxxOXYraEZYbUs0Yko2SCtBb1g3Qzhz?=
 =?utf-8?B?djAxcStCeXhBMm1PWFVHQUFUOWxsaVI0Nm9SaE5PYjV2UHZkajZ4N05zbmY4?=
 =?utf-8?Q?fdaO5JhMkP9bt2eChGlVLtRbI03zDGJEutaf3F8?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d902290-9f78-43b0-38c0-08d91b2746d2
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 00:36:15.6946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vycd1kLbPJ2Vm7g4RGd9x2uUFcCFxcDB3KglXGLU6dCWFls4wVGHt3rNHqHChrNwY5hF0C6V80Z9dIpoMemzs/TSNoM0gJ6F6bVP5x4O4u0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5010
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9989 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105200001
X-Proofpoint-ORIG-GUID: tsgkU37CjacsXT6sLQo7P7srcts9V3AR
X-Proofpoint-GUID: tsgkU37CjacsXT6sLQo7P7srcts9V3AR
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9989 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105200001


On 5/18/21 12:13 PM, Jan Beulich wrote:
>  
> @@ -95,22 +95,25 @@ static int __xen_pcibk_add_pci_dev(struc
>  
>  	/*
>  	 * Keep multi-function devices together on the virtual PCI bus, except
> -	 * virtual functions.
> +	 * that we want to keep virtual functions at func 0 on their own. They
> +	 * aren't multi-function devices and hence their presence at func 0
> +	 * may cause guests to not scan the other functions.


So your reading of the original commit is that whatever the issue it was, only function zero was causing the problem? In other words, you are not concerned that pci_scan_slot() may now look at function 1 and skip all higher-numbered function (assuming the problem is still there)?


-boris

