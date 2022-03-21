Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF09C4E2638
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 13:18:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292971.497577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWGzA-00023L-Is; Mon, 21 Mar 2022 12:18:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292971.497577; Mon, 21 Mar 2022 12:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWGzA-000218-Eb; Mon, 21 Mar 2022 12:18:08 +0000
Received: by outflank-mailman (input) for mailman id 292971;
 Mon, 21 Mar 2022 12:18:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=svEr=UA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nWGz8-00020y-Pi
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 12:18:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f61a7ccf-a910-11ec-a405-831a346695d4;
 Mon, 21 Mar 2022 13:18:05 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2055.outbound.protection.outlook.com [104.47.6.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-oweyiMXSNiCOh5d1DcXNxA-1; Mon, 21 Mar 2022 13:18:04 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB7172.eurprd04.prod.outlook.com (2603:10a6:208:192::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22; Mon, 21 Mar
 2022 12:18:02 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 12:18:02 +0000
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
X-Inumbo-ID: f61a7ccf-a910-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647865085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WXUmL9mZ76koIaO6/3JB26WR/49aL7U2RGhqqkaJdks=;
	b=StWFAOC8Ll9Kzv+9VN7vt/TNFkkNXWY6/0j52Xl1Ny5uRYlxVxMH4VrtY1HRjwf8/plPiv
	96FMkZ8bCUcHpnEosHUIXLjDmEHYZiojxqBYHtmoxMsUcNOZXQ+s4U79NdDITwvgMHXV8+
	TAT+lkRLm5t0I2N4Bg6hFsdSiZMH4Q0=
X-MC-Unique: oweyiMXSNiCOh5d1DcXNxA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNDVnbB2l/oiJA/jdpV/xPxhQ22f2lkCaq/JNDwWM8Au5ljQvkz+8WctXw46pR/JndCP+9vxmZHIjJnGfylvYwbwIPvtS6XpR9gPlCdLvKkhpIL8X/iBLvMstfIMC2LD4rmRVOGgiLohL6axvd9ODjEgDY7TTBWdM/Wy6V+o/rCDzUzjY3iEj62MKD6B1YziVgIw8G/Ro16sDaHWbXRkSA5iYZh7sXht0iDty9rHZ9vK6xYtRluOBYoIwIa1xG8m0rzAjK9kPxZ0/6yBWQdr6k5PVcJVrAEWecUNb/Yx/akYCP6nLJmcllQOGvORAgT+mZG0CcADPJr0romfpeobBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6tQhpL9z0HU8nuGi98oFA3JXsdCwVQ+YrYf3WhVLK4=;
 b=BbfRN3ocPoKGK3gYBy1r0Rvp1q3OIRtcsN27cJhOQL3TuYyXtozXDc5Yc2gDwf/CH9migSOg7pR+FwojyWm6+//R378/kFuJaOaFXbcnvw07Jzp0J7KVivbfw2nD7HzraaeojAb4aYSZb432gv8HVeYbAqlAuHmAfQ+LdIUQ5UkHgO02gc+LAK4UBRf6bxmnx6FBoEVD2/yWEXIQaqeNeXx3E8Qnc0eq3UMs6yLXKuOqskPoMTfcL0fEtE42dtEsvbDl5F+x9JPw5cweACKDeFgdcfsZyjFoaoyF+oKDHn2l9UZkqRbDfTY9KcsuxPtM95hsAAD6rxeItDLvLQkvqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9060ac46-3985-086e-79cc-17aaf1141774@suse.com>
Date: Mon, 21 Mar 2022 13:18:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] x86/build: work around older GNU ld not leaving .got.plt
 empty
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>
References: <057172d5-437a-347b-b5bb-d102b6b37f0a@suse.com>
 <YjhoPeWWj2B0Kcts@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YjhoPeWWj2B0Kcts@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0245.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::13) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 000b9cd3-1124-45d6-210c-08da0b34d862
X-MS-TrafficTypeDiagnostic: AM0PR04MB7172:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB7172F8C7A648D2C14C1BBB07B3169@AM0PR04MB7172.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	44HwXuIDsWUsH1shPPCjhXnod5SSmxk9Fb37w7lAW+U6ZNLXpEu4A3R5271EY+0JPPgzZ+jCH6EIqgxr7G7R420heYUE/Xh/CdCyDzDKMbOmVJKez10psGnktYZd01mq0Vlh1EaQMrs/jvDhxkBZIjdQGo3yRMQGyreEsBjnbIptdGDjYDCYb9MzegESH8UOV/B+ILTa6usltLhxdjPwR0IJ2D7/Ug6UfFapwXb/7LvyAzRiGfF1eiPZtxCXm+zEN5pS67uOlfzy/KbrlBnoiIbl4n0/5zaEWQaeOP+IULiCRa8qpKAgsGiQh0utxt24VAUcmSyzzVFhCK9ipbLDAnEv9a/pQ9Y2EVJFRGGwdvbKZfaP/yELJtWw4uQvMWWRp+mobgvEgwW4mlXH7ZVvp399EOselQiqZkkuhtb8Zb4OUQuKl1H1eo5WKxK5Rb8xVB1m/kNN++EhgZ8N+v2F/dD0Sqlfuj2ZXwlzN1nNdRfUe3GvwgDv8JKpRLN9XrIdQKxiVNiYIBPx6PqA85aVP917K3BNLRMCIMfKh+Nrw1bMIEcrZ07/gyd4jJKNqzDXRcoPbkcAKUV3eW4wOefoAhFcakG3Wokz+iBC65dCJGglnkpMmwErLIQ8lzw+8QJobohN42HKCLb17rE9huE/A4hS+4u17JSBpaPcOIcgsoAKNL83A+Lzxx4x3A1WKckgG5wLxPXyH3f6QzLUDNOvRcKpVsFE+3NjpV+KsMZy2XL6D1bUeVRnKUQTFFs68MCnVtnuT7cQDLWpzs9kLNPcjQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(86362001)(186003)(31696002)(31686004)(508600001)(2616005)(6506007)(66946007)(66476007)(316002)(6916009)(54906003)(38100700002)(6486002)(5660300002)(4326008)(8936002)(2906002)(4744005)(8676002)(53546011)(66556008)(36756003)(6512007)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zY68dXRA5bvj+ulc7/CLTBlz4ma/LsLpbLYylVmjzjHBlCTHf07Y54pWGHw8?=
 =?us-ascii?Q?ypdm2HjN6ZO09HNQwQ3eXCOQT/LP0+putP1FBQWthi0tLSRPz4ppYYe5Z7Kc?=
 =?us-ascii?Q?i2eenr+PwXc7oziffXXV4fURqI32ODZU5uRkTh+tM3nhX8HIKK58rk3fv8H2?=
 =?us-ascii?Q?LSP65AfCClF9hGeG+JD+kpgUuLCx4JGlVSTbJH63pp6E82a6gli6a1Sq1R7l?=
 =?us-ascii?Q?cxBTEIoQoSwytJrpn/FMW5N/KIvjCGJXeENn2eB7e/qB4dam82jERMDL0WL2?=
 =?us-ascii?Q?0Io8bNq5OxyOxmeY1sDo/W3s15CUCxoDxUPeVpH+aSJl96FltrUQoed0pum7?=
 =?us-ascii?Q?HtL1/qcKS8n9eD6VPekjN6jlSQZlAalXE5eYaA6IcmrovWHYG0FpRzDcCuEK?=
 =?us-ascii?Q?GMJvRSh7HXABLcJ9IeqZ1NjvwslC8yIfiDuFsJrE7V/lsEca8lAccoDpDOTo?=
 =?us-ascii?Q?+aJCTYojOH06beE2cnXpcYaxPaTBtS5VAFNAvFrNWGx0dA4cuyLzt+txT0J/?=
 =?us-ascii?Q?/RDJsQ76tW3CvwMmnncwvKlplX//x+JRWFtIRz5f4/RCg/ji6OT76gBEPxHi?=
 =?us-ascii?Q?m5AywjKjWpWP2vIOAgX55TroZjxA9j7T2z5NaiDXb27UaA97NkRe557vc3H8?=
 =?us-ascii?Q?D1y4uBKUg4l098TrNQ4/Z1ZPcPbB0GidzG9Tn2yjZlqnQFVNPazG15XkxSW/?=
 =?us-ascii?Q?PYpjcouhAi3MMIkEmxmplG3grXv8Cqg4V77vfpRQ8JrEvHD4qiyc6mOF5MZA?=
 =?us-ascii?Q?7M+jrz5M3s4qQeLLyA6mESbzU4xGGDsP5RHGf+BIVwnJKpkJLC0BefagM5Rc?=
 =?us-ascii?Q?xpq9VjdlbPMp/Ol32Sz32BO3DJeI3p6KSmf4iok95pbz1/Kp4HUKQdvktM0m?=
 =?us-ascii?Q?iyZTUO/IsRRny4goG7iPFnoEGMXX8V5smRW6ebnJVzN0T3odo9dSuuup7S8L?=
 =?us-ascii?Q?LEZYrzvKWpzT9n805epkK2SLglCddDt2QbQClmApVnH4iuMl00AP2lgRLc3R?=
 =?us-ascii?Q?OB7QhK3/e+WT0b4vUEtiP2KDblWJYAqPVImQr47/bvtJVwJl6k0N/LdTyNUD?=
 =?us-ascii?Q?u70uXZz94whrda/6iMNolGBrxviXH/cnFnnqUcjm14iQ70d0RjORTgHmTu+4?=
 =?us-ascii?Q?uHHkCHwDX2LYKe+GAOT+kVXy85SZYxkypvWRQs8i3coLBNZLuTJQeontLP38?=
 =?us-ascii?Q?GYFMz4GgHO8gbarFROhUju1iQXAbvvk/VxbwFrDmlEmR5Rd8cnxrx/v+mBPy?=
 =?us-ascii?Q?2GhZCOoFFaWIKASKW5uaLadMV/WcANkzLvGtSiEvu8XYlHoNodgLZ4yEnfMD?=
 =?us-ascii?Q?qV/fhuSbdUbheQUv1ASlfEaNqqLVe8PlgARuLa6Whp7Bq0xExTKm9j3N9WRh?=
 =?us-ascii?Q?+E44HCcMawjSJ38ZZ7jHF37Dq3dYRhkB5VINq2Lp1eouutWWSJI5I6PcJm7i?=
 =?us-ascii?Q?BDRhpZZztXY/cJSEm1np6iopRwxadQmK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 000b9cd3-1124-45d6-210c-08da0b34d862
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 12:18:02.4267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xBWBkH3xAzsA5OFboY14UC1/50vc4c4uGpWs3VhzRHhdLptnR08GLlHkMa9oija8LI9JYJeUHyPKfcnAOKerWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7172

On 21.03.2022 12:57, Roger Pau Monn=C3=A9 wrote:
> On Mon, Mar 21, 2022 at 12:46:54PM +0100, Jan Beulich wrote:
>> The initial three entries in .got.plt are "static", i.e. present
>> independent of actual entries allocation of which is triggered by
>> respective relocations. When no real entries are needed, halfway recent
>> ld discards the "static" portion of the table as well, but older GNU ld
>> fails to do so.
>=20
> Do you know what this 'static' entries refer to?

I didn't take the time to look this up, and I don't know off the top of
my head.

>> Fixes: dedb0aa42c6d ("x86/build: use --orphan-handling linker option if =
available")
>> Reported-by: Julien Grall <jgrall@amazon.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

Jan


