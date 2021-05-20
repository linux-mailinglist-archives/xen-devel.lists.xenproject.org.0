Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 366DB38B204
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 16:40:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131003.245076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljjpH-0006Gi-Qt; Thu, 20 May 2021 14:39:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131003.245076; Thu, 20 May 2021 14:39:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljjpH-0006EG-NT; Thu, 20 May 2021 14:39:03 +0000
Received: by outflank-mailman (input) for mailman id 131003;
 Thu, 20 May 2021 14:39:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vYVO=KP=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1ljjpG-0006EA-Np
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 14:39:02 +0000
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e733652-0f14-499a-8d14-80a977f850e3;
 Thu, 20 May 2021 14:39:01 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14KEFCCf187254;
 Thu, 20 May 2021 14:39:01 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 38j6xnmvvp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 14:39:00 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14KEG5FD041644;
 Thu, 20 May 2021 14:38:59 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by aserp3020.oracle.com with ESMTP id 38nrxyvrk4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 14:38:59 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BL0PR10MB2867.namprd10.prod.outlook.com (2603:10b6:208:77::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Thu, 20 May
 2021 14:38:57 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::78a3:67d:a8ca:93cf]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::78a3:67d:a8ca:93cf%7]) with mapi id 15.20.4150.023; Thu, 20 May 2021
 14:38:57 +0000
Received: from [10.74.103.151] (160.34.89.151) by
 BYAPR01CA0055.prod.exchangelabs.com (2603:10b6:a03:94::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:38:55 +0000
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
X-Inumbo-ID: 9e733652-0f14-499a-8d14-80a977f850e3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=6zaSteqAwXZQKFyG6eNHEu8n1t0gNu+xC2iOMIy3VC0=;
 b=Iae5XO5sUzk7ub50UjHe+gJzsALoqv4dqmFFjTeaglikfOOWOvp8EIt7N172R97TqkMR
 Es3kbKkIFRnpE990yW7wcRDq44vbONfdRcYTV0YTyRJBIVlFXkWprIbSuwDLJCZ8t1rw
 5wYNHHm4af4NFhhZWwMTiWyTDVy1nhyXKi8qfk7aMXX/jlpB3MwDG6BywhGkHqWGLucC
 +KUUmXrhC0+xS4DGg/7DzNeEU3RGRZPLpljpL9PLPBTp7THxTnLLwQ5yNTdr3XRp2kFW
 Eme5I6iKZzSYTMvSVcvfHMcHnMqxZhwfuYW8L45hOV6kcJaXay3b+Dl2DWahvhLoNb0+ jg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iw1Ghjld+bPSbqAotvfcpK44Dy5K3h6Q3sv/ehYce66T0w3qFZ1pQdCv1zHsaDyPgQpZwlD/5l0iu9RwuSpK5eT+c/t/YpmAqjvmnqxaHLUlKy3Tn2gWavMbdDBsgk7eRClfuY2oGvbTSeSQek+jnZP7uc1T/wjarW8PTACofKl4YF3FfXC8BLmRndFg/a2z4Rx0aCzZAKYIZkXJ6bmJKV2lNMTDaM9b3YhQEp3yNNmqcD1cyqwhfMPdEL1XjdcxWIcxMK7V/omiwuYW65LvFi5odHGNMwZrkzuL3BiPcYf06UaMwrdgX3lUXv+C+WmLPiAu6SdEehExQpNQpfQngg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zaSteqAwXZQKFyG6eNHEu8n1t0gNu+xC2iOMIy3VC0=;
 b=lB1z3SLmQQIQ19C/kdwM+ePZnjFI76C58e+F22Qs97ukkO+wbPHO6Xh19FBABVclnTWYyeXT7Vxt55HXwmgaaDuIMIn9wfEaRylD6p1MIzQecCEjppOcjN48cTYghem+53QqJS8HA6gM8NDLDXrgYsDe8719+w/G0gN/uJ8okaaIEDVCDDeMay5Bh3t0VeOTcv7/2oyyI4OkMSQI24gxINbPYXpOMO2qRUzzzBSXXuhb4ADH/+byLhtmf913Y3MkL+5P4Sj6HUe+HCbDtPX39/QcA2OxNZQxfqunXkadtXCfPjfivH24o41MRCnTfMYSSVhcutB5RlEP9FhYweEJUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zaSteqAwXZQKFyG6eNHEu8n1t0gNu+xC2iOMIy3VC0=;
 b=XtMzjF3zQGHYzpilCs+/xoVaT0EFPpTgC9FLXgXXZDyzBlnqD7lR02Kf+e5rUqdPiHOnX0/W2RP7TcsTwDvTY6Vor9Za2Gyp3xhN0lLuQvhgpODZXbjecxTSoPjtbJdLW4vX58NqoMr0aXSxZV0iOWHTuuGHSSKPVDVC9Sj5Dcs=
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
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <75bfa4bd-cb4b-fb56-1600-6aebda4cf4cb@oracle.com>
Date: Thu, 20 May 2021 10:38:52 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
In-Reply-To: <214a6c61-5f6a-d841-312a-be2abb95f77a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [160.34.89.151]
X-ClientProxiedBy: BYAPR01CA0055.prod.exchangelabs.com (2603:10b6:a03:94::32)
 To BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fcce813-bbf6-481f-b310-08d91b9cffc3
X-MS-TrafficTypeDiagnostic: BL0PR10MB2867:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BL0PR10MB286746A66465D9210A5E23C28A2A9@BL0PR10MB2867.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L8JmZ7CrOyaEWNMHI5PjW64PPDKfro8X5NN+wP7EvFmVlmDtqkYERIguJ+BHPQKUcrnkDf0GOnUva9sBydqQVmo5YOcRK6W+8LnuuStUQBFhgIMogeT6pcMrTnJQKSZtSFb2BKNg6X52RxvMZc0Q3xQNiJMAmbFUcAG1auT7DvcsU5sb/oACi4DvreJXj2IXNkkosUvzZZUfI5wtiSGUD5w+4mMf2P6Mjl0dyyrN+ycNfY/FH+IpVL7zIcK40ljoatTib95wMTiOdKFiQ1fT8smUXkufA3YEzZjnAa6Ij52JJhMYlvpEYsMfahOBIU2UAHDpquoBKdrYyvIOghmx9ucqe0hrVz/prVeBwIqipmY0TsiZnn8qhQLarrTAebzs9OFnftkviOlh24RpN91OJOXT0dlwdmPKtwqx4kK2Ihl7IpczxIjHTCIecdK6OdF8hRHYiQho7XIq4w393w4dGIxBqtpHD6Wu6/11WCHx9D871Y/GhScH/+cLKCP/EjsVV2Kg1jx1jbKomruk90NPn6norvLZGmmlJnHbmVZmCGWMuzHtT7WLUz9bzDbmKgO+UweycB+ef8L4vfq/btP2Nvw0s1+kn4BuzCDlMCVWuezdc8+6CGqTRK9s+NUFu7lXtngBAmTesjmiGg3NUlKezAnxMrfIPilt8kn/YNPooAQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(136003)(366004)(346002)(376002)(53546011)(38100700002)(31686004)(26005)(54906003)(316002)(16576012)(66476007)(66556008)(66946007)(8676002)(6486002)(16526019)(6916009)(5660300002)(86362001)(956004)(44832011)(31696002)(186003)(2616005)(8936002)(4326008)(36756003)(2906002)(478600001)(6666004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?cThpSDE0RzQxTVRIZHZFUXRlWmVLeW1IMElQbFlMTEZmeG5TQU5rSjFuZUhv?=
 =?utf-8?B?Y3VzbUtmRVZyQTJ3SDdPVlErb3JrdEJIRG43Y2NVKzE2M3NVUWExaExMUGVD?=
 =?utf-8?B?SHlQbHBQa09DYW1oS2pTMmtpcFJzSExWRExrQ2pBZTNkV0tlOGF3TmNOVlBE?=
 =?utf-8?B?S295OFU0ZFlJZ1ZFVnNjN29wajNtUkduaGcrLzM4RFpyNGxDT2ZXejYxMkZr?=
 =?utf-8?B?TEFIRzNjOHpJTHJxbGJybkMzV0szdHlpL2MyQTU1K2o4WU9yMys3blhOWS8r?=
 =?utf-8?B?cmNyYVRGOUVNbjBYMWFTcFZwRWJmaTJvbExmWXJlWGRtRzhNdytHT1lmMnpx?=
 =?utf-8?B?bEdrVEpXVGFXZlI4ZUZpa3JZNHdPd3Q5SWtzaGhxMzNwVlBzNzlPc0VnYlRo?=
 =?utf-8?B?WUM2eU5YMzZ3amNQV09nN3B6WXkxMzlpa0p6Y3ptZGp6NERlank1NHRKVUpU?=
 =?utf-8?B?RnRPaXpRWkpYcXk4bVR3WWF6dFAxUitTSWNSSWNzaFhmK1Z6a2t2TUQ2VW1L?=
 =?utf-8?B?T2VYaU1hRGxSNSttY244Zy9JeWdsL1ZIdkQyQUZEc0JaT0IyQXZiMlBWdC9p?=
 =?utf-8?B?b203eU5VbmUrZTB6SmFWa0JNY09zcWJPMndRZmV4MFZrUStaK2tYQ3MrRlZI?=
 =?utf-8?B?ZEhIemViNkhtVGVtVkxWTnJlZGcrYWYxQXJKbkx2M0ZTbkROOEdjTG1XNDVS?=
 =?utf-8?B?bndmS1NPWDEyS1NsbXlyMXBXSHVaL21pNHN5V29idDU4UnVpUFNrQlFQOHhW?=
 =?utf-8?B?UDFnNHMzRU43aDVWSHdjZnZxaUxZSnoyZGx6MWJOOUxZbXRZU0FGRlAxSE5w?=
 =?utf-8?B?UnhWbU0zdkdzS2RWaWl5QUoyU2dMUklld2lqRlc1b3REUXo3d2l1MDFwTmRt?=
 =?utf-8?B?OERyZ3FCQjRWTTQyeit0bUNaenJvUDduc1JmTm0wZmd2WTkwRlBFVHhadEFO?=
 =?utf-8?B?T3c3aU1qaG9mRm5ZVEFxNUNkaHYrWTRMY1BoRm1oQWRZZVU3aURQa0FlNG1p?=
 =?utf-8?B?NzFnU2t2MWJhN3pHUTVZdXFQY3UxNmd2cEp4Z0FzbGhobWNOYzlmT1lUakpR?=
 =?utf-8?B?MkdML3ZvaWJ6OEdqb0NEaUtBYzJranFLSGp0cDFQSUxaR3V1RDc1WUVvQ0s4?=
 =?utf-8?B?MWVwOXo4M0U2bWRobDdrbk1UV2lLYlFkS0xiZ2t5NkNvbWl1UUswQXFhaTVB?=
 =?utf-8?B?UGdTd3hlVy9wSm14cEEyczhudXhtamxQR3RvZU5NUFBxRVhSRGN5Zndnd2hF?=
 =?utf-8?B?bjVIYTBEVlNpeFdlWXp3NmNpTnhEZnlCbzZseWFvUjNsMmlJdEM2UXNjRFB3?=
 =?utf-8?B?U21qeU5XZE12dkMwSlBJVWRTUWNJOGlhcnpsY0JYQlh2azlNVHdHeHhqdVFS?=
 =?utf-8?B?K21sRXVSUGRBekdDZ0w5dXRpQS8zakpSUDF1dDcvSFA4OUtiUXYyelJib1NO?=
 =?utf-8?B?SlBlVXVQNmZMTkxjeG1wQ2IrMjFnT3NYT0U0Q2p5ZTNmQ29STXRJc0s4NFB0?=
 =?utf-8?B?c1pYMjVsNDB5Mm1HZjQ3U1Z0TGprY2YzKzhVUkxLUEVRdmpEWkduU0pzNnNF?=
 =?utf-8?B?RnBha1ZiU1FyZkE1emVscEdQaTJMeXgvVjBNUXEybnVFVUwzc3o4NEovOUpr?=
 =?utf-8?B?SkZzNDl6YnBjMHY4cXMrRWpObFdjZkI3a1VXNXVXQ25JYW1rNnJjUC8vTGgv?=
 =?utf-8?B?eWxOSFd4TzEzNHluNGlHVHBNRXBTZ3pJcWdMLzZ1aUI3ZUt2aE03RnNEcnpY?=
 =?utf-8?Q?MebBIonUtdh1rzGSqzHOTYlfJy7VuJfgeaQxaq+?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fcce813-bbf6-481f-b310-08d91b9cffc3
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:38:57.0903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uk9qg2Wfsvp2SwQZR/02avMsZougb1iMxm/Fy3yio24Vse7bg6xFrWVvZrIZROqjSZcb+Fvo1EX5Q+lG9SHx2lEVeQ2LQ6PmTNMmSzDewB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB2867
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9989 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105200101
X-Proofpoint-GUID: -ozUc_rhKmj9xWaFE67AZWUoGeyqsrA4
X-Proofpoint-ORIG-GUID: -ozUc_rhKmj9xWaFE67AZWUoGeyqsrA4
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9989 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105200101


On 5/20/21 3:43 AM, Jan Beulich wrote:
> On 20.05.2021 02:36, Boris Ostrovsky wrote:
>> On 5/18/21 12:13 PM, Jan Beulich wrote:
>>>  
>>> @@ -95,22 +95,25 @@ static int __xen_pcibk_add_pci_dev(struc
>>>  
>>>  	/*
>>>  	 * Keep multi-function devices together on the virtual PCI bus, except
>>> -	 * virtual functions.
>>> +	 * that we want to keep virtual functions at func 0 on their own. They
>>> +	 * aren't multi-function devices and hence their presence at func 0
>>> +	 * may cause guests to not scan the other functions.
>>
>> So your reading of the original commit is that whatever the issue it was, only function zero was causing the problem? In other words, you are not concerned that pci_scan_slot() may now look at function 1 and skip all higher-numbered function (assuming the problem is still there)?
> I'm not sure I understand the question: Whether to look at higher numbered
> slots is a function of slot 0's multi-function bit alone, aiui. IOW if
> slot 1 is being looked at in the first place, slots 2-7 should also be
> looked at.


Wasn't the original patch describing a problem strictly as one for single-function devices, so the multi-function bit is not set? I.e. if all VFs (which are single-function devices) are placed in the same slot then pci_scan_slot() would only look at function 0 and ignore anything higher-numbered.


My question is whether it would "only look at function 0 and ignore anything higher-numbered" or "only look at the lowest-numbered function and ignore anything higher-numbered".


-boris


