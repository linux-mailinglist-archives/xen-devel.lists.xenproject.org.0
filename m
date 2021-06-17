Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6233AB6F1
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 17:09:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144055.265225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lttdo-0005uN-9V; Thu, 17 Jun 2021 15:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144055.265225; Thu, 17 Jun 2021 15:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lttdo-0005sU-5h; Thu, 17 Jun 2021 15:09:12 +0000
Received: by outflank-mailman (input) for mailman id 144055;
 Thu, 17 Jun 2021 15:09:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k/hY=LL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lttdm-0005sN-Oo
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 15:09:10 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69f854a1-cc58-4cd6-b4b3-895075f4b964;
 Thu, 17 Jun 2021 15:09:09 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-7-ZiTt_QA0Nwyum55kFdi5cQ-1; Thu, 17 Jun 2021 17:09:07 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5741.eurprd04.prod.outlook.com (2603:10a6:803:df::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Thu, 17 Jun
 2021 15:09:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.019; Thu, 17 Jun 2021
 15:09:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0029.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Thu, 17 Jun 2021 15:09:05 +0000
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
X-Inumbo-ID: 69f854a1-cc58-4cd6-b4b3-895075f4b964
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623942548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C0r2bk2ofI/UWtw5xRmWeP/k6ugqIJ8SEfrMEy4f7RY=;
	b=fXNFzzfT0PfsO2eQwL5oXV8LX11v3BN+5uP8O2NhQU0Eqw49fNfY1S8zhgRM9828VRpjIz
	TGAwSeHVaUgMc44fYSokVSx1GYPcFCgYdvkOvT5e1uIr6Da94+QdhTri4iScYNrU1+Z4JL
	EssdpIn0IwwlX/3ZdFrnP4FgZU454R0=
X-MC-Unique: ZiTt_QA0Nwyum55kFdi5cQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dr8LOSaX64p7iu7FA3tpkrPqzByQcD966oNj5LLmUutyjaoH8NISy8r82M2pSzXspLVx/0qQXZ+N4jKIuyiLfrnu7FWWNQbwQmjotkATGceAyh7AYBzYNtUHi+C34JUuOpkT6ecHSoVoV1mQbenQQDrig9DKY27m9rBzDcfEzftsDnn+Ofh9PmUklRAlkJvvgbyD1aoGGBblwa76K7tf9eypeHJMVJW0kgKrQrCWJTPZ8zJLXAlbdpnrbZ25GaSyi03VxvmSDA6klTyK1n4pesfYOZrlVrwCtGW7vm405VPIhWa9ZWN+B2Ajk75kuCxKK7JeoOmUn2mhiE5GY/ht9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0r2bk2ofI/UWtw5xRmWeP/k6ugqIJ8SEfrMEy4f7RY=;
 b=IAShU52njNL7DHmPLBxy3gsDAjVmnOhNBIOjfqO41Jo9z1K0XpOXfbfbq0zvukFIKtzgAJoDThjqnUWf/74B4Ks7afz586Ng4WLyQVSJEuHcf/n9TvrNaFwoVCQy9NmL13j+vDsKTYIltiOmiNs8RGu84GRp+kVcJFpHCtIfO4QXfBDhIeXQlfQQb4kvWRH2sNjyX9Aix2Mh3u0ywXCxguCTgREHWL6dqTGxrJd03odMThL7ELYeGPRtHajygcndINlGWgXxVIpi6u4QWXPXyHkP9QnMKmRHoEbu6y+CLB7p636gXvnLIb+uZeKrGMkaEySXEEvmuQiZ7WghtThztA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=suse.com;
Subject: Re: hypercalls with 64-bit results
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <71b8a4f1-9c18-36e7-56b1-3f1b1dabddd6@suse.com>
 <d38cd3a3-6139-5ebd-6a78-debc20c3b2bf@citrix.com>
 <1adf28a8-a0fd-4ea4-bbd0-52734630d52b@suse.com> <YMtkN70EPzT1KO/I@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <218e3205-b4b1-8a73-462b-c8338f3e107e@suse.com>
Date: Thu, 17 Jun 2021 17:09:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YMtkN70EPzT1KO/I@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P191CA0029.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3a95a59-c251-46b2-2fb9-08d931a1d99d
X-MS-TrafficTypeDiagnostic: VI1PR04MB5741:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5741CEA3496AE5F7BD63B0ADB30E9@VI1PR04MB5741.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xc6ipqrTT6tFAmKMkepG94fT5q8MbZKRIBfY9rrPz9fH6t63PYzULZjxmxeNrLwq1duHNJLsqRZnvRpopYahQrPAP/zMeJnlNQqNsSE+CNnINiwruG1oLYYWVclu3i0rGssFmakNfUsiK9DIqUxDteQCojLBYQifxEt7rdasafXrL8QDCUa1q1Sv3YP97pwLkcFI8SnB7jl3Wfmv9HMFavYP745rVsrLeexsteQFa6bg7YCweh/6K2Kwu4NQN6vWkq+H30aXXOoKfAwhre6iCKtYNi8zLf0Lg+iiHcZK4fEfwzGzhPKHFskWwgCl1IlAr0J7ZxDeoHLxAt0N6ttKk+XkRlwi3yA9unBFOqxvtGFeTLM0BdHM+nRX493KS6xgJgdfz60zDYtjESzrOZv6mMID9L2FCJW8WeikSMkoVhtF2LFf1vJEz4FtzEgP02p7OFZxf4AaeiMkGNzI9+f1QB7iLoG0LI/UvbGojTaIkxwPJ7j1ACGyv2V7CWQ+8PAByKE/KK+jgM0CbPWYCb1cKZCelcUZ7Kordjdqy7cyMHI6gNr50TB+337VxaX/PdJUA+ap8szG3XPogkV3feJjgmV9PMF7qtdQIeYnvmH0T8f3GzHYoCmqpsicEitnom7kLe95Yl1Gaz3/ShtzCwKWW89NN24Lnt+O4hxJDy9uqA6EUMJCq4Woax4I7Atlc2+2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(346002)(136003)(366004)(376002)(186003)(316002)(66946007)(36756003)(54906003)(4744005)(38100700002)(26005)(16576012)(16526019)(53546011)(66476007)(66556008)(8936002)(83380400001)(5660300002)(8676002)(2616005)(4326008)(956004)(478600001)(7416002)(2906002)(86362001)(31696002)(6486002)(6916009)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHRBNDd2amMyOFBiMWZNaVRIbW8rdkpUV2pqODM0enQ4TFczVmRtYnJ2TFdQ?=
 =?utf-8?B?RVVGYmowOUU1RXZzU1pnZFoyL3JMQzNBdnIwOHNXVk8vRXU4anlmc0pCV1JW?=
 =?utf-8?B?WENtQnNJeElHZ0F3NndHL2RFcUFLandQK1RRZEUrM0JMcUIwL0EzMWZ0MFNN?=
 =?utf-8?B?M2JVTWFYalJhekQrbXRoT0xpVG9tV2Iwd1dhVVFQNFpvK2NPWUwzWmFsY2di?=
 =?utf-8?B?QXVQWWFSMGRsT1VYdnBYV2F5Wm5NS2swam96SEZ1UWd0ajJ3VGtqbFkwalFq?=
 =?utf-8?B?Rkp2bGNXTDhQbzFsaWFBVGYvTDRDTUgzNHRaT1BTcUtURS9OOXNId3RpKy9G?=
 =?utf-8?B?NlArd1RZTDJCM3VxbGVyUVpBclRycVRiV1JjaDdicXBWY1h6YlZFV2prODJH?=
 =?utf-8?B?aTZHNVkwSFprcW1helNkT3RBNFZzVGhIVU53ZU5JeFdqcGRLWnFSVlJzeUY5?=
 =?utf-8?B?MTl5c0VlelVzYThBOGZlcE1SSTJXS3dhQ1l4WDBqWVdZdkNpTVBBdENnSklZ?=
 =?utf-8?B?WTYvaUtMUmlnRDlLMFcxWml0SGgva3dOSlh3MDJNRHMvZVlDSVorTzV6WjAw?=
 =?utf-8?B?T0xpS0o0TllpT3lHNG5pZXJQUXBvdWZHaUVVMmNUQVo1NjJGZGExZS9BZE5F?=
 =?utf-8?B?ZTMwZHBkVmJCWXhqL2Y3c2UwQ3N3cGxJTE5GMkhTaDZzazMvTWpKc3R1WG5C?=
 =?utf-8?B?K0ZjR1BoVWJLOEQ4OUNYc0hZVU9iNkk2OTlhS1h6Tm44ekpKbXhwdFg2eW1D?=
 =?utf-8?B?MGdhYzZ4QTRML0NuaVMrWkNQWGI3QzF3UWdaVktaMkpjb0pUdkdtWng5UWpy?=
 =?utf-8?B?Q1FJaW5qT0owamJmb0JBM2k5TjhZREVZOEwvZHZMajFrY1hWcmdjdU0rb21l?=
 =?utf-8?B?bldBOFVLWkViRjdPaFNCdmNFMVFuQ0pjb1Q5ZHVrajFzdklIZlBsSml3Tkc0?=
 =?utf-8?B?YkkwMVNpRSt0TVhkU25sbnd4TGJpVWJ0NHc0YzRsWGFMaG1wcmpwV0hRMk4v?=
 =?utf-8?B?UGtZMGRwL09CVVlwcCtZOXdJMFBXaGZ0cjlBOHNkVE5ZVit0Q1dqdThTbHo2?=
 =?utf-8?B?MElmK1Q4SFdnK0NTRHQ0REpnVUFSV1puWTlUeXFMaUJDZzFySzJPQy9HQjFI?=
 =?utf-8?B?aW5JcDRPK3liVjRyY2M5aDl6YlZsbTk1cTlmWGcvaUZLU0lmS3JZRVdxdmtT?=
 =?utf-8?B?YUhiNGFGbWJoVFdSNWsrWXF3ZTFVN051Z0tDaW5NSytFcnlVQzRsUWM1UzdB?=
 =?utf-8?B?eG9XNFQzaFVWR2hnZG5BcmJiSXUweFU0RXdhQTR0OXUxOWkraW4ydmpVZUNV?=
 =?utf-8?B?WUwzMnNLQkFuL3ppdnJkZHlseVdQdnpyVmFzT24yQVhXVm1xS0FkLzI0SHBs?=
 =?utf-8?B?aHNjcTB2dXZyWjVYTy9JV3RPVUZidXlORS9QdWRYUm4wMkk4TnpEOTl4YmRT?=
 =?utf-8?B?aUY5emtPZ2R2UTRYcGFBSDFhblRHc1I0MlJlZTVlWGNML21GWEVUeUh0bUFM?=
 =?utf-8?B?dVdkalZoYi9aUXV4V2xUOUpYRFhzM0U5TmppdkVKSFJlOEpWd2phajBFODBo?=
 =?utf-8?B?b0hNQlhRTk5pd1RkdVpKd0hCaTV3MmV3d1VoR2lLWG1TOEw1YUhmSy9uWll3?=
 =?utf-8?B?YjFyM2QvQzZTeHJ5bjZaZ0RZSFozaTRjWXBETlhWSHZxd1pFNGdnUEZSRlZp?=
 =?utf-8?B?KzBVV1ExSmR2UlEyNVU5MmpEL0VpOWR0R0Z4aGIxczI3cXBEU0RtYkRHTjVY?=
 =?utf-8?Q?tZOADkhwwwYjrGXdL0LFww/t6dp5om7NW1xZXIe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a95a59-c251-46b2-2fb9-08d931a1d99d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 15:09:06.1178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0VI/8uM13vRUNGAiCh+7kCfAWSSuT3CqMe5Uf4tpSXxezPMsre1IVBIQYfjQSjVDJHxNAMwHGV8lU0rAY3yR1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5741

On 17.06.2021 17:03, Anthony PERARD wrote:
> On Thu, Jun 17, 2021 at 10:03:50AM +0200, Jan Beulich wrote:
>> But it's not just XENMEM_maximum_gpfn that's affected; that's just the
>> one pointing out the underlying issue. Plus if so, shouldn't we avoid
>> returning values that are going to be truncated (and, as can be seen
>> here, then get perhaps recognized as error codes up the call chain)?
>>
>>> For now, I'd agree with trying to undo the change in OVMF.
>>
>> Anthony, thoughts?
> 
> I can map the shared_info page somewhere else, that fine. The hard part
> is figuring out where. I can probably map it just after the guest RAM
> (as described by the e820 from hvmloader or Xen).

Can't you put it (not necessarily immediately) next to the LAPIC
page, for example? Or the IO-APIC one? Or somewhere in that area,
which normally OSes won't use for placing BARs?

Jan


