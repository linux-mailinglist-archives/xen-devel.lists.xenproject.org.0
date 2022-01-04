Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C08483F5A
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 10:48:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253107.434145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4gPO-0002oY-80; Tue, 04 Jan 2022 09:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253107.434145; Tue, 04 Jan 2022 09:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4gPO-0002mT-4v; Tue, 04 Jan 2022 09:47:10 +0000
Received: by outflank-mailman (input) for mailman id 253107;
 Tue, 04 Jan 2022 09:47:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+k5u=RU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n4gPM-0002mN-Dd
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 09:47:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 475dda62-6d43-11ec-9ce5-af14b9085ebd;
 Tue, 04 Jan 2022 10:47:07 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-9nc7WYgYP-yiWpCpA3GTKQ-1; Tue, 04 Jan 2022 10:47:05 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7037.eurprd04.prod.outlook.com (2603:10a6:800:125::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Tue, 4 Jan
 2022 09:47:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 09:47:03 +0000
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
X-Inumbo-ID: 475dda62-6d43-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641289626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cX6lMD9pHA2JSVVDjpxBuhMrJzEehAY1ERVtima9FWM=;
	b=hIFKpwH1zQv1Y+98Nt4bqDW3XDNe3Pp90u1FNYoWd+E1vjpV8Cnj555SO3+W/7oJadu2Qd
	66eVVdnolGqntV3EIItaUko9wkbH8j4Wbm+ZfI4RbHNfJQpTY8OMR7NzZTswnK7pOi6K54
	Z05WHxwpHhsrr7wVLw+oJO4XuYqBZyI=
X-MC-Unique: 9nc7WYgYP-yiWpCpA3GTKQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gx/UZ+TQNjKgcvhWNTpnBsjaUjt4j84RWS87ZRp64Hvpw3LVOaktRlCSbbqaV6qBfoReeyZYaHC1LjpmHTGSd6ObRGTEhpYISpybzur/7RbtVhW/365ZK+CTG8NoOFZEVoE6szbStCrGsDsQhsro5So0xpkgBn/0loJTpDhQCqy0HfX9nRh0vdujVa6V59aIb2iy6dmchmOo+9ZfjPBospWDi7JQLZUUdkib0ndyBJY9xNosZPVPO51EZpHSPQ9eOmqBRb/jQc7roH7uvv/OH0jU/xPdPLxbBBx+GusZFgpc7zCy6N8TK1jZjI+Kt1HnVp/VOa30Pca9l2iCPMVqbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cX6lMD9pHA2JSVVDjpxBuhMrJzEehAY1ERVtima9FWM=;
 b=YnweM91hLnQ0bvP4JIgUCABDu+7Fbrm5Mpb7HSmVv+pUJLVwveR+Sc/Rr1yfrXOS4f317TjU61EPG/z1VFemx+mA8/A0Cli5V/DaXtj+IxLr9fm1zE+X4QGf5wKPMaHSXNeYySV9CoxUo+AjCISwFUXIedBsx95Vchdcx+LM8GHV/hdS5n9YiWLVVsbFQkJSyOq4WxnT7uvwq6+I29CAnd36gwXXUq0majot1su3HCh4xZKtxwAAb3fWHfP5j3f4GMnWHO+BzGMgOTpdMXFTQEq/cEJs6LUJkA78ucF/7hGTnZAGZ2cO+QL+7yUfLYoo6RjZBi7m3nR/IuFSIsqRsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e9257e96-ede9-2809-9a77-fd4dc206badc@suse.com>
Date: Tue, 4 Jan 2022 10:47:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/3] x86/mm: address observations made while working on
 XSA-388
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0402CA0001.eurprd04.prod.outlook.com
 (2603:10a6:203:90::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bade08d-8c37-4fbb-1546-08d9cf672973
X-MS-TrafficTypeDiagnostic: VI1PR04MB7037:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB703720FA614FD79BEC3993E1B34A9@VI1PR04MB7037.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z1r+i+S1il92jjBpCC0A9gM3JVKWzdAHm0nO03YrosHRR+aInp0YVRJ5GZ+vev432HcIOVM/4dAW3Gqs1bKPH969ys402GlKwqcly32+hI8RlsO+UN0yl82d8ziHjxUscJr+9UMrA4sQ1ttFkXu1v84FxQrKbPR850Go9yM35Xx/eUnE13yFDZQd6K8it2xI/nIILsh47bXkFJ4V4uVE2xXUp431twsZ9j7ZyhyMJwo8bjuKUSYFZuZNQOUzzUoLeCb0SGwe9zv6+A8iXPFymoIi2XSaeKarISANfRy5L0FFnt41mTeN0PQkSgEjgk6JG0JK6PAJoZ4wu3cg4KUKBqZugmT1E55lf42VVYIAxNSPAVOke3fyDKdMLKc0xwZHpajgEQaNjNj1SXeoIfdX9ijuJB/vzRlvMIi4AcJBIQeoTAEjhsqeP9wQX0J/NuQy+6+vHY3K3UX4AHUU4ryvygheICLi+2J0YUjTJn1B4/Upos/wmzXg0hgdmbyLcM8qVMWFaLw+P4zt8rLNBfDjVR4ZL/pM35JcLD0FAJq1I0RmcUfRlUAW7MXaBhykPYLBXkZ740yvp7ekdWJdAVWtuRmopvf9MZyS12Hn22QKBhdka8OZl5AkdVt5yvIzOTvJqKZGKfutlKg4KP3CDt00EKj/IM+E7M0wGee2uSYFBJ9qpsz433Epx3jxBCTfx9fO1YStLX0ntnAK5HWPu0AIYQlmQlClGUVw+uv3nnkKQcs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(6506007)(6486002)(36756003)(31696002)(6916009)(83380400001)(8676002)(38100700002)(6666004)(8936002)(2906002)(31686004)(4326008)(66946007)(66476007)(54906003)(508600001)(66556008)(5660300002)(558084003)(2616005)(86362001)(186003)(6512007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enluZ3JLNDNCVXc2a1Z6WVhGL3ZXM0tkNkg0QUpsK0pHOSt6WmhPY25DcHN6?=
 =?utf-8?B?Q1ZSMVNYZkhsa1NUNmkrRmZTNEpPenYvdjd0QnAyU05MSjNnK0JWTHVZT244?=
 =?utf-8?B?dDM3S1d4aHlDeDR2aGJCdDgvdjZNYnhxY2NGc2p4d0pGM3VhYjlHakw2K2ZF?=
 =?utf-8?B?Tk5obUJ4UVhtNTc3SXp5elM0OVhBZ05KNFJ0RkFIR3pQQXVrbnJ6ZFo3dDZp?=
 =?utf-8?B?YTZKK0JvalVvekE4MjhzbWdXbkszQ1JOVkorbUVSd2hxZlNFLzR2OERra1Zk?=
 =?utf-8?B?RE15eUs5NzNTQjNqUlJnOEs0UXZPWmlITkF4RDVDSmNvUEU5WVk1alZ5WnFB?=
 =?utf-8?B?WlBHRFJNOFBDeFpsanhTN3BFZC9DQjc2QkRtR0dHOHU0YmxjbkdOcFZLbDZL?=
 =?utf-8?B?RXNVTEpYOXJrWGtZeG9ZTzFLWjI2azlSaUZMWE9rWEdQL29HOUpHQ3VYSUJk?=
 =?utf-8?B?ZDZ6ZThJS2pqMldleEdqYVZWTEt6aElOejdoMlROaGxjTElnVG1FYnI2NzF4?=
 =?utf-8?B?QjZwbmpIZXNKUkRYSUp4NTFXaEdidXc4bzRqSVR0VkI0dHNHaDR2SklRb2V4?=
 =?utf-8?B?bE43azdQTnRFZHkvNkdjRmlQWnJEclhQZUxJeUJzR0RQbDhWdFJPUFRBblVI?=
 =?utf-8?B?OWNLWlFNdlhoa0xvMWpXR1RJM1lhTlUxNHNEc1Q5ektMVVhjOE1ndFdheTJ2?=
 =?utf-8?B?TS9mK1JYM1dURVdGRm12WjRCb29QT3NwUmw2VnA4b3dVcElROTRPN1NQUUhl?=
 =?utf-8?B?N1NlNk5VTkw5Q29vaGVnVkw1M2RLQ0tWaXVqbk5SVEZ6QU1taWJXMEdKRkpV?=
 =?utf-8?B?Y1RkTFZUMlVwb1NJaGJSMVhYaW5VdTh6WitiN0oyR0pxbkpPWWxDQmtsVUd6?=
 =?utf-8?B?T0lBdDlzMkdTNERubHRxQkZxMG0vLzRaZUFPUHd2QU90WG5CZ2EvVnlLRk5N?=
 =?utf-8?B?WDIyZE9Vd3p0TmtxMjB0RVBGTnM5YmVlQitNMi9TT054T3FGelV5UG5lVTE2?=
 =?utf-8?B?cFd1ejl1L0pVbDgxSUFJQk5Mc1N6SlJkYXRuc0Zac0dwdXF3U2tjUldsUndB?=
 =?utf-8?B?cmlTdEdxdWZhcU85am1ybytCbmFsaUY5UVVBb3ZYNTRIY2pWV01oZjc4djA2?=
 =?utf-8?B?enBIbU1FVWY5VHpoSTMzVUdzMTh1ZHFrQ1ZSei9uRlF6M0Nud0FhZ2xPZG9j?=
 =?utf-8?B?Y290c1ZyUDBEV3pKUXhNVTdFN2lSZFdKUWo2MGZIU0ZHd2N2WXJQbC9OV2d1?=
 =?utf-8?B?YTNKZVdwcDd2eXZyUTRiYmIxRWNTUzZqVENoemZVZkZwT0tzMUc4SFdKWGZz?=
 =?utf-8?B?QkxXajBlTFFDMVlTeDZLK1QySVNtSEN0VWhCT05WRm9iTjVHUDlrUTRleGNW?=
 =?utf-8?B?ekxXdHlRVHF5dlYxZldhU0h0Yi94eWhZUDhPNHE0L3RONzZjVkJHY2Uyd1dS?=
 =?utf-8?B?N0diYXluTFlSbFA4a3I4dVlFSm9qc3BuKzFyTUp2QjJPTnptVWJXMDFuQWww?=
 =?utf-8?B?d2d3UkdMMUtxQUwwSUVwZkpDVStZdVNVYlI5d2dzdndSdzYyb2xXRzRRdkZ1?=
 =?utf-8?B?UkVCcjc0MmhLQU1oMjh5cWdvUlRDS1BYbk5rU1Q4cXd6elVYbi80aExzZTdt?=
 =?utf-8?B?M2g1MGtKdzV0c3NXZ3pSY0dLelhlSzhEeHp4T1VLNEdXKzNZVWxqdGtGdFhR?=
 =?utf-8?B?dk1oZElzOVFLTzhEYTF1UDVrZ0srNERScHBPMjhRaURVNlFqOXhrK01LOTd5?=
 =?utf-8?B?c3pnZElZNFlsSEdKYUo0Q1FweHB0QVhlWjh3cW1mSkJ5S1ByNGFVVmpSRjRL?=
 =?utf-8?B?S0NNRkJxR0c0Q0pndythcGFSMURBQ3VKeEowQTRsRzVGTmpOQVp2N2t1VktU?=
 =?utf-8?B?NHA0ZXh3ZTFuT1oxTnkxektHMjVYQWVKbWozOGMvRStGazh2anBJSXY0c3I5?=
 =?utf-8?B?V01jUG9nU29ycEhSazJMUEszSzBRUzltUlFSQUYxV3loRnVLTmlNa3ZhVFUx?=
 =?utf-8?B?aVlneVp5MVZIRkEvMnBmRmZyZnVpZTNyZzZPRmFwT0syVFpGKzRQVk1SajEw?=
 =?utf-8?B?UElPZktkYmVoZ1QwUVg0WUJrRmV6RE54MkF4cENEUFl4enVnTHdybHVZQ2dj?=
 =?utf-8?B?eGNxZXhUUjBIYlZYRW9uMEVTWTZnWndCdEZYZkh2KytKMG4yNmRPcEJaRHhG?=
 =?utf-8?Q?AR+UrISOFBJpZE90He75Du8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bade08d-8c37-4fbb-1546-08d9cf672973
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 09:47:03.5213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dP49cHJpdjI8DOwM4t+3Op0SBVcfr8w+4M10mCppRrCgGeRjYOpiqDm8MqOHCJBLogpUCTEQOcE5jsgYyUeIcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7037

1: PoD: simplify / improve p2m_pod_cache_add()
2: altp2m: p2m_altp2m_get_or_propagate() should honor present page order
3: altp2m: p2m_altp2m_propagate_change() should honor present page order

The last one continues to be RFC, as there is an aspect I can't make sense
of. See there.

Jan


