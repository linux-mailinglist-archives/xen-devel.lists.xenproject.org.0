Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 271EA52A69B
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 17:32:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331092.554550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzAl-0005SY-T2; Tue, 17 May 2022 15:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331092.554550; Tue, 17 May 2022 15:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzAl-0005Po-Pd; Tue, 17 May 2022 15:31:43 +0000
Received: by outflank-mailman (input) for mailman id 331092;
 Tue, 17 May 2022 15:31:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PCXU=VZ=citrix.com=prvs=1296e7181=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nqzAk-0005PP-BB
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 15:31:42 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 714a1909-d5f6-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 17:31:40 +0200 (CEST)
Received: from mail-dm6nam08lp2049.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 May 2022 11:31:37 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BYAPR03MB4662.namprd03.prod.outlook.com (2603:10b6:a03:138::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 15:31:33 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.014; Tue, 17 May 2022
 15:31:33 +0000
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
X-Inumbo-ID: 714a1909-d5f6-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652801500;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=2CyyoyhSD+yVidyX9h0T5vWbSWRgRP0appvq5+iBRBg=;
  b=f0G6XxX2IJ9mgU4TEUBvH+7WFnp3VlpRDUhoGqbuIQ6IAlEQ/V262q+r
   pAkEXqE4MbvZZH+Tyv83m5ogfNVgwuAVdPsuhnW6fF02iR4uel/e1mlqQ
   lMrJ/wafWKVxkEaQKxQHdYQNcxQnibKeAPbAwClR/d4VFzYPoUDp+/1/u
   w=;
X-IronPort-RemoteIP: 104.47.73.49
X-IronPort-MID: 71507169
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:yjPMCaxqkBqjpDV414x6t+cUxyrEfRIJ4+MujC+fZmUNrF6WrkVSz
 mQcCjrQOq3bY2D1Kdx0PNi/9ENXuZGDm4RlS1dprCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX5JZS5LwbZj2NY12IfhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npljq7rV0QiGp/2pssabAZIMwFDHpN09+qSSZS/mZT7I0zuVVLJm6krIGRoeIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtacGOOWtLe03x9p7ixKNezZa
 McDLyJmcTzLYgFVO0dRA5U79AutriamLmUH8QzEzUYxy2X4nC5fgInpDMv2X8WOa8pux2Xbh
 G2TqgwVBTlfbrRz0wGt4n+qw+PCgy7/cIYTD6GjsO5nhkWJwW4eAwFQUkG0ydG7gEOjX9NUK
 2QP5zEj66M18SSDUd3VTxC+5nmesXY0e9dWCfx81wiLxYLd+QPfDW8BJhZKb9kjqck3WS1s0
 1aPltzkHxR/vbuNU3Wf+7yI6zSoNkAowXQqYCYFSU4J5oflqYRr3hbXFI4/Qeiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAtTA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:UKBclqhmB/d0izJVHGsfSpKlKHBQX1N13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQJVoMkmsjqKdgLNhdYtKOTOLhILGFvAH0WKP+Vzd8mjFh5dgPM
 RbAuND4b/LfD9HZK/BiWHWferIguP3lpxA7t2urEuFODsaDp2ImD0JaDpzfHcXeCB2Qb4CUL
 aM7MtOoDStPV4NaN6gO3UDV+/f4/XWiZPPe3c9dlMawTjLqQntxK/xEhCe0BtbeShI260e/W
 /MlBG8zrm/ssu81gTX2wbonthrcZrau5R+7f63+4kowwbX+0aVjUNaKv6/VQUO0a+SAZAR4Z
 vxSlkbToFOAjjqDxuISFPWqnTdOXAVmjXfIBaj8AfeiN28SzQgB8Vbg4VFNhPf9ko7pdl5lL
 lGxmSDqvNsfGT9dQnGlq31vitR5z6JSLsZ4J4upm0aVZFbZK5arIQZ8k8QGJAcHDji4IRiFO
 V1FsnT6PtfbFvfNhnizyBS6c3pWm52EgaNQ0AEtMDQ2z9KnGphx09dwMAEhH8P+J80VpEB7e
 XZNaZjkq1IU6YtHNRALfZERdHyBn3GQBrKPm7XKVP7FLsfM3aIsJLz6KVd3pDZRHXJ9upApH
 3saiIniYdpQTOQNSSn5uw7zizw
X-IronPort-AV: E=Sophos;i="5.91,233,1647316800"; 
   d="scan'208";a="71507169"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXecJZR8Snp21bqLVmZ/cAE3Iya0fbseCCkTH0jlsQ4XdFQL6gceg5HFtI4V3saq6bS2GJptf/ZTgCjGDzmZs72Hut93IIRCQIO2aRoAguwcXqscLrbdWRLsg6Z6orYItX5tQNSjnYa87eS0lKmMK3QUvpdo2gWZy7/xdoOgew8oamyr12cCwICs+eiAB2IabofYyIR+ND/UZ0dyvo+DXGagBQ6YkCXrBYIICWuNmCzdEsvyt8KYsE3u4o6h1pOGpozWn57I5MpXuJIxdpg8D/Le8hvcpG3OJvRbORiJn3d2lM6PVY2GqV369GqJjlLqZgv/VS9S2SWBxDbMiAjiMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RE8NR3CZplIH9Ch+tl7XBiIwHDlPpz9VsoHnquiTqD8=;
 b=QvCMtlpj7oLF04ibalXHO9+hk7zHwg2x2PZ5gs3+uApUp5bclJBjRWr2gzzmK2l1+332/cQplWrMvKupa6fynXcvOj6n/Y2+ewOG3/2CWVf0Tp/DRArwtVQR4n44Tkm0f4A/R+vmBEiaNUaX7TeDZEVnvvvifYvW4PVAM/yswd7w0sAz5Rri0J73FXRAw/tpxVxwLXp8TIlfTodTCe30j1/dOvr/gikIv6xOnhrBTDrJ1zRJNGQLFd8UrZlbdhqn+OJtl5w/dFGf1y85O7SarrDJHvntpVMbUR4nvxn263MCgPimqFwR4rQyXFl0AztoZj/05Kb4EZJ23lIUCkYWeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RE8NR3CZplIH9Ch+tl7XBiIwHDlPpz9VsoHnquiTqD8=;
 b=BGkRtxGuTHjuZlcGnHLLs2PowEC6Fzm4wKqkU5kS0B5Vup+45AFUDKZHobDnKnztFHm8tij4/KyUko/Oa4abXZXPgC1Qdj1TdDdG9uw4uPS5XH2BYPj8pQt4XGhteQU0sApkm8Cn9s2+TXy+S1rx1IjqzxuYRou8ocYb9e1kNgs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v6 0/3] amd/msr: implement MSR_VIRT_SPEC_CTRL for HVM guests
Date: Tue, 17 May 2022 17:31:24 +0200
Message-Id: <20220517153127.40276-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0031.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::19)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f273945-1aff-4d72-7903-08da381a5292
X-MS-TrafficTypeDiagnostic: BYAPR03MB4662:EE_
X-Microsoft-Antispam-PRVS:
	<BYAPR03MB4662964BABC28C99EE1659FD8FCE9@BYAPR03MB4662.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hEz5QK8WFDm1orXtyFl07QQvhnechFwUzcw1BYWB6eNEBSyj8wZ3t9Xgy4P6s45Xcu93c3bg2YT4zMMbzvcqXWIb773XHFnDyhYovT6MUAquu6n2CU4yL1UVmrcz41xswwFAse+2EHBoXSSmDMGF8HxaBNaS6nwd5JkRBmJ98iCTW3ImNR2ZEC5wdIZ2/SDfPpCO6f0y62yukCsuQVkC9b/uAsUbUT6kzQmdyqRJ/bpc5ubepyTtqrRFE7FMI/4K5u6cBcQr467xhErhlf3EyUjVBSYgw21H1js+issIeAX4Skkq7vL3ReJKRTaRVqapEgJh5q2akD/n5ERFcoJfFPhvknFZuGrvUKy9wxBKodnk2Aw2qqhLEcZ+2R6fOE1s/Qvt3xaD0WGJTBQfdXbZf8BJCI5K/fzv3UTtS3B7NFQhAe9R3YI7hmEbpSIu2TGO0uboRPlQ4XC/SI4VQfQWXxPBBzqTanXsPPKLNUdcQo9DgGkMQNMaggZMUlwWXXrz7nRlTYhRWcpP5kXxvqxdhNGeHmTjdV1dN6X+qxhUwoUdJHvkIWyB8fnbb3ZzxWnVKomR7xtxssBByb3lHPHbiu9BXTaVJQAN+WgxIR0XfJgSmSPSlhUSKP9xzn2YqWRtMxMwensHTlK3olRBLCZdsQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(6506007)(186003)(82960400001)(1076003)(508600001)(54906003)(6916009)(6486002)(26005)(6512007)(2906002)(66946007)(66476007)(8676002)(4326008)(66556008)(6666004)(2616005)(5660300002)(8936002)(83380400001)(316002)(86362001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1I0K3JnZjFOdUMvUUk2S1Yyb040UUt2c2tRTXM3OWJaS2JZODVIeDBSRHdI?=
 =?utf-8?B?K3RjM2ptT0lSMGl4eWFURzdPTFhOYVNDSkFpMDhYaGZ2cC9NZU10am0ydGlT?=
 =?utf-8?B?M3hkeDFBczM1RUlUbnAzdndsc1FwNndScUhVbnZSMVVPdGtPeXJlbVdTQ3Jm?=
 =?utf-8?B?bEFIUkJrc1ZHdjMzVk9La3dMOE9rR2VEVTlkd2lILzhkMm9vSkc1bEF1bUpx?=
 =?utf-8?B?Y3h5eVBiNUhhVDA2dTJ0aEFYSXY4TkRWamFZd0dKWDRYQy90cnZTUkFQaU1n?=
 =?utf-8?B?OTNaVE9hcHRpc1ptdFpJMmVqa2ErOXFGZStremNkRTl3cmJEcE5Sa1B2UUVG?=
 =?utf-8?B?L2pIeXQvUjR6MUR4a1loTEM1dnBaZ1VWZklWak03RUg0ZjR6UnZLUWdIKzlz?=
 =?utf-8?B?WDFOdkNhZCtrS1BkVkJnRTJWSmh5bkt3d3hOVXNkb1VUdklaODlCZ0hRU25S?=
 =?utf-8?B?K3lXaGNpdjVVVk1iU0taQ3p5djNXZmJCS1h5cDRNTC9BMTVUc3hDSmZwelov?=
 =?utf-8?B?WGV3c1NTaTV4c2tyUFVmTG9lNXhXSzN1aTYvZk9tRisyRURnRC9hNEdqeHN3?=
 =?utf-8?B?dzRuQUkxUWQ0U3doMFRhaG1Bdk1mVzlrL1VHQXBOOG0ySFhuV0FuNENncTF6?=
 =?utf-8?B?SG9aS1htTnJJbGkrY3VNWWxkcUtpdE1EME0rVGxqYk5qVUV6cXZlSGJ2QW9Q?=
 =?utf-8?B?K2RuQUJZSXBrTGE5bUYxYkdxRFhEZytlS01LNXdNUEtOcjMyRE5STWtvNnox?=
 =?utf-8?B?UnV1TnlKV1FBVm14MWY0cXJkT0RTSzI2bWpJRGVCclE5Vy9jcStIdDNKY3lo?=
 =?utf-8?B?ME5qREZ3UTJub1JKSEZGVUtkNFVPdVJ5QU9vTzBNOUdIOU1aVHBqQWd5QlBy?=
 =?utf-8?B?ckRkenZDQUdIN29RSjZzK1ZSSU0waG4rbjRrTW9uQ1dJanBXTDZpZWlQa1A3?=
 =?utf-8?B?czdLbGY2TE4xU0dzaHUvK01rU1lnalRoeU1GZStXbjVkOTdLQU1GNXZ0c20w?=
 =?utf-8?B?a3BkSDNacWJhNTFma1dVbDBid1lTaWJZbWZYZ2JBZVp6K2NscG9DdWpmMURR?=
 =?utf-8?B?THlOMDBRNzdpZGhBdzJkV1FjbXFrV1VHaHF4QTJSOW9yZ29sNEhwVjFaaVBI?=
 =?utf-8?B?K1MvNDhQeC8weTlDLzliM2llOHhnbjd1eU1Lb3NoZ0V4QnJodFdTdldtSTBE?=
 =?utf-8?B?MVJXNG9NUjQ0Z0tQV2xGdEJiNkxlMTMxQmJXNzdGRjhibGRWOTZzcmhJNkVD?=
 =?utf-8?B?c01ORThwdUFmTU9vcWFFNWNReXY5ZXVSbVZOVDlGZGEwWWx5T2hGWHhQcHlr?=
 =?utf-8?B?N2F6SHRkUTJUREhCQ1ZTTXIyZHlCRWdMRVd5UUlMMkZNUzlqams5OEJ0TlFi?=
 =?utf-8?B?WVdGSmZza2p2ZEFOL0wwT09XdmJHT2VHaFdmemJtc2tPVDNTTVhyL3J1ell0?=
 =?utf-8?B?M044cGRUN1RvQzhObS9lbDJnOHB6TlRkOGU4Q2VZQk5pajU2eWIvK0lMNEdu?=
 =?utf-8?B?RHhTWlNXU1RUcS9LUzlpWnFBUEZvL3lNbnJIVlg4QTRqNmpBS3RmeHJZMGZY?=
 =?utf-8?B?elB1N1hNb292WjBrM0R0cXIzdGxjYmxRc1FIS0lYTkNjS2x1MExIcTJBVlRa?=
 =?utf-8?B?VkRTOGtqTVMvYkcwZFArL0FrVWs5WlgwRHFGUHo4dXVDOExPbTd1dVhJL2NG?=
 =?utf-8?B?ZVlmZG4wRkt5My9iYjdxQjhXRlBqQVVlSmY2Sk9IOEpBQXVJUUhQV1ovdWNy?=
 =?utf-8?B?YXlTdDZNb2J0RlJOSkFtN25EL0dLeE5RanJ5eDRNMHBablJOaUNpM2EyQ0h6?=
 =?utf-8?B?eEVPdWR5cXRENGlxSmNSSm5EYWNZY3BHZWM3Y2RKdVJxdm5LWlVaVlJJRG1P?=
 =?utf-8?B?aHYzWEpRSVc5T0xnRndObDN6ZFJXR2RocUx2V1FoSkZsU0daMHZMVkFKTW00?=
 =?utf-8?B?SGwwS05jdWlSR0F3cEpUQU1RY1N0eUVjTHgxNitXcTBYRHh3TGF3ZjNoQzdH?=
 =?utf-8?B?SGJXNWg1OWF0cVprQXljenVTZXpxTlFMS0pvc3R4SStITjhHdlJjL2dmTSt4?=
 =?utf-8?B?M1UyMGtWOEhCQzBFZmEzNmtiMHlnN1pZalBQeHNCcXpBZXNzU2lacmF4YmYv?=
 =?utf-8?B?bWZFamtkQVBmV044S3dhcERYdmszVTBhNkRSSmZJUmFzNzZtY0c0ckZodENw?=
 =?utf-8?B?d0xwNVZmT1dHODQxOFdJS3l6TFpBUmRoaUs2Z0VnanA0RWpPdHR4RTI5bkVD?=
 =?utf-8?B?ZFNlY0tZSkdQNGVXdStoc0xxZDNvcUFsVFpVSHBYQzMvWXY3VEtKQThGaU0z?=
 =?utf-8?B?ZzJkR0lINkxETVFWQ1dOK2lPT0VrTU5GNGh5TXJZUWtGc3BWSHhJWUkyRERt?=
 =?utf-8?Q?y6jup8X5LgrkrUHY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f273945-1aff-4d72-7903-08da381a5292
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 15:31:33.4170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8iMGimg8I/q8do793OVuppJKR6HrAq45xC5vf7CnEPP5lG4hu0pXfFg7YMu/+l9IfiWmLpceqxjEhuCAfyo/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4662

Hello,

The following series implements support for MSR_VIRT_SPEC_CTRL
(VIRT_SSBD) on different AMD CPU families.

Note that the support is added backwards, starting with the newer CPUs
that support MSR_SPEC_CTRL and moving to the older ones either using
MSR_VIRT_SPEC_CTRL or the SSBD bit in LS_CFG.

Xen is still free to use it's own SSBD setting, as the selection is
context switched on vm{entry,exit}.

On Zen2 and later, SPEC_CTRL.SSBD should exist and should be used in
preference to VIRT_SPEC_CTRL.SSBD.  However, for migration
compatibility, Xen offers VIRT_SSBD to guests (in the max cpuid policy,
not default) implemented in terms of SPEC_CTRL.SSBD.

On Fam15h thru Zen1, Xen exposes VIRT_SSBD to guests by default to
abstract away the model and/or hypervisor specific differences in
MSR_LS_CFG/MSR_VIRT_SPEC_CTRL.

So the implementation of VIRT_SSBD exposed to HVM guests will use one of
the following underlying mechanisms, in the preference order listed
below:

 * SPEC_CTRL.SSBD: patch 1
 * VIRT_SPEC_CTRL.SSBD: patch 2.
 * Non-architectural way using LS_CFG: patch 3.

NB: patch 3 introduces some logic in GIF=0 context, such logic has been
kept to a minimum due to the special context it's running on.

Roger Pau Monne (3):
  amd/msr: implement VIRT_SPEC_CTRL for HVM guests on top of SPEC_CTRL
  amd/msr: allow passthrough of VIRT_SPEC_CTRL for HVM guests
  amd/msr: implement VIRT_SPEC_CTRL for HVM guests using legacy SSBD

 CHANGELOG.md                                |   3 +
 xen/arch/x86/cpu/amd.c                      | 121 +++++++++++++++++---
 xen/arch/x86/cpuid.c                        |  21 ++++
 xen/arch/x86/hvm/hvm.c                      |   1 +
 xen/arch/x86/hvm/svm/entry.S                |   8 ++
 xen/arch/x86/hvm/svm/svm.c                  |  39 +++++++
 xen/arch/x86/include/asm/amd.h              |   4 +
 xen/arch/x86/include/asm/cpufeatures.h      |   1 +
 xen/arch/x86/include/asm/msr.h              |  14 +++
 xen/arch/x86/msr.c                          |  26 +++++
 xen/arch/x86/spec_ctrl.c                    |  12 +-
 xen/include/public/arch-x86/cpufeatureset.h |   2 +-
 12 files changed, 233 insertions(+), 19 deletions(-)

-- 
2.36.0


