Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BD57636DC
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 14:56:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570454.892251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOe3S-0002Fa-7U; Wed, 26 Jul 2023 12:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570454.892251; Wed, 26 Jul 2023 12:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOe3S-0002Ct-2C; Wed, 26 Jul 2023 12:55:50 +0000
Received: by outflank-mailman (input) for mailman id 570454;
 Wed, 26 Jul 2023 12:55:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CD/9=DM=citrix.com=prvs=564dce665=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qOe3Q-0001jo-FC
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 12:55:48 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc57d75f-2bb3-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 14:55:46 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Jul 2023 08:55:44 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BN8PR03MB4964.namprd03.prod.outlook.com (2603:10b6:408:7d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 12:55:41 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 12:55:41 +0000
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
X-Inumbo-ID: bc57d75f-2bb3-11ee-b242-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690376146;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=CRRrGtlxVDsayUpdf1CxS8gHCC+pHA7DUrtuAZHECHw=;
  b=APQL3qW8wrnxALyZpCcOz64xkfy0W6CgIlTVdsm/mP7CqlS6EOYYfye+
   R71A9/eWgoMfPnNatjDrEIhfio532UqHqYOpisaKtjYVQMq4XjKpI/s4u
   UttO/vFEEHKQMRJQsYwdVKwcgKh95joGLEMAK0H60V4A3QMdtT0k/wXZY
   0=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 116792215
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:MucwbKIhriFc4MOsFE+RE5QlxSXFcZb7ZxGr2PjKsXjdYENS0mYOy
 GUeCGmEa63Zajf2KIpxat7i/RlQsZDRztAxTQplqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4QZgPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5JJmFH0
 uw3LQlVbzWFnf+7mo2mG+tj05FLwMnDZOvzu1lG5BSAVLMMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGNnWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv12LCex3miBer+EpWfqa9toWaYy1A0CT07X1Kk/feV1FSXDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsTDRMddgnv88eXiEx2
 xmCmNaBLSNrmK2YTzSa7Lj8hTC/JykTa3MDbCksTA0Z7t2lq4Y25jrXR8tnOL64iJvyAz6Y/
 tyRhC03hrFWh8hb0ay+pAnDm2j1+MmPSRMp7ALKWG7j9hl+eIOue42v7x7c8OpEK4GaCFKGu
 RDohvSj0QzHNrnV/ATlfQnHNOvBCyqtWNEEvWNSIg==
IronPort-HdrOrdr: A9a23:fBM5yKpIrLc9y6o2dJz52EIaV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-Talos-CUID: =?us-ascii?q?9a23=3ALDz/VWkns8RI2LScpA0ZDqWApn3XOUP6zH73M2C?=
 =?us-ascii?q?9MD5obbuPVFLKx741kcU7zg=3D=3D?=
X-Talos-MUID: 9a23:N3O1dgUht0wc6Y7q/Biz1TZDD8xl34OvKG0HmIpateXaLwUlbg==
X-IronPort-AV: E=Sophos;i="6.01,232,1684814400"; 
   d="scan'208";a="116792215"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PsShorozq6bP8KiXXnMLHMKGKVkZ6FqGRBWzjPPmkfofIESCECXhqW7xvyueV75mwNxyAsgboCBu1Xjt/V1NipwTLLuEH+3PYeuzD/bwc4IHNDGkSYpS1jHeSoOoEYb5SEGD2lxsaAW7GCsg4Q1VaurlfhBvQDFCpM3JsI1ADoNWglkp6sfBKQW8vu/FrZBuIcfiKeUfEQb3S3n4aYczw+yo7S7clUeC7d3dWVQxsZgN2tMFrh8PHnkbLDj21KJGkExzpW53VKbkI9ELYJK9241A1XGHOnCWgwJSdzgNgOJtD60cnqnJONhb6C1B2Sr2SlsV8chS/HrLW3/JvvRSew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XXAI2e/6yxqBnTr/7xfNoPXQZLGgoX9+YJfRXXMKKw=;
 b=AG9BdWWS/IKfcEHkuyhth1GVsTYMzd46DJ06XQvyRF41vUa4tP7gF8bKfUZXCnLjBzZXPjMpjANdnMGsqeVslGfn7aVvECnt4NGv2ovhEnsUmncYuOZmsvZmkhabOtNiE7hFkH8zwWx4+i/oYlDMqEDSq2XdMgExh3pRqUkUSPdS2EOT2JH33reAWie9lkdToMhhLsbN8pgQyrro65QbEOpVUgs6zWfmpuEVZjaGc2sLv0Tmr3h57dw7xDjmxVYsiegbtdZ9964+uZNh9cJ05PvzH0OQZ2dYmsXnsdh4in0TYfcQughGMncmwygo4Xwvq5vZNd6kh/+KGQ5jY1YBZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XXAI2e/6yxqBnTr/7xfNoPXQZLGgoX9+YJfRXXMKKw=;
 b=tM5W3CzhTfJuXaiSVcTCYEMqr13z50ybfUQ0tPL8U9baRWV1tEnf9ll0KlY/s7VZqbVw0yp+t6P3wMIyp8+JWma/zg/LoEbN8L1DhVsjsn+FWGgomwVmr/o4Pgvr5Re9ImnSz/U4KvgIoPmCLytqZQtwalZD+crIs+ZxNUmGj9E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v3 4/4] x86/iommu: pass full IO-APIC RTE for remapping table update
Date: Wed, 26 Jul 2023 14:55:08 +0200
Message-ID: <20230726125508.78704-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726125508.78704-1-roger.pau@citrix.com>
References: <20230726125508.78704-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0276.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::16) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BN8PR03MB4964:EE_
X-MS-Office365-Filtering-Correlation-Id: bb422968-1c71-47fc-0830-08db8dd79dcd
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2oQ1x+rsyPsNiemDZozRv1fyGwDoCt5UyKYdpxwSg7YCQ8tA4y10L4dCa26tJodXXNT2iWUQTPlGae8vbW0UR2d+M6HyyUlZo958iH66ZvHfrjhbz8dSuyljxxs6cJZJgKoGG/kcy27WUJugQ9JZJS3EX3TdrePAfTzWaF99aoxjyiefgt9YllKFsBXNzfkulYPHqgNZjI3O/1Zgz5HeXAyk9ONgqDTXgO00gEJmqohDwBmtfzmyqXlV4Fm0v7CSTB3FWoBhTrIMLuW+wIffkxoCqYIvVQLZSwoH9Rq5rNbg2lIVjtIUhIlcntwDWpznAIr/mdgXuoY6sVN/RHlBXsC2+yA2BcbCjws1Z8pLtLghert9xa5TY2Ke3+jhqB5hkliYEbqx+1N/nVvyfxGqk9Az9mWLIuEfjlXPki1Eobz5pm7L3X92wj9mi6paPA7yUYcoE4ZA/mWCN7jmavlFJvHjqm/SqFwNmX4WMSf2gMahDZhEGFcgGlKydbQbhXLFTNQUnUBn+X2F69gjL7t4a5nX3BJbnLSQGQqPeeQdOiw1rzixIYDY3vDeUsx7u64v
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(451199021)(41300700001)(26005)(6506007)(478600001)(38100700002)(6512007)(86362001)(36756003)(6916009)(4326008)(8676002)(8936002)(186003)(316002)(66946007)(66476007)(66556008)(5660300002)(2906002)(2616005)(83380400001)(54906003)(82960400001)(6486002)(1076003)(6666004)(15650500001)(30864003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2llZW0rdW5ranNWQjFJM3JUVllsNnVWWVMrSjAvd252LzhFN2RtcGRzRENL?=
 =?utf-8?B?NUdzRnBpZG5scUNUendORzl5R3hBRkU5SWliNEJXY01NTmdhcVNmckptMjkv?=
 =?utf-8?B?K0h1MEZwSE10WGpIaW5icTNHL1prcVBidkJLWktoYkFheTYxbi9HV1ZZU3Rx?=
 =?utf-8?B?M1QxSHFiTlRCVFdNYklsMm56Y3EvYzM3cWYzSERrcndPcWozaW5xT3JwM05p?=
 =?utf-8?B?Q2tCdHJWYmNtS3NLRFlmOXlobzU1U0RPWXM0TEVMOUFnQzVnelU0dkdPUTN5?=
 =?utf-8?B?dHVBNFZORDZFbjV0Mk9vRDdoQnJnbjZCc3BvTHNhWWtoNGhNTUJHQUtHdE1r?=
 =?utf-8?B?eFpDd05GUzM5cUM4Z0dzTXBMbDlaU25PVVc4MDZiOTlvRGNSb0NlaXYzM3Y4?=
 =?utf-8?B?c2kwTzNBY25hSENSSFo2N1pwUmd4SDY0UjQxdEdneDFTMmo1dTNYM25MY1pw?=
 =?utf-8?B?Y3RKMVlkT2U1c2FYL2VHOWJDakg5dWRNWjJXVm80bGFuLzIxOU0yYm1RNU1F?=
 =?utf-8?B?dEVIaXUwUW1rVjZjd1I3ZFRYaDJOY3FzdHNXQlNFbytuUTlYVVNxam4wUTZB?=
 =?utf-8?B?b1FzNkNielN5dVdQVE14OGM3TVI0ZGEzc1IxaGVYRWkyZlFvSGJ1bzBJQm1C?=
 =?utf-8?B?Y2I4L01uQndIRUlUbkZIOTJRbGVKaVZsUng0NmV2SXI3TzJGYmhCazBKd0RP?=
 =?utf-8?B?SWFkRjRBb3EyTFB4T3dieGsySk5mL2NKZTZvRUJlbnh2ZFNEeVdMek5KYTJz?=
 =?utf-8?B?blpLdCtIVnNEdGtjOG9QS2k1WUhSV0pCajlmRVZXZDdkaGVWYWZ5ZE04M1FI?=
 =?utf-8?B?bG9ER1dCcCs0c0FlWVVlTVB2UXVaaUdaMm52VTB5dlY2QWF5RVFsVlkzblJ2?=
 =?utf-8?B?RkRGS0lVQ25lVTN3RHdiMHVhd3VKb0VTSGowRGM4bW15Y1RHekZ6cmVIOUh6?=
 =?utf-8?B?QkRweU50NmhXV2VVTGlJelZvVGM4Z1lDam1Cb3dvMUJmNjlZVVU3TksrUmR0?=
 =?utf-8?B?clFKR1VpVVo0RW1ySTArQUxCS2w2bFVFK1ZvNUt2ZUIzaTdkUnhkQUJ2MUJU?=
 =?utf-8?B?dzhvTGpscTQ2OE9OWEhHT2pzb0xBR0VxRUp2MCtsZkYwaDcrL292a3dSbUhL?=
 =?utf-8?B?NU5SU1RtRDJRVEJPdW1pbXhpUzY4d2xIUDRQMitoMjdjZDYwWUtJSjhYekRT?=
 =?utf-8?B?OHpKTGY5OGUzcE9NeU5qaTZVdCtRYjByZDkvUTdLUWgvQ0lvUGVPMUIwSm1r?=
 =?utf-8?B?U29xRUhYM3NEWGkrb1pBVzllYlB4RU16a3cvcUVMMGRRNEE2K0xrWDR2TWFU?=
 =?utf-8?B?LzNoVktXekZGMU50WHppNUkxMmdWUGVQTG1BVXkrcVlCdDdxY0pnSW9vS1By?=
 =?utf-8?B?ZXhuS01YWll5V2FlajZPZmtDSjAvYmhDRk80TVZUR2xkLzl4dHVwTmpCbWJm?=
 =?utf-8?B?VG9HK2V2dTh6VHY1cGx5ZDFOVlBoS2NSQk9uNzczWVFsODEyTkNnZFovNzFk?=
 =?utf-8?B?WTEvTFhZNUZpclIySDNxbStUUG9NNkV1bFMvRlFVRTFybStYbXpkcHdjQnJF?=
 =?utf-8?B?OUEzSHlVTzlnSUlVUm53TGhzQm5JZ2JIbzhJSXoyZE9GZVlQYjhKc1UvZTYy?=
 =?utf-8?B?aUpsMkZtY01oc2Q1M2w2VFl6L1NzNlpuclhGV0xCS3pRM3k0cmVBU1RRbzk4?=
 =?utf-8?B?RlRzbWlxODd3QTZhWlFTdUdXbjJxQks2aDVnNFlVNHVhK3E3L2dzcW5yenVC?=
 =?utf-8?B?Tnd3R25CYnF4eXkrNG95cFZka3UzSUVYMHZsdk15bU9QZUtlNlBQWklSVjlM?=
 =?utf-8?B?V2FZa3dIZ0dxalh2VGphQWZiUERuS3VlaE91QThMbEwxWHFPaG1QQ3h6dlJF?=
 =?utf-8?B?SklhYTZvZUVvc0VwU1ZWM1dDeTMrZm1kWjlpODROWGhicUgwWWJLSGhERDVK?=
 =?utf-8?B?MzhacllqKy9uMWIzanhNU0FlamEvaWxZek9KRm91Wno3bFdRWVhHTWVJOWtL?=
 =?utf-8?B?YVFiNWZsb3ZNb0tWb0hWU0gwSUNqTG9udUlIQkk4dmt6Vll5OTNoMXA5bXdi?=
 =?utf-8?B?WTZkWmRSbUZ3NG1wb0tiaUVscFEzSy95L25TdC9ockxORkcxcVBDRnFDVmtY?=
 =?utf-8?B?Mng4Uis3aGE5cXRpREJvOVpvRHY3WmU3N2hjL05XUFoxV2NoUUI4WmlwSVB1?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FFFf+sGkLuh1fLXNV7rcRkwgPMJRYB0Lndh7In9Rr8f9qIUwc5X960/Vo4Nh7EPKxFVsXhhnFM/f6i950mbMsRr5JY5PFad0mjxSnwmgkXlvlPuSmaaDtnsoOXh2pgAZXLxjy2V9BqzZrVrBcbTVT3WZfNDH8WSfR18pqr6eQcfZBLGDEKjk8hPsP5DbRGUIo36kdEUd1XZkasJk3Kr+3v1jBVaNqUMmuCuPRZg0PCjmRRXXyUoCbDgo/F5eZbSgoVkCDI7vv2Ssn+rZGqXsMYj+3cfqZZmiQMVw5VZ09Sh0cafzMSnlr7mcBDpJ9FwPqHD3EpB0Wvp5GERN3loOMKQVW44tKYXhy6cdP4zfd8JfKSncoJXcHvGDhEAZPy/0HDZQu9rsHCUzBXjdjl6xEcL6zZkOlL3ub3fhGpnCOW7kt0gKwd3VnVATSeIBkI+48yZpYALJbOvRMoOyq+dC8Dwd75rX3XQ+dUJ2onBpXp1PypRqIDrOw396gfuaEMDj6aWnkZzjTxVMOT555xVAeTFDg9HPQTXXBQM5SswTvN+aLHRN4+Ykru/iuNfB4kClTxqVLCDxj3Ub8Gxd5kTFrCTNBPCR4pO6xmYyMl05PUJBzJ6FUcC6chEuy71gK8mB8XVlji70r6efO1v4nv1x/wNgcLal/js/k1a1qOSRS/tAlkOZKyhpXOVYkcj2GcN0olfPU8xECYlKgLL5YyEYMQlEAfzZrguwEyTyWzqUbyqDDAv5D5NLYXhSMJ/QoYu6wsP//zdtikPaTkBVwiWdZdXijY5VCpJ1Om6/7v/WKXySvSvI4a+p0VCDmCoizAK+tgBYf7XQVI38KCRfgsgz8XhVY2gcn0MbFYpE7b7cFy4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb422968-1c71-47fc-0830-08db8dd79dcd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 12:55:41.5017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYTHuYrqouCslHS9NllfKyDARJouvHu3X3mNEgvZQdWYbetCyf3/1vziLkpilteAMNkWHmgWPTGbb9cKJ3uuag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4964

So that the remapping entry can be updated atomically when possible.

Doing such update atomically will avoid Xen having to mask the IO-APIC
pin prior to performing any interrupt movements (ie: changing the
destination and vector fields), as the interrupt remapping entry is
always consistent.

This also simplifies some of the logic on both VT-d and AMD-Vi
implementations, as having the full RTE available instead of half of
it avoids to possibly read and update the missing other half from
hardware.

While there remove the explicit zeroing of new_ire fields in
ioapic_rte_to_remap_entry() and initialize the variable at definition
so all fields are zeroed.  Note fields could be also initialized with
final values at definition, but I found that likely too much to be
done at this time.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Remove unneeded initialization.
 - Use 'rte' as parameter name for update_ire_from_apic()
   implementations.
 - Fix comment style in ioapic_rte_to_remap_entry().
 - Fix requirement for atomic write in update_irte() call from
   ioapic_rte_to_remap_entry().
 - Remove remap_rte from io_apic_write_remap_rte().
---
Note that certain combination of changes to the RTE are impossible to
handle atomically. For example changing the vector and/or destination
fields together with the triggering mode is impossible to be performed
atomically (as the destination and vector is set in the IRTE, but the
triggering mode is set in the RTE).  Xen doesn't attempt to perform
such changes in a single update to the RTE anyway, so it's fine.

Naming the iommu_update_ire_from_apic() parameter RTE is not really
correct, as the format of the passed value expands the destination
field to be 32bits (in order to fit an x2APIC ID).  Passing an
IO_APIC_route_entry struct is not possible due to the circular
dependency that would create between io_apic.h and iommu.h.  It might
be possible to move IO_APIC_route_entry declaration to a different
header, but I haven't looked into it.
---
 xen/arch/x86/include/asm/iommu.h         |   3 +-
 xen/arch/x86/io_apic.c                   |   5 +-
 xen/drivers/passthrough/amd/iommu.h      |   2 +-
 xen/drivers/passthrough/amd/iommu_intr.c | 100 ++---------------
 xen/drivers/passthrough/vtd/extern.h     |   2 +-
 xen/drivers/passthrough/vtd/intremap.c   | 136 +++++++++++------------
 xen/drivers/passthrough/x86/iommu.c      |   4 +-
 xen/include/xen/iommu.h                  |   3 +-
 8 files changed, 86 insertions(+), 169 deletions(-)

diff --git a/xen/arch/x86/include/asm/iommu.h b/xen/arch/x86/include/asm/iommu.h
index 0540cd9faa87..eb720205e25e 100644
--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -84,7 +84,8 @@ struct iommu_init_ops {
 
 extern const struct iommu_init_ops *iommu_init_ops;
 
-void iommu_update_ire_from_apic(unsigned int apic, unsigned int reg, unsigned int value);
+void iommu_update_ire_from_apic(unsigned int apic, unsigned int pin,
+                                uint64_t rte);
 unsigned int iommu_read_apic_from_ire(unsigned int apic, unsigned int reg);
 int iommu_setup_hpet_msi(struct msi_desc *);
 
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 041233b9b706..b3afef8933d7 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -275,10 +275,7 @@ void __ioapic_write_entry(
         __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
     }
     else
-    {
-        iommu_update_ire_from_apic(apic, 0x11 + 2 * pin, eu.w2);
-        iommu_update_ire_from_apic(apic, 0x10 + 2 * pin, eu.w1);
-    }
+        iommu_update_ire_from_apic(apic, pin, e.raw);
 }
 
 static void ioapic_write_entry(
diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index 8bc3c35b1bb1..5429ada58ef5 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -300,7 +300,7 @@ int cf_check amd_iommu_free_intremap_table(
 unsigned int amd_iommu_intremap_table_order(
     const void *irt, const struct amd_iommu *iommu);
 void cf_check amd_iommu_ioapic_update_ire(
-    unsigned int apic, unsigned int reg, unsigned int value);
+    unsigned int apic, unsigned int pin, uint64_t rte);
 unsigned int cf_check amd_iommu_read_ioapic_from_ire(
     unsigned int apic, unsigned int reg);
 int cf_check amd_iommu_msi_msg_update_ire(
diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index f32c418a7e49..e83a2a932af8 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -247,11 +247,6 @@ static void update_intremap_entry(const struct amd_iommu *iommu,
     }
 }
 
-static inline int get_rte_index(const struct IO_APIC_route_entry *rte)
-{
-    return rte->vector | (rte->delivery_mode << 8);
-}
-
 static inline void set_rte_index(struct IO_APIC_route_entry *rte, int offset)
 {
     rte->vector = (u8)offset;
@@ -267,7 +262,6 @@ static int update_intremap_entry_from_ioapic(
     int bdf,
     struct amd_iommu *iommu,
     struct IO_APIC_route_entry *rte,
-    bool_t lo_update,
     u16 *index)
 {
     unsigned long flags;
@@ -315,31 +309,6 @@ static int update_intremap_entry_from_ioapic(
         spin_lock(lock);
     }
 
-    if ( fresh )
-        /* nothing */;
-    else if ( !lo_update )
-    {
-        /*
-         * Low half of incoming RTE is already in remapped format,
-         * so need to recover vector and delivery mode from IRTE.
-         */
-        ASSERT(get_rte_index(rte) == offset);
-        if ( iommu->ctrl.ga_en )
-            vector = entry.ptr128->full.vector;
-        else
-            vector = entry.ptr32->flds.vector;
-        /* The IntType fields match for both formats. */
-        delivery_mode = entry.ptr32->flds.int_type;
-    }
-    else if ( x2apic_enabled )
-    {
-        /*
-         * High half of incoming RTE was read from the I/O APIC and hence may
-         * not hold the full destination, so need to recover full destination
-         * from IRTE.
-         */
-        dest = get_full_dest(entry.ptr128);
-    }
     update_intremap_entry(iommu, entry, vector, delivery_mode, dest_mode, dest);
 
     spin_unlock_irqrestore(lock, flags);
@@ -350,14 +319,11 @@ static int update_intremap_entry_from_ioapic(
 }
 
 void cf_check amd_iommu_ioapic_update_ire(
-    unsigned int apic, unsigned int reg, unsigned int value)
+    unsigned int apic, unsigned int pin, uint64_t rte)
 {
-    struct IO_APIC_route_entry old_rte = { };
-    struct IO_APIC_route_entry new_rte = { };
-    unsigned int rte_lo = (reg & 1) ? reg - 1 : reg;
-    unsigned int pin = (reg - 0x10) / 2;
+    struct IO_APIC_route_entry old_rte;
+    struct IO_APIC_route_entry new_rte = { .raw = rte };
     int seg, bdf, rc;
-    bool saved_mask, fresh = false;
     struct amd_iommu *iommu;
     unsigned int idx;
 
@@ -373,58 +339,23 @@ void cf_check amd_iommu_ioapic_update_ire(
     {
         AMD_IOMMU_WARN("failed to find IOMMU for IO-APIC @ %04x:%04x\n",
                        seg, bdf);
-        __io_apic_write(apic, reg, value);
+        __ioapic_write_entry(apic, pin, true, new_rte);
         return;
     }
 
-    /* save io-apic rte lower 32 bits */
-    *((u32 *)&old_rte) =  __io_apic_read(apic, rte_lo);
-    saved_mask = old_rte.mask;
-
-    if ( reg == rte_lo )
-    {
-        *((u32 *)&new_rte) = value;
-        /* read upper 32 bits from io-apic rte */
-        *(((u32 *)&new_rte) + 1) = __io_apic_read(apic, reg + 1);
-    }
-    else
-    {
-        *((u32 *)&new_rte) = *((u32 *)&old_rte);
-        *(((u32 *)&new_rte) + 1) = value;
-    }
-
-    if ( ioapic_sbdf[idx].pin_2_idx[pin] >= INTREMAP_MAX_ENTRIES )
-    {
-        ASSERT(saved_mask);
-
-        /*
-         * There's nowhere except the IRTE to store a full 32-bit destination,
-         * so we may not bypass entry allocation and updating of the low RTE
-         * half in the (usual) case of the high RTE half getting written first.
-         */
-        if ( new_rte.mask && !x2apic_enabled )
-        {
-            __io_apic_write(apic, reg, value);
-            return;
-        }
-
-        fresh = true;
-    }
-
+    old_rte = __ioapic_read_entry(apic, pin, true);
     /* mask the interrupt while we change the intremap table */
-    if ( !saved_mask )
+    if ( !old_rte.mask )
     {
         old_rte.mask = 1;
-        __io_apic_write(apic, rte_lo, *((u32 *)&old_rte));
+        __ioapic_write_entry(apic, pin, true, old_rte);
     }
 
     /* Update interrupt remapping entry */
     rc = update_intremap_entry_from_ioapic(
-             bdf, iommu, &new_rte, reg == rte_lo,
+             bdf, iommu, &new_rte,
              &ioapic_sbdf[idx].pin_2_idx[pin]);
 
-    __io_apic_write(apic, reg, ((u32 *)&new_rte)[reg != rte_lo]);
-
     if ( rc )
     {
         /* Keep the entry masked. */
@@ -433,20 +364,7 @@ void cf_check amd_iommu_ioapic_update_ire(
         return;
     }
 
-    /* For lower bits access, return directly to avoid double writes */
-    if ( reg == rte_lo )
-        return;
-
-    /*
-     * Unmask the interrupt after we have updated the intremap table. Also
-     * write the low half if a fresh entry was allocated for a high half
-     * update in x2APIC mode.
-     */
-    if ( !saved_mask || (x2apic_enabled && fresh) )
-    {
-        old_rte.mask = saved_mask;
-        __io_apic_write(apic, rte_lo, *((u32 *)&old_rte));
-    }
+    __ioapic_write_entry(apic, pin, true, new_rte);
 }
 
 unsigned int cf_check amd_iommu_read_ioapic_from_ire(
diff --git a/xen/drivers/passthrough/vtd/extern.h b/xen/drivers/passthrough/vtd/extern.h
index 39602d1f88f8..b684e9393d1a 100644
--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -92,7 +92,7 @@ int cf_check intel_iommu_get_reserved_device_memory(
 unsigned int cf_check io_apic_read_remap_rte(
     unsigned int apic, unsigned int reg);
 void cf_check io_apic_write_remap_rte(
-    unsigned int apic, unsigned int reg, unsigned int value);
+    unsigned int apic, unsigned int ioapic_pin, uint64_t rte);
 
 struct msi_desc;
 struct msi_msg;
diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
index 05df6d5759b1..4101fd6bccaf 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -328,15 +328,14 @@ static int remap_entry_to_ioapic_rte(
 
 static int ioapic_rte_to_remap_entry(struct vtd_iommu *iommu,
     int apic, unsigned int ioapic_pin, struct IO_xAPIC_route_entry *old_rte,
-    unsigned int rte_upper, unsigned int value)
+    struct IO_xAPIC_route_entry new_rte)
 {
     struct iremap_entry *iremap_entry = NULL, *iremap_entries;
-    struct iremap_entry new_ire;
+    struct iremap_entry new_ire = { };
     struct IO_APIC_route_remap_entry *remap_rte;
-    struct IO_xAPIC_route_entry new_rte;
     int index;
     unsigned long flags;
-    bool init = false;
+    bool init = false, masked = old_rte->mask;
 
     remap_rte = (struct IO_APIC_route_remap_entry *) old_rte;
     spin_lock_irqsave(&iommu->intremap.lock, flags);
@@ -364,48 +363,40 @@ static int ioapic_rte_to_remap_entry(struct vtd_iommu *iommu,
 
     new_ire = *iremap_entry;
 
-    if ( rte_upper )
-    {
-        if ( x2apic_enabled )
-            new_ire.remap.dst = value;
-        else
-            new_ire.remap.dst = (value >> 24) << 8;
-    }
+    if ( x2apic_enabled )
+        new_ire.remap.dst = new_rte.dest.dest32;
     else
-    {
-        *(((u32 *)&new_rte) + 0) = value;
-        new_ire.remap.fpd = 0;
-        new_ire.remap.dm = new_rte.dest_mode;
-        new_ire.remap.tm = new_rte.trigger;
-        new_ire.remap.dlm = new_rte.delivery_mode;
-        /* Hardware require RH = 1 for LPR delivery mode */
-        new_ire.remap.rh = (new_ire.remap.dlm == dest_LowestPrio);
-        new_ire.remap.avail = 0;
-        new_ire.remap.res_1 = 0;
-        new_ire.remap.vector = new_rte.vector;
-        new_ire.remap.res_2 = 0;
-
-        set_ioapic_source_id(IO_APIC_ID(apic), &new_ire);
-        new_ire.remap.res_3 = 0;
-        new_ire.remap.res_4 = 0;
-        new_ire.remap.p = 1;     /* finally, set present bit */
-
-        /* now construct new ioapic rte entry */
-        remap_rte->vector = new_rte.vector;
-        remap_rte->delivery_mode = 0;    /* has to be 0 for remap format */
-        remap_rte->index_15 = (index >> 15) & 0x1;
-        remap_rte->index_0_14 = index & 0x7fff;
-
-        remap_rte->delivery_status = new_rte.delivery_status;
-        remap_rte->polarity = new_rte.polarity;
-        remap_rte->irr = new_rte.irr;
-        remap_rte->trigger = new_rte.trigger;
-        remap_rte->mask = new_rte.mask;
-        remap_rte->reserved = 0;
-        remap_rte->format = 1;    /* indicate remap format */
-    }
-
-    update_irte(iommu, iremap_entry, &new_ire, !init);
+        new_ire.remap.dst = (new_rte.dest.dest32 >> 24) << 8;
+
+    new_ire.remap.dm = new_rte.dest_mode;
+    new_ire.remap.tm = new_rte.trigger;
+    new_ire.remap.dlm = new_rte.delivery_mode;
+    /* Hardware require RH = 1 for LPR delivery mode. */
+    new_ire.remap.rh = (new_ire.remap.dlm == dest_LowestPrio);
+    new_ire.remap.vector = new_rte.vector;
+
+    set_ioapic_source_id(IO_APIC_ID(apic), &new_ire);
+    /* Finally, set present bit. */
+    new_ire.remap.p = 1;
+
+    /* Now construct new ioapic rte entry. */
+    remap_rte->vector = new_rte.vector;
+    /* Has to be 0 for remap format. */
+    remap_rte->delivery_mode = 0;
+    remap_rte->index_15 = (index >> 15) & 0x1;
+    remap_rte->index_0_14 = index & 0x7fff;
+
+    remap_rte->delivery_status = new_rte.delivery_status;
+    remap_rte->polarity = new_rte.polarity;
+    remap_rte->irr = new_rte.irr;
+    remap_rte->trigger = new_rte.trigger;
+    remap_rte->mask = new_rte.mask;
+    remap_rte->reserved = 0;
+    /* Indicate remap format. */
+    remap_rte->format = 1;
+
+    /* If cmpxchg16b is not available the caller must mask the IO-APIC pin. */
+    update_irte(iommu, iremap_entry, &new_ire, !init && !masked);
     iommu_sync_cache(iremap_entry, sizeof(*iremap_entry));
     iommu_flush_iec_index(iommu, 0, index);
 
@@ -439,36 +430,45 @@ unsigned int cf_check io_apic_read_remap_rte(
 }
 
 void cf_check io_apic_write_remap_rte(
-    unsigned int apic, unsigned int reg, unsigned int value)
+    unsigned int apic, unsigned int pin, uint64_t rte)
 {
-    unsigned int pin = (reg - 0x10) / 2;
+    struct IO_xAPIC_route_entry new_rte = { .raw = rte };
     struct IO_xAPIC_route_entry old_rte = { };
-    struct IO_APIC_route_remap_entry *remap_rte;
-    unsigned int rte_upper = (reg & 1) ? 1 : 0;
     struct vtd_iommu *iommu = ioapic_to_iommu(IO_APIC_ID(apic));
-    int saved_mask;
-
-    old_rte = __ioapic_read_entry(apic, pin, true);
+    bool masked = true;
+    int rc;
 
-    remap_rte = (struct IO_APIC_route_remap_entry *) &old_rte;
-
-    /* mask the interrupt while we change the intremap table */
-    saved_mask = remap_rte->mask;
-    remap_rte->mask = 1;
-    __io_apic_write(apic, reg & ~1, *(u32 *)&old_rte);
-    remap_rte->mask = saved_mask;
-
-    if ( ioapic_rte_to_remap_entry(iommu, apic, pin,
-                                   &old_rte, rte_upper, value) )
+    if ( !cpu_has_cx16 )
     {
-        __io_apic_write(apic, reg, value);
+       /*
+        * Cannot atomically update the IRTE entry: mask the IO-APIC pin to
+        * avoid interrupts seeing an inconsistent IRTE entry.
+        */
+        old_rte = __ioapic_read_entry(apic, pin, true);
+        if ( !old_rte.mask )
+        {
+            masked = false;
+            old_rte.mask = 1;
+            __ioapic_write_entry(apic, pin, true, old_rte);
+        }
+    }
 
-        /* Recover the original value of 'mask' bit */
-        if ( rte_upper )
-            __io_apic_write(apic, reg & ~1, *(u32 *)&old_rte);
+    rc = ioapic_rte_to_remap_entry(iommu, apic, pin, &old_rte, new_rte);
+    if ( rc )
+    {
+        if ( !masked )
+        {
+            /* Recover the original value of 'mask' bit */
+            old_rte.mask = 0;
+            __ioapic_write_entry(apic, pin, true, old_rte);
+        }
+        dprintk(XENLOG_ERR VTDPREFIX,
+                "failed to update IRTE for IO-APIC#%u pin %u: %d\n",
+                apic, pin, rc);
+        return;
     }
-    else
-        __ioapic_write_entry(apic, pin, true, old_rte);
+    /* old_rte will contain the updated IO-APIC RTE on success. */
+    __ioapic_write_entry(apic, pin, true, old_rte);
 }
 
 static void set_msi_source_id(struct pci_dev *pdev, struct iremap_entry *ire)
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index be71a4c4641c..d290855959f2 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -158,9 +158,9 @@ int iommu_enable_x2apic(void)
 }
 
 void iommu_update_ire_from_apic(
-    unsigned int apic, unsigned int reg, unsigned int value)
+    unsigned int apic, unsigned int pin, uint64_t rte)
 {
-    iommu_vcall(&iommu_ops, update_ire_from_apic, apic, reg, value);
+    iommu_vcall(&iommu_ops, update_ire_from_apic, apic, pin, rte);
 }
 
 unsigned int iommu_read_apic_from_ire(unsigned int apic, unsigned int reg)
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 405db59971c5..9335cd074cff 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -278,7 +278,8 @@ struct iommu_ops {
     int (*enable_x2apic)(void);
     void (*disable_x2apic)(void);
 
-    void (*update_ire_from_apic)(unsigned int apic, unsigned int reg, unsigned int value);
+    void (*update_ire_from_apic)(unsigned int apic, unsigned int pin,
+                                 uint64_t rte);
     unsigned int (*read_apic_from_ire)(unsigned int apic, unsigned int reg);
 
     int (*setup_hpet_msi)(struct msi_desc *);
-- 
2.41.0


