Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0785B48D73C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 13:12:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257166.441823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7yxO-0006tc-82; Thu, 13 Jan 2022 12:11:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257166.441823; Thu, 13 Jan 2022 12:11:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7yxO-0006rk-4o; Thu, 13 Jan 2022 12:11:54 +0000
Received: by outflank-mailman (input) for mailman id 257166;
 Thu, 13 Jan 2022 12:11:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fwfT=R5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7yxM-0006qs-8L
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 12:11:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcf037b0-7469-11ec-bcf3-e9554a921baa;
 Thu, 13 Jan 2022 13:11:50 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-nS7CRNkeNxqjMzv-IvXauw-1; Thu, 13 Jan 2022 13:11:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Thu, 13 Jan
 2022 12:11:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Thu, 13 Jan 2022
 12:11:44 +0000
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
X-Inumbo-ID: fcf037b0-7469-11ec-bcf3-e9554a921baa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642075910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZZhMMYY4C3WTxFsQcYaYyArCJiH3SojVIbs2CCEX/yI=;
	b=fSSXbRFJ5qtfyesr8IrjTeF04JSVtFTFVk/beZaYuM4QTniGCSHQ4XhS4gAxFz5iCnCfwD
	f4ppvdAtTDWTVKpWauRAyB1AtvkjANaeYBO4ww61bPQa5RCtndgG9Gy+WTDJrSeY7Wys0b
	PJcv4UGOnTwjX2L8RfZoA8Vpj1ZGryw=
X-MC-Unique: nS7CRNkeNxqjMzv-IvXauw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ayv2J+CM7vvwkjlh/zocNhhuOTxmdyYi+QYYyRyT0kPdd539ju3hk3i9CWNhNqcZvVRyrAqcQ5NQrlHArnVYtlQkyksmIkA9JVUb9S8aiy4ySvKC2U1mfGACTBezUoMkoyR9cvumJdjK5cbYMvpagZ0nt7E3wZFXsuuk6j92qEjfLQIkxVdgbLyVhvIoehwqHlfGl+TMFpiyJeXzwecf9Uyq5zIbN70edtXbq4TqKFpyXqU4LFwO2Pp8LPjTll66A6PmUV/A+0ZqeH3++gEYwWs0MqZZajedA8HRMir55cjs2Z6DCLbr23BI0wH7IFqav9vsuvkiisAy/xYMYF+IrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZhMMYY4C3WTxFsQcYaYyArCJiH3SojVIbs2CCEX/yI=;
 b=N59hfsswkxIj6EbdAcItC0WSKPqh7avE8l4avUo0kv2wLg5oQjWPwttk+QHbSu2U5hFCC2QgkxKjPmSsFGzCToLomfyzaRdEU969E18OHs+CnQdwy0rOxiXDZCpX5FLg43x3cE6TUBjjPsiPO20eCySw06oIfgjtLamhmHpsabcEMjx46dVWYu72UntVqKqKC0cmyv5yKakKKqmC3ElJAczvek2IJksMlQFSamYD1bzcVi+w2Uznd3R/5cJmP9oikEXVkE7K3Tx3ceBPMuaD6c3HfqRnUD5cndLi3QX56XWgv4LOtaGUblZlytY2L3jYAN/do+MA/qIZk3LkUwte4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <726353b9-0093-31de-bcfe-35f9ee68c61f@suse.com>
Date: Thu, 13 Jan 2022 13:11:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] build: adjust include/xen/compile.h generation
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <4f0766b2-cabd-cf5e-ed84-cc2b773bf5f8@suse.com>
 <YeALhTgXh7g2QdbB@perard>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YeALhTgXh7g2QdbB@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0027.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 995de46c-71ca-4628-1d5d-08d9d68ddcfe
X-MS-TrafficTypeDiagnostic: VI1PR04MB7038:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB703835D99401A35504EB1C8BB3539@VI1PR04MB7038.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tCwXUMj2kPlQ2pwaziVIwMeUXEQGg1xAY8ETTeGAmBZpwd5wp7gRkf0jx9Ep3DV3BSaLTfcgUuq84qSU9arDzwnc/U8IzvT/EEkgNnXZrr4ua4fiNSaJgtVQju99cr/dhfZkXN6jWxYjiZi5ZyTNzYcK8BeW2v7qR5yL4y9WXlU9FpO2GAfzNf11gVXSK3Fg8xmk2Jl03mwC1IsJUlnqeURK1lbu/c1xTWcgmxvI0xim+CWKoAoRM9STRP6zORyQNtpfHNFmPSDd48fMw9nKYwmQFrA1pFnNyCKo91WmQUL4fROm0iM8O2vplBSfIh8IBYP28rw2U9A4/L+yWOF3JhgEuPn0VYE0+vWGTLJtXq09hwLttiyRUl6U83vke1Y4rdZonmx+GC1+DKVVRx+otMsdm3a21kkTrYmPdPpp65yH2lijvX3wwrzvy0u15ewNjau1dC3xlwcL9QfrW3bhHnkC9UY2ZZCJZF8gRWVHMDdcvsv4dSLZP9gP3EOplyqJbh+87J9612/18StlBtAfLybhKwIRSpTvUhvTd7Rjk98kwy0k4FByYywxRdAEkoLoTRI0UB8uMbfq+3t7A+rObSNRXOgSXFzvar6smu6HJqEqwCUmjE4g4ICRAawbyvFA5SEWjVMq+roU+Yyx8lgYbePgrmKil+ZiQqpa/QnFzS/4TE4GtdRuBs7rl4PScYSFbeZiCzDyiWX+0bM7PMgYRnFWPFmwsnfl47k3KW1AX1g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(86362001)(6512007)(2906002)(31696002)(2616005)(508600001)(36756003)(8676002)(8936002)(316002)(83380400001)(38100700002)(66556008)(66476007)(66946007)(186003)(53546011)(26005)(31686004)(6506007)(6916009)(54906003)(4326008)(6486002)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RSt2QU5KYUJiUUxOb25jaW84djE3MmJNdUpncDM5UUVleUhNN1hJYzZ1YVJK?=
 =?utf-8?B?dUxBQU1DNUxwODFlUE1GR2c5WGhHak1ySjVuaXJmem5TK0FUbW05em5mRVJo?=
 =?utf-8?B?SDYxOTU2Q3g4RFVrVWdnL0w2eXZ0TTI2WTFhbkRQc2RLTVRZV0F0OEVSdXF2?=
 =?utf-8?B?MmlwbWVlQ0YxbVV1S05KTEVYN2xGTThyMExjOFkxV0MrYXFaTkFTeE5oRGh3?=
 =?utf-8?B?TGtsU21MeWtoY0tXRUhGZ2J6RHp3R3NadjduZ0wvcWxsT2RxZXJrOURhcG9G?=
 =?utf-8?B?dEFDQXFSLzhIalpTOWZjdGI0MWY2ZWF6UnNhZC9VSXhEalpmOVl2R0ZYRU9W?=
 =?utf-8?B?VG5lL1J0S3hXdGtza1h0SXZaZmo3V1JuUi8zTTR4TlJJdjdyejJMQTUvM3Vn?=
 =?utf-8?B?NG5teWdVMzhxYVhwak5ydFlOQ1l4enpZOEFyT3JXa3dwOGhmSCtrNHlvUDl0?=
 =?utf-8?B?UFBXT01YWmRvclhNdnFvTWJ3a3kvM2cyazZzczJCQTZEWDgrMWx2ZlhDOFBo?=
 =?utf-8?B?ZER3ektoajJ3eUtmc0diOVZxMkl0U0Q0TnQwd0lzclNFMjU3d2ZMa0tkSWhP?=
 =?utf-8?B?Q0lYUHNWbHFEY1hxenJWczNwblR3VkM5bGt6V2ZzWmU5M2J3dkZDbjZZUERX?=
 =?utf-8?B?bko5VUxwRm9TSVZJWTBRN3MwelgyQWMwaENOcytrY3VhVE0xd2ZxSXRhcmtB?=
 =?utf-8?B?YTl5VzQzM2x6MzVaZEl6TWVYNnc1V3RVZ0RGL1NMMlVIWTlEYVpweHk4RmVK?=
 =?utf-8?B?eGlzS1c3aFBpWFVneTJlanB2UWJVTk9Xa2VqR1VuZW9zZ2J3bWFDcyt6bUpy?=
 =?utf-8?B?clJ3M0FMbHRURXZ1b1kwZGtkUzUvZ01aMmRsVEpCWGhrOWtLeWE2dEw1QWsy?=
 =?utf-8?B?NUROOTV5NGl0SXQ0dGZ1Uk1GeFE1L1UxS2kydVRidWJsb3d2cmNER2JpaFhj?=
 =?utf-8?B?OUJvSzlzMkdqandsMjB3N1gyU1BoV3M2LzFMZFgwMTlsQmhwOTROUTNFZTBq?=
 =?utf-8?B?LzJtbG53Zi9rWExZeTJQeXhkb2N1QTkvdkVkNjQxQkljbTFXZVp5MkdHdDRL?=
 =?utf-8?B?bG5pejI1QkttTmNadk00N00yTWsxejNUUGNWVTZvY0lOcFRkdllPdldaWWhU?=
 =?utf-8?B?RzduUHNBVE5qT1R1S1docWhsS252R2JaVWtZdWQvV1l2WHBuRkxJelRaSllM?=
 =?utf-8?B?QWZmUWpsSFRYdmREbTNmOURSMG5XejREQnRmRXgxa1Jra0cwQ1pNdzkzQTda?=
 =?utf-8?B?c1plSmNsZHNiYjBMT3BCSm85cTNaMElZaHBmbTFWSXArcG9obEozbVg5NHM5?=
 =?utf-8?B?U1NDRGxSNEpVbDA1YWlZbGxBK2Z2QXZhdXZEaWFXRnVlV0dqd0N0NmYxK2xT?=
 =?utf-8?B?TlJtNk8zbUxRVUJ6Tzg0b21TRk5SL1hxQng0YkNRck55VFlBckQ4N3AxbGJO?=
 =?utf-8?B?OVh2eGxnTDJMaytSMWZTTnluaVVnN2YxSzE3cVBIQ2tiMWZ0OEVSQ1pEUzMr?=
 =?utf-8?B?MU1pTU4rK0ZmeHk3ajUrdktOQUpBUitXLzVDRHhnZzhQejFSMSs2Y2lCVU5x?=
 =?utf-8?B?bE5sWktJMnBHOXg3NVJ5czdud0d4VURNY2EzRnRwUUIvMjAxK3M0OTdhS1R2?=
 =?utf-8?B?aEdwak14RVJkS1k2MlBUUGcvNWd3Y2Q4dFlGMml0Z1JTTjJUQUp6cHFyV1Zh?=
 =?utf-8?B?S042ZExROVZ5S2pGN1dSQ2sxbVBwYkVvRjNLZEwwTEJwbDlRNlUrMTJ2b3Zr?=
 =?utf-8?B?KzVMYjhiWHFKS0s2Y3NZZHM4MFE5dU5YTFlEZ0p0MmpsSmdEZTZzYWJ1bXYx?=
 =?utf-8?B?SStlK2JoY3pVd2d3Z2ViVEpOSHhvWmNkanhJem5UUWdvbW84QTlBVGFiMUdu?=
 =?utf-8?B?Z0F5L0xjZHUvRTBGOG9uV2tTRk1pOFZxSHJoVzR3eDRyTTlsQ3lOaDF6TnVS?=
 =?utf-8?B?WXpPSzc1VldGVU5ZUHJSWU9Ib085cWhkdVlSMjdWcEZGd0tpcW53WHNxV2dl?=
 =?utf-8?B?ZlRlaTkwMkNXZ1RoS1RxdFpId3ZIbWxFR0dndVcyUkZhMWpKd1dvd1pGRGxX?=
 =?utf-8?B?UnBnUEZPUCtIQlFuT0E1Vk55Yk1CZUVXNkdEVmVHYk1oWThGVXcvS2tuV3gw?=
 =?utf-8?B?T0NmZ0dFZFp5cEtCN2tqd0FQd3BqL0JGczRhbWt0bXc1MEQ2bk9lYjR4Mnh2?=
 =?utf-8?Q?XdZePN2P8wtaxXtWPGDaTgs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 995de46c-71ca-4628-1d5d-08d9d68ddcfe
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 12:11:43.8318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n9e05ya1jv/ptpUpE333jb4vx/U2uKQPG8FJdrUEVuYhP0BKCV6jO64o6EjnbGup9Fyt7L4oHFiVjtYjWRtLuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

On 13.01.2022 12:22, Anthony PERARD wrote:
> On Tue, Jan 11, 2022 at 03:16:17PM +0100, Jan Beulich wrote:
>> Prior to 19427e439e01 ("build: generate "include/xen/compile.h" with
>> if_changed") running "make install-xen" as root would not have printed
>> the banner under normal circumstances. Its printing would instead have
>> indicated that something was wrong (or during a normal build the lack
>> of printing would do so).
> 
> So, having several line of logs with one generating "compile.h", and
> several object rebuild plus the re-linking of xen isn't enough has to
> indicate that something is wrong?

Well, for warnings and errors to be easy to spot (and until your rework
to make our build more Linux-like is in place) passing -s to make is a
must, imo.

> Also, with this patch, the banner would no longer be printed on rebuild,
> unless one doesn't try to prevent regeneration of "compile.h" by
> exporting two variables.
> 
> I kind of like having the banner been nearly always printed, but I'm not
> opposed to the change.

I'd be happy to use a solution where the banner is always printed for
"normal" builds, but not when compile.h re-generation is skipped
during "install-xen" as root. Assuming of course that was the behavior
prior to your changes - I never tried suppressing compile.h updating
via setting XEN_BUILD_{DATE,TIME}. My goal merely is that it not be
printed during "install-xen" as root, as that's how things had been
for many years.

>> Further aforementioned change had another undesirable effect, which I
>> didn't notice during review: Originally compile.h would have been
>> re-generated (and final binaries re-linked) when its dependencies were
>> updated after an earlier build. This is no longer the case now, which
>> means that if some other file also was updated, then the re-build done
>> during "make install-xen" would happen with a stale compile.h (as its
>> updating is suppressed in this case).
> 
> So, the comment:
>     Don't refresh this files during e.g., 'sudo make install'
> wasn't correct?

In a way, yes. The file would have got refreshed for two reasons: By
deleting it (i.e. unconditionally) during a normal build, but via
dependencies only during "install-xen" as root.

> On the other hand, it's probably not good to not regen the file when the
> prerequisite changes. It's kind of weird to "rm" the target, but I don't
> have a better solution at the moment.

I agree it's weird, but I've outlined the only alternative to this
that I see, ...

>> Restore the earlier behavior for both aspects.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> An alternative to removing the target would be to replace "! -r $@" by
>> "-n '$?'" in the shell "if", but that would cause unhelpful alteration
>> of what gets recorded in include/xen/.compile.h.cmd. (The command
>> normally changes every time anyway, due to the inclusion of
>> $(XEN_BUILD_TIME), but I consider that different from varying the
>> conditions of the "if".)

... here.

>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -424,6 +424,7 @@ targets += .banner
>>  quiet_cmd_compile.h = UPD     $@
>>  define cmd_compile.h
>>      if [ ! -r $@ -o -O $@ ]; then \
>> +	cat .banner; \
>>  	sed -e 's/@@date@@/$(XEN_BUILD_DATE)/g' \
>>  	    -e 's/@@time@@/$(XEN_BUILD_TIME)/g' \
>>  	    -e 's/@@whoami@@/$(XEN_WHOAMI)/g' \
>> @@ -441,7 +442,7 @@ define cmd_compile.h
>>  endef
>>  
>>  include/xen/compile.h: include/xen/compile.h.in .banner FORCE
>> -	@cat .banner
>> +	$(if $(filter-out FORCE,$?),rm -fv $@)
> 
> Is there a reason for -v? Do we care if the file existed?

That's meant to be an indication of the file getting updated during
"install-xen" as root. I thought it might be nice to have this extra
indicator, but I wouldn't mind dropping it if that helps acceptance
of the change. Can you let me know how important this aspect is to
you?

> Do we want to log "rm -f compile.h" ? Or could you just prefix the line
> with $(Q)?

I'll add $(Q). As said, I always build with "make -s" (except when
debugging weird build issues), so this is nothing I would have noticed.

Jan


