Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GBL0OQL+RGqr4goAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 13:46:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 588216ECF35
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 13:46:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=wrZgnpiN;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1349840.1607484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wetOB-0000PY-HP; Wed, 01 Jul 2026 11:45:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349840.1607484; Wed, 01 Jul 2026 11:45:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wetOB-0000MK-Dy; Wed, 01 Jul 2026 11:45:59 +0000
Received: by outflank-mailman (input) for mailman id 1349840;
 Wed, 01 Jul 2026 11:45:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wetO9-0000Ki-BJ
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 11:45:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wetO8-008PKA-O8
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 13:45:56 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a44fdef-5cb7-0a2a0a5109dd-0a2a4502c3b6-12
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 13:45:56 +0200
Received: from [52.101.52.30]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a44fdf3-5a27-0a2a45020019-3465341e313a-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 13:45:56 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by PH7PR03MB7046.namprd03.prod.outlook.com (2603:10b6:510:2b9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 1 Jul
 2026 11:45:52 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 11:45:52 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJzSbWKGWhvITfFOAs179X3pp2NBtZDxe3KNlK+Ythw9J9n4e0Gn1iVIKuMUfU639os20dTfB26y/C1DPTnYm8sZgLd00J70PwueE06st7npLMNzgJ4fxWyT79j46g/iaX8GpDndOzE4h00yJhoFTEA+C8NQxTR80GdFJ+MswAeunoDzVytjRmw4bqw5ysmoQqOabm0C/osbFgshiUMSmJMIZGDaY08WBfZ9o5UKD2MdH3ClZunjPTOyo2qmeqDg4V/zwNKrtx1U0hH9HXRvMCZhyA06mcPoj63NEHaef6c96Vl8GABOKSGfrC+nGVAf+2fOpuz7wd0xUcodwjHk3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WueZbxSu5EcZz33Apb7DEOQvnEy4dTm+LqS2QV4IlrI=;
 b=j9HhHSXPlnGDgRpZrTwi3izVYvnFWEJyfBwWf5gwR5xhsgHPQ+NBuA2iLrvFiWE5gue3nTn5TDd+z2z84V0KA0sbsWkbH0nQnAl52B0hIUutTpIyOqj9MAtbrD40oRdrrzQV9Hq4qefGhHPS0u8GRG7g6q54f6Xrx5stY0O+c0bpbmrNN9u3STpZc0E5E+eTXl6qtj9XS5UULQnw8qPj7thp3lEdP8GmhoL8oy3v9f4mt3eVwAcOYHlSx6/NskRL3g4Bi+l3F6wSVSbDwb/vCZRJua3agRyR2OWDEjAFbcPGqfjQR11dql4YNgCjFiHk0nAKLpl7fx5K3x0jk71Kmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WueZbxSu5EcZz33Apb7DEOQvnEy4dTm+LqS2QV4IlrI=;
 b=wrZgnpiNc7MamjcHyTfqzlu/WRXhizOumvOyOCn1VIxRd3XWZPHNBdOdIlE+mATqqoLdtdVee6D0FhvGyBdOegsF4r/8vxvYde6GSsDNkzb1k7qoHIE1/wNat+GS7SyNXhFVTxmhHmKzuUA7vb/cLeQIM5W3/iMLkWEQfnBLoM8=
Message-ID: <4524812f-b9ee-4ef5-b5c6-7583815e859b@citrix.com>
Date: Wed, 1 Jul 2026 12:45:48 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 0/3] Change XEN_DOMCTL_setvcpuaffinity interface
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
References: <20260701111606.4063972-1-jgross@suse.com>
 <4e16c1eb-e1ff-4d7a-bfa8-223d357716ee@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4e16c1eb-e1ff-4d7a-bfa8-223d357716ee@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0615.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::17) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|PH7PR03MB7046:EE_
X-MS-Office365-Filtering-Correlation-Id: 4986ef8b-c074-45fd-72e5-08ded7664dc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|4143699003|6133799003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5VyJYrGJAoDB0ON/XCfXr4uUpA2USPuoKMPZJlQiqajkNoFE4LvGN7Rv8Zo6iWxLb5zKhXITWhdO+gJRZxtOJRm0LtT5zPmPyNKk5zy1heT6LjGp0XQt4+ETUAmDVzh6cOWWnU5tqMGHjcVqhWLoMnR7S1oac6ABv8J4HTCxtr/WfLuQwSYXsubNiDItnoFA8xta7cJ8J6ZasPeX6voXfxPbpbzFjncPPai2lEyUSKCq1eqRZV0I/cpoXwEK5I7Jb91Mdkz9Bi/V/6ESos8/dJAbwVKwW2hBvc6xeQj/SUx7R9YEeRbNzW4emGhuL5Dk4owSl+6gdh4X9mRB0s3CO7kbdSO7V/l06zVQjTt++QqRJ2G3WnzPo3nTZQqjauXF8FixCXBhlMUMfC90+P1lph68keCO8mu0K1YbegDoQUa+7d7ivfN3sGiHVx4y2Xpw3nuyw4i6/z0rDn2YSc30jh9gDOVKFMoYnoOYAZS0/ZDHIbPkm8oYlVo/w1lHv2axDxGgDVXC0n2yjoNZjDPsLYbkeb/QZyibZVA9SWlhlltHbnogk+YjpIl/xw8+d3QmvwdvPtNEHMFefiAQuMK14c1SA8iSyQrlB9yDC9IRh7bM9/15bvdBr+SeTEsQvniG/7jEzon6zrawGRcevbo44cDU/7RVKh4Cj2DGwpyvLVs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(4143699003)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXZlZll3L2dlZXhRMjNpRCs2RlpWckcvL1ZMdS94ejM3bnpkYzlteW9ybmJr?=
 =?utf-8?B?dGl2MkxJamFjS2NOZVF0KytoekFaeURNMjUzRGZWQjZlZjJDbk5Td3JKcUJY?=
 =?utf-8?B?cUptZm9yZjJIZk1USFY4bkhveEJ5dGQ5UEJTb2xHRWZ6VVJhYmc2S2Q5Z1ZK?=
 =?utf-8?B?ZVpucjQ0UXhSa1BQN3pIUjA1eGN2NzdjWWM1eVRYbzJ2emdKcUlUMkdDWUR2?=
 =?utf-8?B?aDRabUdDUVFvMXBibGV1SjYxQTl4NlJoUHY1dUs3YUo2V3VPQURPRkJhckhx?=
 =?utf-8?B?TEN5WGpVaFkyUE55RkhKUEN5MnNhcVpubzVNdmRXQ3l6MGR3cThFNEl5TEY3?=
 =?utf-8?B?ek9NMTJOWEp1c08rdmxDVDBmN1drQ2xuNjN4dmc4cUF1VkVLZHZBL1YxbEFv?=
 =?utf-8?B?TFZQWVlpb0RSK0lSUnNPNnd0THFHYW5Tb2dYeWJ6V3ZpdzQ2Ly9xZXJUdTVG?=
 =?utf-8?B?UWZKRTdyMXhVWm1BVWc4RGtranA3UWp4d2FueGxGREFsbHRyZjdBNExLQ0Q2?=
 =?utf-8?B?TGtNeCtvdGUrdmFqR25MVi9sVUVITkJUZVY4UzFqZ0l4dVhaRFNVOWhET0Rw?=
 =?utf-8?B?OFJNeVpUMHFsZnQxS00zQ2twQlkzc2N6dmsxcHJVbk82bktjeW1jSlFiSXUw?=
 =?utf-8?B?eUx1UjYvbzB1MGg4Zll0b1VUdTEwMjNUK2FhZmJqZUIyVEdGa2FESW9nNnV5?=
 =?utf-8?B?ejRoUS9rL3ZkNmJmUmVhcFk2dkJPZnVybUVVYlRMaW56NVR0NDF6dVlteGtJ?=
 =?utf-8?B?VFF3UW1XWjR0YVE4VWdFNkl0cFlmWlR6aC9kdFJ1ZUhZK2hoRlFPangweENY?=
 =?utf-8?B?QWtYc293Q1JxTUNmYWJSZllUeWxJL3kwcjFiOWVVZVlpRU9CMjA3bENtYUlV?=
 =?utf-8?B?NmhWY2RPTkRKWGJQbTM3MUxoeFFCdDJJWlRRR2YvQnNxY1FiT3U4YlRWUnVI?=
 =?utf-8?B?MFdsbU56TmtKUzI1SXpIQ2hsbnVwNG9TVEU3cXQ0eExQQURWOW1OZ1o3UmdS?=
 =?utf-8?B?eFJnWmdNUEtCWk1GTTMzQWk2WStjdkVFbStwaFdnclNKL0dsTkd1S3ZRZk5t?=
 =?utf-8?B?ODlQMFpITHRtNmhrVGNJYnJzMXZncXdJYVZVWGoycDExb2NKNEdiK2FjT0tI?=
 =?utf-8?B?MGt4Q0RVSStNcUFYTXdIY2JhRVUxZUt4U0RVbGdXNnQrYVV0Mk5BSmJxT1VQ?=
 =?utf-8?B?NU81QitmcnlWcnUzZzkrZUs2VlovejZSdWtsclRLZzBWdGZpNjdNVCtRQWJO?=
 =?utf-8?B?emNjb0hiR0NoS1dVWFpKWDV0MGxLRys0bFV4dG9aMEJRbWFTczVJWUVaNG1v?=
 =?utf-8?B?S0hySVh3QVFpMjg4UmRCamw4VHo1azExVU1wVDZ3Nkh0MDlIUExPUkIrR3Jl?=
 =?utf-8?B?Rkt0elllYS9KVGZWTDlwdXgzMXZoWHptL25WMjl4M2FKSElNcXZ3b1JrOXRE?=
 =?utf-8?B?USs0SS9aOGttdWN4U3dwWDQwamNwSEI2VU0zY2s5K2pNUEk3d25LTU5lMk9U?=
 =?utf-8?B?dFRhV0J1cnp6dllpNm0wQ0tSSHY5NjV3dzVvRUlUckVJUjZUNWZsUFl0UzdT?=
 =?utf-8?B?bDNqbGl4MDd5djhaZmRISllMb2phaklQMTZOZGx0djkzZEtUSGQ4S0I2N0xt?=
 =?utf-8?B?UmQ1ZVNtRENIK2hJemJ3VDRIdmRUSWZEOTUrYm9rb01qWElJNlJ5QjBkZmZ6?=
 =?utf-8?B?OXBmVm1BT3JVcVptbWRVVHUzK214dDJNVlJnNS9KMHRGNGY5R09Ib1Fjd01W?=
 =?utf-8?B?TGJPSFBKS2RUNXVwaHI3emlsV25ReTBtNjlBWTczOEZhYXRzQlNNbEVrM05l?=
 =?utf-8?B?K3F0VjlydUZZdzZKM0hka2lPWExMTkV0L2JuWkxDQVhFR3duNGdTMTJPYVZD?=
 =?utf-8?B?c29mdTcvcXIrcE1kdG1SNjVpME1BMWRQTk1mN0xXemNGb2JpS2Rrei81b2lK?=
 =?utf-8?B?eE1XQjBiYTVSdldOSnpRMEtQTnZiTEdaL0dOQjdlc1pvNWdOMm5uWC84WFAz?=
 =?utf-8?B?SjFiN1loMWQ0YXhTUTQ5U0JpYTBhZTBhNE93NkI3cng4ejk4b0hFZkdDT0Nw?=
 =?utf-8?B?SXdQelhoVGRFc0F6MmhuUkU2bHZRTnFXMXVOSmx6OVNVb1orNFB4M0ZUWHNm?=
 =?utf-8?B?UUh2c05sUGpOSEpKVmhjTnRvK2hWbkVXWERXZ1l6YXhad3BBWllablVUa3g2?=
 =?utf-8?B?M3liYmxwQnlFWGFPbXlWZFo4dFRRaVNjK1lLVEFWNnVuUmRnZkovVDFzVzlr?=
 =?utf-8?B?bnBrYXFTcnVzMlZQejJaeXFBZWFsb3E2cnBHLzErUERRaHkyMHNKN051ZXVu?=
 =?utf-8?B?QjkxZXdYek9KU3YvOUdMeXYwOXB6NEVMY1FnYURWUVhYODlId1I3cnd6WGtV?=
 =?utf-8?Q?0xIXZdVwvZHrhtQM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4986ef8b-c074-45fd-72e5-08ded7664dc2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 11:45:52.4960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dYOsnaYYPiZd4tfGUxUUjqmGAcxbmvphEbwLBxqxoKoouxfyyySroTiDpIdZLKELOHq1D5U1Vd5Q+RrG/Y8sH58rpSYCMbu3Cntvh0Pjdmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7046
X-purgate-ID: tlsNG-720697/1782906356-4F3137C5-23569715/0/0
X-purgate-type: clean
X-purgate-size: 1575
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:jgross@suse.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:mid,citrix.com:from_mime];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 588216ECF35

On 01/07/2026 12:39 pm, Jan Beulich wrote:
> On 01.07.2026 13:16, Juergen Gross wrote:
>> Today the XEN_DOMCTL_setvcpuaffinity hypercall will not only change the
>> affinity settings of a vcpu, it will return the new effective settings,
>> too.
>>
>> In case an error happens during this hypercall, the expectation of the
>> caller is that the affinity of the vcpu didn't change. This isn't true,
>> however, if passing the new effective affinity back to the user is
>> failing.
> That'll be the caller's fault though. Any -EFAULT coming back are an
> indication that the caller needs fixing.
>
>> Instead of making error handling in the hypervisor even more complex,
>> just change the interface by NOT passing back the new affinity. It can
>> easily be obtained by another XEN_DOMCTL_getvcpuaffinity call if
>> needed.
> At the expense of further increasing the pressure on the domctl lock.
> When making the recent error code change in this area, I was actually
> wondering in how far these two sub-ops might also be candidates for
> moving out of the locked region. Yet with vcpu_affinity_domctl() not
> using any locking that didn't look entirely straightforward to answer.

How does the effective setting differ from what's passed in?

I hadn't even realised that we pass data out of the set op, and it does
smell of bad API design.

While we do care about the domctl lock, I don't consider "extra pressure
on it" as a valid argument to be used here.  It's an internal detail,
whereas the hypercall API is an external detail.

~Andrew

