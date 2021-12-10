Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 858D746FDF9
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 10:38:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243661.421548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvcM4-0007oz-4L; Fri, 10 Dec 2021 09:38:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243661.421548; Fri, 10 Dec 2021 09:38:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvcM4-0007lx-13; Fri, 10 Dec 2021 09:38:16 +0000
Received: by outflank-mailman (input) for mailman id 243661;
 Fri, 10 Dec 2021 09:38:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aCrA=Q3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvcM3-0007lr-9y
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 09:38:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e593dc40-599c-11ec-a831-37629979565c;
 Fri, 10 Dec 2021 10:38:14 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-IeUw9UEGPbqqlOVPqBCscA-1; Fri, 10 Dec 2021 10:38:13 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3934.eurprd04.prod.outlook.com (2603:10a6:803:1b::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.22; Fri, 10 Dec
 2021 09:38:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Fri, 10 Dec 2021
 09:38:12 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0701CA0006.eurprd07.prod.outlook.com (2603:10a6:203:51::16) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 09:38:11 +0000
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
X-Inumbo-ID: e593dc40-599c-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639129094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Zvq73y0dJLjSz+MQ+lx2g5w/pq8BC6asLbuC1uXR9cY=;
	b=O22RN3p97ZihWpX27w97+r8Go33wmLE6O7H13SWAI3o+FXtX5ePOmgSBm41EAXGeO2Uh4+
	S8x3QtdXqyFu7gjqkGtGZSUl2k3yxsNnk1DxL3ti46OyJumoIBPEgtGi2sLrF8JD/zNx2T
	WG47uyt0DGRUJlYpKhx3uFl5oMHsz80=
X-MC-Unique: IeUw9UEGPbqqlOVPqBCscA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPzIagmE/NK+BgtQwGrLOIsH5skGQxoXlflQySowyJSankJKjKMj5nY3f2uQKyZi4AGPh6lHYSRXcbh1UneuUZX/u8WL+/yL17ow8T8vIuGhf5WR0fsDz9ZUrangchFjA/L75pGevoKBcsBPWhDaFho65Xof8OJH2Eqg98kyEaAif6stwsFyEHBe5h1jQoTPMdv4zKaFN5MSFeGo3ZBhFXRaCfgLCI/g2YILKx9uU5jlGASQ4cvydeDz0JRn3PXkDzP3SihSJxHnad1p9+5op8k5NvbDhVyWnfaqXxhchjFuuSu5HMGIfZw0/8zFgIzWbIDJdKEOP0JClJDHUwuWPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zvq73y0dJLjSz+MQ+lx2g5w/pq8BC6asLbuC1uXR9cY=;
 b=ZTMni/wNr5Nd39m6YkP2ONrTGRNM2kbylOuIkNPFp4KCRyG29meEWqSXm7yUFt5ePN6DCsSfFkHUAw1JzX35MH+2g3JN5X9LAD44MSgU9ZBgerki4CK6EI7/vODTusXPqWdpF3F4RNe023oKyQdEaO6LIMIf8vbzskVHAVCZBTijG9kr8ZZeflIkY1SFCN+Y1j/iGYslk3Onh2fkNg1sGu87F2ZQhwbbBltuL76TprrsTr8zd/jcaqsbL205HsfnXeKSE7JxnaAWvMtiguFmhabzoQ2Jm+d+IZmiBckZ2xm9UC61+fYukNuxkYvhUXtf9SrrG62pTGyPExaUBjqxWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9725c93e-c227-f29f-07a4-65e383bb7858@suse.com>
Date: Fri, 10 Dec 2021 10:38:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] grant table and add-to-physmap adjustments on top of
 XSAs 379 and 384
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0006.eurprd07.prod.outlook.com
 (2603:10a6:203:51::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fce81fcf-261d-456a-e03b-08d9bbc0c864
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3934:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3934621F37F49DFC24D9D2F2B3719@VI1PR0402MB3934.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o5fJCN+wYEqhNBCacxGtfNGvIS8CUfMadmuHodem3fYgl+CVKqgEtbhkwTlGn7Ge+rbDXnH8ERTTViMqIVgmNVClqpiSRUDBa6V4E+T/HmXil2t5BYFgsncS3dZr9pGTksK2rRv7YRB4PjKqE8XDei95K5w8/ipZyGlI5pm+ghVo3iYy5LDd81IwIP9YGsRDhoZGWk40TrA6lT9a438x03sRyLpL/9JD7Gq4DCFDJOvUTeIOxk2xDRItd6VV8HMSj7IpRDmZtoAB8SwziChogq3OMi2j+qexnl++9QXwIVYjCe1ZoQdHSi+VgBUie4rW2vq8gauJa9huz4ScEv6854PzoYs7OrjtIzJnqeXnXFGnHAo80fg6hbmb/XddErIQSlYgjF0bI3itiVyjx/0hs5sLs1F5LWiavF1k3lJ+Qh05Ll4QvSx9YuJCTt0Xw4bLzrQLP6bVvRvM34/AJqsJGHgFuKeIYRcaP2uv9qC/IfXuaj3ZB3QW+yXcxBazo4EWSQ7F7VBTPOd+PEVQFDWU8YV73ojri0471fAAK3KWNWYimjB0kgFNTmtLXNPg0XhCEpUawmQs67vnhDZmjls9rNpwcM6ijmetkXBEp7JYtwqpDDxyc7381BpJiiK9PxZ8dDOriwsp6ncImXhJwIUPj3OvsVT1YCC45eKde8yKGYCgXTnMbznGdjGzkFAn8uUuE0gU3eZ+Whm/1YL/sKF7d8cMuXKHbSzwC6P4w6xtk/msFHUNIQ8VWMhMrV9SWyZ9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(186003)(4326008)(54906003)(86362001)(36756003)(956004)(5660300002)(16576012)(8936002)(508600001)(31686004)(2616005)(2906002)(31696002)(26005)(66946007)(316002)(8676002)(6916009)(38100700002)(6486002)(66476007)(66556008)(558084003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEovMDRwR0VoQ2FRRjRpRUZPSWdUYUlINklwaUFHK0hiSjViMzJCNy91Unpi?=
 =?utf-8?B?U0U5Qm5SYXQ1Ri9mYkJEVUpJRjk3aHJ3OVZUODJqaWl4alRienZVaFdvM25v?=
 =?utf-8?B?b3NRYlh5Z1UwWGJLbUphQzBLdDlVVHdaNEZrcjlEVU0zYU9jVFl6cGEraEtK?=
 =?utf-8?B?NkRzRmt4cGF1ckREVS9rMEtpdnhhbmNsTEtneUZkc1hGQnBvM1ZhVUw2QzQ4?=
 =?utf-8?B?R3RoVEdaNGhCbWlNZm0rTmMwcER4UllxU21VYTRoeDhEYkk2V0dnaEpZRFNu?=
 =?utf-8?B?OW9VMlVSSTlBV2xITWJ4VXhBWTBUUHBqSndZemE2T2pzMUV2Y2xyRklIQXFh?=
 =?utf-8?B?b0hkNllhV1FQVXprUzQ3VGZDczI1c0xuMk1LN0FnNzBZNlVpd2hsTGkwWTJ0?=
 =?utf-8?B?VGd6Y002V2krNEhmR3l0dWpQVE9YSDlOSis5cFUwbkU0Umk1Y08zaC9yRDZr?=
 =?utf-8?B?bzYweWRpaFk0Yks0SXhPZlR6STVsaDhMQUlGUG1LeHQxdW8rZU1IUGdhMitq?=
 =?utf-8?B?cXFPTnp2My82NlBLUG40WWVXQWNFQXhaVXNHdFRNUStyR0dqTVdUR01ocE90?=
 =?utf-8?B?dzJCQVhzSEVtSllwbDZaRzRsdW5PcWNNaEtYSmo0M0szaSszdndzTkx3c3BO?=
 =?utf-8?B?KzFXT2tpU3FLU1pWSE4rbGxHSFhkL1BSbGZaM25jQTZ5Vm1UWktQRnUvZGRh?=
 =?utf-8?B?SzRhN1c3NFhwalZRQTJDN2xidW43Q0Y2Q3BDRW1acTJjeDd4akE3ZjNPZElO?=
 =?utf-8?B?ZThDZGhnY3BBVS9Wc045NnlFYm1HbVBWN3FUTVVEZEM1K1BJQ1ZsM3BMUEpI?=
 =?utf-8?B?dnZOSVFZdHA0L0w5elNMdmRhYXZCM3lUbmdoeERMRVY2MEUyS0RtU1VBYm5I?=
 =?utf-8?B?c0FLM240WUdyRHFqQjREb0JWV0tiM05sTnNGS1ZPRnRFd3JKMGJrNnlhUTNQ?=
 =?utf-8?B?cU1XaXFYdGpldTBRalNoNTQ3NCt0QVNBWFZ4MUdOVEZqelJmQ3BjN2ExeHdk?=
 =?utf-8?B?THhLWWdkZkZLS01nTk5BVkMvdGhQWDdUODQ3VVM2bmVoclA3b0ZTa08vM0lR?=
 =?utf-8?B?MWNEemVxSTJJMWdGMjh3bnI3VWVXeW1PUzAvdHZUQ09rTVlIbUVTcjFwbS94?=
 =?utf-8?B?ZC9ibGlORk10RzlsZjNKOUV2RTdXSWh5ZDhGMHB4RkN0UDhacWhnOXZNRHkw?=
 =?utf-8?B?TnN2emZoWFdMYlpqUk4yTTBOM3B3bkdha08rbkR4V1NuU2M5YnE4QXpLeStQ?=
 =?utf-8?B?RFh0aGJTOHhSSFVYcS9CbHNXTWRrTEFKOGJ5VDdwcyt5Qmw2cTN5L1YrdVJV?=
 =?utf-8?B?STZjWkEyTFczclBtSUw1QjdDTTkvSGl4eWs4cWRaU1hYbXlLdmptSmZHcUJt?=
 =?utf-8?B?TDRWbW5tSE8wQ2xycElrdFFraDd0UXRZdmVZMFNIa2M4UHFYZUFzVTZxbWdI?=
 =?utf-8?B?TFNObGRsWER6UEpUTlprOU5VbjcxRHk1UndLUFNBVExLZTNXek9BQ3pZc3lk?=
 =?utf-8?B?VEpsMVhZMWhCa3ZKTDRpaEF4dTJwYVhjYjBXZHhJNXJnd096Y2l6S2pGWW02?=
 =?utf-8?B?S2FaejA5WVhmNVdoYXNkZ0xrTW5XT1NsZFpkbDAyRTVBdHVwbit2L24rM3FD?=
 =?utf-8?B?V0dnQ3ZsYnluSHdKUTRBUVRMM0w1MTVGaHpmUzVnbFp3clZ3c2pEMUp1cEJ2?=
 =?utf-8?B?RGtScVNPQUVqaDA5bjJaSGR5cy9nbW9VOE5rRVQvNFQ1OU8rWkZsb3Z0amhR?=
 =?utf-8?B?WHNtZzhjenZhVW84TkF2NW5pYy96OGdOTmhuL1ZTYnA3VVNLeTdTVlBJaHRi?=
 =?utf-8?B?UlhDS3REajNtUjRxd2kySm1HUXBiNEZHQncxZjhBM0NIYmFHUE90RUtsd201?=
 =?utf-8?B?T2I1ekRiekdHVG51V3FQQVdYREszdHh0MkJTNUVJZXZMWHdkeFkrRjl1VHVq?=
 =?utf-8?B?RHE3ZkpNbTAydHJiR2hKNlRnK2crb25sc1ltWjlkOEVGbUpJV0xxc3ZFT2di?=
 =?utf-8?B?TUlNSXlhdUl4bTd3ZFNpYlJJVnRrNVRxblhVU1NzRXhoTG9aSmRYS0hQQnNz?=
 =?utf-8?B?R3R0SkRsT0tlRGp0RXQzTDdtbWdya3BCWVhSZ2RnMVVabEx6ZFZKMUtOS1hI?=
 =?utf-8?B?Q09TRFQ5QTE4VHdZNzh3TWZEZnNLNU0wR3Z0a3p5T09rRFo3bmJram1kRDRN?=
 =?utf-8?Q?2yjS0aX4oV4GJTccrSveCO8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fce81fcf-261d-456a-e03b-08d9bbc0c864
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 09:38:12.1703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UV8+QIa8NPIE4Qty81jx5e/9Jt/+gf2zFp5C8VRhk3TfdGbTKz9pF6Duz8RLDap9+7Hsubc8BWIUfn7FmI9DBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3934

The original 1st patch has meanwhile gone in, but the adjustment requested
for patch 2 required a new prereq patch.

1: mm: introduce INVALID_{G,M}FN_RAW
2: memory: XENMEM_add_to_physmap (almost) wrapping checks

Jan


