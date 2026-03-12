Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFYZHrzismmWQgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 16:58:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D595F2750CC
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 16:58:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252622.1549237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iQf-00032h-CK; Thu, 12 Mar 2026 15:58:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252622.1549237; Thu, 12 Mar 2026 15:58:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iQf-0002z2-8u; Thu, 12 Mar 2026 15:58:29 +0000
Received: by outflank-mailman (input) for mailman id 1252622;
 Thu, 12 Mar 2026 15:58:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cgz6=BM=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1w0iQe-0002yw-4U
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 15:58:28 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4dab9022-1e2c-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 16:58:27 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV8PR03MB8138.namprd03.prod.outlook.com (2603:10b6:408:296::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 15:58:21 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 15:58:21 +0000
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
X-Inumbo-ID: 4dab9022-1e2c-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nU872e6YYWED9TeegPUm6RfZEhBDAnRO4mNxQqiM61S6c2gdR5m5BQ2alQ0eCKSFrF9HHgZjwmzTB32MEiD/MPzDeCnVYllIOUt5HeQUlMEoXsqf2pfGfFqdvVzrJC5hpFVlk9/fNM6m49VcthfFugkvfZExsrgeQ/sPCc5beyXJxovloA1nsI9U2JnJ7WHi/MRlMLK5mPa3LQmgLdVdueo6TvdpbqKNG0WViLdVP0L+lIba0W1oVGcYzFpB+9B8ZHqYFt4CHY225tguWOPR7BhLnBBbJJssdg7gJF8E/OPV2DWXZjU6wC77ny/V8i/2pw72h0ppKO20ttyU+ARWtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZbWXyvBuykD8oq86koLhFGcDhNU9YbXOw0H9aSp3RM=;
 b=dv7m/gwir0JnOSfFGMKDx4qExVagEA6i4Tm5ezznRWreMqA5lXxzOHFXU5zQbt5rzTQXatkCvxAJ0Wl71EEhVjwsVgEE238Z0bBjONW1UW2XIfkuOv+NjSfyo9DzHtehaFRVCk9B1bxyHJeFr/YU3G1rrPjX7YcHnlfKALRkYTN9n6rgNTi6pS/zFGLNq8Q+D1ecSHT/p5t78U/gZuS0YALUtiLDiCahQvwJmKN1JJ95UFHWLqUDKDNvqc+sKKEoyWbwzS8ltDnt10QKcIkCuq01F0F/SWX6mH5yGlA0UL1tyK514zgwcLXLjcrDXlto4hcpOOe2vF7ukMabkvXfyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZbWXyvBuykD8oq86koLhFGcDhNU9YbXOw0H9aSp3RM=;
 b=cB4yluGewPNNdYnzsYqPIJw1CVBgBd1qH9DAXtrxNrJX+NBFuXLzYxOrdNesPWjwST9tqhSsKV1ycHWjm90wuG4qaIDUNYG76SvwjfI4ggzxn1WDDG16aqBUm9DS6vx2y9JeBxTc9oyvvBdBkWhlDCJIEjBiqfLXlG7xwowkwVI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3aabdda1-7153-4be2-ba78-57b290fda509@citrix.com>
Date: Thu, 12 Mar 2026 15:58:18 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v2 4/8] docs: add man page for xenstore-rm
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20260312155102.2862824-1-jgross@suse.com>
 <20260312155102.2862824-5-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260312155102.2862824-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3PR09CA0003.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV8PR03MB8138:EE_
X-MS-Office365-Filtering-Correlation-Id: abbb2570-22da-4205-e472-08de80502f5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jKG/uWrU2G4XIE3z5cNtXbyyiwnpa9Mo7YyhggmI3wYiCtuVgD9eMHpWteATRAfOiI4poJiujK1nqj/vmF4+smR+PlrDpl9P3RQAlm9h7g3RfiQWPXGlD7H+XjT7YpS3WWQcqpmv4LCDvqQgRPSFmfMvxfWuXa/bdW03xaG/1YEGdbnvmUFjLG6XyEtFq0M8ON7QybWuTDCcltZnjI+qPxVg2TrBFxLd67licf+1ulovsb+DeQ1FWqMnrhyA2S8XO0yhKashqnZuu8H3ACZG6XJP9U8K6Yi5sd08NLLPaVBvf7IthP8ns9wjaeSA9Q4lq32dB5kJcKxU1Xo0oACH9I2S75jrsZISaznLuZ2wQQHvW4NbW6r9i2Cl5lLuYDPm7LLL1DFMAuEaIfn1nab9gs5KyHS1z04CuAL97F1n3UNwNxZSZ8PdJJceOZfNKqFoSkF7EGbHabvnTMn+2YsOueuhK8PfbYEyIWYsgqorX4ZsHxB2ZXQv2GclTTkZCcOgiJnb4/pz/l7dy0Iu10qWOCsPyYnL/kyuXWnHrGcI5JeL8JJj9LuevvBjrYu8PAAy5erxtETGdrOgEUS/kDjSgixSqAZk2qowu+wVC9NUWFMpfh3YO8O6L2ub5G7fQFRFhIp/9Coq+8EBAz6yGQfG7Bkn4ly4blC6xUTGeWk/G7k3Y0bJMx0JsWu1kz7unYRqn4F6YOWOJnrNXmkwNY5j8gDIn3puoPO/lPzCSLOnqGA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFN5dkNtaVcvUGVFWDgzZTdObTZETTR2ZkdRK3pKOCs2VzV6WmtxTFJKc0tG?=
 =?utf-8?B?dW9IMi83R1V0TlBFQkFrZkIwdHhLTUh3Z1F4bDBZZUhBUkxNTE8vOXo5QWRt?=
 =?utf-8?B?WDQvTlpaNnRheHkxQVp0NnNYWitiUXl1R3VibjFWVVdaSndLbWZlSitXZ0Rx?=
 =?utf-8?B?SDVZaWRmTWdyaTd3d1JnTlhIdjdkWFhDN0xJS3JUNmswNjBIaHNMeVhVTUUx?=
 =?utf-8?B?UjhwOW1aSGY4eVZtT01ET0dJY213ZWdudXJGaVB3bEd0NklFYzVnYWZFdmlF?=
 =?utf-8?B?SCtmKysrZFAvNDB3ZGdqVDBQNTdxNVpZMi92NE1KU1dpa29jOG5PU1dwYWM3?=
 =?utf-8?B?cVBzWGp3ZElZM3gwZmh3S2Q4WlFMMDNjQXdDUzFaOVEvaWJsdEhoOFZvN01I?=
 =?utf-8?B?V2JqQnI2Rlp4aGdjd3lxUTBOa3FMUngvRnpNd1FIeHZwcytacU0xTFFUNEl6?=
 =?utf-8?B?MWZMQWE1WHB1b3dkY0tZSXBFSEpQZHpuUm9vVkw5dEw5aFB0ajVmdWRBdUpl?=
 =?utf-8?B?QXNRaFRZcEJ2UEFNZ1hwalJmS0dxOW94Ny94NDdHM1ZPclZPdGwwdlU5VHgy?=
 =?utf-8?B?YlEydmx0czY0Q2t0dmlRQlZ6SEptb3U3WXpMditDdXdBQlY3cWp4YkdZUXdD?=
 =?utf-8?B?d0FheTloK3lqc0dxMnVXbjZEMXNDTUVGRyt4WWNNVFZUQW1YY0dYR2lDNG9z?=
 =?utf-8?B?TWJOaEIzUXJzVDVYWFhXUGtDWXl4YjNtblBONXBRbXFtT05Rc2gybFNrcm5x?=
 =?utf-8?B?SktSR0Y5bTFrTmlOTmFMczRPTVVFazd1eE13aUdrVzMvdkpCUTZGcmlKclFa?=
 =?utf-8?B?T0RIckIwNVdSYkY3NXZic2I5QWZBTlZ3cDdGVDE1TmFaQjE4VStVRFJISlVq?=
 =?utf-8?B?c0FFaDhCa21ZcXlkK05uN3hmcXZrc05kM3E4dzg0RHFoM0NKR0d1VHpkdzNZ?=
 =?utf-8?B?aDFKQ0FNbGFyZjkxMkE5b0JLSFMvTEpaWXgyTU1RTzQyWVVReWhCSDFWM2x6?=
 =?utf-8?B?UUNhVGxocU5zOURybE5haHpZV04zbllxVmkvWjE0cEZpTitoMjMyOFhpb3ho?=
 =?utf-8?B?TU1qb1MyNENVc1QwcVlMQlVPNE4yZ1VsZkYyTXJLc09PalpGRDdXekVMSE5j?=
 =?utf-8?B?WURzdXVhYTVUc2I0UDFZY1F5S3R0SEVCWjhndHZtSk9sa01BalFBanlvUlpk?=
 =?utf-8?B?Z3d1bzZxYlFSekR2TE5IV1dRdldiaDlCOG9CNzNCTE9sVWFTcDFIQ3BBcUEw?=
 =?utf-8?B?aWdJR2pYWno3anoxV3A1SG1zTjJ6NmNMUmRESUhsUFhxT05JWnBDVy9pcm9B?=
 =?utf-8?B?eVoyK3IxdU92dzBhWGduQVU1UzBPUmNiU3NYMlRYcGdSenF5US9QOHhrdlNF?=
 =?utf-8?B?bmhIRTlzUzhJRC9EcHlwSVUybFRtVy9JcFVpeVdPOHhleVBKSW0rOW1uNytk?=
 =?utf-8?B?Z2xDTm9EcCtZVFc2Z1FoSjR4R21rNVFvdjNsK21QeTcveUp2bDRmYUl3c2ty?=
 =?utf-8?B?L25RSlZ3MkpNMEtsYjQ0WHlpVy9relAweHlRUUpDUE5qM3dTNzlIYVN2ZStl?=
 =?utf-8?B?UjRsUHY4RTREY1NWdFc2a1p0eTA4aTlIa3hHVG5MbzhuR1JySzZuV1NNUzRp?=
 =?utf-8?B?ODNjVFNFRVZEc1IxWVZVTlB1U2trV2YzUWMwQUFZa3dkQjZUU3kwSE5oazJ0?=
 =?utf-8?B?eTJhbHpBMDR3K09QQ0dITlFwdCtkTlprbHA4Szk2aXFSbkIyejQ2dXBUTHNC?=
 =?utf-8?B?bWVqWDMvdmg2am1aQmZOdnpzMk1CSWZUc0dZN3d6NEJuakVEUmdjUEhOSlFE?=
 =?utf-8?B?U0pGY203UzNKTGRCOS9zUUpISlQrRzZQeHZqa0p4QlU3RDVCckFWVExLcUFT?=
 =?utf-8?B?ZjdMNVJzdlh3bWNaY0hrcmZhbzhiaXR6VVpnZFNCZ2hmL1JFTjJFTTEremxi?=
 =?utf-8?B?RDhmUDVhbkZkVEU1eW1FajU2eXVjU0h2cHNxa0FxOXhQcFE3QUJZZU5ycm9t?=
 =?utf-8?B?U1dPZldNNE9ubXJjMUNTVjdEemxkYzlRNHN5UWl2emhxTTl6N0pLWlVhcXg0?=
 =?utf-8?B?M2xBNloySUowMnR5QUZIN3RqTmMzZTlFSlJlSG1RT2J6Y3hjRmdtMFF0RmZ3?=
 =?utf-8?B?bnQ2b1ZPYkpPczFGYXZEMmJHUjB2c1Y1dUlmQXQzTVlCZk5FWWFSYU5jTVNx?=
 =?utf-8?B?aHJJWk9nQW9qUUpDU0QrWW1NVTkxQVc2eVo4cEFzbEFUQmx6ZmRIS204TWlP?=
 =?utf-8?B?SGhOdU52RXBQcGhEdU91dHZXLytDWEhrTjR6Sys3dGdxZWNvc1NLWG9UUnhR?=
 =?utf-8?B?OWpFMXhESE1ERlJGNTVLNVpYSDgzZ2laNkxOS3UwVFZhZkcrRjR4WDdWNzVD?=
 =?utf-8?Q?L9MQ70dI+PwFZdiw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abbb2570-22da-4205-e472-08de80502f5a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 15:58:21.4143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8tYviHhTVVUwr9XrfMI09x2oyn9qC8xSON3yJPwh8D+OBIchwgVofrqXAOdquZBccHoNJ/6CFDLc99uEXtnafSnYJdiCTIPQ3lq1E33eNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB8138
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D595F2750CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12/03/2026 3:50 pm, Juergen Gross wrote:
> diff --git a/docs/man/xenstore-rm.1.pod b/docs/man/xenstore-rm.1.pod
> new file mode 100644
> index 0000000000..40e3e581eb
> --- /dev/null
> +++ b/docs/man/xenstore-rm.1.pod
> @@ -0,0 +1,28 @@
> +=head1 NAME
> +
> +xenstore-rm - remove Xenstore keys
> +
> +=head1 SYNOPSIS
> +
> +B<xenstore-rm> [I<OPTION>]... [I<PATH>]...
> +
> +=head1 DESCRIPTION
> +
> +Remove one or more Xenstore B<PATH>s.
> +
> +=over
> +
> +=item B<-h>
> +
> +Show the usage information for xenstore-rm and exit the program.
> +
> +=item B<-t>
> +
> +Tidy up Xenstore keys which got all children removed.

Sorry for not spotting this before.  "which had all".

Also it occurs to me that "Tidy up" is not sufficiently close to
delete/remove for the behaviour to be apparent to everyone.  Perhaps
"Tidy up (i.e. remove) Xenstore ..."  ?

The phrase "Tidy up" does need to stay at the start of the sentence
because otherwise there's no hope of knowing what -t stands for.

~Andrew

