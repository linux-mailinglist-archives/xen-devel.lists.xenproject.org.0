Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B294C63288E
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 16:46:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446737.702509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox90D-0003cJ-O9; Mon, 21 Nov 2022 15:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446737.702509; Mon, 21 Nov 2022 15:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox90D-0003Zg-LE; Mon, 21 Nov 2022 15:46:33 +0000
Received: by outflank-mailman (input) for mailman id 446737;
 Mon, 21 Nov 2022 15:46:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5PF=3V=citrix.com=prvs=31798088b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ox90C-0003Za-3L
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 15:46:32 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a98c8265-69b3-11ed-91b6-6bf2151ebd3b;
 Mon, 21 Nov 2022 16:46:30 +0100 (CET)
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Nov 2022 10:46:19 -0500
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by DS7PR03MB5591.namprd03.prod.outlook.com (2603:10b6:5:2ca::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 15:46:17 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::5c96:fc3a:9d36:4a2e]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::5c96:fc3a:9d36:4a2e%4]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 15:46:17 +0000
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
X-Inumbo-ID: a98c8265-69b3-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669045590;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=CSP00r10vQy+QH3m25K+YDlTWgiYvTP+Iw9w86WGZx8=;
  b=aZXOLGKT9uwMOegfL7JrSvi0SGzDV9gGct14zhPgYKXeUCckI7FQm0sp
   jesRdMSnfq/d7CxcKqRTBof3OMjxaJr4kYg164F9Gw+nvMJafkDmiNvGJ
   K1acZRcbtW94TeHhMZYVAgJwS+L0nqRREwM4t1ZQHbq51+kZ7zWEO4eq5
   c=;
X-IronPort-RemoteIP: 104.47.56.172
X-IronPort-MID: 87803773
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jQ38yqjtCTgdxr5m2d8XBGfZX161gBEKZh0ujC45NGQN5FlHY01je
 htvUGCBbqyIZ2vzKdFwYYri8UIFvsSBytM1QVY6+CFmRHwb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5QWHzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRHB24JQCGo196x0ZyfV883ipQfEvTSadZ3VnFIlVk1DN4AaLWaGuDhwoYd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEvluGyarI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6ROLorqU13wb7Kmo7LBsOdQKJheuAsk+vXexwK
 0wOohN2ov1nnKCsZpynN/Gim1aGtxgQQctNEMU17QiMzuzf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8oTy+NCcPJEcedCQESk0D+NClr4Yt5jrDVs1mEbK1ptTtFCvs3
 iuRqywjm7QUi9VN3KK+lXjnjjS2t972Rwg6zgzNWySu6QYRWWK+T4mh6Fye5vEZKo+cFwCFp
 CJdxJLY6/0SB5aQkiDLWP8KALyi+/eCNnvbnEJrGJ4isT+q/hZPYLxt3d23H28xWu5sRNMjS
 Ba7Vd95jHOLAEaXUA==
IronPort-HdrOrdr: A9a23:aSbnYK9/dfzun2u7mUBuk+Hwdr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZtFnaQFrLX5To3SJjUO31HYYL2KjLGSiQEIfheTygcz79
 YGT0ETMrzN5B1B/L7HCWqDYpkdKbu8gcaVbI7lph8DIz2CKZsQljuRYTzrcHGeMTM2YabRY6
 Dsg/avyQDBRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirCWekD+y77b+Mh6AmjMTSSlGz7sO+X
 XM11WR3NTjj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhn8lwqyY4xlerua+BQ4uvum5loGmM
 TF5z0gI8NwwXXMeXzdm2qi5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 F29lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQFo+dY7bWfHAbIcYa
 5T5fLnlbBrmJShHinkV1xUsZiRt7IIb0+7qwY5y5eoOnNt7Q1EJgMjtbAidzE7hdIAotB/lp
 r52u4DrsAwcuYGKa16H+sPWs2xFyjERg/NKnubJRD9GLgAIG+lke+/3FwZ3pDcRHUz9upFpL
 3RFFdD8WIicUPnDsODmJVN7xDWWW24GTDg0NtX6ZR1sqD1AOODC1zJdHk+18+75/kPCMzSXP
 i+fJpQHv/4NGPrXYJExRf3VZVeIWQXFMcVptE4UVSTpd+jEPyjisXLNPLIYLb9GzctXW3yRn
 MFQTjoPc1FqlumX3fp6SKhL08FunaPiK6YPJKqjNT7krJ9R7GkmjJl+WiR94WMNSBItLAwcQ
 93PK7n+5nL11WLwQ==
X-IronPort-AV: E=Sophos;i="5.96,181,1665460800"; 
   d="scan'208";a="87803773"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XK2PO6CwsCA34lnFmsv//6goMteX+h3dS/8wPp22QRVN/NvBEk8i/4ntjII8YX6RcJ23YiIqeZKHYNMhrXXaG4Oti29oJabC3EB2rVJU2TObb2BVxiJBR4NHu830OLRTDDDp+p2PAbR5s176UE33gu0IKVTPFKnWpsAKUVPMWcmeiUIMVUqgNYC/nvJd4q5GlMaSgC45TIovXyDgvR8xN8kzG9gS3SyHyX+5d76Tv5qfVZwOmGi8FUrZAgRF9sPr4MC0MWL0dvQYCptaz83CIkimYOOGpt4rRUTlO8UNXleqjAlyr4VFkKmBqvbJ/XypLF2PgJRZr3UBaCM4lRTGbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSP00r10vQy+QH3m25K+YDlTWgiYvTP+Iw9w86WGZx8=;
 b=DVRXzyLLOgIjkMjHY2u4wdtRwROmJkofYmnKgzb4dELOm4T/0H5oIlS7x1iLYFvcfgKxnbYN7g3FU2DpuKpQC3PxV/2aDKV3YdOXNO4KaT+ZEICHp4eStc5apzV4Xf/3kEVHLK5t3R15PSSH5Dt+Ls9T61EG+SLShUDz6W/xICJADqIZuwa5DgXdeKMZDlEJ13FNRlzSSP116Dpso+uQdh+U1sYISZsvNpcUJOwq34GU7k+BsrJG8aFjbrqkY5eX2r7GPWL19EPHasNamm7cwRtvfGCxlw2z7AvWXKi2tGKtG39HQ/kFgPSf5MR7F0GLESzR4reCWOFngFkZNjjcvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSP00r10vQy+QH3m25K+YDlTWgiYvTP+Iw9w86WGZx8=;
 b=NSskk8+11UynLjBcG302/3XR9jDxvcVKb3qI7660dcTVt9ITAAnDrOPFKGEdwBtLA45y68X8YWphWlpAahi05gRKP3t6zfQiXSxOd9+AqXeRtWZTDoeDJtPN4YZw9T5z4XSwzcwgb2dZJkEFVcd15QTZ/tlmo+6Nfo7AF9ZHmrQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Daniel Smith <dpsmith@apertussolutions.com>, Henry
 Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH 2/2] xen/flask: Wire up
 XEN_DOMCTL_{get,set}_paging_mempool_size
Thread-Topic: [PATCH 2/2] xen/flask: Wire up
 XEN_DOMCTL_{get,set}_paging_mempool_size
Thread-Index: AQHY/bbRnyNjpAguUkKfWUCja4W2UK5Jg4kAgAAB0oA=
Date: Mon, 21 Nov 2022 15:46:17 +0000
Message-ID: <9a302c19-4f07-77a5-5e41-310498c7cf23@citrix.com>
References: <20221121143731.27545-1-andrew.cooper3@citrix.com>
 <20221121143731.27545-3-andrew.cooper3@citrix.com>
 <CAKf6xpto_4KPH5K=vXorAK0_e483qE6RRu1ioF7pRwh8TBGjaw@mail.gmail.com>
In-Reply-To:
 <CAKf6xpto_4KPH5K=vXorAK0_e483qE6RRu1ioF7pRwh8TBGjaw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR03MB3618:EE_|DS7PR03MB5591:EE_
x-ms-office365-filtering-correlation-id: fec1c9c1-1e4c-4307-ca51-08dacbd7873d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 81/bYxPjiJXVLAhIDNpu/f3mBZxXFsAwWBS66h+eQBFWt7za53b2FekSFumaGOCIPGr2uA6NbTzYZLW5j6/WO7UTlDZ/Z4kZvDN2YrGr5LMNdzcZZB1CGNCDQ3L2hcnwOpF9Nstkhj/dhyTGpW0xMLM+2InEuCqnPtcVrFJ0ylViaiVnZEKN5iVYvYGJ7D2aKyXO3iQqE2B+SILJArqX2ufHmcRRHCyzZUjEs5vkOcsP5p8FJlYc9M3SfZ7fo6Cxc0cWU05lJAUwDTtuqrYAT9er1l6ZnaefoY5g9/nUsC6ulB3rq60pXsvDe7VK0/63sU+hRIkKD3XkM411dAC8XjjiMy4lfmfaRbjXIEXryXW446ZqQMDjhdywri7drE6033J/Aa/MJIBEprYp/XMLfW2QKSBiN00VuBny+2Oh8sG6IqvV09gj45G4uGzXqXU7fBVCT2exJZXRJBuv45+3MlpxLvzcrOS3L8t4KwCS26d3ifXDXN4jRxdvSCueIXP/1V8bXMMwDhqALsL8ALN9GQ5prbfUkeBbRVewgMLoa9UzvuOsP1QYgJNwnMfDCeWUtjcGvWVuUk9XLuZ2ghBs6vLS2HetiHesnjWf2xGvTS++G8HqvW/SkywHXd6AMJ+GOFqM80xv3YATCi+sN/6dvJeOjdxEMRHxY04Kn4U3C9F+UUoYXN6pRcwexpBptYq12gSwFSYJRkllkglC+YhHQ0i/cjgl2QaE/vktgfc1n/pjy8TXCz5cUr2CJ92anGkf7COP6GytykqSWCRpGHJhYg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(451199015)(86362001)(31696002)(36756003)(66446008)(4326008)(53546011)(41300700001)(91956017)(76116006)(66946007)(2616005)(66556008)(66476007)(186003)(5660300002)(8676002)(8936002)(64756008)(6486002)(71200400001)(478600001)(26005)(6512007)(316002)(38100700002)(6916009)(122000001)(54906003)(6506007)(38070700005)(82960400001)(83380400001)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UU5kYndpaGUvV0NzTzJ3WnQxUmtVYld2QUZUbVJtdno1VDgzS1M5dFFWdVB4?=
 =?utf-8?B?V0J6K2VzQmlJWkEvY21rQjJRYzg4Z1Q5N3E4SWUvMjNua2llTUZERlg2ZFQw?=
 =?utf-8?B?bFZmUDFudU1kVGtrOW4wWjRJd0V5NXBUdnVjRjJsMEgrV05zUGF1aVVqeUVu?=
 =?utf-8?B?cGlOWmF3akZJb2ZIMnB2aDFpOWIrZ3pTaTJsVEdObEw4TkhkeXV3UTdYd3Zk?=
 =?utf-8?B?Q3BvMU4rV2xRRXp1WkpIODNXTnNqUUo2UGh0NEgwbXlZQUM2Z3BYb1Z3V2xK?=
 =?utf-8?B?Z2trVUlXcHN2ckdEeXJMNi9YTXB1UHlxNGJwVjF0bEpmZHk1eWR1MTJ4d0pI?=
 =?utf-8?B?MGx4UXROWFRveFU4cWdJeEIzUXNqTW5POUV1NWZOQiszby9tL3cxMUhmSVBv?=
 =?utf-8?B?QVJMajhob1VYL2lQN3Y0QXp4QVJHYlY0Z3RUa0plS2V3V1J6Q2FUZHZ1RnB3?=
 =?utf-8?B?SVBpZVJOam1VZENud0dRcERUQVE2R0JQamtpbllhSVNBbFpWYWJlbTQ2eHg5?=
 =?utf-8?B?VnczTXpFRUFqSkZyQ0ZoT3FtYytHV2Q3dWUrR2dMNis4a05PSlBVTjc5eW80?=
 =?utf-8?B?Q0JJcC9FN0dHa3NIR1VNblVCQkZZN1JCVGhNVTlFVW9ERlJldGpqaG9Tc2dI?=
 =?utf-8?B?RVpVc21RQVNNTlFUSEl2dVFJRFlwVWo2SVB2TkpDdzFTUFFta2tHVlhOZ3Ra?=
 =?utf-8?B?KzVUWFRJKzVqcmpMRFFsa1VCMmVMNkJRbnpuK01Jc1U2dkwwRkhhOXV5MUV5?=
 =?utf-8?B?dkRlUEd3dFFqeFZyUXlvdHJtSmE2TGlncnlRSGNiSjk1OEFpMGFLVmdUdE8v?=
 =?utf-8?B?ZFYzZUxJUWJhTnl1Q3Z3dCtSR0dEaHFwNHBxWjllU3VuOWZCMHEwYkpydXZN?=
 =?utf-8?B?d3NyZmhLQTMxQUxzQ25Ec0JqUWZxR3ZmcXhZanNEVnNYSkFXa3YrK0NPSkpN?=
 =?utf-8?B?cnNDbnRRdGNCcGN1NGhBY2k2dEtqOThTZThJV1Y1SExKbVJIb3BpQWp0WUt3?=
 =?utf-8?B?SEJDWUl0dnNlUExxOUlKZ3JjblFFVlFzbEFmblQ4c3ZzRmZMKzFGeFoxV2Nw?=
 =?utf-8?B?NzF1MFdCUlpPT1BLemhkR3dzbTRhczNSaDRBUjErYVB5YTNNNkMxYnd1Vkgz?=
 =?utf-8?B?NVd6MDJZV3RiOHlNNFJkTHdlRFhBVFFDSFJxbDVjS2FYajdzck45VVNKWDBY?=
 =?utf-8?B?RWt4TUtrRkpTSlFJQkdnZW9ZaldZa2RhYUp6cU5OT0JhVUJWVWptMDFGZnlw?=
 =?utf-8?B?NjN3c05tMFJkY3hJc1pwcGw2alpYL1pWRURyZ1JyQnA3cTB5M1kxS0dBUUY5?=
 =?utf-8?B?YnJxaGtEakpNdzBONTYrbmYwT2pkaHVEOVk3ejNEWDNEOUw3R1lLbFlkQk82?=
 =?utf-8?B?OS91NkUrRldTSEYwSDZzYXhjZWluL041dHdlZnVOOVE5aWdVdTQ2L2R6Z3Jj?=
 =?utf-8?B?Z0tvSWJ6TzVPdFhJMWhMZHdwSHIxR0h1RkdPTjZkb0Q1a3BLWWtRNDg3RFQw?=
 =?utf-8?B?b1R5VDlLaWNtajlmNXJRZzRWSGNZNlNQeTNhak9rZFdkTFVWaC9hZThRRU1J?=
 =?utf-8?B?b1ZqSVFBQTFmTFBYekVJZmxPSStyS1l3RXNtbjlSVFVXbzc2WHpBMTZya1Ux?=
 =?utf-8?B?eTBlb2JLVFdJTW4rN3h5SGYxdXZZb2F4S0pxUmhDSGh3WGlNYmVIZFJIaDhU?=
 =?utf-8?B?MW80cmQxMHhNNmlpejBiTVFVRDdOOFB3KzhHU0EycHhnRUdBS3hiZFVOQkFq?=
 =?utf-8?B?UXN6T1hSM3granRvT2IxZ2p1Z3J5TWEweW4vRExSbmh1aWVqemVOd1V0Rnl1?=
 =?utf-8?B?VDlIbEpkNXhMTmF2M1NtWlo0SXViVDV6bHJmekhVckJ6bkFPTFpvQ212UVlX?=
 =?utf-8?B?b0ZBeEFkekxteGtlZFROWk9TVWxVK3liclhsZ1poMk9hejJYM0VoRC8yb3Q0?=
 =?utf-8?B?Rm1vQkREWXhqUGxIeElaSUtQdXhDRWJINHFrL2Z5bVdJWUtjRi8rWm15cit2?=
 =?utf-8?B?OENLeEIrbjUxbjRMTU02RDgrSHFYVWxxb2JZNlNVd1I1YVlINWNzbUMvNUc0?=
 =?utf-8?B?alg5Ti9yTTgxclRIK1dmWXVmamhYSmFyY2tEemY4VmtxQ3ROVUZXNUtVWTY5?=
 =?utf-8?Q?vfInAbCb8Rw+ezXpDT2j0vHAw?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ECE0EE7DB62C934F93DFC7AE4304B773@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5KNeeR/roirT/4uxJPEbxaEkkkVfw6dZpT/RI3sQNlJ9qFTlqbf8mPVTkiqdT6A+QTwkWwpnPE56arUZi9nzYd1c1XPKgpv2QWm0PNljFKS2oaYNmSsW924KTtqnhILoBkFVqXSmhHIvRVT1TTeorcSwXfdmkqLNYoSOyv24ZH84JHTZDKNWNXSORND8G9gTUxVneoaTdvJMGg5Y93Pec0cIlgpVWAyhc2+ZqzmusNBJwwfpInYFHsoB2KKqClY0LmP4IV223ny0PejNgok4UrfVttICY7/ZwxTh4XhiyCLPWfPvLq2QRLGqLAoEAEHvk0wvRGdu9oXdFOOktjvT7B7K0UVFTPVy8Ts2L7Kc/GP+auIF3NNiApA2Rd7rWWKrOZQNnMBGwvjX7WGtgXMyaVvg38oO91gfUOoYDl18mWVUASPgoj7SVLJ3t+tqwvDpZctl8aY/ww+DgLK/n8F9hT+ziITl2IiRfjPsvLYs8aCWEootWgIyW2DWpdQ6H0axE6XuwW6zKihZKF6E5DPDED2g40X8uHyNVMmwuTjE1PO81tL/bES30bh9tTrQ0e2UQlqm8BqsZ2ZudDEMISYSaoEpvbTGO1516Xyqc4d/ZI7PV9zQOHVWABQRqW11JhJ8sAabb07XBT4QGmisQVyES0Kj7OIdjKpQv+jvINEEDR8dtTPfQjmGMH7baUb8teoNeQztE+Txl6QloEtDKADjiN6UHjJWWPFsyHl195Qi0aiEP4FZVeE4S/hU0t/9H0Bw+gKYaHGnGQf0dh4kNkq1I+aQWIoQMrfzjjA4bQfXMZJgROauoPCXpaxBiblnn7yV5fhU8s4y6ir9Ld7z/Ecu9/BGec5Hy8vG5THHk5LZt6EXmgAzqjw9LCllNpnhf8kZB60HTuKerI3wLtsfjSaUgavCWEfD/fij7Cg1/co1yvs=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fec1c9c1-1e4c-4307-ca51-08dacbd7873d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 15:46:17.3102
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EM29rwrRZNXKKiMYatBxzjEY5Vuw3RBTO65HLkrxuZGPx8BLnb7Aao9gf3AAQWoR+QPKEWWYQ3zFwUYEp7OklxdIWtn59MLL7c3L7q+RicA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5591

T24gMjEvMTEvMjAyMiAxNTozOSwgSmFzb24gQW5kcnl1ayB3cm90ZToNCj4gT24gTW9uLCBOb3Yg
MjEsIDIwMjIgYXQgOTozNyBBTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPiB3cm90ZToNCj4+IFRoZXNlIHdlcmUgb3Zlcmxvb2tlZCBpbiB0aGUgb3JpZ2luYWwgcGF0
Y2gsIGFuZCBub3RpY2VkIGJ5IE9TU1Rlc3Qgd2hpY2ggZG9lcw0KPj4gcnVuIHNvbWUgRmxhc2sg
dGVzdHMuDQo+Pg0KPj4gRml4ZXM6IDIyYjIwYmQ5OGMwMiAoInhlbjogSW50cm9kdWNlIG5vbi1i
cm9rZW4gaHlwZXJjYWxscyBmb3IgdGhlIHBhZ2luZyBtZW1wb29sIHNpemUiKQ0KPj4gU3VnZ2Vz
dGVkLWJ5OiBEYW5pZWwgU21pdGggPGRwc21pdGhAYXBlcnR1c3NvbHV0aW9ucy5jb20+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0K
Pj4gLS0tDQo+PiBDQzogRGFuaWVsIERlIEdyYWFmIDxkZ2RlZ3JhQHR5Y2hvLm5zYS5nb3Y+DQo+
PiBDQzogRGFuaWVsIFNtaXRoIDxkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29tPg0KPj4gQ0M6
IEphc29uIEFuZHJ5dWsgPGphbmRyeXVrQGdtYWlsLmNvbT4NCj4+IENDOiBIZW5yeSBXYW5nIDxI
ZW5yeS5XYW5nQGFybS5jb20+DQo+IFJldmlld2VkLWJ5OiBKYXNvbiBBbmRyeXVrIDxqYW5kcnl1
a0BnbWFpbC5jb20+DQo+DQo+IFRoYW5rcywgQW5kcmV3LiAgVGhvdWdoIHdlIG1pZ2h0IHdhbnQg
YSBzbWFsbCB0d2VhayAtIHBvc3NpYmx5IGFzIGEgZm9sbG93IHVwPw0KPg0KPj4gZGlmZiAtLWdp
dCBhL3Rvb2xzL2ZsYXNrL3BvbGljeS9tb2R1bGVzL3hlbi5pZiBiL3Rvb2xzL2ZsYXNrL3BvbGlj
eS9tb2R1bGVzL3hlbi5pZg0KPj4gaW5kZXggNDI0ZGFhYjZhMDIyLi42YjdiN2Q0MDNhYjQgMTAw
NjQ0DQo+PiAtLS0gYS90b29scy9mbGFzay9wb2xpY3kvbW9kdWxlcy94ZW4uaWYNCj4+ICsrKyBi
L3Rvb2xzL2ZsYXNrL3BvbGljeS9tb2R1bGVzL3hlbi5pZg0KPj4gQEAgLTkyLDcgKzkyLDcgQEAg
ZGVmaW5lKGBtYW5hZ2VfZG9tYWluJywgYA0KPj4gICAgICAgICBhbGxvdyAkMSAkMjpkb21haW4g
eyBnZXRkb21haW5pbmZvIGdldHZjcHVpbmZvIGdldGFmZmluaXR5DQo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICBnZXRhZGRyc2l6ZSBwYXVzZSB1bnBhdXNlIHRyaWdnZXIgc2h1dGRvd24gZGVz
dHJveQ0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgc2V0YWZmaW5pdHkgc2V0ZG9tYWlubWF4
bWVtIGdldHNjaGVkdWxlciByZXN1bWUNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgIHNldHBv
ZHRhcmdldCBnZXRwb2R0YXJnZXQgfTsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHNldHBv
ZHRhcmdldCBnZXRwb2R0YXJnZXQgZ2V0cGFnaW5nbWVtcG9vbCBzZXRwYWdpbmdtZW1wb29sIH07
DQo+IFRoZXJlIGlzIGFsc28gY3JlYXRlX2RvbWFpbl9jb21tb24gd2hpY2ggaXMgZm9yIGEgZGVk
aWNhdGVkICJkb21haW4NCj4gYnVpbGRlciIgdGhhdCBjcmVhdGVzIGJ1dCBkb2VzIG5vdCBtYW5h
Z2UgZG9tYWlucy4gIEkgdGhpbmsgdGhhdA0KPiBzaG91bGQgZ2FpbiBzZXRwYWdpbmdtZW1wb29s
IHBlcm1pc3Npb24/DQoNClNvdW5kcyBsaWtlIGl0IHNob3VsZC7CoCBTb21ldGhpbmcgbGlrZSB0
aGlzPw0KDQpkaWZmIC0tZ2l0IGEvdG9vbHMvZmxhc2svcG9saWN5L21vZHVsZXMveGVuLmlmDQpi
L3Rvb2xzL2ZsYXNrL3BvbGljeS9tb2R1bGVzL3hlbi5pZg0KaW5kZXggNmI3YjdkNDAzYWI0Li4x
MWMxNTYyYWE1ZGEgMTAwNjQ0DQotLS0gYS90b29scy9mbGFzay9wb2xpY3kvbW9kdWxlcy94ZW4u
aWYNCisrKyBiL3Rvb2xzL2ZsYXNrL3BvbGljeS9tb2R1bGVzL3hlbi5pZg0KQEAgLTQ5LDcgKzQ5
LDggQEAgZGVmaW5lKGBjcmVhdGVfZG9tYWluX2NvbW1vbicsIGANCsKgwqDCoMKgwqDCoMKgIGFs
bG93ICQxICQyOmRvbWFpbiB7IGNyZWF0ZSBtYXhfdmNwdXMgc2V0ZG9tYWlubWF4bWVtIHNldGFk
ZHJzaXplDQrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdl
dGRvbWFpbmluZm8gaHlwZXJjYWxsIHNldHZjcHVjb250ZXh0IGdldHNjaGVkdWxlcg0KwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnZXR2Y3B1aW5mbyBnZXRh
ZGRyc2l6ZSBnZXRhZmZpbml0eSBzZXRhZmZpbml0eQ0KLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNldHRpbWUgc2V0ZG9tYWluaGFuZGxlIGdldHZjcHVjb250
ZXh0DQpzZXRfbWlzY19pbmZvIH07DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc2V0dGltZSBzZXRkb21haW5oYW5kbGUgZ2V0dmNwdWNvbnRleHQgc2V0X21p
c2NfaW5mbw0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdl
dHBhZ2luZ21lbXBvb2wgc2V0cGFnaW5nbWVtcG9vbCB9Ow0KwqDCoMKgwqDCoMKgwqAgYWxsb3cg
JDEgJDI6ZG9tYWluMiB7IHNldF9jcHVfcG9saWN5IHNldHRzYyBzZXRzY2hlZHVsZXIgc2V0Y2xh
aW0NCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2V0X3Zu
dW1haW5mbyBnZXRfdm51bWFpbmZvIGNhY2hlZmx1c2gNCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHNyX2NtdF9vcCBwc3JfYWxsb2Mgc29mdF9yZXNldA0K
DQpJIGNhbiBmb2xkIHRoaXMgaW4gb24gY29tbWl0Lg0KDQp+QW5kcmV3DQo=

