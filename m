Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMoPE0GT/WnWfgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 09:39:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F72B4F3218
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 09:39:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303246.1576730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLFnS-0000yk-9r; Fri, 08 May 2026 07:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303246.1576730; Fri, 08 May 2026 07:38:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLFnS-0000wX-73; Fri, 08 May 2026 07:38:54 +0000
Received: by outflank-mailman (input) for mailman id 1303246;
 Fri, 08 May 2026 07:38:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wLFnR-0000wR-Fu
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 07:38:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLFnQ-00FMhq-5G
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 09:38:52 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fd9302-bab6-0a2a0a5309dd-0a2a45089cda-28
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 09:38:52 +0200
Received: from [52.101.201.13]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fd930a-63b5-0a2a45080019-3465c90d30a8-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 09:38:51 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH7PR03MB6943.namprd03.prod.outlook.com (2603:10b6:510:15b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Fri, 8 May
 2026 07:38:48 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 07:38:48 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XfQh29dcG07ACpMrOzsTi4sEhtKhV/d5A7prnHtnty+AE9zgvuePMaSoaL1LQ8Ml0NOhUmBQS39aUZda7iVlb14AoGZ0gb3QFC38x44KFk7JTe0TrjGa2IN3zxkmEj6O3Mj9ECzVMeadW7sCMhlT51wTs0DxfY1zAmaMkIcr1rsdu+pXWgOcj52MjyPSo7WiZUgbTSMerYREC3KBOfoAeZAkA2E9m99wjSMCDw1DVTTCWfWwFskEYObVGmo5cecVrwtu2Il38tY4kaSEEp8fPEwqupjYjPPFC+SX2H1CMr93RvGR8XeQR1UAxQsKvwx0QrBVe9n2fl8yvLcZW00sZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n2YUBkeUntatOWRwNpc9LdA2RP+LvuBJZL0niLKJTkk=;
 b=DYJmyDc1jkNePIiEtPdsTHOBolaIOMxawgzThMa+YWlwlYV/cQzpvboRhl1kamsOWV8giQNZz0z1qi8HoQajhTtwWMCRH013/QJcX46fMBM2o4lOvu/bQI1bk6F93AMTCpL/xUUO3wyntWfzFKJ5wTzD/uamixTdEotr22TdPkvE5QseCWP9Q/LsmffAz47XfdgyLCQTljVNWlQHm9YDQrGeISje4BDh9MJKPK1vxJBGNeOFbZ9eC5bo59y/nZ8VZzn9GMzzsGDaH5TPySkCYYCHHP7HsXBIqwalzvhhQYHX1hd+cAts/pVs9CxD3SRFXtPYjjABurvc/UAXXQIMWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2YUBkeUntatOWRwNpc9LdA2RP+LvuBJZL0niLKJTkk=;
 b=fxfOslhKBIgrRug4bnKcmT3EYqR8+ZQGA8owQ5taXWDpAQp2RADixwWGUhmPDPvS4DU6Zv/8/9WrZt7G7N2kBWcNPu/Dho3Lr4tHX0s5Ijd23jTOe/92TpJmfoY9LDPq+BdZkVAWfaQXLbsU74enmXZlG5YkeEBvgkGq3fmOiXI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 8 May 2026 09:38:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 9/9] x86/mwait-idle: Add C-states validation
Message-ID: <af2TBOapUCCChHjg@macbook.local>
References: <7b7a677e-a5b9-42c8-beec-3c506b4eac52@suse.com>
 <d13912c9-8820-44e7-8aad-d8ee9ea17980@suse.com>
 <aevBUh77IeMuXjw4@macbook.local>
 <57233a5d-3944-433c-a7c5-a1a491a2c1dd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <57233a5d-3944-433c-a7c5-a1a491a2c1dd@suse.com>
X-ClientProxiedBy: MA3P292CA0060.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH7PR03MB6943:EE_
X-MS-Office365-Filtering-Correlation-Id: ce76e11e-1c02-4beb-ed73-08deacd4d73f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	c/YbpNj3vFvrPPlysJIa1tF/Y1PtAWcpVK0jGrBuS4vePrVJIjLKM2XrXCYK+vHT9Eb1O8A1RkURF1xCLYFrPJPhX4WavRFRY+h2SRPes3nqkQiOMA7jk76ZtLYZRr5J7Iz+4xz5yL+k+qSVrMjJq22Fz5gOP/SZASct+sZ8iEGmAvMunqE9VG4YB0X80sPV7nER+I1j/vK3DYCb/Lp13e0ia7sdZ2sBt8nBNVUIiFtu1xhd8dTbvSA3y/P/3z0++L0C/XV8RYbesaIzjvd+MS9RPbBvKzMYK84LwuaxguyR99AWZect6WZnCcOC7P0pKfABGZuS+YO1aBOtn/CoaE5TJv4l7V+3W42bN4frvh9lE2h1ofqJ/O2HKZKZp06Zf0xlzjT5weo6YP8SL9DnO2Iq84c1FzyORHTvRyqaEsQd8/zJPqk+AE64r9a/Gn9eFWYYznCxgsU675+ozqvaI4zkBzN5e8mbNkznXDDnVz5CPH5ptYMViAhvqPpN2k/sLTP5Diu+4bAqpfuxxlSzmXb1L3fWqwHoBuTZAvRkK5pMyoyH9aeCoY/d2XU5DqpdZUrxuf3KitZlbcHHUYYkX9j2KSsklwKKRxdhL5cZJYfmVoQdNbOqXWVMdjbc9aZSATDOboBzpBpEYENMlnUd9pKTMh9QVT6WQeoh3jNtzvnaeCR7ee36d3t8GVfvn65J
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzBSQTRmSkRHY2d0Y2xIbWx6TVYwSktWaVVSMXk4MnNmanVtejEvaHg3eXoy?=
 =?utf-8?B?NXBxM2l3M0hybGllK0lWWHFyc1BqNHVnVEEzV1IxY2U5dDAvbFgxNWdnMlFu?=
 =?utf-8?B?UDJQbXJac3ZERVlRMVVwOTF0UnlrcHU1M1Y5NC9YWnVsaHdYSzZBekZ6WFFw?=
 =?utf-8?B?Ym0xb2VGbXNaTFVXc1dnUVl5aVIxd2dvbWYza0FxajhGM1FySDQyaGc4djNI?=
 =?utf-8?B?NFUrRmN2UVZDWTh0aE1WWThSOVI0ZWF1U2ZtZ1ZKU3dsTHU1N1JWTHZ3WmtN?=
 =?utf-8?B?N1p5R1NZWE03Ynd6aW1jcmorUGx0eG01bE93UGhPQ0Vwd3JUQUl2aU9zdm9L?=
 =?utf-8?B?dE00cXhWSGRvWGQ5Y2UrbzVFbUliSXFVSHkvazhyUTBJaVF1K2hETVp3MHNJ?=
 =?utf-8?B?TDJFdktOZWR0K3BBNWUyU0E1KzhvMEZHaHlMSGtheG03dWYzTFA2MjdtcjVp?=
 =?utf-8?B?cFpDWHBDMGs3dVRPRWdJVXJwRTNaTG1pNkkwRlQ2NVFPeW1QWm56WGxOL3ds?=
 =?utf-8?B?S2Jjc1dtUnVmRWJvcVRscUh3a2RuaEtqaEJEWHQ0a3M2QXJ6YUVzWUJWczB4?=
 =?utf-8?B?WWdYOUp5RFZQOERSL1pPTEQ2bXVLejlLd3UxMmxPTlRvS3IwTlp6WDFkdU9G?=
 =?utf-8?B?SXhSWkJ0a0F6c1lWT3lWRUJ4Mzk2eDEvajYzY2UzZGFsMk1RU3BVUnJYRmN3?=
 =?utf-8?B?ZjhZaTZURUZrbWdXVGl2YU40b250UzQ2a1JkU2NFU0I1UncrNUswWTU1ZUdy?=
 =?utf-8?B?dzl1ancvQllXWUMrK1NkeDhZZkxTdlVoeWlwN3lqWERaV204eitvbW96cWlX?=
 =?utf-8?B?VytUR2JGVVFvSzA4Y1dnRWREUGFQWUVndDhsZ3BNdUU3ZGVETld0bitQZVZV?=
 =?utf-8?B?SHVXaHV2S0w5cmlreWYreVptN2JxeFhjYWpsU3NZWjQrTStJYU1oOXQxdTFW?=
 =?utf-8?B?RmFMdkpJSXZKR0dWZko2M3dkQ01KcW9veXpMQkEzNTREdndFZXdQcFUraC9J?=
 =?utf-8?B?OFBtNmdSVmV4SlI0WE1MK0VFUE9ZK1RBSmM4cEorUnFEWHY1dW9nWE9KUktG?=
 =?utf-8?B?SnFDOXA0bjNpZEkvSE94djNxeGZ3OW95YWFWVUUvUStVVzBuckxEWUFYRUxy?=
 =?utf-8?B?Vy9yYVNrRUlQTzdlY3k4b2NnQ2RiWEs1VEtRVG9jcGdUS1o2d3ZHeFZoeTBo?=
 =?utf-8?B?aGU0THJoN0VyRjIza1FDbENlODdneXpyYkZLbjcyVU1wYTVSS04yUjZaT25v?=
 =?utf-8?B?eENJZUtUUG5DbWRpSFEwQjBjcG5WZVFjZGRjUnkvWlptRmdXZFpaMEwrTUh0?=
 =?utf-8?B?ZWlvU0NwcUlDWWhhRVVlZ1p2cXlWam9sSXo1KytHRjdsUFdXU3NyS0FXUTJu?=
 =?utf-8?B?dGdnRDVtLzQ3TER2RERRVUxtK1FqUC9UM3JPNzVRd1k5VUY4cG5KcU1yVXcz?=
 =?utf-8?B?dXEwTFloYWJLci9jdWNrbVA5akpuK3QxY2FLR2xQemxFYnpNNi9vNWcrR3dn?=
 =?utf-8?B?RXFlbCtacHBxYmhuc05uVUxPcG5ReEg5ZzFqa1JCWXBUUG9TTlZSZDdqNlNZ?=
 =?utf-8?B?WDlUanMxL3MyUzNnam9rTDlkSDVOdkFrckNiMzRjS0JpdEJiUit6RU4wcmtS?=
 =?utf-8?B?MXI0S2ZJUGREZzdSUHpwY05NUjNuWms5NDIyaG9vSVNoVXlWeUpMckVlVE9Z?=
 =?utf-8?B?RU8wSnlaaWxjWGk0WXFZdFJmL3FWdUFVT3ZZcHFnQXFSTnpJL3hwRkQ2SDFS?=
 =?utf-8?B?cGZyY3FLVm9ra3dxbmxGQTNORHg4dFVSd0k4U1B3bVRSRXk2dEo0WWlvVHBi?=
 =?utf-8?B?cWtTV2RVR1lhUGI2SnVMK1lUMGhIRHh2OFFtUWVTczlxK096V1RUV1d6SWVw?=
 =?utf-8?B?Ym1sSTJQWnlIcElzRG9xb1lsZFg1VHI5MGpJb0FXdWthc2R0UmlabmRPelIr?=
 =?utf-8?B?dmNzTDBsVnNhcmFKb1QwbHdYU1NyU085aVM1RzZaVUJwNGsrQnZJWC81akMy?=
 =?utf-8?B?Mjc1dkVVUjBNeE5qZzIvMVpwVGpaRUNCT29RYTlpUjloYUhjM2RjU3lMZk1V?=
 =?utf-8?B?VE5NaEJyQTRpbUJMejdjR3pXVzBVdU9jZjcrT0RjRTRPdnZZZmNReW9uNk9F?=
 =?utf-8?B?c0Y1OW0xUkxkdzlCQ3JwNmZjQzRqWDd5M1J3WG9oUmxhN3E2SEtnOWN1UFNm?=
 =?utf-8?B?dFRlV0c2SnNTSFFOS2ZsY0FqNTZpZjhhNFBNOCtDekhIaFNKRXJGbEluU0tU?=
 =?utf-8?B?M1dlWHZCckkzQ2RsMEVDeVNheWxzYmE2Q2lyUzVsV2kwU0w3Rk92clNXa2pV?=
 =?utf-8?B?N2lGSFVmblVXOCtXVlY3YmhCRW5JMDNoQkNGMVl6cVRseGFTWSthQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce76e11e-1c02-4beb-ed73-08deacd4d73f
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 07:38:48.0618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Tns+mrZjzunjvIdPjh0omLaWtjfzRmF/7RZy3SRw7/aHAGwpzhUiQWgtxM0TT+Q8Fs5oJAEf0muJUwmdviWVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6943
X-purgate-ID: tlsNG-c1860d/1778225932-BED73DB1-5A310087/0/0
X-purgate-type: clean
X-purgate-size: 2413
X-Rspamd-Queue-Id: 9F72B4F3218
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Mon, May 04, 2026 at 11:34:40AM +0200, Jan Beulich wrote:
> On 24.04.2026 21:15, Roger Pau Monné wrote:
> > On Thu, Mar 12, 2026 at 05:58:21PM +0100, Jan Beulich wrote:
> >> @@ -1589,6 +1594,41 @@ static char *__init get_cmdline_field(ch
> >>  }
> >>  
> >>  /**
> >> + * validate_cmdline_cstate - Validate a C-state from cmdline.
> >> + * @state: The C-state to validate.
> >> + * @prev_state: The previous C-state in the table or NULL.
> >> + *
> >> + * Return: 0 if the C-state is valid or -EINVAL otherwise.
> > 
> > Hm, I know we picked this up from upstream, but this function would
> > better return a boolean, rather than 0 or -EINVAL.
> 
> I agree, but I didn't want to deviate from their code purely for cosmetic
> reasons.
> 
> >> +static int __init validate_cmdline_cstate(struct cpuidle_state *state,
> >> +					  struct cpuidle_state *prev_state)
> >> +{
> >> +	if (state->exit_latency == 0)
> >> +		/* Exit latency 0 can only be used for the POLL state */
> >> +		return -EINVAL;
> >> +
> >> +	if (state->exit_latency > MAX_CMDLINE_LATENCY_US)
> >> +		return -EINVAL;
> >> +
> >> +	if (state->target_residency > MAX_CMDLINE_RESIDENCY_US)
> >> +		return -EINVAL;
> >> +
> >> +	if (state->target_residency < state->exit_latency)
> >> +		return -EINVAL;
> >> +
> >> +	if (!prev_state)
> >> +		return 0;
> >> +
> >> +	if (state->exit_latency <= prev_state->exit_latency)
> >> +		return -EINVAL;
> >> +
> >> +	if (state->target_residency <= prev_state->target_residency)
> >> +		return -EINVAL;
> > 
> > I'm not an expert on C-states, but isn't this checking against the
> > previous value kind of defeating part of the purpose of the command
> > line?
> 
> I don't know. The question would need raising to the author.
> 
> > Also, it might help to also write down those limits in the command
> > line documentation.
> 
> What do you mean there? Some of the values are universal, but some
> checks are against model-specific values. I don't think you mean to
> enumerate them all?

Maybe it's indeed not very useful.  What I referring to was something
along the lines of: "the command line provided residency and latency
values must be smaller than the default ones".  As noted above it
seems weird to me than higher than current values cannot be set,
albeit I have no idea what's the expected usage of this interface.

Thanks, Roger.

