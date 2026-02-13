Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFD4GQ3ejmlSFgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 09:17:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EC7133E26
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 09:17:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230301.1535795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqoMM-0002F5-NC; Fri, 13 Feb 2026 08:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230301.1535795; Fri, 13 Feb 2026 08:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqoMM-0002Cs-KJ; Fri, 13 Feb 2026 08:17:06 +0000
Received: by outflank-mailman (input) for mailman id 1230301;
 Fri, 13 Feb 2026 08:17:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z/W2=AR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vqoML-0002Cm-8Z
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 08:17:05 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dfa8750-08b4-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 09:17:00 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by IA3PR03MB8455.namprd03.prod.outlook.com (2603:10b6:208:53c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 08:16:57 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Fri, 13 Feb 2026
 08:16:57 +0000
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
X-Inumbo-ID: 5dfa8750-08b4-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sNpL/94X3zkDjxkly0ZhmOCJlA3qWBdv7QdBlAkWx0n1oSxoxfjrPj7G78Jn2u/G+uERAAQH+hGJ+4xsHil6dHfids05q3Zs0iD7hDzGrE2sUvK5SexmvJY7bGNiiJcLhzFwhRqlqjZe5cX/Igu2JklZ/RzguiiaUzHTfqa/nJ7wQ4aI8wDivXh7Khev/hAWFqsxi9yIkT0bXNYiyfXQDwPE2bH3NI2p7XqkHvEE/IMtZqOwArw57NsYCQuDc5wXASXqAcynjDoc40zAPm45BX5GWk2qKtamvykNl03nUCl9iOIILFkfFKtOZfj6s6ZbrFPLsUpn6vu/1iy5j1ZkHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1DxPtAxWmb7dtdCnvOLkEStofqosmDjEqaC8bau+nI=;
 b=VUPtGfdBOEFg7UctCgIC16Yy8NQTbs9X7Fur9/MHX0mL27eyObAUs+JU5vuWDkTSc8dHopkfdgvShr465M1V3IY3nwd3JH6nwWNaai4Q0l+vG8u1yjDaX911AzrnmIRReriO94f1buQj8wT1ERRSbrtWruBIZOfTJ5hD8IRvh76AL58mIlSQkYD6FRh5kD/8QFzeRSBbq+3JQIkCQFDFdmW74l6Eogb0pTg10ObSPnXOpseC9zw6McboIO3jQfpeKf253AG6XFEDa/ENqvYFe6Wgoiqu5oYBjjkDqF9gQ973tXsJD4o5MjCGPsVaVAKNCG8/qD9WLTyHceyg6hey9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1DxPtAxWmb7dtdCnvOLkEStofqosmDjEqaC8bau+nI=;
 b=jFPt0An8e8WKzYSGajQYevpVfLdlMbHKaB2ReZ4GboTTJvHHhMAT64r5ihjsR95IvsBrAQV05725tYy6XKyKuPyANOEW7UX0bNyZra8StsJ1FR/FK5sOCZXBbuGwHY8lPlzbuGY1zRWyw8YEJZL+5JEx4e4fzD1KSffc3C3k36c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 13 Feb 2026 09:16:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] VT-d: fix off-by-one when handling extra RMRR ranges
Message-ID: <aY7d8ohWykrmOmf5@Mac.lan>
References: <20260213031801.1744145-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260213031801.1744145-1-marmarek@invisiblethingslab.com>
X-ClientProxiedBy: MR1P264CA0090.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|IA3PR03MB8455:EE_
X-MS-Office365-Filtering-Correlation-Id: 12f6618f-d4a7-4e44-5bf4-08de6ad840b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y2YvNE5acG5OckU3ODRwRm9nb0lCY1FCNDRMSUk2amFBNVdMQ0tpQ0xnaWJ6?=
 =?utf-8?B?U2xPODRsc2oyejlqZmZvcmRyOEkwV0hYUkhhSWN0OGYyaU0yWkE0c1M2Q3NI?=
 =?utf-8?B?SVJPOFVPZENNZGZNQzZsN3hqRldnam5aYVY2dlM0MUtSd3ZnUTFqWGxqNmpJ?=
 =?utf-8?B?TEJFWWt6c0hmS1FrUCtGY1ZXcDRxMy9YT0p0dVhDRVZUekhyekhYY1hQa0Na?=
 =?utf-8?B?blk1R1EyMmFwMWttT1kyczJaUGNpSlNBWSt3bGRUNDJYVUU4TjNxR2FleE1B?=
 =?utf-8?B?dTRBL2N0MUtkVVZvWFAwRXdweGdWRWRyd2NlTnJQVFBCVVYraExsbmY1TE5q?=
 =?utf-8?B?TGFHKzhzejRjbkRSb1NEdkdvTWUwWVVBTHlZdHpTNy9Udll0cGJRblJYdHpF?=
 =?utf-8?B?cnZrRWU4eUNUSnFFT2Fqd3hiazlhV0tGbERMK09Ob1FxbjIwNkJZMGpnanVL?=
 =?utf-8?B?SEdLaVl4WUtIejNjNmJJT3d4NW9vRG9ISHhsQ3NXUHZsU2hvUERta0JFZWRz?=
 =?utf-8?B?Sm4xc1lPSUNoSTdSczdNdjlpN01MMmhVM0E4ZDFENXV1K0w3aGZUVDZkK0FL?=
 =?utf-8?B?N2tKRlVCUWRJUXhYdFZsUVJjYTNtN1VuNlZFNkNSR1dZcXJldURSalJkT3l5?=
 =?utf-8?B?clJuOVg1N3lOcWNrSG94QmJndnlRTGo3b2ZsNXNTcGRveDBJbW1WdUEvUXFS?=
 =?utf-8?B?RmpoRzFvNGZscC9WbytZOWJoNFM2TEk5dndwbEtoNkpaby9GNHpqY1h2dUpv?=
 =?utf-8?B?WjNTYVEvcTJneEFNU2p5cUx6NFpOWXdKUU1maDZqYlFic3BubVhrUWY4ZXln?=
 =?utf-8?B?L1ZsZ2Q4REhJSlZIMlNNemFxb0xIbVhhZmI0SmJIZm9pSnBiZEQyYWl1Um9Y?=
 =?utf-8?B?UllOU0xTWlYrK1NrazB4RnFGQ3FQRE1xc2k0UDBnMlo2bnlTNXZRTEJyK0lR?=
 =?utf-8?B?aW93ckxtdEMxQnRVVk5EejlDbG1QSzVMTXRxTGdlTW9HUi9ONlBpVlQyemJK?=
 =?utf-8?B?Z3o3bzhFQUFVWTV5Nm5VeTAyRGJSSEQ0TitvalZVSWtCZHZ4YzVqVWdQRFRy?=
 =?utf-8?B?RW0zODI0dENXTHR1OVZqclk1YXFHYWVSZ0ExQUEzZS9ZaXdJejZ0bEJrVzk0?=
 =?utf-8?B?UWt0Sm5lVkdpelVuUGJuKzBwWTJJLzVGNXlxU1FjWWRpa0h0MzVHa1UybHA1?=
 =?utf-8?B?NWtjZFBRZTBDMHFHeFA5RUQ1NzRzWEkzNmJWeG83WVhxbzZxVHFYUVQ1YW41?=
 =?utf-8?B?VFBWL0N2Y3ZuK2p2U0xSYkk0TGtkS0xLaVh4ZGk0Y3JHdWdIam1OUXA0OE5v?=
 =?utf-8?B?ZzM2MFBKUDJzNkRsYXg0ZUNxc2lnais1OWRoK282ZXVLZzhaR0FNTURDbXc0?=
 =?utf-8?B?ejhKeWlPaGFhM2FEeE0wVUJoOGF0WGJ0ZEJtSVp1Njlnd3YvUVdjMVdoZGNp?=
 =?utf-8?B?SUMzbHRwdVlIdHF3eGxuSmYwVndoWXRhZjRZRSs0UWs3WVBDUlFsekpjZFFt?=
 =?utf-8?B?aWE3T1I0R0lvbThsa3lrVkhTd2tJTUFXSkEzdkwzVkl0eE9BY2hDTk9RWC83?=
 =?utf-8?B?ZWtVQnAvT2ZUYS9YNmRqaGdUSWtLbVYzNVpzT0FrSkhyTGRUSll5QjZmZUhR?=
 =?utf-8?B?OEhvanlIQVRBSVNoWVZrYmNSREVHY3hEVDBLbFR5cTdjRmFHb1UxNnJMdW1B?=
 =?utf-8?B?UnY0SThUM1RWdFdxRFFOTnJXN0tkM09EbmJVMmQ5SGVwa2gzUlorQUh6QXUw?=
 =?utf-8?B?NHpRYlVmOEtHY2hUL0lJMzhQaHIyQTFYNkhCRHZLOGRjNXdWTGJvMFpRVEpo?=
 =?utf-8?B?NFkxekFwNUZQZmxhRktDTUJaRHNoR2lJNjBTUlJsYVM3cDY1REpLRmoxYlIw?=
 =?utf-8?B?U2gwdmp2SXpnazJYaE00MFY0azh6MENxNkMrbkFsM0lqd2dqUDlWQUU2ckNr?=
 =?utf-8?B?Y2hOOTF2cm1sNGg5TDRHSzBHbTJZeEplemFSTmNpaWtTUEJFUDNDb2krT2lG?=
 =?utf-8?B?c0RtN0VlcE1RYWxyR0wra2srbVdJWEFsRWhNNjRkVUoyNTNra3lKb0JuVVA2?=
 =?utf-8?B?a3B1YllGT01YYS8rY09FbmpMV2xYQml6aUtFSm9FRmJNajN0VlFTWW5GSnZl?=
 =?utf-8?Q?e4WQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUMwKy81OEl6K1ZSWHpTSWszYXcvM1E0cjFSdkNWNDBXbFd5b1BqNVJtTkJl?=
 =?utf-8?B?VUxTR005NGVYMDRxVW9rY0M1Z0FNTGF1eFdVNS8rTitGaFJvZ2Z2SStqRXM0?=
 =?utf-8?B?LzN6UERqbE4xKzBESWlPeWZoaCt5bE9Wd3o2K2ZYa0VtU3NRQWYzZzgrUHlV?=
 =?utf-8?B?VHR1empXakx6bjRRNVFZR25KZVVCTjlEeGtsSDNRMTY2QkdrY3c1UVlLbFZl?=
 =?utf-8?B?TnR3U05UZUlPQWxGNVdSbG9zcXp4VGdXTUhzVFJvRnRmMVJ5NU1OOUxDbnRP?=
 =?utf-8?B?UU11a3grWkcyWXBoejhIRXgrR3NaSmN4aGNOVU5CSFV3eW5BZWZPdEFXNnhp?=
 =?utf-8?B?TVJWM2hTUkx1U0lhZnJqc09RTHJwREppdUVuRFJZTDZmcnltc1MrMWtMa0RU?=
 =?utf-8?B?NEh3ell2aXpkVERrYmh5U3RlTWFFUGxvSjJZWHdYWTZDVGVETWNBVEFnelFN?=
 =?utf-8?B?cnZBL0huK1luWnpITkhhVEM5ZzlHVEVYakFROFlmczJaTHIzdEY3WXRiVksv?=
 =?utf-8?B?MnRHTUxmSlJNN3l2QWY2SFZhdWowcmJmTUNkSjV1aUNoMTRkb2FVaXBmR1J4?=
 =?utf-8?B?Uks4ZjE4SjRabUJ2K2RveG5WMW4yb2ZQcUs2Tk1pK0pkV0tZaFJ3cnpxTlRJ?=
 =?utf-8?B?c2lFYnRvcGpFOGcyUkxhR3BIVTRHTXhvNVFEMDQxeEdObElJZUFKYzQ1OHV0?=
 =?utf-8?B?cXp1RGpwL216RFQySW5aSFg4WDBjZzVNMHRnVDByZWFJQVc1WG9SZkZrOFRM?=
 =?utf-8?B?UUY0WElnc1VzdlhnaTBEL0FTWm1mNm0zNzk3bm9YN3JqbHRqenFNNDkvU3lt?=
 =?utf-8?B?R1lnQ3hlY3pxTjgzS2ZlbXNSZWI4Z0REQUl0SUl4V1llaTY5RVJTT0NyTEFV?=
 =?utf-8?B?QUZhd0VPV2FnRnlTQmQzMWg1NjUyQ09GbHc1YTdvYTVFN1lyeGU1SWcrMUxI?=
 =?utf-8?B?bXVDcENHYzFBRGI4WmxiRm12VEhBZmE5VlllZThVYXB2ZERjK2lOM1dHYUpE?=
 =?utf-8?B?M3Q5bHZYc3Q5RWRhb2Yxa3RTWDdUNjZ5U2gvRDFGZjBXN0o5RE9lSkw2UDB5?=
 =?utf-8?B?K0U0M3RiWU1xNHdKSEFtRmt6Z1lUMGt1K2Y4WktzcWd3dDAvRWlrMUI1b1Nu?=
 =?utf-8?B?NnZKeXlsL08wZzdpR2tYSHErenNBWWlkU2ZwaFZHS1pLS0Z0RHlzZU1YMmw2?=
 =?utf-8?B?blJLTzA4a0dlQnFDRDhJbXVMeHVNdnUyek0zaCtiamNDQUljT0ZWaThjM0hl?=
 =?utf-8?B?NlRPdXl1bWZVVThvaDNzUk1JdkpBbGduWUVndk94VVYwOGxoRDNpenpmdC9s?=
 =?utf-8?B?L25QTWlCQ3VOb0ZPQW95S0JmWHh5eXhBWXBsMUNQSW0rSzdYdG9abnlmRmR5?=
 =?utf-8?B?ZlRXakJMRnNRb2pEeWJUNWlHdUtpaUtwR2ZnMjZSaDhIU0piUHZNOGx6ZnZI?=
 =?utf-8?B?aGlqL2JnRVFIRTFzbStZYkxMcWkxZ1p6anpSeGRxRzRCOXRTVTI1eURtb29t?=
 =?utf-8?B?TU1ETU1XSmRXUTZOM2lWWTV2RFV1eVVmSTFFaDJoWDRwRzNwTHYwRmNjc2VC?=
 =?utf-8?B?NXV6WU1Eek1jeTh3dnhteit1V0ozWWlvZkFKaFloZTdCWHNMNmFYYjRMcExH?=
 =?utf-8?B?ay9keUxVU1NKakFuWnZjTlNqWGwyNjEybzVCWGlTZHh6SXo1SVhMZGpWaEUy?=
 =?utf-8?B?VVV4d0RUOFFZNTJ0TUN6TTRINGdzNStUdG9XdXVDOWlDQk1FYzlFbVUrWDVB?=
 =?utf-8?B?dEViSnVIQzQwZHJqVnBNRXZmcFY2Yy9OUVYzVE5Tc3VIU290dUpQZHRtWVlx?=
 =?utf-8?B?TFNCeXpDSFIySG13ZlVJZW5FMTA3ZzN1T2dtZzYzWURkdmdKM1NudWV3L2VI?=
 =?utf-8?B?Q24wc1RYclhSQllDa0RpZFhxUUFDQW1Rd3FZM3E5VkIrWmxzczQ4MEUrVVRw?=
 =?utf-8?B?SjVKVzI3QnNvcis0bzc4VkhvVmNSSUViVEV5N3lTazlWNG9COGQ0NzdIT1hU?=
 =?utf-8?B?cFVqKzhxc2dVNC83NmNmSlRleU1EUWJyWWlGZSthM3lvWVdZSUx0bFppaVNa?=
 =?utf-8?B?aXdPeFlnbktwV3phSEZzOFlIMXF5Q0JYYUY2dHplc1J1UUpRd1phY3JEVUZ4?=
 =?utf-8?B?bHgzMWhyYmY3emtGckdlSnNmS2htVlg1QWthT3BLL21hMUZqMUxvM2J1NlZI?=
 =?utf-8?B?bEg2ekpFOVRvTlZkbGE2RkN6blRTSDNLVEJ5dmdMb2x2SzhIb09FV2JXVi9s?=
 =?utf-8?B?SHpwRTIxYnlPTm1GSEJ6ekJtSUJhYllvRnlMTHFwRUtNdEE5UFlIdWhJbDJq?=
 =?utf-8?B?cy8rbFF2MHpUZGEwL0poWXRjRkdSNS9ZOWN0T2t5eGFBazNvSDNEdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f6618f-d4a7-4e44-5bf4-08de6ad840b9
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 08:16:56.9841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8CzPlnjOAr0mNxbLQbdi03KbLjHYSwZ430KWHkSC7Qgz9rtN5bNxLbQ9RLBJLyVX/cUvavi9FTtrGRPinQNhEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8455
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C7EC7133E26
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 04:17:48AM +0100, Marek Marczykowski-Górecki wrote:
> add_one_user_rmrr() operates on inclusive [start,end] range, which means
> the end page needs to be calculated as (start + page_count - 1).
> This off-by-one error resulted in one extra pages being mapped in IOMMU
> context, but not marked as reserved in the memory map. This in turns
> confused PVH dom0 code, resulting in the following crash:
> 
>     (XEN) [    3.934848] d0: GFN 0x5475c (0x5475c,5,3) -> (0x46a0f4,0,7) not permitted (0x20)
>     (XEN) [    3.969657] domain_crash called from arch/x86/mm/p2m.c:695
>     (XEN) [    3.972568] Domain 0 reported crashed by domain 32767 on cpu#0:
>     (XEN) [    3.975527] Hardware Dom0 crashed: rebooting machine in 5 seconds.
>     (XEN) [    8.986353] Resetting with ACPI MEMORY or I/O RESET_REG.
> 
> I checked other parts of this API and it was the only error like this.
> Other places:
>  - iommu_get_extra_reserved_device_memory() -> reserve_e820_ram() - this
>    function expects exclusive range, so the code is correct
>  - add_one_extra_ivmd() - this operates on start address and memory
>    length
> 

You possibly want:

Fixes: 2d9b3699136d ("IOMMU/VT-d: wire common device reserved memory API")

> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
>  xen/drivers/passthrough/vtd/dmar.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough/vtd/dmar.c
> index 91c22b833043..3da0854e6d91 100644
> --- a/xen/drivers/passthrough/vtd/dmar.c
> +++ b/xen/drivers/passthrough/vtd/dmar.c
> @@ -1065,7 +1065,7 @@ static int __init add_user_rmrr(void)
>  static int __init cf_check add_one_extra_rmrr(xen_pfn_t start, xen_ulong_t nr, u32 id, void *ctxt)
>  {
>      u32 sbdf_array[] = { id };
> -    return add_one_user_rmrr(start, start+nr, 1, sbdf_array);
> +    return add_one_user_rmrr(start, start + nr - 1, 1, sbdf_array);

While here, would you mind if we add a newline between the sbdf_array
definition and the return?

Thanks, Roger.

