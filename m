Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2403F598393
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 15:03:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389504.626460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOfAa-00069A-U9; Thu, 18 Aug 2022 13:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389504.626460; Thu, 18 Aug 2022 13:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOfAa-00066b-QO; Thu, 18 Aug 2022 13:02:44 +0000
Received: by outflank-mailman (input) for mailman id 389504;
 Thu, 18 Aug 2022 13:02:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1x1s=YW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOfAZ-00066V-LR
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 13:02:43 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80054.outbound.protection.outlook.com [40.107.8.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a7dcc82-1ef6-11ed-9250-1f966e50362f;
 Thu, 18 Aug 2022 15:02:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4685.eurprd04.prod.outlook.com (2603:10a6:803:70::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 18 Aug
 2022 13:02:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 18 Aug 2022
 13:02:38 +0000
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
X-Inumbo-ID: 0a7dcc82-1ef6-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDkJtxUF+SwZzH8lvdRFPq58ya4soPbK4oV7RU2xnvY0GGJNLUohz4Rpa9qJCoEOO/ZwODwIhH0PxYrkulpYqGefxC69aN5VDwp57HipF6C4XhP/e43sj8SjHVAiTStc1X84CwISRXNutI3kTIXz7D0HRLdZuqcJmPIpa7EaTUA8+4Imhlm35b0ViBaPNgho/FC8knV3ANGG0pLVf5cACnHcK2JRhfgbHD7sgTi6K+ffkAgJzH5OW/ih3/C1Iet7/Nr20/Q/M5FIY1fupwnsW9F2GpcOHNewR2gTCAKdFVJqivwHjcjZUfO23TqNrqKeLi9JiYz2huZi0Yt4FRdtHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NT3f+gqUeBxCEGx1UmjBvJ3qMcVpA+eC+Fk66Duick=;
 b=fQtC0XGstJmvmifczUfJ/+tZwuISiT5twkqLLdB8OHGZ5zluBbpJPTSHwk9NEttPoYnaH2KY4SBFb+cxw8cfm/BSjWmc4XpSw3x7kB3tUt+IMK13cegN8GjS94SGpPANGoxkTc0YSlRKT76fbLoKojjL25UZewEGDU8rEP7oBtv885xO4HDbNOzY5L6p5kdz57aPcK6Z2IuqA1audexLg/rzGKX7Z2URze2rpoX+QCsTugZmVG23NznXG+tfll/kl93XPKHnGl9OPc1iirV8Vbd54/zzmi4/HXuT/NQfMqhGlN7QwUlKlnQ5yL44YKBVahyymxFG1L8MIOLROWS5ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NT3f+gqUeBxCEGx1UmjBvJ3qMcVpA+eC+Fk66Duick=;
 b=GrEQW7ESkGj8c0eaBGQeJ6KGvIu51wfXMY51lpsXxWA3OES5B3IZlWDbhMGxrcklOH6UU4+usMpWQYsPuv19biqwsuy+bpRcd5YX0qjcz13qYXWaw7O4yOOlAlqGPQFq7yJ/X50OUT/8E/uDmyGkyVgfVsXGANVufK9QJUbso2G8QIzyF9/iOsObsJymQTDPbpnfXelbQpjBnEYoImjGNpyDGf0RigYKLxSwolMg4EanPPtAFHzAYaJ7XV8K1J1lLR3WnKLHA9KGPN9dZLyJOunE6EFOD58QtwC9wEGmjCvtJ6fMQG9HFt/R0m4+S1gSrr6GcPVpQ+FuXawW7+377Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
Date: Thu, 18 Aug 2022 15:02:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/5] x86/mwait-idle: (remaining) SPR + (new) ADL support
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0055.eurprd07.prod.outlook.com
 (2603:10a6:20b:46b::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad47f9a1-19e5-4eb1-e948-08da8119ed17
X-MS-TrafficTypeDiagnostic: VI1PR04MB4685:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A06L608YwCx8hYTSmcngutue9vGstdMtp27LXkqGBqGNgUofN3Ci+NBztSTL1BZjy4jN1Bwnyu4Odfjm+1SFSRY+5tKhQr8q1VWG5bMHVe1Pi2BHcMQYkN21CxoMeO4X7L9j7gxFOUEwQZCmxXQsn5uoIDy9BG7s/fc7LYYf/GUA01tMK2aGWtWK1Wbbjo5Y4VKNRM9hZYWV7aX5TKd6kiYCSAoG9OJTpVqWAD9pk1n8/zDjwPPOnANXBERer//+62XOm6/vPwRCryj4P/pBESIzry6GQRwiqNO4f4CQml0ruwBbUTHhtNnEwsbWMljbB9OW3oR1e1SGLZT63KM2T5dZTBs6UevXAt06xuYpVpjB66lKGQ6QZ6LvHjM0wuIt+hKIB7VK+TPd+mcDF8DR5uJtUbKPYFQJXTr5s7Wh2Ky/brXo9hVy6wVIebSZVvMGAb/MOkafVojhIDj6xdxMBBVZ+LFamFuYc79WV9d5mO9aHRJ2VT6kteTVTYq8c6KCC4G5tFT47A53xpd2j71rBKAvCpBHogCpERlPZv2s7C51dvPTZXn1fE/tVoor49pqyDJIFYjUPidQi2dUWsIdzzX65KztHcptq6tzST4PXCKI5Tdu3qEeeVNDSEL8yPpfOsQlzU7pK00scR3pVmduDgCCX0xd23DmWnq9tINGJPv/fhIHoNxG0CqiAwcPo2FibmhQB9e2VmkpbfayLwjrkeC18vqL28Mk2t+nLkLrkPUF75cByFUm6Z9XsMG8Q4Ldh1qzqtsUCl+MEF2kIjnCR+/BcxdF3WfhTCL6j9p5J18=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(39860400002)(366004)(136003)(346002)(31696002)(86362001)(38100700002)(558084003)(186003)(2616005)(31686004)(36756003)(6506007)(6486002)(54906003)(6666004)(26005)(316002)(41300700001)(478600001)(6512007)(6916009)(5660300002)(8676002)(4326008)(8936002)(2906002)(66946007)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amFzVERCNVp1VUwyZEptNDlFZHp5cElhSXNRb2VxY0wxcjZPK2Z4L1JkZGYw?=
 =?utf-8?B?SzdFZ3E0dGFxVHNXREdlK0x0SFUzb1gxYnJrejVpVG1PV1E1L3RJVlg4Qmlz?=
 =?utf-8?B?UVdlRzNjQ25wUDV6VWdpSjgwcVV3M29NK3NmVzV1eEc1UFFDUUxzdWVwMWhh?=
 =?utf-8?B?WWMrSlZ5dmp4cFozcEVXS1Fma3RmZnZhSDE0a0FFaHVaY05Ea2hOSElXaVZY?=
 =?utf-8?B?NkwyZ2oxYTQxOWw5N0o1dXF3TDNiOThCU0hTNVBKVTFZVkhKd2U4VElnN3V6?=
 =?utf-8?B?TzhoeThVUmxmNThBOGtJUWFxbnpoY3RqWGQwYUZiZGhHK3pLS1NjdlBUcE9m?=
 =?utf-8?B?d09hNTRlcXlJUHREa0xmT1llWGQyTWpHTjl0VWRtVDIrU05BeHJFVGhhdHJm?=
 =?utf-8?B?TlNOVUFXY3VsRmFmZ1VNS3ZiVU5nZ3dJQVR3V1B3aEk0MVVWRlRPRHFZdVFl?=
 =?utf-8?B?MlhSR1RyNWFYa1Qyc085NlpaN3FBQzd3cnRNWFIzaU1HbmZVYUtHdHVUeXlw?=
 =?utf-8?B?eHE4cG9lVk56aFM2NE55ZDZYY2hBVWswcUVMaEd2YUk3NTc2MDFQRHdqU05q?=
 =?utf-8?B?bEo4RGwxZWk1YmdISTlybnJYMGtVbVRiamhpZkFYdVJ0T1N4ZUE0Q1E0Vm0y?=
 =?utf-8?B?NXZwbzhnWjduNkNUaTJnNFJRNVJXQkZuV0tQRnpzU2NISW9kVVRjMjZINlox?=
 =?utf-8?B?OFR5TGNFSVl4ZUxHUUFDejFjWU1xRlB4TE9heG5LYVQzTzRvZDl0L25XdFJO?=
 =?utf-8?B?QzhjdE1heXUvU0xyZzZ2eEN2VlhWNzJFeUp2aWtHZ2NxR0ZKeGtaWHkvdVdv?=
 =?utf-8?B?UEZXN3p0TXZ6c3hYbkNiTFY1eWRSMkxYRlh6U3hxME1yNXR0bVhkMk4wS0Vl?=
 =?utf-8?B?dkdacEtnQjdRcGE4MFpEazBlYmFrSlJhR2FReWNyY3pYSDJxMmplZjJKWlNj?=
 =?utf-8?B?TzFqU2QzVVlxZzFSL1ZYM1J1R2hoa3d6Z2ZnTlpveU9HMlVhUUlyRHpjcjhh?=
 =?utf-8?B?NWNHRFczMS9SbDdUdDhOZHIxaEJoenZTYittUGdYYTZ4anVDSWQ4SE93WEQ1?=
 =?utf-8?B?STFpMXlBbFNtQlljVjJMTVdIMmZwWG5PbDNQdnZpVk1PTVVFTUlPVHRYVFdW?=
 =?utf-8?B?WE1hNjNoY1JaVWtralFXRlIyOWRBNTV0ck43UVY1cVJJOHQ3VHd2OTJlZ1ox?=
 =?utf-8?B?K2dHL3VPNUVnOStnVmdSQ1pLajd4WGtMUFBzcG1abGR6bUR2ZmJheG51UjQ2?=
 =?utf-8?B?RDF4YzFlZkVEcUhJakQwU3Q3VFZuaCsvc1lLTDVxSkNGN2FkQzh5YkN3d0pF?=
 =?utf-8?B?dXR3YzIvZnE4N2tkOUs1TkJ3eGIyUkhqT0ZZZmdqUXAyZUZPSTJrYnFiekhJ?=
 =?utf-8?B?T0t0NjdWQzMyeTdmODA0cXpqSGxGOEtlVTdvY21leE9lanF5eFRQNGc4MXd0?=
 =?utf-8?B?bWI5KzZJRG9MNzVZZDZxSzZlcFh1Z2xmaEE5YVJPSVJzaGtTRnQ0cnV0U3g1?=
 =?utf-8?B?QkE5WWxVTG0xbzVPbjVIbllPWVdQbnJqYkJvcGdoek1YN01TQWNaeXVsdzAx?=
 =?utf-8?B?NFVIVDU0SUxiRXRTU2hYT0dsazJjMmJNME51b0RhaHV4ZmFrcjVESG5OdVpS?=
 =?utf-8?B?OHdDeWxBZnNhMVptcm4zbmthbmZxVi9UeWNuMGhSR0N2ak1CMDV5S1piandk?=
 =?utf-8?B?TURNYWl4RkZXelp0VHI1OVg1a2JqUnJNOHpXYk9aMTV1NTBESEtFU0NPWDdL?=
 =?utf-8?B?czdhNzRmbHMyUUQwdWp0YzA3dnJwMEtOSDJpSk1iNDZNZ2ZodUVxbkxpWTk3?=
 =?utf-8?B?eUJGRTJvekNkYzNDbU9Hdk10QUNjWVk2emdTR290YXA5NEpmQjBUUmREMlhU?=
 =?utf-8?B?dGdQb2ZFM3UyQk9rRHRxWG5wbGFnZjFEa2ZRbmptZWJuT3E5aGtYU1BLajhJ?=
 =?utf-8?B?MjJhVUZNRGxIVTZoVUFWSHZDcXZvTGdKWEw1REI4QjFSYWRFTTdsTThwRzhT?=
 =?utf-8?B?VFB5NVpTVXFkaVFwSkhPcHF0Q3ZZRGRDTlZEWldsdGE5VEY1VlpsWjMzc2R6?=
 =?utf-8?B?ditvS0RtaC9ZcXFFTEgzdDZHWFlZTlR4RGpjdGtEZzBjVDgxZ3lRenM1WEg1?=
 =?utf-8?Q?IkdQDnTrCQzFCd7qvcpK1yWlM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad47f9a1-19e5-4eb1-e948-08da8119ed17
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 13:02:37.9997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UlV2vCnzR7pgqnPbtBk89F789M74iGcNFG4+xhdq4oEn8v4sgiPrvb7AsEEWL4DLT40kGT5wGT/jtGuLsL4wzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4685

New changes have appeared in the meantime, in particular one partly undoing
what we still haven't merged (patch 1 here).

1: add 'preferred_cstates' module argument
2: add core C6 optimization for SPR
3: add AlderLake support
4: disable IBRS during long idle
5: make SPR C1 and C1E be independent

Jan

