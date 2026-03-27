Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CFmNuNixmm+JAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 11:58:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E54342FD4
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 11:58:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265387.1556341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w64tb-0004qn-3I; Fri, 27 Mar 2026 10:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265387.1556341; Fri, 27 Mar 2026 10:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w64tb-0004oH-03; Fri, 27 Mar 2026 10:58:31 +0000
Received: by outflank-mailman (input) for mailman id 1265387;
 Fri, 27 Mar 2026 10:58:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1w64tZ-0004o9-JP
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 10:58:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w64tY-007uEJ-VO
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 11:58:28 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69c662d2-e002-0a2a0a5209dd-0a2a4505df4e-22
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 11:58:28 +0100
Received: from [52.101.66.77]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69c662d4-5aeb-0a2a45050019-3465424d39a1-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 11:58:28 +0100
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by VI1PR03MB6160.eurprd03.prod.outlook.com (2603:10a6:800:131::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 10:58:26 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9745.019; Fri, 27 Mar 2026
 10:58:26 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXYh27ByHjIR5ZxuvRWmYOKDuUYg2xopLtFtUnAJS6GBnRNf4/AZaR92s2ztWPhzZp7VrszHOJu1KdJl85Tf8wQAuZCjUPlMfFjv4ClNlcxy9i94fYbtXnj8dYdIeBYVsdZUkRfPBpjSk1JyGbUx8owjW5jiCe0sd3jZ76bJVJ2EiJs3NOOz0BNYZ6OVsl8F8bJWTJmDVQrSkktvUQRBkMu41PUBXWjSYRngEmwsbOyzYqxHFkXdDYRFf+26lFn+XWgpJSttLqTsZbTVlBT8q/wfNAz8vHLcGao43mtD5Jd6Yzjt5EqLjTptQhL8AelZt7u1KLa3HnhSDIp/cYaqTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=se165X370Re8SnfjgibmhB332t7RWSJ80b3DwY8FBnY=;
 b=CmrBgGkUDqkx5VtvnRuFzw6Ky61rRiOVH4pjj8f11F5P5nKyYSa0mmxB7P9USUwcj4j3YsQ6kwvxYen19Q3oide2Hno1yam14512IRhjWyNPk301ddaIMlV0sp4H2nJ0OQpNj+ZB7KyjW7vLfykvr7ZXjkeGfN7oLXcTyz4L1pPYoH1/iUSwN+LmdN9rQCh3U2cJPpBl2r1L+//7RaaIQyxrH7hPNAfOoGliWm41EAVuyW19t4u+fEgoRYbJNWZchTZoLxC/Y1gv2eJnLpa+93tkVDXDQW8lidHMEMMdvirN1TWh67Hd2yqA5pYL6FNFXdA5X2iId1fi7AltbtRkbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=se165X370Re8SnfjgibmhB332t7RWSJ80b3DwY8FBnY=;
 b=CUpuDI8m6qK0tmtJUUfSkNCMWxc8emZSIFm2KdiANcr1K9UCTqn3kNsMhdOTNtNPjuN4IHFVbQzww+OiMKK1FKb0KkKHV0jM5z3dAvbsN62jflYGuW3ndhTQDKHtf3dH8SZEZ+MYFvTUysJzXsg2bpk3YePE08O5JFzwYvMI7T6Kgj2grLNhlz4lzxzbBPaKIOHIstcCcHneotQNfIiP/pSD4o48tDu4+fxW+nLRlKhBFAfIRVKx0GH8c/fUbOltcs96GILw+F7IwPxafryS8GV85Xpm8fJsApKnCmCRGOUlSKkh+w3bEEgjdBTqkm6yjVNIK110rXEJ4ivQ5+j19A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <40ac90e4-c643-4226-b590-6c4b33755807@epam.com>
Date: Fri, 27 Mar 2026 12:58:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/sched: validate RTDS putinfo period and budget
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Juergen Gross <jgross@suse.com>, Meng Xu <mengxu@cis.upenn.edu>
References: <c629e66ebf05d620423babf1e4e98866c1f75357.1774452210.git.oleksii_moisieiev@epam.com>
 <d37e995a-332d-4917-aa42-15a5fec2d960@citrix.com>
Content-Language: en-US
From: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
In-Reply-To: <d37e995a-332d-4917-aa42-15a5fec2d960@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::16) To DU5PR03MB10263.eurprd03.prod.outlook.com
 (2603:10a6:10:519::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU5PR03MB10263:EE_|VI1PR03MB6160:EE_
X-MS-Office365-Filtering-Correlation-Id: 684a593d-ced6-4054-1225-08de8befc593
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EUALEN3HWfKFajfuD1kpfZD0HeUsGz79RD8W8MU++f9omUBb5b2oMen65+z00gOZPEo5w2oJIB6wZpxwkfKEFVRQpgxp0qeBEI6FcWb/ylWF1lmFHw+4D2+URpfYvqaroyzf8K1cuN+a7ZhYcEQpxSJvCHgl8xUDoH5oxwHRn5hKKd81L79PsoIRoOQkYzbgkjkpcJ1LFTTlLKB1m98VmbAdetrBshl3rkXIUxkjfqtuCfnJiJuGjz3iaoZbMlgw5duX/a0ssCoiRCq/Fjjkc16IeBS2WqdXxVDqR4OdKpaqcntb6C+48iCF6NowYLcc89qeuWth1o6ZxDTpe3lrxcl3oAaIg3/ilvzocKEmNLjC7uOncOIWjIZDzLyGdjbBubiWaOXiyhvDRB44cm6VyY8gPF4QG1oP0o5E5rrl5V5dKyUmOFBYRCwMaLj7/RC2C94S3r+Xwlt+Yd6X1ICFsneZIxkrov2f1Pqw5q5/c5QiKWsdJGh1yZ0zCJhUE3zggD1ONFwJUAzaSs0pNi8uq4ZcmAVlCbXXYpaw4N7+5MPfYIuqEABiGmTiAv3Uf7l8Nforqtkq17l6sowTiXWUugfZNoxVj809OKyDgkDqTd4fTLAnCwxW4nGC37OUogGz9W1D1tFuwfYpVXJuppY1SscghOkl3uIxS44kGeBBNc/mrAZsoiwkpUkN2H3tF6kL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0w4QnN3NEs1cytRWFQ0cWdJdS9LSnpHQnRyNy93NlcyUlYrV09xMDg2b3Qz?=
 =?utf-8?B?eG4yVU5zZ0VyNTBOcGF0eGZGeFgrck5Ra2w1ZXpNYlBSZmdtZVkwQmc1UlRN?=
 =?utf-8?B?M2RxTU5zTGRpV0J0cmVyck5mamhyczRKTHlhY0R1M2FzVjZ3QTNFYVZPR2JQ?=
 =?utf-8?B?MEs3Vzc3U3JkaSs5YXY2RnNXMHJ6eUtwUlJOOXpoWkc3QXNOTVJwM2V1U2hF?=
 =?utf-8?B?R1B5Wm5MbGRleEMzQklKNUpqMmtma2hINnAzdDVjRWhGcU9oNGVTdzFnVytS?=
 =?utf-8?B?SWhhZ3RlaWV3UzBheHIwcE1SaHY1UVZUVmNYb2d6YzBsUVNScTlLalZXY2N1?=
 =?utf-8?B?NE5iU3hvRmR2b1dsTXpRUENuQWVSQWdldExXbGpvMEVWZ3pudDZKdFhyUlV2?=
 =?utf-8?B?dGZpUjgxWDJjRk9Ub2doS2JXbDl1OUpKQTA4ZW5GZ1hINEpxejM0YTB1SlNJ?=
 =?utf-8?B?NmF2Qyt6ZVEzUnRtcjJwdDhzenkvUDdVVnZxVmNmcU5MbHZudGc0Znh1d2tO?=
 =?utf-8?B?d05DWklQVnFVZXZTOWM1djRVQWpMc2tpQkJaeWdDeU1acTZCZDluc3hxNjhQ?=
 =?utf-8?B?QVRUd0J0bk9GRnlMVjNhanZ1R3JtbzY2Nk14K0VNOGU2MkZRR1NLSFZXOWdz?=
 =?utf-8?B?eWROZHRWL3l6L1p2NW9SQWszTWVXWjVXcGJLRFZoK2VOejhXalhWbTZWbnNw?=
 =?utf-8?B?b0RrbW1GdURxM3dPNFV6Vk5JUTg0SnVhYVVDV040ejFmQmltNHdXNFo3NEJp?=
 =?utf-8?B?T2E1c2MwZm45YjhGaWhueFk3N2Q4RWxzVS8yMHhoaUM3WVgwZXhXS2pqdnYx?=
 =?utf-8?B?b2U4enFRMFJOM05GUDQ4Y0FpcjA1dGdDY211WmVwTmtZb0I0M3ZXN3JFMGp6?=
 =?utf-8?B?cTUyNHg4KzNXZjB2R1h5R1QrZ3pTREdKZExsMm41emE5ZytSUnhnZnlsdEQw?=
 =?utf-8?B?MGR4U3lEUnNKZTFvVEM0QUxCSDRML3kxQ2hab0RRWjIza3NjaDlNZjhBd1N2?=
 =?utf-8?B?c29pUUh2Qmw5NDlTL1RaVjIzd1V5VysxU2xFU2c0Q0hSempmYkJiMHpNLzg1?=
 =?utf-8?B?Unc1V05WWmlDMXJ5T20vZWVEc2hBci9QTWoxbkRWcnFML2RZbUoyejZIcjFU?=
 =?utf-8?B?d1Z1MVJKdlQvWVNJKzRocnVnRE1PRnM3NTRDR0xxNkdVeG1aa1pTcjVucXZO?=
 =?utf-8?B?aUJaUWU5aWROb21BZ2JsUWVjUmZqQ1E2QlJSc21qNGQvWnFsc1AvaEVQakZl?=
 =?utf-8?B?QURpK2RDd1V4SzhqNUZZVWx5V1NIZldsd0RYaC9QdE9FaTBPSTFIbVNiTjZq?=
 =?utf-8?B?aXdpT21IYnBNUldjRS9UYkhQVEp2aExqbStpdnBSNGx1Q09IM3RIeGp6Y0VK?=
 =?utf-8?B?MzRvbDVuUk9GNFFRUFBlb0dKR04rOUFGV0diVHBkLzVGNnd4bExvWjZ0SEUv?=
 =?utf-8?B?c1JhODNZRHQyTTUvZnZ5clZtY1ZOZVY0YU90YjZPSk5yc1hqR1J0b0hKTitH?=
 =?utf-8?B?SUk2Q0p1ZlR0Y01PLzdZZEx6U0lRVE56dTVMZXBwUzVZV1UrMG5sU096MmdL?=
 =?utf-8?B?enArWUZZZDVINmg5STd4K1ZQUTM5anQ0YmNKbTlwVjFzZzBHYVBPYlA2ZWtP?=
 =?utf-8?B?ZkhRNXB4RGgrM1JsZW5EblF0bkYvdWoxaWZUTEZiNzBHTWNqS2xFM2NscjR1?=
 =?utf-8?B?RTZqL1l1dG42VVRVR0hQRG5sd2xyWXNhd3lsM09RMlFJaWJubmVmWHZGMW14?=
 =?utf-8?B?bjFkaVpTZld3dVcvSlFOMlBOcmRUNVJJZlZrTEtBbEtHZFZDZU5LZEZFRk83?=
 =?utf-8?B?UGhad3A4aFJvYWNMSlk1UmxGOXhzTmpiWGVRYkJJSlE0UTlwbmM3Vmp0YTIr?=
 =?utf-8?B?MEtZVkxjWHNIUVJWWXV1NXdSb1RoUjdOUmFWS09PVmlGVXlya3EyeDQvVm1a?=
 =?utf-8?B?d21CVnVWQ2dpejlmamhWUmM2UURDMVdDalhHZVBYdzI4ellzak4rT1NpbHo2?=
 =?utf-8?B?Q2F5WEttenJBQ0JFU2JMSU5HK3VIQ3djWGJYTDhqaWc2NHZtOWlOM0VuRWUz?=
 =?utf-8?B?aGQzQzhQTWZVekd6UU96bk5VYkUvS0QxZWFJb0JadE11cDU3cC9TTk4wNWow?=
 =?utf-8?B?cHR2S3luaWdWQ2xSVU1Ec0sxNThZb1c5RGNXZHpZNEFQWGpkMlMxZ3hVZVBE?=
 =?utf-8?B?My9mQ0lrU0JYRzZZNmxXbEc1T3ZCVTJ2SzhEelM1QzBqNmV6b2ZQZUJrcUgz?=
 =?utf-8?B?MHhKS1RwZmpoRGdOclVtL05LZUl4WXlCSCtqSmgwS05TaGlHYnM1SXpUeWZY?=
 =?utf-8?B?K2hSWFpjN3ZzU2tJN3FEbTJ5Z2ltSnlaOWh1b2tybjB0MGEwNnRTSGJwZ280?=
 =?utf-8?Q?KbSLalefeY4DXPW0=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 684a593d-ced6-4054-1225-08de8befc593
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 10:58:26.2799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UnQaFF4+9Ao8LSZh4q0DR+PSkmp90oX5EQOKglQtoNl0MSrvBLEXjts3+Fmy1n73cZIkIdlPatSwNb+aNopyatzrwsSIvt0QXKgoW3s8GBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6160
X-purgate-ID: tlsNG-c201ff/1774609108-2169D488-8A271A3A/0/0
X-purgate-type: clean
X-purgate-size: 2439
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:jgross@suse.com,m:mengxu@cis.upenn.edu,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksii_moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksii_moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 42E54342FD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 25/03/2026 17:45, Andrew Cooper wrote:
> On 25/03/2026 3:24 pm, Oleksii Moisieiev wrote:
>> The RTDS domain-wide XEN_DOMCTL_SCHEDOP_putinfo path only checks for
>> zero values before applying period and budget to all vCPUs in the
>> domain.
>>
>> This is weaker than the per-vCPU XEN_DOMCTL_SCHEDOP_putvcpuinfo path,
>> which already rejects values below the minimum, above the maximum, and
>> cases where budget exceeds period.
>>
>> Use the same validation rules for putinfo as for putvcpuinfo, so
>> invalid domain-wide updates are rejected with -EINVAL instead of being
>> applied inconsistently.
>>
>> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>> ---
>>
>> Changes in v2:
>> - introduce rt_validate_params helper function to check period and budget
>>
>>   xen/common/sched/rt.c | 37 ++++++++++++++++++++++++-------------
>>   1 file changed, 24 insertions(+), 13 deletions(-)
>>
>> diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
>> index 7b1f64a779..645b091de7 100644
>> --- a/xen/common/sched/rt.c
>> +++ b/xen/common/sched/rt.c
>> @@ -1362,6 +1362,20 @@ out:
>>       unit_schedule_unlock_irq(lock, unit);
>>   }
>>   
>> +static int
>> +rt_validate_params(uint32_t period_us, uint32_t budget_us,
>> +                   s_time_t *period, s_time_t *budget)
>> +{
>> +    *period = MICROSECS(period_us);
>> +    *budget = MICROSECS(budget_us);
>> +
>> +    if ( *period > RTDS_MAX_PERIOD || *budget < RTDS_MIN_BUDGET ||
>> +         *budget > *period || *period < RTDS_MIN_PERIOD )
>> +        return -EINVAL;
>> +
>> +    return 0;
>> +}
> Code written like this is horrible; both to read, and in terms of
> generated code.  Because of potential aliasing, that's 7 distinct memory
> accesses because the values cannot be cached in registers.
>
> You'll get far better code generation by writing it more like:
>
> {
>      s_time_t p = MICROSECS(period_us);
>      s_time_t b = MICROSECS(budget_us);
>
>      if ( p > RTDS_MAX_PERIOD || ... )
>          return -EINVAL;
>
>      *period = p;
>      *budget = b;
>
>      return 0;
> }
>
> See https://godbolt.org/z/W63TY8qTW
>
> But it would also be better still if you passed op->u.rtds into this
> function rather than {period,budget}_us separately.
>
> ~Andrew


Hi Andrew,

Thank you for pointing this out.

Will fix and make v3

--

Oleksii.


