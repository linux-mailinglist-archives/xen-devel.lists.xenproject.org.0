Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 687764E9872
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 15:40:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295448.502756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYpbV-0008Jp-F2; Mon, 28 Mar 2022 13:40:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295448.502756; Mon, 28 Mar 2022 13:40:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYpbV-0008GP-Bd; Mon, 28 Mar 2022 13:40:17 +0000
Received: by outflank-mailman (input) for mailman id 295448;
 Mon, 28 Mar 2022 13:40:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCnP=UH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nYpbU-0008GJ-Fm
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 13:40:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99636aee-ae9c-11ec-8fbc-03012f2f19d4;
 Mon, 28 Mar 2022 15:40:15 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2052.outbound.protection.outlook.com [104.47.5.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-ePy67ywHOUuekDhgdDpquQ-1; Mon, 28 Mar 2022 15:40:13 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB6PR0401MB2358.eurprd04.prod.outlook.com (2603:10a6:4:51::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Mon, 28 Mar
 2022 13:40:12 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 13:40:12 +0000
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
X-Inumbo-ID: 99636aee-ae9c-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648474815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J3/ZpJ/iDKVM8tHOMiCL0WIxTRWCqDLtBHzE+281zFU=;
	b=mpRzLLs361Vqy7zU22fncLYdtseo5fA4F34CDokkL5SWyiDYfMUCB3sJ03vls3J7EJYzgJ
	rG85RHxXUVzrd8UBsBuiF1kfLh2sOexIA4VYjQU1fjYQ+WYdpiY3K4rlgrb76f+GEsEZxp
	3JcQgvxuoa5sDPUxmSRIUUo9I2m2MVc=
X-MC-Unique: ePy67ywHOUuekDhgdDpquQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQNiUZ9xEnf0Wb8za0BqnlVFHcrw9TsCx8XUwfO8WTlQRQX+rVKI+LgFryLERV5b+7u8jvtQRnX5MG3B7Sxwx+7DuLntctwAPx0B+lBBb3Ntt2esMx5yZTTobuh8JJXfj5BEnb0nZ3lf/1eDBo0tlK7BjDr1aecP7AtKV5E9ACeZK8Wo4Gxx2CzJuiWVgHgJlIO7QCynu8CMefGkBrmcSrDpA/7YBu0O09Wz/ttQnUpR5deL0XNKi5ZpSoerdbibb3PzFBSIlXZ35BUSqK6Yl7NG0yJlKvkelsAVyfryj+yJlJVTsrxXZ7hCakns1nvk70Mfz0Gcco+2wRd4HuRUTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3/ZpJ/iDKVM8tHOMiCL0WIxTRWCqDLtBHzE+281zFU=;
 b=gXBDv3wEoKxnCXMOKN/YWhHVGZgGnMB7/B0/w6w+kfXiXCOfmPI3iaYKz3jp1oMYEgTvI55kDAwHGB4lsRuvkFiYxRIsuR/nN40PKKNOyPVpVnyp4VBKcKCasRcPLb3HtsEgQyqzo7YZeI5ekc9fFmXIPGIrqdM3VaRiI0QQ4U7iqBfbexQ6dpk+JkRY07JHlCHsyZMs5Fj1ohAPwyOWBwEXtB1VErGZ4pvQl8RNWjf1P7n/bu21oX7sAfjYa9hFNpXRheHaOaSmhkXBUxtkXGj3ead9FsBZ+xSt38DfxOD/dVrHzDyEgYkjo7CPSiRK/j96g+HAjKRTJWYMlGIOYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b8ed9448-d2ea-b09d-1f20-b4dc70dc3e5e@suse.com>
Date: Mon, 28 Mar 2022 15:40:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests
 on top of SPEC_CTRL
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220315141807.22770-1-roger.pau@citrix.com>
 <20220315141807.22770-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220315141807.22770-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P250CA0001.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::6) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4acf6de-9614-4741-2c5e-08da10c07bb5
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2358:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0401MB23587DE14DFE96056EBA4390B31D9@DB6PR0401MB2358.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t732+GirA/i0GWuAdVbbf/we5Ru6aOoJCFjCGCHccYIwFxCPdxS8J6gu0odyM9kRZ8YmzLQCcAT2yoW9W2fVZtF0o1uSSG2Ylq2948M1nH9Fph1PUNwdbb/YjBRHLgmuq6ID+Z+QUpdGnMPK4YOmW4J/PZjASwxRSZflEShwuw4INRRj0dFuT9tn+CWFfo1ha6LNLkM2vnsTA78Tt76C7kyE0Eg1ow+9I/etW1iZ3Bar9qchytJsslvWe+mO2/q0VlxAXlnGMKFjB03N1ABN3viCGwZU/5pOef+XA/ul5jQ7Itvsm8pUcEqXcHUnUiW5C3mUCDZaczBuf6le2SzcC33QjG5ogJWbgaef1sk8IgdIOdiBbslmgLn/6nmrRstml6Zh1/T4WcWb6y++oJo84caCBRqmvdPBIRnNztHtnN8or2JZcmle8eb27slwKgCQRBZaJnA5YORzOpm6B1ReYb4wodDOvZn0O+KSjgxTQXdxh+3l4AmzjaRwReAblH1zDA8vz2D2hCoafIinA4LrMOpUAcIsHP2rGxXqKs5B7YUgX8sBToYrb7uj3M6UkL/IM2fzUcGzeVOgQCqdUwS+wTnb7yct/r53SVh3EwSIaF6Z8tlFCjsWszqLSzmjXzMtJ10JOa9LOG4y7DkDTaQaXwPXM8otDfgi8FycyzFOA1gT3wSIQF0FvIk7fwaBXZ8FrhIkPPpi+XNwq2N+FRc/nycAspPGncAEHrOGD2RVVCQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(110136005)(31686004)(53546011)(38100700002)(6506007)(8936002)(8676002)(86362001)(6486002)(26005)(186003)(36756003)(508600001)(83380400001)(66476007)(4326008)(316002)(5660300002)(66556008)(66946007)(31696002)(2616005)(6512007)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnNhM2ovTHllazl0SVJJTFJReFo5RnhiRHZaTFJwMnUxU09RcWVQdGhTTHR6?=
 =?utf-8?B?Yjk5elE0cjY1c01CeEhmQnIvWlRqWTN0UXViODRkdjE5NEdDM283YW9rejh6?=
 =?utf-8?B?S29ENVExODVNTWVJTVovRGhuV216dGxxNnd2RFRkblc5bEMzSE1yTnR4NXVs?=
 =?utf-8?B?cVU5dmdYUG9jUS9qRmJJeXpYQTUwcWcrb0V4UXp3YnMzSWxibWdwNnkyenFj?=
 =?utf-8?B?Vlc1TGFGbjhMR1hmMEV3eG1oNEhyZU52S3JqQnRqUytaUWMwcytJQlFadDlP?=
 =?utf-8?B?ZGdub3A2RTVqZGp1d3VRaHZyZ0F6V3h2Y0ZyODdMVGlDMG1kSG1SNGd6NDJF?=
 =?utf-8?B?UlAvZUFHUGV2YVIrYTFBNWpoUng0OGQxOGZiK3FLeE9JTDVTbnVGcS9NT0lG?=
 =?utf-8?B?RjV5SmYyRHRqanVaTHZRTHNLenFUdDNXSnBxbWo4ZUVoL1ZzaW5CWmJ4eHRG?=
 =?utf-8?B?WkkzS0FEZ2xuOVc4TmZaa25NOEhtNSsrN2dNS01HeTFLaE9tT2pudGtwaFFu?=
 =?utf-8?B?bHk5WXR2Rm9uWGpEcUd3d0w4VkIvNGRXSzRaVzk1QW5FNnNPLzVKWjN3T3F6?=
 =?utf-8?B?dFRGTHFZWld1aVhHVWFQZ0R4LzdzSklER3FhcDFqRW51VnVQbWRLcWlQWlBm?=
 =?utf-8?B?a0ppblhKN2RhdUQ1ZDNLZVhUTE5KTDQ2Y3VDaG5ROUZ3ZklYUSsvL3JnYUxh?=
 =?utf-8?B?bmUycDFJdmxHRmc0MGZmVFA1YVAra1cvaTFZQm5pRWxDZ2h4blRzYzMvRWxY?=
 =?utf-8?B?ZkIyVkZkdDNwbk5nVU5VQkVCQ09IR3pNdlVja2NiL3VreDkwVGl0KzhHbUIw?=
 =?utf-8?B?WkhPczM2R0JxV3A1c05rbVdxNlhuaWw2a1lGWE1hRGxKRlNQL1hWbnZpUTFj?=
 =?utf-8?B?SlIrMW5ia2p4UGlSOGQxK2VFeXZNOGZKdGJDaERiNTI5QjU1ak4yVnhpVzF4?=
 =?utf-8?B?QmlqcEQzcmF2YWJtSGZRYXIwbTc3ZWwyZW5XUEFodjhlUWJ1N1V5QUEwVkFj?=
 =?utf-8?B?bExJR0gwWG9udllsbWQvVDQ0djBHWDQ4c0pvbDAwWnlpWjAzMUZuVGRTcDg5?=
 =?utf-8?B?Ny8rUmtYeXc5Uk5RaEdJT3FNZVduMlhESWxia1J4OXEyYS82VUJ4WHpWWnVZ?=
 =?utf-8?B?aDhxU2VJdVYzQkVUZmxRZzRYYi9GSzVEenhoM3kzcGlCTFZXVHNtZDVsZlpH?=
 =?utf-8?B?emZkVTNRNXcyTThJUll2NUtnMVBSSlllbjE5WXRraExKUmhLbVZ1VmtwME9J?=
 =?utf-8?B?dG0yb1hjbGJBa3lsdVVwRjlsc2xEbXVyYWxZM1hLY3ZXMXRmWUhuMjBYVWY4?=
 =?utf-8?B?cU1YbXVzQ25zUlA0eWd1aEtqTGRuSUdFb0pBL1drYSsrYmM2TU12UEZsWExG?=
 =?utf-8?B?SE92R0cyaHlaZjIrNE1YeDQ1T3paRXF1a2hvYWdFNjFYaGZhUkJ6VFpWdmdl?=
 =?utf-8?B?WDZYUTFCUG9VV0pjTnhiSFFMTHRKTlBjK24wQk1HSTJvOVlmREdVWURVUEEr?=
 =?utf-8?B?RnIrcFJtOThqUlcyMzY2UmFnZWxHcUdVM2JVV0pXcHQ1dmZyZnJKMWUwWnZ3?=
 =?utf-8?B?UlV1VXJ5aGdJYkRETHovdkRCSy9PaW1jSkpUcTF4SEgyUjNUa1pwOHozWWFQ?=
 =?utf-8?B?eFR2TXJhUERYZTNlS3l3RlRDdDFHMzZwZDlmSXVBWTdKYjdGbC9BSmNRWWd1?=
 =?utf-8?B?ZGpLbVJid0N3R3lUc2dISCtuRXJrazg1OGY1UkhPek1XOHBaaDVMeGljSGRQ?=
 =?utf-8?B?QnU1WUNkUWdvRWZ6RDMxNS9uMUE4WmJKSTJUOHlGd1U1emdBUkdXMHpzdG1Q?=
 =?utf-8?B?SlE1LzVpc3hCNWVVczlhTE41c2dGSEhzV0hFai9QbytldXMreVRnQTdMNjd2?=
 =?utf-8?B?VldKYkVTSGNQWmxuZU1JUkwyN2h5Mm04L3d2a3Npek0yU3E2SFo1Z0RhdDNN?=
 =?utf-8?B?M1NFSUJ6alVPR29BR0ZweVk0WFRaRUhKaTZHSTNWc1NVaFg0Y3djOXBMUWxh?=
 =?utf-8?B?ejVkUnIreUJyRWpkTTZRYXdkNm83Zk05aUhYSFd5NGt3UTFyNkRjVWNVQ1Rl?=
 =?utf-8?B?RkZzd3lGMjIrdFdkT0NOTGdKNGkwck0yNFFWN2xFV2JMaENoTkk3VERrRU5x?=
 =?utf-8?B?RWZvbmh6MUtVaE9GMW96aEtxZklLWU14YzllQ3ZsYkU2ZGd1RWFCTU8rUGNn?=
 =?utf-8?B?Y2MzSG9FbmllL1YxS0E2MEhrSUIydXpFWDEySUF1SC8rSUFWRXdnYU15b3Yv?=
 =?utf-8?B?U1ZyK0NKYW1BYVltcmxhbmR5UUppWFRGSm9SYVRyQ3g2Y0YzQzF1ZFJpVllp?=
 =?utf-8?B?aU1TcXZUandOOFVyVU5DMy8yaitibnREV1ZBanR2cmduN1dMTkUyZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4acf6de-9614-4741-2c5e-08da10c07bb5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 13:40:12.3613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: glJWwxtQC8PywKhjIJP5nghDFm9TsWv95Yz6csJjxlmDRA01H14Yc1FmrIIphwXzu6GCdkR3/9AaTqcy5qTt8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2358

On 15.03.2022 15:18, Roger Pau Monne wrote:
> Use the logic to set shadow SPEC_CTRL values in order to implement
> support for VIRT_SPEC_CTRL (signaled by VIRT_SSBD CPUID flag) for HVM
> guests. This includes using the spec_ctrl vCPU MSR variable to store
> the guest set value of VIRT_SPEC_CTRL.SSBD, which will be OR'ed with
> any SPEC_CTRL values being set by the guest.
> 
> On hardware having SPEC_CTRL VIRT_SPEC_CTRL will not be offered by
> default to guests. VIRT_SPEC_CTRL will only be part of the max CPUID
> policy so it can be enabled for compatibility purposes.
> 
> Note that '!' is used in order to tag the VIRT_SSBD feature as
> specially handled. It's possible for the feature to be available to
> guests on hardware that doesn't support it natively, for example when
> implemented as done by this patch on top of SPEC_CTRL.SSBD (AMD_SSBD).

Except for this ! aspect the change looks good to me, but in order to
give my R-b this aspect needs sorting. Andrew - what are your thoughts
here? The reason cited by Roger doesn't look to be one that I so far
understood would require use of !, but your intentions may well have
been different from what my current understanding is.

Jan


