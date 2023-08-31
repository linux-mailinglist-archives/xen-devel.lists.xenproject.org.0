Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBFA78EA72
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 12:43:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593759.926838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbf90-0004R1-Jh; Thu, 31 Aug 2023 10:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593759.926838; Thu, 31 Aug 2023 10:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbf90-0004Nf-Gw; Thu, 31 Aug 2023 10:43:22 +0000
Received: by outflank-mailman (input) for mailman id 593759;
 Thu, 31 Aug 2023 10:43:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e8Cw=EQ=citrix.com=prvs=600b2b7ad=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qbf8z-0004NX-HT
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 10:43:21 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 315d6c20-47eb-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 12:43:18 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Aug 2023 06:43:11 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6559.namprd03.prod.outlook.com (2603:10b6:510:b9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 10:43:08 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::8a1b:5230:3575:dc68]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::8a1b:5230:3575:dc68%4]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 10:43:07 +0000
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
X-Inumbo-ID: 315d6c20-47eb-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1693478598;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=831qQyDXdZOgHacbfvXxbXmx55M+GYDhcRtfZKn5iag=;
  b=AnobzOr07DBjyoS1diRLogVdeLLZXwQz80y4QfaeHQuQbAin76Jkqw13
   b+RqCTf/dbTNOfgMIAQIhqkZkrlUZK1aDWPZ1IJnB7c9S2fvLAgfFImWX
   G+Knsu+q2QiOf80LN2IeGL4zHNhHvwkKmJlWhFHNPWaCMsdvBbeireFGj
   A=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 123952459
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:foee1aKwUZ9t6dRAFE+Rw5QlxSXFcZb7ZxGr2PjKsXjdYENS1zxTn
 DQXDD+POvnbZzGgc4skPI2w8hsBu5GDx9FjSlBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrZwP9TlK6q4mhA7gdnPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5eOjtvq
 84XFgsQRR27t9PuwYnrdc9z05FLwMnDZOvzu1lG5BSAVLMMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGNnWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv23b6Sx3+mCer+EpWxq6dosHK1x1ZNCSEfZVvrhP2W0k2hDoc3x
 0s8v3BGQbIJ3G6BQ8T5Xha4iGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBONB0mLicSHbY/LHEqzq3YHERNTVbO35CShYZ6d7+po11lgjIUttoDK+yiJvyBC30x
 DeJ6iM5gt3/kPI26klyxnif6xrEm3QDZlddCtn/No590j5EWQ==
IronPort-HdrOrdr: A9a23:26HfsaDqGsTX6AblHemT55DYdb4zR+YMi2TDGXoBMCC9E/bo7/
 xG+c5w6faaskd1ZJhNo6HjBEDEewK+yXcX2+gs1NWZLW3bUQKTRekI0WKh+V3d8kbFh4lgPM
 lbAs5D4R7LYWSST/yW3OB1KbkdKRC8npyVuQ==
X-Talos-CUID: 9a23:qyxEH2HflaDJN/VlqmJOzxQ1RPIqTEbA53roE37gCF05d5uKHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3A3Xregw02zjxne8ANXsz0n/KTCjUj6vn3CnAit5Q?=
 =?us-ascii?q?85ci4PBxwaxKZo2y0Xdpy?=
X-IronPort-AV: E=Sophos;i="6.02,216,1688443200"; 
   d="scan'208";a="123952459"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bocrYVJ6MaRoOhRPZHwJHnHMM0hDvwhaYa+PUg/o+8hXxDJwTGRGSz613VgYrOm/PDMzNiCY9VPfZu61tKMGKyj4A9kE2Tn0kRPYIUpKWZKcAQUbaPNGGyefUbhE6rPGAQ3RdtLxZLWnZcrRGF4zetSjMG5a9Y1H8AhQkuvKpRMBRTBKfEVCg57956h0noBnebfBAWrkOvAMTiSu0y7GNlUkB1chuOQtfoe00mUXg0LLruw9DLNH8s2VKR50EX5vJ6R21aUoE/jU4u3BpsoxE80HmvYtMtjo5IIokVxP7n724S/1TPHx0hFiIIo/tsPcT69JCJW82JPGrWQAcNr7jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1cqeqijpgvhxLv1B7jYvYIpq/meCgyTj84p4u89SKc=;
 b=VTeO5LKNWx9tGUP6+32fSETj0ivbhhBpkJ1Z+4izNwT7DTBz7RpxGVul9f1eXFEzTOA2hwn3NW0uuLr7fiIroN/KKJ+EQpqrkfEXGGZzPcFiHyvbmco3GQi+lrW02pR7mk34ItYOYW+DYMesnowFptepLOchFHUwoxxxkSJYzoImFyRaE2W7Vgt5QteIFR4OEY63em4vXVY+XGglNRWLvAihfe7qWz1pl8pEOdZJ7DuYgnfMqS4TZ0RLE2Z5Ub2RQ5kX9CbOxTBqcfwd1Gb1VXz0ll5haSo6rEzjqh00wJ75MXOq7vQN7dhmTMfggFR/9z4ZDKIGiBm77TyJ/rSbaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1cqeqijpgvhxLv1B7jYvYIpq/meCgyTj84p4u89SKc=;
 b=PQL3jkNOByt7zicURQlSKIrcALy48IUosmREcDYo7hh9Mk8TSjlwQlrw4XzWRNy+1wMkConG/ycM9mxry3uh7AMNBFjBUp1TCublcyWx6ymnA0MUQcn6o3aKyfIqLtSYbDSvU0BTEROvdyDWmDdllpF/tO1iFVddu6GPHsY0BjQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 31 Aug 2023 12:42:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wei.liu2@citrix.com>
Subject: Re: [Xen-devel] [PATCH] x86/HVM: adjust hvm_interrupt_blocked()
Message-ID: <ZPBusqv7NGaJnOoT@MacBook-MacBook-Pro-de-Roger.local>
References: <5BC0C4B602000078001F1258@prv1-mh.provo.novell.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5BC0C4B602000078001F1258@prv1-mh.provo.novell.com>
X-ClientProxiedBy: LO4P265CA0056.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::23) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6559:EE_
X-MS-Office365-Filtering-Correlation-Id: 31e4be81-a8ef-4626-a164-08dbaa0f0e7e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zzhL9TpU0/jIqY4LKC1bNSVTXSKtFj9DqYUN4gxqFJb0wXDDbC2fAtlJM5mVYiGot/lrQLjAFnYNY7Cwcamc94i6QXFLKW2Sgm4/E37e5ytJP+aPiyPaXV7AingslG6m8zehVl4UxVwOG+SRe+B9lcYTcfbJgHoozK2IRzyfnfefkt645TVLE2QJa7PGe5zDX5AE/cMY51qk95vavYzYP8FvrvPTbMcEnd4MncYiybA+A6dyCtdMH8rrJBB4A9CCmy6QDl2ECT6rP7hlKtBf/Z8W9hsfeewws0yHaenq2+A1HU68w0idPgYe+/7t156RI6gd8G4OGU/xRjEZG/16XUdgKu9PTqB9L/zUYEu4hcgtbfqOgIzxaVYIdIik9pIybSrL0KAkuk5wubVLKPn3DkRmoclB5dLzFtftbP7nA2ON27DSAoM7RqZtAPJptwlTQfLKRDWU1rAlI6+vMRgfdoS8BZPO3WeFirQwIveC0MGj2sphNH5CCJxG3h96ZDDc42eJZq2FIepu3DbAbMQmj61NriA6tSd5lQflMuH3S68Gd2kaiDmXiaCsHqt1lOb6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(136003)(376002)(39860400002)(186009)(1800799009)(451199024)(66899024)(38100700002)(2906002)(5660300002)(86362001)(85182001)(82960400001)(4326008)(8676002)(66556008)(41300700001)(8936002)(83380400001)(6486002)(6506007)(316002)(6512007)(107886003)(26005)(9686003)(54906003)(6666004)(66946007)(66476007)(478600001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnZrYnQrNXVHdk1DV20xMVcyZFVkNGpZSlV2RVJXTjlQemlRdEFrR0VEWkcr?=
 =?utf-8?B?d3k5NTdZU21DeVlSOEE4UVZCMUNxQ01MbHBoUFZzSFVNUi9kbGtPYUh4Z0dE?=
 =?utf-8?B?ME9KUVhRa1BUNTVVNldPeFgrRHRDU0o4WmgyK3hraFgyMDZSMW4xSkVsemZT?=
 =?utf-8?B?bmswRWFJOUxIMGY5VmlSNndjaDBYTzhrNE1LTzlEc2UycFh6dGpSNHVSZE9G?=
 =?utf-8?B?SFl5dEExRWdNK2Yrb1JTOEw5WjFFWUFlN05FYlZlem42akRPM1I3Vmx6RGdU?=
 =?utf-8?B?VTZFeUc2MiswZ1dxeVVkY1UrTmxZZFRCWVJzV1Y3QVhtNUlhcFcvTDJmOGp5?=
 =?utf-8?B?OWhoeXJMckpsc3pYZ3J2MHozTElpUm5VR2RSdUlRblg2MmMrMGF1ZUNDK0Ir?=
 =?utf-8?B?TDN2OUZvMVlSU2NvNXdRN2tSbk9aNisxTlZMdzY0bmwxaTBKVWpQQXFvOTNu?=
 =?utf-8?B?bHRiMTdiNGZQa0grRVk2cUdVS08xNjJSWFEzNFRMM0ZrTU8xbnJPdUVPcGdz?=
 =?utf-8?B?QWZhMkdsRk56VU1GKzEwdmdycGRyS2xVWUJ2TktYVFU1K2hkbnFBSkREdDJn?=
 =?utf-8?B?amRKRGZNd2F5KzEvTnErcTBGVDVsU2ZIS0tFY2xCTXZuc2ZPMEVEdlJKZ2ZZ?=
 =?utf-8?B?clZiN3JEUFZGQ04zbjRwUldRQ1A5cTAzZFFxK01udjlNVnVPaU9uUG5YdCtC?=
 =?utf-8?B?T2dJbDhuODhqYml2MmowY2xIZi9hTUhKS0lhcUtoTEt2UkpneWdIVzFUWmt0?=
 =?utf-8?B?Z3p3MXJuNGRTNkhaUjlYRWM4WmxkYUxkWkN3ZXN4ZDV5MExjRnNvMzdJL29W?=
 =?utf-8?B?ZmJQenNjWjRod2xBTytXcE1mY0JOVmxFWkVDWlVIK1BOR2svMDdwZE5PSFli?=
 =?utf-8?B?M056Q0RWL2JxaE1lWnYvYk51Y0pxM0RQR1NTT0lxS2Y1QUtOL0d2Q2ZHN1pn?=
 =?utf-8?B?d0lTeEpCdHBGL2dwZFk0SlRDMDd3NHBmT1dIa0FTZFlNYnZLeEdGYUszdWhv?=
 =?utf-8?B?VG1kTHFSNk5NTnk0emV2cVJtb3RjOWhPbGFBVkVZMXZuNHhvWEdKT0w4bS9F?=
 =?utf-8?B?Y3lVYU1RbkVkWFB2cE9pSnVaYVc5UDh6L3VBY2RJQzRkUU8zazRBd3JnU0I3?=
 =?utf-8?B?emk0dW1Yb3NwNk45eUNScEpieEV4TnhtSXprQU8vRHNrN1FDeGdaMmtEbERF?=
 =?utf-8?B?cHBId3diaHpLNWZRazl4djRHK1FCNlYrRFVMQ3NrLzVFMWFMdVNGeFh4TFBS?=
 =?utf-8?B?UmpkRVpXU1J3eUFBZjkrYmpsNFZSend2dk1IcktFRlRhMWpYa3pFSm5xWjJX?=
 =?utf-8?B?NlN4TE1WS1JqUjFwV0g5Y3ZJUnR3UmE5RnJKS0tBaVI3eFUvVUF4N1BENjdH?=
 =?utf-8?B?ajFPUEJ1em04VUlETG9aSlRMUUQwKzZrdlA4aHdSbFBHT1N3aUxTYVc2Nk82?=
 =?utf-8?B?SmNjb3FkYzFZa0FLd3AwUDhWTm5LRWJpQkpVZzdWVEdlV09PYVdOYkVkNVYy?=
 =?utf-8?B?MFFsSjVZOUs4QWJta3RFZUk2OVJpZkdpTjZVWTdlaDF4LzhGS250TEJSeU12?=
 =?utf-8?B?ZFhUc3dkQUliZ28vckdGbHVDMVpDRDFpNm5VMXpmQ0JjeVJuTXFOeWFidU5Y?=
 =?utf-8?B?S2gvZ2QwcEEvY3VNQ2NIZWE1VFh3WE1UOFVPSDdmdVhIeWE3M1FrRE1aSEhM?=
 =?utf-8?B?Y2cwRkdFdGF6b2o4MWxEUk1vS0YzT0ppRlJOVnRtTWdQVVBHZzNRajMxUHNt?=
 =?utf-8?B?RDJMRU5FdWVWWE5kOWdMMDlQeVh5UmVLSk5zcnM4YjlIaFc5SlJxaUF0L1Zo?=
 =?utf-8?B?WW12d0ptK1IxbEh4YkNsVXlkR29jUlFBdlJKTkhaQnNmLzBIVGpmakdKM0xY?=
 =?utf-8?B?ZUNEa3R4MmhsSjBoMDB3K1JKcndRQWVTbGdJRHJoTklpK0ZHS2JackpyYjNS?=
 =?utf-8?B?eUNkVmlMd01xS2FneXpLZDB6ZXRpckluMHAxeGgxeVI3SFFpVVlpbnVGbnNj?=
 =?utf-8?B?bTB2cWl5OUg3WURaTk1JVkJ2QlNtazZDY0RWN3FRcnVqbjEwd1JnZlVObG1Z?=
 =?utf-8?B?UTBpY3BpVnlyREluUk1oN05jbkpNbUJIYWhETk4rUWZ1cWNKTzRzTjJKYkJv?=
 =?utf-8?B?MFh2M09vcEM4Sm9vZ0xiUWFFOWJpSzV6QTUwMzdnVmVWYVdNYjFjUHpYZU8y?=
 =?utf-8?B?NkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OBzqMuSH3Hwjy6xStsfZ7EVTDEVPsN0d8shktfNr0Nz2vy6uKGDVm1+qeT7wzDkCzFiQM/+/CW78vkz9pI4aJd3DY3O7XvddGzKhTlvgqYgzVr/FI9IpLgtMEn90d62h80D+MSC2/aMy77jGnnEdJPL1wOt60VbPoIzWeH1/dg3Dp/IQU2Z7jDkJhLHNj0zqMVwHln/6vuvh7DPiTTUUlna/Ydj9waVmLATYUsnX6DGz/cSdwrffDILumrsr0wdZM4o5fkB4JbnLt4PHbnOi6XM0KRLCZR/ab7/jThn/D67w8lQNo1QcbIDPhGfhI5jPpJoA9UxB3TaqDyILSLZY5IIKLD4C/oTF3BMUUqh5J1CdXU9uPb4LGbZbfl28+1CTRyvGakL5i+69/9HWuEmX4QUWwzscuiNcuLTPwBZEKcS3WmUk2oThDVwPd2M/umYlAwZcJf2XrOcrNT8S5WjK0fqaMp09fANB3TsMLo1nwxD94jgKYhSSuygM0SFVaA1xB62JIvP6tmwJUR/ib8Srt+84RUFVpGcWrxnz9HkUlq1g5ORZAXLFunkVTEyUthULL+q3yN0T6Wn+VVq3CBB6BADOgzK4oJbbB2qzA1BvMc8wR0NApWzWHrtFGmNkMib7Gt/ywdzU5p9sUgv9Lr0vDX63mPq8R+oFV4q0wFhhcFptK6ZLZTmeG+2VLp+gaBiFNhXki5K+b2ourVSzQo4VvmvlquKmQNziBfccOw7T8stHbHDvdaev/dUdIl3v7jGuKYtIQGj2M/h203Qm8mXNZ4vM/kvtATSi+TZk4Urbqi/EqY6pvhjZMytSFzXmOBFp
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31e4be81-a8ef-4626-a164-08dbaa0f0e7e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 10:43:07.9070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ysrjSFJw01B2F3wyHCCsww9c9UdKNwOIS1mTPvZIWl8zk84IMcugbWcFfGT7uzaqd9wAnP0Nwn49sPJHcQJ9lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6559

On Fri, Oct 12, 2018 at 09:58:46AM -0600, Jan Beulich wrote:
> First of all, hvm_intsrc_mce was not considered here at all, yet nothing
> blocks #MC (other than an already in-progress #MC, but dealing with this
> is not the purpose of this patch).
> 
> Additionally STI-shadow only blocks maskable interrupts, but not NMI.

I've found the Table 25-3 on Intel SDM vol3 quite helpful:

"Execution of STI with RFLAGS.IF = 0 blocks maskable interrupts on the
instruction boundary following its execution.1 Setting this bit
indicates that this blocking is in effect."

And:

"Execution of a MOV to SS or a POP to SS blocks or suppresses certain
debug exceptions as well as interrupts (maskable and nonmaskable) on
the instruction boundary following its execution."

Might be worth adding to the commit message IMO.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -3771,19 +3771,24 @@ enum hvm_intblk hvm_interrupt_blocked(st
>              return intr;
>      }
>  
> -    if ( (intack.source != hvm_intsrc_nmi) &&
> -         !(guest_cpu_user_regs()->eflags & X86_EFLAGS_IF) )
> -        return hvm_intblk_rflags_ie;
> +    if ( intack.source == hvm_intsrc_mce )
> +        return hvm_intblk_none;

I've been wondering, why do we handle #MC here, instead of doing the
same as for other Traps/Exceptions and use hvm_inject_hw_exception()
directly?

>  
>      intr_shadow = hvm_funcs.get_interrupt_shadow(v);
>  
> -    if ( intr_shadow & (HVM_INTR_SHADOW_STI|HVM_INTR_SHADOW_MOV_SS) )
> +    if ( intr_shadow & HVM_INTR_SHADOW_MOV_SS )
>          return hvm_intblk_shadow;
>  
>      if ( intack.source == hvm_intsrc_nmi )
>          return ((intr_shadow & HVM_INTR_SHADOW_NMI) ?
>                  hvm_intblk_nmi_iret : hvm_intblk_none);
>  
> +    if ( intr_shadow & HVM_INTR_SHADOW_STI )
> +        return hvm_intblk_shadow;
> +
> +    if ( !(guest_cpu_user_regs()->eflags & X86_EFLAGS_IF) )
> +        return hvm_intblk_rflags_ie;

I do wonder whether this code would be clearer using a `switch (
intack.source )` construct, but that's out of the scope.

Thanks, Roger.

