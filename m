Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 421977D8F3C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 09:08:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624226.972598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwGwx-0008Hl-ET; Fri, 27 Oct 2023 07:08:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624226.972598; Fri, 27 Oct 2023 07:08:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwGwx-0008EZ-BK; Fri, 27 Oct 2023 07:08:07 +0000
Received: by outflank-mailman (input) for mailman id 624226;
 Fri, 27 Oct 2023 07:08:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eU9S=GJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qwGww-0008ET-IZ
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 07:08:06 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe12::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92ab64bf-7497-11ee-98d6-6d05b1d4d9a1;
 Fri, 27 Oct 2023 09:08:04 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6939.eurprd04.prod.outlook.com (2603:10a6:10:11d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Fri, 27 Oct
 2023 07:08:02 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Fri, 27 Oct 2023
 07:08:02 +0000
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
X-Inumbo-ID: 92ab64bf-7497-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWE1LiBjiFQknUYec/q3YJOyGKFXZyWvblIZbrJJ6WHWmyo3+lN3NMQmIGcgoQQwszVU8HrX4/ToI2rvfSUFsnEK8jVI+Q0tl6ptM8l9s0qGtBBpvVKlsLSIVkwwPVR+C3sa5WLYWbewo2tk7Ljy9i/UjQvY2kLruxo3IiYGHpIlxLBcScWXwOOrpRs/qZzeiDuQF9R9dN43PhEK9QRTKLz/SnmuqZwACqR/wxezMQQj9iNHftANpwjPM6AVgKMAPvEApcibxkkMIULvCRlVvG5XuHgWpp/mIFWXBJKcpMuVSKGKGL6pxd6eKjmgyTFbNPwNet+ZaQq9tCqg2xasGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ia8vcCymjpiYknAAqLNayVWtaXeHdJ9Y36tiSByw/WA=;
 b=R05KhGIDWGllk4QSkI1uvyiUHC325EcTIdsrJHZc5VRbYKwSKsV/5xkZlr93jDGTEy79n/Lh3hi2uUw2pWaa0Pix0gkTZCtKa0tX1vQMyMCo4OH+T/VT1Xrt5IDD/15ERIPw6VkOZmvtNU7K5PomTnD9DuazQYtCoi0MsMMLgfdvRGXAS3J4orP9LFeHOFg9ee5xDOVQna9HFn6w/QKwrdXTxlE4NryvtPQ6fIMnuEtjeq/NJI4k7G107ghprXOXKBUKA9akwu6MNKENvvkXV7DqiFyFz3opeVR9fXNtylIuy0XXKlbs+La48OaG5LAqfSBEqcp3x/bpqRHyPGFbfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ia8vcCymjpiYknAAqLNayVWtaXeHdJ9Y36tiSByw/WA=;
 b=E5CSy14JgCWgBCgsqWko30cPv9c0YVN3uYAR+5SH5qoD6POOd5ZlgCZy7uBROJxU+JAq7q80YPD1VjHVxb8x8aWQ5AX3RGQELmV1YyPc6hKm7xBXW0O66CYaAGGY/YOFj+sGn95jTOYfyGEpomK2MlPQ15dLMPeR1qTPQq44Oh4WNXkP+4XgMlX6yUdvS+5PfoY7E6h1Y3elF168Jk01hdWv1oLqnpoLuE+EoeC5J3qa6JDDZC/rGvwWkLIpokgoh6FUkH8WPoJchW5cgdqQErmF5nYnYIjyHacJ5tEVeR6wP4Xc/X6XtGzB3ylwZnmqAhyUmQAFRo6F8VuSgvZyPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1795ba80-803a-7ed0-73fa-7d6e06691bad@suse.com>
Date: Fri, 27 Oct 2023 09:07:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH] xen/set_{c,p}x_pminfo: address violations od MISRA
 C:2012 Rule 8.3
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>
References: <88499ca9a61b59d13d90f6c5f77cbb2e124d850e.1698322083.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2310261559470.271731@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310261559470.271731@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6939:EE_
X-MS-Office365-Filtering-Correlation-Id: caf94a71-dcd3-4581-1c1a-08dbd6bb7573
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GG50kq7JnsWGHjoLo3CvWdzrIsmYMRWFlPJz1z6dZeT/JNX3lW/LT+f3CjkBFi7LL5BCI+X5yv46tw5HyxDCqtwNqYIAl2rNz4Yrm4PuQvLRFEVC7zmLRZhVpaMpxZNafGaNKKjqaVBtjSHgTRahGeX9Hdvg0E8O4Eaa34E0VFZdSsie9Jt+w+lGAe9f1LAyReQwqvhz8oiWQdmpqElQMn2T0NGO8HYKpt4vae5yUHSTdeK/EPkzIZhTbXX3pdTvv86x6qoIItXnPV/Pl3fNi40skYC3W1LgkQOSjrwkfCd1MgYmJPTuWjx0jGX5AAjnz6aNEB0bN5qdvBDMoun46G4737vvMsEe86oO1q02IG/MxUPG3/rcoL1NuK9rqxhDd3wwhlabhOykBw3kzoyCwfEPOZkYVOOzC/QHRk/CCBvfq7QeZWIr/3pLQR6Gt7QFdNoPuyGwuEo2XqU1QLb+2eBk4cu+bFCKRqP33ylbJkxifLnNWMswQquJ0YLzLUy/MwOqAquHCZw7iQskYZKMthLHYdAGY0TPdWWtCMkAapnTfTtNJ8gX5r/Otv/geLomP2EAMXFIzkqWKFMgX3gmwkD7iDIa1kOQrwwzA3f75+EgrhTcWwJapnT0m5NdLcR9sUMDPQB1WLAcwG7snYXz3g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(346002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(86362001)(31686004)(6666004)(8676002)(2906002)(41300700001)(38100700002)(6506007)(26005)(83380400001)(53546011)(2616005)(5660300002)(6512007)(31696002)(4326008)(54906003)(36756003)(66476007)(478600001)(110136005)(316002)(6486002)(8936002)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVBiZzM2c01Qb1pmNnExN0lpYlpLRk5LS25EcDIxSnczbkh5ZFpHRTFCVmhr?=
 =?utf-8?B?YVBWSThFNThCbHphZlh1aWJsNUhCQlpwRjBQM01kZkFUanlSdHFtb2ZkSXdK?=
 =?utf-8?B?V011czFsSTd1Nkxnbng3SVR5MTJBVVNWN2ZZT0FCOEFuL3E4WjNicDRybTN5?=
 =?utf-8?B?R2xia2VxZjNYZmFnL0tzVFBrVmJVeHROb1JuWjUwanhsSTFOMmw5ODFwSHEw?=
 =?utf-8?B?dFoxalMxWm9lYlpJamdXWmszQ1FzSU53b3k3ZTRlZktmVDVHbGpPV2QwQTln?=
 =?utf-8?B?ekZUQkZZazV5dE9EbGJoeHBVcDZ0WVE1UUprSU5USlZYOGpjVk1VdU5hbGRY?=
 =?utf-8?B?TTVOVWRMa2gwa2JNU0lNbGt1blBubTNrNE5TWVcrNUlhdUY1S3lWWXQwT0Jn?=
 =?utf-8?B?cVVOblJVbWZtMS9xY3ZURnlGOURsTHFtUUtDQS9ZYWhCclNCMXNBS2cySVRl?=
 =?utf-8?B?LzZSWk0yVnlaVW9Yb2hIcDhUaE1pTFY0enpNVjZ5NDNXL0w4cUtCVExKZENB?=
 =?utf-8?B?N0lsRFJOS056RzM4eWlNNmtrM1NzcnJtdWMzVjdYYnJKK3FodUs5bzliWDBV?=
 =?utf-8?B?b1dXZitLTE50clRFNnpTTDZSaHRXQ3ZJa1dRcmZ0WjM3Z3I4NnA2MkVCbHdW?=
 =?utf-8?B?MXBBSHBHVi9YaldmbnFBN3hjSy9XalRFUDJvOVppVjNPNXNrYkg0Tzh1ZVB0?=
 =?utf-8?B?eHNFYUt5YTRNc25oejFZMnI0OFRzaGwzcHp0cXl4TThBdHRyRnBwT3hzbVpD?=
 =?utf-8?B?OGdQeU1tQWUyVHphb05SUWdDTmZ6U0Z5NHBqd2ZGQUZ0aG1kK0tKOUhsL3M2?=
 =?utf-8?B?STFZY1hvUklQUlZ0Qy9lMkRqZ0lEY1FuY2c5THJhcjNycUo5cFpFSEJpZXQ5?=
 =?utf-8?B?aFJBcXFmbjV0Y2k4TkxqM3U1THdUNC9HRk9MZDM2WVUvMmpXNWI0S1Q0L1FX?=
 =?utf-8?B?REZkdnUvY3BzUVdDWW5LYXpnQ29TZWZGcUNqUjNpYzZQeWh6aHViNkVUTGNZ?=
 =?utf-8?B?Z2srMEhDcGZoQk5obDFwQVlRS250SnNadEpoenlIVzg5VXR6TDFXakRGd1U0?=
 =?utf-8?B?SmtCOHBieFVjYlBkaXpqa3VpVnNlVk5RZ0tERTVYNWJNcXl6TU15STF0Smxl?=
 =?utf-8?B?QS9rMjl3NWR1TVdhVng3b2JScmlWSzN6UllkUzVpOTBwRlJqZGxDRFpvK0Fa?=
 =?utf-8?B?eTB1OUh3anhPVS9UUDNWMXVqMmJrNVlhZjVKclR1d1pvTkFLR3EwNlV4c21U?=
 =?utf-8?B?bm05QXZOMlhEYWFzMS9TR05tMHh6QnVIWlhDMkdwQ0x0MzRicG9xOHhEWTU0?=
 =?utf-8?B?QWNIVE1mQTBuM0VMbHVnNGpUQ2FLU2lLY0Q0UFNJNy83Wk1lTVF3UE11UFY5?=
 =?utf-8?B?V0ZsT25VcHVEVUtvMUkxZVcyT3V1YjF4SHJtQTVXZDN2YzNDWmF6NURwbVJW?=
 =?utf-8?B?NXM4dEx5VEZEN0lEc1Y1ZnNOMXpvWU9jNHZhZXJMaU4rOVZ3VnBydDdacEMr?=
 =?utf-8?B?TnF5Tjh6ZmFJdFhhSWlCcmVGeVJHMDVkUkwyUXM4MGo3bGpxS2JvT2c4dk1j?=
 =?utf-8?B?TnlyRStacFptbG5jTzVKVWhWaTRFQTRqWWVkQ1JhK0U1cmpBNmdjNDQ0RTAv?=
 =?utf-8?B?TmZpMmJodmlJZWhYand3S2hIaVNPYmJLUWVsekx1VHBvVDg0aDVydkpJY00x?=
 =?utf-8?B?aVhkOEp1S2pxYVkzdjZBNjVmdktTNzEvMm8yYzhjdDVpWDVOcE9CSUV5M3Vh?=
 =?utf-8?B?YjNhTWhwQUFlWEZ0TFlybTJzdGlTWFBNQ1kzaks0a0g1Q0dSd3lSUnVXYy9r?=
 =?utf-8?B?UFdVR3J3c2RLNmxRZGFzSHNwQ1k2eTlHYWszQzRrSi91SnNzSVJFSzZKcWlw?=
 =?utf-8?B?NiszdEhCcVIxY0cwUXRFeXY3ZzN4bEFybEFLVi9OYk1FMTB0ZUhwcmNhcHdq?=
 =?utf-8?B?eFVoRTAvcHRwcjk1YXIxRnVYZ0Q0L1V2dHUxcytubmo1WUkxVW9mN3VxZER0?=
 =?utf-8?B?bGxyN0dBcFBQVVJqR3h3aEJ4ODhRTVVTSWNWNE5mc3dqRWJJNUM0eG9JMmo4?=
 =?utf-8?B?emxqVVZFczc4d3BSb0tlL3oxUWlvQWFrMUtMazZLZGVoaTEvQVFLZTBQblEr?=
 =?utf-8?Q?AOujjWIeb5IHgsRoILO2VaCYn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caf94a71-dcd3-4581-1c1a-08dbd6bb7573
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 07:08:02.2027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rLCkOLUjryhjnR2hNlrcSD2Z84BdhEwt2T3cqP2k3gFHgHY5aCCR+XRbZx2G2qPiNA76QM9XHvnzOhx7y58UNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6939

On 27.10.2023 01:00, Stefano Stabellini wrote:
> On Thu, 26 Oct 2023, Federico Serafini wrote:
>> @@ -675,16 +673,16 @@ static int __init cpufreq_cmdline_parse(const char *s, const char *e)
>>  static int cf_check cpu_callback(
>>      struct notifier_block *nfb, unsigned long action, void *hcpu)
>>  {
>> -    unsigned int cpu = (unsigned long)hcpu;
>> +    unsigned int acpi_id = (unsigned long)hcpu;
>>  
>>      switch ( action )
>>      {
>>      case CPU_DOWN_FAILED:
>>      case CPU_ONLINE:
>> -        (void)cpufreq_add_cpu(cpu);
>> +        (void)cpufreq_add_cpu(acpi_id);
>>          break;
>>      case CPU_DOWN_PREPARE:
>> -        (void)cpufreq_del_cpu(cpu);
>> +        (void)cpufreq_del_cpu(acpi_id);
>>          break;
>>      default:
>>          break;
> 
> I take you made these changes to cpu_callback for consistency, not
> because they are required? Everything else makes sense so:

I'm sorry, but no, these changes are not only not required, they're
outright wrong. CPU callbacks never talk in terms of ACPI IDs. The
two functions called also aren't otherwise altered in this patch,
and both take "unsigned int cpu".

Jan

> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


