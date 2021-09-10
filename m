Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D84B7406CE0
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 15:26:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184406.333034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOgXz-0006pa-GS; Fri, 10 Sep 2021 13:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184406.333034; Fri, 10 Sep 2021 13:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOgXz-0006mA-CC; Fri, 10 Sep 2021 13:26:27 +0000
Received: by outflank-mailman (input) for mailman id 184406;
 Fri, 10 Sep 2021 13:26:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FfYJ=OA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOgXx-0006lz-EQ
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 13:26:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88cd4798-fc8f-409d-b760-8ecc172aae59;
 Fri, 10 Sep 2021 13:26:24 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-9hVV-9vhPlyoQ1d04o-D1g-1; Fri, 10 Sep 2021 15:26:22 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5743.eurprd04.prod.outlook.com (2603:10a6:803:e0::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Fri, 10 Sep
 2021 13:26:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 13:26:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3PR09CA0013.eurprd09.prod.outlook.com (2603:10a6:102:b7::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 13:26:20 +0000
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
X-Inumbo-ID: 88cd4798-fc8f-409d-b760-8ecc172aae59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631280383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4iegrVGJOJkI5DVYkifWSk3s++UjHOET9in6aAVVUBk=;
	b=b5qFTc/A4JwDWaULLdIjZixiVZtUsfwR7dMqQAXdK+V0riqBP334GiNkNLEyJoG0T02K9N
	Knm0rOhNHw8DPJ85MzeHyz5tIBvPmnAYIpG5OAFd4tyccQG/bBy5L/P98vvY0AtHcHeeQJ
	6a0QPMr0ZpY9r9zI/YBOsky9AdO5rxc=
X-MC-Unique: 9hVV-9vhPlyoQ1d04o-D1g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3d9fgVQJupoY6XYVq9iFLWW/cey2KkZ2S4QcoOawFJedDhTFRF1CA4eYU7HwiD7Fg+uh2FKUPLg2iWzfhNWMfPoWn0lkU3zhSi/rnuHWQTwV9JIYFesjMatFv5gVRoznEIn0OmF/Yd0mC7Te5tgErpsxZQ2pLHzx52iOUqqVej4e1aXHPUIRmVl6+andB3pg6RJkNjpbklceBGTDdkdRrOydOiPAoWeNLad/FZEY6XMsC5+43rLCE/z5As/O652B3iKaOK2q92ynIeMMP9SgsZ8HSyTO3uZknxWkF46NbvJCLZolPOQ5JAHrWYB3EMacBjjsNUyegxzWt04P98wLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4iegrVGJOJkI5DVYkifWSk3s++UjHOET9in6aAVVUBk=;
 b=IeTzxQ6MonMVKSsHC2Idds2NwslQIn8pzte1qPJGyNORAlm8YaNNtJP4iXnNTZ+5qpAhY+/acREGTtQJwqWtWxMWfR46AqRYPk1khk8brEH2CdAOxmGwGnuq1uM+7nW/wWGgXXDbrVYBtac8UXrmLzrwA2Xomkv8Qxch5wCPDbtOQl+0QhFtlSWDzxn5d8+/fj0DlIPMVBr0ATWmFPn3uh8Nu/ENckJE0QjcVWHZHGUTmcfECXoGemQ6n5728ZpYOMpYAMADiwQZzQHC8yi77RD0dqOp1uXGygpovO+megwhXPZs4FzLdQx+Z+rD0g00fkEmbxvcaErqVJGMR5DsRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.15.1 released
To: xen-announce@lists.xenproject.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <35ca059d-77c7-49a1-81e2-e87687732e23@suse.com>
Date: Fri, 10 Sep 2021 15:26:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3PR09CA0013.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea47de04-83e2-4ad5-9a73-08d9745e9404
X-MS-TrafficTypeDiagnostic: VI1PR04MB5743:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB574383FE0F4525D225B6A1D4B3D69@VI1PR04MB5743.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4Rhxcxb2yCIFE0JviAyTRGSxGaaFGMpwi10/SIDvnF83ZK68X2naI88cRUcVpCOsABEEQwz6jgEW7BY0KVmfkNqyB1aMZHV77OhIBfQN6C6pDExwNyS4DkkrKNjexNVf4GBDfPzNUc3DTmIEJIq/cHeQhNcmBuYPjBHnGIZwPlRlfn59T8cA2QtmZ5sNbc+FCZILIcaGe8UlLcSt/qOTxw8R62oA25+5VidAjIXymnmvMuY7/c47CCPp0ApsUnbkNHpj5k0zdJ0a08ViV+5+BSV6LAjkY+ZIaknkbkcT7XvkeDRvOtslSTSiPeALPiExdgIIUSRQhBHsWhxnyi+4Z3i6eJda0qVBZb53ckOia2n9g5JkyDRZV+5I85jPQMacOIpUArRk8Gn172NNQzuSXYCVEf77D6PcygV4uYk/WwZl4q6IRupxSIAjt3pJfPXR7FHXQSz3+YLz+yvJ0tngtFSEGxNAlmD3FAJWa447gU08vdLiESEH1KcHnaxp+m2ho5n4VqTUstLdSNTerxDqXlXmt4vgYA2yYSLWf5i2OEIsa1KIl5C9VffbgXM7zNFBW4Fsm9fNvu5vIEYeQmc97ZK+U7GvEghzOdDsjIi8hJcqK/P40tpLJ2Ust2+cmJoLzm4jxVyri6fQvUv0kp8xo4C5GTFeMv/T4Cyla5egBEaU+tSB94O/n8dgMMKukqr/NTFgh3kRGjBo26Yn3+VKaVgmLDn6/BIzJiNqV5vMsdYrqq4CObPA+vGjZmRw5NmaGjvuftl1Y15QKzX0eI1iJSH+CICmYsVKSRbPgvSRssimSHH9k9Sg5e2UAIKPW+LW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(396003)(39860400002)(366004)(346002)(4744005)(186003)(31696002)(6916009)(4326008)(956004)(2616005)(450100002)(38100700002)(5660300002)(966005)(83380400001)(478600001)(66946007)(6666004)(31686004)(2906002)(16576012)(66476007)(316002)(8936002)(6486002)(86362001)(26005)(8676002)(7116003)(66556008)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZE5LU09McFQrNlZqcUJqTVNzSCtjOTFxYklDVUJtWXZZRWkzNnYrdU13YlJV?=
 =?utf-8?B?Tk50bnBXdVF1RTgzU2dqZEZaN1RIQWlIaVdqVEkrcktBT3RGYjQrdmVRTmJp?=
 =?utf-8?B?VjNVcVliaDFwYWw5VGlZeTRwSXlJQ0Z6WThIT2M1NVhOTjRDeDMyd1R0K05G?=
 =?utf-8?B?VW92UUJmSEVwN05jWGs3SjdUQmZFbG4ralpqY2tyZmJjK085T2ovRjk5dVNq?=
 =?utf-8?B?SU1PY01DQUxrazBYVW5YZlgrcThJRzdCRW5DN0xsMW5tR2dadFJpTG12emJE?=
 =?utf-8?B?Q2ttRExRSFJWdkZHUTRHVGd0TCtvV3ZOY0I5L21rKzEvM0VudFY1S21wbGpD?=
 =?utf-8?B?SXdpY2dnUGlYWE81R1MwbkdMQnZaNFd3c0MxSEt1YlVTYWVtb0lEN1Fwenhs?=
 =?utf-8?B?dnJZMzJRQXB6VDVQQzVpcExFeHhzUW5Scm9pY2M2ell5NjNxSlhhV2VUU0h6?=
 =?utf-8?B?ZVkvajhXdVlhSytpajlmMmRTUnAvYlR2ZGhTaWovT3dsMzBTNFJEZXpXZjRa?=
 =?utf-8?B?cG83MWtlNDI4V3AyUW9FakxBcmN0aCtHVmFXQ2ZxdHhSZ1JkUGRzN3NIc1Iy?=
 =?utf-8?B?QjRQKzFqZVkyU0dtUHh1YXFPeFUrSVJaT0VnMW83OGREQy9QaUJYT1lpOWM2?=
 =?utf-8?B?VTg2UkhKY2NoQm9Ld3VHaVFlNEVRL0V2YnlPWHBWM0hhRGxKTUs0NjlsOW9z?=
 =?utf-8?B?VEdFWjc4MlhDV1lNTEpMd0NIaUZrTDRlc0hCdnRXV000Z1lMWmpKOE93NU9w?=
 =?utf-8?B?WjZTaVdjYWJEbzkyTnBHaXFCRTZGNWdhbEtzSC9ra01zTENFbXZOYXE5WDBx?=
 =?utf-8?B?WjJGbWdaYVRVSThYT2FoR3JhU3pIZXR1bHU5cTJ6V0d0V2RsQk5mcHJEZzRJ?=
 =?utf-8?B?T3JMcXFsUUF3QjRuWDV3NUFtSnJYMW0rdFFsSWJ5cXJoMWRFSm5hWkdVZmQr?=
 =?utf-8?B?WnBkZXZvYjRkNWhiKzB2VGxObDJtSjdabUp1UVV2ZDBzVkQ5ODRGc3dMQ2U0?=
 =?utf-8?B?MTVqUnpETENUTUkycG0xdWJsOUNaNDhhTGZ2Ukk4ZWNJMWdOREcwYW5oMUFr?=
 =?utf-8?B?UnlkYS96K3hQTUVtMWthT1N6QTJxMDB3ZUZrU1c5Y0p5bnhuM1hROGZNNnBp?=
 =?utf-8?B?cWdwV21WdThLRy9DTmxEN1JrNnpQYkVUbURKRVZ3WUFrdVEyN1pUTmVSUUVX?=
 =?utf-8?B?akNOZitPaUgyTndHYlZzQXZTVXlDWTdpVmx6eGoyUGR3a3ZTRnE5ZjlnNlpX?=
 =?utf-8?B?RjI2bXVCenVheVVDM3A2SHVPSVZZbW9mbnUzRDlzbWFCbGczMDAyOHJ6U2RY?=
 =?utf-8?B?RTFvK0wzRUJmRHVQOTZRVC8vRlAyeStpTDZVS0FXblg0OHpYeWlIYldFZk5O?=
 =?utf-8?B?SkozMTl1SkFWRVpFM3A2TmJZYndYTVdhNzZZWE9OYlNzL0ZEVm9LWXNFbysz?=
 =?utf-8?B?azNIeGlka3NPUnR6M0xOVW5WaWo2OHVSSUI2N3c4THlxdWcvOWNhdGYvOWNm?=
 =?utf-8?B?R2w0ZHpFMDJSemEreEhtSHNMTmxpblpOcjEzWWw3YnlaTUttMlBIVTVNbVJX?=
 =?utf-8?B?eHlDcmFRNFBUeHZiclRKcXJSWlMwTFBtc2VCNmtUZ052TlI2Vm1SdzdpMklk?=
 =?utf-8?B?ZWJTYjBEdVAraUErSTgzZkdrOG0wSE5CSlZyYjljakJiTGJWNkZYazFCakcv?=
 =?utf-8?B?cU5FV1BBL3VJNFBqcnZhK21tRUpSSTN1alJSWjJ1bFUxYVg5eElDdUQwYW1l?=
 =?utf-8?Q?HIW0USM6tOLeQr7v8gYHnCSGWxdHRyKA6I38QpN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea47de04-83e2-4ad5-9a73-08d9745e9404
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 13:26:20.9552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Af0OWs+oNM8fWh4QP6AGbPhn/mZ6gJJSeNVXIgMbPyLWOMfDHs2dkbTQWr+pgh9nYdU+3LrrgLB/qsK5BE1IUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5743

All,

we're pleased to announce the release of Xen 4.15.1. This is available
immediately from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.15
(tag RELEASE-4.15.1) or from the XenProject download page
https://xenproject.org/downloads/xen-project-archives/xen-project-4-15-series/xen-project-4-15-1/
(where a list of changes can also be found).

We recommend all users of the 4.15 stable series to update to this
first point release.

Regards, Jan


