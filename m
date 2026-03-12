Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACr3KT3jsmmWQgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:01:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 104E8275169
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:01:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252639.1549246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iSs-0005BV-QL; Thu, 12 Mar 2026 16:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252639.1549246; Thu, 12 Mar 2026 16:00:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iSs-00058Y-NG; Thu, 12 Mar 2026 16:00:46 +0000
Received: by outflank-mailman (input) for mailman id 1252639;
 Thu, 12 Mar 2026 16:00:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cgz6=BM=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1w0iSr-00053J-0Z
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 16:00:45 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d0e3503-1e2c-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 17:00:40 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH3PR03MB7460.namprd03.prod.outlook.com (2603:10b6:610:199::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.13; Thu, 12 Mar
 2026 16:00:35 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 16:00:33 +0000
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
X-Inumbo-ID: 9d0e3503-1e2c-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKst5KfYt5jwl8NuT8Xrz68IsARmIqdD8XvAnVWss+vfgMYBGlztG9zFs9727i1KbGtspH+N4Dk+P51v5wmcJQVSBJdARkfQ6ujwchGz5YhR6o1wjR6e++VTfPT4O4EPsis2nfZZ9XOyJoWwJb2zQbqtlHf/8YG5i/QgrAPG2123LgvZdXAqtcj/L3HZt0K+AkcS+TyqBqGDjedDhyMqtebrBMhc5aYNpxawmkAlOP9yLg7lYAQA963jpxbnw61BgdZYXwiXUrxIvDDQ9K/ivrQvLhVW7AbZ/rTaXcYP7bMr3ZRrpNg7SuCsqT5Xa2r9ET1conAl+UEuHYJTJwnqww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tt+qVBv15qMf88SL/5sDZ1jpbbnkCfDyWx7rgW2Gw4M=;
 b=KRyn4UWD0yG3pOTVIiUq8NWBW5yynk8GzarfwmP1elnO519fYi/r9Fk1UenW+IJTDbY0TAMrU+cmsecLp6lmZE6fzvrpEHLgPPZN9e8EEKosn87aWUAzxf8InjqnlTi6MKJt05IytzTO8gjqxP1qCKDZ1WjeFqmodf+JUeDaciukMFjSGXTTKZIWEeyhxwGLDEwFGuji7563sJPVHzLcuBkqffKdLHL0iEPDCDzslwMGZoni74NmgeYgwqkM4ykYh0fcCfh+Uq6OwDBrbEZGfBn+ZZa7Pns1uMj4rHsTCXkJG3ijVg8vJKUv+WjzKBtst725U6rG2yjIAdIg3H+ZqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tt+qVBv15qMf88SL/5sDZ1jpbbnkCfDyWx7rgW2Gw4M=;
 b=mS6J/hQbRHrj4xDkRUEzccNZnCGNgouZHY4WaBNonStOJy4yCUDdVqL5+ng8YLV2uAr78g06sLUz10c8j6i8kZ4LcPyY7dNI9ltw2lRmTqsoU38ipsDHG5A32RSz/xzWp6dZctlh00e4HDsZUDd+u5HOtb24+7+JJXcmzBqcf0w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6afc5c69-230c-460d-980e-2673434e6b4a@citrix.com>
Date: Thu, 12 Mar 2026 16:00:31 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v2 6/8] tools/xs-clients: don't exit with error when using
 -h parameter
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20260312155102.2862824-1-jgross@suse.com>
 <20260312155102.2862824-7-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260312155102.2862824-7-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0531.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH3PR03MB7460:EE_
X-MS-Office365-Filtering-Correlation-Id: 2903432f-2f8f-44a5-6eb7-08de80507e12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	nCsigT/FWzJ06eEth10MvTffiZf4mgNHgWABvPbemlInn3SG5EMzV3HOQvKl5pgwsq+96WDxZEpW5lo70q1AbpAhnXebusOh/ttDprVh6FNPCYAIMunBWsPpKo509hC7C6l33nDOoSRSy1tuVrF45AbPlkqgpkLxmMiT4ARwJyjqmiSfHP6zstejDlF6dRDFJe0RMmKX9pPdfR1zX1Ls3M2AwksYurChluZ+eZa2gZvIkjCzWkLeW2PEOtZbx0qQgC9K8y5tr+a2mVgZi6zWQPp/7bb3E2NqXZi1MXHg6FW/Hfez/UICQ0TuqNLThQ9fImRwJxJRopaCyDCBiQ3V7Ru6BzbaLj93hQZ3/UdQicnYBFj/5U1JNfEQ1109CEOrdlkt2WaJwhQdcDdg96+EcPZe/Xx8/7P4xaerz0RIlXYfyQhSC3JQSAO42niUiBjmzYiitv0jUvpq5dRUKHEb9wqS3uDcMczDWZMFiScMP6u2/3iT8RCpU5C5i1INHu6DrTBo4GjRsxkPrmtvjW3i3nImgwj1cZPAJeXHQUVJaHkDrKNuuPpSRz8PUTi07Z0Qv71sprxrJcCNlnLOXiP5oLHPiQ75NN/2foXaTQmFIiHieRR0xLKU1ShdG+3iLfrR7YVPiI5eH3dC8H8nAe5CYornYgWx6lCkPx98zjr8BiD0KPbPBptiPY18oJ7jsOk5ap8ijNWqUnyO3CjHmsOlr0uBykAktoYCOPSdAORHL9Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlZndGlsWHBBWmJEUWVCSk9EdDFYd0dTUldTTlVranQwaVU5dVZoRE1KV1Jh?=
 =?utf-8?B?bE9hNVpnWVJGYnhMWjh2YS82QWdxMDZjYjBVVWlPV2JJRHBtdlEydzlSTEl6?=
 =?utf-8?B?K2pIazJmMXd2MVI0a25MZzQrWjdtSzVuS1ZXeGx2TU5oWk5HY29HQnBHL2E0?=
 =?utf-8?B?YmRYc0JJRjYwSFBPSnVxbVhsdFRqUWdCczBuekptN21ibjNSZDhCaXBvM1RH?=
 =?utf-8?B?cDRkWnZPeE1lWERxTEh1V2h6QUR6NjliZDh5NDlnNXczRkRGd1IwZVp5SDBv?=
 =?utf-8?B?Y3lSQzdnaDlGSFJzNGJKQTJEME5Ecy9oVkY3RWpyejFyZmNlUFdZbjFuYkk3?=
 =?utf-8?B?TEptc1RmVHViSndJWTNscHZBNHcxcHJRWVpNUTBHL3BTSTFJVkZiYWg5T1pC?=
 =?utf-8?B?eTRmSVhGcUprNE1RUjRaYTJ5dkM3NWd6OGJ2bnpMLzc1clZlTXgzcE0rZFJK?=
 =?utf-8?B?K2hWNmwvSjN4MWVuTWZTMHIybkdPTGtZMWdhRHJpMVNMc2JselBySkFLNUNk?=
 =?utf-8?B?Mzk4OE5Wck8veUlJMkhwbElReWhMVUVDeGI5V1dIVUJLQ3JUSnczZTJ4bzNE?=
 =?utf-8?B?dm13bW92TDBXSGVXQU5IRFdscVo2K2p4TGp2M1ExbkNKeTlyWXFZTmNtR3RT?=
 =?utf-8?B?SEkxbVE1dG1YVCtDMDBWS3dBYzFidmxRaGExMmZvN24yeXRjQ0VmRzFreDB0?=
 =?utf-8?B?aUx6ZU1qV21pK0p4KytESVhQNXlRMlB6TjVhWG8yQjN6cnZIeUZBYmZtbElO?=
 =?utf-8?B?VjhtbENsTkY3T25VeTYxclF0M0lsbWFmdTI3SXRJdmdHaHR5S28yMlRhdDFh?=
 =?utf-8?B?dVNmSGx0ZGFLZkRPSVV6bk5PeG5MWHhnMU1SSGlpa2Q0ZVJBc2pycUhkYnVK?=
 =?utf-8?B?NVlSYUJMNWZ3VS9VcS9JWWt2V09nUGNFZ1h5SUlJaVFnSHVSd0Y0c0V6OHZ3?=
 =?utf-8?B?TDNxNUMxOVBEWExyZkltdFlaWmJyck9FWmdRYnpMU09IUk85Y0NCVkExZUUz?=
 =?utf-8?B?TFJ2SGdQQXY3c3FKWnc0Zk9TeXhuZkJnUjFzRjMvL3pwSmVkY1Q2R0V3VWdn?=
 =?utf-8?B?Z21mZEx4aDc0bWZqbzN4UWo0MFVZRnhTL08rNTRGVnJLSTZ2Um4yT05mNDdT?=
 =?utf-8?B?SjlNaVg2UzdiS0tveFFjbnFSaXdBd1F4UUdOQVByR2EyVlM2NGMzQlp5ZTha?=
 =?utf-8?B?dEVtaFFYVHUvdm1EajBROWVNajFpSmlvT1MrS2RKSEtUbGk1aFdGd3A4RHZL?=
 =?utf-8?B?cnFXM1dqRmZibzZmRTNFQnR6d0tPdE1jajRvelEybzJUQmdhY3llM0NlSDND?=
 =?utf-8?B?TEpvTlJGUEd4d2ZHMHJSdnppQUtXZ1c3bWo2Q3VSWm5QQXhBRkZrNk1SRW9Q?=
 =?utf-8?B?MlFFd2lxV2s4SVBQTXhaeTRsTHNHakVGTTVWMkFJUWgzc0UvNXIxYzdKK21t?=
 =?utf-8?B?ck1JYTJvRWtwVHA4YjdQbnpUVURRUDlwUWlwSkVyaks3MWlSTksySGFGa01M?=
 =?utf-8?B?NkVmb3lEbnpwWlRYRFBuV2NFRG81cFEvNmpjZUFaZWIrZUc2VXJTcmpFakNO?=
 =?utf-8?B?K3YxbDJZcWJkSDdFZ0hSTTRicit3VS94dklyaGhFekZ1ek9hMU4xWm9Zb3h4?=
 =?utf-8?B?b0tqSkNMZEpkUFFxTzFmWVRKeUdtR1hwamNKMWt4Q3gwMFREbkJxUXhDYUdo?=
 =?utf-8?B?clljZ05VOEZ4Nkl4QzRPcENnNlUrMS82citOTnVxZVpva1YxdnN4K052bnVn?=
 =?utf-8?B?SHFBTVEyelRRbml4aHZ0TzI4QmYramRPTC93ckF0RUxrWDl0TncveGpvN1B3?=
 =?utf-8?B?NDlNNEpyOUdLZGhtS0JvcE5nTCtYZUhEWGpJcUZsL2d5N21meC9XM1BPd3ZR?=
 =?utf-8?B?QjdZOVlPNThNUjZkRGtVRk51NVJZa1RURFNtcG5VMnU3clVwaDF6VmtlZTJO?=
 =?utf-8?B?UDdPUzNMM3o5ejFacGtFSWZTb0ZOQVpRd1doUi9ld1FvMTByalIvdUhTSExL?=
 =?utf-8?B?bklFWThzNFlYRGRERkg5TzJHTUJCeC9MVmxkSjNROEdmQlJlQ3JUN2RMUTRY?=
 =?utf-8?B?d0pGME4xMGp1SWZIZW5qRDRSTWNUMURTWW11R1BDNTJ2TzF0NFo5V093QTJD?=
 =?utf-8?B?Q3BaL3RDT3J2ZHcvNkZnNml2ejJMUjRBZERueGRBNlRvalFWZS9XcDZ3TC9i?=
 =?utf-8?B?T01Tby9TbGlkUXFwMVpjZVN3L3pUZGpMcTZGME4rUkVUbVljNG96dEcyTXdx?=
 =?utf-8?B?OVUzUWdHSXltS0NzOWcrN21KcUhmWkE2NXY1eE12d2hJT2VZWTlqQXgvS0ow?=
 =?utf-8?B?V3c2SVlVQmlFK0dQSUIwNnNxUitiWTU5cUhzL09Odncwc0R6N05zdjByWkk4?=
 =?utf-8?Q?FOBd3cHFrBCUbtsw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2903432f-2f8f-44a5-6eb7-08de80507e12
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 16:00:33.5731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 85d3a2pSAo3x1vPQUtoRExFqajwodNm/iv8c4FHLTeojLlnNCgGxULe4iYgknhaM3MPjOWTZ6da4EvEHcxkIp5I7IOSappg8BYPo8sMxoRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7460
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 104E8275169
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12/03/2026 3:51 pm, Juergen Gross wrote:
> diff --git a/tools/xs-clients/xenstore_client.c b/tools/xs-clients/xenstore_client.c
> index a104cf6487..1794451d43 100644
> --- a/tools/xs-clients/xenstore_client.c
> +++ b/tools/xs-clients/xenstore_client.c
> @@ -214,37 +214,37 @@ output_raw(const char *data, int len)
>  }
>  
>  static void
> -usage(enum mode mode, int incl_mode, const char *progname)
> +usage(int eval, enum mode mode, int incl_mode, const char *progname)
>  {
>      const char *mstr = NULL;
>  
>      switch (mode) {
>      case MODE_unknown:
> -	errx(1, "Usage: %s <mode> [-h] [...]", progname);
> +	errx(eval, "Usage: %s <mode> [-h] [...]", progname);
>      case MODE_read:
>  	mstr = incl_mode ? "read " : "";
> -	errx(1, "Usage: %s %s[-h] [-p] [-R] key [...]", progname, mstr);
> +	errx(eval, "Usage: %s %s[-h] [-p] [-R] key [...]", progname, mstr);
>      case MODE_write:
>  	mstr = incl_mode ? "write " : "";
> -	errx(1, "Usage: %s %s[-h] [-R] key value [...]", progname, mstr);
> +	errx(eval, "Usage: %s %s[-h] [-R] key value [...]", progname, mstr);
>      case MODE_rm:
>  	mstr = incl_mode ? "rm " : "";
> -	errx(1, "Usage: %s %s[-h] [-t] key [...]", progname, mstr);
> +	errx(eval, "Usage: %s %s[-h] [-t] key [...]", progname, mstr);
>      case MODE_exists:
>  	mstr = incl_mode ? "exists " : "";
>  	/* fallthrough */
>      case MODE_list:
>  	mstr = mstr ? : incl_mode ? "list " : "";
> -	errx(1, "Usage: %s %s[-h] [-p] key [...]", progname, mstr);
> +	errx(eval, "Usage: %s %s[-h] [-p] key [...]", progname, mstr);
>      case MODE_ls:
>  	mstr = mstr ? : incl_mode ? "ls " : "";
> -	errx(1, "Usage: %s %s[-h] [-f] [-p] [path]", progname, mstr);
> +	errx(eval, "Usage: %s %s[-h] [-f] [-p] [path]", progname, mstr);
>      case MODE_chmod:
>  	mstr = incl_mode ? "chmod " : "";
> -	errx(1, "Usage: %s %s[-h] [-u] [-r] key <mode [modes...]>", progname, mstr);
> +	errx(eval, "Usage: %s %s[-h] [-u] [-r] key <mode [modes...]>", progname, mstr);
>      case MODE_watch:
>  	mstr = incl_mode ? "watch " : "";
> -	errx(1, "Usage: %s %s[-h] [-n NR] key", progname, mstr);
> +	errx(eval, "Usage: %s %s[-h] [-n NR] key", progname, mstr);
>      }
>  }

I'd not even spotted this, but I agree it wants fixing.  Could I
possibly talk you into naming the parameter err_val, seeing as eval
commonly means something very different.

~Andrew

