Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3519E51149C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 11:59:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314770.532982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeSV-00077A-Em; Wed, 27 Apr 2022 09:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314770.532982; Wed, 27 Apr 2022 09:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeSV-00073r-AS; Wed, 27 Apr 2022 09:59:43 +0000
Received: by outflank-mailman (input) for mailman id 314770;
 Wed, 27 Apr 2022 09:59:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njeST-00073j-Rc
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 09:59:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c158519b-c610-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 11:59:41 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2053.outbound.protection.outlook.com [104.47.5.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-ajdErQyMP6a36yr8FDNNMQ-1; Wed, 27 Apr 2022 11:59:36 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DU2PR04MB8520.eurprd04.prod.outlook.com (2603:10a6:10:2d3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 27 Apr
 2022 09:59:34 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 09:59:34 +0000
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
X-Inumbo-ID: c158519b-c610-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651053580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5td2FdYA/G1v27qOZaOflsBMkVwmcDVOxrFdmF7XrQg=;
	b=hj7ZDQE+koFzXiwYKIXNseS6pCGFa6QZxHkaG+iWweGuBjETZaWicwq4DQ6q0YF3oKxD6y
	xd78/WurRiT72ST7gd2Le7jSZLFOGM1X3tIT7C/H4HsRKK2vGkgQ4GHi397hv5pWDhzmSQ
	DCrRL9TR4baAsbKKBGhG5+iKGg9q3Xk=
X-MC-Unique: ajdErQyMP6a36yr8FDNNMQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBEyMechVssUhMLieaCdDJkPRK29DDeL13vUKkuxFfojvat3do2g1+tps12Y7CQNBRBQ8oZfkDyCPR1Zqkt1MKhUUXpoxGg1sMt9QiUTVxAODyayuaDWD2JUYf/VmY3tAc9Xcg/KTDlMDerxNQVq8G9p0e5Gqje4g/XH/p7zjDlW5lvJN3YWcuvz4vOcdYMRsiL2igdTzSSxBmpmsjih7EMLImVA4fEE2ynL3tSvGZzFVIeeryO2ifuROylrnYq0giXbToDg/rkVfaxTLUkmyWVWzSd8nxKmbAmdMVbL3RudrEmW9XVzZuB92oqP6Ys2oFXvOWTaWutOFjZ73P4CWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5td2FdYA/G1v27qOZaOflsBMkVwmcDVOxrFdmF7XrQg=;
 b=n0Eeb4JZd2gyMPzBSHC/YtOlaEBFlzkwDsgsOwkOPFwMxJjFSKObsL/nfgzX6m+1yXFcGsFcFTdaM3pN0WrXR70HO5JZpbsPzUzhhYHpqRL1NBdoM4DTgJsHNWKYCucUYwH9U1pnx1XsnVf8sCcnlNf2WBeoz2JMArzSmNAzMYRRO5nZ6ytyWsPbdyZ94fRAbiztuogMWIDdRBwlt/wBVierMGAxiYfpNRejBqZ4HKwU+t5BTtICAFBYad6/4Ink98Swu80QjCdOivgd3HNxsnzk8v9AhO192MQQfvMCyVdk/DGjxfZ/gZo8SNvYKNMX0Pjfq0LhdDZDjaHwyMKlbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <313fdb48-9164-3165-365b-5073b09e68da@suse.com>
Date: Wed, 27 Apr 2022 11:59:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/8] gnttab: Remove unused-but-set variable
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220427094941.291554-1-michal.orzel@arm.com>
 <20220427094941.291554-4-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220427094941.291554-4-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0007.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::20) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68edcd34-7911-421b-3d80-08da2834a191
X-MS-TrafficTypeDiagnostic: DU2PR04MB8520:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB852038D35AFD123205808A57B3FA9@DU2PR04MB8520.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+4RCAEkGSPppwCA1ZtCnaRamEEP0oOyahsbVn4L5WHdVkLfBDoqBaJKcta2UvIWy4OOlEnzKwdXfpvFdaFSiMSvlGAAwNRcvaVWn5/OSk8O614YDNXr40XI/uSp+IFXtimXtuRCFcmtB+7lx+UAq3btGKaPyCVc/+HtLIfC8mIVT1EBAmtVOdoW1RLWJ4xor0V7mz/UUNeuUVysUjm6I6EVtW1wDALkW49zr8PlFjLkWgKr3cPJBDjOnkDS72mTaMhA/csYvWotmfXxoe8ZvpV3notQQuOWABdx+9pUM5I6hVEubR3RlduOdWae5gUIAwwyDrzNBjzPTDReRWV7tOn1Aeq4fM5/UsD++hYUQ2+VXlT6RDyykUMpHKyrNlxZ2cSrTaqc0znz2dFWCHL3YUuasTj7bIH3A1gA3WEkH5V646y1UOgMllH6vvG4MPZ6ebeITWQTrM3AtoDuYEuqJxSk7kbQjpRUUjfYrRzOQ3rlOV5XqlrUGQNeoxmGYg6Yu2OLSCWmAeiFEd+LE2ybA1occNowRbYBcplXzCtI8vFxgPvUETNGwAOXciQk4ZES9bSDuNg+70Y4jNbGimvDzJtZk+Qr0adYOWOIHR7xjHWBrjtGmTw6/SjRpHBjMOfulnhNySYktd1y5mmYsvxf/O4VF8rYn96Hjk37ENkkUo8EUp7vte69zvP9jtfz6b51vB0OoO84pQLsxwxc28gTVchXjcg3W6Tx3ztZafphFkLUdqY++Kt0z0fczU4j8GQNt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(508600001)(2616005)(31696002)(86362001)(6512007)(26005)(53546011)(6506007)(38100700002)(6666004)(186003)(2906002)(4744005)(66946007)(66556008)(66476007)(316002)(36756003)(5660300002)(8936002)(54906003)(31686004)(4326008)(8676002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHAvOHdhYkRRRFREQjJrZGNCdWR2N1EwcUl1WVRCRW5NMHBvMmZIWWFyQ3dh?=
 =?utf-8?B?cUdCSWdoUm1oZ3NkK3VVeXhNUFdtYXdrbmk4N01YTWJYVDVSUm93MWdPbWxh?=
 =?utf-8?B?b0M5d3FGRlZWeG8wOEpNNHhEUk5BbGs3MnFCUmVnQVBXUFhaS0lrcnJGMzNH?=
 =?utf-8?B?Ym9Zb1IxdzVLVWZEb3JkYnZmcVRRVFhkRmtIWEZKcU53Y2JIeGxrL1dDT3d6?=
 =?utf-8?B?Y1JnQW5GRklYUmFvcW5zeHkxOCtoQ29Qbk9YVUxHaHZuWmhLV090dUVzR2Ra?=
 =?utf-8?B?d1NJbDB4ZU5xanB6SUkvSHhleXFkbm1HTE1MTzl0WFN1WnZHRXNvOWNlT0FD?=
 =?utf-8?B?UmVxNEt0cG5YTTNaZ1UzeXJWSGI2UDFLc1pyb0dudnlTVHNBNmJoZVhjWVFZ?=
 =?utf-8?B?aFJrcnU5OTJieUcybW9Mc3liTURWZ2s0eVFZVGVOMnJ2Zno4UFhRQmttUGFU?=
 =?utf-8?B?UmY5by94d1NBeEJtYlpYeFRQUUdYOCtiS0p6eTRWc21ranBKMTBRMzdManc0?=
 =?utf-8?B?dXJ2M2VHTUEyUGRTamlzVFVZTVNkb0tjZ1VXNzU3MU1ZQkloSVBPVWRWVCth?=
 =?utf-8?B?UTY2UFZ3bTFibk1BRnVtZ3U2aHlYMFZ1WHdlYlRoS1V2TDlDRUxCSkJqZlRa?=
 =?utf-8?B?UFNRYTFLclo3MlJSdlFpdDJuKysrNWRqQlVCS3BKeW1ocFFPamZ1Mk5yYktm?=
 =?utf-8?B?UHFtTkZma0xyN0owV25QQ1BQVHR5dC9EMm1oUlp6bGhWNmt0WUtLTjhpRHpQ?=
 =?utf-8?B?K21oVWowSnIwT1BzVVp2SjNTK2l1ZDRPeEFWSndWNm5HSHRxbFlHQWFrUDNh?=
 =?utf-8?B?SHlPUDk2UTRPY1NEbG9JMkV0QVhTckFxeFRzQ3kvR2N5UDNSWERWSUJUdmMz?=
 =?utf-8?B?cWpWYkdvUzRqeGt5b2lzdjhuQ0lxZWtIdHAyTnc0TU9FVm52aE9GenJvZHgz?=
 =?utf-8?B?OFNIQlFTT0tOWUxvSzh5NTlqMEllaFFHNlo2b3NZNjdyWWxGalg0aUphZ25P?=
 =?utf-8?B?cWJaSi9aZjI2UXJ4VHV6bXRPNG1qWU1CQnpHc3lPWU1WU2V4TGwwQjFtNkRt?=
 =?utf-8?B?cUlnSG9FRVZHTHJqRStnWFdkbVpYZEJCeXdsdkZJTDNEZWxWZ1Q3Y1B3Y1NE?=
 =?utf-8?B?MjVxMHIrdUluYzJ2YTNxd2c0SDB4NDVGdXpGcjJFU3NvOHMwYU9NQ2o1M3JI?=
 =?utf-8?B?UUxNdU96QVZGT0NnZ0EzbXNUWEdqL09MZUIwbXdsSjhKTkFJZmZXTmw5aXZs?=
 =?utf-8?B?S1BDS09TUkR4NXVER2NDVkhPdm1YWWRkV3FCSWdHR1dTa2lUVnUwZTZqSUVs?=
 =?utf-8?B?NFczSHVkL3M3ZWx3Z0k2Y2h1SmdRdUIwbG5wckVNR3BPL1JMeWhxWnhxNFJs?=
 =?utf-8?B?QUNrbFV4UHdRVE0zL3RuMFRMUEEvMW1pQXlTKzJKc2RQMU9TTHhSV0tRUFFE?=
 =?utf-8?B?NUlNQmdlOFdyc1NJcUU5eFlKTGdweDNWbmsxeXBVeVNwWFY2UTNlNXZGRHU1?=
 =?utf-8?B?WjM1NDF1NjFVckd4bE5FNW1jcUhrM3pxNE4zSlRMUFF1TTRTYUJWdFJ1NUY2?=
 =?utf-8?B?a3hRbHI1M29mcnZxbFhTUldsdjNVK2srUjRhYkw4UUUxTU1KRGRDL2xvRkxu?=
 =?utf-8?B?YjNPc05TWnpIeFozOVRqa2hHK0RjdnpWUGhHb055S20zVGhyU2g2eThhV1hm?=
 =?utf-8?B?c09nU0hSMnV4cm50MHZzVkU5eHVhbm9XYytrS1dRbVZuc2psNVpqTEFyQ2Na?=
 =?utf-8?B?UFlISXh3VUJmZ2dsdmRjY1hPSTgyOTJVbzBvR2tLTWp2NHNPM1owU2NFUDg5?=
 =?utf-8?B?dGVZTUtXVHZSZHFmeFF0VW9LWS9lM2VnN084WjNYV2xwd0NPekZabTA4NTBx?=
 =?utf-8?B?bEVydnBCZ3pmZjlIbkM1WjdiaUo1enkzQ0hOSjROVkVkd1A5RXFHMzRPdHMy?=
 =?utf-8?B?VGUwazg4NG5veThwVW02QUJUR0o1K0dIRElnV3pWTmQ1WUpMZmdsUVRjZUZi?=
 =?utf-8?B?VzlSWDNiRjE0RlhHRnB4ME5URjlDczNjclVsYnVNOWZPcGt3UkFQWGpBdFVX?=
 =?utf-8?B?T1ZldnEyTU9kQUVOSUtUcjV4SWZRdzBEVTExc2JUUUsrRnZmWVRYcmM0WEFQ?=
 =?utf-8?B?dFZDQiszWkxqQnlzWitpcEpxTjdQTmNvVEdWVGczVjNMYmdtVHFwZFZXN1l0?=
 =?utf-8?B?dHowc0hCSHZISDArQnlQZzVVTGJBSXMrMFpKS0RjekVMRWc3bU5tUlRRQ0hJ?=
 =?utf-8?B?S1NzV1ppdE55MnZyeThnb3JKdlUrYnpEVThTQW5LdGZuVktzcnJOaGJaOUNz?=
 =?utf-8?B?NlBrRks1OG9hc1JPaG5pQXUzVTBRNG9vRnoyWk54d3Roak1QNGI5QT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68edcd34-7911-421b-3d80-08da2834a191
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 09:59:34.1669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4CiRuDHLSQMbxd/otfNf8njuUQ6ZPycBXMM3DQZj5inaBmbgcI7cYRR5ORlC1V2fs7I4ogxzqmkPDJ6XbriLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8520

On 27.04.2022 11:49, Michal Orzel wrote:
> Function unmap_common_complete defines and sets a variable ld that is
> later on passed to a macro gnttab_host_mapping_get_page_type. On arm
> this macro does not make use of any arguments causing a compiler to
> warn about unused-but-set variable (when -Wunused-but-set-variable is
> enabled). Fix this by removing ld and directly passing current->domain
> to gnttab_host_mapping_get_page_type.

I think we want to retain the ld / rd notation. Therefore I think it's
rather the Arm macro which wants adjusting to not leave this argument
unused.

Jan


