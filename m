Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C03697F4051
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 09:39:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638525.995155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5ilR-0004hy-To; Wed, 22 Nov 2023 08:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638525.995155; Wed, 22 Nov 2023 08:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5ilR-0004fp-QY; Wed, 22 Nov 2023 08:39:17 +0000
Received: by outflank-mailman (input) for mailman id 638525;
 Wed, 22 Nov 2023 08:39:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5ilP-0004fj-RE
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 08:39:15 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20623.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9dabf0fb-8912-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 09:39:14 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8940.eurprd04.prod.outlook.com (2603:10a6:20b:40b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 08:39:11 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 08:39:11 +0000
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
X-Inumbo-ID: 9dabf0fb-8912-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8xpwHLAKaT8CflGbDMHNZkBKkWAJl1AZSeYOuLtrhre6fWtO7QXpuI24Zo/h91Lif4pvupFKchx8vKkLhBj0Lsbl6h2FSVJ0IR3zxcabH90hvxIz4hyqookLLAF6AUffiDrkYwVox/rxdcbDg0lchI3GGxxAlgvHt1uJ1334h1na46BX+kSxxnZ60kkKTTp1vLnZ++zFsRFc5dL0srBttS4aQFx4u+PMbbDsN+9CkHeTnT93lSJxefueuvLufO9DqX19/TAgLIiYDMUTayvPJUCkdEnyw8cSiJHlrZ8l4ZEkn/cN6thPL5TgGlr3k1IulPiO+asyXOLd1Kwd0UIvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXtJDx/JLtcJKNSVzQit/PkT1VM0RyYHU4jvSxa+sVo=;
 b=d/YXmuce8AIRdDAd/nRXC04QyXej4bW0VKGKXx8Xbvm2BmbSfJ2JccQkqN5c0PqB7jLN3NNzypxvc7adh4da48Sq3NJb3YHseYayyg1xzek4dLqgHS6jPxfSNjmUTagFABfFXYKsQOUm9T0qXwF82qRFEozfCLrxthfgVSeevMThMpiPEs1nGjGiF1mpFTmI9Qvi1eBO8dcYpqKThzJlW/lb7Q2cAFZN3C4gcrSxhAilHtDYstbUat+c+ehfpyBg/REaQeneQcwrTyJsX85t9EsKx4Xdb5nc2Vxu+C3Zem/TQ65i22udvfzGCUI/OFX/eZltFeVzghgqKJwYbXsN0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXtJDx/JLtcJKNSVzQit/PkT1VM0RyYHU4jvSxa+sVo=;
 b=Ue4jyA6/EyK9bMPYFxli+Jh7NxDiE8FeHH2+oq+iHPKL/lgjNU2F9d35UWuOLljWl+rDBCM+fScsuMT9EAUcO3VCqZ+gOXqByrLbosV41PEp4ctjK8Z/KBsbmvcxovo+llQUaG5VBeEe9266RnimoTmRaj98GZnCtMIyq+/qVD1n4WqPWN3d4HsrFAPVjaMF3cvQPTlkU4XlI8DpQWQ4Y5RATHYfIXZ8qmAYdVZATQSF83yXfU4GVMx2UqB7BFlTZCUifCH0DJP9tYwZxhJ0+IWqFdbi07rI+o4QG9Hpz1Xk1BmNmPo3SnW+RsUlzfI+VBAnKRdbvas8JMeQjoS8lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5471227c-40d9-4b85-b4f6-d0a41c471166@suse.com>
Date: Wed, 22 Nov 2023 09:39:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tools/python: add .gitignore file
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD
 <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20231122083153.24101-1-jgross@suse.com>
 <20231122083153.24101-3-jgross@suse.com>
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
In-Reply-To: <20231122083153.24101-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0253.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8940:EE_
X-MS-Office365-Filtering-Correlation-Id: dedcd655-5a0e-4b64-424e-08dbeb368047
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XCieeDFySZQo1pkPMtT0eRmC92nnT7Yev0u/5NpoUVBgLrpUHZbQmk/QKonxMZYh/aYHzIRQu82/KF49dGnypnWAlPIAThmr5zhIrgYasXZmy0Q8LaLCh53OW3O5GoOwr5expsBKEixFKbrc8sx2r/c//loplkfGFs7O2pqnSkBWLxGPYi6JG9djIMhkrMd9rJWrTcSM5tLqRXNREGm5nIgpWjibEcCvznKENctbRFsxE81jQPFlvJWb/UzX5yCibru/COthPz41p4X7rwTr8T0d8pfMVA4oC4i/eJ84T/mbpuHSAW8kUcwU3F0XM15CdM+8I6VPEP8QaXNSw0GEjmLKVH0+3mn81jvY2cFHJDCmVCB8/FMpKK6stD7UEbE6THhPhZyFxSO70CMQLzDKFut06pQj3qkxI5ZX3jrTFuibrxsxVgaHbhVDd+MmSFbUKPk1B8nifOrKIu1mmqDbwjcmQSSOz7mEAN8Va0B1o3GL4Njwuf1+ypHYuYtjCmpPhYHd9QWkPIHVwsJuDfHdi9YciH3M6YTnSQQXj12250Nu+4Mhb487VzQrUMsK1/TMsJeprfUkeTkKc1qJ4Tr+k98i8pD+Ch52x3JkDdF6YXCGCrs0ipwvLoPkqxwBFei8e/NMAYgdhLNRJ98BQgtqBg08knGJzLKrlesXDt4aGBOTHezy2gSiQTaUHdykSFE8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(376002)(366004)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(26005)(2616005)(6506007)(53546011)(6486002)(478600001)(6512007)(4326008)(86362001)(5660300002)(8676002)(8936002)(6862004)(31696002)(31686004)(36756003)(41300700001)(38100700002)(2906002)(316002)(6636002)(54906003)(66946007)(66556008)(4744005)(66476007)(37006003)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDFWT0FnU3FyZG5jT0ZaSjM5UlFlUTJHSHRJbng0clI5TG1JdGxpOHVkaXFG?=
 =?utf-8?B?ZjQ5dW91SUhMbjVrcW1VVXBOdEp6WWpKaGw3RmdKV1JPdHkwR0I3VStTRldW?=
 =?utf-8?B?cVVLeEdkN3V2RVZSTUNKa2dSV2ZwL0xtOVJ0MGtUWktUUWtldmdYSlJlblo5?=
 =?utf-8?B?aTd3MWVwZnYxQk9vaXJzT2RqVXUyZVE1MFl6YmtYK25XdFBnNFBZVUhiWW0w?=
 =?utf-8?B?d1d2eGRaZkRjRDUzSG8wSDk5WTkzZW1DN05iUlczOVJiVWxqblFJWFhkNW12?=
 =?utf-8?B?aWNjQ05mNVdIOXFPRnM5TzVIbnhqYytiSlF6MW96ZzUwU1J3M1VJY21EcGZ5?=
 =?utf-8?B?UGkxcHdBbHRPbE9NSVdBcnNCYVo3c3hBQnFYN0V5Y2p4SHVnOS81YWhzNUZK?=
 =?utf-8?B?ajhhcVhXaTNFTUI2ZlppM1VBVjhKSU8yYWlISEFEWktsVERwdFdBQVRDNi9w?=
 =?utf-8?B?NWpuQTY5akdEaGVwT1QvcHlRcDQvOE1iY2M4Z1NtVUFVVUJONEs2OVQ2Mmpi?=
 =?utf-8?B?eDBsTDZaUTRURVl2ZmliOGFwQ0RNUUNFRVFzdkJHK1RnYzRoSTJVbmw0b3BI?=
 =?utf-8?B?aHJYQ2tSM1IzVENtVFZheEkrSjNnYjlPTXdtdlltcTI5Rnl4V0UzNUs2RTRK?=
 =?utf-8?B?UURlYlZXMGdBdnZSa0V6czFMTmJNenBFTUFDMjNUYVNKT0ZMM2ZvcWpvK1Vq?=
 =?utf-8?B?RmtrSVduU2lrVjUxSWRRM2ZsT3VLS25ybkp4bE9KU1hYS0ljTnhQOVBHNFdJ?=
 =?utf-8?B?UE43bk1udEFQeTMvTXlvaFZlWGN1Z0ZuSEtuQzFxSFBvNVhLMDkyNXdGUkd4?=
 =?utf-8?B?VWViWTNybW5QUzZWQnkzNUI0SXdHNFBqR2MrME9nSDZjbEFSOTFPN3FFdlM2?=
 =?utf-8?B?LzRKUUhDUlBweFkrVkJVeHI4aDd0M0ZuajFNcTF3dFN4dEVEaEs1eUs2OENC?=
 =?utf-8?B?N2g0SFFyN3FVZHAxVzBjckJmdjJEZElCbDhGVzBtTGFTMndJZGdseU5ZYjEz?=
 =?utf-8?B?TU13MldsZGxkanFCTzJDQnhPbS84Ums1ZHY1NDY3WGxSSWFjSllBaDJwSEdJ?=
 =?utf-8?B?dWRibkgrb1lHQ3B0WTBJR21oL2hzVFQwTXd6c2VCaXlDN0JCaytCaUNKWDhw?=
 =?utf-8?B?ZHV6cDNlNHNqWEhnSlFoUjdwTUFRVXhxMWQ1cUlOVEFabnpDSUwwOG51NFlL?=
 =?utf-8?B?RE1YWnZXMTJuVkI0eWp3SGplSlFXRGRuWlVDYitxRWVQa0VocVNKcXpGUUti?=
 =?utf-8?B?Vk1GL3FjZ2tFZVBLMjNIajRsbTBpTTNsdTN5cEJ4cWhMMzZuNC9SRHZHcTNO?=
 =?utf-8?B?WFhHeXFaU0ltYkdDWjV6LzU2L1lqS0lqVnZGZC81QVl6Mzdid2krQ09Paklu?=
 =?utf-8?B?RkttcElGMDlIbGZ0YTJHdFVFa0tjMjJhUnQ1U29NQ1lqR3pTZzduZEcybm8z?=
 =?utf-8?B?NzQrcnEvOUdsT3VSb0NUUnl6MWQ2bDFZRVlEK016RDRtL0tyTWVhRFRTUnZw?=
 =?utf-8?B?T0dCcjRmZ05oUGd3VllZMXQvMnk4cG42SFR2dmhScU04d0RtRHMzdjduM3VJ?=
 =?utf-8?B?UlQ1R0g2RmlVTkNzU0o5MGQ4T2lHU05LSmhRMmNUbGdvQjJMUTFmV1pzaERu?=
 =?utf-8?B?RHhWWDR0S2JCM2FnZGxyT0o0S0d1OFNBNDdRS0RYNzh1blJxUzZSWU04QkFz?=
 =?utf-8?B?SDMxZEpZWVBpSGdSczFxK2FGT3hqWTA2U0FnNy9DL3l5eU9xSk9uMWp0c01a?=
 =?utf-8?B?Sm4xT3JZVC9KRjY2aWpsMnowM1FEdUVFeHpVV3FzSGl2ZHIxUWNvMytqQnNs?=
 =?utf-8?B?NWhjZmQ4Z08zMmJMRFJ4VGc2Ukw0QWZYU1RLOXNwdDZzU1p3cVlKMmdLMXV0?=
 =?utf-8?B?ZXVXKzBkdWpIS3RqR3RzSFIzUlltNWlvdkVoT0liK0pNRThrSzZJWGp3bktQ?=
 =?utf-8?B?UVgrNzFCT3JiaWZrcXE0YnpocUlQU2lmQjRtWGtEdk53QS82dG1hOTIyVjgv?=
 =?utf-8?B?RU5GRXUxdTRMS3VqQ1VOWGZsMU5hSENta1l5YVdtUGl3TlNYekpWclgxNWhN?=
 =?utf-8?B?dUpENEQzKzVMQncrbm84TWkzUnNXaXFuTEZCckdmampPNWtxVW9laEttelZv?=
 =?utf-8?Q?QQYu04+XvkiudTyHzjqY9wSoR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dedcd655-5a0e-4b64-424e-08dbeb368047
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 08:39:11.7053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PZAckpXS5+u4m6cKLBYnaOnRJaTu1RpTrqcqAv0D0A2rM+vb8Lvt05n/W4gaHLv77UvbqI/eAtBNTy5c7uSSKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8940

On 22.11.2023 09:31, Juergen Gross wrote:
> --- /dev/null
> +++ b/tools/python/.gitignore
> @@ -0,0 +1,4 @@
> +build/*

Are this and just build/ actually equivalent? Looking at our top-level
.gitignore, I see e.g. extras/ and install/*, which I would expect want
both treating the same? The form with a wildcard, to me at least,
doesn't obviously include the directory itself ...

> +xen.egg-info/*
> +xen/lowlevel/xl/_pyxl_types.c
> +xen/lowlevel/xl/_pyxl_types.h

Since wildcards can be used here, how about just

xen/lowlevel/xl/_pyxl_types.[ch]

?

Jan

