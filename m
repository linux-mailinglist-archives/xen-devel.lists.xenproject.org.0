Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 545183F853A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 12:20:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172911.315513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJCUs-0004jB-4P; Thu, 26 Aug 2021 10:20:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172911.315513; Thu, 26 Aug 2021 10:20:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJCUs-0004gw-0u; Thu, 26 Aug 2021 10:20:34 +0000
Received: by outflank-mailman (input) for mailman id 172911;
 Thu, 26 Aug 2021 10:20:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJCUq-0004gq-Kj
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 10:20:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a042f87-7b56-4a52-8dcc-64926b6dd10e;
 Thu, 26 Aug 2021 10:20:31 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2057.outbound.protection.outlook.com [104.47.1.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-Og2hYKa9Ocq1qQaRhWuaBg-1; Thu, 26 Aug 2021 12:20:29 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4384.eurprd04.prod.outlook.com (2603:10a6:803:6f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 10:20:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 10:20:29 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0701CA0024.eurprd07.prod.outlook.com (2603:10a6:200:42::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.9 via Frontend
 Transport; Thu, 26 Aug 2021 10:20:28 +0000
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
X-Inumbo-ID: 3a042f87-7b56-4a52-8dcc-64926b6dd10e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629973231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gM66SGIX8qXvHn91ogQHgEbJLUM5BeCodBHE2m3SzTw=;
	b=JVoXiQSGHmhsrT1Sle1iY6yapIc/yFfQj4+sbePLjPhAtsQFPFteLcI92jW81o5OTkTlYn
	c0ve50WsE8CPl8Ba+Z7F98PZijD1frGYYrqUSO9oJI1HiZRBNgYeW/wPv437/8d83WDro6
	jfaEv4OyR4soY0DN723OQkddVupseVA=
X-MC-Unique: Og2hYKa9Ocq1qQaRhWuaBg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATK8CvPTEBnAg3JDROcer4E+aJbsOnAsTzOgHVcmcXPCl8hJEo7MO0qwz3icg8Vw9RM0HUMKR5P4Cf73c1kKwMojGsJ1KXuqJsLEf2ZuNGcr7OOabGiSuwSrKnffqAuvWcMVmy4OUAtP12zmpKTma0gN5bUGJBlHHPOVkYzgz+UnLP5hjBp/sB81bw0gBdTip4ss5jw4ahe7crQzoX6hgtWUIxven2WRdNO89L2966vChiJw6ndEjLTJ4jF5809f88w4rqCMXA//pW92ht90knCaphRxPRfI+6DyfRzY6yMOwK4FH+U5liuYSQVEPUgsCE8M63JgkmrDNplH97uLrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gM66SGIX8qXvHn91ogQHgEbJLUM5BeCodBHE2m3SzTw=;
 b=L8FWT6tRzM5bgFJdHp/BTxWQ357Mnv706kgkVV4c6/fxRDlnDYGFzGZVANKHl1Q3aRxlvldQKTdQyI5o/speozwuiCpwVJDHfyW7eaLCBKltgd4eo2vh4R6nwtOc5/xJGksGmgOIgGs2VhycWw/b5vnOhHQ49l5W326U20C1kpPO5g9DZIAHDx+I69/fVZhvbEypTUpe2KXZC6QuzIEP/6BRi6B2KQI0Ymlf7ZW1N0MP8StzbNzmy3cnBlXQvmF09+CPfoqL0Tznc1an9u63oD4IQ4u8kD89IAr+aGEcQBFEo6QuySA+qAUygNRNIQwfNKhORvhZ1BWT7mjTej6wuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
To: Minios-devel <minios-devel@lists.xenproject.org>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH MINI-OS] gnttab: drop GNTMAP_can_fail
Message-ID: <6b356c6d-d9d5-65ca-50b9-4381d535fe79@suse.com>
Date: Thu, 26 Aug 2021 12:20:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0701CA0024.eurprd07.prod.outlook.com
 (2603:10a6:200:42::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77828429-971b-4c8d-be17-08d9687b20ab
X-MS-TrafficTypeDiagnostic: VI1PR04MB4384:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4384F5B3CDE434E7BE2C3460B3C79@VI1PR04MB4384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d+avy9651hcs/4/BcKoxlyYke+oqJqGuHJuQTbeqqnGhKwXYRctkggt1iz+Q8bKBYEAsb+ixwkwgIjo8yi/bNQh+/G8X4MeBKujb/61eZuaHylvILOne3BOKwGzRfwyglbtLfZWaoJodBnkL3853uQNs1jK8E0TsQ6UYqNqU17nE9HzwCVaEfacE9KECbheKHOdm/fvr3tIUoWUKhkFDE5851YEWtIp+cT6taeQfciRvbFF8pkdfdy38Bio/3PYFTZCJqiS1SCo7mLUZ/eC+T8NALOC17vp73cUGSmdRwr3lb9v/BUACWgYkUc/7/xkBAFDKI+wmah0fFIWLo05JeeFTNKPGP6foTAnZ26PNkxVuQvlS2MIEgWRYI5vEiEUrQmuc1q5JF7RjJ7uxRLTpEk40aTknyIxYE+ftR76GVpIxrtlSFuLi2pPOk1n0ZrQT9snDC/jyb+wLJuGfJBC6jygjsbLSFDQi0rgzHPlzYFgTKbcsmZbvuG0SjnsDHZGld+uX19q/ekUEK1wx0wtTiqa+8e5HsQr6Gs2xXfAIhLEQAlR9qvlsP7VhiSes0ah3y61IoBij+MChGrmgbOjRshsxuUmg8w5Rk88H5Sn6UVIORfRMKm3pEBcMb8O+1RMdKyYYemgtgE3dj95HdafoNqHWkH+zttjGfqF2BpdeXNE9B4BqCaYaqxSNovzMr3NZmf1+6SnEov9Hqvxj4V9507ncZUiRMtpr92KPMOraIIw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(346002)(376002)(136003)(39860400002)(5660300002)(956004)(86362001)(186003)(66556008)(66946007)(66476007)(31686004)(36756003)(6486002)(2906002)(8676002)(2616005)(26005)(4326008)(478600001)(4744005)(6916009)(16576012)(8936002)(316002)(54906003)(38100700002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXRZdVhkZDdQZFdZS0kvTHNQSDY2eS9TWk9pTGJDcWJsWWtyb3hsUkJOZVpK?=
 =?utf-8?B?N1p4TWxEL0dGUTVkdUVXYTVvZnNnM1VNaUJRL3RZWlFqVWNDYTRvaWNDYkJC?=
 =?utf-8?B?dTBnNWJpcmpiUmJQYWFJNHQ1VTArQUQxazhybXBValUvYlhZTDB3SGJ3STZa?=
 =?utf-8?B?dUEydU02bDdZUTNVeUUrWTFPY0sxbVVwM0dRTm5XbUhMVDdNR3ZNd3dodXFE?=
 =?utf-8?B?RjMrdXIzck5MeVV2ZGZmRkFpOTRBMjc2aEoxZHNTejhmNjNyM3ZsVnVYMkRl?=
 =?utf-8?B?SFJNSTg0dGxxNVVOR1R4Z2NQWEtwU2Q1Q1lZelJoSWxnSm1BcEI0L0NDdG9x?=
 =?utf-8?B?WUdMdk5vZEZiNkhUMGdsU1BZOTg2MmtSQVJnM1VSdDFOdk9YKzBTOHAvR09a?=
 =?utf-8?B?ZHg3MUZENU5GbnY2dkRNSDFDZy9DNlN4SE1hUUNlQmJkYUw1YzQxMDd5cGtG?=
 =?utf-8?B?eE1INzEwNkNXSVNZOWNiazhTOERYSTJhTWxUdzRlVkNIa200cTBWN1dKT1FM?=
 =?utf-8?B?UU1CSlg0QnYycnd3TUFmV3RibnhodUpXdFlkTnNjNmY1RWxDZkNyYjl3OUFO?=
 =?utf-8?B?cDBFQXcvYnE0SitQMk9KZ0I2VW04ZlIvTTc2dGVPVUZxNW5mOGtUUTVMbmZ4?=
 =?utf-8?B?dEttRG9OeWxLaE5TVmV1T3ZkcVE0aGtldzd4Zm55VDU2U0M1dVJuRjM2b1VC?=
 =?utf-8?B?dGQyc0tqMW9xMkVWTk90R0dWZG9waEl6ZUJ4REJNbWxzYlF0L0RFQzlBR09R?=
 =?utf-8?B?YlZLVFJtV0pMaUdGdTI3dllCQ3ZUYkk5N1dxdkdFQlIyOC9xT1hXQzlaTXNF?=
 =?utf-8?B?VXNHNXJPZEd6M0dIUjFHbHlmZk84SnBlY21xa3JiTUV2Zmg3M2pvREd5WG8y?=
 =?utf-8?B?Q1orbzc2RHQ5NEgweFlJWFRRNERrdXd4bWhiU0pjbi9LcERlOGNNclVNTk9a?=
 =?utf-8?B?azFSNThRa3J4bnlkemw1eVByditDOWhkd0dPTFhGNTc4MjZMODFPTVJFMEZ1?=
 =?utf-8?B?dkZHNFEzQTl5Q05yS0U1WW9UejdZY3B4S0lIRnZ0TnpScEFKN3FFb1YvWHRX?=
 =?utf-8?B?dFM1STJRV1EyL0xwYzY5Q3F4N2ZpRllUVlV1cjZGKy9CU1lYdHVSeC9ET29a?=
 =?utf-8?B?MFhqcjlCQ2IrNlkzTzRBUEgwSmJjM3gyRjhnZXNDOFJFWVdsemZvTWJqdEp1?=
 =?utf-8?B?SXNNdzlERnRBUjJ4SW03MzVOTk5qNEp5WFdRb1FLazVlNXFLOXBpVnJMZlpa?=
 =?utf-8?B?WVBTa0V6R3N4dHB0aFFwU3d6S0JFWFdQYmgzaEFwTkd1bjV5LzRGd3h6L0RK?=
 =?utf-8?B?VFRqNi91VkZFTmNWeXYrbnBBYUdDQVdkUisyaENOMERJS3Z2UGJxUm9pTFRx?=
 =?utf-8?B?Y3NLZ2lhcGRQNGtKTVVqdUROM2c3dFYxWDhNa3EyZzZ1RXpjelpFbmRKaE9z?=
 =?utf-8?B?aWZQN3V1SklpVUMwOUtaK2JVTVRmT21WM3RiRnU2aVhGZHJVQ0V0STQwcDl1?=
 =?utf-8?B?WTdpbURKTUZVSm5SRWZBTFY1THpsZEJTcEw4RkI2SU5KS1Z6b1dmcXhUMWJJ?=
 =?utf-8?B?dkNkRkNRa01Vd2NTVWZXK3lDQ1NielFORm4wRWxhOEhIQkRIS1J0cWUwNFcw?=
 =?utf-8?B?a3d6bjhsY2VYOGgyVVN0bkhPOTcrOWNCd2xaK3UrTmI4UzMyQUhnd0k1eWJV?=
 =?utf-8?B?RExlUi9SdUhJUXp1Y3VVL2F5bldGenhsVythaFQvZlpPNzA5ZDVrZmEwbnl3?=
 =?utf-8?Q?vC58ifi1Ek4buYdeiV5a5aufHXhrhh7oI7Fi6um?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77828429-971b-4c8d-be17-08d9687b20ab
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 10:20:28.8967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hrCilkg1TuNO68uBt30aHQjurkVZTkHh8u7ZTBY8cmxwb+I4bvSyy86PoRAaVa8zR7LPmD5nP6u+upWKUYcdzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4384

There's neither documentation of what this flag is supposed to mean, nor
any implementation in the hypervisor.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/include/xen/grant_table.h
+++ b/include/xen/grant_table.h
@@ -627,9 +627,6 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_cache_flu
 #define _GNTMAP_contains_pte    (4)
 #define GNTMAP_contains_pte     (1<<_GNTMAP_contains_pte)
 
-#define _GNTMAP_can_fail        (5)
-#define GNTMAP_can_fail         (1<<_GNTMAP_can_fail)
-
 /*
  * Bits to be placed in guest kernel available PTE bits (architecture
  * dependent; only supported when XENFEAT_gnttab_map_avail_bits is set).


