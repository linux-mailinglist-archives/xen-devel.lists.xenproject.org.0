Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D73322EED
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 17:40:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88961.167375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEajX-0001nm-GP; Tue, 23 Feb 2021 16:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88961.167375; Tue, 23 Feb 2021 16:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEajX-0001nL-DF; Tue, 23 Feb 2021 16:40:23 +0000
Received: by outflank-mailman (input) for mailman id 88961;
 Tue, 23 Feb 2021 16:40:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUnP=HZ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lEajW-0001mi-En
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 16:40:22 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 318447d9-dfcd-43f6-a6db-dff6599f3f2c;
 Tue, 23 Feb 2021 16:40:18 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11NGSebe161267;
 Tue, 23 Feb 2021 16:40:14 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 36vr622cgh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Feb 2021 16:40:14 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11NGUa3l070492;
 Tue, 23 Feb 2021 16:40:14 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by aserp3020.oracle.com with ESMTP id 36ucaykyrw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Feb 2021 16:40:13 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BYAPR10MB3654.namprd10.prod.outlook.com (2603:10b6:a03:123::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Tue, 23 Feb
 2021 16:40:12 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3868.031; Tue, 23 Feb 2021
 16:40:12 +0000
Received: from [10.74.102.180] (138.3.200.52) by
 SA9PR10CA0019.namprd10.prod.outlook.com (2603:10b6:806:a7::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Tue, 23 Feb 2021 16:40:10 +0000
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
X-Inumbo-ID: 318447d9-dfcd-43f6-a6db-dff6599f3f2c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=qsgfKHA7SbpMIqs/sjy9zD05l1oV79scyX26D+kZzhM=;
 b=ceIxA7rB5NwfhGsmtQAVUxN/BKHcERHZZDcRsqhzGTw1lI3SboFIiESSyxAPw1ve61wc
 Nvx0lgaXhN9B0VSByIaX9cgevwSYP6cYxGvZvYDzyFA8YM2qk37+NzkvfjfFUuEoin/y
 ZWYoDpOKpMSE+RvTkaBCL16Myltujz2aDZb+rJg8KfqdVJ6pk86aO19y3qMLDTuQkI9I
 hUsi5rCiFwRORMHj/+T1EkN6qm7LIbo9/E3mR10r78t66u9aFIAVGoROjOeeuag0/566
 MSE0YOnSdliZ/hBPD8w9CjSlr2ESTeDf2e7QtNbxFbixOu0ITQqsnGoTNY7thCre9m5B PA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n81Hz2ILaO21q6k9MQ65Zy047Vg8h7d1gaQ6XNZ1D/EUuaFA+79A6UpLKZJVdn0XzEdtv7jwXEVxY4X7y+HREA53rYEIfLLlji+hl5CPqog/+5hufyaxsU47NYGL3ocgSB+EVxw0kG9v5177pPk0MYpSxO6/Zzo/ZJDcpm0BGr7Tb8xscKrpSMOCFbXhpz5Fsu8BeyHhRvRB17YRA960LfG5o59ZCzwUYU27tQxRF5D9gTaXfxXtlatKnsLFbpr3cxQaEKcMYbQoBq7ic3utsRBL2USnL7g85E2Y0d/ZjZKez1hmts3M7Op/hj2r7+5+ftUZecwyPqrIrVdAXjaCpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsgfKHA7SbpMIqs/sjy9zD05l1oV79scyX26D+kZzhM=;
 b=AVpVKa78secgxHASsQbqTGcCbG0P+WleUY1a2TL0FsWHn1yiQp7I4i+B+Nt5mE1eNPmoVLzY56gsBC7JkNPu87FB3+GcvsIPmg0zfZhCq7ILqi0bGXSFf551CfLMJ/wuWpe8WZpBDRm1oFDrbRL0PEyYMwXSBUbZ67X8HYVBGvYHsPXlGBagDgMgRK8SngT9B0KwN7uDIImR0SIQVukGMl6Hgnxogp43hI9EfbA1y2sFco3dz0wVP/xyhF9oa9m0w/JL0TAMXNK8WM34eRhN/Yi2Fijvg0IIY3dpYBvmrwXFW4E905SWrRvRUojBkBEbY2+MwtXlGQ34YHlYfkcvfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsgfKHA7SbpMIqs/sjy9zD05l1oV79scyX26D+kZzhM=;
 b=UE5qIeHIPYNrRLBWEOFuVzHnD0pfhxuKmWSKQcZkB6OTS8VZYtHbAZCGGke/WcIJOYOD5UFRyns9HVHVMcuoBMXK47guLkW6JDRyHbmCHaZRwQ9ZYKBS4uJJocDzCGyqYE5L9G50cGHSAohzBIVvN8TfHVJU4aqf3UwX/W0JWYc=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH v2 2/4] x86: Introduce MSR_UNHANDLED
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com,
        xen-devel@lists.xenproject.org, iwj@xenproject.org, wl@xen.org,
        anthony.perard@citrix.com, jun.nakajima@intel.com,
        kevin.tian@intel.com
References: <YC5GrgqwsR/eBwpy@Air-de-Roger>
 <4e585daa-f255-fbff-d1cf-38ef49f146f5@oracle.com>
 <YDOQvU1h8zpOv5PH@Air-de-Roger>
 <ce2ef7a3-0583-ffff-182a-0ab078f45b82@oracle.com>
 <307a4765-1c54-63fd-b3fb-ecb47ba3dbca@suse.com>
 <YDTMIW5vBe0IncVR@Air-de-Roger>
 <2744f277-06fb-e49f-2023-0ec6175259dd@suse.com>
 <YDTyScmud26aiaMi@Air-de-Roger>
 <172dfcab-9366-47f0-9c56-2202a8b7a7db@suse.com>
 <3ae19e76-2543-28f4-9c7f-697ccf9ed202@oracle.com>
 <YDUpF8gf6fbm4ouQ@Air-de-Roger>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <a49b03dd-19c5-5df1-81a0-0d8d9e84156b@oracle.com>
Date: Tue, 23 Feb 2021 11:40:07 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
In-Reply-To: <YDUpF8gf6fbm4ouQ@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [138.3.200.52]
X-ClientProxiedBy: SA9PR10CA0019.namprd10.prod.outlook.com
 (2603:10b6:806:a7::24) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27aec047-c484-41a5-d1c8-08d8d819b082
X-MS-TrafficTypeDiagnostic: BYAPR10MB3654:
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB36549BCAB2F2A9BDA2A505388A809@BYAPR10MB3654.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gdhW4HHhCijPfdoau5vt7O0XYlUfdz9C3fInGkmb0iFx7SGa+GnbPIwnaGB280i0PzMdP8k5+BI4+Sh+n+SVyWaUMUBoqOVp7rdLnhR/v5MmMrwUv1A0gUoxrhCsbmxrQ15/T7/So1MzorcDNFnNNe0aUChjzUxolIEtCKAkOwIOMnfoMec8CqOVfVLfoVLhxLiOjfnye4lld95KJ4dbepcn5IK//DZnu+rAYfx4quTIsWnK7A3ngzirCTCfY7/53m8wqVmrDrX6Og7jpidzTyRwNsGpug9Nkrs7QYurLlltrvrLdPXnaWyJVIDJxCXK4LWO7PGhof47ZZ02MOdHAgcaJBNLvH0PRuV2KKrxUdK2rfatUV2v7InDYP/dTKPsewH+NE/VMXUz+DtkOSXRhNeE/lJwJaX0ZX4STXyjUatZxhRg87McO91+0t8iXlVbbbLqSf99RrxCbjIbfj9rb047zjHvBpyD/owofu0mbLkQ2Gvppl2mr1zOfAsYNr8t0A2nahSjBz/l6aGoTg66udGq0yOuOmrmYNxU6G2JcZzJao/b+ABhnibmfComgW0cCMesLfsDWhq3qNxDpZrqfqQAzNYpqYa+8qwHh6UGfjU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(396003)(136003)(376002)(346002)(2616005)(83380400001)(6666004)(6486002)(8676002)(53546011)(26005)(4326008)(8936002)(31696002)(16526019)(66556008)(186003)(16576012)(31686004)(5660300002)(6916009)(66946007)(86362001)(316002)(478600001)(36756003)(2906002)(66476007)(44832011)(956004)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Q045dlh2bSttRzVxT0p4alhhUklJRlJROGxZMEQ3ZS9BSEdHNnM3M3U0RFUz?=
 =?utf-8?B?M1lmekw4SXd5NEp6YlRPQU9Gb0NVMFVBZms0eTVaWjBnQUZGcVlNdEErZ0cr?=
 =?utf-8?B?dlNQWTFSbVVsdE5hUUttNUt5Qm1ZY0pWazB5UVNtbUpGbXVQSmM2Um1NTW5Q?=
 =?utf-8?B?aDFMeGVhcEFFdmhveUc2NW0wQzhIMGV4ZXovUHh0ZWdqSXBpU2dWZ1RkeXdu?=
 =?utf-8?B?OGcxNnltZUhzbWV5aXUvOHlvVWJpNVN1N0REYm9QMHFneGh6Y0dtNmJYMkdB?=
 =?utf-8?B?RWZKazYvenY1aElUSEZHTS9TTjQyWlorK293V0tvSjNUMjRldWFBSDJ0Vmow?=
 =?utf-8?B?eWRTckhoQ1VzcFFxUktkT1RtaEJFQkRJclREMitDRUtHcGR1cUJUZFBCUFkz?=
 =?utf-8?B?RnhNY1BjeW9LOTlMazJzYkhKWUpnb29uU1hrSXVubG10RCtIN2ZSSXRrZm9W?=
 =?utf-8?B?UlhyTjB6Q2FVUTBucUpXU2hjaStNNE5MQlpOZHFGTnhHTSt1NjBIVDh1WjF0?=
 =?utf-8?B?NFpXUUg5NHByK0pDVTFSOEsxOHliK1BSdWlRZGFad3hVbTRjVkdVOWVIL0ZV?=
 =?utf-8?B?emJiWmxjOHNjUnFaR1NhUWNWeVNpUndqcEp3QlN2TGJWTU1rdGdPWTZmVndr?=
 =?utf-8?B?S1J2QUtiTmJoRVhrbUhnZ0ZpOUlYK2VSdDdxTFZ0OHlZZkJaeW5HMWMvV2hm?=
 =?utf-8?B?Y1FIbVpMdlBubDIyTjU0TjlhcEtYWkdTOURtUy92d0FaOGpTQ0h5aDZRanU3?=
 =?utf-8?B?UUJXQTlNeEptUXJmeTJZcGRmMUxTSGFQamNPZHN3b29yTTJRQjZKUU9XY3lT?=
 =?utf-8?B?WjZGaU9Fd0lIVjkzNmVvM2V6dk00Y3JKc25LeHhIUXNKbE5SMWp0c0g2aEh5?=
 =?utf-8?B?UEMvSG4vZE9UdTJJUlNTdnNwQmhGOEludVNoL2s4Y3YxYUpXK090UjkvMlFD?=
 =?utf-8?B?ZWxkQS9ScFh0Q2YvSUJUNWZZNVpUL1ZHay9GQkRoSXhTTmNuUnhYamxBeDla?=
 =?utf-8?B?UWpZMjlsS21UZDhZWXk1RVRiZE1hZjQxSnlTWEpNN2gxckNRQXpUYzNodGVP?=
 =?utf-8?B?dEJvZjdlZVlLN3pnRmNic3F6RTdwTEZMcE1mNGkzYlo1YVJQb0cvU2FXcU5u?=
 =?utf-8?B?TDNTMy9yY0VHRHhDUFkrYXhIa0tyZjE2VEpsczhFUlE5d25vbGFnVDF3aGJw?=
 =?utf-8?B?ZmRpNzl6OWYrUmhFaU5HbGZwZDdSNi9RK2pVdXEveWNLcEl1cEQ1TXAzUEhv?=
 =?utf-8?B?a3NCcWlZdDhyQTdoYTNVcEJ5RjM4b3c0ZHcwRllvb1dNa0p1YUl3WmYyY3BS?=
 =?utf-8?B?ZmNoT3ROSktHOTdSNnQ5UHhwOWtOcjF6YlNWR0NzMXlrNFBsOTNWYjh0dGVa?=
 =?utf-8?B?MTNYZzRLNkF2V0xpQTdUSGNMdlIzbWIyY0xoYkdUbHE1K05KdFJNckpBazJF?=
 =?utf-8?B?QkdoM0pmQkQ5Kzl6TmpnRTVRclFpdEVLVG5paDdJOUdvMUUvb1lGYklDN1Vu?=
 =?utf-8?B?ZUJFZkN1b0E4QWUra3BLVjhUaE5Jd2ljeXZQdWdkYXUyd3gvNjM2VndOOFZY?=
 =?utf-8?B?TmlONFRwalBkMlNUOGo5bC9CY2o5UE94WXN5cVpGRGFoRUNEWHh2N2M5SW9Q?=
 =?utf-8?B?Z2phU1QwdVlWOFJEVWM0Q2JGbzM4ajdkYjVOdXRRZWRQVzJCM3VHYXg5UVE3?=
 =?utf-8?B?WHJNWkxHR0hOOWFVb0EzOHgzMkt0dTIvcjJrVXBuTnEyVlFhc3MrMHd6N2k1?=
 =?utf-8?Q?16abPgHitArTyY3EmZqaXNXYmWFX90yR6QJf9bH?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27aec047-c484-41a5-d1c8-08d8d819b082
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 16:40:12.1419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rw7iSirlfsgoOnRPzVpPH8NMmCgNScGSFGuSQP8kHNCCe2TdIOpzcsuY72a4QZz0HmIhsEVAEzqcrVhYZt0QehPJJgA+Xu5utd0CPjQAlXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3654
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9904 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102230138
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9903 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102230138


On 2/23/21 11:11 AM, Roger Pau Monné wrote:
> On Tue, Feb 23, 2021 at 10:39:48AM -0500, Boris Ostrovsky wrote:
>
>> Before I do that though --- what was the conclusion on verbosity control?
> Ideally I would like to find a way to have a more generic interface to
> change verbosity level on a per-guest basis, but I haven't looked at
> all about how to do that, neither I think it would be acceptable to
> put that burden on you.
>
> Maybe we could introduce another flag to set whether ignored MSRs
> should be logged, as that would be easier to implement?


Probably.


    msr_ignore=["verbose=<bool>", "<range>", "range>", ...]


-boris


>
> I think in that case we could enforce that either all ranges have the
> flag set or not, in order to prevent ending up tracking two different
> ranges of ignored MSRs, one that triggers a message and another one
> that doesn't.
>
> Thanks, Roger.

