Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD9B727986
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jun 2023 10:05:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545167.851442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7AdU-00077u-2z; Thu, 08 Jun 2023 08:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545167.851442; Thu, 08 Jun 2023 08:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7AdT-00075p-VV; Thu, 08 Jun 2023 08:04:47 +0000
Received: by outflank-mailman (input) for mailman id 545167;
 Thu, 08 Jun 2023 08:04:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VlTS=B4=citrix.com=prvs=5169c035c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q7AdR-00075j-TM
 for xen-devel@lists.xenproject.org; Thu, 08 Jun 2023 08:04:45 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f59faab-05d3-11ee-b232-6b7b168915f2;
 Thu, 08 Jun 2023 10:04:43 +0200 (CEST)
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Jun 2023 04:04:40 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6235.namprd03.prod.outlook.com (2603:10b6:510:ed::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 08:04:38 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6455.028; Thu, 8 Jun 2023
 08:04:38 +0000
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
X-Inumbo-ID: 1f59faab-05d3-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686211483;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=zoQb50xL5TWx/gE1OPqbo5C0InHiRy2tL85536B4+JQ=;
  b=WOEiWabHY/Lx2ORx8r68NS+alIGxNKYMNMntP965tzVKmvO3xcVJkLwS
   pmJwS4QLenfmbibvbt8IBwkZeicSr6ICV1iNofu+xZoNbxEcVMV4hzk9q
   urmocDM4jeQoq1PDtCTipiUwPjAJJFqYPU+pgsFvdtLnLaR36PBSN3J6k
   o=;
X-IronPort-RemoteIP: 104.47.59.175
X-IronPort-MID: 112043366
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:x8zrFKzv8CDP82akL0V6t+cRxyrEfRIJ4+MujC+fZmUNrF6WrkUHy
 GIYCj2GbPyMZzOnctAiOYvjo0kEuJOAzodkQQpq+SAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRgPaAT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KU8Xz
 MIzbzYPVSqaiOaL+52qVLBIgtt2eaEHPKtH0p1h5RfwKK98BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjmVlVMsuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37aVxX+gA9xMfFG+3uMzjESX5G82NCVIU1eis924oUC7evsKf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZDYtE7sM49RRQxy
 0SE2djuAFRHr7m9WX+bsLCOoluP1TM9KGYDYWoISFUD6ty6+oUr1EuQE5BkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPuRENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:v5I0K6Ema33+RNcepLqELMeALOsnbusQ8zAXPiBKJCC9E/bo8v
 xG+c5w6faaslkssR0b9+xoW5PwI080l6QU3WB5B97LMDUO0FHCEGgI1/qA/9SPIUzDHu4279
 YbT0B9YueAcGSTW6zBkXWF+9VL+qj5zEix792uq0uE1WtRGtldBwESMHf9LmRGADNoKLAeD5
 Sm6s9Ot1ObCA8qhpTSPAhiYwDbzee77a7bXQ==
X-Talos-CUID: 9a23:SspH6WOr8JYNFO5DdnBeymVTHMIeSGTSyErrDF6mUEJtV+jA
X-Talos-MUID: 9a23:xL9WfQrOdDjN9cIuL1Eezyw7ON5swaeLNHhTl5kfqe2FHiJ1Gh7I2Q==
X-IronPort-AV: E=Sophos;i="6.00,226,1681185600"; 
   d="scan'208";a="112043366"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6uk1vKTaNMU+GLPRElpnny7m8SIQdq6oVuEWymBNBEsEdGGmZnu1fq7J3wj+BJOqKGf7jF5J5foMVnJe6/OleJ6P5t/KsWKd+/Di6cOArN8eMDAdzeE50u3ZhpVtsKf9PA9GpsQVDHQFFR6/2HB8suOTzRWYPRXHk3Vmk8Gacg3M5DNJtz/qF0gFx8WeLshr0jx4d9XnWJw8eBuvj3lkiSNRykG0zE/qa9iuEgQbLHEMG2p7t6q31FtOK0nohu/t5pEsXthRJGeQ8QRx4JI6kAVOKwJ5qzoGEJGs3QfuvhotVSOOcxx2hhGcTBmQt/ydoTlMaJGqTgbTNHzsv65xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SG/mQjHi1IESN+dMkY0nPEfRAyKCI6s7zJCk2PQWOc=;
 b=Jc4k3lV4AbABNxn4R8vvo/hJ8KnKHja/B1JTS30nEItisfdSeeZ+QgpvBZxMnLHcHd4xsvsAHCPRo3O94rwSC8tZAnRtiG7DltjPfsjnU9n2M3J2aYqPDQ9PJkYjme83sDejbtsrZtlRC9jVg1mHJwiSsMnkkMxQ//KXjwoXW2Y0G+QzhC8HtidKI7ACf0jFN+DSKZMyzKturjNoJp+steMumrgh9v01zy3HqPhJADg9LUjvjiwcuRZHRkmEHen24U9bVhgsYkX5BNWOwYXCrLsIqnbDqizs7Sz6GVsQQb8qfRD+YJ8spO0MCTbM9OfouN4c+ImwW81jin7RB22hIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SG/mQjHi1IESN+dMkY0nPEfRAyKCI6s7zJCk2PQWOc=;
 b=bqHoIAhIAfvnxgARxhpVP/vlEb8+zCLQK3t9GaISF+3JCJMVpY6kL3NU+xNAoroOfTuz8G3IjycJjCH6bt/w7Tz5b8GvWQULdzOpJRxNpXhImtKlYn55KdBLqMgVEJ7/LYO21h1uvvPuJp+/ocznY/AaDHco5Cwjrmc9j+F5bhE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 8 Jun 2023 10:04:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/hvm: print valid CR4 bits in case of error
Message-ID: <ZIGLhhIHcydMwT9Q@Air-de-Roger>
References: <20230607134638.53070-1-roger.pau@citrix.com>
 <728efea9-2d30-fa55-473f-df3a18742ace@citrix.com>
 <ZIGJ9ZYlGQD/oydT@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZIGJ9ZYlGQD/oydT@Air-de-Roger>
X-ClientProxiedBy: LO2P123CA0066.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::30) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6235:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e8cff25-75b5-4dfe-5bee-08db67f7016c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KGwPXEQ5GKczKcXZ5yE1sgDO2SOh9PulSJK6n3EePX95AUCcXzJjU4MyKMm02LHmGbfEbpGVoGd6msMpyDM5wkaZdYaaIk9U/wltGzxAj1TW+/LYe2sygibs68ljHZF3TyKwXdhhw3EOdLZtvpvcuX7F49TALP6jxd+ziJRt2W6oI6ZwTrzKfYwqk/pbZOjF9dFn7cd+kV1f2CHI6LtyJcdCcF8f/ZdGWUYrCtu/X7l4rTZkncauDnyK077p7gXmjV9GWL1wW1D1FfAioLTy8QaWVJ6cUkU1GuMB8mLt3aq1CBVz2sughuKK4Qk7zg/RNO+hqq1ItG2IqZcEA5ADtH8nlWFPEszhZVHkxHyQ1QdFXpHN2oqrGhJxJw57h3OH+eUODvDRoSLKNo/zTUti6v9u5nPhNeDkk2IkNijqFFmVJif3fod6qIg1mz7ckoifBD2Qhjtu4ntk7Xeey6zwMarEdyuFa3bSIyyYi6/i48kjycPSiTGdwqhL1+Zjsv0ZwtJgJfg4g+nxAmc8v0CsKH/VhyyZ6dW1GjjZluVqm68b8kI1BnJo5uc/2pPRorhX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(136003)(396003)(39860400002)(346002)(366004)(376002)(451199021)(83380400001)(478600001)(6506007)(33716001)(186003)(53546011)(9686003)(6512007)(26005)(54906003)(41300700001)(85182001)(82960400001)(6636002)(66556008)(66476007)(4326008)(66946007)(2906002)(38100700002)(6862004)(8676002)(6486002)(8936002)(316002)(6666004)(5660300002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGFBVWRFTHcxQUZ0Y010b24rdHRNSndyUVRBcUFBaUoxYWovaDEwOUFDV3BU?=
 =?utf-8?B?L2RNanlhRG9tSUU4MkhkQ0dlOVFPSkhmTnJnNk1TeXE1TDNtcUNXZ1RQSVdP?=
 =?utf-8?B?ekJmNllhL2M3clQ1UTdQeERCNGhSczMxVFlVKzNRRHJyUnpPRmU5M2xKa3J2?=
 =?utf-8?B?NFhnUUxOL3hrdmRjUVpYOXRDVmFyR2hEMWcwdDB1ZnNwaW5ZcndWRnNuWXF5?=
 =?utf-8?B?cnFzZkVNR20vQTE1MFhJd2lJMjN5ajF5VmxVWXp2R3NsUzVndFpBVkQwbDdv?=
 =?utf-8?B?d0E0aStEeFdRSjNyeVdUd2JXU2hXekNNbXhkaUV6M1BPdTcyUERkYUZlQkRX?=
 =?utf-8?B?TEJTRSszdkdFY25ZK2RYekh0Z0dkU0tJWnFHbTZ5MVBDVWZRWjZ5QlEvTTNX?=
 =?utf-8?B?OGJIWUk0N0JHaXFUL09RL2ttVEZ5VEtvUzR6TGhKeGFudHB2Sk53Y1E1aVZ3?=
 =?utf-8?B?Q0lkRW1way9paUVFaVZiZXJGMFRvSGRxYTZvZ09yd1RuVmJvNlpaaTVBd1dl?=
 =?utf-8?B?TU5QdmFZWWRlV1BTZTM3UTNZR3VqY0czd3h1bDhYNmJNczF3WFJQeGRIaHR3?=
 =?utf-8?B?T2pCMmlOU2xnY3gvVTFOd2JrclptSElTeEkzK053RCtoTmppZ0RoSWRjNU9X?=
 =?utf-8?B?ZXpQKzBTTElFWE5HQnBDMDNxSEN1Tml4cmJaZXA0dm5tU3lOaHBDTUZic2g5?=
 =?utf-8?B?YUFmeUIxWDNDS1lvWUREcm5jamFsY0VEemxuMTFFOEE2YTBkZEpoektRM1M4?=
 =?utf-8?B?Y3poYWJVTzliMlZPZ2ZBb1I2azc2OForbkJxR2ltdDA0MWNxUWtHMHJBb09i?=
 =?utf-8?B?cVhDd2ZCcjVyVXQ3d3F2M0dMbHVDYWtCRVhLVEJtN3RrM1ZONTFXcHVqbmpo?=
 =?utf-8?B?R0s3dlROQkt1TllvYjlZRkhpNUlUdHcyVVoxdWdZVDlSb28vbmoyenR1NE56?=
 =?utf-8?B?OGFtenJVakJLSVJ1SndFVStMNlFTSHdRd1Z5ejVKVkxkZGdLOGpGR0s3SjFN?=
 =?utf-8?B?Rkl3aGlTZG9lQjZSRUwvd1FPanZQdGlTVTAwenBqV3JQNkVXL04ydnZHZlFB?=
 =?utf-8?B?MG4wVi81ZXZ1Q0hPVWNlUmN3RThKbmNMYlpiUk8wVEc1cWIzZDhraWl6ZU9K?=
 =?utf-8?B?Y2RpSzF0by9MU0VReHlCUG84RXRHN1FlaTlzalY1WS90Vm0zMGdjU0ZuRDNm?=
 =?utf-8?B?NEU4OEE2SFNsVFo3RDllVDE1L0QvN3phR2FmS2J0NWJ1eldjNXB6cm9pekNq?=
 =?utf-8?B?aWM4cUZ5YkdDSGZLemROZy91eFh3di80cEJZb2JqNEE5SjRTWTdBOXg1MXhI?=
 =?utf-8?B?Mk5sRG1jbXA4NXJWdlRmbzN0WHB1Mmp3dWd5aGxJSEhPbVB6Z1FDQnFxazlZ?=
 =?utf-8?B?cFVwRU9ubXBKMTdEdHVxK0kxZWgvck1wYXlodlNCblhrWkIwRkpwRzF0a3BR?=
 =?utf-8?B?NU5tYitVK2JMdWU4UTRoOFd4S04yTGxwVENWdkl4aFF5eFp5UE1qZnFzSE5W?=
 =?utf-8?B?SzF2dmdZakhtZ3cyelVEQlA3dU9CWXpDWW9UZ0VWK2xLRmFQUW9tMGZFc0dZ?=
 =?utf-8?B?ek5tcXlVbzVIL2k2K1VFQjFsL282dFJGcERSRWUrcFJsbUlLM3UwakVESEJR?=
 =?utf-8?B?OVdEQnI4eVE0TnA1bGV6UlVjbW1SYUFISC9iM3pCMFFoZGNEbzJZVklObzFN?=
 =?utf-8?B?VVZmZEhMMFQ1RUIwWXZkcCt3eU1vejFheWJhc21NY2JVUmRTTHU5d1d2Tnd1?=
 =?utf-8?B?V0J6QkpBYVdmOWlTQkc1Vk0yeDVrTmM1YkNjUm9odjRQU29EeXRoejVob21G?=
 =?utf-8?B?cGkxdXc0eURNSVRWR0xlNjE5WkRIaVRmb1lsdnNFUURIaCtkUkFkbnhZUXUr?=
 =?utf-8?B?OFJXcTRaelZFdG1ZbGMxc01PVFA3eGlpTVlMamdqdU13S1ZWRmpFM0pJeUlF?=
 =?utf-8?B?a1MxcTNWWDI1ZVRQR2N4cVhzUmtOVkNScjcxaFF4ZTRmSFBxZ3dXWnNlSUVn?=
 =?utf-8?B?NXU3QXI2UEptRWJmLzl0dzlIcFdBM3g2Vmpsa3BJU1lwVGx3TFJTWFBHMVNH?=
 =?utf-8?B?YmlrQ3VhSy9wN2ZVUzhpekdmZCthUUhLMXFpZHVwRmY5NGdZdU5MeGYrZHg4?=
 =?utf-8?B?d0M3aFRuMFByRFA5M0taZ0NtSFlHMXd5dm53QVBEVHF1dWVEVWZVc0g1dzVQ?=
 =?utf-8?B?S0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ljsq3l9GerZRn5jk245+3bygjpa/MSkFuCJX6IzrUGsccdiGhJ7y+i7dQ4mKeiAo/fVQlSFV+xCo2Zo43heAmTn5hHqo03Upj+o12O7u0HsssXEOzt02Tr/htENeNHOHX1VKwyTNo1O1H+gmdJ42/F1h2S9uEOdpaPqXBF2n8VvwquYHfbBwQKypV+iR9pYZjyjHQyC4VL08WlifIkm0sWuggK/DpOZm7S5X5Rre8gZutHY+xOeQITZXYe8/haOcFSvajwe/WUw45z6znZNCijZFLpm8LGstYHyRlUm2AFDpqCR1ZhoU6JLyuI23q/W8bf3+PKscALKiKQtUHQLFZWz3ZgC2L9lQTvxBtiwBxXIf0QdVfNncrkAxUQpcFYnq0MZuviudpGlmoJwyNs7T2RvnK3q09rWbSFKDxCbaHMXQzR7rlyNzlUrn0EV+14FpZaqi8Bpw5cLlvpMVKwxgIMZk0ClEfx+FSB4i2pl+AOpv/nPYtv4DBS5aLR4lxtkq0X1iedsRy7gXUiUeeAiJP5xSkQtG55iQkvl9dr05zeodCSH0vLLB7PLPLcFYlKEbZUfWw+o6BD+/Auqgnw9ZLTWS2oVArjJtgfX6cmy64O+YIDBynLTjTh98WuhGZaa2FpUPOt5k7N17R5RHq4r5zCwvFRD+Eip3vUw1+gpM0HzI9vwRiOQmSay9VtFO8Fq4Io2AjNz2Wd7PZ/wkQ9/bBILE/l2+209RqKcxV3l1mnAi1JtsYVNqjQl+zLIPuZqT8ZdOVs3WxXpD6V0Y+0ymnbybgOTWk/M4TQXAmpQQqWL/bPdqg9UgtiEeLDTQTMuc
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e8cff25-75b5-4dfe-5bee-08db67f7016c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 08:04:38.3911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+DZDHZ0/Vw8D9c0rwMSDxi7KqneF1Zsepn8ziWPzYg0szfupi9StwM5K8fdh2uFEEaEfVYiTIyAJYKF21LsbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6235

On Thu, Jun 08, 2023 at 09:57:41AM +0200, Roger Pau Monné wrote:
> On Wed, Jun 07, 2023 at 04:48:42PM +0100, Andrew Cooper wrote:
> > On 07/06/2023 2:46 pm, Roger Pau Monne wrote:
> > > Some of the current users of hvm_cr4_guest_valid_bits() to check
> > > whether a CR4 value is correct don't print the valid mask, and thus
> > > the resulting error messages are not as helpful as they could be.
> > >
> > > Amend callers to always print the value of hvm_cr4_guest_valid_bits(),
> > > and take the opportunity of also adjusting all the users to use the
> > > same print formatter.
> > >
> > > No functional change intended.
> > >
> > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > > ---
> > >  xen/arch/x86/hvm/domain.c       | 4 ++--
> > >  xen/arch/x86/hvm/hvm.c          | 8 ++++----
> > >  xen/arch/x86/hvm/svm/svmdebug.c | 2 +-
> > >  3 files changed, 7 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c
> > > index deec74fdb4f5..8951230a9f52 100644
> > > --- a/xen/arch/x86/hvm/domain.c
> > > +++ b/xen/arch/x86/hvm/domain.c
> > > @@ -266,8 +266,8 @@ int arch_set_info_hvm_guest(struct vcpu *v, const vcpu_hvm_context_t *ctx)
> > >  
> > >      if ( v->arch.hvm.guest_cr[4] & ~hvm_cr4_guest_valid_bits(d) )
> > >      {
> > > -        gprintk(XENLOG_ERR, "Bad CR4 value: %#016lx\n",
> > > -                v->arch.hvm.guest_cr[4]);
> > > +        gprintk(XENLOG_ERR, "Bad CR4 value: %#016lx (valid: %016lx)\n",
> > > +                v->arch.hvm.guest_cr[4], hvm_cr4_guest_valid_bits(d));
> > 
> > I suspect you want to call this once and store it in a variable.
> > 
> > It's a non-inline function which also isn't marked attr_const, so it
> > will get called twice.
> 
> I wasn't specially concerned about this, it's an error path where the
> second call will happen, and there's already a printk which will make
> the cost of calling hvm_cr4_guest_valid_bits() negligible compared to
> the printk.
> 
> > Also, if you're extending like this, then you actually want
> > 
> > (valid %lx, rejected %lx)
> > 
> > passing in cr4 ^ valid for rejected.  It's almost always 1 bit which is
> > rejected at a time, and the xor form is easier to read, not least
> > because it matches the X86_CR4_blah constant of the bad feature.

But cr4 ^ valid is not correct to represent rejected bits, what about
valid bits not set by the guest?  Those would also appear in the
rejected mask for no reason.  I think we want to print cr4 & ~valid,
like used in the validity checks.

