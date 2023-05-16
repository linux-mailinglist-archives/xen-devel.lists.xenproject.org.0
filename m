Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A21A705056
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 16:16:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535226.832886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyvTa-0007xa-2P; Tue, 16 May 2023 14:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535226.832886; Tue, 16 May 2023 14:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyvTZ-0007uU-VT; Tue, 16 May 2023 14:16:29 +0000
Received: by outflank-mailman (input) for mailman id 535226;
 Tue, 16 May 2023 14:16:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7WEk=BF=citrix.com=prvs=493b78b38=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pyvTY-0007uO-N2
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 14:16:28 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cd656c9-f3f4-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 16:16:25 +0200 (CEST)
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2023 10:16:22 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6397.namprd03.prod.outlook.com (2603:10b6:510:aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 14:16:19 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 14:16:19 +0000
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
X-Inumbo-ID: 3cd656c9-f3f4-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684246585;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lelNDFBLsXA4NmuwpGtTfsFxaCGCvygrwm+5b2qA2NU=;
  b=EVh18G6zc+h7UMBIwGRIAlbKeKEZUazS9+ykbAMn/kdPzdylWPINfhx/
   5HKwpbr5sb+mRfT/pyzLtQzdsLHw5PuxxG/lUDY47ComaPoKQoLT01xl3
   hCMN6vWTaXgRJz14IkFPryWbJIy0IsDwqo3Oy4jFhh4ko4+7NSbvzUuPq
   0=;
X-IronPort-RemoteIP: 104.47.57.177
X-IronPort-MID: 109238001
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RlcjRK4MQxhhPArK/U0aNQxRtBXGchMFZxGqfqrLsTDasY5as4F+v
 mAZDTiPPKneN2bxedwkOYW28k0Fu5LQyNVmHgA++Sw9Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7ZwehBtC5gZlPa0S4geE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m6
 ttfLxATbDa5t+PskYq+WtNOoZ4MI5y+VG8fkikIITDxK98DGMmGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Ok0ooj+eF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtKRefjpqYy2TV/wEQQJUEnRQuShcOfyRW8YdhzK
 UsM/DQx+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6GAkAUQzgHb8Yp3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqWMMfZQ4M4t2mrIRtiBvKF49nCPTs0YKzHizsy
 TeXqiR4n68UkcMAy6S8+xbAni6ooZ/KCAUy4207Q16Y0++wX6b9D6TA1LQRxawowFqxJrVZg
 EU5pg==
IronPort-HdrOrdr: A9a23:e+8MLqEFv9DRh0ydpLqE18eALOsnbusQ8zAXPo5KOGVom62j5r
 iTdZEgvyMc5wxhPU3I9erwWpVoBEmslqKdgrNxAV7BZniDhILAFugLhrcKgQeBJ8SUzJ876U
 4PSdkZNDQyNzRHZATBjTVQ3+xO/DBPys6Vuds=
X-Talos-CUID: 9a23:TYrPAW5f+XhnSGZBH9ss62lTHeA7cFvn/HaKcne9GVxLb+e6RgrF
X-Talos-MUID: 9a23:OrS3Fgig5ph+XCUfqB9pIsMpN+o00rT+IWQ3t9ZdufOOGS53IzGDk2Hi
X-IronPort-AV: E=Sophos;i="5.99,278,1677560400"; 
   d="scan'208";a="109238001"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6BBNaYp2FNbb/zCoRgWvs4QBA13VuoxC7oVrmscDUQB2baINzimrM57aH5q1wWhQ4VPkjc/YNl4CGnUHoQTQmU/3AJzz747KN7dcM9IOwU8tyK+y0q04hNXdYH7fIPx3i66Y5lCw4ILgsLJqHTFlidhjMiBWUtwZ3HuyfjjmWyw7chGKd1zbW8gqsjW6K5y95pT2z+WgE7G6D9NBOapizJ+pvjVCYV2pWDQx9bVrIDdHfkI4adsZ+iQnPdlLHg7p1YUVZ1eF0t9kDBuWP44oWSl2qceLFCSDSx2D/Q/cepbz4XVsHVjwbFzn+9i7/cmhKWWbsjD17jyJKiNVfOUVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAwGYWF5pFRzkGozLRQbwCbMCrKb58pgpqIbImSxPGQ=;
 b=KWzC1uaDhzcAmUAL/xXFeP+J6Wvzxv9RJQ6PQVUAhcIweMrFp9m2S1kTJ41REgutZDAYK2VBamqoS93LwOEDkw7X/GZCwyjlTf7AZ4V4wKzMDeTN6AtYFMJ2nganGUs0rODadlYWh/Izv7N8N9ymHHXhONPfrCt7rsZLpddEcy3ILCpCqWnLhaBrLHOCoylE7QjXE4LIv235gIXTBU/ITC/RFkVYNlH5HHX9e+M8cJcCnK19aXNPTKn3dE2DCIuPHubASqdgchKKElbPj6mTHPMeUWhMlzu0vw8PDaQ2Jhkfe2UZFMATbo11pbXu4nV4Se4KvEU+aXgBT+50pd2bFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAwGYWF5pFRzkGozLRQbwCbMCrKb58pgpqIbImSxPGQ=;
 b=oh2KTIP+ol3dDiv8B4ps7yxyivORKgVZHA3m9xq1lrQ08LJIJUGqz3g+B+rqBo54sJ25gJc7llAtbnm7BUjti5FVpHhs2DU1OmMPej7uVjQw1mIHymMCtpyZSK8kYT5g9MHB1OPaYGV6F49XlR6a3U9A73lWJ9YXPnLrHJOcmgY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b1c56e56-90cc-0f37-4c8a-df1217339e59@citrix.com>
Date: Tue, 16 May 2023 15:16:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/6] x86/boot: Expose MSR_ARCH_CAPS data in guest max
 policies
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
 <20230515144259.1009245-7-andrew.cooper3@citrix.com>
 <a545a6c9-db48-9d91-c23b-59ea97def769@suse.com>
 <25421dbc-5889-a33c-37dd-d82476d56ce4@citrix.com>
 <1bef2b0e-04e8-2ca0-cf03-f61cdae484a9@suse.com>
In-Reply-To: <1bef2b0e-04e8-2ca0-cf03-f61cdae484a9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0051.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6397:EE_
X-MS-Office365-Filtering-Correlation-Id: 7450d755-6d17-401b-162d-08db56181e3b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D5AbeKVpq8rf/DF4lXSwg6ekbQg41OGOQIXAve/78QzaUdN5p+xIaQboBFlx5bwgu+8o8N8SxHFPZvz32cmFUHOs4wjI0mrznpBt0FojP/zcTS532d+5Hh4gsvSVLEZahoOTPYzykDfcnyA5zRVeyjdwRdyQuyJZ16y1Xr1t2NVfAMFRNZaFrsBew1PW3bz6nsRefFg5nm+ZUXvGhUJKt+OB/FsDw4x5Cck11cEvcbNUQE6rpJYFoyaPcimnDOv5Tgo202Ppjx/PyPDaX0Mu8a4ashnS4Vsw5j9FOflKAXEAt3s0ictDblS07XBe/QiLDhUOggjX1ySnWdwZGvvJ8rAINOTlC2dI1L87m4sXXejCGO8fuZHCCtv7Pm8xPWyXIN1+gHNIpDUdy/tkF1G7nexajRuA28kNIEUmViMDumdi+U4Pbq9XafgJOIALUFLqVPnWSI8N7Gn6taMxVYSBAkcsLFNWrvUcPcAv2oWo2XYn2+RjCufYxPWRzmxi956UNO0IeWenO4UI1HWXv3gb8Wzvu4E/IXk4cMEEUeC6H3N2hYfmCtnKbMIvySlAb5lo9auT3m/wIWqlizUcBAK07zPOpUOYHzzQ7g8xmqHgwYLNKhfhn2czS8IWmkA2qkO3N0alCpXrkth3LrBNBeR6XA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199021)(86362001)(2906002)(38100700002)(316002)(66899021)(41300700001)(5660300002)(8936002)(8676002)(36756003)(31696002)(6666004)(478600001)(6506007)(6512007)(26005)(53546011)(186003)(6486002)(31686004)(2616005)(82960400001)(4326008)(6916009)(66946007)(66556008)(66476007)(54906003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmgrR1UvM1RxellXSnNQR1RTZ3lWdk1HbVl5WGh0NUx4cWdJc0RQMjVtUWt2?=
 =?utf-8?B?Zm9ST1B6OEI0ZzJKZjBaM0RTSXRmSXEwZk9IeEdHdmNrNXVMUk9pRis2L1N2?=
 =?utf-8?B?YzdtY085V3JIemMxV0ZZajdoZElGSkJqSm11Vm82eG8ycWxab3VnczFhN1pY?=
 =?utf-8?B?NXBhUmpJd3E0cGNPeTZpTnJ6NmVER3ZyYlJJd0NqQkUrZUdtbDl3SlBGWStS?=
 =?utf-8?B?ZW9YY2pMWmFqMXMrNk9iZUg5Z2M2RStCVzZKc0JUdldtZ3ZxRHBaR3Zocmd4?=
 =?utf-8?B?VlZ6bk9MV1ByaVA0UkF6QjN5K1dwdURHR1hBMkJnQ1pxR2tTUHYyVnhlZXlC?=
 =?utf-8?B?eDBYT0p1aWxjYWlHd2lQak8rY0NqemljbkYwdzQ0b002bC9ranRFU1A1OEJ1?=
 =?utf-8?B?S29ydWloajhsc2VtQkRJU2dKYXErWS9ETUNneGs3QzBPZkwrY0lBci9mNjNF?=
 =?utf-8?B?N0NxUXp1clFMYTQyU2UrYU1WTlhzbFhkNWUwV2hkUUdUeTVFNHliNHdZdzJl?=
 =?utf-8?B?eDJjM01US1RpeThKQlhyUlFwSThITzlRR2VJTkNMaGJUay96SVF6SlN6L0JY?=
 =?utf-8?B?a2VUOWJtd1BsNkMzOTU2aG9xNXRtQ29jQURDSUxidXN3MktvckhVU2xPSDg4?=
 =?utf-8?B?ckE2ZUpoWEV0ZXJjTks5RklXcHZOWjVCUjFyaWd6UDJIYUM0KzR5U3ZmRkoy?=
 =?utf-8?B?RWxwd2hNR0JvSVY1eXNLdkJrOXpkRXQ4TmJlbk9YK2dFcmtSWEJ2Y2tJUW9n?=
 =?utf-8?B?MXZiUmp4UlFsSzYxNm50MFEvWmF5cVBseGR1TzJBNDFLdFZhenp4bjQvN0Qv?=
 =?utf-8?B?dlVHUk5PTy9jb3Ixc1g5NmloNU82dlpZeDlYc3IyQkZZQUZQamlSdER4QUtl?=
 =?utf-8?B?dXNOWVFoZEFoeVBSWElLRkc5WWsvZWN4Q2NIWHdJZnhiRmRGN1NSSStma0Nr?=
 =?utf-8?B?a2dsUEJ4NC9KOEhoSk9mb1FQTkcyQVE1WFBDR3dybWRqSE5IUUpMcUp4T0do?=
 =?utf-8?B?ZnZhWldqdGRGcTlzY1pZUEtOWjR0c2FOZWxZeENmTWd5d2NrSnU4MnJyTkUz?=
 =?utf-8?B?NkRPWCtqY3ZCNFFOVEI3Wjd0SnFFWmdmMGYvQzhVVlFFdldZVFRLQnNXdUlQ?=
 =?utf-8?B?cUREUkMzOHFZbmJReGpmMld2MGhEZmVkZ01IaG5TK3lqbU9MKzNnTkdHUW5s?=
 =?utf-8?B?emkvVTJ6RmtnUis1SndwbW1DRDkxaXByNGltOTlqWklCdnJFbGljNWVjY2ZW?=
 =?utf-8?B?WlRweE5idTBJRFUxOHQzLzFxZkJPb01NVmlMWVNycjNMUWtMNkk0Y2JoOGN5?=
 =?utf-8?B?aFpNbzVPZTUvK0N2aXNOWmZhSTVjd3RWNTZIUTVpL3p2d0krZVJCTnhLOUo2?=
 =?utf-8?B?aEhRbkdERWZadGVBMmltVytYMFZ4dElCZnAvLy9wc25HY0Qrb1l4ZCtXRUln?=
 =?utf-8?B?cjVlaU1wOWMzRjYrZEo2TjJydHFBcXRtZWErVkhDWm1YQ3dwYlFoZTg3UEM1?=
 =?utf-8?B?TnU0RGwzOWluMnFFdy9RUGYwRlVaR3dvQ2lTMzhFTjJSSkd1RisrRG14ckNH?=
 =?utf-8?B?MFk4VlZUZTNpWDFoTzRSSlVHSWp1S2VuY3JwRHZWaEJwT1QvdDNseGV3Uytr?=
 =?utf-8?B?b1FLQTU4RzJmcXNGSDF2TUF0NFNZc2hXSDdES2J4QjJnMmhIa0xBZ2pkNFRk?=
 =?utf-8?B?UW1tQmRQaU9IS0M1aDVibXgzbzB5bWoxY2tHbUd5a09PZFpldTRRQjhsS1Fa?=
 =?utf-8?B?eTBIY1ErT25GZndmTWxKSExISm5PUERRK2VMa2FPa01TNjRzOTlaeERtTzJq?=
 =?utf-8?B?MXJRMGRsbDZXc1pZUjZTUlU1a2xNUGRmcFIrVEk4bWlCeFlzT1R4ZWVwUStP?=
 =?utf-8?B?dnFIUVBpdTAvVW4wR0hiaFZMSnRsOFcrRWhGcUZYN0wxb21kR2d3c1M0end3?=
 =?utf-8?B?UjJ5dmRUSUV3N1dITzJ1OGNDY3p1VjZmRGd4QmlWbXkyS1pGOUNWMFFQZW5E?=
 =?utf-8?B?eVlsbmxVdTRlNDF4L3l2dTJBdHhJQzZTV0t3MHkvRmE5RnN0SDhCMXBQVDht?=
 =?utf-8?B?NVRlb1BBNGpRaEpTaWEwVE41cm40ZmFiUVNRVW5DQXJNcjVEM2NZenpzcVM5?=
 =?utf-8?B?RVIxS3lmMWswd0R0bWVwbW1oNENRbHU5YWZBNGdBVDR3ZGlhVWJOdlN5SXVQ?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wxUQPJjxMrFP5ZqyqeNV4JJ/7kiBwHQRV/D2PWVTRFX9ssd+SHkc44DECC5IhkrgTBI6vSM/V7KEawGX68aaAUjKlyL6z2rJJ+uRbFh1Xcx7PA15MhFVb7xecpOByLMNTz1GIRJo19bDMFtxaWhcfOaIzN6iAUPVMtPllLqL8lXhbUuKq8PY2gM9QAhalXitSVEaA6qqbofN34NWIqEj49AL/kXGMFtDo4JJgNLDbn0f6Hec/Lqyk+Or9Q/L5JJ3QnLWbmVViRrRCqpXCV2HZ2F+qFJ026EsaU+6JL5Rw1O3cZbO5XRGWa8vRTUyfKX6XyVmj4NW8AGoGWI8Eq42CSoLXfnUqKP/+lMSKmv38NF6szOaJ2xzNk+mMZIU3qkrzNh3GxaN0Qu+OuoQTVADsBVRH2XSXlbGccrHK16Lu7LANcJgOKzT69Pprnlj1OxMNtDVYkqf1D404Cme22Jw+BlGurOoV4Vt3nf8rPRPu+KQF8dHFZSATWMY63Cak0xmKtv7pEgx0O4XeZoyMnmELsD2t+kKfRTzXGHW21y/Bs9ZwROR7mtV9GS44WDPv+mA0gMXY25/Ngbp5bbooxvrL1ynbeiIk7Nv2g642lHHYxTtJ9xnltFzS8NqdvLHxQ1c38Lr+wqDR6RaiJ9GW9+uR4jjS3z7bvHoYIkNMN1iLc4h+agKPYq/cXQZYK3GFCWsXn0sxwqwPbccJEnv3F8ZB1+EmlOED7Tw5frQjCxzyNpcMmktaVQNOG+jZ/S1LmaVdr2hVPHs7sr6Jqb2QRuL31JpUtjjYJKR0BwOI2A3FTgjIX85IqQmqEidUNTERw+u
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7450d755-6d17-401b-162d-08db56181e3b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 14:16:19.1384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AYdQ4lIbeHrF3i5zP4+6trfr81feMJ+z1VrKskQeziLd+AdXBbsoh0agscx0EvT/ONjqPnQqCIWSRHHr1tAjnvyO4mkKRDwOxXQS9XM1uTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6397

On 16/05/2023 3:06 pm, Jan Beulich wrote:
> On 16.05.2023 15:51, Andrew Cooper wrote:
>> On 16/05/2023 2:06 pm, Jan Beulich wrote:
>>> On 15.05.2023 16:42, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/cpu-policy.c
>>>> +++ b/xen/arch/x86/cpu-policy.c
>>>> @@ -408,6 +408,25 @@ static void __init calculate_host_policy(void)
>>>>      p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
>>>>  }
>>>>  
>>>> +static void __init guest_common_max_feature_adjustments(uint32_t *fs)
>>>> +{
>>>> +    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
>>>> +    {
>>>> +        /*
>>>> +         * MSR_ARCH_CAPS is just feature data, and we can offer it to guests
>>>> +         * unconditionally, although limit it to Intel systems as it is highly
>>>> +         * uarch-specific.
>>>> +         *
>>>> +         * In particular, the RSBA and RRSBA bits mean "you might migrate to a
>>>> +         * system where RSB underflow uses alternative predictors (a.k.a
>>>> +         * Retpoline not safe)", so these need to be visible to a guest in all
>>>> +         * cases, even when it's only some other server in the pool which
>>>> +         * suffers the identified behaviour.
>>>> +         */
>>>> +        __set_bit(X86_FEATURE_ARCH_CAPS, fs);
>>>> +    }
>>>> +}
>>> The comment reads as if it wasn't applying to "max" only, but rather to
>>> "default". Reading this I'm therefore now (and perhaps even more so in
>>> the future, when coming across it) wondering whether it's misplaced, or
>>> and hence whether the commented code is also misplaced and/or wrong.
>> On migrate-in, we (well - toolstacks that understand multiple hosts)
>> check the cpu policy the VM saw against the appropriate PV/HVM max
>> policy to determine whether it can safely run.
>>
>> So this is very intentionally for the max policy.  We need (I think -
>> still pending an clarification from Intel because there's pending work
>> still not published) to set RSBA unconditionally, and RRSBA conditional
>> on EIBRS being available, in max even on pre-Skylake hardware such that
>> we can migrate-in a VM which previously ran on Skylake or later hardware.
>>
>> Activating this by default for VMs is just a case of swapping the CPUID
>> ARCH_CAPS bit from 'a' to 'A', without any adjustment to this logic.
> Hmm, I see. Not very intuitive, but I think I follow.
>
>>> Further is even just non-default exposure of all the various bits okay
>>> to other than Dom0? IOW is there indeed no further adjustment necessary
>>> to guest_rdmsr()?
> With your reply further down also sufficiently clarifying things for
> me (in particular pointing the one oversight of mine), the question
> above is the sole part remaining before I'd be okay giving my R-b here.

Oh sorry.  Yes, it is sufficient.  Because VMs (other than dom0) don't
get the ARCH_CAPS CPUID bit, reads of MSR_ARCH_CAPS will #GP.

Right now, you can set cpuid = "host:arch-caps" in an xl.cfg file.  If
you do this, you get to keep both pieces, as you'll end up advertising
the MSR but with a value of 0 because of the note in patch 4.  libxl
still only understand the xend CPUID format and can't express any MSR
data at all.

~Andrew

