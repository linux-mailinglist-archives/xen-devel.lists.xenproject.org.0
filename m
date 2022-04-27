Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F64B51153B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 13:20:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314917.533201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njfhr-0001Fr-Hu; Wed, 27 Apr 2022 11:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314917.533201; Wed, 27 Apr 2022 11:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njfhr-0001Ca-Eo; Wed, 27 Apr 2022 11:19:39 +0000
Received: by outflank-mailman (input) for mailman id 314917;
 Wed, 27 Apr 2022 11:19:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ll0K=VF=citrix.com=prvs=1097e264f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1njfhp-0001CU-9Y
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 11:19:37 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9b61202-c61b-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 13:19:34 +0200 (CEST)
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 07:19:31 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MWHPR03MB2782.namprd03.prod.outlook.com (2603:10b6:300:48::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 27 Apr
 2022 11:19:29 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 11:19:29 +0000
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
X-Inumbo-ID: e9b61202-c61b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651058374;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=t+i3Novkn8tMp3ysrMO4pnR0fLCcf0RVPYOCY+xohWY=;
  b=iZPAGonIwSFylsm7WjGX2zwhZXhD/0vG7GL0gp7toCPjYMHyqVg7+PPu
   ItlPDGJP4hZJbS5rbk4xykTSKrmtVQNp0iCiH8dafPtnikjWeInE1TNSP
   nDFU4a+GkHCr0Pzau1d6a7g8HHGSMQknBxaTR1SplpAQHqRxPeRm33yOr
   0=;
X-IronPort-RemoteIP: 104.47.58.103
X-IronPort-MID: 69429414
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Pypr3qrX71Vqep9u8Jw3tlq879VeBmIfZBIvgKrLsJaIsI4StFCzt
 garIBmDbv2DNDH0eo92Ooixo0sGucTTmNYxTgA4qys9QigV95uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvR4
 42q+KUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBI5DsssU4dwtkMzBjJot49+XVHSOhiJnGp6HGWyOEL/RGKmgTZNVd1sMpRGZE+
 LofNSwHaQ2Fi6Su2rWnR+Jwh8Mlas72IIcYvXImxjbcZRokacmbH+OWupkFjHFp3psm8fX2P
 qL1bRJ1axvNeVtXM0o/A5Mihua4wHL4dlW0rXrL9PZtsjSKkGSd1pDIP/+WR92sZf9Wh3SXi
 z6d9lv1GQMFYYn3JT2ttyjEavX0tSHxVZ8WFba43uV3m1DVzWsWYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiGGAlg4RXZxXCeJSwAOC0K3P+C6CG3MJCDVGbbQbWNQeQDUr0
 hqFmo3vDDk26LmNEyvFrfGTsC+4PjUTISkafygYQAAZ4t7l5oYukhbISdUlG6mw5jHoJQzNL
 /mxhHBWr90uYQQjjs1XIXivb+qQm6X0
IronPort-HdrOrdr: A9a23:fWcrOqMKhjn/wMBcT1P155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq6z+8P3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtr5
 uIEJIOd+EYb2IK6voSiTPQe7hA/DDEytHPuQ639QYQcegAUdAF0+4WMHf4LqUgLzM2eKbRWa
 Dsr/Zvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolSs2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4RE4GqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUITwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+KZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUB4S0LpXUd
 WGMfuspMq/KTihHjPkVyhUsZGRt00Ib1m7qhNogL3W79BU9EoJunfwivZv20voz6hNOqWs19
 60TJiAq4s+PvP+TZgNc9vpEvHHfFAkf3r3QRGvCGWiMp07EFTwjLOyyIkJxYiRCe41Jd0J6d
 78bG8=
X-IronPort-AV: E=Sophos;i="5.90,292,1643691600"; 
   d="scan'208";a="69429414"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxT88RWJNaAwQXsd0sRfhcuCU8iCj5+HBviiZSKzG8mvP+ngW0Sfe9RAMJqHHkjsWnxEyvKAq651IgkeVRR4weRZxPO9JtETTQhM4AOGCezdC3u51KvAMqGAAEBVnQ1+EeDL4tWKK+NoubHJaihWCSytMTouGVRQOBoZD+bimfgug2sgRi0ND9QtY+P0HV+ZxpM0zd40/XBG8c8ot0MLIY78KzG59OpmKxOX0jC0EvK5WTBob+Jpbqk4WKjwgTm3rNxy6gWf8WrGO7LmosOTrYqL0fmxF7nLuNJOSQNkQVNEtL1ISKXl0r1zNi0ekUn948fnDQ/doUyMHepkPltQwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXyimPO8GqWMB0c+fniYlSrLe26pCV/voCpPA6FK4u8=;
 b=Tpl6oHOS9hQ0nY472LSVHepbSGI+PPyuCDJLCp9nryNekcVPrkw7wCtWLigyKKQ0ArgpA2IXp/haar6wyrCJQykyDKlzYmVwMpgwIBXp7dGgPauJfxEfgYQCBP+T/N1sLaPGl6WdJwtOKgkmQnMNyayuq2Bdv06vm+oCYT2RucmNRAIr6dHg2Nmqvj2FdAqmWbOMHOeqp+UOjtpBfXhd8uOCYL14rzzZvXgJvlRAIg6xtkuTzMoLbS53U2x7IZImId17aQT7+OFvzl6wDToPmieU/eG1E3aswyb0ARLJFzXfhWf0/xKZcvUrXQmzQWlMOgXUMfAnLyPBeBjHyLMZxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXyimPO8GqWMB0c+fniYlSrLe26pCV/voCpPA6FK4u8=;
 b=E4Cs0ykK18ygsOB0l6ZNx7UJWl3veBz7ym+yFKPFgRpKgEBIFRE96wsoojSXiRCvxm9KJjxCtb//vvIgTHo6FoASS2waYzPll9rtTfuGZL87rFO31tDayGarp3YDIwaiAg0Hf97wlaoMAOa3/CM6chXUfOQfpc3MNS08fv+TNFo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 27 Apr 2022 13:19:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3] x86+libxl: correct p2m (shadow) memory pool size
 calculation
Message-ID: <YmkmvrE5jTQN2cFj@Air-de-Roger>
References: <81ba388c-66ff-e191-0098-2f88a004105c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81ba388c-66ff-e191-0098-2f88a004105c@suse.com>
X-ClientProxiedBy: LO2P265CA0097.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c30ef4f9-8913-41f9-e4e0-08da283fcbcc
X-MS-TrafficTypeDiagnostic: MWHPR03MB2782:EE_
X-Microsoft-Antispam-PRVS:
	<MWHPR03MB2782ED7610738971A68CD6668FFA9@MWHPR03MB2782.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PbxlNXtY2/pKiZ2S64rxKTRjY1slNiCnEM4Qs9cqE64WVNOxLRL5Raa7UvpDS+rkK4HGpsWiz7pJYNWxH5SSu160ApeIg9nzVqwIL6OC9c9Lxy9o8BZBrcQZYcDVSa/meBErp40+IrGdFQpR5EzE4SreGnwPT+FXieZ4NGcp5QMjwDPJbVM2wUsLdR1g4PIrGCOehyW89dksdoI5ImgK+UxdERNSyAYyu1waCa7rLxknifDzhTYFU91Qzgbh9TwXL+jtelqq2v5B33istLASPLwn03EW/jUsn7MxrcY6wFNQBL+IjYTNuhQVSMQvjMFfriHwZpzxUKOOJAwlYnyTlZRMZuPR4fHAjZbFFf7+TvoQgFvqanraFRtBYMgboBldLznpbNFCzDToNBMh9ZDw5vu1fvZBaMY4B0gr4QbkHjU46XAmOkE1EuPadxn2bZ7qvOe/PMD+eqIajZJMTBUgvx9LdPC826R82t0HjzPlQuh7EBoz4u0pk0/19SmRc1jX1zr0LvJMDytVg2L6NcrZr+H4KSsxhTcB53GzSrf/QS4QArJAKagiQZLKAuXCyzWocp7hnKoIDOy9vgW+lcR77yxamfYfn2SDC6gQDrogrAkpCADCYdd2CKJB88YtxFxdOGvpUToBCnrDdFKS18jxAw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(8676002)(186003)(66476007)(66556008)(66946007)(4326008)(5660300002)(38100700002)(6506007)(6666004)(26005)(6512007)(9686003)(6916009)(85182001)(316002)(54906003)(86362001)(6486002)(2906002)(33716001)(82960400001)(508600001)(4744005)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXRMUjUxZzdpMGt3aXdEZkR0d1NOUUxVTUdZQXFPeXpBbXhrZ0t2YVZBS2pD?=
 =?utf-8?B?eGM5TDNWR25helhaOUY5YUt3ZnRNeVIxRU9LQUdGR1hmZ1BBQnJhMm1qT3pE?=
 =?utf-8?B?bkwwUHkySE1FdkFpQkpJd2ZQT1ZPL1J2ODdQKzBwV2svNnltUndMREYzemt5?=
 =?utf-8?B?V1BIVjZYdzB5QTI4ZzZzK0pvUnZ2VllWMXNNak13SWVFSGhNTjUwTDdadmZX?=
 =?utf-8?B?S3hnVnlNaXhzZnNRdkVwSkhtbDAxS0Yxd0FQdE14RnZTWGhqSG00RDdVOGNQ?=
 =?utf-8?B?dk5tQ0pQNENHVHpQVnpzTUdmZ1lyRjJ0dWdWSVBxcTJtRkwxSC94R0ZvY3Z4?=
 =?utf-8?B?akUyQ2ZWVTVwWGllWVhxRi9ib3JFNDhPMFR3RFpXRGx1eExjUXZwN3RMbW1I?=
 =?utf-8?B?WHhiY0IrRlNTWVB1NGpmMzhubTl1R3VabTVZYTRJYU1XaWJWdGxDMnNkWVND?=
 =?utf-8?B?NnVSLzNYWlRrc1NEdjd4ZWk2YkcxM3cydG1FMU9Hb2VOMTNpRFY2cXZ6NXJT?=
 =?utf-8?B?dS8wRXlRZndLRUM4YTJ6cGlGbFpUY01NWXJXVmd6S0RvaEtSMEJZQXcxMEpT?=
 =?utf-8?B?SFN2TXorcEh5VjlZZWpNNVJzZlZzOHZ6ZU5iOWt4aG9nNyt3K2RYeUNSMDJX?=
 =?utf-8?B?U1ZkRXczUW1wek5iVm9kSmMyQnBqS3pEazdscFk4WVByYkhjK0hnSUkxMlZj?=
 =?utf-8?B?V2EzSFNwbmVENEVtOTdBQ2ZMY0FEM3IvNjE2dE9TcHJDTU1CSE9jUzFKelF2?=
 =?utf-8?B?c2trbERXOGd6N29oNTYvYmtoeklncFJuSUZnMldLelFiUUJNd2JhMWltc3k1?=
 =?utf-8?B?dzVleE1iaUQ2d2xndmloODhwYzM5anRzWk5uNnUyZUJ4WE5zbFh5dFRybVBy?=
 =?utf-8?B?Q2xodHVNVjBEVUhwdGlpemVYN1p6R1d6dzFBc0pKK0J0bU5kZUVLbkljd24z?=
 =?utf-8?B?M2lkMFRYdm9JWFJoSnNYVjN4L1VFbWEwK0xpcXZoZVR3UTlkS3NNUHZueHpX?=
 =?utf-8?B?ZUc2SlRmM0FvdGh5cXhHTjZZY0puVzF3Ni9vMytBZkFRZkVBckpzZUJIRCtU?=
 =?utf-8?B?OEZISStBektrQTFLOVlnNGJBS0Y2SVNVbGh0YkZMUlIxVW51MnVsUk0rSDAy?=
 =?utf-8?B?QnE2UUoxQmRTQjhDREJuQWJIRm42WGhGSzQxSkZEUkRKeWVoU3VsRFRWa1pY?=
 =?utf-8?B?UEhpcFNJL1ZiamFlQVFUODRSajFocU90dkdZOGg4VVovSDdWZnYzRWNCUGRx?=
 =?utf-8?B?T1NBMklVVGc1MGZxZ0ppbjYrUFBaRnBIN2ptbjJXa2Z1MWU4YTJUc3ZqckZD?=
 =?utf-8?B?ZWEwbVhwSHAxdGM5UjhjdVBKcXNRMi9oRGNmQ2dYZnhORjhENjNWWHJYQWdk?=
 =?utf-8?B?ZDJrWjBSckxxREpiaUtON2JGUFZvR1N6OFI3czhjYmF0a09tVURNZmpWNnZS?=
 =?utf-8?B?aUpIVm9kL2FBb3ZhWndHQkNtejRuZUFGWnJycE1CRXlMYlY2M3g3UmJTaXkx?=
 =?utf-8?B?NTBETkszWU5iRzJyVEl1YVhNbUNESllIdWRJN0hCN2YxWjV0dXA5aG1NSmkw?=
 =?utf-8?B?bnAraW5RcnRPUXoydmN5OVM4YW1FWEY1QnVyd1dBTERIR2tucWhDR2hrd0hG?=
 =?utf-8?B?UjRkV0JNZDVyMVFyblpXM2hBRnBiWmNqRTVFYVFGdGNnUStLYlUrTmpKUEdr?=
 =?utf-8?B?NCtjZjBUd3ZlRGNlOUkyTTk4U0llK2FhVE4wcHhoRlhhRnJZdlZ2TTFpTisr?=
 =?utf-8?B?VUhoMmlrVTZDbUpNeGpwckZDTDYzejd1bVpEVlhSL3pNODN0TGFFb2xKbDVC?=
 =?utf-8?B?Uk4zemphMnA4aEQ3ZjV2VzZKQ1htTldOam92M3p4R3IwV1ZnS3lOOHczTjFH?=
 =?utf-8?B?NVBhVWNIblZNSlJoTk5YMDFGUDJDeEFHVkFtWEdlUEIvai95VzE2SCsxanYy?=
 =?utf-8?B?Z2pEaGFBWTZNSENvbm91MkErVGFvYzR5b1VXL0RsR1l3eDFVL2NrNXhrak1W?=
 =?utf-8?B?anNRTWoyQjlZQzhIUVNFK3Q2MkJ4cFhERHZmaE9Ya3FjYWQwSUp5OTNKWjJB?=
 =?utf-8?B?U0tnMVhmN2p0My83K1R4RmViNGhtaGtPWFRXMXcrTVZuUk5jZzFrcXVHQmFR?=
 =?utf-8?B?MDFWR0F3Vld6UXlvdkdCWDZkY2VyakU1Y0x5V20rajVvUVJTdGNFdXJIQTFu?=
 =?utf-8?B?SVNuS0VhNG9MNlBnZHdTUElBZWc5MVJjNUhBS3F2V3NHamNQckdwNSt3Sm9s?=
 =?utf-8?B?N3UyMDQ2TWIwMVQvYjFDb2tTMHlGNUtrQnBDblg4alk1SUtSVW04cEF2TDdZ?=
 =?utf-8?B?Y2hzZTVKRVhwSlhVRDlzMnE5NGpXbnQ5bzRlOHB0SmN6TzA5NXhValpVYWhK?=
 =?utf-8?Q?yXw1o4D+CMuTkElc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c30ef4f9-8913-41f9-e4e0-08da283fcbcc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 11:19:29.4537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +dJx4A79vh2ajWMQ06yU/WoMttTGmlbck9s1KRiLRlRtHipAsm3SpUfJWBcP5cYlwvY6TPYu2yOhuQOezSiIKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2782

On Wed, Apr 27, 2022 at 12:57:17PM +0200, Jan Beulich wrote:
> The reference "to shadow the resident processes" is applicable to
> domains (potentially) running in shadow mode only. Adjust the
> calculations accordingly. This, however, requires further parameters.
> Since the original function is deprecated anyway, and since it can't be
> changed (for being part of a stable ABI), introduce a new (internal
> only) function, with the deprecated one simply becoming a wrapper.
> 
> In dom0_paging_pages() also take the opportunity and stop open-coding
> DIV_ROUND_UP().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

