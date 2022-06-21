Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D035533FE
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 15:51:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353252.580171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3eGr-0001j4-Jb; Tue, 21 Jun 2022 13:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353252.580171; Tue, 21 Jun 2022 13:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3eGr-0001ga-EQ; Tue, 21 Jun 2022 13:50:21 +0000
Received: by outflank-mailman (input) for mailman id 353252;
 Tue, 21 Jun 2022 13:50:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AKif=W4=citrix.com=prvs=1644f076b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o3eGq-0001gU-1w
 for xen-devel@lists.xenproject.org; Tue, 21 Jun 2022 13:50:20 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 154598ab-f169-11ec-b725-ed86ccbb4733;
 Tue, 21 Jun 2022 15:50:18 +0200 (CEST)
Received: from mail-mw2nam04lp2169.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jun 2022 09:49:01 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN8PR03MB5010.namprd03.prod.outlook.com (2603:10b6:408:7b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Tue, 21 Jun
 2022 13:49:00 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 13:49:00 +0000
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
X-Inumbo-ID: 154598ab-f169-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655819418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GFS12QkIJF/ybwLpytD+HinIGnAEhWw9CJ4dOuhPUe4=;
  b=IB/DizMy+CgoVGZjr/ybh44TmpXn3OLUZe0aycch4qOuZ+iYy+8aR4wQ
   1IQqYeEBHs/cJSl6P5tQrTDHP6mu1ot9G5KUNTA+9VpIkN5ldjQ8q+veP
   c/ydjfim6C0lIQdFy2EgZ19MMahMiKJfM/0rQbfE6kP/4KHGBig55vp7s
   I=;
X-IronPort-RemoteIP: 104.47.73.169
X-IronPort-MID: 73414808
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+7E0jK60jS649RaR4+guWQxRtFPGchMFZxGqfqrLsTDasY5as4F+v
 jAZCDqGPa6Iamf3L993PYvnoBsHupfWm9RhSVNoris9Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw03qPp8Zj2tQy2YbjWlvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSuEQ14J47CvN4GQjB0Iy9dHZR40rrYdC3XXcy7lyUqclPK6tA2UAQTAtdd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfqRo4YGjV/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2ID9AvJ9fJni4TV5BchjpnqYPPQRs2petxuo3acp
 GD35musV3n2M/Tak1Jp6EmEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24ma1XNdaK
 lAI9zA1hbg/8lSxSdvwVAH+p2SL1iPwQPJVGuw+rQSSkKzd5l7FAnBeF2AQLts7qMUxWDomk
 EeTmM/kDiBut7vTTm+B8rCTrnW5Pi19wXI+WBLohDAtu7HLyLzfRDqWHr6PzIbdYgXJJAzN
IronPort-HdrOrdr: A9a23:l/ee2aq06D8UKokWAreNhPkaV5vLL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmLX5XI3SOjUO3VHFEGgM1+vfKlHbak7DH41mpN
 1dmspFebrN5DFB5K6VgTVQe+xQu+Vvm5rY4ds2oU0dLz2DPMpbnn9E40ugYzlLbTgDIaB8OI
 uX58JBqTblUXMLbv6jDn1Ae+TYvdXEmL/vfBZDXnccmX+zpALtzIS/PwmT3x8YXT8K6bA+8V
 Ldmwi8wqm4qfm0xjLVymeWxZVLn9nKzMdFGaW3+78oAwSprjztSJVqWrWEsjxwiOaz6GwymN
 2JmBskN9Qb0QKjQkiF5T/WnyXw2jcn7HHvjXWCh2H4nMD/TDUmT+JcmINwaHLimgAdleA59J
 gO83OStpJRAx+Ftj/6/cL0WxZjkVfxiWY+kNQUk2dUXeIlGfRsRLQkjQ9o+ao7bW3HANhNKp
 ghMCic3ocfTbqiVQGVgoE1q+bcH0jaHX+9Mzg/U4KuonhrdUtCvjclLfwk7wo9Ha0GOuZ5Ds
 T/Q9ZVfeJ1P7orhZwUPpZ+feKHTkrwfDnrDEW+ZXzaKYBvAQO9l3ew2sR92N2X
X-IronPort-AV: E=Sophos;i="5.92,209,1650945600"; 
   d="scan'208";a="73414808"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L26lYX/cMNDUQmGoeytqsMbARfbknPpRo77fUO/itIU5IlBR3OPnwX4mNmcp/ayqhBhyCaNtu/M4hxMQHueLcQMDS7cshaEXxOuxDOOtXq9quzEfSaUmTrPpIQMqybXRvYUSWnOWwmSTKIrkeXKpLRNhZd5nZ5fhqXRGfwLZ2wVn9pak5RZagOEEXtzRWYmM9JjwDNhWpx+aiVX/yRKBW94UtRU+zZBeksJ7a3kLvfvCU9Or3Nclogkepcu6WbqriTnK+aCmMu2cKCPnbbcO22eYAss120HJqtk6Jh1EIpakB114sVlw6WWmI+o3RvyrCk+wW6l88EYHeGOfUdtuDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/AEZc2H3B3nF/EYTAit+FUlWI2YucMNbLE1IYNCTNo=;
 b=Tsyx4uWWUBxS0zzPifgdpJeQM5L5TY1enjGuBe31lC40Yms38mlZEB3CLD5+V5ZOtYa9sNm67gvS1/rAJYsnNAdb0IFeofFrn5gXvHhE/1P1afjMThLizbcmXCnzJQNXeFYA3SWCADDbuqToogeNLK494FT/55AmxgkrIyC/zLMrVnmGUttI6+2YxGOOjcaKLi63Zh9m/BoIS+L54U6hO43VuWoCElfEgPi0n5ARySTj0wQImPom+FhGOXtVnN3V3viQK9Hayymj1V8I0UOsscIjXPOZflpuCWuVB5FM79AKFqR++mtxhuBg0we6l1oXca/I4bkrbeb1QlDyCvkv+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/AEZc2H3B3nF/EYTAit+FUlWI2YucMNbLE1IYNCTNo=;
 b=i34xSYxAjE7hV0sAsOjEH2ns2rJUGEsCWWydcNEnobNi4dGnFcFS/cnCp4Tci4jMLXL6Fc+N0XSmVx9lIig4U6+UBJgkWLuK+twDR24wPknx7cFMzV/IeDPi1OSMxMoaqdGb25zZugW1DYC+I80zHNsh861OvBpEe7eP/oNagt4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 21 Jun 2022 15:48:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: committers@xenproject.org
Subject: disabling mercurial repositories
Message-ID: <YrHMSJg6Rx9ULvr6@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-ClientProxiedBy: LO4P123CA0349.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49230560-6d8d-43f6-0908-08da538ccb8e
X-MS-TrafficTypeDiagnostic: BN8PR03MB5010:EE_
X-Microsoft-Antispam-PRVS:
	<BN8PR03MB5010BBEA0E5888FA4D997D9B8FB39@BN8PR03MB5010.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tp1myDqj3gIPV4BJ59J/ulYSZab/ZYvnDaedbo2sXSnTDaA4/7tghh3mO+yyTHv3zn0nrU1rzBJwHx/FGrbo5ewt6f4q3kWveqLBD/GmoGIwJ3KuhEdBQQEdflrrc1H6l2uVvThRrFQGoQPp4zBdbee41IQ0VUpS5w7Xo9/VHQfcdmnmT8gja9a8K68zuWxzpPVBj5zU6ugyMYpFq0OrZ1ECydrPSnVi3wf42fGY7E1q2oD/hCrvNty3sXyx5KJ5yd3Tzp1NTivjz6zxgK+ws6A1leqSJiht8Ja8LriZAtUa2uzZZ20cnTV/zIW8Lw89KFGcKO6QFEOnTqzJimWO8ZLxCxCC/TjFGyl8HqQeRJpsZz0kPris2xYMkvtty5Sf6WSO7kgh4bzvShYAMSdQsAH+VAw99rTbLqz3UJeG3F39iH38W6q0DgNv39v9cfy6eqZ64hl8oQL5k+yK9Bha+n2GwAavvxQ5bjOoDd4Gs85WvA1KWGfW+2cu5VAAvUcPWkI7nDb0LnrQmL0aW5a1ENcnw9OySUpO1RhWExwlAVDKeQPn8rtZusn4mgXv8XXq3/yofW21Qndco8F50q2ntpmxsx0e3zvKRRclBBY33krCfqOtLrpiLK2Bvlbh5vTjZ5EvNVT26YVhIggCF+rqXm/Ax9qVa1GQztSV+H+TzOWFEGlQoxUYEW5jZgn2I2pyaFu3qf8HepgVcLOiC3BDJA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(83380400001)(6666004)(3480700007)(186003)(82960400001)(33716001)(38100700002)(6506007)(66476007)(478600001)(6512007)(9686003)(26005)(6916009)(6486002)(316002)(2906002)(4744005)(66946007)(41300700001)(8936002)(7116003)(5660300002)(4326008)(66556008)(8676002)(85182001)(86362001)(133083001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TE1rVXRleDI2bXJrMmpQSnhEcThEN0E1eTRXTUdqK05nTWlxMGxVd0FrY1JS?=
 =?utf-8?B?OGY3K0ltMDdzaU9LVWpLR29Lc3c4ZzFQWDhzZmZWZ1JNbjNwZXk0VHZXZkh2?=
 =?utf-8?B?MjE4UkgvWHFQRksrNDZyRFNnSlpYU3BSS1RFd0dKZ3F5bkVNdHpXN2RHd1dh?=
 =?utf-8?B?YnlvTXU1NHhxNEYvVGhkNjhSb3lYOVhROEZYWnlWTHNIdkR6UTBFeE9SeXYz?=
 =?utf-8?B?TjNVT3lDUGE1SkNzaFlEbUFzMVlxMVdNOHJYL29INlAwTlRHalRKd1A5NHFI?=
 =?utf-8?B?ODREVnZaS1dmMk1YcHdqNkZ1aERkNGc1V0IrQ1N2VlQ5Z0NYdHJpV2JkekxJ?=
 =?utf-8?B?MWwwU3ZkTklJeFdYUDRNVmIxSjdsT20xWlFNUndIL2V3UzJkM2EyQ2lvcFJ6?=
 =?utf-8?B?c3ZQK1Rjd1FDdWRVQlFQTzJEaEtVTFRnQmJhdWd0K2RLdjFVdzl5b3VwSjAr?=
 =?utf-8?B?Z1FPYjltMFNPNW1OWEVZZmRsbmc3ai9FK1BOWG5yY3FRbklncHZ6SDI1MkhM?=
 =?utf-8?B?M3BqUU9xcUw4WTR3NmkxbUNIb2tEdDR6cUw1cHlwZjhCVTBtcE5rUlJ1WkVa?=
 =?utf-8?B?Q0tGeEJWcklSamc1WEhjY3pYbzdCd2pQeDY3clU1ZFA4MldTQ3Z4elVYWFlj?=
 =?utf-8?B?RzZLTFJYUWltRGkxZ0M1WGl2T0lVSFFNU1FnZFpTbHRoNWNKOGhEcHIxWHVn?=
 =?utf-8?B?djkrM3E0Zjc2UlloZTFhN21WR1k2K01qRWpMbmVFNVBHSENGbTZSVGZwakRs?=
 =?utf-8?B?K1l5SmhhMHpUaER0Ty9vaVJXR0N1anU5Z3ZsdHI5L3J0WENEdkdxRFY2VjZq?=
 =?utf-8?B?ak9qL1pzUU9xR3dJN1gzNEdNZUF2NVpUclBBYndMWmlNWkZRWEc4bmczdjVC?=
 =?utf-8?B?NTVJczZxY0o3eUhhUzJLQTVhYndUY3JVbm53ZnphaVI5Z2NISW9WVC82NTJo?=
 =?utf-8?B?U3ZNaTQwZWx2aU8wclpMQnNFa3hiMWEzS3JNRXlNU0szM2N1NFgzUUc3azJv?=
 =?utf-8?B?dE1YQzFzQ0NHSWhlbjZ4TFFKTTRRVjdDNlRkZ1VEcnd0NUJFTlRMVE4ySjh3?=
 =?utf-8?B?UGpad2JXZ2JWVWwrbzMzQmZiRjdrWU1QZmJ1dVFqRSs5aEd6UWlCZE1zZUow?=
 =?utf-8?B?c2VKcDVMYVJyZEJvK2hOdGZCTXduK3I1RTk5NmlVQytqSmxYSWhwVFRiUXV6?=
 =?utf-8?B?a1lzM2pGaW15RUdQRFY0YldXSWZBTElmeE9WeGxMQTgwREpYOVkxQkVmbzZk?=
 =?utf-8?B?Q1krWmc0dndNK0xpRXRydUhsaHEvNmtWMUp5RTN5WDBsZGltNkkvSU82emxP?=
 =?utf-8?B?MkI2cm9scWJVQmFITE1lMXF3ckpyb0czckNPYVNtQmRFa2NobzRJeC9vTkZM?=
 =?utf-8?B?OHlabHUyNHBmK1pmQ1pscUhHTFVEcWdya1gvYWJmMk1FUy9TQmJMMmptQ0R6?=
 =?utf-8?B?Y1RoVE1DMHdGVjN4TksybFVrTS9rc0IzYzcrMUdhK2wzMkhHUnd5RmZEMEo0?=
 =?utf-8?B?bWNIc0xEQ2tLcDZva2JYNThyTVpJYjlnMTk5YjlsTXJ0RTJnQWVpYWhGTEpo?=
 =?utf-8?B?bENUZlZWK2hYTjR5T1MwdU0yNkxHbmdiaUpncFhjSlV4Wk50YnNoYlp3WkVa?=
 =?utf-8?B?OUZHR0Voa2xsS2xNbERWMGtYTGRkV1oyRWdZMEhmZlI5RExsT3kyd2hYSlNL?=
 =?utf-8?B?YjBxUTkySTNkL3ZZSTdUbTM3KzRxSXpjcFN2NGo0UmdwS0JHN3ZaTkltemlx?=
 =?utf-8?B?WmtnY3o4dEdRUW1rSkw0ZG1EaG9LbWFUUHJLazg3b2dPSGRPWnlNa2M3dWc2?=
 =?utf-8?B?dmRvM083bkVHVlhRSzJyL3FSTm04UGRjNnBpZUVDOVE2RDhkSE1xNXpjNkV6?=
 =?utf-8?B?UnJaeTZVZ3N2dGVNVXNJc2x3WXBTMGZpRUduN2xwTjAzTXFxSTNwNytuY0RJ?=
 =?utf-8?B?WVNMczUvamFSNTA0OGdHYnFjZWdINFhmUXFkTjBOTjAwdFdWbmlFbVBvTFd0?=
 =?utf-8?B?L05VTERkSUd3UmhETk9zQ2w3VWkybHpORWpGYzlEbkduajhHOUtSamtIVHIw?=
 =?utf-8?B?TnMydm1tdmczM2QydTR1M3Z5a3lJcDAwRGQ0R3ZBYUJUUUpmTHA0cjRxK0Zz?=
 =?utf-8?B?N09HZW9lM204UTBqOEVETTBIbG82aHdYSDJoU2ZuMGVGQjdwVjJSRkRLeG9X?=
 =?utf-8?B?TnZYS3F6MktxZ2g0UnZ2VXhRNVBVS2FKdUlTM3ZVRVdhMjVSL3M1MTVGQkRL?=
 =?utf-8?B?SjRIUHlUTkdPaWlIcjdOSXk5MUx4NmhIMDBDS09WNXZORVJpeGl5Z1QrY3F0?=
 =?utf-8?B?Vk1JYnk3ckprK3FFdDJwQTFwTDh5dVlEUlRXb3UzNU5aODN2NEJtOWdXNVov?=
 =?utf-8?Q?YEAkoopYBHjMLts8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49230560-6d8d-43f6-0908-08da538ccb8e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 13:49:00.3206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +t6C/50OXv2xwyHy7gjwmdUnhW9waC1YYjqTdwD4NYRR38XoZSzLHP7r0CI3I09KBwCn/maIGBnEu4AwJ0akkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5010

Hello,

Last week we had a bit of an emergency when a web crawler started
indexing all our mercurial repositories on xenbits, as caused the load
on xenbits to go beyond what it can handle.

As a temporary solution we decided to remove access to mercurial
repositories, but the contents there are AFAIK only for historical
repositories, so we might consider completely removing access to
mercurial repositories.  This would however require migrating any
repository we care about to git.

I would like an opinion from committers as well as the broad community
whether shutting down mercurial repositories and migrating whatever we
care about is appropriate.  Otherwise we will need to implement some
throttling to mercurial accesses in order to avoid overloading
xenbits.

Thanks, Roger.

