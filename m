Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CBA6C101B
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 12:02:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511837.791145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peDHS-0003AC-7n; Mon, 20 Mar 2023 11:02:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511837.791145; Mon, 20 Mar 2023 11:02:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peDHS-000386-4m; Mon, 20 Mar 2023 11:02:22 +0000
Received: by outflank-mailman (input) for mailman id 511837;
 Mon, 20 Mar 2023 11:02:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xqGy=7M=citrix.com=prvs=436e66757=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1peDHQ-00032W-Rt
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 11:02:21 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac27f57d-c70e-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 12:02:18 +0100 (CET)
Received: from mail-co1nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Mar 2023 07:02:10 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB7164.namprd03.prod.outlook.com (2603:10b6:510:2bc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 11:02:05 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 11:02:00 +0000
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
X-Inumbo-ID: ac27f57d-c70e-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679310138;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7q8TQ0KDICC1wvo/eO3paUQQa7QBuO/fc6sY7XqlT24=;
  b=cNU1Qb99sdPBWrGisvwo1y13jcaM8ucFMILIY7N5V/cGFRqW/vDof4PE
   vrJO+hirHbSQDweAHPn+TmTGw/GVoR1dG+vSD1GzJ7m5cNvjejzRULzeh
   8uDU6sL/pBNZkTFmIVPqWHC2qDJFUC1b/ocEEBA0vxmO/qZRlUQnvCxUW
   Q=;
X-IronPort-RemoteIP: 104.47.56.170
X-IronPort-MID: 101430302
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:bKx1Lq5R0gntHo3UoutYBwxRtA3GchMFZxGqfqrLsTDasY5as4F+v
 mJOXGzUMvvYMGTweIp0bdyx9koE756Dn9EwTFNtq3g2Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasS7QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m+
 +M8BywrTh26u/us6q3rVtJqt/wJBZy+VG8fkikIITDxK98DGMmGaIKToNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Okkooj+CF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtKTeHjrqUy2jV/wEQYVCQvWguy4sCjpUTiW9l2D
 FMPpigX+P1aGEuDC4OVsweDiGKNtR4NXNxnHPA8wB6AwOzY7m6xBGIJUzpAY9wOr9ItSHoh0
 Vrht8PkA3ljvaOYTVqZ96yItnWiNC4NN2gAaCQYCwwf7LHeTJobixvOSpNoF/ezh9isQDXom
 WnV9G45mqkZitMN2+Oj51fbjjmwp5/PCAko+gHQWWHj5QR8DGK4W7GVBZHgxa4oBO6kopOp4
 xDoR+D2ADgyMKyw
IronPort-HdrOrdr: A9a23:a7uK+alfQ++rXi/jqchSpxobO83pDfLa3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRcdcLW7UpVoLkmyyXcY2+cs1PKZLWvbUQiTXeZfBOnZsl7d8kTFn4Yw6U
 4jSdkaNDSZNzNHZK3BkW2F+rgboeVu8MqT9JjjJ3UGd3AVV0m3hT0JezpyESdNNXl77YJSLu
 vk2iLezQDQBEj+aK6AdwE4dtmGnfLnvrT8byULAhY2gTP+8Q9BuNbBYmOlNg51aUI0/Ysf
X-IronPort-AV: E=Sophos;i="5.98,274,1673931600"; 
   d="scan'208";a="101430302"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+UwL/hbqomy0eMD4rKsIaWLcVKLhz2NCzhneUClw2AXNGSHZx6zE6uoMFzhEHuBdI/ao3Bw/wCDBgCZI3wS3ornBk96/cIa0t98CVi077GjsseoUe+qu1c4bKb8GNHW0aSujZaAzOQvnKCkDNAHEAUYQo8NJul4JACAl6ifNbiyH8WrfAB/PP2v4qnhwmXVY+hRtuVSOkwkvawj+lsOvfwQoN/dH/ylfF/szC1mbGByHccASuVPZ/3uDwCGLqUXbYEXpkRu7VExnmLoYfPt9mr9skXKGWHy/c55xRZE8Gxt+3QtMC2BYNXAzwfI+ARh9t1CDzH3JjRdmFCZSrWYNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Orf+qOwSz55MPGPt3DUltn/Toai+QGiG2RTqGnomBE=;
 b=MxIsTFFH9OQYKw0z34IK5blhv7FDAhoq9ZTPMrzpdNm1N+I0bSsKEIuhMpHD8sg2N1QD7blnME1S/Y7hGunUsGbsv1PvZXL0a/Xbql01PSdPG/HQMy2sbQ3zCmthOJTUGde67o4f1kap6YJnPL1pJfgWBU5xntm42QReKVXmWWIxEuAKlwJleT51JO/ouqDzrW6icFtQCMoG6jOgJlR9EKaaDZFUlQnLECM+oFS1aprpEQt2zrDmREYr4hYRsM2FEpbN6U7BSfgfzaeRtw+F0+KJMotUER3Zc2g0nM6le/IzK4VI+k6NWRlZKmz8amCJy/Pz+tr06yP0boPWhGkecA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Orf+qOwSz55MPGPt3DUltn/Toai+QGiG2RTqGnomBE=;
 b=cjiznj3NzaU/vKQuTS4YKNsNTkCEgTSMsR7N/Q09elfHTVVyMG2VgeHglCGLTkyR49jfBBlYe6mKX6m0OlE4TLnJLVBHxg+f0K3NJFlETJYotpnwRUs+qmFDC382OEFB6PDFrM/1nmGldWQd+Z7RpxpLmcQHWseeMk+HDw4+VzM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f68e2621-2858-38b2-f989-32178e9f5ab2@citrix.com>
Date: Mon, 20 Mar 2023 11:01:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Aw: Re: Re: Re: [help] Xen 4.14.5 on Devuan 4.0 Chimaera,
 regression from Xen 4.0.1
Content-Language: en-GB
To: Denis <tachyon_gun@web.de>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <trinity-8973751a-6742-4309-b02d-0b4c38f4206e-1678390468345@3c-app-webde-bap36>
 <84f66bc0-ae7c-febe-9a15-98453c48d051@citrix.com>
 <ce1a289e-6ed7-9b5c-42f5-069f16bd6984@suse.com>
 <trinity-429ff607-c131-4745-8c96-9d7f6f61234f-1678481409956@3c-app-webde-bs42>
 <31151e94-b8b3-15ab-3680-e1c6e2e97530@suse.com>
 <trinity-7e872635-20a4-4120-a08d-2d62a77d2da5-1678756503867@3c-app-webde-bs22>
 <2afa0abe-abe5-a3d8-658f-abc466d78101@suse.com>
 <trinity-7c345507-5695-4649-a62b-be4dd793cc00-1678805608384@3c-app-webde-bap40>
 <e5a4689e-27e1-6992-65f8-c59b669aeaf1@citrix.com>
 <trinity-b7bc2797-26a7-455a-8080-8d33234171c9-1679254738309@3c-app-webde-bap20>
In-Reply-To: <trinity-b7bc2797-26a7-455a-8080-8d33234171c9-1679254738309@3c-app-webde-bap20>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0673.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB7164:EE_
X-MS-Office365-Filtering-Correlation-Id: 18efebac-8e95-45ba-f636-08db29328793
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nFkOKAeF8OUwNEFz+6xCoorQXsOV0KQqX7XZxL0Rg5k4kyO1acP4vlzpt/WRH6OJiTXZUdygIzgMJAc+aMuRz1oSIpbGkJ2qnIa5Wstad187U4Ccw2hFM/KFyR/QbvcI8fymtvjbRCuOyyAf+Aew+Aw7/wd2t47QOBI+jNlCjbsK+uf5LKCzZcztVfyOVmuyOIsONJZclgxhBp+a83i7ILwwlSIzFK3eWRPhY4AMY0JWiwaRke/x97FLknJXgaPqa2451cUoHxekdb4pI9WbTyNlq6mFND6P4EhyvrPL9VO6mTRNsaYaO/AcSz+mnT40d34GjX5zL15n9SBqw1D9qK5WSKn5h3nezAFkKCM+GUI+varwfIQ5PU3wxmw/9o7JFlXx5b79mxOnhhRi2uh1iumN5oPg7EUG37UM4IcMiQiLb9rO1c2dI4fmuFP1wqpGfLObnsTG9K+MNTcVi49hgvh7DKDBxIHY6a0FyZTHn8LTeibhs74CwEN9uorAXinTVP29NlXcUjHsUkIPt/aJXm6YKeNwUj//NmcaquVVW1ZmySBC+Ckh8dqnJHybx5yoaUKhKNgZ7gPa3omSogW4pzLzr5EyiYELqySsphp6llevGWUtYRB7Do5G/eI3LY+T2bOV1rWZzRXibpwzZ2uizhE5LAK6R2qaGGwRoEGSSdIOSp/lmQ6XUN89Q4g3HTQ0xg5dlc13LA/aWPH4dedhS/MSMizeum/yWBINJF90Ghc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(451199018)(83380400001)(2616005)(86362001)(38100700002)(31696002)(66476007)(4326008)(66556008)(82960400001)(36756003)(8676002)(41300700001)(6916009)(66946007)(8936002)(2906002)(5660300002)(53546011)(6506007)(186003)(26005)(316002)(478600001)(6512007)(6486002)(54906003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWh6RFFESmFDVlMraHduVXJ1TE1IeUZCdlhWQnY5cWJlRFJyUkE5QjBkR28y?=
 =?utf-8?B?NHRyRVhnNGRLSlpBN0NFQy9Hc3M5SDd3ekRISjNTbU1xQ2Y4cWU3WklKRWdt?=
 =?utf-8?B?Z1c3REpYNkg2MHZzNWI1anFmUHVSRWJQRUpGQmxCY2d2UjdMK3l0YjZsbXFy?=
 =?utf-8?B?MStvUWMrV29GblRnVWR6S0N5NGxLODVlQWxDNHpHZ1BuYkgwM3p2MUk3bXRa?=
 =?utf-8?B?a2lJemcxTUV0MlpoQ0lRNkp6cDFidngzc0Y4VTFpZ1dBWHM2b0ZKRzlsclFw?=
 =?utf-8?B?ZFVnNjF1OEE1R2lRdVVseUJ5eCtOc2R0L2M1UEFwSXZBY3dOaUpNbGtndENF?=
 =?utf-8?B?cUszTGhWMnFOdDhlUG1CRDRnODVpdGVURkxXa2g5SDA4UWxoVnMyRXdnbCs0?=
 =?utf-8?B?SkprQ01XWGc0aVFzclBuVHl1SFpyOGIwUlZ1NEU1SW5sVDluTlpPQVl1NU9V?=
 =?utf-8?B?aUo4Y0MxSXZlSzlpbTVHS3ZzQWRiNHhaV0FWQ2ZNdThzaUlmUjdKT2tReWp1?=
 =?utf-8?B?d0JpSEU0WkpTdWZoREloelEyT2dHeDFxNVArZlJLeVpDWCtiMU1YbFZsSWM2?=
 =?utf-8?B?aExkaFk2U2NEZ1pWMFdHQ3ZiTkpEaFBvNkY5dlhCNnVUVG4zWVRMdDdYd0Ez?=
 =?utf-8?B?MVYxMVVPV2t0OTF0RnlOamh4clZ3dW9RMUtHWmllVFpZRE9DRzdrYjVSVy9Q?=
 =?utf-8?B?aDJnQWJDUTdZK214N3NjRWRWRHNqYWVUc2VPeUMrZTVWbkhIeWw0bW95RHRO?=
 =?utf-8?B?am1WZ3A0blJ3em9la3d4WXY3cTQ0dURKUkRuZTgvMGpscWxKZHV5dHlOWFpz?=
 =?utf-8?B?V20rY2Q4SEVneTFuem9oVCtFcmZ3bHpJZkVWUTJMRWVMR2Q1UkR4V3V5akds?=
 =?utf-8?B?NUQ3QUJLc2dibURNY0FJaXJDZ1drYmNGMUdYQzl6aEl5bHhmVlpVc1Y1bUI3?=
 =?utf-8?B?MWFFelp2YS9Ba0xLU1MvdHVodkkya0F5aC9Ocit1RFlQKy9LcjFnOXVJQVdY?=
 =?utf-8?B?OWtzQXJKTVVXOW5NQldjQWhNVisxVTJsbnZ1TmVjYkxTbDMyZHk3NXlpZ0lr?=
 =?utf-8?B?bkhaNHBmaHBhZEdJc1ZacFhVam0xQXFVbmcweEtZZ3oza05jZVJpTktrUE1N?=
 =?utf-8?B?dGFnSzN0YTZmMHlFeFpqOHdCU1ozdG00c0FoL1UwektFdUhKODl5VTBxWFdV?=
 =?utf-8?B?T2xuWGZFNVZTVFNOai9DNnE2Sk8yYlpDb2ZJMWlCUW9vbGlhNTZYeDZ4cktC?=
 =?utf-8?B?UDYxMDZsNHBFYTVIYnNrMTlEVXJkckdjR0JzNFE3bmZyTU5abno1KzM4aFhW?=
 =?utf-8?B?Q200MUM3bWd6UlJlL0xTNkoyUFRPL0szMERHOENpR0p1aG50N0VuM05GaWUr?=
 =?utf-8?B?OXVwVlE4V3FzYjlueEQ0YmN2dXhRRVp1SGZHSmtWV2VTVEQzSmR3cnErSzI5?=
 =?utf-8?B?TzZ2M1dxMHI1TElaYUNiMVl6emRuSi9WbU5HeldCU3JXTzFhWHRBWUpTeS9Q?=
 =?utf-8?B?UURkcWMvWWU4a2FSeU5HK1Jwc1lTMGdydW5tU2xkdkpjRHM3VGd2cHpvNEYv?=
 =?utf-8?B?dy8zUTNCeGdQK2xZdDY4TFU3eVdROW9BcVFSdWw4cHlWRS80TjVFaURFbXVa?=
 =?utf-8?B?NStoY2JIYS9PZkdWOGR1MWxMRVVCSlNKZFhaOUZwMFlPbGIzdmpPRUxLZ0Uy?=
 =?utf-8?B?VVNxR1hmeUlhM0Jna1NHL0FaeFAxY0VOWGthbmNPcnB5TFdzNzNCWG4rV0VJ?=
 =?utf-8?B?ZUpYWk5paXV6L3VlYnd6SEJSQU5PZFI2a1MvdmI0SGpHN3dOb05pdEY5OWRv?=
 =?utf-8?B?ZDFaTGt5SldJcWhla1E1czIyVkhIaExNdThwR2lqaEpsWmh2RkQ1VHBDRHgv?=
 =?utf-8?B?V1NGZDA2WjZjQ0JuOTJMenFVMkdTb0FKL1hwYjAybzFRd1pQMEVIbm94NHM1?=
 =?utf-8?B?NS9tSGNFc2k4RmtaQXo2cHliWDRsd2VKd0ZtN21rYVhjTTVER0Y1UldKRWRo?=
 =?utf-8?B?TzdhVVlvR3BXdytybW1xQWZWQlZsQjJFc1FwMm5BZHgwb0FseUMzMWRHV2M4?=
 =?utf-8?B?d3YrZUtIai9PLzBCcS93cjVocnFkbFJiZG8wa3BoNnM0T1pHbXhMSTh1TGRR?=
 =?utf-8?B?SzBERmNyZFhYT0pGb2NCcmVHY2ZWMksrNUs4aW92YVhnREZqVm1SaDk0Umhw?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wLo/G9/NxVcSx8dumHlGvlzgr+MfsoqZqVBUjEuNW5HhNOxcEno5p95PlBi32im5Ly214pP2Vou61ia9LEiNWReHs1bP4sUA/+4E0mNa0cyanQmjIapWn1im82gy2kMj66mLs95pBhJ+El5D/brbXmj99HKQAJy8WAlZfXqDoI2ZRarBcUqPauX7TfSHnTHhTiO9mgUG9ikljK3KRwO7BKLND6ZIesJv5MkDuwmDOyOybRHHqvTgNKdtgPr4DWD8OZ7zfCcmRicpG3kVSY7S4Y2AKiLDf90WHv4g7qua8+2GRBNd0iu3UWJr8w/E+t2odzkMZ23nox98pQ2mH/KVByY5+M15/EBEuuop7oLocH2eHILlKe2Wis7z3TCysrn4P5yfVFbExzCxrOm7lmPk4BdE9WLTzOucFUXvplj0A+7EeDVdecm8vm28QvYSeZ4QfCzuIxe5cXJe2Lg7Ucw+xXfZ1ibTCq/a1B/QTd9oTPrgOsLgTmjl/MQk1CsNWFp6EePVqvGM5QWhVT2UgHhyYoCkIad2NcLcyGC8nTaawBFco2H3bw3e1BW/5UA/ZX8YtcAa+z7Xylkp4cJUK7TJZHsONX+Mcp97fsrZzgCe+WleVDeKToNwZoATqOTceWcVGIevkZ2ovUboHqAmDGEGwN7m/MtJfdHR3YhGGqRn2T8u5rMznkDB8XF/xcBaQmAwrhREJ8+QVPzc+aCPw4J6MWeMvkg1lEla893ZVIl+rTENatJBFMRDsSi9NmGODUJGfrFqFACDclblWzUwj/UF/K6Ipbtc3noRON+hdZCoUyK/Ea7wQhZIo/EyOX2EicDG
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18efebac-8e95-45ba-f636-08db29328793
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 11:02:00.5593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JH+L0zvG+AdHWryInFrtidoEq1aAQhaH5hK4h4fzBYxLF0mHUtl2Zfv3HroSM4pRzTx9VgEp0Uog3dXzRFcSdR0f7ExzGL1DHy4iOuXjiXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7164

On 19/03/2023 7:38 pm, Denis wrote:
> On 14.03.2023 16:11, Andrew Cooper wrote:
>> On 14/03/2023 2:53 pm, Denis wrote:
>>> On 14.03.2023 07:37; Jan Beulich wrote:
>>>> On 14.03.2023 02:15, Denis wrote:
>>>>> On 13.03.2023 10:36, Jan wrote
>>>>>> On 10.03.2023 21:50, Denis wrote:
>>>>>>> Should I test something else?
>>>>>> ... there was no request for any further testing here, for the moment.
>>>>> ah...sorry, going by "Would be nice to have this confirmed forthe system
>>>>> in question, i.e. without Xen underneath Linux" I thought I could test
>>>>> something which might help shed some light on all of this.
>>>> Well, yes, that Linux-without-Xen test would still be useful to have
>>>> results from. I didn't account for this in my earlier reply because
>>>> I had asked for it before already, and I did take "something else"
>>>> for meaning anything that might have turned up as useful from the new
>>>> data you had provided.
>>> What tests could I do or what info should I provide to help?
>> Can you please rebuild Xen with this patch:
>>
>> diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c
>> b/xen/drivers/passthrough/amd/iommu_acpi.c
>> index 2fdebd2d74c9..747eae25f56c 100644
>> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
>> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
>> @@ -1033,7 +1033,7 @@ static int __init parse_ivrs_table(struct
>> acpi_table_header *table)
>>      const struct acpi_ivrs_header *ivrs_block;
>>      unsigned long length;
>>      unsigned int apic;
>> -    bool_t sb_ioapic = !iommu_intremap;
>> +    bool_t sb_ioapic = 1;
>>      int error = 0;
>>  
>>      BUG_ON(!table);
>>
>> which should cause the behaviour to revert back to that of Xen 4.0.1 
>> (i.e. it will fully ignore the checks relating to the southbridge ioapic).
>>
>> Confirm that with this, and booting Xen simply with `iommu=1` that full
>> DMA remapping and interrupt remapping is considered active.
>>
>>
>> Then, can you play around with passing the soundblaster through to VMs. 
>> Looking at the LSPCI you provided, it only supports legacy line interrupts.
>>
>> Does the device work fine, or do you get a bunch of errors on `xl dmesg`
>> about IO page faults (which is a generic "IOMMU said no to something"
>> message)?
> Sorry, it took my awhile to get it done.
>
> The relevant things are enabled again, passthrough works (even the PCI Audigy2) 
> and the devices are recognzied in the HVM domU.
>
> As you suspected, there are a few IO page faults at the end of the boot process
> (from my limited understanding it's maybe related to 
> "00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD/ATI] SBx00 SMBus Controller (rev 41)")
>
> I'll attach the "xl dmesg" output file.

Do you have this file?

If they're only at the end of boot and not later around passthrough,
then they might be from other functionality in the Southbridge.

~Andrew

