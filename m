Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F8F54809A
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 09:36:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347789.574114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0ecX-00067v-9Y; Mon, 13 Jun 2022 07:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347789.574114; Mon, 13 Jun 2022 07:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0ecX-00065b-6I; Mon, 13 Jun 2022 07:36:21 +0000
Received: by outflank-mailman (input) for mailman id 347789;
 Mon, 13 Jun 2022 07:36:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o0ecV-00065U-JI
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 07:36:19 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe05::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 832cd334-eaeb-11ec-bd2c-47488cf2e6aa;
 Mon, 13 Jun 2022 09:36:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8072.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Mon, 13 Jun
 2022 07:36:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 07:36:15 +0000
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
X-Inumbo-ID: 832cd334-eaeb-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GRO7fAaWPIUamz8Pz+cOx+cq12fPXR7dAqmi4g12sBusn38CS/GhHRrZzDQ1bl10HFEKEJ+HDDA3jcqRWUXUMalpihmrmwEmDczJtDsHWJCJwCPox5Hqa2R0TlCkLMBgVoqkAvxXasnZ6/eMAjrt41kfoRZdkLFRQpI0GRi3MqxkkG2cO/4+peFj2jEj5EwGwga8RSIEcDo5MKA+P53mpqOG72KCPa3oKDSrrJNmtc4PhbUwPuHNZbX0J6eADSyWszk2j6q97OBr+Ll6MP5iuoZc3dcPuPObCYQDJGBviH22zMgUVC+B2T8Tg+PLA9cWXrEnxLaxkZMb2dcx76RrdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQuwCcI0bX5m5k7OtMN3WGRcLdWEfSd1kqJrODpNTmQ=;
 b=gUDoNRkqnRMpExEDftRfKpurKP8zwtVcyvqiSlbu7ZCm1mE4bLFlEsegNV+waHtcF2hOV2R8NzrAG4HkP8xmGJhG++aM+qtwgELUmIk4yLN0o5SQTQxXsMmOU/iA323npKmCPq33NXd3suGE8PoVlzulQx+fBBTNIb+VmhCr+N55g28JLD8Sx+XlfUVAVKgkbe0LUYL92C41gzbo1ID5P2zwXiFuFueI7f/SBM6Ik4rveygn7OTFhvHxuUtf2QgodppHFRKc82yFIITcncowHFLkmBh76T6bKEU085DJksdEsZ+mUYDlf911HnyLLTLhftA5lRVC/I1hW91dwZ6fgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQuwCcI0bX5m5k7OtMN3WGRcLdWEfSd1kqJrODpNTmQ=;
 b=hvMmDhaDm7zJXw7XrfU63YKIY/0H+f4bzP7vCZc6ktehxnB3aBPKvD4M6sc89kC6jeRRAeTMLY0bJLiMrxjB2yPYkSEzXSNj4NuFX/BrxYHY2T5g+j7TZXQRKO20RtJFRGaOqJY5ljZyxmGj4ScGYnBve9eT3lom+LaL6SNSD68HzmTIcGR87Gn+cteJQOlIBEzRW4IKqKXCkx0Jdu0neszMCfqQalVeIxs59QeFAq21pcRFHT4299Clrmh0lCYxfgeedwvLgPntX4+MsfA9ti/mcmz6DyTTiQABUK+mjZyOrOy7mcBUD1dN5Deb3fbrO0ivZG2Y2Q3OQkRsp6Ybow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2c4b41e4-7381-7424-de72-43f55c448665@suse.com>
Date: Mon, 13 Jun 2022 09:36:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] add more MISRA C rules to docs/misra/rules.rst
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: George.Dunlap@citrix.com, roger.pau@citrix.com, Artem_Mygaiev@epam.com,
 Andrew.Cooper3@citrix.com, julien@xen.org, Bertrand.Marquis@arm.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20220610212755.1051640-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220610212755.1051640-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0393.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::34) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4f9ee54-cf01-4dfc-607b-08da4d0f65fd
X-MS-TrafficTypeDiagnostic: AS8PR04MB8072:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB80728C4C72A08AD8C37CCC04B3AB9@AS8PR04MB8072.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zIlCUUDxeEW8vlqz+iXxYdPW35nM88ad48SUVNlvIdYb37WKHMKdLzS1g2UtoGcEsZFcZ1KqrbXjdJbJSOkMC2NYaobmnO7sRh50G3pMFRhrnAmoQahfPvVjVI6tq2hvpXeMWhYnw0CNER+XnmrIlcZaOxjmDkxRQ6HmQp+WNae86jR4vjOrN4mvOiZ4E37QO1C5zrPADXmJx6YrA9vlk9zgnTOE/wY37jIO6KuvSPl+bk6N2gN94ZEV5Il2jnmCfEizgPiKUONKDqd+a9z6BPlFCwI5VdWVO78j9rywAi13XN88Vyxgp60DkOwRZ8waw1prP0RMB6DZGWSVl4JQBVZawwCfwccZASerHhJJ87yBA/IeGW31sdV34wU1c2Oy+GJVP/5Oj/kAt/L1FcSQKjaLLOAtaq7JX1cxm2riqLTb2H4pkJh34la32fi7B9ZtILiR/HZjhUnb/DsDPIhn+7+h9IR7tr1WHLJ4WogdCkkVwcy92qbKhNken8a9r2UBuO9Q2WAKyUnCcRQk91nAMz7ER7qi/0cMfVOkZWICC7lWbG6MudeqfgqAvQLczZXMgmUHGYEqmyi/JosWRnRYsKE895jj+hwzsx6wb8NuJWJfVKEM4NqzdIb278edKY9AEIetMqcyYyos8DuCYckHINZ0kncTK6eIq7K2qSSjT3n+B5HLK7CW8RUGEvF1Scu5YGD83ys2jexc4af09q5nUq2on6qXiYvttFAi0Sfq4Gi3/BzwM29WLSHJbUb/EYQOCHxB75NE1vsg/feCNjkWyMTaxrovcFzzOtpuRTfC2sjH39U6qdLfEUvIeBvZfmP96jKWSLwmnh9tpgaGmkG6yA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(6512007)(53546011)(86362001)(6506007)(26005)(7416002)(4744005)(5660300002)(54906003)(31696002)(83380400001)(8936002)(4326008)(8676002)(38100700002)(316002)(508600001)(2906002)(2616005)(36756003)(66946007)(31686004)(66476007)(6916009)(6486002)(66556008)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWkxYncxZUtlbUJGckt6MzcrUWRrRkhwMnFIWHdpdFNtbHhzMlpXM3JjNmJt?=
 =?utf-8?B?bDdKS3I1c0wvT1h2K2lFSDZXbGVtUGgyME5yQkpEaldUejBxOGlNbkZESjdF?=
 =?utf-8?B?L3g2Q2dKRE1XK0ZiWlBma1dTNS9DdWNIdld6aUh6alJDelRYRUQzYnRKSmpw?=
 =?utf-8?B?NlR1R0lxci92eG1OVnR5SWVNREJGTWtuMjlHNlFtQUZuTWJYVzdkY21jT25U?=
 =?utf-8?B?KzArby9xaVZuV2hKVzBtam5ndmozK2lseGxVc1dPQnVyZFBMaWRRdjRjSjRG?=
 =?utf-8?B?cXdiSmxSaVpOYUFtMGJjelM5Z0dpOXBGZ3J4a3R4emVDZ2FndEhIYTdDd09h?=
 =?utf-8?B?Mm5sSmZ5ZEtNNHRxK1h2ZmNWcUFTbldqdm0wTlZieGlKVytQZ29WZ0pPMDll?=
 =?utf-8?B?SlY3YnVEa0JNQnc3M2dPaEtlanFydzlGUkd4RTJoZ1IwZmFFczlyWEhCMWZl?=
 =?utf-8?B?dEFtYzQzVnhSTnJwRFZOWUJRR0wwa0lXeU9UNmoxL0U2TGVNeHJkcFBwdG9R?=
 =?utf-8?B?RldTNEo0TFBoTUdMdys4L3Q2Y1ZQUjhKcjNsME8rckcwbmUxRTF4RG1jRktt?=
 =?utf-8?B?eGZTYzFGeHNTbmdjdFJMcHY3WHBHZTQ3Q0NYNE55L2VrUndKd0M3WWliWFMz?=
 =?utf-8?B?QTdXRnI4dWtzUzllUjBmekJsNDhYdTVhak5wWStMNVVHdU9HQ2FYN1QvcUFl?=
 =?utf-8?B?VnNQNFJQanhnYVZYczFSbGJRS05LTWF3d0graWx5SU9qNW5LOG5HelRvSzNP?=
 =?utf-8?B?T2JuRGtNZE0xY3NlOTZiSFN3RHJWMjdWMFNsdlVOc1puN3owNG9MalpRRllB?=
 =?utf-8?B?TjF2ems4MTA2V1E5emhBb0xMSXIyUzh4RjJUZGgvS2JwMUxrT2RrbEozRnk5?=
 =?utf-8?B?ek5tSGxLNnNoeHYyOVpFRUJYcEpibEVFODFXMXBnSE5FMEVIN2JnamRjb040?=
 =?utf-8?B?TGJIcjBiUFMxK3laaTZhZmViZkFkWm1HUFhTdDBLSGppTEVUbXRUTFFvRWNW?=
 =?utf-8?B?MDl6Mlc2d3g2RHBTdUJOcFNTN3pjM2ZIREpJelZqcjA1SDlmWnB1QmkxTDNL?=
 =?utf-8?B?V1ErZ1RjdDJVQ1Z1V2I4VHc2U1cxN2Q3UmplbjBOdkRXc3NpVlJQZW9hOGw3?=
 =?utf-8?B?WkZTQ2c2SkxNSnRUZ1FnQWdiQmF1WlVHQzd3bWpBOUtJOFZESXQwRnBLWCt5?=
 =?utf-8?B?bmJmQXM0RWU5TlcwaXRmODlsNGkwaE1UTE4rUkRkclU1VEthczg1WjRoNFNm?=
 =?utf-8?B?c29vdnFtcmN6Rm8xdVoweUZ4SmNpdzlLNFNmMC9rdjJHMXJEUU4zcW1WeW1G?=
 =?utf-8?B?TkxhcHk0bkhvQW5VVFJlayt6V2JqT1dGS1lEa3NlWExkaTNraDV5MnRUNUdn?=
 =?utf-8?B?UEpUQzhZT2Y5bVAxT3ZFeEloZERjTTBXVmhJR1VtQnFpR1Fia01QTitkdG9C?=
 =?utf-8?B?QnNXRzl6Y1Y1REdDU2NoemhpVTk3NzBZempEcWRhRW5CaVVYeFRucEFFUGJF?=
 =?utf-8?B?eXlxWExIVVE0NjAraVlkOGhLcnFWOThQUk1sZndtRTl6aXpqYUVXcnR1bSs2?=
 =?utf-8?B?NjRsM1NhbU1hK2hFcVdtdHllMnBDdjhBNUY0WVZUK092R0tVekljUkJMTWtw?=
 =?utf-8?B?djh3WFZSbUVUdFh3YWZhM2cwNHdqZk1ST3VURVJEOHh6WUdwRG5wM2k1Sisr?=
 =?utf-8?B?TC9YbDJoZmdVZXJTNTNFcXd6YjhzRmhCTk9NbURMZFM4UmRlNzlWd0p1azhp?=
 =?utf-8?B?ZDgwQzRCUGdGN285MEhmRHpxUFdrWlBKbnM5TEZkcy9BQ2RjZ296Z3hNRGVB?=
 =?utf-8?B?dGREYU80VnhkQkRuT21BSS9NT1l5bmV0UzEvSUtoMVVhblczOU1VclJaQlA3?=
 =?utf-8?B?NHhXcVFsYWkycm9OUXdteGxVSG1YVTRyRnJoa0tkRmZidXdsaFhZYWMwVTh5?=
 =?utf-8?B?eUowaVU5WHhqQU44WkpVNDZsc29oajBCTGZyd1U4RngwamNCYTBlNUE2WGVz?=
 =?utf-8?B?SkNBOENOV2FIZ0lHcmpIWUhwbG1hRmdGNnMxeUUxY08yNGowcDVpaFBXNlhn?=
 =?utf-8?B?L3JHRnExVnc0cGJmSjh5clQ1R3dXNGM1Z3pzUlNwSGlUWVpvdURSWXdoRThY?=
 =?utf-8?B?MUNrbEFReUh2S2JtKzJlTGE0K3lQdnUvNU50NnpvNk4xa3orQVBFTGNHM3RQ?=
 =?utf-8?B?azQwL1FqclhCVHBreldpWUk1VUg0ZWtmTWxnTVBLQzZMUzRjYVkwZkNkeDFl?=
 =?utf-8?B?NXBWVVFrU1ZHQlg2QzdZR3RwL2ZsSGU2dlpkNDRQZVBKL05qa3dMbVNqYy9V?=
 =?utf-8?B?ZEZFOE0vYm5UYU5ZYU1xZmhJaVZUeVlPNU4zbnBaNk1hRFZ4dEl5UT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f9ee54-cf01-4dfc-607b-08da4d0f65fd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 07:36:15.8861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SrYC0jdc2Lx1yCNGdLunynhoOiKI1WdF2mE42HH8RbUMY44wOf8mh5oLPLFOGHcraRzxTAfpr9IIIP04le0y7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8072

On 10.06.2022 23:27, Stefano Stabellini wrote:
> +   * - `Rule 5.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_03.c>`_
> +     - Required
> +     - An identifier declared in an inner scope shall not hide an
> +       identifier declared in an outer scope
> +     - Using macros as macro parameters at invocation time is allowed
> +       even if both macros use identically named local variables, e.g.
> +       max_t(var0, min_t(var1, var2))

Nit: I would have been okay with the prior use of MIN() and MAX() in this
example, but now that you have switched to min_t() / max_t() I think the
example also wants to match our macros of these names. Hence I'd like to
suggest that either you switch to using min() / max() (which also use
local variables), or you add the missing "type" arguments in both macro
invocations.

Jan

