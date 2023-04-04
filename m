Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 245886D5900
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 08:55:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517656.803332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjaZ9-0005SP-GK; Tue, 04 Apr 2023 06:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517656.803332; Tue, 04 Apr 2023 06:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjaZ9-0005Pb-DS; Tue, 04 Apr 2023 06:54:51 +0000
Received: by outflank-mailman (input) for mailman id 517656;
 Tue, 04 Apr 2023 06:54:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjaZ8-0005PV-5c
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 06:54:50 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95647f52-d2b5-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 08:54:47 +0200 (CEST)
Received: from mail-bn7nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2023 02:54:40 -0400
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by BN9PR03MB6073.namprd03.prod.outlook.com (2603:10b6:408:136::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 06:54:36 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::a84f:cb5:8471:f9d6]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::a84f:cb5:8471:f9d6%7]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 06:54:36 +0000
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
X-Inumbo-ID: 95647f52-d2b5-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680591287;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ArH07A1EUAkuj+60F1scr9dgVajlc/cTWcd9aBlSjeQ=;
  b=JmT8lDx8wPZQctGL6tcEMG5a/TV8X0ruKDLBjYZZxwCz9PzJ2QlFvHeU
   mvbJoxrT5V/UcvgrjljY0fIz/FW2WhartS2EaMbn8xI+ezO7cFwmAfXGU
   0EZbM47QLQp3hfo8Ptxoz7GHRFny8ahSdmiTDRkFMcAQo8K//+YHhPMXO
   g=;
X-IronPort-RemoteIP: 104.47.70.107
X-IronPort-MID: 103591911
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:T9j1CKwilJj2E4hTMz96t+caxyrEfRIJ4+MujC+fZmUNrF6WrkUPy
 GQaUGjVPqmOYGvze4pyPt+190lQ65fTxoAxTwtr/yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRiPawT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KTtk9
 6YKJDkXVUrd1vmVyp7kbM9MuO12eaEHPKtH0p1h5RfwKK9+BLrlHODN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDCVlVQuuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiANlPReTpr6cCbFu75mIjKQY7D2OAiOCTtkm9RYNeI
 W4O9X97xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqC8p+EoDX0PjIaRVLufgcBRAoBptPl/4c6i0uXSs45SfbqyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CChRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:c+aU6qFj8E9bnJdVpLqEwMeALOsnbusQ8zAX/mt6Q3VuA7elfg
 6V7Y0mPH7P+U4ssRQb8+xoV5PwJE80maQFg7X5eI3SPzUO21HIEGgB1/qH/9SIIUSXndK1l5
 0BT0EUMqyWMbEVt7ed3OB6KbodKRu8nZxASd2w856ld29XV50=
X-IronPort-AV: E=Sophos;i="5.98,317,1673931600"; 
   d="scan'208";a="103591911"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FsQGmh6UF6kUpHKDpWLia9DgworWs6OeJhYo1iK70bO7fkzhz+Q5Z3XDVDN2Xf551BV7nIotu+AsumuoxJD9tYolvx6RMo+uTlU/SmM+cEgwMwvfugdvo8W6q3tTCzLeDmquyO5j0/cPnyHi5uFVwPVPGELufLTU8sbku2gbqlOWZh4F6DaaMB1lCfu9KwCZtEsp0z+o+JdSZtGGkGKipcLVX3DsmUl5KLOG4ak4/JutyRsQ5WMdATV3wkWX/jCBmjZpGdKFosl8akFdSAJ+Ms9lI1SQK3M6P+/EeNxHcBejxuWfnyob9fhx1jkzSEW98LW7evU4rBQKEWHHvD1r7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArH07A1EUAkuj+60F1scr9dgVajlc/cTWcd9aBlSjeQ=;
 b=cRhGkGwmUFUeOPtVCGdCImYC6hCUWyQlMyOJKpMxXpc0BXsp8SVUK90hzBJMe78Vvn//Zjv2oCqs6h+omZFbDqEGg6OV75ZLdNT2GOJLwnPYqwyYmcLcgo8B92qHpezV8ArLrIcTIAP4vVevnzm/BfZXZ4NnidCRvJrfbkLpoDL29ImMkq3muUsnaLBlWcaMpXWUukIqrI5PB7dbN/UukNANsFkw/09wCUtFPBz6XqYU/8+rDNpkBL6fM41/a2nolUpVIZK4p3QjmyB6Q7ujhrohGDF4Q7XoQTRju4kID4/nnsmJqv+MGaBJwxwvfy1lXn6qW03AQQ/EWLqskQi8Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArH07A1EUAkuj+60F1scr9dgVajlc/cTWcd9aBlSjeQ=;
 b=OjWO4DzgFETf4wNn4BC8O96LTe/ZqZxAX7z7etw1Z/CFASFjhus8iWL1iJfCJn9qtK1EAa9g0mqHz7/TQe2Bj4lr0/5+7B64QxxtkoFBR636e55yzTaSnynQo7UEUiRJ7AIoXTz2eczwlseF8ycMd95ZNXE4UE91QSwOYf88DDw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <38a2565d-da05-7a20-c144-6fb388b12716@citrix.com>
Date: Tue, 4 Apr 2023 07:54:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul/fuzzer: re-arrange cleaning
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Anthony Perard <anthony.perard@citrix.com>
References: <8353df4d-44ef-e39c-9a66-b6a7a73d5ff8@suse.com>
In-Reply-To: <8353df4d-44ef-e39c-9a66-b6a7a73d5ff8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0598.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::22) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR03MB3618:EE_|BN9PR03MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: 56e33d06-9eee-4cff-9634-08db34d973dc
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b3USi8iuzHrgn/meyW2oq9YRy+vxGZKHrwDJPk9EpjAjZ5LoQpeSO/ihiWpJwfq0ji5/3Es6TMKG79qSgYo3jR05vDrUjzNadRqS4xWPR9TDQYgjlDvo1r4iwAzmpHOJXiVvMENbVe0PtRq4IxGNXJ0UQRo7PBQHmkO8Nt/mSuunISjNM9tSx3ZrgKMwVO6r5sKDHx9cWwKZyDD2aXMssijaab4nMob1Qark2LhPAYZrypw8XXOs+Ws1ZOFClyxGzNFFIhMQHc9bStYzIAv+suIMzuz+ieJEvx3cbt/OeFVJ4jl2VhYzULlpr8cdcYiA5+6P7k41QyKayarCNDfHxLICEIndQFMUpbfV21ogxckcCe6NTVCFS+fYGY9rtmleseeQGa1neApKt0g9O/k95zzr8t1i3hylEICJsLMMD4vyjh99+jtFLoSS30DZXuqJ0N/4BWti1sodFPb5NXOjQ9GZ/gYf5TBeuZ4oRnalyXBTXlb4ryRKBWDE2sPLhvyLetJDaUz31DXkem5IhmQmpoZ4ZlBXMA7yr5Rb6oQ13ja6FgVCA+RyCk3gNW+q4KI8Z/DfP/oifqSv1pvWcf3wAM+bCOvn8SYvhkTbhCVVuT1MpZdsQIED3CHbMbePnrVW1lBW1WFzcspKpP9t1etJZg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199021)(4326008)(66946007)(66556008)(66476007)(8676002)(478600001)(110136005)(316002)(54906003)(8936002)(4744005)(5660300002)(41300700001)(82960400001)(38100700002)(53546011)(186003)(83380400001)(2616005)(6486002)(107886003)(6666004)(6512007)(26005)(6506007)(31696002)(86362001)(36756003)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUNuUGh6N3VWblVzRlJZakpMbjArYUJqcHd2TWcxV09VTnNrRnJVM0pGNDZv?=
 =?utf-8?B?Q0VGa3ltckJyMWkxWVV1YjZVNy9Wb05UemVyM25XWVBCbWJDOUdYTjRJbXY4?=
 =?utf-8?B?YUlDamxnKzFlaWtUOEFmZStLV3E4aW1OQVlCYnp3MEFzU1hoMlZyMXVXOVJL?=
 =?utf-8?B?TXBtL0hDQXZrQXFweU0yT1c1ZU1TL25SWHNWcFZpeFc1SkRqQVlvaHRJWTl5?=
 =?utf-8?B?eFRmdk1TNDZPL2k4enB4SzUvckppNEVqQXFkeE02RThwZnBHVE9SdXMxeDBP?=
 =?utf-8?B?bDQ1a3RWYzczMUlTSm9MTkFQZ3ZISWpvaTFHdmpzREJ1VzllbFhnU3VVeC9s?=
 =?utf-8?B?OS9Qd0pvY3hEcjZCWXFBQ0J0RmoxTHNWaUZsRFFGaWx1UzIwSUpEYXVrdlpJ?=
 =?utf-8?B?aWRtL1p1OW1Ud3AzQ1MyQUlObG8rM09pOW1ZSnNHZmQ3emlBa0RvNkluY1JR?=
 =?utf-8?B?ME1aeGF2MldZRGN6aklqZWwvQ2NoRjkvYWlvSU1POVNCNldZVmlvdEZvQjZm?=
 =?utf-8?B?WjE4YkFpdkkzTmlLQkNlaGhWemtWUEZyb2o3Y09ybFgwbm5PT2dUT1lsbXdl?=
 =?utf-8?B?czNWWUx4Ulk3RXJNdUFrVjFDZmNJUy9vNG83cGlQZnNsMURML24xWkRRYXFo?=
 =?utf-8?B?SVhLSXF0NTJVWU1YbGNqeFRUM1lhTlJoNnlqeVJ5TlJWVW95d2VEVGlTWC90?=
 =?utf-8?B?Y2t2NEZFeGxYMHdRU3VVYkk3OXgra1dzamxUSDVVR0NUNEdEbmtRWUpoOHpw?=
 =?utf-8?B?WC8rVGN3S0cvbjVNaHQ3SUVJYUdTTmhmMHlVbzQyaEhPNElqSlVQREIzR2l2?=
 =?utf-8?B?RlBkdHppRnR5SUkrVmlYVDdYUUc2WFNVSm1JZVdUQTVKcVpsOW1ieTlwcTZE?=
 =?utf-8?B?RTIvVVkzMElVY1hYMHhrOVpJVkdQM1NRcGVxZnpXczlqUnlJYmJWZzNNbEhZ?=
 =?utf-8?B?TWhXYTUwZFJESENYL0RvL0llVndDbW5hWDNQWjFHN3hENFQ3ZVpldVhYc0R0?=
 =?utf-8?B?ZVRveUJaQWx5WmxtTFU3UWJDendxVVpDUWJ6amV3MG8xbkVoRUhWcHZNT1Vo?=
 =?utf-8?B?d3AxQ1FYS0hIQUF4OUlJbDdIT3Rkd0pmYVNyZVVGblVGNUVVaEtYRE5Vc0l6?=
 =?utf-8?B?enIrM2pTL1RBbFVNMng1M2RJWkZXUlRPL3Q3VHd5bkdLV2ZRdlF4TmVEWHJy?=
 =?utf-8?B?RHh2di9venFhRDhmblE4NFpSZzl4ZjJiUktjb1Q5ZDBxeUdJaWJkb0pLREQx?=
 =?utf-8?B?a2lmUHQ0WUw3enM3Q2U3OHhSNEVDdjJTMTJ1QjFiMjRDQTY5ZUhiTE1sN2VU?=
 =?utf-8?B?SmluVDdGMk52aW9aTmc3WUF5UkNsRHB5bjRRdU80YldYdTNxU2VMd2dMdmNa?=
 =?utf-8?B?WDg3VFV0TG1IRmJTNHJxQk4rMHlwR3NqcEdUOHVSUlkvTUlZV1hpcjJnK0lo?=
 =?utf-8?B?UXk0enpXdWFnU1ZWZFE2TGxDQjRzeXNXSkg2T2JjYTNVV0tVUWFoOUhZekJN?=
 =?utf-8?B?elY0bFFDSU9nUDhjTTBpT3hRU1hGQXM3STlMNDloY21CV3V6em05NHRIWVZ3?=
 =?utf-8?B?dDZtOC9NRVljRVZLS3h4ZWZkQ0tUUFFodU1UdHo0Q1JSRXVxWk9QQUZCQUtL?=
 =?utf-8?B?aW5YbTdZcU1xUGN4MFV5TDNnNXpYQWN0bGd5Q2lrbGk3OURPZkFQL0Uxekp5?=
 =?utf-8?B?QzBlbEd0NW4zeklTeFdKTUFvVHIrakRJbmNKTDcwVG9KUWIrUVgxd0xQa2ps?=
 =?utf-8?B?azlWRVNmdDZKT1p2N0ljNTBZYWd0WmdjcG5QV0U3QW1xMUhzM05FNnZaVUQ0?=
 =?utf-8?B?M0w4YjM4ZDVLdmV0Und4dWQ4RHdrVXBxZUliRjQzTW9BUVN4OE1UVDNpazBJ?=
 =?utf-8?B?UTJYZGNsOFFHYmptOXNNdXgyY1k5UWdaSU9aTGdqbTcxRUNQRDJwblhkS3pL?=
 =?utf-8?B?K2VveHZTZ3RPWUNNancvTFEwNHB0Yk8zQ1FlL0xGcHh6eGdoN2daMWJlK2Fv?=
 =?utf-8?B?R1RtR0ZnU2JsVWYyQkhlbGM1VlBGVEhUbHJ1Q2NEcEdQRmpZNUFFR2xYTGNG?=
 =?utf-8?B?SlFXSTZ2TGJzLzUxaVJxNEVqUlNyNncwVlVoNHQ5RkdLZ3JHNmdWclBrUFJM?=
 =?utf-8?B?Y2VlYnFOTEVZV0RkR2h4WXRMRWdzakw4L3BIWkZ4UStndTg2Qkh5ZGdYVHI3?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ymHF7pS5/Ahdhc/uoLsjA6HK0e/Kp8LVLJUYohW1T+q+B4JS2yb23rQSpFpvcu6Xj8omYExAAVlNiMqf5XPVoXhsTAdif8PWzAx8VH+Cw/5PKqFU34gtvBhoEyEd5fyhIeKe/P8IKSkNcGxw5uvoQ4+wqIZUmUBekPih2z810zySCR45s6hv/4krr762m5nQOK+sQYy/+uppdNGVtLQF9Yz2oJj5Mkov43a3P7CHFNg3GSgemWPa36ythWAfuEavkVLXVBBKhQYzynWtmR1BSw13AQKuRUPFJE3bBYVLhfzgwZ06zrUsseDDRw6u9wfAn8zcF36f2ofYLx66jVnNpqfiNTZLL1tibqDjpPVCLdhfGswGEoJmwVzTedHirIpOraqHy7axF6BBHIouOoYPrL7FndZea8XIld/kFhzHfW7kwGF+kq8v5ILBgTsvKey5jCdc4Uke6Zeqx9Aasd64XRHIW8m1u7KQsZEgJEdaGkF9lacY5W8/q6C1Vbj7eSHHFt4yWidcwg/ek0cKhT+zkzQgfUZ86tgexmFyDGOv3kxD3wxYAQ9hQzIwm0n4GxwkX3QvRII7mQYpiB9OQnnukDcc22ymyDnykjawXeacL3czD9Ef0tsDntXrshf0f9eZ4pp/5nx4rIsJPZlGuLeVpF/o0iRg03C+iBbITHfI9cm0M6j4egT41KkAtDIfQsB+DYRauCZA73hfdNPAl6SR+cm4ElLOoPffv6iyCKl9TjhnSPXAkqdmZvqPFFWaorJcq06hVZMQvcClGBzA/z9W6neeL+C45l5y3cp0hp71EZDL55b+AiCRJHGhL5qaEEFv
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e33d06-9eee-4cff-9634-08db34d973dc
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 06:54:36.2061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B/sRLw5OAW5d/a3xHplBWEAMB17FEiY622J6ohTn1UBafI1vVkNcYkgthCMPVwb/cUMWsq+WsTjDm8PRC3OEfS5yhzjXly4qB76rgG+OS2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6073

On 04/04/2023 7:37 am, Jan Beulich wrote:
> The latter of the two commits referenced below converted x86_emulate
> from a symlinked dir to a real one, holding symlinked files. Yet even
> before that the split between distclean and clean was suspicious: A
> similar split, removing symlinks only in distclean, doesn't exist
> anywhere else in the tree afaics.
>
> Fixes: c808475882ef ("tools/fuzz: introduce x86 instruction emulator target")
> Fixes: 9ace97ab9b87 ("x86emul: split off opcode 0f01 handling")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

