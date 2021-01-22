Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECC33008C4
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 17:36:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72975.131565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2zQA-0002Iq-G7; Fri, 22 Jan 2021 16:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72975.131565; Fri, 22 Jan 2021 16:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2zQA-0002IR-CS; Fri, 22 Jan 2021 16:36:26 +0000
Received: by outflank-mailman (input) for mailman id 72975;
 Fri, 22 Jan 2021 16:36:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wVda=GZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l2zQ9-0002IM-0c
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 16:36:25 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa7a32c1-b3c4-4f3c-8a1a-eb4abf2c44b3;
 Fri, 22 Jan 2021 16:36:23 +0000 (UTC)
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
X-Inumbo-ID: fa7a32c1-b3c4-4f3c-8a1a-eb4abf2c44b3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611333383;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vIwlhYYCGM9Aidcq9tWdTSkGlgFUsqpvNC8mEkjpOG8=;
  b=K5p81S95bjR540KCmFvPZoa/luH0BtxkcE8+F60r3Arqa+ZGzpe+2rzp
   GLiJ2RcrQCl3DhwR+HLqdvhbOHS+MGjj8qsUjHX2bTtbYaANXq96z8mnF
   Rwk01vOja/Etq+YzNK+DYTeECS3RB6PTZ7OhRbwHQXpjALYwDXQjPEgmH
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: XWDC93QusmamUFBWr0A/9ITmbb5kGeKvo6f0L0Qf8eTuSE1xr2wi6BLmNbHoadc63IZ1EFpIFh
 IqvJvGtZrDBBDmAB4HHCZ7mdoevWM3SgqcZbte1sW+rg9kA+1vgAeDFjawV63fs7hPJ/cbz5An
 MSdOOuv9+ltYgbaxBeFJQVCKV/hs0yU5Gln8mbAFotSEa32UkRv9IfOdLzRuNqjXuFVpSwT9Nr
 vuxpRDq9NadYuto+tG0GLK61r4gvVQF3Mlav8ELtmYZqr+suh43P3CF68ACPuAldyiS9gQybNe
 iAs=
X-SBRS: 5.2
X-MesageID: 36981224
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,367,1602561600"; 
   d="scan'208";a="36981224"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fLxYy/mDdTI3rvMqJdkw41UqAdKTaa6f3VYuSIWC8QL6bh4u3iMa+N5AX4IfN8KOhyE8lOPfpi43xfV6DqQoVODDZ5UDSbwuuniUt9yi4mgGPZwDpGRgf7xm4HMJWLkq/Mw3YgYCRC8B1p9CZl7VpyFu75Hs9dVK6d7gpL4JGqP6y8zqtr7MM5lySnZPNiEwvzlJowGv2vTKTBQjzrE02oeyhVWsvpWPOWDayHvy5T/PgpaV4Tqn8uq3+08P9WxNFwaJfrDWc7eHyzoIaxd9zTuDHq7HN3qbx700dcJtsxGXMSZcoIx+ersgqB2B/WaEk/ueZC8/cMMNNzheayfJtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PiRISvG1GyN74JUp9mNR4Ao8Igdw8U1WuloGCuEXztE=;
 b=TnnLf3PSII+w14NK5c2TikKTbf3zYn6uxKdbQ4iqpCvieQG+igGntHryBzK2zm5P2085Q70RJ816mlzWCvqjVpo+cMZCuWJZXLQDn8nnHb4tf+W3BXxKmLeLmjBKqYQ+PFw3iKxO5dwCo15EeCk1nFogDrYG4pBCYs/Gr3Pc9zKuKOHXzMYKUbN2eudk/gpymsYzOqkUkH/LYy8qFDVaLtHJiFYKtZLYWI+8b/+nCxDHj9wMcsL+Xzkk0FSx2Rb513o1VrOz2y3rJjY7emExhMG+oe7DLL0tr1K6Ys4y+nab6a5MrD6A9FxxdNKRSYJAhRDjNm2gJ5aR05inyWcPag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PiRISvG1GyN74JUp9mNR4Ao8Igdw8U1WuloGCuEXztE=;
 b=pMm0dp0KP+944mGdPXeih1lEQOBmItZUQ3mEjSA5D1LxOel2ODtvp4v8ZVOx1BMZqB2+0N8W8KB0fUPc2mONJ5EidpCGKkPsfQq9j26x+Dt1cZecpukHyk6LABhuB4SeU1XSoJsbcuZ3DBZ17OhFR1MnnYlSoW4iSeqNh0YjN6c=
Subject: Re: [OSSTEST PATCH 7/7] make-flight: Stripy xenstored
To: Ian Jackson <iwj@xenproject.org>, <xen-devel@lists.xenproject.org>
CC: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, =?UTF-8?B?SsO8cmdlbiBHcm8=?=
 =?UTF-8?B?w58=?= <jgross@suse.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<ian.jackson@eu.citrix.com>
References: <20210122155603.23402-1-iwj@xenproject.org>
 <20210122155603.23402-7-iwj@xenproject.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <81f92e66-3a43-dea8-f633-2fcf725c10dc@citrix.com>
Date: Fri, 22 Jan 2021 16:36:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210122155603.23402-7-iwj@xenproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0144.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::36) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06d41b18-d8bd-4d24-5bd6-08d8bef3d95d
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5424:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB542435F86D152BCD500E6FF9BAA09@SJ0PR03MB5424.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /vjyG+uyu7dFl7PQKpcEu26SCaz29+K97dKLq80XsFcbIYQYbWtKqWOzw5y6wFsOCqT1CS0M3eOaClRectji4cXnJekm6Vapk5I9je8dfHBp9HOz45br+gd/3A50eCysa/NEU+F0dN5JgBHUOG7WETvbF1Svm+/360mDbsb2ujUB8PeZ+JSgePsLrPcr3Yn7xazVO96XOlkohTBjWIK9BQFKiJpUaikVkkIpzaFc+3RpyiiQs7sH78LRbbDksyKw6/gzm84/tRWdGCfSl5ArVmEcQlWCVKLPpO6R9P85fjgBLBk5IBOHSn8kysrisl+4eu2dPChjQO3suImWr2FEPcBXowg6XK9q5WzSrrNgQRT0ZKQ8bvNLaLW10VPkYF0fEIzSo8hQA3djfqWfXctcjBkuFacRmI82HxFK9LM03BkTaGyYAZihNlnujkeuB90+FuRkI8FLa7tQt6ykr0K8wUJOZ/fBs7SlDPnTiyKeWrI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(4744005)(86362001)(2906002)(6486002)(31686004)(478600001)(31696002)(8936002)(4326008)(107886003)(66556008)(16576012)(53546011)(36756003)(956004)(316002)(66946007)(66476007)(186003)(16526019)(8676002)(54906003)(2616005)(5660300002)(26005)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?czJUdDRmbE82bExXRzR3N1FBSW5RenIxOUhZN25VYlBKNUdrK2tBZ1cwbFE1?=
 =?utf-8?B?SldzcFV5MDRRd3BIMnhlYlo0VFRVWk9hS0dWY24yOG1pZjkycnN6d2RaR3l0?=
 =?utf-8?B?NGNjOHhGbVVVdFVpNFVHYzFWUWlrTklHOWxGUXBpYVpWUUwxQjhWNDdPVURz?=
 =?utf-8?B?RnVNODNpZVhuSUl0L1hrTmdEbXNyTWh5N01mSGRUaUdzNUkyZldwRjIrak92?=
 =?utf-8?B?VUpJbmUxSWw4M2VveEhKWXU0V3IwRzhqUmgrZ0J5cTJ3Ukd4djgzUEkrdkpU?=
 =?utf-8?B?VUdNdVZjSFFYMmlFZDk0MUlsSTRVVTlYY05Zd0JBZU5wZFdZZjNsTzlCTitY?=
 =?utf-8?B?WlQvdjY4QUsrYzBkU0JOSGd2T0RscEJnUXNwd0V1akNiNHBVNnRhSDgvdndv?=
 =?utf-8?B?RXlYU0svR0hIdzZXYXI1YzhrVmpxNy9FTGRvNzUyZzdhU0tGTGJ5c2NTU0NX?=
 =?utf-8?B?RXpIclZFZWhiRUVTWUxUOE40Z1ArSlJlM2JwUHltZDJ6VThjUitlcmV1WXZ4?=
 =?utf-8?B?TzE5eFZZdzB3L0ZxUWVZQ3VOUlNJczVCWHcvYzM0TXd1OVVnN0Y0ZHVMSWJo?=
 =?utf-8?B?WFg1WnlVdS9qMksvRzE5YW9ISnpsK0JhZHJ1ZnVDVDV6TGRJNlVYU2NCS0t0?=
 =?utf-8?B?V1hVcU5SeWV0cE9ITGZ0K0F4MnlVdWFNZlNxYnlOeEhtVEhPMFVGZGNkK3RN?=
 =?utf-8?B?dlFoQVh4M3oxYnFLUTFFMTVpdWFWaDdxektGNVBUSGh4czdTZktycjBtMXVU?=
 =?utf-8?B?Nk11SEY3L1dzZjJtK0pUZTlGQlBSMGhnZHdwVHRwSU10WDJ2SnY5MTNGTkR6?=
 =?utf-8?B?UnFDWmxVVjZaeWJVZ2ZEaE5Hak5XRlZSdlZrY2g5RzlTWE9NTHBvcGQ4SVV5?=
 =?utf-8?B?YTg5Ti95emZsdEtscDdYZElHY2h4ZnVtQ2lJWTM3RTVSK2JLcDE1bUxRK0R5?=
 =?utf-8?B?NkZZbmVyenljWkEvVWpqM2FNWDMyR1U0a0tYcndyZFN0MkZBTFBJd0VLWGxT?=
 =?utf-8?B?WjdWM0dhOFhDdElzVUh6NDliN1pWSHZYR1BEV2hja0NoTTRFSWN5ZkJaUTBl?=
 =?utf-8?B?YTFSeVkwWmMxMnhCb1NnRUVGMFFsV2J3UHk4eUZ1YUhXSEtrV2FubXl0Q1VF?=
 =?utf-8?B?SURSZklHZ1ROSHZocWVhYytuWXd4YWZtR0o4QVR0bTRKYjJxVmUzK3A4a0xY?=
 =?utf-8?B?aktLUFpOMWpJbmtiV0VsSDkyZkJrWHg3bUVDWWlWc3dtNkJ0d1lyMGY5bWhB?=
 =?utf-8?B?c3ZOa1JzOFkrbXZVQi9kaHRFQTFNMjJHZkc0OWpYSDVjQWsybDlGVUpUNjZL?=
 =?utf-8?Q?ksWh3UZT23scYc4LwozN3W/HK/xr6tQH8X?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d41b18-d8bd-4d24-5bd6-08d8bef3d95d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 16:36:20.7309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9+ueTmHvS3DVGYQmCU1ko8Dj8hwe1k5Nmy+4eiUfFVepjNAY42BmCeNoZQmKsYZutxWRo2K+wl1IKecRbWwzkeL9su0X18WqycYy7mKSOUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5424
X-OriginatorOrg: citrix.com

On 22/01/2021 15:56, Ian Jackson wrote:
> diff --git a/mfi-common b/mfi-common
> index 35efd233..2834411f 100644
> --- a/mfi-common
> +++ b/mfi-common
> @@ -509,6 +509,13 @@ job_create_test () {
>    xenbuildjob="${bfi}build-$xenarch$xsm_suffix"
>    buildjob="${bfi}build-$dom0arch$xsm_suffix"
>  
> +  local xenstored="$xenstored"
> +  if [ "$xenstored" = "" ]; then
> +    stripy_rand "$job 2" xenstored  xenstored oxenstored
> +    # Without " <n>", all XTF jobs use oxenstored
> +    # With " 1", All OVMF tests use xenstored
> +  fi

An extra thought.  What exactly feeds into the decision?

If it includes the flight number, then the retest logic is going to get
very confused on xenstored bugs when the implementation change between
the two runs.

Also, what is the bisector going across this changeset?

~Andrew

