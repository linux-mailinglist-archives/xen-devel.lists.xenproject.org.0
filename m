Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B45A8009E2
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 12:25:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645473.1007648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r91eM-0004wf-Qr; Fri, 01 Dec 2023 11:25:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645473.1007648; Fri, 01 Dec 2023 11:25:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r91eM-0004uX-OB; Fri, 01 Dec 2023 11:25:38 +0000
Received: by outflank-mailman (input) for mailman id 645473;
 Fri, 01 Dec 2023 11:25:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r91eL-0004uP-Dz
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 11:25:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2612::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5933ed06-903c-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 12:25:36 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB9883.eurprd04.prod.outlook.com (2603:10a6:800:1d7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.11; Fri, 1 Dec
 2023 11:25:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Fri, 1 Dec 2023
 11:25:33 +0000
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
X-Inumbo-ID: 5933ed06-903c-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eaea+QuC6Oq9zeDqLJn5NP87PfnwQpUAFStTCfKYvFtIeq/CxDeBhIuYjy8fMOHX9fGvIz/oG+R5hHNxhIxMHiZ3bpWy3Judhi7JyfJ8fhpvBkXjVFiHE8g9mYdoKgp43Yd1NfhtHafwlLqYYI6WExLxmUrZ/9azY9bRTaTnykp+1itNZfYafCgP3LfT5umkS0E4SdmZSZvZD4udiWAqiAuxQ0XT5901bjcETheb+kdW7HpLjtbPW3cY+5UZP5CU5bqwQLJxJVCmXDzPOaXfPy4U1DDtERFsBRs19wx1CMtQyTcuVJeKf5k9cHuhDldfBZexdsvRncXT4W5v4Cq1Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59muZDofqtl0R5R++rxFjMykMnix45sGuK4dDL0bNRg=;
 b=ctNQTSxHvpctERJvZLkopOoRz8560rIDIhz2Dign/J8xd5nj4VAj1H/mugahX/02VpdanN5o1Rrq2t5ztoBYJUP7Bcsk23v9gVKOlHYWz+XVmxYRmWduqMY3ST4GunzvdoRsMlnIhbI5VKnj4vszynpXkGlKEGAoAbrEKKlnhVTIYQk96814jMSKf5Hxp0rKrezQe/yI2gCCW4J240OWtDSE8bpil3LvkKYqRg42/3ze+z/NuCjpzIdAwfNn8cjoOOXnFQNuWo8u8foQXXaewPrZf8x0AgZAO2fc0ldxjYdjHVizR+NwLhMNXxWKmHkXq7Mr0lCH3LF+/4LLF1K7uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59muZDofqtl0R5R++rxFjMykMnix45sGuK4dDL0bNRg=;
 b=2RHAH8nBngOK5npsWmsVkuJXPHwLAP4eQoxZaDob3uIh5vA5drcxjyuZUYS7BeootG7zJeGr1YLs2e9N70s5WJTnIzt10PK8wX4giGFfLddGImzHU9gHekQsRdKp9g7yI8ooWXOPEc8bI6FvW1yQlFbs9WYHkbGYBqmsb94pDLxRd3a0Z8NxVblSSzzqxFgBoPetr/TG0sDkykrv67ebegsIkC8MhLk8Litiw0FB9JrSL7TdTWAmHYbKHmZUH2kLMfffEYd4CXTlGOavtiQYbBfMFXfuEpFWDKaBRhvRNvf/sMHaTtRgGEZrnSTsMGjQuyTbGiJTEPiAmslO2xDJ4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4807801c-07b7-48c6-bee8-0bb3af35e8e4@suse.com>
Date: Fri, 1 Dec 2023 12:25:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/public: fix flexible array definitions
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231201112041.5260-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20231201112041.5260-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB9883:EE_
X-MS-Office365-Filtering-Correlation-Id: 39c7a8b5-9fc6-48e3-19e9-08dbf2603b50
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gaf+R93iNlK/XEkbo99u51zYJ3QEyP7MolS4D7CYA1t4ilWHSsOU29kUS28/uqqIwQQ7XqiVPKvKnDEJC49PgdBb/salKCS6iDV0zuuBt7fjYFEZcXjS2of50tU84WyuIZA0/Sx/da8CXTwizK+LMlK5rKvdyHEeB5nwFg7rayOdNPce8uOJ3Kb0Uuu7rUHTFYmV+f8Rwp3grYogxTFjJSy472HamYr3a4kNlooF8eMznVV+j22x7JisrbgOemuov07ed7NJGX0b8tVIeQFDSSJJRKSvLWngr7xWkC7R2okDLPgQdHZRe3VNi0J7gZwioW9nLA7hA3XbcfbyL2TMwU/t56rpUK81C8uBl/qTLqk4bUEOvrgi5rz26G3DaNA/XLoa0ThMU1PklVXPS2XhLat2ah3//lXQtj+BLBDal1kTGZA+cvZ5Vgd1+TXK7KFUYN9mfyEFSil8rnWT2ILinfR2OnAUf2ifq1tXYQbMCHmRMruC3x+8utDGSWTieBT3U8l5TgfZLej4btYJwQHmkVh5fgtDdTtQmwueVcSS7hguJyThE0/7xfgnf/GF7wERNRm8+IKyyD4V253nOKFlbqFU4OXxf7JsqqVrehnf+p24NpCi4/+UfQ5Hlf5plRaYCG2RrfEJMgoQ/EqqITHFZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(39860400002)(366004)(346002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(66476007)(6636002)(37006003)(966005)(6486002)(478600001)(316002)(54906003)(86362001)(66556008)(38100700002)(66946007)(2616005)(53546011)(8676002)(4326008)(6862004)(8936002)(26005)(6512007)(6506007)(83380400001)(31696002)(2906002)(5660300002)(41300700001)(31686004)(36756003)(66899024)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFNSQXZYenFkK1htRTdqUkRoeWVBaGxvTGQ1aWQrTHM2aXArbkZZSnRXTTZ3?=
 =?utf-8?B?Smg4UHZIdDhDR2Zrc3luMUZNQ3RsRHhBUTFueU9DaGR6aUhnZGhISXVwMWMw?=
 =?utf-8?B?dVl4OFM5ZGcvQ1FMNk9kVzdiWmx5eTJ0ekV4U3p2NWt4NE8wN1QzLzIwWklN?=
 =?utf-8?B?TnJZSzcvVVNwQTkwWEhGeXQ3RlBWNlVGOXAwYnl2alNQbzB6ZHhQRFRUa3l3?=
 =?utf-8?B?bHdmZm5WNXVMZVpIN2c0dEMvZlRoYVZ3MmpBMmpwaVpmcFpaWkhDZ1ZBN2tT?=
 =?utf-8?B?eE5SOGFLMGpGSDFwNVd6Z2VoazhsWmVnZk1VdXdPV0FsRDZwZEE2UXhiM3ow?=
 =?utf-8?B?VzRnWGhZcjhnT3N0T0NOVjZlMFRJL3J3UTl0dUtUckFBYm92R0M3UTVLR01y?=
 =?utf-8?B?enJGckVXMlhOWUVkTWtwMmtCb2cwTmQ1bWlFV29VSEpBdW5pdm9raUt3YVlR?=
 =?utf-8?B?cUZVb0kwVTFBT0dtVFkwWHNHNmhBUEdPOERRRnU3RWVTZ3I0REF6cjd6RHo5?=
 =?utf-8?B?UWhRMmR5SDZJOSsrUWt2S2dRT3g3aXFMRmNpZEVqUGdDY2VyQ3hqWDhNWktT?=
 =?utf-8?B?NU9IVUJOSnZvVGhMbmlmbUk1SlFPdWZBbnpmakFNcWxZbGRmV20yTTVlK1RZ?=
 =?utf-8?B?eXBJMFdQNC9IWE0yV2JRM2orcHg2eVFMeU5aMEpaelkvR3ZQWGNoV3JJSDg0?=
 =?utf-8?B?MmxuV0JZcnBEMXl1TlNUUlJIUHpCTkx3TzdkNGhTQmd3eXFWZGRrakxwVkNZ?=
 =?utf-8?B?WW9DZWE0OWlHd2VGZ2UwNTgwN1V2RFQxVklwb2plcEN5QkszVTVBbGNuMnhN?=
 =?utf-8?B?QUhSamNUaDlka0UzTnJRb0wxeWFhTTd5YUUyZXJ1VGNrdmVwNnJVL3dXZzI1?=
 =?utf-8?B?cy9RV3QwZUEyeHZ6b2JjbUd3MUJyUWpjRUhMMHdaaU1NUGRrcGNGZ0x3YUtK?=
 =?utf-8?B?T3NjL1loRTd1VFdwZlVHbGRUd01uSlBQTWNxZXpRRFRJOFg5b1ZVZ1UzK3JC?=
 =?utf-8?B?dzU1V1Zza0lqL0Y0c0NoZnpMSHdQODBDK0t1c0UrYUFHQ0NGMitHWjAxdVZZ?=
 =?utf-8?B?QmlKZWFLZVV2YkdiNndMR04xbGowa05WZzRyNXpRYVFEN2xLMUFnNEZ1MUZL?=
 =?utf-8?B?NDVCaTFQZEwwZmFwdm43WEdGYzJwL2Z5Nm4rcW9pK2krU3l3SHd6S3d2aVQr?=
 =?utf-8?B?SDM1UnJlQWYvMWtOQUhxOWMxVTg3aUV3UEJwa2lhYmFWNTgwdmR0VE13ZTZE?=
 =?utf-8?B?cnNFcm1ib0I3S3JUQUJ3ZVZSUjZjMjhjQmdaUFpxU3M2SHlPN1poOTJ6T0g1?=
 =?utf-8?B?cXZ6RWV6clJZamRMTU9rb3dpbzJ1TnZVVy8reXE2bno5ZjlJT0x2QXhVdkZN?=
 =?utf-8?B?a0t5ZDA2WUtVWUt3MkVvYitmZmhBWXhwM0I2L2ErdlpHNk03RzhIcG9nRXp1?=
 =?utf-8?B?UCtWSTVOcjgxWnJ5UHBBMjlmeitQQ1lnbXBzNGg0dmt1SlFNTXNaYkNZT2tz?=
 =?utf-8?B?OXpTeWhJUWpOU1E0UlV0T3dTNmthdEoxeE9VenZzZ3pWZjhqbnROVjZta1Bn?=
 =?utf-8?B?TDBHNHRNYWZHVHRTMGJxRXVJdE9URHM3SVNCelMvZFhicEJKVnMrUGdDRGhx?=
 =?utf-8?B?cW8waktpVENNSUVFOGh2YmIzL0ZRM2tNTm1nMHo3c2VpMnQ4WjZrVTdCTk0y?=
 =?utf-8?B?b3VLN3F3UU1odklhQnpFT2FreGtNbGNKY3BzSVc0cm9LU1EweFFEWlE2bm96?=
 =?utf-8?B?VXB6ZzNGcUdpYUs4a0RObjlUMnhqMUMyQ2dBdmVjZXNydUtPQ2RDUUE0TS9Z?=
 =?utf-8?B?Q21nNUdVdXN4VHpKUWRzOCtTYnM3eGprMkpicFN3eXc1dTRqK3NGcGVSZi8x?=
 =?utf-8?B?UFFVSUtWZXZxaUZ3VUJRU1VnMzRtWURZYTdaYlZ1U3Y1UFdnYW1ldVJDUzZM?=
 =?utf-8?B?eWtHWWhHcUd1dEZoR3ZLZFRRMllmWWlEMncvWFlpTWtNekl1cW9jbHVsTEpv?=
 =?utf-8?B?OVVISTJ4Uzk3UUFsU1gzOEF3K0l4SkdJZWpjV3hWVTZHVFV6cU9HS2hVVmF6?=
 =?utf-8?B?UDFBY1pBZlRVM3JqMkVKVitQNUxqRXRTR0VPTDVSNnJrUzVER3R5QkROQW9j?=
 =?utf-8?Q?b0HxrLdulYm+xOhXMbutolvMc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c7a8b5-9fc6-48e3-19e9-08dbf2603b50
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 11:25:32.9988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IwNgl0qyULElWzkQj4pO13GoNxL+fvrrUVCg89+1a1guMFsh3ssXdVnZ5xnPeUspKjM69KpQmeqxGNKWvRgh8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9883

On 01.12.2023 12:20, Juergen Gross wrote:
> Flexible arrays in public headers can be problematic with some
> compilers.
> 
> With XEN_FLEX_ARRAY_DIM there is a mechanism available to deal with
> this issue, but care must be taken to not change the affected structs
> in an incompatible way.
> 
> So bump __XEN_LATEST_INTERFACE_VERSION__ and introduce a new macro
> XENPV_FLEX_ARRAY_DIM which will be XENPV_FLEX_ARRAY_DIM with the
> interface version being new enough and "1" (the value used today in
> the affected headers) when the interface version is an old one.
> 
> Replace the arr[1] instances (this includes the ones seen to be
> problematic in recent Linux kernels [1]) with arr[XENPV_FLEX_ARRAY_DIM]
> in order to avoid compilation errors.
> 
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=217693
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/include/public/io/ring.h
> +++ b/xen/include/public/io/ring.h
> @@ -25,8 +25,16 @@
>   * and grant_table.h from the Xen public headers.
>   */
>  
> +#include "../xen.h"
>  #include "../xen-compat.h"

Just to mention it: While perhaps good practice, I'm not convinced this
extra #include is actually needed here.

> +/* Some PV I/O interfaces need a compatibility variant. */
> +#if __XEN_INTERFACE_VERSION__ < 0x00041300
> +#define XENPV_FLEX_ARRAY_DIM  1 /* variable size */
> +#else
> +#define XENPV_FLEX_ARRAY_DIM  XEN_FLEX_ARRAY_DIM
> +#endif
> +
>  #if __XEN_INTERFACE_VERSION__ < 0x00030208
>  #define xen_mb()  mb()
>  #define xen_rmb() rmb()
> @@ -110,7 +118,7 @@ struct __name##_sring {                                                 \
>          uint8_t pvt_pad[4];                                             \
>      } pvt;                                                              \
>      uint8_t __pad[44];                                                  \
> -    union __name##_sring_entry ring[1]; /* variable-length */           \
> +    union __name##_sring_entry ring[XENPV_FLEX_ARRAY_DIM];              \
>  };                                                                      \
>                                                                          \
>  /* "Front" end's private variables */                                   \
> @@ -479,7 +487,7 @@ struct name##_data_intf {                                                     \
>      uint8_t pad2[56];                                                         \
>                                                                                \
>      RING_IDX ring_order;                                                      \
> -    grant_ref_t ref[];                                                        \
> +    grant_ref_t ref[XEN_FLEX_ARRAY_DIM];                                      \
>  };                                                                            \
>  DEFINE_XEN_FLEX_RING(name)
>  


