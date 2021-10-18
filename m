Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 629484310CB
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 08:46:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211684.369317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcMPF-00021g-NW; Mon, 18 Oct 2021 06:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211684.369317; Mon, 18 Oct 2021 06:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcMPF-0001zv-KN; Mon, 18 Oct 2021 06:45:57 +0000
Received: by outflank-mailman (input) for mailman id 211684;
 Mon, 18 Oct 2021 06:45:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcMPE-0001zh-9e
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 06:45:56 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a84e003-2fdf-11ec-82cb-12813bfff9fa;
 Mon, 18 Oct 2021 06:45:55 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-Xk_fhSXmNV6dwJM9kltYcQ-1; Mon, 18 Oct 2021 08:45:53 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5904.eurprd04.prod.outlook.com (2603:10a6:803:e6::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 06:45:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 06:45:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P192CA0023.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Mon, 18 Oct 2021 06:45:51 +0000
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
X-Inumbo-ID: 0a84e003-2fdf-11ec-82cb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634539554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RlER8m9Nr8SjdDh7HKYWVOMKLjwOc+9imsjBzvXOd4c=;
	b=CdHpiayCIiL+dPVb4IcEH7OsjkbsbSK9ABRqBEymsO3OWx0dr7yYO0ypolP1z7ylrcALJE
	a5Q0FP+AscZVsqrUvRnFLVH8CF3iEVT+AKwubmvoL5GbaQ7tKTBAXuSu0mYJbi3PoIkQpu
	03hxzyNcrjAhPsTOnD5ddLX60jVG+J4=
X-MC-Unique: Xk_fhSXmNV6dwJM9kltYcQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFd+iqF78o9/dNaXhYQVmAin3h/xyxWd8+c5Fz9p0iJaBEPhIFINmi3mtKeHlBUFvz3/nB3OvZ5ESZB77ADi2TjLctrzLgCu1RgjP9U7NvnAgPZkE9YaAyuJyiABROwa0uQ/0eE0YuGfguBcSyP5FNDExTqYTRh3c7tGCKgoeMd5CfwNnhTOAc59BpaFgMJz/ZHVveO9l5pViWbpTlogEiem5WNYY1N80pXXmixre4T/5m+ottjnZoC+DV165E2AQL1SymT3fpN8cTOeHXGxSN5MlwnchtE2t27mw3Qmkg1HoCWh14bSQSE/IevJUOgfOg0LYmUb7XGcciyb1MvoSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlER8m9Nr8SjdDh7HKYWVOMKLjwOc+9imsjBzvXOd4c=;
 b=L9cJ3mk3t+laHGLAz0IuRz0x/94bYgWXoFJPsVMh4cXCHtn/czkJQMv00f1oTcvhjwlYBwsQG3ORRti2f2DeK/3YS4xF2Blu9PI1fIdA8w8p7qcoftihFBYC3K7JQ0rUP9YuBMigqFXH42K8QTOXKBSiB2oErYqBpjrTKoXDvf8BHbZEzVdpubB5uZ9dBzfreONbreHCIn7p5G4xEqxhc3seWKtVUOfDgVV6cnKJr8L8H2bZYdlyjMZ8wDYM5LhFH1ZRDpcyo9QPj5TdB9bgtoOcbCJuCdclnk9mEE+uYJRy+j9w9mXlRQDCEt00Ys/Y3r98eA2wV/8/3W5eADV3aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 1/2] x86/shadow: adjust some shadow_set_l<N>e() callers
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 iwj@xenproject.org
References: <24329000-06d7-2047-b0a1-51b149d19189@suse.com>
 <298846aa-f93f-4564-dbf4-4f893df8f328@suse.com>
 <alpine.DEB.2.21.2110151554450.31303@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8cec9f3c-ab3f-2729-cf5d-faf8786b33b6@suse.com>
Date: Mon, 18 Oct 2021 08:45:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2110151554450.31303@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0023.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b76b904-b57a-4181-abdb-08d99202ed73
X-MS-TrafficTypeDiagnostic: VI1PR04MB5904:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5904E9B75CCAC61AF06F5CBEB3BC9@VI1PR04MB5904.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E/tp7K0xhM33ZrBpMHGMt7hHrpKsnsDE5FP48TU5q1Tvxq+Vzf1YinMnw0x2pYVlEfYJLeua0aLfryViH2XjgC9JYG22isyGrFXpY2S6vJMPda8bzT1TPSda+ZMqeTkBocyie6gUuB4Wcd04OEm97xpPzHA+gAu9qOrGGf3O1aaLe/YciFwLKkdQMNKBoiRxsukpoVzfLjub+vmCOKeLs33Pw+0l0bxndnvoPIFVjRtE7zr0U6CafI2JizoJd1DHa6GnXwvuqBlym75hdg9jgHKn0lyqpe9QJxoTse74Fdk2KMFfCWKMiicrjC6rSMAZ2PS9OSVoe1lg2LGw8M6FYI+r+wUFQdxjw6VKmm+whO+vnbiqvf/+gm7KcCKxzHcBt+pLatXOvnjvzhePeV8Iz+cvx3S/wP37A7s/xu0Zf1dY7Lv6Or8J+mfJV5YOop5A3oP+x5Jaoq/gNd7b2bHdkydAf2TrkV0ZK/0Oih86QqOrgJahwbT7vBYIbL499LB14mRNxlzBY5Wbt8Qly6QVtkJiGqsl8MQrP6IPrbk3Htm/EihCy/7CNHXfDlRgIrCfR4Pr5F8MNBYBx2+rOczcsV+JUZjymaAyxjw988rHrQ7xppHvxCCf1hsf8xtYuWpBfhPO5K+cl6lw0ezbFx/kRd3unvFxC+gDaY2aCGtI1omU24BqjLfEAb7wexbrQIRD9RckEyEnkaCBrZT2yNPLeHepV2N/quXbMJ9SIC25kvzKK+UdgCh22M0fG3IBZ0mMVL3J5PMJMk8gN0cYRJ9jXW6+VCcJo7Q0OKMmVpBPFfGE+DhwZP9BPy7UeYJaBpvc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(6916009)(4326008)(2616005)(16576012)(4744005)(54906003)(316002)(66476007)(66556008)(8676002)(86362001)(36756003)(66946007)(508600001)(53546011)(5660300002)(8936002)(26005)(966005)(6486002)(2906002)(38100700002)(186003)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVZ1aFB0VUxGVGxNUCtQdy9VVjNzSnhOekFPN1BNNjdWOUlaWHlLOTYxNzRt?=
 =?utf-8?B?cE9KRDhiZGhZTU5IMFNQdFU0UkxxMDExaWhwNDZwSndRNndhYllXQTNMa1dO?=
 =?utf-8?B?K213eEd6SGpBVmtrYXFUWEJnSWdNQ01uTWhodlFQZDMvdlM5dDVRc1FBb1lR?=
 =?utf-8?B?OXR5RmVhcDEvWUpDTUQ4bmMrRWhycDQwaWhsc2VmVTN0cGJFaGVPSlk3VW8y?=
 =?utf-8?B?OURIbVd6VUhUbDVJdjRwcmtnMmxXNDhMcVpobThWSjNIQnFYWXpKZHQySis5?=
 =?utf-8?B?M01MVkV1VWRsd0EyRTNZZVQrVDlRRG9nUFdJVHI3bGQ4d3hMay8wOWZxN3dt?=
 =?utf-8?B?NnBRK3NISnIwR2dUd0tna0xLd0d4VWY0K2FXVXpPRjhXcldJUXlSWEUwOUFa?=
 =?utf-8?B?ek8rVmpWM1JwS1haVndUU0lVbGFoOEFQZ0RnVlFLSHVzTyt2RmFXb1pCb1Ev?=
 =?utf-8?B?VTk2R1ZoS1B1VzdNVkJJbkNZcVgveno2cEpDRlhmdVBNYTJmb0NDVnczcmZl?=
 =?utf-8?B?Vkxtb096aVZYZmJuZDZWQVVFYmNxOEF0WjBoTHV1V2hxY2daQ05qblVwNDYv?=
 =?utf-8?B?NDl1VW1hR0RXbnl1TDR0eXM1Q01IUVJTZ1lnM0NrZ0huajRRWE0zR1BRSGVu?=
 =?utf-8?B?b2UrVGZzbE01WUN2VjNubzZqbitjSjNXSngvYVJjNHJDaHZLN1dadTZUU2Fo?=
 =?utf-8?B?eTdCZTFLTEpRT1VocGlUMXRvUHJPVUpQaTFoZDJLNHY5cXZhOHkzWGZ2bjVT?=
 =?utf-8?B?NVVIUFJOTUo4L2RiMmF4M01iV01Kb01tWmVRKzFIL1N3UnI3ZUNBejNYVlc5?=
 =?utf-8?B?V0JGeFIvRmZCNnAxZ2tNYy9wN0tIeGZQNGZMY05lYlVQeWxtWmpYbWtPWUxi?=
 =?utf-8?B?YjZieVNHWGIvUW9XdlVoNkVWYzh5eDRNM2g2ZEJEZG90cE42L2h1OUhVU0Nz?=
 =?utf-8?B?Q2QzN3lGWGNqS1BLVkNsNmZWNVVjNWZ5bnl5QUNITlRRbHdoUVNBZE1rUFNN?=
 =?utf-8?B?aWV6UW9HT2ZITEFqZkxrRjdwOU8yb3ZKd1ZNOVZYTy8vbVBocjB4ZUwrUmU0?=
 =?utf-8?B?L0pXUjhyRi9wK0gxNUgrM3VjYXNhUmtJeEk2bFVPT1dQWnJEOXRHNFFVTVBh?=
 =?utf-8?B?OG1JN2FieU9QVERyaDF2Z0lYay9IbENjOVZSSm9VdkEvRDhVaWU1eFoxTnJv?=
 =?utf-8?B?NHkzSWJ1M3BCZFVDck9mYkZXMWlXamZjZnVzZEVLdXNINVRPVTBPd2d0MUlE?=
 =?utf-8?B?SllRcEp2Mnh6WlJWdFlPTnpVSjVpTXpHSDNRSUFoRHJMNjBlck1wZTFma1pw?=
 =?utf-8?B?ZEF0bG40M3FTQ0s0aUV0b2pXVHlIL0U1a0szNGhVNVBuMndOS3RLekh2RnNR?=
 =?utf-8?B?T2Y4UnN2NzY2WWlReGNDK0lsZjdNU2lXTnNMSXQ1QlZhRk0zcmRBbzlKWnBC?=
 =?utf-8?B?bDJpQ3pkUVNidHdocllkaXNRQ09VN20xUjhMeGxSWTUrUWs3bEkzNlZpc2xC?=
 =?utf-8?B?S050VFdpY3Y3MWdRazJFWDhFUnYyL1A3aC9vYi80MW1qaHA5ZmJUNHN4a3FG?=
 =?utf-8?B?Sk56NjlXZDlBNFVzVURJRVBwa2Q5a3o4YzFYMnA5VG5xRC9ROWVjNnRId2lr?=
 =?utf-8?B?REM5Rm1EZEZJL003YWgyU0pXaGxjamluUnNLVnQ5WXBEYjM1L0xaTHRhVzZ3?=
 =?utf-8?B?V3JIaHUzYkJlSkV1bU41bDdMTWdjSEljSE8wV1RtWThEbFR3WElnMmRuY2hw?=
 =?utf-8?Q?gtow/APLkMKss1Q1lQcTKhmMWjyujR7/62hAhUZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b76b904-b57a-4181-abdb-08d99202ed73
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 06:45:52.1776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D3uMyyfmhY0nCyUjNmoya5GGv16fht0Vma7vlHXkiaZxpagDiW2WjXIGPyY/HGMDuxvdpkqUvACwK6h7y7jUSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5904

On 16.10.2021 00:55, Stefano Stabellini wrote:
> This patch broke gitlab-ci:
> 
> https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/1684530258
> 
> In file included from guest_4.c:2:
> ./multi.c:2159:9: error: unused variable 'r' [-Werror,-Wunused-variable]
>     int r;
>         ^
> 1 error generated.
> make[5]: *** [/builds/xen-project/people/sstabellini/xen/xen/Rules.mk:197: guest_4.o] Error 1

Oh, indeed, that variable is now only when CONFIG_HVM. Fix sent.

Jan


