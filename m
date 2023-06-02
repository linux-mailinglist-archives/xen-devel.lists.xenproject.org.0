Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5F9720A61
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 22:37:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543245.848059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q5BVV-0003U4-Bb; Fri, 02 Jun 2023 20:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543245.848059; Fri, 02 Jun 2023 20:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q5BVV-0003Qs-7j; Fri, 02 Jun 2023 20:36:21 +0000
Received: by outflank-mailman (input) for mailman id 543245;
 Fri, 02 Jun 2023 20:36:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0ON=BW=citrix.com=prvs=5106ed88e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q5BVT-0003Qm-Bp
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 20:36:19 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e87ebcb-0185-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 22:36:16 +0200 (CEST)
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jun 2023 16:36:05 -0400
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by DS0PR03MB7278.namprd03.prod.outlook.com (2603:10b6:8:12e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Fri, 2 Jun
 2023 20:36:01 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::7ebd:898:4cb0:7514]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::7ebd:898:4cb0:7514%5]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 20:36:00 +0000
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
X-Inumbo-ID: 1e87ebcb-0185-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685738176;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=w4QfV6U25NfTxLj23TKZ5MdViJ2rhU+xT3CjB/7jyQw=;
  b=YMPPSYT/DW/opy7xrpnctSHldlory9TvMnYJXiRNt8MQkT1sBsOSOrF7
   Zikwiq/AS4D+EBvSZW09fUV5pULh1pIlJDno+4ijiKcnQXK/biUS/plbJ
   6MljNiY1WWOJKCP8A2Ikxxk1ApaK8NZjlS1sOEiUGP2A1bph8ri6dNcSG
   8=;
X-IronPort-RemoteIP: 104.47.57.176
X-IronPort-MID: 113913961
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HUI0G677T8Pmpnq7ST9sKAxRtPjGchMFZxGqfqrLsTDasY5as4F+v
 mYeW2/QafaCZGHyKoxyYY/l9UtQ75XSztQ2Sgdv+Hg0Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35JwehBtC5gZlPa4T5geC/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mz
 P8JCDQcfBq6mvOqx5y6FMpXg/kyBZy+VG8fkikIITDxK98DGMmGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Ok0ooj+aF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtLT+zhra802TV/wEQYDxgSCQqKiMOLtWCDButjJ
 RUO1HMx+P1aGEuDC4OVsweDiHeAsxwVXdZKFKsk4QWJx6jTyw2dAXUICDVGbbQOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRUcAbyIZSQoO4/H4vZo+yBnIS75LD6qdntDzXzbqz
 Fi3QDMWgrwSiYsH0vu99FWe2ja0/MGWEEgy+xndWX+j4kVhfom5aoe06F/dq/FdMIKeSVrHt
 38B8ySD0N0z4Vi2vHTlaI0w8HuBvp5p7BW0bYZTIqQc
IronPort-HdrOrdr: A9a23:12URSaB9m0jlSGDlHemT55DYdb4zR+YMi2TDGXoBMCC9E/bo7/
 xG+c5w6faaskd1ZJhNo6HjBEDEewK+yXcX2+gs1NWZLW3bUQKTRekI0WKh+V3d8kbFh4lgPM
 lbAs5D4R7LYWSST/yW3OB1KbkdKRC8npyVuQ==
X-Talos-CUID: 9a23:HjLHPGENsS24RT+iqmJe9180HtE3eETA3WvXDU7mKl1sday8HAo=
X-Talos-MUID: 9a23:dLJzkAY3WPIwDOBTvDjpgG0zBe5S0ZuANR00rZtfoefdKnkl
X-IronPort-AV: E=Sophos;i="6.00,214,1681185600"; 
   d="scan'208";a="113913961"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oc53hHVg5tR202bVXPBG2AVznhUPkDFSM9R4ZK1GAC8dJExmDkr1pWdY6udDYP0EhFjd5bk+ZgYjhqocK4gQonUTgKrbCQhl5Fkh7AQWOGrsphv/6vpinDLciLDkr4CczZZwnUOxRGrrG6XLPcUF9lVJBzqc9acsVNpmjQmFeQg6atqgK//n0tJOYOrUDyvyF/LKoRbx3QdnBFOeUQq6G2E1l98tnfObF9hCl6W1/i+ZalLkImEwC4mV9si8Rf75BCg7Za3sZbfZcgu8cSnLEc3WFgV1A1unrTGD3hnTbxk7h6T1+a9Pe7E2D7IQg16PaltWNEuL0Tra5Y3ZBmJT1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4QfV6U25NfTxLj23TKZ5MdViJ2rhU+xT3CjB/7jyQw=;
 b=mPef6cclYqF52jV8LYAyoEBBFuj7voaprGKHD1SIY2g4pBzIwglcQxc/8PeZJ5VILGIQthtkaqR7tYGK4+/iGHTaPVqKMyKyugcqNR47nztiNHVz83Ube6XSrI0CnsuESFcdNsJDxDHC0siVJNxEsRnYW1BeNKzNFzWd5geYs8zA6XyhW7pny17mrck87GOry5c4xONzbpUBpTOVNV1WKwdWKAoUN1gZmjUnCGsFPGc6KWx2pBNfauslNQOdyWODSBW0geQTpGko4NddxX5bv5bK/X0OPKt1mClUSfeDwvnHmUJXZV4donOqinKI+YMLJxYUboovR77BJtfLRAYkFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4QfV6U25NfTxLj23TKZ5MdViJ2rhU+xT3CjB/7jyQw=;
 b=IOGD4lHm2XuDM2u+tsOGpAd/6RXHMJoQ2ais7h2Sm3GDqnI0Xt1fTFhXORRckUmcccynCQRMM/DAvqlm3e/7DOOYws0AW5wZrKFXbdcsU1knZ/psMBOZeldJbvD9HbCsX9Tm3adCZnfpQbYuxk2qD/w5N2fLxWrarMZuaWpfwRM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0b118c70-b1b0-43ad-31d2-1b301b360b12@citrix.com>
Date: Fri, 2 Jun 2023 21:35:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] x86/microcode: Prevent attempting updates known to fail
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230531175119.10830-1-alejandro.vallejo@cloud.com>
 <83324533-38da-b5bc-875e-a161d7501eb5@citrix.com>
In-Reply-To: <83324533-38da-b5bc-875e-a161d7501eb5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0228.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::24) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR03MB3618:EE_|DS0PR03MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bc5d23f-e5bd-4f3f-53c1-08db63a8fa20
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bgqlvDpe1W/8ruVotzL/s72YYzL8KgiBRvQy0PgliQSy+nzvL0jzkrIJ/psPHY2WOPj6yozWzGxl7wGqu1MyE3MblwTK7mWo4bT2t509g/vZY+XQ3O2ZIEkjXehhb5M/DQa0YEeUZ24u85r6oW85nCh9BXuGOVXeFMctO21MWrsUJCeQIBlhWn0L0sBXuV/nFy+rmlxlFEKfHFy/sh33JCxTBAFfpUpwkxun4lnuMXXNrsBTAHpn+3ZbICuj8ckp+CHJRW4a35ge+36bukHaXSl6EZESLIjD7m16vccYkQyz35hqOq+GUnA9rdRsfr08TyLSh0xqaz0EK44G7tB1Kaplc9OJc1cZ91ksB09xqNdL4h+kfF8vKMc1UU/mhePRZU8nNjymvwgukGqn9DZGYsOcGn6r4WaEGhn9aiu0eYiym2L2Bn9lnKl9Q6zP7urVMY8Yyr7ZCK2JnxkdiWcZAa4Qc7qrvgH20urGygQhFyxWLZcy5JMFPLfUAZYnSAsFC29GBmZizy1n5d6F2OPpJyOiEUrel8mCh99jIxmW1MrkjUNh9VwjlsKv2wqFrG6EjtG/qCMGssR7yBokfaXc8Tt26waobxBYLUTOtZp2/DkLBHuyXXgRuQo2o/b7T0wpYmlhc51ZVSPCsDPFYjhrlA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(451199021)(53546011)(26005)(6506007)(6512007)(82960400001)(15650500001)(186003)(36756003)(2616005)(83380400001)(2906002)(38100700002)(110136005)(6666004)(31696002)(6486002)(316002)(41300700001)(54906003)(478600001)(66476007)(66946007)(31686004)(66556008)(8676002)(5660300002)(4326008)(8936002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1YwR09zdmVQa3ZxVk5sOG1pQ0N5TlRmSzhCUzQ1ZUkyUGVlTmpmdThpdGRr?=
 =?utf-8?B?R2NCMTk3K3RmWTg3VnR0Z0E3cDdUVG1KSlN5Njk0TitLTjlJaGd0VFhzbmpJ?=
 =?utf-8?B?U1VMR0VRekp2bURna1FwdnM4dmdaZUxEenViT1FESG9ybFF5MlI4TXRBdHZS?=
 =?utf-8?B?N2d4ck10UFdTSURISENCR0RQWlRPN2FxU0Q4YmRTU2VaU2pzTUhzUXBMUHVQ?=
 =?utf-8?B?ZVdSQVZ1WkVETEw2T2p6MHZucVlWWTVBbThNcE1jOHFVdUZCN1hoQXpOQzA3?=
 =?utf-8?B?VjkyMlNiS0hwWFJCdmR3VWdkOGpZbS9KUCt2aFhia0gybGR0bHZ1Tk9pZkpY?=
 =?utf-8?B?djRhcWlCN1orTkRkNjNMblc0U0l0WTVTblJ5VG1BbHREMzJ0TEY3Q0U0VEZu?=
 =?utf-8?B?RDc2bzN5dTVrRVpoMjl6UVhuWENqU1QrZzVCOGlJNUZqN3c5ZDNBRHJCMDU0?=
 =?utf-8?B?VzlBUXVZaVk0VkpWc0RReENoU0tWcnk3UUtRQWV6aXFMM3A4NzJmODVQSVp3?=
 =?utf-8?B?OXRCVmdiYnRxQUMwZ0l5dCt4bzZFL2xRRUNGTmcwSDlkQlNMaXVvOXBaQ0lU?=
 =?utf-8?B?SU9wS1BoeDY4K0NxSTBFMnhRRTdMNUVOcDRTa0JrZVVQQzN5bXNDb0pZV3hv?=
 =?utf-8?B?eUl4RHBoVGJ0T1B0SzlMNHQ3bHpteVQza3BDM0dLd2IvWGFJQm03eWRGM3RT?=
 =?utf-8?B?ZUNjTGNrUHF1RElaV01UTkRpSFYrV1hiMllKZld5aHBKUXhyR2djdHR6VlIz?=
 =?utf-8?B?aTgvc3FoZENmZzlHYnV6MlNEU0VpYUgzYjRxNU5oVi9WYi9RN3VLNVp2MG52?=
 =?utf-8?B?Mi9NQmRvTnBJVVJ5ZklnbWxVM1hLdzFpK1g5OVM3N2REbkFHSFVOSEQwSGhT?=
 =?utf-8?B?MGpwMmVwczBGWFVIZVhFWjVpMU5BTy9paTZ4bjg1NEs1YkJkR1FKNnprenRv?=
 =?utf-8?B?ay9iY3dJZ0R6RW5UaUEvYzcwZ29UMDh1aU9RRDI3anU0MEVrUlhpNmJEdHk2?=
 =?utf-8?B?MG1HcjdjK3VZUTZWaFN3VFFyeWdVbVh3UnRZVSsvYlhIdWlrNTlTMThHU3Z3?=
 =?utf-8?B?Ynh2UHNTV1BjUlYvS3h5ZmlLT296Y2k3d01lM3VITnVFQzR3eG5wajdiaDdk?=
 =?utf-8?B?QTN6QjVNeDJoZ1AybkVIZFhieVBRS09NaDBMV2R2MTFPNjBkQ1MxTWx2dzlt?=
 =?utf-8?B?VWtNdlpjbUFsQmpOb3BoMG5ldG9uT1pQWlBxbTk0ajlZTjlZM2Q2L2lpMmFY?=
 =?utf-8?B?NjlBM2tnZkNCSmk2UFZENTlPMC9TNDV5QlVWck9OeWhLYmRtRnVwKzlEM3Mr?=
 =?utf-8?B?c3VkNGFYdm9nNGhLWElGWXhucHVacU1iaFlDSjNiZGVUbmN4UmFhOVJscGsx?=
 =?utf-8?B?SEJhRjVkUFBFSzZGcDJSSll2TDlVN1F3S1lnRUkybC9JYXFVY24wcWdDdGha?=
 =?utf-8?B?WEN5aXpIWENCMFVGdDF3ejZ4T25NMjNad3dWLzJZNnRIaVNmYmphQXNnMlhJ?=
 =?utf-8?B?eC81eTBhaWxxRjkwbWZBRkNwalExRVlydDFVQm5KdThUMDZ6WFR4dmFTR2lZ?=
 =?utf-8?B?M0N1Q2JtYWN4WGxueWJ1UEhaMERYTkxxK2xtTHd0STM1cExQRzNKWmZxSndL?=
 =?utf-8?B?K2k0aWdFWnF1T0Uwc3hwTzZhamswSXpVSnJodjBtSFp0U3ZkSWgyNU1ScS9S?=
 =?utf-8?B?VUczcWM2TWJlUkJOTy90SllGN2lrSElzY0dyeG1YSEdQeVBTMDFWOC9GODh2?=
 =?utf-8?B?bDdIR1pPTHQwbTV5ZmhBM1RsWUcwZmM1WldYM3ZZb05tYnR0djl3RWlwa2sz?=
 =?utf-8?B?NFZSa2YyZmZjMFZPeElhVEVWT3RnWDV0SUxCU3N2UW9oblRXZ0QydHdWNDBY?=
 =?utf-8?B?WnkxRTl3SDNuMlFrWUVqa2tZY3dJdVRWZG9GK0FBVm8ySG5UYXJBVWgyY0lL?=
 =?utf-8?B?MERpS29LSzJ5QTkvdVpVNnIzRGlkYm1Ua2E5R3phcWtUSW1lZ1pVK2ZXRXJv?=
 =?utf-8?B?ZXZnVHFqNi9BWHQ3d2tWYTBPODd2OTQweDhVS1kwM0QxZldySGFJNjlGTDlN?=
 =?utf-8?B?eThrNUhDQlk4TzcyNDgvQWRDUEppUkg1enl1RjdyQ1RHQ2pZSEhFZDNEUWVQ?=
 =?utf-8?B?Z1JMa1VUMWUxRm1RU0VtOTJkS3JBVENtdkNES0Jmd3pTb3VpYytXdGJVRk9k?=
 =?utf-8?B?L3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aJEjLOsQfVqVeRRzsUad0VIppfQHiN5znIyxm512RvvsaPcogXISXz9EtzGzTJZi1PSKTOc+ijiqhuG7Q2HQyvw2XmZueoZ/IEc0flVljV1pRDtM/fCcbc3sBOJKdEkIo90K6H/vmOYBwON4T5m/KUkPOqpLDax1r5oCPNL/84Hc0WEwvc4P5hiXupOW/uaKqLjz5Ktq83fIwJuhA3Y+Dlzs9Y2dWVrdFtBAjLsMagH7XzFIhxCgVo7WXDbsYJZ6dD8y30SW0gTCgqdNnb+g2+BJkdr3usluj6OPinM34z03Sw8gtmNRrJ1j+Ix/kMulZtsT5HMSWeZykrIlGn58OetADc+YIEVtAkEwyTlj/stE6l66x6RLUbyRfPIfjIMeSzQDanlxZlUt0LquYZme2+iAaCl+j670Pm83PSq9fqTxqnxOoDX7JQ3y7lQrBWziTJK3rhUVNMFrGwBnY7zIFEPD9bb5tqLgXDpP9ZV1ZlaGRxjhggrk7ePKgkVg4dEDOVbe5IwR9acO/mPkZeyhp4dH7RjvpGwCU4UGj9SB2cO/FMMocGRQnV0EemecG0xbGSKdmGaK3734mIzKfiYPM4yLU5mYxJXUJtQONl2J4fPeDw7ZmaPLja8tR6XjZmR32QKLR6nX04H0aQj6dHqXDpQdCN0hX1hTj1UsiZXKuTX3KCGqvv1nzG9B9bIgmYVtKpK0dpqkKWsMNoarszRD9UQUH7S+Ip0WNsvNt1EsLH0rwfIu0kGHicX3Lh8owL1G+2aYLE5PlJjiaihd0qqcP7M2Xlk0Z/lbP0XnJ7voVFV9OkZwgbGYxt9ia6Gaj1+FK6h8b/LDwKMS/fiMyyp5cJ3GOnY3eBWU1IqP6+A13uI=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bc5d23f-e5bd-4f3f-53c1-08db63a8fa20
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 20:36:00.8800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RhdtynhYTNTPj3JeBR57foUWHqLI0MFlg6ZaEf7m5Nk26IITuTZmBrXR4gl/gFQCXOdiRsc2Kvy1ZR+sLHMhAqYV1fCsfuuBVDzexxmUtG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7278

On 01/06/2023 11:54 am, Andrew Cooper wrote:
> Instead, I recommend the following:
>
> 1) One patch moving the early-cpuid/msr read from tsx_init() into
> early_microcode_init(), adjusting the comment as it goes.  No point
> duplicating that logic, and we need it earlier on boot now.
> 2) This patch, adjusting early_microcode_init() only.  Have a printk()
> saying "microcode loading disabled by firmware" and avoid filling in
> ucode_ops.  Every other part of ucode handling understands "loading not
> available".

So, having fallen over "x86/ucode: Exit early from early_update_cache()
if loading not available" for other reasons, I've realised that this
isn't a completely sensible suggestion.

By not filling in ucode_ops, nothing ever calls collect_info(), meaning
that external components which peek at this_cpu(cpu_sig).rev get 0's
back in place of the actual microcode revision.  That's probably the
best we can do for genuinely no ucode facilities available.

But there's another case we ought to cope with.  Some hypervisors
deliberately report a microcode revision of ~0, and we should take to
mean "no microcode loading available" too.

For this MCU_CONTROL_DIS_MCU_LOAD case, we don't want to be trying to
load new microcode because that's a waste of time, but we absolutely
should query the current microcode revision.  It is frequently relevant
for security reasons.

So I think we want to fine-grain things a little, and separate the
concepts of "ucode info available" and "ucode loading available".  Per
the current mechanism, that would involve supporting a case where
ucode_ops.collect_cpu_info() is available but
ucode_ops.apply_microcode() is not.

~Andrew

P.S. also in our copious free time, we need to start supporting the
Intel min_rev field, which is more complicated than it sounds.

min_rev is vaguely defined as being relevant to block updates "after
you've evaluated CPUID and made decisions based on it", but here in Xen
we do also do livepatching and late loading to explicitly make use of
newly enumerated features.

So we need a way of xen-ucode saying "please really do load this,
because I as the admin think it will be fine in combination with the
livepatch I'm about to apply".

My best idea for this is to have a `--force` option to pass to Xen to
skip the revision checks, which will require either a new hypercall, or
perhaps borrowing a high bit from the size field in the current hypercall.

With a force option in place, the boot time ucode=allow-same can go
away.  It has become distinctly less useful now that we were forced do
this unilaterally on AMD CPUs, and separating "allow same because of HW
bugs" from "the Admin promised they knew what they were doing" would be
better for testing.

