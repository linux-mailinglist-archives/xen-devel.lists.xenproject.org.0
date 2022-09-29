Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F8C5EF4C0
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 13:52:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413698.657513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ods5a-0004GS-8y; Thu, 29 Sep 2022 11:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413698.657513; Thu, 29 Sep 2022 11:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ods5a-0004EC-67; Thu, 29 Sep 2022 11:52:26 +0000
Received: by outflank-mailman (input) for mailman id 413698;
 Thu, 29 Sep 2022 11:52:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KRGE=2A=citrix.com=prvs=264d7c073=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ods5Y-0004Ay-FD
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 11:52:24 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28fc0660-3fed-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 13:52:16 +0200 (CEST)
Received: from mail-dm6nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Sep 2022 07:52:20 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MN2PR03MB5069.namprd03.prod.outlook.com (2603:10b6:208:1a2::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 11:52:18 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 11:52:18 +0000
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
X-Inumbo-ID: 28fc0660-3fed-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664452343;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=kuje+827cbvf8jP7uZ8RWEcrgtFakvL3/F53IBDuhs4=;
  b=h5gLr+vHTrWEUxEZm6pVcau4WNPIP0g2YoH9lpzByQVscp31BZ/mmzym
   fkf4o7EPzMpVom4geBJNP2RnQ7tNZJx7z7/IteDdop+H+y0s+LJlX2rJN
   OOsByrx5lOZZ4ATn7FxASywK6hJSqjzuHAeSqt0RK6lOBsTr7NoTSuZVY
   U=;
X-IronPort-RemoteIP: 104.47.59.172
X-IronPort-MID: 81599636
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6FXwXalSHVxFcZhIaMtlkOvo5gy3J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWW2nQP/2JazGked8nYdux9BkOu5/XydA1TFNp+SE8RCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6UqicUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS83uDgNyo4GlC5g1kNKgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfWUREy
 tY9CDQxbEq+27Kkh+OXU/VFmZF2RCXrFNt3VnBI6xj8VKxjbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsi6Kk1YZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r837KezH2gBur+EpXmp9tOqnmhgVcXBV4Ge2ewiL6WkgmXDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8U/4RuIw7DZ4C6YAHYFVT9LbNE6tM4wSicu3
 1XPlNTsbRR/vbvQRX+D+7O8qTKpJTNTPWIEfTUDTwYO/5/kuo5bs/7UZtNqEarwgtirHzj1m
 mqOtHJn2O9VitMX3aKm+1yBmyirupXCUg8y4EPQQ36h6QR6IoWiYuRE9GTm0BqJF67BJnHpg
 ZTOs5H2ADwmZX1VqBGwfQ==
IronPort-HdrOrdr: A9a23:R9SGrqhlOU8nMgGD6iSJFRn0xXBQX0F13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7EZnichILIFvAa0WKG+VHd8kLFltK1uZ
 0QEJSWTeeAd2SS7vyKnzVQcexQp+VvmZrA7Ym+854ud3ANV0gJ1XYENu/xKDwTeOApP+taKH
 LKjfA32gZINE5nGPiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SuV
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfoWoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A7eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6Nq+TgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQf003MwmP29yUkqp/1WGmLeXLzQO91a9MwI/U/WuondrdCsT9Tpa+CQd9k1whq7VBaM0pd
 gsCZ4Y5I2mfvVmE56VO91xMPdfKla9NS4kY1jiVmjPJeUgB0/njaLRzfEc2NyKEaZ4v6fa3q
 6xG29liQ==
X-IronPort-AV: E=Sophos;i="5.93,355,1654574400"; 
   d="scan'208";a="81599636"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=duLq3JHCUo1EKJjhhuEhA+eZ2kOfVVkV5BbIhQj6zPdoJBXLrWT5YclXbBQKcZGmaJCkJr+s7jQokr6fZPcW2bA5gTBs5yIFEUf2MN1chAQP6V39u/3KtuukMx7j0/q7AT+wCeenpUCHkCXyntUUeK6HtE4Ka8EneIPOunaZ2ZrT1IXzqTRiOG+XZbeJyHULdOSLZQp1W1XPywMWKltpUbtr9G2LPoQDwho1+LFVRZYYA4+/AZS2CJ2b+IzwEcZLEUhNeSSBSC0cTX2jGbEBgAVt7wTPNc/H2t/xaIyLQvBN6gS7XXGoKqjD5TY5FkR2lZbGGXSlPO1URUjjEDZHRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgHz8MTh19YK53dT4jZv66nPGZ4MpH2L//3viF4uduw=;
 b=NLrvIqOm172/6eSRHi4m7dUSSio13yVwOZ4OxsvkB6eaKWFOqxN/1sRX4j/xFezHf0CBBLRHtCWQhpee+jzZXQIDEHqqXEjfzNi5plBLxp2gZ6PbDEV9Jgh8zF2fyH6PZhUKc4MQnAjPC3CQbw8x6n8w12Dj3c0AP5MWpVa2LfIFprmLWLtYCV9l729naP/ycBz/HdlVGMXwW7wPEUyKiY0IXExRQGUflQkCNMYOWM58meckBio3qv+MVo+/OIMn57EqGrzmraBfQfkgILGrNpQVd8RIELCpcz4qCyvaECTJc7KELpIhJez1f53W88ZnR5b2UO6rtuevBAKGX6JWAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgHz8MTh19YK53dT4jZv66nPGZ4MpH2L//3viF4uduw=;
 b=WPe+6TbtADNhNm52et42UXWKf2orZ+OtHFZlRP+9Xm4QYU8SRmpZSNif5FmpZGo4+ApjuD0DTdXBomaVGqFrrlcOVVyVKonIyFYIs3zryLuMQDERZPSvROHcBwd4I1+bgn+IdBEsMZlRbsHfoWsCEYwR+tpudVGElUOsqgWWtpc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 29 Sep 2022 13:52:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org,
	George Dunlap <george.dunlap@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: Design session "MSI-X support with Linux stubdomain" notes
Message-ID: <YzWG7pfXOt5O6AJS@MacBook-Air-de-Roger.local>
References: <YyyHvp34Wg1kSqFu@perard.uk.xensource.com>
 <f24b9e06-f9ed-aa0f-0d69-abb8f0d7560f@suse.com>
 <YzGeY8L6Op7n8pip@mail-itl>
 <ca19380a-6ccd-453d-4693-ea666152f45f@suse.com>
 <YzV5/0SYbJVQ91YV@mail-itl>
 <e329a56e-0a54-dffa-8e55-0cdf030dbce5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e329a56e-0a54-dffa-8e55-0cdf030dbce5@suse.com>
X-ClientProxiedBy: BN9PR03CA0968.namprd03.prod.outlook.com
 (2603:10b6:408:109::13) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MN2PR03MB5069:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b76d9e7-7511-46e4-9d8e-08daa2110f38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o1HSQ4HXVgujQCjayVOQjyUi5KWPBe0KSNcYKKZRBaJbMC4aGftD0Z3K6QgFKr1Fw3bwdl5hqluXQE8UtRVTPvw++CH6NEpixJ4cw2/T18dfMZ9lReu04rsgVC3vmONTtlZrGj6F8sFoIh20/7yXv41OzksWIfLq8e9o6+NlTUjGDhcWsec9c09jX/TQRrz9bEcW1YxAeJTUnAPhhNd//ZReB/SvJVetrNnj949e3PefN0+o9o9K1Nl44AIoZkSQkithY1cDTPAxNXqOrtCrfPdnHBUDXDt8TVkMNISDJVMvAJ27jwy6x7XYglnkTb/8sfCML/d3TKzvP5+SFlBN66JE4pqmg16WGfle6KytP7LBUPll181ybeHGffg2ldBNPCZvpOsOSiHmm79oyaSiZsNXv1ut0dJkuldlagKefIgUY9vJ3pCBbX3cxGiUuc5w7FX/FnS9AjPQJ7XBkLa0asUlvPwOmHQzws2ZlHarsKXkYlNgVNlaxxZwA2vdfFx19JyUF4cfpqBkqK7JIIWBXE/6Kj0IxxnSJQigTGLKCjYyis7LtuwT/1nXxYhl6N3GY+RY2JJsfQFXBJjD+dh9Z6bxH01XuCHevn2Fom+a9Id2O3TTJlUHztG3GZBVapZmdv9AK1rans/Ptjx4aaetPpEepBe26vVJKEx5P9HYdUN32ZfX3Kx+nW4bFO7zDUaaee/9tVsv8wiSLmmVyusFCYV3I0cMqrUcUus9ugTJENo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(366004)(39860400002)(451199015)(66574015)(66899015)(85182001)(26005)(5660300002)(66556008)(66476007)(6506007)(6666004)(107886003)(41300700001)(8676002)(4326008)(82960400001)(86362001)(38100700002)(83380400001)(2906002)(186003)(478600001)(966005)(6916009)(6512007)(54906003)(9686003)(8936002)(53546011)(316002)(6486002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWpGRFE0eGdPOW1vYVM5UmdySnE4emVuTGVFR0ZDcHBCemlQeUhBNnBVMVB1?=
 =?utf-8?B?UktJaWV5MXU0VzJnN2dPRWFmaXdYblo0Y3lFVTVERnY1cnpYVlpENVRJcDR3?=
 =?utf-8?B?YXhKNEo2RmQ0RExuWHBwQ0hKcGtXcUNOM1BxeEd6RGdVQzhzZkRzVEsrU1k4?=
 =?utf-8?B?bVBuZE91VTl4S3RFOUFHbEtMTVUvbFRFMDh4N0IzKzNTY05wRy9vV3lwSG9i?=
 =?utf-8?B?UGp0RDY1aDZvaVpMSmJITHRXZTRiUlp0c1d5VVVvN2tOQ1F2VnJVQWwzVW1y?=
 =?utf-8?B?amlIWHpkdVZkMGdwMUgrclpQUDZrQml2anRVa0ZsZVRTUTZ0S2lRNU4wQjJj?=
 =?utf-8?B?S2hpQ0pVdE5KaEt1QldscDQzT05CbHY1N0pOMWs0d0QwV0JHU1dKUHlvdERm?=
 =?utf-8?B?bU43NU1sVkl3NmNxVWJNZEZPQUVSVzJGd2doZy9nMnh5NU1RaTJnMm5tQUJw?=
 =?utf-8?B?MWVDd1ZsZW5VUndUTHRJR3RqM1lHSk1yd1Ivbi9RaHFNS2xJQmR1V2o4UE1D?=
 =?utf-8?B?VVR1Y24rOXhWZW9UVkJxNytZak9QekY3dWR0QzhZTEpGZng3SmNBaG9qSkZi?=
 =?utf-8?B?T2pQNEkyWXo2U1ZkUGJINGVoQjh3c1J3UjgrT21Ybm9ra2ZhbUlQcDFrbml1?=
 =?utf-8?B?cDhTdFlZQmFXenRxbHpMNWRkRUtWN1JJd0x5QWdoc1I2bWZ6WnM2Vmk0bkRR?=
 =?utf-8?B?eHdCVUJmRVdLZVNyenpKeHJFbDdqN3dQdGJMU1JQTW1OdHlGb3d4Qmh0Uk5D?=
 =?utf-8?B?RjlCVTJWS3lxamdFbUMzVUdsbDJpb0g3RC8zelJzZ2RZeGo5K2o0dHhqNFh0?=
 =?utf-8?B?S2Z2ZXNSTEgvNktIRFBpWU0veFdkRFNMWVEzWVRBZmMrWU1IZzMrdjZ4Y0Nj?=
 =?utf-8?B?MXV3MG1NNDRkNklCUWtzT2lscmlZbk51QVh5YkU5dW1VRCtSU3crQVJlSnMy?=
 =?utf-8?B?S1FobHlhSjdFejh5UDlCdWxyZ0g0bTRnOSt0U0VsdU1TamNyOGducHYxWnNq?=
 =?utf-8?B?YWc2M1QvcmpFQyt2d0RmSlpsTkdTZXNzWityYmRzcHdXYXN4N21MN1VRQnlz?=
 =?utf-8?B?L3VJbnc5WlBlN0h0RFpUZjdFb1hTS2l2QWh6VkloWDNEOTRYZ1IzNkNwMmNR?=
 =?utf-8?B?VnVnRzlTUmVEVlVmTXNBakJkc0c2NjY1QjY3elEwbkNXOEJJYVpyc0hWaGxX?=
 =?utf-8?B?aGdNaTFlRjF3M0Z6NFNFcE1HQVJiOFVBLzJkdjVhOHgxSXlSbjRhSElEQ3lq?=
 =?utf-8?B?SWN0ZHl1dzdiOTJnOVgyK1h1L2dhT0gvTHYrNzJmbEJUajYvNkpkbzJwMEJ2?=
 =?utf-8?B?cWxKZzlOdWl5eUt5aDgzWGsxR0ZYWGZ1OGZtOVFxRW91UG80Q2lqc1cwYUh2?=
 =?utf-8?B?Mmd3cEtFS0x5dDNnQWlJaTFqNC9DL21odzFKS2tVNm5LZmZDbjJYU2FZb3RO?=
 =?utf-8?B?RktnVVJpRHo1aHlCdWdrcEVQdlh3eGkwUUFjMko2MDF3dmlXYlU2ZUdrQ3hp?=
 =?utf-8?B?R0F1UzUzVndsd25FT1o4cHcyNFpXaExlT1BGTXJtelZHWDlCZXpBTnduaDFa?=
 =?utf-8?B?S0NrQjFYWC9HTjFzKy9KUXVPeXd0RmxHWGpuc2hIWFlLaWxXYjFTNmFsUVBS?=
 =?utf-8?B?RUZDUk5MdC9sMW9tQzFvZ3RwemdYQ205cWNsOW55WW1vVXpNc0krSW9jckNC?=
 =?utf-8?B?ODJZNW15L2tBYzZoeDg5RnZqdVFLSjgvN2swdHJtak53WjFDYkVYSGh3V0p1?=
 =?utf-8?B?a0ViWWdGeURFR1hYc08ralFMU2NBYllZamYrdFphNDdKWStZS3puSVAzc3FK?=
 =?utf-8?B?cjkzc2FhMUVDUXI0LzB5bThTemFySlFlSWtaM2ZNZ1l5dlZOK1ZTUVJXZGJV?=
 =?utf-8?B?YjdUd0oraXA5OGN1NU0xUm83VzRrYis0QmZkeEZhUnlRMklnMXArTk94TCtS?=
 =?utf-8?B?TTlQQ1pvZjU5T1pzTytmcEdaOUZhaUxNN3BCYldrL3Y4REtYaVpnWHl3RFdG?=
 =?utf-8?B?MzhLRTM1WXp1U2RtcTRNNEdwZklIWEtPOUh3OFFLamFTMVppSk9GN3FibVYw?=
 =?utf-8?B?VUFnMVpmcS9UMk11QUN2bGprS2JCSU53amlSOHhlNkxuQlFzYUdwNFM5THls?=
 =?utf-8?B?aldtbUtCaVZtMFNxRFo5QzBEVmE4ckh4YTJ5SnF0YWJ6RXJCbW80QWhhZmRZ?=
 =?utf-8?B?c1E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b76d9e7-7511-46e4-9d8e-08daa2110f38
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 11:52:18.2827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XP6UAkkkwjTBc0KSfH9FtSIicir8N/879D8gG+25q1qUdSipE9Zl7KFB3nfm0zxeNqpnZ7/edoRLSIOU0vXOpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5069

On Thu, Sep 29, 2022 at 01:44:28PM +0200, Jan Beulich wrote:
> On 29.09.2022 12:57, Marek Marczykowski-Górecki wrote:
> > On Mon, Sep 26, 2022 at 02:47:55PM +0200, Jan Beulich wrote:
> >> On 26.09.2022 14:43, Marek Marczykowski-Górecki wrote:
> >>> On Thu, Sep 22, 2022 at 08:00:00PM +0200, Jan Beulich wrote:
> >>>> On 22.09.2022 18:05, Anthony PERARD wrote:
> >>>>> WARNING: Notes missing at the beginning of the meeting.
> >>>>>
> >>>>> session description:
> >>>>>> Currently a HVM with PCI passthrough and Qemu Linux stubdomain doesn’t
> >>>>>> support MSI-X. For the device to (partially) work, Qemu needs a patch masking
> >>>>>> MSI-X from the PCI config space. Some drivers are not happy about that, which
> >>>>>> is understandable (device natively supports MSI-X, so fallback path are
> >>>>>> rarely tested).
> >>>>>>
> >>>>>> This is mostly (?) about qemu accessing /dev/mem directly (here:
> >>>>>> https://github.com/qemu/qemu/blob/master/hw/xen/xen_pt_msi.c#L579) - lets
> >>>>>> discuss alternative interface that stubdomain could use.
> >>>>>
> >>>>>
> >>>>>
> >>>>> when qemu forward interrupt,
> >>>>>     for correct mask bit, it read physical mask bit.
> >>>>>     an hypercall would make sense.
> >>>>>     -> benefit, mask bit in hardware will be what hypervisor desire, and device model desire.
> >>>>>     from guest point of view, interrupt should be unmask.
> >>>>>
> >>>>> interrupt request are first forwarded to qemu, so xen have to do some post processing once request comes back from qemu.
> >>>>>     it's weird..
> >>>>>
> >>>>> someone should have a look, and rationalize this weird path.
> >>>>>
> >>>>> Xen tries to not forward everything to qemu.
> >>>>>
> >>>>> why don't we do that in xen.
> >>>>>     there's already code in xen for that.
> >>>>
> >>>> So what I didn't pay enough attention to when talking was that the
> >>>> completion logic in Xen is for writes only. Maybe something similar
> >>>> can be had for reads as well, but that's to be checked ...
> >>>
> >>> I spent some time trying to follow that part of qemu, and I think it
> >>> reads vector control only on the write path, to keep some bits
> >>> unchanged, and also detect whether Xen masked it behind qemu's back.
> >>> My understanding is, since 484d7c852e "x86/MSI-X: track host and guest
> >>> mask-all requests separately" it is unnecessary, because Xen will
> >>> remember guest's intention, so qemu can simply use its own internal
> >>> state and act on that (guest writes will go through qemu, so it should
> >>> have up to date view from guest's point of view).
> >>>
> >>> As for PBA access, it is read by qemu only to pass it to the guest. I'm
> >>> not sure whether qemu should use hypercall to retrieve it, or maybe
> >>> Xen should fixup value itself on the read path.
> >>
> >> Forwarding the access to qemu just for qemu to use a hypercall to obtain
> >> the value needed seems backwards to me. If we need new code in Xen, we
> >> can as well handle the read directly I think, without involving qemu.
> > 
> > I'm not sure if I fully follow what qemu does here, but I think the
> > reason for such handling is that PBA can (and often do) live on the same
> > page as the actual MSI-X table. I'm trying to adjust qemu to not
> > intercept this read, but at this point I'm not yet sure of that's even
> > possible on sub-page granularity.
> > 
> > But, to go forward with PoC/debugging, I hardwired PBA read to
> > 0xFFFFFFFF, and it seems it doesn't work. My observation is that the
> > handler in the Linux driver isn't called. There are several moving
> > part (it could very well be bug in the driver, or some other part in the
> > VM). Is there some place in Xen I can see if an interrupt gets delivered
> > to the guest (some function I can add debug print to), or is it
> > delivered directly to the guest?
> 
> I guess "iommu=no-intpost" would suppress "direct" delivery (if hardware
> is capable of that in the first place). And wait - this option actually
> default to off.
> 
> As to software delivery - I guess you would want to start from
> do_IRQ_guest() and then see where things get lost. (Adding logging to
> such a path of course has a fair risk of ending up overly chatty.)

Having dealt with interrupt issues before, try to limit logging to the
IRQ you are interested on only - using xentrace might be a better
option depending on what you need to debug, albeit it's kind of a pain
to add new trace points as you also need to modify xenalyze to print
them.

Roger.

