Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2108E6C640C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 10:52:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513719.795146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfHbt-00061n-Bx; Thu, 23 Mar 2023 09:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513719.795146; Thu, 23 Mar 2023 09:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfHbt-0005yj-8k; Thu, 23 Mar 2023 09:51:53 +0000
Received: by outflank-mailman (input) for mailman id 513719;
 Thu, 23 Mar 2023 09:51:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fJyN=7P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pfHbr-0005yd-V0
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 09:51:52 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 557557db-c960-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 10:51:50 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS5PR04MB9798.eurprd04.prod.outlook.com (2603:10a6:20b:654::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 09:51:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 09:51:49 +0000
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
X-Inumbo-ID: 557557db-c960-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwQBLBZFeMwoFo9a6JlsjkwzPv0plLH8NthvpFzOxJSb/P/37d8p527shIVfgos2XwqxfX5wK58up7QmF95wb440ZwijQGBkQMcytpqntUeQGylw9sSkAs+jKpcYytlLKxp+3p1vZmQOemVh7O2szfLogXzRWHnW8eAF8qoxrjx2VBZoyxxhVe2fcQo8PJuQwqB38Qq67JtW8bYDEAFmlWVIpip2V4VPVXfonbnTLXdOrdtcODaHjDhO/zAB8SsY98+MnqveM12S5V/TotUUnKnUHtIbSiGkjWcXuzt21jy9Qod1iweJSCIak6VMe9k3/RRTepxBVqjsCpi4c8Ef7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KGgIn7GamyNSJdZob+nuWYdxEnaXOYBTFXobHWb4Ck=;
 b=jcuiv/M2hE1u+gHPoTLcc8iaTO2jjkULxukeW8/YItfth7BuQhWqUZWs1MKGcHpXVrzRt3reF0nOkLPGmJHY7tucQ2lO4t0Yd1JE7qIEppzlIaVIcT5QE4ArvJT673cxAByeqU/BXE0XG9wKMr7LXFxdaJmRmDQORGJpzrUVFu6q0G8DPADGk1fS6M1b2rWkfnPebICNfzHRpcSMhuwNzCI0EIHG/w0conMK9tNRM8CTb+I2sDJNALMdIyqxk1CrJyf/cgC4o6SukYZUIHxF+I8yV6lQRYAMtokFvhxgYU1M3wAXqbfJJmey+rg7bzcgNpG2ON38huO+gwgt+LUIlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KGgIn7GamyNSJdZob+nuWYdxEnaXOYBTFXobHWb4Ck=;
 b=3SqV3FjOdG0Kvacwm8V9IG3yahAiI8lWLQDslgnPyVDwQiaV5r1Q17hM4K5wL2nCB2XM/fNeKs8wONfuY6sj6x4u86BUtwxUJBQdMN1UXRYzZfWzLVwSfKwVfULv8sfwn3UfxUAwvyk//k2Jfw6ioGcKCTOfZSWPdCz53NR5QyfHKz9frYjCJF9hLFab/oApJOVptApplHhDgL8RwhSK6mB7u/Jc+hiHGPAv6GlzVPlAYzx9elR3erkpHuDzncm5Pbc452+ZMkZZ8isTTsr+O+jtMkPGhaSK6ZzuNlYlPQotexDuFoHVWTtfD0SKmQeFgV1EIPuWS2S1h8Ta+jKMEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f569f869-a672-ae02-218f-c8ad24cce2f1@suse.com>
Date: Thu, 23 Mar 2023 10:51:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 1/5] tools: get rid of additional min() and max()
 definitions
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230323090859.25240-1-jgross@suse.com>
 <20230323090859.25240-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230323090859.25240-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS5PR04MB9798:EE_
X-MS-Office365-Filtering-Correlation-Id: ccf5743f-5b82-4ebb-964f-08db2b8438a6
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zsREfKVUAG8/O998VrB5m0VITi2YGcq2qR/lHLMYIiposSopa8ZBnhRKm+T8pHktiSGdjHWxTuwon/PN826xlj3Rbgod8ZSKUqwqYu6OtpGnywqShfdXAbQWtn3Bv4b5+uCZS9lOLCt7mXcGcjSHLEA/ITtZOCLAmtFKvPii6qu3oa6nJ6AV9Vck0HUjXjKLSsBK26i64WF/3Nqv9lvm2PURx6REYlULcps0wPd6qPtm4M8xEKpshqFm7SgPdHo+FnhlfV0GawDeXOMS+I5h2SKKLzITSXcvgruCPZPO9d7vL8pFVO8/E0KQPypSAa+2mmYldH8VKO0w/GTvz7GY8VyzH7hSVGm5hvqQWyT3D7MWcAl4EavgL1rAfO8vrTSoNIlziRSTYtJwlEzKlyjdZCngp6ev5co8xzm9CQ+KWqlJ9yWdQrGwEHtqzdkGDqapCqqydHj3F2mw8MH/4O6FG0MXAbhOl+A0qJvTineLPn9/2pKSE0tROE+Qj990ADUBel9TLws7krciq7sCXOGvvG1YXfJ+sgj8yipeji7N4jqlwZeCJfsGuOtY11Dt6/gedYL2sdWkcHQ+MqH38aNOj3tOeF7yrv5gV43Wxf9P6xaabhjI4z3TLR/5Mw9cl1pHzj+WWX1FjOcbHl6pEoY1MrUchQhJNSzNAq+5C0YKLLfa1LA00vNWEnUzI+bDDWUMl5UhotjpW/2/UIIG5N9T2+o5iuIpIRaEwljftPqUFBijSHJMwzWvhECEv+6885+z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(136003)(346002)(366004)(396003)(376002)(451199018)(8936002)(6862004)(5660300002)(316002)(37006003)(31686004)(86362001)(66946007)(66556008)(66476007)(4326008)(8676002)(6636002)(54906003)(478600001)(41300700001)(4744005)(31696002)(2906002)(6486002)(53546011)(6512007)(6506007)(26005)(38100700002)(186003)(2616005)(36756003)(26583001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEpZM0dWcC90UWtjWlZoQlcray9Md0p1dGhyUENOSXVndnNENGFBaTk0Mk5m?=
 =?utf-8?B?QVRLQ1RpSE9JcjdKcHVMdjROcmYwNXgrUzVHcW1HZXRIc3o0QWswc1ZiMitH?=
 =?utf-8?B?Tjl2M0hHYlpjS2JWYzJzSlpVTGdSTktuajlkQXhVZXY0ajdROXRLTko4T0VL?=
 =?utf-8?B?S2gvUmhsWGQ2bE9PZmlPMzdsSUJ5M0lEVmFOaFIyVmYvaUs2bkpVdXdNTXYw?=
 =?utf-8?B?d25naDJodVJhYmR2d0MrYWZPK21qWmEwdTJvS091ditrNGpnQkd6enpWTDBJ?=
 =?utf-8?B?ektITmtRQUdkd3REY21SNkFud2wrTDVnejdkN0l0dW9lSUFDUnZmVTl1UHlR?=
 =?utf-8?B?SmhkWWJlaFRBNzF5Tm1oZVFZOURkS3V6di9NYmhpZ1BaWDZFeU9nVld5THRF?=
 =?utf-8?B?TmJLOUdFd2FiaktUeTIzY2M3Y203K3FhVkxyOHQ0bkZCTUNpMmJzaEhTcXJy?=
 =?utf-8?B?SUVnSWZZMW95elJYWVdxbXpBSklvd0NXdEFBZ2JxMXczK2RqTTA1bFErQUJW?=
 =?utf-8?B?UlovVyt4UXkwNzF2OC9NUEg1RW1qc1FlUVRSRUJmb25hWjFvTFJRK0RSSHhK?=
 =?utf-8?B?bzlPM0NpcDE1eG4vUmlmYWYzb2QyWGIzRi9HTGFBNi9wV2JvZ1dJMHRTakNu?=
 =?utf-8?B?ckVFTUFTTi9nbXRkcUttME83TExYeFF0QWhFSjQyME1oQUxQVFAxMlhvbzN3?=
 =?utf-8?B?ZjB1d1I2eFJrUUVQYVZrZlpqZ0NFUWgrOERsVTQ2Tk1RV0lXNlJlMjF3L3JS?=
 =?utf-8?B?bVNSVlhpdDNUWWhHenB5a09tR3dncTNMSHBKd2xJVzhOQXZBaUlJbStNMTN3?=
 =?utf-8?B?eEZjT0VadDFvOHJvdUdoRlFJdmVoVFJ0VVBLcGRuWnlTRmhLOXNkT2JFenQ5?=
 =?utf-8?B?L0psRjI1VVBiUGJpV1VWZEJoYXJQWE41Y1pHdVE5SVFkUnNXK2NwTDJQL1o3?=
 =?utf-8?B?bWdpU0x5VTU4UnRkZ3p6WDNQa0dJNkxYVzFwSW15T0tFblB6OE13Ymp4WnFu?=
 =?utf-8?B?V3hOWTlJNWVSWUJ1VmcyUXdBOHB6VmlpQk92YU04M3hPVTJWZXNKL0NuUmtr?=
 =?utf-8?B?OEJkbEhOMjZqVnF4OHhmRkRFY1ZsaGUycUhJZDMxQkpYOElwNk1SeG5UZWRz?=
 =?utf-8?B?VkV6NXJMeHBxWWdYbU1lb2FtQ2l3MTdCdXNydlVWWEowRHh2czZqRnhaVzh1?=
 =?utf-8?B?anQzTFdJaVpHMGU4SXJSVFN0OHBwektEWll6U3QzeFR0WVJmeUNFQ0ZPSnli?=
 =?utf-8?B?T0dQTitXZzh3TVdJUHFNVDRnNXFhUURnemkvajlIbGdobDVDbjFPOStWMG9L?=
 =?utf-8?B?ZUxyT1pwS3FXNUhlRjd3dnNISEVpZG9tMmJ6bytjUkNnYmNyendIemV6bVBz?=
 =?utf-8?B?ZFVBMEFtWVJ3N2E5QzQxak42eDBVSHlOckswNTNScDNqeHFDRXl3M1dTT3JS?=
 =?utf-8?B?TWI4MTJGWWs3RzZpVmtsR2pCM0Y4cGZKcFNLYmZCNjdGdDVVQU40YkJIR21O?=
 =?utf-8?B?bkRjdlpxWEV1VXJINTZnUjRFUGRibER2TFpCdGNaZTVqZFlDUVpVMFBaSHEw?=
 =?utf-8?B?dncvOEtMNEV1NmwvcWttTEpaZGVseDNleXVRcVJua2REOGFrdHVWa3RBSnds?=
 =?utf-8?B?L1FHYmJxa1BKOEpWRjJGMmZxNktiblAyUUgvUi94dUwyRXZwKzJNb2J1TXJV?=
 =?utf-8?B?Q08rTHFiMUlMTDYzTU96V1ltTEsxU291NC9mSWVTcFo5Sm9vY2dkVTFnOVQx?=
 =?utf-8?B?OEV1Yzcrdk5BNzh2ekpCWTRobG1uZ1JGbU1hMmdDUWkzUG8vY1RzbDB3cGJ4?=
 =?utf-8?B?OW9FeUduTkE0SjhKYzFaNWNzSDNIMnlWa3hDL3BabEREakRMT3laZVY1QlNh?=
 =?utf-8?B?VjhvcVllMWtZaG5LSHR4RDlQcjBLRlVNejkrVlhpLzZiQUNoZGRKQlJDT0lC?=
 =?utf-8?B?a3lHVHhOVFQ5TTVwYmtlNEo4RjFsRkF5T1ZCRnRja21lZmUrM2Z1ZHF4TUZM?=
 =?utf-8?B?Ty85cWxnbEVlMlNHQ0QzVmdTTWNwS25ZNHNpMFUzL3pHYXpQQ0daSUR4L2Fi?=
 =?utf-8?B?ZzlnTklGVjAwVVJxQnFsYjVCMFpMb0VaKytETzRSTHNHTE9vYy94SmNCZWFO?=
 =?utf-8?Q?F2UKKSugh+O9110INO8WvulYS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf5743f-5b82-4ebb-964f-08db2b8438a6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 09:51:49.0738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: je5AGD/mbi9evItQrBkiJ8x7HhLP6AkB/0mpxLqu6yS26SRySd7QLI7EK86uy8P1VzZo+jNhFCIHme5eynIn1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9798

On 23.03.2023 10:08, Juergen Gross wrote:
> Defining min(), min_t(), max() and max_t() at other places than
> xen-tools/common-macros.h isn't needed, as the definitions in said
> header can be used instead.
> 
> Same applies to BUILD_BUG_ON() in hvmloader.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



