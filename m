Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D6773320B
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 15:20:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550221.859187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9Mv-00081Q-Vm; Fri, 16 Jun 2023 13:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550221.859187; Fri, 16 Jun 2023 13:20:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9Mv-0007xz-Rm; Fri, 16 Jun 2023 13:20:01 +0000
Received: by outflank-mailman (input) for mailman id 550221;
 Fri, 16 Jun 2023 13:20:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uwsx=CE=citrix.com=prvs=524b7acb3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qA9Ez-0001xG-R1
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 13:11:49 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59769fc9-0c47-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 15:11:48 +0200 (CEST)
Received: from mail-sn1nam02lp2049.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2023 09:11:47 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB6547.namprd03.prod.outlook.com (2603:10b6:806:1c6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 13:11:43 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47%2]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 13:11:43 +0000
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
X-Inumbo-ID: 59769fc9-0c47-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686921108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=YPA9b+1Jq+QT5jKnKko+p2QVQM1PKRxB/6N+2JAeUmY=;
  b=FLjv9VAj4aPPo+qUklI+fEzR2VqXL1H1fVYiHBVSqi3pcbQQEt5NETLV
   86zM8BODn6IkqUBsT0mGyyrlZm/wXvGYIoMF5ghgsjiVxIhkzm6u3B3e3
   GZaZyaR4Dm12rdEOF+TP2YGm/+RS85Q8BV27IVcNzA1ISI5sbF6U1hMZV
   I=;
X-IronPort-RemoteIP: 104.47.57.49
X-IronPort-MID: 112390561
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8UEaEKgqQunNzVDoUjnY5fBnX161RREKZh0ujC45NGQN5FlHY01je
 htvXjvUbqmJYWOnLt5xaI+xoU4D7JWGmNEyTQY9/yk1RX4b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4gaAzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQDLgAIYAzAltuMnu2AQ7dcoMl+EMTSadZ3VnFIlVk1DN4AaLWbGeDxw4Yd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEuluS8WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHqhA9NKSePhnhJsqFeXwUA5LDkbbl/hiKi3mlOsHIlcN
 0NBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQ5sOcmSDps0
 UWG9/vrCiZoq6a9Um+G+/GfqjbaBMQOBWoLZCtBVg1c5dDm+Ns3lkiXEoclF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9bABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:Y19reKDwEqYHgLvlHeg4sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U4ssHFJo7C90dq7MAjhHP9OkMAs1NiZLW3bUQeTQr2KqLGSugEIeBeOvtK1t5
 0QFJSWYeeYZTQUsS+52njfLz9K+qjlzEncv5a6854bd3AJV0gP1WZEIzfeNnczaBhNBJI/Gp
 bZzNFAvSCcdXMeadn+LmUZXsDYzue73q7OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFqQrk/a+u2svLhyM0llWjo6i+quGRhOerN/b8y/T97Q+cyjpAUb4RFIFqegpF491Hpmxa0u
 Uk6C1QRfibo0mhA11d5yGdkDUImQxel0PK2BuWh2Durtf+Qy9/A81dhZhBeh+c8EY4uspguZ
 g7q15xmqAnfy8oph6NkuTgRlVvjA65sHAimekcgzhWVpYfcqZYqcga8FlOGJkNESrm4MR/ed
 Meev309bJTaxeXfnrZtm5gzJilWWkyBA6PRgwHttaO2zZbkXhlxw8TxdAZnH0H6JUhIqM0kN
 jsI+BtjvVDX8UWZaVyCKMIRta2EHXERVbWPGebMT3cZdI60rL22u7KCZkOlZCXkcYzveQPcb
 z6IS1liVI=
X-Talos-CUID: 9a23:Oa0R2W9Ni2KLks29O8mVv1USKsUrbj7M9U2OfHSxV1ZPReCpRGbFrQ==
X-Talos-MUID: 9a23:xyivXAahxSFw3eBTvTvrqBtGEMpT5/6HWU4djIdB4MqYOnkl
X-IronPort-AV: E=Sophos;i="6.00,247,1681185600"; 
   d="scan'208";a="112390561"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zl1XMyXD73kJrpy3z5KNFPc+gMODbkEFnOKSszHdoMz58LCs/X+Y2c9yDeSgSZ7rOMqNt1D3iaDZCgJMZoep0/ZxQjZg586UrALr42GDfTWK8VHfpRte410cVUCzI6eQtjy0jJUZrJZKipU5S3LpkWkJcRCO88PrafFT1XdkA5WZuxSQhs7pP2yKRKyCUQWG5X+6WeH84zZpCzDEyX2lSLt53ITdeJCuFFBFoQxXCfKOXHFPAJsMW/hZiYn07RcUXA8bJftvrYc+NfAqUuayubSc5EHXK65VrL8eX6gBTWyFJRZwJuvPW//SxWWFlYG7ZuKff/8nCUkKdmtQD4IhuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQoex3KxQDT4pxXIKFv2y1HP714iKzUK1fS15AmZAi4=;
 b=J/ARkOuUqlmlDF54S9My45+oa7SAGCvRH0aroF05qYGhDoivZSkGFVSry7BK1H4GFodM0WyzWeix86Q0s0lAGsPWtJ4Gz6dy4jrHunaFfCdvf1cF5+AHZxSqE04e9pU/TEhaKQuERv3EMWSoLDnuqMpnMMtoIPbnaUX9ATJcZ2cCZ1aXlcfu5IxDXZjX0v5T33YWKPIkJxffVXGKE2oVWdD0dtPhM0qzqEe9SmLAC+YzsvMK922xILm9kBJnMvipevvOneGXtszWf3irKhAdfvgZB9lI4FeEjKLqJNu3VtHBYnlO+Y3TDnHcAq5Yqlh9NLN89B3fCXlaPomJKFqnvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQoex3KxQDT4pxXIKFv2y1HP714iKzUK1fS15AmZAi4=;
 b=aFEIF86WfsFIoDZeMEvxj9GkFiL5CjEl3EiG1MqoP8dDTPq4En+TjbR1pysjI/CuELFMW1uRLXriwAK/McCXfyTio7HtS5vncf06gRQZtmzhx2Go+8VsbD4TJ5gpt+sby3GWMCBUsJIs25G1pcfnHjUM/dzMcREAqz31Yn85WGM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 08/13] libs/guest: introduce support for setting guest MSRs
Date: Fri, 16 Jun 2023 15:10:14 +0200
Message-Id: <20230616131019.11476-9-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230616131019.11476-1-roger.pau@citrix.com>
References: <20230616131019.11476-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 7505b2f8-e908-4db3-37e4-08db6e6b3b06
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jR9doi4taS/D/BxUzcl3RjApWkX+UGoXdlpQeCO7pYbDCK6W6aiaOWP+dDjoBFhVRVIpQEFc0GkX6B6mJ0H91sPzDFhEWmsOWO8zoIW5vwnsMs+bgbc8DkPOq/yYStceyoMa7fOkO5E90+OqNjkHAfCxdYAYdse2hRlPnHy/AQMC28CPml6pVC9ZrTmKJx4C9gmdP+LAfOGVgKDIP5S/+gQiU4ippUXPLYsoqhaENndIGgVo/s7EWGe78ztRSbaRPzuwXk0tFebJ06dNhoK7d9Q11TL4CixFzEeMEOk+0kA0n1/mvB7dynpCYRWLtyCLC5gr27MK+OHojBNuo0YdcW41ydXbKGLX3MjIr5b8Q1AIxA+gQrKSuEpVblWwoN5ScJWMUAVU9ZbaM5PEp/bJ93Jwg9IvDue/d/nO/9kV/FP2N9jpaUaIxaQCZbeQJK/+9/34Vjr5HyF8SMWOqVb/8aPjKB6okYHBU2Zp0HRkNC4lF/BCEDgCDIQo9cGogkBdjhtoghV/Hvi933A2ZFSe5ok5J1wt7x8KKA8y9ClrDEUfOqVaReTBpsHTJ1wiwdgJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(86362001)(38100700002)(8676002)(5660300002)(82960400001)(316002)(8936002)(41300700001)(66946007)(66556008)(66476007)(6916009)(4326008)(54906003)(83380400001)(2616005)(186003)(36756003)(478600001)(1076003)(6512007)(6506007)(26005)(2906002)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlhmeW5GWkpJQzljZmg2NWhmTWFrV0YwVFZCVXBvYjFqRnR6UUs3ODZ1djAw?=
 =?utf-8?B?YTVoeVhKVUVTMHhLcFNWYXZkd3p3bEZGOGlaMitUVFlQcVVlR3NIcnk1VDhm?=
 =?utf-8?B?ejBhOXVDS1FLb3FvM3YybUhUcDR1WkpjRjl3eE1BTDAyUGNBRHowTm5nRUVL?=
 =?utf-8?B?b1ZMTlhKU1dCcVpKSjdBdXVIQnhHNHhRRS9nU0FtT3RoSkl5cHQ0TzV4YUlG?=
 =?utf-8?B?ZUZXcjhScFEzaDdHREQ2MHp5NHp3VWlFM0ZiOEswVTFWL05KOUUxekpXU2dW?=
 =?utf-8?B?VWtld0tUaUk4M0FlZ2paU3p1YkROTmtVNFJDQVlVU09vbDVMcy9mSEJDaVpQ?=
 =?utf-8?B?T0Z3S0NsTHB2MXBCbWRnWlpLZVJSYjdZTXBRMitSaFB3U3JuWWVLT1Fkd0Uz?=
 =?utf-8?B?V05KZnlCUE5QQ3FsZ3BhbkUwcmxJbTR2MklBQkdhaXREd0E4QmVzalFTUkt0?=
 =?utf-8?B?RlVTenlSTU4rQmFMenhCOEdUc1BSamtIU2VHZnYxcHhIZWwxemhIN0lQV3BX?=
 =?utf-8?B?ckpNZ3l5VEd4Tml6U3VRbjVDYkJpN1IxN3BXM0k1czhUMERVN05UbE90Vmgv?=
 =?utf-8?B?NzhneDE1Qnp6ZHZycE5UV3VEdkY5YU93YjhSTjFyOUFWRE5rL3dRREVmOE5J?=
 =?utf-8?B?M2FZb0cxTmpJSGdXbDg2RG9YWit4b2JXbUc5QmhnbFVFTExxcnBPWTg0am92?=
 =?utf-8?B?UmZ5a0hDZVpzRlNDM2ZMeFhQM3lOcll4QUFmTmdCY1Y2Ky91VUtadnEzUFli?=
 =?utf-8?B?SVlSWkZ6NTdBdWtlK3JJeTA2elZVNUtDWVdlazNkMDFCV040SE5rQUMyV0Nj?=
 =?utf-8?B?UlhvVkxTZVdtRGlxRGk3L092VStEdnB6SFF2aXZibnd4QWJtd2p2NGdETUk1?=
 =?utf-8?B?SHdkOHlSK0pIRXJNVlVXQi94SjQ0TzhpMjl1UHk3bDEydndYdjVlZ0hTS25h?=
 =?utf-8?B?eUYrais4OU1MdHlxOW5FWTRrUW5nMDRjOWZQanplVkRPNEpXQWNDVXVOdTlE?=
 =?utf-8?B?bHE2YVdiSi9IV2lnU3NPSVBDSWo4OGtkcUlLbnVvWC9BMDZkWWQ2bC9FWDQy?=
 =?utf-8?B?b1NFaXpHYXUzNTdqODNBV203WjBpWUluVS9JYTY2bkVOWkNYTVQzWk8xRVN6?=
 =?utf-8?B?dFJUc0tBR0l5QkhPTWJ0UjJNd0lLNFh6R0xWclMrdWpQMXY0QU9lalp5Yi8w?=
 =?utf-8?B?dE84dHNiL250Z09nUG1iYjEzVjBkZTcvTHNUcGNBb1UrQVg2SjV2eEQrcmIx?=
 =?utf-8?B?WndKT09zQ2pnWG9icThIejRYcGtiNTRaY0hYYlVCV3pBUTN6VHFsYzgyelpY?=
 =?utf-8?B?V3pxcERGeU9taXdiOFFzdy9hUG5EMG14Z2c2dmVaeGdONytVTFRRNUhoeHpr?=
 =?utf-8?B?cFRaU3REN2hpTEhVRXozc0RSNGFUUmNyT0lGMXhoM0RpZk1nbll3YUFHNk0r?=
 =?utf-8?B?c2pqd1NpWUhmVDdBWTQ2QzRxc3FaL1VLRGNtYStTOTRjRGs3aDNoNmthcnZD?=
 =?utf-8?B?UGROK25Rb1JUaEV0MkxzdnBTZDZEdFJMcDhKTHlqdHYvNWY4UitxUm82UHRC?=
 =?utf-8?B?Q2U1MVFiVHBvbWZzMlpPckk2dDE0QkxyVmMyb1d4Zm1FQms1WDkzNUJtQXVE?=
 =?utf-8?B?U2NkQW1qeDdWcFBtYkNLWGVPcmZmemNXQVMyTDljMnNmY05wTXBmemg0U244?=
 =?utf-8?B?VTc5aXJNOHNJL1JjNEJLVGV2QTdKM1lXc1A2NFIzZStKNE0va2RTOG1acDk3?=
 =?utf-8?B?dzJITDVtTWFWTTdTZldOMFQzYStCT1NTQ092RXBQdDlRNVJtTHJpMUNMTjVS?=
 =?utf-8?B?akFOYmhaQ3k4MmZKaE9VSUpyNldVL3orQTF1SlQ5MFJxOS8ybDBWVUg1NVJZ?=
 =?utf-8?B?REFPdFFDV1RkQ1lIc21WN2xjdmdjVUhVanAwdVJOTUpheXBzdzI1NlAzekly?=
 =?utf-8?B?azhYUkduSUI2cWgxR0cwSGZpL2RES2ZKcWFLYWhGYTZZYU1Ray9KTFBEb1Mr?=
 =?utf-8?B?OEc3T1dEYVJkN0VTRTVLWHo0ZWZDOGx5NFdZUWF6ZFBuVExySGNFMTlSeXFh?=
 =?utf-8?B?QkxMSGZqL295ZzZ0L0taUjlPS3lob0F3dk5yckI0c2h1bE43c0E1ODlWeWRq?=
 =?utf-8?B?NmY3NFlTNDV3T1BIT21UcEdNaDNoYlR0M0RkZ0kyS2JiaWtiNlk1VDBXYmdC?=
 =?utf-8?B?eEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0WtjfyfPJkxPBM3/0TiyBjKLpl4eJCqW7B4eOlj1amuvwI6Vjr+xZRJP7FyN9G5oDSV0iMymZ0mkmH9996qvDnd9FrbIZ4ndxvTn+jbtUAqih/9GFlJdpgHyRDDrWI+7AHGxs+CnzY9niYi6DPfzSLNGQ8jo4hgwOv1GU5DdtomRI7MWiX55EAcelGAs8Y5jHLouORSfbvsskS4Co8bkNdY98Ef2gcK4Rr7lKRXQmJ2KrRLUOOZRYLBZezfqAZOs1tgPYXG+iDIvy4MPHpmuqZQCmUVDIlSSYX4/GA4ErgUSqEjCtyhIKuQZJhc7P1Rgd5h9X8p1H/iOZ+mNaFjmNyNxgXxJSg+uQDIYoWLAiDWfq72tEKVYcLuW4c0jnunxCXP4Qd9mV7AxYq8kpiuWLR994bVL/zhHis7H3sJlW48jWdKK6IScn3Z6V80E0sPJq6Z+cfjt2Wzq3yyaDvChV1JJdk1XS1u1oSqwADqHwGMq5jzb8OtRIeZjCW28g3g9MwF+4PRBvC3PRz/jSC2op+1rDfKBpQtolee2p1zHv7N36kxB+Vr+WkpNrd4DQD3sYM63M3+57pgC9IDAXKUf3r5CVJXY/iumHhFbGyetE7vOWAieF4ZBVAdXhO/w8kEVf9KiLcLSKV2NU7x2UZVb6mTfODVYc3FauiF3t5QSSzqxA/2XJ77YUVXL298ZbIFNuah5KgaVnLowX++gIqImR0TUJDqoQHHMG67lQKro1D7UkvQYTSF7r7Rs9WPKZlZO3mmhYtuV7IJsiCh/ua6nzmSJinp6GIAUqQ8nXlcIEFVZ9Oj94glYmmilFABwr+EN
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7505b2f8-e908-4db3-37e4-08db6e6b3b06
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 13:11:43.5606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZap6wW/AhYRUjqHYm0WmWtMJokK9Vopd/gk6EYfo+SpzSI7WBPvXv/YsQdg5s45yv3v7oMm17pNtZ29DIwxww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6547

Like it's done with CPUID, introduce support for passing MSR values to
xc_cpuid_apply_policy().  The chosen format for expressing MSR policy
data matches the current one used for CPUID.  Note that existing
callers of xc_cpuid_apply_policy() can pass NULL as the value for the
newly introduced 'msr' parameter in order to preserve the same
functionality, and in fact that's done in libxl on this patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenctrl.h         | 21 ++++++++-
 tools/include/xenguest.h        |  5 ++-
 tools/libs/guest/xg_cpuid_x86.c | 76 ++++++++++++++++++++++++++++++++-
 tools/libs/light/libxl_cpuid.c  |  2 +-
 4 files changed, 99 insertions(+), 5 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 45f05a2d3d7e..786061282c91 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1822,6 +1822,21 @@ struct xc_xend_cpuid {
     char *policy[4];
 };
 
+/*
+ * MSR policy data.
+ *
+ * The format of the policy string is the following:
+ *   '1' -> force to 1
+ *   '0' -> force to 0
+ *   'x' -> we don't care (use default)
+ *   'k' -> pass through host value
+ */
+struct xc_msr {
+    uint32_t index;
+    char policy[65];
+};
+#define XC_MSR_INPUT_UNUSED 0xffffffffu
+
 /*
  * Make adjustments to the CPUID settings for a domain.
  *
@@ -1833,13 +1848,15 @@ struct xc_xend_cpuid {
  * Either pass a full new @featureset (and @nr_features), or adjust individual
  * features (@pae, @itsc, @nested_virt).
  *
- * Then (optionally) apply legacy XEND overrides (@xend) to the result.
+ * Then (optionally) apply legacy XEND CPUID overrides (@cpuid) or MSR (@msr)
+ * to the result.
  */
 int xc_cpuid_apply_policy(xc_interface *xch,
                           uint32_t domid, bool restore,
                           const uint32_t *featureset,
                           unsigned int nr_features, bool pae, bool itsc,
-                          bool nested_virt, const struct xc_xend_cpuid *cpuid);
+                          bool nested_virt, const struct xc_xend_cpuid *cpuid,
+                          const struct xc_msr *msr);
 int xc_mca_op(xc_interface *xch, struct xen_mc *mc);
 int xc_mca_op_inject_v2(xc_interface *xch, unsigned int flags,
                         xc_cpumap_t cpumap, unsigned int nr_cpus);
diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 705a93a058fb..be61ff0af7fe 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -817,10 +817,13 @@ int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t *policy,
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
                                  xc_cpu_policy_t *guest);
 
-/* Apply an array of xc_xend_cpuid leafs to the policy. */
+/* Apply an array of xc_xend_cpuid leafs or xc_msrs to the policy. */
 int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
                               const struct xc_xend_cpuid *cpuid,
                               const xc_cpu_policy_t *host);
+int xc_cpu_policy_apply_msr(xc_interface *xch, xc_cpu_policy_t *policy,
+                            const struct xc_msr *msr,
+                            const xc_cpu_policy_t *host);
 
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 0d0970d4bd69..09a012960a43 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -331,10 +331,74 @@ int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
     return 0;
 }
 
+int xc_cpu_policy_apply_msr(xc_interface *xch, xc_cpu_policy_t *policy,
+                            const struct xc_msr *msr,
+                            const xc_cpu_policy_t *host)
+{
+    for ( ; msr->index != XC_MSR_INPUT_UNUSED; ++msr )
+    {
+        xen_msr_entry_t cur_msr, host_msr;
+        int rc;
+
+        rc = xc_cpu_policy_get_msr(xch, policy, msr->index, &cur_msr);
+        if ( rc )
+        {
+            ERROR("Failed to get current MSR %#x", msr->index);
+            return rc;
+        }
+        rc = xc_cpu_policy_get_msr(xch, host, msr->index, &host_msr);
+        if ( rc )
+        {
+            ERROR("Failed to get host policy MSR %#x", msr->index);
+            return rc;
+        }
+
+        for ( unsigned int i = 0; i < ARRAY_SIZE(msr->policy) - 1; i++ )
+        {
+            bool val;
+
+            switch ( msr->policy[i] )
+            {
+            case '1':
+                val = true;
+                break;
+
+            case '0':
+                val = false;
+                break;
+
+            case 'x':
+                /* Leave alone: the current policy is the default one. */
+                continue;
+
+            case 'k':
+                val = test_bit(63 - i, &host_msr.val);
+                break;
+
+            default:
+                ERROR("Bad character '%c' in policy string '%s'",
+                      msr->policy[i], msr->policy);
+                return -EINVAL;
+            }
+
+            clear_bit(63 - i, &cur_msr.val);
+            if ( val )
+                set_bit(63 - i, &cur_msr.val);
+        }
+
+        rc = xc_cpu_policy_update_msrs(xch, policy, &cur_msr, 1);
+        if ( rc )
+            return rc;
+    }
+
+    return 0;
+}
+
 int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
                           const uint32_t *featureset, unsigned int nr_features,
                           bool pae, bool itsc, bool nested_virt,
-                          const struct xc_xend_cpuid *cpuid)
+                          const struct xc_xend_cpuid *cpuid,
+                          const struct xc_msr *msr)
 {
     int rc;
     bool hvm;
@@ -535,6 +599,16 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         }
     }
 
+    if ( msr )
+    {
+        rc = xc_cpu_policy_apply_msr(xch, policy, msr, host);
+        if ( rc )
+        {
+            rc = -errno;
+            goto out;
+        }
+    }
+
     rc = xc_cpu_policy_set_domain(xch, domid, policy);
     if ( rc )
     {
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index f5ce9f97959c..c96aeb3bce46 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -502,7 +502,7 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
             info->tsc_mode == LIBXL_TSC_MODE_ALWAYS_EMULATE);
 
     r = xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
-                              pae, itsc, nested_virt, info->cpuid);
+                              pae, itsc, nested_virt, info->cpuid, NULL);
     if (r)
         LOGEVD(ERROR, -r, domid, "Failed to apply CPUID policy");
 
-- 
2.40.0


