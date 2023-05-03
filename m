Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 652C46F5A6B
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 16:52:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529278.823500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puDpa-0006gF-Jw; Wed, 03 May 2023 14:51:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529278.823500; Wed, 03 May 2023 14:51:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puDpa-0006eU-Gt; Wed, 03 May 2023 14:51:46 +0000
Received: by outflank-mailman (input) for mailman id 529278;
 Wed, 03 May 2023 14:51:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZlPw=AY=citrix.com=prvs=4803f4e7c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puDpY-0006eM-Qv
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 14:51:44 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 038539d4-e9c2-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 16:51:43 +0200 (CEST)
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 May 2023 10:51:32 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6911.namprd03.prod.outlook.com (2603:10b6:8:46::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.20; Wed, 3 May
 2023 14:51:30 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 14:51:30 +0000
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
X-Inumbo-ID: 038539d4-e9c2-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683125503;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/X/3AygOT6pqvdCJTuddwvw1xXUXT6MPGOspvFfgm/0=;
  b=R2egYkHScXUaATCsrp/V/iUMBKHVLmtFNhi/C9M4a6fzwka+piS96tkR
   YmOdwckbwpuGee+2nlyynGs3wt1cNsINLLyPb4xz8NIs9CMuhrCGXXpRc
   jYnh9f3iODGHKFNa+cZBMYEdOUa+5emYDZ3AaNMN6Ra3MSWhZN0WGsi4r
   I=;
X-IronPort-RemoteIP: 104.47.57.176
X-IronPort-MID: 107055755
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Wl1eBaAKzHakcBVW/xriw5YqxClBgxIJ4kV8jS/XYbTApD500mYDx
 mAfW2yDbviPZGDzf40nO4jg8U9XscfdyYNrQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G5A5QRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw98cpPTtX2
 sIjBTkkYSLElbKcn6qnVbw57igjBJGD0II3nFhFlGicIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+uxuvDa7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraXwnumBd1PSdVU8NZggUShxT0PSyEtTH2WnNW5iEK/W/12f
 hl8Fi0G6PJaGFaQZtvyRRqju1afowURHdFXFoUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRwtJWFRHTb8a2bxRuwJCwUIGkqdSICCwwf7LHeTJobixvOSpNvFfCzh9isQDXom
 WnV8m45mqkZitMN2+Oj51fbjjmwp5/PCAko+gHQWWHj5QR8DGK4W7GVBZHgxa4oBO6kopOp5
 RDoR+D2ADgyMKyw
IronPort-HdrOrdr: A9a23:yQ67tq13+mLSTsw58XkSnQqjBEQkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7gr5PUtLpTnuAsa9qB/nm6KdpLNhX4tKPzOW31dATrsSjrcKqgeIc0HDH6xmpM
 JdmsBFY+EYZmIK6foSjjPYLz4hquP3j5xBh43lvglQpdcBUdAQ0+97YDzrYnGfXGN9dOME/A
 L33Ls7m9KnE05nFviTNz0+cMXogcbEr57iaQ5uPW9a1OHf5QnYk4ITCnKjr20jbw8=
X-Talos-CUID: =?us-ascii?q?9a23=3ASE7unGiihWlDWsSIKalMP5EZLjJuf1yD8C3JDHG?=
 =?us-ascii?q?DJG9AR4/SWw+6p7t4jJ87?=
X-Talos-MUID: 9a23:Plz/oATG81mYEk8MRXTmhShQN5Z0oJiVEWYgrLkGucWFNQNZbmI=
X-IronPort-AV: E=Sophos;i="5.99,247,1677560400"; 
   d="scan'208";a="107055755"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CuWJIykQPjZ8IcNIvublUGnV4QS3JBJGPly/w8U+il/505S9OqR7UAniAbazny02AFVJlpiENX8/XOSNPulNVzaf7oSQEI+qjZ79QLnv3yi5hgzGDPPb3T9xoMAi5WpYclpS3paG/fud7nt55mF/X9+Y2Ei4ByDdxxPY2n3yutcZ8ljW3StYuJ1c7Ba8zn3M0d1vMHZUzvG/du5uQ/nUDYTFhNll5Htekio7lMk+6BLDmL+0rvI1X3L3FcwvmlI/rkDhyQ0TNzA0EACw8RnooaJloy5W/ybKeE99paDC5LEIDKBQqeuUeo2GQ3yKjo4nqtFIFA0hOOKrtrLgMK7kGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fK1HdlSFgUeNp73i8nRGTp0o0QDbjonIrKf9mR7N5pA=;
 b=BgePcSAcH393hYeIhFJ7I4kykyve6QhPn4Yn79hKkAv8ABHcsFPFrNn6VK0JacSj79j3220w5hIjOHBNxl+b3UnP3ftyl6akwBmBIVSMO0zQbNnthk97PAI03cCGmdK3QrVnF1e/TGWBZoLZdF77AKbUX6NzDQjG37ITfeMqQSHmhCZF246Y8VqiPpyYndAh/4J1eOq8R7TgohQ5ag+Gj98qVw5ljVHv2py/XVDBhUC9d+KnordIqqjOpWC1raj7ZWXtLw28IJE1lvTawewzF0SGW2hErVZcPvDfPDaEtvjw8gmvg0DOb4p292iUQtOMq+zg67Fy7/XbOhGQeevEaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fK1HdlSFgUeNp73i8nRGTp0o0QDbjonIrKf9mR7N5pA=;
 b=iw4UNMSbnLd15FjksGdVGppjkqfDb3HPXh9OC2AEB3hEpDpPwWMR9rKvI5pXX+dse7fX7tFeH12zCvWfoH5d+uXCCsaGLoKNNlEj10U91fWyWIImyjP6PdIaA3zkrgKytRCQyEyE6d7SmWR//Fj1d1XQps0vZA/+XD5qHcbBXk0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f790c02a-6a04-b126-ec74-7af9ce708b52@citrix.com>
Date: Wed, 3 May 2023 15:51:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 05/13] tools/xenstore: make some write limit functions
 static
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230330085011.9170-1-jgross@suse.com>
 <20230330085011.9170-6-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230330085011.9170-6-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0005.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM4PR03MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: f1a1ee10-0972-4fca-6117-08db4be5e155
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZG7jdHrcX9EPN8D4IvDEoV8MlBtnERv2gKHtPPQIgM73SnfsC73/76dQw0rI2B3xkLhpKcxbg9BxK1ionl6qjMOgpP8DZNux0m5//QF7n616HItA9WpvWhM50LX2raPnkpn3Xi0uIiASouUdB+eieY3zoNnRTDVwvx6p92tpafJM5U6EIj6pun6GcuINeyS4HvRVMmt05cpMleQ5p475GXFNkgyElTGp3FxRDj4BQULfpiVBnSqD3T7d/JpMQH4QKjUoIduX3vOigX8nclHs932t1NxRUzAfNZHs/xsz3ha4/WcefoufmAVQnp1S9uuXP5YvWYjflADGbxJguGAw7GTDPiKBL7czwF5eMP+Tcsm9D8RwACwQdH9uUSmZPDlWYqWme9h6O2XCs/VKkp1WEKmsplfh+vMKeBAy1Ku9Uvowf0pGKQyfCdodm4vvQ/akZONCbwhJxQVOymV9d0IMwEoEB9+i6QMoWacwoXxTHz+bPj36c7VDaT/hwf6ttTDM/0bgwtgpYa91ZYI4xFmp/8RavXTW6hexpUCn/XwnP9JLn8C3sDCc+mu8N/7rDpULCO8Ou1oT/TlfYmXXbU5+5dOcO59Yy2+tBvszUuw7a56LLA69j5hvmbRAyvNzEaSTqIqO5BAsg9hcWHln0gqLlQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(451199021)(5660300002)(2616005)(86362001)(31696002)(6506007)(107886003)(186003)(26005)(6512007)(82960400001)(53546011)(38100700002)(8676002)(8936002)(54906003)(6486002)(36756003)(41300700001)(4326008)(316002)(6666004)(478600001)(31686004)(66556008)(66946007)(66476007)(2906002)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0luREsrWlFPOHFTMnBLNzB3cS9GL3hDRk5QVkh3L04rQjJhWnN3eWl1d3gv?=
 =?utf-8?B?OVUxY25RbThlZnJUT2ozcXBnb25Qbk05NlZ5blpFR2VncmZnMHlSRGUyMXdT?=
 =?utf-8?B?eEhzbzd5bElSeXFkcFo2ZXZRS3RFQzA2UjVxdk5zTkI3STQ5c2dPR1dvUWhM?=
 =?utf-8?B?R1FkZmZJVVJvZE5QaVVrS0t4QlNZby9NZDFhY0FGbVlpZFRTQ2VRdklueVNO?=
 =?utf-8?B?R095bmEvWWpUeGYrN3hnWHVPOUN1dWcxbmRpYys3VHhPSVd3QXpobXQ4Vy9s?=
 =?utf-8?B?VitnVWFxY0QxZlc3ZGhqOUdxdTVRTlRsemoraDlVb1FaY0U1OW5Hd0VDbXJ3?=
 =?utf-8?B?Y0xRY2FSRmxiczRNMmdyUGZXS3NrOHpVSnJBNVF6WlZwalFiWmNDbnM2V1RM?=
 =?utf-8?B?QStocUxMUEhDaXBOK015WXY1QlRvcnpiSEZ3dUlwNEVSY1QyZDd4VVUwNCsz?=
 =?utf-8?B?M2RUL3FkVW5PWWZleUkxMGU5QUZpMW5IMldhYjE0YlNMdmJNNTV2bXg0dXBr?=
 =?utf-8?B?RlZmV0pYS3lSRlhRMktsN3JXWC9KMDBWY09UOUlXU0p2MFZpT01kN2NSV1Av?=
 =?utf-8?B?dHlhMXc1QmFqaENNQ3E2Z2hBeTYxQTJDVjJJTWZlWm0zSzhXUVNYeWZoVysz?=
 =?utf-8?B?UjJ5M1J1NTJyUFRJUS9rWjh2Q2J3WHZaV0N6SEJ5ZktnMHI3V2hBM0pUOUE4?=
 =?utf-8?B?OWFxamQyWkdyOFZrdkd3RkNDeW5CTGtKR2RuR2RGTUlqU2ZSQmFHckxxbWVS?=
 =?utf-8?B?cDdzeThOVXpJZDMrcWROeE4rSEZwQmd5QlpnMTZRbjladjNCTk8zMUFFcStE?=
 =?utf-8?B?b1dCUjRpRmRlWld1OXlBcHBNRjFaL2ZXQldia1BtanVrYVZFaDBSQ1ZiOEE1?=
 =?utf-8?B?TWtGVTY4ek9zNHhjeDYvWi9aTkVmRXRWbzdldnBXMlB2enBUWE9qUTVKM0p6?=
 =?utf-8?B?KzQxSzVySzg3eitEblpXWHBjVWtmMy83N3ZZWjJrMWkxRUZMT2NGZkZUcVVQ?=
 =?utf-8?B?elN1QUF5MXM3R013TTNHenFHRFZ5OTlmQ3ZIOVVWdnNUZm4zNWc3eE96Qmls?=
 =?utf-8?B?WFJTZERvSDBOQ1UwZldWaEl6RjVWaWFXcnpnc1djTUg5UHk3YnZyOFZMMmxW?=
 =?utf-8?B?NllRSnBhdGIxRGRzQjZGUSt6UldpU0p4Tk9zWEdtemFqNUdSUWszUDlSUTQ2?=
 =?utf-8?B?WnFYdDRZL1lGbGk1ZVpzWmFnS3ZTS1lTcnJPbE1OSUVCL1ovNEV6Yk5hbFNE?=
 =?utf-8?B?dUhWcEt2c1hlZkYvUzg2RmsvQi93RnRJUlJYV2N1NXdraW94eVNNM0R6Y2Ri?=
 =?utf-8?B?VHB3NmxkV3AwdVdzK2tHZWVZa0xCWkRQSFpxaFcvVmc2SXl4SU1icVUwdjI5?=
 =?utf-8?B?QXNaSkJYKzE2cG9rNDlCdTdGSWVOT01DaGpNK2NpNSs2Z3h1ODZJbERtdXlm?=
 =?utf-8?B?LzhpQVZBSGJpMjF0akpYTVBTY3FkbUFnWXpQVEZEaEo4QU5KczNvL0FjSVAv?=
 =?utf-8?B?N2pEYWkyZlFyaGlPaDVONkF4THZreHdwaTFnWnNNaU5iRWRVdTlvR2RleGxZ?=
 =?utf-8?B?VGxKZk1oSi94dXFCd0U3TFVPN1U5WnJ4STNkUGNwVW9CZEFlcjVlYzhhc0hE?=
 =?utf-8?B?WG81cHlaTXNwa1VSTnIzNitoc1dsSlVnNG50VkpybmZOSTg1bzJwSkNLcVNh?=
 =?utf-8?B?WTRiT0N2U2VVbzBZbDlmRkRDbC9QbzY3eXBXS0RrdnJnU1MzZmRmWFNTUmZo?=
 =?utf-8?B?bmZkeTNqNVllQklUNFlNY2VDOWFpNHhjb2JsVVNVZENmTmlQQU5RTEhTNU9h?=
 =?utf-8?B?YlppV2dDNFAzNHhlRFVaYzVvVXVrYWd0czMvTHllaWh0Um5sc0ZiMlNrL0ZU?=
 =?utf-8?B?cGxMR3EyeFQ4Z0RwVSsxWEJFanI3eTI2VHhoQzVaczEzY2VkMUtsTEhIT2RF?=
 =?utf-8?B?NFB0QlZYMVg4U0Y0bTFvZVJIZEoyTjdZbGZFR1oyN0ZTYjRmeVFoZURSV09X?=
 =?utf-8?B?blNBc1VwcXA3bEg2Mk1nNlJlSlZKenczb1g5RHFnS2VHcVAzSmtZaVJqTDhV?=
 =?utf-8?B?eTFUbitaZktERytpNk1aRnRqZ3JvNjNUbUovN2NsUHBXNzJ2em91dEVhQklo?=
 =?utf-8?B?WEc5MHlqMmZ3Yjc3NWZrN3RyU3N2anVEbmxxcGxRdjVQZklyYnNJZDhCV2Qx?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2TO8NoFPeYkmIJmzyyjrDALsH2pbEteKu5AZfWJwqzDhijoG70mLIphbeswOgik/BKrwYC5pnYw/cgJbILCKGU9ZOgYitNAgYyFOhetai5HUa1+gYiG2l78BqJevNSud1anMHYFYsD6mt6CSzICZQGodAYmPTkr6Xne9GWqn8FQ0nvOgQhrxX9Ps//Xbfuk+EnrDc5uHKXtyoqyL6DJDjQUIAIeuzakuvIOtqGtwBVO1YXbHlnSVyj4cvFUkm0Z4E8bEp3VU8YcA7T6/4XuTgow3fl4Y4DzwYMXgmZcRE2KH/jIpiJ16OhgEFCTe9i081HFP4i8PS0teLwSX7NONKqV73eHcgBhAhWAK/7MYqUDJEnYJ1ISvN6gFVitwnpwtArAWUC9yl86UcXEN1uudM73KIKAnBNCQAW34MEUBA8jekTTSw/FEVZUm6NWF9AyeqKZefNADuXMl1guRljhN9fnO8WjiqEvHcIhwOMGUxT5ZiQ3X/3EFNEIvNI6AJFb7xhtIWoE+TDUJt6pl4Y7jjtIF97+EW8QatQ74pwspxGPu0uiYsoCF1EVH40f1C2jlzOZ5GAyik4CG1PlK2JU8vPnBR/S+/TwAEAQVuU7lUN+Xnpc6hjTSnDTZHjNk/qNlEeAA2XVJiRJCT2OPWHZpDFjlnJMZBC9sWx3GIVk0pT7pILTG/lSfWK7ULLVlBZK2tBuQ3Eo92fxCkgaHXOzuuaATrcz0AKAAzlAzANFgu0TKLsDMEr7FCDL2ZpBqNE3TSXeOwWECb2pACiuyiDRRcYh5MeAZn51KSD96bcsBMOJ55ldRcENx4ahVPtZyVk0A
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a1ee10-0972-4fca-6117-08db4be5e155
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 14:51:30.6006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JH2o1c7mmSgtRswSWXKK0fxFmUU2JUV7Ssf6s18Ubz5o3TbwqMYVf72H+AlMR4Dz+HxTYNG4ceLFs9hx/NukDjqa/KACg0lMN2rIP3BhKds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6911

On 30/03/2023 9:50 am, Juergen Gross wrote:
> +static void wrl_xfer_credit(wrl_creditt *debit,  wrl_creditt debit_floor,
> +			    wrl_creditt *credit, wrl_creditt credit_ceil)
> +	/*
> +	 * Transfers zero or more credit from "debit" to "credit".
> +	 * Transfers as much as possible while maintaining
> +	 * debit >= debit_floor and credit <= credit_ceil.
> +	 * (If that's violated already, does nothing.)
> +	 *
> +	 * Sufficient conditions to avoid overflow, either of:
> +	 *  |every argument| <= 0x3fffffff
> +	 *  |every argument| <= 1E9
> +	 *  |every argument| <= WRL_CREDIT_MAX
> +	 * (And this condition is preserved.)
> +	 */
> +{
> +	wrl_creditt xfer = MIN( *debit      - debit_floor,
> +			        credit_ceil - *credit      );

MIN() evaluates its parameters multiple times.  I believe the only legal
way for the compiler to emit this code is to interleave double reads.

As with pretty much any C code, you want to read the pointers into
locals first, then operate on them, then write them out at the end.

~Andrew

