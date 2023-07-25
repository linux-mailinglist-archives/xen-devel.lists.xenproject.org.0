Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4100F761E3E
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 18:16:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569830.890968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOKhr-0003Ul-Da; Tue, 25 Jul 2023 16:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569830.890968; Tue, 25 Jul 2023 16:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOKhr-0003Rj-9c; Tue, 25 Jul 2023 16:16:15 +0000
Received: by outflank-mailman (input) for mailman id 569830;
 Tue, 25 Jul 2023 16:16:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nivo=DL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOKhq-0003Rd-4i
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 16:16:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 924189c3-2b06-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 18:16:12 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8956.eurprd04.prod.outlook.com (2603:10a6:20b:40b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 16:16:09 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 16:16:09 +0000
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
X-Inumbo-ID: 924189c3-2b06-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cdcWfHXmDeI/1GW/DBAnfOHgKVHCm1Yo4kxH9zEYAEOR4eKiilW5ULosQufbBmc5xar/Bm8OW/2fS5IyLoGJEx2srCHlabkPnIZlqg+A2XucdhHoVwovU1hePyEqpxd+j16LGrcB/cuGHTRY3NZazKgFUaFkp0TK5j5xUNsP4bQf3Yq3J++RhKeUosTW4fID32GrmcZn7LAdpj0OsC44il3INKD7U1lbRNsEYzn8LdRWs5HOVHzLr9uQYYTWafJ2N1XxB4mzEZHcjioArzppG1A8jeGHX64lxZoZHJAaoaBBdScPRITh+k0e3qdVPYGY1rCFpc3cr+JhtbyegTYhrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zhk8p+vwoO4d9BWmNqf9aqUY4Ep4CONckUbDoj5U26c=;
 b=h1ItWeVtf2gfagR/jdCc+KK2ld6XSFGz1OlbD8tEzbOej4FAcl2A7nJuDlSW5H3CDh00SoIA8HatxTAIAy8xcEXRkBUTSN6BDrtOfKxq7Hy3/HhzdSEgubvBaH2pIJeGOmX4cCFHiCtk7fWoG+IncEEdCT2N/JydXg3vw/XGPEr50KYNLDIvDfTa8ZPceLGOpUX9OfuOkpeVgCMetM+DaajfWO9+/z0i3Es0imSuTSncea8E8Y/YLyZRwWc4YlR0ia0ryBG29eXuXUMn/bsLjOLhMp92p0t84UqnxA01sueH9SmxNUfArbG08cIU5D8y38FB4XrrsPahisSsq/zWSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zhk8p+vwoO4d9BWmNqf9aqUY4Ep4CONckUbDoj5U26c=;
 b=wLS0aYm2vxA+YHHitHolfiMM0efCe73Y3TsmJJm4ycBYalgOKZVMMu/qOVPlSNNDR4FnzNS18SIxqksBrYPqlmi8xPTIxDmru6GF9l24VggoQpC06pgfgS3Cxga7vKY5ilhoJ7PiiyReYPrLSavQ5CNsYerB497Eifg5wS2hHIlr376wJsshTgQUmkRSHmq/BIKj+qfLqzRg59G+YovB19HrXgvGOBBmfqu2PHU1V6w7Qj4Kvmt9WlyA/14r8JqaPOG4rJfPWd/bXSQf/ZzxEN9dNxGwhmsUFEZYDpSXoNSVI8Z6//ZejobyJTYAikgrnPEWtv2ZKV3AKpINsL47wA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5ba647c0-fc74-595e-5fe3-658f4662f16e@suse.com>
Date: Tue, 25 Jul 2023 18:16:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] xen/public: fix flexible array definitions
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
References: <20230725135557.20518-1-jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230725135557.20518-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8956:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d2de74d-c413-46c5-6042-08db8d2a7512
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wGZ8zp49AHZwGADXmDG3cxJOmfCPpiytwnT2lr+T1xXfVs87tm7l8guyXUy3WDHEYTkTbBB2QLaSAtx+SxO0ouEels4Fh1EPbzmalVskaQNfhvV6KBMRu2VVgXHdnVvzgmaOdg4AJq7Mbipg3cZPhLKtg6ZzWCnJJFt2KNHxiBECmcIb9GK/6PyqxQb0i0QBPcE8a1yhSwhhUqvbrmzjt2yrckS/s2+HXvIEoY+mUjDolm2foMzjPBhVr1UZ7chhFiFtG2FFZtogO0hOyApPnxWjtLI2IRDFTdqPRpMwdrZCCpW8eLrz9W1iNIyP7jWB1Zi/7iYFiekN2aXupNKurHTgGt4ImE0h/Ck65eCyvzvEE6sju/NZOreo4dsDzRYcaHj5H2lqff1VcVBBQo3qeBttUbPLV0HTj4u9tM1kPVY3NXVWsk4srIcb/I7j4BD9nrIZbcnHyPZX7Chzx09uuHXBqJ8egx3TedX9mpJHx2xEmF4lrzr4QUipV15jYqwXcn532Al1BeU8i8Vo0wzbMZghCJWgO2wFTD7DY4ZdVDViBcpkjmiW932dDobAIwvA9UzlijnWM2sWrbfXHCcYZNvjBHstg7AwPyWydcdQ/c7d23sV+Ue6ucZUFAy0S5CcadlOL/KV9B4bXk3uNVNtXg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199021)(37006003)(2616005)(6486002)(478600001)(86362001)(966005)(6512007)(31696002)(26005)(53546011)(36756003)(6506007)(5660300002)(316002)(41300700001)(6862004)(8936002)(8676002)(4326008)(2906002)(4744005)(66476007)(66946007)(38100700002)(66556008)(6636002)(186003)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnFvQmJCYkdCVk5XK2FaeFFTcjh2eUlDejZPS3hZczVzaDhEQWZmbkNuN3lJ?=
 =?utf-8?B?L3RFMFoxMkxrRmcxcHhnL1BML04wd0dQa0haRDNkUW5LNjltRDdsMEM3YnBV?=
 =?utf-8?B?K0tMQ3VXazVudDZibUk4S3FiTVMzMlB4TVVydmFqUi9MNmRvc0o4dVBWL0tO?=
 =?utf-8?B?RFAwTzNya1BHQXJicm1mZklTaU9KTUlGa2d3QlBWWElqOWs3K2c4ZWx1YVQ5?=
 =?utf-8?B?YXNRNFlFVGxVdWxaREZuY0tVQ2JwY0JYcVpkZ291Q3dNbnZuSEpXaUh4ajAw?=
 =?utf-8?B?bUY3R09rdTgzNzlwc3EwSEI1REhKd1E3K1NNZ0pQSk15VHBGM1hNL3hBUFQw?=
 =?utf-8?B?ZExxZmNCcEtyM3cwa2c5NXpWQVdsUnAwYVcxc1h4MXplOG4vRS9QRGNDaWV0?=
 =?utf-8?B?T3EzMmpyOU9kRUg0WWc2RENhbmE1Y05IRnJ2MlZPR0Nuc29lZU5yZXBnWlJN?=
 =?utf-8?B?U0o5YXcyVmJHNUloWkczUnBYNk5OTGJTNC9lTGtTRk1jNUVCTmpBeHNZZlZV?=
 =?utf-8?B?SmdXdVFGOCtyR3loUXhRWkh6SEJqRUQvdXkxclpKWVB5cFhEaFRqWDhNL3NG?=
 =?utf-8?B?ejlQNzNaZG5uRXBtTmdCWFZFajA3MEVWV1AvWlBTZWhxYkVMV3pPdEZpRm5X?=
 =?utf-8?B?S29GblFscHduUmlNV3haRE9rV0UxNXBvS09RSlVuR041aklVVTNjd2lRamVZ?=
 =?utf-8?B?b3JaTUgvejA3WEpndGZ0Z05UaFpFS0dJSC9NVXVFSDVCdURZZXo4RGE2UG5K?=
 =?utf-8?B?eDFjOTVEa0lFM1BpaEU3djBzKzE0STNYL3FqQ3V4QmtaU3NIdGl4TWprakFG?=
 =?utf-8?B?OVowSHNpdHFOUkNxQ1FKWWNNQUpMY3piVkJOYVN1c2lDTTNLVnQxR1NOQlpr?=
 =?utf-8?B?QlFpSEoxWWMvcXViM2hieFpRam9Fa1h0QmNFOStDYmMya0tpWXpIQTJyVXEr?=
 =?utf-8?B?TXViMDlRdjRMcE56RlZTYnRmQS91UzdjcjZjUysxa01objBpL2FPS2d5SXRk?=
 =?utf-8?B?WVBOTXFMWWFhQ0FVc2VheTdoMlAwNkRtMXAwT01tUGVkRjhrY2NFUVlMYTZJ?=
 =?utf-8?B?UURxazd6TUczQi90RDVwMExMZjFDOGcwbWU4cDVkaFF2d1IrdUozbVFKL1Bv?=
 =?utf-8?B?RkV0RmVBMnFiZmRXbHZybjViU2xYc3U2RHlDVnRJc0NCWUFla2srMkpCNE8r?=
 =?utf-8?B?VUdtVC8vVEFvZGFmYk5Va2NodUpjSEMxOXdRaVZqZ1kvM29Icm9JdkxPVU5E?=
 =?utf-8?B?VkgrNW8zbDBwOFgvTk5jU2IvaWZiSUptQ0I2TGpOWFFZbU9UQnd3dG9jZlN1?=
 =?utf-8?B?c3I1dlJWTjh0OHg1eGphMFUyZTFzWU9nbTNOdHhkUzQvTkRqcDRWRWw1Z2Ni?=
 =?utf-8?B?R092RkNuaEliUXc5UTRmTUNjbmhhUnIzNmU5VzE1ZC9PTXF5RW5DZmhrai9F?=
 =?utf-8?B?REtvRmlqbWJvdDZWbU5LK0xreU5waDRhZUtvMHdyNmdZZWR3TU04eVJpSnJ6?=
 =?utf-8?B?bzN0VXV6eGZyL2FJcElZYUtGQUNISUVLUDFQWGxNUmRBNmhOWVM2dVZsaHVZ?=
 =?utf-8?B?R2U1eVlhSCt1TFpBZVBmaGlhYWRvcDI5OC8zelh4Q01PZjlNZGhWRGFNSUhG?=
 =?utf-8?B?dmMyTGd3VHA4YzVNUmhCSGl5NXErQVdDNWV4VG1jN0hTYisydmNmWUY1WHFl?=
 =?utf-8?B?RG54aGxmdWlQTUxPZENsN01BUFBjMGMwdE5wUFFoY0t5ZXZjbURWN3pEWlVV?=
 =?utf-8?B?YzhieVAwTmQvTjQyUFFrRGY3MklQL2dHdTRKNWM4NU1STE15Z3ZGeHhHS0Vr?=
 =?utf-8?B?TFB3bG1RankwcFlndWlLNExnVjFTcXh1OFRtTDBYVmJ5N0NkMDJDc0ltTDd2?=
 =?utf-8?B?eVVsczltUDhzM2lqTk1OYWFVakYxRTBtbE1RVDJjL0Q4VEZNVVNIMVNHM0Fw?=
 =?utf-8?B?TFVBQks1NDg5WUtKanFFanU2RXNsNEdoa3B6UDdqSlNacjNwS0pDb1pkRmk0?=
 =?utf-8?B?YzNocXkrQVQ5M3NJSVBWb1hDOUVLU1I5SmptNTNnTWg4c1R5Vlk3cTQ1dWdT?=
 =?utf-8?B?Y0poUjBnTnVhRy9wUUxIRy94SzVxd0RiZUdKUDNVcDVzUFZOTk9jdzRUck9E?=
 =?utf-8?Q?DvgY8pMWAOCBMejEBXywRDVFa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2de74d-c413-46c5-6042-08db8d2a7512
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 16:16:09.7035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9NllXkXQIDWlseFpbHxuQwd75kXBjFITOuYB8+RDVVJX7PsLMXO/G0rsbMZPGmqUGn+K0awoR+sVNfLb+ALFSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8956

On 25.07.2023 15:55, Juergen Gross wrote:
> Flexible arrays in public headers can be problematic with some
> compilers.
> 
> Replace them with arr[XEN_FLEX_ARRAY_DIM] in order to avoid compilation
> errors.
> 
> This includes arrays defined as "arr[1]", as seen with a recent Linux
> kernel [1].
> 
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=217693
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

I think we need to be careful here: What if someone somewhere applies
sizeof() to any of the types you alter? The resulting value would
change with the changes you propose, which we cannot allow to happen
in a stable interface. Therefore imo it can only be an opt-in feature
to have these arrays no longer be one-element ones.

Jan

