Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F59573300
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 11:39:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366397.597153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBYpu-0004LJ-2X; Wed, 13 Jul 2022 09:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366397.597153; Wed, 13 Jul 2022 09:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBYpt-0004IJ-VY; Wed, 13 Jul 2022 09:39:13 +0000
Received: by outflank-mailman (input) for mailman id 366397;
 Wed, 13 Jul 2022 09:39:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XN81=XS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBYps-0004IA-S4
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 09:39:12 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20041.outbound.protection.outlook.com [40.107.2.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a66f6f13-028f-11ed-924f-1f966e50362f;
 Wed, 13 Jul 2022 11:39:11 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7076.eurprd04.prod.outlook.com (2603:10a6:208:19a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Wed, 13 Jul
 2022 09:39:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Wed, 13 Jul 2022
 09:39:10 +0000
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
X-Inumbo-ID: a66f6f13-028f-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4ldEDZqcsAo+P+wo+ABUjZEVbTsFaQcBlkmwp/L0iR8ZZ/jdy5f9CsdDilCSlZBV6OrWSn12fEzUnoZSVoW/GsL5tIWAll4wxO9q7ypcZ3s1vokNl3xqAJRM3kIl1AF1X9r9YM0Mx82H2EsVjEk7HY0fO0TDJMgf1yEf43ehKnx0twuvNgRxHud4iSR70AVmAlxxmqVEhVXKVkhAJezantJb0YmhplqpX6ephRuIWKXaO26B+KeZ+ggqCuFTqPG2MIKRIKJYAwnrMQhb8sRmOshvqAMDyqgzotxZ/twWKiknxoLpAwzWNNXNYKkNClQIXnjfiff726yVdVFeidReA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMXty3YPnN5cNln86v4AQFa7MhRVjtynivzL9avrpPE=;
 b=DjYUff92kvnt9xdctED2WfTTK/kKWpoRziNy4nMkKasecEfx9hYM6wj8hCuj5ZZZHZNF8lacrP6t2Fe8TbNWAI1A5TTq2WwzbgYZG88sia+EbXaLYqSPkyT83R6+ipyP3AHs5sOISMLqs2D56USX7VkvK0zvqg/YFKu13QYsRfUQDp4c36H2d881Vv3M/TahmtKZsIC2ahq1ioDB9AA7QA5Qacnly7Z7JwKIoMMsOIAzXC1APeu1YX7hO4zCPe3M2Dl0WBXjCPebxi0MTLfSJuFnhk+4U6hID4a5sr+tmWlKT4Uymk+Jhgo3zNMbh6ITYmkWgc7uan0/YYAjItYb+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMXty3YPnN5cNln86v4AQFa7MhRVjtynivzL9avrpPE=;
 b=FaTNun/2w53scN0Tf3ZzlMJL7tU9da6ME8Vyo+iEQtLNZRhJheNpm4Ur8N+1Z3V9gt3cY1S+y5g8uHjaJFBdeEFstEoji8PETaBLeaGg0dRYVQv+PJAzpG9GeBFXZ/sGkPXCQEjUk7Q6OONHFUqpfg1uRqCcPs0fnQWlYOs2WrzFCLyBiSqtCWe6nMv5xwJ2WD9Cn9uogTvgUItU7Wd95y9QLGKy3X+N1G/+Du/9pw01IWDJg/dk8y/uWIfgo8jVRw9LVw9KhdlLmc1Ja5PIEcCDNlJ6QBfMSWBRPEwiJPKmxTklaVEGyUdb2pCluqYQYphoCdapC7kep+4jBf3lzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ea93063e-1b18-0d3d-586b-3b1ce048d017@suse.com>
Date: Wed, 13 Jul 2022 11:39:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 4/9] console: support multiple serial console
 simultaneously
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <e40a6de7f032c776e889e4ca6d68579fbb3ad57a.1657121519.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e40a6de7f032c776e889e4ca6d68579fbb3ad57a.1657121519.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48f5fc1b-3c22-44f3-00c3-08da64b389b5
X-MS-TrafficTypeDiagnostic: AM0PR04MB7076:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eVqAKLtn2NhpFe7wf8bEkOYCHrpYTO6PcgI6+VMBoNANnIVjYF211Xjf6b2E7TCtXYivTjJzrprQxsnDkySbu8TKssM6ueliMTeytfEPVr0WC2MHvsLUY1ISdc6ss9fXnU5B1AvtastyBXvpatVRTLVL4mqKWSMGU+SaRKeTdk61LIpmFdJAulJDrAN5NR47+hseRrPLQQEUM7Dl4lPn6oDdZP2DO/eKkDYQ8jm5jeAC7giLySDs+6CHY9o1IlK49pfN73JbjurSuq6+HeTOq2jFnGxeupldHg5inp7ekjQYe8g7DB5z9X9qsU7G9IJjQ5wbmp9Nq97dPKnZ8czLyQcXixvaLjg3ky/crq9HCOFHReetunzXsjkdnVCpwbP+DOYFkiuENlj1+jvYx38fGUboecl4um2eHwrDwfuFOMofERGzzxXOfd7iU8MN9YjhEHOMjm9YtwQQbytJ4j614GjDIwmXwd3EzaayEdFIDYLE48WPu/frZWdap4KZtG4TArhPE/dJkMOSuiDKoFq767ApwtnF/5OdPg0x4mlfDnrdHGTYUbyEt/smpNsdGLYCYMrPclw9brB9BUvbEplehg8YuWUsRV2T48sSXL+M/oNa0lhiHF/DsTbISNpmVS9zGZN/dMbvioYBCWTjpeOSMbejR5duUPb/v+5hCeL5/EmhDy2kOkTFLBfrrSlU5IHdDVCtm2NVZQ4j3Y0KMlzitt+/Ol/E2qmDFBvVMbNQdPrBthW0zWlr59TPIiCFxc0KYTEvsgFHWRC7bTW9TP5uPPSJhNXXlm2770jyyv2zzJv1kdkVyGRIza0oeXwacmNTQgW/FPgrGAIFAzPXiYqOHg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(136003)(396003)(366004)(39860400002)(4326008)(5660300002)(8936002)(2906002)(83380400001)(38100700002)(6486002)(54906003)(478600001)(66476007)(186003)(6916009)(66946007)(6666004)(8676002)(26005)(2616005)(316002)(41300700001)(53546011)(66574015)(6506007)(31686004)(66556008)(86362001)(6512007)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVYzUHE4VTdQdzZlZmlRWU1FTStNM1gyRVZSOU82T1dGNTdnczE1TGU2STRx?=
 =?utf-8?B?TjhFRklOeHlBYWxYNWtucGI4bzA1eURXRW94bXo0VlRkMlNJUlkzRUZvcTI0?=
 =?utf-8?B?UTRWQlFRS3l6WjNtemk4OXZRYjdpYnl2L1BzaExkUEtkRVlSOHp5VTZlTmVG?=
 =?utf-8?B?djhkcDdtSUJtZU55eXBTbGhCUjhnQlRzVE1Gd2c2U3JBSjRtY2lhWE5teC9W?=
 =?utf-8?B?NmZRbCtRNmlna0F0bTgySWhVbkhmTS9wME1ENUNtakdRV3JzRUlKN2Vrd2FH?=
 =?utf-8?B?eWlrOWYxanlSdWhobmxhM0Z2eXRGb0JrSDlIYVQrWm0vbi9hRTRVR0llWHd2?=
 =?utf-8?B?SVpORE5yVE83T0ZBU2xDUUVuWFlmM0FnR0daaFZpZWhVZ2EyZitxc0tjRUlI?=
 =?utf-8?B?ZEFnbGNsTzJoaE14R0NQa3FEVjgrdnNVRC9OMlg3TU1nS2tQQ1NLOVJGZzhm?=
 =?utf-8?B?TnZHdThzcENMN08vYmdIbTcwdkFOS1c4VnE5Um5sRkNpcmI4dnVsVEkyM1Nk?=
 =?utf-8?B?MHdQZkkxclgrellzekFlU2xOWi9CWjhqdlNQWE92cGpHQTVuU0NIVGRVWFcv?=
 =?utf-8?B?cVVQQ2tZNHVZNVRpcGRsbmlueERFdzJ0Vk0rMmlPQm1aNThKb0pxcWZHS1ha?=
 =?utf-8?B?cEtiZmY1L245cnN6VzE3cDViOFBHaU5TMzI3N1h4Y2t3Y3pkSCtIQkJ1QUlv?=
 =?utf-8?B?cHJ1aWI1cTB5UE5wNThobTI0QnRVZmcrcFMrbWtLMTB0SFRaN2RLYlduOFlR?=
 =?utf-8?B?dllBWXVrdktXdkZHdjdYcDRWalIrbUQzWWh2aHVaUDZBSURHQklSZUVVUzBP?=
 =?utf-8?B?Y1VqREdVc0NwWW1waVBRQzFxYkQ0SURzOEt1Vy8ydmRDb2FvLy9hbWU2WFZX?=
 =?utf-8?B?amhBTkpMNTNzTEZ6UEpEREp5bXI5Q2VaQTY0U1RSMW9sYWdocHRocDRhMmhz?=
 =?utf-8?B?bTJoNW15bDhBbnN6V0h3VE0wOVJSU2drYnljcSt3U3lQb0NwZ0hDbTJqRity?=
 =?utf-8?B?b1ZudSt5WnFVV3BLUHN3dFlSY1YzKzE0eFFQYTFkTzY3bkRHc3VHaWJVTG1h?=
 =?utf-8?B?V3lqSkVvQzB0QWVtT2dmZzdiTHJTTFROTnlrWHBoL3lqclNwZHoxK1Y5ZGlk?=
 =?utf-8?B?OUdtR0hCZTdCTllTN09sSWdvWXBrdWtrM3JUcmlpVTBVaERKcllXUDRZMEM0?=
 =?utf-8?B?RlNlVGtXeUlvY2p0OFIrTHNsNUsxemxZelNhdk02b1NleHExNnhCQVBMa3Fk?=
 =?utf-8?B?WnhoenhMTzVYa3Rsa08yZlY0WHdXOG13bnFlc2hGWHpvZmFxaU1rU0VYcE9l?=
 =?utf-8?B?cXptdTI2WFFIaGhmbnQzTmpOcEFGekUvL0VMcFdTYlo5OEc0OG9qSUMrdlly?=
 =?utf-8?B?NWFHQ0pFRWFYVk9VYVZha3VTcjRCTHZqeFU2eis3dXJNVDVxRHMveEY5cVBL?=
 =?utf-8?B?Yk5SSkhlWFhOR3lsZDNhbWRjeTdFblkrWEh0WXpUMWtIQjVpWStrZ042bDZI?=
 =?utf-8?B?dVFZRXgzZnBoem1GMVlWbW8xL1hZbUdBNVlPdXJzbkY4TWNUWHVFQUxEMHBQ?=
 =?utf-8?B?Y3UraHNXMmx2WHRjRFM4NGRIQTlsMUNtQUhZYkt6WnNBdzd1Y2t0dFhxQ1Jn?=
 =?utf-8?B?cHN1R1RhOXpCWHJtMElQNzBnSHk2b0daTCtZVDJQakgyMW5YZVJhTkZveDZX?=
 =?utf-8?B?QTRjV1JwdmV5cGxhVW9hSEdGYkVsQnFQem83Y2thaWZBaHlSTFQyblZRQ3JB?=
 =?utf-8?B?T0o1R1dralZ3WDV3U3RTUzc0aTZMeG1BVmJKWnpEeUVoaTRVaGltUXRUNExT?=
 =?utf-8?B?NWozZkpFTEtOVHhtUUJRc2d5L2YzVTBZRm9VR3I4N2oxdlJYZVFHNSs3cWt6?=
 =?utf-8?B?bTBJOHFaejhBRnVsQWNKT0lMMDUrM3RiNXQ4bTR2U0ltUlZHc2h4RWpad3dz?=
 =?utf-8?B?SUJaaTRReXE0cTBHQkFvWHNRYnZJUFU2dVYxSE13Sm5TY243WE1mbU02dU51?=
 =?utf-8?B?aElTODdzNFpEaEZzY0xGZUVUV1NXeVhrZlZmeENWYVMwSkY5bWlndDIwSXpD?=
 =?utf-8?B?VjhDRjBwbVhTTWZYTWpSamQxVjR0SWNDM3pjcEZXemp2OFBqcHgyT3JDbE9t?=
 =?utf-8?Q?VShzbonR7YMXUTflV4GIVW1If?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f5fc1b-3c22-44f3-00c3-08da64b389b5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 09:39:09.9704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cDCMxPXgeheVSlhrEw+XIMnI1yeHBZBYlGwIELB9nkdhi9j0Lriw+Z6txl4ix7VAMJChO6zUd4iXcfRBtqq0Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7076

On 06.07.2022 17:32, Marek Marczykowski-Górecki wrote:
> Previously only one serial console was supported at the same time. Using
> console=com1,dbgp,vga silently ignored all but last serial console (in
> this case: only dbgp and vga were active).
> 
> Fix this by storing not a single sercon_handle, but an array of them, up
> to MAX_SERCONS entries. The value of MAX_SERCONS (4) is arbitrary,
> inspired by the number of SERHND_IDX values.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
>  xen/drivers/char/console.c | 58 ++++++++++++++++++++++++++++++---------
>  1 file changed, 45 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index f9937c5134c0..44b703296487 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -113,7 +113,9 @@ static char *__read_mostly conring = _conring;
>  static uint32_t __read_mostly conring_size = _CONRING_SIZE;
>  static uint32_t conringc, conringp;
>  
> -static int __read_mostly sercon_handle = -1;
> +#define MAX_SERCONS 4

Might this want to be a Kconfig setting?

> +static int __read_mostly sercon_handle[MAX_SERCONS];
> +static int __read_mostly nr_sercon_handle = 0;

I would have wanted to ask for __ro_after_init here, but Arm still
hasn't enabled support for it.

> @@ -395,9 +397,17 @@ static unsigned int serial_rx_cons, serial_rx_prod;
>  
>  static void (*serial_steal_fn)(const char *, size_t nr) = early_puts;
>  
> +/* Redirect any console output to *fn*, if *handle* is configured as a console. */
>  int console_steal(int handle, void (*fn)(const char *, size_t nr))
>  {
> -    if ( (handle == -1) || (handle != sercon_handle) )
> +    int i;

unsigned int please (also elsewhere).

> +    if ( handle == -1 )
> +        return 0;
> +    for ( i = 0; i < nr_sercon_handle; i++ )
> +        if ( handle == sercon_handle[i] )
> +            break;
> +    if ( nr_sercon_handle && i == nr_sercon_handle )
>          return 0;

No need for the left side of the &&, I think. I guess it's actively
wrong to be there.

>      if ( serial_steal_fn != NULL )

I guess you then also want to make serial_steal_fn an array, and no
longer return constant 1 from the function.

> @@ -977,7 +990,8 @@ void __init console_init_preirq(void)
>              continue;
>          else if ( (sh = serial_parse_handle(p)) >= 0 )
>          {
> -            sercon_handle = sh;
> +            if ( nr_sercon_handle < MAX_SERCONS )
> +                sercon_handle[nr_sercon_handle++] = sh;

else <log a message>

> @@ -1291,7 +1322,8 @@ static int suspend_steal_id;
>  
>  int console_suspend(void)
>  {
> -    suspend_steal_id = console_steal(sercon_handle, suspend_steal_fn);
> +    if ( nr_sercon_handle )
> +        suspend_steal_id = console_steal(sercon_handle[0], suspend_steal_fn);
>      serial_suspend();
>      return 0;
>  }

The commit message gives no explanation why only the first handle
would want/need dealing with here.

One overall remark: Especially with sync_console latency is going to
be yet worse with all output being done sequentially. The help text
for "console=" will want to mention this, up and until this would be
parallelized.

Jan

