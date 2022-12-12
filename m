Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06235649D2A
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 12:08:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459486.717231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4gea-0000qO-IN; Mon, 12 Dec 2022 11:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459486.717231; Mon, 12 Dec 2022 11:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4gea-0000o2-FF; Mon, 12 Dec 2022 11:07:24 +0000
Received: by outflank-mailman (input) for mailman id 459486;
 Mon, 12 Dec 2022 11:07:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5WVn=4K=citrix.com=prvs=33806dea2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1p4geY-0000nw-HI
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 11:07:22 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 241cfcc2-7a0d-11ed-91b6-6bf2151ebd3b;
 Mon, 12 Dec 2022 12:07:20 +0100 (CET)
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Dec 2022 06:07:14 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB5502.namprd03.prod.outlook.com (2603:10b6:a03:279::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 11:06:21 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%9]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 11:06:21 +0000
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
X-Inumbo-ID: 241cfcc2-7a0d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670843240;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=FsuUqNVD3VLLRl05ZTA2/kS5yK+ATzW8JzY5wYsHznA=;
  b=gEcr+55HaeRajSkiqJv8D07hqQoVitSbrCE7xnYXWpNGtoGWq6T+14Ge
   N/0qDy3aAZ9mQQsj0RuAKJaor3sTctRKINFHapk4QAFVFPPJZ9Z0ekxfG
   87h5Oxyz31xOCWba0LYfxiKF0Qrph6Ed2e9f/XGOFZ8lmUx/BHKej4c8D
   Y=;
X-IronPort-RemoteIP: 104.47.57.173
X-IronPort-MID: 90366755
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YswKdaoVwHWfPOE13ohSLAsjb0NeBmI+ZBIvgKrLsJaIsI4StFCzt
 garIBmFa/eCN2vzfIt2YIrg9kwDvpaEm9VrGwM/pX8yRn8a8puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaEziNNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAGoTP0+ZqN3n+Z+EDdA9jJgiIJnILrpK7xmMzRmBZRonabbqZvyToPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeeraYWOEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTCdpJSuPnq6MCbFu75j0DCjQwCwWCmfi3kEKkZ4x4D
 mUQw397xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqC8p+EoDX0PjIaRVLufgcBRAoBptXm/oc6i0uWSs45SfHuyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CBvJ6s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:n/4gPK/RuS0LogzJHBRuk+DrI+orL9Y04lQ7vn2ZKCYlFvBw8v
 rE8MjzuiWbtN98YhEdcKm7Sc+9qBDnhPtICOsqUotKNTOO0AGVxedZnOjfKlXbdhEWndQ96U
 4PSdkdNDX6ZWIK6vrS0U2dN5IBzbC8gdmVbJ/lvg9QcT0=
X-IronPort-AV: E=Sophos;i="5.96,238,1665460800"; 
   d="scan'208";a="90366755"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRWSXiu2UdnYNz+bjxUnE8wUWBlIwC1ROt+ibEU/dHJnaqDjlk1uJRi137wPpl5HTdPVRP/Wq09oUFhioWE9VOvX1FM0KQoXxPhQzHsYJ2HKyhgT1uDY9icXTmbrsF88besZLDNclri4Sws794GTEaCUlzXpNddwD0ot5lu7ST4m8Q69m9hozM302X3pzKGvM6DTcjegrFF4iW7swQrs9hKOUyoGPDfnOlIxW242O+nfcwcWZwaMPQnqlueXYa1zq/M5bqfAePJ32BTEMPzVbx91tu5TIP8mSCeZDqSx+PJ97IqhbaakXWSXA5AgL+Nua5OLnUaEN3o05YqZeQzV9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nH75FYLfPiOxaL47gxLeYgzQek1JJcB0xRcFV97EqyU=;
 b=O4mSw4qs+Jqy8YE9QXEEAMZ4IYoJs0w448yoySASQQWJvtiPKltSfJdUPX+LMMHKga9K7jJNY/C05yf9uMGuyEoB3dUbDtP2GcwXNSYDFgFONu6wv8WDNKDZljYwrUUkViM9VZktBUzdacQtFCASL1RPosInMn5tt3S4Ovbf6Hcavu9aE6PeV5J26zAcx+GPmS8UZjHQuCJVqI1WHg1SPcDfko2m6AiHDYKEsnObKe+ugxo3Axp1h0TRPI1fzjGWiAsWYPpU+qG+QsCFX5PCVcgi748JYXcRmFTJiLlaGSNkGOVAElZa5sDs8e29eJojUYrfSWK1ehvYwEYjGf2M/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nH75FYLfPiOxaL47gxLeYgzQek1JJcB0xRcFV97EqyU=;
 b=LHv+IFub/vRvimeN/Not805RfLxcMaCDE/j5kCgn81EWNCeLIpyLJB6AIwctYJckFTOb2/ZCiz1j3Jv8eQPyRCXZbZp37niwYwv5Ij35trMf+INpiASf193MjAp+RbzYNQvkYlNGBQeBY5HOfmgCqp04o1u+ZSERg8aIX6iSfn8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 12 Dec 2022 12:06:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/SVM: restrict hardware SSBD update upon guest
 VIRT_SPEC_CTRL write
Message-ID: <Y5cLKEnV3U9yEJbR@Air-de-Roger>
References: <6189fed4-2aac-8ca3-90f6-7a750a8993dd@suse.com>
 <Y5MG/osKnrCMsztu@Air-de-Roger>
 <c8cb821f-fda8-bde6-9585-fe689ffa4be1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8cb821f-fda8-bde6-9585-fe689ffa4be1@suse.com>
X-ClientProxiedBy: LO4P123CA0285.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::20) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB5502:EE_
X-MS-Office365-Filtering-Correlation-Id: 1050ab3c-98a8-4647-5030-08dadc30e657
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UAcS35ZZHIzWWs4uJMtDEPsaDK5qJpnIT2Q0naHzwKctixeE7t38g7swbgu2gj1yy+gDepMy+w5SaT2xacm05iNbrC25yVaHAaGqJcrUUJpiOTtIJMB3f4EiYPyibc3J4PybQi+3iIHz6PpSMUgzLSh0jvf205c6SAizvdWPrC/ki/sMzGRRbjG9ff+Lo2YzOaxtOIHmYjU0eYQnJgsQ/Ofv61gKmmM4M5cSUtdOnPnUxz7yvfWRLtEMlCD3WJgPpP6Cd3qmqqK7O1fbTVSwy+R4Sg2GlQMPqdTsWBMwmB9/wx34I6SZ1BfScIFq9iV7kMBVirIkGGJHso3faGCVgoxnKAWrQ25XWgKN6CjFmdl7YzAwQOBoQgGc3zlpftVL1BdhS34r8u4FelcQFhvGjDPUQqhrReli5nUhf1IxOK92urBIy6B5EBLl8Pk+k31L/db6r2IMTwfEzBtFfyepE2aiPA2qITFYZFfW6wME2o88GdZUwmQpn3RtXUvinBy4z36Lh0fcYfTD3dSgGZsDCcUKiy2F6wDOCMeVL/GzpLqCELAp2PPvGmTL6IxY1EZBErbS43XOCMxKPi5heXraHRMXgBgT1ncG5U1ynOIxC9uT5W9hssBUufc8u/h2U0+xKBuCAlyrdPu2Yc3PAeQYZQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199015)(85182001)(53546011)(6506007)(5660300002)(26005)(6916009)(41300700001)(4326008)(316002)(9686003)(6512007)(6666004)(66556008)(8936002)(8676002)(54906003)(66946007)(83380400001)(82960400001)(2906002)(33716001)(38100700002)(15650500001)(86362001)(66476007)(186003)(6486002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEZKeCsvcG95NWRYVVIyd25vd0diemU4SGdFMGZKTU1ScHhESkY2d2NmUFZF?=
 =?utf-8?B?dWNUYzJ5bG42TWJuRTZ2ZURFa0k3M3h1T0NUZUkwRGxGTk9VaDAxUFBYckV1?=
 =?utf-8?B?Sm5EOGZPVEJVSWdEcE43MVIrWUNFMFlBbjdBalhOMHhYOUZDRkY0MjNwRGdp?=
 =?utf-8?B?QmlUV0trRTgvSmpXMGxKck1WUENRWkxyYnczdmtWLzhiY0o1djZNOVhhd25P?=
 =?utf-8?B?L2lvRGhJSk5hRGd6QWZkVVEvSjBCMmh3cDBENndPcERseFVIS0IzQXZnR25y?=
 =?utf-8?B?VytnZW11cVNCSlNUZE8xVlRKZ25mazYvUDZFTmV1T1BxM2xaUWQ3L0RxbWxT?=
 =?utf-8?B?dEZvd2pNQzNWN0prR29CVFNTOUJGVmJnK3p3V2VRU2tsWklkVmhKVEk3SDhN?=
 =?utf-8?B?UnVVVmRXa2dBZk5YVjRsVkpuQVN6OGF3QWlpQ2c2alY4alFySzA1RUhzWHRo?=
 =?utf-8?B?K2U2OWlibEdvT1lSS0hKTjJyTnA0L1RPWHVBcEg0ODBPY09NcGtKWEpmcmNW?=
 =?utf-8?B?akFtdzVZRjhnd21HaWE4bWRMOE9QRHRLQ1ZNQkYwWGIyWkJJU21GTzBoR0hJ?=
 =?utf-8?B?WExsWGRMbHlsSmxDWXkyZWNQcnZUM2lyNGFPNVNOS0o5TDJvWm5SS2dOaGRI?=
 =?utf-8?B?Slc3bFI2OFRlcjgwalpXN1FsaDdjdnMvMzh1MXZGMG5vc3NrektQVjRPK3JK?=
 =?utf-8?B?WkpTSWU0Y0VuUU0yUVdHRnBuL3dzM0Znalc1eHB6VG5HbkdRUklhajZwdVc3?=
 =?utf-8?B?Y0dpSm10a3lOUFhlVEVwRVlyU2V1UllNazRhSUtiSFRwWjJ6b0lhYlVlNm51?=
 =?utf-8?B?ZmtEZThmc3BUdFFzTkpZU3lGc0tmUGphTXNaYllNQ3B0dFRGRDR5dkFaQmpx?=
 =?utf-8?B?U1JWSVFyMDJXZUJ1VWdBNnQ4blBJKzVIL1dlck1KMk5YNjBSUHZJRllwaldM?=
 =?utf-8?B?RmtXWno3WnVFKzlQaWF5VDBrRGRKSHN6dXA3em5hQTc1WkdkL0ZtQVpKV2xF?=
 =?utf-8?B?aWY3cGtUUk8wN0lPYU1OUnpWdlNuekpuZ0ZGMDZnaDhDSFVOcXhocVZicW5w?=
 =?utf-8?B?RkRUS3A4UzhJUTJZY2N0QUVxWktUVjBLbDZLTVF3anYwbFR3eXdoMjRvczN1?=
 =?utf-8?B?UlJxb2xmcVBJamFRWTBxSjNuQU40WEdWaG5YeDg1cFVmRDVHZHl2Z1hlc0x4?=
 =?utf-8?B?TDRPdUNOcDdpUVl3NitzT1ZHOTdMMlBWaWdRU0dPQ2wzRlgvUXA3MGdWL0FW?=
 =?utf-8?B?SkhIZHdqazBnV1U0UFR1c1VQQ1NkUU5ncGpDSXpPK2ZlQm9KWC9qdTBMaEQ4?=
 =?utf-8?B?WVBBMHpJVWxXMEVJbVlrUkNySlcyQitzS0FocVhXakN3cFRRYXVRbFpaWjh4?=
 =?utf-8?B?VlFxWmovM2pEVll4cmJ3ZHlERzY2aFpZLzlsbnZ5UnBwcXowYmlhOXVEZXMr?=
 =?utf-8?B?b2FKZHNpTEdDZGNyOEtjQnpzVktOWFl5eGJVVW16Tm5VOStHbTN1bTFBRG9E?=
 =?utf-8?B?WDhDVDA0T2p5Z20waVNObGw4T296RS9lOG1WZDgvNEwwRWpwdGM0dm52ZUd1?=
 =?utf-8?B?N0kzWVh4Nm5qTzJRdC9IYmhKc1pKVDdYTGpuNjAxTlhUSzZuK0J3T1BzMndJ?=
 =?utf-8?B?MHl0YnB5N08zNEhuZXJSK0tFdnBxWFFDdGtONWZtMWlUUFdsWXVXUGRjb0ww?=
 =?utf-8?B?MzlaWXh2dWhwbTVHeXVLUzhPM244dWNad3NTbjVHQlNIYm0xM3lzdlVyY3hS?=
 =?utf-8?B?V0lwS25yckQwdHFJQ3JHVlBVTlRxbnJ1L3phTnFCL0pudkJ4YStTaFFkSGx3?=
 =?utf-8?B?Q1RCeUMwYlRZZG5ubk10T09rYkxlRlBuSGI5dnV1c1BoUnZzMmJMZDZPa2tF?=
 =?utf-8?B?K3F1NGxsNFlHaUxhVnFuY1phVCt6eGtLQ0dZcGRBQnJNc0J2amFiNHZjS0VB?=
 =?utf-8?B?eURudUlBZ0dWbDlWcEJ6dEdFdWJQcktOUGRxb0NrTTg2R1hYNi90QlZSb2tN?=
 =?utf-8?B?M3VoT21tZkVmRTJEekVIUDRxbk1HMkhoZnVtdFpBT1haZXAzWXJPY3cvK1RK?=
 =?utf-8?B?cWZzRVhnVDhFV0lDQXkxZVErVlFadis0WE9MelpjTFhzYm5XZ2kyY2hMckQz?=
 =?utf-8?B?Z0cxZnhnYWxhcmdFd3paTm8xWVl6WEtWWmpvemxWRGNlOEgyam83OVVvbm4z?=
 =?utf-8?B?OUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1050ab3c-98a8-4647-5030-08dadc30e657
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 11:06:20.8910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nIJrNgC863UguPDCioCu6vFZrwf9Cwmg7+z7ZO31K/9Fn4C7yBbHtM598kJj0CyFAdLKQUr0//1/u2TowfVIdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5502

On Fri, Dec 09, 2022 at 11:11:29AM +0100, Jan Beulich wrote:
> On 09.12.2022 10:59, Roger Pau Monné wrote:
> > On Thu, Dec 08, 2022 at 12:24:54PM +0100, Jan Beulich wrote:
> >> --- a/xen/arch/x86/msr.c
> >> +++ b/xen/arch/x86/msr.c
> >> @@ -699,12 +699,16 @@ int guest_wrmsr(struct vcpu *v, uint32_t
> >>          }
> >>          else
> > 
> > I think you could turn this into an `else if` and check if the new
> > value and the current one differ on the SSBD bit?
> 
> I'd prefer not to: Keeping it as I have it will likely reduce code churn
> if a 2nd bit wants supporting in that MSR.
> 
> > Provided it fixes the issue:
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks, but I'm a little puzzled by the constraint: Imo even if this
> doesn't address the observed issue, it still fixes one aspect of wrong
> behavior here. The sole difference then would be that the Reported-by:
> would go away.

Just wanted to make sure whether there was a further issue linked with
this, in a way that we might need to change the fix.  Maybe do the
accounting in amd_set_legacy_ssbd() and keep track of each thread
status.

Thanks, Roger.

