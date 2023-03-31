Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D6D6D1D8A
	for <lists+xen-devel@lfdr.de>; Fri, 31 Mar 2023 12:00:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516968.801932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piBYX-0001nT-11; Fri, 31 Mar 2023 10:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516968.801932; Fri, 31 Mar 2023 10:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piBYW-0001jo-TB; Fri, 31 Mar 2023 10:00:24 +0000
Received: by outflank-mailman (input) for mailman id 516968;
 Fri, 31 Mar 2023 10:00:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTo5=7X=citrix.com=prvs=447f045ac=roger.pau@srs-se1.protection.inumbo.net>)
 id 1piBYU-00016S-OV
 for xen-devel@lists.xenproject.org; Fri, 31 Mar 2023 10:00:22 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9272ac6-cfaa-11ed-85db-49a42c6b2330;
 Fri, 31 Mar 2023 12:00:21 +0200 (CEST)
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Mar 2023 06:00:20 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DS7PR03MB5557.namprd03.prod.outlook.com (2603:10b6:5:2d3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Fri, 31 Mar
 2023 10:00:18 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Fri, 31 Mar 2023
 10:00:18 +0000
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
X-Inumbo-ID: d9272ac6-cfaa-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680256821;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=M19Wr4/u1Hw5Q+a4Q004XZh/o2wNS/KY8iHSo/EjDL0=;
  b=D+YTWypyyUtvJijljEjf7jeGtZpWI+23BKZt0GqZPe4hmMLbSIYnpMuO
   Bp8Wtk044ch3EzbrPaCAGkAsQi5pw2MJC1AifnAEaF5XPisvKjm0YzvX4
   vm4Fca4Ea2W19LXtLCghOi77+zyvk7TKYnm40KJtfPBny//t6OFwslpQa
   w=;
X-IronPort-RemoteIP: 104.47.70.109
X-IronPort-MID: 103834789
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:V+H4LaholW2EJQ0My+4CBsaOX161RhEKZh0ujC45NGQN5FlHY01je
 htvXG3UOP+DNzfxKox0PITi/UMF68DVz4NrTVE9qyBnHn8b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5wSHzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ4MzUrdAyE3N6fmqC+E/RQgMg6duvSadZ3VnFIlVk1DN4AaLWaG+Dgw4Ad2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilMpluG1YbI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqjA9JJSOLop5aGhnW49z0dExQNWWf8rMKzkmmZW4pdM
 A8tr39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOtsU7WDgr3
 V+hhM7yCHpkt7j9YW2Z3qeZq3W1Iyd9EIMZTSoNTA9A6d+8pog210rLVow6SP/zicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQGzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:CPZTl6GnjrDZAztDpLqFrZHXdLJyesId70hD6qkRc20hTiX8ra
 vBoB1173/JYUkqKQ0dcLy7WZVoIkmshqKdn7NhX4tKNTOO0AGVxepZnOjfKlPbakjDHuU079
 YeT0AXYuedMbAQ5/yU3OF2eexM/PC3tJmNwcPi5zNVSwduApsQnTuQyGygYzNLrM0tP+tIKH
 JYjPA31gZIAk5nCviTNz0+Ru3eoN+OvIv+CCR2fiIP2U21lDa177y/OASZ2xp2aUIz/Z4StV
 LdlhD/5OGFu/W2oyWssFP73tBtgd78zdkGItKKhtN9EESLti+YIL55XqGEvnQOgMzH0idTrP
 D85y04Oth16TfqcnqrrQDL0w3tuQxekEPK+BujmH7+ps68ez4gEcpGgutiA2Hk13Y=
X-IronPort-AV: E=Sophos;i="5.98,307,1673931600"; 
   d="scan'208";a="103834789"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IwdbeT1NH9i3Wtr7pDMtL3YtuYKhn+nAOoYpLS0hBcw0jIFwzhIAahEGh6QuBC6BvouzqLByoiSpOkGSkP7mxTwKPzTpmlRgziv4Fiq/11RdZImzwJSe21QnSts1UI9ibx2+OWriBa4iYP7ti9NZpfz7Nf/oXA96VAY/13/qNab6sU98QTZFtvt1M54QO981P87PduSybCxFS65Y+2FtvSDapgCX+8dlFaUNHhS9WhIct9ZvxiMa0dnL8GnKRUQni8DPoOAcQAAQ/uvB0itwYJfjF77mfg80Jik6HvH3DnNIML14gO+M0i768LCfFRrNbIrbRT9afS5Uq9HkNnBSQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gUHftM+0/IaXHuGHEEgkWb+8UwO8uBl34DbIg0DDU4=;
 b=j8OQDqtX4CkhVInjkrknSC9NTwC/sTk6OCaRBc7i+xsSh/z/gOWhzHVQhusPsoFJH6w2AA4etD3JaPNr3IycV5CA3y7ptowmtAu1uD/xLUl4lG9DDCOLTNp4trmr6nR+LzHIGAKFikV4dsv2CWu5laEuuJsRZxIlGtM267Y5iH7/v1HtsaPRMfc00+/b4Bfbn+ZtsiK/f4v+66vU9RxQYlKx9TJtRbEtX3zAPFwUjia0JSM5mjDz0DGrlSh4JNnPChSG7d2o4WsZwlNmiqRAAIqFPvI+6LQBhqb/GGR+/krcehoFSSkvbT9wElzX+CM8mHPRScySBlktoF+8fH+Gqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gUHftM+0/IaXHuGHEEgkWb+8UwO8uBl34DbIg0DDU4=;
 b=VGtxQvYoC/y60qrlH8pkUaEVm//wbw4uD0Piy7u1XiFPPSbEPQMKeqDun7oKyRzJC8tqSWapfpEsKj6mBPWvcooDMJEwl1npO7eAaCPfBcfft7ID4S2crr8aLfUCV6v+DllSL9f3gC2iDFI3ZGnWNk4ZMdzkKIqMO6Ibc67Zzs4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 3/3] multiboot2: do not set StdOut mode unconditionally
Date: Fri, 31 Mar 2023 11:59:46 +0200
Message-Id: <20230331095946.45024-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230331095946.45024-1-roger.pau@citrix.com>
References: <20230331095946.45024-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0650.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::20) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DS7PR03MB5557:EE_
X-MS-Office365-Filtering-Correlation-Id: 58f99fb6-eafa-4949-a6f9-08db31cebb6d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/OduDf4G3x34y19qsdGVmTgkLjflysEi391dwap/MpFAGMob2qV6H2KrD6xkRagutyvMmDaMFwc2eHqJsaG/mYCezwrA9+uF6FPqH2l6JAlyxG+80EqrE319dRXAW1W4Itnp5GDAv+i62lbwntdP0dU/xhKy+LUsnMyhn9+pQAzK8+M+mw6iJD3ISUUw8CCvIyiJEQbLXY/hIBp+lQ3g0ly2lUlla2QkFj6xj2GwG9WOwKdDjTZuybr9/oMJ3v0gVCCeQ4CO7SQPNOCM3yPG6kQI1ukaeZCyCj5FzoSDlF3ShCr4pbuQKPqhn6N13TL+a1xAxBOztaWYHhIk9ofCXLwGVDzDUZTmJxBWIeMFHWVvpVUlfY0QRVn4es+bKYUXe4PhyeUkKQg3dtrZ69N+c9Dg+DPeRDtvQYRMqvjV1fT8/PmNBVfbhM9hmDRmP3MI13WLg6CMpNA4n+XtPFMiwCHSxjQ9ig3wO6K4oTznOA3tl6BpoVDADNR9Nei8XbyI8oq32geJEmaP7IbS54MO1GjKdaVhuwW4gmN97QwjLkXXQXy2ZzQbKVxOiVQwg0n/AkAAD5Ml3pBtuGmxLffhNfbBpJhXWTl2u+ow69zcblk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(451199021)(478600001)(41300700001)(82960400001)(66556008)(66946007)(66476007)(83380400001)(2906002)(36756003)(54906003)(8676002)(316002)(4326008)(6512007)(86362001)(8936002)(186003)(26005)(6506007)(1076003)(6666004)(38100700002)(5660300002)(6916009)(6486002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3FQc05vYUNEWS84OVVCS1I1b3lXLzZIQTJwZXA2Z3NacGFDbGhTcS9xY0FL?=
 =?utf-8?B?UEFBUS9QTCtQUFdER0R1em43SXIvVTFHNTlJUlB6SGpXWFlSUitiaGhHMTV3?=
 =?utf-8?B?MEtjUG5hcjJZQWpTVURGSXF4OUhySTZuWDdacUxod0sxK0p3dDFkMWJCeWMw?=
 =?utf-8?B?SGU2ZlU5anV6S0FybkVTM1U5b2p4cDBkVERsbzV3MExpZndYdVZMMU1rUGor?=
 =?utf-8?B?bXU2UnlIQ0FCVlRENTdmK1lmOGlOa3A4dlltT0gyWllmMUlOdGxFZnJMeFhS?=
 =?utf-8?B?V2ozdTlkSmg0bkwxT0JvNTI4bjdoQVZ5VCttVlZGZU5OQndBSituK1hUalJQ?=
 =?utf-8?B?UVEyZ3VsUmZwVnBRMEhrcjViNFZzYnZCTzJRNjlPTVVBOUFrdFpiV3VNRFdW?=
 =?utf-8?B?TDRWMjZCWk5qbDhYRlJvNkNKVzNoSDh4WnN5NXh5emlXUWRpR0VWaTBRT3o4?=
 =?utf-8?B?K2tvUG1wbTA4eHNucng2V2FkS3RkYktSVHNvVGpZK1dHSVlYc1dFS2NoWjlB?=
 =?utf-8?B?RWU3QkNrQ0lCZVprYTVwNVBQMVYxeTFxSHJCUVlaaU5VMnRPNUpzY1F4NjI0?=
 =?utf-8?B?VHFIQS9GWUpsVWNvaGlSRDc0Z1gzY1daSHlVYWlxeHNudmhJOFZlYnhDTmw1?=
 =?utf-8?B?T3ZIVXROMWozOTZvUGpwVG5iQ3BJWUdQajRqYzJYZk5iM3FkMVJxUHBRUTUw?=
 =?utf-8?B?OFZCQ0xrL2JxZ2hOYjZkQ0NhckgySUJYS3krNFNNa0pZV2hvYU9hYWQxL2w4?=
 =?utf-8?B?cDFkRHBXRkw2aXVicjJsR1ZlR3I2YlNxWkx3TUpyUlZlNTlxTC93cFh3QjUv?=
 =?utf-8?B?WGlKZWc2ekQwUkt4L2J3aUc5RC90Mk9tczU2Sy9KckpjeUpvbG9kYVNJZllI?=
 =?utf-8?B?L2x0aEw2UjJXeEZQQWluVGZYZlo1OHhRQ1pvRXBoTStVL3BmTThSSDM4YzA3?=
 =?utf-8?B?RktETXZBYUJBZnBSS0ZLQnVBQWZ3NXhoRzU0YWdWZzJieWZFNE5RU05nNExR?=
 =?utf-8?B?QTdhL0hvblEvOWNzMWluMnlVdkJKSGp3QU9sVnZTRHpzRFdGWXUyL1dJTU1s?=
 =?utf-8?B?Rm5QSjJJbEZ6dFlIdUtTbFRWZ29Td3hVUEd5ZjlRbC81SHVaU25PK0c1ZVVP?=
 =?utf-8?B?bnhyVXJQcXRsUFRxS2JTTGZtelRlQ3d6SUVWaG9UQm1KTUY4bko5bXhBQ1Zw?=
 =?utf-8?B?dXBzYTBTQlJ2SGpoTWpyZjJtY2pxZC9oQ3BuMzFqWTJsbGZWQms5eURnNC9Z?=
 =?utf-8?B?S0M1QlFBRVRzTksvZk5ZOXdDRDNSNkR2YUNCWXgzWmdMekJMUG56U3ZlWUUv?=
 =?utf-8?B?WmNsbFV6SzhEak4zTTdVbVFwQmYrWDhNNmxsTlBaNWY2US9zSWxJY1pCMEFL?=
 =?utf-8?B?QWRXMVhCemhZZXl4UDdWRXp1RjJlNVFPWHVybkJacDJlMUsrRGpoWEZEUWRT?=
 =?utf-8?B?QUJBTjR4M2MrOUwwUFB1TWNDTllpaDJEdDRGU2lvZDJESW1GNXZZYlpDS0FZ?=
 =?utf-8?B?MGlvTlFYWTF0N1pZaWZKY3BLdVdZQXZIOEZsZEpEYVJCazhyU05uQjVTRWww?=
 =?utf-8?B?OXRscjBweWlidUkwS3NYdlR2UU4yYWNPREp2L0RneDJxT0YrQ2gzTUZTa0di?=
 =?utf-8?B?b0U0QVYvRmdGbnlzcndPcnBsMFVpdmViMVhKbklTVHhnclVTUmRLL3BUUWkz?=
 =?utf-8?B?eVZ0MDFGRGpoSGkzbTJBRElZOTg2Z1ZOeUxPU3VZOU9jM1FCOUpzbzIxc0JT?=
 =?utf-8?B?dFpYVVFBYkV6aHhjSFc1ei9EclhZa043VjYwN2ZlNnZMQjB6ZEFtUGZTK3RX?=
 =?utf-8?B?YW9oeW5KR25aZWc1dGNNSGJ5T0ZrWmM2K255NVIyeTBIZ2tGaG9aaFZEU2Ru?=
 =?utf-8?B?YjN1M1RwK3Ezd0c2bFc4YjRYS2dUZHcrYnJIdW80Z0s3VFhkbjFVa1RSR3Vv?=
 =?utf-8?B?WVBydjBSeUtBV3VqZS96VUt1QUlPcUttbTZvQnc4VkRFQzFBWThCY3NjNURx?=
 =?utf-8?B?eEJvMFMydlg5VmdaNVJtMGgwc3BJa29lQXVFcXNWNTgyc3pVOHo2K1p3TGVX?=
 =?utf-8?B?NmRmV1NDYm1sV1hITktWNDNBOXZOREtpaUFJUXZIYTNPY3g5U2tVZjdYRTRw?=
 =?utf-8?Q?XtMDDwYPNPtE2MTWPOA1UL5Zh?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	X4IIke7tDZbZQ6eDb0ySNpIfrqYke0cDRPVo8olbEwdHTQmiIaQ2hRwmeCfuw2YcEjmBVSLp7aWshb/NrmbyDeOewb3BfCbTPTyVh57ZQe3aKKKhY5yEzdtgk1aAOL/sVEj1Uez5Fc65qCqc3UnzjoU5Zo+CRdnf4Cg5+FnrQkoYuqGinLb2xhBkuwnTyZ+lKFj+fB/bJTR5XuxacrA3j3E50BZAQoyNrp28iINWZzBXJwCjkn/Y5AKzvexM15ylQ9qC+Wyrs0TCnIqE0/C10MajNnT5vwDOMSdTX93n/xa83tCDVnZFPWSRfptXjwOILSjLpJG0r7Jp/uAFBJJRzt/ScL8yAGcE8t/tp+Fue7pVDuI1FgOhArMmu5ac9Z0QSDypki4Mhh5jXkep/penRpQM6qDEZiMIhnv/ITSoYXAN6v/ns2pcSTNifbYdv5XkZiNn66y7kcmcw4bFIRiB2sgfCbTRdaqqtIEtwA09s2gngJ9UHcWanxmb0pGkQuoEFjsmbviMOLkLRX0/ztp+GyeSI05PzlOfyhOqPis5v41ZYXWL34EDN/5vBD9B0F1dIms3ls7tnqXBCvtp6zUxhR2S75quvhoDDFBl9aSaDNiNH8WzxQcY/jMQiQcpKJ6klN5knbSDXo7FTya8uWlF3AwPhDbFDDcrOwhHvtqpFALk7PTwgMQkZDQCRYa0SW7Ld5XluEe39vkPKLX7i2OI58378KBQeHsQGtC+Eqr1LXsAF4XBdNZ8I1YnGirwkMqvhTOp3Iuub2k92xJoi2LWDtUgU4FlQQ5glvtR7wC3BYA0HzYCDGHXmOAd7nCpVk51+gwvB5Sb3yGow0I4VeazIg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f99fb6-eafa-4949-a6f9-08db31cebb6d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 10:00:18.3106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4MikM2Pjn9vHBDui3VDQWCfTGOQ6NaCRzFR1EN7oBQzKsDhWNHVVWtw7KdEE3CpY3sOX4hsxXfNYJOvuAhETg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5557

Only initialize StdOut if there's no GOP available.  This avoids
forcefully switching StdOut to the maximum supported resolution, and
thus very likely changing the GOP mode without having first parsed the
command line options.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/efi/efi-boot.h | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index f46c1f021e..42aa135446 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -820,12 +820,6 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable
 
     efi_init(ImageHandle, SystemTable);
 
-    efi_console_set_mode();
-
-    if ( StdOut->QueryMode(StdOut, StdOut->Mode->Mode,
-                           &cols, &rows) == EFI_SUCCESS )
-        efi_arch_console_init(cols, rows);
-
     gop = efi_get_gop(&gop_handle);
 
     if ( gop )
@@ -887,6 +881,15 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable
 
         efi_arch_edid(gop_handle);
     }
+    else
+    {
+        /* If no GOP, init ConOut (StdOut) to the max supported size. */
+        efi_console_set_mode();
+
+        if ( StdOut->QueryMode(StdOut, StdOut->Mode->Mode,
+                               &cols, &rows) == EFI_SUCCESS )
+            efi_arch_console_init(cols, rows);
+    }
 
     efi_arch_edd();
     efi_arch_cpu();
-- 
2.40.0


