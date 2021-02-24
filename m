Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDCB323F52
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 15:59:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89382.168305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEvdF-0002yc-SZ; Wed, 24 Feb 2021 14:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89382.168305; Wed, 24 Feb 2021 14:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEvdF-0002yD-OX; Wed, 24 Feb 2021 14:59:17 +0000
Received: by outflank-mailman (input) for mailman id 89382;
 Wed, 24 Feb 2021 14:59:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qs49=H2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lEvdD-0002y6-Vh
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 14:59:16 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b2d3c2f-00d8-41b1-bd31-4e0502369d1f;
 Wed, 24 Feb 2021 14:59:14 +0000 (UTC)
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
X-Inumbo-ID: 7b2d3c2f-00d8-41b1-bd31-4e0502369d1f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614178754;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Rpf1znQVFPhTHcaRs7o+3m6cDCMZV93qNeHGwUR0YhE=;
  b=SrT/dV9edx9wjzv+h0aNX8QG6AN7TSVGr9uWiJ34AQeuu0wU0CAvdvkX
   27d8Ui0QodsI/vMTM0xKVJ978zC7cRYZnYynjMe8ARcNgHLyBxHmyaoEl
   OLzdF46aI09JFpz7IlCH0zAmOfvXATWlcnzOIQLykaaYC9ag8e8k4rjfM
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: s9UqbJCjIOkE1FarCBae5hZLghFEiMB/fN0KVFLT3B0TEzar2DsfULfCxgfM3Db5i90J1wyKzn
 n3+6P06iQ5wSifT9XJWRB6a8QCGhmFEAHHLOyATcJSrEoTKnMFtxQGvosGpEhmagPuXFMQoYz4
 k8okRXAyT2PN+wghkEzwYZIxkrhhEbpIeIwcb/3e63fz/iteATY3nVQ7w6zMjFJXaPlyLzIkWo
 k1UL6HcNdpwqAuM21gVcDTGtZ7FxmeuYReimYRLjcQaeMq35wLhAxOyMTxfXOqppZYZn4ptXsS
 DIk=
X-SBRS: 5.2
X-MesageID: 39319449
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,203,1610427600"; 
   d="scan'208";a="39319449"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PhrWSopI9TxhxOdquol5Ln6Zs9ecjCSmlxmeeCzldOL0Qi/ImSOry/dCp7exD91C0WkQkz1w8c/oPsmEVSRAJKngEf8zHcj8bFqah753ozaKMjl3Ji4Tbn41qY5PAPQoTCWl52nNFgnowT4BYQJgAt2p9gk8kNmfJBKvrCz17eWv4jNHb+SanzVhN99y0knozp6mBxvvjCCpJ0WOymJbboChahwIykfTfSJK4waRl05ebJWGzZpq6sTFx0tg8em//cVRDEUNNNR41d4LAtY4Z3pjBp4yOrBOZOnqipSXFmvZY21Apknw7zK08hY7SBIhjPPItM84yASyITK7Q9S+pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzE9BQN1GctUAEq5FuaqiEyjrg9KDf9htA4nHd5lHYs=;
 b=CkAo9os4Lr1Q0w/ZdHbWX02gk4W5st4Rv4Te1xg+TnPe51WFDve9V4flTx9tlCMUGuVLcF1VIP1A6xuKyLsSj0YexeL4hZ4TSFFLfZqTJEeXzLchBa2t6d+5c49wzhx9k9P+N3Qekhd8v/QTNm9wyY/ZFExFVAJt6Q5tnHtiwW3lKlxNBXS42YQJEauuwBBQ3ArTDCIHNz6Wb9FNmYs8yOGizIfs98oJzQgkWZG05LESbSwnHCa60SJoc9fmzk4rdOnG8vAuzaLrPAuNGxFotbqHcHPb5k+QFgWQ3UfFzQ31nYUzX1VDqIph38GVJ0ClHMqYHCd/c+yluMW3CZbDqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzE9BQN1GctUAEq5FuaqiEyjrg9KDf9htA4nHd5lHYs=;
 b=Ptz2JIiM9fb6Yp6lL7a0UMsVaB4fwd3YaeZNVJ5A+0E+XlWH3cq1M7hP9mxPIWExZFN+A9B61dXtgyLl8pPctfClKbVeFileUQAFRAOzfXbI11jPglU1cZxikdv3RR9g1fsaomQMp62CTp2SuoxLZqKn28q19QdfUnajNJi1Kfk=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH for-4.15] elfstructs: add relocation defines for i386
Date: Wed, 24 Feb 2021 15:58:56 +0100
Message-ID: <20210224145856.94465-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0145.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1::8)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 045db8d1-ec33-4d4c-27c4-08d8d8d4bec7
X-MS-TrafficTypeDiagnostic: DM6PR03MB5337:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5337D860610253A4773AF58F8F9F9@DM6PR03MB5337.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4UtfiAF6jpTEEepSJwX4vwhXmWyNh6XfhBVAqIbqa2+OGIqh1Ayv3tpz+lXvLdBWNyjUAIgi2DsRzxehwpi9URxUncxe6edJ7t5FcF9JlDDY+Lt7dFmwzX/AxlTjOvE5wNX/TXm391bjwo0ETqYB+S5fUE4CcVTw01dNhT6n7APX2KzSdN40Igx063eNjx8tj7AtK+YmXdBRU+GTsZ+u3K+lsiQie1pHwKoyPXMMGy1voi44re6v+ZD68w+Cy29BhngMp5DAZh+Pmq+QCRK9bVdadGAZdwnDV1+OkBwblCpTuTYfQtgowTaePMvfCqjhK/T1tLgAS8pE0X2JvkcR9ZYQ9RvbBV7EtvCRlbuP+agoDI2r5EhvyTAoks13OJi3E2kPRNMeGAuwIWmZ7W+sgXrOsmOZaUCftg+ryAtBlac/phub8V5KnfXAR0+yZYQnJ+pGMAWX8UHUOoTvRjGJTXwtC06W/42Fl01PIv/RU5TbQ4OxtYL54qM5RjyT8iF5SpdngQElxFwBdTEvG3ctOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(366004)(66946007)(66556008)(36756003)(66476007)(26005)(186003)(16526019)(6916009)(2616005)(478600001)(956004)(6496006)(8936002)(8676002)(54906003)(5660300002)(86362001)(2906002)(6666004)(316002)(4326008)(6486002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ejJPTjhXUGFRYTY4dVFTQUJCaWxRZ0lWRGJRMjB1ZHRMUEJyUVQ4Wkh6UGxI?=
 =?utf-8?B?MURTeFQvU29HaGxkNGMwRUxMaFdobVhPa29VUUVmN056VlhhQWk0dVVEL3o4?=
 =?utf-8?B?QkkxTVRUcDNpZlpoOHdZYjFVd3pWdFg4UmFzYk5aOGlsMEVETUdBdnY1RTIx?=
 =?utf-8?B?QzRuVGtsVVZiZUtkK0RFUWRGNE8yLzM1ZmtIcjQ5Sk44Ynh0eGNsbHk1Ritm?=
 =?utf-8?B?YmFYNytSKzJGQ2ZDcWNNS3ZiRXBwOTJLOTQ3bWpIOUVaWnhxNy9kRWxkQjV6?=
 =?utf-8?B?NXV5YVZRMnplUUtteTBrWkdlakNxRkxzcTRlN3o2RzQ3cEQrWlVhbWl5RGF1?=
 =?utf-8?B?amp2SmxYOHgvMndacVh6VlZ3T20zZVlEeE5BckJybmF0b0ExSlhFZ3phNGhu?=
 =?utf-8?B?Y1diVU1mcWtTbmVXNzdkZFZrbTFhV0ZwSnFtT3MrbzhCc2hxY2xBYzVhVU41?=
 =?utf-8?B?eHJpemMxOXFMeDhHT1lLQ09aU3BQVjRSMzJueUZSQ1JURmZjWVpCWS9ZYlRK?=
 =?utf-8?B?MXhDWWFtdngraWZUMVBTQysrelRiN3orbEo3RUxzYXpaS3F0QVl2bWJJRlpB?=
 =?utf-8?B?akVKazdlN3ZGNXEvZ1JPNk5hNGRDYW1XR3A4YUlmaWRETk1JbVNYaXNmZ01l?=
 =?utf-8?B?aytGRjZNSlY3U2hlUjZ2N1JpQWhDSU5rcE1FcjlvbmVJYVdJNE8xaVNidWxm?=
 =?utf-8?B?WVg4OE94cS9BOUR5U1hXTG5ZaGxCdGNBQmJtM3BOT2MwWDJtdDFHVXlaaTV1?=
 =?utf-8?B?ZDhYRFNla0ZWQmdPaURscTZRNDN4Z3c2NUhUdFVITzU1MUwyb1RnazVub1B0?=
 =?utf-8?B?RHIvUHNFZ3VxVzJsLy92UEw2UFBTclc0KzFGM000OVVuUE52MldhZDdZb2tq?=
 =?utf-8?B?bUNBQUtaMnFzM3g3dk43K0hqUmZYTkVjWUZQeEFWaU91eWxEU3pyR0RUNkJ3?=
 =?utf-8?B?OTRSK3NmVUxHZWNZaERTV2JZOWwyTXZEeFRWT1dFd0hHNHhaWWhZSDFOaFZN?=
 =?utf-8?B?akZXZXVZMEF0cFB0MUdWeFJpTWN2eW1iNHRSNS9NcUlJOE8wNVpyUVlVbHQ1?=
 =?utf-8?B?OUJIRzliaTBOY2NEcXFHRElTY0dKOXNrVHFLZ3FQSFVhOW5MTy9KVE9hcnJE?=
 =?utf-8?B?TXlaR2hQbmphVmR2Yi9hV3hLQ2pDaDFEZm9KNWdobVEvT256cEk5bHpGcWJG?=
 =?utf-8?B?bGN1MC9oV2liV1NwTkRiSU5KSVVLNWxySC9JU3FaRy81NFVnNVV4bStQcmNP?=
 =?utf-8?B?V2c1U3BBc25lYTY3dmFMK1FQVzN5RzkwQ1BkTnR1Wmp4M2VKNHl0enF6Z2NX?=
 =?utf-8?B?d2J2Mk5iT2hZV3BWU1RVV0lrRVZ3dXZlREhyeXltNGs4NW1NdDFDeDNsaW9a?=
 =?utf-8?B?OUZpUmJxZUFCb1M5dnRQcWNxZ25POUwvRzdCYU1SR0drTnU0d21YMVlhZ1l5?=
 =?utf-8?B?d3Y3Zm1HRysrRTNxOXBoNWh6akpUWFRqYjVnQ3UxZGlhbzZNWW1salJuYkxa?=
 =?utf-8?B?bjRFaXYrQUh1NHhOVUMyeGIvTFVBOVdpWm85ejlIWlNHeUx2S2dqT29LaXQy?=
 =?utf-8?B?dmwrN2tFZ2hObmFXZ3RyemFGdnhDOE96QjNheUZ4UG5hWTB3dnFrWDdDZTV2?=
 =?utf-8?B?UXlFeWo3VmRnWGd1UUh6VFJFSkpjdjBzeDNFSk1laFlaUzl1cEpoMnhpbzVZ?=
 =?utf-8?B?amNWNkUxSER5N0Vybzl2SFlidkVwUmIrK2dIaDVhZmRZb21saUFOOWN5RUc2?=
 =?utf-8?B?STZQUmprQlp5NHdVaXlJVVFkSFU4UTJqOXVKYW9Zd2cwdkd4RElmTHA3VlJW?=
 =?utf-8?B?Ri96bmZyWnhRRzNORGYrQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 045db8d1-ec33-4d4c-27c4-08d8d8d4bec7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 14:59:12.0644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GAk/dqxPTpIaPYWxIqBnhzNpVkOKQEab4USmAzqJ/o7uYZAD1xkMIYNyqNd25UCCkYEP+VMqPKQiZprPwvddpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5337
X-OriginatorOrg: citrix.com

Those are need by the rombios relocation code in hvmloader. Fixes the
following build error:

32bitbios_support.c: In function 'relocate_32bitbios':
32bitbios_support.c:130:18: error: 'R_386_PC32' undeclared (first use in this function); did you mean 'R_X86_64_PC32'?
             case R_386_PC32:
                  ^~~~~~~~~~
                  R_X86_64_PC32
32bitbios_support.c:130:18: note: each undeclared identifier is reported only once for each function it appears in
32bitbios_support.c:134:18: error: 'R_386_32' undeclared (first use in this function)
             case R_386_32:
                  ^~~~~~~~

Only add the two defines that are actually used, which seems to match
what we do for amd64.

Fixes: 81b2b328a26c1b ('hvmloader: use Xen private header for elf structs')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/include/xen/elfstructs.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/include/xen/elfstructs.h b/xen/include/xen/elfstructs.h
index 726ca8f60d..d1054ae380 100644
--- a/xen/include/xen/elfstructs.h
+++ b/xen/include/xen/elfstructs.h
@@ -348,6 +348,9 @@ typedef struct {
 #define ELF32_R_TYPE(i)		((unsigned char) (i))
 #define ELF32_R_INFO(s,t) 	(((s) << 8) + (unsigned char)(t))
 
+#define R_386_32           1            /* Direct 32 bit  */
+#define R_386_PC32         2            /* PC relative 32 bit */
+
 typedef struct {
 	Elf64_Addr	r_offset;	/* where to do it */
 	Elf64_Xword	r_info;		/* index & type of relocation */
-- 
2.30.1


