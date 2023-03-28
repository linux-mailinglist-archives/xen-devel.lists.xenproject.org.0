Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA476CC093
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 15:23:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515815.799033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9I0-0000eY-Df; Tue, 28 Mar 2023 13:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515815.799033; Tue, 28 Mar 2023 13:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9I0-0000cH-9A; Tue, 28 Mar 2023 13:23:04 +0000
Received: by outflank-mailman (input) for mailman id 515815;
 Tue, 28 Mar 2023 13:23:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0K3v=7U=citrix.com=prvs=4442f050c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ph9Hy-0000cB-Ny
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 13:23:02 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a87f485b-cd6b-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 15:23:00 +0200 (CEST)
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Mar 2023 09:22:57 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB6637.namprd03.prod.outlook.com (2603:10b6:510:b1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 13:22:54 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Tue, 28 Mar 2023
 13:22:54 +0000
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
X-Inumbo-ID: a87f485b-cd6b-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680009781;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=7JEMnRv8lLCcEes8n2e9KS7VjZpNSRUCLUTRfjbxccE=;
  b=Amp7DHrBJazJC1hKQDyapiFdOcDEMkUEmRMeC+PBNQfpHXIaMpTF8L9J
   7vSsF2GET1CWPjaPpsAYyN6qOzHAkx009Y95gGVODzWjFBwRrknnuurNP
   +BulONCifLmQCC9sDCOgmDfcTgJZ4I++1xtPx34huKE63OL0fP2Wdmdda
   0=;
X-IronPort-RemoteIP: 104.47.56.172
X-IronPort-MID: 103368707
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1r42YaBotccTMxVW//Tiw5YqxClBgxIJ4kV8jS/XYbTApDMr1DUOx
 jEZXTuBP/bfNGX8fNsnaY7lo0lT65OAmIVmQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GhC7gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwvcVUGl5gy
 qQhcCEWYiGso8+8mqqSRbw57igjBJGD0II3nFhFlGicJtF/BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI++xuvDK7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqin32L+QxXyTtIQ6CK+708V7vEyp3WkaUgY0WAC9nb6UhRvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4FuQg7QiXx6n84gCHB3MFRDpMdNwnssAtQTUgk
 FSOmrvBFTFp9bGYV3+Z3rOVti+pfzgYK3cYYi0JRhdD5MPsyKkxhxTDVMd+E4a6i9T0HXf7x
 DXihDc6r6Uei4gMzarTwLzcqzelp5yMRQls4AzSBzuh9lkgO9TjYJG041/G6/oGNJyeUlSKo
 HkDnY6Z8fwKCpaO0ieKRY3hAY2U2hpMCxWE6XYHInXr32jFF6KLFWyI3AxDGQ==
IronPort-HdrOrdr: A9a23:GuO4wKzKqJliJO31kX2mKrPw671zdoMgy1knxilNoRw8SL3/qy
 nOppQmPHrP4wr5N0tApTntAtjkfZq+z+8N3WByB8bbYOCOggLBQ+9fBOPZskbd8kbFh4pgPM
 lbAs9DIey1IGJWyeDdy2CDf+rIxuPszImYwd3z9TNGayZES49d1C9FKiC9VndbeWB9dPkEPa
 vZ6cpDqyChangMB/7XOlAOQ/LfodnGj7LKCCR2ZSIa1A==
X-IronPort-AV: E=Sophos;i="5.98,297,1673931600"; 
   d="scan'208";a="103368707"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fvCi9MucQOEY3Xy+rZUtXmwZ3/gQu2Pu4pdlaS7m3UrFs385x0ajck2Zj1nDtHgbBGG3vbi4XOGhAYwlKEu0kHCi8am3tM2Ij+d/CROz1qdtZf72F1/MDM9pXySK/uX+QjAINzMFff1WR/XqYj7EDzUk4XlMgReP7LcMj6XGkm/QxS/ey0TY1YOenFIvzphjHE8cduwAo3u0C7KVjy/PVTPNDUicHGziAOxbNFar4naJW7GAUWZhHXbjFjgna7GDlUQ6QpyBP5VsdtLm4BsB7wbRMSpHU+L8MO9Mi5bkSHMKrHbii5UWL0rZ5l+aWX/B67iO8PU8u/63a8BXnEa7NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvwZQFNm3krwZa3ZBV3aRjMuKVLtmA27XLmbnyNHIo8=;
 b=g+9J1GfSZP4904bWkS/AprJzZJMWzIjya5Pu3pT2Y9l9i39nm8DQ1Z8+GmaT02rjz/AOwojR9bKMHmDmQxmxQd5eG6lni3Jsh0jc+Zm0N0Acemv9UuOO2KDurvmIWJdYWR0KbKCxFRkIw1YQJujjuolWkprhl4sJdkh73mmuAwd5rsTG8TJFoW3Fct73jqu8kNv2wRw4AydV1DH5JHkzH4w5epNXZGxzAJGHfSNnX9Vo+3sGbkNR79EMOpIuXEMPfLSvo5Nz+C6YSOZRAMVxFALHB7LXL8s40M/PUxheHkoY1Ptc83u8fKeO0lZ/PnKFYwkIYZGtJWtj3hX3fO4X8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvwZQFNm3krwZa3ZBV3aRjMuKVLtmA27XLmbnyNHIo8=;
 b=CD22hmquJN2sTdXaxgVdMs57Co8hGV87z849WNV9TRC6ALXDo5VpD/6mEuraMuMdXcLw3m/7VaNZkh2aRTB0Tsux1HPN7/AMEys+Wg+wQaabcok9mgTlP00hJ4aGrczspLMmZqhEJbzqpXZEJvOaAoB2n6h7terkEuKdc/CIUtU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 28 Mar 2023 15:22:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/3] x86/hvm: Allow writes to registers on the same
 page as MSI-X table
Message-ID: <ZCLqKGURR1QJgROK@Air-de-Roger>
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <20230325024924.882883-2-marmarek@invisiblethingslab.com>
 <ZCLNQGXvUBxZbIGS@Air-de-Roger>
 <ZCLX1qD/FmbF5ulu@mail-itl>
 <540906f7-4543-9d01-2b2b-a3bd70eda74b@suse.com>
 <ZCLjGhbzGD2jykT9@mail-itl>
 <9eb7b538-4074-4b15-4ea2-67d9cc0bf85d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9eb7b538-4074-4b15-4ea2-67d9cc0bf85d@suse.com>
X-ClientProxiedBy: LO2P265CA0061.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::25) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB6637:EE_
X-MS-Office365-Filtering-Correlation-Id: 839d0d04-30c5-49eb-0a0d-08db2f8f89d1
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6plcK2X2rSwg2RJONhEixk7PvkmLASt1QsTLbLmnKFwzKVp5WZQOd9BDckr1a8Jf812GN9ciQ/hDjSdDELxID0vxHo3DzU7VdmnvWoMq7X3KVByXxJkY40iJWyht+KcODZs7ztRmbruyRna1t5E2240KuqBZL1OUJURUGCaRNUJEENuE7WHnkM9++3gm0nO+W9jMd0+bL3KKSE8RoEIdAkS6cNcuuWXFWRSbDFfQVYsUgS33tS7Gl+riHY0Czvn715OQDOV9ZT3O1DHuEsLutQ5/z8TovA6ZzFN+U8ZNStjA4k99ER0Bk9+iGwhejinyTJVLBcp3e7SGkvUUYvLnY9Fzuw7/KE7yYLZbsbznmRzT1GtLxKZSAtSi2JxTwoBIN4DKBzurhjEORJqv3vcDcvUZtBlK1lGNdG9y3DtuhtxzFjOjIX6/Yh0flEbqX0bqmN6kAi3oaB6n1ZYjBqJAqlFyBQNyD8+BlQ+N/xQq0pueIV1Ea1la4UYXkzihvixaI4VkdJE63MfvXikeAvnP+6JFvoC56uHiAX5D1M5Ip8MkWrSJxSn6fZpCdPmanCZT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(39860400002)(396003)(136003)(376002)(366004)(346002)(451199021)(6666004)(26005)(6506007)(9686003)(6512007)(53546011)(6486002)(6916009)(478600001)(316002)(54906003)(186003)(66574015)(83380400001)(66556008)(66476007)(66946007)(8676002)(41300700001)(8936002)(4326008)(5660300002)(2906002)(82960400001)(38100700002)(86362001)(33716001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2RIeUJiTmp2WDlUZWkzWm9ISUNEZzZ2WG5FNmErSldzRDU5WHlqQmZRNFZw?=
 =?utf-8?B?WEY4N0VkYS9odUs5Y2h0V2NTK290by9RNVhDTmxoeXZybzZlWjFIVXlNbUZW?=
 =?utf-8?B?RDVyQndodFgwUVgwVmVvVUtjeGlESHVVU3dHczRuekJQZFpPdEpQZlBtK3RM?=
 =?utf-8?B?Umg5N0ZNYktRUFJ4bEdHanZCTk14ZUdzNVVLSjM0bmx1eHR6M0tqUFJkUzVq?=
 =?utf-8?B?RS9kTk9NMnJlNDB0elJUdzg1OVFWSU9mVEp3U0FDWm1TeW4rRG5iMFlwTnBP?=
 =?utf-8?B?S05QL0h3TUZBaWR4TnRnTGFOUmFGd0hQc1l3YWh3b3NKY3FERXVlT0x5WmtM?=
 =?utf-8?B?M2QrcFJNN2hEeHM4azJlY3ZvZHIxWW1tYjFtUXFVWG1zT1ZNUWwzUEhiT3Ay?=
 =?utf-8?B?WWZ0eUxUMnNPcnk2Y0VRc0R2RTVXNDh3a0EvUC9hQlVDMEdGb054QVpnQXdM?=
 =?utf-8?B?UnZXbnU0a28wejJad3hhYkcvL1dOTlVpVThiR2UxajZZWWcrOWFtK0ZvTHFG?=
 =?utf-8?B?dTdyUHNQOU5Dc0lweUxXSDlQTElneURxUVdHR1RKWHFsOEVxaVFYUGh1RjJt?=
 =?utf-8?B?QWZFdDA5aHFkRjQ3N0FIMUpNZ01RdHZjODhlclNhZ2hnbmZtR3RicmNkanJj?=
 =?utf-8?B?UlZtOFllR3ZkY2lOdVdoeThUNkhqNGpIeHg0UmpROCtINnhkb08zU2U3em9V?=
 =?utf-8?B?RjZuL1hFVEZYdTNhQ1A2eGxsNHllUTM5cE9ObStuSk1hZnI4aWFsVWFiQ2hN?=
 =?utf-8?B?SmNxOVVRNkloOG1ZLzBiOU11NllLc2NLYXZydzA2RDJyUUs0UE5Od20yN2xJ?=
 =?utf-8?B?SzNpdno2QVduZjZ1WDhaeTRtdEJrb0dRQXVwNk1XVlVuc3Bwd3lMN0hMYlVu?=
 =?utf-8?B?bk9QaUxwd0tLQzRYcHVXakVqeWY5Y0k4SmN6OVQ5dXpic0tWZGVsaW9KbFA1?=
 =?utf-8?B?K2ovcTZsWU1DbHVobFY0OWNVV3gvQVJrRmVjZmhORG5LNHdKejUvYVJCWHdM?=
 =?utf-8?B?U2xqUGVlaWk0TTJwOGwvbFZIRVc2ekRleDArRlRDZ1lGWVVkVjlnZ0t6M2lu?=
 =?utf-8?B?V1BlZDNIaS9IcEJMTGJnVG0yeTFyNkphRmo4RDgxdllrRVM1bmRDa1hEdHh2?=
 =?utf-8?B?SlgyVGlqU1NKL3N4aE16a3ZPVzFKcFk4T3RZLzFmYWdDU2hwb216OTVzdTJs?=
 =?utf-8?B?OUJ2VkZOTGlyajZmR3lKMnlMYWg4WmdBZGd1RzA1YkFobWZHK1pqcHdhK0R4?=
 =?utf-8?B?TDZnK2dzTDRrTHExWXJ4WFJ4MmhMbXMzTFBZY1FDbWNFejJwYi9JRldFR0tS?=
 =?utf-8?B?cjhxcGFNTzRRUHdpRWtXNWt3WlEvR211WkpqQStZUXRFb2JhbVNma2FkeTVG?=
 =?utf-8?B?bXhnN1VJelJMTmJPWnNKS1EwS3Exbmc2YmtOYlljY2tZelZ6aXIzRHVXL251?=
 =?utf-8?B?UE1Kc01vcWpYVVVDbkFQblNYWWJMcHNKaE5xdUFUS2E2QWcyT2R2cTVPVkNT?=
 =?utf-8?B?ZGc3TU5aRnp2VS81UWpZaWgvejVhYWtjRC8zU1p2bytpRXRjczJOVzRPVEY4?=
 =?utf-8?B?UTMzeXIvRUxKd0htQi9CQnFBVlpsdk5UcTFBaS9SVkdSTVd4eXJ0OXFySzMy?=
 =?utf-8?B?d3hBZzJPN3VnM24rMmZrMkVuYVFmTGFNbXQvNFJmLzdtRkg4ODNGWm1ZMzNU?=
 =?utf-8?B?bDdBSlhyQnhTVzNUTmh3azZpSUpLTGF0aEZQMU9lK0VjOERxL2ZOdENnb1Nu?=
 =?utf-8?B?M1FoUEY2WkFBY3Y4UjlIcEFHN0tqZGZFcWFYUUVOWTFQSjR0K2VjQUJiVEpP?=
 =?utf-8?B?dEtFMTNQay9RUlFjNHY5VmdMSWk4bHpydkF1N1dSRWIvbktNczBQWXVDc1lG?=
 =?utf-8?B?UWhMbGhIRSthNDRGTjYvNTVzbFJ0Tldha0dVVUw1b0IzSFd5aTBGKzU1N2tz?=
 =?utf-8?B?VlM0VGhrK3NKWkZxWE82L3NPZUhOK1RvTHYxYXUwVU1LclZ3UWRqaU9yUzBE?=
 =?utf-8?B?WmVqNzlDOEt0RHhicUJGNWVDTlZSVXVjV2dzeVpvVW9vTGhmV04zbVh5eURl?=
 =?utf-8?B?cmRLL3AvSFpGV3UxZmFsZHNsbmpPblFsOUphbVYvc285cU1BcE8wc0RYMTh3?=
 =?utf-8?Q?th1skDRZgS2IQwRM35oxhvuTo?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	B237Q7kU4K0GD9by54cTnEb69iHV8NELGwYUqI8ntH9J0v0PYrccS5AiS2Z0Dc6xNQWUHdG5WfJruKB5yWMidE3iLQRUCW7DE4mFql/UI1R7F/qrUMxLXtxXxdEKZxPISUShJJugYfTKWC6Yzxo0QckUH6x7pxhXu2eQMcj6J8cFpCZ6Ag4p6Nx+Id80dxSNJVIHHuYM6VAFUwrLKzoyU5QzwVcyVvJyCVmTsKCLIs9Bfyw3k16Q5nIMLlP00PL9NgVzD6p1OfzO9HzxNJyVWYbcmBhLI3Xq+cG1QCwFG0It1s6fbGzB5VfP0jmUU9ewRZxCkIkmlVYELjcsy4s7mg5wP2iTOVa9e5TAdVMsMTz87R/EgONue7rVUxxv/4wK07UZb9tfg9fvZZ3SJ8aujRK/sE5748+Bz5VQpMmrZ/eaKVuRpEaNBT/pK/IucNm5M4OcX7fIr0Uv58UoexXrMYUFeyxe0vEcDqf44+PnONaX24isIJAzQUvCbttEroGZwl7BwZ0loeZbSp9BCKOmYN+/BtvV1aX6MMFS+DCIloCL9VcXtI9rndP11q6isOlvD0aeOr6M7rr9KVZWqy3EMmWtEjag4igFvH3Vg4Vl01tzZ+OwsEhh22IPOI5Y4udxoyxa90cjwJlD9NAA4sCs7+qbU9k1KLx1k1S13NnJtqo0owS2OWeUPMEa46BlP8eVeBBzMjv6y3/RRX5BpsAvn18Mkv0sFjgqe+PvY5VD24Mblb2eNLa6ZQbGN3i9U/h7WEbnWn+lfxZqR+SwsGVnuqbWxschLNUA15DiLWaTijO3VF/Rq7s6gbiTgYh+k/mlKLWauoupUgfRD/jB3A6C2vSkX20HvXdKU+WZSlgrqs0Kxdv4C785snyA8UMTYWKi50KuH9ipzfbQxORlD/epJeknDPN4+e0KryDaHPACaVs=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 839d0d04-30c5-49eb-0a0d-08db2f8f89d1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 13:22:54.3782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYilWNj1SMM95iIZe5GhMKoxXt58yTMiXWA09aMErzpkr2K3X9JdcXkQR44J8X0PeRZT6P3ncINGoukl92mskQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6637

On Tue, Mar 28, 2023 at 03:03:17PM +0200, Jan Beulich wrote:
> On 28.03.2023 14:52, Marek Marczykowski-Górecki wrote:
> > On Tue, Mar 28, 2023 at 02:34:23PM +0200, Jan Beulich wrote:
> >> On 28.03.2023 14:05, Marek Marczykowski-Górecki wrote:
> >>> On Tue, Mar 28, 2023 at 01:28:44PM +0200, Roger Pau Monné wrote:
> >>>> On Sat, Mar 25, 2023 at 03:49:23AM +0100, Marek Marczykowski-Górecki wrote:
> >>>>> +static bool cf_check msixtbl_page_accept(
> >>>>> +        const struct hvm_io_handler *handler, const ioreq_t *r)
> >>>>> +{
> >>>>> +    ASSERT(r->type == IOREQ_TYPE_COPY);
> >>>>> +
> >>>>> +    return msixtbl_page_handler_get_hwaddr(
> >>>>> +            current->domain, r->addr, r->dir == IOREQ_WRITE);
> >>>>
> >>>> I think you want to accept it also if it's a write to the PBA, and
> >>>> just drop it.  You should always pass write=false and then drop it in
> >>>> msixtbl_page_write() if it falls in the PBA region (but still return
> >>>> X86EMUL_OKAY).
> >>>
> >>> I don't want to interfere with msixtbl_mmio_page_ops, this handler is
> >>> only about accesses not hitting actual MSI-X structures.
> >>
> >> In his functionally similar vPCI change I did ask Roger to handle the
> >> "extra" space right from the same handlers. Maybe that's going to be
> >> best here, too.
> > 
> > I have considered this option, but msixtbl_range() is already quite
> > complex, adding yet another case there won't make it easier to follow.
> 
> Do you care about the case of msixtbl_addr_to_desc() returning NULL at
> all for the purpose you have? Like in Roger's patch I'd assume
> msixtbl_find_entry() needs extending what ranges it accepts; if need
> be another parameter may be added to cover cases where the extended
> coverage isn't wanted.
> 
> > I mean, technically I can probably merge those two handlers together,
> > but I don't think it will result in nicer code. Especially since the
> > general direction is to abandon split of MSI-X table access handling
> > between Xen and QEMU and go with just QEMU doing it, hopefully at some
> > point not needing msixtbl_mmio_ops anymore (but still needing the one
> > for adjacent accesses).
> 
> Hmm, at this point I'm not convinced of this plan. Instead I was hoping
> that once vPCI properly supports PVH DomU-s, we may also be able to make
> use of it for HVM, delegating less to qemu rather than more.

Right, but vPCI doesn't use msixtbl_mmio_ops at all.

I have to admit I don't like the split model we currently use for MSIX
handling with QEMU.  I find it difficult to understand, and prone to
errors.  IMO it would be much better if all the handling was either
done in QEMU (except for the quirk we need here to handle adjacent
accesses) or Xen by using vPCI.

Hence I proposed to Marek that given writes to MSIX entries need to be
propagated to QEMU in order for it to also track the mask bit, we
could also move the handling of the mask bit to QEMU entirely,
dropping the usage of msixtbl_mmio_ops.

At some point I expect we should be able to choose between doing the
handling in QEMU or vPCI in Xen.

Thanks, Roger.

