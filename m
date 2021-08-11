Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E003E9086
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 14:22:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165968.303121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDnEP-0005Md-39; Wed, 11 Aug 2021 12:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165968.303121; Wed, 11 Aug 2021 12:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDnEO-0005Ko-VU; Wed, 11 Aug 2021 12:21:12 +0000
Received: by outflank-mailman (input) for mailman id 165968;
 Wed, 11 Aug 2021 12:21:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjOV=NC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mDnEM-0005Kf-Lu
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 12:21:10 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a411d6d-fa9e-11eb-a06c-12813bfff9fa;
 Wed, 11 Aug 2021 12:21:08 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-9HG5KBY1PganD93awxLslQ-1; Wed, 11 Aug 2021 14:21:06 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3775.eurprd04.prod.outlook.com (2603:10a6:803:1a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Wed, 11 Aug
 2021 12:21:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4394.025; Wed, 11 Aug 2021
 12:21:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0065.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 12:21:05 +0000
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
X-Inumbo-ID: 9a411d6d-fa9e-11eb-a06c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628684467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=arfFtnI5q92caw+8iTr0ZMbSgToQs9XBJ1/m+4iA+oQ=;
	b=GfV6r7kFRHHxhSAZwLzGRykOU4RqUqBcVi28t95goFR/KME0bfacwWkF8wk82b7J9aGvEr
	GCmX4sBArh94DXtO3ZzO4MNQJe4fw9+IzJStnPC7S3Q+Z3rm03vA6kMsnxSCM3xAPbs9nn
	CJeF8dLEIwyDVVb+ai81eS/krxn9weU=
X-MC-Unique: 9HG5KBY1PganD93awxLslQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZ/B/Du3Gb7fIQStGXLhdwjT8xy7cJ7Y7A3Pm52urLbs1CHcDtZufkvILOIPe5rkRUrBLgML4RTehBfvbsyTLC5M9B0pzp9e584yjhYk/yAELEksjt9qsp7qg+pMNx/h6epJuGIuUK+CDd4f9kfPO8NuDOtp6glwiZUXCfx07QUI7CbOUjHiPKYn1REX5J58sehcrtZ+UJytHmwcDUL/q15UcZ77mLz19gbxFGCl9XjLI541h/zPT+x2taXnmmu9o+HG1iDqSHRMoKYs43kzIcCgjqJfP6+Z/AL4P3in62AFyzKRiACuO6gD0QkIXiYqfYl3hKLPW2kgp+wmWbl/gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arfFtnI5q92caw+8iTr0ZMbSgToQs9XBJ1/m+4iA+oQ=;
 b=BDRsrdJYNvMeVywCRNISg/KRhlQkhrITn42QtYRdT2n0gKYrAjYe5WvfmJ/0y2ZIjeppwx/jTn9nR/Fu3Ju23gHKqMjjK20ctT6HGWsoTNUqJQRuq0Lx2LFkt/WZAYHA32qtb8mbwhz/JP77DhPgiedyyTvUKSAcoivWOz1300hgi01lHFVoAPnWh7d3uPyB9TTjfUyDdwCkrnhcFArqVwjBW+VK2FubVgeXa7WyJldovEpNvP5g38F57qaI/exoGk26hjp2f8lSk80BHFdL+DbHNSznygb+pit3+cyT0LK7jtx2w35dC89lD3E67rMtJ+ZaI0+eXEV2p3raoAVS9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/7] x86emul: a few small steps towards disintegration
Message-ID: <bdc58964-e2a8-af36-1653-41c7146bdfc9@suse.com>
Date: Wed, 11 Aug 2021 14:21:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0065.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59e56a86-9af4-4a1b-fdb3-08d95cc27de0
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3775:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3775455BB51A6F3A7797C8D6B3F89@VI1PR0402MB3775.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EbFlEe/5s3KGCtta+oQXDkOHn8nUTbgFd/8vo8yg9hpc+u4udc1HbdhCxU+mQwBPgdgQC3JxL/OnFEgEWkR5hcPruajKUrgPGSKWl7Rqu6adLm07qEAJzeGg3RcMBZCUN+DmXpNioulAWCVzcL7BzSTC2o5RvjJhZEXUmh01kQ9Lf/nLoLbjuqV8wFFPb1IBGCvaJ2AVeIOyXds8Ijfo+27C1CX4Snu5n525sKSx1LVaSMN/iUXgOTsWQmwY/+3Uztm+HWRfPZjgXGmm4kPM/nawvqjF9qbOP0o7WUbWYrF5uphxd6wgsfudvm9FPMhNXWcerZrB847T/5VVVnaw3P1hFjJagF4Chc8SUSmDjuJSuNslx+WlTYrxFzmfKtJabkqfD6c0Rhu9Q+iFOL/liDfgC47tY4tGipUwf08IkIWSM5iQLUSdhNpHvqs8rONDOiSOgvaBuWGA8A9IoHwV2nLhi0InBOTXVjgDKfA3g+JJgIVPGXyzyVSXM3JuHIiMQCnngW8b/hwV7N2MBp3xQ+670WfVTFMwxdOZnYeaA4g4SlWADuGzoblbHfh+5tpxt/BlBNyjum9ujXFvUDwIWAPfFEsICnr6mt3frBggim4qGzFLetVHTE1pVID5oRY3V7MEOA2pn7YbFzCxrJtxggqMd1UtpFULWUkRw6nfOdM4xC4eVD3ExQD9MJeJZ2wUiy+BByi+fbVDLTJs0yoCpW51e2YAH847K4qGUb3x6w8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(6916009)(316002)(8936002)(4744005)(66946007)(8676002)(31696002)(86362001)(186003)(956004)(26005)(16576012)(38100700002)(2616005)(5660300002)(36756003)(2906002)(31686004)(508600001)(66476007)(4326008)(54906003)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTNHSWtFOHc4RThCS3IrQXlLQldzL1ZudGJRYVlnanNzMWd2NVlYOUFuSzI3?=
 =?utf-8?B?S25jZFJhV0lhLzFySWpDbHFGSmhBSlQzekwxTndJNmhkOUtXTWFVdmFOcWw2?=
 =?utf-8?B?THFjS0lhbnRha3laNXVxdlNVcjZvRm5ZTFhZSzMyVFhzQ0h4TmtITWFnYzgx?=
 =?utf-8?B?UHNaVE5INXBVaE9wZk9DSStYOWV1QkNWeVNxNER3VTN3ZWY5VWYzazRUK3pU?=
 =?utf-8?B?QjUwdTBvMmxjM0s2ajdscTJ0Z3hmbUxkajlrVUQ2bE44VjdUM0pCK2FOb3Bv?=
 =?utf-8?B?S0ZTZWJ3ZDJ5aGlQeHZndC9FWDVqYktRY1hXcHNOMyt6WFZBbVFJRWJnck1k?=
 =?utf-8?B?bzF1bWdPci83Q0x3dnRmeEJMdmJORTZOcllBbFFKK2Z4U2VLNFVDT01PMmFG?=
 =?utf-8?B?ejRJSjh5TytBaGxHb3FuUSs4cEd5aC83Y251am1IUE8rUjVuS0lKYmVWZ0pt?=
 =?utf-8?B?VHR5Z21RSTRnZDlYY0lmUk9HTjdOTUtPV2FvWWxpMUtRcEVHY1ZnTHB4RTlR?=
 =?utf-8?B?dGhNbmRjU3gySTNyUU1rdXJsZmVRU2N3QVV2V0l5a2lFYVZwVWlYVjlEYjdz?=
 =?utf-8?B?TnlZci9zZzg3SC8wTHM5V3lqS1ZoSnM2eEpoUWJJQjhiZlJ5M1QvQjJZZkZr?=
 =?utf-8?B?TzE0RlAzWkVSMkJVTlFFMkU4aE05bTdNRWlLYXJCZnV1KytwVGdMZDBIaEda?=
 =?utf-8?B?akhvS2UwWWZ6MXJ4QUtXQ0tGOUtFZVdHdS96TGJPbFRjai9MK29Qa1VseXBH?=
 =?utf-8?B?RVdZMit0Vytyblg0aDRFZnpKV0dCOGxmaDRQdHpRVkxhRFdQdkxUeHVwTkFW?=
 =?utf-8?B?L1FUSUtTSFdndU1HcWlhQ0RlZWRnOHJ0Z29zdXRmUE9rdUhFWGNFQ20xRWNq?=
 =?utf-8?B?bkJHYnhiRWo5bUl1dGkrT0lqUTNFUzlTQVpFVVJuY1JQNWU3UXVDb3ZBMEt6?=
 =?utf-8?B?dFB2ZThVYUI5MDZzbi81bjhYQ0dlejV0YzZxUkxDRUt5aUpzQk8zSnFkVWt3?=
 =?utf-8?B?aUNsQmp3V1pmbHloTkdkdmFKeVFFODFEME1aYnp6dXUvenNkbzVscWYzRk9C?=
 =?utf-8?B?TVZ3MXh0NXRDczFYOXlIZTZsK1lnb3Vsc3RLeE1FVk9Uam45b2Nrbkh5UDVw?=
 =?utf-8?B?cEFHaEphVHlsakpaMHI5V0lpK2tRdU1hbmNkL3RkYXdWeWMwSmYyejRPNkFa?=
 =?utf-8?B?dklSYUh4MTJKaEsveUNIMld5NmhQMnpBdmhzK2kzU2Y2Zjk4WTkvUDdVNVA2?=
 =?utf-8?B?U1ozQ09LZDJ0OW9PWTNHd1NKMGxKMW1TZnRKOEI1UFJJN0JsdUxvTnFvOVhj?=
 =?utf-8?B?WndPOGM0RGhoTTF3Y1BkTmdPM0pGc1dhY2ZtOEhFZVNGZHpaZnEzRUIxeVNi?=
 =?utf-8?B?TGhVUFdST0JRa3JvWklndXdjTXpGa3A1Q05OK0hwRHJDNkM5aHBSWWF1NW4r?=
 =?utf-8?B?enYybm1vQk9HandoeVY0MEdJL09sUU1LeVNMMVFNdXcwZHJGZkUyWnFYeVQx?=
 =?utf-8?B?akFVUVhiSWUvMXlVUjdBdU9Eb3pJT1p4cjBhc2cxaFhJR3RyM2NJNEdrRnFS?=
 =?utf-8?B?RGVUV0o1VlpUYkk4N0FnSVlrUjRaYTc4aUVkdXRick91ZzJjQTFYRW9OcTlk?=
 =?utf-8?B?dzRBV2FuWmxRV1cwbFZhNFd4RzRMTHBLOGQ0cVdEMURFd1VsMm5QRjY2N2Nh?=
 =?utf-8?B?L1Niak9VYXlZeUxaK3U0VkpIeG9kN2prQ05PcDdpeG9HUHEyMUo0UFFzY2lZ?=
 =?utf-8?Q?XdJbi2Y0vsuMCOv6eMUx/Ye24JoYqZDEIIQUPQk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e56a86-9af4-4a1b-fdb3-08d95cc27de0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 12:21:05.5973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v86mMYaUNfFt9gT8pyyGxNPlfi0rfc3MYka6kLEfGWTgZ8Pd06r9XpzmSgOk1hH4sFHTfXqVtbq14HkGOKn/fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3775

... of the huge monolithic source file. The series is largely code
movement and hence has the intention of not incurring any functional
change.

1: split off opcode 0f01 handling
2: split off opcode 0fae handling
3: split off opcode 0fc7 handling
4: split off FPU opcode handling
5: split off insn decoding
6: move x86_emul_blk() to separate source file
7: move various utility functions to separate source files

Jan


