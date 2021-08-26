Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A183F8507
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 12:07:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172843.315389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJCHH-0004W2-Hh; Thu, 26 Aug 2021 10:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172843.315389; Thu, 26 Aug 2021 10:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJCHH-0004TD-EM; Thu, 26 Aug 2021 10:06:31 +0000
Received: by outflank-mailman (input) for mailman id 172843;
 Thu, 26 Aug 2021 10:06:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJCHG-0004T4-AJ
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 10:06:30 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 47ae04a8-0655-11ec-a9e0-12813bfff9fa;
 Thu, 26 Aug 2021 10:06:29 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-jYG5I5BuNfqfGqwtkTbOBA-1; Thu, 26 Aug 2021 12:06:27 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7149.eurprd04.prod.outlook.com (2603:10a6:800:12e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18; Thu, 26 Aug
 2021 10:06:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 10:06:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0041.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 10:06:25 +0000
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
X-Inumbo-ID: 47ae04a8-0655-11ec-a9e0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629972388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ode5oIKByJi+m41Wlx8Fdpgit/TZQa292rd6HNSJW9U=;
	b=lHxi0jkvfzPtLmiOnwIzbNLj/VaV3y1Uj5kOwupDvyaU8/IWi2Lpy0wnwlYW+1hPY4L2PO
	Vk7MQ8FpzR8ASjTje20N9vBLlk5soTj5OB4sgfmAczt0w1T2ZeBXDRUZsMZSPZxlkw4WPU
	H5IwvVLLX+kMzSADUMk7VjVEkPvqlPg=
X-MC-Unique: jYG5I5BuNfqfGqwtkTbOBA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMwjuYPpJrDp2pQuEBFlIX/YBQEqzICJM8S0LnW2CSurYNwLZy3NDev/eqkGD1sF0pnzUVrSvbtGhsDYiawJzC1dSIjuju/Mz3xCygumIBqolluEkZuHJsM1NQjaPB+JNDq6YUcTxve1caneMSBWjisgh3OaGmDMc1o+jt6YoI8QC9KO0STzyclWZS/CAoANrAchWEtOXmep6+G60NIThYe8XF914fYyEZVpv8W8A1dfvzWCGV+aFER7iJ1d7H217JHHMMySx+SlJrqMHW+Wayva3ZpViMiHVKL/KCpkAqAImg31A4sQtPZx9fmiVJzo+UJscJlJQ3gv9E7bmlAeag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ode5oIKByJi+m41Wlx8Fdpgit/TZQa292rd6HNSJW9U=;
 b=X7Fk0pjHkC7O3YkBFZH5sDWrrH/dknHIydQQi0Ck3dxMv7ZfQxymtAKxIcXxFG6lgTXDheTi3wQOr5gbzcXvcci1MvAD9TAQnaDZ9k8+TCoi7/zzhMkX+zlYMt1OOIzUwcE44QQP+TgK8i17NY256kVG3FEyeGoLo3drLBCxtQgpdggmFVnEJV0JTwJG3UWR+0wyQsni9EMIwv7qP0ym4xz+nrXuzPahx9a6gowKrqtEYYemFZoF9z0eJmEWAQgJf6fO7AlNJAyAg7pePEZZ7SJvqWOT0Q4qDIOPF1q+jn/UEUvGM5FwL/WnZcFgA82Phbzq/Z9Li8KzyPbLwOE/rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/9] gnttab: further work from XSA-380 / -382 context
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
Date: Thu, 26 Aug 2021 12:06:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0041.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f03cd0d0-3504-4125-d2e6-08d9687929f4
X-MS-TrafficTypeDiagnostic: VI1PR04MB7149:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7149ADC914A33676DA56DB3DB3C79@VI1PR04MB7149.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iE9V9k97b9uiIG/TrOTWT/9X13byB5vUNzmDrhTcGMMwJw+LePtUp6YRoGDIDbZVyoe42o/6To2TT1CLbgtwM+jT1K2L+FEszhP0jhKUrflH+QAPl+WeaDR5oqrsJB5DjYKD88oopkekQKe9ibXaqHqQsh9k4r/TWwQqAmlwejpCkTBZcXicpEDwsNyYXYyakH4sYpcjBQ0BdnSUpalg0L7poih4kQ/mjrF+s+Qyc72uUYeVCozoDY4PazVsIr/8EPZ4NmOhFNzmNphzfwInCoBdEyE+YzuH+EoDKJU84847LZqIgWGOhi58J95k8+ffXSJtACSImM4nIJf9NtaEc+UkQvFSAFMY6/lYiXfmMU6B/OyeT8RRoF/amDWJex37trm2DMPE97Nhk9VTqmWXVxmDK/BUWfvp9SGfIf4o1vS+RPAMV2C2uSF5FQiOLgq8W6ByO8+NGwHmES5oAzOls+42kZrUHA5B4p9iwRdV4GBUsjVgsaOCiQ5LQlTm+GQZOl4WMirKOUlsl32TcmcquAv4zD3omYfNoqARcqfD6q/uYlbfWhCt1a8ohkxCbg4oSY13I3uKNAWkckL102ckTOqRrIl0HNzZB6jvJEH84/7+Qw5N2Dnx92RHeDYVW83oYe9ftBADbgn2Zat/FuS0c9d9Xv+xDtpLtwHERg9Exlmnp1O+JUprPd6XU/KV3SDrYkCqidG6Ehaa8B51R/ZPPeoc3vTHScPKbyTkyKPbxlg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(66556008)(86362001)(16576012)(6916009)(316002)(66946007)(54906003)(31696002)(508600001)(31686004)(4326008)(8936002)(8676002)(38100700002)(956004)(2616005)(186003)(5660300002)(2906002)(26005)(83380400001)(36756003)(6486002)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2VYRzY4anpjekFjOFI2UjA3cXc5WHVtNUVPbTNKdExWOVdoc09KTDFOa1Y1?=
 =?utf-8?B?bHFmOXVmc3RxSHM4OXBocUt6aWsrS1k0UUNuUmt3czFKVkRQSUQyWFhWOGhm?=
 =?utf-8?B?bUFkQjFtZHdaQ1V6TlUxVUZ0VElPRy96cEdmNXp6NnlNenZqcnZ4TVNKYXl6?=
 =?utf-8?B?TUVNZzRFNTlhOGVoVXBYdTdGdUo3aXZ4ZWFiNEFVNXU0WkZuekJjUWFncjJZ?=
 =?utf-8?B?TlQ3KzJZZVd6em5VMWE4NUNYVFZwRWRUd1dvVkRvMTc4K0lIRHcxTnZpcHdh?=
 =?utf-8?B?RjZ1Nm1mZnRZM1FkQmRVazZuSjk4WG1JMFE5dzFSbGlZM0s1WVlzQ1JRT2V3?=
 =?utf-8?B?NUJzZ1VRbWp1T0NsZUUveGEvTG5zbm4vL21RK21wQTRrQTdJNEFDRDdYa3JQ?=
 =?utf-8?B?cHArVFdGN2xuSlE3MGZrbFg3NGFSQnhkYkQweXVydE1LU1dUVUt1eWVSK0d2?=
 =?utf-8?B?bVNKbFNGNjVUZ0huOVNacndlTzd3ZjViNzE3aERwc08yOHVtbDFSV0hMUUxY?=
 =?utf-8?B?UXVYZzVzTW1GTUl6ZHpya1pIZzVmaTh5ejc1bElMbnFtTUU3QURWNlRWcWhC?=
 =?utf-8?B?OEhBUGdDUjhHdUVGampmclFTYlYxVVR6TzdGZ1I3eEZ1bVBvbEpVeG1TS3FJ?=
 =?utf-8?B?ZFNSbTA1S2dLamJFMHhyY2kwSUpDcWNROThqeHhiZWpheXFnL2RBTitLVHNn?=
 =?utf-8?B?Rzh3VnozdzZFNVJHU3FESkxzcWQrUTRqcko1NzhwQktkdmFKclZwNVdyb0Fs?=
 =?utf-8?B?SGpncno4dTZCTnNaRlkxeUNMMnlPK3hvdmFDZTRvdSs0QlpjQWtnSFBTeWZw?=
 =?utf-8?B?TEd6ZFZzalhyTHdvR2VnRGdoVjdaZjhRbWxrRjR4MFRSYmVsaEFLeTRpci9K?=
 =?utf-8?B?RENNVFN2dktoUUZxS2d6ZndrRzBPbUJXcWtHSWR0RkVobGptZ0hXNm9lYlNq?=
 =?utf-8?B?STN6bjRabHlLY01yeVA2TTdZQnNlSXBuaHprb1QrQ0JRWGgvZ0laVEc2VGkr?=
 =?utf-8?B?aC8relRlQkx1SUptbVVVbXRtdUo2empkYjUrZDE1ODMzbW1vK1RCeU9TdFBO?=
 =?utf-8?B?QmFPWkxqbENGL0JScWl1VERaSFpvM2xRaFdoT2tDWldBQlhNdGQ3eEJJL3kr?=
 =?utf-8?B?akVJbW1iYVpzTzlsenNZNmxiOWF0ZU91ZmRnc0xkVmVybmUrQm1BUWRWOE1E?=
 =?utf-8?B?cmVQV0hVOGN2blJNNkx5eWNtM0tKdUROUFdNRzRFQlVLVlVaOXBad28vVDB2?=
 =?utf-8?B?NU1VblA1RUtFL01ITTVCc1UvM2lFZGVoT2ZIQWdaK2htdG0wU2Z6N3BjeTRS?=
 =?utf-8?B?R2xhMllHMWszdFpCQ2lVd2ovQmdOTnBlbHRFVW1mK2pvWXNnY1JZT25yelhE?=
 =?utf-8?B?c0xnUXF2eEVYK0FQem90ZmVXWnMrTFg5WmdjcHh2K2dvVCtVS3NQcW9IL0pE?=
 =?utf-8?B?U0RFamN1enFRRUVLYlRHdjJrQXVwVTkzV29iNHVsWXFOTVNpdWpkQkpjV0dr?=
 =?utf-8?B?aGJ3VDFNdm8xeTBWaVdWRFFKRzFPT1ByOEFMNlFDMlllZ0VySlQ2Rk9YTUlm?=
 =?utf-8?B?bHNKVU51eEhMbU5MWllBZ2dCVlFVWnFDZ1RaeW1ZZm9hYnFmVk93R3VKOVov?=
 =?utf-8?B?V2RXcTdPOHVMWHhBN3JkbHl6aHBPYUJudGNuU2NwTVZCZU9vOXViTEE3dkN4?=
 =?utf-8?B?bUVOdGZCTFRReU41QytFMnlwZUJqMjU5R08wd2RyOGdzU0R3S0t6d2hBb0FK?=
 =?utf-8?Q?RQGHOE3HzPYeMrv7QlTfU4wSY/rUEEsByfOs8YI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f03cd0d0-3504-4125-d2e6-08d9687929f4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 10:06:25.4907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjNunIA+ewP22Dp94UIfTp/XykYeRNX+pCigVKqCEv0AUmH21g04u0kjgTrbKvqtOW4hHHaj4Y6Mfd8ZFh4tJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7149

The first four patches can be attributed to the former, the last four
patches to the latter. The middle patch had been submitted standalone
before, has a suitable Reviewed-by tag, but also has an objection by
Andrew pending, which unfortunately has lead to this patch now being
stuck. Short of Andrew being willing to settle the disagreement more
with Julien than with me (although I'm on Julien's side), I have no
idea what to do here.

There's probably not much interrelation between the patches, so they
can perhaps go in about any order.

1: defer allocation of maptrack frames table
2: drop a redundant expression from gnttab_release_mappings()
3: fold recurring is_iomem_page()
4: drop GNTMAP_can_fail
5: defer allocation of status frame tracking array
6: check handle early in gnttab_get_status_frames()
7: no need to translate handle for gnttab_get_status_frames()
8: bail from GFN-storing loops early in case of error
9: don't silently truncate GFNs in compat setup-table handling

Jan


