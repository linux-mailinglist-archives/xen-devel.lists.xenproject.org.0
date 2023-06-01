Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2AC719539
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 10:17:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542306.845999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4dUr-0001Mb-DM; Thu, 01 Jun 2023 08:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542306.845999; Thu, 01 Jun 2023 08:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4dUr-0001KM-A0; Thu, 01 Jun 2023 08:17:25 +0000
Received: by outflank-mailman (input) for mailman id 542306;
 Thu, 01 Jun 2023 08:17:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mTbf=BV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q4dUp-0001KD-VR
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 08:17:23 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe13::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb73dd43-0054-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 10:17:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8617.eurprd04.prod.outlook.com (2603:10a6:20b:438::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 08:17:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 08:17:19 +0000
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
X-Inumbo-ID: bb73dd43-0054-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XA7rnaxDuf5kGS2BsHvd+bbn38A7zBnMPuoWrx2v1O0qtavLY70wPKrZEag1+IYwZrXEk0zMERgCA7ucp9sIL1Yvlpbggs4z9wjyeiA3TFx6t1wQLzNxbcsfT1ZtXSEUlYtKAKV7DmhGGMsh8Xbbwp4sXjhWnxT9rC+74QcYRILaJ153UzR7bJauaf4sV9JsJzMKilma5ehJm4UI8N6KYs0vOdGx1+Qp4GThTqlwcUcICez70rqUQrhViy1CXqt5VUR4IGpEaHd5I5HSEjfPWPXoBzK6tyLOrGAf5WkO4Eyo/KhawcTOLl9rzSBBRcJupfx5IBbidPc8eZWEScYVAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3Kyp7rMZRaf+USmq0Sv5Sq9wcr/j8YPvT/OYeQFfqI=;
 b=AootqJZaxS0rh+OjltmTj+hpMu5DeQVPstXfCuNrj6KUqQGs/GCI4Ldb9itjemBSklt4GSpOkxC8++2freKjWaduzWvQpnYRtSLfDJ8/aTTuK66nQh43XzkTwHhJsYnOVtNUPAnEMffig8S06ZoZuFs38HxuFzcZ6wc0XN4ZTGTEmyWDzumnXmePiaxmV0peQpv3vIcQt13MqrGQURWZHEk1vx6+TXQ8vbzMF26cBsOlhFB16OgqdSfwhMn6oDxmlftBvPqv86bUmRdK/pS1yuhBQ3/fQNwWoOLPJpoeZQoEuhbuRwA0LxElddCOKHMzIYECqSkWN5uESqUoNkMI7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3Kyp7rMZRaf+USmq0Sv5Sq9wcr/j8YPvT/OYeQFfqI=;
 b=jDTaWQZfNskgDfiqkSCKrGgyQUZSVkvZM/Ro6B+brDuhcnim5n/IRbP8guL4SpJEnx046AgVHsBPwqShCsmQPPNfRFU6tcRLAwgPjRfE9X9OeIsumiH3Z77JJo2G2It6Fe8XO30nwHRj7yxvSlfCb2YK+BcMfs9RcDN4Ntv/L6RSta8UnwA0/aSRPCh5FKqCYz22FXKLEeUMUUm13Flk5k8Tll0NuJ0P+DUD8aHtCBb3+O17sBTg7dV5Rkpr8SFq5HHRBO/JhtIZjYmqr0Q3IiRSYdUdTgl+5yRojFy/rCdFwr4ooIaD9fA6NRSttGufsFd17s4Tx2AER8eMR7xD2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cedfbf50-c68f-a19a-3c89-0206f0d26d93@suse.com>
Date: Thu, 1 Jun 2023 10:17:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1] xentrace: adjust exit code for --help option
Content-Language: en-US
To: Olaf Hering <olaf@aepfle.de>
Cc: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230601080833.32680-1-olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230601080833.32680-1-olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8617:EE_
X-MS-Office365-Filtering-Correlation-Id: f959990c-ba79-4850-08d7-08db62789dcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OtmH780wK3SPo2CBlx4OTtp/x5MyEumnt/LZLcyAv0PH90ZoBGsO/X9PLZ+LztCx6whph3TvVZaaTI8gZhmHR7R8DShKVp/cB/oIwRkWgLChl1IEYXPm4/0ujxot/JPb46gahFe/pmAMyYFCbi+AV+1BM5KSNf46RqTkQWHHayvNTzrbCskJQb9ZQGhziyHJfRYXkLYIsVwo+n507ZF10Qy5XnCtFd/V1wY/xA9BkC7XIC9Qe3n2oGAqTP+a9HJWZlYe4ZIxLRsZLfdKdPZbwJx9ukW2tmb9bU3lCtP4yY4U3BFd5yvbZ3Avvn1ZCL0DOSXKoIZznF/UNIfGDdUENs4U4Knjbx785rKoMzwiRHmZfoZQGANa/pq4MCOa5PJETVdgS4+Ni4OURxYNN2V9hW3burypvTjShIhI1aQv7G09k2JzLGOr3fdq8beY8GbdndYL19OorZcPXBCfKueNC4Wvw8i4KzB82t4HnBinrN3iJ/ccUVgcgJSXIqLNa4+7u2+Yqg0b8aOFeAV1XKEKn+Io9GY5PbXhiDw55whOpqZRxM2Pst2S4c8Pso/30oVQpu5Uf10CCnrrWQl3Hd/1B9YMkZEmEIKAPjIV3CgUWJ+T7SF5ejzOCybkgz6RiEU+Iuen1JqZngrNF8Kowhc22g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(136003)(366004)(39860400002)(376002)(451199021)(316002)(6486002)(41300700001)(31696002)(6512007)(83380400001)(186003)(53546011)(26005)(6506007)(2906002)(38100700002)(86362001)(2616005)(8936002)(36756003)(5660300002)(4326008)(6916009)(66476007)(478600001)(54906003)(31686004)(8676002)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXpIaDBjQi9KMmpUQy9TdFo4ek1LY0lkY2VlaVdmcGJMQjd1MTRsajBjOW5S?=
 =?utf-8?B?Wm5nWHVsZjFtYU9nVXlmbFNBZ25ieS9xWVZISVZleFlhN1REVlpyd3ZHUXVZ?=
 =?utf-8?B?VnlRMGlTejNDVnpHbjRPL3luU1BMc0hEbmlQUEJ1a3ZESHJKUVM0VjJZZmVX?=
 =?utf-8?B?UkdCaW9xenpMcEJuR2NUczl0RXpGbHZRQTZ5dlZYcCtsL1Q1d2dCZEoyOURE?=
 =?utf-8?B?NnlZNGp3Y2ljbVB5T0NzY2tMRzc3UjgzLzZ5cjdZWTEzaXo0OGt2OXZXTW1L?=
 =?utf-8?B?QnZPSzcyTTh6T2l4dnk1eUZ0bHd5VHhqU3phRkFsUHFzUlNTSTJQTVdrNjRn?=
 =?utf-8?B?MUUzMzYyYlQxd2wzYUpVSkd3ZGVyQ1dTNjBTQ28xWjZtaHNiKzF0eGtWTmFD?=
 =?utf-8?B?VmxKOXlGcnQvL3NUYkhYS01NUXg5ZlBodWNJMGtmbFZFWVJLTWFjZXF6a0Ft?=
 =?utf-8?B?cm1nWkhFWnNQY3dyeGV5YnAzZ28vYnJ5STB3bU14d0phbUNxdzAvSCtlTE9Y?=
 =?utf-8?B?RWVObjRKV1FvTkNsdmx1OTdwYUdOakZQL1ZOUlBqOG91SlpOUmZ5cEVPTlJ6?=
 =?utf-8?B?bnRmMnV4S1lEUmJiM3BSa0g2Uy9GRFozRWN4L2pnV21YQU13WnNRTy9QY1p6?=
 =?utf-8?B?eGZTUGQvTURVYlJ4LzlJWkdwL2FOcDVFVlQreGt5M3Iyc1FBZHZITUdWaGlv?=
 =?utf-8?B?U2pnZ1psWjBIQ3NvZm14ZDdLQ3lSMG1lMU1GMVRLWk9Tc2grWHFNdVBOMXdp?=
 =?utf-8?B?Sjhwcytva0V3b1N4QjFyOTZtaU5JcEZzWEtFcURYTFNHM1BGZXVzeXNzbmxR?=
 =?utf-8?B?elJORzJJS08vOEVQallBeUIxczhQZGJPUVdaTjhpMFAxSGtJWnFXNk9CQm9h?=
 =?utf-8?B?WlVCT1lmUDFkSHM1K1JYdk9ZOFd4VkpXSXZrUnI5R29yQjNRYU0zQnVTS3Vz?=
 =?utf-8?B?R0JBbWNjN0NhVnNRNVFldmwwbFZxNHo1ZGR4SXlTTXorUnJmWHpiWFhmSGFE?=
 =?utf-8?B?WjdpaFREWW4vOURJZ2doaE5XeTlubndTUHRPamJKUExFSTVqU1llZGNyTCtz?=
 =?utf-8?B?K0xGcFk2bnFLdmpobG93YTY5eVcrWjRwMGZ1MmwvYVVWcmN5UTNxclV2WkIz?=
 =?utf-8?B?eDJnOUF0VnpkbWxObVVtWTd6L3ZUTEVkY0J0ejE4cFN0clBlSm16bGFjbjVX?=
 =?utf-8?B?cWFGSmdZcWhJc2VEMEZyc3ZmWmZvRng0eC91Z050QXlsVGl2S2JkS01IWjdK?=
 =?utf-8?B?eVhJN2lmaEtiOGtKUFJ6VDVNeGcwRzNWKzNFM2FzZTduelRqbVlidEtMdXUy?=
 =?utf-8?B?OXVqQ0JvLzZtbHlaVnJYakwwWVB4MEhlSkZUUGxHZ2ZHVzAzWW9Nc2lmbzNQ?=
 =?utf-8?B?ZjRCMElGVW1zdkJtK2FqaXNuSTlyWnJ1T2JWZDlXTzlCSzJwQmtHMnZUZUR2?=
 =?utf-8?B?dkZOaHAzNjlrNzhHaDdDVjMrSFoxd0xpeUxVMFJiVk1QMDZTVEZ4KzVCK09h?=
 =?utf-8?B?OHZCc1dSS2E4RnNiQlE1WDhzNVk2MEZLRmt5L3lRNCt0QkowanVKR0RObkZl?=
 =?utf-8?B?akVuWEd3NXd2dTBjeEZudXRvcXd2WUVNTStXbEgrTitJOXJZSE9vVzk4NXpl?=
 =?utf-8?B?ZHlKWnhXaXNyRnJKWmVuQ1JmcC9RYzV5ME04Z3cyZGhUZi9ZVXN4RTk1aEhr?=
 =?utf-8?B?VEtkTXhDUjJ4UXlNdnNXQkkzaFZpYi9CakU5YUcyTmY2SFB4czJJVjdkWGNr?=
 =?utf-8?B?c09qMkFkS0NyZkJvM01ZOFBxOWVTdEVsbk5abWtXL3pWalpSU1ROTWQrenNE?=
 =?utf-8?B?MEFkRm9SajFYSS9QclFjYk0vYVNiMGFCYmJmeWZpL3NJQnZhQ1pSaWt1NUZs?=
 =?utf-8?B?QlhObnB6MU9lS3dUMWRxeGNyZUIrSkk2b3g1T0NYQS9JcUdQbENiejJaQzJ5?=
 =?utf-8?B?MnNXaytLZThSQXMvUE5sNGg5NlE5QkIzK1hCTnhtM1FhS01vTGtlbzkxamgx?=
 =?utf-8?B?cGVWemdwOTNpOW9KV2NORmprMTlYM3NrM1hhQnBmamlLazNjRnE1YXg0ME92?=
 =?utf-8?B?bHN5TGx0RDBJc1ZLdk51UnZvT0wvZnVSMzdkQTY0aUgyaWdRL1cxNlh1MHJw?=
 =?utf-8?Q?fEeIDV4B8lBgmVlRKvJ+nzoYd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f959990c-ba79-4850-08d7-08db62789dcc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 08:17:18.9100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0BSEXBEq86pvV9wMGaSl60VxIKQ+TjXm35N+8bX8I94KM6wsgAi69XJvsP0DA7fqz/N1fU/s6NftX7xhUOEgzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8617

On 01.06.2023 10:08, Olaf Hering wrote:
> Invoking the --help option of any tool should not return with an error,
> if that tool does indeed have a documented and implemented help option.
> 
> Adjust the usage() function to exit with either error or success.
> Handle the existing entry in the option table to call usage accordingly.
> 
> Adjust the getopt value for help. The char '?' is returned for unknown
> options. Returning 'h' instead of '?' makes it allows to handle --help.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Is this any different from the v1 sent on May 26th?

Jan

> --- a/tools/xentrace/xentrace.c
> +++ b/tools/xentrace/xentrace.c
> @@ -807,7 +807,7 @@ static void monitor_tbufs(void)
>  const char *program_version     = "xentrace v1.2";
>  const char *program_bug_address = "<mark.a.williamson@intel.com>";
>  
> -static void usage(void)
> +static void usage(int status)
>  {
>  #define USAGE_STR \
>  "Usage: xentrace [OPTION...] [output file]\n" \
> @@ -854,7 +854,7 @@ static void usage(void)
>      printf(USAGE_STR);
>      printf("\nReport bugs to %s\n", program_bug_address);
>  
> -    exit(EXIT_FAILURE);
> +    exit(status);
>  }
>  
>  /* convert the argument string pointed to by arg to a long int representation,
> @@ -873,7 +873,7 @@ long sargtol(const char *restrict arg, int base)
>      {
>          fprintf(stderr, "Invalid option argument: %s\n", arg);
>          fprintf(stderr, "Error: %s\n\n", strerror(errno));
> -        usage();
> +        usage(EXIT_FAILURE);
>      }
>      else if (endp == arg)
>      {
> @@ -901,7 +901,7 @@ long sargtol(const char *restrict arg, int base)
>  
>  invalid:
>      fprintf(stderr, "Invalid option argument: %s\n\n", arg);
> -    usage();
> +    usage(EXIT_FAILURE);
>      return 0; /* not actually reached */
>  }
>  
> @@ -917,10 +917,10 @@ static long argtol(const char *restrict arg, int base)
>      if (errno != 0) {
>          fprintf(stderr, "Invalid option argument: %s\n", arg);
>          fprintf(stderr, "Error: %s\n\n", strerror(errno));
> -        usage();
> +        usage(EXIT_FAILURE);
>      } else if (endp == arg || *endp != '\0') {
>          fprintf(stderr, "Invalid option argument: %s\n\n", arg);
> -        usage();
> +        usage(EXIT_FAILURE);
>      }
>  
>      return val;
> @@ -1090,7 +1090,7 @@ static void parse_args(int argc, char **argv)
>          { "discard-buffers", no_argument,      0, 'D' },
>          { "dont-disable-tracing", no_argument, 0, 'x' },
>          { "start-disabled", no_argument,       0, 'X' },
> -        { "help",           no_argument,       0, '?' },
> +        { "help",           no_argument,       0, 'h' },
>          { "version",        no_argument,       0, 'V' },
>          { 0, 0, 0, 0 }
>      };
> @@ -1144,8 +1144,12 @@ static void parse_args(int argc, char **argv)
>              opts.memory_buffer = sargtol(optarg, 0);
>              break;
>  
> +        case 'h':
> +            usage(EXIT_SUCCESS);
> +            break;
> +
>          default:
> -            usage();
> +            usage(EXIT_FAILURE);
>          }
>      }
>  
> 


