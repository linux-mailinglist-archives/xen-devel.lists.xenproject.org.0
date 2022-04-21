Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CF050A064
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 15:09:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310134.526801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWYV-000138-Rw; Thu, 21 Apr 2022 13:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310134.526801; Thu, 21 Apr 2022 13:09:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWYV-00010M-Mr; Thu, 21 Apr 2022 13:09:07 +0000
Received: by outflank-mailman (input) for mailman id 310134;
 Thu, 21 Apr 2022 13:09:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhWYU-00010C-9n
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 13:09:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38a622b8-c174-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 15:09:05 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-lc5rgDzEPnStbxomq-J9Tg-1; Thu, 21 Apr 2022 15:09:04 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DU2PR04MB8693.eurprd04.prod.outlook.com (2603:10a6:10:2dc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 13:09:02 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 13:09:02 +0000
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
X-Inumbo-ID: 38a622b8-c174-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650546545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i62EqEUg1FfwSh0GvIbYWih43SAiLcTQYBloPkznT2E=;
	b=EcNOUcFty281qBIMl+Pa0wKGg9MCt2e+7F0Dhc13eOUlbtwybyNmcmlf4tj3zqGbzw0scL
	++xw6cHjZvb/amecKNb5JHxwhhuUwwkU28Ls7ZOUhOYHHa2JuTMH5ZiK/u+4Lnu+5GxYf1
	awxiKA6p98y/X/7/7S1ISYOBvOSHUA4=
X-MC-Unique: lc5rgDzEPnStbxomq-J9Tg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XtN0H0v6TMO9MkMGsIhcjRM3Lh5vsCyUQzZnxk342k7IW+tzsFeAko6g/90FqmLLWjPMPXFauG09rDBF7ZPmvlb+kgFpHrC2yQWp/k5uHbISOmIVdClKvMFhx7EQ1RQq346B1UzKwVyrSnlPMZbhDAGGAbuIQZmVGO0rnwCa9wpUe2b01kOEIKmfPT/F2eEp++EByEZ6DH6VSkdLu9obkjfGZ3lj5Nd9P5p0IgIs82Nc8WoJO9gKddDeTjwrv82I2IQSbIPsmWnt931X/Ra0wCI5QZlNUOwnH11zJxvDu8vQaDa9yDOsaRJJcpyVvI43pKDeF/RswYkDVFGc0D5KAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i62EqEUg1FfwSh0GvIbYWih43SAiLcTQYBloPkznT2E=;
 b=BEf/MG/9RnUWso7dhUA9qI9SLuz65l/QqoCdZU/LhhZDR4PWLcFnQ7eIq80/Mdv4k3ZSPoaRAL8BCxyDyD6hOaAvZ2vWuyl6J2GBQBNzMqOHTTmAKo34YJkY6WYQOc7l1e20vhXgYjEdsi+g+oYC5ALSdi3rnYX5r9BTLzuo61CkBLJE4qpZEILwnbu/98d0naWc0nLpNcLyqNeWZA2nXokJd/PinxfrWuh/ObYk9r1LOwXGjbxMmxP5xLyGqa1LQL6owrI+WOqbFqm5TCLI/CUGSr323M+GDhuGFAiGsE694Dz7XLXWopc17ZSGwfaKOFBBWMSI4A3Ma4GSe3Udzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b07b4f2c-b97c-5a33-4d50-d98903b18b25@suse.com>
Date: Thu, 21 Apr 2022 15:09:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 4/6] x86/gdbstub: Clean up includes
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220420141307.24153-1-andrew.cooper3@citrix.com>
 <20220420141307.24153-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220420141307.24153-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0028.eurprd03.prod.outlook.com
 (2603:10a6:206:14::41) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a76c5f4a-d713-4dbe-e8a1-08da23981af9
X-MS-TrafficTypeDiagnostic: DU2PR04MB8693:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB8693B7B52F2AED1E002B1566B3F49@DU2PR04MB8693.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OgzpumNYeGzedzPThTbLQRC13EJoC4R9NsxAtVfNPeMhbMvf5A9Wf2/ow2t5llt8xKm4B05+AXqFNsZXzgymEgJ48qRZC19R3p0jgDetVT3zNIMPLG53sKmXKZUuqN94k8fX7cz4EY7dm7+6kEW7qLdUEKJcwF7tTtCvVzUZVM6/Gd8R1jMLzpBpv4ShfmjzOPCcSL7ZwVWvir+Cf3MZAIRHwWBFJ3/dtYelQsScy2d8XUSfWZH4AzDByaf6yTxSXdHsP+VOb9tuwqewp1gG/k8/cPg9ugRHhFAgZerfLYkgz9aHcUpCm1I/6J/q1VN92L0zwJcSLGlL9MsGW/Dqk2Uso0gJZ1IIraYOcHt1p6sbrCmdfuWoV+QjFYQDBB966VTAUxYNHkFJZfTlLzPeRVJV6UpTbQPBvNhQFVthXtI72C576uWdgJMVdHPqu1FclnzEqRDaPr+VUgBhUFV74YK9jVLZnYHD7aw+V50MrSRHgqYCFCBo467REgy88AjD0pL1PcHJ0hdL5ues2eRtAF1XpBuW+auSXWRCqHYDRbnBZhYidDFGrZbERz/VmLPX/YucaAkbGntA86T7zYlgnXJqvu3MtJ/W12rOVYl4x97g/UMey/Dx7poG3twAp1UyY0lt3xuCZwk6+mfbhFMJhC/o88Ie0qZzCVYi/DJlc3JCKIQBIxGYqu15+UaE8ZgrgkyOND08lrIndX5/Gsh3akPogEdTj1q3zO06lRb3ivxL6iejOfHA2rP9kDEjMZFa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(38100700002)(26005)(508600001)(31696002)(54906003)(8936002)(86362001)(6916009)(316002)(66556008)(83380400001)(36756003)(186003)(4744005)(53546011)(31686004)(6506007)(66946007)(6512007)(2906002)(5660300002)(4326008)(2616005)(66476007)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEVtdnpHRm1Nc3BQV0ZmZ1JMTWpKWCtIcjBKS0hCQm4raHJEQUt0cUVKWExN?=
 =?utf-8?B?TXZVY3dDZmVYWXEwMGppdm4xdXVQeG5GclpVejhPbE4xWnlNY1I1b0RreS9m?=
 =?utf-8?B?Y2UvcDIzQzNycnIzU0M5SkNOWUhVVitad3R2dmhsam9mRkZ6a0M0V2ZrL0E5?=
 =?utf-8?B?N3BBU1BBOFBEM29qb2tQQU9YNmdBa0RweWdHV2FoUWhMTjZXWS9VaXU0UXZB?=
 =?utf-8?B?K2taOXdhZ2piUnppN21kOXg2L0pjSVIwSnpCMHVpdU9kTEJvZXVsNzV4NldN?=
 =?utf-8?B?Q2kxcEkvWXZhV3UxOEQwYXo2L2VYWmdBK2dRd1VoekpPSURJVmlYdGpPWjho?=
 =?utf-8?B?bHEvdDVtODIrUlE1UFJZUkROcFpLS29tTk1lc0t1T3NubWhhbC9Ld0NUbEow?=
 =?utf-8?B?bzNXQUVYUkRhNmM3LzNpOEJXWnBsdTA1QkV2Rjh5MWhLZjRHSzYyRXJBUTRK?=
 =?utf-8?B?QUZjaFhWU3RnVWtaK2tUQU1iYlplVFJSc0l0UXJoemQxQ0IyamdzcS83YUpo?=
 =?utf-8?B?K2JHaFgxOUNuVERWOVh6ekwyRjM1RllWL1EyZlVRejEwY2xkUnpmTjJPeVk3?=
 =?utf-8?B?TVZLK3FRbmR1YzZOR2wzcStzRzFrNzdndnovaTZ2RytXaTI3akJMMnZWQkZZ?=
 =?utf-8?B?eGl4OHhQeEVKd1dhMTFTdm1QNjFXU0E4bUlRSUd1dTF0ZnVNb3QxMWhaTlcx?=
 =?utf-8?B?Q0kzeFUzZW00OGtsSFlRTnRhSGVpWGRTcTF5Z0Y5SFVtMlA3cHhaV3hHQ0gx?=
 =?utf-8?B?c3pRNmcwaG9HS2tzQUNNSXpudUxjeVFRZzRINFJtdmtod3E5MDJnc3pKenNU?=
 =?utf-8?B?Z0NkZXpzOWQ1QWRLNTREU3Q1VDJkY2N4MmNjVEVIWjdCY1VYZWtSeDEwaElu?=
 =?utf-8?B?cXVNSU5CRXJMNW1ET2hIKzU3S1RYSlArU0VzbzZyR21YeC9tWEJxdU56Z0F3?=
 =?utf-8?B?YTBJaGk1RUZDdG9tUUs5Z0E0Qzk5SDVNdjhoUUpxNXRUR1ZWMFdaS28yTDRy?=
 =?utf-8?B?ME9QbmllRlZQRXNQTHV1aUh0aFAvY1dIblphVnVIY2NvZ3ZCRktiQWhrekJI?=
 =?utf-8?B?THBaMVdmWnBBN0FUVU5xcUNKck1RSUY1OG5QMTU3NFdIWEIzaE9BMmFDaWhB?=
 =?utf-8?B?THkrR3NqMU9KWWovWDZHU1g3eWlla2QxOFJHdHlzVWhCT2RTV1dMNXIzb0Fr?=
 =?utf-8?B?dVluMS95MmgwL0NlTnNSQnQ1UnlaL0tQU1FyVWNQcHdzRE9iQnMrWTBtMUZ2?=
 =?utf-8?B?djU4S3VmWGs0ellxcW9rQ0pjUG1ZdTJNU2FtS1BMcWVWdG9nblRoVjlvbldu?=
 =?utf-8?B?UEJTOGUrT05JVStmRGxMYjV2Ym51c0t2cDhRRU0xU3JaRDFVM0lWVlhDY0Vz?=
 =?utf-8?B?aHFGeXc4c3h6UXFSVzFNbmlWUHVIR2RhaDZEZlZKZUsxVW1hajhLRmZJeWhS?=
 =?utf-8?B?OTVoRjl3QmhvelRUU0IyM2M1YVRrRGg1ZHZqamhzK2FtNGU3aGtjRUNhd0tR?=
 =?utf-8?B?MkZtUlZYL2JQQnhQcDBQeFpucTBRbzc4VmtMdWtiMjZ3SFg2MlBHZlUxbHdu?=
 =?utf-8?B?OWJOMkdJNyt4RXYwUHlRUlZaWWxRZEtVK2JYV0pwbHBGSEZhWHhOQlRhZHlw?=
 =?utf-8?B?YTgyWXJIdnpMeFhVSWFLaU9lU2N4ZUs1MlZYZ21JMGpZQkhKY1J1VzIrRS9D?=
 =?utf-8?B?WnRnanlqM092cGszc0FBZTh6RXZQSFBMRzRqNmNmZHI2dTlmcThmYS9iaUZZ?=
 =?utf-8?B?VG0ya2JjekFKSEpWZE1lbDBjRVA5Uk0zaDdWUS93djZpY0prY3h5MkhrMUFF?=
 =?utf-8?B?SitkRFVBRmwrSkhvdlNoTko0MnhISEVaNHdhbFR5ODB1RFlqN1NUQzZzMHVR?=
 =?utf-8?B?Tk1OT2VRWnFjVStoN3RrV2dJMG9QdlVLWVByNlp2ZjBVR0xOYks1RlpOSnNV?=
 =?utf-8?B?ZjR4OU5xUVdjOENHYVhIV0RYOTBydjNzQlBTMkxsc2lEc1lTWTBUTjhqTXF5?=
 =?utf-8?B?RG02anNxVDFGTFhUREphVlJyYm5OUWMxZXIxdEk3QW5tNWhsSVhqTjBGZUNi?=
 =?utf-8?B?WU11b05JZEgyd3dDSmVDTzMvR0Y3bGtXQndDdC9leU5SNXlrV0xnM2JuTXFP?=
 =?utf-8?B?aEVERzBhVGxLeU82cWJndkE5QUExVzF1UVIvZTVnbFZWaXZhdEpZeWJ6MzND?=
 =?utf-8?B?M0xHa2w3Vy9jdmdFOU1WT1g3azlHbmZIRWp5ZlMxVkI2U1RMSmlTOU8reFov?=
 =?utf-8?B?alBHM3lBVERrWjVScHQ4MkMybkZLUGh6Z2JWQlUyV1lDVG51ZnQ1WU9wVDZD?=
 =?utf-8?B?VTlCUFBMZ0JaYVRyTEN2ZVpHUmU3eGZubGk1eVNzVU5HbUxsNGhmdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a76c5f4a-d713-4dbe-e8a1-08da23981af9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 13:09:02.2943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wSNN38idKrouEFFhiDDhMzrkja8HxmdiUrWTnQhQpzKB/WMwXncXMeV4KESmRmKxO3L1vZ+C/RttUUWlYcVsVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8693

On 20.04.2022 16:13, Andrew Cooper wrote:
> common/gdbstub.c wants struct gdb_context but only gets it transitively
> through asm/debugger.h.  None of */gdbstub.c should include asm/debugger.h so
> include xen/gdbstub.h instead.
> 
> Forward declare struct cpu_user_regs in xen/gdbstub.h so it doesn't depend on
> the include order to compile.
> 
> x86/setup.c doesn't need xen/gdbstub.h at all, so drop it.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


