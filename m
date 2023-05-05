Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFB76F82E7
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 14:26:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530315.825855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puuVn-0007XS-Mc; Fri, 05 May 2023 12:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530315.825855; Fri, 05 May 2023 12:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puuVn-0007UR-J9; Fri, 05 May 2023 12:26:11 +0000
Received: by outflank-mailman (input) for mailman id 530315;
 Fri, 05 May 2023 12:26:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NH7J=A2=citrix.com=prvs=48283d55d=jennifer.herbert@srs-se1.protection.inumbo.net>)
 id 1puuVl-0007UL-Dm
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 12:26:09 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id feaf0790-eb3f-11ed-b226-6b7b168915f2;
 Fri, 05 May 2023 14:26:02 +0200 (CEST)
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 May 2023 08:25:52 -0400
Received: from DS7PR03MB5414.namprd03.prod.outlook.com (2603:10b6:5:2c2::6) by
 SN7PR03MB7183.namprd03.prod.outlook.com (2603:10b6:806:2e5::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.26; Fri, 5 May 2023 12:25:50 +0000
Received: from DS7PR03MB5414.namprd03.prod.outlook.com
 ([fe80::fdfd:97e5:7c55:82d]) by DS7PR03MB5414.namprd03.prod.outlook.com
 ([fe80::fdfd:97e5:7c55:82d%7]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 12:25:50 +0000
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
X-Inumbo-ID: feaf0790-eb3f-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683289562;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CwCMoJsQ3XBHdfK27O+QOGL4OPl7EWw9dH3TIohe9kI=;
  b=RL1JbXLOZugSTa6NohvzFI1Dd1MWx+cb8TeGXtc1sDpN6aoUu+FZOV97
   yVpS8c0d8WwWRwmW8hh7xiOyITHNaRgotb+yewo5TZVOVGE+Byzzin7hK
   3oDnYPZsRMI6zkb8DAldBTIjLrX6cOQa8grtBJB01OmOHXZ7z0Or2JcEC
   k=;
X-IronPort-RemoteIP: 104.47.66.43
X-IronPort-MID: 107321463
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:XdW1ZqPd7AaeBUXvrR2RlsFynXyQoLVcMsEvi/4bfWQNrUor3mEDm
 GIeDGuDPqnYNGugKNAiOd/gpEoOsMPdy9E3Sgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvPrRC9H5qyo42tF5gFmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0u9FPDgQ/
 uw4FG82Yg6jq7yw3ZG6Z+Y506zPLOGzVG8ekldJ6GiDSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+/RxvzO7IA9ZidABNPLXd9qMRMtYhACYq
 3jM8n7lKhobKMae2XyO9XfEaurnxHukA9hLSOPjnhJsqEaclnBKFC9NaUe6mN67qWP5ect8N
 lNBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4qjd5QqDF3UHZjFEYd0i8sQxQFQCx
 lKP2t/kGzFrmLmUUm6GsKeZqyuoPioYJnNEYjULJTbp+PHmqYA3yxfQFNBqFffvisWvQW2rh
 TeXsCI5mrMfy9YR0Lm29kzGhDTqoYXVSgky5UPcWWfNAh5FWbNJrreAsTDzhcus5q7AJrVdl
 BDoQ/Sj0d0=
IronPort-HdrOrdr: A9a23:M3qxiKqMx5vAsCtg4qLc2M0aV5rbeYIsimQD101hICG9Evb0qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2Ki7GC/9SJIUbDH4VmpM
 VdmsZFaOEYdmIK6voT4GODYqodKNvsytHWuQ8JpU0dMz2DaMtbnnZE4h7wKDwReOHfb6BJbq
 Z14KB81kOdUEVSVOuXLF8fUdPOotXa/aiWHCLvV3YcmXGzZSrD0s+ALySl
X-Talos-CUID: 9a23:2hlDD2MVRw10d+5DURtarRAfCuAZLUbR0lf8fUmlKmdER+jA
X-Talos-MUID: 9a23:J5/JIAYY4OwHxuBTrDC8mGh+BpxU/6WXL0IuvNIkouqZKnkl
X-IronPort-AV: E=Sophos;i="5.99,251,1677560400"; 
   d="scan'208";a="107321463"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndFfZerHGfQZonnG8svWg05xeygl7bpXUNx09q8tBMbbpJOmH5kDSyBDzj5PnP9tcDSEdkDVY+uQIrLnly8Ix/vlVoFgmmhmDkSUDF7vXtBz6p1KyYm2ls8HpMk5gzwLggfL8M2ZAj0v0/wqRuTs/5RrmAYInMTTlv1CeA5PCzG3P87/MtNciA07wxywqXCqa6fWK4OBdZrwEz2+jjRBfWM6w071v30kbfjQvbQbs+9WG4wkOueMnxFMrNq0Cwd+6EVveSfyzZWbUZtP04d5FGtsAZPunvXCmLJpYrzI1cyG9MAgNWuX6LNjdnMwE6VZRtAsYIJy9JO479QSfU7MBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwCMoJsQ3XBHdfK27O+QOGL4OPl7EWw9dH3TIohe9kI=;
 b=WF1FrbqEZTA+JZu0SMPtipyKqTP6nqJVN0VkIKOWtSdSjA1Rp2t22Klwba4NWIXzBn+5N+99PBgdHVFElqmxGsWvxnJfH0bHyRDOWIqXOLUGyYAD9XpSWqqFlEQfNiLEptp9K6Ktmml8xoqmXjXYkqvVqq5VNhtJD/AuWhSJiiSaSGHkChfrERiGDZSRfvbf+ipA12dWYiTmiGkb37lnA6m7G5zhFVe6ghXciMTPPUM9xViXZr0PqzGLqbuDYm3qK3SL+7bgzNlf7MsphztptzFqg7H6MN8AJNi3r4FWY6LvaqQXzRm5di07n8hnWlUBlvx2aTvUZbQU61iSuNbG1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CwCMoJsQ3XBHdfK27O+QOGL4OPl7EWw9dH3TIohe9kI=;
 b=q1X6Gb7KFb1GsSgUQGZEjGm1qeWU5WzbTkXnZqlevSBLXuvNEdEs49KaUGbfXIJKrRSZRDQOZpXbeoprISFV7tIkLiS2UDOnFdVHyAdH1Ame7IoybPum8U7MbqSKjRJcr2opRftg7g+sbyhZy+4+K6v37reZULx/xNz5AxLyqhw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <462a2ed3-2e9c-b271-b8d5-255c12f409aa@citrix.com>
Date: Fri, 5 May 2023 13:25:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4 1/2] acpi: Make TPM version configurable.
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230504175146.208936-1-jennifer.herbert@citrix.com>
 <20230504175146.208936-2-jennifer.herbert@citrix.com>
 <a60ad8ea-95a8-ed15-f862-3872e9fb68ac@suse.com>
From: Jennifer Herbert <jennifer.herbert@citrix.com>
In-Reply-To: <a60ad8ea-95a8-ed15-f862-3872e9fb68ac@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::7) To DS7PR03MB5414.namprd03.prod.outlook.com
 (2603:10b6:5:2c2::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB5414:EE_|SN7PR03MB7183:EE_
X-MS-Office365-Filtering-Correlation-Id: 07ff9139-2aab-4df3-209a-08db4d63dc5c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e6FFe/Cbnq2Trcq9t0bU0siokENxydNMi0v7D1pGqwIhDahhou577B6sQ4qpqMn/75jMpTxVIyB9bAUUhwB5yHW6rySD322O66C0xxbygbIvC6fPv4UGQxu+ismNPME48iOJnXvEZ3RUTD7O4R7Obj0V4XXNObC4gCLb7260dTyEPlaGnzemvviq/fK2G6gw9PYciCC7WIplI+YYImlMyHYQJjsUU6iOpJ+JMQr+BpF9Cqy2pn/+nnieVM5v9zFf6sFOgh6411XVv9f1px3MiudPn6O+AfhNV6niI7+pkFYFUkxNl+VWd3uf9aAMAodj2pnOFcq75SWi2v/UmUUaD8tHfc1Um3mE8TEDoPnnx2yberH+VRlxgqJv8bzK3d1tjRGpBkzhA5hj49aaAwd9LAo227TmA/t7esf5K2mAwQ3aOebbR7lYw3kfPzsSOzLB+GQarDECEnLEk8wnECCp3Kt6Uk+KN3lKorgD1C48RLT85uVXWb0REeNvwhlBqMVS7Qje0MCu11EoSfREIzha/w9mbR1PEzg8EZevXrME83Fcuy01BI5KI7D6wgLeKk1mQ/P4+71di8MZrTJpFSVRtIrqb60L8scu8ADgTdtRCiau7eWtbge+4PpxYKpTDtxqyyJX09rJx2z59hi9gi3aTw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5414.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199021)(44832011)(8676002)(5660300002)(478600001)(38100700002)(8936002)(82960400001)(54906003)(6512007)(6506007)(31696002)(6666004)(86362001)(66476007)(66946007)(66556008)(31686004)(4326008)(6916009)(6486002)(83380400001)(2906002)(36756003)(316002)(53546011)(186003)(41300700001)(26005)(4744005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHZmbzBzZ0R4VmhqblhQTE9Vc2tGcCtSeXhNVkJTYm5DK2lnY1FhWTN5Ungx?=
 =?utf-8?B?MUNQcFdiUDNoQ3ptL2c2UFMyYUpkcHFWT3cxc2k4SFZmRENvMmRHRkRYdzJj?=
 =?utf-8?B?QXNkYWlMT3ZXeVR3U3FLSGxuSmZJKzkvekJzNnJHdzg2YWErZXA1OCs5Rjhw?=
 =?utf-8?B?aG1BM01mWUJUSlhSUjBrdUI1YkEzRmNQOEdSUmpTRk9PSHpmeWhtT1ZaQUI0?=
 =?utf-8?B?TXBDWkRSK1h5alpJYVFoRWN5dVFMS1BLSGVyWmtzVlVkaGRGWGhLeWkrV2Nq?=
 =?utf-8?B?eEhCWVRmSEt3UERQUFRzRitVNGxPV25abzk4ZTJ5eC8wSU95MkxOUktIRnFN?=
 =?utf-8?B?WXRJbWVCSGVBREtVdTVEeGR1YlNqcUw2TW9SRm1pT0p5blVpRXJrSmZDSW1W?=
 =?utf-8?B?NUwzWVM4OFRZU0FOTUEvaUxuSHNjOE1yK20vWnFySjZXdWhJVFN6L2ZzSUNB?=
 =?utf-8?B?N0FNeW1rL2ZHdzdxendNRTNnU0pFWlhyMVVNelFtdkJNNWRoMi9qKzhvMEx6?=
 =?utf-8?B?YjY5Q1dNWXdXSXE4VlJvZi9HSlYwcWVDeG5QOTZRR2NtRk1KbEg1M0EwVzRF?=
 =?utf-8?B?YmtveURRTFlKWlIvT2ZZV3llTHJ1NGlPK3U5UHZ3emlOdnZKc0c2Y0NoUDV5?=
 =?utf-8?B?c0J6TEI0d0hLRlVqWFdBeHlyQklvbVJTbjVGVGZIL2UyK3BaRGVab1BmbVZo?=
 =?utf-8?B?UDFkOFV0aW5TbE50T0lkdXJTUmw4TEc5amNyd3N3eVJUU0lsQjZyRlZERTZn?=
 =?utf-8?B?YzI5bzZtVDlFT29MVjJsQlpKOXVMeWNZNHZTVzRCMW5sdW4yYllPTlMzTWc4?=
 =?utf-8?B?dFBtbG10YUhIZlY3VGc5RnNGT0pLTXRWblp5ZUswN1QreU1wQ2hicWNoeVI3?=
 =?utf-8?B?U0ltclArSksyWkdlcHhMYkx0K1FsajIxN0VudWQ5a1BNSFhlZUIyVlZkejJJ?=
 =?utf-8?B?SlFXaGVZTFRkSCtLa0xEYkxtWFFtVkZ1ZXVuVDdPNmNKekp2VEJQNjZwMFpK?=
 =?utf-8?B?ek80UEJRODlOdU1JM1Bic0dRVzRJNTB5YzJrMVRWaWlkNm1CNHdSNlZ4OGdi?=
 =?utf-8?B?WjlFNy92ZGtnTHdObEdZWThCUFhGZzVUdFZPZklIU2o4SE45Z2ozdWpURXc4?=
 =?utf-8?B?MXJ3MHYvb3Bjd1pycUM3ZHd0ZnNEUXBXVGhWdmF3eUNtU2h3dGcrTFYybXJt?=
 =?utf-8?B?Wkpoa0NNM2djcjR2cnVFQWo1aXNFUnc1OTVCK2JTVGxXR2RIWk5ZanE4WkFY?=
 =?utf-8?B?cVgvNDJUWW83QWZNZkRsN2kwTnNKdE51cExjVEVXT0dVQUdoWnB2anh1RkpX?=
 =?utf-8?B?aDdzTHY3dmNDdStwbVNrcFNEWmFZS3hQNEtiMHZyNjlSWUhCZ1ljWDJrSVhJ?=
 =?utf-8?B?bmdYNlN6b3IyM3c2TVdGL01VczdmYXljUDdKUVY1ZXRsMjBySmc2NU5CS3Z3?=
 =?utf-8?B?YzRnUDVNMDJzTjBwRHUyK0tkWUZnb2hpRlJBdEhZZ3NTVkxuWmNCMDNHSmlx?=
 =?utf-8?B?YWZ1WURHS1NsL0ZlOVVRQzVSYTQ2QmFQVThieGtNcGVRVmxJZk5WeDJqT2dP?=
 =?utf-8?B?UEJZdkNEemFBNlZFZHM5cWhIUzF1K2NaVWp2Uk4vdHp5K2lHMXpQWnNWU05r?=
 =?utf-8?B?bXdVV0RBeks0bEhvMWt4Q3ZmZ1RCQWZOYnpLNVZjWXFiQXdlQmUwUENDeFgr?=
 =?utf-8?B?OFpWOEMrcVVKQlFjdlNGUStqcXFWYXVlOWZPWnFpbVR6YjRVTmVDRlhZdjdI?=
 =?utf-8?B?U2JkSmFGTDhSdjlQeFlOUHZ0a2NOb1ljOTJURWQrcXNHb0ZlK3BhU20vazc0?=
 =?utf-8?B?VTlTTWJDREd1cjlPMnRmQVVTTlhXMit5N3ZkV0UvV3NoTlBxNkNXZnErMG1P?=
 =?utf-8?B?Q2ZGNWNqTCt3RSszYU5iMTBQeVhEK0lJOTNoRWQ0OFM3c245aklvTWF2elNr?=
 =?utf-8?B?aDNQMGdDOXRCZWNxZXI4Qm5kL1piNjh2cTlCSGovczBjOFZkZkxrcElCVitO?=
 =?utf-8?B?aEowc2NOM3NBbmdxR2VyNzdxWWVUWnB6K2pIWW5OdXhtSE9YdkxnNEtpaWhM?=
 =?utf-8?B?Rys2U3VGNG40VWxnVWhsN1IybzMwTGhJZ0k2MDlYUWFTZUF5VGNzNGhxYjVz?=
 =?utf-8?B?dG1vVk50aGhsOEpTM0F3YVkwV21MakNGZVpyVmR6R3dUOEVlZEcxRC9EUS9S?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	l+spBdfoiL03RFi1eE5UtzmfQViZFNnhMPrU8aYme/bFukfgwUZdtD19psTukkKNiLPMuZAevqGDEkM7vDv6WA2CmG04vFn6+P8wgeEcww7HkLC07FpDMNALAlnQTu5wdoIl5t2QH4ZBizTFQnNh0UPsUkz72GdRWKMftndawW2R/AJ3GTKgbbYXeI+42+KmTR+M4Z7mwUmZGWMY5I8eU/yO5Vd1AV7lcjT04/4Wm8iG2QonWYucUY+90tFj65ggaAztB6Pnp0YGeKCp0bWUReImvP6i8yPJtVII7zm9ozzFB2NvVWgeoS016aG4Mp6/itT6co2XLiKwKGBa0HkS7G5ILUUgTG8B7CSjZ2EIyps6Biief7/NQwtOD6GejAk8eULnkKXeZnsZxM3kngXPjmxOf2+WRoT32oZkAyEbjfAY6M4+/ML/qFFtlsZC86BbTWYLsxQNrl8Jjny23mWElAIe/o9a2qIIhvJAn+gY7srGPSbSi4AxeHmDH9qR8t+rhTUVg24wIzm8RsB4K52V6a8vqm6KUMXTmfranGLRTvgD6UurHS5WdrXX/eQ7xmPUMM/cOEjXfJLXbQi9VxXFfNoM4tJodiukrrYJOFNgNsbDBJblsUw/UK7a6481IoEUwAh6T0yO2obfwe+tmJc6u2cL+pcLBAEL0xUJkgN762S2s6r7pAzg+99uvH/FWyWs1JACkrLBSDIEOxroJ31YtpD6WsbBFhbaPJ7RM2EmRV9FfF5z73TmjcNJ2YkvNX2qGLfzSFE4jWbvrKQC9l2uboZ9lF+ddDag+v04wWxLKfzleNaH5ulqRlDpF1OIj1+GoVseAnvIgBqoJ0KMcahh1Q==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07ff9139-2aab-4df3-209a-08db4d63dc5c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5414.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 12:25:49.8949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X+39yR+t6m5Lw6WfsvCLzE7Ybsi85lr7GPYUFEUbUWNGyde1V4IKYgGZqYPbLO1ZtIGcrkhB4jJ2KnBhZ64L8FQ24jv4tZyeLOWyg23Fkyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7183

On 05/05/2023 07:34, Jan Beulich wrote:

> On 04.05.2023 19:51, Jennifer Herbert wrote:
>> This patch makes the TPM version, for which the ACPI library probes, configurable.
>> If acpi_config.tpm_verison is set to 1, it indicates that 1.2 (TCPA) should be probed.
>> I have also added to hvmloader an option to allow setting this new config, which can
>> be triggered by setting the platform/tpm_verion xenstore key.
>>
>> Signed-off-by: Jennifer Herbert <jennifer.herbert@citrix.com>
>> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> albeit with two minor further request (which I'd be happy to make while
> committing):


I agree, the NULL checks and tpm_verison initilizer are unnesery.
So I'd be very happy if you made these changes as you commit them!

Thankyou!


-jenny


