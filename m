Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 470B96D00EF
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 12:17:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516569.800895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phpL3-0008LO-TZ; Thu, 30 Mar 2023 10:17:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516569.800895; Thu, 30 Mar 2023 10:17:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phpL3-0008JA-QO; Thu, 30 Mar 2023 10:17:01 +0000
Received: by outflank-mailman (input) for mailman id 516569;
 Thu, 30 Mar 2023 10:16:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phpL1-0008J2-Ob
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 10:16:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0109738d-cee4-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 12:16:58 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7739.eurprd04.prod.outlook.com (2603:10a6:10:1eb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Thu, 30 Mar
 2023 10:16:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 10:16:56 +0000
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
X-Inumbo-ID: 0109738d-cee4-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUqlJnxE8e9UaXBhtUcxUd3ZXlqMfAdzdtBjm3xlYQ7lEg6qwmFP6ESXrnt70qVkF21viPq+jLRQMhBkxWsw8gh/fFqQr1FjhhtwVC9XyPayJ+GZ7mRS6sJArp29yfVywSIpxXYft+SBPgRy3esV6J5RcK43NQ8Q86er2KNMrbWVAIoypUOvJJzI+d44Io+ZMsGnyrOR5spJv/H8k56WJYrAVMp3kpVcRavQLd1QqNrEbayPDtTJayRzuzaUGSekMR+aNwUpqN39MVYnx760/lVuthrgL+uNPT9WQiyc8a3+KiYYz4lrUoDJhqm/ke1YAFiMh8q1jWz9FzJi03e7Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zWseryIFQAlxrPEZBp2/4HxlhUyvLyYCchfUj/zf6A=;
 b=C4ROk2d9FMHZ/iqI+hg5CnPKULazJ9gpJqrJAMSgHMlBQ2R46BY4BENr+5WFzwYpPMPhjuUzYB8OFqr7ZUO13UdX6Mm6SSDWn7xYs2IIvX+Stn+czIADC4UFI0pPWmgbhUVSozCSA9gHzgxXgD33ieQZchfcXezCbpeXazpMIzMb/KTj3IQO+n21tmhfGo1A/th63/ECMEevdXL62mrJcc5o0RLkaUZQf3Z5KaRpDBJykVWOTDvejx9MX8bQZjTEo4AoBdO5bsFTJSM13Qbs0ZdPJqzBkylH6vq7k5tRTa0TsPmv2HkZl75KfmscZQqAro0s5FV5YEZwEEPEsb9Zsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zWseryIFQAlxrPEZBp2/4HxlhUyvLyYCchfUj/zf6A=;
 b=WRSb1/Vm5IOLZTqFU+9GxBerEA5/a6l1CGe97PI2MGbdjdMIplql7k44OJn4h/zODqbMDjM0wn0R6RWvIXsPJ0YjG79mB1hZwmrwrQGp6qrFzErznCMisWe2aQJzVkwhhe3WoBIIs86RLMocTNoLEjwcQzHkJMjOHU9Indr8D2qmIstmAvWVxUws+rUdZFkroWLwi4KlJW3YA6JoOvidBTdE6YMPrFCSmNeJiNjGkastjcOeAr087yngH5sYOMd96WwkCJsjuRvME7OIDTdJ4YE+kIhgBiAtC/0azxpKoAxUxHL/19wbO8uTpcBojlkneDsq7DdWfirhdJUxNZ1q3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <758615c4-bee6-32fd-0475-0c3c3bb7debe@suse.com>
Date: Thu, 30 Mar 2023 12:16:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 9/9] RFC: Everything else
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
 <20230329205137.323253-10-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230329205137.323253-10-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7739:EE_
X-MS-Office365-Filtering-Correlation-Id: 156f4e30-51c4-4667-d207-08db3107e3c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3hM3W2Hiszx3ntxtQXpP52M+/uDiIXAXC3NCttB4305rBNnQO8tRn61K4yUby5qpGv8UBui3BVy7YVb7EZqJ8i4KwH6fmNs1iex3n6SpG1HhGZKJGV0InGEK2xzJl58RPJhTZFwbuLGkPcA/8TBze8dOJKgW844GlN8MBzQ09ZYgPt+perS/8/2eQ9coaZuR+cDNLo1VnmdOcAxnMFZJ4Gm2/kKTOmFvDFfGYyAp4IL9I5HP7susoOAFz+8IWcTSBU2kaHTwqopKimAAeWWDv+KZJneMWwceWVLCJr+I+pOQCHHfUMv89CT1MV8hoNH5Qpk/NsTEnFpIXj/ragHQsRH+JaJgjBFvpswpelvQN7bioF/l7RtH5sMvwdgR9eSL56ZSTV0GlcljIA0wzInrNjp0B5HDh7lcRsI6uq0u8h8FmVNuXeT9qGSfx1etxsf1ovL8e8creMKQQF1HsmdLdApES9SMMhyoc8XLTgQ/JyxRcOhS6lFGhmQWxJzaeOHRjTq5XnCzRHq7cDsbTuK38OqIhvv+UFV36NmcQIcLcILWSPjGiV5L39btkYN010lToQhQdvc6rZCOj2Fl/n69ImL6creySQslQ6vZEioc8UhLzx/KDJC3recCMwgm7W7eTSTDh9MI4qWiIn9NsRxzvg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(39860400002)(376002)(346002)(366004)(451199021)(5660300002)(31686004)(2906002)(8676002)(4326008)(66556008)(66946007)(6512007)(66476007)(6916009)(54906003)(316002)(36756003)(6486002)(2616005)(478600001)(6506007)(26005)(53546011)(186003)(8936002)(41300700001)(86362001)(83380400001)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WENRUHRTZzdnM3ZucUpwM0xoYnF1MEFObzRFcmFadkVYUWhCQU9OUUpuNnY1?=
 =?utf-8?B?eklNVkFqMGdBTUhTVEFheVNHczVyTlA0aXpmcGNZdzhTNFVKbTA5WGdYbDI1?=
 =?utf-8?B?OUFucG16bDVBaXBUdDlZKytSeUg0bGhhbzIzdVVjcCtZWjcvTG9LeE5IelBZ?=
 =?utf-8?B?NXA0cWloWVliN2ZETm9HTXpEbzd6VnZFR25QbWlCcE5YN0VHRkhuaURSbzVZ?=
 =?utf-8?B?MDVFb1c1ZnMxMmFxMm5maUtPaWVseENEMWo2L2V3dklNN1JMMm4rbythbVJw?=
 =?utf-8?B?c2Joa291YVpjV2ZyNFJIOFhqZXV6ZlpsV2huWFI5VHpxM0VYamozaDhTb3c5?=
 =?utf-8?B?V1hNdlMyUFkwQ2hvWEZtRzA2b1Mvc2lnUS9uTVNiZFphbVkvUHhnNytDNmZ4?=
 =?utf-8?B?N0hCQy9rQS9weWN3YWJ0YXdGZjIzZCsrZnV0eFhOQUlPd2s1TmRTSU9qZ3lG?=
 =?utf-8?B?bE8ycjltQlA1UkNCREdvRHU0RHpuZERGcmhiYW5rdUszQStKVUkxaS9ENk5J?=
 =?utf-8?B?Y2ZaRkJLNnJhTS9tUDRVTjQ5S3Q3S1dvT1VCcWJtSk9ZcUk5MGQraWZrMkNY?=
 =?utf-8?B?dkp5NCt4T2c3cXpvVWwvOVljR3hZcTllUHhVNS9tMSs2eUNmcTVXYUJLWDMr?=
 =?utf-8?B?QVVEc0JnYVJXbk9zMVFJWFNnc1pRVTE1WGNrVlNkcmpHVTFZY1FXSnIwRjFp?=
 =?utf-8?B?ODJJc2lDRGpjTjBNRmNHaGpZTUhacmROYXdSTnJ1aTExUE5RWE5SRWJUTVhr?=
 =?utf-8?B?bGtHNFMxbzY2MmdLaWQ3cC92UmVVYUVmUHdUK1NQY0pxWC91V3lneld6QXVl?=
 =?utf-8?B?ZmgxQjJIdC9hWUlqSlF4NW83cXgvQytLSXhyRzRGdXVLKzVzN0tGVFNSVHJQ?=
 =?utf-8?B?Y09LNjFXU01IK2t0MVl4ZEMvTjExRlJ0WXVEZGhreEJwVjRqTXErem8zSTl5?=
 =?utf-8?B?QXg4REF2ZDRXV3NGWlFVbnZuRTBQd2diTmZlMG5EcVVEd25jWlE0cmIzSjJU?=
 =?utf-8?B?UUdKVDNwYjVVVGd4QU1ZaG5oUy9LK3VYNnBqU2ZxQjdFU0ZXOTBOSEIzUEp4?=
 =?utf-8?B?OWRvY1BnNVI1c21sUWFjTVhuMnBqcWpQR2tMRDBab08vZnlITDB5dFIyTFBr?=
 =?utf-8?B?ZndjZU1VMUNpVlBQdkZMVy9saVRBeE91YjA5aWhpQWhQU29oVFZ4MXcvaEZq?=
 =?utf-8?B?RzI0VTFtcjBiOTlwVitZMEVqeS9qRG5halNOUHFEbVpOTDdSUDJkWjh5S01k?=
 =?utf-8?B?L0o4WTR1Y0MyOFBKTnNNUlNFY21lMGJXYVVuR3hod0Jta3RVSXB3bVdUazN6?=
 =?utf-8?B?QXprTkI0a25LdzRwb1dIck1HdEx1aFNSQnkrRkt6b2hmY1UyYzdyUnExNmtn?=
 =?utf-8?B?ME5EVmRIUEd2cEZwZnhVOUMycldTdXN1bVowZWFtNFRqZEpDVndUOHFMY1lB?=
 =?utf-8?B?VHdTVm9VWlBrbTdZbFhOUHIvV2E1c0VUcExFa0Vzc3g2Z3lKK0V2Q2hqNks1?=
 =?utf-8?B?Q0syb29UbG1NNEVtSUVMdTUxcHJsL0RuaDZza2l0UjZHb0VUOExnZ21xR1h4?=
 =?utf-8?B?Mkd0dEg2UWpoKzNNajRiQ2tLWUkvNkhpYmt2TUcrcU5hbUVVN3dQWUhqVVpU?=
 =?utf-8?B?aTdZUGhpWVo5WHFMRWFOU0x2bXgrcTR0dFgvNXJTdEZmVmhuMFllNlZhRzlU?=
 =?utf-8?B?S1plaWF4MW9ZVXJKdWZlUjVLbWl4NGl4UEd0cTF2OVRTb0tnblVlQWNPZHlr?=
 =?utf-8?B?WHpPSnkvckV3KytFMSt1R01tN0dvQTJEZlkzSGJXdjBDUkd1ZEhEajBOZGpP?=
 =?utf-8?B?NmJlaWREVldaUFZwSnRmcUdxZTVlelU3dUgraHpVS3dQZ2xybVNLaWRlK1JF?=
 =?utf-8?B?cTI3ZE9ibUZJQTk1Q2YyN1JVMmRlMTRuRzJCS3RkMVREeGtCcStNaFJrUzBJ?=
 =?utf-8?B?RjRmbG42VUZRbGxGVVNBTnVOa29aRm1CWC9lMEJ4a3lJb3JQZ0xXVVk5eS9V?=
 =?utf-8?B?Wnk2WVVGUkFZa1Z4YkRoK1A1N3ZxT1R1bFQ0b1NEVnBCajdNejJLNGZIWkxD?=
 =?utf-8?B?L0JFRTJML2hBUUdkcmROSWN6WXlFWmpKbktNN3lzK25WakhCejRseEFnc0JD?=
 =?utf-8?Q?qmXMGYfuBmwmet3ciZj6ej9XW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 156f4e30-51c4-4667-d207-08db3107e3c7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 10:16:56.1052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9OX2GSE7CafxIXLZWArJZ+knIhxlcr1dYOTXJY8ieODxXXPFnAUjFj5TUHQcEvu54kkrx7jdooeJA3lnD5meSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7739

On 29.03.2023 22:51, Andrew Cooper wrote:
> Looking at this diff, I'm wondering whether keeping
> 
>     union {
>         struct cpu_policy *cpuid;
>         struct cpu_policy *cpu_policy;
>     };
> 
> permentantly might be a good idea, because d->arch.cpuid->$X reads rather
> better than d->arch.cpu_policy->$X
> 
> Thoughts?

I'm not overly fussed, but perhaps yes. Nevertheless e.g. ...

> --- a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
> +++ b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
> @@ -893,7 +893,7 @@ int LLVMFuzzerTestOneInput(const uint8_t *data_p, size_t size)
>      struct x86_emulate_ctxt ctxt = {
>          .data = &state,
>          .regs = &input.regs,
> -        .cpuid = &cp,
> +        .cpu_policy = &cp,

... this and ...

> --- a/tools/tests/x86_emulator/test_x86_emulator.c
> +++ b/tools/tests/x86_emulator/test_x86_emulator.c
> @@ -909,7 +909,7 @@ int main(int argc, char **argv)
>  
>      ctxt.regs = &regs;
>      ctxt.force_writeback = 0;
> -    ctxt.cpuid     = &cp;
> +    ctxt.cpu_policy = &cp;

... this imo want keeping as you have it here.

Jan

