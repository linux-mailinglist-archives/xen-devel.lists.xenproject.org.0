Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F03677DEB
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 15:25:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482901.748686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJxlU-0005Vb-Kv; Mon, 23 Jan 2023 14:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482901.748686; Mon, 23 Jan 2023 14:25:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJxlU-0005TJ-HD; Mon, 23 Jan 2023 14:25:40 +0000
Received: by outflank-mailman (input) for mailman id 482901;
 Mon, 23 Jan 2023 14:25:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJxlS-0005T0-TY
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 14:25:38 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2050.outbound.protection.outlook.com [40.107.6.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce5e81bb-9b29-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 15:25:38 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8364.eurprd04.prod.outlook.com (2603:10a6:10:24c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 14:25:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 14:25:36 +0000
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
X-Inumbo-ID: ce5e81bb-9b29-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yj08t50dFk16FIhQb5ApbXidiriX33Nw9JDs8WeDa4NaNvHxZkj9wqGqI24F6S9/emivw89tbIyZYkmSjLng61t24K1MeweOlPHy8+Uu9qG1gAKxoGhhu/yqmYvqyLIPg8UpqNeeRE0rS1rWDmI3WjqaB1lFY0ILkUKHkqaMACuMQ+6vmiXj4Iv51h3ucaAmLEw5ywZT4Ah1Fs3UI64HUOwGFR5isAPdjC5j5vWds7n+F8zag7cA42LF166n8cH+eNzeMnBFenSlg/cblN9XIMaFDzjH58/wcjDZgtXlSozsXgD+W7/U6LQL01hC3FRrbpA8LwJhDNDtuJmY+xBWjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zR7td2ZufsM6/aLyC5TjPKvdiWy47PbslhSMJYf2mTQ=;
 b=A3F1+/M9GN2OrRjOuaP3ZvtMGAoiebujecWPr7jdFX/bdvJFhVq6Yl2tWASgZFzsO830m8bHpcZpSGnRYqlDc9MBwo3H2TNbIoKVePhQQOC3MP+m4oM6LmBqDfU/i78cX6HI47hPDF8mvWXwT2pbMCdL2/4TBNMEfvv8/W5lxPbo68y+SFSRHsvETuA9Bc+PItB6HSVhx5ASkVvYh7QOGhB1rJry4MEJzE8m7cdU/1keRF6laLgI+rRqDmxYM4zS39f5H4f3oyfB/MODLfz/b0eIdcM4gG2Yf7zPiiWkky/vgKc8ZHg/zs/AgG5m7oEsqjS3mo+QBNcDxoRp7wd8gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zR7td2ZufsM6/aLyC5TjPKvdiWy47PbslhSMJYf2mTQ=;
 b=IcMC9N1Rw16aTzj4z7lnngYjXx761nYL4IQjms+laeN47smWMpvBwpk88vxtT3q1h8CbdrsRAY9GEo3oxOwb4dSJBXZi+qAumEe7ZdmOhR8xnD3KO52qNjsDFInv88721hmlZE1a+4B9a/sBunP57BigLC4p0nww9eMFFRb+ppwSLBfkxfjJ3jngGq7BSLtKl+Mnm+yqWQULvR4VIHGDJIh+Fj+f6jQapEGID/eIjCkFoV+v4C20p0+SIICH2d9Mx0ZMmzg8MEAWtP24OWbobOihbZVATh/0eOa9eGf7uHOiueClpv61t0BzJo+D+pEPnGGuRcPmrCpT6ZFADinTgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0e682cd4-3cc0-461d-ee53-13a894797f17@suse.com>
Date: Mon, 23 Jan 2023 15:25:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/3] x86/shadow: sh_page_fault() adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d009104-a649-4fb0-4c9e-08dafd4db166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	soWIxH7k6B4oMa/q12DsgXMY/iqWg0wV3j4Sn3RupAXW0kZgzBgJYmqmlJM5lFr8d9L2ZrYgxE3UQUz1NzHDIzt15xEJozE884qwu67xN9UxrNhQxfMZpkHVWaiccao0O0eOpGAQK5c3N7Rw8j8yEjLtVtkFQHqFEuaOdZVANMtir5vahLm7P6/sfpfRT46PvAui18bBgWqXVmY7mMD5ykPn80ndtmpB6y4lh343Ly8GYYUp9dZz4Vj1at5kOXqJkGvXNQAO44mEN+hH0mnJX2Rzsvz6EMz+BiCu5HE8r/0JIObHfGIcqnMJ2y9ZFFsF5aR+gwZpiiW/NpIj4iGP5zEIryW4ZaD/00qiNUCjY36nhx7RKVV9AZQ9MRM+T+ulIApsRazePseXfG8rn2tfqestd1uC/DG/8AaJqFZe9DfRjxqGr0lKjxG7Ufq29l7qq4Syk1zO+ViPjs1q/clWz6wdTJ1D0iMiHVfdWKkwEnaKZoHWMSfpwojoblTa4F+2zl+oaEi7EjbGgLoxkaYQE8H6m6vEGbk8oLOOKjaH1NbItmfbOfAgGCcIoXH9q7UU91AMSYZOeKmMKf96/fYfbrX12M89kStHJgGCCCWEgc1KmmXnzH4FKZ9YJibhNRPSmghKaq0CdkkYBxxH2eBs6CeESZ72qJGQ9HrMmM+x1YWI+UEDfJC48TyacatxVfgCBSSgkm5nC0oqZ1tn+SZiq1m0w1a0tM2lEuwAXql7580=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(366004)(376002)(136003)(396003)(451199015)(36756003)(86362001)(2906002)(38100700002)(8936002)(4326008)(41300700001)(5660300002)(558084003)(31696002)(478600001)(6486002)(31686004)(186003)(6916009)(8676002)(6506007)(26005)(6512007)(66946007)(54906003)(66556008)(66476007)(2616005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?am5HSHRwUEhYK0M0T2xaM0wwbmVGS3QrY0Z5SXVuTWM5alB4RWtoTlNPaEpp?=
 =?utf-8?B?N0dYb2daVnRiSlk5eVFoV2N6N01OVXU0cWlRRGpHT29kR2RuRnNHNWowcWpQ?=
 =?utf-8?B?ZU5RR1Z5WlIwRS9WWEMwS2tpYVNHMUpwckFlUVkzNXplWmF6Q1VzSFQ0Zk9n?=
 =?utf-8?B?NGtZcG13ZHZNaG05a3NieThWS1dtK2hJaTd0a2ppaWprRWg1azYvd1lSS1h1?=
 =?utf-8?B?VzRJNWRLQTYwSGMxZTc3QXcyN3RTdzlVdnhra1hWVWRrc0VDSzZBcE1jRFhJ?=
 =?utf-8?B?cG1HeVk2RkVyVDFla29ZSFdOR2FyQmd4Nlo4SDlNdG4rdzI0Vlc0eHZpQXlW?=
 =?utf-8?B?c2czaFkzSDNQRnRyaFJwTjZvdk9sbGRXYW5IU2VFY0c4NlpIRDIvOENNVDQ0?=
 =?utf-8?B?czF1UnNpV3RodHVLK2ZXaGNENVcwQTAxK0F4SGxTQ095NkxtRlMzMGlrZ2Vz?=
 =?utf-8?B?SVlRaWhTd0Q3NmhMYkdoeGtpQk14RHk1Ujk0SzMxQzJFZGo2Z2NyZU5YVTZo?=
 =?utf-8?B?bHB3SWFpd3c5N3NudEFqS2dJRlZiR25pang5QTRIc0ZaTTNwakxpOUwwVGpX?=
 =?utf-8?B?SUdxTUp0Ri9Id2xzUy9yWEQ0cklKWWtqZkFmN1VzVzVETVN1bFlxOEc4QmhJ?=
 =?utf-8?B?K1BYRUJsc0R2YkN1NlJxVWRYT0FUY3VTWXdiaTFEQ3h0dU9PdlZpYS94cFAz?=
 =?utf-8?B?ZVpqY2RqUUI3aUNKZ3hMZVJaY2dIQ3ZaNkwramt2eHRSM2kyUnJ0U1gvYXRn?=
 =?utf-8?B?VnUzYVVjSzJSS1hXak1qN00vQks5aVovR1JRaUF6MmdiZWVrSXgxS2Y5bTVU?=
 =?utf-8?B?L2xBenN1ZEpMc3NVMmRxTzNPUkhGUEdJYkl0VFpySkNCR1lTRXBrajFVa2tN?=
 =?utf-8?B?dmx1WlBUeGJxUitkVGFYNFNyQjNOdXEyRTY2SEdSUG9hR0tob1lPUFVnQzFu?=
 =?utf-8?B?WkdXSUoyOWRkVXRTOFpzVjFIM3kwVEJibDVYOCtma3NuVlFuSVZMcUxvUUNn?=
 =?utf-8?B?TlNzbEI4UmIwZUhVQkZyb3h4VmZzSkJJT21DM0o2ZHZNWndKRzhyQm81TVg5?=
 =?utf-8?B?YmloTldDNzJCdDk3djhVTUhXd2p5ZGhlZVBBQ2wyVkdMM1NIM0pDVVdlTEZ4?=
 =?utf-8?B?MDQ1VG05RU5uRXhSYUFHcUtnRUFnbE9hcWppVnFZa2dwVmtMbnBJMHhzSTVU?=
 =?utf-8?B?ZXZScDFBRWNlYm9sVkc0dGRkajg2WkdmUGpSd3loYkgxZjJENHE5aGVsTmYz?=
 =?utf-8?B?TEpCbERYbW9pcVBWaDROSDJtNDgybE9EUFVpK0E1dk9GQTFyUGhibHFlTTRX?=
 =?utf-8?B?SlM3S3lyVXlWOEo4bjhJMnRTWDRSVE5nYnRIb3BuWmlKVGhvTVZUcm1DL2ln?=
 =?utf-8?B?L1RjMjJvMEJyZ3NjL0dHNU5IZ2hycHJ5eHlSV2J5U3ZORG9aSzdEMWxTNTNu?=
 =?utf-8?B?L2dZaGN3TjNZaXlvZGN4UzRFZzJGa0pJaDh0Z3BiL2ZBTHd3VW54aVVPQVM4?=
 =?utf-8?B?TnlLQ2RpWC81MnlMYkw4NVd0L0VTTGhpWnhEZlZrYlVjdVdWaFdEWEgxV1Vv?=
 =?utf-8?B?aFMvRlJaSXNZSDIrb0VFNnN5VGU2SkZEUjFqTFVHaHdWZ0w0ekIvcWRSbWxX?=
 =?utf-8?B?cXRmUldEcmd6ZzMvZDBFZS83bFFHcXE3WlhmMTY5TmFiUHZVd2pmbUp2MjQ4?=
 =?utf-8?B?aytLd0Q4NVFYY3EvNmlTQmZSTlN1SWlWcmUxcG84aEpXQ1krUi81UFQ0Tmkx?=
 =?utf-8?B?enc2YTBOTjhhd2dsSi9lR3JTVzlXbTN0OTErNmRVcnp0THQ5Z2dqRWlVanQ1?=
 =?utf-8?B?OHRqWE5OY1hFWVJzVHhGOCtZaHpWV1JuUlMyYVRYK3BsRDNGaCtNcU5uVUVz?=
 =?utf-8?B?RDhRczV2NXNaRWdpWk5TTkJZWjR4UzRZakRzQWxEeTZYb3dCcW9NYUxoaUcr?=
 =?utf-8?B?OVU0eHBUSEtxb1MwRktIeDJYQUpvMVhKTHMrQXJjYjV0bm5adTEwSmhyaVNB?=
 =?utf-8?B?eDNVS1RpWXBmaHViRHZIRG5CRVBDcmhDTEl1UWxGeVBUWXVIOUZrMUxrNVpK?=
 =?utf-8?B?Y1J4OXROOWxacThvQW5Jdk9YY1VUMFVLMVNVeG9KU1k1ZmJwb2xqNHVQd1NB?=
 =?utf-8?Q?gHaiKWmSInI73GCc7vrnDlx6K?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d009104-a649-4fb0-4c9e-08dafd4db166
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 14:25:35.8802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kTeHSHTiib5RFzGKRx+XhSniL1J5pcrCvd7fd5NLkW61Jqz+Y03XLkZN/UU1CO1RB0j8DyKaGUYIOxI17V+QvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8364

The original 2nd patch of v1 was split into two and extended by a 3rd
(1st one here) one.

1: move dm-mmio handling code in sh_page_fault()
2: mark more of sh_page_fault() HVM-only
3: drop dead code from HVM-only sh_page_fault() pieces

Jan

