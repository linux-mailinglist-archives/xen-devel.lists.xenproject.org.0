Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCEE3EABBF
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 22:25:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166588.304061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEHF7-0005zN-5A; Thu, 12 Aug 2021 20:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166588.304061; Thu, 12 Aug 2021 20:23:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEHF7-0005wp-1p; Thu, 12 Aug 2021 20:23:57 +0000
Received: by outflank-mailman (input) for mailman id 166588;
 Thu, 12 Aug 2021 20:23:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3EhH=ND=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mEHF5-0005wQ-Eo
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 20:23:55 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1141c4d6-8158-4c24-b1f0-68e9f5f3f3d0;
 Thu, 12 Aug 2021 20:23:54 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17CKHAYv020500; Thu, 12 Aug 2021 20:23:36 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3acd64by13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Aug 2021 20:23:36 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17CKGOlf113465;
 Thu, 12 Aug 2021 20:23:35 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
 by userp3020.oracle.com with ESMTP id 3aa3xy056h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Aug 2021 20:23:34 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BL3PR10MB5489.namprd10.prod.outlook.com (2603:10b6:208:33c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Thu, 12 Aug
 2021 20:23:32 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::7cd0:8600:6e6e:aa8c]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::7cd0:8600:6e6e:aa8c%7]) with mapi id 15.20.4415.016; Thu, 12 Aug 2021
 20:23:32 +0000
Received: from [10.74.96.128] (160.34.88.128) by
 SA0PR11CA0032.namprd11.prod.outlook.com (2603:10b6:806:d0::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Thu, 12 Aug 2021 20:23:30 +0000
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
X-Inumbo-ID: 1141c4d6-8158-4c24-b1f0-68e9f5f3f3d0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=+cHFl4S4x3A3CoBLHrWAHSPt4KftRBb3k0RmckBdrUk=;
 b=UI381mrKqJMC28oxek3BaujuEsCvD7wjLhyrk5wdO7qMrV6mBlTKQJg/TRuFeEZVpP1w
 bDw5aD/MCaN4wZaDk+KnfLe0bc4gfnnk8bgusnwGCg8lIjrapGkX+CVGNA2ueTX41Gfq
 hRBoYiJEihSk/t63+1KnMa4rQbpHotaPOlveMaH34ufYvggJWfdNZslWN8V42pHPGQ5Z
 lRpwXu/P5k5sdwAS0BrrkD+zzVSd3g+9o6Q2TnttTW4E4sukAK4SBnxz8filKMJgF71U
 pYzojBhk1H2USqCZ9488T3LG7Yn/JBvk9b2Jz9wFExVSFmdHAsP6eiApUAIov09h8FSv Yw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=+cHFl4S4x3A3CoBLHrWAHSPt4KftRBb3k0RmckBdrUk=;
 b=XI2Q/AanXiimzSG4UtJQuNaFlFMDDrk+IWUSb4ucDt91pst7zkdHu321mddr90p9KXzM
 L6xGSOF1Eycj8HHgSOwVhpDZar3PpcPaJMNqAY8qJ54llGGTVeq40Ph63FwaYKywmo7O
 +jSA1omJPfH2bgv35FYM5xwLSYTf8q7Loby8pFeYUCJ7xrPXQTGbY/zIMyFUVgfIcJ+I
 ilW5v0jnQMIcC6b6rZbhyiubuArmPs5gEJ05AYq8YTwHpmS6efHLr4WW//pi9YBUwDgo
 VkfyCizxlbVsjbuVugKGY3g1QsYFPhywdHnALlNKUi+p2tPq4gHfa4LwLU/RVyqhbMHK Ig== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZyuI+zMJniSEt2I6ZzFxdAfcIvZHBTP1GLgTQcvNA1OUUG6PEbwnRuriQhle21jb0oTVIM3ichx3cP8gkixIkTgbgTbn3zXKK2Ie1kShAINcYAQivSaweQxySRXnl8bH0vHu197HUjL5nY+XWp/HhUFUGifamhdMJvw+Pn3v9ZIH6mPVUtifVajKnPBjbgZ636srTIsk3WSIQL8cmydQ0JgC6r4QrVliZRxtCrtIKNioqnAvHxCFXQXdd0gcQ7zvtq8AwR7tpCEwhiy7J4g97rABHaSDuPNIJnan4yQfL3S3SH90lgUeduvNVLrSZf1yG2Ux8ZF7EeBrhsh0Ha0KAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+cHFl4S4x3A3CoBLHrWAHSPt4KftRBb3k0RmckBdrUk=;
 b=mGHfZrJZP6rPl2hfnCGZta2czULK7+5i191yMhwwRJUvEiuASmT4Pycv7EpD6RbE7HNS08EoAjz4PNWxjqSk4g93EZfAcDmhKigq9WSKI4WE7niEVLs0MNOr0hrzErrfxNUqllmoSerJQAkPEobd6hmD7cdYZZjsM1anLu8W4R8M+rnfJKFMoEbflerZox4RYRWq7LsWE7aGQzLXpqMr/jFmWM1Ro/SBrPV2jzHq7JK7PAB8LNc8OSD8yXlYZLlf9+BYFDRrs6wkS1bFF2H9dl30WdLv+8yCDwCZg0ZoQL1wxj/Y3IHkFYWuVx0qwe6xrOcy7GQGPu2yf9O5YACQqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+cHFl4S4x3A3CoBLHrWAHSPt4KftRBb3k0RmckBdrUk=;
 b=YAaebgp3IGHdgTCwLoySYjwZVcInNo2V218LFGTeAIUYvkA3Xguv72fcUAcx4beW22lH+8rVM+xEx8kZL76EvuVfYIGVcO7zcStsRzZLqKTPLdvjc/bjOAq/v7+/0jNMvrhrlt31HfU+6EWxNXGxpGOaD+5waecuOxjsTvMXAfo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH v2] xen/events: Fix race in set_evtchn_to_irq
To: Maximilian Heyne <mheyne@amazon.de>
Cc: Amit Shah <aams@amazon.de>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Wei Liu <wei.liu@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Jan Beulich <jbeulich@suse.com>,
        Malcolm Crossley <malcolm.crossley@citrix.com>,
        David Vrabel <david.vrabel@citrix.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20210812130930.127134-1-mheyne@amazon.de>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <da6174e0-3c1e-190e-6181-5c83f724a417@oracle.com>
Date: Thu, 12 Aug 2021 16:23:27 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
In-Reply-To: <20210812130930.127134-1-mheyne@amazon.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SA0PR11CA0032.namprd11.prod.outlook.com
 (2603:10b6:806:d0::7) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25dcba26-f649-428d-0b76-08d95dcf0db9
X-MS-TrafficTypeDiagnostic: BL3PR10MB5489:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BL3PR10MB54896C1AC3E3C491EDE50C768AF99@BL3PR10MB5489.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	U1OUQrZ3OjDP9oL3vh+AdEgwcc4CaNrsQdAlxP/AGeT3dav6BrueL28Gre5htR+2d20LkKBVb63IfViqU7JgOPBcdvJ/C/5zo0J5IZ8EnqjBo1+N7auXB8EmGVmXz+5lZAyjTiU+fo3m0duVSmV4zenzd+CO1SztViNlFoh7+D/xUZVIDy65QZnzkiHogQasEhAlyWM81OwKeLgElZdV/edhLcCAhxIqSJB+z0xdTKU/xHUT8zaE5OfPVnanRcNnGI9c1x8zpyXq8aXJbYM3kvpcEZDTW2UQksHkCItV6JmmZIAT45/r3iF7aWP12k5bI8KUv8PPCUPMYY3YEkv/MJ4PrMCG+wQVVgCrNJg/+9I6H8KkzUnVij9OlyGfuxC7h3cluWlW6Gr18IMiN5qt0XCwTmr6pz2DUiwb14L+WNnQVGmIW/g6PZFRuhwQaVMi+3RUcZ8nAGJI9OVmuFriF5sz9fI6SgQd1vYcmmKRFEw5zuirq9/XQ8DNasUY0MK/GRR41cUdOk3HZhSYdtPeI+aIMHJacHE1zgnpR+wU7B0Yjpqi6PxgLyaj3B1xTwmdteN0/R1sq9SlVtK2jQDWuY8Y6sKrYjWzexox8ke4h2oBv0BXv8gzsgkt/hm1nVu9unvhFyv/YJqTQs6DdfDTQWCkfv0lo4wiiBX2CNFD8CJCq/IuCwDnWWY01/wx/G44Ry1KBAsCxaFPY+aMEt91tNR2hL1W2oEzWIeiWJC+fhiqCMTTbhpOGbMXJgGXk+Ih
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(7416002)(316002)(16576012)(38100700002)(66946007)(6666004)(66556008)(31686004)(53546011)(4326008)(66476007)(6916009)(6486002)(2906002)(8676002)(5660300002)(31696002)(508600001)(2616005)(186003)(956004)(44832011)(8936002)(83380400001)(86362001)(26005)(54906003)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RENQNzAzY2ZlQ3FwcU42cExzR3V2dzdQUjVMRjlsbTlYQjhSUFBmcDVLd1JW?=
 =?utf-8?B?QzcrRGY3eHRhM25xUjgxUkV2RXpQVGpVZis1bnZsR2hNVFVvM2RJWEdpNzNV?=
 =?utf-8?B?Lzl4NngvaXZWR0QzZjlnb0VvOGNTS0lrck9seG1BV1BWOXkwNUJvSXVvSUtS?=
 =?utf-8?B?VjcrcCtMeitvN3JnRURmU3ZtVkU2K2NhN1dyVTRjZlNYMXBGcXBuUVhVY0Zl?=
 =?utf-8?B?RzlWdkdqcnk5QmJGOGFDTFRQa1RDSUtlWFBqclBnUitmdkpBLzdxTWRmblFS?=
 =?utf-8?B?TGdFckxubm1qbjFZSTJ4MUNnREFxNDJ5c005MloxRU44RTNBQXJQU0ZTWlRS?=
 =?utf-8?B?RVhWbFJBYlV6T0JZellyZ3FhWFlrcXBITFd4Z1pJNEw4MmdWT0xkenBwejA5?=
 =?utf-8?B?ZWJaams2U2I2TVNOcGg0TFdUaHNZTGphQlhvWk9RMk45eVRXZDU4ZDdFazNr?=
 =?utf-8?B?L1RoYUR4elNJUGtLclJjLytNODR0dUtuVWx5ZzF5QUhzdlpsQlplK1BIdmwz?=
 =?utf-8?B?U21ydVI5NkE5L3lyVExTeHd1MUdleUxYUTRxbXVaOEZpOVhLcnZHRlc5Wmx6?=
 =?utf-8?B?TmVJSk9RT2IyS0FlUGprUUIreGx3TmJuai8xQTBYL1MvcXpXazFSVnAwZDI1?=
 =?utf-8?B?Q1M3TGN5cDN4Y2RBY3IvKzZOWDM2Y1J4cWhPOHh5dDgvaHA4b0dlcXZjTG5Y?=
 =?utf-8?B?MTFvZE81dnNqVUJ4Nk1kT2ZqdnFMSjdUTWhsLzNaWVNac3JRWldPMGl2dUFG?=
 =?utf-8?B?akxZYTNEQVJhZFVvTnZoaExwdGdnbTI3dnFmVGZCRys3QzVsUWlCN05LQlUv?=
 =?utf-8?B?VTNkWmJjbmhnZVBUSmhBQmtTWWJMclUxMTRmelBVRDNHUjVtZGVJaHZmNW5R?=
 =?utf-8?B?K0kzWmsydEE3SE11ekw5SW5yQUwvd2VUbERFaFlUNk0xNVJaVG1zWURscFJS?=
 =?utf-8?B?TDc2dlpEdkxSV1R3TldKZzVURXl2RDk1Y3I1SUVaRGkrL2JkU2kyZU0yUU1k?=
 =?utf-8?B?TkNyWXN4QmxVK0gyYWcxbDdoQ1RmYUNiNHIvUy80eUcwUlBJTlgrUk9hME5x?=
 =?utf-8?B?M0IxNWdTa0xjR29xdklBNzNiSHNiSWpSbk5kMjgvdzQreUZuMFY3TWhvcDho?=
 =?utf-8?B?cTlzMlZENlhVbS9vNkZrTVB0YmxOVUMybXF5SXJ6UU1zTTJIQXZORVhZT3FT?=
 =?utf-8?B?NVhZbHhYeksxMDdYWlY4TWVFRktycHNYRkVDNHBqTFovVzdhSnRLWE1RWEVQ?=
 =?utf-8?B?OXQ0K1V6VmZOMzl4VlVNWkJoVUdrYTQyQTlaUUt3WERwWExEdExMY1NjWmlq?=
 =?utf-8?B?cEltelQ3TlZBQVF1bDlKQ2w4V1BRSEFiRTFySGVreTNBL3Rhek1Zb01xa0Uy?=
 =?utf-8?B?QWhpVW1Oa2RQUFJ0Y1pHWGYxMDVldmhBa2pmaVRVZThQSjllNitJNlZzbWR6?=
 =?utf-8?B?WnJiWG44ZzJKWUJEYmtVWklTVHNsaVBBRnhOMmtpc2k5WjJXVnN4Z0lSclph?=
 =?utf-8?B?U08rK1hyVlpvTnpOYUtIcUxUeWM4SVozYWN6eElzSW9GSDR2VWNwUG1yZ0Zv?=
 =?utf-8?B?TFZlUndVRTFYWUVSRFRGcWtqdEpVRnpCQzZHQmhGdkFMNUlRRFVDMjl0cFdT?=
 =?utf-8?B?b0tieFNnL3VmaFZuUXF3dEcwcHgzTXA3U3k5enNnWDVFU2c2aWRZbzBVMWNJ?=
 =?utf-8?B?b2ErMlA5WEl4cXQ4Z1kvTHlOOTJ4RHIzSmduUUVNSnNSV2hVR2JWUWZhSVlN?=
 =?utf-8?Q?wgKP+I6kwakSUlpdtHOFLCattNr2Oco502YPvyU?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25dcba26-f649-428d-0b76-08d95dcf0db9
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 20:23:32.1262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AksGuPL1n9JUZoKRgjvL9MrAR2VDUGEVdDUXfHz7JkkS+G7joSepNRFlahuOT1zV0SdPYelvTT9pdSRnmg7wVPv5vDVqwPeZ7wH/JjOq1Hs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB5489
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10074 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108120132
X-Proofpoint-GUID: itarf4YV2cm3Or6BVqk-_ptLKOQXjn9J
X-Proofpoint-ORIG-GUID: itarf4YV2cm3Or6BVqk-_ptLKOQXjn9J


On 8/12/21 9:09 AM, Maximilian Heyne wrote:
> There is a TOCTOU issue in set_evtchn_to_irq. Rows in the evtchn_to_irq
> mapping are lazily allocated in this function. The check whether the row
> is already present and the row initialization is not synchronized. Two
> threads can at the same time allocate a new row for evtchn_to_irq and
> add the irq mapping to the their newly allocated row. One thread will
> overwrite what the other has set for evtchn_to_irq[row] and therefore
> the irq mapping is lost. This will trigger a BUG_ON later in
> bind_evtchn_to_cpu:
>
>   INFO: pci 0000:1a:15.4: [1d0f:8061] type 00 class 0x010802
>   INFO: nvme 0000:1a:12.1: enabling device (0000 -> 0002)
>   INFO: nvme nvme77: 1/0/0 default/read/poll queues
>   CRIT: kernel BUG at drivers/xen/events/events_base.c:427!
>   WARN: invalid opcode: 0000 [#1] SMP NOPTI
>   WARN: Workqueue: nvme-reset-wq nvme_reset_work [nvme]
>   WARN: RIP: e030:bind_evtchn_to_cpu+0xc2/0xd0
>   WARN: Call Trace:
>   WARN:  set_affinity_irq+0x121/0x150
>   WARN:  irq_do_set_affinity+0x37/0xe0
>   WARN:  irq_setup_affinity+0xf6/0x170
>   WARN:  irq_startup+0x64/0xe0
>   WARN:  __setup_irq+0x69e/0x740
>   WARN:  ? request_threaded_irq+0xad/0x160
>   WARN:  request_threaded_irq+0xf5/0x160
>   WARN:  ? nvme_timeout+0x2f0/0x2f0 [nvme]
>   WARN:  pci_request_irq+0xa9/0xf0
>   WARN:  ? pci_alloc_irq_vectors_affinity+0xbb/0x130
>   WARN:  queue_request_irq+0x4c/0x70 [nvme]
>   WARN:  nvme_reset_work+0x82d/0x1550 [nvme]
>   WARN:  ? check_preempt_wakeup+0x14f/0x230
>   WARN:  ? check_preempt_curr+0x29/0x80
>   WARN:  ? nvme_irq_check+0x30/0x30 [nvme]
>   WARN:  process_one_work+0x18e/0x3c0
>   WARN:  worker_thread+0x30/0x3a0
>   WARN:  ? process_one_work+0x3c0/0x3c0
>   WARN:  kthread+0x113/0x130
>   WARN:  ? kthread_park+0x90/0x90
>   WARN:  ret_from_fork+0x3a/0x50
>
> This patch sets evtchn_to_irq rows via a cmpxchg operation so that they
> will be set only once. The row is now cleared before writing it to
> evtchn_to_irq in order to not create a race once the row is visible for
> other threads.
>
> While at it, do not require the page to be zeroed, because it will be
> overwritten with -1's in clear_evtchn_to_irq_row anyway.
>
> Signed-off-by: Maximilian Heyne <mheyne@amazon.de>
> Fixes: d0b075ffeede ("xen/events: Refactor evtchn_to_irq array to be dynamically allocated")


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>



