Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F0E38B444
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 18:32:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131044.245130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljlaY-0003DH-3e; Thu, 20 May 2021 16:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131044.245130; Thu, 20 May 2021 16:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljlaY-0003Ap-0C; Thu, 20 May 2021 16:31:58 +0000
Received: by outflank-mailman (input) for mailman id 131044;
 Thu, 20 May 2021 16:31:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vYVO=KP=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1ljlaW-0003Aj-Ju
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 16:31:56 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a94cd6f2-7950-42b6-b29a-d5cb34b5b8d7;
 Thu, 20 May 2021 16:31:55 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14KGAE0b147816;
 Thu, 20 May 2021 16:31:54 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 38j5qrdb2v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 16:31:54 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14KGVWu4134630;
 Thu, 20 May 2021 16:31:53 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by userp3020.oracle.com with ESMTP id 38n491wea6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 16:31:53 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BLAPR10MB5235.namprd10.prod.outlook.com (2603:10b6:208:325::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 20 May
 2021 16:31:50 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::78a3:67d:a8ca:93cf]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::78a3:67d:a8ca:93cf%7]) with mapi id 15.20.4150.023; Thu, 20 May 2021
 16:31:50 +0000
Received: from [10.74.103.151] (138.3.201.23) by
 SN4PR0801CA0002.namprd08.prod.outlook.com (2603:10b6:803:29::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.24 via Frontend
 Transport; Thu, 20 May 2021 16:31:49 +0000
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
X-Inumbo-ID: a94cd6f2-7950-42b6-b29a-d5cb34b5b8d7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=TdWsbshtvy8CTiEBqnJ9thX/c6XJnD8yNkyF2CmpKsg=;
 b=AGUhaJRbbL+LCKP2pGvcp9Ro6GK9UW/HgCKyN4shV6fzetImfi9U+KjohPv+rgU3pXPv
 51v4tI4SnkFElexCyxMSmbTedvOKWi620wwuwcE/z/Y0n0bY287IvEUrjaw1+B18VFPV
 QnpaHEbiKMN3BQgXu2bfluI15YC5jjiZyhXjDlQS5jnbD+31TqeWobKRmCGxhQvgnwUM
 CT/eU7I/Hop0j17bEla+O0DMgljP7jTW/rRk5NdC0FwVkamQxLcemC3ge5NGLzf/LcSM
 bGDdULryhMkcEmfBCUi/Qo4432dMdXafBE2b5Tk/oPfyr4cS8Np6MShoniF3LhSlI+BK mA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3zGizRzFlHexRXcAqMULNgcek0EoWzpOnSIbdWYkp0dBzkOgn8xYb0JARl/uXB+VPnldqdzwRYjimCCZi/kOyrqeloWk2fJM94U2AKEQ1JlysFNH+9VQeHItSA0GN5PTeqlvG0OZdG3hSFXTwLw+b0cGkEehrqyuxDGQWpzzvxpo37mQCkRPgY9ZL61fSOVGT1Ci805PIncTXoaALmbw4f9m0mYgA6ikyTJfZGbn7WTL57w0WPwgG+E98mIlFmGQ2q4GOO/3gwYQaR5SogI0noW6MFTN8GnvX5XVdNn6oaYqLQjcZij0P6T5EJGx4cEmlg87WmOpyWfADWIDusb3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdWsbshtvy8CTiEBqnJ9thX/c6XJnD8yNkyF2CmpKsg=;
 b=kw/J4vZFNiLMMzYHIMV+Jl+C0FJ4gddxtKCFAVUQ7vKcpvMhnoh04aJsk3NnpUnlbv1Vbm2MzwVZT/MQtuX43wmTZ0hzu4fiU5fT2No0a9KYQLlyjI1SruFLH9n+IUQ9dHjxB24uIUO1sGwYojqzx8/g12VubSp2NEYPDvaH0mYstZU9yE0id8IaW8oOKABkX7gDYyFKEmVcDbRlix8jcSBGWi0O+wgKt3FxxJcUincKjD96KCEsq5cr2M8rZPnJ4aNc9+IT3tAxNvHpKEmTEKGszkVNOqHVIJWd8mVXpJLuAg00mfSbI7LO+P0kQztS17iVA2CygdnU53GH4MgUuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdWsbshtvy8CTiEBqnJ9thX/c6XJnD8yNkyF2CmpKsg=;
 b=sAHdq2wGRMGltPBaB5K2/oVJKn3d+yvkXaVSYaw9igaHOSXm0rSseDRR7w8ZMeo4JeJA7FdkYC8TkRR1GQrolRIXsDoEGVdYzmDtjONEBvQypM8gA6hCAo/ysLCbQ2yS7EK23QXXF9uszHIUUqstCeIbQf9UYGuoKBYVIrt8QXk=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
Subject: Re: [PATCH v2 1/2] xen-pciback: redo VF placement in the virtual
 topology
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Konrad Wilk <konrad.wilk@oracle.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <38774140-871d-59a4-cf49-9cb1cc78c381@suse.com>
 <8def783b-404c-3452-196d-3f3fd4d72c9e@suse.com>
 <87d771dd-8b00-4101-b76b-21087ea1b1df@oracle.com>
 <214a6c61-5f6a-d841-312a-be2abb95f77a@suse.com>
 <75bfa4bd-cb4b-fb56-1600-6aebda4cf4cb@oracle.com>
 <83aa295a-9329-f516-d439-75d198b92bf0@suse.com>
 <184ecd2b-b35f-8427-7ae2-e265750f4fae@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <36a58512-25da-2885-3e2e-1be75ef21071@oracle.com>
Date: Thu, 20 May 2021 12:31:46 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
In-Reply-To: <184ecd2b-b35f-8427-7ae2-e265750f4fae@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.201.23]
X-ClientProxiedBy: SN4PR0801CA0002.namprd08.prod.outlook.com
 (2603:10b6:803:29::12) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68833bfe-24b9-4f08-6ed0-08d91bacc507
X-MS-TrafficTypeDiagnostic: BLAPR10MB5235:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BLAPR10MB52350B44D0447BA8E0D615298A2A9@BLAPR10MB5235.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9VbLBf55p6ddMfJVb6deyDqU2AQaA4cFuplQUbTPb/HLnbOyb8RhdQtWl8mt1IOunOKRIlxqP933Fod0JsOR/9W5gaYm0Pt9LWSRziN0R20NF2/xNfq/amxR0+xqvzOhPjxwpBD8ZSiQAvgB9Xl6WCeCIHyRUpn++nlmQvFO/MHScSMYcixebEyfhpYenAE48iJLOL1OQ2OiEwWNe7VYZ9jC8kDcrCz5dEXL408GWzoUbhvMt/aSMO5nhAbxfh6OSBxJjmNjATs9cgJf01uqR3vn3dZ8Ka89Bv4yPmFQjujqRmN0eWq6YAKKWiW/HBStrlf2NBP/VQVfInoW6hhjc8x1fyfIeyhxZ+GTBcZnlYSjSxafkSRc/ZCOACottDj7lM2PP4coJELiSzI6AyG17pxsIHUjYvdOVb2fzS46pGUjcWC1JmJq1Vie2w+o1y9JsAXBNGNsKgeiuBv9N5aNf8sfky1y8nU6cDZlcuxe/jAb6hquULxjN6MAOFalVma1NLRRFiF4zjpkJ4xPmQkHhIiY+hXKe/LaQs58uZFQ+5fCkoC76uTx7TMn+mbPTEnY/TGnSrFwVdBQsNzKtMpJWq5x6h1GtkI5Vbp3pK8vp6HCIEkJL1zH0coExZyJhXei7/SdcdoRnemjLvWuPtOLwp+5hYVW9qvXalnD3wPvcRxO+x3H7uOBSMIIRhhrbFxj
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(136003)(376002)(366004)(396003)(66476007)(478600001)(66946007)(66556008)(31696002)(4326008)(44832011)(53546011)(54906003)(16576012)(2906002)(26005)(316002)(2616005)(956004)(86362001)(6486002)(6666004)(38100700002)(36756003)(5660300002)(31686004)(186003)(16526019)(8936002)(8676002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bm55eGN6ZVNlQW1zSWxiOHVSLytqbDVzVXJZUFV4TXZFazJUTDlzZS9zOWVE?=
 =?utf-8?B?WU91ZEJuYkRReW9VT0hJNXJhRTBsbTByZU1IYTFXelRjNDJQUGZsZEMrNGhp?=
 =?utf-8?B?OFhOWFd6NFhYdkE4RHVpUUZCVmlHUzJFS2k4VnRxazh5WmZEa091M3lhTXNM?=
 =?utf-8?B?TWdYd2JWNGtiNm1uL1pYWDlKZ04zVDF0OWRpdXZnUDdveGp6OTJjZU5NY2dD?=
 =?utf-8?B?cFZTaUJScUNmSDNhZHUvZE9Ed2JFbW5GbktDbVdQQTFVMitXc3dYOEszMzFU?=
 =?utf-8?B?dlRjWVdkN1JLdWRLTlVPbGFxMGNpL25XVEpKNno5RlpsVjVSTkdwM1FxaGpZ?=
 =?utf-8?B?M3U4MDlSS0toSnN5QXFJOFY3T1ptT21pTUc5Y20rUk1aL1lZLzcvc2hVc2xn?=
 =?utf-8?B?dFo5Z1NuU2k1MmtVUnRjK3ZKNW5jbFR1Q2cxcDcxd0NjaWw5MEhBaDl3M1gr?=
 =?utf-8?B?TUtKakxMVDEraGtpdkdSNXJhMUp2eEdwWHVHTUF0cDZFVmZ6L0UwUmNGeEd2?=
 =?utf-8?B?WFhGMmh5U1N5TXNDcDNCUVYrSG9QbHhEZnNqRndpbjVnNmZhRFE0bjVzd3F5?=
 =?utf-8?B?eGk5UXJUUm11aGJZK1lLUXZ4bzhyaXllYVlyZXlaVkpvWWNZZWtjSlhBUGY4?=
 =?utf-8?B?bjF4YXVDbEtGNGYrM1hZcnU3RDlyVFdhSGpxZnJneFZLMmRYa1VrcGJ2VmZW?=
 =?utf-8?B?WWl5SEszZXdUNTNMNFpVOGdUZ1QzckVxWWJadTcyTHVyQzFSVUhVYVE0K3Fs?=
 =?utf-8?B?b3Y5NENIbzE1dnRBQklxaFlmK1JYRnplWDQ2Qko5VGVBOEViWGVMa3BTRk84?=
 =?utf-8?B?N0RmajdsL0hBcS9XNVN4Z2ppbVR2UVN6OUpIQXc4SExNTkljWUdsV2lFOTRR?=
 =?utf-8?B?L2t2RUZKeXJLdVJuaVdqWmxMa0dTckd3eGJuY0NXd3lNWGR0Q01LMUtpdTNh?=
 =?utf-8?B?YWlSOTVnaTRkVnhpc2dUUDY2TzI5MzJTNXNVLzQvY2FhUGdBcStmR3c2dFNn?=
 =?utf-8?B?TGtKTGlWYTdhOVR1S24ya2JDeXJoM3VHTXUwUGRtVGNCMmNvMFVSNXdxSVRQ?=
 =?utf-8?B?TFpXd1hEVE5ZNmo5Mk94dE9xS3FieHJkc1VkRDN6d0lrVDV5blJ1cnpPeldi?=
 =?utf-8?B?WmRETTBUdXhwZkNFa29QQXY2WnpZK2wyNHVuanA1Y0VmNG1NTWFvSFpINVU5?=
 =?utf-8?B?UFQzUW1mblJOOXNPNkhwNVlraGdiTlpTNDVLeEUra3IvWDRQdkhGenoySy9N?=
 =?utf-8?B?SDUyY1gyVUViYldwMVRtS3JVaCt1YmhsZFoxakk0QW01akMwNExLMmMwVDdM?=
 =?utf-8?B?Nk95bmttenI5RGY1bVp1elFFS1pRaGVFZitMRVQwQTdKWjZzVFQrcmtQZW5a?=
 =?utf-8?B?SUJjak5CQU8wL0FtczhsOGNLZGQzL3owRERheklXNUd4SXpFelh2eWFTUFVO?=
 =?utf-8?B?YlEwMXdMdjg5dkw1QVJ6WDYrS1dhUmthRzljb2V5bG94VmQxOURjUW9SenRm?=
 =?utf-8?B?LzB1NVRCWmZINkdFNkU1UUF0RFZrT05rTDZveVYxa3BYMGRxZnNvMkNLcjZU?=
 =?utf-8?B?Z0tQRGY4VGdZOEJ4cmpzd0pPbitHeHZKdktFamN0bi9UYXdwdk9XbHViYUJv?=
 =?utf-8?B?VllTVEdmUEduN05WUXJxejRzNG84NFhkblA0bTQ2N2tlbWhmaUlORnFiTjhW?=
 =?utf-8?B?YXJBSE9pUzRCeFBQS1UyTUxFZDYxOENqSFBBbERxbzd6Y1oxZFNsdGtJRmpT?=
 =?utf-8?Q?50l0uafmtd+UaGvfnDN6mKwcYFObDVsA8VT689W?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68833bfe-24b9-4f08-6ed0-08d91bacc507
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 16:31:50.5062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dzOAqR25qSDaLSnvDpgEc8ncVuLMMhjwewT6YUFvttLFP3KUJIRK+Ll6aweVXfyBLulkn1qCUY5jZsxxkFdppAT/rQUN+AGWlXDUk6RhBOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5235
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9989 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105200107
X-Proofpoint-GUID: isBr_AJNrQF4BE8Wcu5lYJwSE-dekiUt
X-Proofpoint-ORIG-GUID: isBr_AJNrQF4BE8Wcu5lYJwSE-dekiUt
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9989 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 impostorscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105200106


On 5/20/21 10:46 AM, Jan Beulich wrote:
> On 20.05.2021 16:44, Jan Beulich wrote:
>> On 20.05.2021 16:38, Boris Ostrovsky wrote:
>>> On 5/20/21 3:43 AM, Jan Beulich wrote:
>>>> On 20.05.2021 02:36, Boris Ostrovsky wrote:
>>>>> On 5/18/21 12:13 PM, Jan Beulich wrote:
>>>>>>  
>>>>>> @@ -95,22 +95,25 @@ static int __xen_pcibk_add_pci_dev(struc
>>>>>>  
>>>>>>  	/*
>>>>>>  	 * Keep multi-function devices together on the virtual PCI bus, except
>>>>>> -	 * virtual functions.
>>>>>> +	 * that we want to keep virtual functions at func 0 on their own. They
>>>>>> +	 * aren't multi-function devices and hence their presence at func 0
>>>>>> +	 * may cause guests to not scan the other functions.
>>>>> So your reading of the original commit is that whatever the issue it was, only function zero was causing the problem? In other words, you are not concerned that pci_scan_slot() may now look at function 1 and skip all higher-numbered function (assuming the problem is still there)?
>>>> I'm not sure I understand the question: Whether to look at higher numbered
>>>> slots is a function of slot 0's multi-function bit alone, aiui. IOW if
>>>> slot 1 is being looked at in the first place, slots 2-7 should also be
>>>> looked at.
>>>
>>> Wasn't the original patch describing a problem strictly as one for single-function devices, so the multi-function bit is not set? I.e. if all VFs (which are single-function devices) are placed in the same slot then pci_scan_slot() would only look at function 0 and ignore anything higher-numbered.
>>>
>>>
>>> My question is whether it would "only look at function 0 and ignore anything higher-numbered" or "only look at the lowest-numbered function and ignore anything higher-numbered".
>> The common scanning logic is to look at slot 0 first. If that's populated,
>> other slots get looked at only if slot 0 has the multi-function bit set.
>> If slot 0 is not populated, nothing is known about the other slots, and
>> hence they need to be scanned.
> In particular Linux'es next_fn() ends with
>
> 	/* dev may be NULL for non-contiguous multifunction devices */
> 	if (!dev || dev->multifunction)
> 		return (fn + 1) % 8;
>
> 	return 0;



Ah yes.


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


