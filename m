Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F3F610B2D
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 09:20:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431427.684318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooJf1-0001cl-9V; Fri, 28 Oct 2022 07:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431427.684318; Fri, 28 Oct 2022 07:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooJf1-0001Zf-6M; Fri, 28 Oct 2022 07:20:11 +0000
Received: by outflank-mailman (input) for mailman id 431427;
 Fri, 28 Oct 2022 07:20:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jtyv=25=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ooJez-0001ZY-Ac
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 07:20:09 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60082.outbound.protection.outlook.com [40.107.6.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f33a4795-5690-11ed-91b5-6bf2151ebd3b;
 Fri, 28 Oct 2022 09:20:08 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8472.eurprd04.prod.outlook.com (2603:10a6:20b:417::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 07:20:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Fri, 28 Oct 2022
 07:20:06 +0000
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
X-Inumbo-ID: f33a4795-5690-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2driBkH+SkgUJfaR4WQwhD/rRn3KK6fHC8ChnTnfE3llAV6zhgj2ro5j+3abgPSN6GPG8E936QStyd3qcpN1M+5BuHfmYHuoq5QnMfJHtkkSg5a3zJx4i6ezQhpa9pgz5F4YHdP3J/M4cOYxYOzhvnLvPFOqXNVG9zwXZNvys+wXfw2aqIhyhqpb537wzf+gzmYInXRCeQ5hRFIzeS7JX3xwvTSNPCeyneFFUFmnk5zUrmTs8tg7hRxZV86BG6yMS5T8jBVgF7zYUUbhVKbEvCvsD3Y8hxh60TC9WAdw+2xs0rLJDYyJRDbiqBqFNOEC7kvWol27rhd10z1X0ROOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8s3DrhwpFVg9TFqBsTME7Gej+yEW6H1ixYRhJdqtmH8=;
 b=OrSmqaDxHtTLbefRjVrhLu+4GpAJuAgDdg4ikl5C0upppm2rL0A7wpzfiMpcAB4MRKsyA7ywnplpPt3z4X38RYBvtSJBi6s+fTFzieHBYi1Oro1q899D9LkVoL6j/FFL+veK24CoPeTsM3+hCv8EBthnB/01XaKxXDJ/sn+R5IUalBpAwisbOuobIGIlWs+yWShRUmukjb739C0Zjn3it/KV3HlhxkzSRs+eROlT+x7eeEzF/w4y0gTwuYEjKX81v/bFU0B+l4TL6NKmVVQqtbuf3V3s7YB0LIr2WIp8SCTHv0CCBZ4+nTp7Xo7YQNS4xhO0mz91H0Tar5v5Fk7sSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8s3DrhwpFVg9TFqBsTME7Gej+yEW6H1ixYRhJdqtmH8=;
 b=y60ogv4cv2fPFBARRe2J//44HD3vy2enPOVkCVx02FK5/AvbHJ5XN79eqBP4oGV8yoSj8ecIxnfzVffnXDfc4OcDDfz0Y90qXZUrO9IchjPZ9NDQqUTqVgcuJljcTzZ3TqcYc8PTUwKKgtjzC+6XaITJTnp6Zm9ehDUZXMrFtfU9cTofECte/0dEOdNAXv2g/U3foxHSTBJ+4DUA+3YRzR7E6u7CVTjJD4dRJ1HvPRCLtK+1XdN8bW5SPaYxWMlVAu2hw4T1AcnfmyoY36mRRhQEga/85Jm4xKzS093ht23yTTJwcKVbxxJ50oH3m1eXy33uV9KIOpCElC7zDcAv0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2398b0e8-ea5f-dc8e-46d8-2d3994a98b34@suse.com>
Date: Fri, 28 Oct 2022 09:20:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>, George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3][4.17?] x86/pv-shim: ballooning fixes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8472:EE_
X-MS-Office365-Filtering-Correlation-Id: 96a4f49f-27f1-4680-24ad-08dab8b4d6be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PhHQiuI/KTWBIz2TXQYvWUy4MfQV6HWChryArFWpAk5EGhDKktvoyaiT5x6OhB7gNJdhIsNawHOSE3Jl9gYUAnyTBoxrLtj73e+ScSdcbPY166xQk7E3InC0z3xEwkiiOvUjMfzDY4UQvERTbEwcO0rZTjfHYgmXfK780UvplRZwY5xakbiCE5LofmuV9WqbziV5zRVj0jXGqZhkjvodi5nM41b4G/p4iggErgNmE8ZKNloJ63flgg76C7hTNeTMuQVH7jG+JgteY4o4gDwDNSKNflrcVT+ak89JraFa58jXz3EN7PKett1V8tD0p2pFdKKpLNJR6ZzkEoAvoaqAnOJvsiEI6QZtx07CXuaXhlO1p9oNKh4+nEI5hCiU5Rf/vw8Z5qtos9jfbNPRV5sD2HhmrkNarSIurHsRgTUySprintTdYP72iMh/t35zjYhaqIDkkcmCAgg8dhnEXxBvUD1tFtfJUthL+KQT/kQCVJU2WZUScR1i7tZvVTNGN1IuNoL0f2HyumJOboFe5jHYK2nRQlAG4TlhkBeWFm727bi3Gg6gfJpiGOW1mxQAJ2ThsI0ruI7e+y73SB79D7f3tYZokg2tAfE7+tzrZlyD2T/R/qvHbKQP0F3kP/iDSJF/daZM5hxkq/bhFCGaP0Uo+K1AbpCT9Y5QwoW3GeOIDS4/W0B6/hvfZF5WDa6GxXxFS/5KelYtI5ooUYnE4xCHTACz2uClBqWZEyekIQA8OwjQa1NA3OzNRNS7p2AJGDPPTW222Wokx8dGA8wiGcGkaqx+bYjRBjCJvlUTghTVKD0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199015)(66476007)(8676002)(4326008)(6486002)(66946007)(66556008)(54906003)(6916009)(2906002)(316002)(5660300002)(4744005)(41300700001)(8936002)(38100700002)(6506007)(186003)(2616005)(26005)(6512007)(478600001)(83380400001)(31696002)(31686004)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDJGUEUwSDZhVHE2NG8rNWdLU1lNVUpmdWU0dkk4RTRDL2RRWFBkMzdhOFpu?=
 =?utf-8?B?NE5EbHJUMGRsUUtJQTJMSG5tUjFpa2djdC85c1piTEdiMmF4MEltYjVKZHdY?=
 =?utf-8?B?b3VwYTI5VmtvRDd6NTE2cHpHRmYzSnkveEtsbzRMcmE5VFpmNjIrcGpsZWdt?=
 =?utf-8?B?YkhBaUY5bTc4Q0tjdFEzcjN0TEtTbXVLdnE4dzVWN29WZ1UxcEwyejROVHFQ?=
 =?utf-8?B?cSt2SkZZdHF0V3I2Vm5JK25EazdxTzBMYmQ0dVhpODkyRjBHalFVcFdyM2Q4?=
 =?utf-8?B?ZHBra3VqUEdFK3pNVnFidlBKT0hOUmNHbkxrQ3k3anRqL1d6RnFtM0k5Lzlp?=
 =?utf-8?B?dncyM1E4aHhFUGpTRXBBVlByOXBMNXVFY0xleFU2eCtvWWpxazMwaVQwd2U4?=
 =?utf-8?B?YlRXdS9GV1Zzby8rMXhBYyt3eVovaUFLbWlaT28zUC82NXdXK0lORDFnQWVK?=
 =?utf-8?B?dEdmeWVNbGpleURiZzFOQVRoRm16OWFtUGRORVdIZHZWL2FKQWdHYUJYd2Rq?=
 =?utf-8?B?SngzOUcrV3NjWnZCM01jK0tDYnhGTlNjUEZ0OUJBRUN4WnFVbVBlaWRJUWpH?=
 =?utf-8?B?REVkTGhweUlRbTdXWVRmbjNza1lNUXY1cmJJMkh5M2k5QTVCSGttTyt1N1cx?=
 =?utf-8?B?MTkyZEJtdVJrQjc3YXJhUkcyblhZeUt3UW9pSllBWitwMEdjOThiV1MyWUsz?=
 =?utf-8?B?UjhKMk5tM3owbGVWaE1kMmc2QXU4WkllOTN1UUNPNkpJSU9xWUkzczhldENr?=
 =?utf-8?B?NkpjSTZNMTlGZnE5N3RVemNaQnd4SVJ4TkQrdlFKdGlPalA0ejJnK3J4T2Z3?=
 =?utf-8?B?Q2M4OFZ4T2pFUDRWdnBpcEFsRHE1OGVXaUU5TmRzMlp6YWh4YUU4aFZGVEVp?=
 =?utf-8?B?ZEpCR1NzZnZ4OWpUOWZNa29RcDNVWjZtMkt2VjhjbmFzOG8wOHd4SVRHOFNU?=
 =?utf-8?B?RkRSV3pKbjJSN002LzU2ZjJRcGR3SEtycnl0Uk0wZUZSeld4S0xwZ2JWUlpB?=
 =?utf-8?B?eXpqL2dFRUhreDBLZEJ3ejREUHRDNFV0cG1tZi9hUXcwUGFRNldaRDdTR3RV?=
 =?utf-8?B?SEcvU2VhV0JINm04RFBLWjBGU2RXMVA5ZEFyL2JUS0szUHJTWlRTN2kvaXpk?=
 =?utf-8?B?YWl2TEQzUzUyTnJ2MzdRTUExZWJQaXJqYnNrSnh6N3NaYmdYYVZWclhlanhu?=
 =?utf-8?B?MmxTdUpZZDF4L2c2WUlYcWlqNzNkNWM3eTNWRDZ6bmpjL2JqeVZiREtDM2Y5?=
 =?utf-8?B?c0RSUVZqNjVPUzRHRzd1UTl6WGVwU0I1YlRqTnh4b1BLR1RzelVPMmdzRE13?=
 =?utf-8?B?ajRLSldUSncycFFTdlZ0U09Nbk80cjgzTHYxYzBZZ2svSE1HaWY1QTU5eEdE?=
 =?utf-8?B?cnBYMzFzelRkT1ZKL3RGR3ZUanFCa2UydERvR1VMU2ZxejZuWVVBVmw5bThJ?=
 =?utf-8?B?SmVpNCtxRVVnUUtWK3ZXanJYZmdvT3hOMTFCczFaZFg1VzJLZDh0OVFQd3Av?=
 =?utf-8?B?eWJZRElHcWF3azdmUjdLS2JOemRUanl1K2d0dlpmUVp5MTBpMjljRW4wRlJU?=
 =?utf-8?B?QjVFclNSSFIyYVB6L3JJejloVlhEcGdMYWEvVkI0QmUyMXlFVjNQaisvL3Qw?=
 =?utf-8?B?TDFUM1AwczBOMDQ4ZmpxRmhaa0szWDMvVDgreXhFSUhQeEdrWFBvbEl5a3J0?=
 =?utf-8?B?bjVlRnA1U2lTc1MrN0FENzI1N2RKWmh6YVc4d3Nva0JsSGl5N0ZWQ0phTEpn?=
 =?utf-8?B?SWNGdXMyVWptOGpJVndpMTJ1TVpuKzRhY3F1aldUMHY3cjBUUDdIM0xPNWNi?=
 =?utf-8?B?M2VZbGxOWGFWZCszOUdXelJIcnZxTVZTWFJoTExIMXVWWGR5ckx2VWtWeU9N?=
 =?utf-8?B?QWJMMzVYMDRjeEM3VFBxQ2NGWkRFcEZkSXBlZmYvL1E0SURtWGNYWnlnU1BJ?=
 =?utf-8?B?TGlyZHVtTFZRODMvQXBkRzNMc3lzbG1NQUJtNjBHdVpMTnNpbWJaTUI0YURt?=
 =?utf-8?B?YVRzMUtkRjNkMUM2ZGszZWRmdWNHQzYxNTEvWnpZOXV5VkVLZHArbzZTaERt?=
 =?utf-8?B?aEQ5SjVra1ZqQ3Exa1poU0ZqeDZoOEl3d1ZkUEE3MEJObTBqY2U2MXluZGhL?=
 =?utf-8?Q?FNcSp38tbS1zJf/LEDj2Kbs++?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a4f49f-27f1-4680-24ad-08dab8b4d6be
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 07:20:06.4318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K1dm8HkAFfkbdTzHrz1R4xZLWlEzVB4l0d2maaSNYZifQBWcD8nCE6SYXLQsMRbls1l6DiPxYxT+FpIi7j1ELQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8472

These patches have (as a single, monolithic one) been living in
the XenServer patch queue for quite some time. While preparing for
this upstream submission, I've left the code largely as is (only a
few cosmetic adjustments, but no functional changes), so the series
can be assumed to have been properly tested. What I did fully alter
though are the descriptions.

1: correctly ignore empty onlining requests
2: correct ballooning up for compat guests
3: correct ballooning down for compat guests

Jan

